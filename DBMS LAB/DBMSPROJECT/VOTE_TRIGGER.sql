#Trigger to check the precinct entered is right
DELIMITER $$

CREATE TRIGGER triggervoter
BEFORE 
INSERT ON Voter_Info 
FOR EACH ROW BEGIN
    IF (NEW.precinctid NOT IN (select precinctid from precinct)) THEN 
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: NO SUCH PRECIENT EXISTS';
    END IF;
END$$

DELIMITER ;
