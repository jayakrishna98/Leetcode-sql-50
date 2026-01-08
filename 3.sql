-- Filter countries that either have a very large land area
-- (area greater than or equal to 3,000,000)
-- OR a very large population (population greater than or equal to 25,000,000)

select name, population, area from world
where area>=3000000 or population >=25000000