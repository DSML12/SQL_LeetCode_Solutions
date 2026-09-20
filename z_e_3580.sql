----------------------------------------------------------------------------------
-- 3580. Find Consistently Improving Employees
-- https://leetcode.com/problems/find-consistently-improving-employees/description
----------------------------------------------------------------------------------

With filtered As (
    Select *
    From (
        Select *,
          Row_Number() Over(Partition By employee_id Order By review_date DESC) As recency 
        From performance_reviews
        Where employee_id In (
            Select employee_id
            From performance_reviews
            Group By employee_id
            Having Count(rating) >= 3)
    ) s
    Where recency <= 3
)

Select 
    s.employee_id,
    e.name,
    s.rating_2 - s.rating As improvement_score
From (
    Select 
        recency,
        employee_id,
        rating,
        Lag(rating, 1) Over(Partition By employee_id Order By recency ASC) As rating_1,
        Lag(rating, 2) Over(Partition By employee_id Order By recency ASC) As rating_2
    From filtered
) s
Join employees e 
on s.employee_id = e.employee_id
Where recency = 3 
  And rating < rating_1 
  And rating_1 < rating_2
Order by 3 DESC, 2 ASC;

