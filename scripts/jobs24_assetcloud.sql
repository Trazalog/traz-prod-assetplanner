CREATE DATABASE  IF NOT EXISTS `jobs24_assetcloud` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jobs24_assetcloud`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jobs24_assetcloud
-- ------------------------------------------------------
-- Server version	5.6.31

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
  `estado` varchar(45) NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`depositoId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abmdeposito`
--

LOCK TABLES `abmdeposito` WRITE;
/*!40000 ALTER TABLE `abmdeposito` DISABLE KEYS */;
INSERT INTO `abmdeposito` VALUES (1,'Dep√≥sito Nro A','Avenida Libertador 1264 Oeste',NULL,NULL,NULL,'','AC',2),(2,'Dep√≥sito Nro 2','Av. Central 18 este',NULL,NULL,NULL,NULL,'AC',6),(3,'Dep√≥sito Nro 2','Av. Central 102 este',NULL,NULL,NULL,NULL,'AC',2),(4,'testa','testa',NULL,NULL,NULL,NULL,'AN',2);
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
  `estado` varchar(45) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`provid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abmproveedores`
--

LOCK TABLES `abmproveedores` WRITE;
/*!40000 ALTER TABLE `abmproveedores` DISABLE KEYS */;
INSERT INTO `abmproveedores` VALUES (1,' Don Perez','2023339814','dsadasdasd','2645677','permauricio@gmail.com','8','AC',2),(2,'Trazalog','20-54545454-9','Lib. Gral S Martin 1890','15555555','soporte@trazalog.com','8','AC',2),(3,'aaa2','aaa2','aaa2','1234','aaa2',NULL,'AN',2),(4,'Proveedor test','26791164292','Presidente roca sn','4230329','prov.test@trazalog.com',NULL,'AN',2);
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
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `cliRazonSocial` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cliId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admcustomers`
--

LOCK TABLES `admcustomers` WRITE;
/*!40000 ALTER TABLE `admcustomers` DISABLE KEYS */;
INSERT INTO `admcustomers` VALUES (1,'Daniel','Osvaldo','31324200','1984-05-01','1','Av La Humareda 12','','','','13.png',10,30,'#00a65a','AC',2,'Daniel Osvaldo'),(2,'Mariana','Romero','31324205','2016-05-04','14','Av. Simpre Viva 123','','','','14.png',11,15,'#f39c12','AC',2,'Mariana Romero'),(3,'Mauricio','perez','23339814','2016-06-01','17','dd','26465','026457070785','permaucirio@gmail.com','17.png',10,30,'#00a65a','AC',2,'Master of Ventas'),(15,'Patricia','Moreno','45632145','2016-05-19','15','Rogelio Funes Mori y No Fue Corner','','','','15.png',10,10,'#dd4b39','AC',2,'Patricia Romero'),(16,'Homero','Perez','45888882','2000-05-10','16','Rivadavia 124s','','','','16.png',12,20,'#00a65a','AC',2,'Homero'),(31,'747','747','747',NULL,NULL,'747','747',NULL,'747',NULL,NULL,30,NULL,'AC',2,'747');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Area 01',2,'AC'),(2,'gemma area 1',2,'AN'),(3,'Industrial',2,'AC'),(5,'Area 02',2,'AC'),(6,'agregar √°rea',2,'AN'),(7,'Area c-01',2,'AN'),(8,'747',2,'AN');
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
  `artIsByBox` bit(1) NOT NULL,
  `artCantBox` int(11) DEFAULT NULL,
  `artMarginIsPorcent` bit(1) NOT NULL,
  `artEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `famId` int(11) NOT NULL,
  `unidadmedida` int(11) NOT NULL,
  `punto_pedido` int(11) DEFAULT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`artId`),
  UNIQUE KEY `artBarCode` (`artBarCode`) USING BTREE,
  UNIQUE KEY `artDescription` (`artDescription`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'FERR - 0001','ca√±o cuadrado',0.00,0.00,'',0,'\0','AC',1,1,25,2),(2,'FERRE - 002','Electrodos',0.00,0.00,'',0,'\0','AC',1,3,50,2),(3,'test-02','rallador 02',0.00,0.00,'',0,'\0','AC',2,1,111,2),(4,'00001-09988','saddasd',0.00,0.00,'\0',0,'\0','AN',1,1,23,6),(8,'test03','sfgdfgdfg',0.00,0.00,'\0',0,'\0','AN',1,2,0,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignausuario`
--

LOCK TABLES `asignausuario` WRITE;
/*!40000 ALTER TABLE `asignausuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignausuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componenteequipo`
--

DROP TABLE IF EXISTS `componenteequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componenteequipo` (
  `idcomponenteequipo` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) DEFAULT NULL,
  `id_componente` int(11) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `codigo` varchar(11) NOT NULL,
  `estado` varchar(4) DEFAULT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`idcomponenteequipo`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componenteequipo`
--

LOCK TABLES `componenteequipo` WRITE;
/*!40000 ALTER TABLE `componenteequipo` DISABLE KEYS */;
INSERT INTO `componenteequipo` VALUES (6,1,1,NULL,'cod compone','AC',2),(16,1,2,NULL,'cod compone','AC',2),(71,4,12,NULL,'codigoXXX c','AC',2);
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
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_componente`),
  KEY `id_equipo` (`id_equipo`),
  KEY `marcaid` (`marcaid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentes`
--

LOCK TABLES `componentes` WRITE;
/*!40000 ALTER TABLE `componentes` DISABLE KEYS */;
INSERT INTO `componentes` VALUES (1,'IT-0001-04',1,'2017-11-06 00:00:00',NULL,1,'',2),(2,'filstro RS 224',2,'2017-11-08 00:00:00',NULL,1,'',2),(3,'Cargadorea komatsu CDM812',2,'2017-12-02 00:00:00',NULL,1,'',2),(12,'xxx',2,'2018-01-16 11:23:31','eqweqeqeqe',1,'assets/filesequipos/12.pdf',2),(13,'MOTOR DIESEL',2,'2018-01-16 11:30:15','',4,'assets/filesequipos/13.pdf',2),(15,'FILTRO DE COMBUSTIBLE ',4,'2018-01-16 11:33:31','',4,'assets/filesequipos/15.pdf',2),(16,'TANQUE DE COMBUSTIBLE',4,'2018-01-16 11:34:19','',4,'assets/filesequipos/16.pdf',2),(17,'MOTOR DE ARRANQUE',4,'2018-01-16 11:35:50','',4,'assets/filesequipos/17.pdf',2),(18,'RADIADOR',4,'2018-01-16 11:36:07','',4,'assets/filesequipos/18.pdf',2),(19,'SENSOR DE TEMPERATURA',4,'2018-01-16 11:37:30','',4,'assets/filesequipos/19.pdf',2),(21,'',NULL,NULL,NULL,NULL,'',0);
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
  `estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conffamily`
--

LOCK TABLES `conffamily` WRITE;
/*!40000 ALTER TABLE `conffamily` DISABLE KEYS */;
INSERT INTO `conffamily` VALUES (1,'Filtros','AC',2),(2,'Seguridad','AC',2),(3,'ggg225','AN',2);
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
  `id_contratistaquipo` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  PRIMARY KEY (`id_contratistaquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratistaquipo`
--

LOCK TABLES `contratistaquipo` WRITE;
/*!40000 ALTER TABLE `contratistaquipo` DISABLE KEYS */;
INSERT INTO `contratistaquipo` VALUES (1,2,17),(2,2,19),(3,4,17),(4,4,19),(5,4,21),(6,8,19),(7,8,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratistas`
--

LOCK TABLES `contratistas` WRITE;
/*!40000 ALTER TABLE `contratistas` DISABLE KEYS */;
INSERT INTO `contratistas` VALUES (17,'Clorox7','Clorox 123 norte','contacto@clorox.com','info@clorox.com','1565656657','1565656657','1565656657','1565656657','AC',2),(19,'Trazalog','Lib. Gral. S. Martin 1890','soporte@tazalog.com','soporte@tazalog.com','155555555','155555555','155555555','Soporte','AC',2);
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
  `id_empresa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_criti`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criticidad`
--

LOCK TABLES `criticidad` WRITE;
/*!40000 ALTER TABLE `criticidad` DISABLE KEYS */;
INSERT INTO `criticidad` VALUES (1,'Alta','2','AC'),(2,'Media','2','AC'),(3,'Baja','2','AC'),(4,'Criticidad 02','2','AC'),(5,'666','2','AN'),(6,'Criticidad nivel 01','2','AN'),(7,'747','2','AN');
/*!40000 ALTER TABLE `criticidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deta-remito`
--

DROP TABLE IF EXISTS `deta-remito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deta-remito` (
  `detaremitoid` int(11) NOT NULL AUTO_INCREMENT,
  `id_remito` int(11) NOT NULL,
  `loteid` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`detaremitoid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta-remito`
--

LOCK TABLES `deta-remito` WRITE;
/*!40000 ALTER TABLE `deta-remito` DISABLE KEYS */;
INSERT INTO `deta-remito` VALUES (1,1,1,34,0,2),(2,2,1,23,0,2),(3,3,1,12,0,2),(4,5,1,2,0,2),(5,6,1,1,0,2);
/*!40000 ALTER TABLE `deta-remito` ENABLE KEYS */;
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_detaordeninsumo`),
  KEY `loteid` (`loteid`),
  KEY `id_ordeninsumo` (`id_ordeninsumo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta_ordeninsumos`
--

LOCK TABLES `deta_ordeninsumos` WRITE;
/*!40000 ALTER TABLE `deta_ordeninsumos` DISABLE KEYS */;
INSERT INTO `deta_ordeninsumos` VALUES (1,1,1,10,NULL,2),(2,2,1,2,NULL,2),(3,3,1,12,NULL,2),(4,4,2,2,NULL,2),(5,5,1,3,NULL,2),(6,6,2,3,NULL,2),(7,7,2,1,NULL,2),(8,8,1,6,NULL,2),(9,9,1,10,NULL,2),(10,10,1,8,NULL,2);
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
  `id_tarea` int(11) NOT NULL,
  `tiempo` varchar(100) CHARACTER SET latin1 NOT NULL,
  `observacion` text CHARACTER SET latin1,
  `monto` double NOT NULL,
  `id_componente` int(11) NOT NULL,
  `rh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detasercicio`),
  KEY `id_ordenservicio` (`id_ordenservicio`),
  KEY `id_componente` (`id_componente`),
  KEY `deta_ordenservicio_ibfk_2` (`id_tarea`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta_ordenservicio`
--

LOCK TABLES `deta_ordenservicio` WRITE;
/*!40000 ALTER TABLE `deta_ordenservicio` DISABLE KEYS */;
INSERT INTO `deta_ordenservicio` VALUES (1,1,1,' 1 ',NULL,150,2,1),(2,2,1,' 12 ',NULL,1200,1,2),(3,3,1,' 10 ',NULL,1000,1,3);
/*!40000 ALTER TABLE `deta_ordenservicio` ENABLE KEYS */;
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
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (2,'Oficinas trazalog','30125612569','Caseros 650 Sur','0264 427-4296','',NULL,NULL,NULL,NULL,NULL,'',10,NULL),(6,'Sibelco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `id_sector` int(11) NOT NULL,
  `id_hubicacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
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
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_equipo`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_sector` (`id_sector`),
  KEY `id_criticidad` (`id_criticidad`),
  KEY `id_grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'PERFORADORA RANGER 500','2017-01-01','0000-00-00','2018-12-31','Tamrock','EMPER001','La Laja',4,NULL,4,1,1,'AC','0000-00-00 00:00:00',9000,'',0,0,'0000-00-00',0,0,'','',1,3,3,0,2),(2,'PERFORADORA RANGER 680','2017-06-01','0000-00-00','2018-01-19','Tamrock','EMPER002','La Laja',4,NULL,4,2,2,'AC','2018-01-17 00:00:00',7000,'',0,0,'0000-00-00',0,0,'','',1,3,3,0,2),(4,'CARGADORA FRONTAL CAT 980H','2017-08-01','0000-00-00','2018-03-14','Caterpillar','EMCAR002','La Laja',5,NULL,4,2,2,'RE','2018-01-17 00:00:00',4500,'',0,0,'0000-00-00',0,0,'','',1,3,3,0,2),(8,'747','2018-09-08','0000-00-00','2018-09-15','747','747','',15,NULL,8,31,1,'AC','2018-09-15 00:00:00',747,'',0,0,'0000-00-00',0,0,'','666',2,1,1,747,2),(13,'descrip','2018-09-14','0000-00-00','2018-09-30','Caterpillar','mos2018','123456',6,NULL,3,3,4,'AC','2018-09-14 00:00:00',12,'',0,0,'0000-00-00',0,0,'','',2,5,2,555,2);
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
INSERT INTO `ficha_equipo` VALUES (1,242,'1011','1012','1013','1010','2017-07-09','nose1010',0,10,'10',1),(2,242,'marca12','12m','120','1212','2017-07-10','fefe',1980,10,'10',1),(3,0,'nuevo modelo 5051','5051ng','5051','5051','2017-07-10','5051',1950,51,'510',1),(4,0,'marca pepe 14145','nuevo pepe 14145','14150','14145','2017-07-10','14',1914,14,'14',1),(5,242,'nuevo gm 6061','6061 mgpepe','60610','6061','2017-07-10','6061',1960,61,'60',1),(6,242,'8081p','80812','80813','8081','2017-07-10','80814',1983,80,'81',0),(7,339,'5252 marca','5252 marca','1212','5252','2017-07-12',' gemma',1989,12,'20',0),(8,11,'cat','3512','123345','0001','2018-01-30','lwo070',0,0,'',0);
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
  `estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Instalaciones','AC',2),(2,'Rodados','AC',2),(3,'Instalaciones Electricas','AC',2),(4,'Equipos Moviles','AC',2),(5,'grupo de prueba','AN',2),(8,'666','AC',2),(9,'Grupo 33','AN',2),(10,'sdfsdfddf','AC',2),(11,'747','AC',2);
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`herrId`),
  UNIQUE KEY `1` (`herrcodigo`) USING BTREE,
  KEY `depositoId` (`depositoId`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herramientas`
--

LOCK TABLES `herramientas` WRITE;
/*!40000 ALTER TABLE `herramientas` DISABLE KEYS */;
INSERT INTO `herramientas` VALUES (1,'AK47','Black & Decker',1,NULL,'TR','Amoladora',1,2),(2,'SW80','Robust',1,NULL,'AC','Taladro',1,2),(4,'HR-TT-Organizador Tornillos','Organizador tornillos - Stanley',1,NULL,'AC','HR-TT-Organizador Tornillos',1,2),(5,'HR-TT-Escalera 7 pelda√±os','Escalera 7 pelda√±o - Ayinco',1,NULL,'AC','HR-TT-Escalera 7 pelda√±os',1,2),(6,'HR-TT-Mascara facial','Mascara facial',2,NULL,'AC','HR-TT-Mascara facial',1,2),(7,'HR-TT-Prot Audit-Vincha','Protector auditivo copa tipo vincha',1,NULL,'AC','HR-TT-Prot Audit-Vincha',1,2),(8,'HR-TT-Llave combinada 10mm','Llave combinada 10mm',3,NULL,'AC','HR-TT-Llave combinada 10mm',1,2),(9,'HR-TT-Llave combinada 13mm','Llave combinada 13mm',1,NULL,'AC','HR-TT-Llave combinada 13mm',1,6),(10,'HR-TT-Llave combinada 15mm','Llave combinada 13mm',1,NULL,'AC','HR-TT-Llave combinada 15mm',1,6),(11,'HR-TT-Llave combinada 17mm','Llave combinada 17mm',1,NULL,'AC','HR-TT-Llave combinada 17mm',1,6),(12,'HR-TT-Llave combinada 7/16\"','Llave combinada 7/16\"',1,NULL,'AC','HR-TT-Llave combinada 7/16\"',1,6),(13,'HR-TT-Llave combinada 9/16\"','Llave combinada 9/16\"',1,NULL,'AC','HR-TT-Llave combinada 9/16\"',1,6),(14,'HR-TT-Destornillador de pu√±o philips','Destornillador de pu√±o philips - Bulit',1,NULL,'AC','HR-TT-Destornillador de pu√±o philips',1,6),(15,'HR-TT-Llave Francesa 30mm','Llave Francesa 30mm',1,NULL,'AC','HR-TT-Llave Francesa 30mm',1,6),(16,'HR-TT-Cinta m√©trica de 5 m ','Cinta m√©trica de 5 m ',1,NULL,'AC','HR-TT-Cinta m√©trica de 5 m ',1,6),(17,'HR-OFA-Linterna','Linterna',1,NULL,'AC','HR-OFA-Linterna',1,6),(18,'HR-OFA-Arco de sierra','Arco de sierra',1,NULL,'AC','HR-OFA-Arco de sierra',1,6),(19,'HR-OFA-Extractor de poleas 150 mm','Extractor de poleas 150 mm',1,NULL,'AC','HR-OFA-Extractor de poleas 150 mm',1,6),(20,'HR-OFA-Alargues','Alargues',1,NULL,'AC','HR-OFA-Alargues',1,6),(21,'HR-OFE-Espatula chica','Espatula chica',1,NULL,'AC','HR-OFE-Espatula chica',1,6),(22,'HR-OFE-Espatulas medianas','Espatulas medianas',1,NULL,'AC','HR-OFE-Espatulas medianas',1,6),(23,'HR-OFE-Barretines de 0,80 y 0,90 negro, naranja','barretines de 0,80 y 0,90 negro, naranja',1,NULL,'AC','HR-OFE-Barretines de 0,80 y 0,90 negro, naranja',1,6),(24,'HR-OFE-Arn√©s','Arn√©s',1,NULL,'AC','HR-OFE-Arn√©s',1,6),(25,'HR-OFE-Llanas','Llanas',1,NULL,'AC','HR-OFE-Llanas',1,6),(26,'HR-OFE-Llana dentada','Llana dentada',1,NULL,'AC','HR-OFE-Llana dentada',1,6),(27,'HR-OFE-Balde de Alba√±il','Balde de Alba√±il',1,NULL,'AC','HR-OFE-Balde de Alba√±il',1,6),(28,'HR-OFE-Anchada','Anchada',1,NULL,'AC','HR-OFE-Anchada',1,6),(29,'HR-OFE-Bota de goma','Bota de goma',1,NULL,'AC','HR-OFE-Bota de goma',1,6),(30,'HR-ODE-Boquilla para termofusi√≥n 1\"','Boquilla para termofusi√≥n 1\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 1\"',1,6),(31,'HR-ODE-Boquilla para termofusi√≥n 4\"','Boquilla para termofusi√≥n 4\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 4\"',1,6),(32,'HR-ODE-Boquilla para termofusi√≥n 2,5\"','Boquilla para termofusi√≥n 2,5\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 2,5\"',1,6),(33,'HR-ODE-Boquilla para termofusi√≥n 80mm','Boquilla para termofusi√≥n 80mm',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 80mm',1,6),(34,'HR-ODE-Boquilla para termofusi√≥n 2\"','Boquilla para termofusi√≥n 2\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 2\"',1,6),(35,'HR-ODE-Boquilla para termofusi√≥n 1 1/2\"','Boquilla para termofusi√≥n 1 1/2\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 1 1/2\"',1,6),(36,'HR-ODE-Boquilla para termofusi√≥n 1 1/4\"','Boquilla para termofusi√≥n 1 1/4\"',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 1 1/4\"',1,2),(39,'HR-ODE-Termofusora 1','Termofusora 1',1,NULL,'AC','HR-ODE-Termofusora 1',1,2),(40,'HR-ODE-Termofusora 1600w','Termofusora 1600w',1,NULL,'AC','HR-ODE-Termofusora 1600w',1,2),(41,'HR-ODE-Boquilla para termofusi√≥n 75mm','Boquilla para termofusi√≥n 75mm',3,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 75mm',1,2),(43,'HR-ODE-Boquilla para termofusi√≥n 110mm','Boquilla para termofusi√≥n 110mm',1,NULL,'AC','HR-ODE-Boquilla para termofusi√≥n 110mm',1,2),(44,'HR-OVI-TermoAnem√≥metro ','TermoAnem√≥metro ',1,NULL,'AC','HR-OVI-TermoAnem√≥metro ',1,2),(45,'HR-OVI-Termometro infrarojo','Termometro infrarojo',1,NULL,'AC','HR-OVI-Termometro infrarojo',1,2),(46,'HR-OVI-Pinza extractora de fusible NH','Pinza extractora de fusible NH',1,NULL,'AC','HR-OVI-Pinza extractora de fusible NH',1,2),(47,'HR-OVI-Pinza amperometrica con puntas','Pinza amperometrica con puntas',1,NULL,'AC','HR-OVI-Pinza amperometrica con puntas',1,2),(48,'HR-OVI- Soldador Caut√≠n 30w','Soldador Caut√≠n 30w',1,NULL,'AC','HR-OVI- Soldador Caut√≠n 30w',1,2),(49,'HR-OFE-Multimetro con puntas','Multimetro con puntas',1,NULL,'AC','HR-OFE-Multimetro con puntas',1,2),(50,'HR-TTA-P√©rtiga DPA 3 KV','P√©rtiga DPA 3 KV',1,NULL,'AC','HR-TTA-P√©rtiga DPA 3 KV',1,2),(51,'HR-OVI-Detector de met√°l ','Detector de met√°l ',1,NULL,'AC','HR-OVI-Detector de met√°l ',1,2),(52,'HR-OVI-Programador de variador vel.','Programador de variador vel.',1,NULL,'AC','HR-OVI-Programador de variador vel.',1,2),(53,'HR-OVI-Pinza amp con puntas','Pinza amp con puntas',1,NULL,'AC','HR-OVI-Pinza amp con puntas',1,2),(54,'HR-OFA-Caja de llaves tubos medidas chicas(completa)','Caja de llaves tubos medidas chicas(completa)',1,NULL,'AC','HR-OFA-Caja de llaves tubos medidas chicas(completa)',1,2),(55,'HR-OFA-Caja de llaves tubos medidas grandes(completa)','Caja de llaves tubos medidas grandes(completa)',1,NULL,'AC','HR-OFA-Caja de llaves tubos medidas grandes(completa)',1,2),(56,'HR-OFA-Caja de mechas(12,16,20mm y 1/2\")','Caja de mechas(12,16,20mm y 1/2\")',1,NULL,'AC','HR-OFA-Caja de mechas(12,16,20mm y 1/2\")',1,2),(57,'HR-OFA-Amoladora 4,5\" 840w 9557 HP','Amoladora 4,5\" 840w 9557 HP',1,NULL,'AC','HR-OFA-Amoladora 4,5\" 840w 9557 HP',1,2),(58,'HR-OFA-Llave Stillson 36\"','Llave Stillson 36\"',1,NULL,'AC','HR-OFA-Llave Stillson 36\"',1,2),(59,'HR-OFA-Pistola de calor','Pistola de calor',1,NULL,'AC','HR-OFA-Pistola de calor',1,2),(60,'HR-OFA-Serrucho 24\"','Serrucho 24\"',1,NULL,'AC','HR-OFA-Serrucho 24\"',1,2),(61,'HR-OFA-Atornillador ? 13 con bateria ','Atornillador ? 13 con bateria ',1,NULL,'AC','HR-OFA-Atornillador ? 13 con bateria ',1,2),(63,'HR-OFA-Atornillador  13 con bateria ','Atornillador  13 con bateria ',1,NULL,'AC','HR-OFA-Atornillador  13 con bateria ',1,2),(64,'HR-OFA-Llave Inglesa 22\"','Llave Inglesa 22\"',1,NULL,'AC','HR-OFA-Llave Inglesa 22\"',1,2),(65,'HR-OFA-Rotomartillo con mandril y llave','Rotomartillo con mandril y llave',1,NULL,'AC','HR-OFA-Rotomartillo con mandril y llave',1,2),(66,'HR-ODE-Extractor de poleas 400 mm','Extractor de poleas 400 mm',1,NULL,'AC','HR-ODE-Extractor de poleas 400 mm',1,2),(67,'HR-OFE-Espatulas grandes','Espatulas grandes',1,NULL,'AC','HR-OFE-Espatulas grandes',1,6),(68,'HR-OFE-Soplete para colocar membrana','Soplete para colocar membrana',1,NULL,'AC','HR-OFE-Soplete para colocar membrana',1,6),(69,'HR-OFE-Cola de vida ','Cola de vida ',1,NULL,'AC','HR-OFE-Cola de vida ',1,6),(73,'HR-OFE-Serrucho para corte en durlock','Serrucho para corte en durlock',1,NULL,'AC','HR-OFE-Serrucho para corte en durlock',1,6),(74,'HR-OFE-Llana de durlock','Llana de durlock',1,NULL,'AC','HR-OFE-Llana de durlock',1,6),(75,'HR-OFE-Fratacho','Fratacho',1,NULL,'TR','HR-OFE-Fratacho',1,6),(76,'HR-OFE-Cortafierro','Cortafierro',1,NULL,'AC','HR-OFE-Cortafierro',1,6),(77,'HR-OFE-Mazo mediano','Mazo mediano',1,NULL,'AC','HR-OFE-Mazo mediano',1,6),(78,'HR-OFE-Cuchara mediana de alba√±il','Cuchara mediana de alba√±il',1,NULL,'AC','HR-OFE-Cuchara mediana de alba√±il',1,6),(79,'HR-OFE-Cuchara grande de alba√±il','Cuchara grande de alba√±il',1,NULL,'AC','HR-OFE-Cuchara grande de alba√±il',1,6),(80,'HR-OFE-Chocla','Chocla',1,NULL,'AC','HR-OFE-Chocla',1,6),(81,'HR-OFE-Martelina','Martelina',1,NULL,'AC','HR-OFE-Martelina',1,6),(82,'HR-OFE-Bomba de combustible','Bomba de combustible',1,NULL,'AC','HR-OFE-Bomba de combustible',1,6),(83,'HR-OFE-Grasera','Grasera',1,NULL,'AC','HR-OFE-Grasera',1,6),(86,'A-Hormigonera','azul',1,NULL,'AC','A-Hormigonera',NULL,6),(87,'w80','989',1,NULL,'AC','w80',NULL,6),(89,'HVLL-TT-MANIFOLD','L√ºsqtoff',1,NULL,'AC','MANOMETRO DE GASES REFRIGERANTE',2,6),(90,'HVLL-TT','SSP',1,NULL,'AC','Agujereadora de mano el√©ctrica 13 mm con percutor',3,6),(91,'2334343242','ssss',0,NULL,'AC','Taladro',1,2),(93,'','',-1,NULL,'AC','',-1,2);
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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_lecturas`
--

LOCK TABLES `historial_lecturas` WRITE;
/*!40000 ALTER TABLE `historial_lecturas` DISABLE KEYS */;
INSERT INTO `historial_lecturas` VALUES (1,1,150,'2017-10-01 04:24:41',8,'too ok','pepe','tarde','AC'),(2,1,56,'2017-10-16 04:29:15',8,'todo normal','ruben','noche','AC'),(3,1,20,'2017-10-28 10:48:21',8,'normal','juan','ma√±ana','AC'),(4,1,0,'2017-11-08 20:14:59',0,NULL,'','','AC'),(5,1,0,'2017-11-16 20:15:21',0,NULL,'','','RE'),(6,1,0,'2017-11-24 20:15:32',0,NULL,'','','RE'),(7,2,12,'2018-07-27 17:24:07',1,'lalalaaaa','perez','ma√±ana','RE'),(8,6,20,'2018-09-01 11:57:34',1,'test','test','test','RE'),(9,6,0,'2018-09-01 12:03:21',1,'aaa','aaa','aaa','AC'),(10,6,0,'2018-09-01 12:03:56',1,'bbb','bbb','bbb','RE'),(11,6,0,'2018-09-01 12:04:17',1,'ccc','ccc','ccc','AC'),(12,7,0,'2018-09-01 12:05:46',1,'ddd','ddd','ddd','AC'),(13,6,666,'2018-09-01 13:31:25',1,'666','666','666','AC'),(14,6,777,'2018-09-01 21:39:24',1,'777','777','777','RE'),(15,8,12,'2018-09-24 18:43:56',1,'12','12','12','RE'),(16,8,123,'2018-09-24 18:45:08',1,'123','123','123','AC'),(17,8,3,'2018-09-24 18:57:02',1,'3','3','3','RE'),(18,8,4,'2018-09-24 19:00:51',1,'4','4','4','AC'),(19,8,12,'2018-09-24 19:04:10',1,'12','12','12','RE'),(20,8,5,'2018-09-24 19:08:10',1,'5','5','5','AC');
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
  `id_empresa` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_informacion`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacionequipo`
--

LOCK TABLES `informacionequipo` WRITE;
/*!40000 ALTER TABLE `informacionequipo` DISABLE KEYS */;
INSERT INTO `informacionequipo` VALUES (1,'tit01','tit01',17,'2'),(2,'tit01','dede02',17,'2'),(3,'tit01','tit03',17,'2'),(4,'tit01','jjj04',17,'2'),(5,'dede02','tit01',17,'2'),(6,'dede02','dede02',17,'2'),(7,'dede02','tit03',17,'2'),(8,'dede02','jjj04',17,'2'),(9,'tit03','tit01',17,'2'),(10,'tit03','dede02',17,'2'),(11,'tit03','tit03',17,'2'),(12,'tit03','jjj04',17,'2'),(13,'jjj04','tit01',17,'2'),(14,'jjj04','dede02',17,'2'),(15,'jjj04','tit03',17,'2'),(16,'jjj04','jjj04',17,'2'),(17,'fefe1','fefe1',15,'2'),(18,'fefe1','fefe2',15,'2'),(19,'fefe1','fefe4',15,'2'),(20,'fefe1','fefe5',15,'2'),(21,'fefe2','fefe1',15,'2'),(22,'fefe2','fefe2',15,'2'),(23,'fefe2','fefe4',15,'2'),(24,'fefe2','fefe5',15,'2'),(25,'fefe4','fefe1',15,'2'),(26,'fefe4','fefe2',15,'2'),(27,'fefe4','fefe4',15,'2'),(28,'fefe4','fefe5',15,'2'),(29,'fefe5','fefe1',15,'2'),(30,'fefe5','fefe2',15,'2'),(31,'fefe5','fefe4',15,'2'),(32,'fefe5','fefe5',15,'2'),(33,'fefe','fefe',16,'2'),(34,'fefe','fefe',16,'2'),(35,'fefe','fff',16,'2'),(36,'fefe','ff2',16,'2'),(37,'fefe','fefe',16,'2'),(38,'fefe','fefe',16,'2'),(39,'fefe','fff',16,'2'),(40,'fefe','ff2',16,'2'),(41,'fff','fefe',16,'2'),(42,'fff','fefe',16,'2'),(43,'fff','fff',16,'2'),(44,'fff','ff2',16,'2'),(45,'ff2','fefe',16,'2'),(46,'ff2','fefe',16,'2'),(47,'ff2','fff',16,'2'),(48,'ff2','ff2',16,'2'),(49,'dede','dede',14,'2'),(50,'dede','dee',14,'2'),(51,'dee','dede',14,'2'),(52,'dee','dee',14,'2'),(53,'titulo info complementaria','info complementaria en si misma',7,'2'),(54,'666','666',8,'2'),(55,'fgh','fgh',10,'2'),(56,'qqq','qqq',12,'2');
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`marcaid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcasequipos`
--

LOCK TABLES `marcasequipos` WRITE;
/*!40000 ALTER TABLE `marcasequipos` DISABLE KEYS */;
INSERT INTO `marcasequipos` VALUES (1,'Marca Unica','AN',2),(2,'Black & Decker','AC',2),(3,'Bahco','AC',2),(4,'Caterpillar','AC',2),(5,'Skill','AC',2),(9,'Marca Gen√©rica','AN',2),(17,'MARCA TEST','AC',2),(18,'TEST 2','AN',2),(19,'666','AC',2),(20,'747','AC',2);
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_insumos`
--

LOCK TABLES `orden_insumos` WRITE;
/*!40000 ALTER TABLE `orden_insumos` DISABLE KEYS */;
INSERT INTO `orden_insumos` VALUES (1,'2017-11-13','edsfsdfs',NULL,43434,2),(2,'0000-00-00','3',NULL,0,2),(3,'2018-06-29','7',NULL,1,2),(5,'2018-06-28','7',NULL,0,2),(7,'2018-07-01','4',NULL,0,2),(8,'2018-07-01','5',NULL,112233,2),(9,'2018-07-01','1',NULL,345,2),(10,'2018-07-01','9',NULL,6578678,2);
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
  PRIMARY KEY (`id_orden`),
  KEY `id_trabajo` (`id_trabajo`),
  KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_pedido`
--

LOCK TABLES `orden_pedido` WRITE;
/*!40000 ALTER TABLE `orden_pedido` DISABLE KEYS */;
INSERT INTO `orden_pedido` VALUES (1,1,501,'pedido prueba','2017-05-10 00:00:00','2017-05-11 00:00:00','2017-11-27 10:09:09','E',1,'',3344),(2,3,5011,'prueba','2017-05-10 00:00:00','2017-05-10 00:00:00','0000-00-00 00:00:00','P',16,'',NULL),(3,4,5011,'ahorasi ','2017-05-10 00:00:00','2017-05-10 00:00:00','0000-00-00 00:00:00','P',16,'',NULL),(4,5,301,'cargando pedido gemma','2017-05-10 00:00:00','2017-05-11 00:00:00','0000-00-00 00:00:00','P',18,'',NULL),(5,9,602,'pedido de prueba 3','2017-05-10 00:00:00','2017-05-10 00:00:00','2017-08-14 19:35:47','E',18,'',123456),(6,3,91,'ORDEN DE PEDIDO NUMERO 91 ASOCIADA A LA 90','2017-07-20 00:00:00','2017-07-21 00:00:00','0000-00-00 00:00:00','P',16,'',NULL),(7,5,902,'asociada a la orden numero 902','2017-07-20 00:00:00','2017-07-20 00:00:00','0000-00-00 00:00:00','P',20,'',NULL),(8,7,9020,'orden de pedido asociada a la orden de trabajo  numero 90 op 9020','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',20,'',NULL),(9,7,950,'OT numero de pedido 950','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',21,'',NULL),(10,8,9090,'op 9090','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',20,'',NULL),(11,8,9670,'OP nro 9697120','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',23,'',NULL),(12,9,96969,'OP nro 96969','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',22,'',NULL),(13,6,96969,'OT NRO 96969','2017-07-20 00:00:00','2017-07-27 00:00:00','0000-00-00 00:00:00','P',22,'',NULL),(14,4,14140,'OP nuevo','2017-08-11 00:00:00','2017-08-18 00:00:00','0000-00-00 00:00:00','P',17,'',NULL),(15,12,78998797,'4 ca√±√±os largos','0000-00-00 00:00:00','0000-00-00 00:00:00','2017-08-14 19:37:38','E',18,'',79456),(16,13,987987,'6 ca√±os ciuadrados','0000-00-00 00:00:00','0000-00-00 00:00:00','2017-08-14 20:28:31','E',18,'',16),(17,13,7898798,'4 docenas de bolunes','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','P',18,'',NULL),(18,4,99,'aceite\narrancador','2017-08-15 00:00:00','2017-08-17 00:00:00','2017-08-15 11:05:19','E',31,'',798987),(19,4,14,'pedido de ppriieba 123456','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','P',20,'',NULL),(20,4,1514,'OT DE PEDIDO','2017-08-16 00:00:00','2017-08-23 00:00:00','0000-00-00 00:00:00','P',19,'',NULL),(21,4,16,'dadadada pedidonuevo ','0000-00-00 00:00:00','2017-09-01 00:00:00','2017-09-01 14:19:26','E',34,'',1666),(22,4,45646,'comprar mas memoria','0000-00-00 00:00:00','0000-00-00 00:00:00','2017-09-19 10:31:06','E',38,'',123),(23,2,23,'sadadsad','0000-00-00 00:00:00','2017-11-04 00:00:00','2017-12-11 11:18:59','E',8,'',22323),(24,1,1414,'141414','0000-00-00 00:00:00','2017-12-01 00:00:00','0000-00-00 00:00:00','P',23,'',NULL),(25,1,22222,'aSAsaSAsaS','2017-12-11 11:13:18','2017-12-11 00:00:00','0000-00-00 00:00:00','P',16,'',NULL),(26,2,55,'p','2017-12-12 18:46:56','2017-12-14 00:00:00','0000-00-00 00:00:00','P',17,'',NULL);
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
  `fecha` date NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  `id_solicitudreparacion` int(11) NOT NULL,
  `valesid` int(11) DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_ordenherraminetas` int(11) DEFAULT NULL,
  `id_orden_insumo` int(11) DEFAULT NULL,
  `orden_serviciocol` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_empresaservicio` (`id_contratista`),
  KEY `id_solicitudreparacion` (`id_solicitudreparacion`),
  KEY `id_orden_insumo` (`id_orden_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (1,'2017-11-14','',2,17,6,4,'C',NULL,1,NULL,'2'),(2,'2017-12-09','',1,17,16,1,'C',NULL,1,NULL,'2'),(3,'2017-12-11','',1,17,16,1,'C',NULL,1,NULL,'2');
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
  PRIMARY KEY (`id_orden`),
  KEY `orden_trabajo_ibfk_1` (`cliId`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `id_usuariosolicitante` (`id_usuario_a`) USING BTREE,
  KEY `usuario_entrega` (`id_usuario_e`) USING BTREE,
  KEY `id_sucursal` (`id_sucursal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_trabajo`
--

LOCK TABLES `orden_trabajo` WRITE;
/*!40000 ALTER TABLE `orden_trabajo` DISABLE KEYS */;
INSERT INTO `orden_trabajo` VALUES (1,0,'1','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:44:25','2017-11-08 10:47:45','2017-11-08 10:47:45','2017-11-08 10:47:45','2017-11-08 10:47:45','rotura de rueda',13,'C',1,1,1,1,0,1,'1',0,60,NULL,2),(2,0,'4','0000-00-00','0000-00-00 00:00:00','2017-11-08 00:00:00','2017-11-29 00:00:00','2017-11-23 08:39:37','2017-11-08 10:48:19','2017-12-10 00:00:00','sadasdas',13,'E',1,1,1,1,0,4,'1',0,60,NULL,2),(3,0,'4','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:47:21','2017-11-08 10:58:41','2017-11-08 10:58:41','2017-11-08 10:58:41','2017-11-08 10:58:41','sadasdas',1,'C',1,1,1,1,0,4,'2',0,60,NULL,2),(4,4,'4','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:47:21','2017-11-08 12:52:35','2017-11-08 12:52:35','2017-11-08 12:52:35','2017-11-08 12:52:35','sadasdas',1,'AC',1,1,1,1,0,4,'2',4,60,NULL,2),(5,5,'1','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:44:25','2017-11-09 16:09:14','2017-11-09 16:09:14','2017-11-09 16:09:14','2017-11-09 16:09:14','rotura de rueda',13,'AC',1,1,1,1,0,1,'',4,60,NULL,2),(6,0,'5','0000-00-00','0000-00-00 00:00:00','2017-11-08 12:53:19','2017-12-09 16:09:34','2017-11-09 16:09:34','2017-11-09 16:09:34','2017-11-09 16:09:34','observc test2',1,'IN',1,1,1,1,1,5,'',0,60,NULL,2),(7,0,'5','0000-00-00','0000-00-00 00:00:00','2017-11-08 12:53:19','2017-12-07 10:38:07','2017-11-13 10:38:07','2017-11-13 10:38:07','2017-11-13 10:38:07','observc test2',1,'RE',1,1,1,1,1,5,'',0,60,NULL,2),(8,0,'1','0000-00-00','0000-00-00 00:00:00','2017-11-08 00:00:00','0000-00-00 00:00:00','2017-11-14 14:39:59','2017-11-14 14:39:59','2017-11-14 14:39:59','rotura de rueda',13,'P',1,1,1,1,1,1,'2',0,60,NULL,2),(9,0,'6','0000-00-00','0000-00-00 00:00:00','2017-11-14 15:23:31','2017-11-14 15:38:02','2017-11-14 15:38:02','2017-11-14 15:38:02','2017-11-14 15:38:02','Rotura de llanta',13,'C',5,5,5,1,0,6,'',0,60,NULL,2),(10,0,'6','0000-00-00','0000-00-00 00:00:00','2017-11-14 15:23:31','2017-11-14 15:42:27','2017-11-14 15:42:27','2017-11-14 15:42:27','2017-11-14 15:42:27','Rotura de llanta',13,'C',5,5,5,1,0,6,'1',0,60,NULL,2),(11,0,'1','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:44:25','2017-11-23 08:26:01','2017-11-23 08:26:01','2017-11-23 08:26:01','2017-11-23 08:26:01','rotura de rueda',1,'C',1,1,1,1,0,1,'',0,60,NULL,2),(12,0,'6','0000-00-00','0000-00-00 00:00:00','2017-11-14 15:23:31','2017-11-17 08:25:52','2017-11-28 08:25:52','2017-11-28 08:25:52','2017-11-28 08:25:52','Rotura de llanta',1,'C',3,3,3,1,0,6,'',0,60,NULL,2),(13,0,'6','0000-00-00','0000-00-00 00:00:00','2017-11-14 15:23:31','2017-12-22 08:26:22','2017-11-28 08:26:22','2017-11-28 08:26:22','2017-11-28 08:26:22','Rotura de llanta',1,'C',3,3,3,1,0,6,'',0,60,NULL,2),(14,0,'5','0000-00-00','0000-00-00 00:00:00','2017-11-08 12:53:19','2017-12-12 10:58:50','2017-11-28 10:58:50','2017-11-28 10:58:50','2017-11-28 10:58:50','observc test2',13,'C',3,3,3,1,0,5,'1',0,60,NULL,2),(15,NULL,'1','0000-00-00','0000-00-00 00:00:00','2017-12-07 10:44:25','2017-12-06 12:04:24','2017-11-28 12:04:24','2017-11-28 12:04:24','2017-11-28 12:04:24','rotura de rueda',1,'C',3,3,3,1,0,1,'2',0,60,NULL,2),(16,1,'3','0000-00-00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,1,0,1,0,0,'5',1,60,NULL,2),(17,1,'3','0000-00-00','0000-00-00 00:00:00','0000-00-00 00:00:00','2017-12-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'P',3,6,0,1,0,0,'5',1,60,NULL,2),(18,1,'1','0000-00-00','0000-00-00 00:00:00','2017-12-14 10:44:25','0000-00-00 00:00:00','2017-11-28 13:16:25','2017-11-28 13:16:25','2017-11-28 13:16:25','rotura de rueda',1,'As',3,0,3,1,2,1,'2',2,60,NULL,2),(19,1,'4','0000-00-00','0000-00-00 00:00:00','2017-12-30 00:00:00','2017-12-09 00:00:00','2017-12-10 00:00:00','0000-00-00 00:00:00','2018-07-21 00:00:00','Backlog',1,'E',3,1,0,1,0,0,'4',1,60,NULL,2),(20,1,'4','0000-00-00','0000-00-00 00:00:00','0002-01-08 20:00:00','2017-12-20 00:00:00','2017-12-18 00:00:00','0000-00-00 00:00:00','2017-12-27 00:00:00','Predictivo',1,'E',3,1,0,1,0,0,'5',1,60,NULL,2),(21,1,'4','0000-00-00','0000-00-00 00:00:00','2017-12-21 00:00:00','2017-12-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,4,0,1,0,0,'5',1,60,NULL,2),(22,NULL,'7','0000-00-00','0000-00-00 00:00:00','2017-12-01 05:35:25','2017-12-13 00:00:00','2017-12-01 05:35:44','2017-12-01 05:35:44','2017-12-01 05:35:44','Falla test sobre RS-0001 (01-12)',1,'As',3,6,3,1,0,7,'2',2,60,NULL,2),(23,1,'3','0000-00-00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'TE',1,1,0,1,0,0,'5',1,60,NULL,2),(25,NULL,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Preventivo',1,'C',1,0,0,1,0,0,'2',1,60,NULL,2),(26,1,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','2017-12-29 00:00:00','2017-12-27 00:00:00','0000-00-00 00:00:00','2018-07-22 00:00:00','Preventivo',1,'E',1,1,1,1,0,1,'2',1,60,NULL,2),(27,1,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','2017-12-28 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Preventivo',1,'As',1,6,1,1,0,0,'2',1,60,NULL,2),(28,1,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','2017-12-11 00:00:00','2017-12-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Preventivo',1,'T',1,1,1,1,0,0,'2',3,60,NULL,2),(29,1,'8','0000-00-00','0000-00-00 00:00:00','2017-12-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Backlog',1,'As',1,0,0,1,0,0,'4',3,60,NULL,2),(30,1,'','0000-00-00','0000-00-00 00:00:00','2017-02-01 00:00:00','2017-12-13 00:00:00','2017-12-12 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Preventivo',1,'T',1,1,1,1,0,0,'2',3,60,NULL,2),(31,1,'6','0000-00-00','0000-00-00 00:00:00','2017-12-11 00:00:00','2017-12-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',1,1,0,1,0,0,'5',2,60,NULL,2),(32,1,'6','0000-00-00','0000-00-00 00:00:00','2017-12-11 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',1,1,1,1,0,0,'5',2,60,NULL,2),(33,1,'6','0000-00-00','0000-00-00 00:00:00','2017-12-11 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',1,1,1,1,0,0,'5',2,60,NULL,2),(34,1,'6','0000-00-00','0000-00-00 00:00:00','2017-12-11 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',1,1,1,1,0,0,'5',2,60,NULL,2),(35,2,'9','0000-00-00','0000-00-00 00:00:00','2017-12-12 00:00:00','2017-12-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Backlog',1,'As',1,1,1,1,0,0,'4',2,60,NULL,2),(36,NULL,'100','0000-00-00','0000-00-00 00:00:00','2017-12-12 21:22:00','2017-12-13 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','prueba',1,'As',3,1,1,1,2,0,'1',2,60,NULL,2),(37,2,'9','0000-00-00','0000-00-00 00:00:00','2017-12-12 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Backlog',1,'As',1,1,1,1,0,0,'4',2,60,NULL,2),(38,1,'10','0000-00-00','0000-00-00 00:00:00','2018-01-10 00:00:00','0000-00-00 00:00:00','2018-01-12 00:00:00','0000-00-00 00:00:00','2018-01-12 00:00:00','Backlog',1,'E',1,1,1,1,0,0,'4',1,60,NULL,2),(39,1,'11','0000-00-00','0000-00-00 00:00:00','2018-01-20 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Backlog',1,'As',1,0,0,1,0,0,'4',2,60,NULL,2),(40,1,'2','0000-00-00','0000-00-00 00:00:00','2017-11-08 10:45:54','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','assdas',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(41,1,'9','0000-00-00','0000-00-00 00:00:00','2018-01-17 13:38:28','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite abajo del equipo ',1,'C',1,1,1,1,0,0,'',10,60,NULL,2),(42,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(43,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(46,1,'1','2018-01-29','2018-01-31 00:00:00','2017-11-14 15:23:31','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Rotura de llanta',1,'C',3,1,1,1,0,6,'2',2,60,NULL,2),(47,16,'1','2018-01-29','2018-01-30 00:00:00','2018-02-10 00:00:00','2018-03-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,5,1,1,0,8,'5',4,60,NULL,2),(48,1,'1','2018-01-29','2018-01-29 00:00:00','2017-12-01 05:35:25','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Falla test sobre RS-0001 (01-12)',1,'C',3,1,1,1,0,7,'2',2,60,NULL,2),(49,16,'1','2018-01-29','2018-01-29 00:00:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,8,'5',4,60,NULL,2),(50,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(51,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(52,NULL,'11','0000-00-00','0000-00-00 00:00:00','2018-01-18 18:07:20','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','mancha de aceite debajo del equipo',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(53,NULL,'12','0000-00-00','0000-00-00 00:00:00','2018-01-30 14:06:43','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','No tiene fuerza para levantar la carga',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(54,NULL,'12','0000-00-00','0000-00-00 00:00:00','2018-01-30 14:06:43','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','No tiene fuerza para levantar la carga',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(55,NULL,'12','0000-00-00','0000-00-00 00:00:00','2018-01-30 14:06:43','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','No tiene fuerza para levantar la carga',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(56,NULL,'7','0000-00-00','0000-00-00 00:00:00','2017-12-01 05:35:25','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Falla test sobre RS-0001 (01-12)',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(57,1,'1','2018-02-08','2018-02-08 00:00:00','2017-11-08 10:44:25','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','rotura de rueda',1,'C',1,1,1,1,0,1,'2',1,60,NULL,2),(58,NULL,'13','0000-00-00','0000-00-00 00:00:00','2018-02-05 19:01:38','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','bateria descargada\n\n',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(59,NULL,'15','0000-00-00','0000-00-00 00:00:00','2018-02-05 19:46:36','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','ggggjffufjffg',1,'C',1,1,1,1,0,0,'',0,60,NULL,2),(60,8,'1','2018-02-08','2018-01-08 15:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40',1,'C',1,1,1,1,0,16,'3',4,60,NULL,2),(61,4,'1','2018-02-08','2018-01-12 15:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,NULL,2),(62,4,'1','2018-02-17','2018-02-17 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(63,4,'1','2018-02-17','2018-03-04 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(64,4,'1','2018-02-17','2018-03-19 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(65,4,'1','2018-02-17','2018-04-03 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(66,4,'1','2018-02-17','2018-04-18 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(67,4,'1','2018-02-17','2018-05-03 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(68,4,'1','2018-02-17','2018-05-18 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(69,4,'1','2018-02-17','2018-06-02 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(70,4,'1','2018-02-17','2018-06-17 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(71,4,'1','2018-02-17','2018-07-02 11:01:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',3,1,1,1,0,11,'3',6,60,11,2),(72,16,'1','2018-02-17','2018-02-17 20:00:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,2),(73,16,'1','2018-02-17','2018-02-19 15:20:00','2018-02-10 00:00:00','2018-03-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,1,1,1,0,8,'5',4,60,8,2),(74,4,'1','2018-02-18','2018-02-18 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(75,4,'1','2018-02-18','2018-03-05 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(76,4,'1','2018-02-18','2018-03-20 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(77,4,'1','2018-02-18','2018-04-04 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(78,4,'1','2018-02-18','2018-04-19 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(79,4,'1','2018-02-18','2018-05-04 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(80,4,'1','2018-02-18','2018-05-19 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(81,4,'1','2018-02-18','2018-06-03 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(82,4,'1','2018-02-18','2018-06-18 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(83,4,'1','2018-02-18','2018-07-03 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(84,4,'1','2018-02-18','2018-07-18 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(85,4,'1','2018-02-18','2018-08-02 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(86,4,'1','2018-02-18','2018-08-17 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(87,4,'1','2018-02-18','2018-09-01 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(88,4,'1','2018-02-18','2018-09-16 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(89,4,'1','2018-02-18','2018-10-01 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(90,4,'1','2018-02-18','2018-10-16 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(91,4,'1','2018-02-18','2018-10-31 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(92,4,'1','2018-02-18','2018-11-15 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(93,4,'1','2018-02-18','2018-11-30 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(94,4,'1','2018-02-18','2018-12-15 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(95,4,'1','2018-02-18','2018-12-30 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(96,4,'1','2018-02-18','2019-01-14 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(97,4,'1','2018-02-18','2019-01-29 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(98,4,'1','2018-02-18','2019-02-13 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(99,4,'1','2018-02-18','2019-02-28 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(100,4,'1','2018-02-18','2019-03-15 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(101,4,'1','2018-02-18','2019-03-30 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(102,4,'1','2018-02-18','2019-04-14 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(103,4,'1','2018-02-18','2019-04-29 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(104,4,'1','2018-02-18','2019-05-14 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(105,4,'1','2018-02-18','2019-05-29 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(106,4,'1','2018-02-18','2019-06-13 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(107,4,'1','2018-02-18','2019-06-28 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(108,4,'1','2018-02-18','2019-07-13 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(109,4,'1','2018-02-18','2019-07-28 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(110,4,'1','2018-02-18','2019-08-12 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(111,4,'1','2018-02-18','2019-08-27 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(112,4,'1','2018-02-18','2019-09-11 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(113,4,'1','2018-02-18','2019-09-26 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(114,4,'1','2018-02-18','2019-10-11 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(115,4,'1','2018-02-18','2019-10-26 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(116,4,'1','2018-02-18','2019-11-10 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(117,4,'1','2018-02-18','2019-11-25 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(118,4,'1','2018-02-18','2019-12-10 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(119,4,'1','2018-02-18','2019-12-25 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(120,4,'1','2018-02-18','2020-01-09 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(121,4,'1','2018-02-18','2020-01-24 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(122,4,'1','2018-02-18','2020-02-08 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(123,4,'1','2018-02-18','2020-02-23 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(124,4,'1','2018-02-18','2020-03-09 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(125,4,'1','2018-02-18','2020-03-24 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(126,4,'1','2018-02-18','2020-04-08 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(127,4,'1','2018-02-18','2020-04-23 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(128,4,'1','2018-02-18','2020-05-08 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(129,4,'1','2018-02-18','2020-05-23 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(130,4,'1','2018-02-18','2020-06-07 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(131,4,'1','2018-02-18','2020-06-22 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(132,4,'1','2018-02-18','2020-07-07 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(133,4,'1','2018-02-18','2020-07-22 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(134,4,'1','2018-02-18','2020-08-06 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(135,4,'1','2018-02-18','2020-08-21 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(136,4,'1','2018-02-18','2020-09-05 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(137,4,'1','2018-02-18','2020-09-20 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(138,4,'1','2018-02-18','2020-10-05 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(139,4,'1','2018-02-18','2020-10-20 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(140,4,'1','2018-02-18','2020-11-04 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(141,4,'1','2018-02-18','2020-11-19 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(142,4,'1','2018-02-18','2020-12-04 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(143,4,'1','2018-02-18','2020-12-19 12:59:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(144,5,'1','2018-02-18','2018-02-18 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(145,5,'1','2018-02-18','2018-03-20 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(146,5,'1','2018-02-18','2018-04-19 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(147,5,'1','2018-02-18','2018-05-19 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(148,5,'1','2018-02-18','2018-06-18 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(149,5,'1','2018-02-18','2018-07-18 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(150,5,'1','2018-02-18','2018-08-17 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(151,5,'1','2018-02-18','2018-09-16 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(152,5,'1','2018-02-18','2018-10-16 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(153,5,'1','2018-02-18','2018-11-15 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(154,5,'1','2018-02-18','2018-12-15 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(155,5,'1','2018-02-18','2019-01-14 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(156,5,'1','2018-02-18','2019-02-13 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(157,5,'1','2018-02-18','2019-03-15 01:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(158,5,'1','2018-02-19','2018-02-19 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(159,5,'1','2018-02-19','2018-02-26 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(160,5,'1','2018-02-19','2018-03-05 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(161,5,'1','2018-02-19','2018-03-12 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(162,5,'1','2018-02-19','2018-03-19 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(163,5,'1','2018-02-19','2018-03-26 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(164,5,'1','2018-02-19','2018-04-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(165,5,'1','2018-02-19','2018-04-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(166,5,'1','2018-02-19','2018-04-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(167,5,'1','2018-02-19','2018-04-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(168,5,'1','2018-02-19','2018-04-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(169,5,'1','2018-02-19','2018-05-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(170,5,'1','2018-02-19','2018-05-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(171,5,'1','2018-02-19','2018-05-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(172,5,'1','2018-02-19','2018-05-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(173,5,'1','2018-02-19','2018-06-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(174,5,'1','2018-02-19','2018-06-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(175,5,'1','2018-02-19','2018-06-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(176,5,'1','2018-02-19','2018-06-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(177,5,'1','2018-02-19','2018-07-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(178,5,'1','2018-02-19','2018-07-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(179,5,'1','2018-02-19','2018-07-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(180,5,'1','2018-02-19','2018-07-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(181,5,'1','2018-02-19','2018-07-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(182,5,'1','2018-02-19','2018-08-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(183,5,'1','2018-02-19','2018-08-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(184,5,'1','2018-02-19','2018-08-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(185,5,'1','2018-02-19','2018-08-27 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(186,5,'1','2018-02-19','2018-09-03 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(187,5,'1','2018-02-19','2018-09-10 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(188,5,'1','2018-02-19','2018-09-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(189,5,'1','2018-02-19','2018-09-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(190,5,'1','2018-02-19','2018-10-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(191,5,'1','2018-02-19','2018-10-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(192,5,'1','2018-02-19','2018-10-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(193,5,'1','2018-02-19','2018-10-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(194,5,'1','2018-02-19','2018-10-29 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(195,5,'1','2018-02-19','2018-11-05 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(196,5,'1','2018-02-19','2018-11-12 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(197,5,'1','2018-02-19','2018-11-19 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(198,5,'1','2018-02-19','2018-11-26 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(199,5,'1','2018-02-19','2018-12-03 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(200,5,'1','2018-02-19','2018-12-10 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(201,5,'1','2018-02-19','2018-12-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(202,5,'1','2018-02-19','2018-12-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(203,5,'1','2018-02-19','2018-12-31 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(204,5,'1','2018-02-19','2019-01-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(205,5,'1','2018-02-19','2019-01-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(206,5,'1','2018-02-19','2019-01-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(207,5,'1','2018-02-19','2019-01-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(208,5,'1','2018-02-19','2019-02-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(209,5,'1','2018-02-19','2019-02-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(210,5,'1','2018-02-19','2019-02-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(211,5,'1','2018-02-19','2019-02-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(212,5,'1','2018-02-19','2019-03-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(213,5,'1','2018-02-19','2019-03-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(214,5,'1','2018-02-19','2019-03-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(215,5,'1','2018-02-19','2019-03-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(216,5,'1','2018-02-19','2019-04-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(217,5,'1','2018-02-19','2019-04-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(218,5,'1','2018-02-19','2019-04-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(219,5,'1','2018-02-19','2019-04-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(220,5,'1','2018-02-19','2019-04-29 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(221,5,'1','2018-02-19','2019-05-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(222,5,'1','2018-02-19','2019-05-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(223,5,'1','2018-02-19','2019-05-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(224,5,'1','2018-02-19','2019-05-27 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(225,5,'1','2018-02-19','2019-06-03 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(226,5,'1','2018-02-19','2019-06-10 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(227,5,'1','2018-02-19','2019-06-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(228,5,'1','2018-02-19','2019-06-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(229,5,'1','2018-02-19','2019-07-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(230,5,'1','2018-02-19','2019-07-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(231,5,'1','2018-02-19','2019-07-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(232,5,'1','2018-02-19','2019-07-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(233,5,'1','2018-02-19','2019-07-29 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(234,5,'1','2018-02-19','2019-08-05 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(235,5,'1','2018-02-19','2019-08-12 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(236,5,'1','2018-02-19','2019-08-19 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(237,5,'1','2018-02-19','2019-08-26 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(238,5,'1','2018-02-19','2019-09-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(239,5,'1','2018-02-19','2019-09-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(240,5,'1','2018-02-19','2019-09-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(241,5,'1','2018-02-19','2019-09-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(242,5,'1','2018-02-19','2019-09-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(243,5,'1','2018-02-19','2019-10-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(244,5,'1','2018-02-19','2019-10-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(245,5,'1','2018-02-19','2019-10-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(246,5,'1','2018-02-19','2019-10-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(247,5,'1','2018-02-19','2019-11-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(248,5,'1','2018-02-19','2019-11-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(249,5,'1','2018-02-19','2019-11-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(250,5,'1','2018-02-19','2019-11-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(251,5,'1','2018-02-19','2019-12-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(252,5,'1','2018-02-19','2019-12-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(253,5,'1','2018-02-19','2019-12-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(254,5,'1','2018-02-19','2019-12-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(255,5,'1','2018-02-19','2019-12-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(256,5,'1','2018-02-19','2020-01-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(257,5,'1','2018-02-19','2020-01-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(258,5,'1','2018-02-19','2020-01-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(259,5,'1','2018-02-19','2020-01-27 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(260,5,'1','2018-02-19','2020-02-03 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(261,5,'1','2018-02-19','2020-02-10 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(262,5,'1','2018-02-19','2020-02-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(263,5,'1','2018-02-19','2020-02-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(264,5,'1','2018-02-19','2020-03-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(265,5,'1','2018-02-19','2020-03-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(266,5,'1','2018-02-19','2020-03-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(267,5,'1','2018-02-19','2020-03-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(268,5,'1','2018-02-19','2020-03-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(269,5,'1','2018-02-19','2020-04-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(270,5,'1','2018-02-19','2020-04-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(271,5,'1','2018-02-19','2020-04-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(272,5,'1','2018-02-19','2020-04-27 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(273,5,'1','2018-02-19','2020-05-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(274,5,'1','2018-02-19','2020-05-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(275,5,'1','2018-02-19','2020-05-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(276,5,'1','2018-02-19','2020-05-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(277,5,'1','2018-02-19','2020-06-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(278,5,'1','2018-02-19','2020-06-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(279,5,'1','2018-02-19','2020-06-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(280,5,'1','2018-02-19','2020-06-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(281,5,'1','2018-02-19','2020-06-29 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(282,5,'1','2018-02-19','2020-07-06 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(283,5,'1','2018-02-19','2020-07-13 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(284,5,'1','2018-02-19','2020-07-20 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(285,5,'1','2018-02-19','2020-07-27 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(286,5,'1','2018-02-19','2020-08-03 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(287,5,'1','2018-02-19','2020-08-10 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(288,5,'1','2018-02-19','2020-08-17 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(289,5,'1','2018-02-19','2020-08-24 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(290,5,'1','2018-02-19','2020-08-31 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(291,5,'1','2018-02-19','2020-09-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(292,5,'1','2018-02-19','2020-09-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(293,5,'1','2018-02-19','2020-09-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(294,5,'1','2018-02-19','2020-09-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(295,5,'1','2018-02-19','2020-10-05 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(296,5,'1','2018-02-19','2020-10-12 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(297,5,'1','2018-02-19','2020-10-19 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(298,5,'1','2018-02-19','2020-10-26 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(299,5,'1','2018-02-19','2020-11-02 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(300,5,'1','2018-02-19','2020-11-09 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(301,5,'1','2018-02-19','2020-11-16 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(302,5,'1','2018-02-19','2020-11-23 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(303,5,'1','2018-02-19','2020-11-30 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(304,5,'1','2018-02-19','2020-12-07 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(305,5,'1','2018-02-19','2020-12-14 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(306,5,'1','2018-02-19','2020-12-21 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(307,5,'1','2018-02-19','2020-12-28 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(308,5,'1','2018-02-19','2021-01-04 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(309,5,'1','2018-02-19','2021-01-11 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(310,5,'1','2018-02-19','2021-01-18 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(311,5,'1','2018-02-19','2021-01-25 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(312,5,'1','2018-02-19','2021-02-01 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(313,5,'1','2018-02-19','2021-02-08 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(314,5,'1','2018-02-19','2021-02-15 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(315,5,'1','2018-02-19','2021-02-22 03:30:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(316,5,'1','2018-02-19','2018-02-19 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(317,5,'1','2018-02-19','2018-02-26 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(318,5,'1','2018-02-19','2018-03-07 08:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(319,5,'1','2018-02-19','2018-03-12 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,240,12,0),(320,5,'1','2018-02-19','2018-03-19 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(321,5,'1','2018-02-19','2018-03-26 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(322,5,'1','2018-02-19','2018-04-02 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(323,5,'1','2018-02-19','2018-04-09 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(324,5,'1','2018-02-19','2018-04-16 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(325,5,'1','2018-02-19','2018-04-23 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(326,5,'1','2018-02-19','2018-04-30 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(327,5,'1','2018-02-19','2018-05-07 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(328,5,'1','2018-02-19','2018-05-14 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(329,5,'1','2018-02-19','2018-05-21 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(330,5,'1','2018-02-19','2018-05-28 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(331,5,'1','2018-02-19','2018-06-04 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(332,5,'1','2018-02-19','2018-06-11 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(333,5,'1','2018-02-19','2018-06-18 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(334,5,'1','2018-02-19','2018-06-25 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(335,5,'1','2018-02-19','2018-07-02 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(336,5,'1','2018-02-19','2018-07-09 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(337,5,'1','2018-02-19','2018-07-16 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(338,5,'1','2018-02-19','2018-07-23 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(339,5,'1','2018-02-19','2018-07-30 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(340,5,'1','2018-02-19','2018-08-06 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(341,5,'1','2018-02-19','2018-08-13 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,2),(342,5,'1','2018-02-19','2018-08-20 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(343,5,'1','2018-02-19','2018-08-27 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(344,5,'1','2018-02-19','2018-09-03 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(345,5,'1','2018-02-19','2018-09-10 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(346,5,'1','2018-02-19','2018-09-17 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(347,5,'1','2018-02-19','2018-09-24 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(348,5,'1','2018-02-19','2018-10-01 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(349,5,'1','2018-02-19','2018-10-08 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(350,5,'1','2018-02-19','2018-10-15 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(351,5,'1','2018-02-19','2018-10-22 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(352,5,'1','2018-02-19','2018-10-29 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(353,5,'1','2018-02-19','2018-11-05 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(354,5,'1','2018-02-19','2018-11-12 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(355,5,'1','2018-02-19','2018-11-19 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(356,5,'1','2018-02-19','2018-11-26 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(357,5,'1','2018-02-19','2018-12-03 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(358,5,'1','2018-02-19','2018-12-10 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(359,5,'1','2018-02-19','2018-12-17 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(360,5,'1','2018-02-19','2018-12-24 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(361,5,'1','2018-02-19','2018-12-31 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(362,5,'1','2018-02-19','2019-01-07 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(363,5,'1','2018-02-19','2019-01-14 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(364,5,'1','2018-02-19','2019-01-21 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(365,5,'1','2018-02-19','2019-01-28 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(366,5,'1','2018-02-19','2019-02-04 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(367,5,'1','2018-02-19','2019-02-11 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(368,5,'1','2018-02-19','2019-02-18 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(369,5,'1','2018-02-19','2019-02-25 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(370,5,'1','2018-02-19','2019-03-04 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(371,5,'1','2018-02-19','2019-03-11 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(372,5,'1','2018-02-19','2019-03-18 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(373,5,'1','2018-02-19','2019-03-25 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(374,5,'1','2018-02-19','2019-04-01 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(375,5,'1','2018-02-19','2019-04-08 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(376,5,'1','2018-02-19','2019-04-15 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(377,5,'1','2018-02-19','2019-04-22 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(378,5,'1','2018-02-19','2019-04-29 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(379,5,'1','2018-02-19','2019-05-06 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(380,5,'1','2018-02-19','2019-05-13 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(381,5,'1','2018-02-19','2019-05-20 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(382,5,'1','2018-02-19','2019-05-27 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(383,5,'1','2018-02-19','2019-06-03 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(384,5,'1','2018-02-19','2019-06-10 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(385,5,'1','2018-02-19','2019-06-17 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(386,5,'1','2018-02-19','2019-06-24 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(387,5,'1','2018-02-19','2019-07-01 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(388,5,'1','2018-02-19','2019-07-08 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(389,5,'1','2018-02-19','2019-07-15 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(390,5,'1','2018-02-19','2019-07-22 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(391,5,'1','2018-02-19','2019-07-29 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(392,5,'1','2018-02-19','2019-08-05 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(393,5,'1','2018-02-19','2019-08-12 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(394,5,'1','2018-02-19','2019-08-19 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(395,5,'1','2018-02-19','2019-08-26 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(396,5,'1','2018-02-19','2019-09-02 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(397,5,'1','2018-02-19','2019-09-09 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(398,5,'1','2018-02-19','2019-09-16 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(399,5,'1','2018-02-19','2019-09-23 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(400,5,'1','2018-02-19','2019-09-30 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(401,5,'1','2018-02-19','2019-10-07 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(402,5,'1','2018-02-19','2019-10-14 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(403,5,'1','2018-02-19','2019-10-21 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(404,5,'1','2018-02-19','2019-10-28 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(405,5,'1','2018-02-19','2019-11-04 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(406,5,'1','2018-02-19','2019-11-11 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(407,5,'1','2018-02-19','2019-11-18 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(408,5,'1','2018-02-19','2019-11-25 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(409,5,'1','2018-02-19','2019-12-02 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(410,5,'1','2018-02-19','2019-12-09 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(411,5,'1','2018-02-19','2019-12-16 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(412,5,'1','2018-02-19','2019-12-23 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(413,5,'1','2018-02-19','2019-12-30 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(414,5,'1','2018-02-19','2020-01-06 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(415,5,'1','2018-02-19','2020-01-13 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(416,5,'1','2018-02-19','2020-01-20 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(417,5,'1','2018-02-19','2020-01-27 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(418,5,'1','2018-02-19','2020-02-03 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(419,5,'1','2018-02-19','2020-02-10 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(420,5,'1','2018-02-19','2020-02-17 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(421,5,'1','2018-02-19','2020-02-24 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,12,'3',4,60,12,0),(422,4,'1','2018-02-19','2018-02-20 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(423,4,'1','2018-02-19','2018-03-05 07:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,150,11,0),(424,4,'1','2018-02-19','2018-03-22 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(425,4,'1','2018-02-19','2018-04-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(426,4,'1','2018-02-19','2018-04-21 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(427,4,'1','2018-02-19','2018-05-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(428,4,'1','2018-02-19','2018-05-21 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(429,4,'1','2018-02-19','2018-06-05 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(430,4,'1','2018-02-19','2018-06-20 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(431,4,'1','2018-02-19','2018-07-05 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(432,4,'1','2018-02-19','2018-07-20 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(433,4,'1','2018-02-19','2018-08-04 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,2),(434,4,'1','2018-02-19','2018-08-19 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(435,4,'1','2018-02-19','2018-09-03 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(436,4,'1','2018-02-19','2018-09-18 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(437,4,'1','2018-02-19','2018-10-03 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(438,4,'1','2018-02-19','2018-10-18 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(439,4,'1','2018-02-19','2018-11-02 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(440,4,'1','2018-02-19','2018-11-17 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(441,4,'1','2018-02-19','2018-12-02 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(442,4,'1','2018-02-19','2018-12-17 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(443,4,'1','2018-02-19','2019-01-01 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(444,4,'1','2018-02-19','2019-01-16 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(445,4,'1','2018-02-19','2019-01-31 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(446,4,'1','2018-02-19','2019-02-15 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(447,4,'1','2018-02-19','2019-03-02 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(448,4,'1','2018-02-19','2019-03-17 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(449,4,'1','2018-02-19','2019-04-01 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(450,4,'1','2018-02-19','2019-04-16 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(451,4,'1','2018-02-19','2019-05-01 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(452,4,'1','2018-02-19','2019-05-16 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(453,4,'1','2018-02-19','2019-05-31 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(454,4,'1','2018-02-19','2019-06-15 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(455,4,'1','2018-02-19','2019-06-30 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(456,4,'1','2018-02-19','2019-07-15 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(457,4,'1','2018-02-19','2019-07-30 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(458,4,'1','2018-02-19','2019-08-14 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(459,4,'1','2018-02-19','2019-08-29 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(460,4,'1','2018-02-19','2019-09-13 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(461,4,'1','2018-02-19','2019-09-28 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(462,4,'1','2018-02-19','2019-10-13 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(463,4,'1','2018-02-19','2019-10-28 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(464,4,'1','2018-02-19','2019-11-12 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(465,4,'1','2018-02-19','2019-11-27 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(466,4,'1','2018-02-19','2019-12-12 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(467,4,'1','2018-02-19','2019-12-27 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(468,4,'1','2018-02-19','2020-01-11 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(469,4,'1','2018-02-19','2020-01-26 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(470,4,'1','2018-02-19','2020-02-10 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(471,4,'1','2018-02-19','2020-02-25 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(472,4,'1','2018-02-19','2020-03-11 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(473,4,'1','2018-02-19','2020-03-26 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(474,4,'1','2018-02-19','2020-04-10 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(475,4,'1','2018-02-19','2020-04-25 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(476,4,'1','2018-02-19','2020-05-10 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(477,4,'1','2018-02-19','2020-05-25 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(478,4,'1','2018-02-19','2020-06-09 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(479,4,'1','2018-02-19','2020-06-24 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(480,4,'1','2018-02-19','2020-07-09 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(481,4,'1','2018-02-19','2020-07-24 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(482,4,'1','2018-02-19','2020-08-08 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(483,4,'1','2018-02-19','2020-08-23 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(484,4,'1','2018-02-19','2020-09-07 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(485,4,'1','2018-02-19','2020-09-22 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(486,4,'1','2018-02-19','2020-10-07 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(487,4,'1','2018-02-19','2020-10-22 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(488,4,'1','2018-02-19','2020-11-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(489,4,'1','2018-02-19','2020-11-21 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(490,4,'1','2018-02-19','2020-12-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(491,4,'1','2018-02-19','2020-12-21 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(492,4,'1','2018-02-19','2021-01-05 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(493,4,'1','2018-02-19','2021-01-20 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(494,4,'1','2018-02-19','2021-02-04 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(495,4,'1','2018-02-19','2021-02-19 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(496,4,'1','2018-02-19','2021-03-06 09:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.',1,'C',1,1,1,1,0,11,'3',6,60,11,0),(497,16,'1','2018-02-19','2018-02-19 12:02:00','2018-02-10 00:00:00','2018-03-01 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'As',3,1,1,1,0,8,'5',4,60,8,0),(498,16,'1','2018-02-19','2018-02-28 12:02:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,0),(499,16,'1','2018-02-19','2018-03-30 12:02:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,0),(500,16,'1','2018-02-19','2018-04-29 12:02:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,0),(501,16,'1','2018-02-19','2018-05-29 12:02:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,2),(502,16,'1','2018-02-19','2018-02-21 11:23:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,0),(503,16,'1','2018-02-19','2018-03-23 11:23:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,0),(504,16,'1','2018-02-19','2018-04-22 11:23:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,0),(505,16,'1','2018-02-19','2018-02-22 12:22:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,0),(506,16,'1','2018-02-19','2018-03-24 12:22:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,0),(507,16,'1','2018-02-19','2018-04-23 12:22:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,0),(508,16,'1','2018-02-19','2018-05-23 12:22:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',3,1,1,1,0,8,'5',4,60,8,2),(509,12,'1','2018-02-26','2018-02-14 11:00:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL DEP√ìSITO DE COMBUSTIBLE.',1,'C',1,1,1,1,0,14,'4',4,60,14,0),(510,1,'1','2018-02-26','2018-02-05 15:00:00','2018-02-05 19:01:38','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','bateria descargada\n\n',1,'C',1,1,1,1,0,13,'2',9,60,13,0),(511,1,'1','2018-02-26','2018-02-23 17:00:00','2018-02-08 14:38:14','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Ruido en cuerpo de bomba int 0057A',1,'C',1,1,1,1,0,17,'2',10,60,17,0),(512,1,'1','2018-02-26','2018-02-21 22:00:00','2018-02-05 19:01:38','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','bateria descargada\n\n',1,'C',1,1,1,1,0,13,'2',9,60,13,0),(513,5,'1','2018-02-26','2018-02-23 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,0),(514,5,'1','2018-02-26','2018-03-25 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(515,5,'1','2018-02-26','2018-04-24 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(516,5,'1','2018-02-26','2018-05-24 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(517,5,'1','2018-02-26','2018-06-23 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(518,5,'1','2018-02-26','2018-07-23 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(519,5,'1','2018-02-26','2018-08-22 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(520,5,'1','2018-02-26','2018-09-21 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(521,5,'1','2018-02-26','2018-10-21 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(522,5,'1','2018-02-26','2018-11-20 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(523,5,'1','2018-02-26','2018-12-20 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(524,5,'1','2018-02-26','2019-01-19 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(525,5,'1','2018-02-26','2019-02-18 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(526,5,'1','2018-02-26','2019-03-20 16:00:00','2018-01-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','REVISE LA BOMBA DE AGUA',1,'C',1,1,1,1,0,22,'3',6,60,22,2),(527,12,'1','2018-02-26','2018-02-22 19:00:00','2018-02-10 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','LIMPIE EL DEP√ìSITO DE COMBUSTIBLE.',1,'C',1,1,1,1,0,14,'4',4,60,14,2),(528,8,'1','2018-03-09','2018-03-22 02:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40',1,'C',1,1,1,1,0,16,'3',4,30,16,2),(529,9,'1','2018-03-10','2018-03-14 00:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','CAMBIE LOS FILTROS DE ACEITE.',1,'C',1,1,1,1,0,17,'3',4,0,17,2),(530,8,'1','2018-03-12','2018-03-12 01:00:00','2018-01-18 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40',1,'C',1,1,1,1,0,16,'3',4,0,16,2),(531,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-03-12 05:28:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','weqeqwqweqweqwewqeqwe\neqweqweqwe\nqweqw',1,'C',1,1,0,1,2,0,'1',4,0,NULL,2),(532,NULL,'','0000-00-00','0000-00-00 00:00:00','2018-03-12 14:17:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','hdlhcfdlachlhcls',1,'C',1,1,0,1,1,0,'1',8,0,NULL,2),(533,15,'1','2018-07-24','2018-07-27 23:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(534,15,'1','2018-07-24','2018-07-24 11:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(535,15,'1','2018-07-26','2018-07-26 18:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(536,15,'1','2018-07-28','2018-07-29 08:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(537,15,'1','2018-07-28','2018-09-18 08:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(538,15,'1','2018-07-28','2018-11-08 08:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(539,15,'1','2018-07-28','2018-12-29 08:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(540,15,'1','2018-07-28','2019-02-18 08:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(541,15,'1','2018-07-28','2019-04-10 08:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(542,15,'1','2018-07-28','2019-05-31 08:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(543,15,'1','2018-07-28','2019-07-21 08:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2),(544,15,'1','2018-07-28','2019-09-10 08:00:00','0002-07-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Predictivo',1,'C',1,1,1,1,0,7,'5',4,0,7,2);
/*!40000 ALTER TABLE `orden_trabajo` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametroequipo`
--

LOCK TABLES `parametroequipo` WRITE;
/*!40000 ALTER TABLE `parametroequipo` DISABLE KEYS */;
INSERT INTO `parametroequipo` VALUES (1,8,1,'67','2017-11-09 16:09:02',2),(2,8,1,'56','2017-11-16 08:57:55',2),(3,8,1,'23','2017-11-21 11:44:46',2),(4,8,1,'150','2017-11-29 04:38:11',2),(5,8,2,'222','2017-11-29 04:39:02',2),(6,8,2,'34','2017-12-02 03:01:45',2),(7,8,2,'34','2017-12-02 03:02:41',2),(8,8,2,'45','2017-12-02 03:02:59',2),(9,4,2,'34','2017-12-02 03:26:30',2),(10,4,2,'45','2017-12-02 03:33:22',2),(11,4,2,'444','2017-12-02 03:43:37',2),(12,4,2,'56','2017-12-02 03:45:01',2),(13,4,2,'56','2017-12-02 03:45:59',2),(14,4,3,'45','2017-12-02 03:50:41',2),(15,4,3,'55555','2017-12-02 04:25:07',2),(16,4,3,'444','2017-12-02 04:27:55',2),(17,3,3,'445','2017-12-02 04:58:08',2),(18,1,3,'12','2017-12-02 05:02:48',2),(19,1,3,'45','2017-12-02 06:46:42',2),(20,1,1,'78','2017-12-11 04:50:13',2),(21,1,2,'12','2017-12-11 04:50:23',2),(22,1,1,'25','2017-12-11 04:56:50',2),(23,8,2,'34','2017-12-11 11:28:24',2),(24,8,2,'45','2017-12-11 11:28:40',2),(25,1,2,'34','2017-12-11 11:29:00',2),(26,2,1,'44','2017-12-11 11:29:15',2),(27,8,2,'444','2017-12-11 11:29:29',2),(28,8,4,'45','2018-02-08 17:55:28',2),(29,8,4,'67','2018-02-08 17:56:05',2),(30,0,0,'','0000-00-00 00:00:00',0),(31,0,0,'','0000-00-00 00:00:00',0),(32,8,1,'13','2018-07-21 02:55:00',0),(33,8,1,'23','2018-07-22 17:57:34',0),(34,8,2,'12','2018-07-22 17:57:59',0),(35,8,2,'25','2018-07-22 17:58:20',0),(36,8,1,'23','2018-07-22 18:17:33',0),(37,8,1,'12','2018-07-22 18:31:30',0),(38,8,1,'33','2018-07-22 18:33:02',0),(39,8,1,'12','2018-07-22 18:33:53',0),(40,8,1,'33','2018-07-22 18:34:04',0),(41,8,1,'12','2018-07-22 18:39:43',0),(42,8,2,'13','2018-07-22 18:39:56',0),(43,8,2,'9','2018-07-22 18:40:05',0),(44,8,1,'12','2018-07-22 18:42:17',0),(45,8,1,'12','2018-07-22 18:43:11',0),(46,8,1,'12','2018-07-22 18:44:46',0),(47,8,2,'12','2018-07-22 18:45:32',0),(48,8,1,'33','2018-07-22 20:23:36',0),(49,8,1,'33','2018-07-22 20:25:50',0);
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
  `estado` varchar(45) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`paramId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (8,'Temperatura',NULL,'AN',2),(13,'Humedad',NULL,'AC',2),(14,'Presi√≥n',NULL,'AC',2),(15,'Vibraci√≥n',NULL,'AC',2),(16,'asdasd',NULL,'AN',2),(17,'test',NULL,'AN',2);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
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
  `pred_canth` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`predId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predictivo`
--

LOCK TABLES `predictivo` WRITE;
/*!40000 ALTER TABLE `predictivo` DISABLE KEYS */;
INSERT INTO `predictivo` VALUES (1,1,'nueva tarea ','2017-11-07','Diario',30,NULL,'C',0,0,2),(2,2,'tarea 2:prueba','0000-00-00','Diario',15,NULL,'C',0,0,2),(3,1,'1','0000-00-00','Periodos',15,NULL,'C',0,0,2),(4,1,'1','2017-11-24','Diario',15,NULL,'AN',0,0,2),(5,1,'1','2017-12-09','Diario',23,NULL,'C',0,0,2),(6,2,'1','2017-12-11','Diario',20,5,'C',0,0,2),(7,4,'15','0002-07-08','Mensual',51,1,'C',0,0,2),(8,4,'16','2018-02-10','Diario',30,0,'C',0,0,2);
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
  `horash` time DEFAULT NULL,
  `estadoprev` char(255) DEFAULT NULL,
  `prev_duracion` double NOT NULL,
  `prev_canth` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`prevId`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_tarea` (`id_tarea`),
  KEY `id_componente` (`id_componente`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preventivo`
--

LOCK TABLES `preventivo` WRITE;
/*!40000 ALTER TABLE `preventivo` DISABLE KEYS */;
INSERT INTO `preventivo` VALUES (1,1,1,'diario',30,'2017-10-01',1,29,NULL,'00:00:00','AN',0,0,2),(2,1,1,'diario',30,'2017-11-23',1,20,NULL,'00:00:00','AN',0,0,2),(3,1,2,'diario',15,'0000-00-00',1,0,NULL,'00:00:15','AN',0,0,2),(4,3,1,'diario',90,'2017-12-04',3,0,NULL,'00:00:00','AN',0,0,2),(5,3,1,'diario',30,'2017-12-05',4,0,NULL,'00:00:00','C',0,0,2),(6,3,1,'diario',45,'2017-12-05',3,0,NULL,'00:00:00','C',0,0,2),(7,3,2,'diario',30,'2017-12-05',3,0,NULL,'00:00:00','C',0,0,2),(8,3,2,'diario',30,'2017-12-06',3,0,NULL,'00:00:00','C',0,0,2),(9,1,1,'diario',30,'2018-01-18',1,0,NULL,'00:00:00','AN',0,0,2),(10,3,1,'diario',23,'2018-01-18',4,0,NULL,'00:00:23','C',0,0,2),(11,6,4,'diario',15,'2018-01-18',13,0,NULL,'00:00:00','C',0,0,2),(12,4,5,'diario',7,'2018-01-18',13,0,NULL,'00:00:00','C',0,0,2),(13,4,6,'diario',7,'2018-01-18',13,0,NULL,'16:00:15','C',0,0,2),(14,4,5,'diario',30,'2018-01-18',13,0,NULL,'00:00:00','C',0,0,2),(15,1,7,'diario',30,'2018-01-18',13,0,NULL,'00:00:00','AN',0,0,2),(16,4,8,'diario',60,'2018-01-18',13,0,NULL,'00:00:02','C',0,0,2),(17,4,9,'diario',60,'2018-01-18',13,0,NULL,'00:00:01','C',0,0,2),(18,4,10,'diario',60,'2018-01-18',13,0,NULL,'00:00:00','C',0,0,2),(19,4,12,'diario',365,'2018-01-18',13,0,NULL,'00:00:08','C',0,0,2),(20,4,13,'diario',7,'2018-01-18',13,0,NULL,'00:00:00','C',0,0,2),(21,4,14,'diario',7,'2018-01-18',13,0,NULL,'00:00:00','C',0,0,2),(22,6,5,'diario',30,'2018-01-25',13,0,NULL,'15:00:15','C',0,0,2);
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
  `id_empresa` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_proceso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso`
--

LOCK TABLES `proceso` WRITE;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
INSERT INTO `proceso` VALUES (1,'un proceso nuevo 1','2','AC'),(2,'Proceso 00-2017','2','AC'),(3,'Extracci√≥n y Transporte','2','AC'),(4,'666','2','AN'),(5,'Proceso 01','2','AN'),(6,'747','2','AN');
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`remitoId`),
  KEY `provid` (`provid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitos`
--

LOCK TABLES `remitos` WRITE;
/*!40000 ALTER TABLE `remitos` DISABLE KEYS */;
INSERT INTO `remitos` VALUES (1,'0000-00-00 00:00:00',1,'233',2),(2,'0000-00-00 00:00:00',1,'',2),(3,'2018-07-01 00:00:00',1,'123',2),(4,'2018-06-29 00:00:00',2,'4555',2),(5,'2018-07-02 00:00:00',1,'234',2),(6,'2018-07-02 00:00:00',2,'123',2);
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
  `estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_sector`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'Planta','AC',2),(3,'Administraci√≥n','AC',2),(4,'Perforaci√≥n','AC',2),(5,'test','AN',2),(6,'Auxiliar','AC',2),(12,'666','AC',2),(13,'Sector A4','AN',2),(14,'sector 56','AN',2),(15,'747','AC',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
INSERT INTO `seguro` VALUES (1,'empresa xxx',1111111,11112221,'2017-07-10 00:00:00','2017-07-18 00:00:00','12 dias',5),(2,'1',123,123,'2017-07-10 00:00:00','2017-07-25 00:00:00','1234',6),(3,'123 juan peres',1234,12345,'2017-07-10 00:00:00','2017-07-10 00:00:00','123456',1),(4,'gemma empresa',33333321,2147483647,'2017-07-12 00:00:00','2017-07-12 00:00:00','A',0),(5,'gemme empresa2',52652,500001,'2017-07-12 00:00:00','2017-07-12 00:00:00','A',0),(242,'empres hugo pepe',1414,14145,'2017-07-12 00:00:00','2017-07-12 00:00:00','12 dias',0),(243,'gemma nueva empresa',56213,56213000,'2017-07-12 00:00:00','2017-07-12 00:00:00','1 meses',0),(244,'nueva emresa julieta 34434',45454,45454,'2017-07-12 00:00:00','2017-07-12 00:00:00','10 dias',0),(245,'gemma nueva emresa 41 poliza',54540,545401,'2017-07-12 00:00:00','2017-07-26 00:00:00','5 dias',242);
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
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupparam`
--

LOCK TABLES `setupparam` WRITE;
/*!40000 ALTER TABLE `setupparam` DISABLE KEYS */;
INSERT INTO `setupparam` VALUES (1,11,96,20,2),(2,11,80,10,2),(2,11,39,56,2),(4,8,10,20,2),(2,8,12,3,2),(4,15,12,3,6),(1,8,120,80,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisgroups`
--

LOCK TABLES `sisgroups` WRITE;
/*!40000 ALTER TABLE `sisgroups` DISABLE KEYS */;
INSERT INTO `sisgroups` VALUES (1,'Administrador','Otrabajo',2),(2,'Vendedores','Sservicio',2),(3,'Dep√≥sito','Sservicio',2),(4,'Operario1','Sservicio',2),(5,'Supervisor de Taller','Sservicio',2),(7,'GRUPO TEST','Grafica',2),(8,'666','Cliente',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisgroupsactions`
--

LOCK TABLES `sisgroupsactions` WRITE;
/*!40000 ALTER TABLE `sisgroupsactions` DISABLE KEYS */;
INSERT INTO `sisgroupsactions` VALUES (154,151,1),(158,158,1),(159,159,1),(160,160,1),(841,1,6),(842,1,7),(843,1,8),(844,1,9),(845,1,10),(846,1,11),(847,1,12),(848,1,13),(849,1,14),(850,1,15),(851,1,16),(852,1,17),(853,1,18),(854,1,19),(855,1,20),(856,1,21),(857,1,23),(858,1,24),(859,1,25),(860,1,151),(861,1,26),(862,1,27),(863,1,28),(864,1,29),(865,1,30),(866,1,31),(867,1,32),(868,1,33),(869,1,34),(870,1,35),(871,1,36),(872,1,37),(873,1,38),(874,1,39),(875,1,40),(876,1,41),(877,1,42),(878,1,43),(879,1,115),(880,1,116),(881,1,117),(882,1,155),(883,1,156),(884,1,157),(885,1,118),(886,1,119),(887,1,120),(888,1,121),(889,1,122),(890,1,123),(891,1,152),(892,1,153),(893,1,154),(894,1,177),(895,1,178),(896,1,179),(897,1,180),(898,1,64),(899,1,65),(900,1,66),(901,1,67),(902,1,68),(903,1,69),(904,1,70),(905,1,71),(906,1,72),(907,1,73),(908,1,74),(909,1,75),(910,1,79),(911,1,80),(912,1,81),(913,1,1),(914,1,2),(915,1,3),(916,1,4),(917,1,85),(918,1,86),(919,1,87),(920,1,88),(921,1,90),(922,1,91),(923,1,92),(924,1,93),(925,1,94),(926,1,95),(927,1,96),(928,1,97),(929,1,98),(930,1,99),(931,1,100),(932,1,101),(933,1,102),(934,1,103),(935,1,104),(936,1,105),(937,1,106),(938,1,107),(939,1,108),(940,1,109),(941,1,110),(942,1,111),(943,1,170),(944,1,171),(945,1,172),(946,1,127),(947,1,128),(948,1,129),(949,1,130),(950,1,132),(951,1,136),(952,1,137),(953,1,138),(954,1,139),(955,1,140),(956,1,141),(957,1,142),(958,1,143),(959,1,144),(960,1,145),(961,1,146),(962,1,147),(963,1,148),(964,1,149),(965,1,150),(966,1,45),(967,1,46),(968,1,47),(969,1,48),(970,1,49),(971,1,50),(972,1,54),(973,1,55),(974,1,56),(975,1,57),(976,1,58),(977,1,59),(978,1,60),(979,2,10),(980,2,11),(981,2,12),(982,2,13),(983,7,6),(984,7,7),(985,7,8),(986,7,9),(987,7,13),(988,7,14),(989,7,15),(990,7,16),(991,7,17),(992,1,89),(993,1,181),(994,1,182),(995,1,183),(996,1,184),(997,1,185),(998,1,186),(999,1,187),(1000,1,188),(1001,1,189),(1002,1,190),(1003,1,191),(1004,1,192),(1005,1,193),(1006,1,194),(1007,1,195),(1008,1,196),(1009,1,167),(1010,8,10),(1011,8,11),(1012,8,12),(1013,8,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sismenu`
--

LOCK TABLES `sismenu` WRITE;
/*!40000 ALTER TABLE `sismenu` DISABLE KEYS */;
INSERT INTO `sismenu` VALUES (2,NULL,'Seguridad','fa fa-lock','',2,2),(3,2,'Usuarios','fa fa-fw fa-user','user',2,2),(4,2,'Grupos','fa fa-fw fa-users','group',1,2),(5,2,'Menu','fa fa-fw fa-bars','menu',3,2),(6,2,'Database','fa fa-fw fa-database','backup',4,2),(7,NULL,'Mantenimiento','fa  fa-wrench ','',3,2),(8,7,'Equipos','fa fa-cogs','Equipo',1,2),(9,7,'Componentes','fa fa-cogs','Componente',2,2),(10,7,'Preventivo','fa fa-tasks','Preventivo',4,2),(12,7,'Backlog','fa fa-tasks','Backlog',5,2),(13,7,'Registro_de_Parametros','fa fa-tasks','Lectura',10,2),(14,7,'Predictivo','fa fa-tasks','Predictivo',7,2),(15,7,'Solicitud_de_Servicio','fa fa-sitemap','Sservicio',3,2),(16,NULL,'Pa√±ol','fa fa-briefcase','',4,2),(17,59,'Articulos','fa fa-barcode ','Article',1,2),(18,59,'Stock','fa fa-cubes','Lote',2,2),(20,59,'Orden_Insumos','fa fa-check','Ordeninsumo',3,2),(21,59,'Remitos','fa fa-paperclip ','Remito',4,2),(23,16,'Herramientas','fa fa-sign-out ','Herramienta',5,2),(24,16,'Salida_Herramientas','fa fa-paper-plane','Order',6,2),(25,16,'Entrada_Herramientas','fa fa-paper-plane','Unload',7,2),(26,16,'Trazabilidad_Componentes','fa fa-exchange','Trazacomp',8,2),(28,16,'Punto_Pedido','fa fa-bookmark','Lote/puntoPedList',10,2),(29,NULL,'ABM','fa fa-book','',6,2),(30,29,'ABM_Grupo','fa fa-server ','Grupo',2,2),(31,29,'ABM_Sector','fa fa-sitemap ','Sector',3,2),(32,29,'ABM_Contratista','fa fa-life-ring','Contratista',4,2),(33,29,'Parametrizar_Predictivo','fa fa-bullhorn','Parametro',1,2),(34,29,'ABM_Deposito','fa fa-qrcode','Deposito',5,2),(35,29,'ABM_Tareas','fa fa-street-view','Tarea',6,2),(36,29,'ABM_Parametros','fa fa-adjust','Altparametro',6,2),(37,29,'ABM_Proveedor','fa fa-truck','Proveedor',7,2),(38,29,'ABM_Familia','fa fa-check-square','Family',8,2),(40,7,' Ordenes_de_trabajo','fa fa-tasks','Otrabajo/listorden',8,2),(41,7,'Administrar_Ordenes','fa fa-thumbs-up','Envio',10,2),(43,7,'Alta_Nota_Pedido','fa fa-cart-plus','Notapedido',11,2),(44,NULL,'Compras','fa fa-shopping-cart ','',5,2),(45,44,'Enviar_Pedidos','fa fa-envelope-open-o','',1,2),(46,44,'Recepci√≥n_pedidos','fa fa-check','Administracion',2,2),(47,NULL,'Reportes',' fa fa-line-chart ','',8,2),(49,47,'Rep_Informe_de_Servicios','fa fa-file-text-o ','Reporte',3,2),(50,47,'Rep_Ordenes_de_trabajo','fa fa-file-text-o ','Reporteorden',2,2),(51,47,'Grafica_de_predictivos','fa fa-pie-chart ','Grafica',1,2),(52,47,'Rep_Articulos','fa fa-file-text-o','Reportepedido',4,2),(53,29,'ABM_modelos','','',0,2),(54,7,'Plan_de_Mantenimiento','fa fa-calendar','calendario/indexot',9,2),(55,7,'trazabilidad_ Activos','fa fa-exchange','fa fa-calendar',0,2),(58,NULL,'Equipos','fa fa-exchange','',0,2),(59,NULL,'Almacenes','fa fa-check','',4,2),(60,29,'ABM Marca','fa fa-sitemap','Marca',9,2),(61,47,'Rep_articulos_pedidos','fa fa-file-text-o ','Reportepedido',6,2),(62,29,'ABM Clientes','','Cliente',10,2),(63,29,'ABM Area','','Area',10,2),(64,29,'ABM Criticidad','','Criticidad',11,2),(65,29,'ABM Procesos','','Proceso',12,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sismenuactions`
--

LOCK TABLES `sismenuactions` WRITE;
/*!40000 ALTER TABLE `sismenuactions` DISABLE KEYS */;
INSERT INTO `sismenuactions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,3,1),(7,3,2),(8,3,3),(9,3,4),(10,4,1),(11,4,2),(12,4,3),(13,4,4),(14,5,1),(15,5,2),(16,5,3),(17,5,4),(18,6,1),(19,6,2),(20,6,3),(21,6,4),(22,7,1),(23,8,1),(24,8,2),(25,8,3),(26,9,1),(27,9,2),(28,9,3),(29,10,1),(30,10,2),(31,10,3),(32,12,1),(33,12,2),(34,12,3),(35,13,1),(36,13,2),(37,13,3),(38,14,1),(39,14,2),(40,14,3),(41,15,1),(42,15,2),(43,15,3),(44,16,1),(45,17,1),(46,17,2),(47,17,3),(48,18,1),(49,18,2),(50,18,3),(51,19,1),(52,19,2),(53,19,3),(54,20,1),(55,20,2),(56,20,3),(57,21,1),(58,21,2),(59,21,3),(60,21,4),(61,22,1),(62,22,2),(63,22,3),(64,23,1),(65,23,2),(66,23,3),(67,24,1),(68,24,2),(69,24,3),(70,25,1),(71,25,2),(72,25,3),(73,26,1),(74,26,2),(75,26,3),(76,27,1),(77,27,2),(78,27,3),(79,28,1),(80,28,2),(81,28,3),(82,29,1),(83,29,2),(84,29,3),(85,30,1),(86,30,2),(87,30,3),(88,31,1),(89,31,2),(90,31,3),(91,32,1),(92,32,2),(93,32,3),(94,33,1),(95,33,2),(96,33,3),(97,34,1),(98,34,2),(99,34,3),(100,35,1),(101,35,2),(102,35,3),(103,36,1),(104,36,2),(105,36,3),(106,37,1),(107,37,2),(108,37,3),(109,38,1),(110,38,2),(111,38,3),(112,39,1),(113,39,2),(114,39,3),(115,40,1),(116,40,2),(117,40,3),(118,41,1),(119,41,2),(120,41,3),(121,43,1),(122,43,2),(123,43,3),(124,44,1),(125,44,2),(126,44,3),(127,45,1),(128,45,2),(129,45,3),(130,46,1),(131,46,52),(132,46,3),(133,47,1),(134,47,2),(135,47,3),(136,48,1),(137,48,2),(138,48,3),(139,49,1),(140,49,2),(141,49,3),(142,50,1),(143,50,2),(144,50,3),(145,51,1),(146,51,2),(147,51,3),(148,52,1),(149,52,2),(150,52,3),(151,8,13),(152,54,1),(153,54,2),(154,54,3),(155,40,9),(156,40,7),(157,40,10),(158,55,1),(159,55,2),(160,55,3),(161,56,1),(162,56,2),(163,56,3),(164,58,1),(165,58,2),(166,58,3),(167,58,4),(168,59,1),(170,60,1),(171,60,2),(172,60,3),(173,47,1),(174,47,2),(175,47,3),(176,54,13),(177,54,14),(178,54,15),(179,54,16),(180,54,17),(181,31,4),(182,62,1),(183,62,2),(184,62,3),(185,62,4),(186,63,1),(187,63,2),(188,63,3),(189,63,4),(190,64,1),(191,64,2),(192,64,3),(193,64,4),(194,65,1),(195,65,2),(196,65,3),(197,65,4);
/*!40000 ALTER TABLE `sismenuactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisusers`
--

DROP TABLE IF EXISTS `sisusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisusers` (
  `usrId` int(11) NOT NULL AUTO_INCREMENT,
  `usrNick` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrComision` int(11) NOT NULL,
  `usrPassword` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpId` int(11) NOT NULL,
  `usrimag` blob NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisusers`
--

LOCK TABLES `sisusers` WRITE;
/*!40000 ALTER TABLE `sisusers` DISABLE KEYS */;
INSERT INTO `sisusers` VALUES (1,'admin','admin','admin',0,'21232f297a57a5a743894a0e4a801fc3',1,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\◊\0\0\0\◊\0\0\0â}ƒµ\0\07<IDATx\⁄\Ì}˜w◊∂¶˛ày\È\Œ¸rg\÷[3˜æô;\Î≠7s\Ôºˆ\≈cccl¿òkõå¡òl¿,¿\‰úA$Å@A$ëÉH\"H$\"cí\…9Z ˆ\‘w\ƒ.ùÆ>∫ª∫˚t´j≠ΩRw\’9uˆwv\ﬁ\'\„yA-Je*üQã\ÍøÛ:˝ıØ•fÕöQ”¶M\È\Ì∑\ﬂˇgz\„ç7\Ë˝˜\ﬂkﬁº9µj’äæ˛˙kO‘∂m[˙¸Û\œ\≈˜˘~\Ôæ˚Æ¯\Ó\¬ˇÒ{¸\Ï\Â~_~˘•˘]ô>˘\‰[˙Ù\”Oïﬂ±Rã-®u\Î\÷‘Æ];\œsL4aúXº≥\’CjS™Û†e§Ú\‡\Ô.Æ/\”;\Ôº#¿fÛã)\0\ ˜\ﬁ{O\‹\0\√7n\‹X¸\‡s˚~Àñ-M\‡ª\r6\„|Û\Õ7C\∆	a∏áLı\Î◊ß?¸Pl6òøé@\√&É±bC:ºÄK7j\’\‰u%†\"ëL\—ûÅ\Á’©S«îíN\œlﬂæ=}ı\’WT¸qòdeê\0∏^Hı}\'zÎ≠∑®AÉlÒ~7¿\“\0\\Y}^3ôR\√O	\ÂÖ¿®¸|H	ß\œ2∞>¯\‡Éêç\0Røì˘96º\‹˜«ªQIu¸-\—Ô¨¶,%¡U2±∂©\n&ìAXEt\Z$™\Z>ã\Ôx±\Õ¸&å6lêÇ\0Z2%Z∫,#ï\Ì¨d0©Ã¨ª\œ¿÷Å\„É` ]\‘2lPoô©Y\0\0ì\r∞tqr§∏æoU•b∑M&s≤#\‡qr`0∞\0Bø\’??7\nÃám9¸õåç\Ô\œ\∆\Ê	/p\0Æ“∂QµM	êlÜdp\Ÿ1!ú¨\n∫\Ÿd∫π\…1\ﬁd©∞ê®P[∞KÛp%\\\‘¡gp\Ÿ˝ù4ïÄeï\"ò# K§:m@x`õºÄ+4æ´\Í Sì&Ml¡\≈¿KU`YAˆ\—G	ê%Ú\›\„ôxá\n\‡ä#A=`[@ÜÉ\ «ô vªÆó†r*$\ÊîHß{c\·¿g\'Ü˙?vb0ú\rà?q âêÆÑ\œ\·;¯.\‘“ø˝\ÌoaûB¸\r;<PW\ÁÖ66\'GéüÄf˚fA\0Æ8≈¥ú\\\ﬁn\Ã¿Ò0=≤*\‹2\Zêé\ƒiD»®∞˛&?ãÛu∞	aèAuKî˝≥ \0óœÑ†b4RÄ≥î¯\Ã\‡ÖX±Ç\r@\„å\nY¢Yô ßì\√|\„-•\Ÿ9oq\0.üm-ØRã\Ã¡Q?THvKÀÅVH>ƒÆ µ\0(d†\„π\ÈÆ∫\ÂZ\∆s\ﬁ¸~SM=\ÃH°\◊Réx\Z⁄∏?∆ÅùZNú≠[∑Æß4®H§$$@\Ìñ¿ã\œ‡≥âHVˆ≤\≈s∏™©áZÉ´iÉ◊µÒ™lv«ö\Á\∆Q%\ÿFCúîõ,èb\"ºá©íΩ°-∏ê_Üâ]Yw5«Å\"\ÏB´çá\Õ\ŸÛ®ır*ûdÇÙ\¬\ÁUua∏7ûë.™*\Ásv˛¸ı\0\\~∏\ﬂu™?rS9\÷\r`¯¨*ñ6rus¥Ñ\0gıä\‚w\…Ltˆ;3&í{3tvd§j  ±ì¯´på\0±\ )T¿â√≤dLeiñJ\Œ\r-¡µ¯\«\⁄fOåtÚ™±ç©I¢íT\ÿAj{%∏\ÌTG\Ïˆ\÷\nh0h™æ_Æ\◊=5JKpq˘~∫\ÿ\nr≠˜ﬁê3>¢ô\'TOnúiŸøµyO*ÇåKStŒú\œT\¬¯gn4j\‘H\0*ñÜ1\0ïwì\Ì6nL\„D¯ú\nå…™êéµÕÇŒï\À∫™Ñ∫{	#Uabëún$É¢^Ωz,P˚¢µ\…]\0Ræo*Ωw∑Æ\“+#∆ø≤6\⁄¯ﬁÅµ\Á§\‡_|!\Ó\ÌDm⁄¥	IPv\ZTUYuM)∆Åe]•óV\‡Ç˜Gß“íhÑŸ•>®O7\ \Ï˝-mõ3ú\ ¶(i\„\Ïî;!ì∫u˛\∆\÷˘!˜∂à\’e\‡!eã;D\…$˜˚Hï<Ii\Ë(Ω¥óÒÎº®ú\≈)Jº\€◊ØWó&Ù\ÎD«ñM§ Ω9Äê\·ﬁ∏\'{\„9\ÿ~êpênr`∞9N\Ê%n\ÿ^)\0ÆHr	\„©jÄ©U˘}™Ù§æø¢¢¨!Q\ J\ÁVO•o\€\'O\ÿX™AML[LW\€+CGºü\È2U\Ÿ	$d$]lõ~Ù>unŸåf\ÓN•9£\Ë˛∂9æÄ\ /z∏}æP7w-C+ß˝L£ˆQ™ú^´≠Ò˛ \≈dıT\«K/\›\‚^∫π\‡£-ä¥\÷©\‹\’Nµ¿⁄Ω≠	ûì\À\'hûhi≈§Å‘≥csS3\ 7x\…8a©ãÉ&q/ù≤62t≥∑¢\…\Ë\Ê∫+f\0Æ$\∆\Ô\‰ùw”ÑæT<c†I%F§xº–çM≥\ÈP\ÓZ3yÄ\ÿD\Ï6π∏îr∞\ÊC\‚=\Î¶&r\»Cßú√åTµ∑8Q;gí´b>H˚¡}\«ÙlKè\◊O1\È\…\∆i5Xv\…∞AZp≠ö5≤\Õ\‚\‡#ò‰£ît\nÙsŒ°N\Ì\ÿ2R\—\ﬁ¬Æäì;\0(ßs´†\Œ\‡sı\ﬂyõÆØÆäsk<∏ú@\'\r\‘c8l†2[¡&gÜ\Ëì\‰Ö.ı^⁄ÄÀãΩ∞\‡3NMcd\‚\ﬁ3˙w\÷\„\rS\È≈ûÖê¢êrv`\”¡\„z/]\‹ÚZÄã;<\Ÿ≈∑∏1•µAåàà’®§÷≥≠≥¿\ƒHπ£æQ#uâáâ3\⁄\ZºÄ\Àz÷ñ*h\n`}ˆ\Ÿg\Á\Õ\ŸJ-É^/\0\‚]Y;]\ÿlêfê`â\Ëg\Ë≈±°C#\—ùÛ	˘l+˘¨_˘\Ë\”h§÷ìM\”P\ƒImD0Ÿéâ.1/-¿•jDÉ¥n[¶:•1Z©82\‚G™Cä%\€—°Küç]íuΩ\Ïv\»\Z*µpO´\‘*a\‡»à;¡\À»ééd§≤âSYö\‡2ù^Ç«êd^˙F\‡~ôùæ\n\÷\”-3\ÊO¡ï\œ^\≈Dú9\ÿ]\„¡\≈\Œ/;ú{ãK&\Œ\ÂéTBç\Ï∞DûÒ≈Å\Ó\Z.\Ó\Ô%!\‘\…\ﬁB0ôSù:5o¨¿Kò|;,Qj\"∑_´Ò\‡Ç\·\Èµ8\“N\r¥f¥#á\–\n¨¿K®áñàäú©Q\„¡\Â5ûã\Â˛ráY˛˘ì\ﬂSJ≠g€≤&\◊@Mî\œÒjäÉ˚\"CæFÉ9`^è7egÜ\\ä@\·ªh¨ió†\ÀÙ|\◊¸Ä¡5rv4mX?§Q)\';\Ÿ\”l≥πô\0Wçw\≈GRfgóüc1¨˘ÖNéP¿\‘zR\–PˆÉX$ld¶Êç´Z\'Ä∞¶\ÿ<±\÷rgbÑd\‹jªj<∏ºz\nπñ¿≤K\⁄\≈\ﬂZ~\“P	¨¿\ﬁ“è~\€>GπV\Î&Ùwî^pjy	\"\◊¯\r/m‘†b\'≤kˇ\Ã\ÕbpüÖô]\‘ˆVê®´=ﬂù∂NG\Ê°\…˝:9Ç\ZLê˛\‰C\rtp/á†Æ\ÀI%\‚[zíuù†&∂¯¥ë\„Z\√ˆˆrÜ≤\…:z\n°6h\–¿s7Y86ÏºÑÅ3C_z∫yF∏∏!©π93Xã©\—YÒvûB®àh±\Ã˝\‹2\·!’úºÑÅ3CoßÜºNàO≤\rnG^\»5\Z\\*O!Äƒ≠öΩff∞^8úö;5äfá¨<á\"Vi£±†q©∏∏\"¢FKFíS\Ë.H9ª¯ YWsßÜ°Æ´¿Öêã\›\Ÿe©í¥õTpEr\‡ÇõΩe\ÁÇaw95<Ü.\Î˘\–\ÁrÛ\‡ír\nΩv{ä\≈\ﬁ\n<Ö©\„1dpTHfB\«&!o–©WG\0.Éê˚\Â%a˝\À\Ì¿\≈\∆k¡\»^Åß0ç¿egsAU\‰3\≈\‡MVi=¢aiMoPm¬Æ*æÖ\‡£∏Ç2ì\‘q«ªÅj!}\ÁÜJÇ\ÈR‚ü≤‡≤û#e¨¿\rü^\‡íΩ\»|Œò5\œ0\0W\‡≤m\„<FÛœÄÅS\'\÷\≈q.ª¸Q∑≥§¡+∏^ÅÜj$\‡¬é\√\ﬂcgÜ]’±p\√ªb¿¿©\ÎBÜÜ\\Li\0Y∑c\\ì\Ó-tKgapa7ì≥\‚4ªF4∏j&∏Xr\ÈrNW“É\»nß\‹\„Öq)ø|\ËÉK’õ0\0W˙Å\ÀK\0ô{\≈\ÎråP\“¿\≈-\’‹™ê(∏^≠{Ns±K{\nJ˚SÉ*v\Œ)9¡ö\¬Y\r∏X-\‘!Ø0\ÈYÒn±.\0J,\\\ÿ\ÌÇ\ÏåÙIÅb[<p\Èr∫dR¡\≈m\’TÒ\n¸yª\ÀjóSÄ+Ω¿\Â%ıIóñjZÄ∫±\Í\Ë \ÿYhX\‚îS\»\‡räq\‡JMp©\ Nº\‰†\‡RÙâ∑∫\‰5jdVh™¨x|\«1\∆Ä+%¡Ö5eûê	1Q8±ú@SAó\‘\'möÇ\ \ŸÒ8ã\ﬁA\0ä£\Ôv\‡räq\‡JMpaM\ÌCÁÆΩ\0ë*Ñ£KK5m¿≈™!˙e\‡Ö\·\≈Y˚$\»\Át\‡Jop!n©JÅ\¬\ÀyÖ\ÿ|ë∏k\r\„\‡≤–•yU^CÄEUÖlw∫	\ ∏“ª`\“\Œ\Ê\¬\Ÿm\0FŒàGù`\0.\’\–KÚÆ[\ÍS\0Æ\‘ó] Ÿ≠\ÎìN˝\nµó[\Á]’°w∏\“\\àoF\“ıI∑\‘\'m¿\Â%†å˙ù\0\\\È.\ƒ-U±.7W<ÛD\0Æ\ T∂V \‡J?pq¨ΩQ¢ó.©OZÅãUCk@\Ÿ\Í1\‰\Í\„\0\\\È.éuE.xõpπ®Ü¯\ÿ\È\‘,±∏\n9\0WzÇãc]rN©∏tj™%∏X5\ƒKUÅ™∫∏\“\\™Xó[n°.ßIj.ß2>îAés\ÈO\È	.U/\r∑¨xùZ™i	.r\√T™!2\‰e5!H\‹M_p°Uû5\÷\Â\\:’™5∏\∆w\rW\rÒ3R]\‰L\r/\‡ä§ïıÉ\¬	t∑`d]\À˛ë.N\ÌfK¯;ﬂèÖ\…pØ[πÉ}9TÆ|psÒo,˜êﬂÉ\”;\0a\‹\÷w\Áı˘*p©\…n\‡?\Ëî˙§%∏TßüpäãLv;¶\’Kô?\‡JV*\Ìˆ∑≠\Ì\Ì˚\ÊM:˙cS:=¢uUá\ﬂ\·3¯@+∏,\‹\œ≤iö\„F\¬\‡¿g˜i\Ë\Î;\0a˛vc0+ëw\Ã\r[7U¨\À\r\\:u}\“\\≤j®ä\ sº\ÀK%≤∏ò°ø\ Åë¡\– y~H.ê|O~éıYâ$\'†[O:±+öt;\·ü\◊)ØP[p±j®j^√™!í6\›zh®¿Ö;ªt¨\‰á\‘bHuõÄç\r\Õ+∏p∏º\√\ÿDô\‡nWyíu:™U{p±jàjdª\ﬁÒ^∫?=\Ÿ∫[≤˙•ù\◊1&\…N=Lñ§rìbÚ\\\Ì¿\ÂV\◊\≈ˆòÆ©O⁄Ç\À-S˙7∫Bπı-\‰v\÷XL,™RE˚˛c:3∫]û\’Àêj#\Ë¡öq!Ñ\ﬂ]ù\◊œ§Ûæüó	˜ê©§\À;\Ÿ%ÒÚ\ƒ¡∂ä`\÷yîg~6W˘]\\\œˆæ@¯=>ãwæ∑\„J)\∆ t\ËR≠NÆA∏\“\n©L\À@´Aa-ü:\n^X¸c\Ì\0\\ëQZ¡%øP∑@2t}´\Z\∆HT`Úõ¨\‡¥˛OW7ò\ÿ\È˘Òû?\œ99¨E–†¢[\œE∂∆∫¨Y\Z0¨∂∏é\ŸZÉÀÆøÜ\\\ﬂ\≈=\„\ÌÄuw\Ÿ\”àÖ\≈N|+HB*äw,Ißπ^ò⁄ïˆ|\ﬂÿçúA µ\„XóHN•\‘\'≠¡%ßC©TC7w¸ÉU\„åE¸ÄJª\÷jïRõ\«ı§)=ø¢\·\ﬂ4£Oﬁ©m“ü˛¯\ﬂ\È˜øˇ}\‘$\ﬂKE≠\Zæ%û	*˙≠á\ﬂ`∫∞z2\Ìû3òf\r¯Ü\∆ˆjM?¥n\‰:Æwkˇﬂò\Êç\ÔÛΩ∫4´oŒØ|˛O∂™#6;lz∑rá\ÿ∆∫\"lı\0\\>d\ C5t\Í∫{bps˙uˆ˜\"é\"/*\0+Ä¸¶?˝\À®GãF\—\Í\Óñ,¶˙u˛]´πÒÜ£TvhX+lÜ*p\…\Â˛©î˙§∏\Óœ´Eß\’\n3~ÎΩ°NáB.3∞z±`Ú±≠O∑\Œãô˝C;s¡[7˝êFˆ\Ó@\”vßmsGz≤E\Ã\ƒ˜≤£Uìã\ÁÇ0Üw\Î\‘aƒ∂ü\‘@âX\Î&ı\05¡˙?ˇÖö5|èukOc\ËF3áÙq◊Å¸)1\œ˝Ùö9!s¸ÒõT\Î\œˇfJ∂+KGVÉ´p|»ô\»Úö…Ådˆ\n:ë\\\¬ŸßäópΩ¢;Yµh_áZJVﬂÜ\ÍLy\Œ\÷¿\ﬂ˙¥˝\Ã5ød\Œ\–WR‚èæ0í_Ù\Ï`!]ÿæîf˝¸=\’˛Ûøä1BäE¢2®z¥lB\Î≤FR\Â…¢zQæ5©s\Ï\⁄\‚S1æÆ_|dÇ\ÎYQVÿ±≠™@≤pq*ú\Èç\ÏP\≈S∏\¬n#SÂºµ\ﬂ7µçy\·ÖC™!\‡\Ëv√†éüWÌ†Ü§àòAJ\◊–É=ts\√¸®\ËF\·\€{Wîm4Ap∑d\r\’˛K\’N\–xÄà\œ\œ\Z“ã*Ol\r”≥Ck´ü[≤äXı|nÆõMv\ÊF$\ÕyêÅ•\ +¥ÇãKå\Ï¿\≈\'õÙh˛±\‡3û\÷\'\0= ©Ú¸T‘πe3\ÂY^¯?´nY\Z,f\ÎOœéU”â]Ù\€\ÈΩ!Tq\·==SJ∑ˆ¨£k\€\n|°;W\”\›[\Ë…â\‚\Ígù\ŸGïøî\ZTBïgã©Ú\‘vj˚Y\„*∞ˆìp±:XVòMïßwV\›˜ªxê*Ø≠¶´\'\Ë∑_\”√£ª\Ëˆæ\ræ\Œ\Î\ﬁ¡-a\ÔY˘éê˜\\˚\ﬂˇ\"\∆Y8\·{«§]ô\ÍøÛ∂ôe.Æ\„*\ \Z\"\Ó	b~o\’hp][\À,\⁄e)¨ô<¿6\Ê≈û\"´«∞ıGuï\∆ı≈É;\Ë≈ï\„@v\‹(^OOo˛Jø›ΩIáwl¶ù´Û®d\„r*5hÀ≤ìV\ÂfS¡\‚l*\\öCª7–∂µKhÖÒª«è_OÆ^åxsw!=:^,¸…©˝√ü§ó\◊OõTyfó∞ëX5t≥Ω\ r´%ÇêP®\‰˚1=øtåûù;Dè\ ˜\–\√cª\≈Xn\Ì\ﬂBï\œ+\Ã1ñ\Ó\ŸEÖ\∆|vlX.\ÊÄ9Å\÷\Ê/0\Á∫kM\‹\\@˚7.£≠\Às\Ë\Ó\ÂÛ\‚˝<8}DÄs\nyóÀåg•Áóè\—¿>]ï\ÎQ:\À>71L\'p±\‘j’¨QH\ﬁ(\Œ¡[5\Z\\\Â˝kôi1Nå\‘Ù£˜ï›°©W%\÷˙?ˇ;l!a\‰W^´fh¸å˝≈Ø\'\‡ûû.\0∏[∂\«dºä\ﬂ~£U˘i˚Üe¥kc≠^≤\–d<+m]ì/\0∂e\Õ:r`?\…\◊\√ÛÂÇ©\Ÿ*1H .s\ÃÔø©$ñ\ƒ!\‡2$ü<?+aû◊∑Ø§\Î;Vá\0Àú\„z\Ãq9≠\Ã[`;\«\"x™9b#\¬}\Ô6lº_\À\√\∆q±tã\\vÙ.U%2k-•9£BxÖ≥q¿[5\Z\\lo©í:eö=∏ª2ôóù\ZVè°j!Û&™√ÖJ∆É\Zxc˜Zzt\ÈL(n^øFW\ÂÜ\Ì\Ë*ÇÙ*6vˆùÉ\Ó⁄∫ë¨◊ΩÚR0Hë`]-ØR\ÈÄ`à\∆›Ω;z¿\Œ\Ìµ\‘A\0†\‚·Ω∞9nX\·qé\ÀQÒñbé\≈\€B\Á¯\‚\Èc∫mhwJ6 á\Ã\—PW\Îøı◊∞qè¸ˆsO\‡≤6\Âuá\…`\Â\Œ!M∂›ïtpïvˆÆ˚\€\Ê\–GoÖó¢p3H/\‡2–∞G‰Öá∫5\…\ t\Ãxõï\Ãt\È\‹	ÒªÚ≤√∂å∑\«`<\Ï˛{ä6ë\Í¿¿\‰&\”¡6Ç\ƒy\Âx®˝ˇBÉπà[!,TF\Ÿınn\Ï¿\0P\rI(\œÄVKûcÒ\÷\’Ùº¢BH≤\’KªÃ±ÄˆlW\œR˙VÒ:°é\n\Ì\‡¸>€ç\√+∏¨ˆ6g\Á\\Y;\›\\\‡≠\Z\r.v¡\À\‡ÇﬁåLq´[~R\”◊îùyU9Ü\Ôæˆg{p1^:LèO\Ï6É¨&\…l\'H.◊≠\◊m¡µ\’Pï\\Gïê\›u´d=9∂Ω\ ˘ yÙÓñÆ\r	,#~\Â4FLå?èòVòóL}˘à)µ`©.Ä	\‡⁄øc=›øsS\Ãq˝\ e.s,†\√˚ãm\Áàg]ﬂ∂å*ém6«£\◊\ \·\›<ÅKegwoö≤îÖ¡\ﬁ\n\‘BK=2\≈\Ì2∑T∂\⁄^–Ω≠\‡\⁄6Ò;˙°uìêÖÄÀ†˚ªñ“É≥G\…\Ì*»ôMŸì¢\≈”á–¢©ÉiX\ﬂ\Ó4‰ªÆ!4f`oZ2k\Â\ÕJs\∆§\À\Œ\€\ﬁ\Ô≈≥\'tª(?ê><V\'`\…\ƒ\0É\ƒsr\√?<w\‹qékó\Ã7\Á8g\‹¿∞˘Å¶\r\ÔGÀ≤Üã9\Œuô#\œÛfë∞£õB¿Öçv£ì‘í¡eµ∑†ΩÄ∂¥™\Ê`ÏíØÒj!ÉKvh∞˜ˇ–åŒç\Ì \ËH\ﬂFb∑≤ï\›\‹ÒM\ÎΩ.,¯Û\Á\…\Àu\Á\÷Mö<¥\Õ\ZŸõ\Êç˚ûM\ÏG\ÍJv1®+\Õ÷ì`\»◊óf\ÔE\Î\nr]\Ô˘Ú\≈Û0Ùh\◊\‹\Ã\“\⁄\Î\‚EÒêF+v˝L\ƒs\Ã6h‹Ä\Œ4^Ã±\ÕÛ›´9~/\Ê∏aeûßw˜≤\‚©p\À\À\‡Bö◊ã=Å\≈\ÕA.d\„XX\„;˝MÜºÒZ\Z5\\r\ ø.É\«\Ôêw\∆/˚\“Ùû¥Ûˆk\Î∞[$H0;\Z\÷/úÒ.¢óoä]\÷\È∫rÒ\Â\ÃK≥G˜∂pB?Z<πø†l\Ÿ\„˚R\÷Ëæ¥o\«fwÜªsI0ºu,H[b\ÊÛÆ¢\ŸT±s5y\Î?\Ï\Á\«.˙[ø\–Àß]fù#\0\¬\œ\ÿ<\Êé˚Åä÷ØrïX\0û…é\Zy~êª≈∏8àåÀ≤\‘B2\‚_HèbpqÆc~oqÆW//…ú .UG\÷4øldO\„wx\È≤j\»:∏\›\·\„p˜\nâYc[\’	L\0;\Ë\ÈÖcTqˇ∂-\„=∏èäV/†-Y¥ı\Ì(\\Hvm†\'èªK+x\œGòU&\œ]öp=\€:ã&wo\Ó>øWÙÚ\ﬁUWü:zêvm\»ô#~ﬁªu•\„_8AON\Ì£Áßãm\ÁáÇhLcl\nN¿:2HXlìùW\\ +˜I¿Ø∫pÒ\Ôk|ú9`¸2Pö.íY5îì:ÒˇıC´î\\v\Õj®t≥Kdz≤%=:ºôn\Ó\\Iè/üqõ€Ö]¸\≈˝\"û&\Ô\‚VÇC\"“ºB¡†¶“©úüM\’N\◊9Bí ´∏{Ébπn\Ó\ﬂOw˜¨¶G%Ö¶m•\"∂\'Y\Âµ+\Ô∑K\ \ÂF0;\0è7Zà¨&s˜+P≤Ûµ\»-¥+ygè\·ı™w4\√\Ó\ l\⁄¿ÜcNù†8®luj∏QE˘6\·¯∏π5_\Á7˜nN0ñ	Ü+\›D˜˜≠@ıÚv¡ÔöùqC\Õ{+FAòK\ﬁmn07Ä\„\ﬁ\·bnª›º\√¬ÜÉwáÃìÖûûÛ\‚\ƒ6\”\ﬁ\ QUøÜûín\Œk56Q\Œ#Öâ¿˝G\‰w\";√Ç\ƒ]…©Å™akß&¸uY¸\“Oom\⁄]\Ïí˜ÆEô\ﬂVgiD\0.[\Ô[Ò2%9\Ì\ﬁv[	cÉ\„%íRv\n@-⁄ïıì)ù=I/©m7∑h\ÔY∂f^àJ(¿eS\ﬁ/\Á\¬Qeµ∑fváÉã[\»\ÔÑ+œÉ\ƒ\›WtaD®\›%ø,±;/í_˙/ì:Saã*pÒ\À˜.V\r£ë^Ò$x¯x\\´GE^ïµ•ÚO∑\Ã0%\·u\‘e~≤óPˆÇ:y¢™x&\÷*°.kø\Ê#T\0ÆWÖí™xªU±3õEtÜä\»NçH¿ı∞p¢\ÈíG\Zé.å\«YP[·úà\\ê\0\0◊Ωï£Ö\ \≈@YÚ\Z\Ão›ú±’õ\⁄+/(\¬N\‡\‚*dk¢∂\Ï∏¨˘®r\Î<\n&µ©D\ÊL\r´jù˙ˆíüC_æÒπñ\ÔVW({◊É\’\„E`ô\Z	≤\…f<VA™¶#\Ó\Î^4[Äæœ∂W¨\Í°Ñ\Á≥˚\„ÚZj\¬\Œ93\„\€ˆmCD\Ï\”bo±Jò\Ï\Ã\Ì¿%«ªd\’ı9–´C‹¥}	èa$í\Î˛ ±!1ØHçø	™©5ø6TƒßÑ\Ï\Œ\‡NCEº≥yñôw\Ëá}∞8Q„ëã?Ωz\nep\rh\ﬂ\\Ù2\‰\œ\\õ\◊?§˛OV	ì\ﬂ\“\\7¶©UCé]\»/N\rxπ:ô¡eÁ™í\\\„Ñjàüª~ˆAuiºaü$zá∞xG\«X\"=ë%¨ª\Ó¸\Ë\Í‹æØ˙4Nß≤≈£LÄ%c~P\Ÿ˚˘ß?˛:º`X\»x°˛:Åm∞û≤J8§˝g!\…\ŸXOŸô!´Ñ\‡•\0\\=\ÕW´Ü¸e\ÔºáH\‚˝\‚ìPo°”Ç=\\3A,ˇ	£r\Õl0Eºùú\‚$Zºˆg∫∫|åT•h¡uc\·@.û\0ñ7ºá˘0zº•4\ÊU[\Œ\Í\«∆Å˘Y\’]7O!∑≤ñ¡ï’≠yàfÇ˜%ÉKV	¡K∏TC~qTñAe∏\„¸™ëgp=Z7ô\ÓØÚ;,º™bY\Óú¿E\„]≥·ª∏Äk≠eb\∆Sı¥è¯\‡Öº!\\wóKÍ≥°\"M\È\'$á™+\ÏΩh\ÁÖ\Ô¨<7kô6-πåßK⁄ì\n\\v6=Ö\÷ÕàC6:©Ñ⁄ÅK\Œ÷∞î≠ª\›∆éı(´]√∞\‡¢Y¡≈Ñ\ÿb™\Íe\‹\»\È˚X\¬y!??\ZGÜlø\‹\Œj\ÿ\\?\“Ìº°asÄa\”\… ≥¿\·6\'U°£ï∞QY+ã!E≠6b4\‡\⁄<y@\»gdp…Åc∫>i\€îã\'ANßa °wy\€z&∏\‹z\∆p≠\Z\Î˙\0\r*#ÄºÄ\ŒH∏«¥ﬁ≠†XR9ù\ƒ-∏\‡-î3Y\Ïb}<7\0!ñyÅpûõmk;K_\’awn\‡\Í—æUXW^9\Ââ˘%\Ÿ≈ë⁄ÉKN\‰Eûò∏ê˛\"É\À\È(!Y5π}\Œ	x`$7\¬\Áº\ﬁ3©UDû\"¿U%ΩD5//s≤\€\…PM≠P7O°\n\\9\ﬂ4Rû^#ü§©C¢Æˆ\‡í[≠°å¿n\«\„\ƒM\Z˜{Ypë\”f,z¥\0Ûì‹éïıB\'ò\‡Ç\Ì\ÂE:\'Ñåwå\ƒbU\–;pAj!ÙbΩ∑\\û§K+µ\‘8¸Æx\ÃKxD9\nß\≈8ùçl\Ì¿\ÎE5IÛ¡˛à\\≤\‰=\\;1˘õá\r∞8]\À∏8A ª\›!\ÈoÚ¶Ñ2≥ôl˝¯XKp\…1/™¿ªkdªO©œß\ÔE,-∞¯∞wí≈Ä±™ÉfÚnÒ∫≥dò	.∏\„\≈\Êë$Ä\·˝\⁄m\ZniO2∏∞aBjY´\"\‰5\‘1∂ïßúpÃãÛ\«Te\·\\v0©Õá1ÄúUFÑG+QÃág˘,ïj†1#˚&A É∫m\'≠B\Í\œ<\‹ˆ3*\Õ!µ∞æv-\ Y%\‘%\›)e¿•*ˇWù¡Öø£Qâı\Z\'R\Ì¨`F0=≤¸îh∏vZ0Ñj†íiçqÀ™°ººâp\Â2\∆ıÜbÄU\Ã«∏\ÓI€ã3CTégv°éü56{®®T{\ŸK®Sl+%¿uubx@Y\≈8\‡\ŒZÛ\ÂóJ∆âñ¢\…åÖXgp\≈\Íﬁèyqfpâˇ¢UU\Ë(1\n[?Cr]UB≠¡%ó°∞K^u85Ú≠çl\‹(ö\“\›IV\r\ÔØ£\Â#QQ˘¸d’©ì\–2‰æñ∫§;•\‘…í\÷D^Utü\ÎªJ∫‘ãHUK7paN≤jhM9J6y\…Ã∞ÜY\‰\ÊD÷å\Óv®áæ¸õR\‡≤S-úv9;J¥\⁄o\‚L\r&?bh~€Ö^◊Ü´åU\⁄´Ù∫Ù&LYpq*îúgh\›akAj\Ÿ\È\Á∂vóãg+Ÿ∂I\Â˛‹à¡u%\Î;¨{£ÑK^ß9πïô®\Ïh®¸vyä∏\‚–çów¡´s˙Üµ∫∆¢x∂ª∂e%ù\·¨˝BL&\‹0Ö*≠† í|\Ôj\·\Ê\È&∏~P@yg\Ÿp}\‘Vè\ﬁI8f¨\Îä\ré¨m\‡ä∏ôÁûÜV≤\\\œ‘£òº{#ïá˝¡\ÁD\ÂæETyjágÄH\0\Êèˇ\„\Á≤˛üh,/≠´≠±Kô∞\÷Xs˘ûº˛gá\‡ä)\rJ\Œ1î\Ì\„s\ÔdXúHÉ\…\… ’ëIl7ôﬁæ≤µÙÚ\Ã.™<≤¶\nl.˜\ÈOØ§!~>5¨•ˆñ\«\‡1à[Tc]A\"˘†πeµ]ûR\\r\À5kG(ºtπï\œ\¬UmÉ\…1Tˇ\∆J,ç°\¬Aä>Z7)$ç\…¸\Ï\—ıTYæô*èo§\ “•ˆG∏ˆo\"æ\œøN\‡RÖPl;?ΩZoñTàga≠≠\⁄K\0Æ8Åªòµ§ú\ƒ\È5[í\"ô\‡Ç]${¯¢ıˆ\·]îg~!\0\ Y∏~óJˆl+U0\ƒ9\…\«\⁄.Y\Á\∆n¶ZD\Œ5Û™\ZZ´d\rÆK\”{ò`\¬\œ2¡vÚ´ÇS.k|\«\n\÷CΩ?L){\Î\ƒ+u\ﬂ\⁄2ç{¿´\ ˙ë\…Ä+∆≤´§R´Üaı?\Z∆ª^=\r\\õﬂüˆv®b\ƒ\„ˇ\Á\'|c0®Zr-\0\≈\‡:¸\›G)coA\€\‡x• ã™Zg\›\ ˙S\n\\Hk\·óh\›\Õ\‘\Í«¥àΩÜâéw=\⁄>Oú\Ô|a\Èh*\ÈVü.L\Ó,Äp5\Ôg∫î˚3õŸè ¶ˆ¶cæ•C[€™é¯l*¸+K≠\ÎyÜ\Ã˙éNN\ÈAeì∫ã3ÉAw∂dâ\ÁV\Ï^†e|\ÀN%¥€òt9l!e¡Bzã◊ó.{\rΩî\„ïg¯t\Á|¡\–`\Ïì\À&*\ÕF%Y?	R˝\rt0g$]\»,8.\0\ŒcãFPY\Œ\€\Ô\⁄QY\ﬁX1ûÛ´&”µı3\Ë‚ôñãJ®:M\”Ù ˆØÄ\À/ªKÓ∞™z\ÈX~Ò^s\r˝\»3Ñ4\0ÉHg\n&—°≈£#fx\':Ω|Ç,3aC¿Û¸|\Ë¯íqtq\ÕT∫πqñê∞~rFö®ã5T\≈ˇT*°\ŒˆVJÄKn™Ùs9CZ&ØπÜ\—$π2ò ¸fr+\√€©r\0Å\ﬂ@∂K∑h\‘IÄ$\⁄¿1T?´\Ì%K∑NO)	..?ë\ÊDP#Yï¥\Ê¶ymˇ\Â$°¿l~30\0¬™#\Ó\œv¿\„eL¯á•\'\ﬂ\‰\0±ë@\’ı¨\Zªpg\rc›º¨3>£\√)&i.kÒ§äê*≈û#˛¨W\’\–Küv01§àWFd∆ñôû\ÌêjW¥\ƒc`õ™`$ Ùz/ùu≠πÑ\049æ©\"\›\’¡î∑]CI7Ä\¬œ∞…¨ªò¨Jzçyπ1\n§Å”é≥&\⁄o&6ßç Ñ\√\∆<O™∫,¨5\÷÷∫ﬁ∫µOKpE”É\√k:îìK\ﬁ\…y\0FL∑\¬Khv É˙\Íáû\ÀKRE\Z‡≤¥	Ûrr\…\€\ŸYP©\“X^6\')Ì•§ü´\»u:ô$\0WÑ12Oé\r©ã´ï¢aÆt\";è®ù\ÌÂµ§üc[∫vo\n¿\Â¡	Çäód^ïjh∑sC]ä<ÅuZX]R\‚ìhß	∑ót2≥ú≈∞\'#Q\rΩd¡s[<]\Œ/¿CåÃãcC•\ZBı≥ÛFí§´:)¿B¨àKvêõ\Ë\ÏêPël0^TBvd\Ë\\IÄÀÖP©\Í\Ÿ-ØP\r\Ì\Ï≠H¿Ö 7ò\Z)\\(jåTz!I#\Óá{1∏\0çLvÆl|c¿}›íd\›\ÏÆhΩÑ\‹˜$5\\Ú©)^§óµa®]N`$\‡íA ÄÒ!5¨`∞í*\Î=R\‚BC\0‹ÆT\'pY]Ú^ºÑúëë\nY∏<∫ÂΩî¢X\ ~ÇK•¶Å\·Y˙∏Åç	@ë•\Ó!KµDz≠Iø^TB¨C∫K≠\Z.π.\Ã\ÀqrÆ°]÷Ç\‡Jwº./Ω	\Ÿ˝û\ÓR´∆ÄK\Ó$\ÂEz\…\ÂˇN	µ5\\\»<Ò./Ω\‡kä‘™Q\‡äDz\…e(N9v5\\vS9\÷Â•ºÑ•ñ\Œ-®p\≈(ΩºxŸ±\·ÆöD∂ãs\…Y*^ú\Í§si~\0Æxπ˚í∏\‚Y¡´\Ÿ9u\\^ö\–p\\K˜\Í\·\0\\>ƒΩºdm†Ø°∏\‚ô[\»q(¿\ÂTäÇ\r\∆-#Éõœ§ka\0.E÷Üı kïÙr⁄µQÜ∑#w`#˜±.´ÎùÉ∆áz5vLº3\„ù6ò{[g{.Ü‘π\«`\0Æ8\‰∫eÃó\ÁèIäSÉøL\Ï\\\’v≠M-ìé|\ﬂ\»<I\”K°g,Ñí\Zß˘\ﬂZÎ≠´S:ß9\‡ä\“5t\·p_™rc9\Êj\’ı\ÏÇ¨™¨ﬂáóGboï,A\◊WéwT9\Õ)ïäp˘\‡\‹í\‘{.w$\Ì\œ\Ó\ÿ¿%û\“À©5Yº•º°N\À\ﬁŸÉ\È˙äqÅ:Ä+:ı\‡⁄ìï\ÈXÚûàÆµ\‚{â\—\Ã\‘.Ñ\rßx\∆¿à\À˜p\’ \‚ºCªÉÛ.--òh\ﬂ‹°∂åIG§tq¡c√±Z⁄±w∞&™É∏$\Ô!´ÚB\ÌÅJéL∏\◊™Ç∏Vw8™É\„j\Ô\Ì¥C`£\·w¢≤≥“π/F\0Æ˙\"ZÌØªk&öå¥w\Œœ•~À≠\È(Äó»¨l0¸>é\ÃR\„J˜p\≈hY;ı23Å\ÏúÒpl8µsì\…\Ôà\0µ]\‡N;pAÚ\◊t;+\0óK_zkˆòHòùz\Ë∑ÙÚ⁄§\”\Ôˆnvâ∫˚\Áypˆ®JIjRF\0Æ(:F¡n`ÄùX\ Tv\ﬁC?m/∑Ãàx=\◊\Œ÷í\’A¶_ÚGÖ80“π\ŸL\0.ÉÀ≤ë=Ü2\Ÿy˝Ú:e¢\«3`\Á!d\Ô†Lpˆ\»¿™\Èå\0\\Äãv}\È®0∆≤≥ø¿\Ë~\ÿ@Nnxïøÿ©É≤wP&\ƒXHà¯\'\0ó\ÁC\Œ9\√\0\0\€3µ?\Ìù9(å,\ZE\r@\…Tæl|\Ã\ÃnΩß\›\‹õ[\ﬂW›∑t¡\Âº˜N\Ëe¶6\’\‰,å\0\\QÇKv-Ø\Ì¯.\0\€7kPÌüùIUI,ôN\ƒ\00îqX\Ô\ÁFø¨û5∞nmö•º\'Nµ¥\Œ¥clOZ\ﬂ˛\Ì	Ä+\0W\ƒ\‡bÄmlYõñ¥yõvç\Îiµjπ:o(\…F\ÂK\«”É¢πQ\Ÿ[™˚π—£ë©£\≈lüu8wï\Œ6W\Ã?ØE\⁄⁄™∂ô\‚Ä+\0W\‘\‡\œlNπ_‘¶|É±vè\ÔI•≥\n°ÉÛáäÄØä¿¿è=2˛›≠≥m\Ô\„F\«Ú\«yz@uc\„L:aÄ\ﬂ\Ó^å\r\√:G\ÃÛ\œ˚¢:\ÿÄ+\0ó\'z±£=∫xäj.P\ÈòŒî\◊‹ê`-\ÎP\—–Ø\È\‡ú\Ã:ú˝3[2Œñ \….NˆÕ≥]\Ÿa}\√LÒß{x!<\„°!1e¬Ω\Ë>≥bí\Î˜1\Î\‹0_\Ãtx|\◊\Í\0ªÆ\ k\Ë≈ëq/\‡≤\–\ÍzÙÚÒØÑ\Î˘\„`™<\√\›cª\”Rc˜\Œ7v\ÔuΩ>•˝S˚—°πÉM:≤`òhªñ™ÑÒ\ÀÛaûò/\Êç˘\ﬂ[31\\∑˜Æ\Ô\Óe\≈zææq¿O∏™©ÚL.YØgeõ\√\0v|¡\œT:≠≠\Í-1vÒeÜ\€=≤≥\»\‚`*3\Ëƒ≤	)E(ï\ÁÅyÒ<Ò\ÔæI}\Ë‘¢\·u˘K!\Ì\Â\Î\Â\ÕO\‡zE\∆NkwUú\Ÿ\¬L\◊\nõd˛:î5ê∂g∂°•\Õk	\⁄6†Ö¯=\”QÑû\\>A{\¬8è.2˛\Õ˝>7Á∂Æ{#1_¸˛\÷*©ÚxÛ,™∏uE˘\ﬁ^î¿Ä´\ Vp∫û_.ådˆÖX6ñévI\Ÿ¸°¥w\\*0§\◊2cw_\€˘C*ô¸ù¯Ω \„3üZ>Q[\¬¯é.fé\„_mH)\Ãge€∫!ÛπºtLu\„\‘›πTyˇ¶\Ì;ÉäÄ+êZ\‰\Â#\…\0{∏v2]Y6Üé\Í»úü®õ˙¥¸\À⁄Ç∂j)~/»êß\…\0GÇnÑqÒ81å{E´:bz4ø\√\ﬂ\Œ\Êé•72∞^V<s}g5]ze∂V.yΩ*ü\‹å%´â˜\'	\ÊÉ-V<º#≠4ò≥¿`\Œ\’\Ì\Í“æ1]\ƒ\ÔAßñå•≥+\'iCè\r\„^kl7h◊êv\‚˜\'sÜ\—MK\Zÿ°^Øó˜N\‡™\…\ÔV$v\Ïg\n\√\ÿ\Ÿ\œÁç§≤¨isØ∆¥\‚´⁄Ç\÷u™O˚\«v•£û\ E\ÁVN¶Û´¶$ç|å\„¡∏0>+\∆}l^&ù\\4Lÿña-æ9Lë^œ∑|Ä´F∆µˆ|G\—^*O\"ÉYÙ\'ı¢ı\„Æ4òÑüKfÜ48W0A§+%ö‹ìãÜãq\»c\€ÿµ!ûˆ=ù2@uu˘X°ÚÜ\Ã\ÀPá_‹æ\’{ÇfÄ+pdDæ+\√\—a\”˝\Í‚ØÜMvh|7Z˜u]Zm01?g∂¢\”ì_X5YdoƒõúÛ3i\Ô\œÌ©∞us,\rÄ\◊UåÂ≤±!`\Ãa\'æe;:.\\%}\rvld*al\◊Û\Î\ÁB*∫Ωj\ﬂU0336hK∑Üt\–\0\ﬂ\Ÿ¸ët©p™\Ôtj\·q\Îs∑ıj\"~	{≠`úT¬æ2\‘_/éã@5¿E;\Ê}N#\'Ù£ñ?O§\›g\Óê_ó\ —°¢á\Î&\”\’\‹a¥∑_3Z\ﬂˆ\r*lQ€§-]–æ°m\Ë¯\Ã~t~\…hQ[)ùú7à ¶Ù¶\‚Å_ä˚\…˜_◊¶¯íNf˝ 2M¨ùd?VƒØ¢∞ØT\◊\—+®q\ÊLZ4˝:º†q\0Æt†Ûãﬂß5Y≠\Èá1ôTw`6˝\Á^C®\ÓòbÚ˚˙≠|áßì\Ï\Â>\Íá~¯î∂µÉ÷µ®eÄ î∂v˝Ä∂˜n\‰J¯\\°\‚˚;\‘@;5≠∑˙\‹ncäU\rîØ{O*\Ë/CwÑº˜?|∑Jln”ßÙõ]\0Æ \ÏäX∞.#G\“_˙ÁáÅIE£7úı`PüÕçd‹á\‚¸\ƒ\Œt¯\«f¥\Î\€z¥•UmQ\Ê≤R\«#\Ì\Óı1ï¯ÇNM\ÓN\◊ÚÜŸ™{JPmöNßv\”\À\Áø˘ˆ.∫.>\Íi Ÿ†Q\0l∑óºÄ+ôÑ`\„eUÙá∂\“\≈\€O|Ù\≈\—\r\‚|-ß^\Ô^\0áÆJn\‰vRãSØy\—ª$ü^\ﬁw£Y[v=\ÍuÅ¶çö4ê\0\\qVÒ†≥€©x±Pì©%Ø\Î\Â\’Ugm\Ì\Œ\ƒA:D4_h\√Tqº*@è\” Eπ\À\…\"z˘Ï°ØÛ∆ÜÖçÀØ5Ç&ÇM4\’T\…\›\–\—˝\”\Ôz¨ßÍ∫ä˛°S>º?Ä›øF%\’\'óL\ri∞ÒAÒ\"HMH\'‹Ä\√ÙL@Å ≠.âÀúM\‹)\ﬁo<÷ç\Ì6õŒí-C\'{	/,\Ó`\ÍòK\◊n˝ß÷≥L˙o\ﬂ.†{èüQ<Ø\ _J\Ïè\n2ò\Ã\Ô\Ì\ŒvÆF>æ\…wi\≈\◊•\’\Ô∂\Ì˙˚ã\Ëæ]Jˇ\‘mM\\¡Üç⁄çN`K\Z∏†OG\‚|àÜ˛±\À\n!ô˛Æ}vòT\‘wQ1\≈˚Ç´<∏\"y\'ó@Z™jºÆù\'~u}\œX¨	6∫xI7Äçm∂d:H2m;a\“Òª\‰\ﬂΩ\–uëU¥Û\‰µ¯\Ï˘oéR,nt∂\ÿWO`ò\€›ê¸ˇ\⁄{q\ƒ\ÔZ§\€?v^7\Èñ,2#Q6\ƒv<^\€M^§ì\’T@â∫Ñ++å?®Iâg\≈˚j>qC\Ã\Ô_Põ,S∫AÛõ_\‡É=ü†e\ƒT±∏ ù\0Ö\›:Ω/*—¥ç\«(ëú\nqUU@˘\ \Ÿy\“˜uPI7øUIhPêh).\ÏqTÙ_;Õßã∑%`\œ\nó∏ovï\ÿx™ÄÚu\‰\¬-Ò\Œ\‚Ω.vvõ_\“,∂YF<º~≈¢†É√ª	\ÂD\Õ\'m¢d\\19<™X\Ï¨xÄ\r6\€Ô∫Ø\’\n`æÉ+V50YÄ≤R<c_Æ ªq\÷;»†˛%T|\’∏,\È¿\n#Éo¿?∞\◊\"xW[pE´\n\Í(ô∞##Ò4ôó\0ôù\”†2˛ûP\·\ÍîU§∞l\Ï5xêΩ\r\ﬁl\Ì¿Ö@∞\Ïw3<uîï˙-\ﬁK:\\!Æ{Ä\‡˝s∫¶m(K	`)•öa´πÕØ+\ﬂ¿\≈v@%2 \⁄dÖ,\0e%\Ï…æÑ\√\„∏\Â¥ª\÷¯%5Åe!7/¢ˆWÜ\ﬂ\Í†\0œ´	`óê-ˇ-UvÖ\“\Îï\r©u\„\Œ}ë\ra•tÙ\∆KULÑzò\·G÷Ö©\Z\‚\÷\Z¥JÆT\\®Aâº.\‹| û)KMv’ø|tá˙d≠≥\›\‚%i\·L`±w—ã˝k\Ât\Ã\‡í3/Tq(kîÄKµ\≈\0SÅ\·\„\Ì\÷F0ˆ\√´ïRìÉÕ∏\ﬁ∏\–q¨P\›¸õñû¡8É+V\ÔaF¨≤C5\0Np¥y\…&0}<Æ”óoRœπ\€\Ëw≠¶*ü;≤∞º\⁄sXíOœû=£\Ó0\√uº\»N˜\Î\¬¯\“X*p!Ff0$ˇ&\\rLˆï]Æòu\"©∫(~2,\Ï¶A9\€]ü˘\œ=ñVòèo¢≥.%tCòT∞3≠Ä•Ú¿¡\Ê\‰\‹H8∏d©\≈¥õå¨\Z¶™\›\Âß˜\Íüg˚\≈xØπ˚ØTÅÀ∞ªÚ7\Ôã\ÿ!m≠Zºsu\0R®T\ÊãL\—\Êf¯aka`éìÈòõÚvó\\\Óì5≥\‚{\—dè∑òµOÄvóù3\√oÄa˘/\Ìf¶=∏XìÇπ\‚Tçk>#V°\';\ \"vS\’\Ób\Í4{GBù¶jxı˝m¯í\Ë3N<v`∫x\›¿%õ3N¡eÑõ.\ƒ\0l\›\Ô6$\¬!%\’h\—Ó≥âÛ∂õöòBz˝ØN\”cäŸπ,\›<Én\‡í\Î\0≠∂òUz%\\rü[GÜ=7ï	}7\ .\ﬂÛ§^˘¡¨”∑û¶_Oâ{P¸\›Ã•i\r,+/Ü¯\n Ù\Ëà+∏\0˘Å\÷f/^U\√tX§72W;&˜˙ô\—\0Ut\≈\Œ\√˛\‹+´(•ìq˝t≈ª\≈ecÒf\ƒ\‚\»™™T\√Tvj\»\‘9{_BRÖ\‡Vô\Á_º…öu2auIç\0ñ.ï#\Œ…±iRoF,éåHsÂÄ≤=/¥ cìXº˜BBr>∫\ƒ\◊˚qX!]]\ÓnZîˇ:96\"\…\⁄»à•^+\‚\Ïv)†ú\Í\√˚´Kéi•£\¬˛B\¬o∫∫\‹›≤\‚\Ì¯\◊…±I\ŒaD\‡í[¢E\ÊTØéêT°\ÎWê∫uN5ëúÉãc˝6}r¨BbU\—6ã1é<\ƒtí\\•πµuÛ“ö\Õ3∏Ä\÷t…≤( WˇÄãc\√KP˘ˇ[\Ì\Ëâe\Ï*\÷\0\0\0\0IENDÆB`ÇâPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\◊\0\0\0\◊\0\0\0â}ƒµ\0\07<IDATx\⁄\Ì}˜w◊∂¶˛ày\È\Œ¸rg\÷[3˜æô;\Î≠7s\Ôºˆ\≈cccl¿òkõå¡òl¿,¿\‰úA$Å@A$ëÉH\"H$\"cí\…9Z ˆ\‘w\ƒ.ùÆ>∫ª∫˚t´j≠ΩRw\’9uˆwv\ﬁ\'\„yA-Je*üQã\ÍøÛ:˝ıØ•fÕöQ”¶M\È\Ì∑\ﬂˇgz\„ç7\Ë˝˜\ﬂkﬁº9µj’äæ˛˙kO‘∂m[˙¸Û\œ\≈˜˘~\Ôæ˚Æ¯\Ó\¬ˇÒ{¸\Ï\Â~_~˘•˘]ô>˘\‰[˙Ù\”Oïﬂ±Rã-®u\Î\÷‘Æ];\œsL4aúXº≥\’CjS™Û†e§Ú\‡\Ô.Æ/\”;\Ôº#¿fÛã)\0\ ˜\ﬁ{O\‹\0\√7n\‹X¸\‡s˚~Àñ-M\‡ª\r6\„|Û\Õ7C\∆	a∏áLı\Î◊ß?¸Pl6òøé@\√&É±bC:ºÄK7j\’\‰u%†\"ëL\—ûÅ\Á’©S«îíN\œlﬂæ=}ı\’WT¸qòdeê\0∏^Hı}\'zÎ≠∑®AÉlÒ~7¿\“\0\\Y}^3ôR\√O	\ÂÖ¿®¸|H	ß\œ2∞>¯\‡Éêç\0Røì˘96º\‹˜«ªQIu¸-\—Ô¨¶,%¡U2±∂©\n&ìAXEt\Z$™\Z>ã\Ôx±\Õ¸&å6lêÇ\0Z2%Z∫,#ï\Ì¨d0©Ã¨ª\œ¿÷Å\„É` ]\‘2lPoô©Y\0\0ì\r∞tqr§∏æoU•b∑M&s≤#\‡qr`0∞\0Bø\’??7\nÃám9¸õåç\Ô\œ\∆\Ê	/p\0Æ“∂QµM	êlÜdp\Ÿ1!ú¨\n∫\Ÿd∫π\…1\ﬁd©∞ê®P[∞KÛp%\\\‘¡gp\Ÿ˝ù4ïÄeï\"ò# K§:m@x`õºÄ+4æ´\Í Sì&Ml¡\≈¿KU`YAˆ\—G	ê%Ú\›\„ôxá\n\‡ä#A=`[@ÜÉ\ «ô vªÆó†r*$\ÊîHß{c\·¿g\'Ü˙?vb0ú\rà?q âêÆÑ\œ\·;¯.\‘“ø˝\ÌoaûB¸\r;<PW\ÁÖ66\'GéüÄf˚fA\0Æ8≈¥ú\\\ﬁn\Ã¿Ò0=≤*\‹2\Zêé\ƒiD»®∞˛&?ãÛu∞	aèAuKî˝≥ \0óœÑ†b4RÄ≥î¯\Ã\‡ÖX±Ç\r@\„å\nY¢Yô ßì\√|\„-•\Ÿ9oq\0.üm-ØRã\Ã¡Q?THvKÀÅVH>ƒÆ µ\0(d†\„π\ÈÆ∫\ÂZ\∆s\ﬁ¸~SM=\ÃH°\◊Réx\Z⁄∏?∆ÅùZNú≠[∑Æß4®H§$$@\Ìñ¿ã\œ‡≥âHVˆ≤\≈s∏™©áZÉ´iÉ◊µÒ™lv«ö\Á\∆Q%\ÿFCúîõ,èb\"ºá©íΩ°-∏ê_Üâ]Yw5«Å\"\ÏB´çá\Õ\ŸÛ®ır*ûdÇÙ\¬\ÁUua∏7ûë.™*\Ásv˛¸ı\0\\~∏\ﬂu™?rS9\÷\r`¯¨*ñ6rus¥Ñ\0gıä\‚w\…Ltˆ;3&í{3tvd§j  ±ì¯´på\0±\ )T¿â√≤dLeiñJ\Œ\r-¡µ¯\«\⁄fOåtÚ™±ç©I¢íT\ÿAj{%∏\ÌTG\Ïˆ\÷\nh0h™æ_Æ\◊=5JKpq˘~∫\ÿ\nr≠˜ﬁê3>¢ô\'TOnúiŸøµyO*ÇåKStŒú\œT\¬¯gn4j\‘H\0*ñÜ1\0ïwì\Ì6nL\„D¯ú\nå…™êéµÕÇŒï\À∫™Ñ∫{	#Uabëún$É¢^Ωz,P˚¢µ\…]\0Ræo*Ωw∑Æ\“+#∆ø≤6\⁄¯ﬁÅµ\Á§\‡_|!\Ó\ÌDm⁄¥	IPv\ZTUYuM)∆Åe]•óV\‡Ç˜Gß“íhÑŸ•>®O7\ \Ï˝-mõ3ú\ ¶(i\„\Ïî;!ì∫u˛\∆\÷˘!˜∂à\’e\‡!eã;D\…$˜˚Hï<Ii\Ë(Ω¥óÒÎº®ú\≈)Jº\€◊ØWó&Ù\ÎD«ñM§ Ω9Äê\·ﬁ∏\'{\„9\ÿ~êpênr`∞9N\Ê%n\ÿ^)\0ÆHr	\„©jÄ©U˘}™Ù§æø¢¢¨!Q\ J\ÁVO•o\€\'O\ÿX™AML[LW\€+CGºü\È2U\Ÿ	$d$]lõ~Ù>unŸåf\ÓN•9£\Ë˛∂9æÄ\ /z∏}æP7w-C+ß˝L£ˆQ™ú^´≠Ò˛ \≈dıT\«K/\›\‚^∫π\‡£-ä¥\÷©\‹\’Nµ¿⁄Ω≠	ûì\À\'hûhi≈§Å‘≥csS3\ 7x\…8a©ãÉ&q/ù≤62t≥∑¢\…\Ë\Ê∫+f\0Æ$\∆\Ô\‰ùw”ÑæT<c†I%F§xº–çM≥\ÈP\ÓZ3yÄ\ÿD\Ï6π∏îr∞\ÊC\‚=\Î¶&r\»Cßú√åTµ∑8Q;gí´b>H˚¡}\«ÙlKè\◊O1\È\…\∆i5Xv\…∞AZp≠ö5≤\Õ\‚\‡#ò‰£ît\nÙsŒ°N\Ì\ÿ2R\—\ﬁ¬Æäì;\0(ßs´†\Œ\‡sı\ﬂyõÆØÆäsk<∏ú@\'\r\‘c8l†2[¡&gÜ\Ëì\‰Ö.ı^⁄ÄÀãΩ∞\‡3NMcd\‚\ﬁ3˙w\÷\„\rS\È≈ûÖê¢êrv`\”¡\„z/]\‹ÚZÄã;<\Ÿ≈∑∏1•µAåàà’®§÷≥≠≥¿\ƒHπ£æQ#uâáâ3\⁄\ZºÄ\Àz÷ñ*h\n`}ˆ\Ÿg\Á\Õ\ŸJ-É^/\0\‚]Y;]\ÿlêfê`â\Ëg\Ë≈±°C#\—ùÛ	˘l+˘¨_˘\Ë\”h§÷ìM\”P\ƒImD0Ÿéâ.1/-¿•jDÉ¥n[¶:•1Z©82\‚G™Cä%\€—°Küç]íuΩ\Ïv\»\Z*µpO´\‘*a\‡»à;¡\À»ééd§≤âSYö\‡2ù^Ç«êd^˙F\‡~ôùæ\n\÷\”-3\ÊO¡ï\œ^\≈Dú9\ÿ]\„¡\≈\Œ/;ú{ãK&\Œ\ÂéTBç\Ï∞DûÒ≈Å\Ó\Z.\Ó\Ô%!\‘\…\ﬁB0ôSù:5o¨¿Kò|;,Qj\"∑_´Ò\‡Ç\·\Èµ8\“N\r¥f¥#á\–\n¨¿K®áñàäú©Q\„¡\Â5ûã\Â˛ráY˛˘ì\ﬂSJ≠g€≤&\◊@Mî\œÒjäÉ˚\"CæFÉ9`^è7egÜ\\ä@\·ªh¨ió†\ÀÙ|\◊¸Ä¡5rv4mX?§Q)\';\Ÿ\”l≥πô\0Wçw\≈GRfgóüc1¨˘ÖNéP¿\‘zR\–PˆÉX$ld¶Êç´Z\'Ä∞¶\ÿ<±\÷rgbÑd\‹jªj<∏ºz\nπñ¿≤K\⁄\≈\ﬂZ~\“P	¨¿\ﬁ“è~\€>GπV\Î&Ùwî^pjy	\"\◊¯\r/m‘†b\'≤kˇ\Ã\ÕbpüÖô]\‘ˆVê®´=ﬂù∂NG\Ê°\…˝:9Ç\ZLê˛\‰C\rtp/á†Æ\ÀI%\‚[zíuù†&∂¯¥ë\„Z\√ˆˆrÜ≤\…:z\n°6h\–¿s7Y86ÏºÑÅ3C_z∫yF∏∏!©π93Xã©\—YÒvûB®àh±\Ã˝\‹2\·!’úºÑÅ3CoßÜºNàO≤\rnG^\»5\Z\\*O!Äƒ≠öΩff∞^8úö;5äfá¨<á\"Vi£±†q©∏∏\"¢FKFíS\Ë.H9ª¯ YWsßÜ°Æ´¿Öêã\›\Ÿe©í¥õTpEr\‡ÇõΩe\ÁÇaw95<Ü.\Î˘\–\ÁrÛ\‡ír\nΩv{ä\≈\ﬁ\n<Ö©\„1dpTHfB\«&!o–©WG\0.Éê˚\Â%a˝\À\Ì¿\≈\∆k¡\»^Åß0ç¿egsAU\‰3\≈\‡MVi=¢aiMoPm¬Æ*æÖ\‡£∏Ç2ì\‘q«ªÅj!}\ÁÜJÇ\ÈR‚ü≤‡≤û#e¨¿\rü^\‡íΩ\»|Œò5\œ0\0W\‡≤m\„<FÛœÄÅS\'\÷\≈q.ª¸Q∑≥§¡+∏^ÅÜj$\‡¬é\√\ﬂcgÜ]’±p\√ªb¿¿©\ÎBÜÜ\\Li\0Y∑c\\ì\Ó-tKgapa7ì≥\‚4ªF4∏j&∏Xr\ÈrNW“É\»nß\‹\„Öq)ø|\ËÉK’õ0\0W˙Å\ÀK\0ô{\≈\ÎråP\“¿\≈-\’‹™ê(∏^≠{Ns±K{\nJ˚SÉ*v\Œ)9¡ö\¬Y\r∏X-\‘!Ø0\ÈYÒn±.\0J,\\\ÿ\ÌÇ\ÏåÙIÅb[<p\Èr∫dR¡\≈m\’TÒ\n¸yª\ÀjóSÄ+Ω¿\Â%ıIóñjZÄ∫±\Í\Ë \ÿYhX\‚îS\»\‡räq\‡JMp©\ Nº\‰†\‡RÙâ∑∫\‰5jdVh™¨x|\«1\∆Ä+%¡Ö5eûê	1Q8±ú@SAó\‘\'möÇ\ \ŸÒ8ã\ﬁA\0ä£\Ôv\‡räq\‡JMpaM\ÌCÁÆΩ\0ë*Ñ£KK5m¿≈™!˙e\‡Ö\·\≈Y˚$\»\Át\‡Jop!n©JÅ\¬\ÀyÖ\ÿ|ë∏k\r\„\‡≤–•yU^CÄEUÖlw∫	\ ∏“ª`\“\Œ\Ê\¬\Ÿm\0FŒàGù`\0.\’\–KÚÆ[\ÍS\0Æ\‘ó] Ÿ≠\ÎìN˝\nµó[\Á]’°w∏\“\\àoF\“ıI∑\‘\'m¿\Â%†å˙ù\0\\\È.\ƒ-U±.7W<ÛD\0Æ\ T∂V \‡J?pq¨ΩQ¢ó.©OZÅãUCk@\Ÿ\Í1\‰\Í\„\0\\\È.éuE.xõpπ®Ü¯\ÿ\È\‘,±∏\n9\0WzÇãc]rN©∏tj™%∏X5\ƒKUÅ™∫∏\“\\™Xó[n°.ßIj.ß2>îAés\ÈO\È	.U/\r∑¨xùZ™i	.r\√T™!2\‰e5!H\‹M_p°Uû5\÷\Â\\:’™5∏\∆w\rW\rÒ3R]\‰L\r/\‡ä§ïıÉ\¬	t∑`d]\À˛ë.N\ÌfK¯;ﬂèÖ\…pØ[πÉ}9TÆ|psÒo,˜êﬂÉ\”;\0a\‹\÷w\Áı˘*p©\…n\‡?\Ëî˙§%∏TßüpäãLv;¶\’Kô?\‡JV*\Ìˆ∑≠\Ì\Ì˚\ÊM:˙cS:=¢uUá\ﬂ\·3¯@+∏,\‹\œ≤iö\„F\¬\‡¿g˜i\Ë\Î;\0a˛vc0+ëw\Ã\r[7U¨\À\r\\:u}\“\\≤j®ä\ sº\ÀK%≤∏ò°ø\ Åë¡\– y~H.ê|O~éıYâ$\'†[O:±+öt;\·ü\◊)ØP[p±j®j^√™!í6\›zh®¿Ö;ªt¨\‰á\‘bHuõÄç\r\Õ+∏p∏º\√\ÿDô\‡nWyíu:™U{p±jàjdª\ﬁÒ^∫?=\Ÿ∫[≤˙•ù\◊1&\…N=Lñ§rìbÚ\\\Ì¿\ÂV\◊\≈ˆòÆ©O⁄Ç\À-S˙7∫Bπı-\‰v\÷XL,™RE˚˛c:3∫]û\’Àêj#\Ë¡öq!Ñ\ﬂ]ù\◊œ§Ûæüó	˜ê©§\À;\Ÿ%ÒÚ\ƒ¡∂ä`\÷yîg~6W˘]\\\œˆæ@¯=>ãwæ∑\„J)\∆ t\ËR≠NÆA∏\“\n©L\À@´Aa-ü:\n^X¸c\Ì\0\\ëQZ¡%øP∑@2t}´\Z\∆HT`Úõ¨\‡¥˛OW7ò\ÿ\È˘Òû?\œ99¨E–†¢[\œE∂∆∫¨Y\Z0¨∂∏é\ŸZÉÀÆøÜ\\\ﬂ\≈=\„\ÌÄuw\Ÿ\”àÖ\≈N|+HB*äw,Ißπ^ò⁄ïˆ|\ﬂÿçúA µ\„XóHN•\‘\'≠¡%ßC©TC7w¸ÉU\„åE¸ÄJª\÷jïRõ\«ı§)=ø¢\·\ﬂ4£Oﬁ©m“ü˛¯\ﬂ\È˜øˇ}\‘$\ﬂKE≠\Zæ%û	*˙≠á\ﬂ`∫∞z2\Ìû3òf\r¯Ü\∆ˆjM?¥n\‰:Æwkˇﬂò\Êç\ÔÛΩ∫4´oŒØ|˛O∂™#6;lz∑rá\ÿ∆∫\"lı\0\\>d\ C5t\Í∫{bps˙uˆ˜\"é\"/*\0+Ä¸¶?˝\À®GãF\—\Í\Óñ,¶˙u˛]´πÒÜ£TvhX+lÜ*p\…\Â˛©î˙§∏\Óœ´Eß\’\n3~ÎΩ°NáB.3∞z±`Ú±≠O∑\Œãô˝C;s¡[7˝êFˆ\Ó@\”vßmsGz≤E\Ã\ƒ˜≤£Uìã\ÁÇ0Üw\Î\‘aƒ∂ü\‘@âX\Î&ı\05¡˙?ˇÖö5|èukOc\ËF3áÙq◊Å¸)1\œ˝Ùö9!s¸ÒõT\Î\œˇfJ∂+KGVÉ´p|»ô\»Úö…Ådˆ\n:ë\\\¬ŸßäópΩ¢;Yµh_áZJVﬂÜ\ÍLy\Œ\÷¿\ﬂ˙¥˝\Ã5ød\Œ\–WR‚èæ0í_Ù\Ï`!]ÿæîf˝¸=\’˛Ûøä1BäE¢2®z¥lB\Î≤FR\Â…¢zQæ5©s\Ï\⁄\‚S1æÆ_|dÇ\ÎYQVÿ±≠™@≤pq*ú\Èç\ÏP\≈S∏\¬n#SÂºµ\ﬂ7µçy\·ÖC™!\‡\Ëv√†éüWÌ†Ü§àòAJ\◊–É=ts\√¸®\ËF\·\€{Wîm4Ap∑d\r\’˛K\’N\–xÄà\œ\œ\Z“ã*Ol\r”≥Ck´ü[≤äXı|nÆõMv\ÊF$\ÕyêÅ•\ +¥ÇãKå\Ï¿\≈\'õÙh˛±\‡3û\÷\'\0= ©Ú¸T‘πe3\ÂY^¯?´nY\Z,f\ÎOœéU”â]Ù\€\ÈΩ!Tq\·==SJ∑ˆ¨£k\€\n|°;W\”\›[\Ë…â\‚\Ígù\ŸGïøî\ZTBïgã©Ú\‘vj˚Y\„*∞ˆìp±:XVòMïßwV\›˜ªxê*Ø≠¶´\'\Ë∑_\”√£ª\Ëˆæ\ræ\Œ\Î\ﬁ¡-a\ÔY˘éê˜\\˚\ﬂˇ\"\∆Y8\·{«§]ô\ÍøÛ∂ôe.Æ\„*\ \Z\"\Ó	b~o\’hp][\À,\⁄e)¨ô<¿6\Ê≈û\"´«∞ıGuï\∆ı≈É;\Ë≈ï\„@v\‹(^OOo˛Jø›ΩIáwl¶ù´Û®d\„r*5hÀ≤ìV\ÂfS¡\‚l*\\öCª7–∂µKhÖÒª«è_OÆ^åxsw!=:^,¸…©˝√ü§ó\◊OõTyfó∞ëX5t≥Ω\ r´%ÇêP®\‰˚1=øtåûù;Dè\ ˜\–\√cª\≈Xn\Ì\ﬂBï\œ+\Ã1ñ\Ó\ŸEÖ\∆|vlX.\ÊÄ9Å\÷\Ê/0\Á∫kM\‹\\@˚7.£≠\Às\Ë\Ó\ÂÛ\‚˝<8}DÄs\nyóÀåg•Áóè\—¿>]ï\ÎQ:\À>71L\'p±\‘j’¨QH\ﬁ(\Œ¡[5\Z\\\Â˝kôi1Nå\‘Ù£˜ï›°©W%\÷˙?ˇ;l!a\‰W^´fh¸å˝≈Ø\'\‡ûû.\0∏[∂\«dºä\ﬂ~£U˘i˚Üe¥kc≠^≤\–d<+m]ì/\0∂e\Õ:r`?\…\◊\√ÛÂÇ©\Ÿ*1H .s\ÃÔø©$ñ\ƒ!\‡2$ü<?+aû◊∑Ø§\Î;Vá\0Àú\„z\Ãq9≠\Ã[`;\«\"x™9b#\¬}\Ô6lº_\À\√\∆q±tã\\vÙ.U%2k-•9£BxÖ≥q¿[5\Z\\lo©í:eö=∏ª2ôóù\ZVè°j!Û&™√ÖJ∆É\Zxc˜Zzt\ÈL(n^øFW\ÂÜ\Ì\Ë*ÇÙ*6vˆùÉ\Ó⁄∫ë¨◊ΩÚR0Hë`]-ØR\ÈÄ`à\∆›Ω;z¿\Œ\Ìµ\‘A\0†\‚·Ω∞9nX\·qé\ÀQÒñbé\≈\€B\Á¯\‚\Èc∫mhwJ6 á\Ã\—PW\Îøı◊∞qè¸ˆsO\‡≤6\Âuá\…`\Â\Œ!M∂›ïtpïvˆÆ˚\€\Ê\–GoÖó¢p3H/\‡2–∞G‰Öá∫5\…\ t\Ãxõï\Ãt\È\‹	ÒªÚ≤√∂å∑\«`<\Ï˛{ä6ë\Í¿¿\‰&\”¡6Ç\ƒy\Âx®˝ˇBÉπà[!,TF\Ÿınn\Ï¿\0P\rI(\œÄVKûcÒ\÷\’Ùº¢BH≤\’KªÃ±ÄˆlW\œR˙VÒ:°é\n\Ì\‡¸>€ç\√+∏¨ˆ6g\Á\\Y;\›\\\‡≠\Z\r.v¡\À\‡ÇﬁåLq´[~R\”◊îùyU9Ü\Ôæˆg{p1^:LèO\Ï6É¨&\…l\'H.◊≠\◊m¡µ\’Pï\\Gïê\›u´d=9∂Ω\ ˘ yÙÓñÆ\r	,#~\Â4FLå?èòVòóL}˘à)µ`©.Ä	\‡⁄øc=›øsS\Ãq˝\ e.s,†\√˚ãm\Áàg]ﬂ∂å*ém6«£\◊\ \·\›<ÅKegwoö≤îÖ¡\ﬁ\n\‘BK=2\≈\Ì2∑T∂\⁄^–Ω≠\‡\⁄6Ò;˙°uìêÖÄÀ†˚ªñ“É≥G\…\Ì*»ôMŸì¢\≈”á–¢©ÉiX\ﬂ\Ó4‰ªÆ!4f`oZ2k\Â\ÕJs\∆§\À\Œ\€\ﬁ\Ô≈≥\'tª(?ê><V\'`\…\ƒ\0É\ƒsr\√?<w\‹qékó\Ã7\Á8g\‹¿∞˘Å¶\r\ÔGÀ≤Üã9\Œuô#\œÛfë∞£õB¿Öçv£ì‘í¡eµ∑†ΩÄ∂¥™\Ê`ÏíØÒj!ÉKvh∞˜ˇ–åŒç\Ì \ËH\ﬂFb∑≤ï\›\‹ÒM\ÎΩ.,¯Û\Á\…\Àu\Á\÷Mö<¥\Õ\ZŸõ\Êç˚ûM\ÏG\ÍJv1®+\Õ÷ì`\»◊óf\ÔE\Î\nr]\Ô˘Ú\≈Û0Ùh\◊\‹\Ã\“\⁄\Î\‚EÒêF+v˝L\ƒs\Ã6h‹Ä\Œ4^Ã±\ÕÛ›´9~/\Ê∏aeûßw˜≤\‚©p\À\À\‡Bö◊ã=Å\≈\ÕA.d\„XX\„;˝MÜºÒZ\Z5\\r\ ø.É\«\Ôêw\∆/˚\“Ùû¥Ûˆk\Î∞[$H0;\Z\÷/úÒ.¢óoä]\÷\È∫rÒ\Â\ÃK≥G˜∂pB?Z<πø†l\Ÿ\„˚R\÷Ëæ¥o\«fwÜªsI0ºu,H[b\ÊÛÆ¢\ŸT±s5y\Î?\Ï\Á\«.˙[ø\–Àß]fù#\0\¬\œ\ÿ<\Êé˚Åä÷ØrïX\0û…é\Zy~êª≈∏8àåÀ≤\‘B2\‚_HèbpqÆc~oqÆW//…ú .UG\÷4øldO\„wx\È≤j\»:∏\›\·\„p˜\nâYc[\’	L\0;\Ë\ÈÖcTqˇ∂-\„=∏èäV/†-Y¥ı\Ì(\\Hvm†\'èªK+x\œGòU&\œ]öp=\€:ã&wo\Ó>øWÙÚ\ﬁUWü:zêvm\»ô#~ﬁªu•\„_8AON\Ì£Áßãm\ÁáÇhLcl\nN¿:2HXlìùW\\ +˜I¿Ø∫pÒ\Ôk|ú9`¸2Pö.íY5îì:ÒˇıC´î\\v\Õj®t≥Kdz≤%=:ºôn\Ó\\Iè/üqõ€Ö]¸\≈˝\"û&\Ô\‚VÇC\"“ºB¡†¶“©úüM\’N\◊9Bí ´∏{Ébπn\Ó\ﬂOw˜¨¶G%Ö¶m•\"∂\'Y\Âµ+\Ô∑K\ \ÂF0;\0è7Zà¨&s˜+P≤Ûµ\»-¥+ygè\·ı™w4\√\Ó\ l\⁄¿ÜcNù†8®luj∏QE˘6\·¯∏π5_\Á7˜nN0ñ	Ü+\›D˜˜≠@ıÚv¡ÔöùqC\Õ{+FAòK\ﬁmn07Ä\„\ﬁ\·bnª›º\√¬ÜÉwáÃìÖûûÛ\‚\ƒ6\”\ﬁ\ QUøÜûín\Œk56Q\Œ#Öâ¿˝G\‰w\";√Ç\ƒ]…©Å™akß&¸uY¸\“Oom\⁄]\Ïí˜ÆEô\ﬂVgiD\0.[\Ô[Ò2%9\Ì\ﬁv[	cÉ\„%íRv\n@-⁄ïıì)ù=I/©m7∑h\ÔY∂f^àJ(¿eS\ﬁ/\Á\¬Qeµ∑fváÉã[\»\ÔÑ+œÉ\ƒ\›WtaD®\›%ø,±;/í_˙/ì:Saã*pÒ\À˜.V\r£ë^Ò$x¯x\\´GE^ïµ•ÚO∑\Ã0%\·u\‘e~≤óPˆÇ:y¢™x&\÷*°.kø\Ê#T\0ÆWÖí™xªU±3õEtÜä\»NçH¿ı∞p¢\ÈíG\Zé.å\«YP[·úà\\ê\0\0◊Ωï£Ö\ \≈@YÚ\Z\Ão›ú±’õ\⁄+/(\¬N\‡\‚*dk¢∂\Ï∏¨˘®r\Î<\n&µ©D\ÊL\r´jù˙ˆíüC_æÒπñ\ÔVW({◊É\’\„E`ô\Z	≤\…f<VA™¶#\Ó\Î^4[Äæœ∂W¨\Í°Ñ\Á≥˚\„ÚZj\¬\Œ93\„\€ˆmCD\Ï\”bo±Jò\Ï\Ã\Ì¿%«ªd\’ı9–´C‹¥}	èa$í\Î˛ ±!1ØHçø	™©5ø6TƒßÑ\Ï\Œ\‡NCEº≥yñôw\Ëá}∞8Q„ëã?Ωz\nep\rh\ﬂ\\Ù2\‰\œ\\õ\◊?§˛OV	ì\ﬂ\“\\7¶©UCé]\»/N\rxπ:ô¡eÁ™í\\\„Ñjàüª~ˆAuiºaü$zá∞xG\«X\"=ë%¨ª\Ó¸\Ë\Í‹æØ˙4Nß≤≈£LÄ%c~P\Ÿ˚˘ß?˛:º`X\»x°˛:Åm∞û≤J8§˝g!\…\ŸXOŸô!´Ñ\‡•\0\\=\ÕW´Ü¸e\ÔºáH\‚˝\‚ìPo°”Ç=\\3A,ˇ	£r\Õl0Eºùú\‚$Zºˆg∫∫|åT•h¡uc\·@.û\0ñ7ºá˘0zº•4\ÊU[\Œ\Í\«∆Å˘Y\’]7O!∑≤ñ¡ï’≠yàfÇ˜%ÉKV	¡K∏TC~qTñAe∏\„¸™ëgp=Z7ô\ÓØÚ;,º™bY\Óú¿E\„]≥·ª∏Äk≠eb\∆Sı¥è¯\‡Öº!\\wóKÍ≥°\"M\È\'$á™+\ÏΩh\ÁÖ\Ô¨<7kô6-πåßK⁄ì\n\\v6=Ö\÷ÕàC6:©Ñ⁄ÅK\Œ÷∞î≠ª\›∆éı(´]√∞\‡¢Y¡≈Ñ\ÿb™\Íe\‹\»\È˚X\¬y!??\ZGÜlø\‹\Œj\ÿ\\?\“Ìº°asÄa\”\… ≥¿\·6\'U°£ï∞QY+ã!E≠6b4\‡\⁄<y@\»gdp…Åc∫>i\€îã\'ANßa °wy\€z&∏\‹z\∆p≠\Z\Î˙\0\r*#ÄºÄ\ŒH∏«¥ﬁ≠†XR9ù\ƒ-∏\‡-î3Y\Ïb}<7\0!ñyÅpûõmk;K_\’awn\‡\Í—æUXW^9\Ââ˘%\Ÿ≈ë⁄ÉKN\‰Eûò∏ê˛\"É\À\È(!Y5π}\Œ	x`$7\¬\Áº\ﬁ3©UDû\"¿U%ΩD5//s≤\€\…PM≠P7O°\n\\9\ﬂ4Rû^#ü§©C¢Æˆ\‡í[≠°å¿n\«\„\ƒM\Z˜{Ypë\”f,z¥\0Ûì‹éïıB\'ò\‡Ç\Ì\ÂE:\'Ñåwå\ƒbU\–;pAj!ÙbΩ∑\\û§K+µ\‘8¸Æx\ÃKxD9\nß\≈8ùçl\Ì¿\ÎE5IÛ¡˛à\\≤\‰=\\;1˘õá\r∞8]\À∏8A ª\›!\ÈoÚ¶Ñ2≥ôl˝¯XKp\…1/™¿ªkdªO©œß\ÔE,-∞¯∞wí≈Ä±™ÉfÚnÒ∫≥dò	.∏\„\≈\Êë$Ä\·˝\⁄m\ZniO2∏∞aBjY´\"\‰5\‘1∂ïßúpÃãÛ\«Te\·\\v0©Õá1ÄúUFÑG+QÃág˘,ïj†1#˚&A É∫m\'≠B\Í\œ<\‹ˆ3*\Õ!µ∞æv-\ Y%\‘%\›)e¿•*ˇWù¡Öø£Qâı\Z\'R\Ì¨`F0=≤¸îh∏vZ0Ñj†íiçqÀ™°ººâp\Â2\∆ıÜbÄU\Ã«∏\ÓI€ã3CTégv°éü56{®®T{\ŸK®Sl+%¿uubx@Y\≈8\‡\ŒZÛ\ÂóJ∆âñ¢\…åÖXgp\≈\Íﬁèyqfpâˇ¢UU\Ë(1\n[?Cr]UB≠¡%ó°∞K^u85Ú≠çl\‹(ö\“\›IV\r\ÔØ£\Â#QQ˘¸d’©ì\–2‰æñ∫§;•\‘…í\÷D^Utü\ÎªJ∫‘ãHUK7paN≤jhM9J6y\…Ã∞ÜY\‰\ÊD÷å\Óv®áæ¸õR\‡≤S-úv9;J¥\⁄o\‚L\r&?bh~€Ö^◊Ü´åU\⁄´Ù∫Ù&LYpq*îúgh\›akAj\Ÿ\È\Á∂vóãg+Ÿ∂I\Â˛‹à¡u%\Î;¨{£ÑK^ß9πïô®\Ïh®¸vyä∏\‚–çów¡´s˙Üµ∫∆¢x∂ª∂e%ù\·¨˝BL&\‹0Ö*≠† í|\Ôj\·\Ê\È&∏~P@yg\Ÿp}\‘Vè\ﬁI8f¨\Îä\ré¨m\‡ä∏ôÁûÜV≤\\\œ‘£òº{#ïá˝¡\ÁD\ÂæETyjágÄH\0\Êèˇ\„\Á≤˛üh,/≠´≠±Kô∞\÷Xs˘ûº˛gá\‡ä)\rJ\Œ1î\Ì\„s\ÔdXúHÉ\…\… ’ëIl7ôﬁæ≤µÙÚ\Ã.™<≤¶\nl.˜\ÈOØ§!~>5¨•ˆñ\«\‡1à[Tc]A\"˘†πeµ]ûR\\r\À5kG(ºtπï\œ\¬UmÉ\…1Tˇ\∆J,ç°\¬Aä>Z7)$ç\…¸\Ï\—ıTYæô*èo§\ “•ˆG∏ˆo\"æ\œøN\‡RÖPl;?ΩZoñTàga≠≠\⁄K\0Æ8Åªòµ§ú\ƒ\È5[í\"ô\‡Ç]${¯¢ıˆ\·]îg~!\0\ Y∏~óJˆl+U0\ƒ9\…\«\⁄.Y\Á\∆n¶ZD\Œ5Û™\ZZ´d\rÆK\”{ò`\¬\œ2¡vÚ´ÇS.k|\«\n\÷CΩ?L){\Î\ƒ+u\ﬂ\⁄2ç{¿´\ ˙ë\…Ä+∆≤´§R´Üaı?\Z∆ª^=\r\\õﬂüˆv®b\ƒ\„ˇ\Á\'|c0®Zr-\0\≈\‡:¸\›G)coA\€\‡x• ã™Zg\›\ ˙S\n\\Hk\·óh\›\Õ\‘\Í«¥àΩÜâéw=\⁄>Oú\Ô|a\Èh*\ÈVü.L\Ó,Äp5\Ôg∫î˚3õŸè ¶ˆ¶cæ•C[€™é¯l*¸+K≠\ÎyÜ\Ã˙éNN\ÈAeì∫ã3ÉAw∂dâ\ÁV\Ï^†e|\ÀN%¥€òt9l!e¡Bzã◊ó.{\rΩî\„ïg¯t\Á|¡\–`\Ïì\À&*\ÕF%Y?	R˝\rt0g$]\»,8.\0\ŒcãFPY\Œ\€\Ô\⁄QY\ﬁX1ûÛ´&”µı3\Ë‚ôñãJ®:M\”Ù ˆØÄ\À/ªKÓ∞™z\ÈX~Ò^s\r˝\»3Ñ4\0ÉHg\n&—°≈£#fx\':Ω|Ç,3aC¿Û¸|\Ë¯íqtq\ÕT∫πqñê∞~rFö®ã5T\≈ˇT*°\ŒˆVJÄKn™Ùs9CZ&ØπÜ\—$π2ò ¸fr+\√€©r\0Å\ﬂ@∂K∑h\‘IÄ$\⁄¿1T?´\Ì%K∑NO)	..?ë\ÊDP#Yï¥\Ê¶ymˇ\Â$°¿l~30\0¬™#\Ó\œv¿\„eL¯á•\'\ﬂ\‰\0±ë@\’ı¨\Zªpg\rc›º¨3>£\√)&i.kÒ§äê*≈û#˛¨W\’\–Küv01§àWFd∆ñôû\ÌêjW¥\ƒc`õ™`$ Ùz/ùu≠πÑ\049æ©\"\›\’¡î∑]CI7Ä\¬œ∞…¨ªò¨Jzçyπ1\n§Å”é≥&\⁄o&6ßç Ñ\√\∆<O™∫,¨5\÷÷∫ﬁ∫µOKpE”É\√k:îìK\ﬁ\…y\0FL∑\¬Khv É˙\Íáû\ÀKRE\Z‡≤¥	Ûrr\…\€\ŸYP©\“X^6\')Ì•§ü´\»u:ô$\0WÑ12Oé\r©ã´ï¢aÆt\";è®ù\ÌÂµ§üc[∫vo\n¿\Â¡	Çäód^ïjh∑sC]ä<ÅuZX]R\‚ìhß	∑ót2≥ú≈∞\'#Q\rΩd¡s[<]\Œ/¿CåÃãcC•\ZBı≥ÛFí§´:)¿B¨àKvêõ\Ë\ÏêPël0^TBvd\Ë\\IÄÀÖP©\Í\Ÿ-ØP\r\Ì\Ï≠H¿Ö 7ò\Z)\\(jåTz!I#\Óá{1∏\0çLvÆl|c¿}›íd\›\ÏÆhΩÑ\‹˜$5\\Ú©)^§óµa®]N`$\‡íA ÄÒ!5¨`∞í*\Î=R\‚BC\0‹ÆT\'pY]Ú^ºÑúëë\nY∏<∫ÂΩî¢X\ ~ÇK•¶Å\·Y˙∏Åç	@ë•\Ó!KµDz≠Iø^TB¨C∫K≠\Z.π.\Ã\ÀqrÆ°]÷Ç\‡Jwº./Ω	\Ÿ˝û\ÓR´∆ÄK\Ó$\ÂEz\…\ÂˇN	µ5\\\»<Ò./Ω\‡kä‘™Q\‡äDz\…e(N9v5\\vS9\÷Â•ºÑ•ñ\Œ-®p\≈(ΩºxŸ±\·ÆöD∂ãs\…Y*^ú\Í§si~\0Æxπ˚í∏\‚Y¡´\Ÿ9u\\^ö\–p\\K˜\Í\·\0\\>ƒΩºdm†Ø°∏\‚ô[\»q(¿\ÂTäÇ\r\∆-#Éõœ§ka\0.E÷Üı kïÙr⁄µQÜ∑#w`#˜±.´ÎùÉ∆áz5vLº3\„ù6ò{[g{.Ü‘π\«`\0Æ8\‰∫eÃó\ÁèIäSÉøL\Ï\\\’v≠M-ìé|\ﬂ\»<I\”K°g,Ñí\Zß˘\ﬂZÎ≠´S:ß9\‡ä\“5t\·p_™rc9\Êj\’ı\ÏÇ¨™¨ﬂáóGboï,A\◊WéwT9\Õ)ïäp˘\‡\‹í\‘{.w$\Ì\œ\Ó\ÿ¿%û\“À©5Yº•º°N\À\ﬁŸÉ\È˙äqÅ:Ä+:ı\‡⁄ìï\ÈXÚûàÆµ\‚{â\—\Ã\‘.Ñ\rßx\∆¿à\À˜p\’ \‚ºCªÉÛ.--òh\ﬂ‹°∂åIG§tq¡c√±Z⁄±w∞&™É∏$\Ô!´ÚB\ÌÅJéL∏\◊™Ç∏Vw8™É\„j\Ô\Ì¥C`£\·w¢≤≥“π/F\0Æ˙\"ZÌØªk&öå¥w\Œœ•~À≠\È(Äó»¨l0¸>é\ÃR\„J˜p\≈hY;ı23Å\ÏúÒpl8µsì\…\Ôà\0µ]\‡N;pAÚ\◊t;+\0óK_zkˆòHòùz\Ë∑ÙÚ⁄§\”\Ôˆnvâ∫˚\Áypˆ®JIjRF\0Æ(:F¡n`ÄùX\ Tv\ﬁC?m/∑Ãàx=\◊\Œ÷í\’A¶_ÚGÖ80“π\ŸL\0.ÉÀ≤ë=Ü2\Ÿy˝Ú:e¢\«3`\Á!d\Ô†Lpˆ\»¿™\Èå\0\\Äãv}\È®0∆≤≥ø¿\Ë~\ÿ@Nnxïøÿ©É≤wP&\ƒXHà¯\'\0ó\ÁC\Œ9\√\0\0\€3µ?\Ìù9(å,\ZE\r@\…Tæl|\Ã\ÃnΩß\›\‹õ[\ﬂW›∑t¡\Âº˜N\Ëe¶6\’\‰,å\0\\QÇKv-Ø\Ì¯.\0\€7kPÌüùIUI,ôN\ƒ\00îqX\Ô\ÁFø¨û5∞nmö•º\'Nµ¥\Œ¥clOZ\ﬂ˛\Ì	Ä+\0W\ƒ\‡bÄmlYõñ¥yõvç\Îiµjπ:o(\…F\ÂK\«”É¢πQ\Ÿ[™˚π—£ë©£\≈lüu8wï\Œ6W\Ã?ØE\⁄⁄™∂ô\‚Ä+\0W\‘\‡\œlNπ_‘¶|É±vè\ÔI•≥\n°ÉÛáäÄØä¿¿è=2˛›≠≥m\Ô\„F\«Ú\«yz@uc\„L:aÄ\ﬂ\Ó^å\r\√:G\ÃÛ\œ˚¢:\ÿÄ+\0ó\'z±£=∫xäj.P\ÈòŒî\◊‹ê`-\ÎP\—–Ø\È\‡ú\Ã:ú˝3[2Œñ \….NˆÕ≥]\Ÿa}\√LÒß{x!<\„°!1e¬Ω\Ë>≥bí\Î˜1\Î\‹0_\Ãtx|\◊\Í\0ªÆ\ k\Ë≈ëq/\‡≤\–\ÍzÙÚÒØÑ\Î˘\„`™<\√\›cª\”Rc˜\Œ7v\ÔuΩ>•˝S˚—°πÉM:≤`òhªñ™ÑÒ\ÀÛaûò/\Êç˘\ﬂ[31\\∑˜Æ\Ô\Óe\≈zææq¿O∏™©ÚL.YØgeõ\√\0v|¡\œT:≠≠\Í-1vÒeÜ\€=≤≥\»\‚`*3\Ëƒ≤	)E(ï\ÁÅyÒ<Ò\ÔæI}\Ë‘¢\·u˘K!\Ì\Â\Î\Â\ÕO\‡zE\∆NkwUú\Ÿ\¬L\◊\nõd˛:î5ê∂g∂°•\Õk	\⁄6†Ö¯=\”QÑû\\>A{\¬8è.2˛\Õ˝>7Á∂Æ{#1_¸˛\÷*©ÚxÛ,™∏uE˘\ﬁ^î¿Ä´\ Vp∫û_.ådˆÖX6ñévI\Ÿ¸°¥w\\*0§\◊2cw_\€˘C*ô¸ù¯Ω \„3üZ>Q[\¬¯é.fé\„_mH)\Ãge€∫!ÛπºtLu\„\‘›πTyˇ¶\Ì;ÉäÄ+êZ\‰\Â#\…\0{∏v2]Y6Üé\Í»úü®õ˙¥¸\À⁄Ç∂j)~/»êß\…\0GÇnÑqÒ81å{E´:bz4ø\√\ﬂ\Œ\Êé•72∞^V<s}g5]ze∂V.yΩ*ü\‹å%´â˜\'	\ÊÉ-V<º#≠4ò≥¿`\Œ\’\Ì\Í“æ1]\ƒ\ÔAßñå•≥+\'iCè\r\„^kl7h◊êv\‚˜\'sÜ\—MK\Zÿ°^Øó˜N\‡™\…\ÔV$v\Ïg\n\√\ÿ\Ÿ\œÁç§≤¨isØ∆¥\‚´⁄Ç\÷u™O˚\«v•£û\ E\ÁVN¶Û´¶$ç|å\„¡∏0>+\∆}l^&ù\\4Lÿña-æ9Lë^œ∑|Ä´F∆µˆ|G\—^*O\"ÉYÙ\'ı¢ı\„Æ4òÑüKfÜ48W0A§+%ö‹ìãÜãq\»c\€ÿµ!ûˆ=ù2@uu˘X°ÚÜ\Ã\ÀPá_‹æ\’{ÇfÄ+pdDæ+\√\—a\”˝\Í‚ØÜMvh|7Z˜u]Zm01?g∂¢\”ì_X5YdoƒõúÛ3i\Ô\œÌ©∞us,\rÄ\◊UåÂ≤±!`\Ãa\'æe;:.\\%}\rvld*al\◊Û\Î\ÁB*∫Ωj\ﬂU0336hK∑Üt\–\0\ﬂ\Ÿ¸ët©p™\Ôtj\·q\Îs∑ıj\"~	{≠`úT¬æ2\‘_/éã@5¿E;\Ê}N#\'Ù£ñ?O§\›g\Óê_ó\ —°¢á\Î&\”\’\‹a¥∑_3Z\ﬂˆ\r*lQ€§-]–æ°m\Ë¯\Ã~t~\…hQ[)ùú7à ¶Ù¶\‚Å_ä˚\…˜_◊¶¯íNf˝ 2M¨ùd?VƒØ¢∞ØT\◊\—+®q\ÊLZ4˝:º†q\0Æt†Ûãﬂß5Y≠\Èá1ôTw`6˝\Á^C®\ÓòbÚ˚˙≠|áßì\Ï\Â>\Íá~¯î∂µÉ÷µ®eÄ î∂v˝Ä∂˜n\‰J¯\\°\‚˚;\‘@;5≠∑˙\‹ncäU\rîØ{O*\Ë/CwÑº˜?|∑Jln”ßÙõ]\0Æ \ÏäX∞.#G\“_˙ÁáÅIE£7úı`PüÕçd‹á\‚¸\ƒ\Œt¯\«f¥\Î\€z¥•UmQ\Ê≤R\«#\Ì\Óı1ï¯ÇNM\ÓN\◊ÚÜŸ™{JPmöNßv\”\À\Áø˘ˆ.∫.>\Íi Ÿ†Q\0l∑óºÄ+ôÑ`\„eUÙá∂\“\≈\€O|Ù\≈\—\r\‚|-ß^\Ô^\0áÆJn\‰vRãSØy\—ª$ü^\ﬁw£Y[v=\ÍuÅ¶çö4ê\0\\qVÒ†≥€©x±Pì©%Ø\Î\Â\’Ugm\Ì\Œ\ƒA:D4_h\√Tqº*@è\” Eπ\À\…\"z˘Ï°ØÛ∆ÜÖçÀØ5Ç&ÇM4\’T\…\›\–\—˝\”\Ôz¨ßÍ∫ä˛°S>º?Ä›øF%\’\'óL\ri∞ÒAÒ\"HMH\'‹Ä\√ÙL@Å ≠.âÀúM\‹)\ﬁo<÷ç\Ì6õŒí-C\'{	/,\Ó`\ÍòK\◊n˝ß÷≥L˙o\ﬂ.†{èüQ<Ø\ _J\Ïè\n2ò\Ã\Ô\Ì\ŒvÆF>æ\…wi\≈\◊•\’\Ô∂\Ì˙˚ã\Ëæ]Jˇ\‘mM\\¡Üç⁄çN`K\Z∏†OG\‚|àÜ˛±\À\n!ô˛Æ}vòT\‘wQ1\≈˚Ç´<∏\"y\'ó@Z™jºÆù\'~u}\œX¨	6∫xI7Äçm∂d:H2m;a\“Òª\‰\ﬂΩ\–uëU¥Û\‰µ¯\Ï˘oéR,nt∂\ÿWO`ò\€›ê¸ˇ\⁄{q\ƒ\ÔZ§\€?v^7\Èñ,2#Q6\ƒv<^\€M^§ì\’T@â∫Ñ++å?®Iâg\≈˚j>qC\Ã\Ô_Põ,S∫AÛõ_\‡É=ü†e\ƒT±∏ ù\0Ö\›:Ω/*—¥ç\«(ëú\nqUU@˘\ \Ÿy\“˜uPI7øUIhPêh).\ÏqTÙ_;Õßã∑%`\œ\nó∏ovï\ÿx™ÄÚu\‰\¬-Ò\Œ\‚Ω.vvõ_\“,∂YF<º~≈¢†É√ª	\ÂD\Õ\'m¢d\\19<™X\Ï¨xÄ\r6\€Ô∫Ø\’\n`æÉ+V50YÄ≤R<c_Æ ªq\÷;»†˛%T|\’∏,\È¿\n#Éo¿?∞\◊\"xW[pE´\n\Í(ô∞##Ò4ôó\0ôù\”†2˛ûP\·\ÍîU§∞l\Ï5xêΩ\r\ﬁl\Ì¿Ö@∞\Ïw3<uîï˙-\ﬁK:\\!Æ{Ä\‡˝s∫¶m(K	`)•öa´πÕØ+\ﬂ¿\≈v@%2 \⁄dÖ,\0e%\Ï…æÑ\√\„∏\Â¥ª\÷¯%5Åe!7/¢ˆWÜ\ﬂ\Í†\0œ´	`óê-ˇ-UvÖ\“\Îï\r©u\„\Œ}ë\ra•tÙ\∆KULÑzò\·G÷Ö©\Z\‚\÷\Z¥JÆT\\®Aâº.\‹| û)KMv’ø|tá˙d≠≥\›\‚%i\·L`±w—ã˝k\Ât\Ã\‡í3/Tq(kîÄKµ\≈\0SÅ\·\„\Ì\÷F0ˆ\√´ïRìÉÕ∏\ﬁ∏\–q¨P\›¸õñû¡8É+V\ÔaF¨≤C5\0Np¥y\…&0}<Æ”óoRœπ\€\Ëw≠¶*ü;≤∞º\⁄sXíOœû=£\Ó0\√uº\»N˜\Î\¬¯\“X*p!Ff0$ˇ&\\rLˆï]Æòu\"©∫(~2,\Ï¶A9\€]ü˘\œ=ñVòèo¢≥.%tCòT∞3≠Ä•Ú¿¡\Ê\‰\‹H8∏d©\≈¥õå¨\Z¶™\›\Âß˜\Íüg˚\≈xØπ˚ØTÅÀ∞ªÚ7\Ôã\ÿ!m≠Zºsu\0R®T\ÊãL\—\Êf¯aka`éìÈòõÚvó\\\Óì5≥\‚{\—dè∑òµOÄvóù3\√oÄa˘/\Ìf¶=∏XìÇπ\‚Tçk>#V°\';\ \"vS\’\Ób\Í4{GBù¶jxı˝m¯í\Ë3N<v`∫x\›¿%õ3N¡eÑõ.\ƒ\0l\›\Ô6$\¬!%\’h\—Ó≥âÛ∂õöòBz˝ØN\”cäŸπ,\›<Én\‡í\Î\0≠∂òUz%\\rü[GÜ=7ï	}7\ .\ﬂÛ§^˘¡¨”∑û¶_Oâ{P¸\›Ã•i\r,+/Ü¯\n Ù\Ëà+∏\0˘Å\÷f/^U\√tX§72W;&˜˙ô\—\0Ut\≈\Œ\√˛\‹+´(•ìq˝t≈ª\≈ecÒf\ƒ\‚\»™™T\√Tvj\»\‘9{_BRÖ\‡Vô\Á_º…öu2auIç\0ñ.ï#\Œ…±iRoF,éåHsÂÄ≤=/¥ cìXº˜BBr>∫\ƒ\◊˚qX!]]\ÓnZîˇ:96\"\…\⁄»à•^+\‚\Ïv)†ú\Í\√˚´Kéi•£\¬˛B\¬o∫∫\‹›≤\‚\Ì¯\◊…±I\ŒaD\‡í[¢E\ÊTØéêT°\ÎWê∫uN5ëúÉãc˝6}r¨BbU\—6ã1é<\ƒtí\\•πµuÛ“ö\Õ3∏Ä\÷t…≤( WˇÄãc\√KP˘ˇ[\Ì\Ëâe\Ï*\÷\0\0\0\0IENDÆB`Ç',2),(2,'uco','Operario','Operario',0,'ee11cbb19052e40b07aac0ca060c23ee',4,'',2),(3,'soporte','Soporte','Trazalog',0,'855fa866d6d3f72f6a50bc213244e36d',1,'',2),(4,'insumos','Insumos','Pa√±ol',0,'3c6ff27f8f4c3efa42bcee681d78589f',3,'',2),(5,'supervisor','Supervisor','Supervisor',0,'09348c20a019be0318387c08df7a783d',5,'',2),(6,'superadmin','Super','Admin',0,'21232f297a57a5a743894a0e4a801fc3',1,'ˇ\ÿˇ\‡\0JFIF\0\0\0\0\0\0ˇ\€\0Ñ\0	( %!1!%)+...383,7(-.+\n\n\n\r\Z-\"%/--/------//5/-7-+---5------.-+-/.------/---------ˇ¿\0\0\›\0\Â\"\0ˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\0G\0	\0\0\0\0!1AQ\"aqÅë2BR°±#rÇí¡\—3Cb\·$s¢≤\¬%ctì\√\“\‚Òˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\0,\0\0\0\0\0\0\0\0\0!1AQ\"2aqB±3Åë\—\·ˇ\⁄\0\0\0?\0˜àÄ\"\"\0ààhi≠*òJF£\‹Á≤™=ßsπW∂nW¨®•ÿÄ™w\0…ûké«∂.±Æ\◊ò¢á\‹C\ÔÒ5Ø\›a\0\Èä\ƒT\ƒT\Èkõ∑∏Éÿ¶O6í8\r_7\»r\„˝¶mÄµôá[Ä\Â\€\ﬂ&ïl&lôºD”è#:†≤®_2òâE\Ÿy¨¥Ö<˙Fì0#\Ã\ÁÛúΩ&RÃñ%∂N\…›ñF«Å\"\ﬁSbu®∑\\ãÒƒõ\"å\’OH\◊NÆÕçπ\ﬂ+oú3ˆ¨\Í\ÿ)\ﬁ	;ª\ŒS5 \÷\ÎXë\ƒ}lwéí´ùΩ¢\÷&\ﬂ;çá˘$±ôÄ∂GΩmˆ\‰	\Õesíê;H$é\ÓÖ¬®m´o|\…6\Ót\Õ\"…£≠5∞3al˜¯\Ã8º\Z\’å¯>sb$[\ÏWÇØç¿µ>\—œó|\◊\—¯ òZù%¡˛%+\Ÿjc\·~G\ŒZ\Î”∏ˇ\0{•H`∂:\À\ÏÒø¥”è-\Ã˘0“¥^4^ëßâ§*\”7SºôXoV\Â6\Áöh≠$pu∫_\Â=Öe\Ï\‹*\’\„\ÃwOJV\\Éò#u•\Â1\0DDD@\0DNÄúÄ\'∞@*\Zıè\⁄)ÖSëµJøp™~&Jdfã\√m6\—\‹7w\»ˇ\0X5ﬁ•sæ´à:¥\«\Â\ŒX¥∂\Ã˚\Œ˘Ni\Ìç`Ü\È[70\Î\∆fú ∞úÃÜ∂\"\"\0\·îA\Ãà\ÏÑPÄ∞Äúƒê\"\"@\0MJ…ô\“m\ÃXÅï\‡îUÒ∏}Ü+º›†\À¢c\ÀRl;µ6yöM\ÏyXØÄë˙Zï\”kä˝ç\—ÆÉFß=˝⁄ûœìÖÛõqKtLYa∂G•DD∞¨DDD@\0H=tƒöx*Ä\ﬁ‘á}C≥Ù\'\ NJéø‘ø´S\‡j5C¯ÅÛx\nê\€E\·p<≤ πø£ˇ\0äΩˇ\0§±PÃöè©\ZÙˇ\0K6b\"RZ\"\"\0àà\" àÄ\"\"\0ùjå\ÌYn§sUq\ M6∂˚\\LπÉ\Ê∂\ \Ã—ßÚS©zNèƒä‘í†\‹Ë≠óı\0fƒÇ‘äõX\n?\“?#≤˛ívi2ààÄ\"\"\0àà\" 	H\◊s|U ïC\Ê\Ë?IwîMr?\„W¸è˝\√\0è\¬5™)\Ì¥≤\·˜¯J†2”Ç}°~`õPπL’ß|4mDD\Œ\\\"\"\0àà\" àÄ\"\"\0ààÖv∞c\»[ì∫Z•ëªMær\ni”Æ3\Í)øG\Ô|3èÜΩQ\ÊC\’,“Ø\Ë˚¯øÛˇ\0*KD\–g\0DDD@èÆ´le3Œã\ÀQyxî\›|ßj\ÿw\Ê*ß\…X}\ní &\“rÆ90\ ã1T\\Ÿøa\€#ÙB]\…\‰>ø\ÏÕ∂\¬\Ÿ\À\Ô\'{q∑.¡1\Í$ÓëªKV\ÕJ∫c|®(Ø¥~≥]µìæ\’˘\\|‰§åm*\’.\ZëÆV\·ükbÇëëSV\«iÜwUé6ôîd˙f∑(.\‚Ç\Îâ\’\‡\‰}DŸ•≠ÙèµM\«v\À~\”\Ë¨ee\⁄5p©w†©Vﬂà\‘[˘M\\VÇØL]®Q\ƒ=5\nû‹ïn\Ì°:Ÿì\√9¯ò<≈¢vÜ±aü˘õ?x˘\Óít\Í\0©\ƒAÒçÜ\—\‘+Ü\Ëù’î\Ï∫8≥£|.ÜÃß\Î,zµ£˙\nl6ã]Ø\»Br∫hNˆ\‹Y1≤É|BSwUÿÅıëïµìæ˘o∫§¸\‰vü\–∆≠r˝%ÖÜD^\÷3\› ©aK˙Ω7Æ±¨\Õ\—a\Ô\…^\ƒ\‘¸ é\Ÿ\≈Õæ°CI…ñ*ö\·H{4\‹˜ï_\ﬁkùq\'Ÿ°\Ê\‰˝\≈CUÒ*a\‚ˆ4*‘∑f\”UÚõá\≈\·\≈\Õ\nU◊â√íïh¢˘7pk˜\…¯y=ëÒ0/\“Œ©¨∏Üˆp\◊¨\⁄\√\È˙£:\ÿr´≈ó2;JÒå:ùu⁄¶\◊±\ \√z∫ú’á#úÿú¸\À\…\’¡ıæ,-jwR{JDÇìx6\≈\»\»6{</Ò[Ñä≈¶\ÕFø\\\ÊΩ<º3™	;Eì\—˙ˇ\0Ü®y◊™|¨ø§≥\»\rE[`iüà\‘o®\ƒ}d¸\‘d\0DDD@ ıØL6\Zíäbıj6\¬\rˆ<Z\‹xy\ ~ö\—ı\—i’´àj∂®∑S{){≠¡Ω∏\€pì:qˆÙ•5\'´Jë~\‚oˇ\0\÷i\ÈTØ_ı6îªkKf\Áez√Øk+\Ó∑	äSo/\‡\ﬂiaÒ øét(ˆº?Y/G|á\–/¥	\Ê˘É%\È{CæFo≠å?\ÀDFòOYØ\Í®J*®©ât…∫6∏Z*\ﬁ\Î=ç\€xQñlì\≈P4pØ\—\“\Ë\ÈS¶\ƒ\0*¢≠Úø`¯g]J≤´\\ÄZ∂\"≥\∆\‘\Í\Z)übSYc≠Võ£+é´¨\ﬁ±\ÿ\¬5Mï9\ \Ì+(ö\'X’®´Y∫≈≠òæ˛¿$ç\r4≠∫˛6˝øY†˙ªZù\√\”pÙëôêıUÄbrk\ÊN|\ÊŒÜ\–tΩUò%≠¿[pê¢™¨óë∑tq¶ty≠ˆ\‘l∏öb¿õÅQwÙ5G&\‹	æ\…7Aë\–ÿï´A*%\Ï\¬\‰ò6\ÊV\nêAƒúÆ)æÒc¡≠üq\Ê;\'üh˝b£Cå°LU\ƒZæ⁄≠\nOSeùGJå@≤ûë\\\ÊG¥dNπ&3˛Ö\ %p\Î%~\Z+Gi√Ø\»‘úˇ\0⁄≠Åz\ÿm!\Ã\—Gâ§\Õi^\÷uπ\„∞˛Ωàz7∂éœ¨m\“;\r•°qò\0f\ÊG3\È˝ ∏z\0™•T\0á\0∂‹Ω\ﬂ(\‘*¥´\‡í¢\‘\⁄\€zµjë{äµª)ø∏^\Àv	3ßÙmV\Á®\Z\≈XÏ∫êUªsÛ\ŒX‡™Æécíöue¨—ß¥n™wÛ\‰&˛It¨™†›Økë¿\ƒv\rã\–ÿ™õv%R\Î∞Ö2˘\…\ÕY\—=\nïHA\nÄ\‹‹ãb2\‹N]≥§£’ú\ r\Óà\Ìb\—u˙\’:dVA\◊Q`+\“–üglïccqm\∆I\ËÍî™\“Z¥àdu≠\ÃÚñ\'≈é\ ~ØÅä¢7Q\≈UE\‰¢•uê)Q\ÿ\'9\"ªGX\Á\'\√\‡ﬁê:i∂Y\œ%øí\…\È[\÷ X∫ç\Ì≥LwΩóıëÉ\Í\'QÙôXl^ïi\‚∂QX\— \Ï\Ï\⁄\‰Xû\‰%˜EcóE*Æ\Ê∑#∏èq+HjRdZåµ˛\œ$\ÿ\Ÿk\\\›HsôΩ1´R?À¨¿w\Óúaõ\ﬂ^Œ≥¡<w\ÂzÙZ¢\"l0àÄ\"\"\0àà+KS•s\›VÅ_®#˝?9øÅ¶E%F\ﬁ`¯u~{¸g:\È£›ï1Ö\ÍQ;V\ q˙y^t—∏\‰ØL:n;\«xÉ0d[fˇ\0π\Ë\∆[±&ºp\ ˆ¨unáz\Ì\'˛õï˙ZOÉúÜ•O£\«\‘Sπ˛\’|UC0\“b2IJVà\≈\”4ıI\ \–zG⁄•_Ñw\÷zãÊÆ¶Lì+x⁄æ•â8ì~Ç∞Q\\ç\‘\›\ \◊?\”k+\0)\‹±©\r¡\Ãò#ò0˘‰Ñ´Éòàúís¥y\œ=Ùg¢\ÎP8˛îï\'V˜±ß¥K_ë\€9n”öW†Pî¿zı.(”æÚ7ª|4\“\‡≥xo\"`—∏Aá\√l\Ìm\Ó\Á\"\ÓƒµG?yã\’\‘ZˆBç\…?Dï\Z7PIk\€\‚3≥a\Ó\¬\‡ç˜é\Ÿ\Œlã}˚\"˝\Á32\ŒNõ\‰¢z!\—ıha±¶@\‚\\*ﬂç/≥sne?ñ^\Âp\’ıKñ\À]É3\‘k.\”rJùPO˚Wñ9\‹›ª8ä•B\"\'G \ ˆØ∂\—\∆T™b\ﬂg∫öS¢\’I¶∆∞i6¶\Z$EA\‘\‚)¶\Ê¨¸ïxy¨8\ÂóG`÷Ö¶∑≤Ä˜êÆOwû\”\'§∂fê*Ω&6ö\’u0mÛ+\'\‰FØ\”\⁄\≈Vqrt@üà±-ÙY\÷9$ôb\›z&±t∂⁄ò\‡lû\≈\√Ãè#1jYq85co+˛¢k\Îë\Ë”£@ZµN™®\Ã\Áïˇ\0ib\’\Ì\Í∏t•ï¿ª≈égˆìÜ7;ÙNim\≈O\…%iÁààÄ\"\"\0ààQÒÙ\Z Ü#+pZü˛ˇ\0\ÃyKƒä\÷m\ÎXvA\Ì≤\ÎºÛ2¨\–\›;/\”\‰\Ÿ>z|?˚\ÏUÙ\ÿ\ƒ\·\Ís&ôÒ\›ıír∑§4Ä≠Ñ\Œ\Õz.•î\‰\◊S≥qüt∞“©¥°πÄ|\≈\Ê˘g£8µÉc¢ñ=≤05f\ÿg^èÜÆ\◊D? ®∑jC˙l\À\»	`√úå\ E˜\Œ\”(u\‰Çˇ\0é\◊\÷°<\È\÷\√2¯to5≠]\'ã®,îi–øøZ†™„∫ï\"T¯∏ì\'áÑ\Ïòe<Ûìb){dFã\—!Yú≥;Ω∂\ÎT\Õ\‹\r ∂\…pE\»vú\‰Ü:ô;*£Å\»x	π5uB\€Woº.@V\›kp\Áy\Óu±õ\n\◊E\'~»ø}¨~s,\·á˚\Ôùk:™í÷∂\„|\Ô~\„~PGl«å\√\näTÄn ÄAz∞;¡ê4∞¯å\'VÉ+\”\·Bª7W≤ïp	U‰¨≠n§\Ê\00Nµ\«Y∂C{A/\’∂ﬂ§\ÿexæ\r.ôt\ÌaøXûi[\n\À\‡Z™ü0&:∫CW%ßO>7a^®\Áji\‘¥π\ÓìGúæs∫PQ∏~≤o\ÏE/lä\–˙i\\ıôò\›\ÍT;Ujl‹áÄGsõV±\Ã\»gH\«QˆAn@ü!y™\‰S\¬\ZØñ\”=F=É/\”\Á9\”ı∂0\Œyçë¯çæóömˆ\ÎGD‹ê¶´.aTfs\„û~Bq˙∏.K\‰\Á´\ÁâùK¡\Z¨¯⁄£¨\‰ä`Á≤É+é\\º9nò\‘ö*(≤®\0¡2OG6Fè/.Oâ7!≤±D@\0DDN\Í\ÂHg(]ìgµ¨•≠æ\Ÿoï\›\\≠µáPw≠\–¯æVó\ŸBJ~ØéØG\›µO\œ‘è\√2j ìRF\Ì4‹¢\‡\ﬂ\\¢_sõQ\ràõrîY!+ö[K;TjtõaTÏ≥Åv-\≈R˘\07œ∫uπ:Eríä∂X\ŒS*í\‘Bπ∏2ùRäìwªûuπˇ\0Qú->æ\0§ª¯πWÒ˙-T1\€f¢±∂@Ås\‚9\ÃMäM°R≥≠0=ÖvQk\Ôm˘üßúÆÖqöTuÒ\€ï\Ó\'U√®7\"\Ïw≥f«ºôN¸≥ß©U\¬‰¥¶ö\√1∞\ƒR¸\Î7Q\√Ç\Ê\r«òîß\Ÿ;ˆ|m:—†\ÌR&ô\ÁL\ÿxØ≤|D\È\‡Ù\Œhºƒâ–∫M™ìN•∂¿∏# \Î∫ˆ\‡A\ﬁ;DñîJ-:eÈ¶≠	¶L⁄™l‘ú3∏ëZ^óM[á¯\ﬂiæ\Ë\ﬂÚ⁄ó-¢(\·Åê-˜ù\Ï{\ÿ\Á+:±Kß\«U≠\Ó\“^â~Ò\ﬂˇ\0Wú∫M:h*\‹S´õMA>\ÁÚ\"\"i1ààÄ\"\"\0àà\" àÄ%W^0d-<Rµ\÷\Ì¶w˘~¶ZßW@¿ÇXÉò \"q8oãEò≤8II,=e®°\‘\‹q7\ÈµƒÇ\“8&\—\’K\0[\n\Áº\”c√ª\Î\ﬂ%0\’¡Å∫û#uπ\ÃßO≥\–i5∫=by˘Vn®$mTe\Àyv®\√3æ\◊3\–%I(\Ï\„∂x\n\Âá\„CP|\…Úö0∫≥.etOQ\–\‘BÙ4\⁄¿≤)c\⁄Iº\ƒ˙ªÜ?\…\Óí>ÜJD•ª.\\tD.≠aá∏ﬂùˇ\0yëu?íß\Ô]æ¶b\ƒ\Ë˙\€D”¨\Í§\ﬂd@\Ó\⁄\›\·7∞\Ì31<X\ﬂ˚yHR}J*ÆŒ¥¥UˆhRÅi•¨\Z5\reEVN∏*õh\\v_\ƒ	3:WF\·?C:ãi\ŸƒïÆJéÄfıäW\œ\€œöÙmë\Ó |•\∆U5M6™ÉQ_:áˆ_ú¥ªXK3?òØ\n˘LxÜ\·\"Ù\∆7°§[\ﬁ=TK\€|œè∆≠%.\Á/ô<Ñj÷àzı/∂¯4\Œ\‡81O>RÖ7µ\ZmB;•\◊\ÓLÍÆãıl2©ˆ€Æ¸ˆö\Ÿx	1=\≈ER<\Ÿ\…\ NO»àâ\'\"\" àÄ\"\"\0àà\" àÄcØEj)VïÖà;à3\ŒÙè˝›â4ìi\Ëêd\Ô@IΩèeß§J6±\È!˛@˘ì3jó\À~Mö)|\Ì>®\ﬂ¿\„¢ÜSu;è\ËyHM*\·1õ	¢«ª0\ﬂ\Èº\¬¯G†∆•\r\«⁄§w\Ô˜˚M\nò¡^µCb.™•NÒ’±wïi\› ôf¶cπueÚ$FÆiíüF\«\Ì)Ä\r˜≤åÉ|¨{{ƒóê\’:d\'j–âãàJb\Ó £õ>≥ö÷¢ÜFßäêGòêIíi\Èä˝£q\Ÿ }\Ê\Í®Û\"nJ÷±czJãEM\¬∫üx™¯	ùB;•Gñ\ÿ\Ÿ\€U,¶∏\Â\—\0Ñ\÷oiM&îWi\Œ~\Íç\Á˝Ûïù§ç:ïïm\€`(\‡-µôÛ6/Gä•J≠∑PÆ˛ò\»Ns\À\Ái\Èqß\‰XuA6!óâ±\ÈRﬁ°NaõˆÛ\‰.R?Wû¯Jˇ\0	>Jêõ1AF<3dî\Ê\ÏDD∞®DDD@\0DDΩßu\ﬂG\‡Æ+‚©´p\Ô˘\ÊQ¥óßL0∏\√\·kU\‰œ≥IOÃüîg≠D˘\ÔH˙i\“U/\—Q\√Q.£˜\\∂\œ˙eo\ÈI\‚/étz\”N«ê ^ıD£®Ùé%˝\‘L\€\€\≈ZxFÆkÜ/â\È}g\‘\ﬁ\ÀYù\Ÿÿ•˝•\⁄7%E\»Ú\„=ˇ\0W\ËSZ\n‘ü§Züi\“|{\\fmE∫^\röjIª\ÁØˆq[W¥s˝\‰6ñ¡ETu\ﬁæºª\«)lò*\·Uªg\Ì3\∆\‚\Ì∂§™E):\ƒU¶\÷#à»Éª¿ Ç%\◊MWŸ∑\Ÿ¡∂[Ê°≠Ùù¥ÜÄb∆•\Ô\÷%c\⁄8\—!\Î\◊j&’ê\”<œ≤{õqÛõ\"·ì≥£,}te ≥\Zïªüx\‰\0\‰£\›6ª\—b\‘\»˚JE’≠ƒÅbh˘\Õ7ƒÇπqùN0(\œ!m\‰\€9e*¢´wdû/J\‚*î\«Ù\⁄?å˚>Ú(˝ò\ÿQµQ≤\0q?∂Ûs\⁄L\ÿ\¬–≠à˛Y~6∫ßôÕº$\ÓCS\√+;ΩÕÆ\Ô\ÿ8C≤U)\«\Z\‡∫ñG…´¢p\n[{∂l@\ﬁ«ó`\‹$é#G§\‡\Ô*¿\€eyµ£s¶Æ\Œ\◊X!O≤m≠6¶>˘f\Õ\€x^§bEL>it=ÖOåûûGØzW˛M™–Æ\…V≥}ù\0\ﬁÛ[\·‹ÑÚ±cã¶;ÆXª⁄£\0XõíP\‰f\‹2n<ÆåzÑî€ã\Ôü¡ı\‹Oò~ïtµ&\Ÿï´\ƒÙ¥ê€ºÄ≥\Ë\œN•\ÀÉ§\„ùjf\ﬂu\À_\ÃKJuâ\Ê˙+\”Fé´ïa[y\‘M§¸\‘\ÔÛı¢¥\ŒªXzÙ\ÍØ4`\ﬁv\›\ÕËàÄ\"\"\0àêzÂ¨¥¥f\rÒ5s\Ÿ\Í¢n/P˚(<â\Ï\0ò~øk\ÊDR•ﬁ´ˇ\0äë¥©æø+\œ\÷-}\“\ZN˝%sJëΩ®–∫-≥c{∑â2øßtç\\S\‘\ƒ\‚n≠Srx¡Tp\0en…âN\»êA⁄ù]\√ı3$¿\\ÛúA&r\‚kVmµÒ\«\Ô;DîvqpvGõip\‘xm˝\ÌT\√1ª \Õ\È.ùú\◊\ƒv\“]πSk\Ôˇ\0c2RÆ†YEõóÛ&D¢ö¶Jm;G\’\Z;OIj\—u©MÖ\√)∏˛«≤lœó¥.ô\≈`∂≥!cv]Ù\‹ˆØ\Îæz.ÇÙôN®	â¨Ù*n\⁄t(˜ñÃæ#\∆dû)GÆMòÚF]∫=Bï{Ue\‡\«/ºc\ƒ}&\€(\"\ƒsR±Ü\≈Ùâ¥6*¶˛ó˝\"é ê:\À\œtô—∫@T\ÍíZ\‡ç\ŒÚ;G\¬PüÜ_(qh\Ï\⁄#M˙\nW˚ã;Q—îP\›h\”òEø\“m\ŒÄ3ªeTÉ5≥2\n£m]Å¸\nmw?\¬|\Ãÿ¨µ1Genî∏∑º√íÚÚº¡§ıá£©\Ï’ØNòQï0vüÚ-\…3ör\‡∂\÷5~bvVı\œ\\®h\ }s∑Yá\Ÿ\–S\÷n\÷¯W∑\ y˛≤zZ´T¿\”4î\Â\”U\0Ωπ¢fyºÛ¨H5ùŸô\ÿ\Ì5F$πndô¢_\Í2O2g\”ZFæ6ªbk∏5N@[®´¡p\Êh‘ÆFV\Î˘\ÿsø)\”\÷\Ÿ\'qn˝ân˛&j\Ë\Ãf¢°F¸˜ì\ÃÃ∑öÒ\0ÿúRõá¶\ÕI\∆\Á¶\≈w0;+ò£j_¶L^∫<hıö*lj\0u\ﬂ¿8\Ï9ˆ\œ{\—zJñ*ä÷°QjSquu\‹xx\ÂiÒ\Ì3jå9\ÿ\À«¢\Ìt:/)\‘oï\⁄\Œ\Íu\rÄ®9}ù\–AÙ¨Næb ìôÛá¶çe8\Ì#\Í\ËoCu<ö±ˆœÜK¯O9\Ô:Ÿ§õÅ\ƒ\◊AvßE\›~Soú˘#}ç¢Ifªs$û$¡LWXÅ˝C˚\Œ\Ïng\0D\"\"\0ààt©L˛|gxÄbÅıÄ\›œø∂eZ®›áë\ \'V@wàj\Õ6I⁄õ\rÃåTé\‚$≠\re\«\”p\Îär¿Év\n\∆\„â$g\„ E{$é\„8jÆæı˚¿ê\‚üh\Í2îzt^ì\“~ïÃ¢{Mø\ c\ƒzG“ïçjJ?¶ä~†\ 7Ø7gó˜Åås\»xH\ŸC|Ωñ<~±c±’±ïòqUmÖ=ñ[e\"í\'\0;O˜ò\—\ﬁ\Á¿8\œnrRHÜ\Ï\ ¯±πAcŸª\Œtm¶ˆçá!˙ô\ÿ	Ãí[t\Ê\"\0àà\" UﬁßΩYñ¡‘É:Z\„\ÁsÄ}\Ë_[}k\–\÷∂\√LìΩ©êz6øÅÜ\'\Œ¯∂e7Veæ˝íE\Ìªw|Aüˇ\Ÿ',2),(12,'prueba','gemma','gonzalez',0,'21232f297a57a5a743894a0e4a801fc3',1,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\·\0\0\0\·\0\0\0	m\"H\0\0™PLTEˇˇˇ–¥# AABœûwçü#\Î¡ú\0\0\0€Øà˜÷π\ vzÅIM Ú“∑¡\’1Õõs\0\0˙Ÿª\Z989\0\0\r\0\0ıÙÙ)&\'==>323%\"#\È∆ß‚ªöﬂûí‘•\‚∆≠\›\›\›434‹≤è\Ï\Ï\Ïå}qÃôq\»ov∂µµ\0—∏¢©®®KEB_y\0ª•íøïs\Ã{}¡¿¿\’\‘\‘TMIÉÇÇ\0{maåq\\≠ÉR°èÅ…±úàwii_XßîÑlÑkiiêèèÅï!ü\\`t9\0gVI`^_∏koâNR•∏*µ\….cbbI¢üC\‘\⁄\¬\Í\‡\÷</\'À¶Å£v=ﬂ™õ¢ÄfZMCwuv∂èp‘óò\Ï\€\€\Ê\À\Ã‹Ø∞ÅiX–âãµÑ{’≠öìac≠êí¢}w49√óâ\‘\∆\«¡™™‡ºº´jkÙ\ﬁ\ €óéãûUØüRyè7bz|í\À”∑®üJù¨tëò|ºûcEN)Tb( ¬≠v∞ºë”∂ÜöÆ6MZ(.1%äófBH2sG&\Œ¬¥íqKA0&g\0K.\ZàZ:</(d@\'@!_4Ω\Z\‡f\0\0ÉIDATxú\Ì]˚\⁄Vñ∑0â¨D\n≤l@0\«&ú∞¡\ÿqN;\„é\«	â\ÁëL;›ùù\È{f∂\”\Œcªõ¥”¥ªˇÛûsı∫z\"Ñ¿ùœß\Áá÷é•´˚\’yü{\Ó\’\¬¬èÙ#˝H?“èÙØD+µ⁄∫Fµ\⁄EO&Z™\›\Ÿ:∫\◊L\À\À€¨J\€kºú\Î<øy{}\Â¢\Á65\’n\ﬂ=ñ“™\¬Û|\Ã ¯ey\r\0Øu\Ón≠_Ù$C\”˙\÷Û5¿∞LsØ\‡%œ∑˛•ˆ\ŒQzõ]ıG¡\\^\ﬁ¸óy\ÁnÅ]ÜN	:zºu\—ÛH\ÎG\€\¬\”hôe\Ô˛ure´ûJk\ÏÒÌãÜ\‡K+G1V	\rOc\‰\‚\„˙Ûi\ÿgê¬¶ò\◊\Ô±k\”\√\”0ﬂπh8™\›cW#¬á¥\Ã>ˇaE;µ\Áë\‚CZco^4*änÆE%üÒl\Áá\‚:nW\ŸPˆBSæÄD~rπ`˘á¡FP¿P¯\n˘tn—†tU.8QÚlÛ\‚Cπ≠\ÂêZêÛ\ÈE\ÂÚ≤\„\ÍÚ;éïê\‘X\ƒ\€Q\ÊÚvFÚ\Ï›ãx{j\n([A\Ê\Ìó\\§§M\√@\ne,ü£˘hó\’U˘¢\‹ˇ1\ZT\Ì\n%êVF¶mW+\ÏÖ(c≠0çÑ\”r\Èº3@Ú\Z£ùç\Ï\—¸\ﬁY^û ÅHÿï/\Ë`,Ûvà\œ\Áp{Z4eR\÷≈ïóM}L\€!ﬁõ/¿ı\ÈmLÅ∂ü:#˘º\'\ƒ\Ì\Œ<\÷\\É¨	I¶}DU\√Hâ™\‚ZséõQ$º\‚bU≥:&Ì∫∏6?.>ﬂé\0 í\≈\ÍàxC~e\€\Âkãsx3º¥4U\⁄\◊\Î\Í®K™˝˙9qq\Z+S@hπùèQT˜É|\’]c\€?ù¿yöbö¨{zz	£`2≤jUFªú\Œ\≈/ﬁõ2\ÿV%0G\«3ô\Z4FC\Ã9\ƒeˆ\—\Õ÷¥J»õ\Ó@69ib\Ãiˇ ª31\∆Œ∏Ù_õ:ñ1îLIE¶öB\Ê\nD\'c\Ïl3ç\„<!∏†\ÊQQ∂Ü±@]\Êd\"õeæç£†π∏hM\ÏÛvàs\n˘\‚\›bmJÄºFä≠BâΩò™\Ë\Êõ(8áŸû]a#¥å\"ì\nr>_M\ÁrãÆdb$ë©1\Ìå›êfñ\ﬂ\≈Bû«≤ö0\Z£ë( ÜEçπ⁄öø6U\\±eéöë\Ï5Co¢\n4i¢\Ïfkf¶äwi_\œr.\Z\‚R\ƒ\√Et˜F.¨Ò¨çõò\∆fR\r_ße¶\‡˙d\‚UQè1ohcNµ¢|\⁄MLc<;9=¶\n3h\»\'w˝\03_\√L£\Œ∆ß\’µ\‡\»0-Güf\–fÕ∏\…BPœÇõ≤∏£´ô∫6ÚyÚ¯ü\Î@\—\Ài\ŒL)àü2ŸÇ:\»\Íò(e?V\Zí*´\Ô\Õ}lûçx	ïä∏	@\"Bº6S{	7\0Hx3û ç\·\n\‘¥q\"E•Zºh\„\'±94H\Ÿdn¸\›@l§®f@j\ƒ¸Fp\È\\õ\0§áNπ{ı8JÑ&\nµNTµß¨°AZ\ÀQiùØAúmî¡\≈Bõ`M	êiadÅWçm\0àJ::Ñf\ÃXµ¥/hJí$ää2ô\‡ZJn .`lÛA^]tL4\r©µä´éÛ£\—\ÓãGœöy±+â\‡§*5™^™™+ëÖßi\√\Ê¸\0Ú‚ã∏A\Á£\›G\ﬂ\0g@ò\∆¿\·CdLº£≥\–Z∞ã®ò?è\«ÒDb3Ñ(\À\ÌÛ\›Gi\‰\ÊdÉ\∆Ùë\≈n˜å\ƒ\◊ \ﬂ}Té\'\ EAòb±¥±øú\Â¯\Ë≈≥B7J^ØvÜMY ®]XÕå\’-+ ®èóF%Å2\0q\";G/“ä4§Vp\ÊÚÅV#YV<\“b\nZ\ ÁÑÅåïCKÒ\Õä\Ï\ËYW\Zk}TMp)@πS$Yî\Ï[\‚ã9êö†Åv|L`&Ú≤<z$è\Â$ï†ë\‡v5p#m≤∞\–2\ÈQúíPwî¿À•8\n\Ï\ËYaH\"™cAæ:=B\›\Œh\‚\„be$∞1qáÑ∫¢\‹@N∂w\”\›1N§\Z\ÿ\⁄LokV;CdS≥2Ù¸∫/ â23†Ü≤∏ú,üøg$jÇ!ú\ﬁ\÷l\Èv¡\ÂeßÇà¿\‡JI\ƒu\‘\Ï˙\nk:òµ\·˘i3aΩ<Év&ß˘Z	AD\'®äk©å\€*˙L›£|aßi\„ö\Zmg\njfAÀ®¯\0ìP+\»\‚j\‰#\≈#,zõVLç†;è¨+\ÿeT71!\rêjd˚Öcàlöù!-§\⁄\“•º“é\«\√$K#-´\È	Øÿ¥b∫b<êîf™∂`F:ü bP!\„èÃ†U¶}t”ï÷¶Zä2\‹=)≥5§\ÃLw7û\Ô`l?3Ï™≤˚®;B%7\rB}≠‹Ω¨πDshÒY|\”7í	Üeµ|\ﬁ\ÏjoN\ZçÇe[Mõ*FLäî∏Dc`æ\‡ãN\ GYeM<3£¯dí:MÛÇô8ö∑x\ni÷å:1Ç]ç\«_haNwT~$MÄpuä\⁄ñô8≈¥\Â\nc\\bôbDc\‘Ò<MÄÒ\“yywe‰ß®π=◊≥{\Ì\ZìÖºOLØÑ4FT\«]¢Ç|∑]I¡\›\∆K\¬†<âÙiC\⁄ç U∞™Mâºæv¸<x{Yxèhˆ^ê0¶@R•YéPFuåEà\0v\—q`¨\‘1|\ZlkMê©Ú°tçµcD6¢6Bºè\ÁBöYªÙÚfV\nff™`\∆bå*˙|à&\0k0à|,,\¬cÀéæj⁄ôn;Z3CAd \ÈÅ§v!\"l\‰b\Ë\‡\€Z\‚sÜ´\0Flfhå%bp¿X\”≈∞Kâ5´êÚf	∞0r3CA,ñQRâ*∂U§\¬\Z\”;∂(#mRf\…BBêV\Ôv3ª∏˛$∫\ŸŸ∂p\”⁄ì/ôØx>K\"°M=/t\€X}›ÑM†l¶T÷ÖTy_ö-5eîõ®äª\„π\÷]¸‘£±;ö5\Õm§QNÀè\∆f\ZJ\»˝4J\ŒWg≠Ö*D\Õ3î\”xs\ÏBÄ°G≥•¯¬øÇA∫1BÑ\Ì±À¨k°ä¶+3\ÌŸÑ3\Ó	çµ6\·\Z§\÷\›ÇùôARóTàcU1úÀ∑ªCç µü>\nb|\Ãj[∏ıè¶\ÁB\€\ÕUß“î\ÏµÉéë4>dfÄ¶\Î&<Rá´Ä	5Z˝˝^oø~0®ÑF	\Ë*0NΩ^\Ô4*)éÜX~\·+ß\·¬∂#\◊N §6\0\”\ÍÂ•§$IRR\…\Ìnr|3®7ô§Ñî\Ã:˝\nyU∫†˙\ i8Ñw]v\€\÷Ãó˙\’,m\ÕyE\Ã\Ê\Îï\‘DåRïz>KØÚÛäî\»(™Eıµß\·\nä\œ\›*M´êrä^2¢\Œ\‡%v8.¨7\Ë∞f\Â\…Fd;\rîÜ2ë\”g>~?$B∑†M|A\◊HπJ\'C¶#JER2z\‘rf\ÿ(´Ä/£ŒûA⁄ïBL\Ãd%m\‹:æ\'\"¶m&ÜCx\œ\ra˜úRnP@˝ì\›aP©0L•\“8\Ë\ÂYµ≤+fzAÙë´≥\‰zEb\Â^–®Tpò˝¥\ \’L\‚∑\"Å\Ëcl¢DH	)\◊J\¬\ƒ\Ó∞eöw∞á©F=ß\ŒYí\∆A∏æ∫∏&fsıFJá©Ù´IFLW°HT\—;áß.\ÁB(\œL!\Z °JrXq(\':Iú7üV|µëktíü4ˆq8°ï\Œ\¬ﬂöj2\ÂóGÖ≥•n\≈îª\œ+1)\ÔnP8¥\»G1\÷Å(¥$|\n:\Î\∆mN®•aJsãû#:Ñ\›s#&\ÂzR,9º\Ê/§Mbv\‡Éê´W¯lß\·\È[∏FUå±-é\–gåºò.¶qCXh\Z\…X¶\ÓßfÇ\0ûD\ ˚\\¡É¨\"\…~~Öcö\"ü∆ü\–cxib∏\»\€\≈\“\ﬂπ/7≥æ\0ÒöJ}å\À\‡˙\Õz\≈ fëâ\≈MoM∑H\ÍÇPyd˙\nV\Í•¸2$bw¡Xá\"TÚbì”¨çá&Ü\À]<æ∏{Yõ1wêM;\Á\"®}•\◊\»Jæ\Ï\≈D^	á\–µI#\›rCv¿Lj∂ìJA^\–\05\Z¸m\“C(ïõ±ÉÄ?©iì™≥™cÖ¿\∆5tŸ°\ËywUCÉì©ÇåB\Ï1hÙ\ÎΩa\'-≤l6õ\ fY∂\–\Ï\’[Ä4LÙ\Ó¶M˚\√NU\—N¸fª˘\≈N\“(àqò\'˜\–⁄¢*∫f˚\À\·∂œê\ÏI\Ãf©\≈\ÿB\Á\\¥˙=%óñ\" íÄÚª(.ã[!ç¡ú\‡ßi0zùºÇ7\‚}$\√\≈\’U¸	\‚Tπ9l¶\·Ö1\\j\√\Zù*Rñ8‘êıRÃÄ3ΩV´^\Õ\Z\0≠#ü`\\5ïP§$\€]B\Ó\€?8h!!O;y6õpJ\Õ\ﬁA√çô(Ç\0•§&ñY∂õn1çÆ\◊˜˜{\√\≈§|2€≠vz˝QªiºpÖ\Õı[Ωl\Ëö˜\ÀPR≠º¶ﬂºd\›\'¢@09®h\ZÉ:\√\Èj	IØô¡aí\»\\\◊*U\„*≠zßõ\≈\·ÄÚ3,\∆@öjkÉ9%u\ÕE\⁄\\+\œKµÿ∞\Î∑Y©Æ˙é&\›\\j∂<eP@<\ËHí&N\…\»l3á\∆\‡†>L+-IB\ƒ\Õxh,§üv-ó&{Ç˙\Ë\‘Pπˆtá+\‰1à±ûuX7_zJ≥}\÷y´ˆıæ<\‰@\Ï\⁄#I?â^¡L\Ÿrg\'`e/\Ê4/\…~Jõõ–êBÆ\÷\ÿR*a\ÎZ™\Ô\‡¢\ÿI¶A˜{`J;\Õ\\nî®ﬂ™ÿò\ UzYœ§GjZ#R\ﬁ>®`g8\‘≤^\Ô5Ÿñ0¥ª¡L+Ö∂ïÃçkÜ]f˚0\ŸÚfÇl§ppQ\⁄–ñRêx¥,±y`\À{πñ\◊BÆ4\ËK9Ê†©$\’\ÕoänT%QjÇ◊µA\Ãp§\…(±πÑSS\¬\"j^FzÉR÷á2§¯ò°jüq`E<//c•πJ\’¢4§ÒA.,\'\’\Î\0˘`)ÿà\"¶òÇeà‰æûO\≈7ã_Ö=>j±B%2∆£ñ% L\ﬂ!\Õt\≈ÙÒ›õw\÷OON^iå|∂iç¶πä[_¨í∂h£ö\—.˙˘\…\…\Ó˙ùõG˜rk¨î\Ïê\Zﬁ¶yß¯Ü◊´\·ê4\¬ˆ\”1j\ R^*c¢pVH*3D…Ö\“ﬁ©zÒ\»\0àìóZVà-[ú§Ø\·\Ã\›	\ 7\'_´£æ˛ZØp\∆˚\Â%&\0\ÀKK\»\0Ü©Ñ\Ìâ\⁄bò\"µ4jU˙I’¨â∫Ñ\ÌisyxÚ-\≈b%y`I<∏úCNyâò™\”\ÊH˘˛\‰ku‘≥∂~IñÒo\ŸBΩ]B%Û¬Ω,vC\¬:&,*@Ñ\»7¨åI4Ñ≥=r\Ì\È\√∫µ˛\Á\ƒP\Î:Ûy]`Jπ:+S∑ÛﬂúúêIØ<1≤5AS±\Ÿ\‚∏2L%ÆÕã4üÖE∏Çóåë\ LÇfá\‘_\Z⁄ÉãOàòæ~xBÛ\ÁõW1í{fDSI¨6e≠∫o¸ù\Îg\ÂWÙíO™£>1á®\‡⁄å\“∞†¡î\„˙õ_ö\·)vD\Z\„âbπ®\Î</\Ôv\ÔLChtjØ-Ûﬂùºï\nÖ∞ÅæÜO\÷!4cD…®\0{¯W\'Öÿ≤ÒE\Z\·\ﬁeå∞Çë%Øm©î0\Êµ/Má∞l\"å/mê\Ïê\À\‡ª\‘\’L(&öR∫Ωx˜ò˝ˆ\‰\Õ∂C1ë L∂\»]\\#cA\»(\nº†\Ô\ÿŒΩ5≠Ù˝Ûìá5\¬Bz[\ÈI’ßXÇ…òõíá¿\ƒFâ<0µ»õÜôÿÜkWû|C8@é´∏˘\'£Öõ¨©äDã2}NóJâíRÆa\Â√ìˇÉXSõí¿“ºq∞P\0c™\Ín±∏7!Náê)Í¢Ä/OùëMÄ&¢9˝˙\‰aÄZ1yÉ\Ê˛8K\Èa¸üyO\ﬁ|IB%=\·}\Í™,i~i\ÏQdPˇUæóäj	\\õ\€t`¢a††q@\Íõ(ú=©1˝!™!\‚\‰Aç›ßm=\Âˇp>ß%.ù>ã`\"Ω|\Ï\’\…CòÛ\ÈKø\0\"L∂0º)©u7\"BÙ´§añ<%éF\»0\Ì=xD  äzˆˆ\È?â°∏\…\Í\∆&\’Q,!L\ƒ4√©Ú´¶>≠rGVQæ{E˛©EFU)Õ¢`&j\»Vé\0°@…®:6NO¥!dˆ\‚\Ë!n\ﬂ˚˝\Î\”\◊\'Z`XìJÅ∑\‹\¬\rµ\Èv≠\∆r0:]y˝\Ì∑\ﬂ~Bd¥∂\◊f,$,\¬-ú>≤\ZE\‚o\·˝!å¶#\ƒR∞Ü¥H≤É˜0x{}a~ˇ|£Er∑E\rP+\ÎRŒÉÑq™\‘Vå\‹\Óı\√™˜\„˚9}b\»0U^YL\Ô9Æãii:ÑLIóRäá\\G\Ì\Â\Óˆì<\Êı\ËÕõØ[:æÖZÉo©wÏã¢%ë`ÑnL\Ïq®†\œ>0ûá∑øæï≥\'VEíyr\√Àö°ô\n°°àò@\È\Îímæ®˛{O\ŒN-wø>;c˙\Íu)ôO\⁄bÒû»£b\n˘A±=∞‹∏pzˆd\œŸîd\Í§Ñ$´3‘ê		paÅº0\√\÷ u3=æQ(µ˜û¥ØOÅ^7\Œˆˆ6Å©4â\Ê4X^¥æaêEÑ™ê\È\œˆ\∆Z\ÌÙÙÉF˚\…à¨ùUõJ6ñQ◊±=\0ÒU°\‚xÜG\ƒ¸iCüwN∑˜ûµ˜ê\Œ\ŒJå:Iù\Èv\≈\≈làä€ò\‚\∆πsØm\‹jB;û®r&RNP\ﬁpJÑ™≠!°wIG\»\‰:\Ë§A\Zd˘˜º\"5lórIûˆ^∑\Z◊É\‡\‰à@î6¿W\Ë\r—õ\∆CÒ†\»\ÿF\‡∂Y\‘rC1\È∑Èúú8tÆS\…|¶5¡ †¸=a©¥iD•\‰o\”\"\‘\Â¥oNçÑ!$qHù\ﬂ\‰:J“π\÷\rSvj≥\œ CE5V TâRâ»úéá\‚Aß\⁄\Ë\Íxêóm™¡r(\Õ¿ìÉt\Àazë*\…\Î∑\»o%p¬™Gñ67ı≠ó¥øÖ?s`E\¬y\ƒV\‘7≈¶ûuUD7J5W$ÑâA%AhÄ˝VmWyˇ32464@]L\Õ\«\Ë¡õ\Ÿ\‚6o\‚ZY\—}µ∏\‚í>£ÄbhOå\€[√´\·ÇjM)Ñe≠l\ﬁ\ÃZÙ°ä\ÏaxqYÒmd†(ï÷•¶ò∞ı∑N\–\∆E°¨.§ï\Ï\ÿ~\'\∆PÙºíÎàíãëu!\»@t≥T‹¥6GN	\–\nQX\“[1–õUÉL-UOJnfFØ\“ÂÉΩ(xOµ≤Òö\·\‘\0!q£r\›%£\≈[¿êd¸\ÎO∞~Çr\ \'\„!r†öQJF\0p\·9U∞(õ+ûk&∏~V)¯u∂a%X\n\0±™d4sÒ•á\·=!E∑Ÿ°~Äêê0∑A\ «ã˛sÑ^R)åi\Í%!¥15îå\Ó$\\I\—U•\Õ\'\Ÿj´RZõe1A\ÌEK(|5\’hJ¢<¶\„	4u_πJÄ∑`\Í≤èoj\„‰àé\‹;^V2}é§¯âÑ•6&±}èπ	∏2∫ú5\ÿ\ÔÛ\"˙IEí[ûπJ\'õ\Z\√õ\Í9\0úP\œFuZ2¬ì\Ï48\“\∆J˚\"Æ2\Ãdõ.s8°1Åf\'≤\ƒ\'\”}˚\Í±ˆ¢\Í¢<6ˇ	´lEÅ4≥\—G∑†\Ì\ •\Ì2íuÌ≥ïf\Ÿføb¥@	§˝gP\œe%)3Æ\'\œÖó¢H“∞\ﬂ A4&êf´”Ç,&)∑(](\∆qÁèíJÑá{™-|b7\”\Õ+∂pTHµÜñ\Õ˜˙≠∂Y`gS3â\r	π˛õ.ÄSrV%∂\€\Ÿ?ÄëÄ0\“\"#Uh!\·2\È*\Ã\◊¯¢;\“\€\‹ƒ´5Y\À\‰∏\ ¡PŒ≤,õ!]?\ÿ˚Uh\÷~∂√ïè≠!nKë≤\0Ä¥~I\’\ﬁ¿:Ñ\Î∆á\Ë\"¸Bµ\ -/˝i¥\Í=“è\—Ü\›Ñ ã£§e±\€\Â\\\Â\¬\Ÿ˚=4\ZOV#¸¯µ?\»#\ﬂº{j\Ãk∆¢6F\—Fr+◊ò\ÕQ~Rá⁄â\»\À\„π\·A•RQ≠\∆h\Ÿf82z¶9ï\∆I\‘Ò\Ÿ\‡iπÖ ûL$\‚\Â\rıp\⁄Õ∞áº5åÆû∞{›â⁄ä8~ìà\«\‹\‘ˆ\ÌÑ\·∞\«ANci¥_X4§ﬂµ\‰Ñäâ8EâpÉp˚∫°ô\Óî6\'Qá≤ª‘ÇëæT\Ì@\nπï8eöhø\0¥j¥ªLR)µB\\2 Ü>˙•°7≠D˝\Ìöâ\⁄Pà™&Bo\'\r\0≥a\·¬ÇÒ\›\ﬁX&$@\\Ú\ﬂ¿\√\Ã7X\ÎÇPüE4ß\\[\…d\‚$\ÂnF\\a\Ë¶%ù≈ßÇåS∞¯X\‡bp‘§üΩ\"ôHêˆÉ/7DIúﬁß\Ão\œ\Ê´df{°2Æôíå.\’(é)w#Û	•9±&b4˙Óª∏Ç?<\r£å)=≠\‡c\… Û#´…†ã:>\Ê\È\ÀH;Oôß;¯√ïãæ%Æ•ø\·ô|tçı\“n–ù\Ë*æ\Î\0I#Ûáóì_[\—=\≈tg\Œ˙\”%ßì\‡ª\‚N7ÆO ´f\Í;\”O≠öõTlØ$˘π ®RâÇπÛÚH/_\Ó\\\—˛iÁ©ö\Âé/	ò˚=f\„)t¢é¨a\«eQ¬ªøyó+>0;ø¯ıØ~iµ\Ô+µ_˛\Í˜ø˛\≈Œç+`tR\Ô˛\Ê\ﬂ\«m55îê/\Ã\ Ã®D\ÌI∞\‹õ†møØ¡îV\\à\0˝˝\À\«;¯CeL!4å\‘~f\ﬂ \’h\≈Oy\≈ˇ0ú\ÿ„∑Æ^}\Ô˝\ﬂ˛\Ów\rL¸\›¸ˆ˝˜Æ^Ω˙\÷\„q&G®\'DÆE˙)27¢≤}ˇU%B\≈\0Ò\Í\’∫˙@%Ù˛˚ÔΩ•˛°7Æè\„l\Ëê~\'\"\Í\À\„JzD\·˙çW}\È≠\«Wv\∆\·c:Fq\÷_\ÂFZ1sa<±bwÆ<~\À\‡\Ôé{MÊÜ´ê˚}\'$˙\À\’bu\‹\“D<¸/åàSÙ(MsG\ŸLí&\'\—|ñ\«A\‰Æc\„\∆«∑∑ˇ\“ W°\0F]}Ú¢-˙î≥qkºåí\0y¸Ä(\‰[HÑ}èµ¿\∆˜f\0H@?´§\…Iñ\„7∆Ø\Ê\Ô\\yy˝˙ıw\0&\‡Dz¸ÿà\‹¸7†øE3/⁄òâF\›E¢xe\Á˙u\r£=2ı∑2êÚ\“/sNZ¥b˚Vä\‘ÙUF°xCÉ\Ë@\Ë\ÀAéZ⁄ãr≠i\ŸœìP∫æG\Ã≈ùÑ7^˙˙\ZÆe˚\ Œ¨\„5ößbÚ…éøM˝ á◊Ø[§bn_|ïa\“*)¸ˆ¸\0\“\À:\·¡j~#\≈oòY0\‰Wû˙1P\‡˙é\œ$\Õ\œ\Œ π©()-ˇ”êû~®&Üê\'>-˙fÑ\\+ütlçûi\‚\Î ◊£M˘L\«\◊7ö\◊\ﬂˆbãs\Î7/\œ>\Ê¶\…\„x⁄åØ®\"P\…\ÌöyZR$ØÉ∞%K\ÔKJ\rrNEäv\…w<πü\ﬁJDµ∞O»ïÅL=\„q\¬\ƒõ|\…\„åaïç∫)=\ÿH{9«á;\œ:<’ú\∆\‘<uÙ\—R®\Â%N®≥ûGî*µ!\'«πi|S?˝åO˘fß`£\ÈsÄ˛4\ﬂt\nGéÉ\‡ó\Ôí\€ı˘∞¨7¿\ﬂOZÆ\Õh1∆õÚA»°Ûøü\‚Úq`?òãw/ªú\’Hh\Z+9¢\Z∞\ÊzN\⁄%\Ì,\÷\≈¯_æ*|©à\«\«\Á\— 9\‹\≈6º\‰é\ X¸êP|I\≈°ááü~Ò__≠xπ°y;\Íãl¥\’XıHÑ¶\÷SÙ∫x4\ÈgáÄÒøø˙\“\·‹≤_°nVÙ\”:à¢ê:ˇ\ÂˇùAîë|S.û∏Ñ(ˇ¢B¥\Ÿ\Íà{ºêÆskGö\‹&¶\‡\ﬁ6ˇ\ÂW_&\‚Zw\–¯\÷ A=\Á˘ÛK*\»/\"o˚ò’Ö!\‰WıOØkq\„q\Ï\‡\√\ÁÒ\À\Z\ƒ\Õ1\ (î6-/\›à¿@∂f=nˆ\¬¢õR\ÂTsX]˙\Ï\“\«Ò•\À\Â\0\ (\ÁY\‚ß2{d+ïL˘I\‹Ò’™?í.•ïèﬂ•KÑó\ret\€{Æ10Æ∑∫}|\…$Ä¯\‹\–t^π ™\œW\€>\»QÆ¯πûü\›:¸Ñ\ÃÒDh@LîK.|T\„Ç ~§É¯‹±r1∂î¯-≠\ÌcÖ|\‡R^X9<ºØ\Õ1^Ñfª%¡h9äE˝4∑I∫dÅxÎìÖb\¬\ÿ\€j08H\Ím\‰uo\◊˛l\0TR\„	\0Y46\›\’œ´{\"àë6≥5ê˝cå#\Ê”†X6æ#Ö™ò˘\œ\√√ü\Ë3L\ƒ/\€ \"\»\Õxyic©åG1Z\‡\≈\ÀÒw.›∑A¸séè-\Á0S\„\Á[,U	\„GJrn≤º¸\È\·\€o\Î¸\\Exy#>ûe∏Ãé˙\≈\ÂBM|˛ER1e\ÈÑ\Ê&˚\≈\·˝kÑîEı\"¢±NÑó0∫\—^!ƒªÛ≠ñ≠\»¸™5\Îﬁ∫ı\ÈOÆ\”˚\ÿ@®˚E˛\≈7TVøÛô\r ¯\≈[˙Qàwg\—2\ÎK\Î\€ˆ]G›∫t\Õ\·Â•Ñ7\¬%]ò/\⁄B\0˜â>¯;\ÀV/W∫\Õ\⁄T\\\·5!ë∂?Q=Ÿò(\Îl\ƒ\Ô;xH¨ç>¸]v\ﬁ.ˇàµU>˘Ùm\r!Å¯é\·eªoPp√º \Ód!Å¯G}¸\„yªã¶M-˛x\Î>\0ºˆ\"]NÑà—éoâ˛Û\«.,$uŒ≠¨\ÕŸò\⁄wUÇô\"∂Ù>21æaÉxô\Ïw\“ÃãÖ@we!º,SN\◊\Á\“hb–∫M)˛ÜfFGHåÜ!\·\‰\“Ryi\…˘ßO\Óª#&˛\Ã\ÎôÛ•[áÑÖ\◊‘ò≠Ü;B˙»ÉÖÒìÒOü˝\Ì\÷?Æ©§M\Î˛Dˇj¯6ıÛg∑˛v\—\ËÄVàß†òrj∑4~\0oYeÙ\'\∆0VcsÅd≤–ê\”\√\œ¸˚\·°†nï\…P?\0&Æ~z\Ìö\‚_Éºe®ècà\Í\·≠\Èí\ﬂˇK\¬n\rg8ä!\0\0\0\0IENDÆB`Ç',2),(13,'22','weqeqw','wqeewq',0,'d41d8cd98f00b204e9800998ecf8427e',2,'',2),(14,'Usrtest','usuario','usuario',0,'f8032d5cae3de20fcec887f395ec9a6a',1,'',2),(15,'Juan','Juan','Perez',0,'a94652aa97c7211ba8954dd15a3cf838',6,'',2);
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_reparacion`
--

LOCK TABLES `solicitud_reparacion` WRITE;
/*!40000 ALTER TABLE `solicitud_reparacion` DISABLE KEYS */;
INSERT INTO `solicitud_reparacion` VALUES (1,NULL,NULL,NULL,'Jose Perez','2017-11-08 10:44:25','2017-11-09','08:00:00',1,NULL,'rotura de rueda',NULL,'C',3,'0000-00-00','',NULL,NULL,NULL,NULL,2),(2,NULL,NULL,NULL,'wqewqe','2017-11-08 10:45:54','2017-11-09','08:00:00',1,NULL,'assdas',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,NULL,2),(3,NULL,NULL,NULL,'asdsadasd','2017-11-08 10:46:39','2017-11-09','08:00:00',1,NULL,'asdad',NULL,'S',1,'0000-00-00','',NULL,NULL,NULL,NULL,2),(4,NULL,NULL,NULL,'sssss','2017-11-08 10:47:21','2017-11-09','08:00:00',1,NULL,'sadasdas',NULL,'T',1,'2018-01-30','trabajo terminado',NULL,NULL,NULL,NULL,2),(5,NULL,NULL,NULL,'huggo','2017-11-08 12:53:19','2017-11-09','08:00:00',1,NULL,'observc test2',NULL,'C',1,'0000-00-00','',NULL,NULL,NULL,NULL,2),(6,NULL,NULL,NULL,'Hugo Gallardo','2017-11-14 15:23:31','2017-11-15','08:00:00',2,NULL,'Rotura de llanta',NULL,'C',5,'0000-00-00','',NULL,NULL,NULL,NULL,2),(7,NULL,NULL,NULL,'Hugo Gallardo','2017-12-01 05:35:25','2017-12-04','08:00:00',2,NULL,'Falla test sobre RS-0001 (01-12)',NULL,'C',3,'0000-00-00','',NULL,NULL,NULL,NULL,2),(8,NULL,NULL,NULL,'hugo gallardo','2018-01-13 21:54:50','2018-01-14','08:00:00',2,NULL,'rotura de equipo test',NULL,'S',5,'0000-00-00','',NULL,NULL,NULL,NULL,2),(9,NULL,NULL,NULL,'juan perez','2018-01-17 13:38:28','2018-01-19','08:00:00',4,NULL,'mancha de aceite abajo del equipo ',NULL,'AN',1,'0000-00-00','',NULL,NULL,NULL,NULL,2),(10,NULL,NULL,NULL,'1','2018-01-18 18:05:53','2018-01-18','18:04:00',8,NULL,'ccg','18:04','AN',0,'2018-02-08','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',2),(11,NULL,NULL,NULL,'1','2018-01-18 18:07:20','2018-01-18','18:06:00',6,NULL,'mancha de aceite debajo del equipo','18:06','',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',2),(12,NULL,NULL,NULL,'1','2018-01-30 14:06:43','2018-01-30','14:03:00',9,NULL,'No tiene fuerza para levantar la carga','14:03','AN',0,'2018-02-08','ok\r\n',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',2),(13,NULL,NULL,NULL,'3','2018-02-05 19:01:38','2018-02-05','18:59:00',9,NULL,'bateria descargada\n\n','18:59','',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',2),(14,NULL,NULL,NULL,'1','2018-02-05 19:42:17','2018-02-07','05:41:00',9,NULL,'fhjh','05:41','AN',0,'2018-02-08','Trabajo OK ',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(15,NULL,NULL,NULL,'1','2018-02-05 19:46:36','2018-02-17','05:41:00',6,NULL,'ggggjffufjffg','05:41','AN',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/reclamos/15.jpg',6),(16,NULL,NULL,NULL,'1','2018-02-07 12:36:19','2018-02-16','12:35:00',7,NULL,'fff','12:35','AN',0,'2018-02-08','',NULL,NULL,NULL,'assets/files/reclamos/16.jpg',6),(17,NULL,NULL,NULL,'1','2018-02-08 14:38:14','2018-02-08','14:35:00',10,NULL,'Ruido en cuerpo de bomba int 0057A','14:35','',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6),(18,NULL,NULL,NULL,'1','2018-02-08 14:46:00','2018-02-08','14:45:00',6,NULL,'Gets con desgaste excesivo','14:45','',0,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6);
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
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'mmmm','4253133','desamparados',1,'Casa central');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (4,'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.','AC',2),(5,'REVISE LA BOMBA DE AGUA','AC',2),(6,'LIMPIE EL FILTRO DE ADMISI√ìN DE AIRE. SE PUEDE LIMPIAR COMO M√ÅXIMO 6 VECES, LUEGO CAMBIAR.','AC',2),(7,'CAMBIE EL FILTRO DE ADMISI√ìN DE AIRE','AC',2),(8,'CAMBIE EL ACEITE DE MOTOR. ACEITE 5W40','AC',2),(9,'CAMBIE LOS FILTROS DE ACEITE.','AC',2),(12,'Limpi√© el dep√≥sito de combustible','AC',2),(13,'COMPRUEBE EL MOTOR DE ARRANQUE','AC',2),(14,'REVISE EL SENSOR DE TEMPERATURA.','AC',2),(15,'TOMAR MUESTRA DE ACEITE PARA AN√ÅLISIS DE LABORATORIO. USAR PROCEDIMIENTO PR0004EM','AC',2),(16,'REALIZAR AN√ÅLISIS DE TEMPERATURA. UTIIZAR C√ÅMARA TERMOM√âTRICA O PIR√ìMETRO','AC',2),(18,'tarea de prueba','AN',2);
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
  PRIMARY KEY (`backId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_back`
--

LOCK TABLES `tbl_back` WRITE;
/*!40000 ALTER TABLE `tbl_back` DISABLE KEYS */;
INSERT INTO `tbl_back` VALUES (1,125,'tarea backlog','2017-11-23',5,'AN',0,0,2),(2,368,'nueva tarea2','2017-11-22',5,'C',0,0,2),(3,1,'nueva prueba 1','2017-11-23',0,'C',0,0,2),(4,1,'1','2017-11-24',0,'AN',0,0,2),(5,1,'2','2017-12-01',0,'AN',0,0,2),(6,2,'1','2017-11-30',0,'AN',0,0,2),(7,1,'1','2017-11-30',0,'AN',0,0,2),(8,3,'1','2017-12-07',0,'C',0,0,2),(9,2,'2','2017-12-12',52,'C',0,0,2),(10,1,'1','2017-12-11',15,'C',0,0,2),(11,2,'1','2018-01-20',40,'C',0,0,2),(12,4,'4','0000-00-00',0,'C',0,0,2),(13,4,'5','2018-01-20',0,'C',0,0,2),(14,4,'12','2018-02-10',48,'C',0,0,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detanotapedido`
--

LOCK TABLES `tbl_detanotapedido` WRITE;
/*!40000 ALTER TABLE `tbl_detanotapedido` DISABLE KEYS */;
INSERT INTO `tbl_detanotapedido` VALUES (60,57,3,2,1,'2017-11-14','2017-11-14',454554,'E'),(61,58,1,15,1,'2017-11-21','2017-11-21',1,'P'),(62,59,1,15,1,'2017-12-01','2017-12-01',879797,'E'),(63,60,1,0,2,'2018-01-30','2018-01-30',1,'P'),(64,60,4,2,1,'2018-01-30','2018-01-30',1,'P'),(65,61,1,2,2,'2018-07-23','2018-07-23',1,'P'),(66,62,1,3,4,'2018-07-22','2018-07-22',1,'P'),(67,63,1,3,1,'2018-07-23','2018-07-23',1,'P');
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`detavaledid`),
  KEY `equipid` (`herrId`) USING BTREE,
  KEY `valedid` (`valedid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detavaledescarga`
--

LOCK TABLES `tbl_detavaledescarga` WRITE;
/*!40000 ALTER TABLE `tbl_detavaledescarga` DISABLE KEYS */;
INSERT INTO `tbl_detavaledescarga` VALUES (1,1,1,NULL,NULL,2),(2,1,8,NULL,NULL,2),(3,2,57,NULL,NULL,2);
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`detavid`),
  KEY `equiid` (`herrId`) USING BTREE,
  KEY `valesid` (`valesid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detavalesalida`
--

LOCK TABLES `tbl_detavalesalida` WRITE;
/*!40000 ALTER TABLE `tbl_detavalesalida` DISABLE KEYS */;
INSERT INTO `tbl_detavalesalida` VALUES (1,1,8,NULL,NULL,2),(2,2,1,NULL,NULL,2),(3,4,2,NULL,NULL,2),(4,5,1,NULL,NULL,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estanteria`
--

LOCK TABLES `tbl_estanteria` WRITE;
/*!40000 ALTER TABLE `tbl_estanteria` DISABLE KEYS */;
INSERT INTO `tbl_estanteria` VALUES (1,'estanteria 1','1','dd1',2),(2,'estanteria 2','1','dd2',2),(3,'estanteria 3','1','dd3',2),(4,'estanteria 4','1','dd4',2),(5,'estanteria 5','1','d5',2),(6,'Estanter√≠a de prueba','24','ESTANTERIA 01 TEST',2),(7,'Estanter√≠as nro 2 de prueba','6','ESTANTERIA 02 TEST',2),(8,'dgfgfgdgdfgdg','123','sdfgsfdgf',2),(9,'estanter√≠a de prueba 001','12','estanteria de prueba 001',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_listarea`
--

LOCK TABLES `tbl_listarea` WRITE;
/*!40000 ALTER TABLE `tbl_listarea` DISABLE KEYS */;
INSERT INTO `tbl_listarea` VALUES (1,1,'tarea 12',NULL,NULL,'IN'),(2,1,'tarea1212',NULL,NULL,'C'),(3,1,'tarea130',NULL,NULL,'IN'),(4,1,'tareanueva1',NULL,NULL,'C'),(5,1,'tarea gemma1',NULL,NULL,'1'),(6,1,'TAREA2',NULL,NULL,'6'),(7,1,'TAREA 25',NULL,NULL,'6'),(8,1,'nombre de tarea 1 ',NULL,NULL,'5'),(9,1,'nuevatrea30',NULL,NULL,'5'),(10,1,'tarea de gemma',NULL,NULL,'5'),(11,1,'nueva tarea 34 ',NULL,NULL,'5'),(12,1,'nueva tarea 50',3,NULL,'5'),(13,0,'nueva tares 45 45',NULL,NULL,'5'),(14,1,'nueva tarea12',1,NULL,'6'),(15,1,'gemmma belen tarea',3,NULL,'5'),(16,1,'nueva tare ',NULL,NULL,'5'),(17,1,'nueva tarea ',NULL,NULL,'5'),(18,1,'TAREA 10 ',NULL,NULL,'5'),(19,1,'hhu',NULL,NULL,'5'),(20,1,'hyhy12',NULL,NULL,'5'),(21,1,'dedede',NULL,NULL,'5'),(22,1,'genemmma ',NULL,NULL,'6'),(23,1,'gemma',NULL,NULL,'6'),(24,1,'fefefef',NULL,NULL,'5'),(25,1,'fefeenueva ',NULL,NULL,'6'),(26,1,'gemama',NULL,NULL,'5'),(27,1,'geegegegegeg',NULL,NULL,'5'),(28,1,'nueva traea gemma',NULL,NULL,'6'),(29,1,'gemma ingresi ntarea',NULL,NULL,'6'),(30,1,'hola ',NULL,NULL,'6'),(31,1,'vuev tarea maruicio',NULL,NULL,'5'),(32,1,'tarea AHORA SI',2,NULL,'5'),(33,1,'TAREA SI12',1,NULL,'5'),(34,1,'TAREA 100',2,NULL,'5'),(35,8,'sASA',NULL,NULL,'C'),(36,8,'asSa',NULL,NULL,'C'),(37,8,'ASA',NULL,NULL,'C'),(38,22,'desarme',NULL,NULL,'C'),(39,22,'limpieza ',NULL,NULL,'C'),(40,22,'armado',1,NULL,'C'),(41,22,'limpieza',2,NULL,'C'),(42,22,'desarme',3,NULL,'C'),(43,16,'DDFDS',NULL,NULL,'C'),(44,16,'SDFSF',3,'2017-12-11','C'),(45,16,'nueva tarea: Limpieza ',1,'2017-12-11','RE'),(46,17,'jadf√±jdskjfd',NULL,NULL,'C'),(47,16,'saadsa',6,'2017-12-13','C'),(48,16,'sadadasd',NULL,NULL,'C'),(49,16,'sdadasdsa',3,NULL,'C'),(50,16,'1111',NULL,NULL,'C'),(51,16,'2222',3,NULL,'C'),(52,16,'dedede',1,NULL,'RE'),(53,16,'gegeg',1,NULL,'RE'),(54,21,'tarea 1',1,NULL,'C'),(55,21,'tarea2',3,NULL,'C'),(56,21,'tarea3',NULL,NULL,'C'),(57,21,'tarea4',NULL,NULL,'C'),(58,21,'tarea6',1,NULL,'RE'),(59,37,'dsadadad',1,'2017-12-20','C'),(60,34,'fsdfsfsd',1,'2017-12-29','C'),(61,34,'qwewqeqw',1,'2017-12-29','C'),(62,47,'sdadsad',NULL,NULL,'C'),(63,47,'sadad',NULL,NULL,'C'),(64,47,'dasdd',NULL,NULL,'RE'),(65,47,'dthdhgd',NULL,NULL,'RE'),(66,73,'dffgrrb',NULL,NULL,'C'),(67,73,'geegtgt',5,NULL,'C'),(68,73,'evefvev',1,NULL,'C');
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`loteid`),
  KEY `depositoid` (`depositoid`),
  KEY `artId` (`artId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lote`
--

LOCK TABLES `tbl_lote` WRITE;
/*!40000 ALTER TABLE `tbl_lote` DISABLE KEYS */;
INSERT INTO `tbl_lote` VALUES (1,NULL,'2017-11-06','27',1,'AC',1,NULL,2),(2,NULL,'2017-12-20','12',2,'AC',2,NULL,2);
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
  PRIMARY KEY (`id_notaPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notapedido`
--

LOCK TABLES `tbl_notapedido` WRITE;
/*!40000 ALTER TABLE `tbl_notapedido` DISABLE KEYS */;
INSERT INTO `tbl_notapedido` VALUES (57,'2017-11-14',1),(58,'2017-11-21',4),(59,'2017-11-30',4),(60,'2018-01-30',5),(61,'2018-07-22',3),(62,'2018-07-22',1),(63,'2018-07-22',3);
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
  `id_empresa` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prevId` (`prevId`),
  KEY `tbl_preventivoherramientas_ibfk_2` (`herrId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_preventivoherramientas`
--

LOCK TABLES `tbl_preventivoherramientas` WRITE;
/*!40000 ALTER TABLE `tbl_preventivoherramientas` DISABLE KEYS */;
INSERT INTO `tbl_preventivoherramientas` VALUES (1,22,20,1,'2');
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
  PRIMARY KEY (`id`),
  KEY `prevId` (`prevId`),
  KEY `artId` (`artId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_preventivoinsumos`
--

LOCK TABLES `tbl_preventivoinsumos` WRITE;
/*!40000 ALTER TABLE `tbl_preventivoinsumos` DISABLE KEYS */;
INSERT INTO `tbl_preventivoinsumos` VALUES (1,22,3,45);
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
  PRIMARY KEY (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_trazacomponente`
--

LOCK TABLES `tbl_trazacomponente` WRITE;
/*!40000 ALTER TABLE `tbl_trazacomponente` DISABLE KEYS */;
INSERT INTO `tbl_trazacomponente` VALUES (1,19,1,2,'2017-10-05 07:29:05','2017-10-05 07:31:25','Balderramo','T','se lleva balderrama para reparar bomba inyectora',5,2),(2,21,2,3,'2017-10-05 07:29:05','2017-10-05 07:29:05','Sr Perez','REC','recibo radiador para reparar',5,2),(3,22,1,1,'2017-12-02 07:12:21','2017-12-02 07:12:21','pedro perez','C','sadadsa',1,2),(4,29,1,1,'2017-12-02 07:12:53','2017-12-02 07:12:53','motores balderramo','C','dasdasd',1,2),(5,19,6,2,'2018-07-02 21:41:47','2018-07-02 21:41:47','comerciante 01','T','recibo de prueba...',1,2),(6,19,NULL,NULL,NULL,'2018-07-02 21:57:33','msosa','T','otra prueba...',1,2),(7,37,NULL,NULL,NULL,'2018-07-02 21:58:32','asdasd','T','asdadadsdd',1,2),(8,19,9,7,'2018-07-03 00:22:08','2018-07-03 00:22:08','qwerwrrewr','C','qewrwerwrer',1,2),(9,41,NULL,NULL,NULL,'2018-07-03 00:22:50','asdfasdf','T','asdfasdf',1,2),(10,46,NULL,NULL,NULL,'2018-07-03 00:24:05','zxcv','T','zxcv',1,2),(11,37,NULL,NULL,NULL,'2018-07-03 00:30:18','wwww','T','wwww',1,2),(12,37,6,5,'2018-07-03 00:31:10','2018-07-03 00:31:10','rrrr','C','rrrr',1,0);
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_unidadmedida`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_unidadmedida`
--

LOCK TABLES `tbl_unidadmedida` WRITE;
/*!40000 ALTER TABLE `tbl_unidadmedida` DISABLE KEYS */;
INSERT INTO `tbl_unidadmedida` VALUES (1,'Unidad',2),(2,'Litro',2),(3,'Kg',2);
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`valedid`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_valedesacarga`
--

LOCK TABLES `tbl_valedesacarga` WRITE;
/*!40000 ALTER TABLE `tbl_valedesacarga` DISABLE KEYS */;
INSERT INTO `tbl_valedesacarga` VALUES (1,'2018-06-25 00:00:00',1,'JJ Lopez','Taller',2),(2,'2018-07-01 00:00:00',1,'Miguel Cantilo','Pedro y Pablo',2);
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
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`valesid`),
  KEY `repid` (`usrId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_valesalida`
--

LOCK TABLES `tbl_valesalida` WRITE;
/*!40000 ALTER TABLE `tbl_valesalida` DISABLE KEYS */;
INSERT INTO `tbl_valesalida` VALUES (1,'2017-11-14',NULL,'Roberto P√©rez','Obra 1',2),(2,'2017-11-14',NULL,'Francisco Rodriguez','Obra 2',2),(4,'2017-11-14',5,NULL,NULL,2),(5,'2018-07-01',1,'Hugo Gallardo','Deposito 1',2);
/*!40000 ALTER TABLE `tbl_valesalida` ENABLE KEYS */;
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
  `id_empresa` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_industrial`
--

LOCK TABLES `unidad_industrial` WRITE;
/*!40000 ALTER TABLE `unidad_industrial` DISABLE KEYS */;
INSERT INTO `unidad_industrial` VALUES (1,'Veladero','2'),(2,'Unidad Insdutrial N¬∫2','2'),(3,'UP Rodeo','2'),(4,'La Laja','2'),(5,'UP TEST','2');
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
  `unidaddescrip` varchar(45) NOT NULL,
  `id_empresa` varchar(45) NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_tiempo`
--

LOCK TABLES `unidad_tiempo` WRITE;
/*!40000 ALTER TABLE `unidad_tiempo` DISABLE KEYS */;
INSERT INTO `unidad_tiempo` VALUES (1,'minutos','2'),(2,'horas','2'),(3,'dias','2');
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
INSERT INTO `usuarioasempresa` VALUES (2,1,'2018-09-18 00:00:00',1,1),(6,17,'2018-09-18 00:00:00',1,0),(7,16,'2018-09-17 00:00:00',1,0),(7,18,'2018-09-21 00:00:00',1,7),(7,19,'2018-09-12 00:00:00',1,1);
/*!40000 ALTER TABLE `usuarioasempresa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-24 23:38:55
