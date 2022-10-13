create database Tshirt;
use Tshirt;
select database();
create table shirt (id int not null auto_increment primary key,
	article varchar(50) not null, color varchar(20) not null,
    shirt_size varchar(5), last_worn int not null);
    
INSERT INTO shirt(article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
 
 desc shirt;
 select * from shirt;
 update shirt set shirt_size = 'xs', color = 'off white' where color = 'white';
 delete from shirt where last_worn >= 200;