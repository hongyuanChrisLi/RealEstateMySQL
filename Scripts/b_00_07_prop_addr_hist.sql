select count(*) from mls_status_dim
where PENDING_DATE IS NOT NULL;

SELECT 
stat.MLS_ID,


FROM mls_status_dim stat
JOIN 
mls_prop_fact mls_fact ON stat.MLS_ID = mls_fact.MLS_ID
LEFT OUTER JOIN
( select PROP_ADDR_ID, EVENT
	prop_addr_hist hist ON mls_fact.PROP_ADDR_ID = hist.PROP_ADDR_ID
    
    
select hist.PROP_ADDR_ID, hist.EVENT_DATE,
FROM  prop_addr_hist hist
JOIN 
event_type_lkp etype ON hist.EVENT_ID = etype.EVENT_ID
GROUP BY hist.PROP_ADDR_ID, etype.EVENT 
ORDER BY hist.PROP_ADDR_ID, hist.EVENT_ID desc;

Create table ranked_prop_addr_hist
as
SELECT 
	HIST_SK,
    PROP_ADDR_ID,
    EVENT_DATE,
    EVENT,
    @rank:=CASE
        WHEN @addr_id <> PROP_ADDR_ID THEN 1
        ELSE @rank + 1
    END AS RANK,
    @addr_id:=PROP_ADDR_ID AS ADDR_ID
FROM
    (SELECT @rank:=- 1) r,
    (SELECT @addr_id:=- 1) ai,
    (SELECT 
        hist.HIST_SK, PROP_ADDR_ID, hist.EVENT_DATE, lkp.EVENT
    FROM
        prop_addr_hist hist
        LEFT OUTER JOIN 
        event_type_lkp lkp ON hist.EVENT_ID = lkp.EVENT_ID
    ORDER BY hist.PROP_ADDR_ID , hist.EVENT_DATE DESC , hist.EVENT_ID DESC) t;

select PROP_ADDR_ID, EVENT_DATE, EVENT_ID
from prop_addr_hist
order by PROP_ADDR_ID, EVENT_DATE desc , EVENT_ID desc;


SELECT 
stat.MLS_ID,
stat.PENDING_DATE,
rhist.EVENT LATEST_EVENT,
rhist.EVENT_DATE
FROM mls_status_dim stat
JOIN 
mls_prop_fact mls_fact ON stat.MLS_ID = mls_fact.MLS_ID
JOIN
( select hist.PROP_ADDR_ID, hist.EVENT, hist.EVENT_DATE
	FROM ranked_prop_addr_hist hist 
	WHERE hist.RANK = 1 ) rhist 
    ON mls_fact.PROP_ADDR_ID = rhist.PROP_ADDR_ID
WHERE PENDING_DATE IS NOT NULL
AND rhist.EVENT = 'Sold';
    

    
select * from ranked_prop_addr_hist;

SELECT sold.PROP_ADDR_ID, sold.EVENT_DATE
FROM (
SELECT PROP_ADDR_ID, EVENT_DATE from prop_addr_hist
WHERE EVENT_ID = 4 ) sold
JOIN 
(
select PROP_ADDR_ID, EVENT_DATE from prop_addr_hist
where EVENT_ID != 4 ) other
ON sold.PROP_ADDR_ID = other.PROP_ADDR_ID
AND sold.EVENT_DATE = other.EVENT_DATE;

SELECT * FROM prop_addr_hist where PROP_ADDR_ID = 859

select * from prop_addr_fact
order by prop_addr_id desc;
