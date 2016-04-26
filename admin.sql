/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : admin

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-04-26 17:00:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lv_access
-- ----------------------------
DROP TABLE IF EXISTS `lv_access`;
CREATE TABLE `lv_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色的ID',
  `acl_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '节点的ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '标识是角色还是用户 1：角色 2：用户',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `node_id` (`acl_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of lv_access
-- ----------------------------
INSERT INTO `lv_access` VALUES ('693', '3', '1', '1');
INSERT INTO `lv_access` VALUES ('694', '3', '67', '1');
INSERT INTO `lv_access` VALUES ('695', '3', '2', '1');
INSERT INTO `lv_access` VALUES ('696', '3', '25', '1');
INSERT INTO `lv_access` VALUES ('697', '5', '1', '1');
INSERT INTO `lv_access` VALUES ('698', '5', '67', '1');
INSERT INTO `lv_access` VALUES ('699', '5', '4', '1');
INSERT INTO `lv_access` VALUES ('700', '5', '29', '1');
INSERT INTO `lv_access` VALUES ('701', '5', '68', '1');
INSERT INTO `lv_access` VALUES ('702', '5', '53', '1');
INSERT INTO `lv_access` VALUES ('711', '5', '1', '2');
INSERT INTO `lv_access` VALUES ('712', '5', '67', '2');
INSERT INTO `lv_access` VALUES ('713', '5', '2', '2');
INSERT INTO `lv_access` VALUES ('714', '5', '26', '2');
INSERT INTO `lv_access` VALUES ('715', '5', '4', '2');
INSERT INTO `lv_access` VALUES ('716', '5', '27', '2');
INSERT INTO `lv_access` VALUES ('717', '1', '1', '1');
INSERT INTO `lv_access` VALUES ('718', '1', '67', '1');
INSERT INTO `lv_access` VALUES ('719', '1', '2', '1');
INSERT INTO `lv_access` VALUES ('720', '1', '25', '1');
INSERT INTO `lv_access` VALUES ('721', '1', '4', '1');
INSERT INTO `lv_access` VALUES ('722', '1', '20', '1');
INSERT INTO `lv_access` VALUES ('723', '1', '1', '2');
INSERT INTO `lv_access` VALUES ('724', '1', '67', '2');
INSERT INTO `lv_access` VALUES ('725', '1', '4', '2');
INSERT INTO `lv_access` VALUES ('726', '1', '29', '2');

-- ----------------------------
-- Table structure for lv_acl
-- ----------------------------
DROP TABLE IF EXISTS `lv_acl`;
CREATE TABLE `lv_acl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '模块',
  `class` varchar(20) NOT NULL DEFAULT '' COMMENT '类',
  `action` varchar(20) NOT NULL DEFAULT '' COMMENT '函数',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '节点的名字',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1为显示为菜单，0则不显示',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父节点，0：顶级',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '第几级菜单',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '增加的日期',
  PRIMARY KEY (`id`),
  KEY `module` (`module`) USING BTREE,
  KEY `class` (`class`) USING BTREE,
  KEY `action` (`action`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='权限节点表';

-- ----------------------------
-- Records of lv_acl
-- ----------------------------
INSERT INTO `lv_acl` VALUES ('1', 'admin', '无', '无', '系统管理', '1', '1', '0', '1', '系统管理页面，不作权限验证，只用做菜单显示', '0');
INSERT INTO `lv_acl` VALUES ('2', 'admin', 'role', 'index', '角色管理', '1', '67', '998', '3', '用户组管理页面', '0');
INSERT INTO `lv_acl` VALUES ('3', 'admin', 'acl', 'index', '功能管理', '1', '67', '999', '3', '功能管理页面', '0');
INSERT INTO `lv_acl` VALUES ('4', 'admin', 'user', 'index', '用户管理', '1', '67', '6', '3', '用户管理页面', '0');
INSERT INTO `lv_acl` VALUES ('20', 'admin', 'user', 'add', '增加用户', '0', '4', '0', '4', '增加一个用户', '0');
INSERT INTO `lv_acl` VALUES ('23', 'admin', 'role', 'add', '增加用户组', '0', '2', '32', '4', '增加用户组', '1406882443');
INSERT INTO `lv_acl` VALUES ('24', 'admin', 'role', 'edit', '用户组编辑', '0', '2', '0', '4', '用户组编辑', '1406882515');
INSERT INTO `lv_acl` VALUES ('25', 'admin', 'role', 'delete', '用户组删除', '0', '2', '42', '4', '用户组删除、批量删除', '1406882542');
INSERT INTO `lv_acl` VALUES ('26', 'admin', 'acl', 'group', '用户组权限管理', '0', '2', '0', '4', '用户组权限管理', '1406882568');
INSERT INTO `lv_acl` VALUES ('27', 'admin', 'user', 'edit', '用户编辑', '0', '4', '276', '4', '用户编辑', '1406882640');
INSERT INTO `lv_acl` VALUES ('28', 'admin', 'user', 'delete', '用户删除', '0', '4', '0', '4', '用户删除', '1406882664');
INSERT INTO `lv_acl` VALUES ('29', 'admin', 'acl', 'user', '用户权限管理', '0', '4', '364', '4', '用户权限管理、设置用户权限', '1406882698');
INSERT INTO `lv_acl` VALUES ('30', 'admin', 'acl', 'add', '增加功能菜单', '0', '3', '5', '4', '增加功能菜单', '1406882729');
INSERT INTO `lv_acl` VALUES ('31', 'admin', 'acl', 'edit', '功能菜单编辑', '0', '3', '324', '4', '功能菜单编辑', '1406882754');
INSERT INTO `lv_acl` VALUES ('32', 'admin', 'acl', 'delete', '功能菜单删除', '0', '3', '0', '4', '功能菜单删除', '1406882775');
INSERT INTO `lv_acl` VALUES ('33', 'admin', 'acl', 'sort', '功能菜单排序', '0', '3', '2', '4', '功能菜单排序', '1406882815');
INSERT INTO `lv_acl` VALUES ('53', 'admin', 'log', 'action', '操作日志', '1', '68', '67', '3', '查看操作日志', '1433319136');
INSERT INTO `lv_acl` VALUES ('67', 'admin', '无', '无', '用户与权限管理', '1', '1', '3', '2', '包括功能用户管理、用户组管理、功能管理，权限管理。', '1436147892');
INSERT INTO `lv_acl` VALUES ('68', 'admin', '无', '无', '系统日志', '1', '1', '1', '2', '主要是各类的系统日志', '1436147908');

-- ----------------------------
-- Table structure for lv_action_log
-- ----------------------------
DROP TABLE IF EXISTS `lv_action_log`;
CREATE TABLE `lv_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '登录的用户名',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录的用户ID',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `ip_address` varchar(100) NOT NULL DEFAULT '' COMMENT 'ip所属的地区',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `realname` varchar(30) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '记录的内容',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `addtime` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

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
INSERT INTO `lv_action_log` VALUES ('106', 'admin', '1', '127.0.0.1', '', '1460021037', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('107', 'admin', '1', '127.0.0.1', '', '1460021486', '朱先生', '改变了用户组的权限：学校');
INSERT INTO `lv_action_log` VALUES ('108', 'guest', '4', '127.0.0.1', '', '1460021500', '王先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('109', 'admin', '1', '127.0.0.1', '', '1460021568', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('110', 'admin', '1', '127.0.0.1', '', '1460083283', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('111', 'admin', '1', '127.0.0.1', '', '1460351517', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('112', 'admin', '1', '127.0.0.1', '', '1460356986', '朱先生', '改变了用户组的权限：学校');
INSERT INTO `lv_action_log` VALUES ('113', 'guest', '4', '127.0.0.1', '', '1460356997', '王先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('114', 'admin', '1', '127.0.0.1', '', '1460357030', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('115', 'admin', '1', '127.0.0.1', '', '1460364999', '朱先生', '登录系统成功');

-- ----------------------------
-- Table structure for lv_role
-- ----------------------------
DROP TABLE IF EXISTS `lv_role`;
CREATE TABLE `lv_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组名',
  `mark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of lv_role
-- ----------------------------
INSERT INTO `lv_role` VALUES ('1', '管理员', '管理所有资源', '1');
INSERT INTO `lv_role` VALUES ('3', '游客', '仅有浏览功能', '1');
INSERT INTO `lv_role` VALUES ('4', '编辑', '内容管理员', '1');
INSERT INTO `lv_role` VALUES ('5', '测试', '功能测试员', '1');

-- ----------------------------
-- Table structure for lv_users
-- ----------------------------
DROP TABLE IF EXISTS `lv_users`;
CREATE TABLE `lv_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '用户密码',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '真实性名',
  `access_token` varchar(100) NOT NULL DEFAULT '' COMMENT '用户注册时的密钥',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户注册的时间',
  `modify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户信息所修改的时间',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户禁用0正常的1',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `password` (`password`) USING BTREE,
  KEY `group_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of lv_users
-- ----------------------------
INSERT INTO `lv_users` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '朱先生', 'oyzzO7YxmgJHlAfdK5HaZMscegJPcTrw5drPQRS6bjlfAkTB6NELPvqpc12q', '0', '0', '13000000000', '1', '超级用户组', '127.0.0.1', '1460364999');
INSERT INTO `lv_users` VALUES ('4', 'guest', 'e10adc3949ba59abbe56e057f20f883e', '4', '王先生', '', '1458923381', '0', '18000000000', '1', '仅供浏览', '127.0.0.1', '1460356997');
INSERT INTO `lv_users` VALUES ('5', 'sharlock', 'e10adc3949ba59abbe56e057f20f883e', '5', 'Mr.H', '', '1459230546', '0', '13015531953', '1', '', '127.0.0.1', '1459329535');
