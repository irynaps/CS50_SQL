SELECT "name", ROUND(AVG("salary")) as "average salary" FROM "teams"
JOIN "salaries" ON "teams"."id" = "salaries"."team_id"
WHERE  "salaries"."year" = '2001'
GROUP BY "name"
ORDER BY "average salary"
LIMIT 5;