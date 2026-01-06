-- Since only distinct product IDs are required, the SELECT statement includes only the product_id column.
-- A WHERE clause is applied to filter product IDs that are both low fat and recyclable.

select distinct product_id from products
where low_fats='Y' and recyclable='Y'