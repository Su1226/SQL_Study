insert into study_class_tb 
values 
	("Java 기초", 150000, "김민수", 22),
    ("Python 웹 개발", 200000, "이서연", 24),
    ("React 입문", 180000, "박지훈", 21),
    ("Spring Boot 실전", 250000, "최유진", 23),
    ("React 입문", 180000, "정예은", 26),
    ("SQL 마스터", 250000, "홍길동", 20),
    ("JavaScript 중급", 130000, "신유나", 19),
    ("HTML/CSS 디자인", 120000, "김도윤", 20),
    ("데이터 분석 입문", 210000, "오하늘", 25),
    ("Node.js 백엔드", 230000, "배수현", 22),
    ("Flutter 앱 개발", 240000, "광팔두", 27);
    
select * from study_class_tb;

/*
	제 1 정규화가 적용되어 있는 상태
*/

/* ------------------------------ */
insert into class_tb
values(default, "python", 20000);

insert into student_tb
values
	(default, "김민수", 22),
    (default, "이서연", 24),
    (default, "박지훈", 21),
    (default, "최유진", 23),
    (default, "정예은", 26),
    (default, "홍길동", 20),
    (default, "신유나", 26),
    (default, "김도윤", 20),
    (default, "오하늘", 25),
    (default, "배수현", 22),
    (default, "광팔두", 27);
    
select * from student_tb;


