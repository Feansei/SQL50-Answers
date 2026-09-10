-- Write your PostgreSQL query statement below
select product_name, year, price
from Product
    right join Sales
        on Sales.product_id = Product.product_id
;