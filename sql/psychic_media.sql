/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80042
 Source Host           : localhost:3306
 Source Schema         : psychic_media

 Target Server Type    : MySQL
 Target Server Version : 80042
 File Encoding         : 65001

 Date: 29/12/2025 23:14:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for media_files
-- ----------------------------
DROP TABLE IF EXISTS `media_files`;
CREATE TABLE `media_files`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件id,md5值',
  `company_id` bigint NULL DEFAULT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件名称',
  `file_type` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件类型（图片、文档，视频）',
  `tags` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签',
  `bucket` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存储目录',
  `file_path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `file_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件id',
  `url` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '媒资文件访问地址',
  `username` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上传人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `change_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `status` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '状态,1:正常，0:不展示',
  `remark` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `audit_status` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `audit_mind` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_fileid`(`file_id`) USING BTREE COMMENT '文件id唯一索引 '
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '媒资信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_files
-- ----------------------------
INSERT INTO `media_files` VALUES ('053f026d3cd2c21f8800d4af937a0bb7', 1232141425, NULL, '053f026d3cd2c21f8800d4af937a0bb7.mp4', '001002', '课程视频', 'video', '0/5/053f026d3cd2c21f8800d4af937a0bb7/053f026d3cd2c21f8800d4af937a0bb7.mp4', '053f026d3cd2c21f8800d4af937a0bb7', '/video/0/5/053f026d3cd2c21f8800d4af937a0bb7/053f026d3cd2c21f8800d4af937a0bb7.mp4', NULL, '2025-11-07 15:33:51', NULL, '1', '', '002003', NULL, 3462475);
INSERT INTO `media_files` VALUES ('0586ca435165a45e3dcce4ff5bf49b87', 1232141425, NULL, 'avatar.png', '001001', NULL, 'mediafiles', '2025/12/15/0586ca435165a45e3dcce4ff5bf49b87.png', '0586ca435165a45e3dcce4ff5bf49b87', '/mediafiles/2025/12/15/0586ca435165a45e3dcce4ff5bf49b87.png', NULL, '2025-12-15 15:48:52', NULL, '1', NULL, '002003', NULL, 87017);
INSERT INTO `media_files` VALUES ('1137f04b2f44d1b2c37bcb73608864da', 1232141425, NULL, 'course29943168382846755.html', '001003', NULL, 'mediafiles', 'course/18.html', '1137f04b2f44d1b2c37bcb73608864da', NULL, NULL, '2022-12-18 12:21:32', NULL, '1', NULL, '002003', NULL, 34210);
INSERT INTO `media_files` VALUES ('11602c2ddbca6bd64af15f50e76bf93d', 1232141425, NULL, 'ca18946b8a37cb829e231dc4f460acd.jpg', '001001', NULL, 'mediafiles', '2025/10/23/11602c2ddbca6bd64af15f50e76bf93d.jpg', '11602c2ddbca6bd64af15f50e76bf93d', '/mediafiles/2025/10/23/11602c2ddbca6bd64af15f50e76bf93d.jpg', NULL, '2025-10-23 21:47:09', NULL, '1', NULL, '002003', NULL, 321855);
INSERT INTO `media_files` VALUES ('1580180577525002241', 1232141425, NULL, '1.jpg', '001003', NULL, 'mediafiles', NULL, '8383a8c2c1d098fcc07da7d6e79ae31e', '/mediafiles/2022/10/12/8383a8c2c1d098fcc07da7d6e79ae31e.jpg', NULL, '2022-10-12 20:56:23', NULL, '1', NULL, NULL, NULL, 5767);
INSERT INTO `media_files` VALUES ('18f919e23bedab97a78762c4875addc4', 1232141425, NULL, '垂直分库-插入和查询测试.avi', '001002', '课程视频', 'video', '1/8/18f919e23bedab97a78762c4875addc4/18f919e23bedab97a78762c4875addc4.avi', '18f919e23bedab97a78762c4875addc4', NULL, NULL, '2022-12-15 09:45:18', NULL, '1', NULL, '002003', NULL, 16305152);
INSERT INTO `media_files` VALUES ('1d0f0e6ed8a0c4a89bfd304b84599d9c', 1232141425, NULL, 'asset-icoGather.png', '001001', NULL, 'mediafiles', '2022/09/20/1d0f0e6ed8a0c4a89bfd304b84599d9c.png', '1d0f0e6ed8a0c4a89bfd304b84599d9c', '/mediafiles/2022/09/20/1d0f0e6ed8a0c4a89bfd304b84599d9c.png', NULL, '2022-09-20 21:21:28', NULL, '1', '', '002003', NULL, 8059);
INSERT INTO `media_files` VALUES ('1f229319d6fed3431d2f9d06193a433b', 1232141425, NULL, '01-分布式事务专题课程介绍.avi', '001002', '课程视频', 'video', '1/f/1f229319d6fed3431d2f9d06193a433b/1f229319d6fed3431d2f9d06193a433b.avi', '1f229319d6fed3431d2f9d06193a433b', '/video/1/f/1f229319d6fed3431d2f9d06193a433b/1f229319d6fed3431d2f9d06193a433b.mp4', NULL, '2022-09-14 18:30:02', NULL, '1', '', '002003', NULL, 14705152);
INSERT INTO `media_files` VALUES ('2-032b7c9da7b606cca9394bc2d083e712', 2, NULL, 'course2725088008868034347.html', '001001', NULL, 'mediafiles', 'course/140.html', '2-032b7c9da7b606cca9394bc2d083e712', '/mediafiles/course/140.html', NULL, '2025-12-19 19:31:50', NULL, '1', NULL, '002003', NULL, 33654);
INSERT INTO `media_files` VALUES ('2-053f026d3cd2c21f8800d4af937a0bb7', 2, NULL, '测试.mp4', '001002', '课程视频', 'video', '0/5/053f026d3cd2c21f8800d4af937a0bb7/053f026d3cd2c21f8800d4af937a0bb7.mp4', '2-053f026d3cd2c21f8800d4af937a0bb7', '/video/0/5/053f026d3cd2c21f8800d4af937a0bb7/053f026d3cd2c21f8800d4af937a0bb7.mp4', NULL, '2025-12-17 23:42:04', NULL, '1', '', '002003', NULL, 3462475);
INSERT INTO `media_files` VALUES ('2-0586ca435165a45e3dcce4ff5bf49b87', 2, NULL, 'avatar.png', '001001', NULL, 'mediafiles', '2025/12/16/0586ca435165a45e3dcce4ff5bf49b87.png', '2-0586ca435165a45e3dcce4ff5bf49b87', '/mediafiles/2025/12/16/0586ca435165a45e3dcce4ff5bf49b87.png', NULL, '2025-12-16 14:32:16', NULL, '1', NULL, '002003', NULL, 87017);
INSERT INTO `media_files` VALUES ('2-0a88b00b334cb2649191844aa017aef1', 2, NULL, 'yuge.png', '001001', NULL, 'mediafiles', '2025/12/17/0a88b00b334cb2649191844aa017aef1.png', '2-0a88b00b334cb2649191844aa017aef1', '/mediafiles/2025/12/17/0a88b00b334cb2649191844aa017aef1.png', NULL, '2025-12-17 23:49:45', NULL, '1', NULL, '002003', NULL, 233491);
INSERT INTO `media_files` VALUES ('2-11602c2ddbca6bd64af15f50e76bf93d', 2, NULL, 'ca18946b8a37cb829e231dc4f460acd.jpg', '001001', NULL, 'mediafiles', '2025/12/16/11602c2ddbca6bd64af15f50e76bf93d.jpg', '2-11602c2ddbca6bd64af15f50e76bf93d', '/mediafiles/2025/12/16/11602c2ddbca6bd64af15f50e76bf93d.jpg', NULL, '2025-12-16 22:14:33', NULL, '1', NULL, '002003', NULL, 321855);
INSERT INTO `media_files` VALUES ('2-14ef0c9289ae2d244dc72b21ae25dc11', 2, NULL, 'course2779271801137605699.html', '001001', NULL, 'mediafiles', 'course/141.html', '2-14ef0c9289ae2d244dc72b21ae25dc11', '/mediafiles/course/141.html', NULL, '2025-12-27 20:08:20', NULL, '1', NULL, '002003', NULL, 23677);
INSERT INTO `media_files` VALUES ('2-169b0181317d271b81d06ae12bed0ac8', 2, NULL, 'weidong.png', '001001', NULL, 'mediafiles', '2025/12/17/169b0181317d271b81d06ae12bed0ac8.png', '2-169b0181317d271b81d06ae12bed0ac8', '/mediafiles/2025/12/17/169b0181317d271b81d06ae12bed0ac8.png', NULL, '2025-12-17 23:50:41', NULL, '1', NULL, '002003', NULL, 109405);
INSERT INTO `media_files` VALUES ('2-1d9a6eb6f3544242a448eb8a17d5292c', 2, NULL, '62214f12f7770747816f9480b16d906e.mp4', '001002', '课程视频', 'video', '1/d/1d9a6eb6f3544242a448eb8a17d5292c/1d9a6eb6f3544242a448eb8a17d5292c.mp4', '2-1d9a6eb6f3544242a448eb8a17d5292c', '/video/1/d/1d9a6eb6f3544242a448eb8a17d5292c/1d9a6eb6f3544242a448eb8a17d5292c.mp4', NULL, '2025-12-26 21:00:11', NULL, '1', '', '002003', NULL, 198315);
INSERT INTO `media_files` VALUES ('2-1e31da93021354ae14a3e22c1890c0a3', 2, NULL, 'widget-dem.png', '001001', NULL, 'mediafiles', '2025/12/19/1e31da93021354ae14a3e22c1890c0a3.png', '2-1e31da93021354ae14a3e22c1890c0a3', '/mediafiles/2025/12/19/1e31da93021354ae14a3e22c1890c0a3.png', NULL, '2025-12-19 19:34:54', NULL, '1', NULL, '002003', NULL, 51831);
INSERT INTO `media_files` VALUES ('2-2afbc9a9e9fbe73700ee18ef5663f1ef', 2, NULL, '哈哈.avi', '001002', '课程视频', 'video', '2/a/2afbc9a9e9fbe73700ee18ef5663f1ef/2afbc9a9e9fbe73700ee18ef5663f1ef.avi', '2-2afbc9a9e9fbe73700ee18ef5663f1ef', '/video/2/-/2-2afbc9a9e9fbe73700ee18ef5663f1ef/2-2afbc9a9e9fbe73700ee18ef5663f1ef.mp4', NULL, '2025-12-15 21:18:51', NULL, '1', '', '002003', NULL, 40635686);
INSERT INTO `media_files` VALUES ('2-31b1f0851891bff0ab75055e8a7f1e9f', 2, NULL, 'course1275885896563337328.html', '001001', NULL, 'mediafiles', 'course/139.html', '2-31b1f0851891bff0ab75055e8a7f1e9f', '/mediafiles/course/139.html', NULL, '2025-12-19 19:17:51', NULL, '1', NULL, '002003', NULL, 34873);
INSERT INTO `media_files` VALUES ('2-466d7c23bbfbb24f565f54825c7b4ba5', 2, NULL, 'course4862671102068784192.html', '001001', NULL, 'mediafiles', 'course/142.html', '2-466d7c23bbfbb24f565f54825c7b4ba5', '/mediafiles/course/142.html', NULL, '2025-12-25 21:56:12', NULL, '1', NULL, '002003', NULL, 33596);
INSERT INTO `media_files` VALUES ('2-46fbf462848754bd78d441ff8bfb2f3e', 2, NULL, '1500433855.49.png', '001001', NULL, 'mediafiles', '2025/12/26/46fbf462848754bd78d441ff8bfb2f3e.png', '2-46fbf462848754bd78d441ff8bfb2f3e', '/mediafiles/2025/12/26/46fbf462848754bd78d441ff8bfb2f3e.png', NULL, '2025-12-26 23:20:33', NULL, '1', NULL, '002003', NULL, 11146);
INSERT INTO `media_files` VALUES ('2-4e95321f9fd9f244b7d48e179125091b', 2, NULL, '4K60帧鸡你太美打篮球_爱给网_aigei_com.avi', '001002', '课程视频', 'video', '4/e/4e95321f9fd9f244b7d48e179125091b/4e95321f9fd9f244b7d48e179125091b.avi', '2-4e95321f9fd9f244b7d48e179125091b', '/video/2/-/2-4e95321f9fd9f244b7d48e179125091b/2-4e95321f9fd9f244b7d48e179125091b.mp4', NULL, '2025-12-15 21:19:02', NULL, '1', '', '002003', NULL, 28585264);
INSERT INTO `media_files` VALUES ('2-51ca999eb8a5510f5549fcb15f4d6b06', 2, NULL, 'course686147948475481826.html', '001001', NULL, 'mediafiles', 'course/144.html', '2-51ca999eb8a5510f5549fcb15f4d6b06', '/mediafiles/course/144.html', NULL, '2025-12-26 23:22:10', NULL, '1', NULL, '002003', NULL, 34188);
INSERT INTO `media_files` VALUES ('2-53bd4ee55a1e2dfe446b4390c19cc079', 2, NULL, '705c5294eb7aa6e8c1c58edc3f779982.mp4', '001002', '课程视频', 'video', '5/3/53bd4ee55a1e2dfe446b4390c19cc079/53bd4ee55a1e2dfe446b4390c19cc079.mp4', '2-53bd4ee55a1e2dfe446b4390c19cc079', '/video/5/3/53bd4ee55a1e2dfe446b4390c19cc079/53bd4ee55a1e2dfe446b4390c19cc079.mp4', NULL, '2025-12-15 21:19:05', NULL, '1', '', '002003', NULL, 7252229);
INSERT INTO `media_files` VALUES ('2-55d53f5d88f71069418bf8771b921b99', 2, NULL, 'asset-video.png', '001001', NULL, 'mediafiles', '2025/12/19/55d53f5d88f71069418bf8771b921b99.png', '2-55d53f5d88f71069418bf8771b921b99', '/mediafiles/2025/12/19/55d53f5d88f71069418bf8771b921b99.png', NULL, '2025-12-19 19:30:05', NULL, '1', NULL, '002003', NULL, 626886);
INSERT INTO `media_files` VALUES ('2-5a19091714ed2b5ba93444b3acb9756a', 2, NULL, '教育.mp4', '001002', '课程视频', 'video', '5/a/5a19091714ed2b5ba93444b3acb9756a/5a19091714ed2b5ba93444b3acb9756a.mp4', '2-5a19091714ed2b5ba93444b3acb9756a', '/video/5/a/5a19091714ed2b5ba93444b3acb9756a/5a19091714ed2b5ba93444b3acb9756a.mp4', NULL, '2025-12-17 23:41:40', NULL, '1', '', '002003', NULL, 516144994);
INSERT INTO `media_files` VALUES ('2-5bb102105e491983959a4226c99c3b84', 2, NULL, '操作视频+基于Spring Cloud和AI的通灵在线智慧教育系统的设计与实现+党广俊+2431020120507+计算机应用工程（专升本）2405班..mp4', '001002', '课程视频', 'video', '5/b/5bb102105e491983959a4226c99c3b84/5bb102105e491983959a4226c99c3b84.mp4', '2-5bb102105e491983959a4226c99c3b84', '/video/5/b/5bb102105e491983959a4226c99c3b84/5bb102105e491983959a4226c99c3b84.mp4', NULL, '2025-12-15 21:19:04', NULL, '1', '', '002003', NULL, 16481572);
INSERT INTO `media_files` VALUES ('2-66ba42f77f936396348ba4d7218d8028', 2, NULL, 'course1233678002892936273.html', '001001', NULL, 'mediafiles', 'course/138.html', '2-66ba42f77f936396348ba4d7218d8028', '/mediafiles/course/138.html', NULL, '2025-12-18 01:34:51', NULL, '1', NULL, '002003', NULL, 37355);
INSERT INTO `media_files` VALUES ('2-6bfaabef899fbf00890675b4e3b63af4', 2, NULL, 'f5d2235b37f0df47b438e23b4c60cf8b.mp4', '001002', '课程视频', 'video', '6/b/6bfaabef899fbf00890675b4e3b63af4/6bfaabef899fbf00890675b4e3b63af4.mp4', '2-6bfaabef899fbf00890675b4e3b63af4', '/video/6/b/6bfaabef899fbf00890675b4e3b63af4/6bfaabef899fbf00890675b4e3b63af4.mp4', NULL, '2025-12-15 21:12:52', NULL, '1', '', '002003', NULL, 634332);
INSERT INTO `media_files` VALUES ('2-73d7a836e2c071df985a524a7ac0ddf2', 2, NULL, '学习.mp4', '001002', '课程视频', 'video', '7/3/73d7a836e2c071df985a524a7ac0ddf2/73d7a836e2c071df985a524a7ac0ddf2.mp4', '2-73d7a836e2c071df985a524a7ac0ddf2', '/video/7/3/73d7a836e2c071df985a524a7ac0ddf2/73d7a836e2c071df985a524a7ac0ddf2.mp4', NULL, '2025-12-17 23:46:16', NULL, '1', '', '002003', NULL, 498417391);
INSERT INTO `media_files` VALUES ('2-7c9a49e8a0d671f963587de6bc546cd2', 2, NULL, 'course6943156574807772783.html', '001001', NULL, 'mediafiles', 'course/140.html', '2-7c9a49e8a0d671f963587de6bc546cd2', '/mediafiles/course/140.html', NULL, '2025-12-27 20:08:20', NULL, '1', NULL, '002003', NULL, 23447);
INSERT INTO `media_files` VALUES ('2-8537219b193c36d99b8776942c7523ca', 2, NULL, 'course4785166976950038114.html', '001001', NULL, 'mediafiles', 'course/141.html', '2-8537219b193c36d99b8776942c7523ca', '/mediafiles/course/141.html', NULL, '2025-12-19 19:36:20', NULL, '1', NULL, '002003', NULL, 33884);
INSERT INTO `media_files` VALUES ('2-8fadffd0069d325276478093abb6e3c4', 2, NULL, '知识.mp4', '001002', '课程视频', 'video', '8/f/8fadffd0069d325276478093abb6e3c4/8fadffd0069d325276478093abb6e3c4.mp4', '2-8fadffd0069d325276478093abb6e3c4', '/video/8/f/8fadffd0069d325276478093abb6e3c4/8fadffd0069d325276478093abb6e3c4.mp4', NULL, '2025-12-17 23:46:37', NULL, '1', '', '002003', NULL, 495227852);
INSERT INTO `media_files` VALUES ('2-921b8f82f87efc279f1ce53283d433bc', 2, NULL, 'widget-teach-adv.png', '001001', NULL, 'mediafiles', '2025/12/19/921b8f82f87efc279f1ce53283d433bc.png', '2-921b8f82f87efc279f1ce53283d433bc', '/mediafiles/2025/12/19/921b8f82f87efc279f1ce53283d433bc.png', NULL, '2025-12-19 19:34:42', NULL, '1', NULL, '002003', NULL, 106296);
INSERT INTO `media_files` VALUES ('2-94e1c0384c4c5d6de6d3d84841877709', 2, NULL, 'course6921004516964476673.html', '001001', NULL, 'mediafiles', 'course/137.html', '2-94e1c0384c4c5d6de6d3d84841877709', '/mediafiles/course/137.html', NULL, '2025-12-16 22:58:51', NULL, '1', NULL, '002003', NULL, 34068);
INSERT INTO `media_files` VALUES ('2-964f9729f556fe5468acaba03fabe6a9', 2, NULL, 'cover_Vue.png', '001001', NULL, 'mediafiles', '2025/12/26/964f9729f556fe5468acaba03fabe6a9.png', '2-964f9729f556fe5468acaba03fabe6a9', '/mediafiles/2025/12/26/964f9729f556fe5468acaba03fabe6a9.png', NULL, '2025-12-26 23:18:15', NULL, '1', NULL, '002003', NULL, 36231);
INSERT INTO `media_files` VALUES ('2-97cf0e92717736f2ec14fabe2782bdb9', 2, NULL, 'widget-btnBg.png', '001001', NULL, 'mediafiles', '2025/12/19/97cf0e92717736f2ec14fabe2782bdb9.png', '2-97cf0e92717736f2ec14fabe2782bdb9', '/mediafiles/2025/12/19/97cf0e92717736f2ec14fabe2782bdb9.png', NULL, '2025-12-19 19:29:46', NULL, '1', NULL, '002003', NULL, 18809);
INSERT INTO `media_files` VALUES ('2-a207a2cd35c0b444b50c51a012021c1a', 2, NULL, 'f3cdfbffb3e1fd83b1a6c7edd98f051.jpg', '001001', NULL, 'mediafiles', '2025/12/16/a207a2cd35c0b444b50c51a012021c1a.jpg', '2-a207a2cd35c0b444b50c51a012021c1a', '/mediafiles/2025/12/16/a207a2cd35c0b444b50c51a012021c1a.jpg', NULL, '2025-12-16 22:06:41', NULL, '1', NULL, '002003', NULL, 95778);
INSERT INTO `media_files` VALUES ('2-a61805e1360ab946def5471aaefc0a98', 2, NULL, 'teach1.jpg', '001001', NULL, 'mediafiles', '2025/12/19/a61805e1360ab946def5471aaefc0a98.jpg', '2-a61805e1360ab946def5471aaefc0a98', '/mediafiles/2025/12/19/a61805e1360ab946def5471aaefc0a98.jpg', NULL, '2025-12-19 19:17:04', NULL, '1', NULL, '002003', NULL, 11600);
INSERT INTO `media_files` VALUES ('2-a6896c3d7572ab43b78748b79274d27a', 2, NULL, 'v2-465660021e6c37d11dc7adea59f1bf25_b.jpg', '001001', NULL, 'mediafiles', '2025/12/17/a6896c3d7572ab43b78748b79274d27a.jpg', '2-a6896c3d7572ab43b78748b79274d27a', '/mediafiles/2025/12/17/a6896c3d7572ab43b78748b79274d27a.jpg', NULL, '2025-12-17 23:12:45', NULL, '1', NULL, '002003', NULL, 18805);
INSERT INTO `media_files` VALUES ('2-b2be49a68112c285248211a0976b59c6', 2, NULL, '【哲风壁纸】会说话的眼睛-动漫女孩.mp4', '001002', '课程视频', 'video', 'b/2/b2be49a68112c285248211a0976b59c6/b2be49a68112c285248211a0976b59c6.mp4', '2-b2be49a68112c285248211a0976b59c6', '/video/b/2/b2be49a68112c285248211a0976b59c6/b2be49a68112c285248211a0976b59c6.mp4', NULL, '2025-12-16 14:22:55', NULL, '1', '', '002003', NULL, 16473085);
INSERT INTO `media_files` VALUES ('2-bc063a26f2192ba05885329b55225779', 2, NULL, 'course4887913637118604236.html', '001001', NULL, 'mediafiles', 'course/138.html', '2-bc063a26f2192ba05885329b55225779', '/mediafiles/course/138.html', NULL, '2025-12-26 22:38:51', NULL, '1', NULL, '002003', NULL, 37172);
INSERT INTO `media_files` VALUES ('2-bc54c117f83e73cb64ef89eb65a49167', 2, NULL, 'course8937434121211352464.html', '001001', NULL, 'mediafiles', 'course/138.html', '2-bc54c117f83e73cb64ef89eb65a49167', '/mediafiles/course/138.html', NULL, '2025-12-17 23:55:41', NULL, '1', NULL, '002003', NULL, 37439);
INSERT INTO `media_files` VALUES ('2-d057976e1bed90926974d64dddad0dda', 2, NULL, '90526bdf2ec1341db90a900e00c57ab1.mp4', '001002', '课程视频', 'video', 'd/0/d057976e1bed90926974d64dddad0dda/d057976e1bed90926974d64dddad0dda.mp4', '2-d057976e1bed90926974d64dddad0dda', '/video/d/0/d057976e1bed90926974d64dddad0dda/d057976e1bed90926974d64dddad0dda.mp4', NULL, '2025-12-15 20:41:55', NULL, '1', '', '002003', NULL, 626615);
INSERT INTO `media_files` VALUES ('2-d42cb429e7952af9d3de9cd7f16d2269', 2, NULL, 'widget-text.png', '001001', NULL, 'mediafiles', '2025/12/19/d42cb429e7952af9d3de9cd7f16d2269.png', '2-d42cb429e7952af9d3de9cd7f16d2269', '/mediafiles/2025/12/19/d42cb429e7952af9d3de9cd7f16d2269.png', NULL, '2025-12-19 19:15:12', NULL, '1', NULL, '002003', NULL, 46405);
INSERT INTO `media_files` VALUES ('2-df7c128cc07926a8db429348ffc7e4b3', 2, NULL, 'default-cover.jpg', '001001', NULL, 'mediafiles', '2025/12/24/df7c128cc07926a8db429348ffc7e4b3.jpg', '2-df7c128cc07926a8db429348ffc7e4b3', '/mediafiles/2025/12/24/df7c128cc07926a8db429348ffc7e4b3.jpg', NULL, '2025-12-24 23:48:48', NULL, '1', NULL, '002003', NULL, 46675);
INSERT INTO `media_files` VALUES ('2-e993839bfb08c206fab10adc86d1ae89', 2, NULL, 'course3964436851202629510.html', '001001', NULL, 'mediafiles', 'course/142.html', '2-e993839bfb08c206fab10adc86d1ae89', '/mediafiles/course/142.html', NULL, '2025-12-27 20:08:30', NULL, '1', NULL, '002003', NULL, 23389);
INSERT INTO `media_files` VALUES ('2-fa37837a0f903fbf5cf41d077372a966', 2, NULL, 'course267097107892325148.html', '001001', NULL, 'mediafiles', 'course/142.html', '2-fa37837a0f903fbf5cf41d077372a966', '/mediafiles/course/142.html', NULL, '2025-12-27 20:01:51', NULL, '1', NULL, '002003', NULL, 23503);
INSERT INTO `media_files` VALUES ('2-faf54e725c433cc79968b96758e2ec02', 2, NULL, 'course6678439156516749924.html', '001001', NULL, 'mediafiles', 'course/144.html', '2-faf54e725c433cc79968b96758e2ec02', '/mediafiles/course/144.html', NULL, '2025-12-29 10:22:41', NULL, '1', NULL, '002003', NULL, 24451);
INSERT INTO `media_files` VALUES ('2-fc7c4846e2442d9812bd1696c64a87ea', 2, NULL, 'pe.png', '001001', NULL, 'mediafiles', '2025/12/17/fc7c4846e2442d9812bd1696c64a87ea.png', '2-fc7c4846e2442d9812bd1696c64a87ea', '/mediafiles/2025/12/17/fc7c4846e2442d9812bd1696c64a87ea.png', NULL, '2025-12-17 23:49:05', NULL, '1', NULL, '002003', NULL, 14822);
INSERT INTO `media_files` VALUES ('2-fee6a6cdfdd80f1b27f0332d2c941087', 2, NULL, 'course4539956715518488648.html', '001001', NULL, 'mediafiles', 'course/143.html', '2-fee6a6cdfdd80f1b27f0332d2c941087', '/mediafiles/course/143.html', NULL, '2025-12-25 22:09:00', NULL, '1', NULL, '002003', NULL, 34215);
INSERT INTO `media_files` VALUES ('23f83ae728bd1269eee7ea2236e79644', 1232141425, NULL, '16-Nacos配置管理-课程总结.avi', '001002', '课程视频', 'video', '2/3/23f83ae728bd1269eee7ea2236e79644/23f83ae728bd1269eee7ea2236e79644.avi', '23f83ae728bd1269eee7ea2236e79644', '/video/2/3/23f83ae728bd1269eee7ea2236e79644/23f83ae728bd1269eee7ea2236e79644.mp4', NULL, '2022-09-14 18:21:44', NULL, '1', '', '002003', NULL, 26053632);
INSERT INTO `media_files` VALUES ('287cdd91c5d444e0752b626cbd95b41c', 1232141425, NULL, 'nacos01.mp4', '001002', '课程视频', 'video', '2/8/287cdd91c5d444e0752b626cbd95b41c/287cdd91c5d444e0752b626cbd95b41c.mp4', '287cdd91c5d444e0752b626cbd95b41c', '/video/2/8/287cdd91c5d444e0752b626cbd95b41c/287cdd91c5d444e0752b626cbd95b41c.mp4', NULL, '2022-09-14 18:28:43', NULL, '1', '', '002003', NULL, 25953447);
INSERT INTO `media_files` VALUES ('2afbc9a9e9fbe73700ee18ef5663f1ef', 1232141425, NULL, '玩滑板的妹子[超清版]_爱给网_aigei_com.avi', '001002', '课程视频', 'video', '2/a/2afbc9a9e9fbe73700ee18ef5663f1ef/2afbc9a9e9fbe73700ee18ef5663f1ef.avi', '2afbc9a9e9fbe73700ee18ef5663f1ef', '/video/2/a/2afbc9a9e9fbe73700ee18ef5663f1ef/2afbc9a9e9fbe73700ee18ef5663f1ef.mp4', NULL, '2025-11-07 15:46:17', NULL, '1', '', '002003', NULL, 40635686);
INSERT INTO `media_files` VALUES ('33c643206bb7c08e2cb99b622d7a1b63', 1232141425, NULL, '1.png', '001001', NULL, 'mediafiles', '2022/10/07/33c643206bb7c08e2cb99b622d7a1b63.png', '33c643206bb7c08e2cb99b622d7a1b63', '/mediafiles/2022/10/07/33c643206bb7c08e2cb99b622d7a1b63.png', NULL, '2022-10-07 06:20:05', NULL, '1', '', '002003', NULL, 169788);
INSERT INTO `media_files` VALUES ('345db593849aada5675ed1e438650eeb', 1232141425, NULL, '1.png', '001001', NULL, 'mediafiles', '2022/10/07/345db593849aada5675ed1e438650eeb.png', '345db593849aada5675ed1e438650eeb', '/mediafiles/2022/10/07/345db593849aada5675ed1e438650eeb.png', NULL, '2022-10-07 09:31:46', NULL, '1', '', '002003', NULL, 70171);
INSERT INTO `media_files` VALUES ('3a5a861d1c745d05166132c47b44f9e4', 1232141425, NULL, '01-Nacos配置管理-内容介绍.avi', '001002', '课程视频', 'video', '3/a/3a5a861d1c745d05166132c47b44f9e4/3a5a861d1c745d05166132c47b44f9e4.avi', '3a5a861d1c745d05166132c47b44f9e4', '/video/3/a/3a5a861d1c745d05166132c47b44f9e4/3a5a861d1c745d05166132c47b44f9e4.mp4', NULL, '2022-09-14 18:19:24', NULL, '1', '', '002003', NULL, 23839232);
INSERT INTO `media_files` VALUES ('3fb1d9a565cb92f395f384bd62ef24cd', 1232141425, NULL, '1614759607876_0.png', '001001', '课程图片', 'mediafiles', '2022/09/20/3fb1d9a565cb92f395f384bd62ef24cd.png', '3fb1d9a565cb92f395f384bd62ef24cd', '/mediafiles/2022/09/20/3fb1d9a565cb92f395f384bd62ef24cd.png', NULL, '2022-09-20 21:06:11', NULL, '1', '', '002003', NULL, 58873);
INSERT INTO `media_files` VALUES ('4443877a076e8d1b05a34326ebb3da51', 1232141425, NULL, 'course2182438520759925614.html', '001001', NULL, 'mediafiles', 'course/125.html', '4443877a076e8d1b05a34326ebb3da51', '/mediafiles/course/125.html', NULL, '2025-11-18 20:33:20', NULL, '1', NULL, '002003', NULL, 34858);
INSERT INTO `media_files` VALUES ('4e95321f9fd9f244b7d48e179125091b', 1232141425, NULL, '4K60帧鸡你太美打篮球_爱给网_aigei_com.avi', '001002', '课程视频', 'video', '4/e/4e95321f9fd9f244b7d48e179125091b/4e95321f9fd9f244b7d48e179125091b.avi', '4e95321f9fd9f244b7d48e179125091b', '/video/4/e/4e95321f9fd9f244b7d48e179125091b/4e95321f9fd9f244b7d48e179125091b.mp4', NULL, '2025-11-07 15:46:13', NULL, '1', '', '002003', NULL, 28585264);
INSERT INTO `media_files` VALUES ('500598cae139f77c1bb54459909e0443', 1232141425, NULL, 'course8561649859933456434.html', '001003', NULL, 'mediafiles', 'course/119.html', '500598cae139f77c1bb54459909e0443', '/mediafiles/course/119.html', NULL, '2022-10-07 09:39:49', NULL, '1', '', '002003', NULL, 35652);
INSERT INTO `media_files` VALUES ('538bd3d652593b8df70d84e643b12842', 1232141425, NULL, 'course6941513291436463735.html', '001003', NULL, 'mediafiles', 'course/121.html', '538bd3d652593b8df70d84e643b12842', NULL, NULL, '2023-02-09 11:33:18', NULL, '1', NULL, '002003', NULL, 36292);
INSERT INTO `media_files` VALUES ('5878a684ee9a36daae5d0741aaca0747', 1232141425, NULL, 'Spring Security集成测试', '001002', NULL, 'video', '5/8/5878a684ee9a36daae5d0741aaca0747/5878a684ee9a36daae5d0741aaca0747.avi', '5878a684ee9a36daae5d0741aaca0747', NULL, NULL, '2022-10-16 15:30:17', NULL, '1', NULL, '002003', NULL, NULL);
INSERT INTO `media_files` VALUES ('6ad24a762f67c18f61966c1b8c55abe6', 1232141425, NULL, '07-分布式事务基础理论-BASE理论.avi', '001002', '课程视频', 'video', '6/a/6ad24a762f67c18f61966c1b8c55abe6/6ad24a762f67c18f61966c1b8c55abe6.avi', '6ad24a762f67c18f61966c1b8c55abe6', '/video/6/a/6ad24a762f67c18f61966c1b8c55abe6/6ad24a762f67c18f61966c1b8c55abe6.mp4', NULL, '2022-09-14 18:30:16', NULL, '1', '', '002003', NULL, 13189632);
INSERT INTO `media_files` VALUES ('70a98b4a2fffc89e50b101f959cc33ca', 1232141425, NULL, '22-Hmily实现TCC事务-开发bank2的confirm方法.avi', '001002', '课程视频', 'video', '7/0/70a98b4a2fffc89e50b101f959cc33ca/70a98b4a2fffc89e50b101f959cc33ca.avi', '70a98b4a2fffc89e50b101f959cc33ca', '/video/7/0/70a98b4a2fffc89e50b101f959cc33ca/70a98b4a2fffc89e50b101f959cc33ca.mp4', NULL, '2022-09-14 18:30:52', NULL, '1', '', '002003', NULL, 18444288);
INSERT INTO `media_files` VALUES ('737f7cea334eb8434bbd9f08a5d89e34', 1232141425, NULL, '1.jpg', '001001', NULL, 'mediafiles', '2025/10/23/737f7cea334eb8434bbd9f08a5d89e34.jpg', '737f7cea334eb8434bbd9f08a5d89e34', '/mediafiles/2025/10/23/737f7cea334eb8434bbd9f08a5d89e34.jpg', NULL, '2025-10-23 21:34:44', NULL, '1', NULL, '002003', NULL, 39077);
INSERT INTO `media_files` VALUES ('74b386417bb9f3764009dc94068a5e44', 1232141425, NULL, 'test2.html', '001003', NULL, 'mediafiles', 'course/74b386417bb9f3764009dc94068a5e44.html', '74b386417bb9f3764009dc94068a5e44', '/mediafiles/course/74b386417bb9f3764009dc94068a5e44.html', NULL, '2022-09-20 21:56:02', NULL, '1', '', '002003', NULL, 40124);
INSERT INTO `media_files` VALUES ('757891eae4473e7ba78827656b1ccacf', 1232141425, NULL, 'studyuser.png', '001001', NULL, 'mediafiles', NULL, '757891eae4473e7ba78827656b1ccacf', '/mediafiles/2022/10/13/757891eae4473e7ba78827656b1ccacf.png', NULL, '2022-10-13 19:57:01', NULL, '1', NULL, '002003', NULL, 4922);
INSERT INTO `media_files` VALUES ('8026f17cf7b8697eccec2c8406d0c96c', 1232141425, NULL, 'nacos.png', '001001', NULL, 'mediafiles', '2022/10/04/8026f17cf7b8697eccec2c8406d0c96c.png', '8026f17cf7b8697eccec2c8406d0c96c', '/mediafiles/2022/10/04/8026f17cf7b8697eccec2c8406d0c96c.png', NULL, '2022-10-04 18:55:01', NULL, '1', '', '002003', NULL, 128051);
INSERT INTO `media_files` VALUES ('809694a6a974c35e3a36f36850837d7c', 1232141425, NULL, '1.avi', '001002', '课程视频', 'video', NULL, '809694a6a974c35e3a36f36850837d7c', '/video/8/0/809694a6a974c35e3a36f36850837d7c/809694a6a974c35e3a36f36850837d7c.avi', NULL, '2022-10-13 21:27:14', NULL, '1', '', '002003', NULL, NULL);
INSERT INTO `media_files` VALUES ('81d7ed5153316f5774885d3b4c07d8bc', 1232141425, NULL, 'Spring Security快速上手-创建工程.avi', '001002', '课程视频', 'video', '8/1/81d7ed5153316f5774885d3b4c07d8bc/81d7ed5153316f5774885d3b4c07d8bc.avi', '81d7ed5153316f5774885d3b4c07d8bc', NULL, NULL, '2022-12-15 09:41:50', NULL, '1', NULL, '002003', NULL, 19945472);
INSERT INTO `media_files` VALUES ('88888888-0586ca435165a45e3dcce4ff5bf49b87', 88888888, NULL, 'avatar.png', '001001', NULL, 'mediafiles', '2025/12/25/0586ca435165a45e3dcce4ff5bf49b87.png', '88888888-0586ca435165a45e3dcce4ff5bf49b87', '/mediafiles/2025/12/25/0586ca435165a45e3dcce4ff5bf49b87.png', NULL, '2025-12-25 22:11:02', NULL, '1', NULL, '002003', NULL, 87017);
INSERT INTO `media_files` VALUES ('88888888-64efaf7cfbe648dd561f512be059ad8b', 88888888, NULL, 'ajun.png', '001001', NULL, 'mediafiles', '2025/12/19/64efaf7cfbe648dd561f512be059ad8b.png', '88888888-64efaf7cfbe648dd561f512be059ad8b', '/mediafiles/2025/12/19/64efaf7cfbe648dd561f512be059ad8b.png', NULL, '2025-12-19 17:46:22', NULL, '1', NULL, '002003', NULL, 257174);
INSERT INTO `media_files` VALUES ('88888888-a61805e1360ab946def5471aaefc0a98', 88888888, NULL, 'teach1.jpg', '001001', NULL, 'mediafiles', '2025/12/19/a61805e1360ab946def5471aaefc0a98.jpg', '88888888-a61805e1360ab946def5471aaefc0a98', '/mediafiles/2025/12/19/a61805e1360ab946def5471aaefc0a98.jpg', NULL, '2025-12-19 17:55:18', NULL, '1', NULL, '002003', NULL, 11600);
INSERT INTO `media_files` VALUES ('88888888-fc7c4846e2442d9812bd1696c64a87ea', 88888888, NULL, 'pe.png', '001001', NULL, 'mediafiles', '2025/12/19/fc7c4846e2442d9812bd1696c64a87ea.png', '88888888-fc7c4846e2442d9812bd1696c64a87ea', '/mediafiles/2025/12/19/fc7c4846e2442d9812bd1696c64a87ea.png', NULL, '2025-12-19 18:13:34', NULL, '1', NULL, '002003', NULL, 14822);
INSERT INTO `media_files` VALUES ('9b0a355a0a954fdb3671998b4b016474', 1232141425, NULL, 'test.html', '001003', NULL, 'mediafiles', 'course/test.html', '9b0a355a0a954fdb3671998b4b016474', NULL, NULL, '2022-12-17 17:04:40', NULL, '1', NULL, '002003', NULL, 34174);
INSERT INTO `media_files` VALUES ('a16da7a132559daf9e1193166b3e7f52', 1232141425, NULL, '1.jpg', '001003', NULL, 'mediafiles', '2022/09/20/a16da7a132559daf9e1193166b3e7f52.jpg', 'a16da7a132559daf9e1193166b3e7f52', '/mediafiles/2022/09/20/a16da7a132559daf9e1193166b3e7f52.jpg', NULL, '2022-09-20 21:26:08', NULL, '1', '', '002003', NULL, 248329);
INSERT INTO `media_files` VALUES ('a61805e1360ab946def5471aaefc0a98', 1232141425, NULL, 'teacherpic.jpg', '001001', NULL, 'mediafiles', '2022/12/18/a61805e1360ab946def5471aaefc0a98.jpg', 'a61805e1360ab946def5471aaefc0a98', '/mediafiles/2022/12/18/a61805e1360ab946def5471aaefc0a98.jpg', NULL, '2022-12-18 12:10:52', NULL, '1', NULL, '002003', NULL, 11600);
INSERT INTO `media_files` VALUES ('a6fb4fc7faf1d3d0831819969529b888', 1232141425, NULL, '1.项目背景.mp4', '001002', '课程视频', 'video', NULL, 'a6fb4fc7faf1d3d0831819969529b888', '/video/a/6/a6fb4fc7faf1d3d0831819969529b888/a6fb4fc7faf1d3d0831819969529b888.mp4', NULL, '2022-10-13 21:30:17', NULL, '1', '', '002003', NULL, NULL);
INSERT INTO `media_files` VALUES ('b2be49a68112c285248211a0976b59c6', 1232141425, NULL, '【哲风壁纸】会说话的眼睛-动漫女孩.mp4', '001002', '课程视频', 'video', 'b/2/b2be49a68112c285248211a0976b59c6/b2be49a68112c285248211a0976b59c6.mp4', 'b2be49a68112c285248211a0976b59c6', '/video/b/2/b2be49a68112c285248211a0976b59c6/b2be49a68112c285248211a0976b59c6.mp4', NULL, '2025-11-05 23:35:16', NULL, '1', '', '002003', NULL, 16473085);
INSERT INTO `media_files` VALUES ('b2deb4a098bb12653c57bbaa0099697a', 1232141425, NULL, 'course3448922126748441722.html', '001003', NULL, 'mediafiles', 'course/117.html', 'b2deb4a098bb12653c57bbaa0099697a', '/mediafiles/course/117.html', NULL, '2022-10-04 19:20:01', NULL, '1', '', '002003', NULL, 37705);
INSERT INTO `media_files` VALUES ('c051fe97e672dd399902a90f4ac67962', 1232141425, NULL, 'widget-3.jpg', '001001', NULL, 'mediafiles', '2022/12/18/c051fe97e672dd399902a90f4ac67962.jpg', 'c051fe97e672dd399902a90f4ac67962', '/mediafiles/2022/12/18/c051fe97e672dd399902a90f4ac67962.jpg', NULL, '2022-12-18 12:02:29', NULL, '1', NULL, '002003', NULL, 62469);
INSERT INTO `media_files` VALUES ('ca1d75b0a37b85fafd5f2e443f6f3f01', 1232141425, NULL, 'course2996275631019924973.html', '001003', NULL, 'mediafiles', 'course/118.html', 'ca1d75b0a37b85fafd5f2e443f6f3f01', '/mediafiles/course/118.html', NULL, '2022-10-07 06:40:51', NULL, '1', '', '002003', NULL, 35905);
INSERT INTO `media_files` VALUES ('cbfad660061f90e1ffe6f145fe26492a', 1232141425, NULL, 'course2823087211515924791.html', '001001', NULL, 'mediafiles', 'course/125.html', 'cbfad660061f90e1ffe6f145fe26492a', '/mediafiles/course/125.html', NULL, '2025-12-02 15:16:20', NULL, '1', NULL, '002003', NULL, 34852);
INSERT INTO `media_files` VALUES ('d057976e1bed90926974d64dddad0dda', 1232141425, NULL, '90526bdf2ec1341db90a900e00c57ab1.mp4', '001002', '课程视频', 'video', 'd/0/d057976e1bed90926974d64dddad0dda/d057976e1bed90926974d64dddad0dda.mp4', 'd057976e1bed90926974d64dddad0dda', '/video/d/0/d057976e1bed90926974d64dddad0dda/d057976e1bed90926974d64dddad0dda.mp4', NULL, '2025-12-15 15:47:37', NULL, '1', '', '002003', NULL, 626615);
INSERT INTO `media_files` VALUES ('d4af959873182feb0fdb91dc6c1958b5', 1232141425, NULL, 'widget-5.png', '001001', '课程图片', 'mediafiles', '2022/09/18/d4af959873182feb0fdb91dc6c1958b5.png', 'd4af959873182feb0fdb91dc6c1958b5', '/mediafiles/2022/09/18/d4af959873182feb0fdb91dc6c1958b5.png', NULL, '2022-09-18 21:49:55', NULL, '1', '', '002003', NULL, 17799);
INSERT INTO `media_files` VALUES ('db4e24f27d78ccac14401b7479b35c26', 1232141425, NULL, 'nonepic.jpg', '001001', NULL, 'mediafiles', '2022/09/23/db4e24f27d78ccac14401b7479b35c26.jpg', 'db4e24f27d78ccac14401b7479b35c26', '/mediafiles/2022/09/23/db4e24f27d78ccac14401b7479b35c26.jpg', NULL, '2022-09-23 18:27:26', NULL, '1', '', '002003', NULL, 6919);
INSERT INTO `media_files` VALUES ('df39983fcad83a6ceef14bfeeb1bc523', 1232141425, NULL, 'add.jpg', '001001', NULL, 'mediafiles', '2022/09/20/df39983fcad83a6ceef14bfeeb1bc523.jpg', 'df39983fcad83a6ceef14bfeeb1bc523', '/mediafiles/2022/09/20/df39983fcad83a6ceef14bfeeb1bc523.jpg', NULL, '2022-09-20 21:13:59', NULL, '1', '', '002003', NULL, 10487);
INSERT INTO `media_files` VALUES ('df7c128cc07926a8db429348ffc7e4b3', 1232141425, NULL, 'default-cover.jpg', '001001', NULL, 'mediafiles', '2025/10/23/df7c128cc07926a8db429348ffc7e4b3.jpg', 'df7c128cc07926a8db429348ffc7e4b3', '/mediafiles/2025/10/23/df7c128cc07926a8db429348ffc7e4b3.jpg', NULL, '2025-10-23 21:51:33', NULL, '1', NULL, '002003', NULL, 46675);
INSERT INTO `media_files` VALUES ('e00ce88f53cc391d9ffd51a81834d2af', 1232141425, NULL, 'widget-1.jpg', '001001', '课程图片', 'mediafiles', '2022/09/18/e00ce88f53cc391d9ffd51a81834d2af.jpg', 'e00ce88f53cc391d9ffd51a81834d2af', '/mediafiles/2022/09/18/e00ce88f53cc391d9ffd51a81834d2af.jpg', NULL, '2022-09-18 21:48:50', NULL, '1', '', '002003', NULL, 71386);
INSERT INTO `media_files` VALUES ('e726b71ba99c70e8c9d2850c2a7019d7', 1232141425, NULL, 'asset-login_img.jpg', '001001', NULL, 'mediafiles', '2022/09/20/e726b71ba99c70e8c9d2850c2a7019d7.jpg', 'e726b71ba99c70e8c9d2850c2a7019d7', '/mediafiles/2022/09/20/e726b71ba99c70e8c9d2850c2a7019d7.jpg', NULL, '2022-09-20 21:44:50', NULL, '1', '', '002003', NULL, 22620);
INSERT INTO `media_files` VALUES ('ef29eb93515e32f2d897956d5d914db7', 1232141425, NULL, 'Snipaste_2023-02-09_11-06-52.png', '001001', NULL, 'mediafiles', '2023/02/09/ef29eb93515e32f2d897956d5d914db7.png', 'ef29eb93515e32f2d897956d5d914db7', '/mediafiles/2023/02/09/ef29eb93515e32f2d897956d5d914db7.png', NULL, '2023-02-09 11:07:02', NULL, '1', NULL, '002003', NULL, 327814);
INSERT INTO `media_files` VALUES ('efd2eacc4485946fc27feb0caef7506c', 1232141425, NULL, '读写分离-理解读写分离.avi', '001002', '课程视频', 'video', 'e/f/efd2eacc4485946fc27feb0caef7506c/efd2eacc4485946fc27feb0caef7506c.avi', 'efd2eacc4485946fc27feb0caef7506c', NULL, NULL, '2022-12-15 09:45:19', NULL, '1', NULL, '002003', NULL, 14879232);
INSERT INTO `media_files` VALUES ('fbb57de7001cccf1e28fbe34c7506ddc', 1232141425, NULL, 'asset-logo.png', '001001', NULL, 'mediafiles', '2022/09/20/fbb57de7001cccf1e28fbe34c7506ddc.png', 'fbb57de7001cccf1e28fbe34c7506ddc', '/mediafiles/2022/09/20/fbb57de7001cccf1e28fbe34c7506ddc.png', NULL, '2022-09-20 21:55:25', NULL, '1', '', '002003', NULL, 4355);
INSERT INTO `media_files` VALUES ('fbbd093c51fd29f01c345d56c7c658da', 1232141425, NULL, 'tools_A8YSmQDK_1761196297655.jpg', '001001', NULL, 'mediafiles', '2025/10/23/fbbd093c51fd29f01c345d56c7c658da.jpg', 'fbbd093c51fd29f01c345d56c7c658da', '/mediafiles/2025/10/23/fbbd093c51fd29f01c345d56c7c658da.jpg', NULL, '2025-10-23 21:47:55', NULL, '1', NULL, '002003', NULL, 190057);
INSERT INTO `media_files` VALUES ('fc7c4846e2442d9812bd1696c64a87ea', 1232141425, NULL, 'pe.png', '001001', NULL, 'mediafiles', '2025/10/23/fc7c4846e2442d9812bd1696c64a87ea.png', 'fc7c4846e2442d9812bd1696c64a87ea', '/mediafiles/2025/10/23/fc7c4846e2442d9812bd1696c64a87ea.png', NULL, '2025-10-23 21:52:23', NULL, '1', NULL, '002003', NULL, 14822);

-- ----------------------------
-- Table structure for media_process
-- ----------------------------
DROP TABLE IF EXISTS `media_process`;
CREATE TABLE `media_process`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件标识',
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件名称',
  `bucket` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '存储桶',
  `file_path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `status` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态,1:未处理，2：处理成功  3处理失败',
  `create_date` datetime NOT NULL COMMENT '上传时间',
  `finish_date` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `fail_count` int NULL DEFAULT 0 COMMENT '失败次数',
  `url` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '媒资文件访问地址',
  `errormsg` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_fileid`(`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_process
-- ----------------------------

-- ----------------------------
-- Table structure for media_process_history
-- ----------------------------
DROP TABLE IF EXISTS `media_process_history`;
CREATE TABLE `media_process_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件标识',
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件名称',
  `bucket` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '存储源',
  `status` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态,1:未处理，2：处理成功  3处理失败',
  `create_date` datetime NOT NULL COMMENT '上传时间',
  `finish_date` datetime NOT NULL COMMENT '完成时间',
  `url` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '媒资文件访问地址',
  `fail_count` int NULL DEFAULT 0 COMMENT '失败次数',
  `file_path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `errormsg` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_process_history
-- ----------------------------
INSERT INTO `media_process_history` VALUES (1, '81d7ed5153316f5774885d3b4c07d8bc', 'Spring Security快速上手-创建工程.avi', 'video', '2', '2022-12-15 09:41:50', '2022-12-15 10:30:26', '/video/8/1/81d7ed5153316f5774885d3b4c07d8bc/81d7ed5153316f5774885d3b4c07d8bc.mp4', 0, '8/1/81d7ed5153316f5774885d3b4c07d8bc/81d7ed5153316f5774885d3b4c07d8bc.avi', NULL);
INSERT INTO `media_process_history` VALUES (2, '18f919e23bedab97a78762c4875addc4', '垂直分库-插入和查询测试.avi', 'video', '2', '2022-12-15 09:45:18', '2022-12-15 10:30:11', '/video/1/8/18f919e23bedab97a78762c4875addc4/18f919e23bedab97a78762c4875addc4.mp4', 0, '1/8/18f919e23bedab97a78762c4875addc4/18f919e23bedab97a78762c4875addc4.avi', NULL);
INSERT INTO `media_process_history` VALUES (3, 'efd2eacc4485946fc27feb0caef7506c', '读写分离-理解读写分离.avi', 'video', '2', '2022-12-15 09:45:19', '2022-12-15 10:31:04', '/video/e/f/efd2eacc4485946fc27feb0caef7506c/efd2eacc4485946fc27feb0caef7506c.mp4', 0, 'e/f/efd2eacc4485946fc27feb0caef7506c/efd2eacc4485946fc27feb0caef7506c.avi', NULL);
INSERT INTO `media_process_history` VALUES (4, '4e95321f9fd9f244b7d48e179125091b', '4K60帧鸡你太美打篮球_爱给网_aigei_com.avi', 'video', '2', '2025-11-07 15:46:13', '2025-11-07 15:53:57', '/video/4/e/4e95321f9fd9f244b7d48e179125091b/4e95321f9fd9f244b7d48e179125091b.mp4', 0, '4/e/4e95321f9fd9f244b7d48e179125091b/4e95321f9fd9f244b7d48e179125091b.avi', '');
INSERT INTO `media_process_history` VALUES (5, '2afbc9a9e9fbe73700ee18ef5663f1ef', '玩滑板的妹子[超清版]_爱给网_aigei_com.avi', 'video', '2', '2025-11-07 15:46:17', '2025-11-07 15:54:02', '/video/2/a/2afbc9a9e9fbe73700ee18ef5663f1ef/2afbc9a9e9fbe73700ee18ef5663f1ef.mp4', 0, '2/a/2afbc9a9e9fbe73700ee18ef5663f1ef/2afbc9a9e9fbe73700ee18ef5663f1ef.avi', '');
INSERT INTO `media_process_history` VALUES (6, '2-2afbc9a9e9fbe73700ee18ef5663f1ef', '哈哈.avi', 'video', '2', '2025-12-15 21:18:51', '2025-12-15 21:19:13', '/video/2/-/2-2afbc9a9e9fbe73700ee18ef5663f1ef/2-2afbc9a9e9fbe73700ee18ef5663f1ef.mp4', 0, '2/a/2afbc9a9e9fbe73700ee18ef5663f1ef/2afbc9a9e9fbe73700ee18ef5663f1ef.avi', NULL);
INSERT INTO `media_process_history` VALUES (7, '2-4e95321f9fd9f244b7d48e179125091b', '4K60帧鸡你太美打篮球_爱给网_aigei_com.avi', 'video', '2', '2025-12-15 21:19:02', '2025-12-15 21:19:25', '/video/2/-/2-4e95321f9fd9f244b7d48e179125091b/2-4e95321f9fd9f244b7d48e179125091b.mp4', 0, '4/e/4e95321f9fd9f244b7d48e179125091b/4e95321f9fd9f244b7d48e179125091b.avi', NULL);

-- ----------------------------
-- Table structure for mq_message
-- ----------------------------
DROP TABLE IF EXISTS `mq_message`;
CREATE TABLE `mq_message`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `mq_host` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息队列主机',
  `mq_port` int NOT NULL COMMENT '消息队列端口',
  `mq_virtualhost` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息队列虚拟主机',
  `mq_queue` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '队列名称',
  `inform_num` int UNSIGNED NOT NULL COMMENT '通知次数',
  `state` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '处理状态，0:初始，1:成功',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `inform_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '阶段1处理状态, 0:初始，1:成功',
  `stage_state2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '阶段2处理状态, 0:初始，1:成功',
  `stage_state3` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '阶段3处理状态, 0:初始，1:成功',
  `stage_state4` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '阶段4处理状态, 0:初始，1:成功',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message
-- ----------------------------
INSERT INTO `mq_message` VALUES ('f29a3149-7429-40be-8a4e-9909f32003b0', 'xc.mq.msgsync.coursepub', '111', NULL, NULL, '127.0.0.1', 5607, '/', 'xc.course.publish.queue', 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mq_message_history
-- ----------------------------
DROP TABLE IF EXISTS `mq_message_history`;
CREATE TABLE `mq_message_history`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `mq_host` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息队列主机',
  `mq_port` int NOT NULL COMMENT '消息队列端口',
  `mq_virtualhost` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息队列虚拟主机',
  `mq_queue` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '队列名称',
  `inform_num` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '通知次数',
  `state` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '处理状态，0:初始，1:成功，2:失败',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `inform_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state3` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state4` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message_history
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
