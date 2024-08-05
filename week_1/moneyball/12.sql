WITH hits AS (
    SELECT "first_name", "last_name",
        CASE
            WHEN "performances"."H" IS NOT NULL AND "performances"."H" > 0
            AND "salaries"."salary" IS NOT NULL AND "salaries"."salary" > 0
            THEN "salaries"."salary" / "performances"."H"
            ELSE NULL
        END AS "dollars per hit",
    ROW_NUMBER() OVER (
        ORDER BY
            CASE WHEN "performances"."H" IS NOT NULL AND "performances"."H" > 0
            AND "salaries"."salary" IS NOT NULL AND "salaries"."salary" > 0
            THEN "salaries"."salary" / "performances"."H" ELSE NULL END, "players"."id"
    ) AS "hit_rank"
    FROM "players"
    JOIN "performances" ON "players"."id" = "performances"."player_id" AND "performances"."year" = '2001'
    LEFT JOIN "salaries" ON "players"."id" = "salaries"."player_id" AND "salaries"."year" = '2001'
    WHERE "performances"."H" IS NOT NULL AND "performances"."H" > 0
    AND "salaries"."salary" IS NOT NULL AND "salaries"."salary" > 0
),
rbi AS (
    SELECT "first_name", "last_name",
        CASE
            WHEN "performances"."RBI" IS NOT NULL AND "performances"."RBI" > 0
            AND "salaries"."salary" IS NOT NULL AND "salaries"."salary" > 0
            THEN "salaries"."salary" / "performances"."RBI"
            ELSE NULL
        END AS "dollars per RBI",
    ROW_NUMBER() OVER (
        ORDER BY
            CASE WHEN "performances"."RBI" IS NOT NULL AND "performances"."RBI" > 0
            AND "salaries"."salary" IS NOT NULL AND "salaries"."salary" > 0
            THEN "salaries"."salary" / "performances"."RBI"
            ELSE NULL END, "players"."id") AS "rbi_rank"
    FROM "players"
    JOIN "performances" ON "players"."id" = "performances"."player_id" AND "performances"."year" = '2001'
    LEFT JOIN "salaries" ON "players"."id" = "salaries"."player_id" AND "salaries"."year" = '2001'
    WHERE "performances"."RBI" IS NOT NULL AND "performances"."RBI" > 0
    AND "salaries"."salary" IS NOT NULL AND "salaries"."salary" > 0
)
SELECT "hits"."first_name", "hits"."last_name" FROM "hits"
JOIN "rbi" ON "hits"."first_name" = "rbi"."first_name" AND "hits"."last_name" = "rbi"."last_name"
LEFT JOIN "players" ON "hits"."first_name" = "players"."first_name" AND "hits"."last_name" = "players"."last_name"
WHERE "hits"."hit_rank" <= 10 AND "rbi"."rbi_rank" <= 10
ORDER BY "players"."id";