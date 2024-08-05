SELECT "name" AS 'District Name', SUM("pupils") AS 'Number Of Pupils'
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
GROUP BY "districts"."name"
ORDER BY SUM("pupils") DESC;