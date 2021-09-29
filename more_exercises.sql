-- more_exercises.sql

USE employees;

-- How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?

-- current manager salary
SELECT dept_name, salary
FROM salaries
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
JOIN dept_manager USING (emp_no)
Where salaries.to_date > curdate() AND dept_manager.to_date > curdate()
ORDER BY dept_name;

-- average current employee salary
SELECT dept_name, avg(salary)
FROM salaries
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE salaries.to_date > curdate() AND dept_emp.to_date > curdate()
GROUP BY dept_name
ORDER BY dept_name
Limit 100;

# The average employee salary for Customer Service and Production is greater than the manager's salary

-- 2. What languages are spoken in Santa Monica?

SELECT Language, Percentage
FROM country AS c
JOIN countrylanguage AS cl ON c.Code = cl.CountryCode
Group by ;


SELECT Name, Language, Percentage
FROM countrylanguage
JOIN city using (CountryCode)
WHERE Name = 'Santa Monica'
ORDER BY Percentage
;


-- 3. How many different countries are in each region?
-- columns : region & num_countries
-- define countries within region as value
-- tables: country (only?)


SELECT Region, Count(Code) as num_countries
FROM country
Group by region
ORDER BY num_countries;

-- 4. What is the population for each region?

SELECT Region, SUM(population) as total_population
FROM country
GROUP BY Region
ORDER BY total_population DESC;

-- 5. What is the population for each continent?

SELECT Continent, SUM(population) as population
FROM country
GROUP BY Continent
ORDER BY population DESC;

-- 6. What is the average life expectancy globally?

SELECT avg(LifeExpectancy)
FROM country;

-- 7. What is the average life expectancy for each region, each continent? Sort the results from shortest to longest

SELECT continent, AVG(LifeExpectancy) as life_expectancy
FROM country
GROUP BY continent
ORDER BY life_expectancy;

SELECT Region, AVG(LifeExpectancy) as life_expectancy
FROM country
GROUP BY region
ORDER BY life_expectancy;

-- Bonus 1. Find all the countries whose local name is different from the official name

SELECT Name, LocalName
FROM country
WHERE NAME != LocalName;
