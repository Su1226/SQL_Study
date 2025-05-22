/*
	서브쿼리(하워쿼리)
    서브쿼리(subquery)란 다른 쿼리 내부에 포함되어 있는 SELETE 문을 의미한다.
    
    - 서브쿼리를 포함하고 있는 쿼리를 외부쿼리(outer query)라고 부르며, 서브쿼리는 내부쿼리(inner query)라고도 부른다.
    - 서브쿼리는 반드시 괄호(())로 감싸져 있어야만 한다.
    - 앞서 붙여지는 테이블을 master table이라고 하며, 뒤에 붙여지는 것이 slave table이라고 한다.
    - 그리고 master table을 기준으로 쿼리문을 짠다. 
*/

/* 값 넣기 */
insert into class_register_tb
values
	(default, 1, 2),
    (default, 1, 3),
    (default, 1, 4),
    (default, 2, 2),
    (default, 2, 5),
    (default, 2, 7),
    (default, 2, 9);
    
/* 서브 쿼리문 없이 작성 */ 
select 
	class_register_id,
    crt.class_id,
    ct.class_name,
    crt.student_id,
    st.student_name
from
	class_register_tb crt
	left outer join class_tb ct on (ct.class_id = crt.class_id)
    left outer join student_tb st on (st.student_id = crt.student_id)
where
	st.student_name = "이서연";

/* 서브쿼리 사용 */
# 1
select
	*
from
	class_register_tb
where
	student_id = 3;

# 2
select 
	student_id
from
	student_tb
where
	student_name = "이서연";

# 3
select
	*
from
	class_register_tb
where
	student_id = (	select
						student_id
					from
						student_tb
					where
						student_name = "이서연");

# 4
explain analyze select 
	crt.class_id,
	(select class_name from class_tb ct where ct.class_id = crt.class_id) as class_name
from 
	class_register_tb crt
where
	student_id = (	select
						student_id
					from
						student_tb
					where
						student_name = "이서연");
                        