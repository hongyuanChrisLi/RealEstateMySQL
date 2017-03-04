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

INSERT INTO prop_addr_hist (PROP_ADDR_ID, EVENT_DATE, EVENT_ID, PRICE, PRICE_SQFT)
SELECT PROP_ADDR_ID, EVENT_DATE, lkp.EVENT_ID, MAX(PRICE) PRICE, PRICE_SQFT
from prop_addr_hist_stg stg JOIN
event_type_lkp lkp ON stg.EVENT = lkp.EVENT
GROUP BY PROP_ADDR_ID, EVENT_DATE, lkp.EVENT_ID
ORDER BY PROP_ADDR_ID, EVENT_DATE desc;

select * from prop_addr_hist;

SELECT count(*) FROM prop_addr_fact where IS_UPDATED = 0;

select EVENT_DATE from prop_addr_hist
WHERE PROP_ADDR_ID = 80
order by EVENT_DATE desc

select count(*) from prop_addr_hist_stg



