select c.category_name,
case 
	when p.unit_price < 20 then '1. Below $20'
	when p.unit_price between 20 and 50 then '2. $20 - $50'
	else '3. Over $50'
end as price_range,
SUM((od.unit_price * od.quantity) * (1 - od.discount))::INTEGER AS total_amount,
COUNT(DISTINCT od.order_id) AS volume_of_orders
from categories c inner join products p on c.category_id = p.category_id 
inner join order_details od on od.product_id = p.product_id
group by c.category_name, price_range
order by c.category_name, price_range asc;