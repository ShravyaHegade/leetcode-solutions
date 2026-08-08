SELECT person_name
FROM (
    SELECT person_name,
           person_id,
           turn,
           weight,
           SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM queue
) t
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;