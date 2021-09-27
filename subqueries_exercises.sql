-- subqueries_exercises.sql

# bonus questions still a work in progress

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT concat(first_name, " ", last_name) AS "Employees"
FROM employees
JOIN dept_emp USING (emp_no)
WHERE hire_date IN (SELECT hire_date
	FROM employees
	WHERE emp_no = '101010')
AND dept_emp.to_date > curdate();

-- forgot the current date statement with code and added after review

-- Ravinder's code
SELECT *
FROM employees
JOIN dept_emp USING (emp_no)
WHERE to_date > now() and hire_date IN (
	SELECT hire_date
	FROM employees
	WHERE emp_no = '101010');


-- 2. Find all the titles ever held by all current employees with the first name Aamod
SELECT title
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'aamod')
GROUP BY title;

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

Select emp_no
FROM salaries
WHERE to_date > curdate();

SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN(SELECT emp_no
FROM salaries
WHERE to_date > curdate());


-- Ravinder's code

SELECT *
FROM employees
WHERE emp_no NOT IN ( 
	SELECT emp_no
	FROM dept_emp
	WHERE to_date > now());
	-- 59900



-- 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT first_name, last_name, gender
FROM employees
WHERE emp_no IN (
Select emp_no
FROM dept_manager
WHERE to_date > curdate())
AND gender = 'F';

-- code using joins
SELECT first_name, last_name, gender
FROM dept_manager
JOIN employees USING (emp_no)
WHERE dept_manager.to_date > curdate() AND gender = 'F';

-- Ravinder's Code:
SELECT *
FROM employees
WHERE gender = 'F'
AND emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > now());

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

-- find salary > avg(salary)
-- query employees

SELECT * 
FROM employees
WHERE emp_no IN(
SELECT emp_no
FROM salaries
WHERE salary > (select avg(salary) FROM salaries)
AND to_date > curdate());

-- 154543


SELECT emp_no
FROM salaries 
WHERE salary > '63810'
GROUP BY emp_no;
-- code to check answer


-- Ravinder's Code:
SELECT *
FROM employees
WHERE emp_no IN (
SELECT emp_no
FROM salaries
WHERE salary >
(SELECT avg(salary) FROM salaries)
AND to_date > now());
-- 154543

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?


SELECT count(*)
FROM salaries
WHERE 
salary > (((SELECT max(salary) FROM salaries WHERE to_date > now()) - (SELECT stddev(salary) FROM salaries WHERE to_date > now()))
/ (select count(*) FROM salaries WHERE to_date > now())) * 100;
;

-- See Ravinder's Code as I got the wrong answer & review

######
-- Ravinder's code:
# what is the max current salary:
SELECT max(salary) from salaries where to_date> now();

#what is the 1std for current salary
SELECT std(salary) from salaries where to_date > now();

-- Numerator. Count of current salaries > (Max-1 std). (count = 83)
select count(*)
from salaries
where to_date > now()
and salary > (
(select max(salary) from salaries where to_date > now()) - 
(select std(salary) from salaries where to_date > now())
);


#Demoninator: total current salaries
SELECT count(*)
FROM salaries WHERE to_date > now();

-- What percentage of all salaries is this?
-- SELECT (Numerator)/ (Denominator)
select((select count(*)
from salaries
where to_date > now()
and salary > (
(select max(salary) from salaries where to_date > now()) - 
(select std(salary) from salaries where to_date > now())
))/(select count(*)
from salaries 
where to_date > now())) * 100 as "percentage of salaries within 1 Stdev of Max";


#### Currently working on ####

-- Bonus 1. Find all the department names that currently have female managers.

SELECT dept_name
FROM departments
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_manager
	WHERE emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE gender = 'F')
		;

SELECT dept_name
FROM departments;

-- code via tables
SELECT first_name, last_name, dept_name
FROM dept_manager
JOIN departments USING (dept_no)
JOIN employees USING (emp_no)
WHERE dept_manager.to_date > curdate() AND gender = 'F';

-- Bonus 2. Find the first and last name of the employee with the highest salary.

SELECT first_name, last_name, salary
FROM salaries
JOIN employees USING (emp_no)
WHERE salaries.to_date > curdate()
ORDER BY salary DESC
Limit 1;