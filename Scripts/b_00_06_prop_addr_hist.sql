SELECT * FROM prop_addr_hist_stg where PROP_ADDR_ID = 3438
order by EVENT_DATE desc;

SELECT *  FROM mls_prop_fact where PROP_ADDR_ID = 1062;
select * from prop_addr_fact where PROP_ADDR_ID = 1062;

select PROP_ADDR_ID, EVENT_DATE, MAX(PRICE) / MIN(PRICE) ratio
FROM prop_addr_hist_stg
group by PROP_ADDR_ID, EVENT_DATE
HAVING ratio > 2.0;
 
SELECT PROP_ADDR_ID, MAX(PRICE / PRICE_SQFT) / MIN(PRICE / PRICE_SQFT) ratio
FROM prop_addr_hist_stg
group by PROP_ADDR_ID
HAVING ratio > 5;


select * from prop_addr_hist_stg;
