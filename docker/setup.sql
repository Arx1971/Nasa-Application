CREATE DATABASE IF NOT EXISTS `nasa_space_exploration_database`;
USE `nasa_space_exploration_database`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE user
(
    `user_id` INT          NOT NULL AUTO_INCREMENT,
    `email`    VARCHAR(100) NOT NULL,
    `username` VARCHAR(30)  NOT NULL,
    `password` VARCHAR(256) NOT NULL,
    PRIMARY KEY (`user_id`)
);

LOCK
TABLES `user` WRITE;
INSERT INTO `user` (`user_id`, `username`, `email`, `password`)
VALUES (1, 'joseph', 'joseph@email.com', '$2y$12$pjxbaMXKh0o.22b9ye1TP.1qC9i.gcgDR.kAhvA5C.GKgD1j48vjq'),
       (2, 'loren', 'loren@email.com', '$2y$12$xAVWv.TCNn5Ek.JRaED6E.YV3MtuMtWXpEI0VGtkjf0pSyLvdLubK'),
       (3, 'sally', 'sally@email.com', '$2y$12$k1f7VuWnyd52/xS7qw1PHO3NAq3.sk2mR3BmGcq9zlxgrgmZjUb2S');
UNLOCK
TABLES;

DROP TABLE IF EXISTS `role`;
CREATE TABLE role
(
    `role_id` INT          NOT NULL AUTO_INCREMENT,
    `name`     VARCHAR(100) NOT NULL,
    PRIMARY KEY (`role_id`)
);

LOCK
TABLES `role` WRITE;
INSERT INTO `role` (`role_id`, `name`)
VALUES (1, 'ROLE_USER'),
       (2, 'ROLE_MODERATOR'),
       (3, 'ROLE_ADMIN');
UNLOCK
TABLES;


DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`
(
    `user_id` int NOT NULL,
    `role_id` int NOT NULL,
    PRIMARY KEY (`user_id`, `role_id`),
    CONSTRAINT `fk_user_roles_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_user_roles_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


LOCK
TABLES `user_roles` WRITE;
INSERT INTO `user_roles` (`user_id`, `role_id`)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 3),
       (3, 3);
UNLOCK
TABLES;


DROP TABLE IF EXISTS `astronaut_info`;
CREATE TABLE `astronaut_info`
(
    `astronaut_id`      int         NOT NULL AUTO_INCREMENT,
    `astronaut_fname`   varchar(20) NOT NULL,
    `astronaut_lname`   varchar(20) NOT NULL,
    `astronaut_dob`     date        NOT NULL,
    `astronaut_country` varchar(20) NOT NULL,
    `astronaut_gender`  char(1) DEFAULT NULL,
    PRIMARY KEY (`astronaut_id`)
);


LOCK
TABLES `astronaut_info` WRITE;
INSERT INTO `astronaut_info` (`astronaut_id`, `astronaut_fname`, `astronaut_lname`, `astronaut_dob`,
                              `astronaut_country`, `astronaut_gender`)
VALUES (1, 'Joseph', 'Acaba', '1967-12-12', 'USA', 'M'),
       (2, 'Loren', 'Acton', '1936-12-09', 'USA', 'M'),
       (3, 'Mike', 'Adams', '1948-09-10', 'USA', 'M'),
       (4, 'Viktor', 'Adanasyev', '1951-09-07', 'RUSSIA', 'M'),
       (5, 'Aleksandr', 'Aleksandrov', '1952-09-07', 'BULGARIA', 'M'),
       (6, 'Sally', 'Ride', '1951-12-12', 'USA', 'F'),
       (7, 'Valentina', 'Tereshkova', '1951-12-12', 'Russia', 'F'),
       (8, 'Eileen', 'Collins', '1956-12-12', 'USA', 'F'),
       (9, 'Judith', 'Resnik', '1949-12-12', 'USA', 'F'),
       (10, 'Shannon', 'Lucid', '1943-12-02', 'USA', 'F'),
       (11, 'Optimus', 'Prime', '1943-12-01', 'USA', 'F'),
       (12, 'Iron', 'Prime', '1943-12-01', 'USA', 'F'),
       (13, 'Tushar', 'Kapoor', '1943-12-01', 'USA', 'F'),
       (14, 'TEST', 'DOUBLE', '1943-12-01', 'USA', 'F'),
       (15, 'Optimus', 'Prime', '1943-12-01', 'Cybertron', 'M'),
       (16, 'Adnan', 'Rahin', '1943-12-01', 'Cybertron', 'M');
UNLOCK
TABLES;



DROP TABLE IF EXISTS `astronaut_child_info`;

CREATE TABLE `astronaut_child_info`
(
    `astronaut_child_id`   int         NOT NULL,
    `astronaut_child_name` varchar(30) NOT NULL,
    `astronaut_id`         int DEFAULT NULL,
    PRIMARY KEY (`astronaut_child_id`),
    KEY                    `astronaut_id` (`astronaut_id`),
    CONSTRAINT `astronaut_child_info_ibfk_1` FOREIGN KEY (`astronaut_id`) REFERENCES `astronaut_info` (`astronaut_id`)
);



LOCK
TABLES `astronaut_child_info` WRITE;
INSERT INTO `astronaut_child_info` (`astronaut_child_id`, `astronaut_child_name`, `astronaut_id`)
VALUES (1, 'Joseph Bacaba', 1),
       (2, 'Joseph Cacaba', 1),
       (3, 'Loren Acton', 2),
       (4, 'Aleksandr Bleeksandrov Jr', 5),
       (5, 'Aleksandr Cleeksandrov Jr', 5),
       (6, 'Valentina Pareshkova', 7),
       (7, 'Eileen Farel', 9);
UNLOCK
TABLES;

DROP TABLE IF EXISTS `university_info`;
CREATE TABLE `university_info`
(
    `university_id`   int         NOT NULL,
    `university_name` varchar(30) NOT NULL,
    PRIMARY KEY (`university_id`)
);


LOCK
TABLES `university_info` WRITE;
INSERT INTO `university_info` (`university_id`, `university_name`)
VALUES (1, 'University of Arizona'),
       (2, 'Binghamton University'),
       (3, 'Harvard University'),
       (4, 'Princeton University'),
       (5, 'Rugers University'),
       (6, 'Stony Brook University'),
       (7, 'Fordam University'),
       (8, 'Wyoming University'),
       (9, 'Stanford University');
UNLOCK
TABLES;


DROP TABLE IF EXISTS `degree_info`;
CREATE TABLE `degree_info`
(
    `degree_id`   int         NOT NULL,
    `degree_name` varchar(30) NOT NULL,
    PRIMARY KEY (`degree_id`)
);


LOCK
TABLES `degree_info` WRITE;
INSERT INTO `degree_info` (`degree_id`, `degree_name`)
VALUES (1, 'Computer Science'),
       (2, 'Physics'),
       (3, 'Mathematics'),
       (4, 'Chemical Engineering');
UNLOCK
TABLES;

DROP TABLE IF EXISTS `astronaut_education_info`;
CREATE TABLE `astronaut_education_info`
(
    `astronaut_education_id` int NOT NULL,
    `university_id`          int DEFAULT NULL,
    `degree_id`              int DEFAULT NULL,
    `astronaut_id`           int DEFAULT NULL,
    PRIMARY KEY (`astronaut_education_id`),
    KEY                      `astronaut_id` (`astronaut_id`),
    KEY                      `degree_id` (`degree_id`),
    KEY                      `university_id` (`university_id`),
    CONSTRAINT `astronaut_education_info_ibfk_1` FOREIGN KEY (`astronaut_id`) REFERENCES `astronaut_info` (`astronaut_id`),
    CONSTRAINT `astronaut_education_info_ibfk_2` FOREIGN KEY (`degree_id`) REFERENCES `degree_info` (`degree_id`) ON DELETE CASCADE,
    CONSTRAINT `astronaut_education_info_ibfk_3` FOREIGN KEY (`university_id`) REFERENCES `university_info` (`university_id`) ON DELETE CASCADE
);


LOCK
TABLES `astronaut_education_info` WRITE;
INSERT INTO `astronaut_education_info` (`astronaut_education_id`, `university_id`, `degree_id`, `astronaut_id`)
VALUES (1, 1, 1, 2),
       (2, 2, 2, 1),
       (3, 3, 1, 6),
       (4, 4, 1, 5),
       (5, 5, 3, 4),
       (6, 6, 4, 3),
       (7, 7, 2, 10),
       (8, 8, 2, 9),
       (9, 8, 2, 7),
       (10, 9, 2, 8);
UNLOCK
TABLES;



DROP TABLE IF EXISTS `astronaut_spouse_info`;
CREATE TABLE `astronaut_spouse_info`
(
    `astronaut_spouse_id`   int         NOT NULL AUTO_INCREMENT,
    `astronaut_spouse_name` varchar(30) NOT NULL,
    `astronaut_id`          int DEFAULT NULL,
    PRIMARY KEY (`astronaut_spouse_id`),
    KEY                     `astronaut_id` (`astronaut_id`),
    CONSTRAINT `astronaut_spouse_info_ibfk_1` FOREIGN KEY (`astronaut_id`) REFERENCES `astronaut_info` (`astronaut_id`)
);



LOCK
TABLES `astronaut_spouse_info` WRITE;
INSERT INTO `astronaut_spouse_info` (`astronaut_spouse_id`, `astronaut_spouse_name`, `astronaut_id`)
VALUES (1, 'Merry Copper', 3),
       (2, 'Johanna Smith', 4),
       (3, 'Alexendra Chevanov', 5),
       (4, 'Mila Kunis', 1),
       (5, 'Aston Kutcher', 10),
       (6, 'Tom Cruse', 8),
       (7, 'Bradly Coper', 6);
UNLOCK
TABLES;



DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`
(
    `next_val` bigint DEFAULT NULL
);


LOCK
TABLES `hibernate_sequence` WRITE;
INSERT INTO `hibernate_sequence` (`next_val`)
VALUES (4);
UNLOCK
TABLES;

DROP TABLE IF EXISTS `space_ship_info`;
CREATE TABLE `space_ship_info`
(
    `space_ship_id`   int NOT NULL,
    `space_ship_name` varchar(30) DEFAULT NULL,
    PRIMARY KEY (`space_ship_id`)
);


DROP TABLE IF EXISTS `mission_objective_info`;
CREATE TABLE `mission_objective_info`
(
    `mission_objective_id`   int         NOT NULL,
    `mission_objective_name` varchar(30) NOT NULL,
    PRIMARY KEY (`mission_objective_id`)
);

LOCK
TABLES `mission_objective_info` WRITE;
INSERT INTO `mission_objective_info` (`mission_objective_id`, `mission_objective_name`)
VALUES (1, 'DISCOVERY'),
       (2, 'RESEARCH'),
       (3, 'SATELLITE INSTALLATION'),
       (4, 'AIRBORNE');
UNLOCK
TABLES;



LOCK
TABLES `space_ship_info` WRITE;
INSERT INTO `space_ship_info` (`space_ship_id`, `space_ship_name`)
VALUES (1, 'Orion'),
       (2, 'SpaceX Dragon'),
       (3, 'Falcon Heavy'),
       (4, 'Endeavour'),
       (5, 'Ranger - 1');
UNLOCK
TABLES;

DROP TABLE IF EXISTS `mission_info`;
CREATE TABLE `mission_info`
(
    `mission_id`           int         NOT NULL,
    `mission_name`         varchar(30) NOT NULL,
    `mission_destination`  varchar(30) NOT NULL,
    `mission_objective_id` int DEFAULT NULL,
    `mission_distance`     float       NOT NULL,
    `space_ship_id`        int DEFAULT NULL,
    PRIMARY KEY (`mission_id`),
    KEY                    `space_ship_id` (`space_ship_id`),
    KEY                    `mission_objective_id` (`mission_objective_id`),
    CONSTRAINT `mission_info_ibfk_1` FOREIGN KEY (`space_ship_id`) REFERENCES `space_ship_info` (`space_ship_id`),
    CONSTRAINT `mission_info_ibfk_2` FOREIGN KEY (`mission_objective_id`) REFERENCES `mission_objective_info` (`mission_objective_id`) ON DELETE CASCADE
);


LOCK
TABLES `mission_info` WRITE;
INSERT INTO `mission_info` (`mission_id`, `mission_name`, `mission_destination`, `mission_objective_id`,
                            `mission_distance`, `space_ship_id`)
VALUES (1, 'STS-41', 'PLATO', 2, 32424, 3),
       (2, 'STS-7', 'MOON', 3, 238900, 3),
       (3, 'STS-23', 'MARS', 1, 2382900, 3),
       (4, 'STS-132', 'MOON', 3, 238900, 4),
       (5, 'STS-107', 'MOON', 3, 238900, 5),
       (6, 'STS-133', 'MOON', 3, 238900, 1),
       (7, 'STS-13', 'MOON', 3, 238900, 3),
       (8, 'MEGATRON', 'CYBERTRON', 4, 3382900, 3);
UNLOCK
TABLES;



DROP TABLE IF EXISTS `mission_details`;
CREATE TABLE `mission_details`
(
    `mission_details_id` int NOT NULL,
    `mission_id`         int DEFAULT NULL,
    `astronaut_id`       int DEFAULT NULL,
    PRIMARY KEY (`mission_details_id`),
    KEY                  `astronaut_id` (`astronaut_id`),
    KEY                  `mission_id` (`mission_id`),
    CONSTRAINT `mission_details_ibfk_1` FOREIGN KEY (`astronaut_id`) REFERENCES `astronaut_info` (`astronaut_id`),
    CONSTRAINT `mission_details_ibfk_2` FOREIGN KEY (`mission_id`) REFERENCES `mission_info` (`mission_id`) ON DELETE CASCADE
);


LOCK
TABLES `mission_details` WRITE;
INSERT INTO `mission_details` (`mission_details_id`, `mission_id`, `astronaut_id`)
VALUES (1, 3, 4),
       (2, 3, 6),
       (3, 4, 1),
       (4, 5, 3),
       (5, 2, 5),
       (6, 5, 2),
       (7, 1, 4),
       (8, 2, 7),
       (9, 1, 4),
       (10, 3, 7);
UNLOCK
TABLES;


DROP TABLE IF EXISTS `mission_landing_site`;
CREATE TABLE `mission_landing_site`
(
    `mission_landing_site_id`      int         NOT NULL,
    `mission_landing_site_name`    varchar(50) NOT NULL,
    `mission_landing_site_city`    varchar(50) NOT NULL,
    `mission_landing_site_state`   varchar(50) NOT NULL,
    `mission_landing_site_country` varchar(50) NOT NULL,
    PRIMARY KEY (`mission_landing_site_id`)
);


LOCK
TABLES `mission_landing_site` WRITE;
INSERT INTO `mission_landing_site` (`mission_landing_site_id`, `mission_landing_site_name`, `mission_landing_site_city`,
                                    `mission_landing_site_state`, `mission_landing_site_country`)
VALUES (1, 'Cape Canaveral Air Force Station', 'Vrevard County', 'Florida', 'USA'),
       (2, 'Vandenberg Air Force Base', 'Vanderberg', 'California', 'USA'),
       (3, 'Wallops Island Flight Facility', 'Wallops', 'Virginia', 'USA'),
       (4, 'OTRAG Lauch Center', 'Zaire', 'Zaire', 'Congo'),
       (5, 'Centre Intermees', 'Hammaguir', 'Hammaguir', 'Algeria');
UNLOCK
TABLES;



DROP TABLE IF EXISTS `mission_land_info`;
CREATE TABLE `mission_land_info`
(
    `mission_land_id`         int  NOT NULL,
    `mission_id`              int DEFAULT NULL,
    `mission_land_date`       date NOT NULL,
    `mission_landing_site_id` int DEFAULT NULL,
    PRIMARY KEY (`mission_land_id`),
    KEY                       `mission_landing_site_id` (`mission_landing_site_id`),
    KEY                       `mission_id` (`mission_id`),
    CONSTRAINT `mission_land_info_ibfk_1` FOREIGN KEY (`mission_landing_site_id`) REFERENCES `mission_landing_site` (`mission_landing_site_id`),
    CONSTRAINT `mission_land_info_ibfk_2` FOREIGN KEY (`mission_id`) REFERENCES `mission_info` (`mission_id`) ON DELETE CASCADE
);


LOCK
TABLES `mission_land_info` WRITE;
INSERT INTO `mission_land_info` (`mission_land_id`, `mission_id`, `mission_land_date`, `mission_landing_site_id`)
VALUES (1, 3, '2010-12-03', 1),
       (2, 2, '2009-02-03', 2),
       (3, 1, '2003-02-03', 1),
       (4, 4, '2006-02-03', 2),
       (5, 6, '2005-02-03', 4),
       (6, 7, '2014-02-03', 5),
       (7, 8, '2005-02-03', 2),
       (8, 5, '2006-02-03', 3);
UNLOCK
TABLES;


DROP TABLE IF EXISTS `mission_site_info`;
CREATE TABLE `mission_site_info`
(
    `mission_site_id`      int         NOT NULL,
    `mission_site_name`    varchar(40) NOT NULL,
    `mission_site_city`    varchar(40) NOT NULL,
    `mission_site_state`   varchar(10) DEFAULT NULL,
    `mission_site_country` varchar(20) NOT NULL,
    PRIMARY KEY (`mission_site_id`)
);


LOCK
TABLES `mission_site_info` WRITE;
INSERT INTO `mission_site_info` (`mission_site_id`, `mission_site_name`, `mission_site_city`, `mission_site_state`,
                                 `mission_site_country`)
VALUES (1, 'Cape Canaveral Air Force Station', 'Vrevard County', 'Florida', 'USA'),
       (2, 'Vandenberg Air Force Base', 'Vanderberg', 'California', 'USA'),
       (3, 'Wallops Island Flight Facility', 'Wallops', 'Virginia', 'USA'),
       (4, 'OTRAG Lauch Center', 'Zaire', 'Zaire', 'Congo'),
       (5, 'Centre Intermees', 'Hammaguir', 'Hammaguir', 'Algeria');
UNLOCK
TABLES;


DROP TABLE IF EXISTS `mission_launch_info`;
CREATE TABLE `mission_launch_info`
(
    `mission_launch_id`   int  NOT NULL,
    `mission_id`          int DEFAULT NULL,
    `mission_launch_date` date NOT NULL,
    `mission_site_id`     int  NOT NULL,
    PRIMARY KEY (`mission_launch_id`),
    KEY                   `mission_site_id` (`mission_site_id`),
    KEY                   `mission_id` (`mission_id`),
    CONSTRAINT `mission_launch_info_ibfk_1` FOREIGN KEY (`mission_site_id`) REFERENCES `mission_site_info` (`mission_site_id`),
    CONSTRAINT `mission_launch_info_ibfk_2` FOREIGN KEY (`mission_id`) REFERENCES `mission_info` (`mission_id`) ON DELETE CASCADE
);

LOCK
TABLES `mission_launch_info` WRITE;
INSERT INTO `mission_launch_info` (`mission_launch_id`, `mission_id`, `mission_launch_date`, `mission_site_id`)
VALUES (1, 3, '2009-01-02', 2),
       (2, 2, '2009-12-10', 1),
       (3, 1, '2000-01-05', 3),
       (4, 4, '2000-11-12', 3),
       (5, 6, '2004-01-15', 5),
       (6, 7, '2013-12-12', 1),
       (7, 8, '2001-09-03', 3),
       (8, 5, '2005-05-05', 2),
       (9, 8, '2005-08-08', 2);
UNLOCK
TABLES;




