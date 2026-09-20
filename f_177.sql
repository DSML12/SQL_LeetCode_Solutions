---------------------------------------------------------------
-- 177. Nth Highest Salary
-- https://leetcode.com/problems/nth-highest-salary/description
---------------------------------------------------------------

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      Select Distinct(salary)
      From
      (Select salary, Dense_rank() over(order by salary DESC) as rnk
      From Employee) s
      where rnk = N
  );
END
