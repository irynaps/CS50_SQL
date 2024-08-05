-- Represent users in database

CREATE TABLE "users"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "member_since" DATE NOT NULL,
    PRIMARY KEY("id")
);

-- Represent books
CREATE TABLE "books"(
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "released" DATE NOT NULL,
    PRIMARY KEY("id")
);

-- Represent authors
CREATE TABLE "authors"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Relate books and authors
CREATE TABLE "books_authors"(
    "id" INTEGER,
    "author_id" INTEGER,
    "book_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("author_id") REFERENCES "authors"("id"),
    FOREIGN KEY("book_id") REFERENCES "books"("id")
);

-- Represent genres
CREATE TABLE "genres"(
    "id" INTEGER,
    "genre" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

-- Relating genres with books
CREATE TABLE "books_genres"(
    "id" INTEGER,
    "book_id" INTEGER,
    "genre_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("genre_id") REFERENCES "genres"("id"),
    FOREIGN KEY("book_id") REFERENCES "books"("id")
);

-- Representing reads of books by each user
CREATE TABLE "reads"(
    "id" INTEGER,
    "book_id" INTEGER,
    "user_id" INTEGER,
    "date_started" DATE NOT NULL,
    "date_finished" DATE NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("book_id") REFERENCES "books"("id")
);

-- Representing rating that the users gave to the books with optional comments
CREATE TABLE "ratings"(
    "id" INTEGER,
    "user_id" INTEGER,
    "book_id" INTEGER,
    "read_id" INTEGER,
    "rating" DECIMAL (10, 2) CHECK ("rating" <= 10.0) NOT NULL,
    "date" DATE NOT NULL,
    "comment" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("book_id") REFERENCES "books"("id"),
    FOREIGN KEY("read_id") REFERENCES "reads"("id")
);

-- Creating indexes to speed up search
CREATE INDEX "username_index" ON "users" ("username");
CREATE INDEX "authors_index" ON "authors" ("last_name", "first_name");
CREATE INDEX "books_index" ON "books" ("title");
CREATE INDEX "ratings_date_index" ON "ratings" ("date");

-- A view for books that users read in 2022
CREATE VIEW "read_2022" AS
SELECT "books"."title" AS "title",
"authors"."first_name" || " " || "authors"."last_name" AS "author",
COUNT("reads"."id") AS "times_read"
FROM "books"
JOIN "books_authors" ON "books"."id" = "books_authors"."book_id"
JOIN "authors" ON "books_authors"."author_id" = "authors"."id"
JOIN "reads" ON "books"."id" = "reads"."book_id"
WHERE "reads"."date_started" >= '2022-01-01'
AND "reads"."date_finished" <= '2022-12-31'
GROUP BY "books"."title"
ORDER BY "authors"."last_name";

