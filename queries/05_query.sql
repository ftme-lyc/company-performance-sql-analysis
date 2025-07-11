select p.product_name, current_price ,initial_price,
ROUND(100*(pi.current_price - pi.initial_price)/pi.initial_price) AS percentage_increase
from (select DISTINCT
	od.product_id,
        ROUND(FIRST_VALUE(od.unit_price) OVER (PARTITION BY od.product_id ORDER BY od.order_id)::numeric, 2) AS initial_price,
        ROUND(LAST_VALUE(od.unit_price) OVER (PARTITION BY od.product_id ORDER BY od.order_id RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)::numeric, 2) AS current_price
FROM order_details od) as pi 
INNER JOIN products p
ON pi.product_id = p.product_id
WHERE ROUND(((pi.current_price - pi.initial_price) / pi.initial_price * 100)::numeric, 0) NOT BETWEEN 20 AND 30
order by  percentage_increase asc;