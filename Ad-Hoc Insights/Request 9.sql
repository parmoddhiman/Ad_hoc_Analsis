/*9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?*/


with cte as (
select c.channel,
       sum(g.gross_price*s.sold_quantity) as gross_sale
from fact_sales_monthly s
join dim_customer c
on c.customer_code = s.customer_code
join fact_gross_price g
on g.product_code = s.product_code
where s.fiscal_year = 2021
group by channel
order by gross_sale desc
)
select channel,
     round(gross_sale/1000000,2) as gross_sale_in_mln,
     round((gross_sale/sum(gross_sale) over())*100,2) as percentage
from cte;
