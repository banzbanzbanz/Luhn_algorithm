DELIMITER $$

DROP FUNCTION IF EXISTS `MySQLverifyLuhn` $$
CREATE DEFINER=`root`@`localhost` FUNCTION `MySQLverifyLuhn`(CardNumber VARCHAR(32)) RETURNS varchar(32) CHARSET latin1
BEGIN
    DECLARE size, weight, sum, x  INT;

    IF (CardNumber IS NULL) THEN
    RETURN NULL;
    END IF;

    SET weight = 1;
    SET sum = 0;
    SET size = length(CardNumber);

    WHILE size > 0 DO
        SET x = substring(CardNumber, size, 1) * weight;
        SET sum = sum + IF(x > 9, x - 9, x);
        SET size = size - 1;
        SET weight = 3 - weight;
    END WHILE;

    IF (sum % 10 = 0) THEN

        IF CardNumber LIKE '34_%' OR CardNumber LIKE '37_%' THEN RETURN 'American Express';

        ELSEIF

        CardNumber LIKE '51_%' OR
        CardNumber LIKE '52_%' OR
        CardNumber LIKE '53_%' OR
        CardNumber LIKE '54_%' OR
        CardNumber LIKE '55_%' THEN RETURN 'MasterCard';

        ELSEIF CardNumber LIKE '4%' THEN RETURN 'Visa';

        ELSE RETURN 'VALID';

      END IF;

    ELSE
        RETURN 'INVALID';
    END IF;
END $$

DELIMITER ;