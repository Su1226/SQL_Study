/*
	순위를 매기는 함수 
    1. row_number() over()
    - 잘 쓰면 좋은 것.
    - 집계함수 중 하나.
    - row_number() 함수는 over()함수와 함께 사용되어야 하는데, 이를 윈도우 함수라고 한다. 
    - ` `는 컬럼명, 데이터베이스명을 쓸 때 감쌀 수 있다. (확실하게 표현하기 위해)
    - row_number()은 주로 parition by와 자주 사용된다. 
    - partition by도 그룹핑이다. 
	- 페이징 처리에도 많이 사용된다. 
    2. rank()
    - row_number은 무조건 1씩 증가하며 동점이 있어도 무조건 다음 번호로 넘어가며 중복 순위가 없다.
    - rank는 동점이 있으면 같은 순위를 부여하며 다음 순위는 건너뛴다. 즉, 공백이 있다.
    3. dense_rank()
    - 동점자는 같은 순위로 하며, 다음 순위는 연속적으로 이어짐.
    - 즉, 건너뛰지 않음.
*/

# 1. row_number() over()
select 
	row_number() over(order by bt.brand_id, pt.product_name) as `number`,			
	bt.brand_id,
    bt.brand_name,
    pt.product_name
from
	brand_tb bt
    inner join product_tb pt on(pt.brand_id = bt.brand_id)
group by
	brand_id,
    pt.product_name
order by
	brand_id;
    
# 2. partition by 
# 실행결과, brand_id의 그룹에 따라서 number에 번호를 넣어준다. 
# 제일 비싼 제품, 제일 싼 제품을 가져오는 등의 결과를 낼 수 있다. 
select 
	row_number() over(partition by bt.brand_id order by bt.brand_id, pt.product_name) as `number`,			
	bt.brand_id,
    bt.brand_name,
    pt.product_name
from
	brand_tb bt
    inner join product_tb pt on(pt.brand_id = bt.brand_id)
group by
	brand_id,
    pt.product_name
order by
	brand_id;
    
# 2-1. 가장 비싼 제품을 꺼내서 제품명을 출력하라.
select 
	row_number() over(partition by bt.brand_id order by bt.brand_id, max(pt.price) desc) as `number`,			
	bt.brand_id,
    bt.brand_name,
    pt.product_name,
    max(pt.price) as max_price
from
	brand_tb bt
    inner join product_tb pt on(pt.brand_id = bt.brand_id)
group by
	brand_id,
    pt.product_name
order by
	brand_id;

# 2-2. 각 브랜드마다 가장 비싼 제품을 출력하라. 
# 주로 필터링을 할 때 사용한다. 
select
	*
from (
	select 
		row_number() over(partition by bt.brand_id order by bt.brand_id, max(pt.price) desc) as `number`,			
		bt.brand_id,
		bt.brand_name,
		pt.product_name,
		max(pt.price) as max_price
	from
		brand_tb bt
		inner join product_tb pt on(pt.brand_id = bt.brand_id)
	group by
		brand_id,
		pt.product_name) tbt
where
	tbt.number < 6;

# 2-3. 각 브랜드마다 가장 싼 제품을 출력하라.
select
	*
from (
	select 
		row_number() over(partition by bt.brand_id order by bt.brand_id, min(pt.price) desc) as `number`,			
		bt.brand_id,
		bt.brand_name,
		pt.product_name,
		min(pt.price) as min_price
	from
		brand_tb bt
		inner join product_tb pt on(pt.brand_id = bt.brand_id)
	group by
		brand_id,
		pt.product_name) tbt
where
	tbt.number = 1;

# 2-4
select
	product_name,
    stock,
    count(*)
from
	product_tb
group by
	product_name,
    stock
having
	count(*) > 3;
    
/*
	윈도우 함수(ROW_NUMBER(), RANK(), SUM(), AVG() 등)를 그룹별로 따로 적용하고 싶을 때 사용한다.
    - 쉽게 말해, 전체가 아니라 그룹(묶음) 별로 순위를 매기고 싶을 때 사용한다. 
*/    

# 3. rank()
select
	rank() over(partition by bt.brand_id order by bt.brand_id, max(stock)) as `rank`,
    bt.brand_name,
    pt.product_name,
    max(stock) as max_stock
from
	brand_tb bt
    left outer join product_tb pt on(pt.brand_id = bt.brand_id)
group by
	bt.brand_id,
    pt.product_name;
    
# 4. dense_rank()
select
	dense_rank() over(partition by bt.brand_id order by bt.brand_id, max(stock)) as `rank`,
    bt.brand_name,
    pt.product_name,
    max(stock) as max_stock
from
	brand_tb bt
    left outer join product_tb pt on(pt.brand_id = bt.brand_id)
group by
	bt.brand_id,
    pt.product_name;
    

    
	