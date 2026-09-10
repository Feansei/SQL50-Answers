# Write your MySQL query statement below
select
    A1.name
from Employee A1
    join Employee A2
        on A1.id = A2.managerID
group by A2.managerID
having count(A2.managerID) >= 5
;
