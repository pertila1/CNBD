select count(customer_id) from customer
group by job_industry_category
order by count(customer_id) DESC;

---------------------------------------------------

select 
    DATE_TRUNC('month', TO_DATE(t.transaction_date, 'DD-MM-YYYY')) as transaction_month,
    c.job_industry_category,
    sum(t.list_price) AS total_sales
from transaction t
join customer c ON t.customer_id = c.customer_id
group by transaction_month, c.job_industry_category
order bY transaction_month, c.job_industry_category;

-----------------------------------------------------

select  
	t.brand , count(t.transaction_id) as count_of_tr
from transaction t
join customer c  on  t.customer_id = c.customer_id
WHERE
	t.online_order  = 'True' and t.order_status = 'Approved' and c.job_industry_category = 'IT'
group by t.brand;

-----------------------------------------------------

select
	c.customer_id, sum(t.list_price) as all_sum_of_t, max(t.list_price) as max_sum_of_t, min(t.list_price) as min_sum_of_t, count(t.list_price) as count_of_t
from transaction t
join customer c  on  t.customer_id = c.customer_id
group by c.customer_id
order by 
		sum(t.list_price) desc, count(t.list_price);

select 
    c.customer_id,
    sum(t.list_price) over (partition by c.customer_id) as all_sum_of_t,
    max(t.list_price) over (partition by c.customer_id) as max_sum_of_t,
    min(t.list_price) over (partition by c.customer_id) as min_sum_of_t,
    count(t.list_price) over (partition by c.customer_id) as count_of_t
from transaction t
join customer c on t.customer_id = c.customer_id
order by 
    all_sum_of_t desc, count_of_t

-------------------------------------------------------

with customer_sums as (
    select 
        c.customer_id, 
        sum(t.list_price) AS total_sum
    from transaction t
    join customer c on t.customer_id = c.customer_id
    group by c.customer_id
)
select 
    c.first_name, 
    c.last_name
from customer_sums cs
join customer c on cs.customer_id = c.customer_id
where cs.total_sum = (select min(total_sum) from customer_sums)
  and cs.total_sum is not NULL
  
  with customer_sums as (
    select 
        c.customer_id, 
        sum(t.list_price) AS total_sum
    from transaction t
    join customer c on t.customer_id = c.customer_id
    group by c.customer_id
)
select 
    c.first_name, 
    c.last_name
from customer_sums cs
join customer c on cs.customer_id = c.customer_id
where cs.total_sum = (select max(total_sum) from customer_sums)

--------------------------------------------------------------

with ranked_transactions as (
    select 
        t.transaction_id, 
        t.customer_id, 
        t.transaction_date,
        row_number() over (partition by t.customer_id order by t.transaction_date) as row_num
    from transaction t
)
select
    rt.transaction_id,
    rt.customer_id
from ranked_transactions rt
where rt.row_num = 1;

-----------------------------------------------------------------
with data_1 as (
	select t.customer_id as cust_id,  DATE_TRUNC('day', TO_DATE(t.transaction_date, 'DD-MM-YYYY')) as date from transaction t
	join customer c on t.customer_id = c.customer_id
	order by t.customer_id, date
),
data_2 as (
	select cust_id, max(date) - min(date) as rang 
	from data_1
	group by cust_id
	order by rang desc
)
select cust_id from data_2
where rang = (select MAX(rang) from data_2)
;
