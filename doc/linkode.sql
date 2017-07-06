-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-07-06 08:58:54
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
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ad`
--

INSERT INTO `ad` (`id`, `title`, `content`, `startDate`, `endDate`) VALUES
(2, 'iPhone只要100', '原价9999现价100', '2017-06-14', '2017-06-27');

-- --------------------------------------------------------

--
-- 表的结构 `chat_log`
--

CREATE TABLE `chat_log` (
  `id` int(11) NOT NULL,
  `senderId` int(11) DEFAULT NULL,
  `receiverId` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `chat_log`
--

INSERT INTO `chat_log` (`id`, `senderId`, `receiverId`, `time`, `content`) VALUES
(1, 1, 2, '2017-06-07 00:00:00', 'jason是辣鸡');

-- --------------------------------------------------------

--
-- 表的结构 `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `director` varchar(50) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `movie`
--

INSERT INTO `movie` (`id`, `title`, `director`, `genre`, `language`) VALUES
(1, 'Disney', 'Jason', 'History', 'English'),
(3, '中文测试', 'test', 'test', 'test');

-- --------------------------------------------------------

--
-- 表的结构 `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `portfolio`
--

INSERT INTO `portfolio` (`id`, `userId`, `title`, `content`, `type`, `likes`) VALUES
(1, 2, '蒙娜丽莎', '我自己画的蒙娜丽莎', 'img', 1000);

-- --------------------------------------------------------

--
-- 表的结构 `portfolio_cmt`
--

CREATE TABLE `portfolio_cmt` (
  `id` int(11) NOT NULL,
  `portfolioId` int(11) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `portfolio_cmt`
--

INSERT INTO `portfolio_cmt` (`id`, `portfolioId`, `content`, `floor`) VALUES
(1, 1, '好漂亮啊', 1);

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`id`, `type`, `title`, `content`) VALUES
(1, 'img', '怎么打开电脑？', '我不知道怎么打开电脑');

-- --------------------------------------------------------

--
-- 表的结构 `post_cmt`
--

CREATE TABLE `post_cmt` (
  `id` int(11) NOT NULL,
  `postid` int(11) DEFAULT NULL,
  `content` mediumtext,
  `floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `post_cmt`
--

INSERT INTO `post_cmt` (`id`, `postid`, `content`, `floor`) VALUES
(1, 1, '点开机键就打开了', 1);

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
(35, 2, 1, 'Jason搞事情', '生命在于搞事情。', 'literature', '2017-07-05', '2017-08-04', 'finished', 10000),
(38, 1, 2, '啦啦啦', '嘿哟 马昭', 'music', '2017-07-05', '2017-07-11', 'finished', 6666),
(39, 2, 1, 'jasonSB', 'warweawewrarwr', 'music', '2017-07-05', '2017-07-27', 'finished', 6666),
(40, 1, NULL, 'test-1', '2017.1.31 给你 6666元', 'music', '2017-07-06', '2017-01-31', 'uncontracted', 6666);

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
(1, '<div>\r\n    hello!\r\n</div>', 'image');

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
  `money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `ratingNumber`, `ratingTotal`, `sex`, `birthday`, `role`, `money`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@sjtu.edu.cn', 1, 5, 'male', '2017-06-01', 'admin', 1000000),
(2, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@qq.com', NULL, NULL, NULL, NULL, 'admin', 666666),
(3, 'vital', 'c32add6b67bd0c26c50f1716849bfae9', 'vital@q', NULL, NULL, NULL, NULL, 'guest', NULL);

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
-- Indexes for table `movie`
--
ALTER TABLE `movie`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `chat_log`
--
ALTER TABLE `chat_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `portfolio_cmt`
--
ALTER TABLE `portfolio_cmt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `post_cmt`
--
ALTER TABLE `post_cmt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- 使用表AUTO_INCREMENT `project_app`
--
ALTER TABLE `project_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tutorial`
--
ALTER TABLE `tutorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
