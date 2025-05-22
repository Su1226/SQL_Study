/* 
	select의 결과를 합치는 방법(union-중복 제거, union all)
    제약 조건
    1. 컬럼의 개수가 일치해야 한다. 
    2. 테이블을 select한 결과를 합치려면 자료형도 일치해야 한다. 
*/

select 30, 40 union select 50, 60;
# select 30, 40 union select 50, 60, 70; // 불가능
select 30, 40 union select 50, '가';		# 가능하긴 하나, 테이블을 가져오지 않았기 때문에 가능한 것. 
select 10, 20 union select 10, 20;		# union은 중복 데이터를 제거하고 합친다.
select 10, 20 union all select 10, 20;	# union all을 써야 중복 데이터까지 함께 출력된다. 

select student_name as sn, student_age, student_age from student_tb;