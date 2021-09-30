-- temporary_tables.sql

-- 1 a/b.
CREATE TEMPORARY TABLE hopper_1547.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE to_date > curdate();


DESCRIBE employees_with_departments;

-- 1.c
ALTER TABLE employees_with_departments add full_name Varchar(50);
DESCRIBE hopper_1547.employees_with_departments;

ALTER TABLE employees_with_departments set full_name = concat(first_name, " ", last_name);
DESCRIBE hopper_1547.employees_with_departments;

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;
DESCRIBE hopper_1547.employees_with_departments;

-- we could have created 'full_name' from the begining when creating the temporary table

-- 2. Create a temporary table based on the payment table from the sakila database. 
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

CREATE TEMPORARY TABLE hopper_1547.payment_updated AS (
	SELECT payment_id, customer_id, staff_id, rental_id, (amount * 100) as "amount_in_cents", payment_date, 	last_update
	FROM sakila.payment); 
	
SELECT payment_id, customer_id, staff_id, rental_id, (amount * 100) as "amount_in_cents", payment_date, last_update
	FROM sakila.payment; 

-- 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

USE employees;

SELECT dept_name, avg(salary) as department_average_salary
FROM salaries
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE salaries.to_date > curdate() AND dept_emp.to_date > curdate()
GROUP BY dept_name;

-- average salary per current department

SELECT avg(salary)
FROM salaries;
-- 63810.7748 historic avg salary

SELECT ROUND(std(salary),2)
FROM salaries;
-- 16904.83 standard dev


# Create temporary table(s)
CREATE TEMPORARY TABLE hopper_1547.dept_avg_salary AS (
	SELECT dept_name, avg(salary) as department_average_salary
	FROM salaries
	JOIN dept_emp USING (emp_no)
	JOIN departments USING (dept_no)
	WHERE salaries.to_date > curdate() AND dept_emp.to_date > curdate()
	GROUP BY dept_name);
	
DESCRIBE hopper_1547.dept_avg_salary;

SELECT * FROM hopper_1547.dept_avg_salary; 

## ALTER/UPDATE TEMP TABLE BY ADDING COLUMNS IS WHAT I MISSED IN MY CODE BEFORE REVIEW ##

ALTER TABLE hopper_1547.dept_avg_salary add column historic_avg_salary FLOAT(10, 2);
ALTER TABLE hopper_1547.dept_avg_salary add column std_dev_salary FLOAT(10, 2);
ALTER TABLE hopper_1547.dept_avg_salary add column zscore FLOAT(10, 2);

SELECT * FROM hopper_1547.dept_avg_salary;

-- checks for added columns, values = NULL

UPDATE hopper_1547.dept_avg_salary
SET historic_avg_salary =  (SELECT avg(salary)
FROM salaries);

UPDATE hopper_1547.dept_avg_salary
SET std_dev_salary = (SELECT ROUND(std(salary),2)
FROM salaries);

UPDATE hopper_1547.dept_avg_salary
SET zscore = ((department_average_salary - historic_avg_salary) / (std_dev_salary));

SELECT * FROM hopper_1547.dept_avg_salary;
--


#### My initial code was not adding columns onto the temp table but rather manually inputing the code as set values determined from deriving the values from previous queries ###
-- pulled value 63810.74 from historic avg value
-- pulled value 16904.83 from historic stdev value


SELECT dept_name, round(avg(salary), 2) as department_average_salary, '63810.74' AS historic_avg, '16904.83' AS std_dev, ROUND (CONCAT((avg(salary) - 63810.74) / (16904.83)),4) AS 'Z-score'
FROM salaries
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE salaries.to_date > curdate() AND dept_emp.to_date > curdate()
GROUP BY dept_name;