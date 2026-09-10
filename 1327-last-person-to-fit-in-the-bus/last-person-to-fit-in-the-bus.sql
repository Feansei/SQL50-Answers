select
    person_name
from (
    select 
    person_name,
    turn,
    sum(weight) over (order by turn asc) as running_total
    from queue
) as weight_total
where running_total <= 1000
order by turn desc
limit 1
;
