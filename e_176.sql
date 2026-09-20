------------------------------------------------------------------
-- 176. Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/description
------------------------------------------------------------------

Select IfnUll(max(salary),null) as SecondHighestSalary
From
    (Select salary, 
        Dense_Rank() Over(Order by salary DESC) as rnk
    From Employee) sub  
where rnk=2;
