from stocks.util import display

import tushare as ts

if __name__ == '__main__':
    # stock.fundamental
    # stock_basics = ts.get_stock_basics()
    # print('check get_stock_basics:', stock_basics)
    # get_report_data,
    # get_profit_data,
    # get_operation_data,
    # print(ts.get_growth_data(2019, 4))

    # get_debtpaying_data, get_cashflow_data,
    # get_balance_sheet, get_profit_statement, get_cash_flow)

    # stock.trading
    # print(ts.get_hist_data(code='600373', start='2020-01-01', end=None, ktype='D'))
    # print(ts.get_tick_data())
    # print(ts.get_today_all())
    # print(ts.get_realtime_quotes())
    # print(ts.get_h_data(code='600848', start='2020-01-01', end='2020-03-01', autype='qfq', index=False))
    # print(ts.get_today_ticks())
    print(ts.get_index())
    # print(ts.get_hists())
    print(ts.get_k_data(code='000001', start='2020-01-01', end='', ktype='D', autype='qfq', index=True))

    get_day_all = ts.get_day_all(date='2020-02-07')
    print('check get_day_all:', get_day_all)
    # print(ts.get_sina_dd(code='600373'))
    # print(ts.bar())
    # print(ts.tick())
    # print(ts.get_markets())
    # print(ts.quotes())
    # print(ts.get_instrument())
    # print(ts.reset_instrument())

    # stock.classifying
    # print(ts.get_industry_classified())
    # print(ts.get_concept_classified())
    # print(ts.get_area_classified())
    # print(ts.get_gem_classified())
    # print(ts.get_sme_classified())
    # print(ts.get_st_classified())
    # print(ts.get_hs300s())
    # print(ts.get_sz50s())
    # print(ts.get_zz500s())
    # print(ts.get_terminated())
    # print(ts.get_suspended())



    # stock.reference
    # print(ts.moneyflow_hsgt())

