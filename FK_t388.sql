create database FK_t388;
use FK_t388;
create table students
(Id int primary key auto_increment,name varchar(20)); -- auto increment is use for the add number by default like their patterns
insert into students values(1,"ankita");
select * from students;
desc students;
insert into students (name) values("mahesh");


create table info(ID int,scores int,foreign key(ID) references students(Id));
insert into info values(1,300),(2,400);
select * from info;







create database T388_fk_pk;
use T388_fk_pk;
CREATE TABLE Employee ( 
 ID INT PRIMARY KEY, 
 Name VARCHAR(100) NOT NULL, 
 Age INT, 
 Salary DECIMAL(10, 2) 
); 
INSERT INTO Employee (ID, Name, Age, Salary) VALUES 
(101, 'Alice Smith', 29, 75000.00), 
(102, 'Bob Jones', 34, 82000.50), 
(103, 'Charlie Brown', 41, 95000.00), 
(104, 'Diana Prince', 26, 68000.00); 


CREATE TABLE Project ( 
 ProjectID INT PRIMARY KEY, 
 ProjectName VARCHAR(100) NOT NULL, 
 ID INT, 
 FOREIGN KEY (ID) REFERENCES Employee(ID) 
 ON UPDATE CASCADE -- if i update in parent table then automatically changes in the child table
 ON DELETE CASCADE 
);
INSERT INTO Project (ProjectID, ProjectName, ID) VALUES 
(1, 'Website Redesign', 101), 
(2, 'Cloud Migration', 101), 
(3, 'Mobile App Launch', 102), 
(4, 'Data Analytics Pipeline', 103);

select * from Employee;
select * from Project;
update Employee set id=500 where id=101;

