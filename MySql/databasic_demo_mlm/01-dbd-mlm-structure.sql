CREATE DATABASE `databasic_demo_mlm` /*!40100 COLLATE 'utf8_general_ci' */

USE databasic_demo_mlm;

CREATE TABLE `dealers` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`id_parent` INT(11) NULL DEFAULT NULL,
	`name` VARCHAR(64) NOT NULL,
	`surname` VARCHAR(64) NULL DEFAULT NULL,
	`description` TEXT NULL,
	`turn_over_excl_vat` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	`turn_over_incl_vat` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	PRIMARY KEY (`id`),
	INDEX `name` (`name`),
	INDEX `surname` (`surname`),
	INDEX `turn_over_excl_vat` (`turn_over_excl_vat`),
	INDEX `turn_over_incl_vat` (`turn_over_incl_vat`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `clients` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(64) NOT NULL,
	`fullname` VARCHAR(128) NULL DEFAULT NULL,
	`discount` DECIMAL(5,2) NOT NULL DEFAULT '0.00',
	`street` VARCHAR(64) NULL DEFAULT NULL,
	`city` VARCHAR(64) NULL DEFAULT NULL,
	`zip` VARCHAR(10) NULL DEFAULT NULL,
	`region` VARCHAR(64) NULL DEFAULT NULL,
	`country` VARCHAR(64) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `name` (`name`),
	INDEX `fullname` (`fullname`),
	INDEX `discount` (`discount`),
	INDEX `street` (`street`),
	INDEX `city` (`city`),
	INDEX `zip` (`zip`),
	INDEX `region` (`region`),
	INDEX `country` (`country`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `orders` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`id_dealer` INT(11) NULL DEFAULT NULL,
	`id_client` INT(11) NULL DEFAULT NULL,
	`price_excl_vat` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	`price_incl_vat` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	`date_submit` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`date_dispatch` TIMESTAMP NULL DEFAULT NULL,
	`paid` TINYINT(4) NOT NULL DEFAULT '0',
	`status` ENUM('NEW','PREPARING','DELIVERING','DONE') NOT NULL DEFAULT 'NEW',
	PRIMARY KEY (`id`),
	INDEX `price_excl_vat` (`price_excl_vat`),
	INDEX `price_incl_vat` (`price_incl_vat`),
	INDEX `date_submit` (`date_submit`),
	INDEX `date_dispatch` (`date_dispatch`),
	INDEX `paid` (`paid`),
	INDEX `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

ALTER TABLE `dealers`
	ADD CONSTRAINT `FK_dealers_dealers` FOREIGN KEY (`id_parent`) REFERENCES `dealers` (`id`);
	
ALTER TABLE `orders`
	ADD CONSTRAINT `FK_orders_dealers` FOREIGN KEY (`id_dealer`) REFERENCES `dealers` (`id`),
	ADD CONSTRAINT `FK_orders_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`);