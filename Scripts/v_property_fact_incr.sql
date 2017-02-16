CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `mlsuser`@`%` 
    SQL SECURITY DEFINER
VIEW `v_property_fact_incr` AS
    SELECT 
        `stg`.`MLS_ID` AS `MLS_ID`,
        `area`.`AREA_ID` AS `AREA_ID`,
        `stg`.`ADDR` AS `ADDR`,
        `stg`.`YEAR_BUILT` AS `YEAR_BUILT`,
        `stg`.`URL` AS `URL`
    FROM
        ((`property_stg` `stg`
        JOIN `v_new_mls_ids` `mls` ON ((`stg`.`MLS_ID` = `mls`.`MLS_ID`)))
        JOIN `v_area_ids` `area` ON ((`stg`.`MLS_ID` = `area`.`MLS_ID`)))
    WHERE
        (`area`.`AREA_ID` IS NOT NULL)