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