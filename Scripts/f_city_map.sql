CREATE DEFINER=`mlsuser`@`%` FUNCTION `f_city_map`(city_name VARCHAR(20)) RETURNS varchar(20) CHARSET utf8
BEGIN

	DECLARE map_name VARCHAR(20);
    
    IF lower(city_name) LIKE "carmel%" THEN
		SET map_name = 'Carmel';
	ELSE 
		SET map_name = city_name;
	END IF;
    
RETURN (map_name);
END