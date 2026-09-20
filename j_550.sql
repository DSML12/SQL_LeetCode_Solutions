------------------------------------------------------------------
-- 550. Game Play Analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/description
------------------------------------------------------------------

With cte as (
    Select player_id, 
      Min(event_date) as first_day
    From Activity
    Group by player_id
)

Select Round(Count(Distinct a.player_id)*1.0/(select count(Distinct player_id) From Activity),2) as fraction
From Activity a
Left Join cte c
on a.player_id = c.player_id
Where Datediff(a.event_date, c.first_day) = 1;
