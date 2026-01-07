-- Any comparison with NULL returns UNKNOWN, not TRUE, so we have to explicitly 
-- mention referee_id is null because

select name from customer
where referee_id!='2' or referee_id is null