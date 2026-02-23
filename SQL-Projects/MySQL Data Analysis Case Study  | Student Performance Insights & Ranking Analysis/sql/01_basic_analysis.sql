-- 1. Total number of students
select count(*) as total_students
from studentperformancefactors;

--  2. Find the average Exam Score of all students.
SELECT 
    AVG(exam_score) AS avg_exam_score
FROM
    studentperformancefactors;

-- 3. Find the average Attendance for each Gender.
SELECT 
    gender,
    AVG(attendance) AS avg_attendance,
    AVG(Exam_Score) AS avg_score
FROM
    studentperformancefactors
GROUP BY gender;

-- 4. Students who scored above 80
SELECT 
    *
FROM
    studentperformancefactors
WHERE
    Exam_Score > 80;
