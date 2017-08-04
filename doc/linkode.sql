-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-08-04 17:05:05
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `linkode`
--

-- --------------------------------------------------------

--
-- 表的结构 `ad`
--

CREATE TABLE `ad` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ad`
--

INSERT INTO `ad` (`id`, `title`, `content`, `startDate`, `endDate`) VALUES
(1, '上海交通大学继续教育学院', 'http://sjtu.ebabyedu.com/', '2017-07-02', '2017-09-21'),
(2, '实力整装', 'http://www.baidu.com', '2017-07-02', '2017-07-31');

-- --------------------------------------------------------

--
-- 表的结构 `chat_log`
--

CREATE TABLE `chat_log` (
  `id` int(11) NOT NULL,
  `senderId` int(11) DEFAULT NULL,
  `receiverId` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `chat_log`
--

INSERT INTO `chat_log` (`id`, `senderId`, `receiverId`, `time`, `content`) VALUES
(1, 1, 2, '2017-06-07 00:00:00', 'jason是辣鸡'),
(2, 1, 2, '2017-07-26 17:16:07', '1'),
(3, 2, 1, '2017-07-27 13:34:40', '234'),
(4, 1, 2, '2017-07-27 17:16:48', '123'),
(5, 1, 2, '2017-07-27 17:16:50', '234'),
(6, 1, 3, '2017-06-07 00:00:00', 'jason是辣鸡'),
(9, 1, 3, '2017-08-02 14:21:29', '2'),
(10, 1, 2, '2017-08-02 17:27:49', 'test'),
(11, 1, 2, '2017-08-02 20:00:25', '1'),
(12, 2, 1, '2017-08-02 20:04:21', '你才是辣鸡'),
(13, 2, 1, '2017-08-02 20:19:00', '范围我案件诶哦蜂王浆爱哦你发哇哦你饿哦反'),
(14, 3, 1, '2017-08-03 09:22:17', '早上好啊你这个傻子'),
(15, 1, 3, '2017-08-03 09:22:32', '你早上吃的什么'),
(16, 3, 1, '2017-08-03 09:22:44', '发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意'),
(17, 1, 3, '2017-08-03 09:29:12', '发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意发还很大意'),
(18, 3, 1, '2017-08-03 09:37:15', '现在几点啦'),
(19, 1, 4, '2017-08-04 21:31:23', '你是谁啊');

-- --------------------------------------------------------

--
-- 表的结构 `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `activeId` int(11) NOT NULL,
  `passiveId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `portfolio`
--

INSERT INTO `portfolio` (`id`, `userId`, `title`, `content`, `type`, `time`, `likes`, `comments`) VALUES
(1, 2, '梵高自画像', '帅的不得了', 'image', '2017-07-31 00:00:00', 1000, 6),
(2, 3, '金正恩的童年回忆', '金正恩（朝鲜语：김정은英文：Kim Jong-un），1984年1月8日出生于朝鲜平壤，', 'literature', '2017-07-20 00:00:00', 10, 4),
(5, 1, '极简派', '少即是多。', 'video', NULL, 0, 3),
(6, 3, '满江红', '满江红岳飞怒发冲冠，凭阑处、潇潇雨歇。抬望眼、仰天长啸，壮怀激烈。三十功名尘与土，', 'literature', NULL, 0, 1),
(7, 3, '蒙娜丽莎', '前声称找到了疑似修女丽莎・盖拉尔迪尼的遗骨。对《蒙娜丽莎》原型的身份\r\n						', 'image', NULL, 0, 1),
(8, 3, '上交继续教育学院宣传片', '快点来学，1000块就可以得上海交大文凭。', 'video', NULL, 0, 1),
(9, 1, '瓦尔登湖', '我自己临摹的瓦尔登湖。', 'image', NULL, 0, 1),
(10, 3, '登录界面', '#001 for the DailyUI challenge ? Click attachment to see larger version.', 'image', '2017-07-18 00:00:00', 6666, 0),
(12, 5, '猫', '动物是人类的朋友，猫咪也是。', 'image', '2017-07-13 00:00:00', 0, 14),
(13, 6, '小学生检讨', '我不该横穿马路的，妈妈我错了。', 'image', '2017-07-29 00:00:00', 123, 1);

-- --------------------------------------------------------

--
-- 表的结构 `portfolio_cmt`
--

CREATE TABLE `portfolio_cmt` (
  `id` int(11) NOT NULL,
  `portfolioId` int(11) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `portfolio_cmt`
--

INSERT INTO `portfolio_cmt` (`id`, `portfolioId`, `content`, `userId`, `time`) VALUES
(1, 1, '好漂亮啊', 2, '2017-07-26 00:00:00'),
(2, 5, '加我嗯按键覅哦啊我今儿佛挖二分', 1, '2017-07-19 00:00:00'),
(3, 5, '234', 1, '2017-07-14 03:23:15'),
(4, 1, '123123', 1, '2017-07-14 03:24:27'),
(5, 1, '1616年4月23日），华人社会常尊称为莎翁，', 1, '2017-07-14 03:24:33'),
(6, 1, '清末民初鲁迅在《摩罗诗力说》（1908年2月）称莎翁为“狭斯丕尔”，是英国文学史上最杰出的戏剧家，也是欧洲文艺复兴时期最重要、最伟大的作家，全世界最卓越的文学家之一。莎士比亚在埃文河畔斯特拉特福出生长', 1, '2017-07-14 03:24:36'),
(7, 2, '评论一点\r\n', 2, '2017-07-14 03:26:19'),
(8, 1, '诗力说》（1908年2月）称莎翁为“狭斯丕尔', 2, '2017-07-14 03:26:30'),
(9, 1, 'now\r\n', 2, '2017-07-14 03:27:32'),
(10, 7, 'wjeifaojiawof', 3, '2017-07-14 06:03:52'),
(11, 8, 'jiwjfeaojweaoifejioweajfiowjafijwaofe', 3, '2017-07-14 06:18:41'),
(12, 9, '评论一下', 1, '2017-07-14 07:45:18'),
(13, 2, '真的好感人啊', 1, '2017-07-17 08:07:05'),
(14, 6, '写的真棒啊！！！', 11, '2017-07-17 08:08:17'),
(15, 2, '真棒', 1, '2017-07-19 07:01:31'),
(16, 5, 'hhhhhhh', 2, '2017-07-19 08:03:11'),
(17, 13, '知错就改就是好孩子', 12, '2017-07-19 08:07:47'),
(32, 12, 'hahahhahaha', 5, '2017-07-20 16:11:08');

-- --------------------------------------------------------

--
-- 表的结构 `portfolio_like`
--

CREATE TABLE `portfolio_like` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `portfolioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`id`, `type`, `title`, `content`, `time`, `userId`) VALUES
(1, 'img2', '怎么打开电脑？', '我不知道怎么打开电脑.', '2017-07-26 00:00:00', 4),
(3, 'music', 'hello', 'this is test', '2017-07-31 00:00:00', 5);

-- --------------------------------------------------------

--
-- 表的结构 `post_cmt`
--

CREATE TABLE `post_cmt` (
  `id` int(11) NOT NULL,
  `postid` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `postCmtId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `post_cmt`
--

INSERT INTO `post_cmt` (`id`, `postid`, `content`, `time`, `userId`, `postCmtId`) VALUES
(11, 3, '123', '2017-07-21 16:22:48', 3, NULL),
(15, 1, '试一试就好了', '2017-07-21 16:57:09', 3, NULL),
(16, 1, '回复一下自己', '2017-07-21 16:57:17', 3, 15);

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `posterId` int(11) NOT NULL,
  `contractorId` int(11) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `requirement` varchar(200) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `applicants` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `posterId`, `contractorId`, `title`, `requirement`, `type`, `startDate`, `endDate`, `status`, `money`, `applicants`) VALUES
(35, 2, 1, '上海交通小学校徽设计', '要又红又专，富强民主法治。', 'image', '2017-07-19', '2017-08-31', 'confirm', 100000, 0),
(38, 1, 0, '给软院比赛写个推送', '要文笔优美，字数过1000字，普通话10级。', 'literature', '2017-07-01', '2017-07-31', 'post', 500, 0),
(40, 1, 12, '画微信头像', '要画的像我，还要像吴彦祖。', 'music', '2017-07-19', '2017-10-26', 'confirm', 666666, 0),
(41, 1, 0, '毕业纪录片拍摄', '要拍出唯美伤感让人痛苦流涕不能自拔的感觉。', 'video', '2017-07-07', '2017-07-16', 'post', 100000, 0),
(42, 5, 1, '国家一级保密项目', '帮我写一下小学暑假作业，包括语文数学英语，验收通过才给钱。', 'literature', '2017-07-19', '2017-07-29', 'confirm', 100, 0),
(43, 1, NULL, '游戏海报设计', '上面一号宋体大字写“砍一刀到999级，满地掉人民币”，配上霸气暗黑背景。', 'image', '2017-07-17', '2017-07-31', 'post', 66666, 0),
(44, 1, NULL, '123', 'aewfeawf', 'literature', '2017-07-18', '2017-07-31', 'post', 234, 0),
(45, 2, 1, '唱一首红歌', '6月28日来唱', 'music', '2017-07-19', '2017-06-28', 'contract', 500, 0),
(46, 2, 3, 'some more', 'come some people', 'video', '2017-07-19', '2017-07-25', 'confirm', 66666, 0),
(47, 2, 1, '啦啦啦啦', '啦啦啦啦啦啦啦啦啦啦啦', 'music', '2017-07-21', '2017-07-13', 'confirm', 663414, 0),
(50, 1, NULL, '如果我是DJ你会爱我吗', '要写一首比孟女哭长城还悲伤的歌。', 'music', '2017-07-21', '2017-07-12', 'post', 2342466, 0);

-- --------------------------------------------------------

--
-- 表的结构 `project_app`
--

CREATE TABLE `project_app` (
  `id` int(11) NOT NULL,
  `projectId` int(11) DEFAULT NULL,
  `applicantId` int(11) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `result` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project_app`
--

INSERT INTO `project_app` (`id`, `projectId`, `applicantId`, `content`, `time`, `result`) VALUES
(1, 1, 2, 'this is a test for project_app', '2017-07-26 00:00:00', 1),
(6, 12323, 123231, 'awefaefw', '2017-07-11 00:00:00', NULL),
(7, 234, 123, 'wafawef', '2017-07-06 00:00:00', NULL),
(8, 123, 234, 'awefeawf', '2017-07-06 00:00:00', NULL),
(9, 35, 1, '让我来', '2017-07-19 00:48:41', 1),
(10, 35, 3, '我很棒的', '2017-07-19 01:27:18', NULL),
(11, 45, 1, 'give me', '2017-07-19 07:28:48', 1),
(12, 46, 1, 'hello\r\n', '2017-07-19 07:31:26', 0),
(13, 46, 1, '干嘛拒绝我', '2017-07-19 07:43:07', 0),
(14, 46, 1, '再来试一试', '2017-07-19 07:50:35', 0),
(15, 46, 3, ' 我也想试一试', '2017-07-19 07:51:03', 1),
(16, 40, 12, '可以让我试一试吗', '2017-07-19 08:04:05', 0),
(17, 40, 12, '真的不能试一试吗', '2017-07-19 08:04:53', 1),
(18, 42, 1, 'jason要报名', '2017-07-19 14:15:53', 0),
(19, 42, 1, '我还要报名', '2017-07-19 14:16:32', 1),
(21, 47, 1, '囧闻案件覅偶加我覅偶尔', '2017-07-21 09:51:51', 0),
(22, 47, 1, 'wefhuihwauifhwafeoew', '2017-07-21 09:52:22', 1);

-- --------------------------------------------------------

--
-- 表的结构 `project_commit`
--

CREATE TABLE `project_commit` (
  `id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project_commit`
--

INSERT INTO `project_commit` (`id`, `time`, `content`, `result`, `projectId`) VALUES
(1, '2017-07-19 06:47:39', '我做好啦', 'reject', 35),
(2, '2017-07-19 07:00:18', '再试一次', 'accept', 35),
(3, '2017-07-19 07:06:18', '求求你让我过吧', 'accept', 35),
(4, '2017-07-19 07:52:45', '123', 'reject', 46),
(5, '2017-07-19 07:53:03', '234', 'accept', 46),
(6, '2017-07-19 07:54:01', '234234234', 'accept', 46),
(7, '2017-07-19 08:05:08', 'wefaijawiofjowaejfiojawefjawofjeowf 这样', 'accept', 40),
(8, '2017-07-19 08:05:20', 'jiowjeaofjwoeajfowa 然后这样', 'reject', 40),
(9, '2017-07-19 08:05:32', 'jiowejfoijwaiofjaewjiofwj 那这样呢', 'accept', 40),
(10, '2017-07-19 14:17:43', '我画了一个猪头', 'reject', 42),
(11, '2017-07-19 14:17:58', '我画了一个jason头', 'accept', 42),
(12, '2017-07-21 09:52:37', 'joifwjeiofjweaofjewafwaf', 'accept', 47),
(13, '2017-07-21 09:52:44', 'fawefawjfioawfjawef', 'reject', 47),
(14, '2017-07-21 09:52:50', 'awefmioawjefoijwaioefjowjafe', 'accept', 47);

-- --------------------------------------------------------

--
-- 表的结构 `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `posterId` int(11) DEFAULT NULL,
  `contractorId` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `portfolioId` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tutorial`
--

CREATE TABLE `tutorial` (
  `id` int(11) NOT NULL,
  `content` text,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tutorial`
--

INSERT INTO `tutorial` (`id`, `content`, `type`) VALUES
(1, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">磨皮</div>\r\n	<div class="info-right col-sm-10">高低频，介绍一下什么是高低频磨皮</div>\r\n</div>\r\n<div class="row content-text">\r\n		本篇教程教大家如何使用高低频修肤方法，高低频磨皮是一种什么常用的磨皮方法，而且难度不大，大家认真学习一下，记着要点即可使用。其实不管是产品修图还是人像修图都没有想象中那么难哦，只要大家掌握了要领，就可以把图修得美美哒!大家赶紧get这个技能吧。\r\n	<h3>如何美白</h3>\r\n	<img src="../static/img/pic/pic-10.png" />\r\n	第一步：首先，我们先把人物皮肤上明显的瑕疵修掉，比如痘痘，痘印等。这边可以用修补工具来修饰(污点修复画笔工具-修补工具)。<br/><br/>\r\n        第二步：连续复制两个图层，第一个复制的图层名字改“低频”;第二个复制的图层改成“高频”。先把高频眼睛关掉，在低频上我们要进行皮肤的磨皮工作，可以选择用磨皮插件，也可以选择用高斯模糊。<br/><br/>\r\n        这边我选择的是高斯模糊，模糊参数控制在模糊到没有瑕疵就可以了，这时候整个图像都是模糊的，所以我们要加上蒙版过渡，按住Alt键，鼠标蒙版标志就可以加上一个黑色的蒙版，再用白色画笔擦除人物脸上的模糊效果。<br/>\r\n	<hr />\r\n	<a class="bottom" href="#">赞助Linkode</a>\r\n	<a class="bottom" href="#">回到顶部</a>\r\n</div>', '第一章'),
(2, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">磨皮</div>\r\n	<div class="info-right col-sm-10">高低频，介绍一下什么是高低频磨皮</div>\r\n</div>\r\n<div class="row content-text">\r\n		本篇教程教大家如何使用高低频修肤方法，高低频磨皮是一种什么常用的磨皮方法，而且难度不大，大家认真学习一下，记着要点即可使用。其实不管是产品修图还是人像修图都没有想象中那么难哦，只要大家掌握了要领，就可以把图修得美美哒!大家赶紧get这个技能吧。\r\n	<h3>如何美白</h3>\r\n	<img src="../static/img/pic/pic-5.png" />\r\n	第一步：首先，我们先把人物皮肤上明显的瑕疵修掉，比如痘痘，痘印等。这边可以用修补工具来修饰(污点修复画笔工具-修补工具)。<br/><br/>\r\n        第二步：连续复制两个图层，第一个复制的图层名字改“低频”;第二个复制的图层改成“高频”。先把高频眼睛关掉，在低频上我们要进行皮肤的磨皮工作，可以选择用磨皮插件，也可以选择用高斯模糊。<br/><br/>\r\n        这边我选择的是高斯模糊，模糊参数控制在模糊到没有瑕疵就可以了，这时候整个图像都是模糊的，所以我们要加上蒙版过渡，按住Alt键，鼠标蒙版标志就可以加上一个黑色的蒙版，再用白色画笔擦除人物脸上的模糊效果。<br/>\r\n	<hr />\r\n	<a class="bottom" href="#">赞助Linkode</a>\r\n	<a class="bottom" href="#">回到顶部</a>\r\n</div>', '第二章'),
(3, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">磨皮</div>\r\n	<div class="info-right col-sm-10">高低频，介绍一下什么是高低频磨皮</div>\r\n</div>\r\n<div class="row content-text">\r\n		本篇教程教大家如何使用高低频修肤方法，高低频磨皮是一种什么常用的磨皮方法，而且难度不大，大家认真学习一下，记着要点即可使用。其实不管是产品修图还是人像修图都没有想象中那么难哦，只要大家掌握了要领，就可以把图修得美美哒!大家赶紧get这个技能吧。\r\n	<h3>如何美白</h3>\r\n	<img src="../static/img/pic/pic-12.png" />\r\n	第一步：首先，我们先把人物皮肤上明显的瑕疵修掉，比如痘痘，痘印等。这边可以用修补工具来修饰(污点修复画笔工具-修补工具)。<br/><br/>\r\n        第二步：连续复制两个图层，第一个复制的图层名字改“低频”;第二个复制的图层改成“高频”。先把高频眼睛关掉，在低频上我们要进行皮肤的磨皮工作，可以选择用磨皮插件，也可以选择用高斯模糊。<br/><br/>\r\n        这边我选择的是高斯模糊，模糊参数控制在模糊到没有瑕疵就可以了，这时候整个图像都是模糊的，所以我们要加上蒙版过渡，按住Alt键，鼠标蒙版标志就可以加上一个黑色的蒙版，再用白色画笔擦除人物脸上的模糊效果。<br/>\r\n	<hr />\r\n	<a class="bottom" href="#">赞助Linkode</a>\r\n	<a class="bottom" href="#">回到顶部</a>\r\n</div>', '第三章'),
(5, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">磨皮</div>\r\n	<div class="info-right col-sm-10">高低频，介绍一下什么是高低频磨皮</div>\r\n</div>\r\n<div class="row content-text">\r\n威廉·莎士比亚（英语：William Shakespeare，1564年4月23日－1616年4月23日），华人社会常尊称为莎翁，清末民初鲁迅在《摩罗诗力说》（1908年2月）称莎翁为“狭斯丕尔”，是英国文学史上最杰出的戏剧家，也是欧洲文艺复兴时期最重要、最伟大的作家，全世界最卓越的文学家之一。莎士比亚在埃文河畔斯特拉特福出生长大，18岁时与安妮·海瑟薇结婚，两人共生育了三个孩子：苏珊娜、双胞胎哈姆尼特和朱迪思。16世纪末到17世纪初的20多年期间莎士比亚在伦敦开始了成功的职业生涯，他不仅是演员、剧作家，还是宫内大臣剧团的合伙人之一，后来改名为国王剧团。1613年左右，莎士比亚退休回到埃文河畔斯特拉特福，3年后逝世。1590年到1613年是莎士比亚的创作的黄金时代。他的早期剧本主要是喜剧和历史剧，在16世纪末期达到了深度和艺术性的高峰。接下来到1608年他主要创作悲剧，莎士比亚崇尚高尚情操，常常描写牺牲与复仇，包括《奥赛罗》、《哈姆雷特》、《李尔王》和《麦克白》，被认为属于英语最佳范例。在他人生最后阶段，他开始创作悲喜剧，又称为传奇剧。莎士比亚流传下来的作品包括38部戏剧、154首十四行诗、两首长叙事诗。他的戏剧有各种主要语言的译本，且表演次数远远超过其他任何戏剧家的作品。<br/><br/>\r\n		本篇教程教大家如何使用高低频修肤方法，高低频磨皮是一种什么常用的磨皮方法，而且难度不大，大家认真学习一下，记着要点即可使用。其实不管是产品修图还是人像修图都没有想象中那么难哦，只要大家掌握了要领，就可以把图修得美美哒!大家赶紧get这个技能吧。\r\n	<h3>如何美白</h3>\r\n	<img src="../static/img/pic/pic-2.png" />\r\n	第一步：首先，我们先把人物皮肤上明显的瑕疵修掉，比如痘痘，痘印等。这边可以用修补工具来修饰(污点修复画笔工具-修补工具)。<br/><br/>\r\n        第二步：连续复制两个图层，第一个复制的图层名字改“低频”;第二个复制的图层改成“高频”。先把高频眼睛关掉，在低频上我们要进行皮肤的磨皮工作，可以选择用磨皮插件，也可以选择用高斯模糊。<br/><br/>\r\n        这边我选择的是高斯模糊，模糊参数控制在模糊到没有瑕疵就可以了，这时候整个图像都是模糊的，所以我们要加上蒙版过渡，按住Alt键，鼠标蒙版标志就可以加上一个黑色的蒙版，再用白色画笔擦除人物脸上的模糊效果。<br/>\r\n	<hr />\r\n	<a class="bottom" href="#">赞助Linkode</a>\r\n	<a class="bottom" href="#">回到顶部</a>\r\n</div>', '第四章'),
(6, '<a class="cute-btn" id="cute-1" href="../tutorial/1">第一章</a>\r\n<a class="cute-btn" id="cute-2" href="../tutorial/2">第二章</a>\r\n<a class="cute-btn" id="cute-3" href="../tutorial/3">第三章</a>\r\n<a class="cute-btn" id="cute-5" href="../tutorial/5">第四章</a>', 'navigator');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `ratingNumber` int(11) DEFAULT NULL,
  `ratingTotal` int(11) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `money` int(11) DEFAULT '0',
  `intro` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `ratingNumber`, `ratingTotal`, `sex`, `birthday`, `role`, `money`, `intro`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@sjtu.edu.cn', 1, 5, 'male', '2017-06-01', 'admin', 1000000, 'hello~'),
(2, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@qq.com', 1, 5, 'female', '2017-07-04', 'admin', 666666, NULL),
(3, 'vital', 'c32add6b67bd0c26c50f1716849bfae9', 'vital@q', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(4, 'abc', '900150983cd24fb0d6963f7d28e17f72', 'abc@2', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(5, 'abc', '900150983cd24fb0d6963f7d28e17f72', 'abc@1', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(6, 'aa', '4124bc0a9335c27f086f24ba207a4912', 'aa@1', 1, 2, 'male', NULL, 'guest', NULL, NULL),
(8, 'test', 'test', 'test@132.com', 1, 5, 'male', NULL, 'admin', NULL, NULL),
(9, 'qq', '099b3b060154898840f0ebdfb46ec78f', 'qq@qq', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(10, 'hello', '5d41402abc4b2a76b9719d911017c592', 'hello@1', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(11, 'guest', '084e0343a0486ff05530df6c705c8bb4', 'guest@1', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(12, 'new', '22af645d1859cb5ca6da0c484f1f37ea', 'new@1', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(13, 'a', '0cc175b9c0f1b6a831c399e269772661', 'a@1', NULL, NULL, NULL, NULL, 'guest', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad`
--
ALTER TABLE `ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_log`
--
ALTER TABLE `chat_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Aid` (`senderId`),
  ADD KEY `Bid` (`receiverId`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activeId` (`activeId`),
  ADD KEY `passiveId` (`passiveId`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `portfolio_cmt`
--
ALTER TABLE `portfolio_cmt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolioId` (`portfolioId`);

--
-- Indexes for table `portfolio_like`
--
ALTER TABLE `portfolio_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `post_cmt`
--
ALTER TABLE `post_cmt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postId` (`postid`),
  ADD KEY `postCmtId` (`postCmtId`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BId` (`contractorId`),
  ADD KEY `posterId` (`posterId`);

--
-- Indexes for table `project_app`
--
ALTER TABLE `project_app`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projectId` (`projectId`),
  ADD KEY `applicantId` (`applicantId`);

--
-- Indexes for table `project_commit`
--
ALTER TABLE `project_commit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projectId` (`projectId`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contractorId` (`contractorId`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ad`
--
ALTER TABLE `ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `chat_log`
--
ALTER TABLE `chat_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `portfolio_cmt`
--
ALTER TABLE `portfolio_cmt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- 使用表AUTO_INCREMENT `portfolio_like`
--
ALTER TABLE `portfolio_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `post_cmt`
--
ALTER TABLE `post_cmt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- 使用表AUTO_INCREMENT `project_app`
--
ALTER TABLE `project_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 使用表AUTO_INCREMENT `project_commit`
--
ALTER TABLE `project_commit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tutorial`
--
ALTER TABLE `tutorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
