SELECT "first_name", "last_name",
    CASE
        WHEN "performances"."H" > 0
        THEN "salaries"."salary" / "performances"."H"
        ELSE NULL
    END AS "dollars per hit"
FROM "players"
JOIN "performances" ON "players"."id" = "performances"."player_id" AND "performances"."year" = '2001'
LEFT JOIN "salaries" ON "players"."id" = "salaries"."player_id" AND "salaries"."year" = '2001'
WHERE "performances"."H" IS NOT NULL AND "performances"."H" > 0
AND "salaries"."salary" IS NOT NULL AND "salaries"."salary" > 0
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10;
