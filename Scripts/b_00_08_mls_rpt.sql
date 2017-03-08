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