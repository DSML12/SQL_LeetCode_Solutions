-------------------------------------------------------------------------------
-- 3554. Find Category Recommendation Pairs
-- https://leetcode.com/problems/find-category-recommendation-pairs/description
-------------------------------------------------------------------------------

With users_both As(
    Select i.product_id, 
      p.user_id, 
      i.category
    From ProductPurchases p
    Inner Join ProductInfo i
    on p.product_id = i.product_id
), 
  
temp As (
    Select u.category as category_1, 
      u_2.category as category_2, 
      u.user_id
    From users_both u
    Inner Join users_both u_2
    On u.user_id = u_2.user_id 
      AND u.category <> u_2.category
      And u.category < u_2.category)

Select category_1 as category1, 
  category_2 as category2, 
    Count(distinct user_id) as customer_count
From temp
Group by category_1,category_2
Having Count(distinct user_id) >= 3
Order by customer_count DESC, category1 ASC, category2 ASC;
