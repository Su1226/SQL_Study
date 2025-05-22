/*
	SQL 문법
    
    1. INSERT(삽입)
    INSERT INTO 테이블명(컬럼1, 컬림2, ...) 
    VALUES (컬럼1 데이터, 컬럼2 데이터, ...);
    
    1-1. 테이블명 뒤에 컬럼명을 생략할 수 있다. 
    1-2. null값을 허용한 값은 비워두고 값을 넣을 수 있다. 
    1-3. 여러 개 데이터 삽입 
		INSERT INTO 테이블명(컬럼1, 컬럼2, ...) 
        VALUES (컬럼1 데이터, 컬럼2 데이터, ...), (컬럼1 데이터, 컬럼2 데이터, ...);
	1-4. SQL문이 길어지면, 여러줄로 나누어 사용 할 수 있다. (;을 기준으로 끝냄.)
    1-5. 짧을 때는 VALUES 옆에 다 써도 되지만 아닐 때는 가독성을 위해 한 줄 엔터 후, 들여쓰기를 해준다.
*/

insert into student_tb(student_name, student_age) values ('김다혜', 25);
insert into student_tb(student_age, student_name) values (29, "이수빈");
insert into student_tb values ("정유지", 25);
insert into student_tb(student_age) values (34);

insert into student_tb 
values
	("박민서", 25), 
    ("이수일", 21);
