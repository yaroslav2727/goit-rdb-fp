USE pandemic;

SELECT 
	region_id, 
	AVG(number_rabies) AS avg, 
	MIN(number_rabies) AS min, 
	MAX(number_rabies) AS max, 
	SUM(number_rabies) AS sum
FROM cases
WHERE number_rabies IS NOT NULL AND number_rabies <> ''
GROUP BY region_id
ORDER BY avg DESC
LIMIT 10;