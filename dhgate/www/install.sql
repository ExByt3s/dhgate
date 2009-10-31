-- phpMyAdmin SQL Dump
-- version 2.6.1
-- http://www.phpmyadmin.net
-- 
-- ����: localhost
-- ����� ��������: ��� 29 2009 �., 14:07
-- ������ �������: 5.0.45
-- ������ PHP: 5.2.4
-- 
-- ��: `dhgate`
-- 
CREATE DATABASE `dhgate` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE dhgate;

-- --------------------------------------------------------

-- 
-- ��������� ������� `adress`
-- 

CREATE TABLE `adress` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `nickname` text character set utf8,
  `title` text character set utf8,
  `company` text character set utf8,
  `firstname` text character set utf8,
  `lastname` text character set utf8,
  `middlename` text character set utf8,
  `adress` text character set utf8,
  `adress2` text character set utf8,
  `city` text character set utf8,
  `zip` text character set utf8,
  `country` text character set utf8,
  `state` text character set utf8,
  `phone` text character set utf8,
  `mobilephone` text character set utf8,
  `fax` text character set utf8,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=9 ;

-- 
-- ���� ������ ������� `adress`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `cart`
-- 

CREATE TABLE `cart` (
  `id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `active` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- ���� ������ ������� `cart`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `catalog`
-- 

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL auto_increment,
  `parent` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

-- 
-- ���� ������ ������� `catalog`
-- 

INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (38, 0, 0, 'computer\\''s');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (37, 25, 1, 'item 1 - 1');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (36, 0, 0, 'item 11 - 1');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (35, 0, 0, 'ITEM 11');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (34, 0, 0, 'ITEM 10');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (33, 0, 0, 'ITEM 9');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (32, 0, 0, 'ITEM 8');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (31, 0, 0, 'ITEM 7');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (30, 0, 0, 'ITEM 6');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (29, 0, 0, 'ITEM 5');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (28, 0, 0, 'ITEM 4');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (27, 0, 0, 'ITEM 3');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (26, 0, 0, 'ITEM 2');
INSERT INTO `catalog` (`id`, `parent`, `level`, `title`) VALUES (25, 0, 0, 'ITEM 1');

-- --------------------------------------------------------

-- 
-- ��������� ������� `comment_user`
-- 

CREATE TABLE `comment_user` (
  `id` int(11) NOT NULL auto_increment,
  `parent` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `text` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime default NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

-- 
-- ���� ������ ������� `comment_user`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `connect_catalog_product`
-- 

CREATE TABLE `connect_catalog_product` (
  `id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- 
-- ���� ������ ������� `connect_catalog_product`
-- 

INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (14, 10, 14);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (15, 10, 15);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (16, 23, 16);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (17, 13, 17);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (18, 25, 18);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (19, 25, 19);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (20, 25, 20);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (21, 25, 21);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (22, 25, 22);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (23, 37, 23);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (24, 36, 24);
INSERT INTO `connect_catalog_product` (`id`, `category_id`, `item_id`) VALUES (25, 38, 25);

-- --------------------------------------------------------

-- 
-- ��������� ������� `connect_product_interested`
-- 

CREATE TABLE `connect_product_interested` (
  `id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- ���� ������ ������� `connect_product_interested`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `country`
-- 

CREATE TABLE `country` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `allowed` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- ���� ������ ������� `country`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `order`
-- 

CREATE TABLE `order` (
  `id` int(11) NOT NULL auto_increment,
  `shipping` int(11) NOT NULL,
  `adress` int(11) NOT NULL,
  `payment` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `card_number` text,
  `card_name` text NOT NULL,
  `num` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- ���� ������ ������� `order`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `product`
-- 

CREATE TABLE `product` (
  `id` int(11) NOT NULL auto_increment,
  `title` text,
  `price` int(11) default '0',
  `short_about` text,
  `about` text NOT NULL,
  `processing` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- 
-- ���� ������ ������� `product`
-- 

INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (14, 'qwe', 123, '321', '321', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (15, 'weq', 123, 'sdf', 'sdf', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (16, 'sda', 3, 'dc', 'fdsa', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (17, 'fdgs', 11, 'dsaa', 'sdfasdf', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (18, '', 0, '', '', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (19, '', 0, '', '', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (20, 'wqer', 0, '', '', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (21, 'product', 0, 'product qwe', 'qwe', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (22, 'product', 150, 'wqer', '1221\r\n1221\r\n1221\r\n1221', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (23, 'item 1-1', 150, '123321321', '498464', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (24, 'qwe', 313, 'asdf', 'asdfasdfasdfasdf\r\nas\r\ndf\r\nasd\r\nа\r\nasd\r\nfa\r\nsdf\r\nas\r\ndf\r\nasd\r\nа\r\nфыв', 0);
INSERT INTO `product` (`id`, `title`, `price`, `short_about`, `about`, `processing`) VALUES (25, 'safdsa', 150, 'adsa', 'sdfasdfasdfasd\r\nsadf\r\nasd\r\nf', 0);

-- --------------------------------------------------------

-- 
-- ��������� ������� `rating_comment_user`
-- 

CREATE TABLE `rating_comment_user` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- ���� ������ ������� `rating_comment_user`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `settings`
-- 

CREATE TABLE `settings` (
  `id` int(11) NOT NULL auto_increment,
  `gbp` double NOT NULL,
  `usd` double NOT NULL,
  `eur` double NOT NULL,
  `about` text NOT NULL,
  `help` text NOT NULL,
  `contact` text,
  `terms` text NOT NULL,
  `privacy` text NOT NULL,
  `info` text NOT NULL,
  `window` text NOT NULL,
  `title` text NOT NULL,
  `buy` text NOT NULL,
  `payment` text NOT NULL,
  `mail` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- ���� ������ ������� `settings`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `shipping`
-- 

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL auto_increment,
  `text` text NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- ���� ������ ������� `shipping`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `state`
-- 

CREATE TABLE `state` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `country_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- ���� ������ ������� `state`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `user`
-- 

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `login` text NOT NULL,
  `pass` text NOT NULL,
  `mail` text NOT NULL,
  `firstname` text,
  `middlename` text,
  `lastname` text,
  `admin` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- 
-- ���� ������ ������� `user`
-- 

INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (10, 'Admin', 'afe4f7f8e079efa8b651df30159ceed3', 'vikhodcev@mail.ru', NULL, NULL, NULL, 1);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (8, 'viknet', 'a7a58978071b5f28a0b2a8ed826f9140', 'vikhodcev', NULL, NULL, NULL, 0);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (11, 'lexa.viknet', 'b366b51cfff2a0190d6c00e711ec402c', 'lexa.viknet@gmail.com', NULL, NULL, NULL, 0);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (12, 'asd', '7815696ecbf1c96e6894b779456d330e', 'asd', NULL, NULL, NULL, 0);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (13, 'qwe', '76d80224611fc919a5d54f0ff9fba446', 'qwe@qwe.qw', NULL, NULL, NULL, 0);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (14, 'god', 'a7a58978071b5f28a0b2a8ed826f9140', 'god@king.com', NULL, NULL, NULL, 0);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (15, 'Zloy', '25f9e794323b453885f5181f1b624d0b', 'max.zloy@gmail.com', NULL, NULL, NULL, 0);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (16, 'MONSTER', '8bf61b20db14077e1f7a6c77f8f488a4', 'ru@ru.ru', '�������', '�����������', '��������', 1);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (17, 'test', '05a671c66aefea124cc08b76ea6d30bb', 'test@test.ru', NULL, NULL, NULL, 0);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (18, '321', '9f33252320de0aa30c9ca682135aa9d4', 'qwe@qew.ru', NULL, NULL, NULL, 0);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (19, '123', '9fbc1cfb009579090be0396f7c719cb1', 'qwe@qew.com', NULL, NULL, NULL, 0);
INSERT INTO `user` (`id`, `login`, `pass`, `mail`, `firstname`, `middlename`, `lastname`, `admin`) VALUES (20, 'user', '25f9e794323b453885f5181f1b624d0b', 'user@user.com', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

-- 
-- ��������� ������� `user_rating`
-- 

CREATE TABLE `user_rating` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- ���� ������ ������� `user_rating`
-- 

        