use railway_reservation_system;
#1
delimiter $$
Create function get_no_of_tickets(U_ID varchar(255))
returns varchar(255) 
deterministic
begin
   declare tkt_count int;
   declare ret_msg varchar(255);

select count(U_ID) into tkt_count
from ticket
where   User_Id = u_id and 
		month(travel_date)=month(sysdate()) and 
		year(travel_date)=year(sysdate());

if tkt_count > 3 then
      set ret_msg := ("you can not buy any more tickets - Current Limit Reached");
else
      set ret_msg := Concat("You can buy upto", 3 - tkt_count,"tickets"); 
end if;
   return ret_msg;
end;
$$
delimiter ;
select user_id, get_no_of_tickets(user_id) from ticket;

#2
DELIMITER $$
CREATE procedure calculate_age()
BEGIN
    DECLARE TodayDate DATE;
    SELECT CURRENT_DATE() INTO TodayDate;
    UPDATE users 
    SET age= YEAR(TodayDate) -year(dob);    
END$$
DELIMITER ;

set SQL_SAFE_UPDATES=0;
call calculate_age();
select * from users;
