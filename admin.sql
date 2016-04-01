-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-03-25 17:38:15
-- 服务器版本： 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin`
--

-- --------------------------------------------------------

--
-- 表的结构 `lv_access`
--

CREATE TABLE `lv_access` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL COMMENT '角色的ID',
  `permission_id` int(11) NOT NULL COMMENT '节点的ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '标识是用户组还是用户1为用户组2为用户,默认为用户组'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

--
-- 转存表中的数据 `lv_access`
--

INSERT INTO `lv_access` (`id`, `role_id`, `permission_id`, `type`) VALUES
(581, 3, 1, 1),
(582, 3, 67, 1),
(583, 3, 4, 1),
(584, 3, 29, 1),
(585, 3, 2, 1),
(586, 3, 26, 1),
(587, 3, 3, 1),
(588, 3, 33, 1),
(589, 3, 68, 1),
(590, 3, 53, 1);

-- --------------------------------------------------------

--
-- 表的结构 `lv_action_log`
--

CREATE TABLE `lv_action_log` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '登录的用户名',
  `user_id` int(11) NOT NULL COMMENT '登录的用户ID',
  `ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `ip_address` varchar(255) NOT NULL COMMENT 'ip所属的地区',
  `add_time` int(11) NOT NULL,
  `realname` varchar(30) NOT NULL COMMENT '真实姓名',
  `content` text NOT NULL COMMENT '记录的内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

--
-- 转存表中的数据 `lv_action_log`
--

INSERT INTO `lv_action_log` (`id`, `username`, `user_id`, `ip`, `ip_address`, `add_time`, `realname`, `content`) VALUES
(1, 'admin', 1, '127.0.0.1', '', 1458917465, '管理员', '编辑了用户组：管理员'),
(2, 'admin', 1, '127.0.0.1', '', 1458917988, '管理员', '登录系统成功'),
(3, 'admin', 1, '127.0.0.1', '', 1458918109, '管理员', '登录系统成功'),
(4, 'admin', 1, '127.0.0.1', '', 1458919307, '管理员', '登录系统成功'),
(5, 'admin', 1, '127.0.0.1', '', 1458921762, '管理员', '登录系统成功'),
(6, 'admin', 1, '127.0.0.1', '', 1458923119, '管理员', '登录系统成功'),
(7, 'admin', 1, '127.0.0.1', '', 1458923149, '管理员', '编辑了系统用户：admin'),
(8, 'admin', 1, '127.0.0.1', '', 1458923173, '管理员', '编辑了系统用户：admin'),
(9, 'admin', 1, '127.0.0.1', '', 1458923210, '管理员', '增加了新的用户组：游客'),
(10, 'admin', 1, '127.0.0.1', '', 1458923233, '管理员', '改变了用户组的权限：管理员'),
(11, 'admin', 1, '127.0.0.1', '', 1458923381, '管理员', '增加了新的系统用户：guest'),
(12, 'guest', 4, '127.0.0.1', '', 1458923395, '王先生', '登录系统成功'),
(13, 'admin', 1, '127.0.0.1', '', 1458923402, '朱先生', '登录系统成功'),
(14, 'admin', 1, '127.0.0.1', '', 1458923425, '朱先生', '改变了用户组的权限：游客'),
(15, 'guest', 4, '127.0.0.1', '', 1458923535, '王先生', '登录系统成功'),
(16, 'admin', 1, '127.0.0.1', '', 1458923581, '朱先生', '登录系统成功'),
(17, 'admin', 1, '127.0.0.1', '', 1458923604, '朱先生', '改变了用户的权限：guest'),
(18, 'admin', 1, '127.0.0.1', '', 1458923615, '朱先生', '改变了用户的权限：guest'),
(19, 'admin', 1, '127.0.0.1', '', 1458923632, '朱先生', '改变了用户的权限：guest'),
(20, 'guest', 4, '127.0.0.1', '', 1458923683, '王先生', '登录系统成功'),
(21, 'admin', 1, '127.0.0.1', '', 1458923703, '朱先生', '登录系统成功'),
(22, 'admin', 1, '127.0.0.1', '', 1458923726, '朱先生', '改变了用户的权限：guest'),
(23, 'guest', 4, '127.0.0.1', '', 1458923743, '王先生', '登录系统成功'),
(24, 'admin', 1, '127.0.0.1', '', 1458923755, '朱先生', '登录系统成功');

-- --------------------------------------------------------

--
-- 表的结构 `lv_group`
--

CREATE TABLE `lv_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL COMMENT '用户组名',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '用户组等级，低等级的不能对高等级的用户做修改'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组表';

--
-- 转存表中的数据 `lv_group`
--

INSERT INTO `lv_group` (`id`, `group_name`, `mark`, `status`, `level`) VALUES
(1, '管理员', '可以管理网站的所有数据，不受任何限制', 1, 1),
(3, '游客', '仅有浏览功能', 1, 9);

-- --------------------------------------------------------

--
-- 表的结构 `lv_permission`
--

CREATE TABLE `lv_permission` (
  `id` int(11) NOT NULL,
  `module` varchar(255) NOT NULL COMMENT '模块',
  `class` varchar(255) NOT NULL COMMENT '类',
  `action` varchar(255) NOT NULL COMMENT '函数',
  `name` varchar(255) NOT NULL COMMENT '节点的名字',
  `display` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为显示为菜单，0则不显示',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '节点的父节点，此值一般用于输出树形结构，0则为顶级',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `level` tinyint(2) NOT NULL DEFAULT '1' COMMENT '第几级菜单',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `add_time` bigint(20) NOT NULL COMMENT '增加的日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限节点表';

--
-- 转存表中的数据 `lv_permission`
--

INSERT INTO `lv_permission` (`id`, `module`, `class`, `action`, `name`, `display`, `pid`, `sort`, `level`, `mark`, `add_time`) VALUES
(1, 'foundation', '系统管理', '系统管理', '系统管理', 1, 0, 0, 1, '系统管理页面，不作权限验证，只用做菜单显示', 0),
(2, 'foundation', 'group', 'index', '用户组管理', 1, 67, 2, 3, '用户组管理页面', 0),
(3, 'foundation', 'acl', 'index', '功能管理', 1, 67, 1, 3, '功能管理页面', 0),
(4, 'foundation', 'user', 'index', '用户管理', 1, 67, 3, 3, '用户管理页面', 0),
(20, 'foundation', 'user', 'add', '增加用户', 0, 4, 0, 4, '增加一个用户', 0),
(23, 'foundation', 'group', 'add', '增加用户组', 0, 2, 0, 4, '增加用户组', 1406882443),
(24, 'foundation', 'group', 'edit', '用户组编辑', 0, 2, 0, 4, '用户组编辑', 1406882515),
(25, 'foundation', 'group', 'delete', '用户组删除', 0, 2, 0, 4, '用户组删除、批量删除', 1406882542),
(26, 'foundation', 'acl', 'group', '用户组权限管理', 0, 2, 0, 4, '用户组权限管理', 1406882568),
(27, 'foundation', 'user', 'edit', '用户编辑', 0, 4, 0, 4, '用户编辑', 1406882640),
(28, 'foundation', 'user', 'delete', '用户删除', 0, 4, 0, 4, '用户删除', 1406882664),
(29, 'foundation', 'acl', 'user', '用户权限管理', 0, 4, 0, 4, '用户权限管理、设置用户权限', 1406882698),
(30, 'foundation', 'acl', 'add', '增加功能菜单', 0, 3, 0, 4, '增加功能菜单', 1406882729),
(31, 'foundation', 'acl', 'edit', '功能菜单编辑', 0, 3, 0, 4, '功能菜单编辑', 1406882754),
(32, 'foundation', 'acl', 'delete', '功能菜单删除', 0, 3, 0, 4, '功能菜单删除', 1406882775),
(33, 'foundation', 'acl', 'sort', '功能菜单排序', 0, 3, 0, 4, '功能菜单排序', 1406882815),
(53, 'foundation', 'log', 'action', '操作日志', 1, 68, 0, 3, '查看操作日志', 1433319136),
(67, '用户与权限管理', '用户与权限管理', '用户与权限管理', '用户与权限管理', 1, 1, 0, 2, '包括功能用户管理、用户组管理、功能管理，权限管理。', 1436147892),
(68, '系统日志', '系统日志', '系统日志', '系统日志', 1, 1, 0, 2, '主要是各类的系统日志', 1436147908);

-- --------------------------------------------------------

--
-- 表的结构 `lv_users`
--

CREATE TABLE `lv_users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `group_id` int(11) NOT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '' COMMENT '真实性名',
  `token` varchar(255) NOT NULL COMMENT '用户注册时的密钥',
  `add_time` bigint(20) NOT NULL COMMENT '用户注册的时间',
  `modify_time` bigint(20) NOT NULL COMMENT '用户信息所修改的时间',
  `mobile` varchar(11) NOT NULL COMMENT '手机',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户禁用0正常的1',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `last_login_ip` varchar(255) NOT NULL COMMENT '最后登录ip',
  `last_login_time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `lv_users`
--

INSERT INTO `lv_users` (`id`, `name`, `password`, `group_id`, `realname`, `token`, `add_time`, `modify_time`, `mobile`, `status`, `mark`, `last_login_ip`, `last_login_time`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, '朱先生', 'oyzzO7YxmgJHlAfdK5HaZMscegJPcTrw5drPQRS6bjlfAkTB6NELPvqpc12q', 0, 0, '13000000000', 1, '超级用户组', '127.0.0.1', 1458923755),
(4, 'guest', 'e10adc3949ba59abbe56e057f20f883e', 3, '王先生', '', 1458923381, 0, '18000000000', 1, '仅供浏览', '127.0.0.1', 1458923743);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lv_access`
--
ALTER TABLE `lv_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`) USING BTREE,
  ADD KEY `node_id` (`permission_id`) USING BTREE;

--
-- Indexes for table `lv_action_log`
--
ALTER TABLE `lv_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `username` (`username`) USING BTREE,
  ADD KEY `addtime` (`add_time`) USING BTREE;

--
-- Indexes for table `lv_group`
--
ALTER TABLE `lv_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lv_permission`
--
ALTER TABLE `lv_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`) USING BTREE,
  ADD KEY `class` (`class`) USING BTREE,
  ADD KEY `action` (`action`) USING BTREE;

--
-- Indexes for table `lv_users`
--
ALTER TABLE `lv_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `password` (`password`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `lv_access`
--
ALTER TABLE `lv_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=595;
--
-- 使用表AUTO_INCREMENT `lv_action_log`
--
ALTER TABLE `lv_action_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `lv_group`
--
ALTER TABLE `lv_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `lv_permission`
--
ALTER TABLE `lv_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- 使用表AUTO_INCREMENT `lv_users`
--
ALTER TABLE `lv_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
