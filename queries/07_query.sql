select c.category_name,
case
	WHEN s.country IN ('USA', 'Canada', 'Mexico', 'Brazil') THEN 'America'
    WHEN s.country IN ('China', 'Japan', 'Australia', 'India','Singapore') THEN 'Asia-Pacific'
    ELSE 'Europe' 
end as supplier_region,
sum(p.unit_in_stock) as total_stock,
sum(p.unit_on_order) as total_orders,
sum(p.reorder_level) as total_reorders
from suppliers s inner join products p on s.supplier_id = p.supplier_id 
inner join categories c on c.category_id = p.category_id 
group by c.category_name, supplier_region 
order by c.category_name asc, supplier_region asc, total_reorders asc;