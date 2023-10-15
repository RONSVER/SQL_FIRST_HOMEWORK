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
   FROM employees
   WHERE first_name LIKE "D%"
   ORDER BY last_name ASC;
   
   
/* Task 1
students :
name, lastname - ne null
avg_mark - from 0 to 5.   numeric(2,1)
gender "M" "F" 
*/

CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    avg_mark NUMERIC(2, 1) CHECK (avg_mark BETWEEN 0.0 AND 5.0),
    gender CHAR(1) CHECK (gender IN ('M', 'F'))
);


-- Олег Петров 4.3 M

-- Семен Степанов 3.1 M 

-- Ольга Семенова 4.7 F 

-- Игорь Романов 3.1 M 

-- Ирина Иванова 2.2 F

INSERT INTO table_name (id, name, last_name, avg_mark, gender)
VALUES ("Oleg", "Petrov", 4.3, "M");

INSERT INTO table_name (id, name, last_name, avg_mark, gender)
VALUES ("Semen", "Stepanov", 3.1, "M");

INSERT INTO table_name (id, name, last_name, avg_mark, gender)
VALUES ("Olga", "Semenova", 4.7, "F");

INSERT INTO table_name (id, name, last_name, avg_mark, gender)
VALUES ("Igor", "Romanov", 3.1, "M");

INSERT INTO table_name (id, name, last_name, avg_mark, gender)
VALUES ("Irina", "Ivanova", 2.2, "F");


use learn;

CREATE TABLE goods(
id integer primary key auto_increment,
title varchar(32),
quantity integer check (quantity > 0),
in_stock char(1) check (in_stock in ('Y','N'))
);

CREATE TABLE goods_two(
id integer primary key auto_increment,
title varchar(32),
quantity integer check (quantity > 0),
price integer,
in_stock char(1) check (in_stock in ('Y','N'))
);

insert into goods (title,quantity,in_stock) 
  values ('bike',2,'Y'),
    ('skates',4,'Y'),
    ('skis',2,'Y'),
    ('board',7,'N'),
    ('scooter',1,'N'),
	('bicycle',5,'Y');
    
    
    insert into goods_two (title,quantity,price,in_stock) 
  values ('bike',2,500,'Y'),
   ('skis',2,100,'Y'),
    ('board',7,300,'N'),
    ('scooter',1,200,'N'),
	('form',10,35,'Y');
    
    
    SELECT * 
    FROM goods;
    
    SELECT * 
    FROM goods_two;
    
    SELECT title
FROM goods
UNION ALL -- get all strings with duplicates
SELECT title
FROM goods_two;

SELECT title
FROM goods
UNION  -- get all strings without duplicates
SELECT title
FROM goods_two;

SELECT id , title ,0 as price, quantity FROM goods
UNION ALL
SELECT id , title ,price, quantity FROM goods_two;


use learn;

CREATE TABLE stud (
id integer primary key auto_increment,
name varchar(128) not null,
surname varchar(128) not null
);

CREATE TABLE ages (
student_id integer unique,
age integer
);

INSERT INTO stud (name, surname) VALUES ('Alex', 'Alekseev') , ('Oleg','Olegov'), ('kata','Kitana');

INSERT INTO ages (student_id, age) VALUES (1, 20), (2, 23), (3, 40);

INSERT INTO ages (student_id, age) VALUES (5, 60);

SELECT *
FROM ages;

INSERT INTO stud (name, surname) VALUES ('petr', 'petrov');

SELECT 
t1.id,
t1.name,
t1.surname,
t2.age
FROM stud t1
INNER JOIN ages t2
ON t1.id = t2.student_id;

CREATE TABLE courses (
id integer primary key auto_increment,
name varchar(128)
);

INSERT INTO courses (name) VALUE ('Java'), ('Algo'), ('SQL');

INSERT INTO courses (name) VALUE ('Js');
   
CREATE TABLE course2student (
student_id integer,
course_id integer 
);   

INSERT INTO course2student (student_id, course_id) VALUE (1,1), (1,2), (2,2), (3,3), (3,2);

INSERT INTO course2student (student_id, course_id) VALUE (6,4);

SELECT
t1.id,
t1.name,
t1.surname,
t3.name course_name
FROM stud t1
INNER JOIN course2student t2
ON t1.id = t2.student_id
INNER JOIN courses t3
ON t3.id = t2.course_id;

CREATE TABLE contacts (
contacts_id integer primary key auto_increment,
phone varchar(128)
); 

INSERT INTO contacts (phone) VALUE ('+33333'), ('44444'), (324234234);

SELECT
t1.name,
t1.surname,
t2.phone
FROM stud t1
INNER JOIN contacts t2
ON t1.id = t2.contacts_id;

 -- LEFT JOIN
 
 SELECT
t1.name,
t1.surname,
t2.phone
FROM stud t1
LEFT JOIN contacts t2
ON t1.id = t2.contacts_id;

-- RIGHT JOIN

SELECT
t1.name,
t1.surname,
t2.age
FROM stud t1
RIGHT JOIN ages t2
ON t1.id = t2.student_id;

use hr; 

SELECT 
t1.first_name,
t1.last_name,
t1.department_id,
t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id;

select * from departments;

SELECT 
t1.first_name,
t1.last_name,
t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id
WHERE t2.department_name IN ('IT', 'Treasury', 'IT Support');

-- self join

SELECT 
t1.first_name,
t1.last_name,
t2.first_name manager_name, 
t2.last_name manager_lastname
FROM employees t1
INNER JOIN employees t2
ON t1.manager_id = t2.employee_id;


-- classwork six

/*
Task  2(subselect) . print name, surname employees and department name where he works,
but deparment must be IT, Treasury, IT Support
*/

SELECT 
t1.first_name,
t1.last_name,
t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id AND t2.department_name IN ('IT', 'Treasury', 'IT Support');

use hr;

select
t1.first_name,
t1.last_name
FROM employees t1
WHERE t1.department_id IN (SELECT
department_id
FROM departments
WHERE department_name IN ('IT', 'Treasury', 'IT Support'));


SELECT
department_id
FROM departments
WHERE department_name IN ('IT', 'Treasury', 'IT Support');


select * 
FROM departments;

select *
from locations;


select
t1.department_name,
t1.department_id,
t2.employee_id
FROM departments t1
LEFT JOIN employees t2
ON t1.department_id = t2.department_id
WHERE t2.employee_id is null;

SELECT 
department_name
FROM departments
WHERE department_id NOT IN (
SELECT DISTINCT department_id
FROM employees
WHERE department_id IS NOT NULL);

/*
Task 2. Print name, surname, salary for employees who works in cities 'Oxford', 'San Francisco'
*/

SELECT 
first_name,
last_name,
salary
FROM employees
WHERE employees IN (
SELECT 
city
FROM locations WHERE city IN ('South San Francisco', 'Oxford Science Park')
);


SELECT 
t1.first_name,
t1.last_name,
t1.salary,
t3.city
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id
INNER JOIN locations t3
ON t3.location_id = t2.location_id
WHERE t3.city IN ('Oxford','South San Francisco');


SELECT 
t1.first_name, t1.last_name, t1.salary
FROM employees t1
WHERE t1.department_id IN (
    SELECT department_id FROM departments 
                WHERE location_id IN (
      SELECT location_id FROM locations 
      WHERE city IN ('Oxford','South San Francisco')));


USE shop;

select *
from sellers;

SELECT 
t1.SNAME,
t2.SNAME BOSS_NAME
FROM sellers t1
INNER JOIN sellers t2
ON t1.BOSS_ID = t2.SELL_ID;


USE hr;

CREATE TABLE stuff (
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(200),
surname VARCHAR(200),
age INT,
position VARCHAR(200)
);

INSERT INTO stuff (name, surname, age, position)
VALUES('Anna', 'Ivanova', 28, 'worker'),
('Peter', 'Smith', 35, 'administration'),
('Maria', 'Johnson', 42, 'security'),
('Alex', 'Brown', 30, 'worker'),
('John', 'Doe', 39, 'administration'),
('Elena', 'Petrova', 45, 'security'),
('Michael', 'Davis', 33, 'worker'),
('Olga', 'Sidorova', 37, 'administration');

ALTER TABLE stuff ADD salary INT; 

UPDATE stuff
SET salary = 
    CASE 
        WHEN position = 'worker' THEN 1000
        WHEN position = 'administration' THEN 5000
        WHEN position = 'security' THEN 2000
        ELSE 0
    END
    
    WHERE id > 0;
    
    ---------------------
    
    UPDATE stuff
SET salary = 
    CASE 
        WHEN position = 'worker' THEN 1000 * 2
        WHEN position = 'administration' THEN 5000 * 2
        WHEN position = 'security' THEN 2000 * 2
        ELSE 0
    END
    
    WHERE id > 0;
    
    -- Удалите из таблицы сотрудников, чей возраст больше чем 45.
--  DELETE FROM staff
-- 	WHERE age > 45;

    CREATE VIEW worker_view AS
	SELECT *
	FROM stuff
    WHERE position = "worker";
    
    CREATE VIEW security_view AS
    SELECT * 
    FROM stuff
    WHERE position = 'security';
    
    CREATE VIEW administration_view AS
    SELECT *
    FROM stuff
    WHERE position = 'administration';
    
    
    select *
    from administration_view;
    
    CREATE TABLE admin_employees AS
    SELECT 
    name, 
    surname,
    position
    FROM stuff
    WHERE position = "administration";
    
    ALTER TABLE admin_employees
    DROP COLUMN position;
    
    select * 
    from admin_employees;




