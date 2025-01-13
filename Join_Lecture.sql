create database joins;
use joins;
create table employee(id int primary key,fname varchar(20),
email varchar(20),phone_no int,city varchar(50)
);

insert into employee values
(1,'aman','abc',123,'delhi'),
(2,'yug','a',87,'palam'),
(3,'rahul','ef',673,'kolkata'),
(4,'jatin','aghc',987,'raipur'),
(5,'pawan','ijhg',6,'jaipur');


create table project(id int primary key,emp_id int,name varchar(20),
client_id int
);

create table project(id int primary key,emp_id int,name varchar(20),
client_id int,foreign key (emp_id )references employee(id)
, foreign key (client_id) references clientt(id)
);
insert into project values
(1,1,'a',3),
(2,2,'b',1),
(3,3,'c',5),
(4,4,'d',2),
(5,5,'e',4);


create table clientt(id int primary key,fname varchar(20),
email varchar(20),phone_no int,city varchar(50),emp_id int,
foreign key (emp_id) references employee(id)
);
insert into clientt values
(1,'am','abc@',9123,'delhi',3),
(2,'g','@a',879,'palam',3),
(3,'ral','ef@',9673,'kolkata',1),
(4,'tin','aghc@',9987,'hyderabad',5),
(5,'wan','ijhg@',69999,'jaipur',2);



/* now we apply inner join in projects and employee
for employee id,name and project assigned to them */
select e.id,e.fname,p.id,p.name from employee as e
INNER JOIN project as p ON e.id=p.emp_id ;

select * from employee as e
INNER JOIN project as p ON e.id=p.emp_id ;




/* fetch employee id and contact detailwho have been working from jaipur with the clients in hyderabad */
select e.id ,e.phone_no,c.city ,e.city from employee as e
INNER JOIN clientt as c ON e.city='jaipur' AND c.city='palam' ;

select e.id ,e.phone_no,c.city ,e.city from employee as e
INNER JOIN clientt as c ON e.id=c.emp_id where e.city='jaipur' AND c.city='hyderabad' ;



/*fetch out each project allocated to each employee
LEFt JOIN */
select e.id,e.fname,e.email,p.id,p.name from employee as e
LEFT JOIN project as p ON e.id=p.emp_id ;



/*right JOIN */
select e.id,e.fname,e.email,p.id,p.name from employee as e
right JOIN project as p ON e.id=p.emp_id ;




/*cross JOIN */
select * from employee as e
cross JOIN project as p ON e.id=p.emp_id ;