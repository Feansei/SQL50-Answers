# Write your MySQL query statement below
select
    p.product_id,
    IFNULL(round(Sum(p.price * u.units)/Sum(u.units),2),0) as average_price
from prices p
    left join unitssold u
        on p.product_id = u.product_id
        AND u.purchase_date between p.start_date AND end_date
group by p.product_id;

