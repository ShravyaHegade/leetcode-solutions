SELECT
    a.product_id,
    a.first_year,
    b.quantity,
    b.price
FROM
(
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) AS a
JOIN
(
    SELECT
        product_id,
        year,
        quantity,
        price
    FROM Sales
) AS b
ON a.product_id = b.product_id
AND a.first_year = b.year;