-- join.example_db


-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.


SELECT dept_name as "Department Name", concat (first_name, " ", last_name) as "Department Manager"
FROM employees
join dept_manager using (emp_no)
join departments using (dept_no)
WHERE dept_manager.to_date > curdate()
ORDER BY dept_name; 

-- Ravinder's Code
Select dept_name as "Department Name", concat (first_name, " ", last_name) as "Department Manager"
FROM employees as e
Join dept_manager dm using(emp_no)
JOIN departments d USING(dept_no)
WHERE dm.to_date > now()
ORDER BY dept_name;

-- 3. Find the name of all departments currently managed by women.

SELECT dept_name as "Department Name", concat (first_name, " ", last_name) as "Department Manager"
FROM employees
join dept_manager using (emp_no)
join departments using (dept_no)
WHERE dept_manager.to_date > curdate() AND gender = "F"
ORDER BY dept_name;

-- 4. Find the current titles of employees currently working in the Customer Service department.


SELECT title, count(title)
FROM titles
JOIN dept_emp using (emp_no)
JOIN departments using (dept_no)
WHERE dept_name = "Customer Service"
AND dept_emp.to_date > curdate()
AND titles.to_date > curdate()
GROUP BY title;

-- Ravinder's Code
SELECT title, count(title)
FROM titles as t
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
WHERE t.to_date > now()
AND de.to_date > now()
AND dept_name LIKE 'Customer%'
GROUP BY title;


-- 5. Find the current salary of all current managers.

SELECT dept_name AS "Department Name", Concat(first_name, " ", last_name) AS "Name", salary
FROM salaries
JOIN employees using (emp_no)
JOIN dept_manager using(emp_no)
JOIN departments using (dept_no)
WHERE dept_manager.to_date > curdate()
AND salaries.to_date > curdate()
ORDER BY dept_name;


-- 6. Find the number of current employees in each department.
SELECT dept_no, dept_name, count(*) as "Num_Employees"
FROM departments
JOIN dept_emp USING (dept_no)
WHERE dept_emp.to_date > curdate()
GROUP BY dept_name
ORDER BY dept_no;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.

SELECT dept_name, AVG(salary) AS average_salary
FROM dept_emp
JOIN departments USING (dept_no)
JOIN salaries USING (emp_no)
WHERE salaries.to_date > curdate()
AND dept_emp.to_date > curdate()
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- 8. Who is the highest paid employee in the Marketing department?


SELECT first_name, last_name, salary
FROM employees
JOIN salaries USING (emp_no)
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE salaries.to_date > curdate()
AND dept_name = "Marketing"
ORDER BY salary DESC
Limit 1;

-- Ravinder's Code
SELECT first_name, last_name, salary
FROM salaries as s
JOIN dept_emp de USING (emp_no)
JOIN departments d USING (dept_no)
JOIN employees as e USING (emp_no)
WHERE s.to_date > now()
WHERE de.to_date > now()
AND dept_name LIKE 'Market%'
Order BY salary DESC
LIMIT 1;

-- 9. Which current department manager has the highest salary?

SELECT first_name, last_name, salary, dept_name
FROM dept_manager
JOIN departments USING (dept_no)
JOIN employees USING (emp_no)
JOIN salaries USING (emp_no)
WHERE salaries.to_date > curdate()
AND dept_manager.to_date > curdate()
ORDER BY salary DESC
LIMIT 1;
