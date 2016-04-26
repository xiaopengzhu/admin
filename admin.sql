/*
Navicat MySQL Data Transfer

Source Server         : 新开发机
Source Server Version : 50623
Source Host           : 10.21.168.185:3306
Source Database       : wifi

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2016-04-26 17:17:39
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
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of lv_access
-- ----------------------------
INSERT INTO `lv_access` VALUES ('636', '4', '1', '1');
INSERT INTO `lv_access` VALUES ('637', '4', '67', '1');
INSERT INTO `lv_access` VALUES ('638', '4', '4', '1');
INSERT INTO `lv_access` VALUES ('639', '4', '20', '1');
INSERT INTO `lv_access` VALUES ('640', '4', '3', '1');
INSERT INTO `lv_access` VALUES ('641', '4', '32', '1');
INSERT INTO `lv_access` VALUES ('642', '4', '1', '2');
INSERT INTO `lv_access` VALUES ('643', '4', '67', '2');
INSERT INTO `lv_access` VALUES ('644', '4', '3', '2');
INSERT INTO `lv_access` VALUES ('645', '4', '30', '2');
INSERT INTO `lv_access` VALUES ('646', '4', '85', '2');
INSERT INTO `lv_access` VALUES ('647', '4', '83', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of lv_action_log
-- ----------------------------
INSERT INTO `lv_action_log` VALUES ('135', 'admin', '1', '127.0.0.1', '', '1461579242', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('136', 'admin', '1', '127.0.0.1', '', '1461579586', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('137', 'admin', '1', '127.0.0.1', '', '1461580095', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('138', 'admin', '1', '127.0.0.1', '', '1461634935', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('139', 'admin', '1', '127.0.0.1', '', '1461635579', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('140', 'admin', '1', '127.0.0.1', '', '1461636391', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('141', 'admin', '1', '127.0.0.1', '', '1461636548', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('142', 'admin', '1', '127.0.0.1', '', '1461647582', '朱先生', '登录系统成功');
INSERT INTO `lv_action_log` VALUES ('143', 'admin', '1', '127.0.0.1', '', '1461657344', '朱先生', '登录系统成功');

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
-- Table structure for lv_content
-- ----------------------------
DROP TABLE IF EXISTS `lv_content`;
CREATE TABLE `lv_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `position_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '位置ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `content` text COMMENT '内容',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lv_content
-- ----------------------------
INSERT INTO `lv_content` VALUES ('10', '3', '测试内容', '/upload/content/146163754741837.png', 'http://www.baidu.com', '0', '<p><code style=\"box-sizing: border-box; border: 0px; font-family: Monaco, Menlo, Consolas, &#39;Courier New&#39;, monospace; font-size: 12.6px; margin: 0px; outline: 0px; padding: 2px 4px; vertical-align: baseline; font-stretch: normal; color: rgb(244, 100, 95); white-space: normal; border-radius: 4px; background-color: rgb(249, 242, 244);\">action</code><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, &#39;WenQuanYi Micro Hei&#39;, &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, sans-serif; font-size: 14px; line-height: 20px; background-color: rgb(255, 255, 255);\">&nbsp;函数为给定</span><a href=\"http://laravelacademy.org/post/2816.html\" style=\"box-sizing: border-box; border: 0px; font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, &#39;WenQuanYi Micro Hei&#39;, &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, sans-serif; font-size: 14px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: rgb(244, 100, 95); text-decoration: none; line-height: 20px; white-space: normal; background: rgb(255, 255, 255);\">控制器</a><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, &#39;WenQuanYi Micro Hei&#39;, &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, sans-serif; font-size: 14px; line-height: 20px; background-color: rgb(255, 255, 255);\">动作生成URL，你不需要传递完整的命名空间到该控制器，传递相对于命名空间</span><code style=\"box-sizing: border-box; border: 0px; font-family: Monaco, Menlo, Consolas, &#39;Courier New&#39;, monospace; font-size: 12.6px; margin: 0px; outline: 0px; padding: 2px 4px; vertical-align: baseline; font-stretch: normal; color: rgb(244, 100, 95); white-space: normal; border-radius: 4px; background-color: rgb(249, 242, 244);\">App\\Http\\Controllers</code><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, &#39;WenQuanYi Micro Hei&#39;, &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, sans-serif; font-size: 14px; line-height: 20px; background-color: rgb(255, 255, 255);\">&nbsp;的类名即可：</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, &#39;WenQuanYi Micro Hei&#39;, &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, sans-serif; font-size: 14px; line-height: 20px; background-color: rgb(255, 255, 255);\"><br/></span></p><p><img src=\"/upload/content/20160426/1461637545756538.gif\" title=\"1461637545756538.gif\" alt=\"460.gif\"/></p>', '1');

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
INSERT INTO `lv_group` VALUES ('1', '管理员', '管理所有资源', '0', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='权限节点表';

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
INSERT INTO `lv_permission` VALUES ('93', 'foundation', '无', '无', '位置与内容管理', '1', '1', '4', '2', '', '1461060450');
INSERT INTO `lv_permission` VALUES ('94', 'foundation', 'position', 'index', '位置管理', '1', '93', '0', '3', '', '1461118449');
INSERT INTO `lv_permission` VALUES ('95', 'foundation', 'position', 'add', '添加位置', '0', '94', '0', '4', '', '1461118542');
INSERT INTO `lv_permission` VALUES ('96', 'foundation', 'position', 'edit', '编辑位置', '0', '94', '0', '4', '', '1461118564');
INSERT INTO `lv_permission` VALUES ('97', 'foundation', 'position', 'delete', '删除位置', '0', '94', '0', '4', '', '1461118579');
INSERT INTO `lv_permission` VALUES ('98', 'foundation', 'content', 'index', '内容管理', '1', '93', '0', '3', '', '1461118596');
INSERT INTO `lv_permission` VALUES ('99', 'foundation', 'content', 'add', '添加内容', '0', '98', '0', '4', '', '1461118639');
INSERT INTO `lv_permission` VALUES ('100', 'foundation', 'content', 'edit', '编辑内容', '0', '98', '0', '4', '', '1461118686');
INSERT INTO `lv_permission` VALUES ('101', 'foundation', 'content', 'delete', '删除内容', '0', '98', '0', '4', '', '1461118704');

-- ----------------------------
-- Table structure for lv_position
-- ----------------------------
DROP TABLE IF EXISTS `lv_position`;
CREATE TABLE `lv_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `tag` varchar(20) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '显示名',
  `max` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '上限',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1：页 2：块',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lv_position
-- ----------------------------
INSERT INTO `lv_position` VALUES ('1', '0', 'INDEX', '首页', '4', '1', '', '1');
INSERT INTO `lv_position` VALUES ('3', '1', 'BANNER', '今日头条', '4', '2', '图片大小 400*600 要有正文', '1');

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
INSERT INTO `lv_users` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '朱先生', 'oyzzO7YxmgJHlAfdK5HaZMscegJPcTrw5drPQRS6bjlfAkTB6NELPvqpc12q', '0', '0', '13000000000', '0', '1', '超级用户组', '127.0.0.1', '1461657344');
INSERT INTO `lv_users` VALUES ('4', 'guest', 'e10adc3949ba59abbe56e057f20f883e', '4', '王先生', '', '1458923381', '0', '18000000000', '523', '1', '仅供浏览', '127.0.0.1', '1460356997');
INSERT INTO `lv_users` VALUES ('5', 'sharlock', 'e10adc3949ba59abbe56e057f20f883e', '5', 'Mr.H', '', '1459230546', '0', '13015531953', '29002', '1', '', '127.0.0.1', '1459329535');
