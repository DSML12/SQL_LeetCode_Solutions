--------------------------------------------------------------------
-- 1907. Count Salary Categories
-- https://leetcode.com/problems/count-salary-categories/description
--------------------------------------------------------------------

With cte As (
  Select
    Sum(Case When income < 20000 Then 1 Else 0 End) As low_salary,
    Sum(Case When income Between 20000 And 50000 Then 1 Else 0 End) As average_salary,
    Sum(Case When income > 50000 Then 1 Else 0 End) As high_salary
  From Accounts
)

Select 'Low Salary' As category, 
  low_salary As accounts_count
From cte

Union All

Select 'Average Salary', 
  average_salary
From cte

Union All

Select 'High Salary', 
  high_salary
From cte;
