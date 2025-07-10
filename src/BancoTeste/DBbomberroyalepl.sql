-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 16/12/2022 às 23:00
-- Versão do servidor: 10.5.15-MariaDB-cll-lve
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u310558138_bomberroyalepl`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `dadosDeJogo_usu`
--

CREATE TABLE `dadosDeJogo_usu` (
  `id` int(11) NOT NULL,
  `usuario` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `vitorias` int(11) NOT NULL,
  `derrotas` int(11) NOT NULL,
  `partidas` int(11) NOT NULL,
  `eliminarOponente` int(11) NOT NULL,
  `danoOponente` int(11) NOT NULL,
  `caixas` int(11) NOT NULL,
  `bombasClassS` int(11) NOT NULL,
  `chavesP` int(11) NOT NULL,
  `estrelasP` int(11) NOT NULL,
  `bombasClassP` int(11) NOT NULL,
  `forcaBombaP` int(11) NOT NULL,
  `peDeVentoP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `dadosDeJogo_usu`
--

INSERT INTO `dadosDeJogo_usu` (`id`, `usuario`, `vitorias`, `derrotas`, `partidas`, `eliminarOponente`, `danoOponente`, `caixas`, `bombasClassS`, `chavesP`, `estrelasP`, `bombasClassP`, `forcaBombaP`, `peDeVentoP`) VALUES
(1, 'jeferson', 113, 60, 174, 60, 124, 1605, 2296, 80, 209, 355, 248, 41),
(2, 'Jefersonpkl', 49, 116, 165, 28, 52, 556, 518, 18, 47, 55, 48, 24),
(3, 'Cleber', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Jefersonpkl1', 3, 1, 4, 3, 9, 70, 201, 3, 12, 10, 15, 1),
(5, 'MarcosAntônio', 9, 27, 36, 4, 6, 438, 864, 11, 34, 102, 59, 63),
(6, 'jesseleepl', 4, 8, 12, 1, 3, 226, 588, 6, 21, 51, 31, 25),
(7, 'teste2', 4, 1, 5, 0, 0, 3, 17, 0, 0, 1, 2, 1),
(8, 'teste3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 'jeferson3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `energiaM_usu`
--

CREATE TABLE `energiaM_usu` (
  `id` int(11) NOT NULL,
  `usuario` varchar(18) CHARACTER SET utf8 NOT NULL,
  `quant_EM` int(3) NOT NULL,
  `horario` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `data_base` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `energiaM_usu`
--

INSERT INTO `energiaM_usu` (`id`, `usuario`, `quant_EM`, `horario`, `data_base`) VALUES
(1, 'jeferson', 1, '68692', '346'),
(2, 'jefersonpkl', 2, '74270', '90'),
(3, 'Jefersonpkl1', -2, '66560', '44'),
(4, 'MarcosAntônio', 2, '60543', '100'),
(5, 'sissimoreira', 0, '67132', '6'),
(6, 'Cleber', 1, '79599', '18'),
(7, 'jesseleepl', 1, '33399', '70'),
(8, 'teste2', 3, '60147', '100'),
(9, 'teste3', 3, '0', '-1'),
(16, 'jeferson3', 3, '0', '-1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `login_usu`
--

CREATE TABLE `login_usu` (
  `id` int(11) NOT NULL,
  `usuario` varchar(18) CHARACTER SET utf8 NOT NULL,
  `senha` varchar(32) CHARACTER SET utf8 NOT NULL,
  `nascimento` date NOT NULL,
  `status` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `login_usu`
--

INSERT INTO `login_usu` (`id`, `usuario`, `senha`, `nascimento`, `status`) VALUES
(1, 'jeferson', 'c8837b23ff8aaa8a2dde915473ce0991', '1994-12-28', 1),
(2, 'jefersonpkl', 'c8837b23ff8aaa8a2dde915473ce0991', '1994-12-28', 1),
(3, 'jefersonpkl1', 'c8837b23ff8aaa8a2dde915473ce0991', '1994-12-28', 1),
(4, 'jefersonpkl@', 'c8837b23ff8aaa8a2dde915473ce0991', '1994-12-28', 1),
(5, 'sissiMoreira', 'e9bd448fa741e4812ec9767ece216fb1', '1972-07-12', 1),
(6, 'teste1', 'e959088c6049f1104c84c9bde5560a13', '1994-12-28', 1),
(7, 'JesseLeePL', '98dcefe22d6f2908b4682e6247598170', '2001-08-04', 1),
(8, 'victor1234', '221a341a0781382a99c82033a86d16cd', '2007-04-05', 1),
(9, 'teste2', '38851536d87701d2191990e24a7f8d4e', '2000-01-01', 1),
(10, 'teste3', '507eb04c9c427e9f961e47a7204fac41', '2001-01-01', 1),
(11, 'teste4', '73bf3127fb3c9791e88a4d308171fd85', '2002-05-02', 1),
(12, 'teste5', '6ee7a7f22c4024cef59d25be2365a5a7', '2002-04-04', 1),
(13, 'teste6', '72ef529ade0ab6de1e7952e965052def', '1997-03-02', 1),
(14, 'cletiesko', 'e10adc3949ba59abbe56e057f20f883e', '1996-12-03', 1),
(15, 'Adelina', 'c8837b23ff8aaa8a2dde915473ce0991', '1990-06-06', 1),
(16, 'MarcosAntônio', 'e10adc3949ba59abbe56e057f20f883e', '1993-12-19', 1),
(17, 'LucasMatheus', 'b33ef5238ff12b24b4d4a1bbf564d2d7', '1987-12-05', 1),
(18, 'kurayami', '7372df94990875236185b61e3ff0d3dd', '2002-09-10', 1),
(19, 'rafaah', '42d155441836aa704e41ce0b0fe1cd82', '2007-04-05', 1),
(20, 'lobochoco', '2888f9d1f9102cb639653b5b5c146df4', '2000-04-05', 1),
(21, 'cleber', '25d55ad283aa400af464c76d713c07ad', '1996-12-03', 1),
(24, 'Jeferson3', 'c8837b23ff8aaa8a2dde915473ce0991', '2001-06-01', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missoesDiaria_tab`
--

CREATE TABLE `missoesDiaria_tab` (
  `id` int(11) NOT NULL,
  `missao` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `quantCompletar` int(11) NOT NULL,
  `idDados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `missoesDiaria_tab`
--

INSERT INTO `missoesDiaria_tab` (`id`, `missao`, `quantCompletar`, `idDados`) VALUES
(1, 'Dê dano em 5 oponentes', 5, 4),
(2, 'Elimine 3 oponentes', 3, 3),
(3, 'Consiga 2 Chaves Misteriosas\r\nem partidas', 2, 7),
(4, 'Vença uma partida', 1, 0),
(5, 'Estoure 10 caixas em uma\r\nmesma partida', 10, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missoesDiaria_usu`
--

CREATE TABLE `missoesDiaria_usu` (
  `id` int(11) NOT NULL,
  `usuario` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `missao1` int(11) NOT NULL,
  `missao2` int(11) NOT NULL,
  `missao3` int(11) NOT NULL,
  `missao4` int(11) NOT NULL,
  `missao5` int(11) NOT NULL,
  `data_base` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `missoesDiaria_usu`
--

INSERT INTO `missoesDiaria_usu` (`id`, `usuario`, `missao1`, `missao2`, `missao3`, `missao4`, `missao5`, `data_base`) VALUES
(1, 'jeferson', 124, 60, 80, 113, 1605, '349'),
(2, 'Jefersonpkl', 52, 28, 18, 49, 556, '90'),
(3, 'Cleber', 0, 0, 0, 0, 0, '-1'),
(4, 'Jefersonpkl1', 9, 3, 3, 3, 70, '46'),
(5, 'MarcosAntônio', 6, 4, 11, 9, 423, '100'),
(6, 'jesseleepl', 2, 1, -1, 4, -1, '70'),
(7, 'teste2', 0, 0, 0, 0, 0, '100'),
(8, 'teste3', 0, 0, 0, 0, 0, '100'),
(11, 'jeferson3', 0, 0, 0, 0, 0, '346');

-- --------------------------------------------------------

--
-- Estrutura para tabela `moedas_usu`
--

CREATE TABLE `moedas_usu` (
  `id` int(11) NOT NULL,
  `usuario` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `pepitas` int(11) NOT NULL,
  `chaves` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `moedas_usu`
--

INSERT INTO `moedas_usu` (`id`, `usuario`, `pepitas`, `chaves`) VALUES
(1, 'jeferson', 201, 55),
(2, 'Jefersonpkl', 46, 40),
(3, 'Jefersonpkl1', 20, 6),
(4, 'MarcosAntônio', 6, 3),
(5, 'sissimoreira', 0, 0),
(6, 'Cleber', 0, 0),
(7, 'jesseleepl', 7, 1),
(8, 'teste2', 0, 0),
(9, 'teste3', 0, 0),
(12, 'jeferson3', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `xp_usu`
--

CREATE TABLE `xp_usu` (
  `id` int(11) NOT NULL,
  `usuario` varchar(18) CHARACTER SET utf8 NOT NULL,
  `xp_Total` int(20) NOT NULL,
  `xp_DoNivel` int(20) NOT NULL,
  `nivel` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `xp_usu`
--

INSERT INTO `xp_usu` (`id`, `usuario`, `xp_Total`, `xp_DoNivel`, `nivel`) VALUES
(1, 'jeferson', 35481, 2881, 11),
(2, 'jefersonpkl', 16825, 4225, 9),
(3, 'jefersonpkl1', 3010, 1410, 3),
(4, 'MarcosAntônio', 3660, 860, 4),
(5, 'jesseleepl', 1555, 955, 2),
(6, 'LucasMatheus', 0, 0, 0),
(7, 'kurayami', 0, 0, 0),
(8, 'sissimoreira', 686, 86, 2),
(9, 'rafaah', 0, 0, 0),
(10, 'lobochoco', 0, 0, 0),
(11, 'Cleber', 0, 0, 0),
(12, 'teste2', 403, 403, 0),
(13, 'teste3', 0, 0, 0),
(18, 'jeferson3', 0, 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `dadosDeJogo_usu`
--
ALTER TABLE `dadosDeJogo_usu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Índices de tabela `energiaM_usu`
--
ALTER TABLE `energiaM_usu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Índices de tabela `login_usu`
--
ALTER TABLE `login_usu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Índices de tabela `missoesDiaria_tab`
--
ALTER TABLE `missoesDiaria_tab`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `missoesDiaria_usu`
--
ALTER TABLE `missoesDiaria_usu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Índices de tabela `moedas_usu`
--
ALTER TABLE `moedas_usu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `xp_usu`
--
ALTER TABLE `xp_usu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `dadosDeJogo_usu`
--
ALTER TABLE `dadosDeJogo_usu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `energiaM_usu`
--
ALTER TABLE `energiaM_usu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `login_usu`
--
ALTER TABLE `login_usu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `missoesDiaria_tab`
--
ALTER TABLE `missoesDiaria_tab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `missoesDiaria_usu`
--
ALTER TABLE `missoesDiaria_usu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `moedas_usu`
--
ALTER TABLE `moedas_usu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `xp_usu`
--
ALTER TABLE `xp_usu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
