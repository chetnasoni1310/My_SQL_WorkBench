create database vieww;
use vieww;

create table employee(id int primary key,fname varchar(20),
email varchar(20),phone_no int,city varchar(50)
);

insert into employee values
(1,'aman','abc',123,'delhi'),
(2,'yug','a',87,'palam'),
(3,'rahul','ef',673,'kolkata'),
(4,'jatin','aghc',987,'raipur'),
(5,'pawan','ijhg',6,'jaipur');
select * from employee;
create view custon_View AS SELECT fname,city FROM employee;


/*VIEWING FROM VIEW*/
select * from custon_View;


ALTER VIEW custon_View AS SELECT phone_no from employee;
