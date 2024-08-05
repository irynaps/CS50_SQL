CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) UNIQUE NOT NULL,
    `password` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `type` VARCHAR(32) NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `year` INT NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `industry` VARCHAR(32) NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections_people` (
    `id` INT AUTO_INCREMENT,
    `first_user_id` INT,
    `second_user_id` INT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`first_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`second_user_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `connections_schools` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `school_id` INT,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME,
    `degree` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `connections_companies` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
