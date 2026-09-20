----------------------------------------------------------------------
-- 3220. Odd and Even Transactions
-- https://leetcode.com/problems/odd-and-even-transactions/description
----------------------------------------------------------------------

Select transaction_date, 
  Sum(Case When amount%2 <> 0 Then amount Else 0 End) As odd_sum,
  Sum(Case When amount%2 = 0 Then amount Else 0 End) As even_sum
From transactions
Group by transaction_date
Order by transaction_date ASC;
