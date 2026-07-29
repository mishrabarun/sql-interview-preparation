/*
==========================================================
Day 03 - SQL Subqueries
Author      : Barun Mishra
Repository  : SQL-Interview-Preparation

Topics Covered
--------------
1. Scalar Subquery
2. Multiple Row Subquery
3. IN Operator
4. NOT IN Operator
5. EXISTS
6. NOT EXISTS
7. Interview Questions

==========================================================
*/


/*========================================================
Sample Table
==========================================================*/

-- Employee Table

/*
EmpID | Employee_Name | DeptID | Salary
---------------------------------------
1     | John          | 10     | 50000
2     | David         | 20     | 70000
3     | Alex          | 10     | 60000
4     | Mary          | 30     | 45000
5     | Steve         | 20     | 80000
*/


/*========================================================
What is a Subquery?
==========================================================*/

-- A subquery is a query inside another SQL query.
-- It is executed before the outer query (unless it is correlated).



/*========================================================
Scalar Subquery
Returns only one value.
==========================================================*/

-- Employees earning more than the company average salary.

SELECT *
FROM Employee
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employee
);



/*========================================================
Employees earning less than average salary
==========================================================*/

SELECT *
FROM Employee
WHERE Salary <
(
    SELECT AVG(Salary)
    FROM Employee
);



/*========================================================
Employees earning the maximum salary
==========================================================*/

SELECT *
FROM Employee
WHERE Salary =
(
    SELECT MAX(Salary)
    FROM Employee
);



/*========================================================
Employees earning the minimum salary
==========================================================*/

SELECT *
FROM Employee
WHERE Salary =
(
    SELECT MIN(Salary)
    FROM Employee
);



/*========================================================
IN Operator
==========================================================*/

-- Display employees belonging to departments
-- available in Department table.

SELECT *
FROM Employee
WHERE DeptID IN
(
    SELECT DeptID
    FROM Department
);



/*========================================================
NOT IN Operator
==========================================================*/

-- Display employees whose department
-- does not exist in Department table.

SELECT *
FROM Employee
WHERE DeptID NOT IN
(
    SELECT DeptID
    FROM Department
);



/*========================================================
EXISTS
==========================================================*/

SELECT *
FROM Employee e
WHERE EXISTS
(
    SELECT 1
    FROM Department d
    WHERE d.DeptID = e.DeptID
);



/*========================================================
NOT EXISTS
==========================================================*/

SELECT *
FROM Employee e
WHERE NOT EXISTS
(
    SELECT 1
    FROM Department d
    WHERE d.DeptID = e.DeptID
);



/*========================================================
Business Scenario
==========================================================*/

-- Find employees earning more than
-- the average company salary.

SELECT *
FROM Employee
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employee
);



/*========================================================
Interview Notes
==========================================================*/

-- Scalar Subquery
-- Returns one value.

-- Multiple Row Subquery
-- Returns multiple rows.

-- IN
-- Compares against a list of values.

-- EXISTS
-- Checks whether matching rows exist.

-- NOT EXISTS
-- Returns rows without a matching record.

-- EXISTS is commonly used with correlated subqueries.



/*========================================================
Interview Questions
==========================================================*/

-- Q1. What is a subquery?

-- Q2. Difference between scalar subquery
-- and correlated subquery?

-- Q3. Difference between IN and EXISTS?

-- Q4. Why is NOT EXISTS preferred over
-- NOT IN in some cases?

-- Q5. Can a subquery return multiple rows?

-- Q6. Where can subqueries be used?
-- (SELECT, FROM, WHERE, HAVING)



/*========================================================
Key Takeaways
==========================================================*/

-- A subquery is a query inside another query.

-- Scalar subqueries return one value.

-- IN compares values with a list.

-- EXISTS checks for matching rows.

-- NOT EXISTS is safer than NOT IN when
-- NULL values are present.

-- Subqueries improve readability for
-- many business problems.