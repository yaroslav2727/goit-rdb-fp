USE pandemic;

SELECT 
	Entity, 
	Year, 
	CURDATE() AS today
FROM infectious_cases;