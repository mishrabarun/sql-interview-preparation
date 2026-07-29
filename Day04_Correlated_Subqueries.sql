/*
==========================================================
Day 04 - Correlated Subqueries
Author      : Barun Mishra
Repository  : SQL-Interview-Preparation

Topics Covered
--------------
1. What is a Correlated Subquery?
2. How Correlated Subqueries Work
3. Average Salary by Department
4. Highest Paid Employee in Each Department
5. EXISTS vs Correlated Subquery
6. Correlated Subquery vs JOIN
7. Interview Questions
8. Practice Problems

==========================================================
*/


/*========================================================
Sample Employee Table
==========================================================*/

/*
EmpID | Employee_Name | DeptID | Salary
---------------------------------------
1     | John          | 10     | 50000
2     | David         | 20     | 70000
3     | Alex          | 10     | 60000
4     | Mary          | 30     | 45000
5     | Steve         | 20     | 80000
6     | James         | 30     | 55000
*/


/*========================================================
What is a Correlated Subquery?
==========================================================*/

-- A correlated subquery is a subquery that
-- depends on values from the outer query.

-- The inner query executes once for every row
-- returned by the outer query.



/*========================================================
Example 1
Employees earning more than the average salary
of their own department.
==========================================================*/

SELECT *
FROM Employee e
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employee
    WHERE DeptID = e.DeptID
);


/*
Expected Output

EmpID | Employee_Name | DeptID | Salary
---------------------------------------
3     | Alex          | 10     | 60000
5     | Steve         | 20     | 80000
6     | James         | 30     | 55000
*/



/*========================================================
Example 2
Highest Paid Employee in Each Department
==========================================================*/

SELECT *
FROM Employee e
WHERE Salary =
(
    SELECT MAX(Salary)
    FROM Employee e2
    WHERE e2.DeptID = e.DeptID
);


/*
Expected Output

John's department -> Alex
David's department -> Steve
Mary's department -> James
*/



/*========================================================
Example 3
Lowest Paid Employee in Each Department
==========================================================*/

SELECT *
FROM Employee e
WHERE Salary =
(
    SELECT MIN(Salary)
    FROM Employee e2
    WHERE e2.DeptID = e.DeptID
);



/*========================================================
Example 4
Employees earning above department average
==========================================================*/

SELECT
    Employee_Name,
    DeptID,
    Salary
FROM Employee e
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employee e2
    WHERE e2.DeptID = e.DeptID
);



/*========================================================
EXISTS with Correlated Subquery
==========================================================*/

SELECT *
FROM Department d
WHERE EXISTS
(
    SELECT 1
    FROM Employee e
    WHERE e.DeptID = d.DeptID
);


/*
Returns only departments that have employees.
*/



/*========================================================
NOT EXISTS
==========================================================*/

SELECT *
FROM Department d
WHERE NOT EXISTS
(
    SELECT 1
    FROM Employee e
    WHERE e.DeptID = d.DeptID
);


/*
Returns departments with no employees.
*/



/*========================================================
Correlated Subquery vs JOIN
==========================================================*/

-- Correlated Subquery
-- Executes once for every outer row.

-- JOIN
-- Combines rows from two tables.

-- JOIN is generally faster on large datasets,
-- but correlated subqueries are often easier
-- to understand for row-by-row logic.



/*========================================================
Business Scenario (Cisco Inspired)
==========================================================*/

-- Find users who have more access
-- than the average number of users
-- in their own Business Unit.

-- Correlated subqueries are useful
-- for department-wise, region-wise,
-- customer-wise comparisons.



/*========================================================
Performance Notes
==========================================================*/

-- Scalar Subquery
-- Executes once.

-- Correlated Subquery
-- Executes once for each row in the outer query.

-- On very large datasets,
-- JOIN or Window Functions
-- may provide better performance.



/*========================================================
Interview Questions
==========================================================*/

-- Q1. What is a correlated subquery?

-- Q2. Difference between
-- correlated and scalar subqueries?

-- Q3. Why does a correlated subquery
-- execute multiple times?

-- Q4. Can correlated subqueries
-- be replaced with JOIN?

-- Q5. Which performs better?
-- JOIN or Correlated Subquery?

-- Q6. Difference between EXISTS
-- and IN?

-- Q7. Why is EXISTS commonly used
-- with correlated subqueries?



/*========================================================
Practice Problems
==========================================================*/

-- Easy
-- Find employees earning above
-- department average salary.

-- Medium
-- Find highest-paid employee
-- in every department.

-- Medium
-- Find lowest-paid employee
-- in every department.

-- Hard
-- Find employees earning more
-- than their manager.

-- Hard
-- Find customers whose order total
-- is greater than the average order
-- of customers in their own region.



/*========================================================
Key Takeaways
==========================================================*/

-- Correlated subqueries reference
-- the outer query.

-- They execute once for every row
-- in the outer query.

-- Useful for group-wise comparisons.

-- EXISTS is commonly paired with
-- correlated subqueries.

-- JOINs are usually more efficient
-- for large datasets.

-- Window Functions can often replace
-- correlated subqueries for ranking
-- and aggregate comparisons.

==========================================================
End of Day 04
==========================================================