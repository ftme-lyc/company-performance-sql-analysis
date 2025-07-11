select to_char(order_date, 'YYYY-MM') || '-01' as date,
count(order_id) as total_orders,
round(sum(freight)) as total_freight
from orders 
where order_date between '1997-01-01' AND '1998-12-31'
group by to_char(order_date, 'YYYY-MM') ||'-01'
having count(order_id) > 35
order by total_freight desc;