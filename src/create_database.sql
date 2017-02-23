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
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(1023) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `categories` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `completed_tasks` (
    `user_id` INT NOT NULL,
    `task_id` INT NOT NULL,
    `timestamp` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `social_graph` (
    `follower_id` INT NOT NULL,
    `followee_id` INT NOT NULL,
    PRIMARY KEY (`follower_id`,`followee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
