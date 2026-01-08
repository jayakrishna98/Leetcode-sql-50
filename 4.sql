-- Select unique author IDs where the author viewed their own article
-- Filter records where the author and the viewer are the same person
-- Sort the result in ascending order of author ID

select distinct author_id as id from views
where author_id=viewer_id 
order by id asc