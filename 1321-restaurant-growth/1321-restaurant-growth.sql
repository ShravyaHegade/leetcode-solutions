SELECT visited_on,
       total_amount AS amount,
       ROUND(total_amount / 7, 2) AS average_amount
FROM (
    SELECT visited_on,
           SUM(amount) OVER (
               ORDER BY visited_on
               ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
           ) AS total_amount
    FROM (
        SELECT visited_on,
               SUM(amount) AS amount
        FROM Customer
        GROUP BY visited_on
    ) AS t1
) AS t2
WHERE visited_on >= (
    SELECT visited_on
    FROM (
        SELECT visited_on,
               ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
        FROM Customer
        GROUP BY visited_on
    ) AS t3
    WHERE rn = 7
)
ORDER BY visited_on;