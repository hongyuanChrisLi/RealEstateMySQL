CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `mls`.`v_stg_mls_ids_diff` AS
    SELECT 
        `stg`.`MLS_ID` AS `MLS_ID`
    FROM
        (`mls`.`property_stg` `stg`
        LEFT JOIN `mls`.`property_fact` `fact` ON ((`stg`.`MLS_ID` = `fact`.`MLS_ID`)))
    WHERE
        ISNULL(`fact`.`MLS_ID`)