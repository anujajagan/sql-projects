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
-- 8. Find the average employee salary. 
SELECT AVG(salary)
FROM employee;
-- 9. Find the average male and female salary.
SELECT AVG(salary),sex -- example of aggregation
FROM employee
GROUP BY sex;
-- 10. Find the total sales by each salesman
SELECT sum(total_sales), emp_id
FROM works_with
GROUP BY emp_id;
-- 11. Which clients had maximum business with the company?
SELECT sum(total_sales), client_id
FROM works_with
GROUP BY client_id 
ORDER BY sum(total_sales) DESC;
--  USING WILDCARDS
-- 12. Find all clients that are LLC.
SELECT *
FROM client
WHERE client_name LIKE '%LLC';
-- 13. Find any branch suppliers that are in the label business.
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '%label%';
-- 14. Find any employee born in October.
SELECT *
FROM employee
WHERE birth_day LIKE '____-10%';