-- where_exercises.sql

USE employees;

-- 2) Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 709 rows

-- 3) Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
-- 709 rows. Yes it matches the same amount of rows from the code in Q2

-- 4) Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
AND gender = 'M';
-- 441 rows

-- 5) Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.

SELECT *
FROM employees
WHERE last_name LIKE 'e%';
-- 7330 rows

-- 6) Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
SELECT *
FROM employees
WHERE last_name LIKE '%e';
-- 24292 names end with e

SELECT *
FROM employees
WHERE last_name LIKE '%e' OR last_name LIKE 'e%';
-- 30723 either start or end with 'e'
-- 30723 - 24292 = 6431


-- 7) Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
SELECT *
FROM employees
WHERE last_name LIKE '%e' AND last_name LIKE 'e%';
-- 899 last names start and end with 'e'

-- 8) Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

SELECT *
FROM employees
WHERE hire_date >= '1990-01-01' AND hire_date <= '1999-12-31';
-- 135214 hired in the 90s

-- 9) Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25%';
-- 842 employees were born on Christmas day

-- 10) Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%12-25%';
-- 362 employees were hired in the 90s whose bday is Christmas

-- 11) Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
SELECT *
FROM employees
WHERE last_name LIKE '%q%';
-- 1873 employees have 'q' in their last name

-- 12) Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%';

-- 547 employees
