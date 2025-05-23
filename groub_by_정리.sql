/*
	GROUP BY
    - 중복 제거를 하기 위해서도 사용되지만,
    - 집계를 구할 때 많이 사용된다. (집계 함수들을 사용하기 위해서는 반드시 group by가 필요하다.)
    - 예를 들어, 평균/합계/최대/최소 값 등을 구하는데 사용된다. 
    - group by로 만들어진 테이블에서 조건절은 having으로 조건절을 달아야 한다. 
*/

# 1. count() 
select 
	pt.category_id,
    ct.category_name,
    pt.supplier_id,
    st.supplier_name,
    count(pt.category_id) as product_cnt
from
	product_tb pt
    inner join category_tb ct on(ct.category_id = pt.category_id)
    inner join brand_tb bt on (bt.brand_id = pt.brand_id)
    inner join supplier_tb st on (st.supplier_id = pt.supplier_id)
group by
	pt.category_id,
    pt.supplier_id;
    
# 2. sum()
select 
	pt.category_id,
    ct.category_name,
    pt.supplier_id,
    st.supplier_name,
    count(pt.category_id) as product_cnt,
    sum(pt.stock) as total_stock
from
	product_tb pt
    inner join category_tb ct on(ct.category_id = pt.category_id)
    inner join brand_tb bt on (bt.brand_id = pt.brand_id)
    inner join supplier_tb st on (st.supplier_id = pt.supplier_id)
group by
	pt.category_id,
    pt.supplier_id;
    
# 3. avg()
select 
	pt.category_id,
    ct.category_name,
    pt.supplier_id,
    st.supplier_name,
    count(pt.category_id) as product_cnt,
    sum(pt.stock) as total_stock,
    avg(pt.stock) as avg_stock
from
	product_tb pt
    inner join category_tb ct on(ct.category_id = pt.category_id)
    inner join brand_tb bt on (bt.brand_id = pt.brand_id)
    inner join supplier_tb st on (st.supplier_id = pt.supplier_id)
group by
	pt.category_id,
    pt.supplier_id;
    
# 4
select 
	count(*)
from
	product_tb;
    
# 5. having : group by의 조건절 
select 
	pt.category_id,
    ct.category_name,
    pt.supplier_id,
    st.supplier_name,
    count(pt.category_id) as product_cnt,
    sum(pt.stock) as total_stock,
    avg(pt.stock) as avg_stock
from
	product_tb pt
    inner join category_tb ct on(ct.category_id = pt.category_id)
    inner join brand_tb bt on (bt.brand_id = pt.brand_id)
    inner join supplier_tb st on (st.supplier_id = pt.supplier_id)
group by
	pt.category_id,
    pt.supplier_id
having 
	product_cnt > 40;

