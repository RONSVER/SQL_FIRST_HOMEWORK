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
where location_id = 1700; 

use learn;

SELECT * FROM products;

SELECT 
title,
price,
CASE 
	WHEN price <= 10000
    THEN 1
    WHEN price <= 20000
    THEN 2
    WHEN price <= 30000
    THEN 3
	ELSE 4
END AS price_group
FROM products; 

use hr;

SELECT 
first_name,
last_name,
salary,
CASE
WHEN salary <= 10000
THEN 0
ELSE 1
END AS salary_group
FROM employees;

use learn;

SELECT 
title,
price,
price * COALESCE(discount, 1) as price_with_discount
FROM products;

-- ORDER BY
SELECT 
title,
price,
price * COALESCE(discount, 1) as price_with_discount
FROM products
ORDER BY price DESC, title;


SELECT 
title,
price,
price * CASE
WHEN discount IS NULL
THEN 1
ELSE discount
END as price_with_discount
FROM products;

use hr;

SELECT *
FROM employees;

SELECT DISTINCT
job_id
FROM employees;


SELECT 
first_name,
last_name
FROM employees
ORDER BY first_name DESC, last_name DESC;

SELECT *
FROM employees
WHERE department_id IN (60,90,110)
ORDER BY last_name;
 -- 
 use learn;
 -- Math 
 SELECT
 price,
 price * 2 as double_price,
 price - 5000 as price_one,
 price - 5000 as price_two,
 price - 5000 as price_three,
 price % 2 as new_four,
 price * discount as new_price
 FROM products;
 
 -- base function
 
 SELECT -1 AS value;
 SELECT ABS(-2) AS value;
 SELECT POW(3, 2) AS value;
 SELECT SQRT(144) AS value; 
 SELECT ROUND(3.6) AS VALUE;
 
-- str function

SELECT CONCAT('Hello', ' ', 'World', 'hi') AS value;
SELECT CONCAT_WS('-', 'hello', 'world', '2023') ;
SELECT LENGTH('Hello');

SELECT TRIM('     Hello   world  	');
SELECT LTRIM('    Hello   world  	');
SELECT RTRIM('    Hello   world  	');

SELECT LOWER('HeLLoe');
SELECT UPPER('HeLLoe');

SELECT SUBSTRING('Hello World', '7');

SELECT REPLACE('34-45-65-45', '-', ' ');

SELECT INSERT('Hello World', 7, 5, 'Class');

-- airport database

USE airport; 

SELECT 
model_name,
production_year,
distance, 
CASE 
WHEN distance < 1000
THEN 'walk'
WHEN distance > 1000 
	 AND distance <= 2500
THEN 'short'

WHEN distance > 2500 
	 AND distance <= 6000
THEN 'medium'
ELSE 'long'
END AS category
FROM airliners;
 
 SELECT 
 id, 
 service_class, 
 price,
 CASE
 WHEN price > 10000 AND price <= 11000
 THEN "Economy"
 
 WHEN price > 20000 AND price <= 30000
 THEN "PremiumEconomy"
 
 WHEN price > 100000 
 THEN "Business"
 
 WHEN price is NULL 
 THEN ""
 
 END AS category
 FROM tickets;
 
 
 SELECT 
  side_number,
  production_year,
  distance,
  CASE
    WHEN production_year < 2000 THEN 'old'
    WHEN production_year >= 2000 AND production_year <= 2010 THEN 'mid'
    ELSE 'new'
  END AS category
FROM airliners
WHERE distance <= 10000
ORDER BY production_year ASC;



-- 3)Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. 
-- Скидка на билет экономкласса (Economy) составила 15%, на билет бизнес-класса (Business) — 10%, 
-- а на билет комфорт-класса (PremiumEconomy) — 20%. Определите цену билета в каждом сегменте с учетом скидки.
-- В выборке должны присутствовать три атрибута — id, tripid, newprice.


SELECT 
id,
trip_id,
price,
CASE 
WHEN service_class = "Economy" 
THEN price / 15

WHEN service_class = "Business" 
THEN price / 10

WHEN service_class = "PremiumEconomy" 
THEN price / 20
END AS new_price
FROM tickets
WHERE
   trip_id IN ('LL4S1G8PQW', '0SE4S0HRRU', 'JQF04Q8I9G');
   
   use hr;
   
   SELECT 
   first_name,
    last_name
    FROM employees;
    WHERE 
    first_name = "D%",
    ORDER BY last_name ASC
	
   
   
