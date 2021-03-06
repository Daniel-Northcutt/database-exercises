-- group_by_exercises

-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

SELECT DISTINCT title, count(title)
FROM titles
GROUP BY title;

-- 7 unique titles

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT CONCAT(first_name, " ", last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY full_name;
-- 899
-- 846 (group by)

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%'
GROUP BY last_name;
-- Chleq, Lindqvist, Qiwen

-- 6.Add a COUNT() to your results (the query above) to find the number of employees with the same last name
SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%'
GROUP BY last_name;


-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those name

SELECT first_name, gender, count(*) as gender_count
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
group by first_name, gender
ORDER BY first_name ASC;

-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT lower(
CONCAT((SUBSTR(first_name, 1, 1)), (SUBSTR(last_name, 1, 4)), "_", (SUBSTR(birth_date, 6,2)), (SUBSTR(birth_date, 3, 2 )))) AS username,
COUNT(*AS) number_of_dup
FROM employees
GROUP BY username
ORDER BY number_of_dup DESC;


-- 9a. Find the historic average salary for all employees. Now determine the current average salary.

SELECT AVG(salary)
FROM salaries;
-- current

SELECT AVG(salary)
FROM salaries
WHERE from_date < NOW();
-- historic

-- 9b. Now find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column.
SELECT emp_no, avg(salary) from salaries
where to_date < curdate()
group by emp_no;


-- 9c. Find the current average salary for each employee.
SELECT emp_no, AVG(salary)
FROM salaries
WHERE to_date > CURDATE()
GROUP BY emp_no;


-- 9d. Find the maximum salary for each current employee.
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;

-- 9e. Now find the max salary for each current employee where that max salary is greater than $150,000.
SELECT emp_no, MAX(Salary) AS highest_salary
FROM salaries
GROUP BY emp_no
HAVING highest_salary > 15000;

-- 9f. Find the current average salary for each employee where that average salary is between $80k and $90k.
SELECT emp_no, AVG(salary) as avg_salary
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 8000 and 90000;
-- HAVING AVG(salary) > 80000 AND AVG(salary) < 90000