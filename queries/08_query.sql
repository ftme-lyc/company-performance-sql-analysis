select category_name, product_name, unit_price, avg_unit_price, median_unit_price,
case
	when unit_price < avg_unit_price then 'Below Average'
	when unit_price = avg_unit_price then 'Equal Average'
	else 'Over Average'
end as price_vs_avg,
case
	when unit_price < median_unit_price then 'Below median'
	when unit_price = median_unit_price then 'Equal median'
	else 'Over median'
end as price_vs_median
from products p 
inner join categories c ON p.category_id = c.category_id
inner join (select 
		c.category_id,
		ROUND(AVG(p.unit_price)::NUMERIC,2) AS avg_unit_price,
		ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY p.unit_price))::NUMERIC,2) AS median_unit_price
	FROM categories AS c
	INNER JOIN products AS p
	ON c.category_id = p.category_id
	WHERE p.discontinued = 0
	GROUP BY 
		c.category_id) as cs on cs.category_id = p.category_id
order by category_name ASC, product_name ASC;