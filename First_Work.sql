create database learn;

use learn;

create table products (
id integer primary key auto_increment,
title varchar(128),
price integer,
discount decimal(2,1)
);

insert into products (title,price,discount) 
values ('bike',50000,0.9),
('skates',15000,0.1),
('skis',25000,null),
('board',30000,0.9),
('scooter',10000,0.8);

select *
from products;

select 
	title as name,
	price,
    discount
from products;

use hr;

select *
from employees 
where job_id = "IT_PROG";

select *
from employees 
where salary > 10000;

select *
from employees 
where salary between 10000 and 20000;

select *
from employees 
where department_id not in (60, 30, 100);

select *
from employees 
where last_name like "%a";


select salary
from employees 
where first_name = "Lex" and last_name = "De Haan";


select *
from departments
where department_id = 90;  

select *
from departments
where location_id  = 1700; 





