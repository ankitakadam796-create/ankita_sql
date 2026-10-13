use ankita;
select * from employee;

#partition by (it is used for the grouping)
select EmployeeId, Fullname,Department,Salary ,row_number()over(partition by department) as RankInDepartment
from employee order by department asc;

select EmployeeId, Fullname,Department,Salary ,row_number()over(partition by Salary) as RankInSalary
from employee order by salary asc;

# rank(it is put the rank )
select EmployeeId, Fullname,Department,Salary ,rank()over(order by salary) as RankInSalary
from employee;

#dense_rank
select EmployeeId, Fullname,Department,Salary,dense_rank()over(order by salary) as RankInSalary
from employee;

#sum window  function
select EmployeeId, Fullname,Department,Salary,sum(salary)over(order by department) as total_salary
from employee;





#avg+sum window function
select EmployeeId, Fullname,Department,Salary,avg(salary)over(order by department) as avg_salary ,sum(salary)over(order by department) as total_salary
from employee where gender="male";


#lag function(it is used for the compapre the salary of the previous employee with next employee)
select EmployeeId, Fullname,Department,Salary,lag(Salary,2,0)over( order by salary asc) as PreviousEmployeeSalaryByAge
from employee order by salary;


#diiference of the salary
select EmployeeId, Fullname,Department,Salary,lag(Salary,1,0)over( order by salary asc) as PreviousEmployeeSalary,
(salary-(lag(Salary,1,0)over( order by salary asc))) as salarydiff
from employee order by salary;


#lead
select EmployeeId, Fullname,Department,Salary,lead(Salary,1,0)over( order by salary asc) as PreviousEmployeeSalary
from employee order by salary;

