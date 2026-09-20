-------------------------------------------------------------
-- 1393. Capital Gain/Loss
-- https://leetcode.com/problems/capital-gainloss/description
-------------------------------------------------------------

Select stock_name,
    Sum(Case When operation = 'Buy' Then price * (-1) Else price End) As capital_gain_loss
From Stocks
Group by stock_name;
