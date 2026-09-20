------------------------------------------------------------
-- 262.  Trips and Users
-- https://leetcode.com/problems/trips-and-users/description
------------------------------------------------------------

WITH not_banned_users AS (
    SELECT users_id
    FROM Users
    WHERE banned = 'No' 
      AND role IN ('client', 'driver')
),
filtered_dates AS (
    SELECT *
    FROM Trips
    WHERE client_id IN (SELECT users_id FROM not_banned_users)
      AND driver_id IN (SELECT users_id FROM not_banned_users)
      AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
SELECT 
    request_at as Day,
    ROUND(1 - AVG(CASE WHEN status = 'completed' THEN 1 ELSE 0 END), 2) AS 'Cancellation Rate'
FROM filtered_dates
GROUP BY request_at
ORDER BY request_at;
