/*
==========================================
Day 01 - SQL Fundamentals
Author : Barun Mishra
Repository : SQL-Interview-Preparation

Topics Covered
--------------
1. SQL Execution Order
2. WHERE Clause
3. Aggregate Functions
4. GROUP BY
5. HAVING Clause
6. COUNT(*) vs COUNT(column)

==========================================
*/


/*=========================================
1. SQL Execution Order
===========================================

Logical Execution Order

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY

*/


/*=========================================
Sample Table
=========================================*/

-- Employee
-- EmpID | Name | DeptID | Salary

/*
1 | John  | 10 | 50000
2 | David | 20 | 70000
3 | Alex  | 10 | 60000
4 | Mary  | 30 | 45000
5 | Steve | 20 | 80000
*/


/*=========================================
Basic SELECT
=========================================*/

SELECT *
FROM Employee;


/*=========================================
WHERE Clause
Filters rows before grouping
=========================================*/

SELECT *
FROM Employee
WHERE Salary > 60000;


/*=========================================
Aggregate Functions
=========================================*/

SELECT
    COUNT(*) AS TotalEmployees,
    COUNT(Salary) AS EmployeesWithSalary,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AverageSalary,
    MIN(Salary) AS MinimumSalary,
    MAX(Salary) AS MaximumSalary
FROM Employee;


/*=========================================
GROUP BY
Groups similar rows together
=========================================*/

SELECT
    DeptID,
    COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DeptID;


/*=========================================
Average Salary by Department
=========================================*/

SELECT
    DeptID,
    AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DeptID;


/*=========================================
HAVING
Filters groups after GROUP BY
=========================================*/

SELECT
    DeptID,
    AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DeptID
HAVING AVG(Salary) > 60000;


/*=========================================
COUNT(*) vs COUNT(Column)
=========================================*/

-- COUNT(*) counts all rows

SELECT COUNT(*)
FROM Employee;

-- COUNT(Salary) ignores NULL values

SELECT COUNT(Salary)
FROM Employee;


/*=========================================
Interview Notes
=========================================*/

-- WHERE filters rows.
-- HAVING filters groups.

-- GROUP BY reduces rows.
-- ORDER BY sorts the final output.

-- COUNT(*) counts rows.
-- COUNT(Column) ignores NULL values.

-- Remember SQL Execution Order:
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY



/*=========================================
Interview Questions
=========================================*/

-- Q1. Explain SQL Execution Order.

-- Q2. Difference between WHERE and HAVING?

-- Q3. Difference between COUNT(*) and COUNT(column)?

-- Q4. Difference between GROUP BY and ORDER BY?

-- Q5. Why can't aggregate functions be used directly in WHERE?