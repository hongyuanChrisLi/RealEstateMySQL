SELECT 
    fact.MLS_ID,
    fact.ADDR,
    fact.PROP_TYPE_ID,
    price.LIST_PRICE,
    MAX(price.LIST_DATE),
    size.STRUCT_SQFT,
    CASE size.LOT_SIZE_UNIT
        WHEN 'acres' THEN IFNULL(size.LOT_SIZE, 0) * 43560
        ELSE IFNULL(size.LOT_SIZE, 0)
    END AS LOT_SQFT
FROM
    mls_prop_fact fact
        JOIN
    mls_price_dim price ON fact.PRICE_SK = price.PRICE_SK
        JOIN
    mls_size_dim size ON fact.MLS_ID = size.MLS_ID
WHERE
    area_id = 30
        AND price.LIST_DATE <= STR_TO_DATE('02/20/2017', '%m/%d/%Y')
GROUP BY MLS_ID;






SELECT 
    PROP_TYPE_ID,
    ROUND(AVG(LIST_PRICE / STRUCT_SQFT), 2)sp_mls_prop_dim_upd AVG_PRICE_STRUCT_SQFT,
    ROUND(AVG(LIST_PRICE / (STRUCT_SQFT + LOT_SQFT)),
            2) AVG_PRICE_ALL_SQFT
FROM
    (SELECT 
        fact.MLS_ID,
            fact.ADDR,
            fact.PROP_TYPE_ID,
            price.LIST_PRICE,
            MAX(price.LIST_DATE),
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
        area_id = 30
            AND price.LIST_DATE <= STR_TO_DATE('02/20/2017', '%m/%d/%Y')
    GROUP BY MLS_ID) res
GROUP BY PROP_TYPE_ID;