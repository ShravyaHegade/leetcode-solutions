(
    SELECT u1.name AS results
    FROM Users AS u1
    JOIN MovieRating AS m2
        ON u1.user_id = m2.user_id
    GROUP BY u1.name
    ORDER BY COUNT(DISTINCT m2.movie_id) DESC, u1.name ASC
    LIMIT 1
)

UNION ALL

(
    SELECT m1.title AS results
    FROM Movies AS m1
    JOIN MovieRating AS m2
        ON m1.movie_id = m2.movie_id
    WHERE m2.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m1.title
    ORDER BY AVG(m2.rating) DESC, m1.title ASC
    LIMIT 1
);