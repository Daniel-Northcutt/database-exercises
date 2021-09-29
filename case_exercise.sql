-- case_exercises.sql

-- 1.Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

 -- emp_no, dept_no, start_date, end_date, + new column 'is_current_employee

SELECT emp_no, dept_no, from_date as 'start_date', to_date as 'end_date',
IF (to_date < curdate(), 1, 0) AS is_current_employee
FROM dept_emp;

SELECT emp_no,
	dept_no,
	from_date,
	to_date,
	IF (to_date = '9999-01-01', 1, 0) AS is_current_employee
FROM dept_emp;

-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT first_name,
	CASE 
	WHEN last_name LIKE ('%a', '%b')  THEN 'A-B'
	ELSE 'B'
	END AS alpha_group
FROM employees;

--
SELECT concat(first_name, " ", last_name) as employee_name,
	CASE
		WHEN LEFT(last_name, 1) IN ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN 'A-H'
		WHEN LEFT(last_name, 1) IN ('i', 'j','k', 'l', 'm', 'n', 'o', 'p', 'q') THEN 'I-Q'
		ELSE 'R-Z'
	END AS Alpha_Group
FROM employees;

-- 3. How many employees (current or previous) were born in each decade?
SELECT *
FROM employees
ORDER BY birth_date;
-- 300024 entries from 1952 - 1965
-- used ASC/DESC to see range

SELECT first_name, last_name, birth_date,
	CASE
		WHEN birth_date LIKE '196%' THEN 'Born in 60s'
		WHEN birth_date LIKE '195%' THEN 'Born in 50s'
		ELSE 'Born in ?0s'
	END AS Decade_Of_Birth
FROM employees;


-- BONUS. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT
	CASE
		WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
		WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
		WHEN dept_name IN ('Production', 'Quality Mangement') THEN 'Prod & QM'
		WHEN dept_name IN ('Finance', 'Human Resource') THEN 'Finance & HR'
		ELSE 'Customer Service'
	END AS department_group, 	
		AVG(salary) AS average_salary
FROM salaries
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no) 
WHERE salaries.to_date > curdate()
GROUP BY department_group;





