/*
 Navicat Premium Data Transfer

 Source Server         : shop
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : 192.168.3.20:3306
 Source Schema         : mxshop_user_srv

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 14/04/2024 22:24:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'male' COMMENT 'female 表示女，male 表示男',
  `role` int NULL DEFAULT 1 COMMENT '1 表示普通用户，2表示管理员',
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile` ASC) USING BTREE,
  INDEX `idx_mobile`(`mobile` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '12', '18782222220', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby0', NULL, '2023-11-21 16:16:14', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (2, '', '18782222221', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby1', NULL, '2024-04-16 16:16:25', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (3, '', '18782222222', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby2', NULL, '2024-04-16 16:16:29', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (4, '', '18782222223', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby3', NULL, '2024-04-09 16:16:33', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (5, '', '18782222224', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby4', NULL, '2024-04-29 16:16:38', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (6, '', '18782222225', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby5', NULL, '2024-04-11 16:16:42', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (7, '', '18782222226', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby6', NULL, '2024-04-18 16:16:46', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (8, '', '18782222227', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby7', NULL, '2024-04-20 16:16:49', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (9, '', '18782222228', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby8', NULL, '2024-04-05 16:16:53', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (10, '', '18782222229', '$pbkdf2-sha512$QfMFpxex6ClbAqSO$53e96ca2718848810cb1d35bcb671f048f4b9dadffd33e9a321639a7b04a8708', 'bobby9', NULL, '2024-04-01 16:16:57', 'male', 1, '2023-12-17 19:41:43', '2023-12-17 19:41:43', NULL);
INSERT INTO `user` VALUES (21, '', '18125035105', '$pbkdf2-sha512$lYiF6HMPNeHuBb5u$dd79492c19419b7a999a5b91b2b3b2ee1e5686acae865ee95eb6c29e4ec33293', '18125035105', NULL, '2024-03-25 16:17:01', '', 1, '2023-12-17 19:42:43', '2023-12-17 19:42:43', NULL);
INSERT INTO `user` VALUES (22, '', '13268942532', '$pbkdf2-sha512$edJTGWYW4LzRlw7N$fd0b83ba7a369b5bd03dcedb6291510a560d147f319a478c1aeff0a17eada0bb', 'nihao', NULL, '2023-11-11 00:00:00', 'male', 1, '2023-12-18 23:26:16', '2023-12-18 23:32:36', NULL);
INSERT INTO `user` VALUES (23, '', '15655556666', 'testtest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (25, '', '15923452345', '6668666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (27, '5591255610', '15923452349', '2ab0a0094621b7b698f83b9775e6e33c', 'Test', NULL, NULL, NULL, 1, '2024-03-03 11:33:55', NULL, NULL);
INSERT INTO `user` VALUES (30, '5591255110', '15913452349', '2ab0a0094621b7b698f83b9775e6e33c', 'Test', NULL, NULL, NULL, 1, '2024-03-03 16:01:26', NULL, NULL);
INSERT INTO `user` VALUES (31, '2292514596', '15923412349', '2ab0a0094621b7b698f83b9775e6e33c', NULL, NULL, NULL, NULL, 1, '2024-03-03 16:02:05', NULL, NULL);
INSERT INTO `user` VALUES (32, '900875222', '18788888889', 'de40dd69f9e94746d8e4fa981beebf09', 'test1222', 'http://url111.com', NULL, '2', 1, '2024-03-25 13:07:55', '2024-03-25 17:21:29', NULL);
INSERT INTO `user` VALUES (33, '6974777832', '18788888888', 'e19fb9a72ca180a6675a3ee23f61e404', 'test1', 'https://img30.360buyimg.com/popshop/jfs/t1/5871/24/8604/4075/5baa0148E93f1a75f/3ea946875c373491.jpg', NULL, '1', 2, '2024-03-25 17:26:42', NULL, NULL);
INSERT INTO `user` VALUES (36, '4578682112', '18788888881', 'de40dd69f9e94746d8e4fa981beebf09', 'test1', 'http://url.com', NULL, '1', 1, '2024-03-27 11:40:34', NULL, NULL);
INSERT INTO `user` VALUES (37, '7044984440', '19899999999', 'a448410bdcbb4d7cfb32830909f6aa08', '小爱同学', NULL, '2024-04-02 00:00:00', 'male', 1, '2024-04-02 02:24:48', '2024-04-02 02:49:51', NULL);
INSERT INTO `user` VALUES (38, '132308434', '19899999998', 'a448410bdcbb4d7cfb32830909f6aa08', '小爱同学', NULL, '2024-04-05 00:00:00', 'male', 1, '2024-04-07 15:52:21', '2024-04-07 15:52:46', NULL);

SET FOREIGN_KEY_CHECKS = 1;
