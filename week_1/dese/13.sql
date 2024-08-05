SELECT "name", "per_pupil_expenditure", "exemplary" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;