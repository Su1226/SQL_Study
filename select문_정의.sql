/*
	2. SELECT(검색)
    SELECT 컬럼1, 컬럼2 FROM 테이블명;
    
    2-1. 조회를 할 때, 해당 그룹에서 키-값과 같은 형태로 뽑아서 선택한다.
    2-2. 선택된 컬럼만 합쳐서 테이블을 보여준다. 
    2-3. where을 통해 조건을 넣을 수 있다. (우선적으로 테이블을 선택한 다음, 컬럼을 확인하고 조건에 맞는 행만 뽑아낸다.)
		 SELECT 컬럼1 FROM 테이블명 WHERE 조건;
	2-4. SELECT 10;과 같이 조회 시, 리터럴 값이 반영된 테이블이 나온다. 
    2-5. 리터럴 값 자체로 컬럼명이 되기 때문에, `as 컬럼명`을 해주면 바꿀 수 있다. 
    2-6. 리터럴 값들의 연산도 가능하며, 문자열 합치기도 가능하다. 
    2-7. 생성된 결과는 항상 테이블로 나타나며, 이 자체로 테이블로 사용할 수 있다. (가상으로 만들어진 테이블)
    2-8. 컬럼 대신 `*`을 찍으면 모든 정보를 출력하라는 의미이다.
    2-9. 선택하려는 컬럼이 중복되어도 된다. -> 중복으로 출력해준다. 
    2-10. select는 반복이 일어나지 않기 때문에, 리터럴 값으로 만든 테이블에 값을 넣는 것이 불가능하다. 
    2-11. select 후, 그 결과 값의 테이블에 row를 추가할 수 없다. (2-10과 관련)
    2-12. 그러나 union을 붙이면 그 row를 추가 할 수 있다. 단, 컬럼의 개수가 일치해야지만 가능하다.
    2-13. `as`는 컬럼명을 수정할 때는 반드시 붙이지만, 테이블명을 고칠때는 생략이 가능하다.
*/

select student_name from student_tb;

select student_name from student_tb where student_age > 25;

select 10;
select 10 as number;
select 10 + 20 as number2;
select number2 from (select 10 + 20 as number2) as n_tb;
select * from (select 10 + 20 as number2) as n_tb;
select * from (select 10 + 20 as number2, 40 as number3) as n_tb;