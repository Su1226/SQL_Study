/*
	limit(행의 개수를 제한)
    - a, b라고 지정할 때, a부터 b개이다. 
    - 인덱스는 0부터 시작한다. 
    - 주로 페이지에서 많이 사용한다. a에 페이지 번호, b에 페이지에 담을 데이터의 개수 등으로 사용한다. 
*/

# 1. 기본적인 사용 
select 
	*
from
	product_tb
limit 0, 10;			# 행의 개수는 0부터 10개로 제한한다. 

# 1-1. 기본적인 사용 
select 
	*
from
	product_tb
limit 4, 10;			# 행의 개수는 4부터 10개로 제한한다. 

# 1-2. 기본적인 사용 
select 
	*
from
	product_tb
limit 20, 10;			# 행의 개수는 20부터 10개로 제한한다. 