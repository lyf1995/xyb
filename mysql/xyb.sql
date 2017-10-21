/*
Navicat MySQL Data Transfer

Source Server         : aaa
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : xyb

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-10-21 21:45:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for companyinfo
-- ----------------------------
DROP TABLE IF EXISTS `companyinfo`;
CREATE TABLE `companyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `comLogo` varchar(255) DEFAULT '',
  `comName` varchar(255) DEFAULT NULL,
  `comContacts` varchar(255) DEFAULT NULL,
  `contactsSex` varchar(255) DEFAULT NULL,
  `comIndustry` varchar(255) DEFAULT NULL,
  `comEmail` varchar(255) DEFAULT NULL,
  `comAddress` varchar(255) DEFAULT NULL,
  `comProfile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companyinfo
-- ----------------------------
INSERT INTO `companyinfo` VALUES ('1', '123', '123', '../../file/sapo.jpg', '网易', '鲁钺锋', '男', '互联网', '2646926186@qq.com', '浙江省杭州市西湖区留下路', '规范');
INSERT INTO `companyinfo` VALUES ('2', '12', '12', '../../file/youbowangluo.jpg', '互联网技术有限公司', '周建楠', '女', '互联网', '2646926186@qq.com', '浙江省杭州市西湖区留下路', '规范1');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `time` bigint(255) DEFAULT NULL,
  `send_id` int(11) NOT NULL,
  `receive_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `receive_school` (`receive_id`),
  KEY `send_school` (`send_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('116', '你好', '1508045870', '4', '1');
INSERT INTO `contact` VALUES ('117', '你好', '1508045915', '1', '5');
INSERT INTO `contact` VALUES ('118', '你好', '1508045948', '1', '4');
INSERT INTO `contact` VALUES ('119', '你明天有空吗', '1508045961', '4', '1');
INSERT INTO `contact` VALUES ('120', '有', '1508045965', '1', '4');
INSERT INTO `contact` VALUES ('121', 'nihao', '1508227994', '1', '4');
INSERT INTO `contact` VALUES ('122', 'aaaaa', '1508227999', '4', '1');

-- ----------------------------
-- Table structure for haspost
-- ----------------------------
DROP TABLE IF EXISTS `haspost`;
CREATE TABLE `haspost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `sendTime` bigint(20) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `haspost_user` (`student_id`),
  KEY `haspost_post` (`post_id`),
  CONSTRAINT `haspost_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `haspost_user` FOREIGN KEY (`student_id`) REFERENCES `studentinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of haspost
-- ----------------------------
INSERT INTO `haspost` VALUES ('10', '未被查看', '1507996800', '2', '22');
INSERT INTO `haspost` VALUES ('11', '通知面试', '1507996800', '1', '1');
INSERT INTO `haspost` VALUES ('13', '不合适', '1508169600', '1', '20');
INSERT INTO `haspost` VALUES ('14', '未被查看', '1508169600', '1', '22');

-- ----------------------------
-- Table structure for hasrecruit
-- ----------------------------
DROP TABLE IF EXISTS `hasrecruit`;
CREATE TABLE `hasrecruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `sendTime` bigint(20) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `recruit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hasrecruit_company` (`company_id`),
  KEY `hasrecruit_recruit` (`recruit_id`),
  CONSTRAINT `hasrecruit_company` FOREIGN KEY (`company_id`) REFERENCES `companyinfo` (`id`),
  CONSTRAINT `hasrecruit_recruit` FOREIGN KEY (`recruit_id`) REFERENCES `recruit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hasrecruit
-- ----------------------------
INSERT INTO `hasrecruit` VALUES ('6', '待沟通', '1507996800', '1', '1');
INSERT INTO `hasrecruit` VALUES ('7', '未被查看', '1508083200', '1', '7');
INSERT INTO `hasrecruit` VALUES ('8', '未被查看', '1508169600', '1', '6');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postName` varchar(255) DEFAULT NULL,
  `jobNature` varchar(255) DEFAULT NULL,
  `postSalary` int(11) DEFAULT NULL,
  `jobExp` varchar(255) DEFAULT NULL,
  `postNumber` int(11) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `postMajor` varchar(255) DEFAULT NULL,
  `gwfl` varchar(255) DEFAULT NULL,
  `gwzz` varchar(255) DEFAULT NULL,
  `gwyq` varchar(255) DEFAULT NULL,
  `postTime` bigint(20) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_company` (`company_id`),
  CONSTRAINT `post_company` FOREIGN KEY (`company_id`) REFERENCES `companyinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', 'web前端实习生', '实习+就业', '3000', '不限', '10', '本科', '软件工程', '提供住宿、提供住宿餐、高温补贴、过节福利 ', '根据界面设计稿，快速高效地完成静态页面的制作。（HTML+CSS）&&前端交互功能实现，完善用户体验。（Js）', '精通Web前端技术（HTML，CSS，JavaScript），能够手写HTML CSS代码。&&熟悉WEB标准，了解CSS/JS跨浏览器端的兼容性。&&注重细节，良好的沟通能力和表达能力，有团队合作精神，能够很好地与内容编辑、程序开发人员协作。', '1505577600', '1');
INSERT INTO `post` VALUES ('20', 'android移动开发', '实习+就业', '4000', '一年以上', '101', '本科', '软件工程1', '提供住宿、提供住宿餐、高温补贴、过节福利 ', '根据界面设计稿，快速高效地完成静态页面的制作。&&前端交互功能实现，完善用户体验。&&后端部分功能实现。', '精通Web前端技术（HTML，CSS，JavaScript），能够手写HTML CSS代码。&&熟悉WEB标准，了解CSS/JS跨浏览器端的兼容性。&&了解springMVC框架', '1505664000', '1');
INSERT INTO `post` VALUES ('21', 'web前端', '就业', '8000', '两年以上', '5', '本科', '软件工程、计算机', '提供住宿、提供住宿餐、高温补贴、过节福利 &&五险一金', '根据界面设计稿，快速高效地完成静态页面的制作。（HTML+CSS）&&前端交互功能实现，完善用户体验。（Js）&&后台部分功能实现', '精通Web前端技术（HTML，CSS，JavaScript），能够手写HTML CSS代码。&&熟悉WEB标准，了解CSS/JS跨浏览器端的兼容性。&&注重细节，良好的沟通能力和表达能力，有团队合作精神，能够很好地与内容编辑、程序开发人员协作。&&了解springMVC框架', '1505577600', '2');
INSERT INTO `post` VALUES ('22', 'ios移动开发实习生', '实习+就业', '4000', '不限', '10', '本科', '计算机、软件工程', '提供住宿、提供住宿餐、高温补贴、过节福利 &&五险一金', '根据界面设计稿，快速高效地完成静态页面的制作。（HTML+CSS）&&前端交互功能实现，完善用户体验。（Js）', '精通Web前端技术（HTML，CSS，JavaScript），能够手写HTML CSS代码。&&熟悉WEB标准，了解CSS/JS跨浏览器端的兼容性。&&注重细节，良好的沟通能力和表达能力，有团队合作精神，能够很好地与内容编辑、程序开发人员协作。', '1505750400', '2');

-- ----------------------------
-- Table structure for recpost
-- ----------------------------
DROP TABLE IF EXISTS `recpost`;
CREATE TABLE `recpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recTime` bigint(20) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recPost_post` (`post_id`),
  KEY `recPost_school` (`school_id`),
  CONSTRAINT `recPost_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `recPost_school` FOREIGN KEY (`school_id`) REFERENCES `schoolinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recpost
-- ----------------------------
INSERT INTO `recpost` VALUES ('4', '1505923200', '22', '1');
INSERT INTO `recpost` VALUES ('5', '1505923200', '1', '1');
INSERT INTO `recpost` VALUES ('6', '1508169600', '20', '1');

-- ----------------------------
-- Table structure for recruit
-- ----------------------------
DROP TABLE IF EXISTS `recruit`;
CREATE TABLE `recruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitName` varchar(255) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `recruitDetail` varchar(255) DEFAULT NULL,
  `releaseTime` bigint(20) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Recruit_school` (`school_id`),
  CONSTRAINT `Recruit_school` FOREIGN KEY (`school_id`) REFERENCES `schoolinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO `recruit` VALUES ('1', '秋季招聘会', '1509465600', '1509552000', '浙江省杭州市西湖区浙江科技学院体育馆一楼', '这是一场校招', '1505664000', '1');
INSERT INTO `recruit` VALUES ('6', '秋季招聘会2', '1504195200', '1504800000', '浙江省杭州市西湖区浙江科技学院体育馆一楼', '秋季招聘会2秋季招聘会2秋季招聘会2秋季招聘会2秋季招聘会2', '1505664000', '1');
INSERT INTO `recruit` VALUES ('7', '秋季招聘会', '1506787200', '1507737600', '浙江省杭州市西湖区浙江科技学院体育馆一楼', '这是一场校招', '1506355200', '2');

-- ----------------------------
-- Table structure for schoolinfo
-- ----------------------------
DROP TABLE IF EXISTS `schoolinfo`;
CREATE TABLE `schoolinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `schLogo` varchar(255) DEFAULT '',
  `schName` varchar(255) DEFAULT NULL,
  `schContacts` varchar(255) DEFAULT NULL,
  `contactsSex` varchar(255) DEFAULT NULL,
  `schEmail` varchar(255) DEFAULT NULL,
  `schAddress` varchar(255) DEFAULT NULL,
  `schProfile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolinfo
-- ----------------------------
INSERT INTO `schoolinfo` VALUES ('1', '123', '123', '../../file/zust.jpg', '浙江科技学院', '鲁钺锋', '男', '2646926186@qq.com', '浙江省杭州市西湖区留下路', '这是一所好学校');
INSERT INTO `schoolinfo` VALUES ('2', '1234', '1234', '../../file/shandongligong.jpg', '浙江工业大学', '鲁钺锋', '男', '2646926186@qq.com', '浙江省杭州市西湖区留下路', '这是一所好大学');

-- ----------------------------
-- Table structure for stgrjj
-- ----------------------------
DROP TABLE IF EXISTS `stgrjj`;
CREATE TABLE `stgrjj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grjj` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grjj_user` (`student_id`),
  CONSTRAINT `grjj_user` FOREIGN KEY (`student_id`) REFERENCES `studentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stgrjj
-- ----------------------------
INSERT INTO `stgrjj` VALUES ('2', 'hg', '1');
INSERT INTO `stgrjj` VALUES ('3', '123', '3');

-- ----------------------------
-- Table structure for stqzyx
-- ----------------------------
DROP TABLE IF EXISTS `stqzyx`;
CREATE TABLE `stqzyx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `targetAddress` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qzyx_user` (`student_id`),
  CONSTRAINT `qzyx_user` FOREIGN KEY (`student_id`) REFERENCES `studentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stqzyx
-- ----------------------------
INSERT INTO `stqzyx` VALUES ('1', '实习+就业', '杭州', 'web前端', '3000', '1');
INSERT INTO `stqzyx` VALUES ('2', '实习', '12', '12', '12', '3');

-- ----------------------------
-- Table structure for stschoolinfo
-- ----------------------------
DROP TABLE IF EXISTS `stschoolinfo`;
CREATE TABLE `stschoolinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(255) DEFAULT NULL,
  `depart` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `classes` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT '',
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schoolinfo_user` (`student_id`),
  CONSTRAINT `schoolinfo_user` FOREIGN KEY (`student_id`) REFERENCES `studentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stschoolinfo
-- ----------------------------
INSERT INTO `stschoolinfo` VALUES ('1', '浙江科技学院', '电子与信息工程', '软件工程', '软工141', '1140299141', '2');
INSERT INTO `stschoolinfo` VALUES ('3', '浙江科技学院', '电子与信息工程', '软件工程', '软工141', '1140299141', '1');
INSERT INTO `stschoolinfo` VALUES ('4', '12', '12', '12', '12', '12', '3');

-- ----------------------------
-- Table structure for studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `relName` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birth` bigint(20) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT '',
  `fujian` varchar(255) DEFAULT '',
  `fujianName` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentinfo
-- ----------------------------
INSERT INTO `studentinfo` VALUES ('1', '123', '123', '鲁钺锋', '女', '1504281600', '17826804660', '2646926186@qq.com', '浙江省余姚市', '../../file/hejiong.jpg', '', '');
INSERT INTO `studentinfo` VALUES ('2', '1234', '1234', '周建楠', '女', '1504195200', '17826804660', '2646926186@qq.com', '浙江省丽水市', '', '', '');
INSERT INTO `studentinfo` VALUES ('3', '12345', '12345', '方孙权', '女', '1504713600', '17826804660', '2646926186@qq.com', '浙江省余姚市', '../../file/zhaowenzhuo.jpg', '../../file/表8.加减分项目及分值统计表（班级用）.doc', '表8.加减分项目及分值统计表（班级用）.doc');

-- ----------------------------
-- Table structure for stxmjy
-- ----------------------------
DROP TABLE IF EXISTS `stxmjy`;
CREATE TABLE `stxmjy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemStartYear` int(255) DEFAULT NULL,
  `itemStartMonth` int(255) DEFAULT NULL,
  `itemEndYear` int(255) DEFAULT NULL,
  `itemEndMonth` int(255) DEFAULT NULL,
  `itemName` varchar(255) DEFAULT NULL,
  `itemDuty` varchar(255) DEFAULT NULL,
  `itemDescribe` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xmjy_user` (`student_id`),
  CONSTRAINT `xmjy_user` FOREIGN KEY (`student_id`) REFERENCES `studentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stxmjy
-- ----------------------------
INSERT INTO `stxmjy` VALUES ('8', '2016', '1', '2017', '1', '校企招聘合作平台', 'web前端', '这是一个校企招聘合作平台', '1');
INSERT INTO `stxmjy` VALUES ('9', '2015', '2', '2016', '3', '校企招聘合作平台', 'web前端', '这是一个校企招聘合作平台', '1');

-- ----------------------------
-- Table structure for stxnzw
-- ----------------------------
DROP TABLE IF EXISTS `stxnzw`;
CREATE TABLE `stxnzw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dutyStartYear` int(255) DEFAULT NULL,
  `dutyStartMonth` int(255) DEFAULT NULL,
  `dutyEndYear` int(255) DEFAULT NULL,
  `dutyEndMonth` int(255) DEFAULT NULL,
  `dutyName` varchar(255) DEFAULT NULL,
  `dutyDescribe` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xnzw_user` (`student_id`),
  CONSTRAINT `xnzw_user` FOREIGN KEY (`student_id`) REFERENCES `studentinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stxnzw
-- ----------------------------

-- ----------------------------
-- Table structure for styynl
-- ----------------------------
DROP TABLE IF EXISTS `styynl`;
CREATE TABLE `styynl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lgName` varchar(255) DEFAULT NULL,
  `lgTS` varchar(255) DEFAULT NULL,
  `lgDX` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yynl_user` (`student_id`),
  CONSTRAINT `yynl_user` FOREIGN KEY (`student_id`) REFERENCES `studentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of styynl
-- ----------------------------
INSERT INTO `styynl` VALUES ('2', '中文', '一般', '一般', '1');
INSERT INTO `styynl` VALUES ('3', '英语', '良好', '一般', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '123', '1');
INSERT INTO `user` VALUES ('2', '1234', '1234', '1');
INSERT INTO `user` VALUES ('3', '12345', '12345', '1');
INSERT INTO `user` VALUES ('4', '123', '123', '2');
INSERT INTO `user` VALUES ('5', '12', '12', '2');
INSERT INTO `user` VALUES ('6', '123', '123', '3');
INSERT INTO `user` VALUES ('7', '1234', '1234', '3');
