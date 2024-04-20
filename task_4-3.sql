USE pandemic;

SELECT 
	Entity, 
	Year,
	TIMESTAMPDIFF(YEAR, MAKEDATE(Year,1), CURDATE()) AS years_since
FROM infectious_cases;