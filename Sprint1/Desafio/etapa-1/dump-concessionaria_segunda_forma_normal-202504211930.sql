-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: concessionaria_segunda_forma_normal
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
/*!40000 ALTER TABLE `tb_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'concessionaria_segunda_forma_normal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 19:30:47
