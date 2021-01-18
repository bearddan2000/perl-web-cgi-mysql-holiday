DROP DATABASE IF EXISTS `holiday`;

CREATE DATABASE `holiday`;

DROP TABLE IF EXISTS `holiday`.american;

CREATE TABLE `holiday`.american (
	id INT PRIMARY KEY auto_increment,
	name varchar(100) NOT NULL,
	mes INT NOT NULL,
	dia INT NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
