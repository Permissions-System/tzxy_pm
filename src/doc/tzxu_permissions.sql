/*
Navicat MySQL Data Transfer

Source Server         : mysql_local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tzxu_permissions

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-10-09 11:22:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pm_sys_area
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_area`;
CREATE TABLE `pm_sys_area` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(32) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of pm_sys_area
-- ----------------------------
INSERT INTO `pm_sys_area` VALUES ('1', '0', '0,', '中国', '10', '086', '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', '', '0');
INSERT INTO `pm_sys_area` VALUES ('2', '1', '0,1,', '湖南省', '20', '430000', '2', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', '', '0');
INSERT INTO `pm_sys_area` VALUES ('3', '2', '0,1,2,', '长沙市', '30', '430100', '3', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', '', '0');
INSERT INTO `pm_sys_area` VALUES ('4', '3', '0,1,2,3,', '芙蓉区', '40', '430102', '4', '1', '2015-07-10 08:00:00', '1', '2016-06-23 13:57:45', '', '0');

-- ----------------------------
-- Table structure for pm_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_dict`;
CREATE TABLE `pm_sys_dict` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of pm_sys_dict
-- ----------------------------
INSERT INTO `pm_sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('67', '1', '操作日志', 'sys_log_type', '日志类型', '30', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');

-- ----------------------------
-- Table structure for pm_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_log`;
CREATE TABLE `pm_sys_log` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`(191)),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of pm_sys_log
-- ----------------------------
INSERT INTO `pm_sys_log` VALUES ('1', '1', '系统登陆', '1', '2016-05-09 11:47:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('2', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:49:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('3', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:49:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('4', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:49:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=15&office.id=&pageNum=1&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('5', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:49:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('6', '1', '系统登陆', '1', '2016-05-09 11:49:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/tag/treeSelect', 'POST', '&___t0.10600429060490368=&selectIds=2&checked=&extId=&url=/sys/office/treeData?type=2', '');
INSERT INTO `pm_sys_log` VALUES ('7', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:50:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('8', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:50:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('9', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:50:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('10', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:50:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('11', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:50:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('12', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:50:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('13', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:50:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('14', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:50:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('15', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-05-09 11:51:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=&loginName=test1', '');
INSERT INTO `pm_sys_log` VALUES ('16', '1', '系统登陆', '1', '2016-05-09 11:51:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/save', 'POST', '&phone=&no=1&oldLoginName=&newPassword=test1&roleIdList=4&remarks=&loginFlag=1&office.id=3&company.name=湖南省总公司&id=&confirmNewPassword=test1&_roleIdList=on&email=&office.name=综合部&name=test1&company.id=1&loginName=test1&mobile=', '');
INSERT INTO `pm_sys_log` VALUES ('17', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-05-09 11:51:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/save', 'POST', '&phone=&no=1&oldLoginName=&newPassword=test1&roleIdList=4&remarks=&loginFlag=1&office.id=3&company.name=湖南省总公司&id=&confirmNewPassword=test1&_roleIdList=on&email=&office.name=综合部&name=test1&company.id=1&loginName=test1&mobile=', '');
INSERT INTO `pm_sys_log` VALUES ('18', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:51:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('19', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:51:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('20', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:52:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('21', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-05-09 11:52:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test1&loginName=test1', '');
INSERT INTO `pm_sys_log` VALUES ('22', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-05-09 11:52:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/save', 'POST', '&phone=&no=1&oldLoginName=test1&newPassword=&roleIdList=4&remarks=&loginFlag=1&office.id=3&company.name=湖南省总公司&id=14&confirmNewPassword=&_roleIdList=on&email=&office.name=综合部&name=综合部-test1&company.id=1&loginName=test1&mobile=', '');
INSERT INTO `pm_sys_log` VALUES ('23', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:52:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('24', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:53:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('25', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:53:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=84', '');
INSERT INTO `pm_sys_log` VALUES ('26', '1', '系统登陆', '1', '2016-05-09 11:53:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=84', '');
INSERT INTO `pm_sys_log` VALUES ('27', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:53:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=84', '');
INSERT INTO `pm_sys_log` VALUES ('28', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-05-09 11:53:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=84&oldParentId=67&icon=&sort=20&parent.id=67&name=连接池监视&target=&permission=&remarks=&href=/druid&parent.name=日志查询&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('29', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:53:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('30', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:54:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('31', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:54:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=84', '');
INSERT INTO `pm_sys_log` VALUES ('32', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-05-09 11:54:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=84&oldParentId=67&icon=&sort=20&parent.id=67&name=连接池监视&target=&permission=&remarks=&href=/sys/druid&parent.name=日志查询&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('33', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:54:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('34', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:54:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('35', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:54:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('36', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:54:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('37', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:54:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=84', '');
INSERT INTO `pm_sys_log` VALUES ('38', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-05-09 11:54:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=84&oldParentId=67&icon=&sort=20&parent.id=67&name=连接池监视&target=&permission=&remarks=&href=/druid&parent.name=日志查询&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('39', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:54:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('40', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:54:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('41', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:54:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('42', '1', '系统登陆', '1', '2016-05-09 11:55:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/log', 'POST', '&requestUri=&title=&pageSize=15&createBy.id=&endDate=2016-05-10&beginDate=2016-05-09&pageNum=1', '');
INSERT INTO `pm_sys_log` VALUES ('43', '1', '系统登陆', '1', '2016-05-09 11:58:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('44', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 11:58:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('45', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-05-09 11:58:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('46', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 11:58:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('47', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 11:58:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('48', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:59:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('49', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 11:59:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=21', '');
INSERT INTO `pm_sys_log` VALUES ('50', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 11:59:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('51', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 11:59:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('52', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 11:59:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('53', '1', '系统登陆', '1', '2016-05-09 12:54:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('54', '1', '系统登陆', '1', '2016-05-09 13:02:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('55', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 13:02:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('56', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 13:02:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('57', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 13:03:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('58', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 13:03:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=84', '');
INSERT INTO `pm_sys_log` VALUES ('59', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-05-09 13:04:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&oldParentId=67&icon= icon-eye-open&sort=20&permission=&remarks=&id=84&parent.id=67&name=连接池监视&target=&href=/druid&parent.name=日志查询&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('60', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 13:04:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('61', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 13:04:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('62', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 13:04:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('63', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 13:04:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('64', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 13:04:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('65', '1', '系统登陆', '1', '2016-05-09 13:04:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/info', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('66', '1', '系统登陆', '1', '2016-05-09 13:49:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('67', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 13:49:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('68', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 13:49:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('69', '1', '系统登陆', '1', '2016-05-09 13:52:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('70', '1', '系统登陆', '1', '2016-05-09 15:09:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('71', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:09:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('72', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:09:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('73', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('74', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('75', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('76', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('77', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=湖南省总公司&office.id=1', '');
INSERT INTO `pm_sys_log` VALUES ('78', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.id=2&office.name=公司领导', '');
INSERT INTO `pm_sys_log` VALUES ('79', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('80', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=市场部&office.id=4', '');
INSERT INTO `pm_sys_log` VALUES ('81', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=技术部&office.id=5', '');
INSERT INTO `pm_sys_log` VALUES ('82', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.id=6&office.name=研发部', '');
INSERT INTO `pm_sys_log` VALUES ('83', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=长沙市分公司&office.id=7', '');
INSERT INTO `pm_sys_log` VALUES ('84', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=8', '');
INSERT INTO `pm_sys_log` VALUES ('85', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=9', '');
INSERT INTO `pm_sys_log` VALUES ('86', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=市场部&office.id=10', '');
INSERT INTO `pm_sys_log` VALUES ('87', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=技术部&office.id=11', '');
INSERT INTO `pm_sys_log` VALUES ('88', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.id=12&office.name=芙蓉区分公司', '');
INSERT INTO `pm_sys_log` VALUES ('89', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=13', '');
INSERT INTO `pm_sys_log` VALUES ('90', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=14', '');
INSERT INTO `pm_sys_log` VALUES ('91', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:10:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.id=15&office.name=市场部', '');
INSERT INTO `pm_sys_log` VALUES ('92', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:10:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('93', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:10:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('94', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:10:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('95', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:10:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('96', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 15:11:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('97', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:11:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('98', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-05-09 15:11:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('99', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-05-09 15:11:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/userToRole', 'POST', '&id=1&___t0.677937338360467=', '');
INSERT INTO `pm_sys_log` VALUES ('100', '1', '系统登陆', '1', '2016-05-09 15:11:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/queryOfficeUsers', 'GET', '&officeId=2', '');
INSERT INTO `pm_sys_log` VALUES ('101', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-05-09 15:11:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/assignUser', 'POST', '&idsArr=1,14&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('102', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-05-09 15:11:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('103', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-05-09 15:12:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/outUserFromRole', 'GET', '&id=1&userId=14', '');
INSERT INTO `pm_sys_log` VALUES ('104', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-05-09 15:12:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('105', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:12:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('106', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:12:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('107', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-05-09 15:12:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('108', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 15:12:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('109', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:12:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('110', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:12:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('111', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:12:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('112', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:12:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('113', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:12:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('114', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:12:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=7', '');
INSERT INTO `pm_sys_log` VALUES ('115', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:13:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=6', '');
INSERT INTO `pm_sys_log` VALUES ('116', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:13:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=5', '');
INSERT INTO `pm_sys_log` VALUES ('117', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:13:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('118', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:13:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('119', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:13:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('120', '1', '系统登陆', '1', '2016-05-09 15:13:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('121', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-05-09 15:13:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('122', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-05-09 15:13:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&pageSize=15&type=sys_area_type&pageNum=1&description=', '');
INSERT INTO `pm_sys_log` VALUES ('123', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-05-09 15:13:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=&pageNum=1', '');
INSERT INTO `pm_sys_log` VALUES ('124', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-05-09 15:14:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '&id=96', '');
INSERT INTO `pm_sys_log` VALUES ('125', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:15:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('126', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:15:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('127', '1', '系统登陆', '1', '2016-05-09 15:15:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('128', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-05-09 15:15:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('129', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-05-09 15:15:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('130', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:16:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('131', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:16:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('132', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:16:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('133', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:16:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('134', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:17:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('135', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 15:17:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('136', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 15:17:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=21', '');
INSERT INTO `pm_sys_log` VALUES ('137', '1', '系统登陆', '1', '2016-05-09 15:17:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/log', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('138', '1', '系统登陆', '1', '2016-05-09 15:23:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('139', '1', '系统登陆', '1', '2016-05-09 15:30:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('140', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:30:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('141', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:30:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('142', '1', '系统登陆', '1', '2016-05-09 15:37:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('143', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:38:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('144', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:38:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('145', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:38:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.id=12&office.name=芙蓉区分公司', '');
INSERT INTO `pm_sys_log` VALUES ('146', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:38:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=长沙市分公司&office.id=7', '');
INSERT INTO `pm_sys_log` VALUES ('147', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:38:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=湖南省总公司&office.id=1', '');
INSERT INTO `pm_sys_log` VALUES ('148', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:38:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('149', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:38:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('150', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:38:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('151', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:38:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('152', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:38:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('153', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:39:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('154', '1', '系统登陆', '14', '2016-05-09 15:39:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('155', '1', '系统登陆', '1', '2016-05-09 15:40:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('156', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:40:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('157', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:40:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('158', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:40:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('159', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:40:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('160', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:40:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('161', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:40:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('162', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:40:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=湖南省总公司&office.id=1', '');
INSERT INTO `pm_sys_log` VALUES ('163', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:40:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('164', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:40:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('165', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:40:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('166', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:40:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('167', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:40:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('168', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:42:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('169', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:42:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('170', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:42:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('171', '1', '系统登陆', '1', '2016-05-09 15:42:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('172', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:42:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('173', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:42:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('174', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:42:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('175', '1', '系统登陆', '1', '2016-05-09 15:45:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('176', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:45:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('177', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:45:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('178', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 15:45:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('179', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:45:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('180', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:45:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('181', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:45:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('182', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:45:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('183', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:46:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('184', '1', '系统登陆', '1', '2016-05-09 15:48:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('185', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:48:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('186', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:48:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('187', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:48:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('188', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:48:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('189', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:48:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('190', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:48:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('191', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:49:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('192', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:49:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('193', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:49:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('194', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:49:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('195', '1', '系统登陆', '1', '2016-05-09 15:53:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('196', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:53:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('197', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:53:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('198', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:53:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('199', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 15:53:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('200', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:53:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('201', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:53:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('202', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:53:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('203', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:53:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('204', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:54:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('205', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:54:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('206', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:54:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('207', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:54:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('208', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:54:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('209', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:54:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('210', '1', '系统登陆', '1', '2016-05-09 15:57:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('211', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:57:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('212', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 15:57:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('213', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:57:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('214', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 15:57:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('215', '1', '系统登陆', '1', '2016-05-09 16:06:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('216', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:06:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('217', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:06:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('218', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 16:06:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('219', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 16:06:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('220', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:06:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('221', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:06:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('222', '1', '系统登陆', '1', '2016-05-09 16:08:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/tag/treeSelect', 'POST', '&selectIds=1&___t0.13297283053421205=&checked=&extId=&url=/sys/office/treeData', '');
INSERT INTO `pm_sys_log` VALUES ('223', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:09:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('224', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:09:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('225', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:10:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('226', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:10:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('227', '1', '系统登陆', '1', '2016-05-09 16:10:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('228', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:10:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('229', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:10:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('230', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:10:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('231', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:10:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('232', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:11:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('233', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:11:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('234', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 16:11:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('235', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 16:11:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('236', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:11:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('237', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:11:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('238', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:12:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('239', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:12:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('240', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-05-09 16:12:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/save', 'POST', '&id=4&menuIds=1,27,28,29,30&dataScope=4&useable=1&office.name=湖南省总公司&name=部门管理员&officeIds=&remarks=&office.id=1&isSys=0&oldName=部门管理员', '');
INSERT INTO `pm_sys_log` VALUES ('241', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:12:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('242', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:12:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('243', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:12:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('244', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:12:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('245', '1', '系统登陆', '1', '2016-05-09 16:12:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test1&loginName=test1', '');
INSERT INTO `pm_sys_log` VALUES ('246', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-05-09 16:12:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test1&loginName=test1', '');
INSERT INTO `pm_sys_log` VALUES ('247', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-05-09 16:12:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/save', 'POST', '&phone=&no=1&oldLoginName=test1&newPassword=&roleIdList=4&remarks=&loginFlag=1&office.id=3&company.name=湖南省总公司&id=14&confirmNewPassword=&_roleIdList=on&email=&office.name=综合部&name=综合部-test1&company.id=1&loginName=test1&mobile=', '');
INSERT INTO `pm_sys_log` VALUES ('248', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:12:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('249', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:12:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('250', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 16:13:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('251', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 16:13:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('252', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:13:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('253', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:13:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('254', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:13:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('255', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:13:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('256', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:14:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('257', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:14:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('258', '1', '系统登陆', '1', '2016-05-09 16:15:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('259', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:15:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('260', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:16:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('261', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:16:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('262', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:16:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('263', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 16:17:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('264', '1', '系统登陆', '1', '2016-05-09 16:18:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=30', '');
INSERT INTO `pm_sys_log` VALUES ('265', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 16:18:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=30', '');
INSERT INTO `pm_sys_log` VALUES ('266', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 16:18:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=30', '');
INSERT INTO `pm_sys_log` VALUES ('267', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-05-09 16:19:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('268', '1', '系统登陆', '1', '2016-05-09 16:23:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('269', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:23:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('270', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 16:23:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('271', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 16:23:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('272', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-05-09 16:23:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('273', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 16:23:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('274', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 16:23:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('275', '1', '系统登陆', '1', '2016-05-09 16:35:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('276', '1', '系统登陆', '1', '2016-05-09 17:02:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('277', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:02:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('278', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:02:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('279', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 17:02:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('280', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 17:02:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('281', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:03:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('282', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:03:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('283', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:03:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('284', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:04:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('285', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:04:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('286', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:04:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.id=2&office.name=公司领导', '');
INSERT INTO `pm_sys_log` VALUES ('287', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:04:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('288', '1', '系统登陆', '1', '2016-05-09 17:04:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('289', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:04:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('290', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:04:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('291', '1', '系统登陆', '1', '2016-05-09 17:09:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('292', '1', '系统登陆', '1', '2016-05-09 17:11:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('293', '1', '系统登陆', '1', '2016-05-09 17:11:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('294', '1', '系统登陆', '1', '2016-05-09 17:18:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('295', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:18:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('296', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:18:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('297', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:18:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('298', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:18:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('299', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 17:18:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('300', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-05-09 17:18:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('301', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:18:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('302', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:18:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('303', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-05-09 17:18:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('304', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:18:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('305', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:18:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('306', '1', '系统登陆', '1', '2016-05-09 17:36:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('307', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:36:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('308', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:36:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('309', '1', '系统登陆', '1', '2016-05-09 17:38:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('310', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:38:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('311', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:38:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('312', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:38:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('313', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:38:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('314', '1', '系统登陆', '1', '2016-05-09 17:57:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('315', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:57:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('316', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 17:57:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('317', '1', '系统登陆', '1', '2016-05-09 18:01:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('318', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 18:01:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('319', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-05-09 18:01:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('320', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-05-09 18:01:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('321', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 18:01:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('322', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 18:01:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=84', '');
INSERT INTO `pm_sys_log` VALUES ('323', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-05-09 18:02:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=84', '');
INSERT INTO `pm_sys_log` VALUES ('324', '1', '系统登陆', '1', '2016-06-06 14:50:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('325', '1', '系统登陆', '1', '2016-06-06 14:53:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/changePwd', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('326', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 14:53:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('327', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 14:53:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('328', '1', '系统登陆', '1', '2016-06-06 14:55:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('329', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 14:55:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('330', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 14:55:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('331', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 14:55:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=15&office.id=&pageNum=1&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('332', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 14:55:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('333', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 14:55:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('334', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 14:55:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('335', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 14:55:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('336', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 14:55:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('337', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 14:55:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('338', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-06 14:55:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('339', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-06 14:55:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('340', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-06 14:56:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('341', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 14:56:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('342', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 14:56:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=21', '');
INSERT INTO `pm_sys_log` VALUES ('343', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 14:57:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('344', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 14:57:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('345', '1', '系统登陆', '1', '2016-06-06 14:58:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('346', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 14:58:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('347', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 14:58:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('348', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-06 14:58:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('349', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 14:58:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('350', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 14:58:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('351', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 14:58:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('352', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 14:58:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=6', '');
INSERT INTO `pm_sys_log` VALUES ('353', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 14:58:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('354', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-06 14:58:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=6', '');
INSERT INTO `pm_sys_log` VALUES ('355', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-06 14:59:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/userToRole', 'POST', '&id=6&___t0.8592092570441072=', '');
INSERT INTO `pm_sys_log` VALUES ('356', '1', '系统登陆', '1', '2016-06-06 15:00:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('357', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:00:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('358', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:00:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('359', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:00:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=长沙市分公司&office.id=7', '');
INSERT INTO `pm_sys_log` VALUES ('360', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:00:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=芙蓉区分公司&office.id=12', '');
INSERT INTO `pm_sys_log` VALUES ('361', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:00:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=湖南省总公司&office.id=1', '');
INSERT INTO `pm_sys_log` VALUES ('362', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:00:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=湖南省总公司&office.id=1', '');
INSERT INTO `pm_sys_log` VALUES ('363', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:00:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('364', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:00:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=湖南省总公司&office.id=1', '');
INSERT INTO `pm_sys_log` VALUES ('365', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:00:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('366', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:01:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('367', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:01:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('368', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:01:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=湖南省总公司&office.id=1', '');
INSERT INTO `pm_sys_log` VALUES ('369', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:01:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('370', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:01:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('371', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:01:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('372', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:01:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('373', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:01:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('374', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:01:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=8', '');
INSERT INTO `pm_sys_log` VALUES ('375', '1', '系统登陆', '1', '2016-06-06 15:02:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('376', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:02:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('377', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:03:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=3', '');
INSERT INTO `pm_sys_log` VALUES ('378', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:04:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=9', '');
INSERT INTO `pm_sys_log` VALUES ('379', '1', '系统登陆', '1', '2016-06-06 15:40:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('380', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:40:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('381', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:40:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('382', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:40:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=湖南省总公司&office.id=1', '');
INSERT INTO `pm_sys_log` VALUES ('383', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:40:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('384', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:40:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('385', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:40:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('386', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:40:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('387', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:40:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('388', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:41:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=8', '');
INSERT INTO `pm_sys_log` VALUES ('389', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:41:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=市场部&office.id=10', '');
INSERT INTO `pm_sys_log` VALUES ('390', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:41:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=市场部&office.id=4', '');
INSERT INTO `pm_sys_log` VALUES ('391', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:41:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('392', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:41:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('393', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:41:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('394', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:41:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('395', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:41:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('396', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:42:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('397', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:42:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('398', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:42:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('399', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:42:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('400', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 15:42:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('401', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:42:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('402', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:42:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('403', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:42:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('404', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:42:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('405', '1', '系统登陆', '1', '2016-06-06 15:42:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('406', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:42:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('407', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:42:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('408', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:43:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('409', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:43:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('410', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:43:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('411', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:43:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('412', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:43:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('413', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:43:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=21', '');
INSERT INTO `pm_sys_log` VALUES ('414', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 15:44:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('415', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 15:44:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('416', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:44:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('417', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:44:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('418', '1', '系统登陆', '1', '2016-06-06 15:44:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('419', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:44:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('420', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 15:44:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('421', '1', '系统登陆', '1', '2016-06-06 15:47:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('422', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:47:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('423', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:47:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('424', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:47:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('425', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:47:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('426', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 15:47:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('427', '1', '系统登陆', '1', '2016-06-06 16:03:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('428', '1', '系统登陆', '1', '2016-06-06 16:05:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('429', '1', '系统登陆', '1', '2016-06-06 16:08:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('430', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:08:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('431', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:08:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('432', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 16:08:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('433', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:08:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('434', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:08:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('435', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:08:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('436', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:08:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('437', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:08:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('438', '1', '系统登陆', '14', '2016-06-06 16:11:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('439', '1', '系统登陆', '1', '2016-06-06 16:15:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('440', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:15:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('441', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:15:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('442', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:15:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('443', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:15:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('444', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:15:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=15&office.id=&pageNum=2&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('445', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:15:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=15&office.id=&pageNum=1&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('446', '1', '系统登陆', '1', '2016-06-06 16:18:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('447', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:18:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('448', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:18:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('449', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:18:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=2&office.id=&pageNum=8&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('450', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:18:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=2&office.id=&pageNum=11&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('451', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:18:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=2&office.id=&pageNum=5&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('452', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:18:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=2&office.id=&pageNum=7&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('453', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:18:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=2&office.id=&pageNum=10&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('454', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:18:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=2&office.id=&pageNum=12&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('455', '1', '系统登陆', '1', '2016-06-06 16:19:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('456', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:19:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('457', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:19:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('458', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:19:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('459', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:19:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('460', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:20:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('461', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:20:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('462', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:20:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=15', '');
INSERT INTO `pm_sys_log` VALUES ('463', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:20:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=15', '');
INSERT INTO `pm_sys_log` VALUES ('464', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:20:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test1&loginName=test1', '');
INSERT INTO `pm_sys_log` VALUES ('465', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:20:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=15', '');
INSERT INTO `pm_sys_log` VALUES ('466', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:20:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test1&loginName=test001', '');
INSERT INTO `pm_sys_log` VALUES ('467', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:21:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/save', 'POST', '&phone=&no=1&oldLoginName=test1&newPassword=test001&roleIdList=5&remarks=&loginFlag=1&office.id=3&company.name=湖南省总公司&id=15&confirmNewPassword=test001&_roleIdList=on&email=&office.name=综合部&name=综合部-test1&company.id=1&loginName=test001&mobile=', '');
INSERT INTO `pm_sys_log` VALUES ('468', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:21:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('469', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:21:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=15', '');
INSERT INTO `pm_sys_log` VALUES ('470', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:21:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=15&office.id=&pageNum=2&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('471', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:21:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=15&office.id=&pageNum=1&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('472', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:21:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=综合部&office.id=3', '');
INSERT INTO `pm_sys_log` VALUES ('473', '1', '系统登陆', '1', '2016-06-06 16:22:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/delete', 'GET', '&id=15', '');
INSERT INTO `pm_sys_log` VALUES ('474', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:22:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/delete', 'GET', '&id=15', '');
INSERT INTO `pm_sys_log` VALUES ('475', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:22:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('476', '1', '系统登陆', '1', '2016-06-06 16:24:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('477', '1', '系统登陆', '1', '2016-06-06 16:29:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('478', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:29:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('479', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:29:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('480', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:29:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('481', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:29:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('482', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:30:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('483', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:30:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=3', '');
INSERT INTO `pm_sys_log` VALUES ('484', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:30:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('485', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-06 16:30:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('486', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:30:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('487', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:30:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('488', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-06 16:30:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('489', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:30:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('490', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:30:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('491', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-06 16:31:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('492', '1', '系统登陆', '1', '2016-06-06 16:31:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/info', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('493', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:31:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('494', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:31:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('495', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:31:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('496', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 16:31:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('497', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 16:31:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('498', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 16:32:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('499', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 16:32:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=3', '');
INSERT INTO `pm_sys_log` VALUES ('500', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 16:32:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('501', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 16:32:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('502', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('503', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('504', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('505', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '&id=96', '');
INSERT INTO `pm_sys_log` VALUES ('506', '1', '系统登陆', '1', '2016-06-06 16:33:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '&id=34', '');
INSERT INTO `pm_sys_log` VALUES ('507', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '&id=34', '');
INSERT INTO `pm_sys_log` VALUES ('508', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=&pageNum=2', '');
INSERT INTO `pm_sys_log` VALUES ('509', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=&pageNum=3', '');
INSERT INTO `pm_sys_log` VALUES ('510', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=&pageNum=2', '');
INSERT INTO `pm_sys_log` VALUES ('511', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('512', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:33:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('513', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=&pageNum=2', '');
INSERT INTO `pm_sys_log` VALUES ('514', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=&pageNum=3', '');
INSERT INTO `pm_sys_log` VALUES ('515', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=yes_no&pageNum=1', '');
INSERT INTO `pm_sys_log` VALUES ('516', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=yes_no&pageNum=1', '');
INSERT INTO `pm_sys_log` VALUES ('517', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=yes_no&pageNum=1', '');
INSERT INTO `pm_sys_log` VALUES ('518', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=yes_no&pageNum=1', '');
INSERT INTO `pm_sys_log` VALUES ('519', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=yes_no&pageNum=1', '');
INSERT INTO `pm_sys_log` VALUES ('520', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('521', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/list', 'POST', '&description=&pageSize=15&type=sys_area_type&pageNum=1', '');
INSERT INTO `pm_sys_log` VALUES ('522', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 16:34:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('523', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:36:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('524', '1', '系统登陆', '1', '2016-06-06 16:36:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('525', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:36:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('526', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:36:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=1&name=&pageSize=15&office.id=&pageNum=1&company.name=湖南省总公司&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('527', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:36:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=1&name=&pageSize=15&office.id=&pageNum=1&company.name=湖南省总公司&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('528', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:36:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=综合部&company.id=1&name=&pageSize=15&office.id=3&pageNum=1&company.name=湖南省总公司&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('529', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:36:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('530', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:36:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test1&loginName=test1', '');
INSERT INTO `pm_sys_log` VALUES ('531', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:36:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/save', 'POST', '&phone=&no=1&oldLoginName=test1&newPassword=&roleIdList=4&remarks=&loginFlag=0&office.id=3&company.name=湖南省总公司&id=14&confirmNewPassword=&_roleIdList=on&email=&office.name=综合部&name=综合部-test1&company.id=1&loginName=test1&mobile=', '');
INSERT INTO `pm_sys_log` VALUES ('532', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:36:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('533', '1', '系统登陆', '1', '2016-06-06 16:37:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('534', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('535', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('536', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('537', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:37:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test1&loginName=test1', '');
INSERT INTO `pm_sys_log` VALUES ('538', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:37:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/save', 'POST', '&phone=&no=1&oldLoginName=test1&newPassword=&roleIdList=4&remarks=&loginFlag=1&office.id=3&company.name=湖南省总公司&id=14&confirmNewPassword=&_roleIdList=on&email=&office.name=综合部&company.id=1&name=综合部-test1&loginName=test1&mobile=', '');
INSERT INTO `pm_sys_log` VALUES ('539', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('540', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('541', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=15&office.id=&pageNum=2&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('542', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'POST', '&orderBy=&office.name=&company.id=&name=&pageSize=15&office.id=&pageNum=1&company.name=&loginName=', '');
INSERT INTO `pm_sys_log` VALUES ('543', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=14', '');
INSERT INTO `pm_sys_log` VALUES ('544', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:37:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test1&loginName=test1', '');
INSERT INTO `pm_sys_log` VALUES ('545', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:37:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/save', 'POST', '&phone=&no=1&oldLoginName=test1&newPassword=&roleIdList=4&remarks=&loginFlag=1&office.id=3&company.name=长沙市分公司&id=14&confirmNewPassword=&_roleIdList=on&email=&office.name=综合部&name=综合部-test1&company.id=7&loginName=test1&mobile=', '');
INSERT INTO `pm_sys_log` VALUES ('546', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('547', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:37:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=16', '');
INSERT INTO `pm_sys_log` VALUES ('548', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:38:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test2&loginName=test2', '');
INSERT INTO `pm_sys_log` VALUES ('549', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:38:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=16', '');
INSERT INTO `pm_sys_log` VALUES ('550', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:38:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/checkLoginName', 'GET', '&oldLoginName=test2&loginName=test2', '');
INSERT INTO `pm_sys_log` VALUES ('551', '1', '系统设置->机构用户->用户管理->修改', '1', '2016-06-06 16:38:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/save', 'POST', '&phone=&no=1&oldLoginName=test2&newPassword=&roleIdList=5&remarks=&loginFlag=1&office.id=3&company.name=芙蓉区分公司&id=16&confirmNewPassword=&_roleIdList=on&email=&office.name=综合部&name=综合部-test1&company.id=12&loginName=test2&mobile=', '');
INSERT INTO `pm_sys_log` VALUES ('552', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:38:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('553', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:38:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('554', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:38:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('555', '1', '系统登陆', '1', '2016-06-06 16:39:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=12', '');
INSERT INTO `pm_sys_log` VALUES ('556', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:39:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=12', '');
INSERT INTO `pm_sys_log` VALUES ('557', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-06 16:39:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('558', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:39:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('559', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:39:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('560', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:39:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('561', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:39:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('562', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:39:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('563', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-06 16:40:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('564', '1', '系统登陆', '1', '2016-06-06 16:58:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('565', '1', '系统登陆', '1', '2016-06-06 16:58:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('566', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:59:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('567', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:59:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('568', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:59:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('569', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 16:59:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('570', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:59:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('571', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 16:59:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('572', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 17:00:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('573', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 17:00:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('574', '1', '系统登陆', '1', '2016-06-06 17:02:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('575', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 17:02:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('576', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 17:02:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('577', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 17:02:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('578', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 17:02:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('579', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-06 17:02:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('580', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 17:02:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('581', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-06 17:02:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('582', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 17:02:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('583', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 17:02:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('584', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 17:02:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('585', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 17:03:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=29', '');
INSERT INTO `pm_sys_log` VALUES ('586', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 17:03:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=20', '');
INSERT INTO `pm_sys_log` VALUES ('587', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 17:03:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=21', '');
INSERT INTO `pm_sys_log` VALUES ('588', '1', '系统登陆', '1', '2016-06-06 17:05:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('589', '1', '系统登陆', '1', '2016-06-06 17:09:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('590', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 17:09:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('591', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 17:09:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('592', '1', '系统登陆', '1', '2016-06-06 17:12:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('593', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 17:12:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('594', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 17:12:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('595', '1', '系统登陆', '1', '2016-06-06 17:14:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/log', 'POST', '&requestUri=&title=&pageSize=15&createBy.id=1&endDate=2016-06-07&beginDate=2016-06-06&pageNum=18', '');
INSERT INTO `pm_sys_log` VALUES ('596', '1', '系统登陆', '1', '2016-06-06 17:17:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/log', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('597', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 17:17:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('598', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 17:17:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('599', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 17:17:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('600', '1', '系统登陆', '1', '2016-06-06 17:34:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('601', '1', '系统登陆', '1', '2016-06-06 17:43:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index;JSESSIONID=bfeb32d4-52ae-41ab-bc96-b10c6d097388', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('602', '1', '系统登陆', '1', '2016-06-06 18:09:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('603', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:09:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('604', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:09:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('605', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:12:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('606', '1', '系统登陆', '1', '2016-06-06 18:12:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('607', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:12:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('608', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:12:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('609', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:12:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('610', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 18:12:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('611', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 18:12:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=27', '');
INSERT INTO `pm_sys_log` VALUES ('612', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 18:12:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=28', '');
INSERT INTO `pm_sys_log` VALUES ('613', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 18:12:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=29', '');
INSERT INTO `pm_sys_log` VALUES ('614', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 18:13:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('615', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 18:13:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=29', '');
INSERT INTO `pm_sys_log` VALUES ('616', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-06 18:13:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('617', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-06 18:13:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('618', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:13:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('619', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:13:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('620', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 18:13:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('621', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 18:13:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('622', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-06 18:13:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('623', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-06 18:13:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('624', '1', '系统登陆', '1', '2016-06-06 18:18:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('625', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:19:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('626', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:19:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('627', '1', '系统登陆', '1', '2016-06-06 18:36:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('628', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:37:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('629', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:37:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('630', '1', '系统登陆', '1', '2016-06-06 18:38:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('631', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:38:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('632', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:38:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('633', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:38:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('634', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:38:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('635', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:39:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('636', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:39:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('637', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:39:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('638', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:39:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('639', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:40:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('640', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:40:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('641', '1', '系统登陆', '1', '2016-06-06 18:42:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('642', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:43:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('643', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:43:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('644', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:43:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('645', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:43:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('646', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:44:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('647', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:44:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('648', '1', '系统登陆', '1', '2016-06-06 18:45:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('649', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:45:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('650', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:45:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('651', '1', '系统登陆', '1', '2016-06-06 18:47:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('652', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:47:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('653', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:47:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('654', '1', '系统登陆', '1', '2016-06-06 18:50:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('655', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:50:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('656', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:50:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('657', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:52:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('658', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:52:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('659', '1', '系统登陆', '1', '2016-06-06 18:56:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('660', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:56:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('661', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:56:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('662', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-06 18:58:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.id=3&office.name=综合部', '');
INSERT INTO `pm_sys_log` VALUES ('663', '1', '系统登陆', '1', '2016-06-07 09:00:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('664', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:00:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('665', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:00:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('666', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:01:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('667', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:01:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('668', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:01:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('669', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:01:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('670', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:01:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('671', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:01:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('672', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:01:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('673', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:01:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('674', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:01:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('675', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:01:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('676', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:01:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('677', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:01:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('678', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:01:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('679', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:01:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('680', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:01:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('681', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-07 09:01:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('682', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:02:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('683', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:02:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('684', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-07 09:02:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('685', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:02:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('686', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:02:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=67', '');
INSERT INTO `pm_sys_log` VALUES ('687', '1', '系统登陆', '1', '2016-06-07 09:02:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=3', '');
INSERT INTO `pm_sys_log` VALUES ('688', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:02:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=3', '');
INSERT INTO `pm_sys_log` VALUES ('689', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:02:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=13', '');
INSERT INTO `pm_sys_log` VALUES ('690', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:03:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('691', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:03:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=27', '');
INSERT INTO `pm_sys_log` VALUES ('692', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:03:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=28', '');
INSERT INTO `pm_sys_log` VALUES ('693', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:03:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('694', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:03:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=13', '');
INSERT INTO `pm_sys_log` VALUES ('695', '1', '系统登陆', '1', '2016-06-07 09:05:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=27', '');
INSERT INTO `pm_sys_log` VALUES ('696', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:05:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=27', '');
INSERT INTO `pm_sys_log` VALUES ('697', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:05:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('698', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:06:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=&oldParentId=1&icon=&sort=10&parent.id=1&name=mune-test&target=&permission=&remarks=&href=&parent.name=功能菜单&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('699', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:06:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('700', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:06:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('701', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:06:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=85&oldParentId=1&icon=&sort=30&parent.id=1&name=mune-test&target=&permission=&remarks=&href=&parent.name=功能菜单&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('702', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:06:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('703', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:06:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=27', '');
INSERT INTO `pm_sys_log` VALUES ('704', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:06:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=28', '');
INSERT INTO `pm_sys_log` VALUES ('705', '1', '系统登陆', '1', '2016-06-07 09:07:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('706', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:07:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('707', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:07:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('708', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:07:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('709', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:07:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('710', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:07:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('711', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:07:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('712', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:07:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('713', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:07:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&parent.id=85', '');
INSERT INTO `pm_sys_log` VALUES ('714', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:08:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=&oldParentId=85&icon=&sort=10&parent.id=85&name=用户角色&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('715', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:08:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('716', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:08:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=86', '');
INSERT INTO `pm_sys_log` VALUES ('717', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:08:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('718', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:08:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('719', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:08:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('720', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:08:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('721', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:08:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('722', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:08:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('723', '1', '系统登陆', '1', '2016-06-07 09:09:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('724', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:09:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('725', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:09:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('726', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:09:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('727', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:09:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('728', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:09:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('729', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:09:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('730', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:09:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('731', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-07 09:09:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('732', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:10:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('733', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:11:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=86', '');
INSERT INTO `pm_sys_log` VALUES ('734', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:11:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=86&oldParentId=85&icon=&sort=10&parent.id=85&name=用户角色-test&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('735', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:11:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('736', '1', '系统登陆', '1', '2016-06-07 09:12:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('737', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:13:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('738', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:13:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('739', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:13:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('740', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-07 09:13:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toRoleAssign', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('741', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:13:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('742', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:13:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('743', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-07 09:13:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/save', 'POST', '&id=1&menuIds=1,27,28,29,30,2,13,20,21,22,17,18,19,14,15,16,3,4,5,6,7,8,9,10,11,12,67,68,84,85,86&dataScope=1&useable=1&office.name=公司领导&name=系统管理员&officeIds=&remarks=&office.id=2&isSys=1&oldName=系统管理员', '');
INSERT INTO `pm_sys_log` VALUES ('744', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:13:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('745', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:13:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('746', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:13:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('747', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:13:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('748', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:13:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('749', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:14:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('750', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:14:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('751', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:14:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('752', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:14:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('753', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:14:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('754', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-07 09:14:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/save', 'POST', '&id=2&menuIds=1,27,28,29,30,2,13,20,21,22,17,18,19,14,15,16,3,4,5,6,7,8,9,10,11,12,67,68,84,85,86&dataScope=2&useable=1&office.name=公司领导&name=公司管理员&officeIds=&remarks=&office.id=2&isSys=1&oldName=公司管理员', '');
INSERT INTO `pm_sys_log` VALUES ('755', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:14:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('756', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:14:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('757', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:14:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('758', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:14:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('759', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:14:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('760', '1', '系统登陆', '1', '2016-06-07 09:14:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('761', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:14:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('762', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:14:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('763', '1', '系统登陆', '1', '2016-06-07 09:17:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('764', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:17:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('765', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:17:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('766', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:17:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('767', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:17:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('768', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:17:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('769', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:17:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('770', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:17:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('771', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:18:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=86', '');
INSERT INTO `pm_sys_log` VALUES ('772', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:18:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=86&oldParentId=85&icon= icon-user&sort=10&parent.id=85&name=用户角色-test&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('773', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:18:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('774', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:18:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&parent.id=85', '');
INSERT INTO `pm_sys_log` VALUES ('775', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:18:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=&oldParentId=85&icon=&sort=20&parent.id=85&name=机构管理&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('776', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:18:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('777', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:18:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=87', '');
INSERT INTO `pm_sys_log` VALUES ('778', '1', '系统登陆', '1', '2016-06-07 09:19:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=87&oldParentId=85&icon= icon-th-large&sort=20&parent.id=85&name=机构管理&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('779', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:19:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=87&oldParentId=85&icon= icon-th-large&sort=20&parent.id=85&name=机构管理&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('780', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:19:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('781', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:19:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&parent.id=85', '');
INSERT INTO `pm_sys_log` VALUES ('782', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:19:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=&oldParentId=85&icon=&sort=30&parent.id=85&name=aaa&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('783', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:19:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('784', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:19:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=88', '');
INSERT INTO `pm_sys_log` VALUES ('785', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:19:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=88&oldParentId=85&icon= icon-comment&sort=30&parent.id=85&name=aaa&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('786', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:19:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('787', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:20:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&parent.id=85', '');
INSERT INTO `pm_sys_log` VALUES ('788', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:20:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=&oldParentId=85&icon=&sort=10&parent.id=85&name=机构用户&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('789', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:20:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('790', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:20:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=86', '');
INSERT INTO `pm_sys_log` VALUES ('791', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:20:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=86&oldParentId=85&icon= icon-user&sort=10&parent.id=87&name=用户角色-test&target=&permission=&remarks=&href=&parent.name=机构管理&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('792', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:20:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('793', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:20:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=87', '');
INSERT INTO `pm_sys_log` VALUES ('794', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:20:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=87&oldParentId=85&icon= icon-th-large&sort=20&parent.id=89&name=机构管理&target=&permission=&remarks=&href=&parent.name=机构用户&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('795', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:20:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('796', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:21:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=88', '');
INSERT INTO `pm_sys_log` VALUES ('797', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:21:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=88&oldParentId=85&icon= icon-comment&sort=30&parent.id=89&name=aaa&target=&permission=&remarks=&href=&parent.name=机构用户&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('798', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:21:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('799', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:21:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=86', '');
INSERT INTO `pm_sys_log` VALUES ('800', '1', '系统登陆', '1', '2016-06-07 09:21:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=86&oldParentId=87&icon= icon-user&sort=10&parent.id=89&name=用户角色-test&target=&permission=&remarks=&href=&parent.name=机构用户&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('801', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:21:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=86&oldParentId=87&icon= icon-user&sort=10&parent.id=89&name=用户角色-test&target=&permission=&remarks=&href=&parent.name=机构用户&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('802', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:21:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('803', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:21:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('804', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:21:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('805', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:21:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('806', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:21:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('807', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:21:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('808', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:21:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('809', '1', '系统登陆', '1', '2016-06-07 09:21:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('810', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:22:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('811', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:22:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('812', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:22:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('813', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:22:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('814', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:22:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('815', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:22:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=89', '');
INSERT INTO `pm_sys_log` VALUES ('816', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:22:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=89&oldParentId=85&icon=&sort=10&parent.id=85&name=机构用户-test&target=&permission=&remarks=&href=&parent.name=mune-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('817', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:22:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('818', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:22:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=87', '');
INSERT INTO `pm_sys_log` VALUES ('819', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:22:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=87&oldParentId=89&icon= icon-th-large&sort=20&parent.id=89&name=机构管理-test&target=&permission=&remarks=&href=&parent.name=机构用户-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('820', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:22:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('821', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:22:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=88', '');
INSERT INTO `pm_sys_log` VALUES ('822', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:22:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=88&oldParentId=89&icon= icon-comment&sort=30&parent.id=89&name=aaa-test&target=&permission=&remarks=&href=&parent.name=机构用户-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('823', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:22:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('824', '1', '系统登陆', '1', '2016-06-07 09:23:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('825', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:23:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('826', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:23:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('827', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:23:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('828', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:23:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('829', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:24:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('830', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:24:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('831', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:24:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('832', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:24:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('833', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:24:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('834', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:24:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('835', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:24:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('836', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-07 09:24:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/save', 'POST', '&id=1&menuIds=1,27,28,29,30,2,13,20,21,22,17,18,19,14,15,16,3,4,5,6,7,8,9,10,11,12,67,68,84,85,89,86,87,88&dataScope=1&useable=1&office.name=公司领导&name=系统管理员&officeIds=&remarks=&office.id=2&isSys=1&oldName=系统管理员', '');
INSERT INTO `pm_sys_log` VALUES ('837', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:24:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('838', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:24:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('839', '1', '系统设置->系统设置->角色管理->修改', '1', '2016-06-07 09:25:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/save', 'POST', '&id=2&menuIds=1,27,28,29,30,2,13,20,21,22,17,18,19,14,15,16,3,4,5,6,7,8,9,10,11,12,67,68,84,85,89,86,87,88&dataScope=2&useable=1&office.name=公司领导&name=公司管理员&officeIds=&remarks=&office.id=2&isSys=1&oldName=公司管理员', '');
INSERT INTO `pm_sys_log` VALUES ('840', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:25:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('841', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:25:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('842', '1', '系统登陆', '1', '2016-06-07 09:25:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('843', '1', '系统登陆', '1', '2016-06-07 09:25:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('844', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:26:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('845', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:26:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('846', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:26:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('847', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:26:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('848', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:26:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('849', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:26:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('850', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:26:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('851', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:26:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('852', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:26:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/delete', 'GET', '&id=88', '');
INSERT INTO `pm_sys_log` VALUES ('853', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:26:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('854', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:27:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('855', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:27:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('856', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:27:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('857', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:27:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('858', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:27:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('859', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:27:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('860', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:27:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('861', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:27:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('862', '1', '系统登陆', '1', '2016-06-07 09:29:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('863', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('864', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('865', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('866', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('867', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('868', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('869', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('870', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('871', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-07 09:29:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('872', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:29:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('873', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:29:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=20', '');
INSERT INTO `pm_sys_log` VALUES ('874', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:29:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=86', '');
INSERT INTO `pm_sys_log` VALUES ('875', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:29:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=86&oldParentId=89&icon= icon-user&sort=10&parent.id=89&name=用户管理-test&target=&permission=&remarks=&href=/sys/user/index&parent.name=机构用户-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('876', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:29:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('877', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:29:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=20', '');
INSERT INTO `pm_sys_log` VALUES ('878', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('879', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:29:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('880', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('881', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('882', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('883', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('884', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:30:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('885', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:30:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=86', '');
INSERT INTO `pm_sys_log` VALUES ('886', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:30:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=86&oldParentId=89&icon= icon-user&sort=10&parent.id=89&name=用户管理-test&target=&permission=&remarks=&href=/sys/user/index123&parent.name=机构用户-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('887', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:30:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('888', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('889', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('890', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('891', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('892', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('893', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:30:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('894', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:30:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('895', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:30:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=86', '');
INSERT INTO `pm_sys_log` VALUES ('896', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-07 09:30:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=86&oldParentId=89&icon= icon-user&sort=10&parent.id=89&name=用户管理-test&target=&permission=&remarks=&href=/sys/user/index&parent.name=机构用户-test&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('897', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:30:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('898', '1', '系统登陆', '1', '2016-06-07 09:31:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/menuNavi', 'GET', '&parentId=85', '');
INSERT INTO `pm_sys_log` VALUES ('899', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:31:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('900', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:31:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('901', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:31:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('902', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:31:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('903', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:31:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('904', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:31:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('905', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:31:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('906', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:31:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('907', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:32:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('908', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:32:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('909', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:32:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=市场部&office.id=15', '');
INSERT INTO `pm_sys_log` VALUES ('910', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:32:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=技术部&office.id=16', '');
INSERT INTO `pm_sys_log` VALUES ('911', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:32:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('912', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:32:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('913', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:32:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('914', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-07 09:32:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('915', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-07 09:32:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('916', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:32:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('917', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-07 09:33:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('918', '1', '系统登陆', '1', '2016-06-07 09:33:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/log', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('919', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:33:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('920', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:33:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('921', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:33:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('922', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:33:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('923', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:33:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('924', '1', '系统设置->系统设置->角色管理->查看', '1', '2016-06-07 09:33:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/role/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('925', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:33:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('926', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:33:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('927', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:34:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('928', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:34:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('929', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:34:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('930', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-07 09:34:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('931', '1', '系统登陆', '1', '2016-06-15 16:29:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('932', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('933', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('934', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('935', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('936', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('937', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('938', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('939', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('940', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('941', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('942', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:29:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('943', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:30:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('944', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:30:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=技术部&office.id=16', '');
INSERT INTO `pm_sys_log` VALUES ('945', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:30:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('946', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:30:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('947', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:30:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('948', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:30:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=公司领导&office.id=2', '');
INSERT INTO `pm_sys_log` VALUES ('949', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:30:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('950', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:30:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('951', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:30:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&parent.id=16', '');
INSERT INTO `pm_sys_log` VALUES ('952', '1', '系统登陆', '1', '2016-06-15 16:31:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/save', 'POST', '&oldParentId=16&phone=&fax=&area.id=4&remarks=&code=&type=2&master=&id=&area.name=芙蓉区&address=&email=&useable=1&name=aaa&parent.id=16&zipCode=&grade=4&parent.name=技术部', '');
INSERT INTO `pm_sys_log` VALUES ('953', '1', '系统设置->机构用户->机构管理->修改', '1', '2016-06-15 16:31:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/save', 'POST', '&oldParentId=16&phone=&fax=&area.id=4&remarks=&code=&type=2&master=&id=&area.name=芙蓉区&address=&email=&useable=1&name=aaa&parent.id=16&zipCode=&grade=4&parent.name=技术部', '');
INSERT INTO `pm_sys_log` VALUES ('954', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:31:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('955', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:31:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=17', '');
INSERT INTO `pm_sys_log` VALUES ('956', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:32:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('957', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:32:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=16', '');
INSERT INTO `pm_sys_log` VALUES ('958', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:32:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=12', '');
INSERT INTO `pm_sys_log` VALUES ('959', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:32:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=7', '');
INSERT INTO `pm_sys_log` VALUES ('960', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:32:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('961', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:32:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('962', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:32:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '&office.name=aaa&office.id=17', '');
INSERT INTO `pm_sys_log` VALUES ('963', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:32:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('964', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:32:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('965', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:32:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=15', '');
INSERT INTO `pm_sys_log` VALUES ('966', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:33:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=16', '');
INSERT INTO `pm_sys_log` VALUES ('967', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:33:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=17', '');
INSERT INTO `pm_sys_log` VALUES ('968', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:33:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('969', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:33:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=13', '');
INSERT INTO `pm_sys_log` VALUES ('970', '1', '系统登陆', '1', '2016-06-15 16:33:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=12', '');
INSERT INTO `pm_sys_log` VALUES ('971', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:33:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=12', '');
INSERT INTO `pm_sys_log` VALUES ('972', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:33:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=17', '');
INSERT INTO `pm_sys_log` VALUES ('973', '1', '系统设置->机构用户->机构管理->修改', '1', '2016-06-15 16:34:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/save', 'POST', '&oldParentId=16&phone=&fax=&area.id=4&remarks=&code=&type=2&master=&id=17&area.name=芙蓉区&address=&email=&useable=1&name=aaa&parent.id=16&zipCode=&grade=3&parent.name=技术部', '');
INSERT INTO `pm_sys_log` VALUES ('974', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:34:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('975', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:34:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '&id=17', '');
INSERT INTO `pm_sys_log` VALUES ('976', '1', '系统设置->机构用户->机构管理->修改', '1', '2016-06-15 16:34:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/save', 'POST', '&oldParentId=16&phone=&fax=&area.id=4&remarks=&code=201004001&type=2&master=&id=17&area.name=芙蓉区&useable=1&address=&email=&parent.id=16&name=aaa&zipCode=&grade=3&parent.name=技术部', '');
INSERT INTO `pm_sys_log` VALUES ('977', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:34:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('978', '1', '系统设置->机构用户->机构管理->修改', '1', '2016-06-15 16:35:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/delete', 'GET', '&id=17', '');
INSERT INTO `pm_sys_log` VALUES ('979', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:35:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('980', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:35:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('981', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:35:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('982', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:35:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('983', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:35:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('984', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:35:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('985', '1', '系统登陆', '1', '2016-06-15 16:35:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('986', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:35:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('987', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:35:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=86', '');
INSERT INTO `pm_sys_log` VALUES ('988', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:35:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=87', '');
INSERT INTO `pm_sys_log` VALUES ('989', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:36:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('990', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:36:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('991', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:36:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('992', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:36:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('993', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:36:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('994', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:36:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('995', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:36:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=2', '');
INSERT INTO `pm_sys_log` VALUES ('996', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:36:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=27', '');
INSERT INTO `pm_sys_log` VALUES ('997', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-15 16:36:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=27&oldParentId=1&icon=&sort=10&parent.id=1&name=我的面板&target=&permission=&remarks=&href=&parent.name=功能菜单&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('998', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:36:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('999', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:36:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1000', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:36:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1001', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:36:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('1002', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:36:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1003', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:37:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=27', '');
INSERT INTO `pm_sys_log` VALUES ('1004', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:37:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('1005', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:37:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1006', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:37:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1007', '1', '系统登陆', '1', '2016-06-15 16:38:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('1008', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:38:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('1009', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:38:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('1010', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:38:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1011', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:38:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1012', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:38:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1013', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:38:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1014', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:38:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1015', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:38:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1016', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:38:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1017', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:38:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1018', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:38:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1019', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:38:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1020', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:38:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('1021', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-15 16:38:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/save', 'POST', '&oldParentId=1&icon=&sort=30&permission=&remarks=&id=85&parent.id=1&name=mune-test&target=&href=&parent.name=功能菜单&isShow=0', '');
INSERT INTO `pm_sys_log` VALUES ('1022', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:38:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1023', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:38:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1024', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:38:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1025', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:39:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1026', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:39:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1027', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:39:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1028', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:39:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1029', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:39:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1030', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:39:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/toEdit', 'GET', '&id=85', '');
INSERT INTO `pm_sys_log` VALUES ('1031', '1', '系统设置->系统设置->菜单管理->修改', '1', '2016-06-15 16:39:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/save', 'POST', '&id=85&oldParentId=1&icon=&sort=30&parent.id=1&name=mune-test&target=&permission=&remarks=&href=&parent.name=功能菜单&isShow=1', '');
INSERT INTO `pm_sys_log` VALUES ('1032', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:39:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1033', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:39:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1034', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:39:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1035', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:39:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1036', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-15 16:39:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1037', '1', '系统设置->系统设置->菜单管理->查看', '1', '2016-06-15 16:39:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/menu/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1038', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:39:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1039', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-15 16:39:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1040', '1', '系统登陆', '1', '2016-06-15 16:40:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/log', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1041', '1', '系统登陆', '1', '2016-06-15 16:44:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/log', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1042', '1', '系统登陆', '1', '2016-06-23 13:54:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1043', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-23 13:54:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1044', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-23 13:54:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1045', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-23 13:55:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/dict/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1046', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-23 13:55:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '&sort=20&description=删除标记&type=del_flag', '');
INSERT INTO `pm_sys_log` VALUES ('1047', '1', '系统设置->系统设置->字典管理->查看', '1', '2016-06-23 13:55:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/dict/toEdit', 'GET', '&id=1', '');
INSERT INTO `pm_sys_log` VALUES ('1048', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-23 13:56:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1049', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-23 13:56:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1050', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-23 13:56:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/toEdit', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1051', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-23 13:56:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1052', '1', '系统登陆', '1', '2016-06-23 13:56:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/changePwd', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1053', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-23 13:56:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1054', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-23 13:56:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1055', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-23 13:56:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1056', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-23 13:57:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1057', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-23 13:57:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1058', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-23 13:57:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/area/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1059', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-23 13:57:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/area/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('1060', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-23 13:57:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/area/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('1061', '1', '系统设置->机构用户->区域管理->修改', '1', '2016-06-23 13:57:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/area/save', 'POST', '&id=4&oldParentId=3&parent.id=2&name=芙蓉区&remarks=&code=430102&type=4&parent.name=湖南省', '');
INSERT INTO `pm_sys_log` VALUES ('1062', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-23 13:57:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/area/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1063', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-23 13:57:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/area/toEdit', 'GET', '&id=4', '');
INSERT INTO `pm_sys_log` VALUES ('1064', '1', '系统设置->机构用户->区域管理->修改', '1', '2016-06-23 13:57:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/area/save', 'POST', '&id=4&oldParentId=2&parent.id=3&name=芙蓉区&remarks=&code=430102&type=4&parent.name=长沙市', '');
INSERT INTO `pm_sys_log` VALUES ('1065', '1', '系统设置->机构用户->区域管理->查看', '1', '2016-06-23 13:57:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/area/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1066', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-23 13:57:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/index', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1067', '1', '系统设置->机构用户->用户管理->查看', '1', '2016-06-23 13:57:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/user/list', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1068', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-23 13:57:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/', 'GET', '', '');
INSERT INTO `pm_sys_log` VALUES ('1069', '1', '系统设置->机构用户->机构管理->查看', '1', '2016-06-23 13:57:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '/tzxy_pm/sys/office/list', 'GET', '', '');

-- ----------------------------
-- Table structure for pm_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_menu`;
CREATE TABLE `pm_sys_menu` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of pm_sys_menu
-- ----------------------------
INSERT INTO `pm_sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '20', null, null, null, '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '20', null, null, null, '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '10', '/sys/menu/', null, 'list-alt', '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '20', '/sys/role/', null, 'lock', '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '30', '/sys/dict/', null, 'th-list', '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '10', null, null, null, '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '30', '/sys/area/', null, 'th', '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '20', '/sys/office/', null, 'th-large', '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '10', '/sys/user/index', null, 'user', '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '10', '', '', '', '1', '', '1', '2015-07-10 08:00:00', '1', '2016-06-15 16:36:38', '', '0');
INSERT INTO `pm_sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '10', null, null, null, '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '20', '/sys/user/info', null, 'user', '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '30', '/sys/user/changePwd', '', 'lock', '1', '', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', '', '0');
INSERT INTO `pm_sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '30', null, null, null, '1', null, '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '10', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '20', '/druid', '', ' icon-eye-open', '1', '', '1', '2015-07-10 08:00:00', '1', '2016-05-09 13:04:14', '', '0');
INSERT INTO `pm_sys_menu` VALUES ('85', '1', '0,1,', 'mune-test', '30', '', '', '', '1', '', '1', '2016-06-07 09:06:11', '1', '2016-06-15 16:39:09', '', '0');
INSERT INTO `pm_sys_menu` VALUES ('86', '89', '0,1,85,89,', '用户管理-test', '10', '/sys/user/index', '', ' icon-user', '1', '', '1', '2016-06-07 09:08:10', '1', '2016-06-07 09:30:56', '', '0');
INSERT INTO `pm_sys_menu` VALUES ('87', '89', '0,1,85,89,', '机构管理-test', '20', '', '', ' icon-th-large', '1', '', '1', '2016-06-07 09:18:39', '1', '2016-06-07 09:22:32', '', '0');
INSERT INTO `pm_sys_menu` VALUES ('88', '89', '0,1,85,89,', 'aaa-test', '30', '', '', ' icon-comment', '1', '', '1', '2016-06-07 09:19:36', '1', '2016-06-07 09:22:39', '', '1');
INSERT INTO `pm_sys_menu` VALUES ('89', '85', '0,1,85,', '机构用户-test', '10', '', '', '', '1', '', '1', '2016-06-07 09:20:16', '1', '2016-06-07 09:22:26', '', '0');

-- ----------------------------
-- Table structure for pm_sys_office
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_office`;
CREATE TABLE `pm_sys_office` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(32) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `useable` varchar(5) DEFAULT NULL COMMENT '是否启用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of pm_sys_office
-- ----------------------------
INSERT INTO `pm_sys_office` VALUES ('1', '0', '0,', '湖南省总公司', '10', '2', '100000', '1', '1', '', '', '', '', '', '', '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', '', '0');
INSERT INTO `pm_sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('7', '1', '0,1,', '长沙市分公司', '20', '3', '200000', '1', '2', '', '', '', '', '', '', '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', '', '0');
INSERT INTO `pm_sys_office` VALUES ('8', '7', '0,1,7,', '公司领导', '10', '3', '200001', '2', '2', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('9', '7', '0,1,7,', '综合部', '20', '3', '200002', '2', '2', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('10', '7', '0,1,7,', '市场部', '30', '3', '200003', '2', '2', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('11', '7', '0,1,7,', '技术部', '40', '3', '200004', '2', '2', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('12', '7', '0,1,7,', '芙蓉区分公司', '0', '4', '201000', '1', '3', '', '', '', '', '', '', '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', '', '0');
INSERT INTO `pm_sys_office` VALUES ('13', '12', '0,1,7,12,', '公司领导', '10', '4', '201001', '2', '3', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('14', '12', '0,1,7,12,', '综合部', '20', '4', '201002', '2', '3', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('15', '12', '0,1,7,12,', '市场部', '30', '4', '201003', '2', '3', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('16', '12', '0,1,7,12,', '技术部', '40', '4', '201004', '2', '3', null, null, null, null, null, null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_office` VALUES ('17', '16', '0,1,7,12,16,', 'aaa', '10', '4', '201004001', '2', '3', '', '', '', '', '', '', '1', '1', '2016-06-15 16:31:31', '1', '2016-06-15 16:34:56', '', '1');

-- ----------------------------
-- Table structure for pm_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_role`;
CREATE TABLE `pm_sys_role` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `office_id` int(32) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of pm_sys_role
-- ----------------------------
INSERT INTO `pm_sys_role` VALUES ('1', '2', '系统管理员', '1', '1', '1', '1', '2015-07-10 08:00:00', '1', '2016-06-07 09:24:57', '', '0');
INSERT INTO `pm_sys_role` VALUES ('2', '2', '公司管理员', '2', '1', '1', '1', '2015-07-10 08:00:00', '1', '2016-06-07 09:25:02', '', '0');
INSERT INTO `pm_sys_role` VALUES ('3', '2', '本公司管理员', '3', '1', '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', '', '0');
INSERT INTO `pm_sys_role` VALUES ('4', '1', '部门管理员', '4', '0', '1', '1', '2015-07-10 08:00:00', '1', '2016-05-09 16:12:14', '', '0');
INSERT INTO `pm_sys_role` VALUES ('5', '1', '本部门管理员', '5', null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_role` VALUES ('6', '1', '普通用户', '8', null, '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', null, '0');
INSERT INTO `pm_sys_role` VALUES ('7', '2', '长沙市管理员', '9', '1', '1', '1', '2015-07-10 08:00:00', '1', '2015-07-10 08:00:00', '', '0');

-- ----------------------------
-- Table structure for pm_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_role_menu`;
CREATE TABLE `pm_sys_role_menu` (
  `role_id` int(32) NOT NULL COMMENT '角色编号',
  `menu_id` int(32) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of pm_sys_role_menu
-- ----------------------------
INSERT INTO `pm_sys_role_menu` VALUES ('1', '1');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '2');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '3');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '4');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '5');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '6');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '7');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '8');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '9');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '10');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '11');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '12');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '13');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '14');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '15');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '16');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '17');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '18');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '19');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '20');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '21');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '22');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '27');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '28');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '29');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '30');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '67');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '68');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '84');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '85');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '86');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '87');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '88');
INSERT INTO `pm_sys_role_menu` VALUES ('1', '89');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '1');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '2');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '3');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '4');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '5');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '6');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '7');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '8');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '9');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '10');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '11');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '12');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '13');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '14');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '15');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '16');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '17');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '18');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '19');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '20');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '21');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '22');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '27');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '28');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '29');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '30');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '67');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '68');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '84');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '85');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '86');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '87');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '88');
INSERT INTO `pm_sys_role_menu` VALUES ('2', '89');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '1');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '2');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '3');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '4');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '5');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '6');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '7');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '8');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '9');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '10');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '11');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '12');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '13');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '14');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '15');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '16');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '17');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '18');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '19');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '20');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '21');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '22');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '27');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '28');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '29');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '30');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '67');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '68');
INSERT INTO `pm_sys_role_menu` VALUES ('3', '84');
INSERT INTO `pm_sys_role_menu` VALUES ('4', '1');
INSERT INTO `pm_sys_role_menu` VALUES ('4', '27');
INSERT INTO `pm_sys_role_menu` VALUES ('4', '28');
INSERT INTO `pm_sys_role_menu` VALUES ('4', '29');
INSERT INTO `pm_sys_role_menu` VALUES ('4', '30');

-- ----------------------------
-- Table structure for pm_sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_role_office`;
CREATE TABLE `pm_sys_role_office` (
  `role_id` int(32) NOT NULL COMMENT '角色编号',
  `office_id` int(32) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of pm_sys_role_office
-- ----------------------------
INSERT INTO `pm_sys_role_office` VALUES ('7', '7');
INSERT INTO `pm_sys_role_office` VALUES ('7', '8');
INSERT INTO `pm_sys_role_office` VALUES ('7', '9');
INSERT INTO `pm_sys_role_office` VALUES ('7', '10');
INSERT INTO `pm_sys_role_office` VALUES ('7', '11');
INSERT INTO `pm_sys_role_office` VALUES ('7', '12');
INSERT INTO `pm_sys_role_office` VALUES ('7', '13');
INSERT INTO `pm_sys_role_office` VALUES ('7', '14');
INSERT INTO `pm_sys_role_office` VALUES ('7', '15');
INSERT INTO `pm_sys_role_office` VALUES ('7', '16');
INSERT INTO `pm_sys_role_office` VALUES ('7', '17');
INSERT INTO `pm_sys_role_office` VALUES ('7', '18');
INSERT INTO `pm_sys_role_office` VALUES ('7', '19');
INSERT INTO `pm_sys_role_office` VALUES ('7', '20');
INSERT INTO `pm_sys_role_office` VALUES ('7', '21');
INSERT INTO `pm_sys_role_office` VALUES ('7', '22');
INSERT INTO `pm_sys_role_office` VALUES ('7', '23');
INSERT INTO `pm_sys_role_office` VALUES ('7', '24');
INSERT INTO `pm_sys_role_office` VALUES ('7', '25');
INSERT INTO `pm_sys_role_office` VALUES ('7', '26');

-- ----------------------------
-- Table structure for pm_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_user`;
CREATE TABLE `pm_sys_user` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `company_id` int(32) NOT NULL COMMENT '归属公司',
  `office_id` int(32) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of pm_sys_user
-- ----------------------------
INSERT INTO `pm_sys_user` VALUES ('1', '1', '2', 'admin', 'e81780321b66f5c0da6bb22620492e6bea7eff01a62d291e3600dbfb', '0001', '系统超级管理员', 'colin@163.com', '13816947328', '18888888888', '0:0:0:0:0:0:0:1', '2016-06-23 13:56:50', '1', '1', '2015-07-10 08:00:00', '1', '2016-06-06 14:51:11', '最高管理员', '0');
INSERT INTO `pm_sys_user` VALUES ('14', '7', '3', 'test1', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-06-06 16:11:02', '1', '1', '2016-05-09 11:51:48', '1', '2016-06-06 16:37:55', '', '0');
INSERT INTO `pm_sys_user` VALUES ('15', '1', '3', 'test001', '469518e9291fb5dfd54dfcb71dd2a9b14fda905409565272ed96161b', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-06-06 16:21:24', '', '1');
INSERT INTO `pm_sys_user` VALUES ('16', '12', '3', 'test2', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-06-06 16:38:37', '', '0');
INSERT INTO `pm_sys_user` VALUES ('17', '1', '3', 'test3', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('18', '1', '3', 'test4', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('19', '1', '3', 'test5', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('20', '1', '3', 'test6', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('21', '1', '3', 'test7', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('22', '1', '3', 'test8', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('23', '1', '3', 'test9', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('24', '1', '3', 'test10', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('25', '1', '3', 'test11', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('26', '1', '3', 'test12', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('27', '1', '3', 'test13', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('28', '1', '3', 'test14', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('29', '1', '3', 'test15', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('30', '1', '3', 'test16', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('31', '1', '3', 'test17', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('32', '1', '3', 'test18', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('33', '1', '3', 'test19', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('34', '1', '3', 'test20', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');
INSERT INTO `pm_sys_user` VALUES ('35', '1', '3', 'test21', '3f28986d127536a9ee33eef098d81da01d53b4010ecf7901c4a1575e', '1', '综合部-test1', '', '', '', '0:0:0:0:0:0:0:1', '2016-05-09 15:39:46', '1', '1', '2016-05-09 11:51:48', '1', '2016-05-09 16:12:30', '', '0');

-- ----------------------------
-- Table structure for pm_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `pm_sys_user_role`;
CREATE TABLE `pm_sys_user_role` (
  `user_id` int(32) NOT NULL COMMENT '用户编号',
  `role_id` int(32) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of pm_sys_user_role
-- ----------------------------
INSERT INTO `pm_sys_user_role` VALUES ('1', '1');
INSERT INTO `pm_sys_user_role` VALUES ('1', '2');
INSERT INTO `pm_sys_user_role` VALUES ('14', '4');
INSERT INTO `pm_sys_user_role` VALUES ('15', '5');
INSERT INTO `pm_sys_user_role` VALUES ('16', '5');
