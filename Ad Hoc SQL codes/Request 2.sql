/*2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/


SELECT 
    X.unique_product_2020,
    Y.unique_products_2021,
    round(((Y.unique_products_2021-X.unique_product_2020) * 100 /  X.unique_product_2020),2)
    AS percentage_chg
FROM
    (SELECT COUNT(DISTINCT product_code) AS unique_product_2020 
     FROM fact_sales_monthly 
     WHERE fiscal_year = 2020) AS X,
    (SELECT COUNT(DISTINCT product_code) AS unique_products_2021 
     FROM fact_sales_monthly 
     WHERE fiscal_year = 2021) AS Y;
