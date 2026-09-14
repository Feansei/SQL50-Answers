# Write your MySQL query statement below
with temp_table as (
    select
    D.name as Department,
    E.name as Employee,
    E.salary as Salary,
    Dense_rank() over (partition by D.name order by E.salary desc) as Ranking
    from Employee E
        left join Department D
            on D.id = E.departmentId
)
select
    Department,
    Employee,
    Salary
from temp_table
where Ranking <= 3
;
