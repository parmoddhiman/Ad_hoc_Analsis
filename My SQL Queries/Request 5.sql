/*5. Get the products that have the highest and lowest manufacturing costs.*/


select fm.product_code,
        p.product,
        fm.manufacturing_cost
from fact_manufacturing_cost fm
join dim_product p
on fm.product_code = p.product_code
where fm.manufacturing_cost in ( select max(manufacturing_cost) from fact_manufacturing_cost
								 union
                                 select min(manufacturing_cost) from fact_manufacturing_cost)
order by  fm.manufacturing_cost desc;