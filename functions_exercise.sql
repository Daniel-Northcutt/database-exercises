-- Functions_exercise.sql

-- 1. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

SELECT concat(first_name, ' ' , last_name) as full_name
FROM employees
WHERE first_name LIKE 'E%e';

-- 2. Convert the names produced in your last query to all uppercase.

SELECT UPPER(CONCAT(first_name, ' ', last_name)) as full_name
FROM employees
WHERE first_name LIKE 'E%e';

-- 3. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT first_name, last_name, DATEDIFF (NOW(), hire_date) AS 'Days_Working_With_Company'
FROM employees
WHERE YEAR(hire_date) LIKE '199%'
	AND birth_date LIKE '%-12-25';


-- 4. Find the smallest and largest current salary from the salaries table.

SELECT MAX(salary) FROM salaries;
-- 158220

SELECT MIN(salary) FROM salaries;
-- 38623

SELECT min(salary), max(salary)
FROM salaries
WHERE to_date > curdate();

-- 5. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:


SELECT lower(
CONCAT((SUBSTR(first_name, 1, 1)), (SUBSTR(last_name, 1, 4)), "_", (SUBSTR(birth_date, 6,2)), (SUBSTR(birth_date, 3, 2 )))) AS username,
first_name, last_name, birth_date
FROM employees
LIMIT 10;


-- ########################################################

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- Irena Reutenauer
-- Vidya Simmen
-- Ask if it defaulted by emp_no


-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
-- Irena Acton
-- Vidya Zweizig


-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

-- Irena Acton
-- Maya Zyda


-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
SELECT *
FROM employees
WHERE last_name LIKE 'e%' and last_name LIKE '%e'
ORDER BY emp_no;
-- 899
-- 10021 Ramzi Erde
-- 499648 Tadahiro Erde


-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.
SELECT *
FROM employees
WHERE last_name LIKE 'e%' and last_name LIKE '%e'
ORDER BY hire_date DESC;

-- 899
-- Teiji Eldridge
-- Sergi Erde


-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.
SELECT *
FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%12-25%'
ORDER BY birth_date, hire_date DESC;


-- #Another way to write, Jeanette offered this code to compare with mine
SELECT birth_date, hire_date, first_name, last_name
FROM employees 
WHERE YEAR(hire_date) LIKE '199%'
	AND birth_date LIKE '%-12-25'
ORDER by birth_date ASC, hire_date DESC;

-- 362 
-- Khun Bernini
-- Douadi Pettis
