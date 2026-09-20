--------------------------------------------------------
-- 178. Rank Scores
-- https://leetcode.com/problems/rank-scores/description
--------------------------------------------------------

Select score,
  Dense_Rank() Over(Order by score DESC) as "rank"
from Scores;
