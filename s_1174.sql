-----------------------------------------------------------------------
-- 1174. Immediate Food Delivery II
-- https://leetcode.com/problems/immediate-food-delivery-ii/description
-----------------------------------------------------------------------

Select Round(Avg(Case 
                    When datediff(order_date,customer_pref_delivery_date) = 0 Then 1 
                    Else 0 End)*100, 2) as immediate_percentage
From  (Select *, 
        Dense_rank() Over(Partition by customer_id Order by order_date ASC) as rnk
      From  Delivery) sub
Where sub.rnk = 1
