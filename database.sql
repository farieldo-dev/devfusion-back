-- Adminer 4.8.1 MySQL 8.0.30 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `demand_users`;
CREATE TABLE `demand_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `demandId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `demandId` (`demandId`),
  KEY `userId` (`userId`),
  CONSTRAINT `demand_users_ibfk_3` FOREIGN KEY (`demandId`) REFERENCES `demands` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `demand_users_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `demands`;
CREATE TABLE `demands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `limitDate` date DEFAULT NULL,
  `financial` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `hours` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `bu` int unsigned DEFAULT NULL,
  `app` int unsigned DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `responsible` int DEFAULT NULL,
  `created` date DEFAULT NULL,
  `squad` int DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `priority` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `responsible` (`responsible`),
  KEY `bu` (`bu`),
  KEY `squad` (`squad`),
  CONSTRAINT `demands_ibfk_2` FOREIGN KEY (`responsible`) REFERENCES `users` (`id`),
  CONSTRAINT `demands_ibfk_3` FOREIGN KEY (`bu`) REFERENCES `npl_bus` (`id`),
  CONSTRAINT `demands_ibfk_4` FOREIGN KEY (`squad`) REFERENCES `npl_squads` (`id`),
  CONSTRAINT `demands_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


SET NAMES utf8mb4;

DROP TABLE IF EXISTS `skill_demand`;
CREATE TABLE `skill_demand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `skill` int NOT NULL,
  `demand` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `demand` (`demand`),
  KEY `skill` (`skill`),
  CONSTRAINT `skill_demand_ibfk_1` FOREIGN KEY (`demand`) REFERENCES `demands` (`id`),
  CONSTRAINT `skill_demand_ibfk_3` FOREIGN KEY (`skill`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `nome` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;


DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `nome` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `avatarId` int DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `xp` varchar(255) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `bu` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bu` (`bu`),
  FULLTEXT KEY `nome` (`name`),
  FULLTEXT KEY `description` (`description`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`bu`) REFERENCES `npl_bus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `userskills`;
CREATE TABLE `userskills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `skillId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `skillId` (`skillId`),
  CONSTRAINT `userskills_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userskills_ibfk_4` FOREIGN KEY (`skillId`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- 2024-10-19 03:09:08