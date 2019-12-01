#https://www.w3resource.com/sql-exercises/sql-boolean-operators.php

-------------------------------------------------------------------
#1. Write a query to display all customers with a grade above 100. 

use exercicios;
select* from costumer;
select cust_name
from costumer
where grade > 100;
-----------------------------

-------------------------------------------------------------------
#2. Write a query statement to display all customers in New York who have a grade value above 100

select * from costumer;
select cust_name
from costumer
where grade > 100 and city='New York';
-----------------------------

-------------------------------------------------------------------
#3. Write a SQL statement to display all customers, who are either belongs to the city New York or had a grade above 100.   

select * from costumer;
select cust_name
from costumer
where grade > 100 or city='New York';
-----------------------------

-------------------------------------------------------------------
#4. Write a SQL statement to display all the customers, who are either belongs to the city New York or not had a grade above 100.  

select * from costumer;
select cust_name
from costumer
where grade <> 100 or city='New York';

select cust_name
from costumer
where not grade=100 or city='New York';
-----------------------------

-------------------------------------------------------------------
#5.Write a SQL query to display those customers who are neither belongs to the city New York nor grade value is more than 100.

select * from costumer;
select cust_name
from costumer
where !(grade= 100 and city='New York');

select cust_name
from costumer
where not(grade= 100 and city='New York');
-----------------------------

-------------------------------------------------------------------
#6. Write a SQL statement to display either those orders which are not issued on date 2012-09-10 and issued by the salesman whose ID is 505 and below or those orders which purchase amount is 1000.00 and below.

desc costumer;
desc orders;

select ord_no, ord_date, salesman_id, purch_amt
from orders
where ((ord_date != '2012-09-10' && salesman_id<=5005)
or purch_amt <=1000)
order by purch_amt;
-----------------------------

-------------------------------------------------------------------
#7.Write a SQL statement to display salesman_id, name, city and commission who gets the commission within the range more than 0.10% and less than 0.12%

desc salesman;

select *
from salesman
where comission between 0.10 and 0.12;
-----------------------------

-------------------------------------------------------------------
#8.Write a SQL query to display all orders where purchase amount less than 200 or exclude those orders which order date is on or greater than 10th Feb,2012 and customer id is below 3009. 

desc orders;

select *
from orders
where purch_amt < 200 or not ord_date>=2012-02-10 and costumer_id<3009;
-----------------------------

-------------------------------------------------------------------
#9. Write a SQL statement to exclude the rows which satisfy 1) order dates are 2012-08-17 and purchase amount is below 1000 2) customer id is greater than 3005 and purchase amount is below 1000.

desc orders;

select *
from orders
where not(ord_date ='2012-08-17' or costumer_id>3005)
and (purch_amt<1000);
-----------------------------

-------------------------------------------------------------------
#10. Write a SQL query to display order number, purchase amount, achieved, the unachieved percentage for those order which exceeds the 50% of the target value of 6000.

desc orders;

select ord_no, purch_amt,
(100*purch_amt)/6000 as "Achieved %", 
(100*(6000-purch_amt)/6000) as "Unachieved %",
6000 as Target
from orders
where (100*purch_amt)/6000>50;
-----------------------------

-------------------------------------------------------------------
#11. Write a query in SQL to find the data of employees whose last name is Dosni or Mardy.

desc emp_details;

select *
from emp_details
where emp_lname like '%Dosni%' or emp_lname='Mardy';
-----------------------------

-------------------------------------------------------------------
#12. Write a query in SQL to display all the data of employees that work in department 47 or department 63. 

desc emp_details;

select *
from emp_details
where emp_dept=47 or emp_dept=63;
-----------------------------