SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Database
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `mydoc-api`;
USE `mydoc-api`;

-- ----------------------------
-- Table structure for api
-- ----------------------------
CREATE TABLE IF NOT EXISTS `api`  (
  `api_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'api主键',
  `create_time` bigint(20) UNSIGNED NOT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) UNSIGNED NOT NULL COMMENT '更新时间戳',
  `delete_time` bigint(20) UNSIGNED NOT NULL COMMENT '删除时间戳',
  `api_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api名称',
  `request_method` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '调用方法',
  `request_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `request_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求体',
  `request_header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求头',
  `response_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '响应体',
  `response_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '响应状态码',
  `creator_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `creator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者用户名',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级id，可以是项目，目录',
  PRIMARY KEY (`api_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
