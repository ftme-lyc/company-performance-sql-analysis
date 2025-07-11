select e.first_name || ' ' || e.last_name AS employee_full_name,
e.title as job_title,
sum(od.unit_price * od.quantity)::numeric(10,2) as total_sales_without_discount,
count(distinct od.order_id) as total_unique_orders,
count(od.order_id) as total_orders,
avg(od.unit_price * od.quantity)::numeric(10,2) as avg_product_amount,
(sum(od.unit_price * od.quantity)/count(distinct od.order_id))::numeric(10,2) as avg_order_amount,
sum((od.unit_price * od.quantity)* od.discount)::numeric(10,2) as total_discount,
sum((od.unit_price * od.quantity)*(1-od.discount))::numeric(10,2) as total_sales_with_discount,
((sum((od.unit_price * od.quantity)* od.discount)/ SUM(od.unit_price * od.quantity))*100)::numeric(10,2) as total_discount_percentage
from employees e inner join orders o on e.employee_id = o.employee_id 
inner join order_details od on od.order_id = o.order_id 
GROUP BY employee_full_name, job_title
order by total_sales_with_discount desc;