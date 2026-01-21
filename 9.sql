--METHOD - 1
-- Use window functions to fetch the previous day's temperature and date in the same row with new columns for comparision
-- In where condition compare the tempratures and also make sure the previous date matches with calculated previous date

with ct1 as (
    select *, lag(temperature) over(order by recordDate) as prev_temp,
    lag(recorddate) over(order by recordDate) as prev_date,
    date_sub(recorddate,interval 1 day) as prev_date_cal from weather
)

select id from ct1 where temperature > prev_temp and prev_date = prev_date_cal

--METHOD - 2
--In the join condition itself we compare the data with today's data with yesterday's
-- Also the where condition is checked for temperature
SELECT W1.id
FROM Weather a
JOIN Weather b
ON W1.recordDate = DATE_ADD(W2.recordDate, INTERVAL 1 DAY)
WHERE W1.temperature > W2.temperature;