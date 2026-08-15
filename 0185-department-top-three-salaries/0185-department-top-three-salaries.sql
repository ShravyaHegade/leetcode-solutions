SELECT e2.name AS Department,
       e1.name AS Employee,
       e1.salary AS Salary
FROM (
    SELECT *,
           DENSE_RANK() OVER (
               PARTITION BY departmentId
               ORDER BY salary DESC
           ) AS rnk
    FROM Employee
) AS e1
JOIN Department AS e2
    ON e1.departmentId = e2.id
WHERE e1.rnk <= 3;
