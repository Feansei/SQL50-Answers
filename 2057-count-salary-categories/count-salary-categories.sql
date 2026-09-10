# Write your MySQL query statement below
select
    categories.category as category,
    count(nested_case.category) as accounts_count
from (select "Low Salary" as category
union
select "Average Salary"
union
select "High Salary"
) as categories

left join 
    (select
    *,
    case when income < 20000 then "Low Salary"
    when income >= 20000 and income <= 50000 then "Average Salary"
    when income > 50000 then "High Salary"
    end as category
    from accounts
) as nested_case
    on categories.category = nested_case.category
group by categories.category
;