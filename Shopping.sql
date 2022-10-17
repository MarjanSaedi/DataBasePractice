create database Shop;
use Shop;
select database();
create table customers (
	id int auto_increment primary key,
    fname varchar(100),
    lname varchar(100),
    email varchar(100)
);

create table orders(
	id int auto_increment primary key,
    order_date date,
    amount decimal(8,2),
    customer_id int,
    foreign key(customer_id) references customers(id)
);
show table;
select * from customers;
select * from orders;

INSERT INTO customers (fname, lname, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
 
 select * from customers, orders
	where customers.id = orders.customer_id;
    
select * from customers join orders on
	customers.id = orders.customer_id;
    
select * from customers join orders on
	customers.id = orders.customer_id 
    order by amount;
 
select 
fname,
lname,
order_date,
sum(amount) as total_spent
from customers join orders on
	customers.id = orders.customer_id 
group by orders.customer_id
order by total_spent;

select 
fname,
lname,
order_date,
amount
from customers left join orders on
	customers.id = orders.customer_id ;
    
select 
fname,
lname,
ifnull(sum(amount),0) as total_spent
from customers left join orders on
	customers.id = orders.customer_id 
group by orders.customer_id;

##left join
select 
fname,
lname,
ifnull(sum(amount),0) as total_spent
from customers left join orders on
	customers.id = orders.customer_id 
group by orders.customer_id
order by total_spent;

##Right join
select 
*
from customers right join orders on
	customers.id = orders.customer_id ;
    
#delete on cascade
drop tables customers, orders;
create table customers (
	id int auto_increment primary key,
    fname varchar(100),
    lname varchar(100),
    email varchar(100)
);
create table orders(
	id int auto_increment primary key,
    order_date date,
    amount decimal(8,2),
    customer_id int,
    foreign key(customer_id) references customers(id)
    on delete cascade
);
INSERT INTO customers (fname, lname, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
	delete from customers where fname = 'Boy';
    select * from orders;
    
## School Database

create database School;
use School;
select database();
create table students (
id int auto_increment primary key,
first_name varchar(100));

CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) 
        REFERENCES students(id)
        ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select first_name, title, grade from students left join papers on
students.id = papers.student_id;

select first_name,
ifnull(title, 'missing'),
ifnull(grade, 0)
from students left join papers on
students.id = papers.student_id;

select first_name,
ifnull(avg(grade),0) as 'average'
from students left join papers on
students.id = papers.student_id
group by students.id
order by average desc;

select first_name,
ifnull(avg(grade),0) as 'average',
case when avg(grade) > 80 then 'passed'
else 'failed'
end as 'pass_status' 
from students left join papers on
students.id = papers.student_id
group by students.id
order by average desc;