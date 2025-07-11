select e1.first_name || ' ' || e1.last_name as employee_full_name,
e1.title as employee_job_title,
EXTRACT(YEAR FROM AGE(e1.hire_date, e1.birth_date))::INT as employee_age,
e2.first_name || ' ' || e2.last_name as manager_full_name,
e2.title as manager_job_title
from employees e1 left join employees e2 on e1.reports_to = e2.employee_id
order by employee_age asc, employee_full_name asc;
