/*
	3. UPDATE(수정)
	UPDATE 테이블명 SET 컬럼1 = 수정값, 컬럼2 = 수정값 WHERE 조건;
    
    3-1. update에서 가장 중요한 것은 where 조건 문이다.
    3-2. 명확하게 id로 하는 것이 가장 좋다. 
    3-3. where 조건문을 쓰지 않으면 싹다 변경된다는 주의할 점이 있다.
*/

# 업데이트 기본
update 
	class_tb ct
	-- left outer join class_register_tb crt on(crt.class_id = ct.class_id)		# join도 가능하긴 하다.
set
	class_name = "java 고급"
where
	class_id = 1;
    
# 확인 
select * from class_tb;