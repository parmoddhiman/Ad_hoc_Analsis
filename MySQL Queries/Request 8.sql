/*8. In which quarter of 2020, got the maximum total_sold_quantity?*/


select 
 case
     when date between "2019-09-01" and "2019-11-01" then "Q1"
     when date between "2019-12-01" and "2020-02-01" then "Q2"
     when date between "2020-03-01" and "2020-05-01" then "Q3"
     when date between "2020-06-01" and "2020-08-01" then "Q4"
 end as quarters,
 round(sum(sold_quantity),2) as total_sold_quantity
 from fact_sales_monthly
 where fiscal_year = 2020
 group by quarters
 order by total_sold_quantity desc;
