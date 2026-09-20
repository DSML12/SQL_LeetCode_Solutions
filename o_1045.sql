------------------------------------------------------------------------------
-- 1045. Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/description
------------------------------------------------------------------------------

Select customer_id
From Customer
Group by customer_id
Having Count(Distinct product_key) = (Select Count(*) From Product);
