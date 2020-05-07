delimiter //
create procedure findAllCustomers()
begin
    select * from customers;
end //
delimiter //;

call findAllCustomers();

drop procedure findAllCustomers;

delimiter //
drop procedure IF EXISTS 'findAllCustomers'//
create procedure findAllCustomers()
begin
    select * from customers where customerNumber = 175;
end; //
delimiter //