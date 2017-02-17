CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `mlsuser`@`%` 
    SQL SECURITY DEFINER
VIEW `v_room_incr` AS
    SELECT 
        `mls`.`MLS_ID` AS `MLS_ID`,
        `prop`.`BEDS` AS `BEDS`,
        `prop`.`FULL_BATHS` AS `FULL_BATHS`,
        `prop`.`PART_BATHS` AS `PART_BATHS`
    FROM
        (`incr_mls_id_stg` `mls`
        JOIN `property_stg` `prop` ON ((`mls`.`MLS_ID` = `prop`.`MLS_ID`)))
    WHERE
        ((`prop`.`BEDS` IS NOT NULL)
            OR (`prop`.`FULL_BATHS` IS NOT NULL)
            OR (`prop`.`PART_BATHS` IS NOT NULL))