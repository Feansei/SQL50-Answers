# Write your MySQL query statement below
with total_id as (
    select requester_id as id
    from requestaccepted
    union all
    select accepter_id as id
    from requestaccepted
)

select id,
    count(id) as num
from total_id
group by id
order by count(id) desc
limit 1;

