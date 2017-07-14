-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-07-14 09:45:55
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
(2, 'iPhone只要100123', '原价9999现价100', '2017-07-28', '2017-07-26'),
(5, 'ipadw 我', 'jiofjiowef', '2017-07-03', '2017-07-30'),
(6, '2017-09-09', 'wfjieojiwfoajofwjofe', '2017-07-08', '2017-07-18');

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
(1, 1, 2, '2017-06-07 00:00:00', 'jason是辣鸡');

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
(1, 2, '梵高自画像', '帅的不得了', 'image', NULL, 1000, NULL),
(2, 3, '测试一下', '鸡窝阿尔法级哦我姐佛教啊我发', 'literature', NULL, 10, NULL),
(5, 1, 'test~', 'jwieofjieowafjiojwaifojewoafji\r\n', 'video', NULL, 0, NULL),
(6, 3, '满江红', '满江红岳飞怒发冲冠，凭阑处、潇潇雨歇。抬望眼、仰天长啸，壮怀激烈。三十功名尘与土，', 'literature', NULL, 0, NULL),
(7, 3, '蒙娜丽莎', '前声称找到了疑似修女丽莎・盖拉尔迪尼的遗骨。对《蒙娜丽莎》原型的身份\r\n						', 'image', NULL, 0, NULL),
(8, 3, 'test2222', 'wfeeawffwefewafafeawfe', 'video', NULL, 0, NULL),
(9, 1, '发布作品', '发布作品！！！', 'video', NULL, 0, NULL);

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
(12, 9, '评论一下', 1, '2017-07-14 07:45:18');

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
  `content` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`id`, `type`, `title`, `content`) VALUES
(1, 'img2', '怎么打开电脑？', '我不知道怎么打开电脑.'),
(3, 'music', 'hello', 'this is test');

-- --------------------------------------------------------

--
-- 表的结构 `post_cmt`
--

CREATE TABLE `post_cmt` (
  `id` int(11) NOT NULL,
  `postid` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `post_cmt`
--

INSERT INTO `post_cmt` (`id`, `postid`, `content`, `floor`) VALUES
(1, 1, '点开机键就打开了', 12);

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
  `money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `posterId`, `contractorId`, `title`, `requirement`, `type`, `startDate`, `endDate`, `status`, `money`) VALUES
(35, 2, 1, 'Jason搞事情', '生命在于搞事情。', 'literature', '2017-07-10', '2017-08-04', 'finished', 10000),
(38, 1, 2, '啦啦啦', '嘿哟 马昭', 'music', '2017-07-05', '2017-07-11', 'finished', 6666),
(40, 1, 3, 'test-1', '2017.1.31 给你 6666元', 'music', '2017-07-06', '2017-01-31', '', 666),
(41, 1, 2, '测试时间', '测试时间 视频 11111 17/07/18', 'video', '2017-07-07', '2017-07-16', '', 555),
(42, 5, NULL, 'database test', 'none', 'music', '2017-07-26', '2017-07-29', 'uncontracted', 111);

-- --------------------------------------------------------

--
-- 表的结构 `project_app`
--

CREATE TABLE `project_app` (
  `id` int(11) NOT NULL,
  `projectId` int(11) DEFAULT NULL,
  `applicantId` int(11) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project_app`
--

INSERT INTO `project_app` (`id`, `projectId`, `applicantId`, `content`, `time`) VALUES
(1, 1, 2, 'this is a test for project_app', '2017-07-26 00:00:00'),
(6, 12323, 123231, 'awefaefw', '2017-07-11 00:00:00'),
(7, 234, 123, 'wafawef', '2017-07-06 00:00:00'),
(8, 123, 234, 'awefeawf', '2017-07-06 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `project_commit`
--

CREATE TABLE `project_commit` (
  `id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `result` varchar(20) DEFAULT NULL
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
(1, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">出家1111</div>\r\n	<div class="info-right col-sm-10">出家才是最好的选择。</div>\r\n</div>\r\n<div class="row content-text">\r\n		威廉·莎士比亚（英语：William Shakespeare，1564年4月23日－1616年4月23日），华人社会常尊称为莎翁，清末民初鲁迅在《摩罗诗力说》（1908年2月）称莎翁为“狭斯丕尔”，是英国文学史上最杰出的戏剧家，也是欧洲文艺复兴时期最重要、最伟大的作家，全世界最卓越的文学家之一。莎士比亚在埃文河畔斯特拉特福出生长大，18岁时与安妮·海瑟薇结婚，两人共生育了三个孩子：苏珊娜、双胞胎哈姆尼特和朱迪思。16世纪末到17世纪初的20多年期间莎士比亚在伦敦开始了成功的职业生涯，他不仅是演员、剧作家，还是宫内大臣剧团的合\r\n	<h3>如何把刘和沇P到秃顶</h3>\r\n	<img src="../static/img/big-img.jpg" />\r\n	他不仅是演员、剧作家，还是宫内大臣剧团的合伙人之一，后来改名为国王剧团。1613年\r\n	左右，莎士比亚退休回到埃文河畔斯特拉特福，3年后逝世。1590年到1613年是莎。\r\n	<hr />\r\n	<a href="#">赞助Linkode</a>\r\n	<a href="#">回到顶部</a>\r\n</div>', '第一章'),
(2, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">信息框左内容</div>\r\n	<div class="info-right col-sm-10">信息框右内容</div>\r\n</div>\r\n<div class="row content-text">\r\n	正文信息\r\n	<h3>小标题</h3>\r\n	默认脚部链接\r\n	<hr />\r\n		<a href="#">赞助Linkode</a>\r\n		<a href="#">回到顶部</a>\r\n</div>\r\n				', '第二章'),
(3, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">回家</div>\r\n	<div class="info-right col-sm-10">只要30天：学会画出一个秃顶的JASON</div>\r\n</div>\r\n<div class="row content-text">\r\n		威廉·莎士比亚（英语：William Shakespeare，1564年4月23日－1616年4月23日），华人社会常尊称为莎翁，清末民初鲁迅在《摩罗诗力说》（1908年2月）称莎翁为“狭斯丕尔”，是英国文学史上最杰出的戏剧家，也是欧洲文艺复兴时期最重要、最伟大的作家，全世界最卓越的文学家之一。莎士比亚在埃文河畔斯特拉特福出生长大，18岁时与安妮·海瑟薇结婚，两人共生育了三个孩子：苏珊娜、双胞胎哈姆尼特和朱迪思。16世纪末到17世纪初的20多年期间莎士比亚在伦敦开始了成功的职业生涯，他不仅是演员、剧作家，还是宫内大臣剧团的合伙人之一，后来改名为国王剧团。1613年左右，莎士比亚退休回到埃文河畔斯特拉特福，3年后逝世。1590年到1613年是莎士比亚的创作的黄金时代。他的早期剧本主要是喜剧和历史剧，在16世纪末期达到了深度和艺术性的高峰。接下来到1608年他主要创作悲剧，莎士比亚崇尚高尚情操，常常描写牺牲与复仇，包括《奥赛罗》、《哈姆雷特》、《李尔王》和《麦克白》，被认为属于英语最佳范例。在他人生最后阶段，他开始创作悲喜剧，又称为传奇剧。莎士比亚流传下来的作品包括38部戏剧、154首十四行诗、两首长叙事诗。他的戏剧有各种主要语言的译本，且表演次数远远超过其他任何戏剧家的作品。\r\n	<hr />\r\n	<a href="#">赞助Linkode</a>\r\n	<a href="#">回到顶部</a>\r\n</div>', '第三章'),
(5, '<div class="content-info row">\r\n	<div class="info-left col-sm-2">入门</div>\r\n	<div class="info-right col-sm-10">只要30天：学会画出一个秃顶的JASON</div>\r\n</div>\r\n<div class="row content-text">\r\n		威廉·莎士比亚（英语：William Shakespeare，1564年4月23日－1616年4月23日），华人社会常尊称为莎翁，清末民初鲁迅在《摩罗诗力说》（1908年2月）称莎翁为“狭斯丕尔”，是英国文学史上最杰出的戏剧家，也是欧洲文艺复兴时期最重要、最伟大的作家，全世界最卓越的文学家之一。莎士比亚在埃文河畔斯特拉特福出生长大，18岁时与安妮·海瑟薇结婚，两人共生育了三个孩子：苏珊娜、双胞胎哈姆尼特和朱迪思。16世纪末到17世纪初的20多年期间莎士比亚在伦敦开始了成功的职业生涯，他不仅是演员、剧作家，还是宫内大臣剧团的合伙人之一，后来改名为国王剧团。1613年左右，莎士比亚退休回到埃文河畔斯特拉特福，3年后逝世。1590年到1613年是莎士比亚的创作的黄金时代。他的早期剧本主要是喜剧和历史剧，在16世纪末期达到了深度和艺术性的高峰。接下来到1608年他主要创作悲剧，莎士比亚崇尚高尚情操，常常描写牺牲与复仇，包括《奥赛罗》、《哈姆雷特》、《李尔王》和《麦克白》，被认为属于英语最佳范例。在他人生最后阶段，他开始创作悲喜剧，又称为传奇剧。莎士比亚流传下来的作品包括38部戏剧、154首十四行诗、两首长叙事诗。他的戏剧有各种主要语言的译本，且表演次数远远超过其他任何戏剧家的作品。\r\n	<h3>如何把刘和沇P到秃顶</h3>\r\n	<img src="../static/img/big-img.jpg" />\r\n	他不仅是演员、剧作家，还是宫内大臣剧团的合伙人之一，后来改名为国王剧团。1613年\r\n	左右，莎士比亚退休回到埃文河畔斯特拉特福，3年后逝世。1590年到1613年是莎士比亚的创作的黄金时代。他的早期剧本主要是喜剧和历史剧，在16世纪末期达到了深度和艺术性的高峰。接下来到1608年他主要创作悲剧，莎士比亚崇尚高尚情操，常常描写牺牲与复仇，包括《奥赛罗》、《哈姆雷特》、《李尔王》和《麦克白》，被认为属于英语最佳范例。在他人生最后阶段，他开始创作悲喜剧，又称为传奇剧。莎士比亚流传下来的作品包括38部戏剧、154首十四行诗、两首长叙事诗。他的戏剧有各种主要语言的译本，且表演次数远远超过其他任何戏剧家的作品。\r\n	<hr />\r\n	<a href="#">赞助Linkode</a>\r\n	<a href="#">回到顶部</a>\r\n</div>', '第四章');

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
  `money` int(11) DEFAULT NULL,
  `intro` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `ratingNumber`, `ratingTotal`, `sex`, `birthday`, `role`, `money`, `intro`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@sjtu.edu.cn', 1, 5, 'male', '2017-06-01', 'admin', 1000000, NULL),
(2, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@qq.com', 1, 5, 'female', '2017-07-04', 'admin', 666666, NULL),
(3, 'vital', 'c32add6b67bd0c26c50f1716849bfae9', 'vital@q', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(4, 'abc', '900150983cd24fb0d6963f7d28e17f72', 'abc@2', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(5, 'abc', '900150983cd24fb0d6963f7d28e17f72', 'abc@1', NULL, NULL, NULL, NULL, 'guest', NULL, NULL),
(6, 'aa', '4124bc0a9335c27f086f24ba207a4912', 'aa@1', 1, 2, 'male', NULL, 'guest', NULL, NULL),
(8, 'test', 'test', 'test@132.com', 1, 5, 'male', NULL, 'admin', NULL, NULL);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topicId` (`type`);

--
-- Indexes for table `post_cmt`
--
ALTER TABLE `post_cmt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postId` (`postid`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_commit`
--
ALTER TABLE `project_commit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ad`
--
ALTER TABLE `ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `chat_log`
--
ALTER TABLE `chat_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `portfolio_cmt`
--
ALTER TABLE `portfolio_cmt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- 使用表AUTO_INCREMENT `project_app`
--
ALTER TABLE `project_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `project_commit`
--
ALTER TABLE `project_commit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
