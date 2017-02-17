CREATE DEFINER=`mlsuser`@`%` PROCEDURE `sp_property_fact_load`()
BEGIN

DELETE FROM incr_mls_id_stg;

INSERT INTO incr_mls_id_stg(MLS_ID)
SELECT MLS_ID FROM v_property_fact_incr;

INSERT INTO property_fact (MLS_ID, AREA_ID, ADDR, YEAR_BUILT, URL)
SELECT MLS_ID, AREA_ID, ADDR, YEAR_BUILT, URL FROM v_property_fact_incr;

INSERT INTO room_dim(MLS_ID, BEDS, FULL_BATHS, PART_BATHS)
SELECT MLS_ID, BEDS, FULL_BATHS, PART_BATHS from v_room_incr;


END