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
	
	-- CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1

	
show create table salaries;
-- shows origin of database


