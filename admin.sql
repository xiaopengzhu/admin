/*
Navicat MySQL Data Transfer

Source Server         : 新开发机
Source Server Version : 50623
Source Host           : 10.21.168.185:3306
Source Database       : wifi

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2016-04-07 17:18:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lv_access
-- ----------------------------
DROP TABLE IF EXISTS `lv_access`;
CREATE TABLE `lv_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色的ID',
  `permission_id` int(11) NOT NULL COMMENT '节点的ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '标识是用户组还是用户1为用户组2为用户,默认为用户组',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `node_id` (`permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=630 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of lv_access
-- ----------------------------
INSERT INTO `lv_access` VALUES ('595', '3', '1', '1');
INSERT INTO `lv_access` VALUES ('596', '3', '67', '1');
INSERT INTO `lv_access` VALUES ('597', '3', '4', '1');
INSERT INTO `lv_access` VALUES ('598', '3', '29', '1');
INSERT INTO `lv_access` VALUES ('599', '3', '2', '1');
INSERT INTO `lv_access` VALUES ('600', '3', '26', '1');
INSERT INTO `lv_access` VALUES ('601', '3', '3', '1');
INSERT INTO `lv_access` VALUES ('602', '3', '33', '1');
INSERT INTO `lv_access` VALUES ('603', '3', '85', '1');
INSERT INTO `lv_access` VALUES ('604', '3', '84', '1');
INSERT INTO `lv_access` VALUES ('605', '3', '89', '1');
INSERT INTO `lv_access` VALUES ('606', '3', '68', '1');
INSERT INTO `lv_access` VALUES ('607', '3', '53', '1');
INSERT INTO `lv_access` VALUES ('622', '4', '1', '1');
INSERT INTO `lv_access` VALUES ('623', '4', '67', '1');
INSERT INTO `lv_access` VALUES ('624', '4', '4', '1');
INSERT INTO `lv_access` VALUES ('625', '4', '29', '1');
INSERT INTO `lv_access` VALUES ('626', '4', '3', '1');
INSERT INTO `lv_access` VALUES ('627', '4', '30', '1');
INSERT INTO `lv_access` VALUES ('628', '4', '32', '1');
INSERT INTO `lv_access` VALUES ('629', '4', '33', '1');

-- ----------------------------
-- Table structure for lv_action_log
-- ----------------------------
DROP TABLE IF EXISTS `lv_action_log`;
CREATE TABLE `lv_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '登录的用户名',
  `user_id` int(11) NOT NULL COMMENT '登录的用户ID',
  `ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `ip_address` varchar(255) NOT NULL COMMENT 'ip所属的地区',
  `add_time` int(11) NOT NULL,
  `realname` varchar(30) NOT NULL COMMENT '真实姓名',
  `content` text NOT NULL COMMENT '记录的内容',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `addtime` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of lv_action_log
-- ----------------------------
INSERT INTO `lv_action_log` VALUES ('1', 'admin', '1', '127.0.0.1', '', '1458917465', '管理员', '编辑了用户组：管理员');
INSERT INTO `lv_action_log` VALUES ('2', 'admin', '1', '127.0.0.1', '', '1458917988', '管理员', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('3', 'admin', '1', '127.0.0.1', '', '1458918109', '管理员', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('4', 'admin', '1', '127.0.0.1', '', '1458919307', '管理员', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('5', 'admin', '1', '127.0.0.1', '', '1458921762', '管理员', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('6', 'admin', '1', '127.0.0.1', '', '1458923119', '管理员', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('7', 'admin', '1', '127.0.0.1', '', '1458923149', '管理员', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('8', 'admin', '1', '127.0.0.1', '', '1458923173', '管理员', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('9', 'admin', '1', '127.0.0.1', '', '1458923210', '管理员', '增加了新的用户组：游客');
INSERT INTO `lv_action_log` VALUES ('10', 'admin', '1', '127.0.0.1', '', '1458923233', '管理员', '改变了用户组的权限：管理员');
INSERT INTO `lv_action_log` VALUES ('11', 'admin', '1', '127.0.0.1', '', '1458923381', '管理员', '增加了新的系统用户：guest');
INSERT INTO `lv_action_log` VALUES ('12', 'guest', '4', '127.0.0.1', '', '1458923395', '王先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('13', 'admin', '1', '127.0.0.1', '', '1458923402', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('14', 'admin', '1', '127.0.0.1', '', '1458923425', '朱先生', '改变了用户组的权限：游客');
INSERT INTO `lv_action_log` VALUES ('15', 'guest', '4', '127.0.0.1', '', '1458923535', '王先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('16', 'admin', '1', '127.0.0.1', '', '1458923581', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('17', 'admin', '1', '127.0.0.1', '', '1458923604', '朱先生', '改变了用户的权限：guest');
INSERT INTO `lv_action_log` VALUES ('18', 'admin', '1', '127.0.0.1', '', '1458923615', '朱先生', '改变了用户的权限：guest');
INSERT INTO `lv_action_log` VALUES ('19', 'admin', '1', '127.0.0.1', '', '1458923632', '朱先生', '改变了用户的权限：guest');
INSERT INTO `lv_action_log` VALUES ('20', 'guest', '4', '127.0.0.1', '', '1458923683', '王先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('21', 'admin', '1', '127.0.0.1', '', '1458923703', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('22', 'admin', '1', '127.0.0.1', '', '1458923726', '朱先生', '改变了用户的权限：guest');
INSERT INTO `lv_action_log` VALUES ('23', 'guest', '4', '127.0.0.1', '', '1458923743', '王先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('24', 'admin', '1', '127.0.0.1', '', '1458923755', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('25', 'admin', '1', '127.0.0.1', '', '1459218249', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('26', 'admin', '1', '127.0.0.1', '', '1459224239', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('27', 'admin', '1', '127.0.0.1', '', '1459230372', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('28', 'admin', '1', '127.0.0.1', '', '1459230547', '朱先生', '增加了新的系统用户：sharlock');
INSERT INTO `lv_action_log` VALUES ('29', 'admin', '1', '127.0.0.1', '', '1459230944', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('30', 'admin', '1', '127.0.0.1', '', '1459231040', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('31', 'admin', '1', '127.0.0.1', '', '1459232339', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('32', 'admin', '1', '127.0.0.1', '', '1459237411', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('33', 'admin', '1', '127.0.0.1', '', '1459237667', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('34', 'admin', '1', '127.0.0.1', '', '1459238464', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('35', 'admin', '1', '127.0.0.1', '', '1459302419', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('36', 'admin', '1', '127.0.0.1', '', '1459304491', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('37', 'admin', '1', '127.0.0.1', '', '1459304556', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('38', 'admin', '1', '127.0.0.1', '', '1459304586', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('39', 'admin', '1', '127.0.0.1', '', '1459309859', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('40', 'admin', '1', '127.0.0.1', '', '1459310288', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('41', 'admin', '1', '127.0.0.1', '', '1459323139', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('42', 'admin', '1', '127.0.0.1', '', '1459323959', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('43', 'admin', '1', '127.0.0.1', '', '1459325985', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('44', 'admin', '1', '127.0.0.1', '', '1459328308', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('45', 'sharlock', '5', '127.0.0.1', '', '1459329535', 'Mr.H', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('46', 'admin', '1', '127.0.0.1', '', '1459330554', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('47', 'admin', '1', '127.0.0.1', '', '1459330622', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('48', 'admin', '1', '127.0.0.1', '', '1459387936', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('49', 'admin', '1', '127.0.0.1', '', '1459388163', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('50', 'admin', '1', '127.0.0.1', '', '1459403721', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('51', 'admin', '1', '127.0.0.1', '', '1459407778', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('52', 'admin', '1', '127.0.0.1', '', '1459420587', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('53', 'admin', '1', '127.0.0.1', '', '1459472951', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('54', 'admin', '1', '127.0.0.1', '', '1459474072', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('55', 'admin', '1', '127.0.0.1', '', '1459476002', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('56', 'admin', '1', '127.0.0.1', '', '1459477862', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('57', 'admin', '1', '127.0.0.1', '', '1459480408', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('58', 'admin', '1', '127.0.0.1', '', '1459481777', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('59', 'admin', '1', '127.0.0.1', '', '1459482178', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('60', 'admin', '1', '127.0.0.1', '', '1459491298', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('61', 'admin', '1', '127.0.0.1', '', '1459491664', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('62', 'admin', '1', '127.0.0.1', '', '1459492938', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('63', 'admin', '1', '127.0.0.1', '', '1459498712', '朱先生', '改变了用户组的权限：游客');
INSERT INTO `lv_action_log` VALUES ('64', 'guest', '4', '127.0.0.1', '', '1459498727', '王先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('65', 'admin', '1', '127.0.0.1', '', '1459498756', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('66', 'admin', '1', '127.0.0.1', '', '1459820788', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('67', 'admin', '1', '127.0.0.1', '', '1459821335', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('68', 'admin', '1', '127.0.0.1', '', '1459821721', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('69', 'admin', '1', '127.0.0.1', '', '1459821801', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('70', 'admin', '1', '127.0.0.1', '', '1459822270', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('71', 'admin', '1', '127.0.0.1', '', '1459827593', '朱先生', '编辑了系统用户：guest');
INSERT INTO `lv_action_log` VALUES ('72', 'admin', '1', '127.0.0.1', '', '1459827708', '朱先生', '编辑了系统用户：guest');
INSERT INTO `lv_action_log` VALUES ('73', 'admin', '1', '127.0.0.1', '', '1459827951', '朱先生', '编辑了系统用户：sharlock');
INSERT INTO `lv_action_log` VALUES ('74', 'admin', '1', '127.0.0.1', '', '1459827986', '朱先生', '增加了新的用户组：学校');
INSERT INTO `lv_action_log` VALUES ('75', 'admin', '1', '127.0.0.1', '', '1459828005', '朱先生', '增加了新的用户组：省厅');
INSERT INTO `lv_action_log` VALUES ('76', 'admin', '1', '127.0.0.1', '', '1459828017', '朱先生', '编辑了系统用户：guest');
INSERT INTO `lv_action_log` VALUES ('77', 'admin', '1', '127.0.0.1', '', '1459828067', '朱先生', '编辑了系统用户：sharlock');
INSERT INTO `lv_action_log` VALUES ('78', 'admin', '1', '127.0.0.1', '', '1459835092', '朱先生', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('79', 'admin', '1', '127.0.0.1', '', '1459835100', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('80', 'admin', '1', '127.0.0.1', '', '1459835878', '朱先生', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('81', 'admin', '1', '127.0.0.1', '', '1459835890', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('82', 'admin', '1', '127.0.0.1', '', '1459836082', '朱先生', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('83', 'admin', '1', '127.0.0.1', '', '1459836091', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('84', 'admin', '1', '127.0.0.1', '', '1459836376', '朱先生', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('85', 'admin', '1', '127.0.0.1', '', '1459836384', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('86', 'admin', '1', '127.0.0.1', '', '1459841212', '朱先生', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('87', 'admin', '1', '127.0.0.1', '', '1459841220', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('88', 'admin', '1', '127.0.0.1', '', '1459841240', '朱先生', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('89', 'admin', '1', '127.0.0.1', '', '1459841247', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('90', 'admin', '1', '127.0.0.1', '', '1459841820', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('91', 'admin', '1', '127.0.0.1', '', '1459842263', '朱先生', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('92', 'admin', '1', '127.0.0.1', '', '1459842275', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('93', 'admin', '1', '127.0.0.1', '', '1459842317', '朱先生', '编辑了系统用户：admin');
INSERT INTO `lv_action_log` VALUES ('94', 'admin', '1', '127.0.0.1', '', '1459842325', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('95', 'admin', '1', '127.0.0.1', '', '1459849994', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('96', 'admin', '1', '127.0.0.1', '', '1459852940', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('97', 'admin', '1', '127.0.0.1', '', '1459914372', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('98', 'admin', '1', '127.0.0.1', '', '1459925121', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('99', 'admin', '1', '127.0.0.1', '', '1459997215', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('100', 'admin', '1', '127.0.0.1', '', '1459999008', '朱先生', '改变了用户组的权限：学校');
INSERT INTO `lv_action_log` VALUES ('101', 'admin', '1', '127.0.0.1', '', '1459999023', '朱先生', '改变了用户组的权限：学校');
INSERT INTO `lv_action_log` VALUES ('102', 'admin', '1', '127.0.0.1', '', '1459999105', '朱先生', '改变了用户组的权限：学校');
INSERT INTO `lv_action_log` VALUES ('103', 'admin', '1', '127.0.0.1', '', '1459999588', '朱先生', '改变了用户组的权限：学校');
INSERT INTO `lv_action_log` VALUES ('104', 'admin', '1', '127.0.0.1', '', '1460009042', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('105', 'admin', '1', '127.0.0.1', '', '1460019986', '朱先生', '登录系统成功');

-- ----------------------------
-- Table structure for lv_agency
-- ----------------------------
DROP TABLE IF EXISTS `lv_agency`;
CREATE TABLE `lv_agency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `yb_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '机构在易班库的ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '机构类型 1：学校，2：省厅',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '机构名',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lv_agency
-- ----------------------------
INSERT INTO `lv_agency` VALUES ('523', '523', '0', '1', '中国人民大学', '1');
INSERT INTO `lv_agency` VALUES ('1001', '1001', '29002', '1', '清华大学', '1');
INSERT INTO `lv_agency` VALUES ('1002', '1002', '0', '1', '北京大学', '1');
INSERT INTO `lv_agency` VALUES ('29001', '29001', '29002', '1', '中国科学技术大学', '1');
INSERT INTO `lv_agency` VALUES ('29002', '0', '0', '2', '湖南省教育厅', '1');

-- ----------------------------
-- Table structure for lv_group
-- ----------------------------
DROP TABLE IF EXISTS `lv_group`;
CREATE TABLE `lv_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL COMMENT '用户组名',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '用户组等级，低等级的不能对高等级的用户做修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of lv_group
-- ----------------------------
INSERT INTO `lv_group` VALUES ('1', '管理员', '管理所有资源', '1', '0');
INSERT INTO `lv_group` VALUES ('3', '游客', '仅有浏览功能', '1', '9');
INSERT INTO `lv_group` VALUES ('4', '学校', '学校用户权限', '1', '8');
INSERT INTO `lv_group` VALUES ('5', '省厅', '省厅用户组', '1', '7');

-- ----------------------------
-- Table structure for lv_hotspot
-- ----------------------------
DROP TABLE IF EXISTS `lv_hotspot`;
CREATE TABLE `lv_hotspot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) DEFAULT '' COMMENT '热点名称',
  `agency_id` int(10) unsigned DEFAULT '0' COMMENT '学校ID',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lv_hotspot
-- ----------------------------
INSERT INTO `lv_hotspot` VALUES ('5', '饭堂', '29001', '1');
INSERT INTO `lv_hotspot` VALUES ('6', '图书馆', '29001', '1');
INSERT INTO `lv_hotspot` VALUES ('9', '教学楼', '1002', '1');
INSERT INTO `lv_hotspot` VALUES ('10', 'test', '29001', '1');

-- ----------------------------
-- Table structure for lv_permission
-- ----------------------------
DROP TABLE IF EXISTS `lv_permission`;
CREATE TABLE `lv_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL COMMENT '模块',
  `class` varchar(255) NOT NULL COMMENT '类',
  `action` varchar(255) NOT NULL COMMENT '函数',
  `name` varchar(255) NOT NULL COMMENT '节点的名字',
  `display` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为显示为菜单，0则不显示',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '节点的父节点，此值一般用于输出树形结构，0则为顶级',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `level` tinyint(2) NOT NULL DEFAULT '1' COMMENT '第几级菜单',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `add_time` bigint(20) NOT NULL COMMENT '增加的日期',
  PRIMARY KEY (`id`),
  KEY `module` (`module`) USING BTREE,
  KEY `class` (`class`) USING BTREE,
  KEY `action` (`action`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='权限节点表';

-- ----------------------------
-- Records of lv_permission
-- ----------------------------
INSERT INTO `lv_permission` VALUES ('1', 'foundation', '系统管理', '系统管理', '系统管理', '1', '0', '0', '1', '系统管理页面，不作权限验证，只用做菜单显示', '0');
INSERT INTO `lv_permission` VALUES ('2', 'foundation', 'group', 'index', '用户组管理', '1', '67', '2', '3', '用户组管理页面', '0');
INSERT INTO `lv_permission` VALUES ('3', 'foundation', 'acl', 'index', '功能管理', '1', '67', '1', '3', '功能管理页面', '0');
INSERT INTO `lv_permission` VALUES ('4', 'foundation', 'user', 'index', '用户管理', '1', '67', '3', '3', '用户管理页面', '0');
INSERT INTO `lv_permission` VALUES ('20', 'foundation', 'user', 'add', '增加用户', '0', '4', '0', '4', '增加一个用户', '0');
INSERT INTO `lv_permission` VALUES ('23', 'foundation', 'group', 'add', '增加用户组', '0', '2', '0', '4', '增加用户组', '1406882443');
INSERT INTO `lv_permission` VALUES ('24', 'foundation', 'group', 'edit', '用户组编辑', '0', '2', '0', '4', '用户组编辑', '1406882515');
INSERT INTO `lv_permission` VALUES ('25', 'foundation', 'group', 'delete', '用户组删除', '0', '2', '0', '4', '用户组删除、批量删除', '1406882542');
INSERT INTO `lv_permission` VALUES ('26', 'foundation', 'acl', 'group', '用户组权限管理', '0', '2', '0', '4', '用户组权限管理', '1406882568');
INSERT INTO `lv_permission` VALUES ('27', 'foundation', 'user', 'edit', '用户编辑', '0', '4', '0', '4', '用户编辑', '1406882640');
INSERT INTO `lv_permission` VALUES ('28', 'foundation', 'user', 'delete', '用户删除', '0', '4', '0', '4', '用户删除', '1406882664');
INSERT INTO `lv_permission` VALUES ('29', 'foundation', 'acl', 'user', '用户权限管理', '0', '4', '3', '4', '用户权限管理、设置用户权限', '1406882698');
INSERT INTO `lv_permission` VALUES ('30', 'foundation', 'acl', 'add', '增加功能菜单', '0', '3', '0', '4', '增加功能菜单', '1406882729');
INSERT INTO `lv_permission` VALUES ('31', 'foundation', 'acl', 'edit', '功能菜单编辑', '0', '3', '0', '4', '功能菜单编辑', '1406882754');
INSERT INTO `lv_permission` VALUES ('32', 'foundation', 'acl', 'delete', '功能菜单删除', '0', '3', '0', '4', '功能菜单删除', '1406882775');
INSERT INTO `lv_permission` VALUES ('33', 'foundation', 'acl', 'sort', '功能菜单排序', '0', '3', '0', '4', '功能菜单排序', '1406882815');
INSERT INTO `lv_permission` VALUES ('53', 'foundation', 'log', 'action', '操作日志', '1', '68', '0', '3', '查看操作日志', '1433319136');
INSERT INTO `lv_permission` VALUES ('67', '用户与权限管理', '用户与权限管理', '用户与权限管理', '用户与权限管理', '1', '1', '3', '2', '包括功能用户管理、用户组管理、功能管理，权限管理。', '1436147892');
INSERT INTO `lv_permission` VALUES ('68', '系统日志', '系统日志', '系统日志', '系统日志', '1', '1', '1', '2', '主要是各类的系统日志', '1436147908');
INSERT INTO `lv_permission` VALUES ('83', 'foundation', 'agency', 'index', '机构管理', '1', '85', '0', '3', '', '1459237395');
INSERT INTO `lv_permission` VALUES ('84', 'foundation', 'hotspot', 'index', '热点管理', '1', '85', '0', '3', '', '1459237571');
INSERT INTO `lv_permission` VALUES ('85', 'foundation', '学校管理', '热点管理', 'WIFI功能管理', '1', '1', '2', '2', '', '1459238422');
INSERT INTO `lv_permission` VALUES ('86', 'foundation', 'agency', 'edit', '机构编辑', '0', '83', '0', '4', '', '1459323044');
INSERT INTO `lv_permission` VALUES ('87', 'foundation', 'agency', 'add', '新增机构', '0', '83', '0', '4', '', '1459323094');
INSERT INTO `lv_permission` VALUES ('88', 'foundation', 'agency', 'delete', '删除机构', '0', '83', '0', '4', '', '1459323937');
INSERT INTO `lv_permission` VALUES ('89', 'foundation', 'hotspot', 'add', '添加热点', '0', '84', '0', '4', '', '1459325610');
INSERT INTO `lv_permission` VALUES ('90', 'foundation', 'hotspot', 'edit', '编辑热点', '0', '84', '0', '4', '', '1459325632');
INSERT INTO `lv_permission` VALUES ('91', 'foundation', 'hotspot', 'delete', '删除热点', '0', '84', '0', '4', '', '1459325651');
INSERT INTO `lv_permission` VALUES ('92', 'foundation', 'report', 'index', '数据报表', '1', '85', '0', '3', '', '1459403714');

-- ----------------------------
-- Table structure for lv_report
-- ----------------------------
DROP TABLE IF EXISTS `lv_report`;
CREATE TABLE `lv_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hotspot_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '热点ID',
  `agency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学校ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `ybuser_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '易班用户ID',
  `ybuser_name` varchar(20) NOT NULL DEFAULT '' COMMENT '易班用户名',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间戳',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `desc` varchar(50) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `hotspot_id` (`hotspot_id`),
  KEY `school_id` (`agency_id`),
  KEY `login_time` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lv_report
-- ----------------------------
INSERT INTO `lv_report` VALUES ('1', '5', '1002', '1', '5002370', '张三', '1458424831', '1', '登录成功');
INSERT INTO `lv_report` VALUES ('2', '6', '523', '3', '5002322', 'testzxp', '1459424831', '0', '登录失败，网络连接失败');
INSERT INTO `lv_report` VALUES ('3', '5', '29001', '2', '5002343', '李四', '1459424831', '1', '登录成功');
INSERT INTO `lv_report` VALUES ('4', '6', '1002', '1', '5002370', '朱某人', '1459414831', '1', '登录成功');
INSERT INTO `lv_report` VALUES ('5', '5', '523', '1', '5002312', 'testzxp', '1459424831', '0', '登录成功');
INSERT INTO `lv_report` VALUES ('6', '5', '1001', '0', '5002370', '张三', '1457424831', '1', '登录成功');
INSERT INTO `lv_report` VALUES ('7', '5', '29001', '3', '5002370', 'testzxp', '1459414831', '0', '登录失败，网络连接失败');
INSERT INTO `lv_report` VALUES ('8', '6', '1002', '2', '5002332', '李四', '1459424831', '0', '登录失败，网络连接失败');
INSERT INTO `lv_report` VALUES ('9', '5', '1002', '1', '5002370', 'testzxp', '1459424831', '1', '登录失败，网络连接失败');
INSERT INTO `lv_report` VALUES ('10', '6', '29001', '2', '5002370', '张三', '1459414831', '0', '登录失败，网络连接失败');
INSERT INTO `lv_report` VALUES ('11', '6', '1002', '2', '5002332', '朱某人', '1459924831', '1', '登录失败，网络连接失败');
INSERT INTO `lv_report` VALUES ('12', '6', '1001', '3', '5002370', 'testzxp', '1459424831', '1', '登录失败，网络连接失败');
INSERT INTO `lv_report` VALUES ('13', '5', '1002', '2', '5002370', '张三', '1459414831', '0', '登录成功');
INSERT INTO `lv_report` VALUES ('14', '6', '29001', '2', '5002325', '李四', '1456424831', '1', '登录成功');
INSERT INTO `lv_report` VALUES ('15', '5', '1002', '3', '5002567', 'testzxp', '1459414831', '0', '登录成功');
INSERT INTO `lv_report` VALUES ('16', '6', '523', '1', '5002345', '朱某人', '1459424831', '0', '登录成功');

-- ----------------------------
-- Table structure for lv_users
-- ----------------------------
DROP TABLE IF EXISTS `lv_users`;
CREATE TABLE `lv_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '用户密码',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '真实性名',
  `token` varchar(100) NOT NULL DEFAULT '' COMMENT '用户注册时的密钥',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户注册的时间',
  `modify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户信息所修改的时间',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `agency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属机构ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户禁用0正常的1',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `password` (`password`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of lv_users
-- ----------------------------
INSERT INTO `lv_users` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '朱先生', 'oyzzO7YxmgJHlAfdK5HaZMscegJPcTrw5drPQRS6bjlfAkTB6NELPvqpc12q', '0', '0', '13000000000', '0', '1', '超级用户组', '127.0.0.1', '1460019986');
INSERT INTO `lv_users` VALUES ('4', 'guest', 'e10adc3949ba59abbe56e057f20f883e', '4', '王先生', '', '1458923381', '0', '18000000000', '523', '1', '仅供浏览', '127.0.0.1', '1459498727');
INSERT INTO `lv_users` VALUES ('5', 'sharlock', 'e10adc3949ba59abbe56e057f20f883e', '5', 'Mr.H', '', '1459230546', '0', '13015531953', '29002', '1', '', '127.0.0.1', '1459329535');
