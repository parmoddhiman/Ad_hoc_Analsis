/*10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?*/ 


with cte as(
select p.division,
       p.product_code,
       p.product,
       sum(sold_quantity) as total_sold_quantity
  from fact_sales_monthly s
  join dim_product p 
  on p.product_code = s.product_code
  where fiscal_year = 2021
  group by p.division , p.product,p.product_code
  order by total_sold_quantity desc),
 cte1 as ( select *,rank() over(partition by division order by total_sold_quantity DESC) as rank_order from cte )
 select * from cte1	
 where rank_order<4;