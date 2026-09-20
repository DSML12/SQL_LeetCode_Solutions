--------------------------------------------------------------------------
-- 1164. Product Price at a Given Date
-- https://leetcode.com/problems/product-price-at-a-given-date/description
--------------------------------------------------------------------------

With cte As (
    Select product_id,
      DATEDIFF('2019-08-16', change_date) As date_diff,
      new_price
    From Products
    Where change_date <= '2019-08-16'
), 
  
Comb As (
    Select p.product_id,
      IFNULL(c.date_diff, 0) As date_diff,
      IFNULL(c.new_price, 10) As new_price
    From Products p
    Left Join cte c
      on c.product_id = p.product_id
)

Select product_id,
       new_price As price
From (Select *,
        Row_Number() Over (Partition By product_id Order By date_diff ASC) As rank_
    From  comb) sub
Where rank_ = 1;
