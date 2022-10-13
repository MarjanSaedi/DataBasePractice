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
 