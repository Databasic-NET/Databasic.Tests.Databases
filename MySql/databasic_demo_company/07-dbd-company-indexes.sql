ALTER TABLE `departments` ADD INDEX `name` (`name`);

ALTER TABLE `contacts_categories` ADD INDEX `name` (`name`);

ALTER TABLE `persons` ADD INDEX `name` (`name`, `surname`), ADD INDEX `salary` (`salary`), ADD INDEX `gender` (`gender`);
ALTER TABLE `persons` ADD CONSTRAINT `FK_persons_persons` FOREIGN KEY (`id_parent`) REFERENCES `persons` (`id_person`);
ALTER TABLE `persons` ADD CONSTRAINT `FK_persons_departments` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`);

ALTER TABLE `contacts` ADD INDEX `value` (`value`);
ALTER TABLE `contacts` ADD CONSTRAINT `FK_contacts_persons` FOREIGN KEY (`id_person`) REFERENCES `persons` (`id_person`);
ALTER TABLE `contacts` ADD CONSTRAINT `FK_contacts_contacts_categories` FOREIGN KEY (`id_contact_category`) REFERENCES `contacts_categories` (`id_contact_category`);

ALTER TABLE `attendance` ADD INDEX `date` (`date`, `time`);
ALTER TABLE `attendance` ADD CONSTRAINT `FK_attendance_persons` FOREIGN KEY (`id_person`) REFERENCES `persons` (`id_person`);