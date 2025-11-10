/*1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000).

Write the SQL query to create the above table with all constraints.*/

create database company;
use company;
create table employees
(emp_id varchar(6) primary key,
emp_name varchar(30) not null,
age int check (age>=18),
email varchar(50) unique,
salary decimal default(30000)
);

# 2 Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints
# ans constaint help in maintaining the data and data type that what type o data should be fll in pertcular column 
# example 
create table employees
(emp_id varchar(6) primary key,
emp_name varchar(30) not null,
age int check (age>=18),
email varchar(50) unique,
salary decimal default(30000)
);

#3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
# we apply not null constraint to a column to ensure that any colun  should not be empty or null 
# in primary key it is consist of both not null and unique contraint 

/*4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint.*/

# to add constraint 
alter table employees add COLUMN CONSTRAINT_EX VARCHAR(20); 
alter table employees add constraint unique (constraint_ex);
# ro remove contraint  use drop
alter table employees drop constraint  constraint_ex;

/*5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.*/

/* ans  constraint in sql are rule enforced on data to ensure intregity, if we try to insert ,update or delete that violate a constraint the databasse will 
reject the operation
in primany key u have to give unique andnot null value , in not nullvalue should not be empty
in check the data should pass the condition , in unique value or data must be diff from each other */

/* You created a products table without constraints as follows:
CREATE TABLE products (
product_id INT,    product_name VARCHAR(50),
price DECIMAL(10, 2));
Now, you realise that?
: The product_id should be a primary keyQ
: The price should have a default value of 50.00*/
use company;
CREATE TABLE products (
product_id INT,    product_name VARCHAR(50),
price DECIMAL(10, 2));

# modification 
alter table products add constraint  primary key (product_id);
alter table products alter column price set default 50 ;

#7. You have two tables: Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

select student.student_id,student.student_name,classes.class_name from students
inner join classes on student.classs_id=classes.class_id;

#8.  Consider the following three tables: Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
#listed even if they are not associated with an order 

select orders.order_id,customers.customer_name,product.product_name
from products
left join orders on product.product_id=orders.product_id
left join customer on orders.customer_id=customer.customer_id;

#9 Given the following tables: Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
use company;
create table sales 
(sale_id varchar(20) , product_id varchar(20),amount int);
insert into sales value ('1','101',500),('2','102','300'),('3','101',700);
create table productsss
(product_id varchar(20),product_name varchar(20));
insert into productsss value ('101','laptop'),('102','phone');
select productsss.product_name ,sum(amount)  as total_sum from sales 
inner join productsss on sales.product_id=productsss.product_id 
group by productsss.product_id,productsss.product_name;

#### SQL COMMANDS 
#1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
# list all detail of actors
select * from actor;
# 3  -List all customer information from DB.
select * from customer;

# 4 -List different countries.
select country_id,country from country;

#5 -Display all active customers.
select * from customer
where active=1;

#6 -List of all rental IDs for customer with ID 1
select rental_id ,customer_id from rental
where customer_id=1;

#7 - Display all the films whose rental duration is greater than 5 .
SELECT * , day(return_date)-day(rental_date) FROM RENTAL
where day(return_date)-day(rental_date)>5;

#
/*GROUP BY:
Question 5:
Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
Hint: Use COUNT () in conjunction with GROUP BY.*/

use sakila;
select customer_id,count(rental_id) as rental_count
from rental group by customer_id;
select * from payment
;
/*Question 6:

Find the total revenue generated by each store.*/
SELECT staff_id,count(staff_id),sum(amount) from payment 
group by staff_id;

/*