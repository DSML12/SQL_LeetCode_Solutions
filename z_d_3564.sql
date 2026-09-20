--------------------------------------------------------------------
-- 3564. Seasonal Sales Analysis
-- https://leetcode.com/problems/seasonal-sales-analysis/description
--------------------------------------------------------------------

With CTE AS (
  Select season, 
    category, 
    Sum(quantity) as total_quantity_sold,
    Sum(total_price) as  total_revenue
  From (
        Select sa.product_id, 
          p.category, 
          quantity,
          quantity*price AS total_price,
          Case When Month(sale_date) in (12, 1, 2) Then "Winter"
            When Month(sale_date)  in (3, 4, 5) Then "Spring"
            When Month(sale_date)  in (6, 7, 8) Then "Summer"
            When Month(sale_date)  in (9, 10, 11) Then "Fall"
           End as Season
        From sales sa
        Left Join products p
        on sa.product_id = p.product_id) s
Group by season, category)

Select season, 
  category, 
  total_quantity_sold as total_quantity, 
  total_revenue
From (
      Select *, 
        Dense_Rank() Over(Partition by season order by total_quantity_sold DESC, total_revenue DESC) as rnk
      From CTE) s
Where rnk = 1;


