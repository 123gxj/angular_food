/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : restaurant

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-09-25 17:47:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for f_admin
-- ----------------------------
DROP TABLE IF EXISTS `f_admin`;
CREATE TABLE `f_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_pwd` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned DEFAULT NULL,
  `login_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_admin
-- ----------------------------

-- ----------------------------
-- Table structure for f_banner
-- ----------------------------
DROP TABLE IF EXISTS `f_banner`;
CREATE TABLE `f_banner` (
  `banner_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `order_num` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_banner
-- ----------------------------
INSERT INTO `f_banner` VALUES ('17', 'undefined', 'http://localhost/food-html/asset/home/img/201908200128367917.jpg', 'undefined', '0');
INSERT INTO `f_banner` VALUES ('1', 'null', 'http://localhost/food-html/asset/home/img/201908200126595549.jpg', '', '0');

-- ----------------------------
-- Table structure for f_company
-- ----------------------------
DROP TABLE IF EXISTS `f_company`;
CREATE TABLE `f_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_company
-- ----------------------------
INSERT INTO `f_company` VALUES ('1', '总公司', 'http://localhost/food-html/asset/home/img/201908200023033904.jpg', '0512-8081 5888', '0512-8081 5888', '215031', '江苏省苏州市人民路3188号万达广场5幢迪欧大厦');
INSERT INTO `f_company` VALUES ('7', '苏州分公司', 'http://localhost/food-html/asset/home/img/201908200022441778.jpg', '0512-8081 5888', '0512-8081 5888', '215031', '江苏省苏州市人民路3188号万达广场5幢迪欧大厦');
INSERT INTO `f_company` VALUES ('8', '苏州分公司', 'http://localhost/food-html/asset/home/img/201908200027196638.jpg', '0512-8081 5888', '0512-8081 5888', '215031', '0');
INSERT INTO `f_company` VALUES ('18', '苏州分公司', 'http://localhost/food-html/asset/home/img/201908200026074745.jpg', '0512-8081 5888', '0512-8081 5888', '215031', '0');
INSERT INTO `f_company` VALUES ('19', '苏州分公司', 'http://localhost/food-html/asset/home/img/201908200026241057.jpg', '0512-8081 5888', '0512-8081 5888', '215031', '0');

-- ----------------------------
-- Table structure for f_food
-- ----------------------------
DROP TABLE IF EXISTS `f_food`;
CREATE TABLE `f_food` (
  `food_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` decimal(11,0) DEFAULT NULL,
  `cate_id` int(11) unsigned DEFAULT NULL,
  `content` text,
  `is_recommend` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`food_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_food
-- ----------------------------
INSERT INTO `f_food` VALUES ('1', 'http://localhost/food-html/asset/home/img/201908182129596278.png', '海鲜芝士大虾', '49', '1', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '1');
INSERT INTO `f_food` VALUES ('2', 'http://localhost/food-html/asset/home/img/201908182130157197.png', '草莓布丁杯', '12', '2', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '1');
INSERT INTO `f_food` VALUES ('3', 'http://localhost/food-html/asset/home/img/201908182130305521.png', '菲力黑椒牛排', '69', '3', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '1');
INSERT INTO `f_food` VALUES ('4', 'http://localhost/food-html/asset/home/img/201908182130566774.png', '香煎排意面', '60', '4', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '1');
INSERT INTO `f_food` VALUES ('5', 'http://localhost/food-html/asset/home/img/201908182131128017.png', '鲜香培根比萨', '58', '5', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '1');
INSERT INTO `f_food` VALUES ('6', 'http://localhost/food-html/asset/home/img/201908182131402650.png', '番茄烩意面', '39', '6', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '1');
INSERT INTO `f_food` VALUES ('15', 'http://localhost/food-html/asset/home/img/201908200029028317.jpg', '炭烤牛排', '99', '1', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '0');
INSERT INTO `f_food` VALUES ('14', 'http://localhost/food-html/asset/home/img/201908182132256462.png', '西冷牛排', '88', '1', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '1');
INSERT INTO `f_food` VALUES ('44', 'http://localhost/food-html/asset/home/img/201908182234336123.jpg', '香煎排意面', '69', '1', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '0');
INSERT INTO `f_food` VALUES ('45', 'http://localhost/food-html/asset/home/img/201908182235136396.jpg', '鲜香培根披萨', '59', '3', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '0');
INSERT INTO `f_food` VALUES ('46', 'http://localhost/food-html/asset/home/img/201908182236064485.jpg', '番茄意会面', '39', '2', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '0');
INSERT INTO `f_food` VALUES ('41', 'http://localhost/food-html/asset/home/img/201908182232406146.jpg', '海鲜芝士大虾', '49', '6', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '0');
INSERT INTO `f_food` VALUES ('42', 'http://localhost/food-html/asset/home/img/201908182233184381.jpg', '草莓布丁杯', '12', '4', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '0');
INSERT INTO `f_food` VALUES ('43', 'http://localhost/food-html/asset/home/img/201908182233532764.jpg', '菲力黑椒牛排', '69', '1', '<p>菲力牛排，就是用一定厚度的牛里脊肉做出的牛排。菲力指的是牛里脊肉（beef tenderloin）。在澳洲，这块肉被称为“眼菲力”，在法国和英国被称为filet和fillet，中文音译菲力。</p><p>很多人认为牛排最早是西方人的美食，在欧洲中世纪的时候就开始出现了，牛排只有贵族才可以吃到的美食，而猪肉和羊肉只有平常百姓才可以吃到的，牛肉是贵族的象征，想要吃到牛排除非得到国王的赏识或者立下过过劳的战士才有机会吃到的。</p>', '0');

-- ----------------------------
-- Table structure for f_food_cate
-- ----------------------------
DROP TABLE IF EXISTS `f_food_cate`;
CREATE TABLE `f_food_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_food_cate
-- ----------------------------
INSERT INTO `f_food_cate` VALUES ('1', '经典牛排');
INSERT INTO `f_food_cate` VALUES ('2', '意面/烩饭');
INSERT INTO `f_food_cate` VALUES ('3', '风味披萨');
INSERT INTO `f_food_cate` VALUES ('4', '甜品小食');
INSERT INTO `f_food_cate` VALUES ('5', '酒水饮料');
INSERT INTO `f_food_cate` VALUES ('6', '其他');
INSERT INTO `f_food_cate` VALUES ('12', 'afgd');
INSERT INTO `f_food_cate` VALUES ('13', 'afgd');
INSERT INTO `f_food_cate` VALUES ('14', 'afgd');
INSERT INTO `f_food_cate` VALUES ('15', 'afgd');
INSERT INTO `f_food_cate` VALUES ('16', 'afgd');
INSERT INTO `f_food_cate` VALUES ('17', 'afgd');

-- ----------------------------
-- Table structure for f_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `f_friend_link`;
CREATE TABLE `f_friend_link` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `order_num` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_friend_link
-- ----------------------------
INSERT INTO `f_friend_link` VALUES ('1', 'null', 'http://localhost/food-html/asset/home/img/201908181558486444.png', '1');
INSERT INTO `f_friend_link` VALUES ('2', 'null', 'http://localhost/food-html/asset/home/img/201908181559435877.png', '2');
INSERT INTO `f_friend_link` VALUES ('3', 'null', 'http://localhost/food-html/asset/home/img/201908181601011396.png', '3');
INSERT INTO `f_friend_link` VALUES ('11', 'undefined', 'http://localhost/food-html/asset/home/img/201908181601234603.png', '4');
INSERT INTO `f_friend_link` VALUES ('12', 'undefined', 'http://localhost/food-html/asset/home/img/201908181601436853.png', '5');
INSERT INTO `f_friend_link` VALUES ('13', 'undefined', 'http://localhost/food-html/asset/home/img/20190818160220319.png', '6');
INSERT INTO `f_friend_link` VALUES ('17', 'undefined', 'undefined', '0');

-- ----------------------------
-- Table structure for f_nav
-- ----------------------------
DROP TABLE IF EXISTS `f_nav`;
CREATE TABLE `f_nav` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `order_num` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_nav
-- ----------------------------
INSERT INTO `f_nav` VALUES ('1', '品牌故事', 'index.pinpai', '2');
INSERT INTO `f_nav` VALUES ('2', '美食系列', 'index.meishi', '3');
INSERT INTO `f_nav` VALUES ('3', '店面展示', 'index.shop', '4');
INSERT INTO `f_nav` VALUES ('4', '新闻资讯', 'index.news', '5');
INSERT INTO `f_nav` VALUES ('5', '关于我们', 'index.about', '6');
INSERT INTO `f_nav` VALUES ('9', '首页', 'index.index', '1');

-- ----------------------------
-- Table structure for f_news
-- ----------------------------
DROP TABLE IF EXISTS `f_news`;
CREATE TABLE `f_news` (
  `news_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_news
-- ----------------------------
INSERT INTO `f_news` VALUES ('1', '西餐代表 牛排的种类和吃法', 'http://localhost/food-html/asset/home/img/201908200049498389.jpg', '提到牛排，脑子里就会想到焦棕褐色、表面扶着香甜的肉汁，切开后的粉红肉质，入口之后留下的满口肉香。吃牛排其实是非常讲究的，精致的牛肉配上美味的香料，加以烹调，是款待尊贵客人的最佳美食。', '20160928', '<p class=\"news-conitem\">西冷牛排（SIRLOIN）：也叫沙朗牛排，是指肉质鲜嫩又带油花嫩筋的牛肉，基本上取自于牛背脊一带最柔嫩的牛肉，具体位置不同，风味也各有千秋。比较正宗的沙朗取自后腰脊肉，但特殊的品种例如纽约客，则是取自于类似菲力的前腰脊肉。沙朗牛排肉质鲜嫩且香甜多汁，富有口感，受入门级牛排行家所偏好。</p>\r\n<p class=\"news-conitem\">推荐火候：四至六分熟。</p><p class=\"news-conitem\">菲力牛排（FILLET）：也称嫩牛柳，牛里脊（TENDERLOIN)，取自于牛的里肌肉（即腰内肉），运动量少，且肉质最嫩精瘦，油脂少，因每头牛就一小条而显得「物稀为贵」。口感好但没有嚼头，并且烹煮过头就显得老涩，因此多推荐给牙口不好，消化较弱的老人家或小朋友食用。</p>\r\n			<p class=\"news-conitem\">推荐火候：三至七分熟。</p>');
INSERT INTO `f_news` VALUES ('2', '西餐代表 牛排的种类和吃法', 'http://localhost/food-html/asset/home/img/201908200049376115.jpg', '提到牛排，脑子里就会想到焦棕褐色、表面扶着香甜的肉汁，切开后的粉红肉质，入口之后留下的满口肉香。吃牛排其实是非常讲究的，精致的牛肉配上美味的香料，加以烹调，是款待尊贵客人的最佳美食。', '90160928', '<p class=\"news-conitem\">西冷牛排（SIRLOIN）：也叫沙朗牛排，是指肉质鲜嫩又带油花嫩筋的牛肉，基本上取自于牛背脊一带最柔嫩的牛肉，具体位置不同，风味也各有千秋。比较正宗的沙朗取自后腰脊肉，但特殊的品种例如纽约客，则是取自于类似菲力的前腰脊肉。沙朗牛排肉质鲜嫩且香甜多汁，富有口感，受入门级牛排行家所偏好。</p>\r\n			<p class=\"news-conitem\">推荐火候：四至六分熟。</p>\r\n			<p class=\"news-conitem\">菲力牛排（FILLET）：也称嫩牛柳，牛里脊（TENDERLOIN)，取自于牛的里肌肉（即腰内肉），运动量少，且肉质最嫩精瘦，油脂少，因每头牛就一小条而显得「物稀为贵」。口感好但没有嚼头，并且烹煮过头就显得老涩，因此多推荐给牙口不好，消化较弱的老人家或小朋友食用。</p>\r\n			<p class=\"news-conitem\">推荐火候：三至七分熟。</p>\r\n			<p class=\"news-conitem\">丁骨牛排(T BONE)：是牛背上的脊骨肉，大块肉排中间夹着 T 字形的大骨,一边是菲力,一边是纽约客,肉质一细嫩一粗犷,或油腴或爽俐,点一客统统吃得到。</p>\r\n			<p class=\"news-conitem\">推荐火候：五至八分熟 。</p>\r\n			<p class=\"news-conitem\">肋眼牛排(RIB EYE) ：取自于牛肋脊部位，即牛骨边上的肉。肋眼牛排或许比不上腰脊肉那样嫩，但骨边肉向来好吃，油油嫩嫩的肉丝中夹着Q而有劲的油筋，比沙朗耐嚼，比菲力够味，而且油花十分丰郁，是受年轻男食客喜欢。</p>\r\n			<p class=\"news-conitem\">推荐火候：四至六分熟。</p>\r\n			<p class=\"news-conitem\">牛小排：牛小排取自于牛的胸腔左右两侧，含肋骨部分。牛小排带骨带筋肉质肥腴鲜美，多汁且耐嚼，有大理石纹，特别是采用牛的第六、七根肋骨的，嫩而不涩，肉量丰郁的全熟肉质，即使是怕生的食客也可怡然享用，更创造出牛小排的另类魅力。</p>\r\n			<p class=\"news-conitem\">推荐火候：全熟。</p>\r\n			<p class=\"news-conitem\">除了上述的品种，餐桌上常见的还有像牛肩胛部位的板腱肉、上肩胛肋眼心、牛肚部位的腹胁肉、上后腿肉等，这些部位虽然肉质纤维较粗，无法媲美以上品种。</p>\r\n			<p class=\"news-conitem\">牛排你要几成熟？</p>\r\n			<p class=\"news-conitem\">三分熟牛排，不是血淋淋的，看得到的只有一样漂亮的焦棕褐色，表面浮渗着香甜的肉汁。下刀切开后，看到的是火腿肠般的暗红色，品尝起来，入口只需轻轻嚼动便温润即化，留下满口的鲜甜馀香，这样，才是“三分熟”！</p>\r\n			<p class=\"news-conitem\">一分熟牛排（rare）：牛排内部为血红色且内部各处保持一定温度（高于very rare steak）。</p>\r\n			<p class=\"news-conitem\">三分熟牛排（medium rare）：内部为桃红且带有相当热度。</p>\r\n			<p class=\"news-conitem\">五分熟牛排（medium）：牛排内部为粉红且夹杂着浅灰和综褐色，整个牛排都很烫。</p>\r\n			<p class=\"news-conitem\">七分熟牛排（medium well）：牛排内部主要为浅灰综褐色，夹杂着粉红色。</p>\r\n			<p class=\"news-conitem\">全熟牛排（well done）：牛排内部为褐色。</p>');
INSERT INTO `f_news` VALUES ('3', '西餐代表 牛排的种类和吃法', 'http://localhost/food-html/asset/home/img/201908200049237760.jpg', '提到牛排，脑子里就会想到焦棕褐色、表面扶着香甜的肉汁，切开后的粉红肉质，入口之后留下的满口肉香。吃牛排其实是非常讲究的，精致的牛肉配上美味的香料，加以烹调，是款待尊贵客人的最佳美食。', '90160925', '<p class=\"news-conitem\">西冷牛排（SIRLOIN）：也叫沙朗牛排，是指肉质鲜嫩又带油花嫩筋的牛肉，基本上取自于牛背脊一带最柔嫩的牛肉，具体位置不同，风味也各有千秋。比较正宗的沙朗取自后腰脊肉，但特殊的品种例如纽约客，则是取自于类似菲力的前腰脊肉。沙朗牛排肉质鲜嫩且香甜多汁，富有口感，受入门级牛排行家所偏好。</p>\r\n			<p class=\"news-conitem\">推荐火候：四至六分熟。</p>\r\n			<p class=\"news-conitem\">菲力牛排（FILLET）：也称嫩牛柳，牛里脊（TENDERLOIN)，取自于牛的里肌肉（即腰内肉），运动量少，且肉质最嫩精瘦，油脂少，因每头牛就一小条而显得「物稀为贵」。口感好但没有嚼头，并且烹煮过头就显得老涩，因此多推荐给牙口不好，消化较弱的老人家或小朋友食用。</p>\r\n			<p class=\"news-conitem\">推荐火候：三至七分熟。</p>\r\n			<p class=\"news-conitem\">丁骨牛排(T BONE)：是牛背上的脊骨肉，大块肉排中间夹着 T 字形的大骨,一边是菲力,一边是纽约客,肉质一细嫩一粗犷,或油腴或爽俐,点一客统统吃得到。</p>\r\n			<p class=\"news-conitem\">推荐火候：五至八分熟 。</p>\r\n			<p class=\"news-conitem\">肋眼牛排(RIB EYE) ：取自于牛肋脊部位，即牛骨边上的肉。肋眼牛排或许比不上腰脊肉那样嫩，但骨边肉向来好吃，油油嫩嫩的肉丝中夹着Q而有劲的油筋，比沙朗耐嚼，比菲力够味，而且油花十分丰郁，是受年轻男食客喜欢。</p>\r\n			<p class=\"news-conitem\">推荐火候：四至六分熟。</p>\r\n			<p class=\"news-conitem\">牛小排：牛小排取自于牛的胸腔左右两侧，含肋骨部分。牛小排带骨带筋肉质肥腴鲜美，多汁且耐嚼，有大理石纹，特别是采用牛的第六、七根肋骨的，嫩而不涩，肉量丰郁的全熟肉质，即使是怕生的食客也可怡然享用，更创造出牛小排的另类魅力。</p>\r\n			<p class=\"news-conitem\">推荐火候：全熟。</p>\r\n			<p class=\"news-conitem\">除了上述的品种，餐桌上常见的还有像牛肩胛部位的板腱肉、上肩胛肋眼心、牛肚部位的腹胁肉、上后腿肉等，这些部位虽然肉质纤维较粗，无法媲美以上品种。</p>\r\n			<p class=\"news-conitem\">牛排你要几成熟？</p>\r\n			<p class=\"news-conitem\">三分熟牛排，不是血淋淋的，看得到的只有一样漂亮的焦棕褐色，表面浮渗着香甜的肉汁。下刀切开后，看到的是火腿肠般的暗红色，品尝起来，入口只需轻轻嚼动便温润即化，留下满口的鲜甜馀香，这样，才是“三分熟”！</p>\r\n			<p class=\"news-conitem\">一分熟牛排（rare）：牛排内部为血红色且内部各处保持一定温度（高于very rare steak）。</p>\r\n			<p class=\"news-conitem\">三分熟牛排（medium rare）：内部为桃红且带有相当热度。</p>\r\n			<p class=\"news-conitem\">五分熟牛排（medium）：牛排内部为粉红且夹杂着浅灰和综褐色，整个牛排都很烫。</p>\r\n			<p class=\"news-conitem\">七分熟牛排（medium well）：牛排内部主要为浅灰综褐色，夹杂着粉红色。</p>\r\n			<p class=\"news-conitem\">全熟牛排（well done）：牛排内部为褐色。</p>');
INSERT INTO `f_news` VALUES ('4', '西餐代表 牛排的种类和吃法', 'http://localhost/food-html/asset/home/img/201908200049128462.jpg', '提到牛排，脑子里就会想到焦棕褐色、表面扶着香甜的肉汁，切开后的粉红肉质，入口之后留下的满口肉香。吃牛排其实是非常讲究的，精致的牛肉配上美味的香料，加以烹调，是款待尊贵客人的最佳美食。', '90160928', '<p class=\"news-conitem\">西冷牛排（SIRLOIN）：也叫沙朗牛排，是指肉质鲜嫩又带油花嫩筋的牛肉，基本上取自于牛背脊一带最柔嫩的牛肉，具体位置不同，风味也各有千秋。比较正宗的沙朗取自后腰脊肉，但特殊的品种例如纽约客，则是取自于类似菲力的前腰脊肉。沙朗牛排肉质鲜嫩且香甜多汁，富有口感，受入门级牛排行家所偏好。</p>\r\n			<p class=\"news-conitem\">推荐火候：四至六分熟。</p>\r\n			<p class=\"news-conitem\">菲力牛排（FILLET）：也称嫩牛柳，牛里脊（TENDERLOIN)，取自于牛的里肌肉（即腰内肉），运动量少，且肉质最嫩精瘦，油脂少，因每头牛就一小条而显得「物稀为贵」。口感好但没有嚼头，并且烹煮过头就显得老涩，因此多推荐给牙口不好，消化较弱的老人家或小朋友食用。</p>\r\n			<p class=\"news-conitem\">推荐火候：三至七分熟。</p>\r\n			<p class=\"news-conitem\">丁骨牛排(T BONE)：是牛背上的脊骨肉，大块肉排中间夹着 T 字形的大骨,一边是菲力,一边是纽约客,肉质一细嫩一粗犷,或油腴或爽俐,点一客统统吃得到。</p>\r\n			<p class=\"news-conitem\">推荐火候：五至八分熟 。</p>\r\n			<p class=\"news-conitem\">肋眼牛排(RIB EYE) ：取自于牛肋脊部位，即牛骨边上的肉。肋眼牛排或许比不上腰脊肉那样嫩，但骨边肉向来好吃，油油嫩嫩的肉丝中夹着Q而有劲的油筋，比沙朗耐嚼，比菲力够味，而且油花十分丰郁，是受年轻男食客喜欢。</p>\r\n			<p class=\"news-conitem\">推荐火候：四至六分熟。</p>\r\n			<p class=\"news-conitem\">牛小排：牛小排取自于牛的胸腔左右两侧，含肋骨部分。牛小排带骨带筋肉质肥腴鲜美，多汁且耐嚼，有大理石纹，特别是采用牛的第六、七根肋骨的，嫩而不涩，肉量丰郁的全熟肉质，即使是怕生的食客也可怡然享用，更创造出牛小排的另类魅力。</p>\r\n			<p class=\"news-conitem\">推荐火候：全熟。</p>\r\n			<p class=\"news-conitem\">除了上述的品种，餐桌上常见的还有像牛肩胛部位的板腱肉、上肩胛肋眼心、牛肚部位的腹胁肉、上后腿肉等，这些部位虽然肉质纤维较粗，无法媲美以上品种。</p>\r\n			<p class=\"news-conitem\">牛排你要几成熟？</p>\r\n			<p class=\"news-conitem\">三分熟牛排，不是血淋淋的，看得到的只有一样漂亮的焦棕褐色，表面浮渗着香甜的肉汁。下刀切开后，看到的是火腿肠般的暗红色，品尝起来，入口只需轻轻嚼动便温润即化，留下满口的鲜甜馀香，这样，才是“三分熟”！</p>\r\n			<p class=\"news-conitem\">一分熟牛排（rare）：牛排内部为血红色且内部各处保持一定温度（高于very rare steak）。</p>\r\n			<p class=\"news-conitem\">三分熟牛排（medium rare）：内部为桃红且带有相当热度。</p>\r\n			<p class=\"news-conitem\">五分熟牛排（medium）：牛排内部为粉红且夹杂着浅灰和综褐色，整个牛排都很烫。</p>\r\n			<p class=\"news-conitem\">七分熟牛排（medium well）：牛排内部主要为浅灰综褐色，夹杂着粉红色。</p>\r\n			<p class=\"news-conitem\">全熟牛排（well done）：牛排内部为褐色。</p>');
INSERT INTO `f_news` VALUES ('9', '西餐代表 牛排的种类和吃法', 'http://localhost/food-html/asset/home/img/201908200049014021.jpg', '提到牛排，脑子里就会想到焦棕褐色、表面扶着香甜的肉汁，切开后的粉红肉质，入口之后留下的满口肉香。吃牛排其实是非常讲究的，精致的牛肉配上美味的香料，加以烹调，是款待尊贵客人的最佳美食。', '90160997', '<p class=\"news-conitem\">西冷牛排（SIRLOIN）：也叫沙朗牛排，是指肉质鲜嫩又带油花嫩筋的牛肉，基本上取自于牛背脊一带最柔嫩的牛肉，具体位置不同，风味也各有千秋。比较正宗的沙朗取自后腰脊肉，但特殊的品种例如纽约客，则是取自于类似菲力的前腰脊肉。沙朗牛排肉质鲜嫩且香甜多汁，富有口感，受入门级牛排行家所偏好。</p>\r\n			<p class=\"news-conitem\">推荐火候：四至六分熟。</p>\r\n			<p class=\"news-conitem\">菲力牛排（FILLET）：也称嫩牛柳，牛里脊（TENDERLOIN)，取自于牛的里肌肉（即腰内肉），运动量少，且肉质最嫩精瘦，油脂少，因每头牛就一小条而显得「物稀为贵」。口感好但没有嚼头，并且烹煮过头就显得老涩，因此多推荐给牙口不好，消化较弱的老人家或小朋友食用。</p>\r\n			<p class=\"news-conitem\">推荐火候：三至七分熟。</p>\r\n			<p class=\"news-conitem\">丁骨牛排(T BONE)：是牛背上的脊骨肉，大块肉排中间夹着 T 字形的大骨,一边是菲力,一边是纽约客,肉质一细嫩一粗犷,或油腴或爽俐,点一客统统吃得到。</p>\r\n			<p class=\"news-conitem\">推荐火候：五至八分熟 。</p>\r\n			<p class=\"news-conitem\">肋眼牛排(RIB EYE) ：取自于牛肋脊部位，即牛骨边上的肉。肋眼牛排或许比不上腰脊肉那样嫩，但骨边肉向来好吃，油油嫩嫩的肉丝中夹着Q而有劲的油筋，比沙朗耐嚼，比菲力够味，而且油花十分丰郁，是受年轻男食客喜欢。</p>\r\n			<p class=\"news-conitem\">推荐火候：四至六分熟。</p>\r\n			<p class=\"news-conitem\">牛小排：牛小排取自于牛的胸腔左右两侧，含肋骨部分。牛小排带骨带筋肉质肥腴鲜美，多汁且耐嚼，有大理石纹，特别是采用牛的第六、七根肋骨的，嫩而不涩，肉量丰郁的全熟肉质，即使是怕生的食客也可怡然享用，更创造出牛小排的另类魅力。</p>\r\n			<p class=\"news-conitem\">推荐火候：全熟。</p>\r\n			<p class=\"news-conitem\">除了上述的品种，餐桌上常见的还有像牛肩胛部位的板腱肉、上肩胛肋眼心、牛肚部位的腹胁肉、上后腿肉等，这些部位虽然肉质纤维较粗，无法媲美以上品种。</p>\r\n			<p class=\"news-conitem\">牛排你要几成熟？</p>\r\n			<p class=\"news-conitem\">三分熟牛排，不是血淋淋的，看得到的只有一样漂亮的焦棕褐色，表面浮渗着香甜的肉汁。下刀切开后，看到的是火腿肠般的暗红色，品尝起来，入口只需轻轻嚼动便温润即化，留下满口的鲜甜馀香，这样，才是“三分熟”！</p>\r\n			<p class=\"news-conitem\">一分熟牛排（rare）：牛排内部为血红色且内部各处保持一定温度（高于very rare steak）。</p>\r\n			<p class=\"news-conitem\">三分熟牛排（medium rare）：内部为桃红且带有相当热度。</p>\r\n			<p class=\"news-conitem\">五分熟牛排（medium）：牛排内部为粉红且夹杂着浅灰和综褐色，整个牛排都很烫。</p>\r\n			<p class=\"news-conitem\">七分熟牛排（medium well）：牛排内部主要为浅灰综褐色，夹杂着粉红色。</p>\r\n			<p class=\"news-conitem\">全熟牛排（well done）：牛排内部为褐色。</p>');

-- ----------------------------
-- Table structure for f_region
-- ----------------------------
DROP TABLE IF EXISTS `f_region`;
CREATE TABLE `f_region` (
  `region_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_name` varchar(255) DEFAULT NULL,
  `order_num` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`region_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_region
-- ----------------------------
INSERT INTO `f_region` VALUES ('1', '上海店', '0');
INSERT INTO `f_region` VALUES ('2', '广州店', '0');
INSERT INTO `f_region` VALUES ('3', '厦门店', '0');
INSERT INTO `f_region` VALUES ('4', '北京店', '0');
INSERT INTO `f_region` VALUES ('5', '深圳店', '0');
INSERT INTO `f_region` VALUES ('6', '其他', '0');

-- ----------------------------
-- Table structure for f_setting
-- ----------------------------
DROP TABLE IF EXISTS `f_setting`;
CREATE TABLE `f_setting` (
  `setting_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置id',
  `setting_name` varchar(255) DEFAULT NULL COMMENT '设置name',
  `setting_value` varchar(255) DEFAULT NULL COMMENT '设置value',
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_setting
-- ----------------------------
INSERT INTO `f_setting` VALUES ('1', 'website', '贵族食代');
INSERT INTO `f_setting` VALUES ('2', 'description', '美食');
INSERT INTO `f_setting` VALUES ('3', 'logo', null);
INSERT INTO `f_setting` VALUES ('4', 'copyright', '<p>CopyRight©2003-2015 www.91cy.cn All rigt rederved</p><p>版权所有：贵族食代牛排有限公司  </p>');
INSERT INTO `f_setting` VALUES ('5', 'ICP', 'ICP备案号：京ICP备16047255号-3本站信息由会员自主添加，如信息涉及隐私等，网站不承担任何责任！');
INSERT INTO `f_setting` VALUES ('6', 'hot_line', '9510 5396');
INSERT INTO `f_setting` VALUES ('7', 'email', 'E-mail:jiameng@diocoffee.com');

-- ----------------------------
-- Table structure for f_shop
-- ----------------------------
DROP TABLE IF EXISTS `f_shop`;
CREATE TABLE `f_shop` (
  `shop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `region_id` int(11) unsigned DEFAULT NULL,
  `dishes` text,
  `business_time` text,
  `parking` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tag` text,
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_shop
-- ----------------------------
INSERT INTO `f_shop` VALUES ('1', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('2', 'http://localhost/food-html/asset/home/img/201908200018268431.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('3', 'http://localhost/food-html/asset/home/img/201908200018068776.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('4', 'http://localhost/food-html/asset/home/img/201908200017531846.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('5', 'http://localhost/food-html/asset/home/img/201908200017416375.jpg', '上海店', '2', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('6', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '上海店', '2', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('9', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '上海店', '2', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('10', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '厦门店', '3', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('11', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '厦门店', '3', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('12', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '厦门店', '3', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('13', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '广州店', '4', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('14', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '广州店', '4', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('15', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '广州店', '4', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('16', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '深圳店', '5', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('17', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '深圳店', '5', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('18', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '北京朝阳区店', '6', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('19', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '北京朝阳区店', '6', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('20', 'http://localhost/food-html/asset/home/img/201908200017127812.jpg', '北京朝阳区店', '6', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('21', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('22', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('23', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('24', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('25', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('26', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('27', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('28', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('29', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('30', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('31', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('32', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('33', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('34', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('35', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');
INSERT INTO `f_shop` VALUES ('36', 'http://localhost/food-html/asset/home/img/201908200018378528.jpg', '北京朝阳区店', '1', '波尔多酒鹅肝批、罐焖牛肉、勃艮第少司焗蜗牛、奶油蘑菇汤、牛扒、羊排、鹅肝酱、龙虾', '11:00-22:00 人均消费： 300元左右 包间数量： 3', '', '', '');

-- ----------------------------
-- Table structure for f_single_page
-- ----------------------------
DROP TABLE IF EXISTS `f_single_page`;
CREATE TABLE `f_single_page` (
  `single_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`single_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_single_page
-- ----------------------------
INSERT INTO `f_single_page` VALUES ('1', '<p>贵族食代牛排是昔日的台湾首富、台湾知名企业贵族食代集团董事长王永庆先生招待贵宾的知名私房料理。严选一头牛的第六至第八对肋骨这六块牛排。是以“一头牛仅供6客”的贵族食代牛排为招牌菜的中高价位直营连锁西餐厅，独具中国口味，全熟牛排，鲜嫩多汁，适合中国人口味，以菜色精致、好吃、服务好、风格高雅、管理专业着称。</p>\r\n						<p>何谓经典，可能就是在品鉴无数美食后，其绝妙的滋味仍旧不能被替代。再次品味时，仍能激起内心的波澜与感动。如此经典，我们将为您重新诠释。全新的摆盘，搭配特制爽口的配菜，全熟风味，您不可辜负的舌尖美味。</p>\r\n						<p>2003年登陆大陆，截至目前，贵族食代牛排在上海、北京、深圳、广州、南京、武汉、成都、重庆等地已经有40余家直营店，成为高端连锁牛排的领导品牌。</p>\r', '公司简介', 'http://localhost/food-html/asset/home/img/201908182038223137.jpg');
INSERT INTO `f_single_page` VALUES ('2', '<p>贵族食代牛排是昔日的台湾首富、台湾知名企业贵族食代集团董事长王永庆先生招待贵宾的知名私房料理。严选一头牛的第六至第八对肋骨这六块牛排。是以“一头牛仅供6客”的贵族食代牛排为招牌菜的中高价位直营连锁西餐厅，独具中国口味，全熟牛排，鲜嫩多汁，适合中国人口味，以菜色精致、好吃、服务好、风格高雅、管理专业着称。</p>\r\n						<p>何谓经典，可能就是在品鉴无数美食后，其绝妙的滋味仍旧不能被替代。再次品味时，仍能激起内心的波澜与感动。如此经典，我们将为您重新诠释。全新的摆盘，搭配特制爽口的配菜，全熟风味，您不可辜负的舌尖美味。</p>\r\n						<p>2003年登陆大陆，截至目前，贵族食代牛排在上海、北京、深圳、广州、南京、武汉、成都、重庆等地已经有40余家直营店，成为高端连锁牛排的领导品牌。</p>\r', '公司简介', 'img/pic1.png');
INSERT INTO `f_single_page` VALUES ('3', '<p>贵族食代牛排是昔日的台湾首富、台湾知名企业贵族食代集团董事长王永庆先生招待贵宾的知名私房料理。严选一头牛的第六至第八对肋骨这六块牛排。是以“一头牛仅供6客”的贵族食代牛排为招牌菜的中高价位直营连锁西餐厅，独具中国口味，全熟牛排，鲜嫩多汁，适合中国人口味，以菜色精致、好吃、服务好、风格高雅、管理专业着称。</p>\r\n						<p>何谓经典，可能就是在品鉴无数美食后，其绝妙的滋味仍旧不能被替代。再次品味时，仍能激起内心的波澜与感动。如此经典，我们将为您重新诠释。全新的摆盘，搭配特制爽口的配菜，全熟风味，您不可辜负的舌尖美味。</p>\r\n						<p>2003年登陆大陆，截至目前，贵族食代牛排在上海、北京、深圳、广州、南京、武汉、成都、重庆等地已经有40余家直营店，成为高端连锁牛排的领导品牌。</p>\r', '公司简介', 'img/pic1.png');
INSERT INTO `f_single_page` VALUES ('4', '<p>贵族食代牛排是昔日的台湾首富、台湾知名企业贵族食代集团董事长王永庆先生招待贵宾的知名私房料理。严选一头牛的第六至第八对肋骨这六块牛排。是以“一头牛仅供6客”的贵族食代牛排为招牌菜的中高价位直营连锁西餐厅，独具中国口味，全熟牛排，鲜嫩多汁，适合中国人口味，以菜色精致、好吃、服务好、风格高雅、管理专业着称。</p>\r\n						<p>何谓经典，可能就是在品鉴无数美食后，其绝妙的滋味仍旧不能被替代。再次品味时，仍能激起内心的波澜与感动。如此经典，我们将为您重新诠释。全新的摆盘，搭配特制爽口的配菜，全熟风味，您不可辜负的舌尖美味。</p>\r\n						<p>2003年登陆大陆，截至目前，贵族食代牛排在上海、北京、深圳、广州、南京、武汉、成都、重庆等地已经有40余家直营店，成为高端连锁牛排的领导品牌。</p>\r', '公司简介', 'img/pic1.png');
INSERT INTO `f_single_page` VALUES ('5', '<p>贵族食代牛排是昔日的台湾首富、台湾知名企业贵族食代集团董事长王永庆先生招待贵宾的知名私房料理。严选一头牛的第六至第八对肋骨这六块牛排。是以“一头牛仅供6客”的贵族食代牛排为招牌菜的中高价位直营连锁西餐厅，独具中国口味，全熟牛排，鲜嫩多汁，适合中国人口味，以菜色精致、好吃、服务好、风格高雅、管理专业着称。</p>\r\n						<p>何谓经典，可能就是在品鉴无数美食后，其绝妙的滋味仍旧不能被替代。再次品味时，仍能激起内心的波澜与感动。如此经典，我们将为您重新诠释。全新的摆盘，搭配特制爽口的配菜，全熟风味，您不可辜负的舌尖美味。</p>\r\n						<p>2003年登陆大陆，截至目前，贵族食代牛排在上海、北京、深圳、广州、南京、武汉、成都、重庆等地已经有40余家直营店，成为高端连锁牛排的领导品牌。</p>\r', '公司简介', 'img/pic1.png');
INSERT INTO `f_single_page` VALUES ('6', '<p>贵族食代牛排是昔日的台湾首富、台湾知名企业贵族食代集团董事长王永庆先生招待贵宾的知名私房料理。严选一头牛的第六至第八对肋骨这六块牛排。是以“一头牛仅供6客”的贵族食代牛排为招牌菜的中高价位直营连锁西餐厅，独具中国口味，全熟牛排，鲜嫩多汁，适合中国人口味，以菜色精致、好吃、服务好、风格高雅、管理专业着称。</p>\r\n						<p>何谓经典，可能就是在品鉴无数美食后，其绝妙的滋味仍旧不能被替代。再次品味时，仍能激起内心的波澜与感动。如此经典，我们将为您重新诠释。全新的摆盘，搭配特制爽口的配菜，全熟风味，您不可辜负的舌尖美味。</p>\r\n						<p>2003年登陆大陆，截至目前，贵族食代牛排在上海、北京、深圳、广州、南京、武汉、成都、重庆等地已经有40余家直营店，成为高端连锁牛排的领导品牌。</p>\r', '公司简介', 'img/pic1.png');
INSERT INTO `f_single_page` VALUES ('7', '<p>贵族食代牛排是昔日的台湾首富、台湾知名企业贵族食代集团董事长王永庆先生招待贵宾的知名私房料理。严选一头牛的第六至第八对肋骨这六块牛排。是以“一头牛仅供6客”的贵族食代牛排为招牌菜的中高价位直营连锁西餐厅，独具中国口味，全熟牛排，鲜嫩多汁，适合中国人口味，以菜色精致、好吃、服务好、风格高雅、管理专业着称。</p>\r\n						<p>何谓经典，可能就是在品鉴无数美食后，其绝妙的滋味仍旧不能被替代。再次品味时，仍能激起内心的波澜与感动。如此经典，我们将为您重新诠释。全新的摆盘，搭配特制爽口的配菜，全熟风味，您不可辜负的舌尖美味。</p>\r\n						<p>2003年登陆大陆，截至目前，贵族食代牛排在上海、北京、深圳、广州、南京、武汉、成都、重庆等地已经有40余家直营店，成为高端连锁牛排的领导品牌。</p>\r', '公司简介', 'img/pic1.png');
