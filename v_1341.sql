---------------------------------------------------------
-- 1341. Movie Rating
-- https://leetcode.com/problems/movie-rating/description
--------------------------------------------------------- 

Select name as results
From (Select m.user_id, 
        u.name,
        Row_Number() Over(Order by count(*) DESC, u.name ASC) as rnk
    From MovieRating m
    Join Users u
    on m.user_id = u.user_id
    Group by m.user_id) sub
Where rnk = 1

Union All

Select title as results
From (Select r.movie_id, 
        title,
        Row_Number() Over(Order by Avg(rating) DESC, title ASC) as rnk
    From MovieRating r
    Join Movies m
    on r.movie_id = m.movie_id
    Where Year(r.created_at) = 2020 And 
        Month(r.created_at) = 2
    Group by r.movie_id) sub
Where rnk = 1





