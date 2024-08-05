WITH PlayerPerformance AS (
    SELECT "players"."id" "first_name", "last_name", "salary", "performance""year", "HR",
        ROW_NUMBER() OVER (PARTITION BY "players"."id", "performances"."year"
        ORDER BY "performances"."HR" DESC, "salaries"."salary" DESC) AS "rn"
    FROM "players"
    LEFT JOIN "performances" ON "players"."id" = "performances"."player_id"
    LEFT JOIN "salaries" ON "players"."id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year"
)
SELECT "first_name", "last_name", "salary", "HR", "year"
FROM "PlayerPerformance"
WHERE "rn" = 1
ORDER BY "id", "year" DESC;

