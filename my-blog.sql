/*
Navicat MySQL Data Transfer

Source Server         : my-sql
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : my-blog

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-01-16 22:19:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `authority` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '测试博文\n![](http://ofp720vrr.bkt.clouddn.com/1508205614959.png)', null, '测试博文', '心情随笔', '0', '1', '#', '2017-10-17 10:00:26', null, '1');
INSERT INTO `blog` VALUES ('2', '测试博文\n![](http://ofp720vrr.bkt.clouddn.com/1508205614959.png)', null, '测试博文', '心情随笔', '0', '16', 'http://ofp720vrr.bkt.clouddn.com/1508205614959.png', '2017-10-17 10:01:10', null, '1');
INSERT INTO `blog` VALUES ('3', '测试博文\n![](http://ofp720vrr.bkt.clouddn.com/1508205614959.png)', null, '测试博文', '心情随笔', '0', '16', '2', '2017-10-17 10:01:10', null, '1');
INSERT INTO `blog` VALUES ('4', '测试博文\n![](http://ofp720vrr.bkt.clouddn.com/1508205614959.png)', null, '测试博文', '心情随笔', '0', '13', '#', '2017-10-17 10:01:10', null, '1');
INSERT INTO `blog` VALUES ('5', '测试博文\n![](http://ofp720vrr.bkt.clouddn.com/1508205614959.png)', null, '测试博文', '心情随笔', '0', '13', '#', '2017-10-17 10:01:10', null, '1');
INSERT INTO `blog` VALUES ('6', '测试博文\n![](http://ofp720vrr.bkt.clouddn.com/1508205614959.png)', null, '测试博文', '心情随笔', '0', '14', '#', '2017-10-17 10:01:10', null, '1');
INSERT INTO `blog` VALUES ('7', '测试博文\n![](http://ofp720vrr.bkt.clouddn.com/1508205614959.png)', null, '测试博文', '心情随笔', '0', '13', '#', '2017-10-17 10:01:10', null, '1');
INSERT INTO `blog` VALUES ('8', '测试博文\n![](http://ofp720vrr.bkt.clouddn.com/1508205614959.png)', null, '测试博文', '心情随笔', '0', '14', '#', '2017-10-17 10:01:10', null, '1');
INSERT INTO `blog` VALUES ('9', '测试博文\n![](http://ofp720vrr.bkt.clouddn.com/1508205614959.png)', null, '测试博文', '心情随笔', '0', '13', '#', '2017-10-17 10:01:10', null, '1');
INSERT INTO `blog` VALUES ('10', '### 生动的博客\n##### 需要一些生动的内容\n###### 嗯', null, '生动的博客', '心情随笔', '0', '19', '#', '2017-12-17 00:51:01', null, '1');
INSERT INTO `blog` VALUES ('11', '#### 内容测试', null, '测试用博客', '心情随笔', '0', '1', '#', '2018-01-06 20:07:24', null, '2');
INSERT INTO `blog` VALUES ('12', '#### 测试内容2', null, '测试用博客2', '心情随笔', '0', '2', '#', '2018-01-06 20:08:34', null, '2');
INSERT INTO `blog` VALUES ('13', '新建博客', null, '最新博客', '心情随笔', '0', '1', '#', '2018-01-06 20:19:42', null, '2');
INSERT INTO `blog` VALUES ('14', '添加一个新博客\n修改一些内容', null, '新博客', '心情随笔', '0', '5', '#', '2018-01-07 19:34:56', null, '1');

-- ----------------------------
-- Table structure for messageboard
-- ----------------------------
DROP TABLE IF EXISTS `messageboard`;
CREATE TABLE `messageboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) DEFAULT NULL,
  `content` mediumtext,
  `create_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messageboard
-- ----------------------------
INSERT INTO `messageboard` VALUES ('1', '2', '测试留言', '2017-10-17 10:09:31', '1');
INSERT INTO `messageboard` VALUES ('2', '2', 'on more time', '2017-10-17 10:23:18', '1');
INSERT INTO `messageboard` VALUES ('3', '10', '测试评论', '2018-01-07 19:34:36', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cookie` varchar(255) DEFAULT NULL,
  `verify` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `privilege` int(11) DEFAULT '0',
  `head_image` varchar(255) DEFAULT NULL,
  `user_describe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '管理员', 'admin', '123456', '4ed593f4e4a3dbfcfd483f8de5286544b91bbba94fc847f47fe35a7ea45f10b7', null, 'man', null, '1', null, '我是管理员');
INSERT INTO `user` VALUES ('2', 'guyu123456', '912005812@qq.com', '123456', null, null, 'man', null, '0', null, '');
INSERT INTO `user` VALUES ('3', '小雨', 'xiaoyu@gmail.com', '123456', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('4', '1', '23', '1', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('5', '1@qq.com', '1@qq.com', '1', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('6', 'dddd', '123456@123.com', '123456', null, null, null, null, null, null, null);
