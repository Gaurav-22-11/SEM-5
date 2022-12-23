delimiter $$
Create function count_tickets(U_ID varchar(255))
returns varchar(255) 
deterministic
begin
   declare tkt_count int;
   declare ret_msg varchar(255);

select count(U_ID) into tkt_count
from ticket
where   passenger_id = u_id and 
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

select passenger_id,count_tickets(passenger_id) from ticket;