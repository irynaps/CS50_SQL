-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Adding users that read books
INSERT INTO "users" ("name", "username", "member_since")
VALUES
    ('Irene', 'gatto', '2016-07-01'),
    ('Tate', 'sirius', '2022-01-20'),
    ('Eugene', 'dante', '2019-03-03');

-- Adding titles that the users read
INSERT INTO "books" ("title", "released")
VALUES
    ('The Invisible Life of Addie LaRue', '2020-10-06'),
    ('If We Were Villains', '2017-04-11'),
    ('Project Hail Mary', '2021-05-04'),
    ('The Martian', '2014-02-11'),
    ('The Poppy War', '2018-05-01'),
    ('Six of Crows', '2015-09-29'),
    ('Artemis', '2017-11-14'),
    ('Crooked Kingdom', '2016-09-27'),
    ('Babel', '2022-08-23'),
    ('The Rook', '2012-01-11'),
    ('The Goldfinch', '2013-10-22'),
    ('The Way Of Kings', '2010-08-31'),
    ('Blade Itself', '2006-05-04'),
    ('Good Omens', '1990-05-10');

-- Adding authors of the books
INSERT INTO "authors" ("first_name", "last_name")
VALUES
    ('M. L.', 'Rio'),
    ('Andy', 'Weir'),
    ('R.F.', 'Kuang'),
    ('Leigh', 'Bardugo'),
    ('V. E.', 'Schwab'),
    ('Daniel', 'O''Malley'),
    ('Donna', 'Tartt'),
    ('Brandon', 'Sanderson'),
    ('Joe', 'Abercrombie'),
    ('Neil', 'Gaiman'),
    ('Terry', 'Pratchett');

-- Relating books to authors
INSERT INTO "books_authors" ("author_id", "book_id")
VALUES
    (5, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (4, 6),
    (2, 7),
    (4, 8),
    (3, 9),
    (6, 10),
    (7, 11),
    (8, 12),
    (9, 13),
    (10, 14),
    (11, 14);

-- Adding genres
INSERT INTO "genres" ("genre")
VALUES
    ('Fiction'),
    ('Science Fiction'),
    ('Fantasy'),
    ('Mystery'),
    ('Adventure'),
    ('Historical Fiction'),
    ('Romance'),
    ('Thriller'),
    ('Dystopian'),
    ('Horror');

-- Relating books with genres
INSERT INTO "books_genres" ("book_id", "genre_id")
VALUES
    (1, 1),
    (2, 1),
    (2, 4),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 3),
    (8, 3),
    (8, 4),
    (9, 3),
    (10, 4),
    (11, 1),
    (12, 5),
    (13, 1),
    (14, 1),
    (14, 2),
    (3, 9),
    (4, 7),
    (10, 8),
    (11, 6),
    (5, 10),
    (13, 9);

-- Inserting the reads of each user
INSERT INTO "reads" ("book_id", "user_id", "date_started", "date_finished")
VALUES
    (1, 1, '2021-05-15', '2021-06-01'),
    (2, 2, '2023-01-15', '2023-01-25'),
    (3, 3, '2022-05-01', '2022-05-10'),
    (4, 1, '2021-03-10', '2021-04-05'),
    (5, 2, '2022-07-20', '2022-08-10'),
    (6, 3, '2020-11-05', '2020-12-20'),
    (7, 1, '2022-02-15', '2022-02-28'),
    (8, 2, '2023-03-15', '2023-03-30'),
    (9, 3, '2022-09-10', '2022-09-20'),
    (10, 1, '2021-10-20', '2021-11-10'),
    (11, 2, '2022-04-15', '2022-05-05'),
    (12, 3, '2023-02-10', '2023-02-25'),
    (13, 1, '2021-07-05', '2021-07-15'),
    (14, 2, '2021-06-15', '2021-06-25'),
    (7, 3, '2020-08-10', '2020-09-05');

-- Insert data into the "ratings" table (with optional comments)
INSERT INTO "ratings" ("user_id", "book_id", "read_id", "rating", "date", "comment")
VALUES
    (1, 1, 1, 8.5, '2021-06-02', 'Enjoyed it a lot'),
    (2, 2, 2, 7.8, '2023-01-26', 'Great characters!'),
    (3, 3, 3, 9.2, '2022-05-11', 'One of my favorites'),
    (1, 4, 4, 9.0, '2021-04-06', 'Science at its best'),
    (2, 5, 5, 8.0, '2022-08-11', 'Epic fantasy'),
    (3, 6, 6, 9.5, '2020-12-21', 'Couldn''t put it down'),
    (2, 8, 8, 8.5, '2023-03-31', 'Sequel is a must-read'),
    (3, 9, 9, 8.0, '2022-09-21', 'Enjoyable adventure'),
    (2, 11, 11, 9.0, '2022-05-06', 'Beautifully written'),
    (3, 12, 12, 9.8, '2023-02-26', 'Epic fantasy world'),
    (1, 13, 13, 7.5, '2021-07-16', 'Interesting characters'),
    (2, 14, 14, 8.7, '2021-06-26', 'Hilarious');

INSERT INTO "ratings" ("user_id", "book_id", "read_id", "rating", "date")
VALUES
    (1, 7, 7, 7.2, '2022-03-01'),
    (1, 10, 10, 8.2, '2021-11-11'),
    (3, 7, 15, 7.0, '2020-09-06');


-- Selecting books read by dante
SELECT "title" FROM "books"
WHERE "id" IN (
    SELECT "book_id" FROM "reads"
    WHERE "user_id" = (
        SELECT "id" FROM "users"
        WHERE "username" = 'dante'
    )
);

-- Selecting avarage rating by gatto
SELECT ROUND(AVG("rating"), 2) FROM "ratings"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'gatto'
);

-- Selecting how many books sirius read in 2023
SELECT COUNT("id") FROM "reads"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'sirius'
)
AND "date_started" >= '2022-01-01'
AND "date_finished" <= '2022-12-31';

-- Select all books written by R. F. Kuang
SELECT "title" FROM "books"
WHERE "id" IN (
    SELECT "book_id" FROM "books_authors"
    WHERE "author_id" = (
        SELECT "id" FROM "authors"
        WHERE "last_name" = 'Kuang'
    )
);

-- Selecting the data
SELECT * FROM "books";
SELECT * FROM "authors";
