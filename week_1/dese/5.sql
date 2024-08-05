SELECT "city", COUNT(*) AS "public schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "public schools" <= 3
ORDER BY "public schools" DESC, "city";