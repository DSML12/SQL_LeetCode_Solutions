------------------------------------------------------------------------------------
-- 570. Managers with at Least 5 Direct Reports
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description
------------------------------------------------------------------------------------

With temp As (
    Select  Count(id) as num_of_reports,
      managerId
    From Employee
    Group by managerId
  )

Select name
From temp t
Join Employee e 
on t.managerId = e.id
where num_of_reports >= 5;
