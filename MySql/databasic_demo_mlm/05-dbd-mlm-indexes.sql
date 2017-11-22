ALTER TABLE `clients` ADD INDEX `name_and_fullname` (`name`, `fullname`), ADD INDEX `discount` (`discount`), ADD INDEX `address` (`street`, `city`, `zip`, `region`, `country`);

ALTER TABLE `dealers` ADD INDEX `names` (`name`, `surname`), ADD INDEX `turn_over_excl_vat` (`turn_over_excl_vat`), ADD INDEX `turn_over_incl_vat` (`turn_over_incl_vat`);
ALTER TABLE `dealers` ADD CONSTRAINT `FK_dealers_dealers` FOREIGN KEY (`id_parent`) REFERENCES `dealers` (`id`);

ALTER TABLE `orders` ADD INDEX `price_excl_vat` (`price_excl_vat`), ADD INDEX `price_incl_vat` (`price_incl_vat`), ADD INDEX `dates` (`date_submit`, `date_dispatch`), ADD INDEX `paid` (`paid`), ADD INDEX `status` (`status`);
ALTER TABLE `orders` ADD CONSTRAINT `FK_orders_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`);
ALTER TABLE `orders` ADD CONSTRAINT `FK_orders_dealers` FOREIGN KEY (`id_dealer`) REFERENCES `dealers` (`id`);