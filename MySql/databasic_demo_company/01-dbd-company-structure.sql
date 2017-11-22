CREATE TABLE `attendance` (
	`id_person` int(11) NOT NULL,
	`date` date NOT NULL,
	`time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `contacts` (
	`id_person` int(11) NOT NULL,
	`id_contact_category` int(11) NOT NULL,
	`value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `contacts_categories` (
	`id_contact_category` INT(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	PRIMARY KEY (`id_contact_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `departments` (
	`id_department` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL,
	`description` TEXT NULL,
	PRIMARY KEY (`id_department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `persons` (
	`id_person` INT(11) NOT NULL AUTO_INCREMENT,
	`id_parent` INT(11) NULL DEFAULT NULL,
	`id_department` INT(11) NOT NULL,
	`name` VARCHAR(100) NOT NULL,
	`surname` VARCHAR(100) NULL DEFAULT NULL,
	`salary` DECIMAL(9,2) NOT NULL DEFAULT '0.00',
	`gender` CHAR(1) NOT NULL DEFAULT 'O',
	PRIMARY KEY (`id_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;