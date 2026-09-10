# Write your MySQL query statement below
select 
    students.student_id,
    students.student_name,
    subjects.subject_name,
    count(examinations.student_id) as attended_exams
from Students
    cross join Subjects
        left join Examinations
            on Students.student_id = Examinations.student_id 
            AND subjects.subject_name = Examinations.subject_name
group by students.student_id, students.student_name, subjects.subject_name
order by student_id, subjects.subject_name
;