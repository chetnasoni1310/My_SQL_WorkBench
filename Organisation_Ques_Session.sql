create database org;
use org;
create table workerr( id int not null primary key 
auto_increment,
fname varchar(20) , salary int, joining datetime ,
 dept varchar(20) );
 
 
insert into workerr values
 (1 ,'Monika',1000,'12-02-20 09:00:00','HR'),
 (2 ,'nihar ',800,'14-02-20 09.00.00','Admin'),
 (3 ,'vishal',300000,'15-06-20 09.00.00','HR'),
 (4 ,'amit ',500000,'11-03-20 09.00.00','Admin'),
 (5 ,'vivek',500000,'18-02-20 09.00.00','Admin'),
 (6 ,'vipul ',20000,'14-02-20 09.00.00','Account'),
 (7 ,'satish ',75000,'14-02-20 09.00.00','Account'),
 (8 ,'geeta ',90000,'14-02-20 09.00.00','Admin');
 
 select *from workerr;
 
 create table bonus(ref_id int,bonus int,b_date date,
 foreign key (ref_id) references workerr(id) ON DELETE CASCADE
 );
 insert into bonus values
 (1,500,'16-02-20'),
 (2,300,'16-06-20'),
 (3,400,'16-02-20'),
 (1,450,'16-06-20'),
 (2,350,'16-02-11');
 
 create table title (ref_id int,title varchar(20),
 foreign key (ref_id) references workerr(id) );
 insert into title values
 (1,' manager'),
 (2,' executive'),
 (8,' executive'),
 (5,'manager '),
 (4,'assist_manager '),
 (7,'executive '),
 (6,'lead '),
 (3,'lead ');
 
 
 /*fetch  fname from worker using alias name as <Worker_Name>*/
 select Worker_Name.fname from workerr as Worker_Name;
 select fname as Worker_Name from workerr;
 
 
 
  /* fetch fname from worker table in uppercase */
  select UPPER(fname) from workerr ;
    select LOWER(fname) from  workerr ;

  
   /* fetch unique valuesof dept from worker table */
   select distinct dept from workerr;
   /* ???????????????????????????????????????? 
   yeh kyun nhichl rha haiiii*/
   /* grp by se krke dekhnaa */
   
   
   
   
    /* fetch  print the first 3 chrtr of fname from worker table*/
     select substring(fname, 1, 3) from workerr;
    /* ???????????????????????????????????????? 
   yeh bhiiiii kyun nhi chl rha haiiii*/
   
   
   
    /* fetch the position if alphabet ('e') in the first name
    column vivek */
    select INSTR(fname,'e') from workerr where fname= 'vivek';
    
    
    /* fetch fname from worker table after removing white spaces from the right side */
    select RTRIM(fname) from workerr;
    
    /* fetch fname from worker table after removing white spaces from the left side */
	select LTRIM(fname) from workerr;
  
    
    
    /* fetch unique value of dept from workerr table and print its length */
    select COUNT(  distinct dept )from workerr ;
   /* yeh alg kaam kr rhe h dono */
    select distinct dept ,LENGTH(dept) from workerr;
    select LENGTH(dept) from workerr;
    
    
    /* fetch fname from workerr after replacing a with A */
    select REPLACE(fname,'a','A') from workerr;
    
    
    
    
    /* fetch fname and id to a single column as Complete_DEtail and with a space separating them*/
    select CONCAT(fname,' ',id) as Complete_Detail from workerr;
    
    
    /* fetch all worker details order by first name  */
    select * from workerr ORDER By fname;
    
    
    
    /* fetch  all worker details order by first name asc and
    dept name desc*/
   select * from workerr ORDER BY  fname ASC, dept DESC;  
    
    
    
    /* fetch worker details with fname as "Vipul " 
    and "Satish" from worker*/
    select * from workerr where fname IN('vipul ' , 'satish ');
    
    
    
    /* fetch  worker details with excluding fname as "Vipul " 
    and "Satish" from worker */
    select * from workerr where fname NOT IN('vipul ' 
    , 'satish ');
    
    
    /* fetch  workerr details dept 'admin' */
    select * from workerr where dept IN('Admin');
    
    
    /* fetch worker details having 'a' in their name */
    select * from workerr where fname LIKE '%a%' ;
    
     /* fetch fname ends with a */
         select * from workerr where fname LIKE '%a' ;

      /* fetch fname ends with h and contains 6 alphabets */
select * from workerr where fname LIKE '_____h_' ;

       /* fetch whose salary lies between 800 to 20,000  */
       select * from workerr where salary between 800 AND 20000;
       
        /* fetch who join in feb 2014 */
      select * from workerr where YEAR(joining)=2014 AND 
      MONTH(joining)=02;
      
         /* fetch count of employee working in dept admin  */
         select dept, COUNT(*) from workerr GROup BY dept;
	select dept, COUNT(*) from workerr where dept='Admin';
          
          
/* fetch worker full name with salaries>=800
and <=20000 */
select CONCAT(fname,' ',id) as Full_Name from workerr  where salary
between 800 AND 20000;
          
	/* fetch no of worker for each dept in desc order */
select dept,COUNT(id) from workerr group by dept 
order by count(id) desc;
select dept,COUNT(id) as Worker_Number from workerr group by dept 
order by Worker_Number desc;


	/* fetch worker details who are managers */
select * from workerr as w inner join title as t on 
w.id=t.ref_id
where 
t.title IN('manager ',' manager');

select w.* from workerr as w inner join title as t on 
w.id=t.ref_id
where 
t.title IN('manager ',' manager');
            
/* fetch number more than 1 of diff titles in the org */
select COUNT(distinct title) from title;
select title, COunt(*) as TOTAL from title group by title
having TOTAL >1; 

          
/* fetch to show only odd rows from a table */
select * from workerr where MOD(id,2)!=0;
select * from workerr where MOD(id,2)<>0;
              
/* fetch only even rows */
select * from workerr where MOD(id,2)=0;            

 /* fetch clone a new table from another table */
create table worker_Clone like workerr;
insert into worker_clone select *from workerr;

/* fetch intersecting records of 2 tables */
select * from workerr as w INNER JOIN title as t ON
w.id=t.ref_id;
select * from workerr as w INNER JOIN bonus as t ON
w.id=t.ref_id;
select w.* from workerr as w inner join worker_clone using
(id);

/* fetch to show records from one table that another 
table doesn't have  */
select * from workerr as w 
left join
worker_clone using (id) 
where worker_clone.id is NULL;


/* fetch to show current date and time */
select curdate();
select now();

/* fetch to show top n(5) records
of a table order by desc salary */
select * from workerr order by salary desc ;
select * from workerr order by salary desc limit 5 ;
select * from workerr order by salary desc limit 1 ;


/* fetch to determine the nth 5th highest salary  */
select * from workerr order by salary desc limit 4,1 ;
/*4th ko chorr kar jo 1st entry h voh dedo */


/* fetch to determine 5th highest salary without using 
limit keyword */
select * from workerr as w1
where 4=
( select count(distinct(w2.salary))
from workerr as w2
where w2.salary>=w1.salary
);


/* fetch  list of emp with same salary*/
select * from workerr as w1,workerr as w2
where w1.salary=w2.salary AND w1.id<>w2.id;

/* fetch to show 2nd highest salary from a table using subquery */
select distinct(salary )from workerr order by 
salary desc limit 1,1;

select max(salary) from workerr
where salary not in
(select max(salary) from workerr);


-- this is not working
-- select salary from workerr as w1
-- where 2=
-- (select distinct(count(w2.salary) )
-- from workerr as w2 
-- where w2.salary>=w1.salary 
-- );


/* fetch to show one row twice in results from a table */
select *from workerr
UNION ALL
select *from workerr ORDER BY id;



/* fetch to list workerr id who doesnt get bonus */
select id from workerr where id not in (select ref_id from 
bonus);



/* fetch the first 50% records from the table */
select *from workerr where id <=(select count(id)/2 from workerr
);


/* fetch the dept that have less than 3 people in it  */
select w.dept,count(dept) from workerr as w group by
dept having count(dept)<3 ;

/* fetch to show all dept along with number of people in there */
 select w.dept,count(dept) from workerr as w group by
dept ;


/* fetch to show last record from a table */
select * from workerr where id=( select max(id) from workerr);

/* fetch first row from a table */
select * from workerr where id=( select min(id) from workerr);

/* fetch the last five records from a table */
select *from workerr order by id;
select *from workerr order by id limit 5;
(select *from workerr order by id desc limit 5);
(select *from workerr order by id desc limit 5) order by id;



/* fetch to print the name of emp having the highest salary
in each dept */
select max(salary) as maxS ,dept from workerr group by dept;

-- ab upar wale ko temp table naam denge
-- fir worker ka dept , uska naam , uski salary ko print krwayenge
-- with inner join to workerr table and above temp table 
-- on      temp dept=workerr dept
-- 		temp salary =workerr salary
        
select w.dept , w.fname , w.salary from 
(select max(salary) as maxS ,dept from workerr group by dept)
 as temp       
 inner join
 workerr as w on
 temp.dept=w.dept
 and
 temp.maxS=w.salary ;



/* fetch 3 max salaries from a table using corelated subQ */
select distinct(w.salary) from workerr as w
where 3>=
(select count(distinct(w2.salary))
from workerr as w2 
where w2.salary>=w.salary ) order by salary desc;


/* fetch 3 min salaries from a table using corelated subQ */
select distinct(w.salary) from workerr as w
where 3>=
(select count(distinct(w2.salary))
from workerr as w2 
where w2.salary<=w.salary ) order by salary ;



/* fetch nth max salary from table */
select distinct(w.salary) from workerr as w
where 3=
(select count(distinct(w2.salary))
from workerr as w2 
where w2.salary>=w.salary ) order by salary;



/* fetch dept along with the total salaries paid for each of 
them */
select dept , salary from workerr group by dept ;

select dept , sum(salary) as total from workerr group by dept;

select dept , sum(salary) as total from workerr group by dept order by
total desc;

/* fetch the name of worker who earn the highest salary */
select fname,salary from workerr where salary in
 (select max(distinct(salary)) from workerr);




create table f51(a int,b int);
insert into f51 values
(1 ,2 ),
( 2, 4),
( 2, 1),
( 3, 2),
( 4, 2),
( 5, 6),
(6 , 5),
(7 , 8);
/* fetch only unique values of a and b pair */

-- method 1 is using joins 
-- sabse pehle dono ko join kro jaha voh
--  reverse pair bna rhe ho 
 

select leftt.* from f51 as leftt 
left join 
f51 as rightt 
ON leftt.a=rightt.b  and leftt.b=rightt.a 
where rightt.a is null OR leftt.a<rightt.a; 



-- using corelated subQ
-- jaise ki hum voh pairs bahar nikaal de jinmai 
-- pairs opp ho rkhe ho 1.a=2.b and 1.b=2.a
-- and jismai 1.a>2.a ho rha ho inko bahar nikaaal do

select * from f51 as p1 where not exists
(select *from f51 as p2 where
p1.a=p2.b and p1.b=p2.a and p1.a>p2.a );










