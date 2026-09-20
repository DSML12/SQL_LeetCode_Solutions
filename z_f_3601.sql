---------------------------------------------------------------------------------------
-- 3601. Find Drivers with Improved Fuel Efficiency
-- https://leetcode.com/problems/find-drivers-with-improved-fuel-efficiency/description
--------------------------------------------------------------------------------------- 

With cte as(
  Select driver_id,
    Sum(Case When Month(trip_date) <= 6 Then distance_km / fuel_consumed 
        Else 0 End)/Sum(Case When Month(trip_date) <= 6 Then 1 Else 0 End) as first_half, 
    Sum(Case When Month(trip_date) > 6 Then distance_km / fuel_consumed 
        Else 0 End)/Sum(Case When Month(trip_date) > 6 Then 1 Else 0 End) as second_half
From trips
Group by driver_id
)
  
Select d.driver_id, 
    n.driver_name, 
    Round(d.first_half,2) as first_half_avg, 
    Round(d.second_half,2) as second_half_avg, 
    Round(d.second_half-d.first_half,2) as efficiency_improvement
From cte d
Join drivers n
on d.driver_id = n.driver_id
Where Round(d.second_half,2) >= Round(d.first_half,2) 
    AND d.second_half > 0 
    AND d.first_half > 0
Order by efficiency_improvement DESC,  n.driver_name ASC;
