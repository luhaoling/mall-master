/*
 Navicat Premium Data Transfer

 Source Server         : shop
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : 192.168.3.20:3306
 Source Schema         : mxshop_order

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 14/04/2024 22:24:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `ordergoods`;
CREATE TABLE `ordergoods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `add_time` datetime(3) NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT NULL,
  `order` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods` int NULL DEFAULT NULL,
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_price` float NULL DEFAULT NULL,
  `nums` int NULL DEFAULT NULL,
  `goods_image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ordergoods_goods`(`goods` ASC) USING BTREE,
  INDEX `idx_ordergoods_goods_name`(`goods_name` ASC) USING BTREE,
  INDEX `idx_ordergoods_order`(`order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ordergoods
-- ----------------------------
INSERT INTO `ordergoods` VALUES (1, '2024-03-26 20:40:54.118', NULL, NULL, 0, '2024032704405490087522282', 807, '绿鲜知 蔬菜沙拉 沙拉菜组合 约700g 都市轻食 产地直供 新鲜蔬菜', 29.9, 5, 'https://py-go.oss-cn-beijing.aliyuncs.com/goods_images/948c4d095b898fed6c92e2fcef03cfcd');
INSERT INTO `ordergoods` VALUES (2, '2024-03-26 20:40:54.118', NULL, NULL, NULL, '2024032704405490087522282', 421, '烟台红富士苹果12个 净重2.6kg以上 单果190-240g 新生鲜水果', 44.9, 1, 'https://py-go.oss-cn-beijing.aliyuncs.com/goods_images/df392d01993cdab9de740fe17798bda1');
INSERT INTO `ordergoods` VALUES (3, '2024-04-08 19:32:46.680', NULL, NULL, NULL, '2024040903324692', 421, '烟台红富士苹果12个 净重2.6kg以上 单果190-240g 新生鲜水果', 67, 11, NULL);
INSERT INTO `ordergoods` VALUES (4, '2024-04-08 19:46:19.327', NULL, NULL, NULL, '2024040903461833', 628, '【领卷3斤199】吴琼 吉林梅花鹿肉3斤 精修生鲜鹿腿肉 新鲜鹿腿肉 原肉切割 产地直发', 299, 8, NULL);
INSERT INTO `ordergoods` VALUES (5, '2024-04-08 20:13:30.748', NULL, NULL, NULL, '20240409041330704498444063', 427, '【京东速运】桃小蒙鲜食黄桃 黄肉水蜜桃 蒙阴黄金毛桃4.5斤 新鲜水果桃子 京东生鲜', 29.8, 6, NULL);
INSERT INTO `ordergoods` VALUES (6, '2024-04-08 20:13:30.777', NULL, NULL, NULL, '20240409041330704498444063', 421, '烟台红富士苹果12个 净重2.6kg以上 单果190-240g 新生鲜水果', 67, 11, NULL);
INSERT INTO `ordergoods` VALUES (7, '2024-04-08 21:27:05.140', NULL, NULL, NULL, '20240409052704704498444082', 421, '烟台红富士苹果12个 净重2.6kg以上 单果190-240g 新生鲜水果', 67, 11, NULL);
INSERT INTO `ordergoods` VALUES (8, '2024-04-08 21:29:40.416', NULL, NULL, NULL, '20240409052940704498444073', 421, '烟台红富士苹果12个 净重2.6kg以上 单果190-240g 新生鲜水果', 67, 11, NULL);
INSERT INTO `ordergoods` VALUES (9, '2024-04-08 21:32:14.750', NULL, NULL, NULL, '20240409053214704498444018', 421, '烟台红富士苹果12个 净重2.6kg以上 单果190-240g 新生鲜水果', 67, 11, NULL);
INSERT INTO `ordergoods` VALUES (10, '2024-04-08 22:46:40.905', NULL, NULL, NULL, '20240409064640704498444093', 628, '【领卷3斤199】吴琼 吉林梅花鹿肉3斤 精修生鲜鹿腿肉 新鲜鹿腿肉 原肉切割 产地直发', 299, 8, NULL);
INSERT INTO `ordergoods` VALUES (11, '2024-04-08 22:46:40.931', NULL, NULL, NULL, '20240409064640704498444093', 525, '【2份减20】麻辣小龙虾尾1000g 熟冻大号活剥龙虾球 冷冻香辣虾尾 生鲜虾类 冷冻水产', 88, 6, NULL);
INSERT INTO `ordergoods` VALUES (12, '2024-04-08 22:46:52.925', NULL, NULL, NULL, '20240409064652704498444068', 628, '【领卷3斤199】吴琼 吉林梅花鹿肉3斤 精修生鲜鹿腿肉 新鲜鹿腿肉 原肉切割 产地直发', 299, 8, NULL);
INSERT INTO `ordergoods` VALUES (13, '2024-04-08 22:47:05.865', NULL, NULL, NULL, '20240409064705704498444049', 427, '【京东速运】桃小蒙鲜食黄桃 黄肉水蜜桃 蒙阴黄金毛桃4.5斤 新鲜水果桃子 京东生鲜', 29.8, 6, NULL);
INSERT INTO `ordergoods` VALUES (14, '2024-04-08 22:47:05.886', NULL, NULL, NULL, '20240409064705704498444049', 525, '【2份减20】麻辣小龙虾尾1000g 熟冻大号活剥龙虾球 冷冻香辣虾尾 生鲜虾类 冷冻水产', 88, 6, NULL);
INSERT INTO `ordergoods` VALUES (15, '2024-04-08 22:52:54.882', NULL, NULL, NULL, '20240409065254704498444026', 427, '【京东速运】桃小蒙鲜食黄桃 黄肉水蜜桃 蒙阴黄金毛桃4.5斤 新鲜水果桃子 京东生鲜', 29.8, 6, NULL);
INSERT INTO `ordergoods` VALUES (16, '2024-04-08 22:52:54.913', NULL, NULL, NULL, '20240409065254704498444026', 628, '【领卷3斤199】吴琼 吉林梅花鹿肉3斤 精修生鲜鹿腿肉 新鲜鹿腿肉 原肉切割 产地直发', 299, 8, NULL);

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `add_time` datetime(3) NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT NULL,
  `user` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_sn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'alipay(支付宝)， wechat(微信)',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PAYING(待支付), TRADE_SUCCESS(成功)， TRADE_CLOSED(超时关闭), WAIT_BUYER_PAY(交易创建), TRADE_FINISHED(交易结束)',
  `trade_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易号',
  `order_mount` float NULL DEFAULT NULL,
  `pay_time` datetime NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `signer_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `singer_mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_orderinfo_user`(`user` ASC) USING BTREE,
  INDEX `idx_orderinfo_order_sn`(`order_sn` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES (1, '2024-03-26 19:47:10.453', NULL, NULL, NULL, '900875222', '2024032704405490087522282', NULL, NULL, NULL, NULL, NULL, '江西省', '小红', '123456789', NULL);
INSERT INTO `orderinfo` VALUES (14, '2024-04-08 19:32:46.550', NULL, NULL, NULL, '132308434', '2024040903324692', NULL, NULL, NULL, NULL, NULL, '广西省', '小橘', '12343215', NULL);
INSERT INTO `orderinfo` VALUES (16, '2024-04-08 20:13:30.711', NULL, NULL, NULL, '7044984440', '20240409041330704498444063', NULL, NULL, NULL, 915.8, NULL, '广东省', '小艾', '1234535', NULL);
INSERT INTO `orderinfo` VALUES (17, '2024-04-08 21:27:05.099', NULL, NULL, NULL, '7044984440', '20240409052704704498444082', NULL, NULL, NULL, 737, NULL, '北京市', '小景', '1188783431', NULL);
INSERT INTO `orderinfo` VALUES (18, '2024-04-08 21:29:40.391', NULL, NULL, NULL, '7044984440', '20240409052940704498444073', NULL, NULL, NULL, 737, NULL, '广东省广州市', '小梁', '1234231', NULL);
INSERT INTO `orderinfo` VALUES (19, '2024-04-08 21:32:14.711', NULL, NULL, NULL, '7044984440', '20240409053214704498444018', NULL, NULL, NULL, 737, NULL, '广东省深圳市', '小新', '18333332222', NULL);
INSERT INTO `orderinfo` VALUES (20, '2024-04-08 22:46:40.853', NULL, NULL, NULL, '7044984440', '20240409064640704498444093', NULL, NULL, NULL, 2920, NULL, '广东省珠海市', '小诸', '1235432532', NULL);
INSERT INTO `orderinfo` VALUES (21, '2024-04-08 22:46:52.878', NULL, NULL, NULL, '7044984440', '20240409064652704498444068', NULL, NULL, NULL, 2392, NULL, '广东省深圳市', '小新', '18333332222', NULL);
INSERT INTO `orderinfo` VALUES (22, '2024-04-08 22:47:05.827', NULL, NULL, NULL, '7044984440', '20240409064705704498444049', NULL, NULL, NULL, 706.8, NULL, '小爱同学', '小新', '18333332222', NULL);
INSERT INTO `orderinfo` VALUES (23, '2024-04-08 22:52:54.854', NULL, NULL, NULL, '7044984440', '20240409065254704498444026', NULL, NULL, NULL, 2570.8, NULL, '广东省深圳市', '小新', '18333332222', NULL);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `add_time` datetime(3) NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT NULL,
  `user` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods` int NULL DEFAULT NULL,
  `nums` int NULL DEFAULT NULL,
  `checked` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_shoppingcart_user`(`user` ASC) USING BTREE,
  INDEX `idx_shoppingcart_goods`(`goods` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES (2, '2024-03-26 22:38:59.100', NULL, NULL, NULL, '900875222', 421, NULL, 0);
INSERT INTO `shoppingcart` VALUES (3, '2024-04-01 15:58:30.205', NULL, NULL, NULL, '6974777832', 421, 5, 0);
INSERT INTO `shoppingcart` VALUES (10, '2024-04-08 18:13:40.471', NULL, NULL, NULL, '7044984440', 421, 11, 0);
INSERT INTO `shoppingcart` VALUES (11, '2024-04-08 18:03:18.985', NULL, NULL, NULL, '7044984440', 427, 6, 0);
INSERT INTO `shoppingcart` VALUES (12, '2024-04-08 18:05:57.124', NULL, NULL, NULL, '7044984440', 628, 8, 0);
INSERT INTO `shoppingcart` VALUES (13, '2024-04-08 18:00:29.580', NULL, NULL, NULL, '7044984440', 525, 6, 0);
INSERT INTO `shoppingcart` VALUES (14, '2024-04-07 15:53:34.647', NULL, NULL, NULL, '132308434', 427, 3, 0);
INSERT INTO `shoppingcart` VALUES (15, '2024-04-07 15:54:41.128', NULL, NULL, NULL, '132308434', 628, 1, 0);
INSERT INTO `shoppingcart` VALUES (16, '2024-04-07 15:55:06.691', NULL, NULL, NULL, '132308434', 425, 2, 0);
INSERT INTO `shoppingcart` VALUES (17, '2024-04-07 15:55:47.639', NULL, NULL, NULL, '132308434', 422, 1, 0);
INSERT INTO `shoppingcart` VALUES (18, '2024-04-08 22:53:40.565', NULL, NULL, NULL, '7044984440', 537, 2, 0);
INSERT INTO `shoppingcart` VALUES (19, '2024-04-08 22:53:53.296', NULL, NULL, NULL, '7044984440', 474, 1, 0);
INSERT INTO `shoppingcart` VALUES (20, '2024-04-08 22:54:04.870', NULL, NULL, NULL, '7044984440', 593, 1, 0);
INSERT INTO `shoppingcart` VALUES (21, '2024-04-08 22:54:18.033', NULL, NULL, NULL, '7044984440', 524, 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
