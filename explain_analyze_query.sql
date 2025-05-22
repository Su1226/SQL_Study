/* 
쿼리 성능 비교
*/
set profiling = 1;
# 쿼리 실행
explain analyze select * from student_tb;
explain analyze select * from class_tb;