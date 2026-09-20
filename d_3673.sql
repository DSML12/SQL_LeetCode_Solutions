-----------------------------------------------------------------
-- 3673. Find Zombie Sessions
-- https://leetcode.com/problems/find-zombie-sessions/description
-----------------------------------------------------------------

With duration As(
    Select session_id, 
      user_id,
      sum(case when event_type = 'scroll' Then 1 Else 0 End) AS scroll_count,
      sum(case when event_type = 'purchase' Then 1 Else 0 End) as purchase_count,
      TIMESTAMPDIFF(Minute, Min(event_timestamp), Max(event_timestamp)) as session_duration_minutes,
      (sum(case when event_type = 'click' Then 1 Else 0 End)*1.0/(sum(case when event_type = 'scroll' Then 1 Else 0 End))) as cts_ratio
    From app_events
    Group by session_id
    Having TIMESTAMPDIFF(Minute, Min(event_timestamp), Max(event_timestamp))>30 
)

Select session_id, 
  user_id, 
  session_duration_minutes, 
  scroll_count
From duration
Where cts_ratio<0.2
    AND scroll_count >= 5
    And purchase_count = 0
Order by scroll_count DESC, session_id ASC;
