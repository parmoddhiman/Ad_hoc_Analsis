/*6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.*/


select p.customer_code, 
       c.customer,
       p.pre_invoice_discount_pct as average_discount_percentage
from fact_pre_invoice_deductions p
join dim_customer c
on c.customer_code = p.customer_code
where p.pre_invoice_discount_pct > (select avg(pre_invoice_discount_pct) 
                                    from fact_pre_invoice_deductions)
                              and p.fiscal_year = 2021 and
                              market = "india"
order by average_discount_percentage 
desc limit 5;                                 

