SELECT "city", COUNT(*) AS "public schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "public schools" DESC, "city"
LIMIT 10;