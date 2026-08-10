SELECT s1.id,
       s2.student
FROM (
    SELECT s.id,
           CASE
               WHEN MOD(s.id, 2) = 1
                    AND EXISTS (
                        SELECT 1
                        FROM Seat s_next
                        WHERE s_next.id = s.id + 1
                    )
               THEN s.id + 1

               WHEN MOD(s.id, 2) = 0
               THEN s.id - 1

               ELSE s.id
           END AS new_id
    FROM Seat s
) s1
JOIN Seat s2
    ON s1.new_id = s2.id
ORDER BY s1.id;