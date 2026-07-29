SELECT
    ROUND(
        COUNT(
            CASE
                WHEN order_date = customer_pref_delivery_date THEN 1
                ELSE NULL
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS immediate_percentage
FROM
(
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS row_num
    FROM Delivery
) AS first_order
WHERE row_num = 1;

