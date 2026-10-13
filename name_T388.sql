use ankita;
SELECT * FROM name_t388;
select * from department_t388;

#inner join
select name_t388.id,name,salary,department,age
from name_t388
join   -- name_t388 is the right table and department_t388 is the left table
department_t388
on name_t388.id=department_t388.id;


#right join
select name_t388.id,name,salary,department,age
from name_t388
right join 
department_t388
on name_t388.id=department_t388.id;


#left join
select name_t388.id,name,salary,department,age
from name_t388
left join 
department_t388
on name_t388.id=department_t388.id;


#full outer join
select name_t388.id,salary,name,department,age from name_t388 left join department_t388 on name_t388.id=department_t388.id
union -- union is used for the full join of right and left join(union all repeat all values)
select name_t388.id,salary,name,department,age from name_t388 right join department_t388 on name_t388.id=department_t388.id;


#self join
select * from t388_joins;
select a.id,a.name,b.name as manager from t388_joins as a
left join
t388_joins as b on b.id=a.manager_id;


#cross join is also known as cardinality join
select * from name_t388;
select * from department_t388 ;
select n.id,n.name,d.department,d.age from name_t388 as n
cross join
department_t388 as d;




#view is permanant and also save in schemas
create view T388_view1 as
select n.id,n.name,d.department,d.age from 
name_t388 as n
cross join
department_t388 as d;
select * from T388_view1;


#cte is temporary 
with t388_cte as(
select n.id,n.name,d.department,d.age from 
name_t388 as n
cross join
department_t388 as d)
select * from T388_view1;

