insert into prop_addr_hist_incr(PROP_ADDR_ID, EVENT_DATE, EVENT_ID, PRICE, PRICE_SQFT)
select PROP_ADDR_ID, EVENT_DATE, EVENT_ID, PRICE, PRICE_SQFT FROM prop_addr_hist_bkp
ORDER BY PROP_ADDR_ID, EVENT_DATE, EVENT_ID;


select * from prop_addr_hist
order by HIST_SK desc;

update prop_addr_hist
set EVENT_ID = 1
WHERE HIST_SK = 1



desc prop_addr_hist_incr;

select * from v_prop_addr_hist_error_id_date;

select * from prop_addr_hist_rej_stg;

INSERT INTO prop_addr_hist_rej_stg (PROP_ADDR_ID, EVENT_DATE, EVENT, PRICE, PRICE_SQFT)
SELECT 
    stg.PROP_ADDR_ID,
    stg.EVENT_DATE,
    stg.EVENT,
    stg.PRICE,
    stg.PRICE_SQFT
FROM
    prop_addr_hist_stg stg
        JOIN
    v_prop_addr_hist_error_id_date v ON v.PROP_ADDR_ID = stg.PROP_ADDR_ID
        AND v.EVENT_DATE = stg.EVENT_DATE;

start transaction;

DELETE stg FROM prop_addr_hist_stg stg
        JOIN 
    v_prop_addr_hist_error_id_date err ON stg.PROP_ADDR_ID = err.PROP_ADDR_ID
        AND stg.EVENT_DATE = err.EVENT_DATE;
        
commit;
select * from prop_addr_hist_rej_stg;

rollback;

select * from v_prop_addr_hist_error_id_date;


INSERT INTO prop_addr_hist (PROP_ADDR_ID, EVENT_DATE, EVENT_ID, PRICE, PRICE_SQFT)
SELECT rand_incr.PROP_ADDR_ID, rand_incr.EVENT_DATE, rand_incr.EVENT_ID, rand_incr.PRICE, rand_incr.PRICE_SQFT FROM
(
SELECT 
    PROP_ADDR_ID,
    EVENT_DATE,
    EVENT_ID,
    PRICE, 
    PRICE_SQFT,
    @rank:=CASE
        WHEN @addr_id <> PROP_ADDR_ID OR @event_date <> EVENT_DATE THEN 1
        ELSE @rank + 1
    END AS RANK,
    @addr_id:=PROP_ADDR_ID AS AI,
    @event_date := EVENT_DATE AS ED
FROM
    (SELECT @rank:= -1) r,
    (SELECT @addr_id:= -1) ai,
    (SELECT @event_date:= -1) ed,
    (SELECT 
        PROP_ADDR_ID,EVENT_DATE, EVENT_ID, PRICE, PRICE_SQFT
    FROM
        prop_addr_hist_incr incr
    ORDER BY PROP_ADDR_ID , EVENT_DATE, EVENT_ID DESC, PRICE DESC) t ) rand_incr
WHERE rand_incr.RANK = 1
ORDER BY rand_incr.PROP_ADDR_ID, rand_incr.EVENT_DATE
ON DUPLICATE KEY UPDATE
prop_addr_hist.PRICE = IF(  prop_addr_hist.EVENT_ID <> 4 and rand_incr.EVENT_ID = 4, rand_incr.PRICE, prop_addr_hist.PRICE), 
prop_addr_hist.PRICE_SQFT = IF(  prop_addr_hist.EVENT_ID <> 4 and rand_incr.EVENT_ID = 4, rand_incr.PRICE_SQFT, prop_addr_hist.PRICE_SQFT), 
prop_addr_hist.EVENT_ID = IF(  prop_addr_hist.EVENT_ID <> 4 and rand_incr.EVENT_ID = 4, rand_incr.EVENT_ID, prop_addr_hist.EVENT_ID)
;

select * from prop_addr_hist;

select HIST_SK, PROP_ADDR_ID, MAX(EVENT_DATE) FROM prop_addr_hist
GROUP BY PROP_ADDR_ID;

select * from prop_addr_fact;

start transaction;

UPDATE prop_addr_fact fact
	JOIN
    (SELECT 
        hist.HIST_SK, hist.PROP_ADDR_ID
		FROM
			prop_addr_hist hist
			JOIN (SELECT 
					PROP_ADDR_ID, MAX(EVENT_DATE) LATEST_DATE
					FROM prop_addr_hist
					GROUP BY PROP_ADDR_ID) hd 
				ON hist.PROP_ADDR_ID = hd.PROP_ADDR_ID
					AND hist.EVENT_DATE = hd.LATEST_DATE) hist 
		ON fact.PROP_ADDR_ID = hist.PROP_ADDR_ID 
	JOIN 
	(SELECT DISTINCT PROP_ADDR_ID
		FROM prop_addr_hist_incr) incr
		ON incr.PROP_ADDR_ID = hist.PROP_ADDR_ID
SET 
    fact.LATEST_EVENT_SK = hist.HIST_SK; 

commit;

SELECT * FROM prop_addr_hist where HIST_SK = 1

rollback;


SELECT hist.HIST_SK, hist.PROP_ADDR_ID
	FROM prop_addr_hist hist
		JOIN (
			SELECT PROP_ADDR_ID, MAX(EVENT_DATE) LATEST_DATE 
				FROM prop_addr_hist
                GROUP BY PROP_ADDR_ID) hd
			ON hist.PROP_ADDR_ID = hd.PROP_ADDR_ID
				AND hist.EVENT_DATE = hd.LATEST_DATE


select distinct PROP_ADDR_ID FROM prop_addr_hist_incr;


