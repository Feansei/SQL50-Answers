# Write your MySQL query statement below
select distinct num as ConsecutiveNums
from (
    select
        num,
        case when num = lead(num, 1) over (order by id) 
              and lead(num, 1) over (order by id) = lead(num, 2) over (order by id) 
             then num
             else null
        end as temp
    from logs
) t
where temp is not null
