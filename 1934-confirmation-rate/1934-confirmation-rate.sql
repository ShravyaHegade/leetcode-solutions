SELECT
    s.user_id,
    ROUND(
        CASE
            WHEN COUNT(c.action) = 0 THEN 0
            ELSE COUNT(
                    CASE
                        WHEN c.action = 'confirmed' THEN 1
                    END
                 ) * 1.0 / COUNT(c.action)
        END,
        2
    ) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c
ON s.user_id = c.user_id
GROUP BY s.user_id;