select *, ROUND(
		total_sales_with_discount / SUM(total_sales_with_discount)
			OVER (PARTITION BY employee_full_name) * 100,
		5) AS percentage_of_employee_sales,
	ROUND(	
		total_sales_with_discount / SUM(total_sales_with_discount)
			OVER (PARTITION BY category_name) * 100,
		5) AS percentage_of_category_sales
from( select c.category_name ,e.first_name || ' ' || e.last_name AS employee_full_name,
sum((od.unit_price * od.quantity)*(1-od.discount))::numeric(10,2) as total_sales_with_discount
from employees e inner join orders o on e.employee_id = o.employee_id 
inner join order_details od on od.order_id = o.order_id 
inner join products p on p.product_id = od.product_id 
inner join categories c on c.category_id = p.category_id
GROUP BY 
	category_name,
	employee_full_name) as kpi
GROUP BY 
	category_name,
	employee_full_name,
	total_sales_with_discount
ORDER BY
	category_name,
	total_sales_with_discount DESC;