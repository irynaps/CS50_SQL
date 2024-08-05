SELECT "name" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
GROUP BY "name"
HAVING SUM("pupils") = (
    SELECT MIN("total_pupils") FROM (
        SELECT SUM("pupils") AS "total_pupils"
        FROM "expenditures"
        GROUP BY "district_id"
    )
);