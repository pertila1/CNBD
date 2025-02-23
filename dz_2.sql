select  distinct brand 
from transaction
where standard_cost > 1500;


select transaction_id from transaction
where order_status = 'Approved' 
and TO_TIMESTAMP(transaction_date, 'DD.MM.YYYY') 
    BETWEEN TO_TIMESTAMP('01.04.2017', 'DD.MM.YYYY') 
        AND TO_TIMESTAMP('10.04.2017', 'DD.MM.YYYY');
        
        
select job_title from customer
where job_industry_category in ('IT', 'Financial Services') and job_title like 'Senior%';


select Distinct brand from transaction
where customer_id in (
	select customer_id from customer
	where job_industry_category = 'Financial Services';
	)
	
	
select customer_id  from transaction
where online_order = 'True' and brand in ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles');
limit 10


select customer_id  from customer
where customer_id not in (select customer_id from transaction);


select customer_id from transaction
where customer_id in (
						select customer_id from customer
					  	where	job_industry_category = 'IT' 						
					)
and standard_cost = (
    SELECT MAX(standard_cost) FROM transaction
);



select customer_id from transaction
where customer_id in (select customer_id from customer where job_industry_category in ('IT', 'Health')) 
and order_status = 'Approved' and TO_TIMESTAMP(transaction_date, 'DD.MM.YYYY') 
    BETWEEN TO_TIMESTAMP('07.07.2017', 'DD.MM.YYYY') 
        AND TO_TIMESTAMP('18.07.2017', 'DD.MM.YYYY');






