ALTER DATABASE pandemic CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE pandemic.infectious_cases CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;

USE pandemic;

DROP TABLE IF EXISTS cases;
DROP TABLE IF EXISTS regions;

CREATE TABLE regions (
id INT PRIMARY KEY AUTO_INCREMENT,
region_name VARCHAR(45),
region_code VARCHAR(8)
);

CREATE TABLE cases (
id INT PRIMARY KEY AUTO_INCREMENT, 
region_id INT, 
year INT, 
number_yaws TEXT, 
polio_cases INT, 
cases_guinea_worm INT, 
number_rabies TEXT, 
number_malaria TEXT, 
number_hiv TEXT, 
number_tuberculosis TEXT, 
number_smallpox TEXT, 
number_cholera_cases TEXT,
FOREIGN KEY (region_id) REFERENCES regions(id)
);

INSERT INTO regions (region_name, region_code)
SELECT `Entity`, `Code`
FROM infectious_cases 
GROUP BY Entity, Code;

INSERT INTO cases (region_id, 
					year, 
					number_yaws, 
					polio_cases, 
					cases_guinea_worm, 
					number_rabies, 
					number_malaria, 
					number_hiv, 
					number_tuberculosis, 
					number_smallpox, 
					number_cholera_cases)
SELECT 
	(SELECT id FROM regions WHERE infectious_cases.Entity = regions.region_name) AS region_id,
	Year, 
    Number_yaws, 
    polio_cases, 
    cases_guinea_worm, 
    Number_rabies, 
    Number_malaria, 
	Number_hiv, 
	Number_tuberculosis, 
	Number_smallpox, 
	Number_cholera_cases 
FROM infectious_cases;

SELECT * FROM cases;
