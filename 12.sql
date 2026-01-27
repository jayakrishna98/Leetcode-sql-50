-- First, create all possible combinations of students and subjects.
-- Then, left join with the examinations table to identify which subjects each student attempted.
-- Finally, count the attended exams per student and subject combination.

select 
    b.student_id, 
    student_name, 
    a.subject_name, 
    count(c.subject_name) as attended_exams 
from subjects a
join students b
    on 1=1
left join examinations c
    on b.student_id=c.student_id
    and a.subject_name = c.subject_name
group by student_id, student_name,subject_name
order by student_id, student_name