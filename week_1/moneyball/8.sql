SELECT "salary" FROM "salaries"
JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
WHERE "salaries"."year" = '2001' AND "performances"."year" = '2001'
ORDER BY "HR" DESC
LIMIT 1;