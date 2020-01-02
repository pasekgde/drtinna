-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2020 at 09:19 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firstmedic`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

CREATE TABLE `bank_account` (
  `ID` int(11) UNSIGNED NOT NULL,
  `bank` varchar(200) NOT NULL,
  `account_name` varchar(200) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `tipe_currency` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_account`
--

INSERT INTO `bank_account` (`ID`, `bank`, `account_name`, `account_no`, `logo`, `tipe_currency`) VALUES
(1, 'Bank Central Asia (BCA), Denpasar', 'Anak Agung Gede Mahendra', '6700324069', 'images/bank_logo/logo-bca.gif', 'USD'),
(2, 'Bank Central Asia (BCA), Denpasar', 'Anak Agung Gede Mahendra', '7725233124', 'images/bank_logo/logo-bca.gif', 'IDR');

-- --------------------------------------------------------

--
-- Table structure for table `contact_subcription`
--

CREATE TABLE `contact_subcription` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_subcription`
--

INSERT INTO `contact_subcription` (`id`, `email`, `type`, `date`, `enable`) VALUES
(13, 'dode.agung@gmail.com', 'Pariwisata', '2017-02-04', 1),
(14, 'dewi23@gmail.com', 'Pariwisata', '2017-02-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `content_categories`
--

CREATE TABLE `content_categories` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_categories`
--

INSERT INTO `content_categories` (`ID`, `name`, `image`, `description`) VALUES
(1, 'Default', 'default.png', '<p>The default category ss</p>\r\n'),
(2, 'Berita Umum', 'default.png', '<p>Segala berita yang berhubungan dengan pariwisata</p>\r\n'),
(3, 'wqwqw', 'edbdc3818766c1ef3f8377b6be0131e9.jpg', '<p>wqwqwq</p>\r\n'),
(4, 'sdsd', '0b04118db841988c8705f01903717bb0.jpg', '<p>dsdsd</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `content_galleries`
--

CREATE TABLE `content_galleries` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` varchar(150) NOT NULL,
  `userid` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `ext_image` varchar(500) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `albumid` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `last_updated_userid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `image_front` tinyint(1) NOT NULL DEFAULT '0',
  `seo_title` varchar(500) NOT NULL,
  `seo_description` varchar(200) NOT NULL,
  `loggedin` int(11) NOT NULL,
  `displayimage` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_galleries`
--

INSERT INTO `content_galleries` (`ID`, `title`, `summary`, `userid`, `timestamp`, `comments`, `image`, `ext_image`, `categoryid`, `albumid`, `last_updated`, `last_updated_userid`, `type`, `image_front`, `seo_title`, `seo_description`, `loggedin`, `displayimage`) VALUES
(1, 'dsd', 'dsd', 1, 1517993406, 1, 'default', 'png', 1, 1, 1517993406, 1, 0, 1, 'dsd', 'dsd', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content_gallery_albums`
--

CREATE TABLE `content_gallery_albums` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_gallery_albums`
--

INSERT INTO `content_gallery_albums` (`ID`, `name`, `image`, `description`) VALUES
(1, 'Defaults', 'default.png', '<p>Defaults</p>\n');

-- --------------------------------------------------------

--
-- Table structure for table `content_gallery_categories`
--

CREATE TABLE `content_gallery_categories` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_gallery_categories`
--

INSERT INTO `content_gallery_categories` (`ID`, `name`, `image`, `description`) VALUES
(1, 'Defauts', 'default.png', '<p>Defaults</p>\n'),
(2, 'Signal Forex', 'default.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `content_gallery_comments`
--

CREATE TABLE `content_gallery_comments` (
  `ID` int(11) NOT NULL,
  `galleryid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_pages`
--

CREATE TABLE `content_pages` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `userid` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `last_updated_userid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `seo_title` varchar(500) NOT NULL,
  `seo_description` varchar(200) NOT NULL,
  `loggedin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_pages`
--

INSERT INTO `content_pages` (`ID`, `title`, `summary`, `content`, `userid`, `timestamp`, `comments`, `image`, `categoryid`, `last_updated`, `last_updated_userid`, `type`, `seo_title`, `seo_description`, `loggedin`) VALUES
(3, 'sacxcxsasasa', 'cxcxcxc', '<p>cxcxcxcsasasa</p>\r\n', 1, 1478179294, 1, 'page_default.png', 3, 1478179294, 1, 0, '', '', 1),
(4, 'test', 'dsdsd', '<p>dsds</p>\r\n', 1, 1485775268, 1, 'page_default.png', 1, 1485775268, 1, 0, 'sasasa', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `content_page_comments`
--

CREATE TABLE `content_page_comments` (
  `ID` int(11) NOT NULL,
  `pageid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_page_comments`
--

INSERT INTO `content_page_comments` (`ID`, `pageid`, `userid`, `comment`, `timestamp`) VALUES
(2, 4, 1, '<p>apa neh??</p>\r\n', 1485612383);

-- --------------------------------------------------------

--
-- Table structure for table `content_page_groups`
--

CREATE TABLE `content_page_groups` (
  `ID` int(11) NOT NULL,
  `pageid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_page_groups`
--

INSERT INTO `content_page_groups` (`ID`, `pageid`, `groupid`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content_page_plans`
--

CREATE TABLE `content_page_plans` (
  `ID` int(11) NOT NULL,
  `pageid` int(11) NOT NULL,
  `planid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_page_plans`
--

INSERT INTO `content_page_plans` (`ID`, `pageid`, `planid`) VALUES
(1, 1, 3),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `content_page_roles`
--

CREATE TABLE `content_page_roles` (
  `ID` int(11) NOT NULL,
  `pageid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_page_roles`
--

INSERT INTO `content_page_roles` (`ID`, `pageid`, `roleid`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 2, 7),
(4, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `content_posts`
--

CREATE TABLE `content_posts` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `userid` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `ext_image` varchar(500) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `last_updated_userid` int(11) NOT NULL,
  `seo_title` varchar(500) NOT NULL,
  `seo_description` varchar(200) NOT NULL,
  `loggedin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_posts`
--

INSERT INTO `content_posts` (`ID`, `title`, `summary`, `content`, `userid`, `timestamp`, `comments`, `image`, `ext_image`, `categoryid`, `last_updated`, `last_updated_userid`, `seo_title`, `seo_description`, `loggedin`) VALUES
(10, 'How to Follow our Forex Signals Successfully to get consistent profits ?', 'Read our Signal Instructions Completely before following our Signals !', '<h1>How to Follow our Forex Signals Successfully to get Good profits ?</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>We help&nbsp;all BOSSFX&nbsp;members to achieve Straight Forward Success in Forex trading.</strong></p>\r\n\r\n<p><strong>Read the below Signal Guide completely before following our signals :&nbsp;</strong></p>\r\n\r\n<p><strong>What volume lot size, you should use on your trading account?</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Let&amp;rsquo;s say, If you have 1000 USD trading balance, you can use Maximum 0.10 lot (0.02+0.03+0.05 = 0.10 lot is the addition of all your open trade lot sizes).</p>\r\n\r\n<p>0.10 lot should be your maximum open&nbsp;lot on your 1000$ trading account.</p>\r\n\r\n<p>10,000 USD balance = 1 lot maximum (Example : 0.25 lot x 4 orders = 1 lot)</p>\r\n\r\n<p>50,000 USD balance = 5 lot maximum (Example : 1 lot x 5 orders = 5 lot)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Take Risk lesser than 2% on each trade</strong>. Don&amp;rsquo;t risk more.</p>\r\n\r\n<p><strong>Please Note : If you Place a High lot on your trading account, you will become a Gambler not a trader. You will get addicted to the market by tasting the big profits with high lot. Once you got addicted for placing high lots on your trading account, it will destroy your trading life and you may get bankrupt soon. Most of the people loss their money in markets by placing High lots in Small account. If you keep placing higher lot in small accounts, you will never get rich, Only the brokers will get rich by earning commissions from your higher lot trades. Please never place high lots, Don&amp;rsquo;t compare yourself with anyone on this business. Improve your Trading skills with BOSSFX&nbsp;and try to trade only at good opportunities in the market.&nbsp;</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Important notes on following our Signals and Trading with Care :</strong></p>\r\n\r\n<p><strong>After receiving the signal</strong></p>\r\n\r\n<p>1) If market is near to our entry price around 10 to 20 pips(100 to 200 points) distance, then you still can place the trade. This situation happens when the signal seen late by you (or) the market made faster movements.</p>\r\n\r\n<p>2) Never place the trade in the middle of the signal.&nbsp; Example : After market reaching Target 1, then please don&amp;rsquo;t place any new trades by following the signal. The reason is &amp;ldquo;your risk would be higher if you enter into the middle of the signal. Solution : if you miss to enter into the signal, no worries, you can wait for next signal to make good profits. Market will always be there for us with new good opportunities.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>NOTE&nbsp;</strong>(<strong>Market is not going to die tomorrow, market stay&nbsp;alive all the time, but if you want to stay alive in the market, you should have a money. So, please trade with care to taste the permanent success in forex trading</strong>).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Holding the Trade</strong></p>\r\n\r\n<p>1) If you are holding the trade for 2 days (Australian Time GMT+10) , please check &amp;ldquo;whether the market has already reached our Target 1 (or) not ?</p>\r\n\r\n<p>If Target 1 is not reached within 2 days as per the Australian time GMT +10,&nbsp;then close&nbsp;<a href="https://www.youtube.com/watch?v=-k8GX2XU_w8" target="_blank">partial lot (click to see)</a>&nbsp;and move your Stop Loss price to entry price for safe trading (<a href="https://www.youtube.com/watch?v=mpYMOfY2-v4" target="_blank">click to see</a><a href="https://www.youtube.com/watch?v=Xg6uUZGddJk">)</a>. As a short term trader, if the market don&amp;rsquo;t reach the Target 1 within 2 days, then please don&amp;rsquo;t hold the trade for long time. Use trailing stop (or) close the trade at our Entry price levels. This situation comes, when the market has a lack of liquidity (or) if market keeps moving up and down. Note : The holding period 2 days is calculated depend on&nbsp;Australian Days Time GMT+10 and not depend on the number of 48 hours.&nbsp;For example : If the signal is given at 3 p.m (australian time GMT+10), the 2 days expiration will be calculated depend on the signal day + next day until 11.59 p.m Please make calculations depend on GMT+10 timing. For Calculating the Australian time with your local time.</p>\r\n\r\n<p>2) We recommend you to keep running the profit trades for a long time and don&amp;rsquo;t keep running the losses for a long time. In simple words, Cut the losses faster and run the profit trades for a long time by using the trailing stop for safe and profitable trading.</p>\r\n\r\n<p>&nbsp;<strong>NOTE: Closing profits faster is equal to Making more losses.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Exiting the Trade</strong><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>Exiting the trade is all depends on which type of trader you are ? Each trader have different mindset, So, you can choose to exit your trade at anytime with your own choice. We have given some exiting trade ideas depend on different.</strong></p>\r\n\r\n<p>1) &nbsp;If you cant hold the profit for a long time, you can exit the trade at Target 1.</p>\r\n\r\n<p>2) If you cant control your emotions, but you try to hold the profit for long time, you can close Half of your trade lot size&nbsp;at Target 1 and then move your Stop Loss price to Entry price for Safe trading.</p>\r\n\r\n<p>3) If you can hold the profits for a long time without emotions, then you can hold the trade until final Target.</p>\r\n\r\n<p>4) If you trade with more emotions, then please use trailing stop for safe trading and try to learn forex market in correct way to avoid getting more emotions.</p>\r\n\r\n<p>5) Sometimes, Our Market analyst team will inform you to close the trade manually, all type of trader need to follow&nbsp;the analyst advice at that time.</p>\r\n\r\n<p>Handling Emotions while holding the Open trades</p>\r\n\r\n<p>1) While you holding your trade positions, market will always keep moving up and down. During this time, most of the beginners in forex market show their emotions (happy, sad, angry,&amp;hellip;) depend on market movements. Please learn how to manage your emotions while trading.</p>\r\n\r\n<p>2)&nbsp;Trading Physchology : All Human Beings are Emotional Creatures in the world. we all have emotions (happy, sad, angry, envy, etc.&amp;hellip;) We need to manage our Emotions while trading.</p>\r\n\r\n<p>3)&nbsp;As we all know that, Money is the most important thing in Human&amp;rsquo;s life. The Most important things in the world is always combined with emotions. Traders are all here in Forex market to make and see more money in their life. That&amp;rsquo;s the reason, Trader&amp;rsquo;s are more emotional while trading.&nbsp;</p>\r\n\r\n<p>4)&nbsp;If you want to avoid some emotions while trading, just move your Stop Loss price to entry price if market goes positive on your trade. If market goes on negative, you should not worry about reaching Stop Loss price. Because, you must understand that : Stop Loss is used for Limiting the Losses, not to loss all your money in single trade, So, please don&amp;rsquo;t take more risk on a single trade by placing high lot. Take only the small risk on each trade.</p>\r\n\r\n<p>5) Invest only the affordable money in the forex market to trade with less emotions. We can&amp;rsquo;t avoid the emotions 100% completely. We are not a &amp;ldquo;Monk&amp;rdquo; to live without emotions. We are just a normal Human Beings filled with emotions(Happy, sad, angry, worries, envy, etc &amp;hellip;) You need to change your mind from Normal human being to Trader mind by learning the forex trading in correct way.</p>\r\n\r\n<p>6) Trading with fixed commitments mostly leads to failure in trading. The reason is &amp;ldquo;Forex Market is not going to make a fixed movements all the time&amp;rdquo;. Example : if you are trading with EUR/USD, someday you can make +50 pips profit, someday you will make +80 pips profit and some other day you will make +30 pips profit, but, you can&amp;rsquo;t make fixed +80 pips profit all the day. It&amp;rsquo;s a very important fact, most of the beginners don&amp;rsquo;t understand until they loss all their money. Solution : Please trade forex market without expectations and trade only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><strong>Solutions for con</strong>trolling your Emotions :</strong><strong>&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li>Learn forex trading in a correct way.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Get clear mind about your trading strategy.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Invest only the affordable money.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Don&amp;rsquo;t trade with fixed commitments (Eg. Want to make 30% profit every month)</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Trade without Expectations.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Don&amp;rsquo;t trade forex market all the time.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Trade forex only at good opportunities found in the market.</li>\r\n</ul>\r\n\r\n<p><strong>Different Methods to Place trades with our Signals</strong></p>\r\n\r\n<p><strong>Method 1:&nbsp;Placing Multiple orders to manage your trades.</strong></p>\r\n\r\n<p>If&nbsp;you receive the signal with 2 Take profit Targets, then you can place 2 orders at the entry price.</p>\r\n\r\n<p>Set the same stop loss for 2 orders.</p>\r\n\r\n<p>Set 1st&nbsp;Take profit for One order and 2nd&nbsp;Take profit for Another order. Thats it.</p>\r\n\r\n<p>Lets see an Example :<img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/b0247432dbcac6899210a41d328aeeb8.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Forex Signal : SELL&nbsp;NZDUSD between&nbsp;at 0.7641 - 0.70469</p>\r\n\r\n<p>Target 1 : 0.69791</p>\r\n\r\n<p>Target 2 : 0.69100</p>\r\n\r\n<p>Target 3 : 0.68300</p>\r\n\r\n<p>Stop Loss : 0.71250</p>\r\n\r\n<p>Consider that, you have received the above &nbsp;NZDUSD&nbsp;signal from us.</p>\r\n\r\n<p>What you need to do now ?</p>\r\n\r\n<p><strong>1)</strong>Place 3&nbsp;buy orders at the entry price :&nbsp;0.7641 - 0.70469</p>\r\n\r\n<p><strong>2)</strong>&nbsp;If you plan to place 1 lot, you can place 0.50 lot + 0.50 lot + 0.50 lot&nbsp;(3&nbsp;orders)</p>\r\n\r\n<p><strong>3)</strong>&nbsp;Set 1st Take Profit target for one order and Set 2nd &nbsp;and 3nd Take Profit Target for another order.</p>\r\n\r\n<p><strong>4)</strong>&nbsp;But the stop loss remains the same for both of your orders.</p>\r\n\r\n<p><strong>5)</strong>&nbsp;If the market moves up to Target 1, One of your order will get closed at&nbsp;1st take profit.&nbsp;</p>\r\n\r\n<p><strong>Note : The reason for closing 1st order at Target 1 &nbsp;is To get Satisfaction about the Profits you made with Target 1&nbsp;and even if market reverse, you dont need to worry. because, you already earned&nbsp;some profit with Target 1.</strong></p>\r\n\r\n<p><strong>6)</strong>&nbsp;Next, you can change your stop loss of&nbsp;the&nbsp;2nd order&nbsp;to your entry price(0.69791)</p>\r\n\r\n<p><strong>Now, you dont have any risk</strong>. You just going to simply wait for the market to reach the 2nd Target (or) going to close your order at entry price.</p>\r\n\r\n<p><strong>Method 2:&nbsp;Placing Single Order</strong></p>\r\n\r\n<p>If you receive signal with 2 Take profit Targets,&nbsp;and If you placed a single order at entry price.</p>\r\n\r\n<p>Then its possible to place One Stop Loss and One Take Profit&nbsp;for your single order.</p>\r\n\r\n<p>,&nbsp;You may get confused, which target you can set your Take Profit for your Single order? Is it Target 1 or Target 2?</p>\r\n\r\n<p>Lets see an Example :</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/2d2e6a8f74ac024ba8b8a1717d5255f2.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Forex Signal : AUDJPY&nbsp;at 88.800</p>\r\n\r\n<p>Target 1 : 88.000</p>\r\n\r\n<p>Target 2 : 87.300</p>\r\n\r\n<p>Stop Loss : 89.400</p>\r\n\r\n<p>Consider that, you have received the above GBP/JPY signal from us.</p>\r\n\r\n<p>What you need to do now ?</p>\r\n\r\n<p><strong>1)</strong>&nbsp;You place a Single Buy order at the entry price : 88.800</p>\r\n\r\n<p><strong>2)</strong>&nbsp;Assume that you have placed 1 Lot Buy order at entry price.</p>\r\n\r\n<p><strong>3)</strong>&nbsp;You have set your Stop loss for your Single Buy order</p>\r\n\r\n<p><strong>4)</strong>&nbsp;Now, you dont know where to set the Take profit for your Single Buy order, You want to Set your Take profit at Target 1 or Target 2 ?</p>\r\n\r\n<p><strong>5)</strong>&nbsp;If you are a Short term trader, you can set your Take profit at Target 1.</p>\r\n\r\n<p><strong>6)</strong>&nbsp;If you are a Long term trader, you can set your Take profit at Target 2.</p>\r\n\r\n<p><strong>7)</strong>&nbsp;If you are a short term trader, at the same time, If you want more profits in Single Trade without Risk. You can do one of the following Technique&amp;hellip;.</p>\r\n\r\n<p><strong>First Technique</strong>&nbsp;is, Once market reaches Target 1, you can close Half&nbsp;lot size of your trade order. To know, how to close Half&nbsp;lot size for your single order,&nbsp;(Eg.If you placed 1 lot, you can close 0.50 lot after market reaching target 1).</p>\r\n\r\n<p><strong>Second technique</strong>&nbsp;is, You can move your Stop loss to your entry price and dont care about your trade. Because, once you set your stop loss to your entry price, you dont have risk and theres no loss, but you&nbsp;can make&nbsp;Big profits after market reaching Target 2. (it is completely a No Risk&nbsp;Trading Technique),To know how to move stop loss to entry price,</p>\r\n\r\n<p><strong>NOTE :</strong>&nbsp;If you see the signal late&nbsp;and&nbsp;if market went in profit&nbsp;from entry price, then you should follow the below methods :</p>\r\n\r\n<p>1) If Current Market Price is near to our entry price in 10 to 20 pips distance, then you can place a trade.</p>\r\n\r\n<p>2) If Market reaches Target 1, then you should not place any trade.</p>\r\n\r\n<p>We recommend you to keep running the profit trades for a long time and dont keep running the losses for a long time. In simple words, Cut the losses fast and run the profits for long time&nbsp;to become a Successful Trader.</p>\r\n\r\n<p><strong>Money Management</strong><strong>&nbsp;</strong>&nbsp;<strong>(What Volume lot size you should&nbsp;use on your trading account ?)</strong></p>\r\n\r\n<p><img alt="" src="https://forexgdp.com/wp-content/uploads/2016/04/moneymangement.jpg" style="height:479px; width:757px" /></p>\r\n\r\n<p><strong>What is Money Management ? How much is the Volume Lot Size, Do I need to use on my trading account ?</strong></p>\r\n\r\n<p>According to our Money Management Rule, We recommend our Traders to use Correct Volume lot size depend on their trading account balance for making consistent profits.</p>\r\n\r\n<p><strong>What is Money Management ? How much is the Volume Lot Size, Do I need to use on my trading account ?</strong></p>\r\n\r\n<p>According to our Money Management Rule, We recommend our Traders to use Correct Volume lot size depend on their trading account balance for making consistent profits.</p>\r\n\r\n<p>For example : If you have 1000$ USD balance, you can use Maximum 0.10 lot (0.02+0.03+0.05 = 0.10 lot) it should be your maximum running lot on your 1000$ trading account.</p>\r\n\r\n<p>10,000$ USD balance = 1 lot maximum</p>\r\n\r\n<p>20,000$ USD balance = 2 lot maximum</p>\r\n\r\n<p>25,000$ USD balance = 2.5 lot maximum</p>\r\n\r\n<p>If you are more emotional(tension, sad, greedy) while trading, You can change your leverage below 1:50 to control your emotions.</p>\r\n\r\n<p>Hope you understand now about the simple money management rule.</p>\r\n\r\n<p>This is the Good Habit and discipline need to be followed by the traders. If you have bad habits and bad discipline about the Money management, please change your habits immediately. Using high lots for small balance is risky one and it&amp;rsquo;s a very bad habit for most of the beginners in forex. Most of the traders don&amp;rsquo;t grow up to next level due to these&nbsp;bad habits. Once you leave the bad money management habits, you will start to&nbsp;see a positive results and growth&nbsp;on your trading account soon.</p>\r\n\r\n<p>Note : I<strong>f you break the money management rules and places a High lot on your trading account, you will become a Gambler not a trader</strong>. You will get addicted to the market by tasting the big profits with high lot. Once you got addicted for placing high lots on your trading account, it will destroy your trading life and you may get bankrupt soon. Most of the people loss their money in markets by placing High lots in Small account.</p>\r\n\r\n<p>If you are more emotional(tension, sad, greedy) while trading, You can change your leverage below 1:50 to control your emotions.</p>\r\n\r\n<p>Hope you understand now about the simple money management rule.</p>\r\n\r\n<p>This is the Good Habit and discipline need to be followed by the traders. If you have bad habits and bad discipline about the Money management, please change your habits immediately. Using high lots for small balance is risky one and it&amp;rsquo;s a very bad habit for most of the beginners in forex. Most of the traders don&amp;rsquo;t grow up to next level due to these bad habits. Once you leave the bad money management habits, you will start to&nbsp;see a positive results and growth&nbsp;on your trading account soon.</p>\r\n\r\n<p>Note : I<strong>f you break the money management rules and places a High lot on your trading account, you will become a Gambler not a trader</strong>. You will get addicted to the market by tasting the big profits with high lot. Once you got addicted for placing high lots on your trading account, it will destroy your trading life and you may get bankrupt soon. Most of the people loss their money in markets by placing High lots in Small account.</p>\r\n\r\n<p><strong>A real story of the trader who don&amp;rsquo;t follow money management in trading</strong>&nbsp;:</p>\r\n\r\n<p>One of the Forex trader whose name is John&nbsp;from Canada made his 500$ account to 7000$ in 3 months by his own trading method. It was his first live trading account, he turned his 500$ to &nbsp;7000$ in just 3 months. John really dont know, how he made such a great profit in short time. He wonder&nbsp;and starts to think if I can turn my 500$ to 7000$ in 3 months, then If I invest 5000$, i could possibly make 70,000$ in 3 months. thats really Wonderful. Lets start it</p>\r\n\r\n<p><strong>Do you think John has turned his 5000$ to 70,000$ ?</strong></p>\r\n\r\n<p>Answer : No</p>\r\n\r\n<p>So, What Happened to John ? how much he really made ?</p>\r\n\r\n<p>After John investing 5000$ in his trading account, he starts to do trade in a same way as he do trade on his 500$ account. He loss his 5000$ trading account&nbsp;in Just 3 days. The main reason is John placed 1 standard lot on his 500$ account which turns to 7000$, Similarly, In 5000$ account, John placed 10 Lot, but his account turns to ZERO balance.</p>\r\n\r\n<p><strong>After John losing his 5000$ account, do you think John stopped his trading ?</strong></p>\r\n\r\n<p>Answer : No</p>\r\n\r\n<p>The reason is &nbsp;<strong>John has tasted big profits by placing high lots on his trading account, He keeps placing high lots&nbsp;on his trading account without knowing Correct Money Management.</strong></p>\r\n\r\n<p><strong>Did John got Success in Trading ?</strong></p>\r\n\r\n<p>Answer : No,&nbsp;<strong>John&nbsp;made Suicide and he was dead on April 2011 with -585,000$ Debt.&nbsp;</strong>He sold his home, lost his&nbsp;wife, children, friends and Family. because, he stay hidden by not paying back the&nbsp;money that he borrowed from his family members, friends and Banks.</p>\r\n\r\n<p><strong>What are the main reason for John&amp;rsquo;s Death ?</strong></p>\r\n\r\n<p>1. John didnt follow management, Placed high lots on his trading account.</p>\r\n\r\n<p>2. He got addicted to the trading by making big profits at his starting stage. (Eg. he turned his first live trading account from 500$ to 7000$ in 3 months).</p>\r\n\r\n<p>3. After he turned his trading account from 500$ to 7000$, he opened a new account with 5000$ for turning his balance to 70,000$. But, he loss his 5000$ in just 3 days.</p>\r\n\r\n<p>4. After he losing his 2nd trading account 5000$, he still dont care about his 5000$ loss. He care and think only about his profits that he made&nbsp;for turning 500$ to 7000$.</p>\r\n\r\n<p>5. Next, he keeps investing more money again and again to make the profits same like his first trading account. But, he couldnt make big profits with high lots same like his first trading account. He always keep losing his trading accounts continuously.</p>\r\n\r\n<p>6. Within 8 months of trading, he loss nearly 67,000$. He starts to think, if he have another 100,000$ account, he can recover all his previous losses. So, he borrowed money from bank first. Soon, he losses that 100,000$ too. next, he borrowed money from his friends, family and finally losses all the money in the market without learning the market in correct way.</p>\r\n\r\n<p>7. John finishes his life without learning the forex market in correct way. He done a very expensive mistakes in trading (He spent -585,000$ + his life for trading).</p>\r\n\r\n<p>If you are losing money in the market without knowledge, it means you are making some Expensive mistakes in trading. please try to learn the market first in a correct way, then you can start to see a consistent profits on your trading account.</p>\r\n\r\n<p><strong>As a Forex Trader, How to avoid financial accidents in your life ?&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li>First Learn how to trade the market ? then start to do a trade. (Example: A doctor without doctorate degree cant treat the patient in a correct way, the patient might die if doctor gives wrong medicine or inject wrong syringe. Similarly, if you want to become a Successful trader, First you should have to learn the&nbsp;market, keep practicing on demo account and then start to do the trading on real money. You can join in any of our trading courses to learn the forex market step by step in a correct way :contact whatsupp (+6281353001068)</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>&nbsp;Invest only the affordable money and Dont trade with fixed commitments (Example: Want to make 20% profit every month)</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Get clear idea about your trading strategy.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Don&amp;rsquo;t trade forex all the time. Trade forex only at good opportunities available&nbsp;in the market.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>A trader who knows the World&amp;rsquo;s best trading strategy and skills will always loss money if he forget to follow money management.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Money management is very important part than trading knowledge. you should have to place correct volume lot size depend on your trading account balance.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>You Should not mix your Emotions with your trading knowledge.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>If you keep learning the trading from bossfx&nbsp;team&nbsp;for a long time, your trading knowledge will overtake your emotions and you will become a Successful trader soon.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If you are interested to learn forex trading in correct way,&nbsp;Please click here to contact now :<a href="https://bossforexsignal.com/contact">&nbsp;https://bossforexsignal.com/contact</a></p>\r\n\r\n<p>If you are interested in forex signal service, you can join here :&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>If you need any support, Please click here to contact now : &nbsp;<a href="https://bossforexsignal.com/contact">&nbsp;https://bossforexsignal.com/contact</a>&nbsp;</p>\r\n\r\n<p>We are ready to help you always !</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal&nbsp;Team.</p>\r\n', 1, 1509642000, 1, '/post/414d7f8e9ed3e2b298c377100818ff5c', 'jpg', 1, 1509941513, 1, 'follow', 'How to Follow our Forex Signals Successfully to get consistent profits ?', 0),
(25, '+3333 Points made in EUR/JPY After breakout from the range', '', '<p><a href="https://2.bp.blogspot.com/-qk349Zh1S3w/WVZ3eq6J22I/AAAAAAAAAUg/cVnQIbIWjXgtpxygyr7_VPpO60_QpX2vQCLcBGAs/s1600/Forextradingking.blogspot.com++77.png"><img src="https://2.bp.blogspot.com/-qk349Zh1S3w/WVZ3eq6J22I/AAAAAAAAAUg/cVnQIbIWjXgtpxygyr7_VPpO60_QpX2vQCLcBGAs/s320/Forextradingking.blogspot.com++77.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<strong>EUR/JPY Analysis :&nbsp;</strong><br />\r\nAfter EUR/JPY breakout from the range in daily chart, market Re-tested the breakout level and went up more as per our Breakout strategy.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-w0DzZDMPzys/WVZ3rMTviRI/AAAAAAAAAUk/VnyxfbDiq1UFmVrPFQDm8jE8sPnV196bQCLcBGAs/s1600/Forextradingking.blogspot.com++78.png"><img src="https://1.bp.blogspot.com/-w0DzZDMPzys/WVZ3rMTviRI/AAAAAAAAAUk/VnyxfbDiq1UFmVrPFQDm8jE8sPnV196bQCLcBGAs/s320/Forextradingking.blogspot.com++78.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nMarket was&nbsp;standing at the top level 124.00 and making a ranging movement on H4 chart.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-LuVp1JFK-Zc/WVZ34sgLY8I/AAAAAAAAAUo/S5YIkJ8K-fE-VUs2kV-fbZCO-Uf8POGJwCLcBGAs/s1600/Forextradingking.blogspot.com++79.png"><img src="https://1.bp.blogspot.com/-LuVp1JFK-Zc/WVZ34sgLY8I/AAAAAAAAAUo/S5YIkJ8K-fE-VUs2kV-fbZCO-Uf8POGJwCLcBGAs/s320/Forextradingking.blogspot.com++79.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nWe told our members to wait for the confirmation of breakout from the range to make good profits on EUR/JPY.<br />\r\nAs per our technical analysis, Market Breakout the top level very soon and went up more.<br />\r\n<strong>Education Notes&nbsp;:</strong><br />\r\n<strong>Why Re-testing the Breakout Level is more important ?</strong><br />\r\nIf market Re-test the previous Breakout level and starts to bounce back, then we can expect big and sharp movements from that Breakout level.<br />\r\nSave your time on analyzing the forex market. Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nPlease Don&amp;rsquo;t Trade forex market all the time, trade forex only at good opportunities available in the market.<br />\r\nGet more Good Opportunity Forex&nbsp;Signals from Forex Experts Team at premium signal plan <a href="http://bossforexsignal.com/join">http://bossforexsignal.com/join</a></p>\r\n', 1, 1499187600, 1, '/post/1c428f774a498f0d55800fc653863cc6', 'jpg', 4, 1499700124, 1, '+3333 Points made in EUR/JPY After breakout from the range', '+3333 Points made in EUR/JPY After breakout from the range', 0),
(26, '+1612 Points Profit Reached Successfully in AUD/JPY Buy Signal', '+1612 Points Profit Reached Successfully in AUD/JPY Buy Signal', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-oHtjQdGWCS4/WVYN2lPC-DI/AAAAAAAAAT4/Snl8Fo7aStsg1gFaQ-ukEEth50OA4lsvwCLcBGAs/s1600/Forextradingking.blogspot.com++73.png"><img src="https://4.bp.blogspot.com/-oHtjQdGWCS4/WVYN2lPC-DI/AAAAAAAAAT4/Snl8Fo7aStsg1gFaQ-ukEEth50OA4lsvwCLcBGAs/s320/Forextradingking.blogspot.com++73.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<strong>Reason for Buying AUD/JPY:</strong><br />\r\nAs per our Previous analysis on AUD/JPY, Market reaches the bottom level and starts to bounce up from 82.00</p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-6Et-gQ0dKLE/WVYN_P_-eII/AAAAAAAAAT8/Ckfrtbhzv_YjPQbR1UbZ9FIlGqcEzpfkgCLcBGAs/s1600/Forextradingking.blogspot.com++74.png"><img src="https://4.bp.blogspot.com/-6Et-gQ0dKLE/WVYN_P_-eII/AAAAAAAAAT8/Ckfrtbhzv_YjPQbR1UbZ9FIlGqcEzpfkgCLcBGAs/s320/Forextradingking.blogspot.com++74.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\nWe recommend our traders to wait for the confirmation&nbsp;of Reversal or Breakout to make good profits on AUD/JPY.<br />\r\nThose who&nbsp;picked up the reversal trade on AUD/JPY would be in great profits now.<br />\r\nNow, we have given this Buy signal depend on H4 chart.</p>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-2dKkXrOHVP4/WVYOKpyWMSI/AAAAAAAAAUA/TCRrQF1e9WwljE1BXNyt_ECISKm5D9NYwCLcBGAs/s1600/Forextradingking.blogspot.com++75.png"><img src="https://3.bp.blogspot.com/-2dKkXrOHVP4/WVYOKpyWMSI/AAAAAAAAAUA/TCRrQF1e9WwljE1BXNyt_ECISKm5D9NYwCLcBGAs/s320/Forextradingking.blogspot.com++75.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\nThe market is moving up like walking in a steps. it shows that, market&nbsp;is getting more buyers that helps the AUD/JPY to keep moving up.</p>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-4aG4bKQBXbs/WVYORxQ12TI/AAAAAAAAAUE/IYkfE-jlXHwDGrWY7oiY9sEB12ANxpXvQCLcBGAs/s1600/Forextradingking.blogspot.com++76.png"><img src="https://3.bp.blogspot.com/-4aG4bKQBXbs/WVYORxQ12TI/AAAAAAAAAUE/IYkfE-jlXHwDGrWY7oiY9sEB12ANxpXvQCLcBGAs/s320/Forextradingking.blogspot.com++76.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nFinally market reached our Profit Target Successfully.<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.<br />\r\n<br />\r\nGet more Good Opportunity Technical Trade Signals at <strong>premium service&nbsp; </strong></p>\r\n\r\n<p><a href="http://bossforexsignal.com/join"><strong>http://bossforexsignal.com/join</strong></a><br />\r\n&nbsp;</p>\r\n', 1, 1499101200, 1, '/post/16eb09ed92b46ceca064d2963f5dcf1f', 'jpg', 4, 1499700076, 1, '+1612 Points Profit Reached Successfully in AUD/JPY Buy Signal', '+1612 Points Profit Reached Successfully in AUD/JPY Buy Signal', 0),
(27, '+2312 Points Profit Reached Successfully in EUR/NZD Buy Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-_a_hgBHxvm8/WVYM9qGGgrI/AAAAAAAAATo/YmpI6StVZe82j8J_iTzdYWppNTRGoAXpQCLcBGAs/s1600/Forextradingking.blogspot.com++69.png"><img src="https://1.bp.blogspot.com/-_a_hgBHxvm8/WVYM9qGGgrI/AAAAAAAAATo/YmpI6StVZe82j8J_iTzdYWppNTRGoAXpQCLcBGAs/s320/Forextradingking.blogspot.com++69.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<strong>Reason for Buying EUR/NZD :</strong><br />\r\nAfter the positive speech of &amp;ldquo;ECB (European Central Bank) President Draghi&amp;rdquo;, EUR currency has become more stronger,<br />\r\nEUR/NZD&nbsp;forms a &amp;ldquo;<strong>BIG TAIL</strong>&amp;rdquo; at the bottom, it&amp;rsquo;s just one part of confirmation for reversal.</p>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-YuN-yZlDdJ8/WVYNIKNiW0I/AAAAAAAAATs/1tuvZedT6AgCjxiQoFSXbGj0vOqUOvzZACLcBGAs/s1600/Forextradingking.blogspot.com++70.png"><img src="https://3.bp.blogspot.com/-YuN-yZlDdJ8/WVYNIKNiW0I/AAAAAAAAATs/1tuvZedT6AgCjxiQoFSXbGj0vOqUOvzZACLcBGAs/s320/Forextradingking.blogspot.com++70.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nHowever, we wait for double confirmation before taking our&nbsp;Buy trade on&nbsp;EUR/NZD.<br />\r\nThe second confirmation of Buy signal came after the breakout of the top level of the range.<br />\r\nEUR/NZD is moving in down trend between the ranges&nbsp;on H1 Chart.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-I5RUc5f6qsA/WVYNSAhCyAI/AAAAAAAAATw/qwGpvOrWBCYbah492uBI1N3pMwcoeP1vACLcBGAs/s1600/Forextradingking.blogspot.com++71.png"><img src="https://1.bp.blogspot.com/-I5RUc5f6qsA/WVYNSAhCyAI/AAAAAAAAATw/qwGpvOrWBCYbah492uBI1N3pMwcoeP1vACLcBGAs/s320/Forextradingking.blogspot.com++71.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\nAfter all those confirmations, the Buy signal was given on EUR/NZD.</p>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-U7A_RgfcYrE/WVYNZ41gIdI/AAAAAAAAAT0/rLaB6hjnSGAqcYiNqx0mm0xUv9P3j99VwCLcBGAs/s1600/Forextradingking.blogspot.com++72.png"><img src="https://2.bp.blogspot.com/-U7A_RgfcYrE/WVYNZ41gIdI/AAAAAAAAAT0/rLaB6hjnSGAqcYiNqx0mm0xUv9P3j99VwCLcBGAs/s320/Forextradingking.blogspot.com++72.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\nFinally market reached our Profit Target Successfully.<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.<br />\r\n<br />\r\nGet more Good Opportunity Technical Trade Signals at <strong>premium service</strong><br />\r\nIf you are interested to our learn forex strategies, please follow the link <a href="http://bossforexsignal.com/join">http://bossforexsignal.com/join</a><br />\r\n<br />\r\n&nbsp;</p>\r\n', 1, 1498237200, 1, '/post/e9292884a144fee57e901c907e361e57', 'PNG', 4, 1499700161, 1, '+2312 Points Profit Reached Successfully in EUR/NZD Buy Signal', '+2312 Points Profit Reached Successfully in EUR/NZD Buy Signal', 0),
(28, '+709 Points Profit Reached Successfully in NZD/CHF Sell Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-niRgMoetZXg/WVYMATvWZ5I/AAAAAAAAATU/pR6IdwGTSnQfUEBUhyc6fcV8jneqDYe-ACLcBGAs/s1600/Forextradingking.blogspot.com++65.png"><img src="https://2.bp.blogspot.com/-niRgMoetZXg/WVYMATvWZ5I/AAAAAAAAATU/pR6IdwGTSnQfUEBUhyc6fcV8jneqDYe-ACLcBGAs/s320/Forextradingking.blogspot.com++65.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<strong>Reason for Selling NZD/CHF :</strong><br />\r\nNZD/CHF Forms a&nbsp;Big Reversal Candlestick on H4 Chart</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-1YiR8p7Bkmw/WVYMIKbD3zI/AAAAAAAAATc/o_PKTRo10LkJ-lXvBfcSKN8amvahjQi4QCLcBGAs/s1600/Forextradingking.blogspot.com++66.png"><img src="https://1.bp.blogspot.com/-1YiR8p7Bkmw/WVYMIKbD3zI/AAAAAAAAATc/o_PKTRo10LkJ-lXvBfcSKN8amvahjQi4QCLcBGAs/s320/Forextradingking.blogspot.com++66.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nBig Reversal Candle shows the confirmation for Sell Trade. but, we wait for double confirmation before entering into this sell trade<br />\r\nNZD/CHF was moving&nbsp;between the ranges in&nbsp;H4 Chart by forming Higher Highs and Higher Lows.<br />\r\nWe wait for the Breakout from this range to pickup the Good Opportunity trade.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-EAHGWFYyvGE/WVYMU4ChPJI/AAAAAAAAATg/vgAN2AOAMgQBPR-DLA2LhUDqXXa7YoMIgCLcBGAs/s1600/Forextradingking.blogspot.com++67.png"><img src="https://1.bp.blogspot.com/-EAHGWFYyvGE/WVYMU4ChPJI/AAAAAAAAATg/vgAN2AOAMgQBPR-DLA2LhUDqXXa7YoMIgCLcBGAs/s320/Forextradingking.blogspot.com++67.png" /></a></p>\r\n\r\n<p>Yesterday, market gives the confirmation of Breakout from the range at the bottom level.</p>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-irScTyXg06k/WVYMiPFTQpI/AAAAAAAAATk/6vXRE5gpiXkoqWK_ay1BYWp9zN-va8m9wCLcBGAs/s1600/Forextradingking.blogspot.com++68.png"><img src="https://2.bp.blogspot.com/-irScTyXg06k/WVYMiPFTQpI/AAAAAAAAATk/6vXRE5gpiXkoqWK_ay1BYWp9zN-va8m9wCLcBGAs/s320/Forextradingking.blogspot.com++68.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\nAfter the Double confirmation of sell trade, the sell signal was given to our members.<br />\r\nFinally market reached our Profit Target Successfully.<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.<br />\r\n<br />\r\nGet more Good Opportunity Technical Trade Signals at <strong>premium service</strong><br />\r\nIf you are interested to our learn forex strategies, please register&nbsp;<a href="http://bossforexsignal.com/join">http://bossforexsignal.com/join</a> &nbsp;<br />\r\n<br />\r\n&nbsp;</p>\r\n', 1, 1498410000, 1, '/post/8c6fb5d6999b6a9fa780c70a929b7afd', 'jpg', 4, 1499700032, 1, '+709 Points Profit Reached Successfully in NZD/CHF Sell Signal', '+709 Points Profit Reached Successfully in NZD/CHF Sell Signal', 0),
(29, '+707 Points Profit Reached Successfully in EUR/NZD Buy Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-7AiABl5dzTw/WVYLB01tTRI/AAAAAAAAATE/gK5ge4o8VfcaZKaThE6tYnn4QEtoolstQCLcBGAs/s1600/Forextradingking.blogspot.com++61.png"><img src="https://2.bp.blogspot.com/-7AiABl5dzTw/WVYLB01tTRI/AAAAAAAAATE/gK5ge4o8VfcaZKaThE6tYnn4QEtoolstQCLcBGAs/s320/Forextradingking.blogspot.com++61.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<strong>Reason for Buying EUR/NZD :</strong><br />\r\nAfter the positive speech of &amp;ldquo;ECB (European Central Bank) President Draghi&amp;rdquo;, EUR currency has become more stronger,<br />\r\nEUR/NZD&nbsp;forms a &amp;ldquo;<strong>BIG TAIL</strong>&amp;rdquo; at the bottom, it&amp;rsquo;s just one part of confirmation for reversal.</p>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-cnFChXwZnvI/WVYLM4HWtyI/AAAAAAAAATI/0AAeaPdXujw1wwhd2G3V9yv1jw8EebDRQCLcBGAs/s1600/Forextradingking.blogspot.com++62.png"><img src="https://3.bp.blogspot.com/-cnFChXwZnvI/WVYLM4HWtyI/AAAAAAAAATI/0AAeaPdXujw1wwhd2G3V9yv1jw8EebDRQCLcBGAs/s320/Forextradingking.blogspot.com++62.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nHowever, we wait for double confirmation before taking our&nbsp;Buy trade on&nbsp;EUR/NZD.<br />\r\nThe second confirmation of Buy signal came after the breakout of the top level of the range.<br />\r\nEUR/NZD is moving in down trend between the ranges&nbsp;on H1 Chart.</p>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-01MfvYC4X2g/WVYLXGmC58I/AAAAAAAAATM/UmBI_K5YMUgr0kuEqJfqODd6is_Dd_EWwCLcBGAs/s1600/Forextradingking.blogspot.com++63.png"><img src="https://3.bp.blogspot.com/-01MfvYC4X2g/WVYLXGmC58I/AAAAAAAAATM/UmBI_K5YMUgr0kuEqJfqODd6is_Dd_EWwCLcBGAs/s320/Forextradingking.blogspot.com++63.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\nAfter all those confirmations, the Buy signal was given on EUR/NZD.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-Aqo4I-E4b-s/WVYLh-yGsdI/AAAAAAAAATQ/Wfaz8Gxyq7oBPyOMqyNgxqOUbP5WkPOzQCLcBGAs/s1600/Forextradingking.blogspot.com++64.png"><img src="https://1.bp.blogspot.com/-Aqo4I-E4b-s/WVYLh-yGsdI/AAAAAAAAATQ/Wfaz8Gxyq7oBPyOMqyNgxqOUbP5WkPOzQCLcBGAs/s320/Forextradingking.blogspot.com++64.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nFinally market reached our Profit Target Successfully.<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.<br />\r\n<br />\r\nGet more Good Opportunity Technical Trade Signals at <strong>premium service</strong><br />\r\nIf you are interested to our learn forex strategies, please register <a href="http://bossforexsignal.com/join">http://bossforexsignal.com/join</a><br />\r\nThank you !&nbsp;&nbsp;&nbsp;</p>\r\n', 1, 1498755600, 1, '/post/b3c005d55cfb877875e64954c84eded6', 'PNG', 4, 1499699948, 1, '+707 Points Profit Reached Successfully in EUR/NZD Buy Signal', '+707 Points Profit Reached Successfully in EUR/NZD Buy Signal', 0),
(30, '+1920 Points Profit Reached Successfully in CHF/JPY Buy Signal', '', '<h3><a href="https://forextradingking.blogspot.co.id/2017/06/1920-points-profit-reached-successfully.html">+1920 Points Profit Reached Successfully in CHF/JPY Buy Signal </a></h3>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-YnvcY1SA8Q0/WVYKPhjD87I/AAAAAAAAAS0/D0NAbEg3SokWJbLWgnso6DyamkuFV_5YgCLcBGAs/s1600/Forextradingking.blogspot.com++57.png"><img src="https://2.bp.blogspot.com/-YnvcY1SA8Q0/WVYKPhjD87I/AAAAAAAAAS0/D0NAbEg3SokWJbLWgnso6DyamkuFV_5YgCLcBGAs/s320/Forextradingking.blogspot.com++57.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>Reason for Buying CHF/JPY :</strong><br />\r\nCHF/JPY is trying to Breakout the Top level 115 for more times,&nbsp;but it fails to breakout the top level in all attempts.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-IgUit_3fae4/WVYKZpkzSBI/AAAAAAAAAS4/1rEBZbj0kIcdkle74E3LONNc8GaRRL1iwCLcBGAs/s1600/Forextradingking.blogspot.com++58.png"><img src="https://1.bp.blogspot.com/-IgUit_3fae4/WVYKZpkzSBI/AAAAAAAAAS4/1rEBZbj0kIcdkle74E3LONNc8GaRRL1iwCLcBGAs/s320/Forextradingking.blogspot.com++58.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\nIn H4 chart, CHF/JPY is moving up and down between the range levels.</p>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-m4SPnLFxsgE/WVYKkO01n3I/AAAAAAAAAS8/qP2g832bCg4vh5bkFAIg3yq4wJT8yCVtACLcBGAs/s1600/Forextradingking.blogspot.com++59.png"><img src="https://3.bp.blogspot.com/-m4SPnLFxsgE/WVYKkO01n3I/AAAAAAAAAS8/qP2g832bCg4vh5bkFAIg3yq4wJT8yCVtACLcBGAs/s320/Forextradingking.blogspot.com++59.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\nAfter market reaches the bottom of the range 112.70, it starts to bounce up from the bottom level.<br />\r\nAs per our BYS analysis, after the confirmation of Buy trade setup we have given a Buy signal to our members.</p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-48v2IlRKV0E/WVYKtC-sV2I/AAAAAAAAATA/eN8OkA8gk-IWtnfS16-3ycuhNQqpyCGSwCLcBGAs/s1600/Forextradingking.blogspot.com++60.png"><img src="https://4.bp.blogspot.com/-48v2IlRKV0E/WVYKtC-sV2I/AAAAAAAAATA/eN8OkA8gk-IWtnfS16-3ycuhNQqpyCGSwCLcBGAs/s320/Forextradingking.blogspot.com++60.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\nFinally market reached our Profit Target Successfully.<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.<br />\r\n<br />\r\nGet more Good Opportunity Technical Trade Signals at <strong>premium service</strong><br />\r\nIf you are interested to our learn forex strategies, please&nbsp; register <a href="http://bossforexsignal.com/join">http://bossforexsignal.com/join</a><br />\r\nThank you !&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;</p>\r\n', 1, 1496682000, 1, '/post/ef04c9d33c9b9a57503e8a481324a96b', 'jpg', 4, 1499700377, 1, '+1920 Points Profit Reached Successfully in CHF/JPY Buy Signal', '+1920 Points Profit Reached Successfully in CHF/JPY Buy Signal', 0),
(31, 'EUR/GBP Trading between the range, Waiting for Breakout ?', '', '<p><a href="https://2.bp.blogspot.com/-xbzS0gSdVLs/WVYJv1R0FfI/AAAAAAAAASs/wGRK4UbWm7kYdCCmRhznALH2hRsd6OPGgCLcBGAs/s1600/Forextradingking.blogspot.com++56.png"><img src="https://2.bp.blogspot.com/-xbzS0gSdVLs/WVYJv1R0FfI/AAAAAAAAASs/wGRK4UbWm7kYdCCmRhznALH2hRsd6OPGgCLcBGAs/s320/Forextradingking.blogspot.com++56.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<strong>EUR/GBP Analysis :&nbsp;</strong><br />\r\nAfter&nbsp;EUR/GBP Reaching the Top level 0.88 market starts to bounce back from that level.<br />\r\nHowever, EUR/GBP is moving up without much retracements, this shows that market is strongly moving in an uptrend.<br />\r\nIn H4 time frame, market gives some good opportunity for trading the breakout of the range.<br />\r\nLet&amp;rsquo;s wait for the confirmation of Breakout from the range to make good profits on EUR/GBP.<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.<br />\r\n<br />\r\nGet more Good Opportunity Technical Trade Signals at <strong>premium</strong><br />\r\nIf you are interested to our learn forex strategies, please register <a href="http://bossforexsignal.com/join">http://bossforexsignal.com/join</a></p>\r\n', 1, 1497373200, 1, '/post/495f151690dfe1b4ea28be6f7ceb900d', 'png', 6, 1509678487, 1, 'EUR/GBP Trading between the range, Waiting for Breakout ?', 'EUR/GBP Trading between the range, Waiting for Breakout ?', 0),
(34, 'USD/JPY reaches the major level, wait for Breakout (or) Reversal ?', '', '<p><a href="https://1.bp.blogspot.com/-6jPC5r7-kqw/WVS4u-nZZ4I/AAAAAAAAAE8/JM0PKnGiBDolm_t5eUpEJ_EboiWPJVXgQCLcBGAs/s1600/1.png"><img src="https://1.bp.blogspot.com/-6jPC5r7-kqw/WVS4u-nZZ4I/AAAAAAAAAE8/JM0PKnGiBDolm_t5eUpEJ_EboiWPJVXgQCLcBGAs/s400/1.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>USD/JPY Analysis :</strong><br />\r\nFrom December 2016, USD/JPY is moving in a Downtrend.<br />\r\nNow, the market standing at the major level 111.80<br />\r\nIf Breakout happens at the top, we can expect a huge upward movement to&nbsp;the top level 117.<br />\r\nIf Reversal happens, market will re-test the support level 108.<br />\r\nLet&amp;rsquo;s wait for the confirmation of Breakout or Reversal to make good profits on USD/JPY.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1481648400, 1, '/post/7bc6fa64d2e68a5d5a821b200362978b', 'jpg', 6, 1499869953, 1, 'USD/JPY reaches the major level, wait for Breakout (or) Reversal ?', 'USD/JPY reaches the major level, wait for Breakout (or) Reversal ?', 0),
(35, 'AUD/USD bouncing up from the major level 0.74', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-QRgL-Ehd8oU/WVS7Ll3zBgI/AAAAAAAAAFY/ffJAzcVvpx0oNPqGkaoNDCWNl562JvgawCLcBGAs/s1600/Forexgdp.blogspot.com++2.png"><img src="https://4.bp.blogspot.com/-QRgL-Ehd8oU/WVS7Ll3zBgI/AAAAAAAAAFY/ffJAzcVvpx0oNPqGkaoNDCWNl562JvgawCLcBGAs/s400/Forexgdp.blogspot.com++2.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>AUD/USD Analysis :</strong><br />\r\nAUD/USD moving between the ranges 0.77 and 0.74 for a long time.<br />\r\nHowever, AUD/USD try to Breakout the top level 0.77 for more times, but it still fails at all the attempt.<br />\r\nAUD/USD is moving in a Ranging market now.<br />\r\nLet&amp;rsquo;s trade between the ranges to make some profit on short term trades (or) wait for the Breakout from the range to make profit on&nbsp;long term trades.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1480870800, 1, '/post/ab70a3858478735aa24743fdf01450d1', 'jpg', 6, 1499870171, 1, 'AUD/USD bouncing up from the major level 0.74', 'AUD/USD bouncing up from the major level 0.74', 0),
(36, 'signal forex 12 july 2017', 'signal forex 12 july 2017', '<p><a href="https://s21.postimg.org/z8tifykuv/12_july_gbpchf.png" target="_blank"><img alt="" src="https://s21.postimg.org/z8tifykuv/12_july_gbpchf.png" style="height:256px; width:500px" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Forex Signal :</p>\r\n\r\n<p>buy GBP/CHF Between 1.23684 and 1.23460</p>\r\n\r\n<p>Target 1 : 1.25170</p>\r\n\r\n<p>Target 2 : 1.26935</p>\r\n\r\n<p>Target 3 : 1.28470</p>\r\n\r\n<p>Stop Loss : 0.22300</p>\r\n\r\n<p>Read the signal instruction&nbsp;completely before following our signals :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="http://bossforexsignal.com/how-to-follow-our-forex-signals-successfully-to-get-consistent-profits">http://bossforexsignal.com/how-to-follow-our-forex-signals-successfully-to-get-consistent-profits</a>Thank you.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n', 1, 1499792400, 1, '/post/dd902dd3f0baab710e9b59b478401e9e', 'png', 7, 1501216894, 1, 'signal forex 12 july 2017', 'signal forex 12 july 2017', 0);
INSERT INTO `content_posts` (`ID`, `title`, `summary`, `content`, `userid`, `timestamp`, `comments`, `image`, `ext_image`, `categoryid`, `last_updated`, `last_updated_userid`, `seo_title`, `seo_description`, `loggedin`) VALUES
(37, '+1358 Points Profit made Successfully in AUD/CHF Sell Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-gYnrNWvi0UQ/WVTBR2YFZDI/AAAAAAAAAF0/9HPyom3AkogQKzxwSwu_m0mXnEdtHxXggCLcBGAs/s1600/Forexgdp.blogspot.com++3.png"><img src="https://4.bp.blogspot.com/-gYnrNWvi0UQ/WVTBR2YFZDI/AAAAAAAAAF0/9HPyom3AkogQKzxwSwu_m0mXnEdtHxXggCLcBGAs/s400/Forexgdp.blogspot.com++3.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<strong>Reason for Selling AUD/CHF :</strong><br />\r\nAUD/CHF is moving in a downtrend now.</p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-DAbqUb2Ohk8/WVTBn08-TgI/AAAAAAAAAF4/ELOz0XqzTYYZeBWuA2GWYAFWPDzDzCZLACLcBGAs/s1600/Forexgdp.blogspot.com++4.png"><img src="https://4.bp.blogspot.com/-DAbqUb2Ohk8/WVTBn08-TgI/AAAAAAAAAF4/ELOz0XqzTYYZeBWuA2GWYAFWPDzDzCZLACLcBGAs/s400/Forexgdp.blogspot.com++4.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\nAfter market reaching the strong support level 0.7480, market starts to bounce up from the level.<br />\r\nBut, Our Analyst team strongly expect a Breakout at the support. As per our analysis, market&nbsp;Breakout the strong support and went down more.<br />\r\nFinally market reached our Profit Target Successfully.<br />\r\nWe recommend our traders to close partial lot to book some profit on this pair.<br />\r\n&nbsp;</p>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-OT70FAicnwc/WVTBzH099yI/AAAAAAAAAF8/JqqWDqFothcYQu3DEZQkLUNm4Ip5G-lUwCLcBGAs/s1600/Forexgdp.blogspot.com++5.png"><img src="https://3.bp.blogspot.com/-OT70FAicnwc/WVTBzH099yI/AAAAAAAAAF8/JqqWDqFothcYQu3DEZQkLUNm4Ip5G-lUwCLcBGAs/s400/Forexgdp.blogspot.com++5.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1480525200, 1, '/post/e2ea063111c9974f668df71a6159ff7c', 'png', 4, 1499922493, 1, '+1358 Points Profit made Successfully in AUD/CHF Sell Signal', '+1358 Points Profit made Successfully in AUD/CHF Sell Signal', 0),
(38, '+3098 Points made in USD/CAD after breakout from the range', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-j9FdWxoTLEc/WVTDgjvfjXI/AAAAAAAAAGI/Cyjqt25EldAa3IOAUxZkayF55lBQXR_kACLcBGAs/s1600/Forexgdp.blogspot.com++6.png"><img src="https://2.bp.blogspot.com/-j9FdWxoTLEc/WVTDgjvfjXI/AAAAAAAAAGI/Cyjqt25EldAa3IOAUxZkayF55lBQXR_kACLcBGAs/s400/Forexgdp.blogspot.com++6.png" /></a></p>\r\n\r\n<p><br />\r\nAs per our USD/CAD Analysis given on April 19, market reaches the top level zone for 3rd time, We wait for the confirmation of Breakout or reversal. Finally, Market breakout the top level and&nbsp;went up more.</p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-EOl9etcpHv8/WVTDynjADtI/AAAAAAAAAGM/hEUV8styb80pnqzozvXp7M4CXSag_WcEgCLcBGAs/s1600/Forexgdp.blogspot.com++7.png"><img src="https://4.bp.blogspot.com/-EOl9etcpHv8/WVTDynjADtI/AAAAAAAAAGM/hEUV8styb80pnqzozvXp7M4CXSag_WcEgCLcBGAs/s400/Forexgdp.blogspot.com++7.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>Now, we recommend our traders to stop chasing this trade and close again the partial lot of the open trade&nbsp;with +3098 Points Profit.</strong></p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-X2bq7I4rVw8/WVTECS94U5I/AAAAAAAAAGc/Zj3TPxtJRIMMJwc6xU2vV8AiC7nMLqqbwCLcBGAs/s1600/Forexgdp.blogspot.com++8.png"><img src="https://4.bp.blogspot.com/-X2bq7I4rVw8/WVTECS94U5I/AAAAAAAAAGc/Zj3TPxtJRIMMJwc6xU2vV8AiC7nMLqqbwCLcBGAs/s400/Forexgdp.blogspot.com++8.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1480266000, 1, '/post/7ba78935afcd8ea350c9e32d2a85173f', 'jpg', 6, 1499922987, 1, '+3098 Points made in USD/CAD after breakout from the range', '+3098 Points made in USD/CAD after breakout from the range', 0),
(39, '+564 Points Profit Reached Successfully in CAD/CHF Sell Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-WSeRd-qesPU/WVTGJdVp96I/AAAAAAAAAGo/KSxLfKsr4K4WzIlHGHW03ZdrT7NfftxCgCLcBGAs/s1600/Forexgdp.blogspot.com++9.png"><img src="https://3.bp.blogspot.com/-WSeRd-qesPU/WVTGJdVp96I/AAAAAAAAAGo/KSxLfKsr4K4WzIlHGHW03ZdrT7NfftxCgCLcBGAs/s400/Forexgdp.blogspot.com++9.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>Reason for selling CAD/CHF :&nbsp;</strong><br />\r\nCAD/CHF is moving in a Downtrend now by forming&nbsp;<strong>Lower</strong> highs and <strong>Lower</strong> lows.<br />\r\nYesterday, market confirms the breakout of the bottom level.</p>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-HmzL55hJogI/WVTGSKzGAQI/AAAAAAAAAG4/81gpmN7eJGgg8xEln8RldKZO_gGzfz1TQCEwYBhgL/s1600/Forexgdp.blogspot.com++10.png"><img src="https://3.bp.blogspot.com/-HmzL55hJogI/WVTGSKzGAQI/AAAAAAAAAG4/81gpmN7eJGgg8xEln8RldKZO_gGzfz1TQCEwYBhgL/s320/Forexgdp.blogspot.com++10.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\nIn other side, CAD currency seems to be more weaker for a long time.<br />\r\nThis is the reason for selling CAD/CHF.<br />\r\nFinally market reaches our target successfully.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-u4eS2ibE5Uk/WVTGvR1aOYI/AAAAAAAAAG8/dwVQw_7LCe46QFqQS-wGN0wz9Yj3hB-nQCLcBGAs/s1600/Forexgdp.blogspot.com++11.png"><img src="https://1.bp.blogspot.com/-u4eS2ibE5Uk/WVTGvR1aOYI/AAAAAAAAAG8/dwVQw_7LCe46QFqQS-wGN0wz9Yj3hB-nQCLcBGAs/s400/Forexgdp.blogspot.com++11.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1493744400, 1, '/post/19f75119476ffa206bdd765df61da7e1', 'png', 4, 1499923209, 1, '+564 Points Profit Reached Successfully in CAD/CHF Sell Signal', '+564 Points Profit Reached Successfully in CAD/CHF Sell Signal', 0),
(40, '+1700 Points Profit Reached Successfully in AUD/CHF Sell Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-cEftOJtpbaw/WVTHffYK_hI/AAAAAAAAAHE/PSJ-geZ0oDgiVr1DkGXoD5uk7slxdE-VgCLcBGAs/s1600/Forexgdp.blogspot.com++12.png"><img src="https://2.bp.blogspot.com/-cEftOJtpbaw/WVTHffYK_hI/AAAAAAAAAHE/PSJ-geZ0oDgiVr1DkGXoD5uk7slxdE-VgCLcBGAs/s400/Forexgdp.blogspot.com++12.png" /></a></p>\r\n\r\n<p><strong>Reason for Selling AUD/CHF :</strong><br />\r\nAUD/CHF is moving in a downtrend now.</p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-O0WIWRIFYXI/WVTHoEIIWcI/AAAAAAAAAHI/Ll2OA7K66c4XG84wSuB1EsH1ocV1kuBZgCLcBGAs/s1600/Forexgdp.blogspot.com++13.png"><img src="https://4.bp.blogspot.com/-O0WIWRIFYXI/WVTHoEIIWcI/AAAAAAAAAHI/Ll2OA7K66c4XG84wSuB1EsH1ocV1kuBZgCLcBGAs/s400/Forexgdp.blogspot.com++13.png" /></a></p>\r\n\r\n<p><br />\r\nAfter market reaching the strong support level 0.7480, market starts to bounce up from the level.<br />\r\nBut, Our Analyst team strongly expect a Breakout at the support. As per our analysis, market&nbsp;Breakout the strong support and went down more.<br />\r\nFinally market reached our Profit Target Successfully.</p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-AJnxiKycLWY/WVTHxcX623I/AAAAAAAAAHM/9huPO2vRJaIJwjeP34WlqM4eZsPoQgSpQCLcBGAs/s1600/Forexgdp.blogspot.com++14.png"><img src="https://4.bp.blogspot.com/-AJnxiKycLWY/WVTHxcX623I/AAAAAAAAAHM/9huPO2vRJaIJwjeP34WlqM4eZsPoQgSpQCLcBGAs/s400/Forexgdp.blogspot.com++14.png" /></a></p>\r\n\r\n<p>&nbsp;Save your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1493398800, 1, '/post/1679381d9c3a343b3349867661120622', 'png', 4, 1499923530, 1, '+1700 Points Profit Reached Successfully in AUD/CHF Sell Signal', '+1700 Points Profit Reached Successfully in AUD/CHF Sell Signal', 0),
(41, '+609 Points Profit Reached Successfully in AUD/USD Sell Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-RUItO_8_eEw/WVTI8JYU76I/AAAAAAAAAHY/F5QG4NN6w-suPPpGNzOgQXQeHYtnV_frQCLcBGAs/s1600/Forexgdp.blogspot.com++15.png"><img src="https://2.bp.blogspot.com/-RUItO_8_eEw/WVTI8JYU76I/AAAAAAAAAHY/F5QG4NN6w-suPPpGNzOgQXQeHYtnV_frQCLcBGAs/s400/Forexgdp.blogspot.com++15.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>Reason for Selling AUD/USD :</strong><br />\r\nAUD/USD tried to Breakout the bottom zone 0.7470 for 2 times , but it fails to Breakout that level.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-cfXclrXv9Jc/WVTJEAeLVDI/AAAAAAAAAHc/DsYhOdA-rnghRYW2Dm0cLNV89TD2j7BrgCLcBGAs/s1600/Forexgdp.blogspot.com++16.png"><img src="https://1.bp.blogspot.com/-cfXclrXv9Jc/WVTJEAeLVDI/AAAAAAAAAHc/DsYhOdA-rnghRYW2Dm0cLNV89TD2j7BrgCLcBGAs/s400/Forexgdp.blogspot.com++16.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\nFinally, Market try to Breakout the bottom zone for 3rd time, and it happens with huge number of sellers, push down the market in 1 day.<br />\r\nAs per our Technical Analysis, the Breakout seems to be valid.<br />\r\nThis is the reason, AUD/USD reaches our Take Profit Target.</p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-ELS0sdafV4g/WVTJOOrCqiI/AAAAAAAAAHg/EdqDhZyVJHs22CdPPNUuzgalKoMKolp3QCLcBGAs/s1600/Forexgdp.blogspot.com++17.png"><img src="https://4.bp.blogspot.com/-ELS0sdafV4g/WVTJOOrCqiI/AAAAAAAAAHg/EdqDhZyVJHs22CdPPNUuzgalKoMKolp3QCLcBGAs/s400/Forexgdp.blogspot.com++17.png" /></a></p>\r\n\r\n<p><br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1494608400, 1, '/post/336127649069702b39512bf4254c0bd6', 'jpg', 4, 1499923917, 1, '+609 Points Profit Reached Successfully in AUD/USD Sell Signal', '+609 Points Profit Reached Successfully in AUD/USD Sell Signal', 0),
(42, '+881 Points Profit Reached Successfully in EUR/NZD Sell Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-6SWzF-21UB8/WVTJx9MC7rI/AAAAAAAAAHo/LgbYy02uNm0nSJskjZ70t7ewN6TFkcnbwCLcBGAs/s1600/Forexgdp.blogspot.com++18.png"><img src="https://3.bp.blogspot.com/-6SWzF-21UB8/WVTJx9MC7rI/AAAAAAAAAHo/LgbYy02uNm0nSJskjZ70t7ewN6TFkcnbwCLcBGAs/s400/Forexgdp.blogspot.com++18.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>Reason for Selling EUR/NZD :</strong><br />\r\nAfter the final result of French Election, We expect this week, market will keep moving down. because, the victory of Emmanuel Macron&nbsp;was most expected and&nbsp; the market has already made enough movement as per the expectations of big players in forex market.<br />\r\nNow, the fundamental movement has been complete and technical movement starts to move the market in a right direction.<br />\r\nAs per our technical analysis, the volume of Buyers in NZD is more than the EUR, this makes the market to reach our Take Profit price.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-9QIk0pU8qMY/WVTJ5w5TSHI/AAAAAAAAAHs/YfpgHXcalZABuf7mr6b08GffM0F2CYI5wCEwYBhgL/s1600/Forexgdp.blogspot.com++19.png"><img src="https://1.bp.blogspot.com/-9QIk0pU8qMY/WVTJ5w5TSHI/AAAAAAAAAHs/YfpgHXcalZABuf7mr6b08GffM0F2CYI5wCEwYBhgL/s400/Forexgdp.blogspot.com++19.png" /></a></p>\r\n\r\n<p><br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1495472400, 1, '/post/616d397295be9ab8031cce8bade8b834', 'PNG', 4, 1499924085, 1, '+881 Points Profit Reached Successfully in EUR/NZD Sell Signal', '+881 Points Profit Reached Successfully in EUR/NZD Sell Signal', 0),
(43, '+2098 Points made in USD/JPY after breakout of the Top level', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-mGQWG8JnKuE/WVTKg_RxVfI/AAAAAAAAAIA/hRiXEtKRQXMXFlm4yz0scfYE_QrJDMHKwCLcBGAs/s1600/Forexgdp.blogspot.com++20.png"><img src="https://4.bp.blogspot.com/-mGQWG8JnKuE/WVTKg_RxVfI/AAAAAAAAAIA/hRiXEtKRQXMXFlm4yz0scfYE_QrJDMHKwCLcBGAs/s400/Forexgdp.blogspot.com++20.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>USD/JPY Analysis :</strong><br />\r\nAs per our Previous Analysis on USD/JPY, market breakout the top level 111.80 and went up +2098 points (+209.8 pips).<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-G9q-rcNNnxE/WVTKy2MTcfI/AAAAAAAAAIE/3qT4y-c7LQo2j3KQUkEJ7AhgyQ2gy16CwCLcBGAs/s1600/Forexgdp.blogspot.com++21.png"><img src="https://4.bp.blogspot.com/-G9q-rcNNnxE/WVTKy2MTcfI/AAAAAAAAAIE/3qT4y-c7LQo2j3KQUkEJ7AhgyQ2gy16CwCLcBGAs/s400/Forexgdp.blogspot.com++21.png" /></a></p>\r\n\r\n<p><br />\r\nWe recommend our traders&nbsp;to&nbsp;close partial lot of the open position to book some profit now.<br />\r\n<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1500742800, 1, '/post/39977498e5deab441d1a8dd9508787c2', 'jpg', 6, 1499924246, 1, '+2098 Points made in USD/JPY after breakout of the Top level', '+2098 Points made in USD/JPY after breakout of the Top level', 0),
(44, '+1388 Points Profit Reached Successfully in EUR/NZD Sell Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-NITjbuTL5-o/WVTLe-cXLsI/AAAAAAAAAIM/AbwGkTuIlcQiwvQuLVUemcqPaY3nYZDZACLcBGAs/s1600/Forexgdp.blogspot.com++22.png"><img src="https://4.bp.blogspot.com/-NITjbuTL5-o/WVTLe-cXLsI/AAAAAAAAAIM/AbwGkTuIlcQiwvQuLVUemcqPaY3nYZDZACLcBGAs/s400/Forexgdp.blogspot.com++22.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<strong>Reason for Selling EUR/NZD :</strong><br />\r\nAfter the final result of French Election, We expect this week, market will keep moving down. because, the victory of Emmanuel Macron&nbsp;was most expected and&nbsp; the market has already made enough movement as per the expectations of big players in forex market.<br />\r\nNow, the fundamental movement has been complete and technical movement starts to move the market in a right direction.<br />\r\nAs per our technical analysis, the volume of Buyers in NZD is more than the EUR, this makes the market to reach our Take Profit price.</p>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-qLBjdK2k9d8/WVTLoQEc4EI/AAAAAAAAAIQ/RCBv21O0bP0tfJ0nTquflBA1zRGImXbJACLcBGAs/s1600/Forexgdp.blogspot.com++23.png"><img src="https://4.bp.blogspot.com/-qLBjdK2k9d8/WVTLoQEc4EI/AAAAAAAAAIQ/RCBv21O0bP0tfJ0nTquflBA1zRGImXbJACLcBGAs/s400/Forexgdp.blogspot.com++23.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1495040400, 1, '/post/3c4585370d4eb183fdd84eb58411620b', 'PNG', 4, 1499924609, 1, '+1388 Points Profit Reached Successfully in EUR/NZD Sell Signal', '+1388 Points Profit Reached Successfully in EUR/NZD Sell Signal', 0),
(45, '+1468 Points Profit Reached Successfully in NZD/USD Sell Signal', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-KiAki8Uv7qM/WVTMIZqdY2I/AAAAAAAAAIY/zD8rdrWyrts2PK9klu_pjKgGzsPDDMhZQCLcBGAs/s1600/Forexgdp.blogspot.com++24.png"><img src="https://4.bp.blogspot.com/-KiAki8Uv7qM/WVTMIZqdY2I/AAAAAAAAAIY/zD8rdrWyrts2PK9klu_pjKgGzsPDDMhZQCLcBGAs/s400/Forexgdp.blogspot.com++24.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<strong>Reason for Selling NZD/USD :</strong><br />\r\nNZD/USD was moving up and down in <strong>1 hour chart</strong> between the ranges 0.6980 and 0.7050</p>\r\n\r\n<p><a href="https://3.bp.blogspot.com/-aCXkc6_1rC0/WVTMUeUScCI/AAAAAAAAAIc/wT9gC20BaAQNErPxpqHEjiR9nxcL-ShgACEwYBhgL/s1600/Forexgdp.blogspot.com++25.png"><img src="https://3.bp.blogspot.com/-aCXkc6_1rC0/WVTMUeUScCI/AAAAAAAAAIc/wT9gC20BaAQNErPxpqHEjiR9nxcL-ShgACEwYBhgL/s400/Forexgdp.blogspot.com++25.png" /></a></p>\r\n\r\n<p><br />\r\nMarket try to Breakout the top level for 3 times, but it fails to breakout the top 0.7050<br />\r\nWe expect Breakout at the bottom zone and breakout happens in bottom at 3rd attempt.<br />\r\nWe have given the sell signal after we confirmed the&nbsp;Breakout is valid.<br />\r\nFinally, NZD/USD reached our Target Successfully.</p>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-bm3TgYmAEP0/WVTMlGGS8uI/AAAAAAAAAIg/KMXu0BHzNaccWv0UjFDNcxlE1Ay9S2WrACLcBGAs/s1600/Forexgdp.blogspot.com++26.png"><img src="https://2.bp.blogspot.com/-bm3TgYmAEP0/WVTMlGGS8uI/AAAAAAAAAIg/KMXu0BHzNaccWv0UjFDNcxlE1Ay9S2WrACLcBGAs/s400/Forexgdp.blogspot.com++26.png" /></a></p>\r\n\r\n<p>&nbsp;Save your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the mark</p>\r\n', 1, 1492621200, 1, '/post/68bc6b017d6ccceda4ca75664ce6d251', 'jpg', 4, 1499924846, 1, '+1468 Points Profit Reached Successfully in NZD/USD Sell Signal', '+1468 Points Profit Reached Successfully in NZD/USD Sell Signal', 0),
(46, '+694 Points Profit Reached Successfully in AUD/CAD Sell Signal', '+694 Points Profit Reached Successfully in AUD/CAD Sell Signal', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://4.bp.blogspot.com/-aWE8JL75FAg/WVUQ_6RpdVI/AAAAAAAAAI8/fe_WsA15i-EeKqB9G7EHVQmtDqwDsKxQwCLcBGAs/s1600/Forexgdp.blogspot.com++27.png"><img src="https://4.bp.blogspot.com/-aWE8JL75FAg/WVUQ_6RpdVI/AAAAAAAAAI8/fe_WsA15i-EeKqB9G7EHVQmtDqwDsKxQwCLcBGAs/s320/Forexgdp.blogspot.com++27.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>Reason for Selling AUD/CAD :</strong><br />\r\nAUD/CAD fails to breakout the Strong Resistance zone 1.035<br />\r\nMarket starts to reverse with huge sellers pressure, we confirmed the downward movement on this pair by using BYS Analysis.<br />\r\nFinally market reached our Take profit target successfully.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-jngloQYJQvk/WVURH0eNAyI/AAAAAAAAAJA/rZ3jnLCAgAwqzajPv8B5GmtmVKYAUY1lACLcBGAs/s1600/Forexgdp.blogspot.com++28.png"><img src="https://1.bp.blogspot.com/-jngloQYJQvk/WVURH0eNAyI/AAAAAAAAAJA/rZ3jnLCAgAwqzajPv8B5GmtmVKYAUY1lACLcBGAs/s320/Forexgdp.blogspot.com++28.png" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1496768400, 1, '/post/985a8e71d8bd8c3b89e5be112274b646', 'jpg', 4, 1501216918, 1, '+694 Points Profit Reached Successfully in AUD/CAD Sell Signal', '+694 Points Profit Reached Successfully in AUD/CAD Sell Signal', 0),
(47, 'NZD/JPY reaches the bottom level of the range, good to buy or sell ?', '', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-XnMePs_9AVU/WVURhHQ_UdI/AAAAAAAAAJE/l_6Asdyy-1Muy-2gvZM5x15qzDXH57PuQCLcBGAs/s1600/Forexgdp.blogspot.com++29.png"><img src="https://1.bp.blogspot.com/-XnMePs_9AVU/WVURhHQ_UdI/AAAAAAAAAJE/l_6Asdyy-1Muy-2gvZM5x15qzDXH57PuQCLcBGAs/s320/Forexgdp.blogspot.com++29.png" /></a></p>\r\n\r\n<p><br />\r\n<strong>NZD/JPY Analysis :&nbsp;</strong><br />\r\nMarket trading between the ranges in H1 chart.<br />\r\nNZD becomes too weaker on yesterday due to &amp;ldquo;RBNZ rate statement and Monetary Policy&amp;rdquo;<br />\r\nAfter the drop down of NZD pairs,&nbsp;Now NZD/JPY reaches the bottom level 77.80</p>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-GOId4xesk0k/WVURoSU0zPI/AAAAAAAAAJI/POD7fj1UifI-YN7C8iOxKrAr48QBJ6BXgCEwYBhgL/s1600/Forexgdp.blogspot.com++30.png"><img src="https://2.bp.blogspot.com/-GOId4xesk0k/WVURoSU0zPI/AAAAAAAAAJI/POD7fj1UifI-YN7C8iOxKrAr48QBJ6BXgCEwYBhgL/s320/Forexgdp.blogspot.com++30.png" /></a></p>\r\n\r\n<p><br />\r\nLet&amp;rsquo;s wait for the confirmation of Breakout (or) Reversal to make good profits on NZD/JPY.<br />\r\n<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the market.</p>\r\n', 1, 1495558800, 1, '/post/7f290af834e4fe068ed297b701036ce0', 'png', 6, 1499925237, 1, 'NZD/JPY reaches the bottom level of the range, good to buy or sell ?', 'NZD/JPY reaches the bottom level of the range, good to buy or sell ?', 0),
(48, 'EUR/USD trade closed at Entry Price Level', '', '<h3>&nbsp;</h3>\r\n\r\n<p><strong>Reason for Selling EUR/USD :</strong><br />\r\nEUR/USD reaches the top zone 1.100 and starts to reverse.&nbsp;After the result of French Election, market starts to&nbsp;move down.<br />\r\nBecause, the victory of Emmanuel Macron&nbsp;was most expected and&nbsp; the market has already made enough movement as per the expectations of big players in forex market.<br />\r\nAs per the Technical analysis, we expect the gap up of +180 pips made on April 24 will get covered soon. But the market keep moving up and down for 2 days.<br />\r\n<br />\r\nEUR/USD&nbsp;don&amp;rsquo;t reach our Target 1 within 2 days.<br />\r\n<br />\r\nFinally, the Sell trade&nbsp;has been closed at entry price levels at the end of 2nd day<br />\r\n<br />\r\nSave your time on Analyzing the market, Start to trade Forex in a technical ways&nbsp;with the help of Forex Experts team.<br />\r\nDon&amp;rsquo;t Trade forex all the time, trade forex only at good opportunities available in the marke</p>\r\n', 1, 1492966800, 1, '/post/5f1cb0c480f8ac008894fb6bed422c90', 'png', 6, 1499925372, 1, 'EUR/USD trade closed at Entry Price Level', 'EUR/USD trade closed at Entry Price Level', 0),
(49, '+3333 Points made in EUR/JPY After breakout from the range', '+3333 Points made in EUR/JPY After breakout from the range', '<h3>&nbsp;</h3>\r\n\r\n<p><a href="https://2.bp.blogspot.com/-qk349Zh1S3w/WVZ3eq6J22I/AAAAAAAAAUg/cVnQIbIWjXgtpxygyr7_VPpO60_QpX2vQCLcBGAs/s1600/Forextradingking.blogspot.com++77.png"><img src="https://2.bp.blogspot.com/-qk349Zh1S3w/WVZ3eq6J22I/AAAAAAAAAUg/cVnQIbIWjXgtpxygyr7_VPpO60_QpX2vQCLcBGAs/s320/Forextradingking.blogspot.com++77.png" style="width:100%" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<strong>EUR/JPY Analysis :&nbsp;</strong><br />\r\nAfter EUR/JPY breakout from the range in daily chart, market Re-tested the breakout level and went up more as per our Breakout strategy.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-w0DzZDMPzys/WVZ3rMTviRI/AAAAAAAAAUk/VnyxfbDiq1UFmVrPFQDm8jE8sPnV196bQCLcBGAs/s1600/Forextradingking.blogspot.com++78.png"><img src="https://1.bp.blogspot.com/-w0DzZDMPzys/WVZ3rMTviRI/AAAAAAAAAUk/VnyxfbDiq1UFmVrPFQDm8jE8sPnV196bQCLcBGAs/s320/Forextradingking.blogspot.com++78.png" style="height:177px; width:320px" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nMarket was&nbsp;standing at the top level 124.00 and making a ranging movement on H4 chart.</p>\r\n\r\n<p><a href="https://1.bp.blogspot.com/-LuVp1JFK-Zc/WVZ34sgLY8I/AAAAAAAAAUo/S5YIkJ8K-fE-VUs2kV-fbZCO-Uf8POGJwCLcBGAs/s1600/Forextradingking.blogspot.com++79.png"><img src="https://1.bp.blogspot.com/-LuVp1JFK-Zc/WVZ34sgLY8I/AAAAAAAAAUo/S5YIkJ8K-fE-VUs2kV-fbZCO-Uf8POGJwCLcBGAs/s320/Forextradingking.blogspot.com++79.png" style="height:320px; width:286px" /></a></p>\r\n\r\n<p><br />\r\n<br />\r\n<br />\r\nWe told our members to wait for the confirmation of breakout from the range to make good profits on EUR/JPY.<br />\r\nAs per our technical analysis, Market Breakout the top level very soon and went up more.<br />\r\n<strong>Education Notes&nbsp;:</strong><br />\r\n<strong>Why Re-testing the Breakout Level is more important ?</strong><br />\r\nIf market Re-test the previous Breakout level and starts to bounce back, then we can expect big and sharp movements from that Breakout level.<br />\r\nSave your time on analyzing the forex market. Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n', 1, 1500310800, 1, '/post/c8bc45090dde61f3f9804a26ef6132ac', 'png', 6, 1501490235, 1, '+3333 Points made in EUR/JPY After breakout from the range', '+3333 Points made in EUR/JPY After breakout from the range', 0),
(50, '+7598 Points down in USD/CAD after the breakout of the bottom level', '+7598 Points down in USD/CAD after the breakout of the bottom level', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/7bc49551a6ce0bb522c9e4ac8a8660ee.jpeg" style="height:697px; width:617px" /></p>\r\n\r\n<p>USD/CAD Analysis :<br />\r\nAS per our Previous analysis on USD/CAD&nbsp; market breakout the bottom level and went down more.<br />\r\n<br />\r\nWe recommend our traders to close partial lot on USD/CAD sell trade to book Good profits now.<br />\r\n<br />\r\nKeep chasing the USD/CAD sell trade by moving the Stop loss to entry price for making Big profits without any risk.<br />\r\n<br />\r\nSave your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways with the help of Forex Experts team.<br />\r\n<br />\r\nDon&#39;t Trade forex market all the time, trade forex only at good opportunities available in the market.<br />\r\n<br />\r\nGet more Good Opportunity Technical Trade Signals at &quot;Pro&quot; (or) &quot;premium&quot; Signal Plan. Join here : <a href="https://www.bossforexsignal.com/join">https://www.bossforexsignal.com/join</a><br />\r\n&nbsp;</p>\r\n', 1, 1501002000, 1, '/post/a37a86828e9aa976fdfb0efb9f62ec33', 'png', 6, 1501216842, 1, '+7598 Points down in USD/CAD after the breakout of the bottom level', '+7598 Points down in USD/CAD after the breakout of the bottom level', 0),
(51, '+1148 Points Reached in NZD/CHF Buy Signal', '+1148 Points Reached in NZD/CHF Buy Signal', '<p><strong>Reason for Buying NZD/CHF :</strong></p>\r\n\r\n<p>NZD/CHF was moving between the ranges in H1 chart.</p>\r\n\r\n<p>Market try to breakout the top level for more times in H1 Chart, but it fails all the time. Finally, market breakout the top level.<img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/b265116871e76e0200f6155552d73641.jpeg" style="height:372px; width:820px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This gives the confirmation for Buying&nbsp;NZD/CHF.</p>\r\n\r\n<p><img alt="" src="https://www.forexgdp.com/wp-content/uploads/2017/07/f15.png" style="height:665px; width:582px" /></p>\r\n\r\n<p>Finally market reached our profit target succesfully.</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>Don&amp;rsquo;t Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at&nbsp;&amp;ldquo;<strong>Pro</strong>&amp;rdquo; (or) &amp;ldquo;<strong>premium</strong>&amp;rdquo; Signal Plan. Join here :<a href="https://www.bossforexsignal.com/join">https://www.bossforexsignal.com/join</a></p>\r\n\r\n<p>If you are interested to learn our forex strategies,</p>\r\n\r\n<p>Thank you !</p>\r\n', 1, 1501088400, 1, '/post/acf42260cbb26af6749d271ea86f0846', 'png', 4, 1501216813, 1, '+1148 Points Reached in NZD/CHF Buy Signal', '+1148 Points Reached in NZD/CHF Buy Signal', 0),
(52, '+706 Points Reached Successfully in USD/JPY Buy Signal', '+706 Points Reached Successfully in USD/JPY Buy Signal', '<p><strong>Reason for Buying USD/JPY :&nbsp;</strong></p>\r\n\r\n<p>USD/JPY moving down in a range for a long time in H1 chart.</p>\r\n\r\n<p>After breakout happens at the top level, we expect a Re-test of the previous breakout level for picking up the Good Opportunity trade.</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/76beadbec14729f923cb0d457b487354.jpeg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Yesterday, due&nbsp;to the Effect of Fed interest rate decision, the USD/JPY falls down to the previous breakout level for re-testing.</p>\r\n\r\n<p>After the confirmation of reversal from the Re-testing level, the Buy signal is given to our members.</p>\r\n\r\n<p>This is the reason for Buying USD/JPY.</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/ae1e5c56edbfeee3a4d128614fe50b78.jpeg" /></p>\r\n\r\n<p>Finally, market reached our profit target successfully.</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>Don&amp;rsquo;t Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at&nbsp;&amp;ldquo;<strong>Premium</strong>&amp;rdquo; (or) &amp;ldquo;<strong>pro</strong>&amp;rdquo; Signal Plan. Join here : <a href="https://www.bossforexsignal.com/join">https://www.bossforexsignal.com/join</a></p>\r\n\r\n<p>If you are interested to learn our forex strategies, please register</p>\r\n\r\n<p>Thank you !</p>\r\n', 1, 1501174800, 1, '/post/de17964fcd4eeb7f4dc3d2a309da3809', 'jpg', 4, 1501490360, 1, '+706 Points Reached Successfully in USD/JPY Buy Signal', '+706 Points Reached Successfully in USD/JPY Buy Signal', 0),
(53, '+800 Points Reached in CAD/CHF Sell Signal', '+800 Points Reached in CAD/CHF Sell Signal', '<p><strong>Reason for Selling CAD/CHF :</strong></p>\r\n\r\n<p>CAD/CHF was moving in an uptrend by forming Higher Highs and Higher Lows.</p>\r\n\r\n<p>Breakout happens in CAD/CHF at the bottom level of the range. This confirms the Sellers overtake the Buyers in CAD/CHF.</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/76af70e9474f46b27ac40e0ab8cb355d.jpeg" style="width:100%" /></p>\r\n\r\n<p>CAD/CHF Sell Signal was given to our members only after the confirmation of downward movement.</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/139f28177386af000421fb36f035d183.jpeg" style="width:100%" /></p>\r\n\r\n<p>Finally market reached our Profit Target Successfully.</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>Don&amp;rsquo;t Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signal Plan. Join here :<a href="https://www.bossforexsignal.com/join">https://www.bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nbossfx Team.</p>\r\n', 1, 1502902800, 1, '/post/93d90bed26e5c9f58f361f5d47137085', 'jpeg', 4, 1503318651, 1, '+800 Points Reached in CAD/CHF Sell Signal', '+800 Points Reached in CAD/CHF Sell Signal', 0),
(54, '+1300 Points Reached in EUR/USD Sell Signal', '+1300 Points Reached in EUR/USD Sell Signal', '<p>Reason for Selling EUR/USD :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>EUR/USD is moving in an uptrend for long time since January 2017 to till now.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>As per our Previous updates on EUR/USD, market has made a breakout at the top level and starts to keep moving up strongly.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Now, the reason for selling EUR/USD is &quot;Market was moving up and down between the ranges in an strong uptrend&quot;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>But, Market breakout the bottom level of the range.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/e71deb6612ade952371324760b634d5a.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We have given the sell signal after the&nbsp;confirmation of Breakout and downward movement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/6c7d80b26d62c6c6d3ff0b2d21a3d65c.jpg" style="width:100%" /></p>\r\n\r\n<p>Finally, EUR/USD reaches our Profit Target Successfully.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If you are interested to learn our forex strategies, please click here to contact now.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1502989200, 1, '/post/b11d3d1782b2c4d3ca1ad2cc2fbbb63d', 'jpg', 4, 1503312646, 1, '', '', 0),
(55, '+602 Points Reached in EUR/GBP Buy Signal', '+602 Points Reached in EUR/GBP Buy Signal', '<p><strong>Reason for Buying EUR/GBP :</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>EUR/GBP is moving in an uptrend between the ranges.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/5026b75564d71c22e7d805bb3fd18ebb.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Market is trying to breakout the top level harder for a long time.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We expect EUR/GBP will keep moving up more.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This is the reason for giving Buy signal on EUR/GBP.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/621026195ad59308bffa2ff467fc2116.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Finally market reached our Profit Target successfully.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1503248400, 1, '/post/e01c9c43273b68264dae99ba6aae791a', 'jpg', 4, 1503367869, 1, '+602 Points Reached in EUR/GBP Buy Signal', '+602 Points Reached in EUR/GBP Buy Signal', 0),
(56, '+2450 Points Profit Reached in NZD/CAD Sell Signal', '+2450 Points Profit Reached in NZD/CAD Sell Signal', '<p><strong>Reason for Selling NZD/CAD :</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>NZD/CAD was moving between the ranges for long time in H1 chart.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Breakout Happens at the bottom level of the range.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/0565aff44c3fa1428c133239fa13294c.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>After Breakout, Market Re-tested the Breakout Level for 2 times and went down more.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Sell Signal was given after the Double confirmation of downward movement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Finally Market reached our Profit Target Successfully.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/4b1cce0b22fcc1aa5c1bb839d79f1a05.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1503421200, 1, '/post/ceb6426916d3338e61451201e57ed3c0', 'jpg', 4, 1503568159, 1, '+2450 Points Profit Reached in NZD/CAD Sell Signal', '+2450 Points Profit Reached in NZD/CAD Sell Signal', 0),
(57, '+1096 Points Reached in EUR/GBP Buy Signal', '+1096 Points Reached in EUR/GBP Buy Signal', '<p><strong>Reason for Buying EUR/GBP :</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>EUR/GBP is moving in an uptrend between the ranges.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/c4c01c1f5a4eda011913eb8e91b3c08c.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Market is trying to breakout the top level harder for a long time.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We expect EUR/GBP will keep moving up more.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This is the reason for giving Buy signal on EUR/GBP.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/6631c62d561f0542df5f13ef0f0acad5.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Finally market reached our Profit Target successfully.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1503421200, 1, '/post/5703b455a06e2c71679e77ba81b64276', 'jpg', 4, 1503570008, 1, '+1096 Points Reached in EUR/GBP Buy Signal', '+1096 Points Reached in EUR/GBP Buy Signal', 0),
(58, 'CHF/JPY starts to move up and down between the ranges. Let’s wait for the confirmation of good opportunity trades', 'CHF/JPY starts to move up and down between the ranges. Let’s wait for the confirmation of good opportunity trades', '<p><strong>CHF/JPY Analysis :&nbsp;</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>After CHF/JPY reaching the top price level 118, market starts to fall down continuously.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/24c756236738cac548679237a5eb7b67.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Now, market is moving&nbsp;at the ranging levels between 112 and 115.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If market fails to breakout the&nbsp;bottom level 112, we can expect some upward movement between the ranges.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If market breakout the bottom level, we can expect around 2000 points (200 pips) downward movement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://www.bossforexsignal.com/./uploads//ck-editor/4f0c06f80e40b328f00a6f37bac9fc9b.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Big Good Buying Opportunity on CHF/JPY arrives when the market starts to reverse from the bottom of the trend level 110.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1503507600, 1, '/post/29e22b4f238eefd3fa545413c490bb0f', 'jpg', 6, 1508064856, 1, 'CHF/JPY starts to move up and down between the ranges. Let’s wait for the confirmation of good opportunity trades', 'CHF/JPY starts to move up and down between the ranges. Let’s wait for the confirmation of good opportunity trades', 0),
(61, '+750 Points Profit Reached in CAD/JPY Buy Signal', '+750 Points Profit Reached in CAD/JPY Buy Signal', '<p><strong>Reason for Buying CAD/JPY :</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>CAD/JPY is moving up slowly between the ranges.</strong></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="boss" target="_blank"><img alt="boss" src="https://www.bossforexsignal.com/./uploads//ck-editor/3739389596eecd937acd053a71486be1.jpg" style="width:100%" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The increase in number of buyers in CAD has made the CAD/JPY to keep moving up more.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Buy signal was given to our members &nbsp;after the confirmation of reversal from bottom level.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="boss" src="https://www.bossforexsignal.com/./uploads//ck-editor/010e11139246f2e2dba7b6ea7d255ba0.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Finally market reached our Profit Target successfully.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1503594000, 1, '/post/8b3bb62a101218325514d7752c21533e', 'jpg', 4, 1503918842, 1, '+750 Points Profit Reached in CAD/JPY Buy Signal', '+750 Points Profit Reached in CAD/JPY Buy Signal', 0),
(67, '+1902 Points Profit Reached in EUR/GBP Buy Signal', '+1902 Points Profit Reached in EUR/GBP Buy Signal', '<p><strong>Reason for Buying EUR/GBP :</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>EUR/GBP is moving in an uptrend between the ranges.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/d85d6c3407e016aa01b05f53c9e6fb1d.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Market is trying to breakout the top level harder for a long time.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We expect EUR/GBP will keep moving up more.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This is the reason for giving Buy signal on EUR/GBP.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/2dd2b092f722dddc48631ebb79d6f99b.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Finally market reached our Profit Target successfully.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1508346000, 1, '/post/29778422e5af3f769c498ffbbb639aed', 'jpg', 4, 1509685304, 1, '+1902 Points Profit Reached in EUR/GBP Buy Signal', '+1902 Points Profit Reached in EUR/GBP Buy Signal', 0),
(68, '+750 Points Profit Reached in CHF/JPY Buy Signal', '+750 Points Profit Reached in CHF/JPY Buy Signal', '<p><strong>Reason for Buying CHF/JPY :</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>CHF/JPY is moving in downtrend between the ranges in H1 Chart.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/445985c0a07b0cd86b8f4ee91f5af082.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>After breakout happens at the top level, CHF/JPY fall back again for re-testing the previous breakout level.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>After the confirmation of Upward movement, the Buy signal was given to our members.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/16cfda97de75776e98e32cabee8fb3a0.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Finally market reached our Profit Target successfully.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1503939600, 1, '/post/9b96d1b4855947c5ba129870542bd299', 'jpg', 4, 1508065101, 1, '+750 Points Profit Reached in CHF/JPY Buy Signal', '+750 Points Profit Reached in CHF/JPY Buy Signal', 0),
(69, 'FREE SIGNAL TRADING', 'FREE SIGNAL TRADING', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/f2f7f6ff2c509b41e11c5904d0c7d549.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1507654800, 1, '/post/68fdbd50080fa0768d4db16d0479ab74', 'jpg', 7, 1508064969, 1, 'FREE SIGNAL TRADING', 'FREE SIGNAL TRADING', 0),
(70, '+804 point profit reached in USDCAD successfully', '+804 point profit reached in USDCAD successfully', '<p><strong>+804 point profit reached in USDCAD successfully &nbsp;&nbsp;</strong></p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/b15d6b6f58b0e167c77f006b3ae2ca0e.jpeg" style="width:100%" />&nbsp;</p>\r\n\r\n<p>save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1504026000, 1, '/post/f9d8059f24db7b62c490f3f22cfc2747', 'jpeg', 4, 1504061816, 1, '+804 point profit reached in USDCAD successfully', '+804 point profit reached in USDCAD successfully', 0),
(71, '-760 point reached in NZDUSD buy signal.', '-760 point reached in NZDUSD buy signal.', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/90b62ca7a221ff48112e6b6f6d9d1f6b.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1504112400, 1, '/post/0fdb01f647a9c7f0b89700c178a0b033', 'jpg', 4, 1508064897, 1, '-760 point reached in NZDUSD buy signal.', '-760 point reached in NZDUSD buy signal.', 0);
INSERT INTO `content_posts` (`ID`, `title`, `summary`, `content`, `userid`, `timestamp`, `comments`, `image`, `ext_image`, `categoryid`, `last_updated`, `last_updated_userid`, `seo_title`, `seo_description`, `loggedin`) VALUES
(72, '+1447 Point Profit Reached in USDCAD Successfully', '+1447 point profit reached in USDCAD successfully.', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/0aab62a47e3c0340bfbe8be8ec45e84a.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1507222800, 1, '/post/bdce86fd7121a5c128f562c42f5b1b02', 'jpg', 4, 1508065083, 1, '+1447 Point Profit Reached in USDCAD Successfully', '+1447 Point Profit Reached in USDCAD Successfully', 0),
(73, 'We Like Selling USD/CAD', 'We Like Selling USD/CAD', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/6e2f0ed5c03ef6b73cd49cff73b5686d.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We like selling USD/CAD following weak US payrolls data and strong Canadian GDP and in the week of the Bank of Canada meeting.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We ultimately expect the BoC to remain on hold but strongly signal a rate hike in October and maintain a bullish and optimistic view.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Still, the balance of risks point to CAD appreciation after the meeting.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1504544400, 1, '/post/5b03bc84e757d40d1451bbeb3ce712ff', 'jpg', 6, 1508064926, 1, 'We Like Selling USD/CAD', 'We Like Selling USD/CAD', 0),
(74, '+1115 Points Profit Reached in EURCAD Sell Signal', '*+1115 Points Profit Reached in EURCAD Sell Signal*', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/71718a2333bf23c1260b88a225ce6e1e.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1509296400, 1, '/post/24515a0404f677a5097c23ef5a50d7b4', 'jpg', 4, 1509685158, 1, '+1115 Points Profit Reached in EURCAD Sell Signal', '+1115 Points Profit Reached in EURCAD Sell Signal', 0),
(75, '+1171 Points Profit Reached in AUDUSD Buy Signal', '*+1171 Points Profit Reached in AUDUSD Buy Signal*', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/0583673ef0de339000eb6e9472553e2e.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1504544400, 1, '/post/08aefd6d873bdda45e9c00d15bb2994d', 'jpg', 4, 1509352672, 1, '+1171 Points Profit Reached in AUDUSD Buy Signal', '+1171 Points Profit Reached in AUDUSD Buy Signal', 0),
(76, '+ 2623 Points Profit Reached in EURCAD sell Signal', '', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/2a3e3955fdf5402aced1b9177471f91e.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1506618000, 1, '/post/ebaffa78f35dc738036304e0f73ee161', 'jpg', 4, 1508065018, 1, '+ 2623 Points Profit Reached in EURCAD sell Signal', '+ 2623 Points Profit Reached in EURCAD sell Signal', 0),
(77, '+ 847 Points Profit Reached in GBPNZD Buy Signal Succesfully', '', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/c9ad8b8817f13bd4d4f643f192893d10.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1509123600, 1, 'default', 'png', 4, 1509685199, 1, '+ 847 Points Profit Reached in GBPNZD Buy Signal Succesfully', '+ 847 Points Profit Reached in GBPNZD Buy Signal Succesfully', 0),
(78, 'Close Partial USDCAD +2749 Points', '', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/9f92517a46f3b9c0f055c8f9fd665708.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1504630800, 1, '/post/dd7ce7b47f78e4a5ed5b97d2e555ef53', 'jpg', 4, 1508064787, 1, 'Close Partial USDCAD +2749 Points', 'Close Partial USDCAD +2749 Points', 0),
(79, '-600 Points Loss Sell Signal in CADJPY', '-600 Points Loss Sell Signal in CADJPY', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/76f580d9b6e9ef6e92843c20cb1ba692.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1507654800, 1, '/post/05a1b1798fb8868e4be4be376d26822e', 'jpg', 4, 1509685281, 1, '-600 Points Loss Sell Signal in CADJPY', '-600 Points Loss Sell Signal in CADJPY', 0),
(80, '+1635 point profit reached in GBPNZD buy signal succesfully', '', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/e34eeb88d2f75785b418cb751a1e91d5.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1504717200, 1, '/post/45775745623e85e1831837cf8b0765b1', 'jpg', 4, 1505096717, 1, '+1635 point profit reached in GBPNZD buy signal succesfully', '+1635 point profit reached in GBPNZD buy signal succesfully', 0),
(81, 'CONGRATULATION TOTAL GROWT +6935 POINT', '', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/86ae2e63a450032c5bb53cec83bbd826.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1504890000, 1, '/post/ee117c154f2028691539e64db5a4f200', 'jpg', 8, 1505096664, 1, 'CONGRATULATION TOTAL GROWT +6935 POINT', 'CONGRATULATION TOTAL GROWT +6935 POINT', 0),
(82, 'Economy calander 11-15 September 2017', ': BoE Meeting, Inflation and US Retail Sales', '<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">&nbsp;&nbsp;&nbsp;&nbsp;</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">Last week the greenback weakened against all major currencies and gold due to differences among FOMC members regarding interest rate hikes, the occurrence of natural disasters in the form of hurricane Irma in Florida that impact on economic activity, government shutdown issues and tensions between North Korea and the US that has not been over .</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">Fed Governor Lael Brainard said the central bank should not hastily raise interest rates because inflation is still low, while William Dudley expects inflation to rise again and the Fed should keep raising interest rates gradually. The greenback had rebounded after the US congress agreed to raise the upper limit of the country&#39;s debt and provide government funds until December to avoid government shutdown as of 2013.&nbsp;&nbsp; <img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/abdf6fb4ea636b2739254faf237278be.png" style="width:100%" /></div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">&nbsp;</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">&nbsp;</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">What was important to note last week was the second straight BoC rate hike, and the failure of ECB president Mario Draghi to dampen the euro&#39;s strength. As some analysts had predicted, BoC again raised interest rates by 0.25% as the second-quarter economic growth gained significantly so that the CAD rose sharply versus the USD to a two-year high.</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">While Draghi at the press conference did not address the high EUR exchange rate but announced a reduction in the stimulus that is likely to be done next month so that the European single currency bounced to its highest level since December 2014 versus the USD. This week there is no important data either from Canada or Eurozone, and it is estimated that both currencies are still likely to strengthen.</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">This week&#39;s focus is on inflation data and US retail sales, as well as BoE meetings. Inflation and retail sales are the last important data before the FOMC meeting on 20-21 next week, and which is a polemic among fellow FOMC members. Will inflation rebound, or even decline? According to August inflation analyst estimates will rise 1.8% compared to the previous 1.7% rise, but total retail sales will drop to + 0.1% compared to July&#39;s + 0.6%.</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">In addition to the US, the UK will also release inflation and labor data in August before the BoE meeting. It is estimated that the UK&#39;s central bank has not changed its interest rate by + 0.25%, but the voting results in the minutes will affect the movement of the GBP. As it was known last June there were 3 MPC members who voted for an interest rate hike option, but August fell to 2. The important thing to note for this meeting is the new deputy governor Sir Dave Ramsden following Kristin Forbes replacement by more dovish Silvana Tenreyro.</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">Other important data are the LibBree SNB rate, Australian workforce, US PPI, UoM US consumer confidence index, Industrial Production China, JOLTS AS and US Jobless Claims.</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">&nbsp;</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px"><strong>Monday, September 11, 2017:</strong><br />\r\n06:50 WIB: Core Machinery Orders data in Japan in July 2017<br />\r\n13:00 WIB: Data Machine Tool Orders in Japan in August 2017<br />\r\n19:15 WIB: Housing Starts data in Canada in August 2017</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px"><strong>Tuesday, September 12, 2017:</strong><br />\r\n08:30 WIB: Australian Business Confidence Index of NAV in August 2017&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15:30 WIB: UK Consumer Price Index (CPI) and Producer Price Index (PPI) data in August 2017<br />\r\n21:00 WIB: Job Openings and Labor Turnover Summary (JOLTS) US data in July 2017</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px"><strong>Wednesday, September 13, 2017:</strong><br />\r\n7:30&nbsp; WIB: Westpac Australia&#39;s consumer confidence index of September 2017<br />\r\n14:15 WIB: Swiss PPI data in August 2017<br />\r\n15:30 WIB: the average wage index in the UK in July 2017 (3m / y)<br />\r\n15:30 WIB: UK Jobless Claims data of August 2017<br />\r\n15:30 WIB: unemployment rate data in the UK in July 2017<br />\r\n16:00 WIB: Industrial Euro Production data of July 2017<br />\r\n19:30 WIB: US PPI data in August 2017<br />\r\n&nbsp;21:30 am: oil inventory data for industry in the US as of September 8, 2017</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px"><strong>Thursday, September 14, 2017:</strong><br />\r\n06:15 WIB: RBA governor&#39;s assistant speechman Guy Debelle<br />\r\n08:30 WIB: Employment Change data and Australia unemployment rate in August 2017<br />\r\n09:00 WIB Time: China Industrial Production data in August 2017<br />\r\n&nbsp;14:30 WIB: the announcement of the SNB LibB interest rate in September 2017 and the projection of the SNB monetary policy<br />\r\n18:00 WIB: BoE meeting result: interest rate announcement, Asset Purchase Facility and BoE monetary policy summary of September 2017<br />\r\n18:00 WIB: BoE meeting minutes today (14 September 2017)<br />\r\n&nbsp;7:30&nbsp; WIB: US CPI data is August 2017<br />\r\n19:30 WIB: Jobless Claims US data per September 8, 2017<br />\r\n19:30 WIB: the housing price index in Canada in July 2017<br />\r\n22:30 WIB: Bundesbank German President Jens Weidmann&#39;s speech</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px"><strong>Friday, September 15, 2017</strong>:<br />\r\n&nbsp;5:30 WIB: New Zealand Business NZ Manufacturing index of August 2017<br />\r\n15:50 WIB: speech MPC member BoE Gertjan Vlieghe<br />\r\n7:30&nbsp; WIB: US Retail Sales data of August 2017<br />\r\n20:15 WIB: US Industrial Production data in August 2017<br />\r\n21:00 WIB: US University of Michigan (UoM) consumer confidence index of September 2017 (Preliminary)</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">&nbsp;TIME TO GMT +7</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">&nbsp;</div>\r\n\r\n<div style="background:#eee; border:1px solid #ccc; padding:5px 10px">Description: Latest news updates related to fundamental indicators can be obtained in <a href="http://seputarforex.com">http://seputarforex.com</a></div>\r\n', 1, 1505062800, 1, '/post/1e0c290ac8da32360d376a907059bd7f', 'png', 9, 1505096647, 1, 'Economy calander 11-15 September 2017', 'Economy calander 11-15 September 2017', 0),
(83, '18-22 September 2017: FOMC Dan BoJ Meeting, UK Retail Sales', '18-22 September 2017: FOMC Dan BoJ Meeting, UK Retail Sales', '<p><strong>last week:</strong></p>\r\n\r\n<p>North Korea&#39;s missile strikes and weak retail sales data do not affect the strong USD peg versus all major currencies except GBP. US retail sales data last month have reflected the impact of Harvey storms in Texas. Earlier, the greenback was higher on inflation data (PPI and CPI) and better-than-expected jobless claims.</p>\r\n\r\n<p>GBP&#39;s gain to its highest level since last year&#39;s Brexit referendum was attributed to the hawkish BoE meeting minutes by hinting at cuts in next month&#39;s stimulus and possible rate hikes. This possibility is also supported by MPC member statements. Previously GBP rose as inflation in August climbed back 2.9%, the highest in 3 months and close to the upper limit of the central bank 3.0%.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/e90582037af56d57426c378061c464c9.png" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>this week:</strong></p>\r\n\r\n<p>This week will be held meeting of two central banks namely the Fed (FOMC) and BoJ. FOMC meeting this month will be accompanied by economic projection and press conference Fed chairman Janet Yellen. The Fed rate is expected to remain at 1.00% to 1.25%. The main focus of the market will be on reducing the amount of USD 4.5 trillion stimulus as hinted at earlier meetings, and economic projection updates especially the dot plot of interest rate hikes.</p>\r\n\r\n<p>Rising inflation in August by 1.9%, the highest in 3 months, will certainly make Yellen more confident and the possibility of rising interest rates in December will increase again. An update of better economic projections and a hint of an increase in interest rates will lead to the greenback resuming the rally. Conversely, if Yellen&#39;s comments and statements are considered dovish.</p>\r\n\r\n<p>The BoJ is not expected to change its monetary policy due to low levels of inland despite second quarter growth of 0.6%, the highest since 2015. The BoJ is the only major currency-state central bank that is still dovish.</p>\r\n\r\n<p>In addition to the FOMC and BoJ, this week the market will also pay attention to UK retail sales which are important data for rate hikes besides inflation, Manufacturing PMI Eurozone, RBA meeting minutes, CPI Canada, US housing data, German ZEW index and US Jobless Claims.</p>\r\n\r\n<p><em><strong>TIME : (GMT + 7)</strong></em></p>\r\n\r\n<p><strong>Monday, September 18, 2017:</strong><br />\r\nBank holidays in Japan (Aged day)<br />\r\n16:00 WIB: Euro Consumer Price Index (CPI) data of Euro area in August 2017 (Final)<br />\r\n19:30 WIB&nbsp;Foreign Securities Purchases data is in Canada in July 2017<br />\r\n21:00 WIB: US housing price index in September 2017</p>\r\n\r\n<p><strong>Tuesday, September 19, 2017:</strong><br />\r\n08:30 WIB: RBA meeting minutes on September 5, 2017<br />\r\n08:30 WIB: the housing price index in Australia in the second quarter of 2017<br />\r\n15:00 WIB: Current Euro Area Account data of July 2017<br />\r\n16:00 WIB: German ZEW Economic Sentiment index and Euro area in September 2017<br />\r\n19:30 WIB: Building Permits and Housing Starts data in the US in August 2017<br />\r\n19:30 WIB: US Current Account data for the second quarter of 2017<br />\r\n19:30 WIB: Manufacturing Sales Canada data for July 2017<br />\r\nTentative time: Global Dairy Trade (GDT) price index (Impact on NZD)</p>\r\n\r\n<p><strong>Wednesday, September 20, 2017:</strong><br />\r\n05:45 WIB: New Zealand Current Account data of the second quarter of 2017<br />\r\n06:50 WIB: Japanese trade balance data for August 2017<br />\r\n15:30 WIB: UK Retail Sales data of August 2017<br />\r\n21:00 WIB: US Existing Home Sales data of August 2017<br />\r\n21:30 WIB: oil inventory data for industry in the US as of September 15, 2017</p>\r\n\r\n<p><strong>Thursday, September 21, 2017:</strong><br />\r\n&nbsp;01:00 WIB: FOMC meeting result: FOMC statement, September Fed interest rate announcement in 2017 and US economic projection<br />\r\n&nbsp;01:30 WIB: the FOMC press conference attended by Fed chairman Janet Yellen<br />\r\n&nbsp;05:45 WIB: Gross Domestic Product (GDP) data of New Zealand in the second quarter of 2017<br />\r\nTentative time: BoJ meeting result: September 2010 interest rate announcement and BoJ monetary policy statement<br />\r\n13:30 WIB: BoJ press conference attended by governor Haruhiko Kuroda<br />\r\n15:30 WIB: Public Sector Net Borrowing UK data in August 2017<br />\r\n19:30 WIB: Jobless Claims US data per September 15, 2017<br />\r\n19:30&nbsp;WIB: US Philly Fed Manufacturing index in September 2017<br />\r\n&nbsp;7:30 &nbsp;WIB: Wholesale Sales Canada data is July 2017<br />\r\n21:00 WIB: Eurostat Euro Eurostat consumer confidence index in September 2017</p>\r\n\r\n<p><strong>Friday, September 22, 2017:</strong><br />\r\n14:00 WIB: Flash Manufacturing PMI and PMI France Manufacturing PMI index in September 2017<br />\r\n14:30 WIB: PMI Flash Manufacturing and PMI Germany Manufacturing PMI index in September 2017<br />\r\n15:00 WIB: PMI Flash Manufacturing index and Flash Services PMI Euro area in September 2017<br />\r\n7:30 &nbsp; WIB:&nbsp;Western Indonesia Time: August CPI data of August 2017<br />\r\n20:45 WIB: Flash Manufacturing Index PMI US Markit vesi September 2017</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Description: Latest news update related to fundamental indicators can be obtained at seputarforex.com</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1505667600, 1, '/post/f4db282568764040edf8a3921bc2fedc', 'png', 9, 1505703900, 1, '18-22 September 2017: FOMC Dan BoJ Meeting, UK Retail Sales', '18-22 September 2017: FOMC Dan BoJ Meeting, UK Retail Sales', 0),
(84, '+800 Points Profit Reached Successfully in AUD/JPY Sell Signal', '+800 Points Profit Reached Successfully in AUD/JPY Sell Signal', '<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/27b26fd0ddda7df19a563bda202297fa.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>+800 Points Profit Reached Successfully in AUD/JPY Sell Signal</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways with the help of Forex Experts team. Don&#39;t Trade forex market all the time, trade forex only at good opportunities available in the market&nbsp;Trade Forex market in technical ways with the help of Forex Experts team. Don&amp;rsquo;t Trade forex market all the time, trade forex only at good opportunities available in the market. Get more Good Opportunity Technical Trade Signals at Premium Signal Plan. Join here : &nbsp;<a href="http://www.bossforexsignal.com/join">http://www.bossforexsignal.com/join</a> Thanks</p>\r\n', 1, 1506618000, 1, '/post/60407934dd2890c5f72c20323aac5c47', 'jpg', 4, 1506679180, 1, '+800 Points Profit Reached Successfully in AUD/JPY Sell Signal', '+800 Points Profit Reached Successfully in AUD/JPY Sell Signal', 0),
(85, 'AUDUSD TRADE IDEA for long term', 'AUDUSD TRADE IDEA', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/47689d6d0e00b5d637b11539091ae1e9.jpg" style="width:100%" /></p>\r\n\r\n<p>trade idea: The price came closer to a big demand zone around the 0.7700 level and the price could retest the major ascending triangle it just broke out of a few weeks ago.</p>\r\n\r\n<p>From now, we should start to prepare for a potential long please wait for confirmation from us and join in premium member for accurate signal.</p>\r\n\r\n<p>Premium Signal Plan. Join here : &nbsp;<a href="http://www.bossforexsignal.com/join">http://www.bossforexsignal.com/join</a> Thanks</p>\r\n', 1, 1506618000, 1, '/post/f80d30104496cb254753fb988aa9f723', 'jpg', 6, 1506946750, 1, 'AUDUSD TRADE IDEA for long term', 'AUDUSD TRADE IDEA for long term', 0),
(86, 'USD/JPY Analysis 12 oct 2017', 'USD/JPY Analysis', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/e116874d60d943723319912ffe6f417a.jpg" style="width:100%" />USD/JPY Analysis : USD/JPY reaches the top level for 4th time in Daily Chart. Now, market struggles to breakout the top zone. Let&#39;s wait for the confirmation of Reversal (or) Breakout from this top level to make good profits on USD/JPY. Thank youTrade Forex market in technical ways with the help of Forex Experts team. Don&amp;rsquo;t Trade forex market all the time, trade forex only at good opportunities available in the market. Get more Good Opportunity Technical Trade Signals at Premium Signal Plan. Join here : &nbsp;http://www.bossforexsignal.com/join Thanks</p>\r\n', 1, 1507741200, 1, '/post/2041f837cf55016571d7c77bef2737ba', 'jpg', 6, 1507818190, 1, 'USD/JPY Analysis 12 oct 2017', 'USD/JPY Analysis 12 oct 2017', 0),
(87, '-728 point loss reached buy signal', '-728 point loss reached buy signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/ecfd7c0ca1ba6df453241e05b9248be4.jpg" style="width:100%" /></p>\r\n\r\n<p>-728 point loss reached buy signal</p>\r\n\r\n<p>Reason for Selling EUR/USD : EUR/USD was moving up and down between the ranges in Downtrend. After market reaching the top zone, we expect the continuation of downtrend in H1 chart. This is the reason for giving sell signal to our members. But market broken the top level and starts to move up. Finally, market reaches our stop loss price. Thank you.', 1, 1507741200, 1, '/post/2c53b188d8be53f531bd0797e22ee8d5', 'jpg', 4, 1507818749, 1, '-728 point loss reached buy signal', '-728 point loss reached buy signal', 0),
(88, 'FREE signal 19 oct 2017', 'FREE signal 19 oct 2017', '<p>&nbsp;</p>\r\n\r\n<p>Reason for Buying CAD/JPY : CAD/JPY bouncing up from the previous breakout level in Daily Chart.</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/2bfbb1313a23e9cc576190d8773645bf.png" style="width:100%" />Forex Signal :<br />\r\nBuy CAD/JPY between 90.60 and 90.40<br />\r\nTarget 1 : 91.20<br />\r\nTarget 2 : 92.00<br />\r\nTarget 3 : 92.80<br />\r\nStop loss : 89.75</p>\r\n', 1, 1508346000, 1, '/post/4affd7be24b055a9f1e6463e34d6e36c', 'png', 6, 1508394373, 1, 'FREE signal 19 oct 2017', 'FREE signal 19 oct 2017', 0),
(89, '+790 point profit reached successfully in NZDUSD sell signal. ', '', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/80059d282036f66e4cd01f8fa840a219.jpg" style="width:100%" /></p>\r\n\r\n<p>+790 point profit reached successfully in NZDUSD sell signal. ', 1, 1508518800, 1, '/post/98ef923758642fc7833491f8ef5a005f', 'jpg', 4, 1508549044, 1, '+790 point profit reached successfully in NZDUSD sell signal. ', '+790 point profit reached successfully in NZDUSD sell signal. ', 0),
(90, '+2303 Points Reached Successfully in NZD/USD Sell Signal', '+2303 Points Reached Successfully in NZD/USD Sell Signal.', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/a30d53a3039dee70073690a5c1de36f3.jpg" style="width:100%" /></p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1509382800, 1, '/post/1a9a5133b951d76ea742e423c4ce6578', 'jpg', 4, 1509685443, 1, '+2303 Points Reached Successfully in NZD/USD Sell Signal', '+2303 Points Reached Successfully in NZD/USD Sell Signal', 0),
(91, '+1296 Points Reached Successfully in EURUSD Sell Signal', '+1296 Points Reached Successfully in EURUSD Sell Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/5ecd6f74bd3e2ad608cd117165193950.jpeg" style="width:100%" /></p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1509469200, 1, '/post/d0b3f54ebaae7d5b16bfd86f0b92d738', 'jpeg', 4, 1509686356, 1, '+1296 Points Reached Successfully in EURUSD Sell Signal', '+1296 Points Reached Successfully in EURUSD Sell Signal', 0),
(92, '+562 point profit reachead succesfully sell EURCAD', '+562 point profit reachead succesfully sell EURCAD', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/7d5934aa421cc9da8fa2a54d9aeeda3a.jpg" style="width:100%" /></p>\r\n\r\n<p>+562 point profit reachead succesfully sell EURCAD</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1509987600, 1, '/post/fc86bf3fd157652d265450e075e8a052', 'jpg', 4, 1510026066, 1, '+562 point profit reachead succesfully sell EURCAD', '+562 point profit reachead succesfully sell EURCAD', 0),
(93, '+667 Points Profit Reached Successfully in EURGBP BUY Signal', '+667 Points Profit Reached Successfully in EURGBP BUY Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/c3b7f1cdc1e89b0c844626d96ce9caf5.jpeg" style="width:100%" /></p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal...</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1510506000, 1, '/post/8cbb54155fbfa4c116f3c02b43cfdf3d', 'jpeg', 4, 1510536257, 1, '+667 Points Profit Reached Successfully in EURGBP BUY Signal', '+667 Points Profit Reached Successfully in EURGBP BUY Signal', 0),
(94, '+2233 Points Profit Reached Successfully in EURNZD BUY', '+2233 Points Profit Reached Successfully in EURNZD BUY', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/b78f1a5017d9b68af0a17bf89939127b.jpeg" style="width:100%" /></p>\r\n\r\n<p>Watchlist: New very interesting setup for EURNZD showing up.&nbsp; Price is retesting a huge demand zone and is sitting at the 1.6630 daily support level. On daily timeframe the price is just retesting an ascending daily trendline. On hourly timeframe this pair has formed a beautiful and accurate falling wedge. Currently, we are waiting for a breakout of this wedge to buy this pair. The highlighted green zone is the preferred entry area.</p>\r\n', 1, 1510765200, 1, '/post/fa5eef8305b95d0aad4940b7b2ad1dad', 'jpeg', 6, 1510808705, 1, '+2233 Points Profit Reached Successfully in EURNZD BUY', '+2233 Points Profit Reached Successfully in EURNZD BUY', 0),
(95, 'AUD, NZD : Most Vulnerable to housing related risk Whats the trade?', 'AUD, NZD : Most Vulnerable to housing related risk Whats the trade?', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/c90c893efd385bacf4c597aa05700e63.PNG" style="width:100%" /></p>\r\n', 1, 1510765200, 1, '/post/0db72e8a8d18e944e28347163009dbae', 'jpg', 9, 1510809078, 1, 'AUD, NZD : Most Vulnerable to housing related risk Whats the trade?', 'AUD, NZD : Most Vulnerable to housing related risk Whats the trade?', 0),
(96, 'NOMURA : GBP where to nposition ahead of the important EU summit on DEC 14-15', 'NOMURA : GBP where to nposition ahead of the important EU summit on DEC 14-15', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/e6ea9a50691494a1fce7e8c027445801.PNG" style="width:100%" /></p>\r\n', 1, 1510765200, 1, '/post/aee887917cf6ec9964cfb36536595193', 'jpg', 9, 1510809490, 1, 'NOMURA : GBP where to nposition ahead of the important EU summit on DEC 14-15', 'NOMURA : GBP where to nposition ahead of the important EU summit on DEC 14-15', 0),
(97, 'EUR/NZD Into Resistance- Pullback to Offer Entries.', 'EUR/NZD Into Resistance- Pullback to Offer Entries', '<p><strong>EURNZD Daily</strong></p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/15e82dbdc88f808fe9b2eda25185d9eb.jpeg" style="width:100%" /></p>\r\n\r\n<p><strong>Technical Outlook: </strong>EURNZD rebounded off confluence support earlier this week at <strong>1.5122</strong> where the 38.2% retracement of the 2017 range converges on down-slope support. The rally is now testing initial resistance at the trendline extending off the yearly high. The broader focus for the pair remains weighted to the topside while above the <strong>1.50</strong>-handle (bullish invalidation) with a breach here once again targeting key resistance at <strong>1.5451/84</strong>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>EURNZD 240min</strong></p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/1f328930c8d0e78c5b65aacf826cf742.jpeg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Notes: </strong>A closer look at price action highlights near-term confluence resistance at <strong>1.5290</strong>. Look for a reaction here with the immediate long-side vulnerable below this mark. Interim support now at the monthly open / low-day close at <strong>1.5180/99</strong> &amp;ndash; area of interest for exhaustion / long-entries.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>A breach higher eyes subsequent resistance objectives at <strong>1.5336</strong>, the <strong>1.54</strong>-handle &amp; <strong>1.5451/83</strong>. A quarter of the daily average true range (ATR) yields profit targets of 24-28 pips per scalp. Added caution is warranted heading into the New Zealand Consumer Price Index (CPI) tonight with the release likely to fuel increased volatility in the Kiwi crosses.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Relevant Data Releases</strong></p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/78c909e381be7f8dd712f9c2a9356480.jpg" style="width:100%" /></p>\r\n', 1, 1510765200, 1, '/post/1443a297e2be7518726aace31783398b', 'jpeg', 6, 1510811001, 1, 'EUR/NZD Into Resistance- Pullback to Offer Entries.', 'EUR/NZD Into Resistance- Pullback to Offer Entries.', 0),
(98, 'Enjoy our 50% subcribe for premium package.', 'Enjoy our 50% subcribe for premium package.', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/80a761092329e2f80d89d32086e44569.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>------- BLACK FRIDAY ---------<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SALE WEEK ALERT</p>\r\n\r\n<p>Hello Trader,</p>\r\n\r\n<p>Enjoy our 50% subcribe for premium package signal on &quot;black friday sale&quot;. Take your signal and get more advantages from subcribe our premium channel ', 1, 1511456400, 1, '/post/a2fd4cfa8c07e2ba46f4a2d9a422b4f3', 'jpg', 1, 1511488951, 1, 'Enjoy our 50% subcribe for premium package.', 'Enjoy our 50% subcribe for premium package.', 0),
(99, '+511 Points Profit Reached Successfully in USD/CAD Sell Signal', '+511 Points Profit Reached Successfully in USD/CAD Sell Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/ee1d1c43e2bf66289939b78f2c4d3307.jpg" style="width:100%" /></p>\r\n\r\n<p>+511 Points Profit Reached Successfully in USD/CAD Sell Signal</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1511456400, 1, '/post/b9040e599fcf10b039194f201599069b', 'jpg', 4, 1511489132, 1, '+511 Points Profit Reached Successfully in USD/CAD Sell Signal', '+511 Points Profit Reached Successfully in USD/CAD Sell Signal', 0),
(100, '+889 Points Profit Reached Successfully in XAUUSD BUY Signal', '+889 Points Profit Reached Successfully in XAUUSD BUY Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/117d3dcb2cb7b6b6008c0c6a313f17aa.jpg" style="width:100%" /></p>\r\n\r\n<p>+889 Points Profit Reached Successfully in XAUUSD BUY Signal</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1511456400, 1, '/post/cf3541add55069a3c857d5ac74e76725', 'jpg', 4, 1511489253, 1, '+889 Points Profit Reached Successfully in XAUUSD BUY Signal', '+889 Points Profit Reached Successfully in XAUUSD BUY Signal', 0),
(101, 'BLACK FRIDAY', 'BLACK FRIDAY', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/e9de8e6c9ef1ea6c7d618eff194370cd.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>------- BLACK FRIDAY ---------<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SALE WEEK ALERT</p>\r\n\r\n<p>Hello Trader,</p>\r\n\r\n<p>Enjoy our 75 usd subcribe for premium package signal on &quot;black friday sale&quot;. Take your signal and get more advantages from subcribe our premium channel ', 1, 1511542800, 1, '/post/81469042f317d43e5757622c33726ec6', 'jpg', 1, 1511594746, 1, 'BLACK FRIDAY', 'BLACK FRIDAY', 0),
(102, '+578 Points Profit Reached Successfully in AUDCHF  BUY Signal.', '+578 Points Profit Reached Successfully in AUDCHF  BUY Signal.', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/53c5ba8a684b253dab0efe044f0fd9da.jpg" style="width:100%" /></p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n', 1, 1511715600, 1, '/post/9cfd56daa29f5d7a701c1b8e2d92e8cb', 'jpg', 4, 1511785119, 1, '+578 Points Profit Reached Successfully in AUDCHF  BUY Signal.', '+578 Points Profit Reached Successfully in AUDCHF  BUY Signal.', 0),
(103, '+2031 Points Profit Reached Successfully in XAUUSD BUY Signal', '+2031 Points Profit Reached Successfully in XAUUSD BUY Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/f9a1f06f9549b4b993bf5c2aabe4f034.jpg" style="width:100%" />+2031 Points Profit Reached Successfully in XAUUSD BUY Signal</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1511888400, 1, '/post/8644016528245fa9661ed5b7b0b14637', 'jpg', 4, 1511924884, 1, '+2031 Points Profit Reached Successfully in XAUUSD BUY Signal', '+2031 Points Profit Reached Successfully in XAUUSD BUY Signal', 0),
(104, '+618 Points Profit Reached Successfully in EURNZD sell Signal', '+618 Points Profit Reached Successfully in EURNZD sell Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/5a2a36f35162e3d50828c7161b8b7e1c.jpg" style="width:100%" /></p>\r\n\r\n<p>+618 Points Profit Reached Successfully in EURNZD sell Signal</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1511974800, 1, '/post/b01902a86224ab7d02727d519d96ca36', 'jpg', 4, 1512036824, 1, '+618 Points Profit Reached Successfully in EURNZD sell Signal', '+618 Points Profit Reached Successfully in EURNZD sell Signal', 0),
(105, '+796 Points Profit Reached Successfully in GBPJPY buy Signal.', '+796 Points Profit Reached Successfully in GBPJPY buy Signal.', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/a7a27eea34acacff59e86e06ef3fa019.jpeg" style="width:100%" />+796 Points Profit Reached Successfully in GBPJPY buy Signal.</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1511974800, 1, '/post/3ef86838cde1a9e87c3458fd129f500c', 'jpeg', 4, 1512037113, 1, '+796 Points Profit Reached Successfully in GBPJPY buy Signal.', '+796 Points Profit Reached Successfully in GBPJPY buy Signal.', 0),
(106, '-830 point loss audnzd sell signal', '-830 point loss audnzd sell signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/ca29ec7ebddf89dd3f531f9c7e8c1da4.jpeg" style="width:100%" />-830 point loss audnzd sell signal</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1511974800, 1, '/post/024f51e9a92380631d2124e0a972ea2a', 'jpeg', 4, 1512038023, 1, '-830 point loss audnzd sell signal', '-830 point loss audnzd sell signal', 0),
(107, '+576 Points Profit Reached Successfully in AUDJPY  BUY Signal', '+576 Points Profit Reached Successfully in AUDJPY  BUY Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/64275a3f270591be876e4c5f4e7ddb75.jpeg" style="width:100%" />+576 Points Profit Reached Successfully in AUDJPY &nbsp;BUY Signal</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1512406800, 1, '/post/339403f6714f6fc6809da9546feebf11', 'jpeg', 4, 1512437237, 1, '+576 Points Profit Reached Successfully in AUDJPY  BUY Signal', '+576 Points Profit Reached Successfully in AUDJPY  BUY Signal', 0);
INSERT INTO `content_posts` (`ID`, `title`, `summary`, `content`, `userid`, `timestamp`, `comments`, `image`, `ext_image`, `categoryid`, `last_updated`, `last_updated_userid`, `seo_title`, `seo_description`, `loggedin`) VALUES
(108, '+752 Points profit Reached  in EURAUD SELL Signal', '+752 Points profit Reached  in EURAUD SELL Signal', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/c9411e5c49e8c0a0d7da29f9e12e6263.jpg" style="width:100%" /></p>\r\n\r\n<p>+752 Points profit Reached &nbsp;in EURAUD SELL Signal</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1513270800, 1, '/post/fe1d680dd4ea1146482bc7f628eec02c', 'jpg', 4, 1513344207, 1, '+752 Points profit Reached  in EURAUD SELL Signal', '+752 Points profit Reached  in EURAUD SELL Signal', 0),
(109, '+932 Points profit Reached  in EURJPY SELL Signal', '+932 Points profit Reached  in EURJPY SELL Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/5fe49d2505e0d15a90bd883b5e802e96.jpg" style="width:100%" />+932 Points profit Reached &nbsp;in EURJPY SELL Signal</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1513270800, 1, '/post/873b854117669d9656f552b6101e89fd', 'jpg', 4, 1513343885, 1, '+932 Points profit Reached  in EURJPY SELL Signal', '+932 Points profit Reached  in EURJPY SELL Signal', 0),
(110, '+787 Points profit Reached  in USDCAD BUY Signal', '+787 Points profit Reached  in USDCAD BUY Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/a2c18549436d5927c70c12bf476c1948.jpg" style="width:100%" />+787 Points profit Reached &nbsp;in USDCAD BUY Signal</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1513270800, 1, '/post/1d1d8087a60f048edc055e149fb477a4', 'jpg', 4, 1513344345, 1, '+787 Points profit Reached  in USDCAD BUY Signal', '+787 Points profit Reached  in USDCAD BUY Signal', 0),
(111, '+1215  Points profit Reached  in NZDCHF BUY Signal', '+1215  Points profit Reached  in NZDCHF BUY Signal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/00a9477c93bf13cbc4dc69b5e339780d.jpg" style="width:100%" />+1215 &nbsp;Points profit Reached &nbsp;in NZDCHF BUY Signal</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Save your time on Analyzing the market, Start to Learn, Trade Forex market in a technical ways&nbsp;with the help of Forex Experts team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Don&#39;t&nbsp;Trade forex market all the time, trade forex only at good opportunities available in the market.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Get more Good Opportunity Technical Trade Signals at premium Signal Plan. Join here:&nbsp;&nbsp;<a href="https://bossforexsignal.com/join">https://bossforexsignal.com/join</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thank you.<br />\r\nRegards,<br />\r\nBossforexsignal Team.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1513270800, 1, '/post/17be406c6fdb7b073daab2d8742cfd5f', 'jpg', 4, 1513345004, 1, '+1215  Points profit Reached  in NZDCHF BUY Signal', '+1215  Points profit Reached  in NZDCHF BUY Signal', 0),
(112, '-826 point loss buy audcad', '-826 point loss buy audcad', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/3a987365d0170ad43a01864a33f048c1.jpeg" style="width:100%" />-826 point loss buy audcad</p>\r\n\r\n<p>As per the technical analysis, AUD/CAD starts to reverse from the bottom zone 0.9600</p>\r\n\r\n<p>AUD/CAD broken the recent top level 0.9750 and re-tested the breakout level again.</p>\r\n\r\n<p>Finally, market starts to continue it&amp;rsquo;s upward movement with more number of buyers.</p>\r\n\r\n<p>This is the reason for Buying AUD/CAD.</p>\r\n\r\n<p>However, due to lack of movement and liquidity in the market, AUD/CAD keep moving up and down between the small ranges for more than 2 days.</p>\r\n\r\n<p>As per our signal guide, if market doesn&amp;rsquo;t hit the target 1 within 2 days. we recommend our members to close the trade.</p>\r\n\r\n<p>If there&amp;rsquo;s lack of liquidity in the market, Please don&amp;rsquo;t hold the trade for long time. Use trailing stop (or) close the trade at our Entry price levels.</p>\r\n\r\n<p>The signal was expired.</p>\r\n\r\n<p>Finally, AUD/CAD trade was closed at our entry price levels.</p>\r\n\r\n<p>Save your Time, Money, Energy on Analyzing the market.</p>\r\n\r\n<p>Start to Learn, Trade Forex market in Technical ways with the help of Forex Experts team.</p>\r\n', 1, 1513875600, 1, '/post/9208887f3427cea30c21720b3e4699de', 'jpeg', 4, 1513905295, 1, '-826 point loss buy audcad', '-826 point loss buy audcad', 0),
(113, 'trading  results : +1414 Points profit Reached  in NZDUSD BUYSignal', 'trading  results : +1414 Points profit Reached  in NZDUSD BUYSignal', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/70148515d86cb87d0d5299f8ba560ef8.jpg" style="width:100%" />trading &nbsp;results : +1414 Points profit Reached &nbsp;in NZDUSD BUYSignal</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1515344400, 1, '/post/0f377713be556ce7cd74a08f56ffc780', 'jpg', 1, 1516356914, 1, 'trading  results : +1414 Points profit Reached  in NZDUSD BUYSignal', 'trading  results : +1414 Points profit Reached  in NZDUSD BUYSignal', 0),
(115, '+994 Points profit  Reached  in USDCAD BUYSignal', '+994 Points profit  Reached  in USDCAD BUYSignal.', '<p><img alt="" src="https://bossforexsignal.com/./uploads//ck-editor/cd17b2fd5c88e5686362b4e4b45544d9.jpg" style="width:100%" /></p>\r\n\r\n<p>&nbsp;+994 Points profit &nbsp;Reached &nbsp;in USDCAD BUYSignal????????</p>\r\n', 1, 1516813200, 1, '/post/7b20f5f29049040b54d774feb6499f57', 'jpg', 4, 1516876310, 1, '+994 Points profit  Reached  in USDCAD BUYSignal????????', '+994 Points profit  Reached  in USDCAD BUYSignal????????', 0);

-- --------------------------------------------------------

--
-- Table structure for table `content_post_categories`
--

CREATE TABLE `content_post_categories` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_post_categories`
--

INSERT INTO `content_post_categories` (`ID`, `name`, `image`, `description`) VALUES
(1, 'news Internal', 'default.png', '<p>segala berita internal</p>\r\n'),
(4, 'trading result', 'default.png', ''),
(6, 'forex  technical analysis', '/cat_post/d207fb12716e8f4568fbd6ec95ab1491.png', ''),
(7, 'signal forex', 'default.png', ''),
(9, 'fundamental analysis', 'default.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `content_post_comments`
--

CREATE TABLE `content_post_comments` (
  `ID` int(11) UNSIGNED NOT NULL,
  `postid` int(11) NOT NULL,
  `parentid` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(100) NOT NULL DEFAULT 'anon.jpg',
  `comment_name` varchar(100) NOT NULL,
  `comment_email` varchar(100) NOT NULL,
  `comment_body` text NOT NULL,
  `title` text NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '1',
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_post_comments`
--

INSERT INTO `content_post_comments` (`ID`, `postid`, `parentid`, `avatar`, `comment_name`, `comment_email`, `comment_body`, `title`, `userid`, `timestamp`) VALUES
(32, 10, 0, 'anon.jpg', 'John Barnes', 'Levisonbarnes@gmail.com', 'Hie  Boss  Im very happy with the way u have explained  this information is very important especially to us new  traders. I salute you and I&#039;m prepared to subscribe to you. Honestly I blew  my account thrice now. Last week I blew it again but following someone&#039;s signals. But I hope and trust I will  recover my money through  u .Thanks', '', 1, 1499583355),
(33, 25, 0, 'anon.jpg', 'dode', 'dode.agung.asmara@gmail.com', 'test', '', 1, 1499862161),
(34, 10, 0, 'anon.jpg', 'Oscar Mendoza', 'wedomendoza@gmail.com', 'Can I receive forex signals an alerts to my phone. ..623-313-1492..jQuery1113004832940036430955_1500018809026', '', 1, 1500018950),
(35, 10, 0, 'anon.jpg', 'Oscar Mendoza', 'wedomendoza@gmail.com', 'Can I receive forex signals an alerts to my phone. ..623-313-1492..jQuery1113004832940036430955_1500018809026', '', 1, 1500018960),
(36, 52, 0, 'anon.jpg', 'hala', 'the30640@gmail.com', 'You are  a big  treader. ...I', '', 1, 1501736249),
(37, 69, 0, 'anon.jpg', 'davide', 'terzman@alice.it', 'Hi, I saw that provided the service of signals how many pips you get per month more or less? managed the account for me? thanks', '', 1, 1504034513),
(38, 10, 0, 'anon.jpg', 'AKINBOHUN ABAYOMI', 'yomiakinbohun@gmail.com', 'Good morning sir,please my name is AKINBOHUN ABAYOMI am mush interested in your signal but i need to talk with someone on the phone,my contact is  2348038216179, i need some clarification on phone,have try to reach you guys on whatsapp but no response,i wish i could be connected to on line customer care.hope to here from you guys soon bye for now.Best regards ASAPAKINBOHUN ABAYOMI', '', 1, 1504252425),
(39, 10, 0, 'anon.jpg', 'AKINBOHUN ABAYOMI', 'yomiakinbohun@gmail.com', 'Good morning sir,please my name is AKINBOHUN ABAYOMI am mush interested in your signal but i need to talk with someone on the phone,my contact is  2348038216179, i need some clarification on phone,have try to reach you guys on whatsapp but no response,i wish i could be connected to on line customer care.hope to here from you guys soon bye for now.Best regards ASAPAKINBOHUN ABAYOMI', '', 1, 1504252437),
(40, 81, 0, 'anon.jpg', 'Jayantara', 'Jayantaranyoman@gmail.com', 'Terimakasih bossforex atas profitnya saya akhirnya saya menemukan signal yang bagus untuk menjadi acuan saya dalam mengambil keputusan tramsaksi.  ', '', 1, 1504940777),
(41, 81, 0, 'anon.jpg', 'Jayantara', 'Jayantaranyoman@gmail.com', 'Terimakasih bossforex atas profitnya saya akhirnya saya menemukan signal yang bagus untuk menjadi acuan saya dalam mengambil keputusan tramsaksi.  ', '', 1, 1504940778),
(42, 81, 0, 'anon.jpg', 'Jayantara', 'Jayantaranyoman@gmail.com', 'Terimakasih bossforex atas profitnya saya akhirnya saya menemukan signal yang bagus untuk menjadi acuan saya dalam mengambil keputusan tramsaksi.  ', '', 1, 1504940784),
(43, 80, 0, 'anon.jpg', 'Alibaba', 'Cvtridatu@gmail.com', 'Thank for profit bossfx ', '', 1, 1504941039),
(44, 80, 0, 'anon.jpg', 'Alibaba', 'Cvtridatu@gmail.com', 'Thank for profit bossfx ', '', 1, 1504941051),
(45, 82, 0, 'anon.jpg', 'alesandro', 'cv.tridatu@gmail.com', 'thanks for information bossfx team.. goodluck', '', 1, 1505097609),
(46, 82, 45, 'anon.jpg', 'bossfx', 'bossfxsignal@gmail.com', 'ur welcome sir', '', 1, 1505097658),
(47, 82, 0, 'anon.jpg', 'Adel el-ouadi', 'asmadil1galaxygrand@gmail.com', 'Slt', '', 1, 1505127198),
(48, 10, 38, 'anon.jpg', 'Hailin', 'phugunart@hotmail.com', 'From where?', '', 1, 1505532299);

-- --------------------------------------------------------

--
-- Table structure for table `content_slider`
--

CREATE TABLE `content_slider` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `ext_image` varchar(500) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_slider`
--

INSERT INTO `content_slider` (`ID`, `name`, `image`, `ext_image`, `description`) VALUES
(2, 'dode', '/sliders/3bfe07ed9aa6e8f5e5679b91722331ac', 'jpg', '<p>dsdsd</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `currency_converter`
--

CREATE TABLE `currency_converter` (
  `id` int(11) UNSIGNED NOT NULL,
  `from` varchar(5) NOT NULL,
  `to` varchar(5) NOT NULL,
  `rates` varchar(10) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency_converter`
--

INSERT INTO `currency_converter` (`id`, `from`, `to`, `rates`, `created`, `modified`) VALUES
(5, 'USD', 'IDR', '3000', '2017-06-17 16:49:32', '2017-06-17 16:49:32'),
(6, 'USD', 'IDR', '13000', '2017-06-17 16:49:59', '2017-06-17 16:49:59'),
(7, 'USD', 'IDR', '13300', '2017-06-17 17:02:26', '2017-06-17 17:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `options` varchar(2000) NOT NULL,
  `required` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `help_text` varchar(500) NOT NULL,
  `register` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `duration_plan`
--

CREATE TABLE `duration_plan` (
  `ID` int(10) UNSIGNED NOT NULL,
  `duration` varchar(200) NOT NULL,
  `total_month` varchar(200) NOT NULL,
  `discount` int(11) NOT NULL,
  `detail` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duration_plan`
--

INSERT INTO `duration_plan` (`ID`, `duration`, `total_month`, `discount`, `detail`) VALUES
(1, '1 month', '1', 0, ''),
(2, '3 Month', '3', 20, 'discount in percent'),
(3, '1 year', '12', 35, 'discount in percent');

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

CREATE TABLE `email_queue` (
  `id` int(11) NOT NULL,
  `email_send` text NOT NULL,
  `email_cc` text NOT NULL,
  `replayTo` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_queue`
--

INSERT INTO `email_queue` (`id`, `email_send`, `email_cc`, `replayTo`, `subject`, `message`, `status`, `createdAt`) VALUES
(25, 'pknkanwil17@gmail.com', 'dode.agung.asmara@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Pengajuan APUSE - DEWAN%20PERWAKILAN%20RAKYAT-121', 'Terimakasih telah mewujudkan pengelolaan BMN yang tertib administrasi, tertib fisik dan tertib hukum. Permohonan PSP BMN untuk surat DEWAN%20PERWAKILAN%20RAKYAT-121 yang Bapak/Ibu ajukan melalui Aplikasi APUSE akan segera kami Proses.<br/><br/>Terima Kasih', 1, '2019-09-28'),
(24, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi Aplikasi APUSE - kerenlah', 'Permohonan PSP BMN kerenlahyang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 1, '2019-09-28'),
(26, 'pknkanwil17@gmail.com', 'dode.agung.asmara@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Pengajuan APUSE - MAHKAMAH%20AGUNG-121', 'Terimakasih telah mewujudkan pengelolaan BMN yang tertib administrasi, tertib fisik dan tertib hukum. Permohonan PSP BMN untuk surat MAHKAMAH%20AGUNG-121 yang Bapak/Ibu ajukan melalui Aplikasi APUSE akan segera kami Proses.<br/><br/>Terima Kasih', 1, '2019-09-28'),
(27, 'pknkanwil17@gmail.com', 'dode.agung.asmara@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Pengajuan APUSE - MAHKAMAH%20AGUNG-121', 'Terimakasih telah mewujudkan pengelolaan BMN yang tertib administrasi, tertib fisik dan tertib hukum. Permohonan PSP BMN untuk surat MAHKAMAH%20AGUNG-121 yang Bapak/Ibu ajukan melalui Aplikasi APUSE akan segera kami Proses.<br/><br/>Terima Kasih', 1, '2019-09-28'),
(28, 'dode.agung.asmara@gmail.com', 'pknkanwil17@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - MAHKAMAH%20AGUNG-121', 'Permohonan PSP BMN MAHKAMAH%20AGUNG-121 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 1, '2019-09-28'),
(29, 'pkn.kpknl.jayapura@gmail.com', 'dode.agung.asmara@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Pengajuan APUSE - MAHKAMAH%20AGUNG-121', 'Terimakasih telah mewujudkan pengelolaan BMN yang tertib administrasi, tertib fisik dan tertib hukum. Permohonan PSP BMN untuk surat MAHKAMAH%20AGUNG-121 yang Bapak/Ibu ajukan melalui Aplikasi APUSE akan segera kami Proses.<br/><br/>Terima Kasih', 0, '2019-10-01'),
(30, 'dode.agung.asmara@gmail.com', 'pknkanwil17@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - BADAN%20PEMERIKSA%20KEUANGAN-21', 'Permohonan PSP BMN BADAN%20PEMERIKSA%20KEUANGAN-21 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-10-01'),
(31, 'dode.agung.asmara@gmail.com', 'pknkanwil17@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - BADAN%20PEMERIKSA%20KEUANGAN-21', 'Permohonan PSP BMN BADAN%20PEMERIKSA%20KEUANGAN-21 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-10-01'),
(32, 'dode.agung.asmara@gmail.com', 'pknkanwil17@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - BADAN%20PEMERIKSA%20KEUANGAN-21', 'Permohonan PSP BMN BADAN%20PEMERIKSA%20KEUANGAN-21 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-10-01'),
(33, 'dode.agung.asmara@gmail.com', 'pknkanwil17@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - BADAN%20PEMERIKSA%20KEUANGAN-21', 'Permohonan PSP BMN BADAN%20PEMERIKSA%20KEUANGAN-21 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-10-01'),
(34, 'dode.agung.asmara@gmail.com', 'aplikasiapuse@gmail.com', 'pkn.kpknl.jayapura@gmail.com', '[APUSE NOTIF]Sukses Pengajuan PSP BMN - DEWAN%20PERWAKILAN%20RAKYAT-232', 'Terimakasih telah mewujudkan pengelolaan BMN yang tertib administrasi, tertib fisik dan tertib hukum. Permohonan PSP BMN untuk surat DEWAN%20PERWAKILAN%20RAKYAT-232 yang Bapak/Ibu ajukan melalui Aplikasi APUSE akan segera kami Proses.<br/><br/>Terima Kasih', 0, '2019-10-01'),
(35, 'pkn.kpknl.jayapura@gmail.com', 'aplikasiapuse@gmail.com', 'dode.agung.asmara@gmail.com', '[APUSE NOTIF]Pengajuan PSP BMN Baru - DEWAN%20PERWAKILAN%20RAKYAT-232', 'Terdapat Pengajuan Permohonan PSP dari DEWAN%20PERWAKILAN%20RAKYAT-232, mohon segera cek Aplikasi APUSE.<br/>Terima Kasih', 0, '2019-10-01'),
(36, 'dode.agung.asmara@gmail.com', 'pkn.kpknl.jayapura@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - DEWAN%20PERWAKILAN%20RAKYAT-232', 'Permohonan PSP BMN DEWAN%20PERWAKILAN%20RAKYAT-232 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-10-01'),
(37, 'dode.agung.asmara@gmail.com', 'pkn.kpknl.jayapura@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - DEWAN%20PERWAKILAN%20RAKYAT-232', 'Permohonan PSP BMN DEWAN%20PERWAKILAN%20RAKYAT-232 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-10-01'),
(38, 'dode.agung.asmara@gmail.com', 'pkn.kpknl.jayapura@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - DEWAN%20PERWAKILAN%20RAKYAT-232', 'Permohonan PSP BMN DEWAN%20PERWAKILAN%20RAKYAT-232 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-10-01'),
(39, 'dode.agung.asmara@gmail.com', 'pkn.kpknl.jayapura@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - DEWAN%20PERWAKILAN%20RAKYAT-232', 'Permohonan PSP BMN DEWAN%20PERWAKILAN%20RAKYAT-232 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-10-01'),
(40, 'dode.agung.asmara@gmail.com', 'pkn.kpknl.jayapura@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - DEWAN%20PERWAKILAN%20RAKYAT-232', 'Permohonan PSP BMN DEWAN%20PERWAKILAN%20RAKYAT-232 yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-10-01'),
(41, 'dode.agung.asmara@gmail.com', 'aplikasiapuse@gmail.com', 'pknkanwil17@gmail.com', '[APUSE NOTIF]Sukses Pengajuan PSP BMN - DEWAN%20PERWAKILAN%20RAKYAT-232', 'Terimakasih telah mewujudkan pengelolaan BMN yang tertib administrasi, tertib fisik dan tertib hukum. Permohonan PSP BMN untuk surat DEWAN%20PERWAKILAN%20RAKYAT-232 yang Bapak/Ibu ajukan melalui Aplikasi APUSE akan segera kami Proses.<br/><br/>Terima Kasih', 0, '2019-10-01'),
(42, 'pknkanwil17@gmail.com', 'aplikasiapuse@gmail.com', 'dode.agung.asmara@gmail.com', '[APUSE NOTIF]Pengajuan PSP BMN Baru - DEWAN%20PERWAKILAN%20RAKYAT-232', 'Terdapat Pengajuan Permohonan PSP dari DEWAN%20PERWAKILAN%20RAKYAT-232, mohon segera cek Aplikasi APUSE.<br/>Terima Kasih', 0, '2019-10-01'),
(43, 'dode.agung.asmara@gmail.com', 'pkn.kpknl.jayapura@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Sukses Verifikasi APUSE - DEWAN%20PERWAKILAN%20RAKYAT-', 'Permohonan PSP BMN DEWAN%20PERWAKILAN%20RAKYAT- yang Bapak/Ibu ajukan melalui Aplikasi APUSE telah kami Proses. Silahkan Download dokumen tindak lanjutnya.<br/>Dokumen hardcopy akan segera kami kirimkan setelah kami menerima berkas Pengajuan Permohonan PSP BMN dari Bapak/Ibu dalam bentuk hardcopy.<br/>Terima Kasih', 0, '2019-11-25'),
(21, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Pengajuan PSP BMN Online', 'Terimakasih telah mewujudkan pengelolaan BMN yang tertib administrasi, tertib fisik dan tertib hukum. Permohonan PSP BMN yang Bapak/Ibu ajukan melalui Aplikasi APUSE akan segera kami Proses.<br/><br/>Terima Kasih', 1, '2019-09-27'),
(22, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com,aplikasiapuse@gmail.com', 'aplikasiapuse@gmail.com', 'Pengajuan PSP BMN Online', 'Terimakasih telah mewujudkan pengelolaan BMN yang tertib administrasi, tertib fisik dan tertib hukum. Permohonan PSP BMN yang Bapak/Ibu ajukan melalui Aplikasi APUSE akan segera kami Proses.<br/><br/>Terima Kasih', 1, '2019-09-28');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `ID` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`ID`, `title`, `message`) VALUES
(1, 'Forgot Your Password', 'Dear [NAME],\r\n<br /><br />\r\nSomeone (hopefully you) requested a password reset at [SITE_URL].\r\n<br /><br />\r\nTo reset your password, please follow the following link: [EMAIL_LINK]\r\n<br /><br />\r\nIf you did not reset your password, please kindly ignore  this email.\r\n<br /><br />\r\nYours, <br />\r\n[SITE_NAME]'),
(2, 'Email Activation', 'Hallo [NAME],\n<br /><br />\nTerima Kasih telah melakukan registrasi di [SITE_NAME] menggunakan alamat email ini.\n<br /><br />\nSilakan aktivasi aku ini dengan melakukan klik pada: [EMAIL_LINK]\n<br /><br />\nJika memang kamu tidak pernah melakukan Registrasi, harap mengabaikan email ini.\n<br /><br />\nSalam, <br />\n[SITE_NAME] Team');

-- --------------------------------------------------------

--
-- Table structure for table `home_stats`
--

CREATE TABLE `home_stats` (
  `ID` int(11) NOT NULL,
  `google_members` int(11) NOT NULL DEFAULT '0',
  `facebook_members` int(11) NOT NULL DEFAULT '0',
  `twitter_members` int(11) NOT NULL DEFAULT '0',
  `total_members` int(11) NOT NULL DEFAULT '0',
  `new_members` int(11) NOT NULL DEFAULT '0',
  `active_today` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_stats`
--

INSERT INTO `home_stats` (`ID`, `google_members`, `facebook_members`, `twitter_members`, `total_members`, `new_members`, `active_today`, `timestamp`) VALUES
(1, 0, 0, 0, 2, 0, 2, 1566254165);

-- --------------------------------------------------------

--
-- Table structure for table `ipn_log`
--

CREATE TABLE `ipn_log` (
  `ID` int(11) NOT NULL,
  `data` text,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(500) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ipn_log`
--

INSERT INTO `ipn_log` (`ID`, `data`, `timestamp`, `IP`) VALUES
(1, 'Attempted to pay Funds', 1493716584, '::1'),
(2, 'Attempted to pay Funds', 1493924899, '::1'),
(3, 'a:51:{s:8:"mc_gross";s:6:"500.00";s:6:"custom";s:16:"some custom data";s:14:"address_status";s:9:"confirmed";s:12:"item_number1";s:1:"6";s:12:"item_number2";s:1:"4";s:8:"payer_id";s:13:"FW5W7ZUC3T4KL";s:3:"tax";s:4:"0.00";s:14:"address_street";s:14:"1234 Rock Road";s:12:"payment_date";s:24:"14:55 15 Jan 07 2005 PST";s:14:"payment_status";s:9:"Completed";s:11:"address_zip";s:5:"12345";s:11:"mc_shipping";s:4:"0.00";s:11:"mc_handling";s:4:"0.00";s:10:"first_name";s:5:"Jason";s:9:"last_name";s:8:"Anderson";s:6:"mc_fee";s:4:"0.02";s:12:"address_name";s:14:"Jason Anderson";s:14:"notify_version";s:3:"1.6";s:12:"payer_status";s:8:"verified";s:8:"business";s:23:"paypal@emailaddress.com";s:15:"address_country";s:13:"United States";s:14:"num_cart_items";s:1:"2";s:12:"mc_handling1";s:4:"0.00";s:12:"mc_handling2";s:4:"0.00";s:12:"address_city";s:11:"Los Angeles";s:11:"verify_sign";s:56:"AlUbUcinRR5pIo2KwP4xjo9OxxHMAi6.s6AES.4Z6C65yv1Ob2eNqrHm";s:12:"mc_shipping1";s:4:"0.00";s:12:"mc_shipping2";s:4:"0.00";s:4:"tax1";s:4:"0.00";s:4:"tax2";s:4:"0.00";s:6:"txn_id";s:6:"TESTER";s:12:"payment_type";s:7:"instant";s:17:"last_name=Borduin";s:0:"";s:11:"payer_email";s:15:"test@domain.com";s:10:"item_name1";s:11:"Rubber+clog";s:13:"address_state";s:2:"CA";s:11:"payment_fee";s:4:"0.02";s:10:"item_name2";s:12:"Roman sandal";s:7:"invoice";s:6:"123456";s:8:"quantity";s:1:"1";s:9:"quantity1";s:1:"1";s:11:"receiver_id";s:13:"5HRS8SCK9NSJ2";s:9:"quantity2";s:1:"1";s:8:"txn_type";s:10:"web_accept";s:10:"mc_gross_1";s:4:"0.01";s:11:"mc_currency";s:3:"USD";s:10:"mc_gross_2";s:4:"0.01";s:13:"payment_gross";s:4:"0.02";s:9:"subscr_id";s:7:"PP-1234";s:4:"test";s:4:"test";i:0;s:0:"";}', 1493924903, '::1'),
(4, 'Tried to pay Funds (500.00): 4 Userid:0', 1493924903, '::1'),
(5, 'Payment Added to user: 0, 500', 1493924903, '::1'),
(6, 'Attempted to pay Funds', 1493925071, '::1'),
(7, 'a:51:{s:8:"mc_gross";s:6:"500.00";s:6:"custom";s:16:"some custom data";s:14:"address_status";s:9:"confirmed";s:12:"item_number1";s:1:"6";s:12:"item_number2";s:1:"4";s:8:"payer_id";s:13:"FW5W7ZUC3T4KL";s:3:"tax";s:4:"0.00";s:14:"address_street";s:14:"1234 Rock Road";s:12:"payment_date";s:24:"14:55 15 Jan 07 2005 PST";s:14:"payment_status";s:9:"Completed";s:11:"address_zip";s:5:"12345";s:11:"mc_shipping";s:4:"0.00";s:11:"mc_handling";s:4:"0.00";s:10:"first_name";s:5:"Jason";s:9:"last_name";s:8:"Anderson";s:6:"mc_fee";s:4:"0.02";s:12:"address_name";s:14:"Jason Anderson";s:14:"notify_version";s:3:"1.6";s:12:"payer_status";s:8:"verified";s:8:"business";s:23:"paypal@emailaddress.com";s:15:"address_country";s:13:"United States";s:14:"num_cart_items";s:1:"2";s:12:"mc_handling1";s:4:"0.00";s:12:"mc_handling2";s:4:"0.00";s:12:"address_city";s:11:"Los Angeles";s:11:"verify_sign";s:56:"AlUbUcinRR5pIo2KwP4xjo9OxxHMAi6.s6AES.4Z6C65yv1Ob2eNqrHm";s:12:"mc_shipping1";s:4:"0.00";s:12:"mc_shipping2";s:4:"0.00";s:4:"tax1";s:4:"0.00";s:4:"tax2";s:4:"0.00";s:6:"txn_id";s:6:"TESTER";s:12:"payment_type";s:7:"instant";s:17:"last_name=Borduin";s:0:"";s:11:"payer_email";s:15:"test@domain.com";s:10:"item_name1";s:11:"Rubber+clog";s:13:"address_state";s:2:"CA";s:11:"payment_fee";s:4:"0.02";s:10:"item_name2";s:12:"Roman sandal";s:7:"invoice";s:6:"123456";s:8:"quantity";s:1:"1";s:9:"quantity1";s:1:"1";s:11:"receiver_id";s:13:"5HRS8SCK9NSJ2";s:9:"quantity2";s:1:"1";s:8:"txn_type";s:10:"web_accept";s:10:"mc_gross_1";s:4:"0.01";s:11:"mc_currency";s:3:"USD";s:10:"mc_gross_2";s:4:"0.01";s:13:"payment_gross";s:4:"0.02";s:9:"subscr_id";s:7:"PP-1234";s:4:"test";s:4:"test";i:0;s:0:"";}', 1493925073, '::1'),
(8, 'Tried to pay Funds (500.00): 4 Userid:0', 1493925073, '::1'),
(9, 'Payment Added to user: 0, 500', 1493925073, '::1'),
(10, 'Attempted to pay Funds', 1493926187, '173.0.81.33'),
(11, 'a:36:{s:12:"payment_type";s:6:"echeck";s:12:"payment_date";s:65:"Fri May 05 2017 03:29:39 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:23:"buyer@paypalsandbox.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:5:"12.34";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"600214119";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AtkCLapB.3pIe14IoL-fySV7G.P2";}', 1493926188, '173.0.81.33'),
(12, 'Tried to pay Funds (12.34): 0 Userid:0', 1493926188, '173.0.81.33'),
(13, 'Payment Added to user: 0, 12.34', 1493926188, '173.0.81.33'),
(14, 'Attempted to pay Funds', 1493927609, '173.0.81.1'),
(15, 'a:29:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"12:53:21 May 04, 2017 PDT";s:8:"txn_type";s:10:"web_accept";s:9:"last_name";s:6:"Asmara";s:17:"residence_country";s:2:"ID";s:9:"item_name";s:18:"BossSIgnalFX Funds";s:13:"payment_gross";s:4:"0.01";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"A603SUjO7FDctKake8FuDp6m-8UdAg94XnhwxTyFXTw-AuyrcNye2a-X";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:6:"txn_id";s:17:"7VU03073VK369123A";s:8:"quantity";s:1:"1";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:17:"I Dewa Gede Agung";s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:11:"item_number";s:7:"funds01";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"0.01";s:6:"mc_fee";s:4:"0.01";s:8:"mc_gross";s:4:"0.01";s:6:"custom";s:1:"1";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"52bf92ec698fb";}', 1493927610, '173.0.81.1'),
(16, 'Tried to pay Funds (0.01): 0 Userid:1', 1493927610, '173.0.81.1'),
(17, 'Payment Added to user: 1, 0.01', 1493927610, '173.0.81.1'),
(18, 'Attempted to pay Funds', 1493927766, '173.0.81.1'),
(19, 'a:36:{s:8:"mc_gross";s:4:"0.01";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:3:"tax";s:4:"0.00";s:12:"payment_date";s:25:"12:53:21 May 04, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:10:"first_name";s:17:"I Dewa Gede Agung";s:6:"mc_fee";s:4:"0.01";s:14:"notify_version";s:3:"3.8";s:6:"custom";s:1:"1";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:8:"quantity";s:1:"1";s:11:"verify_sign";s:56:"AnDyQ1GoCLY59lrrNQ37AZM9rn9lAP-WGwW4sdcnhxVFznpYBTQEYf-e";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:6:"txn_id";s:17:"7VU03073VK369123A";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"Asmara";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"0.01";s:17:"shipping_discount";s:4:"0.00";s:16:"insurance_amount";s:4:"0.00";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"web_accept";s:9:"item_name";s:18:"BossSIgnalFX Funds";s:8:"discount";s:4:"0.00";s:11:"mc_currency";s:3:"USD";s:11:"item_number";s:7:"funds01";s:17:"residence_country";s:2:"ID";s:15:"handling_amount";s:4:"0.00";s:15:"shipping_method";s:7:"Default";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:4:"0.01";s:8:"shipping";s:4:"0.00";s:12:"ipn_track_id";s:13:"8129be09d633e";}', 1493927766, '173.0.81.1'),
(20, 'Tried to pay Funds (0.01): 0 Userid:1', 1493927766, '173.0.81.1'),
(21, 'Payment Added to user: 1, 0.01', 1493927766, '173.0.81.1'),
(22, 'Attempted to pay Funds', 1494209790, '173.0.81.1'),
(23, 'a:29:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"19:16:20 May 07, 2017 PDT";s:8:"txn_type";s:10:"web_accept";s:9:"last_name";s:6:"Asmara";s:17:"residence_country";s:2:"ID";s:9:"item_name";s:18:"BossSIgnalFX Funds";s:13:"payment_gross";s:4:"0.01";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"AJk8QuV-taWzxKJWz2C0EDiEnfsEATTK2boe7.t5e7XJKUgbjmF1l8uA";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:6:"txn_id";s:17:"4T664184UR797992C";s:8:"quantity";s:1:"1";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:17:"I Dewa Gede Agung";s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:11:"item_number";s:7:"funds01";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"0.01";s:6:"mc_fee";s:4:"0.01";s:8:"mc_gross";s:4:"0.01";s:6:"custom";s:1:"1";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"65e7fdf8b932c";}', 1494209790, '173.0.81.1'),
(24, 'Tried to pay Funds (0.01): 0 Userid:1', 1494209790, '173.0.81.1'),
(25, 'Payment Added to user: 1, 0.01', 1494209790, '173.0.81.1'),
(26, 'Attempted to pay Funds', 1494520566, '173.0.81.1'),
(27, 'Attempted to pay Funds', 1494555381, '173.0.81.1'),
(28, 'Attempted to pay Funds', 1496216709, '173.0.81.1'),
(29, 'Attempted to pay Funds', 1496219410, '173.0.81.1'),
(30, 'Attempted to pay Funds', 1497790777, '173.0.81.33'),
(31, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AN7cbPU3OvY5nVPsLUFg79FktAOY";}', 1497790777, '173.0.81.33'),
(32, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AN7cbPU3OvY5nVPsLUFg79FktAOY";}', 1497790778, '173.0.81.33'),
(33, 'Tried to pay Funds (15): 0 Userid:0', 1497790778, '173.0.81.33'),
(34, 'Attempted to pay Funds', 1497790980, '173.0.81.33'),
(35, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:5:"12.34";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31A-fEtdzUC4bW1B-NOo6SsXN7SIrU";}', 1497790980, '173.0.81.33'),
(36, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:5:"12.34";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31A-fEtdzUC4bW1B-NOo6SsXN7SIrU";}', 1497790981, '173.0.81.33'),
(37, 'Tried to pay Funds (12.34): 0 Userid:0', 1497790981, '173.0.81.33'),
(38, 'Attempted to pay Funds', 1497791133, '173.0.81.33'),
(39, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:5:"12.34";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31A-fEtdzUC4bW1B-NOo6SsXN7SIrU";}', 1497791134, '173.0.81.33'),
(40, 'Tried to pay Funds (12.34): 0 Userid:0', 1497791134, '173.0.81.33'),
(41, 'Attempted to pay Funds', 1497791254, '173.0.81.33'),
(42, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:5:"12.34";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31A-fEtdzUC4bW1B-NOo6SsXN7SIrU";}', 1497791255, '173.0.81.33'),
(43, 'Tried to pay Funds (12.34): 0 Userid:0', 1497791255, '173.0.81.33'),
(44, 'Attempted to pay Funds', 1497791342, '173.0.81.33'),
(45, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:5:"12.34";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31A-fEtdzUC4bW1B-NOo6SsXN7SIrU";}', 1497791343, '173.0.81.33'),
(46, 'Tried to pay Funds (12.34): 0 Userid:0', 1497791343, '173.0.81.33'),
(47, 'Attempted to pay Funds', 1497791424, '173.0.81.33'),
(48, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AN7cbPU3OvY5nVPsLUFg79FktAOY";}', 1497791425, '173.0.81.33'),
(49, 'Tried to pay Funds (15): 0 Userid:0', 1497791425, '173.0.81.33'),
(50, 'Attempted to pay Funds', 1497791559, '173.0.81.33'),
(51, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AiPC9BjkCyDFQXbSkoZcgqH3hpacAyEui5xXCrIUlpjP7nLnAmMITEic";}', 1497791560, '173.0.81.33'),
(52, 'Tried to pay Funds (15): 0 Userid:0', 1497791560, '173.0.81.33'),
(53, 'Attempted to pay Funds', 1497791584, '173.0.81.33'),
(54, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AN7cbPU3OvY5nVPsLUFg79FktAOY";}', 1497791585, '173.0.81.33'),
(55, 'Tried to pay Funds (15): 0 Userid:0', 1497791585, '173.0.81.33'),
(56, 'Attempted to pay Funds', 1497791665, '173.0.81.33'),
(57, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AN7cbPU3OvY5nVPsLUFg79FktAOY";}', 1497791667, '173.0.81.33'),
(58, 'Tried to pay Funds (15): 0 Userid:0', 1497791667, '173.0.81.33'),
(59, 'Attempted to pay Funds', 1497792114, '173.0.81.33'),
(60, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AN7cbPU3OvY5nVPsLUFg79FktAOY";}', 1497792115, '173.0.81.33'),
(61, 'Tried to pay Funds (15): 0 Userid:0', 1497792115, '173.0.81.33'),
(62, 'Attempted to pay Funds', 1497792342, '173.0.81.33'),
(63, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AN7cbPU3OvY5nVPsLUFg79FktAOY";}', 1497792342, '173.0.81.33'),
(64, 'Tried to pay Funds (15): 0 Userid:0', 1497792342, '173.0.81.33'),
(65, 'Attempted to pay Funds', 1497792414, '173.0.81.33'),
(66, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AN7cbPU3OvY5nVPsLUFg79FktAOY";}', 1497792414, '173.0.81.33'),
(67, 'Tried to pay Funds (15): 0 Userid:0', 1497792414, '173.0.81.33'),
(68, 'Attempted to pay Funds', 1497792483, '173.0.81.33'),
(69, 'a:36:{s:12:"payment_type";s:7:"instant";s:12:"payment_date";s:65:"Sun Jun 18 2017 20:40:02 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:17:"fkresna@gmail.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:2:"15";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"608105131";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AN7cbPU3OvY5nVPsLUFg79FktAOY";}', 1497792483, '173.0.81.33'),
(70, 'Tried to pay Funds (15): 0 Userid:0', 1497792483, '173.0.81.33'),
(71, 'Attempted to pay Funds', 1497882593, '173.0.81.1'),
(72, 'Attempted to pay Funds', 1497883672, '173.0.81.1'),
(73, 'Attempted to pay Funds', 1497883846, '173.0.81.1'),
(74, 'Attempted to pay Funds', 1497884148, '173.0.81.1'),
(75, 'Attempted to pay Funds', 1497932418, '173.0.81.1'),
(76, 'Attempted to pay Funds', 1497932766, '173.0.81.1'),
(77, 'Attempted to pay Funds', 1497934117, '173.0.81.1'),
(78, 'Attempted to pay Funds', 1497934897, '173.0.81.1'),
(79, 'a:34:{s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:20:"address_country_code";s:2:"ID";s:12:"ipn_track_id";s:13:"2b97579737793";s:11:"address_zip";s:5:"80351";s:7:"charset";s:12:"windows-1252";s:13:"payment_gross";s:5:"49.00";s:14:"address_status";s:11:"unconfirmed";s:14:"address_street";s:43:"Jl. Taman Sari No. 6\r\nBr Umagunung, Sempidi";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AsV.GXth6kMpncd9XoZu1a6l8LAf";s:8:"txn_type";s:10:"send_money";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:11:"payment_fee";s:4:"2.21";s:11:"mc_currency";s:3:"USD";s:19:"transaction_subject";s:0:"";s:22:"protection_eligibility";s:8:"Eligible";s:15:"address_country";s:9:"Indonesia";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:17:"I Dewa Gede Agung";s:12:"address_name";s:24:"I Dewa Gede Agung Asmara";s:8:"mc_gross";s:5:"49.00";s:12:"payment_date";s:25:"21:25:59 Jun 19, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:8:"business";s:22:"bossfxsignal@gmail.com";s:9:"last_name";s:6:"Asmara";s:13:"address_state";s:9:"Indonesia";s:6:"txn_id";s:17:"7RU51645HY394981L";s:6:"mc_fee";s:4:"2.21";s:6:"resend";s:4:"true";s:12:"payment_type";s:7:"instant";s:14:"notify_version";s:3:"3.8";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:12:"address_city";s:6:"Badung";s:17:"residence_country";s:2:"ID";}', 1497934897, '173.0.81.1'),
(80, 'Tried to pay Funds (49.00): 0 Userid:0', 1497934897, '173.0.81.1'),
(81, 'Attempted to pay Funds', 1497936046, '173.0.81.1'),
(82, 'a:25:{s:19:"transaction_subject";s:0:"";s:8:"txn_type";s:10:"send_money";s:12:"payment_date";s:25:"22:20:39 Jun 19, 2017 PDT";s:9:"last_name";s:11:"diah apsari";s:17:"residence_country";s:2:"ID";s:13:"payment_gross";s:4:"1.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:27:"dode.agung.asmara@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:10:"Ineligible";s:11:"verify_sign";s:56:"A8faeGhiGZAgnl3FsrSzieDy2SLKAkSsrsBXDA80ifE3S9SRM81TOH44";s:12:"payer_status";s:10:"unverified";s:11:"payer_email";s:22:"bossfxsignal@gmail.com";s:6:"txn_id";s:17:"26E2135864372244S";s:14:"receiver_email";s:27:"dode.agung.asmara@gmail.com";s:10:"first_name";s:16:"anak agung istri";s:8:"payer_id";s:13:"35ZEQXEY9TRF4";s:11:"receiver_id";s:13:"JN2Z8KTDPGABW";s:4:"memo";s:3:"124";s:19:"payer_business_name";s:12:"bossfxsignal";s:14:"payment_status";s:9:"Completed";s:8:"mc_gross";s:4:"1.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"958e1613eba10";}', 1497936047, '173.0.81.1'),
(83, 'Tried to pay Funds (1.00): 0 Userid:0', 1497936047, '173.0.81.1'),
(84, 'Attempted to pay Funds', 1497936514, '173.0.81.1'),
(85, 'a:34:{s:8:"mc_gross";s:4:"1.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:14:"address_street";s:43:"Jl. Taman Sari No. 6\r\nBr Umagunung, Sempidi";s:12:"payment_date";s:25:"22:28:26 Jun 19, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"80351";s:10:"first_name";s:17:"I Dewa Gede Agung";s:6:"mc_fee";s:4:"0.34";s:20:"address_country_code";s:2:"ID";s:12:"address_name";s:24:"I Dewa Gede Agung Asmara";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Indonesia";s:12:"address_city";s:6:"Badung";s:11:"verify_sign";s:56:"ATyrBU4mqf-XNXALA5.wImYg4xesAVThZL0watOL3LEdRZhToSWCJBxt";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:4:"memo";s:12:"dewa ganteng";s:6:"txn_id";s:17:"9FA88662LA358210H";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"Asmara";s:13:"address_state";s:9:"Indonesia";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"0.34";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"ID";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:4:"1.00";s:12:"ipn_track_id";s:13:"b62d5748e34f1";}', 1497936516, '173.0.81.1'),
(86, 'Tried to pay Funds (1.00): 0 Userid:0', 1497936516, '173.0.81.1'),
(87, 'Attempted to pay Funds', 1498075244, '173.0.81.33'),
(88, 'a:36:{s:12:"payment_type";s:6:"echeck";s:12:"payment_date";s:65:"Thu Jun 22 2017 04:00:35 GMT+0800 (Malay Peninsula Standard Time)";s:14:"payment_status";s:9:"Completed";s:14:"address_status";s:9:"confirmed";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:4:"John";s:9:"last_name";s:5:"Smith";s:11:"payer_email";s:23:"buyer@paypalsandbox.com";s:8:"payer_id";s:13:"TESTBUYERID01";s:12:"address_name";s:10:"John Smith";s:15:"address_country";s:13:"United States";s:20:"address_country_code";s:2:"US";s:11:"address_zip";s:5:"95131";s:13:"address_state";s:2:"CA";s:12:"address_city";s:8:"San Jose";s:14:"address_street";s:14:"123 any street";s:8:"business";s:24:"seller@paypalsandbox.com";s:14:"receiver_email";s:24:"seller@paypalsandbox.com";s:11:"receiver_id";s:24:"seller@paypalsandbox.com";s:17:"residence_country";s:2:"US";s:9:"item_name";s:9:"something";s:11:"item_number";s:7:"AK-1234";s:8:"quantity";s:1:"1";s:8:"shipping";s:4:"3.04";s:3:"tax";s:4:"2.02";s:11:"mc_currency";s:3:"USD";s:6:"mc_fee";s:4:"0.44";s:8:"mc_gross";s:5:"12.34";s:10:"mc_gross_1";s:5:"12.34";s:8:"txn_type";s:10:"web_accept";s:6:"txn_id";s:9:"649933490";s:14:"notify_version";s:3:"2.1";s:6:"custom";s:6:"xyz123";s:7:"invoice";s:7:"abc1234";s:8:"test_ipn";s:1:"1";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31APKUI.PF7mzB7Pxq8bIe7d8FCms4";}', 1498075244, '173.0.81.33'),
(89, 'Tried to pay Funds (12.34): 0 Userid:0', 1498075244, '173.0.81.33'),
(90, 'Attempted to pay Funds', 1498103096, '173.0.81.1'),
(91, 'a:24:{s:19:"transaction_subject";s:0:"";s:8:"txn_type";s:10:"send_money";s:12:"payment_date";s:25:"20:44:21 Jun 21, 2017 PDT";s:9:"last_name";s:11:"diah apsari";s:17:"residence_country";s:2:"ID";s:13:"payment_gross";s:4:"1.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:27:"dode.agung.asmara@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:10:"Ineligible";s:11:"verify_sign";s:56:"AAjgpFMc22TbxGEPhBkTdDCfIdQ2Ac.4TVU2s3rYL55U7Vgq38DGVhAY";s:12:"payer_status";s:10:"unverified";s:11:"payer_email";s:22:"bossfxsignal@gmail.com";s:6:"txn_id";s:17:"9BW24196RD1056316";s:14:"receiver_email";s:27:"dode.agung.asmara@gmail.com";s:10:"first_name";s:16:"anak agung istri";s:8:"payer_id";s:13:"35ZEQXEY9TRF4";s:11:"receiver_id";s:13:"JN2Z8KTDPGABW";s:19:"payer_business_name";s:12:"bossfxsignal";s:14:"payment_status";s:9:"Completed";s:8:"mc_gross";s:4:"1.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"3ed6aeb6df78f";}', 1498103097, '173.0.81.1'),
(92, 'Tried to pay Funds (1.00): 0 Userid:0', 1498103097, '173.0.81.1'),
(93, 'Attempted to pay Funds', 1498103484, '173.0.81.1'),
(94, 'a:23:{s:19:"transaction_subject";s:0:"";s:8:"txn_type";s:10:"send_money";s:12:"payment_date";s:25:"20:50:58 Jun 21, 2017 PDT";s:9:"last_name";s:6:"Asmara";s:17:"residence_country";s:2:"ID";s:13:"payment_gross";s:4:"1.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:10:"Ineligible";s:11:"verify_sign";s:56:"AE8ZuhFUR7Zsh0.vEL9Ies2oeMy1AsFdlAwt09lDvcaUC4XR4PnjkceY";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:6:"txn_id";s:17:"5VG63783SC173122C";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:17:"I Dewa Gede Agung";s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:8:"mc_gross";s:4:"1.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"1cc49983abe82";}', 1498103486, '173.0.81.1'),
(95, 'Tried to pay Funds (1.00): 0 Userid:0', 1498103486, '173.0.81.1'),
(96, 'Attempted to pay Funds', 1498104247, '173.0.81.1'),
(97, 'a:24:{s:19:"transaction_subject";s:0:"";s:8:"txn_type";s:10:"send_money";s:12:"payment_date";s:25:"21:03:34 Jun 21, 2017 PDT";s:9:"last_name";s:11:"diah apsari";s:17:"residence_country";s:2:"ID";s:13:"payment_gross";s:4:"1.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:27:"dode.agung.asmara@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:10:"Ineligible";s:11:"verify_sign";s:56:"Ai1PaghZh5FmBLCDCTQpwG8jB264AoOTrWOBgkK8V2CGyoq.kVElBmYO";s:12:"payer_status";s:10:"unverified";s:11:"payer_email";s:22:"bossfxsignal@gmail.com";s:6:"txn_id";s:17:"5GP01109JA881404S";s:14:"receiver_email";s:27:"dode.agung.asmara@gmail.com";s:10:"first_name";s:16:"anak agung istri";s:8:"payer_id";s:13:"35ZEQXEY9TRF4";s:11:"receiver_id";s:13:"JN2Z8KTDPGABW";s:19:"payer_business_name";s:12:"bossfxsignal";s:14:"payment_status";s:9:"Completed";s:8:"mc_gross";s:4:"1.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"5a5bfa89d6285";}', 1498104248, '173.0.81.1'),
(98, 'Tried to pay Funds (1.00): 0 Userid:0', 1498104248, '173.0.81.1'),
(99, 'Attempted to pay Funds', 1498104700, '173.0.81.1'),
(100, 'a:24:{s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:12:"ipn_track_id";s:13:"1cc49983abe82";s:7:"charset";s:12:"windows-1252";s:13:"payment_gross";s:4:"1.00";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AAJoQvhzhFf5OoEuzg-LwEz9cgxr";s:8:"txn_type";s:10:"send_money";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:11:"mc_currency";s:3:"USD";s:19:"transaction_subject";s:0:"";s:22:"protection_eligibility";s:10:"Ineligible";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:17:"I Dewa Gede Agung";s:8:"mc_gross";s:4:"1.00";s:12:"payment_date";s:25:"20:50:58 Jun 21, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:8:"business";s:22:"bossfxsignal@gmail.com";s:9:"last_name";s:6:"Asmara";s:6:"txn_id";s:17:"5VG63783SC173122C";s:6:"resend";s:4:"true";s:12:"payment_type";s:7:"instant";s:14:"notify_version";s:3:"3.8";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:17:"residence_country";s:2:"ID";}', 1498104701, '173.0.81.1'),
(101, 'Tried to pay Funds (1.00): 0 Userid:0', 1498104701, '173.0.81.1'),
(102, 'Attempted to pay Funds', 1498104864, '173.0.81.1'),
(103, 'a:24:{s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:12:"ipn_track_id";s:13:"1cc49983abe82";s:7:"charset";s:12:"windows-1252";s:13:"payment_gross";s:4:"1.00";s:11:"verify_sign";s:56:"AFcWxV21C7fd0v3bYYYRCpSSRl31AAJoQvhzhFf5OoEuzg-LwEz9cgxr";s:8:"txn_type";s:10:"send_money";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:11:"mc_currency";s:3:"USD";s:19:"transaction_subject";s:0:"";s:22:"protection_eligibility";s:10:"Ineligible";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:17:"I Dewa Gede Agung";s:8:"mc_gross";s:4:"1.00";s:12:"payment_date";s:25:"20:50:58 Jun 21, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:8:"business";s:22:"bossfxsignal@gmail.com";s:9:"last_name";s:6:"Asmara";s:6:"txn_id";s:17:"5VG63783SC173122C";s:6:"resend";s:4:"true";s:12:"payment_type";s:7:"instant";s:14:"notify_version";s:3:"3.8";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:17:"residence_country";s:2:"ID";}', 1498104864, '173.0.81.1'),
(104, 'Tried to pay Funds (1.00): 0 Userid:0', 1498104864, '173.0.81.1'),
(105, 'Attempted to pay Funds', 1498104865, '173.0.81.1'),
(106, 'a:24:{s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:12:"ipn_track_id";s:13:"1cc49983abe82";s:7:"charset";s:12:"windows-1252";s:13:"payment_gross";s:4:"1.00";s:11:"verify_sign";s:56:"An5ns1Kso7MWUdW4ErQKJJJ4qi4-AcJ9Ncu9wId-UnGwAvX4ir5TjrLr";s:8:"txn_type";s:10:"send_money";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:11:"mc_currency";s:3:"USD";s:19:"transaction_subject";s:0:"";s:22:"protection_eligibility";s:10:"Ineligible";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:17:"I Dewa Gede Agung";s:8:"mc_gross";s:4:"1.00";s:12:"payment_date";s:25:"20:50:58 Jun 21, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:8:"business";s:22:"bossfxsignal@gmail.com";s:9:"last_name";s:6:"Asmara";s:6:"txn_id";s:17:"5VG63783SC173122C";s:6:"resend";s:4:"true";s:12:"payment_type";s:7:"instant";s:14:"notify_version";s:3:"3.8";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:17:"residence_country";s:2:"ID";}', 1498104866, '173.0.81.1'),
(107, 'Tried to pay Funds (1.00): 0 Userid:0', 1498104866, '173.0.81.1'),
(108, 'Attempted to pay Funds', 1498105303, '173.0.81.1'),
(109, 'a:24:{s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:12:"ipn_track_id";s:13:"1cc49983abe82";s:7:"charset";s:12:"windows-1252";s:13:"payment_gross";s:4:"1.00";s:11:"verify_sign";s:56:"AQU0e5vuZCvSg-XJploSa.sGUDlpAGE2WhsDB3RK1CSm-AsPV8JHqQ7e";s:8:"txn_type";s:10:"send_money";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:11:"mc_currency";s:3:"USD";s:19:"transaction_subject";s:0:"";s:22:"protection_eligibility";s:10:"Ineligible";s:12:"payer_status";s:8:"verified";s:10:"first_name";s:17:"I Dewa Gede Agung";s:8:"mc_gross";s:4:"1.00";s:12:"payment_date";s:25:"20:50:58 Jun 21, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:8:"business";s:22:"bossfxsignal@gmail.com";s:9:"last_name";s:6:"Asmara";s:6:"txn_id";s:17:"5VG63783SC173122C";s:6:"resend";s:4:"true";s:12:"payment_type";s:7:"instant";s:14:"notify_version";s:3:"3.8";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:17:"residence_country";s:2:"ID";}', 1498105303, '173.0.81.1'),
(110, 'Tried to pay Funds (1.00): 0 Userid:0', 1498105303, '173.0.81.1'),
(111, 'Attempted to pay Funds', 1498108141, '173.0.81.1'),
(112, 'a:33:{s:8:"mc_gross";s:4:"1.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"JN2Z8KTDPGABW";s:14:"address_street";s:43:"Jl. Taman Sari No. 6\r\nBr Umagunung, Sempidi";s:12:"payment_date";s:25:"22:08:54 Jun 21, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"80351";s:10:"first_name";s:17:"I Dewa Gede Agung";s:6:"mc_fee";s:4:"0.34";s:20:"address_country_code";s:2:"ID";s:12:"address_name";s:24:"I Dewa Gede Agung Asmara";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Indonesia";s:12:"address_city";s:6:"Badung";s:11:"verify_sign";s:56:"AgePMPfbDDc05TM5uouG2O9s9U74A8.I5LmrCl3em8CfcE2AnHd4euH4";s:11:"payer_email";s:27:"dode.agung.asmara@gmail.com";s:6:"txn_id";s:17:"3P0821828C2230914";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"Asmara";s:13:"address_state";s:9:"Indonesia";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"0.34";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"ID";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:4:"1.00";s:12:"ipn_track_id";s:13:"41566a5978b81";}', 1498108142, '173.0.81.1'),
(113, 'Tried to pay Funds (1.00): 0 Userid:0', 1498108142, '173.0.81.1'),
(114, 'Attempted to pay Funds', 1498620213, '173.0.81.1'),
(115, 'a:33:{s:8:"mc_gross";s:6:"100.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"TZVFJTWALKJAW";s:14:"address_street";s:15:"1183 E. 96th St";s:12:"payment_date";s:25:"20:23:23 Jun 27, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"11236";s:10:"first_name";s:9:"Marshelle";s:6:"mc_fee";s:4:"4.70";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:18:"Marshelle Phillips";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:8:"Brooklyn";s:11:"verify_sign";s:56:"Amzw67HwFOe7PrZRlpTioAViKMi0AoJn1OpJ5n5jRYPj4JqteEfD3GsO";s:11:"payer_email";s:21:"mrsclemente@gmail.com";s:6:"txn_id";s:17:"1A6831769C7261737";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"Phillips";s:13:"address_state";s:2:"NY";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.70";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"US";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"100.00";s:12:"ipn_track_id";s:13:"89c2857dbe905";}', 1498620214, '173.0.81.1'),
(116, 'Tried to pay Funds (100.00): 0 Userid:0', 1498620214, '173.0.81.1'),
(117, 'Attempted to pay Funds', 1498621561, '173.0.81.1');
INSERT INTO `ipn_log` (`ID`, `data`, `timestamp`, `IP`) VALUES
(118, 'a:34:{s:8:"mc_gross";s:6:"100.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"6REPPN6XQ9R42";s:14:"address_street";s:30:"No 24, Jalan 12/2\r\nTaman Ss 12";s:12:"payment_date";s:25:"20:45:53 Jun 27, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"43650";s:10:"first_name";s:4:"Mohd";s:6:"mc_fee";s:4:"4.70";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:11:"Mohd Johari";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:17:"Bandar baru bangi";s:11:"verify_sign";s:56:"AyconQLeEe4f8eqVHKeTF-LxoWukA3nkemdlasZ5ugAK-2uW48-nooQk";s:11:"payer_email";s:22:"mohd.faiezul@yahoo.com";s:4:"memo";s:18:"Faizz joe telegram";s:6:"txn_id";s:17:"73D70610M8282572N";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"Johari";s:13:"address_state";s:5:"Bangi";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.70";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"100.00";s:12:"ipn_track_id";s:13:"c793b9c48ee87";}', 1498621562, '173.0.81.1'),
(119, 'Tried to pay Funds (100.00): 0 Userid:0', 1498621562, '173.0.81.1'),
(120, 'Attempted to pay Funds', 1498625891, '173.0.81.1'),
(121, 'a:33:{s:8:"mc_gross";s:6:"100.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"VDRM8FNKYBAML";s:14:"address_street";s:26:"Jl. Sekelimus Tengah No.12";s:12:"payment_date";s:25:"21:56:36 Jun 27, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"40262";s:10:"first_name";s:6:"Rianov";s:6:"mc_fee";s:4:"4.20";s:20:"address_country_code";s:2:"ID";s:12:"address_name";s:10:"Rianov Osa";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Indonesia";s:12:"address_city";s:7:"Bandung";s:11:"verify_sign";s:56:"AqBqA1nSf.CEBj1d5rbDP.LO-woKAG2jM0uhVxfKlPIxxKlMoy84kn9l";s:11:"payer_email";s:17:"rianovs@gmail.com";s:6:"txn_id";s:17:"7CK90714LU711782U";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:3:"Osa";s:13:"address_state";s:9:"West Java";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.20";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"ID";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"100.00";s:12:"ipn_track_id";s:13:"c288ec5c87e32";}', 1498625892, '173.0.81.1'),
(122, 'Tried to pay Funds (100.00): 0 Userid:0', 1498625892, '173.0.81.1'),
(123, 'Attempted to pay Funds', 1498627348, '173.0.81.1'),
(124, 'a:25:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"22:22:20 Jun 27, 2017 PDT";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:7:"legoale";s:17:"residence_country";s:2:"ZA";s:13:"payment_gross";s:6:"100.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"ARveBiwHyANMkuk0D1am6Fhek-jTA1QoQuy-VesAI7mCbPr-zov-oR88";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:24:"omolemolegoale@gmail.com";s:6:"txn_id";s:17:"06A44435LD652803A";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:7:"Omolemo";s:8:"payer_id";s:13:"YXFZ87BWQS6C8";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"4.70";s:6:"mc_fee";s:4:"4.70";s:8:"mc_gross";s:6:"100.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"982e54fae41d7";}', 1498627349, '173.0.81.1'),
(125, 'Tried to pay Funds (100.00): 0 Userid:0', 1498627349, '173.0.81.1'),
(126, 'Attempted to pay Funds', 1498823825, '173.0.81.1'),
(127, 'a:33:{s:8:"mc_gross";s:6:"149.17";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"H9BJQS5JDEFE6";s:14:"address_street";s:42:"No 42, Jalan Mewah 2/4, Taman Pandan Mewah";s:12:"payment_date";s:25:"04:56:53 Jun 30, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"68000";s:10:"first_name";s:12:"Uneshddarann";s:6:"mc_fee";s:4:"6.86";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:22:"Uneshddarann Nagandran";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:6:"Ampang";s:11:"verify_sign";s:56:"A5FvFw8b53uqvee.F26DYr7jQsrmAbr96Doa-Hk9A9y.0f9UbMjlRyoX";s:11:"payer_email";s:24:"uneshddarann07@gmail.com";s:6:"txn_id";s:17:"4T7562479K472463T";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:9:"Nagandran";s:13:"address_state";s:8:"Selangor";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.86";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.17";s:12:"ipn_track_id";s:13:"486f4a1bb47e7";}', 1498823827, '173.0.81.1'),
(128, 'Tried to pay Funds (149.17): 0 Userid:0', 1498823827, '173.0.81.1'),
(129, 'Attempted to pay Funds', 1498958583, '173.0.81.1'),
(130, 'a:33:{s:8:"mc_gross";s:5:"98.79";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"ER7NWL3V6S8E4";s:14:"address_street";s:37:"16, Jalan Taman Meru 8\r\nTaman Meru 2B";s:12:"payment_date";s:25:"18:22:53 Jul 01, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"30020";s:10:"first_name";s:16:"Amirzul Muhammad";s:6:"mc_fee";s:4:"4.65";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:25:"Amirzul Muhammad Zulkifli";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:4:"Ipoh";s:11:"verify_sign";s:56:"AyPYlQ8Oa6oGsLhFw3LOipLJYfWnA5Nr7fWsFGQzoW8hTblbl7ywnVhS";s:11:"payer_email";s:21:"amirzulmuhd@gmail.com";s:6:"txn_id";s:17:"4TT833071S5933827";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"Zulkifli";s:13:"address_state";s:5:"PERAK";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.65";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.79";s:12:"ipn_track_id";s:13:"609cc1f8be9ab";}', 1498958584, '173.0.81.1'),
(131, 'Tried to pay Funds (98.79): 0 Userid:0', 1498958584, '173.0.81.1'),
(132, 'Attempted to pay Funds', 1499432001, '173.0.81.1'),
(133, 'a:33:{s:8:"mc_gross";s:5:"49.33";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"JZY9EML3BWBZC";s:14:"address_street";s:6:"A Yani";s:12:"payment_date";s:25:"05:52:48 Jul 07, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"68311";s:10:"first_name";s:4:"Nina";s:6:"mc_fee";s:4:"2.22";s:20:"address_country_code";s:2:"ID";s:12:"address_name";s:11:"Nina Winoto";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Indonesia";s:12:"address_city";s:9:"Situbondo";s:11:"verify_sign";s:56:"AyVuUcpetZUWCXV.EHq.qRhxEb6.A8Qk6kt512CDzmhZiEBLjWndRLG7";s:11:"payer_email";s:21:"winoto.nina@gmail.com";s:6:"txn_id";s:17:"9NS05486WB916000S";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"Winoto";s:13:"address_state";s:10:"Jawa Timur";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.22";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"ID";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.33";s:12:"ipn_track_id";s:13:"fe749dcfe6269";}', 1499432003, '173.0.81.1'),
(134, 'Tried to pay Funds (49.33): 0 Userid:0', 1499432003, '173.0.81.1'),
(135, 'Attempted to pay Funds', 1499476264, '173.0.81.1'),
(136, 'a:34:{s:8:"mc_gross";s:5:"49.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"FLAEJV2ABRXLE";s:14:"address_street";s:49:"No 2, Lorong Rahim Kajai 10,\r\nTaman Tun Dr Ismail";s:12:"payment_date";s:25:"18:10:53 Jul 07, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"60000";s:10:"first_name";s:5:"Arina";s:6:"mc_fee";s:4:"2.46";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:12:"Arina Khalid";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:12:"Kuala Lumpur";s:11:"verify_sign";s:56:"AaWeHP.7MhwA76YhRzXg51I-xt6MASOZVgJSvDphGPa7Q2f0ku18S8Dl";s:11:"payer_email";s:22:"arina_khalid@yahoo.com";s:4:"memo";s:24:"Arina Khalid 60193351993";s:6:"txn_id";s:17:"62694035NL156650W";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"Khalid";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.46";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.00";s:12:"ipn_track_id";s:13:"999c7d4d340ce";}', 1499476265, '173.0.81.1'),
(137, 'Tried to pay Funds (49.00): 0 Userid:0', 1499476265, '173.0.81.1'),
(138, 'Attempted to pay Funds', 1499509294, '173.0.81.1'),
(139, 'a:33:{s:8:"mc_gross";s:5:"49.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"YBPCG8CUHWS3N";s:14:"address_street";s:39:"No.3 jalan 8, Taman sri kerayong, kapar";s:12:"payment_date";s:25:"03:21:24 Jul 08, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"42200";s:10:"first_name";s:12:"Mohd Khairol";s:6:"mc_fee";s:4:"2.46";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:23:"Mohd Khairol Mohd Yasin";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:5:"Klang";s:11:"verify_sign";s:56:"AhohO4-KgSw3.irCt33CzXOvr3DUAo3ZS3ZbdrET81mp7eSvEwDrnm1U";s:11:"payer_email";s:25:"1kwords.picture@gmail.com";s:6:"txn_id";s:17:"0YG06882LK775741H";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:10:"Mohd Yasin";s:13:"address_state";s:8:"Selangor";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.46";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.00";s:12:"ipn_track_id";s:13:"76aa93ac8da1d";}', 1499509295, '173.0.81.1'),
(140, 'Tried to pay Funds (49.00): 0 Userid:0', 1499509295, '173.0.81.1'),
(141, 'Attempted to pay Funds', 1499669510, '173.0.81.1'),
(142, 'a:33:{s:8:"mc_gross";s:5:"49.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"X7U3HU4HV4WZJ";s:14:"address_street";s:42:"55 LORONG RAJA UDANG 1A\r\nKINGFISHER PARK 2";s:12:"payment_date";s:25:"23:51:40 Jul 09, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"88450";s:10:"first_name";s:4:"CHEE";s:6:"mc_fee";s:4:"2.46";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:13:"CHEE SIEW MUI";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:13:"KOTA KINABALU";s:11:"verify_sign";s:56:"AQU0e5vuZCvSg-XJploSa.sGUDlpAb.nSfj97F4lLh0o4vKFgIXRu4vg";s:11:"payer_email";s:16:"csmlcc@gmail.com";s:6:"txn_id";s:17:"79738637K34227533";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"SIEW MUI";s:13:"address_state";s:5:"SABAH";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.46";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.00";s:12:"ipn_track_id";s:13:"91dbc87aaea62";}', 1499669510, '173.0.81.1'),
(143, 'Tried to pay Funds (49.00): 0 Userid:0', 1499669510, '173.0.81.1'),
(144, 'Attempted to pay Funds', 1499696400, '173.0.81.1'),
(145, 'a:34:{s:8:"mc_gross";s:5:"98.78";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"J6Y5W29LPGUGA";s:14:"address_street";s:23:"via della gazzella, 51A";s:12:"payment_date";s:25:"07:19:13 Jul 10, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"47900";s:10:"first_name";s:10:"alessandro";s:6:"mc_fee";s:4:"4.65";s:20:"address_country_code";s:2:"IT";s:12:"address_name";s:16:"alessandro galli";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:5:"Italy";s:12:"address_city";s:6:"rimini";s:11:"verify_sign";s:56:"Ai1PaghZh5FmBLCDCTQpwG8jB264AZQI6pyxn1joaaH2IMhT.wAuESpy";s:11:"payer_email";s:20:"alegalli66@gmail.com";s:4:"memo";s:39:"Acquisto un mese dei vostri segnali pro";s:6:"txn_id";s:17:"3P0535112C1465134";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"galli";s:13:"address_state";s:6:"Rimini";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.65";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"IT";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.78";s:12:"ipn_track_id";s:13:"adc214203f55b";}', 1499696401, '173.0.81.1'),
(146, 'Tried to pay Funds (98.78): 0 Userid:0', 1499696401, '173.0.81.1'),
(147, 'Attempted to pay Funds', 1500035826, '173.0.81.1'),
(148, 'a:34:{s:8:"mc_gross";s:5:"49.84";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"V9R2J7MKCPEJC";s:14:"address_street";s:32:"Seeweg 5\r\nc/o Marko Manasijevski";s:12:"payment_date";s:25:"05:36:44 Jul 14, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"63128";s:10:"first_name";s:5:"Marko";s:6:"mc_fee";s:4:"2.49";s:20:"address_country_code";s:2:"DE";s:12:"address_name";s:9:"MANA SHOP";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:7:"Germany";s:12:"address_city";s:11:"Dietzenbach";s:11:"verify_sign";s:56:"A3O4kA8u3GUe1-FpGzlLQLZgBEFPAu4MXPaPruTJUdmAGaH0VgqqKMfl";s:11:"payer_email";s:33:"marko.manasijevski@googlemail.com";s:6:"txn_id";s:17:"9XH42703F9954432U";s:12:"payment_type";s:7:"instant";s:19:"payer_business_name";s:9:"MANA SHOP";s:9:"last_name";s:12:"Manasijevski";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.49";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"DE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.84";s:12:"ipn_track_id";s:13:"a62ce27faf672";}', 1500035827, '173.0.81.1'),
(149, 'Tried to pay Funds (49.84): 0 Userid:0', 1500035827, '173.0.81.1'),
(150, 'Attempted to pay Funds', 1500172642, '173.0.81.1'),
(151, 'a:33:{s:8:"mc_gross";s:4:"0.49";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"TR4HRDDG9GXQQ";s:14:"address_street";s:32:"Lot 2417 Kampung Binjal Kangkong";s:12:"payment_date";s:25:"19:37:13 Jul 15, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"17040";s:10:"first_name";s:7:"Marzuqi";s:6:"mc_fee";s:4:"0.32";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:15:"Marzuqi Muhamad";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:9:"Pasir mas";s:11:"verify_sign";s:56:"AopIl6BgCn1S8IQ8pZfioXPvudRKAvz.VISwYkWz2kGNDKog7sOx0niG";s:11:"payer_email";s:21:"lanforest89@gmail.com";s:6:"txn_id";s:17:"1TJ342268P219131D";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"Muhamad";s:13:"address_state";s:8:"kelantan";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"0.32";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:4:"0.49";s:12:"ipn_track_id";s:13:"fb165e99769bb";}', 1500172643, '173.0.81.1'),
(152, 'Tried to pay Funds (0.49): 0 Userid:0', 1500172643, '173.0.81.1'),
(153, 'Attempted to pay Funds', 1500177542, '173.0.81.1'),
(154, 'a:33:{s:8:"mc_gross";s:5:"19.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"TR4HRDDG9GXQQ";s:14:"address_street";s:32:"Lot 2417 Kampung Binjal Kangkong";s:12:"payment_date";s:25:"20:58:52 Jul 15, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"17040";s:10:"first_name";s:7:"Marzuqi";s:6:"mc_fee";s:4:"1.14";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:15:"Marzuqi Muhamad";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:9:"Pasir mas";s:11:"verify_sign";s:56:"A9l.LI4g.XybA.wyt8BlkNuIcjNnAeTZXDK5AbQQi5utu5.lRAhGMAAy";s:11:"payer_email";s:21:"lanforest89@gmail.com";s:6:"txn_id";s:17:"4A445252SV7358811";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"Muhamad";s:13:"address_state";s:8:"kelantan";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"1.14";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"19.00";s:12:"ipn_track_id";s:13:"8e842f6363bc2";}', 1500177543, '173.0.81.1'),
(155, 'Tried to pay Funds (19.00): 0 Userid:0', 1500177543, '173.0.81.1'),
(156, 'Attempted to pay Funds', 1500193686, '173.0.81.1'),
(157, 'a:34:{s:8:"mc_gross";s:5:"49.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"XUUN8HZKU9T2A";s:14:"address_street";s:33:"lot 5610 tg jara\r\n364 bukit catak";s:12:"payment_date";s:25:"01:27:58 Jul 16, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"23000";s:10:"first_name";s:4:"mohd";s:6:"mc_fee";s:4:"2.46";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:9:"mohd rani";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:6:"dungun";s:11:"verify_sign";s:56:"ApdA1KxaJ0NoZX19A4V9Nr6gS.obAu5lPljOuBzBJCmXOkq8xvD4fR5J";s:11:"payer_email";s:22:"mohdamrirani@gmail.com";s:4:"memo";s:84:"Bayaran untuk signal pro service from MOHD AMRI BIN RANI H/PHONE:0199844848 MALAYSIA";s:6:"txn_id";s:17:"6AY01509M07758219";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:4:"rani";s:13:"address_state";s:10:"terengganu";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.46";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.00";s:12:"ipn_track_id";s:13:"6391e67e2239e";}', 1500193687, '173.0.81.1'),
(158, 'Tried to pay Funds (49.00): 0 Userid:0', 1500193687, '173.0.81.1'),
(159, 'Attempted to pay Funds', 1500195353, '173.0.81.1'),
(160, 'a:33:{s:8:"mc_gross";s:6:"100.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:9:"confirmed";s:8:"payer_id";s:13:"EXU6TG9WF5RGS";s:14:"address_street";s:27:"352  Sussex St  \r\nUnit 1911";s:12:"payment_date";s:25:"01:55:41 Jul 16, 2017 PDT";s:14:"payment_status";s:7:"Pending";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"2000";s:10:"first_name";s:5:"Henri";s:20:"address_country_code";s:2:"AU";s:12:"address_name";s:14:"Henri Purnawan";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Australia";s:12:"address_city";s:6:"Sydney";s:11:"verify_sign";s:56:"A.AzgZEU.V1wrC92CwtVxQAv1DDQAltOcmt0YZSUVyE5xLCitffJ5sAY";s:11:"payer_email";s:24:"henri.purnawan@gmail.com";s:4:"memo";s:44:"Forex Account Management for Henri Purnawan.";s:6:"txn_id";s:17:"1G006197A2946243J";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"Purnawan";s:13:"address_state";s:3:"NSW";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"pending_reason";s:14:"multi_currency";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"AUD";s:17:"residence_country";s:2:"AU";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:0:"";s:12:"ipn_track_id";s:13:"96c76d9d54c44";}', 1500195359, '173.0.81.1'),
(161, 'Tried to pay Funds (100.00): 0 Userid:0', 1500195359, '173.0.81.1'),
(162, 'Attempted to pay Funds', 1500196986, '173.0.81.1'),
(163, 'a:33:{s:8:"mc_gross";s:6:"100.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:9:"confirmed";s:8:"payer_id";s:13:"EXU6TG9WF5RGS";s:14:"address_street";s:27:"352  Sussex St  \r\nUnit 1911";s:12:"payment_date";s:25:"01:55:41 Jul 16, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"2000";s:10:"first_name";s:5:"Henri";s:6:"mc_fee";s:4:"4.70";s:20:"address_country_code";s:2:"AU";s:12:"address_name";s:14:"Henri Purnawan";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:15:"address_country";s:9:"Australia";s:12:"address_city";s:6:"Sydney";s:11:"verify_sign";s:56:"AP37U7gPUL7wW.bhj7gUYHr1YqBVAVn2Kos3436yPNQzEU9qJYyPw0yg";s:11:"payer_email";s:24:"henri.purnawan@gmail.com";s:4:"memo";s:44:"Forex Account Management for Henri Purnawan.";s:6:"txn_id";s:17:"1G006197A2946243J";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"Purnawan";s:13:"address_state";s:3:"NSW";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:0:"";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"AUD";s:17:"residence_country";s:2:"AU";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:0:"";s:12:"ipn_track_id";s:13:"36adfd58900f1";}', 1500196986, '173.0.81.1'),
(164, 'Tried to pay Funds (100.00): 0 Userid:0', 1500196986, '173.0.81.1'),
(165, 'Attempted to pay Funds', 1500199876, '173.0.81.1'),
(166, 'a:25:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"03:11:05 Jul 16, 2017 PDT";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:7:"Wahyudi";s:17:"residence_country";s:2:"ID";s:13:"payment_gross";s:6:"180.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"AnOqCunYXM7tWHkwCTIQ5blwzMflAFlYdJ2vyxo9M6oaVlmgkR9zOrFU";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:22:"awahyudi0879@gmail.com";s:6:"txn_id";s:17:"0K242080TP3629600";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:16:"Agustinus Didiek";s:8:"payer_id";s:13:"MWNFN63HJXG4L";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"7.32";s:6:"mc_fee";s:4:"7.32";s:8:"mc_gross";s:6:"180.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"ade8ebc76efce";}', 1500199877, '173.0.81.1'),
(167, 'Tried to pay Funds (180.00): 0 Userid:0', 1500199877, '173.0.81.1'),
(168, 'Attempted to pay Funds', 1500207985, '173.0.81.1'),
(169, 'a:33:{s:8:"mc_gross";s:5:"30.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"TR4HRDDG9GXQQ";s:14:"address_street";s:32:"Lot 2417 Kampung Binjal Kangkong";s:12:"payment_date";s:25:"05:26:18 Jul 16, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"17040";s:10:"first_name";s:7:"Marzuqi";s:6:"mc_fee";s:4:"1.62";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:15:"Marzuqi Muhamad";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:9:"Pasir mas";s:11:"verify_sign";s:56:"AZfnGop49sf6bIkvk-UIIwAT3vE6AbvIkT44f1Y48qBl-uC157ysmy4p";s:11:"payer_email";s:21:"lanforest89@gmail.com";s:6:"txn_id";s:17:"70T44728BG557702T";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"Muhamad";s:13:"address_state";s:8:"kelantan";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"1.62";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"30.00";s:12:"ipn_track_id";s:12:"c0002dd41ae1";}', 1500207986, '173.0.81.1'),
(170, 'Tried to pay Funds (30.00): 0 Userid:0', 1500207986, '173.0.81.1'),
(171, 'Attempted to pay Funds', 1500619896, '173.0.81.1'),
(172, 'a:33:{s:8:"mc_gross";s:5:"83.50";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"PBVMHM39MFKSG";s:14:"address_street";s:13:"24 Ginger crt";s:12:"payment_date";s:25:"23:51:25 Jul 20, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"n1g5b3";s:10:"first_name";s:4:"Ayza";s:6:"mc_fee";s:4:"3.97";s:20:"address_country_code";s:2:"CA";s:12:"address_name";s:9:"Ayza Baig";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:6:"Canada";s:12:"address_city";s:6:"Guelph";s:11:"verify_sign";s:56:"Asz-VR6gq4.PZCPEQJPOaVZ3cHXaADbAuqKUq0RmDL3hpywgQPDeO8EJ";s:11:"payer_email";s:26:"gujrat_de_kuri@hotmail.com";s:6:"txn_id";s:17:"6YP70367RW672532V";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:4:"Baig";s:13:"address_state";s:7:"Ontario";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.97";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"CA";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"83.50";s:12:"ipn_track_id";s:13:"b8b77006e220e";}', 1500619897, '173.0.81.1'),
(173, 'Tried to pay Funds (83.50): 0 Userid:0', 1500619897, '173.0.81.1'),
(174, 'Attempted to pay Funds', 1501058652, '173.0.81.1'),
(175, 'a:33:{s:8:"mc_gross";s:6:"300.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"WNFVKRF3XKTZ2";s:14:"address_street";s:17:"41 wilandra drive";s:12:"payment_date";s:25:"01:44:02 Jul 26, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"3029";s:10:"first_name";s:8:"paramjit";s:6:"mc_fee";s:5:"13.50";s:20:"address_country_code";s:2:"AU";s:12:"address_name";s:14:"paramjit singh";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Australia";s:12:"address_city";s:7:"tarneit";s:11:"verify_sign";s:56:"AAOnhFQsgt7FWvfVvoGJIn6lntPkAxoadHecaefKDgbpB-bKel8HqXs3";s:11:"payer_email";s:23:"rajiraji20000@gmail.com";s:6:"txn_id";s:17:"30K79231FV100600M";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"singh";s:13:"address_state";s:8:"Victoria";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:0:"";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"AUD";s:17:"residence_country";s:2:"AU";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:0:"";s:12:"ipn_track_id";s:13:"de4867528f68f";}', 1501058653, '173.0.81.1'),
(176, 'Tried to pay Funds (300.00): 0 Userid:0', 1501058653, '173.0.81.1'),
(177, 'Attempted to pay Funds', 1501232963, '173.0.81.1'),
(178, 'a:33:{s:8:"mc_gross";s:5:"99.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"VDRM8FNKYBAML";s:14:"address_street";s:26:"Jl. Sekelimus Tengah No.12";s:12:"payment_date";s:25:"02:09:13 Jul 28, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"40262";s:10:"first_name";s:6:"Rianov";s:6:"mc_fee";s:4:"4.16";s:20:"address_country_code";s:2:"ID";s:12:"address_name";s:10:"Rianov Osa";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Indonesia";s:12:"address_city";s:7:"Bandung";s:11:"verify_sign";s:56:"AS54rPUCw9wOTuVl0m1aSg09HaI8Ax6XuVb7L.LMNnQRPeGncryDhA5G";s:11:"payer_email";s:17:"rianovs@gmail.com";s:6:"txn_id";s:17:"58U696618R132654V";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:3:"Osa";s:13:"address_state";s:9:"West Java";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.16";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"ID";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"99.00";s:12:"ipn_track_id";s:13:"785b815f8ed6b";}', 1501232964, '173.0.81.1'),
(179, 'Tried to pay Funds (99.00): 0 Userid:0', 1501232964, '173.0.81.1'),
(180, 'Attempted to pay Funds', 1501323872, '173.0.81.1'),
(181, 'a:34:{s:8:"mc_gross";s:5:"49.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"G7P3Y8GDHM9V4";s:14:"address_street";s:39:"B332 Jalan 9 Cinta Sayang  Resort Homes";s:12:"payment_date";s:25:"03:24:22 Jul 29, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"08000";s:10:"first_name";s:14:"MUHAMAD HAIKAL";s:6:"mc_fee";s:4:"2.46";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:5:"Forex";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:13:"Sungai Petani";s:11:"verify_sign";s:56:"AoQHwKy2ZyawoKk0iKZB2xmuF33TA3-XSEEBXbyIRc4GJfUrJioUD0-S";s:11:"payer_email";s:22:"haikalhamdii@gmail.com";s:6:"txn_id";s:17:"2XU14491JD034883E";s:12:"payment_type";s:7:"instant";s:19:"payer_business_name";s:5:"Forex";s:9:"last_name";s:5:"HAMDI";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.46";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.00";s:12:"ipn_track_id";s:13:"8ca42aecc5b12";}', 1501323872, '173.0.81.1'),
(182, 'Tried to pay Funds (49.00): 0 Userid:0', 1501323872, '173.0.81.1'),
(183, 'Attempted to pay Funds', 1501351126, '173.0.81.1'),
(184, 'a:34:{s:8:"mc_gross";s:5:"40.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"ELWZHKS6YDCNU";s:14:"address_street";s:39:"salem main road kaniyamoor\r\nchinnasalem";s:12:"payment_date";s:25:"10:58:35 Jul 29, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"606201";s:10:"first_name";s:11:"prabhakaran";s:6:"mc_fee";s:4:"2.06";s:20:"address_country_code";s:2:"IN";s:12:"address_name";s:13:"prabhakaran k";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:5:"India";s:12:"address_city";s:11:"chinnasalem";s:11:"verify_sign";s:56:"AsA9zTxZOXofFCweKOzeKrTucto.A97ghvHYxQ7bBi5x3v7JEpUxUXis";s:11:"payer_email";s:18:"schrince@gmail.com";s:4:"memo";s:18:"schrince@gmail.com";s:6:"txn_id";s:17:"4R4222822G411781C";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:1:"k";s:13:"address_state";s:10:"Tamil Nadu";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.06";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"IN";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"40.00";s:12:"ipn_track_id";s:13:"c160e37178c9c";}', 1501351126, '173.0.81.1'),
(185, 'Tried to pay Funds (40.00): 0 Userid:0', 1501351126, '173.0.81.1'),
(186, 'Attempted to pay Funds', 1501376913, '173.0.81.1'),
(187, 'a:33:{s:8:"mc_gross";s:6:"149.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"L6JTBUES8TCX2";s:14:"address_street";s:36:"AVENIDA DAS INDSTRIAS  814  \r\nSO JOO";s:12:"payment_date";s:25:"18:08:24 Jul 29, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:9:"90200-290";s:10:"first_name";s:8:"jonathan";s:6:"mc_fee";s:4:"6.86";s:20:"address_country_code";s:2:"BR";s:12:"address_name";s:26:"jonathan moliterni haubert";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:6:"Brazil";s:12:"address_city";s:12:"PORTO ALEGRE";s:11:"verify_sign";s:56:"A3-9dNFM1D5PmLqMu2uZdy4b0B-.ACUnaxy-NS9TyRClddvbjhBfSxWa";s:11:"payer_email";s:26:"mercado.livre.jh@gmail.com";s:6:"txn_id";s:17:"5XK812578L498840F";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:17:"moliterni haubert";s:13:"address_state";s:2:"RS";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.86";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"BR";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.00";s:12:"ipn_track_id";s:13:"357b41ea804ae";}', 1501376914, '173.0.81.1'),
(188, 'Tried to pay Funds (149.00): 0 Userid:0', 1501376914, '173.0.81.1'),
(189, 'Attempted to pay Funds', 1501418860, '173.0.81.1'),
(190, 'a:34:{s:8:"mc_gross";s:6:"149.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"U88DU48UT9KBA";s:14:"address_street";s:31:"27. Lintang Rusa. Taman Selamat";s:12:"payment_date";s:25:"05:47:30 Jul 30, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"14000";s:10:"first_name";s:7:"Ang Eng";s:6:"mc_fee";s:4:"6.86";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:23:"Ang Eng Keat Enterprise";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:14:"Bukit Mertajam";s:11:"verify_sign";s:56:"AB63pz3qIrLOaZiQqVB04NGoucJcA49fzEu2Mf8PTBLsLM1gw7IIMeQi";s:11:"payer_email";s:16:"2aek@live.com.my";s:6:"txn_id";s:17:"2PV770534N7823418";s:12:"payment_type";s:7:"instant";s:19:"payer_business_name";s:23:"Ang Eng Keat Enterprise";s:9:"last_name";s:4:"Keat";s:13:"address_state";s:6:"Penang";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.86";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.00";s:12:"ipn_track_id";s:13:"6858da374833f";}', 1501418860, '173.0.81.1'),
(191, 'Tried to pay Funds (149.00): 0 Userid:0', 1501418860, '173.0.81.1'),
(192, 'Attempted to pay Funds', 1501506054, '173.0.81.1'),
(193, 'a:33:{s:8:"mc_gross";s:5:"98.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"B43F27FG37QRE";s:14:"address_street";s:13:"231 Nether St";s:12:"payment_date";s:25:"06:00:06 Jul 31, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"N3 1NT";s:10:"first_name";s:6:"Maryam";s:6:"mc_fee";s:4:"4.61";s:20:"address_country_code";s:2:"GB";s:12:"address_name";s:17:"Maryam Zahmatkesh";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:14:"United Kingdom";s:12:"address_city";s:6:"LONDON";s:11:"verify_sign";s:56:"AIOdBBbi4npzX0AuVhXK8vI8edOZAJYuak1Nnuv.inUX6Ym1v40AqUqS";s:11:"payer_email";s:16:"mz1381@yahoo.com";s:6:"txn_id";s:17:"6N245463VC633920K";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:10:"Zahmatkesh";s:13:"address_state";s:2:"-1";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.61";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"GB";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.00";s:12:"ipn_track_id";s:13:"a9b43e3a64fc9";}', 1501506054, '173.0.81.1'),
(194, 'Tried to pay Funds (98.00): 0 Userid:0', 1501506054, '173.0.81.1'),
(195, 'Attempted to pay Funds', 1501601585, '173.0.81.1'),
(196, 'a:33:{s:8:"mc_gross";s:5:"50.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"QVMTVSCXRDYY4";s:14:"address_street";s:72:"Lot 1022 jalan sekendi kampung batu 38 sabak bernam selangor darul ehsan";s:12:"payment_date";s:25:"08:32:52 Aug 01, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"45200";s:10:"first_name";s:11:"ABDUL WAHAB";s:6:"mc_fee";s:4:"2.50";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:19:"ABDUL WAHAB MORKLIS";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:12:"Sabak bernam";s:11:"verify_sign";s:56:"ApN00ggOYxomFV-tOqqBtLrcA8vbAZLWuQIYHaTYWvQq54xVfGH8MhUX";s:11:"payer_email";s:26:"wahabmorklis1991@gmail.com";s:6:"txn_id";s:17:"49W79127XA160342Y";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"MORKLIS";s:13:"address_state";s:8:"selangor";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.50";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"50.00";s:12:"ipn_track_id";s:13:"60b4a515ed0d9";}', 1501601585, '173.0.81.1'),
(197, 'Tried to pay Funds (50.00): 0 Userid:0', 1501601585, '173.0.81.1'),
(198, 'Attempted to pay Funds', 1501635484, '173.0.81.1'),
(199, 'a:33:{s:8:"mc_gross";s:6:"149.22";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"ER7NWL3V6S8E4";s:14:"address_street";s:37:"16, Jalan Taman Meru 8\r\nTaman Meru 2B";s:12:"payment_date";s:25:"17:57:23 Aug 01, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"30020";s:10:"first_name";s:16:"Amirzul Muhammad";s:6:"mc_fee";s:4:"6.87";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:25:"Amirzul Muhammad Zulkifli";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:4:"Ipoh";s:11:"verify_sign";s:56:"Alpz2FsXqFbNgbKHEk8HZtLKZnQbAURQRiYxU4mUmbcTwn3hDFEzZb9W";s:11:"payer_email";s:21:"amirzulmuhd@gmail.com";s:6:"txn_id";s:17:"6XD76349JG608760E";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"Zulkifli";s:13:"address_state";s:5:"PERAK";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.87";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.22";s:12:"ipn_track_id";s:12:"3a13016ade5e";}', 1501635485, '173.0.81.1'),
(200, 'Tried to pay Funds (149.22): 0 Userid:0', 1501635485, '173.0.81.1'),
(201, 'Attempted to pay Funds', 1501684595, '173.0.81.1'),
(202, 'a:25:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"07:36:06 Aug 02, 2017 PDT";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:4:"Yang";s:17:"residence_country";s:2:"CN";s:13:"payment_gross";s:5:"75.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"Ao68DNqlX5gVaPZlGVYk.BmBnaqJAJG1294tQeVpIq.2IppvGrTgyJPP";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:24:"yangxiaoyu_caizi@msn.com";s:6:"txn_id";s:17:"0AT44806F8422742L";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:6:"Xiaoyu";s:8:"payer_id";s:13:"UZZTJVB4JA9Y8";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"3.60";s:6:"mc_fee";s:4:"3.60";s:8:"mc_gross";s:5:"75.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"cfe39ab14313f";}', 1501684596, '173.0.81.1'),
(203, 'Tried to pay Funds (75.00): 0 Userid:0', 1501684596, '173.0.81.1'),
(204, 'Attempted to pay Funds', 1501713709, '173.0.81.1'),
(205, 'a:32:{s:19:"transaction_subject";s:0:"";s:8:"txn_type";s:10:"send_money";s:12:"payment_date";s:25:"15:41:32 Aug 02, 2017 PDT";s:9:"last_name";s:5:"Uddin";s:17:"residence_country";s:2:"GB";s:14:"pending_reason";s:14:"multi_currency";s:13:"payment_gross";s:0:"";s:11:"mc_currency";s:3:"GBP";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_street";s:1:"1";s:11:"verify_sign";s:56:"AXl15mWr.PGF-aZheGpZoLwRHc3cAAnsjoZDFr41ICkGJ4Z1rxDXHF8z";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:18:"uddininv@gmail.com";s:6:"txn_id";s:17:"51G380731L240833B";s:14:"address_status";s:11:"unconfirmed";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:5:"Aamir";s:20:"address_country_code";s:2:"GB";s:8:"payer_id";s:13:"HY4NCYUNYTBWG";s:12:"address_city";s:9:"Isleworth";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:13:"address_state";s:0:"";s:14:"payment_status";s:7:"Pending";s:8:"mc_gross";s:6:"300.00";s:11:"address_zip";s:7:"TW7 5QA";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:15:"address_country";s:14:"United Kingdom";s:12:"address_name";s:11:"Aamir Uddin";s:12:"ipn_track_id";s:12:"a3fc07223510";}', 1501713709, '173.0.81.1'),
(206, 'Tried to pay Funds (300.00): 0 Userid:0', 1501713709, '173.0.81.1'),
(207, 'Attempted to pay Funds', 1501716607, '173.0.81.1'),
(208, 'a:32:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"15:41:32 Aug 02, 2017 PDT";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:5:"Uddin";s:17:"residence_country";s:2:"GB";s:13:"payment_gross";s:0:"";s:11:"mc_currency";s:3:"GBP";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_street";s:1:"1";s:11:"verify_sign";s:56:"A7bVkXNneIKOuae9kjm7b3Fry1IvAk.dlCCgh9o3R-gi6cBpESoEVm0-";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:18:"uddininv@gmail.com";s:6:"txn_id";s:17:"51G380731L240833B";s:14:"address_status";s:11:"unconfirmed";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:5:"Aamir";s:20:"address_country_code";s:2:"GB";s:8:"payer_id";s:13:"HY4NCYUNYTBWG";s:12:"address_city";s:9:"Isleworth";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:13:"address_state";s:0:"";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:0:"";s:6:"mc_fee";s:5:"13.40";s:8:"mc_gross";s:6:"300.00";s:11:"address_zip";s:7:"TW7 5QA";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:15:"address_country";s:14:"United Kingdom";s:12:"address_name";s:11:"Aamir Uddin";s:12:"ipn_track_id";s:13:"e7c13158d5bb7";}', 1501716607, '173.0.81.1'),
(209, 'Tried to pay Funds (300.00): 0 Userid:0', 1501716607, '173.0.81.1'),
(210, 'Attempted to pay Funds', 1501810290, '173.0.81.1'),
(211, 'a:33:{s:8:"mc_gross";s:5:"80.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"C2QQH4HEB3EXL";s:14:"address_street";s:13:"Colima\r\nTibas";s:12:"payment_date";s:25:"18:31:06 Aug 03, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"11305";s:10:"first_name";s:6:"Adrian";s:6:"mc_fee";s:4:"3.82";s:20:"address_country_code";s:2:"CR";s:12:"address_name";s:20:"Adrian Solano tellez";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:10:"Costa Rica";s:12:"address_city";s:8:"San jose";s:11:"verify_sign";s:56:"An7H3kH8.DY56ocyWs9pEuVQUM5wAorp2zW76jvdwqnrWAfMeeFt6bOz";s:11:"payer_email";s:21:"adrsolano77@gmail.com";s:6:"txn_id";s:17:"94W46303PJ074032L";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:13:"Solano tellez";s:13:"address_state";s:8:"San jose";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.82";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"CR";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"80.00";s:12:"ipn_track_id";s:13:"c130257d9ef79";}', 1501810291, '173.0.81.1'),
(212, 'Tried to pay Funds (80.00): 0 Userid:0', 1501810291, '173.0.81.1'),
(213, 'Attempted to pay Funds', 1502036245, '173.0.81.1'),
(214, 'a:34:{s:8:"mc_gross";s:6:"149.27";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"H6WYUYZJPT7DW";s:14:"address_street";s:15:"place terdelt,2";s:12:"payment_date";s:25:"09:17:14 Aug 06, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"1030";s:10:"first_name";s:7:"youssef";s:6:"mc_fee";s:4:"6.87";s:20:"address_country_code";s:2:"BE";s:12:"address_name";s:8:"Thedream";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:7:"Belgium";s:12:"address_city";s:9:"bruxelles";s:11:"verify_sign";s:56:"ATZo1sTL1YpCT4KW-CzFolXviWIiAs1av9MUKDY4fe.VN-3q61z82JW2";s:11:"payer_email";s:19:"tyoussef5@gmail.com";s:6:"txn_id";s:17:"2N584591XD9925046";s:12:"payment_type";s:7:"instant";s:19:"payer_business_name";s:8:"Thedream";s:9:"last_name";s:8:"talhaoui";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.87";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"BE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.27";s:12:"ipn_track_id";s:13:"dc252c8d21883";}', 1502036245, '173.0.81.1'),
(215, 'Tried to pay Funds (149.27): 0 Userid:0', 1502036245, '173.0.81.1'),
(216, 'Attempted to pay Funds', 1502046819, '173.0.81.1'),
(217, 'a:33:{s:8:"mc_gross";s:5:"49.94";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"QBALKN4JETG74";s:14:"address_street";s:22:"8725 W Corky OBrien Dr";s:12:"payment_date";s:25:"12:13:29 Aug 06, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"85353";s:10:"first_name";s:8:"Veronica";s:6:"mc_fee";s:4:"2.50";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:15:"Veronica Durazo";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:8:"TOLLESON";s:11:"verify_sign";s:56:"AQyKZElxcNzF9d1RoEmI7.ObsATiA-sg08bP7IQ4yEaZ3J2mxlB9vngV";s:11:"payer_email";s:17:"vdg1168@gmail.com";s:6:"txn_id";s:17:"6JV17280ME724814R";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"Durazo";s:13:"address_state";s:2:"AZ";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.50";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"US";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.94";s:12:"ipn_track_id";s:13:"7960f6d36d23c";}', 1502046819, '173.0.81.1'),
(218, 'Tried to pay Funds (49.94): 0 Userid:0', 1502046819, '173.0.81.1'),
(219, 'Attempted to pay Funds', 1502207339, '173.0.81.1');
INSERT INTO `ipn_log` (`ID`, `data`, `timestamp`, `IP`) VALUES
(220, 'a:34:{s:8:"mc_gross";s:4:"5.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"6A9BE9UGGQAYL";s:14:"address_street";s:26:"Jl tukad batanghari no 111";s:12:"payment_date";s:25:"08:48:48 Aug 08, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"80225";s:10:"first_name";s:6:"I GEDE";s:6:"mc_fee";s:4:"0.50";s:20:"address_country_code";s:2:"ID";s:12:"address_name";s:24:"Futures Asset Management";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Indonesia";s:12:"address_city";s:8:"Denpasar";s:11:"verify_sign";s:56:"AaqMqnunqK55VJsgJMwXriimEXgaAFQUaAfrrfDRCiIRIiXbCF1ah.A6";s:11:"payer_email";s:21:"suryagede88@gmail.com";s:6:"txn_id";s:17:"6XR9927604277634R";s:12:"payment_type";s:7:"instant";s:19:"payer_business_name";s:24:"Futures Asset Management";s:9:"last_name";s:16:"ALIT SURYA UTAMA";s:13:"address_state";s:4:"Bali";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"0.50";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"ID";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:4:"5.00";s:12:"ipn_track_id";s:13:"7548e80f5d8ec";}', 1502207339, '173.0.81.1'),
(221, 'Tried to pay Funds (5.00): 0 Userid:0', 1502207339, '173.0.81.1'),
(222, 'Attempted to pay Funds', 1502291701, '173.0.81.1'),
(223, 'a:33:{s:8:"mc_gross";s:6:"149.19";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:9:"confirmed";s:8:"payer_id";s:13:"9ZDPLT24PKW7E";s:14:"address_street";s:23:"20 Beeston Way\r\nFeltham";s:12:"payment_date";s:25:"08:14:49 Aug 09, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:8:"TW14 0HB";s:10:"first_name";s:6:"Joseph";s:6:"mc_fee";s:4:"6.86";s:20:"address_country_code";s:2:"GB";s:12:"address_name";s:15:"Joseph Alvarado";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:14:"United Kingdom";s:12:"address_city";s:9:"Middlesex";s:11:"verify_sign";s:56:"AbVpE46Hdzh6d29Gu3X3iR8qqXBgAS7gGdky0D3c6ys5HFsEMzp533dE";s:11:"payer_email";s:23:"jsphalvarado1@gmail.com";s:6:"txn_id";s:17:"840482004R266202E";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"Alvarado";s:13:"address_state";s:9:"Middlesex";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.86";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"GB";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.19";s:12:"ipn_track_id";s:12:"fe355f493ca4";}', 1502291701, '173.0.81.1'),
(224, 'Tried to pay Funds (149.19): 0 Userid:0', 1502291701, '173.0.81.1'),
(225, 'Attempted to pay Funds', 1502555998, '173.0.81.1'),
(226, 'a:34:{s:8:"mc_gross";s:5:"98.98";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"WL9QAH4DWFEFQ";s:14:"address_street";s:45:"No.27, Old Village Spice Garden, Koholanwela,";s:12:"payment_date";s:25:"09:39:45 Aug 12, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"21074";s:10:"first_name";s:7:"Rukshan";s:6:"mc_fee";s:4:"4.66";s:20:"address_country_code";s:2:"LK";s:12:"address_name";s:14:"Rukshan''s Shop";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Sri Lanka";s:12:"address_city";s:16:"Madawala Ulpotha";s:11:"verify_sign";s:56:"ADmPnIPY3I7Vr6t4FxyXGQRPk2D-ANd3bJrjPzvSnOxCuH6.GCu0jKv9";s:11:"payer_email";s:21:"rukshanjayz@gmail.com";s:6:"txn_id";s:17:"92884644SJ632231R";s:12:"payment_type";s:7:"instant";s:19:"payer_business_name";s:14:"Rukshan''s Shop";s:9:"last_name";s:13:"Hettiarachchi";s:13:"address_state";s:16:"Central Province";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.66";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"LK";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.98";s:12:"ipn_track_id";s:13:"fbe015b04f943";}', 1502555999, '173.0.81.1'),
(227, 'Tried to pay Funds (98.98): 0 Userid:0', 1502555999, '173.0.81.1'),
(228, 'Attempted to pay Funds', 1502609581, '173.0.81.1'),
(229, 'a:33:{s:8:"mc_gross";s:5:"98.25";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"4ZYK9KAQEXJVG";s:14:"address_street";s:41:"No. 1326, Lorong 21, RPR Kidurong Fasa 1,";s:12:"payment_date";s:25:"00:32:52 Aug 13, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"97000";s:10:"first_name";s:6:"Ismawi";s:6:"mc_fee";s:4:"4.62";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:14:"Ismawi Julaihi";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:7:"Bintulu";s:11:"verify_sign";s:56:"AVVNtc3a--X8jnKI2WyquuHonn8vAuCUw6d3RK5vwGm2FbwQ5GPJrroG";s:11:"payer_email";s:23:"ismawijulaihi@yahoo.com";s:6:"txn_id";s:17:"4U051981NC824012P";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"Julaihi";s:13:"address_state";s:7:"Sarawak";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.62";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.25";s:12:"ipn_track_id";s:13:"5f6cf8178179d";}', 1502609582, '173.0.81.1'),
(230, 'Tried to pay Funds (98.25): 0 Userid:0', 1502609582, '173.0.81.1'),
(231, 'Attempted to pay Funds', 1502645672, '173.0.81.1'),
(232, 'a:33:{s:8:"mc_gross";s:6:"357.65";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"RQY3GHKNRGBJ2";s:14:"address_street";s:38:"#890 Papourie Road,Central Barrackpore";s:12:"payment_date";s:25:"10:34:22 Aug 13, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:0:"";s:10:"first_name";s:6:"Kirwin";s:6:"mc_fee";s:5:"16.04";s:20:"address_country_code";s:2:"TT";s:12:"address_name";s:13:"Kirwin Weston";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:19:"Trinidad and Tobago";s:12:"address_city";s:11:"Barrackpore";s:11:"verify_sign";s:56:"AGqrMfxHCwXhK485XG3XKnmHcfUIA54wx7YGOWLN8LuCealK9XUA3sP8";s:11:"payer_email";s:24:"kirwinweston@hotmail.com";s:6:"txn_id";s:17:"72996903B8981284P";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"Weston";s:13:"address_state";s:8:"Victoria";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:5:"16.04";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"TT";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"357.65";s:12:"ipn_track_id";s:13:"98be6df5ec025";}', 1502645672, '173.0.81.1'),
(233, 'Tried to pay Funds (357.65): 0 Userid:0', 1502645672, '173.0.81.1'),
(234, 'Attempted to pay Funds', 1502770170, '173.0.81.1'),
(235, 'a:34:{s:8:"mc_gross";s:5:"49.32";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"VRZ685U88F3UC";s:14:"address_street";s:44:"Farmacia Central, Antigua calle del comercio";s:12:"payment_date";s:25:"21:09:13 Aug 14, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:0:"";s:10:"first_name";s:4:"Juan";s:6:"mc_fee";s:4:"2.47";s:20:"address_country_code";s:2:"HN";s:12:"address_name";s:17:"Juan Murillo Meja";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Honduras";s:12:"address_city";s:10:"Ocotepeque";s:11:"verify_sign";s:56:"A9wqb1wB2yeCO.jbe9.C9sMuvcu4AWCmtt.T4eVsr2mtx2tLs8Vz9kSz";s:11:"payer_email";s:22:"juancamume@hotmail.com";s:4:"memo";s:18:"BossFX170200850-49";s:6:"txn_id";s:17:"10T24125E27288941";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:12:"Murillo Meja";s:13:"address_state";s:10:"Ocotepeque";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.47";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"HN";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.32";s:12:"ipn_track_id";s:13:"2181adab823b8";}', 1502770170, '173.0.81.1'),
(236, 'Tried to pay Funds (49.32): 0 Userid:0', 1502770170, '173.0.81.1'),
(237, 'Attempted to pay Funds', 1502827942, '173.0.81.1'),
(238, 'a:33:{s:8:"mc_gross";s:5:"49.90";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"26JDW8ANRHT6L";s:14:"address_street";s:11:"Knollstr.40";s:12:"payment_date";s:25:"13:12:16 Aug 15, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"70191";s:10:"first_name";s:6:"Daniel";s:6:"mc_fee";s:4:"2.50";s:20:"address_country_code";s:2:"DE";s:12:"address_name";s:11:"Daniel Manu";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:7:"Germany";s:12:"address_city";s:9:"Stuttgart";s:11:"verify_sign";s:56:"ANg3NsjulqqZSFJaeNq2b0E5tJtQAFZ.eOEa1.03SttLpP9ujZZoIhgw";s:11:"payer_email";s:22:"danielmanu22@yahoo.com";s:6:"txn_id";s:17:"72817286KL786324C";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:4:"Manu";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.50";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"DE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.90";s:12:"ipn_track_id";s:13:"4c07f7aa6c10e";}', 1502827942, '173.0.81.1'),
(239, 'Tried to pay Funds (49.90): 0 Userid:0', 1502827942, '173.0.81.1'),
(240, 'Attempted to pay Funds', 1502897163, '173.0.81.1'),
(241, 'a:34:{s:8:"mc_gross";s:5:"49.85";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"6EDBD9DY4BP9L";s:14:"address_street";s:22:"Fehivina, K.thulusdhoo";s:12:"payment_date";s:25:"08:24:53 Aug 16, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"08040";s:10:"first_name";s:7:"Hussain";s:6:"mc_fee";s:4:"2.49";s:20:"address_country_code";s:2:"MV";s:12:"address_name";s:13:"Hussain Affan";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Maldives";s:12:"address_city";s:5:"male''";s:11:"verify_sign";s:56:"AdTMsxE7AMEBXH6XGnoaYeZvMyu3ARLDkZerJgZeZmcY7zI8KIyrMUh5";s:11:"payer_email";s:27:"bladiator_appxx@hotmail.com";s:4:"memo";s:20:"Basic Signal Service";s:6:"txn_id";s:17:"26Y07972KU816301J";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"Affan";s:13:"address_state";s:13:"North central";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.49";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MV";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.85";s:12:"ipn_track_id";s:13:"8930a12eaea51";}', 1502897163, '173.0.81.1'),
(242, 'Tried to pay Funds (49.85): 0 Userid:0', 1502897163, '173.0.81.1'),
(243, 'Attempted to pay Funds', 1502948572, '173.0.81.1'),
(244, 'a:33:{s:8:"mc_gross";s:5:"49.22";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"XLPVS8GZDXSPW";s:14:"address_street";s:24:"15601 Sw 137 Ave Apt 258";s:12:"payment_date";s:25:"22:42:42 Aug 16, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"33177";s:10:"first_name";s:7:"Matthew";s:6:"mc_fee";s:4:"2.47";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:16:"Matthew Escalera";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:5:"Miami";s:11:"verify_sign";s:56:"Abb-F1pDodxd694ER0mz3-tE1yi7AyyPYNEskOeZb.k3qLiC9Qf3NEiv";s:11:"payer_email";s:25:"escaleramatthew@yahoo.com";s:6:"txn_id";s:17:"3U878279LA5582451";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"Escalera";s:13:"address_state";s:2:"FL";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.47";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"US";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.22";s:12:"ipn_track_id";s:13:"10f3be0c839c8";}', 1502948578, '173.0.81.1'),
(245, 'Tried to pay Funds (49.22): 0 Userid:0', 1502948578, '173.0.81.1'),
(246, 'Attempted to pay Funds', 1503040165, '173.0.81.1'),
(247, 'a:33:{s:8:"mc_gross";s:5:"49.72";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"3KHLKXW8H9QSS";s:14:"address_street";s:49:"G-T.01-U.09,PANGSAPURI PUTRA DAMAI,\r\nJALAN P 11/E";s:12:"payment_date";s:25:"00:09:16 Aug 18, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"62300";s:10:"first_name";s:19:"MUHAMMAD ZAKIYUDDIN";s:6:"mc_fee";s:4:"2.49";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:34:"MUHAMMAD ZAKIYUDDIN MOHAMAD FADZIL";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:10:"PRESINT 11";s:11:"verify_sign";s:56:"ANcH5ZkdRiyl-UCHf1sjORyUScszA0Sl2H3J3OdHq.PRgFmfmgmrsQEx";s:11:"payer_email";s:24:"zakiyuddin1996@gmail.com";s:6:"txn_id";s:17:"8SM40217L86901418";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:14:"MOHAMAD FADZIL";s:13:"address_state";s:9:"Putrajaya";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.49";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.72";s:12:"ipn_track_id";s:13:"8b81a4982fefb";}', 1503040166, '173.0.81.1'),
(248, 'Tried to pay Funds (49.72): 0 Userid:0', 1503040166, '173.0.81.1'),
(249, 'Attempted to pay Funds', 1503289810, '173.0.81.1'),
(250, 'a:34:{s:8:"mc_gross";s:5:"49.96";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"S3W43SRLCQ5BN";s:14:"address_street";s:28:"No. 60 Jalan 3/52\r\nSeksyen 3";s:12:"payment_date";s:25:"21:29:57 Aug 20, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"43650";s:10:"first_name";s:9:"Faridzuan";s:6:"mc_fee";s:4:"2.50";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:10:"Ody Foodie";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:17:"Bandar Baru Bangi";s:11:"verify_sign";s:56:"AdD.evllf1vyKV3FfB1GVu4-wywWAcBpHmnLHGgLJ8JKBOXUaL7Rt4FJ";s:11:"payer_email";s:19:"odyfoodie@gmail.com";s:6:"txn_id";s:17:"13W03344GS985441V";s:12:"payment_type";s:7:"instant";s:19:"payer_business_name";s:10:"Ody Foodie";s:9:"last_name";s:13:"Kamarulhisham";s:13:"address_state";s:8:"Selangor";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.50";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.96";s:12:"ipn_track_id";s:13:"6ce01eb5411e0";}', 1503289811, '173.0.81.1'),
(251, 'Tried to pay Funds (49.96): 0 Userid:0', 1503289812, '173.0.81.1'),
(252, 'Attempted to pay Funds', 1503507032, '173.0.81.1'),
(253, 'a:23:{s:19:"transaction_subject";s:0:"";s:8:"txn_type";s:10:"send_money";s:12:"payment_date";s:25:"04:07:55 Aug 23, 2017 PDT";s:9:"last_name";s:7:"Sasmara";s:17:"residence_country";s:2:"ID";s:13:"payment_gross";s:4:"1.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:10:"Ineligible";s:11:"verify_sign";s:56:"Any4um6QRKTYyoX.7luqMWLxU.iNAVeBMV8WtgnyHUeH48RsQh9Fg6e3";s:12:"payer_status";s:10:"unverified";s:11:"payer_email";s:19:"kutulisme@gmail.com";s:6:"txn_id";s:17:"02Y23852CJ370450N";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:8:"A A Alit";s:8:"payer_id";s:13:"BDB8PJLT2HKBJ";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:8:"mc_gross";s:4:"1.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"ca9e8633eddf2";}', 1503507032, '173.0.81.1'),
(254, 'Tried to pay Funds (1.00): 0 Userid:0', 1503507032, '173.0.81.1'),
(255, 'Attempted to pay Funds', 1503618130, '173.0.81.1'),
(256, 'a:23:{s:19:"transaction_subject";s:0:"";s:8:"txn_type";s:10:"send_money";s:12:"payment_date";s:25:"16:42:04 Aug 24, 2017 PDT";s:9:"last_name";s:8:"Tjoenedi";s:17:"residence_country";s:2:"US";s:13:"payment_gross";s:5:"10.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:27:"dode.agung.asmara@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:10:"Ineligible";s:11:"verify_sign";s:56:"AasTK3ucGcxl64aW1kxzwduZGjAKAgo-5QZktnHjVp0cnZeQbQ.v3fJC";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:17:"fkresna@gmail.com";s:6:"txn_id";s:17:"73M65875LD879683U";s:14:"receiver_email";s:27:"dode.agung.asmara@gmail.com";s:10:"first_name";s:6:"Freddy";s:8:"payer_id";s:13:"H777TYECSR68N";s:11:"receiver_id";s:13:"JN2Z8KTDPGABW";s:14:"payment_status";s:9:"Completed";s:8:"mc_gross";s:5:"10.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"f42d1a6c57f4f";}', 1503618130, '173.0.81.1'),
(257, 'Tried to pay Funds (10.00): 0 Userid:0', 1503618130, '173.0.81.1'),
(258, 'Attempted to pay Funds', 1503842016, '173.0.81.1'),
(259, 'a:23:{s:19:"transaction_subject";s:0:"";s:8:"txn_type";s:10:"send_money";s:12:"payment_date";s:25:"06:53:30 Aug 27, 2017 PDT";s:9:"last_name";s:8:"Tjoenedi";s:17:"residence_country";s:2:"US";s:13:"payment_gross";s:6:"100.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:27:"dode.agung.asmara@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:10:"Ineligible";s:11:"verify_sign";s:56:"AovEzlPCsQMDpmPF8wyyNnan-Or2AMgH87pEDmgytVMpY6RsqkvDi9A-";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:17:"fkresna@gmail.com";s:6:"txn_id";s:17:"91R55196H8037874T";s:14:"receiver_email";s:27:"dode.agung.asmara@gmail.com";s:10:"first_name";s:6:"Freddy";s:8:"payer_id";s:13:"H777TYECSR68N";s:11:"receiver_id";s:13:"JN2Z8KTDPGABW";s:14:"payment_status";s:9:"Completed";s:8:"mc_gross";s:6:"100.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"5e8dd866cfaea";}', 1503842017, '173.0.81.1'),
(260, 'Tried to pay Funds (100.00): 0 Userid:0', 1503842017, '173.0.81.1'),
(261, 'Attempted to pay Funds', 1503940438, '173.0.81.1'),
(262, 'a:25:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"10:13:52 Aug 28, 2017 PDT";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:5:"Tahan";s:17:"residence_country";s:2:"AE";s:13:"payment_gross";s:6:"149.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"AB4D1gCIktIekr43tuy.8HapuNzkAk5qwp8D2vvVmDAGyzcoe.w5LwVO";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:21:"mubin.tahan@gmail.com";s:6:"txn_id";s:17:"3KY47077RG531500A";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:5:"Mubin";s:8:"payer_id";s:13:"9HTMS8H5QHLKG";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"6.86";s:6:"mc_fee";s:4:"6.86";s:8:"mc_gross";s:6:"149.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:12:"945a9aad3941";}', 1503940439, '173.0.81.1'),
(263, 'Tried to pay Funds (149.00): 0 Userid:0', 1503940439, '173.0.81.1'),
(264, 'Attempted to pay Funds', 1503942774, '173.0.81.1'),
(265, 'a:33:{s:8:"mc_gross";s:6:"149.89";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"R7SKYAUSS6TMY";s:14:"address_street";s:3:"Fuj";s:12:"payment_date";s:25:"10:52:42 Aug 28, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:3:"Fuj";s:10:"first_name";s:7:"Mohamed";s:6:"mc_fee";s:4:"6.90";s:20:"address_country_code";s:2:"AE";s:12:"address_name";s:15:"Mohamed Mohamed";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:20:"United Arab Emirates";s:12:"address_city";s:5:"Dibba";s:11:"verify_sign";s:56:"Abu8MqZSsBiVnxJaA0UDWFcYh9C1AR5UNLvLAqbSUw1FINgrveabjUfU";s:11:"payer_email";s:24:"bigboss5202558@gmail.com";s:6:"txn_id";s:17:"7L30946903021033A";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"Mohamed";s:13:"address_state";s:3:"Uae";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.90";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"AE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.89";s:12:"ipn_track_id";s:13:"f281e9a54e9fc";}', 1503942774, '173.0.81.1'),
(266, 'Tried to pay Funds (149.89): 0 Userid:0', 1503942774, '173.0.81.1'),
(267, 'Attempted to pay Funds', 1503975836, '173.0.81.1'),
(268, 'a:33:{s:8:"mc_gross";s:6:"125.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"JH436ANR2PR5J";s:14:"address_street";s:35:"1, kumanan street,\r\nKarungalpalayam";s:12:"payment_date";s:25:"20:03:45 Aug 28, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"638009";s:10:"first_name";s:13:"Vijayapradeep";s:6:"mc_fee";s:4:"5.80";s:20:"address_country_code";s:2:"IN";s:12:"address_name";s:26:"Vijayapradeep Ramakrishnan";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:5:"India";s:12:"address_city";s:5:"Erode";s:11:"verify_sign";s:56:"ABGcepy0ys3wNDbIdg0iFxdmDjL6Aui8-dK-f7r4nGlF3lZJAD7xYZ-s";s:11:"payer_email";s:26:"vijayapradeep.pt@gmail.com";s:6:"txn_id";s:17:"0A20882838851421W";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:12:"Ramakrishnan";s:13:"address_state";s:10:"Tamil Nadu";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"5.80";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"IN";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"125.00";s:12:"ipn_track_id";s:13:"cf2a6e3af34e0";}', 1503975837, '173.0.81.1'),
(269, 'Tried to pay Funds (125.00): 0 Userid:0', 1503975837, '173.0.81.1'),
(270, 'Attempted to pay Funds', 1504061154, '173.0.81.1'),
(271, 'a:33:{s:8:"mc_gross";s:6:"149.15";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"L6JTBUES8TCX2";s:14:"address_street";s:36:"AVENIDA DAS INDSTRIAS  814  \r\nSO JOO";s:12:"payment_date";s:25:"19:45:42 Aug 29, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:9:"90200-290";s:10:"first_name";s:8:"jonathan";s:6:"mc_fee";s:4:"6.86";s:20:"address_country_code";s:2:"BR";s:12:"address_name";s:26:"jonathan moliterni haubert";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:6:"Brazil";s:12:"address_city";s:12:"PORTO ALEGRE";s:11:"verify_sign";s:56:"AS-3SKSqiWYUSXAUHOtgpgbir-qeAa7SCYPlixelo03u5IKY76zd2HAL";s:11:"payer_email";s:26:"mercado.livre.jh@gmail.com";s:6:"txn_id";s:17:"79A40035EB502140G";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:17:"moliterni haubert";s:13:"address_state";s:2:"RS";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.86";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"BR";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.15";s:12:"ipn_track_id";s:13:"bbc6491b703b1";}', 1504061159, '173.0.81.1'),
(272, 'Tried to pay Funds (149.15): 0 Userid:0', 1504061159, '173.0.81.1'),
(273, 'Attempted to pay Funds', 1504077481, '173.0.81.1'),
(274, 'a:34:{s:8:"mc_gross";s:6:"149.59";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"5B6KSWJMGJZDL";s:14:"address_street";s:19:"699 Madison Park Dr";s:12:"payment_date";s:25:"00:17:52 Aug 30, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"30017";s:10:"first_name";s:6:"Twanna";s:6:"mc_fee";s:4:"6.88";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:26:"Printed Pillowcases- T2012";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:7:"Grayson";s:11:"verify_sign";s:56:"Axi2JPs5nrysX.tzs9YStdwqc8q6Axz.9X5uahiVoHfg6R1Zrskwp.Ia";s:11:"payer_email";s:23:"twanna.tiller@gmail.com";s:6:"txn_id";s:17:"8MD51762095996706";s:12:"payment_type";s:7:"instant";s:19:"payer_business_name";s:26:"Printed Pillowcases- T2012";s:9:"last_name";s:6:"Tiller";s:13:"address_state";s:2:"GA";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.88";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"US";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.59";s:12:"ipn_track_id";s:13:"30e506605fd61";}', 1504077481, '173.0.81.1'),
(275, 'Tried to pay Funds (149.59): 0 Userid:0', 1504077481, '173.0.81.1'),
(276, 'Attempted to pay Funds', 1504099304, '173.0.81.1'),
(277, 'a:33:{s:8:"mc_gross";s:6:"149.87";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"ZDMF4NZ8KGQ6W";s:14:"address_street";s:15:"36 Upton Street";s:12:"payment_date";s:25:"06:21:32 Aug 30, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"2904";s:10:"first_name";s:8:"Kathrine";s:6:"mc_fee";s:4:"6.89";s:20:"address_country_code";s:2:"AU";s:12:"address_name";s:14:"Kathrine Grant";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Australia";s:12:"address_city";s:6:"monash";s:11:"verify_sign";s:56:"A3qcKyqB84hE5ojJl.MKKiHKijvFAp-DdsiEecFV9pqK.v1037rzo9Un";s:11:"payer_email";s:23:"grantkathrine@gmail.com";s:6:"txn_id";s:17:"1HF75553KD678205V";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"Grant";s:13:"address_state";s:28:"Australian Capital Territory";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.89";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"AU";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.87";s:12:"ipn_track_id";s:13:"42aa3f0db7b47";}', 1504099305, '173.0.81.1'),
(278, 'Tried to pay Funds (149.87): 0 Userid:0', 1504099305, '173.0.81.1'),
(279, 'Attempted to pay Funds', 1504168748, '173.0.81.1'),
(280, 'a:34:{s:8:"mc_gross";s:5:"99.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"VDRM8FNKYBAML";s:14:"address_street";s:26:"Jl. Sekelimus Tengah No.12";s:12:"payment_date";s:25:"01:39:01 Aug 31, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"40262";s:10:"first_name";s:6:"Rianov";s:6:"mc_fee";s:4:"4.16";s:20:"address_country_code";s:2:"ID";s:12:"address_name";s:10:"Rianov Osa";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Indonesia";s:12:"address_city";s:7:"Bandung";s:11:"verify_sign";s:56:"ARTWVaUGckuviK6HZ-Of6l88vDtdAtpPBUb9HPo4nmS0A8z4l4Gvi1G3";s:11:"payer_email";s:17:"rianovs@gmail.com";s:4:"memo";s:57:"payment premium forex signal atas nama rianov purnama osa";s:6:"txn_id";s:17:"45W00094HG902931B";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:3:"Osa";s:13:"address_state";s:9:"West Java";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.16";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"ID";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"99.00";s:12:"ipn_track_id";s:13:"6e05a90c4069b";}', 1504168748, '173.0.81.1'),
(281, 'Tried to pay Funds (99.00): 0 Userid:0', 1504168748, '173.0.81.1'),
(282, 'Attempted to pay Funds', 1504756827, '173.0.81.1'),
(283, 'a:33:{s:8:"mc_gross";s:5:"49.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"CFX6H2PS8Y7EJ";s:14:"address_street";s:17:"Taborstrae 126/59";s:12:"payment_date";s:25:"21:00:22 Sep 06, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"1020";s:10:"first_name";s:6:"Stefan";s:6:"mc_fee";s:4:"2.46";s:20:"address_country_code";s:2:"AT";s:12:"address_name";s:17:"Stefan Brudermann";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:7:"Austria";s:12:"address_city";s:4:"Wien";s:11:"verify_sign";s:56:"Ab165HSaBYXAUcq..5qSrVzIi7IaAInTRiCG2LcCk5GPEkFUKCPqmAG6";s:11:"payer_email";s:22:"s.brudermann@gmail.com";s:6:"txn_id";s:17:"0P6268059X307581S";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:10:"Brudermann";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.46";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"AT";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.00";s:12:"ipn_track_id";s:13:"a36004b5c36e3";}', 1504756827, '173.0.81.1'),
(284, 'Tried to pay Funds (49.00): 0 Userid:0', 1504756827, '173.0.81.1'),
(285, 'Attempted to pay Funds', 1505435769, '173.0.81.1'),
(286, 'a:23:{s:19:"transaction_subject";s:0:"";s:8:"txn_type";s:10:"send_money";s:12:"payment_date";s:25:"17:36:04 Sep 14, 2017 PDT";s:9:"last_name";s:7:"cahyana";s:17:"residence_country";s:2:"US";s:13:"payment_gross";s:4:"1.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:10:"Ineligible";s:11:"verify_sign";s:56:"AFHDlbkfSeXPfKvS3eOr1Oj.w9zbAMZIeeCzgEZoNwhss.Y.lti2tN4d";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:23:"pagha_lovers@yahool.com";s:6:"txn_id";s:17:"4NV624364B444213G";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:4:"paga";s:8:"payer_id";s:13:"5SB2RK8SGMUDG";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:8:"mc_gross";s:4:"1.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"b8457e5d37bc7";}', 1505435769, '173.0.81.1'),
(287, 'Tried to pay Funds (1.00): 0 Userid:0', 1505435769, '173.0.81.1'),
(288, 'Attempted to pay Funds', 1505486995, '173.0.81.1'),
(289, 'a:33:{s:8:"mc_gross";s:5:"98.64";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"M78V3BY4DNRXY";s:14:"address_street";s:15:"Rebrisoara 389a";s:12:"payment_date";s:25:"07:49:44 Sep 15, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"427240";s:10:"first_name";s:11:"Marius alin";s:6:"mc_fee";s:4:"4.64";s:20:"address_country_code";s:2:"RO";s:12:"address_name";s:17:"Marius alin Bodiu";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:7:"Romania";s:12:"address_city";s:6:"Nasaud";s:11:"verify_sign";s:56:"A--8MSCLabuvN8L.-MHjxC9uypBtAaWQl6v7y1SEzmxw7Gyhx6i-4IOQ";s:11:"payer_email";s:22:"alinmarius66@yahoo.com";s:6:"txn_id";s:17:"5JB775117V391162L";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"Bodiu";s:13:"address_state";s:15:"Bistrita-Nasaud";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.64";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"RO";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.64";s:12:"ipn_track_id";s:13:"5427537e32704";}', 1505486995, '173.0.81.1'),
(290, 'Tried to pay Funds (98.64): 0 Userid:0', 1505486995, '173.0.81.1'),
(291, 'Attempted to pay Funds', 1505790848, '173.0.81.1'),
(292, 'a:33:{s:8:"mc_gross";s:6:"125.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"JH436ANR2PR5J";s:14:"address_street";s:35:"1, kumanan street,\r\nKarungalpalayam";s:12:"payment_date";s:25:"20:03:45 Aug 28, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"638009";s:10:"first_name";s:13:"Vijayapradeep";s:6:"mc_fee";s:4:"5.80";s:20:"address_country_code";s:2:"IN";s:12:"address_name";s:26:"Vijayapradeep Ramakrishnan";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:5:"India";s:12:"address_city";s:5:"Erode";s:11:"verify_sign";s:56:"ADbhSJxpl3q1j1Fmr74pj1QDnXKCA6-SotW4EUQq1DLy-nRT2Q20pA40";s:11:"payer_email";s:26:"vijayapradeep.pt@gmail.com";s:6:"txn_id";s:17:"0A20882838851421W";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:12:"Ramakrishnan";s:13:"address_state";s:10:"Tamil Nadu";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"5.80";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"IN";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"125.00";s:12:"ipn_track_id";s:13:"b14900f89ce89";}', 1505790849, '173.0.81.1'),
(293, 'Tried to pay Funds (125.00): 0 Userid:0', 1505790849, '173.0.81.1'),
(294, 'Attempted to pay Funds', 1506307133, '173.0.81.1'),
(295, 'a:25:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"19:38:39 Sep 24, 2017 PDT";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:7:"Prayogo";s:17:"residence_country";s:2:"ID";s:13:"payment_gross";s:6:"149.34";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"A0T06LKl612.SB5otbFJZO1Sf1uMAMxxIaKi1gn91lM5fr3kIfh60Nee";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:21:"ogi.prayogo@gmail.com";s:6:"txn_id";s:17:"8G454665W7192941D";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:4:"Gama";s:8:"payer_id";s:13:"TC8KCLJVRATHE";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"6.12";s:6:"mc_fee";s:4:"6.12";s:8:"mc_gross";s:6:"149.34";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"5b866cffc746f";}', 1506307136, '173.0.81.1'),
(296, 'Tried to pay Funds (149.34): 0 Userid:0', 1506307136, '173.0.81.1'),
(297, 'Attempted to pay Funds', 1506406162, '173.0.81.1'),
(298, 'a:34:{s:8:"mc_gross";s:6:"149.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"EGT56D8XQHHR2";s:14:"address_street";s:48:"Garnala ta. gondal  dist..rajkot.pincode..360311";s:12:"payment_date";s:25:"23:09:13 Sep 25, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"360311";s:10:"first_name";s:12:"Divyeshkumar";s:6:"mc_fee";s:4:"6.86";s:20:"address_country_code";s:2:"IN";s:12:"address_name";s:8:"analysis";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:5:"India";s:12:"address_city";s:6:"Rajkot";s:11:"verify_sign";s:56:"AlRMgOPSbKUJAxLqRTkz4HwVPOtIAHcDUqrGxcS7MFgYPYsZ.INdPW9.";s:11:"payer_email";s:16:"d_trada@yahoo.in";s:6:"txn_id";s:17:"9SC0887024782364E";s:12:"payment_type";s:7:"instant";s:19:"payer_business_name";s:8:"analysis";s:9:"last_name";s:5:"Trada";s:13:"address_state";s:7:"Gujarat";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.86";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"IN";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.00";s:12:"ipn_track_id";s:13:"8880f24dc8245";}', 1506406162, '173.0.81.1'),
(299, 'Tried to pay Funds (149.00): 0 Userid:0', 1506406162, '173.0.81.1'),
(300, 'Attempted to pay Funds', 1506568851, '173.0.81.1'),
(301, 'a:33:{s:8:"mc_gross";s:5:"98.77";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"S9VMBYWGKFPQC";s:14:"address_street";s:15:"2425 nw 60th st";s:12:"payment_date";s:25:"20:20:33 Sep 27, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"98107";s:10:"first_name";s:8:"Danielle";s:6:"mc_fee";s:4:"4.65";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:17:"Danielle McCulley";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:7:"seattle";s:11:"verify_sign";s:56:"A38QnL9w08VYK3pOb3ApZsPJJNwWA-DStI9Si6aCtly1-XRPT7AnFnpW";s:11:"payer_email";s:28:"daniellemcculley63@gmail.com";s:6:"txn_id";s:17:"53W58203BT291093B";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"McCulley";s:13:"address_state";s:2:"WA";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.65";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"US";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.77";s:12:"ipn_track_id";s:12:"f4fb088e62ab";}', 1506568852, '173.0.81.1'),
(302, 'Tried to pay Funds (98.77): 0 Userid:0', 1506568852, '173.0.81.1'),
(303, 'Attempted to pay Funds', 1506733960, '173.0.81.1'),
(304, 'a:33:{s:8:"mc_gross";s:6:"149.67";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"7TB6XY4LV64RJ";s:14:"address_street";s:6:"JEDDAH";s:12:"payment_date";s:25:"18:12:31 Sep 29, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"00000";s:10:"first_name";s:7:"MANSOUR";s:6:"mc_fee";s:4:"6.89";s:20:"address_country_code";s:2:"SA";s:12:"address_name";s:13:"MANSOUR OWADH";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:12:"Saudi Arabia";s:12:"address_city";s:6:"JEDDAH";s:11:"verify_sign";s:56:"AQPLpjrjIn9TwKqecyQ-QEpTtDKrAELcO4Uvt5XFnbAQ0.QLEfjmo9K3";s:11:"payer_email";s:22:"mowaidah0963@gmail.com";s:6:"txn_id";s:17:"2FS19585FW439591P";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"OWADH";s:13:"address_state";s:4:"WEST";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.89";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"SA";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.67";s:12:"ipn_track_id";s:13:"5f167d55226fb";}', 1506733961, '173.0.81.1'),
(305, 'Tried to pay Funds (149.67): 0 Userid:0', 1506733961, '173.0.81.1'),
(306, 'Attempted to pay Funds', 1507281684, '173.0.81.1'),
(307, 'a:34:{s:8:"mc_gross";s:6:"104.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"WSWWAEAG558GW";s:14:"address_street";s:57:"P.o Box 35822, Dar es Salaam\r\nP.o Box 2774, Dar es Salaam";s:12:"payment_date";s:25:"02:21:13 Oct 06, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"+255";s:10:"first_name";s:8:"Sylvanus";s:6:"mc_fee";s:4:"4.88";s:20:"address_country_code";s:2:"TZ";s:12:"address_name";s:15:"Sylvanus Malimi";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Tanzania";s:12:"address_city";s:13:"Dar es Salaam";s:11:"verify_sign";s:56:"Aq1A6tWauttyvmrwMeo22jNHQNaWAuzTpar2cr4k3-kHi8Xsi5tNo8ln";s:11:"payer_email";s:25:"sylvanus.malimi@gmail.com";s:4:"memo";s:70:"Payment for premium signals. Please add me. My number is +255759929566";s:6:"txn_id";s:17:"9FX709591B3363200";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"Malimi";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.88";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"TZ";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"104.00";s:12:"ipn_track_id";s:12:"44b81ca9e72d";}', 1507281685, '173.0.81.1'),
(308, 'Tried to pay Funds (104.00): 0 Userid:0', 1507281685, '173.0.81.1'),
(309, 'Attempted to pay Funds', 1507358711, '173.0.81.1'),
(310, 'a:34:{s:8:"mc_gross";s:5:"49.45";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"HZSEACBEENKPG";s:14:"address_street";s:30:"unit B-01,1st floor, block LA,";s:12:"payment_date";s:25:"23:45:04 Oct 06, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"88200";s:10:"first_name";s:12:"mohd sayzmie";s:6:"mc_fee";s:4:"2.48";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:19:"mohd sayzmie kassim";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:7:"PUTATAN";s:11:"verify_sign";s:56:"A1kJ1fWZU68BFdSesDYIdDdv5oB4AnDbbyC07ww0LQyxbZ30LasYAXXu";s:11:"payer_email";s:19:"sayzmie86@gmail.com";s:4:"memo";s:18:"BossFX170201100-38";s:6:"txn_id";s:17:"8T788843HP0966835";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"kassim";s:13:"address_state";s:5:"Sabah";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.48";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.45";s:12:"ipn_track_id";s:13:"8d81f6c0875e6";}', 1507358711, '173.0.81.1'),
(311, 'Tried to pay Funds (49.45): 0 Userid:0', 1507358711, '173.0.81.1'),
(312, 'Attempted to pay Funds', 1507378055, '173.0.81.1'),
(313, 'a:33:{s:8:"mc_gross";s:5:"98.64";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"UEA25QGYEBUZ8";s:14:"address_street";s:18:"BP 349 BINGERVILLE";s:12:"payment_date";s:25:"05:07:25 Oct 07, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:0:"";s:10:"first_name";s:11:"AKA JANVIER";s:6:"mc_fee";s:4:"4.64";s:20:"address_country_code";s:2:"CI";s:12:"address_name";s:15:"AKA JANVIER AKA";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:13:"Cote D''Ivoire";s:12:"address_city";s:11:"BINGERVILLE";s:11:"verify_sign";s:56:"AUQlFMWraOmgeL1gE-t0olqYWpvNAkaB5Lx4Q6K1C383v.JptYo6noMa";s:11:"payer_email";s:24:"janvieraka2017@gmail.com";s:6:"txn_id";s:17:"30E98380CP660012J";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:3:"AKA";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.64";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"CI";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.64";s:12:"ipn_track_id";s:13:"6520c99394da6";}', 1507378056, '173.0.81.1'),
(314, 'Tried to pay Funds (98.64): 0 Userid:0', 1507378056, '173.0.81.1'),
(315, 'Attempted to pay Funds', 1507791319, '173.0.81.1'),
(316, 'a:34:{s:8:"mc_gross";s:6:"104.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"TR4HRDDG9GXQQ";s:14:"address_street";s:32:"Lot 2417 Kampung Binjal Kangkong";s:12:"payment_date";s:25:"23:55:11 Oct 11, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"17040";s:10:"first_name";s:7:"Marzuqi";s:6:"mc_fee";s:4:"4.88";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:15:"Marzuqi Muhamad";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:9:"Pasir mas";s:11:"verify_sign";s:56:"A.ecrR-IsNFuD9G9J7NLgwXxHnh6AgW3urglCvaypE1cxkys14NM3MFl";s:11:"payer_email";s:21:"lanforest89@gmail.com";s:4:"memo";s:22:"Deposit signal premium";s:6:"txn_id";s:17:"7ST83295ST728502F";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"Muhamad";s:13:"address_state";s:8:"kelantan";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.88";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"104.00";s:12:"ipn_track_id";s:13:"46c90c2d19c4f";}', 1507791319, '173.0.81.1'),
(317, 'Tried to pay Funds (104.00): 0 Userid:0', 1507791319, '173.0.81.1'),
(318, 'Attempted to pay Funds', 1508238445, '173.0.81.1'),
(319, 'a:33:{s:8:"mc_gross";s:5:"98.74";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"X8G5TRMVL55JE";s:14:"address_street";s:10:"Hohlweg 17";s:12:"payment_date";s:25:"04:07:18 Oct 17, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"57612";s:10:"first_name";s:6:"Arthur";s:6:"mc_fee";s:4:"4.64";s:20:"address_country_code";s:2:"DE";s:12:"address_name";s:11:"Arthur Nord";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:7:"Germany";s:12:"address_city";s:9:"Helmenzen";s:11:"verify_sign";s:56:"Az6aOxn6OnYvzxsVxdr7lzRKk263Aed-7RO1W20bSQuiuU663Ff1OdFH";s:11:"payer_email";s:24:"arturnellynord@gmail.com";s:6:"txn_id";s:17:"7W399123684774930";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:4:"Nord";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.64";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"DE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.74";s:12:"ipn_track_id";s:12:"f3749a7c7dfa";}', 1508238447, '173.0.81.1'),
(320, 'Tried to pay Funds (98.74): 0 Userid:0', 1508238447, '173.0.81.1'),
(321, 'Attempted to pay Funds', 1508357222, '173.0.81.1'),
(322, 'a:34:{s:8:"mc_gross";s:6:"104.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"86FL54BU2JW3C";s:14:"address_street";s:59:"Av. Alameda los Cedros 556 urb Cedros de Villa - Chorrillos";s:12:"payment_date";s:25:"13:06:52 Oct 18, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"lima01";s:10:"first_name";s:6:"Renato";s:6:"mc_fee";s:4:"4.88";s:20:"address_country_code";s:2:"PE";s:12:"address_name";s:25:"Renato Valverde Sifuentes";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:4:"Peru";s:12:"address_city";s:4:"Lima";s:11:"verify_sign";s:56:"ATKgQPmeI8RtqKCLaF48Iznq4qmIAITR3PYCX8M.LnifIWDOUvwibhR7";s:11:"payer_email";s:20:"renafari@hotmail.com";s:4:"memo";s:35:"premium service phone: +51947331454";s:6:"txn_id";s:17:"5VF08694UV400263T";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:18:"Valverde Sifuentes";s:13:"address_state";s:4:"Lima";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.88";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"PE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"104.00";s:12:"ipn_track_id";s:13:"bb7ac6cd20a88";}', 1508357222, '173.0.81.1'),
(323, 'Tried to pay Funds (104.00): 0 Userid:0', 1508357222, '173.0.81.1'),
(324, 'Attempted to pay Funds', 1508385067, '173.0.81.1');
INSERT INTO `ipn_log` (`ID`, `data`, `timestamp`, `IP`) VALUES
(325, 'a:25:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"20:51:01 Oct 18, 2017 PDT";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:4:"Reza";s:17:"residence_country";s:2:"ID";s:13:"payment_gross";s:4:"5.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:27:"dode.agung.asmara@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"AZnkuPIdNaaA8nIh2-MdyOMqiqtWArT8QouGG2mHcFMyFfffizOi4k-u";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:17:"billing@dedoho.pw";s:6:"txn_id";s:17:"0RS94376U8306215U";s:14:"receiver_email";s:27:"dode.agung.asmara@gmail.com";s:10:"first_name";s:5:"Phibu";s:8:"payer_id";s:13:"TU6FFN4FS4PLY";s:11:"receiver_id";s:13:"JN2Z8KTDPGABW";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"0.50";s:6:"mc_fee";s:4:"0.50";s:8:"mc_gross";s:4:"5.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"42498b527ed48";}', 1508385068, '173.0.81.1'),
(326, 'Tried to pay Funds (5.00): 0 Userid:0', 1508385068, '173.0.81.1'),
(327, 'Attempted to pay Funds', 1509011724, '173.0.81.1'),
(328, 'a:33:{s:8:"mc_gross";s:6:"149.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"WG9Y89ZM96PJS";s:14:"address_street";s:36:"Bhadeli Shittlav,\r\nBhadeli Jagalala,";s:12:"payment_date";s:25:"02:54:40 Oct 26, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"396001";s:10:"first_name";s:5:"sagar";s:6:"mc_fee";s:4:"6.86";s:20:"address_country_code";s:2:"IN";s:12:"address_name";s:14:"sagar bhandari";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:5:"India";s:12:"address_city";s:6:"Valsad";s:11:"verify_sign";s:56:"AYTJkXi6vQKic9L1MU9WqLCM9doLAzNFnRpyu1KOi1P.5lrNAWgfYdWI";s:11:"payer_email";s:23:"sagar.frnd007@gmail.com";s:6:"txn_id";s:17:"71V38087FA5198013";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"bhandari";s:13:"address_state";s:7:"Gujarat";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.86";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"IN";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.00";s:12:"ipn_track_id";s:13:"21b076b02a398";}', 1509011725, '173.0.81.1'),
(329, 'Tried to pay Funds (149.00): 0 Userid:0', 1509011725, '173.0.81.1'),
(330, 'Attempted to pay Funds', 1509041483, '173.0.81.1'),
(331, 'a:33:{s:8:"mc_gross";s:5:"98.45";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"9YAJB892QEUE6";s:14:"address_street";s:12:"via prato 26";s:12:"payment_date";s:25:"11:11:14 Oct 26, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"20152";s:10:"first_name";s:21:"simone erminio marzio";s:6:"mc_fee";s:4:"4.63";s:20:"address_country_code";s:2:"IT";s:12:"address_name";s:33:"simone erminio marzio campolunghi";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:5:"Italy";s:12:"address_city";s:6:"MILANO";s:11:"verify_sign";s:56:"AXAREG5It7DV0GDsbqYKSuXYsRMlAMBdJ4V0rpRt3w77Z3.SlkQQfmg7";s:11:"payer_email";s:27:"simone@studiocampolunghi.it";s:6:"txn_id";s:17:"88E89126N0512872S";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:11:"campolunghi";s:13:"address_state";s:2:"MI";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.63";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"IT";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.45";s:12:"ipn_track_id";s:13:"4435205dd5403";}', 1509041484, '173.0.81.1'),
(332, 'Tried to pay Funds (98.45): 0 Userid:0', 1509041484, '173.0.81.1'),
(333, 'Attempted to pay Funds', 1509159436, '173.0.81.1'),
(334, 'a:25:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"19:57:11 Oct 27, 2017 PDT";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:11:"Dwi Saputro";s:17:"residence_country";s:2:"ID";s:13:"payment_gross";s:5:"70.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:27:"dode.agung.asmara@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"A57rZS43HX3Z0GamPsbubBPp8whvATtafXJKlL0fBm96B804iult4IJg";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:21:"nurmadedoho@gmail.com";s:6:"txn_id";s:17:"4C013965NG9165632";s:14:"receiver_email";s:27:"dode.agung.asmara@gmail.com";s:10:"first_name";s:8:"M. Wisnu";s:8:"payer_id";s:13:"BLFDUTLQQXWQY";s:11:"receiver_id";s:13:"JN2Z8KTDPGABW";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"3.03";s:6:"mc_fee";s:4:"3.03";s:8:"mc_gross";s:5:"70.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:12:"1f5e45d186ae";}', 1509159437, '173.0.81.1'),
(335, 'Tried to pay Funds (70.00): 0 Userid:0', 1509159437, '173.0.81.1'),
(336, 'Attempted to pay Funds', 1509465870, '173.0.81.1'),
(337, 'a:34:{s:8:"mc_gross";s:6:"149.29";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"8ECEHEUHHCEXA";s:14:"address_street";s:34:"No.23 Jalan Perisa 4\r\nHappy Garden";s:12:"payment_date";s:25:"09:04:19 Oct 31, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"58200";s:10:"first_name";s:5:"Sunny";s:6:"mc_fee";s:4:"6.87";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:10:"Sunny Leow";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:12:"Kuala Lumpur";s:11:"verify_sign";s:56:"AMS.YQ4d2LbPtnrCCeWps8d8FsTTAdnuUxjtG2.FELjQQuBlgbGGAibI";s:11:"payer_email";s:17:"sunny@leonett.com";s:4:"memo";s:77:"Signals send to +6012-2191960 and email signals send to sunnylhleow@gmail.com";s:6:"txn_id";s:17:"1EK30703EH088771P";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:4:"Leow";s:13:"address_state";s:19:"Wilayah Persekutuan";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.87";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.29";s:12:"ipn_track_id";s:13:"cbbbaf2187266";}', 1509465871, '173.0.81.1'),
(338, 'Tried to pay Funds (149.29): 0 Userid:0', 1509465871, '173.0.81.1'),
(339, 'Attempted to pay Funds', 1509469973, '173.0.81.1'),
(340, 'a:33:{s:8:"mc_gross";s:5:"49.45";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"74F8V9GZVL38C";s:14:"address_street";s:11:"PostBox 263";s:12:"payment_date";s:25:"10:12:40 Oct 31, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"0123";s:10:"first_name";s:5:"Kobus";s:6:"mc_fee";s:4:"2.48";s:20:"address_country_code";s:2:"ZA";s:12:"address_name";s:11:"Kobus Swart";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:12:"South Africa";s:12:"address_city";s:10:"Centrurion";s:11:"verify_sign";s:56:"A7cFmvt4cueBfzS8E5HW6jxO7JdmA63DYmni.PXmUNF3m3t8HXTf-oXF";s:11:"payer_email";s:21:"opacity@webmail.co.za";s:6:"txn_id";s:17:"21704913UD4141103";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"Swart";s:13:"address_state";s:7:"Gauteng";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.48";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"ZA";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.45";s:12:"ipn_track_id";s:13:"f5f208a8e7769";}', 1509469978, '173.0.81.1'),
(341, 'Tried to pay Funds (49.45): 0 Userid:0', 1509469978, '173.0.81.1'),
(342, 'Attempted to pay Funds', 1509520247, '173.0.81.1'),
(343, 'a:33:{s:8:"mc_gross";s:5:"98.17";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"ZLJYBPVP8MLTJ";s:14:"address_street";s:10:"Chavdar 18";s:12:"payment_date";s:25:"00:10:37 Nov 01, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"02140";s:10:"first_name";s:9:"Stanislav";s:6:"mc_fee";s:4:"4.62";s:20:"address_country_code";s:2:"UA";s:12:"address_name";s:17:"Stanislav Shelest";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:7:"Ukraine";s:12:"address_city";s:4:"Kyiv";s:11:"verify_sign";s:56:"AQYZJbBgoBJYkSm2EkG4g3WTd6D3A02eVCW7LNgcc..IvbQ6qWLmz3nv";s:11:"payer_email";s:21:"stas4902050@gmail.com";s:6:"txn_id";s:17:"8L401418T60869533";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"Shelest";s:13:"address_state";s:2:"UA";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"4.62";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"UA";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"98.17";s:12:"ipn_track_id";s:13:"49898db5a6c2d";}', 1509520247, '173.0.81.1'),
(344, 'Tried to pay Funds (98.17): 0 Userid:0', 1509520247, '173.0.81.1'),
(345, 'Attempted to pay Funds', 1509663168, '173.0.81.1'),
(346, 'a:33:{s:8:"mc_gross";s:5:"49.30";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"9XK6GYKMQMVJG";s:14:"address_street";s:27:"H.Lady Bird\r\nKasthoori magu";s:12:"payment_date";s:25:"15:52:35 Nov 02, 2017 PDT";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:3:"960";s:10:"first_name";s:7:"Mohamed";s:6:"mc_fee";s:4:"2.47";s:20:"address_country_code";s:2:"MV";s:12:"address_name";s:16:"Mohamed Vidhaadh";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Maldives";s:12:"address_city";s:5:"Male''";s:11:"verify_sign";s:56:"A9L8KdQRFwCxkGgRvqySYxIIOm23AJP6PiXhAPOh36hv2DTARgmTJPNL";s:11:"payer_email";s:20:"Vidhaadh@hotmail.com";s:6:"txn_id";s:17:"2W896986N12302733";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"Vidhaadh";s:13:"address_state";s:4:"Asia";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.47";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MV";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.30";s:12:"ipn_track_id";s:13:"da327bd0245d6";}', 1509663168, '173.0.81.1'),
(347, 'Tried to pay Funds (49.30): 0 Userid:0', 1509663168, '173.0.81.1'),
(348, 'Attempted to pay Funds', 1509895011, '173.0.81.1'),
(349, 'a:33:{s:8:"mc_gross";s:6:"205.80";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"377XJM8SQVPTU";s:14:"address_street";s:15:"Emaar Sq Bldg 4";s:12:"payment_date";s:25:"07:16:01 Nov 05, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"4296";s:10:"first_name";s:7:"Richard";s:6:"mc_fee";s:4:"9.36";s:20:"address_country_code";s:2:"AE";s:12:"address_name";s:15:"Richard Nayafam";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:20:"United Arab Emirates";s:12:"address_city";s:5:"Dubai";s:11:"verify_sign";s:56:"AZjLATIm4a.UFVHNXmmNrS45ipbTA3Q.Iafo81uAvtZsTYU3KOkq77wm";s:11:"payer_email";s:21:"richardnygm@gmail.com";s:6:"txn_id";s:17:"04458634TH309182N";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"Nayafam";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"9.36";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"AE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"205.80";s:12:"ipn_track_id";s:13:"127b5b0f21454";}', 1509895011, '173.0.81.1'),
(350, 'Tried to pay Funds (205.80): 0 Userid:0', 1509895011, '173.0.81.1'),
(351, 'Attempted to pay Funds', 1509918168, '173.0.81.1'),
(352, 'a:33:{s:8:"mc_gross";s:6:"149.81";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"CARFA5Y865DHG";s:14:"address_street";s:31:"Al Tawoon Road\r\nal rassheed two";s:12:"payment_date";s:25:"13:42:40 Nov 05, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:2:"00";s:10:"first_name";s:14:"muhammad ghani";s:6:"mc_fee";s:4:"6.89";s:20:"address_country_code";s:2:"AE";s:12:"address_name";s:19:"muhammad ghani nafi";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:20:"United Arab Emirates";s:12:"address_city";s:7:"SHARJAH";s:11:"verify_sign";s:56:"AiYRKiYNUHE.aDjlUJap6QoZ-QxnABDPdVuqV6oWEVJndPX3KFU8HVYl";s:11:"payer_email";s:22:"mg0502734393@gmail.com";s:6:"txn_id";s:17:"7GS8447353203745A";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:4:"nafi";s:13:"address_state";s:3:"UAE";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.89";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"AE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.81";s:12:"ipn_track_id";s:13:"5250779fb20c2";}', 1509918168, '173.0.81.1'),
(353, 'Tried to pay Funds (149.81): 0 Userid:0', 1509918168, '173.0.81.1'),
(354, 'Attempted to pay Funds', 1509981030, '173.0.81.1'),
(355, 'a:25:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"07:09:38 Nov 06, 2017 PST";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:7:"faerber";s:17:"residence_country";s:2:"CA";s:13:"payment_gross";s:5:"98.00";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"AXR91jkaOoBxs9aMg3CaAg-G6-I3Aytoxsql7DSDn.RrDZah.pz8Xtqe";s:12:"payer_status";s:10:"unverified";s:11:"payer_email";s:28:"nathanielfaerber@hotmail.com";s:6:"txn_id";s:17:"3NW80356FS872705L";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:9:"nathaniel";s:8:"payer_id";s:13:"8EHMA834K3QMW";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"4.61";s:6:"mc_fee";s:4:"4.61";s:8:"mc_gross";s:5:"98.00";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"731ef3441defb";}', 1509981030, '173.0.81.1'),
(356, 'Tried to pay Funds (98.00): 0 Userid:0', 1509981030, '173.0.81.1'),
(357, 'Attempted to pay Funds', 1510107325, '173.0.81.1'),
(358, 'a:33:{s:8:"mc_gross";s:5:"49.93";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"5WKR8SUHF4VLU";s:14:"address_street";s:9:"Ffff\r\nFff";s:12:"payment_date";s:25:"18:14:43 Nov 07, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"05400";s:10:"first_name";s:6:"Selvam";s:6:"mc_fee";s:4:"2.50";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:12:"Selvam Kullo";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:10:"Alor setar";s:11:"verify_sign";s:56:"AgI4z89lZ-6EUTYAqisG7JYVheZ0AJAE3pJIdxt-SOw0JwDxIL0jDP3g";s:11:"payer_email";s:19:"vimala143@gmail.com";s:6:"txn_id";s:17:"54L23166GE837451D";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"Kullo";s:13:"address_state";s:5:"kedah";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.50";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.93";s:12:"ipn_track_id";s:13:"cfa21182bb2dd";}', 1510107326, '173.0.81.1'),
(359, 'Tried to pay Funds (49.93): 0 Userid:0', 1510107326, '173.0.81.1'),
(360, 'Attempted to pay Funds', 1510654278, '173.0.81.1'),
(361, 'a:34:{s:8:"mc_gross";s:6:"149.57";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"HP7KDXPNZ5GJS";s:14:"address_street";s:20:"Via Cascina Duomo, 4";s:12:"payment_date";s:25:"02:11:08 Nov 14, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"20010";s:10:"first_name";s:7:"daniele";s:6:"mc_fee";s:4:"6.88";s:20:"address_country_code";s:2:"IT";s:12:"address_name";s:17:"daniele palazzoli";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:5:"Italy";s:12:"address_city";s:9:"Cornaredo";s:11:"verify_sign";s:56:"AQzu7Q8.6I5-eHlWO.bA6Ms3O0IjACuu-3rXDhyc6zNPkKSGm.MpbLMh";s:11:"payer_email";s:27:"daniele.palazzoli@gmail.com";s:4:"memo";s:49:"invoice no : BossFX170401251-50 Daniele Palazzoli";s:6:"txn_id";s:17:"6LX83165NT7379514";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:9:"palazzoli";s:13:"address_state";s:2:"MI";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"6.88";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"IT";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"149.57";s:12:"ipn_track_id";s:13:"13405ef552197";}', 1510654281, '173.0.81.1'),
(362, 'Tried to pay Funds (149.57): 0 Userid:0', 1510654281, '173.0.81.1'),
(363, 'Attempted to pay Funds', 1510735136, '173.0.81.1'),
(364, 'a:33:{s:8:"mc_gross";s:5:"49.64";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"64AE7ZSLG3GM2";s:14:"address_street";s:13:"Dimancheville";s:12:"payment_date";s:25:"00:38:45 Nov 15, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"78660";s:10:"first_name";s:8:"Bertrand";s:6:"mc_fee";s:4:"2.48";s:20:"address_country_code";s:2:"FR";s:12:"address_name";s:15:"Bertrand MARTIN";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:6:"France";s:12:"address_city";s:5:"ABLIS";s:11:"verify_sign";s:56:"AaBrHkJ1lGrywpNQNpJJXz4AINhBANJyDE7vnoBMGdwtprfR7CsRuW-3";s:11:"payer_email";s:21:"compte.bourse@free.fr";s:6:"txn_id";s:17:"83M01854G2875444L";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:6:"MARTIN";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.48";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"FR";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.64";s:12:"ipn_track_id";s:12:"29d5db359eaa";}', 1510735137, '173.0.81.1'),
(365, 'Tried to pay Funds (49.64): 0 Userid:0', 1510735137, '173.0.81.1'),
(366, 'Attempted to pay Funds', 1510820251, '173.0.81.1'),
(367, 'Attempted to pay Funds', 1510820305, '173.0.81.1'),
(368, 'Attempted to pay Funds', 1511419412, '173.0.81.1'),
(369, 'Attempted to pay Funds', 1511517631, '173.0.81.1'),
(370, 'Attempted to pay Funds', 1511690076, '173.0.81.1'),
(371, 'a:34:{s:8:"mc_gross";s:5:"75.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"4QRQCUADMGT82";s:14:"address_street";s:19:"58 C BD PAUL MONTEL";s:12:"payment_date";s:25:"01:54:30 Nov 26, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"06200";s:10:"first_name";s:7:"Youssef";s:6:"mc_fee";s:4:"3.60";s:20:"address_country_code";s:2:"FR";s:12:"address_name";s:18:"Youssef ABDESSADKI";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:6:"France";s:12:"address_city";s:4:"nice";s:11:"verify_sign";s:56:"AFaW7Kfwtkfrj27sI0W7tE2KKCnMAlnx2ogxUZ77AEtG7sI4Xh8coH8h";s:11:"payer_email";s:22:"youssef489@hotmail.com";s:4:"memo";s:20:"Prenium black friday";s:6:"txn_id";s:17:"5PD63202SV398224B";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:10:"ABDESSADKI";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.60";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"FR";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"75.00";s:12:"ipn_track_id";s:13:"298cadb6578f4";}', 1511690076, '173.0.81.1'),
(372, 'Tried to pay Funds (75.00): 0 Userid:0', 1511690076, '173.0.81.1'),
(373, 'Attempted to pay Funds', 1511775379, '173.0.81.1'),
(374, 'a:34:{s:8:"mc_gross";s:5:"75.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"5D644BB3KNC4W";s:14:"address_street";s:21:"King abudlaziz street";s:12:"payment_date";s:25:"01:36:09 Nov 27, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"35521";s:10:"first_name";s:8:"Mohammed";s:6:"mc_fee";s:4:"3.60";s:20:"address_country_code";s:2:"SA";s:12:"address_name";s:17:"Mohammed Almulhim";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:12:"Saudi Arabia";s:12:"address_city";s:8:"Aljubail";s:11:"verify_sign";s:56:"AJrhH8j7lqjTbV7fwJl3S3Ys6YmzAGL4VTSQ99WaoLLcIKJzBtm-dUQk";s:11:"payer_email";s:22:"nhymju246bgt@gmail.com";s:4:"memo";s:93:"This is The price of registration For Black Firady I hope to like results form this subscribe";s:6:"txn_id";s:17:"22T70159T9993390F";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:8:"Almulhim";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.60";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"SA";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"75.00";s:12:"ipn_track_id";s:13:"65ea62a43b062";}', 1511775380, '173.0.81.1'),
(375, 'Tried to pay Funds (75.00): 0 Userid:0', 1511775380, '173.0.81.1'),
(376, 'Attempted to pay Funds', 1511855738, '173.0.81.1'),
(377, 'a:33:{s:8:"mc_gross";s:5:"75.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"8B3GRFR7V63XU";s:14:"address_street";s:43:"Kurstrae 36\r\nc/o Deutsche Botschaft Kampala";s:12:"payment_date";s:25:"23:55:33 Nov 27, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"10117";s:10:"first_name";s:7:"Philipp";s:6:"mc_fee";s:4:"3.60";s:20:"address_country_code";s:2:"DE";s:12:"address_name";s:13:"Philipp Haack";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:7:"Germany";s:12:"address_city";s:6:"BERLIN";s:11:"verify_sign";s:56:"Af2MeqL6K2qSrkcj.M1ZheVft4QZAkNXhuSA3.3lvjrldfceL42KRgZB";s:11:"payer_email";s:18:"phaack85@gmail.com";s:6:"txn_id";s:17:"9N413769NW3188436";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"Haack";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.60";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"DE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"75.00";s:12:"ipn_track_id";s:13:"5cfa75e0205de";}', 1511855739, '173.0.81.1'),
(378, 'Tried to pay Funds (75.00): 0 Userid:0', 1511855739, '173.0.81.1'),
(379, 'Attempted to pay Funds', 1511869527, '173.0.81.1'),
(380, 'a:33:{s:8:"mc_gross";s:5:"75.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"9YAJB892QEUE6";s:14:"address_street";s:12:"via prato 26";s:12:"payment_date";s:25:"03:45:20 Nov 28, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"20152";s:10:"first_name";s:21:"simone erminio marzio";s:6:"mc_fee";s:4:"3.60";s:20:"address_country_code";s:2:"IT";s:12:"address_name";s:33:"simone erminio marzio campolunghi";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:5:"Italy";s:12:"address_city";s:6:"MILANO";s:11:"verify_sign";s:56:"AoGMOv2qLMWJakQk42Yh9TC9lYZuAPMt2x0h48DdTtJnmuzi9Xiw0-to";s:11:"payer_email";s:27:"simone@studiocampolunghi.it";s:6:"txn_id";s:17:"90U932150L413731F";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:11:"campolunghi";s:13:"address_state";s:2:"MI";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.60";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"IT";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"75.00";s:12:"ipn_track_id";s:13:"57c98f63eafb8";}', 1511869528, '173.0.81.1'),
(381, 'Tried to pay Funds (75.00): 0 Userid:0', 1511869528, '173.0.81.1'),
(382, 'Attempted to pay Funds', 1511880088, '173.0.81.1'),
(383, 'a:34:{s:8:"mc_gross";s:5:"75.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"NPSHYYM95LXZW";s:14:"address_street";s:18:"ITBC,UMS JALAN UMS";s:12:"payment_date";s:25:"06:40:39 Nov 28, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"88400";s:10:"first_name";s:9:"Cornelius";s:6:"mc_fee";s:4:"3.60";s:20:"address_country_code";s:2:"MY";s:12:"address_name";s:15:"Cornelius Peter";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:8:"Malaysia";s:12:"address_city";s:13:"KOTA KINABALU";s:11:"verify_sign";s:56:"ASjgprhNaTJbFxjf85yyyweQpPAxAisgeQ.XxqWLfK.N0qDw-OyWNu8I";s:11:"payer_email";s:26:"petercornelius84@gmail.com";s:4:"memo";s:6:"Bossfx";s:6:"txn_id";s:17:"0JW51472C80452056";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"Peter";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.60";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"MY";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"75.00";s:12:"ipn_track_id";s:13:"d925b960c5461";}', 1511880088, '173.0.81.1'),
(384, 'Tried to pay Funds (75.00): 0 Userid:0', 1511880088, '173.0.81.1'),
(385, 'Attempted to pay Funds', 1511913960, '173.0.81.1'),
(386, 'a:34:{s:8:"mc_gross";s:5:"75.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"WNFVKRF3XKTZ2";s:14:"address_street";s:17:"41 wilandra drive";s:12:"payment_date";s:25:"16:05:49 Nov 28, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"3029";s:10:"first_name";s:8:"paramjit";s:6:"mc_fee";s:4:"3.60";s:20:"address_country_code";s:2:"AU";s:12:"address_name";s:14:"paramjit singh";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Australia";s:12:"address_city";s:7:"tarneit";s:11:"verify_sign";s:56:"AvWood0JnqK49sFiIf1WLuyX88CEAM3vsK3gqkjrlkRXtfCfaPaINXMU";s:11:"payer_email";s:23:"rajiraji20000@gmail.com";s:4:"memo";s:6:"daljit";s:6:"txn_id";s:17:"6SP93597KH005990A";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"singh";s:13:"address_state";s:8:"Victoria";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.60";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"AU";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"75.00";s:12:"ipn_track_id";s:13:"641f8eaeec66f";}', 1511913960, '173.0.81.1'),
(387, 'Tried to pay Funds (75.00): 0 Userid:0', 1511913960, '173.0.81.1'),
(388, 'Attempted to pay Funds', 1511986519, '173.0.81.1'),
(389, 'a:33:{s:8:"mc_gross";s:5:"75.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"RSHKN4FNXBSVS";s:14:"address_street";s:19:"2275 spin drift way";s:12:"payment_date";s:25:"12:15:07 Nov 29, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"30043";s:10:"first_name";s:6:"Andrew";s:6:"mc_fee";s:4:"3.60";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:14:"Andrew Everett";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:13:"Lawrenceville";s:11:"verify_sign";s:56:"ARdQIHD6UF.ZkMCPrHDY.k6Ng0rdAWkrB54.P1C8FqrwAlIwGni3TL7m";s:11:"payer_email";s:18:"aever770@gmail.com";s:6:"txn_id";s:17:"29F31338CR978015H";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"Everett";s:13:"address_state";s:2:"GA";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.60";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"US";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"75.00";s:12:"ipn_track_id";s:12:"81c40b452ee2";}', 1511986520, '173.0.81.1'),
(390, 'Tried to pay Funds (75.00): 0 Userid:0', 1511986520, '173.0.81.1'),
(391, 'Attempted to pay Funds', 1513495144, '173.0.81.1'),
(392, 'a:33:{s:8:"mc_gross";s:5:"75.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"PANT9CSKQYHRG";s:14:"address_street";s:67:"No.35, spg.258. Kg Tungku Gadong, BE 2119, Negara Brunei Darussalam";s:12:"payment_date";s:25:"23:18:52 Dec 16, 2017 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:6:"BE2119";s:10:"first_name";s:15:"muhamad syahman";s:6:"mc_fee";s:4:"3.60";s:20:"address_country_code";s:2:"BN";s:12:"address_name";s:31:"muhamad syahman Haji Abu Hassan";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:6:"Brunei";s:12:"address_city";s:12:"Brunei Muara";s:11:"verify_sign";s:56:"AgcH087dQxIwJdE99tOdWhNyX9d1Aszdi77cIg.axRYzN2L12gQbXDrl";s:11:"payer_email";s:21:"mdsyahman@hotmail.com";s:6:"txn_id";s:17:"9MS94186CL248714M";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:15:"Haji Abu Hassan";s:13:"address_state";s:19:"Bandar Seri Begawan";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.60";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"BN";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"75.00";s:12:"ipn_track_id";s:13:"a5270cbbc3c75";}', 1513495144, '173.0.81.1'),
(393, 'Tried to pay Funds (75.00): 0 Userid:0', 1513495144, '173.0.81.1'),
(394, 'Attempted to pay Funds', 1514547406, '173.0.81.1'),
(395, 'Attempted to pay Funds', 1514547520, '173.0.81.1'),
(396, 'Attempted to pay Funds', 1514913583, '173.0.81.1'),
(397, 'a:33:{s:8:"mc_gross";s:5:"49.85";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"RSXGJMQRU42BL";s:14:"address_street";s:8:"12 Malan";s:12:"payment_date";s:25:"09:19:30 Jan 02, 2018 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"9459";s:10:"first_name";s:6:"Marvin";s:6:"mc_fee";s:4:"2.49";s:20:"address_country_code";s:2:"ZA";s:12:"address_name";s:11:"Marvin Louw";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:10:"unverified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:12:"South Africa";s:12:"address_city";s:6:"Welkom";s:11:"verify_sign";s:56:"A1Aa.PNxTJytQdn4YIq9Us7fCGELAgM.vqpc5q3TbCRLOswoh0dA5Dlo";s:11:"payer_email";s:20:"mabster057@gmail.com";s:6:"txn_id";s:17:"5MS55727KS376581R";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:4:"Louw";s:13:"address_state";s:10:"Free state";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"2.49";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"ZA";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"49.85";s:12:"ipn_track_id";s:12:"780a04b81933";}', 1514913583, '173.0.81.1'),
(398, 'Tried to pay Funds (49.85): 0 Userid:0', 1514913583, '173.0.81.1'),
(399, 'Attempted to pay Funds', 1515659131, '173.0.81.1'),
(400, 'a:25:{s:19:"transaction_subject";s:0:"";s:12:"payment_date";s:25:"00:25:20 Jan 11, 2018 PST";s:8:"txn_type";s:10:"send_money";s:9:"last_name";s:0:"";s:17:"residence_country";s:2:"RU";s:13:"payment_gross";s:5:"49.46";s:11:"mc_currency";s:3:"USD";s:8:"business";s:22:"bossfxsignal@gmail.com";s:12:"payment_type";s:7:"instant";s:22:"protection_eligibility";s:32:"Partially Eligible - Unauth Only";s:11:"verify_sign";s:56:"AO0SVsJD3Jek-G91Yric0ZYkohTjAANyDrhCpBU..bS2CzAT7ZC8-oV2";s:12:"payer_status";s:8:"verified";s:11:"payer_email";s:23:"medovnikanton@gmail.com";s:6:"txn_id";s:17:"0VL51188N3136213V";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:10:"first_name";s:0:"";s:8:"payer_id";s:13:"PUWETZWL6B6MS";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:14:"payment_status";s:9:"Completed";s:11:"payment_fee";s:4:"2.48";s:6:"mc_fee";s:4:"2.48";s:8:"mc_gross";s:5:"49.46";s:7:"charset";s:12:"windows-1252";s:14:"notify_version";s:3:"3.8";s:12:"ipn_track_id";s:13:"6ccd310e38155";}', 1515659132, '173.0.81.1'),
(401, 'Tried to pay Funds (49.46): 0 Userid:0', 1515659132, '173.0.81.1'),
(402, 'Attempted to pay Funds', 1515989416, '173.0.81.1'),
(403, 'a:34:{s:8:"mc_gross";s:5:"75.00";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"WNFVKRF3XKTZ2";s:14:"address_street";s:17:"41 wilandra drive";s:12:"payment_date";s:25:"20:10:04 Jan 14, 2018 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:4:"3029";s:10:"first_name";s:8:"paramjit";s:6:"mc_fee";s:4:"3.60";s:20:"address_country_code";s:2:"AU";s:12:"address_name";s:14:"paramjit singh";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:9:"Australia";s:12:"address_city";s:7:"tarneit";s:11:"verify_sign";s:56:"Au7czae-lQH337Ie6-vXf9F7XrsjAwZ-JWAaRSUwiT9SwzoLrpf.NZMM";s:11:"payer_email";s:23:"rajiraji20000@gmail.com";s:4:"memo";s:6:"Daljit";s:6:"txn_id";s:17:"8K929270W4432980D";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"singh";s:13:"address_state";s:8:"Victoria";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:4:"3.60";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"AU";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:5:"75.00";s:12:"ipn_track_id";s:12:"57c58d7ed77d";}', 1515989417, '173.0.81.1'),
(404, 'Tried to pay Funds (75.00): 0 Userid:0', 1515989417, '173.0.81.1'),
(405, 'Attempted to pay Funds', 1516170679, '173.0.81.1'),
(406, 'Attempted to pay Funds', 1516170681, '173.0.81.1'),
(407, 'Attempted to pay Funds', 1516900807, '173.0.81.1'),
(408, 'a:33:{s:8:"mc_gross";s:6:"357.89";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"8B3GRFR7V63XU";s:14:"address_street";s:17:"Leipziger Str. 66";s:12:"payment_date";s:25:"09:19:58 Jan 25, 2018 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"10117";s:10:"first_name";s:7:"Philipp";s:6:"mc_fee";s:5:"16.05";s:20:"address_country_code";s:2:"DE";s:12:"address_name";s:13:"Philipp Haack";s:14:"notify_version";s:3:"3.8";s:12:"payer_status";s:8:"verified";s:8:"business";s:22:"bossfxsignal@gmail.com";s:15:"address_country";s:7:"Germany";s:12:"address_city";s:6:"Berlin";s:11:"verify_sign";s:56:"A2rvNhZvvWlYeLai8pzUm1NlGxkOAKmjxLRxLetu-Lz-ghOLDsgY9yzI";s:11:"payer_email";s:18:"phaack85@gmail.com";s:6:"txn_id";s:17:"8P278350BM487803C";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"Haack";s:13:"address_state";s:0:"";s:14:"receiver_email";s:22:"bossfxsignal@gmail.com";s:11:"payment_fee";s:5:"16.05";s:11:"receiver_id";s:13:"35ZEQXEY9TRF4";s:8:"txn_type";s:10:"send_money";s:11:"mc_currency";s:3:"USD";s:17:"residence_country";s:2:"DE";s:19:"transaction_subject";s:0:"";s:13:"payment_gross";s:6:"357.89";s:12:"ipn_track_id";s:13:"6f8fede8e9bf2";}', 1516900808, '173.0.81.1'),
(409, 'Tried to pay Funds (357.89): 0 Userid:0', 1516900808, '173.0.81.1');

-- --------------------------------------------------------

--
-- Table structure for table `ip_block`
--

CREATE TABLE `ip_block` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(200) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'External', '2019-12-17 00:00:00', '2019-12-17 00:00:00'),
(2, 'Internal', '2019-12-17 00:00:00', '2019-12-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) NOT NULL DEFAULT '',
  `username` varchar(500) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`ID`, `IP`, `username`, `count`, `timestamp`) VALUES
(71, '::1', 'dode.agung.asmara@gmail.com', 2, 1576515671);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) NOT NULL,
  `bot` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `chat` int(14) NOT NULL,
  `type` varchar(30) NOT NULL,
  `content` varchar(250) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id` int(200) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'GI-GI 150KV Kapal', '2019-12-17 00:00:00', '2019-12-17 00:00:00'),
(2, 'GI-GI 150KV Pemecutan Kelod', '2019-12-17 00:00:00', '2019-12-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(500) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `password_reset`
--

INSERT INTO `password_reset` (`ID`, `userid`, `token`, `timestamp`, `IP`) VALUES
(0, 404, '5696a3c112e05631468d7d13389ff0650fa8a77b', 1569934549, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `ID` int(11) NOT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `idplan` int(11) NOT NULL,
  `idduration` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amountsum` decimal(10,2) NOT NULL,
  `code_unique` decimal(10,0) NOT NULL,
  `currency_code` varchar(200) NOT NULL,
  `payment_channel` varchar(200) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `email` varchar(500) NOT NULL DEFAULT '',
  `email_paypal` varchar(500) NOT NULL,
  `deadline_pay` datetime NOT NULL,
  `is_pay` tinyint(1) NOT NULL DEFAULT '0',
  `exp_service` date NOT NULL,
  `transfer_proof` varchar(200) NOT NULL,
  `date_pay` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_logs`
--

INSERT INTO `payment_logs` (`ID`, `invoice_no`, `userid`, `idplan`, `idduration`, `amount`, `discount`, `amountsum`, `code_unique`, `currency_code`, `payment_channel`, `timestamp`, `email`, `email_paypal`, `deadline_pay`, `is_pay`, `exp_service`, `transfer_proof`, `date_pay`) VALUES
(81, 'BossFX170200088-61', 88, 2, 1, '651700.00', '0.00', '651761.00', '61', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-06-29 03:08:01', 0, '2017-07-28', '', '0000-00-00'),
(82, 'BossFX170200089-50', 89, 2, 3, '4947600.00', '0.00', '4947654.00', '54', 'IDR', 'bank', 0, 'Mahendratradersfx@gmail.com', '', '2017-06-29 21:12:35', 0, '2018-06-29', '', '0000-00-00'),
(83, 'BossFX170400090-74', 90, 4, 1, '1981700.00', '0.00', '1981722.00', '22', 'IDR', 'bank', 0, 'Jayantaranyoman@gmail.com', '', '2017-06-30 09:41:49', 0, '2017-07-29', '', '0000-00-00'),
(84, 'BossFX170300091-16', 91, 3, 1, '1303400.00', '0.00', '1303459.00', '59', 'IDR', 'bank', 0, 'amirzulmuhd@gmail.com', '', '2017-06-30 10:29:53', 0, '2017-07-29', '', '0000-00-00'),
(85, 'BossFX170400092-22', 92, 4, 1, '149.17', '0.00', '149.17', '0', 'USD', 'transfer paypal', 0, 'uneshddarann07@gmail.com', 'uneshddarann07@gmail.com', '2017-07-01 07:55:15', 1, '2017-07-30', '', '2017-06-30'),
(86, 'BossFX170300093-57', 93, 3, 1, '98.00', '0.00', '98.41', '0', 'USD', 'paypal', 0, 'amirzulmuhd@gmail.com', 'amirzulmuhd@gmail.com', '2017-07-02 00:58:59', 0, '2017-08-01', '', '0000-00-00'),
(87, 'BossFX170300094-23', 94, 3, 1, '98.79', '0.00', '98.79', '1', 'USD', 'transfer paypal', 0, 'amirzulmuhd@gmail.com', 'amirzulmuhd@gmail.com', '2017-07-02 21:22:04', 1, '2017-08-02', '', '2017-07-02'),
(88, 'BossFX170200100-30', 100, 2, 1, '651700.00', '0.00', '651799.00', '99', 'IDR', 'bank', 0, 'ferry.budiman@gmail.com', 'ferry.budiman@gmail.com', '2017-07-05 01:15:27', 0, '2017-08-04', '', '0000-00-00'),
(89, 'BossFX170400118-90', 118, 4, 1, '1981700.00', '0.00', '1981754.00', '54', 'IDR', 'bank', 0, 'Mahendratradersfx@gmail.com', '', '2017-07-05 12:27:28', 0, '2017-08-05', '', '0000-00-00'),
(90, 'BossFX170200121-13', 121, 2, 2, '117.00', '0.00', '117.60', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'Dode.agung.asmara@gmail.com', '2017-07-05 12:48:45', 0, '2017-10-05', '', '0000-00-00'),
(91, 'BossFX170200122-67', 122, 2, 1, '651700.00', '0.00', '651757.00', '57', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'Dode.agung.asmara@gmail.com', '2017-07-05 12:50:01', 0, '2017-08-05', '', '0000-00-00'),
(92, 'BossFX170200123-96', 123, 2, 1, '49.00', '0.00', '49.30', '0', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-05 13:18:18', 0, '2017-08-05', '', '0000-00-00'),
(93, 'BossFX170200192-38', 192, 2, 1, '651700.00', '0.00', '651740.00', '40', 'IDR', 'bank', 0, 'reeyearjaffrey@yahoo.com', '', '2017-07-06 00:44:33', 0, '2017-08-05', '', '0000-00-00'),
(94, 'BossFX170200212-16', 212, 2, 1, '651700.00', '0.00', '651795.00', '95', 'IDR', 'bank', 0, 'yesj138@gmail.com', 'yesj138@gmail.com', '2017-07-06 03:57:38', 0, '2017-08-05', '', '0000-00-00'),
(95, 'BossFX170100221-11', 221, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-06 05:36:02', 1, '2017-08-05', '', '0000-00-00'),
(96, 'BossFX170100222-31', 222, 1, 1, '0.00', '0.00', '0.26', '0', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-06 05:39:53', 1, '2017-08-05', '', '0000-00-00'),
(97, 'BossFX170100223-82', 223, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-06 05:44:09', 1, '2017-08-05', '', '0000-00-00'),
(98, 'BossFX170200224-96', 224, 2, 1, '49.00', '0.00', '49.15', '0', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-06 05:45:32', 0, '2017-08-05', '', '0000-00-00'),
(99, 'BossFX170200225-35', 225, 2, 1, '651700.00', '0.00', '651773.00', '73', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-06 05:57:33', 0, '2017-08-05', '', '0000-00-00'),
(100, 'BossFX170200226-85', 226, 2, 1, '651700.00', '0.00', '651728.00', '28', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-06 06:01:41', 0, '2017-08-05', '', '0000-00-00'),
(101, 'BossFX170200227-38', 227, 2, 1, '49.00', '0.00', '49.66', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-06 06:02:43', 0, '2017-08-05', '', '0000-00-00'),
(102, 'BossFX170100228-90', 228, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-06 06:23:08', 1, '2017-08-05', '', '0000-00-00'),
(103, 'BossFX170100229-95', 229, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-06 06:25:20', 1, '2017-08-05', '', '0000-00-00'),
(104, 'BossFX170100230-15', 230, 1, 1, '0.00', '0.00', '0.99', '1', 'USD', 'Free', 0, 'madani10day@gmail.com', '', '2017-07-06 06:52:40', 1, '2017-08-05', '', '0000-00-00'),
(105, 'BossFX170100231-01', 231, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'jackyveloxa65@gmail.com', 'jackyveloxa65@gmail.com', '2017-07-06 08:09:48', 1, '2017-08-05', '', '0000-00-00'),
(106, 'BossFX170100232-38', 232, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'shamsul6066@gmail.com', 'shamsul6066@gmail.com', '2017-07-06 08:11:26', 1, '2017-08-05', '', '0000-00-00'),
(107, 'BossFX170100233-37', 233, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'hadianto.benny@yahoo.com', 'hadianto.benny@yahoo.com', '2017-07-06 09:16:51', 1, '2017-08-05', '', '0000-00-00'),
(108, 'BossFX170100234-49', 234, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'dieaeidin1@gmail.com', '', '2017-07-06 11:34:09', 1, '2017-08-05', '', '0000-00-00'),
(109, 'BossFX170100235-60', 235, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'amrul.wibawanto@gmail.com', '', '2017-07-06 13:14:54', 1, '2017-08-06', '', '0000-00-00'),
(110, 'BossFX170100236-05', 236, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'faridaforex84@gmail.com', '', '2017-07-06 20:31:42', 1, '2017-08-06', '', '0000-00-00'),
(111, 'BossFX170100237-69', 237, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'Elrapha2419@gmail.com', '', '2017-07-06 20:48:39', 1, '2017-08-06', '', '0000-00-00'),
(112, 'BossFX170100238-76', 238, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'crisnur76@gmail.com', '', '2017-07-06 20:56:39', 1, '2017-08-06', '', '0000-00-00'),
(113, 'BossFX170100239-37', 239, 1, 1, '0.00', '0.00', '0.94', '1', 'USD', 'Free', 0, 'mohdadib811@gmail.com', '', '2017-07-06 21:02:29', 1, '2017-08-06', '', '0000-00-00'),
(114, 'BossFX170100240-64', 240, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'kirna.winata@bbgemilang.co.id', '', '2017-07-06 21:07:15', 1, '2017-08-06', '', '0000-00-00'),
(115, 'BossFX170100241-19', 241, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'nivlagnof@gmail.com', 'nivlagnof@gmail.com', '2017-07-06 21:20:01', 1, '2017-08-06', '', '0000-00-00'),
(116, 'BossFX170100242-61', 242, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'makeoghre811@gmail.com', '', '2017-07-06 22:12:35', 1, '2017-08-06', '', '0000-00-00'),
(117, 'BossFX170100243-37', 243, 1, 1, '0.00', '0.00', '0.86', '1', 'USD', 'Free', 0, 'makeoghre811@gmail.com', '', '2017-07-06 22:12:47', 1, '2017-08-06', '', '0000-00-00'),
(118, 'BossFX170100244-53', 244, 1, 1, '0.00', '0.00', '0.99', '1', 'USD', 'Free', 0, 'henri.purnawan@gmail.com', 'henri.purnawan@gmail.com', '2017-07-06 22:20:06', 1, '2017-08-06', '', '0000-00-00'),
(119, 'BossFX170100245-01', 245, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'berjaya88travel@gmail.com', 'berjaya88travel@gmail.com', '2017-07-06 22:26:32', 1, '2017-08-06', '', '0000-00-00'),
(120, 'BossFX170100246-46', 246, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'nizam251zulhilmi@gmail.com', '', '2017-07-06 22:56:02', 1, '2017-08-06', '', '0000-00-00'),
(121, 'BossFX170100247-92', 247, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'Aleph_ixo66@hotmail.com', '', '2017-07-06 23:25:51', 1, '2017-08-06', '', '0000-00-00'),
(122, 'BossFX170100248-07', 248, 1, 1, '0.00', '0.00', '0.57', '1', 'USD', 'Free', 0, 'ariantokam12@gmail.com', '', '2017-07-07 00:27:50', 1, '2017-08-06', '', '0000-00-00'),
(123, 'BossFX170100249-28', 249, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'hasibuanjoshua@gmail.com', '', '2017-07-07 02:52:56', 1, '2017-08-06', '', '0000-00-00'),
(124, 'BossFX170200250-95', 250, 2, 1, '651700.00', '0.00', '651792.00', '92', 'IDR', 'bank', 0, 'reboot.bs@gmail.com', 'reboot.bs@gmail.com', '2017-07-07 03:23:36', 0, '2017-08-06', '', '0000-00-00'),
(125, 'BossFX170100251-49', 251, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'reboot.bs@gmail.com', 'reboot.bs@gmail.com', '2017-07-07 09:23:26', 1, '2017-08-06', '', '0000-00-00'),
(126, 'BossFX170100252-19', 252, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'celinscu@gmail.com', 'celinscu@gmail.com', '2017-07-07 10:06:42', 1, '2017-08-06', '', '0000-00-00'),
(127, 'BossFX170100253-05', 253, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'shazwanblack@gmail.com', 'shazwanblack@gmail.com', '2017-07-07 11:30:18', 1, '2017-08-06', '', '0000-00-00'),
(128, 'BossFX170100254-80', 254, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'Ekotri2015@gmail.com', '', '2017-07-07 22:37:21', 1, '2017-08-07', '', '0000-00-00'),
(129, 'BossFX170100255-72', 255, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'Ekotri2015@gmail.com', '', '2017-07-07 22:37:58', 1, '2017-08-07', '', '0000-00-00'),
(130, 'BossFX170100256-80', 256, 1, 1, '0.00', '0.00', '0.75', '1', 'USD', 'Free', 0, 'ekotri2015@gmail.com', '', '2017-07-07 22:39:27', 1, '2017-08-07', '', '0000-00-00'),
(131, 'BossFX170100257-15', 257, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'ekotri2015@gmail.com', '', '2017-07-07 22:43:13', 1, '2017-08-07', '', '0000-00-00'),
(132, 'BossFX170100258-55', 258, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'ekotri2015@gmail.com', '', '2017-07-07 22:43:23', 1, '2017-08-07', '', '0000-00-00'),
(133, 'BossFX170100259-89', 259, 1, 1, '0.00', '0.00', '0.61', '1', 'USD', 'Free', 0, 'ronshah@gmail.com', 'ronshah@gmail.com', '2017-07-08 03:10:18', 1, '2017-08-07', '', '0000-00-00'),
(134, 'BossFX170200260-76', 260, 2, 1, '49.33', '0.00', '49.33', '0', 'USD', 'transfer paypal', 0, 'winoto.nina@gmail.com', 'winoto.nina@gmail.com', '2017-07-08 08:52:01', 1, '2017-08-07', '', '2017-07-07'),
(135, 'BossFX170100261-77', 261, 1, 1, '0.00', '0.00', '0.24', '0', 'USD', 'Free', 0, 'ismailonline07@gmail.com', 'ismailonline07@gmail.com', '2017-07-08 22:08:58', 1, '2017-08-08', '', '0000-00-00'),
(136, 'BossFX170100262-86', 262, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'elvis_intriago@hotmail.com', 'elvis_intriago@hotmail.com', '2017-07-09 00:24:51', 1, '2017-08-08', '', '0000-00-00'),
(137, 'BossFX170100263-07', 263, 1, 1, '0.00', '0.00', '0.88', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-09 01:39:40', 1, '2017-08-08', '', '0000-00-00'),
(138, 'BossFX170100264-66', 264, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'mbacchetti70@gmail.com', '', '2017-07-09 01:52:33', 1, '2017-08-08', '', '0000-00-00'),
(139, 'BossFX170200265-53', 265, 2, 1, '651700.00', '0.00', '651758.00', '58', 'IDR', 'bank', 0, '1kwords.picture@gmail.com', '1kwords.picture@gmail.com', '2017-07-09 02:09:06', 0, '2017-08-08', '', '0000-00-00'),
(140, 'BossFX170200266-79', 266, 2, 1, '651700.00', '0.00', '651739.00', '39', 'IDR', 'bank', 0, '1kwords.picture@gmail.com', '1kwords.picture@gmail.com', '2017-07-09 02:10:22', 0, '2017-08-08', '', '0000-00-00'),
(141, 'BossFX170100267-89', 267, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'alyaalen868@gmail.com', 'alyaalen868@gmail.com', '2017-07-09 02:34:26', 1, '2017-08-08', '', '0000-00-00'),
(142, 'BossFX170100268-34', 268, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'zalinforex@gmail.com', 'zalinforex@gmail.com', '2017-07-09 03:30:37', 1, '2017-08-08', '', '0000-00-00'),
(143, 'BossFX170100269-72', 269, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'zalinforex@gmail.com', 'zalinforex@gmail.com', '2017-07-09 03:30:48', 1, '2017-08-08', '', '0000-00-00'),
(144, 'BossFX170100270-97', 270, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'zalinforex@gmail.com', 'zalinforex@gmail.com', '2017-07-09 03:30:58', 1, '2017-08-08', '', '0000-00-00'),
(145, 'BossFX170100271-09', 271, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'zalinforex@gmail.com', 'zalinforex@gmail.com', '2017-07-09 03:31:09', 1, '2017-08-08', '', '0000-00-00'),
(146, 'BossFX170100272-25', 272, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'zalinforex@gmail.com', 'zalinforex@gmail.com', '2017-07-09 03:31:19', 1, '2017-08-08', '', '0000-00-00'),
(147, 'BossFX170100273-63', 273, 1, 1, '0.00', '0.00', '0.21', '0', 'USD', 'Free', 0, 'gokhans903@gmail.com', 'gokhans903@gmail.com', '2017-07-09 05:52:28', 1, '2017-08-08', '', '0000-00-00'),
(148, 'BossFX170100274-59', 274, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'lalin007@gmail.com', 'lalin007@gmail.com', '2017-07-09 06:06:23', 1, '2017-08-08', '', '0000-00-00'),
(149, 'BossFX170100275-35', 275, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'bilal_awan444444@yahoo.com', '', '2017-07-09 07:16:16', 1, '2017-08-08', '', '0000-00-00'),
(150, 'BossFX170100276-67', 276, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'gkia71@yahoo.com', '', '2017-07-09 09:09:15', 1, '2017-08-08', '', '0000-00-00'),
(151, 'BossFX170100277-43', 277, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'haresh.mulani@yahoo.com', '', '2017-07-09 12:58:37', 1, '2017-08-09', '', '0000-00-00'),
(152, 'BossFX170100278-34', 278, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'Alhezzini@gmail.com', 'Alhezzini@gmail.com', '2017-07-09 13:07:33', 1, '2017-08-09', '', '0000-00-00'),
(153, 'BossFX170100279-81', 279, 1, 1, '0.00', '0.00', '0.73', '1', 'USD', 'Free', 0, 'omphiek@gmail.com', 'Omphiek@gmail.com', '2017-07-09 14:00:21', 1, '2017-08-09', '', '0000-00-00'),
(154, 'BossFX170100280-38', 280, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'mojabghasroddashti@gmail.com', 'mojabghasroddashti@gmail.com', '2017-07-09 14:28:52', 1, '2017-08-09', '', '0000-00-00'),
(155, 'BossFX170100281-40', 281, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'martincarbajal@hotmail.com', 'martincarbajal@hotmail.com', '2017-07-09 14:39:35', 1, '2017-08-09', '', '0000-00-00'),
(156, 'BossFX170100282-81', 282, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'hilmyz87@gmail.com', 'hilmy39@gmail.com', '2017-07-09 22:50:42', 1, '2017-08-09', '', '0000-00-00'),
(157, 'BossFX170100283-63', 283, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'andie.herawandi@gmail.com', 'andieth@gmail.com', '2017-07-09 22:52:45', 1, '2017-08-09', '', '0000-00-00'),
(158, 'BossFX170100284-20', 284, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'irzan81@yahoo.com', 'irzan81@yahoo.com', '2017-07-09 22:55:36', 1, '2017-08-09', '', '0000-00-00'),
(159, 'BossFX170100285-51', 285, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'haynesbrittani@yahoo.com', 'haynesbrittani@yahoo.com', '2017-07-09 22:58:36', 1, '2017-08-09', '', '0000-00-00'),
(160, 'BossFX170200286-16', 286, 2, 1, '651700.00', '0.00', '651794.00', '94', 'IDR', 'bank', 0, 'andieth@gmail.com', 'andieth@gmail.com', '2017-07-09 23:08:39', 0, '2017-08-09', '', '0000-00-00'),
(161, 'BossFX170100287-93', 287, 1, 1, '0.00', '0.00', '0.86', '1', 'USD', 'Free', 0, 'sherenibaron@gmail.com', '', '2017-07-09 23:25:12', 1, '2017-08-09', '', '0000-00-00'),
(162, 'BossFX170100288-91', 288, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'wazax73@gmail.com', '', '2017-07-09 23:56:18', 1, '2017-08-09', '', '0000-00-00'),
(163, 'BossFX170100289-80', 289, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'munawirs0701@gmail.com', '', '2017-07-10 00:00:59', 1, '2017-08-09', '', '0000-00-00'),
(164, 'BossFX170100290-44', 290, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'munawirs0701@gmail.com', '', '2017-07-10 00:01:13', 1, '2017-08-09', '', '0000-00-00'),
(165, 'BossFX170100291-59', 291, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'ray.saw@gmail.com', 'ray.saw@gmail.com', '2017-07-10 00:08:13', 1, '2017-08-09', '', '0000-00-00'),
(166, 'BossFX170100292-73', 292, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'k83kash5090@gmail.com', 'k83kash5090@gmail.com', '2017-07-10 00:25:21', 1, '2017-08-09', '', '0000-00-00'),
(167, 'BossFX170100293-42', 293, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'k83kash5090@gmail.com', 'k83kash5090@gmail.com', '2017-07-10 00:27:00', 1, '2017-08-09', '', '0000-00-00'),
(168, 'BossFX170100294-44', 294, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'anakmubarak@gmail.com', '', '2017-07-10 00:36:57', 1, '2017-08-09', '', '0000-00-00'),
(169, 'BossFX170100295-64', 295, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'hamliy79@gmail.com', 'hamliy79@gmail.com', '2017-07-10 00:57:16', 1, '2017-08-09', '', '0000-00-00'),
(170, 'BossFX170100296-86', 296, 1, 1, '0.00', '0.00', '0.21', '0', 'USD', 'Free', 0, 'hamliy79@gmail.com', 'hamliy79@gmail.com', '2017-07-10 00:57:55', 1, '2017-08-09', '', '0000-00-00'),
(171, 'BossFX170100297-98', 297, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'ieja_ler@yahoo.com', 'ieja_ler@yahoo.com', '2017-07-10 01:21:37', 1, '2017-08-09', '', '0000-00-00'),
(172, 'BossFX170100298-19', 298, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'goodnesszodwankambule@gmail.com', 'goodnesszodwankambule@gmail.com', '2017-07-10 01:22:08', 1, '2017-08-09', '', '0000-00-00'),
(173, 'BossFX170100299-82', 299, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'ahmadtarmiziadam78@gmail.con', '', '2017-07-10 01:50:05', 1, '2017-08-09', '', '0000-00-00'),
(174, 'BossFX170100300-97', 300, 1, 1, '0.00', '0.00', '0.24', '0', 'USD', 'Free', 0, 'Magayathando22@gmail.com', 'Magayathando22@gmail.com', '2017-07-10 02:03:28', 1, '2017-08-09', '', '0000-00-00'),
(175, 'BossFX170100301-58', 301, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'Magayathando22@gmail.com', 'Magayathando22@gmail.com', '2017-07-10 02:03:39', 1, '2017-08-09', '', '0000-00-00'),
(176, 'BossFX170100302-30', 302, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'Aurimaspauliukas@gmail.com', 'Aurimaspauliukas@gmail.com', '2017-07-10 02:37:27', 1, '2017-08-09', '', '0000-00-00'),
(177, 'BossFX170100303-66', 303, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'auliarizqi95@gmail.com', '', '2017-07-10 03:16:26', 1, '2017-08-09', '', '0000-00-00'),
(178, 'BossFX170100304-82', 304, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'auliarizqi95@gmail.com', '', '2017-07-10 03:16:38', 1, '2017-08-09', '', '0000-00-00'),
(179, 'BossFX170100305-02', 305, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'Suloyman35@hotmail.com', 'Suloyman35@hotmail.com', '2017-07-10 03:21:37', 1, '2017-08-09', '', '0000-00-00'),
(180, 'BossFX170100306-25', 306, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'Suloyman35@hotmail.com', 'Suloyman35@hotmail.com', '2017-07-10 03:21:51', 1, '2017-08-09', '', '0000-00-00'),
(181, 'BossFX170100307-31', 307, 1, 1, '0.00', '0.00', '0.78', '1', 'USD', 'Free', 0, 'tolucc01@gmail.com', 'tolucc01@gmail.com', '2017-07-10 03:28:53', 1, '2017-08-09', '', '0000-00-00'),
(182, 'BossFX170100308-33', 308, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'ar.abdulrahman@yahoo.com', 'ar.abdulrahman@yahoo.com', '2017-07-10 03:39:59', 1, '2017-08-09', '', '0000-00-00'),
(183, 'BossFX170100309-38', 309, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'ar.abdulrahman@yahoo.com', 'ar.abdulrahman@yahoo.com', '2017-07-10 03:40:08', 1, '2017-08-09', '', '0000-00-00'),
(184, 'BossFX170100310-97', 310, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'Vico.sys61@gmail.com', 'Vico.sys61@gmail.com', '2017-07-10 03:59:05', 1, '2017-08-09', '', '0000-00-00'),
(185, 'BossFX170100311-71', 311, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'Vico.sys61@gmail.com', 'Vico.sys61@gmail.com', '2017-07-10 03:59:17', 1, '2017-08-09', '', '0000-00-00'),
(186, 'BossFX170100312-07', 312, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'Vico.sys61@gmail.com', 'Vico.sys61@gmail.com', '2017-07-10 03:59:30', 1, '2017-08-09', '', '0000-00-00'),
(187, 'BossFX170100313-64', 313, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'tokunboakomolede@gmail.com', '', '2017-07-10 05:38:42', 1, '2017-08-09', '', '0000-00-00'),
(188, 'BossFX170100314-09', 314, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'jchopra53@gmail.com', '', '2017-07-10 07:00:06', 1, '2017-08-09', '', '0000-00-00'),
(189, 'BossFX170100315-24', 315, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'aaizat017@gmail.com', '', '2017-07-10 07:18:29', 1, '2017-08-09', '', '0000-00-00'),
(190, 'BossFX170100316-94', 316, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'azzkausar@ymail.com', 'azzkausar@ymail.com', '2017-07-10 07:50:23', 1, '2017-08-09', '', '0000-00-00'),
(191, 'BossFX170100317-44', 317, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'Marko.manasijevski@gmail.com', 'asd_fan@gmx.de', '2017-07-10 07:57:33', 1, '2017-08-09', '', '0000-00-00'),
(192, 'BossFX170100318-99', 318, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'rohaidaism@gmail.com', '', '2017-07-10 08:10:12', 1, '2017-08-09', '', '0000-00-00'),
(193, 'BossFX170100319-20', 319, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'tiangggmimiey@gmail.com', 'tiangggmimiey@gmail.com', '2017-07-10 08:24:49', 1, '2017-08-09', '', '0000-00-00'),
(194, 'BossFX170100320-96', 320, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'deejaydee16@gmail.com', '', '2017-07-10 08:36:02', 1, '2017-08-09', '', '0000-00-00'),
(195, 'BossFX170100321-85', 321, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'cparrar@gmail.com', 'cparrar@gmail.com', '2017-07-10 08:36:47', 1, '2017-08-09', '', '0000-00-00'),
(196, 'BossFX170100322-58', 322, 1, 1, '0.00', '0.00', '0.88', '1', 'USD', 'Free', 0, 'Sharaf_mak@yahoo.com', 'Sharaf_mak@yahoo.com', '2017-07-10 08:41:13', 1, '2017-08-09', '', '0000-00-00'),
(197, 'BossFX170100323-38', 323, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:49:54', 1, '2017-08-09', '', '0000-00-00'),
(198, 'BossFX170100324-40', 324, 1, 1, '0.00', '0.00', '0.26', '0', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:50:07', 1, '2017-08-09', '', '0000-00-00'),
(199, 'BossFX170100325-64', 325, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:50:17', 1, '2017-08-09', '', '0000-00-00'),
(200, 'BossFX170100326-59', 326, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:50:26', 1, '2017-08-09', '', '0000-00-00'),
(201, 'BossFX170100327-60', 327, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:50:35', 1, '2017-08-09', '', '0000-00-00'),
(202, 'BossFX170100328-25', 328, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:50:46', 1, '2017-08-09', '', '0000-00-00'),
(203, 'BossFX170100329-15', 329, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:50:55', 1, '2017-08-09', '', '0000-00-00'),
(204, 'BossFX170100330-38', 330, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:51:06', 1, '2017-08-09', '', '0000-00-00'),
(205, 'BossFX170100331-70', 331, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:51:15', 1, '2017-08-09', '', '0000-00-00'),
(206, 'BossFX170100332-44', 332, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:51:24', 1, '2017-08-09', '', '0000-00-00'),
(207, 'BossFX170100333-49', 333, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'briansiyanene@gmail.com', 'Brian.nene@valspareurope.com', '2017-07-10 08:51:33', 1, '2017-08-09', '', '0000-00-00'),
(208, 'BossFX170100334-30', 334, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'jesuslovedc@yahoo.com', 'jesuslovedc@yahoo.com', '2017-07-10 08:56:47', 1, '2017-08-09', '', '0000-00-00'),
(209, 'BossFX170100335-92', 335, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'izhar2501@gmail.com', '', '2017-07-10 09:08:21', 1, '2017-08-09', '', '0000-00-00'),
(210, 'BossFX170100336-41', 336, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'letlhaket@yahoo.com', 'letlhaket@yahoo.com.com', '2017-07-10 09:14:06', 1, '2017-08-09', '', '0000-00-00'),
(211, 'BossFX170100337-80', 337, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'roybuchanan1@gmail.com', '', '2017-07-10 09:29:59', 1, '2017-08-09', '', '0000-00-00'),
(212, 'BossFX170100338-71', 338, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'hydmadhav@gmail.com', 'hydmadhav@gmail.com', '2017-07-10 10:05:18', 1, '2017-08-09', '', '0000-00-00'),
(213, 'BossFX170100339-43', 339, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'hydmadhav@gmail.com', 'hydmadhav@gmail.com', '2017-07-10 10:05:31', 1, '2017-08-09', '', '0000-00-00'),
(214, 'BossFX170100340-27', 340, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'iim.pati@yahoo.co.id', 'iim.pati@yahoo.co.id', '2017-07-10 10:14:31', 1, '2017-08-09', '', '0000-00-00'),
(215, 'BossFX170100341-25', 341, 1, 1, '0.00', '0.00', '0.21', '0', 'USD', 'Free', 0, 'bestoriflame11@gmail.com', 'bestoriflame11@gmail.com', '2017-07-10 10:39:02', 1, '2017-08-09', '', '0000-00-00'),
(216, 'BossFX170100342-63', 342, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'nks5021@yahoo.com', '', '2017-07-10 10:55:34', 1, '2017-08-09', '', '0000-00-00'),
(217, 'BossFX170100343-86', 343, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 'anaktukangan@gmail.com', 'anaktukangan@gmail.com', '2017-07-10 11:01:17', 1, '2017-08-09', '', '0000-00-00'),
(218, 'BossFX170100344-63', 344, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 'Jditau@yahoo.com', 'Jditau@yahoo.com', '2017-07-10 11:12:14', 1, '2017-08-09', '', '0000-00-00'),
(219, 'BossFX170100345-02', 345, 1, 1, '0.00', '0.00', '0.55', '1', 'USD', 'Free', 0, 'forida6874@aol.com', 'forida6874@aol.com', '2017-07-10 11:19:56', 1, '2017-08-09', '', '0000-00-00'),
(220, 'BossFX170100346-46', 346, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, '201248099@student.uj.ac.za', '', '2017-07-10 11:44:26', 1, '2017-08-09', '', '0000-00-00'),
(221, 'BossFX170100347-46', 347, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'murukan0902@gmail.com', '', '2017-07-10 13:01:51', 1, '2017-08-10', '', '0000-00-00'),
(222, 'BossFX170100348-84', 348, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'sarbdivine@yahoo.com', '', '2017-07-10 13:25:30', 1, '2017-08-10', '', '0000-00-00'),
(223, 'BossFX170300349-53', 349, 3, 1, '1303400.00', '0.00', '1303472.00', '72', 'IDR', 'bank', 0, 'Auliarizqi95@gmail.com', '', '2017-07-10 17:38:06', 0, '2017-08-10', '', '0000-00-00'),
(224, 'BossFX170300350-22', 350, 3, 1, '1303400.00', '0.00', '1303490.00', '90', 'IDR', 'bank', 0, 'Auliarizqi95@gmail.com', '', '2017-07-10 17:38:17', 0, '2017-08-10', '', '0000-00-00'),
(225, 'BossFX170100351-98', 351, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, '7shosha@gmail.com', '', '2017-07-10 19:34:12', 1, '2017-08-10', '', '0000-00-00'),
(226, 'BossFX170100352-25', 352, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'objemmanuel1997@gmail.com', 'objemmanuel1997@gmail.com', '2017-07-10 21:08:16', 1, '2017-08-10', '', '0000-00-00'),
(227, 'BossFX170100353-81', 353, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'Haziqrare@gmail.com', '', '2017-07-10 21:22:00', 1, '2017-08-10', '', '0000-00-00'),
(228, 'BossFX170100354-76', 354, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'matahariterbit75@gmail.com', '', '2017-07-10 22:11:37', 1, '2017-08-10', '', '0000-00-00'),
(229, 'BossFX170100355-95', 355, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'matahariterbit75@gmail.com', '', '2017-07-10 22:11:59', 1, '2017-08-10', '', '0000-00-00'),
(230, 'BossFX170100356-46', 356, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'matahariterbit75@gmail.com', '', '2017-07-10 22:13:23', 1, '2017-08-10', '', '0000-00-00'),
(231, 'BossFX170100357-68', 357, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'matahariterbit75@gmail.com', '', '2017-07-10 22:14:03', 1, '2017-08-10', '', '0000-00-00'),
(232, 'BossFX170100358-87', 358, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'aerozl82@gmail.com', 'aerozl82@gmail.com', '2017-07-10 22:14:12', 1, '2017-08-10', '', '0000-00-00'),
(233, 'BossFX170100359-98', 359, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'matahariterbit75@gmail.com', '', '2017-07-10 22:15:22', 1, '2017-08-10', '', '0000-00-00'),
(234, 'BossFX170100360-71', 360, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'matahariterbit75@gmail.com', '', '2017-07-10 22:16:11', 1, '2017-08-10', '', '0000-00-00'),
(235, 'BossFX170100361-55', 361, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'matahariterbit75@gmail.com', '', '2017-07-10 22:16:54', 1, '2017-08-10', '', '0000-00-00'),
(236, 'BossFX170100362-02', 362, 1, 1, '0.00', '0.00', '0.37', '0', 'USD', 'Free', 0, 'prophetkabod@gmail.com', 'prophetkabod@gmail.com', '2017-07-11 08:42:35', 1, '2017-08-10', '', '0000-00-00'),
(237, 'BossFX170100363-26', 363, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'batrisyakamal278@gmail.com', '', '2017-07-11 09:26:45', 1, '2017-08-10', '', '0000-00-00'),
(238, 'BossFX170300364-78', 364, 3, 1, '98.78', '0.00', '98.78', '1', 'USD', 'transfer paypal', 0, 'alegalli66@gmail.com', 'alegalli66@gmail.com', '2017-07-11 10:14:28', 1, '2017-08-10', '', '2017-07-10'),
(239, 'BossFX170100365-54', 365, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'vicksdlamini@gmail.com', '', '2017-07-11 14:59:42', 1, '2017-08-11', '', '0000-00-00'),
(240, 'BossFX170100366-01', 366, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'arifrahim700@gmail.com', 'arifrahim700@gmail.com', '2017-07-12 02:32:48', 1, '2017-08-11', '', '0000-00-00'),
(241, 'BossFX170100367-57', 367, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 'miguelpedrorato@gmail.com', 'miguelpedrorato@gmail.com', '2017-07-12 04:28:09', 1, '2017-08-11', '', '0000-00-00'),
(242, 'BossFX170100368-50', 368, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'aboeydk@gmail.com', 'aboeydk@gmail.com', '2017-07-12 04:29:02', 1, '2017-08-11', '', '0000-00-00'),
(243, 'BossFX170100369-30', 369, 1, 1, '0.00', '0.00', '0.75', '1', 'USD', 'Free', 0, 'berjaya88travel@gmail.com', 'berjaya88travel@gmail.com', '2017-07-12 04:31:56', 1, '2017-08-11', '', '0000-00-00'),
(244, 'BossFX170100370-69', 370, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'aslan.darius@aol.com', 'aslan.darius@aol.com', '2017-07-12 04:34:40', 1, '2017-08-11', '', '0000-00-00'),
(245, 'BossFX170100371-40', 371, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'Ihsanforex95@gmail.com', 'Ihsanforex95@gmail.com', '2017-07-12 04:52:04', 1, '2017-08-11', '', '0000-00-00'),
(246, 'BossFX170100372-04', 372, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'gladysmakoni@yahoo.co.uk', 'gladysmakoni@yahoo.co.uk', '2017-07-12 05:53:03', 1, '2017-08-11', '', '0000-00-00'),
(247, 'BossFX170100373-56', 373, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'hendrayanatan76@gmail.com', '', '2017-07-12 10:55:13', 1, '2017-08-11', '', '0000-00-00'),
(248, 'BossFX170100374-25', 374, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'amrul.wibawanto@gmail.com', '', '2017-07-12 10:55:39', 1, '2017-08-11', '', '0000-00-00'),
(249, 'BossFX170100375-25', 375, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'ezanhackz@gmail.com', 'ezanhackz@gmail.com', '2017-07-12 11:23:01', 1, '2017-08-11', '', '0000-00-00'),
(250, 'BossFX170100376-77', 376, 1, 1, '0.00', '0.00', '0.89', '1', 'USD', 'Free', 0, 'Suloyman35@hotmail.com', 'Suloyman35@hotmail.com', '2017-07-12 11:49:32', 1, '2017-08-11', '', '0000-00-00'),
(251, 'BossFX170100377-57', 377, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'Suloyman35@hotmail.com', 'Suloyman35@hotmail.com', '2017-07-12 11:49:48', 1, '2017-08-11', '', '0000-00-00'),
(252, 'BossFX170100378-08', 378, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'unitrader@outlook.it', '', '2017-07-12 12:47:48', 1, '2017-08-12', '', '0000-00-00'),
(253, 'BossFX170100379-49', 379, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'zaal1584@gmail.com', 'zaal1584@gmail.com', '2017-07-12 13:17:06', 1, '2017-08-12', '', '0000-00-00'),
(254, 'BossFX170100380-52', 380, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'benallal.kader@gmail.com', '', '2017-07-12 13:17:09', 1, '2017-08-12', '', '0000-00-00'),
(255, 'BossFX170100381-41', 381, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'benallal.kader@gmail.com', '', '2017-07-12 13:17:20', 1, '2017-08-12', '', '0000-00-00'),
(256, 'BossFX170100382-61', 382, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'missionaire24@aol.com', 'micaskybest@hotmail.com', '2017-07-12 13:19:12', 1, '2017-08-12', '', '0000-00-00'),
(257, 'BossFX170100383-63', 383, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'The.xavi.sh@gmail.com', '', '2017-07-12 13:20:38', 1, '2017-08-12', '', '0000-00-00'),
(258, 'BossFX170100384-97', 384, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'The.xavi.sh@gmail.com', '', '2017-07-12 13:22:42', 1, '2017-08-12', '', '0000-00-00'),
(259, 'BossFX170100385-32', 385, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'llopezr1@hotmail.com', '', '2017-07-12 13:36:03', 1, '2017-08-12', '', '0000-00-00'),
(260, 'BossFX170100386-25', 386, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'brunorubino21@gmail.com', '', '2017-07-12 13:41:53', 1, '2017-08-12', '', '0000-00-00'),
(261, 'BossFX170100387-93', 387, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'artin135706@gmail.com', 'artin135706@gmail.com', '2017-07-12 15:13:48', 1, '2017-08-12', '', '0000-00-00'),
(262, 'BossFX170100388-77', 388, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'artin135706@gmail.com', 'artin135706@gmail.com', '2017-07-12 15:17:26', 1, '2017-08-12', '', '0000-00-00'),
(263, 'BossFX170100389-96', 389, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'nickyhayden432@gmail.com', '', '2017-07-12 15:30:12', 1, '2017-08-12', '', '0000-00-00'),
(264, 'BossFX170100390-38', 390, 1, 1, '0.00', '0.00', '0.37', '0', 'USD', 'Free', 0, 'essahl.aziz@gmail.com', 'bricomyhouse@gmail.com', '2017-07-12 15:47:33', 1, '2017-08-12', '', '0000-00-00'),
(265, 'BossFX170100391-99', 391, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'sholababalola8@gmail.com', '', '2017-07-12 16:16:06', 1, '2017-08-12', '', '0000-00-00'),
(266, 'BossFX170100392-60', 392, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'sholababalola8@gmail.com', '', '2017-07-12 16:16:21', 1, '2017-08-12', '', '0000-00-00'),
(267, 'BossFX170100393-52', 393, 1, 1, '0.00', '0.00', '0.19', '0', 'USD', 'Free', 0, 'sholababalola8@gmail.com', '', '2017-07-12 16:16:34', 1, '2017-08-12', '', '0000-00-00'),
(268, 'BossFX170100394-66', 394, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'sholababalola8@gmail.com', '', '2017-07-12 16:16:45', 1, '2017-08-12', '', '0000-00-00'),
(269, 'BossFX170100395-10', 395, 1, 1, '0.00', '0.00', '0.57', '1', 'USD', 'Free', 0, 'sholababalola8@gmail.com', '', '2017-07-12 16:26:48', 1, '2017-08-12', '', '0000-00-00'),
(270, 'BossFX170300396-28', 396, 3, 3, '756.00', '0.00', '756.88', '1', 'USD', 'paypal', 0, 'mahendratradersfx@gmail.com', 'mahendratradersfx@gmail.com', '2017-07-12 22:43:48', 0, '2018-07-12', '', '0000-00-00'),
(271, 'BossFX170300397-71', 397, 3, 3, '756.00', '0.00', '756.85', '1', 'USD', 'paypal', 0, 'mahendratradersfx@gmail.com', 'mahendratradersfx@gmail.com', '2017-07-12 22:43:58', 0, '2018-07-12', '', '0000-00-00'),
(272, 'BossFX170100398-82', 398, 1, 1, '0.00', '0.00', '0.87', '1', 'USD', 'Free', 0, 'berjaya88travel@gmail.com', 'berjaya88travel@gmail.com', '2017-07-12 23:13:22', 1, '2017-08-12', '', '0000-00-00'),
(273, 'BossFX170100399-86', 399, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'sherly247@gmail.com', 'sherly247@gmail.com', '2017-07-13 01:51:41', 1, '2017-08-12', '', '0000-00-00'),
(274, 'BossFX170100400-24', 400, 1, 1, '0.00', '0.00', '0.99', '1', 'USD', 'Free', 0, 'cptas15@gmail.com', 'cptas15@gmail.com', '2017-07-13 03:09:04', 1, '2017-08-12', '', '0000-00-00'),
(275, 'BossFX170100401-22', 401, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'cptas15@gmail.com', 'cptas15@gmail.com', '2017-07-13 03:09:15', 1, '2017-08-12', '', '0000-00-00'),
(276, 'BossFX170100402-73', 402, 1, 1, '0.00', '0.00', '0.92', '1', 'USD', 'Free', 0, 'cptas15@gmail.com', 'cptas15@gmail.com', '2017-07-13 03:09:23', 1, '2017-08-12', '', '0000-00-00'),
(277, 'BossFX170100403-97', 403, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'cptas15@gmail.com', 'cptas15@gmail.com', '2017-07-13 03:09:32', 1, '2017-08-12', '', '0000-00-00'),
(278, 'BossFX170100404-34', 404, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'kivuruji@gmail.com', 'kivuruji@gmail.com', '2017-07-13 04:05:38', 1, '2017-08-12', '', '0000-00-00'),
(279, 'BossFX170100405-48', 405, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'juliwaty_gunawan@yahoo.com', '', '2017-07-13 05:25:49', 1, '2017-08-12', '', '0000-00-00'),
(280, 'BossFX170100406-29', 406, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'dmitryutkin198@gmail.com', 'dmitryutkin198@gmail.com', '2017-07-13 08:31:46', 1, '2017-08-12', '', '0000-00-00'),
(281, 'BossFX170100407-31', 407, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'hendrajayaprasetyo@yahoo.com', '', '2017-07-13 08:42:07', 1, '2017-08-12', '', '0000-00-00'),
(282, 'BossFX170100408-40', 408, 1, 1, '0.00', '0.00', '0.96', '1', 'USD', 'Free', 0, 'Mr_baksai@yahoo.com', '', '2017-07-13 09:15:20', 1, '2017-08-12', '', '0000-00-00'),
(283, 'BossFX170100409-42', 409, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'azizialias1687@gmail.com', '', '2017-07-13 09:24:09', 1, '2017-08-12', '', '0000-00-00'),
(284, 'BossFX170100410-06', 410, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'amri1127326@gmail.com', 'amri1127326@gmail.com', '2017-07-13 13:34:28', 1, '2017-08-13', '', '0000-00-00'),
(285, 'BossFX170100411-78', 411, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'joluwafemi2002@gmail.com', 'Julius.opaniran@gmail.com', '2017-07-13 15:08:17', 1, '2017-08-13', '', '0000-00-00'),
(286, 'BossFX170100412-54', 412, 1, 1, '0.00', '0.00', '0.73', '1', 'USD', 'Free', 0, 'tigawood@yahoo.com', '', '2017-07-13 22:12:06', 1, '2017-08-13', '', '0000-00-00'),
(287, 'BossFX170100413-91', 413, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'Levisonbarnes@gmail.com', '', '2017-07-14 03:41:57', 1, '2017-08-13', '', '0000-00-00'),
(288, 'BossFX170100414-70', 414, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'yumnitaeny@gmail.com', 'yumnitaeny@gmail.com', '2017-07-14 04:19:29', 1, '2017-08-13', '', '0000-00-00'),
(289, 'BossFX170100415-46', 415, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'thiwol57@gmail.com', '', '2017-07-14 04:22:08', 1, '2017-08-13', '', '0000-00-00'),
(290, 'BossFX170100416-15', 416, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'Faizaigold1@gmail.com', '', '2017-07-14 04:22:41', 1, '2017-08-13', '', '0000-00-00'),
(291, 'BossFX170100417-51', 417, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'gauravmehta58@gmail.com', '', '2017-07-14 05:09:12', 1, '2017-08-13', '', '0000-00-00'),
(292, 'BossFX170100418-57', 418, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'haikalhamdii@gmail.com', 'haikalhamdii@gmail.com', '2017-07-14 07:11:06', 1, '2017-08-13', '', '0000-00-00'),
(293, 'BossFX170100419-86', 419, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'mohdismail7070@gmail.com', '', '2017-07-14 07:53:27', 1, '2017-08-13', '', '0000-00-00'),
(294, 'BossFX170100420-76', 420, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'wilfreddomz@gmail.com', '', '2017-07-14 07:53:47', 1, '2017-08-13', '', '0000-00-00'),
(295, 'BossFX170100421-46', 421, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'rodowuona@gmail.com', '', '2017-07-14 07:55:36', 1, '2017-08-13', '', '0000-00-00'),
(296, 'BossFX170100422-09', 422, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'fransis.awing@gmail.com', '', '2017-07-14 07:56:56', 1, '2017-08-13', '', '0000-00-00'),
(297, 'BossFX170100423-64', 423, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'Akhtarshahnaz16@gmail.com', '', '2017-07-14 07:59:07', 1, '2017-08-13', '', '0000-00-00'),
(298, 'BossFX170100424-26', 424, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'Setiawanafx@gmail.com', 'Setiawanafx@gmail.com', '2017-07-14 08:02:18', 1, '2017-08-13', '', '0000-00-00'),
(299, 'BossFX170100425-96', 425, 1, 1, '0.00', '0.00', '0.19', '0', 'USD', 'Free', 0, 'Akhtarshahnaz16@gmail.com', '', '2017-07-14 08:03:34', 1, '2017-08-13', '', '0000-00-00'),
(300, 'BossFX170100426-83', 426, 1, 1, '0.00', '0.00', '0.29', '0', 'USD', 'Free', 0, 'fransis.awing@gmail.com', '', '2017-07-14 08:03:43', 1, '2017-08-13', '', '0000-00-00'),
(301, 'BossFX170100427-63', 427, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'Mlaith58@yahoo.com', 'Mlaith58@yahoo.com', '2017-07-14 08:21:37', 1, '2017-08-13', '', '0000-00-00'),
(302, 'BossFX170100428-36', 428, 1, 1, '0.00', '0.00', '0.33', '0', 'USD', 'Free', 0, 'Neale.fy@gmail.com', '', '2017-07-14 08:47:42', 1, '2017-08-13', '', '0000-00-00'),
(303, 'BossFX170100429-73', 429, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'innocentmosoeu@gmail.com', '', '2017-07-14 08:50:38', 1, '2017-08-13', '', '0000-00-00'),
(304, 'BossFX170100430-75', 430, 1, 1, '0.00', '0.00', '0.98', '1', 'USD', 'Free', 0, 'wansp06@yahoo.com', '', '2017-07-14 09:31:14', 1, '2017-08-13', '', '0000-00-00'),
(305, 'BossFX170100431-95', 431, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, '5428652@mail.ru', '', '2017-07-14 09:40:08', 1, '2017-08-13', '', '0000-00-00'),
(306, 'BossFX170100432-44', 432, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'atmaoholic@gmail.com', '', '2017-07-14 10:25:05', 1, '2017-08-13', '', '0000-00-00'),
(307, 'BossFX170100433-94', 433, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'Suryadih00@gmail.com', '', '2017-07-14 10:51:41', 1, '2017-08-13', '', '0000-00-00'),
(308, 'BossFX170100434-44', 434, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'syuib_81@yahoo.com', 'dag1291@yahoo.com', '2017-07-14 13:54:19', 1, '2017-08-14', '', '0000-00-00'),
(309, 'BossFX170100435-63', 435, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'amri1127326@gmail.com', 'amri1127326@gmail.com', '2017-07-14 14:58:35', 1, '2017-08-14', '', '0000-00-00'),
(310, 'BossFX170100436-49', 436, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'mcebozulu@yahoo.com', '', '2017-07-14 15:05:17', 1, '2017-08-14', '', '0000-00-00'),
(311, 'BossFX170100437-45', 437, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'mcebozulu@yahoo.com', '', '2017-07-14 15:05:27', 1, '2017-08-14', '', '0000-00-00'),
(312, 'BossFX170100438-82', 438, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'mcebozulu@yahoo.com', '', '2017-07-14 15:05:37', 1, '2017-08-14', '', '0000-00-00'),
(313, 'BossFX170100439-03', 439, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'mcebozulu@yahoo.com', '', '2017-07-14 15:05:49', 1, '2017-08-14', '', '0000-00-00'),
(314, 'BossFX170100440-99', 440, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'mcebozulu@yahoo.com', '', '2017-07-14 15:05:59', 1, '2017-08-14', '', '0000-00-00'),
(315, 'BossFX170100441-53', 441, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'danielmanu22@icloud.com', '', '2017-07-14 15:41:43', 1, '2017-08-14', '', '0000-00-00'),
(316, 'BossFX170100442-68', 442, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'martinruihz@gmail.com', '', '2017-07-14 16:13:51', 1, '2017-08-14', '', '0000-00-00'),
(317, 'BossFX170100443-88', 443, 1, 1, '0.00', '0.00', '0.19', '0', 'USD', 'Free', 0, 'postmiey85@gmail.com', '', '2017-07-14 19:38:35', 1, '2017-08-14', '', '0000-00-00'),
(318, 'BossFX170100444-40', 444, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'fransis.awing@gmail.com', '', '2017-07-14 22:19:49', 1, '2017-08-14', '', '0000-00-00'),
(319, 'BossFX170100445-22', 445, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'ibazufx87@gmail.com', 'ibazufx87@gmail.com', '2017-07-14 23:42:03', 1, '2017-08-14', '', '0000-00-00'),
(320, 'BossFX170100446-12', 446, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'aqlilapranaja384@gmail.com', '', '2017-07-15 03:39:33', 1, '2017-08-14', '', '0000-00-00'),
(321, 'BossFX170100447-18', 447, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'wedomendoza@gmail.com', '', '2017-07-15 03:45:23', 1, '2017-08-14', '', '0000-00-00'),
(322, 'BossFX170100448-81', 448, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'wedomendoza@gmail.com', '', '2017-07-15 04:06:13', 1, '2017-08-14', '', '0000-00-00'),
(323, 'BossFX170100449-20', 449, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'wedomendoza@gmail.com', '', '2017-07-15 04:07:43', 1, '2017-08-14', '', '0000-00-00'),
(324, 'BossFX170100450-49', 450, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'ronyfirmanto1@gmail.com', 'ronyfirmanto1@gmail.com', '2017-07-15 04:41:55', 1, '2017-08-14', '', '0000-00-00'),
(325, 'BossFX170100451-76', 451, 1, 1, '0.00', '0.00', '0.19', '0', 'USD', 'Free', 0, '1kwords.picture@gmail.com', '1kwords.picture@gmail.com', '2017-07-15 06:08:29', 1, '2017-08-14', '', '0000-00-00'),
(326, 'BossFX170100452-67', 452, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'khalid060102@gmail.com', 'khalid060102@gmail.com', '2017-07-15 06:49:19', 1, '2017-08-14', '', '0000-00-00'),
(327, 'BossFX170200453-47', 453, 2, 1, '49.00', '0.00', '49.52', '1', 'USD', 'paypal', 0, 'Marko.manasijevski@gmail.com', 'asd_fan@gmx.de', '2017-07-15 08:35:01', 0, '2017-08-14', '', '0000-00-00'),
(328, 'BossFX170200454-61', 454, 2, 1, '49.00', '0.00', '49.84', '1', 'USD', 'paypal', 0, 'Marko.manasijevski@gmail.com', 'asd_fan@gmx.de', '2017-07-15 08:35:13', 0, '2017-08-14', '', '0000-00-00'),
(329, 'BossFX170100455-50', 455, 1, 1, '0.00', '0.00', '0.70', '1', 'USD', 'Free', 0, 'nks5021@yahoo.com', 'nks5021@yahoo.com', '2017-07-15 09:07:53', 1, '2017-08-14', '', '0000-00-00'),
(330, 'BossFX170100456-78', 456, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'chufx2u@gmail.com', 'chufx2u@gmail.com', '2017-07-15 09:08:25', 1, '2017-08-14', '', '0000-00-00'),
(331, 'BossFX170100457-43', 457, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'drisser-raji@outlook.it', '', '2017-07-15 09:13:29', 1, '2017-08-14', '', '0000-00-00'),
(332, 'BossFX170100458-62', 458, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'premfxu@gmail.com', 'premfxu@gmail.com', '2017-07-15 09:56:57', 1, '2017-08-14', '', '0000-00-00'),
(333, 'BossFX170100459-13', 459, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'premfxu@gmail.com', 'premfxu@gmail.com', '2017-07-15 09:57:07', 1, '2017-08-14', '', '0000-00-00'),
(334, 'BossFX170100460-86', 460, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'muhdfaezml@gmail.com', 'muhdfaez.lutpi@allianz.com.my', '2017-07-15 13:37:11', 1, '2017-08-15', '', '0000-00-00'),
(335, 'BossFX170100461-19', 461, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 's552007@hotmail.com', '', '2017-07-15 23:50:24', 1, '2017-08-15', '', '0000-00-00'),
(336, 'BossFX170100462-70', 462, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'Txawjhli86@yahoo.com', 'Htkb68@yahoo.com', '2017-07-16 00:52:22', 1, '2017-08-15', '', '0000-00-00'),
(337, 'BossFX170100463-22', 463, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'norredzuan88@gmail.com', 'norredzuan88@gmail.com', '2017-07-16 01:29:20', 1, '2017-08-15', '', '0000-00-00'),
(338, 'BossFX170100464-93', 464, 1, 1, '0.00', '0.00', '0.98', '1', 'USD', 'Free', 0, 'abuajwarami@gmail.com', 'abuajwarami@gmail.com', '2017-07-16 01:45:33', 1, '2017-08-15', '', '0000-00-00'),
(339, 'BossFX170100465-43', 465, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'sugindran@gmail.com', 'sugindran@gmail.com', '2017-07-16 01:50:22', 1, '2017-08-15', '', '0000-00-00'),
(340, 'BossFX170100466-10', 466, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'Akhtarshahnaz16@gmail.com', '', '2017-07-16 01:54:37', 1, '2017-08-15', '', '0000-00-00'),
(341, 'BossFX170100467-01', 467, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'alanzhuang37@gmail.com', 'alanzhuang37@gmail.com', '2017-07-16 03:08:51', 1, '2017-08-15', '', '0000-00-00'),
(342, 'BossFX170100468-31', 468, 1, 1, '0.00', '0.00', '0.85', '1', 'USD', 'Free', 0, 'h3nny_1110@yahoo.com', '', '2017-07-16 03:46:08', 1, '2017-08-15', '', '0000-00-00'),
(343, 'BossFX170200469-50', 469, 2, 1, '651700.00', '0.00', '651749.00', '49', 'IDR', 'bank', 0, 'amri1127326@gmail.com', 'anri1127326@gmail.com', '2017-07-16 05:12:39', 0, '2017-08-15', '', '0000-00-00'),
(344, 'BossFX170200470-19', 470, 2, 1, '651700.00', '0.00', '651764.00', '64', 'IDR', 'bank', 0, 'amri1127326@gmail.com', 'amri1127326@gmail.com', '2017-07-16 05:14:48', 0, '2017-08-15', '', '0000-00-00'),
(345, 'BossFX170100471-69', 471, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'Mohd_jefri91@yahoo.com', 'Mohd_jefri91@yahoo.com', '2017-07-16 06:29:29', 1, '2017-08-15', '', '0000-00-00'),
(346, 'BossFX170100472-94', 472, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'Mohd_jefri91@yahoo.com', 'Mohd_jefri91@yahoo.com', '2017-07-16 06:29:42', 1, '2017-08-15', '', '0000-00-00');
INSERT INTO `payment_logs` (`ID`, `invoice_no`, `userid`, `idplan`, `idduration`, `amount`, `discount`, `amountsum`, `code_unique`, `currency_code`, `payment_channel`, `timestamp`, `email`, `email_paypal`, `deadline_pay`, `is_pay`, `exp_service`, `transfer_proof`, `date_pay`) VALUES
(347, 'BossFX170100473-65', 473, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, '0786643918x@gmail.com', '0786643918x@gmail.com', '2017-07-16 12:30:37', 1, '2017-08-16', '', '0000-00-00'),
(348, 'BossFX170100474-94', 474, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'fenyhandayani94@gmail.com', 'fenyhandayani94@gmail.com', '2017-07-16 15:23:02', 1, '2017-08-16', '', '0000-00-00'),
(349, 'BossFX170300475-48', 475, 3, 1, '98.00', '0.00', '98.82', '1', 'USD', 'paypal', 0, 'bbinvest@outlook.com', 'brenobrito@outlook.com', '2017-07-16 15:23:38', 0, '2017-08-16', '', '0000-00-00'),
(350, 'BossFX170100476-66', 476, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'a.20t@hotmail.com', '', '2017-07-16 16:57:07', 1, '2017-08-16', '', '0000-00-00'),
(351, 'BossFX170100477-91', 477, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'ahonxbengex@gmail.com', 'ahonxbengex@gmail.com', '2017-07-16 21:39:45', 1, '2017-08-16', '', '0000-00-00'),
(352, 'BossFX170100478-86', 478, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'ahonxbengex@gmail.com', 'ahonxbengex@gmail.com', '2017-07-16 21:40:16', 1, '2017-08-16', '', '0000-00-00'),
(353, 'BossFX170100479-76', 479, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'nazriyusoff15@gmail.com', 'nazriyusoff15@gmail.com', '2017-07-16 23:01:12', 1, '2017-08-16', '', '0000-00-00'),
(354, 'BossFX170100480-81', 480, 1, 1, '0.00', '0.00', '0.21', '0', 'USD', 'Free', 0, 'gsundaravel1985@gmail.com', 'gsundaravel1987@gmail.com', '2017-07-17 02:06:42', 1, '2017-08-16', '', '0000-00-00'),
(355, 'BossFX170100481-16', 481, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'sgillios.mahlaola@gmail.com', 'sgillios.mahlaola@gmail.com', '2017-07-17 02:06:49', 1, '2017-08-16', '', '0000-00-00'),
(356, 'BossFX170100482-95', 482, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'sgillios.mahlaola@gmail.com', 'sgillios.mahlaola@gmail.com', '2017-07-17 02:06:59', 1, '2017-08-16', '', '0000-00-00'),
(357, 'BossFX170100483-68', 483, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 'garry.grant1@gmail.com', 'garry.grant1@gmail.com', '2017-07-17 02:42:05', 1, '2017-08-16', '', '0000-00-00'),
(358, 'BossFX170100484-09', 484, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'heryirawan1207@gmail.com', 'heryirawan1207@gmail.com', '2017-07-17 03:34:27', 1, '2017-08-16', '', '0000-00-00'),
(359, 'BossFX170100485-30', 485, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'ismawijulaihi@yahoo.com', '', '2017-07-17 03:56:49', 1, '2017-08-16', '', '0000-00-00'),
(360, 'BossFX170100486-49', 486, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'sherazaslamfs@hotmail.com', '', '2017-07-17 04:04:32', 1, '2017-08-16', '', '0000-00-00'),
(361, 'BossFX170100487-07', 487, 1, 1, '0.00', '0.00', '0.89', '1', 'USD', 'Free', 0, 'd_trada@yahoo.in', '', '2017-07-17 04:20:45', 1, '2017-08-16', '', '0000-00-00'),
(362, 'BossFX170100488-50', 488, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'restacia1@yahoo.com', '', '2017-07-17 05:06:49', 1, '2017-08-16', '', '0000-00-00'),
(363, 'BossFX170100489-95', 489, 1, 1, '0.00', '0.00', '0.37', '0', 'USD', 'Free', 0, 'restacia1@yahoo.com', '', '2017-07-17 05:07:00', 1, '2017-08-16', '', '0000-00-00'),
(364, 'BossFX170100490-30', 490, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'restacia1@yahoo.com', '', '2017-07-17 05:07:10', 1, '2017-08-16', '', '0000-00-00'),
(365, 'BossFX170100491-11', 491, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'restacia1@yahoo.com', '', '2017-07-17 05:07:21', 1, '2017-08-16', '', '0000-00-00'),
(366, 'BossFX170100492-84', 492, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'restacia1@yahoo.com', '', '2017-07-17 05:07:32', 1, '2017-08-16', '', '0000-00-00'),
(367, 'BossFX170100493-51', 493, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'restacia1@yahoo.com', '', '2017-07-17 05:07:42', 1, '2017-08-16', '', '0000-00-00'),
(368, 'BossFX170100494-91', 494, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'restacia1@yahoo.com', '', '2017-07-17 05:07:52', 1, '2017-08-16', '', '0000-00-00'),
(369, 'BossFX170100495-10', 495, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'restacia1@yahoo.com', '', '2017-07-17 05:08:01', 1, '2017-08-16', '', '0000-00-00'),
(370, 'BossFX170100496-50', 496, 1, 1, '0.00', '0.00', '0.70', '1', 'USD', 'Free', 0, 'anverick05@msn.com', 'Anverick05@msn.com', '2017-07-17 06:05:02', 1, '2017-08-16', '', '0000-00-00'),
(371, 'BossFX170100497-24', 497, 1, 1, '0.00', '0.00', '0.99', '1', 'USD', 'Free', 0, 'anverick05@msn.com', 'Anverick05@msn.com', '2017-07-17 06:05:14', 1, '2017-08-16', '', '0000-00-00'),
(372, 'BossFX170100498-82', 498, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'afiez_boyz@yahoo.com.my', '', '2017-07-17 06:18:28', 1, '2017-08-16', '', '0000-00-00'),
(373, 'BossFX170100499-87', 499, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'thumky@gmail.com', 'thumky@gmail.com', '2017-07-17 06:28:57', 1, '2017-08-16', '', '0000-00-00'),
(374, 'BossFX170100500-26', 500, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'Elhenawycommerce@hotmail.com', '', '2017-07-17 09:03:55', 1, '2017-08-16', '', '0000-00-00'),
(375, 'BossFX170100501-75', 501, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'ahmoood_87@hotmail.com', '', '2017-07-17 09:17:51', 1, '2017-08-16', '', '0000-00-00'),
(376, 'BossFX170100502-85', 502, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'ahmoood_87@hotmail.com', '', '2017-07-17 09:18:00', 1, '2017-08-16', '', '0000-00-00'),
(377, 'BossFX170100503-28', 503, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'lanforest89@gmail.com', 'lanforest89@gmail.com', '2017-07-17 09:25:20', 1, '2017-08-16', '', '0000-00-00'),
(378, 'BossFX170100504-52', 504, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'faithjackson_d1@msn.com', 'faithcelestialmusicschool@Hotmail.com', '2017-07-17 10:20:11', 1, '2017-08-16', '', '0000-00-00'),
(379, 'BossFX170100505-30', 505, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'fatihturk9470@hotmail.com', '', '2017-07-17 11:45:35', 1, '2017-08-16', '', '0000-00-00'),
(380, 'BossFX170100506-96', 506, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'khairulyana79@yahoo.com', 'khairulyana79@yahoo.com', '2017-07-17 21:27:02', 1, '2017-08-17', '', '0000-00-00'),
(381, 'BossFX170100507-09', 507, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'owne144@gmail.com', '', '2017-07-17 22:39:18', 1, '2017-08-17', '', '0000-00-00'),
(382, 'BossFX170100508-51', 508, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'govindsundara1987@gmail.com', 'govindsundara1987@gmail.com', '2017-07-18 02:07:46', 1, '2017-08-17', '', '0000-00-00'),
(383, 'BossFX170100509-23', 509, 1, 1, '0.00', '0.00', '0.86', '1', 'USD', 'Free', 0, 'govindsundara1987@gmail.com', 'govindsundara1987@gmail.com', '2017-07-18 02:07:59', 1, '2017-08-17', '', '0000-00-00'),
(384, 'BossFX170400510-29', 510, 4, 3, '13300.00', '0.00', '13329.00', '29', 'IDR', 'bank', 0, 'gpbalamurugan26693@gmail.com', '', '2017-07-18 04:19:37', 0, '2018-07-17', '', '0000-00-00'),
(385, 'BossFX170100511-91', 511, 1, 1, '0.00', '0.00', '0.37', '0', 'USD', 'Free', 0, 'gpbalamurugan26693@gmail.com', '', '2017-07-18 04:22:43', 1, '2017-08-17', '', '0000-00-00'),
(386, 'BossFX170100512-19', 512, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'ajicole.suseno@gmail.com', '', '2017-07-18 04:41:32', 1, '2017-08-17', '', '0000-00-00'),
(387, 'BossFX170100513-83', 513, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'Arsala.toru@gmail.com', '', '2017-07-18 08:17:40', 1, '2017-08-17', '', '0000-00-00'),
(388, 'BossFX170100514-52', 514, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'wolf_sniper88@hotmail.com', 'wolf_sniper88@hotmail.com', '2017-07-18 09:35:33', 1, '2017-08-17', '', '0000-00-00'),
(389, 'BossFX170100515-15', 515, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'shoaib.ah.sy@gmail.com', '', '2017-07-18 09:50:24', 1, '2017-08-17', '', '0000-00-00'),
(390, 'BossFX170100516-52', 516, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'Malanimukesh28786@gmail.com', '', '2017-07-18 10:34:55', 1, '2017-08-17', '', '0000-00-00'),
(391, 'BossFX170100517-76', 517, 1, 1, '0.00', '0.00', '0.78', '1', 'USD', 'Free', 0, 'nimeshcoral@gmail.com', '', '2017-07-18 11:02:09', 1, '2017-08-17', '', '0000-00-00'),
(392, 'BossFX170100518-19', 518, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'fatinuolake@gmail.com', 'fatinuolake@gmail.com', '2017-07-18 12:11:56', 1, '2017-08-18', '', '0000-00-00'),
(393, 'BossFX170100519-97', 519, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'motaz_91@yahoo.com', 'motaz_91@yahoo.com', '2017-07-18 12:18:12', 1, '2017-08-18', '', '0000-00-00'),
(394, 'BossFX170100520-85', 520, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'Fida.mohammad.zaki@gmail.com', 'Fida.mohammad.zaki@gmail.com', '2017-07-18 15:59:19', 1, '2017-08-18', '', '0000-00-00'),
(395, 'BossFX170100521-95', 521, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'uthman295@gmail.com', 'uthman295@gmail.com', '2017-07-19 00:29:23', 1, '2017-08-18', '', '0000-00-00'),
(396, 'BossFX170100522-81', 522, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'polimetkoe@gmail.com', 'polimetkoe@gmail.com', '2017-07-19 04:18:16', 1, '2017-08-18', '', '0000-00-00'),
(397, 'BossFX170100523-09', 523, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'malomadm@gmail.com', 'malomadm@gmail.com', '2017-07-19 04:31:04', 1, '2017-08-18', '', '0000-00-00'),
(398, 'BossFX170100524-52', 524, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'Setiawanafx@gmail.com', 'Setiawanafx@gmail.com', '2017-07-19 04:55:08', 1, '2017-08-18', '', '0000-00-00'),
(399, 'BossFX170100525-36', 525, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'mohangunawardana91@gmail.com', 'mohangunawardana91@gmail.com', '2017-07-19 09:14:53', 1, '2017-08-18', '', '0000-00-00'),
(400, 'BossFX170400526-74', 526, 4, 1, '149.00', '0.00', '149.32', '0', 'USD', 'paypal', 0, 'Alireza.ex70@gmail.com', 'Alireza.ex70@gmail.com', '2017-07-19 09:34:30', 0, '2017-08-18', '', '0000-00-00'),
(401, 'BossFX170100527-76', 527, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'fsefoor@gmail.com', 'fsefoor@gmail.com', '2017-07-19 11:36:29', 1, '2017-08-18', '', '0000-00-00'),
(402, 'BossFX170100528-02', 528, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'fsefoor@gmail.com', 'fsefoor@gmail.com', '2017-07-19 11:36:44', 1, '2017-08-18', '', '0000-00-00'),
(403, 'BossFX170100529-85', 529, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'henryboyle@gmail.com', 'henry.boyle@live.co.uk', '2017-07-19 16:24:14', 1, '2017-08-19', '', '0000-00-00'),
(404, 'BossFX170100530-05', 530, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'angela.f5310@gmail.com', 'angela.f5310@gmail.com', '2017-07-19 18:52:44', 1, '2017-08-19', '', '0000-00-00'),
(405, 'BossFX170100531-10', 531, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'razatech@gmail.com', 'razatech@gmail.com', '2017-07-19 21:42:20', 1, '2017-08-19', '', '0000-00-00'),
(406, 'BossFX170100532-69', 532, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'afrian.junior26@gmail.com', 'afrian.junior26@gmail.com', '2017-07-19 22:49:41', 1, '2017-08-19', '', '0000-00-00'),
(407, 'BossFX170100533-22', 533, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 00:49:56', 1, '2017-08-19', '', '0000-00-00'),
(408, 'BossFX170100534-90', 534, 1, 1, '0.00', '0.00', '0.78', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 00:51:47', 1, '2017-08-19', '', '0000-00-00'),
(409, 'BossFX170100535-57', 535, 1, 1, '0.00', '0.00', '0.86', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:03:00', 1, '2017-08-19', '', '0000-00-00'),
(410, 'BossFX170100536-80', 536, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:06:59', 1, '2017-08-19', '', '0000-00-00'),
(411, 'BossFX170100537-92', 537, 1, 1, '0.00', '0.00', '0.26', '0', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:16:09', 1, '2017-08-19', '', '0000-00-00'),
(412, 'BossFX170100538-39', 538, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:16:24', 1, '2017-08-19', '', '0000-00-00'),
(413, 'BossFX170100539-63', 539, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:16:34', 1, '2017-08-19', '', '0000-00-00'),
(414, 'BossFX170100540-64', 540, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:22:09', 1, '2017-08-19', '', '0000-00-00'),
(415, 'BossFX170100541-16', 541, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:23:19', 1, '2017-08-19', '', '0000-00-00'),
(416, 'BossFX170100542-71', 542, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:29:15', 1, '2017-08-19', '', '0000-00-00'),
(417, 'BossFX170100543-81', 543, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:31:30', 1, '2017-08-19', '', '0000-00-00'),
(418, 'BossFX170100544-02', 544, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-20 01:35:45', 1, '2017-08-19', '', '0000-00-00'),
(419, 'BossFX170100545-57', 545, 1, 1, '0.00', '0.00', '0.55', '1', 'USD', 'Free', 0, 'enyalela@pmfs.co.za', 'enyalela@pmfs.co.za', '2017-07-20 10:18:15', 1, '2017-08-19', '', '0000-00-00'),
(420, 'BossFX170100546-85', 546, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'padimas15@gmail.com', '', '2017-07-20 10:48:18', 1, '2017-08-19', '', '0000-00-00'),
(421, 'BossFX170000547-59', 547, 0, 3, '0.00', '0.00', '27.00', '27', 'IDR', 'bank', 0, 'kamarul6660@gmail.com', 'kamarul6660@gmail.com', '2017-07-20 10:54:37', 0, '2018-07-19', '', '0000-00-00'),
(422, 'BossFX170100548-07', 548, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'malomadm@gmail.com', 'malomadm@gmail.com', '2017-07-20 16:03:43', 1, '2017-08-20', '', '0000-00-00'),
(423, 'BossFX170100549-69', 549, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'fermenar1970@gmail.com', 'info@alonsoaraujo.com', '2017-07-20 16:07:08', 1, '2017-08-20', '', '0000-00-00'),
(424, 'BossFX170100550-32', 550, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'rizwanulrahman@gmail.com', 'i9786999978@gmail.com', '2017-07-21 05:03:21', 1, '2017-08-20', '', '0000-00-00'),
(425, 'BossFX170100551-69', 551, 1, 1, '0.00', '0.00', '0.75', '1', 'USD', 'Free', 0, 'rtrianto3@gmail.com', 'r083rt110477@gmail.com', '2017-07-21 09:22:55', 1, '2017-08-20', '', '0000-00-00'),
(426, 'BossFX170100552-13', 552, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'alireza.ex70@gmail.com', 'alireza.ex70@gmail.com', '2017-07-21 09:29:27', 1, '2017-08-20', '', '0000-00-00'),
(427, 'BossFX170100553-89', 553, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'baharin71.fxu@gmail.com', '', '2017-07-21 11:18:14', 1, '2017-08-20', '', '0000-00-00'),
(428, 'BossFX170100554-02', 554, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'ardi@engineer.com', 'ardi@engineer.com', '2017-07-21 12:18:27', 1, '2017-08-21', '', '0000-00-00'),
(429, 'BossFX170100555-44', 555, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'mohdzaibidi@gmail.com', '', '2017-07-21 12:21:31', 1, '2017-08-21', '', '0000-00-00'),
(430, 'BossFX170100556-83', 556, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'mdproject77@gmail.com', '', '2017-07-21 13:48:19', 1, '2017-08-21', '', '0000-00-00'),
(431, 'BossFX170100557-54', 557, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'Hishamfahim557@yahoo.com', 'Hishamfahim557@yahoo.com', '2017-07-21 14:30:54', 1, '2017-08-21', '', '0000-00-00'),
(432, 'BossFX170100558-81', 558, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'txawjhli86@yahoo.com', '', '2017-07-21 21:54:02', 1, '2017-08-21', '', '0000-00-00'),
(433, 'BossFX170100559-04', 559, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'restusongko@gmail.com', '', '2017-07-21 23:56:32', 1, '2017-08-21', '', '0000-00-00'),
(434, 'BossFX170100560-79', 560, 1, 1, '0.00', '0.00', '0.61', '1', 'USD', 'Free', 0, 'Bladiator_appxx@hotmail.com', '', '2017-07-22 03:48:56', 1, '2017-08-21', '', '0000-00-00'),
(435, 'BossFX170100561-73', 561, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'achmadmaghfur@gmail.com', '', '2017-07-22 06:47:19', 1, '2017-08-21', '', '0000-00-00'),
(436, 'BossFX170100562-33', 562, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'Asakefemi@gmail.com', 'Asakefemi@gmail.com', '2017-07-22 12:13:31', 1, '2017-08-22', '', '0000-00-00'),
(437, 'BossFX170100563-01', 563, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'danakinstunde@yahoo.com', 'danakinstunde@yahoo.com', '2017-07-22 12:34:51', 1, '2017-08-22', '', '0000-00-00'),
(438, 'BossFX170100564-94', 564, 1, 1, '0.00', '0.00', '0.70', '1', 'USD', 'Free', 0, 'danakinstunde@yahoo.com', 'danakinstunde@yahoo.com', '2017-07-22 12:37:56', 1, '2017-08-22', '', '0000-00-00'),
(439, 'BossFX170100565-17', 565, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'Yclow_1995@hotmail.com', 'Yclow_1995@hotmail.com', '2017-07-23 06:39:32', 1, '2017-08-22', '', '0000-00-00'),
(440, 'BossFX170400566-61', 566, 4, 1, '149.00', '0.00', '149.63', '1', 'USD', 'paypal', 0, 'twanna.tiller@gmail.com', 'twanna.tiller@gmail.com', '2017-07-23 09:52:32', 0, '2017-08-22', '', '0000-00-00'),
(441, 'BossFX170100567-88', 567, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'Hamedhamidi5463@gmail.com', '', '2017-07-24 02:12:24', 1, '2017-08-23', '', '0000-00-00'),
(442, 'BossFX170100568-72', 568, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'kadirfx6@gmail.com', 'kadirfx11@gmail.com', '2017-07-24 02:29:33', 1, '2017-08-23', '', '0000-00-00'),
(443, 'BossFX170100569-04', 569, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 03:55:59', 1, '2017-08-23', '', '0000-00-00'),
(444, 'BossFX170200570-77', 570, 2, 1, '651700.00', '0.00', '651768.00', '68', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 03:56:56', 0, '2017-08-23', '', '0000-00-00'),
(445, 'BossFX170100571-01', 571, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'odilon_camacho@hotmail.com', 'odilon_camacho@hotmail.com', '2017-07-24 09:46:13', 1, '2017-08-23', '', '0000-00-00'),
(446, 'BossFX170100572-81', 572, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'mowaidah0963@gmail.com', 'mowaidah0963@gmail.com', '2017-07-24 10:00:40', 1, '2017-08-23', '', '0000-00-00'),
(447, 'BossFX170400573-16', 573, 4, 1, '1981700.00', '0.00', '1981793.00', '93', 'IDR', 'bank', 0, 'yunikeee1dbox@gmail.com', 'yunikeee1dbox@gmail.com', '2017-07-24 12:41:41', 0, '2017-08-24', '', '0000-00-00'),
(448, 'BossFX170100574-47', 574, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'fikryn@gmail.com', 'fikryn@gmail.com', '2017-07-24 14:44:08', 1, '2017-08-24', '', '0000-00-00'),
(449, 'BossFX170200575-38', 575, 2, 1, '651700.00', '10.00', '651749.00', '59', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:08:36', 0, '2017-08-24', '', '0000-00-00'),
(450, 'BossFX170200576-52', 576, 2, 1, '651700.00', '10.00', '651769.00', '79', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:11:49', 0, '2017-08-24', '', '0000-00-00'),
(451, 'BossFX170200577-41', 577, 2, 1, '651700.00', '65170.00', '586614.00', '84', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:13:16', 0, '2017-08-24', '', '0000-00-00'),
(452, 'BossFX170200578-77', 578, 2, 1, '651700.00', '65170.00', '586548.00', '18', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:15:30', 0, '2017-08-24', '', '0000-00-00'),
(453, 'BossFX170200579-11', 579, 2, 1, '651700.00', '65170.00', '586624.00', '94', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:16:31', 0, '2017-08-24', '', '0000-00-00'),
(454, 'BossFX170200580-31', 580, 2, 1, '651700.00', '65170.00', '586571.00', '41', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:19:23', 0, '2017-08-24', '', '0000-00-00'),
(455, 'BossFX170200581-77', 581, 2, 1, '651700.00', '65170.00', '586621.00', '91', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:25:57', 0, '2017-08-24', '', '0000-00-00'),
(456, 'BossFX170200582-60', 582, 2, 1, '651700.00', '65170.00', '586610.00', '80', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:27:43', 0, '2017-08-24', '', '0000-00-00'),
(457, 'BossFX170200583-09', 583, 2, 1, '651700.00', '65170.00', '586567.00', '37', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:29:45', 0, '2017-08-24', '', '0000-00-00'),
(458, 'BossFX170200584-77', 584, 2, 1, '651700.00', '65170.00', '586551.00', '21', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:31:31', 0, '2017-08-24', '', '0000-00-00'),
(459, 'BossFX170200585-25', 585, 2, 1, '651700.00', '65170.00', '586542.00', '12', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-24 21:38:25', 0, '2017-08-24', '', '0000-00-00'),
(460, 'BossFX170400586-23', 586, 4, 1, '1981700.00', '0.00', '1981730.00', '30', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 00:42:56', 0, '2017-08-24', '', '0000-00-00'),
(461, 'BossFX170400587-36', 587, 4, 1, '1981700.00', '1330000.00', '651735.00', '35', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 00:44:49', 0, '2017-08-24', '', '0000-00-00'),
(462, 'BossFX170400588-38', 588, 4, 2, '4748100.00', '1330000.00', '3418130.00', '30', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 00:52:21', 0, '2017-10-24', '', '0000-00-00'),
(463, 'BossFX170400589-04', 589, 4, 1, '1981700.00', '332500.00', '1649259.00', '59', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 01:02:39', 0, '2017-08-24', '', '0000-00-00'),
(464, 'BossFX170400590-33', 590, 4, 1, '1981700.00', '0.00', '1981732.00', '32', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 01:04:21', 0, '1970-02-01', '', '0000-00-00'),
(465, 'BossFX170400591-64', 591, 4, 1, '1981700.00', '0.00', '1981716.00', '16', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 01:05:58', 0, '2017-08-24', '', '0000-00-00'),
(466, 'BossFX170400592-15', 592, 4, 1, '1981700.00', '0.00', '1981764.00', '64', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 01:07:27', 0, '2017-08-24', '', '0000-00-00'),
(467, 'BossFX170400593-76', 593, 4, 1, '1981700.00', '0.00', '1981749.00', '49', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 01:08:19', 0, '2017-08-24', '', '0000-00-00'),
(468, 'BossFX170400594-72', 594, 4, 1, '1981700.00', '0.00', '1981786.00', '86', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 01:09:49', 0, '2017-08-24', '', '0000-00-00'),
(469, 'BossFX170400600-99', 600, 4, 1, '1981700.00', '0.00', '1981776.00', '76', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 01:18:54', 0, '2017-08-24', '', '0000-00-00'),
(470, 'BossFX170400601-77', 601, 4, 1, '1981700.00', '1330000.00', '651783.00', '83', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 01:20:04', 0, '2017-08-24', '', '0000-00-00'),
(471, 'BossFX170400602-64', 602, 4, 1, '1981700.00', '0.00', '1981786.00', '86', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-25 01:21:19', 0, '2017-08-24', '', '0000-00-00'),
(472, 'BossFX170400603-03', 603, 4, 1, '149.00', '0.00', '149.10', '0', 'USD', 'paypal', 0, 'mahendratradersfx@gmail.com', 'mahendratradersfx@gmail.com', '2017-07-25 04:26:32', 0, '2017-08-24', '', '0000-00-00'),
(473, 'BossFX170100604-81', 604, 1, 1, '0.00', '0.00', '0.24', '0', 'USD', 'Free', 0, 'Noldypinontoan@gmail.com', 'Noldypinontoan@gmail.com', '2017-07-25 06:27:35', 1, '2017-08-24', '', '0000-00-00'),
(474, 'BossFX170100605-41', 605, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'Arieszona1282@gmail.com', 'Arieszona1282@gmail.com', '2017-07-25 13:09:34', 1, '2017-08-25', '', '0000-00-00'),
(475, 'BossFX170100606-36', 606, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 'Randywirawan711@gmail.com', 'Randywirawan711@gmail.com', '2017-07-25 21:20:35', 1, '2017-08-25', '', '0000-00-00'),
(476, 'BossFX170100607-57', 607, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'objemmanuel1997@gmail.com', 'objemmanuel1997@gmail.com', '2017-07-26 02:07:24', 1, '2017-08-25', '', '0000-00-00'),
(477, 'BossFX170100608-19', 608, 1, 1, '0.00', '0.00', '0.94', '1', 'USD', 'Free', 0, 'qoidnahlan3@gmail.com', 'qoidnahlan3@gmail.com', '2017-07-26 02:47:43', 1, '2017-08-25', '', '0000-00-00'),
(478, 'BossFX170100609-53', 609, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'em.zavier@gmail.com', 'em.zavier@gmail.com', '2017-07-26 08:56:43', 1, '2017-08-25', '', '0000-00-00'),
(479, 'BossFX170100610-31', 610, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'arifcabyta77@gmail.com', 'Arifcabyta@gmail.com', '2017-07-26 11:27:48', 1, '2017-08-25', '', '0000-00-00'),
(480, 'BossFX170100611-96', 611, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'a_kill@ymail.com', 'onekills@gmail.com', '2017-07-26 11:52:06', 1, '2017-08-25', '', '0000-00-00'),
(481, 'BossFX170100612-66', 612, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'Fadhil.Morshidi2676@gmail.com', 'Fadhil.Morshidi2676@gmail.com', '2017-07-26 18:11:30', 1, '2017-08-26', '', '0000-00-00'),
(482, 'BossFX170100613-09', 613, 1, 1, '0.00', '0.00', '0.92', '1', 'USD', 'Free', 0, 'adikawang@gmail.com', 'adikawang@gmail.com', '2017-07-26 23:47:39', 1, '2017-08-26', '', '0000-00-00'),
(483, 'BossFX170100614-89', 614, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'thapeloleshabane@gmail.com', 'thapeloleshabane@gmail.com', '2017-07-27 01:10:25', 1, '2017-08-26', '', '0000-00-00'),
(484, 'BossFX170100615-82', 615, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'Vibi83hrha@gmail.com', 'Vibi83hrha@gmail.com', '2017-07-27 01:22:28', 1, '2017-08-26', '', '0000-00-00'),
(485, 'BossFX170100616-18', 616, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'sha1109@live.com', 'sha1109@live.com', '2017-07-27 01:36:43', 1, '2017-08-26', '', '0000-00-00'),
(486, 'BossFX170100617-49', 617, 1, 1, '0.00', '0.00', '0.96', '1', 'USD', 'Free', 0, 'Shuvaroy2012@gmail.com', 'Roy.shuva@yahoo.in', '2017-07-27 01:49:58', 1, '2017-08-26', '', '0000-00-00'),
(487, 'BossFX170100618-94', 618, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'Jumainah_j@yahoo.com.my', 'jumainah_j@yahoo.com', '2017-07-27 04:41:49', 1, '2017-08-26', '', '0000-00-00'),
(488, 'BossFX170100619-55', 619, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'berjaya21@gmail.com', 'berjaya21@gmail.com', '2017-07-27 06:32:46', 1, '2017-08-26', '', '0000-00-00'),
(489, 'BossFX170100620-18', 620, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'rfvince@t-online.de', 'Ferdies60@gmail.com', '2017-07-27 06:41:00', 1, '2017-08-26', '', '0000-00-00'),
(490, 'BossFX170100621-61', 621, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'hafiznorizal@gmail.com', 'hafiznorizal@gmail.com', '2017-07-27 08:38:34', 1, '2017-08-26', '', '0000-00-00'),
(491, 'BossFX170100622-06', 622, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'babut_taqwa@yahoo.com', 'babut_taqwa@yahoo.com', '2017-07-27 22:28:47', 1, '2017-08-27', '', '0000-00-00'),
(492, 'BossFX170100623-67', 623, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'muzzu136@gmail.com', 'fxforex136@gmail.com', '2017-07-27 22:33:36', 1, '2017-08-27', '', '0000-00-00'),
(493, 'BossFX170100624-43', 624, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'ericsitho@gmail.com', 'ericsitho@gmail.com', '2017-07-27 22:41:02', 1, '2017-08-27', '', '0000-00-00'),
(494, 'BossFX170100625-05', 625, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'kjoody@gmail.com', 'kjoody@gmail.com', '2017-07-27 22:49:14', 1, '2017-08-27', '', '0000-00-00'),
(495, 'BossFX170100626-27', 626, 1, 1, '0.00', '0.00', '0.94', '1', 'USD', 'Free', 0, 'adikawang@gmail.com', 'adikawang@gmail.com', '2017-07-28 00:49:08', 1, '2017-08-27', '', '0000-00-00'),
(496, 'BossFX170100627-92', 627, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'Jiteshrohira@yahoo.com', 'Jiteshrohira@yahoo.com', '2017-07-28 01:06:53', 1, '2017-08-27', '', '0000-00-00'),
(497, 'BossFX170100628-23', 628, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'Seahawks20632@gmail.com', 'Carllee56@gmail.com', '2017-07-28 02:23:14', 1, '2017-08-27', '', '0000-00-00'),
(498, 'BossFX170100629-85', 629, 1, 1, '0.00', '0.00', '0.86', '1', 'USD', 'Free', 0, 'bravolajyde@yahoo.com', 'bravolajyde@yahoo.com', '2017-07-28 12:10:17', 1, '2017-08-28', '', '0000-00-00'),
(499, 'BossFX170100630-13', 630, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'mustaphakermad@gmail.com', 'mustaphakermad@gmail.com', '2017-07-28 20:20:57', 1, '2017-08-28', '', '0000-00-00'),
(500, 'BossFX170100631-10', 631, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'juancamume@hotmail.com', 'juancamume@hotmail.com', '2017-07-28 21:15:12', 1, '2017-08-28', '', '0000-00-00'),
(501, 'BossFX170100632-55', 632, 1, 1, '0.00', '0.00', '0.99', '1', 'USD', 'Free', 0, 'wahyu.jatmiko1708@gmail.com', 'wahyu.jatmiko1708@gmail.com', '2017-07-28 21:32:38', 1, '2017-08-28', '', '0000-00-00'),
(502, 'BossFX170400633-14', 633, 4, 1, '1981700.00', '1330000.00', '651771.00', '71', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-28 21:59:02', 0, '2017-08-28', '', '0000-00-00'),
(503, 'BossFX170400634-08', 634, 4, 1, '1981700.00', '665000.00', '1316742.00', '42', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-28 22:01:37', 0, '2017-08-28', '', '0000-00-00'),
(504, 'BossFX170100635-71', 635, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'cr3zp0139@gmail.com', 'cr3zp0139@gmail.com', '2017-07-28 22:09:04', 1, '2017-08-28', '', '0000-00-00'),
(505, 'BossFX170100636-13', 636, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'Ardiman-hs@live.com', 'Ardiman-hs@live.com', '2017-07-28 22:21:46', 1, '2017-08-28', '', '0000-00-00'),
(506, 'BossFX170100637-52', 637, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'mustaphakermad@gmail.com', 'mustaphakermad@gmail.com', '2017-07-28 22:22:39', 1, '2017-08-28', '', '0000-00-00'),
(507, 'BossFX170100638-35', 638, 1, 1, '0.00', '0.00', '0.90', '1', 'USD', 'Free', 0, 'Ardiman-hs@live.com', 'Ardiman-hs@live.com', '2017-07-28 22:24:18', 1, '2017-08-28', '', '0000-00-00'),
(508, 'BossFX170400639-19', 639, 4, 1, '149.00', '50.00', '99.64', '1', 'USD', 'paypal', 0, 'mahendrtadersfx@gmail.com', 'mahendratradersfx@gmail.com', '2017-07-28 22:53:40', 0, '2017-08-28', '', '0000-00-00'),
(509, 'BossFX170400640-52', 640, 4, 1, '1981700.00', '665000.00', '1316771.00', '71', 'IDR', 'bank', 0, 'bossfxsignal@gmail.com', 'mahendratradersFx@gmail.com', '2017-07-28 23:10:23', 0, '2017-08-28', '', '0000-00-00'),
(510, 'BossFX170100641-25', 641, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'mdianasari@gmail.com', 'miadianasari@yahoo.com.au', '2017-07-28 23:14:45', 1, '2017-08-28', '', '0000-00-00'),
(511, 'BossFX170400642-78', 642, 4, 1, '1981700.00', '0.00', '1981798.00', '98', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-28 23:38:42', 0, '2017-08-28', '', '0000-00-00'),
(512, 'BossFX170100643-20', 643, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'brutrader173@gmail.com', 'Enter your email paypal', '2017-07-29 00:00:29', 1, '2017-08-28', '', '0000-00-00'),
(513, 'BossFX170100644-38', 644, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'kishoreksan@gmail.com', 'kishoreksan@gmail.com', '2017-07-29 00:00:42', 1, '2017-08-28', '', '0000-00-00'),
(514, 'BossFX170100645-61', 645, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'zakiyuddin1996@gmail.com', 'zakiyuddin1996@gmail.com', '2017-07-29 00:07:03', 1, '2017-08-28', '', '0000-00-00'),
(515, 'BossFX170100646-83', 646, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'fiqry1798@gmail.com', 'fiqry1798@gmail.com', '2017-07-29 00:07:07', 1, '2017-08-28', '', '0000-00-00'),
(516, 'BossFX170100647-93', 647, 1, 1, '0.00', '0.00', '0.57', '1', 'USD', 'Free', 0, 'zekhafizi@gmail.com', 'zekhafizi@gmail.com', '2017-07-29 00:22:33', 1, '2017-08-28', '', '0000-00-00'),
(517, 'BossFX170100648-97', 648, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'ianskatter@gmail.com', 'ianskatter@gmail.com', '2017-07-29 00:46:38', 1, '2017-08-28', '', '0000-00-00'),
(518, 'BossFX170100649-39', 649, 1, 1, '0.00', '0.00', '0.73', '1', 'USD', 'Free', 0, 'azman.gading@gmail.com', 'azman.gading@gmail.com', '2017-07-29 02:29:16', 1, '2017-08-28', '', '0000-00-00'),
(519, 'BossFX170100650-73', 650, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'azman.gading@gmail.com', 'azman.gading@gmail.com', '2017-07-29 02:32:30', 1, '2017-08-28', '', '0000-00-00'),
(520, 'BossFX170100651-43', 651, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'Brianmajoni28@outlook.com', 'Brianmajoni28@outlook.com', '2017-07-29 04:04:28', 1, '2017-08-28', '', '0000-00-00'),
(521, 'BossFX170100652-43', 652, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'apaibest84@gmail.com', '', '2017-07-29 04:14:08', 1, '2017-08-28', '', '0000-00-00'),
(522, 'BossFX170400653-00', 653, 4, 1, '149.00', '0.00', '149.38', '0', 'USD', 'paypal', 0, 'rianovs@gmail.com', 'rianovs@gmail.com', '2017-07-29 04:25:24', 0, '2017-08-28', '', '0000-00-00'),
(523, 'BossFX170400654-66', 654, 4, 1, '149.00', '0.00', '149.27', '0', 'USD', 'paypal', 0, 'rianovs@gmail.com', 'rianovs@gmail.com', '2017-07-29 04:30:59', 0, '2017-08-28', '', '0000-00-00'),
(524, 'BossFX170200655-48', 655, 2, 1, '651700.00', '0.00', '651761.00', '61', 'IDR', 'bank', 0, 'Zaini_boustead@yahoo.com', '', '2017-07-29 04:33:03', 0, '2017-08-28', '', '0000-00-00'),
(525, 'BossFX170400656-55', 656, 4, 1, '1981700.00', '1330000.00', '651737.00', '37', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:02:07', 0, '2017-08-28', '', '0000-00-00'),
(526, 'BossFX170400657-62', 657, 4, 1, '1981700.00', '665000.00', '1316777.00', '77', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:03:33', 0, '2017-08-28', '', '0000-00-00'),
(527, 'BossFX170300658-31', 658, 3, 1, '1303400.00', '0.00', '1303454.00', '54', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:04:13', 0, '2017-08-28', '', '0000-00-00'),
(528, 'BossFX170400659-22', 659, 4, 1, '149.00', '0.00', '149.75', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:04:50', 0, '2017-08-28', '', '0000-00-00'),
(529, 'BossFX170400662-79', 662, 4, 1, '149.00', '0.00', '149.70', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:13:28', 0, '2017-08-28', '', '0000-00-00'),
(530, 'BossFX170400663-99', 663, 4, 1, '149.00', '0.00', '149.82', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:19:34', 0, '2017-08-28', '', '0000-00-00'),
(531, 'BossFX170400664-56', 664, 4, 1, '149.00', '100.00', '49.77', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:24:52', 0, '2017-08-28', '', '0000-00-00'),
(532, 'BossFX170400665-54', 665, 4, 1, '1981700.00', '1330000.00', '651779.00', '79', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:30:49', 0, '2017-08-28', '', '0000-00-00'),
(533, 'BossFX170400666-77', 666, 4, 1, '149.00', '0.00', '149.49', '0', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:31:29', 0, '2017-08-28', '', '0000-00-00'),
(534, 'BossFX170400667-87', 667, 4, 1, '149.00', '100.00', '49.83', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:32:42', 0, '2017-08-28', '', '0000-00-00'),
(535, 'BossFX170400668-22', 668, 4, 1, '149.00', '100.00', '49.99', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:37:24', 0, '2017-08-28', '', '0000-00-00'),
(536, 'BossFX170400669-21', 669, 4, 1, '1981700.00', '1330000.00', '651745.00', '45', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:41:04', 0, '2017-08-28', '', '0000-00-00'),
(537, 'BossFX170400670-98', 670, 4, 1, '1981700.00', '1330000.00', '651753.00', '53', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:42:05', 0, '2017-08-28', '', '0000-00-00'),
(538, 'BossFX170400671-61', 671, 4, 1, '149.00', '100.00', '49.79', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:44:49', 0, '2017-08-28', '', '0000-00-00'),
(539, 'BossFX170400672-02', 672, 4, 1, '1981700.00', '1330000.00', '651768.00', '68', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:46:30', 0, '2017-08-28', '', '0000-00-00'),
(540, 'BossFX170400673-80', 673, 4, 1, '1981700.00', '1330000.00', '651780.00', '80', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:47:47', 0, '2017-08-28', '', '0000-00-00'),
(541, 'BossFX170400674-03', 674, 4, 1, '1981700.00', '1330000.00', '651769.00', '69', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:50:28', 0, '2017-08-28', '', '0000-00-00'),
(542, 'BossFX170400675-71', 675, 4, 1, '1981700.00', '1330000.00', '651748.00', '48', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:53:19', 0, '2017-08-28', '', '0000-00-00'),
(543, 'BossFX170400676-34', 676, 4, 1, '1981700.00', '1330000.00', '651738.00', '38', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:54:26', 0, '2017-08-28', '', '0000-00-00'),
(544, 'BossFX170400677-55', 677, 4, 1, '149.00', '100.00', '49.50', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 05:55:59', 0, '2017-08-28', '', '0000-00-00'),
(545, 'BossFX170400678-64', 678, 4, 1, '149.00', '100.00', '49.10', '0', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 06:00:48', 0, '2017-08-28', '', '0000-00-00'),
(546, 'BossFX170100679-02', 679, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'bmwnews@gmail.com', 'bmwnews@gmail.com', '2017-07-29 07:56:12', 1, '2017-08-28', '', '0000-00-00'),
(547, 'BossFX170100680-69', 680, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'sangeetamahabier@gmail.com', 'sangeetamahabier@gmail.com', '2017-07-29 07:57:27', 1, '2017-08-28', '', '0000-00-00'),
(548, 'BossFX170100681-29', 681, 1, 1, '0.00', '0.00', '0.21', '0', 'USD', 'Free', 0, 'rtrianto3@gmail.com', 'rtrianto3@gmail.com', '2017-07-29 08:13:46', 1, '2017-08-28', '', '0000-00-00'),
(549, 'BossFX170100682-50', 682, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'Khamismakinda@gmail.com', 'Khamismakinda@gmail.com', '2017-07-29 08:19:03', 1, '2017-08-28', '', '0000-00-00'),
(550, 'BossFX170400683-72', 683, 4, 1, '1981700.00', '1330000.00', '651791.00', '91', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 08:38:39', 0, '2017-08-28', '', '0000-00-00'),
(551, 'BossFX170400684-84', 684, 4, 1, '149.00', '100.00', '49.97', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 08:41:31', 0, '2017-08-28', '', '0000-00-00'),
(552, 'BossFX170400685-14', 685, 4, 1, '1981700.00', '1330000.00', '651730.00', '30', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 08:44:14', 0, '2017-08-28', '', '0000-00-00'),
(553, 'BossFX170400686-70', 686, 4, 1, '149.00', '100.00', '49.50', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-29 08:45:31', 0, '2017-08-28', '', '0000-00-00'),
(554, 'BossFX170100687-77', 687, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'the30640@gmail.com', '', '2017-07-29 09:09:24', 1, '2017-08-28', '', '0000-00-00'),
(555, 'BossFX170100688-31', 688, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'juniorvass@gmail.com', 'juniorvass@gmail.com', '2017-07-29 11:39:15', 1, '2017-08-28', '', '0000-00-00'),
(556, 'BossFX170100689-47', 689, 1, 1, '0.00', '0.00', '0.99', '1', 'USD', 'Free', 0, 'eropradeep12@gmail.com', '', '2017-07-29 11:49:01', 1, '2017-08-28', '', '0000-00-00'),
(557, 'BossFX170100690-42', 690, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'amirkhodavirdi@hotmail.com', 'amirkhodavirdi@hotmail.com', '2017-07-29 11:57:07', 1, '2017-08-28', '', '0000-00-00'),
(558, 'BossFX170100691-15', 691, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'anoorg@gmail.com', '', '2017-07-29 14:22:48', 1, '2017-08-29', '', '0000-00-00'),
(559, 'BossFX170400692-32', 692, 4, 1, '149.00', '100.00', '49.10', '0', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-30 03:29:51', 0, '2017-08-29', '', '0000-00-00'),
(560, 'BossFX170400693-28', 693, 4, 1, '1981700.00', '1330000.00', '651732.00', '32', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-30 03:34:27', 0, '2017-08-29', '', '0000-00-00'),
(561, 'BossFX170400694-50', 694, 4, 1, '149.00', '100.00', '49.89', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-07-30 03:35:52', 0, '2017-08-29', '', '0000-00-00'),
(562, 'BossFX170100695-70', 695, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'Saputra_sstuck@yahoo.com', '', '2017-07-30 05:31:01', 1, '2017-08-29', '', '0000-00-00'),
(563, 'BossFX170100696-96', 696, 1, 1, '0.00', '0.00', '0.29', '0', 'USD', 'Free', 0, 'agung_wei@live.com', '', '2017-07-30 05:31:31', 1, '2017-08-29', '', '0000-00-00'),
(564, 'BossFX170100697-44', 697, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'mieymat08@gmail.com', '', '2017-07-30 05:48:01', 1, '2017-08-29', '', '0000-00-00'),
(565, 'BossFX170100698-72', 698, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'vsw999@yahoo.com', '', '2017-07-30 05:50:47', 1, '2017-08-29', '', '0000-00-00'),
(566, 'BossFX170100699-50', 699, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'fikpka@gmail.com', 'fikpka@gmail.com', '2017-07-30 06:17:21', 1, '2017-08-29', '', '0000-00-00'),
(567, 'BossFX170100700-96', 700, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'forexperts007@gmail.com', '', '2017-07-30 06:30:07', 1, '2017-08-29', '', '0000-00-00'),
(568, 'BossFX170100701-28', 701, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'hklikeminds@gmail.com', 'hklikeminds@yahoo.com', '2017-07-30 06:43:02', 1, '2017-08-29', '', '0000-00-00'),
(569, 'BossFX170100702-10', 702, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'anverick05@msn.com', 'Anverick05@msn.com', '2017-07-30 06:56:57', 1, '2017-08-29', '', '0000-00-00'),
(570, 'BossFX170100703-48', 703, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'thulacute35@gmail.com', '', '2017-07-30 07:03:50', 1, '2017-08-29', '', '0000-00-00'),
(571, 'BossFX170100704-67', 704, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'zulkifliawang27@yahoo.com', 'zulkifliawang27@yahoo.com', '2017-07-30 07:13:13', 1, '2017-08-29', '', '0000-00-00'),
(572, 'BossFX170100705-35', 705, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'anoorg@gmail.com', '', '2017-07-30 07:43:02', 1, '2017-08-29', '', '0000-00-00'),
(573, 'BossFX170100706-85', 706, 1, 1, '0.00', '0.00', '0.37', '0', 'USD', 'Free', 0, 'rukshanjayz@gmail.com', 'rukshanjayz@gmail.com', '2017-07-30 08:06:48', 1, '2017-08-29', '', '0000-00-00'),
(574, 'BossFX170100707-27', 707, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'hotma.pandjaitan@yahoo.com', '', '2017-07-30 08:19:24', 1, '2017-08-29', '', '0000-00-00'),
(575, 'BossFX170100708-02', 708, 1, 1, '0.00', '0.00', '0.29', '0', 'USD', 'Free', 0, 'vsw999@yahoo.com', '', '2017-07-30 08:52:10', 1, '2017-08-29', '', '0000-00-00'),
(576, 'BossFX170100709-84', 709, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'fouu13@gmail.com', 'fouu13@gmail.com', '2017-07-30 10:32:38', 1, '2017-08-29', '', '0000-00-00'),
(577, 'BossFX170100710-04', 710, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'izwan1709@yahoo.com', 'izwan1709@yahoo.com', '2017-07-30 10:58:22', 1, '2017-08-29', '', '0000-00-00'),
(578, 'BossFX170100711-99', 711, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'luth.clouds@gmail.com', 'luth.clouds@gmail.com', '2017-07-30 11:25:14', 1, '2017-08-29', '', '0000-00-00'),
(579, 'BossFX170100712-65', 712, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'sara.portugal72@hotmail.com', '', '2017-07-30 11:33:18', 1, '2017-08-29', '', '0000-00-00'),
(580, 'BossFX170100713-41', 713, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'mimi2674@gmail.com', 'mimi2674@gmail.com', '2017-07-30 11:53:22', 1, '2017-08-29', '', '0000-00-00'),
(581, 'BossFX170100714-60', 714, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'sil_khanaz@hotmail.com', 'sil_khanaz@hotmail.com', '2017-07-30 11:59:20', 1, '2017-08-29', '', '0000-00-00'),
(582, 'BossFX170100715-72', 715, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'joaovitorsaparecido@hotmail.com', 'joaovitorsaparecido@hotmail.com', '2017-07-30 12:20:30', 1, '2017-08-30', '', '0000-00-00'),
(583, 'BossFX170100716-84', 716, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'wanyaosk@gmail.com', 'wanyaosk@gmail.com', '2017-07-30 12:38:50', 1, '2017-08-30', '', '0000-00-00'),
(584, 'BossFX170100717-28', 717, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'vendittigabriel14@gmail.com', '', '2017-07-30 12:42:55', 1, '2017-08-30', '', '0000-00-00'),
(585, 'BossFX170100718-93', 718, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'azam.aatb@gmail.com', 'azam.aatb@gmail.com', '2017-07-30 12:43:18', 1, '2017-08-30', '', '0000-00-00'),
(586, 'BossFX170100719-07', 719, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'Ahmedharoonadam@gmail.com', '', '2017-07-30 13:00:49', 1, '2017-08-30', '', '0000-00-00'),
(587, 'BossFX170100720-06', 720, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'ckcuecas@outlook.com', 'ckcuecas@outlook.com', '2017-07-30 13:01:22', 1, '2017-08-30', '', '0000-00-00'),
(588, 'BossFX170100721-41', 721, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'Killiancoyac681@gmail.com', 'Killiancoyac681@gmail.com', '2017-07-30 13:08:57', 1, '2017-08-30', '', '0000-00-00'),
(589, 'BossFX170100722-92', 722, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'Killiancoyac681@gmail.com', 'Killiancoyac681@gmail.com', '2017-07-30 13:11:25', 1, '2017-08-30', '', '0000-00-00'),
(590, 'BossFX170100723-49', 723, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'David.barsantee@gmail.com', 'Barsantee@yahoo.com', '2017-07-30 13:56:24', 1, '2017-08-30', '', '0000-00-00'),
(591, 'BossFX170100724-85', 724, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'mahmouddiab8787@yahoo.com', 'mahmouddiab8787@yahoo.com', '2017-07-30 14:05:13', 1, '2017-08-30', '', '0000-00-00'),
(592, 'BossFX170100725-44', 725, 1, 1, '0.00', '0.00', '0.99', '1', 'USD', 'Free', 0, 'mahmouddiab8787@yahoo.com', 'mahmouddiab8787@yahoo.com', '2017-07-30 15:00:31', 1, '2017-08-30', '', '0000-00-00'),
(593, 'BossFX170100726-43', 726, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'maksouma@hotmail.com', 'maksouma@hotmail.com', '2017-07-30 15:10:13', 1, '2017-08-30', '', '0000-00-00'),
(594, 'BossFX170100727-30', 727, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'maksouma@hotmail.com', 'maksouma@hotmail.com', '2017-07-30 15:23:53', 1, '2017-08-30', '', '0000-00-00'),
(595, 'BossFX170100728-83', 728, 1, 1, '0.00', '0.00', '0.37', '0', 'USD', 'Free', 0, 'ali.bayik@hotmail.com.tr', '', '2017-07-30 15:24:29', 1, '2017-08-30', '', '0000-00-00'),
(596, 'BossFX170100729-28', 729, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'handika.erick@gmail.com', 'handika.erick@gmail.com', '2017-07-31 03:06:28', 1, '2017-08-30', '', '0000-00-00'),
(597, 'BossFX170100730-04', 730, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'lfhaa2011@yahoo.com', '', '2017-07-31 06:05:46', 1, '2017-08-30', '', '0000-00-00'),
(598, 'BossFX170100731-09', 731, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'Willymail94@yahoo.com', '', '2017-07-31 11:17:50', 1, '2017-08-30', '', '0000-00-00'),
(599, 'BossFX170100732-07', 732, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'vusiramosebetsi@gmail.com', '', '2017-07-31 11:54:52', 1, '2017-08-30', '', '0000-00-00'),
(600, 'BossFX170100733-83', 733, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'noraz7717@gmail.com', 'noraz7717@gmail.com', '2017-07-31 12:00:22', 1, '2017-08-31', '', '0000-00-00');
INSERT INTO `payment_logs` (`ID`, `invoice_no`, `userid`, `idplan`, `idduration`, `amount`, `discount`, `amountsum`, `code_unique`, `currency_code`, `payment_channel`, `timestamp`, `email`, `email_paypal`, `deadline_pay`, `is_pay`, `exp_service`, `transfer_proof`, `date_pay`) VALUES
(601, 'BossFX170100734-60', 734, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'victorontop@gmail.com', '', '2017-07-31 12:34:11', 1, '2017-08-31', '', '0000-00-00'),
(602, 'BossFX170100735-92', 735, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'bruce5836@gmail.com', 'bruce5836@gmail.com', '2017-07-31 13:14:44', 1, '2017-08-31', '', '0000-00-00'),
(603, 'BossFX170100736-93', 736, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'kgaugelomolepo77@gmail.com', 'kgaugelomolepo77@gmail.com', '2017-07-31 13:25:58', 1, '2017-08-31', '', '0000-00-00'),
(604, 'BossFX170100737-05', 737, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'asmoon364@gmai.com', 'asmoon364@gmail.com', '2017-07-31 14:29:26', 1, '2017-08-31', '', '0000-00-00'),
(605, 'BossFX170100738-73', 738, 1, 1, '0.00', '0.00', '0.57', '1', 'USD', 'Free', 0, 'wev7754@gmail.com', '', '2017-07-31 17:52:06', 1, '2017-08-31', '', '0000-00-00'),
(606, 'BossFX170100739-91', 739, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'bamaforex@aol.com', 'bamacreeker@gmail.com', '2017-07-31 20:36:07', 1, '2017-08-31', '', '0000-00-00'),
(607, 'BossFX170100740-53', 740, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'amrul.wibawanto@gmail.com', '', '2017-07-31 20:47:42', 1, '2017-08-31', '', '0000-00-00'),
(608, 'BossFX170100741-94', 741, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'wrahmaniah@gmail.com', '', '2017-07-31 20:51:07', 1, '2017-08-31', '', '0000-00-00'),
(609, 'BossFX170100742-29', 742, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'dldeconno@gmail.com', 'dldeconno@gmail.com', '2017-07-31 21:01:31', 1, '2017-08-31', '', '0000-00-00'),
(610, 'BossFX170100743-82', 743, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'sangeetamahabier@gmail.com', 'sangeetamahabier@gmail.com', '2017-07-31 21:42:31', 1, '2017-08-31', '', '0000-00-00'),
(611, 'BossFX170100744-19', 744, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'miguel-foster@hotmail.com', 'miguel-foster@hotmail.com', '2017-07-31 22:35:34', 1, '2017-08-31', '', '0000-00-00'),
(612, 'BossFX170100745-86', 745, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'asanka.oppo@gmail.com', 'asanka.oppo@gmail.com', '2017-07-31 22:55:09', 1, '2017-08-31', '', '0000-00-00'),
(613, 'BossFX170100746-67', 746, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'trungduc.tr@gmail.com', 'trungduc.tr@gmail.com', '2017-08-01 00:14:41', 1, '2017-08-31', '', '0000-00-00'),
(614, 'BossFX170100747-31', 747, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'livingraze@gmail.com', '', '2017-08-01 01:26:56', 1, '2017-08-31', '', '0000-00-00'),
(615, 'BossFX170100748-11', 748, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'azmmorf01@gmail.com', '', '2017-08-01 01:39:47', 1, '2017-08-31', '', '0000-00-00'),
(616, 'BossFX170100749-25', 749, 1, 1, '0.00', '0.00', '0.92', '1', 'USD', 'Free', 0, 'winarnoaris90@gmail.com', '', '2017-08-01 01:55:16', 1, '2017-08-31', '', '0000-00-00'),
(617, 'BossFX170100750-67', 750, 1, 1, '0.00', '0.00', '0.24', '0', 'USD', 'Free', 0, 'refrisumadinata@gmail.com', 'refrisumadinata@gmail.com', '2017-08-01 04:30:25', 1, '2017-08-31', '', '0000-00-00'),
(618, 'BossFX170100751-84', 751, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'thabangmaphutha50@gmail.com', 'thabangmaphutha50@gmail.com', '2017-08-01 07:50:57', 1, '2017-08-31', '', '0000-00-00'),
(619, 'BossFX170300752-69', 752, 3, 1, '1303400.00', '0.00', '1303492.00', '92', 'IDR', 'bank', 0, 'hery.sggrp@gmail.com', '', '2017-08-01 08:17:57', 0, '2017-08-31', '', '0000-00-00'),
(620, 'BossFX170100753-01', 753, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'Gulahmedeidi@gmail.com', '', '2017-08-01 11:42:12', 1, '2017-08-31', '', '0000-00-00'),
(621, 'BossFX170100754-71', 754, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'fitnanto@gmail.com', '', '2017-08-01 13:42:39', 1, '2017-09-01', '', '0000-00-00'),
(622, 'BossFX170100755-91', 755, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'rcpadilla200180@gmail.com', 'rcpadilla2001@yahoo.com', '2017-08-01 21:21:33', 1, '2017-09-01', '', '0000-00-00'),
(623, 'BossFX170100756-88', 756, 1, 1, '0.00', '0.00', '0.92', '1', 'USD', 'Free', 0, 'mail.cbm@gmail.com', '', '2017-08-02 00:34:40', 1, '2017-09-01', '', '0000-00-00'),
(624, 'BossFX170100757-04', 757, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'Soaduadnan@gmail.com', 'Soaduadnan@gmail.com', '2017-08-02 13:15:11', 1, '2017-09-02', '', '0000-00-00'),
(625, 'BossFX170100758-28', 758, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'Moh.3372113372@gmail.com', 'Moh.3372113372@gmail.com', '2017-08-02 20:55:46', 1, '2017-09-02', '', '0000-00-00'),
(626, 'BossFX170400759-53', 759, 4, 1, '149.22', '0.00', '149.22', '0', 'USD', 'transfer paypal', 0, 'amirzulmuhd@gmail.com', 'amirzulmuhd@gmail.com', '2017-08-02 20:56:21', 1, '2017-09-02', '', '2017-08-02'),
(627, 'BossFX170100760-62', 760, 1, 1, '0.00', '0.00', '0.26', '0', 'USD', 'Free', 0, 'dangvu910@gmail.com', 'dangvu910@gmail.com', '2017-08-03 03:53:12', 1, '2017-09-02', '', '0000-00-00'),
(628, 'BossFX170100761-51', 761, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'tomtay@gmail.com', 'tomtay@gmail.com', '2017-08-03 05:57:12', 1, '2017-09-02', '', '0000-00-00'),
(629, 'BossFX170100762-47', 762, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'markforextrader@gmail.com', 'markforextrader@gmail.com', '2017-08-03 06:06:24', 1, '2017-09-02', '', '0000-00-00'),
(630, 'BossFX170100763-76', 763, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'adalbertoveras2012@gmail.com', 'adalbertoveras2012@gmail.com', '2017-08-03 12:20:10', 1, '2017-09-03', '', '0000-00-00'),
(631, 'BossFX170100764-10', 764, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'tinisuhaimi@gmail.com', 'tinisuhaimi@gmail.com', '2017-08-03 20:28:22', 1, '2017-09-03', '', '0000-00-00'),
(632, 'BossFX170100765-16', 765, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'baigs2486@gmail.com', 'baigs2486@gmail.com', '2017-08-03 20:31:10', 1, '2017-09-03', '', '0000-00-00'),
(633, 'BossFX170100766-86', 766, 1, 1, '0.00', '0.00', '0.33', '0', 'USD', 'Free', 0, 'adam12za@gmail.com', 'Adam12za@gmail.com', '2017-08-04 04:10:44', 1, '2017-09-03', '', '0000-00-00'),
(634, 'BossFX170100767-06', 767, 1, 1, '0.00', '0.00', '0.87', '1', 'USD', 'Free', 0, 'adam12za@gmail.com', 'Adam12za@gmail.com', '2017-08-04 04:13:50', 1, '2017-09-03', '', '0000-00-00'),
(635, 'BossFX170100768-24', 768, 1, 1, '0.00', '0.00', '0.90', '1', 'USD', 'Free', 0, 'amd.bluee@gmail.com', '', '2017-08-04 04:50:42', 1, '2017-09-03', '', '0000-00-00'),
(636, 'BossFX170100769-36', 769, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'bryportal@gmail.com', 'bryportal@gmail.com', '2017-08-04 10:40:18', 1, '2017-09-03', '', '0000-00-00'),
(637, 'BossFX170100770-73', 770, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'dwicoyuliandika@gmail.com', '', '2017-08-04 10:43:37', 1, '2017-09-03', '', '0000-00-00'),
(638, 'BossFX170100771-53', 771, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'yayalaressa2015@gmail.com', '', '2017-08-04 20:55:18', 1, '2017-09-04', '', '0000-00-00'),
(639, 'BossFX170100772-64', 772, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'chrisfv7@gmail.com', '', '2017-08-05 06:53:32', 1, '2017-09-04', '', '0000-00-00'),
(640, 'BossFX170100773-04', 773, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'rizadpmd@gmail.com', '', '2017-08-05 08:15:21', 1, '2017-09-04', '', '0000-00-00'),
(641, 'BossFX170100774-68', 774, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'ariffincsc@gmail.com', 'ariffincsc@gmail.com', '2017-08-05 12:52:48', 1, '2017-09-05', '', '0000-00-00'),
(642, 'BossFX170100775-00', 775, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'mayun.forex@gmail.com', 'agung.mayunwirajasa@gmail.com', '2017-08-06 06:10:22', 1, '2017-09-05', '', '0000-00-00'),
(643, 'BossFX170100776-86', 776, 1, 1, '0.00', '0.00', '0.75', '1', 'USD', 'Free', 0, 'houhou9010@gmail.com', 'kinhou123@yahoo.com', '2017-08-06 06:21:30', 1, '2017-09-05', '', '0000-00-00'),
(644, 'BossFX170100777-48', 777, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'k2pent@gmail.com', 'fly.charity@live.com.my', '2017-08-06 06:23:23', 1, '2017-09-05', '', '0000-00-00'),
(645, 'BossFX170100778-76', 778, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'miguel-foster@hotmail.com', 'miguel-foster@hotmail.com', '2017-08-06 08:17:56', 1, '2017-09-05', '', '0000-00-00'),
(646, 'BossFX170100779-72', 779, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'thamirts@gmail.com', 'thamirts@gmail.com', '2017-08-06 09:22:20', 1, '2017-09-05', '', '0000-00-00'),
(647, 'BossFX170100780-59', 780, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'thamirts@gmail.com', 'thamirts@gmail.com', '2017-08-06 11:40:32', 1, '2017-09-05', '', '0000-00-00'),
(648, 'BossFX170100781-65', 781, 1, 1, '0.00', '0.00', '0.75', '1', 'USD', 'Free', 0, 'Trader.faris@macl.aero', '', '2017-08-06 11:43:13', 1, '2017-09-05', '', '0000-00-00'),
(649, 'BossFX170100782-79', 782, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'shm_ady@yahoo.com', 'shm_ady@yahoo.com', '2017-08-06 11:47:11', 1, '2017-09-05', '', '0000-00-00'),
(650, 'BossFX170100783-06', 783, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'flaviofranklyn@gmail.com', 'flaviofranklyn@gmail.com', '2017-08-06 11:51:38', 1, '2017-09-05', '', '0000-00-00'),
(651, 'BossFX170100784-64', 784, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'Mehrdad.torabi19@gmail.com', 'Mehrdad.torabi19@gmail.com', '2017-08-06 11:57:23', 1, '2017-09-05', '', '0000-00-00'),
(652, 'BossFX170100785-96', 785, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'shaikhwaish3@gmail.com', 'shaikhashfaque645@gmail.com', '2017-08-06 12:54:43', 1, '2017-09-06', '', '0000-00-00'),
(653, 'BossFX170100786-53', 786, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'marceloalveseua@gmail.com', 'marceloalveseua@gmail.com', '2017-08-06 12:56:08', 1, '2017-09-06', '', '0000-00-00'),
(654, 'BossFX170100787-17', 787, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'nasertt@mail.com', '', '2017-08-06 14:52:36', 1, '2017-09-06', '', '0000-00-00'),
(655, 'BossFX170100788-25', 788, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'khinich98@gmail.com', 'khinich98@gmail.com', '2017-08-06 16:43:12', 1, '2017-09-06', '', '0000-00-00'),
(656, 'BossFX170100789-07', 789, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'Felipeangulski@hotmail.com', '', '2017-08-06 17:02:59', 1, '2017-09-06', '', '0000-00-00'),
(657, 'BossFX170100790-30', 790, 1, 1, '0.00', '0.00', '0.70', '1', 'USD', 'Free', 0, 'Zakaria.brigui@gmail.com', 'Briguizakaria@gmail.com', '2017-08-06 17:28:13', 1, '2017-09-06', '', '0000-00-00'),
(658, 'BossFX170100791-57', 791, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'Hashmatkhan.orhan@gmail.com', '', '2017-08-06 18:03:01', 1, '2017-09-06', '', '0000-00-00'),
(659, 'BossFX170100792-37', 792, 1, 1, '0.00', '0.00', '0.89', '1', 'USD', 'Free', 0, 'ismawijulaihi@yahoo.com', '', '2017-08-06 19:55:42', 1, '2017-09-06', '', '0000-00-00'),
(660, 'BossFX170100793-94', 793, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'kyoshiforex@gmail.com', 'tarzan_malaya03@yahoo.com', '2017-08-06 23:33:37', 1, '2017-09-06', '', '0000-00-00'),
(661, 'BossFX170100794-69', 794, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'mamatoc01@hotmail.com', 'Mamatoc01@hotmail.com', '2017-08-07 00:48:34', 1, '2017-09-06', '', '0000-00-00'),
(662, 'BossFX170100795-65', 795, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'samnanyasi@gmail.com', 'samnanyasi@gmail.com', '2017-08-07 01:30:22', 1, '2017-09-06', '', '0000-00-00'),
(663, 'BossFX170100796-27', 796, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'mohangunawardana91@gmail.com', 'mohanguanwardana91@gmail.com', '2017-08-07 03:19:12', 1, '2017-09-06', '', '0000-00-00'),
(664, 'BossFX170100797-38', 797, 1, 1, '0.00', '0.00', '0.19', '0', 'USD', 'Free', 0, 'davidrva@gmail.com', 'davidrva@gmail.com', '2017-08-07 03:50:33', 1, '2017-09-06', '', '0000-00-00'),
(665, 'BossFX170100798-91', 798, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'Saleh_zubeidi@yahoo.com', 'Dr. Saleh', '2017-08-07 07:08:40', 1, '2017-09-06', '', '0000-00-00'),
(666, 'BossFX170100799-10', 799, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'Hermansen760@gmail.com', 'Hermansen760@gmail.com', '2017-08-07 07:45:33', 1, '2017-09-06', '', '0000-00-00'),
(667, 'BossFX170100800-77', 800, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'Festougoiania@gmail.com', 'Fabriciovecci@gmail.com', '2017-08-07 10:19:27', 1, '2017-09-06', '', '0000-00-00'),
(668, 'BossFX170100801-75', 801, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'risnoruslan_jsi@yahoo.com', '', '2017-08-07 10:23:57', 1, '2017-09-06', '', '0000-00-00'),
(669, 'BossFX170100802-86', 802, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'Majid_x317@yahoo.com', '', '2017-08-07 11:16:30', 1, '2017-09-06', '', '0000-00-00'),
(670, 'BossFX170400803-67', 803, 4, 1, '149.27', '0.00', '149.27', '0', 'USD', 'transfer paypal', 0, 'tyoussef5@gmail.com', 'tyoussef5@gmail.com', '2017-08-07 12:15:17', 1, '2017-09-06', '', '2017-08-06'),
(671, 'BossFX170100804-74', 804, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'dglland@gmail.com', 'dglland@gmail.com', '2017-08-07 12:44:28', 1, '2017-09-07', '', '0000-00-00'),
(672, 'BossFX170100805-00', 805, 1, 1, '0.00', '0.00', '0.73', '1', 'USD', 'Free', 0, 'bamaforex@aol.com', 'bamacreeker@aol.com', '2017-08-07 13:11:58', 1, '2017-09-07', '', '0000-00-00'),
(673, 'BossFX170200806-27', 806, 2, 1, '49.94', '0.00', '49.94', '1', 'USD', 'transfer paypal', 0, 'vdg1168@gmail.com', 'vdg1168@gmail.com', '2017-08-07 15:11:46', 1, '2017-09-07', '', '2017-08-07'),
(674, 'BossFX170100807-10', 807, 1, 1, '0.00', '0.00', '0.21', '0', 'USD', 'Free', 0, 'contact.refri@gmail.com', '', '2017-08-08 10:55:36', 1, '2017-09-07', '', '0000-00-00'),
(675, 'BossFX170100808-96', 808, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'besmax1977@gmail.com', 'besmax1977@gmail.com', '2017-08-08 23:19:29', 1, '2017-09-08', '', '0000-00-00'),
(676, 'BossFX170100809-40', 809, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'schlzt1984@gmail.com', 'schlzt1984@gmail.com', '2017-08-08 23:34:06', 1, '2017-09-08', '', '0000-00-00'),
(677, 'BossFX170100810-68', 810, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'edwinhosan@yahoo.com', 'edwinhosan@yahoo.com', '2017-08-08 23:37:54', 1, '2017-09-08', '', '0000-00-00'),
(678, 'BossFX170400811-65', 811, 4, 2, '4748100.00', '0.00', '4748133.00', '33', 'IDR', 'bank', 0, 'nazriafandi@yahoo.com.my', 'nazriafandi@yahoo.com.mu', '2017-08-09 02:50:47', 0, '2017-11-08', '', '0000-00-00'),
(679, 'BossFX170100812-12', 812, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'kimitapdunsenfx@gmail.com', 'yeniarxonline@gmail.com', '2017-08-09 03:09:00', 1, '2017-09-08', '', '0000-00-00'),
(680, 'BossFX170100813-91', 813, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'jsphalvarado1@gmail.com', 'Jsphalvarado1@gmail.com', '2017-08-09 12:38:06', 1, '2017-09-09', '', '0000-00-00'),
(681, 'BossFX170100814-73', 814, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 's4midoke@gmail.com', '', '2017-08-09 12:58:57', 1, '2017-09-09', '', '0000-00-00'),
(682, 'BossFX170100815-72', 815, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'wanyaosk@gmail.com', 'wanyaosk@gmail.com', '2017-08-09 13:13:11', 1, '2017-09-09', '', '0000-00-00'),
(683, 'BossFX170100816-67', 816, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'bana.stream21@gmail.com', 'bana.stream21@gmail.com', '2017-08-10 00:38:31', 1, '2017-09-09', '', '0000-00-00'),
(684, 'BossFX170100817-68', 817, 1, 1, '0.00', '0.00', '0.75', '1', 'USD', 'Free', 0, 'daniwoloh@gmail.com', 'daniwoloh@gmail.com', '2017-08-10 08:19:53', 1, '2017-09-09', '', '0000-00-00'),
(685, 'BossFX170100818-57', 818, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'nurislamadiena@gmail.com', 'nurislamadiena@gmail.com', '2017-08-10 08:31:03', 1, '2017-09-09', '', '0000-00-00'),
(686, 'BossFX170100819-78', 819, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'nurislamadiena@gmail.com', 'nurislamadiena@gmail.com', '2017-08-10 08:31:40', 1, '2017-09-09', '', '0000-00-00'),
(687, 'BossFX170400820-85', 820, 4, 1, '149.19', '0.00', '149.19', '0', 'USD', 'transfer paypal', 0, 'jsphalvarado1@gmail.com', 'jsphalvarado1@gmail.com', '2017-08-10 11:13:14', 1, '2017-09-09', '', '2017-08-09'),
(688, 'BossFX170100821-74', 821, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'pitoh91@gmail.com', '', '2017-08-10 23:35:22', 1, '2017-09-10', '', '0000-00-00'),
(689, 'BossFX170300822-20', 822, 3, 2, '234.00', '0.00', '234.69', '1', 'USD', 'paypal', 0, 'mlaith58@yahoo.com', 'Mlaith58@yahoo.com', '2017-08-11 03:40:52', 0, '2017-11-10', '', '0000-00-00'),
(690, 'BossFX170100823-87', 823, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'Moh5202558@gmail.com', '', '2017-08-11 04:01:30', 1, '2017-09-10', '', '0000-00-00'),
(691, 'BossFX170100824-17', 824, 1, 1, '0.00', '0.00', '0.89', '1', 'USD', 'Free', 0, 'joe.tedjo@gmail.com', 'joe.tedjo@gmail.com', '2017-08-11 04:20:23', 1, '2017-09-10', '', '0000-00-00'),
(692, 'BossFX170100825-33', 825, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'omlim@yahoo.com', '', '2017-08-11 06:14:07', 1, '2017-09-10', '', '0000-00-00'),
(693, 'BossFX170100826-42', 826, 1, 1, '0.00', '0.00', '0.76', '1', 'USD', 'Free', 0, 'artan.fikret@ymail.com', '', '2017-08-11 21:02:34', 1, '2017-09-11', '', '0000-00-00'),
(694, 'BossFX170100827-13', 827, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'deylon@gmail.com', 'deylon@gmail.com', '2017-08-12 03:08:11', 1, '2017-09-11', '', '0000-00-00'),
(695, 'BossFX170100828-92', 828, 1, 1, '0.00', '0.00', '0.55', '1', 'USD', 'Free', 0, 'dikkyjpi19@gmail.com', '', '2017-08-12 09:41:43', 1, '2017-09-11', '', '0000-00-00'),
(696, 'BossFX170100829-94', 829, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'rizarosdiana@yahoo.co.in', '', '2017-08-12 16:08:28', 1, '2017-09-12', '', '0000-00-00'),
(697, 'BossFX170100830-83', 830, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'Mpigeot7@gmail.com', 'Mpigeot7@gmail.com', '2017-08-13 02:56:21', 1, '2017-09-12', '', '0000-00-00'),
(698, 'BossFX170100831-16', 831, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'juancamume@hotmail.com', 'juancamume@hotmail.com', '2017-08-13 09:00:31', 1, '2017-09-12', '', '0000-00-00'),
(699, 'BossFX170300832-55', 832, 3, 1, '98.98', '0.00', '98.98', '1', 'USD', 'transfer paypal', 0, 'rukshanjayz@gmail.com', 'rukshanjayz@gmail.com', '2017-08-13 12:33:48', 1, '2017-09-12', '', '2017-08-12'),
(700, 'BossFX170400833-15', 833, 4, 1, '1981700.00', '332500.00', '1649231.00', '31', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-08-13 12:49:03', 0, '2017-09-13', '', '0000-00-00'),
(701, 'BossFX170400834-82', 834, 4, 1, '149.00', '25.00', '124.21', '0', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-08-13 12:49:39', 0, '2017-09-13', '', '0000-00-00'),
(702, 'BossFX170100835-63', 835, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'a.a.pay2017@gmail.com', 'a.a.pay2017@gmail.com', '2017-08-13 16:10:18', 1, '2017-09-13', '', '0000-00-00'),
(703, 'BossFX170400836-86', 836, 4, 1, '1981700.00', '0.00', '1981736.00', '36', 'IDR', 'bank', 0, 'ahonxbengex@gmail.com', 'ahonxbengex@gmail.com', '2017-08-13 19:36:13', 0, '2017-09-13', '', '0000-00-00'),
(704, 'BossFX170100837-10', 837, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'bdshipon@yahoo.com', '', '2017-08-13 20:15:51', 1, '2017-09-13', '', '0000-00-00'),
(705, 'BossFX170400838-71', 838, 4, 1, '1981700.00', '0.00', '1981770.00', '70', 'IDR', 'bank', 0, 'azizichamani@ymail.com', 'aziziomary@ymail.com', '2017-08-13 20:29:22', 0, '2017-09-13', '', '0000-00-00'),
(706, 'BossFX170300839-67', 839, 3, 1, '98.25', '0.00', '98.25', '0', 'USD', 'transfer paypal', 0, 'ismawijulaihi@yahoo.com', 'Ismawijulaihi@yahoo.com', '2017-08-14 03:29:44', 1, '2017-09-13', '', '2017-08-13'),
(707, 'BossFX170100840-26', 840, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'fitriiqbal96@gmail.com', 'fitriiqbal96@gmail.com', '2017-08-14 06:25:06', 1, '2017-09-13', '', '0000-00-00'),
(708, 'BossFX170100841-83', 841, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'aboreyad_basha@yahoo.com', 'aboreyad_basha@yahoo.com', '2017-08-14 12:16:50', 1, '2017-09-14', '', '0000-00-00'),
(709, 'BossFX170100842-79', 842, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'maksouma@hotmail.com', 'maksouma@hotmail.com', '2017-08-14 13:10:10', 1, '2017-09-14', '', '0000-00-00'),
(710, 'BossFX170400843-31', 843, 4, 2, '357.65', '0.00', '357.65', '1', 'USD', 'transfer paypal', 0, 'kirwinweston@hotmail.com', 'kirwinweston@hotmail.com', '2017-08-14 13:31:08', 1, '2017-11-14', '', '2017-08-14'),
(711, 'BossFX170100844-42', 844, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'chavda.kanu@ymail.com', '', '2017-08-14 15:41:40', 1, '2017-09-14', '', '0000-00-00'),
(712, 'BossFX170100845-71', 845, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'kedo.ruiz@gmail.com', 'kedo.ruiz@gmail.com', '2017-08-14 18:21:15', 1, '2017-09-14', '', '0000-00-00'),
(713, 'BossFX170100846-55', 846, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'nileshptl25@gmail.com', 'nileshptl25@gmail.com', '2017-08-14 23:29:17', 1, '2017-09-14', '', '0000-00-00'),
(714, 'BossFX170400847-28', 847, 4, 1, '1981700.00', '0.00', '1981794.00', '94', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-08-15 01:01:24', 0, '2017-09-14', '', '0000-00-00'),
(715, 'BossFX170100848-72', 848, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'azuan.fbs@gmail.com', 'azuan.fbs@gmail.com', '2017-08-15 01:59:13', 1, '2017-09-14', '', '0000-00-00'),
(716, 'BossFX170100849-96', 849, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'dikkyjpi19@gmail.com', 'dikkyjpi19@gmail.com', '2017-08-15 11:20:16', 1, '2017-09-14', '', '0000-00-00'),
(717, 'BossFX170200850-49', 850, 2, 1, '49.32', '0.00', '49.32', '0', 'USD', 'transfer paypal', 0, 'juancamume@hotmail.com', 'juancamume@hotmail.com', '2017-08-16 00:03:36', 1, '2017-09-15', '', '2017-08-15'),
(718, 'BossFX170300851-00', 851, 3, 1, '1303400.00', '0.00', '1303473.00', '73', 'IDR', 'bank', 0, 'randymusisi@yahoo.com', '', '2017-08-16 03:59:58', 0, '2017-09-15', '', '0000-00-00'),
(719, 'BossFX170100852-41', 852, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'zakhele.ramoipone@gmail.com', 'zakhele.ramoipone@gmail.com', '2017-08-16 14:23:40', 1, '2017-09-16', '', '0000-00-00'),
(720, 'BossFX170200853-92', 853, 2, 1, '49.90', '0.00', '49.90', '1', 'USD', 'transfer paypal', 0, 'danielmanu22@yahoo.com', 'danielmanu22@yahoo.com', '2017-08-16 16:08:21', 1, '2017-09-16', '', '2017-08-16'),
(721, 'BossFX170200854-53', 854, 2, 1, '651700.00', '0.00', '651785.00', '85', 'IDR', 'bank', 0, 'bladiator_appxx@hotmail.com', '', '2017-08-17 10:54:56', 0, '2017-09-16', '', '0000-00-00'),
(722, 'BossFX170200855-30', 855, 2, 1, '49.85', '0.00', '49.85', '1', 'USD', 'transfer paypal', 0, 'bladiator_appxx@hotmail.com', 'bladiator_appxx@hotmail.com', '2017-08-17 11:23:31', 1, '2017-09-16', '', '2017-08-16'),
(723, 'BossFX170100856-14', 856, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'Moh5202558@gmail.com', '', '2017-08-17 11:33:41', 1, '2017-09-16', '', '0000-00-00'),
(724, 'BossFX170400857-64', 857, 4, 1, '149.00', '0.00', '149.64', '1', 'USD', 'paypal', 0, 'mosesibukunpaul@gmail.com', 'mosesibukunpaul@gmail.com', '2017-08-17 12:04:12', 0, '2017-09-17', '', '0000-00-00'),
(725, 'BossFX170300858-03', 858, 3, 1, '1303400.00', '0.00', '1303475.00', '75', 'IDR', 'bank', 0, 'restusongko@gmail.com', '', '2017-08-17 23:12:07', 0, '2017-09-17', '', '0000-00-00'),
(726, 'BossFX170200859-02', 859, 2, 1, '651700.00', '0.00', '651710.00', '10', 'IDR', 'bank', 0, 'Escaleramatthew@yahoo.com', 'Escaleramatthew@yahoo.com', '2017-08-18 00:57:45', 0, '2017-09-17', '', '0000-00-00'),
(727, 'BossFX170200860-31', 860, 2, 1, '49.22', '0.00', '49.22', '0', 'USD', 'transfer paypal', 0, 'Escaleramatthew@yahoo.com', 'Escaleramatthew@yahoo.com', '2017-08-18 01:37:36', 1, '2017-09-17', '', '2017-08-17'),
(728, 'BossFX170100861-98', 861, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'todinholondon@hotmail.co.uk', '', '2017-08-18 11:43:48', 1, '2017-09-17', '', '0000-00-00'),
(729, 'BossFX170100862-45', 862, 1, 1, '0.00', '0.00', '0.70', '1', 'USD', 'Free', 0, 'egypttito2009@yahoo.com', '', '2017-08-18 23:41:28', 1, '2017-09-18', '', '0000-00-00'),
(730, 'BossFX170200863-61', 863, 2, 1, '49.72', '0.00', '49.72', '1', 'USD', 'transfer paypal', 0, 'zakiyuddin1996@gmail.com', 'zakiyuddin1996@gmail.com', '2017-08-19 03:05:59', 1, '2017-09-18', '', '2017-08-18'),
(731, 'BossFX170400864-80', 864, 4, 1, '1981700.00', '0.00', '1981722.00', '22', 'IDR', 'bank', 0, 'azizi_alias87@yahoo.com', '', '2017-08-19 09:13:48', 0, '2017-09-18', '', '0000-00-00'),
(732, 'BossFX170400865-44', 865, 4, 1, '1981700.00', '0.00', '1981772.00', '72', 'IDR', 'bank', 0, 'azizi_alias87@yahoo.com', '', '2017-08-19 09:15:23', 0, '2017-09-18', '', '0000-00-00'),
(733, 'BossFX170400866-19', 866, 4, 1, '1981700.00', '0.00', '1981774.00', '74', 'IDR', 'bank', 0, 'azizi_alias87@yahoo.com', '', '2017-08-19 09:18:28', 0, '2017-09-18', '', '0000-00-00'),
(734, 'BossFX170400867-70', 867, 4, 1, '149.00', '0.00', '149.56', '1', 'USD', 'paypal', 0, 'azizi_alias87@yahoo.com', 'azizi_alias87@yahoo.com', '2017-08-19 10:57:22', 0, '2017-09-18', '', '0000-00-00'),
(735, 'BossFX170400868-03', 868, 4, 1, '149.00', '0.00', '149.67', '1', 'USD', 'paypal', 0, 'azizi_alias87@yahoo.com', 'azizi_alias87@yahoo.com', '2017-08-20 04:27:58', 0, '2017-09-19', '', '0000-00-00'),
(736, 'BossFX170400869-34', 869, 4, 1, '149.00', '0.00', '149.98', '1', 'USD', 'paypal', 0, 'azizi_alias87@yahoo.com', 'azizi_alias87@yahoo.com', '2017-08-20 04:38:47', 0, '2017-09-19', '', '0000-00-00'),
(737, 'BossFX170200870-25', 870, 2, 1, '651700.00', '0.00', '651710.00', '10', 'IDR', 'bank', 0, 'miguel-foster@hotmail.com', 'miguel-foster@hotmail.com', '2017-08-20 04:42:08', 0, '2017-09-19', '', '0000-00-00'),
(738, 'BossFX170100871-61', 871, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'Sofocuseodnme@gmail.com', 'Sofocusedonme@gmail.com', '2017-08-21 00:12:44', 1, '2017-09-20', '', '0000-00-00'),
(739, 'BossFX170200872-33', 872, 2, 1, '651700.00', '0.00', '651717.00', '17', 'IDR', 'bank', 0, 'faridzuank@gmail.com', 'faridzuank@gmail.com', '2017-08-21 02:05:53', 0, '2017-09-20', '', '0000-00-00'),
(740, 'BossFX170200873-51', 873, 2, 1, '49.00', '0.00', '49.90', '1', 'USD', 'paypal', 0, 'faridzuank@gmail.com', 'faridzuank@gmail.com', '2017-08-21 02:07:09', 0, '2017-09-20', '', '0000-00-00'),
(741, 'BossFX170300874-81', 874, 3, 1, '1303400.00', '0.00', '1303480.00', '80', 'IDR', 'bank', 0, 'cisseabdul@outlook.fr', 'cisseabdul@outlook.fr', '2017-08-21 16:01:14', 0, '2017-09-21', '', '0000-00-00'),
(742, 'BossFX170400875-27', 875, 4, 1, '149.00', '0.00', '149.42', '0', 'USD', 'paypal', 0, 'artan.fikret@ymail.com', 'artan.fikret@ymail.com', '2017-08-21 19:16:37', 0, '2017-09-21', '', '0000-00-00'),
(743, 'BossFX170400876-39', 876, 4, 1, '1981700.00', '0.00', '1981784.00', '84', 'IDR', 'bank', 0, 'artan.fikret@ymail.com', '', '2017-08-21 19:32:53', 0, '2017-09-21', '', '0000-00-00'),
(744, 'BossFX170200877-52', 877, 2, 1, '651700.00', '0.00', '651752.00', '52', 'IDR', 'bank', 0, 'ariantokam12@gmail.com', '', '2017-08-21 23:23:51', 0, '2017-09-21', '', '0000-00-00'),
(745, 'BossFX170200878-70', 878, 2, 1, '49.00', '0.00', '49.88', '1', 'USD', 'paypal', 0, 'faridzuank@gmail.com', 'f2k92@yahoo.com', '2017-08-21 23:25:34', 0, '2017-09-21', '', '0000-00-00'),
(746, 'BossFX170200879-69', 879, 2, 1, '651700.00', '0.00', '651726.00', '26', 'IDR', 'bank', 0, 'brpt@gmail.com', '', '2017-08-21 23:27:37', 0, '2017-09-21', '', '0000-00-00'),
(747, 'BossFX170200880-77', 880, 2, 1, '651700.00', '0.00', '651713.00', '13', 'IDR', 'bank', 0, 'faridzuank@gmail.com', 'f2k92@yahoo.com', '2017-08-22 00:16:51', 0, '2017-09-21', '', '0000-00-00'),
(748, 'BossFX170200881-64', 881, 2, 1, '49.00', '0.00', '49.65', '1', 'USD', 'paypal', 0, 'faridzuank@gmail.com', 'f2k92@yahoo.com', '2017-08-22 00:28:41', 0, '2017-09-21', '', '0000-00-00'),
(749, 'BossFX170200882-63', 882, 2, 1, '49.96', '0.00', '49.96', '1', 'USD', 'transfer paypal', 0, 'faridzuank@gmail.com', 'odyfoodie@gmail.com', '2017-08-22 00:29:25', 1, '2017-09-21', '', '2017-08-21'),
(750, 'BossFX170400883-17', 883, 4, 1, '149.00', '0.00', '149.79', '1', 'USD', 'paypal', 0, 'artan.fikret@ymail.com', 'artan.fikret@ymail.com', '2017-08-22 04:37:57', 0, '2017-09-21', '', '0000-00-00'),
(751, 'BossFX170100884-43', 884, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'Willforextrading@gmail.com', '', '2017-08-22 09:16:56', 1, '2017-09-21', '', '0000-00-00'),
(752, 'BossFX170100885-86', 885, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'unathizk@gmail.com', 'nqobaz1@gmail.com', '2017-08-23 03:18:41', 1, '2017-09-22', '', '0000-00-00'),
(753, 'BossFX170100886-78', 886, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'klooi1228@outlook.com', 'klooi1228@outlook.com', '2017-08-23 03:53:47', 1, '2017-09-22', '', '0000-00-00'),
(754, 'BossFX170100887-21', 887, 1, 1, '0.00', '0.00', '0.57', '1', 'USD', 'Free', 0, 'asif.muhammad756@yahoo.com', 'asif.muhammad756@yahoo.com', '2017-08-23 05:18:36', 1, '2017-09-22', '', '0000-00-00'),
(755, 'BossFX170100888-32', 888, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'bradbogatsu@gmail.com', '', '2017-08-23 06:00:45', 1, '2017-09-22', '', '0000-00-00'),
(756, 'BossFX170400889-96', 889, 4, 1, '1981700.00', '0.00', '1981714.00', '14', 'IDR', 'bank', 0, 'artan.fikret@ymail.com', '', '2017-08-24 19:35:03', 0, '2017-09-24', '', '0000-00-00'),
(757, 'BossFX170100890-07', 890, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'abduljalil77@hotmail.com', 'abduljalil77@hotmail.com', '2017-08-24 19:45:05', 1, '2017-09-24', '', '0000-00-00'),
(758, 'BossFX170100891-87', 891, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'rboenstg@gmail.com', '', '2017-08-25 21:55:58', 1, '2017-09-25', '', '0000-00-00'),
(759, 'BossFX170100892-12', 892, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'houhou9010@gmail.com', 'houhou9010@gmail.com', '2017-08-25 22:33:00', 1, '2017-09-25', '', '0000-00-00'),
(760, 'BossFX170100893-20', 893, 1, 1, '0.00', '0.00', '0.89', '1', 'USD', 'Free', 0, 'Pepe0077@gmail.com', '', '2017-08-26 03:07:35', 1, '2017-09-25', '', '0000-00-00'),
(761, 'BossFX170300894-65', 894, 3, 1, '1303400.00', '0.00', '1303449.00', '49', 'IDR', 'bank', 0, 'aditrisqi@gmail.com', 'aditrisqi@gmail.com', '2017-08-26 06:08:22', 0, '2017-09-25', '', '0000-00-00'),
(762, 'BossFX170100895-14', 895, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'ypking2015@gmail.com', '', '2017-08-26 06:55:22', 1, '2017-09-25', '', '0000-00-00'),
(763, 'BossFX170300896-87', 896, 3, 1, '1303400.00', '0.00', '1303418.00', '18', 'IDR', 'bank', 0, 'tlalimohau1@gmail.com', '', '2017-08-27 00:11:57', 0, '2017-09-26', '', '0000-00-00'),
(764, 'BossFX170300897-45', 897, 3, 1, '1303400.00', '0.00', '1303420.00', '20', 'IDR', 'bank', 0, 'tlalimohau1@gmail.com', '', '2017-08-27 00:17:41', 0, '2017-09-26', '', '0000-00-00'),
(765, 'BossFX170300898-30', 898, 3, 1, '1303400.00', '0.00', '1303472.00', '72', 'IDR', 'bank', 0, 'tlalimohau1@gmail.com', '', '2017-08-27 00:22:57', 0, '2017-09-26', '', '0000-00-00'),
(766, 'BossFX170300899-52', 899, 3, 1, '1303400.00', '0.00', '1303496.00', '96', 'IDR', 'bank', 0, 'tlalimohau1@gmail.com', '', '2017-08-27 00:26:57', 0, '2017-09-26', '', '0000-00-00'),
(767, 'BossFX170100900-93', 900, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'weechin85@hotmail.com', '', '2017-08-27 20:10:24', 1, '2017-09-27', '', '0000-00-00'),
(768, 'BossFX170100901-00', 901, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'tonnynuku@gmail.com', 'tonnynuku@gmail.com', '2017-08-28 08:36:50', 1, '2017-09-27', '', '0000-00-00'),
(769, 'BossFX170400902-98', 902, 4, 1, '1981700.00', '0.00', '1981785.00', '85', 'IDR', 'bank', 0, 'grantkathrine@gmail.com', 'grantkathrine@gmail.com', '2017-08-29 03:01:54', 0, '2017-09-28', '', '0000-00-00'),
(770, 'BossFX170100903-66', 903, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'tonnynuku@yahoo.com', 'tonnynuku@gmail.com', '2017-08-29 08:21:01', 1, '2017-09-28', '', '0000-00-00'),
(771, 'BossFX170400904-56', 904, 4, 1, '1981700.00', '0.00', '1981759.00', '59', 'IDR', 'bank', 0, 'eropradeep12@gmail.com', '', '2017-08-29 10:40:42', 0, '2017-09-28', '', '0000-00-00'),
(772, 'BossFX170400905-01', 905, 4, 1, '149.89', '0.00', '149.89', '1', 'USD', 'transfer paypal', 0, 'Moh5202558@gmail.com', 'Bigboss5202558@gmail.com', '2017-08-29 13:51:35', 1, '2017-09-29', '', '2017-08-29'),
(773, 'BossFX170400906-21', 906, 4, 1, '149.00', '0.00', '149.82', '1', 'USD', 'paypal', 0, 'eropradeep12@gmail.com', 'vijayapradeep.pt@gmail.com', '2017-08-29 22:52:14', 0, '2017-09-29', '', '0000-00-00'),
(774, 'BossFX170400907-03', 907, 4, 1, '149.00', '0.00', '149.54', '1', 'USD', 'paypal', 0, 'yeteytyr@gmail.com', 'hhdkcjhjc@gmail.com', '2017-08-29 22:58:06', 0, '2017-09-29', '', '0000-00-00'),
(775, 'BossFX170100908-40', 908, 1, 1, '0.00', '0.00', '0.90', '1', 'USD', 'Free', 0, 'mnhaider512@gmail.com', '', '2017-08-30 09:29:05', 1, '2017-09-29', '', '0000-00-00'),
(776, 'BossFX170100909-50', 909, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'Abdulbasidtrading@gmail.com', '', '2017-08-30 09:30:29', 1, '2017-09-29', '', '0000-00-00'),
(777, 'BossFX170400910-73', 910, 4, 1, '149.00', '0.00', '149.25', '0', 'USD', 'paypal', 0, 'rianovs@gmail.com', 'rianovs@gmail.com', '2017-08-30 10:26:30', 0, '2017-09-29', '', '0000-00-00'),
(778, 'BossFX170400911-09', 911, 4, 1, '149.00', '0.00', '149.78', '1', 'USD', 'paypal', 0, 'rianovs@gmail.com', 'rianovs@gmail.com', '2017-08-30 10:28:21', 0, '2017-09-29', '', '0000-00-00'),
(779, 'BossFX170400912-76', 912, 4, 1, '149.15', '0.00', '149.15', '0', 'USD', 'transfer paypal', 0, 'Joehaubert@gmail.com', 'Mercado.livre.jh@gmail.com', '2017-08-30 22:44:41', 1, '2017-09-30', '', '2017-08-30'),
(780, 'BossFX170400913-75', 913, 4, 1, '149.59', '0.00', '149.59', '1', 'USD', 'transfer paypal', 0, 'Twanna.Tiller@gmail.com', 'Twanna.tiller@gmail.com', '2017-08-31 03:14:20', 1, '2017-09-30', '', '2017-08-30'),
(781, 'BossFX170100914-05', 914, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'terzman@alice.it', '', '2017-08-31 07:40:59', 1, '2017-09-30', '', '0000-00-00'),
(782, 'BossFX170100915-70', 915, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'desmond5290@gmail.com', 'desmond5290@gmail.com', '2017-08-31 07:57:17', 1, '2017-09-30', '', '0000-00-00'),
(783, 'BossFX170400916-09', 916, 4, 1, '1981700.00', '0.00', '1981733.00', '33', 'IDR', 'bank', 0, 'grantkathrine@gmail.com', 'grantkathrine@gmail.com', '2017-08-31 09:04:56', 0, '2017-09-30', '', '0000-00-00'),
(784, 'BossFX170400917-47', 917, 4, 1, '149.87', '0.00', '149.87', '1', 'USD', 'transfer paypal', 0, 'grantkathrine@gmail.com', 'grantkathrine@gmail.com', '2017-08-31 09:15:34', 1, '2017-09-30', '', '2017-08-30'),
(785, 'BossFX170100918-79', 918, 1, 1, '0.00', '0.00', '0.96', '1', 'USD', 'Free', 0, 'axel.normand@yahoo.fr', 'axel.normand@yahoo.fr', '2017-08-31 14:54:57', 1, '2017-10-01', '', '0000-00-00'),
(786, 'BossFX170200919-29', 919, 2, 1, '651700.00', '0.00', '651731.00', '31', 'IDR', 'bank', 0, 'thamirts@gmail.com', 'thamirts@gmail.com', '2017-08-31 20:28:42', 0, '2017-10-01', '', '0000-00-00'),
(787, 'BossFX170100920-55', 920, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'Txawjhli86@yahoo.com', 'Htkb68@yahoo.com', '2017-09-03 00:14:14', 1, '2017-10-02', '', '0000-00-00'),
(788, 'BossFX170100921-37', 921, 1, 1, '0.00', '0.00', '0.75', '1', 'USD', 'Free', 0, 'Txawjhli86@yahoo.com', 'Htkb68@yahoo.com', '2017-09-03 00:18:55', 1, '2017-10-02', '', '0000-00-00'),
(789, 'BossFX170100922-98', 922, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'luckydavr@mail.ru', '', '2017-09-03 00:29:10', 1, '2017-10-02', '', '0000-00-00'),
(790, 'BossFX170100923-30', 923, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'nfy1997@gmail.com', 'nfy1997@gmail.com', '2017-09-03 00:36:09', 1, '2017-10-02', '', '0000-00-00'),
(791, 'BossFX170100924-94', 924, 1, 1, '0.00', '0.00', '0.88', '1', 'USD', 'Free', 0, 'latif4rex@gmail.com', 'latif4rex@gmail.com', '2017-09-03 00:46:54', 1, '2017-10-02', '', '0000-00-00'),
(792, 'BossFX170100925-27', 925, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'dur_yudana@yahoo.com', '', '2017-09-03 00:57:26', 1, '2017-10-02', '', '0000-00-00'),
(793, 'BossFX170100926-65', 926, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'checunzolo@hotmail.it', 'checunzolo@hotmail.it', '2017-09-03 01:19:49', 1, '2017-10-02', '', '0000-00-00'),
(794, 'BossFX170100927-57', 927, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'Shonszeyen@gmail.com', 'Shonszeyen@gmail.com', '2017-09-03 01:26:17', 1, '2017-10-02', '', '0000-00-00'),
(795, 'BossFX170100928-52', 928, 1, 1, '0.00', '0.00', '0.33', '0', 'USD', 'Free', 0, 'ippay2003@gmail.com', 'ippay2002@gmail.com', '2017-09-03 02:22:25', 1, '2017-10-02', '', '0000-00-00'),
(796, 'BossFX170100929-95', 929, 1, 1, '0.00', '0.00', '0.98', '1', 'USD', 'Free', 0, 'saz4184@gmail.com', '', '2017-09-03 02:27:28', 1, '2017-10-02', '', '0000-00-00'),
(797, 'BossFX170100930-66', 930, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'predrag334@gmail.com', 'predrag334@gmail.com', '2017-09-03 02:53:04', 1, '2017-10-02', '', '0000-00-00'),
(798, 'BossFX170100931-83', 931, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'predrag334@gmail.com', 'predrag334@gmail.com', '2017-09-03 02:54:05', 1, '2017-10-02', '', '0000-00-00'),
(799, 'BossFX170100932-07', 932, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'anujrana21@gmail.com', 'anujrana21@gmail.com', '2017-09-03 03:04:02', 1, '2017-10-02', '', '0000-00-00'),
(800, 'BossFX170100933-65', 933, 1, 1, '0.00', '0.00', '0.92', '1', 'USD', 'Free', 0, 'rasool130@gmail.com', '', '2017-09-03 03:50:11', 1, '2017-10-02', '', '0000-00-00'),
(801, 'BossFX170100934-26', 934, 1, 1, '0.00', '0.00', '0.21', '0', 'USD', 'Free', 0, 'jkkayani007@gmail.com', '', '2017-09-03 04:24:14', 1, '2017-10-02', '', '0000-00-00'),
(802, 'BossFX170100935-06', 935, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'muthwa.thami@gmail.com', '', '2017-09-03 04:31:38', 1, '2017-10-02', '', '0000-00-00'),
(803, 'BossFX170100936-14', 936, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'korotigeorge@gmail.com', 'korotigeorge@gmail.com', '2017-09-03 05:33:59', 1, '2017-10-02', '', '0000-00-00'),
(804, 'BossFX170400937-22', 937, 4, 1, '149.00', '0.00', '149.47', '0', 'USD', 'paypal', 0, 'cparrar@gmail.com', 'cparrar@gmail.com', '2017-09-03 05:40:25', 0, '2017-10-02', '', '0000-00-00'),
(805, 'BossFX170100938-42', 938, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'kmtan520@gmail.com', 'kmtan520@gmail.com', '2017-09-03 06:28:08', 1, '2017-10-02', '', '0000-00-00'),
(806, 'BossFX170100939-50', 939, 1, 1, '0.00', '0.00', '0.19', '0', 'USD', 'Free', 0, 'zakhele.ramoipone@gmail.com', 'zakhele.ramoipone@gmail.com', '2017-09-03 06:52:24', 1, '2017-10-02', '', '0000-00-00'),
(807, 'BossFX170100940-70', 940, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'demianx13@gmail.com', 'Demianx13@gmail.com', '2017-09-03 08:08:15', 1, '2017-10-02', '', '0000-00-00'),
(808, 'BossFX170100941-39', 941, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'am.mikaniki@gmail.com', '', '2017-09-03 08:24:41', 1, '2017-10-02', '', '0000-00-00'),
(809, 'BossFX170100942-38', 942, 1, 1, '0.00', '0.00', '0.55', '1', 'USD', 'Free', 0, 'Zulkhairi_8267@hotmail.com', '', '2017-09-03 09:00:32', 1, '2017-10-02', '', '0000-00-00'),
(810, 'BossFX170100943-50', 943, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'nhymju246bgt@gmail.com', '', '2017-09-03 10:13:24', 1, '2017-10-02', '', '0000-00-00'),
(811, 'BossFX170100944-83', 944, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'baqifm@gmail.com', '', '2017-09-03 10:33:25', 1, '2017-10-02', '', '0000-00-00'),
(812, 'BossFX170100945-29', 945, 1, 1, '0.00', '0.00', '0.87', '1', 'USD', 'Free', 0, 'tareq_mas@hotmail.com', 'tareq_mas@hotmail.com', '2017-09-03 10:45:29', 1, '2017-10-02', '', '0000-00-00'),
(813, 'BossFX170100946-91', 946, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'Patel_sarfaraj@yahoo.co.in', '', '2017-09-03 11:50:32', 1, '2017-10-02', '', '0000-00-00'),
(814, 'BossFX170100947-85', 947, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'smiento@hotmail.com', 'smiento@hotmail.com', '2017-09-03 12:09:15', 1, '2017-10-03', '', '0000-00-00'),
(815, 'BossFX170200948-61', 948, 2, 1, '651700.00', '0.00', '651716.00', '16', 'IDR', 'bank', 0, 'zakhele.ramoipone@gmail.com', 'zakhele.ramoipone@gmail.com', '2017-09-03 15:20:03', 0, '2017-10-03', '', '0000-00-00'),
(816, 'BossFX170100949-85', 949, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'ranaung2@gmail.com', 'ranaung2@gmail.com', '2017-09-03 20:26:01', 1, '2017-10-03', '', '0000-00-00'),
(817, 'BossFX170100950-26', 950, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'heroes2301mauro@gmail.com', '', '2017-09-03 22:12:36', 1, '2017-10-03', '', '0000-00-00'),
(818, 'BossFX170100951-99', 951, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'muhamadaizad851027045205@gmail.com', 'muhamadaizad851027045205@gmail.com', '2017-09-03 22:36:27', 1, '2017-10-03', '', '0000-00-00'),
(819, 'BossFX170100952-02', 952, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'khalilalemi1@gmail.com', 'khalilalemi1@gmail.com', '2017-09-03 23:52:25', 1, '2017-10-03', '', '0000-00-00'),
(820, 'BossFX170100953-86', 953, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 'mazin.farok@yahoo.com', '', '2017-09-04 04:04:16', 1, '2017-10-03', '', '0000-00-00'),
(821, 'BossFX170100954-95', 954, 1, 1, '0.00', '0.00', '0.29', '0', 'USD', 'Free', 0, 'erwien.4ex@gmail.com', 'erwien.4ex@gmail.com', '2017-09-04 11:48:11', 1, '2017-10-03', '', '0000-00-00'),
(822, 'BossFX170100955-05', 955, 1, 1, '0.00', '0.00', '0.98', '1', 'USD', 'Free', 0, 'amiruliqwan9@gmail.com', '', '2017-09-05 07:18:40', 1, '2017-10-04', '', '0000-00-00'),
(823, 'BossFX170100956-06', 956, 1, 1, '0.00', '0.00', '0.94', '1', 'USD', 'Free', 0, 'Gandyjules@gmail.com', 'Gandyjules@gmail.com', '2017-09-05 11:59:17', 1, '2017-10-04', '', '0000-00-00'),
(824, 'BossFX170200957-06', 957, 2, 1, '651700.00', '0.00', '651762.00', '62', 'IDR', 'bank', 0, 'zakhele.ramoipone@gmail.com', 'zakhele.ramoipone@gmail.com', '2017-09-05 14:37:10', 0, '2017-10-05', '', '0000-00-00'),
(825, 'BossFX170100958-92', 958, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'shaf4484@gmail.com', 'shaf4484@gmail.com', '2017-09-05 20:38:22', 1, '2017-10-05', '', '0000-00-00'),
(826, 'BossFX170100959-33', 959, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'cagle97@gmail.com', 'cagle97@gmail.com', '2017-09-05 20:41:15', 1, '2017-10-05', '', '0000-00-00'),
(827, 'BossFX170100960-11', 960, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'ellentradingforex@gmail.com', '', '2017-09-05 21:24:22', 1, '2017-10-05', '', '0000-00-00'),
(828, 'BossFX170100961-36', 961, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'badrilamin@gmail.com', 'badrilamim@gmail.com', '2017-09-05 21:38:49', 1, '2017-10-05', '', '0000-00-00'),
(829, 'BossFX170100962-47', 962, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'rizarosdiana@yahoo.co.in', 'rizarosdiana@yahoo.co.in', '2017-09-05 22:43:49', 1, '2017-10-05', '', '0000-00-00'),
(830, 'BossFX170100963-52', 963, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'anaktukangan@gmail.com', '', '2017-09-06 00:18:36', 1, '2017-10-05', '', '0000-00-00'),
(831, 'BossFX170100964-53', 964, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'Itu.dups@gmail.com', '', '2017-09-06 04:36:58', 1, '2017-10-05', '', '0000-00-00'),
(832, 'BossFX170100965-63', 965, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'syakir.acc1@gmail.com', '', '2017-09-06 08:19:28', 1, '2017-10-05', '', '0000-00-00'),
(833, 'BossFX170100966-77', 966, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'bilraz96@gmail.com', '', '2017-09-06 12:08:16', 1, '2017-10-06', '', '0000-00-00'),
(834, 'BossFX170100967-55', 967, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'nicktechnology99@gmail.com', 'nicktechnology99@gmail.com', '2017-09-06 12:13:29', 1, '2017-10-06', '', '0000-00-00'),
(835, 'BossFX170100968-29', 968, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'tareq_mas@hotmail.com', 'tareq_mas@hotmail.com', '2017-09-06 12:22:29', 1, '2017-10-06', '', '0000-00-00'),
(836, 'BossFX170100969-10', 969, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'gurusamy10c@gmail.com', '', '2017-09-07 07:15:13', 1, '2017-10-06', '', '0000-00-00'),
(837, 'BossFX170100970-03', 970, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'zulckarab@gmail.com', 'zulckarab@gmail.com', '2017-09-07 10:35:45', 1, '2017-10-06', '', '0000-00-00'),
(838, 'BossFX170100971-68', 971, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'gunawanto829@gmail.com', 'gunawanto829@gmail.com', '2017-09-07 10:40:35', 1, '2017-10-06', '', '0000-00-00'),
(839, 'BossFX170100972-10', 972, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'yongkai8878@yahoo.co.id', 'Yongkai8878@yahoo.co.id', '2017-09-07 11:02:50', 1, '2017-10-06', '', '0000-00-00'),
(840, 'BossFX170100973-59', 973, 1, 1, '0.00', '0.00', '0.73', '1', 'USD', 'Free', 0, 'Vihaan.sikha@gmail.com', '', '2017-09-07 11:05:31', 1, '2017-10-06', '', '0000-00-00'),
(841, 'BossFX170400974-71', 974, 4, 3, '13300.00', '0.00', '13398.00', '98', 'IDR', 'bank', 0, 'aqlilapranaja384@gmail.com', '', '2017-09-07 11:18:48', 0, '2018-09-06', '', '0000-00-00'),
(842, 'BossFX170100975-32', 975, 1, 1, '0.00', '0.00', '0.26', '0', 'USD', 'Free', 0, 'landsay.peterd@gmail.com', 'landsay.peterd@gmail.com', '2017-09-07 12:05:03', 1, '2017-10-07', '', '0000-00-00'),
(843, 'BossFX170100976-73', 976, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'mozarizal@gmail.com', '', '2017-09-07 12:07:50', 1, '2017-10-07', '', '0000-00-00'),
(844, 'BossFX170100977-94', 977, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'happythabo@rocketmail.com', '', '2017-09-07 12:50:16', 1, '2017-10-07', '', '0000-00-00'),
(845, 'BossFX170100978-51', 978, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'ezelegodsent@gmail.com', 'ezele_godsent@yahoo.com', '2017-09-07 15:14:26', 1, '2017-10-07', '', '0000-00-00'),
(846, 'BossFX170100979-86', 979, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'handika.erick@gmail.com', '', '2017-09-07 20:29:33', 1, '2017-10-07', '', '0000-00-00'),
(847, 'BossFX170100980-58', 980, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'jajam89@gmail.com', '', '2017-09-07 20:48:32', 1, '2017-10-07', '', '0000-00-00'),
(848, 'BossFX170100981-72', 981, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'smilerichers66@yahoo.com', '', '2017-09-07 21:51:03', 1, '2017-10-07', '', '0000-00-00'),
(849, 'BossFX170100982-64', 982, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'andre.wisnu2@gmail.com', 'andre.wisnu2@gmail.com', '2017-09-07 22:52:04', 1, '2017-10-07', '', '0000-00-00'),
(850, 'BossFX170100983-39', 983, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'handika.erick@gmail.com', '', '2017-09-07 23:34:50', 1, '2017-10-07', '', '0000-00-00'),
(851, 'BossFX170100984-81', 984, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'lankajang@gmail.com', '', '2017-09-08 00:52:34', 1, '2017-10-07', '', '0000-00-00'),
(852, 'BossFX170100985-36', 985, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'A.mughal004@outlook.com', '', '2017-09-08 02:14:35', 1, '2017-10-07', '', '0000-00-00'),
(853, 'BossFX170100986-13', 986, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'diwakar.puri@gmail.com', '', '2017-09-08 04:49:18', 1, '2017-10-07', '', '0000-00-00'),
(854, 'BossFX170100987-60', 987, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'datuherman8080@gmail.com', 'datuherman8080@gmail.com', '2017-09-08 05:42:05', 1, '2017-10-07', '', '0000-00-00'),
(855, 'BossFX170100988-82', 988, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'abdullah.alangari@yahoo.com', '', '2017-09-08 07:10:06', 1, '2017-10-07', '', '0000-00-00'),
(856, 'BossFX170100989-33', 989, 1, 1, '0.00', '0.00', '0.76', '1', 'USD', 'Free', 0, 'gugliimpietro@gmail.com', '', '2017-09-08 08:11:09', 1, '2017-10-07', '', '0000-00-00'),
(857, 'BossFX170100990-03', 990, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'ismailzainalzainal@gmail.com', '', '2017-09-08 10:07:09', 1, '2017-10-07', '', '0000-00-00'),
(858, 'BossFX170100991-15', 991, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'mudassirk216@gmail.com', 'mudassirk216@gmail.com', '2017-09-09 02:20:49', 1, '2017-10-08', '', '0000-00-00'),
(859, 'BossFX170100992-16', 992, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'ebrahimrojaee@yahoo.com', 'ebrahimrojaee@yahoo.com', '2017-09-09 05:02:25', 1, '2017-10-08', '', '0000-00-00'),
(860, 'BossFX170100993-32', 993, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'Rachaelajets@gmail.com', 'Itunuajets@yahoo.com', '2017-09-09 07:44:33', 1, '2017-10-08', '', '0000-00-00'),
(861, 'BossFX170300994-23', 994, 3, 1, '1303400.00', '0.00', '1303492.00', '92', 'IDR', 'bank', 0, 'yongkai8878@yahoo.co.id', 'Yongkai8878@yahoo.co.id', '2017-09-10 00:07:51', 0, '2017-10-09', '', '0000-00-00'),
(862, 'BossFX170100995-79', 995, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'nks5021@yahoo.com', '', '2017-09-10 00:28:14', 1, '2017-10-09', '', '0000-00-00'),
(863, 'BossFX170100996-86', 996, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'luckydavr@mail.ru', '', '2017-09-10 01:41:40', 1, '2017-10-09', '', '0000-00-00');
INSERT INTO `payment_logs` (`ID`, `invoice_no`, `userid`, `idplan`, `idduration`, `amount`, `discount`, `amountsum`, `code_unique`, `currency_code`, `payment_channel`, `timestamp`, `email`, `email_paypal`, `deadline_pay`, `is_pay`, `exp_service`, `transfer_proof`, `date_pay`) VALUES
(864, 'BossFX170100997-62', 997, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'ramesh.jetsoft@gmail.com', '', '2017-09-10 01:59:13', 1, '2017-10-09', '', '0000-00-00'),
(865, 'BossFX170100998-49', 998, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'taivavashec@gmail.com', 'taivavashec@gmail.com', '2017-09-10 02:46:54', 1, '2017-10-09', '', '0000-00-00'),
(866, 'BossFX170100999-11', 999, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'Fibobinary@gmail.com', 'Fibobinary@gmail.com', '2017-09-10 10:25:43', 1, '2017-10-09', '', '0000-00-00'),
(867, 'BossFX170101000-25', 1000, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'dmacinc@yahoo.com', 'daniellemcculley63@gmail.com', '2017-09-10 12:14:25', 1, '2017-10-10', '', '0000-00-00'),
(868, 'BossFX170101001-49', 1001, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'wanmohas@gmail.com', 'wanmohas@gmail.com', '2017-09-10 20:04:52', 1, '2017-10-10', '', '0000-00-00'),
(869, 'BossFX170101002-30', 1002, 1, 1, '0.00', '0.00', '0.70', '1', 'USD', 'Free', 0, 'aqilaqif87@gmail.com', '', '2017-09-10 23:32:28', 1, '2017-10-10', '', '0000-00-00'),
(870, 'BossFX170101003-59', 1003, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'alkutemahesh@gmail.com', '', '2017-09-11 06:30:37', 1, '2017-10-10', '', '0000-00-00'),
(871, 'BossFX170101004-88', 1004, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'marza.andika@gmail.com', 'marza.andika@gmail.com', '2017-09-12 21:47:55', 1, '2017-10-12', '', '0000-00-00'),
(872, 'BossFX170101005-37', 1005, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'polimetkim@gmail.com', 'polimetkim@gmail.com', '2017-09-13 00:54:49', 1, '2017-10-12', '', '0000-00-00'),
(873, 'BossFX170301006-86', 1006, 3, 1, '1303400.00', '0.00', '1303411.00', '11', 'IDR', 'bank', 0, 'imsocoolclaudel@yahoo.com', 'imsocoolclaudel@yahoo.com', '2017-09-13 16:14:57', 0, '2017-10-13', '', '0000-00-00'),
(874, 'BossFX170301007-26', 1007, 3, 1, '1303400.00', '0.00', '1303499.00', '99', 'IDR', 'bank', 0, 'imsocoolclaudel@yahoo.com', 'imsocoolclaudel@yahoo.com', '2017-09-13 16:36:22', 0, '2017-10-13', '', '0000-00-00'),
(875, 'BossFX170301008-64', 1008, 3, 1, '98.00', '0.00', '98.14', '0', 'USD', 'paypal', 0, 'imsocoolclaudel@yahoo.com', 'imsocoolclaudel@yahoo.com', '2017-09-13 16:50:24', 0, '2017-10-13', '', '0000-00-00'),
(876, 'BossFX170301009-61', 1009, 3, 1, '1303400.00', '0.00', '1303450.00', '50', 'IDR', 'bank', 0, 'imsocoolclaudel@yahoo.com', '', '2017-09-14 10:01:08', 0, '2017-10-13', '', '0000-00-00'),
(877, 'BossFX170301010-86', 1010, 3, 1, '98.00', '0.00', '98.58', '1', 'USD', 'paypal', 0, 'imsocoolclaudel@yahoo.com', 'claudiubodiu@yahoo.com', '2017-09-14 10:10:48', 0, '2017-10-13', '', '0000-00-00'),
(878, 'BossFX170301011-58', 1011, 3, 1, '98.00', '0.00', '98.27', '0', 'USD', 'paypal', 0, 'imsocoolclaudel@yahoo.com', 'bodiuclaudiu@yahoo.com', '2017-09-14 11:14:54', 0, '2017-10-13', '', '0000-00-00'),
(879, 'BossFX170101012-77', 1012, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'bradbogatsu@gmail.com', '', '2017-09-14 14:49:04', 1, '2017-10-14', '', '0000-00-00'),
(880, 'BossFX170101013-69', 1013, 1, 1, '0.00', '0.00', '0.58', '1', 'USD', 'Free', 0, 'qarimahm@gmail.com', '', '2017-09-15 00:17:46', 1, '2017-10-14', '', '0000-00-00'),
(881, 'BossFX170101014-72', 1014, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'palakraika@yahoo.com', '', '2017-09-15 07:43:41', 1, '2017-10-14', '', '0000-00-00'),
(882, 'BossFX170101015-14', 1015, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'jean@log20.com.br', '', '2017-09-15 08:45:53', 1, '2017-10-14', '', '0000-00-00'),
(883, 'BossFX170201016-65', 1016, 2, 1, '651700.00', '0.00', '651793.00', '93', 'IDR', 'bank', 0, 'levisonbarnes@gmail.com', '', '2017-09-15 10:46:53', 0, '2017-10-14', '', '0000-00-00'),
(884, 'BossFX170201017-56', 1017, 2, 1, '651700.00', '0.00', '651717.00', '17', 'IDR', 'bank', 0, 'levisonbarnes@gmail.com', '', '2017-09-15 10:50:11', 0, '2017-10-14', '', '0000-00-00'),
(885, 'BossFX170301018-57', 1018, 3, 1, '98.64', '0.00', '98.64', '1', 'USD', 'transfer paypal', 0, 'imsocoolclaudel@yahoo.com', 'alinmarius66@yahoo.com', '2017-09-16 10:46:20', 1, '2017-10-15', '', '2017-09-15'),
(886, 'BossFX170201019-14', 1019, 2, 1, '651700.00', '0.00', '651761.00', '61', 'IDR', 'bank', 0, 'Mohdismail7070@gmail.com', '', '2017-09-17 09:08:30', 0, '2017-10-16', '', '0000-00-00'),
(887, 'BossFX170201020-75', 1020, 2, 1, '651700.00', '0.00', '651770.00', '70', 'IDR', 'bank', 0, 'Mohdismail7070@gmail.com', '', '2017-09-17 09:10:29', 0, '2017-10-16', '', '0000-00-00'),
(888, 'BossFX170101021-44', 1021, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'faldinv68@gmail.com', '', '2017-09-17 15:02:04', 1, '2017-10-17', '', '0000-00-00'),
(889, 'BossFX170101022-97', 1022, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'Kumar.evo3d@gmail.com', '', '2017-09-18 10:47:30', 1, '2017-10-17', '', '0000-00-00'),
(890, 'BossFX170101023-80', 1023, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'arsala.toru@gmail.com', '', '2017-09-19 08:15:51', 1, '2017-10-18', '', '0000-00-00'),
(891, 'BossFX170101024-45', 1024, 1, 1, '0.00', '0.00', '0.86', '1', 'USD', 'Free', 0, 'rickma72@gmail.com', '', '2017-09-19 16:02:26', 1, '2017-10-19', '', '0000-00-00'),
(892, 'BossFX170101025-77', 1025, 1, 1, '0.00', '0.00', '0.21', '0', 'USD', 'Free', 0, 'idris.mohd.nazrol@gmail.com', 'idris.mohd.nazrol@gmail.com', '2017-09-20 10:05:27', 1, '2017-10-19', '', '0000-00-00'),
(893, 'BossFX170101026-48', 1026, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'dahmast@gmail.com', '', '2017-09-20 12:20:36', 1, '2017-10-20', '', '0000-00-00'),
(894, 'BossFX170101027-54', 1027, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'agaputera12@gmail.com', '', '2017-09-20 12:43:44', 1, '2017-10-20', '', '0000-00-00'),
(895, 'BossFX170101028-07', 1028, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'idreeskh2016@gmail.com', 'idreeskh2016@gmail.com', '2017-09-21 22:30:24', 1, '2017-10-21', '', '0000-00-00'),
(896, 'BossFX170101029-90', 1029, 1, 1, '0.00', '0.00', '0.26', '0', 'USD', 'Free', 0, 'Aaidh17@gmail.com', '', '2017-09-22 17:59:36', 1, '2017-10-22', '', '0000-00-00'),
(897, 'BossFX170101030-05', 1030, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'diwakar.puri@gmail.com', '', '2017-09-22 22:20:33', 1, '2017-10-22', '', '0000-00-00'),
(898, 'BossFX170101031-02', 1031, 1, 1, '0.00', '0.00', '0.90', '1', 'USD', 'Free', 0, 'unathizk@gmail.com', 'nqobaz1@gmail.com', '2017-09-22 23:20:22', 1, '2017-10-22', '', '0000-00-00'),
(899, 'BossFX170401032-68', 1032, 4, 1, '149.00', '0.00', '149.75', '1', 'USD', 'paypal', 0, 'ogi.prayogo@gmail.com', 'ogi.prayogo@gmail.com', '2017-09-23 00:57:22', 0, '2017-10-22', '', '0000-00-00'),
(900, 'BossFX170101033-84', 1033, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'magicrush88@gmail.com', 'magicrush88@gmail.com', '2017-09-23 01:03:58', 1, '2017-10-22', '', '0000-00-00'),
(901, 'BossFX170101034-82', 1034, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'Hafizkptt@gmail.com', 'Hafizkptt@gmail.com', '2017-09-23 07:52:13', 1, '2017-10-22', '', '0000-00-00'),
(902, 'BossFX170101035-46', 1035, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'vickimgay@yahoo.com', '', '2017-09-23 22:14:41', 1, '2017-10-23', '', '0000-00-00'),
(903, 'BossFX170101036-51', 1036, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'Kazegat@gmail.com', 'Kazegat@gmail.com', '2017-09-24 06:26:00', 1, '2017-10-23', '', '0000-00-00'),
(904, 'BossFX170101037-70', 1037, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'akolanupaka@gmail.com', 'akolanupaka@gmail.com', '2017-09-24 20:47:31', 1, '2017-10-24', '', '0000-00-00'),
(905, 'BossFX170101038-79', 1038, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'sha.ntoe23@gmail.com', 'sha.ntoe23@gmail.com', '2017-09-25 02:18:47', 1, '2017-10-24', '', '0000-00-00'),
(906, 'BossFX170101039-94', 1039, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'Fibobinary@gmail.com', 'Fibobinary@gmail.com', '2017-09-25 15:09:40', 1, '2017-10-25', '', '0000-00-00'),
(907, 'BossFX170101040-98', 1040, 1, 1, '0.00', '0.00', '0.26', '0', 'USD', 'Free', 0, 'joe.tedjo@gmail.com', 'joe.tedjo@gmail.com', '2017-09-25 22:17:24', 1, '2017-10-25', '', '0000-00-00'),
(908, 'BossFX170401041-75', 1041, 4, 1, '149.34', '0.00', '149.34', '0', 'USD', 'transfer paypal', 0, 'ogi.prayogo@gmail.com', 'ogi.prayogo@gmail.com', '2017-09-25 22:37:34', 1, '2017-10-25', '', '2017-09-25'),
(909, 'BossFX170101042-48', 1042, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'biz.jshengchiam@gmail.com', 'biz.jshengchiam@gmail.com', '2017-09-26 03:44:38', 1, '2017-10-25', '', '0000-00-00'),
(910, 'BossFX170401043-95', 1043, 4, 1, '1981700.00', '0.00', '1981720.00', '20', 'IDR', 'bank', 0, 'joe.tedjo@gmail.com', '', '2017-09-26 04:58:29', 0, '2017-10-25', '', '0000-00-00'),
(911, 'BossFX170101044-58', 1044, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'diwakar.puri@gmail.com', '', '2017-09-26 07:20:15', 1, '2017-10-25', '', '0000-00-00'),
(912, 'BossFX170101045-88', 1045, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'yaa_820@yahoo.com', 'yaa_820@yahoo.com', '2017-09-26 15:02:07', 1, '2017-10-26', '', '0000-00-00'),
(913, 'BossFX170401046-23', 1046, 4, 1, '1981700.00', '0.00', '1981777.00', '77', 'IDR', 'bank', 0, 'd_trada@yahoo.in', 'd_trada@yahoo.in', '2017-09-27 00:56:37', 0, '2017-10-26', '', '0000-00-00'),
(914, 'BossFX170101047-54', 1047, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'yun97nda07@gmail.com', '-', '2017-09-28 21:36:15', 1, '2017-10-28', '', '0000-00-00'),
(915, 'BossFX170301048-06', 1048, 3, 1, '98.77', '0.00', '98.77', '1', 'USD', 'transfer paypal', 0, 'dmacinc@yahoo.com', 'daniellemcculley63@gmail.com', '2017-09-28 23:17:03', 1, '2017-10-28', '', '2017-09-28'),
(916, 'BossFX170101049-38', 1049, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'dodyyuniarso@gmail.com', 'dodyyuniarso@gmail.com', '2017-09-29 00:06:35', 1, '2017-10-28', '', '0000-00-00'),
(917, 'BossFX170101050-32', 1050, 1, 1, '0.00', '0.00', '0.37', '0', 'USD', 'Free', 0, 'happythabo@rocketmail.com', 'happythabo@rocketmail.com', '2017-09-29 00:14:08', 1, '2017-10-28', '', '0000-00-00'),
(918, 'BossFX170101051-97', 1051, 1, 1, '0.00', '0.00', '0.19', '0', 'USD', 'Free', 0, 'juandijuandijuandi@gmail.com', '', '2017-09-29 00:21:26', 1, '2017-10-28', '', '0000-00-00'),
(919, 'BossFX170101052-10', 1052, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'arga.ta89@gmail.com', 'arga.ta89@gmail.com', '2017-09-29 00:27:14', 1, '2017-10-28', '', '0000-00-00'),
(920, 'BossFX170101053-23', 1053, 1, 1, '0.00', '0.00', '0.61', '1', 'USD', 'Free', 0, 'eddy_scq@yahoo.co.id', '', '2017-09-29 00:49:58', 1, '2017-10-28', '', '0000-00-00'),
(921, 'BossFX170101054-54', 1054, 1, 1, '0.00', '0.00', '0.33', '0', 'USD', 'Free', 0, 'leighbeisel@outlook.com', '', '2017-09-29 01:28:22', 1, '2017-10-28', '', '0000-00-00'),
(922, 'BossFX170101055-59', 1055, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'korotigeorge@gmail.com', 'korotigeorge@gmail.com', '2017-09-29 01:32:46', 1, '2017-10-28', '', '0000-00-00'),
(923, 'BossFX170101056-46', 1056, 1, 1, '0.00', '0.00', '0.55', '1', 'USD', 'Free', 0, 'ramesh.jetsoft@gmail.com', 'ramesh.jetsoft@gmail.com', '2017-09-29 01:44:32', 1, '2017-10-28', '', '0000-00-00'),
(924, 'BossFX170101057-95', 1057, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'Rahendra.suryanata@gmail.com', '', '2017-09-29 05:24:10', 1, '2017-10-28', '', '0000-00-00'),
(925, 'BossFX170101058-39', 1058, 1, 1, '0.00', '0.00', '0.29', '0', 'USD', 'Free', 0, 'mahat_syawal@yahoo.com.my', '', '2017-09-29 05:48:33', 1, '2017-10-28', '', '0000-00-00'),
(926, 'BossFX170101059-66', 1059, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'cheam1484@yahoo.com', '', '2017-09-29 10:12:20', 1, '2017-10-28', '', '0000-00-00'),
(927, 'BossFX170101060-16', 1060, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'chopsforchops@gmail.com', '', '2017-09-29 11:06:13', 1, '2017-10-28', '', '0000-00-00'),
(928, 'BossFX170101061-42', 1061, 1, 1, '0.00', '0.00', '0.57', '1', 'USD', 'Free', 0, 'orangesolutions76@gmail.com', '', '2017-09-29 12:07:25', 1, '2017-10-29', '', '0000-00-00'),
(929, 'BossFX170101062-03', 1062, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'mazin.farok@yahoo.com', '', '2017-09-29 13:33:18', 1, '2017-10-29', '', '0000-00-00'),
(930, 'BossFX170101063-97', 1063, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'aqilaqif87@gmail.com', 'aqilaqif87@gmail.com', '2017-09-29 13:44:13', 1, '2017-10-29', '', '0000-00-00'),
(931, 'BossFX170101064-00', 1064, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'anto240182@gmail.com', 'anto240182@gmail.com', '2017-09-30 00:12:11', 1, '2017-10-29', '', '0000-00-00'),
(932, 'BossFX170201065-60', 1065, 2, 1, '651700.00', '0.00', '651781.00', '81', 'IDR', 'bank', 0, 'Nfn.murdani@msn.com', '', '2017-09-30 01:35:48', 0, '2017-10-29', '', '0000-00-00'),
(933, 'BossFX170101066-76', 1066, 1, 1, '0.00', '0.00', '0.94', '1', 'USD', 'Free', 0, 'vuqar.qenberov@gmail.com', '', '2017-09-30 17:25:58', 1, '2017-10-30', '', '0000-00-00'),
(934, 'BossFX170401067-49', 1067, 4, 1, '149.67', '0.00', '149.67', '1', 'USD', 'transfer paypal', 0, 'mmowaidah@gmail.com', 'mowaidah0963@gmail.com', '2017-09-30 21:09:55', 1, '2017-10-30', '', '2017-09-30'),
(935, 'BossFX170101068-69', 1068, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'Lins.borges@gmail.com', '', '2017-10-01 01:13:40', 1, '2017-10-30', '', '0000-00-00'),
(936, 'BossFX170101069-44', 1069, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'thiago.grillo@gmail.com', '', '2017-10-01 08:10:38', 1, '2017-10-30', '', '0000-00-00'),
(937, 'BossFX170101070-31', 1070, 1, 1, '0.00', '0.00', '0.92', '1', 'USD', 'Free', 0, 'erwien.4ex@gmail.com', 'erwien.22408@gmail.com', '2017-10-01 08:11:59', 1, '2017-10-30', '', '0000-00-00'),
(938, 'BossFX170101071-56', 1071, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'machageforex@gmail.com', 'baridikali', '2017-10-01 15:19:40', 1, '2017-11-01', '', '0000-00-00'),
(939, 'BossFX170101072-45', 1072, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'asmoon364@gmail.com', 'zoneseven364gmail.com', '2017-10-01 17:10:41', 1, '2017-11-01', '', '0000-00-00'),
(940, 'BossFX170101073-60', 1073, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'Wiraandika5132@gmail.com', 'Wiraandika5132@gmail.com', '2017-10-01 22:34:09', 1, '2017-11-01', '', '0000-00-00'),
(941, 'BossFX170301074-09', 1074, 3, 2, '3112200.00', '0.00', '3112227.00', '27', 'IDR', 'bank', 0, 'hendrayanatan76@gmail.com', '', '2017-10-02 05:57:54', 0, '2018-01-01', '', '0000-00-00'),
(942, 'BossFX170101075-80', 1075, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'rahimimsr@yahoo.com', '', '2017-10-02 08:58:24', 1, '2017-11-01', '', '0000-00-00'),
(943, 'BossFX170101076-79', 1076, 1, 1, '0.00', '0.00', '0.26', '0', 'USD', 'Free', 0, 'Anasdhonbey@gmail.com', 'Anas.del.12107@gmail.com', '2017-10-02 16:49:15', 1, '2017-11-02', '', '0000-00-00'),
(944, 'BossFX170101077-95', 1077, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'Faldinv68@gmail.com', '', '2017-10-02 17:09:48', 1, '2017-11-02', '', '0000-00-00'),
(945, 'BossFX170101078-82', 1078, 1, 1, '0.00', '0.00', '0.96', '1', 'USD', 'Free', 0, 'sana.priahin@yandex.ru', '', '2017-10-02 18:38:16', 1, '2017-11-02', '', '0000-00-00'),
(946, 'BossFX170201079-53', 1079, 2, 1, '651700.00', '0.00', '651763.00', '63', 'IDR', 'bank', 0, 'hendrayanatan76@gmail.com', '', '2017-10-02 20:09:49', 0, '2017-11-02', '', '0000-00-00'),
(947, 'BossFX170101080-96', 1080, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'gotaufik@gmail.com', 'gotaufik@gmail.com', '2017-10-02 21:46:08', 1, '2017-11-02', '', '0000-00-00'),
(948, 'BossFX170201081-22', 1081, 2, 1, '651700.00', '0.00', '651758.00', '58', 'IDR', 'bank', 0, 'eagle210210@gmail.com', '', '2017-10-03 05:19:02', 0, '2017-11-02', '', '0000-00-00'),
(949, 'BossFX170101082-94', 1082, 1, 1, '0.00', '0.00', '0.76', '1', 'USD', 'Free', 0, 'asbilhalva@bol.com.br', '', '2017-10-03 17:57:47', 1, '2017-11-03', '', '0000-00-00'),
(950, 'BossFX170101083-96', 1083, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'asbilhalva@bol.com.br', '', '2017-10-03 17:59:24', 1, '2017-11-03', '', '0000-00-00'),
(951, 'BossFX170101084-49', 1084, 1, 1, '0.00', '0.00', '0.89', '1', 'USD', 'Free', 0, 'Ionek41@yahoo.com', 'Iwan', '2017-10-03 21:00:48', 1, '2017-11-03', '', '0000-00-00'),
(952, 'BossFX170101085-00', 1085, 1, 1, '0.00', '0.00', '0.21', '0', 'USD', 'Free', 0, 'Dw@huntchase.com', 'Dw@huntchase.com', '2017-10-04 15:11:03', 1, '2017-11-04', '', '0000-00-00'),
(953, 'BossFX170101086-84', 1086, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, '217087914@student.uj.ac.za', '', '2017-10-06 05:41:10', 1, '2017-11-05', '', '0000-00-00'),
(954, 'BossFX170101087-40', 1087, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'Samukelo393@gmail.com', '', '2017-10-06 15:12:08', 1, '2017-11-06', '', '0000-00-00'),
(955, 'BossFX170101088-10', 1088, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'gifts189@gmail.com', 'smusa6811@gmail.com', '2017-10-06 18:18:17', 1, '2017-11-06', '', '0000-00-00'),
(956, 'BossFX170101089-42', 1089, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'Sthembisoclinten@gmail.com', 'Sthembisoclinten@gmail.com', '2017-10-06 22:59:35', 1, '2017-11-06', '', '0000-00-00'),
(957, 'BossFX170101090-29', 1090, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'mathakha95@gmail.com', 'eramathuthu17@gmail.com', '2017-10-07 07:08:25', 1, '2017-11-06', '', '0000-00-00'),
(958, 'BossFX170101091-31', 1091, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'Samukelo393@gmail.com', '', '2017-10-07 10:15:28', 1, '2017-11-06', '', '0000-00-00'),
(959, 'BossFX170101092-67', 1092, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'w.m.a.i@hotmail.com', 'w.m.a.i@hotmail.com', '2017-10-07 17:49:59', 1, '2017-11-07', '', '0000-00-00'),
(960, 'BossFX170101093-57', 1093, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 't.paradise08@gmail.com', '', '2017-10-07 23:34:06', 1, '2017-11-07', '', '0000-00-00'),
(961, 'BossFX170101094-45', 1094, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'Jawranimayur@gmail.com', '', '2017-10-07 23:38:25', 1, '2017-11-07', '', '0000-00-00'),
(962, 'BossFX170101095-66', 1095, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'bagussantoso970@gmail.com', '', '2017-10-07 23:39:10', 1, '2017-11-07', '', '0000-00-00'),
(963, 'BossFX170101096-53', 1096, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'mangukiyahelp4u@gmail.com', '', '2017-10-07 23:44:44', 1, '2017-11-07', '', '0000-00-00'),
(964, 'BossFX170101097-24', 1097, 1, 1, '0.00', '0.00', '0.76', '1', 'USD', 'Free', 0, 'newbie.mukidi@gmail.com', '', '2017-10-08 00:03:42', 1, '2017-11-07', '', '0000-00-00'),
(965, 'BossFX170101098-41', 1098, 1, 1, '0.00', '0.00', '0.96', '1', 'USD', 'Free', 0, 'Txawjhli86@yahoo.com', 'Txawjhli86@yahoo.com', '2017-10-08 00:28:46', 1, '2017-11-07', '', '0000-00-00'),
(966, 'BossFX170201099-36', 1099, 2, 1, '651700.00', '0.00', '651769.00', '69', 'IDR', 'bank', 0, 'sayzmie86@gmail.com', 'sayzmie86@gmail.com', '2017-10-08 02:04:21', 0, '2017-11-07', '', '0000-00-00'),
(967, 'BossFX170201100-38', 1100, 2, 1, '49.45', '0.00', '49.45', '0', 'USD', 'transfer paypal', 0, 'mdelham85@yahoo.com', 'sayzmie86@gmail.com', '2017-10-08 02:23:03', 1, '2017-11-07', '', '2017-10-07'),
(968, 'BossFX170101101-52', 1101, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'ariefnasikhudin99@gmail.com', 'ariefnasikhudin99@gmail.com', '2017-10-08 02:31:36', 1, '2017-11-07', '', '0000-00-00'),
(969, 'BossFX170101102-06', 1102, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'Bultibillionaire@gmail.com', '', '2017-10-08 05:01:52', 1, '2017-11-07', '', '0000-00-00'),
(970, 'BossFX170101103-73', 1103, 1, 1, '0.00', '0.00', '0.87', '1', 'USD', 'Free', 0, 'asmoon364@gmail.com', 'zoneseven364@gmail.com', '2017-10-08 05:55:29', 1, '2017-11-07', '', '0000-00-00'),
(971, 'BossFX170101104-73', 1104, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'ibrahimamassaly12@gmail.com', 'ibrahimamassaly12@gmail.com', '2017-10-08 06:10:50', 1, '2017-11-07', '', '0000-00-00'),
(972, 'BossFX170101105-92', 1105, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'talk2halfseen@gmail.com', 'talk2halfseen@gmail.com', '2017-10-08 06:49:38', 1, '2017-11-07', '', '0000-00-00'),
(973, 'BossFX170301106-24', 1106, 3, 1, '98.64', '0.00', '98.64', '1', 'USD', 'transfer paypal', 0, 'janvieraka2017@gmail.com', 'janvieraka2017@gmail.com', '2017-10-08 07:02:26', 1, '2017-11-07', '', '2017-10-07'),
(974, 'BossFX170101107-72', 1107, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'sanjay.verma981@gmail.com', 'Sanjay.verma981@gmail.com', '2017-10-08 07:34:43', 1, '2017-11-07', '', '0000-00-00'),
(975, 'BossFX170201108-05', 1108, 2, 1, '651700.00', '0.00', '651780.00', '80', 'IDR', 'bank', 0, 'Mandlasbura@gmail.com', '', '2017-10-08 11:15:20', 0, '2017-11-07', '', '0000-00-00'),
(976, 'BossFX170101109-44', 1109, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'dragonfx3333@gmail.com', '', '2017-10-08 11:17:23', 1, '2017-11-07', '', '0000-00-00'),
(977, 'BossFX170101110-72', 1110, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'aarshbrarr@gmail.com', '', '2017-10-08 11:26:12', 1, '2017-11-07', '', '0000-00-00'),
(978, 'BossFX170101111-15', 1111, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'sizgabs@gmail.com', '', '2017-10-08 11:53:54', 1, '2017-11-07', '', '0000-00-00'),
(979, 'BossFX170101112-45', 1112, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'jj1216788@gmail.com', 'hjuanda40@gmail.com', '2017-10-08 12:09:04', 1, '2017-11-08', '', '0000-00-00'),
(980, 'BossFX170201113-12', 1113, 2, 1, '651700.00', '0.00', '651762.00', '62', 'IDR', 'bank', 0, 'jj1216788@gmail.com', 'hjuanda40@gmail.com', '2017-10-08 21:40:01', 0, '2017-11-08', '', '0000-00-00'),
(981, 'BossFX170101114-49', 1114, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'syafiq.mahmud.fiq11@gmail.com', '', '2017-10-09 00:59:48', 1, '2017-11-08', '', '0000-00-00'),
(982, 'BossFX170101115-80', 1115, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'fitriiqbal96@gmail.com', '', '2017-10-09 03:56:28', 1, '2017-11-08', '', '0000-00-00'),
(983, 'BossFX170101116-25', 1116, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'mxolisimdwaba22@gmail.com', '', '2017-10-09 06:57:28', 1, '2017-11-08', '', '0000-00-00'),
(984, 'BossFX170101117-73', 1117, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'desmond5290@gmail.com', 'desmond5290@gmail.com', '2017-10-09 07:49:23', 1, '2017-11-08', '', '0000-00-00'),
(985, 'BossFX170101118-55', 1118, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'hiteshchoudhary224005@gmail.com', 'hiteshchoudhary224005@gmail.com', '2017-10-09 07:49:48', 1, '2017-11-08', '', '0000-00-00'),
(986, 'BossFX170101119-00', 1119, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'brownito247@gmail.com', 'brownito247@gmail.com', '2017-10-10 00:36:57', 1, '2017-11-09', '', '0000-00-00'),
(987, 'BossFX170101120-64', 1120, 1, 1, '0.00', '0.00', '0.55', '1', 'USD', 'Free', 0, 'dwiidro1@gmail.com', '', '2017-10-10 05:10:42', 1, '2017-11-09', '', '0000-00-00'),
(988, 'BossFX170101121-69', 1121, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'rahimimsr@yahoo.com', '', '2017-10-10 05:22:44', 1, '2017-11-09', '', '0000-00-00'),
(989, 'BossFX170101122-42', 1122, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'Nduduzo.ng@gmail.com', 'Nduduzo.ng@gmail.com', '2017-10-10 11:09:26', 1, '2017-11-09', '', '0000-00-00'),
(990, 'BossFX170101123-28', 1123, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'Ibrahim.shakeel@hotmail.com', '', '2017-10-10 11:16:45', 1, '2017-11-09', '', '0000-00-00'),
(991, 'BossFX170101124-30', 1124, 1, 1, '0.00', '0.00', '0.87', '1', 'USD', 'Free', 0, 'rn14@gmx.com', '', '2017-10-10 12:13:47', 1, '2017-11-10', '', '0000-00-00'),
(992, 'BossFX170101125-65', 1125, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'sangsang8368@gmail.com', '', '2017-10-10 12:45:49', 1, '2017-11-10', '', '0000-00-00'),
(993, 'BossFX170101126-05', 1126, 1, 1, '0.00', '0.00', '0.84', '1', 'USD', 'Free', 0, 'Tyron.v.woods@gmail.com', '', '2017-10-10 16:01:44', 1, '2017-11-10', '', '0000-00-00'),
(994, 'BossFX170301127-08', 1127, 3, 1, '1303400.00', '0.00', '1303452.00', '52', 'IDR', 'bank', 0, 'putuindra@gmail.com', '', '2017-10-10 19:55:13', 0, '2017-11-10', '', '0000-00-00'),
(995, 'BossFX170101128-12', 1128, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'zulckarab@gmail.com', '', '2017-10-10 20:29:07', 1, '2017-11-10', '', '0000-00-00'),
(996, 'BossFX170101129-28', 1129, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'kknchite@yahoo.com', '', '2017-10-10 20:49:08', 1, '2017-11-10', '', '0000-00-00'),
(997, 'BossFX170101130-22', 1130, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'amarp4556@gmail.com', 'amarp4556@gmail.com', '2017-10-11 00:19:09', 1, '2017-11-10', '', '0000-00-00'),
(998, 'BossFX170101131-28', 1131, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'mdapit229@gmail.com', '', '2017-10-11 00:43:42', 1, '2017-11-10', '', '0000-00-00'),
(999, 'BossFX170101132-22', 1132, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'mdapit229@gmail.com', '', '2017-10-11 00:54:59', 1, '2017-11-10', '', '0000-00-00'),
(1000, 'BossFX170101133-88', 1133, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'zimkhithamahlakahlaka@gmail.com', '', '2017-10-11 04:11:29', 1, '2017-11-10', '', '0000-00-00'),
(1001, 'BossFX170101134-76', 1134, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'tmamakhetha@gmail.com', '', '2017-10-11 11:36:14', 1, '2017-11-10', '', '0000-00-00'),
(1002, 'BossFX170101135-91', 1135, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'nesimakazole@gmail.com', 'nesimakazole@gmail.com', '2017-10-12 06:57:00', 1, '2017-11-11', '', '0000-00-00'),
(1003, 'BossFX170101136-75', 1136, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'makhobeng.jn@gmail.com', '', '2017-10-12 08:37:55', 1, '2017-11-11', '', '0000-00-00'),
(1004, 'BossFX170101137-22', 1137, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'Mbakanyid@gmail.com', '', '2017-10-12 11:55:38', 1, '2017-11-11', '', '0000-00-00'),
(1005, 'BossFX170101138-83', 1138, 1, 1, '0.00', '0.00', '0.55', '1', 'USD', 'Free', 0, 'sikander.cassim97@gmail.com', 'sikander.cassim97@gmail.com', '2017-10-12 13:52:41', 1, '2017-11-12', '', '0000-00-00'),
(1006, 'BossFX170101139-68', 1139, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'eumaans@gmail.com', 'eumaans@gmail.com', '2017-10-12 16:25:19', 1, '2017-11-12', '', '0000-00-00'),
(1007, 'BossFX170101140-10', 1140, 1, 1, '0.00', '0.00', '0.61', '1', 'USD', 'Free', 0, 'linwellpeters@gmail.com', 'linwellpeters@gmail.com', '2017-10-13 16:07:40', 1, '2017-11-13', '', '0000-00-00'),
(1008, 'BossFX170101141-78', 1141, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'Mohamed.nafiu@outlook.com', '', '2017-10-13 23:28:06', 1, '2017-11-13', '', '0000-00-00'),
(1009, 'BossFX170301142-13', 1142, 3, 1, '1303400.00', '0.00', '1303485.00', '85', 'IDR', 'bank', 0, 'zakutebal@gmail.com', '', '2017-10-14 02:28:28', 0, '2017-11-13', '', '0000-00-00'),
(1010, 'BossFX170101143-54', 1143, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'Surya@gmail.com', 'Surya@gmail.com', '2017-10-14 04:05:12', 1, '2017-11-13', '', '0000-00-00'),
(1011, 'BossFX170101144-32', 1144, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'uligan1@gmail.com', 'zan_24@live.com', '2017-10-14 15:03:47', 1, '2017-11-14', '', '0000-00-00'),
(1012, 'BossFX170101145-04', 1145, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'jorgefidelis@hotmail.com', 'jorgefidelis@hotmail.com', '2017-10-15 05:44:50', 1, '2017-11-14', '', '0000-00-00'),
(1013, 'BossFX170101146-96', 1146, 1, 1, '0.00', '0.00', '0.96', '1', 'USD', 'Free', 0, 'Mzwandileb@gmail.com', 'mzwandileb10@gmail.com', '2017-10-15 11:17:00', 1, '2017-11-14', '', '0000-00-00'),
(1014, 'BossFX170101147-92', 1147, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'Imma.website@gmail.com', '', '2017-10-15 12:31:38', 1, '2017-11-15', '', '0000-00-00'),
(1015, 'BossFX170101148-19', 1148, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'djamilo.ferreira@hotmail.com', 'djamilo87@gmail.com', '2017-10-16 12:49:30', 1, '2017-11-16', '', '0000-00-00'),
(1016, 'BossFX170101149-23', 1149, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'aayakasai17@gmail.com', 'aayakasai17@gmail.com', '2017-10-18 03:43:43', 1, '2017-11-17', '', '0000-00-00'),
(1017, 'BossFX170101150-46', 1150, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'abubakarauwal5@gmail.com', '', '2017-10-18 04:04:41', 1, '2017-11-17', '', '0000-00-00'),
(1018, 'BossFX170101151-35', 1151, 1, 1, '0.00', '0.00', '0.92', '1', 'USD', 'Free', 0, 'jepollox1985@gmail.com', 'jepollox1985@gmail.com', '2017-10-18 06:55:13', 1, '2017-11-17', '', '0000-00-00'),
(1019, 'BossFX170301152-32', 1152, 3, 1, '98.00', '0.00', '98.74', '1', 'USD', 'paypal', 0, 'nordartur@gmail.com', 'nordarturnelly@gmail.com', '2017-10-18 07:01:33', 0, '2017-11-17', '', '0000-00-00'),
(1020, 'BossFX170101153-57', 1153, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'simphiwe.shane@yahoo.com', '', '2017-10-18 22:13:02', 1, '2017-11-18', '', '0000-00-00'),
(1021, 'BossFX170101154-24', 1154, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'mahendratraderfx@gmail.com', '', '2017-10-19 00:06:12', 1, '2017-11-18', '', '0000-00-00'),
(1022, 'BossFX170101155-24', 1155, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'bossfxsignal@gmail.com', '', '2017-10-19 00:09:46', 1, '2017-11-18', '', '0000-00-00'),
(1023, 'BossFX170101156-32', 1156, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-10-19 00:26:33', 1, '2017-11-18', '', '0000-00-00'),
(1024, 'BossFX170101157-23', 1157, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'jayantaranyoman@gmail.com', 'bossfxsignal@gmail.com', '2017-10-19 00:38:30', 1, '2017-11-18', '', '0000-00-00'),
(1025, 'BossFX170201158-41', 1158, 2, 1, '651700.00', '0.00', '651796.00', '96', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-10-19 00:42:21', 0, '2017-11-18', '', '0000-00-00'),
(1026, 'BossFX170101159-63', 1159, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'Kutulisme@gmail.com', 'Adul', '2017-10-19 00:46:28', 1, '2017-11-18', '', '0000-00-00'),
(1027, 'BossFX170101160-02', 1160, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'powderlisa@gmail.com', 'powderlisa@gmail.com', '2017-10-19 01:02:19', 1, '2017-11-18', '', '0000-00-00'),
(1028, 'BossFX170101161-25', 1161, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'lonelymalik@hotmail.com', 'lonelymalik@hotmail.com', '2017-10-19 02:15:36', 1, '2017-11-18', '', '0000-00-00'),
(1029, 'BossFX170101162-31', 1162, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'Tristan.olivier@icloud.com', '', '2017-10-19 03:07:28', 1, '2017-11-18', '', '0000-00-00'),
(1030, 'BossFX170101163-12', 1163, 1, 1, '0.00', '0.00', '0.55', '1', 'USD', 'Free', 0, 'mingwei97966535@gmail.com', '', '2017-10-19 12:47:29', 1, '2017-11-19', '', '0000-00-00'),
(1031, 'BossFX170101164-98', 1164, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'roogy95@gmail.com', '', '2017-10-19 23:04:07', 1, '2017-11-19', '', '0000-00-00'),
(1032, 'BossFX170101165-68', 1165, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'mngunithemba@gmail.com', 'mngunithemba@gmail.com', '2017-10-20 00:02:10', 1, '2017-11-19', '', '0000-00-00'),
(1033, 'BossFX170101166-47', 1166, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 'jointhand10s@hotmail.com', '', '2017-10-20 00:03:48', 1, '2017-11-19', '', '0000-00-00'),
(1034, 'BossFX170101167-59', 1167, 1, 1, '0.00', '0.00', '0.92', '1', 'USD', 'Free', 0, 'heroes2301mauro@gmail.com', 'heroes2301mauro@gmail.com', '2017-10-20 00:06:11', 1, '2017-11-19', '', '0000-00-00'),
(1035, 'BossFX170101168-73', 1168, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'kgaugelo.mogoiwa@gmail.com', '', '2017-10-20 00:14:56', 1, '2017-11-19', '', '0000-00-00'),
(1036, 'BossFX170101169-78', 1169, 1, 1, '0.00', '0.00', '0.85', '1', 'USD', 'Free', 0, 'aminyahya346@yahoo.com', 'aminyahya346@yahoo.com', '2017-10-20 04:45:15', 1, '2017-11-19', '', '0000-00-00'),
(1037, 'BossFX170101170-42', 1170, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'wijenayakaict@outlook.com', 'Sanjayawijenayaka@gmail.com', '2017-10-20 13:44:10', 1, '2017-11-20', '', '0000-00-00'),
(1038, 'BossFX170101171-44', 1171, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'ayanna-archie@live.com', 'ayanna-archie@live.com', '2017-10-20 16:23:05', 1, '2017-11-20', '', '0000-00-00'),
(1039, 'BossFX170201172-78', 1172, 2, 1, '49.00', '0.00', '49.46', '0', 'USD', 'paypal', 0, 'ayanna-archie@live.com', 'ayanna-archie@live.com', '2017-10-20 16:28:22', 0, '2017-11-20', '', '0000-00-00'),
(1040, 'BossFX170101173-96', 1173, 1, 1, '0.00', '0.00', '0.37', '0', 'USD', 'Free', 0, 'ayanna-archie@live.com', 'ayanna-archie@live.com', '2017-10-20 17:45:59', 1, '2017-11-20', '', '0000-00-00'),
(1041, 'BossFX170201174-44', 1174, 2, 1, '49.00', '0.00', '49.54', '1', 'USD', 'paypal', 0, 'ayanna-archie@live.com', 'ayanna-archie@live.com', '2017-10-21 09:09:46', 0, '2017-11-20', '', '0000-00-00'),
(1042, 'BossFX170101175-55', 1175, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'nazirulmokhat@gmail.com', 'gmail', '2017-10-21 13:41:06', 1, '2017-11-21', '', '0000-00-00'),
(1043, 'BossFX170101176-42', 1176, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'SIMONE@STUDIOCAMPOLUNGHI.IT', '', '2017-10-24 06:01:36', 1, '2017-11-23', '', '0000-00-00'),
(1044, 'BossFX170101177-72', 1177, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'vmazini@gmail.com', 'vmazini@gmail.com', '2017-10-24 20:48:13', 1, '2017-11-24', '', '0000-00-00'),
(1045, 'BossFX170101178-48', 1178, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'sunnylhleow@gmail.com', 'sunny@leonett.com', '2017-10-25 10:38:08', 1, '2017-11-24', '', '0000-00-00'),
(1046, 'BossFX170101179-94', 1179, 1, 1, '0.00', '0.00', '0.73', '1', 'USD', 'Free', 0, 'stas4902050@gmail.com', '', '2017-10-25 11:14:52', 1, '2017-11-24', '', '0000-00-00'),
(1047, 'BossFX170101180-36', 1180, 1, 1, '0.00', '0.00', '0.99', '1', 'USD', 'Free', 0, 'thabishodibane@gmail.com', '', '2017-10-25 22:12:28', 1, '2017-11-25', '', '0000-00-00'),
(1048, 'BossFX170101181-93', 1181, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'muehammadielham@gmail.com', 'muehammadielham@gmail.com', '2017-10-26 17:50:17', 1, '2017-11-26', '', '0000-00-00'),
(1049, 'BossFX170301182-94', 1182, 3, 1, '98.45', '0.00', '98.45', '0', 'USD', 'transfer paypal', 0, 'simone@studiocampolunghi.it', 'simone@studiocampolunghi.it', '2017-10-27 14:10:04', 1, '2017-11-27', '', '2017-10-27'),
(1050, 'BossFX170101183-64', 1183, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'lester.dragon1978@gmail.com', '', '2017-10-27 20:56:35', 1, '2017-11-27', '', '0000-00-00'),
(1051, 'BossFX170101184-33', 1184, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'monamonaz@yahoo.com', 'monamonaz@yahoo.com', '2017-10-28 01:53:28', 1, '2017-11-27', '', '0000-00-00'),
(1052, 'BossFX170101185-75', 1185, 1, 1, '0.00', '0.00', '0.85', '1', 'USD', 'Free', 0, 'a.main1998@outlook.com', 'a.main@village-lettings.co.uk', '2017-10-28 05:40:11', 1, '2017-11-27', '', '0000-00-00'),
(1053, 'BossFX170101186-56', 1186, 1, 1, '0.00', '0.00', '0.86', '1', 'USD', 'Free', 0, 'siti339@gmail.com', 'Siti339@gmail.com', '2017-10-28 09:14:42', 1, '2017-11-27', '', '0000-00-00'),
(1054, 'BossFX170101187-92', 1187, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'Prashant.korat13@gmail.com', '', '2017-10-28 09:18:22', 1, '2017-11-27', '', '0000-00-00'),
(1055, 'BossFX170101188-14', 1188, 1, 1, '0.00', '0.00', '0.92', '1', 'USD', 'Free', 0, 'zam47059@gmail.com', 'zam47059@gmail.com', '2017-10-28 09:18:39', 1, '2017-11-27', '', '0000-00-00'),
(1056, 'BossFX170101189-50', 1189, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'edyahya38@gmail.com', '', '2017-10-28 09:22:58', 1, '2017-11-27', '', '0000-00-00'),
(1057, 'BossFX170101190-44', 1190, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'npulte@web.de', 'npulte@web.de', '2017-10-28 09:29:39', 1, '2017-11-27', '', '0000-00-00'),
(1058, 'BossFX170101191-31', 1191, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'roezlanvii@yahoo.com', 'roezlanvii@yajoo.com', '2017-10-28 10:19:19', 1, '2017-11-27', '', '0000-00-00'),
(1059, 'BossFX170101192-27', 1192, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'emprendeplusrd@gmail.com', 'emprendeplusrd@gmail.com', '2017-10-28 11:40:29', 1, '2017-11-27', '', '0000-00-00'),
(1060, 'BossFX170101193-64', 1193, 1, 1, '0.00', '0.00', '0.70', '1', 'USD', 'Free', 0, 'arsala.toru@gmail.com', '', '2017-10-28 14:47:10', 1, '2017-11-28', '', '0000-00-00'),
(1061, 'BossFX170101194-84', 1194, 1, 1, '0.00', '0.00', '0.85', '1', 'USD', 'Free', 0, 'forex5567@gmail.com', 'Na', '2017-10-28 21:02:18', 1, '2017-11-28', '', '0000-00-00'),
(1062, 'BossFX170101195-96', 1195, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'Ahmad.faizul@gmail.com', '', '2017-10-28 21:48:02', 1, '2017-11-28', '', '0000-00-00'),
(1063, 'BossFX170101196-38', 1196, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'Muhammadfakhrullahmahmud@gmail.com', '', '2017-10-29 00:58:17', 1, '2017-11-28', '', '0000-00-00'),
(1064, 'BossFX170101197-01', 1197, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'fidelialathifa@gmail.com', '', '2017-10-29 08:18:39', 1, '2017-11-28', '', '0000-00-00'),
(1065, 'BossFX170101198-67', 1198, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'salehasalleh110@gmail.com', 'salehasalleh110@gmail.com', '2017-10-29 13:00:40', 1, '2017-11-29', '', '0000-00-00'),
(1066, 'BossFX170101199-34', 1199, 1, 1, '0.00', '0.00', '0.88', '1', 'USD', 'Free', 0, 'salehasalleh110@gmail.com', 'salehasalleh110@gmail.com', '2017-10-29 13:03:38', 1, '2017-11-29', '', '0000-00-00'),
(1067, 'BossFX170101200-12', 1200, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'md.ishak3016@gmail.com', '', '2017-10-29 14:24:26', 1, '2017-11-29', '', '0000-00-00'),
(1068, 'BossFX170301201-61', 1201, 3, 1, '98.00', '0.00', '98.28', '0', 'USD', 'paypal', 0, 'boses0909@gmail.com', 'boses0909@gmail.com', '2017-10-29 23:07:51', 0, '2017-11-29', '', '0000-00-00'),
(1069, 'BossFX170201202-07', 1202, 2, 1, '651700.00', '0.00', '651721.00', '21', 'IDR', 'bank', 0, 'gerysunur@gmail.com', 'gerysunur@gmail.com', '2017-10-30 22:24:43', 0, '2017-11-30', '', '0000-00-00'),
(1070, 'BossFX170401203-78', 1203, 4, 1, '149.29', '0.00', '149.29', '0', 'USD', 'transfer paypal', 0, 'sunnylhleow@gmail.com', 'sunny@leonett.com', '2017-11-01 12:02:11', 1, '2017-12-01', '', '2017-10-31'),
(1071, 'BossFX170201204-86', 1204, 2, 1, '49.45', '0.00', '49.45', '0', 'USD', 'transfer paypal', 0, 'kobuswart@hotmail.com', 'opacity@webmail.co.za', '2017-11-01 13:10:53', 1, '2017-12-01', '', '2017-11-01'),
(1072, 'BossFX170301205-74', 1205, 3, 1, '98.00', '0.00', '98.50', '1', 'USD', 'paypal', 0, 'stas4902050@gmail.com', 'stas4902050@gmail.com', '2017-11-01 15:18:56', 0, '2017-12-01', '', '0000-00-00'),
(1073, 'BossFX170301206-10', 1206, 3, 1, '1303400.00', '0.00', '1303449.00', '49', 'IDR', 'bank', 0, '45555@gmail.com', '', '2017-11-01 16:36:09', 0, '2017-12-01', '', '0000-00-00'),
(1074, 'BossFX170101207-62', 1207, 1, 1, '0.00', '0.00', '0.98', '1', 'USD', 'Free', 0, 'msis81@gmail.com', 'msis81@gmail.com', '2017-11-01 20:46:19', 1, '2017-12-01', '', '0000-00-00'),
(1075, 'BossFX170301208-09', 1208, 3, 1, '98.17', '0.00', '98.17', '0', 'USD', 'transfer paypal', 0, 'stas4902050@gmail.com', 'stas4902050@gmail.com', '2017-11-02 02:48:55', 1, '2017-12-01', '', '2017-11-01'),
(1076, 'BossFX170101209-42', 1209, 1, 1, '0.00', '0.00', '0.24', '0', 'USD', 'Free', 0, 'Wahyukahfie1997@gmail.com', '', '2017-11-02 11:20:10', 1, '2017-12-01', '', '0000-00-00'),
(1077, 'BossFX170101210-29', 1210, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'taleeto@gmail.com', 'jtnoura24@gmail.com', '2017-11-02 19:55:25', 1, '2017-12-02', '', '0000-00-00'),
(1078, 'BossFX170101211-88', 1211, 1, 1, '0.00', '0.00', '0.75', '1', 'USD', 'Free', 0, 'aamedimran@gmail.com', 'aamedimran@gmail.com', '2017-11-03 10:00:54', 1, '2017-12-02', '', '0000-00-00'),
(1079, 'BossFX170201212-34', 1212, 2, 1, '49.00', '0.00', '49.53', '1', 'USD', 'paypal', 0, 'Mvidhaadh@gmail.com', 'Vidhaadh@hotmail.com', '2017-11-03 18:44:23', 0, '2017-12-03', '', '0000-00-00'),
(1080, 'BossFX170201213-51', 1213, 2, 1, '49.30', '0.00', '49.30', '0', 'USD', 'transfer paypal', 0, 'Mvidhaadh@gmail.com', 'Vidhaadh@hotmail.com', '2017-11-03 18:50:54', 1, '2017-12-03', '', '2017-11-03'),
(1081, 'BossFX170101214-95', 1214, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'farid_selamat@yahoo.com', 'farid_selamat@yahoo.com', '2017-11-05 10:51:10', 1, '2017-12-04', '', '0000-00-00'),
(1082, 'BossFX170101215-61', 1215, 1, 1, '0.00', '0.00', '0.33', '0', 'USD', 'Free', 0, 'muriithiderrick97@gmail.com', '', '2017-11-05 13:50:06', 1, '2017-12-05', '', '0000-00-00'),
(1083, 'BossFX170101216-08', 1216, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'yincheng_0819@hotmail.com', 'yincheng_0819@hotmail.com', '2017-11-06 02:46:53', 1, '2017-12-05', '', '0000-00-00'),
(1084, 'BossFX170101217-22', 1217, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'Shahidmcom3@hotmail.com', 'Shahidmcom3@hotmail.com', '2017-11-06 03:55:25', 1, '2017-12-05', '', '0000-00-00'),
(1085, 'BossFX170101218-02', 1218, 1, 1, '0.00', '0.00', '0.88', '1', 'USD', 'Free', 0, 'Shahidmcom3@hotmail.com', '', '2017-11-06 05:04:48', 1, '2017-12-05', '', '0000-00-00'),
(1086, 'BossFX170101219-85', 1219, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'Mariafionawati@gmail.com', '', '2017-11-06 11:23:47', 1, '2017-12-05', '', '0000-00-00'),
(1087, 'BossFX170401220-99', 1220, 4, 1, '149.81', '0.00', '149.81', '1', 'USD', 'transfer paypal', 0, 'mg0502734393@gmail.com', 'mg0502734393@gmail.com', '2017-11-06 17:37:50', 1, '2017-12-06', '', '2017-11-06'),
(1088, 'BossFX170101221-54', 1221, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'bonelis@gmail.com', 'bonelis@gmail.com', '2017-11-07 04:49:09', 1, '2017-12-06', '', '0000-00-00'),
(1089, 'BossFX170101222-61', 1222, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'Jampank.dz29@gmail.com', 'Paypal.me/ZAMPARA', '2017-11-07 04:57:35', 1, '2017-12-06', '', '0000-00-00'),
(1090, 'BossFX170101223-74', 1223, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'n.pradeepkumar90@yahoo.com', 'n.pradeepkumar90@yahoo.com', '2017-11-07 15:46:32', 1, '2017-12-07', '', '0000-00-00'),
(1091, 'BossFX170301224-44', 1224, 3, 1, '1303400.00', '0.00', '1303429.00', '29', 'IDR', 'bank', 0, 'Mariafionawati@gmail.com', '', '2017-11-07 22:31:37', 0, '2017-12-07', '', '0000-00-00'),
(1092, 'BossFX170101225-99', 1225, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'matlawa.kganyago@gmail.com', 'matlawa.kganyago@gmail.com', '2017-11-07 23:40:53', 1, '2017-12-07', '', '0000-00-00'),
(1093, 'BossFX170101226-63', 1226, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'Malikyasir4668@gmail.com', '', '2017-11-07 23:53:07', 1, '2017-12-07', '', '0000-00-00'),
(1094, 'BossFX170101227-66', 1227, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'dimafirestein@gmail.com', '', '2017-11-08 00:44:41', 1, '2017-12-07', '', '0000-00-00'),
(1095, 'BossFX170101228-79', 1228, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'kroz755@yahoo.com', 'kroz755@yahoo.com', '2017-11-08 01:11:24', 1, '2017-12-07', '', '0000-00-00'),
(1096, 'BossFX170101229-58', 1229, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'archie.batshameki@gmail.com', 'archie.batshameki@gmail.com', '2017-11-08 01:15:54', 1, '2017-12-07', '', '0000-00-00'),
(1097, 'BossFX170101230-68', 1230, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'mercantile.alex23@gmail.com', 'mercantile.alex23@gmail.com', '2017-11-08 01:41:50', 1, '2017-12-07', '', '0000-00-00'),
(1098, 'BossFX170201231-56', 1231, 2, 1, '49.00', '0.00', '49.42', '0', 'USD', 'paypal', 0, 'msjojo63@gmail.com', 'msjojo63@gmail.com', '2017-11-08 05:16:28', 0, '2017-12-07', '', '0000-00-00'),
(1099, 'BossFX170101232-67', 1232, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'Jampank.dz29@gmail.com', 'Jampank.dz29@gmail.com', '2017-11-08 13:20:57', 1, '2017-12-08', '', '0000-00-00'),
(1100, 'BossFX170101233-26', 1233, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'supangsweet@gmail.com', 'supangsweet@gmail.com', '2017-11-08 21:47:26', 1, '2017-12-08', '', '0000-00-00'),
(1101, 'BossFX170201234-37', 1234, 2, 1, '49.00', '0.00', '49.93', '1', 'USD', 'paypal', 0, 'kunalan143@gmail.com', 'kunalan143@gmail.com', '2017-11-08 22:08:38', 0, '2017-12-08', '', '0000-00-00'),
(1102, 'BossFX170101235-60', 1235, 1, 1, '0.00', '0.00', '0.90', '1', 'USD', 'Free', 0, 'tenblocks@yahoo.com.my', 'tenblocks@yahoo.com.my', '2017-11-09 07:02:12', 1, '2017-12-08', '', '0000-00-00'),
(1103, 'BossFX170101236-48', 1236, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'elagussoni@gmail.com', 'elagussoni@gmail.com', '2017-11-09 07:56:06', 1, '2017-12-08', '', '0000-00-00'),
(1104, 'BossFX170101237-49', 1237, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'fluccerini@gmail.com', '', '2017-11-09 08:57:17', 1, '2017-12-08', '', '0000-00-00'),
(1105, 'BossFX170101238-09', 1238, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'elagussoni@gmail.com', 'elagussoni@gmail.com', '2017-11-09 09:16:30', 1, '2017-12-08', '', '0000-00-00'),
(1106, 'BossFX170101239-87', 1239, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'Shaan-143.r@hotmail.com', 'Shaaannn77@gmail.com', '2017-11-09 23:22:36', 1, '2017-12-09', '', '0000-00-00'),
(1107, 'BossFX170101240-69', 1240, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'Mpigeot7@gmail.com', 'marven.christ@yahoo.com', '2017-11-10 03:56:51', 1, '2017-12-09', '', '0000-00-00'),
(1108, 'BossFX170101241-55', 1241, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'Bajidmountassir@gmail.com', '', '2017-11-10 13:37:27', 1, '2017-12-10', '', '0000-00-00'),
(1109, 'BossFX170101242-52', 1242, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'lfhaa2011@gmail.com', '', '2017-11-10 14:51:04', 1, '2017-12-10', '', '0000-00-00'),
(1110, 'BossFX170101243-67', 1243, 1, 1, '0.00', '0.00', '0.87', '1', 'USD', 'Free', 0, 'vaishakh_balan@yahoo.com', 'vaishakh_balan@yahoo.com', '2017-11-11 08:07:48', 1, '2017-12-10', '', '0000-00-00'),
(1111, 'BossFX170101244-25', 1244, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'Kingdekshing520@hotmail.com', 'Kingdekshing520@hotmail.com', '2017-11-12 06:58:47', 1, '2017-12-11', '', '0000-00-00'),
(1112, 'BossFX170101245-36', 1245, 1, 1, '0.00', '0.00', '0.55', '1', 'USD', 'Free', 0, 'monirabuhamad4@gmail.com', 'monir20172018@gmail.com', '2017-11-12 07:02:40', 1, '2017-12-11', '', '0000-00-00'),
(1113, 'BossFX170101246-89', 1246, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'Jampank.dz29@gmail.com', 'Paypal.me/dikizampara', '2017-11-13 06:22:16', 1, '2017-12-12', '', '0000-00-00'),
(1114, 'BossFX170101247-53', 1247, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'lfhaa2011@gmail.com', '', '2017-11-13 13:05:38', 1, '2017-12-13', '', '0000-00-00'),
(1115, 'BossFX170101248-91', 1248, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'giannatz.g@gmail.com', 'giannatz@libero.it', '2017-11-14 06:11:30', 1, '2017-12-13', '', '0000-00-00'),
(1116, 'BossFX170101249-71', 1249, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'ardilawet.wlg99@gmail.com', '', '2017-11-15 04:36:16', 1, '2017-12-14', '', '0000-00-00'),
(1117, 'BossFX170101250-35', 1250, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'rutholuwabunmi@gmail.com', '', '2017-11-15 04:57:08', 1, '2017-12-14', '', '0000-00-00'),
(1118, 'BossFX170401251-50', 1251, 4, 1, '149.57', '0.00', '149.57', '1', 'USD', 'transfer paypal', 0, 'daniele.palazzoli@gmail.com', 'daniele.palazzoli@gmail.com', '2017-11-15 06:04:35', 1, '2017-12-14', '', '2017-11-14'),
(1119, 'BossFX170101252-61', 1252, 1, 1, '0.00', '0.00', '0.88', '1', 'USD', 'Free', 0, 'Pieter.shandy@gmail.com', 'Pieter.shandy@gmail.com', '2017-11-15 21:14:27', 1, '2017-12-15', '', '0000-00-00'),
(1120, 'BossFX170101253-55', 1253, 1, 1, '0.00', '0.00', '0.26', '0', 'USD', 'Free', 0, 'sphesihlebrian@gmail.com', 'sphesihlebrian@gmail.com', '2017-11-15 23:59:04', 1, '2017-12-15', '', '0000-00-00'),
(1121, 'BossFX170101254-67', 1254, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'bardya_514@hotmail.com', 'bardya_514@hotmail.com', '2017-11-16 00:16:59', 1, '2017-12-15', '', '0000-00-00'),
(1122, 'BossFX170201255-38', 1255, 2, 1, '49.00', '0.00', '49.64', '1', 'USD', 'paypal', 0, 'bertrand_martin_@hotmail.com', 'bertrand_martin_@hotmail.com', '2017-11-16 04:37:44', 0, '2017-12-15', '', '0000-00-00'),
(1123, 'BossFX170101256-77', 1256, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'npulte@web.de', 'Npulte@web.de', '2017-11-16 05:49:26', 1, '2017-12-15', '', '0000-00-00'),
(1124, 'BossFX170301257-26', 1257, 3, 1, '1582700.00', '0.00', '1582748.00', '48', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-11-16 21:39:37', 0, '2017-12-16', '', '0000-00-00'),
(1125, 'BossFX170301258-14', 1258, 3, 1, '119.00', '0.00', '119.91', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-11-16 21:43:20', 0, '2017-12-16', '', '0000-00-00'),
(1126, 'BossFX170101259-04', 1259, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'aaccppoo8787@gmail.com', '', '2017-11-16 22:47:56', 1, '2017-12-16', '', '0000-00-00'),
(1127, 'BossFX170101260-25', 1260, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'aaccppoo8787@gmail.com', '', '2017-11-16 23:18:06', 1, '2017-12-16', '', '0000-00-00');
INSERT INTO `payment_logs` (`ID`, `invoice_no`, `userid`, `idplan`, `idduration`, `amount`, `discount`, `amountsum`, `code_unique`, `currency_code`, `payment_channel`, `timestamp`, `email`, `email_paypal`, `deadline_pay`, `is_pay`, `exp_service`, `transfer_proof`, `date_pay`) VALUES
(1128, 'BossFX170101261-08', 1261, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'domeyhalim@gmail.com', '', '2017-11-16 23:48:20', 1, '2017-12-16', '', '0000-00-00'),
(1129, 'BossFX170101262-79', 1262, 1, 1, '0.00', '0.00', '0.94', '1', 'USD', 'Free', 0, 'siti339@gmail.com', 'Siti339@gmail.com', '2017-11-16 23:55:21', 1, '2017-12-16', '', '0000-00-00'),
(1130, 'BossFX170101263-77', 1263, 1, 1, '0.00', '0.00', '0.78', '1', 'USD', 'Free', 0, 'sbs.wawan@gmail.com', '', '2017-11-17 00:05:04', 1, '2017-12-16', '', '0000-00-00'),
(1131, 'BossFX170101264-67', 1264, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'thesampathnuwan@gmail.com', 'Engsampathnk@gmail.com', '2017-11-17 00:08:36', 1, '2017-12-16', '', '0000-00-00'),
(1132, 'BossFX170101265-94', 1265, 1, 1, '0.00', '0.00', '0.82', '1', 'USD', 'Free', 0, 'hilmiishukrii@gmail.com', 'allstar.gadget.store@gmail.com', '2017-11-17 00:10:24', 1, '2017-12-16', '', '0000-00-00'),
(1133, 'BossFX170101266-10', 1266, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'Bataf58@gmail.com', 'Bataf58@gmail..com', '2017-11-17 00:31:52', 1, '2017-12-16', '', '0000-00-00'),
(1134, 'BossFX170101267-59', 1267, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'tonpemahes@yahoo.co.in', '', '2017-11-17 00:35:52', 1, '2017-12-16', '', '0000-00-00'),
(1135, 'BossFX170101268-87', 1268, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'victor.moroaswi@gmail.com', 'victor.moroaswi@gmail.com', '2017-11-17 00:54:27', 1, '2017-12-16', '', '0000-00-00'),
(1136, 'BossFX170101269-96', 1269, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'datuherman00@gmail.com', 'datuherman00@gmail.com', '2017-11-17 01:09:39', 1, '2017-12-16', '', '0000-00-00'),
(1137, 'BossFX170101270-16', 1270, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'herman_mauseng@rocketmail.com', '', '2017-11-17 01:17:44', 1, '2017-12-16', '', '0000-00-00'),
(1138, 'BossFX170101271-11', 1271, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'kroz755@yahoo.com', '', '2017-11-17 01:21:59', 1, '2017-12-16', '', '0000-00-00'),
(1139, 'BossFX170101272-43', 1272, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'fuad1985fuad@gmail.com', '', '2017-11-17 03:00:20', 1, '2017-12-16', '', '0000-00-00'),
(1140, 'BossFX170101273-95', 1273, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'hermawan.henri50@gmail.com', 'hermawan.henri50@gmail.com', '2017-11-17 03:51:04', 1, '2017-12-16', '', '0000-00-00'),
(1141, 'BossFX170101274-53', 1274, 1, 1, '0.00', '0.00', '0.60', '1', 'USD', 'Free', 0, 'svdboss21@gmail.com', 'svdboss21@gmail.com', '2017-11-17 04:00:57', 1, '2017-12-16', '', '0000-00-00'),
(1142, 'BossFX170101275-29', 1275, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'svdboss21@gmail.com', 'svdboss21@gmail.com', '2017-11-17 04:22:29', 1, '2017-12-16', '', '0000-00-00'),
(1143, 'BossFX170101276-04', 1276, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'Usafshaheen711@gmail.com', 'Usafsherrr@gmail.com', '2017-11-17 04:27:33', 1, '2017-12-16', '', '0000-00-00'),
(1144, 'BossFX170101277-82', 1277, 1, 1, '0.00', '0.00', '0.29', '0', 'USD', 'Free', 0, 'karimsivle120@gmail.com', 'Karimsivle120@gmail.com', '2017-11-17 04:55:30', 1, '2017-12-16', '', '0000-00-00'),
(1145, 'BossFX170101278-47', 1278, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'ibrahim20755@gmail.com', '', '2017-11-17 08:53:53', 1, '2017-12-16', '', '0000-00-00'),
(1146, 'BossFX170101279-92', 1279, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 'waqassial@gmail.com', 'waqassial2015@gmail.com', '2017-11-17 09:07:26', 1, '2017-12-16', '', '0000-00-00'),
(1147, 'BossFX170101280-17', 1280, 1, 1, '0.00', '0.00', '0.96', '1', 'USD', 'Free', 0, 'drmusammb@gmail.com', 'Drmusammb@gmail.com', '2017-11-17 12:57:19', 1, '2017-12-17', '', '0000-00-00'),
(1148, 'BossFX170101281-00', 1281, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'ibrahimzadeh.i@gmail.com', 'ibrahimzadeh.i@gmail.com', '2017-11-17 13:00:48', 1, '2017-12-17', '', '0000-00-00'),
(1149, 'BossFX170101282-89', 1282, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'ashfiz71@gmail.com', 'ashfiz71@gmail.com', '2017-11-17 19:16:16', 1, '2017-12-17', '', '0000-00-00'),
(1150, 'BossFX170101283-19', 1283, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'Stanley4561@yahoo.com', 'Stanley4561@yahoo.com', '2017-11-17 21:56:39', 1, '2017-12-17', '', '0000-00-00'),
(1151, 'BossFX170101284-51', 1284, 1, 1, '0.00', '0.00', '0.32', '0', 'USD', 'Free', 0, 'yusrieameer17@gmail.com', 'yusrieameer17@gmail.com', '2017-11-17 22:16:23', 1, '2017-12-17', '', '0000-00-00'),
(1152, 'BossFX170101285-71', 1285, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'svdboss21@gmail.com', 'svdboss21@gmail.com', '2017-11-18 00:19:46', 1, '2017-12-17', '', '0000-00-00'),
(1153, 'BossFX170101286-61', 1286, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'Kevinmaulana6693@gmail.com', 'Kevinmaulana6693@gmail.com', '2017-11-18 03:12:47', 1, '2017-12-17', '', '0000-00-00'),
(1154, 'BossFX170101287-25', 1287, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'femme_007@outlook.com', '', '2017-11-18 06:04:17', 1, '2017-12-17', '', '0000-00-00'),
(1155, 'BossFX170101288-29', 1288, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'Mohammedsalah1@live.com', 'Mohammedsalah1@live.com', '2017-11-18 07:29:56', 1, '2017-12-17', '', '0000-00-00'),
(1156, 'BossFX170101289-19', 1289, 1, 1, '0.00', '0.00', '0.54', '1', 'USD', 'Free', 0, 'fifo97@hotmail.it', '', '2017-11-18 09:49:14', 1, '2017-12-17', '', '0000-00-00'),
(1157, 'BossFX170101290-77', 1290, 1, 1, '0.00', '0.00', '0.75', '1', 'USD', 'Free', 0, 'rezuanfx82@gmail.com', '', '2017-11-18 23:19:25', 1, '2017-12-18', '', '0000-00-00'),
(1158, 'BossFX170101291-53', 1291, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'toklaping@gmail.com', 'toklaping@gmail.com', '2017-11-19 02:53:53', 1, '2017-12-18', '', '0000-00-00'),
(1159, 'BossFX170101292-47', 1292, 1, 1, '0.00', '0.00', '0.56', '1', 'USD', 'Free', 0, 'ramiodibat66@gmail.com', 'ramiodibat66@gmail.com', '2017-11-19 03:25:01', 1, '2017-12-18', '', '0000-00-00'),
(1160, 'BossFX170101293-10', 1293, 1, 1, '0.00', '0.00', '0.90', '1', 'USD', 'Free', 0, 'fa_sagar@yahoo.com', '', '2017-11-20 03:28:39', 1, '2017-12-19', '', '0000-00-00'),
(1161, 'BossFX170101294-31', 1294, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'Azidy81@gmail.com', '', '2017-11-20 05:34:33', 1, '2017-12-19', '', '0000-00-00'),
(1162, 'BossFX170101295-10', 1295, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'ameen.vallee@gmail.com', '', '2017-11-21 03:39:32', 1, '2017-12-20', '', '0000-00-00'),
(1163, 'BossFX170101296-64', 1296, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'ramiodibat66@gmail.com', '', '2017-11-22 10:54:36', 1, '2017-12-21', '', '0000-00-00'),
(1164, 'BossFX170101297-13', 1297, 1, 1, '0.00', '0.00', '0.70', '1', 'USD', 'Free', 0, 'Redonedarif@gmail.com', 'Redonedarif@gmail.com', '2017-11-23 18:52:22', 1, '2017-12-23', '', '0000-00-00'),
(1165, 'BossFX170101298-79', 1298, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'Leonel.salazar1720@gmail.com', 'Leonel.salazar1720@gmail.com', '2017-11-23 20:57:11', 1, '2017-12-23', '', '0000-00-00'),
(1166, 'BossFX170101299-37', 1299, 1, 1, '0.00', '0.00', '0.48', '0', 'USD', 'Free', 0, 'buysell@outlook.com.au', '', '2017-11-23 21:19:06', 1, '2017-12-23', '', '0000-00-00'),
(1167, 'BossFX170101300-10', 1300, 1, 1, '0.00', '0.00', '0.83', '1', 'USD', 'Free', 0, 'ezzy.profit@gmail.com', '', '2017-11-23 21:53:15', 1, '2017-12-23', '', '0000-00-00'),
(1168, 'BossFX170101301-54', 1301, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'ameen.vallee@gmail.com', 'ameen.vallee@gmail.com', '2017-11-24 01:10:36', 1, '2017-12-23', '', '0000-00-00'),
(1169, 'BossFX170101302-18', 1302, 1, 1, '0.00', '0.00', '0.73', '1', 'USD', 'Free', 0, 'svdboss21@gmail.com', 'svdboss21@gmail.com', '2017-11-24 02:19:48', 1, '2017-12-23', '', '0000-00-00'),
(1170, 'BossFX170101303-22', 1303, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'Smartmastermind009@yahoo.com', 'Kattyphara@hotmail.com', '2017-11-24 02:48:59', 1, '2017-12-23', '', '0000-00-00'),
(1171, 'BossFX170101304-72', 1304, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'la_dores@yahoo.co.id', '', '2017-11-25 09:13:14', 1, '2017-12-24', '', '0000-00-00'),
(1172, 'BossFX170101305-88', 1305, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'syafiq3083@yahoo.com', '', '2017-11-26 01:26:50', 1, '2017-12-25', '', '0000-00-00'),
(1173, 'BossFX170101306-59', 1306, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'alert.4ndroid@gmail.com', '', '2017-11-26 09:43:16', 1, '2017-12-25', '', '0000-00-00'),
(1174, 'BossFX170101307-44', 1307, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'wsastra117@gmail.com', 'Wsastra117@gmail.com', '2017-11-26 10:56:01', 1, '2017-12-25', '', '0000-00-00'),
(1175, 'BossFX170101308-32', 1308, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'younesberthe@gmail.com', '', '2017-11-26 16:52:36', 1, '2017-12-26', '', '0000-00-00'),
(1176, 'BossFX170101309-84', 1309, 1, 1, '0.00', '0.00', '0.88', '1', 'USD', 'Free', 0, 'Michlam76@gmail.com', 'Michlam76', '2017-11-27 11:05:07', 1, '2017-12-26', '', '0000-00-00'),
(1177, 'BossFX170101310-56', 1310, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'hdarwish75@yahoo.com', 'hdarwish75@yahoo.com', '2017-11-27 13:58:04', 1, '2017-12-27', '', '0000-00-00'),
(1178, 'BossFX170101311-94', 1311, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'mxolisiyaka1@gmail.com', 'myakazeli@yahoo.com', '2017-11-28 02:28:04', 1, '2017-12-27', '', '0000-00-00'),
(1179, 'BossFX170101312-08', 1312, 1, 1, '0.00', '0.00', '0.29', '0', 'USD', 'Free', 0, 'hugo.alejoc@gmail.com', 'hugo.alejoc@gmail.com', '2017-11-28 07:46:20', 1, '2017-12-27', '', '0000-00-00'),
(1180, 'BossFX170101313-72', 1313, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'rodrinot@hotmail.com', 'rodrinot@hotmail.com', '2017-11-28 08:54:22', 1, '2017-12-27', '', '0000-00-00'),
(1181, 'BossFX170101314-32', 1314, 1, 1, '0.00', '0.00', '0.18', '0', 'USD', 'Free', 0, 'Aever770@gmail.com', '', '2017-11-28 11:33:20', 1, '2017-12-27', '', '0000-00-00'),
(1182, 'BossFX170101315-27', 1315, 1, 1, '0.00', '0.00', '0.88', '1', 'USD', 'Free', 0, 'lamita123lamo@gmail.com', 'lamita123lamo@gmail.com', '2017-11-28 17:23:44', 1, '2017-12-28', '', '0000-00-00'),
(1183, 'BossFX170101316-04', 1316, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'jambanemw@gmail.com', 'Jambanemw@gmail.com', '2017-11-28 23:26:07', 1, '2017-12-28', '', '0000-00-00'),
(1184, 'BossFX170401317-78', 1317, 4, 1, '289.00', '0.00', '289.56', '1', 'USD', 'paypal', 0, 'simone@studiocampolunghi.it', 'simone@studiocampolunghi.it', '2017-11-29 07:13:15', 0, '2017-12-28', '', '0000-00-00'),
(1185, 'BossFX170101318-79', 1318, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'kiharagitau@gmail.com', '', '2017-11-29 17:49:35', 1, '2017-12-29', '', '0000-00-00'),
(1186, 'BossFX170101319-92', 1319, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'Levio36@hotmail.com', 'Levi24@hotmail.com', '2017-11-29 18:37:45', 1, '2017-12-29', '', '0000-00-00'),
(1187, 'BossFX170101320-55', 1320, 1, 1, '0.00', '0.00', '0.39', '0', 'USD', 'Free', 0, 'rkiiki2@gmail.com', 'rkiiki2@gmail.com', '2017-11-29 22:05:22', 1, '2017-12-29', '', '0000-00-00'),
(1188, 'BossFX170101321-06', 1321, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'Maelshami@yahoo.com', 'Maelshami@gmail.com', '2017-11-29 22:08:20', 1, '2017-12-29', '', '0000-00-00'),
(1189, 'BossFX170101322-87', 1322, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'muhdkimie4@gmail.com', '', '2017-11-29 22:11:16', 1, '2017-12-29', '', '0000-00-00'),
(1190, 'BossFX170101323-58', 1323, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'nanda8592@gmail.com', '', '2017-11-29 22:23:50', 1, '2017-12-29', '', '0000-00-00'),
(1191, 'BossFX170101324-67', 1324, 1, 1, '0.00', '0.00', '0.76', '1', 'USD', 'Free', 0, 'givenmampane24@gmail.com', '', '2017-11-30 01:11:55', 1, '2017-12-29', '', '0000-00-00'),
(1192, 'BossFX170101325-17', 1325, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'mhaziq.naqiuddin2@gmail.com', '', '2017-11-30 03:19:50', 1, '2017-12-29', '', '0000-00-00'),
(1193, 'BossFX170401326-44', 1326, 4, 1, '3843700.00', '0.00', '3843796.00', '96', 'IDR', 'bank', 0, 'banysb28@gmail.com', '', '2017-11-30 03:21:46', 0, '2017-12-29', '', '0000-00-00'),
(1194, 'BossFX170101327-09', 1327, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'karimsivle120@gmail.com', '', '2017-11-30 08:09:18', 1, '2017-12-29', '', '0000-00-00'),
(1195, 'BossFX170101328-71', 1328, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'Terencenjy@gmail.com', 'Terencenjy@gmail.com', '2017-11-30 08:10:39', 1, '2017-12-29', '', '0000-00-00'),
(1196, 'BossFX170101329-29', 1329, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'vutran.wine@gmail.com', 'vutran.wine@gmail.com', '2017-11-30 08:12:28', 1, '2017-12-29', '', '0000-00-00'),
(1197, 'BossFX170101330-66', 1330, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'thomasdaud20@yahoo.com', 'thomasdaud20@yahoo.com', '2017-11-30 08:21:03', 1, '2017-12-29', '', '0000-00-00'),
(1198, 'BossFX170101331-85', 1331, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'Suloyman35@hotmail.com', 'Suloyman35@hotmail.com', '2017-11-30 08:23:14', 1, '2017-12-29', '', '0000-00-00'),
(1199, 'BossFX170101332-58', 1332, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'uzairismail26@gmail.com', 'uzairismail26@gmail.com', '2017-11-30 08:23:23', 1, '2017-12-29', '', '0000-00-00'),
(1200, 'BossFX170101333-79', 1333, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'ezamhazaman@rocketmail.com', '', '2017-11-30 08:52:49', 1, '2017-12-29', '', '0000-00-00'),
(1201, 'BossFX170101334-00', 1334, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'fidelialathifa@gmail.com', '', '2017-11-30 09:21:48', 1, '2017-12-29', '', '0000-00-00'),
(1202, 'BossFX170101335-35', 1335, 1, 1, '0.00', '0.00', '0.49', '0', 'USD', 'Free', 0, 'ginoangel_@hotmail.com', 'ginoangel_@hotmail.com', '2017-11-30 10:31:16', 1, '2017-12-29', '', '0000-00-00'),
(1203, 'BossFX170101336-69', 1336, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'hafizone1985@yahoo.com', '', '2017-11-30 10:42:37', 1, '2017-12-29', '', '0000-00-00'),
(1204, 'BossFX170101337-98', 1337, 1, 1, '0.00', '0.00', '0.28', '0', 'USD', 'Free', 0, 'Kentrades@outlook.com', 'lee.kenneth@me.com', '2017-11-30 11:10:53', 1, '2017-12-29', '', '0000-00-00'),
(1205, 'BossFX170101338-12', 1338, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'sattar0farex@gmail.com', '', '2017-11-30 15:36:14', 1, '2017-12-30', '', '0000-00-00'),
(1206, 'BossFX170101339-42', 1339, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'zex285@gmail.com', '', '2017-11-30 17:22:30', 1, '2017-12-30', '', '0000-00-00'),
(1207, 'BossFX170101340-93', 1340, 1, 1, '0.00', '0.00', '0.42', '0', 'USD', 'Free', 0, 'vijay.kalwale@gmail.com', '', '2017-12-01 00:25:29', 1, '2017-12-30', '', '0000-00-00'),
(1208, 'BossFX170101341-14', 1341, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'shubhransu.nayak@gmail.com', 'nayaksubhranshu86@gmail.com', '2017-12-01 00:46:56', 1, '2017-12-30', '', '0000-00-00'),
(1209, 'BossFX170101342-61', 1342, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'slimreds21@gmail.com', '', '2017-12-01 01:52:41', 1, '2017-12-30', '', '0000-00-00'),
(1210, 'BossFX170101343-64', 1343, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'pakjudin2016@gmail.con', 'pakjudin2016@gmail.com', '2017-12-01 01:59:05', 1, '2017-12-30', '', '0000-00-00'),
(1211, 'BossFX170101344-76', 1344, 1, 1, '0.00', '0.00', '0.37', '0', 'USD', 'Free', 0, 'Prashant.korat26@gmail.com', '', '2017-12-01 05:11:23', 1, '2017-12-30', '', '0000-00-00'),
(1212, 'BossFX170101345-17', 1345, 1, 1, '0.00', '0.00', '0.99', '1', 'USD', 'Free', 0, 'a.main1998@outlook.com', 'archiedarrenmaimn1998@outlook.com', '2017-12-01 08:00:20', 1, '2017-12-30', '', '0000-00-00'),
(1213, 'BossFX170101346-77', 1346, 1, 1, '0.00', '0.00', '0.80', '1', 'USD', 'Free', 0, 'datuherman00@gmail.com', 'datuherman00@gmail.com', '2017-12-01 10:10:41', 1, '2017-12-30', '', '0000-00-00'),
(1214, 'BossFX170101347-70', 1347, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'lawrenceseeiso2@gmail.com', 'lawrenceseeiso2@gmail.com', '2017-12-01 14:10:03', 1, '2018-01-01', '', '0000-00-00'),
(1215, 'BossFX170101348-05', 1348, 1, 1, '0.00', '0.00', '0.33', '0', 'USD', 'Free', 0, 'haiiirul@gmail.com', 'haiiirul@gmail.com', '2017-12-01 23:13:33', 1, '2018-01-01', '', '0000-00-00'),
(1216, 'BossFX170101349-70', 1349, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'Faymay123@hotmail.com', 'Faymay123hotmail.com', '2017-12-01 23:35:29', 1, '2018-01-01', '', '0000-00-00'),
(1217, 'BossFX170101350-98', 1350, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'ishanstack1@gmail.com', 'ishanstack1@gmail.com', '2017-12-02 00:03:45', 1, '2018-01-01', '', '0000-00-00'),
(1218, 'BossFX170101351-41', 1351, 1, 1, '0.00', '0.00', '0.44', '0', 'USD', 'Free', 0, 'nkululekothabethe4@gmail.com', '', '2017-12-02 00:21:58', 1, '2018-01-01', '', '0000-00-00'),
(1219, 'BossFX170101352-02', 1352, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'ahminn13@gmail.com', '', '2017-12-02 00:31:19', 1, '2018-01-01', '', '0000-00-00'),
(1220, 'BossFX170101353-47', 1353, 1, 1, '0.00', '0.00', '0.30', '0', 'USD', 'Free', 0, 'auonuirani1214@gmail.com', 'auonuirani1214@gmail.com', '2017-12-02 02:07:17', 1, '2018-01-01', '', '0000-00-00'),
(1221, 'BossFX170101354-08', 1354, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'mr.khurram@yahoo.com', 'Ks9993431@gmail.com', '2017-12-02 05:50:45', 1, '2018-01-01', '', '0000-00-00'),
(1222, 'BossFX170101355-03', 1355, 1, 1, '0.00', '0.00', '0.29', '0', 'USD', 'Free', 0, 'ks9993431@gmail.com', 'ks9993431@gmail.com', '2017-12-02 09:23:10', 1, '2018-01-01', '', '0000-00-00'),
(1223, 'BossFX170101356-09', 1356, 1, 1, '0.00', '0.00', '0.73', '1', 'USD', 'Free', 0, 'Manojswengg@gmail.com', 'Manojswengg@gmail.com', '2017-12-02 11:17:44', 1, '2018-01-01', '', '0000-00-00'),
(1224, 'BossFX170101357-59', 1357, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'ferryffliem@gmail.com', 'dianafeiliem@gmail.com', '2017-12-02 12:06:14', 1, '2018-01-02', '', '0000-00-00'),
(1225, 'BossFX170101358-35', 1358, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'jamesbondnew.newbond007@gmail.com', '', '2017-12-03 14:25:49', 1, '2018-01-03', '', '0000-00-00'),
(1226, 'BossFX170101359-96', 1359, 1, 1, '0.00', '0.00', '0.16', '0', 'USD', 'Free', 0, 'paulsunil67@gmail.com', 'paulsunil67@gmail.com', '2017-12-04 02:14:22', 1, '2018-01-03', '', '0000-00-00'),
(1227, 'BossFX170101360-66', 1360, 1, 1, '0.00', '0.00', '0.85', '1', 'USD', 'Free', 0, 'nagasamudera@gmail.com', 'ulananga@gmail.com', '2017-12-04 08:23:23', 1, '2018-01-03', '', '0000-00-00'),
(1228, 'BossFX170101361-25', 1361, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'yusrieameer17@gmail.com', '', '2017-12-04 09:34:52', 1, '2018-01-03', '', '0000-00-00'),
(1229, 'BossFX170101362-47', 1362, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'ajees3650@gmail.com', 'ajees3650@gmail.com', '2017-12-04 16:18:16', 1, '2018-01-04', '', '0000-00-00'),
(1230, 'BossFX170101363-26', 1363, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'ajees3650@gmail.com', 'ajees3650@gmail.com', '2017-12-04 16:21:57', 1, '2018-01-04', '', '0000-00-00'),
(1231, 'BossFX170101364-48', 1364, 1, 1, '0.00', '0.00', '0.61', '1', 'USD', 'Free', 0, 'cikmadsoyod@gmail.com', 'cikmadsoyod@gmail.com', '2017-12-04 22:23:02', 1, '2018-01-04', '', '0000-00-00'),
(1232, 'BossFX170101365-52', 1365, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'cikmadsoyod@gmail.com', 'cikmadsoyod@gmail.com', '2017-12-04 22:28:29', 1, '2018-01-04', '', '0000-00-00'),
(1233, 'BossFX170101366-19', 1366, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'mhaziq.naqiuddin2@gmail.com', '', '2017-12-04 22:47:50', 1, '2018-01-04', '', '0000-00-00'),
(1234, 'BossFX170101367-37', 1367, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'adigoarchitect@gmail.com', 'adigoarchitect@gmail.com', '2017-12-05 05:28:11', 1, '2018-01-04', '', '0000-00-00'),
(1235, 'BossFX170301368-85', 1368, 3, 1, '1981700.00', '0.00', '1981752.00', '52', 'IDR', 'bank', 0, 'hhgjhgjhg@gmail.com', 'hgfhgfhgghf@gmail.com', '2017-12-05 06:40:44', 0, '2018-01-04', '', '0000-00-00'),
(1236, 'BossFX170301369-49', 1369, 3, 1, '149.00', '0.00', '149.33', '0', 'USD', 'paypal', 0, 'mbmnbmnbmnb@gmail.com', 'jhmmmbljkhkhj@gmail.com', '2017-12-05 06:41:35', 0, '2018-01-04', '', '0000-00-00'),
(1237, 'BossFX170101370-64', 1370, 1, 1, '0.00', '0.00', '0.93', '1', 'USD', 'Free', 0, 'shakeel02@outlook.com', 'shakeel02@outlook.com', '2017-12-05 07:50:42', 1, '2018-01-04', '', '0000-00-00'),
(1238, 'BossFX170101371-06', 1371, 1, 1, '0.00', '0.00', '0.96', '1', 'USD', 'Free', 0, 'isivileamahle@gmail.com', 'isivileamahle@gmail.com', '2017-12-05 08:38:39', 1, '2018-01-04', '', '0000-00-00'),
(1239, 'BossFX170101372-77', 1372, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'mehdihaghpanah@hotmail.com', '', '2017-12-05 17:44:39', 1, '2018-01-05', '', '0000-00-00'),
(1240, 'BossFX170101373-73', 1373, 1, 1, '0.00', '0.00', '0.77', '1', 'USD', 'Free', 0, 'jonathankoh@gmail.com', 'jonathankoh@gmail.com', '2017-12-05 23:51:08', 1, '2018-01-05', '', '0000-00-00'),
(1241, 'BossFX170101374-70', 1374, 1, 1, '0.00', '0.00', '0.19', '0', 'USD', 'Free', 0, 'mboweni.chris@gmail.com', 'mboweni.chris@gmail.com', '2017-12-06 07:17:33', 1, '2018-01-05', '', '0000-00-00'),
(1242, 'BossFX170101375-71', 1375, 1, 1, '0.00', '0.00', '0.33', '0', 'USD', 'Free', 0, 'namzaikgjpjdt@gmail.com', 'namzaikgjpjdt@gmail.com', '2017-12-06 10:03:25', 1, '2018-01-05', '', '0000-00-00'),
(1243, 'BossFX170101376-11', 1376, 1, 1, '0.00', '0.00', '0.81', '1', 'USD', 'Free', 0, 'sudgoyal90@gmail.com', 'sudgoyal90@gmail.com', '2017-12-07 14:33:16', 1, '2018-01-07', '', '0000-00-00'),
(1244, 'BossFX170101377-81', 1377, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'umeshsant5@gmail.com', 'umeshsant5@gmail.com', '2017-12-07 23:58:27', 1, '2018-01-07', '', '0000-00-00'),
(1245, 'BossFX170101378-71', 1378, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'Yatin.elect@gmail.com', '', '2017-12-08 04:10:10', 1, '2018-01-07', '', '0000-00-00'),
(1246, 'BossFX170101379-15', 1379, 1, 1, '0.00', '0.00', '0.91', '1', 'USD', 'Free', 0, 'Yatin.elect@gmail.com', '', '2017-12-08 04:13:24', 1, '2018-01-07', '', '0000-00-00'),
(1247, 'BossFX170101380-54', 1380, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'farizmahadi@hotmail.com', '', '2017-12-08 10:11:43', 1, '2018-01-07', '', '0000-00-00'),
(1248, 'BossFX170101381-86', 1381, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'gdsm@ymail.com', '', '2017-12-09 04:18:05', 1, '2018-01-08', '', '0000-00-00'),
(1249, 'BossFX170101382-88', 1382, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'Karlisj28@inbox.lv', '', '2017-12-09 05:01:26', 1, '2018-01-08', '', '0000-00-00'),
(1250, 'BossFX170101383-58', 1383, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'mihle.l.damoyi@gmail.com', 'Mihle.l.damoyi@gmail.com', '2017-12-09 07:02:30', 1, '2018-01-08', '', '0000-00-00'),
(1251, 'BossFX170101384-32', 1384, 1, 1, '0.00', '0.00', '0.29', '0', 'USD', 'Free', 0, 'Viswashours@gmail.com', 'Viswashours@gmail.coCcom', '2017-12-09 07:41:45', 1, '2018-01-08', '', '0000-00-00'),
(1252, 'BossFX170101385-53', 1385, 1, 1, '0.00', '0.00', '0.78', '1', 'USD', 'Free', 0, 'jagdeep.businessalert@gmail.com', 'jagdeep.alert@gmail.com', '2017-12-09 10:41:55', 1, '2018-01-08', '', '0000-00-00'),
(1253, 'BossFX170101386-64', 1386, 1, 1, '0.00', '0.00', '0.70', '1', 'USD', 'Free', 0, 'farizmahadi@hotmail.com', '', '2017-12-09 15:10:18', 1, '2018-01-09', '', '0000-00-00'),
(1254, 'BossFX170101387-64', 1387, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'ehmedazeemali@gmail.com', '', '2017-12-09 17:19:17', 1, '2018-01-09', '', '0000-00-00'),
(1255, 'BossFX170101388-63', 1388, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'waheebarkhan@gmail.com', 'waheebarkhan@gmail.com', '2017-12-10 12:14:13', 1, '2018-01-10', '', '0000-00-00'),
(1256, 'BossFX170101389-35', 1389, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'karimbektdyu@gmail.com', 'karimbektdyu@gmail.com', '2017-12-10 14:55:03', 1, '2018-01-10', '', '0000-00-00'),
(1257, 'BossFX170101390-92', 1390, 1, 1, '0.00', '0.00', '0.72', '1', 'USD', 'Free', 0, 'Omkarmarchande@gmail.com', 'Omkarmarchande@gmail.com', '2017-12-10 16:44:05', 1, '2018-01-10', '', '0000-00-00'),
(1258, 'BossFX170101391-90', 1391, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'Saitrust17@gmail.com', 'Saitrust17@gmail.com', '2017-12-11 09:26:09', 1, '2018-01-10', '', '0000-00-00'),
(1259, 'BossFX170101392-84', 1392, 1, 1, '0.00', '0.00', '0.65', '1', 'USD', 'Free', 0, 'sksaifiworkithome786@gmail.com', 'sksaifiworkithome786@gmail.com', '2017-12-11 16:00:23', 1, '2018-01-11', '', '0000-00-00'),
(1260, 'BossFX170101393-84', 1393, 1, 1, '0.00', '0.00', '0.34', '0', 'USD', 'Free', 0, 'rupeshjkarande@hotmail.com', '', '2017-12-11 21:29:25', 1, '2018-01-11', '', '0000-00-00'),
(1261, 'BossFX170101394-51', 1394, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'ibrahimamassaly12@gmail.com', 'ibrahimamassaly12@gmail.com', '2017-12-12 02:57:27', 1, '2018-01-11', '', '0000-00-00'),
(1262, 'BossFX170101395-46', 1395, 1, 1, '0.00', '0.00', '0.17', '0', 'USD', 'Free', 0, 'pnmall4u@gmail.com', 'pnmall4u@gmail.com', '2017-12-12 03:39:18', 1, '2018-01-11', '', '0000-00-00'),
(1263, 'BossFX170101396-31', 1396, 1, 1, '0.00', '0.00', '0.41', '0', 'USD', 'Free', 0, 'shuraih66@gmail.com', 'shuraih66@gmail.com', '2017-12-12 12:27:19', 1, '2018-01-12', '', '0000-00-00'),
(1264, 'BossFX170101397-70', 1397, 1, 1, '0.00', '0.00', '0.94', '1', 'USD', 'Free', 0, 'Wesleyrachman@gmail.com', 'Wesleyrachman@gmail.com', '2017-12-12 15:27:03', 1, '2018-01-12', '', '0000-00-00'),
(1265, 'BossFX170101398-52', 1398, 1, 1, '0.00', '0.00', '0.89', '1', 'USD', 'Free', 0, 'Anilkumar.mys42@gmail.com', 'Anilkumar.mys42@gmail.com', '2017-12-12 17:30:45', 1, '2018-01-12', '', '0000-00-00'),
(1266, 'BossFX170101399-86', 1399, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'hrsplth@gmail.com', 'hrsplth@gmail.com', '2017-12-13 07:47:54', 1, '2018-01-12', '', '0000-00-00'),
(1267, 'BossFX170101400-49', 1400, 1, 1, '0.00', '0.00', '0.86', '1', 'USD', 'Free', 0, 'anantwasthi336@gmail.com', '', '2017-12-13 14:00:01', 1, '2018-01-13', '', '0000-00-00'),
(1268, 'BossFX170101401-51', 1401, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'rizkiwardanaa@gmail.com', 'rizkiwardanaa@gmail.com', '2017-12-13 23:45:30', 1, '2018-01-13', '', '0000-00-00'),
(1269, 'BossFX170101402-31', 1402, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'herypomad@gmail.com', 'herypomad@gmail.com', '2017-12-14 02:22:27', 1, '2018-01-13', '', '0000-00-00'),
(1270, 'BossFX170101403-35', 1403, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'topcat275@yahoo.com', 'topcat275@yahoo.com', '2017-12-14 12:06:55', 1, '2018-01-14', '', '0000-00-00'),
(1271, 'BossFX170101404-52', 1404, 1, 1, '0.00', '0.00', '0.87', '1', 'USD', 'Free', 0, 'pavan.kumar.pavankumar49@gmail.com', 'pavan.kumar.pavankumar49@gmail.com', '2017-12-15 02:21:12', 1, '2018-01-14', '', '0000-00-00'),
(1272, 'BossFX170101405-08', 1405, 1, 1, '0.00', '0.00', '0.62', '1', 'USD', 'Free', 0, 'clgafrica@gmail.com', 'clgafrica@gmail.com', '2017-12-15 03:01:15', 1, '2018-01-14', '', '0000-00-00'),
(1273, 'BossFX170101406-53', 1406, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'hopeitanrin@gmail.com', 'hopeitanrin@gmail.com', '2017-12-15 07:17:52', 1, '2018-01-14', '', '0000-00-00'),
(1274, 'BossFX170101407-33', 1407, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'aoune.saad@yandex.com', 'aoune.saad@yahoo.fr', '2017-12-15 14:18:01', 1, '2018-01-15', '', '0000-00-00'),
(1275, 'BossFX170101408-84', 1408, 1, 1, '0.00', '0.00', '0.78', '1', 'USD', 'Free', 0, 'naveenyadav1982@gmail.com', '', '2017-12-15 16:50:52', 1, '2018-01-15', '', '0000-00-00'),
(1276, 'BossFX170101409-11', 1409, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'Tmjambane@gmail.com', 'Jambanemw@gmail.com', '2017-12-16 11:51:23', 1, '2018-01-15', '', '0000-00-00'),
(1277, 'BossFX170401410-55', 1410, 4, 1, '1981700.00', '0.00', '1981792.00', '92', 'IDR', 'bank', 0, 'mahendratraderfx@gmail.com', 'bossfxsignal@gmail.com', '2017-12-16 23:06:47', 0, '2018-01-16', '', '0000-00-00'),
(1278, 'BossFX170301411-66', 1411, 3, 1, '1303400.00', '0.00', '1303438.00', '38', 'IDR', 'bank', 0, 'mahendratraderfx@gmail.com', 'bossfx@gmail.com', '2017-12-16 23:09:15', 0, '2018-01-16', '', '0000-00-00'),
(1279, 'BossFX170401412-00', 1412, 4, 1, '149.00', '0.00', '149.88', '1', 'USD', 'paypal', 0, 'mahendratraderfx@gmail.com', 'tes@gmail.com', '2017-12-16 23:11:44', 0, '2018-01-16', '', '0000-00-00'),
(1280, 'BossFX170401413-74', 1413, 4, 1, '149.00', '0.00', '149.82', '1', 'USD', 'paypal', 0, 'mehendratraderfx@gmail.com', 'tes@gmail.com', '2017-12-16 23:13:17', 0, '2018-01-16', '', '0000-00-00'),
(1281, 'BossFX170101414-86', 1414, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'Samson82in@gmail.com', 'Friend_hi23@yahoo.com', '2017-12-17 04:01:38', 1, '2018-01-16', '', '0000-00-00'),
(1282, 'BossFX170101415-55', 1415, 1, 1, '0.00', '0.00', '0.23', '0', 'USD', 'Free', 0, 'soni.suresh908@gmail.com', 'soni.suresh908@gmail.com', '2017-12-17 08:21:00', 1, '2018-01-16', '', '0000-00-00'),
(1283, 'BossFX170101416-51', 1416, 1, 1, '0.00', '0.00', '0.64', '1', 'USD', 'Free', 0, 'ibrahimamassaly12@gmail.com', 'ibrahimamassaly12@gmail.com', '2017-12-17 16:52:10', 1, '2018-01-17', '', '0000-00-00'),
(1284, 'BossFX170201417-53', 1417, 2, 1, '651700.00', '325850.00', '325893.00', '43', 'IDR', 'bank', 0, 'mk1274@gmail.com', '', '2017-12-17 22:16:59', 0, '2018-01-17', '', '0000-00-00'),
(1285, 'BossFX170401418-96', 1418, 4, 1, '149.00', '0.00', '149.30', '0', 'USD', 'paypal', 0, 'mdsyahman512@gmail.com', 'mdsyahman@hotmail.com', '2017-12-18 02:09:23', 0, '2018-01-17', '', '0000-00-00'),
(1286, 'BossFX170401419-22', 1419, 4, 1, '149.00', '0.00', '149.42', '0', 'USD', 'paypal', 0, 'mdsyahman512@gmail.com', 'mdsyahman@hotmail.com', '2017-12-18 02:12:18', 0, '2018-01-17', '', '0000-00-00'),
(1287, 'BossFX170401420-60', 1420, 4, 1, '149.00', '0.00', '149.44', '0', 'USD', 'paypal', 0, 'mdsyahman512@gmail.com', 'mdsyahman@hotmail.com', '2017-12-18 02:14:17', 0, '2018-01-17', '', '0000-00-00'),
(1288, 'BossFX170401421-13', 1421, 4, 1, '149.00', '0.00', '149.72', '1', 'USD', 'paypal', 0, 'mdsyahman512@gmail.com', 'mdsyahman@hotmail.com', '2017-12-18 02:16:37', 0, '2018-01-17', '', '0000-00-00'),
(1289, 'BossFX170101422-84', 1422, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'Mainamyke@gmail.com', 'Mainamyke@gmail.com', '2017-12-18 02:21:50', 1, '2018-01-17', '', '0000-00-00'),
(1290, 'BossFX170401423-23', 1423, 4, 1, '149.00', '0.00', '149.81', '1', 'USD', 'paypal', 0, 'mdsyahman512@gmail.com', 'mdsyahman@hotmail.com', '2017-12-18 02:53:22', 0, '2018-01-17', '', '0000-00-00'),
(1291, 'BossFX170401424-56', 1424, 4, 1, '149.00', '0.00', '149.15', '0', 'USD', 'paypal', 0, 'bruneimafia@gmail.com', 'bruneimafia@gmail.com', '2017-12-18 03:12:12', 0, '2018-01-17', '', '0000-00-00'),
(1292, 'BossFX170201425-22', 1425, 2, 1, '651700.00', '325850.00', '325899.00', '49', 'IDR', 'bank', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-12-18 17:07:31', 0, '2018-01-18', '', '0000-00-00'),
(1293, 'BossFX170201426-09', 1426, 2, 1, '49.00', '24.50', '25.42', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-12-18 17:08:24', 0, '2018-01-18', '', '0000-00-00'),
(1294, 'BossFX170301427-74', 1427, 3, 1, '98.00', '0.00', '98.74', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-12-18 17:09:20', 0, '2018-01-18', '', '0000-00-00'),
(1295, 'BossFX170401428-12', 1428, 4, 1, '149.00', '0.00', '149.53', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-12-18 17:11:14', 0, '2018-01-18', '', '0000-00-00'),
(1296, 'BossFX170301429-22', 1429, 3, 1, '98.00', '49.00', '49.77', '1', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-12-18 17:37:02', 0, '2018-01-18', '', '0000-00-00'),
(1297, 'BossFX170401430-99', 1430, 4, 1, '149.00', '74.50', '74.92', '0', 'USD', 'paypal', 0, 'dode.agung.asmara@gmail.com', 'dode.agung.asmara@gmail.com', '2017-12-18 17:37:56', 0, '2018-01-18', '', '0000-00-00'),
(1298, 'BossFX170101431-78', 1431, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'Parbatsingh18@gmail.com', 'Parbatsingh18@gmail.com', '2017-12-19 22:13:24', 1, '2018-01-19', '', '0000-00-00'),
(1299, 'BossFX170101432-02', 1432, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'tejassalvi88791@gmail.com', 'tejassalvi88791@gmail.com', '2017-12-20 00:39:10', 1, '2018-01-19', '', '0000-00-00'),
(1300, 'BossFX170101433-35', 1433, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'Singhraman929@gmail.com', '', '2017-12-20 08:37:07', 1, '2018-01-19', '', '0000-00-00'),
(1301, 'BossFX170101434-67', 1434, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'rizwanarkiz18@gmail.com', 'No', '2017-12-20 12:21:45', 1, '2018-01-20', '', '0000-00-00'),
(1302, 'BossFX170101435-96', 1435, 1, 1, '0.00', '0.00', '0.11', '0', 'USD', 'Free', 0, 'sateshlalloo@hotmail.com', '', '2017-12-20 13:15:12', 1, '2018-01-20', '', '0000-00-00'),
(1303, 'BossFX170101436-08', 1436, 1, 1, '0.00', '0.00', '0.20', '0', 'USD', 'Free', 0, 'm.passee@gmail.com', '', '2017-12-20 13:16:58', 1, '2018-01-20', '', '0000-00-00'),
(1304, 'BossFX170101437-62', 1437, 1, 1, '0.00', '0.00', '0.40', '0', 'USD', 'Free', 0, 'nayabamazai1@gmail.com', '', '2017-12-20 18:24:08', 1, '2018-01-20', '', '0000-00-00'),
(1305, 'BossFX170101438-28', 1438, 1, 1, '0.00', '0.00', '0.36', '0', 'USD', 'Free', 0, 'phalanamoitsemp@gmail.com', 'phalanamoitsemp@gmail.com', '2017-12-21 03:41:18', 1, '2018-01-20', '', '0000-00-00'),
(1306, 'BossFX170101439-46', 1439, 1, 1, '0.00', '0.00', '0.87', '1', 'USD', 'Free', 0, 'agil.adjie@gmail.com', 'agil.adjie@gmail.com', '2017-12-21 07:24:31', 1, '2018-01-20', '', '0000-00-00'),
(1307, 'BossFX170101440-19', 1440, 1, 1, '0.00', '0.00', '0.85', '1', 'USD', 'Free', 0, 'reachtotabrez@gmail.com', '', '2017-12-25 17:24:13', 1, '2018-01-25', '', '0000-00-00'),
(1308, 'BossFX170101441-59', 1441, 1, 1, '0.00', '0.00', '0.33', '0', 'USD', 'Free', 0, 'vishnuvardhanreddy518@gmail.com', 'vishnuvardhanreddy518@gmail.com', '2017-12-26 08:22:12', 1, '2018-01-25', '', '0000-00-00'),
(1309, 'BossFX170101442-44', 1442, 1, 1, '0.00', '0.00', '0.43', '0', 'USD', 'Free', 0, 'kashifraza5510@gmail.com', '', '2017-12-26 17:23:53', 1, '2018-01-26', '', '0000-00-00'),
(1310, 'BossFX170101443-11', 1443, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'Rakeshprocky6@gmail.com', 'Rakeshprocky6@gmail.com', '2017-12-27 02:08:34', 1, '2018-01-26', '', '0000-00-00'),
(1311, 'BossFX170101444-84', 1444, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'amsar1010@yahoo.co.id', 'amsar1010@yahoo.co.id', '2017-12-27 22:22:42', 1, '2018-01-27', '', '0000-00-00'),
(1312, 'BossFX170101445-97', 1445, 1, 1, '0.00', '0.00', '0.94', '1', 'USD', 'Free', 0, 'PriyankaSushalini007@gmail.com', 'PriyankaSushalini007@gmail.com', '2017-12-28 09:07:54', 1, '2018-01-27', '', '0000-00-00'),
(1313, 'BossFX170101446-62', 1446, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'mpotsengditlatla@gmail.com', 'mpotsengditlatla@gmail.com', '2017-12-30 12:16:05', 1, '2018-01-30', '', '0000-00-00'),
(1314, 'BossFX170101447-03', 1447, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'Rakeshprocky6@gmail.com', 'Rakeshprocky6@gmail.com', '2017-12-30 13:09:28', 1, '2018-01-30', '', '0000-00-00'),
(1315, 'BossFX170101448-08', 1448, 1, 1, '0.00', '0.00', '0.47', '0', 'USD', 'Free', 0, 'fibobinary@gmail.com', 'fibobinary@gmail.com', '2017-12-30 16:41:52', 1, '2018-01-30', '', '0000-00-00'),
(1316, 'BossFX180101449-67', 1449, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'kuinhazarika9@gmail.com', 'kuinhazarika@hotmail.com', '2018-01-01 00:36:04', 1, '2018-01-31', '', '0000-00-00'),
(1317, 'BossFX180101450-74', 1450, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'sattar0farex@gmail.com', '', '2018-01-01 15:57:58', 1, '2018-02-01', '', '0000-00-00'),
(1318, 'BossFX180101451-93', 1451, 1, 1, '0.00', '0.00', '0.95', '1', 'USD', 'Free', 0, 'priya9jashoda@gmail.com', 'priya9jashoda@gmail.com', '2018-01-03 09:18:21', 1, '2018-02-02', '', '0000-00-00'),
(1319, 'BossFX180201452-40', 1452, 2, 1, '49.85', '0.00', '49.85', '1', 'USD', 'transfer paypal', 0, 'mabster057@gmail.com', 'mabster057@gmail.com', '2018-01-03 13:16:37', 1, '2018-02-03', '', '2018-01-03'),
(1320, 'BossFX180101453-48', 1453, 1, 1, '0.00', '0.00', '0.89', '1', 'USD', 'Free', 0, 'goswaminishant306@gmail.com', 'goswaminishant306@gmail.com', '2018-01-03 14:50:30', 1, '2018-02-03', '', '0000-00-00'),
(1321, 'BossFX180101454-99', 1454, 1, 1, '0.00', '0.00', '0.31', '0', 'USD', 'Free', 0, 'shekhawatjitendra84@gmail.com', '', '2018-01-05 14:32:55', 1, '2018-02-05', '', '0000-00-00'),
(1322, 'BossFX180101455-93', 1455, 1, 1, '0.00', '0.00', '0.13', '0', 'USD', 'Free', 0, 'rajputdivyank09@gmail.com', 'rajputdivyank09@gmail.com', '2018-01-06 06:51:08', 1, '2018-02-05', '', '0000-00-00'),
(1323, 'BossFX180101456-65', 1456, 1, 1, '0.00', '0.00', '0.33', '0', 'USD', 'Free', 0, 'ashhad.ahmed@gmail.com', 'ashhad.ahmed@gmail.com', '2018-01-08 15:07:47', 1, '2018-02-08', '', '0000-00-00'),
(1324, 'BossFX180101457-03', 1457, 1, 1, '0.00', '0.00', '0.12', '0', 'USD', 'Free', 0, 'willplessis@gmail.com', 'willplessis@gmail.com', '2018-01-08 18:00:34', 1, '2018-02-08', '', '0000-00-00'),
(1325, 'BossFX180101458-84', 1458, 1, 1, '0.00', '0.00', '0.51', '1', 'USD', 'Free', 0, 'mbolhan@gmail.com', 'mbolhan@gmail.com', '2018-01-09 10:48:59', 1, '2018-02-08', '', '0000-00-00'),
(1326, 'BossFX180101459-51', 1459, 1, 1, '0.00', '0.00', '0.68', '1', 'USD', 'Free', 0, 'badoylent@gmail.com', 'badoylent@gmail.com', '2018-01-09 18:38:09', 1, '2018-02-09', '', '0000-00-00'),
(1327, 'BossFX180101460-87', 1460, 1, 1, '0.00', '0.00', '0.66', '1', 'USD', 'Free', 0, 'ibrahimqaasim277@gmail.com', 'ibrahimqaasim277@gmail.com', '2018-01-10 08:12:32', 1, '2018-02-09', '', '0000-00-00'),
(1328, 'BossFX180101461-82', 1461, 1, 1, '0.00', '0.00', '0.61', '1', 'USD', 'Free', 0, 'nishanthkp0521@gmail.com', 'nishanthputtappa@gmail.com', '2018-01-10 10:48:19', 1, '2018-02-09', '', '0000-00-00'),
(1329, 'BossFX180101462-47', 1462, 1, 1, '0.00', '0.00', '0.38', '0', 'USD', 'Free', 0, 'samar.mumbai12@gmail.com', '', '2018-01-10 15:23:25', 1, '2018-02-10', '', '0000-00-00'),
(1330, 'BossFX180101463-13', 1463, 1, 1, '0.00', '0.00', '0.98', '1', 'USD', 'Free', 0, 'ohremenkotoha@mail.ru', '', '2018-01-11 04:10:26', 1, '2018-02-10', '', '0000-00-00'),
(1331, 'BossFX180101464-20', 1464, 1, 1, '0.00', '0.00', '0.67', '1', 'USD', 'Free', 0, 'basavamanvi2@gmail.com', 'basavamanvi@gmail.com', '2018-01-11 14:24:57', 1, '2018-02-11', '', '0000-00-00'),
(1332, 'BossFX180101465-72', 1465, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'muhammadyusof5651@gmail.com', '', '2018-01-11 15:38:43', 1, '2018-02-11', '', '0000-00-00'),
(1333, 'BossFX180101466-99', 1466, 1, 1, '0.00', '0.00', '0.71', '1', 'USD', 'Free', 0, 'Loveyougurujii@gmail.com', '', '2018-01-11 23:14:02', 1, '2018-02-11', '', '0000-00-00'),
(1334, 'BossFX180201467-15', 1467, 2, 1, '651700.00', '0.00', '651737.00', '37', 'IDR', 'bank', 0, 'prosto.antosha@yandex.ru', '', '2018-01-12 02:29:02', 0, '2018-02-11', '', '0000-00-00'),
(1335, 'BossFX180201468-68', 1468, 2, 1, '651700.00', '0.00', '651724.00', '24', 'IDR', 'bank', 0, 'prosto.antosha@yandex.ru', '', '2018-01-12 02:33:47', 0, '2018-02-11', '', '0000-00-00'),
(1336, 'BossFX180201469-78', 1469, 2, 1, '49.00', '0.00', '49.79', '1', 'USD', 'paypal', 0, 'prosto.antosha@yandex.ru', 'medovnikanton@gmail.com', '2018-01-12 03:29:01', 0, '2018-02-11', '', '0000-00-00'),
(1337, 'BossFX180201470-12', 1470, 2, 1, '49.46', '0.00', '49.46', '0', 'USD', 'transfer paypal', 0, 'prosto.antosha@yandex.ru', 'medovnikanton@gmail.com', '2018-01-12 03:31:14', 1, '2018-02-11', '', '2018-01-11'),
(1338, 'BossFX180101471-05', 1471, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'mbolhan@gmail.com', 'mbolhan@gmail.com', '2018-01-12 04:02:14', 1, '2018-02-11', '', '0000-00-00'),
(1339, 'BossFX180101472-97', 1472, 1, 1, '0.00', '0.00', '0.22', '0', 'USD', 'Free', 0, 'fidelialathifa@gmail.com', '', '2018-01-13 22:20:51', 1, '2018-02-13', '', '0000-00-00'),
(1340, 'BossFX180101473-96', 1473, 1, 1, '0.00', '0.00', '0.35', '0', 'USD', 'Free', 0, 'vnandaniya@gmail.com', 'vnandaniya@gmail..com', '2018-01-14 07:47:08', 1, '2018-02-13', '', '0000-00-00'),
(1341, 'BossFX180101474-09', 1474, 1, 1, '0.00', '0.00', '0.98', '1', 'USD', 'Free', 0, 'foxanmadey444@gmail.com', 'Foxanmadey144@gmail.com', '2018-01-14 17:11:00', 1, '2018-02-14', '', '0000-00-00'),
(1342, 'BossFX180101475-85', 1475, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'maliquea09@gmail.com', 'maliquea09@gmail.com', '2018-01-14 19:49:37', 1, '2018-02-14', '', '0000-00-00'),
(1343, 'BossFX180101476-95', 1476, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'maliquea09@gmail.com', 'maliquea09@gmail.com', '2018-01-14 19:53:53', 1, '2018-02-14', '', '0000-00-00'),
(1344, 'BossFX180101477-53', 1477, 1, 1, '0.00', '0.00', '0.69', '1', 'USD', 'Free', 0, 'antoinepaula25@gmail.com', '', '2018-01-14 21:49:57', 1, '2018-02-14', '', '0000-00-00'),
(1345, 'BossFX180101478-90', 1478, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'zamahmad94@gmail.com', 'zamahmad94@gmail.com', '2018-01-15 01:17:30', 1, '2018-02-14', '', '0000-00-00'),
(1346, 'BossFX180101479-77', 1479, 1, 1, '0.00', '0.00', '0.46', '0', 'USD', 'Free', 0, 'ibrahimqaasim277@gmail.com', 'ibrahimqaasim277@gmail.com', '2018-01-15 08:53:57', 1, '2018-02-14', '', '0000-00-00'),
(1347, 'BossFX180101480-98', 1480, 1, 1, '0.00', '0.00', '0.98', '1', 'USD', 'Free', 0, 'Prasanjeet.sikder@gmail.com', '', '2018-01-15 13:40:00', 1, '2018-02-15', '', '0000-00-00'),
(1348, 'BossFX180101481-07', 1481, 1, 1, '0.00', '0.00', '0.50', '1', 'USD', 'Free', 0, 'yuniartonugroho@gmail.com', '', '2018-01-16 23:21:40', 1, '2018-02-16', '', '0000-00-00'),
(1349, 'BossFX180101482-79', 1482, 1, 1, '0.00', '0.00', '0.45', '0', 'USD', 'Free', 0, 'geraldmariga@gmail.com', '', '2018-01-17 03:06:54', 1, '2018-02-16', '', '0000-00-00'),
(1350, 'BossFX180101483-98', 1483, 1, 1, '0.00', '0.00', '0.78', '1', 'USD', 'Free', 0, 'dennisramadhan001@gmail.com', 'dennisramadhan001@gmail.com', '2018-01-18 10:09:59', 1, '2018-02-17', '', '0000-00-00'),
(1351, 'BossFX180101484-15', 1484, 1, 1, '0.00', '0.00', '0.87', '1', 'USD', 'Free', 0, 'faizuddin_arif@yahoo.com', 'faizuddin_arif@yahoo.com', '2018-01-18 19:25:01', 1, '2018-02-18', '', '0000-00-00'),
(1352, 'BossFX180101485-18', 1485, 1, 1, '0.00', '0.00', '0.52', '1', 'USD', 'Free', 0, 'Kevinsailly.040512@gmail.com', 'Kevinsailly.040512@gmail.com', '2018-01-18 22:02:36', 1, '2018-02-18', '', '0000-00-00'),
(1353, 'BossFX180101486-43', 1486, 1, 1, '0.00', '0.00', '0.79', '1', 'USD', 'Free', 0, 'survis76@gmail.com', '', '2018-01-20 01:51:09', 1, '2018-02-19', '', '0000-00-00'),
(1354, 'BossFX180101487-19', 1487, 1, 1, '0.00', '0.00', '0.97', '1', 'USD', 'Free', 0, 'Fattahillah73@gmail.com', '', '2018-01-20 15:34:59', 1, '2018-02-20', '', '0000-00-00'),
(1355, 'BossFX180201488-02', 1488, 2, 1, '651700.00', '0.00', '651779.00', '79', 'IDR', 'bank', 0, 'samtech2002@gmail.com', 'samtech2002@yahoo.com', '2018-01-20 21:26:34', 0, '2018-02-20', '', '0000-00-00'),
(1356, 'BossFX180101489-27', 1489, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'jkint001@gmail.com', 'jkint001@gmail.com', '2018-01-21 00:46:26', 1, '2018-02-20', '', '0000-00-00'),
(1357, 'BossFX180301490-57', 1490, 3, 1, '1303400.00', '0.00', '1303416.00', '16', 'IDR', 'bank', 0, 'paskalis.theovicky@gmail.com', '', '2018-01-21 05:44:33', 0, '2018-02-20', '', '0000-00-00'),
(1358, 'BossFX180101491-00', 1491, 1, 1, '0.00', '0.00', '0.25', '0', 'USD', 'Free', 0, 'Srikanth.goud27@yahoo.com', '', '2018-01-22 04:54:40', 1, '2018-02-21', '', '0000-00-00'),
(1359, 'BossFX180101492-80', 1492, 1, 1, '0.00', '0.00', '0.74', '1', 'USD', 'Free', 0, 'Sksaifiworkithome786@gmail.com', 'Sksaifiworkithome786@gmail.com', '2018-01-22 21:59:19', 1, '2018-02-22', '', '0000-00-00'),
(1360, 'BossFX180101493-81', 1493, 1, 1, '0.00', '0.00', '0.27', '0', 'USD', 'Free', 0, 'ahemadraza1112@gmail.com', '', '2018-01-23 03:18:51', 1, '2018-02-22', '', '0000-00-00'),
(1361, 'BossFX180101494-65', 1494, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'Joshuamutheek@gmail.com', 'getpaidfastkenya@gmail.com', '2018-01-23 11:57:35', 1, '2018-02-22', '', '0000-00-00'),
(1362, 'BossFX180101495-19', 1495, 1, 1, '0.00', '0.00', '0.85', '1', 'USD', 'Free', 0, 'Sathishmuk@gmail.com', 'Sathishmuk@gmail.com', '2018-01-23 22:59:46', 1, '2018-02-23', '', '0000-00-00'),
(1363, 'BossFX180101496-67', 1496, 1, 1, '0.00', '0.00', '0.10', '0', 'USD', 'Free', 0, 'kunalchachan1@gmail.com', 'kunalchachan1@gmail.com', '2018-01-24 07:03:58', 1, '2018-02-23', '', '0000-00-00'),
(1364, 'BossFX180101497-99', 1497, 1, 1, '0.00', '0.00', '0.14', '0', 'USD', 'Free', 0, 'kellonmarecheau@gmail.com', '', '2018-01-24 21:31:05', 1, '2018-02-24', '', '0000-00-00'),
(1365, 'BossFX180401498-72', 1498, 4, 1, '1981700.00', '0.00', '1981787.00', '87', 'IDR', 'bank', 0, 'sattar.razmjou@gmail.com', '', '2018-01-25 13:23:21', 0, '2018-02-25', '', '0000-00-00'),
(1366, 'BossFX180101499-85', 1499, 1, 1, '0.00', '0.00', '0.59', '1', 'USD', 'Free', 0, 'ashveen@gmx.com', 'ashveen@telkomsa.net', '2018-01-26 05:10:58', 1, '2018-02-25', '', '0000-00-00'),
(1367, 'BossFX180401500-55', 1500, 4, 1, '1981700.00', '0.00', '1981799.00', '99', 'IDR', 'bank', 0, 'sattar.razmjo@gmail.com', '', '2018-01-26 12:27:20', 0, '2018-02-26', '', '0000-00-00'),
(1368, 'BossFX180401501-55', 1501, 4, 2, '357.89', '0.00', '357.89', '1', 'USD', 'transfer paypal', 0, 'phaack85@gmail.com', 'phaack85@gmail.com', '2018-01-26 13:17:37', 1, '2018-04-26', '', '2018-01-26'),
(1369, 'BossFX180101502-62', 1502, 1, 1, '0.00', '0.00', '0.15', '0', 'USD', 'Free', 0, 'milankakadiya108@gmail.com', 'milankakadiya108@gmail.com', '2018-01-27 02:10:34', 1, '2018-02-26', '', '0000-00-00'),
(1370, 'BossFX180101503-67', 1503, 1, 1, '0.00', '0.00', '0.53', '1', 'USD', 'Free', 0, 'harshsarvani98@gmail.com', 'harshsarvani98@gmail.com', '2018-01-27 22:21:20', 1, '2018-02-27', '', '0000-00-00'),
(1371, 'BossFX180101504-08', 1504, 1, 1, '0.00', '0.00', '0.63', '1', 'USD', 'Free', 0, 'vnandaniya@gmail.com', 'Vnandaniya@gmail.com', '2018-01-28 03:50:02', 1, '2018-02-27', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_plans`
--

CREATE TABLE `payment_plans` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hexcolor` varchar(6) NOT NULL DEFAULT '',
  `fontcolor` varchar(6) NOT NULL DEFAULT '',
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(20) NOT NULL DEFAULT 'USD',
  `days` int(11) NOT NULL DEFAULT '0',
  `sales` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_plans`
--

INSERT INTO `payment_plans` (`ID`, `name`, `hexcolor`, `fontcolor`, `cost`, `currency`, `days`, `sales`, `description`, `icon`) VALUES
(1, 'Free Signal', '65E0EB', 'FFFFFF', '0.00', 'USD', 30, 9, 'This is the basic plan which gives you a introduction to our Premium Plans', 'glyphicon glyphicon-heart-empty'),
(2, 'Basic Signal', '65E0EB', 'FFFFFF', '49.00', 'USD', 30, 8, 'This is the basic plan which gives you a introduction to our Premium Plans', 'glyphicon glyphicon-heart-empty'),
(3, 'Pro Signal', '55CD7B', 'FFFFFF', '98.00', 'USD', 30, 4, 'Get all the benefits of basic at a cheaper price and gain content for longer.', 'glyphicon glyphicon-piggy-bank'),
(4, 'Premium Signal', 'EE5782', 'FFFFFF', '149.00', 'USD', 30, 1, 'Become a premium member for life and have access to all our premium content.', 'glyphicon glyphicon-gift');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id` int(200) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'PT PLN (Persero) Area Bali Selatan', '2019-12-17 00:00:00', '2019-12-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `idpro` bigint(200) NOT NULL,
  `nama_program` varchar(200) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`idpro`, `nama_program`, `keterangan`) VALUES
(1, 'UNSET', ''),
(2, 'Mandiri', 'Pembiayaan Mandiri'),
(3, 'Kemenpar 2016', 'Kementrian pariwisata 2016'),
(4, 'BNSP 2016', 'Program BNSP 2016');

-- --------------------------------------------------------

--
-- Table structure for table `regional`
--

CREATE TABLE `regional` (
  `idreg` bigint(200) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `info_lain` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regional`
--

INSERT INTO `regional` (`idreg`, `nama`, `info_lain`) VALUES
(1, 'Unset', ''),
(2, 'Bali', '');

-- --------------------------------------------------------

--
-- Table structure for table `reset_log`
--

CREATE TABLE `reset_log` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reset_log`
--

INSERT INTO `reset_log` (`ID`, `IP`, `timestamp`) VALUES
(1, '::1', 1569465576),
(2, '::1', 1569934502),
(3, '::1', 1569934549);

-- --------------------------------------------------------

--
-- Table structure for table `site_coupon`
--

CREATE TABLE `site_coupon` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `value_discount` int(11) NOT NULL,
  `unit_discount` enum('percent','fix') NOT NULL DEFAULT 'percent',
  `currency_code` enum('IDR','USD') NOT NULL DEFAULT 'USD',
  `idplan` varchar(1) NOT NULL,
  `isglobal` int(1) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '1',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expDate` datetime NOT NULL,
  `loggedin` int(11) NOT NULL DEFAULT '1',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='discount in percent';

--
-- Dumping data for table `site_coupon`
--

INSERT INTO `site_coupon` (`id`, `code`, `value_discount`, `unit_discount`, `currency_code`, `idplan`, `isglobal`, `userid`, `date`, `expDate`, `loggedin`, `last_updated`) VALUES
(1, 'bossbig', 100, 'fix', 'USD', '4', 0, 1, '2017-07-24 10:45:54', '2017-08-23 10:16:40', 1, '0000-00-00 00:00:00'),
(7, 'bossmedium', 50, 'fix', 'USD', '4', 0, 1, '2017-07-28 09:00:46', '2017-08-24 10:47:04', 1, '0000-00-00 00:00:00'),
(8, 'bosssmall', 25, 'fix', 'USD', '4', 0, 1, '2017-08-07 09:03:23', '2017-08-23 10:48:09', 1, '0000-00-00 00:00:00'),
(9, 'newyear2018', 50, 'percent', 'USD', '2', 0, 1, '2017-12-15 11:09:53', '2018-01-14 09:00:46', 1, '2017-12-15 11:09:23'),
(10, 'newyear2018', 50, 'percent', 'USD', '3', 0, 1, '2017-12-15 11:09:59', '2018-01-14 11:09:23', 1, '2017-12-15 11:09:23'),
(11, 'newyear2018', 50, 'percent', 'USD', '4', 0, 1, '2017-12-15 11:10:05', '2018-01-14 11:09:59', 1, '2017-12-15 11:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `site_menus`
--

CREATE TABLE `site_menus` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dropdown` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site_menu_links`
--

CREATE TABLE `site_menu_links` (
  `ID` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `ID` int(11) NOT NULL,
  `site_name` varchar(500) NOT NULL,
  `site_desc` varchar(500) NOT NULL,
  `upload_path` varchar(500) NOT NULL,
  `upload_path_relative` varchar(500) NOT NULL,
  `site_email` varchar(500) NOT NULL,
  `site_logo` varchar(1000) NOT NULL DEFAULT 'logo.png',
  `ext_site_logo` varchar(1000) NOT NULL,
  `site_logo_other` varchar(1000) NOT NULL,
  `ext_site_logo_other` varchar(1000) NOT NULL,
  `favicon` varchar(1000) NOT NULL,
  `ext_favicon` varchar(1000) NOT NULL,
  `register` int(11) NOT NULL,
  `disable_captcha` int(11) NOT NULL,
  `date_format` varchar(25) NOT NULL,
  `avatar_upload` int(11) NOT NULL DEFAULT '1',
  `file_types` varchar(500) NOT NULL,
  `twitter_consumer_key` varchar(255) NOT NULL,
  `twitter_consumer_secret` varchar(255) NOT NULL,
  `disable_social_login` int(11) NOT NULL,
  `facebook_app_id` varchar(255) NOT NULL,
  `facebook_app_secret` varchar(255) NOT NULL,
  `google_client_id` varchar(255) NOT NULL,
  `google_client_secret` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `image_front_num` int(11) NOT NULL,
  `post_front_num` int(11) NOT NULL,
  `IDRUSD` varchar(200) NOT NULL,
  `paypal_email` varchar(1000) NOT NULL,
  `paypal_currency` varchar(100) NOT NULL DEFAULT 'USD',
  `payment_enabled` int(11) NOT NULL,
  `payment_symbol` varchar(5) NOT NULL DEFAULT '$',
  `global_premium` int(11) NOT NULL,
  `install` int(11) NOT NULL DEFAULT '1',
  `login_protect` int(11) NOT NULL,
  `activate_account` int(11) NOT NULL,
  `default_user_role` int(11) NOT NULL,
  `secure_login` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `menu_highlight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`ID`, `site_name`, `site_desc`, `upload_path`, `upload_path_relative`, `site_email`, `site_logo`, `ext_site_logo`, `site_logo_other`, `ext_site_logo_other`, `favicon`, `ext_favicon`, `register`, `disable_captcha`, `date_format`, `avatar_upload`, `file_types`, `twitter_consumer_key`, `twitter_consumer_secret`, `disable_social_login`, `facebook_app_id`, `facebook_app_secret`, `google_client_id`, `google_client_secret`, `file_size`, `image_front_num`, `post_front_num`, `IDRUSD`, `paypal_email`, `paypal_currency`, `payment_enabled`, `payment_symbol`, `global_premium`, `install`, `login_protect`, `activate_account`, `default_user_role`, `secure_login`, `comments`, `menu_highlight`) VALUES
(1, 'Pengajuan PSPBMN', 'Top Global', './uploads/', 'uploads', 'info@bossforexsignal.com', '/setting/1b0c19d5f6a56c9d5dc14a0777bcdae3', 'jpg', '/setting/b86eca3dc3bd5145938ffc3671ff8555', 'jpg', '/setting/22631ea7cd526bd41a285bd0ba2f2cc5', 'jpg', 0, 0, 'd/m/Y', 0, 'gif|png|jpg|jpeg|ico', '', '', 0, '', '', '', '', 1048, 6, 3, '13300', 'bossfxsignal@gmail.com', 'USD', 0, '$', 0, 0, 1, 1, 5, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `site_slugs`
--

CREATE TABLE `site_slugs` (
  `id` bigint(20) NOT NULL,
  `controller` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `keywords` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_slugs`
--

INSERT INTO `site_slugs` (`id`, `controller`, `slug`, `keywords`, `description`) VALUES
(1, 'home', 'home', 'Homepage, website polteknas denpasar, polteknas denpasar, pariwisata, kampus pariwisata bali, cruiseline  training, cruiseline, bali ', 'Homepage Polteknas Denpasar'),
(2, 'post/withid/10', 'how-to-follow-our-forex-signals-successfully-to-get-consistent-profits', 'how-to-follow-our-forex-signals-successfully-to-get-consistent-profits', 'How to Follow Our Signal'),
(14, 'join/plan/1', 'join/free-signal', 'free-signal', 'free-signal'),
(15, 'join/plan/2', 'join/basic-signal', 'basic-signal', 'basic-signal'),
(17, 'join/plan/3/', 'join/pro-signal', 'pro-signal', 'pro-signal'),
(18, 'join/plan/4/', 'join/premium-signal', 'premium-signal', 'premium-signal'),
(26, 'post/withid/25', 'post/withid/25', '', ''),
(27, 'post/withid/26', '1612-points-profit-reached-successfully-in-audjpy-buy-signal', '1612-points-profit-reached-successfully-in-audjpy-buy-signal', ''),
(28, 'post/withid/27', 'post/withid/27', 'post/withid/27', ''),
(29, 'post/withid/28', 'post/withid/28', 'post/withid/28', ''),
(30, 'post/withid/29', 'post/withid/29', 'post/withid/29', ''),
(31, 'post/withid/30', 'post/withid/30', '', ''),
(32, 'post/withid/31', 'post/withid/31', 'post/withid/31', ''),
(35, 'post/withid/34', 'usdjpy-reaches-the-major-level-wait-for-breakout-or-reversal-', 'usdjpy-reaches-the-major-level-wait-for-breakout-or-reversal-', ''),
(36, 'post/withid/35', 'post/withid/35', '', ''),
(37, 'post/withid/36', 'signal-forex', 'signal-forex', ''),
(38, 'post/withid/37', '1358-points-profit-made-successfully-in-audchf-sell-signal', '1358-points-profit-made-successfully-in-audchf-sell-signal', ''),
(39, 'post/withid/38', 'post/withid/38', '', ''),
(40, 'post/withid/39', 'post/withid/39', '', ''),
(41, 'post/withid/40', 'post/withid/40', '', ''),
(42, 'post/withid/41', 'post/withid/41', '', ''),
(43, 'post/withid/42', 'post/withid/42', 'post/withid/42', ''),
(44, 'post/withid/43', 'post/withid/43', '', ''),
(45, 'post/withid/44', 'post/withid/44', '', ''),
(46, 'post/withid/45', 'post/withid/45', '', ''),
(47, 'post/withid/46', 'post/withid/46', 'post/withid/46', ''),
(48, 'post/withid/47', 'nzdjpy-reaches-the-bottom-level-of-the-range-good-to-buy-or-sell-', 'nzdjpy-reaches-the-bottom-level-of-the-range-good-to-buy-or-sell-', ''),
(49, 'post/withid/48', 'post/withid/48', '', ''),
(50, 'post/withid/49', 'post/withid/49', 'post/withid/49', ''),
(51, 'post/withid/50', 'post/withid/50', 'post/withid/50', ''),
(52, 'post/withid/51', 'post/withid/51', 'post/withid/51', ''),
(53, 'post/withid/52', 'post/withid/52', 'post/withid/52', ''),
(54, 'post/withid/53', 'post/withid/53', 'post/withid/53', ''),
(55, 'post/withid/54', '1300-points-reached-in-eurusd-sell-signal', '1300-points-reached-in-eurusd-sell-signal', ''),
(56, 'post/withid/55', '602-points-reached-in-eurgbp-buy-signal', '602-points-reached-in-eurgbp-buy-signal', ''),
(57, 'post/withid/56', '2450-Points-Profit-Reached-in-NZDCAD-Sell-Signal', '2450-Points-Profit-Reached-in-NZDCAD-Sell-Signal', ''),
(58, 'post/withid/57', '1096-Points-Reached-in-EURGBP-Buy-Signal', '1096-Points-Reached-in-EURGBP-Buy-Signal', ''),
(59, 'post/withid/58', 'CHFJPY-Wait-For-The-Confirmation', 'CHFJPY-Wait-For-The-Confirmation', ''),
(62, 'post/withid/61', '750-Points-Profit-Reached-in-CADJPY-Buy-Signal', '750-Points-Profit-Reached-in-CADJPY-Buy-Signal', ''),
(68, 'post/withid/67', '1902-Points-Profit-Reached-in-EURGBP-Buy-Signal', '1902-Points-Profit-Reached-in-EURGBP-Buy-Signal', ''),
(69, 'post/withid/68', '750-points-profit-reached-in-chfjpy-buy-signal', '750-points-profit-reached-in-chfjpy-buy-signal', ''),
(70, 'post/withid/69', 'free-signal-trading', 'free-signal-trading', ''),
(71, 'post/withid/70', 'post/withid/70', '', ''),
(72, 'post/withid/71', '760-point-reached-in-nzdusd-buy-signal', '760-point-reached-in-nzdusd-buy-signal', ''),
(73, 'post/withid/72', '1447-point-profit-reached-in-usdcad-successfully', '1447-point-profit-reached-in-usdcad-successfully', ''),
(74, 'post/withid/73', 'we-like-elling-usdcad', 'we-like-elling-usdcad', ''),
(75, 'post/withid/74', '1115-points-profit-reached-in-eurcad-sell-signal', '1115-points-profit-reached-in-eurcad-sell-signal', ''),
(76, 'post/withid/75', '1171-points-profit-reached-in-audusd-buy-signal', '1171-points-profit-reached-in-audusd-buy-signal', ''),
(77, 'post/withid/76', '2623-points-profit-reached-in-eurcad-sell-signal', '2623-points-profit-reached-in-eurcad-sell-signal', ''),
(78, 'post/withid/77', '847-points-profit-reached-in-gbpnzd-buy-signal-succesfully', '847-points-profit-reached-in-gbpnzd-buy-signal-succesfully', ''),
(79, 'post/withid/78', 'close-partial-usdcad-2749-points', 'close-partial-usdcad-2749-points', ''),
(80, 'post/withid/79', '600-points-loss-sell-signal-in-cadjpy', '600-points-loss-sell-signal-in-cadjpy', ''),
(81, 'post/withid/80', '1635-point-profit-reached-in-gbpnzd-buy-signal-succesfully', '1635-point-profit-reached-in-gbpnzd-buy-signal-succesfully', ''),
(82, 'post/withid/81', 'congratulation-total-growt-6935-point', 'congratulation-total-growt-6935-point', ''),
(83, 'post/withid/82', 'economy-calander-1115-september-2017-boe-meeting-inflation-and-us-retail-sales', 'economy-calander-1115-september-2017-boe-meeting-inflation-and-us-retail-sales', ''),
(84, 'post/withid/83', 'post/withid/83', 'post/withid/83', ''),
(85, 'post/withid/84', 'post/withid/84', '', ''),
(86, 'post/withid/85', 'audusd-trade-idea-for-long-term', 'audusd-trade-idea-for-long-term', ''),
(87, 'post/withid/86', 'usdjpy-analysis-12-oct-2017', 'usdjpy-analysis-12-oct-2017', ''),
(88, 'post/withid/87', 'post/withid/87', '', ''),
(89, 'post/withid/88', 'free-signal-19-oct-2017', 'free-signal-19-oct-2017', ''),
(90, 'post/withid/89', 'post/withid/89', '', ''),
(91, 'post/withid/90', '2303-points-reached-successfully-in-nzdusd-sell-signal', '2303-points-reached-successfully-in-nzdusd-sell-signal', ''),
(92, 'post/withid/91', '1296-points-reached-successfully-in-eurusd-sell-signal', '1296-points-reached-successfully-in-eurusd-sell-signal', ''),
(93, 'post/withid/92', '562-point-profit-reachead-succesfully-sell-eurcad', '562-point-profit-reachead-succesfully-sell-eurcad', ''),
(94, 'post/withid/93', '667-points-profit-reached-successfully-in-eurgbp-buy-signal', '667-points-profit-reached-successfully-in-eurgbp-buy-signal', ''),
(95, 'post/withid/94', '2233-points-profit-reached-successfully-in-eurnzd-buy', '2233-points-profit-reached-successfully-in-eurnzd-buy', ''),
(96, 'post/withid/95', 'aud-nzd-most-vulnerable-to-housing-related-risk-whats-the-trade', 'aud-nzd-most-vulnerable-to-housing-related-risk-whats-the-trade', ''),
(97, 'post/withid/96', 'nomura-gbp-where-to-nposition-ahead-of-the-important-eu-summit-on-dec-1415', 'nomura-gbp-where-to-nposition-ahead-of-the-important-eu-summit-on-dec-1415', ''),
(98, 'post/withid/97', 'eurnzd-into-resistance-pullback-to-offer-entries', 'eurnzd-into-resistance-pullback-to-offer-entries', ''),
(99, 'post/withid/98', 'enjoy-our-50-subcribe-for-premium-package', 'enjoy-our-50-subcribe-for-premium-package', ''),
(100, 'post/withid/99', '511-points-profit-reached-successfully-in-usdcad-sell-signal', '511-points-profit-reached-successfully-in-usdcad-sell-signal', ''),
(101, 'post/withid/100', '889-points-profit-reached-successfully-in-xauusd-buy-signal', '889-points-profit-reached-successfully-in-xauusd-buy-signal', ''),
(102, 'post/withid/101', 'black-friday', 'black-friday', ''),
(103, 'post/withid/102', '578-points-profit-reached-successfully-in-audchf-buy-signal', '578-points-profit-reached-successfully-in-audchf-buy-signal', ''),
(104, 'post/withid/103', '2031-points-profit-reached-successfully-in-xauusd-buy-signal', '2031-points-profit-reached-successfully-in-xauusd-buy-signal', ''),
(105, 'post/withid/104', '618-points-profit-reached-successfully-in-eurnzd-sell-signal', '618-points-profit-reached-successfully-in-eurnzd-sell-signal', ''),
(106, 'post/withid/105', '796-points-profit-reached-successfully-in-gbpjpy-buy-signal', '796-points-profit-reached-successfully-in-gbpjpy-buy-signal', ''),
(107, 'post/withid/106', '830-point-loss-audnzd-sell-signal', '830-point-loss-audnzd-sell-signal', ''),
(108, 'post/withid/107', '576-points-profit-reached-successfully-in-audjpy-buy-signal', '576-points-profit-reached-successfully-in-audjpy-buy-signal', ''),
(109, 'post/withid/108', '752-points-profit-reached-in-euraud-sell-signal', '752-points-profit-reached-in-euraud-sell-signal', ''),
(110, 'post/withid/109', '932-points-profit-reached-in-eurjpy-sell-signal', '932-points-profit-reached-in-eurjpy-sell-signal', ''),
(111, 'post/withid/110', '787-points-profit-reached-in-usdcad-buy-signal', '787-points-profit-reached-in-usdcad-buy-signal', ''),
(112, 'post/withid/111', '1215-points-profit-reached-in-nzdchf-buy-signal', '1215-points-profit-reached-in-nzdchf-buy-signal', ''),
(113, 'post/withid/112', '826-point-loss-buy-audcad', '826-point-loss-buy-audcad', ''),
(114, 'post/withid/113', 'trading-results-1414-points-profit-reached-in-nzdusd-buysignal', 'trading-results-1414-points-profit-reached-in-nzdusd-buysignal', ''),
(116, 'post/withid/115', '994-points-profit-reached-in-usdcad-buysignal', '994-points-profit-reached-in-usdcad-buysignal', '');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(200) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Processed', '2019-12-17 00:00:00', '2019-12-17 00:00:00'),
(2, 'Approved', '2019-12-17 00:00:00', '2019-12-17 00:00:00'),
(3, 'Rejected', '2019-12-17 00:00:00', '2019-12-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `IP` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `username` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `postal` varchar(200) DEFAULT NULL,
  `fullname` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `first_name` int(11) NOT NULL,
  `last_name` int(11) NOT NULL,
  `jabatan` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `nip` varchar(500) NOT NULL,
  `avatar` varchar(1000) NOT NULL DEFAULT 'default.png',
  `joined` int(11) NOT NULL DEFAULT '0',
  `joined_date` varchar(10) NOT NULL DEFAULT '',
  `online_timestamp` int(11) NOT NULL DEFAULT '0',
  `oauth_provider` varchar(40) NOT NULL DEFAULT '',
  `oauth_id` varchar(1000) NOT NULL DEFAULT '',
  `oauth_token` varchar(1500) NOT NULL DEFAULT '',
  `oauth_secret` varchar(500) NOT NULL DEFAULT '',
  `email_notification` int(11) NOT NULL DEFAULT '1',
  `aboutme` varchar(1000) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `points` decimal(10,2) NOT NULL DEFAULT '0.00',
  `user_role` int(11) NOT NULL DEFAULT '0',
  `premium_planid` int(11) NOT NULL DEFAULT '0',
  `channel` varchar(200) NOT NULL,
  `currency` varchar(200) NOT NULL,
  `amount` varchar(200) NOT NULL,
  `premium_time` int(11) NOT NULL,
  `paymentstatus` int(11) NOT NULL DEFAULT '0',
  `exp_date` date DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `activate_code` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `email`, `password`, `token`, `IP`, `username`, `phone`, `address`, `city`, `state`, `postal`, `fullname`, `first_name`, `last_name`, `jabatan`, `nip`, `avatar`, `joined`, `joined_date`, `online_timestamp`, `oauth_provider`, `oauth_id`, `oauth_token`, `oauth_secret`, `email_notification`, `aboutme`, `points`, `user_role`, `premium_planid`, `channel`, `currency`, `amount`, `premium_time`, `paymentstatus`, `exp_date`, `active`, `activate_code`) VALUES
(1, 'pimpinan@gmail.com', '$2a$12$GMSCI2mtlyXhRdjlv.eat.RCmyG.xQMzPt.Elxy7agK90LTleAeIm', 'f82dd391e1a679a15d92da7e47676284', '::1', '', '087822063853', NULL, NULL, NULL, NULL, 'Pimpinan PLN', 0, 0, 'owner', '12345678', 'default.png', 1569462068, '9-2019', 1571973313, '', '', '', '', 1, '', '0.00', 5, 0, '', '', '', 0, 0, NULL, 1, ''),
(404, 'dode.agung.asmara@gmail.com', '$2a$12$GMSCI2mtlyXhRdjlv.eat.RCmyG.xQMzPt.Elxy7agK90LTleAeIm', '9fecab5679b7b73d97aa81cc155e690b', '::1', '', '087822063853', NULL, NULL, NULL, NULL, 'I Dewa Gede Agung Asmara', 0, 0, 'owner', '12345678', 'default.png', 1569462068, '9-2019', 1576744057, '', '', '', '', 1, '', '0.00', 5, 0, '', '', '', 0, 0, NULL, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_custom_fields`
--

CREATE TABLE `user_custom_fields` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_events`
--

CREATE TABLE `user_events` (
  `ID` int(11) NOT NULL,
  `IP` varchar(255) NOT NULL DEFAULT '',
  `event` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_events`
--

INSERT INTO `user_events` (`ID`, `IP`, `event`, `timestamp`) VALUES
(1, '::1', 'email_activation_request', 1493153263),
(2, '120.188.86.127', 'email_activation_request', 1494305466),
(3, '120.188.86.127', 'email_activation_request', 1494306443),
(4, '120.188.86.127', 'email_activation_request', 1494307413),
(5, '120.188.86.127', 'email_activation_request', 1494309865),
(6, '120.188.86.127', 'email_activation_request', 1494311008);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `ID` int(11) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `default` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`ID`, `name`, `default`) VALUES
(1, 'Default Group', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_users`
--

CREATE TABLE `user_group_users` (
  `ID` int(11) NOT NULL,
  `groupid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_users`
--

INSERT INTO `user_group_users` (`ID`, `groupid`, `userid`) VALUES
(24, 1, 403),
(25, 1, 404);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `admin` int(11) NOT NULL DEFAULT '0',
  `admin_settings` int(11) NOT NULL DEFAULT '0',
  `admin_members` int(11) NOT NULL DEFAULT '0',
  `admin_payment` int(11) NOT NULL DEFAULT '0',
  `banned` int(11) NOT NULL,
  `content_manager` int(11) NOT NULL,
  `content_worker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`ID`, `name`, `admin`, `admin_settings`, `admin_members`, `admin_payment`, `banned`, `content_manager`, `content_worker`) VALUES
(1, 'Admin', 1, 0, 0, 0, 0, 0, 0),
(2, 'Member Manager', 0, 0, 1, 0, 0, 0, 0),
(3, 'Admin Settings', 0, 1, 0, 0, 0, 0, 0),
(4, 'Admin Payments', 0, 0, 0, 1, 0, 0, 0),
(5, 'Member', 0, 0, 1, 0, 0, 0, 0),
(6, 'Banned', 0, 0, 0, 0, 1, 0, 0),
(7, 'Content Manager', 0, 0, 0, 0, 0, 1, 0),
(8, 'Content Worker', 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `no_reg` varchar(100) NOT NULL,
  `nama` text NOT NULL,
  `id_perusahaan` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `uraian` text NOT NULL,
  `tanggal_pengajuan` datetime NOT NULL,
  `mulai_tanggal` datetime NOT NULL,
  `selesai_tanggal` datetime NOT NULL,
  `id_level` int(11) NOT NULL,
  `id_status` int(11) NOT NULL DEFAULT '1',
  `id_approve` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `no_reg`, `nama`, `id_perusahaan`, `id_lokasi`, `uraian`, `tanggal_pengajuan`, `mulai_tanggal`, `selesai_tanggal`, `id_level`, `id_status`, `id_approve`, `id_user`, `created_at`, `updated_at`) VALUES
(1, '610', 'Gina Sanjaya', 1, 1, 'Perapian Kabel di Parit kabel (Uji Coba WP Online)', '2019-03-17 00:00:00', '2019-03-17 00:00:00', '2019-03-17 00:00:00', 1, 1, 1, 404, '2019-03-17 00:00:00', '2019-03-17 00:00:00'),
(2, '610', 'Gina Sanjaya2', 1, 1, 'Perapian Kabel di Parit kabel (Uji Coba WP Online)', '2019-03-17 00:00:00', '2019-03-17 00:00:00', '2019-03-17 00:00:00', 1, 1, 1, 404, '2019-03-17 00:00:00', '2019-03-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `yourtable`
--

CREATE TABLE `yourtable` (
  `Sitecode` varchar(2) DEFAULT NULL,
  `Month` varchar(3) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `yourtable`
--

INSERT INTO `yourtable` (`Sitecode`, `Month`, `Amount`) VALUES
('XX', 'Jan', 1000),
('XX', 'Jan', 3000),
('XX', 'Apr', 3000),
('XX', 'Apr', 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_account`
--
ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `contact_subcription`
--
ALTER TABLE `contact_subcription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_categories`
--
ALTER TABLE `content_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_galleries`
--
ALTER TABLE `content_galleries`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_gallery_albums`
--
ALTER TABLE `content_gallery_albums`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_gallery_categories`
--
ALTER TABLE `content_gallery_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_gallery_comments`
--
ALTER TABLE `content_gallery_comments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_pages`
--
ALTER TABLE `content_pages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_page_comments`
--
ALTER TABLE `content_page_comments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_page_groups`
--
ALTER TABLE `content_page_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_page_plans`
--
ALTER TABLE `content_page_plans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_page_roles`
--
ALTER TABLE `content_page_roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_posts`
--
ALTER TABLE `content_posts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_post_categories`
--
ALTER TABLE `content_post_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_post_comments`
--
ALTER TABLE `content_post_comments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `content_slider`
--
ALTER TABLE `content_slider`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `currency_converter`
--
ALTER TABLE `currency_converter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `duration_plan`
--
ALTER TABLE `duration_plan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `email_queue`
--
ALTER TABLE `email_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `home_stats`
--
ALTER TABLE `home_stats`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ipn_log`
--
ALTER TABLE `ipn_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ip_block`
--
ALTER TABLE `ip_block`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bot` (`bot`,`action`,`chat`,`date`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payment_plans`
--
ALTER TABLE `payment_plans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`idpro`);

--
-- Indexes for table `regional`
--
ALTER TABLE `regional`
  ADD PRIMARY KEY (`idreg`);

--
-- Indexes for table `reset_log`
--
ALTER TABLE `reset_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `site_coupon`
--
ALTER TABLE `site_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_menus`
--
ALTER TABLE `site_menus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `site_menu_links`
--
ALTER TABLE `site_menu_links`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `site_slugs`
--
ALTER TABLE `site_slugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `keyword` (`controller`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_custom_fields`
--
ALTER TABLE `user_custom_fields`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_events`
--
ALTER TABLE `user_events`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_group_users`
--
ALTER TABLE `user_group_users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_account`
--
ALTER TABLE `bank_account`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `email_queue`
--
ALTER TABLE `email_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reset_log`
--
ALTER TABLE `reset_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;
--
-- AUTO_INCREMENT for table `user_group_users`
--
ALTER TABLE `user_group_users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
