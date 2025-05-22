/*
	테이블을 합치는 방법(JOIN)
    SELECT * FROM 테이블1 JOIN 테이블2;
    1. select 또는 update를 할 때
*/

select * from student_tb join student_tb as st2;	# 이중 반복으로 결과가 나온다. 

select * from 
student_tb as st1 
inner join 											# 교집합인 것을 가져오는 Join
student_tb as st2 
on(st2.student_id = st1.student_id); 				# 특정 조건을 줄 때 on을 준다.

select * from 
student_tb as st1 
inner join 											 
student_tb as st2 
on(st2.student_id = st1.student_id + 1); 

select * from 
student_tb as st1 
inner join 											 
student_tb as st2 
on(st2.student_id = st1.student_id + 1)
inner join
student_tb as st3
on(st3.student_id = st2.student_id + 1); 			# 2개의 테이블도 합칠 수 있다. 

select * from 
student_tb as st1 
left join 											# 첫번째 테이블을 기준으로 다 나온다. 그 중 두번째 테이블의 조건의 맞는 것도 나온다.			 
student_tb as st2 
on(st2.student_id = st1.student_id + 1)
left outer join										# outer을 쓰는 이유는 다른 언어와의 호환성 때문이다. (그냥 LEFT만 써도 되지만 OUTER도 쓰는 걸로 한다.)
student_tb as st3
on(st3.student_id = st2.student_id + 1); 			# 결과적으로 비워진 값은 null로 채워진다.

# RIGHT JOIN은 거의 쓰지 않는다. 
# 코드의 기준은 왼쪽이기 때문에, LEFT JOIN을 많이 사용한다. 

# INNER JOIN을 쓰는 경우는 사용자에게 null을 보여주지 않아야 할 때 사용되며,
# LEFT JOUN은 null이 있더라고 하더라도 상관 없이 왼쪽으로 합쳐지기만 하면 될 때 사용한다.

select * from 
student_tb as st1 
left outer join 													 
student_tb as st2 
on(st2.student_id = st1.student_id + 1)
inner join										
student_tb as st3
on(st3.student_id = st2.student_id + 1); 

select * from 
student_tb as st1 
inner join 													 
student_tb as st2 
on(st2.student_id = st1.student_id + 1)
left outer join										
student_tb as st3
on(st3.student_id = st2.student_id + 1); 

/* 앞으로 SQL을 작성하는 방법 */
select 
	* 
from 
	student_tb st1 
	inner join student_tb as st2 on(st2.student_id = st1.student_id + 1)
	left outer join student_tb as st3 on(st3.student_id = st2.student_id + 1);
    
/*
	예를 들어,
    for (int i = 0; i < 10; i++) {
		for (int j = 0; j < 10; j++) {
			if(j == i) {
				테이블 붙이기
			}
		}
	}
    과 같이, 위의 예시 쿼리문에서 left outer joun이 안 쪽의 for문
    inner join이 바깥쪽의 for문과 같은 역활을 하게 된다. 
*/
