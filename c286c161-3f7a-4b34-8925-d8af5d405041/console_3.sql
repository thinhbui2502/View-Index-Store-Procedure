delimiter //
create procedure  getCusByid
(IN cusNum INT(11))
begin
    select *from customers where customerNumber = cusNum;
end;
delimiter //;

call getCusByid(175);

delimiter //
create procedure GetCustomersCountByCity(
In in_city varchar(50),
out total int
)
begin
    select count(customerNumber)
        into total
    from customers
        where city = in_city;
end //
delimiter //;

call GetCustomersCountByCity('Lyon', @total);
select @total;

delimiter //
create procedure SetCounter (
inout counter INT,
IN inc INT
)
begin
    set counter = counter + inc;
end //
delimiter //;

set @counter = 1;
call SetCounter(@counter,1);
call SetCounter(@counter,4);
select @counter;