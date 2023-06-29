-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Jun-2023 às 15:23
-- Versão do servidor: 8.0.21
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mhome`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int NOT NULL,
  `id_user` int NOT NULL,
  `id_produto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL,
  `id_user` int NOT NULL,
  `estado` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numeroresidencial` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `id_user`, `estado`, `cidade`, `bairro`, `rua`, `numeroresidencial`) VALUES
(1, 1, 'Acre', 'Rio Branco', 'Centro', 'Avenida Presidente Vargas', 209),
(2, 2, 'Alagoas', 'Jaramataia', 'Centro', 'Rua do Comércio 173', 122),
(3, 3, 'Rio de Janeiro', 'Petrópolis', 'Centro Histórico', 'Rua Walter Bretz', 22),
(4, 4, 'Minas Gerais', 'Viçosa', 'Fátima', 'Rua José Scipião 7', 890),
(5, 5, 'Distrito Federal', 'Brasília', 'Paranoá', 'Quadra Quadra 9 Conjunto F', 67),
(6, 6, 'Espírito Santo', 'Serra', 'Jardim Carapina', 'Rua Afonso Cláudio', 222),
(7, 7, 'Goiás', 'Goiânia', 'Parque Atheneu', 'Rua 7 Unidade 201', 234),
(8, 8, 'Paraná', 'Curitiba', 'Tingui', 'Rua Miguel Jorge Nasser', 789),
(9, 9, 'Santa Catarina', 'Joinville', 'Jarivatuba', 'Rua José Vieira Castro', 189),
(10, 10, 'São Paulo', 'São Paulo', 'Parque Colonial', 'Rua Padre Miguel Luís Teixeira', 900);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itenscarrinho`
--

CREATE TABLE `itenscarrinho` (
  `id_itenscarrinho` int NOT NULL,
  `id_carrinho` int NOT NULL,
  `id_produto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itenspedido`
--

CREATE TABLE `itenspedido` (
  `id_itenspedido` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `preco` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `itenspedido`
--

INSERT INTO `itenspedido` (`id_itenspedido`, `id_pedido`, `id_produto`, `preco`) VALUES
(1, 1, 1, '$4338.20'),
(2, 2, 2, '$3274.86'),
(3, 3, 3, '$5289.96'),
(4, 4, 4, '$4525.53'),
(5, 5, 5, '$2330.17'),
(6, 6, 6, '$6986.24'),
(7, 7, 7, '$3159.34'),
(8, 8, 8, '$2585.70'),
(9, 9, 9, '$4956.80'),
(10, 10, 10, '$2116.57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `id_user` int NOT NULL,
  `d/m/a` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `total` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `form_pag` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_user`, `d/m/a`, `total`, `form_pag`, `status`) VALUES
(1, 1, '06/28/2022', 'R$4.850,90', 'pix', 'entregue'),
(2, 2, '05/06/2022', 'R$5.190,00', 'pix', ''),
(3, 3, '05/08/2021', 'R$3.890,00', 'parcelado 5x', ''),
(4, 4, '12/03/2023', 'R$5.890,00', 'pix', ''),
(5, 5, '01/02/2022', 'R$4.890,00', 'boleto', ''),
(6, 6, '22/02/2022', 'R$4.990,00', 'boleto', 'entregue'),
(7, 7, '17/04/2023', 'R$6.390,00', 'crédito', ''),
(8, 8, '28/06/2022', 'R$7.390,90', 'crédito', ''),
(9, 9, '03/09/2022', 'R$5.990,00', 'pix', ''),
(10, 10, '19/04/2023', 'R$5.790,00', 'boleto', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `preco` varchar(100) NOT NULL,
  `rota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `descricao`, `preco`, `rota`) VALUES
(1, 'Sprinter Furgão Vidrado 417 CDI', '4.850,90', 'Rio de Janeiro - São Paulo'),
(2, 'Sprinter Furgão Vidrado 517 CDI​', '5.190.00', 'Beto Carrero World - Balneário Camboriú'),
(3, 'Sprinter Furgão Street 315 CDI', '3.890.00', 'Curitiba - Santa Catarina'),
(4, 'Renault Master Minibus', '5.890.00', 'Fortleza - Recife'),
(5, 'Renault Master 2.3 Executive', '4.890.00', 'Sergipe - Belo Horizonte'),
(6, 'Mercedes-Benz Sprinter Van 2.2 ', '4.990.00', 'Brasília - São Paulo'),
(7, 'Peugeot Expert Minibus', '6.390.00', 'Porto Alegre - Florianópolis'),
(8, 'Daily Minibus', '7.390.00', 'Natal - João Pessoa - Recife'),
(9, 'Daily Retrato', '5.990.00', 'Salvador - Rio de janeiro'),
(10, 'Peugeot Boxer', '5.790.00', 'Campo Grande - Cuiabá');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` varchar(100) NOT NULL,
  `sexo` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id_user`, `nome`, `sobrenome`, `cpf`, `email`, `data_nascimento`, `sexo`, `senha`) VALUES
(1, 'João Vitor', 'Rosera', '939.951.290-80', 'joaovitorpeneira@gmail.com', '12.10.2005', 'Maculino', 'wrghrwihgriw'),
(2, 'Maria Fernanda', 'de Jesus', '584.455.960-63', 'mfjesus@gmail.com', '10.09.2005', 'Feminino', 'rgreg3qgqg'),
(3, 'Vinicius Henrique', 'Werner', '894.755.570-32', 'viniciuswerner@gmail.com', '20.12.2005', 'Masculino', 'rebuiguieh'),
(4, 'Maiara', 'Hess', '692.636.190-85', 'maiarahess@gmail.com', '18.05.2005', 'Feminino', 'guirbeguirbqgi'),
(5, 'Tiago', 'Machado', '925.503.790-04', 'tiagomachado@gmail.com', '01.07.2005', 'Masculino', 'gegtqrthbrtwh'),
(6, 'Laís\r\n', 'Lessa', '144.784.920-50', 'laislessa@gmail.com', '28.06.2005', 'Feminino', 'rtqhqtrhrhrtw'),
(7, 'Marcelo Vinicius', 'Leicht', '285.729.320-89', 'marceloleichet@gmail.com', '16.12.2005', 'Masculino', 'wrthrwhrthrt'),
(8, 'Vitor Hugo\r\n', 'Lisboa', '669.267.390-99', 'vitorlisboa@gmail.com', '05.10.2005', 'Masculino', 'gbiuegubert'),
(9, 'Gustavo', 'Machado', '299.916.300-23', 'gustavomachado@gmail.com', '13.03.2006', 'Masculino', 'bervetuhrntu'),
(10, 'Felipe Osmar\r\n', 'de Aviz\r\n', '999.393.220-54', 'felipeosmar@gmail.com', '03.03.1987', 'Masculino', 'thqrhbrtw5rh');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices para tabela `itenscarrinho`
--
ALTER TABLE `itenscarrinho`
  ADD PRIMARY KEY (`id_itenscarrinho`);

--
-- Índices para tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD PRIMARY KEY (`id_itenspedido`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_user` (`id_user`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `itenscarrinho`
--
ALTER TABLE `itenscarrinho`
  MODIFY `id_itenscarrinho` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  MODIFY `id_itenspedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `pedido` (`id_pedido`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
