DELIMITER $$
CREATE OR REPLACE FUNCTION health(disease VARCHAR(50))
RETURNS VARCHAR(4)
DETERMINISTIC
BEGIN
 DECLARE msg varchar(4);
 IF disease = "NIL" OR disease = "Nil" THEN
   SET msg = "Good";
 ELSE
   SET msg ="Fair";
 END IF;
 RETURN msg;
END; $$ 
DELIMITER ;

SELECT d_name, d_disease, health(d_disease) AS result FROM donor;