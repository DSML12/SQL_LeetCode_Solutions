------------------------------------------------------------------------------
-- 3521. Find Product Recommendation Pairs
-- https://leetcode.com/problems/find-product-recommendation-pairs/description
------------------------------------------------------------------------------

With Cte As(
  Select product1_id, 
    product2_id, 
    count(*) as customer_count
  From (
      Select p1.product_id as product1_id,
        p2.product_id as product2_id,
        p1.user_id
      From ProductPurchases p1
      Join ProductPurchases p2
      On p1.user_id = p2.user_id AND 
      p1.product_id < p2.product_id) s
  Group by product1_id, product2_id
  Having count(*) >= 3)

Select c.product1_id, 
  c.product2_id, 
  p1.category as product1_category,
  p2.category as product2_category, 
  c.customer_count
From Cte c
Left Join ProductInfo p1 
on c.product1_id = p1.product_id
Left Join ProductInfo p2
on c.product2_id = p2.product_id
Order by customer_count DESC, product1_id ASC, product2_id ASC;
