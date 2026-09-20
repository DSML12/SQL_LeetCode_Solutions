----------------------------------------------------------------------------------------
-- 602. Friend Requests II: Who Has the Most Friends
-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description
---------------------------------------------------------------------------------------- 

With req_sent As(
    Select IFNULL(Count(*),0) as friends, 
      requester_id as user_id
    From RequestAccepted
    Group by requester_id
),

req_accepted As(
    Select IFNULL(Count(*),0) as friends, 
      accepter_id as user_id
    From RequestAccepted
    Group by accepter_id
)

Select c.user_id as id, 
    Sum(c.friends) As Num
From ( Select user_id, 
         friends
      From req_sent
      Union All
      Select user_id, 
        friends
      From req_accepted
) AS c
Group by c.user_id 
Order by 2 DESC
Limit 1;
