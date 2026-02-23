-- 1. Find the top 3 students per Gender based on Exam_Score.
select * 
from (select Gender, Exam_Score, row_number() over (partition by Gender order by Exam_Score Desc) as Rank_within_gender 
from studentperformancefactors) as ranked 
where Rank_within_gender <=3;

-- 2. Find the difference between Exam Score and Previous Scores for each student.
SELECT 
    School_Type,
    Exam_Score,
    Previous_Scores,
    (Exam_Score - Previous_Scores) AS score_difference
FROM
    studentperformancefactors
ORDER BY score_difference;

-- 3. Identify the Parental Involvement level with the highest improvement from Previous Scores to Exam Score.
SELECT 
    Parental_Involvement,
    ROUND(AVG(Exam_Score - Previous_Scores), 2) AS avg_improvement
FROM
    studentperformancefactors
GROUP BY Parental_Involvement
ORDER BY avg_improvement DESC;

-- 4. Calculate a running average Exam Score ordered by Hours Studied.
select Hours_Studied, Exam_Score, 
Round(Avg(Exam_Score) over ( order by Hours_Studied Rows between unbounded preceding and current row),2) as running_avg_exam_score 
from studentperformancefactors 
order by Hours_Studied;
