USE pandemic;

SELECT 
	Entity, 
	Year, 
	MAKEDATE(Year,1) AS year_jan_1st
FROM infectious_cases;