CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `mlsuser`@`%` 
    SQL SECURITY DEFINER
VIEW `v_area_ids` AS
    SELECT 
        `stg`.`MLS_ID` AS `MLS_ID`,
        `zip`.`AREA_ID` AS `AREA_ID`,
        `stg`.`ZIPCODE` AS `ZIPCODE`,
        `stg`.`CITY` AS `CITY`
    FROM
        (`property_stg` `stg`
        LEFT JOIN (`zipcode` `zip`
        JOIN `city` ON ((`zip`.`CITY_ID` = `city`.`CITY_ID`))) ON (((`stg`.`ZIPCODE` = `zip`.`ZIPCODE`)
            AND (LOWER(F_CITY_MAP(`stg`.`CITY`)) = LOWER(`city`.`NAME`)))))