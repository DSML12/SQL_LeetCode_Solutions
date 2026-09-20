--------------------------------------------------------------
-- 1158. Market Analysis I
-- https://leetcode.com/problems/market-analysis-i/description
--------------------------------------------------------------

With cte AS(
    Select buyer_id, 
      count(*) as orders_in_2019
    From Orders
    Where Year(order_date) = 2019
    Group by buyer_id
)

Select u.user_id as "buyer_id", 
  u.join_date,
  IFNull(b.orders_in_2019, 0) as "orders_in_2019"
From cte b
Right Join Users u
on b.buyer_id = u.user_id;
