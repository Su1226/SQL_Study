/*
	4. DELETE(삭제)
    DELETE FROM 테이블명 WHERE 조건;
    
    4-1. delete도 where 조건이 중요하다.
    4-2. 잘못하면 테이블 안의 값을 다 삭제 할 수 있다.
    4-3. 값을 사용하면 동명이인을 삭제할 수도 있으므로, 가능한 id 값으로 조건을 건다.
*/

# 기본 
delete
from
	student_tb st
where
	student_id = 5;

# 확인
select * from student_tb;
	