-----------------------------------------------------------------------
-- 3421. Find Students Who Improved
-- https://leetcode.com/problems/find-students-who-improved/description
-----------------------------------------------------------------------

Select s1.student_id,
    s1.subject,
    s2.score As first_score,
    s3.score As latest_score
From (
    Select 
        student_id,
        subject,
        Min(exam_date) As first_score_date,
        Max(exam_date) As latest_score_date    
    From Scores
    Group By student_id, subject
    Having Count(*) >= 2
) As s1
Join Scores s2 On 
    s1.student_id = s2.student_id And 
    s1.subject = s2.subject And
    s1.first_score_date = s2.exam_date 
Join Scores s3 On 
    s1.student_id = s3.student_id And 
    s1.subject = s3.subject And
    s1.latest_score_date = s3.exam_date 
Where s2.score < s3.score
Order by s1.student_id ASC, s1.subject ASC;
