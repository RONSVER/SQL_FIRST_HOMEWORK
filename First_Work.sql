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
    
    use hr;
    
    
    select *
    from employees;
    
   
    
SELECT t1.job_id, t1.salary, t2.manager_id, t2.salary AS manager_salary 
FROM employees t1
JOIN employees t2 ON t1.manager_id = t2.employee_id
WHERE t1.salary > t2.salary;

SELECT t1.first_name, t1.last_name, t3.city
FROM employees t1
JOIN departments t2 ON t1.department_id = t2.department_id
JOIN locations t3 ON t2.location_id = t3.location_id
WHERE t3.city IN ('Seattle', 'Toronto');


SELECT t2.first_name, t2.last_name, t1.department_name, t3.job_title
FROM departments t1
JOIN  employees t2 ON t1.department_id = t2.department_id
JOIN jobs t3 ON t2.job_id = t3.job_id;


-- classwork seven

-- Date 20.10.2023
-- Time 19:06
-- Year 2023
-- DateTime date+time
-- Timestamp 

use shop;

SELECT curdate(); -- only date

SELECT now(); -- date + time when run script

SELECT sysdate(); -- date + time function run

-- convert string to date 

SELECT str_to_date("2023-10-20 19:20:55", "%Y-%m-%d %H:%i:%s");

SELECT str_to_date("2023-10-20 19:20:55", "%Y-%m-%d");

SELECT str_to_date("20-10-23 19:20:55", "%d-%m-%Y");

-- extract data from date

SELECT extract(hour from "2023-10-20 19:20:55"); 

SELECT extract(year from "2023-10-20 19:20:55");

SELECT extract(month from "2023-10-20 19:20:55");  

SELECT date_add("2023-10-20 19:20:55", interval 5 day);

SELECT date_add("2023-10-20 19:20:55", interval -5 day);

SELECT date_add("2023-10-20 19:20:55", interval -5 month);

SELECT datediff('2023-10-20', '2023-10-30');

SELECT *
FROM orders
WHERE month(ODATE) = 3;

SELECT *
FROM orders 
WHERE ODATE between '2022-04-10' and '2022-05-10';

SELECT COUNT(*)
FROM orders
WHERE month(ODATE) = 6;


SELECT AVG(AMT)
FROM orders
WHERE month(ODATE) = 3;


SELECT *
FROM orders
WHERE WEEKDAY(ODATE) = 1;



CREATE database uni;

use uni;

create table Students(
  id integer primary key auto_increment,
    name varchar(128) not null,
    age integer
);

create table Teachers(
  id integer primary key auto_increment,
    name varchar(128) not null,
    age integer
);

create table Competencies(
  id integer primary key auto_increment,
    title varchar(128) not null
);

create table Teachers2Competencies(
  id integer primary key auto_increment,
    teacher_id integer,
    competencies_id integer
);

create table Courses(
  id integer primary key auto_increment,
    teacher_id integer,
    title varchar(128) not null,
    headman_id integer
);

create table Students2Courses(
  id integer primary key auto_increment,
    student_id integer,
    course_id integer
);

insert into students (name, age) values ('Анатолий', 29);
insert into students (name, age) values ('Олег', 25);
insert into students (name, age) values ('Семен', 27);
insert into students (name, age) values ('Олеся', 28);
insert into students (name, age) values ('Ольга', 31);
insert into students (name, age) values ('Иван', 22);

insert into teachers (name, age) values ('Петр', 39);
insert into teachers (name, age) values ('Максим', 35);
insert into teachers (name, age) values ('Антон', 37);
insert into teachers (name, age) values ('Всеволод', 38);
insert into teachers (name, age) values ('Егор', 41);
insert into teachers (name, age) values ('Светлана', 32);

insert into Competencies (title) values ('Математика');
insert into Competencies (title) values ('Информатика');
insert into Competencies (title) values ('Программирование');
insert into Competencies (title) values ('Графика');

insert into Teachers2Competencies (teacher_id, competencies_id) values (1, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 3);
insert into Teachers2Competencies (teacher_id, competencies_id) values (3, 2);
insert into Teachers2Competencies (teacher_id, competencies_id) values (4, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (5, 3);

insert into courses (teacher_id, title, headman_id) values (1, 'Алгебра логики', 2);
insert into courses (teacher_id, title, headman_id) values (2, 'Математическая статистика', 3);
insert into courses (teacher_id, title, headman_id) values (4, 'Высшая математика', 5);
insert into courses (teacher_id, title, headman_id) values (5, 'Javascript', 1);
insert into courses (teacher_id, title, headman_id) values (5, 'Базовый Python', 1);

insert into students2courses (student_id, course_id) values (1, 1);
insert into students2courses (student_id, course_id) values (2, 1);
insert into students2courses (student_id, course_id) values (3, 2);
insert into students2courses (student_id, course_id) values (3, 3);
insert into students2courses (student_id, course_id) values (4, 5);

SELECT *
FROM students;

SELECT *
FROM teachers;

SELECT *
FROM courses;

SELECT *
FROM competencies;


SELECT *
FROM students2courses;

SELECT *
FROM teachers2competencies;

SELECT 
t1.name, 
t3.title
FROM students t1
INNER JOIN students2courses t2
ON t1.id = t2.student_id
INNER JOIN courses t3
ON t3.id = t2.course_id;

SELECT
t1.name,
t3.title
FROM teachers t1
LEFT JOIN teachers2competencies t2
ON t1.id = t2.teacher_id
LEFT JOIN competencies t3
ON t2.competencies_id = t3.id;



SELECT
t1.name
FROM teachers t1
LEFT JOIN teachers2competencies t2
ON t1.id = t2.teacher_id
WHERE t2.competencies_id IS NULL;

/*
4. print student name without any courses
*/
SELECT 
-- t1.*,
-- t2.*
t1.name
FROM students t1
LEFT JOIN Students2Courses t2
ON t1.id = t2.student_id
WHERE t2.course_id IS NULL;


SELECT
t1.title
FROM Courses t1
LEFT JOIN Students2Courses t2
ON t1.id = t2.course_id
WHERE t2.student_id IS NULL;


SELECT
t1.title
FROM competencies t1
LEFT JOIN teachers2competencies t2
ON t1.id = t2.competencies_id
WHERE t2.teacher_id IS NULL;

SELECT
t1.title,
t2.name
FROM courses t1
INNER JOIN students t2
ON t1.headman_id = t2.id;


-- classwork 8

-- count(colone_name)  count not null values

-- count(*) all lines in result table


--   max(colone_name) max value in this column
--   min(colone_name) min value in this column

-- abg(colone_name) average value in this column
--  sum(colone_name) sum value in this column 

use hr;

SELECT *
FROM employees;

SELECT 
max(salary) as salary_max,
min(salary) as salary_min,
avg(salary) as avg_min,
sum(salary) as sum_min,
count(salary) as count_employees
FROM employees;

SELECT 
count(commission_pct) as commission_count,
count(*) as count_employees
FROM employees;

-- print count employees without manager

SELECT 
COUNT(*) AS count_employees_whithout_managers
FROM employees
WHERE manager_id IS NULL; 

SELECT
COUNT(manager_id) AS count_employees_whithout_managers,
COUNT(*)
FROM employees;

-- print name and surname employee(s) with max salary 
SELECT 
first_name as name,
last_name as surname,
salary as employ_salary
from employees
WHERE salary = (
SELECT
MAX(salary) as max_salary
FROM employees);

-- task one max salary


SELECT
MAX(salary) as max_salary
FROM employees;


-- task two - print employees count 

SELECT

COUNT(*)
FROM employees;

-- task three print name and surname employee(s) with max salary 
SELECT 
first_name as name,
last_name as surname,
salary as employ_salary
from employees
WHERE salary = (
SELECT
MAX(salary) as max_salary
FROM employees);


-- task four - print average salary by company

SELECT
AVG(salary) as avg_salary
FROM employees;


-- task five - print names surnames and salary from employees who get salary average salary by company

SELECT 
first_name as name,
last_name as surname,
salary
FROM employees
WHERE salary < (
SELECT
AVG(salary)  avg_salary
FROM employees
);

-- task six - print count of departments

SELECT
COUNT(*) AS departments_count
FROM departments;

-- task seven - print count of departments without any workers




SELECT
-- t1.department_name,
-- t1.department_id,
-- t2.first_name,
-- t2.department_id
COUNT(*)
FROM departments t1
LEFT JOIN employees t2
ON t1.department_id = t2.department_id
WHERE t2.department_id IS NULL;

SELECT
COUNT(*) as department_cnt_without_workers
FROM departments
WHERE department_id NOT IN ( SELECT department_id FROM employees WHERE department_id IS NOT NULL );

-- tASK EIGHT = print average salary in department with id = 90
SELECT 
AVG(salary) AS avg_salary
FROM employees
WHERE department_id = 90; 

-- task nine - print max salary in departments with id 70, 80


SELECT 
MAX(salary) AS max_salary
FROM employees
WHERE department_id IN (70, 80); 

-- task ten - print count employees from departments with id 100 who earn more than 5000 

SELECT 
COUNT(salary) 
FROM employees 
WHERE department_id = 100 
AND salary > 5000;

/*
Task eleven - print count of employees from department with id 60 who earn more than average salary by company
*/

SELECT
COUNT(*)
FROM employees
WHERE department_id = 60 and salary > (
SELECT
AVG(salary) as average_salary
FROM employees
);

-- grouping

-- Task one

SELECT 
department_id,
COUNT(*) employees_cnt
FROM employees
GROUP BY department_id;

use shop;

SELECT *
FROM ORDERS;

-- task two 

SELECT
CUST_ID,
COUNT(*) orders_cnt
FROM ORDERS
GROUP BY CUST_ID; 


SELECT
t1.CNAME,
t1.CUST_ID,
t2.orders_cnt
FROM CUSTOMERS t1
INNER JOIN (
	SELECT
	CUST_ID,
	COUNT(*) orders_cnt
	FROM ORDERS
	GROUP BY CUST_ID
) t2

ON t1.CUST_ID = t2.CUST_ID;

-- classwork nine

use hr;

-- Task one - print count of employees for each manager

SELECT manager_id, COUNT(*) as employee_count
FROM employees
GROUP BY manager_id;

-- Task two - print department name, count of employees for each department

SELECT
t1.department_name,
COUNT(t2.employee_id) as employee_cnt
FROM departments t1
LEFT JOIN employees t2
ON t1.department_id = t2.department_id
GROUP BY t1.department_name;


SELECT t1.department_name, 
COUNT(*) AS employee_count
FROM departments t1
INNER JOIN employees t2 
ON t1.department_id = t2.department_id
GROUP BY t1.department_id, t1.department_name;

-- Task three - print max salary in each department, department_id ,max salary
SELECT 
department_id, 
MAX(salary) as max_salary
FROM employees
GROUP BY department_id;

SELECT
t1.department_id,
t1.department_name,
MAX(t2.salary) as max_salary
FROM departments t1
INNER JOIN employees t2
ON t1.department_id = t2.department_id
GROUP BY t1.department_id, t1.department_name;

-- Task four - print manager name, surname and count of employees for each manager

SELECT
#t1.employee_id,
#t2.employee_id as manager_id,
t2.first_name,
t2.last_name,
#COUNT(t1.employee_id) as employees_cnt
COUNT(*) as employees_cnt
FROM employees t1
INNER JOIN employees t2
ON t1.manager_id = t2.employee_id
GROUP BY t2.first_name, t2.last_name;

-- task five 
SELECT 
department_id, 
MAX(salary) as max_salary
FROM employees
GROUP BY department_id;

SELECT
t1.last_name,
t1.first_name,
t2.department_id,
t2.max_salary
FROM employees t1
INNER JOIN (
SELECT 
department_id, 
MAX(salary) as max_salary
FROM employees
GROUP BY department_id
) t2
ON t1.salary = t2.max_salary AND t1.department_id = t2.department_id;



-- HAVING

SELECT 
department_id, 
MAX(salary) as max_salary
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;


SELECT
department_id,
MAX(salary) as max_salary
FROM employees
WHERE department_id > 50
GROUP BY department_id
HAVING MAX(salary) > 13000
ORDER BY department_id;

SELECT
manager_id,
COUNT(*) as employees_cnt
FROM employees
GROUP BY manager_id
HAVING COUNT(*) > 5;

-- TASK SIX

SELECT
department_id,
COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10; 

SELECT
t1.department_name,
t1.department_id
FROM departments t1
INNER JOIN (SELECT
department_id,
COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10 ) t2
ON t1.department_id = t2.department_id;

--

SELECT
department_name
FROM departments
WHERE department_id IN (
   SELECT
   department_id
   FROM employees
   GROUP BY department_id
   HAVING COUNT(*) > 10
);

-- task seven


SELECT
AVG(employ_cnt)
FROM(
SELECT
department_id,
COUNT(*) AS employ_cnt
FROM employees
GROUP BY department_id) t1;



SELECT
department_id,
COUNT(*) AS employ_cnt
FROM employees
GROUP BY department_id
HAVING COUNT(*) > (
SELECT
AVG(employ_cnt)
FROM(
SELECT
department_id,
COUNT(*) AS employ_cnt
FROM employees
GROUP BY department_id) t1
);

/*
Task seven - print department name where count of employee more than average
*/

SELECT 
department_name 
FROM departments
WHERE
department_id IN (
     SELECT
     department_id
     #COUNT(*) as employee_cnt
     FROM employees
     GROUP BY department_id
     HAVING COUNT(*) > (
          SELECT
          AVG(employees_cnt)
          FROM(
           SELECT
           department_id,
           COUNT(*) as employees_cnt
           FROM employees
           GROUP BY department_id) t1)
           );
           
-- HomeWork

use shop; 

SELECT
t1.CNAME,
t2.AMT
FROM customers t1
INNER JOIN orders t2
ON t1.CUST_ID = t2.CUST_ID
WHERE t2.AMT > 1000;

use hr;

SELECT
t1.last_name AS sname,
(t1.commission_pct - t1.commission_pct) AS difference 
FROM employees t1
LEFT JOIN employees t2
ON t1.manager_id = t2.employee_id;

use shop;

SELECT s.SNAME, c.CNAME, c.CITY 
FROM sellers s 
JOIN customers c ON s.CITY = c.CITY;

--   1 уровень сложности: 1.Используем БД uni (скрипт создания представлен на уроке)

use uni;

SELECT
t1.name AS name_students,
t2.name AS name_teachers,
t3.title AS name_coursers
FROM students t1
INNER JOIN teachers t2
ON t1.id = t2.id
INNER JOIN courses t3
ON t2.id = t3.id;

-- 2.Используем БД shop :
-- Выведите имена покупателей, которые сделали заказ.
-- Предусмотрите в выборке также имена продавцов.
-- Примечание: покупатели и продавцы должны быть из разных городов.
-- В выборке должно присутствовать два атрибута — cname, sname.

USE shop;

SELECT 
    t1.CNAME AS CustomerName,
    t3.SNAME AS SellerName,
    t1.CITY AS CustomerCity,
    t3.CITY AS SellerCity
FROM 
    customers t1
JOIN 
    orders t2 ON t1.CUST_ID = t2.CUST_ID
JOIN 
    sellers t3 ON t2.SELL_ID = t3.SELL_ID
WHERE 
    t1.CITY <> t3.CITY;

-- 3..Используем БД shop :
-- Вывести имена покупателей которые ничего никогда не покупали.
-- Решить задачу двумя способами : через join и через подзапрос 

SELECT 
    t1.CNAME
FROM 
    customers t1
LEFT JOIN 
    orders t2 ON t1.CUST_ID = t2.CUST_ID
WHERE 
    t2.CUST_ID IS NULL;






