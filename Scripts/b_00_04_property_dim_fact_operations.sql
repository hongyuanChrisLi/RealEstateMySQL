SELECT 
    -- MLS_ID,
    -- ADDR,
    PROP_TYPE_ID,
    -- LIST_PRICE,
    -- LIST_DATE,
    ROUND(AVG(LIST_PRICE / STRUCT_SQFT), 2) AVG_PRICE_STRUCT_SQFT,
    ROUND(AVG(LIST_PRICE / (STRUCT_SQFT + LOT_SQFT)), 2) AVG_PRICE_ALL_SQFT
FROM
    (SELECT 
        fact.MLS_ID,
            fact.ADDR,
            fact.PROP_TYPE_ID,
            price.LIST_PRICE,
            price.LIST_DATE,
            size.STRUCT_SQFT,
            CASE size.LOT_SIZE_UNIT
                WHEN 'acres' THEN IFNULL(size.LOT_SIZE, 0) * 43560
                ELSE IFNULL(size.LOT_SIZE, 0)
            END AS LOT_SQFT
    FROM
        mls_prop_fact fact
    JOIN mls_price_dim price ON fact.PRICE_SK = price.PRICE_SK
    JOIN mls_size_dim size ON fact.MLS_ID = size.MLS_ID
    WHERE
        area_id = 30) res
GROUP BY PROP_TYPE_ID;


select * from mls_price_dim;


select * from zipcode where zipcode = '94086'

select distinct LOT_SIZE_UNIT FROM mls_size_dim;

select * from prop_type_lkp;


select count(*) from prop_addr_fact where IS_UPDATED = 0;

select count(*) from prop_addr_hist_stg

select * from mls_prop_fact;

select count(*) from mls_prop_incr;

select dim.MLS_ID, ACTIVE_DATE, PENDING_DATE from mls_status_dim dim
JOIN v_mls_fact_m_stg v on v.MLS_ID = dim.MLS_ID;


start transaction;


UPDATE mls_status_dim stat
        JOIN
    v_mls_fact_m_stg v ON v.MLS_ID = stat.MLS_ID 
SET 
    PENDING_DATE = CURDATE()
WHERE
    ISNULL(stat.PENDING_DATE);

commit;

UPDATE mls_status_dim stat
        JOIN
    v_mls_stg_i_fact v ON v.MLS_ID = stat.MLS_ID 
SET 
    PENDING_DATE = NULL
WHERE
    stat.PENDING_DATE IS NOT NULL;
    


select * from mls_status_dim;


select count(*) from prop_addr_incr
where REALTOR_URL IS NOT NULL