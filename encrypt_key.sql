/*
Navicat MySQL Data Transfer

Source Server         : AlipayTest
Source Server Version : 50720
Source Host           : 172.19.56.127:3306
Source Database       : cfh_activity

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-09-19 09:49:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `encrypt_key`
-- ----------------------------
DROP TABLE IF EXISTS `encrypt_key`;
CREATE TABLE `encrypt_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of encrypt_key
-- ----------------------------

-- ----------------------------
-- Table structure for `env`
-- ----------------------------
DROP TABLE IF EXISTS `env`;
CREATE TABLE `env` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_server_name` varchar(255) DEFAULT NULL,
  `context_path` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `registry_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mgywbisx209jpyo855ft7h846` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of env
-- ----------------------------

-- ----------------------------
-- Table structure for `env_param`
-- ----------------------------
DROP TABLE IF EXISTS `env_param`;
CREATE TABLE `env_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_key` varchar(255) DEFAULT NULL,
  `p_value` varchar(255) DEFAULT NULL,
  `env_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt9r9ll92k616y8mq8ud1ydy15` (`env_id`),
  CONSTRAINT `FKt9r9ll92k616y8mq8ud1ydy15` FOREIGN KEY (`env_id`) REFERENCES `env` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of env_param
-- ----------------------------

-- ----------------------------
-- Table structure for `label`
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4nf623d0nwyd4aqje3d3cxx1b` (`project_id`),
  CONSTRAINT `FK4nf623d0nwyd4aqje3d3cxx1b` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of label
-- ----------------------------

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3k75vvu7mevyvvb5may5lj8k7` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for `project_envs`
-- ----------------------------
DROP TABLE IF EXISTS `project_envs`;
CREATE TABLE `project_envs` (
  `projects_id` bigint(20) NOT NULL,
  `envs_id` bigint(20) NOT NULL,
  KEY `FKxjs9tfii16deymxa85bk0016` (`envs_id`),
  KEY `FKmb8biqw9t9ikgfhvyoe792vd` (`projects_id`),
  CONSTRAINT `FKmb8biqw9t9ikgfhvyoe792vd` FOREIGN KEY (`projects_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FKxjs9tfii16deymxa85bk0016` FOREIGN KEY (`envs_id`) REFERENCES `env` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of project_envs
-- ----------------------------

-- ----------------------------
-- Table structure for `property`
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_key` varchar(255) DEFAULT NULL,
  `p_value` varchar(255) DEFAULT NULL,
  `env_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc9p3ohe2voalce0d6kr6eif4i` (`env_id`),
  KEY `FK1oldmt4arjswo2i73c03euk0` (`label_id`),
  KEY `FKse1wjbyeeeq1i1bd4huqyvhw9` (`project_id`),
  CONSTRAINT `FK1oldmt4arjswo2i73c03euk0` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `FKc9p3ohe2voalce0d6kr6eif4i` FOREIGN KEY (`env_id`) REFERENCES `env` (`id`),
  CONSTRAINT `FKse1wjbyeeeq1i1bd4huqyvhw9` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of property
-- ----------------------------
