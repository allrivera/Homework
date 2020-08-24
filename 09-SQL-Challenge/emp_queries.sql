select
employees.emp_no,
last_name,
first_name,
sex,
salary
from employees
inner join salaries on employees.emp_no=salaries.emp_no;

select last_name, first_name, hire_date from employees
where (hire_date >= '1986-01-01' AND
	  hire_date < '1987-01-01');

select dept_manager.emp_no, departments.dept_name, dept_manager.dept_no,
employees.last_name,
employees.first_name, dept_manager.from_date, dept_manager.to_date
from employees inner join dept_manager on employees.emp_no=dept_manager.emp_no
inner join departments on departments.dept_no=dept_manager.dept_no;

select * from employees
where first_name = 'Hercules' and last_name like 'B%';