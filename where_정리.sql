/*
	조건 연산자
*/

# 1
select 
	*
from
	product_tb
where
	price > 500000
    and stock_quantity > 400;			# `and`를 통해서 조건을 여러 개 넣을 수 있다. (두 조건 모두 충족하는 것.)
    
    
# 2
select
	*
from
	product_tb
where
	brand_id = 1
    or brand_id = 2;					# `or`을 통해 조건을 여러 개 넣을 수 있다. 
    
# 2-1 : or을 `in`으로 대신 할 수 있다.
select
	*
from
	product_tb
where
	brand_id in (1, 2);
    
# 2-2 : 서브 쿼리로 다음과 같이도 가능하다.
select 
	*
from
	product_tb
where
	brand_id in (select brand_id from brand_tb where brand_id < 3);
    
# 2-3 : 서브 쿼리 + in 사용
select 
	*
from
	product_tb
where
	brand_id in (select brand_id from brand_tb where brand_name in ("LG", "다이소"));


# 3
select
	*
from 
	product_tb
where
	price >= 100000
    and price <= 200000;
    
# 3-1 : 값의 사이를 between A and B로 사용할 수 있다.
select
	*
from 
	product_tb
where
	price between 100000 and 200000;
    
    
# 4
select 
	product_name,
    stock
from
	product_tb
where
	stock = 0;
    
# 4-1
select 
	product_name,
    stock,
    if(stock = 0, '부족', NULL) as stock_status		# if문으로 stock_status라는 테이블 컬럼을 추가할 수 있다.
from
	product_tb;
    
# 4-2
select 
	product_name,
    stock,
    if(stock = 0, '부족', NULL) as stock_status		
from
	product_tb
where
	stock_status = '부족'; 							# 불가능. where은 from 다음 검사를 하기 때문에 select가 되기 전에 검사를 한다.
    
# 4-3 : 위의 절차적인 문제, 순서 문제를 해결하기 위해 from에 서브쿼리를 넣는다. 
select 
	*		
from
	(select 
		product_name,
		stock,
		if(stock = 0, '부족', NULL) as stock_status
	from
		product_tb) tpt								# as로 테이블 명을 붙여주지 않으면 오류가 난다. 
where
	stock_status = '부족'; 	

# 4-4 : null 값을 찾기 위해서는 `is`를 넣어야 한다. 
select 
	*		
from
	(select 
		product_name,
		stock,
		if(stock = 0, '부족', NULL) as stock_status
	from
		product_tb) tpt								# as로 테이블 명을 붙여주지 않으면 오류가 난다. 
where
	stock_status is NULL; 
    
# 4-4 : null 값이 아닌것을 찾기 위해서는 `is not`를 넣어야 한다. 
# 또한 not은 null을 비교할 때만 쓸 수 있다. 
select 
	*		
from
	(select 
		product_name,
		stock,
		if(stock = 0, '부족', NULL) as stock_status
	from
		product_tb) tpt								# as로 테이블 명을 붙여주지 않으면 오류가 난다. 
where
	stock_status is not NULL; 

# 4-5 : 부정 표현을 쓰고 싶다면?
# not을 쓰되, `is not`을 제외하고는 맨 앞에 not을 붙여줘야 한다. 
select 
	*		
from
	(select 
		product_name,
		stock,
		if(stock = 0, '부족', '') as stock_status		# not을 쓸 때는 null이 들어가 있으면 안된다. 
	from
		product_tb) tpt								# as로 테이블 명을 붙여주지 않으면 오류가 난다. 
where
	not tpt.stock_status = "부족"; 					# 주로 빈 값이 있는 경우, null을 넣어주거나 다른 값을 넣어주도록 사용이 된다.
    
# 4-6 : is not null
select 
	*		
from
	(select 
		product_name,
		stock,
		if(stock = 0, '부족', null) as stock_status		
	from
		product_tb) tpt								
where
	tpt.stock_status is not null; 				
    

/*
	like 연산자(와일드 카드 %, _)
    - 정확하지 않는 검색어를 조회할 때 사용한다.
    - like는 보통 조건문에서 and를 잘 사용하지 않는다. 주로 or을 사용한다. 
*/

# 1
select
	*
from
	product_tb
where
	product_name like '%노트북';			# 노트북이 들어있는 키워드는 다 가져온다. 
    
# 2
select
	*
from
	product_tb
where
	product_name like '강력한%';			

# 3
select
	*
from
	product_tb
where
	product_name like '%한%';

# 4
select
	*
from
	product_tb
where
	product_name like '%한%상';			# 중간에는 '한'이라는 글자가 포함되어 있어야 하고, 끝은 '상'이라는 글자가 포함되어 있어야 한다.
    
# 5
select
	*
from
	product_tb
where
	product_name like '____책상';		# _ 개수에 맞는 글자만큼의 키워드를 가져온다. (띄어쓰기 포함)
    
# 6
select
	*
from
	product_tb
where
	product_name like '___책상';		# _ 개수에 맞는 글자만큼의 키워드를 가져온다. (띄어쓰기 포함)
    
# 7. 문제 : supplier에서 '이'로 끝나거나 '김'으로 끝나는 것을 조회하라.
select
	*
from 
	supplier_tb 
where
	supplier_name like '%이' 
    or supplier_name like'%김';
    
# 7-1. like에 in을 쓸 수 있을까? -> 불가능하다. 
select
	*
from 
	supplier_tb 
where
	supplier_name in ("양김", "유한회사 이");