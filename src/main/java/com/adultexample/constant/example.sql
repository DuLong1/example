/*
Navicat MySQL Data Transfer

Source Server         : news
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : example

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-03-24 17:02:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for s_cust
-- ----------------------------
DROP TABLE IF EXISTS `s_cust`;
CREATE TABLE `s_cust` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(20) DEFAULT NULL,
  `realName` varchar(20) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `regDate` varchar(20) DEFAULT NULL,
  `lastLoginDate` varchar(20) DEFAULT NULL,
  `emain` varchar(20) DEFAULT NULL,
  `nickName` varchar(20) DEFAULT NULL,
  `idcard` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_cust
-- ----------------------------
INSERT INTO `s_cust` VALUES ('7', '202cb962ac59075b964b07152d234b70', '0', null, '孟美岐', '1', '1998-10-15', '1573564455', '2017-07-19', '2020-02-20', '2233@qq.com', 'admin', '167876543213232145');
INSERT INTO `s_cust` VALUES ('8', 'b6d767d2f8ed5d21a44b0e5886680cb9', null, null, null, null, null, null, '2020-03-08', null, '12@qq.com', null, null);
INSERT INTO `s_cust` VALUES ('12', '202cb962ac59075b964b07152d234b70', null, null, null, null, null, '15735641625', '2020-03-08', null, null, null, null);
INSERT INTO `s_cust` VALUES ('13', '202cb962ac59075b964b07152d234b70', null, null, null, null, null, null, '2020-03-08', null, '12333@qq.com', null, null);

-- ----------------------------
-- Table structure for s_organization
-- ----------------------------
DROP TABLE IF EXISTS `s_organization`;
CREATE TABLE `s_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orgName` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `principalId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_organization
-- ----------------------------
INSERT INTO `s_organization` VALUES ('1', '人民出版社', '0', '2', '1');
INSERT INTO `s_organization` VALUES ('2', '浙江出版社', '0', '1', '1');
INSERT INTO `s_organization` VALUES ('3', '浙江教育局', '0', '2', '0');

-- ----------------------------
-- Table structure for s_resource
-- ----------------------------
DROP TABLE IF EXISTS `s_resource`;
CREATE TABLE `s_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceName` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_resource
-- ----------------------------
INSERT INTO `s_resource` VALUES ('1', '系统设置', null, '0', '2', null);
INSERT INTO `s_resource` VALUES ('2', '组织机构管理', 'org/data.action', '1', '1', null);
INSERT INTO `s_resource` VALUES ('3', '员工管理', 'user/data.action', '1', '2', null);
INSERT INTO `s_resource` VALUES ('4', '角色管理', 'role/data.action', '1', '3', null);
INSERT INTO `s_resource` VALUES ('5', '资源管理', 'resource/data.action', '1', '4', null);
INSERT INTO `s_resource` VALUES ('6', '内容管理', null, '0', '3', null);
INSERT INTO `s_resource` VALUES ('7', '类型管理', 'subject/data.action', '6', '1', null);
INSERT INTO `s_resource` VALUES ('8', '章节管理', 'chapter/data.action', '6', '2', null);
INSERT INTO `s_resource` VALUES ('9', '试题管理', 'question/data.action', '6', '3', null);
INSERT INTO `s_resource` VALUES ('10', '用户管理', null, '0', '4', null);
INSERT INTO `s_resource` VALUES ('11', '用户信息', 'cust/data.action', '10', '1', null);
INSERT INTO `s_resource` VALUES ('12', '试卷管理', 'paper/data.action', '6', '4', null);

-- ----------------------------
-- Table structure for s_role
-- ----------------------------
DROP TABLE IF EXISTS `s_role`;
CREATE TABLE `s_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_role
-- ----------------------------
INSERT INTO `s_role` VALUES ('1', '超级管理员', '1');
INSERT INTO `s_role` VALUES ('3', '普通管理员', '0');

-- ----------------------------
-- Table structure for s_roleresource
-- ----------------------------
DROP TABLE IF EXISTS `s_roleresource`;
CREATE TABLE `s_roleresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `resourceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_roleresource
-- ----------------------------
INSERT INTO `s_roleresource` VALUES ('1', '1', '1');
INSERT INTO `s_roleresource` VALUES ('2', '1', '2');
INSERT INTO `s_roleresource` VALUES ('3', '1', '3');
INSERT INTO `s_roleresource` VALUES ('4', '1', '4');
INSERT INTO `s_roleresource` VALUES ('5', '1', '5');
INSERT INTO `s_roleresource` VALUES ('6', '1', '6');
INSERT INTO `s_roleresource` VALUES ('7', '1', '7');
INSERT INTO `s_roleresource` VALUES ('8', '1', '8');
INSERT INTO `s_roleresource` VALUES ('9', '1', '9');
INSERT INTO `s_roleresource` VALUES ('10', '2', '1');
INSERT INTO `s_roleresource` VALUES ('18', '9', '4');
INSERT INTO `s_roleresource` VALUES ('19', '9', '1');
INSERT INTO `s_roleresource` VALUES ('20', '1', '10');
INSERT INTO `s_roleresource` VALUES ('21', '1', '11');
INSERT INTO `s_roleresource` VALUES ('22', '1', '12');

-- ----------------------------
-- Table structure for s_user
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_o_id` int(11) DEFAULT NULL,
  `realName` varchar(10) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `loginAccount` varchar(11) DEFAULT NULL,
  `pwd` varchar(300) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `lastLogin` varchar(20) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user
-- ----------------------------
INSERT INTO `s_user` VALUES ('1', '2', '孟美岐', '1', '15735641760', '1240070126', 'e10adc3949ba59abbe56e057f20f883e', '1', '2019-12-25', '1');
INSERT INTO `s_user` VALUES ('2', '1', '吴宣仪', '1', '137777', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '0', '2020-2-26', '1');

-- ----------------------------
-- Table structure for t_chapter
-- ----------------------------
DROP TABLE IF EXISTS `t_chapter`;
CREATE TABLE `t_chapter` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `subject_id` varchar(64) NOT NULL DEFAULT '' COMMENT '章节',
  `parent_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '父节点(-1:根目录，0:尾目录)',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '章节名称',
  `orders` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` varchar(10) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_chapter
-- ----------------------------
INSERT INTO `t_chapter` VALUES ('1', '5', '0', '网络规划与设计', '1', '0');
INSERT INTO `t_chapter` VALUES ('2', '5', '0', '网络构建', '2', '0');
INSERT INTO `t_chapter` VALUES ('3', '5', '0', '网络环境与应用系统的安装调试', '3', '0');
INSERT INTO `t_chapter` VALUES ('4', '5', '0', '网络安全技术与网络管理', '4', '0');
INSERT INTO `t_chapter` VALUES ('5', '5', '1', '网络需求分析', '1', '1');
INSERT INTO `t_chapter` VALUES ('6', '5', '1', '网络规划设计', '2', '0');
INSERT INTO `t_chapter` VALUES ('7', '5', '1', '网络设备及选型', '3', '0');
INSERT INTO `t_chapter` VALUES ('8', '5', '2', '局域网组网技术', '1', '0');
INSERT INTO `t_chapter` VALUES ('9', '5', '2', '路由器配置与使用', '2', '0');
INSERT INTO `t_chapter` VALUES ('10', '5', '3', '网络环境配置', '1', '0');
INSERT INTO `t_chapter` VALUES ('11', '5', '4', '网络安全', '1', '0');
INSERT INTO `t_chapter` VALUES ('16', '11', '0', '中级经济法总论', '1', '0');
INSERT INTO `t_chapter` VALUES ('17', '11', '0', ' 公司法律制度', '2', '1');
INSERT INTO `t_chapter` VALUES ('18', '11', '16', '经济法概述', '1', '0');
INSERT INTO `t_chapter` VALUES ('19', '11', '16', '经济仲裁与诉讼', '2', '0');
INSERT INTO `t_chapter` VALUES ('20', '11', '17', '公司的登记管理', '1', '1');
INSERT INTO `t_chapter` VALUES ('21', '11', '17', '有限责任公司', '2', '1');
INSERT INTO `t_chapter` VALUES ('22', '16', '0', '绪论', '5', '1');
INSERT INTO `t_chapter` VALUES ('23', '16', '22', '绪论第一节', '1', '1');
INSERT INTO `t_chapter` VALUES ('24', '16', '0', '语音', '0', '1');
INSERT INTO `t_chapter` VALUES ('25', '16', '0', '修辞', '0', '1');
INSERT INTO `t_chapter` VALUES ('26', '16', '24', '语音第一节', '0', '1');
INSERT INTO `t_chapter` VALUES ('27', '16', '25', '修辞第一节', '0', '1');
INSERT INTO `t_chapter` VALUES ('28', '16', '25', '修辞第二节', '0', '1');

-- ----------------------------
-- Table structure for t_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_collection`;
CREATE TABLE `t_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cusId` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `createDate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collection
-- ----------------------------
INSERT INTO `t_collection` VALUES ('16', '1', '19', '2020-03-08');
INSERT INTO `t_collection` VALUES ('31', '1', '22', '2020-03-08');
INSERT INTO `t_collection` VALUES ('34', '1', '1', '2020-03-08');
INSERT INTO `t_collection` VALUES ('35', '7', '19', '2020-03-08');
INSERT INTO `t_collection` VALUES ('36', '7', '1', '2020-03-08');
INSERT INTO `t_collection` VALUES ('37', '7', '22', '2020-03-08');
INSERT INTO `t_collection` VALUES ('38', '7', '24', '2020-03-11');
INSERT INTO `t_collection` VALUES ('39', '7', '32', '2020-03-11');
INSERT INTO `t_collection` VALUES ('40', '8', '1', '2020-03-17');
INSERT INTO `t_collection` VALUES ('41', '8', '2', '2020-03-17');

-- ----------------------------
-- Table structure for t_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_paper`;
CREATE TABLE `t_paper` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `subject_id` varchar(64) DEFAULT NULL,
  `creater_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `question_info` text COMMENT '题目类型，以逗号分割',
  `type` varchar(10) NOT NULL DEFAULT '0' COMMENT '类型(1:真题试卷,2:模拟试卷,3:押题预测,4:名校精品)',
  `year` varchar(5) NOT NULL DEFAULT '' COMMENT '年份',
  `down_hits` int(10) NOT NULL DEFAULT '0' COMMENT '下载数量',
  `open_hits` int(10) NOT NULL DEFAULT '0' COMMENT '打开数量',
  `point` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subject_id_index` (`subject_id`) USING BTREE,
  KEY `creater_id_index` (`creater_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_paper
-- ----------------------------
INSERT INTO `t_paper` VALUES ('1', '5', '1', '计算机二级真题模拟', '1,2,5,6,7,12,13,19,22', '1', '2020', '0', '0', '10.text');
INSERT INTO `t_paper` VALUES ('10', '5', '2', '测试44', '1,2,5', '1', '2020', '0', '0', '10.text');
INSERT INTO `t_paper` VALUES ('11', '16', '2', '汉语言模拟考试', '24,2532,33', '2', '2020', '0', '0', '11.text');
INSERT INTO `t_paper` VALUES ('12', '16', '2', '汉语言押题试卷', '24,25,26,27,32,33', '3', '2020', '0', '0', '12.text');
INSERT INTO `t_paper` VALUES ('13', '16', '2', '汉语言最终押题', '24,25,26,32', '3', '2020', '0', '0', '13.docx');
INSERT INTO `t_paper` VALUES ('17', '5', '2', '汉语言真题试卷', null, '1', '2013', '0', '0', '17.doc');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `question_type` varchar(1) NOT NULL DEFAULT '1' COMMENT '题目类型(1.单选题；2.多选题; 3.解答题)',
  `subject_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '考試',
  `chapter_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '章节',
  `content` text COMMENT '题内容',
  `answer` text COMMENT '答案',
  `analysis` text COMMENT '解析',
  `review_point` varchar(100) DEFAULT '' COMMENT '考察知识点',
  `year` varchar(100) NOT NULL DEFAULT '' COMMENT '年份',
  `score` varchar(20) NOT NULL DEFAULT '0' COMMENT '分数',
  `audit_status` varchar(10) NOT NULL DEFAULT '' COMMENT '状态(0:未审核,1:审核通过,2:未通过)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subject_id_index` (`subject_id`) USING BTREE,
  KEY `chapter_id_index` (`chapter_id`) USING BTREE,
  KEY `question_type_idex` (`question_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '1', '5', '9', '校园网与城域网互连，应该选用的设备是______。A．交换机\r\nB．网桥\r\nC．路由器\r\nD．集线器', 'C', '本题考查应试者网络设备方面的基础知识。\r\n路由器的一个作用是连通不同的网络，如校园网与城域网互连；另一个作用是为经过路由器的每个数据帧寻找一条最佳传输路径，并将该数据有效地传送到目的站点，即选择通信量少的、通畅快捷的近路，以提高通信速度，减轻网络系统通信负荷，节约网络系统资源，提高网络系统畅通率，从而让网络系统发挥出更大的效益。', '', '', '2', '0');
INSERT INTO `t_question` VALUES ('2', '1', '5', '9', '用于局域网的基本网络连接设备是______。\r\n\r\nA．集线器\r\nB．网络适配器(网卡)\r\nC．调制解调器\r\nD．路由器', 'B', '[知识点] 局域网中的网络连接设备\r\n[评析] 局域网由网络硬件和网络软件两部分组成。网络硬件主要包括网络服务器，网络工作站，网卡和通信介质。网络软件主要包括：网络操作系统，网络数据库管理系统和网络应用软件。', '', '', '2', '0');
INSERT INTO `t_question` VALUES ('5', '1', '5', '8', '以下的访问控制列表中，______禁止所有Telnet访问子网17.5.1.0/24。\r\n\r\nA．access―list 15 deny udp any 17.5.1.10 255.255.255.0 eq 23\r\nB．access―list 15 deny telnet any 17.5.1.0 255.255.255.0 eq 23\r\nC．access―list 15 deny tcp any 17.5.1.0 255.255.255.0 eq 23\r\nD．access―list1 15 deny any 17.5.1.0 255.255.255.0 eq telnet', 'C', '[解析] 访问控制列表(ACL)是应用在路由器接口的指令列表。随着网络应用及技术的日益发展，在一些核心的路由交换机，甚至边缘交换机上也应用了这一技术，以期待在网络的各个部分实现分布式的有效的控制。ACL指令列表用来告诉路由器(交换机)哪些数据报可以接收、哪一些需要拒绝。至于是接收还是被拒绝，可以由类似源地址、目的地址、端口号等的特定条件来决定。而TCP支持Telnet协议．故选C)。', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('6', '1', '11', '18', '下列关于法律渊源正确的说法是\r\n①在大陆法系国家中，判例在法律上不被认为是具有约束力的法律渊源，但可被认为是具有说服力的法律渊源\r\n②我国法律渊源的分类，是与我国宪法关于法律制定的权限的划分密切相联系的，同时也与我国的国体、政体、国家机关组织以及历史传统等因素相联系\r\n③资本主义法的渊源包括：立法机关制定的宪法、行政法规、地方性法规、司法判例\r\n④我国社会主义法律渊源主要分为以下几类：宪法、行政法、刑法、婚姻法、经济法、劳动法、刑事诉讼法、民事诉讼法、行政诉讼法\r\n\r\nA．①③\r\nB．②④\r\nC．①②\r\nD．③④', 'C', '[解析] 本题所考知识点为法律渊源。①考大陆法系国家的法律渊源。在大陆法系国家中，判例在法律上不被认为是正式意义的即有约束力的渊源，因为大陆法系国家的法律一般都是制定法，制定法为其主要法律渊源，故①正确。②考我国法律渊源：我国法律渊源是我国社会主义法的表现形式，即由不同的国家机关依法制定的具有不同法律效力、不同类别的规范性文件，具体是指我国最高权力机关和其他有权机关制定的各种规范性文件所表现的不同形式，故②正确。③考资本主义法的渊源。近代资本主义国家法的渊源，在英美法系国家主要是判例法，20世纪以来也开始重视制定法，故本题不正确，不选。④考我国社会主义法律渊源。不符题意，不选。需要说明的是法律渊源历年考试都涉及，考生要认真，仔细复习，掌握好基本概念，做到基础扎实，才能有备无患。', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('7', '2', '11', '18', '按照法律的调整对象不同，下列各项中，属于我国现行法律部门的是( )。\r\n\r\nA．经济法\r\nB．刑法\r\nC．行政法\r\nD．行政法规按照法律的调整对象不同，下列各项中，属于我国现行法律部门的是( )。\r\n\r\nA．经济法\r\nB．刑法\r\nC．行政法\r\nD．行政法规', 'ABC', '[解析] 行政法规是国务院制定的，它属于法的渊源，不属于法律部门。注意法律部门与法的渊源不同。法律部门是从法的调整对象角度来讲的，法的渊源是从法的制定机关角度来讲的。两者是不同的概念。行政法属于一个法律部门，行政法规属于法的渊源。', '', '', '3', '1');
INSERT INTO `t_question` VALUES ('12', '1', '11', '18', '下列法律法规中，法律效力最低的是( )。\r\n\r\nA．《中华人民共和国证券法》\r\nB．《中华人民共和国公司登记管理条例》\r\nC．《行政单位国有资产管理暂行办法》\r\nD．《中华人民共和国公司法》', 'C', '[解析] 本题考核经济法的渊源。具有最高效力的是宪法；法律效力仅次于宪法的是法律；其次是行政法规；再次是地方性法规及部门规章等。本题选项A、D为法律，选项B为行政法规，选项C为部门规章。', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('13', '2', '11', '19', '下列各项支出中，应在“管理费用”科目核算的有( )。\r\n\r\nA．对外担保涉及诉讼时，依据法院判决承担的诉讼费\r\nB．同一控制下企业合并发生的直接相关费用\r\nC．企业管理部门经营性租入固定资产支付的租金\r\nD．取得交易性金融资产时支付的印花税\r\nE．因拥有投资性房地产而交纳的房产税\r\n\r\n下列各项支出中，应在“管理费用”科目核算的有( )。\r\n\r\nA．对外担保涉及诉讼时，依据法院判决承担的诉讼费\r\nB．融资租赁资产的初始直接费用\r\nC．企业管理部门经营性租人固定资产支付的租金\r\nD．取得交易性金融资产时支付的印花税\r\nE．因拥有投资性房地产而交纳的房产税', 'ACE', '[解析] 选项B，融资租赁资产的初始直接费用应该计入租赁资产的价值；选项D，取得交易性金融资产时支付的印花税应计入“投资收益”。', '', '', '3', '2');
INSERT INTO `t_question` VALUES ('19', '3', '1', '5', '<h1 class=\"postTitle\" style=\"margin: 20px 0px 10px; padding: 0px; border-bottom: 1px solid rgb(221, 221, 221); font-size: 14px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a class=\"postTitle2\" href=\"https://www.cnblogs.com/samlin/p/editor_without_name_attribute.html\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0); line-height: 1.5;\">一个页面实例化两个ueditor编辑器，同样的出生却有不同的命运</a></h1><p style=\"margin: 10px auto; padding: 0px;\">今天遇到一个比较怪异的问题，有一项目需要在同一个页面上展现两个ueditor编辑器，在展现时并不任何问题，但当点击了“保存”按钮时就出错了，有其中一个ueditor在asp.net中无法获取编辑器的值，这时代码是这样的：</p><p style=\"margin: 10px auto; padding: 0px;\">&nbsp;</p><p><br/></p><ul style=\"margin-left: 30px; padding: 0px; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\" class=\" list-paddingleft-2\"></ul>', '<p>AS</p>', '<p style=\"margin: 10px auto; padding: 0px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">button type=&quot;button&quot; disabled=&quot;disabled&quot;&gt;Click Me!&lt;/button&gt;</p><p style=\"margin: 10px auto; padding: 0px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">　　jq语法 设置&nbsp; $(&quot;button&quot;).attr(&quot;disabled&quot;,&quot;true&quot;);&nbsp;=== $(&quot;button&quot;).attr(&quot;disabled&quot;,&quot;disabled&quot;);</p><p style=\"margin: 10px auto; padding: 0px; text-align: justify; font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\">　　　　　移除&nbsp; $(&quot;</p><p><br/></p>', '', '', '2', '2');
INSERT INTO `t_question` VALUES ('22', '1', '1', '6', '<p><span style=\"vertical-align: middle; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Hiragino Sans GB&quot;, arial, helvetica, clean; background-color: rgb(255, 255, 255);\">甲公司拥有乙公司80%，的有表决权股份，能够控制乙公司财务和经营决策。2012年6月1日，甲公司将本公司生产的一批产品出售给乙公司，售价为1600万元(不含增值税)，成本为1000万元。至2012年12月31日，乙公司已对外售出该批存货的40%，当日，剩余存货的可变现净值为500万元。甲公司、乙公司均采用资产负债表债务法核算其所得税，适用的所得税税率均为25%。不考虑其他因素，对上述交易进行抵消后，2012年12月31日在合并财务报表层面因该业务应列示的递延所得税资产为( )万元。</span><br/><br/><span style=\"vertical-align: middle; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Hiragino Sans GB&quot;, arial, helvetica, clean; background-color: rgb(255, 255, 255);\">A．25</span><br/><span style=\"vertical-align: middle; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Hiragino Sans GB&quot;, arial, helvetica, clean; background-color: rgb(255, 255, 255);\">B．95</span><br/><span style=\"vertical-align: middle; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Hiragino Sans GB&quot;, arial, helvetica, clean; background-color: rgb(255, 255, 255);\">C．100</span><br/><span style=\"vertical-align: middle; color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Hiragino Sans GB&quot;, arial, helvetica, clean; background-color: rgb(255, 255, 255);\">D．115</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Hiragino Sans GB&quot;, arial, helvetica, clean; font-size: 14px; background-color: rgb(255, 255, 255);\">D</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Hiragino Sans GB&quot;, arial, helvetica, clean; font-size: 14px; background-color: rgb(255, 255, 255);\">[解析] 2012年12月31日剩余存货在合并财务报表层面的成本=1000×60%=600(万元)，因可变现净值为500万元，所以账面价值为500万元，计税基础=1600×60%=960(万元)，因该事项应列示的递延所得税资产=(960－500)×25%=115(万元)。</span></p>', '', '', '2', '2');
INSERT INTO `t_question` VALUES ('23', '3', '1', '7', '<p>dasda</p>', '<p>daas</p>', '<p>das</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('24', '1', '16', '23', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">湘方言的代表是( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、长沙话 B 、武汉话 C、上海话 D、南昌话</p><p><br/></p>', '<p>A<br/></p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('25', '1', '16', '23', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">普通话的词汇以哪种方言为基础( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、吴方言 B、赣方言 C、北方方言 D、客家方言</p><p><br/></p>', '<p>C<br/></p>', '<p>略</p>', '', '', '2', '2');
INSERT INTO `t_question` VALUES ('26', '1', '16', '23', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">使用人口最多的方言是( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、吴方言 B、湘方言 C、北方方言 D、客家方言</p><p><br/></p>', '<p>C<br/></p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('27', '1', '16', '23', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">语言要素中，经常处于变化之中的是( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、语音 B、词汇 C、语义 D、语法</p><p><br/></p>', '<p>D</p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('28', '1', '16', '23', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">现代汉语的音节结构中( )占优势</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、声母 B、韵母 C、元音 D、辅音</p><p><br/></p>', '<p>C</p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('29', '1', '16', '23', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">( )是汉语音节结构中不可缺少的成分</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、声母 B、韵母 C、声调 D、元音</p><p><br/></p>', '<p>C<br/></p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('30', '1', '16', '23', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">相对而言，语言要素中较为稳定的是( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、语法 B、词汇 C、语义 D、语音</p><p><br/></p>', '<p>A<br/></p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('31', '1', '16', '23', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">语言要素中，经常处于变化之中的是( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A语音 B词汇 C语义 D语法</p><p><br/></p>', '<p>D</p>', '<p>略</p>', '', '', '2', '0');
INSERT INTO `t_question` VALUES ('32', '3', '16', '23', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">现代汉语的形成。</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">现代汉语的形成和发展，经历了一个复杂的过程。现代汉语是在近代汉语的基础上形成的。从近代汉语的历史发展中可以看到，宋元以后有两种明显的趋势在北方话的基础上发生：一种表现在书面语方面，就是白话文学的产生和发展;一种表现在口语方面，就是“官话”逐渐渗入各个方言区域。</span></p>', '<p>略</p>', '', '', '10', '1');
INSERT INTO `t_question` VALUES ('33', '3', '16', '23', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">跟古代汉语相比，现代汉语有哪些明显特点。</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">跟古代汉语相比，现代汉语有一些明显的特点，如从语音上看，古代汉语的入声在现代汉语中消失了;从词汇上看，现代汉语比古代汉语有较多的双音词，尤其名词和形容词双音化表现最为明显;语法上，现代汉语的修辞语比古代汉语复杂，尤其在书面语上出现了修辞和多项并列的修饰语。</span></p>', '<p>略</p>', '', '', '10', '1');
INSERT INTO `t_question` VALUES ('34', '1', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">下列说法中正确的是( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、汉语中音长具有区别意义的作用。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　B、汉语中音高具有区别意义的作用。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、振幅越大，声音越长。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　D普通话里“法”、“律”两个音节的音高相同。</p><p><br/></p>', '<p>B<br/></p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('35', '1', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">下面关于元音与辅音的描述正确的是( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、元音发音时间短暂，辅音发音时间较长。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　B、发辅音时气流受阻，发元音气流不受阻。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、辅音发音响亮，元音发音不响亮。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　D、发元音和辅音时，发音器官的各个部位均衡紧张。</p><p><br/></p>', '<p>B</p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('36', '1', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">下列词语中，第一个音节应变为阳平调(35)的是( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、打工 B、打听 C、打扫 D、打球</p><p><br/></p>', '<p>C</p>', '<p>略</p>', '', '', '2', '0');
INSERT INTO `t_question` VALUES ('37', '1', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">下面四个句子，无论在哪儿停顿都不会改变表达的意思的一句是( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、三日内蒙古人民共和国有股强大冷空气移过本市。 B、打伤他的学生。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、二加三乘以六等于几? D、我工作十年了。</p><p><br/></p>', '<p>D<br/></p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('38', '1', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">下面加点的字是属于异读字是( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、校对-学校 B、挑水-挑战</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、安宁-宁可 D、以上答案都不是异体字。</p><p><br/></p>', '<p>D<br/></p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('39', '2', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">根据研究对象的范围不同，语音学可以分为( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、普通语音学 B、实验语音学 C、具体语音学 D、应用语音学</p><p><br/></p>', '<p>AC</p>', '<p>略</p>', '', '', '3', '1');
INSERT INTO `t_question` VALUES ('40', '2', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">现代汉语常用的记音符号有( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、反切 B、注音字母 C、《汉语拼音方案》 D、国际音标</p><p><br/></p>', '<p>CD</p>', '<p>略</p>', '', '', '3', '0');
INSERT INTO `t_question` VALUES ('41', '2', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">《汉语拼音方案》包括( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、字母表 B、声母表 C、声调符号 D、隔音符号</p><p><br/></p>', '<p>ABCD</p>', '<p>略</p>', '', '', '3', '1');
INSERT INTO `t_question` VALUES ('42', '2', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">下列辅音声母中属于舌根音的是( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、k B、z C、h D、x</p><p><br/></p>', '<p>AC</p>', '<p>略</p>', '', '', '3', '1');
INSERT INTO `t_question` VALUES ('43', '2', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">现代汉语的音节结构中不可缺少的成分是( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　 A、辅音 B、韵尾 C、声调 D、韵腹</p><p><br/></p>', '<p>CD</p>', '<p>略</p>', '', '', '3', '1');
INSERT INTO `t_question` VALUES ('44', '2', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">写作新诗的时候，押韵应当以十三辙为依据，但是有时候为了写作的需要，必须使用音相近的字进行“通押”。下面哪几组韵可以通押( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、“言前”辙与“江阳”辙 B、“灰堆”辙与“梭波”辙</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、“人辰”辙与“中东”辙 D、“发花”辙与“一七”辙</p><p><br/></p>', '<p>AC</p>', '<p>略</p>', '', '', '3', '1');
INSERT INTO `t_question` VALUES ('45', '2', '16', '26', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">句调往往影响字调，使字调的调值改变。下面说法正确的是( )。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、在句调上升时，如果字调也是上升的，就使字调升得更高。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　B、在句调上升时，如果字调是降的，就变成降升。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、在句调下降时，如果字调是降调，变成降升调。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　D、在句调下降时，如果字调是平调，就变成平降调。</p><p><br/></p>', '<p>ABD</p>', '<p>略</p>', '', '', '3', '1');
INSERT INTO `t_question` VALUES ('46', '3', '16', '26', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">语音的物理属性包括哪些要素?</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">语音的物理属性包括四个基本要素：一是音高，即声音的高低，它取决于物体振动频率的高低;二是音强，即声音的强弱，它取决于物体振动幅度的大小;三是音长，即声音的长短，它取决于物体振动时间的久暂;四是音色，即声音的特色，它是由物体振动形式的不同决定的。</span></p>', '<p>略</p>', '', '', '5', '1');
INSERT INTO `t_question` VALUES ('47', '3', '16', '26', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">什么是零声母?普通话零声母音节的开头常常带有哪几个辅音?</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">零声母是指在音节声母的位置上没有辅音的实体，音节以元音开头。普通话零声母音节的开头常常带有辅音成分：第一，韵母是i或以i开头的零声母字，开头的实际发音是带有轻微摩擦的半元音[j];第二，韵母是u或以u开头的零声母字，开头的实际发音是带有轻微摩擦的半元音[w];第三，韵母是ü或以ü开头的零声母字，开头的实际发音是带有轻微摩擦的半元音[ç];第四，不是以i、u、ü开头的零声母字，有些人念起来前头带有一个轻微的舌根浊擦音[¶]或喉塞音[/]。零声母音节的开头虽然常常带有辅音成分，但是有时并不明显，而且不能区别意义，不构成不同的音位。</span></p>', '<p>略<br/></p>', '', '', '15', '1');
INSERT INTO `t_question` VALUES ('48', '1', '16', '26', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">简述现代汉语声调与古声调的关系</span></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">普通话的调类系统来自古代汉语的调类系统。在我国南朝齐梁之间，就有人把古汉语分为四类声调，即平、上、去、入。后来语音发展变化，又按声母的清浊各分为阴调和阳调两类，清声母字归阴调，浊声母字归阳调。普通话的阴平声字，大致跟古清声母的平声字相当;上声字包括古清声母上声字和部分浊声母上声字(指声母是边音、鼻音和零声母的阳上字);去声字包括了古去声字和另一部分古浊声母上声字。古代入声调类在普通话里已经消失了，古清声母入声字在普通话里分别读成阴平、阳平、上声或去声，古浊声母字在普通话里读成去声或阳平。</span></p>', '<p>略</p>', '', '', '15', '1');
INSERT INTO `t_question` VALUES ('49', '3', '16', '26', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">举例说明什么是音位。</span></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">音位是根据语音的社会属性划分出来的语音单位，指的是一个语音系统中能够区别意义的最小语音单位，也是按语音的辨义功能归纳出来的音类。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　比如，汉语普通话中，[a]、[ ¢]、[A]属于一个音位，在实际发音中，不管你发的是哪一个A，都没有区别词义的作用。例如把“他”[tÁ¢]念成[tÁa]或者 [tÁA]，意思都没有变化。与此相反的是，[n]和[l]不是一类，它们属于两个音位。在任何一个音节中如果把[n]念成[l]，或者把[l]念成[n]，都会改变意思。例如把“拿”[n¢]念成[l¢]，意思就变为“拉”了。</p><p><br/></p>', '<p>略</p>', '', '', '10', '1');
INSERT INTO `t_question` VALUES ('50', '3', '16', '26', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">举例说明什么是条件变体和自由变体，什么是音质音位和非音质音位。</span></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">在一定条件下出现的音位变体叫条件变体。例如汉语中[a]、[¢]、[A]、[E]的出现有各自的条件，都是音位/a/的条件变体;没有环境限制可以自由替换而不影响意义的音位变体叫自由变体。例如北京话的“挖、窝、歪、微、文、翁”开头的音节都有两种念法，一种念作半元音[w]，一种念作唇齿半元音[V]。这两种念法在上述字音中可以互相替换，不改变意思，是同一个音位的两个自由变体。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　从音素的音质角度划分与归并出来的音位叫音质音位。例如,从“沙[§¢55]”“书[§u55]”“奢[§Ä55]”归纳出来的三个元音音位/¢/、/u/、/Ä/都是由音素成分构成的，音素之间的差异是音质的差异，它们属于音质音位;利用音高、音长、音强这些非音质要素形成的音位叫非音质音位。例如，从“班[pan55]”“板[pan214]”“办[pan51]”归纳出来的音位/55/(阴平)、/214/(上声)、/51/(去声)三个调位的差异不是音质决定的，属于非音质音位。</p><p><br/></p>', '<p>略</p>', '', '', '15', '1');
INSERT INTO `t_question` VALUES ('51', '3', '16', '27', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">举例说明比拟和比喻的区别。</span></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">例：梅雨潭闪闪的绿色在招引着我们。(比拟)</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　那数不清的灯火就像千万颗星星飞上了天去。(比喻)</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　比喻和比拟都将两个事物巧妙地关联起来形成的，都有使表达形象化的效果。但二者有明显的不同：从构成形式上看，比喻中喻体必不可少，如上例的“星星”;而比拟中的拟体则不出现，只是把它所具有的情状或行为挂到本体上去，如上例的拟人中，拟体是“人”，但他没有出现，他的作用是用“人”所具有的“招引”行为来描述本体“绿色”。从表达的侧重点来看，在比喻中喻体和本体之间存在着相似关系，它是突出两事物的相似性;而在比拟中拟体和本体之间的联系是通过说话者的想象而变通融合起来的，因而比拟重在突出两种事物之间的某些差异。</p><p><br/></p>', '<p>略</p>', '', '', '10', '0');
INSERT INTO `t_question` VALUES ('52', '3', '16', '27', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">举例说明排比与对偶的区别。</span></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">例：时间就是生命，时间就是速度，时间就是力量。(排比)</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　为了搭起滑道，他们翻越了多少陡峭的悬崖绝壁;为了找寻水路，他们踏遍了多少曲折的幽谷荒滩。(对偶)</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　(1)整齐排列的结构数目不同。排比是三项或更多项结构相同或相似的句子、分句和短语的平行排列;对偶只是两项的并列对称。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　(2)各结构的字数要求不同。排比每项的字数可以不完全相等;对偶两项的字数必须相等。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　(3)排比常用相同的词语;对偶力避字面的重复。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　(4)各结构之间的意义联系有所不同。对偶的两个结构在意义上可以有多种联系，形成正对、反对、串对等不同格式。而排比的各个结构在意义表达上必须是平行或相关的，不能相反或相对。</p><p><br/></p>', '<p>略</p>', '', '', '15', '1');
INSERT INTO `t_question` VALUES ('53', '3', '16', '28', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">举例说明层递与排比的区别。</span></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">(1)层递着眼于内容上具有等次性(级差性)，构成层递的几个语句在内容上必须是递升或递降;排比具有并行性，各项是同一平面的扩展。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　(2)从形式上看，层递在结构上不强调相同或相似，常常体现为各项中某个有层次关系的词语，而且往往不用相同的词语，不强调结构整体;排比在结构上必须相同或相似，往往要用相同的词语。</p><p><br/></p>', '<p>略</p>', '', '', '10', '1');
INSERT INTO `t_question` VALUES ('54', '3', '16', '28', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; background-color: rgb(255, 255, 255);\">举例说明对比与对偶的区别。</span></p>', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">(1)对比的基本特点是内容上“对立”，对偶的基本特点是形式上“对称”。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　(2)对比是从意义上说的，它要求意义相反或相对，而不管结构形式如何。对偶主要是从结构形式上说的，它要求结构相称字数相等。对偶里的“反对”就意义说是对比，就形式说是对偶。</p><p><br/></p>', '<p>略</p>', '', '', '10', '1');
INSERT INTO `t_question` VALUES ('55', '1', '16', '27', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">“善者不来，来者不善”、“人不犯我，我不犯人”运用的修辞格是( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、借喻 B、回环 C、比拟 D、借代</p><p><br/></p>', '<p>B<br/></p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('56', '1', '16', '27', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">以下各例中运用了比喻修辞格的是( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、这孩子像他爸爸。 B、这孩子像个猴子。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、这孩子好像感冒了。 D、这孩子好像活过来了。</p><p><br/></p>', '<p>B</p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('57', '1', '16', '27', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">下面的句子里使用了拈连辞格的是( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、人老心却不老。 B、舍不得孩子打不住狼。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、酒好不怕巷子深。 D、有一分热，发一分光。</p><p><br/></p>', '<p>C</p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('58', '1', '16', '28', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">下面的句子使用了比喻修辞格的是( )</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、来者不善，善者不来。 B、浇树浇根，交人交心。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、天寒地冻冻不坏我们的决心。 D、高山低头，河水让路。</p><p><br/></p>', '<p>B</p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('59', '1', '16', '28', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">“瞧人家两口子，‘郎财女貌’，多般配!”这句话用了 。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、仿词 B、夸张 C、双关 D、反语</p><p><br/></p>', '<p>A</p>', '<p>略</p>', '', '', '2', '1');
INSERT INTO `t_question` VALUES ('60', '1', '16', '28', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">门前是一条河。”后面接下去最顺畅的一组句子是________。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　A、河边是一片很大的打谷场。三面都是高大的柳树。山门里是一个穿堂。迎门供着弥勒佛。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　B、山门里有一个穿堂。弥勒佛供在迎面。三面都裁着高大的柳树。河边是一片很大的打谷场。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　C、打谷场很大，就在河边。高大的柳树栽在三面。穿堂对着山门。迎面供着弥勒佛。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 40px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　D、一片很大的打谷场在河边。山门里是一个穿堂。迎面供着弥勒佛。三面都栽着高大的柳树。</p><p><br/></p>', '<p>A</p>', '<p>略</p>', '', '', '2', '1');

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '类型名称',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(500) DEFAULT '' COMMENT '备注',
  `status` varchar(20) NOT NULL DEFAULT '' COMMENT '状态（0正常 1删除 2停用）',
  `parentno` int(20) NOT NULL COMMENT '层级区分  父节点 无则为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES ('1', '计算机', '1', '1', '2020-02-26 00:00:00', null, null, '', '0', '0');
INSERT INTO `t_subject` VALUES ('2', '英语', '2', '1', '2020-02-26 00:00:00', null, null, '', '0', '0');
INSERT INTO `t_subject` VALUES ('3', '汉语言', '3', '1', '2020-02-26 00:00:00', null, null, '', '0', '0');
INSERT INTO `t_subject` VALUES ('4', '财管', '4', '2', '2020-02-23 00:00:00', null, null, '', '0', '0');
INSERT INTO `t_subject` VALUES ('5', '计算机二级', '1', '2', '2020-02-26 00:00:00', null, null, '', '0', '1');
INSERT INTO `t_subject` VALUES ('6', '英语四级', '1', '1', '2020-02-26 00:00:00', null, null, '', '0', '2');
INSERT INTO `t_subject` VALUES ('11', '中级会计师', '1', '1', '2020-02-28 00:00:00', null, null, '', '0', '4');
INSERT INTO `t_subject` VALUES ('12', '计算机三级', '2', '1', '2020-03-04 00:00:00', null, null, '', '0', '1');
INSERT INTO `t_subject` VALUES ('13', '教师资格证', '5', '1', '2020-03-07 00:00:00', null, null, '', '0', '0');
INSERT INTO `t_subject` VALUES ('14', '物流管理', '6', '1', '2020-03-07 00:00:00', null, null, '', '0', '0');
INSERT INTO `t_subject` VALUES ('15', '工商管理', '7', '1', '2020-03-07 00:00:00', null, null, '', '0', '0');
INSERT INTO `t_subject` VALUES ('16', '汉语言考试', '0', '2', '2020-03-11 00:00:00', null, null, '无', '1', '3');
