SELECT *
FROM employee;

-- prompts from video
-- 1. Find all employees: list only their forename and surnames
SELECT first_name AS Forename, last_name AS Surname
FROM employee;
-- 2. List the names of all the clients.alter
SELECT client_name 
FROM client;
-- 3. List employees (forename and surname) in decreasing order of salary.
SELECT first_name AS Forename, last_name AS Surname, salary
FROM employee
ORDER BY salary DESC;
-- 4. Find all employees ordered by sex, then name.
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;
-- 5. List the number of distinct branches (use DISTINCT keyword)
SELECT DISTINCT branch_id
FROM employee;
-- COMMON SQL FUNCTIONS--
-- 6. Find the number of employees.
SELECT COUNT(emp_id) -- ensure that primary key is passed to get correct value
FROM employee;
-- 7. Find number of female employees born after 1970.
SELECT COUNT(emp_id)
FROM employee
WHERE sex='F' AND birth_day >'1971-01-01';