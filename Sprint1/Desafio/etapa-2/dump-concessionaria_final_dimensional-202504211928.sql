-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: concessionaria_final_dimensional
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `dim_carro`
--

DROP TABLE IF EXISTS `dim_carro`;
/*!50001 DROP VIEW IF EXISTS `dim_carro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dim_carro` AS SELECT 
 1 AS `id_Carro`,
 1 AS `chassi_Carro`,
 1 AS `marca_Carro`,
 1 AS `modelo_Carro`,
 1 AS `ano_Carro`,
 1 AS `tipo_Combustivel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dim_cliente`
--

DROP TABLE IF EXISTS `dim_cliente`;
/*!50001 DROP VIEW IF EXISTS `dim_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dim_cliente` AS SELECT 
 1 AS `id_Cliente`,
 1 AS `nome_Cliente`,
 1 AS `cidade_Cliente`,
 1 AS `estado_Cliente`,
 1 AS `pais_Cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dim_tempo`
--

DROP TABLE IF EXISTS `dim_tempo`;
/*!50001 DROP VIEW IF EXISTS `dim_tempo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dim_tempo` AS SELECT 
 1 AS `id_Locacao`,
 1 AS `data_locacao_resultante`,
 1 AS `data_entrega_resultante`,
 1 AS `tempo_restante_para_entrega`,
 1 AS `valor_total_locacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dim_vendedor`
--

DROP TABLE IF EXISTS `dim_vendedor`;
/*!50001 DROP VIEW IF EXISTS `dim_vendedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dim_vendedor` AS SELECT 
 1 AS `id_Vendedor`,
 1 AS `nome_Vendedor`,
 1 AS `sexo_Vendedor`,
 1 AS `estado_Vendedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `fato_locacao`
--

DROP TABLE IF EXISTS `fato_locacao`;
/*!50001 DROP VIEW IF EXISTS `fato_locacao`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fato_locacao` AS SELECT 
 1 AS `id_Locacao`,
 1 AS `id_Cliente`,
 1 AS `id_Carro`,
 1 AS `id_Vendedor`,
 1 AS `data_locacao_resultante`,
 1 AS `data_entrega_resultante`,
 1 AS `tempo_restante_para_entrega`,
 1 AS `valor_total_locacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_carro`
--

DROP TABLE IF EXISTS `tb_carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_carro` (
  `id_Carro` int NOT NULL,
  `chassi_Carro` varchar(17) DEFAULT NULL,
  `marca_Carro` varchar(25) DEFAULT NULL,
  `modelo_Carro` varchar(50) DEFAULT NULL,
  `ano_Carro` int DEFAULT NULL,
  `id_Combustivel` int DEFAULT NULL,
  PRIMARY KEY (`id_Carro`),
  KEY `id_Combustivel` (`id_Combustivel`),
  CONSTRAINT `tb_carro_ibfk_1` FOREIGN KEY (`id_Combustivel`) REFERENCES `tb_combustivel` (`id_Combustivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carro`
--

LOCK TABLES `tb_carro` WRITE;
/*!40000 ALTER TABLE `tb_carro` DISABLE KEYS */;
INSERT INTO `tb_carro` VALUES (1,'AAAKNS8JS76S39','Toyota','Corolla XEI',2023,3),(2,'AKIUNS1JS76S39','Nissan','Versa',2019,2),(3,'DKSHKNS8JS76S39','VW','Fusca 78',1978,1),(4,'LLLUNS1JS76S39','Nissan','Versa',2020,2),(5,'MSLUNS1JS76S39','Nissan','Frontier',2022,4),(6,'SKIUNS8JS76S39','Nissan','Versa',2019,1),(7,'SSIUNS8JS76S39','Fiat','Fiat 147',1996,1),(10,'LKIUNS8JS76S39','Fiat','Fiat 147',1996,1),(98,'AKJHKN98JY76539','Fiat','Fiat Uno',2000,1),(99,'IKJHKN98JY76539','Fiat','Fiat Palio',2010,1);
/*!40000 ALTER TABLE `tb_carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `id_Cliente` int NOT NULL,
  `nome_Cliente` varchar(100) DEFAULT NULL,
  `cidade_Cliente` varchar(50) DEFAULT NULL,
  `estado_Cliente` varchar(50) DEFAULT NULL,
  `pais_Cliente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (2,'Cliente dois','São Paulo','São Paulo','Brasil'),(3,'Cliente tres','Rio de Janeiro','Rio de Janeiro','Brasil'),(4,'Cliente quatro','Rio de Janeiro','Rio de Janeiro','Brasil'),(5,'Cliente cinco','Manaus','Amazonas','Brasil'),(6,'Cliente seis','Belo Horizonte','Minas Gerais','Brasil'),(10,'Cliente dez','Rio Branco','Acre','Brasil'),(20,'Cliente vinte','Macapá','Amapá','Brasil'),(22,'Cliente vinte e dois','Porto Alegre','Rio Grande do Sul','Brasil'),(23,'Cliente vinte e tres','Eusébio','Ceará','Brasil'),(26,'Cliente vinte e seis','Campo Grande','Mato Grosso do Sul','Brasil');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_combustivel`
--

DROP TABLE IF EXISTS `tb_combustivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_combustivel` (
  `id_Combustivel` int NOT NULL,
  `tipo_Combustivel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Combustivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_combustivel`
--

LOCK TABLES `tb_combustivel` WRITE;
/*!40000 ALTER TABLE `tb_combustivel` DISABLE KEYS */;
INSERT INTO `tb_combustivel` VALUES (1,'Gasolina'),(2,'Etanol'),(3,'Flex'),(4,'Diesel');
/*!40000 ALTER TABLE `tb_combustivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_locacao`
--

DROP TABLE IF EXISTS `tb_locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_locacao` (
  `id_Locacao` int NOT NULL,
  `id_Cliente` int DEFAULT NULL,
  `id_Carro` int DEFAULT NULL,
  `kmCarro` int DEFAULT NULL,
  `data_Locacao` date DEFAULT NULL,
  `hora_Locacao` time DEFAULT NULL,
  `qtd_Diaria` int DEFAULT NULL,
  `vlr_Diaria` decimal(10,0) DEFAULT NULL,
  `data_Entrega` date DEFAULT NULL,
  `hora_Entrega` time DEFAULT NULL,
  `id_Vendedor` int DEFAULT NULL,
  PRIMARY KEY (`id_Locacao`),
  KEY `id_Cliente` (`id_Cliente`),
  KEY `id_Carro` (`id_Carro`),
  KEY `id_Vendedor` (`id_Vendedor`),
  CONSTRAINT `tb_locacao_ibfk_1` FOREIGN KEY (`id_Cliente`) REFERENCES `tb_cliente` (`id_Cliente`),
  CONSTRAINT `tb_locacao_ibfk_2` FOREIGN KEY (`id_Carro`) REFERENCES `tb_carro` (`id_Carro`),
  CONSTRAINT `tb_locacao_ibfk_3` FOREIGN KEY (`id_Vendedor`) REFERENCES `tb_vendedor` (`id_Vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_locacao`
--

LOCK TABLES `tb_locacao` WRITE;
/*!40000 ALTER TABLE `tb_locacao` DISABLE KEYS */;
INSERT INTO `tb_locacao` VALUES (1,2,98,25412,'2015-01-10','10:00:00',2,100,'2015-01-12','10:00:00',5),(2,2,98,29450,'2015-02-10','12:00:00',2,100,'2015-02-12','12:00:00',5),(3,3,99,20000,'2015-02-13','12:00:00',2,150,'2015-02-15','12:00:00',6),(4,4,99,21000,'2015-02-15','13:00:00',5,150,'2015-02-20','13:00:00',6),(5,4,99,21700,'2015-03-02','14:00:00',5,150,'2015-03-07','14:00:00',7),(6,6,3,121700,'2016-03-02','14:00:00',10,250,'2016-03-12','14:00:00',8),(7,6,3,131800,'2016-08-02','14:00:00',10,250,'2016-08-12','14:00:00',8),(8,4,3,151800,'2017-01-02','18:00:00',10,250,'2017-01-12','18:00:00',6),(9,4,3,152800,'2018-01-02','18:00:00',10,280,'2018-01-12','18:00:00',6),(10,10,10,211800,'2018-03-02','18:00:00',10,50,'2018-03-12','18:00:00',16),(11,20,7,212800,'2018-04-01','11:00:00',10,50,'2018-04-11','11:00:00',16),(12,20,6,21800,'2020-04-01','11:00:00',10,150,'2020-04-11','11:00:00',16),(13,22,2,10000,'2022-05-01','08:00:00',20,150,'2022-05-21','18:00:00',30),(14,22,2,20000,'2022-06-01','08:00:00',20,150,'2022-06-21','18:00:00',30),(15,22,2,30000,'2022-07-01','08:00:00',20,150,'2022-07-21','18:00:00',30),(16,22,2,40000,'2022-08-01','08:00:00',20,150,'2022-08-21','18:00:00',30),(17,23,4,55000,'2022-09-01','08:00:00',20,150,'2022-09-21','18:00:00',31),(18,23,4,56000,'2022-10-01','08:00:00',20,150,'2022-10-21','18:00:00',31),(19,23,4,58000,'2022-11-01','08:00:00',20,150,'2022-11-21','18:00:00',31),(20,5,1,1800,'2023-01-02','18:00:00',10,880,'2023-01-12','18:00:00',16),(21,5,1,8500,'2023-01-15','18:00:00',10,880,'2023-01-25','18:00:00',16),(22,26,5,28000,'2023-01-25','08:00:00',5,600,'2023-01-30','18:00:00',32),(23,26,5,38000,'2023-01-31','08:00:00',5,600,'2023-02-05','18:00:00',32),(24,26,5,48000,'2023-02-06','08:00:00',5,600,'2023-02-11','18:00:00',32),(25,26,5,68000,'2023-02-12','08:00:00',5,600,'2023-02-17','18:00:00',32),(26,26,5,78000,'2023-02-18','08:00:00',1,600,'2023-02-19','18:00:00',32);
/*!40000 ALTER TABLE `tb_locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_vendedor`
--

DROP TABLE IF EXISTS `tb_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vendedor` (
  `id_Vendedor` int NOT NULL,
  `nome_Vendedor` varchar(100) DEFAULT NULL,
  `sexo_Vendedor` smallint DEFAULT NULL,
  `estado_Vendedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vendedor`
--

LOCK TABLES `tb_vendedor` WRITE;
/*!40000 ALTER TABLE `tb_vendedor` DISABLE KEYS */;
INSERT INTO `tb_vendedor` VALUES (5,'Vendedor cinco',0,'São Paulo'),(6,'Vendedora seis',1,'São Paulo'),(7,'Vendedora sete',1,'Rio de Janeiro'),(8,'Vendedora oito',1,'Minas Gerais'),(16,'Vendedor dezesseis',0,'Amazonas'),(30,'Vendedor trinta',0,'Rio Grande do Sul'),(31,'Vendedor trinta e um',0,'Ceará'),(32,'Vendedora trinta e dois',1,'Mato Grosso do Sul');
/*!40000 ALTER TABLE `tb_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'concessionaria_final_dimensional'
--

--
-- Final view structure for view `dim_carro`
--

/*!50001 DROP VIEW IF EXISTS `dim_carro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dim_carro` AS select `tb_carro`.`id_Carro` AS `id_Carro`,`tb_carro`.`chassi_Carro` AS `chassi_Carro`,`tb_carro`.`marca_Carro` AS `marca_Carro`,`tb_carro`.`modelo_Carro` AS `modelo_Carro`,`tb_carro`.`ano_Carro` AS `ano_Carro`,`tb_combustivel`.`tipo_Combustivel` AS `tipo_Combustivel` from (`tb_carro` left join `tb_combustivel` on((`tb_carro`.`id_Combustivel` = `tb_combustivel`.`id_Combustivel`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dim_cliente`
--

/*!50001 DROP VIEW IF EXISTS `dim_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dim_cliente` AS select `tb_cliente`.`id_Cliente` AS `id_Cliente`,`tb_cliente`.`nome_Cliente` AS `nome_Cliente`,`tb_cliente`.`cidade_Cliente` AS `cidade_Cliente`,`tb_cliente`.`estado_Cliente` AS `estado_Cliente`,`tb_cliente`.`pais_Cliente` AS `pais_Cliente` from `tb_cliente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dim_tempo`
--

/*!50001 DROP VIEW IF EXISTS `dim_tempo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dim_tempo` AS select `tb_locacao`.`id_Locacao` AS `id_Locacao`,concat(`tb_locacao`.`data_Locacao`,' ',`tb_locacao`.`hora_Locacao`) AS `data_locacao_resultante`,concat(`tb_locacao`.`data_Entrega`,' ',`tb_locacao`.`hora_Entrega`) AS `data_entrega_resultante`,(concat(`tb_locacao`.`data_Locacao`,' ',`tb_locacao`.`hora_Locacao`) - concat(`tb_locacao`.`data_Entrega`,' ',`tb_locacao`.`hora_Entrega`)) AS `tempo_restante_para_entrega`,sum((`tb_locacao`.`qtd_Diaria` * `tb_locacao`.`vlr_Diaria`)) AS `valor_total_locacao` from `tb_locacao` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dim_vendedor`
--

/*!50001 DROP VIEW IF EXISTS `dim_vendedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dim_vendedor` AS select `tb_vendedor`.`id_Vendedor` AS `id_Vendedor`,`tb_vendedor`.`nome_Vendedor` AS `nome_Vendedor`,`tb_vendedor`.`sexo_Vendedor` AS `sexo_Vendedor`,`tb_vendedor`.`estado_Vendedor` AS `estado_Vendedor` from `tb_vendedor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fato_locacao`
--

/*!50001 DROP VIEW IF EXISTS `fato_locacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fato_locacao` AS select `tb_locacao`.`id_Locacao` AS `id_Locacao`,`tb_locacao`.`id_Cliente` AS `id_Cliente`,`tb_locacao`.`id_Carro` AS `id_Carro`,`tb_locacao`.`id_Vendedor` AS `id_Vendedor`,`dim_tempo`.`data_locacao_resultante` AS `data_locacao_resultante`,`dim_tempo`.`data_entrega_resultante` AS `data_entrega_resultante`,`dim_tempo`.`tempo_restante_para_entrega` AS `tempo_restante_para_entrega`,`dim_tempo`.`valor_total_locacao` AS `valor_total_locacao` from (`tb_locacao` left join `dim_tempo` on((`tb_locacao`.`id_Locacao` = `dim_tempo`.`id_Locacao`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 19:28:39
