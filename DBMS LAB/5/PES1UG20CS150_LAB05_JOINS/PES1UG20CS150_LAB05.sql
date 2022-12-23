create view view1 as select ticket.pnr,ticket.train_no,ticket.departure,ticket.arrival,route_info.distance,fare.fare_per_km from ticket,route_info,fare where (ticket.train_no=route_info.train_no and ticket.departure=route_info.from_station_name and ticket.arrival=route_info.to_station_name and fare.train_type=ticket.train_type and fare.compartment_type=ticket.compartment_type);
create view view2 as select pnr ,count(pnr) as numbers from ticket_passenger group by pnr;
update payment_info as p inner join view1 as v1 on p.pnr=v1.pnr inner join view2 as v2 on v1.pnr=v2.pnr set p.price=v1.distance * v1.fare_per_km * v2.numbers;

select t.train_no,t.source,t.destination,t.train_name ,r.from_station_name,to_station_name,r.distance from train as t natural join route_info as r where r.to_station_no-r.from_station_no=1;

select distinct r.train_no from compartment as c inner join route_info as r where r.to_station_name="Chennai" and r.from_station_name="Bengaluru" and c.availability>10;

select distinct train_user.firstname ,train_user.lastname from train_user join payment_info on payment_info.price>500;

select train_user.firstname,train_user.lastname,train_user.dob from train_user left outer join ticket on ticket.pnr;

select distinct train_user.firstname,train_user.lastname from train_user left outer join ticket on ticket.passenger_id != train_user.user_id;

select ticket.pnr,ticket.train_no,ticket.travel_date,train_user.firstname,train_user.lastname from ticket right outer join train_user on ticket.passenger_id=train_user.user_id;

select ticket.passenger_id,train.train_no,train.train_name from ticket right outer join train on train.train_no=ticket.train_no; 

select train.train_no,train.train_name from train where train.train_no in(select train.train_no from route_info join ticket on route_info.train_no=ticket.train_no where ticket.departure not like "Mangalore" and ticket.departure_time != "20:30:00" and route_info.distance>100);

select ticket.passenger_id from ticket where ticket.pnr in(select payment_info .pnr from payment_info where payment_info.price>(select avg(price) from payment_info));