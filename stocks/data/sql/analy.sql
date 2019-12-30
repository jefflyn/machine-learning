
select distinct code from hist_trade_day where trade_date>='2019-10-01' and high=low and pct_change>0;
select code, count(1) from hist_trade_day where trade_date>='2019-10-01' and high=low and pct_change>0
group by code
having count(1) > 2;

select * from hist_trade_day where code=601865;
# 验证每天trade data etl
select trade_date, count(1) from hist_trade_day where trade_date >= '2019-12-01' group by trade_date order by trade_date desc;
select trade_date, count(1) from hist_index_day where trade_date >= '2019-12-01' group by trade_date order by trade_date desc;
-- daily market data
select l.*, i.hz, i.sz50, i.scz, i.zxb, i.cyb
from
(select trade_date, count(case when close >= round(pre_close * 1.1, 2) then 1 else null end) as limitup,
       count(case when close <= round(pre_close * 0.9, 2) then 1 else null end) as limitdown,
       count(1) as total,
       count(case when pct_change > 0 then 1 else null end) as up,
       count(case when pct_change = 0 then 1 else null end) as flat,
       count(case when pct_change < 0 then 1 else null end) as down
from hist_trade_day
where trade_date >= '2019-12-01'
group by trade_date) as l
left join
    (select trade_date,
       sum(case ts_code when '000001.SH' then pct_change else 0 end) 'hz',
       sum(case ts_code when '000016.SH' then pct_change else 0 end) 'sz50',
       sum(case ts_code when '399001.SZ' then pct_change else 0 end) 'scz',
       sum(case ts_code when '399005.SZ' then pct_change else 0 end) 'zxb',
       sum(case ts_code when '399006.SZ' then pct_change else 0 end) 'cyb'
      from hist_index_day where trade_date >= '2019-06-01' group by trade_date) as i
on l.trade_date = i.trade_date
order by l.trade_date desc;

-- hist weekly data
select * from hist_weekly order by trade_date desc;
select * from hist_weekly where code=600126 order by trade_date desc limit 2;



-- ma data
select count(distinct ts_code) from hist_ma_day;
select distinct ts_code from hist_ma_day order by ts_code;
select * from hist_ma_day order by rank, ts_code;
select rank, count(distinct ts_code) from hist_ma_day group by rank;

-- basic info
select count(1) from basic;
select min(list_date), max(list_date) from basic;
select * from basic where list_date = (select min(list_date) from basic);
select * from basic where name like '%远程%';
select * from basic order by list_date desc;
select count(1) from basic_daily;
select * from basic_daily where pe is null;
select * from basic_daily where code='002692';

-- index hist data
select distinct ts_code from hist_index_day;
select count(1) from hist_index_day;
-- 000001.SH 000016.SH 000300.SH 000905.SH
-- 399001.SZ 399005.SZ 399006.SZ 399008.SZ
select * from hist_index_day where trade_date between '2019-07-01' and '2019-08-30' order by trade_date desc;
select * from hist_index_day where code='000001' and trade_date='2019-08-28' order by trade_date desc;

select trade_date,
       sum(case ts_code when '000001.SH' then pct_change else 0 end) 'hz',
       sum(case ts_code when '000016.SH' then pct_change else 0 end) 'sz50',
       sum(case ts_code when '399001.SZ' then pct_change else 0 end) 'scz',
       sum(case ts_code when '399005.SZ' then pct_change else 0 end) 'zxb',
       sum(case ts_code when '399006.SZ' then pct_change else 0 end) 'cyb'
from hist_index_day
where trade_date >= '2019-01-01'
group by trade_date
order by trade_date desc;

select ts_code, substr(trade_date, 1 ,7) as month, sum(pct_change) as total
from hist_index_day
where trade_date >= '2018-01-01' and ts_code='000001.SH'
group by ts_code, substr(trade_date, 1 ,7);

-- limitup data
select * from hist_trade_day where trade_date='2019-04-12' and close >= round(pre_close * 1.1, 2);

INSERT INTO limitup_stat (`code`,`period_type`,`period`,`times`)
select substr(ts_code, 1, 6) as code, 'm', '2019-03', count(1)
from hist_trade_day
where trade_date >= '2019-03-01' and trade_date <= '2019-03-31'  and close = round(pre_close * 1.1, 2)
group by ts_code
order by count(1) desc;

-- hist trade data
select count(1) from hist_trade_day;
select * from hist_trade_day where code='002895' order by trade_date desc;
select b.name, b.industry, h.* from hist_trade_day h inner join basic b on h.code = b.code
where trade_date='2019-05-10' and pct_change > 9.9
order by b.industry;

select * from hist_trade_day where code in ('600126', '002895')
and trade_date = (select 1 from hist_trade_day t2 where t1.trade_date > t2.trade_date)

select b.code, b.name, b.industry, sum(pct_change) as total
from hist_trade_day h left join basic b on h.ts_code = b.ts_code
where h.trade_date > '2019-01-01'
group by h.ts_code, b.name
order by total desc;

select code, count(1) from hist_trade_day where trade_date >= '2019-03-01' and pct_change > 5
group by code order by count(1) desc;

select min(low), max(high) from hist_trade_day where code='002796';

select b.code, b.name, b.industry, sum(h.pct_change) as total_sum
from basic b inner join hist_trade_day h on b.ts_code = h.ts_code
where h.trade_date between '2019-03-04' and '2019-03-31'
group by b.code,b.ts_code
order by total_sum desc;

select b.ts_code, b.name,b.area,b.industry,b.list_date, s.total_sum
from basic b inner join
(select ts_code, sum(pct_change) as total_sum from hist_trade_day where trade_date between '2019-01-01' and '2019-01-31'
group by ts_code) as s
on b.ts_code = s.ts_code
order by s.total_sum desc;

select count(1) from hist_trade_day where trade_date='2019-01-29';

select * from hist_trade_day where code='002895' order by trade_date desc;
select avg(close), avg(high), avg(low) from hist_trade_day
where ts_code='002895.SZ' and trade_date >= '2019-01-21' ;

-- forcast
select * from profit_forecast where code='002895';

select * from hist_trade_day h inner join basic b on h.ts_code = b.ts_code
where h.trade_date >='2018-01-01' and h.close = round(h.pre_close * 1.1, 2);

-- concept
select * from basic where code in
(select distinct d.code from concept c inner join concept_detail d
  on c.code = d.concept_code
where c.name like '磷化工');
select * from concept order by convert(name using gbk) asc;
select * from concept where name like '%一带一路%';
select count(1) from concept_detail;
select * from concept_detail where concept_code='TS14';

select distinct d.code, c.name from concept c inner join concept_detail d
  on c.code = d.concept_code
where c.name like '%化工%';

-- industry temp table
drop table IF EXISTS temp_industry;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_industry
select h.*, b.name, b.industry from hist_trade_day h join basic b on h.ts_code = b.ts_code
where h.trade_date='2019-04-08' and h.pct_change > 6
order by h.pct_change desc;

-- concept temp table
drop table IF EXISTS temp_concept;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_concept
select h.*, cd.name, c.name as concept from hist_trade_day h
  join concept_detail cd on h.ts_code = cd.ts_code
  join concept c on cd.concept_code = c.code
where h.trade_date='2019-04-08' and h.pct_change > 8
order by h.pct_change desc;

select trade_date, industry, count(1) from temp_industry group by trade_date, industry order by count(1) desc;
select trade_date, concept, count(1) from temp_concept group by trade_date, concept having count(1) > 3 order by count(1) desc;
select * from temp_industry where industry='化工原料';
select * from temp_concept;

select * from basic where code='000820';
-- my pool
select * from my_stock_pool;
select * from monitor_pool;

INSERT INTO stocks.my_stock_pool (alias, code, concept, platform, cost, bottom, share, is_hold, grade, hold_date, close_date, remark)
VALUES ('银星能源', '000862', '电力', 'cf', 6.87, 9.89, 4400, 1, 'a', current_date(), null, null);

select concat(round(sum(DATA_LENGTH/1024/1024),2),'M')
from information_schema.tables where table_schema='stocks' and table_name='select_wave_all';
select * from basic where name like '%ST%';

-- forecast preview
select * from profit_forecast;
select * from profit_forecast where code='002895';
select * from profit_forecast where type = '预盈' and name like '%ST%';
select * from profit_forecast where type in ('预增', '预盈', '预升') and range_from > 100;

-- up gap in a week
select * from hist_trade_day where trade_date >= '2019-05-07';
select * from hist_trade_day where code='002889' order by trade_date desc;
delete from hist_trade_day where code in (000713);
select 1 from hist_index_day where ts_code='000001.SH' and trade_date='20190531';

select a.*
from hist_trade_day a inner join (select code, max(trade_date) last_date from hist_trade_day group by code) b
         on a.code=b.code and a.trade_date = b.last_date
where a.code in('600126', '002895');

select * from hist_weekly where code='000958' order by trade_date desc limit 20;
select * from hist_monthly where code=000958;

select * from weekly_gap where gap > 0 order by gap desc;

select b.code,b.name,sc.province,sc.city,b.list_date
from basic b inner join stock_company sc on b.ts_code = sc.ts_code
where sc.province like '%佛山%' or sc.city like '%佛山%';

select b.ts_code, b.code
from basic b inner join stock_company sc on b.ts_code = sc.ts_code
where sc.province like '%佛山%' or sc.city like '%佛山%';

select * from stock_company where ts_code='002898.SZ';

select * from basic_daily;
select * from concept where name like '%垃圾%';
insert into concepts
select cd.code, GROUP_CONCAT(c.name) as concepts from concept_detail cd inner join concept c on cd.concept_code=c.code
# where cd.name like '%精准%'
group by code;
select * from hist_weekly where code='601607' order by trade_date desc limit 2;
select * from hist_index_day where code='000001' and
                                   trade_date in('2016-09-02','2016-09-05','2016-09-06',
                                                 '2017-07-06','2017-07-07','2017-07-10',
                                                 '2018-11-29','2018-11-30','2018-12-03');

select * from wave_data_2019 where `change` >= 100 order by end desc;
select * from wave_data_2019 where code = 002118;

select * from monitor_pool;
select * from my_stock_pool;
select * from my_stock_pool where platform = 'cf';
select * from my_stock_pool where platform = 'df';
select * from my_stock_pool where platform = 'pa';

select * from hist_weekly where code='600876'