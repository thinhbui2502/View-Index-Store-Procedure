create database demo;
use demo;

create table Products (
    id int auto_increment primary key unique ,
    productCode varchar(15),
    productName varchar(45),
    productPrice varchar(15),
    productAmount varchar(15),
    productDescription varchar(50),
    productStatus varchar(15)
);

insert into Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES (1,'Iphone',1000,5,'Black and Gold',true),
       (2,'S10Plus',950,2,'Gray',true),
       (3,'VSmart',300,0,'All Back',false);

create unique index idx_productCode on products(productCode);
explain select productCode from products;

create index idx_Composite on products(productName,productPrice);
explain select productName,productPrice from products;

create view productsView as
    select productCode,productName,productPrice,productStatus
from products;

create or replace view new_view as
    select productName,productAmount,productDescription
from products;

drop view new_view;

delimiter //
create procedure showInfoProduct()
begin
    select * from products;
end//;

call showInfoProduct();

delimiter //
create procedure addNewProduct()
begin
    insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (4,'OPPO', 350,1,'Sexy RED', true);
end //;
delimiter //

call addNewProduct();

delimiter //
create procedure updateProduct(in idForUpdate int)
begin
    update products set productName = 'Nokia'
    where id = idForUpdate;
end //
delimiter //

call updateProduct(4);

delimiter //
create procedure deleteProduct (in idForDelete int)
begin
    delete from products
    where id = idForDelete;
end //
delimiter //

call deleteProduct(3);