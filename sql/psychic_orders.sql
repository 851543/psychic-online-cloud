/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80042
 Source Host           : localhost:3306
 Source Schema         : psychic_orders

 Target Server Type    : MySQL
 Target Server Version : 80042
 File Encoding         : 65001

 Date: 29/12/2025 23:14:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mq_message
-- ----------------------------
DROP TABLE IF EXISTS `mq_message`;
CREATE TABLE `mq_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息类型代码: course_publish ,  media_test',
  `business_key1` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `execute_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '通知次数',
  `state` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '处理状态，0:初始，1:成功',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `execute_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '阶段1处理状态, 0:初始，1:成功',
  `stage_state2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '阶段2处理状态, 0:初始，1:成功',
  `stage_state3` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '阶段3处理状态, 0:初始，1:成功',
  `stage_state4` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '阶段4处理状态, 0:初始，1:成功',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message
-- ----------------------------
INSERT INTO `mq_message` VALUES (15, 'payresult_notify', '19', '60201', NULL, 0, '0', NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message` VALUES (16, 'emailresult_notify', '172547689@qq.com', '890500', NULL, 0, '0', NULL, NULL, NULL, NULL, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for mq_message_history
-- ----------------------------
DROP TABLE IF EXISTS `mq_message_history`;
CREATE TABLE `mq_message_history`  (
  `id` bigint NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `execute_num` int UNSIGNED NULL DEFAULT NULL COMMENT '通知次数',
  `state` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '处理状态，0:初始，1:成功，2:失败',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `execute_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state3` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state4` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message_history
-- ----------------------------
INSERT INTO `mq_message_history` VALUES (1, 'payresult_notify', '16', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (2, 'emailresult_notify', '851543@qq.com', '353352', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (3, 'emailresult_notify', '851543@qq.co', '207806', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (4, 'emailresult_notify', '851543@qq.co', '991834', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (5, 'emailresult_notify', '851543@qq.co', '615707', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (6, 'emailresult_notify', '851543@qq.co', '443352', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (7, 'emailresult_notify', '851543@qq.co', '531126', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (8, 'emailresult_notify', '123', '523433', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (9, 'emailresult_notify', '851543@qq.co', '639353', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (10, 'emailresult_notify', '851543@qq.com', '480900', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (11, 'emailresult_notify', '851543@qq.com', '602998', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (12, 'emailresult_notify', '851543@qq.com', '829305', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (13, 'emailresult_notify', '851543@qq.com', '507596', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (14, 'emailresult_notify', '851543@qq.com', '499781', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (15, 'payresult_notify', '11', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (16, 'payresult_notify', '15', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (17, 'payresult_notify', '21', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (18, 'emailresult_notify', '1753673271@qq.com', '974249', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (19, 'payresult_notify', '22', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (20, 'emailresult_notify', '3487825826@qq.com', '580746', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (21, 'emailresult_notify', '3487825826@qq.com', '148438', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (22, 'emailresult_notify', '3285558963@qq.com', '809660', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (23, 'payresult_notify', '23', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (24, 'emailresult_notify', '3487825826@qq.com', '574576', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (25, 'payresult_notify', '25', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (26, 'payresult_notify', '27', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (27, 'payresult_notify', '28', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (28, 'payresult_notify', '30', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (29, 'payresult_notify', '32', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (30, 'payresult_notify', '33', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (31, 'payresult_notify', '35', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (32, 'payresult_notify', '37', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (33, 'payresult_notify', '38', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (34, 'payresult_notify', '39', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for xc_orders
-- ----------------------------
DROP TABLE IF EXISTS `xc_orders`;
CREATE TABLE `xc_orders`  (
  `id` bigint NOT NULL COMMENT '订单号',
  `total_price` float(8, 2) NOT NULL COMMENT '总价',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `status` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '交易状态',
  `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户id',
  `order_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单类型',
  `order_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单名称',
  `order_descrip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单描述',
  `order_detail` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单明细json',
  `out_business_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '外部系统业务id',
  `company_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_unioue`(`out_business_id`) USING BTREE COMMENT '外部系统的业务id'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_orders
-- ----------------------------
INSERT INTO `xc_orders` VALUES (1577177773194113024, 1.00, '2022-10-04 14:04:18', '600002', '50', '60201', '测试课程01', '购买课程:测试课程01', '[{\"goodsId\":2,\"goodsType\":\"60201\",\"goodsName\":\"测试课程01\",\"goodsPrice\":1}]', '10', NULL);
INSERT INTO `xc_orders` VALUES (1577258681653280768, 1.00, '2022-10-04 19:25:48', '600002', '52', '60201', 'Nacos微服务开发实战', '购买课程:Nacos微服务开发实战', '[{\"goodsId\":117,\"goodsType\":\"60201\",\"goodsName\":\"Nacos微服务开发实战\",\"goodsPrice\":1}]', '11', NULL);
INSERT INTO `xc_orders` VALUES (1585094781512269824, 11.00, '2022-10-26 10:23:40', '600002', '51', '60201', 'java零基础入门', '购买课程:java零基础入门', '[{\"goodsId\":18,\"goodsType\":\"60201\",\"goodsName\":\"java零基础入门\",\"goodsPrice\":11}]', '15', NULL);
INSERT INTO `xc_orders` VALUES (1623527995495899136, 1.00, '2023-02-09 11:43:32', '600002', '52', '60201', 'Spring Cloud 开发实战', '购买课程:Spring Cloud 开发实战', '[{\"goodsId\":121,\"goodsType\":\"60201\",\"goodsName\":\"Spring Cloud 开发实战\",\"goodsPrice\":1}]', '16', NULL);
INSERT INTO `xc_orders` VALUES (1995756116213329920, 0.01, '2025-12-02 15:25:12', '600002', '52', '60201', 'SpringBoot核心', '购买课程:SpringBoot核心', '[{\"goodsId\":125,\"goodsType\":\"60201\",\"goodsName\":\"SpringBoot核心\",\"goodsPrice\":0.01}]', '18', NULL);
INSERT INTO `xc_orders` VALUES (2001343030340792320, 88.00, '2025-12-18 01:25:36', '600002', '2000079718406803457', '60201', '软件测试工程', '购买课程:软件测试工程', '[{\"goodsId\":138,\"goodsType\":\"60201\",\"goodsName\":\"软件测试工程\",\"goodsPrice\":88}]', '19', '2');
INSERT INTO `xc_orders` VALUES (2001703975991197696, 88.00, '2025-12-19 01:19:52', '600002', '2001701192204894210', '60201', '软件测试工程', '购买课程:软件测试工程', '[{\"goodsId\":138,\"goodsType\":\"60201\",\"goodsName\":\"软件测试工程\",\"goodsPrice\":88}]', '21', '2');
INSERT INTO `xc_orders` VALUES (2001704871047282688, 88.00, '2025-12-19 01:23:26', '600002', '2001704773104517121', '60201', '软件测试工程', '购买课程:软件测试工程', '[{\"goodsId\":138,\"goodsType\":\"60201\",\"goodsName\":\"软件测试工程\",\"goodsPrice\":88}]', '22', '2');
INSERT INTO `xc_orders` VALUES (2001706197605208064, 88.00, '2025-12-19 01:28:42', '600002', '2001706129504681985', '60201', '软件测试工程', '购买课程:软件测试工程', '[{\"goodsId\":138,\"goodsType\":\"60201\",\"goodsName\":\"软件测试工程\",\"goodsPrice\":88}]', '23', '2');
INSERT INTO `xc_orders` VALUES (2001713763822981120, 88.00, '2025-12-19 01:58:46', '600002', '2001712598077751297', '60201', '软件测试工程', '购买课程:软件测试工程', '[{\"goodsId\":138,\"goodsType\":\"60201\",\"goodsName\":\"软件测试工程\",\"goodsPrice\":88}]', '25', '2');
INSERT INTO `xc_orders` VALUES (2001975721076727808, 80.00, '2025-12-19 19:19:41', '600002', '2000079718406803457', '60201', 'Java基础程序', '购买课程:Java基础程序', '[{\"goodsId\":139,\"goodsType\":\"60201\",\"goodsName\":\"Java基础程序\",\"goodsPrice\":80}]', '27', '2');
INSERT INTO `xc_orders` VALUES (2001978838547701760, 10.00, '2025-12-19 19:32:05', '600002', '2000079718406803457', '60201', 'Spring Boot', '购买课程:Spring Boot', '[{\"goodsId\":140,\"goodsType\":\"60201\",\"goodsName\":\"Spring Boot\",\"goodsPrice\":10}]', '28', '2');
INSERT INTO `xc_orders` VALUES (2001989751328043008, 20.00, '2025-12-19 20:15:27', '600002', '2000079718406803457', '60201', '前端工程', '购买课程:前端工程', '[{\"goodsId\":141,\"goodsType\":\"60201\",\"goodsName\":\"前端工程\",\"goodsPrice\":20}]', '37', '2');
INSERT INTO `xc_orders` VALUES (2004192899444690944, 10.00, '2025-12-25 22:09:58', '600002', '2000079718406803457', '60201', 'Java', '购买课程:Java', '[{\"goodsId\":143,\"goodsType\":\"60201\",\"goodsName\":\"Java\",\"goodsPrice\":10}]', '38', '2');
INSERT INTO `xc_orders` VALUES (2005494280843194368, 20.00, '2025-12-29 12:21:11', '600002', '2000079718406803457', '60201', 'Vue.js', '购买课程:Vue.js', '[{\"goodsId\":144,\"goodsType\":\"60201\",\"goodsName\":\"Vue.js\",\"goodsPrice\":20}]', '39', '2');

-- ----------------------------
-- Table structure for xc_orders_goods
-- ----------------------------
DROP TABLE IF EXISTS `xc_orders_goods`;
CREATE TABLE `xc_orders_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL COMMENT '订单号',
  `goods_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品id',
  `goods_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品类型',
  `goods_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
  `goods_price` float(10, 2) NOT NULL COMMENT '商品交易价，单位分',
  `goods_detail` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品详情json',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_orders_goods
-- ----------------------------
INSERT INTO `xc_orders_goods` VALUES (2, 1577177773194113024, '2', '60201', '测试课程01', 1.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (3, 1577258681653280768, '117', '60201', 'Nacos微服务开发实战', 1.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (4, 1585094781512269824, '18', '60201', 'java零基础入门', 11.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (5, 1623527995495899136, '121', '60201', 'Spring Cloud 开发实战', 1.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (6, 1995756116213329920, '125', '60201', 'SpringBoot核心', 0.01, NULL);
INSERT INTO `xc_orders_goods` VALUES (7, 2001343030340792320, '138', '60201', '软件测试工程', 88.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (8, 2001703975991197696, '138', '60201', '软件测试工程', 88.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (9, 2001704871047282688, '138', '60201', '软件测试工程', 88.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (10, 2001706197605208064, '138', '60201', '软件测试工程', 88.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (11, 2001713763822981120, '138', '60201', '软件测试工程', 88.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (12, 2001975721076727808, '139', '60201', 'Java基础程序', 80.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (13, 2001978838547701760, '140', '60201', 'Spring Boot', 10.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (18, 2001989751328043008, '141', '60201', '前端工程', 20.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (19, 2004192899444690944, '143', '60201', 'Java', 10.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (20, 2005494280843194368, '144', '60201', 'Vue.js', 20.00, NULL);

-- ----------------------------
-- Table structure for xc_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `xc_pay_record`;
CREATE TABLE `xc_pay_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pay_no` bigint NOT NULL COMMENT '本系统支付交易号',
  `out_pay_no` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '第三方支付交易流水号',
  `out_pay_channel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '第三方支付渠道编号',
  `order_id` bigint NOT NULL COMMENT '商品订单号',
  `order_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单名称',
  `total_price` float(8, 2) NOT NULL COMMENT '订单总价单位元',
  `currency` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '币种CNY',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `status` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '支付状态',
  `pay_success_time` datetime NULL DEFAULT NULL COMMENT '支付成功时间',
  `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pay_order_unioue2`(`pay_no`) USING BTREE COMMENT '本系统支付交易号',
  UNIQUE INDEX `pay_order_unioue`(`out_pay_no`) USING BTREE COMMENT '第三方支付订单号'
) ENGINE = InnoDB AUTO_INCREMENT = 2005494280941531137 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_pay_record
-- ----------------------------
INSERT INTO `xc_pay_record` VALUES (1577177773231415298, 1577177773231861760, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:04:18', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577179016003612674, 1577179015973519360, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:09:15', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577181370643955713, 1577181370624544768, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:18:36', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577182027190972417, 1577182027171524608, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:21:13', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577182653388025858, 1577182653344460800, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:23:42', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577237009017651202, 1577237008990695424, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 17:59:41', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577239361250500609, 1577239361225244672, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 18:09:02', '601002', '2022-10-04 18:09:44', '50');
INSERT INTO `xc_pay_record` VALUES (1577419635984793601, 1577419635962195968, '2022100522001422760505741092', 'Alipay', 1577258681653280768, 'Nacos微服务开发实战', 1.00, 'CNY', '2022-10-05 06:05:23', '601002', '2022-10-05 06:06:39', '52');
INSERT INTO `xc_pay_record` VALUES (1585094781699452930, 1585094781684236288, NULL, NULL, 1585094781512269824, 'java零基础入门', 11.00, 'CNY', '2022-10-26 10:23:40', '601001', NULL, '51');
INSERT INTO `xc_pay_record` VALUES (1585096384011689985, 1585096383987376128, '2022102622001422760505751569', '603002', 1585094781512269824, 'java零基础入门', 11.00, 'CNY', '2022-10-26 10:30:02', '601002', '2022-10-26 10:32:13', '51');
INSERT INTO `xc_pay_record` VALUES (1585118358242865154, 1585118358214623232, '2022102622001422760505751132', '603002', 1585094781512269824, 'java零基础入门', 11.00, 'CNY', '2022-10-26 11:57:21', '601002', '2022-10-26 11:58:50', '51');
INSERT INTO `xc_pay_record` VALUES (1623527995601891329, 1623527995592368128, '2023020922001422760505798854', '603002', 1623527995495899136, 'Spring Cloud 开发实战', 1.00, 'CNY', '2023-02-09 11:43:32', '601002', '2023-02-09 11:44:42', '52');
INSERT INTO `xc_pay_record` VALUES (1995756116320546818, 1995756116313993216, NULL, NULL, 1995756116213329920, 'SpringBoot核心', 0.01, 'CNY', '2025-12-02 15:25:12', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1995756143919067138, 1995756143929290752, NULL, NULL, 1995756116213329920, 'SpringBoot核心', 0.01, 'CNY', '2025-12-02 15:25:19', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1995756173329526786, 1995756173335556096, NULL, NULL, 1995756116213329920, 'SpringBoot核心', 0.01, 'CNY', '2025-12-02 15:25:26', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1995756905017470978, 1995756905057054720, NULL, NULL, 1995756116213329920, 'SpringBoot核心', 0.01, 'CNY', '2025-12-02 15:28:20', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1995757395490938881, 1995757395469533184, '1995757395469533184', 'Alipay', 1995756116213329920, 'SpringBoot核心', 0.01, 'CNY', '2025-12-02 15:30:17', '601002', '2025-12-02 16:00:54', '52');
INSERT INTO `xc_pay_record` VALUES (2001343030444490754, 2001343030437261312, NULL, NULL, 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 01:25:36', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001343054440103938, 2001343054499983360, NULL, NULL, 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 01:25:42', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001343716833951745, 2001343716881248256, NULL, NULL, 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 01:28:20', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001345476872962049, 2001345476920258560, NULL, NULL, 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 01:35:20', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001345619328303106, 2001345619367211008, NULL, NULL, 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 01:35:54', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001345629155557378, 2001345629194465280, NULL, NULL, 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 01:35:56', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001345740925370370, 2001345740951695360, NULL, NULL, 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 01:36:23', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001345746164056066, 2001345746169409536, NULL, NULL, 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 01:36:24', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001598551458136065, 2001598551447003136, NULL, NULL, 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 18:20:57', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001599025485774850, 2001599025478754304, '2001599025478754304', 'Alipay', 2001343030340792320, '软件测试工程', 88.00, 'CNY', '2025-12-18 18:22:50', '601002', '2025-12-18 18:22:53', '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001703976086061057, 2001703976075083776, '2001703976075083776', 'Alipay', 2001703975991197696, '软件测试工程', 88.00, 'CNY', '2025-12-19 01:19:52', '601002', '2025-12-19 01:20:03', '2001701192204894210');
INSERT INTO `xc_pay_record` VALUES (2001704871007928321, 2001704871064059904, '2001704871064059904', 'Alipay', 2001704871047282688, '软件测试工程', 88.00, 'CNY', '2025-12-19 01:23:26', '601002', '2025-12-19 01:23:38', '2001704773104517121');
INSERT INTO `xc_pay_record` VALUES (2001706197683011585, 2001706197680705536, '2001706197680705536', 'Alipay', 2001706197605208064, '软件测试工程', 88.00, 'CNY', '2025-12-19 01:28:42', '601002', '2025-12-19 01:28:49', '2001706129504681985');
INSERT INTO `xc_pay_record` VALUES (2001713763934851073, 2001713763923644416, '2001713763923644416', 'Alipay', 2001713763822981120, '软件测试工程', 88.00, 'CNY', '2025-12-19 01:58:46', '601002', '2025-12-19 01:59:07', '2001712598077751297');
INSERT INTO `xc_pay_record` VALUES (2001975721183498242, 2001975721173196800, '2001975721173196800', 'Alipay', 2001975721076727808, 'Java基础程序', 80.00, 'CNY', '2025-12-19 19:19:41', '601002', '2025-12-19 19:20:14', '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001978838503477249, 2001978838564478976, '2001978838564478976', 'Alipay', 2001978838547701760, 'Spring Boot', 10.00, 'CNY', '2025-12-19 19:32:05', '601002', '2025-12-19 19:32:13', '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001979999096754177, 2001979999132590080, '2001979999132590080', 'Alipay', 2001979999111618560, '前端工程', 20.00, 'CNY', '2025-12-19 19:36:41', '601002', '2025-12-19 19:36:58', '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001982489154375682, 2001982489181822976, '2001982489181822976', 'Alipay', 2001982489165045760, '前端工程', 20.00, 'CNY', '2025-12-19 19:46:35', '601002', '2025-12-19 19:46:51', '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001983177901035522, 2001983113285869568, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:49:04', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001983699890556929, 2001983699943170048, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:51:24', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001983855599898625, 2001983855610568704, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:52:01', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001983864282107905, 2001983864309555200, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:52:03', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001983878043619329, 2001983878104621056, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:52:06', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001983888311275521, 2001983888326139904, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:52:09', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001983901162622977, 2001983901206847488, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:52:12', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001984685598134273, 2001984685587832832, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:55:19', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001985115476545537, 2001985115474632704, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:57:01', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001985157012738049, 2001985143056375808, NULL, NULL, 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:57:09', '601001', NULL, '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001985780366004226, 2001985754304880640, '2001985754304880640', 'Alipay', 2001983037125697536, '前端工程', 20.00, 'CNY', '2025-12-19 19:59:34', '601002', '2025-12-19 20:01:15', '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001986556559671297, 2001986556552957952, '2001986556552957952', 'Alipay', 2001986556456488960, '前端工程', 20.00, 'CNY', '2025-12-19 20:02:45', '601002', '2025-12-19 20:04:10', '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2001989751419789313, 2001989751411929088, '2001989751411929088', 'Alipay', 2001989751328043008, '前端工程', 20.00, 'CNY', '2025-12-19 20:15:27', '601002', '2025-12-19 20:15:50', '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2004192899567767554, 2004192899557937152, '2004192899557937152', 'Alipay', 2004192899444690944, 'Java', 10.00, 'CNY', '2025-12-25 22:09:58', '601002', '2025-12-25 22:10:13', '2000079718406803457');
INSERT INTO `xc_pay_record` VALUES (2005494280941531137, 2005494280939663360, '2005494280939663360', 'Alipay', 2005494280843194368, 'Vue.js', 20.00, 'CNY', '2025-12-29 12:21:12', '601002', '2025-12-29 12:21:17', '2000079718406803457');

SET FOREIGN_KEY_CHECKS = 1;
