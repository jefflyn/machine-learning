import pandas as pd

from stocks.data import data_util
from stocks.gene import wave
from stocks.util import date_util
from stocks.util import db_util
from stocks.util.db_util import get_db


def update_latest_limit_up_stat():
    '''
    实时指定日期涨停信息
    :return:
    '''
    target_date = date_util.get_this_year_start()
    limit_up_stat_df = get_limit_up_stat(start=target_date)
    if limit_up_stat_df is not None:
        basics = data_util.get_basics()
        # 建立数据库连接
        db = get_db()
        # 使用cursor()方法创建一个游标对象
        cursor = db.cursor()
        codes = set(limit_up_stat_df['code'])
        if len(codes) == 0:
            print('>>> failed', target_date, 'no limit up stat found')
        else:
            for index, row in limit_up_stat_df.iterrows():
                code = row['code']
                fire_date = row['fire_date']
                late_date = row['late_date']
                basic = basics[basics.code == code]
                hist_trade = data_util.get_hist_trade(code=code, start=fire_date)[['trade_date', 'low', 'close']]
                try:
                    industry = basic.loc[code, 'industry']
                    fire_price = round(float(hist_trade.head(1).iloc[0, 1]), 2)
                    price = round(float(hist_trade.tail(1).iloc[0, 2]), 2)
                    wave_df = wave.get_wave(codes=code, start=fire_date)
                    if wave_df.empty:
                        wave_str = 10
                        wave_a = 10
                        wave_b = 0
                    else:
                        wave_str = wave.wave_to_str(wave_df)
                        wave_ab = wave.get_wave_ab_fast(wave_str, pct_limit=20)
                        wave_a = round(float(wave_ab[0][0]), 2)
                        wave_b = round(float(wave_ab[1][0]), 2)

                    insert_value = [(fire_date, late_date, code, row['name'], industry, fire_price, price,
                                     row['combo'], row['total'], wave_a, wave_b, str(wave_str).split('\n')[0], date_util.now())]
                    cursor.execute("delete from limit_up_stat where code='" + code + "'")
                    cursor.executemany(
                        'insert into limit_up_stat(fire_date, late_date, code, name, industry, fire_price, price, combo, '
                        'count, wave_a, wave_b, wave_str, create_time) '
                        'values(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', insert_value)
                    db.commit()
                    print(fire_date, code, 'Update limit up stat successfully.')
                except Exception as err:
                    print('  >>>update_latest_limit_up_stat error:', code, err)
                    db.rollback()
        # 关闭游标和数据库的连接
        cursor.close()
        db.close()


def collect_limit_up_stat(target_date):
    '''
    采集指定日期涨停信息
    :param target_date: YYYY-MM-DD
    :return:
    '''
    trade_date = date_util.get_latest_trade_date(1)[0]
    if target_date is None or target_date > trade_date:
        target_date = trade_date
    if date_util.is_tradeday(target_date) is False:
        target_date = date_util.get_next_trade_day(target_date)
    while True:
        print(target_date, 'Collect limit up stat start ...')
        limit_up_df = data_util.get_hist_trade(start=target_date, end=target_date, is_limit=True)

        if limit_up_df is not None:
            codes = list(limit_up_df['code'])
            limit_up_count = get_limit_up_times(code_list=codes, target_date=target_date)
            if limit_up_count is None:
                break
            limit_up_count_codes = list(limit_up_count['code'])
            insert_values = []
            for index, row in limit_up_df.iterrows():
                code = row['code']
                combo_times = 1
                if code in limit_up_count_codes:
                    index = limit_up_count_codes.index(code)
                    combo_times = limit_up_count.loc[index, 'combo']
                else:
                    print(code, 'limit up not found in hist data, trade date', target_date)

                close_change = round(row['pct_change'], 2)
                open = row['open']
                pre_close = row['pre_close']
                open_change = round((open - pre_close) / pre_close * 100, 2)
                insert_values.append((target_date, code, '', open_change, close_change, int(combo_times)))
            total_size = len(insert_values)
            # 建立数据库连接
            db = get_db()
            # 使用cursor()方法创建一个游标对象
            cursor = db.cursor()
            try:
                # 注意这里使用的是executemany而不是execute，下边有对executemany的详细说明
                insert_count = cursor.executemany(
                    'insert into limit_up_daily(trade_date, code, name, open_change, close_change, combo) '
                    'values(%s, %s, %s, %s, %s, %s)', insert_values)
                cursor.execute("update limit_up_daily d inner join basics b on d.code = b.code "
                               "set d.name = b.name, d.area = b.area, d.industry = b.industry "
                               "where d.industry is null or d.industry='' "
                               "or d.name is null or d.name=''")
                db.commit()
                print(target_date, 'Collect limit up daily finished! Total size: '
                      + str(total_size) + ' , ' + str(insert_count) + ' insert successfully.')
            except Exception as err:
                print('  >>>error:', err)
                db.rollback()
            # 关闭游标和数据库的连接
            cursor.close()
            db.close()

        next_trade_date = date_util.get_next_trade_day(target_date)
        if next_trade_date > date_util.get_today():
            break
        target_date = next_trade_date


def get_limit_up_times(code_list, target_date=None):
    '''
    获取指定日期连续涨停次数
    :param code_list:
    :param target_date:
    :return: ['trade_date', 'code', 'combo_times']
    '''
    if len(code_list) == 0:
        return None
    if date_util.is_tradeday(target_date) is False:
        target_date = date_util.get_next_trade_day(target_date)
    start_date = date_util.shift_date(type='m', from_date=target_date, n=-1)
    limit_up_trade_data = data_util.get_hist_trade(code=code_list, start=start_date, end=target_date, is_limit=True)

    limit_group_df = limit_up_trade_data.groupby(limit_up_trade_data['code'])
    data_list = []
    for code, group in limit_group_df:
        curt_data = [target_date, code]
        up_limit_dates = list(group['trade_date'])
        total = len(up_limit_dates)
        continue_count = 1
        if total < 2:
            curt_data.append(continue_count)
        else:
            curt_trade_date = up_limit_dates[total - 1]
            for i in range(total):
                pre_trade_date = date_util.get_previous_trade_day(curt_trade_date)
                pre_limit_date = up_limit_dates[total - (i + 2)]
                if pre_trade_date == pre_limit_date:
                    continue_count += 1
                    curt_trade_date = pre_limit_date
                    continue
                curt_data.append(continue_count)
                break
        data_list.append(curt_data)

    result_df = pd.DataFrame(data_list, columns=['trade_date', 'code', 'combo'])
    return result_df


def get_limit_up_stat(start=None, end=None):
    where_sql = ' where 1=1 '

    if start is not None:
        where_sql += 'and trade_date >=:start '
    if end is not None:
        where_sql += 'and trade_date <=:end '
    sql = 'select code, name, min(trade_date) fire_date, max(trade_date) late_date, max(combo) combo, count(1) total ' \
          'from limit_up_daily' + where_sql \
          + ' group by code, name '

    params = {'start': start, 'end': end}
    df = db_util.read_sql(sql, params=params)
    return df


if __name__ == '__main__':
    # get_limit_up_times(code_list=['000716', '002105', '600513'], target_date='2020-01-01')
    # collect_limit_up_stat(target_date='2020-02-20')

    collect_limit_up_stat(target_date=date_util.get_this_week_start())
    update_latest_limit_up_stat()
