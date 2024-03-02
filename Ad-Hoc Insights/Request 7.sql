/*7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and take strategic decisions.
*/


select concat(monthname(s.date),"(",year(s.date),")") as month,
	   s.fiscal_year,
       round(sum(s.sold_quantity*g.gross_price),2) as gross_sales_amount
from fact_sales_monthly s
join fact_gross_price g
     on g.product_code = s.product_code
join dim_customer c
     on c.customer_code = s.customer_code
where c.customer = "Atliq Exclusive" 
group by month, s.fiscal_year
order by s.fiscal_year;
