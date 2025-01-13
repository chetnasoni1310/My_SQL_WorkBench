create database set_op;
use set_op;

create table dept1(emp_id int primary key,name varchar(20),
role varchar(20));

insert into dept1 values
(1,'a','engg'),
(2,'b','salesman'),
(3,'c','manager'),
(4,'d','salesman'),
(5,'e','engg');

create table dept2(emp_id int primary key,name varchar(20)
,role varchar(30));
insert into dept2 values
(3,'c','manager'),
(6,'f','marketing'),
(7,'g','salesman');


/*SET operations
List out all emp of company */
select *from dept1
UNION
select *from dept2;


/*List out all the emp of all dept who work as salesman */
select *from dept1 
UNION
select *from dept2 where role='salesman';

select *from dept1 where role='salesman'
UNION
select *from dept2 where role='salesman';



/*List out all emp who work in all the dept */
select distinct emp_id from dept1 
INNER JOIN 
dept2 using(emp_id) ;



/*List out all emp who work dept1 but not in dept2 */
select dept1.emp_id,dept1.role  from dept1 
LEFT JOIN
dept2 using(emp_id) 
where dept2.emp_id is NULL;




