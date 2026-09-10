# Write your MySQL query statement below
select
    S.user_id,
    Coalesce( ROUND(
        SUM(CASE WHEN C.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(C.action),
        2
    ),0) AS confirmation_rate
from Signups S
    left join Confirmations C
        on S.user_id = C.user_id
group by s.user_id
;