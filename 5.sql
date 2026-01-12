-- As we wanted the distinct tweet_id's 
-- where the length of the content is grater than 15 characters

select distinct tweet_id from tweets
where length(content)>15