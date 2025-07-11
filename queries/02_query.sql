select ship_country, count(distinct order_id) as total_orders,
	round(avg((EXTRACT(DAY FROM (shipped_date - order_date) * INTERVAL '1 DAY'))::numeric),2) as avg_days 
from orders 
where date_part('year',order_date) = 1998
group by ship_country
having round(avg((EXTRACT(DAY FROM (shipped_date - order_date) * INTERVAL '1 DAY'))::numeric),2) >= 5
	and count(distinct order_id) > 10
order by ship_country asc;