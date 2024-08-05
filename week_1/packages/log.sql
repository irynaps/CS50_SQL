
-- *** The Lost Letter ***
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop' AND  "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
    )
);

-- *** The Devious Delivery ***
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop' AND  "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);

-- *** The Forgotten Gift ***

SELECT "packages"."contents", "drivers"."name", "packages"."id"
FROM "packages"
JOIN "scans" ON "packages"."id" = "scans"."package_id"
JOIN "drivers" ON "scans"."driver_id" = "drivers"."id"
WHERE "packages"."to_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '728 Maple Place'
)
AND "packages"."from_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '109 Tileston Street'
);