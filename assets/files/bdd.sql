-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 05, 2019 at 09:17 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `blog_e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_customer`
--

CREATE TABLE `address_customer` (
  `id` int(11) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `zipCode` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `coverImage` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `coverImage`) VALUES
(1, 'modification du titre', 'modification du texte ou des images de texte', 'cover_img-2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `article_status`
--

CREATE TABLE `article_status` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_blog`
--

CREATE TABLE `category_blog` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_blog`
--

INSERT INTO `category_blog` (`id`, `type`) VALUES
(1, 'TiTi'),
(2, 'Basketball'),
(3, 'Football'),
(4, 'Hockey'),
(5, 'Natation'),
(6, 'Handball'),
(7, 'Course');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` int(11) NOT NULL,
  `type` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `civilite`
--

CREATE TABLE `civilite` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `civilite`
--

INSERT INTO `civilite` (`id`, `type`) VALUES
(1, 'Monsieur'),
(2, 'Madame');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` varchar(250) NOT NULL,
  `authorized` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `authorized`, `date`, `id_user`, `id_article`) VALUES
(1, 'mon commentaire modifié', 1, '2019-03-02', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderCustomer`
--

CREATE TABLE `orderCustomer` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `price` decimal(15,3) NOT NULL,
  `reference` varchar(250) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `picture` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `price`, `reference`, `stock`, `name`, `picture`, `description`, `enabled`) VALUES
(1, '12.000', 'A125', 0, 'truc', 'images/truc.gif', 'truc totalement inutile', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rel_address_orderCustomer`
--

CREATE TABLE `rel_address_orderCustomer` (
  `id` int(11) NOT NULL,
  `id_orderCustomer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rel_address_type`
--

CREATE TABLE `rel_address_type` (
  `id` int(11) NOT NULL,
  `id_address_customer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rel_article_category`
--

CREATE TABLE `rel_article_category` (
  `id` int(11) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rel_event_article`
--

CREATE TABLE `rel_event_article` (
  `id` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `id_article_status` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rel_orderCustomer_product`
--

CREATE TABLE `rel_orderCustomer_product` (
  `id` int(11) NOT NULL,
  `id_orderCustomer` int(11) NOT NULL,
  `price` decimal(15,3) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rel_product_category`
--

CREATE TABLE `rel_product_category` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_address`
--

CREATE TABLE `type_address` (
  `id` int(11) NOT NULL,
  `type` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `id_civilite` int(11) NOT NULL,
  `id_user_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `mail`, `password`, `avatar`, `id_civilite`, `id_user_status`) VALUES
(1, 'Gonzalez', 'Victor', 'victor@gonzalez.fr', 'toto', 'image/maphoto.png', 1, 2),
(2, 'Sibassier', 'Lisa', 'lisalabellegossdu33@gmail.com', 'yoanlebogossdu33', 'liendemonavatar', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `type`) VALUES
(1, 'Lecteur'),
(2, 'redacteur'),
(3, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_customer`
--
ALTER TABLE `address_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_status`
--
ALTER TABLE `article_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_blog`
--
ALTER TABLE `category_blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `civilite`
--
ALTER TABLE `civilite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_user_FK` (`id_user`),
  ADD KEY `comment_article0_FK` (`id_article`);

--
-- Indexes for table `orderCustomer`
--
ALTER TABLE `orderCustomer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderCustomer_user_FK` (`id_user`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rel_address_orderCustomer`
--
ALTER TABLE `rel_address_orderCustomer`
  ADD PRIMARY KEY (`id`,`id_orderCustomer`),
  ADD KEY `rel_address_orderCustomer_orderCustomer0_FK` (`id_orderCustomer`);

--
-- Indexes for table `rel_address_type`
--
ALTER TABLE `rel_address_type`
  ADD PRIMARY KEY (`id`,`id_address_customer`),
  ADD KEY `rel_address_type_address_customer0_FK` (`id_address_customer`);

--
-- Indexes for table `rel_article_category`
--
ALTER TABLE `rel_article_category`
  ADD PRIMARY KEY (`id`,`id_article`),
  ADD KEY `rel_article_category_article0_FK` (`id_article`);

--
-- Indexes for table `rel_event_article`
--
ALTER TABLE `rel_event_article`
  ADD PRIMARY KEY (`id`,`id_article`,`id_article_status`),
  ADD KEY `rel_event_article_article0_FK` (`id_article`),
  ADD KEY `rel_event_article_article_status1_FK` (`id_article_status`);

--
-- Indexes for table `rel_orderCustomer_product`
--
ALTER TABLE `rel_orderCustomer_product`
  ADD PRIMARY KEY (`id`,`id_orderCustomer`),
  ADD KEY `rel_orderCustomer_product_orderCustomer0_FK` (`id_orderCustomer`);

--
-- Indexes for table `rel_product_category`
--
ALTER TABLE `rel_product_category`
  ADD PRIMARY KEY (`id`,`id_product`),
  ADD KEY `rel_product_category_product0_FK` (`id_product`);

--
-- Indexes for table `type_address`
--
ALTER TABLE `type_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_civilite_FK` (`id_civilite`),
  ADD KEY `user_user_status0_FK` (`id_user_status`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_customer`
--
ALTER TABLE `address_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `article_status`
--
ALTER TABLE `article_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_blog`
--
ALTER TABLE `category_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `civilite`
--
ALTER TABLE `civilite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orderCustomer`
--
ALTER TABLE `orderCustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `type_address`
--
ALTER TABLE `type_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_article0_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `comment_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `orderCustomer`
--
ALTER TABLE `orderCustomer`
  ADD CONSTRAINT `orderCustomer_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `rel_address_orderCustomer`
--
ALTER TABLE `rel_address_orderCustomer`
  ADD CONSTRAINT `rel_address_orderCustomer_address_customer_FK` FOREIGN KEY (`id`) REFERENCES `address_customer` (`id`),
  ADD CONSTRAINT `rel_address_orderCustomer_orderCustomer0_FK` FOREIGN KEY (`id_orderCustomer`) REFERENCES `orderCustomer` (`id`);

--
-- Constraints for table `rel_address_type`
--
ALTER TABLE `rel_address_type`
  ADD CONSTRAINT `rel_address_type_address_customer0_FK` FOREIGN KEY (`id_address_customer`) REFERENCES `address_customer` (`id`),
  ADD CONSTRAINT `rel_address_type_type_address_FK` FOREIGN KEY (`id`) REFERENCES `type_address` (`id`);

--
-- Constraints for table `rel_article_category`
--
ALTER TABLE `rel_article_category`
  ADD CONSTRAINT `rel_article_category_article0_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `rel_article_category_category_blog_FK` FOREIGN KEY (`id`) REFERENCES `category_blog` (`id`);

--
-- Constraints for table `rel_event_article`
--
ALTER TABLE `rel_event_article`
  ADD CONSTRAINT `rel_event_article_article0_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `rel_event_article_article_status1_FK` FOREIGN KEY (`id_article_status`) REFERENCES `article_status` (`id`),
  ADD CONSTRAINT `rel_event_article_user_FK` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Constraints for table `rel_orderCustomer_product`
--
ALTER TABLE `rel_orderCustomer_product`
  ADD CONSTRAINT `rel_orderCustomer_product_orderCustomer0_FK` FOREIGN KEY (`id_orderCustomer`) REFERENCES `orderCustomer` (`id`),
  ADD CONSTRAINT `rel_orderCustomer_product_product_FK` FOREIGN KEY (`id`) REFERENCES `product` (`id`);

--
-- Constraints for table `rel_product_category`
--
ALTER TABLE `rel_product_category`
  ADD CONSTRAINT `rel_product_category_category_product_FK` FOREIGN KEY (`id`) REFERENCES `category_product` (`id`),
  ADD CONSTRAINT `rel_product_category_product0_FK` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_civilite_FK` FOREIGN KEY (`id_civilite`) REFERENCES `civilite` (`id`),
  ADD CONSTRAINT `user_user_status0_FK` FOREIGN KEY (`id_user_status`) REFERENCES `user_status` (`id`);

