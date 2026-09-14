# Write your MySQL query statement below
with second_salary as (
    select
        id,
        salary,
        dense_rank() over (order by salary desc) as rankings
    from Employee
)
select
    max(salary) as SecondHighestSalary
from second_salary
where rankings = 2
;