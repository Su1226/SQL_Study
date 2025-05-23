/*
	정규화의 목적은 '중복 제거'이다.
    중복을 제거하는 방법
    1. distinct(행의 조합 데이터가 동일한 행을 제거해준다.)
    2. GROUB BY(select절과 상관없이 groub by절에서 컬럼을 선택하여 중복을 제거해준다.)
    
    select 실행 순서(해석 순서)
    1. from 		→ 데이터가 존재하는 테이블을 조회하거나 조인을 하는 역할.
    2. on 			→ join이 있는 경우, join의 조건을 평가.
    3. join 		→ on 조건에 해당하는 데이터를 결합하는 역할. 
    4. where 		→ from에서 조회할 데이터의 조건을 평가.
    5. groub by		→ 조회된 결과에서 명시된 컬럼끼리 그룹핑 하는 역할.
    6. having 		→ 그룹핑된 결과에서 데이터의 조건을 평가.
    7. select		→ 최종적으로 출력할 컬럼을 선택하는 역할. 
    8. disticnt		→ select에서 선택한 컬럼의 조합 결과에서 중복 행을 제거.
    9. order by		→ 최종 select 결과를 오름차순(ASC) 또는 내림차순(DESC)으로 정렬하는 역할. 
    10. limit		→ 최종 select 결과의 행 개수를 제한할 수 있다. 
*/

# 전체 조회
select * from sample_products_tb;

# distinct 사용
select 
	distinct				# 중복을 제거하겠다는 의미 
	category_name,
    "test"					# 문자열 데이터를 추가한 것. (추가로 데이터를 할 수 있다.)
from
	sample_products_tb
order by					# 오름차순으로 정렬(정렬은 제일 마지막에 쓴다.)
	category_name;
    
# groub by 사용
select 
	category_name,			# `*`로만 쓰면, 전체 출력이 되기 때문에 groub by를 할 수 없으므로 오류가 발생한다. 
    count(category_name)	# select를 할 때, 가구의 수 까지 합쳐서 조회를 할 때(group by를 많이 사용함.)
from
	sample_products_tb
group by
	category_name
order by
	category_name;
    
# insert 문을 썼지만, insert를 통한 select 조회하는 구문.
# insert로 미어있던 category_tb에 category_name을 삽입하는 동시에
# insert문이기 때문에 category_id까지 함께 들어가게 된다. 
insert into category_tb(category_name)
select
	category_name
from
	sample_products_tb
group by
	category_name
order by
	category_name;
    

insert into brand_tb(brand_name)
select
	brand_name
from 
	sample_products_tb 
group by
	brand_name
order by
	brand_name;
    

insert into supplier_tb(supplier_name, supplier_phone)
select
	supplier_name, 
    supplier_phone
from
	sample_products_tb
group by
	supplier_name, 
    supplier_phone
order by
	supplier_name,
    supplier_phone;

# 최종적으로 product_tb에 정규화 된 데이터를 넣어준다. 
insert into product_tb
select
	0,						# 순서대로 정렬하고, 컬럼의 개수를 맞춰 데이터를 삽입하기 위해. 
    spt.product_name,
    ct.category_id,
    bt.brand_id,
    st.supplier_id,
    spt.price,
    spt.stock
from 
	sample_products_tb spt
    inner join category_tb ct on(ct.category_name = spt.category_name)
    inner join brand_tb bt on(bt.brand_name = spt.brand_name)
    inner join supplier_tb st on (st.supplier_name = spt.supplier_name and st.supplier_phone = spt.supplier_phone)
order by
	product_name,
    category_id,
    brand_id,
    supplier_id;
