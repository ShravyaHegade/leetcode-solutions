SELECT 
    product_name,
    SUM(unit) AS unit
FROM (
    SELECT 
        p1.product_id,
        p1.product_name,
        p2.order_date,
        p2.unit
    FROM Products AS p1
    JOIN Orders AS p2
        ON p1.product_id = p2.product_id
    WHERE p2.order_date BETWEEN '2020-02-01' AND '2020-02-29'
) AS t
GROUP BY product_name
HAVING SUM(unit) >= 100;