-- To identify customers who visited but did not make any transaction, 
-- we filter records where transaction_id is NULL
-- To count how many times each customer did this, we group by customer_id and use COUNT

select customer_id,count(customer_id) as count_no_trans from visits a
left join transactions b on
a.visit_id = b.visit_id
where transaction_id is null
group by customer_id