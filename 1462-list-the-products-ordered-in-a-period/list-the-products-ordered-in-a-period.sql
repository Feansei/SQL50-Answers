# Write your MySQL query statement below
with join_table as (
    select
        P.product_name,
        P.product_category,
        O.order_date,
        sum(O.unit) over (partition by P.product_name) as unit,
        P.product_id
    from Products P
        left join Orders O
            on P.product_id = O.product_id
    where order_date between '2020-02-01' and '2020-02-29'
)

select
    distinct product_name,
    unit
from join_table
where unit >= 100
;