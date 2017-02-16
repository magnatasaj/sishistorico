-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16-Fev-2017 às 19:40
-- Versão do servidor: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sishistorico`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `his_eleitor`
--

CREATE TABLE `his_eleitor` (
  `id` int(255) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `whats` varchar(20) DEFAULT NULL,
  `tipo` int(10) NOT NULL,
  `sus` varchar(20) NOT NULL,
  `obs` varchar(100) NOT NULL,
  `referencia` varchar(22) NOT NULL,
  `pertence` int(10) NOT NULL,
  `nascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `his_eleitor`
--

INSERT INTO `his_eleitor` (`id`, `nome`, `cpf`, `rg`, `email`, `telefone`, `whats`, `tipo`, `sus`, `obs`, `referencia`, `pertence`, `nascimento`) VALUES
(2, 'rodrigo', '00065464654654', '1111111111111', 'r@r.com', '6666666666666666', '888888888888888', 1, 'sssss', '                                           ffff', 'tia', 1, '2016-12-12'),
(3, 'rodrigo', '00065464654654', '5', 'r@r.com', '6666666666666666', '888888888888888', 1, 'sssss', 'dd                                            ', 'tia', 1, '2016-12-12'),
(4, 'b', '1993', '2121', 'r@r.com', '333', '556556465465465', 1, '2112', '0000000000000                                            ', 'dfdfdfdsf', 1, '2016-05-05'),
(5, 'rodrigo', '5', 'dasdas', 'joseliapg2paixao@hotmail.com', '6666666666666666', '5', 1, '2112', 'sempre', 'dsda', 1, '2016-12-12'),
(10, 'monica', '555656', '56', 'rodrig0d2@yahoo.com.br', '56', '56', 1, '56', '56                                            ', '556', 1, '2016-12-12'),
(11, 'kk', 'k', 'k', 'rodrig0d2@yahoo.com.br', '4445', '5656', 1, '545', 'dsadsadas', '231', 1, '2016-12-12'),
(15, 't', '45', '55', 'rodrig0d2@yahoo.com.br', '55', '55', 1, '5', '55                                            ', '555', 1, '2016-12-12'),
(16, 'g', '5', '5', 'rodrig0d2@yahoo.com.br', '88', '8', 1, '5', '58                                            ', '8', 1, '2016-12-12'),
(17, '45', '5', '5', 'r@r.com', '56', '65', 1, '5', '65                                            ', '65', 1, '2016-12-12'),
(18, '9', '5', '5', 'r@r.com', '65', '5', 1, '5', '5                                            ', '5', 1, '2016-12-12'),
(19, '8', '5', '56565', 'rodrig0d2@yahoo.com.br', '65', '56', 1, '56', '65                                            ', '56', 1, '2016-12-12'),
(20, '565656', '45', '45', 'r@r.com', '21', '22', 1, '54', '12                                            ', 'dd', 1, '2016-12-12'),
(21, '56', '66', '6', 'r@r.com', '6', '6', 1, '6', '6                                            ', '6', 1, '2016-12-12'),
(22, '55656', '5', '5', 'r@r.com', '5', '5', 1, '5', '5665                                            ', 'sasa', 1, '2016-12-12'),
(23, '5', '4', '4', 'r@r.com', '4', '4', 1, '4', '4                                            ', '4', 1, '2016-12-12'),
(24, 'vai da certo', '456465', '564654', 'r@r.com', '65465456', '4654', 1, '564564', '564                                            ', '564', 1, '2016-12-12'),
(25, 'vai da certo', '456465', '564654', 'r@r.com', '65465456', '4654', 1, '564564', '564                                            ', '564', 1, '2016-12-12'),
(26, 'vai da certo', '456465', '564654', 'r@r.com', '65465456', '4654', 1, '564564', '564                                            ', '564', 1, '2016-12-12'),
(27, 'vai da certo', '456465', '564654', 'r@r.com', '65465456', '4654', 1, '564564', '564                                            ', '564', 1, '2016-12-12'),
(28, 'vai da certo', '456465', '564654', 'r@r.com', '65465456', '4654', 1, '564564', '564                                            ', '564', 1, '2016-12-12'),
(29, 'vai da certo', '456465', '564654', 'r@r.com', '65465456', '4654', 1, '564564', '564                                            ', '564', 1, '2016-12-12'),
(30, 'Rodrigo Barbosa da Silva', '22222223427', '909090900990', 'xxxxxx@yahoo.com.br', '78787987897', '897897897897', 2, '099009099009', 'Pertence a família xxxxx', 'ddd', 0, '1993-01-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `his_endereco`
--

CREATE TABLE `his_endereco` (
  `id` int(11) NOT NULL,
  `rua` varchar(200) DEFAULT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `N` varchar(200) DEFAULT NULL,
  `cidade` varchar(200) DEFAULT NULL,
  `cep` varchar(200) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `localidade` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `his_endereco`
--

INSERT INTO `his_endereco` (`id`, `rua`, `bairro`, `N`, `cidade`, `cep`, `id_user`, `localidade`) VALUES
(3, 'nova', 'sao', '162', 'saj', '44572', 2, 1),
(4, 'nova', '5', '162', 'saj', '44572', 3, 1),
(5, 'f', 'e', 'm', 'c', 'cepd', 4, 1),
(6, 'dsds', 'dsd', 'dsd', 'dsds', 'dsds', 5, 1),
(11, '655656', '6556', '56', '5656', '56', 10, 1),
(12, '56', '65656', '655656', '565656', '565665', 11, 1),
(16, '555', '55', '55', '55', '55', 15, 1),
(17, '8', '8', '8', '8', '8', 16, 1),
(18, '65', '65', '65', '65', '65', 17, 1),
(19, '5', '5', '5', '5', '5', 18, 1),
(20, '56', '56', '56', '56', '56', 19, 1),
(21, '2', '2', '2', '2', '2', 20, 1),
(22, '6', '6', '6', '6', '6', 21, 1),
(23, '1231', '231321', '23321', '222', '2', 22, 1),
(24, '4', '4', '4', '4', '4', 23, 1),
(25, '64', '56456', '4', '56456', '45', 24, 1),
(26, '64', '56456', '4', '56456', '45', 25, 1),
(27, '64', '56456', '4', '56456', '45', 26, 1),
(28, '64', '56456', '4', '56456', '45', 27, 1),
(29, '64', '56456', '4', '56456', '45', 28, 1),
(30, '64', '56456', '4', '56456', '45', 29, 1),
(31, 'rua teste', 'São Benedito', '123', 'Santo Antonio de Jesus', '44573-400', 30, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `his_historico`
--

CREATE TABLE `his_historico` (
  `id` int(22) NOT NULL,
  `data_entrada` date NOT NULL,
  `data_agendada` date DEFAULT NULL,
  `tipo` int(22) NOT NULL,
  `situacao` int(2) NOT NULL,
  `solicitacao` text,
  `id_eleitor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `his_tipo`
--

CREATE TABLE `his_tipo` (
  `id` int(22) NOT NULL,
  `nome` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `his_tipo`
--

INSERT INTO `his_tipo` (`id`, `nome`) VALUES
(1, 'simples'),
(2, 'Família '),
(3, 'Lider');

-- --------------------------------------------------------

--
-- Estrutura da tabela `his_tipo_historico`
--

CREATE TABLE `his_tipo_historico` (
  `id` int(22) NOT NULL,
  `nome` varchar(22) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `his_tipo_historico`
--

INSERT INTO `his_tipo_historico` (`id`, `nome`) VALUES
(1, 'Geral'),
(2, 'Saúde'),
(3, 'Judicial'),
(4, 'Moradia ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `his_user`
--

CREATE TABLE `his_user` (
  `id` int(255) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `his_user`
--

INSERT INTO `his_user` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES
(1, 'desenvolvimento', 'admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

CREATE TABLE `imagem` (
  `id` int(22) NOT NULL,
  `imagem` longblob NOT NULL,
  `id_user` int(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `his_eleitor`
--
ALTER TABLE `his_eleitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo` (`tipo`);

--
-- Indexes for table `his_endereco`
--
ALTER TABLE `his_endereco`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indexes for table `his_historico`
--
ALTER TABLE `his_historico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `his_tipo`
--
ALTER TABLE `his_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `his_tipo_historico`
--
ALTER TABLE `his_tipo_historico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `his_user`
--
ALTER TABLE `his_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imagem`
--
ALTER TABLE `imagem`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `his_eleitor`
--
ALTER TABLE `his_eleitor`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `his_endereco`
--
ALTER TABLE `his_endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `his_historico`
--
ALTER TABLE `his_historico`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `his_tipo`
--
ALTER TABLE `his_tipo`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `his_tipo_historico`
--
ALTER TABLE `his_tipo_historico`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `his_user`
--
ALTER TABLE `his_user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `imagem`
--
ALTER TABLE `imagem`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `his_endereco`
--
ALTER TABLE `his_endereco`
  ADD CONSTRAINT `fk-ideleitor` FOREIGN KEY (`id_user`) REFERENCES `his_eleitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
