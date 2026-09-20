----------------------------------------------------------------------------
-- 3497. Analyze Subscription Conversion 
-- https://leetcode.com/problems/analyze-subscription-conversion/description
----------------------------------------------------------------------------

With cte As(
    Select user_id
    From UserActivity
    Where activity_type <> 'cancelled'
    Group by user_id
    Having Count(Distinct activity_type) >= 2
)

Select user_id, 
  Round(Sum(Case When activity_type = 'free_trial' Then activity_duration Else 0 End)/Sum(Case When activity_type = 'free_trial' Then 1 Else 0 End),2) as trial_avg_duration,
  Round(Sum(Case When activity_type = 'paid' Then activity_duration Else 0 End)/Sum(Case When activity_type = 'paid' Then 1 Else 0 End),2) as paid_avg_duration
From UserActivity
Where user_id in (Select user_id
                  From cte)
Group by user_id;

