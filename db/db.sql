-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.7-MariaDB

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
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `codigo_pedido` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `unidades` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_pedido`,`codigo_producto`),
  KEY `contiene` (`codigo_producto`),
  CONSTRAINT `contiene` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo`),
  CONSTRAINT `referentea` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedidos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` VALUES (11,10,2,30.00,'CD'),(11,11,1,40.00,'Vinilo'),(12,9,1,30.00,'CD'),(12,10,2,30.00,'CD'),(12,11,1,40.00,'Vinilo'),(13,9,1,30.00,'CD'),(13,10,2,30.00,'CD'),(13,11,1,40.00,'Vinilo'),(13,12,1,30.00,'CD'),(14,7,1,40.00,'Vinilo'),(15,3,1,40.00,'Vinilo'),(16,2,1,40.00,'Vinilo'),(17,1,1,30.00,'CD'),(17,2,1,40.00,'Vinilo'),(17,5,1,40.00,'Vinilo'),(18,8,1,30.00,'CD'),(19,1,1,30.00,'CD'),(19,5,1,40.00,'Vinilo'),(20,3,1,40.00,'Vinilo'),(21,4,1,30.00,'CD'),(21,5,1,40.00,'Vinilo'),(22,3,1,40.00,'Vinilo'),(23,3,1,40.00,'Vinilo'),(23,6,1,28.00,'Vinilo'),(24,10,1,30.00,'CD'),(24,11,1,40.00,'Vinilo'),(25,9,1,30.00,'CD'),(25,13,1,50.00,'Vinilo'),(26,13,1,50.00,'Vinilo'),(27,5,1,40.00,'Vinilo'),(27,8,1,30.00,'CD'),(28,1,2,30.00,'CD'),(29,10,1,30.00,'CD'),(30,1,1,30.00,'CD'),(32,3,1,40.00,'Vinilo');
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Pendiente'),(2,'Enviado'),(3,'Entregado'),(4,'Cancelado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `codigo_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_usuario` int(11) NOT NULL,
  `nombre` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `mensaje` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo_mensaje`),
  KEY `fk_mensaje_usuario` (`codigo_usuario`),
  CONSTRAINT `fk_mensaje_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuarios` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (1,9,'uu','uu@gmail.com','uu'),(2,1,'alex','alex@gmail.com','lolete'),(3,2,'ivan','ivan@hotmail.com','no'),(4,2,'ivan','ivan@hotmail.com','jiji'),(5,2,'ivan','ivan@hotmail.com','vicente paga la pension');
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `importe` decimal(8,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `pedidopor` (`persona`),
  KEY `enestado` (`estado`),
  CONSTRAINT `enestado` FOREIGN KEY (`estado`) REFERENCES `estados` (`codigo`),
  CONSTRAINT `pedidopor` FOREIGN KEY (`persona`) REFERENCES `usuarios` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (11,1,'2024-05-17',100.00,3),(12,1,'2024-05-17',130.00,4),(13,1,'2024-05-17',160.00,4),(14,1,'2024-05-17',40.00,4),(15,1,'2024-05-17',40.00,4),(16,1,'2024-05-17',40.00,4),(17,1,'2024-05-17',110.00,4),(18,1,'2024-05-17',30.00,4),(19,1,'2024-05-17',70.00,4),(20,1,'2024-05-17',40.00,4),(21,1,'2024-05-17',70.00,4),(22,1,'2024-05-17',40.00,1),(23,1,'2024-05-17',68.00,4),(24,1,'2024-05-17',70.00,4),(25,1,'2024-05-17',80.00,4),(26,1,'2024-05-17',50.00,1),(27,1,'2024-05-17',70.00,1),(28,1,'2024-05-17',60.00,1),(29,1,'2024-05-17',30.00,1),(30,1,'2024-05-17',30.00,1),(32,11,'2024-05-17',40.00,4),(33,1,'2024-08-20',50.00,2);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `cantidad` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'1979 - The Smashing Pumpkins',30.00,50,'./img/ab67616d0000b273431ac6e6f393acf475730ec6.jpeg','CD',NULL),(2,'souvlaki - Slowdive',40.00,25,'./img/81pqjl6VYBL._UF894,1000_QL80_.jpg','Vinilo',NULL),(3,'Born to die - Lana del Rey',40.00,29,'./img/71v9YKQxm2L._UF1000,1000_QL80_.jpg','Vinilo',NULL),(4,'deathconsciousness - Have a Nice Life',30.00,40,'./img/61Glb1I76hL._UF894,1000_QL80_.jpg','CD',NULL),(5,'In Rainbows - Radiohead',40.00,26,'./img/inrainbows.jpg','Vinilo',NULL),(6,'..Baby One More Time - Britney Spears',28.00,100,'./img/onemoretime.jpg','Vinilo',NULL),(7,'Currents - Tame Impala',40.00,39,'./img/tame.jpg','Vinilo',NULL),(8,'R.A.M - Daft Punk',30.00,38,'./img/ram.jpeg','CD',NULL),(9,'Beetleburn 2012 - Blur',30.00,37,'./img/blur.jpg','CD',NULL),(10,'Around the Fur - Deftones',30.00,36,'./img/deftones.jpg','CD',NULL),(11,'Escama - VVV',40.00,35,'./img/vvv.jpeg','Vinilo',NULL),(12,'Gas Lágrima - Margarita Quebrada',30.00,34,'./img/mg.jpg','CD',NULL),(13,'4ever - Axolotes Mexicanos',50.00,69,'./img/4ever.jpg','Vinilo',NULL),(14,'Ultraviolence - Lana del Rey',29.00,0,'./img/ultraviolence.jpg','CD',NULL),(15,'CARIÑO - Cariño',15.00,0,'./img/cari.jpg','CD',NULL),(16,'MAKINAVAJA - Depresión Sonora',19.00,0,'./img/makinavaja.jpg','Vinilo',NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `usuario` varchar(32) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellidos` varchar(128) DEFAULT NULL,
  `domicilio` varchar(128) DEFAULT NULL,
  `poblacion` varchar(64) DEFAULT NULL,
  `provincia` varchar(32) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,1,'a','a','admin','adios','asdfwsedf','vsd','sdfs','46470','123'),(2,1,0,'u','uno','dfg','ddg','bb','ddll','j','3','043'),(5,1,0,'cv','cv','cv','cv','cv','cv','cv','2','34'),(6,1,0,'bn','bn','bn','bn','bn','bn','bn','34','4'),(7,1,0,'sfsdf','f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8','as','as','as','as','as','23','34'),(8,1,0,'vu','3f79bb7b435b05321651daefd374cdc681dc06faa65e374e38337b88ca046dea','vuy','vu','vu','d','fg','3','5'),(9,1,0,'uu','5afab9a620f6f11284505be2fb9a975b4dccfdd30970dffc7ed875490160e4d0','uu','uu','uu','uu','uu','11','22'),(10,1,0,'aaa','9834876dcfb05cb167a5c24953eba58c4ac89b1adf57f28f2f9d09af107ee8f0','aaa','aaa','aaa','aaa','aaa','1','2'),(11,1,0,'hola','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','hola','hola','hpoal','coruña','fdf','12','23');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

--
-- Dumping routines for database 'daw'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 16:51:56
