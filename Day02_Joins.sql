/*
==========================================================
Day 02 - SQL JOINS
Author      : Barun Mishra
Repository  : SQL-Interview-Preparation
--git test
Topics Covered
--------------
1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. FULL OUTER JOIN
5. CROSS JOIN
6. SELF JOIN
7. JOIN Interview Questions

==========================================================
*/


/*========================================================
Sample Tables
==========================================================*/

-- Employee Table

/*
EmpID | Employee_Name | DeptID | Salary
---------------------------------------
1     | John          | 10     | 50000
2     | David         | 20     | 70000
3     | Alex          | 30     | 60000
4     | Mary          | 40     | 45000
*/


-- Department Table

/*
DeptID | Department_Name
------------------------
10     | IT
20     | HR
30     | Finance
*/


/*========================================================
INNER JOIN
Returns only matching records from both tables.
==========================================================*/

SELECT
    e.EmpID,
    e.Employee_Name,
    d.Department_Name
FROM Employee e
INNER JOIN Department d
ON e.DeptID = d.DeptID;


/*========================================================
LEFT JOIN
Returns all rows from the left table and matching rows
from the right table.
==========================================================*/

SELECT
    e.EmpID,
    e.Employee_Name,
    d.Department_Name
FROM Employee e
LEFT JOIN Department d
ON e.DeptID = d.DeptID;


/*========================================================
RIGHT JOIN
Returns all rows from the right table and matching rows
from the left table.
==========================================================*/

SELECT
    e.EmpID,
    e.Employee_Name,
    d.Department_Name
FROM Employee e
RIGHT JOIN Department d
ON e.DeptID = d.DeptID;


/*========================================================
FULL OUTER JOIN
Returns all matching and non-matching rows from both tables.
==========================================================*/

SELECT
    e.EmpID,
    e.Employee_Name,
    d.Department_Name
FROM Employee e
FULL OUTER JOIN Department d
ON e.DeptID = d.DeptID;


/*========================================================
CROSS JOIN
Returns every possible combination of rows.
==========================================================*/

SELECT
    e.Employee_Name,
    d.Department_Name
FROM Employee e
CROSS JOIN Department d;


/*========================================================
SELF JOIN
Used to join a table with itself.

Example:
Employee -> Manager
==========================================================*/

-- Employee Table

/*
EmpID | Employee_Name | ManagerID
---------------------------------
1     | John          | NULL
2     | David         | 1
3     | Alex          | 1
4     | Mary          | 2
*/

SELECT
    e.Employee_Name AS Employee,
    m.Employee_Name AS Manager
FROM Employee e
LEFT JOIN Employee m
ON e.ManagerID = m.EmpID;


/*========================================================
Business Scenario
==========================================================*/

-- Find employees along with their department names.

SELECT
    e.Employee_Name,
    d.Department_Name
FROM Employee e
INNER JOIN Department d
ON e.DeptID = d.DeptID;


/*========================================================
Interview Notes
==========================================================*/

-- INNER JOIN
-- Returns only matching records.

-- LEFT JOIN
-- Returns all rows from the left table.

-- RIGHT JOIN
-- Returns all rows from the right table.

-- FULL OUTER JOIN
-- Returns all matching and non-matching rows.

-- CROSS JOIN
-- Returns Cartesian Product.

-- SELF JOIN
-- Joins a table with itself.


/*========================================================
Interview Questions
==========================================================*/

-- Q1. Difference between INNER JOIN and LEFT JOIN?

-- Q2. What happens if there is no matching record in LEFT JOIN?

-- Q3. What is a Cartesian Product?

-- Q4. Difference between CROSS JOIN and SELF JOIN?

-- Q5. Can SELF JOIN be performed on different tables?

-- Q6. Explain a real-time scenario where SELF JOIN is useful.

-- Q7. Which JOIN is most commonly used in Data Analytics projects?


/*========================================================
Key Takeaways
==========================================================*/

-- JOIN combines data from multiple tables.

-- LEFT JOIN is widely used in reporting and analytics.

-- SELF JOIN is useful for hierarchical data
   (Employee -> Manager).

-- CROSS JOIN should be used carefully because
   it can generate a very large number of rows.

-- Always define the JOIN condition correctly
   to avoid incorrect results.