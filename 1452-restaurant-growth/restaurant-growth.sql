# Write your MySQL query statement below
select distinct
    visited_on,
    sum(amount) over window_w as amount,
    round(sum(amount) over window_w/7,2) as average_amount
    from customer
    window window_w as (
        order by visited_on
        range between interval 6 day preceding and current row
    )
limit 6, 1000;