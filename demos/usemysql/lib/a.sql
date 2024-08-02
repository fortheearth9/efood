DROP PROCEDURE IF EXISTS InsertTableInfo;

SET @category_id = (SELECT `id` FROM `table_categories` WHERE `category_id` = 'DT' LIMIT 1);

DELIMITER $$

CREATE PROCEDURE InsertTableInfo()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 20 DO
        IF i <> 4 AND i <> 7 THEN
            INSERT INTO `tables` (`name`, `elegant_name`, `capacity`, `category_id`) 
            VALUES (CONCAT('桌台', i), CONCAT('优雅桌台', i), 4, `DT`);
        END IF;
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

CALL InsertTableInfo();

DROP PROCEDURE IF EXISTS InsertTableInfo;