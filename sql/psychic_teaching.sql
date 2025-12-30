/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80042
 Source Host           : localhost:3306
 Source Schema         : psychic_teaching

 Target Server Type    : MySQL
 Target Server Version : 80042
 File Encoding         : 65001

 Date: 29/12/2025 23:14:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '作业ID',
  `company_id` bigint NULL DEFAULT NULL COMMENT '机构id',
  `course_id` bigint NULL DEFAULT NULL COMMENT '课程id',
  `teachplan_id` bigint NULL DEFAULT NULL COMMENT '课程计划ID(章节)',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作业标题',
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作业内容/要求',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `change_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '作业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (9, 2, 144, 357, 'Java', 'Java写法', '2025-12-28 22:26:02', '2025-12-28 22:26:02');
INSERT INTO `work` VALUES (10, 2, 144, 355, 'vue写法', 'vue写法', '2025-12-28 22:56:31', '2025-12-28 22:56:31');
INSERT INTO `work` VALUES (11, 2, 144, 354, 'java基础', '1+2编码实现', '2025-12-29 12:22:45', '2025-12-29 12:22:45');

-- ----------------------------
-- Table structure for work_record
-- ----------------------------
DROP TABLE IF EXISTS `work_record`;
CREATE TABLE `work_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '作业记录ID',
  `company_id` bigint NULL DEFAULT NULL COMMENT '机构id',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `course_pub_id` bigint NULL DEFAULT NULL COMMENT '课程发布ID(可选)',
  `work_id` bigint NOT NULL COMMENT '作业ID(work.id)',
  `teachplan_id` bigint NOT NULL COMMENT '课程计划ID(章节)',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提交人(学生用户名)',
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '作业答案/提交内容',
  `answer_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'text' COMMENT '提交类型:text/file/online_code等',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '306001' COMMENT '状态:306001待提交,306002待批阅,306003已批阅',
  `correct_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '批阅评语',
  `correct_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '批阅人(老师用户名)',
  `correction_date` datetime NULL DEFAULT NULL COMMENT '批改时间',
  `submit_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间(最后提交时间)',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `change_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '作业提交/批改记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_record
-- ----------------------------
INSERT INTO `work_record` VALUES (1, NULL, 144, NULL, 9, 354, '88', 'public class Main {\n    public static void main(String[] args) throws Exception {\n        System.out.println(\"Hello, world!\");\n    }\n}\n', 'online_code', '306003', '很棒', '88', '2025-12-29 11:48:12', '2025-12-29 10:40:09', '2025-12-29 10:40:09', '2025-12-29 10:40:09');
INSERT INTO `work_record` VALUES (2, NULL, 144, NULL, 11, 354, '88', 'public class Main {\n    public static void main(String[] args) throws Exception {\n        System.out.println(1+2);\n    }\n}\n', 'online_code', '306003', '没问题', '88', '2025-12-29 12:26:18', '2025-12-29 12:25:47', '2025-12-29 12:25:47', '2025-12-29 12:25:47');

SET FOREIGN_KEY_CHECKS = 1;
