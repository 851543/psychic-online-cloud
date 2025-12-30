/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80042
 Source Host           : localhost:3306
 Source Schema         : psychic_learning

 Target Server Type    : MySQL
 Target Server Version : 80042
 File Encoding         : 65001

 Date: 29/12/2025 23:14:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xc_choose_course
-- ----------------------------
DROP TABLE IF EXISTS `xc_choose_course`;
CREATE TABLE `xc_choose_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `course_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `company_id` bigint NOT NULL COMMENT '机构id',
  `order_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '选课类型',
  `create_date` datetime NOT NULL COMMENT '添加时间',
  `course_price` float(10, 2) NOT NULL COMMENT '课程价格',
  `valid_days` int NOT NULL COMMENT '课程有效期(天)',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '选课状态',
  `validtime_start` datetime NOT NULL COMMENT '开始服务时间',
  `validtime_end` datetime NOT NULL COMMENT '结束服务时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_choose_course
-- ----------------------------
INSERT INTO `xc_choose_course` VALUES (16, 121, 'Spring Cloud 开发实战', '52', 1232141425, '700002', '2023-02-09 11:43:32', 1.00, 365, '701001', '2023-02-09 11:43:32', '2024-02-09 11:43:32', NULL);
INSERT INTO `xc_choose_course` VALUES (17, 121, 'Spring Cloud 开发实战', '52', 1232141425, '700002', '2023-02-09 11:49:06', 1.00, 365, '701002', '2023-02-09 11:49:06', '2024-02-09 11:49:06', NULL);
INSERT INTO `xc_choose_course` VALUES (18, 125, 'SpringBoot核心', '52', 1232141425, '700002', '2025-12-02 15:22:57', 0.01, 365, '701002', '2025-12-02 15:23:01', '2026-12-02 15:23:01', NULL);
INSERT INTO `xc_choose_course` VALUES (19, 138, '软件测试工程', '2000079718406803457', 2, '700002', '2025-12-18 01:25:36', 88.00, 365, '701001', '2025-12-18 01:25:36', '2026-12-18 01:25:36', NULL);
INSERT INTO `xc_choose_course` VALUES (20, 138, '软件测试工程', '2000079718406803457', 2, '700002', '2025-12-18 18:28:50', 88.00, 365, '701002', '2025-12-18 18:28:50', '2026-12-18 18:28:50', NULL);
INSERT INTO `xc_choose_course` VALUES (21, 138, '软件测试工程', '2001701192204894210', 2, '700002', '2025-12-19 01:19:52', 88.00, 365, '701001', '2025-12-19 01:19:52', '2026-12-19 01:19:52', NULL);
INSERT INTO `xc_choose_course` VALUES (22, 138, '软件测试工程', '2001704773104517121', 2, '700002', '2025-12-19 01:23:26', 88.00, 365, '701001', '2025-12-19 01:23:26', '2026-12-19 01:23:26', NULL);
INSERT INTO `xc_choose_course` VALUES (23, 138, '软件测试工程', '2001706129504681985', 2, '700002', '2025-12-19 01:28:42', 88.00, 365, '701001', '2025-12-19 01:28:42', '2026-12-19 01:28:42', NULL);
INSERT INTO `xc_choose_course` VALUES (24, 138, '软件测试工程', '2001706129504681985', 2, '700002', '2025-12-19 01:30:53', 88.00, 365, '701002', '2025-12-19 01:30:53', '2026-12-19 01:30:53', NULL);
INSERT INTO `xc_choose_course` VALUES (25, 138, '软件测试工程', '2001712598077751297', 2, '700002', '2025-12-19 01:55:19', 88.00, 365, '701001', '2025-12-19 01:55:19', '2026-12-19 01:55:19', NULL);
INSERT INTO `xc_choose_course` VALUES (26, 138, '软件测试工程', '2001712598077751297', 2, '700002', '2025-12-19 02:03:02', 88.00, 365, '701002', '2025-12-19 02:03:02', '2026-12-19 02:03:02', NULL);
INSERT INTO `xc_choose_course` VALUES (27, 139, 'Java基础程序', '2000079718406803457', 2, '700002', '2025-12-19 19:19:41', 80.00, 365, '701001', '2025-12-19 19:19:41', '2026-12-19 19:19:41', NULL);
INSERT INTO `xc_choose_course` VALUES (28, 140, 'Spring Boot', '2000079718406803457', 2, '700002', '2025-12-19 19:32:05', 10.00, 365, '701001', '2025-12-19 19:32:05', '2026-12-19 19:32:05', NULL);
INSERT INTO `xc_choose_course` VALUES (29, 140, 'Spring Boot', '2000079718406803457', 2, '700002', '2025-12-19 19:32:31', 10.00, 365, '701002', '2025-12-19 19:32:31', '2026-12-19 19:32:31', NULL);
INSERT INTO `xc_choose_course` VALUES (37, 141, '前端工程', '2000079718406803457', 2, '700002', '2025-12-19 20:15:26', 20.00, 365, '701001', '2025-12-19 20:15:26', '2026-12-19 20:15:26', NULL);
INSERT INTO `xc_choose_course` VALUES (38, 143, 'Java', '2000079718406803457', 2, '700002', '2025-12-25 22:09:58', 10.00, 365, '701001', '2025-12-25 22:09:58', '2026-12-25 22:09:58', NULL);
INSERT INTO `xc_choose_course` VALUES (39, 144, 'Vue.js', '2000079718406803457', 2, '700002', '2025-12-29 12:19:04', 20.00, 365, '701001', '2025-12-29 12:19:04', '2026-12-29 12:19:04', NULL);

-- ----------------------------
-- Table structure for xc_course_tables
-- ----------------------------
DROP TABLE IF EXISTS `xc_course_tables`;
CREATE TABLE `xc_course_tables`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choose_course_id` bigint NOT NULL COMMENT '选课记录id',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `company_id` bigint NOT NULL COMMENT '机构id',
  `course_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `course_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `create_date` datetime NOT NULL COMMENT '添加时间',
  `validtime_start` datetime NULL DEFAULT NULL COMMENT '开始服务时间',
  `validtime_end` datetime NOT NULL COMMENT '到期时间',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `course_tables_unique`(`user_id`, `course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_course_tables
-- ----------------------------
INSERT INTO `xc_course_tables` VALUES (11, 16, '52', 121, 1232141425, 'Spring Cloud 开发实战', '700002', '2023-02-09 11:44:48', '2023-02-09 11:43:32', '2024-02-09 11:43:32', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (12, 19, '2000079718406803457', 138, 2, '软件测试工程', '700002', '2025-12-18 18:22:58', '2025-12-18 01:25:36', '2026-12-18 01:25:36', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (13, 21, '2001701192204894210', 138, 2, '软件测试工程', '700002', '2025-12-19 01:20:08', '2025-12-19 01:19:52', '2026-12-19 01:19:52', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (14, 22, '2001704773104517121', 138, 2, '软件测试工程', '700002', '2025-12-19 01:23:43', '2025-12-19 01:23:26', '2026-12-19 01:23:26', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (15, 23, '2001706129504681985', 138, 2, '软件测试工程', '700002', '2025-12-19 01:28:54', '2025-12-19 01:28:42', '2026-12-19 01:28:42', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (16, 25, '2001712598077751297', 138, 2, '软件测试工程', '700002', '2025-12-19 01:59:12', '2025-12-19 01:55:19', '2026-12-19 01:55:19', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (17, 27, '2000079718406803457', 139, 2, 'Java基础程序', '700002', '2025-12-19 19:20:19', '2025-12-19 19:19:41', '2026-12-19 19:19:41', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (18, 28, '2000079718406803457', 140, 2, 'Spring Boot', '700002', '2025-12-19 19:32:18', '2025-12-19 19:32:05', '2026-12-19 19:32:05', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (23, 37, '2000079718406803457', 141, 2, '前端工程', '700002', '2025-12-19 20:15:55', '2025-12-19 20:15:26', '2026-12-19 20:15:26', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (24, 38, '2000079718406803457', 143, 2, 'Java', '700002', '2025-12-25 22:10:18', '2025-12-25 22:09:58', '2026-12-25 22:09:58', NULL, NULL);
INSERT INTO `xc_course_tables` VALUES (25, 39, '2000079718406803457', 144, 2, 'Vue.js', '700002', '2025-12-29 12:21:22', '2025-12-29 12:19:04', '2026-12-29 12:19:04', NULL, NULL);

-- ----------------------------
-- Table structure for xc_learn_record
-- ----------------------------
DROP TABLE IF EXISTS `xc_learn_record`;
CREATE TABLE `xc_learn_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL COMMENT '课程id',
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `learn_date` datetime NULL DEFAULT NULL COMMENT '最近学习时间',
  `learn_length` bigint NULL DEFAULT NULL COMMENT '学习时长',
  `teachplan_id` bigint NULL DEFAULT NULL COMMENT '章节id',
  `teachplan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '章节名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `learn_record_unique`(`course_id`, `user_id`, `teachplan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_learn_record
-- ----------------------------
INSERT INTO `xc_learn_record` VALUES (1, 123, 'SpringBoot实战', '52', '2022-10-06 11:31:19', 22, 222, '入门程序');
INSERT INTO `xc_learn_record` VALUES (2, 121, 'Java编程思想', '52', '2022-10-06 11:31:57', 10, 333, 'Java学习路径');
INSERT INTO `xc_learn_record` VALUES (7, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:24', 0, 269, '1.1 什么是配置中心');
INSERT INTO `xc_learn_record` VALUES (8, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:23', 0, 270, '1.2Nacos简介');
INSERT INTO `xc_learn_record` VALUES (9, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:25', 0, 271, '1.3安装Nacos Server');
INSERT INTO `xc_learn_record` VALUES (10, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:27', 0, 272, '1.4Nacos配置入门');
INSERT INTO `xc_learn_record` VALUES (11, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:41:08', 0, 275, '2.1什么是服务发现');
INSERT INTO `xc_learn_record` VALUES (12, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:46', 0, 276, '2.2服务发现快速入门');

SET FOREIGN_KEY_CHECKS = 1;
