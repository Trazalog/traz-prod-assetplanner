-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: planner_assetcloudtest
-- ------------------------------------------------------
-- Server version	5.6.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abmdeposito`
--

DROP TABLE IF EXISTS `abmdeposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abmdeposito` (
  `depositoId` int(11) NOT NULL AUTO_INCREMENT,
  `depositodescrip` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `id_provincial` varchar(255) DEFAULT NULL,
  `id_localidad` varchar(255) DEFAULT NULL,
  `id_pais` varchar(255) DEFAULT NULL,
  `GPS` varchar(255) DEFAULT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`depositoId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abmdeposito`
--

LOCK TABLES `abmdeposito` WRITE;
/*!40000 ALTER TABLE `abmdeposito` DISABLE KEYS */;
INSERT INTO `abmdeposito` VALUES (1,'deposito 1','I. de la Rosa 2345 Rivadavia',NULL,NULL,NULL,NULL,'AC',6),(2,'Dep√≥sito 2','Av. Libertador San Mart√≠n 2450 oeste',NULL,NULL,NULL,NULL,'AC',6),(4,'Conteiner Mina Chinchillas','MINA Chinchillas',NULL,NULL,NULL,NULL,'AC',7),(5,'Sucursal Gral. Guemes','Tte. Iba√±es 42 Gral Guemes Salta',NULL,NULL,NULL,NULL,'AC',7),(6,'Taller Central ','San Juan',NULL,NULL,NULL,NULL,'AC',7);
/*!40000 ALTER TABLE `abmdeposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abmproveedores`
--

DROP TABLE IF EXISTS `abmproveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abmproveedores` (
  `provid` int(10) NOT NULL AUTO_INCREMENT,
  `provnombre` varchar(255) DEFAULT NULL,
  `provcuit` varchar(50) DEFAULT NULL,
  `provdomicilio` varchar(255) DEFAULT NULL,
  `provtelefono` varchar(50) DEFAULT NULL,
  `provmail` varchar(100) DEFAULT NULL,
  `provestado` varchar(4) DEFAULT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`provid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abmproveedores`
--

LOCK TABLES `abmproveedores` WRITE;
/*!40000 ALTER TABLE `abmproveedores` DISABLE KEYS */;
INSERT INTO `abmproveedores` VALUES (1,'Juan Perez','2023339814','dsadasdasd','2645677','permauricio@gmail.com','8','AC',6),(2,'Trazalog','20-54545454-9','Lib. Gral S Martin 1890','15555555','soporte@trazalog.com','8','AC',6),(3,'Proveedor test','20-20202022-7','Calle proveedor','1777777777','info@proveedor.com','8','AC',7),(5,'Leonardo Pantano Tornero','xxxxxx','San Juan','2645053221','leonardo.pantano@gmail.com','8','AC',7);
/*!40000 ALTER TABLE `abmproveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admcustomers`
--

DROP TABLE IF EXISTS `admcustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admcustomers` (
  `cliId` int(11) NOT NULL AUTO_INCREMENT,
  `cliName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliLastName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDni` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDateOfBirth` date DEFAULT NULL,
  `cliNroCustomer` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliAddress` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliPhone` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliMovil` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliEmail` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliImagePath` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonaId` int(11) DEFAULT NULL,
  `cliDay` int(11) DEFAULT '30',
  `cliColor` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `cliRazonSocial` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cliId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admcustomers`
--

LOCK TABLES `admcustomers` WRITE;
/*!40000 ALTER TABLE `admcustomers` DISABLE KEYS */;
INSERT INTO `admcustomers` VALUES (13,'Daniel','Osvaldo','31324200','1984-05-01','1','Av La Humareda 12','','','','13.png',10,30,'#00a65a','AC',6,'Dani Osvaldo'),(14,'Mariana','Romero','31324205','2016-05-04','14','Av. Simpre Viva 123','','','','14.png',11,15,'#f39c12','AC',6,'MRomero'),(15,'Patricia','Moreno','45632145','2016-05-19','15','Rogelio Funes Mori y No Fue Corner','','','','15.png',10,10,'#dd4b39','AC',6,'Pato Moreno'),(16,'Homero','Perez','45888882','2000-05-10','16','Rivadavia 124s','','','','16.png',12,20,'#00a65a','AC',6,'Homero\'s'),(17,'Mauricio','perez','23339814','2016-06-01','17','dd','26465','026457070785','permaucirio@gmail.com','17.png',10,30,'#00a65a','AC',6,'Master of '),(18,'asAS','ASas','ss','2016-12-16','18','sASAs','sss','s333','permauricio23','18.png',10,30,'#00a65a','AN',6,'ASSAs'),(19,'eliana',NULL,'1234',NULL,NULL,'san lorenzo 1442 este, santa lucia','02644510131',NULL,'eli',NULL,NULL,30,NULL,'AN',6,'nose'),(20,'Mina Chinchilla','Mina chinchilla','02333981',NULL,NULL,'-','-',NULL,'-',NULL,NULL,30,NULL,'AC',7,'Mina Chinchilla');
/*!40000 ALTER TABLE `admcustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admstock`
--

DROP TABLE IF EXISTS `admstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admstock` (
  `stkId` int(11) NOT NULL AUTO_INCREMENT,
  `prodId` int(11) NOT NULL,
  `stkCant` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `stkDate` datetime NOT NULL,
  `stkMotive` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`stkId`),
  KEY `prodId` (`prodId`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admstock`
--

LOCK TABLES `admstock` WRITE;
/*!40000 ALTER TABLE `admstock` DISABLE KEYS */;
INSERT INTO `admstock` VALUES (27,8,10,1,'2016-05-13 15:59:17','Ajuste inicial'),(28,9,5,1,'2016-05-13 15:59:39','Ajuste inicial'),(29,10,20,1,'2016-05-13 15:59:57','Ajuste inicial'),(30,9,-2,1,'2016-05-17 18:15:03','Venta'),(31,10,1,1,'2017-01-19 12:13:25','Salida'),(32,10,5,1,'2017-01-19 12:15:11','entrada'),(33,10,5,1,'2017-01-19 12:15:26','salida'),(34,9,3,1,'2017-01-23 12:30:52','Salida'),(35,10,8,1,'2017-01-23 12:31:10','entrada'),(36,9,1,1,'2017-01-23 13:41:20','entrada'),(37,8,1,1,'2017-03-13 13:39:09','prestamo clorox'),(38,9,1,1,'2017-03-13 13:40:31','ingreso'),(39,10,12,1,'2017-03-13 13:41:09','salida'),(40,9,4,1,'2017-03-28 11:35:41','finning');
/*!40000 ALTER TABLE `admstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admvisits`
--

DROP TABLE IF EXISTS `admvisits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admvisits` (
  `vstId` int(11) NOT NULL AUTO_INCREMENT,
  `vstDate` datetime NOT NULL,
  `cliId` int(11) NOT NULL,
  `vstNote` text COLLATE utf8_spanish_ci NOT NULL,
  `vstStatus` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`vstId`),
  KEY `cliId` (`cliId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admvisits`
--

LOCK TABLES `admvisits` WRITE;
/*!40000 ALTER TABLE `admvisits` DISABLE KEYS */;
/*!40000 ALTER TABLE `admvisits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'proceso nuevo de area',6,'AC'),(2,'gemma area 1',0,'AC'),(3,'Industrial',6,'AC'),(4,'Area Nueva',6,'AC'),(5,'otra area 8',6,'AC'),(6,'area 9',4,'AC'),(7,'area 51',6,'AC'),(8,'Area Testing',6,'AC'),(9,'Area compras',6,'AC'),(10,'area 9',6,'AC'),(12,'MIna',7,'AC'),(13,'Operaciones',6,'AC'),(14,'Mina',7,'AC');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `artId` int(11) NOT NULL AUTO_INCREMENT,
  `artBarCode` varchar(50) NOT NULL,
  `artDescription` varchar(50) NOT NULL,
  `artCoste` decimal(14,2) NOT NULL,
  `artMargin` decimal(10,2) NOT NULL,
  `artIsByBox` int(2) NOT NULL,
  `artCantBox` int(11) DEFAULT NULL,
  `artMarginIsPorcent` bit(1) NOT NULL,
  `artEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `famId` int(11) DEFAULT NULL,
  `unidadmedida` int(11) NOT NULL,
  `punto_pedido` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`artId`),
  UNIQUE KEY `artBarCode` (`artBarCode`) USING BTREE,
  UNIQUE KEY `artDescription` (`artDescription`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (2,'51574','FILTRO DE COMBUSTIBLE P/TAMROCK N¬∞88',0.00,0.00,1,0,'\0','AC',3,1,0,6),(10,'123456','BUJE DE ROTACION P/TAMROCK 680',0.00,0.00,0,6,'\0','AN',9,2,0,6),(11,'50686','BULON NRO. 86321729 P/TAMROCK HL 500',0.00,0.00,1,1,'\0','AC',1,1,0,6),(12,'51258','DIAFRAGMA N:04114808 P/TAMROCK',0.00,0.00,1,3,'\0','AC',4,1,0,6),(13,'51265','DIAFRAGMA P/COMP. TAMROCK HL 680-2 A',0.00,0.00,1,0,'\0','AC',4,1,0,6),(14,'51315','EJE P/ TAMROCK N‚Ä† 15178158',0.00,0.00,1,0,'\0','AC',5,1,0,6),(15,'51317','EJE P/TAMROCK 500 ART. 23313378',0.00,0.00,1,0,'\0','AC',5,1,0,6),(16,'51471','FILTRO  COMBUSTIBLE P 557440 TAMROCK',0.00,0.00,1,3,'\0','AC',3,1,0,6),(17,'51571','FILTRO TAMROCK ACEITE CAT 1R-0739',0.00,0.00,1,0,'\0','AC',3,1,0,6),(18,'51545','FILTRO TAMROCK AIRE ‚Ä†88546679',0.00,0.00,1,0,'\0','AC',3,1,0,6),(19,'51546','FILTRO TAMROCK AIRE/CABINA PRIMARIO',0.00,0.00,1,0,'\0','AC',3,1,0,6),(20,'51548','FILTRO TAMROCK AIRE/COMPRESOR 885467',0.00,0.00,1,1,'\0','AC',3,1,0,6),(21,'51550','FILTRO TAMROCK CIRC/HID.RETORNO 8672',0.00,0.00,1,0,'\0','AC',3,1,0,6),(22,'51551','FILTRO TAMROCK CIRC/HID.SANDVICK 815',0.00,0.00,1,0,'\0','AC',3,1,0,6),(23,'51552','FILTRO TAMROCK COMB,N‚Ä† 1R-0751',0.00,0.00,1,0,'\0','AC',3,1,0,6),(24,'51553','FILTRO TAMROCK COMB,TRAMPA/AGUA 1466',0.00,0.00,1,0,'\0','AC',3,1,0,6),(25,'53605','TRAMPA DE AGUA PARA TAMROCK',0.00,0.00,1,2,'\0','AC',10,1,0,6),(26,'53701','TUERCA NRO.81125969 P/TAMROCK',0.00,0.00,1,1,'\0','AC',9,1,0,6),(27,'53947','KIT DE SELLOS NRO.879484449 TAMROCK',0.00,0.00,1,0,'\0','AC',7,1,0,6),(28,'53966','RETEN NRO 15074808 TAMROCK R -500',0.00,0.00,1,1,'\0','AC',8,1,0,6),(29,'53969','SELLOS NRO 81820039 TAMROCK R-500',0.00,0.00,1,3,'\0','AC',7,1,0,6),(30,'54022','BUJE P/TAMROCK N 15021838',0.00,0.00,1,4,'\0','AC',2,1,0,6),(31,'54469','VALVULA  ART 807 590 69 P/TAMROCK HL',0.00,0.00,1,2,'\0','AC',6,1,0,6),(32,'58076','FILTRO TAMROCK 500 AIRE COMPRESOR PR',0.00,0.00,1,1,'\0','AC',3,1,0,6),(33,'58077','FILTRO TAMROCK 500 AIRE SECUNDARIO M',0.00,0.00,1,0,'\0','AC',3,1,0,6),(34,'58078','FILTRO TAMROCK 500 AIRE  PRIMARIO MO',0.00,0.00,1,0,'\0','AC',3,1,0,6),(35,'58079','FILTRO TAMROCK 500 AIRE COMPRESOR SE',0.00,0.00,1,0,'\0','AC',3,1,0,6),(36,'58080','FILTRO TAMROCK 500 GASOIL ART8823923',0.00,0.00,1,3,'\0','AC',3,1,0,6),(37,'58081','FILTRO TAMROCK 500 GASOIL SEPARADOR',0.00,0.00,1,0,'\0','AC',3,1,0,6),(38,'58082','FILTRO TAMROCK 500 ACEITE MOTOR ART',0.00,0.00,1,3,'\0','AC',3,1,0,6),(39,'50190','ARANDELA DE BRONCE 7K-1840 P/CAT 966',0.00,0.00,1,0,'\0','AN',11,1,0,6),(40,'50236','ARANDELAS N  7K-1839 P/CATERPILLAR 9',0.00,0.00,1,0,'\0','AN',11,1,0,6),(41,'50465','BULON ART. NRO. 6729510 P/ BOB CATERPILLAR',0.00,0.00,0,0,'\0','AC',1,4,0,6),(42,'50712','BULON   P/ CAT- 966 DIENTE DE CARGAD',0.00,0.00,1,22,'\0','AC',1,1,0,6),(43,'50714','BULON  8T -6466 P/AIRE ACONDI CAT -',0.00,0.00,1,0,'\0','AC',1,1,0,6),(44,'50966','COMPRESOR DE AIRE N‚Ä† 8N 6105 P / CAT',0.00,0.00,1,0,'\0','AC',19,1,0,6),(45,'51084','CORREA DE ALTERNAD. P/BOBCAT ART.710',0.00,0.00,1,5,'\0','AC',21,1,0,6),(46,'51188','CORTA CORRIENTE DE 24 VOLT. P/CAT 98',0.00,0.00,1,1,'\0','AC',20,1,0,6),(47,'51208','CUBIERTA 10 X 16.5 SOLIDEAL P/BOBCAT',0.00,0.00,1,1,'\0','AC',22,1,0,6),(48,'51259','DIAFRAGMA N‚Ä† 5V 6125 P/ CAT 980',0.00,0.00,1,3,'\0','AC',4,1,0,6),(49,'51455','FILTRO BOBCAT ACEIT,HID.N‚Ä†6661248',0.00,0.00,1,2,'\0','AC',3,1,0,6),(50,'51456','FILTRO BOBCAT ACEIT,MOTOR N‚Ä†03974896',0.00,0.00,1,2,'\0','AC',3,1,0,6),(51,'51457','FILTRO BOBCAT AIRE PRIM.N‚Ä†06598492',0.00,0.00,1,8,'\0','AC',3,1,0,6),(52,'51458','FILTRO BOBCAT AIRE SEC.N‚Ä†06598362',0.00,0.00,1,9,'\0','AC',3,1,0,6),(53,'51459','FILTRO BOBCAT COMB.N‚Ä†06667352',0.00,0.00,1,7,'\0','AC',3,1,0,6),(54,'51460','FILTRO CAT-966 ACEIT/CONV N‚Ä†9740',0.00,0.00,1,0,'\0','AC',3,1,0,6),(55,'51461','FILTRO CAT-966 ACEIT/HID,N‚Ä†156-0741-',0.00,0.00,1,1,'\0','AC',3,1,0,6),(56,'51462','FILTRO CAT-966 ACEITE N‚Ä†1R-0739',0.00,0.00,1,0,'\0','AC',3,1,0,6),(57,'51463','FILTRO CAT-966 AIRE PRIMARIO 2453818',0.00,0.00,1,1,'\0','AC',3,1,0,6),(58,'51464','FILTRO CAT-966 AIRE SECUNDARIO 24538',0.00,0.00,1,1,'\0','AC',3,1,0,6),(59,'51465','FILTRO CAT-966 COMB,N‚Ä†1P-2299-BOSCH',0.00,0.00,1,0,'\0','AC',3,1,0,6),(60,'51466','FILTRO CAT-980 ACEITE MOTOR',0.00,0.00,1,0,'\0','AC',3,1,0,6),(61,'51467','FILTRO CAT-980 ACEIT/HIDRAULICO',0.00,0.00,1,0,'\0','AC',3,1,0,6),(62,'51468','FILTRO CAT-980 TRASMISION',0.00,0.00,1,0,'\0','AC',3,1,0,6),(63,'51469','FILTRO CAT-980 FILTRO SEPARADOR DE A',0.00,0.00,1,0,'\0','AC',3,1,0,6),(64,'51470','FILTRO CAT-980 CABINA',0.00,0.00,1,0,'\0','AC',3,1,0,6),(66,'51685','GUIA N‚Ä† 2 L-3650 P/CAT 966',0.00,0.00,1,1,'\0','AC',12,1,0,6),(67,'51825','JUNTA N‚Ä† 8S-1605 P/CAT.966',0.00,0.00,1,0,'\0','AC',15,1,0,6),(68,'51826','JUNTA N‚Ä† 9Y-1979 P/CAT.966',0.00,0.00,1,0,'\0','AC',15,1,0,6),(69,'51829','JUNTA NRO. 6684788 P/BOB CAT',0.00,0.00,1,0,'\0','AC',15,1,0,6),(70,'52317','PERNO DE BALDE  NRO. 8K- 5334 P/CAT.',0.00,0.00,1,2,'\0','AC',13,1,0,6),(71,'53371','SELLO  N: 2H-6368 P/CAT. 966',0.00,0.00,1,6,'\0','AC',7,1,0,6),(72,'53394','SELLO N‚Ä† 6D 692 P/ CAT -980',0.00,0.00,1,4,'\0','AC',7,1,0,6),(73,'53703','TUERCA P/BOBCAT S150 N‚Ç¨ 6674202',0.00,0.00,1,0,'\0','AC',9,1,0,6),(74,'53706','TUERCA PARA BULON DE RUEDA, P/ CAT.',0.00,0.00,1,20,'\0','AC',9,1,0,6),(75,'53918','COJINETE  5M 578 CAT-966',0.00,0.00,1,4,'\0','AC',14,1,0,6),(76,'54023','BULON 1604 P/CAT 980',0.00,0.00,1,8,'\0','AC',1,1,0,6),(77,'54042','CABLE DE ACELERADOR P/CAT 980 ART 3V',0.00,0.00,1,1,'\0','AC',16,1,0,6),(78,'54210','JUNTA 5S-4629 P/CAT-966',0.00,0.00,1,2,'\0','AC',15,1,0,6),(79,'57873','FILTRO DE COMBUSTIBLE CAT 966H 1R-07',0.00,0.00,1,3,'\0','AC',3,1,0,6),(80,'57874','FILTRO  DE  ACEITE MOTOR CAT 966H 1R',0.00,0.00,1,0,'\0','AC',3,1,0,6),(81,'57876','FILTRO  DE  ACEITE  HIDRAULICO  CAT',0.00,0.00,1,7,'\0','AC',3,1,0,6),(82,'54012','BASE  PORTA FILTRO  ART 6N 1044 CAT',0.00,0.00,1,0,'\0','AC',3,1,0,6),(83,'54833','CAMISA CILINDRO DE MOTOR CAT-3306',0.00,0.00,1,0,'\0','AC',24,1,0,6),(84,'54834','JUEGO DE AROS DE MOTOR CAT-3306',0.00,0.00,1,0,'\0','AC',24,1,0,6),(85,'57913','RADIADOR AGUA P/CAT 966H',0.00,0.00,1,0,'\0','AC',23,1,0,6),(86,'58036','TERMOSTATO  NRO 281- 8744 P/CAT 924',0.00,0.00,1,0,'\0','AC',17,1,0,6),(87,'58038','TERMOSTATO  NRO 248 -5513 P/CAT 966',0.00,0.00,1,0,'\0','AC',17,1,0,6),(88,'58275','FILTRO CAT-980 MOTOR 1R-1808',0.00,0.00,1,3,'\0','AC',3,1,0,6),(89,'58276','FILTRO CAT-980 GASOIL 1R0749',0.00,0.00,1,4,'\0','AC',3,1,0,6),(90,'58277','FILTRO CAT-980 GASOIL SEP 326-1644',0.00,0.00,0,0,'\0','AC',3,1,0,6),(91,'58278','FILTRO CAT-980 AIRE PRIMARIO 151-773',0.00,0.00,1,3,'\0','AC',3,0,0,6),(92,'58279','FILTRO CAT-980 AIRE SECUNDARIO 18902',0.00,0.00,1,7,'\0','AN',3,1,0,6),(93,'50182','ARANDELA ART, 01643-32260 P/ KOMATSU',0.00,0.00,1,0,'\0','AN',11,1,88,6),(94,'50400','BRACKET P/KOMATSU P/KOMATSU 470',0.00,0.00,1,2,'\0','AN',1,1,0,6),(95,'50436','BUJE N‚Ä† 17177-04530 P/KOMATSU WA 420',0.00,0.00,1,1,'\0','AN',2,1,0,6),(96,'50461','BUJIA NRO. 600-815-2770 P/KOMATSU 42',0.00,0.00,0,0,'\0','IN',2,1,4,6),(97,'50684','BULON NRO. 16202091-12050 P/ KOMATSU',0.00,0.00,1,22,'\0','AC',1,1,0,6),(98,'50685','BULON NRO. 419-70-13150 P/KOMATSU 25',0.00,0.00,1,12,'\0','AC',1,1,0,6),(99,'50689','BULON P/KOMATSU 470 N 2 ART. 09208-1',0.00,0.00,1,0,'\0','AC',1,1,0,6),(100,'50715','BULON  DE CARDAN P/ KOMATSU 420-3 N‚Ä†',0.00,0.00,1,9,'\0','AC',1,1,0,6),(101,'50716','BULON  P/ KOMATSU N‚Ä† 02090-11490',0.00,0.00,1,41,'\0','AC',1,1,0,6),(102,'50717','BULON   DE CARDAN P/ KOMATSU 420-3 N',0.00,0.00,1,23,'\0','AC',1,0,0,6),(103,'51179','CORREA NRO. 6732-81-6170 , P/KOMATSU',0.00,0.00,1,2,'\0','AC',21,0,0,6),(104,'51196','CRUCETA NRO. 418-20-34620 P/KOMATSU',0.00,0.00,1,1,'\0','AC',1,1,0,6),(105,'51197','CRUCETA NRO. 421-20-12620 P/KOMATSU',0.00,0.00,1,1,'\0','AC',25,1,0,6),(121,'51198','ESPEJO NRO. 421-54-25620 P/KOMATSU 4',0.00,0.00,0,NULL,'\0','AC',1,0,NULL,6),(130,'51195','CRUCETA NRO 418-20-32620 , P/KOMATSU',0.00,0.00,1,1,'\0','AC',25,1,0,6),(133,'51808','JUNTA ANULAR P/KOMATSU 470  ART.600-',0.00,0.00,1,0,'\0','AC',15,1,0,6),(134,'52304','PASADOR P/KOMATSU 470 ART, 092440251',0.00,0.00,1,3,'\0','AC',28,1,0,6),(135,'52408','PLATOS NRO. 421-70-22140  P/ KOMATSU',0.00,0.00,1,4,'\0','AC',29,1,0,6),(136,'53377','SELLO 421- 33 - 11480 P/ KOMATSU 420',0.00,0.00,1,0,'\0','AC',7,1,0,6),(137,'53637','TUERCA 09218 - 12219 P/ KOMATSU WA 4',0.00,0.00,1,2,'\0','AC',9,1,0,6),(138,'53693','TUERCA N‚Ä† 02290 - 11422 P/KOMATSU WA',0.00,0.00,1,0,'\0','AC',9,1,0,6),(139,'53695','TUERCA NRO. 02290-11625, P/KOMATSU 4',0.00,0.00,1,9,'\0','AC',9,1,0,6),(140,'53696','TUERCA NRO. 091218-12523 P/KOMATSU 2',0.00,0.00,1,16,'\0','AC',9,1,0,6),(141,'53698','TUERCA NRO. 16202290-12031 P/KOMATSU',0.00,0.00,1,21,'\0','AC',9,1,0,6),(142,'53700','TUERCA NRO.02290-11422 P/KOMATSU',0.00,0.00,1,2,'\0','AC',9,1,0,6),(143,'53721','TUERCAS N ¬∫ 09218-12219 P/ KOMATSU',0.00,0.00,1,6,'\0','AC',9,1,0,6),(144,'53820','VALVULA P/ FILTRO DE AIRE P/KOMATSU',0.00,0.00,1,2,'\0','AC',6,1,0,6),(145,'53991','ACOPLE NRO  09281-00041 P/KOMATSU 25',0.00,0.00,1,1,'\0','AC',18,1,0,6),(146,'54019','BUJE 421-70-11272 P/KOMATSU 470',0.00,0.00,1,0,'\0','AC',2,1,0,6),(147,'54045','CABLE  NRO 424-9916110  P/KOMATSU',0.00,0.00,1,1,'\0','AC',1,1,0,6),(148,'54150','FILT.KOMATSU 470 /2 COMBUSTIBLE 600-',0.00,0.00,1,0,'\0','AC',3,1,0,6),(149,'54411','SEGURO NRO. 09283-00000 P/KOMATSU 25',0.00,0.00,1,1,'\0','AC',30,1,0,6),(150,'54432','TAPA  NRO 09282-00017 P/KOMATSU 250',0.00,0.00,1,1,'\0','AC',31,1,0,6),(151,'54504','TUERCA DE ACERO / KOMATSU 420',0.00,0.00,1,8,'\0','AC',9,1,0,6),(152,'54505','BULON NRO 16201010-62075 P/KOMATSU',0.00,0.00,1,3,'\0','AC',1,1,0,6),(153,'54929','JUNTA ANULAR PARA KOMATSU 470 ART: 1',0.00,0.00,1,1,'\0','AC',15,1,0,6),(154,'55204','TUERCA P/ EJE DELANTERO P/ KOMATSU 4',0.00,0.00,1,9,'\0','AC',9,1,0,6),(155,'55242','ALTERNADOR DE 24V. P/KOMATSU',0.00,0.00,1,0,'\0','AC',32,1,0,6),(156,'51439','FAROS  TOYOTA 3.0',0.00,0.00,1,0,'\0','IN',33,1,0,6),(157,'51486','FILTRO COMBUSTIBLE  CLARK TOYOTA 233',0.00,0.00,1,0,'\0','AC',3,1,0,6),(158,'51488','FILTRO CLARK TOYOTA MOTOR 90915-2000',0.00,0.00,1,3,'\0','AC',3,1,0,6),(159,'51490','FILTRO CLARK TOYOTA CONVERTIDOR 3267',0.00,0.00,1,1,'\0','AC',3,1,0,6),(160,'51516','FILTRO CLARK TOYOTA HIDRAULICO 67502',0.00,0.00,1,4,'\0','AC',3,1,0,6),(161,'51517','FILTRO CLARK TOYOTA AIRE SECUNDARIO',0.00,0.00,1,4,'\0','AC',3,1,0,6),(162,'51518','FILTRO CLARK TOYOTA AIRE PRIMARIO P8',0.00,0.00,1,0,'\0','AC',3,1,0,6),(163,'50386','BOMBIN DE GASOIL P/BOBCAT ART.665773',0.00,0.00,1,100,'\0','AN',15,1,6,6),(165,'56174','LLANTA NRO. NRPB03535239 P/ BOBCAT S',0.00,0.00,1,0,'\0','AC',35,1,0,6),(166,'1234','nuevo articulo',0.00,0.00,1,6,'\0','AN',3,1,1203,6),(169,'9999','nuevo producto',0.00,0.00,1,23,'\0','AN',13,2,1200,6),(170,'9987','nuevo ver',0.00,0.00,1,23,'\0','AN',15,2,0,6),(171,'3115 23 23','nose',0.00,0.00,1,1,'\0','AC',6,0,0,7),(172,'xxxxxx','yyyyyyy',0.00,0.00,0,0,'\0','AN',3,1,2,7),(173,'12345678910','nueva descripcion',0.00,0.00,0,0,'\0','AC',15,0,0,6),(174,'123456789','descripcion de prueba',0.00,0.00,0,0,'\0','AC',17,0,0,6),(175,'12345678','nuevaaaaaa',0.00,0.00,1,33,'\0','AC',3,0,0,6),(176,'15151515','producto nuevo',0.00,0.00,0,0,'\0','AC',1,0,3,6),(177,'123','123descripcion',0.00,0.00,1,6,'\0','AN',1,2,2,6),(178,'1112','1112descrip',0.00,0.00,1,12,'\0','AN',5,2,1112,6),(185,'11asdf','11asdf',0.00,0.00,1,6,'\0','AN',3,3,11,6),(194,'1codigo-001','descripci√≥n de c√≥digo 001',0.00,0.00,0,0,'\0','AN',22,1,1,6),(200,'2cod-002','descrip cod 002',0.00,0.00,1,12,'\0','AN',5,1,2,6),(201,'111','ghfhjgfhg',0.00,0.00,0,0,'\0','AN',3,1,2,6),(202,'111111111','nuevo',0.00,0.00,1,10,'\0','AN',21,3,5,6),(203,'123455678','eliiiii',0.00,0.00,1,11,'\0','AN',24,1,4,6),(210,'3cod-0003','descrip',0.00,0.00,0,0,'\0','AN',5,2,3,6),(211,'4cod0004a','Descrip 03',0.00,0.00,0,12,'\0','AN',15,1,3,6),(212,'222233','dsadsadsad',0.00,0.00,0,0,'\0','AN',17,1,3,6),(213,'333333','sdadasdsad',0.00,0.00,1,4,'\0','AN',22,1,4,6),(215,'124456897654324','hefdiujbwda',0.00,0.00,0,0,'\0','AN',20,1,4,6),(216,'1234556678','nuevoooooo',0.00,0.00,1,10,'\0','AN',26,1,5,6),(221,'aaa','aaa',0.00,0.00,1,6,'\0','AN',4,2,0,6),(227,'11187326487234623462783','assdasds',0.00,0.00,0,0,'\0','AN',13,3,0,6),(228,'122334455','nuevo test',0.00,0.00,1,60,'\0','AN',17,2,41,6),(229,'123456678','test',0.00,0.00,1,10,'\0','AN',12,1,55,6),(235,'000','nnnn',0.00,0.00,0,0,'\0','AN',5,1,3,6),(236,'00001','aaaa',0.00,0.00,0,0,'\0','AN',1,1,6,6),(238,'1','nuevo articulo 112233',0.00,0.00,1,30,'\0','AN',33,1,5,6),(239,'2','nuevo articulo 2',0.00,0.00,1,12,'\0','AN',22,1,4,6),(240,'12345','nuevo de 5',0.00,0.00,1,5,'\0','AN',1,1,4,6),(245,'8888888888','campo de 6 digitos',0.00,0.00,1,12,'\0','AN',20,3,4,6),(246,'1122334455','eliana',0.00,0.00,1,44,'\0','AN',1,1,5,6),(248,'22','asdasd',0.00,0.00,1,0,'\0','AC',1,-1,3,7),(249,'57653456','bulon de escalera ',0.00,0.00,1,0,'\0','AC',1,-1,1,7),(250,'1R-1825 ','filtro ',0.00,0.00,1,2,'\0','AN',3,1,4,7),(251,'sdsad','sdsd',0.00,0.00,1,0,'\0','AC',12,1,2,7);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaherramientas`
--

DROP TABLE IF EXISTS `asignaherramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignaherramientas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `herrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `herrId` (`herrId`),
  KEY `id_orden` (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaherramientas`
--

LOCK TABLES `asignaherramientas` WRITE;
/*!40000 ALTER TABLE `asignaherramientas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignaherramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignausuario`
--

DROP TABLE IF EXISTS `asignausuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignausuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usrId` (`usrId`),
  KEY `id_orden` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignausuario`
--

LOCK TABLES `asignausuario` WRITE;
/*!40000 ALTER TABLE `asignausuario` DISABLE KEYS */;
INSERT INTO `asignausuario` VALUES (1,16,4,'2018-09-19 11:50:17'),(2,17,4,'2018-09-19 11:50:17'),(3,17,10,'2018-10-18 04:41:14'),(4,17,12,'2018-10-18 04:47:13'),(5,17,19,'2018-10-20 22:28:33'),(6,1,19,'2018-10-20 22:28:33'),(7,17,20,'2018-10-20 23:51:41'),(8,18,22,'2018-10-20 23:56:41'),(9,18,23,'2018-10-20 23:58:00'),(10,17,24,'2018-10-21 00:23:50'),(11,18,25,'2018-10-21 00:27:42'),(12,17,33,'2018-10-21 18:22:05'),(13,17,1,'2018-10-23 19:38:25');
/*!40000 ALTER TABLE `asignausuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `idCiudades` int(11) NOT NULL AUTO_INCREMENT,
  `Paises_Codigo` varchar(2) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`idCiudades`),
  KEY `Paises_Codigo` (`Paises_Codigo`),
  KEY `Ciudad` (`Ciudad`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'AR','Buenos Aires'),(2,'AR','Santa Fe'),(3,'AR','C√≥rdoba'),(4,'AR','Misiones'),(5,'AR','Entre Rios'),(6,'AR','Mendoza'),(7,'AR','San Juan'),(8,'AR','Tucum√°n'),(9,'AR','Tierra del Fuego'),(10,'AR','Chaco'),(11,'AR','La Pampa'),(12,'AR','Jujuy'),(13,'AR','Rio Negro'),(14,'AR','Chubut'),(15,'AR','Corrientes'),(16,'AR','Santa Cruz'),(17,'AR','Salta'),(18,'AR','San Luis'),(19,'AR','Neuquen'),(20,'AR','Catamarca'),(21,'AR','Santiago del Estero'),(22,'AR','La Rioja'),(23,'AR','Formosa');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `clinteid` int(11) NOT NULL AUTO_INCREMENT,
  `clientrazonsocial` varchar(255) DEFAULT NULL,
  `clientdireccion` varchar(255) DEFAULT NULL,
  `clientmail` varchar(255) DEFAULT NULL,
  `clienttelefono` int(11) DEFAULT NULL,
  `clientetelefono1` varchar(255) DEFAULT NULL,
  `localidadid` varchar(50) DEFAULT NULL,
  `paisid` varchar(2) DEFAULT NULL,
  `provinciaid` int(11) DEFAULT NULL,
  `cuenta_cuentaid` int(11) NOT NULL,
  PRIMARY KEY (`clinteid`),
  KEY `fk_clientes_cuenta1_idx` (`cuenta_cuentaid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'TRazalog','av libertado 3890 oeste','ventas@trazalog.com',2147483647,NULL,'San Juan','1',1,1),(2,'MRS SERVICE SRL','-','-',NULL,NULL,NULL,'AR',1,0);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componenteequipo`
--

DROP TABLE IF EXISTS `componenteequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componenteequipo` (
  `idcomponenteequipo` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `codigo` varchar(40) DEFAULT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `sistemaid` int(11) NOT NULL,
  PRIMARY KEY (`idcomponenteequipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componenteequipo`
--

LOCK TABLES `componenteequipo` WRITE;
/*!40000 ALTER TABLE `componenteequipo` DISABLE KEYS */;
INSERT INTO `componenteequipo` VALUES (1,1,31,NULL,'mt666-cucharon-electrico','AC',6,1),(2,1,26,NULL,'mt666-corredera-mecanico','AC',6,3),(3,9,25,NULL,'bateria mt666','P',6,4),(4,1,1,NULL,'codigo003','AC',6,1),(5,9,57,NULL,'codigo666','AC',6,3);
/*!40000 ALTER TABLE `componenteequipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentes`
--

DROP TABLE IF EXISTS `componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentes` (
  `id_componente` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL,
  `informacion` text COLLATE utf8_spanish_ci,
  `marcaid` int(11) DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_componente`),
  KEY `id_equipo` (`id_equipo`),
  KEY `marcaid` (`marcaid`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentes`
--

LOCK TABLES `componentes` WRITE;
/*!40000 ALTER TABLE `componentes` DISABLE KEYS */;
INSERT INTO `componentes` VALUES (1,'MOTOR DIESEL',1,'2018-07-03 10:55:57','',1,'comp1.pdf','AC',6),(2,'VALVULA DE PURGA',1,'2018-07-03 10:57:26','',1,'assets/filesequipos/2.pdf','AC',6),(3,'FILTRO DE COMBUSTIBLE ',1,'2018-07-03 10:57:44','',1,'assets/filesequipos/3.pdf','AC',6),(4,'RESPIRADOR DE TANQUE',1,'2018-07-03 10:57:56','',1,'assets/filesequipos/4.pdf','AC',6),(5,'RADIADOR',1,'2018-07-03 10:58:04','',1,'assets/filesequipos/5.pdf','AC',6),(6,'CORREA DE DISTRIBUCION DEL MOTOR',2,'2018-07-03 11:06:02','',7,'assets/filesequipos/6.pdf','AC',6),(7,'VALVULA MOTOR',2,'2018-07-03 11:06:23','',7,'assets/filesequipos/7.pdf','AC',6),(8,'FRENOS',2,'2018-07-03 11:06:28','',7,'assets/filesequipos/8.pdf','AC',6),(9,'CINTURON DE SEGURIDAD',2,'2018-07-03 11:06:41','',7,'assets/filesequipos/9.pdf','AC',6),(10,'DEPOSITO LIMPIAPARABRISAS',2,'2018-07-03 11:06:59','',7,'assets/filesequipos/10.pdf','AC',6),(11,'VALVULA DE ESCAPE',3,'2018-07-03 11:18:54','',8,'assets/filesequipos/11.pdf','AC',6),(12,'CARTER DEL MOTOR',3,'2018-07-03 11:19:06','',5,'comp12.pdf','AC',6),(13,'VALVULA DE ALIVIO',3,'2018-07-03 11:19:19','',5,'comp13.pdf','AC',6),(14,'REJILLA DE ACEITE DE DIRECCION ',3,'2018-07-03 11:19:48','',5,'comp14.pdf','AC',6),(15,'CILINDRO DE DIRECCI√ìN',3,'2018-07-03 11:20:00','',5,'comp15.pdf','AC',6),(16,'LUCES',4,'2018-07-03 11:27:31','',6,'comp13.pdf','AC',6),(17,'MOTOR',4,'2018-07-03 11:28:05','',6,'comp13.pdf','AN',6),(18,'SOPORTE MOTOR',4,'2018-07-03 11:28:40','',6,'comp13.pdf','AN',6),(19,'CADENA',4,'2018-07-03 11:28:50','',6,'assets/filesequipos/19.pdf','AN',6),(20,'NEUMATICOS',4,'2018-07-03 11:28:59','',6,'assets/filesequipos/20.pdf','AN',6),(21,'MOTOR DIESEL',5,'2018-07-03 11:37:13','',1,'assets/filesequipos/21.pdf','AN',6),(22,'CORREDERA',5,'2018-07-03 11:37:40','',1,'assets/filesequipos/22.pdf','AN',6),(23,'BRAZO',5,'2018-07-03 11:37:54','',1,'assets/filesequipos/23.pdf','AN',6),(24,'SENSOR DE TEMPERATURA',5,'2018-07-03 11:39:00','',1,'comp13.pdf','AC',6),(25,'BATERIA',5,'2018-07-03 11:39:11','',1,'comp13.pdf','AC',6),(26,'CORREDERA',1,'2018-07-03 16:08:09','',1,'comp13.pdf','AC',6),(27,'BRAZO',1,'2018-07-03 16:50:47','',1,'comp14.pdf','AC',6),(28,'MARTILLO',1,'2018-07-03 21:50:00','',1,'comp14.pdf','AC',6),(29,'BASTIDOR',1,'2018-07-03 22:14:02','',1,'comp14.pdf','AC',6),(30,'BATERIA ',1,'2018-07-03 22:20:52','',1,'comp14.pdf','AC',6),(31,'CUCHARON',2,'2018-07-04 09:28:53','',7,'comp14.pdf','AC',6),(32,'TRANSMISION ',2,'2018-07-04 09:55:19','',7,'comp14.pdf','AC',6),(33,'TANQUE HIDRAULICO ',2,'2018-07-04 10:09:52','',7,'comp15.pdf','AC',6),(34,'COLUMNA DE DIRECCION',2,'2018-07-04 10:21:36','',7,'comp15.pdf','AC',6),(35,'BATERIA',2,'2018-07-04 10:32:04','',7,'comp15.pdf','AC',6),(36,'COJINETE',2,'2018-07-04 10:32:23','',7,'comp15.pdf','AC',6),(37,'CARROCERIA',2,'2018-07-04 10:32:54','',7,'comp15.pdf','AC',6),(38,'FILTRO DE ACEITE MOTOR',2,'2018-07-04 10:33:14','',7,'comp15.pdf','AC',6),(39,'MOTOR',2,'2018-07-04 10:33:25','',7,'comp15.pdf','AC',6),(40,'TANQUE DE COMBUSTIBLE',2,'2018-07-04 10:41:43','',7,'comp15.pdf','AC',6),(41,'CORREA DE DISTRIBUCI√ìN DEL MOTOR',2,'2018-07-04 10:42:02','',7,'assets/filesequipos/41.pdf','AC',6),(42,'FILTRO DE AIRE PRIMARIO DEL MOTOR',2,'2018-07-04 10:42:26','',7,'assets/filesequipos/42.pdf','AC',6),(43,'FILTRO DE AIRE SECUNDARIO DEL MOTOR',2,'2018-07-04 10:42:47','',7,'assets/filesequipos/43.pdf','AC',6),(44,'FILTRO DE COMBUSTIBLE PRIMARIO DEL MOTOR',2,'2018-07-04 10:43:13','',7,'assets/filesequipos/44.pdf','AC',6),(45,'V√ÅLVULAS DE ADMISI√ìN',3,'2018-07-04 11:40:18','',5,'comp45.pdf','AC',6),(46,'V√ÅLVULAS DE ADMISI√ìN',3,'2018-07-04 11:47:26','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/46.pdf','AC',6),(47,'FILTRO DE ACEITE DE TRANSMISI√ìN',3,'2018-07-04 11:48:49','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/47.pdf','AC',6),(48,'RESPIRADERO DE LA CAJA DE TRANSMISI√ìN',3,'2018-07-04 11:49:05','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/48.pdf','AC',6),(49,'EJE DELANTERO',3,'2018-07-04 11:49:21','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/49.pdf','AC',6),(50,'EJE TRASERO',3,'2018-07-04 11:49:40','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/50.pdf','AC',6),(51,'DIFERENCIAL',3,'2018-07-04 11:49:53','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/51.pdf','AC',6),(52,'FILTRO DE ACONDICIONADOR DE AIRE DE CABINA',3,'2018-07-04 11:50:08','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/52.pdf','AC',6),(53,'TANQUE HIDR√ÅULICO ',3,'2018-07-04 11:50:25','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/53.pdf','AC',6),(54,'NEUM√ÅTICOS',3,'2018-07-04 11:50:47','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/54.pdf','AC',6),(55,'MANDO FINAL',3,'2018-07-04 11:50:59','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/55.pdf','AC',6),(56,'CHASIS',3,'2018-07-04 11:51:12','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/56.pdf','AC',6),(57,'ALARMA DE RETROCESO',3,'2018-07-04 11:51:27','CAJA DE TRANSMISI√ìN',5,'assets/filesequipos/57.pdf','AC',6),(58,'JAULA ANTIVUELCO',3,'2018-07-04 11:51:41','',5,'assets/filesequipos/58.pdf','AC',6),(59,'CAJA DE TRANSMISION',3,'2018-07-04 12:45:47','',5,'assets/filesequipos/59.pdf','AC',6),(60,'FILTRO DE ACEITE MOTOR',4,'2018-07-05 11:35:02','',6,'assets/filesequipos/60.pdf','AC',7),(61,'CORREA DE DISTRIBUCI√ìN DEL MOTOR',4,'2018-07-05 11:35:29','',6,'assets/filesequipos/61.pdf','AC',7),(62,'FILTRO DE AIRE  DEL MOTOR',4,'2018-07-05 11:35:59','',6,'assets/filesequipos/62.pdf','AC',7),(63,'FILTRO DE COMBUSTIBLE  DEL MOTOR',4,'2018-07-05 11:36:18','',6,'assets/filesequipos/63.pdf','AC',7),(64,'RADIADOR DE MOTOR',4,'2018-07-05 11:36:36','',6,'assets/filesequipos/64.pdf','AC',7),(65,'FRENOS',4,'2018-07-05 11:36:55','',6,'assets/filesequipos/65.pdf','AC',7),(66,'FILTRO DE AIRE CABINA',4,'2018-07-05 11:37:10','',6,'assets/filesequipos/66.pdf','AC',7),(67,'BATER√çA',4,'2018-07-05 11:37:26','',6,'assets/filesequipos/67.pdf','AC',7),(68,'BOCINA',4,'2018-07-05 11:37:41','',6,'assets/filesequipos/68.pdf','AC',7),(69,'ARTICULACIONES DE LA TORRE ',4,'2018-07-05 11:38:01','',6,'assets/filesequipos/69.pdf','AC',7),(70,'CONVERTIDOR',4,'2018-07-05 11:38:20','',6,'assets/filesequipos/70.pdf','AC',7),(71,'MANGUERAS',4,'2018-07-05 11:38:40','',6,'assets/filesequipos/71.pdf','AC',7),(72,'AUTOELEVADOR TOYOTA',4,'2018-07-05 11:39:01','',6,'assets/filesequipos/72.pdf','AC',7),(73,'CHASIS',4,'2018-07-05 11:39:17','',6,'assets/filesequipos/73.pdf','AC',7),(74,'Motor Disel',11,'2018-09-16 23:46:30','-',1,'assets/filesequipos/74.pdf','AC',7),(75,'Motor Diesel C32',12,'2018-09-18 09:57:46','',5,'assets/filesequipos/75.pdf','AC',7),(76,'Motor Diesel C18',13,'2018-09-18 10:05:16','',4,'assets/filesequipos/76.pdf','AC',7),(77,'Cabezal',13,'2018-09-22 09:27:50','Cabezal de rotacion',11,'assets/filesequipos/77.pdf','AC',7),(78,'Cabezal',13,'2018-09-22 09:29:02','Cabezal de rotacion',11,'assets/filesequipos/78.pdf','AC',7),(79,'compresor',13,'2018-09-22 09:42:25','compresor  de aire de barrido 1070 HR2.5',11,'assets/filesequipos/79.pdf','AC',7),(80,'Filtros de aire ',13,'2018-09-22 10:25:39','Aire primario  52252061',12,'assets/filesequipos/80.pdf','AC',7),(81,'Filtros de aire ',13,'2018-09-22 10:28:32','Filtors primarios: 52252061\nFiltros de seguridad: 52146966',11,'assets/filesequipos/81.pdf','AC',7),(82,'Filtro de aceite de motor ',13,'2018-09-22 10:39:41','',11,'assets/filesequipos/82.pdf','AC',7),(83,'Filtros de combustible ',13,'2018-09-22 11:03:20','57294829 filtro secundario \n57886301 filtro primario ',12,'assets/filesequipos/83.pdf','AC',7),(84,'Filtros de aceite de compresor ',13,'2018-09-22 11:06:53','',12,'assets/filesequipos/84.pdf','AC',7),(85,'Filtro interior de cabina ',13,'2018-09-22 11:10:20','',12,'assets/filesequipos/85.pdf','AC',7),(86,'Filtro respiradero de tanque de combustible ',13,'2018-09-22 11:12:50','',12,'assets/filesequipos/86.pdf','AC',7),(87,'Filtro respiradero tanque de combustible ',13,'2018-09-22 11:15:43','',12,'assets/filesequipos/87.pdf','AC',7),(88,'Filtro respiradero de tanque hidr√°ulico ',13,'2018-09-22 11:17:54','',12,'assets/filesequipos/88.pdf','AC',7),(89,'Filtro separador ',13,'2018-09-22 11:28:47','57569758 ',11,'assets/filesequipos/89.pdf','AC',7),(90,'Regulador UL-88',13,'2018-09-22 11:35:43','',11,'assets/filesequipos/90.pdf','AC',7),(91,'Kit de reparacion UL-88',13,'2018-09-22 11:41:33','36037471 KIT DE REPARACI√ìN ',11,'assets/filesequipos/91.pdf','AC',7),(92,'FILTRO DE ACEITE MOTOR - CAT',16,'2018-09-22 12:01:39','',11,'assets/filesequipos/92.pdf','AC',7),(93,'Filtros colector de polvo ',13,'2018-09-22 12:02:01','',11,'assets/filesequipos/93.pdf','AC',7),(94,'Filtro de cabina exterior ',13,'2018-09-22 12:06:45','Items 11. ',11,'assets/filesequipos/94.pdf','AC',7),(95,'Filtro de Combustible Primario',16,'2018-09-22 12:07:54','Trampa de agua',11,'assets/filesequipos/95.pdf','AC',7),(96,'Filtro de cabina ',13,'2018-09-22 12:10:10','',11,'assets/filesequipos/96.pdf','AC',7),(97,'Filtro separador de compresor',13,'2018-09-22 12:16:13','',11,'assets/filesequipos/97.pdf','AC',7),(98,'Filtro hidraulico ',13,'2018-09-22 12:34:52','',11,'assets/filesequipos/98.pdf','AC',7),(99,'Filtros de retorno hidraulico',13,'2018-09-22 12:38:31','',11,'assets/filesequipos/99.pdf','AC',7),(100,'Filtro de compresor alta presion ',13,'2018-09-22 12:42:31','',12,'assets/filesequipos/100.pdf','AC',7),(101,'Filtro de refrigerante ',13,'2018-09-22 13:11:58','sin adjunto',12,'assets/filesequipos/101.pdf','AC',7),(102,'Separador de combustible CAT',13,'2018-09-22 13:15:40','sin adjunto ',11,'assets/filesequipos/102.pdf','AC',7),(103,'Bomba Principal',16,'2018-09-22 13:24:30','Caudal Variable',11,'assets/filesequipos/103.pdf','AC',7),(104,'Bomba Secundaria',16,'2018-09-22 13:25:46','Bomba Engranaje',11,'assets/filesequipos/104.pdf','AC',7),(105,'Motor Hidraulico de Traslacion',16,'2018-09-22 13:27:09','Motor variable',11,'assets/filesequipos/105.pdf','AC',7),(106,'Acople de goma',16,'2018-09-22 13:28:03','',12,'assets/filesequipos/106.pdf','AC',7),(107,'Guia de teflon cabezal',16,'2018-09-22 13:29:01','',12,'assets/filesequipos/107.pdf','AC',7),(108,'Cilindro Hidraulico',16,'2018-09-22 13:30:00','',12,'assets/filesequipos/108.pdf','AC',7),(109,'Filtro de aire secundario ',13,'2018-09-22 13:30:06','',11,'assets/filesequipos/109.pdf','AC',7),(110,'Motor HyD de colector de polvo',16,'2018-09-22 13:32:31','',11,'assets/filesequipos/110.pdf','AC',7),(111,'Cable de Avance',16,'2018-09-22 13:33:37','',12,'assets/filesequipos/111.pdf','AC',7),(112,'Cable de carro',16,'2018-09-22 13:34:30','',12,'assets/filesequipos/112.pdf','AC',7),(113,'Filtro de aire primario Cat',13,'2018-09-22 13:36:15','',11,'assets/filesequipos/113.pdf','AC',7),(114,'Filtro de aceite ',13,'2018-09-22 13:38:38','',4,'assets/filesequipos/114.pdf','AC',7),(115,'Cardan',13,'2018-09-22 16:12:22','',12,'assets/filesequipos/115.pdf','AC',7),(116,'Kit para reparacion de PTO',13,'2018-09-22 16:44:59','BEARING \n',11,'assets/filesequipos/116.pdf','AC',7),(117,'Bearing',13,'2018-09-22 17:07:18','item 10',11,'assets/filesequipos/117.pdf','AC',7),(118,'GEAR ',13,'2018-09-22 17:14:44','ITEMS 9 ',11,'assets/filesequipos/118.pdf','AC',7),(119,'Gear ',13,'2018-09-22 17:15:16','ITEMS 9 ',11,'assets/filesequipos/119.pdf','AC',7),(120,'Ring snap',13,'2018-09-22 17:20:11','items 17 para reparci√≥n de pto',11,'assets/filesequipos/120.pdf','AC',7),(121,'Ring retaining',14,'2018-09-22 17:23:07','items 18 ',11,'assets/filesequipos/121.pdf','AC',7),(122,'Shaft, imput ',13,'2018-09-22 17:29:04','items 7 para reparacion de pto ',12,'assets/filesequipos/122.pdf','AC',7),(123,'Adapter ',13,'2018-09-22 17:33:08','items 6 para reparacion de pto',11,'assets/filesequipos/123.pdf','AC',7),(124,'O¬¥ring ',13,'2018-09-22 17:44:17','items 12 para reparacion de pto ',11,'assets/filesequipos/124.pdf','AC',7),(125,'Seal Oil ',13,'2018-09-22 17:50:43','items 16 para reparaci√≥n de pto ',11,'assets/filesequipos/125.pdf','AC',7),(126,'PTO grupo completo ',13,'2018-09-22 17:52:41','PTO Completa ',11,'assets/filesequipos/126.pdf','AC',7),(127,'Bomba Principal ',13,'2018-09-22 18:03:14','Bomba principal Completa ',11,'assets/filesequipos/127.pdf','AC',7),(128,'Bomba doble',13,'2018-09-22 18:15:36','Sin adjunto, Bomba doble ',11,'assets/filesequipos/128.pdf','AC',7),(129,'Sello espejo eje de bomba principal ',13,'2018-09-22 18:21:15','Sello espejo. sin adjunto ',11,'assets/filesequipos/129.pdf','AC',7),(130,'Sello de  eje bomba principal ',13,'2018-09-22 18:26:08','items 5 ',11,'assets/filesequipos/130.pdf','AC',7),(131,'Cilindro Hidr√°ulico de pull down ',13,'2018-09-22 18:34:12','Cilindro Hidr√°ulico ',11,'assets/filesequipos/131.pdf','AC',7),(132,'Cilindro hidr√°ulico capota de polvo ',13,'2018-09-22 18:46:59','',12,'assets/filesequipos/132.pdf','AC',7),(133,'Valvula Diverter ',13,'2018-09-22 18:54:40','sin adjunto ',12,'assets/filesequipos/133.pdf','AC',7),(134,'Motor Hidr√°ulico bomba de agua ',13,'2018-09-22 19:12:15','',11,'assets/filesequipos/134.pdf','AC',7),(135,'Motor HCO Carrucel ',13,'2018-09-25 11:24:34','Item 36 ',11,'assets/filesequipos/135.pdf','AC',7),(136,'Motor HCO Fan Radiador ',13,'2018-09-25 11:39:41','Item 36 ',11,'assets/filesequipos/136.pdf','AC',7),(137,'Motor HCO Traslaci√≥n ',13,'2018-09-25 11:57:56','',12,'assets/filesequipos/137.pdf','AC',7),(138,'Motor HCO Rotaci√≥n ',13,'2018-09-25 12:02:03','Item 28 ',12,'assets/filesequipos/138.pdf','AC',7),(139,'Motor HCO Cable Winch ',13,'2018-09-25 12:06:09','Item 49 ',12,'assets/filesequipos/139.pdf','AC',7),(140,'Cables de Pull Down ',13,'2018-09-25 12:21:13','',12,'assets/filesequipos/140.pdf','AC',7),(141,'Cadenas De Holback ',13,'2018-09-25 12:26:54','Items 26 ',12,'assets/filesequipos/141.pdf','AC',7),(142,'Poleas de Cable de Pull Down  ',13,'2018-09-25 12:33:08','Item 5 ',11,'assets/filesequipos/142.pdf','AC',7),(143,'Sprocket deHoldback',13,'2018-09-25 12:37:08','Items 27 ',12,'assets/filesequipos/143.pdf','AC',7),(144,'Placa Porta Barras ',13,'2018-09-25 12:43:36','Items 6 ',12,'assets/filesequipos/144.pdf','AC',7),(145,'Guia de Barras ',13,'2018-09-25 12:50:59','Items 2 ',11,'assets/filesequipos/145.pdf','AC',7),(146,'Limit Switch ',13,'2018-09-25 12:55:23','Items 1 ',11,'assets/filesequipos/146.pdf','AC',7),(147,'Joystick Traslacion ',13,'2018-09-25 13:00:50','Items 26 ',12,'assets/filesequipos/147.pdf','AC',7),(148,'Joystick Rotaci√≥n ',13,'2018-09-25 13:04:52','Item 25 ',12,'assets/filesequipos/148.pdf','AC',7),(149,'Joystick de Avance ',13,'2018-09-25 13:13:52','Item 66 ',12,'assets/filesequipos/149.pdf','AC',7),(150,'Burlete de Puerta Cabina ',13,'2018-09-25 13:18:37','',12,'assets/filesequipos/150.pdf','AC',7),(151,'Butaca de Operador ',13,'2018-09-25 13:23:45','Items 103 ',12,'assets/filesequipos/151.pdf','AC',7),(152,'Bocina',13,'2018-09-25 13:27:33','Items 1',12,'assets/filesequipos/152.pdf','AC',7),(153,'Motor Limpia Parabrisas ',13,'2018-09-25 13:32:50','Items 147 ',11,'assets/filesequipos/153.pdf','AC',7),(154,'Escobillas 20\'\' ',13,'2018-09-25 13:37:16','items 152 ',12,'assets/filesequipos/154.pdf','AC',7),(155,'Escobillas 28\'\' ',13,'2018-09-25 13:40:26','Items 153 ',12,'assets/filesequipos/155.pdf','AC',7),(156,'Switch 2 Posiciones DR/PR ',13,'2018-09-25 13:47:57','Items 27 ',12,'assets/filesequipos/156.pdf','AC',7),(157,'Acelerador de Motor ',13,'2018-09-25 16:39:00','Items 06 ',12,'assets/filesequipos/157.pdf','AC',7),(158,'Bot√≥n Pulsador (Arranque) ',13,'2018-09-25 16:42:58','Items 15 ',12,'assets/filesequipos/158.pdf','AC',7),(159,'Compresor Completo ',13,'2018-09-25 16:45:45','',11,'assets/filesequipos/159.pdf','AC',7),(160,'Valvula de M√≠nima ',13,'2018-09-25 16:51:08','Items 6',12,'assets/filesequipos/160.pdf','AC',7),(161,'V√°lvula de Alivio de Seguridad Tanque ',13,'2018-09-25 16:56:41','Items 31 ',11,'assets/filesequipos/161.pdf','AC',7),(162,'Mangon ',13,'2018-09-25 17:00:14','Items 3',12,'assets/filesequipos/162.pdf','AC',7),(163,'Cable de Seguridad ',13,'2018-09-25 17:05:19','Items 8 ',12,'assets/filesequipos/163.pdf','AC',7),(164,'Mangon de Descarga ',13,'2018-09-25 17:08:44','Items 8 ',11,'assets/filesequipos/164.pdf','AC',7),(165,'Bomba de Lubrican Compresor ',13,'2018-09-25 17:13:01','Items 2 ',11,'assets/filesequipos/165.pdf','AC',7),(166,'Cable Positivo ',13,'2018-09-25 17:18:04','Items 3 ',11,'assets/filesequipos/166.pdf','AC',7),(167,'Cable de Bater√≠a ',13,'2018-09-25 17:21:50','Items 2 ',11,'assets/filesequipos/167.pdf','AC',7),(168,'Cable negativo  ',13,'2018-09-25 17:25:04','Items 05 ',12,'assets/filesequipos/168.pdf','AC',7),(169,'Cable Switch Arranque ',13,'2018-09-25 17:32:06','Items 11 ',12,'assets/filesequipos/169.pdf','AC',7),(170,'kit Filtros de Aire Primarios ',16,'2018-09-25 17:48:33','Items 2 ',11,'assets/filesequipos/170.pdf','AC',7),(171,'kit Filtros de Aire Primarios ',16,'2018-09-25 17:49:11','Items 2 ',11,'assets/filesequipos/171.pdf','AC',7),(172,'Filtro Respiradero ',16,'2018-09-25 17:56:58','sin adjunto ',12,'assets/filesequipos/172.pdf','AC',7),(173,'Acople de Goma Bombas ',16,'2018-09-25 19:31:27','Items 1 ',11,'assets/filesequipos/173.pdf','AC',7),(174,'Guias de Teflon Cabezal ',16,'2018-09-25 19:40:06','Items 2 ',12,'assets/filesequipos/174.pdf','AC',7),(175,'Motor HCO Colector de Polvo ',16,'2018-09-25 19:58:28','',12,'assets/filesequipos/175.pdf','AC',7),(176,'Bomba de Agua Dynaset ',16,'2018-09-25 20:14:30','',12,'assets/filesequipos/176.pdf','AC',7),(177,'Bulon de Zapata ',16,'2018-09-25 20:17:23','items 13',12,'assets/filesequipos/177.pdf','AC',7),(178,'Tuerca de Zapata',16,'2018-09-25 20:19:03','Items 14 ',12,'assets/filesequipos/178.pdf','AC',7),(179,'Acople de Goma Copresor ',16,'2018-09-25 20:22:44','Items 1 ',12,'assets/filesequipos/179.pdf','AC',7),(180,'V√°lvula Control de Presi√≥n de Aire ',16,'2018-09-25 20:31:58','Oil Stop: kit de reparacion:2911 0118 00',11,'assets/filesequipos/180.pdf','AC',7),(181,'Luces de Trabajo ',16,'2018-09-25 20:35:23','Items 30',11,'assets/filesequipos/181.pdf','AC',7),(182,'Escobillas ',16,'2018-09-25 20:45:15','',12,'assets/filesequipos/182.pdf','AC',7),(183,'Espejo',16,'2018-09-25 21:28:01','',12,'assets/filesequipos/183.pdf','AC',7),(184,'Forzador F.C',16,'2018-09-25 21:31:40','Items 3 ',11,'assets/filesequipos/184.pdf','AC',7),(185,'Sensor Indutivo  ',16,'2018-09-25 21:35:40','B118, B178',11,'assets/filesequipos/185.pdf','AC',7),(186,'Cabezal SH',16,'2018-09-25 21:37:32','Sin adjunto',12,'assets/filesequipos/186.pdf','AC',7),(187,'Bomba de Lubricacion  ',16,'2018-09-25 21:40:35','',12,'assets/filesequipos/187.pdf','AC',7),(188,'Bomba de Grasa de Barras ',16,'2018-09-25 21:42:18','',11,'assets/filesequipos/188.pdf','AC',7),(189,'Rele K11 ',16,'2018-09-25 21:44:48','',12,'assets/filesequipos/189.pdf','AC',7),(190,'Relee K5 ',16,'2018-09-25 21:46:06','',11,'assets/filesequipos/190.pdf','AC',7),(191,'Sensores B336A-B336B-B147',16,'2018-09-25 21:49:40','',11,'assets/filesequipos/191.pdf','AC',7),(192,'Sensor B360',16,'2018-09-25 21:55:43','',12,'assets/filesequipos/192.pdf','AC',7),(193,'Sensor B336',16,'2018-09-25 21:57:28','',11,'assets/filesequipos/193.pdf','AC',7),(194,'Sensor B337',16,'2018-09-25 21:58:42','',12,'assets/filesequipos/194.pdf','AC',7),(195,'Sensor B134 ',16,'2018-09-25 22:03:34','',12,'assets/filesequipos/195.pdf','AC',7),(196,'Sensor B262',16,'2018-09-25 22:05:49','',12,'assets/filesequipos/196.pdf','AC',7),(197,'Sensor B361',16,'2018-09-25 22:07:11','',12,'assets/filesequipos/197.pdf','AC',7),(198,'Sensor B143 ',16,'2018-09-25 22:09:29','',12,'assets/filesequipos/198.pdf','AC',7),(199,'Valvulas Y115 e Y116',16,'2018-09-25 22:13:04','',12,'assets/filesequipos/199.pdf','AC',7);
/*!40000 ALTER TABLE `componentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conffamily`
--

DROP TABLE IF EXISTS `conffamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conffamily` (
  `famId` int(11) NOT NULL AUTO_INCREMENT,
  `famName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conffamily`
--

LOCK TABLES `conffamily` WRITE;
/*!40000 ALTER TABLE `conffamily` DISABLE KEYS */;
INSERT INTO `conffamily` VALUES (1,'Bulones','AC',6),(2,'Bujes','AC',6),(3,'Filtros','AC',6),(4,'Diafragmas','AC',6),(5,'Ejes','AC',6),(6,'Valvulas','AC',6),(7,'Sellos','AC',6),(8,'Retenes','AC',6),(9,'Tuercas','AC',6),(10,'Trampas de Agua','AC',6),(11,'Arandelas','AC',6),(12,'Guias','AC',6),(13,'Pernos','AC',6),(14,'Cojinetes','AC',6),(15,'Juntas','AC',6),(16,'Cables','AC',6),(17,'Termostatos','AC',6),(19,'Compresores','AC',6),(20,'Corta Corriente','AC',6),(21,'Correas','AC',6),(22,'Cubiertas','AC',6),(23,'Radiadores','AC',6),(24,'Motor','AC',6),(25,'Crucetas','AC',6),(26,'Espejos','AC',6),(28,'Pasador','AC',0),(29,'Platos','AC',0),(30,'Seguros','AC',0),(31,'Tapas','AC',0),(32,'Alternadores','AC',0),(33,'Faros','AC',0),(34,'Bombines','AC',0),(35,'Llantas','AC',0);
/*!40000 ALTER TABLE `conffamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confsubfamily`
--

DROP TABLE IF EXISTS `confsubfamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confsubfamily` (
  `sfamId` int(11) NOT NULL AUTO_INCREMENT,
  `sfamName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `famId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sfamId`),
  KEY `famId` (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confsubfamily`
--

LOCK TABLES `confsubfamily` WRITE;
/*!40000 ALTER TABLE `confsubfamily` DISABLE KEYS */;
INSERT INTO `confsubfamily` VALUES (8,'Cocina',5),(9,'Heladera',5),(10,'Microondas',5),(11,'Fut√≥n',6),(12,'Alacena',6),(13,'Sillas',6),(14,'Taladro',7),(15,'Amoladora',7),(16,'LLaves',7),(17,'Afeitadora',8),(18,'Secador de Cabello',8),(19,'Masajeador',8);
/*!40000 ALTER TABLE `confsubfamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confzone`
--

DROP TABLE IF EXISTS `confzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confzone` (
  `zonaId` int(11) NOT NULL AUTO_INCREMENT,
  `zonaName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`zonaId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confzone`
--

LOCK TABLES `confzone` WRITE;
/*!40000 ALTER TABLE `confzone` DISABLE KEYS */;
INSERT INTO `confzone` VALUES (10,'Caucete'),(11,'Zonda'),(12,'Rivadavia'),(13,'Sarmiento'),(14,'Los Berros'),(15,'El Enc√≥n');
/*!40000 ALTER TABLE `confzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratistaquipo`
--

DROP TABLE IF EXISTS `contratistaquipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratistaquipo` (
  `id_equipo` int(1) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  PRIMARY KEY (`id_contratista`,`id_equipo`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratistaquipo`
--

LOCK TABLES `contratistaquipo` WRITE;
/*!40000 ALTER TABLE `contratistaquipo` DISABLE KEYS */;
INSERT INTO `contratistaquipo` VALUES (2,17),(4,17),(10,20);
/*!40000 ALTER TABLE `contratistaquipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratistas`
--

DROP TABLE IF EXISTS `contratistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratistas` (
  `id_contratista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `contradireccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `contramail` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contramail1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracelular1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracelular2` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contratelefono` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracontacto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `estado` char(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_contratista`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratistas`
--

LOCK TABLES `contratistas` WRITE;
/*!40000 ALTER TABLE `contratistas` DISABLE KEYS */;
INSERT INTO `contratistas` VALUES (17,'Clorox','Clorox','Clorox','Clorox','156565665','156565665','156565665','156565665','AC',6),(19,'Trazalog','Lib. Gral. S. Martin 1890','soporte@tazalog.com','soporte@tazalog.com','155555555','155555555','155555555','Soporte','AC',6),(20,'contratista emp 6','calle sin numero','contratista@gmail.com','','1555555','16666666','42555555','hugo','AC',2);
/*!40000 ALTER TABLE `contratistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criticidad`
--

DROP TABLE IF EXISTS `criticidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criticidad` (
  `id_criti` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_criti`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criticidad`
--

LOCK TABLES `criticidad` WRITE;
/*!40000 ALTER TABLE `criticidad` DISABLE KEYS */;
INSERT INTO `criticidad` VALUES (1,'Alta',6,'AC'),(2,'Media',6,'AC'),(3,'Baja',6,'AC'),(9,'muy alta',6,'AC'),(10,'666',6,'AN'),(11,'Alta',7,'AC'),(12,'Media',7,'AC'),(13,'Baja',7,'AC');
/*!40000 ALTER TABLE `criticidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deta_ordeninsumos`
--

DROP TABLE IF EXISTS `deta_ordeninsumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deta_ordeninsumos` (
  `id_detaordeninsumo` int(11) NOT NULL AUTO_INCREMENT,
  `id_ordeninsumo` int(11) DEFAULT NULL,
  `loteid` int(10) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_detaordeninsumo`),
  KEY `loteid` (`loteid`),
  KEY `id_ordeninsumo` (`id_ordeninsumo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta_ordeninsumos`
--

LOCK TABLES `deta_ordeninsumos` WRITE;
/*!40000 ALTER TABLE `deta_ordeninsumos` DISABLE KEYS */;
INSERT INTO `deta_ordeninsumos` VALUES (1,2,2,22,NULL,6),(2,5,1,1,NULL,6),(3,6,1,1,NULL,6),(4,6,2,6,NULL,6),(5,7,1,4,NULL,6),(6,7,1,5,NULL,6),(7,8,2,5,NULL,6),(8,8,4,10,NULL,6);
/*!40000 ALTER TABLE `deta_ordeninsumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deta_ordenservicio`
--

DROP TABLE IF EXISTS `deta_ordenservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deta_ordenservicio` (
  `id_detasercicio` int(11) NOT NULL AUTO_INCREMENT,
  `id_ordenservicio` int(11) NOT NULL,
  `id_tarea` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tiempo` varchar(100) CHARACTER SET latin1 NOT NULL,
  `observacion` text CHARACTER SET latin1,
  `monto` double NOT NULL,
  `id_componente` int(11) NOT NULL,
  `rh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detasercicio`),
  KEY `id_ordenservicio` (`id_ordenservicio`),
  KEY `id_componente` (`id_componente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta_ordenservicio`
--

LOCK TABLES `deta_ordenservicio` WRITE;
/*!40000 ALTER TABLE `deta_ordenservicio` DISABLE KEYS */;
INSERT INTO `deta_ordenservicio` VALUES (1,1,'tarea test 02','',NULL,0,0,NULL),(2,1,'tarea test 02 b','',NULL,0,0,NULL),(3,1,'tarea test 02 c','',NULL,0,0,NULL);
/*!40000 ALTER TABLE `deta_ordenservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deta_remito`
--

DROP TABLE IF EXISTS `deta_remito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deta_remito` (
  `detaremitoid` int(11) NOT NULL AUTO_INCREMENT,
  `id_remito` int(11) NOT NULL,
  `loteid` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`detaremitoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta_remito`
--

LOCK TABLES `deta_remito` WRITE;
/*!40000 ALTER TABLE `deta_remito` DISABLE KEYS */;
INSERT INTO `deta_remito` VALUES (1,1,1,100,0,6),(2,2,7,50,0,6),(3,2,8,25,0,6);
/*!40000 ALTER TABLE `deta_remito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `id_empresa` int(50) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `empcuit` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empdir` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emptelefono` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empemail` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliImagePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `localidadid` int(11) DEFAULT NULL,
  `provinciaid` int(11) DEFAULT NULL,
  `paisid` int(11) DEFAULT NULL,
  `gps` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empcelular` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonaId` int(11) DEFAULT NULL,
  `emlogo` blob,
  `clienteid` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (6,'DEMO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(7,'MINA CHINCHILLAS','20000000','2000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ˇ\ÿˇ\‡\0JFIF\0\0`\0`\0\0ˇ\€\0C\0		\n\n\r\n\n	\rˇ\€\0Cˇ¿\0\0éF\"\0ˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0	\nˇ\ƒ\0µ\0\0\0}\0!1AQa\"q2Åë°#B±¡R\—$3brÇ	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫\¬\√\ƒ\≈\∆\«\»\…\ \“\”\‘\’\÷\◊\ÿ\Ÿ\⁄\·\‚\„\‰\Â\Ê\Á\Ë\È\ÍÒÚÛÙıˆ˜¯˘˙ˇ\ƒ\0\0\0\0\0\0\0\0	\nˇ\ƒ\0µ\0\0w\0!1AQaq\"2ÅBë°±¡	#3Rbr\—\n$4\·%Ò\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÇÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫\¬\√\ƒ\≈\∆\«\»\…\ \“\”\‘\’\÷\◊\ÿ\Ÿ\⁄\‚\„\‰\Â\Ê\Á\Ë\È\ÍÚÛÙıˆ˜¯˘˙ˇ\⁄\0\0\0?\0˝¸Ø5\◊lœÉ˛\÷\Ô4\ÕO\‚∑\√m;R”ß{[ªKØYC=¨®\≈^7Fê2∫∞ ©\0Ç5\ÈU¸\€~\›Ú{_ø\Ïx÷øÙæz˜x{%ÜcRpúúyUÙ<˜7ûúgßwmO\ﬂo¯nèÇ_ÙXæˇ\0\·Yaˇ\0\«hˇ\0Ü\Ë¯%ˇ\0Eã\·_˛ñ¸vøõj+\Î?\‘JÛı˝\»˘üı“ø¸˚_{?§ü¯nèÇ_ÙXæˇ\0\·Yaˇ\0\«imˇ\0nÇ\◊S§Q|_¯]$≤0DDÒUÉ31\‡\0<\ﬁI5¸\⁄\“bó˙âC˛~øπ˝u≠ˇ\0>ó\ﬁ\œ\ÍtQ^ˇ\0\«˝§\·©?b\ﬂ¯Ü\‚\„\Ì\ZÕç∑ˆ>ÆKnµ\€b6vˇ\0jD\Àˇ\0mE{ı~sâ°*eF{≈µ˜}F¥j”çXm$ö˘ÖQXöåñeÜ6weD@K3\0rk\Àˇ\0\·∫>	\—b¯Wˇ\0Öeáˇ\0Ø5ˇ\0Çº˛\“cˆk˝á¸Sskq\‰k~*_¯GtÕß\·XJ\„∏)\Ã¿ˆ`Ω2+æªá¯efe^¨úU\Ï≠◊πÚ˘\Ôº\rX—ß&\’\›ˇ\0˙Iˇ\0Ü\Ë¯%ˇ\0Eã\·_˛ñ¸vè¯nèÇ_ÙXæˇ\0\·Yaˇ\0\«k˘∂¢Ωˇ\0ıá¸˝r<?ı“ø¸˚_{?§ü¯nèÇ_ÙXæˇ\0\·Yaˇ\0\«j˜Ü?kÔÑæ7Ò¶ì¢¸Q¯u´\Í∑Úml¨ºIgqqrÁ¢§i!fc\Ëk˘®Øwˇ\0Çb¯\ÿ\¬˚ ˛µÜ\'ÇhR£:™´˜S{.à\Ë\¬Ò}jµ°I\”Kô•ª\Í\ÏDµ\ ¸L¯\È\‡üÇ\ﬂbˇ\0Ñ\À\∆>üˆóôˆ?\ÌùZ\ﬁ\√\Ì^^\›˛_ö\ÎønÙ\Œ3çÎû¢∫™¸±ˇ\0ÉóÜ\·Jˇ\0\‹sˇ\0q\’Òô68\‹d0\“vRææâø\–˙º\€,&xà´µm=Z_©˜\ﬂ¸7G¡/˙,_\nˇ\0¨∞ˇ\0\„¥\√t|ˇ\0¢\≈Øˇ\0\n\À˛;_Õµ˜_\Í%˘˙˛\‰|g˙\È_˛}ØΩü\“O¸7G¡/˙,_\nˇ\0¨∞ˇ\0\„¥\√t|ˇ\0¢\≈Øˇ\0\n\À˛;_Õµ®î?\Á\Î˚êÆïˇ\0\Á\⁄˚\Ÿ˝$ˇ\0\√t|ˇ\0¢\≈Øˇ\0\n\À˛;G¸7G¡/˙,_\nˇ\0¨∞ˇ\0\„µ¸\€QG˙âC˛~øπ˙\È_˛}ØΩü\“O¸7G¡/˙,_\nˇ\0¨∞ˇ\0\„µn\√ˆ\«¯E™D$∂¯ß\‚\Ê6;CE\‚[\'˙dI_\Õ]&)>°“´˚ëQ\„Z∑÷í˚\Ÿ˝E¯k\∆\ZOå\Ï~’£\Íöv≠l\ﬂ:\Œ\Â\'è<ånBGP*\—\Õ.~Ò^©\‡Ω^-CF‘µ\r&˛ò\ÓlÆ	£>°–Ç?:˚èˆ!ˇ\0Ç\Í|@¯-ÆX\Ë\ﬂnnº{\·uäKπ∞⁄ΩÇgóYxÛÒúïîñ=út>^;Ç1\‚ÁÜöù∫Z\œ\Â´O=<a\Í\…Bº\\/\÷˜_=¨~\’QX_\r~%h<§¯ü\√Zå\Z∂á≠€≠’ù\‘$\Ìï±\‰AHH ÄAª_(∏∑+4}ri´†™ö\ÊΩe\·ù&\‚ˇ\0Rºµ\”\ÏmSÃö\Ê\ÊUä(W˚\Ã\Ã@\‹◊á˛ﬂø∑ˇ\0Öø`ØÖÒÍ∫≤j¯ãV\ﬂã¢\«&\…/ùqπŸ∞vDôõ®\0k\ÎˆÆ˝π>$~\Ÿ~*{ˇ\0\Zk\”\Õbí¥\—\ÌY°\”la9\∆q¸mπ\œv<W\—\‰º5à«Øj\ﬂ,;˜Ù_Æ«ÖõÒ\‰¯ß\Ÿtı}?3ˆ?\„G¸ªˆ}¯;q-¥~*πÒ}\Ï$áÉ√∂mxøQ;ÅÅˇ\0fC¸´\Á\ﬂˇ\0¡\…˛\Z≤πq†|+\◊5(A˘P\÷b±fu	¿w\ÓzW\‰∂(Øπ\√n]M{\È\À\’\€Ú±Òµ¯ª7\ÓZ>äˇ\0ù\œ\”iˇ\0\‡\Â}¶s\¬}#,v+k≤3\ÿ‰åü|•Iß¡ ö\ÃWà\◊	4\…\Ì\∆w§> í\'<qÜ00\„¯OıØ\ÃLRÅä\Ïˇ\0U≤ø˘ı¯\À¸\ŒOıõ2ˇ\0üøÑ\»˝j\œ¸ü·´ß_ÌØÖz\ÌÇ\„\Ê6Z\ÃWÑpzä.¯¸œß>\”\√˛ª˚>¸D∫Xoµ¯BG\·∂¥¶\nO°kvôW\Í\ƒ:\◊\·X•\≈rV\‡‹∂k\›N>è¸\ÓuQ\‚\‹|º‘ΩW˘X˛ü~|U\œ\≈ˇ\0.≠\·Ohæ$\”\Ì˚Vôy\‘A±ù•êêpyΩûk˘ì¯%Ò˜\∆_≥óçaÒÇ|E©xwUÑå\…k.u;%å\Â$Oˆ\\\Ì_µüK\Ô¯*ñì˚rho\·\ﬂEi†¸H\”!Ûg¥àëm´D1ô\Ì˜A¸—íJ\‰H\Œﬂå\Œ¯V∂\n.µ\'\œøu\Î\Â\Ê}nQƒîqíˆS\\≥\Ì\—˙?\”Û>¡¢ä+\Â§\n˛mønè˘=Øå_ˆ<k_˙_=I5¸\€~\›Ú{_ø\Ïx÷øÙæz˚\Œ˛=_E˘ü∆ü¿ß\Íˇ\0#\À(¢ä˝0¸(¢ä\0˝ˇ\0Éw?i?¯D˛3xõ\·ÖÙ\‡Y¯∂\◊˚WMV?vÚ\›Oòä=^Xˇ\0◊∏Ø\ÿ\n˛d~\0¸`\‘?gÔçûÒÆôÛ^¯gRÜ˝S8*0/ˇ\0e\”rf5˝,¯∆öw\ƒo\È \“\'ZVπg\r˝ú¿`K®ÒV˘_`=ñ*8ò≠&µı_-¯ü¶pé7\⁄\·]	o¯?¯7¸\rZ(Æs\‚˜\ƒ˝7\‡∑¬øxªXpögÜ¥\Èıèò)uâ\Ï\\Y±¥\‰Åﬁæ6ríåwg\’…§Æˆ? ø\‡\‡Ø\⁄K˛O\Ì;•|?≤ü~õ˛\Àu ´≠}r©#Ù\Î∂!\Á°2so|U¯è©|`¯ôØ¯ØXì\Õ\’<G®O©]0\'dÆ\\Å\Ë£8∞\0V\r~Òñ`ñ:˚+_^øâ¯∂eåx¨TÎæØONüÄQE\‹pÖ{ø¸˛Rü˛\∆?≠xE{ø¸˛Rü˛\∆?≠q\Ê?\Óµ\√/…ùπo˚\›/ÒGÛGÙK_ñ?r\Ô¸\—_˚é\Ó:øS´Ú\«˛]ˇ\0ö+ˇ\0q\œ˝\«W\‰º\'ˇ\0#Z_ˆ˜˛í\œ\”xü˛Eï\Ì\ﬂ˝)ñ4QE~\Ã~Jô•Ø\⁄¯\'ü¸#\‡_\∆Oÿª\·\Ôâ¸K˛\«U◊µù3œºª{\Î¥i\ﬂ\Õqí©(Q¿\0\È^Vmõ\“\ÀÈ™µìiªio^≠¶Uî\‘\«\ŒTÈ¥¨Ø©¯øE@ˇ\0\Á\œŸª˛â~õˇ\0É\Ô˛=G¸9Ûˆnˇ\0¢_¶ˇ\0\‡\∆˚ˇ\0èW\œˇ\0Ø8/\‰ü‹ø\Ã˜\‘\ÃWÛ\«Òˇ\0#˘¯ä˝\È¯áˇ\0J˝ùºq·π¨¨¸q·´∑E¶jó\"x®Y]\„o£!¸+Òèˆ\ƒ˝ô5O\ÿ˚ˆàÒÄuKÑæ}\"Uk[\ƒMã{m\"áä]π;IFó\'k8\Õ{O\·s	8Q∫í\÷œ∑ïõ<ú\”!\ƒ\‡b™Ti\≈\Èu˙ûeIéihØtÒ—ø¯7Ûˆ…ªg≈ªœÉ⁄Ω\—}\≈I-˛å$b~\…}\Zoí5\ÏXëâﬁâqÀú˛º\Íz•æã¶\‹^]\ÕΩ≠§M4\“\»pë\"ÇYâÙ\0¯WÛ?˚6|@∏¯Q˚B¯ƒ∂ÆcõC\◊lØA˘ÇNÖî\„±\0Ç=	Ø\Ë˛\n≠\\xˆ¯µuj˛\\\Î\·[¯\√˜P2=\«±Ø\Ã8ª-ä\Ã)\ \Z{]≠“ø\‚è“∏[)`g\Î\ÏˆÙµ\Ì˘üÑ∑\ÌU™˛\ÿˇ\0¥óà|i®I(±ûcm§Z≥∂(HÜ ;|Õåe\›\Œq^Gä1\Õ˙]\Z0•MR¶¨í≤?:ØZuj:µ\€waZ˛¯}Ø|RÒEæâ\·≠T\◊ıã≤D6Z}´\‹\œ&9$\"p$ÙìY˙\·ˇ\0\‚ü¬¶ÒÿÉ\Ï_∞™øl∑\Ì?ŸæT^N\Œ˛_ù\Án\«Òm\œ◊üúf/Öñ!Gô´i\Î\ﬂ\»\Ó\ 2ıçƒ™ó*ßc\„ˇ\0¡ˇ\0h\ﬂ\ÿGr\ﬁ\nµ\“\"ïw \‘u{X§«∫	\‘˚0è¶j¯˜˛¡˚FxNö\Ìºu{xyc•\ÍV\◊Ré\—	<\∆ˇ\0Ä©<W\Ô©<—∂ø>\\qé\Êø,m\⁄\œ¸œª|Å\Âµ\Â\Îu˛GÚ\„\‚?\r\Í^\◊nÙΩ_OΩ“µ;W6wê<€∏ÍÆå+{ö•_ªU\œ¯&,ü∑oÜÙ=K\¬M\·\›«ö=»Öı\rI§Ü+\À≠∫x£v%_k&TÅónØå¥ü¯7#\‚º\¬?∑x\€\·\Ì∂s\Êy\ﬁM∑\”†LˆÙØØ¿Ò^µR¥\‘%\’+å\·åe:ŒùÛ«£\—~ªüûï\“|¯≥≠|	¯ß†¯\√√∑-i¨¯vÚ;\ÀY;ßîa\›r¨:bZ˝\—ˇ\0\‡\€?Œ´˝°ÒK@µ%\¬\ﬂHö|\'ç\“&O^8˙\◊Qaˇ\0\”\ŸFçˆØåWS6~SÖ\÷ ænõ?•iWä2ñú\'R\È˘I˛ÑR\·º\—IJ4\Ï÷∑º\Ã˝¯)ÒZ\√\„è\¬¯\«K∞Ò6ôo©Dõ\√Ñ±á1í?âI*}\‘\—X≤W\ÏÒ\Ïß˚=¯{\·˝æØuØ[xqfé+€àÑR ≤O$†Å∑\Ã\⁄1\ŸE¯˛!SUd©;\∆\Óﬁó\–˝RãìÑ]EiY_◊©\È¸\€~\›Ú{_ø\Ïx÷øÙæz˛ík˘∂˝∫?\‰ˆæ1\ÿÒ≠\È|ıˆ\‹	¸zæãÛ>7ç?ÅO\’˛GñQE˙a˘\·wG\Ì\Êø¸ñê¥À¶\€ÀÄΩR ÍÖ±\ﬂ\◊>É\'†5Jæ´ˇ\0Ç6¸;”æ/~ÿìxWVC&ô\‚?\Í˙m\–\ÊÚ\Êµdb3\‹\»=àÛó\≈oá:è¡Ôâæ ¶Øó©¯sQüMπ \"ê°#\ÿ\„ ˜\Z\‰Ü*2\ƒK\’$˛N\ÎÙ¸N òG41+i6æk¸ˇ\0C˚iˇ\0\r˝§ø\·n˛»ì¯:ˆ3W¯q{ˆ0\ﬁk˜Kn\ƒ\Áú0ù,K_âuıü¸oˆíˇ\0Ü{˝∏ÙK©¸≠\«kˇ\0\Â\‡\'\ÂY%e6œéô¨kì\—dzÚ¯õı¨‚óΩy|ø\‡\\Ù∏sıltnÙó∫˛{~6?zkÛ\„˛˝§ˇ\0\·^~\Œ\Z/√ªÄöèè/<˚\≈W˘ñ\∆’ï\»#®\ﬂ1á∏ç\«<\„Ù<\◊Û\Ìˇ\0g˝§\«\Ì5˚px≥P∂π\Z\'á\\xJ(€ê¡n\Ã‘é™Û4\Œ£ä¸˚ÑpX«™í^\Ï=\ÔüO\«_ë˜<Oç˙æ\nQ[\œOÛ¸?3\Ê\ÃQöZÙ?\Ÿ/\‡E\◊\Ì7˚Ix7¿ñ¢@<C©G\À\∆2\–[/\œq(\ÏB≤7¸ø]´R4\‡\ÍOdÆ˝˘e*r©5N∑eÛ8ç\√◊æ\‘\÷˛∂∏h!π\„Àö$ö6ˇ\0Å#©¸jù}	ˇ\0V—≠|=ˇ\0¯èß\ÿ¡≠ïÖ›ΩΩº1å$1•ú\n™†\0_=\÷xZ\ﬁ⁄Ñ*\⁄\‹\…?Ω\\\”EQØ:KÏ∂æ\Á`Øwˇ\0Çb\ @~ˇ\0\ÿ¡ıØØwˇ\0Çb\ @~ˇ\0\ÿ¡ı¨≥˜Zø\·ó\‰\Õr\ﬂ˜∫_\‚è\ÊèËñø,\‡\Â\ﬂ˘¢ø˜ˇ\0\‹u~ßW\Âè¸ªˇ\04W˛\„ü˚éØ\…xO˛F¥ø\Ì\Ô˝%ü¶Ò?¸ã*ˇ\0€ø˙R?,h¢ä˝ò¸î+˙ˇ\0ÇS¯◊è¬Ø˚ˇ\0\Ìi+˘\Á´\÷\ﬁ&‘¨†X°\‘o¢çwU_†º<˚&yç\“SÂ≥æ\◊\Ë\◊t{yn∞%Q«ö\Í\€\ÿ˛£®Ø\Â\”˛_˛Ç∫ó˛ø¯\—ˇ\0	éØˇ\0A]Kˇ\0_¸k\Â\‘)\œˇ\0¸óˇ\0∂>ó˝uá¸˙¸˙n¯ÅÒ3√ø\n<;6Ø\‚msJ\–4ªufí\Í˛\È-\‚\0ûXåúv\◊\‡¸ˆ¶“øk\ﬂ\€\ƒ>*\–?ám¢áK\“\Êx\Ãos+è8Ç‹ª(`VP@#¿ØıçRa%\’\ƒ˜2¥4≤`=2{r:Énk\ﬂ»∏fû]Q\÷s\ÊìV\⁄\…~,Ò3û#û:ö£r\∆˜\ﬁ\Ì˛Z(¢æú˘££¯7\·{ü|^¶âdç%Ê±¨ZY@®ªôûY\—\‹\Âá˝%|~¯dü\Z~x\«\¬bìË∑öZºÉ+M∆Ø\ﬂ\Ó≥û†ÄkÒ\œ˛Q˚#]¸o˝©\·Ò\Â˝´ˇ\0\¬/‰ãø5ó\‰π\‘H∑à\Â2f8\Œ<¥\Ôä˝∫\≈~c∆∏\‰Òt\ÈSz\”WÙn\œÙ_y˙G\‡\‹pì©5§\ﬂ\‡¥ˇ\03˘pÒá\Ô|%\‚˝\'R∂ñ\œQ\”.d¥∫∑ïvº\∆\≈v!Å{U:˝kˇ\0Ç\≈ˇ\0¡%u_ä˛$º¯ØªMk˝n\ÂCk˙∫˛˙˘îc\ÌP/ÒIÄ\∆9|nb¿˛L^ZMß^Koq∞Oò\‰äE*Ò∞8*¿Ú Ç\r}\ﬁSöQ\«\–UiΩzÆ©ˇ\0[w>+4\À*\‡´:sZt}\◊˘˜#≠?¯\◊Y¯w\‚;]c@’µ-V≤mˆ˜∂/o<\'\’]a¯\ZÃ¢Ω&ìVgõ8ªßf}ôS˛πÒ\„\·E¥∫≠˛á\„ã(@@5´,\\ˇ\0Æ–òŸõ˝©7ûy\Õ}?≥˛F\Õˇ\0ïç~\ÎzY\\h∑Ò_>¢9D%G∂ˆ˙ö¸î£\·\‚xk-Ø¨©$¸¥¸¥=¨?ftU.ºı¸^øâ˚\Á\√˛?˚<|Mé5>7>∫r\Ÿı´≠J˝d\⁄\—\„ıÙGÄ~,¯W‚≠ì\\¯_ƒæÒ%≤ÄL∫V£\r\‚\0ze£f¸\¬b¨iZΩﬁÖ®Ewcuqeu	\›\–Hcí3\ÍExXé\√\ÀZ}lˇ\0\»ˆ®q•e¸ji˙6ø\Ã˛§˙ö\\W\‡/\Ï˘ˇ\0ã¯Ò\Êˇ\0\·.õ\∆\ZLL\ÿxê\„¿úë:Ò\–	08\‡ÙØ\’?¯\'\ﬂ¸k¿ˇ\0∑LcE7Öºyo	ñm\ÊP\Èt™>w∂ó\ÃQ‘©¿\…¡\0µ|¶i\√\Ã]Fî†∫Æû´\–˙lªàpò\…*q|≤\Ïˇ\0Nü©ı8¢ì>ú\—_8{\¬\◊Ûm˚t\…\Ì|bˇ\0±\„Zˇ\0\“˘\Î˙IØ\Ê\€ˆ\Ëˇ\0ì\⁄¯\≈ˇ\0c∆µˇ\0•Û\◊\ﬁp\'Ò\Í˙/\Ã¯û4˛?W˘YEW\Èá\Áá\Ÿ_A±ˇ\0\—\Ï®\Ëö\Î?\‡\‡o\Ÿ\ƒ¸2˝™4\ﬂY[àÙœàV!¶ePo≠ÇG/Nõ¢06O,Kûpkîˇ\0Ç\rˇ\0\ C¥_˚\Í˙&øHø\‡≥≥à˝°?aèMkn&÷º\√\ƒv%T+\n∞∏L\„804ß´\"zW\¬\Ê8\Ô™Ò9=•Ûoı±˜\÷r)¡-SmzØÛWG\‡ïIgw.üy\ƒ<3¿\‚H\‰F\⁄—∞9–É\Œj,ÛK_t|:g\Óœèˇ\0\‡£6Òˇ\0¡%ˇ\0\·r[]Gàµçi∂\Îhµó&\ŸˆÅ\”ÀîI.8\ Gë\‘W\·;±ë\À1,\ÃrI9$\◊]wÒ\œ\ƒWm>=\ÎYkr\Î\Èm\…\Õ\”¬ê\Á\ËN\0\Ô#ûı\»Wãìd¿*ä?jM¸∫/ë\Ìg9¥±Œõf*˛ΩXW\Èá¸°˚9\rk«æ1¯•}m∫\r°iNÀëˆâq%√©\Ï\…ç~ó\r_ô˘Ø\Ëü˛	µ˚8\Ÿgˆ4_Ö\Ó-˛œ¨Kh5=\\\√˝≤\„˜≤#s\÷0V/§Bº\ﬁ1\«{≤ã÷£∑\Àw˛_3ªÑ^\€\Ì^\–W˘Ω\Í˛G\„/¸ø˛R3ÒK˛\¬0ˇ\0\È,5Ûï}ˇ\0oˇ\0îå¸Rˇ\0∞å?˙K\r|\Â^ˆW˛\ÂG¸1¸ë\‚\ÊüÔµø\≈/ÕÖ{ø¸˛Rü˛\∆?≠xE{ø¸˛Rü˛\∆?≠Vc˛\ÎW¸2¸ò≤\ﬂ˜∫_\‚è\ÊèËñø,\‡\Â\ﬂ˘¢ø˜ˇ\0\‹u~ßW\Âè¸ªˇ\04W˛\„ü˚éØ\…xO˛F¥ø\Ì\Ô˝%ü¶Ò?¸ã*ˇ\0€ø˙R?,h¢ä˝ò¸î(\Õ˙ª˚ˇ\0¡˛~\—?≤Ç<mØ^¯\÷-c\ƒZ\⁄nñ\”QÜ8˘éø*¥,@¬é§◊õô\Ê¥0\’J˜≥v\—\\Ùr‹Æ∂:nmtØ©˘EIûkˆ\”˛!\Î¯ˇ\0Aà_¯5Éˇ\0ë\ÎÚ\œˆ¸˝ê\Ôˇ\0bü\⁄_Zl\∆\‚} ü∂Ëóì∫ˆ\∆B|∂$\0©\r\‡æ6¿¡ÕñÒQ“†\ﬂ2W\’X\È\ÃrV\nö´V\Õ^\⁄?\ÃÒä(¢Ω≥\≈-\ËZˇ\0ä5H¨t\À+ΩFˆsà\Ì\Ìai•ê˙*®$˛ˆG\Ïwˇ\0B¯´˚Akv◊æ3∞ª¯o\·E`\”À©√≥S∏^\È´a’ø⁄î(\»\rçµÚ˜\ÏÛÒ\◊]˝ö>3h7\‹˛N´†],\Ë¨\ƒGrù$ÜLJHÖëá£ı˝\Z~\Œ\ﬂ¥\⁄o\‡∆Å\„è\r\œ\Ê\Èzı∞ôP∞2[H>Y!|ttp\ }◊é1_%\≈9æ3˝^+ñZsogÈ∑¶˝O™·¨´	åîùf‹£ˆz5˘˙¸Ö˝üg\ﬂ\n˛\Ã?\n¥\œ¯;MM;F\”åù\”\\\»~¸“ø\‰s\…c\Ï\0\0\0;Z+;TÒÜì°‹à/uM:\Œb°ºπ\ÓR6 ˜¡9\≈~Q9N§‹§\Ó\ﬁ\ÁÈêåc´$h\‚ºCˆúˇ\0Çt¸ ˝Æ\Z[üxF—µ©X∞cg®pHòÛ08P\‡v\Ë~\–>∑ï\„xE2UïµãpTé†ç¸\Z•˚R¸2“¶\›|E%¥å7ó_¥F#\◊Nú\Z\ﬂı™3S£\Õ\›]Vç\Zë‰™ì]ùèŒøåˇ\0m\ŸÛ¶ü\·\Á\ƒuí|´YÚ£∂\Îà:˛è\È_2¸Nˇ\0Ç%˛\—\r\⁄gá\¬6~&µÑú\‹h∫î3á˜X‹§\«˛˝\◊\Ì1˝Æ˛â\"CÒ?\·\Ê˘§X£_¯H\ÏÛ#±¬®g$û\0\Ík\–Ú+\Ë\ËÒniá≤´iâ[Ú±\‡\÷·å∫≥nó¸/¸\Ó2\ﬂˇ\0g_à§eÒWÇ|W\·–†∂\ÌGJû\Ÿ\·ô@#\‹W∫ø©\‹\nÚ\Ôâ±7\¬å0Hû#¯m\‡\›I\‰97Kä+ëû∏ô\»3\Ï\‹◊±á\„≈µz?s˝˘ûE~\n\ÎFØﬁøU˛GÛgöZ˝Nˇ\0Çóˇ\0¡º#\Ô\‡\ÊøÒ\·C\Í\ZKxj\⁄MGQ\–n.\Z\Ê\⁄KX\∆\È^	ôë9\Œ)\∆\“,k\Ïr\Ã\”è•\Ìh?&û\Ë˘<\«,≠Ç©\Ï\ÎuŸ≠òõkO¡\ﬁ0\’>xØO\◊4K˚ù/W\“n\Í\Œ\Ó\›\ Ko*´)ı≥hØA§’ô¿§”∫\‹˛çø`?⁄ö\€ˆX«çä\≈´q	¥\’\·åaaΩà\Ïó≤±E\·dQú\Êä˘˛\røÒ%\Õ\◊\Ïˇ\0ÒJv&\“\«\ƒ]D§˝◊ñ\›Uˇ\0HRä¸3:\¬G\ré´F\'ß£\◊ı?h ±\ƒa)÷û\Ìk\Í~èWÛm˚t\…\Ì|bˇ\0±\„Zˇ\0\“˘\Î˙IØ\Ê\€ˆ\Ëˇ\0ì\⁄¯\≈ˇ\0c∆µˇ\0•Û\◊\‘p\'Ò\Í˙/\Ã˘û4˛?W˘YEW\Èá\Áá\ŸAø˘Hvãˇ\0`}Cˇ\0D\◊\Ó]˝Ñ\Z•åˆ\◊1G=Ω\Ãm±»°ñDaÇ§wbø\r?\‡ÉÚê\Ì˛¿˙á˛âØ\›\Z¸üçø\‰`ø¬ø6~°\¬?\ÓˆÛ˝\Êøˆ\Ã¯?\ÏΩ˚Px\”¿“´àt=I\÷Õü¨∂íb[w\Íy0∫\œ#µyù~ûˇ\0¡∆ü≥ê±ÒÇ~*\ÿ\€\‚;Ùo\ÍŒ™\0¶È≠ò˙≥!ùI\Ï\"Aûï˘Ö_¢d∏\Ô≠\‡©\◊{µØ™—üú‡æ´åù%µ\ÓΩ´¸ÉQEzáò}ˇ\0π˝ú\«\Ì9˚m¯3Bπ∑˚Fè¶\‹ˇ\0mj\ FS\Ï∂\ƒHQøŸíO.#ˇ\0]k˙\Z\⁄+Ûw˛\r\÷˝úœÜ>x≥\‚uıæ€Ø\›\r\'Lvins+/bØ3m>ˆﬂü\È~E\∆ˇ\0¨c\›8\Ìoü_Ú˘™∂\ÿ`î\ﬁÛ\◊\Â\”\◊\Ê>Vˇ\0˘H\œ\≈/˚\√ˇ\0§∞\◊\ŒUÙo¸ø˛R3ÒK˛\¬0ˇ\0\È,5Ûï~üïˇ\0πQˇ\0$~qöæ\÷ˇ\0ø6\Óˇ\0LO˘H\¬˚ ˛µ\·\Óˇ\0LO˘H\¬˚ ˛µYè˚≠_\ÀÚb\À\ﬁ\Èä?ö?¢Z¸±ˇ\0Éó\Êäˇ\0\‹sˇ\0q\’˙ù_ñ?r\Ô¸\—_˚é\Ó:ø%\·?˘\Z\“ˇ\0∑øÙñ~õ\ƒˇ\0Ú,´ˇ\0nˇ\0\ÈH¸±¢ä+ˆcÚPØ\Ëg˛	Mˇ\0(Ò¯Uˇ\0`˝≠%<\’˝ˇ\0¡)ø\Â?\nø\Ïˇ\0µ§Øâ\„Ø˜:\‚˝ˆ\\˛ÒS¸?©Ù|{ˇ\0ô˝âø·´øf9ı≠\Z\œ\ŒÒßÄVMKOÆdΩ∂¿7\√íUC®‰óçTcyØ∞©1_õ\‡±u0µ\„^ûÒ\“˘ü}ä\√CFTjm%c˘c\œµı\œ¸Gˆ&ˇ\0ÜJ˝ß\Ó5M\—`Wé\⁄MOKÆ#≥ü \‹ZÄ8É(%@3¥\„\‰j˝\◊ãßâ°\ZÙ∂íø¸ñ\«\„\Ã,’•B¶Ò\”˘â∂æ˚ˇ\0Ç~›ø£>2?\√\ﬁØé\Ói\“J\Áfù©ëµ1\ÿ,\‡,g˝µã†\‹k\‡Zt2Ω¥\…$n\—\…¨ßH\‰{\Zå\√Oáñ¶\œ}»ºø<%x◊ß\”Ò]Q˝Mö¸}ˇ\0Éé~œ£|~7ç∂:ˆà˙S\»9{Yô\Œ{ÇR\Â\0ıq\–\◊\€?IO€°?mŸ∫’ÆñO¯<Gß\Îä\«\Á∫syˇ\0mU[w˝4I8muøR\ÿ\ﬁ\€kˆ`’º-ëà¨XjZ\rƒ∏+∏¡\¬1\Ïí)h\…\Ë7Ü¡\⁄~MïUñUö®\‚4≥\Â~èØ¶\œ\–˝C2•\À.nÜº\ \Î\’t˝\Á{∏≠xKTä/ÙMj\¬\ÎK’¥π\ﬁ\⁄\Ó\“\Ê3\÷Ú)\√#)\‰k>ødM5t~I(¥\Ï˜\'h$WFdt;ïî\‡É\Í+ˆk˛	˜ˇ\0¡G\≈_i~¯Ø©¡\·YBñ\Ô™›ùön∞T\0%2˝\ÿ$8%É\ÌLÚ≠\Œ\≈¸d£\Â\Ê\Ÿ=¬öÖm\÷\ÕnèO+Õ´\‡f\ÁKT˜OfQÒ∂ç\„Ω-o¥=[L\÷lúen,ní\‚&˙2*÷Ø¨\⁄h\Zl◊ó˜V\÷Vñ\„t≥\œ\"\«c8\…f8\Î_Àç•\‹\÷4\À©ùØe\»\«{\ZìP\’\Óımüj∫ππÚÛ∑Õêæ\‹ı\∆ztï|ã\‡%Õ•}?\√ˇ\0\€R∏\Ÿ[Z:ˇ\0ã˛˚ˇ\0lˇ\0Ç∞x√øºI\€¿\Z÷ü\‚\œxÆ\“]*˙\ÎOïn,tªYWd˘ïríJ\»Y°;K\ƒ\nﬂéTò•ØØ\ rö9}eK[\Í\€\Íœï\ÕsZ∏\Íæ÷¢µ¥It\n(Øf˝Öc˛\‹¨|+§$ñ\⁄TnuΩOnSL¥?<ïE˛&=î1ı\Î¬ç7V£¥V≠ú4(NµEJöª{™@?Ñ3¸<˝à%\◊n\‡1O\„]n\„QÑ∑≠£T∑N=7\≈)°álQ_gx¡:g\√_\È>\—mR\«H\–\Ï‚∞≤∑Oª1†D_¡@\Êä¸\'1≈ºV&xáˆù˛]?ˆúa†æ\ H’Ø\Ê\€ˆ\Ë?Òõø\Ïx÷øÙæz˛ík\\üÜ,†∫\‘u-3AÜ$\›5\≈\ÕÕºJ´›ù›á§ì^ü\ÁK.©9∏ss+oo—û~uìˇ\0hB0\Á\Â\Âw\⁄ˇ\0™?ò*+˙Ò\Ìì˚4¯fèQÒ\œ¬±\"}‰∂∏µªu\Á+b∑QY\⁄\'\Ì\È˚.¯Ç\„ É\«_\r#lÅõïé\Ÿy8˚\“\"èØ<w\≈}í\‚\‹C\\\À	+|ˇ\0˘\Â\nPN\œæ\Âˇ\0\…ó\ﬂA≥è¯(vãˇ\0`}Cˇ\0D\◊\Óïq<g\Á«≥5◊Çu_\ÎRDõöm\Ê\÷\Âë-	8ä\Ì≥_ü\Êoâˆ\ŒñIY¸¸ós\Ï2lΩ`˛\≈KõV\ÔkoÛgãˇ\0¡Bˇ\0ga˚R~\«\ﬁ6å0y⁄úˆ&˜K\nªõ\Ìê6_B\Ïõ≥ö˛sLnUÅVSÇP}+˙õ\Œkæxyÿì†\ËƒìíMîG?¯\Ìwd<JÚ\Ír•(s&ÓµµªÙ~Gw\√Ò\«\Œ5˘ZV\⁄˜\Ì\’m©¸æU\œ\r\Ëû.Ò\rÜïß@˜7˙ù\Ãvñ–†\ÀK,å{ñ WÙ\Ìˇ\0\n\ﬂ√øÙ\0\—/˛&ümˇ\0A≤πéhtM&)¢`\Ë\Èg\Z≤092=\Î\›|{iGˇ\0&ˇ\0Äx´Çu÷∑˛Kˇ\0\€\Á\Ï\—N\Àˆq¯\·X\⁄\riëYºà0.&3K€óîªû:ΩwTbêö¸Ú•INnswoV}\‘ £\Ïè\Á\√˛\n\ﬁ\„cˇ\0\Ï#˛í\√_9\◊ı\‡}Tª{ã≠Kπû^^Im#ws\ÓH\…ˇ\0\ÎT_≠¸;ˇ\0@\rˇ\0\0bˇ\0\‚k\Ô0ºm\Z4!G\ÿﬂï%ÒvV\Ï|f+É˝µi\÷ˆ\÷\Êm¸=\›˚ü\À\Ì{∑¸ˇ\0\∆¿~ˇ\0\ÿ¡ıØ\Ë3˛øá\Ë¢ˇ\0\‡_¸MKg\‡MN∫é{}J∑û#π$é\“4t>†ÅëUâ\„à’•*^\∆\‹…Øã∫ÙÉ˝ïhUˆ\◊\Âi¸=ùˇ\0ò’Ø\À¯9tÛW˛\„ü˚éØ\‘\‚pjñØ\·\Õ;\ƒ&/∑\ÿY_y9Ú˛\—À≥8\Œ7å\‡~UÚF=`±pƒ∏Ûr\ﬂM∑M~ß\”\ÊxÆa•áΩπ≠≠Ø≥OÀ±¸∏\—_\‘¸+èˇ\0\–Eˇ\0¿ø¯ö_¯V˛ˇ\0†ãˇ\0Ä1Ò5ˆø\Î\Ï\Á\«˛Mˇ\0\0˘/ı%ˇ\0\œ\Ô¸óˇ\0∂?ó\⁄˛Ü?\‡î\«˛5\„´˛¿ˇ\0˚ZJˆü¯W\œ¸Ä4_¸ãˇ\0â≠k+4\€TÇ\ﬁ≠\‡àmH\„PàÉ\–¿Ø>\‚Uò—ç%Oñ\Œ˚ﬂ£]ë\Ï\‰º?˝üRUNk´mo’í\—HN)k\ÂO£<7˛\n˚ \Ÿ˛\⁄ﬂ≥∑\·\"∞¶ªnø\⁄\Z\r‘ÉfæåÄû\À -p≤Ç@Ø\Á{\\\—o<5≠\ﬁi∫Ö¥\÷w˙|\Ômso*ïí	Qä∫0\ÏCı˝Iu¨´øhW˜RO>ã§\Õ4¨Y\‰í\“6g\'©$åì_SêÒ4Ú\Ír£(ÛEÍµµü^ès\ÁsÆÜ>q®•\À%£\“˜_z?óö+˙Çˇ\0Öq\·\”ˇ\00\rˇ\0\0bˇ\0\‚hˇ\0Öo\·\ﬂ˙\0hø¯ˇ\0^˜˙˚˘Òˇ\0ì¿<_ı%ˇ\0\œ\Ô¸óˇ\0∂?û/\ÿ+ˆæ\‘ˇ\0b\⁄?FÒçòö\„K\'\Ïz›ä7¸Xπb\„¶ı¿t\œ\—s¡ ˇ\0Dû\rÒ~ôÒ\¬ZfΩ¢\ﬁ√®\È\ZÕ¨w∂WQc∏ÜEé=äêy\Ê´ˇ\0¬∑\È9˛¡\—\n/˛&π\œ~\—\ﬂæFl¸C\„x[\Ï\√\“ÛU∂µëx\Œ’à∞b}Ä\Õ|\ﬁwöC4©“§\„5£≥Ω\◊\›\–˙£-ñ]NPù^hÓÆ≠o\≈\Óx_¸O˛	?\·€ñ\ÿ\ÎñSE\·OàÒlèVä\0\–\Í*;§/Å¿ê\Í1˜îØ\»/\⁄c˛	\›Ò{ˆNº∏>+Ö˚i01¨\È\»o4\Ÿ8o5…ú	7+ˆæ\Ô˛\nü˚=X\‹<OÒ[\¬\Â£8&7íE?FT ˛∫\Ô˛€ü~#Œ∞\Ëü<p\Ì±-\”[∑Y\ÿÒ\“6`\‰r9»Æ‹≥:\Õ2¯(NõîFö∑£∑˘úôéOó\„ß\œ®\ÕıMk\Í∫˛˛msIö˛ê~\'˛\¬>5K%«àæ\Zx?Pπ∏\ÀIyûñ˜2Áπö ≤˚ÍºÉ\ƒˇ\0C_\Ÿ\«\ƒ.\Ìo\·SG.1˛ÖÆ]êI\‹≤8∂:`p}9¡µ˚\»I?ì˝W\‰|ı^ƒß˚π≈Ø;Ø—üÉ‘ôØ\‹_¯pO\Ïˇ\0ˇ\0>\ﬁ0ˇ\0¡\œˇ\0aVt\ﬂ¯ ß\Ïıc34∫Wâ\ÔTåõZê˜ü\Ã\◊G˙\Îóvó‹ø\Ã\«˝N\«4~˜˛G\·éqZû´\„}j7E\”5\rcQ∏8ä\÷\ \›\Ó\'î˙* ,_ø\ﬁˇ\0ÇF~\Œ~ô$¥¯]£\‹2ˇ\0ß\›]_©>\Î<Æ\Â^\„\‡/Ö~¯Wß5üÖ¸9†¯n—±ò4Ω>+8\Œ:|±™é+Üø\–K˜4õ~m/\ \Á]™\ﬂ\Ô™%\Ëõ¸\Ï~3~»øB_ä?Ø≠5!¯s\·¶!\›nîI™\‹\'uH3˚¢yî©^ª•~ª~\Õ?≤\ÔÇˇ\0düÜñ˛FíönüO+ù˜7Ú\‡4\“uw8ˆ\0p°@\0z)7W\∆\Êπˆ/\ÌU\⁄=ñ\ﬂ~g\÷\Âπ6ørΩ\Ó\Ô¯!h¢äÒOTÛ/\⁄ˇ\0ˆ¢\—?cøÄ\Z\Ôéı\≈7\Èà#≥≥W	&£tˇ\0,P)\Áõí\ÿ;UY∞v\‚ø?jü\€k\‚/\Ìâ\„çO\∆~ ªπ≥iK\⁄\ÈH\—i\⁄z\‰\ÌX\·n@\„{e\€±Ø\”\ﬂ¯8\ \«P∏˝íº4	3ixÆ3u∞¸à\∆\“\‰FX\ﬂ`Äúw¸i\≈~£¡y}Ö˙\€Wõm_≤]˘\◊c\Î}aaS¥RO\÷˝\…l¨f‘Æíxd∏öCÖé4.\ÕﬂÄ95g]æß\·y\÷-ONø”•~U.†xYá∞`3\‘~u˜7¸£˛\n´ˆ5≥Ò&ï\„\Õ.\ÎN\‘u\€ƒö[Yõ£˝ûE\\»®∑9˚´_§˙è\Ì\'˚:˛€øo|-s\„è¯ìL\÷\‚hZ\¬Úˆ(.îï*$éˆ»í.rÆ*yﬂôq#	àpxy8/µ˝+|Ø˜ôvACAN5“õ˚=ºû∑˘\€\Ô?üxãPéµm©iW˜∫f£f\‚[{´I\⁄\‡q—ë‘ÜR=AØ\◊ˇ\0¯#¸Z˝§5	~¸Dª˚ä¨m\Z\ÎH\’\ﬂ]VÒæøΩ2/\Ã´®b\ﬂ2íˆ4?¯7?\·í^Û∆üØ@\Z&∂π≤Öq\ÎÕª\Á<t\«\„^≠˚8¡\Z~~Àüto¯n˜∆í\Î∫H÷¶ÛSç¢\„xõr§HH(\Ï\Œ9\È^.yû\Â8\‹<©ªπ[\›v\Ÿˇ\0ós\÷\…rl\œàS∫QÍØ∫ˇ\05\–˘O˛@÷Ø4üà_\n\÷\÷\Ó\Í\ÿ>ù®J…ª˜∞u¡Ø\Õ?¯Lu˙\n\Í_¯ˇ\0\„_§r¸îOÖ?ˆ\‘?Ùl˘ó_E\¬Ò_\Ÿt¥\Ôˇ\0•3¡\‚ZíYïDüo˝%\Z?ò\Íˇ\0Ù\‘%ˇ\0∆è¯Lu˙\n\Í_¯ˇ\0\„_©?Gˇ\0\Ÿ\‡g\∆o\ÿ\Ó\rk\‚Ü|+™xÅµã∏˜˜&9åJS`\∆Ò¿\…\«ı/¸;øˆVˇ\0°\'¿?¯¯\Ìqb¯Ø\rá≠*•&\‚\Ì¢_\Êw\·xc^åkF™JI>ΩO¡¯Lu˙\n\Í_¯ˇ\0\„^\Èˇ\0\ÃÒFßw˚}|)ä]F˙Xü_Ñ2Ω√≤∞\Á®&ø^ø\·\›ˇ\0≤∑˝	>ˇ\0¿\„ˇ\0\«k¢¯U˚˛œæ\rÒ≈Üø\·xN\rwDî\\\⁄\‹\Ÿ\\4≤⁄∏\Ë\‡yÑ\ƒWüã\„-J¶©I]5≤\ÍΩN\Ï/b©VÖIUMEß◊£?=?\‡\‚≠r˜J˝™|ñ∑óV\»\ﬁBV)Y?lπ\ÁÉ_ü_ò\Íˇ\0Ù‘ø%ˇ\0∆æ˚ˇ\0Éé\‰\Î|ˇ\0bö\Èe\Õ~y\◊\–\‰Wˆm:~¨˘˛!©5ò\’Iı_í4\·2\’ˇ\0\Ë+®ˇ\0\‡Kˇ\0ç\∆Z∏ˇ\0ò¶£ˇ\0Å/˛5˚ˇ\0¶ˇ\0Ç~¸\Z¯\›˚¯\≈+¯¢kz˛ß˝°ˆ´€É\'ô?ó®\›Dô\√\¬\"ØNã_A]ˇ\0¡\'?g[\€vâ˛\Ë\n≠\‘\«-\ƒm◊≥,ÄèŒº¨O`\ËVùSï\‚\⁄{tv\Ózx~\≈÷£\Z—™Ω\‰ü^™\Á\‡6ìÒ/\ƒ~æ[õkvW	ç≤\€\ﬂKÆ#X†¿W\‹?M\Ô¯-ç>|G“º-ÒS_∫ÒGÅıIí’µ-E\Ã\◊\⁄#1\0Lf9yb¸\Í\Âà©*\ﬂ9¡G~¯Oˆs˝≥|k\‡\Ô\‹<\ﬁ\“\'ÑA\Œgk7x#íKs!Âº∑f^I \0ñ◊àWΩ[	Ö\Ã0\…‘ÜíWZjÆøxtÒò¨%®\œXª=tvë˜è¸gˆ\’~˛\’I\„\r*\ÁP∑\Á\ƒhM\‡L\ÎΩ¸aV\Ê1É¸YI{d\ \‡pº|Aˇ\0	éØˇ\0A]Kˇ\0_¸kˆ\”ˆÉ˝ö.?m¯#◊É-åM{\„\r?¡zGàÙ∑\⁄ZiØ#∞ç\ﬁ!‹ôë§å˝\ÁRzW\·\»9Ø;Üqäæ\ÿ\œYS|Ø\Â≥˚ø#\–\‚<<®\‚}¥Q®πóØU˙¸\œ\ﬂ¯#_\Ì<ﬂ¥ü\ÏM°G}p\'ÒÇõ˛˝@≥e\›bPm\Â9\‰\ÓÄ\∆º\Ë˛¯˙≥5¯ãˇ\0˝¶?\·M~◊Ø\·\È¸≠\‚EØ\ÿ0[ó\—níŸè\‘bπô}+ı≥ˆ\ ˝°\Ìe_Ÿó\∆:ù°3\Ë∂lbó\Ó\‹^?\Ó\Ì\„#©VL\„¯w\’˘ˇ\0eR£ô:4ñìi\«\Á\”\Ôπ˜c\Z\ÿZ£\÷*\“˘u˚µ?\"?‡∑üµ≠\Á\∆/\€6˚√∫Fßsá\Ó#£F∞L»í]\Áu€úº$\ƒG˛∏\n¯\Î˛_˛Ç∫è˛ø¯\’m_Uπ◊µ[õ\Î…§πªΩï\Áûg9idbYòüRI?ç}ˇ\0ú˝îG\Ìe˚d¯Oæ∂3¯o\√G˚wY\ \ÂYJBﬁ¢ILhG]¨\‰tØ\‘i”°ó`Ró\√N:˘\€ıoÛ?8ùj¯¸o∫\›\ÊÙÚ_ˆè\ƒ/\Ÿ\€P˝ñ\‡Å^(èPöÚ?xêiö\Ó©#\Ã\∆X$üR±Ú\·\›\’vB#Rπ¿0éµ˘Uˇ\0	éØˇ\0A]Kˇ\0_¸k˜ì˛X?\„Y_ˇ\0\Óˇ\0ß[:¸\nØÑk\ÀÜ´^¶Ú®\ﬂ\·\’\‚®{E:T\€IA/≈ü¢\ﬂnÆπ{™˛\’>5K´À´î_\n9,¨\‡∂[s…Ø’Øéº5˚:¸0\’|a\‚\ÌJ-/B\—\‚Û&ïπg$\·cE\Í\Œ\ÃB™éI5˘7ˇ\0\„\…\÷¯\€˛\≈7ˇ\0\“\Àjü˛˝ßØ|_Ò\ﬂG¯Ygq\"hæµèQ\‘!V¿û˙u‹Öáq6˙ü\‘WÖö\Â^\œ~Ø≤≤o\—/\È\ﬁ[ô}O%UﬁÆ\Ì/[ûQ˚mˇ\0¡d>\'˛\’\Z\ÕÓù†j7æArêi\⁄l\Ê+ª®Û\√\\Œ∏v$uE\">\ÿln?!\…+O#;≥;π\‹\Ã\«$ì‹öLW\Èw¸õ˛	O·Øç\ﬁOäø4\„´\È7WÅ£\ \≈m\Óñ&(˜3ÀØò¨™Ñ\‡\Ïb¡ÅZ˚\ZıpYFùGñ+K-\€˝_©ÚT)\„3lO+ï\ﬁ˜{%˙|è\ÕÒGz˛¢<7\‡]¡∫“¥çJ“¥∞ªùù§p@\∆\≈qé1ä˘˛\nEˇ\0êw\Ì=\ﬂQ\÷<\r\·\Ì#√ül£Û¨Ê±ç,\‡\’\»90\\(0\»Y[n[nE|˛é(T™©÷¶\‡ü[\ﬂ\Ô\—i˜û\ﬁ\'Éj¬ìù*ú\Õtµæ\ÌY˘E˚\'¡D~*~\«Z’≥x[\ƒwW\ZR6É®;\\i∑úïì˚¢øV˜\«˚ù˚˛\ÿ\ﬁ˝∑æ\Ÿ¯\«\√\Í\÷s˚.©¶\ \·\Ê\”.î—í>ÚêC+`nV\0\ÂG\Âè√ø¯7£\„Wä%\◊5o¯b3˜¢ö˙[´Öˇ\0Ä\≈Cˇ\0+\Ô_¯&á¸˚˛	Ò™xÜ\ÓOà3x¢/\€E∆üóˆ;h•çâIA2πfùsÖ\»~úW\÷\ qùJ3^\’v[˜ªJ\ﬂ3\–\·∫Y•	ÚWãˆoªZz+\ﬂ\‰~2~”û,\’a˝§˛!\"jzÇ¢¯óQE√Ä⁄§\„≠p\«\∆:∏ˇ\0òÆ£ˇ\0Å/˛5\‘˛\‘?Úrˇ\0?\Ïf‘øÙ™J¿¯eam™|H˝µ\‰i-•∆•m\Ëˇ\0uë•P¿˚M}ıF-ÆãÚ>&¥\Á,D¢§ıì¸ øò\Íˇ\0Ù‘ø%ˇ\0∆è¯Lu˙\n\Í_¯ˇ\0\„_Ω£˛	\ﬂ˚+c˛Dü\‡qˇ\0„¥ø\Óˇ\0\Ÿ[˛Ñü\0ˇ\0\‡qˇ\0\„µÚ\Î¶˛}K\Ó_\Ê}O˙£ãˇ\0ü\ÀÒ?\·1\’ˇ\0\Ë+©\‡Kˇ\0ç~≥ˇ\0¡∏öΩ÷≠ü\‚c]]\\\\î\’\Ìôd.W˜/\”&æáˇ\0áw˛\ \ﬂÙ$¯ˇ\0èˇ\0Ø]˝üøg?áü≥÷Öy√ø\ÈZü¨H∑`vx\ÓYAUlñ9¿$q^>y\ƒ\ÿ|fXzt‰õ∂≠.é˝\œO\'\·\ÏF´T®öI\È©\ËQE|!ı\Á˚B¸\Ô\Ì7ZOä≠Z\ÁF\◊!Ú\‰(@ñ\›¡‹ìF\ƒ≤#\0¿\‡åéAÒãˆüˇ\0Ç|g¯¨\ﬁO\·ù,|D\⁄1h.Ùí>\⁄\'hí‘ü3~:àº\≈˜\Ì_°ˇ\0∑\Á¸\ÀL˝Ç˛.Z¯GQ&≠Ø\œ•E™\€]C®Go®ÚK\ﬁUà!¢lÒ\‹qÇ\rx!ˇ\0ÉîÙÉˇ\04èRˇ\0¬â?˘æ\”!ÜuÜß\Ì0î˘©\À[6≠\Î∫k˙πÚô‘≤úD˝û*|≥éóW∫ÚŸ£Ú\Á\∆ˇ\0\r¸C\”U{\Ë\Z◊á\Ô£mço©X\Ài*ëÿ¨ä?ÖbÊø£/\Ÿˆπ7\ÌıF\€Y\”\◊Kñy\„€´¯z\Êh\Óß\”$\‹AIPÅπN2ÆTc∏_¥¸ìˆy¯Ö\·MNˇ\0\≈>óá≠\‡∑y.5{M\ÌL\Õ$[ï\ÎôAWπ4T\Í:8∫2N\Œ\Œˇ\0Üüô\„œÉ˘\‡™\·´&û™\Íﬂäø\‰~|\'˝•æ!|\nΩY¸\„OxpÆ3é°,P\»\Œ\Z0v8\œfW\Íw¸{˛´~\“^:∂¯kÒ<Xü^\∆\Ì§kpF∂Î©∫)vÇXîYvÜ*…µ[vÜ\∆\Ô»øYi˙gãuKm\"\ÓMCJ∑ºö++ßMçsπ\»W±e\0\„∂k\”\‡üñ◊ó_∑G\¬∞¥\„\∆\Zc∞èØî∑Q¥øáñ>ŸØs9 ∞∏¨4\ÂR+ô&”µö\“ˇ\0\ËÒ≤å\œÜ\ƒ\¬ìqm&Øtı∂ü£G\⁄\ﬂr¸îOÖ?ˆ\‘?Ùl˘ó_¶ür¸îOÖ?ˆ\‘?Ùl˘óQ\¬ˇ\0Ú+•\Ëˇ\0Ù¶>&ˇ\0ëï_ó˛íÑ\Ó)kı7˛	\€ˆqÒO\ÏÉ\◊\ƒ˚oÖr¯†\ÎhÕØ\›ZGy‰çõ8ëÉm\Îé\’ı¸)ÿª˛|æˇ\0\‡~üˇ\0\≈\◊&/äaB¥®∫3|Æ\◊KC≥\r\¬Û≠F5UXÆdü\ﬁ~	W\Ë\Ô¸yˇ\0%˚\‚/˝ãˇ\0\ÈJ\◊\⁄§b\Ô˘Ú¯ˇ\0Å˙ˇ\0]∑¿òfﬂÉ˛*a\ÔP¯I¢\ÎZ\Ôóc≥G\‘\Ïñ\‚¯≥çëG\‹\‰πQ\…$bºl€âcä¡\œ\Z3NKv¥\›3\ÿ ∏rX\\T+ ¨ZW\”\’4~t¡\«?Úuæ	ˇ\0±M?Ù≤\Êø<\ÎÙ3˛9ˇ\0ì≠O˝äiˇ\0•ó5˘\Á_Q√üÚ-£\È˙≥\Ê8ã˛F5}W‰é´\√<s\‡Ω\r3GÒüäÙù:\€wïkg´\‹A[ò≥mDp£,I8íOzπ?\Ì3Ò\Óä_à6ñ)££\Î∑L¨ßÇ/Ç\Ì_®?K\Ô¯%\Ô¿ø\⁄+ˆ?åºe\‡\Ìèko˚e\ÁˆŒ°o\ÁyZÖ\Ã)ÚE:†\ƒq¢£8\…\…$\◊\»X¯\'˝ü\ÏQÒ\¬\ ˜¬∂3Z¸>Òd>fòç4ì˝Ç\‚0\÷\∆G%èP\ÍXíCëì¥\÷8\\\Îà\∆\À£i¶÷©Y¥ı∂≠˘õW\ q\‘0q\≈Û\ﬁ\r\'d\›\“{_Ky#M+\‹L\“H\Ô$éK31\…by$û\ÊΩ\Àˆ˝Ç<e˚p¸Q≥\”tãª_\€Nø\€Z\„\∆V\⁄\¬Ç ¨xyà\·c$úú(f_ªˇ\0Fø\€N\œˆ®˝ò-4K\√ko\‚ˇ\0Gõ©[∆¢?¥√Ç ∫U\0\0++¸h«Ä\ÀW\ƒYé#ÑupÒøKˇ\0-˙€Ø¸1?Ä°ã\ƒ˚:Úµµ∑ÛwW˛¥πıÜ<7e\‡\Ô\r\È˙Fù∂\”Ùªh\Ï\ÌaëQ®DQûxP~	¡^øe/¯eè\€/\\é\∆\◊\Ï˛\ZÒy:Óë±\≈\Z\ \«ŒÖq¿Àº\ÏÖ8¡˚˜_\Z¡oøe¯hè\ÿ˛\Î\ƒ\ZuØù\‚Oá.\⁄≈±D\›$∂Ñwˆ\ÿ_\\€Å\‹\◊\Á\\/ôº.9søvz?W≥˚ˇ\0œΩ\‚,ø\Î8)rØz:Øñ\Î\Ó˝\√\œ¯é˜¡û&”µç6\·\Ìu*\Í+\ÀY\–·°ñ7é=\√\0\n˚\Á˛ˇ\0±˝®~¸$˜á\ÁE∂÷¥\ÿ¸UÆ¡e`∫!†éÿüX\‹\\\‰\Á1üJ¸¯4òØ\’q}*\’\È\‚\'ÒSΩæk˙h¸\œòU£B¶;N\◊˘û¡ö˝\«ˇ\0Ç˛\ \‡\Ïëäu+Sàæ$Hö§õ\”lëX®\"\—>å¨\”i«•~L˛¡?≥ˇ\0µ\Á\ÌU\·O\Ï€´üµ\Í“Æsc\œ1\»˚•îlS˝˘ø£]3L∑\—t\Î{;H\"∂¥¥âaÜî\"Dä\0UP8\0\0\0“æCé3.Jq¡A\Î-_¢\€Ò\◊\‰}We˜î±ì[hΩz˛\Z|\ŸÚˇ\0¸≥˛QïÒ/˛\·˙u≥Ø¿™˝ıˇ\0Ç\÷\ 2æ%ˇ\0\‹/ˇ\0N∂u¯]\\\r˛\·?Òø˝&\'\'æ\√¸+Ûë˙ˇ\0\„\…\÷¯\€˛\≈7ˇ\0\“\Àj˘\Á˛\n\≈wy}ˇ\0¯®˜\√.™±®›ª˜KKsˇ\0,\¬}:`tØ°ø\‡\‹o˘:\ﬂÿ¶ˇ\0˙YmXüp\Ï\Ôy\Áˆπ∑Ò\‹V\Ótoà1úï/-£Xdå˙f%Å¡=K7˜MkF¥a\ƒ3Ñ∑î^∫?\…Z2ûA	G\Ï\ \Ô\Ôkı>Ø\Ë\Á˛	\Ìacß~\¬\ﬂ#\”\ƒKn\ﬁ\”ea\„\Õ{dy1ü>˘Ø\Á\ZøYø\‡á_R/E\¬\œ\‡◊çuK=U\—\Âq\·\€ÀπDP\ÍH\ÂÕ±v\‡JéÕ¥7´*Åï\Âqû\n≠|gI_ë›Ø+oÚ\‚\È\“\≈Jπïó≠ˆ˘ü¶‘Ñ\“\ÊæYˇ\0Çë¡K<\'˚¸.\÷,4˝b\ ˇ\0\‚Uı≥¡§\ÈV\ÓìKc+.\Ê\·y	\Zd0WêÄ†`±_À∞òJ∏ö™çvˇ\0Ø∏˝àßBõ´U\Ÿ#\ÍS÷åfø\n¸5ˇ\0\ﬁ˝¢t øj◊º?¨\Ì&ÛCÅ7qåü$Gı„ø∑ˆ\◊¸õ˛\nuÒ_ˆÒ¯ª´i!∑É\Ï¸9†\È\∆\Í˚R\” πÖ\„ô\ÿ,2i/â8\‚6<c\›\«pÆ7JU™8Ú\«{?ÛHÒ\\IÉ\ƒ\‘Tiﬂô˜_\ÂsÚcˆ°ˇ\0ìó¯âˇ\0c6•ˇ\0•RW	]\ﬂ\ÌCˇ\0\'/Ò˛\∆mKˇ\0J§Æ{\·¥6ótø5+uπ`Fc2Æ\Ì\Ÿ\„n3úˆØ\◊(;QãÚ_ë˘uxÛb%ÚôçE~ˆÇ?±v?\„\À\‡\'˛\Èˇ\0¸]/¸)ÿª˛|æˇ\0\‡~üˇ\0\≈\◊\ Æ4ˇ\0\Á\ƒ˛\„\Èˇ\0\’\nüÛ˙\'\‡ïBˇ\0J^\‡û?\nˇ\0\Ïˇ\0µ§ÆW˛è\Ï]ˇ\0>_\0ˇ\0?Oˇ\0\‚\Î\ﬁ>¯ã\·\‹˛M\·∆´\·+Ω\√—§B\œAΩÇ\‚=±E+Åäæ3å\·Ω\r|˜gãáç8“îl\Ôv¥\⁄ﬂ©\Ôd,∞5•9TR∫∂üy\€\—EÒG\’!ˇ\0¡\\?\‡ùS~‹ü	\Ï5\r¥x˜\¬Y4‰îÑèTÖ¿2Z3ü∫ƒ™≤1;Cn\À/\·\«\ƒá ¯M‚ªù\ƒ˙.•†kgl\÷wˆ\Ô\…\Ëv∞±\»$Wıä\Â˛&¸w∆ù0Yxø¬æÒ=™Ç=SOä\ÏGû\ÎΩIS\Ó∏\"æ≥#‚™ò\Z~¬¨y°”∫ˇ\03Ê≥ûßçü∂Ñπg◊™~ø\Ê2zN≥w†\ﬂ%’ç\’Õï\Ãrh%h\‰_£≠|YÒWèmñ\rwƒæ ÷°è#ø\‘fπE\∆qÄ\Ï@\∆O\Á_º\⁄\Á¸\„ˆmÒ¨˜Ù¯\À0b-µ;\ÎQê1¿äu\0{t¶\Ëˇ\0GOŸ≥C \√\¬\≈\€ˇ\0\“5K˚é\Ì§\Ì«∑J˙g\∆¯\Ô:rø§˘#\Á\◊cW∫™Gó\’˛V?t]˜ƒöµΩÜùgu}t\‚8-≠¢ieôèEUPI\'\–\n˝oˇ\0Ç4¡)µØÅ^$Oä\ﬂÙÛßxâ`hÙ\r\ZR\⁄pëJΩ\Ã\‡}\ŸJEN™ã\0\ÿ˜¬Ø\Ÿ\√¿c\€\‡\Ô¯c\√,T´Ißi±[\À =w:®f¸IÆ÷º\Áã\Íb©:#\Àª\Í\◊o/=\œk)\·jxZäΩisIm\—/Û?%ø\‡\‰Ûˇ\0\·O˝Éµ˝~fWÙÒ„øÉ~¯£=¥æ&∑á<E%ö≤€∂ß¶\√v\–¡`¶E;A¿\Œ:\‡V¸2G¬ü˙&?ú≥ˇ\0\„uæS\≈‘∞xHa•M∑\Î6Ã≥Nñ/,B©nkin\….˛GÛKä+˙Zˇ\0ÜH¯Sˇ\0D\«\·\Ô˛ñ¸nè¯dèÖ?ÙL~ˇ\0\·9gˇ\0\∆\Î\—ˇ\0_(ˇ\0œß˜£\œˇ\0Rßˇ\0?W\›ˇ\0˛ik‘øa˘=øÉß˛ßçˇ\0K\‡Ø\Ë#˛#\·O˝áø¯NYˇ\0Ò∫±§~\À\ﬂ¸?´Z\ﬂ\ÿ|;-çıå©qoqo†\⁄\≈-ºà¡ï—ñ0UîÄA é+*\‹qFt\ÂdıMnç(l\·8\œ⁄≠\Z{¡?*?\‡\„ìˇ\0[\‡ü˚\”ˇ\0K.kÛ“øßO|_\ƒ\ÌJ+\œ¯C\¬˛!ªÇ?&)ı=*π#Lì±ZE$.I8dö\≈ˇ\0ÜH¯Sˇ\0D\«\·\Ô˛ñ¸nπræ0•Ö\¬\√*m∏´^\Ë\ÍÃ∏Vx¨LÒ\n¢\\\›-\Ân\Áåˇ\0¡\…ˇ\0áe¸4ˇ\0∏ß˛ùo+\–ˇ\0o?\Ÿ7O˝¥?fç{¡wBµ9\Ìö5‹É˛<Ø£\ƒ˘Ï≠ñçøÿëÒ\Œ+\’<+\·\'¿∫\ZVá•\È\⁄6ókª…≥±∂K{xw1f⁄àå≥18íOz—Øë≠éì\∆KKF\‰‰ºÆ\Ó}5$cÖé¶©EE˘\ŸX˛\\|S\·≠C¡^&\‘4mZ\“k\rSIπí\ŒÚ\⁄Qâ-Êçä:0ı?JÙ\Ô\ÿsˆ≥’øb\ﬂ\⁄3DÒ∂ú%∏≥ÖæÀ´Y#m˛–≤r<ÿΩ7pI\ËËß¶EA^!˝öæ¯ªZπ‘µo\0x\'S\‘o|˜Wz¨Û\Œ\›73≤c\ÓMS≤?¬Åˇ\04\«\·\Ô˛ñ¸næﬁßa\Í\“t´Qm5g©Ú4∏B≠*™≠*\÷i\›iˇ\0\Í¸\„≠+\‚oÇ¥ühW±j:6∑i\Ìï\Ãy\€4R(elG°\‰\ri^\ÿ√©Y\ÕosW˜cñ)2H§`´¡pA\ÎU</\·=/¡\Zæó¢\È∂\ZFôhÇ\Œ\ \›-\‡Ñ,v¢\0£,I\‡u$÷Ö~y&πü&\›πç\Ì\Ôn9_PO\Ÿv\ŸˆØÒWÉÑR¶íón\—d˘mc1-	¯äÛ?ﬁâ´\∆+˙tÒ\«¿ˇ\0|N\‘\‚ΩÒ/Ñ</\‚\»\"G>ß•Aw,qÇX iêπbp8\…>µãˇ\0ëß˛âè\√\ﬂ¸\',ˇ\0¯\›~ÖÜ\„ò∆îcVõrKWuØôÿé\r\Á´)”©dﬁä\€yn|_ˇ\0¯~\ c\·˜¡c‚ñßm∑TÒºÜ\ÀLgR\Z->!ò\◊Yî\Á\⁄\»\Î_¢UWD–¨º5§[i˙uùÆüae\Z\√omm\≈£\nàä\0UÄ\0¿´UÒYû:X\ÃLÒ\Í˛\Â\—}\«\◊\‡0q\¬\·\·B\ﬁ˙øõ>Wˇ\0Ç\÷ˇ\0\À¯óˇ\0pø˝:\Ÿ\◊\‡]Q~*éì\„≠}+\\\“Ù\ÌgK∫\€\ÁY\ﬂ[%≈º\€X2\ÓGNTåéµq\ﬂ\…\n\Ëò¸=ˇ\0\¬r\œˇ\0ç\◊\–dKO.\√ Ñ\‡\Ây7øí_°\·g|=,}uYOñ\ \€_´}¸\œ\À¯7ˇ\0\∆V¯\€˛\≈7ˇ\0\“\Àj˝F˝¨ˇ\0eè~\ÿ\ﬂ5/x¶˚-\ﬁ&µªà¥i∑+ü.xâ\Ë\√$—ïôO\◊G\‡Ç¯c©Ky\·Øx_\√\◊s\«\‰\À>ô•Ai$âêv3F†ï\»åÅ]>+\ Õ≥wä\∆˝räqj\÷\Óö=<≥,Xl\'\’*>e≠Ù\ﬁ\ÁÛ\…˚g¡6>&˛\≈:˝\…\◊4âµ	1k\‚-:í\∆e?w\Ã\Í`ì±I1\»;KÅ∏¸˝_\‘\‘ˆ\Èu\«\",ë»•]eX ı\·\ﬂ\‡ôø~,\ﬁIs¨¸.∑\⁄%˚Ú\ÿB\⁄sπı&›£$˚ûk\Í∞<uh®\‚\È\›˜è_ìˇ\03Ê±úúú∞≥≤\Ïˇ\0\œ˛¸ˇ\0\È\ﬂ<k§hgL¥Òáämt“ª~\…´:AèMÅ∂\„Æ^I\Zi›ô\›\ŒYâ\…b{ö˝ıˇ\0á)˛ÃøÙM?Ú\·\’˘&∫è\0ˇ\0¡,?gøÜ◊ë\‹iø\n¸5,±}”©	u0=ÒrÚ˚ıÆ\◊\∆¯¶\È”ï˝\"øSëpÜ6m*µ#oVˇ\0D~~\ ﬂ±ƒè\€\≈Qi˛˝\Õ≈êî%ﬁØpçõ`;ô&#\'b\ÓsÉÖ5˚≥˚	˛\≈^˝Ü>Z¯WGeæ‘Æ\ÌZŒ™Ò\ÏóSπ#±\Œ\ÿ\‘|®ô˘@\…\À31ˆ-7K∂\—t¯m,\Ì‡¥µ∑PëCb8\‚Q\–*é\0ˆ>+\‰sæ$Øò/gnXv\Ô\Íœ®\ 2\n}>iæø\‰∫\Ã\Á\ÌB\„%˛\"\ÿÕ©\ÈTï\¬‚ø¶\rCˆW¯a´_\œuu\„¿wWWR4≥M/á\ÌI]éYôåy$íI\'íj/¯dèÖ?ÙL~ˇ\0\·9gˇ\0\∆\Î\ÈiÒ\Õ¡G\Ÿ=txx6sõüµZª\Ìˇ\0˛ihØ\Èk˛#\·O˝áø¯NYˇ\0Ò∫?\·í>ˇ\0\—1¯{ˇ\0Ñ\Âüˇ\0´ˇ\0_(ˇ\0œß˜£?ı*Ûı}\ﬂOÊñøS\‡\⁄/ΩÒ´˛\‡˚ëØ\–\ﬂ¯dèÖ?ÙL~ˇ\0\·9gˇ\0\∆\Î°\¬?\n|,˚W¸#˜á>›≥\Ì?\Ÿzt6hŸªfˇ\0-Wv\›ÕåÙ\‹q\‘◊ôúqm<nxh\”i\ \⁄ﬂ≥OÙ=ØÖ\ÁÑ\≈G\Í_ñ˙[∫køô\–\—E\Á\ÿˇ\Ÿ',2);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envios` (
  `id_envio` int(10) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `ultimo_envio` varchar(10) NOT NULL,
  PRIMARY KEY (`id_envio`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,'2014-08-20','2010-06-22');
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_baja` date NOT NULL,
  `fecha_garantia` date NOT NULL,
  `marca` varchar(255) CHARACTER SET latin1 NOT NULL,
  `codigo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ubicacion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_sector` int(11) NOT NULL,
  `id_hubicacion` double NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_criticidad` int(11) NOT NULL,
  `estado` varchar(2) CHARACTER SET latin1 NOT NULL,
  `fecha_ultimalectura` datetime NOT NULL,
  `ultima_lectura` double NOT NULL,
  `tipo_horas` varchar(10) CHARACTER SET latin1 NOT NULL,
  `id-centrodecosto` double NOT NULL,
  `valor_reposicion` double NOT NULL,
  `fecha_reposicion` date NOT NULL,
  `id_proveedor` double NOT NULL,
  `valor` double NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `descrip_tecnica` text COLLATE utf8_spanish_ci NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_proceso` int(11) DEFAULT NULL,
  `numero_serie` double DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_sector` (`id_sector`),
  KEY `id_criticidad` (`id_criticidad`),
  KEY `id_grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Perforadora Ranger 500','0000-00-00','0000-00-00','0000-00-00','TamRock','EMPER001','La Laja',6,10,0,2,13,1,'AC','0000-00-00 00:00:00',1000,'',0,0,'0000-00-00',0,0,'','',11,3,8,11111),(3,'Cargadora WA250','2018-09-02','0000-00-00','2018-09-29','Komatsu','EMCAR003','0',6,12,0,1,14,1,'AC','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',1,3,8,11111),(4,'Autoelevador 01','2018-09-02','0000-00-00','2018-09-29','Toyota','EMAUT001','La Laja',6,10,0,3,15,2,'AC','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',1,3,8,11111),(5,'Perforadora 680','0000-00-00','0000-00-00','0000-00-00','TamRock','EMPER002','La Laja',6,11,0,2,16,1,'RE','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',11,3,8,11111),(7,'este equipo es una pruba','2018-08-11','0000-00-00','2018-08-10','Black & Decker','AIR000507','4444',6,11,0,3,17,9,'AC','2018-08-17 00:00:00',0,'',0,0,'0000-00-00',0,0,'','dasdsadsadsa',2,10,9,2234444),(8,'este equipo es una pruebaaaaa','2018-08-11','0000-00-00','2018-08-10','Black & Decker','AIR000507','4444',6,13,0,1,18,9,'AC','2018-08-17 00:00:00',0,'',0,0,'0000-00-00',0,0,'','dasdsadsadsa',11,10,9,2234444),(9,'PERFONADORA TOYOTA','2018-09-16','0000-00-00','2018-09-22','Toyota','MT666','0',6,12,0,2,18,10,'AC','2018-09-14 00:00:00',1540,'',0,0,'0000-00-00',0,0,'','sdfgdfdfg',6,10,9,123),(10,'Descrip','2018-09-08','0000-00-00','2018-09-29','Toyota','Cod12-2018','13456,46123',6,12,0,2,15,3,'AN','2018-09-07 00:00:00',20,'',0,0,'0000-00-00',0,0,'','gfhfdgdhhfh',6,3,7,123),(12,'Perforadora Drilltech Tamrock 500','2018-09-17','0000-00-00','2018-09-17','DRILLTECH','EMPER11','0',6,14,0,5,20,11,'AN','2018-09-17 00:00:00',5,'',0,0,'0000-00-00',0,0,'','',7,12,11,23344),(13,'Perforadora DM45','2018-01-01','0000-00-00','2018-09-22','Atlas Copco','901','0',7,15,0,7,20,11,'AC','2018-09-18 00:00:00',1150,'',0,0,'0000-00-00',0,0,'','',7,14,13,8614),(14,'Perforadora DM 45','0000-00-00','0000-00-00','0000-00-00','Atlas Copco','903','0',7,15,0,7,20,11,'AC','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',7,14,13,6052),(15,'Pantera DP 1500','0000-00-00','0000-00-00','0000-00-00','Sandvik','905','0',7,15,0,8,20,11,'AC','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',7,14,11,12),(16,'Roc L8-30','0000-00-00','0000-00-00','0000-00-00','DRILLTECH','906','0',7,15,0,9,20,11,'AC','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',7,14,11,10),(17,'descrip','0000-00-00','0000-00-00','0000-00-00','Bahco','123456789','La Laja',6,10,0,1,13,10,'AN','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',6,3,4,2222222222),(18,'Equipo de prueba','2018-10-19','0000-00-00','2018-10-30','Toyota','123456789','0',6,16,0,11,19,9,'AN','2018-10-25 00:00:00',22,'',0,0,'0000-00-00',0,0,'','',6,10,4,123456789);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fallas`
--

DROP TABLE IF EXISTS `fallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fallas` (
  `id_reparacion` int(100) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_reparacion`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fallas`
--

LOCK TABLES `fallas` WRITE;
/*!40000 ALTER TABLE `fallas` DISABLE KEYS */;
INSERT INTO `fallas` VALUES (1,'Reparaci√≥n por falla');
/*!40000 ALTER TABLE `fallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_equipo`
--

DROP TABLE IF EXISTS `ficha_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha_equipo` (
  `id_fichaequip` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `marca` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `numero_motor` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `numero_serie` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `dominio` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `fabricacion` int(11) NOT NULL,
  `peso` float NOT NULL,
  `bateria` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `hora_lectura` float NOT NULL,
  PRIMARY KEY (`id_fichaequip`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_equipo`
--

LOCK TABLES `ficha_equipo` WRITE;
/*!40000 ALTER TABLE `ficha_equipo` DISABLE KEYS */;
INSERT INTO `ficha_equipo` VALUES (1,4,'1011','1012','1013','1010','2017-07-09','nose1010',0,10,'10',1),(2,242,'marca12','12m','120','1212','2017-07-10','fefe',1980,10,'10',1),(3,0,'nuevo modelo 5051','5051ng','5051','5051','2017-07-10','5051',1950,51,'510',1),(4,0,'marca pepe 14145','nuevo pepe 14145','14150','14145','2017-07-10','14',1914,14,'14',1),(5,242,'nuevo gm 6061','6061 mgpepe','60610','6061','2017-07-10','6061',1960,61,'60',1),(6,242,'8081p','80812','80813','8081','2017-07-10','80814',1983,80,'81',0),(7,339,'5252 marca','5252 marca','1212','5252','2017-07-12',' gemma',1989,12,'20',0),(8,11,'cat','3512','123345','0001','2018-01-30','lwo070',0,0,'',0);
/*!40000 ALTER TABLE `ficha_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id_grupo` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Carguio','AC',6),(2,'Perforaci√≥n ','AC',6),(3,'Auxiliares','AC',6),(4,'grupo test02','AN',6),(5,'Perforadoras','AC',7),(6,'Perforadora Rotary','AC',6),(7,'Perforadora Rotary','AC',7),(8,'Perforadora Top Hammer','AC',7),(9,'Perforadora DTH','AC',7),(10,'grupo test 2018/09','AN',6),(11,'NUEVO','AN',6),(12,'grupo test 003','AN',6);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herramientas`
--

DROP TABLE IF EXISTS `herramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herramientas` (
  `herrId` int(11) NOT NULL AUTO_INCREMENT,
  `herrcodigo` varchar(255) NOT NULL DEFAULT '',
  `herrmarca` varchar(255) DEFAULT NULL,
  `modid` int(10) DEFAULT NULL,
  `tipoid` int(10) DEFAULT NULL,
  `equip_estad` varchar(4) DEFAULT NULL,
  `herrdescrip` varchar(255) DEFAULT NULL,
  `depositoId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`herrId`),
  UNIQUE KEY `1` (`herrcodigo`) USING BTREE,
  KEY `depositoId` (`depositoId`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herramientas`
--

LOCK TABLES `herramientas` WRITE;
/*!40000 ALTER TABLE `herramientas` DISABLE KEYS */;
INSERT INTO `herramientas` VALUES (1,'HR-OFA-Linterna','Linterna',1,NULL,'AC','HR-OFA-Linterna',1,6),(2,'SW80','Robust',1,NULL,'AC','Taladro',1,6),(4,'HR-TT-Organizador Tornillos','Organizador tornillos - Stanley',1,NULL,'AC','HR-TT-Organizador Tornillos',1,6),(5,'HR-TT-Escalera 7 pelda√±os','Escalera 7 pelda√±o - Ayinco',1,NULL,'AC','HR-TT-Escalera 7 pelda√±os',1,6),(6,'HR-TT-Mascara facial','Mascara facial',2,NULL,'AC','HR-TT-Mascara facial',1,6),(7,'HR-TT-Prot Audit-Vincha','Protector auditivo copa tipo vincha',1,NULL,'AC','HR-TT-Prot Audit-Vincha',1,6),(8,'HR-TT-Llave combinada 10mm','Llave combinada 10mm',3,NULL,'TR','HR-TT-Llave combinada 10mm',1,6),(9,'HR-TT-Llave combinada 13mm','Llave combinada 13mm',1,NULL,'AC','HR-TT-Llave combinada 13mm',1,6),(10,'HR-TT-Llave combinada 15mm','Llave combinada 13mm',1,NULL,'AC','HR-TT-Llave combinada 15mm',1,6),(11,'HR-TT-Llave combinada 17mm','Llave combinada 17mm',1,NULL,'AC','HR-TT-Llave combinada 17mm',1,6),(12,'HR-TT-Llave combinada 7/16\"','Llave combinada 7/16\"',1,NULL,'AC','HR-TT-Llave combinada 7/16\"',1,6),(13,'HR-TT-Llave combinada 9/16\"','Llave combinada 9/16\"',1,NULL,'AC','HR-TT-Llave combinada 9/16\"',1,6),(14,'HR-TT-Destornillador de pu√±o philips','Destornillador de pu√±o philips - Bulit',1,NULL,'AC','HR-TT-Destornillador de pu√±o philips',1,6),(15,'HR-TT-Llave Francesa 30mm','Llave Francesa 30mm',1,NULL,'AC','HR-TT-Llave Francesa 30mm',1,6),(16,'HR-TT-Cinta m√©trica de 5 m ','Cinta m√©trica de 5 m ',1,NULL,'AC','HR-TT-Cinta m√©trica de 5 m ',1,6),(18,'HR-OFA-Arco de sierra','Arco de sierra',1,NULL,'AC','HR-OFA-Arco de sierra',1,6),(19,'HR-OFA-Extractor de poleas 150 mm','Extractor de poleas 150 mm',1,NULL,'AC','HR-OFA-Extractor de poleas 150 mm',1,6),(20,'HR-OFA-Alargues','Alargues',1,NULL,'AC','HR-OFA-Alargues',1,6),(21,'HR-OFE-Espatula chica','Espatula chica',1,NULL,'AC','HR-OFE-Espatula chica',1,6),(22,'HR-OFE-Espatulas medianas','Espatulas medianas',1,NULL,'AC','HR-OFE-Espatulas medianas',1,6),(23,'HR-OFE-Barretines de 0,80 y 0,90 negro, naranja','barretines de 0,80 y 0,90 negro, naranja',1,NULL,'AC','HR-OFE-Barretines de 0,80 y 0,90 negro, naranja',1,6),(24,'HR-OFE-Arn√©s','Arn√©s',1,NULL,'AC','HR-OFE-Arn√©s',1,6),(25,'HR-OFE-Llanas','Llanas',1,NULL,'AC','HR-OFE-Llanas',1,6),(26,'HR-OFE-Llana dentada','Llana dentada',1,NULL,'AC','HR-OFE-Llana dentada',1,6),(27,'HR-OFE-Balde de Alba√±il','Balde de Alba√±il',1,NULL,'AC','HR-OFE-Balde de Alba√±il',1,6),(28,'HR-OFE-Anchada','Anchada',1,NULL,'AC','HR-OFE-Anchada',1,6),(29,'HR-OFE-Bota de goma','Bota de goma',1,NULL,'AC','HR-OFE-Bota de goma',1,6),(30,'HR-ODE-Boquilla para termofusi√≥n 1\"','Boquilla para termofusi√≥n 1\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 1\"',1,6),(31,'HR-ODE-Boquilla para termofusi√≥n 4\"','Boquilla para termofusi√≥n 4\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 4\"',1,6),(32,'HR-ODE-Boquilla para termofusi√≥n 2,5\"','Boquilla para termofusi√≥n 2,5\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 2,5\"',1,6),(33,'HR-ODE-Boquilla para termofusi√≥n 80mm','Boquilla para termofusi√≥n 80mm',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 80mm',1,6),(34,'HR-ODE-Boquilla para termofusi√≥n 2\"','Boquilla para termofusi√≥n 2\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 2\"',1,6),(36,'HR-ODE-Boquilla para termofusi√≥n 1 1/4\"','Boquilla para termofusi√≥n 1 1/4\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 1 1/4\"',1,6),(37,'HR-ODE-Boquilla para termofusi√≥n 3/4\"','Boquilla para termofusi√≥n 3/4\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 3/4\"',1,6),(38,'HR-ODE-Boquilla para termofusi√≥n 1/2\"','Boquilla para termofusi√≥n 1/2\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 1/2\"',1,6),(39,'HR-ODE-Termofusora 1','Termofusora 1',1,NULL,'AC','HR-ODE-Termofusora 1',1,6),(40,'HR-ODE-Termofusora 1600w','Termofusora 1600w',1,NULL,'AC','HR-ODE-Termofusora 1600w',1,6),(41,'HR-ODE-Boquilla para termofusi√≥n 75mm','Boquilla para termofusi√≥n 75mm',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 75mm',1,6),(42,'HR-ODE-Boquilla para termofusi√≥n 90mm','Boquilla para termofusi√≥n 90mm',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 90mm',1,6),(43,'HR-ODE-Boquilla para termofusi√≥n 110mm','Boquilla para termofusi√≥n 110mm',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 110mm',1,6),(44,'HR-OVI-TermoAnem√≥metro ','TermoAnem√≥metro ',1,NULL,'AC','HR-OVI-TermoAnem√≥metro ',1,6),(45,'HR-OVI-Termometro infrarojo','Termometro infrarojo',1,NULL,'AC','HR-OVI-Termometro infrarojo',1,6),(46,'HR-OVI-Pinza extractora de fusible NH','Pinza extractora de fusible NH',1,NULL,'AC','HR-OVI-Pinza extractora de fusible NH',1,6),(47,'HR-OVI-Pinza amperometrica con puntas','Pinza amperometrica con puntas',1,NULL,'AC','HR-OVI-Pinza amperometrica con puntas',1,6),(48,'HR-OVI- Soldador Caut√≠n 30w','Soldador Caut√≠n 30w',1,NULL,'AC','HR-OVI- Soldador Caut√≠n 30w',1,6),(49,'HR-OFE-Multimetro con puntas','Multimetro con puntas',1,NULL,'AC','HR-OFE-Multimetro con puntas',1,6),(50,'HR-TTA-P√©rtiga DPA 3 KV','P√©rtiga DPA 3 KV',1,NULL,'AC','HR-TTA-P√©rtiga DPA 3 KV',1,6),(51,'HR-OVI-Detector de met√°l ','Detector de met√°l ',1,NULL,'AC','HR-OVI-Detector de met√°l ',1,6),(52,'HR-OVI-Programador de variador vel.','Programador de variador vel.',1,NULL,'AC','HR-OVI-Programador de variador vel.',1,6),(53,'HR-OVI-Pinza amp con puntas','Pinza amp con puntas',1,NULL,'AC','HR-OVI-Pinza amp con puntas',1,6),(54,'HR-OFA-Caja de llaves tubos medidas chicas(completa)','Caja de llaves tubos medidas chicas(completa)',1,NULL,'AC','HR-OFA-Caja de llaves tubos medidas chicas(completa)',1,6),(55,'HR-OFA-Caja de llaves tubos medidas grandes(completa)','Caja de llaves tubos medidas grandes(completa)',1,NULL,'AC','HR-OFA-Caja de llaves tubos medidas grandes(completa)',1,6),(56,'HR-OFA-Caja de mechas(12,16,20mm y 1/2\")','Caja de mechas(12,16,20mm y 1/2\")',1,NULL,'AC','HR-OFA-Caja de mechas(12,16,20mm y 1/2\")',1,6),(57,'HR-OFA-Amoladora 4,5\" 840w 9557 HP','Amoladora 4,5\" 840w 9557 HP',1,NULL,'TR','HR-OFA-Amoladora 4,5\" 840w 9557 HP',1,6),(58,'HR-OFA-Llave Stillson 36\"','Llave Stillson 36\"',1,NULL,'AC','HR-OFA-Llave Stillson 36\"',1,6),(59,'HR-OFA-Pistola de calor','Pistola de calor',1,NULL,'AC','HR-OFA-Pistola de calor',1,6),(60,'HR-OFA-Serrucho 24\"','Serrucho 24\"',1,NULL,'AC','HR-OFA-Serrucho 24\"',1,6),(61,'HR-OFA-Atornillador ? 13 con bateria ','Atornillador ? 13 con bateria ',1,NULL,'AC','HR-OFA-Atornillador ? 13 con bateria ',1,6),(65,'HR-OFA-Rotomartillo con mandril y llave','Rotomartillo con mandril y llave',1,NULL,'AC','HR-OFA-Rotomartillo con mandril y llave',1,6),(66,'HR-ODE-Extractor de poleas 400 mm','Extractor de poleas 400 mm',1,NULL,'AC','HR-ODE-Extractor de poleas 400 mm',1,6),(67,'HR-OFE-Espatulas grandes','Espatulas grandes',1,NULL,'AC','HR-OFE-Espatulas grandes',1,6),(68,'HR-OFE-Soplete para colocar membrana','Soplete para colocar membrana',1,NULL,'AC','HR-OFE-Soplete para colocar membrana',1,6),(69,'HR-OFE-Cola de vida ','Cola de vida ',1,NULL,'AC','HR-OFE-Cola de vida ',1,6),(73,'HR-OFE-Serrucho para corte en durlock','Serrucho para corte en durlock',1,NULL,'AC','HR-OFE-Serrucho para corte en durlock',1,6),(74,'HR-OFE-Llana de durlock','Llana de durlock',1,NULL,'AC','HR-OFE-Llana de durlock',1,6),(75,'HR-OFE-Fratacho','Fratacho',1,NULL,'TR','HR-OFE-Fratacho',1,6),(76,'HR-OFE-Cortafierro','Cortafierro',1,NULL,'AC','HR-OFE-Cortafierro',1,6),(78,'HR-OFE-Cuchara mediana de alba√±il','Cuchara mediana de alba√±il',1,NULL,'AC','HR-OFE-Cuchara mediana de alba√±il',1,6),(79,'HR-OFE-Cuchara grande de alba√±il','Cuchara grande de alba√±il',1,NULL,'AC','HR-OFE-Cuchara grande de alba√±il',1,6),(80,'HR-OFE-Chocla','Chocla',1,NULL,'AC','HR-OFE-Chocla',1,6),(81,'HR-OFE-Martelina','Martelina',1,NULL,'AC','HR-OFE-Martelina',1,6),(82,'HR-OFE-Bomba de combustible','Bomba de combustible',1,NULL,'AC','HR-OFE-Bomba de combustible',1,6),(83,'HR-OFE-Grasera','Grasera',1,NULL,'AC','HR-OFE-Grasera',1,6),(86,'A-Hormigonera','azul',1,NULL,'AC','A-Hormigonera',NULL,6),(87,'w80','989',1,NULL,'AC','w80',NULL,6),(89,'HVLL-TT-MANIFOLD','',1,NULL,'AC','MANOMETRO DE GASES REFRIGERANTE',2,6),(90,'HVLL-TT','SSP',1,NULL,'AC','Agujereadora de mano el√©ctrica 13 mm con percutor',3,6),(91,'2334343242','ssss',0,NULL,'AC','Taladro',1,6),(93,'1001','IRIMO',-1,NULL,'AC','Caja de tubos 3/4¬¥',0,7),(94,'','',-1,NULL,'AC','',-1,6),(95,'CJ 01 ','METALICA ',19,NULL,'AC','CAJA DE HERRAMIENTAS ',4,7),(96,'CJ 02 ','COMPLETA ',23,NULL,'AC','CAJA DE HERRAMIENTAS ',4,7),(97,'CJ 03','ENCASTRE 3/4 ',24,NULL,'AC','CAJA DE TUBOS ',4,7),(98,'CJ O4 ','PLASTICA CHICA ',33,NULL,'AC','CAJA DE HERRAMIENTAS ',4,7),(99,'CJ 05 ','ALTA Y BAJA ',32,NULL,'AC','CAJA CON MANOMETROS DE CARGA DE A/C',4,7),(100,'LLVF 01','450MM',35,NULL,'AC','LLAVE FRANCESA',4,7),(101,'LLST 01','PINZA ',35,NULL,'AC',' STILSON ',4,7),(102,'PNZ 01','PINNZA',30,NULL,'AC','PINZA PICO DE LORO ',4,7),(103,'LLIN 01','REGULABLE',20,NULL,'AC','LLAVE INGLESA',4,7),(105,'LLCO 01','COMBINADA 36MM',20,NULL,'AC','LLAVE ',4,7),(106,'MF 01 ','ENCASTRE 1/2 ',35,NULL,'AC','MANGO DE FUERZA ',1,7);
/*!40000 ALTER TABLE `herramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_lecturas`
--

DROP TABLE IF EXISTS `historial_lecturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial_lecturas` (
  `id_lectura` int(10) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(10) NOT NULL,
  `lectura` int(10) NOT NULL,
  `fecha` datetime NOT NULL,
  `usrId` int(11) NOT NULL,
  `observacion` text,
  `operario_nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `turno` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(4) NOT NULL,
  PRIMARY KEY (`id_lectura`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_lecturas`
--

LOCK TABLES `historial_lecturas` WRITE;
/*!40000 ALTER TABLE `historial_lecturas` DISABLE KEYS */;
INSERT INTO `historial_lecturas` VALUES (1,1,150,'2017-11-27 04:24:41',3,'too ok','pepe','tarde','AC'),(2,1,56,'2017-11-27 04:29:15',3,'todo normal','ruben','noche','AC'),(3,1,20,'2017-11-28 10:48:21',3,'normal','juan','ma√±ana','AC'),(7,1,4545,'2017-11-30 06:08:35',3,'todo ok','pedrito','manana','RE'),(6,1,333,'2017-11-30 08:28:29',3,'bateria baja','roberto','manana','AC'),(8,1,999999,'2017-11-30 10:09:43',3,'rotura llanta','roberto','tarde','RE'),(9,1,454545,'2017-11-30 11:11:09',3,'reparado','juan','ma√±ana','RE'),(10,1,23333,'2017-12-06 08:27:03',1,'dadasd','dsadad','333','AC'),(11,1,1000,'2017-12-18 07:41:04',1,'sdfdsfs','fsdf','fdsfds','RE'),(12,0,333,'2017-12-18 07:41:54',1,'dsfdsf','333','erwrw','AC'),(13,0,0,'2017-12-18 08:00:03',1,'','','','AC'),(14,1,0,'2017-12-26 02:05:21',1,'','','','AC'),(15,1,0,'2017-12-26 02:05:31',1,'','','','RE'),(16,0,0,'2017-12-26 02:05:39',1,'','','','AC'),(17,1,0,'2018-01-12 16:09:58',1,'','','','AC'),(18,2,200,'2018-01-15 16:12:57',3,'cambio estado test','juan perez','ma√±ana','RE'),(19,2,300,'2018-01-15 16:13:35',3,'reparado','jose de los palotes','tarde','RE'),(20,2,400,'2018-01-15 16:14:15',3,'activado nuevamente','pepe ponce','noche','AC'),(21,5,0,'2018-01-17 12:01:37',1,'','','','RE'),(22,9,344,'2018-01-17 12:07:12',1,'weqeqwe','wewqe','qweqe','RE'),(23,11,2000,'2018-01-26 17:14:48',1,'no operativo','rs','ma√±ana','AC'),(24,11,2010,'2018-01-26 17:19:56',1,'operarico','rs','ma√±ana','AC'),(60,7,0,'2018-09-03 04:55:43',1,'','','','AC'),(59,7,0,'2018-09-03 04:46:40',1,'','','','RE'),(58,7,0,'2018-09-03 04:31:54',1,'','','','RE'),(57,2,666,'2018-09-01 08:57:16',1,'666','666','666','AC'),(56,8,555,'2018-09-01 08:54:45',1,'555','555','555','AC'),(33,10,0,'2018-03-06 13:10:52',1,'','','','RE'),(34,10,0,'2018-03-06 13:11:44',1,'','','','AC'),(35,10,0,'2018-03-09 12:57:53',1,'','','','RE'),(36,9,122,'2018-03-21 13:23:05',3,'se rompio','juan','ma√±ana','RE'),(37,10,34,'2018-03-21 13:24:21',3,'agfgadf','ya','a','RE'),(38,4,0,'2018-03-22 11:04:05',3,'','','','RE'),(39,4,0,'2018-03-22 11:04:43',3,'','','','RE'),(40,4,150,'2018-05-24 12:58:46',3,'sarasa','Hugo','ma√±ana','AC'),(41,4,500,'2018-06-19 15:42:25',3,'se rompio','yop','ma√±ana','RE'),(42,4,486,'2018-06-19 15:55:46',3,'todo ok','hugo g','tarde','AC'),(43,4,0,'2018-07-03 15:38:49',1,'','','','RE'),(44,3,0,'2018-07-03 15:39:24',1,'','','','RE'),(45,2,0,'2018-07-03 21:15:48',1,'','','','RE'),(46,3,0,'2018-07-03 21:16:03',1,'','','','RE'),(47,4,0,'2018-07-05 09:47:32',1,'','','','AC'),(48,1,0,'2018-07-06 09:34:40',1,'','','','RE'),(49,1,23,'2018-07-27 03:05:45',1,'saddad','sadadsa','dsad','RE'),(50,1,234,'2018-08-11 05:50:38',1,'dsadas','445','444','RE'),(51,1,0,'2018-08-21 23:46:15',1,'','','','RE'),(52,1,0,'2018-09-01 03:29:28',1,'asdadas','sdaddasds','dddd','RE'),(53,1,3333,'2018-09-01 03:29:51',1,'dsadsa','33','333','RE'),(54,8,123,'2018-09-01 08:34:17',1,'123','123','123','RE'),(55,4,234,'2018-09-01 08:35:56',1,'234','234','234','RE'),(61,2,34,'2018-09-13 04:05:12',1,'wqeqwe','weqe','34','RE'),(62,10,12,'2018-09-16 04:40:29',1,'lalala','perez','noche',''),(63,13,5000,'2018-09-24 18:22:13',16,'rompio la maquina ese hdp','javier molina','dia',''),(64,3,2,'2018-09-24 18:55:36',1,'2','2','2','RE'),(65,3,3,'2018-09-24 18:56:42',1,'3','3','3','AC'),(66,3,12,'2018-09-24 19:03:49',1,'12','12','12','RE'),(67,3,32,'2018-09-24 19:06:54',1,'32','32','32','RE'),(68,3,12,'2018-09-24 19:10:02',1,'12','12','12','AC'),(69,3,23,'2018-09-24 19:10:13',1,'23','23','23','RE'),(70,3,0,'2018-09-24 19:10:17',1,'','','','RE'),(71,3,0,'2018-09-24 19:14:55',1,'','','','AC'),(72,3,0,'2018-09-24 19:15:02',1,'','','','RE'),(73,13,0,'2018-09-24 19:15:46',19,'','','','RE'),(74,3,0,'2018-09-25 09:43:34',1,'','','','AC'),(75,3,0,'2018-09-25 09:45:45',1,'','','','AC'),(76,3,0,'2018-09-25 09:45:52',1,'','','','AC'),(77,3,0,'2018-09-25 09:46:13',1,'nuevaaaaaaa','','','AC'),(78,3,122,'2018-09-25 09:53:57',1,'','Pablo Paz','','AC'),(79,3,0,'2018-09-25 17:43:04',1,'','','','AC'),(80,3,0,'2018-09-25 17:43:13',17,'','','','AC'),(81,9,2,'2018-10-01 09:26:48',1,'2','2','2','RE'),(82,9,3,'2018-10-01 09:32:32',1,'3','3','3','AC'),(83,18,3,'2018-10-03 23:09:32',1,'3','3','3','RE'),(84,5,1111111,'2018-10-05 10:46:36',1,'wwwwwwwwww','Pablo Paz','Ma√±ana','AC'),(85,5,5670,'2018-10-05 16:12:14',19,'Fuga de aceite','R. S√°nchez','Ma√±ana','RE'),(86,15,11,'2018-10-08 08:59:36',18,'falta agua','dede','d','RE'),(87,15,0,'2018-10-08 09:01:27',18,'gg','ll','d','AC'),(88,5,11,'2018-10-08 11:44:54',1,'nueva lectura','Pablo Paz','Ma√±ana','RE'),(89,5,45,'2018-10-08 11:47:04',1,'sdakdhka','juan perez','34','RE'),(90,5,12,'2018-10-08 11:48:11',1,'nuevo ','Pablo Paez','Tarde','RE'),(91,13,0,'2018-10-09 12:17:37',18,'Cambio de v√°lvula de pilotaje, falta conector ','admin','b','');
/*!40000 ALTER TABLE `historial_lecturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infocomponentes`
--

DROP TABLE IF EXISTS `infocomponentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infocomponentes` (
  `infocompid` int(11) NOT NULL AUTO_INCREMENT,
  `infocompdescrip` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`infocompid`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infocomponentes`
--

LOCK TABLES `infocomponentes` WRITE;
/*!40000 ALTER TABLE `infocomponentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `infocomponentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infoequipos`
--

DROP TABLE IF EXISTS `infoequipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infoequipos` (
  `infoid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`infoid`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infoequipos`
--

LOCK TABLES `infoequipos` WRITE;
/*!40000 ALTER TABLE `infoequipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `infoequipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacionequipo`
--

DROP TABLE IF EXISTS `informacionequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacionequipo` (
  `id_informacion` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_informacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1088 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacionequipo`
--

LOCK TABLES `informacionequipo` WRITE;
/*!40000 ALTER TABLE `informacionequipo` DISABLE KEYS */;
INSERT INTO `informacionequipo` VALUES (1081,'titulo 1','descr 1',51,6),(1082,'titulo 2','desc 2',51,6),(1083,'titulo3','desc3',52,6),(1084,'0101','0101',12,6),(1085,'666','666',13,6),(1086,'aaaa','aaaa aaaa',10,6),(1087,'bbbb','bbbb bbbb',10,6);
/*!40000 ALTER TABLE `informacionequipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcasequipos`
--

DROP TABLE IF EXISTS `marcasequipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcasequipos` (
  `marcaid` int(11) NOT NULL AUTO_INCREMENT,
  `marcadescrip` varchar(255) DEFAULT NULL,
  `estado` varchar(3) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`marcaid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcasequipos`
--

LOCK TABLES `marcasequipos` WRITE;
/*!40000 ALTER TABLE `marcasequipos` DISABLE KEYS */;
INSERT INTO `marcasequipos` VALUES (1,'TamRock','AC',6),(2,'Black & Decker','AC',6),(3,'Bahco','AC',6),(4,'Caterpillar','AC',6),(5,'Komatsu','AC',6),(6,'Toyota','AC',6),(7,'Cathh','AN',7),(8,'test','AN',7),(9,'666','AN',7),(10,'DRILLTECH','AN',7),(11,'Atlas Copco','AC',7),(12,'Atlas Copco','AC',7),(13,'Sandvik','AC',7),(14,'Soosan','AC',7),(15,'Caterpillar','AC',7),(16,'Parquer','AC',7),(17,'Deninson','AC',7),(18,'Rexvrock','AC',7),(19,'SNAP ON','AC',7),(20,'WILLIAMS ','AC',7),(21,'GEDORE ','AC',7),(22,'MOTOROLA ','AC',7),(23,'REDLINE','AC',7),(24,'IRIMO ','AC',7),(25,'FLUKE ','AC',7),(26,'ANDES SAM ','AC',7),(27,'STANLEY ','AC',7),(28,'CROSS MASTER ','AC',7),(29,'BULIT ','AC',7),(30,'TRUPER','AC',7),(31,'HP ','AC',7),(32,'S-M ','AC',7),(33,'TACTIX ','AC',7),(34,'UTUSTOOLS','AC',7),(35,'BAHCO','AC',7);
/*!40000 ALTER TABLE `marcasequipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_a√±o`
--

DROP TABLE IF EXISTS `modelo_a√±o`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_a√±o` (
  `id_a√±o` int(100) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(10) NOT NULL,
  PRIMARY KEY (`id_a√±o`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_a√±o`
--

LOCK TABLES `modelo_a√±o` WRITE;
/*!40000 ALTER TABLE `modelo_a√±o` DISABLE KEYS */;
INSERT INTO `modelo_a√±o` VALUES (1,'wqeqewqeqw');
/*!40000 ALTER TABLE `modelo_a√±o` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_insumos`
--

DROP TABLE IF EXISTS `orden_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_insumos` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `solicitante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destino` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comprobante` int(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_ot` int(11) NOT NULL,
  PRIMARY KEY (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_insumos`
--

LOCK TABLES `orden_insumos` WRITE;
/*!40000 ALTER TABLE `orden_insumos` DISABLE KEYS */;
INSERT INTO `orden_insumos` VALUES (1,'2018-10-01','111','',1,6,11),(2,'2018-10-02','222','',2,6,22),(3,'2018-10-03','333','',3,6,33),(4,'2018-10-05','555','',5,6,5),(5,'2018-10-04','444','',4,6,144),(6,'2018-10-06','666','',6,6,66),(7,'2018-10-22','4444','',4,6,5),(8,'2018-10-25','huggo','',123456,6,55);
/*!40000 ALTER TABLE `orden_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_pedido`
--

DROP TABLE IF EXISTS `orden_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_pedido` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `nro_trabajo` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `fecha_entregada` datetime NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_trabajo` int(11) NOT NULL,
  `observacion` text NOT NULL,
  `numero_remito` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_trabajo` (`id_trabajo`),
  KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_pedido`
--

LOCK TABLES `orden_pedido` WRITE;
/*!40000 ALTER TABLE `orden_pedido` DISABLE KEYS */;
INSERT INTO `orden_pedido` VALUES (1,1,501,'pedido prueba','2017-05-10 00:00:00','2017-05-11 00:00:00','2017-11-27 10:09:09','E',1,'',3344,6),(2,3,5011,'prueba','2017-05-10 00:00:00','2017-05-10 00:00:00','0000-00-00 00:00:00','P',16,'',NULL,6),(3,4,5011,'ahorasi ','2017-05-10 00:00:00','2017-05-10 00:00:00','0000-00-00 00:00:00','P',16,'',NULL,6),(4,5,301,'cargando pedido gemma','2017-05-10 00:00:00','2017-05-11 00:00:00','0000-00-00 00:00:00','P',18,'',NULL,6),(5,9,602,'pedido de prueba 3','2017-05-10 00:00:00','2017-05-10 00:00:00','2017-08-14 19:35:47','E',18,'',123456,6),(6,3,91,'ORDEN DE PEDIDO NUMERO 91 ASOCIADA A LA 90','2017-07-20 00:00:00','2017-07-21 00:00:00','0000-00-00 00:00:00','P',16,'',NULL,6),(7,5,902,'asociada a la orden numero 902','2017-07-20 00:00:00','2017-07-20 00:00:00','0000-00-00 00:00:00','P',20,'',NULL,6),(8,7,9020,'orden de pedido asociada a la orden de trabajo  numero 90 op 9020','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',20,'',NULL,6),(9,7,950,'OT numero de pedido 950','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',21,'',NULL,6),(10,8,9090,'op 9090','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',20,'',NULL,6),(11,8,9670,'OP nro 9697120','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',23,'',NULL,6),(12,9,96969,'OP nro 96969','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',22,'',NULL,6),(13,6,96969,'OT NRO 96969','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',22,'',NULL,6),(14,4,14140,'OP nuevo','2017-08-11 00:00:00','2017-08-18 00:00:00','0000-00-00 00:00:00','P',17,'',NULL,6),(15,12,78998797,'4 ca√±√±os largos','0000-00-00 00:00:00','0000-00-00 00:00:00','2017-08-14 19:37:38','E',18,'',79456,6),(16,13,987987,'6 ca√±os ciuadrados','0000-00-00 00:00:00','0000-00-00 00:00:00','2017-08-14 20:28:31','E',18,'',16,6),(17,13,7898798,'4 docenas de bolunes','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','P',18,'',NULL,6),(18,4,99,'aceite\narrancador','2017-08-15 00:00:00','2017-08-17 00:00:00','2017-08-15 11:05:19','E',31,'',798987,6),(19,4,14,'pedido de ppriieba 123456','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','P',20,'',NULL,6),(20,4,1514,'OT DE PEDIDO','2017-08-16 00:00:00','2017-08-23 00:00:00','0000-00-00 00:00:00','P',19,'',NULL,6),(21,4,16,'dadadada pedidonuevo ','0000-00-00 00:00:00','2017-09-01 00:00:00','2017-09-01 14:19:26','E',34,'',1666,6),(22,4,45646,'comprar mas memoria','0000-00-00 00:00:00','0000-00-00 00:00:00','2017-09-19 10:31:06','E',38,'',123,6),(23,2,23,'sadadsad','0000-00-00 00:00:00','2017-11-04 00:00:00','2017-12-11 11:18:59','E',8,'',22323,6),(24,1,1414,'141414','0000-00-00 00:00:00','2017-12-01 00:00:00','0000-00-00 00:00:00','P',23,'',NULL,6),(25,1,22222,'aSAsaSAsaS','2017-12-11 11:13:18','2017-12-11 00:00:00','0000-00-00 00:00:00','P',16,'',NULL,6),(26,2,55,'p','2017-12-12 18:46:56','2017-12-14 00:00:00','0000-00-00 00:00:00','P',17,'',NULL,6),(27,1,5454,'detallle','2018-06-22 11:04:24','2018-06-22 00:00:00','0000-00-00 00:00:00','P',532,'',NULL,6),(28,1,0,'pedido test 1','2018-06-25 12:40:44','2018-07-02 00:00:00','0000-00-00 00:00:00','P',536,'',NULL,6),(29,2,0,'pedido test 2 ','2018-06-25 13:48:11','2018-07-03 00:00:00','0000-00-00 00:00:00','P',536,'',NULL,6),(30,2,11111,'orden de  pedido de prueba administracion','2018-06-28 16:01:19','2018-06-29 00:00:00','0000-00-00 00:00:00','P',538,'',NULL,6),(31,2,1111,'pedido test asociado a ot con id 538','2018-06-29 11:11:06','2018-07-06 00:00:00','0000-00-00 00:00:00','P',538,'',NULL,0),(32,0,48956,'Nueva nota de pedido','2018-09-19 10:15:18','2018-09-26 00:00:00','0000-00-00 00:00:00','P',510,'',NULL,0),(33,1,11223344,'eli probando','2018-10-05 12:14:01','2018-10-25 00:00:00','0000-00-00 00:00:00','P',510,'',NULL,0),(34,2,112233,'eliiiiii','2018-10-05 12:14:34','2018-10-23 00:00:00','0000-00-00 00:00:00','P',510,'',NULL,0),(35,2,123,'eli 2','2018-10-05 12:16:12','2018-10-19 00:00:00','0000-00-00 00:00:00','P',510,'',NULL,0),(36,1,1357,'eli 99','2018-10-05 12:17:02','2018-11-22 00:00:00','0000-00-00 00:00:00','P',510,'',NULL,0),(37,1,222222,'no guarda','2018-10-05 12:17:42','0000-00-00 00:00:00','0000-00-00 00:00:00','P',510,'',NULL,0),(38,1,9900,'no anda','2018-10-05 12:18:12','2018-10-17 00:00:00','0000-00-00 00:00:00','P',510,'',NULL,0),(39,-1,0,'','2018-10-05 12:23:25','0000-00-00 00:00:00','0000-00-00 00:00:00','P',510,'',NULL,0);
/*!40000 ALTER TABLE `orden_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_servicio` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `lectura` double DEFAULT NULL,
  `fecha` date NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  `id_solicitudreparacion` int(11) NOT NULL,
  `valesid` int(11) DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_ordenherraminetas` int(11) DEFAULT NULL,
  `id_orden_insumo` int(11) DEFAULT NULL,
  `id_ot` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `fechahorainicio` datetime NOT NULL,
  `fechahorafin` datetime NOT NULL,
  `horometroinicio` double NOT NULL,
  `horometrofin` double NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_empresaservicio` (`id_contratista`),
  KEY `id_solicitudreparacion` (`id_solicitudreparacion`),
  KEY `id_orden_insumo` (`id_orden_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (1,NULL,'2018-10-23','',4,0,12,27,'C',NULL,NULL,160,6,'2018-10-02 19:37:04','2018-10-06 19:37:08',221,218);
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_trabajo`
--

DROP TABLE IF EXISTS `orden_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_trabajo` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_tarea` int(11) DEFAULT NULL,
  `nro` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_program` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `fecha_terminada` datetime NOT NULL,
  `fecha_aviso` datetime NOT NULL,
  `fecha_entregada` datetime NOT NULL,
  `descripcion` text NOT NULL,
  `cliId` int(11) NOT NULL DEFAULT '1',
  `estado` varchar(2) NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT '1',
  `id_usuario_a` int(11) NOT NULL,
  `id_usuario_e` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL DEFAULT '1',
  `id_proveedor` int(11) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `duracion` double NOT NULL,
  `id_tareapadre` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `lectura_programada` double NOT NULL,
  `lectura_ejecutada` double NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `orden_trabajo_ibfk_1` (`cliId`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `id_usuariosolicitante` (`id_usuario_a`) USING BTREE,
  KEY `usuario_entrega` (`id_usuario_e`) USING BTREE,
  KEY `id_sucursal` (`id_sucursal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_trabajo`
--

LOCK TABLES `orden_trabajo` WRITE;
/*!40000 ALTER TABLE `orden_trabajo` DISABLE KEYS */;
INSERT INTO `orden_trabajo` VALUES (1,0,'1','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:44:25','2017-11-08 10:47:45','2017-11-08 10:47:45','2017-11-08 10:47:45','2017-11-08 10:47:45','rotura de rueda',13,'C',1,1,1,1,0,1,'1',0,60,NULL,6,0,0),(2,0,'4','0000-00-00','0000-00-00 00:00:00','2017-11-08 00:00:00','2017-11-29 00:00:00','2017-11-23 08:39:37','2017-11-08 10:48:19','2017-12-10 00:00:00','sadasdas',13,'E',1,1,1,1,0,4,'1',0,60,NULL,6,0,0),(3,0,'4','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:47:21','2017-11-08 10:58:41','2017-11-08 10:58:41','2017-11-08 10:58:41','2017-11-08 10:58:41','sadasdas',1,'C',1,1,1,1,0,4,'2',0,60,NULL,6,0,0),(4,4,'4','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:47:21','2017-11-08 12:52:35','2017-11-08 12:52:35','2017-11-08 12:52:35','2017-11-08 12:52:35','sadasdas',1,'C',1,1,1,1,0,4,'2',0,60,NULL,6,0,0),(5,0,'1','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:44:25','2017-11-09 16:09:14','2017-11-09 16:09:14','2017-11-09 16:09:14','2017-11-09 16:09:14','rotura de rueda',13,'C',1,1,1,1,0,1,'3',0,60,NULL,6,0,0),(6,0,'5','0000-00-00','0000-00-00 00:00:00','2017-11-08 12:53:19','2017-12-09 16:09:34','2017-11-09 16:09:34','2017-11-09 16:09:34','2017-11-09 16:09:34','observc test2',1,'C',1,1,1,1,1,5,'3',0,60,NULL,6,0,0),(7,0,'5','0000-00-00','0000-00-00 00:00:00','2017-11-08 12:53:19','2017-12-07 10:38:07','2017-11-13 10:38:07','2017-11-13 10:38:07','2017-11-13 10:38:07','observc test2',1,'C',1,1,1,1,1,5,'3',0,60,NULL,6,0,0),(8,0,'1','0000-00-00','0000-00-00 00:00:00','2017-11-08 00:00:00','0000-00-00 00:00:00','2017-11-14 14:39:59','2017-11-14 14:39:59','2017-11-14 14:39:59','rotura de rueda',13,'P',1,1,1,1,1,1,'2',0,60,NULL,6,0,0),(9,0,'6','0000-00-00','0000-00-00 00:00:00','2017-11-14 15:23:31','2017-11-14 15:38:02','2017-11-14 15:38:02','2017-11-14 15:38:02','2017-11-14 15:38:02','Rotura de llanta',13,'C',5,5,5,1,0,6,'3',0,60,NULL,6,0,0),(10,0,'6','0000-00-00','0000-00-00 00:00:00','2017-11-14 15:23:31','2017-11-14 15:42:27','2017-11-14 15:42:27','2017-11-14 15:42:27','2017-11-14 15:42:27','Rotura de llanta',13,'C',5,5,5,1,0,6,'1',0,60,NULL,6,0,0),(11,0,'1','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:44:25','2017-11-23 08:26:01','2017-11-23 08:26:01','2017-11-23 08:26:01','2017-11-23 08:26:01','rotura de rueda',1,'C',1,1,1,1,0,1,'3',0,60,NULL,6,0,0),(12,0,'6','0000-00-00','0000-00-00 00:00:00','2017-11-14 15:23:31','2017-11-17 08:25:52','2017-11-28 08:25:52','2017-11-28 08:25:52','2017-11-28 08:25:52','Rotura de llanta',1,'C',3,3,3,1,0,6,'',0,60,NULL,6,0,0),(13,0,'6','0000-00-00','0000-00-00 00:00:00','2017-11-14 15:23:31','2017-12-22 08:26:22','2017-11-28 08:26:22','2017-11-28 08:26:22','2017-11-28 08:26:22','Rotura de llanta',1,'C',3,3,3,1,0,6,'',0,60,NULL,6,0,0),(14,0,'5','0000-00-00','0000-00-00 00:00:00','2017-11-08 12:53:19','2017-12-12 10:58:50','2017-11-28 10:58:50','2017-11-28 10:58:50','2017-11-28 10:58:50','observc test2',13,'C',3,3,3,1,0,5,'1',0,60,NULL,6,0,0),(15,NULL,'1','0000-00-00','0000-00-00 00:00:00','2017-12-07 10:44:25','2017-12-06 12:04:24','2017-11-28 12:04:24','2017-11-28 12:04:24','2017-11-28 12:04:24','rotura de rueda',1,'C',3,3,3,1,0,1,'2',0,60,NULL,6,0,0),(16,1,'3','0000-00-00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2018-07-30 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'T',3,1,0,1,0,0,'5',1,60,NULL,6,0,0),(17,1,'3','0000-00-00','0000-00-00 00:00:00','0000-00-00 00:00:00','2018-09-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,3,0,1,0,0,'5',1,60,NULL,6,0,0),(18,1,'1','0000-00-00','0000-00-00 00:00:00','2017-12-14 10:44:25','0000-00-00 00:00:00','2017-11-28 13:16:25','2017-11-28 13:16:25','2017-11-28 13:16:25','rotura de rueda',1,'As',3,0,3,1,2,1,'2',2,60,NULL,6,0,0),(19,1,'4','0000-00-00','0000-00-00 00:00:00','2017-12-30 00:00:00','2017-12-09 00:00:00','2017-12-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Backlog',1,'T',3,1,0,1,0,0,'4',1,60,NULL,6,0,0),(20,1,'4','0000-00-00','0000-00-00 00:00:00','0002-01-08 20:00:00','2017-12-20 00:00:00','2017-12-18 00:00:00','0000-00-00 00:00:00','2017-12-27 00:00:00','Predictivo',1,'E',3,1,0,1,0,0,'5',1,60,NULL,6,0,0),(21,1,'4','0000-00-00','0000-00-00 00:00:00','2017-12-21 00:00:00','2017-12-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,4,0,1,0,0,'5',1,60,NULL,6,0,0),(22,NULL,'7','0000-00-00','0000-00-00 00:00:00','2017-12-01 05:35:25','2017-12-13 00:00:00','2017-12-01 05:35:44','2017-12-01 05:35:44','2017-12-01 05:35:44','Falla test sobre RS-0001 (01-12)',1,'As',3,6,3,1,0,7,'2',2,60,NULL,6,0,0),(23,1,'3','0000-00-00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',1,1,0,1,0,0,'5',1,60,NULL,6,0,0),(25,NULL,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Preventivo',1,'C',1,0,0,1,0,0,'2',1,60,NULL,6,0,0),(26,1,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','2017-12-29 00:00:00','2017-12-27 00:00:00','0000-00-00 00:00:00','2018-06-27 00:00:00','Preventivo',1,'E',1,1,1,1,0,1,'2',1,60,NULL,6,0,0),(27,1,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','2017-12-28 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Preventivo',1,'As',1,6,1,1,0,0,'2',1,60,NULL,6,0,0),(28,1,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','2017-12-11 00:00:00','2017-12-18 00:00:00','0000-00-00 00:00:00','2018-09-20 00:00:00','Preventivo',1,'E',1,1,1,1,0,0,'2',3,60,NULL,6,0,0),(29,1,'8','0000-00-00','0000-00-00 00:00:00','2017-12-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Backlog',1,'As',1,0,0,1,0,0,'4',3,60,NULL,6,0,0),(30,1,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','0000-00-00 00:00:00','2017-12-12 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Preventivo',1,'As',1,1,1,1,0,0,'2',3,60,NULL,6,0,0),(31,1,'6','0000-00-00','0000-00-00 00:00:00','2017-12-11 00:00:00','2017-12-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',1,1,0,1,0,0,'5',2,60,NULL,6,0,0),(32,1,'6','0000-00-00','0000-00-00 00:00:00','2017-12-11 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',1,1,1,1,0,0,'5',2,60,NULL,6,0,0),(33,1,'6','0000-00-00','0000-00-00 00:00:00','2017-12-11 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',1,1,1,1,0,0,'5',2,60,NULL,6,0,0),(34,1,'6','0000-00-00','0000-00-00 00:00:00','2017-12-11 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',1,1,1,1,0,0,'5',2,60,NULL,6,0,0),(35,2,'9','0000-00-00','0000-00-00 00:00:00','2017-12-12 00:00:00','2017-12-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Backlog',1,'As',1,1,1,1,0,0,'4',2,60,NULL,6,0,0),(36,NULL,'100','0000-00-00','0000-00-00 00:00:00','2017-12-12 21:22:00','2017-12-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','prueba',1,'As',3,1,1,1,2,0,'1',2,60,NULL,6,0,0),(37,2,'9','0000-00-00','0000-00-00 00:00:00','2017-12-12 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Backlog',1,'As',1,1,1,1,0,0,'4',2,60,NULL,6,0,0),(38,1,'10','0000-00-00','0000-00-00 00:00:00','2018-01-10 00:00:00','0000-00-00 00:00:00','2018-01-12 00:00:00','0000-00-00 00:00:00','2018-01-12 00:00:00','Backlog',1,'E',1,1,1,1,0,0,'4',1,60,NULL,6,0,0),(39,1,'11','0000-00-00','0000-00-00 00:00:00','2018-01-20 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Backlog',1,'As',1,0,0,1,0,0,'4',2,60,NULL,6,0,0),(40,1,'2','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:45:54','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','assdas',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(41,1,'9','0000-00-00','0000-00-00 00:00:00','2018-01-17 13:38:28','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite abajo del equipo ',1,'C',1,1,1,1,0,0,'',10,60,NULL,6,0,0),(42,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(43,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(46,1,'1','2018-01-29','2018-01-31 00:00:00','2017-11-14 15:23:31','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Rotura de llanta',1,'C',3,1,1,1,0,6,'2',2,60,NULL,6,0,0),(47,16,'1','2018-01-29','2018-01-30 00:00:00','2018-02-10 00:00:00','2018-03-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,5,1,1,0,8,'5',4,60,NULL,6,0,0),(48,1,'1','2018-01-29','2018-01-29 00:00:00','2017-12-01 05:35:25','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Falla test sobre RS-0001 (01-12)',1,'C',3,1,1,1,0,7,'2',2,60,NULL,6,0,0),(49,16,'1','2018-01-29','2018-01-29 00:00:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,8,'5',4,60,NULL,6,0,0),(50,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(51,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(52,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(53,NULL,'12','0000-00-00','0000-00-00 00:00:00','2018-01-30 14:06:43','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','No tiene fuerza para levantar la carga',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(54,NULL,'12','0000-00-00','0000-00-00 00:00:00','2018-01-30 14:06:43','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','No tiene fuerza para levantar la carga',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(55,NULL,'12','0000-00-00','0000-00-00 00:00:00','2018-01-30 14:06:43','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','No tiene fuerza para levantar la carga',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(56,NULL,'7','0000-00-00','0000-00-00 00:00:00','2017-12-01 05:35:25','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Falla test sobre RS-0001 (01-12)',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(57,1,'1','2018-02-08','2018-02-08 00:00:00','2017-11-08 10:44:25','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','rotura de rueda',1,'AN',1,1,1,1,0,1,'2',1,60,NULL,6,0,0),(58,NULL,'13','0000-00-00','0000-00-00 00:00:00','2018-02-05 19:01:38','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','bateria descargada\n\n',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(59,NULL,'15','0000-00-00','0000-00-00 00:00:00','2018-02-05 19:46:36','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','ggggjffufjffg',1,'C',1,1,1,1,0,0,'',0,60,NULL,6,0,0),(60,8,'1','2018-02-08','2018-01-08 15:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40',1,'C',1,1,1,1,0,16,'3',4,60,NULL,6,0,0),(61,4,'1','2018-02-08','2018-01-12 15:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,NULL,6,0,0),(62,4,'1','2018-02-17','2018-02-17 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,6,0,0),(63,4,'1','2018-02-17','2018-03-04 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,6,0,0),(64,4,'1','2018-02-17','2018-03-19 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,6,0,0),(65,4,'1','2018-02-17','2018-04-03 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,6,0,0),(66,4,'1','2018-02-17','2018-04-18 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,6,0,0),(67,4,'1','2018-02-17','2018-05-03 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,6,0,0),(68,4,'1','2018-02-17','2018-05-18 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,6,0,0),(69,4,'1','2018-02-17','2018-06-02 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,8,'3',6,60,11,6,0,0),(70,4,'1','2018-02-17','2018-06-17 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,9,'3',6,60,11,6,0,0),(71,4,'1','2018-02-17','2018-07-02 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,6,0,0),(72,16,'1','2018-02-17','2018-02-17 20:00:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(73,16,'1','2018-02-17','2018-02-19 15:20:00','2018-02-10 00:00:00','2018-03-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,1,1,1,0,8,'5',4,60,8,6,0,0),(74,4,'1','2018-02-18','2018-02-18 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(75,4,'1','2018-02-18','2018-03-05 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(76,4,'1','2018-02-18','2018-03-20 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(77,4,'1','2018-02-18','2018-04-04 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(78,4,'1','2018-02-18','2018-04-19 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(79,4,'1','2018-02-18','2018-05-04 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(80,4,'1','2018-02-18','2018-05-19 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(81,4,'1','2018-02-18','2018-06-03 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(82,4,'1','2018-02-18','2018-06-18 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(83,4,'1','2018-02-18','2018-07-03 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(84,4,'1','2018-02-18','2018-07-18 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(85,4,'1','2018-02-18','2018-08-02 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(86,4,'1','2018-02-18','2018-08-17 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(87,4,'1','2018-02-18','2018-09-01 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(88,4,'1','2018-02-18','2018-09-16 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(89,4,'1','2018-02-18','2018-10-01 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(90,4,'1','2018-02-18','2018-10-16 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(91,4,'1','2018-02-18','2018-10-31 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(92,4,'1','2018-02-18','2018-11-15 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(93,4,'1','2018-02-18','2018-11-30 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(94,4,'1','2018-02-18','2018-12-15 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(95,4,'1','2018-02-18','2018-12-30 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(96,4,'1','2018-02-18','2019-01-14 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(97,4,'1','2018-02-18','2019-01-29 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(98,4,'1','2018-02-18','2019-02-13 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(99,4,'1','2018-02-18','2019-02-28 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(100,4,'1','2018-02-18','2019-03-15 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(101,4,'1','2018-02-18','2019-03-30 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(102,4,'1','2018-02-18','2019-04-14 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(103,4,'1','2018-02-18','2019-04-29 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(104,4,'1','2018-02-18','2019-05-14 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(105,4,'1','2018-02-18','2019-05-29 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(106,4,'1','2018-02-18','2019-06-13 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(107,4,'1','2018-02-18','2019-06-28 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(108,4,'1','2018-02-18','2019-07-13 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(109,4,'1','2018-02-18','2019-07-28 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(110,4,'1','2018-02-18','2019-08-12 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(111,4,'1','2018-02-18','2019-08-27 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(112,4,'1','2018-02-18','2019-09-11 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(113,4,'1','2018-02-18','2019-09-26 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(114,4,'1','2018-02-18','2019-10-11 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(115,4,'1','2018-02-18','2019-10-26 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(116,4,'1','2018-02-18','2019-11-10 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(117,4,'1','2018-02-18','2019-11-25 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(118,4,'1','2018-02-18','2019-12-10 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(119,4,'1','2018-02-18','2019-12-25 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(120,4,'1','2018-02-18','2020-01-09 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(121,4,'1','2018-02-18','2020-01-24 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(122,4,'1','2018-02-18','2020-02-08 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(123,4,'1','2018-02-18','2020-02-23 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(124,4,'1','2018-02-18','2020-03-09 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(125,4,'1','2018-02-18','2020-03-24 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(126,4,'1','2018-02-18','2020-04-08 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(127,4,'1','2018-02-18','2020-04-23 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(128,4,'1','2018-02-18','2020-05-08 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(129,4,'1','2018-02-18','2020-05-23 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(130,4,'1','2018-02-18','2020-06-07 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(131,4,'1','2018-02-18','2020-06-22 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(132,4,'1','2018-02-18','2020-07-07 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(133,4,'1','2018-02-18','2020-07-22 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(134,4,'1','2018-02-18','2020-08-06 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(135,4,'1','2018-02-18','2020-08-21 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(136,4,'1','2018-02-18','2020-09-05 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(137,4,'1','2018-02-18','2020-09-20 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(138,4,'1','2018-02-18','2020-10-05 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(139,4,'1','2018-02-18','2020-10-20 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(140,4,'1','2018-02-18','2020-11-04 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(141,4,'1','2018-02-18','2020-11-19 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(142,4,'1','2018-02-18','2020-12-04 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(143,4,'1','2018-02-18','2020-12-19 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(144,5,'1','2018-02-18','2018-02-18 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(145,5,'1','2018-02-18','2018-03-20 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(146,5,'1','2018-02-18','2018-04-19 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(147,5,'1','2018-02-18','2018-05-19 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(148,5,'1','2018-02-18','2018-06-18 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(149,5,'1','2018-02-18','2018-07-18 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(150,5,'1','2018-02-18','2018-08-17 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(151,5,'1','2018-02-18','2018-09-16 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(152,5,'1','2018-02-18','2018-10-16 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(153,5,'1','2018-02-18','2018-11-15 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(154,5,'1','2018-02-18','2018-12-15 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(155,5,'1','2018-02-18','2019-01-14 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(156,5,'1','2018-02-18','2019-02-13 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(157,5,'1','2018-02-18','2019-03-15 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(158,5,'1','2018-02-19','2018-02-19 03:30:00','2018-01-18 00:00:00','2018-09-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'As',1,5,1,1,0,12,'3',4,60,12,6,0,0),(159,5,'1','2018-02-19','2018-02-26 03:30:00','2018-01-18 00:00:00','2018-09-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'As',1,12,1,1,0,12,'3',4,60,12,6,0,0),(160,5,'1','2018-02-19','2018-03-05 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,9,'3',4,60,12,6,0,0),(161,5,'1','2018-02-19','2018-03-12 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,8,'3',4,60,12,6,0,0),(162,5,'1','2018-02-19','2018-03-19 03:30:00','2018-01-18 00:00:00','2018-09-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'As',1,15,1,1,0,11,'3',4,60,12,6,0,0),(163,5,'1','2018-02-19','2018-03-26 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(164,5,'1','2018-02-19','2018-04-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(165,5,'1','2018-02-19','2018-04-09 03:30:00','2018-01-18 00:00:00','2018-09-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'As',1,4,1,1,0,12,'3',4,60,12,6,0,0),(166,5,'1','2018-02-19','2018-04-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(167,5,'1','2018-02-19','2018-04-23 03:30:00','2018-01-18 00:00:00','2018-08-30 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'As',1,2,1,1,0,12,'3',4,60,12,6,0,0),(168,5,'1','2018-02-19','2018-04-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(169,5,'1','2018-02-19','2018-05-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(170,5,'1','2018-02-19','2018-05-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(171,5,'1','2018-02-19','2018-05-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(172,5,'1','2018-02-19','2018-05-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(173,5,'1','2018-02-19','2018-06-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(174,5,'1','2018-02-19','2018-06-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(175,5,'1','2018-02-19','2018-06-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(176,5,'1','2018-02-19','2018-06-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(177,5,'1','2018-02-19','2018-07-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,120,12,6,0,0),(178,5,'1','2018-02-19','2018-07-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(179,5,'1','2018-02-19','2018-07-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(180,5,'1','2018-02-19','2018-07-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(181,5,'1','2018-02-19','2018-07-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(182,5,'1','2018-02-19','2018-08-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(183,5,'1','2018-02-19','2018-08-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(184,5,'1','2018-02-19','2018-08-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(185,5,'1','2018-02-19','2018-08-29 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(186,5,'1','2018-02-19','2018-09-03 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(187,5,'1','2018-02-19','2018-09-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(188,5,'1','2018-02-19','2018-09-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(189,5,'1','2018-02-19','2018-09-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(190,5,'1','2018-02-19','2018-10-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(191,5,'1','2018-02-19','2018-10-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(192,5,'1','2018-02-19','2018-10-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(193,5,'1','2018-02-19','2018-10-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(194,5,'1','2018-02-19','2018-10-29 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(195,5,'1','2018-02-19','2018-11-05 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(196,5,'1','2018-02-19','2018-11-12 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(197,5,'1','2018-02-19','2018-11-19 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(198,5,'1','2018-02-19','2018-11-26 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(199,5,'1','2018-02-19','2018-12-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(200,5,'1','2018-02-19','2018-12-10 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(201,5,'1','2018-02-19','2018-12-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(202,5,'1','2018-02-19','2018-12-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(203,5,'1','2018-02-19','2018-12-31 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(204,5,'1','2018-02-19','2019-01-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(205,5,'1','2018-02-19','2019-01-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(206,5,'1','2018-02-19','2019-01-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(207,5,'1','2018-02-19','2019-01-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(208,5,'1','2018-02-19','2019-02-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(209,5,'1','2018-02-19','2019-02-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(210,5,'1','2018-02-19','2019-02-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(211,5,'1','2018-02-19','2019-02-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(212,5,'1','2018-02-19','2019-03-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(213,5,'1','2018-02-19','2019-03-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(214,5,'1','2018-02-19','2019-03-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(215,5,'1','2018-02-19','2019-03-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(216,5,'1','2018-02-19','2019-04-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(217,5,'1','2018-02-19','2019-04-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(218,5,'1','2018-02-19','2019-04-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(219,5,'1','2018-02-19','2019-04-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(220,5,'1','2018-02-19','2019-04-29 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(221,5,'1','2018-02-19','2019-05-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(222,5,'1','2018-02-19','2019-05-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(223,5,'1','2018-02-19','2019-05-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(224,5,'1','2018-02-19','2019-05-27 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(225,5,'1','2018-02-19','2019-06-03 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(226,5,'1','2018-02-19','2019-06-10 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(227,5,'1','2018-02-19','2019-06-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(228,5,'1','2018-02-19','2019-06-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(229,5,'1','2018-02-19','2019-07-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(230,5,'1','2018-02-19','2019-07-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(231,5,'1','2018-02-19','2019-07-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(232,5,'1','2018-02-19','2019-07-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(233,5,'1','2018-02-19','2019-07-29 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(234,5,'1','2018-02-19','2019-08-05 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(235,5,'1','2018-02-19','2019-08-12 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(236,5,'1','2018-02-19','2019-08-19 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(237,5,'1','2018-02-19','2019-08-26 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(238,5,'1','2018-02-19','2019-09-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(239,5,'1','2018-02-19','2019-09-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(240,5,'1','2018-02-19','2019-09-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(241,5,'1','2018-02-19','2019-09-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(242,5,'1','2018-02-19','2019-09-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(243,5,'1','2018-02-19','2019-10-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(244,5,'1','2018-02-19','2019-10-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(245,5,'1','2018-02-19','2019-10-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(246,5,'1','2018-02-19','2019-10-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(247,5,'1','2018-02-19','2019-11-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(248,5,'1','2018-02-19','2019-11-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(249,5,'1','2018-02-19','2019-11-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(250,5,'1','2018-02-19','2019-11-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(251,5,'1','2018-02-19','2019-12-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(252,5,'1','2018-02-19','2019-12-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(253,5,'1','2018-02-19','2019-12-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(254,5,'1','2018-02-19','2019-12-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(255,5,'1','2018-02-19','2019-12-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(256,5,'1','2018-02-19','2020-01-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(257,5,'1','2018-02-19','2020-01-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(258,5,'1','2018-02-19','2020-01-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(259,5,'1','2018-02-19','2020-01-27 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(260,5,'1','2018-02-19','2020-02-03 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(261,5,'1','2018-02-19','2020-02-10 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(262,5,'1','2018-02-19','2020-02-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(263,5,'1','2018-02-19','2020-02-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(264,5,'1','2018-02-19','2020-03-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(265,5,'1','2018-02-19','2020-03-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(266,5,'1','2018-02-19','2020-03-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(267,5,'1','2018-02-19','2020-03-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(268,5,'1','2018-02-19','2020-03-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(269,5,'1','2018-02-19','2020-04-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(270,5,'1','2018-02-19','2020-04-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(271,5,'1','2018-02-19','2020-04-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(272,5,'1','2018-02-19','2020-04-27 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(273,5,'1','2018-02-19','2020-05-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(274,5,'1','2018-02-19','2020-05-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(275,5,'1','2018-02-19','2020-05-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(276,5,'1','2018-02-19','2020-05-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(277,5,'1','2018-02-19','2020-06-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(278,5,'1','2018-02-19','2020-06-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(279,5,'1','2018-02-19','2020-06-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(280,5,'1','2018-02-19','2020-06-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(281,5,'1','2018-02-19','2020-06-29 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(282,5,'1','2018-02-19','2020-07-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(283,5,'1','2018-02-19','2020-07-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(284,5,'1','2018-02-19','2020-07-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(285,5,'1','2018-02-19','2020-07-27 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(286,5,'1','2018-02-19','2020-08-03 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(287,5,'1','2018-02-19','2020-08-10 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(288,5,'1','2018-02-19','2020-08-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(289,5,'1','2018-02-19','2020-08-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(290,5,'1','2018-02-19','2020-08-31 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(291,5,'1','2018-02-19','2020-09-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(292,5,'1','2018-02-19','2020-09-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(293,5,'1','2018-02-19','2020-09-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(294,5,'1','2018-02-19','2020-09-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(295,5,'1','2018-02-19','2020-10-05 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(296,5,'1','2018-02-19','2020-10-12 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(297,5,'1','2018-02-19','2020-10-19 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(298,5,'1','2018-02-19','2020-10-26 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(299,5,'1','2018-02-19','2020-11-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(300,5,'1','2018-02-19','2020-11-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(301,5,'1','2018-02-19','2020-11-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(302,5,'1','2018-02-19','2020-11-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(303,5,'1','2018-02-19','2020-11-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(304,5,'1','2018-02-19','2020-12-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(305,5,'1','2018-02-19','2020-12-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(306,5,'1','2018-02-19','2020-12-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(307,5,'1','2018-02-19','2020-12-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(308,5,'1','2018-02-19','2021-01-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(309,5,'1','2018-02-19','2021-01-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(310,5,'1','2018-02-19','2021-01-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(311,5,'1','2018-02-19','2021-01-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(312,5,'1','2018-02-19','2021-02-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(313,5,'1','2018-02-19','2021-02-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(314,5,'1','2018-02-19','2021-02-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(315,5,'1','2018-02-19','2021-02-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(316,5,'1','2018-02-19','2018-02-19 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(317,5,'1','2018-02-19','2018-02-26 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(318,5,'1','2018-02-19','2018-03-07 08:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(319,5,'1','2018-02-19','2018-03-12 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,240,12,6,0,0),(320,5,'1','2018-02-19','2018-03-19 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(321,5,'1','2018-02-19','2018-03-26 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(322,5,'1','2018-02-19','2018-04-02 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(323,5,'1','2018-02-19','2018-04-09 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(324,5,'1','2018-02-19','2018-04-16 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(325,5,'1','2018-02-19','2018-04-23 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(326,5,'1','2018-02-19','2018-04-30 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(327,5,'1','2018-02-19','2018-05-07 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(328,5,'1','2018-02-19','2018-05-14 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(329,5,'1','2018-02-19','2018-05-21 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(330,5,'1','2018-02-19','2018-05-28 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(331,5,'1','2018-02-19','2018-06-04 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(332,5,'1','2018-02-19','2018-06-11 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(333,5,'1','2018-02-19','2018-06-18 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(334,5,'1','2018-02-19','2018-06-25 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(335,5,'1','2018-02-19','2018-07-02 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(336,5,'1','2018-02-19','2018-07-09 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(337,5,'1','2018-02-19','2018-07-16 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(338,5,'1','2018-02-19','2018-07-23 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(339,5,'1','2018-02-19','2018-07-30 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(340,5,'1','2018-02-19','2018-08-06 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(341,5,'1','2018-02-19','2018-08-13 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(342,5,'1','2018-02-19','2018-08-20 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(343,5,'1','2018-02-19','2018-08-27 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(344,5,'1','2018-02-19','2018-09-03 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(345,5,'1','2018-02-19','2018-09-04 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,180,12,6,0,0),(346,5,'1','2018-02-19','2018-09-17 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(347,5,'1','2018-02-19','2018-09-24 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(348,5,'1','2018-02-19','2018-10-01 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(349,5,'1','2018-02-19','2018-10-08 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(350,5,'1','2018-02-19','2018-10-15 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(351,5,'1','2018-02-19','2018-10-22 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(352,5,'1','2018-02-19','2018-10-29 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(353,5,'1','2018-02-19','2018-11-05 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(354,5,'1','2018-02-19','2018-11-12 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(355,5,'1','2018-02-19','2018-11-19 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(356,5,'1','2018-02-19','2018-11-26 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(357,5,'1','2018-02-19','2018-12-03 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(358,5,'1','2018-02-19','2018-12-10 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(359,5,'1','2018-02-19','2018-12-17 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(360,5,'1','2018-02-19','2018-12-24 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(361,5,'1','2018-02-19','2018-12-31 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(362,5,'1','2018-02-19','2019-01-07 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(363,5,'1','2018-02-19','2019-01-14 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(364,5,'1','2018-02-19','2019-01-21 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(365,5,'1','2018-02-19','2019-01-28 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(366,5,'1','2018-02-19','2019-02-04 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(367,5,'1','2018-02-19','2019-02-11 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(368,5,'1','2018-02-19','2019-02-18 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(369,5,'1','2018-02-19','2019-02-25 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(370,5,'1','2018-02-19','2019-03-04 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(371,5,'1','2018-02-19','2019-03-11 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(372,5,'1','2018-02-19','2019-03-18 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(373,5,'1','2018-02-19','2019-03-25 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(374,5,'1','2018-02-19','2019-04-01 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(375,5,'1','2018-02-19','2019-04-08 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(376,5,'1','2018-02-19','2019-04-15 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(377,5,'1','2018-02-19','2019-04-22 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(378,5,'1','2018-02-19','2019-04-29 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(379,5,'1','2018-02-19','2019-05-06 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(380,5,'1','2018-02-19','2019-05-13 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(381,5,'1','2018-02-19','2019-05-20 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(382,5,'1','2018-02-19','2019-05-27 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(383,5,'1','2018-02-19','2019-06-03 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(384,5,'1','2018-02-19','2019-06-10 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(385,5,'1','2018-02-19','2019-06-17 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(386,5,'1','2018-02-19','2019-06-24 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(387,5,'1','2018-02-19','2019-07-01 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(388,5,'1','2018-02-19','2019-07-08 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(389,5,'1','2018-02-19','2019-07-15 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(390,5,'1','2018-02-19','2019-07-22 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(391,5,'1','2018-02-19','2019-07-29 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(392,5,'1','2018-02-19','2019-08-05 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(393,5,'1','2018-02-19','2019-08-12 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(394,5,'1','2018-02-19','2019-08-19 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(395,5,'1','2018-02-19','2019-08-26 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(396,5,'1','2018-02-19','2019-09-02 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(397,5,'1','2018-02-19','2019-09-09 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(398,5,'1','2018-02-19','2019-09-16 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(399,5,'1','2018-02-19','2019-09-23 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(400,5,'1','2018-02-19','2019-09-30 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(401,5,'1','2018-02-19','2019-10-07 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(402,5,'1','2018-02-19','2019-10-14 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(403,5,'1','2018-02-19','2019-10-21 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(404,5,'1','2018-02-19','2019-10-28 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(405,5,'1','2018-02-19','2019-11-04 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(406,5,'1','2018-02-19','2019-11-11 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(407,5,'1','2018-02-19','2019-11-18 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(408,5,'1','2018-02-19','2019-11-25 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(409,5,'1','2018-02-19','2019-12-02 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(410,5,'1','2018-02-19','2019-12-09 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(411,5,'1','2018-02-19','2019-12-16 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(412,5,'1','2018-02-19','2019-12-23 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(413,5,'1','2018-02-19','2019-12-30 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(414,5,'1','2018-02-19','2020-01-06 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(415,5,'1','2018-02-19','2020-01-13 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(416,5,'1','2018-02-19','2020-01-20 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(417,5,'1','2018-02-19','2020-01-27 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(418,5,'1','2018-02-19','2020-02-03 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(419,5,'1','2018-02-19','2020-02-10 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(420,5,'1','2018-02-19','2020-02-17 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(421,5,'1','2018-02-19','2020-02-24 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,6,0,0),(422,4,'1','2018-02-19','2018-02-20 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(423,4,'1','2018-02-19','2018-03-05 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,150,11,6,0,0),(424,4,'1','2018-02-19','2018-03-22 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(425,4,'1','2018-02-19','2018-04-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(426,4,'1','2018-02-19','2018-04-27 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(427,4,'1','2018-02-19','2018-05-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(428,4,'1','2018-02-19','2018-05-21 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(429,4,'1','2018-02-19','2018-06-05 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(430,4,'1','2018-02-19','2018-06-20 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(431,4,'1','2018-02-19','2018-07-05 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(432,4,'1','2018-02-19','2018-07-20 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(433,4,'1','2018-02-19','2018-08-04 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(434,4,'1','2018-02-19','2018-08-19 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(435,4,'1','2018-02-19','2018-09-03 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(436,4,'1','2018-02-19','2018-09-18 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(437,4,'1','2018-02-19','2018-10-03 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(438,4,'1','2018-02-19','2018-10-18 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(439,4,'1','2018-02-19','2018-11-02 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(440,4,'1','2018-02-19','2018-11-17 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(441,4,'1','2018-02-19','2018-12-02 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(442,4,'1','2018-02-19','2018-12-17 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(443,4,'1','2018-02-19','2019-01-01 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(444,4,'1','2018-02-19','2019-01-16 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(445,4,'1','2018-02-19','2019-01-31 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(446,4,'1','2018-02-19','2019-02-15 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(447,4,'1','2018-02-19','2019-03-02 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(448,4,'1','2018-02-19','2019-03-17 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(449,4,'1','2018-02-19','2019-04-01 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(450,4,'1','2018-02-19','2019-04-16 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(451,4,'1','2018-02-19','2019-05-01 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(452,4,'1','2018-02-19','2019-05-16 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(453,4,'1','2018-02-19','2019-05-31 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(454,4,'1','2018-02-19','2019-06-15 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(455,4,'1','2018-02-19','2019-06-30 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(456,4,'1','2018-02-19','2019-07-15 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(457,4,'1','2018-02-19','2019-07-30 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(458,4,'1','2018-02-19','2019-08-14 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(459,4,'1','2018-02-19','2019-08-29 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(460,4,'1','2018-02-19','2019-09-13 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(461,4,'1','2018-02-19','2019-09-28 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(462,4,'1','2018-02-19','2019-10-13 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(463,4,'1','2018-02-19','2019-10-28 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(464,4,'1','2018-02-19','2019-11-12 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(465,4,'1','2018-02-19','2019-11-27 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(466,4,'1','2018-02-19','2019-12-12 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(467,4,'1','2018-02-19','2019-12-27 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(468,4,'1','2018-02-19','2020-01-11 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(469,4,'1','2018-02-19','2020-01-26 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(470,4,'1','2018-02-19','2020-02-10 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(471,4,'1','2018-02-19','2020-02-25 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(472,4,'1','2018-02-19','2020-03-11 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(473,4,'1','2018-02-19','2020-03-26 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(474,4,'1','2018-02-19','2020-04-10 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(475,4,'1','2018-02-19','2020-04-25 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(476,4,'1','2018-02-19','2020-05-10 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(477,4,'1','2018-02-19','2020-05-25 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(478,4,'1','2018-02-19','2020-06-09 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(479,4,'1','2018-02-19','2020-06-24 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(480,4,'1','2018-02-19','2020-07-09 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(481,4,'1','2018-02-19','2020-07-24 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(482,4,'1','2018-02-19','2020-08-08 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(483,4,'1','2018-02-19','2020-08-23 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(484,4,'1','2018-02-19','2020-09-07 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(485,4,'1','2018-02-19','2020-09-22 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(486,4,'1','2018-02-19','2020-10-07 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(487,4,'1','2018-02-19','2020-10-22 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(488,4,'1','2018-02-19','2020-11-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(489,4,'1','2018-02-19','2020-11-21 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(490,4,'1','2018-02-19','2020-12-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(491,4,'1','2018-02-19','2020-12-21 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(492,4,'1','2018-02-19','2021-01-05 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(493,4,'1','2018-02-19','2021-01-20 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(494,4,'1','2018-02-19','2021-02-04 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(495,4,'1','2018-02-19','2021-02-19 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(496,4,'1','2018-02-19','2021-03-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,6,0,0),(497,16,'1','2018-02-19','2018-02-19 12:02:00','2018-02-10 00:00:00','2018-03-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,1,1,1,0,8,'5',4,60,8,6,0,0),(498,16,'1','2018-02-19','2018-02-28 12:02:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(499,16,'1','2018-02-19','2018-03-30 12:02:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(500,16,'1','2018-02-19','2018-04-29 12:02:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(501,16,'1','2018-02-19','2018-05-29 12:02:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(502,16,'1','2018-02-19','2018-02-21 11:23:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(503,16,'1','2018-02-19','2018-03-23 11:23:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(504,16,'1','2018-02-19','2018-04-22 11:23:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(505,16,'1','2018-02-19','2018-02-22 12:22:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(506,16,'1','2018-02-19','2018-03-24 12:22:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(507,16,'1','2018-02-19','2018-04-23 12:22:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(508,16,'1','2018-02-19','2018-05-23 12:22:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,6,0,0),(509,12,'1','2018-02-26','2018-02-16 11:00:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL DEP√ìSITO DE COMBUSTIBLE.',1,'C',1,1,1,1,0,14,'4',4,120,14,6,0,0),(510,1,'510','2018-02-26','2018-02-07 15:00:00','2018-10-11 18:32:10','2018-10-11 18:13:30','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','bateria descargada 510',1,'P',1,19,1,1,1,13,'2',9,60,13,6,0,0),(511,1,'1','2018-02-26','2018-02-23 17:00:00','2018-02-08 14:38:14','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Ruido en cuerpo de bomba int 0057A',1,'C',1,1,1,1,0,17,'2',10,60,17,6,0,0),(512,1,'1','2018-02-26','2018-02-21 22:00:00','2018-02-05 19:01:38','2018-10-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','bateria descargada\n\n',1,'As',1,19,1,1,0,13,'2',9,60,13,6,0,0),(513,5,'1','2018-02-26','2018-02-23 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(514,5,'1','2018-02-26','2018-03-25 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(515,5,'1','2018-02-26','2018-04-24 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(516,5,'1','2018-02-26','2018-05-24 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(517,5,'1','2018-02-26','2018-06-23 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(518,5,'1','2018-02-26','2018-07-23 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(519,5,'1','2018-02-26','2018-08-22 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(520,5,'1','2018-02-26','2018-09-21 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(521,5,'1','2018-02-26','2018-10-21 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(522,5,'1','2018-02-26','2018-11-20 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(523,5,'1','2018-02-26','2018-12-20 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(524,5,'1','2018-02-26','2019-01-19 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(525,5,'1','2018-02-26','2019-02-18 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(526,5,'1','2018-02-26','2019-03-20 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,6,0,0),(527,12,'1','2018-02-26','2018-02-22 19:00:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL DEP√ìSITO DE COMBUSTIBLE.',1,'C',1,1,1,1,0,14,'4',4,60,14,6,0,0),(528,8,'1','2018-03-09','2018-03-22 02:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40',1,'C',1,1,1,1,0,16,'3',4,30,16,6,0,0),(529,9,'1','2018-03-10','2018-03-14 00:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','CAMBIE LOS FILTROS DE ACEITE.',1,'C',1,1,1,1,0,17,'3',4,0,17,6,0,0),(530,8,'1','2018-03-12','2018-03-12 01:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40',1,'C',1,1,1,1,0,16,'3',4,0,16,6,0,0),(531,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-03-12 05:28:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','weqeqwqweqweqwewqeqwe\neqweqweqwe\nqweqw',1,'C',1,1,0,1,2,0,'1',4,0,NULL,6,0,0),(532,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-03-12 14:17:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','editado',1,'P',1,1,0,1,1,0,'1',8,0,NULL,6,0,0),(533,1,'1','2018-06-19','2018-06-19 05:00:00','2018-06-19 11:09:05','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','falla test',1,'AN',3,1,1,1,0,27,'2',4,60,27,6,0,0),(534,1,'1','2018-06-21','2018-06-21 05:15:00','2018-06-19 11:17:36','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','falla testing 1',1,'AN',3,1,1,1,0,29,'2',4,60,29,6,0,0),(535,1,'1','2018-06-21','2018-06-21 18:00:00','2018-06-19 11:09:05','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','falla test',1,'C',3,1,1,1,0,27,'2',4,60,27,6,0,0),(536,1,'','0000-00-00','0000-00-00 00:00:00','2018-06-22 10:33:00','2018-06-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','orden de trabajos testing 11 editado',1,'C',3,3,1,1,1,0,'1',11,60,NULL,6,0,0),(537,1,'1','2018-06-25','2018-06-26 15:00:00','2018-06-25 09:29:37','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','fala ttesting 25-06',1,'C',3,1,1,1,0,31,'2',4,60,31,6,0,0),(538,1,'1','2018-06-28','2018-06-28 20:00:00','2018-06-28 12:52:09','2018-06-29 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','falla calendario ',1,'As',3,3,1,1,1,32,'2',4,60,32,6,0,0),(539,1,'1','2018-06-28','2018-06-28 15:00:00','2018-06-28 12:52:09','2018-06-29 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','falla calendario ',1,'As',3,3,1,1,0,32,'2',4,60,32,6,0,0),(540,1,'1','2018-06-28','2018-06-28 15:00:00','2018-06-28 12:52:09','2018-06-29 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','falla calendario ',1,'As',3,3,1,1,0,32,'2',4,60,32,6,0,0),(541,1,'1','2018-06-28','2018-06-28 15:00:00','2018-06-28 12:52:09','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','falla calendario ',1,'C',3,1,1,1,1,32,'2',4,60,32,6,0,0),(542,15,'1','2018-07-25','2018-07-25 23:00:00','2018-01-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambie los Filtros del Motor',1,'C',1,1,1,1,0,4,'3',1,30,4,6,0,0),(543,36,'1','2018-07-25','2018-07-26 23:00:00','2018-01-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Transmisi√≥n (cada 1000hs seg√∫n horometro, utilizar el aceite SAE10W). ',1,'C',1,1,1,1,0,32,'3',2,60,32,6,0,0),(544,36,'1','2018-07-25','2018-07-25 23:30:00','2018-01-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Transmisi√≥n (cada 1000hs seg√∫n horometro, utilizar el aceite SAE10W). ',1,'C',1,1,1,1,0,32,'3',2,30,32,6,0,0),(545,3,'1','2018-07-28','2018-07-28 20:15:00','2018-01-01 00:00:00','2018-10-04 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambie Liquido de Refrigerante de Motor (Revise la Mezcla Anticongelante antes de la Epoca Invernal).',1,'As',1,1,1,1,0,97,'3',5,20,97,6,0,0),(546,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-09-24 18:09:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','hhhhh',1,'C',19,1,0,1,0,0,'1',1,0,NULL,0,0,0),(547,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-09-24 18:10:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','barrer la vereda',1,'C',16,1,0,1,0,0,'1',13,0,NULL,0,0,0),(548,NULL,'8000','0000-00-00','0000-00-00 00:00:00','2018-09-24 18:15:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','ver',1,'C',16,1,0,1,0,0,'1',13,0,NULL,0,0,0),(549,113,'1','2018-09-24','0000-00-00 00:00:00','2018-09-26 00:00:00','2018-10-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambio de Vidrios ',1,'AN',19,16,1,1,0,131,'3',13,1,131,7,0,0),(550,121,'1','2018-09-24','0000-00-00 00:00:00','2018-09-24 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Regulaci√≥n El√©ctrica de Joysticks ',1,'AN',16,1,1,1,0,130,'3',13,2,130,7,0,0),(551,113,'1','2018-09-24','0000-00-00 00:00:00','2018-09-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambio de Vidrios ',1,'AN',19,1,1,1,0,131,'3',13,1,131,7,0,0),(552,1,'1','2018-09-25','0000-00-00 00:00:00','2018-08-30 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',1,1,1,1,0,122,'3',1,12,122,6,0,0),(553,NULL,'1234','0000-00-00','0000-00-00 00:00:00','2018-09-26 00:36:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','901',1,'C',1,1,0,1,0,0,'1',13,0,NULL,0,0,0),(554,NULL,'1111','0000-00-00','0000-00-00 00:00:00','2018-09-26 00:38:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','11111111',1,'C',1,1,0,1,0,0,'1',16,0,NULL,0,0,0),(555,NULL,'11111111','0000-00-00','0000-00-00 00:00:00','2018-09-26 00:38:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','12222222222222',1,'C',1,1,0,1,0,0,'1',1,0,NULL,0,0,0),(556,NULL,'1','0000-00-00','0000-00-00 00:00:00','2018-09-26 00:39:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','1111',1,'C',1,1,0,1,0,0,'1',3,0,NULL,0,0,0),(557,9,'1','2018-09-26','0000-00-00 00:00:00','2018-09-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo del Radiador.',1,'C',1,1,1,1,0,133,'3',1,2,133,6,0,0),(558,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-09-28 21:32:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','',1,'C',1,1,0,-1,0,0,'1',-1,0,NULL,0,0,0),(559,1,'1','2018-10-02','0000-00-00 00:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',1,1,1,1,0,127,'3',1,23,127,6,0,0),(560,1,'1','2018-10-03','0000-00-00 00:00:00','2018-09-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',1,1,1,1,0,135,'3',1,33,135,6,0,0),(561,1,'1','2018-10-03','0000-00-00 00:00:00','2018-09-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',1,1,1,1,0,135,'3',1,33,135,6,0,0),(562,108,'1','2018-10-03','0000-00-00 00:00:00','2018-10-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'C',1,1,1,1,0,110,'3',5,0,110,6,0,0),(563,NULL,'0033','0000-00-00','0000-00-00 00:00:00','2018-10-03 23:12:00','2018-10-03 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0033 - 123456798 - suc capital - trazalog',1,'As',1,1,0,2,2,0,'1',18,0,NULL,6,0,0),(564,64,'1','2018-10-03','2018-10-03 23:45:00','2018-07-04 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Lubricar Eje de Mando Trasero (cada 2000 hs seg√∫n hor√≥metro. utilizar aceite. ver tabla de aceites capacidad 16 litros).',1,'C',1,1,1,1,0,60,'3',3,15,60,6,0,0),(565,1,'1','2018-10-03','2018-10-05 10:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',1,1,1,1,0,127,'3',1,23,127,6,0,0),(566,1,'1','2018-10-03','2018-10-14 00:00:00','2018-09-25 10:23:40','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','equipo averiado ',1,'C',1,1,1,1,0,51,'2',1,60,51,6,0,0),(567,1,'1','2018-10-03','2018-09-14 00:00:00','2018-09-25 10:23:40','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','equipo averiado ',1,'C',1,1,1,1,0,51,'2',1,60,51,6,0,0),(568,NULL,'11223344','0000-00-00','0000-00-00 00:00:00','2018-10-04 10:41:00','2018-10-24 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','nueva ot 123456789',1,'As',1,1,0,1,1,0,'1',18,0,NULL,6,0,0),(569,1,'1','2018-10-04','2018-10-10 12:56:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',1,1,1,1,0,126,'3',1,23,126,6,0,0),(570,64,'1','2018-10-04','2018-10-31 07:17:00','2018-07-04 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Lubricar Eje de Mando Trasero (cada 2000 hs seg√∫n hor√≥metro. utilizar aceite. ver tabla de aceites capacidad 16 litros).',1,'C',1,1,1,1,0,60,'3',3,15,60,6,0,0),(571,64,'1','2018-10-04','2019-02-20 07:17:00','2018-07-04 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Lubricar Eje de Mando Trasero (cada 2000 hs seg√∫n hor√≥metro. utilizar aceite. ver tabla de aceites capacidad 16 litros).',1,'C',1,1,1,1,0,60,'3',3,15,60,6,0,0),(572,64,'1','2018-10-04','2019-06-12 07:17:00','2018-07-04 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Lubricar Eje de Mando Trasero (cada 2000 hs seg√∫n hor√≥metro. utilizar aceite. ver tabla de aceites capacidad 16 litros).',1,'C',1,1,1,1,0,60,'3',3,15,60,6,0,0),(573,9,'1','2018-10-04','2018-10-25 00:00:00','2018-09-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo del Radiador.',1,'C',1,1,1,1,0,133,'3',1,2,133,6,0,0),(574,NULL,'11112222','0000-00-00','0000-00-00 00:00:00','2018-10-04 12:03:00','2018-10-04 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','eli',1,'AN',1,1,0,1,1,0,'1',9,0,NULL,6,0,0),(575,NULL,'333','0000-00-00','0000-00-00 00:00:00','2018-10-04 12:05:00','2018-10-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','666',1,'As',1,19,0,2,2,0,'1',9,0,NULL,6,0,0),(576,NULL,'9347923984734','0000-00-00','0000-00-00 00:00:00','2018-10-04 12:08:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','jhgffgsdjfgsdhf',1,'C',1,1,0,1,1,0,'1',18,0,NULL,6,0,0),(577,NULL,'112233','0000-00-00','0000-00-00 00:00:00','2018-10-04 12:13:00','2018-10-31 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','nueva orden de trabajo',1,'As',1,1,0,1,1,0,'1',18,0,NULL,6,0,0),(578,NULL,'9996','0000-00-00','0000-00-00 00:00:00','2018-10-04 13:41:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','999 ultimaxx',1,'C',1,1,0,2,2,0,'1',9,0,NULL,6,0,0),(579,NULL,'1122334455','0000-00-00','0000-00-00 00:00:00','2018-10-05 10:36:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','nueva orden de tabajo ',1,'AN',1,1,0,1,1,0,'1',9,0,NULL,6,0,0),(580,NULL,'4536','0000-00-00','0000-00-00 00:00:00','2018-10-05 10:36:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','3456',1,'AN',1,1,0,1,2,0,'1',9,0,NULL,6,0,0),(581,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-10-05 10:36:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','',1,'C',1,1,0,-1,-1,0,'1',-1,0,NULL,6,0,0),(582,NULL,'111','0000-00-00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','',1,'C',1,1,0,0,0,0,'1',0,0,NULL,6,0,0),(583,NULL,'1234','0000-00-00','0000-00-00 00:00:00','2018-10-05 13:06:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','1234',1,'C',1,1,0,-1,-1,0,'1',9,0,NULL,6,0,0),(584,NULL,'540','0000-00-00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','540',1,'AN',1,1,0,1,1,0,'1',9,0,NULL,6,0,0),(585,NULL,'222','0000-00-00','0000-00-00 00:00:00','2018-10-05 13:07:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','222',1,'AN',1,1,0,1,2,0,'1',5,0,NULL,6,0,0),(586,1,'1','2018-10-05','2018-10-05 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(587,1,'1','2018-10-05','2018-11-19 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(588,1,'1','2018-10-05','2019-01-03 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(589,1,'1','2018-10-05','2019-02-17 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(590,1,'1','2018-10-05','2019-04-03 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(591,1,'1','2018-10-05','2019-05-18 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(592,1,'1','2018-10-05','2019-07-02 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(593,1,'1','2018-10-05','2019-08-16 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(594,1,'1','2018-10-05','2019-09-30 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(595,1,'1','2018-10-05','2019-11-14 12:00:00','2018-09-05 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'C',19,1,1,1,0,126,'3',1,23,126,6,0,0),(596,NULL,'23','0000-00-00','0000-00-00 00:00:00','2018-10-06 09:46:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','sdadasda',1,'AN',1,1,0,1,1,0,'1',9,0,NULL,6,0,0),(597,129,'1','2018-10-08','2018-10-25 00:00:00','2018-10-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'AN',18,1,1,1,0,25,'5',13,2,25,7,0,0),(598,1,'1','2018-10-08','2018-10-25 00:00:00','2018-10-08 08:47:51','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Engrase de cardan ',1,'AN',18,1,1,1,0,73,'2',16,60,73,7,0,0),(599,1,'1','2018-10-08','2018-10-08 00:00:00','2018-10-08 12:05:47','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','ggg',1,'C',1,1,1,1,0,75,'2',13,60,75,6,0,0),(600,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-10-02 13:00:00','2018-10-09 17:30:25','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','eliana probando nueva',1,'C',1,1,0,2,2,0,'1',9,0,NULL,6,0,0),(601,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-10-08 12:37:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','',1,'C',1,1,0,-1,-1,0,'1',9,0,NULL,6,0,0),(602,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-10-08 12:38:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','',1,'C',1,1,0,-1,-1,0,'1',9,0,NULL,6,0,0),(603,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-10-11 11:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','',1,'C',1,1,0,-1,-1,0,'1',9,0,NULL,6,0,0),(604,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-10-11 13:12:00','2018-10-11 13:05:41','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','',1,'C',1,1,0,-1,-1,0,'1',-1,0,NULL,6,0,0),(605,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-10-11 16:45:00','2018-10-11 16:45:16','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','',1,'C',1,1,0,1,1,0,'1',9,0,NULL,6,0,0),(606,NULL,'403','0000-00-00','0000-00-00 00:00:00','2018-10-11 16:47:00','2018-10-09 08:30:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','ot nota',1,'C',1,1,0,2,2,0,'1',9,0,NULL,6,0,0),(607,143,'1','2018-10-19','2018-10-19 10:00:00','2019-06-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Compruebe los Soportes de los Cilindros ',1,'C',1,1,1,1,0,18,'3',9,10,18,6,1250,1540),(608,108,'1','2018-11-06','2018-11-08 10:00:00','2018-10-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'C',1,1,1,1,0,110,'3',5,0,110,6,0,0),(609,108,'1','2018-11-06','2018-12-13 10:00:00','2018-10-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'C',1,1,1,1,0,110,'3',5,0,110,6,0,0),(610,108,'1','2018-11-06','2019-01-17 10:00:00','2018-10-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'C',1,1,1,1,0,110,'3',5,0,110,6,0,0),(611,108,'1','2018-11-06','2018-11-07 12:00:00','2018-10-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'C',1,1,1,1,0,110,'3',5,0,110,6,0,0),(612,108,'1','2018-11-06','2018-12-12 12:00:00','2018-10-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'C',1,1,1,1,0,110,'3',5,0,110,6,0,0),(613,108,'1','2018-11-06','2019-01-16 12:00:00','2018-10-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'C',1,1,1,1,0,110,'3',5,0,110,6,0,0),(614,108,'1','2018-11-06','2019-02-20 12:00:00','2018-10-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'C',1,1,1,1,0,110,'3',5,0,110,6,0,0);
/*!40000 ALTER TABLE `orden_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paises` (
  `Codigo` varchar(2) NOT NULL,
  `Pais` varchar(100) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES ('AR','Argentina');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametroequipo`
--

DROP TABLE IF EXISTS `parametroequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametroequipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paramId` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `fechahora` datetime NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_equipo` (`id_equipo`),
  KEY `paramId` (`paramId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametroequipo`
--

LOCK TABLES `parametroequipo` WRITE;
/*!40000 ALTER TABLE `parametroequipo` DISABLE KEYS */;
INSERT INTO `parametroequipo` VALUES (1,1,1,'67','2017-11-09 16:09:02',6),(2,1,1,'56','2017-11-16 08:57:55',6),(3,1,1,'23','2017-11-21 11:44:46',6),(4,1,1,'150','2017-11-29 04:38:11',6),(5,2,2,'88888','2017-11-29 04:39:02',6),(6,3,3,'34','2017-12-02 03:01:45',6),(7,3,3,'34','2017-12-02 03:02:41',6),(8,3,3,'45','2017-12-02 03:02:59',6),(9,3,3,'34','2017-12-02 03:26:30',6),(10,2,2,'45','2017-12-02 03:33:22',6),(11,1,3,'444','2017-12-02 03:43:37',6),(12,1,3,'56','2017-12-02 03:45:01',6),(13,1,7,'56','2017-12-02 03:45:59',6),(14,1,3,'45','2017-12-02 03:50:41',6),(15,3,3,'55555','2017-12-02 04:25:07',6),(16,3,3,'444','2017-12-02 04:27:55',6),(17,3,3,'445','2017-12-02 04:58:08',6),(18,1,3,'12','2017-12-02 05:02:48',6),(19,1,3,'45','2017-12-02 06:46:42',6),(20,1,7,'78','2017-12-11 04:50:13',6),(21,1,7,'12','2017-12-11 04:50:23',6),(22,1,1,'25','2017-12-11 04:56:50',6),(23,1,7,'34','2017-12-11 11:28:24',6),(24,1,7,'45','2017-12-11 11:28:40',6),(25,1,7,'34','2017-12-11 11:29:00',6),(26,2,1,'44','2017-12-11 11:29:15',6),(27,1,2,'444','2017-12-11 11:29:29',6),(28,8,4,'45','2018-02-08 17:55:28',6),(29,8,4,'67','2018-02-08 17:56:05',6),(30,10,4,'200','2018-06-27 12:38:59',6),(31,1,2,'34','2018-07-27 03:07:47',0),(32,1,2,'20','2018-08-01 08:13:50',0),(33,13,1,'45','2018-08-01 08:15:07',0),(34,13,1,'20','2018-09-20 11:50:18',0),(35,13,1,'22','2018-09-20 12:29:16',0),(36,13,1,'5','2018-09-20 12:29:41',0),(37,13,1,'5','2018-09-20 12:29:54',0),(38,13,1,'3','2018-09-20 12:32:44',0),(39,13,1,'44','2018-09-20 12:33:04',0);
/*!40000 ALTER TABLE `parametroequipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros` (
  `paramId` int(11) NOT NULL AUTO_INCREMENT,
  `paramdescrip` varchar(255) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`paramId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (1,'TEMPERATURA',NULL,'AC',6),(10,'VIBRACION',NULL,'AC',6),(11,'AMPERAJE',NULL,'AC',6),(13,'HUMEDAD',NULL,'AC',6),(17,'rer',NULL,'AC',7);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo` (
  `idperiodo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`idperiodo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'Diario','AC',6),(2,'mensual','AC',6),(3,'semestral','AC',6),(4,'anual','AC',6),(5,'horas','AC',6),(6,'Ciclos','AC',6),(7,'kil√≥metros','AC',6);
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predictivo`
--

DROP TABLE IF EXISTS `predictivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predictivo` (
  `predId` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `tarea_descrip` varchar(2000) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `periodo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `horash` int(11) DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `pred_duracion` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `pred_canth` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`predId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predictivo`
--

LOCK TABLES `predictivo` WRITE;
/*!40000 ALTER TABLE `predictivo` DISABLE KEYS */;
INSERT INTO `predictivo` VALUES (1,1,'4','2017-11-07','Diario',30,NULL,'C',0,0,0,0),(2,2,'5','0000-00-00','Diario',15,NULL,'C',0,0,0,0),(3,1,'6','0000-00-00','Periodos',15,NULL,'C',0,0,0,0),(4,1,'4','2017-11-24','Diario',15,NULL,'AN',0,0,0,0),(5,1,'5','2017-12-09','Diario',23,NULL,'C',0,0,0,0),(6,2,'6','2017-12-11','Diario',20,5,'C',0,0,0,0),(7,4,'15','0002-07-08','Mensual',51,1,'C',0,0,0,0),(8,4,'16','0002-10-08','Diario',30,96,'AN',2,3,2,6),(9,10,'6','0000-00-00','Diario',7,4,'C',2,2,2,6),(10,7,'4','0000-00-00','Diario',10,24,'C',12,2,2,6),(11,4,'10','2018-05-29','Diario',30,25,'C',0,0,0,0),(12,10,'7','0000-00-00','Diario',30,1,'AN',60,1,1,6),(13,5,'4','0000-00-00','Diario',30,0,'AN',60,1,2,6),(14,-1,'-1','2018-05-30','Diario',0,NULL,'C',0,-1,0,6),(15,-1,'-1','2018-05-30','Diario',0,NULL,'C',0,-1,0,6),(16,-1,'-1','2018-05-31','Diario',0,NULL,'C',0,-1,0,6),(17,10,'9','2018-05-23','Diario',30,384,'AN',8,3,2,6),(18,11,'15','2018-06-28','Diario',21,1,'C',60,1,1,6),(19,1,'1','2018-08-30','Diario',12,1,'C',12,1,5,6),(20,1,'1','2018-09-05','Diario',6,2,'C',23,1,5,6),(21,1,'20','2018-09-05','Diario',4,0,'C',3,1,5,6),(22,9,'16','0000-00-00','Diario',2,2,'AN',20,1,6,6),(23,9,'1','2018-10-24','Diario',222,99,'AN',33,2,3,6),(24,9,'109','2018-10-31','Diario',33,NULL,'AN',0,1,0,6),(25,13,'129','2018-10-08','Diario',1,NULL,'AN',2,2,1,7),(26,9,'111','2018-10-08','Diario',2,8,'C',100,1,5,6);
/*!40000 ALTER TABLE `predictivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preventivo`
--

DROP TABLE IF EXISTS `preventivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preventivo` (
  `prevId` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `perido` varchar(50) NOT NULL,
  `cantidad` double NOT NULL,
  `ultimo` date NOT NULL,
  `id_componente` int(11) NOT NULL,
  `critico1` double NOT NULL,
  `fechaprobable` date DEFAULT NULL,
  `horash` int(11) NOT NULL,
  `estadoprev` char(255) DEFAULT NULL,
  `prev_duracion` double NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `prev_canth` double NOT NULL,
  `prev_adjunto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `lectura_base` double NOT NULL,
  PRIMARY KEY (`prevId`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_tarea` (`id_tarea`),
  KEY `id_componente` (`id_componente`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preventivo`
--

LOCK TABLES `preventivo` WRITE;
/*!40000 ALTER TABLE `preventivo` DISABLE KEYS */;
INSERT INTO `preventivo` VALUES (1,1,4,'1',14,'2018-01-01',1,0,NULL,2,'C',60,1,2,NULL,6,0),(2,1,1,'1',7,'2018-01-03',1,0,NULL,1,'C',20,1,2,NULL,6,0),(3,1,3,'1',14,'2018-01-01',1,0,NULL,0,'C',10,1,1,NULL,6,0),(4,1,15,'1',42,'2018-01-01',1,0,NULL,0,'C',12,1,3,NULL,6,0),(5,1,5,'1',84,'2018-01-01',1,0,NULL,1,'C',30,1,2,NULL,6,0),(6,1,6,'1',14,'2018-01-01',2,0,NULL,0,'C',15,1,1,NULL,6,0),(7,1,7,'1',14,'2018-01-03',3,0,NULL,0,'C',5,1,1,NULL,6,0),(8,1,8,'1',35,'2018-01-03',4,0,NULL,0,'C',20,1,1,NULL,6,0),(9,1,9,'1',140,'2018-01-03',5,0,NULL,0,'C',10,1,1,NULL,6,0),(10,1,10,'1',14,'2018-01-03',26,0,NULL,0,'C',10,1,1,NULL,6,0),(11,1,11,'1',105,'2018-01-01',26,0,NULL,0,'C',10,1,1,NULL,6,0),(12,1,12,'1',35,'2018-01-01',26,0,NULL,0,'C',5,1,1,NULL,6,0),(13,1,13,'1',35,'2018-01-01',26,0,NULL,0,'C',10,1,1,NULL,6,0),(14,1,14,'1',70,'2018-01-01',26,0,NULL,0,'C',10,1,1,NULL,6,0),(15,1,22,'1',14,'2018-01-01',28,0,NULL,0,'C',5,1,1,NULL,6,0),(16,1,21,'1',14,'2018-01-01',28,0,NULL,0,'C',15,1,1,NULL,6,0),(17,1,20,'1',14,'2018-01-03',28,0,NULL,1,'C',30,1,1,NULL,6,0),(18,1,16,'1',105,'2018-01-01',27,0,NULL,0,'C',10,1,1,NULL,6,0),(19,1,17,'1',105,'2018-01-03',27,0,NULL,0,'C',10,1,1,NULL,6,0),(20,1,18,'1',105,'2018-01-01',27,0,NULL,0,'C',10,1,2,NULL,6,0),(21,1,19,'1',140,'2018-01-03',27,0,NULL,2,'AN',30,1,4,NULL,6,0),(22,1,26,'1',70,'2018-01-01',30,0,NULL,0,'C',20,1,1,NULL,6,0),(23,2,27,'1',7,'2018-01-01',6,0,NULL,0,'C',5,1,1,NULL,6,0),(24,2,28,'1',84,'2018-01-03',7,0,NULL,32,'C',480,1,4,NULL,6,0),(25,2,29,'1',14,'2018-01-03',8,0,NULL,0,'C',10,1,1,NULL,6,0),(26,2,30,'1',14,'2018-01-01',9,0,NULL,0,'C',5,1,1,NULL,6,0),(27,2,31,'1',14,'2018-01-01',10,0,NULL,0,'C',5,1,1,NULL,6,0),(28,2,32,'1',2,'2018-01-01',31,0,NULL,0,'C',5,1,1,NULL,6,0),(29,2,33,'1',14,'2018-01-01',31,0,NULL,1,'C',20,1,2,NULL,6,0),(31,2,35,'1',56,'2018-01-01',31,0,NULL,1,'C',20,1,2,NULL,6,0),(32,2,36,'1',56,'2018-01-01',32,0,NULL,1,'C',20,1,2,NULL,6,0),(33,2,37,'1',56,'2018-01-01',32,0,NULL,0,'C',5,1,2,NULL,6,0),(34,2,38,'1',96,'2018-01-01',33,0,NULL,6,'C',120,1,3,NULL,6,0),(35,2,39,'1',30,'2018-01-01',33,0,NULL,0,'C',5,1,1,NULL,6,0),(36,2,40,'1',2,'2018-01-01',34,0,NULL,0,'C',5,1,2,NULL,6,0),(37,2,41,'1',168,'2018-01-01',34,0,NULL,9,'C',180,1,3,NULL,6,0),(38,2,42,'1',2,'2018-01-01',35,0,NULL,0,'C',10,1,1,NULL,6,0),(39,2,43,'1',2,'2018-07-04',36,0,NULL,0,'C',10,1,2,NULL,6,0),(40,2,44,'1',14,'2018-07-04',37,0,NULL,1,'C',15,1,2,NULL,6,0),(41,2,45,'1',14,'2018-07-04',38,0,NULL,0,'C',5,1,1,NULL,6,0),(42,2,46,'1',14,'2018-01-01',39,0,NULL,1,'C',40,1,2,NULL,6,0),(43,2,47,'1',364,'2018-01-01',40,0,NULL,150,'C',3000,1,3,NULL,6,0),(44,2,48,'1',7,'2018-01-01',41,0,NULL,0,'C',5,1,2,NULL,6,0),(45,2,49,'1',14,'2018-01-01',42,0,NULL,0,'C',5,1,2,NULL,6,0),(46,2,50,'1',14,'2018-01-01',43,0,NULL,0,'C',5,1,1,NULL,6,0),(47,2,51,'1',14,'2018-01-01',44,0,NULL,0,'C',5,1,1,NULL,6,0),(48,3,52,'1',56,'2018-01-01',11,0,NULL,6,'C',180,1,2,NULL,6,0),(49,3,53,'1',14,'2018-01-01',12,0,NULL,0,'C',5,1,1,NULL,6,0),(50,3,54,'1',14,'2018-01-01',13,0,NULL,1,'C',20,1,2,NULL,6,0),(51,3,55,'1',14,'2018-01-01',14,0,NULL,0,'C',20,1,1,NULL,6,0),(52,3,56,'1',2,'2018-01-01',15,0,NULL,0,'C',5,1,2,NULL,6,0),(53,3,57,'1',56,'2018-01-01',46,0,NULL,6,'C',180,1,2,NULL,6,0),(54,3,58,'1',2,'2018-07-04',59,0,NULL,0,'C',5,1,1,NULL,6,0),(55,3,59,'1',28,'2018-07-04',47,0,NULL,0,'C',10,1,2,NULL,6,0),(56,3,60,'1',56,'2018-07-04',48,0,NULL,0,'C',10,1,2,NULL,6,0),(57,3,61,'1',14,'2018-01-01',49,0,NULL,0,'C',10,1,1,NULL,6,0),(58,3,62,'1',112,'2018-01-01',49,0,NULL,1,'C',15,1,2,NULL,6,0),(59,3,63,'1',2,'2018-01-01',50,0,NULL,0,'C',10,1,1,NULL,6,0),(60,3,64,'1',112,'2018-07-04',50,0,NULL,1,'C',15,1,2,NULL,6,0),(61,3,0,'1',56,'2018-01-01',51,0,NULL,3,'C',34,1,5,NULL,6,0),(62,3,66,'1',2,'2018-01-01',52,0,NULL,0,'C',10,1,1,NULL,6,0),(63,3,67,'1',14,'2018-01-01',52,0,NULL,0,'C',5,1,1,NULL,6,0),(64,3,68,'1',2,'2018-01-01',53,0,NULL,0,'C',5,1,2,NULL,6,0),(65,3,69,'1',112,'2018-01-01',53,0,NULL,8,'C',240,1,2,NULL,6,0),(66,3,70,'1',14,'2018-01-01',54,0,NULL,1,'C',20,1,2,NULL,6,0),(67,3,71,'1',14,'2018-01-01',54,0,NULL,0,'C',5,1,1,NULL,6,0),(68,3,72,'1',14,'2018-01-01',54,0,NULL,0,'C',5,1,2,NULL,6,0),(69,3,72,'1',14,'2018-01-01',54,0,NULL,0,'C',5,1,2,NULL,6,0),(70,3,73,'1',56,'2018-01-01',55,0,NULL,4,'C',120,1,2,NULL,6,0),(71,3,74,'1',14,'2018-01-01',56,0,NULL,1,'C',30,1,2,NULL,6,0),(72,3,75,'1',30,'2018-01-01',57,0,NULL,0,'C',5,1,1,NULL,6,0),(73,3,76,'1',182,'2018-01-01',58,0,NULL,24,'C',480,1,3,NULL,6,0),(74,4,77,'1',2,'2018-01-01',16,0,NULL,0,'C',10,1,1,NULL,6,0),(75,4,78,'1',28,'2018-01-01',17,0,NULL,0,'C',10,1,2,NULL,6,0),(76,4,80,'1',2,'2018-01-01',17,0,NULL,0,'C',5,1,2,NULL,6,0),(77,4,81,'1',2,'2018-01-01',18,0,NULL,0,'C',10,1,1,NULL,6,0),(78,4,83,'1',14,'2018-01-01',20,0,NULL,0,'C',10,1,2,NULL,6,0),(79,4,84,'1',14,'2018-01-01',20,0,NULL,0,'C',5,1,2,NULL,6,0),(80,4,86,'1',84,'2018-01-01',61,0,NULL,0,'C',5,1,1,NULL,6,0),(81,4,85,'1',28,'2018-01-01',61,0,NULL,0,'C',5,1,1,NULL,6,0),(82,4,87,'1',28,'2018-01-01',62,0,NULL,1,'C',30,1,2,NULL,6,0),(83,4,88,'1',28,'2018-01-01',63,0,NULL,0,'C',5,1,2,NULL,6,0),(84,4,85,'1',28,'2018-01-01',63,0,NULL,0,'C',10,1,2,NULL,6,0),(85,4,91,'1',14,'2018-01-01',64,0,NULL,0,'C',10,1,2,NULL,6,0),(86,4,81,'1',2,'2018-01-01',18,0,NULL,0,'C',10,1,1,NULL,6,0),(87,4,90,'1',14,'2018-07-05',65,0,NULL,0,'C',10,1,2,NULL,6,0),(88,4,90,'1',14,'2018-07-05',65,0,NULL,0,'C',10,1,2,NULL,6,0),(89,4,92,'1',28,'2018-01-01',66,0,NULL,0,'C',10,1,2,NULL,6,0),(90,4,93,'1',2,'2018-01-01',67,0,NULL,0,'C',10,1,2,NULL,6,0),(91,4,94,'1',2,'2018-01-01',68,0,NULL,0,'C',10,1,1,NULL,6,0),(92,4,95,'1',2,'2018-01-01',69,0,NULL,0,'C',10,1,1,NULL,6,0),(93,4,96,'1',2,'2018-01-01',70,0,NULL,0,'C',10,1,2,NULL,6,0),(94,4,97,'1',2,'2018-01-01',71,0,NULL,0,'C',10,1,2,NULL,6,0),(95,5,1,'1',30,'2018-01-01',21,0,NULL,3,'C',60,1,3,NULL,6,0),(96,5,2,'1',2,'2018-01-01',21,0,NULL,0,'C',20,1,1,NULL,6,0),(97,5,3,'1',182,'2018-01-01',21,0,NULL,1,'C',20,1,2,NULL,6,0),(98,5,4,'1',2,'2018-01-01',21,0,NULL,0,'C',5,1,1,NULL,6,0),(99,5,5,'1',2,'2018-01-01',21,0,NULL,1,'C',30,1,2,NULL,6,0),(100,5,10,'1',2,'2018-01-01',22,0,NULL,0,'C',10,1,1,NULL,6,0),(101,5,11,'1',105,'2018-01-01',22,0,NULL,0,'C',10,1,1,NULL,6,0),(102,5,12,'1',14,'2018-01-01',22,0,NULL,0,'C',10,1,2,NULL,6,0),(103,5,13,'1',14,'2018-01-01',22,0,NULL,0,'C',5,1,1,NULL,6,0),(104,5,14,'1',70,'2018-01-01',22,0,NULL,0,'C',20,1,1,NULL,6,0),(105,5,16,'1',14,'2018-01-01',23,0,NULL,0,'C',10,1,1,NULL,6,0),(106,5,17,'1',35,'2018-01-01',23,0,NULL,0,'C',10,1,2,NULL,6,0),(107,5,18,'1',35,'2018-01-01',23,0,NULL,0,'C',5,1,2,NULL,6,0),(108,5,19,'1',35,'2018-01-01',-1,0,NULL,0,'C',20,1,1,NULL,6,0),(109,5,26,'1',14,'2018-01-01',25,0,NULL,1,'C',20,1,2,NULL,6,0),(110,5,108,'1',35,'2019-02-07',24,0,NULL,0,'C',0,-1,0,NULL,6,0),(111,5,109,'1',70,'2018-01-01',23,0,NULL,0,'C',15,1,1,NULL,6,0),(112,5,98,'1',2,'2018-01-01',21,0,NULL,0,'C',10,1,1,NULL,6,0),(113,5,105,'1',14,'2018-01-01',21,0,NULL,0,'C',20,1,1,NULL,6,0),(114,5,100,'1',28,'2018-01-01',21,0,NULL,1,'C',30,1,2,NULL,6,0),(115,5,101,'1',14,'2018-01-01',21,0,NULL,0,'C',5,1,1,NULL,6,0),(116,5,102,'1',14,'2018-01-01',21,0,NULL,0,'C',5,1,2,NULL,6,0),(117,5,103,'1',14,'2018-01-01',21,0,NULL,1,'C',20,1,2,NULL,6,0),(118,5,104,'1',14,'2018-01-01',21,0,NULL,1,'C',30,1,2,NULL,6,0),(119,5,105,'1',14,'2018-01-01',21,0,NULL,0,'C',10,1,2,NULL,6,0),(120,5,106,'1',14,'2018-01-01',21,0,NULL,0,'C',10,1,2,NULL,6,0),(121,5,107,'1',56,'2018-01-01',21,0,NULL,1,'C',20,1,2,NULL,6,0),(122,1,1,'1',12,'2018-08-30',1,0,NULL,2,'C',12,1,10,NULL,6,0),(123,1,1,'1',2,'2018-09-05',1,0,NULL,2,'C',23,1,4,NULL,6,0),(124,1,1,'1',2,'2018-09-05',1,0,NULL,2,'C',23,1,4,NULL,6,0),(125,1,1,'1',2,'2018-09-05',1,0,NULL,2,'C',23,1,4,NULL,6,0),(126,1,1,'1',45,'2018-09-05',1,0,NULL,2,'C',23,1,4,NULL,6,0),(127,1,1,'1',45,'2018-09-05',1,0,NULL,2,'C',23,1,4,NULL,6,0),(128,1,1,'1',2,'2018-09-15',1,0,NULL,0,'C',1,1,2,'128_6_2018-09-15-02-15-19.jpg',6,0),(129,13,112,'1',1,'0000-00-00',80,0,NULL,1,'AN',1,2,1,NULL,7,0),(130,13,121,'1',1,'2018-09-24',127,0,NULL,4,'AN',2,2,2,NULL,7,0),(131,13,113,'1',1,'2018-09-26',115,0,NULL,0,'AN',1,1,2,NULL,7,0),(132,13,113,'1',1,'2018-09-26',115,0,NULL,0,'AN',1,1,2,NULL,7,0),(133,1,9,'1',1,'2018-09-25',30,0,NULL,4,'C',2,2,2,NULL,6,0),(134,1,1,'1',22,'2018-09-26',1,0,NULL,3,'C',33,1,5,'134_6_2018-09-26-00-21-02.png',6,0),(135,1,1,'1',22,'2018-09-26',1,0,NULL,3,'C',33,1,5,'135_6_2018-09-26-00-21-12.png',6,0),(136,5,111,'1',22,'2018-12-25',25,0,NULL,3,'AN',0,-1,0,'136_6_2018-09-26-00-26-16.png',6,0),(137,5,2,'1',222,'2018-10-02',21,0,NULL,2,'C',33,1,3,NULL,6,0),(138,9,111,'1',2,'2018-10-02',1,0,NULL,2,'AN',33,1,4,NULL,6,0),(139,5,109,'1',222,'2018-10-02',22,0,NULL,2,'C',33,1,3,NULL,6,0),(140,5,108,'1',2,'0000-00-00',24,0,NULL,600,'C',100,2,6,NULL,6,0),(141,18,111,'1',222,'2018-10-03',1,0,NULL,4,'AN',50,1,5,NULL,6,0),(142,9,3,'1',60,'2018-10-04',200,0,NULL,0,'C',1,1,2,NULL,6,0),(143,9,18,'5',250,'2018-10-19',3,200,NULL,4,'C',2,2,2,NULL,6,1000),(144,9,15,'6',250,'2018-10-19',3,200,NULL,4,'C',2,2,2,NULL,6,1310),(145,1,4,'Diario',12,'2018-11-07',31,200,NULL,60,'C',2,2,2,NULL,6,220),(146,1,18,'2',15,'2018-11-07',31,0,NULL,60,'C',30,2,2,NULL,6,0),(147,1,16,'2',30,'2018-11-06',26,0,NULL,96,'C',48,2,2,NULL,6,0),(148,1,3,'2',15,'2018-11-11',31,0,NULL,72,'C',24,2,3,'148_6_2018-11-06-17-38-50.jpg',6,0);
/*!40000 ALTER TABLE `preventivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso`
--

DROP TABLE IF EXISTS `proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceso` (
  `id_proceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_proceso`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso`
--

LOCK TABLES `proceso` WRITE;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
INSERT INTO `proceso` VALUES (1,'un proceso nuevo 1',0,'AN'),(2,'nuevo proceso 001',0,'AN'),(3,'Extracci√≥n y Transporte',0,'AC'),(4,'proceso nuevo',6,'AN'),(5,'proceso emp 6',6,'AN'),(6,'proceso testing',6,'AN'),(7,'EXTRACCI√ìN Y TRANSPORTE DE MINERAL',6,'AC'),(8,'Extracci√≥n y Transporte De Mineral',6,'AC'),(9,'Proceso 8',6,'AC'),(11,'Perforaci√≥n',7,'AC'),(12,'Perforaci√≥n y Voladura',6,'AC'),(13,'Operaciones',7,'AC'),(14,'Mantenimiento',7,'AC'),(15,'Capacitacion',7,'AC');
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitos`
--

DROP TABLE IF EXISTS `remitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remitos` (
  `remitoId` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `provid` int(11) NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`remitoId`),
  KEY `provid` (`provid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitos`
--

LOCK TABLES `remitos` WRITE;
/*!40000 ALTER TABLE `remitos` DISABLE KEYS */;
INSERT INTO `remitos` VALUES (1,'2018-10-11 14:34:57',2,'111',6),(2,'2018-10-26 14:41:44',1,'222',6);
/*!40000 ALTER TABLE `remitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubro`
--

DROP TABLE IF EXISTS `rubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubro` (
  `id_rubro` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rubro`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubro`
--

LOCK TABLES `rubro` WRITE;
/*!40000 ALTER TABLE `rubro` DISABLE KEYS */;
/*!40000 ALTER TABLE `rubro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sector` (
  `id_sector` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_sector`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (10,'Equipos Moviles','AC',6),(11,'Administraci√≥n','AC',6),(12,'Perforaci√≥n','AC',6),(13,'Carga','AC',6),(14,'Perforadoras Tamrock','AN',7),(15,'Perforaci√≥n y Voladura','AC',7),(16,'eli sector/etapa','AN',6);
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguro` (
  `id_seguro` int(11) NOT NULL AUTO_INCREMENT,
  `asegurado` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `ref` int(11) NOT NULL,
  `numero_pliza` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_vigencia` datetime NOT NULL,
  `cobertura` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL,
  PRIMARY KEY (`id_seguro`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
INSERT INTO `seguro` VALUES (1,'empresa xxx',1111111,11112221,'2017-07-10 00:00:00','2017-07-18 00:00:00','12 dias',5),(2,'1',123,123,'2017-07-10 00:00:00','2017-07-25 00:00:00','1234',6),(3,'123 juan peres',1234,12345,'2017-07-10 00:00:00','2017-07-10 00:00:00','123456',1),(4,'gemma empresa',33333321,2147483647,'2017-07-12 00:00:00','2017-07-12 00:00:00','A',0),(5,'gemme empresa2',52652,500001,'2017-07-12 00:00:00','2017-07-12 00:00:00','A',0),(242,'empres hugo pepe',1414,14145,'2017-07-12 00:00:00','2017-07-12 00:00:00','12 dias',0),(243,'gemma nueva empresa',56213,56213000,'2017-07-12 00:00:00','2017-07-12 00:00:00','1 meses',0),(244,'nueva emresa julieta 34434',45454,45454,'2017-07-12 00:00:00','2017-07-12 00:00:00','10 dias',0),(245,'gemma nueva emresa 41 poliza',54540,545401,'2017-07-12 00:00:00','2017-07-26 00:00:00','5 dias',242),(246,'',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',6);
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupparam`
--

DROP TABLE IF EXISTS `setupparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupparam` (
  `id_equipo` int(11) NOT NULL,
  `id_parametro` int(11) NOT NULL,
  `maximo` double NOT NULL,
  `minimo` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_parametro`,`id_equipo`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupparam`
--

LOCK TABLES `setupparam` WRITE;
/*!40000 ALTER TABLE `setupparam` DISABLE KEYS */;
INSERT INTO `setupparam` VALUES (2,1,80,10,6),(7,1,60,30,6),(1,2,80,10,6),(1,3,80,15,6),(2,4,20,100,6),(1,13,12,23,6);
/*!40000 ALTER TABLE `setupparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisactions`
--

DROP TABLE IF EXISTS `sisactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisactions`
--

LOCK TABLES `sisactions` WRITE;
/*!40000 ALTER TABLE `sisactions` DISABLE KEYS */;
INSERT INTO `sisactions` VALUES (1,'Add','Agregar'),(2,'Edit','Editar'),(3,'Del','Eliminar'),(4,'View','Consultar'),(5,'Imprimir','Imprimir'),(6,'Saldo','Consultar Saldo'),(7,'Asignar','Asignar'),(8,'Finalizar','Finalizar'),(9,'OP','OP'),(10,'Pedidos','Pedidos'),(11,'Supervisor','Supervisor'),(12,'Entregar','Entrega de Ordenes'),(13,'Lectura','Lect horas equipos '),(14,'Correctivo','Ver Correctivos'),(15,'Preventivos','Ver Preventivos'),(16,'Backlog','Ver Backlog'),(17,'Predictivo','Ver Predictivos');
/*!40000 ALTER TABLE `sisactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisgroups`
--

DROP TABLE IF EXISTS `sisgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpDash` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`grpId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisgroups`
--

LOCK TABLES `sisgroups` WRITE;
/*!40000 ALTER TABLE `sisgroups` DISABLE KEYS */;
INSERT INTO `sisgroups` VALUES (1,'Administrador','Otrabajo',6),(2,'Vendedor','Sservicio',6),(3,'Dep√≥sito','Sservicio',6),(4,'Operario1','Sservicio',6),(5,'Supervisor de Taller','Sservicio',6),(7,'Mecanicos','escritorio',6);
/*!40000 ALTER TABLE `sisgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisgroupsactions`
--

DROP TABLE IF EXISTS `sisgroupsactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisgroupsactions` (
  `grpactId` int(11) NOT NULL AUTO_INCREMENT,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL,
  PRIMARY KEY (`grpactId`),
  KEY `grpId` (`grpId`) USING BTREE,
  KEY `menuAccId` (`menuAccId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisgroupsactions`
--

LOCK TABLES `sisgroupsactions` WRITE;
/*!40000 ALTER TABLE `sisgroupsactions` DISABLE KEYS */;
INSERT INTO `sisgroupsactions` VALUES (154,151,1),(158,158,1),(159,159,1),(160,160,1),(987,4,116),(988,4,155),(989,4,156),(990,1,6),(991,1,7),(992,1,8),(993,1,9),(994,1,10),(995,1,11),(996,1,12),(997,1,13),(998,1,14),(999,1,15),(1000,1,16),(1001,1,17),(1002,1,18),(1003,1,19),(1004,1,20),(1005,1,21),(1006,1,23),(1007,1,24),(1008,1,25),(1009,1,151),(1010,1,26),(1011,1,27),(1012,1,28),(1013,1,29),(1014,1,30),(1015,1,31),(1016,1,32),(1017,1,33),(1018,1,34),(1019,1,35),(1020,1,36),(1021,1,37),(1022,1,38),(1023,1,39),(1024,1,40),(1025,1,41),(1026,1,42),(1027,1,43),(1028,1,115),(1029,1,116),(1030,1,117),(1031,1,155),(1032,1,156),(1033,1,157),(1034,1,118),(1035,1,119),(1036,1,120),(1037,1,121),(1038,1,122),(1039,1,123),(1040,1,152),(1041,1,153),(1042,1,154),(1043,1,177),(1044,1,178),(1045,1,179),(1046,1,180),(1047,1,64),(1048,1,65),(1049,1,66),(1050,1,67),(1051,1,68),(1052,1,69),(1053,1,70),(1054,1,71),(1055,1,72),(1056,1,73),(1057,1,74),(1058,1,75),(1059,1,79),(1060,1,80),(1061,1,81),(1062,1,1),(1063,1,2),(1064,1,3),(1065,1,4),(1066,1,85),(1067,1,86),(1068,1,87),(1069,1,88),(1070,1,89),(1071,1,90),(1072,1,91),(1073,1,92),(1074,1,93),(1075,1,94),(1076,1,95),(1077,1,96),(1078,1,97),(1079,1,98),(1080,1,99),(1081,1,100),(1082,1,101),(1083,1,102),(1084,1,103),(1085,1,104),(1086,1,105),(1087,1,106),(1088,1,107),(1089,1,108),(1090,1,109),(1091,1,110),(1092,1,111),(1093,1,170),(1094,1,171),(1095,1,172),(1096,0,127),(1097,0,128),(1098,0,129),(1099,1,130),(1100,1,132),(1101,1,136),(1102,1,137),(1103,1,138),(1104,1,139),(1105,1,140),(1106,1,141),(1107,1,142),(1108,1,143),(1109,1,144),(1110,1,145),(1111,1,146),(1112,1,147),(1113,1,148),(1114,1,149),(1115,1,150),(1116,1,45),(1117,1,46),(1118,1,47),(1119,1,48),(1120,1,49),(1121,1,50),(1122,1,54),(1123,1,55),(1124,1,56),(1125,1,57),(1126,1,58),(1127,1,59),(1128,1,60),(1129,7,23),(1130,1,181),(1131,1,182),(1132,1,183),(1133,1,184),(1134,1,185),(1135,1,186),(1136,1,187),(1137,1,188),(1138,1,189),(1139,1,190),(1140,1,191),(1141,1,192),(1142,1,193),(1143,1,194),(1144,1,195),(1145,1,196),(1155,1,197),(1156,1,198),(1157,1,199),(1158,1,200),(1159,1,201),(1160,1,202),(1161,1,203),(1162,1,204),(1163,1,205),(1164,1,206),(1165,1,207),(1166,1,208),(1167,1,209),(1168,1,210),(1169,1,211),(1170,1,212),(1171,1,213),(1172,1,214),(1173,1,215),(1174,1,216);
/*!40000 ALTER TABLE `sisgroupsactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sismenu`
--

DROP TABLE IF EXISTS `sismenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sismenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sismenu`
--

LOCK TABLES `sismenu` WRITE;
/*!40000 ALTER TABLE `sismenu` DISABLE KEYS */;
INSERT INTO `sismenu` VALUES (2,NULL,'Seguridad','fa fa-lock','',2,6),(3,2,'Usuarios','fa fa-fw fa-user','user',2,6),(4,2,'Grupos','fa fa-fw fa-users','group',1,6),(5,2,'Menu','fa fa-fw fa-bars','menu',3,6),(6,2,'Database','fa fa-fw fa-database','backup',4,6),(7,NULL,'Mantenimiento','fa fa-wrench ','',3,6),(8,7,'Equipos','fa fa-fw fa-cogs','Equipo',1,6),(9,7,'Componentes','fa fa-fw fa-cogs','Componente/asigna',2,6),(10,7,'Preventivo','fa fa-fw fa-tasks','Preventivo',5,6),(12,7,'Backlog','fa fa-fw fa-tasks','Backlog',6,6),(13,7,'Registro de Parametros','fa fa-fw fa-tasks','Lectura',10,6),(14,7,'Predictivo','fa fa-fw fa-tasks','Predictivo',7,6),(15,7,'Solicitud de Servicio','fa fa-fw fa-sitemap','Sservicio',3,6),(16,NULL,'Pa√±ol','fa fa-briefcase','',4,6),(17,59,'Articulos','fa fa-fw fa-barcode ','Article',1,6),(18,59,'Stock','fa fa-fw fa-cubes','Lote',2,6),(20,59,'Orden Insumos','fa fa-fw fa-check','Ordeninsumo',3,6),(21,59,'Remitos','fa fa-fw fa-paperclip ','Remito',4,6),(23,16,'Herramientas','fa fa-fw fa-sign-out ','Herramienta',5,6),(24,16,'Salida Herramientas','fa fa-fw fa-paper-plane','Order',6,6),(25,16,'Entrada Herramientas','fa fa-fw fa-paper-plane','Unload',7,6),(26,16,'Trazabilidad Componentes','fa fa-fw fa-exchange','Trazacomp',8,6),(28,59,'Punto Pedido','fa fa-fw fa-bookmark','Lote/puntoPedList',10,6),(29,NULL,'ABM','fa fa-book','',6,6),(30,29,'ABM Grupo','fa fa-fw fa-server ','Grupo',2,6),(31,29,'ABM Sector','fa fa-fw fa-sitemap ','Sector',3,6),(32,29,'ABM Contratista','fa fa-fw fa-life-ring','Contratista',4,6),(33,29,'Parametrizar Predictivo','fa fa-fw fa-bullhorn','Parametro',5,6),(34,29,'ABM Deposito','fa fa-fw fa-qrcode','Deposito',5,6),(35,29,'ABM Tareas','fa fa-fw fa-street-view','Tarea',6,6),(36,29,'ABM Parametros','fa fa-fw fa-adjust','Altparametro',6,6),(37,29,'ABM Proveedor','fa fa-fw fa-truck','Proveedor',7,6),(38,29,'ABM Familia','fa fa-fw fa-check-square','Family',8,6),(40,7,'Ordenes de trabajo','fa fa-fw fa-tasks','Otrabajo/listOrden',8,6),(41,7,'Administrar Ordenes','fa fa-fw fa-thumbs-up','Envio',10,6),(43,59,'Nota de Pedido','fa fa-fw fa-cart-plus','Notapedido',11,6),(44,NULL,'Compras','fa fa-shopping-cart ','',5,6),(45,44,'Enviar Pedidos','fa fa-fw fa-envelope-open-o','',1,6),(46,44,'Recepci√≥n pedidos','fa fa-fw fa-check','Administracion',2,6),(47,NULL,'Reportes','fa fa-line-chart ','',8,6),(49,47,'Rep Informe de Servicios','fa fa-fw fa-file-text-o ','Reporte',3,6),(50,47,'Rep Ordenes de trabajo','fa fa-fw fa-file-text-o ','Reporteorden',2,6),(51,47,'Grafica de predictivos','fa fa-fw fa-pie-chart ','Grafica',1,6),(52,47,'Rep articulos','fa fa-fw fa-file-text-o','Reportepedido',5,6),(53,29,'ABM modelos','','',0,6),(54,7,'Plan de Mantenimiento','fa fa-fw fa-calendar','calendario/indexot',9,6),(55,7,'trazabilidad Activos','fa fa-fw fa-exchange','fa fa-calendar',11,6),(58,NULL,'Equipos','fa fa-exchange','',0,6),(59,NULL,'Almacenes','fa fa-check','',4,6),(60,29,'ABM Marca','fa fa-fw fa-copyright','Marca',9,6),(61,47,'Rep articulos pedidos','fa fa-fw fa-file-text-o ','Reportepedido',6,6),(62,29,'ABM Area','fa fa-fw fa-asterisk','Area',1,6),(63,29,'ABM Clientes','fa fa-fw fa-user','Cliente',2,6),(64,29,'ABM Criticidad','fa fa-fw fa-line-chart','Criticidad',3,6),(65,29,'ABM Procesos','fa fa-fw fa-sitemap','Proceso',5,6),(66,29,'ABM Componentes','fa fa-fw fa-cogs','Componente',2,6),(67,29,'ABM Unidad de medida','fa fa-fw fa-thermometer','UnidadMedida',11,6),(68,29,'ABM Sucursales','fa fa-fw fa-building','Sucursal',10,6),(69,7,'Informe de Servicios','fa fa-fw fa-file-text-o','Ordenservicio',4,6),(70,29,'ABM Sistemas','fa fa-fw fa fa-cogs','SistemaABM',12,6);
/*!40000 ALTER TABLE `sismenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sismenuactions`
--

DROP TABLE IF EXISTS `sismenuactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sismenuactions`
--

LOCK TABLES `sismenuactions` WRITE;
/*!40000 ALTER TABLE `sismenuactions` DISABLE KEYS */;
INSERT INTO `sismenuactions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,3,1),(7,3,2),(8,3,3),(9,3,4),(10,4,1),(11,4,2),(12,4,3),(13,4,4),(14,5,1),(15,5,2),(16,5,3),(17,5,4),(18,6,1),(19,6,2),(20,6,3),(21,6,4),(22,7,1),(23,8,1),(24,8,2),(25,8,3),(26,9,1),(27,9,2),(28,9,3),(29,10,1),(30,10,2),(31,10,3),(32,12,1),(33,12,2),(34,12,3),(35,13,1),(36,13,2),(37,13,3),(38,14,1),(39,14,2),(40,14,3),(41,15,1),(42,15,2),(43,15,3),(44,16,1),(45,17,1),(46,17,2),(47,17,3),(48,18,1),(49,18,2),(50,18,3),(51,19,1),(52,19,2),(53,19,3),(54,20,1),(55,20,2),(56,20,3),(57,21,1),(58,21,2),(59,21,3),(60,21,4),(61,22,1),(62,22,2),(63,22,3),(64,23,1),(65,23,2),(66,23,3),(67,24,1),(68,24,2),(69,24,3),(70,25,1),(71,25,2),(72,25,3),(73,26,1),(74,26,2),(75,26,3),(76,27,1),(77,27,2),(78,27,3),(79,28,1),(80,28,2),(81,28,3),(82,29,1),(83,29,2),(84,29,3),(85,30,1),(86,30,2),(87,30,3),(88,31,1),(89,31,2),(90,31,3),(91,32,1),(92,32,2),(93,32,3),(94,33,1),(95,33,2),(96,33,3),(97,34,1),(98,34,2),(99,34,3),(100,35,1),(101,35,2),(102,35,3),(103,36,1),(104,36,2),(105,36,3),(106,37,1),(107,37,2),(108,37,3),(109,38,1),(110,38,2),(111,38,3),(112,39,1),(113,39,2),(114,39,3),(115,40,1),(116,40,2),(117,40,3),(118,41,1),(119,41,2),(120,41,3),(121,43,1),(122,43,2),(123,43,3),(124,44,1),(125,44,2),(126,44,3),(127,45,0),(128,45,0),(129,45,0),(130,46,1),(131,46,52),(132,46,3),(133,47,1),(134,47,2),(135,47,3),(136,48,1),(137,48,2),(138,48,3),(139,49,1),(140,49,2),(141,49,3),(142,50,1),(143,50,2),(144,50,3),(145,51,1),(146,51,2),(147,51,3),(148,52,1),(149,52,2),(150,52,3),(151,8,13),(152,54,1),(153,54,2),(154,54,3),(155,40,9),(156,40,7),(157,40,10),(158,55,1),(159,55,2),(160,55,3),(161,56,1),(162,56,2),(163,56,3),(164,58,1),(165,58,2),(166,58,3),(167,58,4),(168,59,1),(170,60,1),(171,60,2),(172,60,3),(173,47,1),(174,47,2),(175,47,3),(176,54,13),(177,54,14),(178,54,15),(179,54,16),(180,54,17),(181,62,1),(182,62,2),(183,62,3),(184,62,4),(185,63,1),(186,63,2),(187,63,3),(188,63,4),(189,64,1),(190,64,2),(191,64,3),(192,64,4),(193,65,1),(194,65,2),(195,65,3),(196,65,4),(197,66,1),(198,66,2),(199,66,3),(200,66,4),(201,67,1),(202,67,2),(203,67,3),(204,67,4),(205,68,1),(206,68,2),(207,68,3),(208,68,4),(209,69,1),(210,69,2),(211,69,3),(212,69,4),(213,70,1),(214,70,2),(215,70,3),(216,70,4);
/*!40000 ALTER TABLE `sismenuactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema`
--

DROP TABLE IF EXISTS `sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema` (
  `sistemaid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`sistemaid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema`
--

LOCK TABLES `sistema` WRITE;
/*!40000 ALTER TABLE `sistema` DISABLE KEYS */;
INSERT INTO `sistema` VALUES (1,'Electrico','AC',6),(2,'Hidraulico','AC',6),(3,'Mec√°nico','AC',6),(4,'Electr√≥nico','AC',6);
/*!40000 ALTER TABLE `sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisusers`
--

DROP TABLE IF EXISTS `sisusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisusers` (
  `usrId` int(11) NOT NULL AUTO_INCREMENT,
  `usrNick` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrComision` int(11) NOT NULL,
  `usrPassword` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpId` int(11) NOT NULL,
  `usrimag` blob NOT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisusers`
--

LOCK TABLES `sisusers` WRITE;
/*!40000 ALTER TABLE `sisusers` DISABLE KEYS */;
INSERT INTO `sisusers` VALUES (1,'admin','admin','admin',0,'21232f297a57a5a743894a0e4a801fc3',1,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\◊\0\0\0\◊\0\0\0â}ƒµ\0\07<IDATx\⁄\Ì}˜w◊∂¶˛ày\È\Œ¸rg\÷[3˜æô;\Î≠7s\Ôºˆ\≈cccl¿òkõå¡òl¿,¿\‰úA$Å@A$ëÉH\"H$\"cí\…9Z ˆ\‘w\ƒ.ùÆ>∫ª∫˚t´j≠ΩRw\’9uˆwv\ﬁ\'\„yA-Je*üQã\ÍøÛ:˝ıØ•fÕöQ”¶M\È\Ì∑\ﬂˇgz\„ç7\Ë˝˜\ﬂkﬁº9µj’äæ˛˙kO‘∂m[˙¸Û\œ\≈˜˘~\Ôæ˚Æ¯\Ó\¬ˇÒ{¸\Ï\Â~_~˘•˘]ô>˘\‰[˙Ù\”Oïﬂ±Rã-®u\Î\÷‘Æ];\œsL4aúXº≥\’CjS™Û†e§Ú\‡\Ô.Æ/\”;\Ôº#¿fÛã)\0\ ˜\ﬁ{O\‹\0\√7n\‹X¸\‡s˚~Àñ-M\‡ª\r6\„|Û\Õ7C\∆	a∏áLı\Î◊ß?¸Pl6òøé@\√&É±bC:ºÄK7j\’\‰u%†\"ëL\—ûÅ\Á’©S«îíN\œlﬂæ=}ı\’WT¸qòdeê\0∏^Hı}\'zÎ≠∑®AÉlÒ~7¿\“\0\\Y}^3ôR\√O	\ÂÖ¿®¸|H	ß\œ2∞>¯\‡Éêç\0Røì˘96º\‹˜«ªQIu¸-\—Ô¨¶,%¡U2±∂©\n&ìAXEt\Z$™\Z>ã\Ôx±\Õ¸&å6lêÇ\0Z2%Z∫,#ï\Ì¨d0©Ã¨ª\œ¿÷Å\„É` ]\‘2lPoô©Y\0\0ì\r∞tqr§∏æoU•b∑M&s≤#\‡qr`0∞\0Bø\’??7\nÃám9¸õåç\Ô\œ\∆\Ê	/p\0Æ“∂QµM	êlÜdp\Ÿ1!ú¨\n∫\Ÿd∫π\…1\ﬁd©∞ê®P[∞KÛp%\\\‘¡gp\Ÿ˝ù4ïÄeï\"ò# K§:m@x`õºÄ+4æ´\Í Sì&Ml¡\≈¿KU`YAˆ\—G	ê%Ú\›\„ôxá\n\‡ä#A=`[@ÜÉ\ «ô vªÆó†r*$\ÊîHß{c\·¿g\'Ü˙?vb0ú\rà?q âêÆÑ\œ\·;¯.\‘“ø˝\ÌoaûB¸\r;<PW\ÁÖ66\'GéüÄf˚fA\0Æ8≈¥ú\\\ﬁn\Ã¿Ò0=≤*\‹2\Zêé\ƒiD»®∞˛&?ãÛu∞	aèAuKî˝≥ \0óœÑ†b4RÄ≥î¯\Ã\‡ÖX±Ç\r@\„å\nY¢Yô ßì\√|\„-•\Ÿ9oq\0.üm-ØRã\Ã¡Q?THvKÀÅVH>ƒÆ µ\0(d†\„π\ÈÆ∫\ÂZ\∆s\ﬁ¸~SM=\ÃH°\◊Réx\Z⁄∏?∆ÅùZNú≠[∑Æß4®H§$$@\Ìñ¿ã\œ‡≥âHVˆ≤\≈s∏™©áZÉ´iÉ◊µÒ™lv«ö\Á\∆Q%\ÿFCúîõ,èb\"ºá©íΩ°-∏ê_Üâ]Yw5«Å\"\ÏB´çá\Õ\ŸÛ®ır*ûdÇÙ\¬\ÁUua∏7ûë.™*\Ásv˛¸ı\0\\~∏\ﬂu™?rS9\÷\r`¯¨*ñ6rus¥Ñ\0gıä\‚w\…Ltˆ;3&í{3tvd§j  ±ì¯´på\0±\ )T¿â√≤dLeiñJ\Œ\r-¡µ¯\«\⁄fOåtÚ™±ç©I¢íT\ÿAj{%∏\ÌTG\Ïˆ\÷\nh0h™æ_Æ\◊=5JKpq˘~∫\ÿ\nr≠˜ﬁê3>¢ô\'TOnúiŸøµyO*ÇåKStŒú\œT\¬¯gn4j\‘H\0*ñÜ1\0ïwì\Ì6nL\„D¯ú\nå…™êéµÕÇŒï\À∫™Ñ∫{	#Uabëún$É¢^Ωz,P˚¢µ\…]\0Ræo*Ωw∑Æ\“+#∆ø≤6\⁄¯ﬁÅµ\Á§\‡_|!\Ó\ÌDm⁄¥	IPv\ZTUYuM)∆Åe]•óV\‡Ç˜Gß“íhÑŸ•>®O7\ \Ï˝-mõ3ú\ ¶(i\„\Ïî;!ì∫u˛\∆\÷˘!˜∂à\’e\‡!eã;D\…$˜˚Hï<Ii\Ë(Ω¥óÒÎº®ú\≈)Jº\€◊ØWó&Ù\ÎD«ñM§ Ω9Äê\·ﬁ∏\'{\„9\ÿ~êpênr`∞9N\Ê%n\ÿ^)\0ÆHr	\„©jÄ©U˘}™Ù§æø¢¢¨!Q\ J\ÁVO•o\€\'O\ÿX™AML[LW\€+CGºü\È2U\Ÿ	$d$]lõ~Ù>unŸåf\ÓN•9£\Ë˛∂9æÄ\ /z∏}æP7w-C+ß˝L£ˆQ™ú^´≠Ò˛ \≈dıT\«K/\›\‚^∫π\‡£-ä¥\÷©\‹\’Nµ¿⁄Ω≠	ûì\À\'hûhi≈§Å‘≥csS3\ 7x\…8a©ãÉ&q/ù≤62t≥∑¢\…\Ë\Ê∫+f\0Æ$\∆\Ô\‰ùw”ÑæT<c†I%F§xº–çM≥\ÈP\ÓZ3yÄ\ÿD\Ï6π∏îr∞\ÊC\‚=\Î¶&r\»Cßú√åTµ∑8Q;gí´b>H˚¡}\«ÙlKè\◊O1\È\…\∆i5Xv\…∞AZp≠ö5≤\Õ\‚\‡#ò‰£ît\nÙsŒ°N\Ì\ÿ2R\—\ﬁ¬Æäì;\0(ßs´†\Œ\‡sı\ﬂyõÆØÆäsk<∏ú@\'\r\‘c8l†2[¡&gÜ\Ëì\‰Ö.ı^⁄ÄÀãΩ∞\‡3NMcd\‚\ﬁ3˙w\÷\„\rS\È≈ûÖê¢êrv`\”¡\„z/]\‹ÚZÄã;<\Ÿ≈∑∏1•µAåàà’®§÷≥≠≥¿\ƒHπ£æQ#uâáâ3\⁄\ZºÄ\Àz÷ñ*h\n`}ˆ\Ÿg\Á\Õ\ŸJ-É^/\0\‚]Y;]\ÿlêfê`â\Ëg\Ë≈±°C#\—ùÛ	˘l+˘¨_˘\Ë\”h§÷ìM\”P\ƒImD0Ÿéâ.1/-¿•jDÉ¥n[¶:•1Z©82\‚G™Cä%\€—°Küç]íuΩ\Ïv\»\Z*µpO´\‘*a\‡»à;¡\À»ééd§≤âSYö\‡2ù^Ç«êd^˙F\‡~ôùæ\n\÷\”-3\ÊO¡ï\œ^\≈Dú9\ÿ]\„¡\≈\Œ/;ú{ãK&\Œ\ÂéTBç\Ï∞DûÒ≈Å\Ó\Z.\Ó\Ô%!\‘\…\ﬁB0ôSù:5o¨¿Kò|;,Qj\"∑_´Ò\‡Ç\·\Èµ8\“N\r¥f¥#á\–\n¨¿K®áñàäú©Q\„¡\Â5ûã\Â˛ráY˛˘ì\ﬂSJ≠g€≤&\◊@Mî\œÒjäÉ˚\"CæFÉ9`^è7egÜ\\ä@\·ªh¨ió†\ÀÙ|\◊¸Ä¡5rv4mX?§Q)\';\Ÿ\”l≥πô\0Wçw\≈GRfgóüc1¨˘ÖNéP¿\‘zR\–PˆÉX$ld¶Êç´Z\'Ä∞¶\ÿ<±\÷rgbÑd\‹jªj<∏ºz\nπñ¿≤K\⁄\≈\ﬂZ~\“P	¨¿\ﬁ“è~\€>GπV\Î&Ùwî^pjy	\"\◊¯\r/m‘†b\'≤kˇ\Ã\ÕbpüÖô]\‘ˆVê®´=ﬂù∂NG\Ê°\…˝:9Ç\ZLê˛\‰C\rtp/á†Æ\ÀI%\‚[zíuù†&∂¯¥ë\„Z\√ˆˆrÜ≤\…:z\n°6h\–¿s7Y86ÏºÑÅ3C_z∫yF∏∏!©π93Xã©\—YÒvûB®àh±\Ã˝\‹2\·!’úºÑÅ3CoßÜºNàO≤\rnG^\»5\Z\\*O!Äƒ≠öΩff∞^8úö;5äfá¨<á\"Vi£±†q©∏∏\"¢FKFíS\Ë.H9ª¯ YWsßÜ°Æ´¿Öêã\›\Ÿe©í¥õTpEr\‡ÇõΩe\ÁÇaw95<Ü.\Î˘\–\ÁrÛ\‡ír\nΩv{ä\≈\ﬁ\n<Ö©\„1dpTHfB\«&!o–©WG\0.Éê˚\Â%a˝\À\Ì¿\≈\∆k¡\»^Åß0ç¿egsAU\‰3\≈\‡MVi=¢aiMoPm¬Æ*æÖ\‡£∏Ç2ì\‘q«ªÅj!}\ÁÜJÇ\ÈR‚ü≤‡≤û#e¨¿\rü^\‡íΩ\»|Œò5\œ0\0W\‡≤m\„<FÛœÄÅS\'\÷\≈q.ª¸Q∑≥§¡+∏^ÅÜj$\‡¬é\√\ﬂcgÜ]’±p\√ªb¿¿©\ÎBÜÜ\\Li\0Y∑c\\ì\Ó-tKgapa7ì≥\‚4ªF4∏j&∏Xr\ÈrNW“É\»nß\‹\„Öq)ø|\ËÉK’õ0\0W˙Å\ÀK\0ô{\≈\ÎråP\“¿\≈-\’‹™ê(∏^≠{Ns±K{\nJ˚SÉ*v\Œ)9¡ö\¬Y\r∏X-\‘!Ø0\ÈYÒn±.\0J,\\\ÿ\ÌÇ\ÏåÙIÅb[<p\Èr∫dR¡\≈m\’TÒ\n¸yª\ÀjóSÄ+Ω¿\Â%ıIóñjZÄ∫±\Í\Ë \ÿYhX\‚îS\»\‡räq\‡JMp©\ Nº\‰†\‡RÙâ∑∫\‰5jdVh™¨x|\«1\∆Ä+%¡Ö5eûê	1Q8±ú@SAó\‘\'möÇ\ \ŸÒ8ã\ﬁA\0ä£\Ôv\‡räq\‡JMpaM\ÌCÁÆΩ\0ë*Ñ£KK5m¿≈™!˙e\‡Ö\·\≈Y˚$\»\Át\‡Jop!n©JÅ\¬\ÀyÖ\ÿ|ë∏k\r\„\‡≤–•yU^CÄEUÖlw∫	\ ∏“ª`\“\Œ\Ê\¬\Ÿm\0FŒàGù`\0.\’\–KÚÆ[\ÍS\0Æ\‘ó] Ÿ≠\ÎìN˝\nµó[\Á]’°w∏\“\\àoF\“ıI∑\‘\'m¿\Â%†å˙ù\0\\\È.\ƒ-U±.7W<ÛD\0Æ\ T∂V \‡J?pq¨ΩQ¢ó.©OZÅãUCk@\Ÿ\Í1\‰\Í\„\0\\\È.éuE.xõpπ®Ü¯\ÿ\È\‘,±∏\n9\0WzÇãc]rN©∏tj™%∏X5\ƒKUÅ™∫∏\“\\™Xó[n°.ßIj.ß2>îAés\ÈO\È	.U/\r∑¨xùZ™i	.r\√T™!2\‰e5!H\‹M_p°Uû5\÷\Â\\:’™5∏\∆w\rW\rÒ3R]\‰L\r/\‡ä§ïıÉ\¬	t∑`d]\À˛ë.N\ÌfK¯;ﬂèÖ\…pØ[πÉ}9TÆ|psÒo,˜êﬂÉ\”;\0a\‹\÷w\Áı˘*p©\…n\‡?\Ëî˙§%∏TßüpäãLv;¶\’Kô?\‡JV*\Ìˆ∑≠\Ì\Ì˚\ÊM:˙cS:=¢uUá\ﬂ\·3¯@+∏,\‹\œ≤iö\„F\¬\‡¿g˜i\Ë\Î;\0a˛vc0+ëw\Ã\r[7U¨\À\r\\:u}\“\\≤j®ä\ sº\ÀK%≤∏ò°ø\ Åë¡\– y~H.ê|O~éıYâ$\'†[O:±+öt;\·ü\◊)ØP[p±j®j^√™!í6\›zh®¿Ö;ªt¨\‰á\‘bHuõÄç\r\Õ+∏p∏º\√\ÿDô\‡nWyíu:™U{p±jàjdª\ﬁÒ^∫?=\Ÿ∫[≤˙•ù\◊1&\…N=Lñ§rìbÚ\\\Ì¿\ÂV\◊\≈ˆòÆ©O⁄Ç\À-S˙7∫Bπı-\‰v\÷XL,™RE˚˛c:3∫]û\’Àêj#\Ë¡öq!Ñ\ﬂ]ù\◊œ§Ûæüó	˜ê©§\À;\Ÿ%ÒÚ\ƒ¡∂ä`\÷yîg~6W˘]\\\œˆæ@¯=>ãwæ∑\„J)\∆ t\ËR≠NÆA∏\“\n©L\À@´Aa-ü:\n^X¸c\Ì\0\\ëQZ¡%øP∑@2t}´\Z\∆HT`Úõ¨\‡¥˛OW7ò\ÿ\È˘Òû?\œ99¨E–†¢[\œE∂∆∫¨Y\Z0¨∂∏é\ŸZÉÀÆøÜ\\\ﬂ\≈=\„\ÌÄuw\Ÿ\”àÖ\≈N|+HB*äw,Ißπ^ò⁄ïˆ|\ﬂÿçúA µ\„XóHN•\‘\'≠¡%ßC©TC7w¸ÉU\„åE¸ÄJª\÷jïRõ\«ı§)=ø¢\·\ﬂ4£Oﬁ©m“ü˛¯\ﬂ\È˜øˇ}\‘$\ﬂKE≠\Zæ%û	*˙≠á\ﬂ`∫∞z2\Ìû3òf\r¯Ü\∆ˆjM?¥n\‰:Æwkˇﬂò\Êç\ÔÛΩ∫4´oŒØ|˛O∂™#6;lz∑rá\ÿ∆∫\"lı\0\\>d\ C5t\Í∫{bps˙uˆ˜\"é\"/*\0+Ä¸¶?˝\À®GãF\—\Í\Óñ,¶˙u˛]´πÒÜ£TvhX+lÜ*p\…\Â˛©î˙§∏\Óœ´Eß\’\n3~ÎΩ°NáB.3∞z±`Ú±≠O∑\Œãô˝C;s¡[7˝êFˆ\Ó@\”vßmsGz≤E\Ã\ƒ˜≤£Uìã\ÁÇ0Üw\Î\‘aƒ∂ü\‘@âX\Î&ı\05¡˙?ˇÖö5|èukOc\ËF3áÙq◊Å¸)1\œ˝Ùö9!s¸ÒõT\Î\œˇfJ∂+KGVÉ´p|»ô\»Úö…Ådˆ\n:ë\\\¬ŸßäópΩ¢;Yµh_áZJVﬂÜ\ÍLy\Œ\÷¿\ﬂ˙¥˝\Ã5ød\Œ\–WR‚èæ0í_Ù\Ï`!]ÿæîf˝¸=\’˛Ûøä1BäE¢2®z¥lB\Î≤FR\Â…¢zQæ5©s\Ï\⁄\‚S1æÆ_|dÇ\ÎYQVÿ±≠™@≤pq*ú\Èç\ÏP\≈S∏\¬n#SÂºµ\ﬂ7µçy\·ÖC™!\‡\Ëv√†éüWÌ†Ü§àòAJ\◊–É=ts\√¸®\ËF\·\€{Wîm4Ap∑d\r\’˛K\’N\–xÄà\œ\œ\Z“ã*Ol\r”≥Ck´ü[≤äXı|nÆõMv\ÊF$\ÕyêÅ•\ +¥ÇãKå\Ï¿\≈\'õÙh˛±\‡3û\÷\'\0= ©Ú¸T‘πe3\ÂY^¯?´nY\Z,f\ÎOœéU”â]Ù\€\ÈΩ!Tq\·==SJ∑ˆ¨£k\€\n|°;W\”\›[\Ë…â\‚\Ígù\ŸGïøî\ZTBïgã©Ú\‘vj˚Y\„*∞ˆìp±:XVòMïßwV\›˜ªxê*Ø≠¶´\'\Ë∑_\”√£ª\Ëˆæ\ræ\Œ\Î\ﬁ¡-a\ÔY˘éê˜\\˚\ﬂˇ\"\∆Y8\·{«§]ô\ÍøÛ∂ôe.Æ\„*\ \Z\"\Ó	b~o\’hp][\À,\⁄e)¨ô<¿6\Ê≈û\"´«∞ıGuï\∆ı≈É;\Ë≈ï\„@v\‹(^OOo˛Jø›ΩIáwl¶ù´Û®d\„r*5hÀ≤ìV\ÂfS¡\‚l*\\öCª7–∂µKhÖÒª«è_OÆ^åxsw!=:^,¸…©˝√ü§ó\◊OõTyfó∞ëX5t≥Ω\ r´%ÇêP®\‰˚1=øtåûù;Dè\ ˜\–\√cª\≈Xn\Ì\ﬂBï\œ+\Ã1ñ\Ó\ŸEÖ\∆|vlX.\ÊÄ9Å\÷\Ê/0\Á∫kM\‹\\@˚7.£≠\Às\Ë\Ó\ÂÛ\‚˝<8}DÄs\nyóÀåg•Áóè\—¿>]ï\ÎQ:\À>71L\'p±\‘j’¨QH\ﬁ(\Œ¡[5\Z\\\Â˝kôi1Nå\‘Ù£˜ï›°©W%\÷˙?ˇ;l!a\‰W^´fh¸å˝≈Ø\'\‡ûû.\0∏[∂\«dºä\ﬂ~£U˘i˚Üe¥kc≠^≤\–d<+m]ì/\0∂e\Õ:r`?\…\◊\√ÛÂÇ©\Ÿ*1H .s\ÃÔø©$ñ\ƒ!\‡2$ü<?+aû◊∑Ø§\Î;Vá\0Àú\„z\Ãq9≠\Ã[`;\«\"x™9b#\¬}\Ô6lº_\À\√\∆q±tã\\vÙ.U%2k-•9£BxÖ≥q¿[5\Z\\lo©í:eö=∏ª2ôóù\ZVè°j!Û&™√ÖJ∆É\Zxc˜Zzt\ÈL(n^øFW\ÂÜ\Ì\Ë*ÇÙ*6vˆùÉ\Ó⁄∫ë¨◊ΩÚR0Hë`]-ØR\ÈÄ`à\∆›Ω;z¿\Œ\Ìµ\‘A\0†\‚·Ω∞9nX\·qé\ÀQÒñbé\≈\€B\Á¯\‚\Èc∫mhwJ6 á\Ã\—PW\Îøı◊∞qè¸ˆsO\‡≤6\Âuá\…`\Â\Œ!M∂›ïtpïvˆÆ˚\€\Ê\–GoÖó¢p3H/\‡2–∞G‰Öá∫5\…\ t\Ãxõï\Ãt\È\‹	ÒªÚ≤√∂å∑\«`<\Ï˛{ä6ë\Í¿¿\‰&\”¡6Ç\ƒy\Âx®˝ˇBÉπà[!,TF\Ÿınn\Ï¿\0P\rI(\œÄVKûcÒ\÷\’Ùº¢BH≤\’KªÃ±ÄˆlW\œR˙VÒ:°é\n\Ì\‡¸>€ç\√+∏¨ˆ6g\Á\\Y;\›\\\‡≠\Z\r.v¡\À\‡ÇﬁåLq´[~R\”◊îùyU9Ü\Ôæˆg{p1^:LèO\Ï6É¨&\…l\'H.◊≠\◊m¡µ\’Pï\\Gïê\›u´d=9∂Ω\ ˘ yÙÓñÆ\r	,#~\Â4FLå?èòVòóL}˘à)µ`©.Ä	\‡⁄øc=›øsS\Ãq˝\ e.s,†\√˚ãm\Áàg]ﬂ∂å*ém6«£\◊\ \·\›<ÅKegwoö≤îÖ¡\ﬁ\n\‘BK=2\≈\Ì2∑T∂\⁄^–Ω≠\‡\⁄6Ò;˙°uìêÖÄÀ†˚ªñ“É≥G\…\Ì*»ôMŸì¢\≈”á–¢©ÉiX\ﬂ\Ó4‰ªÆ!4f`oZ2k\Â\ÕJs\∆§\À\Œ\€\ﬁ\Ô≈≥\'tª(?ê><V\'`\…\ƒ\0É\ƒsr\√?<w\‹qékó\Ã7\Á8g\‹¿∞˘Å¶\r\ÔGÀ≤Üã9\Œuô#\œÛfë∞£õB¿Öçv£ì‘í¡eµ∑†ΩÄ∂¥™\Ê`ÏíØÒj!ÉKvh∞˜ˇ–åŒç\Ì \ËH\ﬂFb∑≤ï\›\‹ÒM\ÎΩ.,¯Û\Á\…\Àu\Á\÷Mö<¥\Õ\ZŸõ\Êç˚ûM\ÏG\ÍJv1®+\Õ÷ì`\»◊óf\ÔE\Î\nr]\Ô˘Ú\≈Û0Ùh\◊\‹\Ã\“\⁄\Î\‚EÒêF+v˝L\ƒs\Ã6h‹Ä\Œ4^Ã±\ÕÛ›´9~/\Ê∏aeûßw˜≤\‚©p\À\À\‡Bö◊ã=Å\≈\ÕA.d\„XX\„;˝MÜºÒZ\Z5\\r\ ø.É\«\Ôêw\∆/˚\“Ùû¥Ûˆk\Î∞[$H0;\Z\÷/úÒ.¢óoä]\÷\È∫rÒ\Â\ÃK≥G˜∂pB?Z<πø†l\Ÿ\„˚R\÷Ëæ¥o\«fwÜªsI0ºu,H[b\ÊÛÆ¢\ŸT±s5y\Î?\Ï\Á\«.˙[ø\–Àß]fù#\0\¬\œ\ÿ<\Êé˚Åä÷ØrïX\0û…é\Zy~êª≈∏8àåÀ≤\‘B2\‚_HèbpqÆc~oqÆW//…ú .UG\÷4øldO\„wx\È≤j\»:∏\›\·\„p˜\nâYc[\’	L\0;\Ë\ÈÖcTqˇ∂-\„=∏èäV/†-Y¥ı\Ì(\\Hvm†\'èªK+x\œGòU&\œ]öp=\€:ã&wo\Ó>øWÙÚ\ﬁUWü:zêvm\»ô#~ﬁªu•\„_8AON\Ì£Áßãm\ÁáÇhLcl\nN¿:2HXlìùW\\ +˜I¿Ø∫pÒ\Ôk|ú9`¸2Pö.íY5îì:ÒˇıC´î\\v\Õj®t≥Kdz≤%=:ºôn\Ó\\Iè/üqõ€Ö]¸\≈˝\"û&\Ô\‚VÇC\"“ºB¡†¶“©úüM\’N\◊9Bí ´∏{Ébπn\Ó\ﬂOw˜¨¶G%Ö¶m•\"∂\'Y\Âµ+\Ô∑K\ \ÂF0;\0è7Zà¨&s˜+P≤Ûµ\»-¥+ygè\·ı™w4\√\Ó\ l\⁄¿ÜcNù†8®luj∏QE˘6\·¯∏π5_\Á7˜nN0ñ	Ü+\›D˜˜≠@ıÚv¡ÔöùqC\Õ{+FAòK\ﬁmn07Ä\„\ﬁ\·bnª›º\√¬ÜÉwáÃìÖûûÛ\‚\ƒ6\”\ﬁ\ QUøÜûín\Œk56Q\Œ#Öâ¿˝G\‰w\";√Ç\ƒ]…©Å™akß&¸uY¸\“Oom\⁄]\Ïí˜ÆEô\ﬂVgiD\0.[\Ô[Ò2%9\Ì\ﬁv[	cÉ\„%íRv\n@-⁄ïıì)ù=I/©m7∑h\ÔY∂f^àJ(¿eS\ﬁ/\Á\¬Qeµ∑fváÉã[\»\ÔÑ+œÉ\ƒ\›WtaD®\›%ø,±;/í_˙/ì:Saã*pÒ\À˜.V\r£ë^Ò$x¯x\\´GE^ïµ•ÚO∑\Ã0%\·u\‘e~≤óPˆÇ:y¢™x&\÷*°.kø\Ê#T\0ÆWÖí™xªU±3õEtÜä\»NçH¿ı∞p¢\ÈíG\Zé.å\«YP[·úà\\ê\0\0◊Ωï£Ö\ \≈@YÚ\Z\Ão›ú±’õ\⁄+/(\¬N\‡\‚*dk¢∂\Ï∏¨˘®r\Î<\n&µ©D\ÊL\r´jù˙ˆíüC_æÒπñ\ÔVW({◊É\’\„E`ô\Z	≤\…f<VA™¶#\Ó\Î^4[Äæœ∂W¨\Í°Ñ\Á≥˚\„ÚZj\¬\Œ93\„\€ˆmCD\Ï\”bo±Jò\Ï\Ã\Ì¿%«ªd\’ı9–´C‹¥}	èa$í\Î˛ ±!1ØHçø	™©5ø6TƒßÑ\Ï\Œ\‡NCEº≥yñôw\Ëá}∞8Q„ëã?Ωz\nep\rh\ﬂ\\Ù2\‰\œ\\õ\◊?§˛OV	ì\ﬂ\“\\7¶©UCé]\»/N\rxπ:ô¡eÁ™í\\\„Ñjàüª~ˆAuiºaü$zá∞xG\«X\"=ë%¨ª\Ó¸\Ë\Í‹æØ˙4Nß≤≈£LÄ%c~P\Ÿ˚˘ß?˛:º`X\»x°˛:Åm∞û≤J8§˝g!\…\ŸXOŸô!´Ñ\‡•\0\\=\ÕW´Ü¸e\ÔºáH\‚˝\‚ìPo°”Ç=\\3A,ˇ	£r\Õl0Eºùú\‚$Zºˆg∫∫|åT•h¡uc\·@.û\0ñ7ºá˘0zº•4\ÊU[\Œ\Í\«∆Å˘Y\’]7O!∑≤ñ¡ï’≠yàfÇ˜%ÉKV	¡K∏TC~qTñAe∏\„¸™ëgp=Z7ô\ÓØÚ;,º™bY\Óú¿E\„]≥·ª∏Äk≠eb\∆Sı¥è¯\‡Öº!\\wóKÍ≥°\"M\È\'$á™+\ÏΩh\ÁÖ\Ô¨<7kô6-πåßK⁄ì\n\\v6=Ö\÷ÕàC6:©Ñ⁄ÅK\Œ÷∞î≠ª\›∆éı(´]√∞\‡¢Y¡≈Ñ\ÿb™\Íe\‹\»\È˚X\¬y!??\ZGÜlø\‹\Œj\ÿ\\?\“Ìº°asÄa\”\… ≥¿\·6\'U°£ï∞QY+ã!E≠6b4\‡\⁄<y@\»gdp…Åc∫>i\€îã\'ANßa °wy\€z&∏\‹z\∆p≠\Z\Î˙\0\r*#ÄºÄ\ŒH∏«¥ﬁ≠†XR9ù\ƒ-∏\‡-î3Y\Ïb}<7\0!ñyÅpûõmk;K_\’awn\‡\Í—æUXW^9\Ââ˘%\Ÿ≈ë⁄ÉKN\‰Eûò∏ê˛\"É\À\È(!Y5π}\Œ	x`$7\¬\Áº\ﬁ3©UDû\"¿U%ΩD5//s≤\€\…PM≠P7O°\n\\9\ﬂ4Rû^#ü§©C¢Æˆ\‡í[≠°å¿n\«\„\ƒM\Z˜{Ypë\”f,z¥\0Ûì‹éïıB\'ò\‡Ç\Ì\ÂE:\'Ñåwå\ƒbU\–;pAj!ÙbΩ∑\\û§K+µ\‘8¸Æx\ÃKxD9\nß\≈8ùçl\Ì¿\ÎE5IÛ¡˛à\\≤\‰=\\;1˘õá\r∞8]\À∏8A ª\›!\ÈoÚ¶Ñ2≥ôl˝¯XKp\…1/™¿ªkdªO©œß\ÔE,-∞¯∞wí≈Ä±™ÉfÚnÒ∫≥dò	.∏\„\≈\Êë$Ä\·˝\⁄m\ZniO2∏∞aBjY´\"\‰5\‘1∂ïßúpÃãÛ\«Te\·\\v0©Õá1ÄúUFÑG+QÃág˘,ïj†1#˚&A É∫m\'≠B\Í\œ<\‹ˆ3*\Õ!µ∞æv-\ Y%\‘%\›)e¿•*ˇWù¡Öø£Qâı\Z\'R\Ì¨`F0=≤¸îh∏vZ0Ñj†íiçqÀ™°ººâp\Â2\∆ıÜbÄU\Ã«∏\ÓI€ã3CTégv°éü56{®®T{\ŸK®Sl+%¿uubx@Y\≈8\‡\ŒZÛ\ÂóJ∆âñ¢\…åÖXgp\≈\Íﬁèyqfpâˇ¢UU\Ë(1\n[?Cr]UB≠¡%ó°∞K^u85Ú≠çl\‹(ö\“\›IV\r\ÔØ£\Â#QQ˘¸d’©ì\–2‰æñ∫§;•\‘…í\÷D^Utü\ÎªJ∫‘ãHUK7paN≤jhM9J6y\…Ã∞ÜY\‰\ÊD÷å\Óv®áæ¸õR\‡≤S-úv9;J¥\⁄o\‚L\r&?bh~€Ö^◊Ü´åU\⁄´Ù∫Ù&LYpq*îúgh\›akAj\Ÿ\È\Á∂vóãg+Ÿ∂I\Â˛‹à¡u%\Î;¨{£ÑK^ß9πïô®\Ïh®¸vyä∏\‚–çów¡´s˙Üµ∫∆¢x∂ª∂e%ù\·¨˝BL&\‹0Ö*≠† í|\Ôj\·\Ê\È&∏~P@yg\Ÿp}\‘Vè\ﬁI8f¨\Îä\ré¨m\‡ä∏ôÁûÜV≤\\\œ‘£òº{#ïá˝¡\ÁD\ÂæETyjágÄH\0\Êèˇ\„\Á≤˛üh,/≠´≠±Kô∞\÷Xs˘ûº˛gá\‡ä)\rJ\Œ1î\Ì\„s\ÔdXúHÉ\…\… ’ëIl7ôﬁæ≤µÙÚ\Ã.™<≤¶\nl.˜\ÈOØ§!~>5¨•ˆñ\«\‡1à[Tc]A\"˘†πeµ]ûR\\r\À5kG(ºtπï\œ\¬UmÉ\…1Tˇ\∆J,ç°\¬Aä>Z7)$ç\…¸\Ï\—ıTYæô*èo§\ “•ˆG∏ˆo\"æ\œøN\‡RÖPl;?ΩZoñTàga≠≠\⁄K\0Æ8Åªòµ§ú\ƒ\È5[í\"ô\‡Ç]${¯¢ıˆ\·]îg~!\0\ Y∏~óJˆl+U0\ƒ9\…\«\⁄.Y\Á\∆n¶ZD\Œ5Û™\ZZ´d\rÆK\”{ò`\¬\œ2¡vÚ´ÇS.k|\«\n\÷CΩ?L){\Î\ƒ+u\ﬂ\⁄2ç{¿´\ ˙ë\…Ä+∆≤´§R´Üaı?\Z∆ª^=\r\\õﬂüˆv®b\ƒ\„ˇ\Á\'|c0®Zr-\0\≈\‡:¸\›G)coA\€\‡x• ã™Zg\›\ ˙S\n\\Hk\·óh\›\Õ\‘\Í«¥àΩÜâéw=\⁄>Oú\Ô|a\Èh*\ÈVü.L\Ó,Äp5\Ôg∫î˚3õŸè ¶ˆ¶cæ•C[€™é¯l*¸+K≠\ÎyÜ\Ã˙éNN\ÈAeì∫ã3ÉAw∂dâ\ÁV\Ï^†e|\ÀN%¥€òt9l!e¡Bzã◊ó.{\rΩî\„ïg¯t\Á|¡\–`\Ïì\À&*\ÕF%Y?	R˝\rt0g$]\»,8.\0\ŒcãFPY\Œ\€\Ô\⁄QY\ﬁX1ûÛ´&”µı3\Ë‚ôñãJ®:M\”Ù ˆØÄ\À/ªKÓ∞™z\ÈX~Ò^s\r˝\»3Ñ4\0ÉHg\n&—°≈£#fx\':Ω|Ç,3aC¿Û¸|\Ë¯íqtq\ÕT∫πqñê∞~rFö®ã5T\≈ˇT*°\ŒˆVJÄKn™Ùs9CZ&ØπÜ\—$π2ò ¸fr+\√€©r\0Å\ﬂ@∂K∑h\‘IÄ$\⁄¿1T?´\Ì%K∑NO)	..?ë\ÊDP#Yï¥\Ê¶ymˇ\Â$°¿l~30\0¬™#\Ó\œv¿\„eL¯á•\'\ﬂ\‰\0±ë@\’ı¨\Zªpg\rc›º¨3>£\√)&i.kÒ§äê*≈û#˛¨W\’\–Küv01§àWFd∆ñôû\ÌêjW¥\ƒc`õ™`$ Ùz/ùu≠πÑ\049æ©\"\›\’¡î∑]CI7Ä\¬œ∞…¨ªò¨Jzçyπ1\n§Å”é≥&\⁄o&6ßç Ñ\√\∆<O™∫,¨5\÷÷∫ﬁ∫µOKpE”É\√k:îìK\ﬁ\…y\0FL∑\¬Khv É˙\Íáû\ÀKRE\Z‡≤¥	Ûrr\…\€\ŸYP©\“X^6\')Ì•§ü´\»u:ô$\0WÑ12Oé\r©ã´ï¢aÆt\";è®ù\ÌÂµ§üc[∫vo\n¿\Â¡	Çäód^ïjh∑sC]ä<ÅuZX]R\‚ìhß	∑ót2≥ú≈∞\'#Q\rΩd¡s[<]\Œ/¿CåÃãcC•\ZBı≥ÛFí§´:)¿B¨àKvêõ\Ë\ÏêPël0^TBvd\Ë\\IÄÀÖP©\Í\Ÿ-ØP\r\Ì\Ï≠H¿Ö 7ò\Z)\\(jåTz!I#\Óá{1∏\0çLvÆl|c¿}›íd\›\ÏÆhΩÑ\‹˜$5\\Ú©)^§óµa®]N`$\‡íA ÄÒ!5¨`∞í*\Î=R\‚BC\0‹ÆT\'pY]Ú^ºÑúëë\nY∏<∫ÂΩî¢X\ ~ÇK•¶Å\·Y˙∏Åç	@ë•\Ó!KµDz≠Iø^TB¨C∫K≠\Z.π.\Ã\ÀqrÆ°]÷Ç\‡Jwº./Ω	\Ÿ˝û\ÓR´∆ÄK\Ó$\ÂEz\…\ÂˇN	µ5\\\»<Ò./Ω\‡kä‘™Q\‡äDz\…e(N9v5\\vS9\÷Â•ºÑ•ñ\Œ-®p\≈(ΩºxŸ±\·ÆöD∂ãs\…Y*^ú\Í§si~\0Æxπ˚í∏\‚Y¡´\Ÿ9u\\^ö\–p\\K˜\Í\·\0\\>ƒΩºdm†Ø°∏\‚ô[\»q(¿\ÂTäÇ\r\∆-#Éõœ§ka\0.E÷Üı kïÙr⁄µQÜ∑#w`#˜±.´ÎùÉ∆áz5vLº3\„ù6ò{[g{.Ü‘π\«`\0Æ8\‰∫eÃó\ÁèIäSÉøL\Ï\\\’v≠M-ìé|\ﬂ\»<I\”K°g,Ñí\Zß˘\ﬂZÎ≠´S:ß9\‡ä\“5t\·p_™rc9\Êj\’ı\ÏÇ¨™¨ﬂáóGboï,A\◊WéwT9\Õ)ïäp˘\‡\‹í\‘{.w$\Ì\œ\Ó\ÿ¿%û\“À©5Yº•º°N\À\ﬁŸÉ\È˙äqÅ:Ä+:ı\‡⁄ìï\ÈXÚûàÆµ\‚{â\—\Ã\‘.Ñ\rßx\∆¿à\À˜p\’ \‚ºCªÉÛ.--òh\ﬂ‹°∂åIG§tq¡c√±Z⁄±w∞&™É∏$\Ô!´ÚB\ÌÅJéL∏\◊™Ç∏Vw8™É\„j\Ô\Ì¥C`£\·w¢≤≥“π/F\0Æ˙\"ZÌØªk&öå¥w\Œœ•~À≠\È(Äó»¨l0¸>é\ÃR\„J˜p\≈hY;ı23Å\ÏúÒpl8µsì\…\Ôà\0µ]\‡N;pAÚ\◊t;+\0óK_zkˆòHòùz\Ë∑ÙÚ⁄§\”\Ôˆnvâ∫˚\Áypˆ®JIjRF\0Æ(:F¡n`ÄùX\ Tv\ﬁC?m/∑Ãàx=\◊\Œ÷í\’A¶_ÚGÖ80“π\ŸL\0.ÉÀ≤ë=Ü2\Ÿy˝Ú:e¢\«3`\Á!d\Ô†Lpˆ\»¿™\Èå\0\\Äãv}\È®0∆≤≥ø¿\Ë~\ÿ@Nnxïøÿ©É≤wP&\ƒXHà¯\'\0ó\ÁC\Œ9\√\0\0\€3µ?\Ìù9(å,\ZE\r@\…Tæl|\Ã\ÃnΩß\›\‹õ[\ﬂW›∑t¡\Âº˜N\Ëe¶6\’\‰,å\0\\QÇKv-Ø\Ì¯.\0\€7kPÌüùIUI,ôN\ƒ\00îqX\Ô\ÁFø¨û5∞nmö•º\'Nµ¥\Œ¥clOZ\ﬂ˛\Ì	Ä+\0W\ƒ\‡bÄmlYõñ¥yõvç\Îiµjπ:o(\…F\ÂK\«”É¢πQ\Ÿ[™˚π—£ë©£\≈lüu8wï\Œ6W\Ã?ØE\⁄⁄™∂ô\‚Ä+\0W\‘\‡\œlNπ_‘¶|É±vè\ÔI•≥\n°ÉÛáäÄØä¿¿è=2˛›≠≥m\Ô\„F\«Ú\«yz@uc\„L:aÄ\ﬂ\Ó^å\r\√:G\ÃÛ\œ˚¢:\ÿÄ+\0ó\'z±£=∫xäj.P\ÈòŒî\◊‹ê`-\ÎP\—–Ø\È\‡ú\Ã:ú˝3[2Œñ \….NˆÕ≥]\Ÿa}\√LÒß{x!<\„°!1e¬Ω\Ë>≥bí\Î˜1\Î\‹0_\Ãtx|\◊\Í\0ªÆ\ k\Ë≈ëq/\‡≤\–\ÍzÙÚÒØÑ\Î˘\„`™<\√\›cª\”Rc˜\Œ7v\ÔuΩ>•˝S˚—°πÉM:≤`òhªñ™ÑÒ\ÀÛaûò/\Êç˘\ﬂ[31\\∑˜Æ\Ô\Óe\≈zææq¿O∏™©ÚL.YØgeõ\√\0v|¡\œT:≠≠\Í-1vÒeÜ\€=≤≥\»\‚`*3\Ëƒ≤	)E(ï\ÁÅyÒ<Ò\ÔæI}\Ë‘¢\·u˘K!\Ì\Â\Î\Â\ÕO\‡zE\∆NkwUú\Ÿ\¬L\◊\nõd˛:î5ê∂g∂°•\Õk	\⁄6†Ö¯=\”QÑû\\>A{\¬8è.2˛\Õ˝>7Á∂Æ{#1_¸˛\÷*©ÚxÛ,™∏uE˘\ﬁ^î¿Ä´\ Vp∫û_.ådˆÖX6ñévI\Ÿ¸°¥w\\*0§\◊2cw_\€˘C*ô¸ù¯Ω \„3üZ>Q[\¬¯é.fé\„_mH)\Ãge€∫!ÛπºtLu\„\‘›πTyˇ¶\Ì;ÉäÄ+êZ\‰\Â#\…\0{∏v2]Y6Üé\Í»úü®õ˙¥¸\À⁄Ç∂j)~/»êß\…\0GÇnÑqÒ81å{E´:bz4ø\√\ﬂ\Œ\Êé•72∞^V<s}g5]ze∂V.yΩ*ü\‹å%´â˜\'	\ÊÉ-V<º#≠4ò≥¿`\Œ\’\Ì\Í“æ1]\ƒ\ÔAßñå•≥+\'iCè\r\„^kl7h◊êv\‚˜\'sÜ\—MK\Zÿ°^Øó˜N\‡™\…\ÔV$v\Ïg\n\√\ÿ\Ÿ\œÁç§≤¨isØ∆¥\‚´⁄Ç\÷u™O˚\«v•£û\ E\ÁVN¶Û´¶$ç|å\„¡∏0>+\∆}l^&ù\\4Lÿña-æ9Lë^œ∑|Ä´F∆µˆ|G\—^*O\"ÉYÙ\'ı¢ı\„Æ4òÑüKfÜ48W0A§+%ö‹ìãÜãq\»c\€ÿµ!ûˆ=ù2@uu˘X°ÚÜ\Ã\ÀPá_‹æ\’{ÇfÄ+pdDæ+\√\—a\”˝\Í‚ØÜMvh|7Z˜u]Zm01?g∂¢\”ì_X5YdoƒõúÛ3i\Ô\œÌ©∞us,\rÄ\◊UåÂ≤±!`\Ãa\'æe;:.\\%}\rvld*al\◊Û\Î\ÁB*∫Ωj\ﬂU0336hK∑Üt\–\0\ﬂ\Ÿ¸ët©p™\Ôtj\·q\Îs∑ıj\"~	{≠`úT¬æ2\‘_/éã@5¿E;\Ê}N#\'Ù£ñ?O§\›g\Óê_ó\ —°¢á\Î&\”\’\‹a¥∑_3Z\ﬂˆ\r*lQ€§-]–æ°m\Ë¯\Ã~t~\…hQ[)ùú7à ¶Ù¶\‚Å_ä˚\…˜_◊¶¯íNf˝ 2M¨ùd?VƒØ¢∞ØT\◊\—+®q\ÊLZ4˝:º†q\0Æt†Ûãﬂß5Y≠\Èá1ôTw`6˝\Á^C®\ÓòbÚ˚˙≠|áßì\Ï\Â>\Íá~¯î∂µÉ÷µ®eÄ î∂v˝Ä∂˜n\‰J¯\\°\‚˚;\‘@;5≠∑˙\‹ncäU\rîØ{O*\Ë/CwÑº˜?|∑Jln”ßÙõ]\0Æ \ÏäX∞.#G\“_˙ÁáÅIE£7úı`PüÕçd‹á\‚¸\ƒ\Œt¯\«f¥\Î\€z¥•UmQ\Ê≤R\«#\Ì\Óı1ï¯ÇNM\ÓN\◊ÚÜŸ™{JPmöNßv\”\À\Áø˘ˆ.∫.>\Íi Ÿ†Q\0l∑óºÄ+ôÑ`\„eUÙá∂\“\≈\€O|Ù\≈\—\r\‚|-ß^\Ô^\0áÆJn\‰vRãSØy\—ª$ü^\ﬁw£Y[v=\ÍuÅ¶çö4ê\0\\qVÒ†≥€©x±Pì©%Ø\Î\Â\’Ugm\Ì\Œ\ƒA:D4_h\√Tqº*@è\” Eπ\À\…\"z˘Ï°ØÛ∆ÜÖçÀØ5Ç&ÇM4\’T\…\›\–\—˝\”\Ôz¨ßÍ∫ä˛°S>º?Ä›øF%\’\'óL\ri∞ÒAÒ\"HMH\'‹Ä\√ÙL@Å ≠.âÀúM\‹)\ﬁo<÷ç\Ì6õŒí-C\'{	/,\Ó`\ÍòK\◊n˝ß÷≥L˙o\ﬂ.†{èüQ<Ø\ _J\Ïè\n2ò\Ã\Ô\Ì\ŒvÆF>æ\…wi\≈\◊•\’\Ô∂\Ì˙˚ã\Ëæ]Jˇ\‘mM\\¡Üç⁄çN`K\Z∏†OG\‚|àÜ˛±\À\n!ô˛Æ}vòT\‘wQ1\≈˚Ç´<∏\"y\'ó@Z™jºÆù\'~u}\œX¨	6∫xI7Äçm∂d:H2m;a\“Òª\‰\ﬂΩ\–uëU¥Û\‰µ¯\Ï˘oéR,nt∂\ÿWO`ò\€›ê¸ˇ\⁄{q\ƒ\ÔZ§\€?v^7\Èñ,2#Q6\ƒv<^\€M^§ì\’T@â∫Ñ++å?®Iâg\≈˚j>qC\Ã\Ô_Põ,S∫AÛõ_\‡É=ü†e\ƒT±∏ ù\0Ö\›:Ω/*—¥ç\«(ëú\nqUU@˘\ \Ÿy\“˜uPI7øUIhPêh).\ÏqTÙ_;Õßã∑%`\œ\nó∏ovï\ÿx™ÄÚu\‰\¬-Ò\Œ\‚Ω.vvõ_\“,∂YF<º~≈¢†É√ª	\ÂD\Õ\'m¢d\\19<™X\Ï¨xÄ\r6\€Ô∫Ø\’\n`æÉ+V50YÄ≤R<c_Æ ªq\÷;»†˛%T|\’∏,\È¿\n#Éo¿?∞\◊\"xW[pE´\n\Í(ô∞##Ò4ôó\0ôù\”†2˛ûP\·\ÍîU§∞l\Ï5xêΩ\r\ﬁl\Ì¿Ö@∞\Ïw3<uîï˙-\ﬁK:\\!Æ{Ä\‡˝s∫¶m(K	`)•öa´πÕØ+\ﬂ¿\≈v@%2 \⁄dÖ,\0e%\Ï…æÑ\√\„∏\Â¥ª\÷¯%5Åe!7/¢ˆWÜ\ﬂ\Í†\0œ´	`óê-ˇ-UvÖ\“\Îï\r©u\„\Œ}ë\ra•tÙ\∆KULÑzò\·G÷Ö©\Z\‚\÷\Z¥JÆT\\®Aâº.\‹| û)KMv’ø|tá˙d≠≥\›\‚%i\·L`±w—ã˝k\Ât\Ã\‡í3/Tq(kîÄKµ\≈\0SÅ\·\„\Ì\÷F0ˆ\√´ïRìÉÕ∏\ﬁ∏\–q¨P\›¸õñû¡8É+V\ÔaF¨≤C5\0Np¥y\…&0}<Æ”óoRœπ\€\Ëw≠¶*ü;≤∞º\⁄sXíOœû=£\Ó0\√uº\»N˜\Î\¬¯\“X*p!Ff0$ˇ&\\rLˆï]Æòu\"©∫(~2,\Ï¶A9\€]ü˘\œ=ñVòèo¢≥.%tCòT∞3≠Ä•Ú¿¡\Ê\‰\‹H8∏d©\≈¥õå¨\Z¶™\›\Âß˜\Íüg˚\≈xØπ˚ØTÅÀ∞ªÚ7\Ôã\ÿ!m≠Zºsu\0R®T\ÊãL\—\Êf¯aka`éìÈòõÚvó\\\Óì5≥\‚{\—dè∑òµOÄvóù3\√oÄa˘/\Ìf¶=∏XìÇπ\‚Tçk>#V°\';\ \"vS\’\Ób\Í4{GBù¶jxı˝m¯í\Ë3N<v`∫x\›¿%õ3N¡eÑõ.\ƒ\0l\›\Ô6$\¬!%\’h\—Ó≥âÛ∂õöòBz˝ØN\”cäŸπ,\›<Én\‡í\Î\0≠∂òUz%\\rü[GÜ=7ï	}7\ .\ﬂÛ§^˘¡¨”∑û¶_Oâ{P¸\›Ã•i\r,+/Ü¯\n Ù\Ëà+∏\0˘Å\÷f/^U\√tX§72W;&˜˙ô\—\0Ut\≈\Œ\√˛\‹+´(•ìq˝t≈ª\≈ecÒf\ƒ\‚\»™™T\√Tvj\»\‘9{_BRÖ\‡Vô\Á_º…öu2auIç\0ñ.ï#\Œ…±iRoF,éåHsÂÄ≤=/¥ cìXº˜BBr>∫\ƒ\◊˚qX!]]\ÓnZîˇ:96\"\…\⁄»à•^+\‚\Ïv)†ú\Í\√˚´Kéi•£\¬˛B\¬o∫∫\‹›≤\‚\Ì¯\◊…±I\ŒaD\‡í[¢E\ÊTØéêT°\ÎWê∫uN5ëúÉãc˝6}r¨BbU\—6ã1é<\ƒtí\\•πµuÛ“ö\Õ3∏Ä\÷t…≤( WˇÄãc\√KP˘ˇ[\Ì\Ëâe\Ï*\÷\0\0\0\0IENDÆB`ÇâPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\◊\0\0\0\◊\0\0\0â}ƒµ\0\07<IDATx\⁄\Ì}˜w◊∂¶˛ày\È\Œ¸rg\÷[3˜æô;\Î≠7s\Ôºˆ\≈cccl¿òkõå¡òl¿,¿\‰úA$Å@A$ëÉH\"H$\"cí\…9Z ˆ\‘w\ƒ.ùÆ>∫ª∫˚t´j≠ΩRw\’9uˆwv\ﬁ\'\„yA-Je*üQã\ÍøÛ:˝ıØ•fÕöQ”¶M\È\Ì∑\ﬂˇgz\„ç7\Ë˝˜\ﬂkﬁº9µj’äæ˛˙kO‘∂m[˙¸Û\œ\≈˜˘~\Ôæ˚Æ¯\Ó\¬ˇÒ{¸\Ï\Â~_~˘•˘]ô>˘\‰[˙Ù\”Oïﬂ±Rã-®u\Î\÷‘Æ];\œsL4aúXº≥\’CjS™Û†e§Ú\‡\Ô.Æ/\”;\Ôº#¿fÛã)\0\ ˜\ﬁ{O\‹\0\√7n\‹X¸\‡s˚~Àñ-M\‡ª\r6\„|Û\Õ7C\∆	a∏áLı\Î◊ß?¸Pl6òøé@\√&É±bC:ºÄK7j\’\‰u%†\"ëL\—ûÅ\Á’©S«îíN\œlﬂæ=}ı\’WT¸qòdeê\0∏^Hı}\'zÎ≠∑®AÉlÒ~7¿\“\0\\Y}^3ôR\√O	\ÂÖ¿®¸|H	ß\œ2∞>¯\‡Éêç\0Røì˘96º\‹˜«ªQIu¸-\—Ô¨¶,%¡U2±∂©\n&ìAXEt\Z$™\Z>ã\Ôx±\Õ¸&å6lêÇ\0Z2%Z∫,#ï\Ì¨d0©Ã¨ª\œ¿÷Å\„É` ]\‘2lPoô©Y\0\0ì\r∞tqr§∏æoU•b∑M&s≤#\‡qr`0∞\0Bø\’??7\nÃám9¸õåç\Ô\œ\∆\Ê	/p\0Æ“∂QµM	êlÜdp\Ÿ1!ú¨\n∫\Ÿd∫π\…1\ﬁd©∞ê®P[∞KÛp%\\\‘¡gp\Ÿ˝ù4ïÄeï\"ò# K§:m@x`õºÄ+4æ´\Í Sì&Ml¡\≈¿KU`YAˆ\—G	ê%Ú\›\„ôxá\n\‡ä#A=`[@ÜÉ\ «ô vªÆó†r*$\ÊîHß{c\·¿g\'Ü˙?vb0ú\rà?q âêÆÑ\œ\·;¯.\‘“ø˝\ÌoaûB¸\r;<PW\ÁÖ66\'GéüÄf˚fA\0Æ8≈¥ú\\\ﬁn\Ã¿Ò0=≤*\‹2\Zêé\ƒiD»®∞˛&?ãÛu∞	aèAuKî˝≥ \0óœÑ†b4RÄ≥î¯\Ã\‡ÖX±Ç\r@\„å\nY¢Yô ßì\√|\„-•\Ÿ9oq\0.üm-ØRã\Ã¡Q?THvKÀÅVH>ƒÆ µ\0(d†\„π\ÈÆ∫\ÂZ\∆s\ﬁ¸~SM=\ÃH°\◊Réx\Z⁄∏?∆ÅùZNú≠[∑Æß4®H§$$@\Ìñ¿ã\œ‡≥âHVˆ≤\≈s∏™©áZÉ´iÉ◊µÒ™lv«ö\Á\∆Q%\ÿFCúîõ,èb\"ºá©íΩ°-∏ê_Üâ]Yw5«Å\"\ÏB´çá\Õ\ŸÛ®ır*ûdÇÙ\¬\ÁUua∏7ûë.™*\Ásv˛¸ı\0\\~∏\ﬂu™?rS9\÷\r`¯¨*ñ6rus¥Ñ\0gıä\‚w\…Ltˆ;3&í{3tvd§j  ±ì¯´på\0±\ )T¿â√≤dLeiñJ\Œ\r-¡µ¯\«\⁄fOåtÚ™±ç©I¢íT\ÿAj{%∏\ÌTG\Ïˆ\÷\nh0h™æ_Æ\◊=5JKpq˘~∫\ÿ\nr≠˜ﬁê3>¢ô\'TOnúiŸøµyO*ÇåKStŒú\œT\¬¯gn4j\‘H\0*ñÜ1\0ïwì\Ì6nL\„D¯ú\nå…™êéµÕÇŒï\À∫™Ñ∫{	#Uabëún$É¢^Ωz,P˚¢µ\…]\0Ræo*Ωw∑Æ\“+#∆ø≤6\⁄¯ﬁÅµ\Á§\‡_|!\Ó\ÌDm⁄¥	IPv\ZTUYuM)∆Åe]•óV\‡Ç˜Gß“íhÑŸ•>®O7\ \Ï˝-mõ3ú\ ¶(i\„\Ïî;!ì∫u˛\∆\÷˘!˜∂à\’e\‡!eã;D\…$˜˚Hï<Ii\Ë(Ω¥óÒÎº®ú\≈)Jº\€◊ØWó&Ù\ÎD«ñM§ Ω9Äê\·ﬁ∏\'{\„9\ÿ~êpênr`∞9N\Ê%n\ÿ^)\0ÆHr	\„©jÄ©U˘}™Ù§æø¢¢¨!Q\ J\ÁVO•o\€\'O\ÿX™AML[LW\€+CGºü\È2U\Ÿ	$d$]lõ~Ù>unŸåf\ÓN•9£\Ë˛∂9æÄ\ /z∏}æP7w-C+ß˝L£ˆQ™ú^´≠Ò˛ \≈dıT\«K/\›\‚^∫π\‡£-ä¥\÷©\‹\’Nµ¿⁄Ω≠	ûì\À\'hûhi≈§Å‘≥csS3\ 7x\…8a©ãÉ&q/ù≤62t≥∑¢\…\Ë\Ê∫+f\0Æ$\∆\Ô\‰ùw”ÑæT<c†I%F§xº–çM≥\ÈP\ÓZ3yÄ\ÿD\Ï6π∏îr∞\ÊC\‚=\Î¶&r\»Cßú√åTµ∑8Q;gí´b>H˚¡}\«ÙlKè\◊O1\È\…\∆i5Xv\…∞AZp≠ö5≤\Õ\‚\‡#ò‰£ît\nÙsŒ°N\Ì\ÿ2R\—\ﬁ¬Æäì;\0(ßs´†\Œ\‡sı\ﬂyõÆØÆäsk<∏ú@\'\r\‘c8l†2[¡&gÜ\Ëì\‰Ö.ı^⁄ÄÀãΩ∞\‡3NMcd\‚\ﬁ3˙w\÷\„\rS\È≈ûÖê¢êrv`\”¡\„z/]\‹ÚZÄã;<\Ÿ≈∑∏1•µAåàà’®§÷≥≠≥¿\ƒHπ£æQ#uâáâ3\⁄\ZºÄ\Àz÷ñ*h\n`}ˆ\Ÿg\Á\Õ\ŸJ-É^/\0\‚]Y;]\ÿlêfê`â\Ëg\Ë≈±°C#\—ùÛ	˘l+˘¨_˘\Ë\”h§÷ìM\”P\ƒImD0Ÿéâ.1/-¿•jDÉ¥n[¶:•1Z©82\‚G™Cä%\€—°Küç]íuΩ\Ïv\»\Z*µpO´\‘*a\‡»à;¡\À»ééd§≤âSYö\‡2ù^Ç«êd^˙F\‡~ôùæ\n\÷\”-3\ÊO¡ï\œ^\≈Dú9\ÿ]\„¡\≈\Œ/;ú{ãK&\Œ\ÂéTBç\Ï∞DûÒ≈Å\Ó\Z.\Ó\Ô%!\‘\…\ﬁB0ôSù:5o¨¿Kò|;,Qj\"∑_´Ò\‡Ç\·\Èµ8\“N\r¥f¥#á\–\n¨¿K®áñàäú©Q\„¡\Â5ûã\Â˛ráY˛˘ì\ﬂSJ≠g€≤&\◊@Mî\œÒjäÉ˚\"CæFÉ9`^è7egÜ\\ä@\·ªh¨ió†\ÀÙ|\◊¸Ä¡5rv4mX?§Q)\';\Ÿ\”l≥πô\0Wçw\≈GRfgóüc1¨˘ÖNéP¿\‘zR\–PˆÉX$ld¶Êç´Z\'Ä∞¶\ÿ<±\÷rgbÑd\‹jªj<∏ºz\nπñ¿≤K\⁄\≈\ﬂZ~\“P	¨¿\ﬁ“è~\€>GπV\Î&Ùwî^pjy	\"\◊¯\r/m‘†b\'≤kˇ\Ã\ÕbpüÖô]\‘ˆVê®´=ﬂù∂NG\Ê°\…˝:9Ç\ZLê˛\‰C\rtp/á†Æ\ÀI%\‚[zíuù†&∂¯¥ë\„Z\√ˆˆrÜ≤\…:z\n°6h\–¿s7Y86ÏºÑÅ3C_z∫yF∏∏!©π93Xã©\—YÒvûB®àh±\Ã˝\‹2\·!’úºÑÅ3CoßÜºNàO≤\rnG^\»5\Z\\*O!Äƒ≠öΩff∞^8úö;5äfá¨<á\"Vi£±†q©∏∏\"¢FKFíS\Ë.H9ª¯ YWsßÜ°Æ´¿Öêã\›\Ÿe©í¥õTpEr\‡ÇõΩe\ÁÇaw95<Ü.\Î˘\–\ÁrÛ\‡ír\nΩv{ä\≈\ﬁ\n<Ö©\„1dpTHfB\«&!o–©WG\0.Éê˚\Â%a˝\À\Ì¿\≈\∆k¡\»^Åß0ç¿egsAU\‰3\≈\‡MVi=¢aiMoPm¬Æ*æÖ\‡£∏Ç2ì\‘q«ªÅj!}\ÁÜJÇ\ÈR‚ü≤‡≤û#e¨¿\rü^\‡íΩ\»|Œò5\œ0\0W\‡≤m\„<FÛœÄÅS\'\÷\≈q.ª¸Q∑≥§¡+∏^ÅÜj$\‡¬é\√\ﬂcgÜ]’±p\√ªb¿¿©\ÎBÜÜ\\Li\0Y∑c\\ì\Ó-tKgapa7ì≥\‚4ªF4∏j&∏Xr\ÈrNW“É\»nß\‹\„Öq)ø|\ËÉK’õ0\0W˙Å\ÀK\0ô{\≈\ÎråP\“¿\≈-\’‹™ê(∏^≠{Ns±K{\nJ˚SÉ*v\Œ)9¡ö\¬Y\r∏X-\‘!Ø0\ÈYÒn±.\0J,\\\ÿ\ÌÇ\ÏåÙIÅb[<p\Èr∫dR¡\≈m\’TÒ\n¸yª\ÀjóSÄ+Ω¿\Â%ıIóñjZÄ∫±\Í\Ë \ÿYhX\‚îS\»\‡räq\‡JMp©\ Nº\‰†\‡RÙâ∑∫\‰5jdVh™¨x|\«1\∆Ä+%¡Ö5eûê	1Q8±ú@SAó\‘\'möÇ\ \ŸÒ8ã\ﬁA\0ä£\Ôv\‡räq\‡JMpaM\ÌCÁÆΩ\0ë*Ñ£KK5m¿≈™!˙e\‡Ö\·\≈Y˚$\»\Át\‡Jop!n©JÅ\¬\ÀyÖ\ÿ|ë∏k\r\„\‡≤–•yU^CÄEUÖlw∫	\ ∏“ª`\“\Œ\Ê\¬\Ÿm\0FŒàGù`\0.\’\–KÚÆ[\ÍS\0Æ\‘ó] Ÿ≠\ÎìN˝\nµó[\Á]’°w∏\“\\àoF\“ıI∑\‘\'m¿\Â%†å˙ù\0\\\È.\ƒ-U±.7W<ÛD\0Æ\ T∂V \‡J?pq¨ΩQ¢ó.©OZÅãUCk@\Ÿ\Í1\‰\Í\„\0\\\È.éuE.xõpπ®Ü¯\ÿ\È\‘,±∏\n9\0WzÇãc]rN©∏tj™%∏X5\ƒKUÅ™∫∏\“\\™Xó[n°.ßIj.ß2>îAés\ÈO\È	.U/\r∑¨xùZ™i	.r\√T™!2\‰e5!H\‹M_p°Uû5\÷\Â\\:’™5∏\∆w\rW\rÒ3R]\‰L\r/\‡ä§ïıÉ\¬	t∑`d]\À˛ë.N\ÌfK¯;ﬂèÖ\…pØ[πÉ}9TÆ|psÒo,˜êﬂÉ\”;\0a\‹\÷w\Áı˘*p©\…n\‡?\Ëî˙§%∏TßüpäãLv;¶\’Kô?\‡JV*\Ìˆ∑≠\Ì\Ì˚\ÊM:˙cS:=¢uUá\ﬂ\·3¯@+∏,\‹\œ≤iö\„F\¬\‡¿g˜i\Ë\Î;\0a˛vc0+ëw\Ã\r[7U¨\À\r\\:u}\“\\≤j®ä\ sº\ÀK%≤∏ò°ø\ Åë¡\– y~H.ê|O~éıYâ$\'†[O:±+öt;\·ü\◊)ØP[p±j®j^√™!í6\›zh®¿Ö;ªt¨\‰á\‘bHuõÄç\r\Õ+∏p∏º\√\ÿDô\‡nWyíu:™U{p±jàjdª\ﬁÒ^∫?=\Ÿ∫[≤˙•ù\◊1&\…N=Lñ§rìbÚ\\\Ì¿\ÂV\◊\≈ˆòÆ©O⁄Ç\À-S˙7∫Bπı-\‰v\÷XL,™RE˚˛c:3∫]û\’Àêj#\Ë¡öq!Ñ\ﬂ]ù\◊œ§Ûæüó	˜ê©§\À;\Ÿ%ÒÚ\ƒ¡∂ä`\÷yîg~6W˘]\\\œˆæ@¯=>ãwæ∑\„J)\∆ t\ËR≠NÆA∏\“\n©L\À@´Aa-ü:\n^X¸c\Ì\0\\ëQZ¡%øP∑@2t}´\Z\∆HT`Úõ¨\‡¥˛OW7ò\ÿ\È˘Òû?\œ99¨E–†¢[\œE∂∆∫¨Y\Z0¨∂∏é\ŸZÉÀÆøÜ\\\ﬂ\≈=\„\ÌÄuw\Ÿ\”àÖ\≈N|+HB*äw,Ißπ^ò⁄ïˆ|\ﬂÿçúA µ\„XóHN•\‘\'≠¡%ßC©TC7w¸ÉU\„åE¸ÄJª\÷jïRõ\«ı§)=ø¢\·\ﬂ4£Oﬁ©m“ü˛¯\ﬂ\È˜øˇ}\‘$\ﬂKE≠\Zæ%û	*˙≠á\ﬂ`∫∞z2\Ìû3òf\r¯Ü\∆ˆjM?¥n\‰:Æwkˇﬂò\Êç\ÔÛΩ∫4´oŒØ|˛O∂™#6;lz∑rá\ÿ∆∫\"lı\0\\>d\ C5t\Í∫{bps˙uˆ˜\"é\"/*\0+Ä¸¶?˝\À®GãF\—\Í\Óñ,¶˙u˛]´πÒÜ£TvhX+lÜ*p\…\Â˛©î˙§∏\Óœ´Eß\’\n3~ÎΩ°NáB.3∞z±`Ú±≠O∑\Œãô˝C;s¡[7˝êFˆ\Ó@\”vßmsGz≤E\Ã\ƒ˜≤£Uìã\ÁÇ0Üw\Î\‘aƒ∂ü\‘@âX\Î&ı\05¡˙?ˇÖö5|èukOc\ËF3áÙq◊Å¸)1\œ˝Ùö9!s¸ÒõT\Î\œˇfJ∂+KGVÉ´p|»ô\»Úö…Ådˆ\n:ë\\\¬ŸßäópΩ¢;Yµh_áZJVﬂÜ\ÍLy\Œ\÷¿\ﬂ˙¥˝\Ã5ød\Œ\–WR‚èæ0í_Ù\Ï`!]ÿæîf˝¸=\’˛Ûøä1BäE¢2®z¥lB\Î≤FR\Â…¢zQæ5©s\Ï\⁄\‚S1æÆ_|dÇ\ÎYQVÿ±≠™@≤pq*ú\Èç\ÏP\≈S∏\¬n#SÂºµ\ﬂ7µçy\·ÖC™!\‡\Ëv√†éüWÌ†Ü§àòAJ\◊–É=ts\√¸®\ËF\·\€{Wîm4Ap∑d\r\’˛K\’N\–xÄà\œ\œ\Z“ã*Ol\r”≥Ck´ü[≤äXı|nÆõMv\ÊF$\ÕyêÅ•\ +¥ÇãKå\Ï¿\≈\'õÙh˛±\‡3û\÷\'\0= ©Ú¸T‘πe3\ÂY^¯?´nY\Z,f\ÎOœéU”â]Ù\€\ÈΩ!Tq\·==SJ∑ˆ¨£k\€\n|°;W\”\›[\Ë…â\‚\Ígù\ŸGïøî\ZTBïgã©Ú\‘vj˚Y\„*∞ˆìp±:XVòMïßwV\›˜ªxê*Ø≠¶´\'\Ë∑_\”√£ª\Ëˆæ\ræ\Œ\Î\ﬁ¡-a\ÔY˘éê˜\\˚\ﬂˇ\"\∆Y8\·{«§]ô\ÍøÛ∂ôe.Æ\„*\ \Z\"\Ó	b~o\’hp][\À,\⁄e)¨ô<¿6\Ê≈û\"´«∞ıGuï\∆ı≈É;\Ë≈ï\„@v\‹(^OOo˛Jø›ΩIáwl¶ù´Û®d\„r*5hÀ≤ìV\ÂfS¡\‚l*\\öCª7–∂µKhÖÒª«è_OÆ^åxsw!=:^,¸…©˝√ü§ó\◊OõTyfó∞ëX5t≥Ω\ r´%ÇêP®\‰˚1=øtåûù;Dè\ ˜\–\√cª\≈Xn\Ì\ﬂBï\œ+\Ã1ñ\Ó\ŸEÖ\∆|vlX.\ÊÄ9Å\÷\Ê/0\Á∫kM\‹\\@˚7.£≠\Às\Ë\Ó\ÂÛ\‚˝<8}DÄs\nyóÀåg•Áóè\—¿>]ï\ÎQ:\À>71L\'p±\‘j’¨QH\ﬁ(\Œ¡[5\Z\\\Â˝kôi1Nå\‘Ù£˜ï›°©W%\÷˙?ˇ;l!a\‰W^´fh¸å˝≈Ø\'\‡ûû.\0∏[∂\«dºä\ﬂ~£U˘i˚Üe¥kc≠^≤\–d<+m]ì/\0∂e\Õ:r`?\…\◊\√ÛÂÇ©\Ÿ*1H .s\ÃÔø©$ñ\ƒ!\‡2$ü<?+aû◊∑Ø§\Î;Vá\0Àú\„z\Ãq9≠\Ã[`;\«\"x™9b#\¬}\Ô6lº_\À\√\∆q±tã\\vÙ.U%2k-•9£BxÖ≥q¿[5\Z\\lo©í:eö=∏ª2ôóù\ZVè°j!Û&™√ÖJ∆É\Zxc˜Zzt\ÈL(n^øFW\ÂÜ\Ì\Ë*ÇÙ*6vˆùÉ\Ó⁄∫ë¨◊ΩÚR0Hë`]-ØR\ÈÄ`à\∆›Ω;z¿\Œ\Ìµ\‘A\0†\‚·Ω∞9nX\·qé\ÀQÒñbé\≈\€B\Á¯\‚\Èc∫mhwJ6 á\Ã\—PW\Îøı◊∞qè¸ˆsO\‡≤6\Âuá\…`\Â\Œ!M∂›ïtpïvˆÆ˚\€\Ê\–GoÖó¢p3H/\‡2–∞G‰Öá∫5\…\ t\Ãxõï\Ãt\È\‹	ÒªÚ≤√∂å∑\«`<\Ï˛{ä6ë\Í¿¿\‰&\”¡6Ç\ƒy\Âx®˝ˇBÉπà[!,TF\Ÿınn\Ï¿\0P\rI(\œÄVKûcÒ\÷\’Ùº¢BH≤\’KªÃ±ÄˆlW\œR˙VÒ:°é\n\Ì\‡¸>€ç\√+∏¨ˆ6g\Á\\Y;\›\\\‡≠\Z\r.v¡\À\‡ÇﬁåLq´[~R\”◊îùyU9Ü\Ôæˆg{p1^:LèO\Ï6É¨&\…l\'H.◊≠\◊m¡µ\’Pï\\Gïê\›u´d=9∂Ω\ ˘ yÙÓñÆ\r	,#~\Â4FLå?èòVòóL}˘à)µ`©.Ä	\‡⁄øc=›øsS\Ãq˝\ e.s,†\√˚ãm\Áàg]ﬂ∂å*ém6«£\◊\ \·\›<ÅKegwoö≤îÖ¡\ﬁ\n\‘BK=2\≈\Ì2∑T∂\⁄^–Ω≠\‡\⁄6Ò;˙°uìêÖÄÀ†˚ªñ“É≥G\…\Ì*»ôMŸì¢\≈”á–¢©ÉiX\ﬂ\Ó4‰ªÆ!4f`oZ2k\Â\ÕJs\∆§\À\Œ\€\ﬁ\Ô≈≥\'tª(?ê><V\'`\…\ƒ\0É\ƒsr\√?<w\‹qékó\Ã7\Á8g\‹¿∞˘Å¶\r\ÔGÀ≤Üã9\Œuô#\œÛfë∞£õB¿Öçv£ì‘í¡eµ∑†ΩÄ∂¥™\Ê`ÏíØÒj!ÉKvh∞˜ˇ–åŒç\Ì \ËH\ﬂFb∑≤ï\›\‹ÒM\ÎΩ.,¯Û\Á\…\Àu\Á\÷Mö<¥\Õ\ZŸõ\Êç˚ûM\ÏG\ÍJv1®+\Õ÷ì`\»◊óf\ÔE\Î\nr]\Ô˘Ú\≈Û0Ùh\◊\‹\Ã\“\⁄\Î\‚EÒêF+v˝L\ƒs\Ã6h‹Ä\Œ4^Ã±\ÕÛ›´9~/\Ê∏aeûßw˜≤\‚©p\À\À\‡Bö◊ã=Å\≈\ÕA.d\„XX\„;˝MÜºÒZ\Z5\\r\ ø.É\«\Ôêw\∆/˚\“Ùû¥Ûˆk\Î∞[$H0;\Z\÷/úÒ.¢óoä]\÷\È∫rÒ\Â\ÃK≥G˜∂pB?Z<πø†l\Ÿ\„˚R\÷Ëæ¥o\«fwÜªsI0ºu,H[b\ÊÛÆ¢\ŸT±s5y\Î?\Ï\Á\«.˙[ø\–Àß]fù#\0\¬\œ\ÿ<\Êé˚Åä÷ØrïX\0û…é\Zy~êª≈∏8àåÀ≤\‘B2\‚_HèbpqÆc~oqÆW//…ú .UG\÷4øldO\„wx\È≤j\»:∏\›\·\„p˜\nâYc[\’	L\0;\Ë\ÈÖcTqˇ∂-\„=∏èäV/†-Y¥ı\Ì(\\Hvm†\'èªK+x\œGòU&\œ]öp=\€:ã&wo\Ó>øWÙÚ\ﬁUWü:zêvm\»ô#~ﬁªu•\„_8AON\Ì£Áßãm\ÁáÇhLcl\nN¿:2HXlìùW\\ +˜I¿Ø∫pÒ\Ôk|ú9`¸2Pö.íY5îì:ÒˇıC´î\\v\Õj®t≥Kdz≤%=:ºôn\Ó\\Iè/üqõ€Ö]¸\≈˝\"û&\Ô\‚VÇC\"“ºB¡†¶“©úüM\’N\◊9Bí ´∏{Ébπn\Ó\ﬂOw˜¨¶G%Ö¶m•\"∂\'Y\Âµ+\Ô∑K\ \ÂF0;\0è7Zà¨&s˜+P≤Ûµ\»-¥+ygè\·ı™w4\√\Ó\ l\⁄¿ÜcNù†8®luj∏QE˘6\·¯∏π5_\Á7˜nN0ñ	Ü+\›D˜˜≠@ıÚv¡ÔöùqC\Õ{+FAòK\ﬁmn07Ä\„\ﬁ\·bnª›º\√¬ÜÉwáÃìÖûûÛ\‚\ƒ6\”\ﬁ\ QUøÜûín\Œk56Q\Œ#Öâ¿˝G\‰w\";√Ç\ƒ]…©Å™akß&¸uY¸\“Oom\⁄]\Ïí˜ÆEô\ﬂVgiD\0.[\Ô[Ò2%9\Ì\ﬁv[	cÉ\„%íRv\n@-⁄ïıì)ù=I/©m7∑h\ÔY∂f^àJ(¿eS\ﬁ/\Á\¬Qeµ∑fváÉã[\»\ÔÑ+œÉ\ƒ\›WtaD®\›%ø,±;/í_˙/ì:Saã*pÒ\À˜.V\r£ë^Ò$x¯x\\´GE^ïµ•ÚO∑\Ã0%\·u\‘e~≤óPˆÇ:y¢™x&\÷*°.kø\Ê#T\0ÆWÖí™xªU±3õEtÜä\»NçH¿ı∞p¢\ÈíG\Zé.å\«YP[·úà\\ê\0\0◊Ωï£Ö\ \≈@YÚ\Z\Ão›ú±’õ\⁄+/(\¬N\‡\‚*dk¢∂\Ï∏¨˘®r\Î<\n&µ©D\ÊL\r´jù˙ˆíüC_æÒπñ\ÔVW({◊É\’\„E`ô\Z	≤\…f<VA™¶#\Ó\Î^4[Äæœ∂W¨\Í°Ñ\Á≥˚\„ÚZj\¬\Œ93\„\€ˆmCD\Ï\”bo±Jò\Ï\Ã\Ì¿%«ªd\’ı9–´C‹¥}	èa$í\Î˛ ±!1ØHçø	™©5ø6TƒßÑ\Ï\Œ\‡NCEº≥yñôw\Ëá}∞8Q„ëã?Ωz\nep\rh\ﬂ\\Ù2\‰\œ\\õ\◊?§˛OV	ì\ﬂ\“\\7¶©UCé]\»/N\rxπ:ô¡eÁ™í\\\„Ñjàüª~ˆAuiºaü$zá∞xG\«X\"=ë%¨ª\Ó¸\Ë\Í‹æØ˙4Nß≤≈£LÄ%c~P\Ÿ˚˘ß?˛:º`X\»x°˛:Åm∞û≤J8§˝g!\…\ŸXOŸô!´Ñ\‡•\0\\=\ÕW´Ü¸e\ÔºáH\‚˝\‚ìPo°”Ç=\\3A,ˇ	£r\Õl0Eºùú\‚$Zºˆg∫∫|åT•h¡uc\·@.û\0ñ7ºá˘0zº•4\ÊU[\Œ\Í\«∆Å˘Y\’]7O!∑≤ñ¡ï’≠yàfÇ˜%ÉKV	¡K∏TC~qTñAe∏\„¸™ëgp=Z7ô\ÓØÚ;,º™bY\Óú¿E\„]≥·ª∏Äk≠eb\∆Sı¥è¯\‡Öº!\\wóKÍ≥°\"M\È\'$á™+\ÏΩh\ÁÖ\Ô¨<7kô6-πåßK⁄ì\n\\v6=Ö\÷ÕàC6:©Ñ⁄ÅK\Œ÷∞î≠ª\›∆éı(´]√∞\‡¢Y¡≈Ñ\ÿb™\Íe\‹\»\È˚X\¬y!??\ZGÜlø\‹\Œj\ÿ\\?\“Ìº°asÄa\”\… ≥¿\·6\'U°£ï∞QY+ã!E≠6b4\‡\⁄<y@\»gdp…Åc∫>i\€îã\'ANßa °wy\€z&∏\‹z\∆p≠\Z\Î˙\0\r*#ÄºÄ\ŒH∏«¥ﬁ≠†XR9ù\ƒ-∏\‡-î3Y\Ïb}<7\0!ñyÅpûõmk;K_\’awn\‡\Í—æUXW^9\Ââ˘%\Ÿ≈ë⁄ÉKN\‰Eûò∏ê˛\"É\À\È(!Y5π}\Œ	x`$7\¬\Áº\ﬁ3©UDû\"¿U%ΩD5//s≤\€\…PM≠P7O°\n\\9\ﬂ4Rû^#ü§©C¢Æˆ\‡í[≠°å¿n\«\„\ƒM\Z˜{Ypë\”f,z¥\0Ûì‹éïıB\'ò\‡Ç\Ì\ÂE:\'Ñåwå\ƒbU\–;pAj!ÙbΩ∑\\û§K+µ\‘8¸Æx\ÃKxD9\nß\≈8ùçl\Ì¿\ÎE5IÛ¡˛à\\≤\‰=\\;1˘õá\r∞8]\À∏8A ª\›!\ÈoÚ¶Ñ2≥ôl˝¯XKp\…1/™¿ªkdªO©œß\ÔE,-∞¯∞wí≈Ä±™ÉfÚnÒ∫≥dò	.∏\„\≈\Êë$Ä\·˝\⁄m\ZniO2∏∞aBjY´\"\‰5\‘1∂ïßúpÃãÛ\«Te\·\\v0©Õá1ÄúUFÑG+QÃág˘,ïj†1#˚&A É∫m\'≠B\Í\œ<\‹ˆ3*\Õ!µ∞æv-\ Y%\‘%\›)e¿•*ˇWù¡Öø£Qâı\Z\'R\Ì¨`F0=≤¸îh∏vZ0Ñj†íiçqÀ™°ººâp\Â2\∆ıÜbÄU\Ã«∏\ÓI€ã3CTégv°éü56{®®T{\ŸK®Sl+%¿uubx@Y\≈8\‡\ŒZÛ\ÂóJ∆âñ¢\…åÖXgp\≈\Íﬁèyqfpâˇ¢UU\Ë(1\n[?Cr]UB≠¡%ó°∞K^u85Ú≠çl\‹(ö\“\›IV\r\ÔØ£\Â#QQ˘¸d’©ì\–2‰æñ∫§;•\‘…í\÷D^Utü\ÎªJ∫‘ãHUK7paN≤jhM9J6y\…Ã∞ÜY\‰\ÊD÷å\Óv®áæ¸õR\‡≤S-úv9;J¥\⁄o\‚L\r&?bh~€Ö^◊Ü´åU\⁄´Ù∫Ù&LYpq*îúgh\›akAj\Ÿ\È\Á∂vóãg+Ÿ∂I\Â˛‹à¡u%\Î;¨{£ÑK^ß9πïô®\Ïh®¸vyä∏\‚–çów¡´s˙Üµ∫∆¢x∂ª∂e%ù\·¨˝BL&\‹0Ö*≠† í|\Ôj\·\Ê\È&∏~P@yg\Ÿp}\‘Vè\ﬁI8f¨\Îä\ré¨m\‡ä∏ôÁûÜV≤\\\œ‘£òº{#ïá˝¡\ÁD\ÂæETyjágÄH\0\Êèˇ\„\Á≤˛üh,/≠´≠±Kô∞\÷Xs˘ûº˛gá\‡ä)\rJ\Œ1î\Ì\„s\ÔdXúHÉ\…\… ’ëIl7ôﬁæ≤µÙÚ\Ã.™<≤¶\nl.˜\ÈOØ§!~>5¨•ˆñ\«\‡1à[Tc]A\"˘†πeµ]ûR\\r\À5kG(ºtπï\œ\¬UmÉ\…1Tˇ\∆J,ç°\¬Aä>Z7)$ç\…¸\Ï\—ıTYæô*èo§\ “•ˆG∏ˆo\"æ\œøN\‡RÖPl;?ΩZoñTàga≠≠\⁄K\0Æ8Åªòµ§ú\ƒ\È5[í\"ô\‡Ç]${¯¢ıˆ\·]îg~!\0\ Y∏~óJˆl+U0\ƒ9\…\«\⁄.Y\Á\∆n¶ZD\Œ5Û™\ZZ´d\rÆK\”{ò`\¬\œ2¡vÚ´ÇS.k|\«\n\÷CΩ?L){\Î\ƒ+u\ﬂ\⁄2ç{¿´\ ˙ë\…Ä+∆≤´§R´Üaı?\Z∆ª^=\r\\õﬂüˆv®b\ƒ\„ˇ\Á\'|c0®Zr-\0\≈\‡:¸\›G)coA\€\‡x• ã™Zg\›\ ˙S\n\\Hk\·óh\›\Õ\‘\Í«¥àΩÜâéw=\⁄>Oú\Ô|a\Èh*\ÈVü.L\Ó,Äp5\Ôg∫î˚3õŸè ¶ˆ¶cæ•C[€™é¯l*¸+K≠\ÎyÜ\Ã˙éNN\ÈAeì∫ã3ÉAw∂dâ\ÁV\Ï^†e|\ÀN%¥€òt9l!e¡Bzã◊ó.{\rΩî\„ïg¯t\Á|¡\–`\Ïì\À&*\ÕF%Y?	R˝\rt0g$]\»,8.\0\ŒcãFPY\Œ\€\Ô\⁄QY\ﬁX1ûÛ´&”µı3\Ë‚ôñãJ®:M\”Ù ˆØÄ\À/ªKÓ∞™z\ÈX~Ò^s\r˝\»3Ñ4\0ÉHg\n&—°≈£#fx\':Ω|Ç,3aC¿Û¸|\Ë¯íqtq\ÕT∫πqñê∞~rFö®ã5T\≈ˇT*°\ŒˆVJÄKn™Ùs9CZ&ØπÜ\—$π2ò ¸fr+\√€©r\0Å\ﬂ@∂K∑h\‘IÄ$\⁄¿1T?´\Ì%K∑NO)	..?ë\ÊDP#Yï¥\Ê¶ymˇ\Â$°¿l~30\0¬™#\Ó\œv¿\„eL¯á•\'\ﬂ\‰\0±ë@\’ı¨\Zªpg\rc›º¨3>£\√)&i.kÒ§äê*≈û#˛¨W\’\–Küv01§àWFd∆ñôû\ÌêjW¥\ƒc`õ™`$ Ùz/ùu≠πÑ\049æ©\"\›\’¡î∑]CI7Ä\¬œ∞…¨ªò¨Jzçyπ1\n§Å”é≥&\⁄o&6ßç Ñ\√\∆<O™∫,¨5\÷÷∫ﬁ∫µOKpE”É\√k:îìK\ﬁ\…y\0FL∑\¬Khv É˙\Íáû\ÀKRE\Z‡≤¥	Ûrr\…\€\ŸYP©\“X^6\')Ì•§ü´\»u:ô$\0WÑ12Oé\r©ã´ï¢aÆt\";è®ù\ÌÂµ§üc[∫vo\n¿\Â¡	Çäód^ïjh∑sC]ä<ÅuZX]R\‚ìhß	∑ót2≥ú≈∞\'#Q\rΩd¡s[<]\Œ/¿CåÃãcC•\ZBı≥ÛFí§´:)¿B¨àKvêõ\Ë\ÏêPël0^TBvd\Ë\\IÄÀÖP©\Í\Ÿ-ØP\r\Ì\Ï≠H¿Ö 7ò\Z)\\(jåTz!I#\Óá{1∏\0çLvÆl|c¿}›íd\›\ÏÆhΩÑ\‹˜$5\\Ú©)^§óµa®]N`$\‡íA ÄÒ!5¨`∞í*\Î=R\‚BC\0‹ÆT\'pY]Ú^ºÑúëë\nY∏<∫ÂΩî¢X\ ~ÇK•¶Å\·Y˙∏Åç	@ë•\Ó!KµDz≠Iø^TB¨C∫K≠\Z.π.\Ã\ÀqrÆ°]÷Ç\‡Jwº./Ω	\Ÿ˝û\ÓR´∆ÄK\Ó$\ÂEz\…\ÂˇN	µ5\\\»<Ò./Ω\‡kä‘™Q\‡äDz\…e(N9v5\\vS9\÷Â•ºÑ•ñ\Œ-®p\≈(ΩºxŸ±\·ÆöD∂ãs\…Y*^ú\Í§si~\0Æxπ˚í∏\‚Y¡´\Ÿ9u\\^ö\–p\\K˜\Í\·\0\\>ƒΩºdm†Ø°∏\‚ô[\»q(¿\ÂTäÇ\r\∆-#Éõœ§ka\0.E÷Üı kïÙr⁄µQÜ∑#w`#˜±.´ÎùÉ∆áz5vLº3\„ù6ò{[g{.Ü‘π\«`\0Æ8\‰∫eÃó\ÁèIäSÉøL\Ï\\\’v≠M-ìé|\ﬂ\»<I\”K°g,Ñí\Zß˘\ﬂZÎ≠´S:ß9\‡ä\“5t\·p_™rc9\Êj\’ı\ÏÇ¨™¨ﬂáóGboï,A\◊WéwT9\Õ)ïäp˘\‡\‹í\‘{.w$\Ì\œ\Ó\ÿ¿%û\“À©5Yº•º°N\À\ﬁŸÉ\È˙äqÅ:Ä+:ı\‡⁄ìï\ÈXÚûàÆµ\‚{â\—\Ã\‘.Ñ\rßx\∆¿à\À˜p\’ \‚ºCªÉÛ.--òh\ﬂ‹°∂åIG§tq¡c√±Z⁄±w∞&™É∏$\Ô!´ÚB\ÌÅJéL∏\◊™Ç∏Vw8™É\„j\Ô\Ì¥C`£\·w¢≤≥“π/F\0Æ˙\"ZÌØªk&öå¥w\Œœ•~À≠\È(Äó»¨l0¸>é\ÃR\„J˜p\≈hY;ı23Å\ÏúÒpl8µsì\…\Ôà\0µ]\‡N;pAÚ\◊t;+\0óK_zkˆòHòùz\Ë∑ÙÚ⁄§\”\Ôˆnvâ∫˚\Áypˆ®JIjRF\0Æ(:F¡n`ÄùX\ Tv\ﬁC?m/∑Ãàx=\◊\Œ÷í\’A¶_ÚGÖ80“π\ŸL\0.ÉÀ≤ë=Ü2\Ÿy˝Ú:e¢\«3`\Á!d\Ô†Lpˆ\»¿™\Èå\0\\Äãv}\È®0∆≤≥ø¿\Ë~\ÿ@Nnxïøÿ©É≤wP&\ƒXHà¯\'\0ó\ÁC\Œ9\√\0\0\€3µ?\Ìù9(å,\ZE\r@\…Tæl|\Ã\ÃnΩß\›\‹õ[\ﬂW›∑t¡\Âº˜N\Ëe¶6\’\‰,å\0\\QÇKv-Ø\Ì¯.\0\€7kPÌüùIUI,ôN\ƒ\00îqX\Ô\ÁFø¨û5∞nmö•º\'Nµ¥\Œ¥clOZ\ﬂ˛\Ì	Ä+\0W\ƒ\‡bÄmlYõñ¥yõvç\Îiµjπ:o(\…F\ÂK\«”É¢πQ\Ÿ[™˚π—£ë©£\≈lüu8wï\Œ6W\Ã?ØE\⁄⁄™∂ô\‚Ä+\0W\‘\‡\œlNπ_‘¶|É±vè\ÔI•≥\n°ÉÛáäÄØä¿¿è=2˛›≠≥m\Ô\„F\«Ú\«yz@uc\„L:aÄ\ﬂ\Ó^å\r\√:G\ÃÛ\œ˚¢:\ÿÄ+\0ó\'z±£=∫xäj.P\ÈòŒî\◊‹ê`-\ÎP\—–Ø\È\‡ú\Ã:ú˝3[2Œñ \….NˆÕ≥]\Ÿa}\√LÒß{x!<\„°!1e¬Ω\Ë>≥bí\Î˜1\Î\‹0_\Ãtx|\◊\Í\0ªÆ\ k\Ë≈ëq/\‡≤\–\ÍzÙÚÒØÑ\Î˘\„`™<\√\›cª\”Rc˜\Œ7v\ÔuΩ>•˝S˚—°πÉM:≤`òhªñ™ÑÒ\ÀÛaûò/\Êç˘\ﬂ[31\\∑˜Æ\Ô\Óe\≈zææq¿O∏™©ÚL.YØgeõ\√\0v|¡\œT:≠≠\Í-1vÒeÜ\€=≤≥\»\‚`*3\Ëƒ≤	)E(ï\ÁÅyÒ<Ò\ÔæI}\Ë‘¢\·u˘K!\Ì\Â\Î\Â\ÕO\‡zE\∆NkwUú\Ÿ\¬L\◊\nõd˛:î5ê∂g∂°•\Õk	\⁄6†Ö¯=\”QÑû\\>A{\¬8è.2˛\Õ˝>7Á∂Æ{#1_¸˛\÷*©ÚxÛ,™∏uE˘\ﬁ^î¿Ä´\ Vp∫û_.ådˆÖX6ñévI\Ÿ¸°¥w\\*0§\◊2cw_\€˘C*ô¸ù¯Ω \„3üZ>Q[\¬¯é.fé\„_mH)\Ãge€∫!ÛπºtLu\„\‘›πTyˇ¶\Ì;ÉäÄ+êZ\‰\Â#\…\0{∏v2]Y6Üé\Í»úü®õ˙¥¸\À⁄Ç∂j)~/»êß\…\0GÇnÑqÒ81å{E´:bz4ø\√\ﬂ\Œ\Êé•72∞^V<s}g5]ze∂V.yΩ*ü\‹å%´â˜\'	\ÊÉ-V<º#≠4ò≥¿`\Œ\’\Ì\Í“æ1]\ƒ\ÔAßñå•≥+\'iCè\r\„^kl7h◊êv\‚˜\'sÜ\—MK\Zÿ°^Øó˜N\‡™\…\ÔV$v\Ïg\n\√\ÿ\Ÿ\œÁç§≤¨isØ∆¥\‚´⁄Ç\÷u™O˚\«v•£û\ E\ÁVN¶Û´¶$ç|å\„¡∏0>+\∆}l^&ù\\4Lÿña-æ9Lë^œ∑|Ä´F∆µˆ|G\—^*O\"ÉYÙ\'ı¢ı\„Æ4òÑüKfÜ48W0A§+%ö‹ìãÜãq\»c\€ÿµ!ûˆ=ù2@uu˘X°ÚÜ\Ã\ÀPá_‹æ\’{ÇfÄ+pdDæ+\√\—a\”˝\Í‚ØÜMvh|7Z˜u]Zm01?g∂¢\”ì_X5YdoƒõúÛ3i\Ô\œÌ©∞us,\rÄ\◊UåÂ≤±!`\Ãa\'æe;:.\\%}\rvld*al\◊Û\Î\ÁB*∫Ωj\ﬂU0336hK∑Üt\–\0\ﬂ\Ÿ¸ët©p™\Ôtj\·q\Îs∑ıj\"~	{≠`úT¬æ2\‘_/éã@5¿E;\Ê}N#\'Ù£ñ?O§\›g\Óê_ó\ —°¢á\Î&\”\’\‹a¥∑_3Z\ﬂˆ\r*lQ€§-]–æ°m\Ë¯\Ã~t~\…hQ[)ùú7à ¶Ù¶\‚Å_ä˚\…˜_◊¶¯íNf˝ 2M¨ùd?VƒØ¢∞ØT\◊\—+®q\ÊLZ4˝:º†q\0Æt†Ûãﬂß5Y≠\Èá1ôTw`6˝\Á^C®\ÓòbÚ˚˙≠|áßì\Ï\Â>\Íá~¯î∂µÉ÷µ®eÄ î∂v˝Ä∂˜n\‰J¯\\°\‚˚;\‘@;5≠∑˙\‹ncäU\rîØ{O*\Ë/CwÑº˜?|∑Jln”ßÙõ]\0Æ \ÏäX∞.#G\“_˙ÁáÅIE£7úı`PüÕçd‹á\‚¸\ƒ\Œt¯\«f¥\Î\€z¥•UmQ\Ê≤R\«#\Ì\Óı1ï¯ÇNM\ÓN\◊ÚÜŸ™{JPmöNßv\”\À\Áø˘ˆ.∫.>\Íi Ÿ†Q\0l∑óºÄ+ôÑ`\„eUÙá∂\“\≈\€O|Ù\≈\—\r\‚|-ß^\Ô^\0áÆJn\‰vRãSØy\—ª$ü^\ﬁw£Y[v=\ÍuÅ¶çö4ê\0\\qVÒ†≥€©x±Pì©%Ø\Î\Â\’Ugm\Ì\Œ\ƒA:D4_h\√Tqº*@è\” Eπ\À\…\"z˘Ï°ØÛ∆ÜÖçÀØ5Ç&ÇM4\’T\…\›\–\—˝\”\Ôz¨ßÍ∫ä˛°S>º?Ä›øF%\’\'óL\ri∞ÒAÒ\"HMH\'‹Ä\√ÙL@Å ≠.âÀúM\‹)\ﬁo<÷ç\Ì6õŒí-C\'{	/,\Ó`\ÍòK\◊n˝ß÷≥L˙o\ﬂ.†{èüQ<Ø\ _J\Ïè\n2ò\Ã\Ô\Ì\ŒvÆF>æ\…wi\≈\◊•\’\Ô∂\Ì˙˚ã\Ëæ]Jˇ\‘mM\\¡Üç⁄çN`K\Z∏†OG\‚|àÜ˛±\À\n!ô˛Æ}vòT\‘wQ1\≈˚Ç´<∏\"y\'ó@Z™jºÆù\'~u}\œX¨	6∫xI7Äçm∂d:H2m;a\“Òª\‰\ﬂΩ\–uëU¥Û\‰µ¯\Ï˘oéR,nt∂\ÿWO`ò\€›ê¸ˇ\⁄{q\ƒ\ÔZ§\€?v^7\Èñ,2#Q6\ƒv<^\€M^§ì\’T@â∫Ñ++å?®Iâg\≈˚j>qC\Ã\Ô_Põ,S∫AÛõ_\‡É=ü†e\ƒT±∏ ù\0Ö\›:Ω/*—¥ç\«(ëú\nqUU@˘\ \Ÿy\“˜uPI7øUIhPêh).\ÏqTÙ_;Õßã∑%`\œ\nó∏ovï\ÿx™ÄÚu\‰\¬-Ò\Œ\‚Ω.vvõ_\“,∂YF<º~≈¢†É√ª	\ÂD\Õ\'m¢d\\19<™X\Ï¨xÄ\r6\€Ô∫Ø\’\n`æÉ+V50YÄ≤R<c_Æ ªq\÷;»†˛%T|\’∏,\È¿\n#Éo¿?∞\◊\"xW[pE´\n\Í(ô∞##Ò4ôó\0ôù\”†2˛ûP\·\ÍîU§∞l\Ï5xêΩ\r\ﬁl\Ì¿Ö@∞\Ïw3<uîï˙-\ﬁK:\\!Æ{Ä\‡˝s∫¶m(K	`)•öa´πÕØ+\ﬂ¿\≈v@%2 \⁄dÖ,\0e%\Ï…æÑ\√\„∏\Â¥ª\÷¯%5Åe!7/¢ˆWÜ\ﬂ\Í†\0œ´	`óê-ˇ-UvÖ\“\Îï\r©u\„\Œ}ë\ra•tÙ\∆KULÑzò\·G÷Ö©\Z\‚\÷\Z¥JÆT\\®Aâº.\‹| û)KMv’ø|tá˙d≠≥\›\‚%i\·L`±w—ã˝k\Ât\Ã\‡í3/Tq(kîÄKµ\≈\0SÅ\·\„\Ì\÷F0ˆ\√´ïRìÉÕ∏\ﬁ∏\–q¨P\›¸õñû¡8É+V\ÔaF¨≤C5\0Np¥y\…&0}<Æ”óoRœπ\€\Ëw≠¶*ü;≤∞º\⁄sXíOœû=£\Ó0\√uº\»N˜\Î\¬¯\“X*p!Ff0$ˇ&\\rLˆï]Æòu\"©∫(~2,\Ï¶A9\€]ü˘\œ=ñVòèo¢≥.%tCòT∞3≠Ä•Ú¿¡\Ê\‰\‹H8∏d©\≈¥õå¨\Z¶™\›\Âß˜\Íüg˚\≈xØπ˚ØTÅÀ∞ªÚ7\Ôã\ÿ!m≠Zºsu\0R®T\ÊãL\—\Êf¯aka`éìÈòõÚvó\\\Óì5≥\‚{\—dè∑òµOÄvóù3\√oÄa˘/\Ìf¶=∏XìÇπ\‚Tçk>#V°\';\ \"vS\’\Ób\Í4{GBù¶jxı˝m¯í\Ë3N<v`∫x\›¿%õ3N¡eÑõ.\ƒ\0l\›\Ô6$\¬!%\’h\—Ó≥âÛ∂õöòBz˝ØN\”cäŸπ,\›<Én\‡í\Î\0≠∂òUz%\\rü[GÜ=7ï	}7\ .\ﬂÛ§^˘¡¨”∑û¶_Oâ{P¸\›Ã•i\r,+/Ü¯\n Ù\Ëà+∏\0˘Å\÷f/^U\√tX§72W;&˜˙ô\—\0Ut\≈\Œ\√˛\‹+´(•ìq˝t≈ª\≈ecÒf\ƒ\‚\»™™T\√Tvj\»\‘9{_BRÖ\‡Vô\Á_º…öu2auIç\0ñ.ï#\Œ…±iRoF,éåHsÂÄ≤=/¥ cìXº˜BBr>∫\ƒ\◊˚qX!]]\ÓnZîˇ:96\"\…\⁄»à•^+\‚\Ïv)†ú\Í\√˚´Kéi•£\¬˛B\¬o∫∫\‹›≤\‚\Ì¯\◊…±I\ŒaD\‡í[¢E\ÊTØéêT°\ÎWê∫uN5ëúÉãc˝6}r¨BbU\—6ã1é<\ƒtí\\•πµuÛ“ö\Õ3∏Ä\÷t…≤( WˇÄãc\√KP˘ˇ[\Ì\Ëâe\Ï*\÷\0\0\0\0IENDÆB`Ç','AC',6),(16,'m.rodriguez@mrsservice.com.ar','Mariano','Rodriguez',0,'21232f297a57a5a743894a0e4a801fc3',1,'ˇ\ÿˇ\‡\0JFIF\0,,\0\0ˇ\€\0C\0	\Z!\Z\"$\"$ˇ¿\0\÷\¬\0ˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ˇ\ƒ\0R\0\n\0\0!1AQa\"BqÅ	2Tëíì°±\—#3RVbr≤¡\“\·$SÇCUc¢%DsÑî4Fd≥\¬\√ˇ\⁄\0\0\0?\0ò¿ñ\◊Zy8˝Ör¢\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"•\Ó\›¿.<Ç£´ó˝SÚπr åÇ∏¡,\√\\r\”»û\œπQR˜n\‡óA\›‹ír\„Ã™ë| AP	i\rwûGª¿ÆDDDDDDDDDDDDDDDDDDDDDDDDDTΩ€∏\0e«êF7w$ú∏Û*§D_FATZC]≈ßë\Ó+ë/v\Ó\0q\‰ç\›\…\'.< ©\¬êU\0ñ˘Æ9i\‰OgÅ\\ààààààààº}Y®l˙[O\’ﬂØ\’\—P€©ø,≤¿\“y\09®aµô:é≤\·-6\œ\Ìî\÷\ íWYñy?[t˘≠+\Zª§˛⁄úÚ\ÔÒh9¿£Ñ\›_?	˝µ~óü˛? üÑ˛⁄øK\œˇ\0\Â^æû\Èi∂eS$≠π[\Ó\–\ÁCSF∆áπÅÆ˙‘∑\Ë˘∑Ω7µòB#˜ßP@\Õ\Èh$ê8H;_Ω!\·\Ã}k2\"\"\"\"\"\"\"\"\"\"\"*^\Ï`óA\›‹ír\„Ã™ë| Ç2\n†”∫„ñûGª¿ÆDDDDDDDEΩ\—zZ\…vUe´ÇyÖ47P⁄à\⁄\‚\‡\Ë›∫\\;pGZÅàã$th§¨≠\€∆èß°®ñûcqc\À\„qi\›h.p\œqkH>µµDDDDDDDDDDTΩ\ÿ¿.<Ç1ªπ$\Â«ôU\"\"\"\"\"¯@#d@%ßu\«-<èwÅ\\àààààã©t∏P\⁄\ÌÛW\‹j‡£§Å•Ú\Õ3\√∆édì¿(ã∑Nó\—”æ{\À\·d\Œc\ÔÛsˇ\0Iáü\Ì;\‰\ÌY\„£´Ø÷õ\”˜€≠[\Í\Ó/éH™¶\¬{\Ÿ#õìé\“\0>\’\‰Ù ≥{ı\—\ÁR44Q≤:¿{∫∑Ç~¨≠e\"\")\–\Õ\Ôñ\›[^\ÊoGm∑\Õ6{ú\Ï5øi[Pìh=\'5~á\È©\Ëi\›\r\ﬂM\”Väo õáW’¥1˝[\«í\‡\„\«#*L\Ïwkö7j6Ø)”µ˚ïë¥\Zõ|¯lü\È\÷!\"\"\"\"\"\"\"\"\"•\Ó\«\02\„\»#ªíN\\yïR\"\"\"\"\"/Ñ0FATZw\\r\”\»˜x»àààà≠≠¢\Î]=†4\≈F°‘µÕ•£Ña£õ\Âc\ﬂI\≈k´§\›5>’ÆnÜI$∂\È¯üöklo\‡{ù!Ù\›ı≈àT¯˜:o\"ØeWõ+ùº˚}\–\»y6Vïé˘TÇ\⁄©óΩ}¥=õ\‚Æ\ﬂ4AΩ\‰∞\„\Î\¬\‘TÒ>	\‰ÜAá\∆\‚\«\‚\n\‚DE3ΩÕã0\‹\’⁄Äå¡F\”\·\≈\Á¯)âW<t¥ìTLwcâé{\œp%jX\‹\Âº\ÍÀΩ\ﬁwoIY[4\Ó=\Â\œ\'¯™t\›ˆ\Ì¶\Ô4˜ã\¬z\n\Íg\≈4/\›p?\ƒx>∫/tå∑m¥ﬁ™í~®ç†1\Ÿ\räª¨\Ó{~E\"QR˜c\0∏Ú\∆\Ó‰ìóeTààààààã\·\0åêU\0ñù\◊¥Ú=\ﬁr\"\"\"/Z\Í[>ê\”⁄é˚V\⁄[}fIyû\Ê¥v∏û\0wï¨Õæ\Ìf˘µ}_% πÔß∂@KmÙ!\ﬁl\Ô=\Ô=ßÿ±™)c\Óo^L\Z\„Rÿú¸2ÆÅï\r\Ê¯ﬂè±\ÂNs«ÅZñ\€-ò\È\Ì´jã60)ns±æ≠ÚG\‘U†àãbΩ¨æˆ\Ï*\Á≥π\◊\Õ8w{>∂πd≠Ω\ﬁEÉc:∂\Îù\”Æf4¯ºn≠\ÀT\'èÒs\“TOKUM4ØÜxúåv\◊êA\Ï+aù6\Ô—≠Lj9ô©°à\ÓB∂!\Èè\◊êˆ˜\‚B¢\"\"\"\"\"\"•\Ó\∆\0q\‰ç\›\…\'.< ©\¬#!P	i¡9oa\Ó+ë|$\0I8ôZÚÈß∂5÷∞~ì≤Ußl“ñ\«yµUÉû{\√xÅ\Ì=™:¢,\”–ÆÚ,˝!Ù˛Ò\√kÑ¥g=•\Ï8˙¿[/Z\ﬁ\È\—f˜ß§Œ°¨‹ä\„M[<If\Îè\ŒiX!\◊:>ŸÖÉböB\÷[∫\ÊZ\‚ë\„√§cá\ \‚±\ﬂOK◊Ωõ©£dªí‹´aßÛö	sá˝´\\\Ëã\◊“óÎ¶ò\‘47\Î-S\Èk\Ë¶l∞\»”å\ÿ{¡\‰Gh[E\ÿ^\—mªN\Ÿ\Â•£‹é†é™∫úò\'hÛõ\Í\Ì+Ò/v8óA\‹q\'.< ©\¬#!P	i¡9oa\Ó+ëÈç¥ßlˇ\0e€ß\Í\ÔW¢h\Ë\ÀOùH¸dÉ\‘”Å\‚‡µ™I$írO5Ò\\õ1∫∫≈¥M=wc˜<ñ\ÂévqÜ\Ôå˝Y[qäF\À%a\À^\–\ÊûT$˜I\ÌqG©¥Ö\‰\÷\‘\—\œL\·€à\ﬁ\◊ˇ\0iQzZjã\ﬂ=Gm∂\ÔÜyU\\P\ÔCy\‡g\Î[~¢Ç:jH)¢hlqF\÷5£ê\0`=\“{\÷)tñûkæ\Á¨p\00g\ÁëgŒÖ;L~Ü⁄åVZ˘ãl\◊˜6ñ`Oõ\Ÿ¸\\ûN\È>càààààäóª\0Àè ån2IÀè2™DDDDDDDDDEÄF\»TZpN[\ÿ{º\n\‰DZ\◊Èß≠ﬂ¨6\◊p•Üm˚}êy8-.o=n\'\‰X=K]ñtƒ≠∞\È*{6Æ”≥]\Í®\‚CYO0c•hoXn1\ƒs\ÓXCo;VΩmgW6Ûtâîî¥Òu4Tq∏π∞≥99=Æ\'ôıw,ràπ#ëÒΩ≤F\‚◊¥á4é`é\’/4\'M	\Ì\⁄^\ZS•\Âπ])\‚ä∫zÜ±≥ê0ˆë\Êû¸eGç¥\Ì&ıµ-k6§Ω\·ÛT¥±YO\‰—ûgâ$ˆïc\"\"\‰äW\≈+eç≈ØcÉö\·\Ã»≠®tt÷ø\„\Ìè\ÿu≤o’ò<û∞ˇ\0÷è\Õq>º\ÌYR\ÁcÄq\‰ç\«rO2™DDDDDDDDDDD É\≈qÇXpx∑∞˜x.Eo\Ì˝ñ–ó\ÕE)\√mÙ2\‘{Z\“G◊Ö©\n˙©Î´™+™ûdû¢WK+è§\ÁI˘J\Î\"\"\"\"\"\"\"\"\"ô˛\Ê˛®s°\‘\⁄>i80\«_N\“\Óˇ\01\‡cOµLîDDDTΩ\ÿ\‡\\ycwxìíyïR\"\"\"\"\"\"\"\"\"\"\"!\0å+å√É≈Ωáª¡`˛ú∑áZ∫=›°ç\Âí\\* §i\≈\·\Œ÷¥Ö≠¥DDDDDDDDEù∫^k\Èjß\Œr¶®§w\‘\ﬂ\\alâR˜cÄq\‰ç\›\‚NI\ÊUHààààààààààààæ¡\‚a˜Cú\Èv_c∂≤P-€≠cßπ\∆3\ﬂ\Á(\‡Z\‚\◊8 ˆ*Qdnç52R\Ì\ÎFK\¬7Xô\Ïq\›?Q[RDDEKùéâ<Ç5∏\„ÃûeTààààààààààààã´sÆ§∂\€\Í.”≤ûñö7K4Ø8k—íO±Am≤Ùπ\’Wk\ÕE\œ\ﬁ\À5û72©Ò\‘N¯|x0¿8˜ïÇu\∆\“u÷∂ßÇüUjZ\Î¨4Úad\Œç\ƒc#\0v/Õπ≥é\\\—\Í\Ê˚Wú\‡Z\‚\◊8 ˆ*Qz\ÀsØ≥]©n∂∫ô)k©%l∞O√£x9x¨Ø¶∫K\Ìä\À\\ â5\\∑Fe\–\◊D\Ÿ\Z\·\⁄9=ÖMæé[f¥msNK4p6ÜÛEÅ]Eøê\‹Ú{kW%ñ.v8$Ú\÷\„â\‚O2™DDDDDDDDDDDDDX7ß“≤\Ÿ\—\Ê(\ﬁc5s¡M+á˙nx\ﬁ\‹ake@êAÇ9Ωªrf\\\—¿Ú\Ê˚Wú\‡Z\‚\◊8 ˆ*QgnÉ7J\ÀH]=6˚¢Æßö\nÜÉ\√wwx\Í-dH©s±¿∏Ú\÷\„üyïR\"\"\"\"\"\"\"\"\"\"\"\"\"+?lZ*õh[7ºi:áà\Õl?âêåır¥\Ô1\ﬁ\«\0µmÆ4ù˜Fj*õ£∑KC]N\‚^\‹é\«4ÚsOa¿EP$A éD/Dn\‹ŸÉÜ\◊4p<Ñ\√˘æ\’\Á8∏µ¿Ç=äîDDDDDDD_@$\‡q*jÙ\ÿ˝\÷\”Y.\“u\Ë˙\⁄s™	ZZ˜5\ﬂ\nR\”\»0=•L%Kùé\0e«êF∑π\'ôU\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"5nè\“⁄∫ë¥∫ö¡oªD\‹\ÓyL\Âô\Á∫\Ómˆf˛{˝∂|\È?ô?Ωå˛Ä\€>tüÃüÉ\ﬁ\∆@mü:O\ÊA\—Ûc@Ç4¥»áI¸\…>¿∂=$ªÛhKc\…Ùã§œ∑\Œ˙\”{\ÿ\œ\Ë\r≥\ÁI¸\…¯=\ÏgÙ\ŸÛ§˛d¸ˆ3˙l˘\“2~{˝∂|\È?ô?Ωå˛Ä\€>tüÃüÉ\ﬁ\∆@mü:O\ÊO¡\Ôc?†6œù\'Û\'\‡˜±ü\–gŒì˘ì{\ÿ\œ\Ë\r≥\ÁI¸\…¯=\ÏgÙ\ŸÛ§˛d¸ˆ3˙l˘\“2~{˝∂|\È?ô?Ωå˛Ä\€>tüÃüÉ\ﬁ\∆@mü:O\ÊO¡\Ôc?†6œù\'Û\'\‡˜±ü\–gŒì˘ó°ßˆ1≤\À\rs+≠z\Z\œCX˜\√÷ñûÒæNàY\0\0\0\0`Ò\Œ\«\02\„\»#[é‹ìÃ™ëZ[R\◊˙{f˙m∫áS>©î&v¡ΩOï¡\ŒåÅ\»p<V6≥Ù´\Ÿ\÷\ÎKl•≠ªyE\\ÃÜ-˙\Ô8Ä2s¿d¨\ÏàFF\n†yú¡\Ï= ¥DDDDDEèˆªµ\Õ≤\∆[ü´**\„ ÄS”ôOôªú\‡¯A[z§Ü\Õ5∂≠†\“ˆ\nã¨∑*\Á9∞∂J\"\∆˘≠.9$\‡“≥\"•\Œ\«\≈«êF∑π\'ôU\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\",\'\”j\ÿn]o\Âå\ﬁ}#\‡©oÄl≠\ﬁ?4ï≠˚=K®\ÓÙulvÎ°ùí›á∑h¨e\¬\◊G_\‰\Í`d\Õı9†èµv\—\»¡Tgp\‡¸\√‹´DDDDDE=\“©ó\\iõ;^i≠\Ôù\√<ú˘˚\Zó\–2\ÿ. ®\ÍKr((**s\‹pˇ\0ˆ∂2\ÁcÄq\‰≠«â< ©£∂/¯ãeöû\»]Wlû6\‰\Ì√É\Î\ ‘±\»\‡F\n⁄óF\À\Ô¯ãa∫N\‰\\ ∑≤	8Út~f>FÖëQåå@Û¡\Ï= ¥DDDDE≠>õ7±z\È	{dn\ÃvˆEFqc˜\÷J\ ~\Ê˝â\Êı™5ë\÷S\≈Ièi..≥ÉT\◊kq\‚O2™DDDDDDDDDDDDDDDDDTH\∆\…£x\À\\#º©ç±\ÿ•∂ß©l/nË§∏\ \÷\08n7\Í!Lüs∑RãÜ\Ãn∫jGÉ-™∏\»\∆\ÁèW(\Œ}[¡\ P¢\"ëÇ®g{r≠u.ïê€≠µW\ná5∞\”B\È^I¿†ìˆ-LjªÅ\‘Z™\Ô™.W][,\ÌÉüº\‚CGÄS«†ÖïÙy¢Í•ª\÷\…;Z\0çûc1\·¿©ààààààààààààààààààµ˝\ÓÉ\ÈWZ6≥I®‚åä{\’Kàl~káØß⁄º~Çö¿i≠∂¡j®órí˚®›ìÅ÷è:2}†∑˝\Àc(ààx*ñç\ﬁ\»\ÏU\"\"\"\"\√1ıÑZKa\◊QüÛ7w6\›∑K∑Ûø«≥\„\ÍZ\›h©ª\‹‡¶âôíi10p8\0∂}õ\ÈË¥ûÇ±i∏ö÷ã}Pªã\√FÒˆª%\\Hàààààààààààààààààã\0Ù\Ë—Æ\‘˚û\ÈMYY`òV∑\'™¯2èVq˝ÖØ;%Œ™\œy¢ªP\ \Ë\Í®\Ádºsk\⁄\‡\‡~P∂œ≥MQG≠t%õTPπ¶+Ö+%sA\Œ\„Òá∑\ÿ\‡G±\\hàààààà†∫Æõ\⁄Më¢õ~í¡\Î∞x\Zâ0]Ú44zÚ≠Ü:0\Í\Ì∫Z\Âö-˙07\ZÇG≥Úc\⁄Ú”é\‡V\Àu.¥T\◊;mM∫≤&\ÀMS°ïékÜ˘\n\’\◊4}VÉ\⁄-\ÁKUí©pÖ\‰|8è;\«-#€ï\'=\œ-£ÜõÜÕÆ3ÅΩΩ[l\ﬁ=øÒ>ß|™g\"\"\"\"\"\"+KköŒãg˚=ª\Í™\Á7p	¸§ßÉ=n!jéˇ\0t≠æ^´o7åµï≥æyû{\\\„ìˆ©ı\–+A3≤\…55l;ï˙ÜA+wÜßfDc\⁄wù\ÌR=q\…,Q„¨ë≠\œ,ú*¡A‰æ¢\‚|Fp˘£i\Ó.r¢\"\"\"\"\"\"\"\"\"\"\"\"¢R[ú9ÄHP◊¶6ñõRiπu\‘t\—>¶\€a´s\ÁÀº◊ì\‡N=°D\ÕπimQm\‘VôåU\÷˙Ü\œª\»<A# ¯µ=ìkã^\–Ù-ªUZûﬁÆ™1\◊Eúò%3\‚’É⁄Æ\‘EnW\ﬂ\‰èQ¡jä0ï≠{èn{ï∆≠™KÙ\’z£\ﬁÊ±¨ÅÖ\Ìwiq\0´ï\ÈŸµQ™ıtz\Z\ÀQøi≤HMS\ÿrŸ™πX`\·\Î%a›Ü\Ë\Z›£\Ì2’¶)\⁄\Ê¡,ùmd∏\·\r\‚˜|úâhu˝Vû\“\ÏÜ\›#ÜéC}çh†{ßFU\‘WZ_=K˜\‰38g\√{ààôEfm%\Œk®ã\\FwπRπ≠“≤;=4≤=¨`ßcú\Á\07GV\€Jç-§\‰öŸ§®ﬂ©\ÓåÛL±í\⁄H\›˚|\ﬂ˛\ﬁ**m§V\◊u<\œeF°û\ÕL¸\‚ö\‹ﬁ†˚C\Œˆ\Âb˙˚\Ì\Í\·8û∫Òp´óx;~jóΩ\ŸéIÊ¶ßD^ëåø≤óBk∫÷∂\Ï\–#∑\‹%vP£y¸˛\„\€\ÎR\≈yóª\Õ%©ç3\ÈX9ï\‡åﬂΩü\";ù\Í\‡≥\\\„ªPæxò\Ê\0KH=¯X⁄ê\–\Õmπ\€.TB∂í\·J\Íia<ú\◊p ˚⁄æìnÖ÷µñÖ≤F”áo\“O\ƒuë\Êü_aÒ\"ÙK\⁄tª5\÷\—\€*\Íù6ïæ\Ÿsˇ\0óîc\Í>•:Ùé§\È	ç±òåBV=é\»p8¡ªäˆ\ÓU•∑\‘T¥:(\‹nWëaæ\Õq∑\÷T:&µ\–¥\ﬁˇ\0e\‘\\\Áñ˙€ëáµ¡ò\Ì^\Ÿ’∑S Ñ|¬ºJ+ïU=\Ì\’ÒB\Ósé\Ê\È<Ûû\nı\“\◊jÎìßî\‚!æi˘Wùy\’UX\Í;TGªø∫\\Iu©o¥25\◊\ZL\∆\„\È\ƒXO®´\¬\Ÿ]¬âïP1√à<\⁄{AVµ\„UUæµ\‘vàC∑]ªøªº\Á\0±~\ﬂ6πs\—:6∂\‘\È\ÃW˙\Ëø\‚\Õ\◊SBAó˝çÒı(\Z\⁄˙\ \Ÿ\‰˜ÆÅ∏\ﬁ%\œs:«∏û\◊8ˆï6∫$hçA¢l]Æˆ¶GuΩ\Óo¡∫\Ë†\Ê\÷\‰r\œ\¬>\ŒÂõµ¸µ\·Ç(öM!`2\ﬁ\0\ÁΩxV:ã\ÏtEñ\÷9\–\Ôú\·πÛ∞3¸\€YvöŸß!™´njû7wO;ä∂\€u‘ïmD∏\Ó[¨\‡Ø->˙ó\⁄)\ﬂYûºÉøë\«\·}I~∏6\€mí©\√$y≠\‰ÚV}3ı\Îz¢\ÿÛÅÉÄπ\Ën∑õM≈î\◊\ﬂ+yc\'\·|\⁄\≈U55u\\ÃÇûH˘$y¿k@í°\ÔHM∫]u|\ÿ\Ï\’S[¥Ö=4a˝Y-ñ\‚\Ì\—¡«òg\Í¸´QT\ŒÚ˚•dÜ*V\≈\ƒ\ﬁÁ±£¡x\◊*\…k™\ﬂQ1\‚\„¿@w.™ó\›z:>∫j-†k∫72ëÖ≥Z\Ì\“H\‚\Ÿdõ\⁄o>JlÅÅÅ¿/®àààààààààà±˛∞¸^¨éZ¶π\‘˘å„Ω£jπ\È´,5µå4¯p¿\0Ω*()\È\·‹¶c[;\ÿo.*\∆\Ÿ\‰q\…wúH∆ª29\‡≠Óîõ+°\⁄.\Œk]<B˜mÇI\Ë%\∆à1ì\‹qÚ≠}i*zäy•£¨âÒMIZ\–\Ë\ﬁ0X\Ì◊á=ã;t0\€lZr\‰\Ì+´\Í˜mF \ J\Ÿˇ\0LK\⁄3\'Å\Ïı)øxëìi˙\Ÿ#{^\«R\»Êπß Ç”Ç\n∑ˆi\∆\Zˆû#,ˇ\0˙]\€\Z\Õ}C@o_pÙU˘\‘\≈˛õ~Eb[\Z¥\'¥Åª\◊\À\√˝ÆW\ƒ\‡6ûR—∫w/R«∫6æä\›pöj\Án\Ê=÷ù‹ú\Áäˆı˛\À]h®¶lÆ|éoôò\œ\¬\Ï_4\›\Ô%kwèöÚGáö±>π⁄Ωüe∂Kï\∆v\«Yy4\ﬂ‰®∑º\Á8∏\r\Áw0g∑êPn\Á©n˙\œT›Æ˙Ü\‡Íõï\“7#›ÅΩêZ\—\ÿ\Z\0¿ã,ÙM\Ÿˇ\0ø\Ô}ı=≤gXm\’Mï¨>oî\Œ\ﬁL¡¯L	˘Ùµ\ÍK]dçÅØ0ºk^1\Ï\Ó\\\⁄\ƒgMV~\Àx/?f\Áˇ\0ò˘.˝÷™vâ\‰∂\”n0∏âªÅ^¶îinû£kÅi\‚¨ÆK\’⁄û\’o®\"B@¿^∂™evó•™ã!íT4å˛Àó≠£1˛\Z£¿\Ïw\Ô\Í>(\ﬁˆΩ\Ãkú\ﬁDéJÙ˛\⁄Y≠´•–ñZÇ)\È$æoa¯ra§E\Íœè©E7÷ö˘\Ëa¨qe,Md\\;\0\0´\‘ŒòWuhe<c5øw∞˚Wê•\ÁD>én∏öM}Ø®OëKm∂\Ã\ﬂ\Àvâd\—\Óoo3¡M¶µ≠hk@\r\0¿R\"\"\"\"\"\"\"\"\"\"\"\È‹≠Ùw˙∫®\⁄Ú9–≠Îûí£e<≥S\Ã¯\‹∆óû<≠û_)•ï\≈\Ïå\“{9]ûy∑ Åˇ\0Dè˚Çº\ÔC6z\—\ﬂO\'\ÓïˆØ±∑\Í8kunñ•\Î£í∂ôÉR¿7ö;^>∞°≈¶	˜\Z\'4≤wB\Ê8`\ÔGØÇ\œ]z@jA>ì\’l©πi\÷\“\»!ë¿ô®¯ri?	ü´\Ÿ\Ÿ‹•\Ê√µõR⁄™Æ6;å¥Ø\‹;—ª%ßè`¯\Ÿ\’\ŒÚm_\rK¡\‹ç˛∞1˜+Êö¶\nà\⁄¯ec√ÜF\n∞Êô¥\Z\Ì\”\œ\Ê∞N\‚OÉÅ˙\’˜\÷\≈S\ƒ2≤L¥¸gòX˜K\”\–Kxñö\‰\÷`Ç\Zq\Áe]7^ö∑¿f¨ßÇ&\Œq\„ı¨/∂\rø\È-¨∫&(.˜Z∞Êô°vı59\r?	\ŸÛù˙£⁄†≠\∆ıt\‘◊´µ\‚ÆJ\ \…Ÿº˘$?Æ8\‡;\0\‰Øé˚!∫\ÌKSyŒíãO–∏>\Âp\∆=∆û◊ü´ö\Ÿú≥i´^ü£≥Z°•4q6([ê\‚\Z;\œ2OiVÓ¥Ç\€OW∑\Ó∂^=cXrwµ]W(f©“íFLÆßèÉ¸Ω°nÙ¥1OIU ãy˚\Ìq\Â\»}Jˆc¢û&\»\›◊±\√-<\◊uu%Ωå526&∏\·™\–\◊Z*˙jx\Èf9Ø$\„±s\‹\Ë\ÊvÅ•n\·ﬁà∂B<8˝\ÎüGﬁ®b¥\«KQ3bí\"Gù\⁄2OÒ^>\‘6óC§t\≈\∆\Ô<†R”π\√ì˘0¸ú-l\Î…•™i¨®®}EEEd\”M#éI{\Á}euÂéíz:Kkòÿ§}3$äN˜ë\ƒZ\ÎSÅW≠5æeLDà\Óˇ\0\Õ*EÙ\'ÿùßWWTk]R#©§µ\’u4ˆ˜7Õí`ﬁìΩ£#¥ÛSπ≠\rhk@k@¿\0pTàààààààààààä‘æ€Øœπ\…WG7òq∫\–\Ï`/=\‘:¢±¶dxaÁìÖq\Èõ3-\Œ\€ÛI\≈\Ó˛\Õ\“ˆ:\Àu\⁄Zâ\À:∑0ÅÉ\‚\n∏\Î\‚t\‘3\¬ﬂÖ$nhıëÖ\‚h˚5M•\’P\Ê≥wæQ˜§\œFfjö\Íùc†˙∫;€âñ¶è\‡\«R{\\\ﬂ\Õ\‘T5ª⁄ØV\Í⁄ã]\‚´»™!qéhfØi\Ì\‹\—˙\“Ò†\'u^ëø\÷RW=\Ìsü\√\‡\ÊûH#\“\÷≠$4[C∞\‚¶1Ü\‹mú7øj\'∞˙Ç\Ã\€9\€V…¶™5^P”á3tEX\«@\‡Iù¡^\◊mK≥ù@¡UO≠,mêp\Î[X%yT;JŸéêmC\Ó;D±?|1ìá;Üy\0NV(\⁄?I=ñ6¶G\È\….\n≥úª®1@]˚G\ŒˆÄTy\⁄\◊ıØlîıöç¥\√Œä\€\⁄d\Œ{∞O\Ÿ\‡±\‹hEŒõò(`\ﬁ\r`ÛèFÒ\Ô%f^è;π\Ì\"in/ûÆãM\»Ce¨}7Ve¿ñ≈íwèé0>•<4\Êâ\”˙kG√•lM∑[an\Zÿæèkú}\"OJ\ËÀ¢8\Ê*\–G\Î3øh\“tts6zâ\rC\⁄rh?\≈\\ò\∆8w+~·§≠\’S∫V9óê\ﬁK⁄¢Å¥‘ëS¥ó66ÜÇ{p∫ó\ÀDh£éwπ¢2H\›Ò]\n=%mßòH\‚˘psár^Ûò\«Fc-Ñc\·Öo\÷\È|Ú\∆]O!\…GÓú≥SiìP\“Q˘ıW;ã#%˝åc\\ÚG¥5BÆT\Ô°ı∞æR$s˜Å\«∏.ï¨™ñB\√bç¨o<`\›)\ÁæÆó¨ùÄ∞;„íû]\0\Î[_≤À¨Ìã´>˘ñü1ºTèDD^&°\’:{N\’\€\ÈoóäK|˜˙ä6M iô¯\‰?æ\Â\Ì¢\"\"\"\"\"\"\"\"/\'Qj+ù¢um˙ÒClßh\…}L\Ìåc\⁄x¨/¨∫Y\Ïö\¬\Á\√AWpøN\“F(i¸\Ã˛\€\ÀA¨¨Q®zn\\^\Á7OhzXG£%u[üÚµÄc\ÂW/Fë∫ªi{X:sQ\”\⁄)(Â°ñXKöL≠- e\Œ$˘ª\ﬂ\"ñã\Ìßbö/jt\'ﬂö3Iucq ò\Ã\Œ\‡\Ó«∑¿˝Jmw£V—¥≤\’S\–:ˇ\0gfKkh\\\Ê∑ı\„¯M˙«ä¬≤\∆¯§tr1\Õ{N\◊UàÆ≠≥˝aÆn-¢\“\÷\n€ã\…√§dxâû.yÛ@ıï/ˆ\—\n\—fñ\Œ—™bª\÷7e∂|ôáı\›\ŒOW\ÎRûéöûéñ:ZH#ÇöQ¥5¨ê\0r∞ãÙÜ÷µõ>\Ÿ\ÎT€ùÆ•lm¶\Î[º\“˜Ω≠\0é\ﬁj(Y:kköw¥]Ù≈ä∫1œ©2BÛ\Ì\ﬁp˙ñI“Ω4Ù]k\Ÿ¢\”wkKúx\…õQ}\ﬂ Y´Cmèf∫\Ã1∂]nñwÚßöN¶_ò¸~ÇA\‰B˙à°ˇ\0∫V\„\Ô6ånN\rEQ#˝±®Nàßøπ\’QˆWy¶l—∫h\ÓÖœå8o4;é\nî(à¨-µm?Ol∑I\…zΩ\ $®x-¢£cøS&8\0;y\ÏZ\’⁄û–µ\—u|˙íˇ\0V\ÁL\„äxX\‚#¶fx1É≥¸\…‚•øB˝Ω\’jw\”\Ï\ÁWL˘\Ó\—\ƒ}\Ï¨9.®c\ZIç\ÁÛö\–Hwh„å∞DDDDDDDEèˆ´µ\Ì	≥J#&£º\ƒ*˜s9TI\Í`\‰<NàõSÈÅ¨\ÔŒöãE\“≈ß(Z\Ÿ\‹µN˚\«\Õo∞dwïµ˙ı®+ü[{∫\÷\\j^Kù%L\Œy\…\ÁœíÚ\—\\\€/\’uz_Ÿµ].í\›R\Ÿ\\\Ã\„¨g\'≥\⁄\“GµmkH\ﬂ\Ìz´M\–j+=Kj(+°l–º\√\ÿ{à<\Ô\ÿDEaÎ≠ël\Á[;P\È;|Û∏c\ #è™îΩ∏+\ÍÜ=¨ï\Ô¥_/v≤x∂=ˆL¡ÛÜ˜÷≠áÙ§\ﬂ;õ@ú7<∑qÛ\◊~\—–èN\∆n∫\⁄\ÈP\ﬁ\—OL»≥Û∑ñJ—Ω∂Cßdd\Ô∞\…wùûù\∆c+I\Ô\‹\‡ﬂ©fU∂Ç\’F\ ;m=;4{\Ó\"\"Ö>\Ë&\“a∏U\–\Ï\“\œ7\\i%W3\œ\„1à\‚\·\⁄.#\ƒw(Äˆπé,{K\\#B©Æs\“Z\‡r<B\ [3\€\Ó\”t#\„é›®&Æ†a\„E^L\—\‹3≈æ\¬≥\ŸK]™üøU\ƒt\≈\Õ¯híGo\“\»|ÕûßpÒR.ñx*©\ŸQM4sC \ﬁdë∏9Æ\‡ékôEØtj\“˙≠ôXØ∞ª\»nù[\»≤Fx¸≠hˆ®àØîk˝C≥m[O®¥\ÌWW#l8û™¢<Òc\«hÒ\Ê9Ö≤≠ãm;N\ÌKIE{±\ ;0\⁄\⁄\'∏u¥\“cãOx\Ówh˘˙ä\¬\€V\‘4ˆ\Àtúó´‘¢JáÇ\⁄:6;Òï2v\0;y\ÏZ\”⁄Æø\‘[G’ì\ÍCRdï\‰∂ZOx1É∞}™\–Y˚†e°˜.ê4Uçm≤Ü¢•«ª-\Í\«ˇ\0±liJ\Ôr†¥[gπ]+ ¢£ßa|\”\Ã\∆1£¥í°û\ﬂ˙\\UUæ¢¡≥\ÍjañIxëøåìˇ\0Iß\‡è\÷<|âw:\Í€ùt\’\◊\Zπ\Í\Í¶qt≥LÚ˜º˜íxï\‘DDYÛ¢∂\ﬂ*ˆ]p˜é˜\÷\÷ijπC§cxæçÁúå£ΩΩΩúV\¬4\’Ú—©,\‘˜õ∆û\·AP\–¯¶Å¡\Õ#¯\ƒ/QR\ÁcÄ\‚\‚çn<I\ÊUHààä;t†\Èj\Ÿıæ£NiZòkı\\Épñ˘\—–É\È<Ú/\Óo¥¯\Î\Ó\„]Yp∏OpÆ©ñ¢Æ¢C,\”H\Ïπ\Ô\'$ìﬂï\ÿm¡Åè!µçc\œ(\Ó>=\«˚{\⁄\Ê<±\Ì-sN#B\"\ ˚€ÆπŸÖ\\p[´\r\∆\Ã\\:\ÀmSã£#ı6W»∂C≥\Î¸∫ßG[5∂ö\€K´°˘%XXÛûx\Ï<«Å\≈}5\Ô\⁄VÉb7k6¢¨\r≠π4e;8\…$\Ãps]é∆ÇOﬂÖ≠¥DW^Ãµﬁ¢\ŸÊ®áPi∫\◊S\‘Fq$n\„\Ï\Ìc\€\⁄‘≥ü·•¥o˘ü˙9?ô?\r-¢ˇ\0»¥˜\—\…¸\À\ÌC_\Í=£jôµ§¨\ÎßwõM\·\Ïc\ÿ>\ﬁ\’h¢ú~\ÁNå}óΩ\Îz®∞Îî¢íêëˇ\0<ó\Îq\«˚TµDDDDDDV\÷\—uÆû\–\Zb£P\ÍZ\Ê\“\—\¬0\—\ÕÚø±åo§\‚µ\—\“nZõj˜WE,í[¥¸/\Õ-∂7˘æê˙N˙áb\ƒhàààØ\Ìë\ÌcZl\¬\È\ÂZj\‰\·M#ÅûÜo>	Ωm\Ï>#L˝íÙ≤\–Z©ê\—já/sv3ªzï\Á\¬OG˝\ÿı©nÆ¢∏\“GWAY]<Éyí\√ {\\;¡;ùÉ∫8∏Ø≠n\Ë\Ô\'ô\ÔU\"\"\"\«\€G\€\œ6NÛ®µ3jö2(©\‹%®wÜ\„yz\Œäà;m\Èg™uTsZ4T2i\À[Ú\◊Tof™V˛\–\‡¿|8¯®\◊,≤M+•ï\Ó|è%\ŒséKâ\ÊI\\K\Ë$ézMsnêÜ’¥aè<£∏¯˜\Ïy\ÔkòÚ«¥µ\Õ8 åU\ËúíT\Ã\Ëá\—\ÀI¥\r†\—q\·-≤\Ÿ3yvâe\Â\r>≤§6‹∂≠ßvS§üu∫<M[(,††c∞˙áÅı4vû\œZ÷¶\”5∆†\⁄™®\‘Zé¨\ÕS)\ƒqé\¬\Œ\∆0v4+]]2—óm≠≠\⁄^\œtıíÄ˜\„ÕÜ1\≈Ú;∏í∂´°Ù\ÂªH\È+fõµGπGoßl1˜ªãèâ9>\’\Ì¢\"\"\"\"\"∑∂Å´¨zJV\Í]CT\⁄j\ZVdüJGz,h\Ìq<\0Z\–€æ\÷o˚W\’Nπ\‹\ﬁi\Ì\–e¥\rvY;\œ{\œi˛¢\"\"\"\"+\«B\Î\rU£d+£∏⁄£\ÀbÇr3á{>	$Lø§˙a\Ì2’Ü]\È-7∏ál±§>∑4ˇ\0ì\Ï=6\Ï2≤˜¢\Î\È\›\È>ö•Øo\»@*Ò†ÈÖ≤I\ÿ:Ò~•v9:àÚá/Tt≠\ÿ\…\0˚˘Z?ˆO]jŒñ\€ße\¬\ÎQ\√8äÑ¸úHV\ÂÁ¶éœ©Å˜Æ¡~Ø=Å\Ìd9˙\ «öü¶∆°ú>=;§mÙ`è6Zπù+ö}Ca\Õm\“k\Z¥I\√VURS?ù=˘v\€\Á}kK#\Âë\“J˜=\Ó9súrIÒ+ç\–H9\nÙö\Ê\\#êµïmc\œ(\Ó>=\«˚{\ÿˆ\»cs\\H\‚rô]˙9c\…6Å¥\n.<%∂[&o.\—,†¸°ß\÷Tá€û’¥˛\ tõÆ∑G∂j\ÈAe\rá\‘?¯4vû≈≠]¶kçA¥-YS®µYû™cà\„Òp3±åç\’Z®àààã\◊“∂æßæ\”X\Ï43W\\*üπ17$¯û\‡9ìÿ∂9—ìbñ\Ììi\√5K£´‘ï\Ï]T\«>©ü™3\⁄}ã2¢\"\"\"\"\"\Î\÷US\—Q\ÕWW3 ßÅÜId{∞\÷4íO`kc•N\Ÿjˆß¨ùOA+\„\”6◊πî\Ái\‰fp\Ô=ù¡adDDDDE\ËR¿\∆\«\Âu`ı^É9O\›\ﬁ±◊´®í¶^±¯çh\‡\Z;\0Æààààààä°úåg=òSK¢wG\√3h5˛–≠√Æn$∑P\ \ﬁ$z2\Ã\”\€\‹>^\ÃH\rπ\Ì[O\Ï£J:\Ît{f≠î\––±\ÿ}Cˇ\0ÉGiZ\’\⁄f∏\‘B’ï:ãQUô™f8é1˘8#\ÏccGıV™\"\"\Ô\‹-WKsau\¬\›WF⁄Ü	!3¿\Ê	y9πGà]\\Ù¥Û\’N\ zh$ûWú1ë∞π\Œ=¿k7Ïõ£—µ¨ëU\\®ù¶\ÌN¡5\Ï\"W7ıb¯Yı\·MÕå\Ï{GlÆ\‘`∞\—ı\◊	ZM\∆pÛxg\—oÍè≠ddDDDDDEz{\Ìmˆ\Î{vcb©›©¨`ñ\Ô#≈ë-á˝\‹œÜiPÖz∞1±˘]X\"/Aúåß\Ó\Ô?\ÿ\Î\’\‘IS&˚Ò\‹÷é£∞\0∫ËààààààæÄI¿*ftD\Ë\Âè$\⁄\–h∏ñ\ŸlôºªD≤ÉÚÜüYRn{V\”\€(\“o∫\›\\\'≠òP–±\ÿ}CÒı4vïÆ\r°\Î[\÷\”5$˜ΩEWΩqy\"Éàôr\"hÙ@\Ï=ΩΩ\Í\Õ{\\«ñ=•Æi¡`Ç®DE,z\"tr}˝Ù∫\Ô^Qπ∂ñë%æ\›+pjà\Â$É˝>\·\Èzπ\Õk•ñ\œu¢Úù™ä∂ò\rﬁ¶x\ZˆcªaX}Ä\Ïv\Ê˜>´AZö\ÁsÚp¯∞FFVã£Ü\≈i$\Î\"–înw˝Zâ§#ûBæt÷ä\“:dßÙÕ¢\ÿH¡u5#\„\Î d´Ö∑¥ùYo\—\Z\Ì™nO};§\r\'·øìX<Kà’™=a∏jùOp\‘Wiåµ∑\náO+èy<áÄ‘ºtDDDD^Ö,l~WVU\Ë3ëî˝\›\Á˚z∫â*e\ﬂy\Õh\‡\Z;\0Æààààààã\ËúíT\Ã\Ëá\—\ÀI¥\r†\—q\·-≤\Ÿ3yvâe\Â\r>≤§>‹∂≠ß∂S§\›t∫=≥WJhh\Ï>°ˇ\0¡£¥ˆ-j\Ì/\\j¢j∫ùG®\Îı3G\·\ÏccGı*\÷!zMs.1à\‰ U¥aè<ÉÛOèq˛«ûˆπè,{K\\”Ç¡PäXÙD\Ë\Ê˚¸î∫\Ô^Qπññë%∫\›+pjà\Â$É˝>\·\Èzπ\Õ\”=%<ÙÙFh!|ç\"wÉKÉG\÷ˆÄ1Àí\Ì\"\"\"\"\"\"\"\"\"Ü\ﬁËÆªpéÕ≥\ )\»ˇ\0\ƒ.ßü1˝\Œ\«\Ï®`ààààãøK™´i\ÍΩr2üªºˇ\0cØUQ%LΩdÑw5£Äh\ÓÅ\–	8$©ô\—£ñ<ì_\Ìãè	mñ…õÀ¥K(?(o¥©\r∑=´i›î\È7\›.í	\Î•¥ˆ8\‘?¯4vª≥÷µ©¥\Õs®6á™\Í5£´3T\ qcÉ!gc;\ZÆã\Ë89\“kôp`éBT—Ü<\Õ>=\«˚{\ÿ\Ë\ﬁ\Ê=•Æi¡qJ\Óà}ü~íó]\Î\ 72\“\“$∑[•n\rY\ÏíA˛üpÙΩ\\\ÂÜ\÷ˆâ¶ˆ]£§æ_&k\∆ıtîë\‡IP¸pc\⁄y\0µ˚W∑}Yu€ïØiJÉ˛B®u4Qºà°¶\'âæ∂ìì\⁄x≠óZ´ÈÆñ\ [ïÇZj∏Y</ú\«\0A˘\n\Ì¢\"\"\"\"\"\"\"¢G∂8\›#\»k\Z	q=Ä-R\Ì\ÁVI≠v∑®µû\ÁE5c\„ß\Áv&\÷V±~ñ6!WVU\Ë3ëî˝\›\Á˚uT\ d~;ö\—¿4v\0]\–	8$©ô\—£ñ<ì_\Ìãè	mñ…õ\Ì\ \ \Ì*Cm\œj\⁄we:I˜K§Çz\Èr\ \n;®h\Ìwg≠kWiz\ÁPmU\‘j-EVf©î\‚8\«B\Œ\∆0v4+Y\—¿\‰)q\—?£\Îµ#hu\Ê\–h-\—˙\n9\r`IG\Ê\Œ˛\ﬁ\nT\Ìkhöoe\⁄>K\ÌÚf±å]%$xT?¡¸y\0µ´∂§\Í-ß\Í\ÈØ\◊˘\Œ2[KH\¬z™hÛ¡çi\ÊJ±\÷\«˙\r\Í˜jmá\“P\‘M\÷U\Ÿ\'uÚrzøÖ}á≈ûQX] ı\“\€\’7¶I\’\ÕæFB\Í<n7\Îr\’\"\"\"\"\"\Ô\“¡cU`ı^Ñ|åß\Ó\Ô?\ÿ‡´®í¶S#Ò\‹÷é£∞\0∫ËààààààæÄI¿%LŒà}q\‰öˇ\0h\\xKl∂L\ﬁ]¢YA˘C}•Hmπ\Ì[N\ÏßI>\ÈuêM[(,††c±%Cˇ\0ÉGkª=kZªL\◊:ÉhZÆ£Qj*≥=L\«\∆\‚\·gc;\0V≤\"\"ñ]˙9æˇ\0%6º◊îeññë%æ\ﬂ+pjà\Â#\«˙}\√\“ısñZ\⁄&õ\Ÿ~èí˘}ï¨c[\’\“Q«Å%CÒ\¬6\„\»≠˝´\Ì˜µ}M%\ﬁ˚8äví\⁄\Zf8ı0≈úà¿<è\Îvû~\ÿ\Ë\ﬁ\Ê=•Æi¡qP•oπÀ®ùIØ/\⁄bIW_B*cgf¸N¡?#æ•:\—G/tm˚\rä\‹\◊`\‹\Óê\¬@<\⁄\–\È>L∞-z\"\"\"\"\Ô\“\”\∆\»EUX=_†\ŒFC˜xˇ\0cØUQ%L¶I\Ó\0p\r¡p\"\"\"\"\"\"\"˙$\02Jôù˙9c\…6Å¥\Z.<%∂[&o.\—,†¸°ß\÷TÜ€û\’t\Ó\ tìÆóGâ´•îvPÒˆ4vª≥÷µ´¥\Õq®6Ö™\Í5¢´3T\ q`˛.v1É±°Z»àäXÙC\Ë\Ê˚Ùî\⁄Û^Qπññë%æ\ﬂ+pj\œdè\È˜K\’\ŒX\Ìkhöoe\⁄>K\Âˆf±ån\Â%$xT?¡ˆû@-j\Ìái:ãj\Z∂kı˛s∫2\⁄JF\’SGû\rh˚O2Uê8q^ìÀÑb9T—Ü<\Õ>=\«˚{\ÿ\Ë\ﬁ\Ê=•Æi¡qeûàwZ:Cii7\Àc©ôÙ≤xá±¿ù∫∂xàààààààä ˚•5ÆeãF\€˜∏KSS1o~\„X3ˇ\0zÑ®ààãøKOpä™∞zØAúåá\ÓÒ˛\«^™¢JôLí\‹\0\‡\Z;Ç\‡DDDDDDDS\'°\«GàßÜãhö\‚ê=é\ƒ÷´t≠\‡G£4Ä¸≠\’\"∂\Âµm=≤ù$˚≠\—\‚j\ŸAeá\‘<©£¥ˆz÷µvôÆ5–µ]F¢\‘ufjôN#å2v1É±°Z»àäXÙC\Ë\Ê\ÎÛ\ÈµÊº£s--\"KuæV\‡\’\…?\”\Óó´ú±\⁄\ﬁ\—4\ﬁÀ¥t∑\À\‰\Õc\›\ JH$®~81É\Ì<ÄZ\’\€\“u\‘5l\◊\Î¸\Áteîîå\'™¶è<\Z\—ˆûd´\—√äÙò\Ê\\#\»\‡⁄¶å1ÁÄê~iÒ\Ó?\ÿˆˆGQ%∑k:V•¿±\–^©KÅ\·åJ‹èì+mCà\ \"\"\"\"\"\"\"(g\Óòˆ/˛˚ˇ\0P\Õ~ñû8\‚U`ı\„\‰d?wä\Î\’\‘IS1íB;ÄGp\\ààààààã-tR\Ÿ\Ï[E\⁄˝∫\›]í\’B\rmp\«1ÑaáˆùÅ\Í\ ÿÜ‘µïßg;>∏jkà\nÉaÖº:\ŸF\ﬂY¿ı-_\Ì/\\\Í\r°j ≠G®™\Ãı3G>d\ÁÉ;\0˛©•6y≠ı]+™¥Óïª\\†ns4\Œ1˙Éπ\‡ºk\Âû\Ìc∏>\ﬂz∂V[™\Ÿ°™Ö—º{2º\‰E,z!Ùsu˝Ù\⁄Û^Q9∂ñë%∫\ﬂ+pjè1#\«˙}\√\“ısñ[\⁄&õ\Ÿvéñ˚|ô¨c\Â%$xTIé`˚O µ∂√¥çCµ\r]5˛ˇ\09ãi)OUMx5£\Ì<\…V:\"\"∫¥;\„Æ\’\÷6\Ã ¶W¡π!\Â 7\Õ>=\«˚lèÚmıR\"\"\"\"\"\"\"á~\Èe+\›n\—UÉ;ë\ÀW\ÓÀÑD~\ÈP≠w©i\„éUVWˇ\0>FC˜xÆ\n™â*e2HGpÄh\ÓÅ\”˜5\ÌQyØΩπüé\Î)\ÈZ\Ô\’√úG\ \Ê˜H\Ôï\Ÿt¶ùcú\ÿj¶öÆ@98\∆\Z\–\œ çùtM.\–v\√c\”7|äW∫j¶ÉÇ¯£i{öf@\¬\⁄=™\ﬂEj∑An∂\“CIGN¡0\ƒ¿\÷1†`\0\≈}+6sg◊õ*ªM=$b\Ôl¶}]Pg\„\Z\Ê\r\‚\ÃÛ\›p\Ì\ÏZ\∆E,z!Ùru˘Ù∫\Ô^Qñ\⁄ZDñ\Ît≠¡´=íH?\”\Óó´ú±\⁄\ﬁ\—4\ﬁÀ¥Ñó\À\Ï\Õc\Z:∫JH$®~81É\Ì<ÄZ\’\€\“u\‘5l\◊\Î¸\‰7%¥îå\'™¶è<\Z\—ˆûd´À≤\⁄S]¥\Õ/FΩ\◊\›\Èc\∆y\ÊVÖ∂Êé®\Ë~\ÔÙ\\®ààààààä6{°vgW\ÏVí\ÈrmóH§{±…èkôˆπ´_Hàª‘¥Ò\«™´ãÙ#\‰d?wä‡™®í¶S$á¿¿4w¿àààààààà¶_π≥yÖÆ’∫}\Ó¸k˙ä\∆{Û>p^«∫=¶\Á´\“zsTCüæ¶Jià≤ÄA?\Ó`\’6Æ≥≠®Yµaç\“¡K)mLm¯NÖ\‡µ\‡x\‡ï¥=™Ù˛∞≤\√y”∑ZkÖ\Õâ\‡ñ\Á±√õOÅX•\Œ\ÿl\Z;g∑M7Eqß™\‘wHM4R:ùÆtè\«¡¿\Œ\‚Nπ±\Ëâ\—\…˜˜\“\ÎΩyF\Ê\⁄ZDñ˚t≠¡™#îíÙ˚á•\Í\Á,v∑¥M7≤\Ì%Ú˚3X∆ç\ JH$®~81É\Ì<ÄZ\’\€\“u\‘5l\◊\Î¸\Áte¥îå\'™¶è<\Z\—ˆûd´enâñW_:@\ÈZp\¬\Ë\È\Íç\\áÛDm.\Á¸´hKèÚ±˚ø\—r\"\"\"\"\"\"\"≥6◊•Ü¥\Ÿ^¢\”a†\ÀWDÒFq+FÛ\ŒjÇ¢)\Êí	òcñ7=ßõ\\+Özñû8\·UcÒ\„\‰d?wä‡™®í¶S$áè \0\—\‹\"\"\"\"\"\"\"\",ë\—\œhf\€Wµj	ãΩ\Ô.4\’\Ì∞øÉé;\«\Ï[,\’V;–¥5Uûª´≠¥]\ÈFÏëêr\◊µ\Ì=\„ÅkOm\€!\’[-\‘\—›©$û\⁄˜ü#∏\∆\“bôπ\·ìËªºaQ\‹+\Ë≥\‰Uµ4\€\‹U+ôüêÆ:Zâr\‚˘dq\∆I.säñ]˙5\‘]*©ıÆ\–ÌØÇ\›P\⁄\ÁnP\ÓaÚ¥Ú`\Ïi\Á\€√ú´\⁄\÷\—4\ﬁÀ¥|ó\À\Ï\Õc\›\ JH$®~81É\Ì<ÄZ\’\€\“u\”ıt\◊\Î¸\Á[IH\¬z™hÛ¡çi\ÊJ±\—KüsìHæ£Q_µ¨Ò™íCLÛ\⁄˜ù\Á\„\‘~U7\—q˛Oˆ?w˙.DDDDDDDZ\ÊÈ±≥)tF”¶øP”ñ\Ÿ/\ÔuD.k|ÿ¶ˇ\0âá8xÄzöû8\·UcÒ\„\Ìê˝\ﬁ+Ç™¢JôLí<ÄGp\\ààààààààà§\«E^í\Ë(\·\“\Z\ƒ\ÕU¶À±MR\ﬂ:JûXÙ£\Ê;;î‚°¨\“˙\ÁMı‘≥\€o÷ä¶q\∆\Ï\—<\¬?ÅX\‚˘—ìb˜jßTøH∂íGëIU,,ıµ€£\ÿø°ˆ%≤\ÌT⁄ªè°é©á,®üzy\Z|!${d\€&ãŸÖ™IØ7\Í.[øà∂”º:yfG¢<N∫6√¥ùE¥˝]5˙ˇ\09\«\“R0û™ö<cG\⁄yí¨tDDD]\ÀMe\÷\ÁKl∑¿˙ä∫©[0e\œ{é\0“∂ù∞]Õ∂ck\”,\›uK\◊V\»\ﬂNwÒyı\0x\".?\…˛\«\Óˇ\0E»àààààà≠¨h;&\—Ù]vóæCòßnÙ34yÙÚèÉ#|G\÷2¥∂ü≥{\ÊÃµ=E£T\”\ÿ\‹|íF|\n\∆v9ßªø¥rVMUDï$<y\08é\·\‡∏\\\Z?X\Íù!W\Âzj˝_jîÛ4Ûáz\«\"≤≠J›¥R”à]~£©\›\‰\È®\".˘@^F®\È!∂CN\Ízç[5.-°âî˘\Ÿh\ÎX¶∂™¶∂•ıUï\‘O!\À\‰ï\Â\ŒqÒ%u\—rD\«\À#cçé{\‹p÷¥dì\‹\Á\Ëg∞t»áh\Z ò6Ò+3m£ëºi\Z\·˘Gw<éC∞z‘≠DD\\_ì˝è\›˛ãïq\Œ\Îx∏˝^*\ÿ\⁄.Å\“˚@”≤Xı=∫:∏\ÁG\')a\Á±\‹\⁄T\€OE]k£\Âö„•ô&•≤å∏u-ˇ\05{ù•\Îo\»|™ßûñw\”\‘\√$2∞\·Ãë•ÆiÒp\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"æ6k≤Ωu¥:\÷\”\Èã\rMD%¿>ÆFıtÒ¯πÁá∞d©Ω\—ˇ\0£.ô\Ÿ‹ê_/\Ôä˝®\⁄õ#ô˛^ô\ﬂÙ\⁄yü\÷<{ÄR	q~Kˇ\0O˜¢\ÂDDDDEC\‹s∫\ﬁ.?Wä˙∆ÜéÚyì⁄™Ee\ÎÕñ\Ë-p\«â¥\Õl\Œˇ\0\Ã˜&;\Ì¡XXt,\“5Æ|∫cR‹≠.\'Õä°Ç¢6˝é˙\÷+\‘=\r6ïB\Á:\”s±›£áZ\Ëd>\«‹¨KøF\Ì≥\€w∫\ÕU;G•M<R\Á\ÿ\◊≠ö›í\Ì:àü)\–\Zí1úd€§#\Â≈©\—˙≤õQ¶ØgñıÉ?R\ÈMfª\√!é[Uto\⁄\Íwˆ.?z\ÓÚ\Íœ°w‹®Ú*ﬂâ\‘}˚ì»´~\'QÙG\ÓO\"≠¯ùG\—π<ä∑\‚uD~\‰Ú*ﬂâ\‘}˚ì»´~\'QÙG\ÓO\"≠¯ùG\—π<ä∑\‚uD~\‰Ú*ﬂâ\‘}˚ì»´~\'QÙG\ÓO\"≠¯ùG\—π<ä∑\‚uD~\‰Ú*ﬂâ\‘}˚ì»´~\'QÙG\ÓO\"≠¯ùG\—π<ä∑\‚uD~\‰Ú*ﬂâ\‘}˚ïM∑\\(*ù\ÍÖ\«¯/æı\‹ˇ\0\Â’üB\Ôπv\·\”ZäbŒ™\≈s~˛7wi^sûX\‡ΩJ=ú\Î˙√ä]®&9\›Û-Úû=‹óøl\ÿF◊Æv{fyuu?øÖyX˙%mä\‡\·\ÂV\€e®fÆπßGº≤Fï\ËIZ˜G&®÷ê\ƒ\œN}1sΩèy\«˝´4hNå{&“Æéw\Ÿz™f[rì¨°ú\Z>Eô(©i®iKGM\r4å2(ò∆é\‡\0ªàààããÚ_±˚ø\—r¢\"\"\"°\Ó Ó∑ãè\’\‚W\÷44wìÃû\’R\"\"\"&r˘Å\‹µ§`ÅÚ.∑ΩÙ?¶˙&˝\…\Ô}ƒ©æâør{\ﬂCÒ*o¢o‹û˜\–¸Jõ\Ëõ˜\'ΩÙ?¶˙&˝\…\Ô}ƒ©æâør{\ﬂCÒ*o¢o‹û˜\–¸Jõ\Ëõ˜\'ΩÙ?¶˙&˝\…\Ô}ƒ©æâør{\ﬂCÒ*o¢o‹û˜\–¸Jõ\Ëõ˜\'ΩÙ?¶˙&˝\…\Ô}ƒ©æâør{\ﬂCÒ*o¢o‹û˜\–¸Jõ\Ëõ˜\'ΩÙ?¶˙&˝Àñ Ñ1\∆0÷Åï…Å\‹\‹\‡àààààààà∏%˚ª˝>\≈Ãààäá∏É∫\ﬁ.?Wâ_X\–\—\ﬁO2{UHàààààààààààààààààààààààãáÚ_±˚ø\”\Ï\\»à®{à;≠\‚\„ıxïıç\r\‰Û\'µTààààààààààààààààààààààààà∏%˚ª˝>\≈Ããç\Ó Ó≥ãè\»<J©ç\r\‰Ò\'ΩTàààààààààààààààààààààààààà∏\'ˇ\0ß˚ø\”\Ï˚9ï-hnp9úïR\"\"\"\"\"\"\"\".µ}T4TS\÷T<\«∫Y_ÇwZ—íp8û±|∂\÷\”\‹-Ù\’Ùíu¥ı16h_∫FÛi¡\‚2\Êæ\’U\“\“63US8ñV\≈ï\·ª\Ôq\√Z3\Õ\ƒô_!´¶û¢¢jaíjgO^¢%°¿8-%§=Ñ\⁄]z⁄öj*Yj\Î\'äöX_$“º1åh.q<\0\Âs4á49§FAä©t,WjÂ¶ö\Îk®\ÎË™ôøõénÛ{\‡ˆÖ\ﬂDE\«$åé7I#É\–Kú\„Ä\0\Ì*€¥k\›#umcËØê9ît\Ê™wH\«\ƒ#ú†º\0\Ê~≥r<U\Zˇ\0I\◊\–\÷V\“]$TLc\Áoí\Ã$k^p\«\À7\‹\“y8[G\—Ú\“\…W\r\Œy\"é\'ê∂Ç†ñIªΩ∫[πë¿ÉÀµ&\⁄>ãÜ\◊Es}ÒûK[\ÂÅÕßï\ƒ\∆\«nπÂ°ª\Õ`#\Œ\0xÆ\≈\Á]\È;=T4˜\›<Oö&N\“÷π\Ïlo8k\ﬁ\ÊÇ\÷4ˆ9\ƒó=s•ÌóÜ\⁄+ÆCX˘£Åç4ì∫G\„q°·õß9™™m•\ÎØ˛ÒR\ﬁ\"íø¨|Må1\·Ø{>\ZÚ7\Ê\‡Â†í0{ïVùk•Ó∑∑Yh.\—O\\Å¨xlÖáyØ-\Ì\›\'\n\„DDDDDDD\\]K?4¸ß\Ô\\®ààààààä¿\€4W\Ë\Ìù5OWUq°ûF)\⁄\Á∂h_KG0◊∫7\Á∞4ïc€¨ö∫Ç\√[pöû\ÔUY•´)©mÒ\Ó…ø_2:Gµº\ﬂ\÷A+[ëúñc±u\Ï˙o\\\À`ºP\‹s5ñ;y©∑J\‡*\Í\ÊtUD0˙[Øâ\—\„é7\»\Ì^ûàèVC™%∏^≠◊≥mh™‘¢>°\Â\¬IY’≤ç≠\Ì{[æzæ`\„ÜJj*Kú∫ˆÒ=-™˜[\ÂÙµ\0ı‘ïöf\Z\"\Z#\\añ\"\‡\’$q88\ Û´¥\›\Ó\’`\Í¨\÷\€\€z\Ì)G-S\◊=œ™é¢\"\Ê\‡ü Üoç¡\«\0\Ï]çUCY©n´ƒñMD˚dW\ÀML,4\’0\ ˙v46wG\√\Œ8xs¿+ìQX\Ótµ;Duä\€|é≤\Â\‰u4r5ïl\‘ÿÄT5ß8\Î8H72é\r¿K&ú∏W\œe•|wìdöˇ\03‰ÖîïTQ\√ê∏è2∂\'H=-\–\\\Á\00FzwΩ=s≠ü[⁄©≠W™\·[o∏9ìMM;\Ÿ ëÆÜ\Ì\„\rC?Y\ƒ4∏q!r\Í\ &ÇCüU\…	\”,ãO6:zΩ˙kÄ|ª\≈˛îo\œTw§¿\›Ω\ÎC5ÙÚjK~£ñı\Â∫ÜÆôíöVS\nfH?\÷uª\Õ>q$\ÂljA•®\·ìSZ/59¥\≈\Ôxß¢î˘+•≤S∫?FB\\\…éÜ{Ö‹¢°Ø˜\ÔPìo\‘\Õ\’o™πö:∆∂V\“˘;òˇ\0&ë«™,\«V\Z\÷\Â¡\„$≠\”k∫K`≠ãOZµE,n≤Q\≈pd\—T\«$ï\‚™\"˜0?\Œs\√:\Õ\Á≥#q^\Ÿ\“ı∂\ÌKQSn†º±î∫∫àQ≤w±îèä.Ω\Õêc.s˜ù\À#â\‡≤ı\÷*\Ÿ\ÌÚ\≈o´e%S±\’\Ã¯∫¿\Œ#>nFxds\\ï\≈Õ£ù\ÏßuKõãa!\«¡\„√è.<‘∂\Î∆™óS\‘ZmW\ÈS¶%¶dW:Lh\Â\Î\·Kö\–CNN≈≠Û¯\·]TóJ\ \›ay\÷V\›=ym5ö\Í\rUæX%û°≤>Q\‡Ú\0-e\ÿr\‘Z/6ùí\“\Ÿ\Ì\Ì´}\ÓÛ4Q\‹*„åô#ñ™A\Â3ª-\›~	¯;≠\ÓMß6+~ô:^\◊mø\—D\ÎaÇé™\—A\Â!\ÿih•~\Z\Á0∫rws\ÿ\‡AVÜØ∂_\ËlıÙ\Àm¬í≤˝ß)hÍ®°≥>≤L\ÿ]ä)\€&!\›\ﬁ\›qîú	*˛ßµ\◊\÷\Îª5%¬öo{t˝≠ì\∆Ú\”\’M[&c\»\'ÉålkºAî\ÂeZ≠7¡™4ˆú£é\È\ÔUüPO]\’\’YüQ\';Œ™\ﬂ1\ 	ì\r!\ﬁw%\Îl˙™mA©\Ìó[˝≤˝o´¶\ÎÕ∂\⁄lS\“\—\–µ¡\≈Úπò|Öú2Hn\\@9Yqˇ\Ÿ','AC',7),(17,'rosanchez@trazalog.com','Roberto ','Sanchez',0,'21232f297a57a5a743894a0e4a801fc3',1,'ˇ\ÿˇ\‡\0JFIF\0\0\0\0\0\0ˇ\€\0Ñ\0	\r\r4,$\Z*!=-15,.11 3D5,C49:-\n\n\n\r\Z- %777-/+7-7+,1/-3357-+/.-1+---/+-/7-+-777+-7---+++--ˇ¿\0\0d\0d\"\0ˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\0=\0\0\0\0\0\0\0\0!1AQaqë\"23BRSbrÅ°\—#%Cíì¢±\¬\‚ˇ\ƒ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\0(\0\0\0\0\0\0\0\0\0!1\"AQa#RÅë°ˇ\⁄\0\0\0?\0ºQ\0DD/jºK\√\Ë\ËKçECt0\”Y\ŸG∏\Ë<∏ˆU˝wé5Dù\≈,∑ñ˘ÚJ\Ô\Ì≤\∆Q≤ãe\Ëãœ≠Ò´Ω\ÃtÑt\…0ˇ\0u2\Ÿ?ij\\\ÿk\Ó9	∞ì6zw\‘Òo.:wL†\‡\—h\"˘cÅ\0çA\Z\Õ},öÑD@\0DD\n¶Òón\ﬂO˚Æï\Âì9†\‘\ \Õ\¬6ûN#RyuV≠L\¬6:Gh\÷4π«†hπ^D\≈Ò\’O5[ı|“Ω\Á∂bl<Ä∞˚≠õ\¬9f\Z\"-	\¬\" -_v\Ì\ \Ã*•Ÿ©\‰9iûÛ\‹¸GpbØe\„P\‚5\ƒÇ9®>|§6_\ƒ¸:•ë\«$\‚\nÇ\∆∂§öd∞≥éúo\Õnô\„\Íâ\⁄/à\ﬁÅhEà!}≠à\¬\" àÄ\—Ìº•òusáG=øë¡y</Z\Ìm>ˆÜ≤!©}$\‡Âé≤†¸3\Ÿ\—;Ω\›(ºQõD\”¡Úho\‰\›>\ﬂ%_Qj™l±ßÉõ\¬8¡|:öhw\“\…\Ów∏eπçè7Ù\ÂßÅ]∞Ñ^ˆ6\Œﬁ∞π§˙:\≈\\´\≈#•å\œ.}\ÿ \\˚^¸mÀ∫\·«®\‹\Á\«9Ù:oMπ( ¨\"¶/ÑÇh˛≥o[,x |é\»∆π\Ó˘,isΩ∑ü\‚f6®\«Ú\ƒNı&\À{G\\\◊¿*\€\⁄xak[3ÄΩÖá3\À\Õ[ñ∫\ÿ,Œº™!\'\ÂëQQl>#-≠eŒõ\Á2>\‹\Õ\÷Ûı?ã\⁄˘i¸∑\ﬂÚ•t;qF˜\ƒ®èy#\Z\√$/\rsú\‡\0∏\—\\[\“Ymôˇ\0H\Ì+j6\√J\√vì!\—¡$\‘˜ˆ\È\ÿ\Ê\‘B\·\Œ¡¶\Ì=¿ıW>\Œc\r≠ßé®G$9\Ôö)\⁄X¯\ﬁ\“Cöo\ƒ\\V\“»Æ§To\'(à≤`\"\"S¥3π±Y∫f6\'µää\ƒ∆∂¿\0\Z>+l\—˜)Ωtms\◊\ÿ4çI∂ù\‘-\¬ƒã\‹\ƒs^´FJ\≈,ut\r8µéN\Ì\Ï_6®\€Las\⁄\”\0∏\Ìí>∞\—s£sM</\—rU&±ó˝&˚Üd\›\Ân\Ó\÷\…añ\›-\¬\ /Q0d•å∞çØ\0∂¿Ç4Ω\Ôˆ˙.->\\ô¥∑{^´_\’\Î\„jäÇ\∆\nö},†\ﬁ\‚n¯Xö\◊4@p8ªÇÉR\„U.©äõ8\›\Ám\√@-ˆ%NWkO|né\ËúÎ©ïO\ÂÇ àà.∫k\'›±\“Z˘E\Ï9Æ\Â\◊Q{\\\√¡¿Ö§Ûµ„πïå¨ë\n\Í˜\Ã}£fÚh\‡?Ö+ÚÇ\„¿\rWl\—8±\‹A\◊Û\—b\◊¸˛Ø‡ºÖíúß\Á\Óz\Z\„∑±êã_Ö\’\Ê≥\Ôá§\ÿ(\⁄\√$OàoX\‚Cüêù,MÖ˘h∑ëxªej\»oÆÆ:˝W+9D∂}ø∑o`\ÔÒe.^è•º\‘\ﬂ\…\«◊ø©¯à∫eàà\" 5∏ûŸµ˜ØGu\Ï{(\Œ)É\‘9°Ö˜\Zd±æ™nñTo\–Ul∑>¡f≠T\ÎX\\¢™%X\‘C(=@[*x*∆èßî˝&∑Ua\Ÿ,°}*∑\Í…ºB~»Ñ≤äc¸)õH__£\Ê˘∑˙)•í\ÀOØ\Óc\ƒ\'\Ïç6Ü:2d~é\"¡Ω\Ê\Àrà∫T\”\Z†°\≈;,sñ\ÊràäS@àà\" àÄ\"\"\0àà\" àÄ\"\"ˇ\Ÿ','AC',6),(18,'m.muriel@mrsservice.com.ar','mmm','Muriel',1,'21232f297a57a5a743894a0e4a801fc3',1,'','AC',6),(19,'r.sanchez@mrsservice.com.ar','sanchez','sanchez',0,'21232f297a57a5a743894a0e4a801fc3',1,'','AC',7),(20,'test1','test1','test1',1,'098f6bcd4621d373cade4e832627b4f6',3,'ˇ\ÿˇ\‡\0JFIF\0\0\0\0\0\0ˇ\€\0Ñ\0	\r\r\r\r\r( \Z%!1!%)+...383,7(-.+\n\n\n\r-+-+---+--+----+-------++-++++-+-++-++------------7ˇ¿\0\0\·\0\·\0ˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\0F\0\0\n\0\0\0\0\0!1AQRaqë¡\"2Åí°±\—#BDSTrsÇ¢\¬\·3Cbì≤$cÉ\√tˇ\ƒ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\00\0\0\0\0\0\0\01AQR!\"aëB°2#bÅq±\·ˇ\⁄\0\0\0?\0˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\nπ\≈p\…/:.%3\n<EkÜ\»zQ\Ëû(\Í\«=!áè\rı.π\ƒ\ -\◊<ín\—jÜ¶Y•™3{ë\⁄eÙnv\À\r\‚\◊||∑\„$\“i¶û\‘\÷\‘\ÕM\…\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|^¯{£ª\r\‡\Ë¢Zì∂2ú\Ï^T`ûIGë∑ûﬁÉﬂ¢±My™Æ\Êm\rUvÒES<\ﬁu-%àñ◊àπøºüº\ÍEG\„$‹π?î¸ èc\·≤\«\◊9>Û8à\Ë\√\≈WY˘cîÛ\·yı\Ì.S\‚£këxaV\Ãr\ÀO\‹6ù\¬’£\Îé#T$•fQú“îcÆÚG#Uj∫Æ\Ã\”KΩ°øE\"+™#ã≥f\Ï4Z˘\ÂO\Ï∑/a¢4\◊{^ô\÷Xè\Œz\'N\·1Z\ﬁ\Ë\Õ\« é\’%”ì\‚0Æ\’T(\√m´\‘\\å\—9tçm†\0\0\0\0\0-∂0ãî§£≥ro$ëb&|°&b#2\Â\œt˙9p\„(Ù\”6˝ù≤\”:õ1˘\√Z\Õ\Ÿ\Ë\»¸\Í/©I˜Fñ\Ï˛,\'[b?&	\ÓÛEØ\ÁIıW3(\—\›\Ë\¬vÖé≠iÔã£óæ]U˚Ÿñ\„sŸÑ\Ì+>ˇ\0oïÉ^M8âu®ÆÛ(\–W\÷\Œ”∑\ %≠=Û™\‚¡\⁄˙\ÏÇ2\‹\'πá\›iÏñΩõ\Á\À\‰\‡\◊\‚µ˜#(\–G:òN‘ûT~\⁄Û\ﬂ7≈Ö°u\Œo\‹e\Z\n;•Ñ\ÌKú©Üµõ\‰i\‰◊Üè\‡úøQîhmıñ3¥Øràˇ\0\À˜\¬\“o\Â\—™Ω\ÌôFä◊ø\À	\⁄˙\«\√^{π“è\Á9uWZ\Ó2\›-v±ﬂØ˜~úç#•/\ƒ\ÕY}é…®®)4ñQMº∂t∂n¢ähåSy\Ó\\Æ\‰\Ê©Ãµîçôj\¬uÜS∞\ \·W!ì\nπ+ÑfE¡¨£\ﬁ\„Y\ÈJ\‘[IU)K•gñGá[>òt∂tz¶^\“r›†\0\0\0\0âI%õÿÄ∆±0\‚yı)>\‡>|\Î±V∆ä0ıb\'\\µßoÉ™\…&\”J1m.∂{¥sE9™©svÑ\\´\√E3\ﬂè|,Oˆ§Ωßªx∑\‹\Ên∑ª%ñõ\“OÉàÙRˆ≤o6ªósΩ\ÿ\À\…\ÈWÛªk_®oVªórø\€ˇ\0Lë\‹vï3ö\Îï~Û\Ó\◊VQ†ø⁄ºw•_\Õr\Îúy7\À]W\Ì˜∫C,w•^_Zœñ\ÿ\Ï&˚k›ó€Ø{|≤-\ÔtØ3˝\Ôÿõıøu˚m\ﬂo˜¸-\Ô4ó¡\◊¸π˜~£§¨l€ùauΩ\÷?é\‹2¸m\Â\Í&˝OF_lØ∫#Ω\∆/èÑ]>;&ˇ\0Oj˝≤Æˇ\0\“\À{{¯Ò\ÿN…ìé\’˚d˜˛ó[\‹OèÜ\È\…?y7ˇ\0\Ìeˆ\œ\Ó^\›«èH’óD\Ô&ˇ\0=´ˆ∫{ô#Ω\›zMy™ã˝C´¥˚]\”˙d[\›\·∏Ùåº\’Eg\Î&ˇ\0_Heˆ\À}\“\…\Ó∞|x\ÎüT\"ªåw\Í˙B\∆Õµ\÷Y´\ﬁ\ﬂˆ<V)æ-êè∂$\ﬂn{2çùk\›\»›∂\„x\"∫ª12≤WWTUì≠\«jm\ÏPOÇ/å›ß\‘\◊rºOçVí’´~(\Œ_ô\Ôs0˚m\Ë(\÷\∆\‚¨\Àd(Ñ\‰nMú\›l˘\ƒ:\€:ü)ó≠P\0\0l\r|F\")¡+\"µ§\”i\«4µd¯˙Ä\≈b≠≠∏©pß\Â\’¬û|Ä\Í˙‘Ω8{Äçzæ±?Oˆ\…\’ÙñæÖ+\›|∑v\‚\0£ur_€à˜ÅUÃø∂\Ôx°S˛UΩ≤^\÷5˝˝^S\Íﬂñ∞+´´G—¨†\·´\◊˘=¿Uˇ\0\Î\◊\€p\ry}\r}´\‹º5ú\»z_∞múï~op	o˚_òFvÚ\’\Ÿ .≠öq\÷qjR\’ÿö\À\≈o?QKûr´\ÔÏÑÄ¯M¯±SÉØù}ñ˙\Íˇ\0\ÿ{tQ\Îôˆsˆå˙)èwòftúá•o-O\≈\„¨\Áb!\’~\Á/W9≠\⁄\–F(zI\‰{Ä\0\0¡åY\≈}\ÂyÙ≠tòUA|òØ2˘ÆT0á8ÚÆ\‘\\I‚é¨R\ƒ÷∏lÇ¸Hæ\Z∫1õîıÜ9c\Ë\\7Tø}\Â˙uˆ\ÀΩn?(˘czW∏q4vÚ˝ù≥\«y≥\ﬂ0£\”O¨\—˝»æÚ˝ù≥õ’û¯˘cñú\¬}fØI2\Ó˜;eé˘cæ\Â∫\÷!\Îe›Æˆ¶˝ß\ÔÜ9nãÙÒÏó∏ª≠\ﬁ\÷;˛üΩé[§¡˝7Âó∏ª≠ﬁâ˜\r?s∑MÑ˙OS.\Èw£∏\ÿ\Óbñ\Ípú˜\ÿ]\Œ\ÔD˚ïé™ˇ\0\‰¯gÚ\ﬂ`\›.t>\„c´,t\Â˘âu¶å\'Or96”¨≥?ì*\“{T\‚\◊CL\◊4\ÃqÜ˙k¶®\ÃNQ¯Û\„⁄âÖ\ VëØ\È!\È!É,ıcc.	\'\‘\”&,ìø∆´\Ô?\Îò\\∂ô\ŸWUè‘óy\Á\Ô\‚3\ƒ\·aüëáú˙úßó\ËGøEUKó¥gŒò|gπ\Œ\√\◊˜†£WE\Î}.\"\Èı¨Ú^√ë®ú\◊.\Óñ1nnhz@\0rwU}ï‡ÆùrqíäÒñ∆ìíO.ú≥=\ZJi™ı1S…Ø™™tı\Õ3â\√\Õ%ãπ\›s\Î≤oº\Ôx(Ìèá\«˝[ùÛÛ*;\Ï|3õÎîô|1\—<UO9˘cñ\ﬁΩ{Lò\Ãgä∫´ëvûËåó\"&W\√\0∏FdT6V¿´dT0*¬™»®aUaE&∏]O#XfØdxı∫˝\ÊQ≈ù5\’L\Ê%\Ÿ¿iH\Àcås\\Z±\œ˜<Wt±∆óSOØû¸∫P\∆%¡í<Xub¨˘≤”çÒ\ﬁ\ﬁØi0πo\√õØoÛ?DâÜQ.•ßdz+õ\Ìq˜≤ây~˘xç}%5ûj\’>Yøi\—\“F(rµ”õòˆ|•í\ -Ù3\”3\‰Ò\ƒyΩ\„{\‹7É\—X8Ò∫T\ﬂ\\ûg\Z\‰\Ê©}ò\≈£0l\0\Ã\›-Z¯,Lÿ±ˆ,˚ç˙i\≈\⁄\'\›\Á\’\”\‚±\\{K ì\Õ\'\–}\‚@®dC\nÇ\n∞®aUdVVEC\n´\"™\ŸQ¥\”O&∂¶ÿ´≠5¬∂Mr>S¡©µèT:\⁄˘ÙJı\‚|u∑\‰µ\Î<nñ]*q[a∑\Â˛ô¢]\Ã˘\Ÿˇ\0\Z_ôò\À8óñ\ÓØ\·4Ü*Y\Ï\Œ+©$éïà\≈\‰jg7jq\Ô\€πrèk\»\ŸT\‚%™à\ÕQ\“ZüÖ\√\√,µhÆ9uEi\‚˙\nxCtä\0.Ωz¨è:π«∂-Q8™%çqöf5CÒ#‘èßó\¬\Ãbf\" \nÖC®aU`C\"™*í{Q%aª°™Öòz\Â(ß&≤ì\Âi\Ì-ØU2—®™hπTD˘7~W2&\œ4}Z˙ü´ô\·É\ÍU\’\√÷óë¡àXÆ¨ÒstçiE4í€ì\»\◊\\=VjôôÀû\Õm\ÌΩfVj?&\ƒ\‚˙¯çw)\Ã6⁄™i™&sqöOâ\…?˛Ûπåy>Çö≥o\—v\ÿ}Ø\“\Ãeú;˙6ˇ\0Oí1\Ôf2\Œ[äª^\€gŒ∂\…yúûGJà\≈0\„‹ú\’3\ÓæØ	}ÛÒGÛ¢]úQ,¨Fká\Èj\„îR\‰Iv#ê\Ó¨\0\0\0<f\ÿj\Ÿl9ó\›2≤Yzè¶¢sE3\Ìà\‘\”\·Ω\\{ ÜM(aP¿´\"†aUdT0™∞*»®\n\‹\‹‹æ&Q\Ê]b\Ìy˜ã\∆c›ßY‘â\Î\Íõ\ﬁ@\r{ßû\¬Ke0\”\«\«:\ﬂFL¬Æ\r÷ßCêh{K)\'\»\”\Ïaaµ§ˆZö\‡ìåªQÃª™]\Õ5Y∑\”=±˚_•ö•\Èáb¨F•wœõ\\üdqôeúF^oW\Í:P\‰KΩ∏∫<&ï¿\«,“ª^K¢1o\‹i\‘\Œ(z4ëõè\–\«1\ÿ\0\0\0ë\È\⁄ı1∏∏\Âó«π.©$œ¢\”Nl\—ˇ\0ê\⁄4¯u¥M\œ\n°ÖTÇT0™≤aUaU\"°Ö`çsãñ•\÷¡JZ\ÕE§≥\Ï\Ë5¯qúL\√9™\'*bp∑Ñø\Î7yı_p\≈]“ò∑\Ÿwb~≥?<b«Ø∏\⁄\ÏS\√b~±\€\\X\Õ}ﬂ¶^]ü±ﬂâ{ÒiØö\‰\œ1ö˚øGÇ\◊*h`UÖn\„\ﬁuS>Ö\Êhj#\‘\Í\Ë™\Õ3\n\“ˆ\«\Ìw3\Ã˜∂tù⁄∏,SÂéß§\‘{\ÀDf®Kìä%Òp=\ÊK\Ïw™£_K¡˝\Ÿˆ\ÂÛÕ™üKŸ¢èT\À\‹\Œ{®\0\0\0.›ïz∫F\Ô\ÎÖSıe\‹wt3õ1\Ï˘çØN/\Á¨8ß≠\ @TC\n´P®aUdaP»™≤*¨ä´\nÜV\» *¨+q=l,\◊2Z\ﬁlè.¶<≤˜h™\≈XVó∂?kÙ≥\ƒ\Í¬ª¢∑,\\˚\·\Ã\Â˙L≠G©Æ¸\‚á\ÃV{aœó°\Ô+Nx\Ãeçyz†üKìmzë\‚\’\œCCe\Ï\'ç\–\0\0\0ú\ÔÖ^X\⁄\Â\œ\√åˇ\0s±≥ß\—T{æ{mS\Í¢_2ŒÉàÜEC\nÜYV\n≤*UXU[1UXT2\n∞®dUXT0™≤\r\Õµ[}oµ\ZØFio\”\’\·Æ√ø#≠ã9\Œ\‰4˜O?ä¢<∂Y.Õã\⁄Õñx\ÀN£¯√áYÎáä^´º≠ySå≥ü|\"øv˚N~¶}N¶é1C\”\‚\œ3÷ê\0\0õ\ÂW\„\·\'\À\·´}äK\ÿtˆl˘\’.Ÿß˙tœª\„ô\’|Ú§¬™Ç™¬™»®aUdUYRaU\nÜEUÅVE@V}fV√•\Íø>\√\Zº\·ï3âeQ’í\\ìk\‘\ŒeQâóvâ\Õ1.>\Èl\ŒtÆJ≥}nF\€1≈´Q<\⁄\œD<íı\Õ\È„´£\”˙K¨õ\È€óqÕø9Æ]ç4b\‹=ã\r-\ÌÑ\0\0\0>?|™ˇ\0\”\—>n%/J2Gøg\œı&=úÕ≠Nt˘\È/Ç;óUÖ@»™∞™∂Ç¨*\"™»™≤*¨*UYB°ÖUëP¿FY4˘\ZdWG\Âß\À\„~VsØF*ógKVm\√\Êt\‰Û\ƒ5ÕÖqı-\Á\‘\’\œ$˙ôªìG7±\Óx<<~\r>›ß*\‰\Ê©v≠F(á\Ÿ\·¶`\ÿﬂÉ¿\0Û{\·U≠£¨|\À)üeâwûΩ\‚ı/–ß≈ß≠\Ê¨\Ó>IVUaP¿´\"°ÖUÖUò™¨*VYUaP\»!ÖT*º\Âú ˙\Z¸¨Òjc\œ.ñäØ)á\Ài	\Î_k˛ºª]≈∑¸an˘\’,sÚ_N\√9\·-t\∆já≤ny®\”Ty+äı©\‚\ÓS\¬[Éñ\¬+ßS(\0\0r7]Næé\≈«è\‡ˆIe\À¨ΩÜ\Ì<\‚\Ì\Ó—©ß\≈f∏ˆóìE\Êì\ÂH˙\∆!ÖC\"™¿Ü¬™»™∞®lä´\"™\»!ÖUÖUëP¿´\"†*¨*0≠äg\‚5\»˝©£œ®å\“ı\Ë\Í\≈x\Í˘W=iJ\\\ÈJ]Ø3\Zx7\’\Á2\œZ\ŒUÆ[ Ωdπ8¶K1ö\·\ÎZ&›ât$r›ß\÷h˘\Ï≥K\ÿt\0\01ı\Î\”ly\’Yÿ¥eD‚®ñ5\∆iòxï\ÍG>üZ\ÿ}+\‚f132\"™¬°ëU`U≤*¨äÜEU∞™∞®d\nÜR*EUÖC\ MFys]h\¬\‰fôÜ\ÀUxkâ|\’h\—l∂{n•^}à\◊~qCnö3rë¢n\‡9Œ≥\Ì4]õ¸?\0	\0If≤ƒ±0‘∂\Í\ﬁ\«¨ãOÖ-gó®˙Ksö)üg\∆\Í(ön\’’âô4°ÅVEC\n´\"™»™∞®dUXdTUÖC ´\nÄ®dUX0{}DW\œ\Œ9NKíM~ovs\rå¯¯tFLÛ\Íg\“ıh\„’ó\‹\Ë{v£\¬\È>˚BA¥Ä˙zaí0\0\0\0\‚i}\ \‡qSñ\‘¸&Y9\¬RÉ}ypõ\Ì\Ín[åS>O5\›%´≥ö£\ÕÛÿù\Ì)y¯,v&æE%ˆ3\—B\Á8áñvU©\·2—∑{\\R^&ëÆOíxwZõ6F\—\ÎO\Ì™vE<™˝\ÎJ\Õ¿ixÁïòÙ)\€˚aó¨\Œ6Ö\‚Zgd\’\ a•f\‰t\‘sˇ\0G\\í\„çı\Ì\ÍM\Êg\Z\ÎL\'e]iY°Ù§[\÷—ò≠úqZ\Î\‘eΩZü…Ævu\Ë\‰–π\›îò∏>öd˝Üqzâ¸ö\ÁEv95\Á§*èî\Á∑	\«⁄å¢∏û\¬t˜#å\«\–¯-ánE\À•\\r]_¡8ø:	\·ò\‰ùe Ç``UëP¬™¬°êC\nÄ®`FdW#≠óNL\”TyΩv\Á4¬∏¸+˚)z\œ™xC££é2Ùm\ h\…\ÿ\”\…\Â∞Ú=\œP—ò†:(\0\0\0\0\0\0\0\0\0\0`≥Lº™´ó⁄Ñ_qs)àhb∑5£≠˛&\r.∫\‚e\’%å€¶x√õâ\ﬁ˜Bœá\\~\Ì øc2ã˜#õ±ny9\◊oU¢_ë™\ﬂ,oìˇ\0,\Ã\„Ur9µŒñ\‹Ús\Ìﬁäè\Â\Èd>“Æ\≈\ÏFq¨Ø£\\\Ëm\ÀB\Ì\ÈÒã¯zV/ëYák÷§\Ã\„[=\Z\ÁgP—ø{]5\"¸æy\√⁄å\„[\Z\Áf\«)i]∏ù?ö\—gÿ∫,\Œ5î5\ŒÕû≠¥ôáó¢\ÔÀñ\rK\ÿe\Z™:∞ùü[F\»b°\Â\‡1ëˇ\0Ümzëú_¢yµŒä\‰5g§aìçê\◊iú\\¶yµŒû∏\‰ò\È\n_\—|P\«\ÈW—ëbk.=•\Ã1U\—\Œ“òàk\√nnK$£µ∑ƒí\„4‹òá¶\≈LL>∑qç\ƒ\ﬂ/m6U	Ij´\"\„).\\û\‘sØ\◊OìØ¶∑4S\Êˆ]¢+¢)%\ƒhz0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÅäXjü\ruæ∏≈Å\œ\ƒnoGY¸Ljö\ﬂqîWTpñ3E3\∆\‹F˜\⁄o7£\È_v\ÁR\ÏãFQz∏\Ê\¬l\—<ù-πΩÜ˛ä\ﬂ9A9?\ƒˆò\’]Uqñt\—M<!\‘\’\\Ü,í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?ˇ\Ÿ','AN',6),(21,'test','test','test',0,'098f6bcd4621d373cade4e832627b4f6',1,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ùx\‘˙\0\0AñIDATx\⁄\Ï\›yêù\Èu\ﬂ˜\ﬂÛ\ﬁnth4ˆu0;ò\r≥sÜ©°HéLç∏8rº\»V\‚X,ódπ\"%J\ŸJ\‚r9vï™ú*ßRâúTbW©$;™J˛p§≤\"KEâ4iJ\‹\…Y∏\ÃpVŒÇ¡t˜Ω˜]û\Áú¸Ò\ﬁ€∏∏\”\rÙroﬂã¡˜S\’’É\ÓFwœΩ\Ë>\Á9\œy\Œ\‹]\0\0\‡∆íÒ\0\0@\0\0\0H\0\0\0\0	\0\0\0 \0\0\0$\0\0\0Ä\0\0\0ê\0\0\0\0\0\0\0@\0\0\0H\0\0\0\0	\0\0\0 \0\0\0$\0\0\0Ä\0\0\0ê\0\0\0\0\0\0\0@\0\0\0	\0\0\0 \0\0\0$\0\0\0Ä\0\0\0ê\0\0\0\0\0\0\0@\0\0\0H\0\0\0\0	\0\0\0 \0\0\0$\0\0\0Ä\0\0\0ê\0\0\0\0\0\0\0@\0\0\0H\0\0\0\0	\0\0\0$\0\0\0Ä\0\0\0ê\0\0\0\0\0\0\0@\0\0\0H\0\0\0\0	\0\0\0 \0\0\0$\0\0\0Ä\0\0\0ê\0\0\0\0\0\0\0@\0\0\0H\0\0\0\0	\0\0\0 \0\0\0$\0\0\0ê\0\0\0\0\0\0\0û6±ö˛µø<9\Óˇ?A\“&IeYˆ3!ÑG$\›B\ÿ\œSçµp\…\‰˛ñÀüì\Îª\Ó˛\rwˇú§yIâG£ÙˇM≈ÉÄçI\0\∆¸7ıîÇ>~m\œ˛=?ˆ¯c\⁄pøv\ÌŸ≠-€∑I\…x∂±ÜWû\Õ\œ\Õ\ﬂz˙\‘\È[œú>˝…∑~Ùñ~\›\\!¸Ûî“Øá.H\‚\0Ä≠˙o\n!¸ìΩˆ}\Ê\ÈO?≠õè\›)U˜∏Y®a\Ì∂\Õn”∂Ì≥∫Û\ÿ)d\ ö;ø\Ÿ\œˇ£Øıõ#˝¢ô˝áK1\0$\0¸\Õ\Ïÿéù;~\„ƒè\Ë\ƒÒ\Ó\◊\‘\ÃV)/;yÅ§xñ±\Œ*@œãí¶∑l\÷O~˙i\›s¸\ﬁ#˛\Â?ˇ_x˛Ö_\Õ\Z˙\ÕB…ÉÄ`Çøªﬂæc\Áé\ﬂ¯\ÿ\”Où∏\ÔÒG•º\Ë¨ˆ]nQn&πusk¸ó§ê)t^§Üî\›z\Ïàv\Ó\Ÿ9§ˆ˝\Á_\»&&¬ø}\0H\0Ü\À\Ãf7o\Ÿ¸\ﬂˇ\ÿGü<q\ﬂèI≠\\rì\≈\\eÎºäo®j_P*\‰US\nx¿ö¢ø\¬\‰fMnﬁ°â\ÈYMlŸ©M3‘ò‹¨\‡\“\Ï\ﬁ=z˙/˛‘∂ºùˇ\ÍK/æ˙¸\‘\‘ƒóx\Ã\0ê\0O&\Èâ]ªwˇ\Ì{é\ﬂ\'•,\Ê*.æ•\Ê©\Á[§lB!)Öâiûi¨#€¨T.úV9Jí)dì⁄º˚à∂\Ï;¶â∞M≥\€w\Ëæ\Óª\Ì\ÂæÒ+\Ó˛ıBŒÉ\‡z§\◊\„\Í˚\Ã\Ã\Ã/¯©\◊Ùˆ\Ì™\Œi\ÓG_\’\≈Wæ§T4&¶≤Fg\’O\0PôB\÷P\»&%πZßøØ/˛±ÚsØ\Àô\Ó9~øé?|\Ïâ\"O\ÁÒ@0$\Óæo\€\Ï∂Oπ˜ò\‚˘7u\È\’/´}\ÓUeìS4˝acÇ∆§¨j\Î\“\Î_Q˚≠g¥u«¨\Ó:vÙPJ˙èÄ\Î¡ı∑\‡ö\‹4µ\È∑πCûö∫Ù\⁄W[\ÁîMLÒlbÉ\”\ÁÜ‹£\Ê\ﬂ~^ìS\”⁄ΩgØv\Ô\Ÿzw≥Ÿöi4\Z<@\0®\0êôòöö˛•áΩ_\Õ◊æ•≤yV°±âg£©ÑÜ‹¢N~_\ÈÇæ\Â\Ê˝a\0$\0É\’\»&≤ß\‹€û]õ5˙V˛}ê5Tµ/i¢<•={wNI˜Ú®\0 \Ï\Í\ÁÙÙ\ÊˇÊ©ü˙®.Ω˛\ÌNC0zÆ†MY°mì≠ôêe˜à\0 \‰B+Àû:x\”¡c˚\ÌS˚\‚õ\n°¡3à1˘\◊deS”çB≥;∂›öR\‚\Ï)\0ÄÅ¨∞\Ãg\'\'\'ˇ¡\«>˛Qµ\ﬂy±ûÒO\√?\∆\'PJQ3[7iœû∑ZÚªyL\0ê\0b}\’O:|\”Ò∑\–¸;ﬂó\Z<{+f\“ÃñI\Ì\‹>u[2±\r\0Ä`›´˜MYñ˝w˚¯GîüzI©XP`˘èq˚w*iÛ&\◊\ÃT\‹ìéÒà\0 X\Ô\Í?ÑG:t\‚–≠5ˇˆw\Z4ˇaLˇ±z©m\”\“\Ê≠\”G‹ú®\0H\0÷ô¸\Íü¸Ääso(s¨˛1ÆˇRïb•€∑\È¿Å=∑•în\Â1@∞v˜\Ï›ø\Ôìw\ﬁuª\ÊO>\«\Íc\ÕÃµ}vZªwlæßäzêG\0	¿Zπ~\Â±\'mx~N±}ë\’?\∆<ê∂NKª∑O\Ó\nYˆêú\«\0	¿Z‹±k\«\œ\‹w¸ÕΩı¨BF\Á?\∆\\\»‰±•ù≥ì⁄µw\◊Òî\“\0\„h¨#™ô˝¸Òáé\œL™•r\·úB£!gEÖ±N\0§≤(¥s\«ÿø˜¯Ö3gè7&Ù%\0$\0+∑m\À÷≠ø\ÿè\È\‚[_óBê˝1\Ó\\J\Ê⁄µg≥vmo\ﬁRîz|zZ_\‚ü.\0Äï˚ôª\Ôø˚\‡ñ)\”‹•w\Í•øDqùîºZ\–˛Ω[\'ˆ\Ó\€y¢µp\È∑\Zç\ÏèÄq2∂=\0eˇ´|Ñ.Ω˘º®˚\„˙äˇô\⁄s\ÁuÛ°]∫\„\»\Ì\…\€vÇ\0Äp˜è\‹u\ÏŒªw\ŒN\È\‘o\‘í\0\\Gbä⁄∂\…u\€mvæ¯˝≠?Yï≠\œeY£\Õ#Ä\‡jø<´Ù+\'>¸°\∆\¬\È\‰≈≠?∏˛™\0\r\ÂÛgu\Î\·ªt¯÷õˇ\⁄˜û˝¡\Ô\Œ\Ã\Ës\‰±X√ÇH1¶˚S\‘)\È}\Ó:2eï˛€ø¿\ÔFt~\Âd:\Ÿ\»ÙÉâI}qb¢Òçñ˛∑ÒˇM5æ	Äªﬂπˇ\‡\ﬁ\'ﬂ¥W^¯fg\·\œoM\\?ç\Ìπ3⁄≥\Ô.=Ù\ËCª\ﬂy\Î≠œ¥ö\ﬂn4\ZÙ\‡ö\Ãlk¨\Ï\'™®dAè\ﬂv\ÁM˚o:|xﬂ°õ\Ìû\›>´Ç‹∏ãøp¥piNgœû]x˝ï\◊\ﬁ~˝µ}-À≤íe\ŸK\◊U¿\›~\Ó\·˜=6S^zC±*y^q˝Æ\‹RR˚\“)\›s˜#˙ﬁ≥∑¸\≈o}˝ª_ûù\’ˇN\0À©™x\"V˙π\Ì;∂<r\«w∏˘\Êõ˜:|pr\Î∂mŸ≤E\”[6KìLCE¸RY©,ÚôáO<~Ù˚\ﬂ~ˆ\Ëü~ˆÛè¶ˇn£\—¯\¬ıí\0l\ \€˛≥˜=p_£˘˙ü∞Ú\«ı˝3ŸòP\Î¸ö\›D\'>¸\‰ñS\'\ﬂ˘Œú:˜\‹\‘Ù\ƒyt\–¯?+˝¬±{\Ôx¸˛áé\ﬂr¯ñ\√a\Î÷≠⁄ºy≥≤\È)\…M2Ø{°JFX:	\ÿ4=≠M[∑\ÍÒ;°m€∂\›Û˚ø˚˚ˇ™,\Àˇ§\—h|{\Ï\03˚´èëÉYu^1o\—˜á\Î\\¶™h\Î\“\È\◊tÛë\Ë#\·#{ˇ˜˛ü5\Áõ?;πi\‚%§îÓäïˇè˜?ˆ˛}\–-∑ﬁ¢ôôÖMìı\\iw©äR»§\–\ËºVgqîÒ\0¢áK2)ö&\Z\r\›ˇ\ÿ\√*ä\‚ñ\œ˛¡g3VÒ£Yñù\Î†,\Ï\ÔºˇC\'6µ\Œ|Gfâ\Á\◊Rû5\‘<Û™6\Ô∫Y˜æˇ	ïEÒæ\œ˝˚\œ˝f´\Ÿ˛π\…IíÄz\’_∆øw\‡¶˝ø¯\‡#\›Ò¿\√hÎ∂≠\nY£˙1u~ê<I˘i©<-g%k’ø\Î\Ÿˇ\«b\Ïw©±Eö\‹.Mê6TP¶á>Ñ.^∏\‡7æÚÕøYU\’ˇB(\∆20≥\«\Ô<v˚Ω3õ=\\|Û<´ºw™\0e[s\Ô¸Pªgˆ\Ë¡ù\Ó˛¡?˝£?˘\ÕV≥˝ôâ…âÚ\›p´˛G\ \¬ˇ\ÁGû8˛\Ë\«>˛\‘\ÃÃ∂Ml\⁄Tˇw’Å?6•\‚\ÌN\–?\'Yîº˚b<àx∑8Wˇ{iæ\"m\⁄)mP[ˆ\È\—\'\”s\ﬂy˛\Ôîe˘Ø\«6®*˚\≈\«>æ\Ÿ\‚‹´≤Xr\Ó\Ôù k®u\ÊUMm›≠\Ì∑>§á>t\"4≤\ÏÉ¸\Ô?˜G≠f\Îó&&&˛è\“\r≥\Íˇ\Ÿ€é\‹ˆk?ˆ\–mG\Ô9¶-3[\Î†\ﬂ\r¸\Õ7§\Ê•x±^˘{î,’ï\0©^ˆJˇXÆê$%©8-ù˘“Æ˜i\«¡€µ}«é£ÕÖÊ≠íŒè]`fªw\Ó\⁄˛‘≠∑jÃΩ¸ß2Ç?\ﬁSÇ§†Ko=´…≠;¥e\Ôùz\‡˝\Ô€∂\œ\ﬁ˛{øÛ{ø}˛\Ï‹øööj¸\„\¬E´˜Æ≤åˇ»±;˛˛\'>˝…Ω;˜\ÓRñeRw1\ﬂ˛ë¥¢/IV\Èr4´˝]\”M\n\È¸ü+L\œ\Ë\‡M√©ì\Ô<ñRzNR´ %˚+˜?t|G5˜¶b\Ÿ\Ê\“º.ÉbY\Ë\¬k\ﬂ\‘ƒ¶-\⁄4{Pw\ﬁ}Tø_˛¬égæ˝\Ã/~\ÈÛˇÒØµõ≠_üòú¯\Áíx¿\ﬁc¡øàˇ\Î±˚é~\ÊS?˝©ôŸù\€;oÕ§Úå¸“∑•\ÍRΩ\⁄_\‹\‹gÉH<*úˇ™fg&ïeçõbåç±K\0b\‘\œ\‹˜¿˝[Û≥ﬂê•\»ÛÜ˜\Ë\œc¶|˛ºNΩE\Ì;˙§¶∂\Ô\◊\÷\Ÿmz\‚\…õé\ﬁs\Ï¿s\ﬂ~\Êıœæˆ_yÒo≥,˚øCü\ÁAª˛E¸\Ì\„\›˚WÚSOO\Œ\Ó\‹\ﬁYı\'˘•\ÔHØH^-ΩÇ\÷-ì ãö‘§$\ﬂ÷≥ó4	@J\È˛\€\Ó<|tJÕ∞ê/tVˇ¸‡ΩõÛ\Áu˙Ö/j\ﬂ\—ijvø\Z\n⁄≥wè>¸\‘G6Ωˇ\«N\Ï{Ò˚/~\Êª\ﬂy˛?\Ì\’\◊\ÊRJ/I\‚H\Ãı¯Tá\‡e\ÔxÙ}|\Í?—òôù≠¯\≈I˘ÖoIqA\Ã:¡FTb~IÚTÙøgÙ	@Ùø˛¿\√\Ì\Ãœø¶Tïå˛≈çQ	X8Ø∑ü˝#\ÌæÛ˝⁄∂ˇNÖ,Sñe⁄ºy≥x¯Å\∆Òáé7 ¢ú>\Ó¸^3∫æØ≥¿Ø¨ë\Èü˝º6MOÖè>˝1\’¡?ì\œOö˚ûdl\‘?HUEK\Ó>Øpepu\Ã\√\'nπy\ÔtÒˆ´≤î˙+¿{T¶+ΩÛ˝/®u\·M\Ìæ˝QMNo[ !Moû÷°√á¯Å∏\Œ¯\Êi}\È˜?´\ÈÕõı—ü¸®fw\Óî\Ã\‰ø)-º\‘\È\‘\Êi\≈∆©¢À•<håÄî“ÉwΩ}oZxß^˝\ÀY¸„Ü´ÃΩÛ≤\ÊOø¶7›£ù7ﬂß\∆\‰ÖHÜØGSõÙ\¬7æ£ã.\Ë…è˛ò∂\Ô\ﬁ-Uï¸\¬W•\÷\‚F°¨í‰∫§\À\ÁN\∆ à˛Òªéô-.æ©\ ˇ∏qWçñt\ÓG\œ\Í¸\ﬂ\’Ãûõ5ªˇà∂\Ï<XOÜ\√ıë\À5\Zö?uF˙\Ÿ?\—|øv\ÿ/\≈\\~\Ó\ÀR˛´~å\Ë¶TV.ØOçM seO\‹73£ã•,9+\‹\‡2πª\ÊNøÆπSØJYCõ6\◊Wøbê\ŸV˝Kqπ\”∆Ωo˜æø\Áã\”W≠\“\ƒDC_¸\Í\À:rÙA\›ˇ\‡Éí\'˘\Ÿ?\'¯c\‰™\Ër˜|lÄ”Ω∑π\Ìˆ\–>%´\ +∫Ä;aØáø∏´j2h•ÃóéıWt˜≈âª÷ô¿◊Ωd\œ:\ÔKv˘ø≠\Á˝n™∑)•\≈˜u5\ZAoº}Q3ªo\’:°©≠\”Ú\”ˇQ\ \ﬂ\Êâ¡\»°TïI>FÄ˝ìwΩsW\’|S^U=7\\¿ˇãIA__ˆ=\ﬁ{_$%w5 ©ùGù>_\ÈÒè>§\Ì˚˜Kßˇº≥\Á/Vˇy0v[\0\Êzd\«Lc&\ÀMë≥ˇ\0\÷ÿóY˝˜æ\œ›Ø\Ó\Í˛©s˚n≤+Wˇı≠º.∑\ÀTã\'3É\‘“õ\'\ÁÙ\‡cè\È\ŒcG•K?î/ºRw˚3\∆c†™L\Ójˆ\Ô&éÆ \Ë†\Â\Á§T1˙¿pÄæ}˚\ﬁU}wµoÊãÅ\ﬁ\\≤\‰≤NêO\ﬁ˘{vy€†æ©ºÛY3iÆYhbzV˜?Úà¶∑ö¸\Õg§‘î\¬$O∆°\0†*ö\\\ﬁ}\Ìë%\0!S\Ì\'µiK˜ï$\0¿`ÇˇR	@w•Øû$ ˘\Â %\…\‰W¨¸´\ÍV.˜∏§\‡Aß\œ6u\Ô#«µwˇ\È\Ã7§\Í¢&xb0:=-rU\Zó\n@P™*eæi\…Êù´˛¿/˚\0$\ÔN\0∫\Âˇ\≈ \ﬁ]Õõwö˛.W\0zˇú¨Û∫ÛE∫UÅÆ</µi\Àvª\Ô~M5N\À[o]^v£_¸À´$\Ôµ˙\ﬂ?1Úo\Œ}U[\0\ﬁW\“s=M=d¿\r∑¿Òwá[[¸˝\“\rˆﬁìÙ\Ï˜w∫˝c7\–\'\ÔTz∂˚B]E\ËlÑê\È\‘\Èy\›ˇ\»c⁄∑oãt\·[íµ)˝c¨2Ä™¥z\À\ÂQˆ\0,ˇ\’&\0&\…\ÕMä\…ÍΩº\Ó\—ûr\‡\∆Z˝_•\"pπÉ\ﬂ˚∫˛{V˘=+{\ÎI\0í]Æt´\…/L)*zC∑\‹~á6Oùóü?£1π`XTFóªö˝˜\0åº∞ñ†˚C[%WïÍåΩåR\Ï¸\‡∏±É˜ﬁ∑ˇø∏ﬂõ\0®ã•~Û+Kˇn2ùè\Ì|ûN5†9∑†æ_∑\ﬂ:+]¸Ådïî±˙\«8U\0BßPπ\∆m¿˝Ú`é\'\0V˚*∫.µ]ØΩS®ŸúØxH\0\0øºX\ËØ\\q\n@óè\∆Nw∑\Ÿo©JAΩ}PoÑ\––éÕÆ#w›©m[õÚSß\Â4˛a\‹\‚ø:cÄ]Aa\‹*\0íõ\…}\Â\r3\ÊuPV¶3*}\„\ÕY=ˆÅø\ƒa\0W.,\‘\€g\‘=XØ\‡MV˜≥˙m)Y˝\⁄LfVˇŸº≥ê\ÍˇNu∂`aB˘≈∑t\ÎMÖn=4#µﬂë[î≤M4%c\Ïtz\0∆Ø øbº\Êµ~®ªÄ*πäJjµπ\Î	˝Ú?˛-ûe\0+%•(UURJQUU©™*\≈*™¨JUe©£bä™\ JU¨cîõ+Ln\’øÙ:<ÒúvlOÚπw8ˆá±U∆•\«\0è<\Ë\Ì ΩfF\ﬂ˘¯\ÎíF^π⁄ïî\Áπ$©\›nÛL7\‹jﬂó|õuFıô\ŸbüQΩ≤OWº\ƒXˇ\ÓÎ™™Tñ•RJãoÔæ§îd&ïEKó\ﬁ~F\›Ôöú\ÃeUKjLÒd`<ì›∫†=VÄ† ˜∫¸\Õ¿.\ÔÕïQ\ S´0µW—à*™§ππ9ûiÄ\‡ø¯{\0\Îîˆ{ìÄ\ﬁ\‡^vV¸Ω\…@\Ô\Î\Ó\ﬂ1M\Í\¬\Î_◊°Æ;n\Ÿ%ÕΩ)5X˝cLÖ\ÓMÄjç]†€ë{≠†¸´Xó˛+ìÚR\ KW1u\·¬º\Ê.]\‚\…H\0ﬁïÙ\'\0ΩΩw\Â\ﬂMñ˙s˝Ò¶\ 3ÕΩÛÇ>Vi\«\ÓÜ¸\‹\Œ˝c¨ïï\…\Õ\Á4n=\0¶&\0&U\Ê*í4\◊r}Áï∂\ﬁ9ù\Î\‰9©9ı≤˛ˇùZ\\õ\n\‹\»¡ø˚ˆ\¬Gå{_RJãØª’Ä\„ˇ\›_!\Ë&Ur5¨≠;ß\ŒÍñÉ≥\n~IÊÅ°\Î@YπLjé]@\Íd\Ê+\ÿH\—UU“•f•\◊\Áw\Ëì\ÎóT\ƒ$k\ÃË¶É˚\„Nûk\‡Oz+\0Ω{ˇ˝=\0ΩïÄ\Ó\nøªÚ\Ô˛˘ä˝ˇ5©ˆ[_\◊\Õ7I7\ﬁ%ÕΩ(e\rûås¸WMíèWÄB˝Ì¨®–π®#FW^F\Ì›ªO?˚ˇÄ\'¿íIA\‡\Ô¸ﬁ†\ﬂ\€ÙW≈íØ´™RQu˘øä∫æß;∑5=dß\⁄Rcöc-&óL-ç\›ÄØ| ô:£%K±˛\Îî\Áz˜\Ï∫%>Æn\Ã\n@\Ô˛ˇ’öˇ∫æõt7\Ëwã¢êy¶÷πW¥øqA∑ﬂºCjüf\Ô\◊G†J2i\Ã\Óê\Í\⁄˛ä~\»\Î\Ï\Óò\Œ\≈I_fã?∏f¶vªΩxÑá\0∏±Ç\Ô\€V\“˝\ﬂ\r¸KU∫I@7Q(-SÛ\Ì\Ô\È¯ùM∏\Â6˘\ŸW(ˇ\„∫PT&ó\ÊCXg`ê!ıÚuú\◊\·ª¯qvy$g∑Pñ•\ﬁz\Î-}Òã_Tû\Á\‡O\n˙\ÔI)-æ\ÓO˙˜˚˚˜˛\Îa@¶\‡ï\Ó\⁄rRw‹≤Oç–îYí2éˇa\‹+\0A1∫\‹<_\Í›´˚<\‡¿\‰ãWn^\ÎÀ∫º˛¯Œü$-f\È\'Oû‘ô3gÙS?ıS<\·¿\r^\Ëo\0\\ÆÒØªm\ÿ-˚˜ñ˛ª´ˇ™™T¶ÜZ\'ü\—]˚:z\‰êt\È.˝¡u£™Lr5•1™\0Hıïæ\Ê\◊N\0∫∑t’∑p]˛¯™™î\ÁπÚ<◊æ}˚Ù¯\„èÛl\Ë¸ﬁ∞w\Ô\Î\›\◊\Ô˛\Ó\Ôêvª≠¢(ˇ\\\'•ZÌ∂™î\È\Ó€∑kÛl&;9\'\œ6Ò\0\„:®\0tÆñ\÷Ä∏\‡vy\–\’å\‘[˛\Ô\‹\—\›M\0∫=\01÷çÅeYÚ§7h†w\Ôø{ﬁø7\Ë]\È˜\'\0˝/eY™à\“¸\…ËÄΩÆcwïZo\À9¯è\Î™\‡rWs©ÛFñ\0òK\—\\)π\“5>o2\’◊πΩ´n\‘?\–˝˚}\0n¨\‡\ﬂ?ßwøøˇ¨7)\Ë&›ÖD˜øcå*\ Jy´•F\Î5\›}tªˆﬁ¥KvÚ˘˙\‚⁄åp]¸ê\\æ\r0,ë¨*H¸Güº\Íeº<hπO;cÄc\Í$\r\Ê*´¥¯\€;Õã\n\0pcØ˛ó´\0t˜¸{è¸uˇª˜mãoØ\\≠s/\ÎêˇP˜\ﬂˇae\ÂY•π¯\◊UìIıe@\ÎL\0lp\ﬂV2©®§â∆µO\ƒT_TE©Lu?@Q\‰WîÒz˜ı\0\‹x´ˇ\ﬁ†ø∞ˇÇünâø,\À≈Ωˇ¢(\‘jµ\ÍD†åZò;ß≠\Âz¸—ª¥\Á\‡\Ÿ\…gh˛\√u#I—ªˇ∂\Ó†\Z`uΩ≤†2∫&™ÀïÖ\Â∂\Íd°sPÂ™í©\’j©\›n+\œÛ\≈$†\Ÿl™\’jÒ\Ã7\‡\Íø˜øª«Å˚g˚˜ØˆÀ≤\\\‹Û\Ô&y^(\œ\€\ \ﬂ˛öé\ÏxC}\‡o)¥^íUsR\∆\Í◊èXô‹Ω\‘2ˆU%\0yπ∫=Ä,t≤êeíâv\ÁÛ-n-,Û\È£KE\·jóRÉ™î¥0ø∞ª?ºÛÛÛj6õ<\Î¿{4\Ëw˜1{Ä˛˘ˇ˝g˝ª=\0Ω7˝ı¸Yl¸k∑U∆®ºàjü˙ænŒæßßû˛¥65\n•K/\◊{ˇ¿uSıMÄÆIi\›	¿ûm+\Ô~\Õ2\È¸Çk>ó&≤:\Ëç\Ô1I\Õ“ï§\≈\È~æÃßO©Æ\0¥K©]ôJ3]ºtQÛÛÛZX®Åvª≠Kó.ë\0\07\–\Í%\◊ˇˆ˚\È&\0Ω\”ˇä¢P^*À§\Í¸¥?ˇí~\‚O\Í\Ê£w\»\Œ=+UX˝\„˙´\0DìªÚÅT\0\Z\Ÿj≤i\Á÷†\›3\“\€]smi2\”\‚’ô…§V\ÓJ©Æ\0\\\ÌÑA2©àR^\÷/Öô.\\8Øã/™\Ÿl.VŒü?\œ\0p˛˛∑/ó\0t\ÀˇÀç\0\Ón\‰ù3ˇ~\ÓY\›û—ß>ıa\›˝\Ë˚ö\'es˛¡uXêT%ìª/9h\’	¿\Í~X/o\Ïü\r:¥Cz˘î´ô\◊’Åd\“|.—Øh.\\\Íg‹ºfêWR´ê\nO:w\Óú.\\∏†V´•ÖÖµZ-ù;wN\Ìvõgxè˛\¬Ugˇ˜ˇ•∂˙/ª|@TMe\ÎÇv4ø¶o5=˛Åè\Îé{\ÔSV6es?îbã\0\◊ePvf\0lx\–\–ù-Ä£Éû{\√u±\Â\nAZ»•âÜ/y@\Ôœ∫y\›3P\ƒz€†mQßOü\—\‹\≈:\‡\œ\Õ\Õi~~^gŒú!\0nêïˇµÄ\ﬁcÄu\"p9®bRYEy˚¥∂,<´õ\ZßÙ—è>Æ\«?¯∏&\'\', öØ»õØ0Û◊≠\Œ¿Ç¬àÄﬁÄníéöl}ıe\”≈ñ/&\0\ﬁ˘òw˝®{ΩE\–=\n∏êK-3ù9{NÛsUÖ.\Œ-®π\–“©3\ÁT\‰\ﬁc)¿íøO\Í◊∂ò,y@O +\Œ\»-*Tsö¨\Œjªù\“ÕªÉˇ£∫ˇÅOkz\À5\Z\rIA\ﬁ|C~\·Y)Ù\Ï[\◊Y†(].oJa¥	@o5 ⁄ΩkF€¶\']€¶§\ÈMR#¨ÙW@CÆãj|\ÔüjJı%AÉK3Rˆ¸¥Ö	]\0˙~s∏§˝˚˜©\—»¥c\Á\ÌﬂøW∑y\\TÇ≤,[¸%\Â≠7dÁæ¢z…íÒ\‚∫\Õ\0R]hÖA4Æ/\—AI?mfs€Æ\›¸•áoù:x\ËÄˆ\Ï›´}ˆijj\”@~\‘\…\’,˝[(t^I!ÀÆ¸\ÂI\÷|Uv\·€í\'~õ\‡∫W¶\—ˆ\0dívô\Ÿ\ﬂ›±s\«/\ﬂ}\ﬂ\›;x¯¡lﬂÅ}\nY¶\‡æ¸†\0\0\ÿ(q^\È\¬3Ú÷è§\– ¯\„ΩP\0PQ$π˚úFp\n`JÚøΩmv\€?∫\ÔÅ˚ˆ}\‡\«Nhf\«ˆ˙P_F\0ß{\Óÿ•Úíl\ÓEY˚\ÕŒ™ø¡E?x\œ¸3èu`0s\0V±\Íø\›Lˇ\À\›˜˚\‰”üzZ≥{vKU\’	˛Aãw\À{~`àø\ÀKıÔõ¥ /.\ Û\”Ú\ÍB\ÁwR`’è˜\\†ä&ó6§\‡\Ó\r3;±ˇ\‡ÅˇÛ±˜?v\Ô◊¶≠[\Î[|§NÜ\ÌÚÚíº8#/.JqN^\ÕIVÒÑÿòﬂåRßIìﬁª™\ \Â\Ó˘\–\0w\œR≤è\ﬂ~\‰∂Ò\·ß~¸m∑\ﬂV∑¸\«(\…\‰Âúºı¶¨˘∫T\Õ]˛Aù\Ã;4x∂\0\0Hûªx¿•a\'\0!%;q\Àm7ˇOˇ\ƒ\«∏˝v©,\ÍíúóÕΩ$õY≤≤™A∞\0`∏Ä∏ß\0\ 2\Ÿ`\ﬂ?}Ú#æ\Á¿\·\√RUJ±-õI6˜)ı(M\∆i\0∞!b}@[aHMÄfæ%Ñ\∆ﬂª\„\Ë∫˝\ÿ]uIøuF\È¬∑\‰˘;ıö~\0\06Nê™\ $W3•\‡ûô˘_ø˜¯\›?ˇ¡è|Xç©I˘\≈We\Áø%Ø.I\Ÿ&û\0\0F†ä.ìñõ∏Æÿ™Jw\Ï›∑˚3?ˆë\'5ªø¸¸ã≤≥_ï\«yÇ?\0\0#¨\0tö\0õ\À}»ö\0wüÃ≤∆ßo?r\ÁâC∑\‹,?ˇC•ã\œ\ Sª.˚\0Äëâ\—%˜\÷r\Ô_s§Æ™t\◊\·õ˝èüxø§y\≈sﬂë™KR6≈£\0¿(•\≈IÄ\’`+\0Æ†êΩˇ¶[oy`\œ\·›≤\”ﬂëÚ3R6ÕÉ\0¿Ö Y4I\Ó\nK7\0ÆπêR⁄ø{\œ\ŒOΩ˚.©˘#•˘W•∞âëæ\0\0åÅ¢JrWªÆ∞PEøg\Ôæ˝O\›z\În˘\Ÿ\Ô◊Åüã}\0\0É\n@P¨á\0µ\¬UÆ∑Zu\‡\Ó\Ÿ\ƒ\‰\ƒ}ª˜\Ï‹∂iSS±˘\Á¸\0#1vÜ\0i˘-ÄU\'\0f∂gÁÆù∫\Â¶Y\È‚ãåı\0`ú*\0™\Ô\‡s[˛&¿µ%\0\…\œnü˝\‡M˚∂\»N’≥˝\0¿\ÿd\0e4ô\‘\‘ {\0í\È¿Ùd<<ª≠RJ\∆\r\0¿\ÿU\0L&o¨\‡\Ó\Ÿ\‰¶\…€∂o\rR<#´\0\0\∆-à\—$WKÉj4Û≠[g∂€ªwV\ \Á\Ë¸\0`\‹\‚\ÁÄô∑9`fr\"⁄∫9Hƒ©\0\0\∆O}Ä\œÖı\0Ñ yäy]c\0\0\0\„ó\0\ƒ≈ãÄ\”§h16´2ó≤åG\0Äq\‘t\’9\0´\›àfû«ò\Í∂ˆ\0\0\0/\ﬁ§Åä\Êﬁ™*c\0\0Ä±¨\0ïïK\ÓT%ÛfïX˙\00Æ™h2◊º\◊íôÚù\n\0\0\0cYê™\Ëø ∫{;&\0\0\0\„©\”\–\nap	Äõyã\n\0\0\0„´≥0¿cÄA≤§=\0\0\0å©TT.wüª⁄á≠˛2 ˜Våú\0\0`\\•\À\«\0óµ\Í\€|\‹U§NÄ:\0\0\0\„\∆\Î8ù¥ )&s):w\00F\Íâ˝.só§4\– ïfÆì˚\0\0\0åS\n†≤J2ì\È*\rÄ\“\Z∂\0$≈îc\‘D#˚\0\0\0åQ†äíª∑^êTπ{£±˛\0`\Ãƒ™\”\0Æ^X˝@\›–éâY\0\0\0åU@RôØp ®2S+F\'˛\00f@¨g\0¥§W\0T_	\Ã,\0\0\0∆±PO\\\Z¯@à\Êı\0ß\0\0\0£ \≈˙\"†!l\‘Ä\"&*\0\0\0åõX˜\0\‰\Z¯1¿†òL\Õ*\÷\‰ \0\0\„Rê\ \Ë◊ºhMÄ ïfﬁå)1	\0Ä1SU©æ(~ ôyQ%d\0\0∆™\0∞8\Ë\⁄[\0k<\Ë≠Xô%\0\0\0∆´Mn\ﬁ\n\nW]™Øi∞ªÚîºn\0†	\0\0ÄÒ®\0xPJ&ó\⁄◊ä\–k\È®¢y≥ä\∆#\r\0¿Xe\0RYö\Ã|NRh††\Ë\Ê≠\0¿∏\ÈÙ\0c@à\…U$£\0\0¿∏U\0™îd\√§d©[†\0\0¿8I—ª∑∂@íÃº\Õ1@\0\0∆Ø\–s¿UÄUüA2S´\Í\\\ƒ!\0\0\0\∆\'®*óπ/d◊®“Ø≠\‡\ﬁNë\–\0¿∏U\0b}L?ø÷áÆ)pyï\ÃY˛\00F<πíª‰™Üí\0Ö\ \ÃUO\‰\0`\‰ãˇ \≈z\n†tÕ£zk¸:e2˜=‘ç\0î\0\0q\n†≤tôy©k\Ã\0X{ (öYô\0\0\0∆¶êLíZCK\0$E3\Âù/\0\0\∆@L&w\ÂA\◊\ﬁXkPô©£îQ\0\0`\‰≤ \≈\ e\Ê\◊º\Ê \≈dﬁéâ˚\0\0\0Urπ©©p\Ì`\ÕMÄf÷™íI\nr\Œ\00Z!®¨L\Ê\ﬁ\‘5n\\{@Å\0\0\0\∆LL&soØ (&Wû˜\00&\0\≈\‰r©≠!6ñf÷åë\n\0\0\0„¢¨Lf>Øl¨© H\—\ÃÛ≠\Ó§\0\0Ä\—V\0TOî\rs@\Ëtq\0\0ÄÒ£\À\‹\€+9∞éA@^$sz\0\0\0á\n@™¢\À\\Õ†0§9\0Rï\Ã[1:\Î\0\0∆¶`Ú˙\‡õ\0ì7´d\Ï\0\0\00\0Ie4\Ÿ\n{\0&\÷¯U¢πäî\Í\Ó?z\0\0-u@ß0¨-ÄÕΩì1\0\0Ä1©\0D3ô´≠!\ﬁ\Ë)yªJÙ\0\0\00@PUπ\‹\’\·\⁄\≈˘µT2o\'.\0`l*\0UL2˜πï|¸ZO\ËÚ\0\0\00@Jíõ\⁄+˘µ\ﬁ(˜z†õ\”\0¿àôπ™hry±íÚ|∂\ÊØ\Õ\ÍlÉ>@\0\0F∏¯Rä.Ø\‰i%g\Õ	@P(ìπ\Í+Å\…\0\0\0a\n†*ö\Ã\\A!Æ\‰od\Î¯je2O12\0ÄQW\0™∫\–V–äÄâµ5E7/ì˘\Ê¨h\0\0`D\\RLV_¥Ç1¿\Î™\0©Jùa@\0\0\0a@Rï\\\Ó+ºÆ@ReI\ÌòD\0\0\0£L\0:cÄÕºÜ\ﬂ®2π∑\0\0\0FÆæ	PMICn™,yì+\–\0¿+\0°Æ\0∏7VVòX\«◊´ÃºH\—\Í\Ó∫\0\0\rØõ\0\›Uhcö\0’™\0¿à+\0RUπÃº)©\Zj†JK÷äïÒ\»\00bUe2˜˘0ÙÄ∫\⁄P$c\0\0#Ø\0$óõZZ\·¿ö{\0ÇT%Ûv4óãA@\0\0åä+(¶$s\Â\Z˙Ä†\Ë\ÓEJ\Œ1@\0\0F\\à\—\Â´8∞û&¿\"%o\∆h\0`\ƒb\Í\n\“P\œ\‡q\0`§Ä*ö¨4Ù-Ä\ \Ãs3*\0\0\0å4\ËT\0Vs¿:ö\0C2ÛºäÆ¿  \0\0F\«C∑ ◊∞IR2o•\ËL\0`\ƒ%Ä*öÃ¥∞“™¸z∂\0d\…[1Ò\0Ä\ B\Á2 Û\ÊJCÚzN\»\‰E4\…)ˇ\002\Óù\0y±“ø3±æØ®2ô\À\Ãi\0\0`D¢πíª\\*W\\5X\Á◊¨\Ã\\)1\0ÄQ°≥˙Ø[ˇ\“Jˇ\ﬁ˙Ä†\"%WïLú\0`$)Ä™*\…‹ìVx–∫Ä†\Õ<öq\0\0ÄQU\0íInjÖç©\0Ñ†*ô\Â)\Z\Î\0\0F≤˛ØGÛöY{•˜\0H\ÎmîJ3µcÚô)âa@\0\0å@¨LVO‹ò-\0IU™\0*\0\0\0åH’ù∞A=\0AeJñ\«D\0\0\0£ê\’˚Ò\›\n¿ÜmD3/í’µv\0\0\0\ÿX.)%ìô\Á⁄®cÄA™\Ã=Oâ\–\0¿(Ñ •$πkUMÄ\ÎúÚòº#ÉÄ\0\0ï≤û0§jcÄz`\ÕxÙ\0Q†ä.3oj\„)ö\’[\0T\0\0\0I\n†d.sm\\ÄÇ*3uö\0\…\0\0\0E \∆$wﬂ∏A@A*ìY;v\'\“\0¿\∆r)Fó\Ÿ\∆*RR+%\0\0FRPù\0‘ÉÄ¬äÄâu~\’*%o\«d¢\0\0\0¿\n\0°æ ≠r\–zo¨ÃΩL\…i\0\0`$Ä†ò\\\Óûk∑\0î\ÃÛd\‹\0\0¿à2\0\≈˙@{5mΩw(%oVw\0\00¢¯Ø™2ô˘\‹jBÒ∫+\0f^ö±\0\0¿\»*\0\—\Â\Ó≈ÜU\0$…•º.=\–\0¿F3s%sy=h\„\0\’\„ÄE\0\0Ä\r^¸\…LrwÖUú\0ê\÷∞ÇT§‰äï-ñ\0\0¿Ü§\0™ §\Œiºj53¿\◊.ìπ\◊\'®\0\0∞ëÄò$sïZ\≈¿AU\0*3/ì˘Tò¢\0\0Äç·í¢Y}¿*∑\0\–ädﬁéâY\0\0\0lh@ı@3oáUV\0÷ù\0Ñ†\“:√Ä\»\0\0\0\ÿ\ÿ†™∑\0Z\ﬂ ï)y^E*\0\0\0lx†\‘\“*.\ZL@*ìynf<\0\0ld\Í{\0ÃΩµ\·[\0\näó/¢\0\0¿FJ\…d¶ñ6<êä\’Nâ\0\0\06∂ •\À7n¸ †h÷ä\—\ÍÄcÄ\0\0lL¸w©¨L)˘Ç¬ÜoÑ\ \\•ë\0Ä\rM\0ÇS}@¡ †2%\À+39\0\0\06å+(ô\…F3H•%oß\‰\n4\0∞q\0I1÷ÉÄ4ÇS\0e2\œSb\Ì\0¿Fg\0ı1@µ6º†û†ºÆ\0\\\0\0∞ëÄ*∫Ãº4ÇIÄf^$\0∞\·@J&wµ7~`ê\’	\0s\0\0\0\ÿ\ÿ¯M2Û\\´\Ï\√\ƒmÄJ\…\€1í\0\0∞\—Ä˙.\0kÆˆØN\‚ã\'≥˙:`ú\0`£\‚øwØV≥\—\ÿ\‡ H2Si&ˇ\0\ÿ8.)%…•bµ7\–˜PöπÃ∏\0Ä\rY˝©{µ\ \0K\0BPëí)ô\”\0\0¿∆§\0™í\…‹§U\Zd è\Ê™/\"\0\0`#*\01∫\ÃdaÑÄ\ L…®\0\0\0∞aR=∞X\Ì¿AV\0™dV0\0Ä\r™\0®dfπ÷∞01ò\Ô\"îñ\‘NI[W\0∞!bí\Ã\‘\“\Z∂\0í\0©®+\0&Öå\0\0Ä\r®\0\ƒ*\…Ãõ!å(Pù\0\‰±s\0\·\0Ä\·ÚN^=8å¶†Û=ıYD∫\0\0ÿê\n@rô{K#<X&Û2W\0∞Qíπ\‹=£J\0Çîß\‰≠\»)\0\0\06¶–ùê\÷\÷8ò\n@PôíT\0\0\0ÿ†@ùãÄ‹õ\n£J\0*3g\0\0\0ò$s%˜\"Hi$	@êÚ\‰û\'.\0`\√2Ä\ŒU¿mçj@g O\—\ÍtÄB\0\0\0\√.\0(U.3okTì\0ÉT¶dyJ.\00|.©äV\·]\0EJ £â&@\0\06®\–Fv\n†2˜\ :ì\0\0¿3Äd&w/4∫9\0A\…<Oâ&@\0\06&˛á˙:\‡∫`\’UPJﬁå…ô\0¿F$\0°\”`>øñ\Ì˜AîôW\∆1@\0\06L2óπä\—U\0$π+ØgÛÑ\0\00l\Ó.´\„\Óh\0Iïôãa@\0\0WR2\…\Í\”wq-ücbÄ\ﬂL;%Wäù\0ï\0\0\0Ü¶™L\…\\í ë&\0íähÆhÆ,9\0\0\0√©\0(®™O\0TZ\√`iê[\0Aïôfú\0\0`\»ÄR}`;Ñ\'\0A*c\ÁJ`\0\00\‘¯Ødíõ\÷4h∞\0©0\„F@\0\06\"à—î\Ã[kM\0\ÿÚî<O…§¿ï@\0\0≥\Î!@Õ∞\∆&¿AV\0\ d^&£\0\0Äag\0\…\\…ΩPÒ@®\Á\0î\\\0¿∞\„PJ&7ok\r7∂îßdÌîú;Å\0≤d.3\Â\ZyÄî\«\‰\Ìò\\r1\0Ä!™\Í&¿1\Ë°4Si\0`¯Ä\‰2˜∂F=@RU7:;\0\0\0Q=¿eÊÖ§4\“ Hy2\œ=Ä\0\09ä\…\ÂÆVÉQ¿Öôñ\ÿ\0\0`\ËÄ˙.Ä∂4˙Q¿EJû\'3ˆ\0\0\0jì)ôçE@\Ÿ\Ì` \0\0Cåˇ^_\‰Æ<¨q¿\0G\À\ÍA@uÙ\Á \0\0\√\·r%Sw¿ö\"\Ó¿\0Ö†îº#w\0\00\‘\n@\Ë\Œ∞\ÊDcm\≈¸Aˆ\0(&Àç\€\0\0zêí\…L\Ìµ~äâA~?n*ìπúIÄ\0\0ç{}\n¿›ãµ~él¿\ﬂSôLb \0\0\√c…î\Í`[Æıs4AyJÆîåiÄ\0\0ARL.3)Ñµù\0F†H\…TO$\0\0`\‡	ÄÇRí\Ã›µ\∆!@“Ä{\0T$Ûî\Ã\Zç\‰4\0\00PæXb=	¿`∑\0:√ÄÃå\0\0\0C©\0H\…Lfûá†q\ŸıÖ@â\'\0Äae\01πÃïKä\„Q*,\’\”\0)\0\0\00ú\n@LÆdﬁî¥\ÊcÄ˛æäh^Dsπò\0\0¿†y\Á\03/¬∏4\÷\0+R21\0Ä¡ó\0\Í)Äûº≠1:X¶§“ô\0¿p\‚ø$3)π\nçMÄî\'˜<πãI@\0\0GL&7oÜuLÄêßdyä.q\0\0\0CJ\0\\—º≠Ò9®*&Uı$@\0\00¨†s–ö∑\0\€(\Â\÷D \0\0\‰≤˙@;å\’(\‡\‰E¥: ¸\00X§hR2\Â\ZõcÄRû\ÃKN\0\0ÄaT\0<(Fìπ∑\∆\‰:`IE2\œÕô\0¿p2Ä˙†ôZ\„t\n†2Û™æà\0\0\0É\ÁJfr˜R\nkæ}g\–[\0J\ÊE2v\0\0\0ñd^7Æc\ÊŒ†õ\0ï¢\Á)πÇ\”\0¿0\ƒ\ËJ\ÊìkO\0=	Pf^Ä\0\0ä∫\⁄n2S{=üg\–MÄrWa\…\Â,ˇ\08˜∫	P\Î8(\r˛:`)®ä\ÊJF\0\0¿@ClêJ3•˙“ΩÒJ\0Ç‘å—îR}ê\›\0\0\0\«*óô+¨cÄ4Ñ-\0ïı˘D\"?\0\0É\r±°{ ç]@ı0†*π&\0\0``\Í1¿.sœ•ıU\0Ü∞äî<O\…&\'\Zôú=\0\0\0&%ì%!¨˝&¿\·T\0Ç\⁄…¨\‰>\0\0\0b]≤\‰J\Ê≠ıV\0\ﬁ§<%\Ó\0\0`ãlEs%˜∂\∆k@\›Ä\Œ1@é\008ù!@EXg\‡\‡+\0AE2/\Ã\\î\0\0\0pê\\fû+å\ﬂ)Ä\“L•=\0\0\0Z\Á®}°ÒZ1y;s\0àˇ\0\0.\ \∆dJ¶fêäÒ™\0ïf^y\Í.ˇI\0\0WJ.˜Ò\‹(Ãº\\H¸\0`@k\Ï\≈-ÄRZ\ﬂÄ\·\Ï4∫\0\0\‡˙ø3	\–\‘\„6	PAEL^\÷\«\0)\0\0\00\»UvJÆ4û£Äïõyaf\n§\0\0\00∆∫,ôÃ¨≠u\ﬁ8Òkyr∞\ﬂ\\πôó\…\Í?s\0\0\0\‚ã[\0EPXu`o\ÃœÜ\ÌY4Ø∫c\0\0\0¿¿J\0J.π{°uÜŸâ°|sQy2Sl\0\00∏\ÎJ—ïLÕâ\∆˙>\◊0z\0TOÏºÅ¯\0¿¿¢l}Ä∑\’X\ﬂIªa\Ãêπïf.7\‚?\0\0É\‚.ôπ\‹\◊\◊\08¥@™\Ô\‡  \0\0ÉZ˚wotIcö\0Ñ\⁄1\’\„\nÉ8	\0\0¿ 2\0K.sW\„[h•\‰J\\\0¿¿Ds•§ÅT\0ÜqP°\ﬁ∞\≈F@\0\0∞\ﬁÿ™dÆT\ﬂ0∂Ä<πó.õùyÄ\0\0`=@\Ë4\0z\÷y\‡\–Äî[Ú“í¶M\0\0\0¨ó\◊=\0\Ó •0∂ÄvLûß\‰≥>I¸\0`:\rˆ-I≈òV\0Bëíó…ª\«\0\…\0\0\0X_p]\Ï(¬∏6J ìyiV\0\0\Îéˇ2sô+W\ÎA@äfu˘ü-\0\0\0\÷\«oÙRR\À\n@jEÛ\‹\ÃE	\0\0Ä¡î\0,Ifj)\◊\n@nÊ•πwR\0\0`ùÒø;\nx|∑\0ÇT,\ﬁH¸\0`˝\\2ì\ÃUHc:@Ay4/ìq\0\0äˇı(`Û<åÒ$¿¢ª@	\0\0Ä¨≠C˜Ä\Á\Z\„ª\0rK^∫πMÄ\0\0$∫öπ‹î+å\Î$¿Úh*\«\0\0\ÔL\–¿\–ntÛ“â¸\0\0,∏öInjk\0s\0Ü\’\‡â\0\0\0Zpwô{∞ø>¨S\0JIÖ•\Œ \‚?\0\0\Î≠.U…ïL≠\…D\Ôa\ÕêôW\Ê\0`0\Îˇ\ﬁS\0\„Zê\‰Æ\"Y]Æ \0\0`Ωq\’\ÂıÄΩjü/\⁄w\ZT§zf1\0\0XWH≠O\0\ƒ˙éùbüsbà\ﬂo+\’{›ä\0\0\0Xcê¨^T\r&»Ü¯Ω∂ìπë\0Äu≥˙\" ì\÷?h∏ÄÚT\œò\‚J`\0\0÷µ®ñyßp\07ªPö)\“\0\0¿˙É™\’[\0e\–`ö\0á\Ÿ\–N\…KKæUç@\0\0\0k\‰.u\Z\Î\€\Z˚Ä†Vr/L.∂\0\0\0XO (π)\’7é˝)Ä\¬\Ã+3\Ê\0\0\0∞^f.3/Bˇ-Ä\"ô™\ÓmÄl\0\0∞6Æ˙†ª\ni¸õ\0s3ïıôEˆ\0\0\0X_@2ÛÅ%\0C<®VJVò[\'œ†\0\0¿\Z’≤dJI≠ µ«∫†\ŒÄ°\0ÄıpóíK./5\Ó=\0A*¨ì\0tøy\0\0∞6ù9\0Ö\∆}@°ù\ÃJì)p)0\0\0Îà©ı(\‡d^Ö±?ò\'S\È\∆)\0\0\0\÷\„äA@a\Ã)®ùz∂\0\0\0¿⁄•z@˚z∏\r∞\ƒ\“\0Äı\≈\‘ ôK\Ê*u\‹\Õ\ÎA@!\–\0\0¿z∏ª\‹Tv\Z\Î\∆7Aä…ãdN\0\0\0\Îä˛RLÆ\‰ﬁû\»3\\oòs\0d\…Kß\0\0Äı\«T[º\rp &f7/ˇÖ\ÊÛz%ø\ÊoV*\Õ)˛\0∞\Ó†éß\Â†>\ﬂƒØ6-˘éù[É~˛\«3µ™˙Ç\Ê\ZíÅ†ê\'˜zﬂÇ4\0\0Ä5I^\ﬂô\0º|zπ¿\Ï∫\–t%ì\Ó˙Ãìô.µ•V±™D†ùíÀí+P	\0\0`\’Bê,π\Ã\\\Z\–@\È\ZMÄ\›\‰\‡G\Á]\'/∫\Ô\n˙\œNd:=∑\¬$ ®m©.[Ñ 2\0\0\0÷†≥ˇØA\r∫f\–˚Ö_;\ÎzÛºk≤!˝çd∫–íÚÚ\Íâ@ê\⁄\…<∫k\"p#0\0\0kí\\J¶*hÉÄÆh“ó^0Ωp\“u\ÏP\–_y_¶≥ÛWMädäfu¿Q@\0\0V\'t+\0æ≤ãÄ‹•-õ§,`\–Mﬁæ\Ë:3\Ôj\Èß\Àtnπ$ (wÛ\ ‹¶¢\0\0¿Z2\03óõó∫J†ª4=)\Õnñ˛∑œôN^Ù¡&\0]UíæSêÙü>û\ÈB≥~[∏Ú{n∆§\¬\\\€h\0\0`míI\…\‘\nA≠\ÂÇˇûm“ø¯|\“\Á\\Z◊Æ∫Øk`L\“\Á`˙⁄´¶˜ﬂô\Èì’Ω=I@a\Óâ\»\0¿ö\0rwô˚ª\ÓpIì\ri\«\È_~>\Èπ7\\∂¬òª\ÓQ¿1IóZ“ü|œîe\“O\œ4◊ôSB}%p≤˙õ§\0\0Ä\’Ò∫Pf*‘≥\‡ívmï~\ÎKI?8\ÈjZqH–õ|ˆ9S#HO›ói>Ø+\0…ºr\"?\0\0kfó+\0ã	¿é-\“ˇı\Â§oΩ\Ê´\n¸]Ω ôÙœö˛¯ª¶≠Sí§¶%ï\\	\0¿\ZÖ KíôZ!Ñ∂T7˙˝ˆüôæˆ\ ⁄Çˇ@+\0ãYäIå)ìÙ°£Y;π™\Ó7G\Z\0\0¿\Z\ÿ^\‹6•Úwæe˙\ KV\ﬂ\r∞é¿:î\ÎÄ›•ˇ\Ô;&ó\ O?öE∑NÙ\'\0\0`ïAUrsm›§\‚_5_˛\·`Ç\È ÄÆ<¿ïGS\≈\0\0\0kgùIÄÓäÉ˙ú\ÎI\0\¬\n>¢m\Êe\›H\0\0¿™Émgêπ∑Bﬁâß\·\›uÇ\·&\0a\Ôw7\Â1©J\Êrq\Z\0\0Ä’©è∫bR\Óæ\Ï]\0aµ\…¿JÄ∞¶∑u\Ê\0∏ãA¿\0\0¨+	P)-n\\-\‡áï$+I\0\¬U˛ÆÚ6´¢bïº”©H\0\0Ä\’7©™TVIe\'\Œf\Àx\Ôã«æñ`π¿\ﬂˇ:\Î˘s\Ô˚\¬B°™Ux4sô•˙.c\0\0∞bfA\ÊÆVÈ±å\Óí&˚|˜µ/±˙_6	òXC\Ô}\È\r˛ΩCÖ2Iç∑/zyn°ûh\…eâ\'\0ÄU%\0°>¯\Œ%\œ\œ.\\ª˝*/\·ZI¿J∑\0˙~\÷Û\Á˛\n¿\‚ü_?\Î:y\—-	\0\0\0´\Âí&Ç\‘ÆóNy|˚Ç´SpI\÷Ù≠Û¢ï$\◊X˝áeV˝Ω/AR£\Ô˝ã_$U)I)π[\0\0\0¨Xêì\ÀM\ +Où7míî˙Çæ˜\ƒ\ﬁ˛∑-ôL¨0¯7˙˛ª—ì\04zﬁüı%\03A:üófe\Ã2ûJ\0\0Vó\0î&ï\'Ö0/˘\ÊN`ù$ ı¸˛^ºtµ$\‡Z=\0˝I@\÷Ûz¢\'¯7˙™›Ñ`WıÚÖ?7≥\Ÿ˜njhÕó\0\0p£idRªî.∂¸\ÌîÙ¶§\Ÿ%Ä§˙x`\Ô\">u\‚±iMÄK5˛Ö%{Cı˛C7ò\Ë˘\Ô˛èõ~˘å?ˇ\“)s\Ôv\ﬂ;1\’9\Œ¿s\n\0¿5óˇ¡§V!Ωp“ü˚¢ø(i{\œ\Íæ¯ª¡øwLpˇ©\0ıWñ\ÎXjœø7¯Oˆ$ì=â@oE`B\“\ƒ+ß|˛ô\◊\Ì[G˜\Î˛\È]a2À®\0\0∞í\’YI\Ê\’¸\∆+ˆï7\Œ˚Ç§mù@\ﬂ\r˛Ω\€\Ó˝¡ø˜e1/UX*\Ëo¯õ\Ï{\Ÿ‘ìLÙ¸w\÷Û˛\Ÿ\Áﬁ¥/\Ÿ\ÿ6\ﬁ7ªπ˛\‰$\0\0,-ı¿óöÚoæjü˚\·;ˆI{;º¸´æ˚r¡\ﬂ˚*\0uÇ\—\Ï{_˜Æ˙≥æ\0\ﬂ¯ß;ˇ=µ\ƒ\Î\È\Œ\À\ÏB.ùô\◊¸\÷i\‹3£]Y}πÅ\ÿ\0\0\‡äï∑$%ì.∂§Øº\Ï_˝∑ﬂ∂ˇ\ÁùK∫ i≥Æ\Ï≥[n\ÂoK˛\Õ\Ëü\◊{‘Ø∑ºø©\'\Ë≠Ù&\›D`Êµ≥~\·wøa_òkeˆ\Ëm\·é˝≥jLN\‘YN∏+\0\0pcKıºïQ:5Øˆ7_ÛØ}ˆ9˚ù∑/˙Iª:+˛ÜÆ,˝˜˝\‘ßMóõ\0É\ﬁ= ,5\ﬁ7ÙdΩ\r~Ω´˚Õù◊Ωo\Î\Ì\Ëˇ\ÿ-íf$5f¶µ˚æõ≤{º9æsüv\Ï\ÿ¶∂mærå \0\07siæê_l˘¸K\Ô\Ë\‰so˘3œΩi\÷\Ãu°Éª≈ûˇ.%ùóºÛRˆºTù§†“ªái•	¿dO¿\Ô-\Ôwˇ{ìﬁΩ=0’ì\0l\Ó$\0[ªI\¬ˆ\Õ\⁄}ÛÆl\Ô\ÃfmŸºI[(\0\0nWî\ÍC}\€oôW∫\‘,tˆısˆ¬•ñ\ﬁ\È|l\’\Ã˚_zÉ\Ô\Î¢\'	\ËˆX_∞\‚ÀÄ2-?	∞ˇò`\ÔÎ¨ØÙê:	\¬ƒ•∂öóﬁ≤ñ\ﬁ\›¡H\"\0\0xØ~ıˇ\ﬁ}\ﬁÛRu\Ã›ï~£\'Äw_íñûÃª\‚x:±ÇÄVæ•æ`\ÔûD\Í¸ètLóè6H\0\0\07X\–]˜é\Ï\Õt\Â(\ﬂ˛˙Y_¸]W‹ú–ª¨¥tqµc\÷Svht2ö\Ó«îù*@\ÔAÇ?\0\‡F¨t…Ωe˝ﬁí˜˝˝\›˝∂L^Up≠@\ﬂˇ˚K›óF\ÁuX\‚Ûƒæ*¿D_\'\0\0‹àUÄ\ﬁxZ\ÈÚ˘˛\ÿ˜í˙”ï˜\0Ùæ¯2_oE	@ˇ_\Ó¯±gu\ﬂ\Ë)KÙl\Ô«î∫r¢\‡R”ã˙/,\0\0\‡ΩÙ\√Òµø–ø∏NK\ƒ\ﬁ\Í*IB2∞¶\n@/\Î[\ÂwøÅlâ\‡\ﬂ¯{Ùˇwvç@O\0\0x/%\0ÀΩΩw\Â\ﬁ_e\◊I¿R\'b\ﬂ\«Y_\ÔM8ñL\0º\Ô/Ù\ﬁ-\‹;w8\Î\–\›˜˜\Œ\rK¨Ùó\⁄\Ô~\0¿\rò¯Øó\⁄\Á\Ô\ﬂ&\Ë\Ô®˙™\0iâ*¿ªæˆD\œ;\¬´˛˛ ,¸µD_\Óh+}\0\0Æ]∏Z\Ô]\ÔV@\√`\\\"q∏\Êu¿˝_º\ƒ`7XW}g∫Ú&¿âû†ø‘π\ƒﬁø\À\0@\0¿çÃñâèΩ\€Ω¡ºwïøT\”`o`π\”z\À&\0Ω¡\ﬂ˙Çw\Í˚∏\ﬁ˝Ü\Ójø?\Ë]\Â≥\⁄\0`eUÅ•*I\Ô\ﬁ\ÔØÙ\Ó˝ˇtï\’ˇª&ˆn¯U≤ì\ﬁo¶∑)∞\€\‰W]%â\0\0\0\◊˛\À%\0¶´ü\Ë˝ò´\Œ	òXfı\ﬂ˚g”ï\€Ke#Kç^\Íà\0\0Xy2\‡+Hñ\ÍX.¯/{\n`©d†[\Í_.	\Ë\r˙“ªO	ê\0\0∞∂J@?@ˇëA\◊\“\«]Àü:∏j@^*h˜6Ûıñ¯≥æ˜_kﬂü$\0\0Äkıı%˝Ú\Â\∆ÛØ*∏Z\–\Ï3]yë¡’Ç?I\0\0\0+˛˝o\ÔØÙ&W¸K~\Ó\’\ﬁÆRêÆ=\‰á\0\0Äı\'\0KΩ}\≈¡•Å8¨°:@\–\0`∞\…¿µ.˘YQ\‡_KP\Îxâ\0\0\0kØ¨6\»_Ûz\‡µc<\0\0\◊GÇ0¥`M∞\0`ºìÇ\r	\‡$\0\0åa¿W¿vwJ\0\0n0\‹\∆\0\0	\0\0\0 \0\0\0$\0\0\0Ä\0¯ˇ€≠\0\0\0ÄA˛\÷˜¯ä\"\0\0\0\0\0@\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0\0@\0\0Äô\0¸\≈}<\‚B+\–\0\0\0\0IENDÆB`Ç','AN',6),(22,'eee2','eee2','eee2',0,'d2f2297d6e829cd3493aa7de4416a18f',2,'ˇ\ÿˇ\‡\0JFIF\0\0\0\0\0\0ˇ\€\0Ñ\0	\r\r\r\r\r( \Z%!1!%)+...383,7(-.+\n\n\n\r-+-+---+--+----+-------++-++++-+-++-++------------7ˇ¿\0\0\·\0\·\0ˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\0F\0\0\n\0\0\0\0\0!1AQRaqë¡\"2Åí°±\—#BDSTrsÇ¢\¬\·3Cbì≤$cÉ\√tˇ\ƒ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\00\0\0\0\0\0\0\01AQR!\"aëB°2#bÅq±\·ˇ\⁄\0\0\0?\0˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\nπ\≈p\…/:.%3\n<EkÜ\»zQ\Ëû(\Í\«=!áè\rı.π\ƒ\ -\◊<ín\—jÜ¶Y•™3{ë\⁄eÙnv\À\r\‚\◊||∑\„$\“i¶û\‘\÷\‘\ÕM\…\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|^¯{£ª\r\‡\Ë¢Zì∂2ú\Ï^T`ûIGë∑ûﬁÉﬂ¢±My™Æ\Êm\rUvÒES<\ﬁu-%àñ◊àπøºüº\ÍEG\„$‹π?î¸ èc\·≤\«\◊9>Û8à\Ë\√\≈WY˘cîÛ\·yı\Ì.S\‚£këxaV\Ãr\ÀO\‹6ù\¬’£\Îé#T$•fQú“îcÆÚG#Uj∫Æ\Ã\”KΩ°øE\"+™#ã≥f\Ï4Z˘\ÂO\Ï∑/a¢4\◊{^ô\÷Xè\Œz\'N\·1Z\ﬁ\Ë\Õ\« é\’%”ì\‚0Æ\’T(\√m´\‘\\å\—9tçm†\0\0\0\0\0-∂0ãî§£≥ro$ëb&|°&b#2\Â\œt˙9p\„(Ù\”6˝ù≤\”:õ1˘\√Z\Õ\Ÿ\Ë\»¸\Í/©I˜Fñ\Ï˛,\'[b?&	\ÓÛEØ\ÁIıW3(\—\›\Ë\¬vÖé≠iÔã£óæ]U˚Ÿñ\„sŸÑ\Ì+>ˇ\0oïÉ^M8âu®ÆÛ(\–W\÷\Œ”∑\ %≠=Û™\‚¡\⁄˙\ÏÇ2\‹\'πá\›iÏñΩõ\Á\À\‰\‡\◊\‚µ˜#(\–G:òN‘ûT~\⁄Û\ﬂ7≈Ö°u\Œo\‹e\Z\n;•Ñ\ÌKú©Üµõ\‰i\‰◊Üè\‡úøQîhmıñ3¥Øràˇ\0\À˜\¬\“o\Â\—™Ω\ÌôFä◊ø\À	\⁄˙\«\√^{π“è\Á9uWZ\Ó2\›-v±ﬂØ˜~úç#•/\ƒ\ÕY}é…®®)4ñQMº∂t∂n¢ähåSy\Ó\\Æ\‰\Ê©Ãµîçôj\¬uÜS∞\ \·W!ì\nπ+ÑfE¡¨£\ﬁ\„Y\ÈJ\‘[IU)K•gñGá[>òt∂tz¶^\“r›†\0\0\0\0âI%õÿÄ∆±0\‚yı)>\‡>|\Î±V∆ä0ıb\'\\µßoÉ™\…&\”J1m.∂{¥sE9™©svÑ\\´\√E3\ﬂè|,Oˆ§Ωßªx∑\‹\Ên∑ª%ñõ\“OÉàÙRˆ≤o6ªósΩ\ÿ\À\…\ÈWÛªk_®oVªórø\€ˇ\0Lë\‹vï3ö\Îï~Û\Ó\◊VQ†ø⁄ºw•_\Õr\Îúy7\À]W\Ì˜∫C,w•^_Zœñ\ÿ\Ï&˚k›ó€Ø{|≤-\ÔtØ3˝\Ôÿõıøu˚m\ﬂo˜¸-\Ô4ó¡\◊¸π˜~£§¨l€ùauΩ\÷?é\‹2¸m\Â\Í&˝OF_lØ∫#Ω\∆/èÑ]>;&ˇ\0Oj˝≤Æˇ\0\“\À{{¯Ò\ÿN…ìé\’˚d˜˛ó[\‹OèÜ\È\…?y7ˇ\0\Ìeˆ\œ\Ó^\›«èH’óD\Ô&ˇ\0=´ˆ∫{ô#Ω\›zMy™ã˝C´¥˚]\”˙d[\›\·∏Ùåº\’Eg\Î&ˇ\0_Heˆ\À}\“\…\Ó∞|x\ÎüT\"ªåw\Í˙B\∆Õµ\÷Y´\ﬁ\ﬂˆ<V)æ-êè∂$\ﬂn{2çùk\›\»›∂\„x\"∫ª12≤WWTUì≠\«jm\ÏPOÇ/å›ß\‘\◊rºOçVí’´~(\Œ_ô\Ôs0˚m\Ë(\÷\∆\‚¨\Àd(Ñ\‰nMú\›l˘\ƒ:\€:ü)ó≠P\0\0l\r|F\")¡+\"µ§\”i\«4µd¯˙Ä\≈b≠≠∏©pß\Â\’¬û|Ä\Í˙‘Ω8{Äçzæ±?Oˆ\…\’ÙñæÖ+\›|∑v\‚\0£ur_€à˜ÅUÃø∂\Ôx°S˛UΩ≤^\÷5˝˝^S\Íﬂñ∞+´´G—¨†\·´\◊˘=¿Uˇ\0\Î\◊\€p\ry}\r}´\‹º5ú\»z_∞múï~op	o˚_òFvÚ\’\Ÿ .≠öq\÷qjR\’ÿö\À\≈o?QKûr´\ÔÏÑÄ¯M¯±SÉØù}ñ˙\Íˇ\0\ÿ{tQ\Îôˆsˆå˙)èwòftúá•o-O\≈\„¨\Áb!\’~\Á/W9≠\⁄\–F(zI\‰{Ä\0\0¡åY\≈}\ÂyÙ≠tòUA|òØ2˘ÆT0á8ÚÆ\‘\\I‚é¨R\ƒ÷∏lÇ¸Hæ\Z∫1õîıÜ9c\Ë\\7Tø}\Â˙uˆ\ÀΩn?(˘czW∏q4vÚ˝ù≥\«y≥\ﬂ0£\”O¨\—˝»æÚ˝ù≥õ’û¯˘cñú\¬}fØI2\Ó˜;eé˘cæ\Â∫\÷!\Îe›Æˆ¶˝ß\ÔÜ9nãÙÒÏó∏ª≠\ﬁ\÷;˛üΩé[§¡˝7Âó∏ª≠ﬁâ˜\r?s∑MÑ˙OS.\Èw£∏\ÿ\Óbñ\Ípú˜\ÿ]\Œ\ÔD˚ïé™ˇ\0\‰¯gÚ\ﬂ`\›.t>\„c´,t\Â˘âu¶å\'Or96”¨≥?ì*\“{T\‚\◊CL\◊4\ÃqÜ˙k¶®\ÃNQ¯Û\„⁄âÖ\ VëØ\È!\È!É,ıcc.	\'\‘\”&,ìø∆´\Ô?\Îò\\∂ô\ŸWUè‘óy\Á\Ô\‚3\ƒ\·aüëáú˙úßó\ËGøEUKó¥gŒò|gπ\Œ\√\◊˜†£WE\Î}.\"\Èı¨Ú^√ë®ú\◊.\Óñ1nnhz@\0rwU}ï‡ÆùrqíäÒñ∆ìíO.ú≥=\ZJi™ı1S…Ø™™tı\Õ3â\√\Õ%ãπ\›s\Î≤oº\Ôx(Ìèá\«˝[ùÛÛ*;\Ï|3õÎîô|1\—<UO9˘cñ\ﬁΩ{Lò\Ãgä∫´ëvûËåó\"&W\√\0∏FdT6V¿´dT0*¬™»®aUaE&∏]O#XfØdxı∫˝\ÊQ≈ù5\’L\Ê%\Ÿ¿iH\Àcås\\Z±\œ˜<Wt±∆óSOØû¸∫P\∆%¡í<Xub¨˘≤”çÒ\ﬁ\ﬁØi0πo\√õØoÛ?DâÜQ.•ßdz+õ\Ìq˜≤ây~˘xç}%5ûj\’>Yøi\—\“F(rµ”õòˆ|•í\ -Ù3\”3\‰Ò\ƒyΩ\„{\‹7É\—X8Ò∫T\ﬂ\\ûg\Z\‰\Ê©}ò\≈£0l\0\Ã\›-Z¯,Lÿ±ˆ,˚ç˙i\≈\⁄\'\›\Á\’\”\‚±\\{K ì\Õ\'\–}\‚@®dC\nÇ\n∞®aUdVVEC\n´\"™\ŸQ¥\”O&∂¶ÿ´≠5¬∂Mr>S¡©µèT:\⁄˘ÙJı\‚|u∑\‰µ\Î<nñ]*q[a∑\Â˛ô¢]\Ã˘\Ÿˇ\0\Z_ôò\À8óñ\ÓØ\·4Ü*Y\Ï\Œ+©$éïà\≈\‰jg7jq\Ô\€πrèk\»\ŸT\‚%™à\ÕQ\“ZüÖ\√\√,µhÆ9uEi\‚˙\nxCtä\0.Ωz¨è:π«∂-Q8™%çqöf5CÒ#‘èßó\¬\Ãbf\" \nÖC®aU`C\"™*í{Q%aª°™Öòz\Â(ß&≤ì\Âi\Ì-ØU2—®™hπTD˘7~W2&\œ4}Z˙ü´ô\·É\ÍU\’\√÷óë¡àXÆ¨ÒstçiE4í€ì\»\◊\\=VjôôÀû\Õm\ÌΩfVj?&\ƒ\‚˙¯çw)\Ã6⁄™i™&sqöOâ\…?˛Ûπåy>Çö≥o\—v\ÿ}Ø\“\Ãeú;˙6ˇ\0Oí1\Ôf2\Œ[äª^\€gŒ∂\…yúûGJà\≈0\„‹ú\’3\ÓæØ	}ÛÒGÛ¢]úQ,¨Fká\Èj\„îR\‰Iv#ê\Ó¨\0\0\0<f\ÿj\Ÿl9ó\›2≤Yzè¶¢sE3\Ìà\‘\”\·Ω\\{ ÜM(aP¿´\"†aUdT0™∞*»®\n\‹\‹‹æ&Q\Ê]b\Ìy˜ã\∆c›ßY‘â\Î\Íõ\ﬁ@\r{ßû\¬Ke0\”\«\«:\ﬂFL¬Æ\r÷ßCêh{K)\'\»\”\Ïaaµ§ˆZö\‡ìåªQÃª™]\Õ5Y∑\”=±˚_•ö•\Èáb¨F•wœõ\\üdqôeúF^oW\Í:P\‰KΩ∏∫<&ï¿\«,“ª^K¢1o\‹i\‘\Œ(z4ëõè\–\«1\ÿ\0\0\0ë\È\⁄ı1∏∏\Âó«π.©$œ¢\”Nl\—ˇ\0ê\⁄4¯u¥M\œ\n°ÖTÇT0™≤aUaU\"°Ö`çsãñ•\÷¡JZ\ÕE§≥\Ï\Ë5¯qúL\√9™\'*bp∑Ñø\Î7yı_p\≈]“ò∑\Ÿwb~≥?<b«Ø∏\⁄\ÏS\√b~±\€\\X\Õ}ﬂ¶^]ü±ﬂâ{ÒiØö\‰\œ1ö˚øGÇ\◊*h`UÖn\„\ﬁuS>Ö\Êhj#\‘\Í\Ë™\Õ3\n\“ˆ\«\Ìw3\Ã˜∂tù⁄∏,SÂéß§\‘{\ÀDf®Kìä%Òp=\ÊK\Ïw™£_K¡˝\Ÿˆ\ÂÛÕ™üKŸ¢èT\À\‹\Œ{®\0\0\0.›ïz∫F\Ô\ÎÖSıe\‹wt3õ1\Ï˘çØN/\Á¨8ß≠\ @TC\n´P®aUdaP»™≤*¨ä´\nÜV\» *¨+q=l,\◊2Z\ﬁlè.¶<≤˜h™\≈XVó∂?kÙ≥\ƒ\Í¬ª¢∑,\\˚\·\Ã\Â˙L≠G©Æ¸\‚á\ÃV{aœó°\Ô+Nx\Ãeçyz†üKìmzë\‚\’\œCCe\Ï\'ç\–\0\0\0ú\ÔÖ^X\⁄\Â\œ\√åˇ\0s±≥ß\—T{æ{mS\Í¢_2ŒÉàÜEC\nÜYV\n≤*UXU[1UXT2\n∞®dUXT0™≤\r\Õµ[}oµ\ZØFio\”\’\·Æ√ø#≠ã9\Œ\‰4˜O?ä¢<∂Y.Õã\⁄Õñx\ÀN£¯√áYÎáä^´º≠ySå≥ü|\"øv˚N~¶}N¶é1C\”\‚\œ3÷ê\0\0õ\ÂW\„\·\'\À\·´}äK\ÿtˆl˘\’.Ÿß˙tœª\„ô\’|Ú§¬™Ç™¬™»®aUdUYRaU\nÜEUÅVE@V}fV√•\Íø>\√\Zº\·ï3âeQ’í\\ìk\‘\ŒeQâóvâ\Õ1.>\Èl\ŒtÆJ≥}nF\€1≈´Q<\⁄\œD<íı\Õ\È„´£\”˙K¨õ\È€óqÕø9Æ]ç4b\‹=ã\r-\ÌÑ\0\0\0>?|™ˇ\0\”\—>n%/J2Gøg\œı&=úÕ≠Nt˘\È/Ç;óUÖ@»™∞™∂Ç¨*\"™»™≤*¨*UYB°ÖUëP¿FY4˘\ZdWG\Âß\À\„~VsØF*ógKVm\√\Êt\‰Û\ƒ5ÕÖqı-\Á\‘\’\œ$˙ôªìG7±\Óx<<~\r>›ß*\‰\Ê©v≠F(á\Ÿ\·¶`\ÿﬂÉ¿\0Û{\·U≠£¨|\À)üeâwûΩ\‚ı/–ß≈ß≠\Ê¨\Ó>IVUaP¿´\"°ÖUÖUò™¨*VYUaP\»!ÖT*º\Âú ˙\Z¸¨Òjc\œ.ñäØ)á\Ài	\Î_k˛ºª]≈∑¸an˘\’,sÚ_N\√9\·-t\∆já≤ny®\”Ty+äı©\‚\ÓS\¬[Éñ\¬+ßS(\0\0r7]Næé\≈«è\‡ˆIe\À¨ΩÜ\Ì<\‚\Ì\Ó—©ß\≈f∏ˆóìE\Êì\ÂH˙\∆!ÖC\"™¿Ü¬™»™∞®lä´\"™\»!ÖUÖUëP¿´\"†*¨*0≠äg\‚5\»˝©£œ®å\“ı\Ë\Í\≈x\Í˘W=iJ\\\ÈJ]Ø3\Zx7\’\Á2\œZ\ŒUÆ[ Ωdπ8¶K1ö\·\ÎZ&›ât$r›ß\÷h˘\Ï≥K\ÿt\0\01ı\Î\”ly\’Yÿ¥eD‚®ñ5\∆iòxï\ÍG>üZ\ÿ}+\‚f132\"™¬°ëU`U≤*¨äÜEU∞™∞®d\nÜR*EUÖC\ MFys]h\¬\‰fôÜ\ÀUxkâ|\’h\—l∂{n•^}à\◊~qCnö3rë¢n\‡9Œ≥\Ì4]õ¸?\0	\0If≤ƒ±0‘∂\Í\ﬁ\«¨ãOÖ-gó®˙Ksö)üg\∆\Í(ön\’’âô4°ÅVEC\n´\"™»™∞®dUXdTUÖC ´\nÄ®dUX0{}DW\œ\Œ9NKíM~ovs\rå¯¯tFLÛ\Íg\“ıh\„’ó\‹\Ë{v£\¬\È>˚BA¥Ä˙zaí0\0\0\0\‚i}\ \‡qSñ\‘¸&Y9\¬RÉ}ypõ\Ì\Ín[åS>O5\›%´≥ö£\ÕÛÿù\Ì)y¯,v&æE%ˆ3\—B\Á8áñvU©\·2—∑{\\R^&ëÆOíxwZõ6F\—\ÎO\Ì™vE<™˝\ÎJ\Õ¿ixÁïòÙ)\€˚aó¨\Œ6Ö\‚Zgd\’\ a•f\‰t\‘sˇ\0G\\í\„çı\Ì\ÍM\Êg\Z\ÎL\'e]iY°Ù§[\÷—ò≠úqZ\Î\‘eΩZü…Ævu\Ë\‰–π\›îò∏>öd˝Üqzâ¸ö\ÁEv95\Á§*èî\Á∑	\«⁄å¢∏û\¬t˜#å\«\–¯-ánE\À•\\r]_¡8ø:	\·ò\‰ùe Ç``UëP¬™¬°êC\nÄ®`FdW#≠óNL\”TyΩv\Á4¬∏¸+˚)z\œ™xC££é2Ùm\ h\…\ÿ\”\…\Â∞Ú=\œP—ò†:(\0\0\0\0\0\0\0\0\0\0`≥Lº™´ó⁄Ñ_qs)àhb∑5£≠˛&\r.∫\‚e\’%å€¶x√õâ\ﬁ˜Bœá\\~\Ì øc2ã˜#õ±ny9\◊oU¢_ë™\ﬂ,oìˇ\0,\Ã\„Ur9µŒñ\‹Ús\Ìﬁäè\Â\Èd>“Æ\≈\ÏFq¨Ø£\\\Ëm\ÀB\Ì\ÈÒã¯zV/ëYák÷§\Ã\„[=\Z\ÁgP—ø{]5\"¸æy\√⁄å\„[\Z\Áf\«)i]∏ù?ö\—gÿ∫,\Œ5î5\ŒÕû≠¥ôáó¢\ÔÀñ\rK\ÿe\Z™:∞ùü[F\»b°\Â\‡1ëˇ\0Ümzëú_¢yµŒä\‰5g§aìçê\◊iú\\¶yµŒû∏\‰ò\È\n_\—|P\«\ÈW—ëbk.=•\Ã1U\—\Œ“òàk\√nnK$£µ∑ƒí\„4‹òá¶\≈LL>∑qç\ƒ\ﬂ/m6U	Ij´\"\„).\\û\‘sØ\◊OìØ¶∑4S\Êˆ]¢+¢)%\ƒhz0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÅäXjü\ruæ∏≈Å\œ\ƒnoGY¸Ljö\ﬂqîWTpñ3E3\∆\‹F˜\⁄o7£\È_v\ÁR\ÏãFQz∏\Ê\¬l\—<ù-πΩÜ˛ä\ﬂ9A9?\ƒˆò\’]Uqñt\—M<!\‘\’\\Ü,í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?ˇ\Ÿ','AC',6);
/*!40000 ALTER TABLE `sisusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_reparacion`
--

DROP TABLE IF EXISTS `solicitud_reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud_reparacion` (
  `id_solicitud` int(100) NOT NULL AUTO_INCREMENT,
  `numero` int(100) DEFAULT NULL,
  `id_tipo` int(10) DEFAULT NULL,
  `nivel` int(10) DEFAULT NULL,
  `solicitante` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `f_solicitado` datetime NOT NULL,
  `f_sugerido` date NOT NULL,
  `hora_sug` time NOT NULL,
  `id_equipo` int(10) NOT NULL,
  `correctivo` int(10) DEFAULT NULL,
  `causa` varchar(255) CHARACTER SET latin1 NOT NULL,
  `observaciones` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `estado` varchar(2) CHARACTER SET latin1 NOT NULL,
  `usrId` int(11) NOT NULL,
  `fecha_conformidad` date NOT NULL,
  `observ_conformidad` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `foto1` blob,
  `foto2` blob,
  `foto3` blob,
  `foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_reparacion`
--

LOCK TABLES `solicitud_reparacion` WRITE;
/*!40000 ALTER TABLE `solicitud_reparacion` DISABLE KEYS */;
INSERT INTO `solicitud_reparacion` VALUES (1,NULL,NULL,NULL,'Jose Perez','2017-11-08 10:44:25','2017-11-09','08:00:00',1,NULL,'rotura de rueda',NULL,'T',3,'2018-09-29','Conformidad ',NULL,NULL,NULL,NULL,6),(2,NULL,NULL,NULL,'wqewqe','2017-11-08 10:45:54','2017-11-09','08:00:00',1,NULL,'assdas',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,NULL,6),(3,NULL,NULL,NULL,'asdsadasd','2017-11-08 10:46:39','2017-11-09','08:00:00',1,NULL,'asdad',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,NULL,6),(4,NULL,NULL,NULL,'sssss','2017-11-08 10:47:21','2017-11-09','08:00:00',1,NULL,'sadasdas',NULL,'T',1,'2018-01-30','trabajo terminado',NULL,NULL,NULL,NULL,6),(5,NULL,NULL,NULL,'huggo','2017-11-08 12:53:19','2017-11-09','08:00:00',1,NULL,'observc test2',NULL,'T',1,'2018-09-25','nuevaaaa',NULL,NULL,NULL,NULL,6),(6,NULL,NULL,NULL,'Hugo Gallardo','2017-11-14 15:23:31','2017-11-15','08:00:00',2,NULL,'Rotura de llanta',NULL,'C',5,'0000-00-00','',NULL,NULL,NULL,NULL,6),(7,NULL,NULL,NULL,'Hugo Gallardo','2017-12-01 05:35:25','2017-12-04','08:00:00',2,NULL,'Falla test sobre RS-0001 (01-12)',NULL,'C',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(8,NULL,NULL,NULL,'hugo gallardo','2018-01-13 21:54:50','2018-01-14','08:00:00',2,NULL,'rotura de equipo test',NULL,'S',5,'0000-00-00','',NULL,NULL,NULL,NULL,6),(9,NULL,NULL,NULL,'juan perez','2018-01-17 13:38:28','2018-01-19','08:00:00',4,NULL,'mancha de aceite abajo del equipo ',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,NULL,6),(10,NULL,NULL,NULL,'Solicitante 1','2018-01-18 18:05:53','2018-01-18','18:04:00',8,NULL,'ccg','18:04','AN',0,'2018-02-08','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(11,NULL,NULL,NULL,'1','2018-01-18 18:07:20','2018-01-18','18:06:00',6,NULL,'mancha de aceite debajo del equipo','18:06','',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(12,NULL,NULL,NULL,'1','2018-01-30 14:06:43','2018-01-30','14:03:00',9,NULL,'No tiene fuerza para levantar la carga','14:03','C',0,'2018-02-08','ok\r\n',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(13,NULL,NULL,NULL,'3','2018-02-05 19:01:38','2018-02-05','18:59:00',9,NULL,'bateria descargada\n\n','18:59','',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(14,NULL,NULL,NULL,'1','2018-02-05 19:42:17','2018-02-07','05:41:00',9,NULL,'fhjh','05:41','AN',0,'2018-02-08','Trabajo OK ',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(15,NULL,NULL,NULL,'1','2018-02-05 19:46:36','2018-02-17','05:41:00',6,NULL,'ggggjffufjffg','05:41','T',0,'2018-04-11','TERMINADO CON EXITO',NULL,NULL,NULL,'assets/files/reclamos/15.jpg',6),(16,NULL,NULL,NULL,'1','2018-02-07 12:36:19','2018-02-16','12:35:00',7,NULL,'fff','12:35','AN',0,'2018-02-08','',NULL,NULL,NULL,'assets/files/reclamos/16.jpg',6),(17,NULL,NULL,NULL,'1','2018-02-08 14:38:14','2018-02-08','14:35:00',10,NULL,'Ruido en cuerpo de bomba int 0057A','14:35','T',0,'2018-04-11','lista la solicitud',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(18,NULL,NULL,NULL,'1','2018-02-08 14:46:00','2018-02-08','14:45:00',6,NULL,'Gets con desgaste excesivo','14:45','C',0,'2018-04-10','CONFORMIDAD',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(19,NULL,NULL,NULL,'hugo gallardo cloud','2018-04-11 12:56:39','2018-04-12','08:00:00',10,NULL,'solicitud de servicios prrueba coud',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(20,NULL,NULL,NULL,'hugo de nuevo','2018-04-11 13:15:16','2018-04-13','16:00:00',10,NULL,'sol de servicio test',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(21,NULL,NULL,NULL,'ssss','2018-04-12 10:53:14','2018-04-13','08:00:00',10,NULL,'asdadasdas',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(22,NULL,NULL,NULL,'ssss','2018-04-12 10:57:40','2018-04-13','08:00:00',10,NULL,'zcxczx',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(23,NULL,NULL,NULL,'hugo','2018-06-18 17:19:46','2018-06-19','08:00:00',10,NULL,'falla de equipo prueba',NULL,'AN',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(24,NULL,NULL,NULL,'hugo gallardo','2018-06-18 17:22:00','2018-06-19','08:00:00',10,NULL,'fala en quipo testeado',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(25,NULL,NULL,NULL,'hugo gallardo','2018-06-18 17:36:20','2018-06-19','08:00:00',10,NULL,'fala en quipo testeado',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(26,NULL,NULL,NULL,'hugo ggggg','2018-06-18 17:38:17','2018-06-19','08:00:00',10,NULL,'fallaa test',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(27,NULL,NULL,NULL,'hugo g','2018-06-19 11:09:05','2018-06-20','08:00:00',4,NULL,'falla test',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(28,NULL,NULL,NULL,'hugo g','2018-06-19 11:13:04','2018-06-20','08:00:00',4,NULL,'falla test 1',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,NULL,6),(29,NULL,NULL,NULL,'hugo g','2018-06-19 11:17:36','2018-06-20','08:00:00',4,NULL,'falla testing 1',NULL,'T',3,'2018-06-19','terminada conforme',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(30,NULL,NULL,NULL,'hugo','2018-06-21 09:41:58','2018-06-22','08:00:00',4,NULL,'falla testing solicitud',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(31,NULL,NULL,NULL,'hugo','2018-06-25 09:29:37','2018-06-26','08:00:00',4,NULL,'fala ttesting 25-06',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(32,NULL,NULL,NULL,'hugo ggg','2018-06-28 12:52:09','2018-06-29','08:00:00',4,NULL,'falla calendario ',NULL,'S',3,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(33,NULL,NULL,NULL,'1','2018-07-30 03:30:17','2018-07-30','10:23:00',2,NULL,'Ventana sucia','10:23','',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',0),(34,NULL,NULL,NULL,'1','2018-08-30 04:35:56','2018-08-30','15:30:00',4,NULL,'falla en rodillo de cinta','15:30','',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',0),(35,NULL,NULL,NULL,'1','2018-08-30 08:00:51','2018-08-30','18:16:00',7,NULL,'ddd','18:16','AN',3,'0000-00-00','',NULL,NULL,NULL,'assets/files/reclamos/35.jpg',6),(36,NULL,NULL,NULL,'dasasdasd','2018-08-30 08:18:16','2018-08-31','08:00:00',1,NULL,'asdad',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(37,NULL,NULL,NULL,'1','2018-08-30 22:50:07','2018-08-31','10:05:00',2,NULL,'fgggsf','10:05','',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/reclamos/37.jpg',0),(38,NULL,NULL,NULL,'juan perez','2018-09-04 23:33:51','2018-09-06','08:00:00',1,NULL,'dsadas',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(39,NULL,NULL,NULL,'juan perez','2018-09-07 00:08:47','2018-09-08','08:00:00',1,NULL,'sadasda',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(40,NULL,NULL,NULL,'asd','2018-09-07 00:38:52','2018-09-08','18:30:00',0,NULL,'asdsad',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(41,NULL,NULL,NULL,'nose','2018-09-07 00:41:25','2018-09-08','08:00:00',0,NULL,'nueva',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(42,NULL,NULL,NULL,'nose','2018-09-07 00:42:09','2018-09-08','08:00:00',0,NULL,'anda?',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(43,NULL,NULL,NULL,'nueva','2018-09-07 00:42:27','2018-09-08','08:00:00',0,NULL,'anda?',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(44,NULL,NULL,NULL,'nose','2018-09-07 00:43:06','2018-09-08','08:00:00',0,NULL,'test',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(45,NULL,NULL,NULL,'nose','2018-09-07 00:44:57','2018-09-08','08:00:00',0,NULL,'test',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(46,NULL,NULL,NULL,'nueva','2018-09-07 00:46:02','2018-09-08','08:00:00',0,NULL,'test',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(47,NULL,NULL,NULL,'nose','2018-09-07 00:46:27','2018-09-08','08:00:00',0,NULL,'jjj',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(48,NULL,NULL,NULL,'kkk','2018-09-07 00:46:40','2018-09-08','08:00:00',0,NULL,'jjjj',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(49,NULL,NULL,NULL,'yo','2018-09-24 09:42:30','0000-00-00','08:00:00',-1,NULL,'nose',NULL,'S',16,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',7),(50,NULL,NULL,NULL,'yo','2018-09-24 10:19:02','0000-00-00','08:00:00',13,NULL,'Fuga de aceite hidraulico por pto',NULL,'AN',16,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',7),(51,NULL,NULL,NULL,'Nuevo solicitante','2018-09-25 10:23:40','0000-00-00','19:00:00',1,NULL,'equipo averiado ',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(52,NULL,NULL,NULL,'nuevo','2018-09-25 10:24:58','2018-11-08','10:00:00',5,NULL,'Nota Nueva',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(53,NULL,NULL,NULL,'Hugo','2018-09-25 10:27:46','0000-00-00','10:00:00',5,NULL,'falla grave',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(54,NULL,NULL,NULL,'nn','2018-09-26 00:13:28','0000-00-00','12:30:00',5,NULL,'nueva borrar',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(55,NULL,NULL,NULL,'yo','2018-09-26 18:26:01','0000-00-00','08:00:00',13,NULL,'vidrio',NULL,'AN',16,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',7),(56,NULL,NULL,NULL,'yo','2018-10-04 16:55:24','2018-10-05','10:15:00',5,NULL,'nota',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(57,NULL,NULL,NULL,'eli','2018-10-04 21:51:39','2018-10-25','09:00:00',5,NULL,'eli',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(58,NULL,NULL,NULL,'nose','2018-10-05 09:34:38','2018-10-25','09:00:00',5,NULL,'sera o no seraaaaa',NULL,'T',1,'2018-10-05','dgsgg',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(59,NULL,NULL,NULL,'nuevo pabloncho','2018-10-05 09:50:25','2018-10-25','13:00:00',5,NULL,'pabloncho',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(60,NULL,NULL,NULL,'pabli','2018-10-05 09:51:06','2018-10-12','12:00:00',9,NULL,'jaajaja',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(61,NULL,NULL,NULL,'mauriiiiiiii peeeeee','2018-10-05 09:55:42','2018-10-24','12:30:00',5,NULL,'borrarrrr',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(62,NULL,NULL,NULL,'nose','2018-10-05 09:57:01','2018-10-06','08:00:00',5,NULL,'eliminarrrrrrr',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(63,NULL,NULL,NULL,'nose','2018-10-05 09:58:24','2018-10-06','08:00:00',9,NULL,'jajajajajaja',NULL,'T',1,'2018-10-05','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(64,NULL,NULL,NULL,'nose','2018-10-05 10:02:33','2018-10-06','08:00:00',5,NULL,'no anda',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(65,NULL,NULL,NULL,'hugo gallarete','2018-10-05 10:04:25','2018-10-06','13:00:00',9,NULL,'falla 1',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(66,NULL,NULL,NULL,'huguis','2018-10-05 10:04:53','2018-10-24','08:00:00',9,NULL,'falla 2',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(67,NULL,NULL,NULL,'aabbcc','2018-10-05 10:08:52','2018-10-19','11:00:00',5,NULL,'falla 3',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(68,NULL,NULL,NULL,'dfghdfgh','2018-10-05 10:17:13','2018-10-06','08:00:00',9,NULL,'dfghfhfgh',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(69,NULL,NULL,NULL,'asas','2018-10-05 10:24:05','2018-10-06','08:00:00',9,NULL,'asasas',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(70,NULL,NULL,NULL,'nueva 123','2018-10-05 10:25:12','2018-10-06','08:00:00',5,NULL,'nueva y ultima',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(71,NULL,NULL,NULL,'nose','2018-10-05 10:25:29','2018-10-06','08:00:00',9,NULL,'eli',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(72,NULL,NULL,NULL,'nn','2018-10-05 11:23:25','2018-10-06','08:00:00',5,NULL,'falllaaaaaaa',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(73,NULL,NULL,NULL,'Marcelo Muriel ','2018-10-08 08:47:51','2018-10-15','12:00:00',16,NULL,'Engrase de cardan ',NULL,'S',18,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',7),(74,NULL,NULL,NULL,'Perez','2018-10-08 11:57:58','2018-10-24','12:00:00',9,NULL,'falla fatal',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(75,NULL,NULL,NULL,'1','2018-10-08 12:05:47','2018-10-08','12:04:00',13,NULL,'ggg','12:04','S',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/reclamos/75.jpg',6);
/*!40000 ALTER TABLE `solicitud_reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `dire` varchar(3000) NOT NULL,
  `telefono` varchar(3000) NOT NULL,
  `zonas` varchar(3000) NOT NULL,
  `id_localidad` int(11) NOT NULL,
  `descripc` varchar(3000) NOT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'mmmm','4253133','desamparados',1,'Casa central','AC',6),(2,'algun lugar','235040','capital',2,'sucursal de capital','AC',6),(3,'direccion','4235040','capital',1,'las le√±as','AN',6),(4,'1','1','1',1,'MRS SERVICE','AC',7),(5,'direccion test','12345678','zona test',0,'descripcion test','AC',6);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tareas` (
  `id_tarea` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_tarea`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)','AC',6),(2,'Limpie las Mangueras y las Conexiones del Radiador.','AC',6),(3,'Cambie Liquido de Refrigerante de Motor (Revise la Mezcla Anticongelante antes de la Epoca Invernal).','AC',6),(4,'Revise la Bomba de Agua','AC',6),(5,'Compruebe el Intercooler y las Mangueras de Conexion.','AC',6),(6,'Drene la Valvula de Purga de Agua del Deposito de Combustible','AC',6),(7,'Cambie el Filtro de Combustible del Motor','AC',6),(8,'Cambie el Respiradero del Deposito de Combustible.','AC',6),(9,'Limpie el Cuerpo del Radiador.','AC',6),(10,'Lubricar Todos los Puntos de Engrase de la Corredera ','AC',6),(11,'Compruebe la Holgura del Carro del Martillo Perforador y el Carril de la Corredera.','AC',6),(12,'Compruebe el Estado de las Mordazas del Centralizador del Retenedor.','AC',6),(13,'Compruebe el Aceite del Engranaje de la Corredera.','AC',6),(14,'Cambie el Aceite del Engranaje de la Corredera.','AC',6),(15,'Cambie los Filtros del Motor','AC',6),(16,'Lubrique los 13 Puntos de Engrase Segun Diagrama.','AC',6),(17,'Compruebe las Soldaduras del Brazo y de la Cuna.','AC',6),(18,'Compruebe los Soportes de los Cilindros ','AC',6),(19,'Apriete los Tornillos de los Pasadores de Expansi√≥n de los Cilindros.','AC',6),(20,'Revisar Apriete de las Varillas Tirantes. ','AC',6),(21,'Revisar Presion y Estado de Valvulas y Tapones de Llenado de Acumulacion.','AC',6),(22,'Revisar Apriete de los Tornillos del Acumulador, Motor de Rotaci√≥n y Tapa Trasera.','AC',6),(23,'Engrase los Ejes de Oscilaci√≥n y Pasadores del Cilindro de Oscilaci√≥n.','AC',6),(24,'Compruebe el Estado y la Sujeccion del Cable del Cabrestante.','AC',6),(25,'Compruebe que no Existen Roturas en las Costuras de Soldadura.','AC',6),(26,'Compruebe el Electrolito y las Conexiones de las Baterias.','AC',6),(27,'Inspecci√≥n: Revisar Desgaste de Correa de Distribuci√≥n (de ser necesario cambiar). ','AC',6),(28,'Regular Luz de V√°lvula de Motor (cada 2000hs segun horometro).','AC',6),(29,'Probar la Capacidad de Retenci√≥n del Freno de Servicio y del Freno de Estacionamiento (procedimiento CAT SMCS - 4251-081; 4267-081).','AC',6),(30,'Inspecci√≥n: Revisar Anclaje , Desgaste y Fecha de Instalacion del Cintur√≥n de Seguridad (de ser necesario cambie el cintur√≥n de seguridad con mas de tres a√±os o por excesivo desgaste). ','AC',6),(31,'Inspeccion: Revisar Nivel del Liquido Limpiaparabrisas (de ser necesario rellenar).','AC',6),(32,'Lubricar Articulaci√≥n de Cuchar√≥n y Cojinete del Cilindro Cargador (utilizar grasa EP68). ','AC',6),(33,'Inspeccion: Revisar Desgaste en Cuchillas, Cantoneras y Planchas de Desgaste Inferiores (controlar par de apriete en bulones, de ser necesario cambiar).','AC',6),(34,'Lubricar Cojinete del Pivote Inferior y Superior del Cucharon (limpie todas las conexiones de engrase antes de lubricar, utilizar grasa EP68 ).','AC',6),(35,'Inspecci√≥n: Revisar Desgaste en Puntas del Cucharon (de ser necesario, programar cambiarlo).','AC',6),(36,'Cambiar Aceite de Transmisi√≥n (cada 1000hs seg√∫n horometro, utilizar el aceite SAE10W). ','AC',6),(37,'Inspecci√≥n: Nivel de Aceite de Transmisi√≥n. ','AC',6),(38,'Cambiar Aceite Hidr√°ulico (cada 500hs segun horometro, utilizar aceite hidr√°ulico 68).. ','AC',6),(39,'Inspecci√≥n: Nivel de Aceite Hidr√°ulico.','AC',6),(40,'Lubricar Estrias de la Columna de Direcci√≥n (tener en cuenta 8 puntos de engrase).','AC',6),(41,'Lubricar Rodamiento de la Columna de Direcci√≥n (utilizar la grasa EP68).','AC',6),(42,'Inspecci√≥n: Revisar Corrosion en Terminales y Desgaste o Da√±o en los Cables (de ser necesario, limpiar bornes de bateria y/o cambiar cables).','AC',6),(43,'Lubricar Cojinetes Superior e Inferior de Articulaci√≥n (limpie todas las conexiones de engrase antes de lubricar, utilizar grasa EP68).','AC',6),(44,'Limpiar Equipo (utilice aire comprimido).','AC',6),(45,'Cambiar Filtro de Aceite de Motor (1R-1808 ITEM 57874).','AC',6),(46,'Cambiar Aceite de Motor (cada 250 hs seg√∫n horometro, utilizar aceite 15W40).','AC',6),(47,'Limpiar Tanque de Combustible.','AC',6),(48,'Inspecci√≥n: Revisar Desgaste de Correa de Distribuci√≥n (de ser necesario cambiar).','AC',6),(49,'Cambiar Filtro de Aire Primario 245-3818 Item 57871 (cada 250 hs seg√∫n horometro).','AC',6),(50,'Cambiar Filtro De Aire Secundario  245-3819 Item 57872 (cada 250 hs seg√∫n horometro).','AC',6),(51,'Cambiar Filtro Separador De Agua Del Sistema De Combustible (cada 250 hs seg√∫n horometro).','AC',6),(52,'Inspecci√≥n: Revisar Holgura De La V√°lvula (cada 1000 hs seg√∫n hor√≥metro. la holgura debe ser de 0,508 mm).','AC',6),(53,'Limpiar Respiradero Del Carter (utilice disolvente liquido no inflamable).','AC',6),(54,'Limpiar V√°lvula de Alivio de Tanque Hidr√°ulico (utilice disolvente liquido no inflamable).','AC',6),(55,'Limpiar Rejilla de Aceite de Direcci√≥n Piloto (utilice disolvente liquido no inflamable).','AC',6),(56,'Lubricar Cojinetes (V√°stago y Cabezal) del Cilindro de Direcci√≥n (limpie todas las conexiones de engrase antes de lubricar. utilizar grasa EP68).','AC',6),(57,'Inspecci√≥n: Revisar Holgura De La V√°lvula (cada 1000 hs seg√∫n hor√≥metro. la holgura debe ser de 0,254 mm).','AC',6),(58,'Inspecci√≥n Visual: Nivel de Aceite de Transmisi√≥n (cuando se requiera).','AC',6),(59,'Cambiar Filtro de Aceite de Transmisi√≥n (cada 500 hs seg√∫n horometro).','AC',6),(60,'Limpieza Respiradero (remover barro y suciedad. lavar con l√≠quido limpiador. cada 1000 hs seg√∫n horometro).','AC',6),(61,'Inspecci√≥n Visual: Nivel de Aceite del Eje de Mando Delantero.','AC',6),(62,'Lubricar Eje de Mando Delantero (cada 2000 hs seg√∫n hor√≥metro. utilizar aceite. ver tabla de aceites. capacidad 16 litros).','AC',6),(63,'Inspecci√≥n Visual: Nivel de Aceite del Eje de Mando Trasero (Tomar lectura de nivel con varilla de medici√≥n).','AC',6),(64,'Lubricar Eje de Mando Trasero (cada 2000 hs seg√∫n hor√≥metro. utilizar aceite. ver tabla de aceites capacidad 16 litros).','AC',6),(65,'Cambiar Aceite de Diferencial Delantero y Trasero (cada 1000 hs seg√∫n horometro √∫tilizar aceite sae50).','AC',6),(66,'Limpiar Filtro Acondicionador de Aire (utilizar aire comprimido seco, en caso de da√±os, cambiar. realizar cada 100 hs seg√∫n hor√≥metro).','AC',6),(67,'Cambiar Filtro Acondicionador de Aire (realizar cada 2000 hs seg√∫n hor√≥metro).','AC',6),(68,'Inspecci√≥n: Nivel de Aceite Hidr√°ulico (controlar el nivel por medio del medidor visual. revisar cada 100 hs seg√∫n hor√≥metro).','AC',6),(69,'Cambiar Aceite Hidr√°ulico (cada 2000 hs seg√∫n hor√≥metro. utilizar aceite SAE 10w. capacidad 63 litros).','AC',6),(70,'Revisar Presi√≥n de Inflado (revisar cada 50 hs seg√∫n hor√≥metro. la presi√≥n de inflado debe ser entre 2,5kg/cm2  a 3,5 kg/cm2).','AC',6),(71,'Inspecci√≥n Visual: Revisar Estado General de los Neum√°ticos (controlar que no tengan ning√∫n tipo de da√±os. revisar cada 50 hs seg√∫n hor√≥metro).','AC',6),(72,'Revisar el Apriete de los Tornllos de los Cubos de las Ruedas (revisar cada 250 hs. seg√∫n hor√≥metro. la tensi√≥n de apriete  es de 94,5 +/- 10,5 kgm).','AC',6),(73,'Cambiar Aceite de Mandos Finales (cada 1000 hs seg√∫n horometro utilizar aceite SAE 50).','AC',6),(74,'Limpiar el Equipo (utilice aire comprimido).','AC',6),(75,'Inspecci√≥n: Comprobar Funcionamiento de Alarma de Retroceso (con el equipo en contacto, active el freno de servicio y coloque marcha en retroceso).','AC',6),(76,'Inspecci√≥n: Revisar Presencia de Fisuras y Bulones Flojos o Da√±ados.','AC',6),(77,'Inspecci√≥n: Comprobar Funcionamiento de las Luces.','AC',6),(78,'Cambiar Aceite de Motor (utilizar aceite 15W40).','AC',6),(80,'Inspecci√≥n Visual: Controlar P√©rdida y Nivel de Aceite Motor (de ser necesario nivelar con aceite 15W40).','AC',6),(81,'Inspecci√≥n Visual: Controlar Soportes del Motor.','AC',6),(82,'Inspecci√≥n Visual: Controlar la Tensi√≥n de la Cadena.','AC',6),(83,'Presi√≥n Seg√∫n Fabricante.','AC',6),(84,'Inspecci√≥n Visual de los Neum√°ticos (control del dibujo de los neum√°ticos).','AC',6),(85,'Cambiar Filtro de Aceite de Motor ITEM. 51488.','AC',6),(86,'Inspecci√≥n Visual: Controlar la Tensi√≥n de la Correa (utilice medidor de tensi√≥n de correa).','AC',6),(87,'Cambiar Filtro de  Aire (primario ITEM 51518).','AC',6),(88,'Cambiar Filtro Separador de Agua del Sistema de Combustible.','AC',6),(89,'Inspecci√≥n Visual: Controlar Soportes del Motor.','AC',6),(90,'Probar la Capacidad de Retenci√≥n del Freno de Servicio y del Freno de Estacionamiento.','AC',6),(91,'Inspecci√≥n Visual: Controlar P√©rdida y Nivel de Agua del Radiador.','AC',6),(92,'Cambiar Cartucho Filtro de Aire.','AC',6),(93,'Inspecci√≥n: Revisar Corrosi√≥n en Terminales y Desgaste o Da√±o en los Cables (de ser necesario, limpiar bornes de bateria y/o cambiar cables).','AC',6),(94,'Inspecci√≥n: Comprobar Funcionamiento de la Bocina.','AC',6),(95,'Lubricar Movimiento (utilizar grasa EP 62).','AC',6),(96,'Inspeccion Visual: Controlar el Nivel de Aceite del Convertidor.','AC',6),(97,'Inspecci√≥n Visual: Controlar Manguera.','AC',6),(98,'Limpie el Filtro de Admisi√≥n de Aire (se puede limpiar como m√°ximo 6 veces, luego cambiar).','AC',6),(99,'Cambie el Filtro de Admisi√≥n de Aire (ITEM. 51549).','AC',6),(100,'Cambie el Cartucho de Filtro de Aire.','AC',6),(101,'Compruebe Juego y Desgaste en Patas de Motor.','AC',6),(102,'Compruebe el Amortiguador de Vibraciones del Cig√ºe√±al.','AC',6),(103,'Revise las Tuberias y Conexiones de la Admisi√≥n de Aire.','AC',6),(104,'Cambie el Aceite de Motor (aceite 15W40).','AC',6),(105,'Cambie los Filtros de Aceite (ITEM. 58108).','AC',6),(106,'Sustituya el Elemento del Respiradero del Carter de Motor.','AC',6),(107,'Compruebe las Boquillas del Inyector.','AC',6),(108,'Revise el Sensor de Temperatura.','AC',6),(109,'Compruebe la Holgura de la Cuna.','AC',6),(111,'TEST','AN',6),(112,'Orden y Limpieza','AC',7),(113,'Cambio de Vidrios ','AC',7),(114,'Cambio Asiento  ','AN',7),(115,'Reemplazo de butaca','AC',7),(116,'Regulaci√≥n de cerradura ','AC',7),(117,'Cambio de Cerradura ','AC',7),(118,'Cambio de Man√≥metros ','AC',7),(119,'Reemplazo de motores de Rotaci√≥n de Cabezal ','AC',7),(120,'Reemplazo de cabezal','AC',7),(121,'Regulaci√≥n El√©ctrica de Joysticks ','AC',7),(122,'Regulaci√≥n Mec√°nica de Joysticks','AC',7),(123,'Cambio de TIM','AC',7),(124,'Calibraci√≥n de TIM ','AC',7),(125,'Reparaci√≥n de Calefacci√≥n ','AC',7),(126,'Limpieza  de Filtro Interior de Cabina ','AC',7),(127,'Cambio de Filtro Exterior de Cabina ','AC',7),(128,'Cambio de Filtro Interior de Cabina','AC',7),(129,'Resellado de Cabina ','AC',7),(130,'Cambio de Burletes de Puerta ','AC',7),(131,'Cambio de Puerta de Acceso ','AC',7),(132,'Cambio de Lampara  Luz de cabina ','AC',7),(133,'Cambio de Interruptores en Cabina ','AC',7),(134,'Cambio de Joysticks ','AC',7),(135,'Carga de Gas de A/C ','AC',7),(136,'Chequeo de Sistema de A/C','AC',7),(137,'Cambio de Compresor de A/C ','AC',7),(138,'Cambio de Equipo A/C de Cabina ','AC',7),(139,'Cambio de Escobillas Limpiaparabrisas ','AC',7),(140,'Cambio de Escalera de Acceso ','AC',7),(141,'Reparaci√≥n de Escalera de Acceso ','AC',7),(142,'Cambio de llave U ','AC',7),(143,'Cambio de Cilindro de Llave U ','AC',7),(144,'Cambio de Goma de Cierre  ','AC',7),(145,'Cambio de Gu√≠as de  Teflon Cabezal ','AC',7),(146,'Regulaci√≥n de Motores de Rotaci√≥n ','AC',7),(147,'Cambio de Sellos Agua-Aire en Cabezal ','AC',7),(148,'Cambio de Retenes de Cabezal ','AC',7),(149,'Cambio de Sensor de RPM  de Cabezal ','AC',7),(150,'Alineaci√≥n de Cabezal ','AC',7),(151,'Regulaci√≥n de Sostenimiento de Cabezal ','AC',7),(152,'Cambio de Luces de Trabajo ','AC',7),(153,'Chequeo de Sistema El√©ctrico ','AC',7),(154,'Cambio de Bomba Principal ','AC',7),(155,'Cambio de Bombas Auxiliares ','AC',7),(156,'Cambio de Retenes de Bomba ','AC',7),(157,'Regulaci√≥n De Bombas ','AC',7),(158,'Cambio de Actuadores de Bomba ','AC',7),(159,'Cambio de Banco de 6 Carretes ','AC',7),(160,'Cambio de Banco de 9 Carretes ','AC',7),(161,'Cambio de V√°lvulas Pulsar ','AC',7),(162,'Resellado de Banco Principales ','AC',7),(163,'Cambio de V√°lvulas Diversoras ','AC',7),(164,'Reparaci√≥n de V√°lvulas Diversoras ','AC',7),(165,'Reparaci√≥n de V√°lvulas de Aceite Caliente ','AC',7),(166,'Reparaci√≥n de V√°lvula DR/PR ','AC',7),(167,'Cambio de V√°lvula Fema ','AC',7),(168,'Cambio de Motor de Traslaci√≥n ','AC',7),(169,'Cambio de Motor Hidr√°ulico ','AC',7),(170,'Regulaci√≥n  RPM de ventilador  de Enfriamiento ','AC',7),(171,'Reparaci√≥n de Fugas Hidr√°ulicas ','AC',7),(172,'Reparaci√≥n de V√°lvulas Contrabalance ','AC',7),(173,' Reparaci√≥n de V√°lvulas de Sostenimiento','AC',7),(174,'Cambio de V√°lvulas de Sostenimiento ','AC',7),(175,'Cambio de Cilindro Hidr√°ulico ','AC',7),(176,'Chequeo  de Sistema Hidr√°ulico ','AC',7),(177,'Cambio de Radiador ','AC',7),(178,'Limpieza de Radiador ','AC',7),(179,'Cambio de Termostato ','AC',7),(180,'Cambio de bomba de Agua ','AC',7),(181,'Reparaci√≥n de Boba de Agua  ','AC',7),(182,'Purgado de Sistema de Iyeccion de Agua ','AC',7),(183,'Reparaci√≥n de V√°lvula Check ','AC',7),(184,'Cambio de V√°lvula Check ','AC',7),(185,'Limpieza de Filtros De Aire ','AC',7),(186,'Cambio de Filtro de Aceite de Motor ','AC',7),(187,'Cambio de Filtro de Aceite Hidr√°ulico ','AC',7),(188,'Cambio de Filtro de Aceite de Compresor ','AC',7),(189,'Cambio de Filtro de Aire ','AC',7),(190,'Cambio de Filtros Colector de Polvo','AC',7),(191,'Limpieza de Filtros Colector de Polvo ','AC',7),(192,'Cambio de Sensores ','AC',7),(193,'Cambio de Arn√©s ','AC',7),(194,'Calibraci√≥n de Sensores ','AC',7),(195,'Chequeo Sistema Neum√°tico ','AC',7),(196,'Cambio de M√≥dulos El√©ctricos  ','AC',7),(197,'Cambio de Fusibles ','AC',7),(198,'Cambio de Bater√≠as ','AC',7),(199,'Cambio de Presoswitchs ','AC',7),(200,'Cambio de Solenoides ','AC',7),(201,'Limpieza de Sensores','AC',7),(202,'Tensado de Cadenas de Tren Rodante ','AC',7),(203,'Cambio de Rolos Superiores Tren Rodante ','AC',7),(204,'Cambio de Rolos Inferiores Tren Rodante','AC',7),(205,'Cambio de Rueda Gu√≠aTren Rodante  ','AC',7),(206,'Cambio de Mando Final ','AC',7),(207,'Tenzado de Cables de Avance ','AC',7),(208,'Tensado de Cables de Holdback ','AC',7),(209,'Cambio de Poleas Cables de Avance ','AC',7),(210,'Cambio de Sprocket de Holdback ','AC',7),(211,'Cambio de Mangueras Hidr√°ulicas ','AC',7),(212,'Cambio de Mangueras Neum√°ticas ','AC',7),(213,'Cambio de Vidrios ','AN',7),(214,'Cambio de Gu√≠as Met√°licas  de Viga ','AC',7),(215,'Cambio de Zapatas de Oruga ','AC',7),(216,'Retorqueo de Zapatas de Orugas ','AC',7),(217,'Recarga de Fluidos ','AC',7),(218,'Cambio de Bater√≠as ','AC',7),(219,'Engrase de Equipo ','AC',7),(220,'Toma de Muestras ','AC',7),(221,'Ejecuci√≥n de BKL ','AC',7),(222,'Inspecci√≥n Perforadora 901 ','AC',7),(223,'Inspecci√≥n Perforadora 903 ','AC',7),(224,'Inspecci√≥n Perforadora 905 ','AC',7),(225,'Inspecci√≥n Perforadora 906 ','AC',7),(226,'Regulaci√≥n de Cmpresor ','AC',7),(227,'Reparaci√≥n de V√°lvula UL-88 ','AC',7),(228,'Regulaci√≥n de Intercambiador de Barras ','AC',7),(229,'Limpieza de Difusor de Grasa de Barras','AC',7),(230,'Limpieza de Mangon de Succi√≥n primario ','AC',7);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_back`
--

DROP TABLE IF EXISTS `tbl_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_back` (
  `backId` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `tarea_descrip` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `horash` int(11) DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `back_duracion` int(11) NOT NULL,
  `back_canth` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `idcomponenteequipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`backId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_back`
--

LOCK TABLES `tbl_back` WRITE;
/*!40000 ALTER TABLE `tbl_back` DISABLE KEYS */;
INSERT INTO `tbl_back` VALUES (16,10,'4','2018-04-27',NULL,'AN',60,0,6,NULL),(17,8,'10','2018-04-29',NULL,'AN',120,0,6,NULL),(18,5,'10','2018-05-02',NULL,'AN',20,0,6,NULL),(19,6,'6','2018-05-04',NULL,'AN',15,0,6,NULL),(20,7,'8','2018-05-02',NULL,'AN',50,0,6,NULL),(21,4,'4','2018-05-11',NULL,'AN',20,0,6,NULL),(22,10,'5','2018-05-01',NULL,'AN',30,0,6,NULL),(23,4,'5','2018-05-31',NULL,'AN',80,0,6,NULL),(24,4,'5','2018-10-31',NULL,'C',650,0,6,NULL),(25,11,'9','2018-06-28',NULL,'C',60,0,6,NULL),(26,1,'3','2018-08-30',NULL,'C',10,0,6,NULL),(27,13,'124','0000-00-00',NULL,'C',250,0,7,NULL),(28,1,'1','0000-00-00',NULL,'C',1233,0,6,NULL),(29,9,'111','2018-10-25',NULL,'C',200,0,6,NULL),(30,13,'125','2018-10-09',NULL,'AN',2,0,7,NULL),(31,1,'10','2018-10-18',NULL,'C',45,0,6,NULL),(32,1,'15','2018-10-18',NULL,'C',45,0,6,5),(33,1,'26','2018-10-21',NULL,'C',60,0,6,343);
/*!40000 ALTER TABLE `tbl_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detanotapedido`
--

DROP TABLE IF EXISTS `tbl_detanotapedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_detanotapedido` (
  `id_detaNota` int(11) NOT NULL AUTO_INCREMENT,
  `id_notaPedido` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `provid` int(11) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `fechaEntregado` date DEFAULT NULL,
  `remito` int(11) DEFAULT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_detaNota`),
  KEY `id_notaPedido` (`id_notaPedido`),
  CONSTRAINT `tbl_detanotapedido_ibfk_1` FOREIGN KEY (`id_notaPedido`) REFERENCES `tbl_notapedido` (`id_notaPedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detanotapedido`
--

LOCK TABLES `tbl_detanotapedido` WRITE;
/*!40000 ALTER TABLE `tbl_detanotapedido` DISABLE KEYS */;
INSERT INTO `tbl_detanotapedido` VALUES (65,61,2,13,2,'2018-06-27','2018-06-27',1,'P'),(69,64,2,12,1,'2018-07-22','2018-07-22',1234,'E'),(70,65,11,2,1,'2018-10-16','2018-10-16',1,'P'),(71,65,11,6,2,'2018-10-15','2018-10-15',1,'P'),(72,66,22,2,2,'2018-10-26','2018-10-26',1,'P'),(73,66,71,1,3,'2018-10-15','2018-10-15',1,'P'),(74,67,16,1,1,'2018-10-15','2018-10-15',1,'P'),(75,68,12,6,2,'2018-10-13','2018-10-13',1,'P'),(76,69,185,12,2,'2018-10-29','2018-10-29',1,'P'),(77,70,10,10,3,'2018-10-29','2018-10-29',1,'P'),(78,70,10,25,2,'2018-10-30','2018-10-30',1,'P'),(79,71,12,1,5,'2018-11-02','2018-11-02',1,'P');
/*!40000 ALTER TABLE `tbl_detanotapedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detavaledescarga`
--

DROP TABLE IF EXISTS `tbl_detavaledescarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_detavaledescarga` (
  `detavaledid` int(11) NOT NULL AUTO_INCREMENT,
  `valedid` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `observa` varchar(255) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`detavaledid`),
  KEY `equipid` (`herrId`) USING BTREE,
  KEY `valedid` (`valedid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detavaledescarga`
--

LOCK TABLES `tbl_detavaledescarga` WRITE;
/*!40000 ALTER TABLE `tbl_detavaledescarga` DISABLE KEYS */;
INSERT INTO `tbl_detavaledescarga` VALUES (1,1,4,NULL,NULL,6),(2,2,103,NULL,NULL,7);
/*!40000 ALTER TABLE `tbl_detavaledescarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detavalesalida`
--

DROP TABLE IF EXISTS `tbl_detavalesalida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_detavalesalida` (
  `detavid` int(10) NOT NULL AUTO_INCREMENT,
  `valesid` int(11) DEFAULT NULL,
  `herrId` int(10) DEFAULT NULL,
  `observa` text,
  `dest` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`detavid`),
  KEY `equiid` (`herrId`) USING BTREE,
  KEY `valesid` (`valesid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detavalesalida`
--

LOCK TABLES `tbl_detavalesalida` WRITE;
/*!40000 ALTER TABLE `tbl_detavalesalida` DISABLE KEYS */;
INSERT INTO `tbl_detavalesalida` VALUES (1,1,8,NULL,NULL,6),(2,1,1,NULL,NULL,6),(3,1,2,NULL,NULL,6),(4,5,4,NULL,NULL,6),(5,6,0,NULL,NULL,0),(6,6,0,NULL,NULL,0),(7,6,0,NULL,NULL,0),(8,6,4,NULL,NULL,0),(15,10,103,NULL,NULL,7),(16,11,54,NULL,NULL,0),(17,11,23,NULL,NULL,0),(18,11,2,NULL,NULL,0),(19,15,2,NULL,NULL,6),(20,15,17,NULL,NULL,6),(21,15,15,NULL,NULL,6),(22,16,16,NULL,NULL,6),(23,17,91,NULL,NULL,6),(24,17,5,NULL,NULL,6),(25,18,9,NULL,NULL,6),(26,18,59,NULL,NULL,6),(27,19,6,NULL,NULL,6),(28,19,7,NULL,NULL,6),(29,20,4,NULL,NULL,6),(30,21,20,NULL,NULL,6),(31,21,83,NULL,NULL,6),(32,22,20,NULL,NULL,6),(33,22,83,NULL,NULL,6),(34,23,56,NULL,NULL,6),(35,24,20,NULL,NULL,6),(36,25,23,NULL,NULL,6),(37,26,27,NULL,NULL,6),(38,26,29,NULL,NULL,6),(39,27,5,NULL,NULL,6),(40,27,29,NULL,NULL,6),(41,28,0,NULL,NULL,6);
/*!40000 ALTER TABLE `tbl_detavalesalida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estado` (
  `estadoid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`estadoid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado`
--

LOCK TABLES `tbl_estado` WRITE;
/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
INSERT INTO `tbl_estado` VALUES (1,'ACTIVO','AC'),(2,'TRANSITO','TR'),(3,'REPARACION','RE'),(4,'COMODATO','CO'),(5,'CURSO','C'),(6,'INACTIVO','IN'),(7,'SOLICITADO','S'),(8,'TAREA REALIZADA','RE'),(9,'TERMINADO PARCIAL','TE'),(10,'TERMINADO','T'),(11,'ENTREGADO','E'),(12,'PEDIDO','P'),(13,'ASIGNADO','As'),(14,'ANULADO','AN');
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estanteria`
--

DROP TABLE IF EXISTS `tbl_estanteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estanteria` (
  `id_estanteria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fila` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_estanteria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estanteria`
--

LOCK TABLES `tbl_estanteria` WRITE;
/*!40000 ALTER TABLE `tbl_estanteria` DISABLE KEYS */;
INSERT INTO `tbl_estanteria` VALUES (1,'estanteria 1','1','dd1',6),(2,'estanteria 2','1','dd2',6),(3,'estanteria 3','1','dd3',6),(4,'estanteria 4','1','dd4',6),(5,'estanteria 5','1','d5',6),(6,'Estanter√≠a de prueba 01','12','ESTANTERIA TEST 01',6),(7,'','6','E1 ',7);
/*!40000 ALTER TABLE `tbl_estanteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_listarea`
--

DROP TABLE IF EXISTS `tbl_listarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_listarea` (
  `id_listarea` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden` int(11) NOT NULL,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_listarea`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_listarea`
--

LOCK TABLES `tbl_listarea` WRITE;
/*!40000 ALTER TABLE `tbl_listarea` DISABLE KEYS */;
INSERT INTO `tbl_listarea` VALUES (1,1,'tarea 12',NULL,NULL,'IN'),(2,1,'tarea1212',NULL,NULL,'C'),(3,1,'tarea130',NULL,NULL,'IN'),(4,1,'tareanueva1',NULL,NULL,'C'),(5,1,'tarea gemma1',NULL,NULL,'1'),(6,1,'TAREA2',NULL,NULL,'6'),(7,1,'TAREA 25',NULL,NULL,'6'),(8,1,'nombre de tarea 1 ',NULL,NULL,'5'),(9,1,'nuevatrea30',NULL,NULL,'5'),(10,1,'tarea de gemma',NULL,NULL,'5'),(11,1,'nueva tarea 34 ',NULL,NULL,'5'),(12,1,'nueva tarea 50',3,NULL,'5'),(13,0,'nueva tares 45 45',NULL,NULL,'5'),(14,1,'nueva tarea12',1,NULL,'6'),(15,1,'gemmma belen tarea',3,NULL,'5'),(16,1,'nueva tare ',NULL,NULL,'5'),(17,1,'nueva tarea ',NULL,NULL,'5'),(18,1,'TAREA 10 ',NULL,NULL,'5'),(19,1,'hhu',NULL,NULL,'5'),(20,1,'hyhy12',NULL,NULL,'5'),(21,1,'dedede',NULL,NULL,'5'),(22,1,'genemmma ',NULL,NULL,'6'),(23,1,'gemma',NULL,NULL,'6'),(24,1,'fefefef',NULL,NULL,'5'),(25,1,'fefeenueva ',NULL,NULL,'6'),(26,1,'gemama',NULL,NULL,'5'),(27,1,'geegegegegeg',NULL,NULL,'5'),(28,1,'nueva traea gemma',NULL,NULL,'6'),(29,1,'gemma ingresi ntarea',NULL,NULL,'6'),(30,1,'hola ',NULL,NULL,'6'),(31,1,'vuev tarea maruicio',NULL,NULL,'5'),(32,1,'tarea AHORA SI',2,NULL,'5'),(33,1,'TAREA SI12',1,NULL,'5'),(34,1,'TAREA 100',2,NULL,'5'),(35,8,'sASA',NULL,NULL,'C'),(36,8,'asSa',NULL,NULL,'C'),(37,8,'ASA',NULL,NULL,'C'),(38,22,'desarme',NULL,NULL,'C'),(39,22,'limpieza ',NULL,NULL,'C'),(40,22,'armado',1,NULL,'C'),(41,22,'limpieza',2,NULL,'C'),(42,22,'desarme',3,NULL,'C'),(43,16,'DDFDS',NULL,NULL,'C'),(44,16,'SDFSF',3,'2017-12-11','C'),(45,16,'nueva tarea: Limpieza ',1,'2017-12-11','RE'),(46,17,'jadf√±jdskjfd',NULL,NULL,'C'),(47,16,'saadsa',6,'2017-12-13','C'),(48,16,'sadadasd',NULL,NULL,'C'),(49,16,'sdadasdsa',3,NULL,'C'),(50,16,'1111',NULL,NULL,'C'),(51,16,'2222',3,NULL,'C'),(52,16,'dedede',1,NULL,'RE'),(53,16,'gegeg',1,NULL,'RE'),(54,21,'tarea 1',1,NULL,'C'),(55,21,'tarea2',3,NULL,'C'),(56,21,'tarea3',NULL,NULL,'C'),(57,21,'tarea4',NULL,NULL,'C'),(58,21,'tarea6',1,NULL,'RE'),(59,37,'dsadadad',1,'2017-12-20','C'),(60,34,'fsdfsfsd',1,'2017-12-29','C'),(61,34,'qwewqeqw',1,'2017-12-29','C'),(62,47,'sdadsad',NULL,NULL,'C'),(63,47,'sadad',NULL,NULL,'C'),(64,47,'dasdd',NULL,NULL,'RE'),(65,47,'dthdhgd',NULL,NULL,'RE'),(66,73,'dffgrrb',NULL,NULL,'C'),(67,73,'geegtgt',5,NULL,'C'),(68,73,'evefvev',1,NULL,'C'),(69,532,'ssss',NULL,NULL,'RE'),(70,532,'subtarea 1',NULL,NULL,'RE'),(71,532,'subtarea 2',NULL,NULL,'IN'),(72,532,'bababbaa',NULL,NULL,'C'),(73,220,'tarea test',NULL,NULL,'C'),(74,535,'ttajalads',NULL,NULL,'C'),(75,535,'afasdfadsf',NULL,'2018-06-22','C'),(76,535,'tareaaaaa',3,NULL,'RE'),(77,535,'tarea 3',2,NULL,'C'),(78,535,'tareaaaa 4',NULL,'2018-06-23','C'),(79,536,'tarea 1',NULL,'2018-06-23','RE'),(80,536,'tarea 2',3,'2018-06-29','C'),(81,536,'aaaa',2,'2018-06-23','C'),(82,538,'tarea 1 asociada a OT id 538',NULL,NULL,'C'),(83,539,'tarea asociada a la OT 539',3,NULL,'C'),(84,539,'tarea 2 asociada a la OT 539',3,NULL,'C'),(85,539,'tarea 3 ot 539',NULL,NULL,'C'),(86,540,'hhhhhh',NULL,NULL,'C'),(87,541,'tarea ot 540',2,'2018-06-30','C'),(88,158,'kkkkk',2,'2018-08-30','RE'),(89,23,'Tarea 1',NULL,NULL,'IN'),(90,23,'Tarea 2',NULL,NULL,'RE'),(91,23,'Tarea3',1,'0000-00-00','C'),(92,510,'Tarea3',NULL,NULL,'IN'),(93,510,'Tarea de Prueba',NULL,NULL,'IN'),(94,510,'nueva tarea',1,'2018-11-10','RE'),(95,510,'fer',NULL,NULL,'IN'),(96,510,'tarea 03',1,'2018-10-04','RE'),(97,563,'tarea 03b',NULL,NULL,'C'),(98,568,'tarea de test',NULL,NULL,'C'),(99,510,'tarea test',1,'2018-10-05','IN'),(100,510,'asdasdasd',NULL,NULL,'IN'),(101,576,'rgreghfgjfhgjhjkhjk',NULL,NULL,'C'),(102,576,'asdasdasd',NULL,NULL,'C'),(103,576,'rgreghfgjfhgjhjkhjk',NULL,NULL,'C'),(104,545,'Tarea3',NULL,NULL,'C'),(105,510,'nueva tarea fer',NULL,NULL,'IN'),(106,510,'nuevaaaaa',NULL,NULL,'IN'),(107,510,'holis',NULL,NULL,'IN'),(108,510,'tarea 11222',NULL,NULL,'IN'),(109,510,'Tarea 999',-1,'0000-00-00','IN'),(110,510,'tarea 8888',NULL,NULL,'RE'),(111,510,'holis fer',1,NULL,'IN'),(112,510,'estas ahi???',NULL,'0000-00-00','IN'),(113,549,'Cambio de vidrio lateral de cabina ',NULL,NULL,'RE');
/*!40000 ALTER TABLE `tbl_listarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lote`
--

DROP TABLE IF EXISTS `tbl_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_lote` (
  `loteid` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `lotestado` char(4) DEFAULT NULL,
  `depositoid` int(11) DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`loteid`),
  KEY `depositoid` (`depositoid`),
  KEY `artId` (`artId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lote`
--

LOCK TABLES `tbl_lote` WRITE;
/*!40000 ALTER TABLE `tbl_lote` DISABLE KEYS */;
INSERT INTO `tbl_lote` VALUES (1,'cod-0001','2017-11-06','181',2,'AC',1,NULL,6),(2,'cod-002','2018-10-01','21',10,'AC',1,NULL,6),(3,'Cod-0003','2018-10-01','11',11,'AC',2,NULL,6),(4,'cod-006','2018-10-25','90',10,'AC',2,NULL,6),(7,'12345678','2018-10-27','50',175,'AC',2,NULL,6),(8,'12345678','2018-10-27','25',175,'AC',1,NULL,6);
/*!40000 ALTER TABLE `tbl_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_notapedido`
--

DROP TABLE IF EXISTS `tbl_notapedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_notapedido` (
  `id_notaPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_ordTrabajo` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_notaPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notapedido`
--

LOCK TABLES `tbl_notapedido` WRITE;
/*!40000 ALTER TABLE `tbl_notapedido` DISABLE KEYS */;
INSERT INTO `tbl_notapedido` VALUES (61,'2018-06-27',25,6),(64,'2018-07-22',1,6),(65,'2018-10-12',164,6),(66,'2018-10-12',161,6),(67,'2018-10-12',164,6),(68,'2018-10-12',166,6),(69,'2018-10-29',160,6),(70,'2018-10-29',160,6),(71,'2018-10-29',160,6);
/*!40000 ALTER TABLE `tbl_notapedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_preventivoherramientas`
--

DROP TABLE IF EXISTS `tbl_preventivoherramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_preventivoherramientas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prevId` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prevId` (`prevId`),
  KEY `tbl_preventivoherramientas_ibfk_2` (`herrId`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_preventivoherramientas`
--

LOCK TABLES `tbl_preventivoherramientas` WRITE;
/*!40000 ALTER TABLE `tbl_preventivoherramientas` DISABLE KEYS */;
INSERT INTO `tbl_preventivoherramientas` VALUES (1,22,20,1,6),(2,23,1,2,0),(3,23,2,20,0),(4,24,1,2,0),(5,26,1,4,6),(6,26,2,5,6),(7,26,4,1,6),(11,1,1,11,6),(12,1,4,22,6),(13,1,5,33,6),(14,1,2,44,6),(15,1,1,1,6),(16,1,2,2,6),(17,1,5,3,6),(18,1,1,1,6),(19,1,2,2,6),(20,1,5,3,6),(21,1,1,1,6),(22,1,2,2,6),(23,1,5,3,6),(24,1,4,2,6),(25,1,4,2,6),(26,41,1,11,6),(27,41,2,22,6),(28,42,4,2,6),(29,55,1,1111,6),(30,55,2,222,6),(31,42,1,3,3),(32,NULL,1,0,6),(33,NULL,2,0,6),(34,NULL,4,0,6),(35,NULL,2,0,6),(36,NULL,1,0,6),(37,NULL,5,0,6),(38,NULL,1,45,6),(39,NULL,2,33,6),(40,NULL,5,22,6),(62,43,4,333,6),(63,43,1,55,6),(67,56,2,1,6),(68,56,4,2,6),(79,47,1,15,6),(80,128,4,1,6),(81,129,93,1,7),(82,134,4,22,6),(83,135,4,22,6),(87,136,2,2222,6),(90,141,2,34,6),(91,148,2,1,6);
/*!40000 ALTER TABLE `tbl_preventivoherramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_preventivoinsumos`
--

DROP TABLE IF EXISTS `tbl_preventivoinsumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_preventivoinsumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prevId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prevId` (`prevId`),
  KEY `artId` (`artId`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_preventivoinsumos`
--

LOCK TABLES `tbl_preventivoinsumos` WRITE;
/*!40000 ALTER TABLE `tbl_preventivoinsumos` DISABLE KEYS */;
INSERT INTO `tbl_preventivoinsumos` VALUES (1,22,3,45,6),(2,23,1,15,6),(3,23,2,20,6),(4,24,3,20,6),(5,26,1,5,6),(6,26,2,15,6),(7,26,3,45,6),(8,27,1,11,6),(9,27,2,22,6),(10,1,1,1,6),(11,1,2,2,6),(12,1,3,3,6),(13,55,1,111,6),(14,55,2,222,6),(15,42,1,20,6),(16,42,3,15,6),(17,42,4,35,6),(29,43,1,11,6),(30,43,3,45,6),(33,56,1,2,6),(56,47,1,25,6),(57,128,21,1,6),(58,134,2,22,6),(59,135,2,22,6),(63,136,173,22,6),(65,141,2,50,6),(66,148,18,2,6);
/*!40000 ALTER TABLE `tbl_preventivoinsumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipoordentrabajo`
--

DROP TABLE IF EXISTS `tbl_tipoordentrabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipoordentrabajo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_orden` int(11) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`,`tipo_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipoordentrabajo`
--

LOCK TABLES `tbl_tipoordentrabajo` WRITE;
/*!40000 ALTER TABLE `tbl_tipoordentrabajo` DISABLE KEYS */;
INSERT INTO `tbl_tipoordentrabajo` VALUES (1,1,'Orden de Trabajo'),(2,2,'Solicitud de servicio'),(3,3,'Preventivo'),(4,4,'Backlog'),(5,5,'Predictivo'),(6,6,'Correctivo Programado');
/*!40000 ALTER TABLE `tbl_tipoordentrabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_trazacomponente`
--

DROP TABLE IF EXISTS `tbl_trazacomponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_trazacomponente` (
  `id_trazacomponente` int(11) NOT NULL AUTO_INCREMENT,
  `idcomponenteequipo` int(11) NOT NULL,
  `id_estanteria` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fecha_Entrega` datetime DEFAULT NULL,
  `ult_recibe` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_trazacomponente`),
  KEY `idcomponenteequipo` (`idcomponenteequipo`),
  KEY `id_estanteria` (`id_estanteria`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_trazacomponente`
--

LOCK TABLES `tbl_trazacomponente` WRITE;
/*!40000 ALTER TABLE `tbl_trazacomponente` DISABLE KEYS */;
INSERT INTO `tbl_trazacomponente` VALUES (1,71,1,2,'2017-10-05 07:29:05','2017-10-05 07:31:25','Balderramo','E','se lleva balderrama para reparar bomba inyectora',5,6),(2,72,2,3,'2017-10-05 07:29:05','2017-10-05 07:29:05','Sr Perez','REC','recibo radiador para reparar',5,6),(3,3,1,1,'2017-12-02 07:12:21','2017-12-02 07:12:21','pedro perez','C','sadadsa',1,6),(4,3,1,1,'2017-12-02 07:12:53','2017-12-02 07:12:53','motores balderramo','C','dasdasd',1,6),(5,0,6,6,'2018-07-03 00:39:20','2018-07-03 00:39:20','qwerty','C','qwerty',1,6);
/*!40000 ALTER TABLE `tbl_trazacomponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_unidadmedida`
--

DROP TABLE IF EXISTS `tbl_unidadmedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_unidadmedida` (
  `id_unidadmedida` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_unidadmedida`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_unidadmedida`
--

LOCK TABLES `tbl_unidadmedida` WRITE;
/*!40000 ALTER TABLE `tbl_unidadmedida` DISABLE KEYS */;
INSERT INTO `tbl_unidadmedida` VALUES (1,'Unidades','AN',6),(2,'Litro','AC',6),(3,'Metro','AC',6),(4,'Kg','AC',6),(5,'m2','AN',6),(6,'m3','AN',6),(7,'caja','AC',6);
/*!40000 ALTER TABLE `tbl_unidadmedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_valedesacarga`
--

DROP TABLE IF EXISTS `tbl_valedesacarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_valedesacarga` (
  `valedid` int(11) NOT NULL AUTO_INCREMENT,
  `valedfecha` datetime DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`valedid`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_valedesacarga`
--

LOCK TABLES `tbl_valedesacarga` WRITE;
/*!40000 ALTER TABLE `tbl_valedesacarga` DISABLE KEYS */;
INSERT INTO `tbl_valedesacarga` VALUES (1,'2018-07-02 00:00:00',1,'Hugo G','Destino 01 prueba',6),(2,'2018-10-08 00:00:00',18,'Rodriguez Guillermo ','mina chinchillas ',7);
/*!40000 ALTER TABLE `tbl_valedesacarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_valesalida`
--

DROP TABLE IF EXISTS `tbl_valesalida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_valesalida` (
  `valesid` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `usrId` int(10) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`valesid`),
  KEY `repid` (`usrId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_valesalida`
--

LOCK TABLES `tbl_valesalida` WRITE;
/*!40000 ALTER TABLE `tbl_valesalida` DISABLE KEYS */;
INSERT INTO `tbl_valesalida` VALUES (1,'2017-11-14',NULL,'Roberto P√©rez','Obra 1',6),(2,'2017-11-14',NULL,'Francisco Rodriguez','Obra 2',6),(4,'2017-11-14',5,NULL,NULL,6),(5,'2018-07-02',1,'hugo G','destino 01 prueba',6),(6,'2018-09-19',1,NULL,NULL,0),(10,'2018-10-08',18,'Rodriguez Guillermo ','mina chinchillas ',7),(15,'2018-10-20',1,NULL,NULL,6),(16,'2018-10-20',1,NULL,NULL,6),(17,'2018-10-20',1,NULL,NULL,6),(18,'2018-10-20',1,NULL,NULL,6),(19,'2018-10-20',1,NULL,NULL,6),(20,'2018-10-20',1,NULL,NULL,6),(21,'2018-10-20',1,NULL,NULL,6),(22,'2018-10-20',1,NULL,NULL,6),(23,'2018-10-21',1,NULL,NULL,6),(24,'2018-10-21',1,NULL,NULL,6),(25,'2018-10-21',1,NULL,NULL,6),(26,'2018-10-21',1,NULL,NULL,6),(27,'2018-10-23',1,NULL,NULL,6),(28,'2018-11-05',1,'','',6);
/*!40000 ALTER TABLE `tbl_valesalida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocuenta`
--

DROP TABLE IF EXISTS `tipocuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocuenta` (
  `tipocuentaid` int(11) NOT NULL AUTO_INCREMENT,
  `tipocuentadescrip` varchar(255) DEFAULT NULL,
  `tipocuentamonto` varchar(50) DEFAULT NULL,
  `tipocuentausuarios` varchar(50) DEFAULT NULL,
  `tipocuentaactivos` varchar(50) DEFAULT NULL,
  `tipocuentaempresas` varchar(50) DEFAULT NULL,
  `apps` varchar(2) DEFAULT NULL,
  `modulo_alerta` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`tipocuentaid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocuenta`
--

LOCK TABLES `tipocuenta` WRITE;
/*!40000 ALTER TABLE `tipocuenta` DISABLE KEYS */;
INSERT INTO `tipocuenta` VALUES (1,'GO','0','10','100','1','NO','NO'),(2,'PRO','100','50','1000','3','SI','SI'),(3,'CORPORATE','300','ILIMITADO','ILIMITADO','ILIMITADO','SI','SI');
/*!40000 ALTER TABLE `tipocuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_industrial`
--

DROP TABLE IF EXISTS `unidad_industrial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_industrial` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_industrial`
--

LOCK TABLES `unidad_industrial` WRITE;
/*!40000 ALTER TABLE `unidad_industrial` DISABLE KEYS */;
INSERT INTO `unidad_industrial` VALUES (1,'veladero',6),(2,'nueva unidad insdutrial 2',6),(3,'MINA CHINCHILLAS',7),(4,'La Laja',2),(5,'unidad agregada 1',6),(6,'unidad agregada 2',6),(7,'unidad agregada 3',6),(8,'unidad agregada 4',6),(9,'unidad agregada 5',6),(10,'unidadagregada 6',6),(11,'La laja',6);
/*!40000 ALTER TABLE `unidad_industrial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_tiempo`
--

DROP TABLE IF EXISTS `unidad_tiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_tiempo` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `unidaddescrip` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_tiempo`
--

LOCK TABLES `unidad_tiempo` WRITE;
/*!40000 ALTER TABLE `unidad_tiempo` DISABLE KEYS */;
INSERT INTO `unidad_tiempo` VALUES (1,'minutos'),(2,'horas'),(3,'dias');
/*!40000 ALTER TABLE `unidad_tiempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioasempresa`
--

DROP TABLE IF EXISTS `usuarioasempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioasempresa` (
  `empresaid` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` tinyint(1) NOT NULL,
  `grpId` int(11) NOT NULL,
  PRIMARY KEY (`empresaid`,`usrId`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioasempresa`
--

LOCK TABLES `usuarioasempresa` WRITE;
/*!40000 ALTER TABLE `usuarioasempresa` DISABLE KEYS */;
INSERT INTO `usuarioasempresa` VALUES (6,1,NULL,1,0),(6,17,'2018-09-18 00:00:00',1,0),(7,16,'2018-09-17 00:00:00',1,0),(7,18,'2018-09-21 00:00:00',1,7),(7,19,'2018-09-12 00:00:00',1,1);
/*!40000 ALTER TABLE `usuarioasempresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'planner_assetcloudtest'
--

--
-- Dumping routines for database 'planner_assetcloudtest'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-07  3:24:29
