-------------------------------------------------------------------
-- 1193. Monthly Transactions I
-- https://leetcode.com/problems/monthly-transactions-i/description
-------------------------------------------------------------------

Select Date_Format(trans_date, '%Y-%m') as  month,
  country,
  Ifnull(count(*),0) as trans_count,
  Ifnull(Count(Case when state = 'approved' Then id End),0) as approved_count,
  Ifnull(Sum(amount),0) as trans_total_amount,
  Ifnull(Sum(Case when state = 'approved' Then amount End),0)  as approved_total_amount
From Transactions
Group by Date_Format(trans_date, '%Y-%m'), country;
