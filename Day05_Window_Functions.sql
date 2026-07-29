/*
==========================================================
Day 05 - SQL Window Functions
Author      : Barun Mishra
Repository  : SQL-Interview-Preparation

Topics Covered
--------------
1. What are Window Functions?
2. OVER()
3. PARTITION BY
4. ORDER BY in Window Functions
5. ROW_NUMBER()
6. RANK()
7. DENSE_RANK()
8. LEAD()
9. LAG()
10. Running Total
11. Moving Average
12. Interview Questions
13. Practice Problems

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
What is a Window Function?
==========================================================*/

-- Window functions perform calculations across
-- a set of rows while keeping every row visible.

-- Unlike GROUP BY, they do not collapse rows.



/*========================================================
ROW_NUMBER()
==========================================================*/

SELECT
    EmpID,
    Employee_Name,
    DeptID,
    Salary,
    ROW_NUMBER() OVER(ORDER BY Salary DESC) AS Row_Num
FROM Employee;


/*
Expected Output

Steve  -> 1
David  -> 2
Alex   -> 3
James  -> 4
John   -> 5
Mary   -> 6
*/



/*========================================================
ROW_NUMBER() with PARTITION BY
==========================================================*/

SELECT
    EmpID,
    Employee_Name,
    DeptID,
    Salary,
    ROW_NUMBER() OVER(
        PARTITION BY DeptID
        ORDER BY Salary DESC
    ) AS Rank_In_Department
FROM Employee;



/*========================================================
RANK()
==========================================================*/

SELECT
    Employee_Name,
    Salary,
    RANK() OVER(
        ORDER BY Salary DESC
    ) AS Salary_Rank
FROM Employee;


/*
If two employees have the same salary,
both receive the same rank,
and the next rank is skipped.
*/



/*========================================================
DENSE_RANK()
==========================================================*/

SELECT
    Employee_Name,
    Salary,
    DENSE_RANK() OVER(
        ORDER BY Salary DESC
    ) AS Dense_Rank
FROM Employee;


/*
Unlike RANK(),
no rank numbers are skipped.
*/



/*========================================================
Top 2 Highest Salaries in Each Department
==========================================================*/

SELECT *
FROM
(
    SELECT *,
           DENSE_RANK() OVER(
               PARTITION BY DeptID
               ORDER BY Salary DESC
           ) AS SalaryRank
    FROM Employee
) x
WHERE SalaryRank <= 2;



/*========================================================
LEAD()
==========================================================*/

SELECT
    Employee_Name,
    Salary,
    LEAD(Salary) OVER(
        ORDER BY Salary
    ) AS Next_Salary
FROM Employee;


/*
Returns the salary of the next employee.
*/



/*========================================================
LAG()
==========================================================*/

SELECT
    Employee_Name,
    Salary,
    LAG(Salary) OVER(
        ORDER BY Salary
    ) AS Previous_Salary
FROM Employee;


/*
Returns the previous salary.
*/



/*========================================================
Running Total
==========================================================*/

SELECT
    Employee_Name,
    Salary,
    SUM(Salary) OVER(
        ORDER BY Salary
    ) AS Running_Total
FROM Employee;



/*========================================================
Department Wise Running Total
==========================================================*/

SELECT
    Employee_Name,
    DeptID,
    Salary,
    SUM(Salary) OVER(
        PARTITION BY DeptID
        ORDER BY Salary
    ) AS Dept_Total
FROM Employee;



/*========================================================
Moving Average
==========================================================*/

SELECT
    Employee_Name,
    Salary,
    AVG(Salary) OVER(
        ORDER BY Salary
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS Moving_Average
FROM Employee;



/*========================================================
Business Scenarios
==========================================================*/

-- Top 3 customers by revenue

-- Highest sales in each region

-- Monthly sales trend

-- Running revenue

-- Compare current month's sales
-- with previous month

-- Find highest paid employee
-- in every department



/*========================================================
Window Function vs GROUP BY
==========================================================*/

-- GROUP BY
-- Returns one row per group.

-- Window Function
-- Keeps all rows while performing
-- calculations over a group.



/*========================================================
Interview Questions
==========================================================*/

-- Q1. What is a Window Function?

-- Q2. Difference between
-- GROUP BY and Window Function?

-- Q3. Difference between
-- ROW_NUMBER(), RANK(),
-- and DENSE_RANK()?

-- Q4. When should you use
-- PARTITION BY?

-- Q5. Difference between
-- LEAD() and LAG()?

-- Q6. How do you find
-- Top 3 salaries in each department?

-- Q7. How do you calculate
-- a running total?



/*========================================================
Practice Problems
==========================================================*/

-- Easy
-- Rank employees by salary.

-- Easy
-- Find department-wise ranking.

-- Medium
-- Top 2 salaries in each department.

-- Medium
-- Running total of salaries.

-- Medium
-- Previous salary using LAG().

-- Medium
-- Next salary using LEAD().

-- Hard
-- Find employee whose salary
-- increased compared to previous month.

-- Hard
-- Monthly moving average sales.

-- Hard
-- Top 3 customers by region.



/*========================================================
Key Takeaways
==========================================================*/

-- Window Functions do not reduce rows.

-- OVER() defines the window.

-- PARTITION BY creates separate windows.

-- ROW_NUMBER() always generates unique numbers.

-- RANK() skips numbers after ties.

-- DENSE_RANK() does not skip numbers.

-- LEAD() looks ahead.

-- LAG() looks behind.

-- Running totals and moving averages
-- are common interview questions.

==========================================================
End of Day 05
==========================================================