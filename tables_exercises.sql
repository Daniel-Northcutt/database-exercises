-- shows databases
Show Databases;

-- select specific database - employees
USE employees;

-- List all the tables in the database
SHOW TABLES;

	

-- Which table(s) do you think contain a numeric type column?
	-- dept_emp, dept_manager, employees, salaries, title

-- Which table(s) do you think contain a string type column?
	-- dept_emp, dept_managere, employees, salaries, title

-- Which table(s) do you think contain a date type column?
 	-- departments, dept_emp, dept_manager, employees, title

-- What is the relationship between the employees and the departments tables?
	-- Departments show the division of labor of the company based on the dept name and dept id #
	-- Employees shows specific values with more tables to give more specific data on the employee establishing under their id #
	
	
-- Show the SQL that created the dept_manager table.	
	show create table dept_manager;
	
	
	
show create table salaries;
-- shows origin of database


