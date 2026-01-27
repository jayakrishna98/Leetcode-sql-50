--METHOD - 1
-- This solution uses multiple CTEs to break down the logic into clear, sequential steps.
-- Separate datasets are created for 'start' and 'end' activity records.
-- These datasets are joined to calculate the processing time for each process.
-- Finally, the average processing time per machine is calculated and rounded to 3 decimal places.

with ct1 as (
    select machine_id, process_id, timestamp from activity
    where activity_type='start'
),

ct2 as (
    select machine_id, process_id, timestamp from activity
    where activity_type='end'
),

ct3 as (
    select a.machine_id, a.process_id, 
    a.timestamp as start_time,
    b.timestamp as end_time
    from ct1 a
    join ct2 b
    on
    a.machine_id=b.machine_id and
    a.process_id=b.process_id
),

ct4 as (
    select machine_id, (end_time - start_time) as diff
    from ct3
)

select machine_id, round(avg(diff),3) as processing_time
from ct4 group by machine_id

--METHOD - 2 (with less time complexity)

select 
    a1.machine_id, 
    ROUND(AVG(a2.timestamp - a1.timestamp),3) as processing_time
from Activity a1
join Activity a2
on 
    a1.process_id=a2.process_id
    and a1.machine_id=a2.machine_id
    and a1.timestamp<a2.timestamp
    group by a1.machine_id;