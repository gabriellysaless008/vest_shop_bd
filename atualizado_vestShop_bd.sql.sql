-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31/10/2026 às 13:34
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vestshop`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `interacao_recomendacao`
--

CREATE TABLE `interacao_recomendacao` (
  `id_interacao` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `curtiu` tinyint(1) DEFAULT 0,
  `pesquisou` tinyint(1) DEFAULT 0,
  `visualizou` tinyint(1) DEFAULT 0,
  `data_interacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `interacao_recomendacao`
--

INSERT INTO `interacao_recomendacao` (`id_interacao`, `id_usuario`, `id_produto`, `curtiu`, `pesquisou`, `visualizou`, `data_interacao`) VALUES
(1, 8, 1, 0, 1, 0, '2026-10-03 12:00:00'),
(2, 8, 1, 0, 1, 0, '2026-10-04 13:00:00'),
(3, 8, 1, 0, 1, 1, '2026-10-08 14:00:00'),
(4, 8, 2, 0, 1, 0, '2026-10-10 15:00:00'),
(5, 8, 2, 1, 1, 1, '2026-10-12 16:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `id_item` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario_moeda_local` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_pedido`
--

INSERT INTO `item_pedido` (`id_item`, `id_pedido`, `id_produto`, `quantidade`, `preco_unitario_moeda_local`) VALUES
(1, 1, 1, 2, 59.90),
(2, 1, 2, 1, 79.90),
(3, 2, 2, 3, 79.90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_comprador` int(11) NOT NULL,
  `codigo_moeda_utilizada` varchar(3) NOT NULL,
  `valor_subtotal` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `isento_frete` tinyint(1) DEFAULT NULL,
  `cep_destino` varchar(9) NOT NULL,
  `regiao_metropolitana` tinyint(1) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_comprador`, `codigo_moeda_utilizada`, `valor_subtotal`, `valor_frete`, `isento_frete`, `cep_destino`, `regiao_metropolitana`, `status`, `data_pedido`) VALUES
(1, 8, 'BRL', 199.70, 10.00, 0, '85801-000', 0, 'concluido', '2026-10-05 13:00:00'),
(2, 8, 'BRL', 239.70, 0.00, 1, '85801-000', 0, 'concluido', '2026-10-15 17:30:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `id_anunciante` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `tamanho` varchar(10) NOT NULL,
  `genero_indicado` varchar(20) DEFAULT NULL,
  `estilo` varchar(50) NOT NULL,
  `preco_base_brl` decimal(10,2) NOT NULL,
  `quantidade_estoque` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `id_anunciante`, `nome`, `marca`, `descricao`, `tamanho`, `genero_indicado`, `estilo`, `preco_base_brl`, `quantidade_estoque`, `status`, `data_cadastro`) VALUES
(1, 7, 'Camiseta Teste', 'Marca Teste', 'teste', 'M', 'Unissex', 'Casual', 55.00, 5, 'ativo', '2026-10-28 20:47:14'),
(2, 7, 'Camiseta Teste1', 'Marca Teste', 'teste1', 'M', 'Unissex', 'Casual', 55.00, 5, 'ativo', '2026-10-28 21:39:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `relatorio_job`
--

CREATE TABLE `relatorio_job` (
  `id_job` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pendente',
  `resultado` longtext DEFAULT NULL,
  `erro` text DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `relatorio_job`
--

INSERT INTO `relatorio_job` (`id_job`, `id_usuario`, `mes`, `ano`, `status`, `resultado`, `erro`, `data_criacao`, `data_atualizacao`) VALUES
(1, 8, 10, 2026, 'concluido', '{\"produtoMaisBuscado\":{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"3\"},\"produtoMaisComprado\":{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"4\"},\"produtosMaisBuscados\":[{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"3\"},{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"2\"}],\"produtosMaisComprados\":[{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"4\"},{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"2\"}],\"totalUnidades\":\"6\"}', NULL, '2026-10-30 21:10:15', '2026-10-30 21:10:15'),
(2, 8, 10, 2026, 'concluido', '{\"produtoMaisBuscado\":{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"3\"},\"produtoMaisComprado\":{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"4\"},\"produtosMaisBuscados\":[{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"3\"},{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"2\"}],\"produtosMaisComprados\":[{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"4\"},{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"2\"}],\"totalUnidades\":\"6\"}', NULL, '2026-10-30 21:13:08', '2026-10-30 21:13:08'),
(3, 9, 10, 2026, 'concluido', '{\"produtoMaisBuscado\":{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"3\"},\"produtoMaisComprado\":{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"4\"},\"produtosMaisBuscados\":[{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"3\"},{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"2\"}],\"produtosMaisComprados\":[{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"4\"},{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"2\"}],\"totalUnidades\":\"6\"}', NULL, '2026-10-30 21:40:46', '2026-10-30 21:40:46'),
(4, 8, 10, 2026, 'concluido', '{\"produtoMaisBuscado\":{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"3\"},\"produtoMaisComprado\":{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"4\"},\"produtosMaisBuscados\":[{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"3\"},{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"2\"}],\"produtosMaisComprados\":[{\"id_produto\":2,\"nome\":\"Camiseta Teste1\",\"total\":\"4\"},{\"id_produto\":1,\"nome\":\"Camiseta Teste\",\"total\":\"2\"}],\"totalUnidades\":\"6\"}', NULL, '2026-10-30 22:02:04', '2026-10-30 22:02:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `eh_maior_idade` tinyint(1) NOT NULL,
  `tipo_perfil` varchar(50) NOT NULL,
  `participa_programa_fidelidade` tinyint(1) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `onboarding_concluido` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha_hash`, `data_nascimento`, `eh_maior_idade`, `tipo_perfil`, `participa_programa_fidelidade`, `data_cadastro`, `onboarding_concluido`) VALUES
(3, 'testehash', 'teste@gmail.com', '$2b$10$Nv/Tu.eRh0qkdWNUpyPXaOBmhYCyWVNcztdZLLTh5Z4XSt1J7/PGu', '2002-10-10', 1, 'cliente', 0, '2026-10-01 17:34:23', 0),
(4, 'testelogin', 'testelogin@gmail.com', '$2b$10$AfFdT2M93C3l0eG4JerkMeHf/6SKb1zpGE069BDvSVjR2zUtCC0m2', '2002-10-22', 1, 'cliente', 0, '2026-10-01 18:05:43', 0),
(5, 'gabrielly', 'gabrielly@gmail.com', '$2b$10$3/VcvcbKyQ1QgK3hUF.95eLRwZ98g60pkwMpW9i2l7H3QwbiEeRE2', '2002-10-20', 1, 'cliente', 1, '2026-10-25 20:11:05', 1),
(6, 'amelia', 'amelia@gmail.com', '$2b$10$G3sOVunIYv3ndSy9lRVGPekeQ.XIj4BT.LPxqVBkoVlZHVpaEhLPq', '2001-10-23', 1, 'cliente', 1, '2026-10-28 18:35:48', 1),
(7, 'Atendente Teste', 'atendente.teste@vestshop.local', '$2b$10$xa9F9Ru6gCOCOoEz1dXA5OYLA.hL/15EqUSu/IZ2ER38Cm/cqytcq', '2000-01-01', 1, 'atendente', 0, '2026-10-28 19:35:48', 1),
(8, 'Gerente Vest Shop', 'gerente@vestshop.com', '$2b$10$puraarI7PI1vRhP51GT1JOBV59MyLJP7wlqNN49IEIQOmWuxLGTni', '1997-01-12', 1, 'gerente', 0, '2026-10-30 17:53:30', 1),
(9, 'Administrador Vest Shop', 'admin@vestshop.com', '$2b$10$ISqfGgl5esO.H0.lNgLGouctnjDlyEQws6dWn4E1hns3pmyg5aMAW', '1996-10-20', 1, 'administrador', 0, '2026-10-30 21:29:07', 1),
(10, 'Novo Gerente', 'novogerente@gmail.com', '$2b$10$Lf3HECwIeDYAS2OCyCkb6uAX0iL5KgDlcGi2I9RpKVveL/8wKppjO', '2002-10-20', 1, 'gerente', 0, '2026-10-30 21:54:16', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `interacao_recomendacao`
--
ALTER TABLE `interacao_recomendacao`
  ADD PRIMARY KEY (`id_interacao`),
  ADD KEY `fk_interacao_usuario` (`id_usuario`),
  ADD KEY `fk_interacao_produto` (`id_produto`);

--
-- Índices de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `fk_item_pedido_pedido` (`id_pedido`),
  ADD KEY `fk_item_pedido_produto` (`id_produto`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedido_comprador` (`id_comprador`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `fk_produto_anunciante` (`id_anunciante`);

--
-- Índices de tabela `relatorio_job`
--
ALTER TABLE `relatorio_job`
  ADD PRIMARY KEY (`id_job`),
  ADD KEY `fk_relatorio_job_usuario` (`id_usuario`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `uq_usuario_email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `interacao_recomendacao`
--
ALTER TABLE `interacao_recomendacao`
  MODIFY `id_interacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `relatorio_job`
--
ALTER TABLE `relatorio_job`
  MODIFY `id_job` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `interacao_recomendacao`
--
ALTER TABLE `interacao_recomendacao`
  ADD CONSTRAINT `fk_interacao_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  ADD CONSTRAINT `fk_interacao_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Restrições para tabelas `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `fk_item_pedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `fk_item_pedido_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_comprador` FOREIGN KEY (`id_comprador`) REFERENCES `usuario` (`id_usuario`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_anunciante` FOREIGN KEY (`id_anunciante`) REFERENCES `usuario` (`id_usuario`);

--
-- Restrições para tabelas `relatorio_job`
--
ALTER TABLE `relatorio_job`
  ADD CONSTRAINT `fk_relatorio_job_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
