/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : db_jude

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2018-09-19 14:53:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(300) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('1', '福州新弯曲5号', '小李子', '福州艾玛超市', '2132-23213421', '');
INSERT INTO `t_customer` VALUES ('2', '天津兴达大街888号', '小张', '天津王大连锁酒店', '23432222311', '优质客户');
INSERT INTO `t_customer` VALUES ('3', '大凉山妥洛村', '小爱', '大凉山希望小学', '233243211', '照顾客户2');
INSERT INTO `t_customer` VALUES ('4', '南通通州新金路888号', '王二小', '南通通州综艺集团', '1832132321', '');

-- ----------------------------
-- Table structure for t_customer_return_list
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list`;
CREATE TABLE `t_customer_return_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `customer_return_date` datetime DEFAULT NULL,
  `customer_return_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd55ju83f0ntixagdvdrsmw10c` (`user_id`),
  KEY `FKl0ahdwa8slkocbfe57opembfx` (`customer_id`),
  CONSTRAINT `FKd55ju83f0ntixagdvdrsmw10c` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKl0ahdwa8slkocbfe57opembfx` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_return_list
-- ----------------------------
INSERT INTO `t_customer_return_list` VALUES ('2', '2200', '2200', '2017-10-27 00:00:00', 'XT201710270001', 'cc', '1', '1', '3');
INSERT INTO `t_customer_return_list` VALUES ('3', '4514', '4514', '2017-10-28 00:00:00', 'XT201710280001', 'cc', '1', '1', '3');
INSERT INTO `t_customer_return_list` VALUES ('4', '4400', '4400', '2017-10-30 00:00:00', 'XT201710300001', 'cc', '1', '1', '3');
INSERT INTO `t_customer_return_list` VALUES ('5', '139', '139', '2017-10-30 00:00:00', 'XT201710300002', 'cc', '1', '1', '2');
INSERT INTO `t_customer_return_list` VALUES ('6', '38', '38', '2017-11-03 00:00:00', 'XT201711030001', 'cc', '1', '1', '2');

-- ----------------------------
-- Table structure for t_customer_return_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list_goods`;
CREATE TABLE `t_customer_return_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `customer_return_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtqt67mbn96lxn8hvtl4piblhi` (`customer_return_list_id`),
  KEY `FK4sm5si4swbj3gae46jfk441yx` (`type_id`),
  CONSTRAINT `FK4sm5si4swbj3gae46jfk441yx` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKtqt67mbn96lxn8hvtl4piblhi` FOREIGN KEY (`customer_return_list_id`) REFERENCES `t_customer_return_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_return_list_goods
-- ----------------------------
INSERT INTO `t_customer_return_list_goods` VALUES ('3', '0002', 'Note8', '华为荣耀Note8', '1', '2200', '2200', '台', '2', '16', '2');
INSERT INTO `t_customer_return_list_goods` VALUES ('4', '0002', 'Note8', '华为荣耀Note8', '2', '2200', '4400', '台', '3', '16', '2');
INSERT INTO `t_customer_return_list_goods` VALUES ('5', '0003', '500g装', '野生东北黑木耳', '3', '38', '114', '袋', '3', '11', '11');
INSERT INTO `t_customer_return_list_goods` VALUES ('6', '0002', 'Note8', '华为荣耀Note8', '2', '2200', '4400', '台', '4', '16', '2');
INSERT INTO `t_customer_return_list_goods` VALUES ('7', '0007', '500g装', '吉利人家牛肉味蛋糕', '2', '10', '20', '袋', '5', '11', '15');
INSERT INTO `t_customer_return_list_goods` VALUES ('8', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '3', '33', '99', '袋', '5', '11', '17');
INSERT INTO `t_customer_return_list_goods` VALUES ('9', '0010', '250g装', '劲仔小鱼干', '1', '20', '20', '袋', '5', '11', '18');
INSERT INTO `t_customer_return_list_goods` VALUES ('10', '0003', '500g装', '野生东北黑木耳', '1', '38', '38', '袋', '6', '11', '11');

-- ----------------------------
-- Table structure for t_damage_list
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list`;
CREATE TABLE `t_damage_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `damage_date` datetime DEFAULT NULL,
  `damage_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpn094ma69sch1icjc2gu7xus` (`user_id`),
  CONSTRAINT `FKpn094ma69sch1icjc2gu7xus` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_damage_list
-- ----------------------------
INSERT INTO `t_damage_list` VALUES ('3', '2017-10-27 00:00:00', 'BS201710270001', 'cc', '1');
INSERT INTO `t_damage_list` VALUES ('4', '2017-10-27 00:00:00', 'BS201710270002', 'cc', '1');
INSERT INTO `t_damage_list` VALUES ('5', '2017-11-03 00:00:00', 'BS201711030001', '', '1');
INSERT INTO `t_damage_list` VALUES ('6', '2018-07-15 00:00:00', 'BS201807150001', '', '1');

-- ----------------------------
-- Table structure for t_damage_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list_goods`;
CREATE TABLE `t_damage_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `damage_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbf5m8mm3gctrnuubr9xkjamj8` (`damage_list_id`),
  KEY `FKdbdfmp09hlf2raktincwroe9n` (`type_id`),
  CONSTRAINT `FKbf5m8mm3gctrnuubr9xkjamj8` FOREIGN KEY (`damage_list_id`) REFERENCES `t_damage_list` (`id`),
  CONSTRAINT `FKdbdfmp09hlf2raktincwroe9n` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_damage_list_goods
-- ----------------------------
INSERT INTO `t_damage_list_goods` VALUES ('4', '0003', '500g装', '野生东北黑木耳', '2', '23', '46', '袋', '3', '11', '11');
INSERT INTO `t_damage_list_goods` VALUES ('5', '0006', '300g装', '冰糖金桔干', '2', '5', '10', '盒', '3', '11', '14');
INSERT INTO `t_damage_list_goods` VALUES ('6', '0003', '500g装', '野生东北黑木耳', '2', '23', '46', '袋', '4', '11', '11');
INSERT INTO `t_damage_list_goods` VALUES ('7', '0005', '散装500克', '麦片燕麦巧克力', '32', '8', '256', '袋', '4', '11', '13');
INSERT INTO `t_damage_list_goods` VALUES ('8', '0007', '500g装', '吉利人家牛肉味蛋糕', '2', '4.5', '9', '袋', '4', '11', '15');
INSERT INTO `t_damage_list_goods` VALUES ('9', '0002', 'Note8', '华为荣耀Note8', '1', '2220', '2220', '台', '5', '16', '2');
INSERT INTO `t_damage_list_goods` VALUES ('10', '0003', '500g装', '野生东北黑木耳', '1', '23', '23', '袋', '6', '11', '11');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `inventory_quantity` int(11) NOT NULL,
  `min_num` int(11) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `producer` varchar(200) DEFAULT NULL,
  `purchasing_price` float NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `selling_price` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `last_purchasing_price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlxnna5ngumghp4f279mmbjtyo` (`type_id`),
  CONSTRAINT `FKlxnna5ngumghp4f279mmbjtyo` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '0001', '175', '1000', '红色装', '陶华碧老干妈香辣脆油辣椒', '贵州省贵阳南明老干妈风味食品有限公司', '6.32', '好卖', '8.5', '瓶', '10', '2', '8.5');
INSERT INTO `t_goods` VALUES ('2', '0002', '142', '400', 'Note8', '华为荣耀Note8', '华为计算机系统有限公司', '1950.05', '热销', '2200', '台', '16', '2', '2220');
INSERT INTO `t_goods` VALUES ('11', '0003', '2896', '400', '500g装', '野生东北黑木耳', '辉南县博康土特产有限公司', '23', '够黑2', '38', '袋', '11', '2', '23');
INSERT INTO `t_goods` VALUES ('12', '0004', '326', '300', '2斤装', '新疆红枣', '沧州铭鑫食品有限公司', '13', '好吃', '25', '袋', '10', '2', '13');
INSERT INTO `t_goods` VALUES ('13', '0005', '53', '1000', '散装500克', '麦片燕麦巧克力', '福建省麦德好食品工业有限公司', '8', 'Goods', '15', '袋', '11', '2', '8');
INSERT INTO `t_goods` VALUES ('14', '0006', '36', '1999', '300g装', '冰糖金桔干', '揭西县同心食品有限公司', '5.1', '', '13', '盒', '11', '2', '5');
INSERT INTO `t_goods` VALUES ('15', '0007', '100651', '400', '500g装', '吉利人家牛肉味蛋糕', '合肥吉利人家食品有限公司', '4.5', 'good', '10', '袋', '11', '2', '4.5');
INSERT INTO `t_goods` VALUES ('16', '0008', '196', '500', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '潮州市潮安区正大食品有限公司', '3', '', '10', '盒', '11', '2', '3');
INSERT INTO `t_goods` VALUES ('17', '0009', '365', '1000', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '石家庄博群食品有限公司', '20', '', '33', '袋', '11', '2', '20');
INSERT INTO `t_goods` VALUES ('18', '0010', '10', '300', '250g装', '劲仔小鱼干', '湖南省华文食品有限公司', '12', '', '20', '袋', '11', '2', '12');
INSERT INTO `t_goods` VALUES ('19', '0011', '11', '300', '198g装', '山楂条', '临朐县七贤升利食品厂', '3.2', '', '10', '袋', '11', '0', '3.2');
INSERT INTO `t_goods` VALUES ('20', '0012', '22', '200', '500g装', '大乌梅干', '长春市鼎丰真食品有限责任公司', '20', '', '25', '袋', '11', '0', '20');
INSERT INTO `t_goods` VALUES ('21', '0013', '400', '100', '250g装', '手工制作芝麻香酥麻通', '桂林兰雨食品有限公司', '3', '', '8', '袋', '11', '2', '3');
INSERT INTO `t_goods` VALUES ('22', '0014', '12', '200', '250g装', '美国青豆原味 蒜香', '菲律宾', '5', '', '8', '袋', '11', '2', '5');
INSERT INTO `t_goods` VALUES ('24', '0015', '-3', '100', 'X', ' iPhone X', 'xx2', '8000', 'xxx2', '9500', '台', '16', '2', '8000');
INSERT INTO `t_goods` VALUES ('25', '0016', '0', '12', 'X', '21', '32', '100', '21', '120', '盒', '3', '0', '100');
INSERT INTO `t_goods` VALUES ('26', '0017', '-1', '100', 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', 'xxx', '3000', 'xxx', '3650', '台', '15', '2', '3000');
INSERT INTO `t_goods` VALUES ('27', '0018', '-1', '400', 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', 'xx', '800', 'xxx', '1299', '台', '15', '2', '800');
INSERT INTO `t_goods` VALUES ('28', '0019', '0', '300', 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', 'xxxx', '60', '', '129', '台', '17', '0', '60');
INSERT INTO `t_goods` VALUES ('29', '0020', '0', '50', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', 'cc', '1000', '', '1699', '台', '14', '0', '1000');
INSERT INTO `t_goods` VALUES ('30', '0021', '0', '320', '4A ', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', 'cc', '700', '', '1199', '台', '12', '0', '700');
INSERT INTO `t_goods` VALUES ('31', '0022', '0', '40', 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', 'cc', '400', '', '729', '台', '13', '0', '400');
INSERT INTO `t_goods` VALUES ('32', '0023', '0', '1000', '80g*2', '台湾进口膨化零食品张君雅小妹妹日式串烧丸子80g*2', 'cc', '4', '', '15', '袋', '9', '0', '4');
INSERT INTO `t_goods` VALUES ('33', '0024', '0', '10', 'A字裙', '卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙', 'cc', '168', '', '298', '件', '6', '0', '168');
INSERT INTO `t_goods` VALUES ('34', '0025', '0', '10', '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', 'cc', '189', '', '299', '件', '7', '0', '189');
INSERT INTO `t_goods` VALUES ('35', '0026', '0', '10', 'AFS JEEP', '加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子', 'c', '60', '', '89', '条', '8', '0', '60');

-- ----------------------------
-- Table structure for t_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype`;
CREATE TABLE `t_goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodstype
-- ----------------------------
INSERT INTO `t_goodstype` VALUES ('1', '所有类别', '-1', '1', 'icon-folderOpen');
INSERT INTO `t_goodstype` VALUES ('2', '服饰', '1', '1', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('3', '食品', '1', '1', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('4', '家电', '1', '1', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('5', '数码', '1', '1', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('6', '连衣裙', '2', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('7', '男士西装', '2', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('8', '牛仔裤', '2', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('9', '进口食品', '3', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('10', '地方特产', '3', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('11', '休闲食品', '3', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('12', '电视机', '4', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('13', '洗衣机', '4', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('14', '冰箱', '4', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('15', '相机', '5', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('16', '手机', '5', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('17', '音箱', '5', '0', 'icon-folder');

-- ----------------------------
-- Table structure for t_goodsunit
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsunit`;
CREATE TABLE `t_goodsunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodsunit
-- ----------------------------
INSERT INTO `t_goodsunit` VALUES ('1', '个');
INSERT INTO `t_goodsunit` VALUES ('2', '袋');
INSERT INTO `t_goodsunit` VALUES ('3', '盒');
INSERT INTO `t_goodsunit` VALUES ('4', '箱');
INSERT INTO `t_goodsunit` VALUES ('5', '台');
INSERT INTO `t_goodsunit` VALUES ('6', '包');
INSERT INTO `t_goodsunit` VALUES ('11', '件');
INSERT INTO `t_goodsunit` VALUES ('12', '条');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbvn5yabu3vqwvtjoh32i9r4ip` (`user_id`),
  CONSTRAINT `FKbvn5yabu3vqwvtjoh32i9r4ip` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1911', '查询用户信息', '2017-10-26 19:47:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1912', '查询用户信息', '2017-10-26 19:47:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1913', '用户注销', '2017-10-26 19:47:40', '注销操作', '1');
INSERT INTO `t_log` VALUES ('1914', '用户登录', '2017-10-26 19:47:45', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1915', '用户登录', '2017-10-26 19:56:16', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1916', '用户登录', '2017-10-26 19:56:52', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1917', '用户登录', '2017-10-26 19:59:18', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1918', '用户登录', '2017-10-26 20:53:34', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1919', '查询商品信息', '2017-10-26 20:54:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1920', '查询商品信息', '2017-10-26 20:54:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1921', '查询商品类别信息', '2017-10-26 20:54:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1922', '用户登录', '2017-10-27 08:39:36', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1923', '查询商品信息', '2017-10-27 08:41:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1924', '查询商品信息', '2017-10-27 08:41:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1925', '用户登录', '2017-10-27 09:51:40', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1926', '查询商品信息', '2017-10-27 09:52:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1927', '查询商品信息', '2017-10-27 09:52:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1928', '查询商品类别信息', '2017-10-27 09:53:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1929', '添加进货单', '2017-10-27 09:54:02', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1930', '查询商品信息', '2017-10-27 09:54:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1931', '查询商品信息', '2017-10-27 09:54:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1932', '用户登录', '2017-10-27 09:54:58', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1933', '查询商品信息', '2017-10-27 09:55:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1934', '查询商品信息', '2017-10-27 09:55:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1935', '查询商品类别信息', '2017-10-27 09:55:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1936', '添加进货单', '2017-10-27 09:55:33', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1937', '查询商品信息', '2017-10-27 09:55:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1938', '查询商品信息', '2017-10-27 09:55:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1939', '用户登录', '2017-10-27 09:59:02', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1940', '用户登录', '2017-10-27 10:03:30', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1941', '查询商品信息', '2017-10-27 10:03:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1942', '查询商品信息', '2017-10-27 10:03:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1943', '查询商品类别信息', '2017-10-27 10:03:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1944', '添加进货单', '2017-10-27 10:03:51', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1945', '查询商品信息', '2017-10-27 10:03:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1946', '查询商品信息', '2017-10-27 10:03:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1947', '查询商品类别信息', '2017-10-27 10:03:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1948', '添加进货单', '2017-10-27 10:04:09', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1949', '查询商品信息', '2017-10-27 10:04:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1950', '查询商品信息', '2017-10-27 10:04:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1951', '查询商品信息', '2017-10-27 10:06:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1952', '查询商品信息', '2017-10-27 10:06:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1953', '查询商品信息', '2017-10-27 10:11:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1954', '查询商品信息', '2017-10-27 10:11:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1955', '查询商品类别信息', '2017-10-27 10:11:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1956', '添加退货单', '2017-10-27 10:11:22', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1957', '查询商品信息', '2017-10-27 10:11:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1958', '查询商品信息', '2017-10-27 10:11:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1959', '查询商品信息', '2017-10-27 10:14:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1960', '查询商品信息', '2017-10-27 10:14:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1961', '查询商品类别信息', '2017-10-27 10:14:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1962', '添加销售单', '2017-10-27 10:14:59', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1963', '查询商品信息', '2017-10-27 10:15:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1964', '查询商品信息', '2017-10-27 10:15:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1965', '查询商品信息', '2017-10-27 10:15:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1966', '查询商品信息', '2017-10-27 10:15:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1967', '查询商品类别信息', '2017-10-27 10:15:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1968', '添加客户退货单', '2017-10-27 10:15:18', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1969', '查询商品信息', '2017-10-27 10:15:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1970', '查询商品信息', '2017-10-27 10:15:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1971', '查询商品信息', '2017-10-27 10:15:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1972', '查询商品信息', '2017-10-27 10:15:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1973', '查询商品信息', '2017-10-27 10:15:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1974', '查询商品信息', '2017-10-27 10:15:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1975', '查询商品类别信息', '2017-10-27 10:16:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1976', '添加报损单', '2017-10-27 10:17:05', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1977', '查询商品信息', '2017-10-27 10:17:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1978', '查询商品信息', '2017-10-27 10:17:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1979', '查询商品类别信息', '2017-10-27 10:17:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1980', '添加报溢单', '2017-10-27 10:17:20', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1981', '查询商品信息', '2017-10-27 10:17:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1982', '查询商品信息', '2017-10-27 10:17:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1983', '用户登录', '2017-10-27 18:55:03', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1984', '用户注销', '2017-10-27 18:55:31', '注销操作', '1');
INSERT INTO `t_log` VALUES ('1985', '用户登录', '2017-10-27 18:55:35', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1986', '用户注销', '2017-10-27 18:56:00', '注销操作', '1');
INSERT INTO `t_log` VALUES ('1987', '用户登录', '2017-10-27 18:56:04', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1988', '用户注销', '2017-10-27 18:56:44', '注销操作', '1');
INSERT INTO `t_log` VALUES ('1989', '用户登录', '2017-10-27 18:56:48', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1990', '用户登录', '2017-10-27 19:36:59', '登录操作', '1');
INSERT INTO `t_log` VALUES ('1991', '查询商品信息', '2017-10-27 19:40:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1992', '查询商品信息', '2017-10-27 19:40:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1993', '查询商品类别信息', '2017-10-27 19:40:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1994', '添加报损单', '2017-10-27 19:40:25', '添加操作', '1');
INSERT INTO `t_log` VALUES ('1995', '查询商品信息', '2017-10-27 19:40:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1996', '查询商品信息', '2017-10-27 19:40:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1997', '删除进货单信息null', '2017-10-27 19:49:02', '删除操作', '1');
INSERT INTO `t_log` VALUES ('1998', '查询商品信息', '2017-10-27 19:54:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('1999', '查询商品信息', '2017-10-27 19:54:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2000', '查询商品类别信息', '2017-10-27 19:54:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2001', '添加报溢单', '2017-10-27 19:54:28', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2002', '查询商品信息', '2017-10-27 19:54:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2003', '查询商品信息', '2017-10-27 19:54:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2004', '用户登录', '2017-10-27 20:00:43', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2005', '用户登录', '2017-10-28 10:13:17', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2006', '查询商品信息', '2017-10-28 10:13:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2007', '查询商品信息', '2017-10-28 10:13:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2008', '查询商品信息', '2017-10-28 10:33:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2009', '查询商品信息', '2017-10-28 10:33:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2010', '查询商品类别信息', '2017-10-28 10:34:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2011', '添加销售单', '2017-10-28 10:34:39', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2012', '查询商品信息', '2017-10-28 10:34:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2013', '查询商品信息', '2017-10-28 10:34:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2014', '查询商品信息', '2017-10-28 10:41:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2015', '查询商品信息', '2017-10-28 10:41:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2016', '查询商品类别信息', '2017-10-28 10:41:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2017', '添加客户退货单', '2017-10-28 10:41:09', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2018', '查询商品信息', '2017-10-28 10:41:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2019', '查询商品信息', '2017-10-28 10:41:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2020', '查询供应商信息', '2017-10-28 11:08:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2021', '查询供应商信息', '2017-10-28 11:08:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2022', '查询客户信息', '2017-10-28 11:08:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2023', '查询客户信息', '2017-10-28 11:08:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2024', '查询商品类别信息', '2017-10-28 11:08:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2025', '查询商品单位信息', '2017-10-28 11:08:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2026', '查询商品信息', '2017-10-28 11:08:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2027', '查询商品信息', '2017-10-28 11:08:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2028', '查询商品类别信息', '2017-10-28 11:08:46', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2029', '查询商品类别信息', '2017-10-28 11:08:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2030', '查询商品类别信息', '2017-10-28 11:18:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2031', '查询商品信息（无库存）', '2017-10-28 11:18:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2032', '查询商品信息（有库存）', '2017-10-28 11:18:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2033', '查询商品信息（有库存）', '2017-10-28 11:18:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2034', '查询商品信息（无库存）', '2017-10-28 11:18:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2035', '用户登录', '2017-10-28 11:32:06', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2036', '查询商品信息（无库存）', '2017-10-28 11:32:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2037', '查询商品信息（无库存）', '2017-10-28 11:32:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2038', '用户登录', '2017-10-28 12:07:49', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2039', '查询商品库存信息', '2017-10-28 12:07:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2040', '查询商品库存信息', '2017-10-28 12:07:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2041', '查询商品库存信息', '2017-10-28 12:07:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2042', '查询商品库存信息', '2017-10-28 12:08:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2043', '查询商品库存信息', '2017-10-28 12:08:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2044', '查询商品库存信息', '2017-10-28 12:08:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2045', '查询商品库存信息', '2017-10-28 12:08:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2046', '查询商品信息', '2017-10-28 12:09:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2047', '查询商品信息', '2017-10-28 12:09:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2048', '查询商品类别信息', '2017-10-28 12:09:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2049', '添加销售单', '2017-10-28 12:09:23', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2050', '查询商品信息', '2017-10-28 12:09:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2051', '查询商品信息', '2017-10-28 12:09:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2052', '查询商品库存信息', '2017-10-28 12:09:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2053', '查询商品库存信息', '2017-10-28 12:09:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2054', '查询商品库存信息', '2017-10-28 12:09:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2055', '用户登录', '2017-10-28 20:06:03', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2056', '查询商品类别信息', '2017-10-28 20:06:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2057', '查询商品信息', '2017-10-28 20:06:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2058', '查询商品单位信息', '2017-10-28 20:06:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2059', '查询商品信息', '2017-10-28 20:06:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2060', '查询商品库存信息', '2017-10-28 20:08:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2061', '查询商品类别信息', '2017-10-28 20:08:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2062', '查询商品库存信息', '2017-10-28 20:08:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2063', '查询商品类别信息', '2017-10-28 20:08:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2064', '查询商品库存信息', '2017-10-28 20:08:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2065', '查询商品类别信息', '2017-10-28 20:08:48', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2066', '查询商品类别信息', '2017-10-28 20:09:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2067', '查询商品类别信息', '2017-10-28 20:09:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2068', '查询商品库存信息', '2017-10-28 20:11:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2069', '查询商品类别信息', '2017-10-28 20:11:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2070', '查询商品库存信息', '2017-10-28 20:11:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2071', '查询商品库存信息', '2017-10-28 20:11:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2072', '查询商品类别信息', '2017-10-28 20:11:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2073', '查询商品库存信息', '2017-10-28 20:11:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2074', '查询商品类别信息', '2017-10-28 20:11:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2075', '查询商品库存信息', '2017-10-28 20:12:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2076', '查询商品类别信息', '2017-10-28 20:12:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2077', '查询商品类别信息', '2017-10-28 20:12:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2078', '查询商品库存信息', '2017-10-28 20:12:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2079', '查询商品类别信息', '2017-10-28 20:12:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2080', '查询商品库存信息', '2017-10-28 20:12:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2081', '查询商品类别信息', '2017-10-28 20:12:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2082', '查询商品库存信息', '2017-10-28 20:12:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2083', '查询商品类别信息', '2017-10-28 20:12:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2084', '查询商品类别信息', '2017-10-28 20:12:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2085', '查询商品库存信息', '2017-10-28 20:14:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2086', '查询商品库存信息', '2017-10-28 20:15:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2087', '查询商品类别信息', '2017-10-28 20:15:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2088', '查询商品类别信息', '2017-10-28 20:15:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2089', '查询商品库存信息', '2017-10-28 20:15:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2090', '查询商品类别信息', '2017-10-28 20:15:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2091', '查询商品库存信息', '2017-10-28 20:15:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2092', '查询商品类别信息', '2017-10-28 20:15:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2093', '查询商品类别信息', '2017-10-28 20:15:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2094', '查询商品库存信息', '2017-10-28 20:15:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2095', '查询商品类别信息', '2017-10-28 20:16:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2096', '查询商品库存信息', '2017-10-28 20:16:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2097', '查询商品类别信息', '2017-10-28 20:16:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2098', '查询商品库存信息', '2017-10-28 20:16:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2099', '查询商品类别信息', '2017-10-28 20:16:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2100', '查询商品库存信息', '2017-10-28 20:16:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2101', '查询商品库存信息', '2017-10-28 20:16:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2102', '查询商品库存信息', '2017-10-28 20:16:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2103', '查询商品库存信息', '2017-10-28 20:16:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2104', '查询商品库存信息', '2017-10-28 20:17:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2105', '查询商品类别信息', '2017-10-28 20:17:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2106', '查询商品库存信息', '2017-10-28 20:17:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2107', '用户登录', '2017-10-28 20:20:53', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2108', '查询商品库存信息', '2017-10-28 20:20:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2109', '查询商品库存信息', '2017-10-28 20:20:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2110', '查询商品库存信息', '2017-10-28 20:21:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2111', '查询商品库存信息', '2017-10-28 20:21:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2112', '查询商品类别信息', '2017-10-28 20:21:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2113', '查询商品库存信息', '2017-10-28 20:21:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2114', '查询商品库存信息', '2017-10-28 20:21:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2115', '查询商品库存信息', '2017-10-28 20:21:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2116', '用户登录', '2017-10-28 20:22:38', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2117', '查询商品库存信息', '2017-10-28 20:22:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2118', '查询商品库存信息', '2017-10-28 20:22:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2119', '查询商品库存信息', '2017-10-28 20:22:46', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2120', '查询商品库存信息', '2017-10-28 20:27:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2121', '查询商品库存信息', '2017-10-28 20:27:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2122', '查询商品库存信息', '2017-10-28 20:27:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2123', '查询商品库存信息', '2017-10-28 20:27:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2124', '查询商品库存信息', '2017-10-28 20:27:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2125', '查询商品库存信息', '2017-10-28 20:27:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2126', '查询商品库存信息', '2017-10-28 20:27:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2127', '查询商品库存信息', '2017-10-28 20:30:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2128', '查询商品信息', '2017-10-28 20:31:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2129', '查询商品信息', '2017-10-28 20:31:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2130', '查询商品类别信息', '2017-10-28 20:31:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2131', '查询商品信息', '2017-10-28 20:31:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2132', '查询商品信息', '2017-10-28 20:31:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2133', '查询商品类别信息', '2017-10-28 20:31:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2134', '查询商品类别信息', '2017-10-28 20:31:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2135', '添加进货单', '2017-10-28 20:31:38', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2136', '查询商品信息', '2017-10-28 20:31:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2137', '查询商品信息', '2017-10-28 20:31:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2138', '查询商品库存信息', '2017-10-28 20:31:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2139', '查询商品库存信息', '2017-10-28 20:32:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2140', '查询商品库存信息', '2017-10-28 20:32:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2141', '用户登录', '2017-10-29 08:55:04', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2142', '查询商品库存信息', '2017-10-29 08:55:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2143', '查询商品库存信息', '2017-10-29 08:55:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2144', '查询商品库存信息', '2017-10-29 08:55:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2145', '用户登录', '2017-10-29 09:35:36', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2146', '查询商品库存信息', '2017-10-29 09:35:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2147', '查询商品库存信息', '2017-10-29 09:35:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2148', '查询商品信息', '2017-10-29 09:35:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2149', '查询商品信息', '2017-10-29 09:35:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2150', '查询商品信息', '2017-10-29 09:35:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2151', '查询商品信息', '2017-10-29 09:35:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2152', '用户登录', '2017-10-29 16:12:34', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2153', '查询商品库存信息', '2017-10-29 16:12:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2154', '查询商品库存信息', '2017-10-29 16:16:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2155', '查询客户信息', '2017-10-29 16:16:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2156', '查询客户信息', '2017-10-29 16:16:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2157', '查询商品类别信息', '2017-10-29 16:16:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2158', '查询商品单位信息', '2017-10-29 16:16:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2159', '查询商品信息', '2017-10-29 16:16:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2160', '查询商品信息', '2017-10-29 16:16:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2161', '查询商品信息（无库存）', '2017-10-29 16:16:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2162', '查询商品信息（有库存）', '2017-10-29 16:16:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2163', '查询商品信息（有库存）', '2017-10-29 16:16:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2164', '查询商品信息（无库存）', '2017-10-29 16:16:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2165', '查询供应商信息', '2017-10-29 16:16:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2166', '查询供应商信息', '2017-10-29 16:16:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2167', '查询角色信息', '2017-10-29 16:16:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2168', '查询角色信息', '2017-10-29 16:16:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2169', '查询用户信息', '2017-10-29 16:16:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2170', '查询用户信息', '2017-10-29 16:16:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2171', '查询商品信息', '2017-10-29 16:16:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2172', '查询商品信息', '2017-10-29 16:16:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2173', '查询商品信息', '2017-10-29 16:16:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2174', '查询商品信息', '2017-10-29 16:16:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2175', '用户登录', '2017-10-29 16:52:51', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2176', '查询商品库存信息', '2017-10-29 16:52:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2177', '查询供应商信息', '2017-10-29 16:52:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2178', '查询供应商信息', '2017-10-29 16:52:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2179', '用户注销', '2017-10-29 17:10:28', '注销操作', '1');
INSERT INTO `t_log` VALUES ('2180', '用户登录', '2017-10-29 17:10:56', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2181', '查询商品库存信息', '2017-10-29 17:10:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2182', '查询角色信息', '2017-10-29 17:11:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2183', '查询角色信息', '2017-10-29 17:11:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2184', '查询用户信息', '2017-10-29 17:11:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2185', '查询用户信息', '2017-10-29 17:11:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2186', '查询所有角色信息', '2017-10-29 17:11:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2187', '查询商品信息（无库存）', '2017-10-29 17:11:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2188', '查询商品信息（无库存）', '2017-10-29 17:11:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2189', '查询商品信息（有库存）', '2017-10-29 17:11:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2190', '查询商品信息（有库存）', '2017-10-29 17:11:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2191', '查询商品类别信息', '2017-10-29 17:11:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2192', '查询商品信息', '2017-10-29 17:11:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2193', '查询商品单位信息', '2017-10-29 17:11:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2194', '查询商品信息', '2017-10-29 17:11:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2195', '查询商品类别信息', '2017-10-29 17:11:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2196', '用户登录', '2017-10-29 17:42:10', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2197', '查询商品库存信息', '2017-10-29 17:42:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2198', '用户登录', '2017-10-29 19:40:13', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2199', '查询商品库存信息', '2017-10-29 19:40:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2200', '查询商品信息', '2017-10-29 19:48:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2201', '查询商品信息', '2017-10-29 19:48:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2202', '查询商品类别信息', '2017-10-29 19:48:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2203', '添加进货单', '2017-10-29 19:48:37', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2204', '查询商品信息', '2017-10-29 19:48:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2205', '查询商品信息', '2017-10-29 19:48:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2206', '查询商品库存信息', '2017-10-29 20:24:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2207', '查询商品库存信息', '2017-10-29 20:24:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2208', '用户登录', '2017-10-29 20:24:56', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2209', '查询商品库存信息', '2017-10-29 20:24:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2210', '用户登录', '2017-10-29 20:33:48', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2211', '查询商品库存信息', '2017-10-29 20:33:48', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2212', '查询商品库存信息', '2017-10-29 20:34:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2213', '用户注销', '2017-10-29 20:34:39', '注销操作', '1');
INSERT INTO `t_log` VALUES ('2214', '用户登录', '2017-10-29 20:34:44', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2215', '查询商品库存信息', '2017-10-29 20:34:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2216', '查询商品类别信息', '2017-10-29 20:34:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2217', '用户登录', '2017-10-30 09:35:23', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2218', '查询商品库存信息', '2017-10-30 09:35:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2219', '查询商品信息', '2017-10-30 09:35:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2220', '查询商品信息', '2017-10-30 09:35:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2221', '查询商品信息', '2017-10-30 09:35:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2222', '查询商品信息', '2017-10-30 09:35:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2223', '查询供应商信息', '2017-10-30 09:41:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2224', '查询供应商信息', '2017-10-30 09:41:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2225', '查询客户信息', '2017-10-30 09:42:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2226', '查询客户信息', '2017-10-30 09:42:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2227', '查询商品信息', '2017-10-30 09:42:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2228', '查询商品信息', '2017-10-30 09:42:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2229', '查询商品库存信息', '2017-10-30 09:43:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2230', '用户登录', '2017-10-30 10:47:44', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2231', '查询商品库存信息', '2017-10-30 10:47:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2232', '查询商品信息', '2017-10-30 10:47:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2233', '查询商品信息', '2017-10-30 10:47:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2234', '查询商品信息', '2017-10-30 10:48:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2235', '查询商品信息', '2017-10-30 10:48:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2236', '查询商品类别信息', '2017-10-30 10:48:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2237', '查询商品库存信息', '2017-10-30 11:04:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2238', '查询商品信息', '2017-10-30 11:04:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2239', '查询商品信息', '2017-10-30 11:04:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2240', '查询商品信息', '2017-10-30 11:05:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2241', '查询商品信息', '2017-10-30 11:05:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2242', '查询商品类别信息', '2017-10-30 11:05:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2243', '添加销售单', '2017-10-30 11:05:25', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2244', '查询商品信息', '2017-10-30 11:05:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2245', '查询商品信息', '2017-10-30 11:05:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2246', '查询商品信息', '2017-10-30 11:05:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2247', '查询商品信息', '2017-10-30 11:05:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2248', '查询商品信息', '2017-10-30 11:08:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2249', '查询商品信息', '2017-10-30 11:08:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2250', '查询商品类别信息', '2017-10-30 11:09:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2251', '添加客户退货单', '2017-10-30 11:09:12', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2252', '查询商品信息', '2017-10-30 11:09:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2253', '查询商品信息', '2017-10-30 11:09:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2254', '用户登录', '2017-10-30 12:06:06', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2255', '查询商品库存信息', '2017-10-30 12:06:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2256', '查询商品库存信息', '2017-10-30 12:15:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2257', '用户登录', '2017-10-30 12:15:23', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2258', '查询商品库存信息', '2017-10-30 12:15:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2259', '用户登录', '2017-10-30 12:16:19', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2260', '查询商品库存信息', '2017-10-30 12:16:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2261', '用户登录', '2017-10-30 12:31:48', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2262', '查询商品库存信息', '2017-10-30 12:31:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2263', '查询商品信息', '2017-10-30 12:33:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2264', '查询商品信息', '2017-10-30 12:33:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2265', '查询商品类别信息', '2017-10-30 12:33:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2266', '查询商品信息', '2017-10-30 12:33:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2267', '添加销售单', '2017-10-30 12:33:24', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2268', '查询商品信息', '2017-10-30 12:33:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2269', '查询商品信息', '2017-10-30 12:33:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2270', '查询商品信息', '2017-10-30 12:33:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2271', '查询商品信息', '2017-10-30 12:33:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2272', '查询商品类别信息', '2017-10-30 12:34:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2273', '添加客户退货单', '2017-10-30 12:34:17', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2274', '查询商品信息', '2017-10-30 12:34:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2275', '查询商品信息', '2017-10-30 12:34:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2276', '用户登录', '2017-10-30 18:20:23', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2277', '查询商品库存信息', '2017-10-30 18:20:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2278', '用户登录', '2017-10-31 10:49:39', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2279', '查询商品库存信息', '2017-10-31 10:49:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2280', '用户注销', '2017-10-31 10:50:19', '注销操作', '1');
INSERT INTO `t_log` VALUES ('2281', '用户登录', '2017-10-31 10:50:23', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2282', '查询商品库存信息', '2017-10-31 10:50:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2283', '查询商品类别信息', '2017-10-31 11:02:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2284', '查询商品信息', '2017-10-31 11:04:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2285', '查询商品信息', '2017-10-31 11:04:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2286', '查询商品库存信息', '2017-10-31 11:04:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2287', '查询商品类别信息', '2017-10-31 11:07:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2288', '用户注销', '2017-10-31 11:20:24', '注销操作', '1');
INSERT INTO `t_log` VALUES ('2289', '用户登录', '2017-10-31 11:21:19', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2290', '查询商品库存信息', '2017-10-31 11:21:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2291', '查询商品信息', '2017-10-31 11:22:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2292', '查询商品信息', '2017-10-31 11:22:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2293', '查询角色信息', '2017-10-31 11:22:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2294', '查询角色信息', '2017-10-31 11:22:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2295', '查询用户信息', '2017-10-31 11:22:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2296', '查询用户信息', '2017-10-31 11:22:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2297', '查询所有角色信息', '2017-10-31 11:22:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2298', '查询商品类别信息', '2017-10-31 11:22:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2299', '查询商品类别信息', '2017-10-31 11:22:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2300', '查询供应商信息', '2017-10-31 11:23:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2301', '查询供应商信息', '2017-10-31 11:23:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2302', '查询客户信息', '2017-10-31 11:23:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2303', '查询客户信息', '2017-10-31 11:23:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2304', '查询商品类别信息', '2017-10-31 11:23:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2305', '查询商品单位信息', '2017-10-31 11:23:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2306', '查询商品信息', '2017-10-31 11:23:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2307', '查询商品信息', '2017-10-31 11:23:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2308', '查询商品类别信息', '2017-10-31 11:23:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2309', '查询商品库存信息', '2017-10-31 11:37:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2310', '用户登录', '2017-10-31 12:10:54', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2311', '查询商品库存信息', '2017-10-31 12:10:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2312', '查询商品库存信息', '2017-10-31 12:13:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2313', '用户登录', '2017-10-31 12:21:21', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2314', '查询商品库存信息', '2017-10-31 12:21:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2315', '用户登录', '2017-10-31 16:28:16', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2316', '查询商品库存信息', '2017-10-31 16:28:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2317', '用户登录', '2017-10-31 16:50:55', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2318', '查询商品库存信息', '2017-10-31 16:50:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2319', '用户登录', '2017-10-31 16:55:11', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2320', '查询商品库存信息', '2017-10-31 16:55:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2321', '用户登录', '2017-10-31 17:06:04', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2322', '查询商品库存信息', '2017-10-31 17:06:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2323', '用户登录', '2017-10-31 17:06:36', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2324', '查询商品库存信息', '2017-10-31 17:06:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2325', '用户登录', '2017-10-31 17:13:40', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2326', '查询商品库存信息', '2017-10-31 17:13:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2327', '查询商品信息', '2017-10-31 17:13:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2328', '查询商品信息', '2017-10-31 17:13:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2329', '查询商品信息', '2017-10-31 17:13:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2330', '查询商品信息', '2017-10-31 17:13:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2331', '查询商品类别信息', '2017-10-31 17:14:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2332', '添加进货单', '2017-10-31 17:14:12', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2333', '查询商品信息', '2017-10-31 17:14:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2334', '查询商品信息', '2017-10-31 17:14:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2335', '用户登录', '2017-10-31 17:24:29', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2336', '查询商品库存信息', '2017-10-31 17:24:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2337', '用户登录', '2017-10-31 17:27:32', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2338', '查询商品库存信息', '2017-10-31 17:27:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2339', '用户登录', '2017-10-31 17:31:43', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2340', '查询商品库存信息', '2017-10-31 17:31:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2341', '查询商品类别信息', '2017-10-31 17:44:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2342', '用户登录', '2017-10-31 18:19:21', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2343', '查询商品库存信息', '2017-10-31 18:19:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2344', '用户登录', '2017-10-31 18:23:15', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2345', '查询商品库存信息', '2017-10-31 18:23:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2346', '用户登录', '2017-10-31 18:42:43', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2347', '查询商品库存信息', '2017-10-31 18:42:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2348', '用户登录', '2017-10-31 20:04:44', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2349', '查询商品库存信息', '2017-10-31 20:04:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2350', '用户登录', '2017-10-31 20:07:13', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2351', '查询商品库存信息', '2017-10-31 20:07:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2352', '用户登录', '2017-10-31 20:08:07', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2353', '查询商品库存信息', '2017-10-31 20:08:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2354', '用户登录', '2017-10-31 20:12:51', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2355', '查询商品库存信息', '2017-10-31 20:12:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2356', '查询商品库存信息', '2017-10-31 20:13:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2357', '查询商品库存信息', '2017-10-31 20:17:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2358', '查询商品类别信息', '2017-10-31 20:26:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2359', '查询商品类别信息', '2017-10-31 20:26:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2360', '查询商品类别信息', '2017-10-31 20:28:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2361', '查询商品类别信息', '2017-10-31 20:28:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2362', '用户登录', '2017-11-01 17:38:14', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2363', '查询商品库存信息', '2017-11-01 17:38:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2364', '用户登录', '2017-11-01 18:21:17', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2365', '查询商品库存信息', '2017-11-01 18:21:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2366', '查询商品信息', '2017-11-01 18:26:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2367', '查询商品信息', '2017-11-01 18:26:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2368', '查询商品类别信息', '2017-11-01 18:26:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2369', '添加销售单', '2017-11-01 18:28:03', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2370', '查询商品信息', '2017-11-01 18:28:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2371', '查询商品信息', '2017-11-01 18:28:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2372', '查询商品类别信息', '2017-11-01 18:30:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2373', '查询商品类别信息', '2017-11-01 18:30:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2374', '添加销售单', '2017-11-01 18:30:53', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2375', '查询商品信息', '2017-11-01 18:30:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2376', '查询商品信息', '2017-11-01 18:30:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2377', '查询商品类别信息', '2017-11-01 18:33:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2378', '查询商品类别信息', '2017-11-01 18:33:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2379', '添加销售单', '2017-11-01 18:33:28', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2380', '查询商品信息', '2017-11-01 18:33:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2381', '查询商品信息', '2017-11-01 18:33:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2382', '用户登录', '2017-11-01 20:01:18', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2383', '查询商品库存信息', '2017-11-01 20:01:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2384', '用户登录', '2017-11-01 20:02:43', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2385', '查询商品库存信息', '2017-11-01 20:02:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2386', '用户登录', '2017-11-01 20:11:52', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2387', '查询商品库存信息', '2017-11-01 20:11:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2388', '用户登录', '2017-11-01 20:13:32', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2389', '查询商品库存信息', '2017-11-01 20:13:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2390', '用户登录', '2017-11-01 20:19:35', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2391', '查询商品库存信息', '2017-11-01 20:19:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2392', '用户登录', '2017-11-01 20:20:35', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2393', '查询商品库存信息', '2017-11-01 20:20:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2394', '用户登录', '2017-11-01 20:22:19', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2395', '查询商品库存信息', '2017-11-01 20:22:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2396', '用户登录', '2017-11-01 20:23:31', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2397', '查询商品库存信息', '2017-11-01 20:23:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2398', '用户登录', '2017-11-01 20:24:04', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2399', '查询商品库存信息', '2017-11-01 20:24:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2400', '用户登录', '2017-11-01 20:25:38', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2401', '查询商品库存信息', '2017-11-01 20:25:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2402', '用户登录', '2017-11-01 20:28:01', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2403', '查询商品库存信息', '2017-11-01 20:28:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2404', '用户登录', '2017-11-01 20:35:00', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2405', '查询商品库存信息', '2017-11-01 20:35:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2406', '用户登录', '2017-11-01 20:35:55', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2407', '查询商品库存信息', '2017-11-01 20:35:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2408', '用户登录', '2017-11-02 10:10:14', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2409', '查询商品库存信息', '2017-11-02 10:10:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2410', '用户登录', '2017-11-02 14:31:46', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2411', '查询商品库存信息', '2017-11-02 14:31:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2412', '查询商品信息', '2017-11-02 14:31:57', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2413', '查询商品信息', '2017-11-02 14:31:57', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2414', '查询商品信息', '2017-11-02 14:31:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2415', '查询商品信息', '2017-11-02 14:31:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2416', '查询商品信息', '2017-11-02 14:32:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2417', '查询商品信息', '2017-11-02 14:32:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2418', '用户登录', '2017-11-02 18:17:40', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2419', '查询商品库存信息', '2017-11-02 18:17:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2420', '查询商品信息', '2017-11-02 18:28:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2421', '查询商品信息', '2017-11-02 18:28:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2422', '用户登录', '2017-11-02 19:01:25', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2423', '查询商品库存信息', '2017-11-02 19:01:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2424', '用户登录', '2017-11-02 19:03:17', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2425', '查询商品库存信息', '2017-11-02 19:03:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2426', '查询商品信息', '2017-11-02 19:03:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2427', '查询商品信息', '2017-11-02 19:03:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2428', '查询商品库存信息', '2017-11-02 20:17:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2429', '查询商品库存信息', '2017-11-02 20:18:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2430', '查询商品库存信息', '2017-11-02 20:18:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2431', '查询商品库存信息', '2017-11-02 20:20:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2432', '用户登录', '2017-11-03 09:12:17', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2433', '查询商品库存信息', '2017-11-03 09:12:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2434', '用户登录', '2017-11-03 09:33:36', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2435', '查询商品库存信息', '2017-11-03 09:33:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2436', '查询商品库存信息', '2017-11-03 09:36:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2437', '查询商品库存信息', '2017-11-03 09:36:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2438', '查询商品库存信息', '2017-11-03 09:36:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2439', '查询商品库存信息', '2017-11-03 09:36:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2440', '查询商品库存信息', '2017-11-03 10:10:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2441', '查询商品库存信息', '2017-11-03 10:10:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2442', '查询商品库存信息', '2017-11-03 10:10:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2443', '查询商品库存信息', '2017-11-03 10:23:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2444', '用户登录', '2017-11-03 11:17:35', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2445', '查询商品库存信息', '2017-11-03 11:17:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2446', '用户登录', '2017-11-03 11:19:20', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2447', '查询商品库存信息', '2017-11-03 11:19:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2448', '查询商品库存信息', '2017-11-03 11:20:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2449', '用户登录', '2017-11-03 15:18:40', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2450', '查询商品库存信息', '2017-11-03 15:18:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2451', '查询商品库存信息', '2017-11-03 15:32:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2452', '查询商品库存信息', '2017-11-03 15:32:46', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2453', '查询商品库存信息', '2017-11-03 15:32:48', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2454', '用户登录', '2017-11-03 18:50:34', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2455', '查询商品库存信息', '2017-11-03 18:50:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2456', '用户登录', '2017-11-03 18:51:23', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2457', '查询商品库存信息', '2017-11-03 18:51:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2458', '查询商品信息', '2017-11-03 18:57:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2459', '查询商品信息', '2017-11-03 18:57:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2460', '查询商品库存信息', '2017-11-03 18:57:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2461', '查询商品类别信息', '2017-11-03 19:02:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2462', '查询供应商信息', '2017-11-03 19:03:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2463', '查询供应商信息', '2017-11-03 19:03:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2464', '添加供应商信息[id=null, name=南京大王科技, contact=小二, number=0112-1426789, address=南京鼓楼区世纪大楼123号, remarks=]', '2017-11-03 19:04:30', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2465', '查询供应商信息', '2017-11-03 19:04:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2466', '查询供应商信息', '2017-11-03 19:04:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2467', '更新供应商信息[id=12, name=南京大王科技, contact=小二, number=0112-1426789, address=南京鼓楼区世纪大楼123号, remarks=123]', '2017-11-03 19:04:40', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2468', '查询供应商信息', '2017-11-03 19:04:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2469', '查询供应商信息', '2017-11-03 19:04:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2470', '查询供应商信息', '2017-11-03 19:04:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2471', '添加供应商信息[id=null, name=南京大陆食品公司, contact=小吴, number=1243-2135487, address=南京将军路800号, remarks=cc]', '2017-11-03 19:13:43', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2472', '查询供应商信息', '2017-11-03 19:13:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2473', '添加供应商信息[id=null, name=ew, contact=ewq, number=ewq, address=ewq, remarks=ewq]', '2017-11-03 19:14:47', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2474', '查询供应商信息', '2017-11-03 19:14:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2475', '删除供应商信息[id=14, name=ew, contact=ewq, number=ewq, address=ewq, remarks=ewq]', '2017-11-03 19:14:53', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2476', '查询供应商信息', '2017-11-03 19:14:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2477', '查询供应商信息', '2017-11-03 19:14:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2478', '查询客户信息', '2017-11-03 19:15:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2479', '查询客户信息', '2017-11-03 19:15:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2480', '添加客户信息[id=null, name=21, contact=321, number=312, address=321, remarks=23]', '2017-11-03 19:19:34', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2481', '查询客户信息', '2017-11-03 19:19:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2482', '更新客户信息[id=5, name=21, contact=321, number=312, address=321, remarks=232]', '2017-11-03 19:19:38', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2483', '查询客户信息', '2017-11-03 19:19:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2484', '更新客户信息[id=5, name=212, contact=3212, number=3122, address=3212, remarks=2322]', '2017-11-03 19:19:45', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2485', '查询客户信息', '2017-11-03 19:19:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2486', '删除客户信息[id=5, name=212, contact=3212, number=3122, address=3212, remarks=2322]', '2017-11-03 19:19:47', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2487', '查询客户信息', '2017-11-03 19:19:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2488', '查询客户信息', '2017-11-03 19:19:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2489', '查询商品类别信息', '2017-11-03 19:22:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2490', '查询商品信息', '2017-11-03 19:22:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2491', '查询商品单位信息', '2017-11-03 19:22:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2492', '查询商品信息', '2017-11-03 19:22:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2493', '查询商品信息', '2017-11-03 19:22:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2494', '查询商品信息', '2017-11-03 19:22:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2495', '查询商品信息', '2017-11-03 19:22:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2496', '查询商品信息', '2017-11-03 19:22:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2497', '查询商品信息', '2017-11-03 19:22:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2498', '查询商品信息', '2017-11-03 19:22:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2499', '查询商品信息', '2017-11-03 19:22:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2500', '查询商品信息', '2017-11-03 19:22:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2501', '查询商品信息', '2017-11-03 19:22:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2502', '查询商品信息', '2017-11-03 19:22:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2503', '查询商品信息', '2017-11-03 19:22:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2504', '查询商品信息', '2017-11-03 19:22:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2505', '查询商品信息', '2017-11-03 19:22:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2506', '查询商品信息', '2017-11-03 19:22:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2507', '查询商品信息', '2017-11-03 19:22:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2508', '查询商品信息', '2017-11-03 19:22:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2509', '查询商品信息', '2017-11-03 19:22:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2510', '查询商品信息', '2017-11-03 19:22:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2511', '查询商品信息', '2017-11-03 19:22:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2512', '添加商品类别信息[id=null, name=xx, state=0, icon=icon-folder, pId=1]', '2017-11-03 19:22:51', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2513', '查询商品类别信息', '2017-11-03 19:22:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2514', '查询商品信息', '2017-11-03 19:22:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2515', '添加商品类别信息[id=null, name=22, state=0, icon=icon-folder, pId=18]', '2017-11-03 19:22:58', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2516', '查询商品类别信息', '2017-11-03 19:22:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2517', '查询商品信息', '2017-11-03 19:23:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2518', '查询商品信息', '2017-11-03 19:23:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2519', '删除商品类别信息[id=19, name=22, state=0, icon=icon-folder, pId=18]', '2017-11-03 19:23:02', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2520', '查询商品类别信息', '2017-11-03 19:23:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2521', '查询商品信息', '2017-11-03 19:23:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2522', '删除商品类别信息[id=18, name=xx, state=0, icon=icon-folder, pId=1]', '2017-11-03 19:23:04', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2523', '查询商品类别信息', '2017-11-03 19:23:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2524', '查询商品信息', '2017-11-03 19:23:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2525', '查询商品信息', '2017-11-03 19:23:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2526', '查询商品信息', '2017-11-03 19:23:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2527', '查询商品信息', '2017-11-03 19:23:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2528', '查询商品信息', '2017-11-03 19:23:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2529', '查询商品信息', '2017-11-03 19:23:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2530', '查询商品信息', '2017-11-03 19:23:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2531', '查询商品类别信息', '2017-11-03 19:23:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2532', '添加商品单位信息[id=null, name=2]', '2017-11-03 19:25:11', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2533', '查询商品单位信息', '2017-11-03 19:25:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2534', '查询商品类别信息', '2017-11-03 19:25:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2535', '删除商品单位信息[id=10, name=2]', '2017-11-03 19:25:26', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2536', '查询商品单位信息', '2017-11-03 19:25:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2537', '添加商品信息[id=null, code=0015, name=xx, model=fds, unit=盒, purchasingPrice=50.0, sellingPrice=100.0, inventoryQuantity=0, minNum=20, producer=21, remarks=321]', '2017-11-03 19:25:36', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2538', '查询商品信息', '2017-11-03 19:25:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2539', '查询商品信息', '2017-11-03 19:25:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2540', '更新商品信息[id=23, code=0015, name=xx22, model=fds2, unit=盒, purchasingPrice=50.0, sellingPrice=100.0, inventoryQuantity=0, minNum=20, producer=21, remarks=3211]', '2017-11-03 19:35:31', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2541', '查询商品信息', '2017-11-03 19:35:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2542', '删除商品信息[id=23, code=0015, name=xx22, model=fds2, unit=盒, purchasingPrice=50.0, sellingPrice=100.0, inventoryQuantity=0, minNum=20, producer=21, remarks=3211]', '2017-11-03 19:35:40', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2543', '查询商品信息', '2017-11-03 19:35:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2544', '查询商品信息', '2017-11-03 19:35:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2545', '查询商品信息', '2017-11-03 19:35:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2546', '查询商品信息', '2017-11-03 19:35:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2547', '查询商品信息', '2017-11-03 19:35:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2548', '查询商品信息', '2017-11-03 19:35:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2549', '查询商品信息（无库存）', '2017-11-03 19:36:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2550', '查询商品信息（无库存）', '2017-11-03 19:36:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2551', '查询商品信息（有库存）', '2017-11-03 19:36:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2552', '查询商品信息（有库存）', '2017-11-03 19:36:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2553', '查询商品信息（无库存）', '2017-11-03 19:36:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2554', '查询商品信息（无库存）', '2017-11-03 19:36:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2555', '查询商品类别信息', '2017-11-03 19:37:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2556', '查询商品类别信息', '2017-11-03 19:40:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2557', '添加商品信息[id=null, code=0015, name= iPhone X, model=X, unit=台, purchasingPrice=8000.0, sellingPrice=9500.0, inventoryQuantity=0, minNum=100, producer=xx, remarks=xxx]', '2017-11-03 19:40:22', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2558', '查询商品信息', '2017-11-03 19:40:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2559', '查询商品信息', '2017-11-03 19:40:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2560', '查询商品信息', '2017-11-03 19:40:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2561', '查询商品信息', '2017-11-03 19:40:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2562', '更新商品信息[id=24, code=0015, name= iPhone X, model=X, unit=台, purchasingPrice=8000.0, sellingPrice=9500.0, inventoryQuantity=0, minNum=100, producer=xx2, remarks=xxx2]', '2017-11-03 19:40:32', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2563', '查询商品信息', '2017-11-03 19:40:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2564', '查询商品信息（无库存）', '2017-11-03 19:40:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2565', '查询商品信息（无库存）', '2017-11-03 19:40:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2566', '查询商品信息（无库存）', '2017-11-03 19:40:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2567', '查询商品信息（无库存）', '2017-11-03 19:40:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2568', '查询商品信息（无库存）', '2017-11-03 19:40:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2569', '修改商品[id=24, code=0015, name= iPhone X, model=X, unit=台, purchasingPrice=8000.0, sellingPrice=9500.0, inventoryQuantity=50, minNum=100, producer=xx2, remarks=xxx2]，价格=8000.0,库存=50', '2017-11-03 19:41:01', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2570', '查询商品信息（无库存）', '2017-11-03 19:41:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2571', '查询商品信息（有库存）', '2017-11-03 19:41:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2572', '查询商品信息（有库存）', '2017-11-03 19:41:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2573', '查询商品信息（无库存）', '2017-11-03 19:41:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2574', '查询商品信息（有库存）', '2017-11-03 19:41:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2575', '查询商品类别信息', '2017-11-03 19:46:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2576', '查询商品信息', '2017-11-03 19:46:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2577', '查询商品单位信息', '2017-11-03 19:46:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2578', '查询商品信息', '2017-11-03 19:46:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2579', '查询商品单位信息', '2017-11-03 19:46:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2580', '查询商品类别信息', '2017-11-03 19:46:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2581', '查询角色信息', '2017-11-03 19:47:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2582', '查询角色信息', '2017-11-03 19:47:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2583', '添加角色信息[id=null, name=xx, remarks=]', '2017-11-03 19:47:20', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2584', '查询角色信息', '2017-11-03 19:47:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2585', '添加角色信息[id=null, name=xx2, remarks=x]', '2017-11-03 19:47:24', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2586', '查询角色信息', '2017-11-03 19:47:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2587', '更新角色信息[id=11, name=xx23, remarks=x3]', '2017-11-03 19:47:29', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2588', '查询角色信息', '2017-11-03 19:47:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2589', '删除角色信息[id=11, name=xx23, remarks=x3]', '2017-11-03 19:47:42', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2590', '查询角色信息', '2017-11-03 19:47:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2591', '删除角色信息[id=10, name=xx, remarks=]', '2017-11-03 19:47:45', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2592', '查询角色信息', '2017-11-03 19:47:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2593', '保存角色权限设置', '2017-11-03 19:48:30', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2594', '查询角色信息', '2017-11-03 19:48:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2595', '查询角色信息', '2017-11-03 19:48:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2596', '查询用户信息', '2017-11-03 19:48:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2597', '查询用户信息', '2017-11-03 19:48:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2598', '查询所有角色信息', '2017-11-03 19:48:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2599', '查询所有角色信息', '2017-11-03 19:49:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2600', '保存用户角色设置', '2017-11-03 19:49:03', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2601', '查询用户信息', '2017-11-03 19:49:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2602', '查询所有角色信息', '2017-11-03 19:49:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2603', '用户注销', '2017-11-03 19:49:14', '注销操作', '1');
INSERT INTO `t_log` VALUES ('2604', '用户登录', '2017-11-03 19:49:22', '登录操作', '3');
INSERT INTO `t_log` VALUES ('2605', '查询商品库存信息', '2017-11-03 19:49:25', '查询操作', '3');
INSERT INTO `t_log` VALUES ('2606', '查询商品类别信息', '2017-11-03 19:49:45', '查询操作', '3');
INSERT INTO `t_log` VALUES ('2607', '查询商品库存信息', '2017-11-03 19:49:47', '查询操作', '3');
INSERT INTO `t_log` VALUES ('2608', '查询商品类别信息', '2017-11-03 19:49:48', '查询操作', '3');
INSERT INTO `t_log` VALUES ('2609', '查询商品库存信息', '2017-11-03 19:49:51', '查询操作', '3');
INSERT INTO `t_log` VALUES ('2610', '查询商品库存信息', '2017-11-03 19:49:54', '查询操作', '3');
INSERT INTO `t_log` VALUES ('2611', '查询商品库存信息', '2017-11-03 19:49:58', '查询操作', '3');
INSERT INTO `t_log` VALUES ('2612', '查询商品库存信息', '2017-11-03 19:49:59', '查询操作', '3');
INSERT INTO `t_log` VALUES ('2613', '用户登录', '2017-11-03 19:50:15', '登录操作', '3');
INSERT INTO `t_log` VALUES ('2614', '查询商品库存信息', '2017-11-03 19:50:17', '查询操作', '3');
INSERT INTO `t_log` VALUES ('2615', '用户登录', '2017-11-03 19:50:42', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2616', '查询商品库存信息', '2017-11-03 19:50:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2617', '用户登录', '2017-11-03 19:56:23', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2618', '查询商品库存信息', '2017-11-03 19:56:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2619', '用户登录', '2017-11-03 19:58:41', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2620', '查询商品库存信息', '2017-11-03 19:58:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2621', '修改密码', '2017-11-03 20:03:18', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2622', '用户注销', '2017-11-03 20:03:20', '注销操作', '1');
INSERT INTO `t_log` VALUES ('2623', '用户登录', '2017-11-03 20:03:27', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2624', '查询商品库存信息', '2017-11-03 20:03:27', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2625', '查询商品信息', '2017-11-03 20:03:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2626', '查询商品信息', '2017-11-03 20:03:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2627', '查询商品类别信息', '2017-11-03 20:04:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2628', '查询商品信息', '2017-11-03 20:04:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2629', '查询商品信息', '2017-11-03 20:04:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2630', '查询商品信息', '2017-11-03 20:04:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2631', '查询商品信息', '2017-11-03 20:04:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2632', '添加商品类别信息[id=null, name=是, state=0, icon=icon-folder, pId=1]', '2017-11-03 20:04:50', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2633', '查询商品类别信息', '2017-11-03 20:04:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2634', '查询商品信息', '2017-11-03 20:04:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2635', '删除商品类别信息[id=20, name=是, state=0, icon=icon-folder, pId=1]', '2017-11-03 20:04:52', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2636', '查询商品类别信息', '2017-11-03 20:04:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2637', '查询商品信息', '2017-11-03 20:05:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2638', '查询商品信息', '2017-11-03 20:05:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2639', '查询商品信息', '2017-11-03 20:05:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2640', '查询商品信息', '2017-11-03 20:05:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2641', '查询商品信息', '2017-11-03 20:05:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2642', '查询商品信息', '2017-11-03 20:05:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2643', '查询商品信息', '2017-11-03 20:05:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2644', '查询商品信息', '2017-11-03 20:05:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2645', '查询商品信息', '2017-11-03 20:05:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2646', '查询商品信息', '2017-11-03 20:05:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2647', '添加进货单', '2017-11-03 20:06:22', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2648', '查询商品信息', '2017-11-03 20:06:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2649', '查询商品信息', '2017-11-03 20:06:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2650', '删除进货单信息null', '2017-11-03 20:07:18', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2651', '查询商品信息', '2017-11-03 20:07:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2652', '查询商品信息', '2017-11-03 20:07:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2653', '查询商品类别信息', '2017-11-03 20:07:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2654', '查询商品信息', '2017-11-03 20:07:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2655', '查询商品信息', '2017-11-03 20:08:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2656', '查询商品信息', '2017-11-03 20:08:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2657', '查询商品信息', '2017-11-03 20:08:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2658', '查询商品信息', '2017-11-03 20:08:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2659', '查询商品信息', '2017-11-03 20:08:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2660', '查询商品信息', '2017-11-03 20:08:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2661', '添加进货单', '2017-11-03 20:08:25', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2662', '查询商品信息', '2017-11-03 20:08:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2663', '查询商品信息', '2017-11-03 20:08:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2664', '查询商品信息', '2017-11-03 20:08:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2665', '查询商品信息', '2017-11-03 20:08:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2666', '查询商品类别信息', '2017-11-03 20:08:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2667', '查询商品信息', '2017-11-03 20:08:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2668', '查询商品信息', '2017-11-03 20:08:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2669', '查询商品信息', '2017-11-03 20:08:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2670', '添加商品类别信息[id=null, name=cc, state=0, icon=icon-folder, pId=1]', '2017-11-03 20:08:47', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2671', '查询商品类别信息', '2017-11-03 20:08:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2672', '查询商品信息', '2017-11-03 20:08:48', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2673', '添加商品类别信息[id=null, name=cc, state=0, icon=icon-folder, pId=21]', '2017-11-03 20:08:50', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2674', '查询商品类别信息', '2017-11-03 20:08:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2675', '查询商品信息', '2017-11-03 20:08:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2676', '查询商品信息', '2017-11-03 20:08:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2677', '删除商品类别信息[id=22, name=cc, state=0, icon=icon-folder, pId=21]', '2017-11-03 20:08:53', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2678', '查询商品类别信息', '2017-11-03 20:08:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2679', '查询商品信息', '2017-11-03 20:08:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2680', '删除商品类别信息[id=21, name=cc, state=0, icon=icon-folder, pId=1]', '2017-11-03 20:08:54', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2681', '查询商品类别信息', '2017-11-03 20:08:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2682', '查询商品信息', '2017-11-03 20:08:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2683', '查询商品信息', '2017-11-03 20:08:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2684', '查询商品信息', '2017-11-03 20:08:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2685', '查询商品信息', '2017-11-03 20:08:57', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2686', '查询商品信息', '2017-11-03 20:08:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2687', '查询商品信息', '2017-11-03 20:08:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2688', '查询商品类别信息', '2017-11-03 20:09:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2689', '查询商品信息', '2017-11-03 20:09:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2690', '查询商品单位信息', '2017-11-03 20:09:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2691', '查询商品信息', '2017-11-03 20:09:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2692', '查询商品单位信息', '2017-11-03 20:09:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2693', '查询商品信息', '2017-11-03 20:09:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2694', '更新商品信息[id=24, code=0015, name= iPhone X, model=X, unit=台, purchasingPrice=8000.0, sellingPrice=9500.0, inventoryQuantity=0, minNum=100, producer=xx2, remarks=xxx2]', '2017-11-03 20:09:41', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2695', '查询商品信息', '2017-11-03 20:09:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2696', '更新商品信息[id=24, code=0015, name= iPhone X, model=X, unit=台, purchasingPrice=8000.0, sellingPrice=9500.0, inventoryQuantity=0, minNum=100, producer=xx2, remarks=xxx2]', '2017-11-03 20:09:47', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2697', '查询商品信息', '2017-11-03 20:09:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2698', '查询商品信息（无库存）', '2017-11-03 20:09:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2699', '查询商品信息（无库存）', '2017-11-03 20:09:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2700', '查询商品信息（有库存）', '2017-11-03 20:09:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2701', '查询商品信息（有库存）', '2017-11-03 20:09:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2702', '修改商品[id=24, code=0015, name= iPhone X, model=X, unit=台, purchasingPrice=8000.0, sellingPrice=9500.0, inventoryQuantity=50, minNum=100, producer=xx2, remarks=xxx2]，价格=8000.0,库存=50', '2017-11-03 20:10:01', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2703', '查询商品信息（有库存）', '2017-11-03 20:10:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2704', '查询商品信息（无库存）', '2017-11-03 20:10:01', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2705', '查询商品信息（有库存）', '2017-11-03 20:10:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2706', '查询商品信息（有库存）', '2017-11-03 20:10:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2707', '查询商品信息（无库存）', '2017-11-03 20:10:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2708', '查询商品信息', '2017-11-03 20:10:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2709', '查询商品信息', '2017-11-03 20:10:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2710', '查询商品类别信息', '2017-11-03 20:10:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2711', '查询商品信息', '2017-11-03 20:10:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2712', '查询商品信息', '2017-11-03 20:11:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2713', '查询客户信息', '2017-11-03 20:20:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2714', '查询客户信息', '2017-11-03 20:20:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2715', '查询商品类别信息', '2017-11-03 20:21:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2716', '查询商品单位信息', '2017-11-03 20:21:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2717', '查询商品信息', '2017-11-03 20:21:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2718', '查询商品信息', '2017-11-03 20:21:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2719', '查询商品单位信息', '2017-11-03 20:21:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2720', '查询商品类别信息', '2017-11-03 20:21:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2721', '添加商品信息[id=null, code=0016, name=21, model=X, unit=盒, purchasingPrice=100.0, sellingPrice=120.0, inventoryQuantity=0, minNum=12, producer=32, remarks=21]', '2017-11-03 20:21:42', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2722', '查询商品信息', '2017-11-03 20:21:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2723', '查询商品信息（无库存）', '2017-11-03 20:22:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2724', '查询商品信息（有库存）', '2017-11-03 20:22:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2725', '查询商品信息（无库存）', '2017-11-03 20:22:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2726', '查询商品信息（有库存）', '2017-11-03 20:22:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2727', '修改商品[id=25, code=0016, name=21, model=X, unit=盒, purchasingPrice=100.0, sellingPrice=120.0, inventoryQuantity=100, minNum=12, producer=32, remarks=21]，价格=100.0,库存=100', '2017-11-03 20:22:15', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2728', '查询商品信息（无库存）', '2017-11-03 20:22:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2729', '查询商品信息（有库存）', '2017-11-03 20:22:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2730', '查询商品信息（有库存）', '2017-11-03 20:22:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2731', '查询商品信息（有库存）', '2017-11-03 20:22:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2732', '查询商品信息（无库存）', '2017-11-03 20:22:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2733', '查询商品类别信息', '2017-11-03 20:22:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2734', '添加退货单', '2017-11-03 20:23:15', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2735', '查询商品信息', '2017-11-03 20:23:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2736', '查询商品信息', '2017-11-03 20:23:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2737', '查询商品类别信息', '2017-11-03 20:24:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2738', '查询商品类别信息', '2017-11-03 20:36:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2739', '查询商品单位信息', '2017-11-03 20:37:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2740', '查询商品信息', '2017-11-03 20:37:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2741', '查询商品信息', '2017-11-03 20:37:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2742', '查询商品单位信息', '2017-11-03 20:37:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2743', '查询商品类别信息', '2017-11-03 20:37:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2744', '查询商品库存信息', '2017-11-03 20:37:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2745', '查询商品类别信息', '2017-11-03 20:37:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2746', '查询商品库存信息', '2017-11-03 20:37:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2747', '查询商品库存信息', '2017-11-03 20:37:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2748', '查询商品类别信息', '2017-11-03 20:37:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2749', '查询商品库存信息', '2017-11-03 20:37:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2750', '查询商品库存信息', '2017-11-03 20:37:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2751', '查询商品信息', '2017-11-03 20:37:48', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2752', '添加商品信息[id=null, code=0017, name=Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电, model=ILCE-A6000L, unit=台, purchasingPrice=3000.0, sellingPrice=3650.0, inventoryQuantity=0, minNum=100, producer=xxx, remarks=xxx]', '2017-11-03 20:44:59', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2753', '查询商品信息', '2017-11-03 20:44:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2754', '添加商品信息[id=null, code=0018, name=Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄, model=IXUS 285 HS, unit=台, purchasingPrice=800.0, sellingPrice=1299.0, inventoryQuantity=0, minNum=400, producer=xx, remarks=xxx]', '2017-11-03 20:45:33', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2755', '查询商品信息', '2017-11-03 20:45:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2756', '查询商品信息', '2017-11-03 20:45:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2757', '添加商品信息[id=null, code=0019, name=Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音, model=Q8, unit=台, purchasingPrice=60.0, sellingPrice=129.0, inventoryQuantity=0, minNum=300, producer=xxxx, remarks=]', '2017-11-03 20:47:08', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2758', '查询商品信息', '2017-11-03 20:47:08', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2759', '查询商品信息', '2017-11-03 20:47:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2760', '查询商品信息', '2017-11-03 20:47:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2761', '查询商品信息', '2017-11-03 20:47:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2762', '查询商品信息', '2017-11-03 20:47:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2763', '查询商品信息', '2017-11-03 20:47:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2764', '查询商品信息', '2017-11-03 20:47:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2765', '查询商品信息', '2017-11-03 20:47:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2766', '添加商品信息[id=null, code=0020, name=Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻, model=190WDPT, unit=台, purchasingPrice=1000.0, sellingPrice=1699.0, inventoryQuantity=0, minNum=50, producer=cc, remarks=]', '2017-11-03 20:48:10', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2767', '查询商品信息', '2017-11-03 20:48:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2768', '查询商品信息', '2017-11-03 20:48:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2769', '查询商品信息', '2017-11-03 20:48:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2770', '查询商品信息', '2017-11-03 20:48:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2771', '查询商品信息', '2017-11-03 20:48:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2772', '添加商品信息[id=null, code=0021, name=Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机, model=4A , unit=台, purchasingPrice=700.0, sellingPrice=1199.0, inventoryQuantity=0, minNum=320, producer=cc, remarks=]', '2017-11-03 20:49:11', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2773', '查询商品信息', '2017-11-03 20:49:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2774', '查询商品信息', '2017-11-03 20:49:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2775', '查询商品信息', '2017-11-03 20:49:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2776', '查询商品信息', '2017-11-03 20:49:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2777', '添加商品信息[id=null, code=0022, name=TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌, model=XQB55-36SP, unit=台, purchasingPrice=400.0, sellingPrice=729.0, inventoryQuantity=0, minNum=40, producer=cc, remarks=]', '2017-11-03 20:49:46', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2778', '查询商品信息', '2017-11-03 20:49:46', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2779', '查询商品信息', '2017-11-03 20:49:48', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2780', '查询商品信息', '2017-11-03 20:49:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2781', '查询商品信息', '2017-11-03 20:49:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2782', '添加商品信息[id=null, code=0023, name=台湾进口膨化零食品张君雅小妹妹日式串烧丸子80g*2, model=80g*2, unit=袋, purchasingPrice=4.0, sellingPrice=15.0, inventoryQuantity=0, minNum=1000, producer=cc, remarks=]', '2017-11-03 20:50:34', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2783', '查询商品信息', '2017-11-03 20:50:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2784', '查询商品信息', '2017-11-03 20:50:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2785', '查询商品信息', '2017-11-03 20:50:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2786', '查询商品信息', '2017-11-03 20:50:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2787', '删除商品单位信息[id=9, name=扫]', '2017-11-03 20:51:09', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2788', '查询商品单位信息', '2017-11-03 20:51:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2789', '添加商品单位信息[id=null, name=件]', '2017-11-03 20:51:18', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2790', '查询商品单位信息', '2017-11-03 20:51:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2791', '添加商品信息[id=null, code=0024, name=卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙, model=A字裙, unit=件, purchasingPrice=168.0, sellingPrice=298.0, inventoryQuantity=0, minNum=10, producer=cc, remarks=]', '2017-11-03 20:51:32', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2792', '查询商品信息', '2017-11-03 20:51:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2793', '查询商品信息', '2017-11-03 20:51:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2794', '添加商品信息[id=null, code=0025, name=西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服, model=三件套秋, unit=件, purchasingPrice=189.0, sellingPrice=299.0, inventoryQuantity=0, minNum=10, producer=cc, remarks=]', '2017-11-03 20:52:14', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2795', '查询商品信息', '2017-11-03 20:52:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2796', '查询商品信息', '2017-11-03 20:52:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2797', '添加商品单位信息[id=null, name=条]', '2017-11-03 20:52:50', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2798', '查询商品单位信息', '2017-11-03 20:52:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2799', '添加商品信息[id=null, code=0026, name=加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子, model=AFS JEEP, unit=条, purchasingPrice=60.0, sellingPrice=89.0, inventoryQuantity=0, minNum=10, producer=c, remarks=]', '2017-11-03 20:53:04', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2800', '查询商品信息', '2017-11-03 20:53:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2801', '查询商品信息', '2017-11-03 20:53:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2802', '查询商品信息', '2017-11-03 20:53:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2803', '查询商品库存信息', '2017-11-03 20:53:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2804', '查询商品库存信息', '2017-11-03 20:53:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2805', '查询商品库存信息', '2017-11-03 20:53:15', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2806', '查询商品库存信息', '2017-11-03 20:53:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2807', '查询商品库存信息', '2017-11-03 20:53:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2808', '查询商品类别信息', '2017-11-03 20:53:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2809', '查询商品信息', '2017-11-03 20:53:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2810', '添加进货单', '2017-11-03 20:54:04', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2811', '查询商品信息', '2017-11-03 20:54:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2812', '查询商品信息', '2017-11-03 20:54:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2813', '查询商品库存信息', '2017-11-03 20:54:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2814', '查询商品库存信息', '2017-11-03 20:54:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2815', '查询商品信息', '2017-11-03 20:54:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2816', '查询商品信息', '2017-11-03 20:54:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2817', '查询商品类别信息', '2017-11-03 20:54:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2818', '查询商品类别信息', '2017-11-03 20:54:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2819', '查询商品类别信息', '2017-11-03 20:54:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2820', '查询商品类别信息', '2017-11-03 20:54:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2821', '添加销售单', '2017-11-03 20:55:08', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2822', '查询商品信息', '2017-11-03 20:55:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2823', '查询商品信息', '2017-11-03 20:55:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2824', '查询商品信息', '2017-11-03 20:55:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2825', '查询商品信息', '2017-11-03 20:55:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2826', '查询商品类别信息', '2017-11-03 20:55:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2827', '添加客户退货单', '2017-11-03 20:55:18', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2828', '查询商品信息', '2017-11-03 20:55:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2829', '查询商品信息', '2017-11-03 20:55:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2830', '查询商品类别信息', '2017-11-03 20:55:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2831', '添加销售单', '2017-11-03 20:55:35', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2832', '查询商品信息', '2017-11-03 20:55:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2833', '查询商品信息', '2017-11-03 20:55:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2834', '删除销售单信息null', '2017-11-03 20:56:16', '删除操作', '1');
INSERT INTO `t_log` VALUES ('2835', '查询商品信息', '2017-11-03 20:56:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2836', '查询商品信息', '2017-11-03 20:56:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2837', '查询商品类别信息', '2017-11-03 20:56:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2838', '添加报损单', '2017-11-03 20:56:31', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2839', '查询商品信息', '2017-11-03 20:56:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2840', '查询商品信息', '2017-11-03 20:56:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2841', '查询商品信息', '2017-11-03 20:56:48', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2842', '查询商品信息', '2017-11-03 20:56:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2843', '查询商品类别信息', '2017-11-03 20:58:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2844', '添加销售单', '2017-11-03 20:59:10', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2845', '查询商品信息', '2017-11-03 20:59:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2846', '查询商品信息', '2017-11-03 20:59:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2847', '查询商品类别信息', '2017-11-03 20:59:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2848', '查询商品类别信息', '2017-11-03 20:59:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2849', '查询商品信息', '2017-11-03 20:59:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2850', '查询商品信息', '2017-11-03 20:59:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2851', '查询商品信息', '2017-11-03 20:59:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2852', '查询商品信息', '2017-11-03 20:59:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2853', '添加销售单', '2017-11-03 20:59:28', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2854', '查询商品信息', '2017-11-03 20:59:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2855', '查询商品信息', '2017-11-03 20:59:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2856', '查询商品类别信息', '2017-11-03 20:59:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2857', '添加销售单', '2017-11-03 20:59:37', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2858', '查询商品信息', '2017-11-03 20:59:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2859', '查询商品信息', '2017-11-03 20:59:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2860', '查询商品类别信息', '2017-11-03 20:59:39', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2861', '添加销售单', '2017-11-03 20:59:48', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2862', '查询商品信息', '2017-11-03 20:59:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2863', '查询商品信息', '2017-11-03 20:59:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2864', '查询商品类别信息', '2017-11-03 20:59:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2865', '添加销售单', '2017-11-03 21:00:01', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2866', '查询商品信息', '2017-11-03 21:00:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2867', '查询商品信息', '2017-11-03 21:00:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2868', '查询商品类别信息', '2017-11-03 21:00:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2869', '添加销售单', '2017-11-03 21:00:16', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2870', '查询商品信息', '2017-11-03 21:00:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2871', '查询商品信息', '2017-11-03 21:00:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2872', '查询商品类别信息', '2017-11-03 21:00:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2873', '添加销售单', '2017-11-03 21:00:27', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2874', '查询商品信息', '2017-11-03 21:00:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2875', '查询商品信息', '2017-11-03 21:00:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2876', '查询商品类别信息', '2017-11-03 21:06:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2877', '查询商品类别信息', '2017-11-03 21:07:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2878', '添加销售单', '2017-11-03 21:07:18', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2879', '查询商品信息', '2017-11-03 21:07:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2880', '查询商品信息', '2017-11-03 21:07:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2881', '查询商品类别信息', '2017-11-03 21:07:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2882', '查询商品信息', '2017-11-03 21:07:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2883', '添加销售单', '2017-11-03 21:07:43', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2884', '查询商品信息', '2017-11-03 21:07:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2885', '查询商品信息', '2017-11-03 21:07:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2886', '查询商品类别信息', '2017-11-03 21:07:46', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2887', '添加销售单', '2017-11-03 21:07:53', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2888', '查询商品信息', '2017-11-03 21:07:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2889', '查询商品信息', '2017-11-03 21:07:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2890', '查询商品类别信息', '2017-11-03 21:07:59', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2891', '查询商品信息', '2017-11-03 21:08:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2892', '添加销售单', '2017-11-03 21:08:09', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2893', '查询商品信息', '2017-11-03 21:08:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2894', '查询商品信息', '2017-11-03 21:08:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2895', '查询商品类别信息', '2017-11-03 21:08:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2896', '查询商品类别信息', '2017-11-03 21:08:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2897', '查询商品信息', '2017-11-03 21:08:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2898', '添加销售单', '2017-11-03 21:08:27', '添加操作', '1');
INSERT INTO `t_log` VALUES ('2899', '查询商品信息', '2017-11-03 21:08:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2900', '查询商品信息', '2017-11-03 21:08:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2901', '查询商品类别信息', '2017-11-03 21:22:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2902', '查询商品类别信息', '2017-11-03 21:22:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2903', '查询商品信息', '2017-11-03 21:22:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2904', '查询商品信息', '2017-11-03 21:22:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2905', '查询商品类别信息', '2017-11-03 21:22:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2906', '查询商品库存信息', '2017-11-03 21:22:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2907', '查询商品信息', '2017-11-03 21:22:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2908', '查询商品信息', '2017-11-03 21:22:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2909', '查询商品库存信息', '2017-11-03 21:23:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2910', '查询客户信息', '2017-11-03 21:26:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2911', '查询客户信息', '2017-11-03 21:26:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2912', '查询用户信息', '2017-11-03 21:26:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2913', '查询用户信息', '2017-11-03 21:26:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2914', '查询角色信息', '2017-11-03 21:26:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2915', '查询角色信息', '2017-11-03 21:26:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2916', '查询商品信息', '2017-11-03 21:30:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2917', '查询商品信息', '2017-11-03 21:30:47', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2918', '查询商品库存信息', '2017-11-03 21:31:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2919', '用户登录', '2018-07-15 13:13:47', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2920', '查询商品库存信息', '2018-07-15 13:13:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2921', '查询商品信息', '2018-07-15 13:13:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2922', '查询商品信息', '2018-07-15 13:13:55', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2923', '查询商品信息', '2018-07-15 13:13:57', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2924', '查询商品信息', '2018-07-15 13:13:57', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2925', '查询商品库存信息', '2018-07-15 13:14:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2926', '查询客户信息', '2018-07-15 13:14:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2927', '查询客户信息', '2018-07-15 13:14:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2928', '查询供应商信息', '2018-07-15 13:14:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2929', '查询供应商信息', '2018-07-15 13:14:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2930', '查询商品类别信息', '2018-07-15 13:14:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2931', '查询商品信息', '2018-07-15 13:14:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2932', '查询商品单位信息', '2018-07-15 13:14:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2933', '查询商品单位信息', '2018-07-15 13:14:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2934', '查询商品信息', '2018-07-15 13:14:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2935', '查询商品信息', '2018-07-15 13:14:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2936', '查询商品信息', '2018-07-15 13:14:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2937', '查询商品信息', '2018-07-15 13:14:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2938', '查询商品信息', '2018-07-15 13:14:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2939', '查询商品库存信息', '2018-07-15 13:15:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2940', '查询商品信息', '2018-07-15 13:15:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2941', '查询商品信息', '2018-07-15 13:15:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2942', '查询商品信息', '2018-07-15 13:15:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2943', '查询商品信息', '2018-07-15 13:15:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2944', '查询商品信息', '2018-07-15 13:15:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2945', '查询商品信息', '2018-07-15 13:15:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2946', '查询商品信息', '2018-07-15 13:15:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2947', '查询商品信息', '2018-07-15 13:15:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2948', '修改密码', '2018-07-15 13:15:35', '更新操作', '1');
INSERT INTO `t_log` VALUES ('2949', '查询商品库存信息', '2018-07-15 13:15:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2950', '用户注销', '2018-07-15 13:15:44', '注销操作', '1');
INSERT INTO `t_log` VALUES ('2951', '用户登录', '2018-07-15 13:23:02', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2952', '查询商品库存信息', '2018-07-15 13:23:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2953', '用户登录', '2018-07-15 13:25:04', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2954', '查询商品库存信息', '2018-07-15 13:25:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2955', '查询商品库存信息', '2018-07-15 13:25:10', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2956', '查询商品库存信息', '2018-07-15 13:42:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2957', '查询商品信息', '2018-07-15 13:43:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2958', '查询商品信息', '2018-07-15 13:43:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2959', '查询商品信息', '2018-07-15 13:43:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2960', '查询商品信息', '2018-07-15 13:43:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2961', '查询商品信息', '2018-07-15 13:43:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2962', '查询商品信息', '2018-07-15 13:43:06', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2963', '查询商品类别信息', '2018-07-15 13:43:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2964', '查询商品信息', '2018-07-15 13:43:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2965', '查询商品单位信息', '2018-07-15 13:43:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2966', '查询商品信息', '2018-07-15 13:43:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2967', '查询商品单位信息', '2018-07-15 13:43:09', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2968', '查询商品类别信息', '2018-07-15 13:43:19', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2969', '查询商品信息', '2018-07-15 13:43:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2970', '查询商品信息', '2018-07-15 13:43:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2971', '查询商品信息', '2018-07-15 13:43:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2972', '查询商品信息', '2018-07-15 13:43:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2973', '查询供应商信息', '2018-07-15 13:43:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2974', '查询供应商信息', '2018-07-15 13:43:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2975', '查询客户信息', '2018-07-15 13:43:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2976', '查询客户信息', '2018-07-15 13:43:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2977', '查询商品信息（无库存）', '2018-07-15 13:43:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2978', '查询商品信息（有库存）', '2018-07-15 13:43:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2979', '查询商品信息（有库存）', '2018-07-15 13:43:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2980', '查询商品信息（无库存）', '2018-07-15 13:43:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2981', '查询商品库存信息', '2018-07-15 13:43:44', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2982', '用户登录', '2018-07-15 13:49:42', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2983', '查询商品库存信息', '2018-07-15 13:49:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2984', '查询商品库存信息', '2018-07-15 13:50:24', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2985', '查询商品库存信息', '2018-07-15 13:50:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2986', '查询商品库存信息', '2018-07-15 13:51:35', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2987', '用户登录', '2018-07-15 13:53:53', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2988', '查询商品库存信息', '2018-07-15 13:53:54', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2989', '查询商品库存信息', '2018-07-15 13:53:56', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2990', '查询商品库存信息', '2018-07-15 13:55:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2991', '查询商品库存信息', '2018-07-15 13:55:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2992', '用户登录', '2018-07-15 14:00:33', '登录操作', '1');
INSERT INTO `t_log` VALUES ('2993', '查询商品库存信息', '2018-07-15 14:00:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2994', '查询商品库存信息', '2018-07-15 14:00:37', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2995', '查询商品信息', '2018-07-15 14:00:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2996', '查询商品信息', '2018-07-15 14:00:40', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2997', '查询商品信息', '2018-07-15 14:00:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2998', '查询商品信息', '2018-07-15 14:00:41', '查询操作', '1');
INSERT INTO `t_log` VALUES ('2999', '查询商品信息', '2018-07-15 14:00:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3000', '查询商品信息', '2018-07-15 14:00:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3001', '查询商品类别信息', '2018-07-15 14:00:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3002', '查询商品信息', '2018-07-15 14:00:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3003', '查询商品单位信息', '2018-07-15 14:00:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3004', '查询商品单位信息', '2018-07-15 14:00:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3005', '查询商品信息', '2018-07-15 14:00:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3006', '查询用户信息', '2018-07-15 14:00:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3007', '查询用户信息', '2018-07-15 14:00:58', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3008', '查询角色信息', '2018-07-15 14:01:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3009', '查询角色信息', '2018-07-15 14:01:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3010', '查询商品信息（无库存）', '2018-07-15 14:01:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3011', '查询商品信息（无库存）', '2018-07-15 14:01:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3012', '查询商品信息（有库存）', '2018-07-15 14:01:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3013', '查询商品信息（有库存）', '2018-07-15 14:01:07', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3014', '查询客户信息', '2018-07-15 14:01:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3015', '查询客户信息', '2018-07-15 14:01:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3016', '查询供应商信息', '2018-07-15 14:01:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3017', '查询供应商信息', '2018-07-15 14:01:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3018', '查询商品库存信息', '2018-07-15 14:01:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3019', '查询商品信息', '2018-07-15 14:01:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3020', '查询商品信息', '2018-07-15 14:01:31', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3021', '查询商品信息', '2018-07-15 14:01:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3022', '查询商品信息', '2018-07-15 14:01:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3023', '查询商品信息', '2018-07-15 14:01:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3024', '查询商品信息', '2018-07-15 14:01:34', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3025', '用户登录', '2018-07-15 14:03:03', '登录操作', '1');
INSERT INTO `t_log` VALUES ('3026', '查询商品库存信息', '2018-07-15 14:03:03', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3027', '查询商品信息', '2018-07-15 14:03:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3028', '查询商品信息', '2018-07-15 14:03:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3029', '查询商品信息', '2018-07-15 14:03:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3030', '查询商品信息', '2018-07-15 14:03:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3031', '查询商品信息', '2018-07-15 14:03:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3032', '查询商品信息', '2018-07-15 14:03:29', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3033', '查询商品类别信息', '2018-07-15 14:03:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3034', '查询商品信息', '2018-07-15 14:03:52', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3035', '查询商品信息', '2018-07-15 14:03:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3036', '查询商品信息', '2018-07-15 14:04:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3037', '查询商品信息', '2018-07-15 14:04:11', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3038', '查询商品信息', '2018-07-15 14:04:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3039', '查询商品信息', '2018-07-15 14:04:12', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3040', '查询商品库存信息', '2018-07-15 14:04:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3041', '查询商品信息', '2018-07-15 14:04:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3042', '查询商品信息', '2018-07-15 14:04:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3043', '查询商品信息', '2018-07-15 14:04:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3044', '查询商品信息', '2018-07-15 14:04:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3045', '查询商品信息', '2018-07-15 14:04:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3046', '查询商品信息', '2018-07-15 14:04:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3047', '查询商品类别信息', '2018-07-15 14:04:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3048', '查询商品信息', '2018-07-15 14:04:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3049', '查询客户信息', '2018-07-15 14:04:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3050', '查询客户信息', '2018-07-15 14:04:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3051', '查询商品信息', '2018-07-15 14:05:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3052', '查询商品信息', '2018-07-15 14:05:04', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3053', '用户登录', '2018-07-15 14:09:17', '登录操作', '1');
INSERT INTO `t_log` VALUES ('3054', '查询商品库存信息', '2018-07-15 14:09:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3055', '查询商品信息', '2018-07-15 14:09:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3056', '查询商品信息', '2018-07-15 14:09:43', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3057', '查询商品类别信息', '2018-07-15 14:10:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3058', '查询商品信息', '2018-07-15 14:11:21', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3059', '查询商品信息', '2018-07-15 14:11:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3060', '查询商品信息', '2018-07-15 14:11:25', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3061', '查询商品信息', '2018-07-15 14:11:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3062', '查询商品信息', '2018-07-15 14:11:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3063', '查询商品类别信息', '2018-07-15 14:11:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3064', '查询商品信息', '2018-07-15 14:11:50', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3065', '查询商品类别信息', '2018-07-15 14:12:05', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3066', '查询角色信息', '2018-07-15 14:12:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3067', '查询角色信息', '2018-07-15 14:12:13', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3068', '查询用户信息', '2018-07-15 14:12:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3069', '查询用户信息', '2018-07-15 14:12:17', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3070', '查询商品信息（无库存）', '2018-07-15 14:12:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3071', '查询商品信息（有库存）', '2018-07-15 14:12:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3072', '查询商品信息（无库存）', '2018-07-15 14:12:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3073', '查询商品信息（有库存）', '2018-07-15 14:12:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3074', '查询商品库存信息', '2018-07-15 14:12:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3075', '查询客户信息', '2018-07-15 14:13:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3076', '查询客户信息', '2018-07-15 14:13:45', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3077', '查询商品类别信息', '2018-07-15 14:14:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3078', '查询商品信息', '2018-07-15 14:14:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3079', '查询商品单位信息', '2018-07-15 14:14:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3080', '查询商品信息', '2018-07-15 14:14:18', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3081', '查询商品信息', '2018-07-15 14:14:20', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3082', '查询商品信息', '2018-07-15 14:14:22', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3083', '查询商品信息', '2018-07-15 14:14:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3084', '查询商品信息', '2018-07-15 14:14:26', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3085', '查询商品信息', '2018-07-15 14:14:28', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3086', '查询商品信息', '2018-07-15 14:14:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3087', '查询商品类别信息', '2018-07-15 14:14:48', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3088', '用户登录', '2018-07-15 15:29:35', '登录操作', '1');
INSERT INTO `t_log` VALUES ('3089', '查询商品库存信息', '2018-07-15 15:29:38', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3090', '查询角色信息', '2018-07-15 15:29:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3091', '查询角色信息', '2018-07-15 15:29:42', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3092', '查询商品信息', '2018-07-15 15:29:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3093', '查询商品信息', '2018-07-15 15:29:49', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3094', '查询商品信息', '2018-07-15 15:30:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3095', '查询商品信息', '2018-07-15 15:30:51', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3096', '查询商品信息', '2018-07-15 15:31:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3097', '查询商品信息', '2018-07-15 15:31:00', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3098', '查询商品类别信息', '2018-07-15 15:31:02', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3099', '查询商品类别信息', '2018-07-15 15:33:14', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3100', '添加报损单', '2018-07-15 15:33:28', '添加操作', '1');
INSERT INTO `t_log` VALUES ('3101', '查询商品信息', '2018-07-15 15:33:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3102', '查询商品信息', '2018-07-15 15:33:30', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3103', '查询商品信息', '2018-07-15 15:33:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3104', '查询商品信息', '2018-07-15 15:33:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3105', '查询商品库存信息', '2018-07-15 15:33:36', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3106', '用户登录', '2018-07-15 19:23:21', '登录操作', '1');
INSERT INTO `t_log` VALUES ('3107', '查询商品库存信息', '2018-07-15 19:23:23', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3108', '查询商品信息', '2018-07-15 19:25:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3109', '查询商品信息', '2018-07-15 19:25:32', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3110', '查询角色信息', '2018-07-15 19:25:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3111', '查询角色信息', '2018-07-15 19:25:33', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3112', '查询用户信息', '2018-07-15 19:25:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3113', '查询用户信息', '2018-07-15 19:25:53', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3114', '查询商品信息', '2018-07-15 19:26:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3115', '查询商品信息', '2018-07-15 19:26:16', '查询操作', '1');
INSERT INTO `t_log` VALUES ('3116', '????', '2018-09-17 16:24:01', '????', '1');
INSERT INTO `t_log` VALUES ('3117', '????????', '2018-09-17 16:24:12', '????', '1');
INSERT INTO `t_log` VALUES ('3118', '??????', '2018-09-17 16:24:32', '????', '1');
INSERT INTO `t_log` VALUES ('3119', '??????', '2018-09-17 16:24:32', '????', '1');
INSERT INTO `t_log` VALUES ('3120', '????????', '2018-09-17 16:24:35', '????', '1');
INSERT INTO `t_log` VALUES ('3121', '??????', '2018-09-17 16:24:35', '????', '1');
INSERT INTO `t_log` VALUES ('3122', '??????', '2018-09-17 16:24:36', '????', '1');
INSERT INTO `t_log` VALUES ('3123', '??????', '2018-09-17 16:24:36', '????', '1');
INSERT INTO `t_log` VALUES ('3124', '??????', '2018-09-17 16:24:36', '????', '1');
INSERT INTO `t_log` VALUES ('3125', '??????', '2018-09-17 16:24:38', '????', '1');
INSERT INTO `t_log` VALUES ('3126', '??????', '2018-09-17 16:24:38', '????', '1');
INSERT INTO `t_log` VALUES ('3127', '???????', '2018-09-17 16:24:41', '????', '1');
INSERT INTO `t_log` VALUES ('3128', '???????', '2018-09-17 16:24:41', '????', '1');
INSERT INTO `t_log` VALUES ('3129', '????????', '2018-09-17 16:24:41', '????', '1');
INSERT INTO `t_log` VALUES ('3130', '??????', '2018-09-17 16:24:41', '????', '1');
INSERT INTO `t_log` VALUES ('3131', '????????', '2018-09-17 16:24:41', '????', '1');
INSERT INTO `t_log` VALUES ('3132', '??????', '2018-09-17 16:24:41', '????', '1');
INSERT INTO `t_log` VALUES ('3133', '????????', '2018-09-17 16:24:41', '????', '1');
INSERT INTO `t_log` VALUES ('3134', '????', '2018-09-17 16:45:57', '????', '1');
INSERT INTO `t_log` VALUES ('3135', '????????', '2018-09-17 16:45:59', '????', '1');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsni20f28wjqrmpp44uawa2ky4` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6051 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', 'menu-plugin', '系统菜单', '1', null, '-1');
INSERT INTO `t_menu` VALUES ('10', 'menu-1', '进货管理', '1', null, '1');
INSERT INTO `t_menu` VALUES ('20', 'menu-2', '销售管理', '1', null, '1');
INSERT INTO `t_menu` VALUES ('30', 'menu-3', '库存管理', '1', null, '1');
INSERT INTO `t_menu` VALUES ('40', 'menu-4', '统计报表', '1', null, '1');
INSERT INTO `t_menu` VALUES ('50', 'menu-5', '基础资料', '1', null, '1');
INSERT INTO `t_menu` VALUES ('60', 'menu-6', '系统管理', '1', null, '1');
INSERT INTO `t_menu` VALUES ('1010', 'menu-11', '进货入库', '0', '/purchase/purchase.html', '10');
INSERT INTO `t_menu` VALUES ('1020', 'menu-12', '退货出库', '0', '/purchase/return.html', '10');
INSERT INTO `t_menu` VALUES ('1030', 'menu-13', '进货单据查询', '0', '/purchase/purchaseSearch.html', '10');
INSERT INTO `t_menu` VALUES ('1040', 'menu-14', '退货单据查询', '0', '/purchase/returnSearch.html', '10');
INSERT INTO `t_menu` VALUES ('1050', 'menu-15', '当前库存查询', '0', '/common/stockSearch.html', '10');
INSERT INTO `t_menu` VALUES ('2010', 'menu-21', '销售出库', '0', '/sale/saleout.html', '20');
INSERT INTO `t_menu` VALUES ('2020', 'menu-22', '客户退货', '0', '/sale/salereturn.html', '20');
INSERT INTO `t_menu` VALUES ('2030', 'menu-23', '销售单据查询', '0', '/sale/saleSearch.html', '20');
INSERT INTO `t_menu` VALUES ('2040', 'menu-24', '客户退货查询', '0', '/sale/returnSearch.html', '20');
INSERT INTO `t_menu` VALUES ('2050', 'menu-25', '当前库存查询', '0', '/common/stockSearch.html', '20');
INSERT INTO `t_menu` VALUES ('3010', 'menu-31', '商品报损', '0', '/stock/damage.html', '30');
INSERT INTO `t_menu` VALUES ('3020', 'menu-32', '商品报溢', '0', '/stock/overflow.html', '30');
INSERT INTO `t_menu` VALUES ('3030', 'menu-33', '库存报警', '0', '/stock/alarm.html', '30');
INSERT INTO `t_menu` VALUES ('3040', 'menu-34', '报损报溢查询', '0', '/stock/damageOverflowSearch.html', '30');
INSERT INTO `t_menu` VALUES ('3050', 'menu-35', '当前库存查询', '0', '/common/stockSearch.html', '30');
INSERT INTO `t_menu` VALUES ('4010', 'menu-41', '供应商统计', '0', '/count/supplier.html', '40');
INSERT INTO `t_menu` VALUES ('4020', 'menu-42', '客户统计', '0', '/count/customer.html', '40');
INSERT INTO `t_menu` VALUES ('4030', 'menu-43', '商品采购统计', '0', '/count/purchase.html', '40');
INSERT INTO `t_menu` VALUES ('4040', 'menu-44', '商品销售统计', '0', '/count/sale.html', '40');
INSERT INTO `t_menu` VALUES ('4050', 'menu-45', '按日统计分析', '0', '/count/saleDay.html', '40');
INSERT INTO `t_menu` VALUES ('4060', 'menu-46', '按月统计分析', '0', '/count/saleMonth.html', '40');
INSERT INTO `t_menu` VALUES ('5010', 'menu-51', '供应商管理', '0', '/basicData/supplier.html', '50');
INSERT INTO `t_menu` VALUES ('5020', 'menu-52', '客户管理', '0', '/basicData/customer.html', '50');
INSERT INTO `t_menu` VALUES ('5030', 'menu-53', '商品管理', '0', '/basicData/goods.html', '50');
INSERT INTO `t_menu` VALUES ('5040', 'menu-54', '期初库存', '0', '/basicData/stock.html', '50');
INSERT INTO `t_menu` VALUES ('6010', 'menu-61', '角色管理', '0', '/power/role.html', '60');
INSERT INTO `t_menu` VALUES ('6020', 'menu-62', '用户管理', '0', '/power/user.html', '60');
INSERT INTO `t_menu` VALUES ('6030', 'menu-65', '系统日志', '0', '/power/log.html', '60');
INSERT INTO `t_menu` VALUES ('6040', 'menu-63', '修改密码', '0', null, '60');
INSERT INTO `t_menu` VALUES ('6050', 'menu-64', '安全退出', '0', null, '60');

-- ----------------------------
-- Table structure for t_overflow_list
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list`;
CREATE TABLE `t_overflow_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overflow_date` datetime DEFAULT NULL,
  `overflow_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3bu8hj2xniqwbrtg6ls6b8ej2` (`user_id`),
  CONSTRAINT `FK3bu8hj2xniqwbrtg6ls6b8ej2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_overflow_list
-- ----------------------------
INSERT INTO `t_overflow_list` VALUES ('3', '2017-10-27 00:00:00', 'BY201710270001', 'dd', '1');
INSERT INTO `t_overflow_list` VALUES ('4', '2017-10-27 00:00:00', 'BY201710270002', 'ccc', '1');

-- ----------------------------
-- Table structure for t_overflow_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list_goods`;
CREATE TABLE `t_overflow_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `overflow_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd3s9761mgl456tn2xb0d164h7` (`overflow_list_id`),
  KEY `FK8t46iik5kpciki8fnqtiuq5q3` (`type_id`),
  CONSTRAINT `FK8t46iik5kpciki8fnqtiuq5q3` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKd3s9761mgl456tn2xb0d164h7` FOREIGN KEY (`overflow_list_id`) REFERENCES `t_overflow_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_overflow_list_goods
-- ----------------------------
INSERT INTO `t_overflow_list_goods` VALUES ('4', '0002', 'Note8', '华为荣耀Note8', '2', '2220', '4440', '台', '3', '16', '2');
INSERT INTO `t_overflow_list_goods` VALUES ('5', '0006', '300g装', '冰糖金桔干', '3', '5', '15', '盒', '3', '11', '14');
INSERT INTO `t_overflow_list_goods` VALUES ('6', '0004', '2斤装', '新疆红枣', '2', '13', '26', '袋', '4', '10', '12');
INSERT INTO `t_overflow_list_goods` VALUES ('7', '0006', '300g装', '冰糖金桔干', '3', '5', '15', '盒', '4', '11', '14');

-- ----------------------------
-- Table structure for t_purchase_list
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list`;
CREATE TABLE `t_purchase_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `purchase_number` varchar(100) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5j2dev8b2b5d0l69nb8vtr4yb` (`supplier_id`),
  KEY `FK69s6eyxr4wwvsywe9hbthef1h` (`user_id`),
  CONSTRAINT `FK5j2dev8b2b5d0l69nb8vtr4yb` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`),
  CONSTRAINT `FK69s6eyxr4wwvsywe9hbthef1h` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_purchase_list
-- ----------------------------
INSERT INTO `t_purchase_list` VALUES ('25', '73299', '73299', '2017-10-27 00:00:00', 'cc', '1', 'JH201710270001', '2', '1');
INSERT INTO `t_purchase_list` VALUES ('26', '69099', '69099', '2017-10-28 00:00:00', 'cc', '1', 'JH201710280001', '2', '1');
INSERT INTO `t_purchase_list` VALUES ('28', '17', '17', '2017-10-31 00:00:00', 'cc', '1', 'JH201710310001', '5', '1');
INSERT INTO `t_purchase_list` VALUES ('29', '463', '463', '2017-11-03 00:00:00', 'cc', '1', 'JH201711030001', '1', '1');
INSERT INTO `t_purchase_list` VALUES ('30', '1240', '1240', '2017-11-03 00:00:00', 'cc', '1', 'JH201711030002', '1', '1');
INSERT INTO `t_purchase_list` VALUES ('31', '450', '450', '2017-11-03 00:00:00', 'ccc', '1', 'JH201711030003', '2', '1');

-- ----------------------------
-- Table structure for t_purchase_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list_goods`;
CREATE TABLE `t_purchase_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `purchase_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfvdvgcebqkkokyn0o00idqnpy` (`purchase_list_id`),
  KEY `FK83ikbi2x3epn49fwcco8jlfwu` (`type_id`),
  CONSTRAINT `FK83ikbi2x3epn49fwcco8jlfwu` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKfvdvgcebqkkokyn0o00idqnpy` FOREIGN KEY (`purchase_list_id`) REFERENCES `t_purchase_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_purchase_list_goods
-- ----------------------------
INSERT INTO `t_purchase_list_goods` VALUES ('35', '0002', 'Note8', '华为荣耀Note8', '33', '2220', '73260', '台', '25', '16', '2');
INSERT INTO `t_purchase_list_goods` VALUES ('36', '0004', '2斤装', '新疆红枣', '3', '13', '39', '袋', '25', '10', '12');
INSERT INTO `t_purchase_list_goods` VALUES ('37', '0003', '500g装', '野生东北黑木耳', '3000', '23', '69000', '袋', '26', '11', '11');
INSERT INTO `t_purchase_list_goods` VALUES ('38', '0007', '500g装', '吉利人家牛肉味蛋糕', '22', '4.5', '99', '袋', '26', '11', '15');
INSERT INTO `t_purchase_list_goods` VALUES ('41', '0001', '红色装', '陶华碧老干妈香辣脆油辣椒', '2', '8.5', '17', '瓶', '28', '10', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('42', '0001', '红色装', '陶华碧老干妈香辣脆油辣椒', '4', '8.5', '34', '瓶', '29', '10', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('43', '0004', '2斤装', '新疆红枣', '33', '13', '429', '袋', '29', '10', '12');
INSERT INTO `t_purchase_list_goods` VALUES ('44', '0001', '红色装', '陶华碧老干妈香辣脆油辣椒', '100', '8.5', '850', '瓶', '30', '10', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('45', '0004', '2斤装', '新疆红枣', '30', '13', '390', '袋', '30', '10', '12');
INSERT INTO `t_purchase_list_goods` VALUES ('46', '0015', 'X', ' iPhone X', '30', '0', '0', '台', '30', '16', '24');
INSERT INTO `t_purchase_list_goods` VALUES ('47', '0007', '500g装', '吉利人家牛肉味蛋糕', '100', '4.5', '450', '袋', '31', '11', '15');

-- ----------------------------
-- Table structure for t_return_list
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list`;
CREATE TABLE `t_return_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `return_number` varchar(100) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4qxjj8bvj2etne243xluni0vn` (`supplier_id`),
  KEY `FK904juw2v1hm2av0ig26gae9jb` (`user_id`),
  CONSTRAINT `FK4qxjj8bvj2etne243xluni0vn` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`),
  CONSTRAINT `FK904juw2v1hm2av0ig26gae9jb` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_return_list
-- ----------------------------
INSERT INTO `t_return_list` VALUES ('4', '4464', '4464', 'cc', '2017-10-27 00:00:00', 'TH201710270001', '1', '2', '1');
INSERT INTO `t_return_list` VALUES ('5', '4440', '4440', 'cc', '2017-11-03 00:00:00', 'TH201711030001', '1', '2', '1');

-- ----------------------------
-- Table structure for t_return_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list_goods`;
CREATE TABLE `t_return_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `return_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKemclu281vyvyk063c3foafq1w` (`return_list_id`),
  KEY `FKa1prpd96fcs0x2oe0omny9vio` (`type_id`),
  CONSTRAINT `FKa1prpd96fcs0x2oe0omny9vio` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKemclu281vyvyk063c3foafq1w` FOREIGN KEY (`return_list_id`) REFERENCES `t_return_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_return_list_goods
-- ----------------------------
INSERT INTO `t_return_list_goods` VALUES ('7', '0002', 'Note8', '华为荣耀Note8', '2', '2220', '4440', '台', '4', '16', '2');
INSERT INTO `t_return_list_goods` VALUES ('8', '0005', '散装500克', '麦片燕麦巧克力', '3', '8', '24', '袋', '4', '11', '13');
INSERT INTO `t_return_list_goods` VALUES ('9', '0002', 'Note8', '华为荣耀Note8', '2', '2220', '4440', '台', '5', '16', '2');
INSERT INTO `t_return_list_goods` VALUES ('10', '0015', 'X', ' iPhone X', '3', '0', '0', '台', '5', '16', '24');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bz` varchar(1000) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '系统管理员 最高权限', '管理员', null);
INSERT INTO `t_role` VALUES ('2', '主管', '主管', null);
INSERT INTO `t_role` VALUES ('4', '采购员', '采购员', null);
INSERT INTO `t_role` VALUES ('5', '销售经理', '销售经理', '22');
INSERT INTO `t_role` VALUES ('7', '仓库管理员', '仓库管理员', null);
INSERT INTO `t_role` VALUES ('9', '总经理', '总经理', null);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsonb0rbt2u99hbrqqvv3r0wse` (`role_id`),
  KEY `FKhayg4ib6v7h1wyeyxhq6xlddq` (`menu_id`),
  CONSTRAINT `FKhayg4ib6v7h1wyeyxhq6xlddq` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `FKsonb0rbt2u99hbrqqvv3r0wse` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `t_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('2', '1', '1');
INSERT INTO `t_role_menu` VALUES ('3', '10', '1');
INSERT INTO `t_role_menu` VALUES ('4', '20', '1');
INSERT INTO `t_role_menu` VALUES ('5', '30', '1');
INSERT INTO `t_role_menu` VALUES ('6', '40', '1');
INSERT INTO `t_role_menu` VALUES ('7', '50', '1');
INSERT INTO `t_role_menu` VALUES ('8', '60', '1');
INSERT INTO `t_role_menu` VALUES ('9', '1010', '1');
INSERT INTO `t_role_menu` VALUES ('10', '1020', '1');
INSERT INTO `t_role_menu` VALUES ('11', '1030', '1');
INSERT INTO `t_role_menu` VALUES ('12', '1040', '1');
INSERT INTO `t_role_menu` VALUES ('13', '1050', '1');
INSERT INTO `t_role_menu` VALUES ('14', '2010', '1');
INSERT INTO `t_role_menu` VALUES ('15', '2020', '1');
INSERT INTO `t_role_menu` VALUES ('16', '2030', '1');
INSERT INTO `t_role_menu` VALUES ('17', '2040', '1');
INSERT INTO `t_role_menu` VALUES ('18', '2050', '1');
INSERT INTO `t_role_menu` VALUES ('19', '3010', '1');
INSERT INTO `t_role_menu` VALUES ('20', '3020', '1');
INSERT INTO `t_role_menu` VALUES ('21', '3030', '1');
INSERT INTO `t_role_menu` VALUES ('22', '3040', '1');
INSERT INTO `t_role_menu` VALUES ('23', '3050', '1');
INSERT INTO `t_role_menu` VALUES ('24', '4010', '1');
INSERT INTO `t_role_menu` VALUES ('25', '4020', '1');
INSERT INTO `t_role_menu` VALUES ('26', '4030', '1');
INSERT INTO `t_role_menu` VALUES ('27', '4040', '1');
INSERT INTO `t_role_menu` VALUES ('28', '4050', '1');
INSERT INTO `t_role_menu` VALUES ('29', '4060', '1');
INSERT INTO `t_role_menu` VALUES ('30', '5010', '1');
INSERT INTO `t_role_menu` VALUES ('31', '5020', '1');
INSERT INTO `t_role_menu` VALUES ('32', '5030', '1');
INSERT INTO `t_role_menu` VALUES ('33', '5040', '1');
INSERT INTO `t_role_menu` VALUES ('34', '6010', '1');
INSERT INTO `t_role_menu` VALUES ('35', '6020', '1');
INSERT INTO `t_role_menu` VALUES ('36', '10', '2');
INSERT INTO `t_role_menu` VALUES ('37', '1010', '2');
INSERT INTO `t_role_menu` VALUES ('38', '1020', '2');
INSERT INTO `t_role_menu` VALUES ('39', '1030', '2');
INSERT INTO `t_role_menu` VALUES ('40', '1040', '2');
INSERT INTO `t_role_menu` VALUES ('41', '1050', '2');
INSERT INTO `t_role_menu` VALUES ('42', '1', '2');
INSERT INTO `t_role_menu` VALUES ('43', '6030', '1');
INSERT INTO `t_role_menu` VALUES ('44', '6040', '1');
INSERT INTO `t_role_menu` VALUES ('45', '1', '4');
INSERT INTO `t_role_menu` VALUES ('46', '20', '4');
INSERT INTO `t_role_menu` VALUES ('47', '2010', '4');
INSERT INTO `t_role_menu` VALUES ('48', '1', '5');
INSERT INTO `t_role_menu` VALUES ('49', '30', '5');
INSERT INTO `t_role_menu` VALUES ('50', '3010', '5');
INSERT INTO `t_role_menu` VALUES ('55', '1', '9');
INSERT INTO `t_role_menu` VALUES ('56', '30', '9');
INSERT INTO `t_role_menu` VALUES ('57', '3040', '9');
INSERT INTO `t_role_menu` VALUES ('58', '3050', '9');
INSERT INTO `t_role_menu` VALUES ('59', '50', '9');
INSERT INTO `t_role_menu` VALUES ('60', '5010', '9');
INSERT INTO `t_role_menu` VALUES ('61', '5020', '9');
INSERT INTO `t_role_menu` VALUES ('62', '5030', '9');
INSERT INTO `t_role_menu` VALUES ('63', '5040', '9');
INSERT INTO `t_role_menu` VALUES ('64', '6050', '1');
INSERT INTO `t_role_menu` VALUES ('65', '1', '7');
INSERT INTO `t_role_menu` VALUES ('66', '10', '7');
INSERT INTO `t_role_menu` VALUES ('67', '1010', '7');
INSERT INTO `t_role_menu` VALUES ('68', '1020', '7');
INSERT INTO `t_role_menu` VALUES ('69', '1030', '7');
INSERT INTO `t_role_menu` VALUES ('70', '1040', '7');
INSERT INTO `t_role_menu` VALUES ('71', '1050', '7');
INSERT INTO `t_role_menu` VALUES ('72', '20', '7');
INSERT INTO `t_role_menu` VALUES ('73', '2010', '7');
INSERT INTO `t_role_menu` VALUES ('74', '2020', '7');
INSERT INTO `t_role_menu` VALUES ('75', '2030', '7');
INSERT INTO `t_role_menu` VALUES ('76', '40', '7');
INSERT INTO `t_role_menu` VALUES ('77', '4010', '7');
INSERT INTO `t_role_menu` VALUES ('78', '4020', '7');

-- ----------------------------
-- Table structure for t_sale_list
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list`;
CREATE TABLE `t_sale_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  `sale_number` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK34bnujemrdqimbhg133enp8k8` (`user_id`),
  KEY `FKox4qfs87eu3fvwdmrvelqhi8e` (`customer_id`),
  CONSTRAINT `FK34bnujemrdqimbhg133enp8k8` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKox4qfs87eu3fvwdmrvelqhi8e` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sale_list
-- ----------------------------
INSERT INTO `t_sale_list` VALUES ('4', '5060', '5060', 'cc', '2017-01-27 00:00:00', 'XS201701270001', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('6', '4889', '4889', 'dd', '2017-02-28 00:00:00', 'XS201702280002', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('7', '4400', '4400', 'cccc', '2017-03-30 00:00:00', 'XS201703300001', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('8', '860', '860', 'cc', '2017-04-30 00:00:00', 'XS201704300002', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('11', '83', '83', 'ccc', '2017-05-01 00:00:00', 'XS201705100003', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('12', '6626', '6626', 'cccc', '2017-06-03 00:00:00', 'XS201706300001', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('13', '76', '76', 'cc', '2017-06-03 00:00:00', 'XS201706300002', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('14', '127', '127', 'cc', '2017-07-03 00:00:00', 'XS201707300003', '2', '1', '2');
INSERT INTO `t_sale_list` VALUES ('15', '1579.5', '1579.5', 'cc', '2017-08-03 00:00:00', 'XS201708300004', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('16', '76', '76', 'cc', '2017-09-03 00:00:00', 'XS201709300005', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('17', '111', '111', 'cc', '2017-10-28 00:00:00', 'XS201710280006', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('18', '40', '40', 'cc', '2017-10-29 00:00:00', 'XS201710290007', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('19', '45', '45', 'cc', '2017-10-30 00:00:00', 'XS201710300008', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('20', '10', '10', 'cc', '2017-10-31 00:00:00', 'XS201710310009', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('21', '202', '202', 'cc', '2017-11-01 00:00:00', 'XS201711010010', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('22', '3650', '3650', '11', '2017-11-02 00:00:00', 'XS201711020011', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('23', '20', '20', 'cc', '2017-11-03 00:00:00', 'XS201711030012', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('24', '59', '59', 'cc', '2016-12-03 00:00:00', 'XS201712030013', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('25', '146', '146', 'cc', '2016-11-03 00:00:00', 'XS201711030014', '1', '1', '1');

-- ----------------------------
-- Table structure for t_sale_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list_goods`;
CREATE TABLE `t_sale_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `sale_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK20ehd6ta9geyql4hxtdsnhbox` (`sale_list_id`),
  KEY `FKn9i5p1d8f0gek5x7q45cq8ibw` (`type_id`),
  CONSTRAINT `FK20ehd6ta9geyql4hxtdsnhbox` FOREIGN KEY (`sale_list_id`) REFERENCES `t_sale_list` (`id`),
  CONSTRAINT `FKn9i5p1d8f0gek5x7q45cq8ibw` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sale_list_goods
-- ----------------------------
INSERT INTO `t_sale_list_goods` VALUES ('7', '0002', 'Note8', '华为荣耀Note8', '2', '2200', '4400', '台', '4', '16', '2');
INSERT INTO `t_sale_list_goods` VALUES ('8', '0010', '250g装', '劲仔小鱼干', '33', '20', '660', '袋', '4', '11', '18');
INSERT INTO `t_sale_list_goods` VALUES ('11', '0003', '500g装', '野生东北黑木耳', '100', '38', '3800', '袋', '6', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('12', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '33', '33', '1089', '袋', '6', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('13', '0002', 'Note8', '华为荣耀Note8', '2', '2200', '4400', '台', '7', '16', '2');
INSERT INTO `t_sale_list_goods` VALUES ('14', '0003', '500g装', '野生东北黑木耳', '22', '38', '836', '袋', '8', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('15', '0014', '250g装', '美国青豆原味 蒜香', '3', '8', '24', '袋', '8', '11', '22');
INSERT INTO `t_sale_list_goods` VALUES ('20', '0003', '500g装', '野生东北黑木耳', '1', '38', '38', '袋', '11', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('21', '0005', '散装500克', '麦片燕麦巧克力', '3', '15', '45', '袋', '11', '11', '13');
INSERT INTO `t_sale_list_goods` VALUES ('22', '0002', 'Note8', '华为荣耀Note8', '3', '2200', '6600', '台', '12', '16', '2');
INSERT INTO `t_sale_list_goods` VALUES ('23', '0006', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '12', '11', '14');
INSERT INTO `t_sale_list_goods` VALUES ('24', '0003', '500g装', '野生东北黑木耳', '2', '38', '76', '袋', '13', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('25', '0004', '2斤装', '新疆红枣', '3', '25', '75', '袋', '14', '10', '12');
INSERT INTO `t_sale_list_goods` VALUES ('26', '0006', '300g装', '冰糖金桔干', '4', '13', '52', '盒', '14', '11', '14');
INSERT INTO `t_sale_list_goods` VALUES ('27', '0001', '红色装', '陶华碧老干妈香辣脆油辣椒', '33', '8.5', '280.5', '瓶', '15', '10', '1');
INSERT INTO `t_sale_list_goods` VALUES ('28', '0018', 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', '1', '1299', '1299', '台', '15', '15', '27');
INSERT INTO `t_sale_list_goods` VALUES ('29', '0003', '500g装', '野生东北黑木耳', '2', '38', '76', '袋', '16', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('30', '0005', '散装500克', '麦片燕麦巧克力', '3', '15', '45', '袋', '17', '11', '13');
INSERT INTO `t_sale_list_goods` VALUES ('31', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '2', '33', '66', '袋', '17', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('32', '0010', '250g装', '劲仔小鱼干', '1', '20', '20', '袋', '18', '11', '18');
INSERT INTO `t_sale_list_goods` VALUES ('33', '0008', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '2', '10', '20', '盒', '18', '11', '16');
INSERT INTO `t_sale_list_goods` VALUES ('34', '0004', '2斤装', '新疆红枣', '1', '25', '25', '袋', '19', '10', '12');
INSERT INTO `t_sale_list_goods` VALUES ('35', '0008', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '2', '10', '20', '盒', '19', '11', '16');
INSERT INTO `t_sale_list_goods` VALUES ('36', '0007', '500g装', '吉利人家牛肉味蛋糕', '1', '10', '10', '袋', '20', '11', '15');
INSERT INTO `t_sale_list_goods` VALUES ('37', '0003', '500g装', '野生东北黑木耳', '2', '38', '76', '袋', '21', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('38', '0007', '500g装', '吉利人家牛肉味蛋糕', '2', '10', '20', '袋', '21', '11', '15');
INSERT INTO `t_sale_list_goods` VALUES ('39', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '2', '33', '66', '袋', '21', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('40', '0010', '250g装', '劲仔小鱼干', '2', '20', '40', '袋', '21', '11', '18');
INSERT INTO `t_sale_list_goods` VALUES ('41', '0017', 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', '1', '3650', '3650', '台', '22', '15', '26');
INSERT INTO `t_sale_list_goods` VALUES ('42', '0010', '250g装', '劲仔小鱼干', '1', '20', '20', '袋', '23', '11', '18');
INSERT INTO `t_sale_list_goods` VALUES ('43', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '1', '33', '33', '袋', '24', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('44', '0006', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '24', '11', '14');
INSERT INTO `t_sale_list_goods` VALUES ('45', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '2', '33', '66', '袋', '25', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('46', '0014', '250g装', '美国青豆原味 蒜香', '10', '8', '80', '袋', '25', '11', '22');

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(300) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES ('1', '上海市金山区张堰镇松金公路2072号6607室', '小张', '上海福桂食品有限公司', '0773-7217175', '失信供应商');
INSERT INTO `t_supplier` VALUES ('2', '安徽省合肥市肥西县桃花工业园合派路', '小王', '安徽麦堡食品工业有限公司', '0773-7217275', null);
INSERT INTO `t_supplier` VALUES ('3', '晋江市罗山后林西区41号', '小李', '福建省晋江市罗山惠康食品有限公司', '1273-1217175', '优质供应商');
INSERT INTO `t_supplier` VALUES ('4', '南京市江宁区科学园竹山路565号1幢', '小丽', '南京含羞草食品有限公司', '2121-7217175', null);
INSERT INTO `t_supplier` VALUES ('5', '南京市高淳县阳江镇新桥村下桥278号', '王大狗', '南京禾乃美工贸有限公司', '2133-7217125', null);
INSERT INTO `t_supplier` VALUES ('6', '开平市水口镇东埠路６号', '小七', '开平广合腐乳有限公司', '3332-7217175', '2');
INSERT INTO `t_supplier` VALUES ('7', '汕头市跃进路２３号利鸿基中心大厦写字楼２座', '刘钩子', '汕头市金茂食品有限公司', '0723-7232175', null);
INSERT INTO `t_supplier` VALUES ('8', '南京市溧水区经济开发区', '七枷社', '南京喜之郎食品有限公司', '1773-7217175', null);
INSERT INTO `t_supplier` VALUES ('9', '深圳市罗湖区翠竹北路中深石化区厂房B栋6楼', '小蔡', '深圳昌信实业有限公司', '1773-7217175', null);
INSERT INTO `t_supplier` VALUES ('10', '南京市下关区金陵小区6村27-2-203室', '小路', '南京市下关区红鹰调味品商行', '2132-7217175', null);
INSERT INTO `t_supplier` VALUES ('11', '荔浦县荔塔路１６－３６号', '亲亲', '桂林阜康食品工业有限公司', '2123-7217175', null);
INSERT INTO `t_supplier` VALUES ('12', '南京鼓楼区世纪大楼123号', '小二', '南京大王科技', '0112-1426789', '123');
INSERT INTO `t_supplier` VALUES ('13', '南京将军路800号', '小吴', '南京大陆食品公司', '1243-2135487', 'cc');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bz` varchar(1000) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `true_name` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '管理员', 'admin', '王大陆', 'admin', null);
INSERT INTO `t_user` VALUES ('2', '主管', '123', '王大锤', 'jack', '2');
INSERT INTO `t_user` VALUES ('3', '销售经理', '123', '玛丽', 'marry', '33');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa9c8iiy6ut0gnx491fqx4pxam` (`role_id`),
  KEY `FKq5un6x7ecoef5w1n39cop66kl` (`user_id`),
  CONSTRAINT `FKa9c8iiy6ut0gnx491fqx4pxam` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FKq5un6x7ecoef5w1n39cop66kl` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('19', '2', '2');
INSERT INTO `t_user_role` VALUES ('20', '4', '2');
INSERT INTO `t_user_role` VALUES ('21', '5', '2');
INSERT INTO `t_user_role` VALUES ('28', '2', '3');
INSERT INTO `t_user_role` VALUES ('29', '4', '3');
INSERT INTO `t_user_role` VALUES ('30', '5', '3');
INSERT INTO `t_user_role` VALUES ('31', '7', '3');
