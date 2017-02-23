CREATE DATABASE IF NOT EXISTS more_each_day;

USE more_each_day;

CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tasks` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_id` INT NOT NULL,
    `level` INT,
    `description` VARCHAR(1023) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `categories` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `completed_tasks` (
    `user_id` INT NOT NULL,
    `task_id` INT NOT NULL,
    `timestamp` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`, `task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `social_graph` (
    `follower_id` INT NOT NULL,
    `followee_id` INT NOT NULL,
    PRIMARY KEY (`follower_id`,`followee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO users
(`username`, `email`, `password`)
VALUES
("Pesho", "pesho@abv.bg", "-283299419"),
("Gosho", "gosho@abv.bg", "1039225874"),
("Ivan", "ivan@abv.bg", "1291032922"),
("Pencho", "pencho@abv.bg", "961537777"),
("Borko", "borko@abv.bg", "-120001047"),
("Mitko", "mitko@abv.bg", "-847457412"),
("Marto", "marto@abv.bg", "-1449983911"),
("Boncho", "boncho@abv.bg", "-1635264695"),
("Grisho", "grisho@abv.bg", "42329308"),
("Roncho", "roncho@abv.bg", "430058809");

INSERT INTO social_graph
(`follower_id`, `followee_id`)
VALUES
(1,3),
(1,5),
(1,7),
(1,9),
(2,1),
(2,4),
(2,7),
(3,2),
(3,7),
(3,8),
(4,1),
(4,2),
(4,6),
(5,2),
(5,4),
(5,8),
(6,7),
(6,8),
(6,9),
(7,2),
(7,1),
(7,4),
(7,3),
(8,2),
(8,6),
(8,7),
(9,3),
(9,6),
(9,8),
(10,2),
(10,7),
(10,9),

INSERT INTO categories
(`name`)
VALUES
("Fun"),
("Travel"),
("Health"),
("Cooking");


INSERT INTO tasks
(`category_id`, `level`, `description`)
VALUES
(1, 1, "See a movie"),
(1, 1, "Go to a concert"),
(1, 1, "Play bolwling"),
(1, 1, "Go to a football game"),
(1, 1, "Go to a basketball game"),
(4, 1, "Make yourself a dinner"),
(4, 3, "Make a dinner for your friends"),
(4, 2, "Eat fish for dinner twice in a week"),
(4, 1, "Make yourself a breakfast"),
(4, 1, "Make yourself a lunch"),
(3, 1, "Go for a jog"),
(3, 2, "Go for a jog twice in a week"),
(3, 3, "Go for a jog 5 times in a week"),
(3, 1, "Walk 2km after work in the park"),
(3, 2, "Walk 5km after work in the park"),
(3, 3, "Walk 10km after work in the park"),
(2, 1, "Visit Rila Monastery"),
(2, 1, "Visit Tsarewets"),
(2, 1, "Visit Rila lakes"),
(2, 1, "Visit Cherni Vruh"),
(2, 1, "Visit Boyana Church"),
(2, 1, "Go to the sea");

INSERT INTO completed_tasks
(`user_id`, `task_id`, `timestamp`)
VALUES
(1,1, "2017-02-23 22:46:39"),
(1,4, "2017-02-20 22:46:39"),
(1,18, "2017-02-19 22:46:39"),
(1,5, "2017-02-21 22:46:39"),
(1,17, "2017-02-10 22:46:39"),
(1,7, "2017-02-02 22:46:39"),
(2,3, "2017-02-02 22:46:39"),
(2,10, "2017-02-18 22:46:39"),
(2,9, "2017-02-17 22:46:39"),
(2,4, "2017-02-20 22:46:39"),
(2,13, "2017-02-19 22:46:39"),
(2,17, "2017-02-21 22:46:39"),
(3,4, "2017-02-23 22:46:39"),
(3,8, "2017-02-17 22:46:39"),
(3,9, "2017-02-16 22:46:39"),
(3,10, "2017-02-15 22:46:39"),
(3,11, "2017-02-14 22:46:39"),
(3,2, "2017-02-17 22:46:39"),
(3,7, "2017-02-20 22:46:39"),
(3,12, "2017-02-22 22:46:39"),
(3,15, "2017-02-18 22:46:39"),
(4,18, "2017-02-23 22:46:39"),
(4,21, "2017-02-10 22:46:39"),
(4,22, "2017-02-07 22:46:39"),
(4,17, "2017-02-06 22:46:39"),
(5,1, "2017-02-06 22:46:39"),
(5,11, "2017-02-08 22:46:39"),
(5,19, "2017-02-12 22:46:39"),
(5,18, "2017-02-16 22:46:39"),
(6,18, "2017-02-04 22:46:39"),
(6,17, "2017-02-22 22:46:39"),
(6,4, "2017-02-23 22:46:39"),
(6,14, "2017-02-22 22:46:39"),
(7,8, "2017-02-18 22:46:39"),
(7,5, "2017-02-17 22:46:39"),
(7,19, "2017-02-19 22:46:39"),
(7,11, "2017-02-16 22:46:39"),
(8,3, "2017-02-16 22:46:39"),
(8,22, "2017-02-19 22:46:39"),
(8,4, "2017-02-21 22:46:39"),
(8,5, "2017-02-23 22:46:39"),
(9,1, "2017-02-23 22:46:39"),
(9,7, "2017-02-22 22:46:39"),
(9,9, "2017-02-21 22:46:39"),
(9,14, "2017-02-19 22:46:39"),
(10,20, "2017-02-19 22:46:39"),
(10,18, "2017-02-09 22:46:39"),
(10,16, "2017-02-06 22:46:39"),
(10,8, "2017-02-15 22:46:39");
