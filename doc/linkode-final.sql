-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-09-13 09:47:31
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
  `endDate` date DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ad`
--

INSERT INTO `ad` (`id`, `title`, `content`, `startDate`, `endDate`, `filename`) VALUES
(1, '天猫', 'https://www.tmall.com/', '2017-08-04', '2017-09-15', 'ad1tm.png'),
(2, '家具整装', 'http://www.homekoo.com/zhixiao/beijing/?from=bjzy000088929', '2017-07-02', '2017-07-31', 'ad2zz.png'),
(3, '天猫广告', 'https://www.tmall.com', '2017-07-02', '2017-07-31', 'ad3tm.png'),
(5, '上海交通大学', 'http://www.sjtu.edu.cn', '2017-09-05', '2017-09-22', 'ad4sjtu.png');

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
(99, 0, 1, '2017-09-13 15:22:39', '项目<a href=''../../project/50''>[阳光小学校歌征集]</a>有新的申请。'),
(100, 0, 3, '2017-09-13 15:32:51', '您对项目<a href=''../../project/50''>[阳光小学校歌征集]</a>的申请已被拒绝。'),
(101, 0, 1, '2017-09-13 15:33:04', '项目<a href=''../../project/50''>[阳光小学校歌征集]</a>有新的申请。'),
(102, 0, 1, '2017-09-13 15:33:24', '项目<a href=''../../project/38''>[《环球地理》稿件收集]</a>有新的申请。'),
(103, 0, 3, '2017-09-13 15:33:34', '您成功承包了项目<a href=''../../project/38''>[《环球地理》稿件收集]</a>。'),
(104, 0, 1, '2017-09-13 15:33:56', '项目<a href=''../../project/38''>[《环球地理》稿件收集]</a>有新的提交。'),
(105, 0, 3, '2017-09-13 15:34:17', '您在项目<a href=''../../project/38''>[《环球地理》稿件收集]</a>中的提交已被通过。'),
(106, 0, 1, '2017-09-13 15:34:27', '项目<a href=''../../project/38''>[《环球地理》稿件收集]</a>有新的提交。'),
(107, 0, 3, '2017-09-13 15:34:30', '您在项目<a href=''../../project/38''>[《环球地理》稿件收集]</a>中的提交已被通过。'),
(108, 0, 3, '2017-09-13 15:34:41', '您承包的项目<a href=''../../project/38''>[《环球地理》稿件收集]</a>已完结,500000元酬金已经到账。'),
(109, 5, 1, '2017-09-13 15:45:22', '你好，请问你是管理员吗'),
(110, 1, 5, '2017-09-13 15:45:30', '是的呢，有什么事吗亲'),
(111, 5, 1, '2017-09-13 15:45:57', '没事啦，我就问问而已'),
(112, 1, 5, '2017-09-13 15:46:10', '好的，再见'),
(113, 5, 2, '2017-09-13 15:46:35', '你的名字好酷哦'),
(114, 2, 5, '2017-09-13 15:46:55', '我也觉得。');

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
  `comments` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `portfolio`
--

INSERT INTO `portfolio` (`id`, `userId`, `title`, `content`, `type`, `time`, `likes`, `comments`, `url`, `status`) VALUES
(1, 5, '猫和家', '温馨的家庭生活。', 'image', '2017-07-31 00:00:00', 1, 1, 'pic-0.png', NULL),
(2, 4, '春', '盼望着，盼望着，东风来了，春天的脚步近了。 \r\n\r\n一切都像刚睡醒的样子，欣欣然张开了眼。山朗润起来了，水涨起来了，太阳的脸红起来了。 \r\n\r\n小草偷偷地从土地里钻出来，嫩嫩的，绿绿的。园子里，田野里，瞧去，一大片一大片满是的。坐着，躺着，打两个滚，踢几脚球，赛几趟跑，捉几回迷藏。风轻俏俏的，草软绵绵的。 \r\n\r\n桃树，杏树，梨树，你不让我，我不让你，都开满了花赶趟儿。红的像火，粉的像霞，白的像雪。花里带着甜味；闭了眼，树上仿佛已经满是桃儿，杏儿，梨儿。花下成千成百的蜜蜂嗡嗡的闹着，大小的蝴蝶飞来飞去。野花遍地是：杂样儿，有名字的，没名字的，散在草丛里像眼睛像星星，还眨呀眨。 ', 'literature', '2017-07-20 00:00:00', 0, 0, 'pic-1.png', NULL),
(5, 1, '时空隧道', '“时空隧道”是指穿越时空的一种途径，又称超自然现象。它是客观存在，是物质性的，它看不见，摸不着，对于我们人类生活的物质世界，它既关闭，又不绝对关闭。\r\n\r\n偶尔开放“时空隧道”和人类世界不是一个时间体系，进入另一套时间体系里，有可能回到遥远的过去，或进入未来，因为在“时空隧道”里，时间具有方向性和可逆性，它可以正转，也可倒转，还可以相对静止。', 'video', '2017-08-05 00:00:00', 0, 0, 'pic-2.png', NULL),
(6, 3, '满江红', '怒发冲冠，凭栏处，潇潇雨歇。\r\n抬望眼，仰天长啸，壮怀激烈。\r\n三十功名尘与土，八千里路云和月。\r\n莫等闲，白了少年头，空悲切!\r\n\r\n靖康耻，犹未雪；臣子恨，何时灭？\r\n驾长车，踏破贺兰山缺。\r\n壮志饥餐胡虏肉，笑谈渴饮匈奴血。\r\n待从头，收拾旧山河，朝天阙！', 'literature', '2017-08-06 00:00:00', 1, 1, 'pic-3.png', NULL),
(7, 2, 'Q版pizza', '很好看的q版比萨，欢迎下载', 'image', '2017-08-10 00:00:00', 2, 0, 'pic-4.png', NULL),
(8, 3, '外星基地', '卡通风格的外星基地。', 'image', '2017-08-11 00:00:00', 1, 0, 'pic-5.png', NULL),
(9, 1, '星球', '蓝紫色系的星球，喜欢请评论点赞或关注我！', 'image', '2017-08-12 00:00:00', 0, 1, 'pic-6.png', NULL),
(10, 8, '时间的沙漏', 'When time ends, the world ends.', 'image', '2017-08-13 00:00:00', 2, 1, 'pic-7.png', NULL),
(12, 5, '卡通女性肖像', '炒鸡好看的，快来点赞！', 'image', '2017-08-14 00:00:00', 0, 0, 'pic-8.png', NULL),
(13, 6, '小学生检讨', '我不该横穿马路的，妈妈我错了。', 'image', '2017-08-15 00:00:00', 0, 0, 'pic-9.png', 0),
(24, 6, '小动物', '新人第一次冒泡，希望大家喜欢！', 'image', '2017-09-08 00:00:00', 2, 1, 'pic-10.png', NULL);

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
(35, 24, '好有特色的五只小动物！', 3, '2017-09-13 15:22:20'),
(36, 1, '好漂亮的色彩', 3, '2017-09-13 15:23:39'),
(37, 6, '我自己都觉得自己写的很好', 3, '2017-09-13 15:23:51'),
(38, 10, '不错，黑而深邃，我很喜欢', 5, '2017-09-13 15:40:49'),
(39, 9, '让人联想到星空', 5, '2017-09-13 15:41:11');

-- --------------------------------------------------------

--
-- 表的结构 `portfolio_like`
--

CREATE TABLE `portfolio_like` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `portfolioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `portfolio_like`
--

INSERT INTO `portfolio_like` (`id`, `userId`, `portfolioId`) VALUES
(25, 3, 24),
(26, 3, 1),
(27, 3, 6),
(28, 3, 10),
(29, 3, 8),
(30, 3, 7),
(31, 5, 10),
(32, 5, 24),
(33, 5, 7);

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
(5, NULL, '怎么下载PS软件', '我弄了好久都不知道该怎么下手，哎。', '2017-09-13 15:23:09', 3),
(6, NULL, '向日葵怎么画好看呢', '45°画向日葵感觉看起来有点奇怪。', '2017-09-13 15:40:35', 5);

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
(20, 5, '自己顶一下', '2017-09-13 15:23:16', 3, NULL),
(21, 5, '我也不知道，同求', '2017-09-13 15:39:10', 1, 20),
(22, 5, '好的，我们一起等大神来', '2017-09-13 15:39:20', 3, 20),
(23, 5, '我给你讲吧，等我先准备一下。', '2017-09-13 15:39:40', 5, NULL);

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
(35, 8, NULL, '2088年奥运会LOGO设计', '要体现中国特色，还要有时尚的freestyle', 'image', '2017-07-19', '2017-09-30', 'post', 10000000, 0),
(38, 1, 3, '《环球地理》稿件收集', '要文笔优美，字数过1000字，普通话10级。', 'literature', '2017-09-13', '2017-10-21', 'confirm', 500000, 0),
(40, 3, NULL, '公众号LOGO设计', '给交大赛艇社团设计LOGO', 'image', '2017-07-21', '2017-10-26', 'post', 666666, 0),
(41, 4, NULL, '毕业纪录片拍摄', '要拍出唯美伤感让人痛苦流涕不能自拔的感觉。', 'video', '2017-07-22', '2017-10-26', 'post', 100000, 0),
(42, 5, NULL, '国家一级保密项目', '帮我写一下小学暑假作业，包括语文数学英语，验收通过才给钱。', 'literature', '2017-07-23', '2017-07-29', 'post', 100, 0),
(43, 6, NULL, '游戏海报设计', '上面一号宋体大字写“砍一刀到999级，满地掉人民币”，配上霸气暗黑背景。', 'image', '2017-07-24', '2018-12-01', 'post', 66666, 0),
(45, 9, NULL, '红歌创作', '创作新时代正能量的红歌', 'music', '2017-07-29', '2017-10-21', 'post', 500, 0),
(47, 3, NULL, '山水画', '把思源湖化成山水画', 'image', '2017-08-21', '2017-10-21', 'post', 9999, 0),
(50, 1, NULL, '阳光小学校歌征集', '要写一首能让广场舞大妈传唱千年的经典歌曲。', 'music', '2017-09-08', '2017-10-27', 'post', 2342466, 0);

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
(33, 50, 3, '三十年老DJ，要吗', '2017-09-13 15:22:38', 0),
(34, 50, 3, 'I won''t take no for answer.', '2017-09-13 15:33:04', NULL),
(35, 38, 3, '我已经发过五篇了，还想发，可以吗', '2017-09-13 15:33:24', 1);

-- --------------------------------------------------------

--
-- 表的结构 `project_commit`
--

CREATE TABLE `project_commit` (
  `id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project_commit`
--

INSERT INTO `project_commit` (`id`, `time`, `content`, `result`, `projectId`, `filename`) VALUES
(23, '2017-09-13 15:33:56', '写了一些文档', 'accept', 38, '232017年大二暑期大作业安排.doc'),
(24, '2017-09-13 15:34:27', '再写了一点', 'accept', 38, '242017年大二暑期大作业安排.doc');

-- --------------------------------------------------------

--
-- 表的结构 `project_rating`
--

CREATE TABLE `project_rating` (
  `id` int(11) NOT NULL,
  `projectId` int(11) DEFAULT NULL,
  `contractorId` int(11) DEFAULT NULL,
  `posterId` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project_rating`
--

INSERT INTO `project_rating` (`id`, `projectId`, `contractorId`, `posterId`, `rating`, `content`) VALUES
(18, 38, 3, 1, 5, '很棒，岳飞的文笔很好');

-- --------------------------------------------------------

--
-- 表的结构 `relation`
--

CREATE TABLE `relation` (
  `id` int(11) NOT NULL,
  `senderId` int(11) DEFAULT NULL,
  `receiverId` int(11) DEFAULT NULL,
  `messages` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `relation`
--

INSERT INTO `relation` (`id`, `senderId`, `receiverId`, `messages`, `likes`) VALUES
(12, 0, 1, 0, 0),
(13, 3, 2, 0, 1),
(14, 3, 6, 0, 1),
(15, 3, 8, 0, 1),
(16, 0, 3, 5, 0),
(17, 5, 1, 0, 1),
(18, 1, 5, 1, 0),
(19, 5, 2, 0, 0),
(20, 2, 5, 1, 0);

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
(1, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">入门</div>\r\n	<div class="info-right col-sm-10">如何打开图片</div>\r\n</div>\r\n<div class="row content-text">\r\n        photoshop是每个平面设计工作者都要掌握的一款软件，它功能强大，能胜任任何图片处理操作。通过下面几点来教大家怎么快速入门，步入平面设计领域。\r\n\r\n        <h3>打开一张图片，方法有三种</h3>①使用菜单里面的打开命令；②使用快捷键Ctrl+O；③双击photoshop界面中心；④拖动想要处理的图片到photoshop中打开；⑤右键选择要处理的图片选择使用photoshop打开命令。\r\n\r\n        <h3>保存图片的方法</h3>一般按下键盘上的快捷键Ctrl+S，或使用菜单保存命令（如果要另存的话就选择另存为选项；保存的图片可以选择任意格式，.psd是保存当前处理的所有步骤，下次打开还可以继续编辑，JPEG、png、gif格式就是处理好的图片格式）	\r\n	<img src="../static/img/pic/pic-10.png" />\r\n\r\n        <h3>历史记录面板的用法</h3>\r\n        ​我们处理图片的时候可能要反复修改获得最佳的效果，那么历史记录工具就可以很方便的返回之前我们的操作状态，如图，点击要恢复的步骤，即可恢复图片：\r\n\r\n       <h3>结语</h3>\r\n       photoshop入门相对来说比较简单，但熟练操作至少要3个月左右！\r\n精通photoshop是一条非常漫长的路程，有时候会打退堂鼓，但只要多操作，多制作，慢慢的时间久了也就精了。\r\n\r\n	<hr />\r\n	<a class="bottom" href="#">赞助Linkode</a>\r\n	<a class="bottom" href="#">回到顶部</a>\r\n</div>\r\n				\r\n				\r\n				\r\n				\r\n				', '第一章'),
(2, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">进阶</div>\r\n	<div class="info-right col-sm-10">教你如何用PS磨皮美白</div>\r\n</div>\r\n<div class="row content-text">\r\n		本篇教程教大家如何使用高低频修肤方法，高低频磨皮是一种什么常用的磨皮方法，而且难度不大，大家认真学习一下，记着要点即可使用。其实不管是产品修图还是人像修图都没有想象中那么难哦，只要大家掌握了要领，就可以把图修得美美哒!大家赶紧get这个技能吧。\r\n	<h3>如何美白</h3>\r\n	<img src="../static/img/pic/pic-5.png" />\r\n	第一步：首先，我们先把人物皮肤上明显的瑕疵修掉，比如痘痘，痘印等。这边可以用修补工具来修饰(污点修复画笔工具-修补工具)。<br/><br/>\r\n        第二步：连续复制两个图层，第一个复制的图层名字改“低频”;第二个复制的图层改成“高频”。先把高频眼睛关掉，在低频上我们要进行皮肤的磨皮工作，可以选择用磨皮插件，也可以选择用高斯模糊。<br/><br/>\r\n        这边我选择的是高斯模糊，模糊参数控制在模糊到没有瑕疵就可以了，这时候整个图像都是模糊的，所以我们要加上蒙版过渡，按住Alt键，鼠标蒙版标志就可以加上一个黑色的蒙版，再用白色画笔擦除人物脸上的模糊效果。<br/>\r\n	<hr />\r\n	<a class="bottom" href="#">赞助Linkode</a>\r\n	<a class="bottom" href="#">回到顶部</a>\r\n</div>\r\n				', '第二章'),
(6, '<a class="cute-btn" id="cute-1" href="../tutorial/1">入门</a>\r\n<a class="cute-btn" id="cute-2" href="../tutorial/2">进阶</a>\r\n<a class="cute-btn" id="cute-7" href="../tutorial/7">毕业</a>\r\n				', 'navigator'),
(7, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">毕业</div>\r\n	<div class="info-right col-sm-10">如何学好PS</div>\r\n</div>\r\n<div class="row content-text">\r\n	如果完全是从零开始，比如连钢笔工具、矩形选框、Web颜色、LAB颜色是什么什么都不知道的话， 建议从祁连山老师的开始，祁连山ps基础教程。<br/><br/>\r\n        祁连山老师的课优点是每个知识点只有十分钟左右，言简意赅，配合在线演示，针对每个ps工具细致到菜单的每项设置是什么意思，都有讲解，真正以零基础为起点，对于初学者来说非常实用。所以我认为从ps入门这一块来讲的话，祁连山的比李涛的好。另更新一个下载教程的方法，给希望保存资源的网友。<br/><br/>\r\n        <h3>百度云盘</h3>\r\n        百度云网盘是个很不错的网络资源库能找到很多有用的干货，不过网盘本身不提供搜索功能，需要用google（想办法翻墙吧……具体方法：在搜索栏使用这个搜索公式 site:http://pan.baidu.com 后面加你想搜索的内容比如，搜索 “site:http://pan.baidu.com 祁连山 ps”可以找到很多打包教程，推荐一个：祁连山Photoshop CS6视频教程.rar_免费高速下载建议搭配素材，一边看视频一边练习：祁连山photoshop cs6视频教程配套素材.zip_免费高速下载百度云网盘的一大缺点就是资源说删就删，说不定什么时候就没了，所以根本解决方法还是学会自己搜索～\r\n<br/><br/>\r\n作者：知乎用户<br/>\r\n链接：<a \r\n target="_blank" href="https://www.zhihu.com/question/19965756/answer/77891092">https://www.zhihu.com/question/19965756/answer/77891092</a><br/>\r\n来源：知乎<br/>\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。<br/>\r\n	\r\n	<hr />\r\n		<a class="bottom" href="#">赞助Linkode</a>\r\n		<a class="bottom" href="#">回到顶部</a>\r\n</div>\r\n				\r\n				\r\n				\r\n				\r\n				\r\n				', '第三章');

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
  `intro` varchar(200) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `ratingNumber`, `ratingTotal`, `sex`, `birthday`, `role`, `money`, `intro`, `url`) VALUES
(0, '系统消息', '234', '555', 666, NULL, '', NULL, '', 0, NULL, NULL),
(1, '管理员', '21232f297a57a5a743894a0e4a801fc3', 'admin@sjtu.edu.cn', 4, 15, 'male', '2017-06-15', 'admin', 1001212, 'hello~', 'avatar1.jpg'),
(2, '黑衣人', '098f6bcd4621d373cade4e832627b4f6', 'test@qq.com', 8, 20, 'male', '2017-07-04', 'admin', 666666, 'hello, i''m test', 'avatar2.jpg'),
(3, '岳飞', 'c32add6b67bd0c26c50f1716849bfae9', 'vital@q', 4, 12, 'male', '2017-08-02', 'guest', 2841331, 'I''m a programmer', 'avatar3.jpg'),
(4, '朱自清', '900150983cd24fb0d6963f7d28e17f72', 'abc@2', 2, 9, NULL, NULL, 'guest', NULL, NULL, 'avatar4.jpg'),
(5, '梵高', '900150983cd24fb0d6963f7d28e17f72', 'abc@1', NULL, NULL, 'secret', '2017-09-02', 'guest', NULL, '该插件捆绑了一套有用的验证方法，包括 URL 和电子邮件验证，同时提供了一个用来编写用户自定义方法的 API。该插件捆绑了一套有用的验证方法，包括 URL 和电子邮件验证，同时提供了一个用来编写用户自定义方法的 API。', 'avatar5.jpg'),
(6, 'aa', '4124bc0a9335c27f086f24ba207a4912', 'aa@1', 1, 2, 'male', NULL, 'guest', NULL, NULL, 'avatar6.jpg'),
(8, '一只公务员', 'test', 'test@132.com', 1, 5, 'male', NULL, 'admin', NULL, NULL, 'avatar8.jpg'),
(9, 'qq', '099b3b060154898840f0ebdfb46ec78f', 'qq@qq', NULL, NULL, NULL, NULL, 'guest', NULL, NULL, NULL),
(10, 'hello', '5d41402abc4b2a76b9719d911017c592', 'hello@1', NULL, NULL, NULL, NULL, 'guest', NULL, NULL, NULL),
(11, 'guest', '084e0343a0486ff05530df6c705c8bb4', 'guest@1', 0, 0, 'secret', NULL, 'guest', NULL, NULL, NULL),
(12, 'new', '22af645d1859cb5ca6da0c484f1f37ea', 'new@1', NULL, NULL, NULL, NULL, 'guest', NULL, NULL, NULL),
(13, 'a', '0cc175b9c0f1b6a831c399e269772661', 'a@1', NULL, NULL, NULL, NULL, 'guest', NULL, NULL, NULL),
(15, '123', '202cb962ac59075b964b07152d234b70', '123@1', 0, 0, NULL, NULL, 'guest', NULL, NULL, NULL);

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
-- Indexes for table `project_rating`
--
ALTER TABLE `project_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contractorId` (`contractorId`),
  ADD KEY `projectId` (`projectId`);

--
-- Indexes for table `relation`
--
ALTER TABLE `relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `senderId` (`senderId`),
  ADD KEY `receiverId` (`receiverId`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `chat_log`
--
ALTER TABLE `chat_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- 使用表AUTO_INCREMENT `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `portfolio_cmt`
--
ALTER TABLE `portfolio_cmt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- 使用表AUTO_INCREMENT `portfolio_like`
--
ALTER TABLE `portfolio_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `post_cmt`
--
ALTER TABLE `post_cmt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- 使用表AUTO_INCREMENT `project_app`
--
ALTER TABLE `project_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- 使用表AUTO_INCREMENT `project_commit`
--
ALTER TABLE `project_commit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `project_rating`
--
ALTER TABLE `project_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- 使用表AUTO_INCREMENT `relation`
--
ALTER TABLE `relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `tutorial`
--
ALTER TABLE `tutorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
