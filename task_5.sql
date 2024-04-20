USE pandemic;

DROP FUNCTION IF EXISTS calculate_years_since;

DELIMITER //

CREATE FUNCTION calculate_years_since(year INT)
RETURNS int
DETERMINISTIC
NO SQL
BEGIN
	DECLARE result INT;
    SET result = TIMESTAMPDIFF(YEAR, MAKEDATE(year, 1), CURDATE());
    RETURN result;
END //

DELIMITER ;

SELECT calculate_years_since(1996);
    