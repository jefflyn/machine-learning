create table future_basics
(
	code varchar(6) not null comment '代码'
		primary key,
	name varchar(15) null comment '名称',
	symbol varchar(18) not null comment 'sina code',
	low decimal(10,2) not null comment '最低价',
	high decimal(10,2) not null comment '最高价',
	amount int not null comment '每手单位数',
	unit varchar(3) not null comment '单位',
	`limit` tinyint not null comment '涨跌幅限制%',
	margin_rate tinyint default 10 null comment '保证金率',
	goods_type varchar(6) not null comment ' 商品类型（1=能源化工,2=黑色金属,3=贵金属,4=有色金属,5=农产品,6=金融板块）',
	night tinyint default 0 null comment '是否支持夜盘（0=否，1=是）',
	exchange varchar(10) not null comment '所属交易所',
	on_target tinyint default 0 null comment '0=否 1=是',
	alert_price varchar(64) null comment '提醒价格',
	alert_change varchar(20) null comment '提醒涨跌幅',
	alert_on tinyint null comment '提醒设置（0=关，1=开）',
	alert_mobile varchar(18) null comment '接收提醒手机号',
	deleted tinyint default 0 null comment '删除（不关注）1=删除'
)
comment 'future基本信息';

create index idx_future_basics_name
	on future_basics (name);

create index idx_future_basics_symbol
	on future_basics (symbol);

INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('A', '豆一(黄大豆1号)', 'A2101', 4347.00, 5245.00, 10, '吨', 7, 14, 2, 3.000000, 3.000000, '油脂油料', 1, '大连商品交易所', 0, null, '', null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('AG', '白银', 'AG2101', 2916.00, 6888.00, 15, '千克', 10, 19, 1, 0.000075, 0.000150, '贵金属', 1, '上海期货交易所', 1, '-5000,6000', '-9,-6,-3,-2,2,4,6,9', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('AL', '铝', 'AL0', 14650.00, 14910.00, 5, '吨', 8, 16, 2, 4.500000, 4.500000, '有色金属', 1, '上海期货交易所', 0, null, '', null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('AP', '苹果', 'AP2101', 6999.00, 9729.00, 10, '吨', 6, 14, 2, 7.500000, 30.000000, '农产品', 0, '郑州商品交易所', 1, '-7000,7120', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('AU', '黄金', 'AU2012', 402.02, 410.68, 1000, '克', 6, 14, 2, 15.000000, 15.000000, '贵金属', 1, '上海期货交易所', 0, null, '', null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('B', '豆二(黄大豆2号)', 'B2101', 3685.00, 3880.00, 10, '吨', 7, 15, 2, 3.000000, 3.000000, '油脂油料', 1, '大连商品交易所', 0, null, '', null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('BB', '胶合板(细木工板)', 'BB0', 0.00, 0.00, 500, '张', 13, 43, null, null, null, '化工', 0, '大连商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('BU', '沥青', 'BU2101', 2130.00, 2506.00, 10, '吨', 8, 17, 1, 0.000150, 0.000150, '化工', 0, '上海期货交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('C', '玉米', 'C2101', 2536.00, 2629.00, 10, '吨', 7, 12, 2, 1.800000, 1.800000, '农产品', 1, '大连商品交易所', 0, '', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('CF', '棉花', 'CF2101', 11000.00, 15405.00, 5, '吨', 6, 13, 2, 6.450000, 6.450000, '农产品', 1, '郑州商品交易所', 1, '', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('CJ', '红枣', 'CJ2101', 9680.00, 10250.00, 10, '吨', 7, 13, 2, 4.500000, 0.000000, '农产品', 1, '郑州商品交易所', 0, null, '-6,-3,-2,2,4,6', null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('CS', '玉米淀粉', 'CS2101', 2830.00, 2973.00, 10, '吨', 7, 14, null, null, null, '农产品', 1, '大连商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('CU', '铜', 'CU0', 51140.00, 52500.00, 5, '吨', 8, 17, 1, 0.000075, 0.000075, '有色金属', 1, '上海期货交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('CY', '棉纱', 'CY0', 0.00, 0.00, 10, '吨', 7, 13, null, null, null, '农产品', 1, '郑州商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('EB', '苯乙烯', 'EB0', 4338.00, 8216.00, 5, '吨', 11, 18, 2, 4.500000, 4.500000, '化工', 1, '大连商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('EG', '乙二醇', 'EG2101', 3661.00, 4006.00, 10, '吨', 9, 18, 2, 4.500000, 4.500000, '化工', 1, '大连商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('FB', '纤维板', 'FB0', 0.00, 0.00, 10, '立方米', 5, 15, null, null, null, '化工', 0, '大连商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('FG', '玻璃', 'FG2101', 1161.00, 1884.00, 20, '吨', 7, 12, 2, 2.250000, 2.250000, '化工', 1, '郑州商品交易所', 1, '-1700,1800', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('FU', '燃料油', 'FU2101', 1667.00, 1962.00, 10, '吨', 10, 17, 1, 0.000075, 0.000075, '能源', 1, '上海期货交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('HC', '热轧卷板', 'HC0', 3716.00, 3934.00, 10, '吨', 6, 14, 1, 0.000150, 0.000150, '黑色金属', 1, '上海期货交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('I', '铁矿石', 'I0', 769.50, 804.00, 100, '吨', 10, 18, 1, 0.000150, 0.000150, '黑色金属', 1, '大连商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('IC', '中证500指数', 'IC0', 0.00, 0.00, 1, '指数点', 10, 14, null, null, null, '金融板块', 0, '中国金融期货交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('IF', '沪深300指数', 'IF0', 0.00, 0.00, 1, '指数点', 10, 12, null, null, null, '金融板块', 0, '中国金融期货交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('IH', '上证50股指期货', 'IH0', 0.00, 0.00, 300, '指数点', 10, 12, null, null, null, '金融板块', 0, '中国金融期货交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('J', '焦炭', 'J0', 2078.50, 2420.00, 100, '吨', 8, 16, 1, 0.000090, 0.000180, '煤炭', 1, '大连商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('JD', '鸡蛋', 'JD2101', 3784.00, 4119.00, 10, '吨', 7, 13, 1, 0.000225, 0.000225, '农产品', 0, '大连商品交易所', 0, '', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('JM', '焦煤', 'JM0', 1276.00, 1371.50, 60, '吨', 8, 16, 1, 0.000090, 0.000180, '煤炭', 1, '大连商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('JR', '粳稻谷', 'JR0', 0.00, 0.00, 10, '吨', 7, 11, null, null, null, '农产品', 1, '郑州商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('L', '塑料(聚乙烯)', 'L2101', 7130.00, 7545.00, 5, '吨', 9, 17, 2, 3.000000, 3.000000, '化工', 1, '大连商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('LR', '晚籼稻', 'LR0', 0.00, 0.00, 10, '吨', 7, 11, null, null, null, '农产品', 1, '郑州商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('LU', '低硫燃料油', 'LU0', 1667.00, 2337.00, 10, '吨', 10, 17, 2, 3.000000, 3.000000, '能源', 1, '上海国际能源交易中心', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('M', '豆粕', 'M2101', 3173.00, 3313.00, 10, '吨', 7, 13, 2, 2.250000, 2.250000, '油脂油料', 1, '大连商品交易所', 0, null, '-6,-3,-2,2,4,6', null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('MA', '甲醇', 'MA2101', 1710.00, 3525.00, 10, '吨', 6, 14, 2, 3.000000, 9.000000, '化工', 1, '郑州商品交易所', 0, '', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('NI', '镍', 'NI0', 115600.00, 122180.00, 1, '吨', 8, 17, 2, 9.000000, 9.000000, '有色金属', 1, '上海期货交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('NR', '20号胶', 'NR2101', 9390.00, 12105.00, 10, '吨', 6, 16, 2, 4.500000, 4.500000, '化工', 0, '上海国际能源交易中心', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('OI', '菜油', 'OI2101', 6383.00, 9923.00, 10, '吨', 5, 11, 2, 3.000000, 3.000000, '油脂油料', 1, '郑州商品交易所', 1, '-9700,9890', '-4,-3,-2,2,4', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('P', '棕榈油', 'P2101', 4414.00, 6608.00, 10, '吨', 8, 15, 2, 3.800000, 3.800000, '油脂油料', 1, '大连商品交易所', 1, '-6060,6620', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('PB', '铅', 'PB0', 14230.00, 14535.00, 5, '吨', 8, 16, 1, 0.000060, 0.000060, '有色金属', 1, '上海期货交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('PF', '短纤', 'PF2105', 5750.00, 6618.00, 5, '吨', 4, 15, 2, 4.500000, 4.500000, '化工', 1, '郑州商品交易所', 1, '-5800,6110', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('PG', '液化石油气', 'PG0', 3690.00, 3787.00, 20, '吨', 10, 20, 2, 9.000000, 9.000000, '能源', 1, '大连商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('PM', '普通小麦', 'PM0', 0.00, 0.00, 50, '吨', 5, 11, null, null, null, '农产品', 0, '郑州商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('PP', '聚丙烯(PP)', 'PP2101', 7733.00, 8196.00, 5, '吨', 9, 16, 1, 0.000090, 0.000450, '化工', 1, '大连商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('RB', '螺纹钢', 'RB0', 3591.00, 3790.00, 10, '吨', 6, 14, 1, 0.000150, 0.000150, '黑色金属', 1, '上海期货交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('RI', '早籼稻', 'RI0', 0.00, 0.00, 10, '吨', 7, 11, null, null, null, '农产品', 1, '郑州商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('RM', '菜粕(菜籽粕）', 'RM0', 2430.00, 2583.00, 10, '吨', 7, 11, 2, 2.250000, 2.250000, '油脂油料', 1, '郑州商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('RR', '粳米', 'RR0', 0.00, 0.00, 10, '吨', 5, 12, null, null, null, '农产品', 1, '大连商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('RS', '菜籽(油菜籽)', 'RS0', 0.00, 0.00, 10, '吨', 7, 25, null, null, null, '农产品', 1, '郑州商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('RU', '天然橡胶', 'RU2101', 10660.00, 16535.00, 10, '吨', 6, 16, 2, 4.500000, 4.500000, '化工', 1, '上海期货交易所', 1, '-14065,15660', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('SA', '纯碱', 'SA2101', 1436.00, 1822.00, 20, '吨', 4, 12, 2, 5.250000, 5.250000, '化工', 1, '郑州商品交易所', 1, '-1545,1600', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('SC', '上海原油', 'SC0', 227.70, 365.90, 1000, '桶', 10, 17, 2, 30.000000, 30.000000, '能源', 1, '上海国际能源交易中心', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('SF', '硅铁', 'SF0', 5826.00, 6044.00, 5, '吨', 6, 13, 2, 4.500000, 4.500000, '黑色金属', 0, '郑州商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('SM', '锰硅', 'SM0', 6040.00, 6272.00, 5, '吨', 6, 13, 2, 4.500000, 4.500000, '黑色金属', 0, '郑州商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('SN', '锡', 'SN0', 144810.00, 148120.00, 1, '吨', 8, 16, 2, 4.500000, 4.500000, '有色金属', 1, '上海期货交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('SP', '纸浆', 'SP2101', 4612.00, 4780.00, 10, '吨', 5, 13, 1, 0.000075, 0.000075, '化工', 1, '上海期货交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('SR', '白糖', 'SR2101', 5085.00, 5398.00, 10, '吨', 7, 13, 2, 4.500000, 4.500000, '农产品', 1, '郑州商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('SS', '不锈钢', 'SS0', 0.00, 0.00, 5, '吨', 6, 15, null, null, null, '黑色金属', 1, '上海期货交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('T', '10年期国债', 'T0', 0.00, 0.00, 1, '指数点', 10, 100, null, null, null, '金融板块', 0, '中国金融期货交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('TA', 'PTA(精对苯二甲酸)', 'TA2101', 3226.00, 8062.00, 5, '吨', 5, 13, 2, 4.500000, 4.500000, '化工', 1, '郑州商品交易所', 1, '-3200,3380', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('TF', '5年期国债', 'TF0', 0.00, 0.00, 1, '指数点', 10, 100, null, null, null, '金融板块', 0, '中国金融期货交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('TS', '2年期国债', 'TS0', 0.00, 0.00, 1, '指数点', 10, 100, null, null, null, '金融板块', 0, '中国金融期货交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('UR', '尿素', 'UR2101', 1597.00, 1740.00, 20, '吨', 4, 11, 2, 7.500000, 7.500000, '化工', 0, '郑州商品交易所', 0, '', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('V', 'PVC(聚氯乙烯)', 'V2101', 6645.00, 7230.00, 5, '吨', 8, 16, 2, 3.000000, 3.000000, '化工', 1, '大连商品交易所', 0, null, null, null, null, 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('WH', '强麦(优质强筋小麦)', 'WH0', 0.00, 0.00, 10, '吨', 7, 12, null, null, null, '农产品', 1, '郑州商品交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('WR', '线材', 'WR0', 0.00, 0.00, 10, '吨', 10, 15, null, null, null, '金融板块', 0, '上海期货交易所', 0, null, null, null, null, 1);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('Y', '豆油', 'Y2101', 5342.00, 7574.00, 10, '吨', 7, 13, 2, 3.800000, 3.800000, '油脂油料', 1, '大连商品交易所', 1, '-5350,7580', '-6,-3,-2,2,4,6', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('ZC', '动力煤', 'ZC2101', 482.20, 607.20, 100, '吨', 4, 11, 2, 4.500000, 4.500000, '煤炭', 1, '郑州商品交易所', 0, '', '-5,-3,3,5', 1, '18507550586', 0);
INSERT INTO stocks.future_basics (code, name, symbol, low, high, amount, unit, `limit`, margin, fee_type, fee, lqd_fee, goods_type, night, exchange, target, alert_price, alert_change, alert_on, alert_mobile, deleted) VALUES ('ZN', '沪锌', 'ZN0', 18990.00, 20035.00, 5, '吨', 8, 16, 2, 4.500000, 4.500000, '有色金属', 1, '上海期货交易所', 0, null, null, null, null, 0);