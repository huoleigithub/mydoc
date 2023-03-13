SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Database
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `mydoc-document`;
USE `mydoc-document`;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
CREATE TABLE IF NOT EXISTS `comment`  (
  `comment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` bigint(20) UNSIGNED NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) UNSIGNED NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) UNSIGNED NOT NULL COMMENT '删除时间戳',
  `doc_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '文档id',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `commentor_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '评论者id',
  `commentor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论者用户名',
  `reply_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '回复某个评论的id',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for document
-- ----------------------------
CREATE TABLE IF NOT EXISTS `document`  (
  `doc_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) NOT NULL COMMENT '删除时间戳',
  `doc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `doc_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文件内容',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `type` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '文档类型',
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '所属父级id，可以是项目，目录',
  PRIMARY KEY (`doc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for folder
-- ----------------------------
CREATE TABLE IF NOT EXISTS `folder`  (
  `folder_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件夹主键',
  `create_time` bigint(20) UNSIGNED NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) UNSIGNED NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) UNSIGNED NOT NULL COMMENT '删除时间戳',
  `folder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件夹名称',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态 0:公开 1:私有',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父文件夹id，顶层为0',
  `subfolder_ids` blob NULL COMMENT '子文件夹id',
  PRIMARY KEY (`folder_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_user
-- ----------------------------
CREATE TABLE IF NOT EXISTS `group_user`  (
  `group_user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` bigint(20) UNSIGNED NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) UNSIGNED NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) UNSIGNED NOT NULL COMMENT '删除时间戳',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `target_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '目标id，可以是文档、项目、文件夹',
  `access_permission` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '用户对文档的读写和执行权限，用二进制位表示',
  `target_type` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '目标类型，可以是文档、项目、文件夹',
  `role_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`group_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project
-- ----------------------------
CREATE TABLE IF NOT EXISTS `project`  (
  `project_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` bigint(20) UNSIGNED NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) UNSIGNED NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) UNSIGNED NOT NULL COMMENT '删除时间戳',
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目名称',
  `status` tinyint(2) NOT NULL COMMENT '状态 0:公开 1:私有',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `identification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图片地址',
  `doc_number` int(11) NULL DEFAULT NULL COMMENT '包含文档数量',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE IF NOT EXISTS `role`  (
  `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色主键',
  `create_time` bigint(20) UNSIGNED NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) UNSIGNED NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) UNSIGNED NOT NULL COMMENT '删除时间戳',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `type` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for update_record
-- ----------------------------
CREATE TABLE IF NOT EXISTS `update_record`  (
  `update_record_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '更新记录主键',
  `create_time` bigint(20) UNSIGNED NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) UNSIGNED NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) UNSIGNED NOT NULL COMMENT '删除时间戳',
  `doc_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '文档id',
  `mender_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  `mender_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者用户名',
  `status` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`update_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
