-- San Mateo County: ID 2

INSERT INTO city (NAME, COUNTY_ID)
VALUES ('Woodside', 2);

-- Woodside City ID 77 
INSERT INTO zipcode(ZIPCODE, CITY_ID)
VALUES('94027', 77);

INSERT INTO zipcode(ZIPCODE, CITY_ID)
VALUES('94028', 77 );

INSERT INTO zipcode(ZIPCODE, CITY_ID)
VALUES('94061', 77);

INSERT INTO zipcode(ZIPCODE, CITY_ID)
VALUES('94062', 77);


-- Monterey County ID 4
INSERT INTO city (NAME, COUNTY_ID)
VALUES ('Royal Oaks', 4);


-- Royal Oaks ID 78
INSERT INTO zipcode(ZIPCODE, CITY_ID)
VALUES('95076', 78);


-- TYPE LKUP
INSERT INTO prop_type_lkp(TYPE_ID, TYPE)
VALUES(1, 'Single Family');
INSERT INTO prop_type_lkp(TYPE_ID, TYPE)
VALUES(2, 'Townhouse');
INSERT INTO prop_type_lkp(TYPE_ID, TYPE)
VALUES(3, 'Condo');
INSERT INTO prop_type_lkp(TYPE_ID, TYPE)
VALUES(4, 'Multi-Unit');
INSERT INTO prop_type_lkp(TYPE_ID, TYPE)
VALUES(5, 'Mobile');
INSERT INTO prop_type_lkp(TYPE_ID, TYPE)
VALUES(6, 'Land / Lot');
INSERT INTO prop_type_lkp(TYPE_ID, TYPE)
VALUES(7, 'Rent');
INSERT INTO prop_type_lkp(TYPE_ID, TYPE)
VALUES(8, 'Commercial');

