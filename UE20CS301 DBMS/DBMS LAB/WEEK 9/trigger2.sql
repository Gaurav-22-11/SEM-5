create table BACKUP(pnr varchar(10),train_no int(11), travel_date date,departure varchar(30),arrival varchar(30),departure_time time,arrival_time time, passenger_id varchar(20),train_type varchar(20), compartment_type varchar(10),compartment_no varchar(10),seat_no varchar(10),name varchar(30),age int(11), transaction_no int(11),bank varchar(20),card_no varchar(20),price decimal(10,2));
ALTER TABLE ticket_passenger ADD CONSTRAINT dt FOREIGN KEY (pnr) REFERENCES ticket(pnr) on delete cascade;
ALTER TABLE payment_info ADD CONSTRAINT dp FOREIGN KEY (pnr) REFERENCES ticket(pnr) on delete cascade;
DELIMITER $$
CREATE TRIGGER del_ticket
BEFORE DELETE
ON TICKET FOR EACH ROW
BEGIN
	INSERT INTO BACKUP (SELECT * FROM (TICKET NATURAL JOIN(TICKET_PASSENGER NATURAL JOIN PAYMENT_INFO)) WHERE pnr=old.pnr);
	
END; $$
DELIMITER ;

