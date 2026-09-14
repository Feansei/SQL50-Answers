# Write your MySQL query statement below
select
    *
from Users
where regexp_like(mail, '^[A-Za-z][a-zA-Z0-9_.-]*@leetcode[.]com$','c');