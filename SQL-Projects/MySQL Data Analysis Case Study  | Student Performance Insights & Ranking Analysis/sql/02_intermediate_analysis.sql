-- 1. Average score by parental involvement
SELECT 
    Parental_Involvement, ROUND(AVG(Exam_Score), 2) AS avg_score
FROM
    studentperformancefactors
GROUP BY Parental_Involvement;

-- 2. Calculate the average Exam_Score for students with and without Tutoring_Sessions.
SELECT 
    Tutoring_Sessions,
    COUNT(*) AS Total_students,
    ROUND(AVG(Exam_Score), 2) AS avg_exam_score
FROM
    studentperformancefactors
GROUP BY Tutoring_Sessions
ORDER BY Tutoring_Sessions;

-- 3. Display students whose Exam_Score is above the overall average score.
SELECT 
    Gender, School_Type, Exam_Score
FROM
    studentperformancefactors
WHERE
    Exam_Score > (SELECT 
            AVG(Exam_Score)
        FROM
            studentperformancefactors)
ORDER BY Exam_Score;

-- 4. Classify Exam Score as:
-- High (>= 75)
-- Medium (60–74)
-- Low (< 60)
-- and count students in each category.
select 
case
when Exam_Score >=75 then 'High'
when Exam_Score between 60 and 74 then 'Medium'
else 'Low'
end as Score_category,
count(*) as total_students
from studentperformancefactors
group by Score_category
order by total_students desc;

