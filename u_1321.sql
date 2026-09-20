--------------------------------------------------------------
-- 1321. Restaurant Growth
-- https://leetcode.com/problems/restaurant-growth/description
-------------------------------------------------------------- 

With cte as (
    Select visited_on, 
      sum(amount) as 'amount'
    From Customer
    Group by visited_on
)

Select visited_on,
  amount,
  average_amount
From (Select visited_on, 
        Sum(amount) Over(Order by visited_on Rows Between 6 PRECEDING And Current Row) As amount,
        Round(Avg(amount) Over(Order by  visited_on Rows Between 6 PRECEDING And Current Row), 2) As average_amount,
        Row_Number() Over(Order by  visited_on ASC) as rnk
      FROM cte) sub
Where rnk >= 7;
