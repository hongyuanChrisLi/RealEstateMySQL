CREATE VIEW `v_mls_url_incr` AS
    SELECT 
        `mls`.`MLS_ID`, `prop`.`URL`
    FROM
        `property_stg` AS `prop`
            INNER JOIN
        `incr_mls_id_stg` AS `mls` ON `prop`.`MLS_ID` = `mls`.`MLS_ID`