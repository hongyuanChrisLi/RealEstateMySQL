SELECT RPT_DATE,
	ROUND(SUM(AVG_PRICE_STRUCT_SQFT * TOT_NUM) / SUM(TOT_NUM), 2) AVG_PRICE_STRUCT_SQFT,
	ROUND(SUM(AVG_PRICE_TOT_SQFT * TOT_NUM) / SUM(TOT_NUM), 2) AVG_PRICE_TOT_SQFT
	FROM mls_price_rpt
		WHERE CITY = 'Sunnyvale'
		GROUP BY RPT_DATE;


SELECT RPT_DATE,
	ROUND(SUM(AVG_PRICE_STRUCT_SQFT * TOT_NUM) / SUM(TOT_NUM), 2) AVG_PRICE_STRUCT_SQFT,
	ROUND(SUM(AVG_PRICE_TOT_SQFT * TOT_NUM) / SUM(TOT_NUM), 2) AVG_PRICE_TOT_SQFT
	FROM mls_price_rpt
		WHERE CITY = 'Sunnyvale'
		GROUP BY RPT_DATE;


SELECT v.* FROM 
(select @city_name:='Mountain View') parm, 
v_rpt_city_price v;


select v.* from 
(select @zipcode:='94086', @prop_type:=1) parm, 
v_rpt_zipcode_type_price v


select * from mls_prop_incr;


delete from mls_price_rpt where RPT_DATE = str_to_date('2017-03-08', '%Y-%m-%d');


SELECT * FROM prop_addr_hist;
SELECT * FROM prop_addr_fact;


SELECT * FROM mls_price_rpt;

SELECT STATUS_DATE, COUNT(*) FROM mls_status_dim
WHERE STATUS_EVENT_ID = 4
GROUP BY STATUS_DATE;

desc mls_status_dim;


start transaction;

UPDATE mls_status_dim
SET STATUS_DATE = str_to_date('2017-03-10', '%Y-%m-%d')
WHERE STATUS_DATE = str_to_date('2017-03-12', '%Y-%m-%d')
AND STATUS_EVENT_ID = 4
LIMIT 40;

rollback;

commit;

SELECT COUNT(*) FROM mls_status_dim
WHERE STATUS_DATE = str_to_date('2017-03-12', '%Y-%m-%d')

delete FROM prop_addr_hist_rej_stg;

SELECT * FROM prop_addr_hist where PROP_ADDR_ID = 4740
ORDER BY EVENT_DATE DESC;


INSERT INTO prop_addr_hist(PROP_ADDR_ID, EVENT_DATE, EVENT_ID, PRICE, PRICE_SQFT)
SELECT PROP_ADDR_ID, EVENT_DATE, 1, PRICE, PRICE_SQFT FROM prop_addr_hist_rej_stg
 WHERE EVENT = 'Price Changed';
 
 
 SELECT * FROM vv_err_hist_price;
 
 desc mls_price_rpt;
 
 
 SELECT * FROM mls_size_dim where MLS_ID = 'CRMC17048485'
 
 delete from mls_status_dim
 where MLS_ID = 'CRMC17048485';
 
 desc county;
 
 
 select max(city_id) from city;
 
 SELECT * FROM prop_addr_price_month_rpt;
 
 
 truncate table prop_addr_price_month_rpt;
 
 
 call sp_prop_addr_price_day_rpt_stg('2016-05-27');
 
 