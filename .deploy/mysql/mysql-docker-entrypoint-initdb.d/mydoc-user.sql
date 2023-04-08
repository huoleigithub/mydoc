SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Database
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `mydoc-user`;
USE `mydoc-user`;

-- ----------------------------
-- Table structure for token
-- ----------------------------
CREATE TABLE IF NOT EXISTS `token`  (
  `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` bigint(20) UNSIGNED NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) UNSIGNED NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) UNSIGNED NOT NULL COMMENT '删除时间戳',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '随机uuid',
  `expire_time` int(64) NULL DEFAULT NULL COMMENT '过期时间戳',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE IF NOT EXISTS `user`  (
  `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` bigint(20) UNSIGNED NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) UNSIGNED NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) UNSIGNED NOT NULL COMMENT '删除时间戳',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` tinyint(2) UNSIGNED NOT NULL COMMENT '角色 0:普通用户 1:超级管理员',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
