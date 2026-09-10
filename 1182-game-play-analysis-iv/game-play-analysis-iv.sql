select
    round(sum(temp) / count(temp), 2) as fraction
from (
    select
        f.player_id,
        case when a.event_date is not null then 1 else 0 end as temp
    from (
        select player_id, min(event_date) as first_login
        from activity
        group by player_id
    ) f
    left join activity a
        on a.player_id = f.player_id
        and a.event_date = date_add(f.first_login, interval 1 day)
) as derived