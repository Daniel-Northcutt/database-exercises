
-- LIMIT EXERCISE

-- limit_exercises.sql


-- 2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:

SELECT DISTINCT title FROM titles;
-- Senior Engineer, Staff, Engineer, Senior Staff, Assistant Engineer, Technique Leader, Manager

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;
/* Zykh
Zyda
Zwicker
Zweizig
Zumaque
Zultner
Zucker
Zuberek
Zschoche
Zongker*/

-- 3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
SELECT first_name, last_name, emp_no
FROM employees 
WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25'
ORDER by hire_date
Limit 5;

/*Alselm	Cappello	243297
Utz	Mandell	34335
Bouchung	Schreiter	400710
Baocai	Kushner	465730
Petter	Stroustrup	490744*/


-- 4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.

SELECT first_name, last_name, emp_no
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;

/* Pranay	Narwekar	463558
Marjo	Farrow	444269
Ennio	Karcich	291662
Dines	Lubachevsky	413687
Ipke	Fontan	416525*/


-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?

-- Limit is set to 5 so each page would represent 5 entries, you would offset the value of 5 to each page. Ex: offset 10 = Page 3 with entries of 11-15
