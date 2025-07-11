select product_name, unit_price
from products p
where unit_price BETWEEN 20 AND 50
    AND p.discontinued = 0
order by unit_price  desc;