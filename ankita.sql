create database ankita;
select database();
show databases;
use ankita;
CREATE TABLE Employee (
EmployeeId INT PRIMARY KEY,
FullName VARCHAR(45) NOT NULL,
Department VARCHAR(45) NOT NULL,
Salary float NOT NULL,
Gender VARCHAR(45) NOT NULL,
Age INT NOT NULL
);
select * from Employee;
insert into employee values
(101,"ankita","it",30000,"f",21);
delete from employee;
use ankita;

