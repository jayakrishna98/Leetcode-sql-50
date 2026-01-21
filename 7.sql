-- This query joins product data 
-- with sales data to fetch product-wise price details by year

select product_name, year, price from product a
join sales b
on a.product_id=b.product_id;