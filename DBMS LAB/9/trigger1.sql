DELIMITER $$
CREATE TRIGGER after_insert_Compartment1
AFTER INSERT
ON compartment FOR EACH ROW
BEGIN
DECLARE error_msg VARCHAR(255);
DECLARE c1 INT;
SET error_msg = ('Number of compartments is greater than four');
SET c1 = (SELECT COUNT(compartment_no) FROM compartment WHERE train_number = new.train_number GROUP BY train_number);
IF c1 > 4 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = error_msg;
END IF;
END $$
DELIMITER ;
