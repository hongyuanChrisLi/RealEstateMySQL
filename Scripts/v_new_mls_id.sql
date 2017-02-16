CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_new_mls_ids` AS
    SELECT 
        `stg`.`MLS_ID` AS `MLS_ID`
    FROM
        (`property_stg` `stg`
        LEFT JOIN `property_fact` `fact` ON ((`stg`.`MLS_ID` = `fact`.`MLS_ID`)))
    WHERE
        ISNULL(`fact`.`MLS_ID`)