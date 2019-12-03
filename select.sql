# 1.Query the existence of 1 course
select * from course where id = '1';

# 2.Query the presence of both 1 and 2 courses
select * from course where id = '1' or id = '2';

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select id, name, avg(sc.score) as average_score from student s join student_course sc on s.id = sc.studentId where (select avg(sc.score) from student_course sc where studentId = id group by studentId) >= 60 group by studentId;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where not exists (select 1 from student_course where id = studentId);

# 5.Query all SQL with grades
select score from student_course; 

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student join student_course on id = studentId where studentId = '1' and courseId = '2';

# 7.Retrieve 1 student score with less than 60 scores in descending order
select * from student join student_course on id = studentId where score < 60 order by score desc limit 1;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT courseId, avg(score) average_grade FROM student_course group by courseId order by average_grade desc, courseId;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select s.name, score from student s
join student_course sc on sc.studentId = s.id
join course c on c.id = sc.courseId
where c.name = 'Math' and score < 60;
