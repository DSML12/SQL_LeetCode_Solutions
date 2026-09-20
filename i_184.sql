----------------------------------------------------------------------
-- 184. Department Highest Salary
-- https://leetcode.com/problems/department-highest-salary/description
----------------------------------------------------------------------

With ranks As(
     Select name, 
       departmentId, 
       salary,
       Dense_Rank() Over(Partition by departmentId Order by salary DESC) as rank_
    From Employee
), 
  
top_ranks As(
    Select name, 
      departmentId, 
      salary, 
      rank_
    From ranks r 
    Where r.rank_ = 1
)

Select d.name as Department,
  r.name as Employee,
  r.salary
From top_ranks r 
Inner Join Department d 
on r.departmentId = d.id;
