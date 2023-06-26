/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT hire_date, count(emp_no) as "amount"
from "public"."employees"
group by hire_date
order by "amount" desc;

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

SELECT e.emp_no, e.hire_date, count(t.title) as "positions"
FROM employees as e
inner join "public"."titles" as t on t.emp_no = e.emp_no
where extract (year from e.hire_date) > '1991'
group by e.emp_no
order by e.emp_no


/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

SELECT e.emp_no, e.first_name, de.from_date, de.to_date
FROM employees as e
join "public"."dept_emp" as de using(emp_no)
where de.dept_no = 'd005'
group by e.emp_no, de.from_date, de.to_date
order by e.emp_no, de.to_date;
