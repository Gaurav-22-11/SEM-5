DELIMITER $$
CREATE OR REPLACE TRIGGER prevent_insert
  BEFORE INSERT ON donor
  FOR EACH ROW
BEGIN
  IF NEW.d_locality="Banashankari" THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Area is not servicable';
  END IF;
END $$
DELIMITER ;
