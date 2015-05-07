-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Maio-2015 às 05:49
-- Versão do servidor: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `xchange`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE IF NOT EXISTS `item` (
`id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(250) NOT NULL,
  `quantity` int(11) NOT NULL,
  `owner_username` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`id`, `title`, `description`, `quantity`, `owner_username`) VALUES
(1, 'GoPro', 'esse item é bonito, muito bonito. O mais bonito do mundo', 1, 'dfremy'),
(2, 'Laptop', 'nem quero vender', 1, 'user1'),
(4, 'Consolo', 'Cor negra, 30 cm. Usado muitas vezes, mas continua rígido e gostoso.', 2, 'caiodecostas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
`id` int(11) NOT NULL,
  `username1` varchar(30) NOT NULL,
  `username2` varchar(30) NOT NULL,
  `item1_id` int(11) NOT NULL,
  `item2_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `transaction`
--

INSERT INTO `transaction` (`id`, `username1`, `username2`, `item1_id`, `item2_id`, `status`) VALUES
(3, 'user1', 'dfremy', 2, 1, 'pending');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_table`
--

CREATE TABLE IF NOT EXISTS `user_table` (
  `username` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL,
  `fullname` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user_table`
--

INSERT INTO `user_table` (`username`, `password`, `fullname`, `email`) VALUES
('caiodecostas', 'teste123', 'Caio Alves', 'cariodecosta@ando.ocu.com'),
('dfremy', 'teste123', 'Remy de Fru', 'dfremy@msn.com'),
('user1', 'teste123', 'Teste 1', 'teste1@teste1.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item`
--
ALTER TABLE `item`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_username` (`owner_username`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_username1` (`username1`), ADD KEY `fk_username2` (`username2`), ADD KEY `fk_item1` (`item1_id`), ADD KEY `fk_item2` (`item2_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
 ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `item`
--
ALTER TABLE `item`
ADD CONSTRAINT `fk_username` FOREIGN KEY (`owner_username`) REFERENCES `user_table` (`username`);

--
-- Limitadores para a tabela `transaction`
--
ALTER TABLE `transaction`
ADD CONSTRAINT `fk_item1` FOREIGN KEY (`item1_id`) REFERENCES `item` (`id`),
ADD CONSTRAINT `fk_item2` FOREIGN KEY (`item2_id`) REFERENCES `item` (`id`),
ADD CONSTRAINT `fk_username1` FOREIGN KEY (`username1`) REFERENCES `user_table` (`username`),
ADD CONSTRAINT `fk_username2` FOREIGN KEY (`username2`) REFERENCES `user_table` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
