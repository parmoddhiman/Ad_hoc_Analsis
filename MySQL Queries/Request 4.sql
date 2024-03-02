/*4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020?/* 


with cte as (  select p.segment as A,
	       count(distinct(fs.product_code)) as B
	       from dim_product p, fact_sales_monthly fs 
               where p.product_code = fs.product_code
	       group by segment, fiscal_year
	       having fs.fiscal_year = 2020	 			
),
				
 cte1 as ( select p.segment as C,
	   COUNT(DISTINCT(fs.product_code)) as D
	   from dim_product p, fact_sales_monthly fs 
	   where p.product_code = fs.product_code
	   group by segment, fiscal_year
	   having fs.fiscal_year = 2021
  )           
       
 select cte.A as segment,
		cte.B as product_count_2020,
        cte1.D as product_count_2021,
        (cte1.D-cte.B) as differnce
 from cte, cte1 where cte.A = cte1.C;