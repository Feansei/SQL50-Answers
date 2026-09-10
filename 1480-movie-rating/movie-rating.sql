# Write your MySQL query statement below
(select
    name as results
from MovieRating
    left join Users
        on Users.user_id = MovieRating.user_id
group by name
order by count(*) desc, name
limit 1)

Union all

(select
    title as results
from MovieRating
    left join Movies
        on Movies.movie_id = MovieRating.movie_id
where extract(year_month from created_at) = 202002
group by title
order by avg(rating) desc, title
limit 1);

