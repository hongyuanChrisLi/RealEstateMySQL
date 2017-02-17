CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `mlsuser`@`%` 
    SQL SECURITY DEFINER
VIEW `mls`.`v_property_fact_incr` AS
    SELECT 
        `stg`.`MLS_ID` AS `MLS_ID`,
        `area`.`AREA_ID` AS `AREA_ID`,
        `stg`.`ADDR` AS `ADDR`,
        `stg`.`YEAR_BUILT` AS `YEAR_BUILT`,
        `stg`.`URL` AS `URL`
    FROM
        ((`mls`.`property_stg` `stg`
        JOIN `mls`.`v_stg_mls_ids_diff` `mls` ON ((`stg`.`MLS_ID` = `mls`.`MLS_ID`)))
        JOIN `mls`.`v_area_ids` `area` ON ((`stg`.`MLS_ID` = `area`.`MLS_ID`)))
    WHERE
        (`area`.`AREA_ID` IS NOT NULL)