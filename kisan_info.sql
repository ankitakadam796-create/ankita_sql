use Employee;
create table kisan_info
(id int unique not null ,name varchar(40) unique not null,
email varchar(40) default"dummy@gmail.com",
age int check(age>=18));
desc kisan_info;
select * from kisan_info;

insert into kisan_info values
(101,"ankita","ankita786@gmail.com",21),
(102,"bhagwandas",default,26);
alter table kisan_info modify age int Check (age>=10);
insert into kisan_info values
(103,"mahesh","ankita786@gmail.com",21),
(104,"manisha",default,26);
insert into kisan_info values
(105,"milind",default,26);



insert into kisan_info(id,name,age) values
(106,"srushti",30);
select * from kisan_info;






create table kisan_details(
main_id int unique not null,
id int primary key,
name varchar(40) unique not null,
email varchar(40) unique,
age int);
desc kisan_details;
show create table kisan_info; -- show the all constraints which used in the table
show create table kisan_details;


