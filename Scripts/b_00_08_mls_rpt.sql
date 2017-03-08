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