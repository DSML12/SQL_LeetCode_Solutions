----------------------------------------------------------------
-- 180. Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/description
----------------------------------------------------------------

With cte As (
    Select
        id,
        num,
        lag(num) Over(Order by id ASC) as lag_1
    From Logs
),

cumsum As (
    Select
        num,
        sum(Case When num = lag_1 Then 0 
                Else 1 End) Over(Order by id ASC) as cum_sum 
    From cte
)

Select Distinct num as 'ConsecutiveNums'
From cumsum
Group by cum_sum
Having count(*) >= 3;
