/*
 Navicat Premium Data Transfer

 Source Server         : shop
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : 192.168.3.20:3306
 Source Schema         : mxshop_inventory

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 14/04/2024 22:24:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery`  (
  `goods` int NULL DEFAULT NULL,
  `nums` int NULL DEFAULT NULL,
  `order_sn` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `idx_delivery_goods`(`goods` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of delivery
-- ----------------------------

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `add_time` datetime(3) NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT NULL,
  `goods` int NULL DEFAULT NULL,
  `stocks` int NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_inventory_goods`(`goods` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (3, '2024-03-26 19:09:58.210', '2024-03-26 21:20:07.501', NULL, NULL, 807, 145, NULL);
INSERT INTO `inventory` VALUES (5, '2024-04-08 19:30:53.276', '2024-04-08 20:06:39.031', NULL, NULL, 628, 176, NULL);
INSERT INTO `inventory` VALUES (6, '2024-04-08 19:31:01.473', NULL, NULL, NULL, 525, 188, NULL);
INSERT INTO `inventory` VALUES (7, '2024-04-08 19:32:19.473', NULL, NULL, NULL, 421, 45, NULL);
INSERT INTO `inventory` VALUES (8, '2024-04-08 19:32:24.870', NULL, NULL, NULL, 427, 82, NULL);

-- ----------------------------
-- Table structure for inventory_new
-- ----------------------------
DROP TABLE IF EXISTS `inventory_new`;
CREATE TABLE `inventory_new`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `add_time` datetime(3) NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT NULL,
  `goods` int NULL DEFAULT NULL,
  `stocks` int NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `freeze` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_inventory_new_goods`(`goods` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory_new
-- ----------------------------

-- ----------------------------
-- Table structure for stockselldetail
-- ----------------------------
DROP TABLE IF EXISTS `stockselldetail`;
CREATE TABLE `stockselldetail`  (
  `order_sn` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `idx_order_sn`(`order_sn` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stockselldetail
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
