-- Join the employee and bonus table by keeping bonus table as the left table 
-- As there might be employees who are present in employee table but didnt receive any bonus
-- Applying where condition for the <1000 condition

select name, bonus from employee a
left join bonus b
on
a.empid=b.empid
where bonus<1000 or bonus is null