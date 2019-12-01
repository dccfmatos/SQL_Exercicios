#https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php

create database Exercicios;
use Exercicios;
create table salesman(
salesman_id int AUTO_INCREMENT primary key,
name varchar(30),
city varchar(30),
comission decimal(3,2)
);

desc salesman;

alter table salesman
modify comission decimal (3,2) not null;

ALTER TABLE salesman AUTO_INCREMENT = 5000; #alterar valor inicial do incremento

INSERT INTO `exercicios`.`salesman` (`salesman_id`, `name`, `city`, `comission`) VALUES ('5001', 'James Hoog', 'New York', '0.15');
INSERT INTO `exercicios`.`salesman` (`salesman_id`, `name`, `city`, `comission`) VALUES ('5002', 'Nail Knite', 'Paris', '0.13');
INSERT INTO `exercicios`.`salesman` (`salesman_id`, `name`, `city`, `comission`) VALUES ('5005', 'Pit Alex ', 'London', '0.11');
INSERT INTO `exercicios`.`salesman` (`salesman_id`, `name`, `city`, `comission`) VALUES ('5006', 'Mc Lyon', 'Paris', '0.14');
INSERT INTO `exercicios`.`salesman` (`salesman_id`, `name`, `city`, `comission`) VALUES ('5007', 'Paul Adam', 'Rome', '0.13');
INSERT INTO `exercicios`.`salesman` (`salesman_id`, `name`, `city`, `comission`) VALUES ('5003', 'Lauson Hen', 'San Jose', '0.12');

#drop table salesman;

-------------------------------------------------------------------
#1. Write a SQL statement to display all the information of all salesmen.

select * from salesman;
------------------------------


-------------------------------------------------------------------
#2. Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution"
SELECT 'This is SQL Exercise, Practice and Solution';
-----------------------------

-------------------------------------------------------------------
#3. Write a query to display three numbers in three columns.
select 1,2,3;
-----------------------------

-------------------------------------------------------------------
#4. Write a query to display the sum of two numbers 10 and 15 from RDMS sever.
select 10+5;
-----------------------------


-------------------------------------------------------------------
#5. Write a query to display the result of an arithmetic expression. 
select 10+5*2-1;
-----------------------------

-------------------------------------------------------------------
#6. Write a SQL statement to display specific columns like name and commission for all the salesmen. 
select name, comission from salesman;
-----------------------------


-------------------------------------------------------------------
#7. Write a query to display the columns in a specific order like order date, salesman id, order number and purchase amount from for all the orders.

#criar tabela
create table orders(
ord_no int primary key,
purch_amt decimal (8,2),
ord_date date,
costumer_id int,
salesman_id int,
foreign key(salesman_id) references salesman(salesman_id) #coluna da tabela anterior
)default charset = utf8mb4;

drop table orders;

desc orders;
select * from orders;

select ord_date, salesman_id, ord_no, purch_amt from orders;
-----------------------------


-------------------------------------------------------------------
#8. Write a query which will retrieve the value of salesman id of all salesmen, getting orders from the customers in orders table without any repeats.

select salesman_id from orders; #vai mostrar repetido, apenas queremos ver a listagem dos dierentes vendedores

select distinct salesman_id from orders;
-----------------------------

-------------------------------------------------------------------
#9. Write a SQL statement to display names and city of salesman, who belongs to the city of Paris. 

desc salesman;

select salesman_id, name, city from salesman
where city='Paris';
-----------------------------


-------------------------------------------------------------------
#10. Write a SQL statement to display all the information for those customers with a grade of 200.

create table costumer(
costumer_id numeric(5) primary key,
cust_name varchar(30),
city varchar(15),
grade numeric(3),
salesman_id int(5),
foreign key(salesman_id) references salesman(salesman_id) 
)default charset = utf8mb4;

desc costumer;
select * from costumer;

select * from costumer
where grade='200';
-----------------------------


-------------------------------------------------------------------
#11. Write a SQL query to display the order number followed by order 
#date and the purchase amount for each order which will be delivered by the salesman who is holding the ID 5001.

desc orders;

select ord_no, ord_date, purch_amt 
from orders
where salesman_id='5001';
-----------------------------

-------------------------------------------------------------------
#12. Write a SQL query to display the Nobel prizes for 1970.

create table nobel_win(
year numeric(4),
subject varchar(30),
winner varchar(30) primary key,
country varchar(15),
category varchar(30) 
)default charset = utf8mb4;

desc nobel_win;
select*from nobel_win;

#drop table nobel_win;

select * from nobel_win
where year='1970';

-----------------------------

-------------------------------------------------------------------
#13. Write a SQL query to know the winner of the 1971 prize for Linguist. 
select winner, year, category from nobel_win
where year='1971' && category='Linguist';
-----------------------------

-------------------------------------------------------------------
#14. Write a SQL query to display the year and subject that won 'Dennis Gabor' his prize.
select winner, year, subject
from nobel_win
where winner='Dennis Gabor';
-----------------------------

-------------------------------------------------------------------
#15. Write a SQL query to give the name of the 'Physics' winners since the year 1950
select year, winner
from nobel_win
where year >='1950' && subject='Physics';
-----------------------------

-------------------------------------------------------------------
#16. Write a SQL query to Show all the details (year, subject, winner, country ) of the Chemistry prize winners between the year 1965 to 1975 inclusive.
select *
from nobel_win
where year >='1965' && year<='1975' && subject='Chemistry';
-----------------------------

-------------------------------------------------------------------
#17. Write a SQL query to show all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.
select *
from nobel_win
where year >'1972' 
AND winner IN ('Menachem Begin','Yitzhak Rabin');
-----------------------------

-------------------------------------------------------------------
#18. Write a SQL query to show all the details of the winners with first name Louis.    
select *
from nobel_win
where winner like 'Louis%';
-----------------------------

-------------------------------------------------------------------
#19. Write a SQL query to show all the winners in Physics for 1970 together with the winner of Economics for 1971.
select *
from nobel_win where (subject='Physics' && year='1970') 
union 
(select *
from nobel_win  where (subject='Economics' && year='1971'));
-----------------------------

-------------------------------------------------------------------
#20. Write a SQL query to show all the winners of nobel prize in the year 1970 except the subject Physiology and Economics.   
select *
from nobel_win
where year=1970 && subject<>'Physiology' && subject<>'Economics';

select *
from nobel_win
where year=1970 &&
subject NOT IN('Physiology','Economics');
-----------------------------

-------------------------------------------------------------------
#21. Write a SQL query to show the winners of a 'Physiology' prize in an early year before 1971 together with winners of a 'Peace' prize in a later year on and after the 1974.    
select *
from nobel_win where (subject='Physiology' && year<'1971') 
union 
(select *
from nobel_win  where (subject='Peace' && year>'1974'));
-----------------------------

-------------------------------------------------------------------
#22. Write a SQL query to find all details of the prize won by Johannes Georg Bednorz.    
select *
from nobel_win 
where winner='Johannes Georg Bednorz';
-----------------------------

-------------------------------------------------------------------
#23. Write a SQL query to find all the details of the nobel winners for the subject not started with the letter 'P' and arranged the list as the most recent comes first, then by name in order.    
select *
from nobel_win 
where subject not like'P%'
order by year desc, winner;
-----------------------------

-------------------------------------------------------------------
#24. Write a SQL query to find all the details of 1970 winners by the ordered to subject and winner name; but the list contain the subject Economics and Chemistry at last.
select *
from nobel_win 
where year= 1970
order by 
CASE
    WHEN subject IN ('Economics','Chemistry') THEN 1
    ELSE 0
 END ASC,
subject, winner;
-----------------------------	

-------------------------------------------------------------------
#25. Write a SQL query to find all the products with a price between Rs.200 and Rs.600

create table item_mast(
PRO_ID numeric(3) primary key,
PRO_NAME varchar(30),
PRO_PRICE numeric(5),
PRO_COM numeric(2)
)default charset = utf8mb4;

desc item_mast;
select*from item_mast;

#drop table item_mast;

select *
from item_mast
where pro_price between 200 and 600; #aqui o && nao funciona
-----------------------------

-------------------------------------------------------------------
#26. Write a SQL query to calculate the average price of all products of the manufacturer which code is 16. 
select avg(pro_price)
from item_mast 
where pro_com=16;
-----------------------------

-------------------------------------------------------------------
#27. Write a SQL query to find the item name and price in Rs. 

desc item_mast;

select pro_name as "Item Name", pro_price as "Price in Rs."
from item_mast;
-----------------------------

-------------------------------------------------------------------
#28. Write a SQL query to display the name and price of all the items with a price is equal or more than Rs.250, and the list contain the larger price first and then by name in ascending order. 

select pro_name as "Item Name", pro_price as "Price in Rs."
from item_mast
where pro_price >= 250
order by 
pro_price desc,
pro_name;
-----------------------------

-------------------------------------------------------------------
#29. Write a SQL query to display the average price of the items for each company, showing only the company code. 

select avg(pro_price), pro_com
from item_mast
group by pro_com;
-----------------------------

-------------------------------------------------------------------
#30. Write a SQL query to find the name and price of the cheapest item(s). 

select pro_name, pro_price
from item_mast
where pro_price= 
(select min(pro_price) from item_mast);
-----------------------------

-------------------------------------------------------------------
#31. Write a query in SQL to find the last name of all employees, without duplicates.

create table emp_details(
EMP_IDNO numeric(6) primary key,
EMP_FNAME varchar(15),
EMP_LNAME varchar(15),
EMP_DEPT numeric(2)
)default charset = utf8mb4;

desc emp_details;
select*from emp_details;

#drop table emp_details;

select emp_lname
from emp_details
group by emp_lname;

select distinct emp_lname as "Last name"
from emp_details;
-----------------------------

-------------------------------------------------------------------
#32. Write a query in SQL to find the data of employees whose last name is 'Snares'. 

select *
from emp_details
where emp_lname='Snares';
-----------------------------


-------------------------------------------------------------------
#33. Write a query in SQL to display all the data of employees that work in the department 57

desc emp_details;

select *
from emp_details
where emp_dept='57';
-----------------------------
