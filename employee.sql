

select database(); -- select database
show tables;
use ankita; -- use database

select * from Employee; -- show table

insert into employee values -- insert data
(101,"ankita","it",30000,"Female",21),
(1001,"John Doe","IT",35000,"Male",25), 
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27), 
(1003, 'James Brown', 'Finance', 50000, 'Male', 28), 
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26), 
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25), 
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27), 
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28), 
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28), 
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);

#Delete From Employee where age>25; 
#truncate table Employee;

alter table Employee add location varchar(10) not null;
alter table Employee drop location;
alter table Employee add Bonus float after salary; -- add bonus after salary
alter table Employee drop bonus; -- drop the column from the table
alter table Employee add title varchar(5) first; -- add the new column to the table 
desc Employee; -- this is for describe the table
alter table Employee modify fullname varchar(35); -- modify the table data
alter table Employee change column location address varchar(36); -- change the location column into address column

select * from Employee;
update Employee set address="Thane"; -- update data address by using set(it bydefault add thane to entier address column)
update Employee set address="Dombivli" where Department="it"; -- by using where statement
update Employee set Title="Mr" where Gender="Male"; -- by using where statement
update Employee set Title="Mrs" where Gender="FeMale"; -- by using where statement
update Employee set bonus=salary*0.05; -- bonus=(salary*0.05)


select distinct Department from Employee; -- it is used for the show the department
select * from employee where department="it";
select * from employee where department="it" or Department= "Hr"; -- filter it and hr department by using (OR operator)
select * from employee where department in ("it","finance"); -- filter it and hr department by using (IN operator)

select * from employee;
select age from employee where EmployeeId in(1001,1004);
select * from employee where age in (select age from employee where EmployeeId in(1001,1004));
select distinct salary from employee;
#any operator
select * from employee where salary<any(select salary from employee where EmployeeId between 1001 and 1003); -- any operator work like or operator
#all operator
select * from employee where salary<all(select salary from employee where EmployeeId between 1001 and 1003); -- all operator work like and operator it returns the greatest value



-- order by (descending) 
select fullname,Department from employee order by age desc;

#order by (ascending)
select fullname,Department from employee order by salary asc;

#and operator
select * from employee where age>26 and salary>30000 and Gender='male';

#or operator
select * from employee where age>26 or salary>50000;

#between
select * from employee where age between 25 and 26;

#in
select * from employee where salary in(50000,80000);

#like (%)
select * from employee where fullname like 'j%';

#like(_)
select * from employee where fullname like 'an____';

#limit
select * from employee where age>25 limit 5;

#offset
select * from employee where age>25 limit 5 offset 5;

#group by
select department from employee group by department;

#sum
select  sum(salary)over( partition by department='it')as total_salary from employee;

#average

#minimum
select  min(salary) over() from employee where Department='it';

#maximum
select  max(salary) over() from employee where Department='it';

#count
select count(salary)over(partition by salary>30000 ) from employee;
select * from employee;

#substr
select substr('ankita',2,6);
#instr()
select instr('jirarice','rice');
#concatenation
select concat('ankita',' ','kadam');
#length
select length('ankita');
# replace
select replace('i love sql','sql','java');

# math prowess
#max
#select  max(salary) over()where salary>50000 from employee;
#abs
select fullname,abs(salary)from employee;
#round
select fullname,department,round(salary,3)from employee;
select round(123.45656,3);
#power
select power(2,3);
#sqrt
select sqrt(16);

#date and time
select now();
#dateformat
select date_format(now(),'%y-%m-%d');
select date_format(now(),'%h-%i-%s');  -- i for the minutes
select date_format(now(),'%d-%m-%y %h-%i-%s');
select date_add(now(),interval 30 day) ; -- add 30 days to the current days and return the output
select date_sub(now(),interval 5 day); -- sub 5 days to the current days and return the output
select datediff(now(),'2004,11,18');








#practice questions

