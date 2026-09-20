-----------------------------------------------------------
-- 626. Exchange Seats
-- https://leetcode.com/problems/exchange-seats/description
-----------------------------------------------------------

With tbl as (
  Select Case When id%2 = 0 Then id-1
          When id%2 = 1 And id < (Select Count(*) From Seat) Then id + 1
          Else id End as id_2, student
  From Seat
  Order by id_2)

Select id_2 as id, 
  student
From tbl; 
