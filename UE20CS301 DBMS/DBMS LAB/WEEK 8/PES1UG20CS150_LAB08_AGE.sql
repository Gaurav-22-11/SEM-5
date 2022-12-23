delimiter $$
create procedure user_age()
begin
    declare TodayDate DATE;
    select CURRENT_DATE() INTO TodayDate;
    update train_user 
    set age= YEAR(TodayDate) -year(dob);    
end$$
delimiter ;

set SQL_SAFE_UPDATES=0;
call user_age();
select * from train_user;