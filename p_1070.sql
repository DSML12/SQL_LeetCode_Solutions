-----------------------------------------------------------------------
-- 1070. Product Sales Analysis III
-- https://leetcode.com/problems/product-sales-analysis-iii/description
-----------------------------------------------------------------------

With cte As(
    Select product_id,
      Dense_Rank() Over(Partition by product_id Order by year) As rank_,
      year, 
      quantity, 
      price
    From Sales)

Select product_id, 
  year as first_year, 
  quantity, 
  price
From cte
Where rank_=1;
