-- Since unique_id can be NULL and name must always be populated,
-- the employee table is used as the left table.
-- A LEFT JOIN is performed with the employee_uni table on the right
-- to retrieve all employee names along with their corresponding unique_ids.
-- For employees without a matching record in employee_uni,
-- the unique_id will be returned as NULL.

select unique_id,name from employees emp
left join employeeuni emp_uni
on
emp_uni.id = emp.id