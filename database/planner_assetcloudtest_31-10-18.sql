-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 31-10-2018 a las 09:14:02
-- Versión del servidor: 5.6.23
-- Versión de PHP: 5.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `planner_assetcloudtest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abmdeposito`
--

CREATE TABLE IF NOT EXISTS `abmdeposito` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `abmdeposito`
--

INSERT INTO `abmdeposito` (`depositoId`, `depositodescrip`, `direccion`, `id_provincial`, `id_localidad`, `id_pais`, `GPS`, `estado`, `id_empresa`) VALUES
(1, 'Deposito 1', 'I. de la Rosa 2345 Rivadavia', NULL, NULL, NULL, NULL, 'AC', 6),
(2, 'Depósito 2', 'Av. Libertador San Martín 2450 oeste', NULL, NULL, NULL, NULL, 'AC', 6),
(4, 'Conteiner Mina Chinchillas', 'MINA Chinchillas', NULL, NULL, NULL, NULL, 'AC', 7),
(5, 'Sucursal Gral. Guemes', 'Tte. Ibañes 42 Gral Guemes Salta', NULL, NULL, NULL, NULL, 'AC', 7),
(6, 'Taller Central ', 'San Juan', NULL, NULL, NULL, NULL, 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abmproveedores`
--

CREATE TABLE IF NOT EXISTS `abmproveedores` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `abmproveedores`
--

INSERT INTO `abmproveedores` (`provid`, `provnombre`, `provcuit`, `provdomicilio`, `provtelefono`, `provmail`, `provestado`, `estado`, `id_empresa`) VALUES
(1, 'Juan Perez', '2023339814', 'dsadasdasd', '2645677', 'permauricio@gmail.com', '8', 'AC', 6),
(2, 'Trazalog', '20-54545454-9', 'Lib. Gral S Martin 1890', '15555555', 'soporte@trazalog.com', '8', 'AC', 6),
(3, 'Proveedor test', '20-20202022-7', 'Calle proveedor', '1777777777', 'info@proveedor.com', '8', 'AC', 7),
(5, 'Leonardo Pantano Tornero', 'xxxxxx', 'San Juan', '2645053221', 'leonardo.pantano@gmail.com', '8', 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admcustomers`
--

CREATE TABLE IF NOT EXISTS `admcustomers` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `admcustomers`
--

INSERT INTO `admcustomers` (`cliId`, `cliName`, `cliLastName`, `cliDni`, `cliDateOfBirth`, `cliNroCustomer`, `cliAddress`, `cliPhone`, `cliMovil`, `cliEmail`, `cliImagePath`, `zonaId`, `cliDay`, `cliColor`, `estado`, `id_empresa`, `cliRazonSocial`) VALUES
(13, 'Daniel', 'Osvaldo', '31324200', '1984-05-01', '1', 'Av La Humareda 12', '', '', '', '13.png', 10, 30, '#00a65a', 'AC', 6, 'Dani Osvaldo'),
(14, 'Mariana', 'Romero', '31324205', '2016-05-04', '14', 'Av. Simpre Viva 123', '', '', '', '14.png', 11, 15, '#f39c12', 'AC', 6, 'MRomero'),
(15, 'Patricia', 'Moreno', '45632145', '2016-05-19', '15', 'Rogelio Funes Mori y No Fue Corner', '', '', '', '15.png', 10, 10, '#dd4b39', 'AC', 6, 'Pato Moreno'),
(16, 'Homero', 'Perez', '45888882', '2000-05-10', '16', 'Rivadavia 124s', '', '', '', '16.png', 12, 20, '#00a65a', 'AC', 6, 'Homero''s'),
(17, 'Mauricio', 'perez', '23339814', '2016-06-01', '17', 'dd', '26465', '026457070785', 'permaucirio@gmail.com', '17.png', 10, 30, '#00a65a', 'AC', 6, 'Master of '),
(18, 'asAS', 'ASas', 'ss', '2016-12-16', '18', 'sASAs', 'sss', 's333', 'permauricio23', '18.png', 10, 30, '#00a65a', 'AN', 6, 'ASSAs'),
(19, 'eliana', NULL, '1234', NULL, NULL, 'san lorenzo 1442 este, santa lucia', '02644510131', NULL, 'eli', NULL, NULL, 30, NULL, 'AN', 6, 'nose'),
(20, 'Mina Chinchilla', 'Mina chinchilla', '02333981', NULL, NULL, '-', '-', NULL, '-', NULL, NULL, 30, NULL, 'AC', 7, 'Mina Chinchilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admstock`
--

CREATE TABLE IF NOT EXISTS `admstock` (
  `stkId` int(11) NOT NULL AUTO_INCREMENT,
  `prodId` int(11) NOT NULL,
  `stkCant` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `stkDate` datetime NOT NULL,
  `stkMotive` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`stkId`),
  KEY `prodId` (`prodId`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=41 ;

--
-- Volcado de datos para la tabla `admstock`
--

INSERT INTO `admstock` (`stkId`, `prodId`, `stkCant`, `usrId`, `stkDate`, `stkMotive`) VALUES
(27, 8, 10, 1, '2016-05-13 15:59:17', 'Ajuste inicial'),
(28, 9, 5, 1, '2016-05-13 15:59:39', 'Ajuste inicial'),
(29, 10, 20, 1, '2016-05-13 15:59:57', 'Ajuste inicial'),
(30, 9, -2, 1, '2016-05-17 18:15:03', 'Venta'),
(31, 10, 1, 1, '2017-01-19 12:13:25', 'Salida'),
(32, 10, 5, 1, '2017-01-19 12:15:11', 'entrada'),
(33, 10, 5, 1, '2017-01-19 12:15:26', 'salida'),
(34, 9, 3, 1, '2017-01-23 12:30:52', 'Salida'),
(35, 10, 8, 1, '2017-01-23 12:31:10', 'entrada'),
(36, 9, 1, 1, '2017-01-23 13:41:20', 'entrada'),
(37, 8, 1, 1, '2017-03-13 13:39:09', 'prestamo clorox'),
(38, 9, 1, 1, '2017-03-13 13:40:31', 'ingreso'),
(39, 10, 12, 1, '2017-03-13 13:41:09', 'salida'),
(40, 9, 4, 1, '2017-03-28 11:35:41', 'finning');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admvisits`
--

CREATE TABLE IF NOT EXISTS `admvisits` (
  `vstId` int(11) NOT NULL AUTO_INCREMENT,
  `vstDate` datetime NOT NULL,
  `cliId` int(11) NOT NULL,
  `vstNote` text COLLATE utf8_spanish_ci NOT NULL,
  `vstStatus` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`vstId`),
  KEY `cliId` (`cliId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `descripcion`, `id_empresa`, `estado`) VALUES
(1, 'proceso nuevo de area', 6, 'AC'),
(2, 'gemma area 1', 0, 'AC'),
(3, 'Industrial', 6, 'AC'),
(4, 'Area Nueva', 6, 'AC'),
(5, 'otra area 8', 6, 'AC'),
(6, 'area 9', 4, 'AC'),
(7, 'area 51', 6, 'AC'),
(8, 'Area Testing', 6, 'AC'),
(9, 'Area compras', 6, 'AC'),
(10, 'area 9', 6, 'AC'),
(12, 'MIna', 7, 'AC'),
(13, 'Operaciones', 6, 'AC'),
(14, 'Mina', 7, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=254 ;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`artId`, `artBarCode`, `artDescription`, `artCoste`, `artMargin`, `artIsByBox`, `artCantBox`, `artMarginIsPorcent`, `artEstado`, `famId`, `unidadmedida`, `punto_pedido`, `id_empresa`) VALUES
(2, '51574', 'FILTRO DE COMBUSTIBLE P/TAMROCK N°88', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(10, '123456', 'BUJE DE ROTACION P/TAMROCK 680', 0.00, 0.00, 0, 6, b'0', 'AC', 9, 2, 0, 6),
(11, '50686', 'BULON NRO. 86321729 P/TAMROCK HL 500', 0.00, 0.00, 1, 1, b'0', 'AC', 1, 1, 0, 6),
(12, '51258', 'DIAFRAGMA N:04114808 P/TAMROCK', 0.00, 0.00, 1, 3, b'0', 'AC', 4, 1, 0, 6),
(13, '51265', 'DIAFRAGMA P/COMP. TAMROCK HL 680-2 A', 0.00, 0.00, 1, 0, b'0', 'AC', 4, 1, 0, 6),
(14, '51315', 'EJE P/ TAMROCK N† 15178158', 0.00, 0.00, 1, 0, b'0', 'AC', 5, 1, 0, 6),
(15, '51317', 'EJE P/TAMROCK 500 ART. 23313378', 0.00, 0.00, 1, 0, b'0', 'AC', 5, 1, 0, 6),
(16, '51471', 'FILTRO  COMBUSTIBLE P 557440 TAMROCK', 0.00, 0.00, 1, 3, b'0', 'AC', 3, 1, 0, 6),
(17, '51571', 'FILTRO TAMROCK ACEITE CAT 1R-0739', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(18, '51545', 'FILTRO TAMROCK AIRE †88546679', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(19, '51546', 'FILTRO TAMROCK AIRE/CABINA PRIMARIO', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(20, '51548', 'FILTRO TAMROCK AIRE/COMPRESOR 885467', 0.00, 0.00, 1, 1, b'0', 'AC', 3, 1, 0, 6),
(21, '51550', 'FILTRO TAMROCK CIRC/HID.RETORNO 8672', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(22, '51551', 'FILTRO TAMROCK CIRC/HID.SANDVICK 815', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(23, '51552', 'FILTRO TAMROCK COMB,N† 1R-0751', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(24, '51553', 'FILTRO TAMROCK COMB,TRAMPA/AGUA 1466', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(25, '53605', 'TRAMPA DE AGUA PARA TAMROCK', 0.00, 0.00, 1, 2, b'0', 'AC', 10, 1, 0, 6),
(26, '53701', 'TUERCA NRO.81125969 P/TAMROCK', 0.00, 0.00, 1, 1, b'0', 'AC', 9, 1, 0, 6),
(27, '53947', 'KIT DE SELLOS NRO.879484449 TAMROCK', 0.00, 0.00, 1, 0, b'0', 'AC', 7, 1, 0, 6),
(28, '53966', 'RETEN NRO 15074808 TAMROCK R -500', 0.00, 0.00, 1, 1, b'0', 'AC', 8, 1, 0, 6),
(29, '53969', 'SELLOS NRO 81820039 TAMROCK R-500', 0.00, 0.00, 1, 3, b'0', 'AC', 7, 1, 0, 6),
(30, '54022', 'BUJE P/TAMROCK N 15021838', 0.00, 0.00, 1, 4, b'0', 'AC', 2, 1, 0, 6),
(31, '54469', 'VALVULA  ART 807 590 69 P/TAMROCK HL', 0.00, 0.00, 1, 2, b'0', 'AC', 6, 1, 0, 6),
(32, '58076', 'FILTRO TAMROCK 500 AIRE COMPRESOR PR', 0.00, 0.00, 1, 1, b'0', 'AC', 3, 1, 0, 6),
(33, '58077', 'FILTRO TAMROCK 500 AIRE SECUNDARIO M', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(34, '58078', 'FILTRO TAMROCK 500 AIRE  PRIMARIO MO', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(35, '58079', 'FILTRO TAMROCK 500 AIRE COMPRESOR SE', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(36, '58080', 'FILTRO TAMROCK 500 GASOIL ART8823923', 0.00, 0.00, 1, 3, b'0', 'AC', 3, 1, 0, 6),
(37, '58081', 'FILTRO TAMROCK 500 GASOIL SEPARADOR', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(38, '58082', 'FILTRO TAMROCK 500 ACEITE MOTOR ART', 0.00, 0.00, 1, 3, b'0', 'AC', 3, 1, 0, 6),
(39, '50190', 'ARANDELA DE BRONCE 7K-1840 P/CAT 966', 0.00, 0.00, 1, 0, b'0', 'AN', 11, 1, 0, 6),
(40, '50236', 'ARANDELAS N  7K-1839 P/CATERPILLAR 9', 0.00, 0.00, 1, 0, b'0', 'AN', 11, 1, 0, 6),
(41, '50465', 'BULON ART. NRO. 6729510 P/ BOB CATERPILLAR', 0.00, 0.00, 0, 0, b'0', 'AC', 1, 7, 12, 6),
(42, '50712', 'BULON   P/ CAT- 966 DIENTE DE CARGAD', 0.00, 0.00, 1, 22, b'0', 'AC', 1, 1, 0, 6),
(43, '50714', 'BULON  8T -6466 P/AIRE ACONDI CAT -', 0.00, 0.00, 1, 0, b'0', 'AC', 1, 1, 0, 6),
(44, '50966', 'COMPRESOR DE AIRE N† 8N 6105 P / CAT', 0.00, 0.00, 1, 0, b'0', 'AC', 19, 1, 0, 6),
(45, '51084', 'CORREA DE ALTERNAD. P/BOBCAT ART.710', 0.00, 0.00, 1, 5, b'0', 'AC', 21, 1, 0, 6),
(46, '51188', 'CORTA CORRIENTE DE 24 VOLT. P/CAT 98', 0.00, 0.00, 1, 1, b'0', 'AC', 20, 1, 0, 6),
(47, '51208', 'CUBIERTA 10 X 16.5 SOLIDEAL P/BOBCAT', 0.00, 0.00, 1, 1, b'0', 'AC', 22, 1, 0, 6),
(48, '51259', 'DIAFRAGMA N† 5V 6125 P/ CAT 980', 0.00, 0.00, 1, 3, b'0', 'AC', 4, 1, 0, 6),
(49, '51455', 'FILTRO BOBCAT ACEIT,HID.N†6661248', 0.00, 0.00, 1, 2, b'0', 'AC', 3, 1, 0, 6),
(50, '51456', 'FILTRO BOBCAT ACEIT,MOTOR N†03974896', 0.00, 0.00, 1, 2, b'0', 'AC', 3, 1, 0, 6),
(51, '51457', 'FILTRO BOBCAT AIRE PRIM.N†06598492', 0.00, 0.00, 1, 8, b'0', 'AC', 3, 1, 0, 6),
(52, '51458', 'FILTRO BOBCAT AIRE SEC.N†06598362', 0.00, 0.00, 1, 9, b'0', 'AC', 3, 1, 0, 6),
(53, '51459', 'FILTRO BOBCAT COMB.N†06667352', 0.00, 0.00, 1, 7, b'0', 'AC', 3, 1, 0, 6),
(54, '51460', 'FILTRO CAT-966 ACEIT/CONV N†9740', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(55, '51461', 'FILTRO CAT-966 ACEIT/HID,N†156-0741-', 0.00, 0.00, 1, 1, b'0', 'AC', 3, 1, 0, 6),
(56, '51462', 'FILTRO CAT-966 ACEITE N†1R-0739', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(57, '51463', 'FILTRO CAT-966 AIRE PRIMARIO 2453818', 0.00, 0.00, 1, 1, b'0', 'AC', 3, 1, 0, 6),
(58, '51464', 'FILTRO CAT-966 AIRE SECUNDARIO 24538', 0.00, 0.00, 1, 1, b'0', 'AC', 3, 1, 0, 6),
(59, '51465', 'FILTRO CAT-966 COMB,N†1P-2299-BOSCH', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(60, '51466', 'FILTRO CAT-980 ACEITE MOTOR', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(61, '51467', 'FILTRO CAT-980 ACEIT/HIDRAULICO', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(62, '51468', 'FILTRO CAT-980 TRASMISION', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(63, '51469', 'FILTRO CAT-980 FILTRO SEPARADOR DE A', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(64, '51470', 'FILTRO CAT-980 CABINA', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(66, '51685', 'GUIA N† 2 L-3650 P/CAT 966', 0.00, 0.00, 1, 1, b'0', 'AC', 12, 1, 0, 6),
(67, '51825', 'JUNTA N† 8S-1605 P/CAT.966', 0.00, 0.00, 1, 0, b'0', 'AC', 15, 1, 0, 6),
(68, '51826', 'JUNTA N† 9Y-1979 P/CAT.966', 0.00, 0.00, 1, 0, b'0', 'AC', 15, 1, 0, 6),
(69, '51829', 'JUNTA NRO. 6684788 P/BOB CAT', 0.00, 0.00, 1, 0, b'0', 'AC', 15, 1, 0, 6),
(70, '52317', 'PERNO DE BALDE  NRO. 8K- 5334 P/CAT.', 0.00, 0.00, 1, 2, b'0', 'AC', 13, 1, 0, 6),
(71, '53371', 'SELLO  N: 2H-6368 P/CAT. 966', 0.00, 0.00, 1, 6, b'0', 'AC', 7, 1, 0, 6),
(72, '53394', 'SELLO N† 6D 692 P/ CAT -980', 0.00, 0.00, 1, 4, b'0', 'AC', 7, 1, 0, 6),
(73, '53703', 'TUERCA P/BOBCAT S150 N€ 6674202', 0.00, 0.00, 1, 0, b'0', 'AC', 9, 1, 0, 6),
(74, '53706', 'TUERCA PARA BULON DE RUEDA, P/ CAT.', 0.00, 0.00, 1, 20, b'0', 'AC', 9, 1, 0, 6),
(75, '53918', 'COJINETE  5M 578 CAT-966', 0.00, 0.00, 1, 4, b'0', 'AC', 14, 1, 0, 6),
(76, '54023', 'BULON 1604 P/CAT 980', 0.00, 0.00, 1, 8, b'0', 'AC', 1, 1, 0, 6),
(77, '54042', 'CABLE DE ACELERADOR P/CAT 980 ART 3V', 0.00, 0.00, 1, 1, b'0', 'AC', 16, 1, 0, 6),
(78, '54210', 'JUNTA 5S-4629 P/CAT-966', 0.00, 0.00, 1, 2, b'0', 'AC', 15, 1, 0, 6),
(79, '57873', 'FILTRO DE COMBUSTIBLE CAT 966H 1R-07', 0.00, 0.00, 1, 3, b'0', 'AC', 3, 1, 0, 6),
(80, '57874', 'FILTRO  DE  ACEITE MOTOR CAT 966H 1R', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(81, '57876', 'FILTRO  DE  ACEITE  HIDRAULICO  CAT', 0.00, 0.00, 1, 7, b'0', 'AC', 3, 1, 0, 6),
(82, '54012', 'BASE  PORTA FILTRO  ART 6N 1044 CAT', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(83, '54833', 'CAMISA CILINDRO DE MOTOR CAT-3306', 0.00, 0.00, 1, 0, b'0', 'AC', 24, 1, 0, 6),
(84, '54834', 'JUEGO DE AROS DE MOTOR CAT-3306', 0.00, 0.00, 1, 0, b'0', 'AC', 24, 1, 0, 6),
(85, '57913', 'RADIADOR AGUA P/CAT 966H', 0.00, 0.00, 1, 0, b'0', 'AC', 23, 1, 0, 6),
(86, '58036', 'TERMOSTATO  NRO 281- 8744 P/CAT 924', 0.00, 0.00, 1, 0, b'0', 'AC', 17, 1, 0, 6),
(87, '58038', 'TERMOSTATO  NRO 248 -5513 P/CAT 966', 0.00, 0.00, 1, 0, b'0', 'AC', 17, 1, 0, 6),
(88, '58275', 'FILTRO CAT-980 MOTOR 1R-1808', 0.00, 0.00, 1, 3, b'0', 'AC', 3, 1, 0, 6),
(89, '58276', 'FILTRO CAT-980 GASOIL 1R0749', 0.00, 0.00, 1, 4, b'0', 'AC', 3, 1, 0, 6),
(90, '58277', 'FILTRO CAT-980 GASOIL SEP 326-1644', 0.00, 0.00, 0, 0, b'0', 'AC', 3, 1, 0, 6),
(91, '58278', 'FILTRO CAT-980 AIRE PRIMARIO 151-773', 0.00, 0.00, 1, 3, b'0', 'AC', 3, 0, 0, 6),
(92, '58279', 'FILTRO CAT-980 AIRE SECUNDARIO 18902', 0.00, 0.00, 1, 7, b'0', 'AN', 3, 1, 0, 6),
(93, '50182', 'ARANDELA ART, 01643-32260 P/ KOMATSU', 0.00, 0.00, 1, 0, b'0', 'AN', 11, 1, 88, 6),
(94, '50400', 'BRACKET P/KOMATSU P/KOMATSU 470', 0.00, 0.00, 1, 2, b'0', 'AN', 1, 1, 0, 6),
(95, '50436', 'BUJE N† 17177-04530 P/KOMATSU WA 420', 0.00, 0.00, 1, 1, b'0', 'AN', 2, 1, 0, 6),
(96, '50461', 'BUJIA NRO. 600-815-2770 P/KOMATSU 42', 0.00, 0.00, 0, 0, b'0', 'IN', 2, 1, 4, 6),
(97, '50684', 'BULON NRO. 16202091-12050 P/ KOMATSU', 0.00, 0.00, 1, 22, b'0', 'AC', 1, 1, 0, 6),
(98, '50685', 'BULON NRO. 419-70-13150 P/KOMATSU 25', 0.00, 0.00, 1, 12, b'0', 'AC', 1, 1, 0, 6),
(99, '50689', 'BULON P/KOMATSU 470 N 2 ART. 09208-1', 0.00, 0.00, 1, 0, b'0', 'AC', 1, 1, 0, 6),
(100, '50715', 'BULON  DE CARDAN P/ KOMATSU 420-3 N†', 0.00, 0.00, 1, 9, b'0', 'AC', 1, 1, 0, 6),
(101, '50716', 'BULON  P/ KOMATSU N† 02090-11490', 0.00, 0.00, 1, 41, b'0', 'AC', 1, 1, 0, 6),
(102, '50717', 'BULON   DE CARDAN P/ KOMATSU 420-3 N', 0.00, 0.00, 1, 23, b'0', 'AC', 1, 0, 0, 6),
(103, '51179', 'CORREA NRO. 6732-81-6170 , P/KOMATSU', 0.00, 0.00, 1, 2, b'0', 'AC', 21, 0, 0, 6),
(104, '51196', 'CRUCETA NRO. 418-20-34620 P/KOMATSU', 0.00, 0.00, 1, 1, b'0', 'AC', 1, 1, 0, 6),
(105, '51197', 'CRUCETA NRO. 421-20-12620 P/KOMATSU', 0.00, 0.00, 1, 1, b'0', 'AC', 25, 1, 0, 6),
(121, '51198', 'ESPEJO NRO. 421-54-25620 P/KOMATSU 4', 0.00, 0.00, 0, NULL, b'0', 'AC', 1, 0, NULL, 6),
(130, '51195', 'CRUCETA NRO 418-20-32620 , P/KOMATSU', 0.00, 0.00, 1, 1, b'0', 'AC', 25, 1, 0, 6),
(133, '51808', 'JUNTA ANULAR P/KOMATSU 470  ART.600-', 0.00, 0.00, 1, 0, b'0', 'AC', 15, 1, 0, 6),
(134, '52304', 'PASADOR P/KOMATSU 470 ART, 092440251', 0.00, 0.00, 1, 3, b'0', 'AC', 28, 1, 0, 6),
(135, '52408', 'PLATOS NRO. 421-70-22140  P/ KOMATSU', 0.00, 0.00, 1, 4, b'0', 'AC', 29, 1, 0, 6),
(136, '53377', 'SELLO 421- 33 - 11480 P/ KOMATSU 420', 0.00, 0.00, 1, 0, b'0', 'AC', 7, 1, 0, 6),
(137, '53637', 'TUERCA 09218 - 12219 P/ KOMATSU WA 4', 0.00, 0.00, 1, 2, b'0', 'AC', 9, 1, 0, 6),
(138, '53693', 'TUERCA N† 02290 - 11422 P/KOMATSU WA', 0.00, 0.00, 1, 0, b'0', 'AC', 9, 1, 0, 6),
(139, '53695', 'TUERCA NRO. 02290-11625, P/KOMATSU 4', 0.00, 0.00, 1, 9, b'0', 'AC', 9, 1, 0, 6),
(140, '53696', 'TUERCA NRO. 091218-12523 P/KOMATSU 2', 0.00, 0.00, 1, 16, b'0', 'AC', 9, 1, 0, 6),
(141, '53698', 'TUERCA NRO. 16202290-12031 P/KOMATSU', 0.00, 0.00, 1, 21, b'0', 'AC', 9, 1, 0, 6),
(142, '53700', 'TUERCA NRO.02290-11422 P/KOMATSU', 0.00, 0.00, 1, 2, b'0', 'AC', 9, 1, 0, 6),
(143, '53721', 'TUERCAS N º 09218-12219 P/ KOMATSU', 0.00, 0.00, 1, 6, b'0', 'AC', 9, 1, 0, 6),
(144, '53820', 'VALVULA P/ FILTRO DE AIRE P/KOMATSU', 0.00, 0.00, 1, 2, b'0', 'AC', 6, 1, 0, 6),
(145, '53991', 'ACOPLE NRO  09281-00041 P/KOMATSU 25', 0.00, 0.00, 1, 1, b'0', 'AC', 18, 1, 0, 6),
(146, '54019', 'BUJE 421-70-11272 P/KOMATSU 470', 0.00, 0.00, 1, 0, b'0', 'AC', 2, 1, 0, 6),
(147, '54045', 'CABLE  NRO 424-9916110  P/KOMATSU', 0.00, 0.00, 1, 1, b'0', 'AC', 1, 1, 0, 6),
(148, '54150', 'FILT.KOMATSU 470 /2 COMBUSTIBLE 600-', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(149, '54411', 'SEGURO NRO. 09283-00000 P/KOMATSU 25', 0.00, 0.00, 1, 1, b'0', 'AC', 30, 1, 0, 6),
(150, '54432', 'TAPA  NRO 09282-00017 P/KOMATSU 250', 0.00, 0.00, 1, 1, b'0', 'AC', 31, 1, 0, 6),
(151, '54504', 'TUERCA DE ACERO / KOMATSU 420', 0.00, 0.00, 1, 8, b'0', 'AC', 9, 1, 0, 6),
(152, '54505', 'BULON NRO 16201010-62075 P/KOMATSU', 0.00, 0.00, 1, 3, b'0', 'AC', 1, 1, 0, 6),
(153, '54929', 'JUNTA ANULAR PARA KOMATSU 470 ART: 1', 0.00, 0.00, 1, 1, b'0', 'AC', 15, 1, 0, 6),
(154, '55204', 'TUERCA P/ EJE DELANTERO P/ KOMATSU 4', 0.00, 0.00, 1, 9, b'0', 'AC', 9, 1, 0, 6),
(155, '55242', 'ALTERNADOR DE 24V. P/KOMATSU', 0.00, 0.00, 1, 0, b'0', 'AC', 32, 1, 0, 6),
(156, '51439', 'FAROS  TOYOTA 3.0', 0.00, 0.00, 1, 0, b'0', 'IN', 33, 1, 0, 6),
(157, '51486', 'FILTRO COMBUSTIBLE  CLARK TOYOTA 233', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(158, '51488', 'FILTRO CLARK TOYOTA MOTOR 90915-2000', 0.00, 0.00, 1, 3, b'0', 'AC', 3, 1, 0, 6),
(159, '51490', 'FILTRO CLARK TOYOTA CONVERTIDOR 3267', 0.00, 0.00, 1, 1, b'0', 'AC', 3, 1, 0, 6),
(160, '51516', 'FILTRO CLARK TOYOTA HIDRAULICO 67502', 0.00, 0.00, 1, 4, b'0', 'AC', 3, 1, 0, 6),
(161, '51517', 'FILTRO CLARK TOYOTA AIRE SECUNDARIO', 0.00, 0.00, 1, 4, b'0', 'AC', 3, 1, 0, 6),
(162, '51518', 'FILTRO CLARK TOYOTA AIRE PRIMARIO P8', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(163, '50386', 'BOMBIN DE GASOIL P/BOBCAT ART.665773', 0.00, 0.00, 1, 100, b'0', 'AN', 15, 1, 6, 6),
(165, '56174', 'LLANTA NRO. NRPB03535239 P/ BOBCAT S', 0.00, 0.00, 1, 0, b'0', 'AC', 35, 1, 0, 6),
(166, '1234', 'nuevo articulo', 0.00, 0.00, 1, 6, b'0', 'AN', 3, 1, 1203, 6),
(169, '9999', 'nuevo producto', 0.00, 0.00, 1, 23, b'0', 'AN', 13, 2, 1200, 6),
(170, '9987', 'nuevo ver', 0.00, 0.00, 1, 23, b'0', 'AN', 15, 2, 0, 6),
(171, '3115 23 23', 'nose', 0.00, 0.00, 1, 1, b'0', 'AC', 6, 0, 0, 7),
(172, 'xxxxxx', 'yyyyyyy', 0.00, 0.00, 0, 0, b'0', 'AN', 3, 1, 2, 7),
(173, '12345678910', 'nueva descripcion', 0.00, 0.00, 0, 0, b'0', 'AC', 15, 0, 0, 6),
(174, '123456789', 'descripcion de prueba', 0.00, 0.00, 0, 0, b'0', 'AC', 17, 0, 0, 6),
(175, '12345678', 'nuevaaaaaa', 0.00, 0.00, 1, 33, b'0', 'AC', 3, 0, 0, 6),
(176, '15151515', 'producto nuevo', 0.00, 0.00, 0, 0, b'0', 'AC', 1, 0, 3, 6),
(177, '123', '123descripcion', 0.00, 0.00, 1, 6, b'0', 'AN', 1, 2, 2, 6),
(178, '1112', '1112descrip', 0.00, 0.00, 1, 12, b'0', 'AN', 5, 2, 1112, 6),
(185, '11asdf', '11asdf', 0.00, 0.00, 1, 6, b'0', 'AN', 3, 3, 11, 6),
(194, '1codigo-001', 'descripción de código 001', 0.00, 0.00, 0, 0, b'0', 'AN', 22, 1, 1, 6),
(200, '2cod-002', 'descrip cod 002', 0.00, 0.00, 1, 12, b'0', 'AN', 5, 1, 2, 6),
(201, '111', 'ghfhjgfhg', 0.00, 0.00, 0, 0, b'0', 'AN', 3, 1, 2, 6),
(202, '111111111', 'nuevo', 0.00, 0.00, 1, 10, b'0', 'AN', 21, 3, 5, 6),
(203, '123455678', 'eliiiii', 0.00, 0.00, 1, 11, b'0', 'AN', 24, 1, 4, 6),
(210, '3cod-0003', 'descrip', 0.00, 0.00, 0, 0, b'0', 'AN', 5, 2, 3, 6),
(211, '4cod0004a', 'Descrip 03', 0.00, 0.00, 0, 12, b'0', 'AN', 15, 1, 3, 6),
(212, '222233', 'dsadsadsad', 0.00, 0.00, 0, 0, b'0', 'AN', 17, 1, 3, 6),
(213, '333333', 'sdadasdsad', 0.00, 0.00, 1, 4, b'0', 'AN', 22, 1, 4, 6),
(215, '124456897654324', 'hefdiujbwda', 0.00, 0.00, 0, 0, b'0', 'AN', 20, 1, 4, 6),
(216, '1234556678', 'nuevoooooo', 0.00, 0.00, 1, 10, b'0', 'AN', 26, 1, 5, 6),
(221, 'aaa', 'aaa', 0.00, 0.00, 1, 6, b'0', 'AN', 4, 2, 0, 6),
(227, '11187326487234623462783', 'assdasds', 0.00, 0.00, 0, 0, b'0', 'AN', 13, 3, 0, 6),
(228, '122334455', 'nuevo test', 0.00, 0.00, 1, 60, b'0', 'AN', 17, 2, 41, 6),
(229, '123456678', 'test', 0.00, 0.00, 1, 10, b'0', 'AN', 12, 1, 55, 6),
(235, '000', 'nnnn', 0.00, 0.00, 0, 0, b'0', 'AN', 5, 1, 3, 6),
(236, '00001', 'aaaa', 0.00, 0.00, 0, 0, b'0', 'AN', 1, 1, 6, 6),
(238, '1', 'nuevo articulo 112233', 0.00, 0.00, 1, 30, b'0', 'AN', 33, 1, 5, 6),
(239, '2', 'nuevo articulo 2', 0.00, 0.00, 1, 12, b'0', 'AN', 22, 1, 4, 6),
(240, '12345', 'nuevo de 5', 0.00, 0.00, 1, 5, b'0', 'AN', 1, 1, 4, 6),
(245, '8888888888', 'campo de 6 digitos', 0.00, 0.00, 1, 12, b'0', 'AN', 20, 3, 4, 6),
(246, '1122334455', 'eliana', 0.00, 0.00, 1, 44, b'0', 'AN', 1, 1, 5, 6),
(248, '22', 'asdasd', 0.00, 0.00, 1, 0, b'0', 'AC', 1, -1, 3, 7),
(249, '57653456', 'bulon de escalera ', 0.00, 0.00, 1, 0, b'0', 'AC', 1, -1, 1, 7),
(250, '1R-1825 ', 'filtro ', 0.00, 0.00, 1, 2, b'0', 'AN', 3, 1, 4, 7),
(251, 'sdsad', 'sdsd', 0.00, 0.00, 1, 0, b'0', 'AC', 12, 1, 2, 7),
(252, '22222', 'guantes 22', 0.00, 0.00, 0, 0, b'0', 'AC', 3, 2, 8, 7),
(253, '1111', 'ddddddddddddd', 0.00, 0.00, 0, 0, b'0', 'AC', 6, 1, 4, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaherramientas`
--

CREATE TABLE IF NOT EXISTS `asignaherramientas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `herrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `herrId` (`herrId`),
  KEY `id_orden` (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignausuario`
--

CREATE TABLE IF NOT EXISTS `asignausuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usrId` (`usrId`),
  KEY `id_orden` (`id_orden`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `asignausuario`
--

INSERT INTO `asignausuario` (`id`, `usrId`, `id_orden`, `fechahora`) VALUES
(1, 16, 4, '2018-09-19 11:50:17'),
(2, 17, 4, '2018-09-19 11:50:17'),
(3, 17, 11, '2018-10-21 00:14:33'),
(4, 1, 12, '2018-10-21 00:22:27'),
(5, 17, 13, '2018-10-21 00:25:11'),
(6, 17, 19, '2018-10-21 16:48:52'),
(7, 17, 1, '2018-10-23 18:18:50'),
(8, 17, 2, '2018-10-23 18:40:55'),
(9, 17, 3, '2018-10-24 08:10:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE IF NOT EXISTS `ciudades` (
  `idCiudades` int(11) NOT NULL AUTO_INCREMENT,
  `Paises_Codigo` varchar(2) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`idCiudades`),
  KEY `Paises_Codigo` (`Paises_Codigo`),
  KEY `Ciudad` (`Ciudad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idCiudades`, `Paises_Codigo`, `Ciudad`) VALUES
(1, 'AR', 'Buenos Aires'),
(2, 'AR', 'Santa Fe'),
(3, 'AR', 'Córdoba'),
(4, 'AR', 'Misiones'),
(5, 'AR', 'Entre Rios'),
(6, 'AR', 'Mendoza'),
(7, 'AR', 'San Juan'),
(8, 'AR', 'Tucumán'),
(9, 'AR', 'Tierra del Fuego'),
(10, 'AR', 'Chaco'),
(11, 'AR', 'La Pampa'),
(12, 'AR', 'Jujuy'),
(13, 'AR', 'Rio Negro'),
(14, 'AR', 'Chubut'),
(15, 'AR', 'Corrientes'),
(16, 'AR', 'Santa Cruz'),
(17, 'AR', 'Salta'),
(18, 'AR', 'San Luis'),
(19, 'AR', 'Neuquen'),
(20, 'AR', 'Catamarca'),
(21, 'AR', 'Santiago del Estero'),
(22, 'AR', 'La Rioja'),
(23, 'AR', 'Formosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`clinteid`, `clientrazonsocial`, `clientdireccion`, `clientmail`, `clienttelefono`, `clientetelefono1`, `localidadid`, `paisid`, `provinciaid`, `cuenta_cuentaid`) VALUES
(1, 'TRazalog', 'av libertado 3890 oeste', 'ventas@trazalog.com', 2147483647, NULL, 'San Juan', '1', 1, 1),
(2, 'MRS SERVICE SRL', '-', '-', NULL, NULL, NULL, 'AR', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componenteequipo`
--

CREATE TABLE IF NOT EXISTS `componenteequipo` (
  `idcomponenteequipo` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `codigo` varchar(40) DEFAULT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `sistemaid` int(11) NOT NULL,
  PRIMARY KEY (`idcomponenteequipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=350 ;

--
-- Volcado de datos para la tabla `componenteequipo`
--

INSERT INTO `componenteequipo` (`idcomponenteequipo`, `id_equipo`, `id_componente`, `observacion`, `codigo`, `estado`, `id_empresa`, `sistemaid`) VALUES
(1, 1, 1, NULL, NULL, 'AN', 6, 1),
(2, 1, 3, NULL, '12345', 'AC', 6, 1),
(3, 1, 5, NULL, '123', 'AC', 6, 1),
(4, 1, 12, NULL, 'KomatsuCarter', 'AC', 6, 1),
(5, 1, 5, NULL, NULL, 'AC', 6, 1),
(6, 2, 6, NULL, NULL, 'AC', 6, 1),
(7, 2, 7, NULL, NULL, 'AC', 6, 1),
(8, 2, 8, NULL, NULL, 'AC', 6, 1),
(9, 2, 9, NULL, NULL, 'AC', 6, 1),
(10, 2, 10, NULL, NULL, 'AC', 6, 1),
(11, 3, 11, NULL, NULL, 'AC', 6, 1),
(12, 3, 12, NULL, NULL, 'AC', 6, 1),
(13, 3, 13, NULL, NULL, 'AC', 6, 1),
(14, 3, 14, NULL, NULL, 'AC', 6, 1),
(15, 3, 15, NULL, NULL, 'AC', 6, 1),
(16, 4, 16, NULL, NULL, 'AC', 6, 1),
(17, 4, 17, NULL, NULL, 'AC', 6, 1),
(18, 4, 18, NULL, NULL, 'AC', 6, 1),
(19, 4, 19, NULL, NULL, 'AC', 6, 1),
(20, 4, 20, NULL, NULL, 'AC', 6, 1),
(21, 5, 21, NULL, NULL, 'AC', 6, 1),
(22, 5, 22, NULL, NULL, 'AC', 6, 1),
(23, 5, 23, NULL, NULL, 'AC', 6, 1),
(24, 5, 24, NULL, NULL, 'AC', 6, 1),
(25, 5, 25, NULL, NULL, 'AC', 6, 1),
(26, 1, 26, NULL, NULL, 'AC', 6, 1),
(27, 1, 27, NULL, NULL, 'AC', 6, 1),
(28, 1, 28, NULL, NULL, 'AC', 6, 1),
(29, 1, 29, NULL, NULL, 'AC', 6, 1),
(30, 1, 30, NULL, NULL, 'AC', 6, 1),
(31, 2, 31, NULL, NULL, 'AC', 6, 1),
(32, 2, 32, NULL, NULL, 'AC', 6, 1),
(33, 2, 33, NULL, NULL, 'AC', 6, 1),
(34, 2, 34, NULL, NULL, 'AC', 6, 1),
(35, 2, 35, NULL, NULL, 'AC', 6, 1),
(36, 2, 36, NULL, NULL, 'AC', 6, 1),
(37, 2, 37, NULL, NULL, 'AC', 6, 1),
(38, 2, 38, NULL, NULL, 'AC', 6, 1),
(39, 2, 39, NULL, NULL, 'AC', 6, 1),
(40, 2, 40, NULL, NULL, 'AC', 6, 1),
(41, 2, 41, NULL, NULL, 'AC', 6, 1),
(42, 2, 42, NULL, NULL, 'AC', 6, 1),
(43, 2, 43, NULL, NULL, 'AC', 6, 1),
(44, 2, 44, NULL, NULL, 'AC', 6, 1),
(45, 3, 46, NULL, NULL, 'AC', 6, 1),
(46, 3, 47, NULL, NULL, 'AC', 6, 1),
(47, 3, 48, NULL, NULL, 'AC', 6, 1),
(48, 3, 49, NULL, NULL, 'AC', 6, 1),
(49, 3, 50, NULL, NULL, 'AC', 6, 1),
(50, 3, 51, NULL, NULL, 'AC', 6, 1),
(51, 3, 52, NULL, NULL, 'AC', 6, 1),
(52, 3, 53, NULL, NULL, 'AC', 6, 1),
(53, 3, 54, NULL, NULL, 'AC', 6, 1),
(54, 3, 55, NULL, NULL, 'AC', 6, 1),
(55, 3, 56, NULL, NULL, 'AC', 6, 1),
(56, 3, 57, NULL, NULL, 'AC', 6, 1),
(57, 3, 58, NULL, NULL, 'AC', 6, 1),
(58, 3, 59, NULL, NULL, 'AC', 6, 1),
(59, 4, 61, NULL, NULL, 'AC', 6, 1),
(60, 4, 62, NULL, NULL, 'AC', 6, 1),
(61, 4, 63, NULL, NULL, 'AC', 6, 1),
(62, 4, 64, NULL, NULL, 'AC', 6, 1),
(63, 4, 65, NULL, NULL, 'AC', 6, 1),
(64, 4, 66, NULL, NULL, 'AC', 6, 1),
(65, 4, 67, NULL, NULL, 'AC', 6, 1),
(66, 4, 68, NULL, NULL, 'AC', 6, 1),
(67, 4, 69, NULL, NULL, 'AC', 6, 1),
(68, 4, 70, NULL, NULL, 'AC', 6, 1),
(69, 4, 71, NULL, NULL, 'AC', 6, 1),
(70, 4, 72, NULL, NULL, 'AC', 6, 1),
(71, 4, 73, NULL, NULL, 'AN', 6, 1),
(72, 1, 1, NULL, '455441', 'AN', 6, 1),
(73, 1, 19, NULL, '222222', 'AN', 6, 1),
(74, 11, 74, NULL, '44444444444', 'AN', 7, 1),
(75, 13, 76, NULL, 'xxxxx', 'AC', 7, 1),
(76, 14, 76, NULL, 'xxxx', 'AC', 7, 1),
(77, 13, 77, NULL, '', 'AC', 7, 1),
(78, 13, 80, NULL, '', 'AN', 7, 1),
(79, 13, 82, NULL, '', 'AN', 7, 1),
(80, 13, 83, NULL, '', 'AN', 7, 1),
(81, 13, 84, NULL, '', 'AN', 7, 1),
(82, 13, 85, NULL, '', 'AN', 7, 1),
(83, 13, 86, NULL, '', 'AN', 7, 1),
(84, 13, 87, NULL, '', 'AN', 7, 1),
(85, 13, 88, NULL, '', 'AN', 7, 1),
(86, 14, 80, NULL, '', 'AN', 7, 1),
(87, 14, 82, NULL, '', 'AN', 7, 1),
(88, 14, 83, NULL, '', 'AN', 7, 1),
(89, 14, 84, NULL, '', 'AN', 7, 1),
(90, 14, 85, NULL, '', 'AN', 7, 1),
(91, 14, 86, NULL, '', 'AN', 7, 1),
(92, 14, 88, NULL, '', 'AN', 7, 1),
(93, 13, 89, NULL, '', 'AN', 7, 1),
(94, 14, 89, NULL, '', 'AN', 7, 1),
(95, 13, 90, NULL, '', 'AC', 7, 1),
(96, 14, 90, NULL, '', 'AC', 7, 1),
(97, 13, 91, NULL, '', 'AN', 7, 1),
(98, 14, 91, NULL, '', 'AN', 7, 1),
(99, 13, 82, NULL, '1R-1808', 'AN', 7, 1),
(100, 13, 93, NULL, '56958945', 'AC', 7, 1),
(101, 14, 93, NULL, '56958945', 'AC', 7, 1),
(102, 16, 83, NULL, '1R-0749', 'AC', 7, 1),
(103, 16, 82, NULL, '1R-1808', 'AC', 7, 1),
(104, 13, 94, NULL, '59860841', 'AN', 7, 1),
(105, 14, 94, NULL, '59860841', 'AN', 7, 1),
(106, 13, 96, NULL, '57516106', 'AC', 7, 1),
(107, 14, 96, NULL, '57516106', 'AC', 7, 1),
(108, 13, 96, NULL, '57516098', 'AC', 7, 1),
(109, 14, 96, NULL, '57516098', 'AC', 7, 1),
(110, 16, 80, NULL, '3222 1881 6', 'AN', 7, 1),
(111, 16, 84, NULL, '1604 6944 9', 'AC', 7, 1),
(112, 13, 97, NULL, '57569758', 'AC', 7, 1),
(113, 14, 97, NULL, '57569758', 'AC', 7, 1),
(114, 13, 98, NULL, '57336406', 'AC', 7, 1),
(115, 14, 98, NULL, '57336406', 'AC', 7, 1),
(116, 13, 99, NULL, '52263183', 'AC', 7, 1),
(117, 14, 99, NULL, '52263183', 'AC', 7, 1),
(118, 13, 100, NULL, '36860336', 'AC', 7, 1),
(119, 14, 100, NULL, '36860336', 'AC', 7, 1),
(120, 16, 88, NULL, '3222 1180 0', 'AC', 7, 1),
(121, 16, 88, NULL, '3222 3187 2', 'AC', 7, 1),
(122, 16, 94, NULL, '3222 9861 4', 'AN', 7, 1),
(123, 16, 85, NULL, '3222 3253 7', 'AC', 7, 1),
(124, 16, 97, NULL, '2911 0117 0', 'AN', 7, 1),
(125, 13, 88, NULL, '50903236', 'AC', 7, 1),
(126, 14, 88, NULL, '50903236', 'AC', 7, 1),
(127, 13, 101, NULL, '56985971', 'AC', 7, 1),
(128, 14, 101, NULL, '56985971', 'AN', 7, 1),
(129, 13, 102, NULL, '326-1643', 'AC', 7, 1),
(130, 14, 101, NULL, '326-1643', 'AN', 7, 1),
(131, 16, 98, NULL, '8231 1018 0', 'AC', 7, 1),
(132, 16, 98, NULL, '3222 3098 4', 'AC', 7, 1),
(133, 14, 102, NULL, '326-1643', 'AC', 7, 1),
(134, 13, 83, NULL, '57294829', 'AN', 7, 1),
(135, 14, 83, NULL, '57294829', 'AC', 7, 1),
(136, 13, 109, NULL, '52146966', 'AC', 7, 1),
(137, 14, 109, NULL, '52146966', 'AC', 7, 1),
(138, 13, 113, NULL, '52252061', 'AC', 7, 1),
(139, 14, 113, NULL, '52252061', 'AC', 7, 1),
(140, 13, 114, NULL, '1R-1808', 'AC', 7, 1),
(141, 14, 114, NULL, '1R-1808', 'AC', 7, 1),
(142, 13, 115, NULL, '57368524', 'AC', 7, 1),
(143, 14, 115, NULL, '57368524', 'AC', 7, 1),
(144, 13, 116, NULL, '57651234', 'AN', 7, 1),
(145, 14, 116, NULL, '57651234', 'AN', 7, 1),
(146, 13, 116, NULL, '57572398', 'AN', 7, 1),
(147, 14, 116, NULL, '57572398', 'AN', 7, 1),
(148, 13, 116, NULL, '57572406', 'AN', 7, 1),
(149, 14, 116, NULL, '57572406', 'AN', 7, 1),
(150, 13, 117, NULL, '95200663', 'AC', 7, 1),
(151, 14, 117, NULL, '95200663', 'AC', 7, 1),
(152, 13, 119, NULL, '57572398', 'AC', 7, 1),
(153, 14, 119, NULL, '57572398', 'AC', 7, 1),
(154, 13, 119, NULL, '57572406', 'AC', 7, 1),
(155, 13, 120, NULL, '50597442', 'AC', 7, 1),
(156, 14, 120, NULL, '50597442', 'AC', 7, 1),
(157, 13, 121, NULL, '9523475', 'AC', 7, 1),
(158, 14, 121, NULL, '9523475', 'AC', 7, 1),
(159, 13, 122, NULL, '50595115', 'AC', 7, 1),
(160, 14, 122, NULL, '50595115', 'AC', 7, 1),
(161, 13, 123, NULL, '50597640', 'AC', 7, 1),
(162, 14, 123, NULL, '50597640', 'AC', 7, 1),
(163, 13, 124, NULL, '50597434', 'AC', 7, 1),
(164, 14, 124, NULL, '50597434', 'AC', 7, 1),
(165, 13, 124, NULL, '59595629', 'AC', 7, 1),
(166, 14, 124, NULL, '59595629', 'AC', 7, 1),
(167, 13, 124, NULL, '50717743', 'AC', 7, 1),
(168, 14, 124, NULL, '50717743', 'AC', 7, 1),
(169, 13, 125, NULL, '50717750', 'AC', 7, 1),
(170, 14, 125, NULL, '50717750', 'AC', 7, 1),
(171, 14, 126, NULL, '57651234', 'AC', 7, 1),
(172, 14, 126, NULL, '57651234', 'AC', 7, 1),
(173, 16, 111, NULL, '3222 3324 7', 'AC', 7, 1),
(174, 13, 127, NULL, '57326274', 'AC', 7, 1),
(175, 14, 127, NULL, '57326274', 'AC', 7, 1),
(176, 16, 112, NULL, '3222 3162 4', 'AN', 7, 1),
(177, 16, 103, NULL, '3222 3195 3', 'AN', 7, 1),
(178, 16, 104, NULL, '3222 3232 0', 'AN', 7, 1),
(179, 14, 128, NULL, '56262579', 'AC', 7, 1),
(180, 14, 128, NULL, '56262579', 'AC', 7, 1),
(181, 14, 102, NULL, '52154515', 'AC', 7, 1),
(182, 14, 129, NULL, '52154515', 'AC', 7, 1),
(183, 13, 130, NULL, '57307902', 'AC', 7, 1),
(184, 13, 130, NULL, '57307902', 'AC', 7, 1),
(185, 14, 131, NULL, '57484263', 'AC', 7, 1),
(186, 14, 131, NULL, '57484263', 'AC', 7, 1),
(187, 14, 132, NULL, '57389983', 'AC', 7, 1),
(188, 14, 132, NULL, '57389983', 'AC', 7, 1),
(189, 14, 133, NULL, '57106429', 'AC', 7, 1),
(190, 14, 133, NULL, '57106429', 'AC', 7, 1),
(191, 14, 134, NULL, ' 52235207', 'AC', 7, 1),
(192, 14, 134, NULL, ' 52235207', 'AC', 7, 1),
(193, 14, 135, NULL, '57572984', 'AC', 7, 1),
(194, 14, 135, NULL, '57572984', 'AC', 7, 1),
(195, 14, 136, NULL, '57477242', 'AC', 7, 1),
(196, 14, 136, NULL, '57477242', 'AC', 7, 1),
(197, 13, 137, NULL, '57415044', 'AC', 7, 1),
(198, 13, 137, NULL, '', 'AC', 7, 1),
(199, 14, 137, NULL, '57415044', 'AC', 7, 1),
(200, 14, 138, NULL, '57209637', 'AC', 7, 1),
(201, 13, 138, NULL, '57209637', 'AC', 7, 1),
(202, 14, 139, NULL, '57632366', 'AN', 7, 1),
(203, 14, 139, NULL, '57632366', 'AN', 7, 1),
(204, 13, 139, NULL, '57632366', 'AC', 7, 1),
(205, 14, 139, NULL, '57632366', 'AC', 7, 1),
(206, 14, 140, NULL, '57506446', 'AN', 7, 1),
(207, 14, 140, NULL, '57506446', 'AN', 7, 1),
(208, 13, 140, NULL, '57506446', 'AC', 7, 1),
(209, 14, 140, NULL, '57506446', 'AC', 7, 1),
(210, 14, 141, NULL, '57501116', 'AN', 7, 1),
(211, 14, 141, NULL, '57501116', 'AN', 7, 1),
(212, 13, 141, NULL, '57501116', 'AC', 7, 1),
(213, 14, 141, NULL, '57501116', 'AC', 7, 1),
(214, 13, 142, NULL, '52228848', 'AC', 7, 1),
(215, 14, 142, NULL, '52228848', 'AC', 7, 1),
(216, 13, 143, NULL, '57407173', 'AC', 7, 1),
(217, 14, 143, NULL, '57407173', 'AC', 7, 1),
(218, 13, 144, NULL, '57371999', 'AC', 7, 1),
(219, 14, 144, NULL, '57371999', 'AC', 7, 1),
(220, 13, 145, NULL, '57008740', 'AC', 7, 1),
(221, 14, 145, NULL, '57008740', 'AC', 7, 1),
(222, 13, 146, NULL, '52192556', 'AC', 7, 1),
(223, 14, 146, NULL, '52192556', 'AC', 7, 1),
(224, 13, 147, NULL, '57400350', 'AC', 7, 1),
(225, 14, 147, NULL, '57400350', 'AC', 7, 1),
(226, 13, 148, NULL, '57389561', 'AC', 7, 1),
(227, 14, 148, NULL, '57389561', 'AC', 7, 1),
(228, 13, 149, NULL, '56248362', 'AC', 7, 1),
(229, 14, 149, NULL, '56248362', 'AC', 7, 1),
(230, 13, 150, NULL, '57541005', 'AC', 7, 1),
(231, 14, 150, NULL, '57541005', 'AC', 7, 1),
(232, 13, 150, NULL, '57569444', 'AC', 7, 1),
(233, 14, 151, NULL, '57569444', 'AC', 7, 1),
(234, 13, 151, NULL, '57372484', 'AC', 7, 1),
(235, 14, 152, NULL, '57372484', 'AC', 7, 1),
(236, 13, 153, NULL, '52106291', 'AC', 7, 1),
(237, 14, 153, NULL, '52106291', 'AC', 7, 1),
(238, 13, 154, NULL, '57814683', 'AC', 7, 1),
(239, 14, 154, NULL, '57814683', 'AC', 7, 1),
(240, 13, 155, NULL, '57745127', 'AC', 7, 1),
(241, 14, 155, NULL, '57745127', 'AC', 7, 1),
(242, 13, 156, NULL, 'Switch 2 po', 'AN', 7, 1),
(243, 14, 156, NULL, '57332215', 'AC', 7, 1),
(244, 13, 156, NULL, '57332215', 'AN', 7, 1),
(245, 13, 156, NULL, '57332215', 'AC', 7, 1),
(246, 13, 157, NULL, '57493868', 'AC', 7, 1),
(247, 14, 157, NULL, '57493868', 'AC', 7, 1),
(248, 13, 158, NULL, '52185832', 'AC', 7, 1),
(249, 14, 158, NULL, '52185832', 'AC', 7, 1),
(250, 13, 159, NULL, '57637704', 'AC', 7, 1),
(251, 14, 159, NULL, '57637704', 'AC', 7, 1),
(252, 13, 160, NULL, '57391047', 'AC', 7, 1),
(253, 14, 160, NULL, '57391047', 'AC', 7, 1),
(254, 13, 161, NULL, '50621986', 'AC', 7, 1),
(255, 14, 161, NULL, '50621986', 'AC', 7, 1),
(256, 13, 162, NULL, '57922445', 'AC', 7, 1),
(257, 14, 162, NULL, '57922445', 'AC', 7, 1),
(258, 13, 163, NULL, '57358145', 'AC', 7, 1),
(259, 14, 163, NULL, '57358145', 'AC', 7, 1),
(260, 13, 164, NULL, '35612712', 'AC', 7, 1),
(261, 14, 164, NULL, '35612712', 'AC', 7, 1),
(262, 13, 165, NULL, '36861144', 'AC', 7, 1),
(263, 14, 165, NULL, '36861144', 'AC', 7, 1),
(264, 13, 166, NULL, '57705048', 'AC', 7, 1),
(265, 14, 166, NULL, '57705048', 'AC', 7, 1),
(266, 13, 167, NULL, '30441570', 'AC', 7, 1),
(267, 14, 167, NULL, '30441570', 'AC', 7, 1),
(268, 13, 168, NULL, '57705063', 'AC', 7, 1),
(269, 14, 168, NULL, '57705063', 'AC', 7, 1),
(270, 13, 168, NULL, '51869907', 'AC', 7, 1),
(271, 14, 168, NULL, '51869907', 'AC', 7, 1),
(272, 13, 169, NULL, '57705055', 'AC', 7, 1),
(273, 14, 169, NULL, '57705055', 'AC', 7, 1),
(274, 16, 102, NULL, '326-1643', 'AC', 7, 1),
(275, 16, 171, NULL, '3222 1881 6', 'AN', 7, 1),
(276, 16, 171, NULL, '3222 1881 6', 'AN', 7, 1),
(277, 16, 171, NULL, '3222 1881 6', 'AC', 7, 1),
(278, 16, 172, NULL, '3222 1180 0', 'AN', 7, 1),
(279, 16, 172, NULL, '3222 1180 0', 'AN', 7, 1),
(280, 16, 172, NULL, '3222 1180 0', 'AN', 7, 1),
(281, 16, 172, NULL, '3222 1180 0', 'AN', 7, 1),
(282, 16, 172, NULL, '3222 118000', 'AC', 7, 1),
(283, 16, 172, NULL, '3222 318729', 'AC', 7, 1),
(284, 16, 96, NULL, '3222 986146', 'AC', 7, 1),
(285, 16, 89, NULL, '2911 011702', 'AC', 7, 1),
(286, 16, 98, NULL, '8231 101804', 'AC', 7, 1),
(287, 16, 98, NULL, '3222 309848', 'AC', 7, 1),
(288, 16, 103, NULL, '3222 319534', 'AN', 7, 1),
(289, 16, 104, NULL, '3222 323209', 'AC', 7, 1),
(290, 16, 137, NULL, '3222 311156', 'AC', 7, 1),
(291, 16, 173, NULL, '3222 330237', 'AN', 7, 1),
(292, 16, 173, NULL, '3222 330237', 'AN', 7, 1),
(293, 16, 173, NULL, '3128 307488', 'AN', 7, 1),
(294, 16, 174, NULL, '3128 307488', 'AC', 7, 1),
(295, 16, 175, NULL, '3177 308500', 'AC', 7, 1),
(296, 16, 111, NULL, '3222 331632', 'AC', 7, 1),
(297, 16, 112, NULL, '3222 323704', 'AN', 7, 1),
(298, 16, 111, NULL, '3222 332477', 'AC', 7, 1),
(299, 16, 112, NULL, '3222 316242', 'AC', 7, 1),
(300, 16, 176, NULL, '3222 331466', 'AC', 7, 1),
(301, 16, 177, NULL, '3222 328342', 'AC', 7, 1),
(302, 16, 178, NULL, '3216 755500', 'AC', 7, 1),
(303, 16, 179, NULL, '3222 3309 1', 'AN', 7, 1),
(304, 16, 179, NULL, '3222 330916', 'AC', 7, 1),
(305, 16, 180, NULL, '1604 610980', 'AC', 7, 1),
(306, 16, 181, NULL, '3222 989241', 'AC', 7, 1),
(307, 16, 181, NULL, '3222 989242', 'AC', 7, 1),
(308, 16, 182, NULL, '3222 986201', 'AN', 7, 1),
(309, 16, 182, NULL, '3222 986204', 'AN', 7, 1),
(310, 16, 153, NULL, '3222 986202', 'AC', 7, 1),
(311, 16, 153, NULL, '3222 986199', 'AC', 7, 1),
(312, 16, 182, NULL, '3214 873401', 'AN', 7, 1),
(313, 16, 183, NULL, '3214 873401', 'AC', 7, 1),
(314, 16, 184, NULL, '3222 324896', 'AC', 7, 1),
(315, 16, 184, NULL, '5541 902100', 'AC', 7, 1),
(316, 16, 150, NULL, '3222 989268', 'AC', 7, 1),
(317, 16, 185, NULL, '3222 148800', 'AC', 7, 1),
(318, 16, 186, NULL, '4350 266200', 'AC', 7, 1),
(319, 16, 187, NULL, '3222 317308', 'AC', 7, 1),
(320, 16, 188, NULL, '3222 323726', 'AC', 7, 1),
(321, 16, 189, NULL, '3176 000272', 'AC', 7, 1),
(322, 16, 190, NULL, '3176 000038', 'AC', 7, 1),
(323, 16, 191, NULL, '3222 330246', 'AC', 7, 1),
(324, 16, 192, NULL, '3176 001300', 'AC', 7, 1),
(325, 16, 193, NULL, '3222 329288', 'AC', 7, 1),
(326, 16, 194, NULL, '3222 329287', 'AC', 7, 1),
(327, 16, 195, NULL, '3176 000172', 'AC', 7, 1),
(328, 16, 196, NULL, '3222 316254', 'AC', 7, 1),
(329, 16, 197, NULL, '3222 329472', 'AC', 7, 1),
(330, 16, 198, NULL, '3222 327788', 'AC', 7, 1),
(331, 16, 199, NULL, '3222 320883', 'AC', 7, 1),
(332, 1, 68, NULL, '0303456', 'AC', 6, 1),
(333, 1, 200, NULL, '12345678992', 'AN', 6, 1),
(334, 1, 1, NULL, '12345678992', 'AN', 6, 1),
(335, 9, 1, NULL, '00000000666', 'AC', 6, 1),
(336, 18, 1, NULL, '12345678910', 'AN', 6, 1),
(337, 9, 211, NULL, '123456789', 'AC', 6, 1),
(338, 9, 3, NULL, 'cod 66', 'AN', 6, 1),
(339, 8, 17, NULL, 'motorair5''7', 'AC', 6, 1),
(340, 8, 18, NULL, 'soporteMotorair507', 'AC', 6, 1),
(341, 8, 38, NULL, 'filtroaceiteaor507', 'AC', 6, 1),
(342, 8, 65, NULL, '00112233', 'AC', 6, 1),
(343, 1, 1, NULL, '00001', 'AC', 6, 1),
(344, 5, 200, NULL, '000123', 'AN', 6, 1),
(345, 19, 12, NULL, 'carter-motor-1810', 'AC', 6, 1),
(346, 19, 1, NULL, 'motor-diesel-1810', 'AC', 6, 1),
(347, 19, 24, NULL, 'sensor-temp-1810', 'AC', 6, 1),
(348, 19, 73, NULL, '0011', 'AC', 6, 0),
(349, 9, 57, NULL, 'mt666-alarma-test', 'AN', 6, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE IF NOT EXISTS `componentes` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=217 ;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`id_componente`, `descripcion`, `id_equipo`, `fechahora`, `informacion`, `marcaid`, `pdf`, `estado`, `id_empresa`) VALUES
(1, 'MOTOR DIESEL', 1, '2018-07-03 10:55:57', '', 1, 'assets/filesequipos/1.pdf', 'AC', 6),
(2, 'VALVULA DE PURGA', 1, '2018-07-03 10:57:26', '', 1, 'assets/filesequipos/2.pdf', 'AC', 6),
(3, 'FILTRO DE COMBUSTIBLE ', 1, '2018-07-03 10:57:44', '', 1, 'assets/filesequipos/3.pdf', 'AC', 6),
(4, 'RESPIRADOR DE TANQUE', 1, '2018-07-03 10:57:56', '', 1, 'assets/filesequipos/4.pdf', 'AC', 6),
(5, 'RADIADOR', 1, '2018-07-03 10:58:04', '', 1, 'assets/filesequipos/5.pdf', 'AC', 6),
(6, 'CORREA DE DISTRIBUCION DEL MOTOR', 2, '2018-07-03 11:06:02', '', 7, 'assets/filesequipos/6.pdf', 'AC', 6),
(7, 'VALVULA MOTOR', 2, '2018-07-03 11:06:23', '', 7, 'assets/filesequipos/7.pdf', 'AC', 6),
(8, 'FRENOS', 2, '2018-07-03 11:06:28', '', 7, 'assets/filesequipos/8.pdf', 'AC', 6),
(9, 'CINTURON DE SEGURIDAD', 2, '2018-07-03 11:06:41', '', 7, 'assets/filesequipos/9.pdf', 'AC', 6),
(10, 'DEPOSITO LIMPIAPARABRISAS', 2, '2018-07-03 11:06:59', '', 7, 'assets/filesequipos/10.pdf', 'AC', 6),
(11, 'VALVULA DE ESCAPE', 3, '2018-07-03 11:18:54', '', 8, 'assets/filesequipos/11.pdf', 'AC', 6),
(12, 'CARTER DEL MOTOR', 3, '2018-07-03 11:19:06', '', 5, 'comp12.pdf', 'AC', 6),
(13, 'VALVULA DE ALIVIO', 3, '2018-07-03 11:19:19', '', 5, 'assets/filesequipos/13.pdf', 'AC', 6),
(14, 'REJILLA DE ACEITE DE DIRECCION ', 3, '2018-07-03 11:19:48', '', 5, 'assets/filesequipos/14.pdf', 'AC', 6),
(15, 'CILINDRO DE DIRECCIÓN', 3, '2018-07-03 11:20:00', '', 5, 'assets/filesequipos/15.pdf', 'AC', 6),
(16, 'LUCES', 4, '2018-07-03 11:27:31', '', 6, 'assets/filesequipos/16.pdf', 'AC', 6),
(17, 'MOTOR', 4, '2018-07-03 11:28:05', '', 6, 'assets/filesequipos/17.pdf', 'AC', 6),
(18, 'SOPORTE MOTOR', 4, '2018-07-03 11:28:40', '', 6, 'assets/filesequipos/18.pdf', 'AC', 6),
(19, 'CADENA', 4, '2018-07-03 11:28:50', '', 6, 'assets/filesequipos/19.pdf', 'AC', 6),
(20, 'NEUMATICOS', 4, '2018-07-03 11:28:59', '', 6, 'assets/filesequipos/20.pdf', 'AC', 6),
(21, 'MOTOR DIESEL', 5, '2018-07-03 11:37:13', '', 1, 'assets/filesequipos/21.pdf', 'AC', 6),
(22, 'CORREDERA', 5, '2018-07-03 11:37:40', '', 1, 'assets/filesequipos/22.pdf', 'AC', 6),
(23, 'BRAZO', 5, '2018-07-03 11:37:54', '003', 1, 'assets/filesequipos/23.pdf', 'AC', 6),
(24, 'SENSOR DE TEMPERATURA', 5, '2018-07-03 11:39:00', '', 1, 'assets/filesequipos/24.pdf', 'AC', 6),
(25, 'BATERIA', 5, '2018-07-03 11:39:11', '', 1, 'assets/filesequipos/25.pdf', 'AC', 6),
(26, 'CORREDERA', 1, '2018-07-03 16:08:09', '', 1, 'assets/filesequipos/26.pdf', 'AC', 6),
(27, 'BRAZO', 1, '2018-07-03 16:50:47', '', 1, 'assets/filesequipos/27.pdf', 'AC', 6),
(28, 'MARTILLO', 1, '2018-07-03 21:50:00', '', 1, 'assets/filesequipos/28.pdf', 'AC', 6),
(29, 'BASTIDOR', 1, '2018-07-03 22:14:02', '', 1, 'assets/filesequipos/29.pdf', 'AC', 6),
(30, 'BATERIA ', 1, '2018-07-03 22:20:52', '', 1, 'assets/filesequipos/30.pdf', 'AN', 6),
(31, 'CUCHARON', 2, '2018-07-04 09:28:53', '', 7, 'assets/filesequipos/31.pdf', 'AC', 6),
(32, 'TRANSMISION ', 2, '2018-07-04 09:55:19', '', 7, 'assets/filesequipos/32.pdf', 'AC', 6),
(33, 'TANQUE HIDRAULICO ', 2, '2018-07-04 10:09:52', '', 7, 'assets/filesequipos/33.pdf', 'AC', 6),
(34, 'COLUMNA DE DIRECCION', 2, '2018-07-04 10:21:36', '', 7, 'assets/filesequipos/34.pdf', 'AC', 6),
(35, 'BATERIA', 2, '2018-07-04 10:32:04', '', 7, 'assets/filesequipos/35.pdf', 'AC', 6),
(36, 'COJINETE', 2, '2018-07-04 10:32:23', '', 7, 'assets/filesequipos/36.pdf', 'AC', 6),
(37, 'CARROCERIA', 2, '2018-07-04 10:32:54', '', 7, 'assets/filesequipos/37.pdf', 'AC', 6),
(38, 'FILTRO DE ACEITE MOTOR', 2, '2018-07-04 10:33:14', '', 7, 'assets/filesequipos/38.pdf', 'AC', 6),
(39, 'MOTOR', 2, '2018-07-04 10:33:25', '', 7, 'assets/filesequipos/39.pdf', 'AC', 6),
(40, 'TANQUE DE COMBUSTIBLE', 2, '2018-07-04 10:41:43', '', 7, 'assets/filesequipos/40.pdf', 'AC', 6),
(41, 'CORREA DE DISTRIBUCIÓN DEL MOTOR', 2, '2018-07-04 10:42:02', '', 7, 'assets/filesequipos/41.pdf', 'AC', 6),
(42, 'FILTRO DE AIRE PRIMARIO DEL MOTOR', 2, '2018-07-04 10:42:26', '', 7, 'assets/filesequipos/42.pdf', 'AC', 6),
(43, 'FILTRO DE AIRE SECUNDARIO DEL MOTOR', 2, '2018-07-04 10:42:47', '', 7, 'assets/filesequipos/43.pdf', 'AC', 6),
(44, 'FILTRO DE COMBUSTIBLE PRIMARIO DEL MOTOR', 2, '2018-07-04 10:43:13', '', 7, 'assets/filesequipos/44.pdf', 'AC', 6),
(45, 'VÁLVULAS DE ADMISIÓN', 3, '2018-07-04 11:40:18', '', 5, 'assets/filesequipos/45.pdf', 'AC', 6),
(46, 'VÁLVULAS DE ADMISIÓN', 3, '2018-07-04 11:47:26', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/46.pdf', 'AC', 6),
(47, 'FILTRO DE ACEITE DE TRANSMISIÓN', 3, '2018-07-04 11:48:49', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/47.pdf', 'AC', 6),
(48, 'RESPIRADERO DE LA CAJA DE TRANSMISIÓN', 3, '2018-07-04 11:49:05', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/48.pdf', 'AC', 6),
(49, 'EJE DELANTERO', 3, '2018-07-04 11:49:21', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/49.pdf', 'AC', 6),
(50, 'EJE TRASERO', 3, '2018-07-04 11:49:40', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/50.pdf', 'AC', 6),
(51, 'DIFERENCIAL', 3, '2018-07-04 11:49:53', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/51.pdf', 'AC', 6),
(52, 'FILTRO DE ACONDICIONADOR DE AIRE DE CABINA', 3, '2018-07-04 11:50:08', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/52.pdf', 'AC', 6),
(53, 'TANQUE HIDRÁULICO ', 3, '2018-07-04 11:50:25', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/53.pdf', 'AC', 6),
(54, 'NEUMÁTICOS', 3, '2018-07-04 11:50:47', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/54.pdf', 'AC', 6),
(55, 'MANDO FINAL', 3, '2018-07-04 11:50:59', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/55.pdf', 'AC', 6),
(56, 'CHASIS', 3, '2018-07-04 11:51:12', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/56.pdf', 'AC', 6),
(57, 'ALARMA DE RETROCESO', 3, '2018-07-04 11:51:27', 'CAJA DE TRANSMISIÓN', 5, 'assets/filesequipos/57.pdf', 'AC', 6),
(58, 'JAULA ANTIVUELCO', 3, '2018-07-04 11:51:41', '', 5, 'assets/filesequipos/58.pdf', 'AC', 6),
(59, 'CAJA DE TRANSMISION', 3, '2018-07-04 12:45:47', '', 5, 'assets/filesequipos/59.pdf', 'AC', 6),
(60, 'FILTRO DE ACEITE MOTOR', 4, '2018-07-05 11:35:02', '', 6, 'assets/filesequipos/60.pdf', 'AC', 0),
(61, 'CORREA DE DISTRIBUCIÓN DEL MOTOR', 4, '2018-07-05 11:35:29', '', 6, 'assets/filesequipos/61.pdf', 'AC', 6),
(62, 'FILTRO DE AIRE  DEL MOTOR', 4, '2018-07-05 11:35:59', '', 6, 'assets/filesequipos/62.pdf', 'AC', 6),
(63, 'FILTRO DE COMBUSTIBLE  DEL MOTOR', 4, '2018-07-05 11:36:18', '', 6, 'assets/filesequipos/63.pdf', 'AC', 6),
(64, 'RADIADOR DE MOTOR', 4, '2018-07-05 11:36:36', '', 6, 'assets/filesequipos/64.pdf', 'AC', 6),
(65, 'FRENOS', 4, '2018-07-05 11:36:55', '', 6, 'assets/filesequipos/65.pdf', 'AC', 6),
(66, 'FILTRO DE AIRE CABINA', 4, '2018-07-05 11:37:10', '', 6, 'assets/filesequipos/66.pdf', 'AC', 6),
(67, 'BATERÍA', 4, '2018-07-05 11:37:26', '012332', 6, 'assets/filesequipos/67.pdf', 'AC', 6),
(68, 'BOCINA', 4, '2018-07-05 11:37:41', '', 6, 'assets/filesequipos/68.pdf', 'AC', 6),
(69, 'ARTICULACIONES DE LA TORRE ', 4, '2018-07-05 11:38:01', '', 6, 'assets/filesequipos/69.pdf', 'AC', 6),
(70, 'CONVERTIDOR', 4, '2018-07-05 11:38:20', '', 6, 'assets/filesequipos/70.pdf', 'AC', 6),
(71, 'MANGUERAS', 4, '2018-07-05 11:38:40', '', 6, 'assets/filesequipos/71.pdf', 'AC', 6),
(72, 'AUTOELEVADOR TOYOTA', 4, '2018-07-05 11:39:01', '', 6, 'assets/filesequipos/72.pdf', 'AC', 6),
(73, 'CHASIS', 4, '2018-07-05 11:39:17', '', 6, 'assets/filesequipos/73.pdf', 'AC', 6),
(74, 'Motor Disel', 11, '2018-09-16 23:46:30', '-', 1, 'assets/filesequipos/74.pdf', 'AC', 7),
(75, 'Motor Diesel C32', 12, '2018-09-18 09:57:46', '', 5, 'assets/filesequipos/75.pdf', 'AC', 6),
(76, 'Motor Diesel C18', 13, '2018-09-18 10:05:16', '', 4, 'assets/filesequipos/76.pdf', 'AC', 7),
(77, 'Cabezal', 13, '2018-09-22 09:27:50', 'Cabezal de rotacion', 11, 'assets/filesequipos/77.pdf', 'AC', 7),
(78, 'Cabezal', 13, '2018-09-22 09:29:02', 'Cabezal de rotacion', 11, 'assets/filesequipos/78.pdf', 'AC', 7),
(79, 'compresor', 13, '2018-09-22 09:42:25', 'compresor  de aire de barrido 1070 HR2.5', 11, 'assets/filesequipos/79.pdf', 'AC', 7),
(80, 'Filtros de aire ', 13, '2018-09-22 10:25:39', 'Aire primario  52252061', 12, 'assets/filesequipos/80.pdf', 'AC', 7),
(81, 'Filtros de aire ', 13, '2018-09-22 10:28:32', 'Filtors primarios: 52252061\nFiltros de seguridad: 52146966', 11, 'assets/filesequipos/81.pdf', 'AC', 7),
(82, 'Filtro de aceite de motor ', 13, '2018-09-22 10:39:41', '', 11, 'assets/filesequipos/82.pdf', 'AC', 7),
(83, 'Filtros de combustible ', 13, '2018-09-22 11:03:20', '57294829 filtro secundario \n57886301 filtro primario ', 12, 'assets/filesequipos/83.pdf', 'AC', 7),
(84, 'Filtros de aceite de compresor ', 13, '2018-09-22 11:06:53', '', 12, 'assets/filesequipos/84.pdf', 'AC', 7),
(85, 'Filtro interior de cabina ', 13, '2018-09-22 11:10:20', '', 12, 'assets/filesequipos/85.pdf', 'AC', 7),
(86, 'Filtro respiradero de tanque de combustible ', 13, '2018-09-22 11:12:50', '', 12, 'assets/filesequipos/86.pdf', 'AC', 7),
(87, 'Filtro respiradero tanque de combustible ', 13, '2018-09-22 11:15:43', '', 12, 'assets/filesequipos/87.pdf', 'AC', 7),
(88, 'Filtro respiradero de tanque hidráulico ', 13, '2018-09-22 11:17:54', '', 12, 'assets/filesequipos/88.pdf', 'AC', 7),
(89, 'Filtro separador ', 13, '2018-09-22 11:28:47', '57569758 ', 11, 'assets/filesequipos/89.pdf', 'AC', 7),
(90, 'Regulador UL-88', 13, '2018-09-22 11:35:43', '', 11, 'assets/filesequipos/90.pdf', 'AC', 7),
(91, 'Kit de reparacion UL-88', 13, '2018-09-22 11:41:33', '36037471 KIT DE REPARACIÓN ', 11, 'assets/filesequipos/91.pdf', 'AC', 7),
(92, 'FILTRO DE ACEITE MOTOR - CAT', 16, '2018-09-22 12:01:39', '', 11, 'assets/filesequipos/92.pdf', 'AC', 7),
(93, 'Filtros colector de polvo ', 13, '2018-09-22 12:02:01', '', 11, 'assets/filesequipos/93.pdf', 'AC', 7),
(94, 'Filtro de cabina exterior ', 13, '2018-09-22 12:06:45', 'Items 11. ', 11, 'assets/filesequipos/94.pdf', 'AC', 7),
(95, 'Filtro de Combustible Primario', 16, '2018-09-22 12:07:54', 'Trampa de agua', 11, 'assets/filesequipos/95.pdf', 'AC', 7),
(96, 'Filtro de cabina ', 13, '2018-09-22 12:10:10', '', 11, 'assets/filesequipos/96.pdf', 'AC', 7),
(97, 'Filtro separador de compresor', 13, '2018-09-22 12:16:13', '', 11, 'assets/filesequipos/97.pdf', 'AC', 7),
(98, 'Filtro hidraulico ', 13, '2018-09-22 12:34:52', '', 11, 'assets/filesequipos/98.pdf', 'AC', 7),
(99, 'Filtros de retorno hidraulico', 13, '2018-09-22 12:38:31', '', 11, 'assets/filesequipos/99.pdf', 'AC', 7),
(100, 'Filtro de compresor alta presion ', 13, '2018-09-22 12:42:31', '', 12, 'assets/filesequipos/100.pdf', 'AC', 7),
(101, 'Filtro de refrigerante ', 13, '2018-09-22 13:11:58', 'sin adjunto', 12, 'assets/filesequipos/101.pdf', 'AC', 7),
(102, 'Separador de combustible CAT', 13, '2018-09-22 13:15:40', 'sin adjunto ', 11, 'assets/filesequipos/102.pdf', 'AC', 7),
(103, 'Bomba Principal', 16, '2018-09-22 13:24:30', 'Caudal Variable', 11, 'assets/filesequipos/103.pdf', 'AC', 7),
(104, 'Bomba Secundaria', 16, '2018-09-22 13:25:46', 'Bomba Engranaje', 11, 'assets/filesequipos/104.pdf', 'AC', 7),
(105, 'Motor Hidraulico de Traslacion', 16, '2018-09-22 13:27:09', 'Motor variable', 11, 'assets/filesequipos/105.pdf', 'AC', 7),
(106, 'Acople de goma', 16, '2018-09-22 13:28:03', '', 12, 'assets/filesequipos/106.pdf', 'AC', 7),
(107, 'Guia de teflon cabezal', 16, '2018-09-22 13:29:01', '', 12, 'assets/filesequipos/107.pdf', 'AC', 7),
(108, 'Cilindro Hidraulico', 16, '2018-09-22 13:30:00', '', 12, 'assets/filesequipos/108.pdf', 'AC', 7),
(109, 'Filtro de aire secundario ', 13, '2018-09-22 13:30:06', '', 11, 'assets/filesequipos/109.pdf', 'AC', 7),
(110, 'Motor HyD de colector de polvo', 16, '2018-09-22 13:32:31', '', 11, 'assets/filesequipos/110.pdf', 'AC', 7),
(111, 'Cable de Avance', 16, '2018-09-22 13:33:37', '', 12, 'assets/filesequipos/111.pdf', 'AC', 7),
(112, 'Cable de carro', 16, '2018-09-22 13:34:30', '', 12, 'assets/filesequipos/112.pdf', 'AC', 7),
(113, 'Filtro de aire primario Cat', 13, '2018-09-22 13:36:15', '', 11, 'assets/filesequipos/113.pdf', 'AC', 7),
(114, 'Filtro de aceite ', 13, '2018-09-22 13:38:38', '', 4, 'assets/filesequipos/114.pdf', 'AC', 7),
(115, 'Cardan', 13, '2018-09-22 16:12:22', '', 12, 'assets/filesequipos/115.pdf', 'AC', 7),
(116, 'Kit para reparacion de PTO', 13, '2018-09-22 16:44:59', 'BEARING \n', 11, 'assets/filesequipos/116.pdf', 'AC', 7),
(117, 'Bearing', 13, '2018-09-22 17:07:18', 'item 10', 11, 'assets/filesequipos/117.pdf', 'AC', 7),
(118, 'GEAR ', 13, '2018-09-22 17:14:44', 'ITEMS 9 ', 11, 'assets/filesequipos/118.pdf', 'AC', 7),
(119, 'Gear ', 13, '2018-09-22 17:15:16', 'ITEMS 9 ', 11, 'assets/filesequipos/119.pdf', 'AC', 7),
(120, 'Ring snap', 13, '2018-09-22 17:20:11', 'items 17 para reparción de pto', 11, 'assets/filesequipos/120.pdf', 'AC', 7),
(121, 'Ring retaining', 14, '2018-09-22 17:23:07', 'items 18 ', 11, 'assets/filesequipos/121.pdf', 'AC', 7),
(122, 'Shaft, imput ', 13, '2018-09-22 17:29:04', 'items 7 para reparacion de pto ', 12, 'assets/filesequipos/122.pdf', 'AC', 7),
(123, 'Adapter ', 13, '2018-09-22 17:33:08', 'items 6 para reparacion de pto', 11, 'assets/filesequipos/123.pdf', 'AC', 7),
(124, 'O´ring ', 13, '2018-09-22 17:44:17', 'items 12 para reparacion de pto ', 11, 'assets/filesequipos/124.pdf', 'AC', 7),
(125, 'Seal Oil ', 13, '2018-09-22 17:50:43', 'items 16 para reparación de pto ', 11, 'assets/filesequipos/125.pdf', 'AC', 7),
(126, 'PTO grupo completo ', 13, '2018-09-22 17:52:41', 'PTO Completa ', 11, 'assets/filesequipos/126.pdf', 'AC', 7),
(127, 'Bomba Principal ', 13, '2018-09-22 18:03:14', 'Bomba principal Completa ', 11, 'assets/filesequipos/127.pdf', 'AC', 7),
(128, 'Bomba doble', 13, '2018-09-22 18:15:36', 'Sin adjunto, Bomba doble ', 11, 'assets/filesequipos/128.pdf', 'AC', 7),
(129, 'Sello espejo eje de bomba principal ', 13, '2018-09-22 18:21:15', 'Sello espejo. sin adjunto ', 11, 'assets/filesequipos/129.pdf', 'AC', 7),
(130, 'Sello de  eje bomba principal ', 13, '2018-09-22 18:26:08', 'items 5 ', 11, 'assets/filesequipos/130.pdf', 'AC', 7),
(131, 'Cilindro Hidráulico de pull down ', 13, '2018-09-22 18:34:12', 'Cilindro Hidráulico ', 11, 'assets/filesequipos/131.pdf', 'AC', 7),
(132, 'Cilindro hidráulico capota de polvo ', 13, '2018-09-22 18:46:59', '', 12, 'assets/filesequipos/132.pdf', 'AC', 7),
(133, 'Valvula Diverter ', 13, '2018-09-22 18:54:40', 'sin adjunto ', 12, 'assets/filesequipos/133.pdf', 'AC', 7),
(134, 'Motor Hidráulico bomba de agua ', 13, '2018-09-22 19:12:15', '', 11, 'assets/filesequipos/134.pdf', 'AC', 7),
(135, 'Motor HCO Carrucel ', 13, '2018-09-25 11:24:34', 'Item 36 ', 11, 'assets/filesequipos/135.pdf', 'AC', 7),
(136, 'Motor HCO Fan Radiador ', 13, '2018-09-25 11:39:41', 'Item 36 ', 11, 'assets/filesequipos/136.pdf', 'AC', 7),
(137, 'Motor HCO Traslación ', 13, '2018-09-25 11:57:56', '', 12, 'assets/filesequipos/137.pdf', 'AC', 7),
(138, 'Motor HCO Rotación ', 13, '2018-09-25 12:02:03', 'Item 28 ', 12, 'assets/filesequipos/138.pdf', 'AC', 7),
(139, 'Motor HCO Cable Winch ', 13, '2018-09-25 12:06:09', 'Item 49 ', 12, 'assets/filesequipos/139.pdf', 'AC', 7),
(140, 'Cables de Pull Down ', 13, '2018-09-25 12:21:13', '', 12, 'assets/filesequipos/140.pdf', 'AC', 7),
(141, 'Cadenas De Holback ', 13, '2018-09-25 12:26:54', 'Items 26 ', 12, 'assets/filesequipos/141.pdf', 'AC', 7),
(142, 'Poleas de Cable de Pull Down  ', 13, '2018-09-25 12:33:08', 'Item 5 ', 11, 'assets/filesequipos/142.pdf', 'AC', 7),
(143, 'Sprocket deHoldback', 13, '2018-09-25 12:37:08', 'Items 27 ', 12, 'assets/filesequipos/143.pdf', 'AC', 7),
(144, 'Placa Porta Barras ', 13, '2018-09-25 12:43:36', 'Items 6 ', 12, 'assets/filesequipos/144.pdf', 'AC', 7),
(145, 'Guia de Barras ', 13, '2018-09-25 12:50:59', 'Items 2 ', 11, 'assets/filesequipos/145.pdf', 'AC', 7),
(146, 'Limit Switch ', 13, '2018-09-25 12:55:23', 'Items 1 ', 11, 'assets/filesequipos/146.pdf', 'AC', 7),
(147, 'Joystick Traslacion ', 13, '2018-09-25 13:00:50', 'Items 26 ', 12, 'assets/filesequipos/147.pdf', 'AC', 7),
(148, 'Joystick Rotación ', 13, '2018-09-25 13:04:52', 'Item 25 ', 12, 'assets/filesequipos/148.pdf', 'AC', 7),
(149, 'Joystick de Avance ', 13, '2018-09-25 13:13:52', 'Item 66 ', 12, 'assets/filesequipos/149.pdf', 'AC', 7),
(150, 'Burlete de Puerta Cabina ', 13, '2018-09-25 13:18:37', '', 12, 'assets/filesequipos/150.pdf', 'AC', 7),
(151, 'Butaca de Operador ', 13, '2018-09-25 13:23:45', 'Items 103 ', 12, 'assets/filesequipos/151.pdf', 'AC', 7),
(152, 'Bocina', 13, '2018-09-25 13:27:33', 'Items 1', 12, 'assets/filesequipos/152.pdf', 'AC', 7),
(153, 'Motor Limpia Parabrisas ', 13, '2018-09-25 13:32:50', 'Items 147 ', 11, 'assets/filesequipos/153.pdf', 'AC', 7),
(154, 'Escobillas 20'''' ', 13, '2018-09-25 13:37:16', 'items 152 ', 12, 'assets/filesequipos/154.pdf', 'AC', 7),
(155, 'Escobillas 28'''' ', 13, '2018-09-25 13:40:26', 'Items 153 ', 12, 'assets/filesequipos/155.pdf', 'AC', 7),
(156, 'Switch 2 Posiciones DR/PR ', 13, '2018-09-25 13:47:57', 'Items 27 ', 12, 'assets/filesequipos/156.pdf', 'AC', 7),
(157, 'Acelerador de Motor ', 13, '2018-09-25 16:39:00', 'Items 06 ', 12, 'assets/filesequipos/157.pdf', 'AC', 7),
(158, 'Botón Pulsador (Arranque) ', 13, '2018-09-25 16:42:58', 'Items 15 ', 12, 'assets/filesequipos/158.pdf', 'AC', 7),
(159, 'Compresor Completo ', 13, '2018-09-25 16:45:45', '', 11, 'assets/filesequipos/159.pdf', 'AC', 7),
(160, 'Valvula de Mínima ', 13, '2018-09-25 16:51:08', 'Items 6', 12, 'assets/filesequipos/160.pdf', 'AC', 7),
(161, 'Válvula de Alivio de Seguridad Tanque ', 13, '2018-09-25 16:56:41', 'Items 31 ', 11, 'assets/filesequipos/161.pdf', 'AC', 7),
(162, 'Mangon ', 13, '2018-09-25 17:00:14', 'Items 3', 12, 'assets/filesequipos/162.pdf', 'AC', 7),
(163, 'Cable de Seguridad ', 13, '2018-09-25 17:05:19', 'Items 8 ', 12, 'assets/filesequipos/163.pdf', 'AC', 7),
(164, 'Mangon de Descarga ', 13, '2018-09-25 17:08:44', 'Items 8 ', 11, 'assets/filesequipos/164.pdf', 'AC', 7),
(165, 'Bomba de Lubrican Compresor ', 13, '2018-09-25 17:13:01', 'Items 2 ', 11, 'assets/filesequipos/165.pdf', 'AC', 7),
(166, 'Cable Positivo ', 13, '2018-09-25 17:18:04', 'Items 3 ', 11, 'assets/filesequipos/166.pdf', 'AC', 7),
(167, 'Cable de Batería ', 13, '2018-09-25 17:21:50', 'Items 2 ', 11, 'assets/filesequipos/167.pdf', 'AC', 7),
(168, 'Cable negativo  ', 13, '2018-09-25 17:25:04', 'Items 05 ', 12, 'assets/filesequipos/168.pdf', 'AC', 7),
(169, 'Cable Switch Arranque ', 13, '2018-09-25 17:32:06', 'Items 11 ', 12, 'assets/filesequipos/169.pdf', 'AC', 7),
(170, 'kit Filtros de Aire Primarios ', 16, '2018-09-25 17:48:33', 'Items 2 ', 11, 'assets/filesequipos/170.pdf', 'AC', 7),
(171, 'kit Filtros de Aire Primarios ', 16, '2018-09-25 17:49:11', 'Items 2 ', 11, 'assets/filesequipos/171.pdf', 'AC', 7),
(172, 'Filtro Respiradero ', 16, '2018-09-25 17:56:58', 'sin adjunto ', 12, 'assets/filesequipos/172.pdf', 'AC', 7),
(173, 'Acople de Goma Bombas ', 16, '2018-09-25 19:31:27', 'Items 1 ', 11, 'assets/filesequipos/173.pdf', 'AC', 7),
(174, 'Guias de Teflon Cabezal ', 16, '2018-09-25 19:40:06', 'Items 2 ', 12, 'assets/filesequipos/174.pdf', 'AC', 7),
(175, 'Motor HCO Colector de Polvo ', 16, '2018-09-25 19:58:28', '', 12, 'assets/filesequipos/175.pdf', 'AC', 7),
(176, 'Bomba de Agua Dynaset ', 16, '2018-09-25 20:14:30', '', 12, 'assets/filesequipos/176.pdf', 'AC', 7),
(177, 'Bulon de Zapata ', 16, '2018-09-25 20:17:23', 'items 13', 12, 'assets/filesequipos/177.pdf', 'AC', 7),
(178, 'Tuerca de Zapata', 16, '2018-09-25 20:19:03', 'Items 14 ', 12, 'assets/filesequipos/178.pdf', 'AC', 7),
(179, 'Acople de Goma Copresor ', 16, '2018-09-25 20:22:44', 'Items 1 ', 12, 'assets/filesequipos/179.pdf', 'AC', 7),
(180, 'Válvula Control de Presión de Aire ', 16, '2018-09-25 20:31:58', 'Oil Stop: kit de reparacion:2911 0118 00', 11, 'assets/filesequipos/180.pdf', 'AC', 7),
(181, 'Luces de Trabajo ', 16, '2018-09-25 20:35:23', 'Items 30', 11, 'assets/filesequipos/181.pdf', 'AC', 7),
(182, 'Escobillas ', 16, '2018-09-25 20:45:15', '', 12, 'assets/filesequipos/182.pdf', 'AC', 7),
(183, 'Espejo', 16, '2018-09-25 21:28:01', '', 12, 'assets/filesequipos/183.pdf', 'AC', 7),
(184, 'Forzador F.C', 16, '2018-09-25 21:31:40', 'Items 3 ', 11, 'assets/filesequipos/184.pdf', 'AC', 7),
(185, 'Sensor Indutivo  ', 16, '2018-09-25 21:35:40', 'B118, B178', 11, 'assets/filesequipos/185.pdf', 'AC', 7),
(186, 'Cabezal SH', 16, '2018-09-25 21:37:32', 'Sin adjunto', 12, 'assets/filesequipos/186.pdf', 'AC', 7),
(187, 'Bomba de Lubricacion  ', 16, '2018-09-25 21:40:35', '', 12, 'assets/filesequipos/187.pdf', 'AC', 7),
(188, 'Bomba de Grasa de Barras ', 16, '2018-09-25 21:42:18', '', 11, 'assets/filesequipos/188.pdf', 'AC', 7),
(189, 'Rele K11 ', 16, '2018-09-25 21:44:48', '', 12, 'assets/filesequipos/189.pdf', 'AC', 7),
(190, 'Relee K5 ', 16, '2018-09-25 21:46:06', '', 11, 'assets/filesequipos/190.pdf', 'AC', 7),
(191, 'Sensores B336A-B336B-B147', 16, '2018-09-25 21:49:40', '', 11, 'assets/filesequipos/191.pdf', 'AC', 7),
(192, 'Sensor B360', 16, '2018-09-25 21:55:43', '', 12, 'assets/filesequipos/192.pdf', 'AC', 7),
(193, 'Sensor B336', 16, '2018-09-25 21:57:28', '', 11, 'assets/filesequipos/193.pdf', 'AC', 7),
(194, 'Sensor B337', 16, '2018-09-25 21:58:42', '', 12, 'assets/filesequipos/194.pdf', 'AC', 7),
(195, 'Sensor B134 ', 16, '2018-09-25 22:03:34', '', 12, 'assets/filesequipos/195.pdf', 'AC', 7),
(196, 'Sensor B262', 16, '2018-09-25 22:05:49', '', 12, 'assets/filesequipos/196.pdf', 'AC', 7),
(197, 'Sensor B361', 16, '2018-09-25 22:07:11', '', 12, 'assets/filesequipos/197.pdf', 'AC', 7),
(198, 'Sensor B143 ', 16, '2018-09-25 22:09:29', '', 12, 'assets/filesequipos/198.pdf', 'AC', 7),
(199, 'Valvulas Y115 e Y116', 16, '2018-09-25 22:13:04', '', 12, 'assets/filesequipos/199.pdf', 'AC', 7),
(200, '7777', 10, '2018-09-25 23:48:46', '', 9, 'assets/filesequipos/200.pdf', 'AC', 6),
(201, 'xcvxv', -1, '2018-10-08 09:54:50', 'xcvxvxcvx', 3, '', 'AN', 6),
(202, 'hjkljkljklk', -1, '2018-10-08 10:00:31', '', 2, '', 'AN', 6),
(203, 'hjkljkljklk', -1, '2018-10-08 10:00:54', '', 7, '', 'AC', 6),
(204, 'asdf', -1, '2018-10-08 10:02:31', 'asdfsadsadadsad', 11, '', 'AN', 6),
(205, 'sss', -1, '2018-10-08 10:03:57', 'sss', 13, '', 'AC', 6),
(206, 'koo', -1, '2018-10-08 10:04:54', '', 5, '', 'AC', 6),
(207, 'kk', -1, '2018-10-08 10:06:30', 'kk', 7, '', 'AC', 6),
(208, 'dede', -1, '2018-10-08 10:07:43', 'dede', 10, '', 'AC', 6),
(209, 'bebe', -1, '2018-10-08 10:08:30', 'bebe', 3, '', 'AN', 6),
(210, 'hilux', -1, '2018-10-08 10:12:37', '', 6, '', 'AC', 6),
(211, 'eli test', -1, '2018-10-09 11:37:06', 'probando hoy', 3, '', 'AN', 6),
(212, 'test', -1, '2018-10-09 13:03:24', 'test', 3, 'comp212.pdf', 'AN', 6),
(213, 'testing', -1, '2018-10-09 17:05:34', 'probando', 8, 'comp213.pdf', 'AC', 6),
(214, 'testing', -1, '2018-10-09 17:05:46', 'probando', 8, 'comp214.pdf', 'AC', 6),
(215, 'testing', -1, '2018-10-09 17:05:47', 'probando', 8, 'comp215.pdf', 'AC', 6),
(216, 'eli', -1, '2018-10-12 10:37:47', 'eli', 6, 'comp216.pdf', 'AN', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conffamily`
--

CREATE TABLE IF NOT EXISTS `conffamily` (
  `famId` int(11) NOT NULL AUTO_INCREMENT,
  `famName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`famId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=37 ;

--
-- Volcado de datos para la tabla `conffamily`
--

INSERT INTO `conffamily` (`famId`, `famName`, `estado`, `id_empresa`) VALUES
(1, 'Bulones', 'AC', 6),
(2, 'Bujes', 'AC', 6),
(3, 'Filtros', 'AC', 6),
(4, 'Diafragmas', 'AC', 6),
(5, 'Ejes', 'AC', 6),
(6, 'Valvulas', 'AC', 6),
(7, 'Sellos', 'AC', 6),
(8, 'Retenes', 'AC', 6),
(9, 'Tuercas', 'AC', 6),
(10, 'Trampas de Agua', 'AC', 6),
(11, 'Arandelas', 'AC', 6),
(12, 'Guias', 'AC', 6),
(13, 'Pernos', 'AC', 6),
(14, 'Cojinetes', 'AC', 6),
(15, 'Juntas', 'AC', 6),
(16, 'Cables', 'AC', 6),
(17, 'Termostatos', 'AC', 6),
(19, 'Compresores', 'AC', 6),
(20, 'Corta Corriente', 'AC', 6),
(21, 'Correas', 'AC', 6),
(22, 'Cubiertas', 'AC', 6),
(23, 'Radiadores', 'AC', 6),
(24, 'Motor', 'AC', 6),
(25, 'Crucetas', 'AC', 6),
(26, 'Espejos', 'AC', 6),
(28, 'Pasador', 'AC', 0),
(29, 'Platos', 'AC', 0),
(30, 'Seguros', 'AC', 0),
(31, 'Tapas', 'AC', 0),
(32, 'Alternadores', 'AC', 0),
(33, 'Faros', 'AC', 0),
(34, 'Bombines', 'AC', 0),
(35, 'Llantas', 'AC', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confsubfamily`
--

CREATE TABLE IF NOT EXISTS `confsubfamily` (
  `sfamId` int(11) NOT NULL AUTO_INCREMENT,
  `sfamName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `famId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sfamId`),
  KEY `famId` (`famId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `confsubfamily`
--

INSERT INTO `confsubfamily` (`sfamId`, `sfamName`, `famId`) VALUES
(8, 'Cocina', 5),
(9, 'Heladera', 5),
(10, 'Microondas', 5),
(11, 'Futón', 6),
(12, 'Alacena', 6),
(13, 'Sillas', 6),
(14, 'Taladro', 7),
(15, 'Amoladora', 7),
(16, 'LLaves', 7),
(17, 'Afeitadora', 8),
(18, 'Secador de Cabello', 8),
(19, 'Masajeador', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confzone`
--

CREATE TABLE IF NOT EXISTS `confzone` (
  `zonaId` int(11) NOT NULL AUTO_INCREMENT,
  `zonaName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`zonaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `confzone`
--

INSERT INTO `confzone` (`zonaId`, `zonaName`) VALUES
(10, 'Caucete'),
(11, 'Zonda'),
(12, 'Rivadavia'),
(13, 'Sarmiento'),
(14, 'Los Berros'),
(15, 'El Encón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratistaquipo`
--

CREATE TABLE IF NOT EXISTS `contratistaquipo` (
  `id_equipo` int(1) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  PRIMARY KEY (`id_contratista`,`id_equipo`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `contratistaquipo`
--

INSERT INTO `contratistaquipo` (`id_equipo`, `id_contratista`) VALUES
(2, 17),
(4, 17),
(9, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratistas`
--

CREATE TABLE IF NOT EXISTS `contratistas` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `contratistas`
--

INSERT INTO `contratistas` (`id_contratista`, `nombre`, `contradireccion`, `contramail`, `contramail1`, `contracelular1`, `contracelular2`, `contratelefono`, `contracontacto`, `estado`, `id_empresa`) VALUES
(17, 'Clorox', 'Clorox', 'Clorox', 'Clorox', '156565665', '156565665', '156565665', '156565665', 'AC', 6),
(19, 'Trazalog', 'Lib. Gral. S. Martin 1890', 'soporte@tazalog.com', 'soporte@tazalog.com', '155555555', '155555555', '155555555', 'Soporte', 'AC', 6),
(20, 'contratista emp 6', 'calle sin numero', 'contratista@gmail.com', '', '1555555', '16666666', '42555555', 'hugo', 'AC', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criticidad`
--

CREATE TABLE IF NOT EXISTS `criticidad` (
  `id_criti` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_criti`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `criticidad`
--

INSERT INTO `criticidad` (`id_criti`, `descripcion`, `id_empresa`, `estado`) VALUES
(1, 'Alta', 6, 'AC'),
(2, 'Media', 6, 'AC'),
(3, 'Baja', 6, 'AC'),
(9, 'muy alta', 6, 'AC'),
(10, '666', 6, 'AN'),
(11, 'Alta', 7, 'AC'),
(12, 'Media', 7, 'AC'),
(13, 'Baja', 7, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta_ordeninsumos`
--

CREATE TABLE IF NOT EXISTS `deta_ordeninsumos` (
  `id_detaordeninsumo` int(11) NOT NULL AUTO_INCREMENT,
  `id_ordeninsumo` int(11) DEFAULT NULL,
  `loteid` int(10) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_detaordeninsumo`),
  KEY `loteid` (`loteid`),
  KEY `id_ordeninsumo` (`id_ordeninsumo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=62 ;

--
-- Volcado de datos para la tabla `deta_ordeninsumos`
--

INSERT INTO `deta_ordeninsumos` (`id_detaordeninsumo`, `id_ordeninsumo`, `loteid`, `cantidad`, `precio`, `id_empresa`) VALUES
(1, 1, 1, 10, NULL, 6),
(2, 2, 1, 2, NULL, 6),
(3, 3, 1, 1, NULL, 6),
(4, 4, 2, 1, NULL, 6),
(5, 5, 1, 34, NULL, 6),
(6, 6, 1, 196, NULL, 6),
(7, 7, 1, 3, NULL, 6),
(8, 8, 1, 2, NULL, 6),
(9, 9, 1, 4, NULL, 6),
(10, 10, 2, 12, NULL, 6),
(11, 10, 3, 3, NULL, 6),
(12, 11, 1, 2, NULL, 6),
(13, 12, 1, 34, NULL, 6),
(14, 13, 1, 2, NULL, 6),
(15, 14, 1, 3, NULL, 6),
(16, 15, 1, 100, NULL, 6),
(17, 16, 1, 100, NULL, 6),
(18, 17, 1, 10, NULL, 6),
(19, 18, 1, 22, NULL, 6),
(20, 19, 1, 20, NULL, 6),
(21, 20, 1, 10, NULL, 6),
(22, 21, 1, 5, NULL, 6),
(23, 22, 4, 10, NULL, 6),
(24, 23, 1, 10, NULL, 6),
(25, 24, 2, 1, NULL, 6),
(26, 25, 1, 1, NULL, 6),
(27, 26, 1, 5, NULL, 6),
(28, 27, 2, 10, NULL, 6),
(29, 27, 3, 1, NULL, 6),
(30, 28, 1, 10, NULL, 6),
(31, 29, 1, 6, NULL, 6),
(32, 30, 1, 90, NULL, 6),
(33, 31, 1, 2, NULL, 6),
(34, 32, 1, 12, NULL, 6),
(35, 33, 2, 7, NULL, 6),
(36, 34, 1, 3, NULL, 6),
(37, 35, 1, 34, NULL, 6),
(38, 36, 2, 48, NULL, 6),
(39, 37, 1, 48, NULL, 6),
(40, 38, 1, 3, NULL, 6),
(41, 39, 1, 6, NULL, 6),
(42, 39, 2, 10, NULL, 6),
(43, 40, 1, 4, NULL, 6),
(44, 41, 2, 6, NULL, 6),
(45, 41, 4, 1, NULL, 6),
(46, 42, 3, 1, NULL, 6),
(47, 43, 4, 7, NULL, 6),
(48, 43, 1, 1, NULL, 6),
(49, 44, 4, 45, NULL, 6),
(50, 45, 3, 3, NULL, 6),
(51, 45, 1, 30, NULL, 6),
(52, 46, 1, 4, NULL, 6),
(53, 47, 4, 6, NULL, 6),
(54, 48, 1, 2, NULL, 6),
(55, 49, 3, 2, NULL, 6),
(56, 50, 2, 2, NULL, 6),
(57, 50, 7, 3, NULL, 6),
(58, 51, 1, 4, NULL, 6),
(59, 52, 1, 50, NULL, 6),
(60, 53, 7, 44, NULL, 6),
(61, 54, 10, 20, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta_ordenservicio`
--

CREATE TABLE IF NOT EXISTS `deta_ordenservicio` (
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
  KEY `id_componente` (`id_componente`),
  KEY `deta_ordenservicio_ibfk_2` (`id_tarea`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `deta_ordenservicio`
--

INSERT INTO `deta_ordenservicio` (`id_detasercicio`, `id_ordenservicio`, `id_tarea`, `tiempo`, `observacion`, `monto`, `id_componente`, `rh`) VALUES
(1, 1, 'tarea test 001', '', NULL, 0, 0, NULL),
(2, 1, 'tarea test 001 b', '', NULL, 0, 0, NULL),
(3, 1, 'Tarea test 001 c', '', NULL, 0, 0, NULL),
(4, 2, 'Tarea 1', '', NULL, 0, 0, NULL),
(5, 2, 'Tarea 2', '', NULL, 0, 0, NULL),
(6, 2, 'Tarea 3', '', NULL, 0, 0, NULL),
(7, 3, 'Generacion del ATS', '', NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta_remito`
--

CREATE TABLE IF NOT EXISTS `deta_remito` (
  `detaremitoid` int(11) NOT NULL AUTO_INCREMENT,
  `id_remito` int(11) NOT NULL,
  `loteid` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`detaremitoid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Volcado de datos para la tabla `deta_remito`
--

INSERT INTO `deta_remito` (`detaremitoid`, `id_remito`, `loteid`, `cantidad`, `precio`, `id_empresa`) VALUES
(1, 1, 1, 34, 0, 6),
(2, 2, 1, 23, 0, 6),
(3, 3, 1, 1, 0, 6),
(4, 4, 1, 30, 0, 6),
(5, 5, 1, 45, 0, 6),
(6, 7, 4, 200, 0, 6),
(7, 8, 5, 2, 0, 7),
(8, 11, 2, 10, 0, 6),
(9, 12, 7, 5, 0, 6),
(10, 12, 2, 2, 0, 6),
(11, 13, 2, 22, 0, 6),
(12, 14, 2, 2, 0, 6),
(13, 14, 1, 1, 0, 6),
(14, 15, 2, 10, 0, 6),
(15, 16, 6, 5, 0, 6),
(16, 16, 1, 100, 0, 6),
(17, 17, 2, 50, 0, 6),
(18, 17, 7, 100, 0, 6),
(19, 18, 1, 22, 0, 6),
(20, 19, 2, 20, 0, 6),
(21, 20, 8, 100, 0, 6),
(22, 21, 9, 2, 0, 7),
(23, 22, 10, 30, 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `descripcion`, `empcuit`, `empdir`, `emptelefono`, `empemail`, `cliImagePath`, `localidadid`, `provinciaid`, `paisid`, `gps`, `empcelular`, `zonaId`, `emlogo`, `clienteid`) VALUES
(6, 'DEMO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 'MINA CHINCHILLAS', '20000000', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0xffd8ffe000104a46494600010101006000600000ffdb0043000201010201010202020202020202030503030303030604040305070607070706070708090b0908080a0807070a0d0a0a0b0c0c0c0c07090e0f0d0c0e0b0c0c0cffdb004301020202030303060303060c0807080c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc0001108008e014603012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fdfcaf35d77f6ccf83fe17d6ef34cd4fe2b7c36d3b52d3a77b5bbb4baf1359433daca8c55e37469032bab020a900820835e955fcdb7edd1ff27b5f18bfec78d6bff4be7af7787b25866352709c9c7955f43c1cf7379e029c6708a7776d4fdf6ff86e8f825ff458be15ff00e15961ff00c768ff0086e8f825ff00458be15ffe15961ffc76bf9b6a2beb3fd44a1ff3f5fdc8f99ff5d2bffcfb5f7b3fa49ff86e8f825ff458be15ff00e15961ff00c7696dff006e1f82d753a4517c5ff85d24b2304444f155833331e0003cde4935fcdad26297fa8943fe7ebfb90ffd75adff003e97decfea74515e03ff0004c7fda47fe1a93f62df06f886e2e3ed1acd8db7f63eae4b6e7fb5db623676ff006a4411cbff006d457bf57e7389a12a1565467bc5b5f71f7d46b46ad38d586d249af9851451589a8c96658636776544404b331c0007726bcbff00e1ba3e097fd162f857ff00856587ff001daf35ff0082bcfed263f66bfd87fc53736b71e46b7e2a5ff84774cda70e1ee1584ae3b82902ccc0f660bd322bf002bebb87f8656614655eac9c55ecadd7b9f2f9ef10bc0d58d1a71526d5ddff0003fa49ff0086e8f825ff00458be15ffe15961ffc768ff86e8f825ff458be15ff00e15961ff00c76bf9b6a2bdff00f51287fcfd7f723c3ff5d2bffcfb5f7b3fa49ff86e8f825ff458be15ff00e15961ff00c76af7863f6bef84be37f105a693a2fc51f875abeab7f2086d6cacbc4967717172e7a2a469216663e8066bf9a8af77ff0082620ff8d80fc27ffb1820feb58627826852a33aaaabf7537b2e88e8c2f17d6ab5a149d34b99a5bbeaec7f44b5cafc4cf8e9e09f82df62ff0084cbc63e15f09ff69799f63fed9d5adec3ed5e5eddfe5f9aebbf6ef4ce338deb9ea2baaafcb1ff008397867fe14aff00dc73ff0071d5f199360238dc6430d27652bebe89bfd0fabcdb1b2c26167888abb56d3d5a5fa9f7dffc3747c12ffa2c5f0aff00f0acb0ff00e3b47fc3747c12ff00a2c5f0afff000acb0ffe3b5fcdb515f75fea250ff9fafee47c67fae95ffe7dafbd9fd24ffc3747c12ffa2c5f0aff00f0acb0ff00e3b47fc3747c12ff00a2c5f0afff000acb0ffe3b5fcdb5147fa8943fe7ebfb907fae95ff00e7dafbd9fd24ff00c3747c12ff00a2c5f0afff000acb0ffe3b47fc3747c12ffa2c5f0aff00f0acb0ff00e3b5fcdb5147fa8943fe7ebfb907fae95ffe7dafbd9fd24ffc3747c12ffa2c5f0aff00f0acb0ff00e3b56ec3f6c7f845aa4424b6f8a7f0e2e6363b4345e25b2704fa64495fcd5d26293e03a1d2abfb9151e35ab7d692fbd9fd45f86bc61a4f8cec7ed5a3ea9a76ad6c0edf3acee5278f3c8c6e4247507f2ad1cd7f2e7e19f15ea9e0bd5e2d4346d4b50d26fe1398ee6cae1e09a33ea1d0823f3afb8ff621ff0082ea7c40f82dae58e8df136e6ebc7be117758a4bb9b0dabd8267975978f3f19c9594963d9c743e5e3b823114e2e7869a9dba5acfe5ab4ff03d3c171861eac942bc5c2fd6f75f3dac7ed551585f0d7e25687f183c05a4f89fc35a8c1ab687addbadd59dd424ed950fb1e410410548054820804115bb5f1128b8b7192b347d7269aba0aa9ae6bd65e19d26e2ff0052bcb5d3ec6d53cc9ae6e6558a2857fbcccc4003dcd787fedfbfb7ff0085bf60af85f1eabab27f6af88b56df1e8ba2c726c92f9d71b9d9b07644991b9b07a800126bf0ebf6aefdb93e247ed97e2a7bff001a6bd3cd629217b4d1ed59a1d36c07611c39c671fc6db9cf763c57d1e4bc3588c7af6adf2c3bf7f45faec7859bf1050c0be4f8a7d974f57d3f33f63fe347fc16bbf67df83b712db47e2ab9f17dec248783c3b66d78bf513b148181ff006643fcabe7df17ff00c1c9fe1ab2b971a07c2bd7352841f91b50d662b1661c750914c077ee7a57e4b628afb9c3f06e5d4d7be9cbd5dbf2b1f1b5f8bb1d37ee5a3e8aff009dcfd369ff00e0e51d7da6731fc27d1d232c762b6bb23301d813e48c9f7c0fa549a77fc1ca9acc5788d77f0934c9edc677a43e2092273c718630301ce3f84ff5afcc4c52818aecff0055b2bff9f5f8cbfcce4ff59b32ff009fbf847fc8fd6af0cffc1c9fe1aba75fedaf857aed82e3e6365acc5784707a078a2ef8fccfa73ed3f0c3fe0bbbfb3efc44ba586fb57f10f84247e17fb6b4a60a4fa16b769957eac40e3ad7e15818a5c57256e0dcb66bdd4e3e8ffcee7551e2dc7c1fbcd4bd57f958fe9f7e1d7c55f0cfc5ff000f2eade14f1068be24d31cedfb5699791dd441b19da590901b04707915bd9e6bf993f825f1f7c65fb3978d61f10f827c45a9787755848cc96b2e1275073b258ce5244ff65c11ed5fb59ff04beff82a9693fb72686fe1df104569a0fc48d321f367b488916dab443199edf7124104fcd1924ae41048cedf8ccef856b60a2eb527cf05bf75ebe5e67d6e51c4947192f6535cb3edd1fa3fd3f33ec1a28a2be50fa40afe6dbf6e8ff93daf8c5ff63c6b5ffa5f3d7f4935fcdb7edd1ff27b5f18bfec78d6bff4be7afbce04fe3d5f45f99f15c69fc0a7eaff0023cb28a28afd30fcf028a28a00fd1cff0083773f693ff844fe33789be185f4e059f8b6d7fb574d563f76f2dd4f988a3d5e0258ff00d7b8afd80afe647e00fc60d43f67ef8d9e16f1ae99f35ef8675286fd5338132a302f19ff0065d3721f6635fd2cf81bc69a77c46f05e91e20d227175a56b9670dfd9cc0604b0ca81d1bf15615f95f1b603d962a3898ad26b5f55ff02df89fa6708e37dae15d096f07f83ff837fc0d5a28ae73e2f7c4fd37e0b7c2bf1178bb58709a6786b4e9f51b8f982975890bec5cf059b1b40ee481debe361172928c7767d5c9a4aef63f20bfe0e0afda4bfe164fed3ba57c3fb29f7e9bf0fecb75caab02ad7d72a923f4ebb62108e7a1320c0e73f01d6f7c55f88fa97c60f899aff8af5893cdd53c47a84fa95d30271e64ae5c81e8a33803b000560d7ef1966096130b0c3afb2b5f5ebf89f8b6658c78ac54ebbeaf4f4e9f80514515dc70857bbffc1313fe5203f09ffec6083fad78457bbffc1313fe5203f09ffec6083fad71e63feeb57fc32fc99db96ffbdd2ff147f347f44b5f963ff072effcd15ffb8e7fee3abf53abf2c7fe0e5dff009a2bff0071cffdc757e4bc27ff00235a5ff6f7fe92cfd3789ffe45957feddffd291f963451457ecc7e4a1499a5afda0ff8279ffc1323e05fc64fd8bbe1ef89fc4bf0fec755d7b59d33cfbcbb7bebb469dfcd7192a92851c01d00e95e566d9bd2cbe9aab59369bb696f5ead1ea65594d4c7ce54e9b4acafa9f8bf457f40ff00f0e7cfd9bbfe897e9bff00831beffe3d47fc39f3f66eff00a25fa6ff00e0c6fbff008f57cfff00af382fe49fdcbfccf77fd4cc57f3c7f1ff0023f9f8068afde9f887ff00044afd9dbc71e1b9acacfc1b71e1abb704457fa66a9722780fa8595de36fa321fc2bf18ff6c4fd99354fd8fbf688f11780754b84be7d22556b5bc44d8b7b6d22878a5db93b49461b97276b061938cd7b194f10e173093851ba92d6cfb7959b3c9cd321c4e062aa5469c5e975fa9e65498e6968af74f10fd1bff837f3f6c9bbf067c5bbcf83dabdd17d13c5492dfe8c24627ec97d1a6f9235ec165891891fde8971cb9cfebcea7aa5be8ba6dc5e5dcd1dbdada44d34d2c8709122825989f40013f857f33ffb367c40b8f851fb42f81fc4b6ae639b43d76caf4119f9824e8594e3b100823d09afe813fe0a13ad5c787ff619f8b5756afe5cebe15bf8c3f750f032123df0c707b1afcc38bb2d8acc29ca1a7b5d1fadd2bfe28fd2b85b1f29606719ebecf6f4b5edf99f847fb71fed55aafed8ff00b497887c69a84928b19e636da45ab312b616284886203b1c7ccd8c65ddce06715e478a31cd15fa5d1a30a54d52a6ac92b23f3aaf5a756a3ab51ddb77615afe03f87daf7c52f145be89e1ad1b54d7f58bb244365a7dabdccf2639242202700724f403935915fae1ff0006e29f067fc2a6f1d883ec5ff0b00eaabf6c0fb7ed3fd9be545e4ecefe5f9de76ec7f16dcff0d79f9c662f038596214799ab69ebdfc8eeca32f58dc4aa12972a7fa763e3ff00077fc112ff0068df17d84772de0ab5d222957720d4757b58a4c7ba0919d4fb30078fa66af8f7fe08c1fb46780b4e9aedbc04757b787963a5ea56d752118ed1093cc6ff0080a93c57efa93cd1b6bf3e5c718ee6bf2c6ddacffccfbb7c1d81e5b5e5eb75fe47f2e3e23f0dea5e0ed76ef4bd5f4fbdd2b53b190c573677903c13dbb8eaae8c032b7b119aa55fbb1ff055cff8262c9fb76f86f43d4bc24de1dd1fc79a3dc885f50d49a4862bcb12adba1778a376255f6b265481971c6eaf8cb49ff83723e2bcc23fb778dbe1edb673e67912de4db7d31ba04cf6f4afafc0f15e06b50552b4d425d51f2b8ce18c653ace9d18f3c7a3d17ebb9f9e95d27c1df8b3ad7c09f8a7a0f8c3c3b72d69acf876f23bcb593b12a79461dd1972ac3a15620f5afd0bd1ff00e0db3f14ceabfda1f14b40b525f0c2df489a7c271c8dd2264f5e38fad75161ff0006d3d9468df6af8c5753367e531785d62007be6e9b3fa569578a32969c2752e9f949fe8452e1bcd1494a34ecd6b7bc7fccfd1cf829f15ac3e38fc21f0cf8c74b18b0f136996fa9449bc31884b18731923f89492a7dd4d1581fb257ecf10feca7fb3df87be1fdbeaf75af5b7871668e2bdb888452cab24f24a0150481b7ccda31d94515f8fe21535564a93bc6eede97d0fd528b93845d4569595fd7a9e915fcdb7edd1ff27b5f18bfec78d6bff4be7afe926bf9b6fdba3fe4f6be317fd8f1ad7fe97cf5f6dc09fc7abe8bf33e378d3f814fd5fe4796514515fa61f9e17747f0ede6bf05fc9690b4cba6db1bcb80bd5220ea85b1df05d73e8327a0354abeabff008236fc3bd3be2f7ed893785756432699e23f0beafa6dd003e6f2e6b5646233dc06c83d8815f397c56f873a8fc1ef89be20f0a6af1f97a9f873519f4db91820192290a123d8e320f7041ae4862a32c44b0fd524fe4eebf4fc4eca98471c34312b6936be6bfcff00430715fb69ff00040dfda4bfe16efec893f83af67f3357f8717bf6300fde6b19f74b6ec4e79c309d071c2c4b5f8975f59ffc116ff692ff00867bfdb8f41b4ba9fcad17c76bff0008e5e027e559256536cf8e9913ac6b93d1647af2f89b01f5ac04e297bd1f797cbfe05cf4b8731df56c746ef497bafe7b7e363f7a6bf3e3fe0e12fda4ff00e15e7ece1a2fc3bb1b809a8f8f2f3cfbc557f996c6d595c823a8df318707b88dc73ce3f41b3cd7f3edff000567fda4c7ed35fb7078b350b6b9171a27875c787f4a28db90c16ecc1dd48eaaf334ce0fa38afcfb84701f58c7aa925eec3def9f4fc75f91f73c4f8dfabe0a515bcf4ff3fc3f33e6cc519a5af43fd92fe045d7ed37fb497837c096a2403c43a94705cbc632d05b2fcf71281fec42b237fc06bf5dab5234e0ea4f64aefd11f9652a72a9354e1bb765f3388d7fc3d7be16d416d6fe07b6b86821b908e307cb9a249a36ff008123a9fc6a9d7d09ff000556d1ad7c3dff000501f88fa7d8c11dad9585ddbdbdbc318c2431a59c0aaa07a000015f3dd6785adeda842adadcc93fbd5cd3174551af3a4becb6bee760af77ff0082627fca407e13ff00d8c107f5af08af77ff0082627fca407e13ff00d8c107f5acb31ff75abfe197e4cd72dff7ba5fe28fe68fe896bf2c7fe0e5dff9a2bff71cff00dc757ea757e58ffc1cbbff003457fee39ffb8eafc9784ffe46b4bfedeffd259fa6f13ffc8b2aff00dbbffa523f2c68a28afd98fc942bfa18ff0082531ff8d78fc2affb03ff00ed692bf9e7abd6de26d4aca058a1d46fa28d06151277555fa006bc3cfb26798d18d253e5b3bed7e8d7747b791e6eb0152551c79aeadbd8fea3a8afe5d3fe131d5ffe82ba97fe04bff8d1ff00098eafff00415d4bff00025ffc6be57fd4297fcfff00fc97ff00b63e97fd7587fcfa7f7ffc03fa6ef881f133c3bf0a3c3b36afe26d734ad034bb756692eafee92de2000c9e588c9c761cd7e01ffc150ff6a6d2bf6bdfdb1bc43e2ad00b3f876da2874bd2e678cc6f73042b8f38820101dcbb2860085650402303c0aff51b8d526125d5c4f73201b434b217603d327b727f3a836e6bdfc8b8669e5d51d673e69356dac97e2cf1339e239e3a9aa31872c6f7deedfe085a28a2be9cf9a3a3f837e17b9f1c7c5ef0a689648d25e6b1ac5a5940a8bb999e59d11401dce58715fd257c7ef8649f1a7e0678c7c20e621ff093e8b79a5abc832b1b4d0bc6afdfeeb3039ea0806bf1cffe0851fb235dfc6ffda9e1f1e5fdabff00c22ff0e48bbf3597e4b9d41948b7881ee5326638ce3cb407ef8afdbac57e63c6b8e4f174e9537ad357f46ecff45f79fa4708e0dc7093a935a4dfe0b4ff0033f970f11f87ef7c25e21bfd2752b696cf51d32e64b4bab79576bc12c6c51d18762181047b553afd6bff0082c5ff00c125755f8afe24bcf8aff0bb4d6bfd6ee5436bfa15bafefaf99463ed502ff1498003c6397c6e1962c0fe4c5e5a4da75e4b6f710cb04f0398e48a452af1b0382ac0f20820820d7dde539a51c7d05569bd7aaea9ff005b773e2b34cb2ae0ab3a735a747dd7f9f723ad3f06f8d759f877e23b5d6340d5b52d1356b26df6f7b6172f6f3c27d55d0861f81acca2bd269356679b1938bba7667d99f053fe0bb9f1e3e145b416baadfe87e38b28404035ab2c5c05ff00aed098d99bfda9379e79cd7d3ff0b3fe0e46f0cdff0095178d7e1beb7a5903125c68b7f15f063ea239442547b6f6fa9afc94a315e1e2786b2dafaca924fcb4fcb43dac3f11661474552ebcf5fc5ebf89fbe7f0c3fe0b3ffb3c7c4d8e353e373e1dba7207d9f5ab19ad4afd64dad17fe3f5f447807e2cf857e2ad935cf85fc4be1ff125b2804cba56a30de2007a65a36615fcc262ac695abdde85a84577637571657509dd1cd048639233ea18104578588e05c3cb5a151c7d6cff00c8f6a871a565fc6a69fa36bfccfea4fa9a5c57e02fecf9ff00058bf8f1f006e608ff00e12e9bc61a4c4c0bd878901bf0e318c09c913af1d0093038e0f4afd53ff827dffc156bc0ff00b74c6345113785bc796f09966d16e650e974aa3e77b69703cc51d4a901c0c9c100b57ca669c318cc145d4694a0baae9eab7fd0fa6cbb887098c92a717cb2ecff004e9fa9f53818a2933e9cd15f387bc2d7f36dfb747fc9ed7c62ff00b1e35aff00d2f9ebfa49afe6dbf6e8ff0093daf8c5ff0063c6b5ff00a5f3d7de7027f1eafa2fccf89e34fe053f57f91e59451457e987e787d95ff041b1ff001b0fd17fec0fa87fe89aeb3fe0e06fd9c4fc32fdaa34df1d595b88f4cf885621a66550156fad82472f4e9ba230364f2c4b9e706b94ff00820dff00ca43b45ffb03ea1ffa26bf48bfe0b37fb388fda13f618f114d6b6e26d6bc10c3c4762554172b0ab0b84ce3383034a703ab227a57c2e638efaaf105393da51517f36ff5b1f7180c17d67229c12d536d7aaff35747e0954967772e9f7915c4123c33c0e248e446dad1b0390411d083ce6a2cf34b5f747c3a67eecf8fff00e0a336f1ff00c125ff00e1725b5d471788b58d1069b6eb130568b59726d9f681d3cb94492e38ca4791d457e13bb191cb312ccc72493924d75d77f1cfc4577f026d3e1c3deb1f0b596b72ebe96dc9cdd3c290e7e8154e00ef239ef5c8578b9364f0c02a8a3f6a4dfcba2f91ed6739b4b1ce9b7f662afebd5857e987fc1ba1fb390d6bc7be31f8a57d6dba0d0e01a1694ecb91f6897125c3a9ecc9108d7e970d5f99f9afe89ffe09b5fb381fd967f634f05f85ee2dfecfac4b68353d5c15c3fdb2e3f7b22373d630562fa442bcde31c77b0c0fb28bd6a3b7cb77fe5f33bb84f05edb19ed5ed057f9bd17eafe47e32ffc15bffe5233f14bfec230ff00e92c35f3957d1bff00056fff00948cfc52ff00b08c3ffa4b0d7ce55ef657fee547fc31fc91e2e69fefb5bfc52fcd857bbffc1313fe5203f09ffec6083fad78457bbffc1313fe5203f09ffec6083fad5663feeb57fc32fc98b2dff7ba5fe28fe68fe896bf2c7fe0e5dff9a2bff71cff00dc757ea757e58ffc1cbbff003457fee39ffb8eafc9784ffe46b4bfedeffd259fa6f13ffc8b2aff00dbbffa523f2c68a28afd98fc9428cd15fabbfb0fff00c114fe107ed13fb27f823c6daf5ef8d62d63c45a7fda6e96d351863803f98ebf2ab42c40c28ea4d79b99e6b43014d54af7b376d15cf472dcaeb63a6e146d74afa9f945499e6bf6d3fe21ebf811ff00410f885ff83583ff0091ebf2cff6fcfd90efff00629fda5f5af06cc6e27d209fb6e8979301baf6c6427cb624000ba90d1be001be36c0c115cd96f10e0f1d51d2a0df3257d558e9cc721c560a9aab56cd5eda3fccf18a28a2bdb3c52de85a05ff008a3548ac74cb2bbd46f67388eded6169a590fa2aa824fe15f647ec77ff000442f8abfb416b76d7be33b0bbf86fe14560d3cba9c3b353b85ee915ab61d5bfda942819c80d8db5f2f7ecf3f1d75dfd9a3e33681e37f0dcfe4eaba05d2ce8acc447729d24864c104a48859187a31ef5fd1a7ecedf1eb41fda6fe0c681e38f0dcfe6e97af5b09950b0325b483e59217c747470ca7dd78e315f25c539be330308fd5e2b965a736f67e9b7a6fd4faae1acab098c949d66dca3f67a35f9fafc85fd9f7f67df0afecc3f0ab4cf06f83b4d4d3b46d3178c9dd35cc87efcd2bf1be473c963ec0000003b5a2b3b54f18693a1dc882f754d3ace62a1bcb9ee523620f7c139c57e51394ea4dca4eedee7e9908c631518ab2468e2bc43f69cff008274fc20fdae1a5b9f187846d1b5a9170358b06367a80c700b4898f330380250e07615e8137ed03e03b795e37f1b78451e325595b58b70548ea08dfc1aa57ffb52fc32d2a611dd7c45f025b48c3705975fb44623d7064e9c1adf0ff5aa3353a3cd17dd5d19568d1a91e4aa935d9d8fcebf8cff00f06dd9f3a69fe1e7c47511927cab1f1159f2a3b6eb883afe108fe95f32fc4eff008225fed11f0dda6787c2367e26b5849cdc68ba943387f758dca4c7fefdd7ed31fdaefe13892243f13fe1e6f9a458a35ff848ecf323b1c2a81e67249e00ea6bd0f22be8e8f16e6987b2ab697f895bf2b1e0d6e18cbab36e0b97fc2ffcee7f32df11ff00675f881f07a465f157827c57e1d0a0b6ed474a9ed9180ee1994023dc1c5719babfa9dc0af2ef897fb137c21f8c30489e23f86de0dd49e43937074b8a2b919eb89902c833ecdcd7b187e3c5b57a3f73fd1ff99e457e0aeb46afdebf55fe47f3679a5afd4eff008297ff00c111bc23f0efe0e6bff10fe143ea1a4b786ada4d4751d06e2e1ae6da4b58c6e95e091c99119103390ece1829c6d2067f2c6bec72ccd30f8fa5ed683f269ee8f93cc72cad82a9eceb75d9ad989b6b4fc1de30d53e1f78af4fd7344bfb9d2f57d26e12eaceeeddca4b6f2a1cab29f506b368af41a4d599c0a4d3badcfe8dbf603fda9a1fdb13f658f0c78d8ac516ab7109b4d5e18c6161bd88ec9703b2b102451ce164519ce68af91ffe0dbff125cdd7ecff00f10b4a7626d2c7c4115d44a4fdd796dd55ff0048528afc333ac2470d8eab461b27a7a3d7f53f68cab112c46129d69eed6bea7e8f57f36dfb747fc9ed7c62ff00b1e35aff00d2f9ebfa49afe6dbf6e8ff0093daf8c5ff0063c6b5ff00a5f3d7d47027f1eafa2fccf99e34fe053f57f91e59451457e987e787d97ff041bff948768bff00607d43ff0044d7ee5dfd841aa58cf6d731473dbdcc6d14b1c8a196446182a477041c62bf0d3fe0837ff290ed17fec0fa87fe89afdd1afc9f8dbfe460bfc2bf367ea1c23fee1ff6f3fd0fe6bff6ccf8013fecbdfb5078d3c0d2ab88743d49d6cd9facb692625b77ea7930ba13cf0723b5799d7e9eff00c1c69fb390b1f10f827e2ad8dbe23bf46f0eeaceaa0012a6e9ad98fab3219d49ec22419e95f9855fa264b8efade0a9d77bb5afaad19f059ce0beab8c9d25b5eebd1eabfc831451457a87987d03ff0004b9fd9cc7ed39fb6df83342b9b7fb468fa6dcff006d6aca4653ecb6c44851bfd9924f2e23ff005d6bfa1ada2bf377fe0dd6fd9ccf863e1178b3e275f5bedbaf14dd0d274c760411696e732b2f62af336d3ef6df9fe91d7e45c618ff00ac63dd38ed056f9f5ff2f91faaf0b60bd86094def3d7e5d3f0d7e67f3e1ff056ff00f948cfc52ffb08c3ff00a4b0d7ce55f46ffc15bffe5233f14bfec230ff00e92c35f3957e9f95ff00b951ff000c7f247e719a7fbed6ff0014bf3615eeff00f04c4ff9480fc27ffb1820feb5e115eeff00f04c4ff9480fc27ffb1820feb5598ffbad5ff0cbf262cb7fdee97f8a3f9a3fa25afcb1ff0083977fe68aff00dc73ff0071d5fa9d5f963ff072effcd15ffb8e7fee3abf25e13ff91ad2ff00b7bff4967e9bc4ff00f22cabff006eff00e948fcb1a28a2bf663f250afe867fe094dff0028f1f855ff00607ffdad257f3cd5fd0cff00c129bfe51e3f0abfec0fff00b5a4af89e3aff73a7fe2fd19f65c17fef153fc3fa9f41d7c7bff000599fd89bfe1abbf6639f5ad1acfcef1a780564d4b4f11ae64bdb6c03716c31c925543a8e4978d546379afb0a9315f9be0b17530b5e35e9ef17fd2f99f7d8ac3431146546a6d2563f963cf14b5f5cffc1647f626ff00864afda7ee354d1ed160f0578eda4d4f4b11ae23b39f20dc5a8038011d83280301254033b4e3e46afdd7078ba789a11af4b692bffc0f96c7e318cc2cf0d5a542a6f17fd3f989b6befbff0082147eddbff0a33e323fc30f11de14f0af8eee1469d24ae7669da991b531d82ce02c67fdb58ba0dc6be05a7432bdb4c9246ed1c9190caca70548e4107b1a8cc3034f1987961ea6cff07d1fc8bcbf1b3c2578d7a7d3f15d51fd4d039afc7dff00838e7e13cfa37c7ef0378d121db63af688fa53c839067b5999ce7b8252e500f50871d0d7db3ff0494fdba13f6d0fd9ba04d5ae964f1cf83c47a7eb8ac7e7ba1b7f7379ff006d555b77fd344938036d75bff0521fd8de1fdb6bf660d5bc2d07910f88ac586a5a0dc4b8022bb8c1c231ec922968c9e83786c1da057e4d955596559aa8e234b3e57e8fafa6cfd0fd4332a51ccb2e6e86bccaebd574fd0fe77b14b8ad0f17784b54f00f8a2ff44d6ac2eb4bd5b4b9dedaeed2e6331cd6f229c32329e4106b3ebf644d35747e4928b4ecf716276824574664743b9594e083ea2bf66bfe09f7ff0005c1f047c55f06697e1bf8afa9c1e10f19594296efaadd9d9a6eb054002532fdd824382583ed4cf2adcec5fc64a315e5e6d93d0cc29a856dd6cd6e8f4f2bcdabe066e74b54f74f667f511e14f1b68de3bd2d6fb43d5b4cd66c9c656e2c6e92e226fa32122ad6afacda681a6cd797f756d65696e374b3cf22c71c6338c9663803eb5fcb8da5dcd6170b3412cb0ca99daf1b1565c8c7047b1a9350d5eef56d9f6abab9b9f2f3b7cd90bedcf5c67a741f957c8be025cda57d3fc3ff00db1f52b8d95b5a3aff008bfe01fb0bff00056cff0082b07817c3bf03bc49f0dbc01ad69fe2cf1378aed25d2afaeb4f956e2c74bb595764f99572924ac85902a13b4b12c4150adf8e5498a5afafca729a397d1f654b5beadbeacf95cd735ab8eabed6a2b5b449740a28af66fd857f631f10fedc1f1dac7c2ba42496da54056e75bd4f6e534cb40c033f3c191b9545fe263d94311df5ebc28d3756a3b456ad9c34284eb5454a9abb7b1faa7ff0403f8433fc3cfd8825d76ee0314fe35d6ee35184b705ada354b74e3d37c5291ea1876c515f677817c13a67c35f05e93e1ed16d52c748d0ece2b0b2b74fbb0c31a0445fc140e68afc2731c5bc56267887f69dfe5d3f03f69c0e1961f0f0a0beca48d5afe6dbf6e83ff19b7f18bfec78d6bff4be7afe926b035cf09f862ca0bad4752d33418624dd35c5cdcdbc4aabdd9ddd871ea4935e9f0fe74b2ea939b873732b6f6fd19e7e7593ff00684230e7e5e577daff00aa3f982a2bfa1cf17fed93fb34f816668f51f1cfc2b1227de4b6b8b5bb75e7182b10620fb75159da27ede9fb2ef882e3ca83c75f0d236c819b958ed97938fbd2228faf3c77c57d92e2dc435ccb092b7cff00f913e51f0a504ecf12bee5ff00c91f97dff041b38ff828768bff00607d43ff0044d7ee95711f0b3c67f0e7c7b335d782755f04eb52449b9a6d12e6d6e5910f192d0938078aedb35f119fe66f1d89f6ce1c964959fcfc9773ec326cbd60f0fec54b9b56ef6b6ff3678bff00c142ff006761fb527ec7de36f08c3079da9cf626f74b0abb9bed901f36155f42ec9b0fb39afe731d4c6e55815653820f507d2bfa9bce6b1dbe1c7879d893a0e8c493924d94473ff8ed77643c4af2ea72a5287326eeb5b5bbf47e471677c3f1c7ce3514f95a56daf7edd56da9fcbe55cf0de8179e2ef10d8695a740f737fa9dcc7696d0a0cb4b2c8c11147b962057f4edff000adfc3bff400d17ff0062ffe269f6df0ff0041b2b98e68744d2629a260e8e9671ab23039041032083debdd7c7b1b6947ff0026ff008078ab8275d6b7fe4bff00db1ce7ecd1f04ecbf671f805e11f035808da1f0d699159bc88302e2603334bdb9794bb9e3abd775462909afcf2a5494e6e73776f567dd420a31518ec8fe7c3fe0ade7fe3631f14ff00ec230ffe92c35f39d7f50f7fe07d1354bb7b8bad1f4bb99e5e5e496d237773ee48c9ff00eb545ff0adfc3bff00400d17ff000062ff00e26bef30bc6d1a342147d8df9525f17656ec7c662b83fdb569d6f6d6e66dfc3dddfb9fcbed7bb7fc1310ff00c6c07e13ff00d8c10ff5afe833fe15bf877fe801a2ff00e00c5ffc4d4b67e04d0f4eba8e7b7d1b4ab79e23b9248ed234743ea081915589e388d5a52a5ec6dcc9af8bbaf4161b83fd956855f6d7e569fc3d9dff0098d5afcb0ff83974f3f057fee39ffb8eafd4e2706a96afe1cd3bc4262fb7d8595f7939f2fed102cbb338ce37038ce07e55f219463d60b170c4b8f372df4db74d7ea7d3e6781fae61a587bdb9adadafb34fcbb1fcb8d15fd40ffc2b8f0eff00d00345ff00c018bff89a5ff856fe1dff00a0068bff0080317ff135f6bfebec7fe7c7fe4dff0000f92ff525ff00cfeffc97ff00b63f97dafe863fe094c7fe35e3f0abfec0ff00fb5a4af69ff8571e1dcffc80345ffc018bff0089ad6b2b0834db5482de18ade0886d48e3508883d001c0af0b3ee25598d18d254f96cefbdfa35d91ece4bc3ffd9f52551d4e6bab6d6fd592d1484e296be54fa33c37fe0a1dfb20d9fedadfb316b7e122b0a6bb6ebfda1a0dd4831f66be8c1d809ecb202d1b1e70b2138240afe77b5cd16f3c35adde69ba85b4d677fa7cef6d736f2a959209518aba30ec430208f515fd4975acabbf016857f7524f3e8ba4cd34ac59e492d2366727a9248c935f5390f134f2ea72a328f345eab5b59f5e8f73e773ae1e863e71a8a5cb25a3d2f75f7a3f979a2bfa82ff008571e1d3ff00300d17ff000062ff00e268ff00856fe1dffa0068bff80317ff00135ef7fafb1ff9f1ff00937fc03c5ff525ff00cfeffc97ff00b63f9e2fd82bf6bed4ff00627fda3f46f18d989ae34b27ec7add8a37fc7f58b91e62e3a6f5c074cf1bd173c120ff00449e0df17e99f10fc25a66bda2dec3a8e91acdac77b657511263b886450c8e3d8a9079e6abff00c2b7f0e939fec1d17ff00a2ffe26b9cf1d7ed1df0cbe07466cfc43e37f05785becc302d2f355b6b59178ced588b0627d80cd7cde779a4334a919d2a4e335a3b3bdd7ddd0fa1ca32d965d4e509d5e68eeaead6fc5ee785ffc144ffe093fe10fdb96d8eb965345e14f8816f16c8f568a00d0ea2a06163ba4182f81c0901dea31f79405afc82fda63fe09ddf17bf64ebcb83e2bf085fb6930310bace9c86f34d907386f3507c99c1c0902371d2bf6beeffe0a9ffb3d58dc3c4ff15bc2e5a338263792453f465420fe06baef04fedb9f077e23ceb0e89f143c077f70edb12dd35bb759d8f1d23660e472390319c8aedcb33acd32f8284e9b9417469ab7a3b7f99c998e4f97e3a7cf19a8cdf54d6beabafe0cfe6d73499afe907e27fec21f063e354b25c788be1a783f50b9b8cb49791e9e96f732e7b99a20b21ffbeabc83c4ff00f0435fd9c7c42eed6fe11d53472e31fe85ae5d900e49dc04b23807b63a6070057d151e39c1b5fbc8493f93fd57e47cf55e0cc4a7fbb9c5af3bafd19f83d499afdc5ff8704fecff00ff003ede30ff00c1cfff00615674dff820a7ecf5633334ba5789ef548c049b5a9005f71b029fccd747faeb977697dcbfccc7fd4ec77f347ef7fe47e18e715a1e17f09eabe37d6a1d3745d3350d6351b8388ad6caddee2794fa2a202c7f015fbfde12ff0082467ece7e0b9924b4f85da3dc321cff00a7dd5d5fa93eeb3cae0fe55ee3e02f857e17f857a7359f85fc39a0f86ed1b19834bd3e2b38ce3a7cb1aa8e2b86bf1dd04bf7349b7e6d2fcae75d0e0baadfefaa25e89bfcec7e337ec8bff0425f8a3f1bafad351f1e21f873e1a621dd6e9449aadc27754833fba2791994a95ebb1ba57ebb7ecd3fb2ef82ff00649f8696fe15f046929a6e9f11124f2b9df737f2e00334d2757738f60070a140007a0e293757c6e6b9f62f1eed55da3d96dff07e67d6e5b9361b04bf72bdeeef7ff81f2168a28af14f54f32fdaff00f6a2d13f63bf801aef8ef5c53711e98823b3b3570926a374ff002c5029e71b9b92d83b5559b076e2bf023f6a9fdb6be22fed89e30b8d4fc67e20bbb9b3694bdae91048d169da7ae4ed58e1076e40e37b65db1cb1afd3dff838cac750b8fd92bc1f34093369f078ae3375b0fc88c6d2e446587fdf601e809c7719fc69c57ea3c1797d0585fadb579b6d5fb25d11f9d71763eb7d616153b4524fd6fdc96cac66d4ae920b7864b89a43858e342ecddf803935675df0bea7e179d62d4f4ebfd3a57e552ea0785987b06033d47e75f737fc11a3fe0a0ff0abf635b3f12695e3cd2eeb4ed475dbc49a1f125b599ba31c0102fd9e455cc8a818171b15b71739fbab5fa4fa8fed27fb3afedbbf0e6f7c2d73e38f01f8934cd6e2685ac2f2f6282e94952a248e19f6c8922e72ae172a7915df997106230988707879382fb5fd2b7caff71c9976414317414e35d29bfb3dbc9eb7f9dbef3f9f1f0f788b50f08eb56da96957f7ba66a366e25b7bab49da19e071d191d486523d41afd7ff00f8230ffc151f5afda435097e17fc44bbfb7f8aac6d1aeb48d5df025d5618f1be19bfbd322fcc1faba862df3292f6343ff8373fe107925ef3c69f11af16401a26b6b9b28571ebcdbbe73c74c7e35eadfb387fc11a7e127ecb9f18746f1cf86ef7c692ebba1348d6a6f3538da205e3789b72a4484828ec08ce39e95e2e799ee538dc3ca9bbb95bdd76d9ff009773d6c9726ccf078853ba51eaafbaff0035d0f94ffe0e40d6af349f885f0ad6d6eeead83e9da816114ac9bbf7b075c1afcd3ff84c757ffa0aea5ff812ff00e35fa47ff0727ffc944f853ff60ed43ff46c15f9975f45c2f15fd974b4efff00a533c1e25a925995449f6ffd251a3ff098eaff00f415d47ff025ff00c68ff84c757ffa0aea5ff812ff00e35fa93ff047ff00d91be067c66fd8ee0d6be207867c2baa7881b58bb80cf7f726398c4a5360c6f1c0c9c715f52ffc3bbff656ff00a127c03ff81c7ff8ed7162f8af0d87ad2a12a526e2eda25fe677e17863155e8c6b46aa4a493ebd4fc11ff84c757ffa0aea5ff812ff00e35ee9ff0004ccf146a777fb7d7c298a5d46fa589f5f8432bdc3b2b0e7a826bf5ebfe1ddff00b2b7fd093e01ff00c0e3ff00c76ba2f855fb06fecfbe0df1c586bfe10f05784e0d7744945cdadcd95c34b2dab8e8e079840fc4579f8be30c2d4a13a6a9495d35b2eabd4eec2f0b62a9568549554d45a7d7a33f3d3fe0e2ad72f74afdaa7c1496b79756c8de1442562959013f6cb9e7835f9f5ff098eaff00f415d4bff025ff00c6befbff00838e7fe4eb7c13ff00629a7fe965cd7e79d7d0f0e457f66d1d3a7eacf9fe21a93598d549f55f92347fe132d5ff00e82ba8ff00e04bff008d07c65ab8ff0098a6a3ff00812ffe35fb01ff0004a6ff00827efc1af8ddfb03f80fc51e2bf87fa26b7afea7fda1f6abdb8327993f97a8dd4499c301c222af4e8b5f415dff00c1273f675bdb7689fe15e80aadd4c72dc46dd7b32c808fcebcac4f1860e8569d195395e2da7b7476ee7a787e17c5d6a31ad1aabde49f5eaae7e03693f12fc47e1fbe5b9b0f106b7657098db2dbdf4b1bae082305581ea01fc057dc3ff04deff82d0f8d3e157c47d2bc2df1535fbaf14781f54992d5b52d45ccd7da2331004c6639796204fceae5881ca9182adf397fc1477e08f84ff673fdb37c6be0ef04dc3cde1dd22784411bce676b377823924b7321e5bcb7665e492000189604d78857bd5b0985cc30c9d48692575a6aaebf067874f198ac0625a8cf58bb3d74767f91f78ffc1767f67fd57e04fed549e30d2ae750b7f0e7c4684de0114ceb15bdfc6156e63183fc59497b64cae070bc7c41ff00098eafff00415d4bff00025ffc6bf6d3f683fd9a2e3f6d7ff823d7832d8c4d7be30d3fc17a4788f4b7da5a69af23b08dde21dc9991a48c0cfde7527a57e1c839af3b86718abe17d8cf59537cafe5b3fbbf23d0e23c3ca8e27db41b51a8b997af55fafccfdf0ff8235fed3cdfb49fec4da1477d7027f107829bfe11fd40b365dd62506de539e4ee80c60b1fbce8fef8fab335f88bff000415fda63fe14d7ed7afe10be9fcad1be245afd8305b0897d16e92d98fd4196203b9997d2bf5b3f6cafda1ed7f655fd997c61e3a9da133e8b60c6c6297eedc5e3feeede323a906564ce3f8771ed5f9ff00106552a3993a34969369c7e7d3efb9f7191e631ad8055aa3d62ad2f975fbb53f223fe0b79fb5ade7c62fdb36fbc3ba46a7731e87f0ee23a346b04cc8925de775db9c1fbc24c447feb80af8ebfe131d5ffe82ba8ffe04bff8d56d5f55b9d7b55b9bebc9a4b9bbbd95e79e673969646259989f52493f8d7d1bff00049cfd9447ed65fb64f87f4fbeb633f86fc347fb7759cae51e18594a42dea2494c68475dace474afd469d3a197605297c34e3af9dbf56ff33f389d6af8fc6fbadde6f4f25ff011f68fc42fd9db50fd967fe0815e288f509af23f157890699aeea923ccc658249f52b1f2e1ddd576422352b9c07f308eb5f955ff00098eafff00415d4bff00025ffc6bf793fe0b583fe3595f12ff00ee17ff00a75b3afc0aaf1b846bcb1186ab5ea6f2a8dfe113d5e2a87b0c453a54db49412fc59fa2dff06eaeb97baafed53e354babcbab945f0a390b2cace01fb65b73c9afd5af8e1f1bbc35fb3afc30d57c61e2ed4a2d2f42d1e2f32695b96724e16345eacecc42aa8e4935f937ff0006e37fc9d6f8dbfec537ff00d2cb6a9ffe0e16fda7af7c5ff1df47f85967712268be11b58f51d42156c09efa75dc8587711c0536fa199fd457859ae57f5ecf7eafb2b26fd12fe91ede5b997d4f2555deaeed2f5b9e51fb6dff00c1643e27fed51acdee9da06a37be04f041729069da6ce62bbba8f3c35cceb876247545223ed86c6e3f21c92b4f233bb33bb9dcccc72493dc9a4c57e977fc119bfe094fe1af8dde034f8abf1334e3abe937570f1681a3cac56dee962628f73301cbaf98acaa84e0ec62c1815afb1af5705946179d47962b4b2ddbfd5fa9f25429e3336c4f2b95def77b25fa7c8fcd1cf1477afea23c37e05d13c1ba08d2b48d1f4ad2b4b0bb059d9da470401718c6c501718e318af917fe0a45ff000490f077ed3df0df51d63c0de1ed23c39f126ca3f3ace6b18d2ce0d5c839305c28010b30c8590e195b6e5b6e457cfe138e2854aaa9d6a6e09f5bdfefd169f79ede27836ac2939d2a9ccd74b5beed59f945fb277fc1447e2a7ec75ad5b3785bc477571a1452033683a83b5c69b70b9c951193fba27fbf1156f7c715fb9dfb13fed8de1cfdb7be07d9f8c7c3ead67307fb2ea9a6cae1e6d32e9402d1923ef290432b606e560700e547e58fc3bff837a3e3578a1125d7356f04f86233f7a29afa5bab85ff0080c51943ff007f2bef5ff82687fc1312fbfe09f1aa7886ee4f883378a22f12db451dc69f1e97f63b68a58d89494132b966019d7385c87e9c570714d6ca71149d4a335ed5765bf7bb4adf33d0e1ba59a509f2578bf66fbb5a7a2bdfe47e327ed39e2cd561fda4fe21226a7a82a2f897510145c38007daa4e3ad70c7c63ab8ff0098aea3ff00812ffe35d4fed43ff272ff00113fec66d4bff4aa4ac0f865616daa7c48f0fdb5e4692da5c6a56d14e8ff007591a550c0fb104d7df50515462dae8bf23e26b4e72c44a2a4f593fccabff098eaff00f415d4bff025ff00c68ff84c757ffa0aea5ff812ff00e35fbda3fe09dffb2b63fe449f017fe071ff00e3b4bff0eeff00d95bfe849f00ff00e071ff00e3b5f27feba613fe7d4bee5fe67d4ffaa38bff009fcbf13f047fe131d5ff00e82ba97fe04bff008d7eb3ff00c1b89abdd6adf09fe2635d5d5c5c94d5ed0299642e57f72fd326be87ff008777fecadff424f807ff00038fff001daf5dfd9fbf673f879fb3d6857917c3bf0fe95a0e9fac48b7171f607678ee5941556c9639c024715e3e79c4d87c660e587a74e49bb6ad2e8efdcf4f27e1ec461312ab54a89a49e9a9e81451457c21f5e717fb42fc04f0efed37f07f5af04f8aad5ae746d721f2e4284096ddc1dc9346c41db22300c0e08c8e411907f18bf69fff00821e7c67f819acde4fe19d2c7c44f0da31682ef4923eda13276892d49f337e3a88bcc5f7ed5fa1ff00b7e7fc15cb4cfd82fe2e5af84751f026adafcf7fa545aadb5d43a8476f0ca8f24b1ede558821a26cf1dc71820d7821ff008394f483ff00348f52ff00c2893ff91ebed321867586a7ed3094f9a9cb5b36adebba6bfab9f299d4b29c44fd9e2a7cb38e9757baf2d9a3f2e7c6ff000dfc43f0d3557b1f11e81ad787efa36d8d6fa958cb692a91d8ac8a083f8562e6bfa32fd917f6b9f037edf5f046db59d3d74b9679e3dbabf87ae668eea7d324dc41495081b94e32ae54060463b8185fb41ffc1393f679f885e14d4eff00c53e03f09787ade0b7792e357b044d1ded14024ccd245b1495eb99030e06411c57b90e3454ea3a38ba0e324ececeff00869f99e3cf83f9e0aae1ab269eaaeadf8abfe47e117c27fda5be217c0abd59fc1fe34f137870ae331d8ea12c50c801ce1a307638cf660457ea77fc127bfe0b15ab7ed25e3ab6f86bf13c589f145ec6eda46b7046b6eba9ba2976825894045976862ac9b55b1b7686c6efc8bf185969fa678b754b6d22ee4d434ab7bc9a2b2ba74d8d7302b911c857b16500e3b66bd37fe09f96d7975fb747c205b012b4e3c61a63b08faf94b751b4bf87961f3ed9af7339cab0b8ac34e5522b9926d3b59ad2ff00f0e8f1b28ccf1386c4c21193716d26af74f5b69fa347dadff0727ffc944f853ff60ed43ff46c15f9975fa69ff0727ffc944f853ff60ed43ff46c15f99751c2ff00f22ba5e8ff00f4a63e26ff0091955f97fe9284ee296bf537fe0919f0dbf671f14fec8305d7c4fb6f8572f8a0eb1768cdafdd5a4779e48d9b3891836deb8ed5f507fc291fd8bbfe7cbe01ff00e07e9fff00c5d7262f8a6142b4a8ba337caed74b43b30dc2f3ad46355558ae649fde7e0957e8effc1b79ff0025fbe22ffd8bf0ff00e94ad7da1ff0a47f62eff9f2f807ff0081fa7fff00175db7c0987f66df83fe2a61f0ef50f849a2eb5aef9763b347d4ec96e2f8b38d910547dce4b91851c92462bc6cdb89638ac1cf0f1a334e4b76b4dd33d8cab872585c542bcaac5a57d3d5347e747fc1c73ff275be09ff00b14d3ff4b2e6bf3cebf433fe0e39ff0093adf04ffd8a69ff00a59735f9e75f51c39ff22da3e9fab3e6388bfe46357d57e48eabc37f1e3c73e0bd120d3347f19f8af49d3adb77956b67abdc41045b98b36d4470a32c49381c924f7ab93fed33f11eee078a5f881e36962914a3a3ebb74caca782082f8208ed5fa83ff04beff825efc0bfda2bf618f03f8cbc65e07fed8f126b1f6ffb65e7f6cea16fe7795a85cc29f2453aa0c471a2f0a338c9c924d7c87ff0580ff827fd9fec51f1c2caf7c2b6335afc3ef1643e66988d3493fd82e23004d6c647258f50ea5892439193b4d6385ceb0388c6cb04a369a6d6a959b4f5b6adf99b57ca71d43071c5f3de0d2764ddd27b5f4b791f234d2bdc4cd248ef248e4b3331c96279249ee6bdcbf614fd823c65fb70fc51b3d3748b0bbb5f0bdb4ebfdb5ae3c656dac21c82caac787988e16319249c9c28661e175fbbff00f046bfdb4ecff6a8fd982d344bc36b6fe2ff000147169ba95bc6a23fb4c38220ba5500001c2b2b01fc68c780cb57c4598e2305847570f1bf4bff002dfadbaffc311c3f80a18bc4fb3af2b5b5b7f37757feb4b9f57f863c3765e0ef0de9fa469d08b6d3f4bb68eced6104911451a844519e7850057e097fc15ebf652ff8658fdb2f5c8ec6d7ecfe1af1793aee91b102c51acac7ce8571c011cbbc05ec8538c115fbf75f1a7fc16fbf651ff8688fd8feebc41a75af9de24f872edac5b144dd24b684017710f6d8165f5cdb81dcd7e75c2f99bc2e3973bf767a3f57b3fbff0006cfbde22cbfeb382972af7a3aaf96ebeefd0fc3cf0bf88ef7c19e26d3b58d36e1ed751d2aea2bcb59d0e1a196370e8e3dc3007f0afbe7fe0b1bff000510b1fda87e08fc24f0f787e745b6d6b4d8fc55aec1136560ba21a08ed89f58dc5ce41ce7319f4afcf83498afd571197d2ad5e9e227f153bdbe6bfa68fccf0f9855a342a61e3b4ed7f97f9ec19afdc7ff008218feca07e00fec91178a752b530788be24489aa49bd36c9158a822d13e8cacd30f69c7a57e4cfec13fb31cff00b5e7ed55e14f05047fecdbab9fb5ead2ae7f73630fcf31c8fba5946c53fdf912bfa35d334cb7d174eb7b3b4822b6b4b4896186189422448a0055503800000003d2be438e332e4a71c141eb2d5fa2dbf1d7e47d570765f794b1935b68bd7afe1a7cd9f2ff00fc16b3fe5195f12ffee17ffa75b3afc0aafdf5ff0082d67fca32be25ff00dc2fff004eb675f8155d5c0dfee13ff1bffd262727197fbec3fc2bf391fa19ff0006e37fc9d6f8dbfec537ff00d2cb6af9e7fe0ac577797dff000512f8a8f7c3132eaab1a8ddbbf74b044b1773ff002cc27d3a6074afa1bfe0dc6ff93adf1b7fd8a6ff00fa596d589ff0700fecef79f0e7f6b9b7f1dc56ee746f881611319c0f952f2da358648cfa662581c13d4b37f74d6b46b461c43384b794125eba3fc9055a329e410947eccaefef6bf53e0eafe8e7fe09ed6163a77ec2df0823d3c44b6ede11d3656119e3cd7b64797f1f319f3ef9afe71abf59bfe0875ff0522f0e45f0c2cfe0d78d754b3d1b55d1e571e1dbcbb94450ea1048e5cdb176e04a8ecdb41237ab2a8195e5719e0aad7c1c67495f91ddaf2b6ff21708e2e9d2c54a151db99597adf6f99fa6d484d2e6be59ff0082917fc14b3c27fb19fc2ed62c34fd62caff00e255f5b3c1a4e956ee934b632b2e16e6e179091a643057199080a060b15fcbb0984ab89aaa8d1576ff00afb8fd1b1188a7429bab55d923ea53d68c66bf0afc35ff0005defda27420bf6ad7bc3faced1826f3438137718c9f2447f5e3bfb715f6d7fc129bfe0a75f15ff6f1f8bbab691e21f0b783ecfc39a0e9c6eafb52d320b985e399d82c110f3269172f890e38e2363c6307ddc770ae370b4a55aa38f2c77b3ff348f1f05c4983c4d45469df99f75fe573f263f6a1ff009397f889ff006336a5ff00a55257095ddfed43ff00272ff113fec66d4bff004aa4ae7be1b436971f117404bf101b19352b75b91360466332aeedd9e36e339cf6afd7283b518bf25f91f97578f362251ef27f998d457ef60f823fb1763fe3cbe027fe07e9ff00fc5d2ffc291fd8bbfe7cbe01ff00e07e9fff00c5d7ca7fae34ff00e7c4fee3e9ff00d50a9ff3fa27e0957f42ff00f04a5e7fe09e3f0aff00ec11ff00b5a4ae57fe148fec5dff003e5f00ff00f03f4fff00e2ebde3e05f88be1dcfe144d0be1c6abe12bbd1bc3d1a442cf41bd82e21d3d1cb1452b131d818abe338ce1bd0d7cf712678b1f878d38d2946cef76b4dadfa9ef64192cb035a5395452bab69f79dbd14515f147d51f21ff00c15c3fe09d537edc9f09ec351f0db41078f7c2025934e494848f5485c0325a339fbac4aab2313b436e0701cb2fe1c7c41f871e20f84de2bb9d0bc4fa2ea5a06b16676cd677f6ef04c9e876b00707b11c11c82457f5078ae5fe26fc12f077c69d305978bfc2be1ef13daa82123d534f8aec479eebbd4953eeb822beb323e2aa981a7ec2ac79a1d3baff0033e6b39e1ba78d9fb684b967d7aa7ebfe67f327a4eb377a0df25d58dd5cd95cc7f72682568e45fa30208ad7f167c59f1578f6d960d77c4be20d6a18f1b23bfd466b945c67180ec40c64fe75fbcdae7fc11e3f66df10cacf71f0bf4f8cb30622db53beb519031c08a75007b74a6e8ff00f0474fd9b34320c3f0c2c5f0dbff00d2354bfb8e7feda4edc7b74afa67c6f807ef3a72bfa47ff923e7d7086357baaa4797d5fe563f01745d12f7c49ab5bd869d67757f7d74e2382dada26965998f4555504927d00afd6fff0082347fc129b5af815e244f8adf12f4f3a778896068f40d1a520cda70914abdcce07dd94a16454eaa1d8b00d80bf77fc2afd9c3c01f0363dbe0ef05f863c32c54ab49a769b15bcb203d773aa866fc49aed6bc0ce78bea62a93a1423cb17bbead76f2f3dcf6b29e16a785a8abd6973496dd12ff33f25bfe0e4f3ff001713e14ffd83b50ffd1b057e6657f4f1e3bf837e11f8a33db4be26f0b7873c45259ab2dbb6a7a6c376d006c160a6453b41c0ce3ae0560ffc3247c29ffa263f0f7ff09cb3ff00e375be53c5d4b0784861a54db71beb7f36ccb34e17962f152c42a96e6b696ec92efe47f34b8a2bfa5aff008648f853ff0044c7e1effe13967ffc6e8ff8648f853ff44c7e1eff00e13967ff00c6ebd1ff005f28ff00cfa7f7a3cfff0052a7ff003f57ddff0004fe696bd4bf617ff93dbf83a7fea78d17ff004be0afe823fe1923e14ffd131f87bff84e59ff00f1bab1a47ecbdf0cfc3fab5adfd87c3bf02d8df58ca9716f716fa0dac52dbc88c195d196305594804107208e2b2adc714674e50f64f54d6e8d28f06ce138cfdaad1a7b7fc13f2a3fe0e393ff00195be09ffb14d3ff004b2e6bf3d2bfa74f1c7c10f05fc4ed4a2bcf12f843c2fe21bb823f2629f53d2a0bb9234c93b15a45242e49381c649ac5ff008648f853ff0044c7e1effe13967ffc6eb972be30a585c2c30f2a6db8ab5ee8eaccb85678ac4cf10aa25cdd2de56ee78cff00c114c9ff008765fc34ff00b8a7fe9d6f2bd0ff006f3fd9374ffdb43f668d7bc1774208b53913ed9a35dc83fe3cafa304c4f9ecad968dbfd891f1ce2bd53c2be11d27c0ba041a5687a5e9da36976bbbc9b3b1b64b7b78773166da88028cb331381c924f7ad1af91ad8e93c64b194b46e4e4bcaeee7d351c2463858e16a6a94545f9d958fe5c7c53e1ad43c15e26d4346d5ad26b0d5349b992cef2da51892de68d8a3a30f50c083f4af4efd873f6b3d5bf62dfda3344f1b69c25b8b385becbab59236dfed0b2723cd8bd37701949e8e8a7a6457f415e21fd9abe1cf8bb5ab9d4b56f00782753d46f1f7cf7577a1dacf3cedd3733b21663ee4d531fb23fc281ff0034c7e1effe13967ffc6ebedea71b61ead274ab516d3567a9f234b842ad2aaaad2ad669dd69ff0004eafc07e3ad2be26f82b49f116857b16a3a36b7691ded95cc79db345228656c1e4707a1e41e0e0d695ed8c3a959cd6f73145716f708639629103248a460ab03c1047041eb553c2fe13d2fc11a15be97a2e9b61a4699680882cecadd2de084162c76a200a32c49e07524d6857e7926b99f26dd0fb98dedef6e7f395ff0504fd9767fd907f6aff157838452a692971f6ed1647ff96d63312d0907f88af3193fde89abc62bfa74f1c7c0ff00057c4ed4e2bdf12f843c2fe21bc82210473ea7a541772c71825820691490b9627038c93eb58bff000c91f0a7fe898fc3dffc272cff00f8dd7e8586e398c69463569b724b5775af99f0d88e0de7ab29d3a964de8adb796e7c5fff0006f87eca63e1f7c11d63e296a76db754f1bc86cb4c67521a2d3e1721987fd75994e7da08c8eb5fa2555744d0acbc35a45b69fa759dae9f61651ac36f6d6d12c50c08a30a888a0055038000c0ab55f1599e3a58cc4cf113eafee5d17dc7d7e03071c2e1e1421d17defabf9b3e57ff0082d613ff000ecbf897ff0070bffd3ad9d7e05d7f517e2af08e93e3ad027d2b5cd2f4ed674bbadbe759df5b25c5bcdb5832ee47054e19548c8e0807b571dff0c91f0a7fe898fc3dff00c272cfff008dd7d0641c4b4f2ec3ca84e0e57937bf925fa1e1677c3d2c7d75594f96cadb5fab7dfccfcb0ff83718ff00c656f8dbfec537ff00d2cb6afd46fdacff00658f0c7ed8df05352f0578a617fb2dde26b5bb880fb469b72b9f2e7889e8c32411d195994f04d747e07f821e0bf863a94b79e1af08785fc3d773c7e4cb3e99a54169248990763346a095c807078c815d3e2bcacdb3778ac6fd728a716ad6ee9a3d3cb32c586c27d52a3e65adf4dee7f3c9fb677fc1363e26fec53afdc9d73489b57f0b09316be22d3a1692c6653f77ccea6093b14931c83b4b81b8fcfd5fd4d4f6e9750bc7222c91c8a55d1865581e0820f515e1df127fe099bf017e2cde4973acfc2ef0b7da25fbf2d842da73b9f526dda324fb9e6beab03c7568a8e2e9ddf78f5f93ff0033e6b19c189c9cb0b3b2ecff00cffe01fcff00e9df1c3c6ba468674cb4f1878a6d74d2bb7ec90eab3a418f4d81b6e3f0ae5e491a6919dd99ddce5989c9627b9afdf5ff008729feccbff44d3ff2e1d57ff926ba8f00ff00c12c3f67bf86d791dc69bf0afc352cb17dd3a90975303df172f20cfbf5aed7c6f808a6e9d395fd22bf53917086366d2ab5236f56ff00447e1e7ecadfb10fc48fdb1bc55169fe0bf0fdcdc5909425deaf708d169b603b99262319032762ee73838535fbb3fb09fec55e1dfd863e075af8574765bed4ae1fed5aceaaf1ec9753b92305b1ced8d47ca899f940c9cb3331f62d374bb6d174f86d2cede0b4b5b75091430c6238e251d02a8e00f6153e2be473be24af982f676e5876efeacfa8ca320a181f7d3e69bebfe4ba1fcce7ed427fe325fe227fd8cda97fe95495c2e2bfa60d43f657f861ab5fcf7575f0e3c07757575234b34d2f87ed1e495d8e59998c7924924927926a2ff8648f853ff44c7e1eff00e13967ff00c6ebe969f1cd18c147d93d177478157836739b9fb55abbedff0004fe6968afe96bfe1923e14ffd131f87bff84e59ff00f1ba3fe1923e14ff00d131f87bff0084e59fff001babff005f28ff00cfa7f7a33ff52a7ff3f57ddff04fe696bf537fe0da2fbdf1abfee07ffb91afd0dff8648f853ff44c7e1eff00e13967ff00c6eba1f01fc23f0a7c2cfb57fc231e18f0f7873eddb3ed3fd97a74367f68d9bb66ff002d5776ddcd8cf4dc71d4d7999c716d3c6e0e7868d369cadadfb34ff43d0caf85e784c54710ea5f96fa5bba6bbf99d0d14515f0e7d81fffd9, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE IF NOT EXISTS `envios` (
  `id_envio` int(10) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `ultimo_envio` varchar(10) NOT NULL,
  PRIMARY KEY (`id_envio`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envio`, `fecha`, `ultimo_envio`) VALUES
(1, '2014-08-20', '2010-06-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE IF NOT EXISTS `equipos` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `descripcion`, `fecha_ingreso`, `fecha_baja`, `fecha_garantia`, `marca`, `codigo`, `ubicacion`, `id_empresa`, `id_sector`, `id_hubicacion`, `id_grupo`, `id_customer`, `id_criticidad`, `estado`, `fecha_ultimalectura`, `ultima_lectura`, `tipo_horas`, `id-centrodecosto`, `valor_reposicion`, `fecha_reposicion`, `id_proveedor`, `valor`, `comprobante`, `descrip_tecnica`, `id_unidad`, `id_area`, `id_proceso`, `numero_serie`) VALUES
(1, 'Perforadora Ranger 500', '0000-00-00', '0000-00-00', '0000-00-00', 'TamRock', 'EMPER001', 'La Laja', 6, 10, 0, 2, 13, 1, 'AN', '0000-00-00 00:00:00', 1000, '', 0, 0, '0000-00-00', 0, 0, '', '', 11, 3, 8, 11111),
(3, 'Cargadora WA250', '2018-09-02', '0000-00-00', '2018-09-29', 'Komatsu', 'EMCAR003', '0', 6, 12, 0, 1, 14, 1, 'AN', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 8, 11111),
(4, 'Autoelevador 01', '0000-00-00', '0000-00-00', '0000-00-00', 'Toyota', 'EMAUT001', 'La Laja', 6, 10, 0, 3, 15, 2, 'AN', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 8, 11111),
(5, 'Perforadora 680', '0000-00-00', '0000-00-00', '0000-00-00', 'TamRock', 'EMPER002', 'La Laja', 6, 11, 0, 2, 16, 1, 'RE', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 11, 3, 8, 11111),
(7, 'este equipo es una pruba', '2018-08-11', '0000-00-00', '2018-08-10', 'Black & Decker', 'AIR000507', '4444', 6, 11, 0, 3, 17, 9, 'AN', '2018-08-17 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', 'dasdsadsadsa', 2, 10, 9, 2234444),
(8, 'este equipo es una pruebaaaaa', '2018-08-11', '0000-00-00', '2018-08-10', 'Black & Decker', 'AIR000507', '4444', 6, 13, 0, 1, 18, 9, 'AN', '2018-08-17 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', 'dasdsadsadsa', 11, 10, 9, 2234444),
(9, 'PERFONADORA TOYOTA', '2018-09-16', '0000-00-00', '2018-09-22', 'Toyota', 'MT666', '0', 6, 12, 0, 2, 18, 10, 'AC', '2018-09-14 00:00:00', 1540, '', 0, 0, '0000-00-00', 0, 0, '', 'sdfgdfdfg', 6, 10, 9, 123),
(10, 'Descrip', '2018-09-08', '0000-00-00', '2018-09-29', 'Toyota', 'Cod12-2018', '13456,46123', 6, 12, 0, 2, 15, 3, 'AN', '2018-09-07 00:00:00', 20, '', 0, 0, '0000-00-00', 0, 0, '', 'gfhfdgdhhfh', 6, 3, 7, 123),
(11, 'Perforadora Drilltech Tamrock 500', '2018-09-17', '0000-00-00', '2018-09-17', 'DRILLTECH', 'EMPER11', '0', 7, 14, 0, 5, 20, 11, 'AN', '2018-09-17 00:00:00', 5, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 12, 11, 23344),
(13, 'Perforadora DM45', '2018-01-01', '0000-00-00', '0000-00-00', 'Atlas Copco', '901', '0', 7, 15, 0, 7, 20, 11, 'AC', '2018-09-18 00:00:00', 8000, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 13, 8614),
(14, 'Perforadora DM 45', '0000-00-00', '0000-00-00', '0000-00-00', 'Atlas Copco', '903', '0', 7, 15, 0, 7, 20, 11, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 13, 6052),
(15, 'Pantera DP 1500', '0000-00-00', '0000-00-00', '0000-00-00', 'Sandvik', '905', '0', 7, 15, 0, 8, 20, 11, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 11, 12),
(16, 'Roc L8-30', '0000-00-00', '0000-00-00', '0000-00-00', 'DRILLTECH', '906', '0', 7, 15, 0, 9, 20, 11, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 11, 10),
(17, 'descrip', '0000-00-00', '0000-00-00', '0000-00-00', 'Bahco', '123456789', 'La Laja', 6, 10, 0, 1, 13, 10, 'AN', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 3, 4, 2222222222),
(18, 'Equipo de prueba', '2018-10-19', '0000-00-00', '2018-10-30', 'Toyota', '123456789', '0', 6, 16, 0, 11, 19, 9, 'AN', '2018-10-25 00:00:00', 22, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 10, 4, 123456789),
(19, 'equipo de prueba', '2018-10-17', '0000-00-00', '2018-10-31', 'Bahco', 'cod-1810', '666,999', 6, 10, 0, 3, 14, 2, 'AC', '2018-10-17 00:00:00', 22, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 3, 8, 18102018);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fallas`
--

CREATE TABLE IF NOT EXISTS `fallas` (
  `id_reparacion` int(100) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_reparacion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `fallas`
--

INSERT INTO `fallas` (`id_reparacion`, `descripcion`) VALUES
(1, 'Reparación por falla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_equipo`
--

CREATE TABLE IF NOT EXISTS `ficha_equipo` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `ficha_equipo`
--

INSERT INTO `ficha_equipo` (`id_fichaequip`, `id_equipo`, `marca`, `modelo`, `numero_motor`, `numero_serie`, `fecha_ingreso`, `dominio`, `fabricacion`, `peso`, `bateria`, `hora_lectura`) VALUES
(1, 4, '1011', '1012', '1013', '1010', '2017-07-09', 'nose1010', 0, 10, '10', 1),
(2, 242, 'marca12', '12m', '120', '1212', '2017-07-10', 'fefe', 1980, 10, '10', 1),
(3, 0, 'nuevo modelo 5051', '5051ng', '5051', '5051', '2017-07-10', '5051', 1950, 51, '510', 1),
(4, 0, 'marca pepe 14145', 'nuevo pepe 14145', '14150', '14145', '2017-07-10', '14', 1914, 14, '14', 1),
(5, 242, 'nuevo gm 6061', '6061 mgpepe', '60610', '6061', '2017-07-10', '6061', 1960, 61, '60', 1),
(6, 242, '8081p', '80812', '80813', '8081', '2017-07-10', '80814', 1983, 80, '81', 0),
(7, 339, '5252 marca', '5252 marca', '1212', '5252', '2017-07-12', ' gemma', 1989, 12, '20', 0),
(8, 11, 'cat', '3512', '123345', '0001', '2018-01-30', 'lwo070', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `id_grupo` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `descripcion`, `estado`, `id_empresa`) VALUES
(1, 'Carguio', 'AC', 6),
(2, 'Perforación ', 'AC', 6),
(3, 'Auxiliares', 'AC', 6),
(4, 'grupo test02', 'AN', 6),
(5, 'Perforadoras', 'AC', 7),
(6, 'Perforadora Rotary', 'AC', 6),
(7, 'Perforadora Rotary', 'AC', 7),
(8, 'Perforadora Top Hammer', 'AC', 7),
(9, 'Perforadora DTH', 'AC', 7),
(10, 'grupo test 2018/09', 'AN', 6),
(11, 'NUEVO', 'AN', 6),
(12, 'grupo test 003', 'AN', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE IF NOT EXISTS `herramientas` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=114 ;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`herrId`, `herrcodigo`, `herrmarca`, `modid`, `tipoid`, `equip_estad`, `herrdescrip`, `depositoId`, `id_empresa`) VALUES
(2, 'SW80', 'Robust', 1, NULL, 'AC', 'Taladro', 1, 6),
(4, 'HR-TT-Organizador Tornillos', 'Organizador tornillos - Stanley', 1, NULL, 'AC', 'HR-TT-Organizador Tornillos', 1, 6),
(5, 'HR-TT-Escalera 7 peldaños', 'Escalera 7 peldaño - Ayinco', 1, NULL, 'AC', 'HR-TT-Escalera 7 peldaños', 1, 6),
(6, 'HR-TT-Mascara facial', 'Mascara facial', 2, NULL, 'AC', 'HR-TT-Mascara facial', 1, 6),
(7, 'HR-TT-Prot Audit-Vincha', 'Protector auditivo copa tipo vincha', 1, NULL, 'AC', 'HR-TT-Prot Audit-Vincha', 1, 6),
(8, 'HR-TT-Llave combinada 10mm', 'Llave combinada 10mm', 3, NULL, 'TR', 'HR-TT-Llave combinada 10mm', 1, 6),
(9, 'HR-TT-Llave combinada 13mm', 'Llave combinada 13mm', 1, NULL, 'AC', 'HR-TT-Llave combinada 13mm', 1, 6),
(10, 'HR-TT-Llave combinada 15mm', 'Llave combinada 13mm', 1, NULL, 'AC', 'HR-TT-Llave combinada 15mm', 1, 6),
(11, 'HR-TT-Llave combinada 17mm', 'Llave combinada 17mm', 1, NULL, 'AC', 'HR-TT-Llave combinada 17mm', 1, 6),
(12, 'HR-TT-Llave combinada 7/16"', 'Llave combinada 7/16"', 1, NULL, 'AC', 'HR-TT-Llave combinada 7/16"', 1, 6),
(13, 'HR-TT-Llave combinada 9/16"', 'Llave combinada 9/16"', 1, NULL, 'AC', 'HR-TT-Llave combinada 9/16"', 1, 6),
(14, 'HR-TT-Destornillador de puño philips', 'Destornillador de puño philips - Bulit', 1, NULL, 'AC', 'HR-TT-Destornillador de puño philips', 1, 6),
(15, 'HR-TT-Llave Francesa 30mm', 'Llave Francesa 30mm', 1, NULL, 'AC', 'HR-TT-Llave Francesa 30mm', 1, 6),
(16, 'HR-TT-Cinta métrica de 5 m ', 'Cinta métrica de 5 m ', 1, NULL, 'AC', 'HR-TT-Cinta métrica de 5 m ', 1, 6),
(17, 'HR-OFA-Linterna', 'Linterna', 1, NULL, 'AC', 'HR-OFA-Linterna', 1, 6),
(18, 'HR-OFA-Arco de sierra', 'Arco de sierra', 1, NULL, 'AC', 'HR-OFA-Arco de sierra', 1, 6),
(19, 'HR-OFA-Extractor de poleas 150 mm', 'Extractor de poleas 150 mm', 1, NULL, 'AC', 'HR-OFA-Extractor de poleas 150 mm', 1, 6),
(20, 'HR-OFA-Alargues', 'Alargues', 1, NULL, 'AC', 'HR-OFA-Alargues', 1, 6),
(21, 'HR-OFE-Espatula chica', 'Espatula chica', 1, NULL, 'AC', 'HR-OFE-Espatula chica', 1, 6),
(22, 'HR-OFE-Espatulas medianas', 'Espatulas medianas', 1, NULL, 'AC', 'HR-OFE-Espatulas medianas', 1, 6),
(23, 'HR-OFE-Barretines de 0,80 y 0,90 negro, naranja', 'barretines de 0,80 y 0,90 negro, naranja', 1, NULL, 'AC', 'HR-OFE-Barretines de 0,80 y 0,90 negro, naranja', 1, 6),
(24, 'HR-OFE-Arnés', 'Arnés', 1, NULL, 'AC', 'HR-OFE-Arnés', 1, 6),
(25, 'HR-OFE-Llanas', 'Llanas', 1, NULL, 'AC', 'HR-OFE-Llanas', 1, 6),
(26, 'HR-OFE-Llana dentada', 'Llana dentada', 1, NULL, 'AC', 'HR-OFE-Llana dentada', 1, 6),
(27, 'HR-OFE-Balde de Albañil', 'Balde de Albañil', 1, NULL, 'AC', 'HR-OFE-Balde de Albañil', 1, 6),
(28, 'HR-OFE-Anchada', 'Anchada', 1, NULL, 'AC', 'HR-OFE-Anchada', 1, 6),
(29, 'HR-OFE-Bota de goma', 'Bota de goma', 1, NULL, 'AC', 'HR-OFE-Bota de goma', 1, 6),
(30, 'HR-ODE-Boquilla para termofusión 1"', 'Boquilla para termofusión 1"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1"', 1, 6),
(31, 'HR-ODE-Boquilla para termofusión 4"', 'Boquilla para termofusión 4"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 4"', 1, 6),
(32, 'HR-ODE-Boquilla para termofusión 2,5"', 'Boquilla para termofusión 2,5"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 2,5"', 1, 6),
(33, 'HR-ODE-Boquilla para termofusión 80mm', 'Boquilla para termofusión 80mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 80mm', 1, 6),
(34, 'HR-ODE-Boquilla para termofusión 2"', 'Boquilla para termofusión 2"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 2"', 1, 6),
(37, 'HR-ODE-Boquilla para termofusión 3/4"', 'Boquilla para termofusión 3/4"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 3/4"', 1, 6),
(38, 'HR-ODE-Boquilla para termofusión 1/2"', 'Boquilla para termofusión 1/2"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1/2"', 1, 6),
(39, 'HR-ODE-Termofusora 1', 'Termofusora 1', 1, NULL, 'AC', 'HR-ODE-Termofusora 1', 1, 6),
(40, 'HR-ODE-Termofusora 1600w', 'Termofusora 1600w', 1, NULL, 'AC', 'HR-ODE-Termofusora 1600w', 1, 6),
(41, 'HR-ODE-Boquilla para termofusión 75mm', 'Boquilla para termofusión 75mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 75mm', 1, 6),
(42, 'HR-ODE-Boquilla para termofusión 90mm', 'Boquilla para termofusión 90mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 90mm', 1, 6),
(43, 'HR-ODE-Boquilla para termofusión 110mm', 'Boquilla para termofusión 110mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 110mm', 1, 6),
(44, 'HR-OVI-TermoAnemómetro ', 'TermoAnemómetro ', 1, NULL, 'AC', 'HR-OVI-TermoAnemómetro ', 1, 6),
(45, 'HR-OVI-Termometro infrarojo', 'Termometro infrarojo', 1, NULL, 'AC', 'HR-OVI-Termometro infrarojo', 1, 6),
(46, 'HR-OVI-Pinza extractora de fusible NH', 'Pinza extractora de fusible NH', 1, NULL, 'AC', 'HR-OVI-Pinza extractora de fusible NH', 1, 6),
(47, 'HR-OVI-Pinza amperometrica con puntas', 'Pinza amperometrica con puntas', 1, NULL, 'AC', 'HR-OVI-Pinza amperometrica con puntas', 1, 6),
(48, 'HR-OVI- Soldador Cautín 30w', 'Soldador Cautín 30w', 1, NULL, 'AC', 'HR-OVI- Soldador Cautín 30w', 1, 6),
(49, 'HR-OFE-Multimetro con puntas', 'Multimetro con puntas', 1, NULL, 'AC', 'HR-OFE-Multimetro con puntas', 1, 6),
(50, 'HR-TTA-Pértiga DPA 3 KV', 'Pértiga DPA 3 KV', 1, NULL, 'AC', 'HR-TTA-Pértiga DPA 3 KV', 1, 6),
(51, 'HR-OVI-Detector de metál ', 'Detector de metál ', 1, NULL, 'AC', 'HR-OVI-Detector de metál ', 1, 6),
(52, 'HR-OVI-Programador de variador vel.', 'Programador de variador vel.', 1, NULL, 'AC', 'HR-OVI-Programador de variador vel.', 1, 6),
(53, 'HR-OVI-Pinza amp con puntas', 'Pinza amp con puntas', 1, NULL, 'AC', 'HR-OVI-Pinza amp con puntas', 1, 6),
(54, 'HR-OFA-Caja de llaves tubos medidas chicas(completa)', 'Caja de llaves tubos medidas chicas(completa)', 1, NULL, 'AC', 'HR-OFA-Caja de llaves tubos medidas chicas(completa)', 1, 6),
(55, 'HR-OFA-Caja de llaves tubos medidas grandes(completa)', 'Caja de llaves tubos medidas grandes(completa)', 1, NULL, 'AC', 'HR-OFA-Caja de llaves tubos medidas grandes(completa)', 1, 6),
(56, 'HR-OFA-Caja de mechas(12,16,20mm y 1/2")', 'Caja de mechas(12,16,20mm y 1/2")', 1, NULL, 'AC', 'HR-OFA-Caja de mechas(12,16,20mm y 1/2")', 1, 6),
(57, 'HR-OFA-Amoladora 4,5" 840w 9557 HP', 'Amoladora 4,5" 840w 9557 HP', 1, NULL, 'TR', 'HR-OFA-Amoladora 4,5" 840w 9557 HP', 1, 6),
(58, 'HR-OFA-Llave Stillson 36"', 'Llave Stillson 36"', 1, NULL, 'AC', 'HR-OFA-Llave Stillson 36"', 1, 6),
(59, 'HR-OFA-Pistola de calor', 'Pistola de calor', 1, NULL, 'AC', 'HR-OFA-Pistola de calor', 1, 6),
(60, 'HR-OFA-Serrucho 24"', 'Serrucho 24"', 1, NULL, 'AC', 'HR-OFA-Serrucho 24"', 1, 6),
(61, 'HR-OFA-Atornillador ? 13 con bateria ', 'Atornillador ? 13 con bateria ', 1, NULL, 'AC', 'HR-OFA-Atornillador ? 13 con bateria ', 1, 6),
(63, 'HR-OFA-Atornillador  13 con bateria ', 'Atornillador  13 con bateria ', 1, NULL, 'AC', 'HR-OFA-Atornillador  13 con bateria ', 1, 6),
(64, 'HR-OFA-Llave Inglesa 22"', 'Llave Inglesa 22"', 1, NULL, 'AC', 'HR-OFA-Llave Inglesa 22"', 1, 6),
(65, 'HR-OFA-Rotomartillo con mandril y llave', 'Rotomartillo con mandril y llave', 1, NULL, 'AC', 'HR-OFA-Rotomartillo con mandril y llave', 1, 6),
(66, 'HR-ODE-Extractor de poleas 400 mm', 'Extractor de poleas 400 mm', 1, NULL, 'AC', 'HR-ODE-Extractor de poleas 400 mm', 1, 6),
(67, 'HR-OFE-Espatulas grandes', 'Espatulas grandes', 1, NULL, 'AC', 'HR-OFE-Espatulas grandes', 1, 6),
(68, 'HR-OFE-Soplete para colocar membrana', 'Soplete para colocar membrana', 1, NULL, 'AC', 'HR-OFE-Soplete para colocar membrana', 1, 6),
(69, 'HR-OFE-Cola de vida ', 'Cola de vida ', 1, NULL, 'AC', 'HR-OFE-Cola de vida ', 1, 6),
(73, 'HR-OFE-Serrucho para corte en durlock', 'Serrucho para corte en durlock', 1, NULL, 'AC', 'HR-OFE-Serrucho para corte en durlock', 1, 6),
(74, 'HR-OFE-Llana de durlock', 'Llana de durlock', 1, NULL, 'AC', 'HR-OFE-Llana de durlock', 1, 6),
(75, 'HR-OFE-Fratacho', 'Fratacho', 1, NULL, 'TR', 'HR-OFE-Fratacho', 1, 6),
(76, 'HR-OFE-Cortafierro', 'Cortafierro', 1, NULL, 'AC', 'HR-OFE-Cortafierro', 1, 6),
(77, 'HR-OFE-Mazo mediano', 'Mazo mediano', 1, NULL, 'AC', 'HR-OFE-Mazo mediano', 1, 6),
(78, 'HR-OFE-Cuchara mediana de albañil', 'Cuchara mediana de albañil', 1, NULL, 'AC', 'HR-OFE-Cuchara mediana de albañil', 1, 6),
(79, 'HR-OFE-Cuchara grande de albañil', 'Cuchara grande de albañil', 1, NULL, 'AC', 'HR-OFE-Cuchara grande de albañil', 1, 6),
(80, 'HR-OFE-Chocla', 'Chocla', 1, NULL, 'AC', 'HR-OFE-Chocla', 1, 6),
(81, 'HR-OFE-Martelina', 'Martelina', 1, NULL, 'AC', 'HR-OFE-Martelina', 1, 6),
(82, 'HR-OFE-Bomba de combustible', 'Bomba de combustible', 1, NULL, 'AC', 'HR-OFE-Bomba de combustible', 1, 6),
(83, 'HR-OFE-Grasera', 'Grasera', 1, NULL, 'AC', 'HR-OFE-Grasera', 1, 6),
(86, 'A-Hormigonera', 'azul', 1, NULL, 'AC', 'A-Hormigonera', NULL, 6),
(87, 'w80', '989', 1, NULL, 'AC', 'w80', NULL, 6),
(89, 'HVLL-TT-MANIFOLD', '', 1, NULL, 'AC', 'MANOMETRO DE GASES REFRIGERANTE', 2, 6),
(90, 'HVLL-TT', 'SSP', 1, NULL, 'AC', 'Agujereadora de mano eléctrica 13 mm con percutor', 3, 6),
(91, '2334343242', 'ssss', 0, NULL, 'AC', 'Taladro', 1, 6),
(93, '1001', 'IRIMO', -1, NULL, 'AC', 'Caja de tubos 3/4´', 0, 7),
(94, '', '', -1, NULL, 'AC', '', -1, 6),
(96, 'CJ 02 ', 'COMPLETA ', 23, NULL, 'AC', 'CAJA DE HERRAMIENTAS ', 4, 7),
(97, 'CJ 03', 'ENCASTRE 3/4 ', 24, NULL, 'AC', 'CAJA DE TUBOS ', 4, 7),
(98, 'CJ O4 ', 'PLASTICA CHICA ', 33, NULL, 'AC', 'CAJA DE HERRAMIENTAS ', 4, 7),
(99, 'CJ 05 ', 'ALTA Y BAJA ', 32, NULL, 'AC', 'CAJA CON MANOMETROS DE CARGA DE A/C', 4, 7),
(100, 'LLVF 01', '450MM', 35, NULL, 'AC', 'LLAVE FRANCESA', 4, 7),
(101, 'LLST 01', 'PINZA ', 35, NULL, 'AC', ' STILSON ', 4, 7),
(102, 'PNZ 01', 'PINNZA', 30, NULL, 'AC', 'PINZA PICO DE LORO ', 4, 7),
(103, 'LLIN 01', 'REGULABLE', 20, NULL, 'AC', 'LLAVE INGLESA', 4, 7),
(105, 'LLCO 01', 'COMBINADA 36MM', 20, NULL, 'AC', 'LLAVE ', 4, 7),
(106, 'MF 01 ', 'ENCASTRE 1/2 ', 35, NULL, 'AC', 'MANGO DE FUERZA ', -1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_lecturas`
--

CREATE TABLE IF NOT EXISTS `historial_lecturas` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

--
-- Volcado de datos para la tabla `historial_lecturas`
--

INSERT INTO `historial_lecturas` (`id_lectura`, `id_equipo`, `lectura`, `fecha`, `usrId`, `observacion`, `operario_nom`, `turno`, `estado`) VALUES
(1, 1, 150, '2017-11-27 04:24:41', 3, 'too ok', 'pepe', 'tarde', 'AC'),
(2, 1, 56, '2017-11-27 04:29:15', 3, 'todo normal', 'ruben', 'noche', 'AC'),
(3, 1, 20, '2017-11-28 10:48:21', 3, 'normal', 'juan', 'mañana', 'AC'),
(7, 1, 4545, '2017-11-30 06:08:35', 3, 'todo ok', 'pedrito', 'manana', 'RE'),
(6, 1, 333, '2017-11-30 08:28:29', 3, 'bateria baja', 'roberto', 'manana', 'AC'),
(8, 1, 999999, '2017-11-30 10:09:43', 3, 'rotura llanta', 'roberto', 'tarde', 'RE'),
(9, 1, 454545, '2017-11-30 11:11:09', 3, 'reparado', 'juan', 'mañana', 'RE'),
(10, 1, 23333, '2017-12-06 08:27:03', 1, 'dadasd', 'dsadad', '333', 'AC'),
(11, 1, 1000, '2017-12-18 07:41:04', 1, 'sdfdsfs', 'fsdf', 'fdsfds', 'RE'),
(12, 0, 333, '2017-12-18 07:41:54', 1, 'dsfdsf', '333', 'erwrw', 'AC'),
(13, 0, 0, '2017-12-18 08:00:03', 1, '', '', '', 'AC'),
(14, 1, 0, '2017-12-26 02:05:21', 1, '', '', '', 'AC'),
(15, 1, 0, '2017-12-26 02:05:31', 1, '', '', '', 'RE'),
(16, 0, 0, '2017-12-26 02:05:39', 1, '', '', '', 'AC'),
(17, 1, 0, '2018-01-12 16:09:58', 1, '', '', '', 'AC'),
(18, 2, 200, '2018-01-15 16:12:57', 3, 'cambio estado test', 'juan perez', 'mañana', 'RE'),
(19, 2, 300, '2018-01-15 16:13:35', 3, 'reparado', 'jose de los palotes', 'tarde', 'RE'),
(20, 2, 400, '2018-01-15 16:14:15', 3, 'activado nuevamente', 'pepe ponce', 'noche', 'AC'),
(21, 5, 0, '2018-01-17 12:01:37', 1, '', '', '', 'RE'),
(22, 9, 344, '2018-01-17 12:07:12', 1, 'weqeqwe', 'wewqe', 'qweqe', 'RE'),
(23, 11, 2000, '2018-01-26 17:14:48', 1, 'no operativo', 'rs', 'mañana', 'AC'),
(24, 11, 2010, '2018-01-26 17:19:56', 1, 'operarico', 'rs', 'mañana', 'AC'),
(60, 7, 0, '2018-09-03 04:55:43', 1, '', '', '', 'AC'),
(59, 7, 0, '2018-09-03 04:46:40', 1, '', '', '', 'RE'),
(58, 7, 0, '2018-09-03 04:31:54', 1, '', '', '', 'RE'),
(57, 2, 666, '2018-09-01 08:57:16', 1, '666', '666', '666', 'AC'),
(56, 8, 555, '2018-09-01 08:54:45', 1, '555', '555', '555', 'AC'),
(33, 10, 0, '2018-03-06 13:10:52', 1, '', '', '', 'RE'),
(34, 10, 0, '2018-03-06 13:11:44', 1, '', '', '', 'AC'),
(35, 10, 0, '2018-03-09 12:57:53', 1, '', '', '', 'RE'),
(36, 9, 122, '2018-03-21 13:23:05', 3, 'se rompio', 'juan', 'mañana', 'RE'),
(37, 10, 34, '2018-03-21 13:24:21', 3, 'agfgadf', 'ya', 'a', 'RE'),
(38, 4, 0, '2018-03-22 11:04:05', 3, '', '', '', 'RE'),
(39, 4, 0, '2018-03-22 11:04:43', 3, '', '', '', 'RE'),
(40, 4, 150, '2018-05-24 12:58:46', 3, 'sarasa', 'Hugo', 'mañana', 'AC'),
(41, 4, 500, '2018-06-19 15:42:25', 3, 'se rompio', 'yop', 'mañana', 'RE'),
(42, 4, 486, '2018-06-19 15:55:46', 3, 'todo ok', 'hugo g', 'tarde', 'AC'),
(43, 4, 0, '2018-07-03 15:38:49', 1, '', '', '', 'RE'),
(44, 3, 0, '2018-07-03 15:39:24', 1, '', '', '', 'RE'),
(45, 2, 0, '2018-07-03 21:15:48', 1, '', '', '', 'RE'),
(46, 3, 0, '2018-07-03 21:16:03', 1, '', '', '', 'RE'),
(47, 4, 0, '2018-07-05 09:47:32', 1, '', '', '', 'AC'),
(48, 1, 0, '2018-07-06 09:34:40', 1, '', '', '', 'RE'),
(49, 1, 23, '2018-07-27 03:05:45', 1, 'saddad', 'sadadsa', 'dsad', 'RE'),
(50, 1, 234, '2018-08-11 05:50:38', 1, 'dsadas', '445', '444', 'RE'),
(51, 1, 0, '2018-08-21 23:46:15', 1, '', '', '', 'RE'),
(52, 1, 0, '2018-09-01 03:29:28', 1, 'asdadas', 'sdaddasds', 'dddd', 'RE'),
(53, 1, 3333, '2018-09-01 03:29:51', 1, 'dsadsa', '33', '333', 'RE'),
(54, 8, 123, '2018-09-01 08:34:17', 1, '123', '123', '123', 'RE'),
(55, 4, 234, '2018-09-01 08:35:56', 1, '234', '234', '234', 'RE'),
(61, 2, 34, '2018-09-13 04:05:12', 1, 'wqeqwe', 'weqe', '34', 'RE'),
(62, 10, 12, '2018-09-16 04:40:29', 1, 'lalala', 'perez', 'noche', ''),
(63, 13, 5000, '2018-09-24 18:22:13', 16, 'rompio la maquina ese hdp', 'javier molina', 'dia', ''),
(64, 3, 2, '2018-09-24 18:55:36', 1, '2', '2', '2', 'RE'),
(65, 3, 3, '2018-09-24 18:56:42', 1, '3', '3', '3', 'AC'),
(66, 3, 12, '2018-09-24 19:03:49', 1, '12', '12', '12', 'RE'),
(67, 3, 32, '2018-09-24 19:06:54', 1, '32', '32', '32', 'RE'),
(68, 3, 12, '2018-09-24 19:10:02', 1, '12', '12', '12', 'AC'),
(69, 3, 23, '2018-09-24 19:10:13', 1, '23', '23', '23', 'RE'),
(70, 3, 0, '2018-09-24 19:10:17', 1, '', '', '', 'RE'),
(71, 3, 0, '2018-09-24 19:14:55', 1, '', '', '', 'AC'),
(72, 3, 0, '2018-09-24 19:15:02', 1, '', '', '', 'RE'),
(73, 13, 0, '2018-09-24 19:15:46', 19, '', '', '', 'RE'),
(74, 3, 0, '2018-09-25 09:43:34', 1, '', '', '', 'AC'),
(75, 3, 0, '2018-09-25 09:45:45', 1, '', '', '', 'AC'),
(76, 3, 0, '2018-09-25 09:45:52', 1, '', '', '', 'AC'),
(77, 3, 0, '2018-09-25 09:46:13', 1, 'nuevaaaaaaa', '', '', 'AC'),
(78, 3, 122, '2018-09-25 09:53:57', 1, '', 'Pablo Paz', '', 'AC'),
(79, 3, 0, '2018-09-25 17:43:04', 1, '', '', '', 'AC'),
(80, 3, 0, '2018-09-25 17:43:13', 17, '', '', '', 'AC'),
(81, 9, 2, '2018-10-01 09:26:48', 1, '2', '2', '2', 'RE'),
(82, 9, 3, '2018-10-01 09:32:32', 1, '3', '3', '3', 'AC'),
(83, 18, 3, '2018-10-03 23:09:32', 1, '3', '3', '3', 'RE'),
(84, 5, 1111111, '2018-10-05 10:46:36', 1, 'wwwwwwwwww', 'Pablo Paz', 'Mañana', 'AC'),
(85, 5, 5670, '2018-10-05 16:12:14', 19, 'Fuga de aceite', 'R. Sánchez', 'Mañana', 'RE'),
(86, 15, 11, '2018-10-08 08:59:36', 18, 'falta agua', 'dede', 'd', 'RE'),
(87, 15, 0, '2018-10-08 09:01:27', 18, 'gg', 'll', 'd', 'AC'),
(88, 5, 11, '2018-10-08 11:44:54', 1, 'nueva lectura', 'Pablo Paz', 'Mañana', 'RE'),
(89, 5, 45, '2018-10-08 11:47:04', 1, 'sdakdhka', 'juan perez', '34', 'RE'),
(90, 5, 12, '2018-10-08 11:48:11', 1, 'nuevo ', 'Pablo Paez', 'Tarde', 'RE'),
(91, 13, 0, '2018-10-09 12:17:37', 18, 'Cambio de válvula de pilotaje, falta conector ', 'admin', 'b', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infocomponentes`
--

CREATE TABLE IF NOT EXISTS `infocomponentes` (
  `infocompid` int(11) NOT NULL AUTO_INCREMENT,
  `infocompdescrip` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`infocompid`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infoequipos`
--

CREATE TABLE IF NOT EXISTS `infoequipos` (
  `infoid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`infoid`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacionequipo`
--

CREATE TABLE IF NOT EXISTS `informacionequipo` (
  `id_informacion` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_informacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1088 ;

--
-- Volcado de datos para la tabla `informacionequipo`
--

INSERT INTO `informacionequipo` (`id_informacion`, `titulo`, `descripcion`, `id_equipo`, `id_empresa`) VALUES
(1081, 'titulo 1', 'descr 1', 51, 6),
(1082, 'titulo 2', 'desc 2', 51, 6),
(1083, 'titulo3', 'desc3', 52, 6),
(1084, '0101', '0101', 12, 6),
(1085, '666', '666', 13, 6),
(1086, 'aaaa', 'aaaa aaaa', 10, 6),
(1087, 'bbbb', 'bbbb bbbb', 10, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcasequipos`
--

CREATE TABLE IF NOT EXISTS `marcasequipos` (
  `marcaid` int(11) NOT NULL AUTO_INCREMENT,
  `marcadescrip` varchar(255) DEFAULT NULL,
  `estado` varchar(3) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`marcaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `marcasequipos`
--

INSERT INTO `marcasequipos` (`marcaid`, `marcadescrip`, `estado`, `id_empresa`) VALUES
(1, 'TamRock', 'AC', 6),
(2, 'Black & Decker', 'AC', 6),
(3, 'Bahco', 'AC', 6),
(4, 'Caterpillar', 'AC', 6),
(5, 'Komatsu', 'AC', 6),
(6, 'Toyota', 'AC', 6),
(7, 'Cathh', 'AN', 6),
(8, 'test', 'AN', 6),
(9, '666', 'AN', 6),
(10, 'DRILLTECH', 'AN', 7),
(11, 'Atlas Copco', 'AC', 6),
(12, 'Atlas Copco', 'AC', 7),
(13, 'Sandvik', 'AC', 7),
(14, 'Soosan', 'AC', 7),
(15, 'Caterpillar', 'AC', 7),
(16, 'Parquer', 'AC', 7),
(17, 'Deninson', 'AC', 7),
(18, 'Rexvrock', 'AC', 7),
(19, 'SNAP ON', 'AC', 7),
(20, 'WILLIAMS ', 'AC', 7),
(21, 'GEDORE ', 'AC', 7),
(22, 'MOTOROLA ', 'AC', 7),
(23, 'REDLINE', 'AC', 7),
(24, 'IRIMO ', 'AC', 7),
(25, 'FLUKE ', 'AC', 7),
(26, 'ANDES SAM ', 'AC', 7),
(27, 'STANLEY ', 'AC', 7),
(28, 'CROSS MASTER ', 'AC', 7),
(29, 'BULIT ', 'AC', 7),
(30, 'TRUPER', 'AC', 7),
(31, 'HP ', 'AC', 7),
(32, 'S-M ', 'AC', 7),
(33, 'TACTIX ', 'AC', 7),
(34, 'UTUSTOOLS', 'AC', 7),
(35, 'BAHCO', 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_año`
--

CREATE TABLE IF NOT EXISTS `modelo_año` (
  `id_año` int(100) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(10) NOT NULL,
  PRIMARY KEY (`id_año`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `modelo_año`
--

INSERT INTO `modelo_año` (`id_año`, `descripcion`) VALUES
(1, 'wqeqewqeqw');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_insumos`
--

CREATE TABLE IF NOT EXISTS `orden_insumos` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `solicitante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destino` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comprobante` int(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_ot` int(11) NOT NULL,
  PRIMARY KEY (`id_orden`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=55 ;

--
-- Volcado de datos para la tabla `orden_insumos`
--

INSERT INTO `orden_insumos` (`id_orden`, `fecha`, `solicitante`, `destino`, `comprobante`, `id_empresa`, `id_ot`) VALUES
(1, '2017-11-13', 'edsfsdfs', NULL, 43434, 6, 0),
(2, '0000-00-00', '3', NULL, 0, 6, 0),
(3, '2018-07-02', '4', NULL, 0, 6, 0),
(4, '2018-10-24', '1', NULL, 12345, 6, 0),
(5, '2018-10-06', '6', NULL, 334, 6, 0),
(6, '2018-10-18', 'admin', '', 56, 6, 10),
(7, '2018-10-17', 'test', '', 20, 6, 600),
(8, '2018-10-18', 'test 1', '', 25, 6, 600),
(9, '2018-10-24', 'test 3', '', 500, 6, 600),
(10, '2018-10-25', 'nuevo pabloncho', '', 666, 6, 55),
(11, '2018-10-25', 'pabli', '', 999, 6, 56),
(12, '2018-10-21', '33', '', 333, 6, 53),
(13, '2018-10-25', 'pabli', '', 1256, 6, 56),
(14, '2018-10-22', 'Jose Perez', '', 333333, 6, 5),
(15, '2018-10-23', 'eli', '', 666, 6, 104),
(16, '2018-10-23', 'eli', '', 666, 6, 55),
(17, '2018-10-22', 'www', '', 222, 6, 23),
(18, '2018-10-23', 'eli', '', 22, 6, 1),
(19, '2018-10-22', 'palitux', '', 767856786, 6, 233),
(20, '2018-10-22', 'PABLO ROJO', '', 0, 6, 22),
(21, '2018-10-22', 'ytrutyutyutu', '', 233322, 6, 66),
(22, '2018-10-16', 'ertyertyrty', '', 0, 6, 145),
(23, '2018-10-16', '6758678678', '', 2147483647, 6, 34),
(24, '2018-10-22', 'ghjkghjkg', '', 6785686, 6, 145),
(25, '2018-10-10', 'gfhjfgjfgj', '', 0, 6, 4),
(26, '2018-10-11', 'ghjkhjk', '', 0, 6, 7),
(27, '2018-10-02', 'ghjkjhkjhk', '', 8979879, 6, 6),
(28, '2018-10-22', 'solicitante test', '', 666, 6, 6),
(29, '2018-10-22', '678568', '', 56785678, 6, 6),
(30, '2018-10-23', 'eliii', '', 11111, 6, 1),
(31, '2018-10-22', 'ww', '', 222, 6, 2),
(32, '2018-10-22', 'aa', '', 2222, 6, 3),
(33, '2018-10-22', 'aaaaaaaa', '', 9, 6, 6),
(34, '2018-10-22', 'aaaaaa', '', 22, 6, 6),
(35, '2018-10-22', 'ss', '', 233, 6, 34),
(36, '2018-10-23', 'eli', '', 9090, 6, 60),
(37, '2018-10-22', 'eli', '', 12345, 6, 157),
(38, '2018-10-22', 'fgdhggfghfhfgh', '', 454354, 6, 2),
(39, '2018-10-06', '666', '', 666, 6, 6),
(40, '2018-10-22', '22', '', 33434, 6, 23),
(41, '2018-10-23', 'nueva 123', '1', 15, 6, 101),
(42, '2018-10-25', 'pablo ROJO', '', 6666, 6, 0),
(43, '2018-10-07', '77777', '', 777, 6, 77),
(44, '2018-10-22', 'eeee', '', 223, 6, 510),
(45, '2018-10-22', 'juan perez', '', 2222, 6, 23),
(46, '2018-10-23', '334', '', 51574, 6, 532),
(47, '2018-10-24', 'eli', '', 50465, 6, 1),
(48, '2018-10-23', '222', '', 2, 6, 2),
(49, '2018-10-24', 'eli', '', 1111, 6, 0),
(50, '2018-10-10', 'hugo gallarete', '', 1010, 6, 55),
(51, '2018-10-27', '33', '', 334, 6, 145),
(52, '2018-10-27', 'dasasdasd', '', 34343, 6, 34),
(53, '2018-10-27', '34', '', 123456, 6, 512),
(54, '2018-10-30', 'eliana', '', 42291, 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_pedido`
--

CREATE TABLE IF NOT EXISTS `orden_pedido` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `orden_pedido`
--

INSERT INTO `orden_pedido` (`id_orden`, `id_proveedor`, `nro_trabajo`, `descripcion`, `fecha`, `fecha_entrega`, `fecha_entregada`, `estado`, `id_trabajo`, `observacion`, `numero_remito`, `id_empresa`) VALUES
(1, 1, 501, 'pedido prueba', '2017-05-10 00:00:00', '2017-05-11 00:00:00', '2017-11-27 10:09:09', 'E', 1, '', 3344, 6),
(2, 3, 5011, 'prueba', '2017-05-10 00:00:00', '2017-05-10 00:00:00', '0000-00-00 00:00:00', 'P', 16, '', NULL, 6),
(3, 4, 5011, 'ahorasi ', '2017-05-10 00:00:00', '2017-05-10 00:00:00', '0000-00-00 00:00:00', 'P', 16, '', NULL, 6),
(4, 5, 301, 'cargando pedido gemma', '2017-05-10 00:00:00', '2017-05-11 00:00:00', '0000-00-00 00:00:00', 'P', 18, '', NULL, 6),
(5, 9, 602, 'pedido de prueba 3', '2017-05-10 00:00:00', '2017-05-10 00:00:00', '2017-08-14 19:35:47', 'E', 18, '', 123456, 6),
(6, 3, 91, 'ORDEN DE PEDIDO NUMERO 91 ASOCIADA A LA 90', '2017-07-20 00:00:00', '2017-07-21 00:00:00', '0000-00-00 00:00:00', 'P', 16, '', NULL, 6),
(7, 5, 902, 'asociada a la orden numero 902', '2017-07-20 00:00:00', '2017-07-20 00:00:00', '0000-00-00 00:00:00', 'P', 20, '', NULL, 6),
(8, 7, 9020, 'orden de pedido asociada a la orden de trabajo  numero 90 op 9020', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 20, '', NULL, 6),
(9, 7, 950, 'OT numero de pedido 950', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 21, '', NULL, 6),
(10, 8, 9090, 'op 9090', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 20, '', NULL, 6),
(11, 8, 9670, 'OP nro 9697120', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 23, '', NULL, 6),
(12, 9, 96969, 'OP nro 96969', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 22, '', NULL, 6),
(13, 6, 96969, 'OT NRO 96969', '2017-07-20 00:00:00', '2017-07-27 00:00:00', '0000-00-00 00:00:00', 'P', 22, '', NULL, 6),
(14, 4, 14140, 'OP nuevo', '2017-08-11 00:00:00', '2017-08-18 00:00:00', '0000-00-00 00:00:00', 'P', 17, '', NULL, 6),
(15, 12, 78998797, '4 cañños largos', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-08-14 19:37:38', 'E', 18, '', 79456, 6),
(16, 13, 987987, '6 caños ciuadrados', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-08-14 20:28:31', 'E', 18, '', 16, 6),
(17, 13, 7898798, '4 docenas de bolunes', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 18, '', NULL, 6),
(18, 4, 99, 'aceite\narrancador', '2017-08-15 00:00:00', '2017-08-17 00:00:00', '2017-08-15 11:05:19', 'E', 31, '', 798987, 6),
(19, 4, 14, 'pedido de ppriieba 123456', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 20, '', NULL, 6),
(20, 4, 1514, 'OT DE PEDIDO', '2017-08-16 00:00:00', '2017-08-23 00:00:00', '0000-00-00 00:00:00', 'P', 19, '', NULL, 6),
(21, 4, 16, 'dadadada pedidonuevo ', '0000-00-00 00:00:00', '2017-09-01 00:00:00', '2017-09-01 14:19:26', 'E', 34, '', 1666, 6),
(22, 4, 45646, 'comprar mas memoria', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-09-19 10:31:06', 'E', 38, '', 123, 6),
(23, 2, 23, 'sadadsad', '0000-00-00 00:00:00', '2017-11-04 00:00:00', '2017-12-11 11:18:59', 'E', 8, '', 22323, 6),
(24, 1, 1414, '141414', '0000-00-00 00:00:00', '2017-12-01 00:00:00', '0000-00-00 00:00:00', 'P', 23, '', NULL, 6),
(25, 1, 22222, 'aSAsaSAsaS', '2017-12-11 11:13:18', '2017-12-11 00:00:00', '0000-00-00 00:00:00', 'P', 16, '', NULL, 6),
(26, 2, 55, 'p', '2017-12-12 18:46:56', '2017-12-14 00:00:00', '0000-00-00 00:00:00', 'P', 17, '', NULL, 6),
(27, 1, 5454, 'detallle', '2018-06-22 11:04:24', '2018-06-22 00:00:00', '0000-00-00 00:00:00', 'P', 532, '', NULL, 6),
(28, 1, 0, 'pedido test 1', '2018-06-25 12:40:44', '2018-07-02 00:00:00', '0000-00-00 00:00:00', 'P', 536, '', NULL, 6),
(29, 2, 0, 'pedido test 2 ', '2018-06-25 13:48:11', '2018-07-03 00:00:00', '0000-00-00 00:00:00', 'P', 536, '', NULL, 6),
(30, 2, 11111, 'orden de  pedido de prueba administracion', '2018-06-28 16:01:19', '2018-06-29 00:00:00', '0000-00-00 00:00:00', 'P', 538, '', NULL, 6),
(31, 2, 1111, 'pedido test asociado a ot con id 538', '2018-06-29 11:11:06', '2018-07-06 00:00:00', '0000-00-00 00:00:00', 'P', 538, '', NULL, 0),
(32, 0, 48956, 'Nueva nota de pedido', '2018-09-19 10:15:18', '2018-09-26 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(33, 1, 11223344, 'eli probando', '2018-10-05 12:14:01', '2018-10-25 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(34, 2, 112233, 'eliiiiii', '2018-10-05 12:14:34', '2018-10-23 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(35, 2, 123, 'eli 2', '2018-10-05 12:16:12', '2018-10-19 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(36, 1, 1357, 'eli 99', '2018-10-05 12:17:02', '2018-11-22 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(37, 1, 222222, 'no guarda', '2018-10-05 12:17:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(38, 1, 9900, 'no anda', '2018-10-05 12:18:12', '2018-10-17 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(39, -1, 0, '', '2018-10-05 12:23:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_servicio`
--

CREATE TABLE IF NOT EXISTS `orden_servicio` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `lectura` double NOT NULL,
  `fecha` date NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  `id_solicitudreparacion` int(11) NOT NULL,
  `valesid` int(11) DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `orden_servicio`
--

INSERT INTO `orden_servicio` (`id_orden`, `lectura`, `fecha`, `comprobante`, `id_equipo`, `id_contratista`, `id_solicitudreparacion`, `valesid`, `estado`, `id_ordenherraminetas`, `id_orden_insumo`, `id_ot`, `id_empresa`, `fechahorainicio`, `fechahorafin`, `horometroinicio`, `horometrofin`) VALUES
(1, 0, '2018-10-23', '', 9, 20, 13, 16, 'C', NULL, NULL, 510, 6, '2018-10-12 20:24:09', '2018-10-16 20:24:12', 12, 12.3),
(2, 0, '2018-10-23', '', 9, 20, 13, 17, 'C', NULL, NULL, 510, 6, '2018-10-23 20:44:24', '2018-10-30 20:44:28', 200, 290),
(3, 0, '2018-10-24', '', 9, 20, 13, 18, 'C', NULL, NULL, 512, 6, '2018-10-24 10:13:26', '2018-10-31 10:13:38', 3000, 4000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_trabajo`
--

CREATE TABLE IF NOT EXISTS `orden_trabajo` (
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
  `lectura_programada` double DEFAULT NULL,
  `lectura_ejecutada` double DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `orden_trabajo_ibfk_1` (`cliId`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `id_usuariosolicitante` (`id_usuario_a`) USING BTREE,
  KEY `usuario_entrega` (`id_usuario_e`) USING BTREE,
  KEY `id_sucursal` (`id_sucursal`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=606 ;

--
-- Volcado de datos para la tabla `orden_trabajo`
--

INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`, `lectura_programada`, `lectura_ejecutada`) VALUES
(1, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:44:25', '2017-11-08 10:47:45', '2017-11-08 10:47:45', '2017-11-08 10:47:45', '2017-11-08 10:47:45', 'rotura de rueda', 13, 'C', 1, 1, 1, 1, 0, 1, '1', 0, 60, NULL, 6, 0, 0),
(2, 0, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 00:00:00', '2017-11-29 00:00:00', '2017-11-23 08:39:37', '2017-11-08 10:48:19', '2017-12-10 00:00:00', 'sadasdas', 13, 'E', 1, 1, 1, 1, 0, 4, '1', 0, 60, NULL, 6, 0, 0),
(3, 0, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:47:21', '2017-11-08 10:58:41', '2017-11-08 10:58:41', '2017-11-08 10:58:41', '2017-11-08 10:58:41', 'sadasdas', 1, 'C', 1, 1, 1, 1, 0, 4, '2', 0, 60, NULL, 6, 0, 0),
(4, 4, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:47:21', '2017-11-08 12:52:35', '2017-11-08 12:52:35', '2017-11-08 12:52:35', '2017-11-08 12:52:35', 'sadasdas', 1, 'C', 1, 1, 1, 1, 0, 4, '2', 0, 60, NULL, 6, 0, 0),
(5, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:44:25', '2017-11-09 16:09:14', '2017-11-09 16:09:14', '2017-11-09 16:09:14', '2017-11-09 16:09:14', 'rotura de rueda', 13, 'C', 1, 1, 1, 1, 0, 1, '3', 0, 60, NULL, 6, 0, 0),
(6, 0, '5', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 12:53:19', '2017-12-09 16:09:34', '2017-11-09 16:09:34', '2017-11-09 16:09:34', '2017-11-09 16:09:34', 'observc test2', 1, 'C', 1, 1, 1, 1, 1, 5, '3', 0, 60, NULL, 6, 0, 0),
(7, 0, '5', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 12:53:19', '2017-12-07 10:38:07', '2017-11-13 10:38:07', '2017-11-13 10:38:07', '2017-11-13 10:38:07', 'observc test2', 1, 'C', 1, 1, 1, 1, 1, 5, '3', 0, 60, NULL, 6, 0, 0),
(8, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 00:00:00', '0000-00-00 00:00:00', '2017-11-14 14:39:59', '2017-11-14 14:39:59', '2017-11-14 14:39:59', 'rotura de rueda', 13, 'P', 1, 1, 1, 1, 1, 1, '2', 0, 60, NULL, 6, 0, 0),
(9, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-11-14 15:38:02', '2017-11-14 15:38:02', '2017-11-14 15:38:02', '2017-11-14 15:38:02', 'Rotura de llanta', 13, 'C', 5, 5, 5, 1, 0, 6, '3', 0, 60, NULL, 6, 0, 0),
(10, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-11-14 15:42:27', '2017-11-14 15:42:27', '2017-11-14 15:42:27', '2017-11-14 15:42:27', 'Rotura de llanta', 13, 'C', 5, 5, 5, 1, 0, 6, '1', 0, 60, NULL, 6, 0, 0),
(11, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:44:25', '2017-11-23 08:26:01', '2017-11-23 08:26:01', '2017-11-23 08:26:01', '2017-11-23 08:26:01', 'rotura de rueda', 1, 'C', 1, 1, 1, 1, 0, 1, '3', 0, 60, NULL, 6, 0, 0),
(12, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-11-17 08:25:52', '2017-11-28 08:25:52', '2017-11-28 08:25:52', '2017-11-28 08:25:52', 'Rotura de llanta', 1, 'C', 3, 3, 3, 1, 0, 6, '', 0, 60, NULL, 6, 0, 0),
(13, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-12-22 08:26:22', '2017-11-28 08:26:22', '2017-11-28 08:26:22', '2017-11-28 08:26:22', 'Rotura de llanta', 1, 'C', 3, 3, 3, 1, 0, 6, '', 0, 60, NULL, 6, 0, 0),
(14, 0, '5', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 12:53:19', '2017-12-12 10:58:50', '2017-11-28 10:58:50', '2017-11-28 10:58:50', '2017-11-28 10:58:50', 'observc test2', 13, 'C', 3, 3, 3, 1, 0, 5, '1', 0, 60, NULL, 6, 0, 0),
(15, NULL, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-12-07 10:44:25', '2017-12-06 12:04:24', '2017-11-28 12:04:24', '2017-11-28 12:04:24', '2017-11-28 12:04:24', 'rotura de rueda', 1, 'C', 3, 3, 3, 1, 0, 1, '2', 0, 60, NULL, 6, 0, 0),
(16, 1, '3', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2018-07-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'T', 3, 1, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(17, 1, '3', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 3, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(18, 1, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-12-14 10:44:25', '0000-00-00 00:00:00', '2017-11-28 13:16:25', '2017-11-28 13:16:25', '2017-11-28 13:16:25', 'rotura de rueda', 1, 'As', 3, 0, 3, 1, 2, 1, '2', 2, 60, NULL, 6, 0, 0),
(19, 1, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-12-30 00:00:00', '2017-12-09 00:00:00', '2017-12-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'T', 3, 1, 0, 1, 0, 0, '4', 1, 60, NULL, 6, 0, 0),
(20, 1, '4', '0000-00-00', '0000-00-00 00:00:00', '0002-01-08 20:00:00', '2017-12-20 00:00:00', '2017-12-18 00:00:00', '0000-00-00 00:00:00', '2017-12-27 00:00:00', 'Predictivo', 1, 'E', 3, 1, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(21, 1, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-12-21 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 4, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(22, NULL, '7', '0000-00-00', '0000-00-00 00:00:00', '2017-12-01 05:35:25', '2017-12-13 00:00:00', '2017-12-01 05:35:44', '2017-12-01 05:35:44', '2017-12-01 05:35:44', 'Falla test sobre RS-0001 (01-12)', 1, 'As', 3, 6, 3, 1, 0, 7, '2', 2, 60, NULL, 6, 0, 0),
(23, 1, '3', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 0, 1, 0, 0, '5', 1, 60, NULL, 6, 0, 0),
(25, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'C', 1, 0, 0, 1, 0, 0, '2', 1, 60, NULL, 6, 0, 0),
(26, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-29 00:00:00', '2017-12-27 00:00:00', '0000-00-00 00:00:00', '2018-06-27 00:00:00', 'Preventivo', 1, 'E', 1, 1, 1, 1, 0, 1, '2', 1, 60, NULL, 6, 0, 0),
(27, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-28 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'As', 1, 6, 1, 1, 0, 0, '2', 1, 60, NULL, 6, 0, 0),
(28, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-11 00:00:00', '2017-12-18 00:00:00', '0000-00-00 00:00:00', '2018-09-20 00:00:00', 'Preventivo', 1, 'E', 1, 1, 1, 1, 0, 0, '2', 3, 60, NULL, 6, 0, 0),
(29, 1, '8', '0000-00-00', '0000-00-00 00:00:00', '2017-12-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 0, 0, 1, 0, 0, '4', 3, 60, NULL, 6, 0, 0),
(30, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '0000-00-00 00:00:00', '2017-12-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'As', 1, 1, 1, 1, 0, 0, '2', 3, 60, NULL, 6, 0, 0),
(31, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 0, 1, 0, 0, '5', 2, 60, NULL, 6, 0, 0),
(32, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 1, 1, 0, 0, '5', 2, 60, NULL, 6, 0, 0),
(33, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 1, 1, 0, 0, '5', 2, 60, NULL, 6, 0, 0),
(34, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 1, 1, 0, 0, '5', 2, 60, NULL, 6, 0, 0),
(35, 2, '9', '0000-00-00', '0000-00-00 00:00:00', '2017-12-12 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 1, 1, 1, 0, 0, '4', 2, 60, NULL, 6, 0, 0),
(36, NULL, '100', '0000-00-00', '0000-00-00 00:00:00', '2017-12-12 21:22:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'prueba', 1, 'As', 3, 1, 1, 1, 2, 0, '1', 2, 60, NULL, 6, 0, 0),
(37, 2, '9', '0000-00-00', '0000-00-00 00:00:00', '2017-12-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 1, 1, 1, 0, 0, '4', 2, 60, NULL, 6, 0, 0),
(38, 1, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-01-10 00:00:00', '0000-00-00 00:00:00', '2018-01-12 00:00:00', '0000-00-00 00:00:00', '2018-01-12 00:00:00', 'Backlog', 1, 'E', 1, 1, 1, 1, 0, 0, '4', 1, 60, NULL, 6, 0, 0),
(39, 1, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-20 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 0, 0, 1, 0, 0, '4', 2, 60, NULL, 6, 0, 0),
(40, 1, '2', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:45:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'assdas', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(41, 1, '9', '0000-00-00', '0000-00-00 00:00:00', '2018-01-17 13:38:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite abajo del equipo ', 1, 'C', 1, 1, 1, 1, 0, 0, '', 10, 60, NULL, 6, 0, 0),
(42, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(43, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(46, 1, '1', '2018-01-29', '2018-01-31 00:00:00', '2017-11-14 15:23:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rotura de llanta', 1, 'C', 3, 1, 1, 1, 0, 6, '2', 2, 60, NULL, 6, 0, 0),
(47, 16, '1', '2018-01-29', '2018-01-30 00:00:00', '2018-02-10 00:00:00', '2018-03-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 5, 1, 1, 0, 8, '5', 4, 60, NULL, 6, 0, 0),
(48, 1, '1', '2018-01-29', '2018-01-29 00:00:00', '2017-12-01 05:35:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Falla test sobre RS-0001 (01-12)', 1, 'C', 3, 1, 1, 1, 0, 7, '2', 2, 60, NULL, 6, 0, 0),
(49, 16, '1', '2018-01-29', '2018-01-29 00:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 1, 1, 1, 1, 0, 8, '5', 4, 60, NULL, 6, 0, 0),
(50, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(51, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(52, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(53, NULL, '12', '0000-00-00', '0000-00-00 00:00:00', '2018-01-30 14:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No tiene fuerza para levantar la carga', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(54, NULL, '12', '0000-00-00', '0000-00-00 00:00:00', '2018-01-30 14:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No tiene fuerza para levantar la carga', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(55, NULL, '12', '0000-00-00', '0000-00-00 00:00:00', '2018-01-30 14:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No tiene fuerza para levantar la carga', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(56, NULL, '7', '0000-00-00', '0000-00-00 00:00:00', '2017-12-01 05:35:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Falla test sobre RS-0001 (01-12)', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(57, 1, '1', '2018-02-08', '2018-02-08 00:00:00', '2017-11-08 10:44:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'rotura de rueda', 1, 'AN', 1, 1, 1, 1, 0, 1, '2', 1, 60, NULL, 6, 0, 0),
(58, NULL, '13', '0000-00-00', '0000-00-00 00:00:00', '2018-02-05 19:01:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(59, NULL, '15', '0000-00-00', '0000-00-00 00:00:00', '2018-02-05 19:46:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ggggjffufjffg', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 6, 0, 0),
(60, 8, '1', '2018-02-08', '2018-01-08 15:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 1, 'C', 1, 1, 1, 1, 0, 16, '3', 4, 60, NULL, 6, 0, 0),
(61, 4, '1', '2018-02-08', '2018-01-12 15:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, NULL, 6, 0, 0),
(62, 4, '1', '2018-02-17', '2018-02-17 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(63, 4, '1', '2018-02-17', '2018-03-04 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(64, 4, '1', '2018-02-17', '2018-03-19 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(65, 4, '1', '2018-02-17', '2018-04-03 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(66, 4, '1', '2018-02-17', '2018-04-18 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(67, 4, '1', '2018-02-17', '2018-05-03 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(68, 4, '1', '2018-02-17', '2018-05-18 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(69, 4, '1', '2018-02-17', '2018-06-02 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(70, 4, '1', '2018-02-17', '2018-06-17 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(71, 4, '1', '2018-02-17', '2018-07-02 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(72, 16, '1', '2018-02-17', '2018-02-17 20:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(73, 16, '1', '2018-02-17', '2018-02-19 15:20:00', '2018-02-10 00:00:00', '2018-03-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(74, 4, '1', '2018-02-18', '2018-02-18 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(75, 4, '1', '2018-02-18', '2018-03-05 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(76, 4, '1', '2018-02-18', '2018-03-20 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(77, 4, '1', '2018-02-18', '2018-04-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(78, 4, '1', '2018-02-18', '2018-04-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(79, 4, '1', '2018-02-18', '2018-05-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(80, 4, '1', '2018-02-18', '2018-05-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(81, 4, '1', '2018-02-18', '2018-06-03 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(82, 4, '1', '2018-02-18', '2018-06-18 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(83, 4, '1', '2018-02-18', '2018-07-03 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(84, 4, '1', '2018-02-18', '2018-07-18 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(85, 4, '1', '2018-02-18', '2018-08-02 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(86, 4, '1', '2018-02-18', '2018-08-17 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(87, 4, '1', '2018-02-18', '2018-09-01 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(88, 4, '1', '2018-02-18', '2018-09-16 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(89, 4, '1', '2018-02-18', '2018-10-01 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(90, 4, '1', '2018-02-18', '2018-10-16 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(91, 4, '1', '2018-02-18', '2018-10-31 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(92, 4, '1', '2018-02-18', '2018-11-15 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(93, 4, '1', '2018-02-18', '2018-11-30 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(94, 4, '1', '2018-02-18', '2018-12-15 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(95, 4, '1', '2018-02-18', '2018-12-30 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(96, 4, '1', '2018-02-18', '2019-01-14 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(97, 4, '1', '2018-02-18', '2019-01-29 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(98, 4, '1', '2018-02-18', '2019-02-13 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(99, 4, '1', '2018-02-18', '2019-02-28 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(100, 4, '1', '2018-02-18', '2019-03-15 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(101, 4, '1', '2018-02-18', '2019-03-30 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(102, 4, '1', '2018-02-18', '2019-04-14 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(103, 4, '1', '2018-02-18', '2019-04-29 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(104, 4, '1', '2018-02-18', '2019-05-14 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(105, 4, '1', '2018-02-18', '2019-05-29 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(106, 4, '1', '2018-02-18', '2019-06-13 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(107, 4, '1', '2018-02-18', '2019-06-28 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(108, 4, '1', '2018-02-18', '2019-07-13 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(109, 4, '1', '2018-02-18', '2019-07-28 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(110, 4, '1', '2018-02-18', '2019-08-12 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(111, 4, '1', '2018-02-18', '2019-08-27 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(112, 4, '1', '2018-02-18', '2019-09-11 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(113, 4, '1', '2018-02-18', '2019-09-26 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(114, 4, '1', '2018-02-18', '2019-10-11 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(115, 4, '1', '2018-02-18', '2019-10-26 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(116, 4, '1', '2018-02-18', '2019-11-10 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(117, 4, '1', '2018-02-18', '2019-11-25 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(118, 4, '1', '2018-02-18', '2019-12-10 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(119, 4, '1', '2018-02-18', '2019-12-25 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(120, 4, '1', '2018-02-18', '2020-01-09 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(121, 4, '1', '2018-02-18', '2020-01-24 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(122, 4, '1', '2018-02-18', '2020-02-08 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(123, 4, '1', '2018-02-18', '2020-02-23 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(124, 4, '1', '2018-02-18', '2020-03-09 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(125, 4, '1', '2018-02-18', '2020-03-24 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(126, 4, '1', '2018-02-18', '2020-04-08 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(127, 4, '1', '2018-02-18', '2020-04-23 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(128, 4, '1', '2018-02-18', '2020-05-08 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(129, 4, '1', '2018-02-18', '2020-05-23 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(130, 4, '1', '2018-02-18', '2020-06-07 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(131, 4, '1', '2018-02-18', '2020-06-22 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(132, 4, '1', '2018-02-18', '2020-07-07 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(133, 4, '1', '2018-02-18', '2020-07-22 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(134, 4, '1', '2018-02-18', '2020-08-06 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(135, 4, '1', '2018-02-18', '2020-08-21 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(136, 4, '1', '2018-02-18', '2020-09-05 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(137, 4, '1', '2018-02-18', '2020-09-20 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(138, 4, '1', '2018-02-18', '2020-10-05 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(139, 4, '1', '2018-02-18', '2020-10-20 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(140, 4, '1', '2018-02-18', '2020-11-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(141, 4, '1', '2018-02-18', '2020-11-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(142, 4, '1', '2018-02-18', '2020-12-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(143, 4, '1', '2018-02-18', '2020-12-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(144, 5, '1', '2018-02-18', '2018-02-18 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(145, 5, '1', '2018-02-18', '2018-03-20 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(146, 5, '1', '2018-02-18', '2018-04-19 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(147, 5, '1', '2018-02-18', '2018-05-19 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(148, 5, '1', '2018-02-18', '2018-06-18 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(149, 5, '1', '2018-02-18', '2018-07-18 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(150, 5, '1', '2018-02-18', '2018-08-17 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(151, 5, '1', '2018-02-18', '2018-09-16 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(152, 5, '1', '2018-02-18', '2018-10-16 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(153, 5, '1', '2018-02-18', '2018-11-15 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(154, 5, '1', '2018-02-18', '2018-12-15 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(155, 5, '1', '2018-02-18', '2019-01-14 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(156, 5, '1', '2018-02-18', '2019-02-13 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(157, 5, '1', '2018-02-18', '2019-03-15 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(158, 5, '1', '2018-02-19', '2018-02-19 03:30:00', '2018-01-18 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 5, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(159, 5, '1', '2018-02-19', '2018-02-26 03:30:00', '2018-01-18 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 12, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(160, 5, '1', '2018-02-19', '2018-03-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(161, 5, '1', '2018-02-19', '2018-03-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(162, 5, '1', '2018-02-19', '2018-03-19 03:30:00', '2018-01-18 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 15, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(163, 5, '1', '2018-02-19', '2018-03-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(164, 5, '1', '2018-02-19', '2018-04-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(165, 5, '1', '2018-02-19', '2018-04-09 03:30:00', '2018-01-18 00:00:00', '2018-09-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 4, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(166, 5, '1', '2018-02-19', '2018-04-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(167, 5, '1', '2018-02-19', '2018-04-23 03:30:00', '2018-01-18 00:00:00', '2018-08-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'As', 1, 2, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(168, 5, '1', '2018-02-19', '2018-04-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(169, 5, '1', '2018-02-19', '2018-05-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(170, 5, '1', '2018-02-19', '2018-05-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(171, 5, '1', '2018-02-19', '2018-05-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(172, 5, '1', '2018-02-19', '2018-05-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(173, 5, '1', '2018-02-19', '2018-06-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(174, 5, '1', '2018-02-19', '2018-06-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(175, 5, '1', '2018-02-19', '2018-06-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(176, 5, '1', '2018-02-19', '2018-06-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(177, 5, '1', '2018-02-19', '2018-07-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 120, 12, 6, 0, 0),
(178, 5, '1', '2018-02-19', '2018-07-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(179, 5, '1', '2018-02-19', '2018-07-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(180, 5, '1', '2018-02-19', '2018-07-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(181, 5, '1', '2018-02-19', '2018-07-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(182, 5, '1', '2018-02-19', '2018-08-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(183, 5, '1', '2018-02-19', '2018-08-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(184, 5, '1', '2018-02-19', '2018-08-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(185, 5, '1', '2018-02-19', '2018-08-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(186, 5, '1', '2018-02-19', '2018-09-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(187, 5, '1', '2018-02-19', '2018-09-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(188, 5, '1', '2018-02-19', '2018-09-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(189, 5, '1', '2018-02-19', '2018-09-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(190, 5, '1', '2018-02-19', '2018-10-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(191, 5, '1', '2018-02-19', '2018-10-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(192, 5, '1', '2018-02-19', '2018-10-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(193, 5, '1', '2018-02-19', '2018-10-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(194, 5, '1', '2018-02-19', '2018-10-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(195, 5, '1', '2018-02-19', '2018-11-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(196, 5, '1', '2018-02-19', '2018-11-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(197, 5, '1', '2018-02-19', '2018-11-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0);
INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`, `lectura_programada`, `lectura_ejecutada`) VALUES
(198, 5, '1', '2018-02-19', '2018-11-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(199, 5, '1', '2018-02-19', '2018-12-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(200, 5, '1', '2018-02-19', '2018-12-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(201, 5, '1', '2018-02-19', '2018-12-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(202, 5, '1', '2018-02-19', '2018-12-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(203, 5, '1', '2018-02-19', '2018-12-31 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(204, 5, '1', '2018-02-19', '2019-01-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(205, 5, '1', '2018-02-19', '2019-01-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(206, 5, '1', '2018-02-19', '2019-01-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(207, 5, '1', '2018-02-19', '2019-01-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(208, 5, '1', '2018-02-19', '2019-02-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(209, 5, '1', '2018-02-19', '2019-02-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(210, 5, '1', '2018-02-19', '2019-02-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(211, 5, '1', '2018-02-19', '2019-02-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(212, 5, '1', '2018-02-19', '2019-03-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(213, 5, '1', '2018-02-19', '2019-03-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(214, 5, '1', '2018-02-19', '2019-03-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(215, 5, '1', '2018-02-19', '2019-03-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(216, 5, '1', '2018-02-19', '2019-04-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(217, 5, '1', '2018-02-19', '2019-04-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(218, 5, '1', '2018-02-19', '2019-04-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(219, 5, '1', '2018-02-19', '2019-04-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(220, 5, '1', '2018-02-19', '2019-04-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(221, 5, '1', '2018-02-19', '2019-05-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(222, 5, '1', '2018-02-19', '2019-05-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(223, 5, '1', '2018-02-19', '2019-05-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(224, 5, '1', '2018-02-19', '2019-05-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(225, 5, '1', '2018-02-19', '2019-06-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(226, 5, '1', '2018-02-19', '2019-06-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(227, 5, '1', '2018-02-19', '2019-06-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(228, 5, '1', '2018-02-19', '2019-06-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(229, 5, '1', '2018-02-19', '2019-07-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(230, 5, '1', '2018-02-19', '2019-07-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(231, 5, '1', '2018-02-19', '2019-07-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(232, 5, '1', '2018-02-19', '2019-07-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(233, 5, '1', '2018-02-19', '2019-07-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(234, 5, '1', '2018-02-19', '2019-08-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(235, 5, '1', '2018-02-19', '2019-08-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(236, 5, '1', '2018-02-19', '2019-08-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(237, 5, '1', '2018-02-19', '2019-08-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(238, 5, '1', '2018-02-19', '2019-09-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(239, 5, '1', '2018-02-19', '2019-09-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(240, 5, '1', '2018-02-19', '2019-09-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(241, 5, '1', '2018-02-19', '2019-09-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(242, 5, '1', '2018-02-19', '2019-09-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(243, 5, '1', '2018-02-19', '2019-10-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(244, 5, '1', '2018-02-19', '2019-10-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(245, 5, '1', '2018-02-19', '2019-10-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(246, 5, '1', '2018-02-19', '2019-10-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(247, 5, '1', '2018-02-19', '2019-11-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(248, 5, '1', '2018-02-19', '2019-11-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(249, 5, '1', '2018-02-19', '2019-11-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(250, 5, '1', '2018-02-19', '2019-11-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(251, 5, '1', '2018-02-19', '2019-12-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(252, 5, '1', '2018-02-19', '2019-12-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(253, 5, '1', '2018-02-19', '2019-12-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(254, 5, '1', '2018-02-19', '2019-12-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(255, 5, '1', '2018-02-19', '2019-12-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(256, 5, '1', '2018-02-19', '2020-01-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(257, 5, '1', '2018-02-19', '2020-01-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(258, 5, '1', '2018-02-19', '2020-01-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(259, 5, '1', '2018-02-19', '2020-01-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(260, 5, '1', '2018-02-19', '2020-02-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(261, 5, '1', '2018-02-19', '2020-02-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(262, 5, '1', '2018-02-19', '2020-02-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(263, 5, '1', '2018-02-19', '2020-02-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(264, 5, '1', '2018-02-19', '2020-03-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(265, 5, '1', '2018-02-19', '2020-03-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(266, 5, '1', '2018-02-19', '2020-03-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(267, 5, '1', '2018-02-19', '2020-03-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(268, 5, '1', '2018-02-19', '2020-03-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(269, 5, '1', '2018-02-19', '2020-04-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(270, 5, '1', '2018-02-19', '2020-04-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(271, 5, '1', '2018-02-19', '2020-04-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(272, 5, '1', '2018-02-19', '2020-04-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(273, 5, '1', '2018-02-19', '2020-05-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(274, 5, '1', '2018-02-19', '2020-05-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(275, 5, '1', '2018-02-19', '2020-05-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(276, 5, '1', '2018-02-19', '2020-05-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(277, 5, '1', '2018-02-19', '2020-06-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(278, 5, '1', '2018-02-19', '2020-06-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(279, 5, '1', '2018-02-19', '2020-06-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(280, 5, '1', '2018-02-19', '2020-06-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(281, 5, '1', '2018-02-19', '2020-06-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(282, 5, '1', '2018-02-19', '2020-07-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(283, 5, '1', '2018-02-19', '2020-07-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(284, 5, '1', '2018-02-19', '2020-07-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(285, 5, '1', '2018-02-19', '2020-07-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(286, 5, '1', '2018-02-19', '2020-08-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(287, 5, '1', '2018-02-19', '2020-08-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(288, 5, '1', '2018-02-19', '2020-08-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(289, 5, '1', '2018-02-19', '2020-08-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(290, 5, '1', '2018-02-19', '2020-08-31 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(291, 5, '1', '2018-02-19', '2020-09-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(292, 5, '1', '2018-02-19', '2020-09-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(293, 5, '1', '2018-02-19', '2020-09-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(294, 5, '1', '2018-02-19', '2020-09-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(295, 5, '1', '2018-02-19', '2020-10-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(296, 5, '1', '2018-02-19', '2020-10-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(297, 5, '1', '2018-02-19', '2020-10-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(298, 5, '1', '2018-02-19', '2020-10-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(299, 5, '1', '2018-02-19', '2020-11-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(300, 5, '1', '2018-02-19', '2020-11-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(301, 5, '1', '2018-02-19', '2020-11-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(302, 5, '1', '2018-02-19', '2020-11-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(303, 5, '1', '2018-02-19', '2020-11-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(304, 5, '1', '2018-02-19', '2020-12-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(305, 5, '1', '2018-02-19', '2020-12-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(306, 5, '1', '2018-02-19', '2020-12-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(307, 5, '1', '2018-02-19', '2020-12-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(308, 5, '1', '2018-02-19', '2021-01-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(309, 5, '1', '2018-02-19', '2021-01-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(310, 5, '1', '2018-02-19', '2021-01-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(311, 5, '1', '2018-02-19', '2021-01-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(312, 5, '1', '2018-02-19', '2021-02-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(313, 5, '1', '2018-02-19', '2021-02-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(314, 5, '1', '2018-02-19', '2021-02-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(315, 5, '1', '2018-02-19', '2021-02-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(316, 5, '1', '2018-02-19', '2018-02-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(317, 5, '1', '2018-02-19', '2018-02-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(318, 5, '1', '2018-02-19', '2018-03-07 08:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(319, 5, '1', '2018-02-19', '2018-03-12 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 240, 12, 6, 0, 0),
(320, 5, '1', '2018-02-19', '2018-03-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(321, 5, '1', '2018-02-19', '2018-03-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(322, 5, '1', '2018-02-19', '2018-04-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(323, 5, '1', '2018-02-19', '2018-04-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(324, 5, '1', '2018-02-19', '2018-04-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(325, 5, '1', '2018-02-19', '2018-04-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(326, 5, '1', '2018-02-19', '2018-04-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(327, 5, '1', '2018-02-19', '2018-05-07 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(328, 5, '1', '2018-02-19', '2018-05-14 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(329, 5, '1', '2018-02-19', '2018-05-21 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(330, 5, '1', '2018-02-19', '2018-05-28 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(331, 5, '1', '2018-02-19', '2018-06-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(332, 5, '1', '2018-02-19', '2018-06-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(333, 5, '1', '2018-02-19', '2018-06-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(334, 5, '1', '2018-02-19', '2018-06-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(335, 5, '1', '2018-02-19', '2018-07-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(336, 5, '1', '2018-02-19', '2018-07-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(337, 5, '1', '2018-02-19', '2018-07-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(338, 5, '1', '2018-02-19', '2018-07-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(339, 5, '1', '2018-02-19', '2018-07-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(340, 5, '1', '2018-02-19', '2018-08-06 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(341, 5, '1', '2018-02-19', '2018-08-13 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(342, 5, '1', '2018-02-19', '2018-08-20 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(343, 5, '1', '2018-02-19', '2018-08-27 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(344, 5, '1', '2018-02-19', '2018-09-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(345, 5, '1', '2018-02-19', '2018-09-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 180, 12, 6, 0, 0),
(346, 5, '1', '2018-02-19', '2018-09-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(347, 5, '1', '2018-02-19', '2018-09-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(348, 5, '1', '2018-02-19', '2018-10-01 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(349, 5, '1', '2018-02-19', '2018-10-08 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(350, 5, '1', '2018-02-19', '2018-10-15 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(351, 5, '1', '2018-02-19', '2018-10-22 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(352, 5, '1', '2018-02-19', '2018-10-29 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(353, 5, '1', '2018-02-19', '2018-11-05 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(354, 5, '1', '2018-02-19', '2018-11-12 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(355, 5, '1', '2018-02-19', '2018-11-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(356, 5, '1', '2018-02-19', '2018-11-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(357, 5, '1', '2018-02-19', '2018-12-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(358, 5, '1', '2018-02-19', '2018-12-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(359, 5, '1', '2018-02-19', '2018-12-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(360, 5, '1', '2018-02-19', '2018-12-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(361, 5, '1', '2018-02-19', '2018-12-31 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(362, 5, '1', '2018-02-19', '2019-01-07 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(363, 5, '1', '2018-02-19', '2019-01-14 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(364, 5, '1', '2018-02-19', '2019-01-21 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(365, 5, '1', '2018-02-19', '2019-01-28 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(366, 5, '1', '2018-02-19', '2019-02-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(367, 5, '1', '2018-02-19', '2019-02-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(368, 5, '1', '2018-02-19', '2019-02-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(369, 5, '1', '2018-02-19', '2019-02-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(370, 5, '1', '2018-02-19', '2019-03-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(371, 5, '1', '2018-02-19', '2019-03-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(372, 5, '1', '2018-02-19', '2019-03-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(373, 5, '1', '2018-02-19', '2019-03-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(374, 5, '1', '2018-02-19', '2019-04-01 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(375, 5, '1', '2018-02-19', '2019-04-08 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(376, 5, '1', '2018-02-19', '2019-04-15 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(377, 5, '1', '2018-02-19', '2019-04-22 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(378, 5, '1', '2018-02-19', '2019-04-29 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(379, 5, '1', '2018-02-19', '2019-05-06 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(380, 5, '1', '2018-02-19', '2019-05-13 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(381, 5, '1', '2018-02-19', '2019-05-20 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(382, 5, '1', '2018-02-19', '2019-05-27 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(383, 5, '1', '2018-02-19', '2019-06-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(384, 5, '1', '2018-02-19', '2019-06-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(385, 5, '1', '2018-02-19', '2019-06-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(386, 5, '1', '2018-02-19', '2019-06-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(387, 5, '1', '2018-02-19', '2019-07-01 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(388, 5, '1', '2018-02-19', '2019-07-08 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(389, 5, '1', '2018-02-19', '2019-07-15 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(390, 5, '1', '2018-02-19', '2019-07-22 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(391, 5, '1', '2018-02-19', '2019-07-29 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(392, 5, '1', '2018-02-19', '2019-08-05 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(393, 5, '1', '2018-02-19', '2019-08-12 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(394, 5, '1', '2018-02-19', '2019-08-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(395, 5, '1', '2018-02-19', '2019-08-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(396, 5, '1', '2018-02-19', '2019-09-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(397, 5, '1', '2018-02-19', '2019-09-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(398, 5, '1', '2018-02-19', '2019-09-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(399, 5, '1', '2018-02-19', '2019-09-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(400, 5, '1', '2018-02-19', '2019-09-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0);
INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`, `lectura_programada`, `lectura_ejecutada`) VALUES
(401, 5, '1', '2018-02-19', '2019-10-07 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(402, 5, '1', '2018-02-19', '2019-10-14 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(403, 5, '1', '2018-02-19', '2019-10-21 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(404, 5, '1', '2018-02-19', '2019-10-28 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(405, 5, '1', '2018-02-19', '2019-11-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(406, 5, '1', '2018-02-19', '2019-11-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(407, 5, '1', '2018-02-19', '2019-11-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(408, 5, '1', '2018-02-19', '2019-11-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(409, 5, '1', '2018-02-19', '2019-12-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(410, 5, '1', '2018-02-19', '2019-12-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(411, 5, '1', '2018-02-19', '2019-12-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(412, 5, '1', '2018-02-19', '2019-12-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(413, 5, '1', '2018-02-19', '2019-12-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(414, 5, '1', '2018-02-19', '2020-01-06 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(415, 5, '1', '2018-02-19', '2020-01-13 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(416, 5, '1', '2018-02-19', '2020-01-20 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(417, 5, '1', '2018-02-19', '2020-01-27 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(418, 5, '1', '2018-02-19', '2020-02-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(419, 5, '1', '2018-02-19', '2020-02-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(420, 5, '1', '2018-02-19', '2020-02-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(421, 5, '1', '2018-02-19', '2020-02-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
(422, 4, '1', '2018-02-19', '2018-02-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(423, 4, '1', '2018-02-19', '2018-03-05 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 150, 11, 6, 0, 0),
(424, 4, '1', '2018-02-19', '2018-03-22 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(425, 4, '1', '2018-02-19', '2018-04-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(426, 4, '1', '2018-02-19', '2018-04-27 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(427, 4, '1', '2018-02-19', '2018-05-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(428, 4, '1', '2018-02-19', '2018-05-21 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(429, 4, '1', '2018-02-19', '2018-06-05 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(430, 4, '1', '2018-02-19', '2018-06-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(431, 4, '1', '2018-02-19', '2018-07-05 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(432, 4, '1', '2018-02-19', '2018-07-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(433, 4, '1', '2018-02-19', '2018-08-04 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(434, 4, '1', '2018-02-19', '2018-08-19 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(435, 4, '1', '2018-02-19', '2018-09-03 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(436, 4, '1', '2018-02-19', '2018-09-18 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(437, 4, '1', '2018-02-19', '2018-10-03 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(438, 4, '1', '2018-02-19', '2018-10-18 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(439, 4, '1', '2018-02-19', '2018-11-02 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(440, 4, '1', '2018-02-19', '2018-11-17 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(441, 4, '1', '2018-02-19', '2018-12-02 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(442, 4, '1', '2018-02-19', '2018-12-17 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(443, 4, '1', '2018-02-19', '2019-01-01 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(444, 4, '1', '2018-02-19', '2019-01-16 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(445, 4, '1', '2018-02-19', '2019-01-31 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(446, 4, '1', '2018-02-19', '2019-02-15 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(447, 4, '1', '2018-02-19', '2019-03-02 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(448, 4, '1', '2018-02-19', '2019-03-17 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(449, 4, '1', '2018-02-19', '2019-04-01 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(450, 4, '1', '2018-02-19', '2019-04-16 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(451, 4, '1', '2018-02-19', '2019-05-01 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(452, 4, '1', '2018-02-19', '2019-05-16 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(453, 4, '1', '2018-02-19', '2019-05-31 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(454, 4, '1', '2018-02-19', '2019-06-15 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(455, 4, '1', '2018-02-19', '2019-06-30 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(456, 4, '1', '2018-02-19', '2019-07-15 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(457, 4, '1', '2018-02-19', '2019-07-30 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(458, 4, '1', '2018-02-19', '2019-08-14 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(459, 4, '1', '2018-02-19', '2019-08-29 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(460, 4, '1', '2018-02-19', '2019-09-13 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(461, 4, '1', '2018-02-19', '2019-09-28 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(462, 4, '1', '2018-02-19', '2019-10-13 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(463, 4, '1', '2018-02-19', '2019-10-28 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(464, 4, '1', '2018-02-19', '2019-11-12 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(465, 4, '1', '2018-02-19', '2019-11-27 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(466, 4, '1', '2018-02-19', '2019-12-12 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(467, 4, '1', '2018-02-19', '2019-12-27 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(468, 4, '1', '2018-02-19', '2020-01-11 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(469, 4, '1', '2018-02-19', '2020-01-26 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(470, 4, '1', '2018-02-19', '2020-02-10 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(471, 4, '1', '2018-02-19', '2020-02-25 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(472, 4, '1', '2018-02-19', '2020-03-11 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(473, 4, '1', '2018-02-19', '2020-03-26 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(474, 4, '1', '2018-02-19', '2020-04-10 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(475, 4, '1', '2018-02-19', '2020-04-25 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(476, 4, '1', '2018-02-19', '2020-05-10 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(477, 4, '1', '2018-02-19', '2020-05-25 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(478, 4, '1', '2018-02-19', '2020-06-09 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(479, 4, '1', '2018-02-19', '2020-06-24 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(480, 4, '1', '2018-02-19', '2020-07-09 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(481, 4, '1', '2018-02-19', '2020-07-24 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(482, 4, '1', '2018-02-19', '2020-08-08 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(483, 4, '1', '2018-02-19', '2020-08-23 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(484, 4, '1', '2018-02-19', '2020-09-07 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(485, 4, '1', '2018-02-19', '2020-09-22 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(486, 4, '1', '2018-02-19', '2020-10-07 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(487, 4, '1', '2018-02-19', '2020-10-22 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(488, 4, '1', '2018-02-19', '2020-11-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(489, 4, '1', '2018-02-19', '2020-11-21 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(490, 4, '1', '2018-02-19', '2020-12-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(491, 4, '1', '2018-02-19', '2020-12-21 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(492, 4, '1', '2018-02-19', '2021-01-05 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(493, 4, '1', '2018-02-19', '2021-01-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(494, 4, '1', '2018-02-19', '2021-02-04 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(495, 4, '1', '2018-02-19', '2021-02-19 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(496, 4, '1', '2018-02-19', '2021-03-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 6, 0, 0),
(497, 16, '1', '2018-02-19', '2018-02-19 12:02:00', '2018-02-10 00:00:00', '2018-03-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(498, 16, '1', '2018-02-19', '2018-02-28 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(499, 16, '1', '2018-02-19', '2018-03-30 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(500, 16, '1', '2018-02-19', '2018-04-29 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(501, 16, '1', '2018-02-19', '2018-05-29 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(502, 16, '1', '2018-02-19', '2018-02-21 11:23:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(503, 16, '1', '2018-02-19', '2018-03-23 11:23:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(504, 16, '1', '2018-02-19', '2018-04-22 11:23:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(505, 16, '1', '2018-02-19', '2018-02-22 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(506, 16, '1', '2018-02-19', '2018-03-24 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(507, 16, '1', '2018-02-19', '2018-04-23 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(508, 16, '1', '2018-02-19', '2018-05-23 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 6, 0, 0),
(509, 12, '1', '2018-02-26', '2018-02-16 11:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 1, 'C', 1, 1, 1, 1, 0, 14, '4', 4, 120, 14, 6, 0, 0),
(510, 1, '1', '2018-02-26', '2018-02-07 15:00:00', '2018-02-05 19:01:38', '2018-10-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'C', 1, 19, 1, 1, 1, 13, '2', 9, 60, 13, 6, 0, 0),
(511, 1, '1', '2018-02-26', '2018-02-23 17:00:00', '2018-02-08 14:38:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ruido en cuerpo de bomba int 0057A', 1, 'C', 1, 1, 1, 1, 0, 17, '2', 10, 60, 17, 6, 0, 0),
(512, 1, '1', '2018-02-26', '2018-02-21 22:00:00', '2018-02-05 19:01:38', '2018-10-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'As', 1, 19, 1, 1, 1, 13, '2', 9, 60, 13, 6, 0, 0),
(513, 5, '1', '2018-02-26', '2018-02-23 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(514, 5, '1', '2018-02-26', '2018-03-25 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(515, 5, '1', '2018-02-26', '2018-04-24 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(516, 5, '1', '2018-02-26', '2018-05-24 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(517, 5, '1', '2018-02-26', '2018-06-23 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(518, 5, '1', '2018-02-26', '2018-07-23 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(519, 5, '1', '2018-02-26', '2018-08-22 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(520, 5, '1', '2018-02-26', '2018-09-21 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(521, 5, '1', '2018-02-26', '2018-10-21 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(522, 5, '1', '2018-02-26', '2018-11-20 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(523, 5, '1', '2018-02-26', '2018-12-20 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(524, 5, '1', '2018-02-26', '2019-01-19 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(525, 5, '1', '2018-02-26', '2019-02-18 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(526, 5, '1', '2018-02-26', '2019-03-20 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 6, 0, 0),
(527, 12, '1', '2018-02-26', '2018-02-22 19:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 1, 'C', 1, 1, 1, 1, 0, 14, '4', 4, 60, 14, 6, 0, 0),
(528, 8, '1', '2018-03-09', '2018-03-22 02:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 1, 'C', 1, 1, 1, 1, 0, 16, '3', 4, 30, 16, 6, 0, 0),
(529, 9, '1', '2018-03-10', '2018-03-14 00:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE LOS FILTROS DE ACEITE.', 1, 'C', 1, 1, 1, 1, 0, 17, '3', 4, 0, 17, 6, 0, 0),
(530, 8, '1', '2018-03-12', '2018-03-12 01:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 1, 'C', 1, 1, 1, 1, 0, 16, '3', 4, 0, 16, 6, 0, 0),
(531, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-03-12 05:28:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'weqeqwqweqweqwewqeqwe\neqweqweqwe\nqweqw', 1, 'C', 1, 1, 0, 1, 2, 0, '1', 4, 0, NULL, 6, 0, 0),
(532, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-03-12 14:17:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'editado', 1, 'P', 1, 1, 0, 1, 1, 0, '1', 8, 0, NULL, 6, 0, 0),
(533, 1, '1', '2018-06-19', '2018-06-19 05:00:00', '2018-06-19 11:09:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla test', 1, 'AN', 3, 1, 1, 1, 0, 27, '2', 4, 60, 27, 6, 0, 0),
(534, 1, '1', '2018-06-21', '2018-06-21 05:15:00', '2018-06-19 11:17:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla testing 1', 1, 'AN', 3, 1, 1, 1, 0, 29, '2', 4, 60, 29, 6, 0, 0),
(535, 1, '1', '2018-06-21', '2018-06-21 18:00:00', '2018-06-19 11:09:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla test', 1, 'C', 3, 1, 1, 1, 0, 27, '2', 4, 60, 27, 6, 0, 0),
(536, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2018-06-22 10:33:00', '2018-06-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'orden de trabajos testing 11 editado', 1, 'C', 3, 3, 1, 1, 1, 0, '1', 11, 60, NULL, 6, 0, 0),
(537, 1, '1', '2018-06-25', '2018-06-26 15:00:00', '2018-06-25 09:29:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'fala ttesting 25-06', 1, 'C', 3, 1, 1, 1, 0, 31, '2', 4, 60, 31, 6, 0, 0),
(538, 1, '1', '2018-06-28', '2018-06-28 20:00:00', '2018-06-28 12:52:09', '2018-06-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'As', 3, 3, 1, 1, 1, 32, '2', 4, 60, 32, 6, 0, 0),
(539, 1, '1', '2018-06-28', '2018-06-28 15:00:00', '2018-06-28 12:52:09', '2018-06-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'As', 3, 3, 1, 1, 0, 32, '2', 4, 60, 32, 6, 0, 0),
(540, 1, '1', '2018-06-28', '2018-06-28 15:00:00', '2018-06-28 12:52:09', '2018-06-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'As', 3, 3, 1, 1, 0, 32, '2', 4, 60, 32, 6, 0, 0),
(541, 1, '1', '2018-06-28', '2018-06-28 15:00:00', '2018-06-28 12:52:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'C', 3, 1, 1, 1, 1, 32, '2', 4, 60, 32, 6, 0, 0),
(542, 15, '1', '2018-07-25', '2018-07-25 23:00:00', '2018-01-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambie los Filtros del Motor', 1, 'C', 1, 1, 1, 1, 0, 4, '3', 1, 30, 4, 6, 0, 0),
(543, 36, '1', '2018-07-25', '2018-07-26 23:00:00', '2018-01-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambiar Aceite de Transmisión (cada 1000hs según horometro, utilizar el aceite SAE10W). ', 1, 'C', 1, 1, 1, 1, 0, 32, '3', 2, 60, 32, 6, 0, 0),
(544, 36, '1', '2018-07-25', '2018-07-25 23:30:00', '2018-01-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambiar Aceite de Transmisión (cada 1000hs según horometro, utilizar el aceite SAE10W). ', 1, 'C', 1, 1, 1, 1, 0, 32, '3', 2, 30, 32, 6, 0, 0),
(545, 3, '1', '2018-07-28', '2018-07-28 20:15:00', '2018-01-01 00:00:00', '2018-10-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambie Liquido de Refrigerante de Motor (Revise la Mezcla Anticongelante antes de la Epoca Invernal).', 1, 'As', 1, 1, 1, 1, 2, 97, '3', 5, 20, 97, 6, 0, 0),
(546, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-09-24 18:09:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'hhhhh', 1, 'C', 19, 1, 0, 1, 0, 0, '1', 1, 0, NULL, 0, 0, 0),
(547, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-09-24 18:10:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'barrer la vereda', 1, 'C', 16, 1, 0, 1, 0, 0, '1', 13, 0, NULL, 0, 0, 0),
(548, NULL, '8000', '0000-00-00', '0000-00-00 00:00:00', '2018-09-24 18:15:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ver', 1, 'C', 16, 1, 0, 1, 0, 0, '1', 13, 0, NULL, 0, 0, 0),
(549, 113, '1', '2018-09-24', '0000-00-00 00:00:00', '2018-09-26 00:00:00', '2018-10-08 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de Vidrios ', 1, 'AN', 19, 16, 1, 1, 0, 131, '3', 13, 1, 131, 7, 0, 0),
(550, 121, '1', '2018-09-24', '0000-00-00 00:00:00', '2018-09-24 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Regulación Eléctrica de Joysticks ', 1, 'AN', 16, 1, 1, 1, 0, 130, '3', 13, 2, 130, 7, 0, 0),
(551, 113, '1', '2018-09-24', '0000-00-00 00:00:00', '2018-09-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de Vidrios ', 1, 'AN', 19, 1, 1, 1, 0, 131, '3', 13, 1, 131, 7, 0, 0),
(552, 1, '1', '2018-09-25', '0000-00-00 00:00:00', '2018-08-30 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 122, '3', 1, 12, 122, 6, 0, 0),
(553, NULL, '1234', '0000-00-00', '0000-00-00 00:00:00', '2018-09-26 00:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '901', 1, 'C', 1, 1, 0, 1, 0, 0, '1', 13, 0, NULL, 0, 0, 0),
(554, NULL, '1111', '0000-00-00', '0000-00-00 00:00:00', '2018-09-26 00:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '11111111', 1, 'C', 1, 1, 0, 1, 0, 0, '1', 16, 0, NULL, 0, 0, 0),
(555, NULL, '11111111', '0000-00-00', '0000-00-00 00:00:00', '2018-09-26 00:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '12222222222222', 1, 'C', 1, 1, 0, 1, 0, 0, '1', 1, 0, NULL, 0, 0, 0),
(556, NULL, '1', '0000-00-00', '0000-00-00 00:00:00', '2018-09-26 00:39:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1111', 1, 'C', 1, 1, 0, 1, 0, 0, '1', 3, 0, NULL, 0, 0, 0),
(557, 9, '1', '2018-09-26', '0000-00-00 00:00:00', '2018-09-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo del Radiador.', 1, 'C', 1, 1, 1, 1, 0, 133, '3', 1, 2, 133, 6, 0, 0),
(558, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-09-28 21:32:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, 0, 0, '1', -1, 0, NULL, 0, 0, 0),
(559, 1, '1', '2018-10-02', '0000-00-00 00:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 127, '3', 1, 23, 127, 6, 0, 0),
(560, 1, '1', '2018-10-03', '0000-00-00 00:00:00', '2018-09-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 135, '3', 1, 33, 135, 6, 0, 0),
(561, 1, '1', '2018-10-03', '0000-00-00 00:00:00', '2018-09-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 135, '3', 1, 33, 135, 6, 0, 0),
(562, 108, '1', '2018-10-03', '0000-00-00 00:00:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(563, NULL, '0033', '0000-00-00', '0000-00-00 00:00:00', '2018-10-03 23:12:00', '2018-10-03 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0033 - 123456798 - suc capital - trazalog', 1, 'As', 1, 1, 0, 2, 2, 0, '1', 18, 0, NULL, 6, 0, 0),
(564, 64, '1', '2018-10-03', '2018-10-03 23:45:00', '2018-07-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 1, 'C', 1, 1, 1, 1, 0, 60, '3', 3, 15, 60, 6, 0, 0),
(565, 1, '1', '2018-10-03', '2018-10-05 10:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 127, '3', 1, 23, 127, 6, 0, 0),
(566, 1, '1', '2018-10-03', '2018-10-14 00:00:00', '2018-09-25 10:23:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'equipo averiado ', 1, 'C', 1, 1, 1, 1, 0, 51, '2', 1, 60, 51, 6, 0, 0),
(567, 1, '1', '2018-10-03', '2018-09-14 00:00:00', '2018-09-25 10:23:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'equipo averiado ', 1, 'C', 1, 1, 1, 1, 0, 51, '2', 1, 60, 51, 6, 0, 0),
(568, NULL, '11223344', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 10:41:00', '2018-10-24 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'nueva ot 123456789', 1, 'As', 1, 1, 0, 1, 1, 0, '1', 18, 0, NULL, 6, 0, 0),
(569, 1, '1', '2018-10-04', '2018-10-10 12:56:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 1, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(570, 64, '1', '2018-10-04', '2018-10-31 07:17:00', '2018-07-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 1, 'C', 1, 1, 1, 1, 0, 60, '3', 3, 15, 60, 6, 0, 0),
(571, 64, '1', '2018-10-04', '2019-02-20 07:17:00', '2018-07-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 1, 'C', 1, 1, 1, 1, 0, 60, '3', 3, 15, 60, 6, 0, 0),
(572, 64, '1', '2018-10-04', '2019-06-12 07:17:00', '2018-07-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 1, 'C', 1, 1, 1, 1, 0, 60, '3', 3, 15, 60, 6, 0, 0),
(573, 9, '1', '2018-10-04', '2018-10-25 00:00:00', '2018-09-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo del Radiador.', 1, 'C', 1, 1, 1, 1, 0, 133, '3', 1, 2, 133, 6, 0, 0),
(574, NULL, '11112222', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 12:03:00', '2018-10-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'eli', 1, 'AN', 1, 1, 0, 1, 1, 0, '1', 9, 0, NULL, 6, 0, 0),
(575, NULL, '333', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 12:05:00', '2018-10-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '666', 1, 'As', 1, 19, 0, 2, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(576, NULL, '9347923984734', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 12:08:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'jhgffgsdjfgsdhf', 1, 'C', 1, 1, 0, 1, 1, 0, '1', 18, 0, NULL, 6, 0, 0),
(577, NULL, '112233', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 12:13:00', '2018-10-31 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'nueva orden de trabajo', 1, 'As', 1, 1, 0, 1, 1, 0, '1', 18, 0, NULL, 6, 0, 0),
(578, NULL, '9996', '0000-00-00', '0000-00-00 00:00:00', '2018-10-04 13:41:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '999 ultimaxx', 1, 'C', 1, 1, 0, 2, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(579, NULL, '1122334455', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 10:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'nueva orden de tabajo ', 1, 'AN', 1, 1, 0, 1, 1, 0, '1', 9, 0, NULL, 6, 0, 0),
(580, NULL, '4536', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 10:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3456', 1, 'AN', 1, 1, 0, 1, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(581, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 10:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', -1, 0, NULL, 6, 0, 0),
(582, NULL, '111', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, 0, 0, 0, '1', 0, 0, NULL, 6, 0, 0),
(583, NULL, '1234', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 13:06:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1234', 1, 'C', 1, 1, 0, -1, -1, 0, '1', 9, 0, NULL, 6, 0, 0),
(584, NULL, '540', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '540', 1, 'AN', 1, 1, 0, 1, 1, 0, '1', 9, 0, NULL, 6, 0, 0),
(585, NULL, '222', '0000-00-00', '0000-00-00 00:00:00', '2018-10-05 13:07:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '222', 1, 'AN', 1, 1, 0, 1, 2, 0, '1', 5, 0, NULL, 6, 0, 0),
(586, 1, '1', '2018-10-05', '2018-10-05 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(587, 1, '1', '2018-10-05', '2018-11-19 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(588, 1, '1', '2018-10-05', '2019-01-03 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(589, 1, '1', '2018-10-05', '2019-02-17 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(590, 1, '1', '2018-10-05', '2019-04-03 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0);
INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`, `lectura_programada`, `lectura_ejecutada`) VALUES
(591, 1, '1', '2018-10-05', '2019-05-18 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(592, 1, '1', '2018-10-05', '2019-07-02 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(593, 1, '1', '2018-10-05', '2019-08-16 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(594, 1, '1', '2018-10-05', '2019-09-30 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(595, 1, '1', '2018-10-05', '2019-11-14 12:00:00', '2018-09-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 1, 'C', 19, 1, 1, 1, 0, 126, '3', 1, 23, 126, 6, 0, 0),
(596, NULL, '23', '0000-00-00', '0000-00-00 00:00:00', '2018-10-06 09:46:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'sdadasda', 1, 'AN', 1, 1, 0, 1, 1, 0, '1', 9, 0, NULL, 6, 0, 0),
(597, 129, '1', '2018-10-08', '2018-10-25 00:00:00', '2018-10-08 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'AN', 18, 1, 1, 1, 0, 25, '5', 13, 2, 25, 7, 0, 0),
(598, 1, '1', '2018-10-08', '2018-10-25 00:00:00', '2018-10-08 08:47:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Engrase de cardan ', 1, 'AN', 18, 1, 1, 1, 0, 73, '2', 16, 60, 73, 7, 0, 0),
(599, 1, '1', '2018-10-08', '2018-10-08 00:00:00', '2018-10-08 12:05:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ggg', 1, 'C', 1, 1, 1, 1, 0, 75, '2', 13, 60, 75, 6, 0, 0),
(600, NULL, '0014', '0000-00-00', '0000-00-00 00:00:00', '2018-10-25 11:47:58', '2018-10-31 11:47:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'eliana probando nueva', 1, 'C', 1, 1, 0, 2, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(601, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-08 12:37:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', 9, 0, NULL, 6, 0, 0),
(602, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-08 12:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', 9, 0, NULL, 6, 0, 0),
(603, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-12 11:38:00', '2018-10-13 11:38:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'test', 1, 'AN', 19, 1, 0, 4, 5, 0, '1', 14, 0, NULL, 7, 0, 0),
(604, NULL, '334', '0000-00-00', '0000-00-00 00:00:00', '2018-10-20 09:08:00', '2018-10-20 11:14:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'sadad', 1, 'C', 20, 1, 0, 4, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(605, NULL, '33', '0000-00-00', '0000-00-00 00:00:00', '2018-10-20 09:08:00', '2018-10-20 11:14:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'dasd', 1, 'C', 20, 1, 0, 4, 3, 0, '1', 14, 0, NULL, 7, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE IF NOT EXISTS `paises` (
  `Codigo` varchar(2) NOT NULL,
  `Pais` varchar(100) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`Codigo`, `Pais`) VALUES
('AR', 'Argentina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametroequipo`
--

CREATE TABLE IF NOT EXISTS `parametroequipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paramId` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `fechahora` datetime NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_equipo` (`id_equipo`),
  KEY `paramId` (`paramId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `parametroequipo`
--

INSERT INTO `parametroequipo` (`id`, `paramId`, `id_equipo`, `valor`, `fechahora`, `id_empresa`) VALUES
(1, 1, 1, '67', '2017-11-09 16:09:02', 6),
(2, 1, 1, '56', '2017-11-16 08:57:55', 6),
(3, 1, 1, '23', '2017-11-21 11:44:46', 6),
(4, 1, 1, '150', '2017-11-29 04:38:11', 6),
(5, 2, 2, '88888', '2017-11-29 04:39:02', 6),
(6, 3, 3, '34', '2017-12-02 03:01:45', 6),
(7, 3, 3, '34', '2017-12-02 03:02:41', 6),
(8, 3, 3, '45', '2017-12-02 03:02:59', 6),
(9, 3, 3, '34', '2017-12-02 03:26:30', 6),
(10, 2, 2, '45', '2017-12-02 03:33:22', 6),
(11, 1, 3, '444', '2017-12-02 03:43:37', 6),
(12, 1, 3, '56', '2017-12-02 03:45:01', 6),
(13, 1, 7, '56', '2017-12-02 03:45:59', 6),
(14, 1, 3, '45', '2017-12-02 03:50:41', 6),
(15, 3, 3, '55555', '2017-12-02 04:25:07', 6),
(16, 3, 3, '444', '2017-12-02 04:27:55', 6),
(17, 3, 3, '445', '2017-12-02 04:58:08', 6),
(18, 1, 3, '12', '2017-12-02 05:02:48', 6),
(19, 1, 3, '45', '2017-12-02 06:46:42', 6),
(20, 1, 7, '78', '2017-12-11 04:50:13', 6),
(21, 1, 7, '12', '2017-12-11 04:50:23', 6),
(22, 1, 1, '25', '2017-12-11 04:56:50', 6),
(23, 1, 7, '34', '2017-12-11 11:28:24', 6),
(24, 1, 7, '45', '2017-12-11 11:28:40', 6),
(25, 1, 7, '34', '2017-12-11 11:29:00', 6),
(26, 2, 1, '44', '2017-12-11 11:29:15', 6),
(27, 1, 2, '444', '2017-12-11 11:29:29', 6),
(28, 8, 4, '45', '2018-02-08 17:55:28', 6),
(29, 8, 4, '67', '2018-02-08 17:56:05', 6),
(30, 10, 4, '200', '2018-06-27 12:38:59', 6),
(31, 1, 2, '34', '2018-07-27 03:07:47', 0),
(32, 1, 2, '20', '2018-08-01 08:13:50', 0),
(33, 13, 1, '45', '2018-08-01 08:15:07', 0),
(34, 13, 1, '20', '2018-09-20 11:50:18', 0),
(35, 13, 1, '22', '2018-09-20 12:29:16', 0),
(36, 13, 1, '5', '2018-09-20 12:29:41', 0),
(37, 13, 1, '5', '2018-09-20 12:29:54', 0),
(38, 13, 1, '3', '2018-09-20 12:32:44', 0),
(39, 13, 1, '44', '2018-09-20 12:33:04', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE IF NOT EXISTS `parametros` (
  `paramId` int(11) NOT NULL AUTO_INCREMENT,
  `paramdescrip` varchar(255) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`paramId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`paramId`, `paramdescrip`, `min`, `estado`, `id_empresa`) VALUES
(1, 'TEMPERATURA', NULL, 'AC', 6),
(10, 'VIBRACION', NULL, 'AC', 6),
(11, 'AMPERAJE', NULL, 'AC', 6),
(13, 'HUMEDAD', NULL, 'AC', 6),
(17, 'rer', NULL, 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predictivo`
--

CREATE TABLE IF NOT EXISTS `predictivo` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `predictivo`
--

INSERT INTO `predictivo` (`predId`, `id_equipo`, `tarea_descrip`, `fecha`, `periodo`, `cantidad`, `horash`, `estado`, `pred_duracion`, `id_unidad`, `pred_canth`, `id_empresa`) VALUES
(1, 1, '4', '2017-11-07', 'Diario', 30, NULL, 'C', 0, 0, 0, 0),
(2, 2, '5', '0000-00-00', 'Diario', 15, NULL, 'C', 0, 0, 0, 0),
(3, 1, '6', '0000-00-00', 'Periodos', 15, NULL, 'C', 0, 0, 0, 0),
(4, 1, '4', '2017-11-24', 'Diario', 15, NULL, 'AN', 0, 0, 0, 0),
(5, 1, '5', '2017-12-09', 'Diario', 23, NULL, 'C', 0, 0, 0, 0),
(6, 2, '6', '2017-12-11', 'Diario', 20, 5, 'C', 0, 0, 0, 0),
(7, 4, '15', '0002-07-08', 'Mensual', 51, 1, 'C', 0, 0, 0, 0),
(8, 4, '16', '0002-10-08', 'Diario', 30, 96, 'AN', 2, 3, 2, 6),
(9, 10, '6', '0000-00-00', 'Diario', 7, 4, 'C', 2, 2, 2, 6),
(10, 7, '4', '0000-00-00', 'Diario', 10, 24, 'C', 12, 2, 2, 6),
(11, 4, '10', '2018-05-29', 'Diario', 30, 25, 'C', 0, 0, 0, 0),
(12, 10, '7', '0000-00-00', 'Diario', 30, 1, 'AN', 60, 1, 1, 6),
(13, 5, '4', '0000-00-00', 'Diario', 30, 0, 'AN', 60, 1, 2, 6),
(14, -1, '-1', '2018-05-30', 'Diario', 0, NULL, 'C', 0, -1, 0, 6),
(15, -1, '-1', '2018-05-30', 'Diario', 0, NULL, 'C', 0, -1, 0, 6),
(16, -1, '-1', '2018-05-31', 'Diario', 0, NULL, 'C', 0, -1, 0, 6),
(17, 10, '9', '2018-05-23', 'Diario', 30, 384, 'AN', 8, 3, 2, 6),
(18, 11, '15', '2018-06-28', 'Diario', 21, 1, 'C', 60, 1, 1, 6),
(19, 1, '1', '2018-08-30', 'Diario', 12, 1, 'C', 12, 1, 5, 6),
(20, 1, '1', '2018-09-05', 'Diario', 6, 2, 'C', 23, 1, 5, 6),
(21, 1, '20', '2018-09-05', 'Diario', 4, 0, 'C', 3, 1, 5, 6),
(22, 9, '16', '0000-00-00', 'Diario', 2, 2, 'AN', 20, 1, 6, 6),
(23, 9, '1', '2018-10-24', 'Diario', 222, 99, 'AN', 33, 2, 3, 6),
(24, 9, '109', '2018-10-31', 'Diario', 33, NULL, 'AN', 0, 1, 0, 6),
(25, 13, '129', '2018-10-08', 'Diario', 1, NULL, 'AN', 2, 2, 1, 7),
(26, 9, '111', '2018-10-08', 'Diario', 2, 8, 'C', 100, 1, 5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preventivo`
--

CREATE TABLE IF NOT EXISTS `preventivo` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=146 ;

--
-- Volcado de datos para la tabla `preventivo`
--

INSERT INTO `preventivo` (`prevId`, `id_equipo`, `id_tarea`, `perido`, `cantidad`, `ultimo`, `id_componente`, `critico1`, `fechaprobable`, `horash`, `estadoprev`, `prev_duracion`, `id_unidad`, `prev_canth`, `prev_adjunto`, `id_empresa`, `lectura_base`) VALUES
(1, 1, 4, 'Diario', 14, '2018-01-01', 1, 0, NULL, 2, 'C', 60, 1, 2, NULL, 6, 0),
(2, 1, 1, 'Diario', 7, '2018-01-03', 1, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(3, 1, 3, 'Diario', 14, '2018-01-01', 1, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(4, 1, 15, 'Diario', 42, '2018-01-01', 1, 0, NULL, 0, 'C', 12, 1, 3, NULL, 6, 0),
(5, 1, 5, 'Diario', 84, '2018-01-01', 1, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(6, 1, 6, 'Diario', 14, '2018-01-01', 2, 0, NULL, 0, 'C', 15, 1, 1, NULL, 6, 0),
(7, 1, 7, 'Diario', 14, '2018-01-03', 3, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(8, 1, 8, 'Diario', 35, '2018-01-03', 4, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(9, 1, 9, 'Diario', 140, '2018-01-03', 5, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(10, 1, 10, 'Diario', 14, '2018-01-03', 26, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(11, 1, 11, 'Diario', 105, '2018-01-01', 26, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(12, 1, 12, 'Diario', 35, '2018-01-01', 26, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(13, 1, 13, 'Diario', 35, '2018-01-01', 26, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(14, 1, 14, 'Diario', 70, '2018-01-01', 26, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(15, 1, 22, 'Diario', 14, '2018-01-01', 28, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(16, 1, 21, 'Diario', 14, '2018-01-01', 28, 0, NULL, 0, 'C', 15, 1, 1, NULL, 6, 0),
(17, 1, 20, 'Diario', 14, '2018-01-03', 28, 0, NULL, 1, 'C', 30, 1, 1, NULL, 6, 0),
(18, 1, 16, 'Diario', 105, '2018-01-01', 27, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(19, 1, 17, 'Diario', 105, '2018-01-03', 27, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(20, 1, 18, 'Diario', 105, '2018-01-01', 27, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(21, 1, 19, 'Diario', 140, '2018-01-03', 27, 0, NULL, 2, 'AN', 30, 1, 4, NULL, 6, 0),
(22, 1, 26, 'Diario', 70, '2018-01-01', 30, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(23, 2, 27, 'Diario', 7, '2018-01-01', 6, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(24, 2, 28, 'Diario', 84, '2018-01-03', 7, 0, NULL, 32, 'C', 480, 1, 4, NULL, 6, 0),
(25, 2, 29, 'Diario', 14, '2018-01-03', 8, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(26, 2, 30, 'Diario', 14, '2018-01-01', 9, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(27, 2, 31, 'Diario', 14, '2018-01-01', 10, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(28, 2, 32, 'Diario', 2, '2018-01-01', 31, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(29, 2, 33, 'Diario', 14, '2018-01-01', 31, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(31, 2, 35, 'Diario', 56, '2018-01-01', 31, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(32, 2, 36, 'Diario', 56, '2018-01-01', 32, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(33, 2, 37, 'Diario', 56, '2018-01-01', 32, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(34, 2, 38, 'Diario', 96, '2018-01-01', 33, 0, NULL, 6, 'C', 120, 1, 3, NULL, 6, 0),
(35, 2, 39, 'Diario', 30, '2018-01-01', 33, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(36, 2, 40, 'Diario', 2, '2018-01-01', 34, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(37, 2, 41, 'Diario', 168, '2018-01-01', 34, 0, NULL, 9, 'C', 180, 1, 3, NULL, 6, 0),
(38, 2, 42, 'Diario', 2, '2018-01-01', 35, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(39, 2, 43, 'Diario', 2, '2018-07-04', 36, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(40, 2, 44, 'Diario', 14, '2018-07-04', 37, 0, NULL, 1, 'C', 15, 1, 2, NULL, 6, 0),
(41, 2, 45, 'Diario', 14, '2018-07-04', 38, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(42, 2, 46, 'Diario', 14, '2018-01-01', 39, 0, NULL, 1, 'C', 40, 1, 2, NULL, 6, 0),
(43, 2, 47, 'Diario', 364, '2018-01-01', 40, 0, NULL, 150, 'C', 3000, 1, 3, NULL, 6, 0),
(44, 2, 48, 'Diario', 7, '2018-01-01', 41, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(45, 2, 49, 'Diario', 14, '2018-01-01', 42, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(46, 2, 50, 'Diario', 14, '2018-01-01', 43, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(47, 2, 51, 'Diario', 14, '2018-01-01', 44, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(48, 3, 52, 'Diario', 56, '2018-01-01', 11, 0, NULL, 6, 'C', 180, 1, 2, NULL, 6, 0),
(49, 3, 53, 'Diario', 14, '2018-01-01', 12, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(50, 3, 54, 'Diario', 14, '2018-01-01', 13, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(51, 3, 55, 'Diario', 14, '2018-01-01', 14, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(52, 3, 56, 'Diario', 2, '2018-01-01', 15, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(53, 3, 57, 'Diario', 56, '2018-01-01', 46, 0, NULL, 6, 'C', 180, 1, 2, NULL, 6, 0),
(54, 3, 58, 'Diario', 2, '2018-07-04', 59, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(55, 3, 59, 'Diario', 28, '2018-07-04', 47, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(56, 3, 60, 'Diario', 56, '2018-07-04', 48, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(57, 3, 61, 'Diario', 14, '2018-01-01', 49, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(58, 3, 62, 'Diario', 112, '2018-01-01', 49, 0, NULL, 1, 'C', 15, 1, 2, NULL, 6, 0),
(59, 3, 63, 'Diario', 2, '2018-01-01', 50, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(60, 3, 64, 'Diario', 112, '2018-07-04', 50, 0, NULL, 1, 'C', 15, 1, 2, NULL, 6, 0),
(61, 3, 0, 'Diario', 56, '2018-01-01', 51, 0, NULL, 3, 'C', 34, 1, 5, NULL, 6, 0),
(62, 3, 66, 'Diario', 2, '2018-01-01', 52, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(63, 3, 67, 'Diario', 14, '2018-01-01', 52, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(64, 3, 68, 'Diario', 2, '2018-01-01', 53, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(65, 3, 69, 'Diario', 112, '2018-01-01', 53, 0, NULL, 8, 'C', 240, 1, 2, NULL, 6, 0),
(66, 3, 70, 'Diario', 14, '2018-01-01', 54, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(67, 3, 71, 'Diario', 14, '2018-01-01', 54, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(68, 3, 72, 'Diario', 14, '2018-01-01', 54, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(69, 3, 72, 'Diario', 14, '2018-01-01', 54, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(70, 3, 73, 'Diario', 56, '2018-01-01', 55, 0, NULL, 4, 'C', 120, 1, 2, NULL, 6, 0),
(71, 3, 74, 'Diario', 14, '2018-01-01', 56, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(72, 3, 75, 'Diario', 30, '2018-01-01', 57, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(73, 3, 76, 'Diario', 182, '2018-01-01', 58, 0, NULL, 24, 'C', 480, 1, 3, NULL, 6, 0),
(74, 4, 77, 'Diario', 2, '2018-01-01', 16, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(75, 4, 78, 'Diario', 28, '2018-01-01', 17, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(76, 4, 80, 'Diario', 2, '2018-01-01', 17, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(77, 4, 81, 'Diario', 2, '2018-01-01', 18, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(78, 4, 83, 'Diario', 14, '2018-01-01', 20, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(79, 4, 84, 'Diario', 14, '2018-01-01', 20, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(80, 4, 86, 'Diario', 84, '2018-01-01', 61, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(81, 4, 85, 'Diario', 28, '2018-01-01', 61, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(82, 4, 87, 'Diario', 28, '2018-01-01', 62, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(83, 4, 88, 'Diario', 28, '2018-01-01', 63, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(84, 4, 85, 'Diario', 28, '2018-01-01', 63, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(85, 4, 91, 'Diario', 14, '2018-01-01', 64, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(86, 4, 81, 'Diario', 2, '2018-01-01', 18, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(87, 4, 90, 'Diario', 14, '2018-07-05', 65, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(88, 4, 90, 'Diario', 14, '2018-07-05', 65, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(89, 4, 92, 'Diario', 28, '2018-01-01', 66, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(90, 4, 93, 'Diario', 2, '2018-01-01', 67, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(91, 4, 94, 'Diario', 2, '2018-01-01', 68, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(92, 4, 95, 'Diario', 2, '2018-01-01', 69, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(93, 4, 96, 'Diario', 2, '2018-01-01', 70, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(94, 4, 97, 'Diario', 2, '2018-01-01', 71, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(95, 5, 1, 'Diario', 30, '2018-01-01', 21, 0, NULL, 3, 'C', 60, 1, 3, NULL, 6, 0),
(96, 5, 2, 'Diario', 2, '2018-01-01', 21, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(97, 5, 3, 'Diario', 182, '2018-01-01', 21, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(98, 5, 4, 'Diario', 2, '2018-01-01', 21, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(99, 5, 5, 'Diario', 2, '2018-01-01', 21, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(100, 5, 10, 'Diario', 2, '2018-01-01', 22, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(101, 5, 11, 'Diario', 105, '2018-01-01', 22, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(102, 5, 12, 'Diario', 14, '2018-01-01', 22, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(103, 5, 13, 'Diario', 14, '2018-01-01', 22, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(104, 5, 14, 'Diario', 70, '2018-01-01', 22, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(105, 5, 16, 'Diario', 14, '2018-01-01', 23, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(106, 5, 17, 'Diario', 35, '2018-01-01', 23, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(107, 5, 18, 'Diario', 35, '2018-01-01', 23, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(108, 5, 19, 'Diario', 35, '2018-01-01', -1, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(109, 5, 26, 'Diario', 14, '2018-01-01', 25, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(110, 5, 108, 'Diario', 35, '2018-10-26', 24, 0, NULL, 0, 'C', 0, -1, 0, NULL, 6, 0),
(111, 5, 109, 'Diario', 70, '2018-01-01', 23, 0, NULL, 0, 'C', 15, 1, 1, NULL, 6, 0),
(112, 5, 98, 'Diario', 2, '2018-01-01', 21, 0, NULL, 0, 'C', 10, 1, 1, NULL, 6, 0),
(113, 5, 105, 'Diario', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 20, 1, 1, NULL, 6, 0),
(114, 5, 100, 'Diario', 28, '2018-01-01', 21, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(115, 5, 101, 'Diario', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 5, 1, 1, NULL, 6, 0),
(116, 5, 102, 'Diario', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 5, 1, 2, NULL, 6, 0),
(117, 5, 103, 'Diario', 14, '2018-01-01', 21, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(118, 5, 104, 'Diario', 14, '2018-01-01', 21, 0, NULL, 1, 'C', 30, 1, 2, NULL, 6, 0),
(119, 5, 105, 'Diario', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(120, 5, 106, 'Diario', 14, '2018-01-01', 21, 0, NULL, 0, 'C', 10, 1, 2, NULL, 6, 0),
(121, 5, 107, 'Diario', 56, '2018-01-01', 21, 0, NULL, 1, 'C', 20, 1, 2, NULL, 6, 0),
(122, 1, 1, 'Diario', 12, '2018-08-30', 1, 0, NULL, 2, 'C', 12, 1, 10, NULL, 6, 0),
(123, 1, 1, 'Diario', 2, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(124, 1, 1, 'Diario', 2, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(125, 1, 1, 'Diario', 2, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(126, 1, 1, 'Diario', 45, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(127, 1, 1, 'Diario', 45, '2018-09-05', 1, 0, NULL, 2, 'C', 23, 1, 4, NULL, 6, 0),
(128, 1, 1, 'Diario', 2, '2018-09-15', 1, 0, NULL, 0, 'C', 1, 1, 2, '128_6_2018-09-15-02-15-19.jpg', 6, 0),
(129, 13, 112, 'Diario', 1, '0000-00-00', 80, 0, NULL, 1, 'AN', 1, 2, 1, NULL, 7, 0),
(130, 13, 121, 'Diario', 1, '2018-09-24', 127, 0, NULL, 4, 'AN', 2, 2, 2, NULL, 7, 0),
(131, 13, 113, 'Diario', 1, '2018-09-26', 115, 0, NULL, 0, 'AN', 1, 1, 2, NULL, 7, 0),
(132, 13, 113, 'Diario', 1, '2018-09-26', 115, 0, NULL, 0, 'AN', 1, 1, 2, NULL, 7, 0),
(133, 1, 9, 'Diario', 1, '2018-09-25', 30, 0, NULL, 4, 'C', 2, 2, 2, NULL, 6, 0),
(134, 1, 1, 'Diario', 22, '2018-09-26', 1, 0, NULL, 3, 'C', 33, 1, 5, '134_6_2018-09-26-00-21-02.png', 6, 0),
(135, 1, 1, 'Diario', 22, '2018-09-26', 1, 0, NULL, 3, 'C', 33, 1, 5, '135_6_2018-09-26-00-21-12.png', 6, 0),
(136, 5, 111, 'Diario', 22, '2018-12-25', 25, 0, NULL, 3, 'AN', 0, -1, 0, '136_6_2018-09-26-00-26-16.png', 6, 0),
(137, 5, 2, 'Diario', 222, '2018-10-02', 21, 0, NULL, 2, 'C', 33, 1, 3, NULL, 6, 0),
(138, 9, 111, 'Diario', 2, '2018-10-02', 1, 0, NULL, 2, 'AN', 33, 1, 4, NULL, 6, 0),
(139, 5, 109, 'Diario', 222, '2018-10-02', 22, 0, NULL, 2, 'C', 33, 1, 3, NULL, 6, 0),
(140, 5, 108, 'Diario', 2, '0000-00-00', 24, 0, NULL, 600, 'C', 100, 2, 6, NULL, 6, 0),
(141, 18, 111, 'Diario', 222, '2018-10-03', 1, 0, NULL, 4, 'AN', 50, 1, 5, NULL, 6, 0),
(142, 9, 3, 'Diario', 60, '2018-10-04', 200, 0, NULL, 0, 'C', 1, 1, 2, NULL, 6, 0),
(143, 9, 15, 'Horas', 250, '2018-10-19', 1, 200, NULL, 4, 'C', 2, 2, 2, NULL, 6, 1000),
(144, 9, 15, 'Ciclos', 250, '2018-10-19', 1, 200, NULL, 6, 'C', 3, 2, 2, NULL, 6, 1310);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE IF NOT EXISTS `proceso` (
  `id_proceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_proceso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `proceso`
--

INSERT INTO `proceso` (`id_proceso`, `descripcion`, `id_empresa`, `estado`) VALUES
(1, 'un proceso nuevo 1', 0, 'AN'),
(2, 'nuevo proceso 001', 0, 'AN'),
(3, 'Extracción y Transporte', 0, 'AC'),
(4, 'proceso nuevo', 6, 'AN'),
(5, 'proceso emp 6', 6, 'AN'),
(6, 'proceso testing', 6, 'AN'),
(7, 'EXTRACCIÓN Y TRANSPORTE DE MINERAL', 6, 'AC'),
(8, 'Extracción y Transporte De Mineral', 6, 'AC'),
(9, 'Proceso 8', 6, 'AC'),
(11, 'Perforación', 7, 'AC'),
(12, 'Perforación y Voladura', 6, 'AC'),
(13, 'Operaciones', 7, 'AC'),
(14, 'Mantenimiento', 7, 'AC'),
(15, 'Capacitacion', 7, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitos`
--

CREATE TABLE IF NOT EXISTS `remitos` (
  `remitoId` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `provid` int(11) NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`remitoId`),
  KEY `provid` (`provid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `remitos`
--

INSERT INTO `remitos` (`remitoId`, `fecha`, `provid`, `comprobante`, `id_empresa`) VALUES
(15, '2018-10-01 00:00:00', 1, '111', 6),
(16, '2018-10-02 23:08:25', 1, '222', 6),
(17, '2018-10-03 23:10:27', 2, '333', 6),
(18, '2018-10-28 11:39:31', 1, '03 03 03', 6),
(19, '2018-10-27 11:44:51', 2, '34343', 6),
(20, '2018-10-10 14:53:46', 1, '100', 6),
(21, '2018-10-27 14:57:56', 3, '111', 7),
(22, '2018-10-30 09:38:12', 1, '42291', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

CREATE TABLE IF NOT EXISTS `rubro` (
  `id_rubro` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rubro`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE IF NOT EXISTS `sector` (
  `id_sector` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_sector`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `sector`
--

INSERT INTO `sector` (`id_sector`, `descripcion`, `estado`, `id_empresa`) VALUES
(10, 'Equipos Moviles', 'AC', 6),
(11, 'Administración', 'AC', 6),
(12, 'Perforación', 'AC', 6),
(13, 'Carga', 'AC', 6),
(14, 'Perforadoras Tamrock', 'AN', 7),
(15, 'Perforación y Voladura', 'AC', 7),
(16, 'eli sector/etapa', 'AN', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE IF NOT EXISTS `seguro` (
  `id_seguro` int(11) NOT NULL AUTO_INCREMENT,
  `asegurado` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `ref` int(11) NOT NULL,
  `numero_pliza` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_vigencia` datetime NOT NULL,
  `cobertura` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL,
  PRIMARY KEY (`id_seguro`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=247 ;

--
-- Volcado de datos para la tabla `seguro`
--

INSERT INTO `seguro` (`id_seguro`, `asegurado`, `ref`, `numero_pliza`, `fecha_inicio`, `fecha_vigencia`, `cobertura`, `id_equipo`) VALUES
(1, 'empresa xxx', 1111111, 11112221, '2017-07-10 00:00:00', '2017-07-18 00:00:00', '12 dias', 5),
(2, '1', 123, 123, '2017-07-10 00:00:00', '2017-07-25 00:00:00', '1234', 6),
(3, '123 juan peres', 1234, 12345, '2017-07-10 00:00:00', '2017-07-10 00:00:00', '123456', 1),
(4, 'gemma empresa', 33333321, 2147483647, '2017-07-12 00:00:00', '2017-07-12 00:00:00', 'A', 0),
(5, 'gemme empresa2', 52652, 500001, '2017-07-12 00:00:00', '2017-07-12 00:00:00', 'A', 0),
(242, 'empres hugo pepe', 1414, 14145, '2017-07-12 00:00:00', '2017-07-12 00:00:00', '12 dias', 0),
(243, 'gemma nueva empresa', 56213, 56213000, '2017-07-12 00:00:00', '2017-07-12 00:00:00', '1 meses', 0),
(244, 'nueva emresa julieta 34434', 45454, 45454, '2017-07-12 00:00:00', '2017-07-12 00:00:00', '10 dias', 0),
(245, 'gemma nueva emresa 41 poliza', 54540, 545401, '2017-07-12 00:00:00', '2017-07-26 00:00:00', '5 dias', 242),
(246, '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setupparam`
--

CREATE TABLE IF NOT EXISTS `setupparam` (
  `id_equipo` int(11) NOT NULL,
  `id_parametro` int(11) NOT NULL,
  `maximo` double NOT NULL,
  `minimo` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_parametro`,`id_equipo`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `setupparam`
--

INSERT INTO `setupparam` (`id_equipo`, `id_parametro`, `maximo`, `minimo`, `id_empresa`) VALUES
(2, 1, 80, 10, 6),
(7, 1, 60, 30, 6),
(9, 1, 30, 90, 6),
(1, 2, 80, 10, 6),
(1, 3, 80, 15, 6),
(2, 4, 20, 100, 6),
(1, 13, 12, 23, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisactions`
--

CREATE TABLE IF NOT EXISTS `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `sisactions`
--

INSERT INTO `sisactions` (`actId`, `actDescription`, `actDescriptionSpanish`) VALUES
(1, 'Add', 'Agregar'),
(2, 'Edit', 'Editar'),
(3, 'Del', 'Eliminar'),
(4, 'View', 'Consultar'),
(5, 'Imprimir', 'Imprimir'),
(6, 'Saldo', 'Consultar Saldo'),
(7, 'Asignar', 'Asignar'),
(8, 'Finalizar', 'Finalizar'),
(9, 'OP', 'OP'),
(10, 'Pedidos', 'Pedidos'),
(11, 'Supervisor', 'Supervisor'),
(12, 'Entregar', 'Entrega de Ordenes'),
(13, 'Lectura', 'Lect horas equipos '),
(14, 'Correctivo', 'Ver Correctivos'),
(15, 'Preventivos', 'Ver Preventivos'),
(16, 'Backlog', 'Ver Backlog'),
(17, 'Predictivo', 'Ver Predictivos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisgroups`
--

CREATE TABLE IF NOT EXISTS `sisgroups` (
  `grpId` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpDash` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`grpId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `sisgroups`
--

INSERT INTO `sisgroups` (`grpId`, `grpName`, `grpDash`, `id_empresa`) VALUES
(1, 'Administrador', 'Otrabajo', 6),
(2, 'Vendedor', 'Sservicio', 6),
(3, 'Depósito', 'Sservicio', 6),
(4, 'Operario1', 'Sservicio', 6),
(5, 'Supervisor de Taller', 'Sservicio', 6),
(7, 'Mecanicos', 'escritorio', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisgroupsactions`
--

CREATE TABLE IF NOT EXISTS `sisgroupsactions` (
  `grpactId` int(11) NOT NULL AUTO_INCREMENT,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL,
  PRIMARY KEY (`grpactId`),
  KEY `grpId` (`grpId`) USING BTREE,
  KEY `menuAccId` (`menuAccId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1175 ;

--
-- Volcado de datos para la tabla `sisgroupsactions`
--

INSERT INTO `sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES
(154, 151, 1),
(158, 158, 1),
(159, 159, 1),
(160, 160, 1),
(987, 4, 116),
(988, 4, 155),
(989, 4, 156),
(990, 1, 6),
(991, 1, 7),
(992, 1, 8),
(993, 1, 9),
(994, 1, 10),
(995, 1, 11),
(996, 1, 12),
(997, 1, 13),
(998, 1, 14),
(999, 1, 15),
(1000, 1, 16),
(1001, 1, 17),
(1002, 1, 18),
(1003, 1, 19),
(1004, 1, 20),
(1005, 1, 21),
(1006, 1, 23),
(1007, 1, 24),
(1008, 1, 25),
(1009, 1, 151),
(1010, 1, 26),
(1011, 1, 27),
(1012, 1, 28),
(1013, 1, 29),
(1014, 1, 30),
(1015, 1, 31),
(1016, 1, 32),
(1017, 1, 33),
(1018, 1, 34),
(1019, 1, 35),
(1020, 1, 36),
(1021, 1, 37),
(1022, 1, 38),
(1023, 1, 39),
(1024, 1, 40),
(1025, 1, 41),
(1026, 1, 42),
(1027, 1, 43),
(1028, 1, 115),
(1029, 1, 116),
(1030, 1, 117),
(1031, 1, 155),
(1032, 1, 156),
(1033, 1, 157),
(1034, 1, 118),
(1035, 1, 119),
(1036, 1, 120),
(1037, 1, 121),
(1038, 1, 122),
(1039, 1, 123),
(1040, 1, 152),
(1041, 1, 153),
(1042, 1, 154),
(1043, 1, 177),
(1044, 1, 178),
(1045, 1, 179),
(1046, 1, 180),
(1047, 1, 64),
(1048, 1, 65),
(1049, 1, 66),
(1050, 1, 67),
(1051, 1, 68),
(1052, 1, 69),
(1053, 1, 70),
(1054, 1, 71),
(1055, 1, 72),
(1056, 1, 73),
(1057, 1, 74),
(1058, 1, 75),
(1059, 1, 79),
(1060, 1, 80),
(1061, 1, 81),
(1062, 1, 1),
(1063, 1, 2),
(1064, 1, 3),
(1065, 1, 4),
(1066, 1, 85),
(1067, 1, 86),
(1068, 1, 87),
(1069, 1, 88),
(1070, 1, 89),
(1071, 1, 90),
(1072, 1, 91),
(1073, 1, 92),
(1074, 1, 93),
(1075, 1, 94),
(1076, 1, 95),
(1077, 1, 96),
(1078, 1, 97),
(1079, 1, 98),
(1080, 1, 99),
(1081, 1, 100),
(1082, 1, 101),
(1083, 1, 102),
(1084, 1, 103),
(1085, 1, 104),
(1086, 1, 105),
(1087, 1, 106),
(1088, 1, 107),
(1089, 1, 108),
(1090, 1, 109),
(1091, 1, 110),
(1092, 1, 111),
(1093, 1, 170),
(1094, 1, 171),
(1095, 1, 172),
(1096, 1, 127),
(1097, 1, 128),
(1098, 1, 129),
(1099, 1, 130),
(1100, 1, 132),
(1101, 1, 136),
(1102, 1, 137),
(1103, 1, 138),
(1104, 1, 139),
(1105, 1, 140),
(1106, 1, 141),
(1107, 1, 142),
(1108, 1, 143),
(1109, 1, 144),
(1110, 1, 145),
(1111, 1, 146),
(1112, 1, 147),
(1113, 1, 148),
(1114, 1, 149),
(1115, 1, 150),
(1116, 1, 45),
(1117, 1, 46),
(1118, 1, 47),
(1119, 1, 48),
(1120, 1, 49),
(1121, 1, 50),
(1122, 1, 54),
(1123, 1, 55),
(1124, 1, 56),
(1125, 1, 57),
(1126, 1, 58),
(1127, 1, 59),
(1128, 1, 60),
(1129, 7, 23),
(1130, 1, 181),
(1131, 1, 182),
(1132, 1, 183),
(1133, 1, 184),
(1134, 1, 185),
(1135, 1, 186),
(1136, 1, 187),
(1137, 1, 188),
(1138, 1, 189),
(1139, 1, 190),
(1140, 1, 191),
(1141, 1, 192),
(1142, 1, 193),
(1143, 1, 194),
(1144, 1, 195),
(1145, 1, 196),
(1155, 1, 197),
(1156, 1, 198),
(1157, 1, 199),
(1158, 1, 200),
(1159, 1, 201),
(1160, 1, 202),
(1161, 1, 203),
(1162, 1, 204),
(1163, 1, 205),
(1164, 1, 206),
(1165, 1, 207),
(1166, 1, 208),
(1167, 1, 209),
(1168, 1, 210),
(1169, 1, 211),
(1170, 1, 212),
(1171, 1, 213),
(1172, 1, 214),
(1173, 1, 215),
(1174, 1, 216);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenu`
--

CREATE TABLE IF NOT EXISTS `sismenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Volcado de datos para la tabla `sismenu`
--

INSERT INTO `sismenu` (`id`, `parent`, `name`, `icon`, `slug`, `number`, `id_empresa`) VALUES
(2, NULL, 'Seguridad', 'fa fa-lock', '', 2, 6),
(3, 2, 'Usuarios', 'fa fa-fw fa-user', 'user', 2, 6),
(4, 2, 'Grupos', 'fa fa-fw fa-users', 'group', 1, 6),
(5, 2, 'Menu', 'fa fa-fw fa-bars', 'menu', 3, 6),
(6, 2, 'Database', 'fa fa-fw fa-database', 'backup', 4, 6),
(7, NULL, 'Mantenimiento', 'fa fa-wrench ', '', 3, 6),
(8, 7, 'Equipos', 'fa fa-fw fa-cogs', 'Equipo', 1, 6),
(9, 7, 'Componentes', 'fa fa-fw fa-cogs', 'Componente/asigna', 2, 6),
(10, 7, 'Preventivo', 'fa fa-fw fa-tasks', 'Preventivo', 5, 6),
(12, 7, 'Backlog', 'fa fa-fw fa-tasks', 'Backlog', 6, 6),
(13, 7, 'Registro de Parametros', 'fa fa-fw fa-tasks', 'Lectura', 10, 6),
(14, 7, 'Predictivo', 'fa fa-fw fa-tasks', 'Predictivo', 7, 6),
(15, 7, 'Solicitud de Servicio', 'fa fa-fw fa-sitemap', 'Sservicio', 3, 6),
(16, NULL, 'Pañol', 'fa fa-briefcase', '', 4, 6),
(17, 59, 'Articulos', 'fa fa-fw fa-barcode ', 'Article', 1, 6),
(18, 59, 'Stock', 'fa fa-fw fa-cubes', 'Lote', 2, 6),
(20, 59, 'Orden Insumos', 'fa fa-fw fa-check', 'Ordeninsumo', 3, 6),
(21, 59, 'Remitos', 'fa fa-fw fa-paperclip ', 'Remito', 4, 6),
(23, 16, 'Herramientas', 'fa fa-fw fa-sign-out ', 'Herramienta', 5, 6),
(24, 16, 'Salida Herramientas', 'fa fa-fw fa-paper-plane', 'Order', 6, 6),
(25, 16, 'Entrada Herramientas', 'fa fa-fw fa-paper-plane', 'Unload', 7, 6),
(26, 16, 'Trazabilidad Componentes', 'fa fa-fw fa-exchange', 'Trazacomp', 8, 6),
(28, 59, 'Punto Pedido', 'fa fa-fw fa-bookmark', 'Lote/puntoPedList', 10, 6),
(29, NULL, 'ABM', 'fa fa-book', '', 6, 6),
(30, 29, 'ABM Grupo', 'fa fa-fw fa-server ', 'Grupo', 2, 6),
(31, 29, 'ABM Sector', 'fa fa-fw fa-sitemap ', 'Sector', 3, 6),
(32, 29, 'ABM Contratista', 'fa fa-fw fa-life-ring', 'Contratista', 4, 6),
(33, 29, 'Parametrizar Predictivo', 'fa fa-fw fa-bullhorn', 'Parametro', 5, 6),
(34, 29, 'ABM Deposito', 'fa fa-fw fa-qrcode', 'Deposito', 5, 6),
(35, 29, 'ABM Tareas', 'fa fa-fw fa-street-view', 'Tarea', 6, 6),
(36, 29, 'ABM Parametros', 'fa fa-fw fa-adjust', 'Altparametro', 6, 6),
(37, 29, 'ABM Proveedor', 'fa fa-fw fa-truck', 'Proveedor', 7, 6),
(38, 29, 'ABM Familia', 'fa fa-fw fa-check-square', 'Family', 8, 6),
(40, 7, 'Ordenes de trabajo', 'fa fa-fw fa-tasks', 'Otrabajo/listOrden', 8, 6),
(41, 7, 'Administrar Ordenes', 'fa fa-fw fa-thumbs-up', 'Envio', 10, 6),
(43, 59, 'Nota de Pedido', 'fa fa-fw fa-cart-plus', 'Notapedido', 11, 6),
(44, NULL, 'Compras', 'fa fa-shopping-cart ', '', 5, 6),
(45, 44, 'Enviar Pedidos', 'fa fa-fw fa-envelope-open-o', '', 1, 6),
(46, 44, 'Recepción pedidos', 'fa fa-fw fa-check', 'Administracion', 2, 6),
(47, NULL, 'Reportes', 'fa fa-line-chart ', '', 8, 6),
(49, 47, 'Rep Informe de Servicios', 'fa fa-fw fa-file-text-o ', 'Reporte', 3, 6),
(50, 47, 'Rep Ordenes de trabajo', 'fa fa-fw fa-file-text-o ', 'Reporteorden', 2, 6),
(51, 47, 'Grafica de predictivos', 'fa fa-fw fa-pie-chart ', 'Grafica', 1, 6),
(52, 47, 'Rep articulos', 'fa fa-fw fa-file-text-o', 'Reportepedido', 5, 6),
(53, 29, 'ABM modelos', '', '', 0, 6),
(54, 7, 'Plan de Mantenimiento', 'fa fa-fw fa-calendar', 'calendario/indexot', 9, 6),
(55, 7, 'trazabilidad_ Activos', 'fa fa-fw fa-exchange', 'fa fa-calendar', 0, 6),
(58, NULL, 'Equipos', 'fa fa-exchange', '', 0, 6),
(59, NULL, 'Almacenes', 'fa fa-check', '', 4, 6),
(60, 29, 'ABM Marca', 'fa fa-fw fa-copyright', 'Marca', 9, 6),
(61, 47, 'Rep articulos pedidos', 'fa fa-fw fa-file-text-o ', 'Reportepedido', 6, 6),
(62, 29, 'ABM Area', 'fa fa-fw fa-asterisk', 'Area', 1, 6),
(63, 29, 'ABM Clientes', 'fa fa-fw fa-user', 'Cliente', 2, 6),
(64, 29, 'ABM Criticidad', 'fa fa-fw fa-line-chart', 'Criticidad', 3, 6),
(65, 29, 'ABM Procesos', 'fa fa-fw fa-sitemap', 'Proceso', 5, 6),
(66, 29, 'ABM Componentes', 'fa fa-fw fa-cogs', 'Componente', 2, 6),
(67, 29, 'ABM Unidad de medida', 'fa fa-fw fa-thermometer', 'UnidadMedida', 11, 6),
(68, 29, 'ABM Sucursales', 'fa fa-fw fa-building', 'Sucursal', 10, 6),
(69, 7, 'Informe de Servicios', 'fa fa-fw fa-file-text-o', 'Ordenservicio', 4, 6),
(70, 29, 'ABM Sistemas', 'fa fa-fw fa fa-cogs', 'SistemaABM', 12, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenuactions`
--

CREATE TABLE IF NOT EXISTS `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=217 ;

--
-- Volcado de datos para la tabla `sismenuactions`
--

INSERT INTO `sismenuactions` (`menuAccId`, `menuId`, `actId`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 3, 1),
(7, 3, 2),
(8, 3, 3),
(9, 3, 4),
(10, 4, 1),
(11, 4, 2),
(12, 4, 3),
(13, 4, 4),
(14, 5, 1),
(15, 5, 2),
(16, 5, 3),
(17, 5, 4),
(18, 6, 1),
(19, 6, 2),
(20, 6, 3),
(21, 6, 4),
(22, 7, 1),
(23, 8, 1),
(24, 8, 2),
(25, 8, 3),
(26, 9, 1),
(27, 9, 2),
(28, 9, 3),
(29, 10, 1),
(30, 10, 2),
(31, 10, 3),
(32, 12, 1),
(33, 12, 2),
(34, 12, 3),
(35, 13, 1),
(36, 13, 2),
(37, 13, 3),
(38, 14, 1),
(39, 14, 2),
(40, 14, 3),
(41, 15, 1),
(42, 15, 2),
(43, 15, 3),
(44, 16, 1),
(45, 17, 1),
(46, 17, 2),
(47, 17, 3),
(48, 18, 1),
(49, 18, 2),
(50, 18, 3),
(51, 19, 1),
(52, 19, 2),
(53, 19, 3),
(54, 20, 1),
(55, 20, 2),
(56, 20, 3),
(57, 21, 1),
(58, 21, 2),
(59, 21, 3),
(60, 21, 4),
(61, 22, 1),
(62, 22, 2),
(63, 22, 3),
(64, 23, 1),
(65, 23, 2),
(66, 23, 3),
(67, 24, 1),
(68, 24, 2),
(69, 24, 3),
(70, 25, 1),
(71, 25, 2),
(72, 25, 3),
(73, 26, 1),
(74, 26, 2),
(75, 26, 3),
(76, 27, 1),
(77, 27, 2),
(78, 27, 3),
(79, 28, 1),
(80, 28, 2),
(81, 28, 3),
(82, 29, 1),
(83, 29, 2),
(84, 29, 3),
(85, 30, 1),
(86, 30, 2),
(87, 30, 3),
(88, 31, 1),
(89, 31, 2),
(90, 31, 3),
(91, 32, 1),
(92, 32, 2),
(93, 32, 3),
(94, 33, 1),
(95, 33, 2),
(96, 33, 3),
(97, 34, 1),
(98, 34, 2),
(99, 34, 3),
(100, 35, 1),
(101, 35, 2),
(102, 35, 3),
(103, 36, 1),
(104, 36, 2),
(105, 36, 3),
(106, 37, 1),
(107, 37, 2),
(108, 37, 3),
(109, 38, 1),
(110, 38, 2),
(111, 38, 3),
(112, 39, 1),
(113, 39, 2),
(114, 39, 3),
(115, 40, 1),
(116, 40, 2),
(117, 40, 3),
(118, 41, 1),
(119, 41, 2),
(120, 41, 3),
(121, 43, 1),
(122, 43, 2),
(123, 43, 3),
(124, 44, 1),
(125, 44, 2),
(126, 44, 3),
(127, 45, 1),
(128, 45, 2),
(129, 45, 3),
(130, 46, 1),
(131, 46, 52),
(132, 46, 3),
(133, 47, 1),
(134, 47, 2),
(135, 47, 3),
(136, 48, 1),
(137, 48, 2),
(138, 48, 3),
(139, 49, 1),
(140, 49, 2),
(141, 49, 3),
(142, 50, 1),
(143, 50, 2),
(144, 50, 3),
(145, 51, 1),
(146, 51, 2),
(147, 51, 3),
(148, 52, 1),
(149, 52, 2),
(150, 52, 3),
(151, 8, 13),
(152, 54, 1),
(153, 54, 2),
(154, 54, 3),
(155, 40, 9),
(156, 40, 7),
(157, 40, 10),
(158, 55, 1),
(159, 55, 2),
(160, 55, 3),
(161, 56, 1),
(162, 56, 2),
(163, 56, 3),
(164, 58, 1),
(165, 58, 2),
(166, 58, 3),
(167, 58, 4),
(168, 59, 1),
(170, 60, 1),
(171, 60, 2),
(172, 60, 3),
(173, 47, 1),
(174, 47, 2),
(175, 47, 3),
(176, 54, 13),
(177, 54, 14),
(178, 54, 15),
(179, 54, 16),
(180, 54, 17),
(181, 62, 1),
(182, 62, 2),
(183, 62, 3),
(184, 62, 4),
(185, 63, 1),
(186, 63, 2),
(187, 63, 3),
(188, 63, 4),
(189, 64, 1),
(190, 64, 2),
(191, 64, 3),
(192, 64, 4),
(193, 65, 1),
(194, 65, 2),
(195, 65, 3),
(196, 65, 4),
(197, 66, 1),
(198, 66, 2),
(199, 66, 3),
(200, 66, 4),
(201, 67, 1),
(202, 67, 2),
(203, 67, 3),
(204, 67, 4),
(205, 68, 1),
(206, 68, 2),
(207, 68, 3),
(208, 68, 4),
(209, 69, 1),
(210, 69, 2),
(211, 69, 3),
(212, 69, 4),
(213, 70, 1),
(214, 70, 2),
(215, 70, 3),
(216, 70, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema`
--

CREATE TABLE IF NOT EXISTS `sistema` (
  `sistemaid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`sistemaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `sistema`
--

INSERT INTO `sistema` (`sistemaid`, `descripcion`, `estado`, `id_empresa`) VALUES
(1, 'Eléctrico', 'AC', 6),
(2, 'Hidraulico', 'AC', 6),
(3, 'Mecánico', 'AC', 6),
(4, 'test', 'AN', 6),
(5, 'Eli probando', 'AN', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisusers`
--

CREATE TABLE IF NOT EXISTS `sisusers` (
  `usrId` int(11) NOT NULL AUTO_INCREMENT,
  `usrNick` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrComision` int(11) NOT NULL,
  `usrPassword` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpId` int(11) NOT NULL,
  `usrimag` blob NOT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`usrId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `sisusers`
--

INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(1, 'admin', 'admin', 'admin', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0x89504e470d0a1a0a0000000d49484452000000d7000000d70806000000897dc4b50000373c4944415478daed7df77714d7b6a6fe8879e9cefc7267d65b33f7be993bebad3773efbc07f6c5016363636cc0986b1b9b8cc1981c6cc0062cc0e49c4124814012412491834822482401226392c9395a20f6d477c42e9dae3e15babbbafb74ab6aadbd105277d53975f67776de27e379412d4a652a9f518beabff33afdf5af7fa566cd9a51d3a64de9edb7df16ff677ae38d37e8fdf7df177f6bdebc39b56ad58abefefa6b4fd4b66d5bfafcf3cfc5f7f97eefbefbaef81dee05c2fff17bfcece57e5f7ef9a5f95d993ef9e4135bfaf4d34f95dfb1528b162da875ebd6d4ae5d3bcf734c34619c5813bcb3d5436a53aaf3a01d65a4f2e0ef2eae06162f16d33befbc23c00466f38b2900caf7de7b4fdc1f0006c3376edc58fc1fe073fb7ecb962d4d10e0bb0d1b3614e37cf3cd3743c61e09611cb8874cf5ebd7a70f3ffc506c3698bf8e40c32683b1620e433abc16804b376ad5e47525a022914cd1109e81e7d5a953c794924ecf6cdfbe3d7df5d55702541f7ffc719864659000b85e48f57d277aebadb7a8418306026cf17e3701c0d2005c597d5e33990752c34f09e585c0a8fc7c4809a7cf32b03ef8e083908d00520fbf0793f93936bc0bdc17f7c7bb514975fc2dd1efaca6012c25c15532b1b6a90a2693415845741a032405181daa1a3e8bef78b1cdfc268c031b023602196c9082005a32255aba022c2395edac6430a9ccac0c16bbcfc0d681e3831d1e60205dd4326c08506f99a959030000930db0747172a41cb8be6f55a50e62b74d2673b22303e071726030b00042bfd53f3f370acc876d39fc9b8c8d0bef07cfc6e6092f7000ae04d2b651b54d09906c866470d931219c18ac0abad964bab9c931de64a9b090a8505b01b04bf30270255c1dd4c1106770d9fd9d193495806595229823181d204ba43a0b6d4078609bbc1e802b1134beab1eea205393264d6cc1c5c04b55605941f6d1471f099025f2dde3997887f00a07e08a23413d605b40078683cac7992076bbae97a0722a112417e69448a70c7b63e11d0ec0156727861ffa3f766230079c0d883f710cca8990ae84cfe13bf82ed4d2bffded6f619e42fc0d3b3c185057e7851f3611361527478e9f8066fb0b664100ae38c5b49c5cde6eccc0f11d303db22adc321a908ec46944c8a8b0031dfe263f8bf30f75b00913618f41754b94fd05b3200097cf84a06234520b8002b30394f817cce0855815b1820d40e38c0a59a2599920110ca79314c37ce32da5d939046f71002e9f6d2daf520b8bccc1513f5448764bcb8156483ec4ae20b5002864a0e3b9e9ae0ebae55ac673defc7e534d3dcc48050fa1d7528e781adab83fc6819d5a4e9cad5bb7aea734a848a401242440ed96c08bcfe0b3894856f6b211c5730cb87faaa9875a83ab6983d7b5f110aa6c017617c79ae708c65125d846439c949b2c8f6222bc87a992bda12db8905f8617895d59771735c781220518ec42ab8d87cd04d9f3a8f5722a9e6482f4c2e7557561b8379e912eaa2ae77376fefcf5005c7eb8df75aa3f72531b3911d60d60f8ac0c2a9636727573b48410010067f58ae277c94c74f63b332615927b33747664a46a201620b19316f81bab7f708c000cb102ca2954c089c3b2644c6569964ace0d2dc1b5f8c7da664f8c74f2aab18d06a90249a292541cd806416a7b2504b8ed5447ecf6d60a683068aabe5fae04d73d354a4b7071f97ebad80a72ad12f7de90333ea29927544f6e9c1369d9bfb5794f2a828c4b5374ce9ccf0854c2f813676e346ad448002a96863100951c7793ed366e4ce344f89c0a8cc9aa908eb5cd82ce95cb19baaa84ba7b0923556162910e9c6e2483a25ebd7a022c50fba2b5c9f05d0052be6f2abd771eb7aed22b23f012c6bfb236daf817de81b5e705a4e0175f7c21eeed446ddab409495076031a545559754d0529c681655da59756e082f747a7d292681284d9a53ea84f37caecfd2d6d9b339cca0ba62869e3ec11943b2193ba75fec6d6f921f7b688d50665e021658b3b44c924f7fb48953c490e69e828bdb4021797f1ebbca89c06c5294abcdbd7af579726f4eb44c7964da4cabd391113800690e1deb8277b13e33917d87e9070906e72176004b0394ee6256e17d85e2900ae487209e3a96a80a955f97daaf4a4be1dbfa2a2ac215101ca4ae7564fa56fdb274f1d06d858aa414d4c155b4c57db2b434717bc9fe9320c1455d9092464245d6c9b7ef43e756ed98c660fee4ea539a3e8feb639be80ca2f7ab87dbe5037772d18432ba7fd4ca307f651aa9c5eabadf1fe20c564f554c7f0084b2fdde25e19bab9e0a32d8ab4d618a9dcd54e04b50ec019dabdad099e93cb2768059e6869c5a481d4b3631b73530133ca073778c93861a91d8b832611712f9db2363274b3b7a2c9e8e6ba2b6600ae24c6efe49d77d384be543c63a049250b46a40578bcd08d4db3e950ee185a337980d844ec3619b9b8940f72b0e643e23deba62672c843a79cc38c54b5b73851163b166792ab623e48fbc17dc7f46c4b8fd74f31e9c9c6693506587604c90cb0415a0370ad9a35b2cde2e02398e4a394740af473cea14eedd83252d1dec2ae8a933b0028a773aba0cee073f5df799baeaf181702ae8a1d736b3cb89c4007270dd463386ca0325bc1266786e81293e4f0852ef55eda80cb8bbd05b0e0334e4d6364e2de0b33fa770c01d6e30d53e9c59e850190a290727660d3c10ee37a2f5ddcf25a808b3b3cd9c5b7b831a5b5418c13018888d5a8a4d6b3adb302c0c448b9a3be0b51237589878933da1abc1e80cb7ad6962a680a607df6d96711e7cdd94a2d835e142f0800e2135d593b5dd86c9066906089e867e8c5b1a14323d10c9df309f96c2bf9ac5ff9e8d368a4d6934dd30350c4496d441c30d98e0ef0892e312f2dc0a56a4483b41c6e5ba63aa5315aa9153832e24708aa438a25dbd1a14b9f8d0c5d9275bdec76c81af02ab5704fabd4122a61e0c8883bc1cbc88e8e64a4b28953599a04e0329d195e82c790645efa46e07e999dbe0a03d6d32d3303e64f10c195cf5ec544079c39d85de3c1c5ce0c2f3b9c177b8b4b26cee58e0c54428decb0449ef1c581ee1a0f2eee05ef2521d4c9de423099539d3a356f1206acc04b987c3b2c516a22b75fabf1e082e1e9b538d24e0db466b42387d00aacc04ba8871d96881e8a9ca951e3c1e535139e8b14e5fe0f728759fef9930fdf534aad67dbb20226d7404d9403cff16a8a83fb2243be46830b39605e8f376567865c8a0e40e1bb68ac6997a0cbf47cd7fc80c1357276346d583fa4512927063bd9d36cb3b9991000578d77c5475266026706979f6331acf9854e8e0c50c0d47a1152d050f68358246c64a6e68dab5a2780b0a6d83cb1d67267628464dc6abb6a3cb8bc7a0ab99608c0b24bdac5df5a7ed25009acc0ded28f7edb3e47b956eb26f477945e706a790922d7f80c0d2f6dd4a0066227b26bffcccd62709f85995dd4f65690a8ab1d3ddf9d1db64e47e60fa1c9fd3a39820b1a4c90fee4430d1774702f8715a0aecb49250ce25b7a92759da026b6f8b491e35ac3f6f67286b20e15c9193a7a0aa1063668d0c07337593836ecbc848133435f7aba794618b8b821a91db93933588ba9d159f1769e42a88868b1ccfd1bdc32e121d59cbc848133436fa786bc4e884fb20d6e475e03c8351a5c2a4f2180c4ad9abd6666b00b5e15380e9c199a3b358a6687ac153c87225669a3b1a071a91bb8b822a246174b469253e8042e4839bb0cf820595773a786a1aeabc085908bddd965a992b49b54704572e0829bbd65e7820761770c1839353c860c2eebf9d01ce772f31406e092720abd767b8ac5de0a3c85a9e331647001541c4866421c13c726216fd0a95747002e8390fbe5256117fdcbedc0c5c66bc1c85e81a7308dc06567734155e433c5e04d56693da261694d6f50136dc2ae2abe85e0a31db8823293d471c7bb810b6a211f7d04e7864a82e952e29fb2e0b29e236507acc00d9f5ee092bdc87cce9835cf3000570ce0b21e6de3143c46f3cf80815327d6c5712ebbfc51b7b3a4c12b01b85e810b866a24e0c28e06c316df6367865dd5b170c31bbb62c0c0a913eb4286865c4c19690059b7635c93ee2d744b676170613793b3e20134bb463401b86a26b85872e9724e57d283c86ea7dce3857129bf7ce802834bd59b300057fa81cb4b00997bc5eb728c50d2c0c52dd5dcaa900128b85ead117b4e73b14b7b0a4afb53832a76ce0b2939c19ac259150db8582dd421af30e959f16eb12e004a052c195cd8ed82ec8cf44981625b3c1670e972ba6452c1c56dd554f10afc0e1179bb18171fcb6a975318802bbdc0e525f54997966a5a800bbab1eae820d8596858e29453c8e0728a7105e04a4d70a9ca4ebce4a006e052f489b7bae41b356a64561f0368aaac787cc731c615802b25c18535659e9009315138b19c4006534197d4276d9a82cad9f1388b0bde41008aa3ef76e0728a7105e04a4d70614ded0e43e7aebd00912a84a34b4b356dc0c5aa21fa65e085e1c559fb24c8e77405e04a6f70216ea94a81c206cb7985d87c91b86b0de304e0b2d0a579555e43804555856c77ba0902ca01b8d2bb60d2cee6c2d96d001b7f46ce88479d60002e07d5d04bf2ae5bea5300aed404975d20d9adeb934efd0ab502975be75dd5a17701b8d21b5c886f46d2f549b7d4276dc0e525a08cfa9d005ce90f2ec42d55b12e37573cf34400ae0803ca1c54b6562007e04a3f7071ac0bbd51a201972ea94f5a818b55436b40d9ea31e4eae3005ce90b2e8e7545022e789b0370b9a886f0f8d8e9d42cb1b80a3900577a828b635d724ea91bb8746a06aa25b85835c44b55810baa021bba01b8d2175caa58975b6ea12ea7496a0b2ea732143e94418e7305e94fe9092e552f0db7ac789d5aaa69092e1072c354aa2132e465352148dc4d5f70a1559e35d6e5055c3a1cd5aa35b8c6770d570df133525de44c0d2fe08aa495f583c20974b76064085dcbfe912e4eed664bf83b7f16df8f85c970af5bb9837d3954ae7c7073f16f2cf790df83d33b0061dcd677e7f5f92a70a902c96ee0023fe894faa425b854a79f708a8b1c4c763ba6d54b993f18e04a561f2aedf61e15b7aded1bedfbe64d3afa63533a3da2750808550c87dfe133f81e40112bb8f02cdc0bcf7fb2699ae346c2e0c0670ff769e8eb3b0061fe7663302b9177cc0d5b3755accb0d5c3a757dd2165cb26aa88aca73bccb4b25b21db898a10102bf19ca0b8191c1d020790c7e482e907c4f7e8ef559892427a05b4f3ab12b9a743be1049fd729af505b70b16aa86a5ec3aa219236dd7a68a8c0851d3b1ebb74ace487d4620248759b1f808d0dcd2bb870b806bcc3d84499e06e577992753aaa557b70b16a886a64bbdef15eba3f3dd918ba5bb2faa51b9d1bd731261bc94e3d4c96a4729362f25cedc0e556d7c5f698aea94fda82cb2d531efa37ba42b9f52de476d6584c2caa5245fbfe633a33ba1d5d9ed5cb906a23e8c19a712184df5d9dd7cfa4f313be119f9709f790a9a4cb3b11d925f1f2c4c1b68a0460d67994677e1e3657f95d5ccf1918f6be40f83d3e8b77beb7e31b4a29c60e2074e852ad1b4eae41b805d20a1ba94c08cb40ab41612d9f3a0a5e58fc63ed005c9116515ac125bf50b74032747dab1a08c601485460f29bace0b412fe1e4f573798d8e9f9f19e3f08cf3939ac4518d0a0a25bcf45b6c6baac591a300bacb6b88ed9195a83cbaebf865cdfc53de3ed807577d908d3138885c54e7c2b7f4842182a128a772c49a7b95e98da950ef67cdf04d88d9c41cab5e358971c484ea5d427adc125a743a954433777fc8355e38c45fc804abbd6130b6a95529bc7f5a4293dbfa2e1df34a34fdea96dd29ffef8dfe9f7bfff7dd424df4b45ad1abe259e092a18faad1887df60bab07a32ed9e3398660df886c6f66a4d3fb46ee43aae776bffdf98e68deff3bdba34ab6fceaf7cfe4fb6aa23363b6c7ab77287d8c6ba2201176cf5005c3e64ca433574eaba7b627073fa75f6f7228e222f2a00152b80fca63ffdcb1fa8478b460210d102eaee962c01a6fa75fe5dabb9f186a3021954766817582b6c862a70c9e5fea994faa415b8eecfab45a706d50a337eebbda14e87421f052e33b07a0cb160f2b1ad4fb7ce148b99fd433b73c15b37fd9046f6ee40d30676a76d73470b7ab27f45ccc4f7b2a35593078be782308677ebd40e61c4b69fd41740890458eb26f5170035c1fa3fff859a357c8f06756b4f637fe8463387f4711dd781fc2931cffdf49a392173fcf19b1654ebcfff664ab62b4b475683ab707cc899c8f29ac98164f60a3a0591195cc21bd9a78a970270bda23b59b5685f875a4a0f56df86ea4c79ced6c0dffab4fdcc35bff064ced05752e28fbe30925ff4ec60215dd8be9466fdfc3dd5fef3bf8a31428a45a20232a87ab46c42ebb24652e5c9a2107a51be35a973ecdae25331beae5f7c6482eb595156d8b1adaa40b21770712a9ce98dec50c55301b80cc26e230753e5bcb51ddf37b58d79e18543aa21e0e87618c3a08e9f57eda086a48898414ad7d0833d057473c3fca8e846e10cdb7b57946d344170b7640dd5fe4bd54e0fd07801178088cfcf1ad28b2a4f6c0d0316d3b3436bab9f5bb28a1e1f581bf57c6eae9b4d0f76e64624cd79039081a5ca2bb4828b4b8cecc0c5279bf468feb1e01d339ed62700173dcaa90616f2fc540cd4b96533e5595ef83fab046e591a2c15660ceb4fcf8e1755d3895df4dbe9bd215471e1083d3d534ab7f6aca36bdb0a7ca11b3b57d3dd035be8c989e2ea679dd94795bf941a544295678ba9f2d4766afb59e32ab018f6931770b13a5856984d95a77756dd07f7bb78902aaf1cada6ab27e8b75f0ed3c3a3bbe8f6be0dbeceebdec12d61eff059f98e90f75cfbdfff22c65938e17bc7a45d99eabff3b6990265072eaee32aca1a22ee091e627e026fd568705d1e5bcb0c2cda6529ac993cc036e6c59e22abc7b0f5477595c6f5c5833be8c595e30240760410dc285e4f4f6ffe4abfddbd4987776ca69dabf3a864e3722a3568cbb21c9356e56653c1e26c2a5c9a43bb3715d0b6b54b6885f1bbc78f1e125f4fae5e108c787377213d3a5e2c18fcc9a9fd06c39fa497d74f9b54796697b091583574b3bdca72ab2582905006a8e4fb313dbf748c9e9d3b448fcaf7d0c363bbc5586eeddf4295cf2bcc3196eed94585c67c766c582ee6803981d6e62f30e7ba6b4d1e1ddc5c40fb372ea3adcb73e8eee5f3e2fd3c387d44800c730a799717cb8c671fa5e7978fd1c03e5d95eb513acb3e3714314c2770b1d46ad5ac5148de2807cec15b351a5ce5fd6b9969314e8cd4f4a3f795dda110a95725f0d6fa3fff3b6c2161e4575eab6668fc8c1dfdc5af2704e09e9e2e1100b85bb6c764bc8adf7ea355f90b69fb8665b46b6301ad5eb2d0643c2b6d5d932f00b665cd123a72603fc9d7c3f3e582a91f1cd911062a3116481703200c2e73ccefbfa92496c421e032249f3c3f2b619ed7b7afa4eb3b568700cb9ce37acc7139adcc5b603bc7220378aa396223c27def1f366cbc5fcbc3c671b1748b125c0b0776f4042e5525326b2da539a3427885b371c05b351a5c6c6fa9923a659a3db8bb3299979d1a568fa16a21f32619aac385034ac6831a7863f75a7a74e94c08286e5ebf461b57e586ede82a82f42a3676f69d0683eedaba91acd7bdf2520130489110605d2daf52e90c80600388c6ddbd3b7f7a15c0ceedb50518d44100a0e2e1bdb0396e58e1718ecb1651f19615628ec5db42e7f8e2e963ba6d6806774a360b2087ccd15057ebbff5d7b0718ffcf6734fe0b23605e57587c960e515ce214db6dd9574709576f606aefbdbe6d0476f8597a27033482fe03219d0b047e48587ba0435c9ca74cc789b0c9510cc74e9dc09f1bbf2b2c3b68cb7c7603cecfe7b8a3691ea02c0c0e426d3c13682c479e578a8fdff4283b9885b21102c135446d9f56e6e1cecc000500d4928cf118056014b9e63f1d6d5f4bca24248b2d54b17bbccb180f66c57cf1152fa56f13aa18e0aede0fc3edb8dc32bb8acf63667e75c593bdd165ce0ad1a0d2e76c1cbe082de8c4c71ab5b7e52d3d7949d79553986efbef6677b7031035e3a4c8f4fec153683ac26c9176c27482e06d7ad1bd76dc1b5d55095185c470f9590dd75ab641b3d39b6bdcaf92079f4ee96ae0d092c237ee51434464c8c3f8f98569897104c7df98829b5601fa92e8009e0dabf633dddbf7353cc71fdca652e732ca0c3fb8b6de788675ddfb68c2a8e6d36c7a302d7cae1dd3c814b6567776ff09ab29485c105de0ad4424b3d1332c5ed32b71154b6da5ed0bdade0da36f13bfaa1759310908580cba0fbbb96d283b347c9ed2ac8994dd9937fa2c5d387d0a2a9836958dfee34e4bbae213466606f5a326b18e5cd184a73c60fa4cb17cedbdeefc5b32774bb283f0c0c903e3c562760c9c40083c47372c33f3c77dc718e6b97cc37e73867dcc0b0f981a60def47cbb2868b39ce759923cff3669101b0a39b42c0858d0376a393d492c165b5b7a0bd800fb6b4aae60b1960ec92aff16a21834b7668b0f710ff1e1bd08cce8ded20e848df4662b7b20695dddcf14debbd1e062e2cf8f31be7c9cb75e7d64d9a3cb40fcd1ad99be68dfb9e164dec47137fea4a13067631a82bcd18d693161960c81ed797660eef45eb0a725deff9f2c5f33010f468d7dcccd2f0daebe245f102139008462b0176fd4cc473cc3668dc80ce345eccb10bcd1bf3ddab397e2fe6b861659ea777f7b2e2a970cbcbe0429ad78b3d0b1d81c5cd41012e64e3581d58e33bfd4df086bcf15a1d1a351e5c72ca13bf1c2e83c7ef9077c62ffbd2f49eb4f0f3f0f66b1cebb05b244830113b1ad62f9cf12e1ea2970f6f8a5dd6e9ba72f102e5cc1c4bb347f7110cb670423f5a3cb9bfa01c036cd9e3fb52d6e8beb46fc7667786bb734930bc752c485b62e6f304aea2d954b1731e3579eb3fece7c72efa5bbfd0cba70f5d01669d230005c2cfd83ce68efb818ad6af72955800159ec98e1a797e0890bbc5b838888c0ecbb2d4423201e25f488f6270710f10ae11637e026f0571ae572f032f07c99c202e5547d634bf6c644fe37778e9b26ac83ab8dde1e370f70a89f059635bd5094c003be8e985635471ffb62de31c3db88f8a562fa02d0559b4f515ed285c4807766da0278f1fbb4b2b047815cf4710985526cf5d9a0c703ddb3a8b26776fee3ebf57f4f2de5557f09f3a7a90766dc80f99237edebb75a5e31c1f5f38414f4eeda3e7a78b6de7871082684c636c0a4ec03a327f48586c939d575c202bf71e1149c0afba70f1ef6b7c9c0b3960fc32509a2e0792593594933af1ff0ef543ab94195c76cd6a10a874b34b647ab27f253d3abc996eee5c498f2f9f71049bdb855dfcc5fd1b229e26efe256824322d2bc42c1a01ba6d2a99c9f4dd5104e11d73942921920abb87b8362b9f06eee1ddf4f77f7aca6472585a66da522b62759e5b52befb7164bcae5463005f03b008f375af088ac2673f72b50b2f30bb5c82db42b79678fe1f50503aa7734c3eeca6c14dac086631e4e9da038a86c756ab85145f936e1f8b8b9355f18e737f76e104e1030961d09862bdd44f7f7ad1140f5f21c76c1ef9a9d197143cd7b2b460b0741984bde6d6e0618303780e3dee11d626e18bbddbc10c3c28683770187cc9303859e9ef3e2c436d3deca1b5155bf869e926ece0c6b35043651ce238589c0fd47e477223bc382c45dc9a981aa616ba726fc1e7559fcd24f0f6f6dda5dec92f702ae4599df56676944002e5bef5bf1322539edde76045b096383e325925213760a402dda95f593299d3d492f07a96d37b768ef59b6665e884a28c06553de2fe715c25165b5b7166676117f87838b5b05c8ef842bcf83c4dd57746144a8dd25bf2cb13b192f925ffa2f933a53618b2a70f1cbf7022e560da3915ef12478f8785cab47455e950cb510a5f24fb7cc300b25e175d4657eb29750f6823a010b79a2aa7826d61b2aa10c2e6bbf10e623f05400ae578592aa7805bb55b1339b4574868ac84e8d48c0f5b070a2e992471a8e2e8cc759f0505be19c88145c900000d7bd95a385cac5401559f21acc6fdd9cb1d59bda2b2f28c2074ee0e22a646ba2b6ec1106b8acf9a872eb3c1d0a26b5a944e64c0dab6a089dfaf6929f435fbef1b996ef5657287b01d783d5e3456099171a09b2c9663c560741181baaa623eeeb5e345b800b1b10becfb657aceaa11f84e7b3fb1de3f25a6ac2ce0c3933e3dbf66d43120544ecd3626fb14a98eccc0cedc025c7bb64d510f539d0ab43dcb47d1b098f612492ebfecab12131af488d7fbf09aaa935bf0e3654c4a784ecce16e0124e1f4345bcb379969977e8877d190bb0385117e3918b3fbd7a0a65700d68df5cf432e4cf5c9bd73fa4fe4f5609931ddfd20e5c37a6a955438e5dc82f1f4e0d780cb93a99c16517e7aa925ce3846a889fbb7ef6417569bc619f247a8707b07847c758223d9125acbbeefc1fe8eadcbeaffa344ea7b2c5a34c8025637e5005d9fbf9a73ffe0f3abc6058c878a1fe3a810b6d1bb09eb24a38a4fd6721c9d9584fd99921ab84e0a5005c123dcd57ab86fc0265ef12bc8748e2fde293506fa1d3823d5c33412c08ff1f09a372cd176c1f3045bc9d179ce2245a0ebcf667baba7c8c180f54a568c17563e140012e9e1f009637bc87f91c307abca534e606555bceeac7c681f959d55d374f21b7b296c195d5ad79886682f725834b5609c14b01b81c54437e711c549617044165b8e37ffcaa9167703d5a3799eeaf1813f23b2cbcaa6259ee9c04c045e35d04b3e1bbb807806bad6562c653f5b48ff8e085bc21025c77974beab3a122164de9272487aa2b14ecbd68e785ef01ac3c376b990c362db908120e8c100fa74bda930a5c0b0776363d85d6cd8843363aa984da814bced6b00694adbbddc68ef528ab5dc3b0e0a21359c1c5840c07d862aaea6515f0dcc8e9fbf058c279213f3f1a47866cbfdcce1f6ad85c3fd2edbca16173038061d3c920b312c0e1362755a1a395b051592b8b2145ad366234e0da3c7940c8676470c981631dba3e69db14948b27414ea76120a17779db7a26b8dc7ac60b70ad1aebfa19000d2a231812800318bc80ce0e48b8c7b4dead04a05852399dc4122db8e02d943359ec627d3c370021967981701f9e9b6d6b3b4b5f14d561776ee0ead1be5558575e39e589f925d9c591da834b4ee4459e981db890fe2283cbe92821593504b97dce0978602437c2e7bcde3316a95515449e22c05525bd0644352f2f73b2db1c1cc9504dad1e50374fa10a5c39df34529e5e239fa4a943a2aef6e0925bada18cc06ec7e3c44d06171af77b597091d3662c7ab400f393dc8e95f5420f0b2798e082ede5453a27848c778cc46255d03b1270416a21f462bdb75c9ea44b2bb5d438fcae7f78cc4b157844390aa7c5389d8d6cedc0eb45354904f3c1fe88155cb2e4023d5c3b31f99b870db0385dcb0bb8384120bbdd0721e96ff2a6843213b3996c7ffdf8584b70c9312f0e14aac005bb6b64bb4fa9cfa7ef452c2db0f8b07792c580b1aa8366f26ef102bab36498092eb8e3c5e6912480e1fdda6d1a6e694f32b8b061426a59ab22e435d431b69512a79c70cc8bf3c75465e15c7630a9cd871131809c550e4684472b51cc8767f9052c956a08a031230bfb26412083ba6d27ad42eacf3cdc0bf6332acd21b5b0be762dca5925d425dd2965c0a52aff579dc185bfa35189f5081a2752edac6046303db207fc9468b817765a30841f6aa092698d71cbaaa115bcbc8970e532c613f586628055ccc7b80fee1749f0db8b3343548e6776a18e9f35367ba8a8547bd94ba8536c2b25c0757562784059c51038e0ce5af3e5974a06c68996a2c9138c8510586770c5eade8f177971667089ffa2165555e828310a5b3f4302721b085d5542adc12597a1b04b5e753835f20cad8d6cdc289ad20edd49560defaf1ca3e518235151f9fc64d5a993d032e4be96baa43ba5d4c992d6445e55749febbb4abad48b48554b3770614eb26a684d394a3679c9ccb08659e4e644d68c0fee0e76a887befc9b52e0b2532d9c76393b4ab4da166fe24c0d263f62687edb855ed786ab8c55da08abf4baf4264c5970712a949c6768dd01616b416ad9e9e7b676978b672bd9b649e5fedc88c17525eb3b01ac7b05a3844b5ea739b99599a8ec68a8fc76798a01b8e2d08d9777c1ab73fa86b5bac6a278b6bbb665259de1acfd424c26dc30852a0fada0ca927cef6ae1e6e926b8f07e50407967d9707dd4568fde493866aceb8a0d141b8eac6d04e08a13b81099e79e8656b21e5c1dcfd4a398bc7b05239587fdc11901e744e5be4554796a87678001480016e68fffe3e7b2fe9f68012c2fadabadb14b99b0d65873f99ebcfe678704e08a290d4ace31941bede305730607ef64589c4883c9c920d591496c3799debeb2b5f4f2cc2eaa3cb2a60a6c2ef713e94fafa4217e3e35aca51ef696c7e031885b54635d410c22f9a00eb965b50e5d9e52125c72cb356b4728bc74b91295cfc255051d6d83c93154ffc64a2c8da1c2418a3e5a3729248dc9fcecd1f55459be992a8f6fa4cad2a5f647b8f66f22becf06bf4ee05285506c3b3fbd5a6f9654886761adadda4b00ae38810bbb98b519a49cc4e9355b03922299e0825d247bf8a2f5f6e15d94677e2100ca5918b8077e974af6166c2b550730c43903c915c7da2e59e7c66ea65a44ce35f3aa1a5aab64130dae4bd37b9860c2cf32c176f212ab8253042e6b7cc70ad643bd3f4c297bebc42b75dfda328d7bc0abcafa91c913802bc6b27faba45211ab8661f53f1ac6bb105e103d190d105c9bdf9ff676a81362c4e3ffe7277c630b30a85a722d131300c5e03afcdd4729636f41dbe078a5ca8baa5a67ddcafa530a5c486be19768ddcdd4eac7b488bd86898e773dda3e4f9cef7c61e9682ae9569f2e4cee2c807035ef67ba94fb331d9bd98fcaa6f6a60363bea503435bdbaa8ef81e6c2afc2b4badeb798614ccfa8e4e4ee9416593ba8b33834177b66489e756ec5ea0657ccb4e25b4db9874396c2165c105427a8bd7972e7b0dbd0694e39567f874e77cc1d060ec93cb26082acd19154625593f0952fd0d743067245dc81d16022c382e00ce638b465059ce08dbefda5159de58319ef3ab26d3b5f53304e8e29996158b4aa83a4dd3f420f6af1580cb2fbb4beeb0aa7ae958187ef15e730dfdc833843400830248670a26d1a1c5a3236678273abd7c82082c336143c0f3fc7c06e8f892717471cd54bab9719690b07e1472469aa88b3554c5ff542aa1cef6564a804b6e16aa0218f47339435a26afb986d124b932982005fc66722bc3dba9720081df40b6124bb768d4498024dac031543fabed25034bb74e4f29092e2e3f9101e64450235995b4e6a6796dffe524a1c06c7e333000c2aa23eecf7612c0e3654cf81c7f87a527df0fe41700b19140d5f5ac1abb1c70670d1c63ddbcac333ea3c3292669012e6bf1a48a902ac59e23feac57d5d04b9f763031a488574664c696999eed1b901f6a57b4c463609b10aa602420f4027a2f9d75adb984000c341539bea922ddd5c1940317b75d4349378004c2cfb0c9acbb98ac4a7a8d79b9310aa481d38e0e0605b326da1b170f6f263601a78d042084c3c60f173c1c4faaba2cac35d6d6badebab54f4b1b7045d383c36b3a94934bdec97900464cb7c24b1968762083faea870b9ecb4b52451a05e0b2b409f012f37272c9dbd95950a9d215585e36162729eda5a49fabc8753a992400578431324f8e0da98bab95a261ae74223b8fa89dede5b5a49f635bba766f0ac0e5c10982188a97645e956a68b773435d8a3c81755a585d52e29368a70917b7977432b39cc5b02723510dbd64c1735b3c5dce2f0ec015438ccc8b6343a51a42f5b3f3064692a4ab3a162919c042ac884b76909be805ec9050916c305e54427664e85c491c80cb8550a9ead92daf500dedecad48c0852037981a295c286a8c547a210e07492313ee877b3101b8008d4c76ae6c7c1663c07ddd9264ddecae68bd84dcf7241d1d1935065cf2a9295ea497b561a85d4e6024e09241022080f12135ac60b0922aeb3d52e2424300dcae54271670595df25ebc849c91910a591601b83cbae5bd94a25803ca7e824ba5a681e159fab8818d094091a516ee214bb5447a0cad49bf5e5442ac43ba4bad1a032eb92ecccb017172aea15dd6821fe04a0777bc0c2e2fbd09d9fd9eee52abc6804bee24e5457ac9e5ff4e09b535055cc83cf1022e2fbde06b8ad4aa51e08a447ac965284e397635055c761e5339d6e5a5bc84a596ce2da80370c528bdbc780ed9b1e104ae9a1244b68b73c9592a5e1c199ceaa473697e00ae04780eb9fb9213b8e259c1ab13d93975185c5e9ad0705c4bf7eae1005c3ec4bdbc646da0afa113b8e2995bc871281dc0e5548a820dc62d23839bcfa46b0e61002e45d686f5206b95f472dab5518612b723770c6023f70eb12eabeb9d83c6877a3510764cbc33e39d36987b5b677b2e86d4b9c76000ae38e41cba65cc97e78f498a53831d04bf4cec5cd576ad4d2d938e7cdfc83c49d34ba1672c84921aa7f9df5aebadab533aa73905e08ad2357f74e1705faa726339e6146ad5f5ec0182acaaacdf879747626f952c1841d7578e77540739cd29958a1c0370f9e0dcf092d47b2e7724edcf1eeed8c0259ed2cba93559bca516bca14e1bcbded983e9fa8a71813a18802b3af510e0da9395e958f29e88aeb5e2047b8912d1ccd42e1b1e840da778c6c088cbf70370d520e2bc43bb83f32e2d1d2d9868dfdca1b68c164947a47471c163c3b103175adab177b026aa8301b824ef211f0fabf21e42ed0113814a168e4cb8d710aa1982b8567738aa83e36aefedb40f4360a3e177a2b2b3d2b92f4600ae18fa225aedafbb6b269a8cb477ce10cfa5177e01cbade9288097c8ac0c6c30fc3e8ecc1b52e34af70370c5687f593bf5323381ec9c1bf1706c38b57393c9ef1e8800b55de0184e0c3b7041f2d7743b2b00974b5f7a6bf606984806989d7ae8b7f4f2daa4d3eff66e7689bafbe70f0b790f70f6a84a496a52164600ae283a46c16e60809d5818ca5476de433f6d2fb7cc88783dd7ced692d541a65ff247853830d2b9d94c002e1f83cbb207913d8632d9790ffdf21c3a65a2c7331c60e72164efa04c70f6c8c0aae90e8c005c11808b01767de9a830c6b2b3bfc0e87ed8404e6ef07895bfd8a983b2775026c406195848880ef8270097e743ce39c30000db33b53fed9d39288c0e2c1a45070d40c954be6c7ccccc6ebda71bdddc149b5b1edf57ddb774c108e5bcf74ee865a636d5e42c8c005c51824b762dafedf82e151b00db376b5008ed9f9d49071755492c994ec40030947158efe746bfac9e1235b06e6d9aa5bc274eb5b4ce17b4636c4f5adffeed10091f802b0057c4e062806d6c599b96b4799b768deb691eb56a1eb93a6f281dc91b1b46e54bc7d383a2b951d95baafbb9d1a31d91a9a315c50b6c9f7538770c95ce191c3657cc3faf451ddadaaab699e214802b0057d4e0021dcf6c4eb95fd4a67c83b1768fef49a5b37f0aa183f3878a80af8ac0c08f3d32feddadb36defe346c7f2c7797a0e407563e34c3a6180dfee5e078c0dc33a47cc1bf3cffba23ad81e802b0097277ab1a3133dba788a0e0f6a11062e50e998ce94d7dc90602deb50d1d0afe9e09ccc103a9cfd331d5b32ce9620c92e174e13f6cdb35dd9610c7f7dc34cf119a77b78213ce3a1213165c2bd11e83eb36292ebf7310febdc305fcc1d74787cd7ea00bb04aeca0b6be8c59171012f05e0b2d0ea7af4f2f1af84ebf9e3070260aa3cc3dd63bbd35263f7ce3776ef75bd3ea5fd53fbd1a1b9834d3ab2609868bb96aa84f1cbf301619e982fe68df9df5b33310c5cb7f7ae11efee65c5037abebe71c04f01b8aaa9f24c2e59af67659bc300767cc1cf543aad1fadeaf01e2d3176f1658614db3db2b3c8e2602a33181412e8c4b2092945280c95e78179f13cf1efbe497de8d4a2e11675f94b21ede5ebe5cd03014f05e07a45c64e6b77559cd917c24cd70a0c9b64fe103a943590b667b6a1a5cd6b09da36a085f83dd3510384f0189e5c3e417bc2388f2e1c1632fecdfd3e37e7b6ae7b23315ffcfed62aa9f278f32caab87545f9de5e940e0ec01580abca5670ba9e5f2e178c64f6855836968e197649d9fca1b4775c0f2a30a4d73263775fdbf9432a99fc9df8bd20e33308069f5a3e515bc2f88e2e18668e19e35f6d4829cc6765dbba21f3b9bc744c75e3d4ddb95479ffa6ed3b838a1d802b905ae4e50223c9007bb876325d5936868e1912eac89c9fa8f09bfab4fccbda82b60f6a297e2fc89008a70cc90047826e8471f13831078c7b45ab3a620e1b7a3416bfc3dfcee68e10a53732b05e563c737d67355d7a6504b6562e79bd2a9fdc178c25ab89f70b2709e6832d563cbc23ad3498b3c060ced5edead2be315dc4ef41a7968ca5b32b276943180f8f0de35e6b6c0e183768d79076e2f7277386d14d4b031ad8a15eaf97f74e05e0aac904ef56241776ec67070ac31c1dd8d9cfe78da4b2ac1f6973afc6b4e2abda82d675aa4ffbc776a51306a39eca1b45e7564ea6f3aba6248df07c8c03e3c1b8303e1e2bc67d6c5e269d5c344cd896612dbe7f394c915ecfb77c1580ab46c6b5f67c47d15e2a4f22830c59f40727f5a2f506e3ae349816849f4b0c66863438573041a42b259af0dc938b868b71c863dbd8b5211d9ef63d9d32407575f958a1f286cccb50875fdcbe1cd57b826610802b706444be2bc3d161d3fd08eae2af864d76687c375af7755d5a6d3031083f1767b6a2d306935f583559646fc49bf09c13f33369efcfeda9b0751d732c1b0d801d18d7558ce5b2b12160cc6127be14653b3a2e5c257d0d766c64042a616cd7f3ebe7421c1d2ababd6a021d1ddf5530333336684bb78674d000dfd9fc9174a970aaef746ae110717feb73b7f56a227e0f097bad609c1254c2be32d45f2f8e8b40350cc0453be67d4e2327f4a3963f4fa4dd67ee905f97cad1a1a287eb26d3d5dc61b4b75f335adff60d2a6c51dba42d5d1bd0bea16de8f8cc7e747ec968515b15299d9c3788caa6f4a6e2815f8afbc9f75fd7a60e150ff8924e66fd20324d1eac9d643f56c4afa2b0af54d7d12b0fa871e64c5a34fd1b3abca07100ae74a0f38bdfa73559ade987319954776036fde75e1b43a8ee9862f2fbfaad7c87a793ece53eea877ef894b6b57f83d6b5a865802094b676fd80b6f76ee44af85ca1e2fb1b3bd415403b35adb7f0fa01dc6e638a550d94af7b4f2ae82f437784bcf73f7cb74a6c6ed3a7f4109b5d00ae1420ec8a58b02e2347d25ffae787814945a3379cf51d6050139f16cd8d0864dc87e2fcc4ce74f8c766b4ebdb7ab4a5556d51e6b21e52c723edeef531950cf8824e4dee4ed7f286d9aa7b4a506d9a4e15a776d3cbe7bff9f62eba2e3eea691d20d9a051006cb797bc15802b99840560150f0be3650155f4871fb6d2c5db4f7c071818f4c5d10de27c2da75eef5e0087ae4a6ee476528b53af79d116bb249f5edef077a3595b763dea7581a6018d039a073490005c7156f1a0b3dba978b15093a92514afebe5d51355676dedce1607c4413a440b345f68c35471bc2a408fd32045b9cbc9227af9eca1aff3c686858dcbaf358226824d34d554c90cdd1d0fd0d1fd0413d3ef7aaca77feaba8afea1533e151ebc183f80ddbf46152505d52797184c0d6901b0f11141f122484d48271cdc80c3f44c408120ad2e1f89cb9c1b4ddc29de6f3cd68ded36069bce922d43277b092f2cee60ea984b7fd76e1efda7d6b34cfa6fdf2ea07b8f9f513cafca5f4aec8f0a32981eccef1bedce76ae463ebec97769c5d7f015a5d5efb6ed1cfafb0e8be81fbe5d4affd46d4d5cc1868d18da8d4e604b1ab8a04f47e27c8886feb1cb0a2199feae7d76089854d4775131c5fb8214ab3cb822792797405a19aa6abcae9d277e757dcf580bac0936ba784937808d6db6643a4832126d3b61d2f10214160bbbe4df7fbdd0759155b4f3e4b5f803ecf96f8e522c6e74b6d8574f6098dbdd90fcffda7b71c4ef1c5a04a4db3f765e1e37e9962c153223513614c4763c5e1cdb4d5ea4931bd519544089ba84142b2b8c3fa80c498967c5fb6a3e7143ccef5f509b2c53ba41f3f09b5fe010833d9f08a065c41b54b1b8ca9d0085dd0e3abd2f0b2ad1b48dc72891179c0a7103551c5540f9cad979d2f775504937bf55496850906829072eec0e7101541c1711f45f3bcda78bb71e251660cf1e0a97b86f769501d878aa80f275e4c22df1cee2bd2e76769b5fd22c1eb659463c02bc7ec5a2a083c3bb170f09e544cd276da2645c31393c120caa58ecac78800d36dbefbaafd50a60be832b5635305980b2523c635fae20bb71d63bc8a0fe2518547cd519b82ce9c00a23836fc03fb0d722051b78575b7045ab0aea022899b02323f134999700999dd303a032fe9e0c50e1ea9455a41fb06cec357890bd020dde6cedc08540b0ec1277333c75049495fa2dde4b3a5c21ae7b048013e0fd73baa66d284b096029a59a61abb901cdaf142bdfc0c5761640253220da6485012c1500652518ecc9be84c3e315b812e501b4bbd61cf82535816521372fa21ff65786dfeaa000cfab09609790072dff2d5508768516d2eb950d06a975e3ce7d910d61a574f40cc64b554c847a98e147d685a90e1ae2d61a10b44aae545c0ca84189bc2edc7c209e294b4d76d5bf7c7487fa64adb3dd08e22569e1194c0760b177d18bfd156be574cce092332f5471286b941d804bb5c5005381e1e3edd64630f6c311ab95529383cdb8de1fb8d071ac50ddfc1e9b969ec138832b56ef6146ac1918b213433511004e1e70b4797fc926307d3caed3976f52cfb9dbe877ada62a9f3bb2b0bcda7358924fcf9e3da37fee30c375bcc84ef7ebc2f8d205582a70214666073024ff26055c724c0bf6955dae987522a9ba287e322ceca64139db5d9ff9cf3d965607988f6fa2b3172e2574439854b033ad80a5f205c0c1e6e4dc4838b864a9c503b49b8cac1aa6aadde5a7f710ea9f67fbc578afb9fbaf5481cbb0bbf237ef8bd821136dad5abc730675001752a854e68b4cd1e61f66f8616b61608e93e9989bf27697195cee931735b3e27bd1648fb798b54f800b76979d33c36f806113f92fed66a63db8589382b9e2541f168d6b3e23560fa1273bca227653d5ee62ea347b47429d02a66a78f504fd6df892e8334e3c020c7660ba7806ddc0259b334ec165849b12022ec4006cddef362417c2211d25d51768d1eeb389f3b6199b139a98427afdaf4ed3638ad9b9012cdd3c836ee092eb00adb698557a25045c729f0b5b4786073d3795097d37ca2edff3a45ef9c1acd3b79ea65f4f1d897b50fcddcca5690d2c2b2f86f80a1c1c1b20f4e8882bb8f000f981d6662f5e55c37458a43732573b26f7fa99d1005574c5cec3fedc2bab28a59371fd74c5bbc56563f11c66c4e2c8f0aa12aa54c354766ac8d4397b5f425285e0561f99e75fbcc99a75326175498d00960c2e9523cec9b11169526f462c8e8c487305e580b21f3d2fb420639358bcf7424272f03e1ebac4d7fb7158215d5dee6e5a941dff3a393622c9dac888a55e2be2ec7629a09cea1ec310fbab4b8e697fa512a3c2fe42c26fbabadcddb2e2edf8d7c9b11149ce6144e0925ba2451b0ce65413af8e9054a17feb5790ba754e35919c04838b6303fd367d051772ac426255d1368b31068e3cc474925c01a51fb9b575f3d29acd33b880d674c9b208282057ff808b63c34b50f9ff035bede88965ec2ad60000000049454e44ae42608289504e470d0a1a0a0000000d49484452000000d7000000d70806000000897dc4b50000373c4944415478daed7df77714d7b6a6fe8879e9cefc7267d65b33f7be993bebad3773efbc07f6c5016363636cc0986b1b9b8cc1981c6cc0062cc0e49c4124814012412491834822482401226392c9395a20f6d477c42e9dae3e15babbbafb74ab6aadbd105277d53975f67776de27e379412d4a652a9f518beabff33afdf5af7fa566cd9a51d3a64de9edb7df16ff677ae38d37e8fdf7df177f6bdebc39b56ad58abefefa6b4fd4b66d5bfafcf3cfc5f7f97eefbefbaef81dee05c2fff17bfcece57e5f7ef9a5f95d993ef9e4135bfaf4d34f95dfb1528b162da875ebd6d4ae5d3bcf734c34619c5813bcb3d5436a53aaf3a01d65a4f2e0ef2eae06162f16d33befbc23c00466f38b2900caf7de7b4fdc1f0006c3376edc58fc1fe073fb7ecb962d4d10e0bb0d1b3614e37cf3cd3743c61e09611cb8874cf5ebd7a70f3ffc506c3698bf8e40c32683b1620e433abc16804b376ad5e47525a022914cd1109e81e7d5a953c794924ecf6cdfbe3d7df5d55702541f7ffc719864659000b85e48f57d277aebadb7a8418306026cf17e3701c0d2005c597d5e33990752c34f09e585c0a8fc7c4809a7cf32b03ef8e083908d00520fbf0793f93936bc0bdc17f7c7bb514975fc2dd1efaca6012c25c15532b1b6a90a2693415845741a032405181daa1a3e8bef78b1cdfc268c031b023602196c9082005a32255aba022c2395edac6430a9ccac0c16bbcfc0d681e3831d1e60205dd4326c08506f99a959030000930db0747172a41cb8be6f55a50e62b74d2673b22303e071726030b00042bfd53f3f370acc876d39fc9b8c8d0bef07cfc6e6092f7000ae04d2b651b54d09906c866470d931219c18ac0abad964bab9c931de64a9b090a8505b01b04bf30270255c1dd4c1106770d9fd9d193495806595229823181d204ba43a0b6d4078609bbc1e802b1134beab1eea205393264d6cc1c5c04b55605941f6d1471f099025f2dde3997887f00a07e08a23413d605b40078683cac7992076bbae97a0722a112417e69448a70c7b63e11d0ec0156727861ffa3f766230079c0d883f710cca8990ae84cfe13bf82ed4d2bffded6f619e42fc0d3b3c185057e7851f3611361527478e9f8066fb0b664100ae38c5b49c5cde6eccc0f11d303db22adc321a908ec46944c8a8b0031dfe263f8bf30f75b00913618f41754b94fd05b3200097cf84a06234520b8002b30394f817cce0855815b1820d40e38c0a59a2599920110ca79314c37ce32da5d939046f71002e9f6d2daf520b8bccc1513f5448764bcb8156483ec4ae20b5002864a0e3b9e9ae0ebae55ac673defc7e534d3dcc48050fa1d7528e781adab83fc6819d5a4e9cad5bb7aea734a848a401242440ed96c08bcfe0b3894856f6b211c5730cb87faaa9875a83ab6983d7b5f110aa6c017617c79ae708c65125d846439c949b2c8f6222bc87a992bda12db8905f8617895d59771735c781220518ec42ab8d87cd04d9f3a8f5722a9e6482f4c2e7557561b8379e912eaa2ae77376fefcf5005c7eb8df75aa3f72531b3911d60d60f8ac0c2a9636727573b48410010067f58ae277c94c74f63b332615927b33747664a46a201620b19316f81bab7f708c000cb102ca2954c089c3b2644c6569964ace0d2dc1b5f8c7da664f8c74f2aab18d06a90249a292541cd806416a7b2504b8ed5447ecf6d60a683068aabe5fae04d73d354a4b7071f97ebad80a72ad12f7de90333ea29927544f6e9c1369d9bfb5794f2a828c4b5374ce9ccf0854c2f813676e346ad448002a96863100951c7793ed366e4ce344f89c0a8cc9aa908eb5cd82ce95cb19baaa84ba7b0923556162910e9c6e2483a25ebd7a022c50fba2b5c9f05d0052be6f2abd771eb7aed22b23f012c6bfb236daf817de81b5e705a4e0175f7c21eeed446ddab409495076031a545559754d0529c681655da59756e082f747a7d292681284d9a53ea84f37caecfd2d6d9b339cca0ba62869e3ec11943b2193ba75fec6d6f921f7b688d50665e021658b3b44c924f7fb48953c490e69e828bdb4021797f1ebbca89c06c5294abcdbd7af579726f4eb44c7964da4cabd391113800690e1deb8277b13e33917d87e9070906e72176004b0394ee6256e17d85e2900ae487209e3a96a80a955f97daaf4a4be1dbfa2a2ac215101ca4ae7564fa56fdb274f1d06d858aa414d4c155b4c57db2b434717bc9fe9320c1455d9092464245d6c9b7ef43e756ed98c660fee4ea539a3e8feb639be80ca2f7ab87dbe5037772d18432ba7fd4ca307f651aa9c5eabadf1fe20c564f554c7f0084b2fdde25e19bab9e0a32d8ab4d618a9dcd54e04b50ec019dabdad099e93cb2768059e6869c5a481d4b3631b73530133ca073778c93861a91d8b832611712f9db2363274b3b7a2c9e8e6ba2b6600ae24c6efe49d77d384be543c63a049250b46a40578bcd08d4db3e950ee185a337980d844ec3619b9b8940f72b0e643e23deba62672c843a79cc38c54b5b73851163b166792ab623e48fbc17dc7f46c4b8fd74f31e9c9c6693506587604c90cb0415a0370ad9a35b2cde2e02398e4a394740af473cea14eedd83252d1dec2ae8a933b0028a773aba0cee073f5df799baeaf181702ae8a1d736b3cb89c4007270dd463386ca0325bc1266786e81293e4f0852ef55eda80cb8bbd05b0e0334e4d6364e2de0b33fa770c01d6e30d53e9c59e850190a290727660d3c10ee37a2f5ddcf25a808b3b3cd9c5b7b831a5b5418c13018888d5a8a4d6b3adb302c0c448b9a3be0b51237589878933da1abc1e80cb7ad6962a680a607df6d96711e7cdd94a2d835e142f0800e2135d593b5dd86c9066906089e867e8c5b1a14323d10c9df309f96c2bf9ac5ff9e8d368a4d6934dd30350c4496d441c30d98e0ef0892e312f2dc0a56a4483b41c6e5ba63aa5315aa9153832e24708aa438a25dbd1a14b9f8d0c5d9275bdec76c81af02ab5704fabd4122a61e0c8883bc1cbc88e8e64a4b28953599a04e0329d195e82c790645efa46e07e999dbe0a03d6d32d3303e64f10c195cf5ec544079c39d85de3c1c5ce0c2f3b9c177b8b4b26cee58e0c54428decb0449ef1c581ee1a0f2eee05ef2521d4c9de423099539d3a356f1206acc04b987c3b2c516a22b75fabf1e082e1e9b538d24e0db466b42387d00aacc04ba8871d96881e8a9ca951e3c1e535139e8b14e5fe0f728759fef9930fdf534aad67dbb20226d7404d9403cff16a8a83fb2243be46830b39605e8f376567865c8a0e40e1bb68ac6997a0cbf47cd7fc80c1357276346d583fa4512927063bd9d36cb3b9991000578d77c5475266026706979f6331acf9854e8e0c50c0d47a1152d050f68358246c64a6e68dab5a2780b0a6d83cb1d67267628464dc6abb6a3cb8bc7a0ab99608c0b24bdac5df5a7ed25009acc0ded28f7edb3e47b956eb26f477945e706a790922d7f80c0d2f6dd4a0066227b26bffcccd62709f85995dd4f65690a8ab1d3ddf9d1db64e47e60fa1c9fd3a39820b1a4c90fee4430d1774702f8715a0aecb49250ce25b7a92759da026b6f8b491e35ac3f6f67286b20e15c9193a7a0aa1063668d0c07337593836ecbc848133435f7aba794618b8b821a91db93933588ba9d159f1769e42a88868b1ccfd1bdc32e121d59cbc848133436fa786bc4e884fb20d6e475e03c8351a5c2a4f2180c4ad9abd6666b00b5e15380e9c199a3b358a6687ac153c87225669a3b1a071a91bb8b822a246174b469253e8042e4839bb0cf820595773a786a1aeabc085908bddd965a992b49b54704572e0829bbd65e7820761770c1839353c860c2eebf9d01ce772f31406e092720abd767b8ac5de0a3c85a9e331647001541c4866421c13c726216fd0a95747002e8390fbe5256117fdcbedc0c5c66bc1c85e81a7308dc06567734155e433c5e04d56693da261694d6f50136dc2ae2abe85e0a31db8823293d471c7bb810b6a211f7d04e7864a82e952e29fb2e0b29e236507acc00d9f5ee092bdc87cce9835cf3000570ce0b21e6de3143c46f3cf80815327d6c5712ebbfc51b7b3a4c12b01b85e810b866a24e0c28e06c316df6367865dd5b170c31bbb62c0c0a913eb4286865c4c19690059b7635c93ee2d744b676170613793b3e20134bb463401b86a26b85872e9724e57d283c86ea7dce3857129bf7ce802834bd59b300057fa81cb4b00997bc5eb728c50d2c0c52dd5dcaa900128b85ead117b4e73b14b7b0a4afb53832a76ce0b2939c19ac259150db8582dd421af30e959f16eb12e004a052c195cd8ed82ec8cf44981625b3c1670e972ba6452c1c56dd554f10afc0e1179bb18171fcb6a975318802bbdc0e525f54997966a5a800bbab1eae820d8596858e29453c8e0728a7105e04a4d70a9ca4ebce4a006e052f489b7bae41b356a64561f0368aaac787cc731c615802b25c18535659e9009315138b19c4006534197d4276d9a82cad9f1388b0bde41008aa3ef76e0728a7105e04a4d70614ded0e43e7aebd00912a84a34b4b356dc0c5aa21fa65e085e1c559fb24c8e77405e04a6f70216ea94a81c206cb7985d87c91b86b0de304e0b2d0a579555e43804555856c77ba0902ca01b8d2bb60d2cee6c2d96d001b7f46ce88479d60002e07d5d04bf2ae5bea5300aed404975d20d9adeb934efd0ab502975be75dd5a17701b8d21b5c886f46d2f549b7d4276dc0e525a08cfa9d005ce90f2ec42d55b12e37573cf34400ae0803ca1c54b6562007e04a3f7071ac0bbd51a201972ea94f5a818b55436b40d9ea31e4eae3005ce90b2e8e7545022e789b0370b9a886f0f8d8e9d42cb1b80a3900577a828b635d724ea91bb8746a06aa25b85835c44b55810baa021bba01b8d2175caa58975b6ea12ea7496a0b2ea732143e94418e7305e94fe9092e552f0db7ac789d5aaa69092e1072c354aa2132e465352148dc4d5f70a1559e35d6e5055c3a1cd5aa35b8c6770d570df133525de44c0d2fe08aa495f583c20974b76064085dcbfe912e4eed664bf83b7f16df8f85c970af5bb9837d3954ae7c7073f16f2cf790df83d33b0061dcd677e7f5f92a70a902c96ee0023fe894faa425b854a79f708a8b1c4c763ba6d54b993f18e04a561f2aedf61e15b7aded1bedfbe64d3afa63533a3da2750808550c87dfe133f81e40112bb8f02cdc0bcf7fb2699ae346c2e0c0670ff769e8eb3b0061fe7663302b9177cc0d5b3755accb0d5c3a757dd2165cb26aa88aca73bccb4b25b21db898a10102bf19ca0b8191c1d020790c7e482e907c4f7e8ef559892427a05b4f3ab12b9a743be1049fd729af505b70b16aa86a5ec3aa219236dd7a68a8c0851d3b1ebb74ace487d4620248759b1f808d0dcd2bb870b806bcc3d84499e06e577992753aaa557b70b16a886a64bbdef15eba3f3dd918ba5bb2faa51b9d1bd731261bc94e3d4c96a4729362f25cedc0e556d7c5f698aea94fda82cb2d531efa37ba42b9f52de476d6584c2caa5245fbfe633a33ba1d5d9ed5cb906a23e8c19a712184df5d9dd7cfa4f313be119f9709f790a9a4cb3b11d925f1f2c4c1b68a0460d67994677e1e3657f95d5ccf1918f6be40f83d3e8b77beb7e31b4a29c60e2074e852ad1b4eae41b805d20a1ba94c08cb40ab41612d9f3a0a5e58fc63ed005c9116515ac125bf50b74032747dab1a08c601485460f29bace0b412fe1e4f573798d8e9f9f19e3f08cf3939ac4518d0a0a25bcf45b6c6baac591a300bacb6b88ed9195a83cbaebf865cdfc53de3ed807577d908d3138885c54e7c2b7f4842182a128a772c49a7b95e98da950ef67cdf04d88d9c41cab5e358971c484ea5d427adc125a743a954433777fc8355e38c45fc804abbd6130b6a95529bc7f5a4293dbfa2e1df34a34fdea96dd29ffef8dfe9f7bfff7dd424df4b45ad1abe259e092a18faad1887df60bab07a32ed9e3398660df886c6f66a4d3fb46ee43aae776bffdf98e68deff3bdba34ab6fceaf7cfe4fb6aa23363b6c7ab77287d8c6ba2201176cf5005c3e64ca433574eaba7b627073fa75f6f7228e222f2a00152b80fca63ffdcb1fa8478b460210d102eaee962c01a6fa75fe5dabb9f186a3021954766817582b6c862a70c9e5fea994faa415b8eecfab45a706d50a337eebbda14e87421f052e33b07a0cb160f2b1ad4fb7ce148b99fd433b73c15b37fd9046f6ee40d30676a76d73470b7ab27f45ccc4f7b2a35593078be782308677ebd40e61c4b69fd41740890458eb26f5170035c1fa3fff859a357c8f06756b4f637fe8463387f4711dd781fc2931cffdf49a392173fcf19b1654ebcfff664ab62b4b475683ab707cc899c8f29ac98164f60a3a0591195cc21bd9a78a970270bda23b59b5685f875a4a0f56df86ea4c79ced6c0dffab4fdcc35bff064ced05752e28fbe30925ff4ec60215dd8be9466fdfc3dd5fef3bf8a31428a45a20232a87ab46c42ebb24652e5c9a2107a51be35a973ecdae25331beae5f7c6482eb595156d8b1adaa40b21770712a9ce98dec50c55301b80cc26e230753e5bcb51ddf37b58d79e18543aa21e0e87618c3a08e9f57eda086a48898414ad7d0833d057473c3fca8e846e10cdb7b57946d344170b7640dd5fe4bd54e0fd07801178088cfcf1ad28b2a4f6c0d0316d3b3436bab9f5bb28a1e1f581bf57c6eae9b4d0f76e64624cd79039081a5ca2bb4828b4b8cecc0c5279bf468feb1e01d339ed62700173dcaa90616f2fc540cd4b96533e5595ef83fab046e591a2c15660ceb4fcf8e1755d3895df4dbe9bd215471e1083d3d534ab7f6aca36bdb0a7ca11b3b57d3dd035be8c989e2ea679dd94795bf941a544295678ba9f2d4766afb59e32ab018f6931770b13a5856984d95a77756dd07f7bb78902aaf1cada6ab27e8b75f0ed3c3a3bbe8f6be0dbeceebdec12d61eff059f98e90f75cfbdfff22c65938e17bc7a45d99eabff3b6990265072eaee32aca1a22ee091e627e026fd568705d1e5bcb0c2cda6529ac993cc036e6c59e22abc7b0f5477595c6f5c5833be8c595e30240760410dc285e4f4f6ffe4abfddbd4987776ca69dabf3a864e3722a3568cbb21c9356e56653c1e26c2a5c9a43bb3715d0b6b54b6885f1bbc78f1e125f4fae5e108c787377213d3a5e2c18fcc9a9fd06c39fa497d74f9b54796697b091583574b3bdca72ab2582905006a8e4fb313dbf748c9e9d3b448fcaf7d0c363bbc5586eeddf4295cf2bcc3196eed94585c67c766c582ee6803981d6e62f30e7ba6b4d1e1ddc5c40fb372ea3adcb73e8eee5f3e2fd3c387d44800c730a799717cb8c671fa5e7978fd1c03e5d95eb513acb3e3714314c2770b1d46ad5ac5148de2807cec15b351a5ce5fd6b9969314e8cd4f4a3f795dda110a95725f0d6fa3fff3b6c2161e4575eab6668fc8c1dfdc5af2704e09e9e2e1100b85bb6c764bc8adf7ea355f90b69fb8665b46b6301ad5eb2d0643c2b6d5d932f00b665cd123a72603fc9d7c3f3e582a91f1cd911062a3116481703200c2e73ccefbfa92496c421e032249f3c3f2b619ed7b7afa4eb3b568700cb9ce37acc7139adcc5b603bc7220378aa396223c27def1f366cbc5fcbc3c671b1748b125c0b0776f4042e5525326b2da539a3427885b371c05b351a5c6c6fa9923a659a3db8bb3299979d1a568fa16a21f32619aac385034ac6831a7863f75a7a74e94c08286e5ebf461b57e586ede82a82f42a3676f69d0683eedaba91acd7bdf2520130489110605d2daf52e90c80600388c6ddbd3b7f7a15c0ceedb50518d44100a0e2e1bdb0396e58e1718ecb1651f19615628ec5db42e7f8e2e963ba6d6806774a360b2087ccd15057ebbff5d7b0718ffcf6734fe0b23605e57587c960e515ce214db6dd9574709576f606aefbdbe6d0476f8597a27033482fe03219d0b047e48587ba0435c9ca74cc789b0c9510cc74e9dc09f1bbf2b2c3b68cb7c7603cecfe7b8a3691ea02c0c0e426d3c13682c479e578a8fdff4283b9885b21102c135446d9f56e6e1cecc000500d4928cf118056014b9e63f1d6d5f4bca24248b2d54b17bbccb180f66c57cf1152fa56f13aa18e0aede0fc3edb8dc32bb8acf63667e75c593bdd165ce0ad1a0d2e76c1cbe082de8c4c71ab5b7e52d3d7949d79553986efbef6677b7031035e3a4c8f4fec153683ac26c9176c27482e06d7ad1bd76dc1b5d55095185c470f9590dd75ab641b3d39b6bdcaf92079f4ee96ae0d092c237ee51434464c8c3f8f98569897104c7df98829b5601fa92e8009e0dabf633dddbf7353cc71fdca652e732ca0c3fb8b6de788675ddfb68c2a8e6d36c7a302d7cae1dd3c814b6567776ff09ab29485c105de0ad4424b3d1332c5ed32b71154b6da5ed0bdade0da36f13bfaa1759310908580cba0fbbb96d283b347c9ed2ac8994dd9937fa2c5d387d0a2a9836958dfee34e4bbae213466606f5a326b18e5cd184a73c60fa4cb17cedbdeefc5b32774bb283f0c0c903e3c562760c9c40083c47372c33f3c77dc718e6b97cc37e73867dcc0b0f981a60def47cbb2868b39ce759923cff3669101b0a39b42c0858d0376a393d492c165b5b7a0bd800fb6b4aae60b1960ec92aff16a21834b7668b0f710ff1e1bd08cce8ded20e848df4662b7b20695dddcf14debbd1e062e2cf8f31be7c9cb75e7d64d9a3cb40fcd1ad99be68dfb9e164dec47137fea4a13067631a82bcd18d693161960c81ed797660eef45eb0a725deff9f2c5f33010f468d7dcccd2f0daebe245f102139008462b0176fd4cc473cc3668dc80ce345eccb10bcd1bf3ddab397e2fe6b861659ea777f7b2e2a970cbcbe0429ad78b3d0b1d81c5cd41012e64e3581d58e33bfd4df086bcf15a1d1a351e5c72ca13bf1c2e83c7ef9077c62ffbd2f49eb4f0f3f0f66b1cebb05b244830113b1ad62f9cf12e1ea2970f6f8a5dd6e9ba72f102e5cc1c4bb347f7110cb670423f5a3cb9bfa01c036cd9e3fb52d6e8beb46fc7667786bb734930bc752c485b62e6f304aea2d954b1731e3579eb3fece7c72efa5bbfd0cba70f5d01669d230005c2cfd83ce68efb818ad6af72955800159ec98e1a797e0890bbc5b838888c0ecbb2d4423201e25f488f6270710f10ae11637e026f0571ae572f032f07c99c202e5547d634bf6c644fe37778e9b26ac83ab8dde1e370f70a89f059635bd5094c003be8e985635471ffb62de31c3db88f8a562fa02d0559b4f515ed285c4807766da0278f1fbb4b2b047815cf4710985526cf5d9a0c703ddb3a8b26776fee3ebf57f4f2de5557f09f3a7a90766dc80f99237edebb75a5e31c1f5f38414f4eeda3e7a78b6de7871082684c636c0a4ec03a327f48586c939d575c202bf71e1149c0afba70f1ef6b7c9c0b3960fc32509a2e0792593594933af1ff0ef543ab94195c76cd6a10a874b34b647ab27f253d3abc996eee5c498f2f9f71049bdb855dfcc5fd1b229e26efe256824322d2bc42c1a01ba6d2a99c9f4dd5104e11d73942921920abb87b8362b9f06eee1ddf4f77f7aca6472585a66da522b62759e5b52befb7164bcae5463005f03b008f375af088ac2673f72b50b2f30bb5c82db42b79678fe1f50503aa7734c3eeca6c14dac086631e4e9da038a86c756ab85145f936e1f8b8b9355f18e737f76e104e1030961d09862bdd44f7f7ad1140f5f21c76c1ef9a9d197143cd7b2b460b0741984bde6d6e0618303780e3dee11d626e18bbddbc10c3c28683770187cc9303859e9ef3e2c436d3deca1b5155bf869e926ece0c6b35043651ce238589c0fd47e477223bc382c45dc9a981aa616ba726fc1e7559fcd24f0f6f6dda5dec92f702ae4599df56676944002e5bef5bf1322539edde76045b096383e325925213760a402dda95f593299d3d492f07a96d37b768ef59b6665e884a28c06553de2fe715c25165b5b7166676117f87838b5b05c8ef842bcf83c4dd57746144a8dd25bf2cb13b192f925ffa2f933a53618b2a70f1cbf7022e560da3915ef12478f8785cab47455e950cb510a5f24fb7cc300b25e175d4657eb29750f6823a010b79a2aa7826d61b2aa10c2e6bbf10e623f05400ae578592aa7805bb55b1339b4574868ac84e8d48c0f5b070a2e992471a8e2e8cc759f0505be19c88145c900000d7bd95a385cac5401559f21acc6fdd9cb1d59bda2b2f28c2074ee0e22a646ba2b6ec1106b8acf9a872eb3c1d0a26b5a944e64c0dab6a089dfaf6929f435fbef1b996ef5657287b01d783d5e3456099171a09b2c9663c560741181baaa623eeeb5e345b800b1b10becfb657aceaa11f84e7b3fb1de3f25a6ac2ce0c3933e3dbf66d43120544ecd3626fb14a98eccc0cedc025c7bb64d510f539d0ab43dcb47d1b098f612492ebfecab12131af488d7fbf09aaa935bf0e3654c4a784ecce16e0124e1f4345bcb379969977e8877d190bb0385117e3918b3fbd7a0a65700d68df5cf432e4cf5c9bd73fa4fe4f5609931ddfd20e5c37a6a955438e5dc82f1f4e0d780cb93a99c16517e7aa925ce3846a889fbb7ef6417569bc619f247a8707b07847c758223d9125acbbeefc1fe8eadcbeaffa344ea7b2c5a34c8025637e5005d9fbf9a73ffe0f3abc6058c878a1fe3a810b6d1bb09eb24a38a4fd6721c9d9584fd99921ab84e0a5005c123dcd57ab86fc0265ef12bc8748e2fde293506fa1d3823d5c33412c08ff1f09a372cd176c1f3045bc9d179ce2245a0ebcf667baba7c8c180f54a568c17563e140012e9e1f009637bc87f91c307abca534e606555bceeac7c681f959d55d374f21b7b296c195d5ad79886682f725834b5609c14b01b81c54437e711c549617044165b8e37ffcaa9167703d5a3799eeaf1813f23b2cbcaa6259ee9c04c045e35d04b3e1bbb807806bad6562c653f5b48ff8e085bc21025c77974beab3a122164de9272487aa2b14ecbd68e785ef01ac3c376b990c362db908120e8c100fa74bda930a5c0b0776363d85d6cd8843363aa984da814bced6b00694adbbddc68ef528ab5dc3b0e0a21359c1c5840c07d862aaea6515f0dcc8e9fbf058c279213f3f1a47866cbfdcce1f6ad85c3fd2edbca16173038061d3c920b312c0e1362755a1a395b051592b8b2145ad366234e0da3c7940c8676470c981631dba3e69db14948b27414ea76120a17779db7a26b8dc7ac60b70ad1aebfa19000d2a231812800318bc80ce0e48b8c7b4dead04a05852399dc4122db8e02d943359ec627d3c370021967981701f9e9b6d6b3b4b5f14d561776ee0ead1be5558575e39e589f925d9c591da834b4ee4459e981db890fe2283cbe92821593504b97dce0978602437c2e7bcde3316a95515449e22c05525bd0644352f2f73b2db1c1cc9504dad1e50374fa10a5c39df34529e5e239fa4a943a2aef6e0925bada18cc06ec7e3c44d06171af77b597091d3662c7ab400f393dc8e95f5420f0b2798e082ede5453a27848c778cc46255d03b1270416a21f462bdb75c9ea44b2bb5d438fcae7f78cc4b157844390aa7c5389d8d6cedc0eb45354904f3c1fe88155cb2e4023d5c3b31f99b870db0385dcb0bb8384120bbdd0721e96ff2a6843213b3996c7ffdf8584b70c9312f0e14aac005bb6b64bb4fa9cfa7ef452c2db0f8b07792c580b1aa8366f26ef102bab36498092eb8e3c5e6912480e1fdda6d1a6e694f32b8b061426a59ab22e435d431b69512a79c70cc8bf3c75465e15c7630a9cd871131809c550e4684472b51cc8767f9052c956a08a031230bfb26412083ba6d27ad42eacf3cdc0bf6332acd21b5b0be762dca5925d425dd2965c0a52aff579dc185bfa35189f5081a2752edac6046303db207fc9468b817765a30841f6aa092698d71cbaaa115bcbc8970e532c613f586628055ccc7b80fee1749f0db8b3343548e6776a18e9f35367ba8a8547bd94ba8536c2b25c0757562784059c51038e0ce5af3e5974a06c68996a2c9138c8510586770c5eade8f177971667089ffa2165555e828310a5b3f4302721b085d5542adc12597a1b04b5e753835f20cad8d6cdc289ad20edd49560defaf1ca3e518235151f9fc64d5a993d032e4be96baa43ba5d4c992d6445e55749febbb4abad48b48554b3770614eb26a684d394a3679c9ccb08659e4e644d68c0fee0e76a887befc9b52e0b2532d9c76393b4ab4da166fe24c0d263f62687edb855ed786ab8c55da08abf4baf4264c5970712a949c6768dd01616b416ad9e9e7b676978b672bd9b649e5fedc88c17525eb3b01ac7b05a3844b5ea739b99599a8ec68a8fc76798a01b8e2d08d9777c1ab73fa86b5bac6a278b6bbb665259de1acfd424c26dc30852a0fada0ca927cef6ae1e6e926b8f07e50407967d9707dd4568fde493866aceb8a0d141b8eac6d04e08a13b81099e79e8656b21e5c1dcfd4a398bc7b05239587fdc11901e744e5be4554796a87678001480016e68fffe3e7b2fe9f68012c2fadabadb14b99b0d65873f99ebcfe678704e08a290d4ace31941bede305730607ef64589c4883c9c920d591496c3799debeb2b5f4f2cc2eaa3cb2a60a6c2ef713e94fafa4217e3e35aca51ef696c7e031885b54635d410c22f9a00eb965b50e5d9e52125c72cb356b4728bc74b91295cfc255051d6d83c93154ffc64a2c8da1c2418a3e5a3729248dc9fcecd1f55459be992a8f6fa4cad2a5f647b8f66f22becf06bf4ee05285506c3b3fbd5a6f9654886761adadda4b00ae38810bbb98b519a49cc4e9355b03922299e0825d247bf8a2f5f6e15d94677e2100ca5918b8077e974af6166c2b550730c43903c915c7da2e59e7c66ea65a44ce35f3aa1a5aab64130dae4bd37b9860c2cf32c176f212ab8253042e6b7cc70ad643bd3f4c297bebc42b75dfda328d7bc0abcafa91c913802bc6b27faba45211ab8661f53f1ac6bb105e103d190d105c9bdf9ff676a81362c4e3ffe7277c630b30a85a722d131300c5e03afcdd4729636f41dbe078a5ca8baa5a67ddcafa530a5c486be19768ddcdd4eac7b488bd86898e773dda3e4f9cef7c61e9682ae9569f2e4cee2c807035ef67ba94fb331d9bd98fcaa6f6a60363bea503435bdbaa8ef81e6c2afc2b4badeb798614ccfa8e4e4ee9416593ba8b33834177b66489e756ec5ea0657ccb4e25b4db9874396c2165c105427a8bd7972e7b0dbd0694e39567f874e77cc1d060ec93cb26082acd19154625593f0952fd0d743067245dc81d16022c382e00ce638b465059ce08dbefda5159de58319ef3ab26d3b5f53304e8e29996158b4aa83a4dd3f420f6af1580cb2fbb4beeb0aa7ae958187ef15e730dfdc833843400830248670a26d1a1c5a3236678273abd7c82082c336143c0f3fc7c06e8f892717471cd54bab9719690b07e1472469aa88b3554c5ff542aa1cef6564a804b6e16aa0218f47339435a26afb986d124b932982005fc66722bc3dba9720081df40b6124bb768d4498024dac031543fabed25034bb74e4f29092e2e3f9101e64450235995b4e6a6796dffe524a1c06c7e333000c2aa23eecf7612c0e3654cf81c7f87a527df0fe41700b19140d5f5ac1abb1c70670d1c63ddbcac333ea3c3292669012e6bf1a48a902ac59e23feac57d5d04b9f763031a488574664c696999eed1b901f6a57b4c463609b10aa602420f4027a2f9d75adb984000c341539bea922ddd5c1940317b75d4349378004c2cfb0c9acbb98ac4a7a8d79b9310aa481d38e0e0605b326da1b170f6f263601a78d042084c3c60f173c1c4faaba2cac35d6d6badebab54f4b1b7045d383c36b3a94934bdec97900464cb7c24b1968762083faea870b9ecb4b52451a05e0b2b409f012f37272c9dbd95950a9d215585e36162729eda5a49fabc8753a992400578431324f8e0da98bab95a261ae74223b8fa89dede5b5a49f635bba766f0ac0e5c10982188a97645e956a68b773435d8a3c81755a585d52e29368a70917b7977432b39cc5b02723510dbd64c1735b3c5dce2f0ec015438ccc8b6343a51a42f5b3f3064692a4ab3a162919c042ac884b76909be805ec9050916c305e54427664e85c491c80cb8550a9ead92daf500dedecad48c0852037981a295c286a8c547a210e07492313ee877b3101b8008d4c76ae6c7c1663c07ddd9264ddecae68bd84dcf7241d1d1935065cf2a9295ea497b561a85d4e6024e09241022080f12135ac60b0922aeb3d52e2424300dcae54271670595df25ebc849c91910a591601b83cbae5bd94a25803ca7e824ba5a681e159fab8818d094091a516ee214bb5447a0cad49bf5e5442ac43ba4bad1a032eb92ecccb017172aea15dd6821fe04a0777bc0c2e2fbd09d9fd9eee52abc6804bee24e5457ac9e5ff4e09b535055cc83cf1022e2fbde06b8ad4aa51e08a447ac965284e397635055c761e5339d6e5a5bc84a596ce2da80370c528bdbc780ed9b1e104ae9a1244b68b73c9592a5e1c199ceaa473697e00ae04780eb9fb9213b8e259c1ab13d93975185c5e9ad0705c4bf7eae1005c3ec4bdbc646da0afa113b8e2995bc871281dc0e5548a820dc62d23839bcfa46b0e61002e45d686f5206b95f472dab5518612b723770c6023f70eb12eabeb9d83c6877a3510764cbc33e39d36987b5b677b2e86d4b9c76000ae38e41cba65cc97e78f498a53831d04bf4cec5cd576ad4d2d938e7cdfc83c49d34ba1672c84921aa7f9df5aebadab533aa73905e08ad2357f74e1705faa726339e6146ad5f5ec0182acaaacdf879747626f952c1841d7578e77540739cd29958a1c0370f9e0dcf092d47b2e7724edcf1eeed8c0259ed2cba93559bca516bca14e1bcbded983e9fa8a71813a18802b3af510e0da9395e958f29e88aeb5e2047b8912d1ccd42e1b1e840da778c6c088cbf70370d520e2bc43bb83f32e2d1d2d9868dfdca1b68c164947a47471c163c3b103175adab177b026aa8301b824ef211f0fabf21e42ed0113814a168e4cb8d710aa1982b8567738aa83e36aefedb40f4360a3e177a2b2b3d2b92f4600ae18fa225aedafbb6b269a8cb477ce10cfa5177e01cbade9288097c8ac0c6c30fc3e8ecc1b52e34af70370c5687f593bf5323381ec9c1bf1706c38b57393c9ef1e8800b55de0184e0c3b7041f2d7743b2b00974b5f7a6bf606984806989d7ae8b7f4f2daa4d3eff66e7689bafbe70f0b790f70f6a84a496a52164600ae283a46c16e60809d5818ca5476de433f6d2fb7cc88783dd7ced692d541a65ff247853830d2b9d94c002e1f83cbb207913d8632d9790ffdf21c3a65a2c7331c60e72164efa04c70f6c8c0aae90e8c005c11808b01767de9a830c6b2b3bfc0e87ed8404e6ef07895bfd8a983b2775026c406195848880ef8270097e743ce39c30000db33b53fed9d39288c0e2c1a45070d40c954be6c7ccccc6ebda71bdddc149b5b1edf57ddb774c108e5bcf74ee865a636d5e42c8c005c51824b762dafedf82e151b00db376b5008ed9f9d49071755492c994ec40030947158efe746bfac9e1235b06e6d9aa5bc274eb5b4ce17b4636c4f5adffeed10091f802b0057c4e062806d6c599b96b4799b768deb691eb56a1eb93a6f281dc91b1b46e54bc7d383a2b951d95baafbb9d1a31d91a9a315c50b6c9f7538770c95ce191c3657cc3faf451ddadaaab699e214802b0057d4e0021dcf6c4eb95fd4a67c83b1768fef49a5b37f0aa183f3878a80af8ac0c08f3d32feddadb36defe346c7f2c7797a0e407563e34c3a6180dfee5e078c0dc33a47cc1bf3cffba23ad81e802b0097277ab1a3133dba788a0e0f6a11062e50e998ce94d7dc90602deb50d1d0afe9e09ccc103a9cfd331d5b32ce9620c92e174e13f6cdb35dd9610c7f7dc34cf119a77b78213ce3a1213165c2bd11e83eb36292ebf7310febdc305fcc1d74787cd7ea00bb04aeca0b6be8c59171012f05e0b2d0ea7af4f2f1af84ebf9e3070260aa3cc3dd63bbd35263f7ce3776ef75bd3ea5fd53fbd1a1b9834d3ab2609868bb96aa84f1cbf301619e982fe68df9df5b33310c5cb7f7ae11efee65c5037abebe71c04f01b8aaa9f24c2e59af67659bc300767cc1cf543aad1fadeaf01e2d3176f1658614db3db2b3c8e2602a33181412e8c4b2092945280c95e78179f13cf1efbe497de8d4a2e11675f94b21ede5ebe5cd03014f05e07a45c64e6b77559cd917c24cd70a0c9b64fe103a943590b667b6a1a5cd6b09da36a085f83dd3510384f0189e5c3e417bc2388f2e1c1632fecdfd3e37e7b6ae7b23315ffcfed62aa9f278f32caab87545f9de5e940e0ec01580abca5670ba9e5f2e178c64f6855836968e197649d9fca1b4775c0f2a30a4d73263775fdbf9432a99fc9df8bd20e33308069f5a3e515bc2f88e2e18668e19e35f6d4829cc6765dbba21f3b9bc744c75e3d4ddb95479ffa6ed3b838a1d802b905ae4e50223c9007bb876325d5936868e1912eac89c9fa8f09bfab4fccbda82b60f6a297e2fc89008a70cc90047826e8471f13831078c7b45ab3a620e1b7a3416bfc3dfcee68e10a53732b05e563c737d67355d7a6504b6562e79bd2a9fdc178c25ab89f70b2709e6832d563cbc23ad3498b3c060ced5edead2be315dc4ef41a7968ca5b32b276943180f8f0de35e6b6c0e183768d79076e2f7277386d14d4b031ad8a15eaf97f74e05e0aac904ef56241776ec67070ac31c1dd8d9cfe78da4b2ac1f6973afc6b4e2abda82d675aa4ffbc776a51306a39eca1b45e7564ea6f3aba6248df07c8c03e3c1b8303e1e2bc67d6c5e269d5c344cd896612dbe7f394c915ecfb77c1580ab46c6b5f67c47d15e2a4f22830c59f40727f5a2f506e3ae349816849f4b0c66863438573041a42b259af0dc938b868b71c863dbd8b5211d9ef63d9d32407575f958a1f286cccb50875fdcbe1cd57b826610802b706444be2bc3d161d3fd08eae2af864d76687c375af7755d5a6d3031083f1767b6a2d306935f583559646fc49bf09c13f33369efcfeda9b0751d732c1b0d801d18d7558ce5b2b12160cc6127be14653b3a2e5c257d0d766c64042a616cd7f3ebe7421c1d2ababd6a021d1ddf5530333336684bb78674d000dfd9fc9174a970aaef746ae110717feb73b7f56a227e0f097bad609c1254c2be32d45f2f8e8b40350cc0453be67d4e2327f4a3963f4fa4dd67ee905f97cad1a1a287eb26d3d5dc61b4b75f335adff60d2a6c51dba42d5d1bd0bea16de8f8cc7e747ec968515b15299d9c3788caa6f4a6e2815f8afbc9f75fd7a60e150ff8924e66fd20324d1eac9d643f56c4afa2b0af54d7d12b0fa871e64c5a34fd1b3abca07100ae74a0f38bdfa73559ade987319954776036fde75e1b43a8ee9862f2fbfaad7c87a793ece53eea877ef894b6b57f83d6b5a865802094b676fd80b6f76ee44af85ca1e2fb1b3bd415403b35adb7f0fa01dc6e638a550d94af7b4f2ae82f437784bcf73f7cb74a6c6ed3a7f4109b5d00ae1420ec8a58b02e2347d25ffae787814945a3379cf51d6050139f16cd8d0864dc87e2fcc4ce74f8c766b4ebdb7ab4a5556d51e6b21e52c723edeef531950cf8824e4dee4ed7f286d9aa7b4a506d9a4e15a776d3cbe7bff9f62eba2e3eea691d20d9a051006cb797bc15802b99840560150f0be3650155f4871fb6d2c5db4f7c071818f4c5d10de27c2da75eef5e0087ae4a6ee476528b53af79d116bb249f5edef077a3595b763dea7581a6018d039a073490005c7156f1a0b3dba978b15093a92514afebe5d51355676dedce1607c4413a440b345f68c35471bc2a408fd32045b9cbc9227af9eca1aff3c686858dcbaf358226824d34d554c90cdd1d0fd0d1fd0413d3ef7aaca77feaba8afea1533e151ebc183f80ddbf46152505d52797184c0d6901b0f11141f122484d48271cdc80c3f44c408120ad2e1f89cb9c1b4ddc29de6f3cd68ded36069bce922d43277b092f2cee60ea984b7fd76e1efda7d6b34cfa6fdf2ea07b8f9f513cafca5f4aec8f0a32981eccef1bedce76ae463ebec97769c5d7f015a5d5efb6ed1cfafb0e8be81fbe5d4affd46d4d5cc1868d18da8d4e604b1ab8a04f47e27c8886feb1cb0a2199feae7d76089854d4775131c5fb8214ab3cb822792797405a19aa6abcae9d277e757dcf580bac0936ba784937808d6db6643a4832126d3b61d2f10214160bbbe4df7fbdd0759155b4f3e4b5f803ecf96f8e522c6e74b6d8574f6098dbdd90fcffda7b71c4ef1c5a04a4db3f765e1e37e9962c153223513614c4763c5e1cdb4d5ea4931bd519544089ba84142b2b8c3fa80c498967c5fb6a3e7143ccef5f509b2c53ba41f3f09b5fe010833d9f08a065c41b54b1b8ca9d0085dd0e3abd2f0b2ad1b48dc72891179c0a7103551c5540f9cad979d2f775504937bf55496850906829072eec0e7101541c1711f45f3bcda78bb71e251660cf1e0a97b86f769501d878aa80f275e4c22df1cee2bd2e76769b5fd22c1eb659463c02bc7ec5a2a083c3bb170f09e544cd276da2645c31393c120caa58ecac78800d36dbefbaafd50a60be832b5635305980b2523c635fae20bb71d63bc8a0fe2518547cd519b82ce9c00a23836fc03fb0d722051b78575b7045ab0aea022899b02323f134999700999dd303a032fe9e0c50e1ea9455a41fb06cec357890bd020dde6cedc08540b0ec1277333c75049495fa2dde4b3a5c21ae7b048013e0fd73baa66d284b096029a59a61abb901cdaf142bdfc0c5761640253220da6485012c1500652518ecc9be84c3e315b812e501b4bbd61cf82535816521372fa21ff65786dfeaa000cfab09609790072dff2d5508768516d2eb950d06a975e3ce7d910d61a574f40cc64b554c847a98e147d685a90e1ae2d61a10b44aae545c0ca84189bc2edc7c209e294b4d76d5bf7c7487fa64adb3dd08e22569e1194c0760b177d18bfd156be574cce092332f5471286b941d804bb5c5005381e1e3edd64630f6c311ab95529383cdb8de1fb8d071ac50ddfc1e9b969ec138832b56ef6146ac1918b213433511004e1e70b4797fc926307d3caed3976f52cfb9dbe877ada62a9f3bb2b0bcda7358924fcf9e3da37fee30c375bcc84ef7ebc2f8d205582a70214666073024ff26055c724c0bf6955dae987522a9ba287e322ceca64139db5d9ff9cf3d965607988f6fa2b3172e2574439854b033ad80a5f205c0c1e6e4dc4838b864a9c503b49b8cac1aa6aadde5a7f710ea9f67fbc578afb9fbaf5481cbb0bbf237ef8bd821136dad5abc730675001752a854e68b4cd1e61f66f8616b61608e93e9989bf27697195cee931735b3e27bd1648fb798b54f800b76979d33c36f806113f92fed66a63db8589382b9e2541f168d6b3e23560fa1273bca227653d5ee62ea347b47429d02a66a78f504fd6df892e8334e3c020c7660ba7806ddc0259b334ec165849b12022ec4006cddef362417c2211d25d51768d1eeb389f3b6199b139a98427afdaf4ed3638ad9b9012cdd3c836ee092eb00adb698557a25045c729f0b5b4786073d3795097d37ca2edff3a45ef9c1acd3b79ea65f4f1d897b50fcddcca5690d2c2b2f86f80a1c1c1b20f4e8882bb8f000f981d6662f5e55c37458a43732573b26f7fa99d1005574c5cec3fedc2bab28a59371fd74c5bbc56563f11c66c4e2c8f0aa12aa54c354766ac8d4397b5f425285e0561f99e75fbcc99a75326175498d00960c2e9523cec9b11169526f462c8e8c487305e580b21f3d2fb420639358bcf7424272f03e1ebac4d7fb7158215d5dee6e5a941dff3a393622c9dac888a55e2be2ec7629a09cea1ec310fbab4b8e697fa512a3c2fe42c26fbabadcddb2e2edf8d7c9b11149ce6144e0925ba2451b0ce65413af8e9054a17feb5790ba754e35919c04838b6303fd367d051772ac426255d1368b31068e3cc474925c01a51fb9b575f3d29acd33b880d674c9b208282057ff808b63c34b50f9ff035bede88965ec2ad60000000049454e44ae426082, 'AC', 6);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(16, 'm.rodriguez@mrsservice.com.ar', 'Mariano', 'Rodriguez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010101012c012c0000ffdb0043000503040404030504040405050506070c08070707070f0b0b090c110f1212110f111113161c1713141a1511111821181a1d1d1f1f1f13172224221e241c1e1f1effc0000b0801d601c201011100ffc4001d000100010403010000000000000000000000080206070903040501ffc400521000010303010405050a0c0404050501000100020304051106071221310813415161142242718109153254919293a1b1d118233352566272b2c1d2e1f016245382435563a22544738494344664b3c2c3ffda0008010100003f0098c0961dd7125a7938fd8572a22222222222222222222222222222222222222222222222222222a5eeddc0032e3c82a3ab97fd53f20fb9721008208c82b8c12cc35c72d3c89ecf02b9511111111111111111111111111111111111111111111111111152f76ee001971e4118dddc9272e3ccaa917c20104119055009690d77169e47bbc0ae4444444444444444444444444444444444444444444444444454bddbb80065c790463777249cb8f32aa4445f080410464154025a435dc5a791eef02b911111111111111111111111111111111111111111111111152f76ee001971e4118dddc9272e3ccaa9111117c201041190550096f9ae3969e44f67815c8888888888888888bc7d59a86cfa5b4fd5dfafd5d150dba919bf2cb21e03c00ed2790039a861b50e993a8eb2e12d36cfed94d6ca16921957591896793f5b74f9ad1e072b1abba4feda9cf2eff1681939c0a3840fdd5f3f09fdb57e979ffe1c3fca9f84fedabf4bcfff000e1fe55ebe9ee969b60b655324adb95beed003e7435346c6877fb981aefad4b7e8f9b7bd37b5981d4223f7a75040cde968249038483b5f1bbd21e1cc7d6b3222222222222222222222222a5eec6001971e4118dddc9272e3ccaa911111117c201182320aa012d3bae3969e47bbc0ae444444444444444517bdd17a5ac9765565ab827985343750da88dae218e0e8ddba5c3b70470f5a8108888b247468a4acaddbc68fa7a1a8969e637163cbe37169dd682e70cf716b483eb5b5044444444444444444444454bdd8c0032e3c8231bbb924e5c799552222222222f840230464154025a775c72d3c8f77815c88888888888ba974b850daedf357dc6ae0a3a481a5f2cd33c318c68e6493c0288bb74e97d1d3be7b1ecbe164ce1963ef150cf373ff0049879fed3be4ed59e3a306abafd69b0fd3f7dbad5beaee2f8e48aaa67fc27bd9239b938ed2003ed5e4f4cab37bf5d1e75234341751b23ac07bbab7827eacad652222290fd00ecdef96dd5b5ee66f476db7cd367b9cec35bf695b115093683d27357e87e901a9e869dd0ddf4dd3568a6f209b8757d5b431fd5bc71692e0e3c7232a4cec776b9a376a36af29d3b5fb9591b41a9b7cf86cf09f11e90fd6190b21222222222222222222a5eec70032e3c8231bbb924e5c79955222222222222f840230464154025a775c72d3c8f77815c888888888adada2eb5d3da034c546a1d4b5cda5a38461a39be57f6318df49c56baba40edd353ed5ae6e864924b6e9f89f9a6b6c6fe07b9d21f4ddf50ec58854f8f73a6f22af65579b2b9dbcfb7dd0c8067936560c0f958ef95482da15a997bd0b7db43d9be2aedf3441bde4b0e3ebc2d454f13e09e4864187c6e2c70ee20e0ae2444533bdcd8b30dcd5da808c1cc146d3e1c5e7f82989573c74b493544c7763898e7bcf7003256a1358dce5bceacbbdde776f49595b34ee3de5cf27f8aa74ddf6eda6ef34f78b15c27a0aea6707c5342fdd703fc478153eba2f748cb76d1218b4deaa920b7ea88da031d90d8abb1dacee7f7b7e4522511111111111111152f763000cb8f208c6eee493971e65548888888888888be1008c11905500969dd71cb4f23dde05722222222f135aea5b3e90d315da8efb56da5b7d1466491e799ee6b476b89e007795accdbeed66f9b57d5f25cab9efa7b6404b6df421de6c0cef3def3da7d8b1aa2963ee6f5e4c1ae352d89cfc32ae81950d19e6f8df8fb1e54e73c7815a96db2d98e9edab6a8b3630296e73b1beadf247d455a0888b62bd01acbef6ec1e2ae7b30fb9d7cd38777b06183eb6b964adbdde4583633ab6eb9dd315ae6634f8bc6e0fadcb54278f15f173d2544f4b55154d34af86789c1f1c8c761cd7039041ec2b619d1136ef16d1ad034c6a39991ea9a18810ee42b621e98fd71e90f6f7e242a2222222222222a5eec6001971e4118dddc9272e3ccaa91111111111111117c201182321500969c1396f61eef02b9111117c2400493803995af2e9a7b61935d6b07e93b25513a76cd29612c779b55503839e7bc37881ed3daa3aa22cd3d0aef22cfd21f4fef1c36b84b4673da5ec38fac05b2f5adee9d166f7a7a41dcea1acdc8ae34d055b3c4966eb8fce6958211116d73a3ed98583629a42d65bbae65ae291e318c3a41d6387cae2b1df4f4bd7bd9b04a9a364bb92dcab61a703f39a097387fdab5ce88bd7d297eba698d43437eb2d53e96be8a66cb0c8d38c11d87bc1e447685b45d85ed16dbb4ed9e50ea5a3dc8ea08eaaba9c1c982768f39beaed1e042bf11111111111152f763801971e4118dc71272e3ccaa9111111111111111117c201182321500969c1396f61eef02b91111612e98db4a76cff00651510dba7eaef57a268e8cb4f9d1b48fc6483d4d381e2e0b5aa492492724f35f1115c9b31babac5b44d3d7763f73c96e5048e767186ef8cfd595b718a46cb132561cb5ed0e69ef05424f749ed7147a9b485e411d6d4d1cf4ce1db88ded70fff00695115117a5a6a8bdf3d476db6ef8679555c50ef1e4379e067eb5b7ea2823a6a4829a2686c7146d635a390006005103dd27bd62974969e6bbe13e7ac701e003067e7150b911167ce853b4c7e86da8c565af98b6cd7f73696604f9b14d9fc5c9e1c4ee9f03e0b6388888888888a97bb1c00cb8f208c6e3249cb8f32aa44444444444444444445f0804608c854025a704e5bd87bbc0ae4445ad7e9a7addfac36d770a5866dfb7d90790538072d2e6f191c3d6e27e4583d11114b5d9674c4adb0e92a7b36aed3b35deaa8e21143594f3063a568186f580f6e31c473ee58436f3b56bd6d675736f374899494b4f175345471b8b9b0b339393dae2799f5772c7288b92391f1bdb246e2d7b487348e608ed52f34274d09edda5e1a1d53a5e5b95d29e2118aba7a86b1b390301cf691e69efc65478db4ed26f5b52d6b36a4bd08e1f30454b4b112594f10e4d19e678924f695632222e48a57c52b658dc5af63839ae1cc11c8ada87474d6bfe3ed8fd87504b26fd5983c9eb0ff00d68fcd713ebc03ed59111111111152e763801971e4118dc712724f32aa4444444444444444444444201183c57182587078b7b0f7782e456fed16fd1e96d097cd4529c36df432d47b5ad247d785a90afaa9ebabaa2baa9e649ea2574b2b8fa4e71249f94aeb22222222222222222299fee6fea873a1d4da3e693830c75f4ed2eeff0031e00f634fb54c9444444454bdd8e0065c79046377789392799552222222222222222222222221008c1e2b8c12c383c5bd87bbc160fe9cb7875aba3ddda18de5925c2a20a4691dc5e1ce1ed6b485adb44444444444444444459dba0c5e1d6be90b6aa7ce1b72a6a8a4771fd4df1f5c616c8911111152f763801971e4118ddde24e49e65548888888888888888888888888be1008c1e21461f7439ce9765f63b6b2501f2ddbad630fa7b913c633dfe72810e05ae2d702083820f62a511111111111111111646e8d353252edeb464b1fc2375899ec71dd3f515b524444454b9d8e03893c8235b8e3cc9e65548888888888888888888888888bab73aea4b6dbea2e15d3b29e969a374b34af386b18d1924fb1416db2f4b9d5576bcd450ecfdecb359e371632a9f107d44e01f87c78301ec038f7958275c6d275d6b6a7829f556a5aebac34f2196164ce188dc4632300762f0fcdb9b38e1b5cd1ea130fe6fb579ce05ae2d702083820f62a5111111111111111177acb73afb35da96eb6ba99296ba9256cb04f19c3a378390478acafa6ba4bed8acb5cca89355cb7460765d0d744d91ae1da39023d854dbe8e5b66b46d734e4b34703686f345815d45bf90dcf27b0f6b0f1f57259611152e76380e24f208d6e389e24f32aa444444444444444444444444445837a715d2b2d9d1e6f028de633573c14d2b87fa6e78de1edc616b651540904104823910bd11bb72660e1b5cd1c0f2130fe6fb579ce05ae2d702083820f62a511111111111111111676e83374acb7f481b5d3d36fba2aea79a0a8683c377777813ea2d0b6448a973b1c00cb8f208d6e39f12799552222222222222222222222222222b3f6c5a2a9b685b37bc693a8788cd6c3f89908cf572b4ef31dec700b56dae349df7466a2a9b06a3b74b435d4ee20b5edc078ec734f2734f610bc04550241041208e442f446edcd98386d734703c84c3f9bed5e73816b8b5c0820e083d8a94444444444444445f4024e0712a6af40ed8fdd6d3592ed2751d1be8fada7305aa095a5af735df0a52d3c810303da54c254b9d8e0065c79046b71db9279955222222222222222222222222222222f0356e8fd2daba91b4ba9ac16fbb44dcee794c01e599e7baee6df61566fe0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe641d1f36340823415b411c88749fcc93ec0b63d24bbf3684b63c9f48ba4cfb7cefad3f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f997a1a7f631b2cb0d732bad7a1acf15430e58f7c3d6969ef1be4e0f8859000000006005f1cec70032e3c8235b8edc93ccaa911111111111111111111111111111115a5b52d7fa7b66fa6dba87533ea9942676c1bd4f0195c1ce048c81c8703c5636b3f4abd91dd6eb4b6ca5adbb79455ccc862dfa0706ef38803273c064acec8846460aa0799c0fc1ec3dcab44444444444458ff6bbb5cd1fb2c65b9fab2a2ae31713208053d3994f99bb9ce0f0f8415b7a0fa486cd35b6ada0d2f60a8bacb72ae739b0b64a22c6f9ad2e3924f0e0d2b322a5cec701c5c79046b71db9279955222222222222222222222222222222222c27d36ad86e5d1d6fe58cde7d23e0a96f806cadde3f3495adfb3d4ba8eef4756c76eba19d9203dd8702b70368ac65c2d7475f17e4ea6064cdf539a08fb576d108c8c1546770e0fc1ec3dcab444444444445063dd21ba9975c699b3b5e0b69adef9dc33c9cf908fb1a1597d032d82e1d20a8ea4b7228282a2a73dc7019ff00f6b632e763801971e411adc7893ccaa91111111111111111111111111111111115a3b61b2ff88b659a9ec8065d576c9e36f0e4edc383ebcad4b1c8e0460ada9746cbeff88b61ba4ee45c1d20b7b20938f2747e663e46859151108c8c1540f30e0fc1ec3dcab44444444445ad3e9b37b17ae9097b646ecc76f6454607716306f7d64aca7ee6fd89e6f5aa351c911dd653c549038f692e2e7fb38354d76b71e24f32aa44444444444444444444444444444444445448c6c91ba378cb5c0823bc15a98db1d81fa5b6a7a96c2f6ee8a4b8cad600386e171737ea214c9f73b7528b86cc6eba6a47832daab8c8c6e78f5728ce7d5bc1ca50a222119182a81e6703f07b0f72ad11111111752e9590dbadb5570a8735b0d342e95e49c001a093f62d4c6abb81d45aaaefaa2e0e7f575d5b2ced07839fbce2434780181953c7a08595f41b141779a2eaa5bbd6c93b5a06008d9e6331e1c0a902888888888888888888888888888888888888b5fdee83e9575a36b349a8e28c8a7bd51b4b88181d6c7e6b87af1ba7dabc7e829ac069adb6c16aa8977292fb03a8dd9381d68f3a327da0b7fdcb6328888878f02a968dde19c8ec5522222222c31d31f5845a4b61d7519ff3377736dd0b03b74bb7f3bfc7b30c0ee3ea5add68a9bbdce0a6899992691b0c31307019380005b67d9be9e8b49e82b169b89ad68b7d0c50bb1c8bc346f1f6bb255c4888888888888888888888888888888888888b00f4e8d1aed4fb149ee94d0f5959609856b70327aaf8328f560871fd85af3b25ceaacf79a2bb50cae8eaa8e764f0bc736bdae0e07e50b6cfb34d5147ad74259b5450b9a62b852b257341cee3f187b7d8e047b15c68888888888888a00fba05ae9b7fda4d1e91a29b7e92c111ebb0781a89305df234347af2ad1e863a30eaedba5ae59a2dfa1b30371a82470cb3f263daf2d38ee056cb11111111111111111111111111111111111111752eb454d73b6d4dbab226cb4d5313a1958e190e6b8608f90ad506d7347d5683da2de74b55077f92a97085e47c388f163bc72d23db95273dcf2da3869b86cdae3381bdbd5b6cde3dbff1183ea77caa672222222222222b4b6b9ace8b67fb3dbbeaaae7371470130b09fca4a783183d6e216a8eff0074adbe5eab6f37198cb595b3be799e7b5ce393f6a9f5d02b411d33b2c935356c3b95fa86412b778608a7664463da779ded523d11111171c92c51e3ac91adcf2c9c2ac104020e41e4bea2e27cf04670f9a369ee2e0172a2222222222222222222222222a2525b1b9c39804850d7a636969b5269b975d474d13ea6db0361ab7319e718cbbcd793e04e3da144cd1d7fb9696d516dd456998c55d6fa86cf13bbc83c41f02320f815b53d936b8b5ed0f42dbb555a9edeaeaa31d7459c98251f0e33e20fd583daaed4456e57dfe48f51c16a8a300195ad7b8f6e7b95c6adaa4bf4d57aa3dee6b1ac8185ed77697100ab9511111404e9d9b551aaf5747a1acb51bf69b2484d53d872d9aab91f5860e1eb2561dd86e81adda3ed32d5a629dae6c12c9d6d64b8e1140de2f77c9c07890b6875fd569ed2ec86dd0323868e1643047d8d6801a07b02a74655d4575a5f3d4bf7e4333867c3017b88889945666d25ce6ba88b5c4677b91f52b9add2b23b3d34b23dac60a7639ce71c003747125602db1f4a8d2da4e49ad9a4a8dfa9ee8cf34cb192da48ddfb7cdffede1e2a2a6d03a456d7753ccf6546a19ecd4cfce29adcdea001fb43cef6e562fafbedeae1389ebaf170ab97783b7e6a97bdd91c8e49e6a6a7445e918cbfb297426bbad6b6ecd023b7dc257605501ca379fcfee3dbeb52c511111111111111111111117997bbcd25a98d3312e91df0583995e07f8cdfbd9f223b9deae0b35ce3bb50be7898e6004b483df858da90d0cd6db9db2e5442b692e14aea69613c9cd77020fb1406dabe936e85d6b5961b85b246d3876fd24fc4759113e69f5f61f10b22f44bda74bb35d6d1db2aea9d3695be1dd973ff0097940e1263ea3e1ea53af48ea417e9098db1988c42563d8ec87038c107bb8af6ee550ea5b7d454b4073a28dcf00f6e06579161becd71b7d6543a26b5d00cb40ede04ff000565d45ce796fadb91871307b5c198ed185ed9d5b753ca847cc2bc4a2b95553dedd5f1420cee738ee6e93cf39e0af5d2d76aeb93a71594e2211805be6919f9579d79d5551e58ea3b54024703bbbfba5c49f001751ba96fb43235d71a4cc6e3e9c4584fa8abc2d95d05c28995501f31c3883cda7b4156b5e35555beb5d4768843b75dbbbfbbbce71f00b17edf36b973d13a36b6d4e9cc57fae8bf12e2cdd75342410f971dfd8df1f5281adafacad9e4f7ae81b8de25cf733ac7b89ed738f69536ba24688d41a26c115daef6a64775bdee176fc1bae8a0e6d6e472cfc23ecee59bb5fcb5e182289a4d2160321dde00e7bd78563a8bec744596d639d0ef9ce1b9f3b033fc15db59769ad9a721aaab6e6a9e37774f0f3b8ab6db75d4956d13441fb8ee5bace0af2d3efa97da29df599ebc83bf91c7e11c7d497eb836db6d92a9c32479ad1de4f2567d33f51deb7aa2191cd8f3818380b9e86eb79b4dc594d708df2b1c7963271de17cdac55535150535755ccc829e1648f92479c06b400492a1ef484dba5d757c11d8ecd5535bb4853d3461fd592d96e2edd1c1c79867eafcab035154cef2fba564862a561fc5c4de1be7b1a3c178d72ac96baadf5131e2e3c00e40772eaa97dd107a3a3eba6a2da06bba37329185b35aedd20c1948e2d9641f9bda076f3e4a6c818181c02fa888888888888888888888b1feb0fc5eac8e5aa6b9d4f98ce3bda3191f6ab9e9ab2c3511b58c34f870c00400bd2a2829e9e1dca6635b193bd86f2e2ac6d9e471c9779c48c6bb101232391de0adee949b2ba1da2ece6b5d053c42f76d8249e825c60b88193193dc71f2ad7d692a7a8a79a5a3ac89f14d495ad0e8de3058edd787023d8b3b7430db6c5a72e4ed2babeaf76d4620ca4ad90fff004c4bda031e7f332781ecf529bf78919369fad9237b5ec752c8e6b9a72082d3820ab7f669c61af69e232cff00fa5d1bdb1acd7d0343406f5f070c70f455f9d4c5fe9b7e45625b1a1bb427b481bbd7cbc3fdae57c4e0369e52d1ba770f2f52c7ba36be8add709a6ae76ee63dd69ddc9ce78af6f505fecb5d68a8a66cae7c8e6f9998cfc2ec5f3403ddef256b778f9af247879ab13eb9dabd9f65b64b95c676c7597934dfe4a8b7bce738b80de777301e67b790506ee7a96efacf54ddaefa86e0ea9b95d2370323dd81bd905ad1d81a00c01d8b2cf44dd9ff00bf17ef7df53db267586dd54d95ac3e6f94cede4cc1f84c1c09f914f4b5ea4b5d648d81af30bcf06b5e31ecee5cdac4674d567ecb7f782f3f66e7ff0004987ff92efdd6aa76891be4b6d36e30b889bb07815ea694696e9ea36b81690ce20facae4bd5da9ed5146fa80e224240c05e16b6aa657697a5aa8b219254348cfecb97ada331fe1aa3c0ec77ef15ea3e28def6bdcc6b9cde448e4a15f4feda59adaba5d0965a8229e9247fbe6f61f87261a445ea1ccf8fa94537d69af9e861ac71652c4d645c3b000012abd4ce9857750e68653c631035bf0777b0fb5790a5e7443e8e6eb89a4d7dafa84f910c4b6db6ccdfcb76896407d1ee6f6f33c14da6b5ad686b400d030001c005522222222222222222222222e9dcadf47708fabaa8daf2391ed0adeb9e92a3653cb353ccf8dcc6970c9e1c151b3cad9e5f29a595c5ec8c02d27b39f05d1d9e79b7ca81ff00448ffb82bcef43367ad1df4f27ee9514f6afb1b7ea386b756e96a506eb03a392b699831e52c01c379a3b5e3eb0a1c5a60904f71a2734b27742e6063860ef070247af82cf5d1c7a406a1d1d413e93d56ca9b969d6d2c82191c099a8f872693f099fabd9d9dca5e6c3b5159b52daaaae363b8c15b4afdc3bd1bb25a78f070e60f815d9d5cef26d5f0d4bc1dc0e8dfeb031f72be69aa60a88daf86563c386460ab0e699b41aedd3cfe6b04ee24f838119fad5f7d6c55303c432b24cb4fc17679858f74bd3d04b78969ae4d660821a1e71e7655d370b5e9ab7c066aca782260fce71e3f5ac2fb60dbfe92d1303acba26282ef75ab0e699a176f535390d3f09d9f39dfaa3daa0adc6f574d415d7abb5e2ae4acac9d9bcf9243fae380ee03b00e4af0e8efb21baed4b5379ce928b4fd0b83ee570c603073dc69ed79fab9ad90e9cb369ab5e9fa3b35aa1a514347136285b90e21a3bcf324f6956eeb482db4f5708b7eeb65e3d6358720777b55d572866a9d29246f04caea7048f1183fc15bda16ef4b4314f4955208b79fbed71e5c80c7d4af663a29e26c8ddd7b1c32d3cd705757525bd8c35323626b8e1aad0d7175a2afa6a78e9661239af24e3b173dce8e67681a56ee1de88b6423c38fdeb9f47dea862b4c74b5133629222479dda324ff15e3ed4369743a474c5c6ef0b3ca052d3b9c31e93f9300efc9c2d6cebc9a5aa69aca8a87d45454564d34d238e497bf0e77d6575e58e927a3a4b6b98d8a47d33248a4ef791c41f5aeb5381570bad35be654c44881eeeff00cd2a45f427d89da75757546b5d5223a9a4b5d57534f6f737cd926001de93bda32303b4f353b9ad0d686b406b40c00070015488888888888888888888888ad4bedbafcfb9c95747379871bad0ec602f3dd43aa2b1a619647861e7938571e99b332d14ce05dbf349c5eefe0bcdd2f63acb75da5a89cb3ab7308183e20ab8ebe274d433c2df85246e68f59185e268fb354da5d51e50e61eb3771bbe1951f7a4cf46666a9aea9d63a0faba3bdb8996a68fe0c7527b5cdfcd7fd45435bbdaaf56eada8b5de2abc8aa21718e686605af69ed0415dcd1fad2f1a027755e91bfd652573ded739f11c30819e0e69e0e1e05481d23d2d61bad24345b43b0e2a63186dc6d9c37bf6a271fb0fa82ccdb39db56c9a6aa35035e50d38733744558c740e0491f9dc15ed76d4bb39d40c1554fad2c6d9070eb1b5b1f1f582579543b4ad98e906d43ee3b44b13f7c0c3193873b8679004e5628da3f493d9636a647e9c92e170ab39cbba831405dfb47cef6805479da16d7f50eaf6c94f59a8db416c3ce8adb13da641dce7bb04fd9e0b1dc176845ce9b11982860de0d60f38f1046f1ef25665e8f3b03b9ed22696e2f9eae8b4dc84365ac7d3756651bc096c592778f8e303ea53c34e689d3fa6b47c3a56c144db75b616e1ad8be138f6b9c7d224f124ae8cba238e62ad047eb330bbf68d2747473367a890d43da720118683fc55c9818c638772b7ee1a4add553ba5639f0971c90de4bdaa281b4d49153b497363686827b70ba97cb441768a38e77b9a23248ddf15d0a3d256da79848e2f9707387725ef398c746632d05846318e1856fd6e91b7cf217c65d164f21c947ee9cb353691d9350d251f9f5573b8b2325fd8c635cf247b4354218ae54efa114f5b0be522473f781c712b82e95acaa961742c31b628dac6f1e3c1760dd29e711beae97ac9d800eb03b04e3929e5d00eb5b5fb2cbaced8bab3ef9969f1c31bc548f44445e26a1d53a7b4ed5dbe96f978a4b7cf719fa8a364d206999f8e43fbee5eda222222222222222222f27516a2b0e9da2756dfaf1436ca768c97d4ced8c63da78ac2facba59ec9ac2e7c3415770bf4ed2462869fcccfedbcb411eacac51a87a6e5c5ee7374f687a5847a325755b9ff2b58063e5572f460e91babb697b583a7351d3da2928e5a19658194b139a4cad2d2065ce24f9bbdf2296088b18eda7629a2f6a7427df9a334975637105ca9806cccee0eec7b7c0fd4a116d77a356d1b41cb2d553d03aff0067664b6b68185ce6b7f5e3f84dfac78ac2b2c6f8a4747231cd7b4e1cd70c10550888aead07b3fd61ae6e2da2d2d60adb8bc9c3a46478899e2e79f340f5952ff61fd10ad166960bced1aa62bbd6370f65b6027c9987f5ddce4f5701eb529e8e9a9e8e963a5a482382089a191c51b435ac039000720bb08b1ef486d6b59b3ed91deb54db9d08aea56c6da6eb5bbcd2f7bdad008ede6a28593a6b6b9a77b45df4c58aba31cfa93242f3edde70fa9649d2bd34f45d6bd916a2d3776b4b9c78c90b9b511b7d7f05df2059ab436d8f66bacc31b61d5d6e9677f2a79a4ea65f98fc157e8208041041e442fa88a1ff00ba56e3ef368c6e4e0d455123fdb1a84e88a7bfb9d55103f65779a66cd1ba68ee85cf8c386f34160c123b8e0a942888ac2db56d3f4f6cb749c97abdca24a8782da2a363bf19532638003b0779ec5ad5da9ed0b51ed1757cfa92ff0056e74ce38a7858e223a666783183b31dfcc9e2a5bf42fdbdd56a77d3ece7574cf9eed1c47decac392ea8631a498de7f39ad04877681de38cb044444444444444458ff6abb5ed09b34a2326a3bcc42af7731d0539125449ea60e43c4e02889b53e981acefce9a8b45d2c5a7280e5ad9dc04b54e1dfbc7cd6fb06477951db505faf5a82b9f5b7bbad65c6a5e4b9d254cce79c9e7cf92f2d15cdb2fd5757a1b5fd9b55d102e92dd52d95ccce3ac6727b3dad247b56d6b48dfed7aab4dd06a2b3d4b6a282ba16cd0bc1ec3d87b883c08ef0bd8444561ebad916ce75b073b50e93b7cf3b863ca238faa947fbdb82b0eea1e861b3dac95efb45f2f76b278b63df64cc1f386f7d6ad87f41fa4df3b9b409c373c01b70271f3d77ed1d08f4ec6f06ebadae950ded14f4cc8b3f3b7964ad1bd17b643a76464efb0c9779d9e9dc6632b49efdce0dfa9660b55b682d546ca3b6d153d1d3b061b141106347b02ee2222853ee826d261b855d0ecd2cf375c692515573319cfe33188e2e1da012e23c4772880f6b98e2c7b4b5c0e0823041542a9ae731c1cd25ae072083c42ca5b33dbeed37423e38edda826aea061e3455e4cd111dc33c5bec214b3d9074b5d11aa9f15bf55c474c5cdf86892476fd2c87c1fcd9ea770f1522e96782aa9d9514d34734320de6491b839ae1de08e6b9945af746ad2faad9958af11b0bbc86e9d5bc81f05b24678fcad68f6a81888af1d946bfd43b36d5b4fa8b4ed575723086cf0389eaaa23cf163c768f1e63985b2ad8b6d3b4eed4b49457bb1ca193b30dada27b875b4d2638b4f78ee7768f915fa8ac2db56d434f6cb749c97abd4a24a8782da3a363bf1953276003b0779ec5ad3daaebfd45b47d593ea1d43526495e4b6085a7f174f1e783183b07daad059fba065a1f72e9034558d1e6db286a2a5c7bb2deac7ff00b16c69111111111111174aef72a0b45b67b95d2b20a2a3a7617cd3ccf0c631a3b492a19edffa5c5555bea2c1b302ea6a6196497891bf8c93ff0049a7e08fd63c7c0289773aeadb9d74d5d71ab9eaeaa67174b34cf2f7bcf7927895d4444459f3a2b6df2af65d70f78ef7d6d6696ab943a46378be8de79c8c1da3bdbdbd9c56c234d5f2d1a92cd4f79b1dc69ee14150d0f8a681c1cd23f81f03c42f511152e76380e2e28d6e3c49e6554888888a3b74a0e9156ad9f5bea34e695a986bf55c837096f9d1d083e93cf22fee6fb4f8ebeee35d5970b84f70aea996a2aea2432cd348ecb9ef272493df95d80e6dc1818f21b58d1863cf0128ee3e3dc7fb1e7bdae63cb1ed2d734e082304154222cafb14dbaeb9d9855c705bab0dc6cc5c3acb6d538ba323f50f361f57c8b643b3ebfcbaa7475b350cb69adb4baba112f925580258f39e78ec3cc7811c02c57d35efda568362376b36a2ac0dadb9340b653b38c924cc70735d8ec682064fdf85adb444575eccb5dea2d9e6a8875069bad753d44671246ee31ceced63dbda0fd4b39fe1a5b46ff90e9ffa393f993f0d2da2ff00c8b4f7d1c9fccb07ed435fea3da36a99b50ea4aceba7779b0c4de1140cec631bd83eded568a29c7ee74e8c7d0e97bdeb7aa8b0eb94a2929091ff000e3c9711eb71c7fb54b544444444444456d6d175ae9ed01a62a350ea5ae6d2d1c230d1cdf2bfb18c6fa4e2b5d1d2076e5a9b6af757452c925bb4fc2fcd2db637f9be0e90fa4efa8762c468888888afed91ed635a6cc2e9e55a6ae4e14d23819e866f3e09bd6dec3e23054cfd92f4b2d05aa990d16a871d2f73760133bb7a95e7c24f47fdd8f5a9036eaea2b8d247574159055d3c837992c3207b5c3bc11c173b9d83ba38b8afad6ee8ef2799ef55222222c7db47db16cf367f4ef3a8b51d336a9a3228a9dc25a87786e3797ace078a883b6de967aa7554735a34543269cb5bf2d7546f66aa56fed0e0c07c38f8a8d72cb24d2ba595ee7c8f25ce738e4b89e6495c4be8241c8e057a4d736e0c0c9086d5b4618f3c04a3b8f8f71fec79ef6b98f2c7b4b5cd38208c10550be8049c019254cce887d1cb1e49b40da0d171e12db2d9337976896507e50d3eb2a436dcb6ada77653a49f75ba3c4d5b282ca0a063b0fa8781f534769ecf5ad6a6d335c6a0da1eaaa8d45a8eaccd5329c4718e11c2cec63076342b5d111111115d1b32d1976d7fadadda5ecf1174f59280f7e3cd8631c5f23bb80192b6aba1f4e5bb48e92b669bb547b9476fa76c31f7bb038b8f89393ed5eda22222222222b7b681abac7a174a56ea5d4354da6a1a56649f4a477a2c68ed713c005ad0dbbed66ffb57d54eb9dcde69edd065b4140d7659033bcf7bcf69fe0b1ba2222222222bc742eb0d55a364172b1ea3b8daa30ecb6282721b33877b3e091e247f4cbfa4fa61ed32d5865de92d37b8876cb118a43eb734ff000593ec3d36ec3206b2f7a2ebe9dde93e9aa5af6fc8402af1a0e985b249d83af17ea576393a8811f2872f5474add8c900fbf95a3ff64f5d6ace96db1ca71e65c2eb51c3388a84fc9c4856e5e7a68ecfa981f7aec17eaf3d81ed6439facac79a9fa6c6a19c3e3d3ba46df4608f365ab99d2b9a7d430161cd6dd2036b1ab44915c3565552533f9d3d07f9767fdbe77d6b184b23e591d24af73dee39739c7249f12b8d1117d048391c0af49ae65c182390b5956d1863cf0128ee3e3dc7fb1e7bd8f6c863735c1e0e0b48e20f72995d10fa3963c93681b40a2e3c25b65b266f2ed12ca0fca1a7d65487db9ed5b4feca749baeb747b66ae941650d0b1d87d43ff834769ec5ad5da66b8d41b42d5953a8b51d599eaa6388e307f17033b18c1d8d1fd55aa88888888bd7d2b60bbea7bed358ec3433575c2a9fb914313724f89ee03993d8b639d1936296ed9369c3354ba3abd495ec1e5d540708c73ea99faa0f33da7d8b32a22222222222ebd65553d151cd57573320a7818649647bb0d6340c924f60016b63a54ed96af6a7ac9d4f412be3d336d7b99410e71d69e46670ef3d9dc161644444444445e852c0c6c7e57560f55e8339194fddde7fb1d7aba892a65eb1f81d8d68e01a3b000bae8888888888888aa19c8c673d98534ba27747c3336835fed0adc3ae6e24b750cade247a32ccd3dbdc3e5ecc480db9ed5b4feca34a3aeb747b66ad9416d0d0b1d87d43ff008347695ad5da66b8d41b42d5953a8b515599aa66388e31f93823ec63076347f556aa2222efdc2d574b736175c2dd5746da86092133c0e609187939b91c47885d045cf4b4f3d54eca7a68249e579c3191b0b9ce3dc00e6b37ec9ba306d1b5ac91555ca89da6ed4ec13515ec225737f562f859f5e14dcd8cec7b476caed460b0d1f5d7095a054dc6700cf37867d16fea8fad6464444444444445117a7bed6df6eb7b766362a9dda9ac6096ef231dc5911e2d87fddccf860769508511111111117a14b031b1f95d58222f419c8ca7eeef3fd8ebd5d4495326fbf1dcd68e01a3b000bae8888888888888be8049c0192a667444e8e58f24da06d068b8f096d96c99bcbb44b283f2869f59521f6e7b56d3db28d26fbadd5c27ad981650d0b1d87d43f1f5347695ae0da1eb5bd6d33524f7bd4557bd717922068388991e722268f440ec3dbdbdeacd7b5cc7963da5ae69c1046082a844452c7a2274727dfdf4baef5e51b9b6969125bedd2b706a88e52483fd3ee1e97ab9cd6ba596cf75a2f21b9daa8ab6980ddea6781af663bb046158177d80ec76e6f73eab415a9ae773f270f807b0464617568ba386c56924eb22d0946e77fd5a89a41f239e42be74d68ad23a6411a7f4cda2d848c175352318e3eb2064ab8511111111111115b7b49d596fd11a1eedaa6e4f020b7d3ba40d27e1bf93583c4b881ed5aa3d617fb86a9d4f70d457698cb5b70a874f2b8f793c87801803d4bc74444444445e852c0c6c7e57560f55e8339194fddde7fb1d7aba892a65df791dcd68e01a3b000bae8888888888888be8049c019254cce887d1cb1e49b40da0d171e12db2d9337976896507e50d3eb2a43edcb6ada7b653a4dd74ba3db3574a0b686818ec3ea1ff00c1a3b4f62d6aed2f5c6a1da26aba9d47a8eb0cf5331c4718e11c0cec63076347f52ad60707217a4d732e3188e42055b4618f3c0483f34f8f71fec79ef6b98f2c7b4b5cd38208c105508a58f444e8e6fbfc94baef5e51b996969125badd2b706a88e52483fd3ee1e97ab9cdd33d253cf4f44668217c8d220877834b83471dd6f68031cb92ed22222222222222222286dee8aebb708ecdb3ca29c80eff00c42e01a79f31130ffdcec7eca860888888888bbf4b031b18aaab69eabd0672329fbbbcff0063af5551254cbd64847735a38068ee0b8111111111111117d009380324a999d10fa3963c935fed028b8f096d96c99bcbb44b283f286fb4a90db73dab69dd94e937dd2e9209eba505b416f63807d43ff83476bbb3d6b5a9b4cd73a83687aaea3516a3ab3354ca711c6383216763183b1a15ae8be838390bd26b9970608e421b54d1863cf0120fcd3e3dc7fb1e7bd8e8dee63da5ae69c10471054aee887d1c9f7e92975debca3732d2d224b75ba56e0d59ec9241fe9f70f4bd5ce586d6f689a6f65da3a4be5f266b18c6f5749491e04950fc706307da7900b5fb57b77d5975db95af69174a83fe42a8753451bc88a1a6270f89beb69393da78ad975aabe9ae96ca5b9514825a6ab8593c2f1c9cc70041f90aeda222222222222222a247b638dd23c86b1a09713d802d52ede75649ad76b7a8b50b9ee7453563e3a704e776261dd60f5602b111111111177e9606362157560f55e8339194fddde7fb1c15751254ca647e3b9ad1c0347600175d11111111111117d009380324a999d10fa3963c935fed028b8f096d96c99bed12ca0fca1bed2a436dcf6ada77653a49f74ba4827ae972ca0a063b0fa87ff068ed7767ad6b57697ae7506d0b55d46a2d455666a994e238c70642cec63076342b591117d1c0e42971d13fa3ebb5236875e6d0681c2dd110fa0a39060d601f064947e60ecefede0a54ed6b689a6f65da3e4bedf266b18c1d5d25247812543f1c18c1fc7900b5abb61da4ea2da7eae9afd7f9ce325b4b48c27aaa68f3c18d1f69e64ab1d6c7fa0deaf76a6d87d250d44dd655d9277513f2727abf851e7d871ec59e5111111111111111585d20f511d2db19d537a649d5cd15be46427fea3c6e37eb72d52222222222efd2c11b63155560f55e847c8ca7eeef3fd8e0aba892a65323f1dcd68e01a3b000bae8888888888888be8049c019254cce887d1c71e49aff0068145c784b6cb64cde5da25941f9437da5486db9ed5b4eeca7493ee975904d5b282ca0a063b12543ff0083476bbb3d6b5abb4cd73a83685aaea3516a2ab33d4cc711c60fe2e16763183b0056b22222965d10fa39beff002536bcd7946596969125bedf2b706a88e523c7fa7dc3d2f573961b5ada269bd97e8f92f97d95ac635bd5d251c7812543f1c2360fe3c805adfdabed12f7b57d4d25defb388a7692da1a6638f530c59c88c03c8feb769e7e1603d8e8dee63da5ae69c104710550a56fb9cba89d49af2fda62490f575f422a636766fc4ec13f23bea53ad111111111111111472f7416f06dfb0d8adcd760dcee90c2403cdad0e93e4cb02d7a22222222efd2d3c6c84555583d5fa0ce4643f778ff0063af5551254ca64908ee00700d1dc17022222222222222fa012400324a999d10fa3963c93681b41a2e3c25b65b266f2ed12ca0fca1a7d65486db9ed574eeca7493ae974789aba50594140c761f50f1f63476bbb3d6b5abb4cd71a83685aaea3516a2ab3354ca711c60fe2e06763183b1a15ac8888a58f443e8e6fbf494daf35e51b996969125bedf2b706acf648f1fe9f70f4bd5ce58ed6b689a6f65da3e4be5f666b18c6ee525247812543f1c18c1f69e402d6aed87693a8b6a1ab66bf5fe73ba32da4a4613d553479e0d68fb4f32559038715e931ccb8462391c1b54d1863cf0120fcd3e3dc7fb1e7bd8e8dee63da5ae69c1047105659e8817775a3a43696937cb63a999f4b27887b1c00f9dbab678888888888888888a20fba535ae658b46dbf7b84b5353316f7ee35833ff007a84a888888bbf4b4f1c708aaab07aaf419c8c87eef1fec75eaaa24a994c9211dc00e01a3b82e0444444444444445327a1c74788a7868b689ae2903d8ec4d6ab74ade047a33480fcad1ed522b6e5b56d3db29d24fbadd1e26ad94165050b1d87d43c0fa9a3b4f67ad6b57699ae3506d0b55d46a2d475666a994e238c1f3216763183b1a15ac8888a58f443e8e6ebf3e9b5e6bca3732d2d224b75be56e0d51ec91e3fd3ee1e97ab9cb1daded134decbb474b7cbe4cd6318ddca4a48f024a87e383183ed3c805ad5db0ed2750ed4356cd7ebfce7746594948c27aaa68f3c1ad1f69e64ab1d17d1c38af498e65c2311c8e0daa68c31e780907e69f1ee3fd8f6f6475125b76b3a56a5c0b1d05ea94b81e18c4adc8f932b6d4388ca222222222222222867ee987ff62ffefbff00f050cd1111177e969e38e2155560f57ff0e3e4643f778aebd5d449533192423b801c034770f05c088888888888888b2d7452d9ec5b45dafdbadd5d1192d5420d6d70c70731846187f69d81eacad886d4b595a7673b3eb86a6b88020a18836185bc3ad90f0646df59c0f52d5fed2f5cea0da16acaad47a8aaccf5331c47183e6411e783183b00fea9a53679adf55d2baab4ee95bb5ca06e733414ce31fa83b913e0bc6be59eed63b83edf7ab6565baad9f0a1aa85d1bc7b1c32bce4452c7a21f47375fdf4daf35e5139b6969125badf2b706a8f3123c7fa7dc3d2f573961b5bda269bd9768e96fb7c99ac6306e52524781254498e0c60fb4f2016b5b6c3b48d43b50d5d35feff0039038b6929184f554d1e7835a3ed3cc9563a2222bab43be3aed5d636ccf0caa657c1b921e5201237cd3e3dc7fb1b6c8ff26df5055222222222222222877ee9652bdd6ed155833b91cb5719eecb84447ee950ad111177a969e38e1155560f57ff000e3e4643f778ae0aaa892a6532484770038068ee0b811111111111111114d3f735ed51790eafbdb99f8eeb29e95aefd5c39c47ca02e6f748ef9510d974a69d639cd86aa69aae403938c61ad00fcfca8d9d1c744d2ed076c363d337027c8a57ba6aa68382f8a3697b9a0f6640c2da3daadf456ab7416eb6d24349474ec11c30c4c0d631a0600002c57d2b367367d79b2abb4d3d2462ef6ca67d5d055067e31ae60de2ccf3dd700411edec5ac6452c7a21f47275f9f4baef5e5196da5a4496eb74adc1ab3d92483fd3ee1e97ab9cb1daded134decbb48497cbeccd631a3aba4a48f024a87e383183ed3c805ad5db06d27516d4356cd7ebfce43725b4948c27aaa68f3c1ad1f69e64ab1d111115cbb2da535db4cd2f461bbdd7dde963c679e65685b6e68ea801e87eeff45ca88888888888888a367ba1766757ec5692e91b726d9748a47bb1c98f6b99f6b9ab5f4888bbd4b4f1c710aaab1f8bf423e4643f778ae0aaa892a6532487c001c0347705c08888888888888888a65fb9b37985aed5ba7deefc6bfa8ac6027b06f30e3e705ec7ba3da6e7abd27a7354431b9f1dbea64a69881f01b280413fee601ed515361bae1db3ada859b5618dd2c14b296d4c6df84e85e0b5e078e095b43d1baaf4feb0b2c379d3b75a6b851ccd0e0e89e096e7b1c39b4f81587fa5ced86c1a3b67b74d374571a7aad477481d4d1d3452073a9dae18748fc7c1c0ce01e24e16b914b1e889d1c9f7f7d2ebbd7946e6da5a4496fb74adc1aa2394920ff4fb87a5eae72c76b7b44d37b2ed1f25f2fb3358c68dca4a48f024a87e383183ed3c805ad5db0ed27516d4356cd7ebfce77465b4948c27aaa68f3c1ad1f69e64ab1d111111656e8996575f3a40e95a70c2e8e9ea8d5c87f3446d2e07e706fcab684b8ff27fb1fbbfd17222222222222222b336d7a586b4d95ea2d361a0cb5744f10646712b46f30fce016a82a21929e6920998639637163da79b5c0e082b85177a969e38e1155563f17ff0e3e4643f778ae0aaa892a65324878f200700d1dc170222222222222222222c91d1cf680766db57b56a098bbdef2e34d5ed1db0bf838e3bc703ec5b2cd5563b0ed0b435559ebbabadb45de946ec919072d70cb5ed3de381056b4f6ddb21d55b2dd412d1dda9249edaf79f23b8c6d26299b9e193e8bbbc156151dc2be8b3e455b534dbdc0f552b999f90ae173a5a8972e2f96471c6492e738a965d13fa35d45d2aa9f5aed0edaf82dd111250dae76e1d50ee61f2b4f260ec69e7dbc39cabdad6d134decbb47c97cbeccd6318ddca4a48f024a87e383183ed3c805ad5db0ed27516d3f574d7ebfce71c5b4948c27aaa68f3c18d1f69e64ab1d11111114b9f739348bea3515fb5acf11eaa9201434cf3daf79de7e3d4037e5537d171fe4ff63f77fa2e444444444444445ae6e9b1b3297446d3a6bf50d396d92fef75442e6b7cd8a6ff00891f871f38781f0580177a9a9e38e1155563f17ff0e3ed90fdde2b82aaa24a994c921e3c801c0347705c08888888888888888888a4c7455e9212e828e1d21ac4cd55a6cbb14d52df3a4a1c9e58f4a3f0e63b3b94e2a1acd2fae74df5d4b3db6fd68aa671c6ecd13c1ec23f8158e2f9d19362f76aa754bf48b692471c9149552c2cf506b5dba3d817bfa1f625b2ed1954dabb0e8fa18ea9872ca89f7a791a7c1d21247b151b64db268bd985aa49af3708ea2e5bbf88b6d3bc3a790f6647a23c4e16ba36c3b49d45b4fd5d35faff0039c716d252309eaa9a3cf06347da7992ac744444445dcb4d0565d6e74b6cb7c0fa8abaa95b0c113065cf7b8e001ed2b69db05d030ecdb6636bd32cdd754b19d756c8df4e77f179f50e0078057f222e3fc9fec7eeff0045c8888888888888ad1dac683b26d1f45d7697be4398a76ef4333479f4f28f83237c47d63216b4b69fb37be6ccb53d45a354d310d8dc7c92467c0ac67639a7bbbfb472564d5544951319243c790038068ee1e0b811111111111111111111115c1a3f58ea9d2157e57a6afd5f6a94f334f316877ac722b2ad074addb452d3885d7ea3a9dde4e9a8222ef940195e46a8e921b61d434eea7a8d5b351c2e182da18994f91dd96807eb58a6b6aaa6b6a5f5559512d44f21cbe495e5ce71f12575d11111117244c7cb23638d8e7bdc70d6b46493dc14e7e867b01974c887681aca9836f12b336da391bc691ae1f947773c8e43b07ad4ad44445c5f93fd8fddfe8b951111111111150f71ceeb78b8fd5e2ad8da2e81d2fb40d3b258f53dba3ab81de7472729617fe7b1dcda541bdb4f455d6ba3e59ae3a59926a5b28cb8752dff00350b7b9d1fa5eb6fc8147caaa79e9677d3d4c32432b0e1cc91a5ae69f1057022222222222222222222222222222222be366bb2bd75b43ad6d3e98b0d4d4425c03eae46f574f1f8b9e787b064a9bdd1ff00a32e99d9dc905f2fef8afda8da039b2399fe5e99dff4da799fd63c7b805209111111717e4bff004ff77fa2e5444444444543dc73bade2e3f578afac6868ef27993daaa4565ebcd96e82d70c77f89b4cd056cceff00cc08f7261e3bedc1581f58742cd235ae7cba6352dcad2e27cd8aa182a236fd8efad62bd43d0d369542e73ad373b1dda31c875ae8643ec70c7fdcac4bbf46edb3db77bacd13553b47a54d3c52e7d8d712ad9add92ed3a889f29d01a92319c64dba423e5030bc5a9d1fab29b1e51a6af116796f51c833f52e94d66bbc3218e5b55746f1cdaea7703f62e3f7aee7ff2eacfa177dca8f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb954db75c1df0282a9dea85c7f82fbef5dcff00e5d59f42efb976e1d35a8a62ceaac5737efe3777695e739e58e0bd4a3d9cebfac38a5d15a82639ddf32df29e3ddc97bf6cd846d7ae0408767f7b667975f0753fbf857958fa256d8ae0e1e556db65a81e66aeb9a71f47bcb24695e8495af74726a8d690c4cf4e1b7d3173bd8f79c7fdab34684e8c7b26d2ae8e77d91f7aaa660f5b7293ac191da19c1a3e459928a969a869194b474d0d34118c32289818c68ee00700bb088888888b8bf25fb1fbbfd172a2222222a1ee20eeb78b8fd5e257d634347793cc9ed552222222260772f981dc10b5a46081f22eb7bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdcb96182084110c31c60f30d68195c981dc17dc0ee08888888888888888b87f25fb1fbbfd3ec5cc88888a87b883bade2e3f57895f58d0d1de4f327b554888888888888888888888888888888888888888888888888b87f25fb1fbbfd3ec5cc888a87b883bade2e3f57895f58d0d1de4f327b55488888888888888888888888888888888888888888888888888b87f25fb1fbbfd3ec5cc8b8dee20eeb38b8fc83c4aa98d0d1de4f127bd548888888888888888888888888888888888888888888888888888b87f27ff00a7fbbfd3ecfb39952d686e70399c955222222222222222222eb57d54345453d6543cc70411ba595f82775ad19270389e03b17cb6d6d3dc2df4d5f49275b4f53136685fba46f31c0169c1e23208e6bed555d2d23633555315389656c51995e1bbef71c35a33cdc4f003995f21aba69ea2a2086a61926a67064f1b5e0ba225a1c0380e2d25a41e3d8415da5d7ada9a6a2a596aeb278a9a08585f24d2bc318c68192e713c001de57334873439a41046411c8aa9742c576a0be5a69aeb6ba8ebe8aa99bf0c9b8e6ef37bf0e008f685df4445c7248c8e3749238318d04b9ce38000ed2adbb46bdd23756d63e8af90399474e6aa7748c7c404239ca0bc00e67eb3723c55141aff0049d7d0d656d25d1d24544c63e76f92cc246b5e70c708cb37dcd2793802171c5b47d1f2d2c9570dce79228e7f2790b682a09649bbbdba5bb991c083cbb526da3e8b86d745737df19e4b5b1be581cda795c4c6c76eb9e5a1bbcd60231bce0078aec5e75de93b3d5434f70bdd3c4f9a264ed2d6b9ec6c6f386bdee682d634f639c402973d73a5ed9786da2bae124358f9a3818d349316ba47e371a1e19ba7391daaaa1d6da5ebaffef152de2292bfac7c4d8c31e1af7b3e1b1af2371ce6e0e5a092307b95569d6ba5eeb7b759682ed14f5c0c81ac0c786c85870f0c791baf2deddd270ae3444444444444445c5d4b3f34fca7ef5ca88888888888888ac0db3457e8ed14179d354f575571a19e460829dae717b6685f164b4730d7ba37e7b0349563dbac9aba82c35b709a9eef5559a5ab29a96df1eec9bf5f0415323a47b5bcdfd6412b5b919c9663b175ecfa6f5ccb60bc50dc1b7335963b79a9b74ae0f02aeae674554430fa5baf89d1e38e37c8ed5e9e888f5643aa25b85eadd7b36d68aad4a23ea1e5c24959d5b28daded7b5bbe7abe60e3864a6a2a4b9cbaf6f13d2daaf75be5f4b500f5d495119a661a221a19235c619622e01bd5101e24713838caf3abb4ddeed560eaacd6dbdb7aed29472d5319d73dcfaa8ea222e6e09fca866f8dc1c71c00ec5d8d554359a96e17abc4964d44fb6457cb4d4c2c34d530cafa763436774710c3ce38f0037873c02b935158ee74b53b44758adb7c8eb2e5e475347235950e6cd4d8805435a738eb384837321f8e0dc04b269cb857cf65a57c7793649aff0033e48594955451c30790b810048f32b627483d2dd05ce70030467a77bd3d73ad9f5bdaa9ad57aae15b6fb839934d154d3bd92091ae861dede30d430e3f1659c43416b8712172eaca19268243159f55c909d32c8b4f363a7abdfa6b807cbbc5fe946fcf5477a4c0dd1cf0bdeb1d1d4335f4f26a4b7ea396f5e5f0ba86ae99929a56530a660707483f1419d675bbcd3e71241c15e56c6a1d41a5a8e193535a2f3539b4c5ef78a7a294f92b04a5b253ba3f46425cc90b8e0b867b1985dca2a1aff7ef50936fd4cdd56faab99a3ac6b656d2f93b98ff00260e91c7aa2cc7561ad6e5c1e3240c12add36bba4b60ad8b4f5ab5452c6eb251c57064d154c72495e2aa22f7303fce73c33acde7b32304715ed9d2f5b6ed4b51536ea0bcb194baba88511eb277b1948f8a2ebdcd0490632e73f79dcb2389e0b2f5d62ad9edf2c56fab652553b1d5ccf8bac0ce233e6e467864735c95c5cda39deca7754b9b1b8b61040321c7c1e3c38f2e3c160cd4b6ebc6aa9753d45a6d57e91953a625a664573a134c68e5eb18e14b079ad0f0434e4e1dc5adf3f8e15d54974acadd6179d656dd3d796d350e9aea190d55be58259ea1b23e510b18e01cf200032d0465d80572d45a2f369d92d2d9ededab7deef33451dc2ae38c992396aa41e533bb032ddd0e7e09f83badee4da7362b7e993a5ed76dbfd144eb61828eaad141e521d86968a57e1ae73011ba727773d8e0415686afb65fe86cf5f416cb6dc292b2fda72968eaa8a1b33eb2074cd85d188a29db2621dddedd719410079c092afea7b5d7d6ebbb3525c29a6f7b74fdad93c6f2d3d54d5b2663c827838c6c6bbc41941ee5655aad37c1aa34f69ca38ee9ef559f504f5dd5d5599f0f5116273bceaadf31ca09930d0c1921de7725eb6cfaaa6d41a9ed975bfdb2fd6faba6ebcdb6da6c53d2d1d007b5c1c5f2b9987c859c32486e5c40193959711111111111111111111111111111111111111111111111111111111111111111111111117fffd9, 'AC', 7),
(17, 'rosanchez@trazalog.com', 'Roberto ', 'Sanchez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010100000100010000ffdb008400090607101011120d1113110f0f1210121910100d161010100f12161716161615161f181e342c241a2a1c1613213d2d31352c2e313118203344352c4334393a2d010a0a0a0e0d0e1a0f10192d1d20253737372d2f2b372d372b2c312f2d333335372d2b2f2e2d312b2d2d2d2f2b2d2f372d2b2d3737372b2d372d2d2d2b2b2b2d2dffc00011080064006403012200021101031101ffc4001c0001000202030100000000000000000000000607040501030802ffc4003d1000010302030603010c0b00000000000001000203041105122106133141516107719122143233425253627281a1d1f015172325439293a2b1c2e2ffc4001a010100020301000000000000000000000000030401020506ffc40028110002020103020505010000000000000000010203110412210531152241516123528191a113ffda000c03010002110311003f00bc511100444401142f6abc4bc3e81ce84b8d45437430d359d90f47b8e83cb8f655fd778e35449dc52c11b796f9f24aefedb2c651b28b65e88bcfadf1ab13bdcc748474c930ff007532d93f18696a5cd86b19ee3909b093367a7713d4f16f2e3a774ca0e0d16822f96381008d411a11cd7d2c9a8444401111004444070aa6f1976edf4ffbae95e59339a0d4cacd1d131dc2369e4e2352790b7556ad4cc2363a4768d634b9c7a068b95e44c5f117d54f355bf57cd2bde7b6626c3c80b0fb16ad9bc239661a222d09c222202d5f0776edf0cacc2aa5d9a9e439699ef3f0121e11dcfc47701d0f62af65e350e23506c41b823911a83e7c17a4365fc4fc3aa591c724e20a82c607b6a4189a64b00eb38e9c6fcd6e990ce3ea89da2f88de1c03810e04684588217dad88c22220088880d1edbca59875738711473dbf91c1793c2f5aed6d3ef686b221a97d24e00ee58eb2a0fc33d9d13bbddd28bc519b44d3c1f2686fe4dd3edf255f516aaa0e6cb1a7839bc238c17c3a9a6877d2c9ee77b8031465b98d8f37f4e5a715815db018845ef636cedeb0b9a4fa3ac55cab0717c523a58ccf2e7dd820131b5cfb5efc6dcbbae1c7a8dce7c739f43a6f4d04b928caac22a62f848268feb31f6f5b2c78207c8ec8c6b9eef92c6973bd02b79fe2051866f036a8c7f2c44e0cf526cb7b475cd7c02adb1bda1f1978616b5b3380bd858733cbcd5b96bad82ccebc10aa2127e59151516c3e232dad0165ce9be7323edccdd6f3f53f8bdaf969fcb7dff2a5743b7146f7c408a88f79231ac3242f0d739ce000b8d15c015bd2596d99ff0048ed2b6a36c31b1e4a1703c376930521d1c124d4f7f6e9d8e6d442e1cec1a6ed3dc0f5573ece630dada78ea8472439ef9a29da58f8ded2439a6fc45c1d56d2c8aea4546f272888b26022220353b433b9b159ba663627b58a8ac4c6b6c0001a3e2b6cd1f729bd746d731cd7d8348d49b69dd42dc2c48bdc03c4735e7fab464ac52cf075740d38b58e4eedec5f367fa87f05db4c6173dad31900b803ed923ef0b0d173a3734d3c2fd1725526b197fd26fb8664dde56eeed6c96196dd2dc2ca2f513064a58cb08daf00b6c08234bdeff6fa2e062d3e5c99b4b71b7b5eab055fd5ebe36a8a82c60a9a7d2ca0dee26ef858f0039ad73410407004023810bb828352e3552ea98a9b38dde76dc3400e2d02f6254e576b4f7c6e8ee89ceba9954f0ce51115822088880e2eba6b27ddb1d25af945ec39aee5d751107b5cc3c1c085a4f3b5e3b9958cac910aeaf7cc7da366f268e03f15852bf282e3c00d576cd11638b1dc41d7f3d162d7fc1bfeafe0bc85929ca7e7ee7a1ae31515b7b1908b5f85d5e61bb3ef870fa402d828dac3240b4f886f58e2439f909d2c4d85f968b708917806bb65066ac86faeae3afd572b3944b67dbfb76f60eff1652e5e8fa5bcd4dfc9c7d7bfa9f80888ba6510888802222035b89e16d9b5f7af034775ec7b28ce2983d40639a185f71a64b1beaa6e96546fd0556cb73e1fc166ad54eb585ca2aa182558d443283d405b2a782ac68fa794fd26b75561d92ca17d2ab7eac9bc427ec884b28a63fc29079b485f5fa3e6f9b7fa29a592cb4f08afee63c427ec8d3607863a32647e8e22c1bd07e6cb7288ba54d31aa0a11ec53b2c7396e672888a534088880222200888802222008888022220088880222203ffd9, 'AC', 6),
(18, 'm.muriel@mrsservice.com.ar', 'Marcelo', 'Muriel', 1, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010100000100010000ffdb008400090607101011120d1113110f0f1210121910100d161010100f12161716161615161f181e342c241a2a1c1613213d2d31352c2e313118203344352c4334393a2d010a0a0a0e0d0e1a0f10192d1d20253737372d2f2b372d372b2c312f2d333335372d2b2f2e2d312b2d2d2d2f2b2d2f372d2b2d3737372b2d372d2d2d2b2b2b2d2dffc00011080064006403012200021101031101ffc4001c0001000202030100000000000000000000000607040501030802ffc4003d1000010302030603010c0b00000000000001000203041105122106133141516107719122143233425253627281a1d1f015172325439293a2b1c2e2ffc4001a010100020301000000000000000000000000030401020506ffc40028110002020103020505010000000000000000010203110412210531152241516123528191a113ffda000c03010002110311003f00bc511100444401142f6abc4bc3e81ce84b8d45437430d359d90f47b8e83cb8f655fd778e35449dc52c11b796f9f24aefedb2c651b28b65e88bcfadf1ab13bdcc748474c930ff007532d93f18696a5cd86b19ee3909b093367a7713d4f16f2e3a774ca0e0d16822f96381008d411a11cd7d2c9a8444401111004444070aa6f1976edf4ffbae95e59339a0d4cacd1d131dc2369e4e2352790b7556ad4cc2363a4768d634b9c7a068b95e44c5f117d54f355bf57cd2bde7b6626c3c80b0fb16ad9bc239661a222d09c222202d5f0776edf0cacc2aa5d9a9e439699ef3f0121e11dcfc47701d0f62af65e350e23506c41b823911a83e7c17a4365fc4fc3aa591c724e20a82c607b6a4189a64b00eb38e9c6fcd6e990ce3ea89da2f88de1c03810e04684588217dad88c22220088880d1edbca59875738711473dbf91c1793c2f5aed6d3ef686b221a97d24e00ee58eb2a0fc33d9d13bbddd28bc519b44d3c1f2686fe4dd3edf255f516aaa0e6cb1a7839bc238c17c3a9a6877d2c9ee77b8031465b98d8f37f4e5a715815db018845ef636cedeb0b9a4fa3ac55cab0717c523a58ccf2e7dd820131b5cfb5efc6dcbbae1c7a8dce7c739f43a6f4d04b928caac22a62f848268feb31f6f5b2c78207c8ec8c6b9eef92c6973bd02b79fe2051866f036a8c7f2c44e0cf526cb7b475cd7c02adb1bda1f1978616b5b3380bd858733cbcd5b96bad82ccebc10aa2127e59151516c3e232dad0165ce9be7323edccdd6f3f53f8bdaf969fcb7dff2a5743b7146f7c408a88f79231ac3242f0d739ce000b8d15c015bd2596d99ff0048ed2b6a36c31b1e4a1703c376930521d1c124d4f7f6e9d8e6d442e1cec1a6ed3dc0f5573ece630dada78ea8472439ef9a29da58f8ded2439a6fc45c1d56d2c8aea4546f272888b26022220353b433b9b159ba663627b58a8ac4c6b6c0001a3e2b6cd1f729bd746d731cd7d8348d49b69dd42dc2c48bdc03c4735e7fab464ac52cf075740d38b58e4eedec5f367fa87f05db4c6173dad31900b803ed923ef0b0d173a3734d3c2fd1725526b197fd26fb8664dde56eeed6c96196dd2dc2ca2f513064a58cb08daf00b6c08234bdeff6fa2e062d3e5c99b4b71b7b5eab055fd5ebe36a8a82c60a9a7d2ca0dee26ef858f0039ad73410407004023810bb828352e3552ea98a9b38dde76dc3400e2d02f6254e576b4f7c6e8ee89ceba9954f0ce51115822088880e2eba6b27ddb1d25af945ec39aee5d751107b5cc3c1c085a4f3b5e3b9958cac910aeaf7cc7da366f268e03f15852bf282e3c00d576cd11638b1dc41d7f3d162d7fc1bfeafe0bc85929ca7e7ee7a1ae31515b7b1908b5f85d5e61bb3ef870fa402d828dac3240b4f886f58e2439f909d2c4d85f968b708917806bb65066ac86faeae3afd572b3944b67dbfb76f60eff1652e5e8fa5bcd4dfc9c7d7bfa9f80888ba6510888802222035b89e16d9b5f7af034775ec7b28ce2983d40639a185f71a64b1beaa6e96546fd0556cb73e1fc166ad54eb585ca2aa182558d443283d405b2a782ac68fa794fd26b75561d92ca17d2ab7eac9bc427ec884b28a63fc29079b485f5fa3e6f9b7fa29a592cb4f08afee63c427ec8d3607863a32647e8e22c1bd07e6cb7288ba54d31aa0a11ec53b2c7396e672888a534088880222200888802222008888022220088880222203ffd9, 'AC', 7),
(19, 'r.sanchez@mrsservice.com.ar', 'sanchez', 'sanchez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, '', 'AC', 7);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(20, 'test', 'Eliana', 'Bernaldez', 0, '098f6bcd4621d373cade4e832627b4f6', 1, 0xffd8ffe103a0687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d27efbbbf272069643d2757354d304d7043656869487a7265537a4e54637a6b633964273f3e0a3c783a786d706d65746120786d6c6e733a783d2761646f62653a6e733a6d6574612f2720783a786d70746b3d27496d6167653a3a45786966546f6f6c2031302e3430273e0a3c7264663a52444620786d6c6e733a7264663d27687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323273e0a0a203c7264663a4465736372697074696f6e207264663a61626f75743d27270a2020786d6c6e733a4765747479496d61676573474946543d27687474703a2f2f786d702e6765747479696d616765732e636f6d2f676966742f312e302f273e0a20203c4765747479496d61676573474946543a417373657449443e3138373335353535343c2f4765747479496d61676573474946543a417373657449443e0a203c2f7264663a4465736372697074696f6e3e0a0a203c7264663a4465736372697074696f6e207264663a61626f75743d27270a2020786d6c6e733a64633d27687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f273e0a20203c64633a63726561746f723e0a2020203c7264663a5365713e0a202020203c7264663a6c693e616e64726573723c2f7264663a6c693e0a2020203c2f7264663a5365713e0a20203c2f64633a63726561746f723e0a20203c64633a6465736372697074696f6e3e0a2020203c7264663a416c743e0a202020203c7264663a6c6920786d6c3a6c616e673d27782d64656661756c74273e456e67696e656572206174206120636f6e737472756374696f6e20736974653c2f7264663a6c693e0a2020203c2f7264663a416c743e0a20203c2f64633a6465736372697074696f6e3e0a203c2f7264663a4465736372697074696f6e3e0a0a203c7264663a4465736372697074696f6e207264663a61626f75743d27270a2020786d6c6e733a70686f746f73686f703d27687474703a2f2f6e732e61646f62652e636f6d2f70686f746f73686f702f312e302f273e0a20203c70686f746f73686f703a4372656469743e476574747920496d616765733c2f70686f746f73686f703a4372656469743e0a203c2f7264663a4465736372697074696f6e3e0a3c2f7264663a5244463e0a3c2f783a786d706d6574613e0a3c3f787061636b657420656e643d2777273f3effdb0043000a07070807060a0808080b0a0a0b0e18100e0d0d0e1d15161118231f2524221f2221262b372f26293429212230413134393b3e3e3e252e4449433c48373d3e3bffdb0043010a0b0b0e0d0e1c10101c3b2822283b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3bffc20011080248026403011100021101031101ffc4001b00000301010101010000000000000000000001020304050607ffc400190101010101010100000000000000000000000102030405ffda000c03010002100310000001f6fd3e62296a544d936245639749a467ac2a201800000017341372e59b00a0000020a0000000002018000152dcd6b8de92de6b05499ea63bc67ac882b08290020ae34ceae5e7de401952d4a932de523572ab22e4000000002a5eae7d7a71b922e749ac758c379c77cd0000d75c68acb5840000310c00000072e935729173400011ace7733632e6b4c6cb33d6486acbceaa68cd72ade30de10172e99d4d9164dcb50cb589b1a824729492a5d73bd73adb1ad73aa100019ea736f9e3bc67aca035cefaf9750e7e9cf2d626c000000060000ae1a808e6aa154d8020a152de6d4b4ba67572b8425e4c748e7d1c77fa3cf8eb196b2aae5d33a8b1916388d48b33d634ce9aa4d73bd25cec49d38e9a4ae01880000559d9c9d3967acd2e99d6fcf74a930de39ba73560003500000006100d5c54ad62e4009b5292b96f3ad736a552a9625e7cef3ceb6d66a3d1efe755164d804358b32d633d45654ae5d73ab95952d4a9034940180122aa8009ae7de1c6934172806773c7d7967bc8000699bbe36d66c0cee72d641ab010c72e99d5e7596778f0f419d1028314a223196759c99eb6b5af53bf950aa52692528459cfbe74ae5a975ce9952a405552dc300001086004d45950d418124598ef1cfd39cd81a66f771edae760000267a986b186f13a843512f3adf1d33c6f9387a195724d034294225718c378f3b37d79bea3d1f4f9426cc759565e7550a822ccf59a96a5d3341531cac716ae0000000010a984000045986f396b196f08d65f47cfe86a000000091571f4e53652825cf8f6c7cfe814b0d73d33a269284cb32c11667d787939d7a58e9e9576fafc51645ce5bc8699d54a0172e5aca2e5a966c566d8deb9d3018e000000010051000522532d670e98cf594952fa3c3bdca00280246200039f78c3a609ac78f7cfcfe8684a85ac6934e552aa52ccb12cdcaedc3ca5d71bf665eaf77832d626c56201ab8a974cea35123548ac72f463a6f8dd043001000000a80000111661bc63be736007a3c3d1a66800031000000847274c7372ef1c3bbb8cb59d31d593736af3a2113352444ad76e1c37339dfad9d7a7ebf1f2f4e78ef090018e562a04800e5b976c6fa31ba94000a21052122a408d4120233d670e988b900db3aefe1dc10c40300100008093cce1ea48b58e3e9cfab8fa3496592af3b52a262566582fa7237cf6aac6fd6efe69ac758e7e98cb586bb73ded9db31d630de15800e5b9ad73ad73aa96a05000493536459172a8472ab22c009b158001ddc7b6d8d8000000000002011c59d7267a5e75cddb8e9c7bed9d249b2f1b150a226a491ef1d1d38edacc677ea75e0019d986f1366d9ded9d113665a986f9cd080d6f36e6984000ac8b9cf5124ea4d8040160020195349159e979bd200000000c40301008c8f0daece3db3ebc639f6e8c6d137359d99d1622659215dcf475e1aea679d7afd780201521c3015232d671d626c6b5290c559dcc6a0952b966c9b0158000c00072b502159a4d76f0ec080000000600310008f1ab4e1e83a72c71bdb1d489d65e76f3a0449020b35e9c518e75f43e8f300021800a802131de66c71a674565acc5cc6a54ae1cb52e7bce77258800060010d5aa45606d8df5f1ec0080000006318d44422252b8f9f4c2548f1d885acb1e74c5622624894d633d4e297ebfbf9c00a020a424158129340c08b99a9b025235122b158080600000000006dcfa7572ea0520080a28635000e73e5359e7e5d358f60edae6c74d35858ea85628acec9656659cea2c91ef9e7d78f958dfdc7a3ce0e0000152122aa809a070a90c949b32de72d61500800000000000c00d31beae5d810151631a800072e75e44d7c6d9c37329a2fd262fd3359e3a6bd38acee31d1136563a1096659964943789ebc7c9cdfb7f470000700a810923525295cb508288054923531de33b92c72d4a13600031000172de741735a6342d459400a194be7f3e9c38e9c58e912d6f1e5ef979dbc63aca3d9c6bec6e73c769df2cb1d36cf409b979d99d112b32c9286b2fb70f3cfaeedc50000848a9c063bce7acd4b528054b5284d9364d99eb31721a675a6751a917215284d936054bb677ae3572a024d25a1818cd79dcfaf99cfaf2e3a599a559d09d363b3e5ba72e6d67d5e7dbdae7d7bbd1e39e7d73e9cf9d7af976216b2676f3a2112b12cd8595d38e573f43df8802122acee55386b96b136354936054b734926c54915979d6d9db88b2352a111a93728654b735b63779b4b36114b712be6e3a795cbb71e374b467679dbe7c9ac754bdd35e9e6f59e4eb3e16f9fd570f4f4eb3cdbcf4337ac726b3d3c7d152ab92579d92a49599649b0df3db5cbd7f470042b33d6519eb33600020b01000c040054bd3cfa699d2a8b99b119eb31ac800396977e7bd26a50349a25f0f58f37cfeb7cfa54ac9acce3d6314d08b3b71bee97b2c9b3e77a73f478f7537dfdfcb766f2f2f4e5af1f4699d1728ac7450844cd4a4d2d637e9c7d0f579426a6c48aa6c10100000000000c72dcd6b8d04d91accd80ac430002a6af3402e6b4c6b8493c1e5dfa39f5e1b20f433ba5c337c5df27a9ea677df9bd566d7297c8d63d6ceb8274eae9c677cba79758ebc4e5deb3b2c57358e8b3a422659b249b9d3a71edf778400001580000000000000d48a95936020b100e0a000002563977c6ee56bf39cfa7939df3cb79df4cbebba4e5c172ceb3bacdf58719c73d3ceb457d78f374e5bf9fd3a74e14d65cbb88b58aced809112672e446f9fabeef0b00105240000000062000184a05804014004140004035b974c6f5cea943c3e7d3cdcef866b8f59ecc6fe8dba31cdce5db59dae74b9719cb28a9cdf3ef8f46b99cfbdef95d65cbb3b22c79af3a4b2a898ca6b31f4e3eb7bbc0ac4160200000000184a58000040000000a00c0000654b79d35b95ca8e1e1e8f325e69ad1745f4759b33ceb19af3a69b3d69b49772c567367a474e5ea6f8c63a9669ae784dce3a902be7d10a912466e43e9cbd5fa1f35058000000000000400000000a00c0000006039580e508c758e3da66b1e7d31df36ae586ba7599cef825c4df59e699e28f4f3ae98d6c9a162e7d2ebe799acf3b55974e33cbd1ae34b51f3e84a844912e764a7abf4fe50085102880000000002800030000018435a95952d4a28885645658e98f9fd1594b59e76b7cef59cb3d38b3bd6ccd79a5dae3a6b8238ee7d2c6b78a1d9a2bd67b7af0cf1d73c6cb0efe6c71d36e5d96b35cfa12a25665822b34f5be9fc96020000018000000000000c00072d4b52dcd5cae1a80249a8b39f1bc397659d2c6a66a5a5ac5f4e3cd8ede645ef2975cf4d0df7c3cd6fd8e779a472ba2cde5bb37efe65cbd139a8aefe6e637e1e95acbc7472a25673609333d6fa9f2000000000000000000000180e5a96a5b96a6aa1ab082810922b878f68254e3da3362e9dcefdbcde7f2efe559b55e9d773a539d7ab1988c933cd9a9d4eae7bd6ccfd3e6eae5d633b996fb79f0d62bcfea2c79d3ced0844cb041ea7d4f90000000000000000c000072b2f3ab9aa86ae1a83080290926cceb938f6448b8f7cb1ac9ad359e8ede6e1c74e7cef0a5bbd377ae559cf4335739a73e6c684d7473e9beb076e3e8f5e3c5e6f544d3df27be33cbd12d296f1b4022562333d5fa9f20000000000000000086b52dcb79d52b8a520a002000a0445ce3a9872eb9f2eb7d39ccb1cbb65cf58b7aeb37d7833871b4bb12bcda6c9de909cd2636c2efcfa6d9d6973dbeaf2f574e5963a7179bd2acdbaf9a31db3c759b2f1b76085924c41e87d1f9a000000000000c205654d5cb79b52d290c41480600105224c359e7e5d631bab1042cf4cb9eb99ba37ebc76d6323831b2b796a92c49918ef0b3abc6f7cef596b78f63d9e129c61cfaf3f2eb7be2a6a31d33b2f3a254b32ce7712c1ea7d4f90290020a200a00152d4b52d2b96a1ab008029136200180112f372eb963a459a6b0d2ab2c69d8a6b2e7d39b3b17a3a72dba7264675e7d932a6b9c947a979af3bd71ad2575eafafc7d1d39d01166b9aa5c7371e5db9b3b78e8e54216753135e97d3f920000000c72d4b72d4ad5c0350006002124d9164d8584ac89ac387a32e7d31c6df4e7d1ac69accc4cd56b119de5c7b73675375beb1d1d7ced7433c74e1d678eccaca5d31bac6896d59d3e8f3fabe8f3202e22b7cd0072a32c74c79f5c797489a995442fa5f4fe4800000054ba675734e0182824006a926c44ea4a2b0000031e5df3e7b9c74c39f57be7b6b15aca816f7852e3c3d1cd9d64bd1675f7f2aceeb7ce71d72c74e5f479e38f5cf3a9949680aebcbddf679195152b30d4e8c56003052033cef1e5d397977c71bf47e9fc900610d6a5a96e6aa5700054a2a9b120310080603549364d81963a472eb38df372ee6b1b6b15ac4adcb7d392971e3e8e7c6b9daebd675ebc279f5dbaf125cf4e6f4f9b93c5ecd33ace5449974c7d0fafc9d2972b030d674cdd6502574a1d0003847271ef7eaf1b96a5b96a69c35610c0415293620a2295c02a0480a9221580cca6b1e3da73be6e3de53a37cab782a9466659c75c39eb96eba758dbaf18e1e9dfb70dbbf9f87d5c3b3974f126b8fc9ea79d423ebcfb3d3e7e3de7acf630eec6a6b9f79ece5ba0050621c014918e584b9695c035100511013408110ac54926c4850021959d54aca9a93839749ceb0e7db2974df3e9e9cd80b3444d61cf7c9376bd5dfccb977eef4f963b71e7e98eae5d3e3fb73bac3876d6cf452a387d5e7ce6b64a3dae7beee5d36cd6300570a8472814025675500c140000124d21880949d49b99b0018000043565674e5e2e7d63370e5df0cef5ebc7a3586896a2556b18f1efc99d96fade9f1f475e596f334e3caedcbe6373dc8737c5bcf36a7b5e6eb993d39dd859ebf0ebdfcfa00386035094a1ca0a92543570d5c002154d9172159d310013a937222a072824280184354b872eb19d61c7bf3f3eba75e3b5cd2247a8b3d2b7cf0e5d725f4fd3e5d7a7347274ceb9bc5d31c1d31cbac75674f78e5b7a38f6f27ae75c3e839eae3b79f4d21a830002a02691a40a9034ce800442a48a92035105480082c072aa1010200a0000cc79f4cf1d32e7d7938f7bdf3e8df2764abd64ceddcebbcf575e334931d4e7de7af9ee6ce1e989b00b39ee783b6393975f5f2f539f4df36a5654356222c654b7135094ac406f8a85603521ab008291364dccd88006002001952b94158008cb3ae6e3d9677cbcbb3d637e9c65a6b5ac3ceba7af3dfa7244d61ace5a9b66e92a26c922ce3e98e6b7c6f4f0f7bc5e99de3d0c6f6cda96a1ab1811645545cac8b1000e3a71a6ae01a808805529364d8ac40000031c54d54ad41c14848aa6e73979b87795e5e3dcb36ede74b58e8f5cf5aedefc11265a93654ac70a9136676736a7cdfaf87d1787d3d92e7bcf4e3550c6a00150ab2b22ca5d3366c8b153975cbab9ed80854128a924d8584a000ac006396a6aa56200102354249b26ce5e3de65e6e3de25e8efe768b9f5ad63abb72d7785488b18807134aa519e1fa79473d7d079bb72fa3874f3e9ae6d2802001951158eb32692d19d2b2f368eae7b4882a5000010c6ae015088060ae150247282a480058847372eb39de1cfaf3f3ebbf6f3ddc567a173dde9f394849340c4310866567cffa397bde3f42edcf3d7333d3b79ea940010205caccb531d40d73649d4b9733bb968a20a410c6b28c6a0c0409349015808bce8100ac2c4300039b9f4c7976cb3be7e7d6f7cb4e9c349d2f59ebf479d0d650a70862153855e5f6e5c96fb5e7e9cbdf873f4c7a5e7f4eb9b50d52200a40699ace7de72d4bcd646a6b9d629e872d80002286215008080560240006a4a00023a4003039f1be7e1e8839f9f45a97be4e6fafa73e8efe754e00100548c71cfbcf174cfa1e7ebc7e8f3e773cfbbebf9fbe99aca8a544a1419d88df3a672ef3363973de77e7ac2bd2e3b00630150885601282a101800000000cace9aca2b000329ae4e1dd59c9c7d1365f4e3a2f5ef1b77f3cd04d925cb44d38b8c351959d65bc7175e1c5da7471ede8f2d6f9d3195280934019599d7466d472f4ca971e98db9ef34f578f4600149102020052c0000000728850115355284d9361283265e1e5d91c9cbbe735af5e1b5cf4ef1a77e3350935ae6e919ea54b519d459412f0f7f3f0f5ce9c3bf99ecf2fd5fcff006699ac40300268031b32d4e8c6959cdb9cfd31af2de87abc3a88ac9b018e5a95aca46b2000e563955800e560200501001002cc7173eb39d7373eb8677bf5e1d1ac6dd317db946a646f9bac450388d48193586f9f274e7cb7515a47d0797bdc35049340086380c7530d4db372d4f37b73e9e7bda5f5787420155452b80044eb20e5621ca0a98e00010521130c4b8e759e759919db452e59d7367a6dd38ed73b75e7a76e59ea4d9d7cf4a9088b100c0e3ebc7cced9e8e3dbc9f471facf9fead352a289ac6c652b8430206459cda971c3d334a27bde6ea0e5a5700c90a063863500488060210aa4ce5c71be3cede6e58e8ee49bad628bb97739e77c9cfae9d396ba9a74e7d3df845915b66d0c9a218a819e2fa7ce72ede37ab87d4f83d3a59bca00cceb2b18e18c0c88a0932b26b93a619f4fe3ee0152b108281c30018800402598e6cee48973cea26844397979f4db7858e8f58bb2aaba729c74e4e5dab7cf7df3ab3a3d5e6cf531d4d3376cdb280402acee7c4efcf9b4efe5bf63cfd383d3c3bf8f5b9501acb959cfac8202975cde6d444115cdacf9dd31bc7d878bd20828000018402a70c931979f1d32ceb2cef1ceac765dc94a18ac0e6e7d6ecd25572ecd2b4e9c673be4e3dd6a6fd38e89afa38aebcf93a624efe5bd659a638560615e6f5c799d33f5be1f47377e3c5be7eb71f42085571ae6e5a9cdbcc920692eb9bc9bcc19d9c7b9e2eb1cf2fe9fe2f48020001524425518e7718de7194d679da01473cd74ef0e5ab9ab0a508179f9ee6ba49b0b8a34de4979b977ce37edc344d3af37e9e107274c4d9eb79fb16000073ee7ca7ab8fd7783d2f78e6ebc7cced8f7fc7eaa2400d25d7372d4e6de648155c746751663acf2ef3c5be7e45bfa37cff5a18012141271e35cdcbb4cdcc8e6958212a12872e6f574c5cd3b86163265758635ce762e6986b8d35db5573863b632f776f3f9999cbb9f47e9e38ea65672f4c7adc3aa0180abc8edcfab8f4efc5f3fd3e6c74e46bd8e1d3af1b08b2465cbb4b29cfb995904d925cbacb64279fd33f49e4ee0080540920f3787a32e7d216929558c210944e69adb59de16a3428452b3397963a6e6231d629aecd34b9cf1d723afa71cae714eff004738de72b31d4ece7bdf3426c445932ed8df1fa3cfc7be7cfbab975f463d0e5bb9426a115546b9ba4aaa2c826c9011cda736b3f43e6ea0002899d98d9c313e6f5c6379ad964956100a9a72e755a9d529acb42c2c52d5957299db59d2c452ccd525d80c0823b739d4c3a670d672aeae7aeee7ba026c33ac3af3e0ebe7e1eb7a7cfdfc3f4f0fa0f3f5f578f4a5a8a89a9b200b5d336a193516615cf663a9c9acfd0f9ba80004d98eb399c196fe6f6473dc341d066340742557363596a76aab9bb9d6e77e9cf4b02d0000550000809b1cb1db19ef309cdd33c3d79698d7afe7ee5342b3b9e2ede7e2e9ad3cfdbccf4f2f4386eb59f67875db3a631c2a4226c16a039eccaa6924d45cf5f3ac0050e8265e5975e1e8c38f589b25e9b242c06817641173d566bacf5ef1a5904c0a020a00a0000333cce9cfd2c6ceb9cf794736f186a736f1ef797d01cbbce7667d38f2ed963a67a84bef79faf2f6e5d9cf7b66d4a8630024cac452b89b11351602c46322225997a3532979b1be9cef9f8f7cf3a72f4eb2eb6d73db78564945dcd1ad6841e2c6c7a400a918132e72eda8420314f9ce9cfdac6fabaccf7994cb5393a632b3ddf377e3de419c3d7971749d1cba78fd73f65e1f41bc63d33d9cb795972b100c406766541be6e9089a9b24cb3690334c334ceba0ce6b42e226d4badcdd8eb44a329408735072ef1e7cbc362d4f5737d996ec41550cccf3b3af4752d12b1279acc5e5d9d36f4cf524e3e980f4f8f5cecd226be7fd7e7e9e1dbc3f473facf0fa3a539faf21aefe3b8a8b2a562015117115959059a4b4233b31e3d1263119a46dae6b3a1be9dcd2aa0095cac228ce6842e5e3a724795d31886b28e997dc5d470e9888b3cfcde895966f4272b3cfae5d7bd9d738ea65663a996b3edf9bb452a13c4e93c4f4f2fa3f1f7f479de5f47049b67a7672db5cb5252a564936494bae54a8493488acece4f0fa0910a5aae8ebc79a5cb1d77d3a6bad12d45d8c4802b1d639bcb8b935d9acedaca08baaa021184bc58d135ba6ba96954a15423edcf9fd1caa5e7d662cc379eee5beee7d26c51f1beee1e8f9fafb5c3a61df87274e2af4f438f5eae7aa9591648134894432e5b8a5948acecceabc3e8df4a26134cc9393cddb4e99df79dacbb1d95acd43b4144ca89104b763a6093283113194aa5b95d08c444b765586f3cfecf3e5649cdbce76167b7e5ef6b86b3f2de8e7f4fe3efcde8e3cdd387174d74f2e9e8f3d74e37515011516480000d6a0111640abbbc9dea980131867596360017acd6b3766a12cc4a83100a556005008044caa560100058e81819fb7cb1a986b386f3cfbceb9bec797bcd2ac71a5d79f9fdfcb85dac74ea3bf9efa31a70089b100d5c0301089a94415d7e4ef6004cb8e7512cca0c4202acdacbb1d80c29a0140860020815119ac76295058c0142923d1c72e99cecc379c359e1e9cfe97c5ea9a933b3cef4f9b039eefa79efceefc7e8bcddfaf9eaa542a944302a560210a90c094ecf37722ecce5e7c6e251540003b2934d4bb2a9a14000c1192ac68080009563401410400339fd3c7cdefca2cc7531d631d67ea7c1ed5649e5fa7cfcf71c7d35dde6efe27ab8fd078bb7474cf6f2db94a940043562829000e015237f27750eb1c6a5418cab2ecab1d55800c00043010c9287601002c939a156020550e941602f472e3e98c7798b32d48b9f6fc9e8467a9e3fa7cbc5d6f5797d1e4fab8fd378bb9acef2f4e3522a011002a4400350043213a7c9e8089665bb2ac74cab000000000854c62262a8018a100009665bb952a14a5105887b91df8f274c7374c2288b3d8f2f7933d4f9ef6f9afcfdf97bf3f4b874f6bcfd797bf2d3376c698829090100086a00870ce6d4eef1fa1143a608095a0030000a2100c0421d12a008000044677a6b132a143a076506a73fa7865a91651cdbcf9bdb8fd0f8fd5a4bcfbcf81db156615f59e1f471fa38aaeae7bd334113481108600a00865c636074793d348e818a1d00034280014001440205052cc5580c4000b8f3ed579d5cbd470e81d342b2f471923530d678bae32d67dff001fa26b13c4f473f27b73fb3f9fe9c3b73e3ebc3a71dbb39eef350a90091008000016e033ad62fc9e8ab1d000310200a20a200a86202600189666aee0000014ab1a7a95acbb14ae80402b2f4719b38fa666c48abd5f3f5cea6be27dfe6faaf07a7b23c7f5f8d35ae7a7a5c3adca009100c1522010152d08a197e5ef540008205110874c50c40002225763014de7cfa69be55616295d8c252c052803b001132bf570c3795638e2eb8c379f7bc9e8cace7d4f2ba67dbf3f5e0f4f9b877ce35beae7bf4b96ef358002882a4421014b50a90c84ffc4002c100002020102060104020301010000000000010211031012041320213031400522324114502333422415ffda0008010100010502f0af3a8b66d28dafe6217531f928dbd5438f4df8d2b238cda388a06d1e31c3af60e3f0ecb2cdc6e370df42456946d369b4da56963895aad68a28a1f4d74281b051eb6878c71ae888868711af3d97e4b285128ad1929eac68ad1695d2f448da6d144d8380a025e368944da6c231d68947e6266e37a3988e68f30f2b7a265eb4515ad0cdda51424515f018c48a2ba2486ba942521603907219c863c728f8544a25e267a37f78bede168dbaaf895e063d63073238e31eb708b1e11aad6b44b49486efc2c648ddf7627db4b2c722f5b2c7d36597f198d8deb08ef97af134992c7456b639977adf5bd27eb2769609762cb2c659b8dc589e8f5b1b10be2d8e437ac62e4e31515e49474b1bf33f5991c3b17a65f5a658d96597a21317c36390df4423b23e69aa1bd77742f0e58d9860d0bd388e1d75e088bc565965965965963974e2573f3b569aa631fb8fad17876db50d6870251ad544da6d2502ba50996597d5658d9b8b2cdc6e2cb2fab12a8fc0cfd84ef49a21e3447a9a1c05012d68713694515d366e371b8dc6e2cb2fcbedfc1c91df0c6f4990f2474beaaea6ba2ba2f55e6ae8c7f9fc2c98e50cc897a4bc898e46ef231a28ad5eb450b47e4be8c7f978e8ae9df12d352c5b579a4cdff0a8da6dd6cbf838fdf5d14574e6cf8b87866fadee961e2d73788cf9239785c92cd87d799131fbf8afe1c3f2e8a2bae7c4e1819feaaa0b899e5cf928a22e497d2b36d9bd10fc689fac8beef15965f858fa3695e251361b051d6baa79618c9fd431a27c7669129ce628d8f0ee5970b80e2868fdf0bc3675c468dd0a57e343f4e3dfc4f5b37165eb65f4ad2f4a2ba68512ba52e89e5c78c9fd4113e2b3e436f72d0bb8950912829472c364b6a6be9f851f741ef4d0c8fbf26debb2cdc58deb7a5966e3716597a289b4da34515a5f52e95a3692c9c7e3813e2f3642b4a1cd44c9c5a46fcb908e1ce439f031cef4e2f1f7d9ba6b1a435697da2d3f6bc95ad965963d6fca85abf12d2f4a1c945715f52e5c619327118b69b4ad24385b586117fcac704b8fb31e7c9223b84648efc71c7b389e331cd98f37db3ef087a27ee3e35a596597f0eb4b2cbd2fc166e2cb1cccb89e453c1cd8f0bfeaba327151838e7dcd2b4a04e3466dcde3c3ba38a10c624d918947eb2f67bb74793cc9497d9011256255e4bf8f6597e74245144b1f2b8fe2f23dd8b836d3c98b09878a84e6913812c162e1c8628c48c4ad192c719096d8e34913447d8baaba997fd3d097471c98b1a9f13c4e7729ae0d9830a8ca2865170b54266e2c7aac916b166e6cf6e8ba1965965f43fe9eb4b2cb2cca56c863c6b19b5b1408943859931adbf7217114472ee148bd631a307dbc4a18b46cbf03d17f52e46e3732434289b47efd1cc33717ca7ce9e52ec9ab1c29e29ef859fab11da3950f4b2447fa9a369b4da514515a37d0f56cdf59679a8e6c58fb908595082cdc6e0818632e22589547f7fa22349b1bd65e97bf03f9b4514575b252e87afea4cdcb98fee394cdb42df31f0b0b5c37365b14635d10f4c5eb57ebf6bfa3a2bc6c97bd5eb5f6c892db997138b19873c38a75c3a8ae29b8a8ee12a195d11d303dbc5c953d5afe86848a28a2bc4d8fdeaf4426645de7053393190b81c6a51c50869bd26ad943ec5974448e98e37c5ca3b93d2fe7d1b4a28af231b1be97a262251dcaa9d919126c7663833d1bc93b371eda1099817d84e1bb543e8a28af89451b4af3d92637d2c7a223a64c7bd084761cd2379bec72bd1084456f9eb2c7b9b84a221f4d965f9e8a28a2bc9659658e43c83c8cdc2e9631fb4446449e352249c1efefb8732c567ad10872a30439702f49099b531e21e398d57c1a28a2bcd65e9658e43958c7a4065f4324211fa88c63c16e519229b36a28edab670d8f732f56ae5d1ec78a2c7858e2d7992f1d9659b8beb968c6210df54b4423d68c4ea6fb4dae9b31439d3fd15ac3bf85e38b1e025171eba369b4aeab2cb2cbd68a369b4a2ba65a4862eb64b489658866d497178dce38b2acb17ab9d0b7659e2c6b1c3a323a84552f13ee3e1fb9451b4a28af0d14515d56597ad144968c62f7d17a325a45e9fb46d515c47b50ac59786fbff91b5f390f2a238b2e51e5c7c1638fd5b398feb0998f8dc194beccfcf27968a2bcf65965f8da1fb25a262f5d0c90c83d3f718ec57b9e55fe5cb38e2c6f8ccdc4cbf9164b0f0e70728e394b1f1195ff00f3f85c867e1a3808e2835b22943364c0e3c42cb8e11dabe45fc464bd92d1111f4c897b87b862676893fc605272e2724732c708c66e929e384c7c1e391ffa386960e361333cd9186e369c994ce1f868e15e5bf0d965fc69692d1087d2c58a595e3c50c437a4e5643d719271e1f24566c2f06e58e171e4137524fede238755c346590da47158a2978efc36597ad15f1a5a4b48f5c715f44e6257a3564b04626385371d926ac9658c8cce381fe71e121b60abe351451457c0a28a28a2b5968c647aa10edaca566d12d594495925b4735871c564e27365c6a3c26212f1589f55945782cb2cbf0d1457865a3242e98ab7abee5783253388c8f89cbc2e05831e4a5871c295785f4b12ebb2cb2fc9457918fd92174e35dbc747193da7d3b0524894b7117dbc2d6ab5a23f06baafc6c9693d132ef5f5e3a272a32e3e76748c92dcff0023876de15d765e8d689e8d236911cbbff433d1e884590ef27e393a388c9cbc5f4f84a9bd90f47113a50550f0589e8d689e9faff9bf3597f0e7a3188bd317e4f47adf4b743ee71585e5518c629e4eee7cac718b5087e3e1dc2958d12421a7a3f5fd14b464842d31743968ba3d0c4b4c8769c94b9f9324b66287e3e168ba233b248fdbf4e5da4cafe8a43d27ed0848c7a7eec5dca3d7437ada8c66cceede38a93cf979f922a978a48f44264d12f536647dd3fe898fd93d108868cfdc574df44d93c9c9c70838ae2f2f2e1c160a82f2388d5109938d1925df27e49f6f2514579771b8dc3ca8e721e7398deb2d116637dff52eea1dcf5d17d33fbdeee64dcbf8f8b86c12e2b36db8d56add1b8beadc5d8c92a164edc4e3bc7958a5f26c731e51c9def90e6cad1744b48e91fc8647b4afbf833cb718ea4f3649f159f0e15c3e1cb2e4e2bd7d8e3a5965ead7431cbb49ff008d7af85659b896647391ce37c99dcad65ed3d28ad64323ad92b14f71097ddd72954238dc63c6e6515c070fcb8f68ac9f7635dba651d6cb2cf69eac9b37fdb19f6f3d8e690f321e667324393625d746420fb362677168c62d5778a6648d49488494975657b71e5c8b85c5c0f0fcfcabee7396f791fd9d09e928f4c6544a3b93ec58c99954af9f2c6fc566e1e448e7239e7324cee56b7f72f456b65e993d63d770a45e9217b13212fba432513166e5e47efa72ce38f1c564e338a8638e286467e52e2726f71fc7a13d2513d7446745c643c68712501e03360ff278193c94731b37cb47a5eb5a4bf28bebb2643d8c641f75a488fe5facd936187887ce7a49134990fc7a7ea1df070dc3ae1f1ca5cb84a5b5669f2a328f2f1607788a2b54c4c71b1e366d6515a2931643b31a44f1a72f03665f7fabf051331e97d521767bfb31f723176b47167298a04b0290f86497fcc96924627fe228ad76a72489ccddca8e3b4712f93c3f0efedd68ad2c52d28da6d3623968e58fed1b1beb721cc9e6efed2d174d97dc998f44597a5329b39367210b12472d1cb46c368a2515acbd7fc7e9966e703066e63bd6851b273de7fb657fc8c91ecb24de7c9c33ecba6b54cb2f4b1c87906ec63f7bcdc6f379bc731b1991775f8e97d15ab2643de891cb6281b4dbe4bd3f4bdc892b257138492e7bd2cdc4a6e4a4f98f2cb9b3845647c5711cd9e3e13670b82e245f5d74363974edd2f4b2f564d8bf17ef45ebf77a51450e16471346c161230ad1f965ebf909648bb4c7ed921b143666a1f61ccb64e467c9ca50c7471999638fd3f85dc665bb1628dcaa85d6d965e9b4d86d369b4ae8636296921a647f1968a36289b48e336146d369451d8b25914565e38e1e6e6ba989f4cfbacb89f3303fb5fa7e891231abcde893726a2577cb35c3a845c0c935c1e0e1b04b89cd1464918ffd8d1ebc0d6962916514574b6488ad768a23858b18a05142ea94b69fc93271934e59279448e158ba2b492375645d39d18df65dd6b2f7817fe89918e9567b9aac10ff002f1bc462c50c38e52e5412a3d651f55eae23815a2e8b1c8dc5e88645f7b17451457456991f67163c3291fc7c872729c34324651d2ba1b24bee533984657ae586e58d51e9135a49598feccad15ac577cf9a5c464e1b87fe3625518ca7463b6bfeb46bad32f4a2babb94f4562464b442cb31eab5a28da56921c6ce590c691b4d88d88ae99ba1cc49b140da8ad2c7dc5124bedba1f7432470d9b7c4a28e3389e64b80e1760a364a5cc97fb65833bcb985ad75d96597abd238c50361cb3966d271360a047b17e0b2fa6cbd2cb2cb370fb9b0ae9ae8650fd319c3bffd37a66758781e177b8adcf24f7c9ff965925cf9e3714e3dfa2cbe9a2bcac7d1629162d6fe4de8d1434c67791863b73692a9c68cb2db19333cf96a18e87b37e3baf84ba1b1cbc1627e1af050d091b4da6d369b4a28da5121ca26e80e51253750ddcfd673e529cb6272fe363845e332cd70783856ea0ee5f15b1beba361b4af84c5e29fa63b1d8ecefbb4bda4a542a8457dce35860964e3788508e1cb18535f0acb370ddeb451b4da515e65d6c5e27dc97da5a3b0e28518de92fc7fd9272fe4e4c71def88ccf89cbc370eb86c5287f9e357f05bd5a28a28af84fe1bc91324e2ce744df391cb9325961896935ba19a5cd9c21cc7c671167d3f86e5c55256f24efbfc067bfeb24931c606d89f6995ee4f144c5fea33dac0a1b4e2332c18f81e139d2ab27939b2c5f92af83212f92c5e065f859434893812703dcb4cadac5292e17160c53e2b3c20a2b3e43d983f2fdf9d897ca62f0515e17ee4da4f7339272c5b54de93694324e5c4e6e1b02c18a72e5c724b69925fc7c5c33edf0517f25f8acb2f5b2cb1bd262b24f6a96f66c69fb1a337fa381e1f9718f65927b542b1c61b8c3da6a8bf81bb4fffc4002c110002020103040104020301010100000000010211101220300321314041132250512342323361435271ffda0008010301013f01f628d38afc8515ba8af4285128a3494389a77e934fa965965965ec48acd146928a28a1a2b7515c9a4d225c0e238ec8e5a2b9ecbe4b28a2b646276cd72245145146912e4a1a28d225b24bd7a349a0d068341a4d2cd0cd0cfa62e9d0f159a2b6b2f34562bd1625b98d6e516cfa67d33e9b3e9b1c5ae1a288c4514522b81be5af7d8f2a2d8a296f6931c3f5b96146c4a866a2cb2cbd8f82f92fd863798ab7c8e1b630b12ac34514514514561e10b365e2cb2cbdf7ec365e52b12ae56b08840f05f1b1885865f05e6cbc217aad97b22a973e92103c0d89e58b8242161a1c77d702e6bcd9658ded82efe8a7db0c5e72c5c125959686b291450e257a165965965965965ee82ede8a7445923e45c72cadae2515b1a28adf6596596596597f808318c8f1b1f33d95ecc7cfa6bc9f0323b16eb18f9e8a2b7d0bd2879f5232f81a10b0c4cb2cbdafd5a2b65fa30f42ff00e0bc650f09e5228a28ad92f61fa70f3caa12668fd8d6d88f112b8a585c97c6f6515c5469348970a4df81749fc8ba51124bc618d6caaf22cc762dec7c8f6597c4b17c297124df81749fc8ba715c0f1d38d773b3ecc71d2e848910d8b81ae0b2cb2c79bcd965965e68a28a28af4174db174e2b6363996d94cef990b3d6f099124472c5c12dd65fa4b956e9cb4d10edba8d290e491ac4f62f2278ebf65441921791618b8258b2cb2fd5b2f8ecb2cb2cd4369917872356c91a44ab6b117475bba3a64b11d8b758dfb365fa15980d8a3fb2d21493cb597b62489f8207c0c8ec4cd45965fe2e85b12ed64493f84287ec48b162b35b68977108908bca469349a4a2b2ff0019d317675b6cb13e17e711258b10c5c0ff001318d9a0d0848979d88d38b2cbdc890c89438e22317e1e8a28a28a28a288c44ab289e10f098f1a46d2f22efdc5b112c288890c83fc3d15c3189e05858911f221b2ec48a1c9447d56fc1a7f7b90c4c586488657e068ae44fb6238589783e444bc9d91f517c0e73174eddb1251f1c335f241daccc8f910c5ef51457325db0b0b0c7e4479c76fd62cbbdb62cf53c11969799ac44647dba28a2b9e31d8b344d085c6b0cea3b7884eb12c406266a351a8d45fa7451457a1428d0c5945978ea08ba79bdc8599cb4ad90ea57635a6322f651a4d2692b9a8a28ae5bdaa06845225843c44a12c4c89211e37d6cea4f53d8f298a713b0bd1a2bd0bc59625628d0b0c90b0f11c2c485e4911786a959659456deacfe171aea490bacbe4524fc7b565965ef816471218b0fc62385863f2793c1124ae2ce9bb55be73d2b72e15392175bf6464a5e37d14515becb2f651451456e8e2389659f1842cb78d24c81d4eb69ec84ebb89decb252a4376ef6b171f81759fce28a28ae3a28adf65979a285888896588a285967c8bc13351312ec467a4534cb2c7d448949c9e2cd4b3e5f357a56597ca843c48f8223c27b1f913ec4e778979c4fed562ea47e18bab5e49cf578286bf4c7aa2f3746ab425f8e42239908432b08589cbf43631624ec5d4fd8d417934a7e069a355109d9279a6c84147d8bf5e388e18c59432239a8929b965889ba43568d22568fa5ffc3175251ed33b4bc1e0f2f15ebdf0d97e84710c4b2f11246baf1b1bd9a7f424550d589b97956870d2ee2cb75dc8af5e8af4e8a28a28acc711c48b10f11272ef5c6c63eca914e6c6aa342f76cb2f868a2b856131124310f174b99bb6463a5127484bf0f5cb1c418c62cc9f2cbcd9d38ff6c377dff137bef6c4643125843e563fba55893bec7f9323f948944713c225cb274ace92f924e90ff4755d2fa71f22fc05fa91f385891423a9cb28df63c1297f62f4475b3a51fed217e51650c623abca89bf812d72bf8425f5676fc137485c97f89588f818f1d4e5ba5649fc7ec9f6fe388969544e5a9f3bc3fc2c464312c4f964cbd2b5bf274a14ad9391d287f67cf787cf4515cf428367d367d314161916592c4fc618b89fdce88afa92d44a54456a7e935ee51a0514694522c79788944b12f1cb27ff009c4ad2a87f7322b4aa272a5e93f5d41b343341a56ea3e332191c4c587d9e53e06e91d3869eec933a71aee375dc6fd27e951f4d9f4c51452458f7a18b2c64712cf5177c32f8652a211bef893b12bb93f49b5f24636bb72a8b67d367d334adef7a1911979421e193f19688ce9f7decad6c4a89bf83fc9e944e572d31f085c978ac33496d7128d8a08d2bd243224b086210c787e36357be7e08c74a24e9129576f926fe9c74af2c8f4f4c48f8e1ae1ae28e1713e16c4c72c21e1490e6365e18f0c5e3725894bfb321d97d491d38dbd7224c8f357259176c597c2f759a8d63917b2f7bd9744657b51295915f51dbf07fb65ff06e8bee47d3b2cb2cb2f31ecc4c5862de862c59a90dfa0f2d0dd1d37df6b7f03fbde8892eff00c7112d2a893142a22f6e88884310f378b350e66b1ccbf42fbe1edaa76b3789cbbe943fe35a5793a71d2893211f964fc0bda4b1162c366a1c87335166a2fd5d3879785e76ff00afeef93a70fecc9322af127f02f3e9d6da28ac2351a8d45edac515cb7b9b356d647ced82737a98d8bee625449d0bc9f3e9d14514781cc52dd4515c145145158a28a28a2848d26928a28d1668a635587862ecf6f8ec79231a2e894abee674d3ff002f5e8687d3140d0691c4a2b91f156eaccfc6d64257b1bb211f9c395f77e04bea3b7e08cf54ff00e7af6263622c7f8292edba0feeccbc108fce252bec87fc8f4a24efec8f834a88bd95b68af7dad9e48aefb672f844dff588ff008d685e48474a1bee2f62b82bd34c6cb2cb2cb2f178979c763b0d8af56c94b493969fff0048afa51d4fc9d387f664a42f22f7acb2fde7c1e094abbb3a71ff00d26453ea4b531b3bc99d9762bd3ac56db2cbf5d723cd14b2fc118fd47aa5e077d497fc3c2a1bb231d2892fbac5ebdfe1a5d916368d48b650e4965ab5449dfd9112d28933a71aef8bbeff009e78a456243891f189ff008b3a70d2ad929108df7c4a5a88fe310f8121ae575b64c4b53c4e5f087dfed443b76fc621ae0d437c9a4a3e76796455224e8ea4b4f647faa3ff0059d3f1f8c88f8eb81e5d9597e0e9c6bbe272aee74e3a7f92474d393d72179f53ffc4002d11000202010304010402010501000000000001021110031220213031404113425051223261042343527181ffda0008010201013f01f62cbc5fe42cbe565fa16391659b8b148ddcf717ea514514515c2cbcd9659659658997cacbee59b86fb0a427c1e53f7acb2f84a5c2fb965965966e1bee589966e1be09fb166e372379bcdc6e46e46f378e7cacbe559b2f17e8a1be484f939247d43ea1f511f50524fb3658e543932d97eadfbeb83690e4df3b6853fdf2786e86ef14515dea2bf06b849d2ee297194a86ef365965965978587c28ac514515cebd848acb74377dd4f339f750863c2ecd668ac31faa915c24efbea44e7848ae0fb08794c52e77d87e8d145097193e9e8b5d7087e0797d88e2879b13cb6596297a345145145145145729bebe8c90d0b0fb68587c548b1be09965f3a28a28a28a2bf032108976d0b17dc5eecbc7a6fc1f2225c1f6177ecb2f9dfa73f1ea497c89f168a2b92f56cbf567e86dff0023f3c161f0b2cbe31f617a72f1dddc8de27c3e462c3edc70fb95db5c2cbed59b8dc37d96d21ea21ea32dbc213e2f2fb685dc5c28aed3edb7da6d21ea7e8736f34570589cbe0f05dac449707d85d8a28a2b9d14514566cb2cb2cbf41cd0e6df0a144a48b474cae1a7e689111f07d85ca8af49f75f282dd64b959b8dad9b06ab87c158d2f24c8e1e5f61628a28af5abb745628a368935d4650a257089b86f8a1e34fc93161f6d7b3457a179914391d59b7b72111f24b087c1a28a28afc5d8f837d49115f2cdd978bcdf1b174c3162b2cb2cb2f82fc66a0fc5f2a28ae6cf8c4858a1e1f617e25ba379bd8d8bc7065e2bb0c5e043c278961fe1ecb2cb2cb2f32950dde590cfcf2ab1aa1f062c3784225f87b2fb32951e47c10f0b850a1fb3c72621a1e1112597f81beebf3863cac311d59b448b2c7d88b24a9e6231887ef5965f79f9cbca10f1626597ca89661e4946f3178621fb76597e84a5c1f08f6e863c234d74c4e378589619451457a965965fa3290865e18f301957d963cc15be12d3bea6d6b0f8596597e85965fa4e66f66e62c3cb1e623172ac58df08476ae0b146d1c2587e8d97e9d0c72b1e1111e1618f2b111e13b745145965f0d287cf6dc131e93f81c5af6a8a28ae732896238785863cae1222ea48d48d3be7a70dcf93ecb8263d2fd128b5e79d96597d8a2b85965965f296258595c1e52c591246968eeeac6ad50d570a231b74254ab8c50fb8f47165965f72cbec515c2c78631650cb2c7958f922287ecd3fd8df5b270522506bc94511d36c8c1451b5559f49d58e0f3e177afd2a28aee3c3cac3cb43caf035d4842b11fea25669d325a6c7a37e0869b8f5686c52a77445c66ad178714cd94fa9277f8e787988cb166598c7f62421e211da4a1fa16f7e0ded7916a2638a99a9a4e3e08acda44e7bbd8af5e5896161e5889118b911828e5219a6ae4274e8dc374cfadff00743d28cd6e817287914afa9e30e437f9096258595862365f9e097052bf2365d89d15b5f4e8c8cdcba4d1b629f424fd8bf52cb2f8b2c78450c589108fcf048be484c8a7276392d389195ced8fdeaeddf69e2862c31612b7dd49f9231db13527bd9056c6ff0028f1210b8417774faa48d79fdb84aba0fd17f83962784f0f0bb890bfdb86ec4152b63744bcfa163fc1c8b1e238647cf711a71b747fa892e914455b3fc9a31b7f5243ee2fc44bc7058669f9eec26a3723ab628fda6dfa92dabc1a92ebb623eeafc3bcb1619a5db586417dc36e2abe58eb461b7e4d38db1f71a1652fc2bc4859d3eed5ba17eff4692ff96436e6ec8476c4beeb445e222fc23c4b0b1a785db88a3be5b7e11ad3dcf6a34a3f26bea7d8bbb78684c8fe02c7247d446f373cbc2c43ce10fb4bf8a25fed436fc908db3527f4e27cf1aed59445fb966e1b1b65e16561e2388f9cbed6947fe497ff000b727645282273deec84773e37dd5ebb9a37a379b9f3f9cac4b11caeaac4550d7612b746acf7ba5e0d38fc9afa96f6a12b742fd2e49f6d0bd2b379bcdccbbecb10f2b0f0b3a4fa622fa14355d8d3859ab3daa9622b6aff00278a8f34f8b42c566bf44a55dd72a3ea1bcdcf9ae6c43166f0f869f91613250b5d39c55b1b5a711b7276c82fb997b56e669c36c774bcb1f34f8b4782f08dc527da72a1cd9b9fa4c4317162cc3ce509d0f968f9b3527bd918ee625669c77bdcfc225a9ba64bcf6132f8d1594fb52f518862cac346c122b085844bcf293f83fc0a3f6a1adefe9c4d59d2d91231e84fb15c6cb2fb744ba21f7172a28da6c36a28aecc7099455938d719118edffd1ff054bc9d34615f2455b36d4689f7eb8514514515992b1aee21e69897a11f184262ea6aafe3c52afe4cfeab748d35b57d49791bdeed908d12d5b9d2f031fb564b2b8d6768a26d140af42b10f19421bb54f3588af9669c7ea3df2f06acf7ba211f935b52bf8a34ff00b127d3d7b13c37890f346d144da51457abbb10ca112f18f05e231faaf6fc235753ed890859a93d8b108fdc4bc776bb4f165e5a3694570b2cb2cbe2fd08f044ff00a88799c969c7622316c7508929393b6463b98cfb7b765f3b371b8dc6ec342e365965e2f8d9b8dc6f46e2cb2cb2cb2c6cdc6e371659b8b34f0b087d5715d5d896d46a4f7b12b7484bed44aaebd4b2f8290e46f2cb2cbe5597958a2b932f95e74bc95c11a91aebc211a35752ff008ac28ed54bc8dec54bc92d3d90ff003ea514514562453176acbec5e6cbedc1f5e5a8bf8e63fd91ada95d16211daad9fd16e669c762fa93f26e73b1fb2f8a65faf7d84fa70f04ddc73e3ae34e3f7317fd99a71def7cbc1ab3dec4aa24bd8bec597e8d0d09146d28a28a28a288f8299d4ea244ab6be108ee12ddff00857d596d5e0d6d4fb6242164c7eb3ec514515eeac743a63e3357d04bed44adbfa7026d69476c48c5b1b5a712e537637e9d965f1a28a2bf04bae532de5791bdab6c7c892d18ff0093ac9d918ed46a6a6f641ff0a1faf457b96597c6f1056cdac8a66d65246e5f028b794e9d9a71dabea4bc9296f669c7e4d7d4bfe28f3d115b557e72b0ba0996cb3a913712f38d3feeacd59ef748840d6d4dbd179c463b57f925f8c6c5d86cddd85c15893e088449c9422377d59a71fb99e3f9327e17e357636d8a3da474371b8eb595e44945139ef764236c8abea463f5657f08d4f3f8c6597d9b2f85965e1610a91bb31fec8d6d4b7b5157d08c6fa225737f4e26ac9416c892f03f4fffc40039100001020304070605040203010000000001000211213103122032101322415051613042607181a10440526291233372b143c1148082a2ffda0008010100063f02ff00ac520a6548aa8551e0792e671d148a9f80a1d9cd4a9e0080501dac471febdbc78ef97c841438e479fc8dee370f922de7e0e26eec9dfe0ccc14145bc64f6f7ed5e1a142c45d6f3354d7bedef738957fe1eda36709902283c907c82e9e069da0f45fa5665dd4abf6af2e3a6ec6451b2dc7c07b6e016c34b94a0d5b4e27cf4d24a9a21bd30dc2ddf13e00db700bf4d91f359eeff1c12d2648e8d69aee579478e44982d8db2b35d1f6e190526a8d1735391d01df9577994034c1438dccc11d536f11bca0fb575e271c5d3d100c3e814eccfe1534109b11bd348eeef5351e7c664888f92b8e12459bda61a215c30022b6a1e6a430f51440ee226b6401cd43971c7814b41782b8d57ad22a0268018698661414b8eb6d5b5b39fa273f7542d559abcf99436457042f761256a3e830e3b0fa7fa44c26e31d12c310b6810a4715a0fa803e00ba2a74c2e97bb9053174698b0c0a8e1693be5e0005484704dca5328db1101dd50c223cfc0074ed15b00dd445abe468a620d12f35018e3c7cf55b66053a061756dbdbf9576cace12aba481b475f383a61759776d1b7bd7c01070510b6583b36bbe969e3d0c14c33c45ff56888af1d8b6bda860f5c122a9c73aa9a9a87631399d5c723c7364fe5655b82e78b58ea0cbd94d72522a638b84eb33ba8a98a1dd1552c31ec68a454f8a5e77a042d1922a3bf78e586e32aae8c27f1da4d49dc4a7541a837a2bf666ebffb576d05d3a6974737293b6baef51d5b085b7604791527fe7481b9b3e3d135d0d45ef3b2d57acdd72e9caae7c5fc3823ea6a8d8fc40f2727de2dbdba6a76dab6f26cd4efdefa8ba2835cd96e8510242905169f441cd1376e5d77f1cda928346911dc8b4e550746b50808c47372dbb3f50bf4dfe8548c07b2baf831decb5668a3bb4c7bdc6e5f95299e785d777a6da0350af7e5417e93e0791576d5b75dcc2da838735acb298e49ad24cb44f8e45ca1a61a6054182014f4dd730da37c96c1708f75cd51645ad71819494779e3b13daeb5de8175353c95d024df0506739fa2d9a51a143bdbca747bc21c763dada98cc8b816b5c3f8a89a045e69bbc1324cf871ba6f28003c95c6d0554372613cb8d8ed4bf7ee4fb6777e43aafb8d15d155a9654e643cbe429c6196639c49e480eeb423687d16b0e639544e7721f21523859edb57ea55e8c18d46d5d91b409cf754a1f203859ed6f9577bceaa1f0d67ff00a2a5fb6ca7550197776d02a3a070b3dacf2b56b0e7765577fc8faf40b50cf546dddcb67b781504c8f34386c7b2851a2a8dbbf28930236afce545d4ab8a2de9f21028fe4207e763f21e7d90f87b33339cabd4b36654037c9a10b31ea79947ea87c8cd37a70c885c940d7fbec09e416ac677673c82ff008eca0ccb5ce1b4ea740af94ebd570f9270eb1f94968afcbc4288aa88c6e22ab9da391b4b49b1b5ea747da13ed0d076b1186455de150d310a0ea1c65eea05d4ff00f210b36502d5b7d55c6d11637233b7a2a70c92693cf04d03d3131a265cf50efbb3151ef1a28779cb54dfdc7555c1588bdf94df2e3944300c41e6ada2bcea05ac77a046ddf53942d6ba768fa2fb8b8150e5c7460922378c5c98117be566d46d5f2b2650236f692ff48b9dca4879780668ff001c3707aad5b2887c3d9e46d4a101fa4ca75575b907ba717e777b212a71bbb8a69af6ee386e36a6ab5567fb8ea90b52da9ce56a2cfd7a2d73c6c8ca39a2ba4785c4950b39a8b8f6d1c6c1d70977f91d97a28d6d5d4e8b9da394f2d5c50004b705ab1eabf3feb856cada3d94314718c27e22d2713b011b6b5aaea7d820c66ef75f7153aa07affae1525454531d8471c3134e1d73e4d197a05212ee850ef9cc55f72d63abb82bdcca6ff2f01dd399b8356cc83dd6bad06d1ca39289a0578c98d45ef931aa3468900879f80c7969b43f695ae78d9141cf46ad99420c66508585964152806651ee879f8028a9a1ba4b4d0882ba07905aa6d4d56ad95deb516737bb32d432bdf72166dee842f72e3f5d14524c24f7b07de7d97de7d95eff0023a9d146b6cfa745013b47224c4f54d9d41e3f454d234dee4b58e9b8d11b7b4f41cd1f88b59fd239a36f6d98aea7d82d5b5c357732ef279a6f1f9e0a6931a22f7c9a2aaf1d9b36ad6be4c6e50806e5a342877ce62af6f821c7aab305211f4526c16d60239a16167942b8dfdb6fbad4b328aad73c6d1cbd022e7502be9bc7a6d5455555005664d8f2d0f8560b54dcc7315aab3cc7d96b1e3f4dbefa2024c6a30a21c7aaab800034b88ac15e3379508f571418d10028b54cf55ab6faa7f9c38fd3454a9e868eba5c4ee0a42b26857457795f7157466355747ee3fd9108780a8a3cb4daff0003fd2d6b86d3a9d15e340af9cc68b5d69e839a36ef9bdf902287c9ff00ffc4002a1000030002010304010501010101000000000111102131204151306171819140a1b1c1d1e1f0f150ffda0008010100013f21c2297a90687eaa37451ec7ead645d0c8c1be89d4931639d10588d42091c0fd33479c488a09a4c14c88d47d2951088d4f5d212c9747bc56f130a2d614589c46109a271b82104381b1d9a883098442611e122822b425d30be07899e6268a1bc87e8cd8d75213361508248221a1ba2157dc8fc898588210783986f098585831877112755cc2f8362888961d1a86bf449e1a213a2e04a89773de204235a84f668c9a1f46831a0c6de0ba2e9652f457416bce42131444fabc73e58cecfd21a777ed659b712af2b33a53286a422fa0c76583b45ba4c6c4f341c312c209745c27e84e87825d2c6f14cbaf0f26f27b8faf9953fca631e24c2c2625121290c611084274360f10e0d70b83c45422e1b0851313131e159217ab3d003c7b63b89248944bd24312a1fbec10987181b72c516e5294ac6c6f24a75196410cb2cb6c502c0f01f182e82d5e09109fa1a3ca1bc84fcc87e7d597f014787cf477174318cee256355f19cb4317a29487546dd1a7e8a52e1b153a359ddcfaccbe387879381cb827561f49e1e5a8d0f2e0b0e5c0d35d3195d48484f497d1339c4df447f1b7e810c6e18f7b76cb53be0c6cd18c784f48e60a4898614f292b892e3e01b2eb0b2294a528fad599b2cb1bbd3efafd09217d1e176370fac3173d2c78e421d86b7d15ce4c4b0c5871d112108bd5461e262fa490d0943c85a517e87d9668758c5c09a1b7d172c63c2e462c1efd2d613a1ac4f0b0930d8c52b29919bf4e612146255f6f4afa0d316b6a5f0c12893cbe963210812f5686dc51486b06f0b0a41b5ea2e0de79be3d359261e86e73a3b00db5269e98ab4da5d98d8965891098631b1b1324bd3d2e213a1e06241b187fa17edbae311923a5c7df3eff000bb9a85dc5edfd2387c7fe74d0be923ff3b09cbb7cc06dd6f86f090d618994a5636c78670c5e3af529713a58d0a3fd13cfa74a0909d3c1dde78d9fec4c3cf8521e3b45ecbd9761be0c145ccaf23dbbeea5ee353b9c062e3bf531e097d3b638cc994bd0f24ca54a199984e963c90d8b08a53a515f97668bdcf84764fecab3f75f1e01c64f8628eefe029b43ba9f225743ae113fe4f43b0d0d42228eb6318d1c85ac39f5a970f3469950a51e06c6fa350f220f305589084c25d88747e353b8ae99efd11c843c682e47b7e59a43f30ab991de6250726898e637c9f22bb0926baee5f61e81b1234e18d8ba342b8c317431e69b3e8a51b1e341e252e170589e53c2825230a3ae18b942185d09df104117765848fd8e3f26afe069fb9568882f57c0a373627d59fc23b753f0702bf64a862a97f01d8d0429387ec11727b79378e4b56bb51aa1ad0f45f5862e863ca16852e0c3c0c52e14a5e9be8346131b1bea5ce6c262168a4f713af8f610e33b5ecbe8e642c1a854898eb4e4d386f71e897c76a35c534a8af2e0a47a7c9c05b0f0311b2d3f228a953d3b703e2b6b93517c18d4f61207d618ba18f0ce42e045e7d2faf048416865862fa0429c1043b1f91c8cf35d98a6a6dbc31277098f368ef0062a77ec335899b3b01ffcb0310bb95c6ff22288f83994e7e0fa4d50d044e9e46f02462aeb0527ce8469e03e8e1e8acf2d33b8b5297f4ed17d6a6f2b413ab7debb8a3d35afb2ab47e0d71f4181cba8cda5063fb09ef7f2719808b53167def2525e11a3bdf34d7a42c8c6c35ae898444c318d84f5e7e9d612c33c99fdbb875b71b3dc841def1587396ced46d2435ca1b451af98739b8ddae89109f2361f25004294d476ee2d86a62f826f259145631e12e1ff00f869082c1617a8d45627b17f0ff044aadc0ddde89690e0be0863d8bfec8894dfa299ee9d84255b3df37d1cff0085ec6c09e196ff000c4d0b9c8543174bc19c3ffc2842669481789a9b93f3a62798421f4e520dc1a0b8ff00087cb24886f2b96c50b39386f5465e7ecb20f17dc42f61c0e027a6b7feff00d64b0db16c77e963197f570842665d563d131ba51bd8c216b13efe82d96a7cc20b63f14dd5295ec9568e365043295e10ed5188fb94fb936cecec269770dc374fe489ac465c0c426176e87863fd69608ac5084213a03ea3a74339bec785342457342b5d0227bc24da34e89e4e6c429fb25c6e85178978346e0d97fe0dcc1c066d7b18c685ce0e0b0c5878631a1afd4cc104bd2e19e6745c8e98e4d0dad71d0f9afa814716f1eaaf25ea9ad3effc22cff07117d7ff0006bb34f1524257b5c57bf81cbc0fdd0e7fc38e1ed3b52f09a7fd0d93cada378862e963fd3c2b0ae8884eb6cd66e12263894f234117f1d842af2bb8a85dfca2586becd3242d7712083a2b74751b211ee51d543914dd633b8f9e37dc110efd988d38f91884a35062e96337fa382082c684f4da74bb1e34d06e7be8d81b7634711a3d90767c9756a7c89c7c0d12d5dfb1c46385657b0599136397d7c76c49d87ee312d89a1482e48f24110ff43304504613a6f5d1ae1a7077214e44146b787319e32fee2f07cf8f032bc0a3711dbefb0fdff43ad3e47c9cbac5791bde1cbc234b4944b8cee60df66729a79470131dc4cab061b0e91f9f52082c6b142755294bd2101ddb02d8b50d463e3a99c6d8da1b47b0f912c9cf0c6ebc03bd3b0ebcf3c52ed5ca19928a1ec12de44251bee37b3d8b85a71bdd6ca70c7ca45bb3f225d93f81cdb4d7c8b2f33d241674f51b1e0b9203303086c8b918ce0731f67225ca54d46aa354b5ae0777fca635a3f9391016a4416d88823e9e9e5f92e1b62504ee5c358dfc89ac3492226bdce197d04f819c988841af492c108427551e1658b2e27492170e03c66811dc4319c45c9d86c85b169c4b0f729eb6d5fca14d8e06c4a8a0e067cf1ffa14489225c226094c3fddbe8e3865f634f3e0df07fd11fc59efd53041046745ea156465754a0f28213583f61218b087871677134686ece183a5fd9c8e5b4e9f8669e89a7f2c22642aee21091b1bbf8f7153ef7e5890961b3487b7a7dfa9889225429f097864c1141664ea64e9498a52a2335e95e06d675d0b625b1f185b82123e89ba1d1dfc0e21722bb38726f70765f72bfa2afe06fee79036abeac4121bf31b7ff0da87e6a6a1fcb4c76e9f8091d269af2863f283e7b0bd1e4f87f92f9d6115827e85d1594bd4846a35cd7792ee3e084991e3360b823709562fff0088186ccfa23311b3587e0f8ecfdcd6fc0271f5fe0f26a97b9ffd2b02d276bc6ec6fe8a1478da7f641cff0034f917b4b75db66241fc2d238a108da7ddf86760e1f335edd6db797eac17a547d463f4a944c6d745ee72380c5131bc70c1c08695d1e048033eee441b07ba3829d8bfb2154f26342591beedf6106b6bb05a7bfe4135933f339cb6787dc3b775a7bec3d3c06a2674b46a4addfc7a49f4345c9b294a5294b832d84f14a5c3e984f41bd1c8828fa12e85e49d5d776ec2dfb23c9f8179659a12067d5d2a27a9a78f3dc6a6361752bd9a7dc4f769edbf570a38d67e54baceebff00252246dbec84892497d1451c4a2f45294b862172bf921317a0566cac26694a5c427a704cdade2b173d8a3b1e049251a4bb21bec89dd9d80c6425109468a9f298a5d27290c72e0cf846763cf9243738defd3131f2caaffd1b71e6b6d5f0c535bfe3d8509e565944c4f0f0997dc7f3714a6c9d58842618fa697d272638945d1c8e45d170b0aee9be30cd2558c6d099b2794a7217a0c56ec5e46f4ee4fe34733bbfb08355f1697dedfeecdd283c485d4d61603cd173c74084e9b830cbf4858a7a09a26ce07239896170223aed96304274d83758ec7f2ff44e488a6afdd093cdb7ef1a22b62212ad084275342613c32a0c6b97f42ab5bac4925d17a42971084e982084c365294bd3c4d03da176721136250443dc2e1f4218f13152f0b25765dcee39ebe3e456f472334668b410d18bd21a28e31ebb8a95fdc495b23652971bcc21084210984266e17a694b9e026cec21766911311c12f197962c4c2104e422e367e2dffdfb89e392d27846c6f33cb2268d2afd8e401af4297a083c4f027a185b64cb7ee89af6431e9c75c213ae94a5ebbe89b371e67d827d8c11c2c4121f39ee2444355ef857936b36a3fc99ba5e1f61c3b8e4773dce5fc0b4570905d372a3035ae886e2edf64491a6f71f15da6c7b66f452e294a5c97d49d49a209ac18e184fc16086ed8ab26c6c4b640336347e9fb512ff00a2c9afdb21cd2ede944bf6f09ff2316e4dafb21b47b6574b43a850290b10630c6d1524a7b01b4437be8489fa54848835d2ba19c0e472c170773d862e4bb3615b42d383912380f5901f033893e51eea0efe08ae68fe24537a345fd02c2ea6b1270ad1954701c6a1a4fdc98a9521314a52fe8d65f4a6848d9d841c84d9a0e38701c09423a4391238c496c6e098f0ae179631ecdbec8d1ee6fbdff04448b86bbbc8d4709c5f3ee445e084cd28f2f0ec2584f41f9f81a9244f6682346baa10841aea48842108421098b984cba98ae1df1e18db83c699cc60e06eb1160f378a5c77f1bdc9f7bb64a43fb7d57fd20dee8fec6b983c6cdf4357139c4bf18cbec7c1077720c4a42972974518c82ca995e852081a88f71f9cf021bc56f0ba3be2855d7b0c2691b5ee1683de1b83623210877aa2b784b9669edfee7c222cbc29f9f039b6a3f75ec3e22b7492eca0a09756297360cc887a28a8b0b44e57e6451f90d1d0975cf52946a2177143501c3918728b4211dca909e380f9380878b84f0703b70379297c108ba5ad51bf08bec2ebdbb896db4dff00a8d90be48f7529fb2152c520f11c740a5ba2421b1b17b9491fb50713aae575d2e1235421df13ae10fda1b72cd090d41e1b2362ad6484d09bce1d9e18a9b76bf71091ec39cf013ac5d3472be58cb8aaff00a21434f61fc1d9d5abff00c6c4d9e15c2f2c6a5b7a0b09653d9c9a06a648a311247863104c7c8f8053e789d33a2e294a353be0b704da0dfdc7f28d044686cb59b23c120bd0d9836582389cc7d89e85b4707c1d878bd95334e28e5f627d86a6f17a1ab3634bdce42bf95e7e06ee06d7e23c8d77626fc718ee01292fca39452e4e7034d66e12bbc14db1862e131c98dc47a571690ee8350d9bd21fb636e59ae8a921b50d03d105dc44543ecc362086348a91225e0f79893149086dec1366c8bed1a8f08df83681f277cb1a6ff6105c72f8051fe0f2df924adb7cc6a7c013c66e7cbf23d4f81e2970a74a2d0d60f0ce24bb899d857c0942dc22ceb439b34bd162b83e368a77173b22151ca15d3670d934682c86cd91bd89111a583d45701a73163846cb38e4248ba876a1a317b1c33ba84ad2fd8d7cd0ba28ed0da48977d3ff004bb47b3fa0fc1478192ef987a76f65d97814cddb2f768a156fc32782644431610e07e01b946d097718f9d97b0788527452e68a361438d09ba4d092348bd86f70dba5416319418a115cd1b1aa4de220e71c067e04637d0a446c784e63a727308d386e9ec8a2a5c486bf1a1243c0f0960b4f8d14affb47272b0ef4ea677622bd91fec52555f708e8edbdd05979141e534c6586be0f6b14138694ca52e690c2e5037b065363706e07494979343442e01b65cce08e4f236d68f645a8364db15b676c2dd8f68883510490420827e016e05f1c8fb18f79f5dd1d81d82f32a78628f0972c56898534cd27e1781c81e87f40de3ad7b0d22763c4e0e79d6d324f0d0c342a868b151a2128f10c6c5588248208c0d6314281723945b1746c8da86da2214a781b283bc121af49517809ae0812235e937045ed1d88ec0bdc4afb8fc6a87d6b96dfd1b093cea1ad72e3bedcfcfb94ccfb3f2c5a434279793756dfcbc93544ddf6733e44471534fdc4342cf388310b0a450c656c986ae370a3c16e1843789380f982888142a42ad7b8de4c8d41e09da376c4a112197a17a5e0d89e1b448d0ec24629e82b97f079c1929bb4506a4b77fec8ee77c33d86a57b8bedec24ea738f678285b86ceef2341c2f2d17d6ff00a13b8d737a203c49d1de5792b13081b84eac2815a1698e8c0e85b6790943c50241209209112c1217b47c85fa1f4dc3c46fe9461783a69b0e0637a12ac1821b8b80447239d358f0f2214ebb33fddf22fa5383f3e47ab70fff003f2c4f0c9a476149adaed634f98509427899a4b8de85079c8630c3104890a840c6f1b4909d78411709f0211224341b18b091251e9a2183caf7eddb04f4355d286839eee3d5983485a435a0cdbf225a699a1a5e4d47e25ff06da34521c057ba21e5ff0088b3ebf3fe2242b7f8ff00c8435ae4fbb79380f6d782c55b7225ddac5fb7f984c279e304ce70b0b42a8678637b35340c5336c588610128c9908462caec323130f45830ce184c35169e22a11e13144414504578198c28a22c0441d2e0355e13d896381890b6d15747c02da76f3baffe88ef77a3f817b0570bc9b9bd8a23edfe426c5a5d9f4c43581684f0c7911d32491ac36365646ec357637e04ae0d02f01dc6372a6f0f09d220885c64ed88093d81780488d744031f61e57851244524641170bc8472a635be0444c297fb886b36e8f3b5ddfe13af223b3cfc96b7cdcd953c610dd0779ecbc0c0abe921b4dbf7ff002f04354664cbe822b151bcbca21761a3ec4f8c149542966c1020953828b2d8f03d911109ac946164bc1482458a5194c4b0f6a084093915e714c3cb0bcca8f611ff00b11b6adddffe0c87efe09ccf33f23bf911fd8f699f79eff02256ae93fdccf07cefd3114a30c5c4264996c6f104913a2071c2e2b2dca5c2e61086cd9b15c6cd9b214aca5294a52e099b86e23ec2bb89da16e3e5b842c1393d37c31704925a476370f93fd125c8da65fc0e4f9817f0414db6afe074713c5d98f6c5afe8b9a3c2ca5d2ce46a654de21d44c5130d110998426108421084c36fa4832291dec25c87e63b3a14d290dd9c43b8d1362a6bfc477e12eddf15fee254bee5ca3eff002572b81f3e7e061651dd7b9dd04d7f02eb4fa5e209660b0a453aa32d88228c213ad8ba27aa52aef629bd365312f33b8f918e4e2c586cf8406d82bf2077de6f95fe23eaf1dfe113bfe64948927dc46a2f69b9f1ff00a09e8d2fa0f1bd3223284e20b0a13d2b87d4a5186cd294a528d8904837fb0d3f7fd8f358d2cee1f231d2776364a7eedfd0e77b2fc2ff00442d094d9c25e44c0da3f25bf2718bdbfd46b2aed7d1f331be8841f4528baa0c84c959d09e85e965160994a52e589eca5c5c52e2a5b67b37c8b927f908e98fe16197218e689b5d916a4fcac3d0f22f9f3bf2fc8a56966df98a7af92bbfb11753d1fe4fb3fe828509a7e05db4a9dfdbd39d291a21ed7289fa562eb677cbcc210834e41bf025ff000551c675de0f722bce918ccef6c8313de7c5ec293a236fc3fd3bc838f3f1f02aedc4b967d8e3fb29bfe0119fdbd3bd0b0d4d1884fd2d1b4317aa8db10442757b20649f22055e44dc8eb83534b0a72a6832f88af2caa36dfb3448d3885bf71e4be4f9793555e3f60b1345eb93a6890b4368a32090bd1a5eaa5c365cf0f45b88ceba780781b2be615095e065cdb69854348898db172cebd888db9f7e666ad7f9a3f3f1e06f6dbf13624d34c56edea5c2c3d883442c5cd2e294b9bd4df4518545d77a052f4b5d1ab9289e07906cf6e425aef951e9702d579fe51174ad1f610eff00718d6efe10cd6e7f983e82a9fd85a7791ff3ff005d29d704b144c62b67ffda000c030100020003000000101c08263cc3376ef6db10a680000400024926cd27ddc5b9d48e1624b3f7240030c415b6eff6d0630e14969c1db7ef36ff00f752d49215d8c4f860bc599211dad8170b60fdbfd96cff00242db6dfb4924291ce24322fe8afa95c6c110d75575a39c0fbedf6074070dab6d0009240b4fe74c7f5735bea6e013d6f80ca111f7fb6f87f81e0103e0092b8035a01045941cc09b41d8fc6980195355dd4db6dfefb11894c84095c922737083f1b2e463f8e72e210ef24827e0c1c7fff00fdbf0b7fb73dc780245171bd01b00b504445ca09c0080a3588c525fdb7dbec3fccec059b6c49dfedbb296fb6fca73b0f0fbde56c31cf1af6dfff00b70010092f5877ff003fb6dffe9681837e8f508624db3ec02ca3dbfd97c4f23a1bec758b7dfedbff00d2d8cad1e8dad5689d8618f22f6d5208c493c9147dedb5fb3edb6df6db3db614a3ee6bdd04cfefae07f3c6c301b7859801b126d21dfdb6db6ff6eb6a57045749885c66fb03b6257c4fc78df5f5be924a9351dec936fb7df6da2dcf6a4b500ccfb7db640e03e0300fe31b6d26fb2d3725924927faf4e9c58d1ea46df51fe0711c01cd4380689136926db6db76c205bbba4d266cd4acd14aaed748ff00ee4f5b01d83f164a4936db6d249124efe924b02f7840eda3bb46779246e09c711f9fc406aafe9639247f866ede93d18655660f014cd24d9c240238d80249240006938bf4b443bfefefc1b0c3b5b255227991b3a85a4118e38ec54dcfc2285f0a971a0707c700325ca4ec7cc57e09a2f8ad1ffd96d2ab13f727a49b8df56d8831dc981eef57e572983e1d972ffa64e2c4f253b6db6db6be7e8da61248b6876db7a11689112809b5a20b25225fe495b4928000023674e36b249b72cc86507514905e6d2667778a6ced736d0b6db4da6db4a44b64976dbfa3bc0d01d4b9e2a132aa66d1b303a5eb89b6db6da712496dbffed924912e0b5d021ad0c596f0dc39284a08b558924924924b6dff00fed924b6c6ab558a5e983911df464ccf9e21562955b7bf7fff00ff00ff00b6d924b5bd2a4c29c358dd949a415773568ff3c1b7730725b6db2492492496249dec1c40e4f552258d01887d44ee9fe6e4267aaa492492496db4924a6d48c607a03bce9e5add1ddf6192f3869bdfb6eb6db6db6924925249a8a843107f63e1aeb7b736a546ded6bfb99fb4d481a49249249249b7a450e1c97ff0465f3a7637e5e864e049f72d326418c66db6db6db697ac0e8ef89009ec57a5b062938c76797bab3bcbdb4bcd0010934da4b2484604fc0924102ecc61eb16223bc461cfeac0762ba8da3cdb6db64b161f0240006d6391130c19cf3118482e42d2669344dd94669892484a987c81db4ee1ac492549ca3a0a9a9561ef9d6b00c929b4cda3125a7d764ff8e0365ad95054df34678bbc30952cf9b545f41d9b8602454db48f076f87f0c1b82b09246e1a6d63b1d290740d1d4dbfab26411214adc3e9b4fb823f62de910a441fcd0363e3dbac8ae93c91ebe4498a1c8431f6249131041c2920001f0f73ba0f8e76827457a0c54da5026760e529d831f7e4b7bfd0aed4bdb4b314cb25d95e7aea23fb518be620823b211dc81f966408a5e354a736b6d8b074b46b859edd7574a76191c025867034f891e01a484a48d396a77a5676eaf4ce5f1da61551cb0b1e801880136ec3e93ec6f86db6c1a427b382c42fd5c17b1c3cd4dfc85f81228bc9098fb7e0f172b254536480084458849e6ccf243274190edbc4920941d8c28cbc7ce9ca7d0fc4292b636c36fb6add62790c2344f4a3c9066d5304404610998f640239b5593fe8c923f4bdd2dce7f7c71e3b40b3fe60ca9fe8f7b7f32a4a72abff00c6b9332d24a8f28597df670ec1ed0c385c1b6004125b5fb8553fcb12484b69d325b4489237d8fd26ea82c668190905aace37d2f059bed100d92a64bdddbb277510bb18dc87b1b6ed7ffdf725c5787d94d04d1e8955b4dcef6012598eadf8a06c42e7794945791c0b07e97e991a9a27f509f5e0ff00bc044c5541bedc723c8cd776357ee4fa16cb2b790ad4327a409800bedfe0452ee69cded26f8c03290290d901887f4bd310465535805db6eb6c3a4a85eef7fb23dae84582da31a78c24176fcd8684fcb49248129c9e6ca72993b137cb6e2a05b548898a9584d1206d531ee6b5bd9216c617a04c4dec7229431933105ba626933da062db0e9bc508af1e6de0051391db41d955381b8f0b8dac7bb3ff00e19745eb5cf4e0e7f40d2cb292d8ab327790ce79d31201aa914eaf012afd9bd52a9387d038fec5b6d84ab75364eab29cc4e2367fccfa69e84151180d9a781a3d89943146b65924f39497c738095593b36624d4f08d36a71c8ebae90622b216a7ce9259aaab10225361e522c0320d69b878254964d1fc8c4ac8929f98bb576f99c8103534101d1255914d48227e723a58776af0e02536991a53e8b09139c9806e76a38b8c16342774321ca7292008348be7c74c8675f7aa7f2ef1066235ec3a89a52a9dba9f4a5ba65acf03846fb603cb1e3c9ea81bac0511634174b230b5f804af1620c1b46e783ce0ca8203949fd5d7df39be7327960e4cc9bac07645fa87ff0027c9779e2ff1a2e46d166b314c5dd040ee90da9af22a55f52c4a4a64a98b74c8af093fa80491a62d2241f172db1890b2a47b8d9140158844dab223e1569cd675fcab0fddda64001e65ed1b2d7961db60eca6ff00feeff09ed57bdf4385aab270a4d030802c27f5d2564e1906c2013554b6a36fd186a46a65ed433159690db2d3449036c97e024924c8ec93c243b491093a2346a7d2faa4a016580a69340912ceb0bb9ff6db2fb69b88c5925c2d38d5ceb35f101ae25a1486f240004fe21079047093ff00bdf937fded86eeb58347072398bf3021080dbeda42506fb48b7e3aed4125b7d8fb6cde13417e495797010891a406d22d26e4a964b37a4ec193efbdf53c2a2955adb365645fa1439629b24822b7ec4207ffc4002911000300020202020104020301000000000001111021203130414051617181d1f091a150c1e1b1ffda0008010301013f1099a3c3ca20d0fc89d8d910af98842e0c631be13924c58670820cb53091d0de278533c683a1210258e06a714a8830d4f3a12c5e26cb0de26041a216588228a378588412c363ac121a1ae1084c254410422726a9518899ec21a368e3e0958b0d62f042786c2c10842fb67e82afa18c3441220d61e1b19303082323422c489e183c34e51312c4c0d7c24c634413313b2c4e58984e2fab249988d99f811959782620d1a0ced90410982594bc8c4b8209704e774084ded8d3d33f21f90da6670a26208d58921141113130a152c09d7c994b9687b89105f1213937c4ea7c19da2c269aef09108208730b4d0d0586ca28acd8a950a21759a36309d1629468a2784cb85f8cc6c0f1a6124945e26935192da1226121c129162877114649208121743ece874c3630c3620b313c313c5184e885f11bc0c37863442d62f2cf68a252bb624930431f62e0b29a177838cd062f0a513c1b2e46c6185f0dbc2c5f84cf6d1ed66931d588676e259684c1a32941834f8a4c6c27c509082f152970a5e206f853e07a12d1a1ba28e175c099442702ec6d620964709605986cb821098994a5e146f07c52cd178b7c615f7f06668a61d07d618bb1668b170786d706ae0454666178a104858bc88cbc4c5294bca090c4ab9f12d91d86d70441e28b0ba14825c613920f8261b1b2958ab1a78a5f0c2658b57e1ea56c2ef363ec7d71a88194c1217918f02090d0c6f09646c63f0a2946f3ddf0a3232ceb13c1b431b0d96509b3646462413f34e2d62cc836518bf03bbf0ce50b56ff00f0755ecd8c4af58a719a86e8d5c08a524482486b0bf06717841fcf3a045a101a2087d0db1743ef0418842cac41343ece9e36f0a2c5e4c4ca544f84cc27157922ef87a551bed043bd9d0261090d0d106c9a0f196a1f63f814b8ea2ec4f9d2f122e44f146ca3637898543c2107c12c29132b8f4a1aec7a81228d94a3635448c8417d9a4195144241b2fb3af04418f9d4a3c0b0314a314a2c2f31bc2b12e2f826cb94213170585bd23bed1ea2932944fa3eb08548ae13d895c13697426d6c97eef43d428f18b27165618c4c52946c781b294a5294bc29782ca8d898d8f8a62c9b132629d2d7084d0b14a36366c5b8f0495bd22be8d0c6aa12288ecec669fcb128d036b26d8b28594d0fb107934be78242421861b294bc931614106aba127b4238cb213d0942a1087a4337a42bec460d971ab1690b59dd184d13636b0c5df02c36881506b652fc4a5c97ccab10841a686c88bef03a029d8d1264430d96886458535b3793464a1631b62e8637bcab28a29b23635b279e7c64209059df4f4257465f608b4213d0e91452bd0d31a6310585a6397b632afc1a31ea1363ec5a0dd1a18c420824484209bc3ff83484845132e174c5a0513785a1745212a5b2cc6320d108313a858c3ec7c56858d07e6d8bbff8284262945b181289429288d284e09922ac56c87b34ba4355d0cb6646b62751ec686753b1d8666c410dc63d4741f62e6d57f2e1084cab9e07b109ac2420a274412a844841bf43426fa3b10d7a6885ae1d4e84af1221346acd4317627c12cbf96882284272854d2686a4116174374c169c18304ccd13ecdd209deffc7f92898de19d04a8dd06a846e85d8fb2543ece9c17cc982090bc71ba36f88b0353d85ee70969461e86d9d1d060dd3d09970f6c910c93811910d43d5f3d8508a10842781b13b81468c4f593ea6079a349b12f4c4afa0b5d686bec6c18de13c17747d0cd43a8269aa8581698fa139162af870411582791b126cf632a6a2c25b3a0b0c418daa322968a8d898de531212610d6af58a63e842e87d8c74108820628a37f0614228a13cf6c5761b5a1c6b787d08209883e84d02e84f81ac762082c22a5cc74869e989b2056cd89365942090835e541604213c14a5c294a24d975588e4f47613a8ec761bc10d041747612316a1d6d94451b36c484161b3a1e962e49d2b23d9eee8adb43eb82f22420842791b1bc2e470576c1234674c128cea51f7c0ba34c3034cb5e869e8a62a104b08a7fdf716937c539d1f9818e90edd85e34848842139dc1878abc4e0e931ec388ec25426c7d89706de1b0b51a06a0ec3d20bf06d1da12425c29d477999db7e1e919f484db7298228a138de029591f23420f2e3ec7d885f67a17787619d8e82c6b3b628426c624f68f648292a1628c26cc7d9c5b424f1a6daa125a5c261058a139b2701098a52f014685835633b61d30fb3ae2f6141d44ca85a85a1b051ba5a3e84110f69e851562c7baa5c15d8c72e7627146cff47990489e7b83c55959728585842e861ce84d891e1d8d18de2424c6b46a14adb2dd745ac4d06e0ee81c7360cd02112617d86b521fe0599bad8d2f6684fba250d7b20bcb3c74bc9a1f8a944c4c7d0c741ad0fb144a848cec2d0e99d30712d896c31f674c226c5e87a3a0daa699d86c226295da87a18f78f40d87bf35c52978528c3627c9e266139d28e2ec7d61762558bec6ce86ac6d0a763cdf5f43c31d0734529fb1d2a6819a3e97f4ff0091fcbfbfdfa1255295c7a294158925f026694b8566c8c84c52e4b884c5f139ec613146c5d89b18da136394ec36dbaf8095c35468b484bb1d05afe45cd7f43d33fd327aff00c637d21a8497c2a5364c90842108318f85297c444c36c83462636863b8a3c6d0e0d904b2c82511ad2197a842922e2f58a5e078a2e28a42139d18618bce082c1393c762d46c37468c1f62eb0ee7c6781b563ec7c51a8f621b7d902785f25ce94a51b2e2109c210484262e6f06511b23a66837476c2d43374f241233fbd2fd3d8b4e8d2db379ff00613f13595982c52979c2108421084262e178dc2972fa3b0e35a20cf636b06ebbe4611a84f48ba7a12d0ba3a2173b96b09e608be09e0a5294a510b83f07a1a1709bc5e2631789b2e0746e74ddb1a6bd8df70eff008fefa122f1278784f3ebc14a5294a5c29792294a5c4c4e0f05d0db109a3b1dcd50c43cde2f43d8e941249f8476b7ec257f63ebf91a93ee674f15131a1a10cbe684f2a42441ae10ec2e85a674175836cea8796f0b8b12c29afee228fe9fc8cf44e9090e9e268a20d61f437ca94a5c4cd2f952cbe2871e98f474c533799b8875c1bca4630e7f98d0bf7844c3929742509e26b0989ec6f43e862cbcc12210687c5220d108421084e50984b04d9d0676c3e961e12e3787b9f485f7c75fc9f65b3d446fec09f91a1a17a31a87a8c4265c42138b4417c010a3d00d42fb08123e01d89ac8950d77c5f15fc65dfec32ae9742129fa78d6a212996cbce970d09fa6590decbe49e58266509092c92d216c751d10918dfa12e0918ba12b63a169f894bec7db2201dc1090689765e0d737c1aa5fb3a2f8c9379697dc4a225d1689885d0e19d8e84ce8761f62e8418f62510e89a66c8fc0c6342d5f733d64d5d884a29b7db1716b8529df170d4bf053b133b122ecfa641a421db08784263685d9ba1a3a375836c42542ec6b67704c58ea104d355782629aeb097be90e7e82e29e1ae298d52c2946c49fd07d9bc93392fb312c492e8b47b42b47b42ef06f0c489b10da1f4331e3184ea1ac5ce836931a9ba318f67b11a0e66495654042447a3fb8d35f491bfa1ece9c53c3475c10d3c188367d8b55789fb08767e116b30868ba13c35b1ad0f0c4f131e832b8bccc3150ee6d9bc0ca342bb09d5796c88d41b6f63963b6109537db1aa62704f0d5c23210d94a44c687e1aecd50960d6cf43ccc2653b1e87862ca7bc5162994642513d882125f2d189eca21ba627053746d2558b4bfc025bbbd0f77631377fdd0fa9ce89e21084c261f3a3633a83a08582e863e104761743c32c648d121fd0631b14a26594acaf8771743452ba1b2b841747ec11475aff60ad2682927a43768ff00bd0db1781329734b97c42061bb860b2c1608334583633de4618d17632a94be36278ec21887d0cec25bcfae147bd47623a8e942242c546fb35627e3be0bc960e3714854882a1a12843148d7d0d9f9d92a04e9dc7d8c6871f6297231b1df658ebdabbfe04d9f67a0bb04ae2d6482f1c21084213308344c0dc5898422091093e81b1650dd95f0be26b8b1d3a2d62cb8329a2c36d8943d8e5376ebf08ef18ec7b897a46d93fb7f81af25c4c4ca108259140d1a0a06e36286de21304b079b785ce9b2e2c4a2db136d0b8135189625c2c5afd046084888ff00269b7649787e184e6cb28c8d24a44b14799c041220d685d887d1d86c362c4c89e20135c187ec1020e04a34593836923a1b6d08468958a4ff0000c2af64da178ae2139412c2aa0d63d313cac5b6c42c90a51b2b132e108d0d9bc92a21121b1bc4c20d21053b441e1047dac42176882a3f2cb7d01efd69fd835d3a2d719e0a5e74b844a1d849307b20d8d8c4884209131bc42108421084122978dc428c32218c66822e3b7f465f63b2df5149eb5fda227adfda429236cd2fc44270886589884e34a5468d62f1999cda20e0d0e8dbf68ac495e65d097a4497b86fe67dff0007e6aeff0081747d8a725c57e1be090bc068458a5294a529714a5294a5f082170a35a1b4361b105a1a0dfde5764d176473dbfd1f783afc1fac902a98db5f192129cae0cb14a52f9d0fc5d06c6d8e8e9bbde6f621f7310bfd1f97802a4bf02510d2c2d90be1a0825314ab078294be44c7ca08344c4e5068d0a888682b65d266ca3a13fb06896907241cd11a8f7808d7c3a51328c5297e0a1a21084ca1a6427184181a8e2ecfa0a748b7d8872e727b16eba50b92ecf4a22b1b4956267176be35f8a87c21308ed72a52889a8c6931847d9a1aa884fd9d386698be847b83fc85d5d6288ba43ddae85f058be44136271841214d1378bc9f4320d21b430edc4b8af0492510e64cdcd36fa7c579bf02133dbc121321acbe063a90eb3f2c544997d31b7242644517645ee6582ffc914913efe3421084e731314b9794d93069782130842108243c151b88a176e7bbf422a1b4956477db148ff6d7fd8f78253e0dc7ffc4002a110003000202010303030501000000000000011110212031413051614081f071a1d15091b1c1f1e1ffda0008010201013f10cc26165944c5ea354256523eb18c7c1084259a5e4d8f0de146104f0de12c5f45a2c6c281b14350a84f8b706114fd7637883e068a09628c309949246596198c28528de121460d8989e6e2970d8cb142f24e604b2f0b139853bebc2106b0b931a21a0f0529486915fb9b13104ca36513c2c24228c20c33621a46cbe8d16520b8d944f12fa2784ca51aa2464d068341e2a06a86bd2114b8a2c17144c5b10d228c31706f2dfa8869828d972dccec18d3c217b91f011edc12f16878261a78a8af371b36243e4884ca62d0a51f1987ea22f34b059ef7d0c5d47849a7d61b294618b41adb12bc2444445862121e6104841c0f1082c34321084fa642090b1b61b6dd7e926d3a8be98de58b0c6af09e0c3145143628fb174761f78484104861e635843c4106a0c7f48960412c212b1ed5fab7d320dc21a436db261087c5e1b674e06c244e108358244c890820fe8d2c084cd7ebe8d9e146dbc0f41e1713e0e741ab880813bc29511c98d8c3f4a10842138812e12fa1314326283b616172cb96c2d04de1313a2a51bc0df2134f8b1a1a2109c20960b885182304b8d23dbe86b190c7b477c218f2d6662984df04e6066994f02c54a363c4e444560488427a0d886e2bf46ba34674137c1f083c30e51a71a52f1616194b84848841c2accf4694a4c3cfa3ec1e83e86ca1379b98c498d06c7ea216061b1310961bc1890bd4825f4a54544d4606a8f096441111629560d7ad78a78236891084fa0e8bd7a346945177696a9ae8437164824263631450db1b62786fa1bc90c2faf9afb643e8a170d1d61ec2c6e1e1e5e28db17468fd34b084c4e486cb63c5737939c95d0fd0ec189f5b1beb43ec3c3604c58a9bd0848c42f07d8f30843b9d06af384e264c8d620910484b82312c528b83785b2e5f1ed189f03c90c82144c21a961b20db5424a21bde0b95c6f0843178c20b80258824420f02c84b0e46f82c1b6122658c6b8bc3704bad9f159826654f318c1b1ac3f81e9534ded9ae84d824630ba1e10bc1e50c42108242c09108421394270794121a1212e4f24b14a27ba454a6c642104884377a42037f71be44621698dd62ac168dabe04187d0bbc21343cb1e5f621859109f4146c7b12104884e6d0f0b430998dbc319c0b07b0c63934320896d9a7435f441226362931a6f43c81078cba173e07c6118826427d2cc109eb38862944d892d6434880d96d90684cd61220d61152a1f6694743a674175842c9820821a2a117fa330c3cf558d1410c1c7436df64c211e44d1706c621ed0aba4547c8dd1233a8fa1ec498698d95836528dac2fe86d8d8c834421d90eda0dc87ea778686e3448f81b1b28de1313627518ba1337810bc58c83ebfa0d294b88418b0dc60e7d9bc10876e2c1c9b7e44cfb20e21b5d0d428988ed98858518968411d07c2e53faba52972be30a512831b6528c31d0d89f636c68e84c6c4fd042cf39211d8f69d2c0c7d9d4511e06b85c317d5b28c314a5e28406db6c48365c3c364362791686f14cd9b152e87b1a10848ec3c668a7619d861743ec5d1db83c5faab83637e9a8485d707712a8d18fa825d052ec4cd9a2887ee1ae18d0909445ac459463b231d4eff5ed20618a5297d04883ac1ed09943a0b7674f0ae98d46fe3290c820da9846e10b069a718f03745e6bc6fe8e8c30c52fa891d1e146ed78b8bc2635435b1a82594344c7676186b942bdf11d5d8cee2e841094b2f182235f437230c5f5d3486bd213620b4c2084c362d1084270db12886830f1a61299b61976d084a4c369118b2dcacdfaad8f2297d0842108420f44ba1950ea3d33a0b262e1c7d0f50dc6249ad7054448780de12a779de210ee35068fb1abe8f108d762658fd46c618beaa42442130648774c1b3a646f47620bc0fb1ed60a6d744a6ec5f3210d10cb1710f2fed88690d89b4b330d5ef0de40ec961fa6d8d97d2982c898bc15c16820c6d09c63685d1db0ba132db16d0b4cec48507c9a874c6d8df048ec3a44294b8d75c2f1ec91ee8e95cae0c30c5e30992111572052f05d084d0c7f05d9e30e9887d1df81d2376368529f0151c73463c4106c82641be147b1abf4da4d4621bd39930f052f3452e4b9842132429706a8f23eb0ec212d1a3c5683ac1a20fb1aa87a0e21b1a262ae12df235898a1e1a12cfc9e6c4db684c9e0487fdd1fa730c52faf380842658f0f0d9d8620bbc753c9d444c8a27b360c708977d89443ec873446ea7d88aeaa11ec95ff0045e4abd1b023fd69d609bfd06cfb626c4319b0ba22af56fa709c5085e9420d105d8d1dc4c5d1d0683ac1bd92a137856e87a412ba3b609b4a2f23b6f221bba337ab685ae875076c8da355fb8b4aa13823cc1ed3c7ac937884e30820921a2666171be8420a3e85de1b42718d4424763a0bb1e6ba1468486487ac5228c73116319447ea57bafe0ae3f3f3dc6c7f99087129487431fa6d132cbc21084468a8a5c421084c52fa9d4f18b1c43c11dc7d0ad7a0924a21229e61b83136b686ecc29ad0a2798399bd3f36843fdcadafe50e13fd8dc36fd1795884cc262970a52971442e509c2f014a5c2eb0e834288262b0425585842341bca651a6c43db2a5db293c7f91be719a8d8f9ac41ae2c852979c26097a34629792c7426c7a1ab1c4268ee5212e0b45e690d28ebf34228fee36be1743133c166365e6989e1ac2c36865e308421098a5297851b1b2fa2b0c58c5b42ef333a78d179bc2cd210f8dbfd7c0d7afdff836dc44697bf224f493161a162c3e06884273a5294a5294b9842718421329b174209c65961042453921f06cb0e99fd9f2c6eed9eed3e886bed8bb0f9c1a1098868684de1d84be861084c31f05e87b1b9380b5043f492885861f81f88efba45bb747b30bafe46ad8fd083421b0d0916b94f3e8c2108421084e4c842131792d106b43e16c10c5998841895168b27b686eaf2c42493ee26f0ceff82e9d484dfa170d0d41318685095ed627d53636513e3ba18d68ec3ec4268ecc43eb0961f0ec4836788a5b7d8806c352eddbfcfd867ca77f493252031da1766cd0971842138c27aade57063145d09b3b0867988f04194ef0de121b20d9682a5f01d9f67f3e469712e6fb1d17d24f1e447804b625a20f2b346ca5131716ca5294a5294be8bc53d1d8474c766236d1e06f086412e093aed9aefc9fc1ec8afcff0087f08ab5f73f81af4e88274f2229b134e0ba1adf0a5e4994a52fad4812103f68dc562171d4bb3b8f23c62cd1df09c5b676df5f7192d7b77f9f9a1b2fee2b477e04f46c6ee52b84e3084c20fc90f4c4b4c9f54d112368d792eed8d68ed30cd9131a354791a2e16cd96662f187b4ba7fb367185bfb8c6b9b87d224c43a16109c1704e13d8eef37e8a8da10c0fd83615bef0c63ec4ea3a1d8d1dc5d09a18e33c0f011d31b0525575e8486f2cf6c9f9ff0f3bec7b10bbfd7ff000648224d7421ef2d72210b18b2843b93e828d10d7c0dfc0fdd2bb320bac3165a136753b899b356217431f637a13292345218fc58c68f9ab7457f1e4f7e1fec74361e45d0edf168eb02de66069a6257048484efe4531af528b1037f086d1d7d90e862eced60965b28ced8a9b62ec41ba20bb12d090f191b21685bd3379d85d7272522a9ff00d1e3b98b5fb043029ff00bd8edc5a3a2077c284617cc43421743d8f49618e8f90ef34b88358427bca18b82ba1f2878451743ecd1189c20c3ba091ce5a3b7490daf85d1a8f1e443df08fb7f7cb1daba42c7c52e5a1a8404a5454534c6985684d9a7d1677c313c2c52e1ac2e8f22c21e50d18d446223c1a1ad89888c41ea1bc106347294b96251d3126dc767fb8189e8f2c52bad7e7fd1c984dde172d0f0a52945e0b62425cd2105e010c425c1b19d07d8b088514cdc4824124910d0910d172fa43ef227b1a6f13146d9257d8768dee748f6edfe7ec3e8fb6346a0950f1314b96868988c8209085c8082531012ca188d904858674c1093f0228109e9a435999ec1ebb11741893f51148416cfec0a155bbdd2f61ad092bec95d0fdc5a8483e34b982425c1178dcb1841f7931329b651364298d43767b824441faa8b6ae45d086a235d14f02d8bdc44267891ed87af9f91b174bf3f73f8841e47d8d1080a98f33825965294a52f063c1b813de08c624e96263dd122249208b131d7656faf4189f1429506eb3a0bb20d8324ecf224907427a1c84f9be5fb1d7d5f9fb22c9e17623e4f036ded9a2bec7fa7fd899d8f9a788311944cb8a5294628e477868a8904a41162e47816e51512261793448f94a483e86f08e836d8362c16fee8c3e58dbdd600771d21aad7437597e7784f0f84ca085c3585c26597624da182416297885c28d8cbb16a40970346c582b98265564d192d0d6e3da41a0b74265a2c23b3b1746369e174308bfee8c91f05d3fd3fda1e13e6d0d62972b0dca1b6762d334081ad8856859971084c21041a151083420988420d062b641258b85a2434643f60b4ca2c2b8e9e2948ebecb3c1e4dd8bb3de01037b0b427b6db37b5f1fec79a5e7084e28a41d08b2941343b1684ca24258a52947934684ca528c52e46e909c6512788289958bb108d92616a3e57f9373bbc8f484f932a676bfc850ec75f1f036199a5c42109ebce0c61c28cb852098ca5c4c6c8c8c8c8c8cd90d91931782f24e0a68c4c51892f0cd0b194db4781b6f6ca3f07816fb3f9b3daa75fc8d8ae87527622dcfa345c41b83ac4262628984c22108421084210842106b996ae502b502048a42cf6240bdb087d15d7d22ef809bc47bf9f811aeafcfd916fc7925442c4ff3dfe9161921bbcb6531158a109e9c2130c5c6972bb3b892f7120828395ac217dc14f650c97679f847e36ffac61f2ca47e3f7361ff008513fcfcf23f467a632ddc423c167427a8d0b852946c4d94be8278a3426d0c1cb36d213b6375fc9ef36eff003d85b0fb0ab3fb8eaf85d1da7b971fd142106882c104b8de17d06c4ca52f0624c94b8b85c02f6049d8277679cc8700a94de0bddafdbe073dbe88ec53e25dfebff824d9761016b4fedf414475c271a52fa57347c697109b270825841db543174c457ec6c2c75a13fb1173df089a3a51fe1053df8445e67ec746d9f6354af636d27f4286cb9a52e6109eadc0dc694a498a8a4e5a34213136236038936d970cd3d0f6e7f72abfb0c67d8c4afd93482d59ee3e89eba2970b3082e14a5e54a365c41a239518c2245cd0844d8a3c1f1361a6662c2b688a37f71d57d8d93e91df74855dfcccde90fcfd0b12c2294a52f3bc2132b2c27a2662cc261328f0d297230851b425784d1a68e847ee17f93da85fe44cd021bc48647eebf6420f5afcff00d6254a56c9f4131fffc40029100100020201040104030101010100000001001121314110516171812091a1c1b1d1f030f1e140ffda0008010100013f10081d04368c6244820521d434ff00caa55ea652aa1f6904682205c226cff854affbd74b40bd15824c42a118046742fa02cb1c7d173314e063b3d22869257421680f131622ae8585f44e5952abe9254a63f820148b8460210aa83b545342396151ccc03f4baa8c97144454fd15d2be8a95f458c398202f73074b4e607bc0adcb623370b4b3700218452e082f13c32d661f68c22e679c879425aae9c25cc0a6a5989bb515d1e28b6cd4171504cb4f14a97c6ca0bb213a804a9500e88600aa9736114b08a37d414810225d62274d7d35f58d4c22996dc161e5125d4bfa4241aa22ef0500e955006201633295ae7992d267b230ea59e2570090ee00198132808500c6ecf14c18897925dc468d41d8443c610812057d17d49712c119210e0825d06598a1031046a710943d6beaa952ba574081506ba0824c906f1146cea350901cb0acb3b444a1eec234cb01af32bbadaf30394a4482c37895250819896564be51350be09dc378947100cac32711061dc0a95f431266fe8691a46169135a953a81e8a808465129eb5d0c14b78094f1bc5d2b6d7821cbf9221fd4c3ac0bcb0a950c65575188e08993282285dd4b7999ef3e7abea7c4484439d44c1054caa61d5a88824b583370c42b6084a9920574b2a28462fa43f531831d161b99ba94433025462a87cc233275a40a1b7a253ff80d1c4bfa1cb52bc4da47b85328cffa7bcb215e6398165aa0fb421b62819665add4f380656565251da2114205462b193b44ad74c23cf46b1923995cb5b8c88a984e098ae6dd0a198651d3640594c0ff00ccc481d15d562a953d156ca8a1a1cbec43260501f572756392270c4147f210894a9476812c14318b5d31226109bf6978c93bc5ef129b816a4ca7881ee92a17159d4593715da3c79616e66196332814e238388509e4e88498ba81ff000b972fa0cb972e3484100e65b2c7a022cbb5d07794b3d9b5f485f465f4be98657431cf64bf79413886654aa8cab9550b12e318ba834654253e44a10b8ac32ec58b8b7d2e089796332b5b9638852692d162f665ec58e95d6e5cb972e5cb972e5cbe8616525c4cc55b8abd3d16c104723f3dbe9b8352fa1f45f4638fd4c4304055cb042ca99886e1cc5675628b1c5ccab1f24351b97a0cb80845c471610a4fa01750ed46bba829b8b2fa897c1188832e5cb972e5cb8c30f9c47780bdc2dcc41cc49ccaf788730ab72f8f5c80bc9fd7e62f4b972e5c1fa6fa2d32ee123615360eaafbc355128842c1512bacb8b1c3e80c2850113122346a25c34d4c854556112a5e84f1286a22b532dc219254a9508a51d33ca11efd1edd098273113cb1cb733e61e50a9b8cea3d2aee62c5ca95d2d9196fe388b2e5cb97d2e0d92fe963195b98ff00c20e8c0b8a2d347a6b30ea489d0224e096ee1c3aca897086a02d844196e60890983c25e8d3a58a209813098732a732901113cf15978ecb4b972fea0986551c0da0803c00511732fa5cb97d0698f73aefa31e9dc053c1e3f32c770eba57de5149c4752e98612e5e2283a6e3a8c12a32c0fa150580813e8b09b262f4170b90717d4973cd149aeee34dc5971ff8168430c22b8297b9fc4e25cb972e5cb972e147c47bf12e0f4a952a0b38fbcc06320b17b3c663bfb4da44b60e3a086babd017897ed2c32a4a5962d70cb97d2e5c25c597d6c259168c4c331cc18d1cb2edc440528465c77ff121484592fa1cdda4712e5cb972e5cb97d2c62b104eb50f3879ca223c98a2e83ccc8ab0d97120450bd8ce64492d3e659b9cbd4665c6e565094404a4085de71dee5c1798e5b972fad74b8b15b8410e63288542a25c1625823a978a625c562aefff00c18ff8ee0dcb972e5cb826888ee1ccc0389476fa0188c0bcaec195e08c19cb29daa2bf9232dea178c2668a7e3b416a206360dad8b82919980cc35dce18106e90181a9822ca86a54cf58a8c11ccb3cc480a8b0f0c38b9e3e7fe291c4ba842239840465741304596fa6bfeb71e51065cb85ae22bbc4171007d2a0b503bb2fc78db7e2b4bbb2d5fef50dbeb111e2c370368d03c7ee65212e83c304ce2cd02f24c30e5dd91bc4ed08a19418f64753516c6318f467399333e2229393e8b972e5c597d5090b01ea5f4ae86a0187c75458826e284592a54b76e84ea17a9916186a7a4bf4e22c74672c1d095f478b94317d1ccb147c53f339fc4c059ebf9871f88e39de153eda96340e712d28bf24be8afbb4b7bc58ed807833b95348a64a8c211000b57c47204aa0537ff0092fba963a6352b0d4751dc352a241041d014652a386bea58f4862c4598ee36107cba49e6018939e93d1dd1dc05e20ae25442639836006a008b185a5883da198a95882151d69045bb95d2a0f6aec4e5e8db035170ff008b7fc4611178bf9eff00302cf6ed2d7e62e91f3897a9a7cc72909c0971700c0a1e253c3a1de546e428237ba8dde02ab57fbff20f362c5d7bd7762bc19b6dbb8cde0fb4bdc465c4fc91d897d0b12e31e8519a6e272778dc6bab1a4670ca9879c0ef02a5cc22a465572d18861be82ba6c85b15db0c64954ae5aca708d13b514f408495198a297445b612bbeee8e8456a504aa55ce3f7bf431e725fe9b4bdbcae556d84d55c0330b40b47ddc5220c1c12fc3ba28afcc0053c45982a54f36fe46be20b72a1a1701a63730dd161979dc6305898e0a1fb8300353b440762863cc4d9687f32b197286f961e83e830411224bad7484b2f9408f71c65ac5419ccbc6fd0c5f5b96972faed984a20844c3830eba4ca95d058d6041080732c99297dc6441caa95aceb9c6f5b7f132dd0182ed50c4be3589b75a944cfda0fb789dd3ad45eb0e1d8ff00d6357016af0042cde724fb019fe08716bd657ed71bf2a37fb3f89750f922fec5c6d2ccc21ac55c3f8875d8b1097cc5132c3279232f5c566234950a09bf84cacb8f4189b7463d47a154b8c3d17ce32dd8e116ff00ec459086304a3a2cc191516fa1d2a11d3296e3e72c8225b2cbf9546a5d221d0d93858dd28f8c4063ba5d948e45e0ca72d7b710fa9e0dc116cf66317f84aad50b97948cd70f2ff50fa4ab726932b8cea03b44aa187fb845e430187f7fc45c15841d17e7518452d8909ad72ce40369f07a81d3241c2662a2a2acaa8fee609e11eef33566594b5611074752f3d163d0911ed3b094906520a29e94f47ebafaea0c18525a2d2d17ad4aff0080a41162cc0f680ca19d8578ec9f36fcc3d538036c5902cd1fe657811d9fb71f68d3532c179f519f08f7c6189eefc06b30c98ced78a148bb5cb08e2105317334440025dee29caabdb7dbdb296b6285f7dc39cd76f75818d18ba25baef069ae9190e1957129858dca7491da21062308646af308a9518bff000afa15f55ffdc2d96c120204c4864eafa77307ed9f8871256861321fb547ec2df01dde37a3e7b4a9ca8e47cbb60be028c8073988769c42a0ab66dfe1b95515384a976eb40c310ed32552eb772e1c0cb2b2d5f130b7ef109d36eded05e84d2b4dfdefe2a6c5740b305c34ca141166154657da307bd1b5b7a769503e21145ff957425fff0092a5b0094085183cc056e1f286cd3c23c918aef73cab47c67e043928245af8962347bedfea6300f33966511259bef095343e66448a8ac2ec84bf289f1b37f84aac394ccb506d6e1388176bf0f996011b2ac8c2ae94eeee59ec56a2f829b92ff57de0455066e2950d44ea18c63be810c7cf8971ff00f3d7d552a04b4bc1c0a970531947717d5c5089932c21604bc393f21f7633b9c45198a8ba0f5cfe2010b69126b9e21cb80b5a3b7b1eb32874f07d2bedde6296d28cd46b2f05d6be2161bd5383c911646702da4c3f923b8bb4ce1dc2f6f6b60a8bc95d91997ae2385416f9687f2fbc1884e92f4810b9c2c7241ae8a89120861214fa2beaa95ff4aeb532eb17e209e20d9e08025222262618ee22ab602a09174dc7b4a9b39d32a16e77646cf154ff00332116d7078d328351dc4f98ac08452efbc4617abbbd44ce621792315c8059f98445a429ee7d71f7881612678608a6966c940b19b55ff620a5bc76aff5c591be44530047b351a12c635dc7996c614817094c35d49f446eff00fcb5d6a5741704f4c080ed032bdba18612582516731ab6ee2c16a344cc5b839a86ccfa9cd7de5962d1aec437a438a3739f20a2f44d0406ae62e8f921ab7c172bc69e8b0eebbf795130b516193d3bf984a8aa01a982036277a7b40532a7ee23099bee9432ff0044776ef02e3b351107691b3d5f7833d01502d46fe6961d0acea7a074b27ff9aa5408360e513c702a04204a9518c6120d2a8e465b73bc78b846b98d6c2e078b7bf2c106a2a777fd529db1816dfc919fd05b4ec1e1fd4572d2147c292dc568621b1604b66c16be9811cf9003cd0144b2d762b822aa153d404530158e4f8843b60aa1ef132e5448d2852dc1c4f9898963edace1251dac57c310f169ee462d30584dfdc341d0f12e3d12e0e84cff00cebeba952a541bc43b5158040f6878420e9574b8b162c1252a3cdd161c4dd3685c2871594b79a7f130b44ba6c94f48e6574aa261523b3d57787ba066b2d6a0e40ce89ba2deee00ef9512c04d253be20d72b007da7a20975cc0b2f2bc107716ff00f901e24b10cee54c6daf601f87ed2f6c06e08ca8349074396afa4d23cce23d1889eb1cb4f4a952bad75afa2ba54a950b4b678a09c4076807454afaea3894a76e2b8370b5b6073367a461260c084aae20369c18a0b766113167fecbc52adc2e4ff6e58050291fd47e69871b891ba5341ea2bb591d9ff7996a05f278216c8580fe59876035815ab3994d45ecfb9fc331a8e367c418b8159751ca558f4e3f67e6789ff9808362526c9640f0954c8d40f084afde57963d8897101da3b952a54ae95ff0a9506f106c578e811c4248aeabd172fa5cb8a4492a6e0b798a9201729896cd61d5043f735e80a650d18acba0ff0070896029d3dfcfe666ba5a8eedff00f23f1d9c37778858167ad78f5190c978a62058d0b2dbeaa3655ab81efde580d0c7017fc7e62ab92afc7694ac7d3322889afe25f00661c7b7df079614061d034042d668868535a186256ff2099c1bb885316a02b71ef447113b4f0627cc6cdbfe7504f111e3a278c0203b42410eb72e348ae8a9ccaf79ed3da34e656dc0351e2934d606094b04d5c04351591591a2964aa36a5b19a7d437efbc5a74c80c7df98182a8e6816bf99b417a715feb884daadc8f6893528ddee1a59ef7af5fdc0000b437e25c1f345cfdf98aac78db3235f8ef140e80ede3e1cf994252074653d484f700e07d31cb1bee6206c780b97341eee5558ec2a69f4122472faaa54a952c9e080200808128e972fadf4522902047a243282315788a8e9defdcd84759991d2165c2a304601e81e12d054d41118936258c7b10a33d6bb9fb18c668b1a55339131958cf87b4556d775c4c4b02bc4a9807bdc195ca6026fa2d80f6c713c99383f81c79f51b36cc603e254d4bb02987d67f72872e7ccb1a4f06231a7b32a78e142e6599f97ea6a27b3863bf3a98fbc61e8133f554a95159dd878cb4bf454a8cb83290094ef04e6271148b652c62a54752f5898262826619f3d2ce86a0621c43b21fb198cbca958d30c71411636ab7e9c434aae0cdb9af8a4f52d88bce488683ee65c68962d8060cc2caeaa6494a47db81e5fe20120800c07687642d0445d5ebbc7c979a7d2e3f13d4a9565259e603b078724b73f6661c0e7b4cf32ecad9e65fa94f38ce5f8cfec98e13a191f9899fa2a0d837888c08071024a257441111f28cb0265916e979f5032844401195d0387a0dd96546a8311db2b3704a9641983041c61a1db0a60a3c915912803c05777c4c17ca3ad85f8b29f0b2934f7101c2300f1123557ea51620f52a974454964ab4795e226f8329be6595ee51d3045d43f930fddc220ec1f0425fd1bde664d3fb98767da1d86fc4b8bc8fb122451b82ea0983788bdba03da1d657d0cb5f436e6520603b4a12c94f12be3a4c111bc531160996881a825897298b1404c26095a82ad3122d620c4b962bd0cc7de392d8622c005ace111e844a1ec978dc5616347ce7f709c019a6070394efbaf51bf0262feeae60b60fbc6175fbc1abed89af06df8233a8aa1eda8e07f7de6001edd23cb75f8ccadc862ff8d446007b653fdfe20671d259f795f398589a7e5607dadf9261f599e880a41f729367acbf30af2fe130eb30bb41808454a952a54a9518b2a3d2e20888f6c5ba56ef2dde5bd0842aa520184a86c257786a089471188633560b9324aa4a901496099455a9380b9b860cfe9102f571c632a099d84a36f83cb0337366356caa7a268c778bbdc535df26df947a96377ad0781d3e4639041034b186de19973875497961f8801acdebbc3112f2e6fca4e77ee057a961d17f97e63888aed16937c9b0fd45b56579f8faf3f337e850367fa8f013b4b972fab07e9a763ed290faee5c49025cb97163041ff1b841d3db03789881b6684150e6899ca096b1b483286addc89a02ab80db05bfe47ff20740ee9b7db080765b01cc7280575e2a304d0d8b7bbf53f843d544b10a4008d240ac77dfc4089e28760784d1f30da03c34fecfcc74bdc17f6ae3f8652b60d1a5ec2e9f0fde60605536b3b76bccb18a0a3cb158b9ed280e773ccabb9179a763b4b979832f3073065f45ccb25e3abf56bde083d905070fa013de24e82227306be80cca24a952ba95f50c481b47095336f532aa9616592692fb4777389a900560f611863be16fc7689a5f082c7011abc0ba3a1d703378047fa259998ab1850fb8ca2a49f74ace09c17282d5d7755fa4dfc93610148fb4309e48a361b4003c929ac06c5d1cabf4c76bd5caa701fa3c4a1b0140e21d463f9840063c42067308d2561043a8250c024b8a9dab98b16ef295948d129186187888df8964b4b9324b7aaf48cf45254b97f454ae95323a0b882c95299350d11449843313a16b11961dbfd416278c0430a6a042d98a35377bb95610309281860136da317065bc32e9376fb426240e7b82b32d03702a794a94229c2df050fb301b1c68c8dd8634e228190ca534287efe60bb2cc4541867a0e9696264df406ce85cf46be1161d4e372d8caa36976104565252562222211117d035d2b65bd0160984138467d2632a0ca5aea59786a3083822a55e7a186226407822f69a47b2255b0258dd10092b1d3904a3a405646a2a5f4b999405ac83a3d995ed135da607d87634129d250cbfb149f32cc0901c4acd410205421b898e95a328967315c770609e4f49b88485198602ea100819495d6c88888273022b157a54ae95d2978827a0038808013131108918cb14c5cdd308785cc912863b8da5fbe4fa8b5834458b98cb3a96b027475d1ab88ca3abc4cb8dc5eb213d8d1098d246db8baeeff1515154c5cf61e0d1f2f3288089f2252fda0114c4af50c7a6aba8e61a97c519753cf06c9bcc8a96428f28ad0a4acf1050b9eb71111186585c53cccb0eaaa24a950e80200983a0430f46e2c58b0425218654743dce11cdd05ee59bde27a9a458b1ee55b2a88e20b628a314b0016c3a799c19fbe9fb902c95a09ad1f9e8f17de51502b48aeb943fac1fb6121c20ca42ba54a892db83cdcab9cd2a61465b0f2319b23c929b215c1c5cca6add17165dd5c6595cb63e52995f4124f0ebfaca769595944198f3d3765b063719875d6fa0b8a3a41b8520b661260c0cca83700178541b205b1662ccacc66244b88b89998ad8fc8307b8a2a799852fe683e44ba762430060f40410cc7d06fedfcc2ecb2b7b72673b87ee88a12eba5b12d22e21472c271009d034ca186e51b354148ad974b404abfb23c7c4461f4308ac72804a3a5cb8a444447a0b161b8246a62522e3ea4c4c1b94cb861ccd21a730288a17b4598eeea2dac0b2366e734c940a8e22dd0e25b02921e4021e96e7e0b7e266aa8c9b457d5747c32af10d1c8e5ff7881595d18fe0809295f00aff001f1ee53bd015ea2a832a24cd4b4bef1ae8052a1b0c66a5a2cc139cf484a5a9a62616e80f685a12e5d745c753987416e61ccf7ebb0a8a65bf55cb972e02cbcaa95d5312f51c3a474b293106c0aa372cbbc8cdbd479a9620e260298f232aa04bcf4123298534517e5fab6207df8901aaf33c0507b6124b2ff15fd4468b4729e5783fdb883a8ad885dbe5dcaae687f1060c53713713c4b96e461e08ca5017304454488424a1ae199f65657fec711da38aa5cbb80bd1a4ae8cb972fa3ff0a952a54a964a652ba15d42e5ee7f082e0538f49b242d313f144cf9a62a2b8e2a19159a847e62328b48aa96331e58ec5f30c5c56ab88d5ab5c23907d19fb419015be007ed876f01fa5ff0bfd40ce983e5307fb82104b9adfda6502a2832e273b8ee0c0488642246c820b9ef09126e25dde7398391e2030eb9956ef80f98db99e9c3a508f9c658cb29889f4d74a95d2bad32a54331148a32fa12c52a5e625c50a606516e8001fa8b66667267b333b31ec971a8e19b9956f44a37ccb71b97d9862a5662addf11045af74669d1e2ff008948d28d8bda97b6cfc76855d9007917f32e6da50ddc61e78f106b34081a94892f98610ee83388e20e60589c454bcca04f99df446408513441dcc626ff0085b895a35e20c63733d04c2b09af4529e952a5756c1d59d27a1752d32ca8f428961d318aa9a5436dc1c2650c627a12c5f132ce307a8dc54cc1a2378218812ee65e6d838f105dc5695856bbae7eead47006e0bf77a9c7c7783114ef294ca2f776cafc29b8e7b0f9d9f1ee610aaf3b537fa9f2f695860f4ca10e63fea960b4a2088fb970608a6a0d6a5829a80d9960b9d836d4234d116f4987f15180bdff00700867ab737d003a0f4282e1d6ac4111b8e6095f431e880b89b94982ee04ca4dc9868d033728d5430d8952d8aa87a9540eef2ac7730c6aed3b19610a4527674ca65dc5145ca5192c963896e659c04ad9b1af5b07da01d728f23f01b7ccf990a95af4e5ff00e44b3c26c9d3cbf807b4018342b181f054f1e150730652a22d66640ef6f999732e5f98f7208d5e604cb16747b1c47a51ecbc4a4e6827c95f259f30816c563dc946f12540e857559737d0043ad11095025f45088ef1240733662536997e31da2b1a4b21e6339399570f1011c2100512ee3874a2b136975bde1f98e15d8ec8c655d712b59cd7e0f24b480265167772a945c4adc3d4d42216bc20ca5f636faaef069a3bc5696bfe7ff270a1c5bbe5daf6f60f11e20f0369b7d707808345b42f300b86c62d4203b4a730df0852114adea71a8a1945848ee2cbcab94a8732c32712ecd9fe1c454462a0425c58c5dcaeab832e2b2e31594ef10e61d6a45e82fa8559731af74022f968d55703e915450247f8a2253bc6ccc00d2c0871d266cec81a96323922693a46fccd742c9c436b05c97a7b9319c97668773f64648b472cb1c46b72e602d8e109650b45b60b006426de46ddde7ed14ba25bf0bfe5f8f335eabee373eff87b6654b1ca6bb04a70385f5c113c04bb8952b83197daa32a4ccbc46928a857353b96e798b8df460cc2a0d4cbb22a3d90fd9f9845394a8c575afa03d1729012a73086e5858968a5f528393bc73353c4b72ae4b9b9286ce60e35b82b47106856a375bd710b1b70c0054bb64a05b80008bf3072370a00ee086dc350457bcc28cb20f21a4a7c7a65a60183042d8d1f1e20508dd6c2ed00a9f441cd0d188d0082116e3925351af79207e596f02b579be4bc3f2fe01a6c7cefc8bbf77e3bc0b5d066ed1f79b270cf7f3f32d7506f2951eae080f8e8ca3bc4adcc28cb452334c4b22510ab2e675d1f828095025d1db8974878ef1f198de35d6a54aeacb8939883980b5c7214acc703fb65cda0e2a2937b7283b26db533935a27965b0b02b29417cb282b9825464d710cfc47b2c61972436658bd45df519c3a86171520a58b0200c8ca4ac21b96c7c452c188725595a89c91b2a0854e7e2196b7c314de19e65f30de78883db2bf062d6d5e03cac68326d6c3fa2fe57cc7321d076b6b5958a1733feb88d4e57bf763a76fb1abeadf2d1f2f3068ea9505454e928f118acc030d9198c91229528cba898ac768577b8d4a4a03bab98ab0f9255482e4412de2212fa5f55972e5042dab8f2e094738cbb756f40151cb1b60d4b1598255d5d3a836aa57066130fd115d41415a371616d4172ba9cacb82408a8788d538310181ef2a9ca474c70621b148c18b0bed0556525226a3d0e196aaf896d0c1789ee4b43e34c306f6e86fe25947dc707ccf98398d9730a2859ca028f9135a90590783e0fce59dd814dc3bb0c2390f907f6c625082cd6d0f2ffb885d0d579281e80fde3ed0b3f6823ee212564a4941b97b701de617929ef2e1c887e503c310ef05a695402803cca7a8ca181f68a3c3897d2fe91104446081c398b413226a364b285bb22eedb12542d6988583ed00aaca862406e201960847dc46d8220a9dc62159e86dd97532638dbed16c0fda1b26a6289c400d1b96e56e5f5583229c7317735c4a90c5b7cab2fc4c0621c2c0cb888b797d8b29e20b1a24b6aa239c40134c9d540bee8af96048c76f36ec4e36a57f17c1294867e5af47fb88c996aa6c1dfcf4788696cb9d857c141f306deee3e871f88ec8312f309e23466b88ee5d881d301e203c44c2d0a710280a87337972b38e8218b96441086e503529be6666dac02e50dab1551cc08a25b0bd4ae5c26196014f32ac12c3882c58ab37b89dddc56cea01e10c110b88ccb8dae678540964ce0bf738e44591037481d008a7041713c100e250d1d1629978a3322fb701b25ee97ccd534da6463d121297626a5188a9107880cc45ed270465de6bdc36ff00537182be0d7b30e920d1bec7cbb7ff0020b4cac2bd21e5d1ff00d8a726d9ec390fefdcd76c14e78fd45641982a55cb6126a298276100ee5fcc0b2902e205ea542097a581ac4427f5316e05b63c0cab6cf340ac3d056a38be65e1f1296b972bd43006a1c5ccbcab7296d99a53a8b39e2556888cda4a80d405a620d5c56d08b40a136518f510d4004c7695331892be8a17016ae1b4814eec9f98a9428d7731ec7647913bf51903087a54c186141b9630b106e6654f63383d55417a8f8172bc46b8daf0236783f2fc46a09b5f32fdcbcb7b47fa0710458d4615e1eca2fe097b37f028dfe3f2434ca4a835d0844a6a046bc4d170abb96151a72c7122977110f734236752f2d077299ed0ee4a804a0542b84bb82185cf51d0c68bc444433c43db426efbc1d8768db1598d40dc7ebcc381719bddf1299412bf105ccb97f4ad42d2a54a95096699b70ee3921c2e19f05cc2045d9384d40d0b3bca82a97a51c27d9655c1280ba215b78f0a5e052b9b2f43f733fb50dc2e8797fdb844d8b4c783ebf2fe1d91aad7fea79f0f981c6ca6079781d79f59330bc8cb269696321fdd14eac4313e666149773093b555432d4b3ccbc274c1e11068881d41ed315d472e8ab65aa589422b59c84bb83733d57280cd4998805ed9c7302448dc0417481f50fb40bc40256d4bf98660856c8f40b9597ed1abea2947dc2abadf45f40b59706cbe8a92d8e43b4216c46c8ab79a8c17cc37c830cc6c4c8f2403654bf0d217e33fa80ee28ad3005d5b013186922881c173c36ff78ef1705f7212ed797e3ef103b66d9be4fc1c777e66d5e9b96dd0fb3d658406284500d0415021e57042add0dc83e20c6a5a02951311a306b72f8dca5c44a99350b0b035dd08c1c9d0a23465e4392246e70a5ad1b86d973d041ae05e3a615952c66d3858141710118a5960adc6dd46962b44158113bcb9c272b2bbde0e07c4c39825be9949062c0b61045ce0ae208585441602a388b699220c3131052459cc44162c658411825cab74a7bb4b07be11619b8909a1cdca27609e63435fe1fcbe24a736ebccfe3d1302dbf8dfc0fcbe59406ccbec2f2ff471299057556bdd85be569d977b9fb61e295f843212f861ccc598e626731ac8884dca79801cd4b61327cc15a679d0fb976475322539422d71d5a96b7114ef335cccf97a40421b894661a83456589618901bd45b442ba8d398c81963dad315d901e0c2b48a34281e70aa0bb42b1c46b1cc58a20b4611951e051ab4a85d4b32f026b9a965ee2d205ce2251e62a984bb32dd68af0e3f73624d187304cb809da5c285a7faff00c8eb229f28e2d3bbff0092fc4ab94a783e0fcb6f69fcfab7c4254d35dc78f8210bcc7d8fe2360b11f19b202442d895988cdc1e6612d351c69c4242504538884a65d4a8897b8b3710d0981dde0f344a0a515f29a231584a94688d1e500a8b30dc22a36e906ea013141a6a35aa6705100944c3a22dc201b0744ae1289444202b31e2e9a02b30c689ad220254ee015076084aae21752af64d0fa0c1367de72ae10c0868e82b3f1bfa603b8abb2361136254240dbd817e9c7dfb4d1a960dc6de5f83de0378252d2a0af17f6ca3d15abc170f3feed13c97c279f2e259979cf324545004b352fb4b07c45cc4279895ccc9cc28623f9961994d44749798b6ac3322e70c816932dd2238207180d897abf128b25c132e2a0ed0090bd04b209d0b4ef4c10061b04a5ee53a6b88c6b1948794ed669496909ca2c451771485915ab921b8a8ded94cbca7730e5c016adfb8c11a37f17fa8c6206d310669313c3605978db01cbdc3f77d31f07dc168ad0f336be0fcc50292eda7bafd40489be1aedbd9f97e23b81e455167b86cb154bb8d9f93ef3087640d1326e3574ddb88a2a59c460de079dca097512b3d35b94e9a92a6250ee504083b203822b007718c31bea64cc308caa29603298a65e2e50d44e9ae511970d9d44a454b0c2a83e7a5b4192f072fd0b71d68ca9c3ee30d7a063ab715e224a105f68e9e405e6c63178b5ec36d3423f8605940114034570547c8b57fc3fda86d9b9ca3d934948df2f47fdaf787a135e903b7c1f97e61f40c272339eef2fb8fa86401cc1941f88bd166603d4a2caf398dfa8179946a2118be62b882b9c2888ea24dc30ef3294867a267045b89702998888e3a0cc4112f45254afa0d252565657b44caf689ed2af1d20a4a56a23b74114eb902432b9dd3424acede899967b351cdf78dc7a744b7eea5657d078b898569639f245af20b572879f6ca420533a9caff0078ef024b2232da2f2fc7de08b0aa737c9f871ddf98c727563972bdeff98983d61d9aff002c508ea31c465d3a94579866b99c6262b7157514ab8ba9f9627795e188256e50104dc7d751630630b977109139847104e2158742be8c7454cd3a54ae8ae80b94ae952898964c4c41238448f82e3cc51f0a799e28f2419b60d57b9b3dcda73f00ee6b114aecda72f7f446050736f8ebc7f5e2564da89a0d07f87ef12a2e4b697af33f83d3028cbdaf1bf80fcbe586e28715eed62db31d8ed16b1463cccff1f6c40c99e8accccb7728acc4b7e6253a838c46b18b6667b8371688e7317c4e182b95ed1d7896f104e25bc454eec13881ed04e200947421d1e8135d04399a74b972e5232d1b9972e3f4831e88e4330ab4b3883e4634ea3929f12c5968ddf99b3a355a4f91da5054f69a03846a51e34f01e52b202c0172f057dfd4a3bc5194d58eefe0f997eb4e1d5f07c1f9cb1f8bb6e7b2bef1e18290d6aabfb7ed1a8c5e8d9b6a692f2789772f7571555ccfba645dcf9d4f32e2de2a53502859565425904b0fb401c4a40c075b972fa5f42cb84b8a6d1c550a223369696bd2950ca7430bd17d555d4029b466889c27c708d500de96c6d9e72bf9608a33e61c43bab8c3e403106b6027cc66870a1ed98a643f8cb69ec7e5f88133e58eefb7f07c460016b511a3e0afbfa87c6db6efe5f81ef164e86d7bbb46992d0747042a8fcc5fe30b652c4a9a8b37031a8cfe626310d26a11ef1cc7733930a968388ef700ee0605744955065cbeb5f43d2e5c5816c1a8f11c6e1d2e5cb668c3136545cc4c2d88c1309270d46df289801b3c41d70078b3ea30239d85c61b153dcc2daa2af34411a014b92dc63ef0e53501d1fd0e7bcd449072dcfb7e37da50718a35ff00073f6ef4cad02db004224ca5d2eb97ea351e2fd84b59c822f7c7f7282351e9b58a116f9c4b6b290b4dc30d2c04c24c1a8b05b028b8ea865271085a1d172e6e54a952a07d17f4dcbb97d42c6304b972e5c618351d2a256670a32a0743a016b332dcb7084f502c9f88036210c907c2ee5084564eec06050144732d4c35abcf12a17647e3f46dff00e914a998ff00ab741fa204f00ba0ff0066e28b6cba2e5dbd1ccb577f472fe8882b6c3c70fd4a606e9c9f10bc58b72f198854a1589e6522e39851b8b9c47b3105f70d25549b08632c8254a952a1165cbea5cb8b2e2cd3a2e65e9bb84ac22e61fa589711b4120467139e81d5877b0c40889a8697995325bbed897804c6f2b1a333be55b615d57b400abf8970250f85e3e5dafe895a4dc7ff0061a3ff00b1ecf0d15bef7b7fda95c5ec1c7b1e608c389597fb5d1ffc8e3425ab7f7812171bbaf52ea5c7e65d4bbcd42fef2eb89788d5535171e25d19941bcc01750567552c3715aa00442a3b060c62e2cf6e8598467283143a2ee5cbb2532a5115580c1a2348a9187512c3a5e61995d3089267329595ef2a7329de23bc139883664ee47ca78547a554f242b515a022b43c2ba8774471f0dca08d2591067672230858b32ffb7f8c778b53775f608ea8b54e3cfa25b3339dcaf3fef711948a975c35ec68ff00312dc0de3994918ba1e72ffec42c19b817de52b328ef3118f7d9172c41cdc17789b99f51a199436c135165e67fffd9, 'AC', 6);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(21, 'prueba1', 'Eliana1', 'Bernaldez2', 0, '098f6bcd4621d373cade4e832627b4f6', 1, 0xffd8ffe126df4578696600004d4d002a00000008000c0100000300000001046000000101000300000001044a000001020003000000030000009e010600030000000100020000011200030000000100010000011500030000000100030000011a000500000001000000a4011b000500000001000000ac012800030000000100020000013100020000001d000000b40132000200000014000000d18769000400000001000000e8000001200008000800080016e360000027100016e3600000271041646f62652050686f746f73686f70204343202857696e646f77732900323031363a30313a32392031303a31383a3139000000000004900000070000000430323231a00100030000000100010000a00200040000000100000460a0030004000000010000044a0000000000000006010300030000000100060000011a0005000000010000016e011b0005000000010000017601280003000000010002000002010004000000010000017e0202000400000001000025590000000000000048000000010000004800000001ffd8ffed000c41646f62655f434d0001ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc0001108009d00a003012200021101031101ffdd0004000affc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00e31af6bb8d08e41e51197b9a7541757f9c0cc931f7a89dd304c855650056cb182e8b2d046bf7ff00723d77b9846ba0ede0b25aeb265a640fc3fb2ad55683a150cf1b14a14eee366830256ae3e40226572ac716ead2b43133a080e5532e1ea18250ad43d861673d8e0d265bd95eb68c7caa9ecb1a1d55ad2db5a67e8bb4771ee5cce3650206ab571f39ed823523f11e6a3c79a58c8d765d0c841bea1f2cc8c3c9c2ebc3132586bbe9c86b5ec773f4da58ff00dd736c66db19637f9c5d975fafd3fd823c3272ff00eaf1d6afd6ce8f8bd5b0aaeab500dcce9ce63cbe39a1ae165d4db1f9b4b7f4d53bfe3154faeb5b69cae84d6905aebb21ec20e85ae762b9ae6ff596f65e6e3cc7252a3eab0643c7865ab208824cc7ee18fdbc3a32faf7d358eb3333195071b2d0cb9d24166c77b2edbf9deab5de85bff5ab1707f6fbbd6a31b27dc2861a5b61e7d3d3d0ac9fdda5bec62f62ea387eb3ae05bead5739edb2b3dc126579275ee97f66cfb69dc40a9d01fe2de5a4ff00df9451d6201ea0367f447906de3db0dd84ea0c2a79f994bb3ad7de1d7545b64566c730925f53777b459bbf495fabe9a03058096fa904b2416c6e980e7336eeddbb6eff004ffd22d267d5ccb6e0b3eb039ec38cdb850fc6649bab244d5ea7b7d1636d77e7eff6596218202390ce46a81ad787898b84f15d6fa38401d0004cf82dac3fb6f52e9f918b4558b854e050326fb434b2cb45636b9a6f7bacb1f7ddf4fd2abf9eb19fe0d68f4de878b906ef5acb1a6a70634b0b4071b19bea77b987fc2fb6dffadaa6ec0c0bfa1d19243c657da36d803c86ed2d96c376fb7e9fefab079ae3152000ee059fa7a9747188ea2cb4f0b05edcb6d0dea0fa59b58ff5a9a86d049ddb5e58eff06ade536f66162b067dd93eb5f6d96e3da763aa76f15d56d7ee76e7e763d965b76cfe6d1ba674ae9b7752ae9b68f52a70612c7bec23bb9f3ef6fe6b55ff00b0e2e26374bbf131abab25d5e1bbd5ad83d4dd91919369f7439dfd1e8aa9ff008ab3626ca7838254321956849c718dff007443feed31193886b1abda8dff008dc4899d67a25567552f739d8d9fe9518ce686b65b550caaff00758f66dfd23d31eb1d3ac63dbead67796b7634971358fe799fa16d9eeb5a7d35ab551f6139b934575036e5582aa5b53006fa2da68d95b76ec6fad61ff04d527d97519b95556f60660b5b8ac2e2d6efc93baab6c6dcefa3b36e6656cd9fe8d32070937edf1104d714e5dffabc2baa75f3d6fb47fef9ffd0e3434f07c5448d607895b193d24d566dbaa7e3584b8c10403d9bb5aefa5ff5a72a57e15cc2091b8419733503fb3f49405734bbc8904770a41f1f48479a9ecd098eddb84ce6f8ebe681082014b5dc4798561af0ed41d567ed70236f753aee2d307421452c5d4314b1f67631b31d5901c74f15bbd32f7e5df563d437d96986b47dee77f55adfa4b9265e0e857a07f8bee9de9e0ddd56c12eca71ab1c9ed55676dae69ff86c8ffcf0c54f998463033974638e0e3988eddfc9d4afa06308765b9f92f8d6bdcf6503cbecd5b9acbbfaf95eb28f50c5e9db29a6dc5aae2c9fb3546b69d834dcea647e819ed6fd05af696b1ae7bced6b412e3e006a566b5a76bb22d1fa6bf520fe6b3fc1d3fd96fd3ff8458f979bcd137c663da313c23fc575f1c21fba2bb568bfdaedc7c83564805a4cfa8d9983f46dff00c9ae73ebbf48c0150ce73d94dd7bc36a93f4ec8d59edff00076d7eef53f9ba9eb5bab64d546053977bb63296d9ea3cfee3355c3758ebd5f53b70f1c585d89873fa4702086deeadf652f690efd357e8fa5e8fe7d772d9f8573797344c72094a31db257cbfeaf898b36288ae1a04fa787f0e2e1463172ff647a1975ed7606e7e3d92d76fc3b08f5d9babddeee9f94eaf26addff692ec9ff0752d3faacffb6e3e6f43b1db4f53a4d754fd16e4d5fa5c673bfb6c549f98fa28cbc96007eccdafd361d5a4bdf5d5652efe4598d65d43ff00e0ec597d03a91aafab228716bd8e6b9b3c87308db3fe6abe6cc44e967378061ca718374dee996651cec5c89754039eeb29709d2b6b1ccadffb8f731b63bfb1b11cd06be9dd4f1e0c62e5b1c06b01a5fb5bff0081b16be51653d5f2edc36b0d57dd8f9759b3e886e58f4f2e9b1eddbe9ec666e558cfdcf4566645d895bbab556e6ee75b45504359efc9ac358fc5bbd3659e93ead9f98eabfe16c43ad7d8c00f463d3096750f55c23d2a1ced7c1b5ddb56f6255b3a8f4fc723560c3a469306bc465dff009f1d62c2c76bad36bb19b75c1d41ab70addb43f63d8fac39b5b5ae63377e89ff00e13fd258ba8c3a8fed7af21ed702dce01a4cb7da1b7b1bedfcefd1535a276a5c3769e1362ac7b6c8d98f6e664bdced07e85f56cddff5ff00456ef42e898d681eafa86db1c722c2d30c77a8d616bcefafdfedfe52c8e838232fa7d586fb5b5d7faf3b20d8f9068665065ac758ff0077bbfd3bbe87a7fa45dc74bc714636f2e639d692f73ebfa2675f67f25498a3a1f397fd245e9f53ff0049ffd1d9ba9b3d3754f3ea52e3ab1c03848fceda56564742a1ce9a89a1c0c803dcdfb89ffbfaeeedc2a6cec0cf888ffa954aee9359d1b2dfc7f22ca9e2e671eb124f91d3fc560e2c91fec7cf72ba1e46bea55ea9131655f48cf88fa6b22cc17b7f9a3be3963bdae0bd36ee97637e8fbbf154723a6d37869c9a5b68ac9e65ae8fe4db5edb11c7ce4c1e1cb0afeb47f82e86737531f50f9c3d85ae0d702d70d61da2196827e2482bb7cdfaa94daddd879100f15656adf83722b1b9bfdba573f9df57f2f0dc4d953a9693a38fe92a3c7d0babdcdff395c8ca32d8db3020ec5cac7c4cbcabebc5c261bb26f77a74d4392e3f1fa0c6b7df63ddecaeb5ed98186cc0c2c6c0aa3662d6ca5a477da36977f6ddee5e4dd1ba9e4fd5eea433db8ccc8dd5baa735c6016bcb1c5d4ded0ff4ecfd1fe7d7f4177fd2febc745cc6d6eb1cec27bdc5ac6e4801a5ecda6c63722a2fabfc257fce7a5fce2cff00894334f8630819631ace50f54bfc48fa997170827f79dcead5b5adab1c19f5dc03ff00aadfd259ff00459b154bdf6163dad6c97c098d7e4ac646637208788d5a0b4b48702d3c39ae6fe63d64755eab838156fcdcbaf181e058e871fea563f48ffec3160f3678f9b97b11908fcb08d1e2d63c12f4fcedcc5122038bccb95f5d1b936747385823d4c86064b5a37493631ef6c7f65735d2bea3e6676464d7764d4cb2863aeacb21dbee25a4543736bb31ea6bbf476e4b3fe0fe9ab7d57eb236fb0e1f48b1ccd7f5eea2585aea5b3b7d3c7659b7658fdbfd23e9ff00c5ad0fa89d51d8191d470b2dc7230b7d6d2f7bb75ec7066dd5e3f9cad8c0b6fe1b1cb830feb2b1c388ccc640fb878f861eaff36c1cd4a311c635aa8f15ff0085e9fde74eefa9d838dd032315d6bedbaf2c75b63a34701b47a7b437db558edd5af2ce9f8578a6cb182363882f1304b61be9c7d1fcfddbd7bbdad67a0e922da7639f55838786b4be3fe31bb5797fd5ecba28e8950b70866faf7e43a0ecf6b48a1ae6fe97ddeefe4adac7c0314cd58f4003fc6fdd6ae49cb2c84a5224cacca5d5b78545fd43a461613dbe85d5663b19cf3265b96d0ffb5ddf9dedbebbe8fe47da195aeb7a6742a311efccbeaabf686556e6658a0386390f77a9656da6cfe7bf359eadff00995ff83591f5071ed1f6cb4c868d9431a48738ee3eb7e90b7f3bd26e32ecd98b63cb801f40c38ae6fe2bcdf333ce796e56246804fdabe2e297eb3db8cbfd9b360c7188e39ebdb8bfe9351fba22741a003b0f2556d04704cab8f11280f66e07503e2b071ca5c5a7cde2de074722ec26921b4d9f666ed7d6f6b07b5ccb5ff68c8af6d7b5dfa7b7e92bb775cc9c4c5663bf7d83696c5753bb73dfdb5b3f9bff00ce157cad0aa97e4df6e4063598f75afa9a5a2f7e407b9ad70a3f44dc563a9db56e67a9eff53fc37fa45d3fc279e9e48fb33b94b781ebfd6896af338a31a981a5ea07fd27ffd2ed1bd43cd1067b4ae6c59e6a62d778fe2b0473990752d2f77c5e8bed55bb43aa1bcd2e5862f78fce2a632acfde4a5cd997cc2d4660eee9bb1ea7031df955ecc310403af6282ccd78e75466e754603c111dd304e07faa807b1727a87d5ac1cbac9756587bbe83e9bbe3b21d4bff00edb42e8ff571b899b3fa1cbc2b9ae65d55ec8735c5ae6d77b6976fa6cff456ec7fbeaff07fa2ab67475db8cfd1ae077685aa9759ea387d1f1465e4be5ae76daeb67d37ba376d67fdf9ff0098ade2cf963547dc8f58fcd2fa49b186790ca3188390935c3fa4e25fd07a1d5d72bc4ab15ad6bcec639a43887b585fe987585feddccdfb3f9b4ba8f44e9bd3cfad4e2d7ebb7517bc075b27c367b7dab4312ec9ea1814755c60dc3b2d6073f7112c69ff00085ce1bedaac66cb69ff0048b3fad758c263ac61b059686fd1104827f7b6fb58ae4eebcdd40002069a7e6e28661e2b322e7521c0fe94b2603ac1ec63addc7e8337390f1725f4d54d95b5a1ee0e7dfb665ef75961f56cd4b77edfdc41c973aec4b059a36f6b9a079110164e163df898aecb335925b5b1a7f7e65ffd9635af4d152c52818832320788f603e45b9b969640662551c70948c3f465ff00a13e8bd0feb0358d35583d4c6b34b699d44fb4bebfdd7acbb3eaff0040e84ea59d4aebb23a6dd6dafc0beb90363c54ef432b67fda8a763f7ecfe72afd2d75ff39e973b89d51bb86efd159e3d8aea307a8577e3bb1329a2cc7b4b5ce6ba2370fa3656e7077a37b7fc15bff6e7b147033c4250d7db97f8d8ff00ad0684470907703a3d2f45b3a1d78ec1d14d028de5e1b53a497800bfd46bcfaceb5add9bfd4f7ad13d5454d787d95377fd2739c01d7fb4b83c4fab7d6307aa1eab8b935e43316d06bbdfbb75953835d7b7218c65be8b7d0b765db1bff16b6327eb164e1b9f4757e9cf7866a6ec367aec0d3ed6bac639b8f76c77fa4d9631533f09c9c72c90e6f20e3b3f2c4cbd5e9f9bd3c526ec7244c45c453b1f6fc077193493c40b1879d3f7943232712b26bb322aaec044d6e7b0388f0daf735cd5ca65fd60a05c32fa663ddb583f4a2dc6754ddbe22cfa4d57efc7c0ea58d5752aea69392d07d47005f23d86973bfe0bf33fe0d54ff404411fae355afa75e2ff001997de23a6fb36ec0fb981ed7b1f3c9adc1c3fce6ee50a1d9cdb28a69ca38b539cef50b19558ede4d6ca9cd76432d6d7ecf57e8ac8c4e93897e754f68157aeef4edf4fda5af6fd278d91f4abf7aee8e36032b7c16345cdf49ef610d796be6b78f6b5bee67e8ecf5777d35a3f0ff84cf1e58e48e412844d4870f0990fddfd261e679a8f070115222fca9fffd3b02e4e2f599f691e29fed4173ded173f80ba82f1e2a42e1e2b27ed802719a10f64f641c65d7178f1526da5ce0d6c971e0058ff006d0b73a3b9aee9cfc98121d68260cfb0c375fce52e0e4ce59d13c311a92cb8b9594c196d1810252f19df08ff0099272f3beb15186eb18dadd6d94cefd7680418fed7b972bd7fa864756b2a7bdfb98e1b58c6ced6827ded1fca77e7ab9d599b7a85cc3ab6db6c275ece1bff00efeabd38f84c2d7192f6812d3a6e711edb3fadbbf315dc7831e23e81a8d388eb27b1e53e15cae1c509e387f3908f16699e2c9fac1c52e1fd18f1465fa1183de74c7e2e4745e91ebd2cb71817f4dbc387d0736badb8dbbf90ff00b37fecc291faa5d13ed2594e236ab41dc402608fdedae2e593f52b2e9b6ebfa16712dc4ea70fa4830e65ed1bea7b7fd1d8f6d7ff006e5542b5f58beb2752e80e3876d4cb3a90338f7982d75325bebd95b5dedf576ff37b9583a8e23e47e8e7e7e5650e6a78a03e627263ff00653f50ff0013e46a754c3a71afbf3af03d1c677a78d576b2c1fcdb1adfdc63bf4aff00e47fc6ac2ea21d574fb1ef8905bb4384824bbe8edff3d57cdeb9d6fa8e57da722c64b7db5b360dacf2a9bf99fcb54b25f939449bed2f15fd11a0683df6b1b0d51d81b3a9cbf2c71e19c0c38a79054ccbe4e1fdd8fe97fcd62c6e26436038d0f3d9d2f67f9cdfd2b3fcdb558c33d67a7522d7d7f68c5dc5a5ec76fac478dd48b3d177f22dd8f55fecb0c1b357b886b078b9c76b7fea97715e10e86ead94dc71db8f4975978d01733f9f7581d2db1aefa7e8dbf4ff009b52c4994482011dceee47c4b94c580c00f4e49fab801b8f0f765f55bad32ca8e36e6b9990f1eada4ed3538fb61edd76d4ff00656cb17595b5f5365ef97c6ae6f1f23f49711843a1f5bace41c6bba6e7b6d2d76674e71a9cc93babf568f7d2eff5afd55d39eafd2e906ba723d573000f864131ecf55df45addfb772884a20503fe09d3ff004669c3d0658e7e8944fcb2d3f141d51bbebb5b7b8babb416be4c9208dbfe6b153c2ac51d14e0bcc59b5eea08e2591307f79aefd37f610b3ba81ea595560633ab165c5fb5bea34be2bd6df630bb6ed5772ba69a7158c1205603838721cdd27fade93777fd6d46093646a19898c802083e4e13720b321e0fb5b66dbb6fee9820aad9b939359de5fbb6b9a412758905bfe722f502d6517e45a0576e3b4d77b07d170dde9fab59fcd67b951c763b2a9f4776fdbad4e3f49a79da7f798aff00c3b9dfbb4cf17f3593497f525d27ff007cd0f8872639880aaf731eb1feb47ac3fef5ffd4c1fb68fddfca9fed87f74fdc54abe938f20bacb9f3d8bffd8a4ee95801bb8b09fdedcf71fe2a97dde28f64223991a9691f180a07a956398fbc7f7ab2de9f8201db8ed0353ee1affd25218f4348d9531a478347f723ec415ed45aaccd65cdb0b6086b7999d4fd15a0eeb5d430f12cc3c5b1b5b0bcdad7800b8876d6fa6dddbbd9ed54331e05d45278ddb9ddbfd7dad4aab1df6ca98fd58ff609ec7f363face0900217c3a3d57c3391c50e4a232404fdc3eecc4c717cdfcd7f8b8f8185f6596e4b1d71dcfda779f880dffbea8daef4f19f648dd56d78f03b1f5d93fca45cdb2ba76e4d9f41ad978075e0fb5bff0018ff00a0aae2e4d14e5b2dea4d61060d95581db5d5fb2dfb3c41db439bfa2f6fa9fa47fa9629318b9064f8967863e5678e3100d478637c1187b7c3c1c3fd6fd57eaf1ffab675f50765db5fa6f2c156e735930f6be773f647bb7b5cdf515efac3d49fd5fa95b9960159b9b58b1bcc16d6c66d6ff25cfdef595d4b345d5dd67d98d75d8fdf8d6814b76412fe711acf736bb2aaf6fbfdff00a4fd1a3078b5b5b8fe76d25d3cf1aa12063a317c3f3c79ab998013809474ff005863297f8dc2b06440fdd688f894c2b20682422b9e3700782348f24e1ad21def208e0f63a7f2931d5918dd76d346adb73a9a858d00b98f6b9a0ea25a772d4eb1d7b27ac3a9c6358aaad82ec87564c3dae3eca76bbdcddcff00e52cacc7eb50996f24f799e1c10ecbcb43d94b66d796d3537b683d4b1dfd5afd54448ea039b9f0e0c99864cb1b38f8784ebc5e9e298857e97b93763ea8e174cea399974f53b2e6d4f7baca998ee2c2e2c733d405cdddfa3d8f56b3333ead74dcab9dd3eb6b3118c0cada5eebadbe5cff0053d2639cff00d0d8cdaffb46458ca3fd17abfcdae6863e5b598f5e2d87de369637dae717bb6fb5e36ff393f41c88ee85d419bdcfc2c96ec96bcfa3600d27dbb9cfdbe957fd7dea584048599e80ec34ff0019e7fe231947983c51946c44ebd4f0ebc27f4a2dfe8b955dff005be9ea62b660e262b4e4ded04b8358f3e85ee7d8ef739eff005b7bfdbff12c57b33eb93b3feb2635ec2e674ec2b03696107dd5bff43916e4375fd25cd7efff008167e8973f8d5dd4d375769dd65af0eb63427d3dcdaebffadb9dbbfe33fe2917a674bbf3b2d9874833640706f2274feaef76ed8c534a308894e5a44468dfee34a267645f5b8bd8f53a98fc7b22058e658cbda7511fa37b5c7f93beb72bdf55fa6d97f4eaab000f58179dfac301da3dadfccfdc57b23a29c5bb1a87d82d743bd463249787b7d16b1c5dff0008ef62dde958b5611674fa80dd454d7e438789f6d35ff55bb5eb378f87189904199e1c63fe94db329826874ddfffd5955d233ec2228781e2e860ff00a64220e8198f043ecaea1127979ffa01741f696031b8b89ec38fc54407924b6a807b9d34fc14257b958df57e8f4ff4d6d8793b006b48f2719b7f37f35583d23a6d2038d40c72eb1c4e83e61aae6c7010eb23c983f8acafac573713a78731a775960617b8c988759b74fdf73534c8064c38fddcb0c40d7b92e1becf1bd46c9ea8db38638c347612480142d796dba72c01edf8cc2596c19143f698b34730f811c2ab6648b7d3b4fb4bbf45683cb5c78ffc11329ec25218ae3b4684a3ff00a4e5ff0085fa26e85b58ca67da1dee735c1cc0386b4b7dbb5bfbdedfa6aa752b195b2a0e61b9aee64ed023ddb43a1fff004d8aee07bf0893f4cb1ba7125bb98554cea0dd53cec717561ae6d6261df9bc023f33f949d8cd48357e210f7393c9184419188c8348c8e838a5f3f17af83e5fd3712cf4dd2e63430bbf7494cdbb22b3b98f20f7f3feb2775373742dd743b4104c1fa3dd0c92347083e6ac900eef2909ca1212893190eb1352742aea8e7002c807c3fb9cae1c9daef4dc1d5b872d74b7e7b5617263c56a51b1f551ebb7783532049103e834ef1fc96aaf9602344752eefc3f9fcf9ccb1cea528c78848fe978155cf6d997b49fd1920cf040e52c4f754fbffc258e7b6bf2dc7dc80ff4ef6d4ea647d26fb8497381dd1edfa5b54b0fd5a18d961b8490d6b24c92776adfa6995a78deccd8b383938e43f5644a7ee6f18f17070cbfabc1ea7a4e81d39bd43ae74cc422582d658e07835d23ed3630ff005fd2dab7ff00c6774deb0face7d57d9674980dbf1418652f263ed0ea99b5b7b2e73bf9ebbd47d167fc17f375ff00c59576dfd672f26f1b7ecd8fb6a0e696381b5cddced8e0dfa0da9cd5e8d6d75bea7536b058cb816beb7090e647bdaf69fa4d737d8a0398e1c824761b8fef7fdd397f14cd1cfcc130ae1000043e16db58eac0b645ac102c1eede008632d60f77abf9acb99ff005eff004cbd33ea37d56bba655f6fce67a79773416d4609ac107e9c7f84d8ed9b377fa651e97fe2faac0eb95e5d96b6ee9d860d9838ce1fa465ce3bb6dd6c7e9e9c68df8ce77e937ffc4fa97f60486c49fa46027735cc8c918c21a43494bfee63fe0b4231a36517d8b17ed1f692c9bbf7892758dbf449dbf4507a6b01c6b331bad99af376e3fb87d98ffd9663b2b44cfb5f5e358e0769d8ef70e5a60fb9bfbdb54306a761f48c4c7b0fbe9a2aa9c7f94d6358e552592c9b91fd5c2b5e9c4b80fc5fffd6def5a0e9a0f2d14fd42ed4994f5e11244f3fc15bab040d08d5678948959c65c5b727ac32fb5b4d386eab77e89d73af73f680d1fccd1f6667e6badfe76c40c8b7abdf5babbebc17d6489ac63bc8247b9badb9ce5d15f875bab25c4303413ea1ec009f77f25610ea9d2bd26dafc9aab0e13b6c7b5af13fbf5b8ee6ab5090228463607eec65ff0049921b718b1c247a8123865fa3ea8ff751e3f4e6c8fd0e15623ddfaa54e27cf6da6cff00aa599f593eacb322937d3b1b6001ae34d35d20007f3a9c46d6dbbf97ea7bd6d62e674ecab0d789915dd601b8b18e05d1fbfb3e96d56c34b3c47914f3b5501fe0c42ff7666bd7235de522f058d3556d6dac6d6e618716925aed5d17b6776ef57f9c4d2d2d2e33e52ba0eb7d186d7e4630fd19936d6de5a4f36d6dfddff48c5cc5f73da431da478779fce1fd6501145e9be1dcee3cf8844e996110240fe970ff00948ff2f4212d619de03b7c170234e7e8aab7518ce3ab742477e3e488eb7cfc101f60240e750903d93cc7b52238a1195680ca224d6f4055941d1fa20e0601d4731fe6bbdeac9735cd6b0e80b03041d207b7da856ba5de44a8faad0ef78d2643be7dd19132af073c423865331ae191d45743ff0072d9a2aadb8edaea90e69dec2753ba7cbfaaadd6e6d95bada806b9d0e83dac6fd263bf916b1cead526ddb06f11078238d53bae38f797344d576a444ea3e9b546413b6ebe198088e940474f4f08fd07d3fea4d14f52e8b9396f06cb322f654c7b9ce16336359ee65f5b9b757655eb5bfa5adfbd75af16db65c2978aec6ed631ce6ef004ef7fb3733e92e37fc57dc0747cf01c4b29bfd4a84f1ea56396fc976d5d6e6bf7772d6033e227ff0024a9e627dc11e80dfe12727357b93aea7ff466a554b32eb36d1d4edb98d71697d2ea768734ed7b3f454ecdcc77efa20c1ca1a8ea17bbc9eda08ffa38f5bbfe9ae47eafbdf8f87f5a3a754430e1f50b6d66a5becb7e80fed7a0e5d8b2f71aeb6969361634b98d33b647e79f6a3925c1331e83f6b18737a8b7a9fa0f2ec8a1d4b60389a1ed7105ccacb58e6e56df76ff00a7e92d4cf245408e01d56475c75f6f4ab062b6407b2cb6c7903db4bd976cae09fdc5a59390db2abda2218e6b478927dcaa649838b2ebea947fe8c6735c06a1ffd7ee835acd036046a4ea7f150b2f0c1038f355f233000492b3aecc73cc3741e3dd6566e684740d694db776643a39d7e89efe4bc7fa858dabaa653b18c165ef1538fbbd81ce159fdd77b3f3d7a5b9ddd607d68e863aa54cc8c60066d0dd81b3b45958e2bfdddf5ff82ffb6d3394e70472913d233d38afe53e2ac59871709fd2ebfa2f175e659f6a6df78f5ed68863ed3b434f880cff00c8ad8e85d73ab51981d8f6fab8cf76ebf19cd77a4d1ff07659eeaed73bfd1b554c2e8965d737d56598d430cdaf788788fcd6486b5aefeaae86dc4637a7df95453f66c5c76135b9b20ee276d6ca47fc639bbdeb4726717c11f51ee368b7231f5c62413295683c7f7bf75ea71f2ebbeb0f00b0912e63b91f72e7feb27416d953b2711b112e2c1a6d3cfb7fe05ff9edff0007fce2e519d53add4e69af32e11a8879856bf6ef5f00467dc0f86e40c81145bf8b90e604b8a078651d9ccb0bd92d702d703041e42103111e2add82cbddeada4bdf64b9c4f26105d500240d4027cf412981d09c66384caae87f28a174907cb54ced6b13d919d5ff003d1f9b1f884278fd083c494e1d18f2448e2bec7fe6cb850eeb5b66daf5dfa164483fd95d074cfab799981fe9b9adaaa0df559638801eef70656e01defaff003d66f4ca8bb285fc331dbea13e7f98dff3977bd0ba7babe99366f0fb9dbcb491b607e7803f3bf337226a9cecb2319900f8f93a3f503a659d3bedf8ce731cdbfece59e9973a367a8c7eeded6fe62defad765d5e036caeccb630583d4182e6b2e20fb7e93d96fb2bfe76cdbf98c54bea9340b732c0ddad0e656df8c3dcff00fab621ff008c6161faaf7e4d676bf0eea2f1120801e2973839bfc9b953d3ef26ff007a31d75fd1ff00be9b5a4f2b937dfd1beb0e5e357956bb1babe153906dca836d8e70b1f4faded6b77b6cf56bf635779765da702861071f2af0c7fa1a87ce86d63fff00325e355e55995d4f16ec973f21ceb686bcdae2f73832cadbb4b9f2efa2e5ed66aad973ec7004ee7493a9719eee4de7e153b1fa51e1ff0015113a79167e93723a7e45768dbea07c01cb646d1042c9faaf96ebdf7f4fcb1fad621adc0ffa4ad83d063bfeb3ec6d8b645a78008f69323da23dbc7dfb551e8788d7e764f51222d73ac60eded7386d66dfe4fa5b951111c518917bafb7ffd0d67dae71971432f0145db906cf520c2e66893ea3f6b9e6cefa2f65c0775472337dde9b06e79d0346a50f2bed3ac683c46a56afd5e1d2c070c625d9d1ee3700d7f9fd9db2f6ff00d2f595ac187193729c47f8419b16386f2947ed4789d11e76dfd4a5cfe5b8d3ff009f7f77fe2d55ebf9f4bea18b53839a08166d10d007d0aeb8fdc57fad7ed1f44fa200c6e2c2c24bc8fdeb746fe8bf915ffd7972f99dbd392c91abb477f6a3dbf4bf7568c44046a155e0ec7c3638ce78d9888c751afcd3f9623fee9cdbaa636c1c1933a69a79a6731a36478ee27e5b52b67d4d798fc2545dbb49f9245e961c3c3a6badb3157d091225fa0d0f7e2554a834877b6016913dcfc82b677edf3daeff00a92aa513ead7c6d9ed1cc6893165e1192201d08036d2bbaf7915bed7bb497881fc96fb556b98063d53c0747de3722e74c6bf4a4cfc247fd24af9f435e770dbf1ff00ce511d29ad980fd6091d8583fbdebe39ff00ce6e7d54c5666f5aa706c76c6dc751e3b03aef4ffb7b17a2751b18ca5c2b018d688647601796749fb77ed7a3ec3fd3bd767d9e663d5dccd9bbf91fbffc85e8dd5fd6fb33f4810e9824c73e4377f2538b8d9fe6b679d93f5aba474ee97fb0a8aeefb45765d962c0d3efb1cc7d3fce5b4bbe83bd3f6aa797f5fba90c3bb07eb1fd5fb2c17b5d55fe9bacaab731c36c343997ed77eebd992baceb5e84606cfe6f69d91fbbfa1f4d54c3fb4fda87a3bb91ba263f953b53314704e00e4e1190c8dfab83271711e16a48cacd3e77d333fea361e6d197633aa38e3bdb6369b0e358ddec70b3739cd76358ff00a1fbabb2ff00c743eac3de086e5c8ec296189f3f59cd5a79de87a8ef5fd2d93fe1f66dff00c1d67e6ffcd4f4df1fb27d5de376efb3786be9edfcc4ecb839626f24e8f8cd0252edf8356fff0019df572096b330920b7deca8083ff5efe4abff0057beb13faae33f3710d94d36e55ad0d706b498151dce6b4d8dfcf5955ffcd6d8f9fd99ea6ed23ecd11e4b5feae7eccfd9fecfa3f68b367d93d3f4a7dbbbe8fb777ef28e31e531c8481133dac653fe2abd474fec7ffd9ffed361850686f746f73686f7020332e30003842494d04040000000000771c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c015a00031b25471c020000020000003842494d0425000000000010e471fc9b771b9f3e47046e891059c20d3842494d043a000000000139000000100000000100000000000b7072696e744f7574707574000000050000000050737453626f6f6c0100000000496e7465656e756d00000000496e746500000000496d67200000000f7072696e745369787465656e426974626f6f6c000000000b7072696e7465724e616d655445585400000026005c005c0069006d00700072006500730069006f006e005c004b004f004e0049004300410020004f0046004900430049004e00410020003200350020004400450052004500430048004100000000000f7072696e7450726f6f6653657475704f626a63000000110041006a0075007300740065002000640065002000700072007500650062006100000000000a70726f6f6653657475700000000100000000426c746e656e756d0000000c6275696c74696e50726f6f660000000970726f6f66434d594b003842494d043b00000000022d00000010000000010000000000127072696e744f75747075744f7074696f6e7300000017000000004370746e626f6f6c0000000000436c6272626f6f6c00000000005267734d626f6f6c000000000043726e43626f6f6c0000000000436e7443626f6f6c00000000004c626c73626f6f6c00000000004e677476626f6f6c0000000000456d6c44626f6f6c0000000000496e7472626f6f6c000000000042636b674f626a630000000100000000000052474243000000030000000052642020646f7562406fe000000000000000000047726e20646f7562406fe0000000000000000000426c2020646f7562406fe000000000000000000042726454556e744623526c74000000000000000000000000426c6420556e744623526c7400000000000000000000000052736c74556e74462350786c4062c000000000000000000a766563746f7244617461626f6f6c010000000050675073656e756d00000000506750730000000050675043000000004c656674556e744623526c74000000000000000000000000546f7020556e744623526c7400000000000000000000000053636c20556e74462350726340590000000000000000001063726f705768656e5072696e74696e67626f6f6c000000000e63726f7052656374426f74746f6d6c6f6e67000000000000000c63726f70526563744c6566746c6f6e67000000000000000d63726f705265637452696768746c6f6e67000000000000000b63726f7052656374546f706c6f6e6700000000003842494d03ed000000000010009600000001000200960000000100023842494d042600000000000e000000000000000000003f8000003842494d040d000000000004000000783842494d04190000000000040000001e3842494d03f3000000000009000000000000000001003842494d271000000000000a000100000000000000023842494d03f5000000000048002f66660001006c66660006000000000001002f6666000100a1999a0006000000000001003200000001005a00000006000000000001003500000001002d000000060000000000013842494d03f80000000000700000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800003842494d040000000000000200113842494d04020000000000240000000000000000000000000000000000000000000000000000000000000000000000003842494d04300000000000120101010101010101010101010101010101013842494d042d0000000000060001000001553842494d040800000000002e00000001000002400000024000000006000093980000000000000000000f010000894101000087c0010000046e013842494d041e000000000004000000003842494d041a0000000003430000000600000000000000000000044a00000460000000070049006d0067005f0050004400460000000100000000000000000000000000000000000000010000000000000000000004600000044a00000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006e756c6c0000000200000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e670000044a00000000526768746c6f6e670000046000000006736c69636573566c4c73000000014f626a6300000001000000000005736c6963650000001200000007736c69636549446c6f6e67000000000000000767726f757049446c6f6e6700000000000000066f726967696e656e756d0000000c45536c6963654f726967696e0000000d6175746f47656e6572617465640000000054797065656e756d0000000a45536c6963655479706500000000496d672000000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e670000044a00000000526768746c6f6e67000004600000000375726c54455854000000010000000000006e756c6c54455854000000010000000000004d7367655445585400000001000000000006616c74546167544558540000000100000000000e63656c6c54657874497348544d4c626f6f6c010000000863656c6c546578745445585400000001000000000009686f727a416c69676e656e756d0000000f45536c696365486f727a416c69676e0000000764656661756c740000000976657274416c69676e656e756d0000000f45536c69636556657274416c69676e0000000764656661756c740000000b6267436f6c6f7254797065656e756d0000001145536c6963654247436f6c6f7254797065000000004e6f6e6500000009746f704f75747365746c6f6e67000000000000000a6c6566744f75747365746c6f6e67000000000000000c626f74746f6d4f75747365746c6f6e67000000000000000b72696768744f75747365746c6f6e6700000000003842494d042800000000000c000000023ff00000000000003842494d0414000000000004000001553842494d040c00000000257500000001000000a00000009d000001e0000126600000255900180001ffd8ffed000c41646f62655f434d0001ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc0001108009d00a003012200021101031101ffdd0004000affc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00e31af6bb8d08e41e51197b9a7541757f9c0cc931f7a89dd304c855650056cb182e8b2d046bf7ff00723d77b9846ba0ede0b25aeb265a640fc3fb2ad55683a150cf1b14a14eee366830256ae3e40226572ac716ead2b43133a080e5532e1ea18250ad43d861673d8e0d265bd95eb68c7caa9ecb1a1d55ad2db5a67e8bb4771ee5cce3650206ab571f39ed823523f11e6a3c79a58c8d765d0c841bea1f2cc8c3c9c2ebc3132586bbe9c86b5ec773f4da58ff00dd736c66db19637f9c5d975fafd3fd823c3272ff00eaf1d6afd6ce8f8bd5b0aaeab500dcce9ce63cbe39a1ae165d4db1f9b4b7f4d53bfe3154faeb5b69cae84d6905aebb21ec20e85ae762b9ae6ff596f65e6e3cc7252a3eab0643c7865ab208824cc7ee18fdbc3a32faf7d358eb3333195071b2d0cb9d24166c77b2edbf9deab5de85bff5ab1707f6fbbd6a31b27dc2861a5b61e7d3d3d0ac9fdda5bec62f62ea387eb3ae05bead5739edb2b3dc126579275ee97f66cfb69dc40a9d01fe2de5a4ff00df9451d6201ea0367f447906de3db0dd84ea0c2a79f994bb3ad7de1d7545b64566c730925f53777b459bbf495fabe9a03058096fa904b2416c6e980e7336eeddbb6eff004ffd22d267d5ccb6e0b3eb039ec38cdb850fc6649bab244d5ea7b7d1636d77e7eff6596218202390ce46a81ad787898b84f15d6fa38401d0004cf82dac3fb6f52e9f918b4558b854e050326fb434b2cb45636b9a6f7bacb1f7ddf4fd2abf9eb19fe0d68f4de878b906ef5acb1a6a70634b0b4071b19bea77b987fc2fb6dffadaa6ec0c0bfa1d19243c657da36d803c86ed2d96c376fb7e9fefab079ae3152000ee059fa7a9747188ea2cb4f0b05edcb6d0dea0fa59b58ff5a9a86d049ddb5e58eff06ade536f66162b067dd93eb5f6d96e3da763aa76f15d56d7ee76e7e763d965b76cfe6d1ba674ae9b7752ae9b68f52a70612c7bec23bb9f3ef6fe6b55ff00b0e2e26374bbf131abab25d5e1bbd5ad83d4dd91919369f7439dfd1e8aa9ff008ab3626ca7838254321956849c718dff007443feed31193886b1abda8dff008dc4899d67a25567552f739d8d9fe9518ce686b65b550caaff00758f66dfd23d31eb1d3ac63dbead67796b7634971358fe799fa16d9eeb5a7d35ab551f6139b934575036e5582aa5b53006fa2da68d95b76ec6fad61ff04d527d97519b95556f60660b5b8ac2e2d6efc93baab6c6dcefa3b36e6656cd9fe8d32070937edf1104d714e5dffabc2baa75f3d6fb47fef9ffd0e3434f07c5448d607895b193d24d566dbaa7e3584b8c10403d9bb5aefa5ff5a72a57e15cc2091b8419733503fb3f49405734bbc8904770a41f1f48479a9ecd098eddb84ce6f8ebe681082014b5dc4798561af0ed41d567ed70236f753aee2d307421452c5d4314b1f67631b31d5901c74f15bbd32f7e5df563d437d96986b47dee77f55adfa4b9265e0e857a07f8bee9de9e0ddd56c12eca71ab1c9ed55676dae69ff86c8ffcf0c54f998463033974638e0e3988eddfc9d4afa06308765b9f92f8d6bdcf6503cbecd5b9acbbfaf95eb28f50c5e9db29a6dc5aae2c9fb3546b69d834dcea647e819ed6fd05af696b1ae7bced6b412e3e006a566b5a76bb22d1fa6bf520fe6b3fc1d3fd96fd3ff8458f979bcd137c663da313c23fc575f1c21fba2bb568bfdaedc7c83564805a4cfa8d9983f46dff00c9ae73ebbf48c0150ce73d94dd7bc36a93f4ec8d59edff00076d7eef53f9ba9eb5bab64d546053977bb63296d9ea3cfee3355c3758ebd5f53b70f1c585d89873fa4702086deeadf652f690efd357e8fa5e8fe7d772d9f8573797344c72094a31db257cbfeaf898b36288ae1a04fa787f0e2e1463172ff647a1975ed7606e7e3d92d76fc3b08f5d9babddeee9f94eaf26addff692ec9ff0752d3faacffb6e3e6f43b1db4f53a4d754fd16e4d5fa5c673bfb6c549f98fa28cbc96007eccdafd361d5a4bdf5d5652efe4598d65d43ff00e0ec597d03a91aafab228716bd8e6b9b3c87308db3fe6abe6cc44e967378061ca718374dee996651cec5c89754039eeb29709d2b6b1ccadffb8f731b63bfb1b11cd06be9dd4f1e0c62e5b1c06b01a5fb5bff0081b16be51653d5f2edc36b0d57dd8f9759b3e886e58f4f2e9b1eddbe9ec666e558cfdcf4566645d895bbab556e6ee75b45504359efc9ac358fc5bbd3659e93ead9f98eabfe16c43ad7d8c00f463d3096750f55c23d2a1ced7c1b5ddb56f6255b3a8f4fc723560c3a469306bc465dff009f1d62c2c76bad36bb19b75c1d41ab70addb43f63d8fac39b5b5ae63377e89ff00e13fd258ba8c3a8fed7af21ed702dce01a4cb7da1b7b1bedfcefd1535a276a5c3769e1362ac7b6c8d98f6e664bdced07e85f56cddff5ff00456ef42e898d681eafa86db1c722c2d30c77a8d616bcefafdfedfe52c8e838232fa7d586fb5b5d7faf3b20d8f9068665065ac758ff0077bbfd3bbe87a7fa45dc74bc714636f2e639d692f73ebfa2675f67f25498a3a1f397fd245e9f53ff0049ffd1d9ba9b3d3754f3ea52e3ab1c03848fceda56564742a1ce9a89a1c0c803dcdfb89ffbfaeeedc2a6cec0cf888ffa954aee9359d1b2dfc7f22ca9e2e671eb124f91d3fc560e2c91fec7cf72ba1e46bea55ea9131655f48cf88fa6b22cc17b7f9a3be3963bdae0bd36ee97637e8fbbf154723a6d37869c9a5b68ac9e65ae8fe4db5edb11c7ce4c1e1cb0afeb47f82e86737531f50f9c3d85ae0d702d70d61da2196827e2482bb7cdfaa94daddd879100f15656adf83722b1b9bfdba573f9df57f2f0dc4d953a9693a38fe92a3c7d0babdcdff395c8ca32d8db3020ec5cac7c4cbcabebc5c261bb26f77a74d4392e3f1fa0c6b7df63ddecaeb5ed98186cc0c2c6c0aa3662d6ca5a477da36977f6ddee5e4dd1ba9e4fd5eea433db8ccc8dd5baa735c6016bcb1c5d4ded0ff4ecfd1fe7d7f4177fd2febc745cc6d6eb1cec27bdc5ac6e4801a5ecda6c63722a2fabfc257fce7a5fce2cff00894334f8630819631ace50f54bfc48fa997170827f79dcead5b5adab1c19f5dc03ff00aadfd259ff00459b154bdf6163dad6c97c098d7e4ac646637208788d5a0b4b48702d3c39ae6fe63d64755eab838156fcdcbaf181e058e871fea563f48ffec3160f3678f9b97b11908fcb08d1e2d63c12f4fcedcc5122038bccb95f5d1b936747385823d4c86064b5a37493631ef6c7f65735d2bea3e6676464d7764d4cb2863aeacb21dbee25a4543736bb31ea6bbf476e4b3fe0fe9ab7d57eb236fb0e1f48b1ccd7f5eea2585aea5b3b7d3c7659b7658fdbfd23e9ff00c5ad0fa89d51d8191d470b2dc7230b7d6d2f7bb75ec7066dd5e3f9cad8c0b6fe1b1cb830feb2b1c388ccc640fb878f861eaff36c1cd4a311c635aa8f15ff0085e9fde74eefa9d838dd032315d6bedbaf2c75b63a34701b47a7b437db558edd5af2ce9f8578a6cb182363882f1304b61be9c7d1fcfddbd7bbdad67a0e922da7639f55838786b4be3fe31bb5797fd5ecba28e8950b70866faf7e43a0ecf6b48a1ae6fe97ddeefe4adac7c0314cd58f4003fc6fdd6ae49cb2c84a5224cacca5d5b78545fd43a461613dbe85d5663b19cf3265b96d0ffb5ddf9dedbebbe8fe47da195aeb7a6742a311efccbeaabf686556e6658a0386390f77a9656da6cfe7bf359eadff00995ff83591f5071ed1f6cb4c868d9431a48738ee3eb7e90b7f3bd26e32ecd98b63cb801f40c38ae6fe2bcdf333ce796e56246804fdabe2e297eb3db8cbfd9b360c7188e39ebdb8bfe9351fba22741a003b0f2556d04704cab8f11280f66e07503e2b071ca5c5a7cde2de074722ec26921b4d9f666ed7d6f6b07b5ccb5ff68c8af6d7b5dfa7b7e92bb775cc9c4c5663bf7d83696c5753bb73dfdb5b3f9bff00ce157cad0aa97e4df6e4063598f75afa9a5a2f7e407b9ad70a3f44dc563a9db56e67a9eff53fc37fa45d3fc279e9e48fb33b94b781ebfd6896af338a31a981a5ea07fd27ffd2ed1bd43cd1067b4ae6c59e6a62d778fe2b0473990752d2f77c5e8bed55bb43aa1bcd2e5862f78fce2a632acfde4a5cd997cc2d4660eee9bb1ea7031df955ecc310403af6282ccd78e75466e754603c111dd304e07faa807b1727a87d5ac1cbac9756587bbe83e9bbe3b21d4bff00edb42e8ff571b899b3fa1cbc2b9ae65d55ec8735c5ae6d77b6976fa6cff456ec7fbeaff07fa2ab67475db8cfd1ae077685aa9759ea387d1f1465e4be5ae76daeb67d37ba376d67fdf9ff0098ade2cf963547dc8f58fcd2fa49b186790ca3188390935c3fa4e25fd07a1d5d72bc4ab15ad6bcec639a43887b585fe987585feddccdfb3f9b4ba8f44e9bd3cfad4e2d7ebb7517bc075b27c367b7dab4312ec9ea1814755c60dc3b2d6073f7112c69ff00085ce1bedaac66cb69ff0048b3fad758c263ac61b059686fd1104827f7b6fb58ae4eebcdd40002069a7e6e28661e2b322e7521c0fe94b2603ac1ec63addc7e8337390f1725f4d54d95b5a1ee0e7dfb665ef75961f56cd4b77edfdc41c973aec4b059a36f6b9a079110164e163df898aecb335925b5b1a7f7e65ffd9635af4d152c52818832320788f603e45b9b969640662551c70948c3f465ff00a13e8bd0feb0358d35583d4c6b34b699d44fb4bebfdd7acbb3eaff0040e84ea59d4aebb23a6dd6dafc0beb90363c54ef432b67fda8a763f7ecfe72afd2d75ff39e973b89d51bb86efd159e3d8aea307a8577e3bb1329a2cc7b4b5ce6ba2370fa3656e7077a37b7fc15bff6e7b147033c4250d7db97f8d8ff00ad0684470907703a3d2f45b3a1d78ec1d14d028de5e1b53a497800bfd46bcfaceb5add9bfd4f7ad13d5454d787d95377fd2739c01d7fb4b83c4fab7d6307aa1eab8b935e43316d06bbdfbb75953835d7b7218c65be8b7d0b765db1bff16b6327eb164e1b9f4757e9cf7866a6ec367aec0d3ed6bac639b8f76c77fa4d9631533f09c9c72c90e6f20e3b3f2c4cbd5e9f9bd3c526ec7244c45c453b1f6fc077193493c40b1879d3f7943232712b26bb322aaec044d6e7b0388f0daf735cd5ca65fd60a05c32fa663ddb583f4a2dc6754ddbe22cfa4d57efc7c0ea58d5752aea69392d07d47005f23d86973bfe0bf33fe0d54ff404411fae355afa75e2ff001997de23a6fb36ec0fb981ed7b1f3c9adc1c3fce6ee50a1d9cdb28a69ca38b539cef50b19558ede4d6ca9cd76432d6d7ecf57e8ac8c4e93897e754f68157aeef4edf4fda5af6fd278d91f4abf7aee8e36032b7c16345cdf49ef610d796be6b78f6b5bee67e8ecf5777d35a3f0ff84cf1e58e48e412844d4870f0990fddfd261e679a8f070115222fca9fffd3b02e4e2f599f691e29fed4173ded173f80ba82f1e2a42e1e2b27ed802719a10f64f641c65d7178f1526da5ce0d6c971e0058ff006d0b73a3b9aee9cfc98121d68260cfb0c375fce52e0e4ce59d13c311a92cb8b9594c196d1810252f19df08ff0099272f3beb15186eb18dadd6d94cefd7680418fed7b972bd7fa864756b2a7bdfb98e1b58c6ced6827ded1fca77e7ab9d599b7a85cc3ab6db6c275ece1bff00efeabd38f84c2d7192f6812d3a6e711edb3fadbbf315dc7831e23e81a8d388eb27b1e53e15cae1c509e387f3908f16699e2c9fac1c52e1fd18f1465fa1183de74c7e2e4745e91ebd2cb71817f4dbc387d0736badb8dbbf90ff00b37fecc291faa5d13ed2594e236ab41dc402608fdedae2e593f52b2e9b6ebfa16712dc4ea70fa4830e65ed1bea7b7fd1d8f6d7ff006e5542b5f58beb2752e80e3876d4cb3a90338f7982d75325bebd95b5dedf576ff37b9583a8e23e47e8e7e7e5650e6a78a03e627263ff00653f50ff0013e46a754c3a71afbf3af03d1c677a78d576b2c1fcdb1adfdc63bf4aff00e47fc6ac2ea21d574fb1ef8905bb4384824bbe8edff3d57cdeb9d6fa8e57da722c64b7db5b360dacf2a9bf99fcb54b25f939449bed2f15fd11a0683df6b1b0d51d81b3a9cbf2c71e19c0c38a79054ccbe4e1fdd8fe97fcd62c6e26436038d0f3d9d2f67f9cdfd2b3fcdb558c33d67a7522d7d7f68c5dc5a5ec76fac478dd48b3d177f22dd8f55fecb0c1b357b886b078b9c76b7fea97715e10e86ead94dc71db8f4975978d01733f9f7581d2db1aefa7e8dbf4ff009b52c4994482011dceee47c4b94c580c00f4e49fab801b8f0f765f55bad32ca8e36e6b9990f1eada4ed3538fb61edd76d4ff00656cb17595b5f5365ef97c6ae6f1f23f49711843a1f5bace41c6bba6e7b6d2d76674e71a9cc93babf568f7d2eff5afd55d39eafd2e906ba723d573000f864131ecf55df45addfb772884a20503fe09d3ff004669c3d0658e7e8944fcb2d3f141d51bbebb5b7b8babb416be4c9208dbfe6b153c2ac51d14e0bcc59b5eea08e2591307f79aefd37f610b3ba81ea595560633ab165c5fb5bea34be2bd6df630bb6ed5772ba69a7158c1205603838721cdd27fade93777fd6d46093646a19898c802083e4e13720b321e0fb5b66dbb6fee9820aad9b939359de5fbb6b9a412758905bfe722f502d6517e45a0576e3b4d77b07d170dde9fab59fcd67b951c763b2a9f4776fdbad4e3f49a79da7f798aff00c3b9dfbb4cf17f3593497f525d27ff007cd0f8872639880aaf731eb1feb47ac3fef5ffd4c1fb68fddfca9fed87f74fdc54abe938f20bacb9f3d8bffd8a4ee95801bb8b09fdedcf71fe2a97dde28f64223991a9691f180a07a956398fbc7f7ab2de9f8201db8ed0353ee1affd25218f4348d9531a478347f723ec415ed45aaccd65cdb0b6086b7999d4fd15a0eeb5d430f12cc3c5b1b5b0bcdad7800b8876d6fa6dddbbd9ed54331e05d45278ddb9ddbfd7dad4aab1df6ca98fd58ff609ec7f363face0900217c3a3d57c3391c50e4a232404fdc3eecc4c717cdfcd7f8b8f8185f6596e4b1d71dcfda779f880dffbea8daef4f19f648dd56d78f03b1f5d93fca45cdb2ba76e4d9f41ad978075e0fb5bff0018ff00a0aae2e4d14e5b2dea4d61060d95581db5d5fb2dfb3c41db439bfa2f6fa9fa47fa9629318b9064f8967863e5678e3100d478637c1187b7c3c1c3fd6fd57eaf1ffab675f50765db5fa6f2c156e735930f6be773f647bb7b5cdf515efac3d49fd5fa95b9960159b9b58b1bcc16d6c66d6ff25cfdef595d4b345d5dd67d98d75d8fdf8d6814b76412fe711acf736bb2aaf6fbfdff00a4fd1a3078b5b5b8fe76d25d3cf1aa12063a317c3f3c79ab998013809474ff005863297f8dc2b06440fdd688f894c2b20682422b9e3700782348f24e1ad21def208e0f63a7f2931d5918dd76d346adb73a9a858d00b98f6b9a0ea25a772d4eb1d7b27ac3a9c6358aaad82ec87564c3dae3eca76bbdcddcff00e52cacc7eb50996f24f799e1c10ecbcb43d94b66d796d3537b683d4b1dfd5afd54448ea039b9f0e0c99864cb1b38f8784ebc5e9e298857e97b93763ea8e174cea399974f53b2e6d4f7baca998ee2c2e2c733d405cdddfa3d8f56b3333ead74dcab9dd3eb6b3118c0cada5eebadbe5cff0053d2639cff00d0d8cdaffb46458ca3fd17abfcdae6863e5b598f5e2d87de369637dae717bb6fb5e36ff393f41c88ee85d419bdcfc2c96ec96bcfa3600d27dbb9cfdbe957fd7dea584048599e80ec34ff0019e7fe231947983c51946c44ebd4f0ebc27f4a2dfe8b955dff005be9ea62b660e262b4e4ded04b8358f3e85ee7d8ef739eff005b7bfdbff12c57b33eb93b3feb2635ec2e674ec2b03696107dd5bff43916e4375fd25cd7efff008167e8973f8d5dd4d375769dd65af0eb63427d3dcdaebffadb9dbbfe33fe2917a674bbf3b2d9874833640706f2274feaef76ed8c534a308894e5a44468dfee34a267645f5b8bd8f53a98fc7b22058e658cbda7511fa37b5c7f93beb72bdf55fa6d97f4eaab000f58179dfac301da3dadfccfdc57b23a29c5bb1a87d82d743bd463249787b7d16b1c5dff0008ef62dde958b5611674fa80dd454d7e438789f6d35ff55bb5eb378f87189904199e1c63fe94db329826874ddfffd5955d233ec2228781e2e860ff00a64220e8198f043ecaea1127979ffa01741f696031b8b89ec38fc54407924b6a807b9d34fc14257b958df57e8f4ff4d6d8793b006b48f2719b7f37f35583d23a6d2038d40c72eb1c4e83e61aae6c7010eb23c983f8acafac573713a78731a775960617b8c988759b74fdf73534c8064c38fddcb0c40d7b92e1becf1bd46c9ea8db38638c347612480142d796dba72c01edf8cc2596c19143f698b34730f811c2ab6648b7d3b4fb4bbf45683cb5c78ffc11329ec25218ae3b4684a3ff00a4e5ff0085fa26e85b58ca67da1dee735c1cc0386b4b7dbb5bfbdedfa6aa752b195b2a0e61b9aee64ed023ddb43a1fff004d8aee07bf0893f4cb1ba7125bb98554cea0dd53cec717561ae6d6261df9bc023f33f949d8cd48357e210f7393c9184419188c8348c8e838a5f3f17af83e5fd3712cf4dd2e63430bbf7494cdbb22b3b98f20f7f3feb2775373742dd743b4104c1fa3dd0c92347083e6ac900eef2909ca1212893190eb1352742aea8e7002c807c3fb9cae1c9daef4dc1d5b872d74b7e7b5617263c56a51b1f551ebb7783532049103e834ef1fc96aaf9602344752eefc3f9fcf9ccb1cea528c78848fe978155cf6d997b49fd1920cf040e52c4f754fbffc258e7b6bf2dc7dc80ff4ef6d4ea647d26fb8497381dd1edfa5b54b0fd5a18d961b8490d6b24c92776adfa6995a78deccd8b383938e43f5644a7ee6f18f17070cbfabc1ea7a4e81d39bd43ae74cc422582d658e07835d23ed3630ff005fd2dab7ff00c6774deb0face7d57d9674980dbf1418652f263ed0ea99b5b7b2e73bf9ebbd47d167fc17f375ff00c59576dfd672f26f1b7ecd8fb6a0e696381b5cddced8e0dfa0da9cd5e8d6d75bea7536b058cb816beb7090e647bdaf69fa4d737d8a0398e1c824761b8fef7fdd397f14cd1cfcc130ae1000043e16db58eac0b645ac102c1eede008632d60f77abf9acb99ff005eff004cbd33ea37d56bba655f6fce67a79773416d4609ac107e9c7f84d8ed9b377fa651e97fe2faac0eb95e5d96b6ee9d860d9838ce1fa465ce3bb6dd6c7e9e9c68df8ce77e937ffc4fa97f60486c49fa46027735cc8c918c21a43494bfee63fe0b4231a36517d8b17ed1f692c9bbf7892758dbf449dbf4507a6b01c6b331bad99af376e3fb87d98ffd9663b2b44cfb5f5e358e0769d8ef70e5a60fb9bfbdb54306a761f48c4c7b0fbe9a2aa9c7f94d6358e552592c9b91fd5c2b5e9c4b80fc5fffd6def5a0e9a0f2d14fd42ed4994f5e11244f3fc15bab040d08d5678948959c65c5b727ac32fb5b4d386eab77e89d73af73f680d1fccd1f6667e6badfe76c40c8b7abdf5babbebc17d6489ac63bc8247b9badb9ce5d15f875bab25c4303413ea1ec009f77f25610ea9d2bd26dafc9aab0e13b6c7b5af13fbf5b8ee6ab5090228463607eec65ff0049921b718b1c247a8123865fa3ea8ff751e3f4e6c8fd0e15623ddfaa54e27cf6da6cff00aa599f593eacb322937d3b1b6001ae34d35d20007f3a9c46d6dbbf97ea7bd6d62e674ecab0d789915dd601b8b18e05d1fbfb3e96d56c34b3c47914f3b5501fe0c42ff7666bd7235de522f058d3556d6dac6d6e618716925aed5d17b6776ef57f9c4d2d2d2e33e52ba0eb7d186d7e4630fd19936d6de5a4f36d6dfddff48c5cc5f73da431da478779fce1fd6501145e9be1dcee3cf8844e996110240fe970ff00948ff2f4212d619de03b7c170234e7e8aab7518ce3ab742477e3e488eb7cfc101f60240e750903d93cc7b52238a1195680ca224d6f4055941d1fa20e0601d4731fe6bbdeac9735cd6b0e80b03041d207b7da856ba5de44a8faad0ef78d2643be7dd19132af073c423865331ae191d45743ff0072d9a2aadb8edaea90e69dec2753ba7cbfaaadd6e6d95bada806b9d0e83dac6fd263bf916b1cead526ddb06f11078238d53bae38f797344d576a444ea3e9b546413b6ebe198088e940474f4f08fd07d3fea4d14f52e8b9396f06cb322f654c7b9ce16336359ee65f5b9b757655eb5bfa5adfbd75af16db65c2978aec6ed631ce6ef004ef7fb3733e92e37fc57dc0747cf01c4b29bfd4a84f1ea56396fc976d5d6e6bf7772d6033e227ff0024a9e627dc11e80dfe12727357b93aea7ff466a554b32eb36d1d4edb98d71697d2ea768734ed7b3f454ecdcc77efa20c1ca1a8ea17bbc9eda08ffa38f5bbfe9ae47eafbdf8f87f5a3a754430e1f50b6d66a5becb7e80fed7a0e5d8b2f71aeb6969361634b98d33b647e79f6a3925c1331e83f6b18737a8b7a9fa0f2ec8a1d4b60389a1ed7105ccacb58e6e56df76ff00a7e92d4cf245408e01d56475c75f6f4ab062b6407b2cb6c7903db4bd976cae09fdc5a59390db2abda2218e6b478927dcaa649838b2ebea947fe8c6735c06a1ffd7ee835acd036046a4ea7f150b2f0c1038f355f233000492b3aecc73cc3741e3dd6566e684740d694db776643a39d7e89efe4bc7fa858dabaa653b18c165ef1538fbbd81ce159fdd77b3f3d7a5b9ddd607d68e863aa54cc8c60066d0dd81b3b45958e2bfdddf5ff82ffb6d3394e70472913d233d38afe53e2ac59871709fd2ebfa2f175e659f6a6df78f5ed68863ed3b434f880cff00c8ad8e85d73ab51981d8f6fab8cf76ebf19cd77a4d1ff07659eeaed73bfd1b554c2e8965d737d56598d430cdaf788788fcd6486b5aefeaae86dc4637a7df95453f66c5c76135b9b20ee276d6ca47fc639bbdeb4726717c11f51ee368b7231f5c62413295683c7f7bf75ea71f2ebbeb0f00b0912e63b91f72e7feb27416d953b2711b112e2c1a6d3cfb7fe05ff9edff0007fce2e519d53add4e69af32e11a8879856bf6ef5f00467dc0f86e40c81145bf8b90e604b8a078651d9ccb0bd92d702d703041e42103111e2add82cbddeada4bdf64b9c4f26105d500240d4027cf412981d09c66384caae87f28a174907cb54ced6b13d919d5ff003d1f9b1f884278fd083c494e1d18f2448e2bec7fe6cb850eeb5b66daf5dfa164483fd95d074cfab799981fe9b9adaaa0df559638801eef70656e01defaff003d66f4ca8bb285fc331dbea13e7f98dff3977bd0ba7babe99366f0fb9dbcb491b607e7803f3bf337226a9cecb2319900f8f93a3f503a659d3bedf8ce731cdbfece59e9973a367a8c7eeded6fe62defad765d5e036caeccb630583d4182e6b2e20fb7e93d96fb2bfe76cdbf98c54bea9340b732c0ddad0e656df8c3dcff00fab621ff008c6161faaf7e4d676bf0eea2f1120801e2973839bfc9b953d3ef26ff007a31d75fd1ff00be9b5a4f2b937dfd1beb0e5e357956bb1babe153906dca836d8e70b1f4faded6b77b6cf56bf635779765da702861071f2af0c7fa1a87ce86d63fff00325e355e55995d4f16ec973f21ceb686bcdae2f73832cadbb4b9f2efa2e5ed66aad973ec7004ee7493a9719eee4de7e153b1fa51e1ff0015113a79167e93723a7e45768dbea07c01cb646d1042c9faaf96ebdf7f4fcb1fad621adc0ffa4ad83d063bfeb3ec6d8b645a78008f69323da23dbc7dfb551e8788d7e764f51222d73ac60eded7386d66dfe4fa5b951111c518917bafb7ffd0d67dae71971432f0145db906cf520c2e66893ea3f6b9e6cefa2f65c0775472337dde9b06e79d0346a50f2bed3ac683c46a56afd5e1d2c070c625d9d1ee3700d7f9fd9db2f6ff00d2f595ac187193729c47f8419b16386f2947ed4789d11e76dfd4a5cfe5b8d3ff009f7f77fe2d55ebf9f4bea18b53839a08166d10d007d0aeb8fdc57fad7ed1f44fa200c6e2c2c24bc8fdeb746fe8bf915ffd7972f99dbd392c91abb477f6a3dbf4bf7568c44046a155e0ec7c3638ce78d9888c751afcd3f9623fee9cdbaa636c1c1933a69a79a6731a36478ee27e5b52b67d4d798fc2545dbb49f9245e961c3c3a6badb3157d091225fa0d0f7e2554a834877b6016913dcfc82b677edf3daeff00a92aa513ead7c6d9ed1cc6893165e1192201d08036d2bbaf7915bed7bb497881fc96fb556b98063d53c0747de3722e74c6bf4a4cfc247fd24af9f435e770dbf1ff00ce511d29ad980fd6091d8583fbdebe39ff00ce6e7d54c5666f5aa706c76c6dc751e3b03aef4ffb7b17a2751b18ca5c2b018d688647601796749fb77ed7a3ec3fd3bd767d9e663d5dccd9bbf91fbffc85e8dd5fd6fb33f4810e9824c73e4377f2538b8d9fe6b679d93f5aba474ee97fb0a8aeefb45765d962c0d3efb1cc7d3fce5b4bbe83bd3f6aa797f5fba90c3bb07eb1fd5fb2c17b5d55fe9bacaab731c36c343997ed77eebd992baceb5e84606cfe6f69d91fbbfa1f4d54c3fb4fda87a3bb91ba263f953b53314704e00e4e1190c8dfab83271711e16a48cacd3e77d333fea361e6d197633aa38e3bdb6369b0e358ddec70b3739cd76358ff00a1fbabb2ff00c743eac3de086e5c8ec296189f3f59cd5a79de87a8ef5fd2d93fe1f66dff00c1d67e6ffcd4f4df1fb27d5de376efb3786be9edfcc4ecb839626f24e8f8cd0252edf8356fff0019df572096b330920b7deca8083ff5efe4abff0057beb13faae33f3710d94d36e55ad0d706b498151dce6b4d8dfcf5955ffcd6d8f9fd99ea6ed23ecd11e4b5feae7eccfd9fecfa3f68b367d93d3f4a7dbbbe8fb777ef28e31e531c8481133dac653fe2abd474fec7ffd9003842494d042100000000005300000001010000000f00410064006f00620065002000500068006f0074006f00730068006f00700000001200410064006f00620065002000500068006f0074006f00730068006f007000200043004300000001003842494d0fa00000000006166d6f707400000003000000010000000000000007000000010000000000010000ffffffffffffffff0000004d00000001ffffffff0000000000000000000000000000000100000000ffffffff0000000004ffffffff00000000ffffffff00000000ffffffff00000000ffffffff0000000000000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff000000ff00000000000000000000000000000194000000100000000100000000000e54617267657453657474696e677300000009000000004d7474434f626a630000000100000000000a4e6174697665517561640000000300000000426c20206c6f6e67000000ff0000000047726e206c6f6e67000000ff00000000526420206c6f6e67000000ff000000004f70746d626f6f6c0100000000516c74796c6f6e670000004d0000000a626c7572416d6f756e74646f756200000000000000000000000f656d62656449434350726f66696c65626f6f6c000000000a66696c65466f726d6174656e756d0000000a46696c65466f726d6174000000004a5045470000000c6e6f4d61747465436f6c6f72626f6f6c000000000b70726f6772657373697665626f6f6c000000000c7a6f6e65645175616c6974794f626a63000000010000000000095a6f6e6564496e666f00000004000000096368616e6e656c49446c6f6e67ffffffff0000000d656d70686173697a6554657874626f6f6c0000000010656d70686173697a65566563746f7273626f6f6c0000000005666c6f6f726c6f6e67000000003842494d0fa100000000002d6d73657400000010000000010000000000046e756c6c000000010000000756657273696f6e6c6f6e6700000000003842494d0fa20000000000086d733477000000023842494d04060000000000070008000000010100ffe132c5687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e352d633031342037392e3135313438312c20323031332f30332f31332d31323a30393a31352020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a70686f746f73686f703d22687474703a2f2f6e732e61646f62652e636f6d2f70686f746f73686f702f312e302f2220786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73744576743d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f757263654576656e74232220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343202857696e646f7773292220786d703a437265617465446174653d22323031342d31302d31375431343a31363a32392b30323a30302220786d703a4d65746164617461446174653d22323031362d30312d32395431303a31383a31392b30313a30302220786d703a4d6f64696679446174653d22323031362d30312d32395431303a31383a31392b30313a3030222070686f746f73686f703a4c6567616379495054434469676573743d223930363944394530463545414145383146313132413937334130323432383538222070686f746f73686f703a436f6c6f724d6f64653d2233222070686f746f73686f703a49434350726f66696c653d22735247422049454336313936362d322e31222064633a666f726d61743d22696d6167652f6a7065672220786d704d4d3a496e7374616e636549443d22786d702e6969643a35663930623030632d386364632d373834612d383064652d3231643861353165393536632220786d704d4d3a446f63756d656e7449443d22786d702e6469643a45373832333732364637353545343131394338324545424430303041373042382220786d704d4d3a4f726967696e616c446f63756d656e7449443d22786d702e6469643a4537383233373236463735354534313139433832454542443030304137304238223e203c70686f746f73686f703a446f63756d656e74416e636573746f72733e203c7264663a4261673e203c7264663a6c693e30374346453139424545463830393035384145433944384630304634373731373c2f7264663a6c693e203c7264663a6c693e30444430303534303346314431394135333546363132374430343733303237393c2f7264663a6c693e203c7264663a6c693e31433833343542314532434246314134413444383531464631333239414238393c2f7264663a6c693e203c7264663a6c693e32373341464143343732444132333636374632413136343739323438324635443c2f7264663a6c693e203c7264663a6c693e32453241413646463637333544414333413441313939383436454631453733463c2f7264663a6c693e203c7264663a6c693e33364535334545413138413832314144463146393642344535424635343544353c2f7264663a6c693e203c7264663a6c693e33383643443846454131463344453244354437453937364142413733314334333c2f7264663a6c693e203c7264663a6c693e33393233384433423343324342344535434131313436364133363142314431383c2f7264663a6c693e203c7264663a6c693e35343536454542363831393837463039453146453939364644343541393833313c2f7264663a6c693e203c7264663a6c693e35393631314434373744424333373243353041434637314133454434333338413c2f7264663a6c693e203c7264663a6c693e39313230383135353735394632454537463841444538364636364237303638313c2f7264663a6c693e203c7264663a6c693e39314338453746383946463336364334453644313737414232343038344646433c2f7264663a6c693e203c7264663a6c693e39414532354142424434413246373242343437304635414132453045304138463c2f7264663a6c693e203c7264663a6c693e41343145383935414437454646444236354530463643323546453832324642453c2f7264663a6c693e203c7264663a6c693e41383946393846393539344142313537393131383732373946374538353539303c2f7264663a6c693e203c7264663a6c693e42373233373030333739304537373134413639303930353545444130423137333c2f7264663a6c693e203c7264663a6c693e43413641433745353645374341393345323443343133443644324243393944443c2f7264663a6c693e203c7264663a6c693e44333146423242334446373832424337463746463238454335454642374246313c2f7264663a6c693e203c7264663a6c693e45363536384330433543313239443830463430413841383241313837464133303c2f7264663a6c693e203c7264663a6c693e46353237343138414433434631334141433341434137463745333634384338323c2f7264663a6c693e203c7264663a6c693e46364230343538353042313943333935333041463030313743383936464439303c2f7264663a6c693e203c7264663a6c693e46374144453842363731323144343339383433333030323530424133453834453c2f7264663a6c693e203c7264663a6c693e46423433364237324439454139453035413646433830304139364138374242463c2f7264663a6c693e203c7264663a6c693e61646f62653a646f6369643a70686f746f73686f703a30623830313966312d643639392d313165312d623365332d3936353037343635343635323c2f7264663a6c693e203c7264663a6c693e61646f62653a646f6369643a70686f746f73686f703a61613764386134662d623434362d313164662d386439642d3861666561336434336462663c2f7264663a6c693e203c7264663a6c693e757569643a32393232363030374633413545303131414138464241454134453243303939413c2f7264663a6c693e203c7264663a6c693e757569643a32434432423042373930313845333131413036334232464633363035383238413c2f7264663a6c693e203c7264663a6c693e757569643a33413531323041443735354245323131413332314442414542334431394636373c2f7264663a6c693e203c7264663a6c693e757569643a37393745373745414334303145343131383138414433323035393243343237313c2f7264663a6c693e203c7264663a6c693e757569643a38333330393537454637304445323131393945354639454239334136303544303c2f7264663a6c693e203c7264663a6c693e757569643a38454436343036354231303745303131424538373945324534424237453143393c2f7264663a6c693e203c7264663a6c693e757569643a44433631373231464544413045323131413642434136334635354443363133443c2f7264663a6c693e203c7264663a6c693e757569643a66616635626464352d626133642d313164612d616433312d6433336437353138326631623c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30303830313137343037323036383131383843364446423942413331373443313c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30313830313137343037323036383131414341464339353644383945373141433c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30313836333834612d383861642d343037332d393665302d3334313033323666363437383c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30323735443839444330343345313131394134323830333730413438363544363c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30323830313137343037323036383131383232413932343634423838324436383c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30323830313137343037323036383131383232414333424636363544343143303c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30333830313137343037323036383131383731464538313342373030384534363c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30333932303835353745353945323131393734454446374339334442363030433c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30343046343644333534303645333131383544463841333244373043414446343c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30363031613438642d633137322d346531662d383539652d6132306162323639396365313c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30363830313137343037323036383131383232414338383546434545414145353c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30373830313137343037323036383131423736304531424630324141414532423c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30433442334143344433463545323131383031304534434637453433344442313c2f7264663a6c693e203c7264663a6c693e786d702e6469643a30443139453339393042323036383131384331344644324239343445393338363c2f7264663a6c693e203c7264663a6c693e786d702e6469643a31313045353832423338363345343131413233324631324434343335423646433c2f7264663a6c693e203c7264663a6c693e786d702e6469643a31354238443543373844423745333131394434344239333442463337304239323c2f7264663a6c693e203c7264663a6c693e786d702e6469643a31376335346338352d396537352d316234362d613334322d6264626665353633616263633c2f7264663a6c693e203c7264663a6c693e786d702e6469643a31376633646661362d656230632d346433302d393638642d6465363962653737633766313c2f7264663a6c693e203c7264663a6c693e786d702e6469643a31433733303033323142313945323131424142373845374630344532444344413c2f7264663a6c693e203c7264663a6c693e786d702e6469643a31613730393264332d653965632d346530382d393663332d3232333065613263336334383c2f7264663a6c693e203c7264663a6c693e786d702e6469643a31636435396234612d376638642d656134662d623339642d6231653833633534383864313c2f7264663a6c693e203c7264663a6c693e786d702e6469643a32344342303941413543393445333131423045364536323137324144454544343c2f7264663a6c693e203c7264663a6c693e786d702e6469643a33323444364345464444364645343131414530354135434536394233413438413c2f7264663a6c693e203c7264663a6c693e786d702e6469643a33323838413142363030423745323131383630434546464139323235433935323c2f7264663a6c693e203c7264663a6c693e786d702e6469643a33333766636335642d376133312d663734342d383865372d3133643135393533353863353c2f7264663a6c693e203c7264663a6c693e786d702e6469643a33333938453732323544393445333131423045364536323137324144454544343c2f7264663a6c693e203c7264663a6c693e786d702e6469643a33363832313031333537324345333131383033334334353831393836434546453c2f7264663a6c693e203c7264663a6c693e786d702e6469643a33383436323144333343344245343131413434463932333331463133354335343c2f7264663a6c693e203c7264663a6c693e786d702e6469643a34316539393839612d333664662d363634332d623431352d3031306239656137343465303c2f7264663a6c693e203c7264663a6c693e786d702e6469643a34363736336530662d626232322d343263322d626561342d3232393434613032316361323c2f7264663a6c693e203c7264663a6c693e786d702e6469643a34373442343542373032384545313131393732414133334441384243454434343c2f7264663a6c693e203c7264663a6c693e786d702e6469643a34383432463039443130323036383131383232414346374235423945453532413c2f7264663a6c693e203c7264663a6c693e786d702e6469643a34394345453046354130353245323131424330304443363142373831363730423c2f7264663a6c693e203c7264663a6c693e786d702e6469643a35313438333863652d643165302d643334392d383834312d6439356432643139643137653c2f7264663a6c693e203c7264663a6c693e786d702e6469643a35323830343644353641334245313131394642454332413938453230433934303c2f7264663a6c693e203c7264663a6c693e786d702e6469643a35373430313546304530323036383131384331344344313030444346373636413c2f7264663a6c693e203c7264663a6c693e786d702e6469643a35463233443845364332373045323131413939344645393033444336353037313c2f7264663a6c693e203c7264663a6c693e786d702e6469643a36354144344333363437384645333131413141423842304632373246313144343c2f7264663a6c693e203c7264663a6c693e786d702e6469643a36363241323032413832373045313131384335414244414245324141414436383c2f7264663a6c693e203c7264663a6c693e786d702e6469643a36384238454641393846354545343131413534314535423636353538393636313c2f7264663a6c693e203c7264663a6c693e786d702e6469643a36394638463246454537414245343131383935413930333539394446313645343c2f7264663a6c693e203c7264663a6c693e786d702e6469643a36434443454130413436323036383131393130393932323243453632334146433c2f7264663a6c693e203c7264663a6c693e786d702e6469643a36616661396332322d393835362d343134332d623836352d3039366334623362616237663c2f7264663a6c693e203c7264663a6c693e786d702e6469643a37343041374134413130323036383131383232414646303039344436394442313c2f7264663a6c693e203c7264663a6c693e786d702e6469643a37393765666466322d623461652d323134302d396637382d3531643630656533613366363c2f7264663a6c693e203c7264663a6c693e786d702e6469643a37396533656234612d353736342d343565342d396566342d3164653331336264666334313c2f7264663a6c693e203c7264663a6c693e786d702e6469643a37414234383232424337313345323131393937343837313238373030463239383c2f7264663a6c693e203c7264663a6c693e786d702e6469643a37434433443438343834353545323131383334314430313246443534464544433c2f7264663a6c693e203c7264663a6c693e786d702e6469643a38413539353138314238464445323131423132323932414546454138303843413c2f7264663a6c693e203c7264663a6c693e786d702e6469643a38633361623561362d643434322d343634312d623733612d6132623932343463306533303c2f7264663a6c693e203c7264663a6c693e786d702e6469643a39303632314543354336444645313131413146344432453642323843384636363c2f7264663a6c693e203c7264663a6c693e786d702e6469643a39326363376632362d373332622d636234392d613334372d6332326337323033336662373c2f7264663a6c693e203c7264663a6c693e786d702e6469643a39364238333436414534394645343131393344324343434230313535323137353c2f7264663a6c693e203c7264663a6c693e786d702e6469643a39423546393339363041323036383131383232413835423333303144383543423c2f7264663a6c693e203c7264663a6c693e786d702e6469643a39433231324532323845333245333131414639354637363632433638303932373c2f7264663a6c693e203c7264663a6c693e786d702e6469643a39453642323933444134384145323131384235374531353137334533323236353c2f7264663a6c693e203c7264663a6c693e786d702e6469643a39623162643631332d373366622d343633612d623133642d6566323362613231343365363c2f7264663a6c693e203c7264663a6c693e786d702e6469643a41304635363435443334363345343131413241344339453837424534343146363c2f7264663a6c693e203c7264663a6c693e786d702e6469643a41333642323933444134384145323131384235374531353137334533323236353c2f7264663a6c693e203c7264663a6c693e786d702e6469643a41363832423736323031384545313131423042433933354645323135383141353c2f7264663a6c693e203c7264663a6c693e786d702e6469643a41374336424537323839374545313131383541444335393231333835344631443c2f7264663a6c693e203c7264663a6c693e786d702e6469643a41433045303633373131383745313131393033354342353330313141444246333c2f7264663a6c693e203c7264663a6c693e786d702e6469643a42314342303939354236413045343131393344324343434230313535323137353c2f7264663a6c693e203c7264663a6c693e786d702e6469643a42333337343232454142324545333131384239454431333943414646424645333c2f7264663a6c693e203c7264663a6c693e786d702e6469643a42333434333442353541443745323131414142384430344338373246453631393c2f7264663a6c693e203c7264663a6c693e786d702e6469643a42333833393230314441383045323131414131383930454331344541353438333c2f7264663a6c693e203c7264663a6c693e786d702e6469643a42344531314231363742433645313131413345454636454234423145324241433c2f7264663a6c693e203c7264663a6c693e786d702e6469643a42384635334142424135353445303131413132314537363846343638453934443c2f7264663a6c693e203c7264663a6c693e786d702e6469643a42444639394432423041323036383131384442423931344232454130463645333c2f7264663a6c693e203c7264663a6c693e786d702e6469643a43434134394536423330323036383131393130394343413037384344344644433c2f7264663a6c693e203c7264663a6c693e786d702e6469643a43443942373039453236333245313131394132334439354346424637383035373c2f7264663a6c693e203c7264663a6c693e786d702e6469643a44314346393344414242413945323131413534414135413243314643343834303c2f7264663a6c693e203c7264663a6c693e786d702e6469643a44424632443041334530303545343131424546393931393739434541363436393c2f7264663a6c693e203c7264663a6c693e786d702e6469643a45343731443542313239343245343131423743304537414441353434384242373c2f7264663a6c693e203c7264663a6c693e786d702e6469643a45373346454636464138433745323131383046373937413545434138463743453c2f7264663a6c693e203c7264663a6c693e786d702e6469643a45373832333732364637353545343131394338324545424430303041373042383c2f7264663a6c693e203c7264663a6c693e786d702e6469643a45433139374133413332323036383131383232414246464432323845354241303c2f7264663a6c693e203c7264663a6c693e786d702e6469643a46334231453733304634353545323131383545454234354636363632463934453c2f7264663a6c693e203c7264663a6c693e786d702e6469643a46363533313546373546334445323131423332454338394431413432363533383c2f7264663a6c693e203c7264663a6c693e786d702e6469643a46373746313137343037323036383131384636324146313836374536373833433c2f7264663a6c693e203c7264663a6c693e786d702e6469643a46383746313137343037323036383131383232414439413944343941364532413c2f7264663a6c693e203c7264663a6c693e786d702e6469643a46393746313137343037323036383131413742354144313636363736443531443c2f7264663a6c693e203c7264663a6c693e786d702e6469643a46394542364538464135304245323131423239444533363333384331334239433c2f7264663a6c693e203c7264663a6c693e786d702e6469643a46424130363246323033433345323131383235384445413135344545443233413c2f7264663a6c693e203c7264663a6c693e786d702e6469643a46463242333043303045323036383131383232414236414535373344364244333c2f7264663a6c693e203c7264663a6c693e786d702e6469643a61366161323330312d343637652d663134632d613564612d6136646534666461663830623c2f7264663a6c693e203c7264663a6c693e786d702e6469643a61393633633164392d316461612d346239312d613763332d6534383132333337343531623c2f7264663a6c693e203c7264663a6c693e786d702e6469643a62653636323866352d353432372d346262342d626538612d3336386435613266366638383c2f7264663a6c693e203c7264663a6c693e786d702e6469643a63396464643066352d343634622d303734312d393730662d6366666537313935376365343c2f7264663a6c693e203c7264663a6c693e786d702e6469643a64323736323961372d383530362d616634652d623864382d3938616433386663363834643c2f7264663a6c693e203c7264663a6c693e786d702e6469643a65393166636232392d623437392d343363382d386661372d3833663364623434653334333c2f7264663a6c693e203c7264663a6c693e786d702e6469643a65626430326436382d333265312d346633362d623734382d6235376534613366343665303c2f7264663a6c693e203c2f7264663a4261673e203c2f70686f746f73686f703a446f63756d656e74416e636573746f72733e203c786d704d4d3a486973746f72793e203c7264663a5365713e203c7264663a6c692073744576743a616374696f6e3d2263726561746564222073744576743a696e7374616e636549443d22786d702e6969643a4537383233373236463735354534313139433832454542443030304137304238222073744576743a7768656e3d22323031342d31302d31375431343a31363a32392b30323a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f7020435336202857696e646f777329222f3e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a3130364543394638324235384534313142414232434132303533303330343430222073744576743a7768656e3d22323031342d31302d32305431303a32343a31362b30323a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f7020435336202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a4234374233333039374336414534313139384234384232463543453430303138222073744576743a7768656e3d22323031342d31312d31325431353a35393a35302b30313a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f7020435336202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c7264663a6c692073744576743a616374696f6e3d22636f6e766572746564222073744576743a706172616d65746572733d2266726f6d206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f7020746f20696d6167652f6a706567222f3e203c7264663a6c692073744576743a616374696f6e3d2264657269766564222073744576743a706172616d65746572733d22636f6e7665727465642066726f6d206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f7020746f20696d6167652f6a706567222f3e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a4235374233333039374336414534313139384234384232463543453430303138222073744576743a7768656e3d22323031342d31312d31325431353a35393a35302b30313a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f7020435336202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a4434433538384243423941304534313139334432434343423031353532313735222073744576743a7768656e3d22323031352d30312d32305431373a33343a31342b30313a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f7020435336202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c7264663a6c692073744576743a616374696f6e3d22636f6e766572746564222073744576743a706172616d65746572733d2266726f6d20696d6167652f6a70656720746f206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f70222f3e203c7264663a6c692073744576743a616374696f6e3d2264657269766564222073744576743a706172616d65746572733d22636f6e7665727465642066726f6d20696d6167652f6a70656720746f206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f70222f3e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a4435433538384243423941304534313139334432434343423031353532313735222073744576743a7768656e3d22323031352d30312d32305431373a33343a31342b30313a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f7020435336202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a32626636313262302d333062382d336234362d393764392d306137356631323632363234222073744576743a7768656e3d22323031362d30312d32395431303a31383a31392b30313a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f70204343202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c7264663a6c692073744576743a616374696f6e3d22636f6e766572746564222073744576743a706172616d65746572733d2266726f6d206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f7020746f20696d6167652f6a706567222f3e203c7264663a6c692073744576743a616374696f6e3d2264657269766564222073744576743a706172616d65746572733d22636f6e7665727465642066726f6d206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f7020746f20696d6167652f6a706567222f3e203c7264663a6c692073744576743a616374696f6e3d227361766564222073744576743a696e7374616e636549443d22786d702e6969643a35663930623030632d386364632d373834612d383064652d323164386135316539353663222073744576743a7768656e3d22323031362d30312d32395431303a31383a31392b30313a3030222073744576743a736f6674776172654167656e743d2241646f62652050686f746f73686f70204343202857696e646f777329222073744576743a6368616e6765643d222f222f3e203c2f7264663a5365713e203c2f786d704d4d3a486973746f72793e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a32626636313262302d333062382d336234362d393764392d306137356631323632363234222073745265663a646f63756d656e7449443d22786d702e6469643a4537383233373236463735354534313139433832454542443030304137304238222073745265663a6f726967696e616c446f63756d656e7449443d22786d702e6469643a4537383233373236463735354534313139433832454542443030304137304238222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203c3f787061636b657420656e643d2277223f3effe20c584943435f50524f46494c4500010100000c484c696e6f021000006d6e74725247422058595a2007ce00020009000600310000616373704d5346540000000049454320735247420000000000000000000000010000f6d6000100000000d32d4850202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001163707274000001500000003364657363000001840000006c77747074000001f000000014626b707400000204000000147258595a00000218000000146758595a0000022c000000146258595a0000024000000014646d6e640000025400000070646d6464000002c400000088767565640000034c0000008676696577000003d4000000246c756d69000003f8000000146d6561730000040c0000002474656368000004300000000c725452430000043c0000080c675452430000043c0000080c625452430000043c0000080c7465787400000000436f70797269676874202863292031393938204865776c6574742d5061636b61726420436f6d70616e790000646573630000000000000012735247422049454336313936362d322e31000000000000000000000012735247422049454336313936362d322e31000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058595a20000000000000f35100010000000116cc58595a200000000000000000000000000000000058595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf64657363000000000000001649454320687474703a2f2f7777772e6965632e636800000000000000000000001649454320687474703a2f2f7777772e6965632e63680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000064657363000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d207352474200000000000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d20735247420000000000000000000000000000000000000000000064657363000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e3100000000000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e31000000000000000000000000000000000000000000000000000076696577000000000013a4fe00145f2e0010cf140003edcc0004130b00035c9e0000000158595a2000000000004c09560050000000571fe76d6561730000000000000001000000000000000000000000000000000000028f0000000273696720000000004352542063757276000000000000040000000005000a000f00140019001e00230028002d00320037003b00400045004a004f00540059005e00630068006d00720077007c00810086008b00900095009a009f00a400a900ae00b200b700bc00c100c600cb00d000d500db00e000e500eb00f000f600fb01010107010d01130119011f0125012b01320138013e0145014c0152015901600167016e0175017c0183018b0192019a01a101a901b101b901c101c901d101d901e101e901f201fa0203020c0214021d0226022f02380241024b0254025d02670271027a0284028e029802a202ac02b602c102cb02d502e002eb02f50300030b03160321032d03380343034f035a03660372037e038a039603a203ae03ba03c703d303e003ec03f9040604130420042d043b0448045504630471047e048c049a04a804b604c404d304e104f004fe050d051c052b053a05490558056705770586059605a605b505c505d505e505f6060606160627063706480659066a067b068c069d06af06c006d106e306f507070719072b073d074f076107740786079907ac07bf07d207e507f8080b081f08320846085a086e0882089608aa08be08d208e708fb09100925093a094f09640979098f09a409ba09cf09e509fb0a110a270a3d0a540a6a0a810a980aae0ac50adc0af30b0b0b220b390b510b690b800b980bb00bc80be10bf90c120c2a0c430c5c0c750c8e0ca70cc00cd90cf30d0d0d260d400d5a0d740d8e0da90dc30dde0df80e130e2e0e490e640e7f0e9b0eb60ed20eee0f090f250f410f5e0f7a0f960fb30fcf0fec1009102610431061107e109b10b910d710f511131131114f116d118c11aa11c911e81207122612451264128412a312c312e31303132313431363138313a413c513e5140614271449146a148b14ad14ce14f01512153415561578159b15bd15e0160316261649166c168f16b216d616fa171d17411765178917ae17d217f7181b18401865188a18af18d518fa19201945196b199119b719dd1a041a2a1a511a771a9e1ac51aec1b141b3b1b631b8a1bb21bda1c021c2a1c521c7b1ca31ccc1cf51d1e1d471d701d991dc31dec1e161e401e6a1e941ebe1ee91f131f3e1f691f941fbf1fea20152041206c209820c420f0211c2148217521a121ce21fb22272255228222af22dd230a23382366239423c223f0241f244d247c24ab24da250925382568259725c725f726272657268726b726e827182749277a27ab27dc280d283f287128a228d429062938296b299d29d02a022a352a682a9b2acf2b022b362b692b9d2bd12c052c392c6e2ca22cd72d0c2d412d762dab2de12e162e4c2e822eb72eee2f242f5a2f912fc72ffe3035306c30a430db3112314a318231ba31f2322a3263329b32d4330d3346337f33b833f1342b3465349e34d83513354d358735c235fd3637367236ae36e937243760379c37d738143850388c38c839053942397f39bc39f93a363a743ab23aef3b2d3b6b3baa3be83c273c653ca43ce33d223d613da13de03e203e603ea03ee03f213f613fa23fe24023406440a640e74129416a41ac41ee4230427242b542f7433a437d43c044034447448a44ce45124555459a45de4622466746ab46f04735477b47c04805484b489148d7491d496349a949f04a374a7d4ac44b0c4b534b9a4be24c2a4c724cba4d024d4a4d934ddc4e254e6e4eb74f004f494f934fdd5027507150bb51065150519b51e65231527c52c75313535f53aa53f65442548f54db5528557555c2560f565c56a956f75744579257e0582f587d58cb591a596959b85a075a565aa65af55b455b955be55c355c865cd65d275d785dc95e1a5e6c5ebd5f0f5f615fb36005605760aa60fc614f61a261f56249629c62f06343639763eb6440649464e9653d659265e7663d669266e8673d679367e9683f689668ec6943699a69f16a486a9f6af76b4f6ba76bff6c576caf6d086d606db96e126e6b6ec46f1e6f786fd1702b708670e0713a719571f0724b72a67301735d73b87414747074cc7528758575e1763e769b76f8775677b37811786e78cc792a798979e77a467aa57b047b637bc27c217c817ce17d417da17e017e627ec27f237f847fe5804780a8810a816b81cd8230829282f4835783ba841d848084e3854785ab860e867286d7873b879f8804886988ce8933899989fe8a648aca8b308b968bfc8c638cca8d318d988dff8e668ece8f368f9e9006906e90d6913f91a89211927a92e3934d93b69420948a94f4955f95c99634969f970a977597e0984c98b89924999099fc9a689ad59b429baf9c1c9c899cf79d649dd29e409eae9f1d9f8b9ffaa069a0d8a147a1b6a226a296a306a376a3e6a456a4c7a538a5a9a61aa68ba6fda76ea7e0a852a8c4a937a9a9aa1caa8fab02ab75abe9ac5cacd0ad44adb8ae2daea1af16af8bb000b075b0eab160b1d6b24bb2c2b338b3aeb425b49cb513b58ab601b679b6f0b768b7e0b859b8d1b94ab9c2ba3bbab5bb2ebba7bc21bc9bbd15bd8fbe0abe84beffbf7abff5c070c0ecc167c1e3c25fc2dbc358c3d4c451c4cec54bc5c8c646c6c3c741c7bfc83dc8bcc93ac9b9ca38cab7cb36cbb6cc35ccb5cd35cdb5ce36ceb6cf37cfb8d039d0bad13cd1bed23fd2c1d344d3c6d449d4cbd54ed5d1d655d6d8d75cd7e0d864d8e8d96cd9f1da76dafbdb80dc05dc8add10dd96de1cdea2df29dfafe036e0bde144e1cce253e2dbe363e3ebe473e4fce584e60de696e71fe7a9e832e8bce946e9d0ea5beae5eb70ebfbec86ed11ed9cee28eeb4ef40efccf058f0e5f172f1fff28cf319f3a7f434f4c2f550f5def66df6fbf78af819f8a8f938f9c7fa57fae7fb77fc07fc98fd29fdbafe4bfedcff6dffffffee000e41646f626500644000000001ffdb008400010101010101010101010101010101010101010101010101010101010101010101010101010101010101010202020202020202020202030303030303030303030101010101010101010101020201020203030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303ffc0001108044a046003011100021101031101ffdd0004008cffc401a20000000602030100000000000000000000070806050409030a0201000b0100000603010101000000000000000000060504030702080109000a0b1000020103040103030203030302060975010203041105120621071322000831144132231509514216612433175271811862912543a1b1f02634720a19c1d13527e1533682f192a24454734546374763285556571ab2c2d2e2f2648374938465a3b3c3d3e3293866f3752a393a48494a58595a6768696a767778797a85868788898a9495969798999aa4a5a6a7a8a9aab4b5b6b7b8b9bac4c5c6c7c8c9cad4d5d6d7d8d9dae4e5e6e7e8e9eaf4f5f6f7f8f9fa110002010302040403050404040606056d010203110421120531060022134151073261147108428123911552a162163309b124c1d14372f017e18234259253186344f1a2b226351954364564270a7383934674c2d2e2f255657556378485a3b3c3d3e3f3291a94a4b4c4d4e4f495a5b5c5d5e5f52847576638768696a6b6c6d6e6f667778797a7b7c7d7e7f7485868788898a8b8c8d8e8f839495969798999a9b9c9d9e9f92a3a4a5a6a7a8a9aaabacadaeafaffda000c03010002110311003f00d65d878db4ab8910a8b7f5bf248bff0041ef1acad46477f4127460081c7aca036901ca826c6c2c781cdb9f6c914391d25780953515fdbd627bdc9462a6e0f17e7904f07837f753fcba432454cd31d668dbd6ae0e96bf20f07fa7fafed964f3031d27284608ea579f4b3c9a8a18d41fab36b0dc101493ff001af695a2d449e9968c135ea5239b21672be31ac1d7f5f27d0053cf039fe9ed3bc40d453a4463a06a8c74a04adf2477652ac157498c0064b7d1994706dfeb7b2f64a1a0e914895351c7cfa7586b9c4891bc84c6ca1556e4331e386b58d8fe4fb659050d07774948e9e2295d4f058988deeac6c7eb65b5f4d80ff63ed3346322946e9b0687863a725a85668597e82fadd00575feb7b5891cfb4c6239d5d383ba800e9d17205df4b3a3c770147a549b8201d24692df8febedaf06809a7775b64f2a74f2aeeb1c6f12b9461fbb19bf940e2c636b9bb5edf5fc7b4cc016a1f4ea9403cb3d4c8e5d614f0081e9fa96038367ff006abfb61a3d048073d6b42d6b4cf597d32117235036d5cdb8e6cc7e807b6994af5b350069ea5bbaf8d2fcddd543adace7fb4bc5bfb36e6ded9ee2c7c8f54d27d3ae95e3691e370742c964d162349b7ea3c122e3fafbd10573c49ebc411c463a90a6284c96ff0036482a17f5166e4f20dfdfaa58a8619ebd53e7c3ac5039f2302c6d72c10801945ffd617bdfded95403419eab43524f0ea487b5cda42fc9d449b5b8f4d8dc73ee814b569d6fa951c91b13116218a86bd81079b80d71f5047fc57de9948a671d59686bd42c9569a584a40754ae1c84426e49fd46c0fa4dcfe3dbb041aa8cdfd98eac7b14b05fcbaef0e6a12586a2a12c82400a91aac19349b924ff005fcfd7ddae4461485e3d3a2325559bfe2ba12f0984abc8d7c54d434ffc462244da4386fda66b142b6f41506fa8f1ec3f79751db40f23b8571c2be7f3e989da3589f5f430efea8a5c16dbc66dcc72252d4d4b796b555cfedc50aab5ed7d68ec45adf46fafb086d31c97b7f717d230688540c79f1e83728776d51834ad3a67c7d4492d2c26918cecd01bacae15808fd5a181fc9bf1f4e3dbf3a7ea319053a4f7116a565a6474a24c94d4a90c8e0832bc08da2cc57fb562dc80016f680db2396201ad3e7d21743a69e5f674f914cccf782d1397692325d40743fe7750503ebfe3cfb44f0d077ad569d32f1b15c01d2a69ebaa2358998a491a10933af0c124365728793a4af3f8b7b2c92104b5171d229237270a01e94d4d5111b682759b8b1161621891e9b022e2ff004f685a326a08c74c9146ee1434e94345913098d7c7ad56e859493a51b4906cc48b16f65f2c0c41ce3a4b242486f4a74ada1ae63a1000ff00528aae4111905893cfd47e01f6593c268c6bd1650a93538e9494d3eb453ac06d3aaff53a6e6c437d518fe6d6e7d96152334ea85abd3aa572c5146801d6598ad86a4941faab160c449cfe3ebed86883bb33703d50ad4f4f94b5a65d21349517040fd496faabfd0823fdb7b452c056bebd34ea40ed39e9fe9aac1f4960753b04d24329216fff0006e0ff005ff7af689e3d39a75b5240009cf4f54f5252da802ed6d0e35588b59aea0fd6e2df9bfb648a9af4e2b52b5e9f61a8463a4480ab73fd391f51cf22c47f5f69dd3d057a756840f51d3c41282aaead76bd883fe07fc3ea38f6d5298e94acc57078f4f14d54b7d4dc30b060cbc3f3f550069ff63edb7534a8181d184525429f3a74f94b3d832e961721ac6e00bdff00db0f6df4b55b0081d3f4350495427fb1700db4807fa1b7bf789460a0f4aa19e9a549e9ca3987a79009fcff005ff88f6f2b06e1d1a453eb343d3be2aa122ad884a1248e56551e59142433b34660a96041fda808b91fef1ecd36fd2b382ea70ca06af846af3f514f974636ea1b510dc4746bb23571ed5cd7f0aaccbd256ad5e1f0f554f91a39c351ced98a082afc74c626621ff7b429e2cfc691f5f7286eb1fee1dc56c25be8670d6f13a98c920f88808afcc5687f9f549e3315286a3a5cd06e89aaeaf06721224d478fa5a6c73ad2c62391a9e09e575f2c4badbccaaecaa47361f53ece60de5ae2e76e92e7fdc78d420d1c4a2e0e062a334c67adf8ab2b21718e1d2feb33403535763ea249e8ea2693f871aa8248e66a5a66d32c3521fe9509aeebc0248f67975b825617b498b4458e805483a6bc4d3f101fcfadb3e08af6ff00aa9d29696b16a69e08e466768dda179ddb9990b0902b15b1b2b1fa7fb0f66905e89634272c715f3e9d4938571d2ef6d673214f2cb4f8e683ee73a7ecab23a8895a2a88639049153000d8ab68e4f04fd09b71ee4fe40e63dcac2f25b2db7c233deb2c654fc0e178015f30789fe7d08f62be9a197c3840632633d77971578ddd536465c74740cd152d3d6d34002c34a66f4c0d191fa239cfea4fafb30e67b9bcb1e70b8bcb8b05b593c30248d3e150d8afcebc73f974b370775bf7d508047483ec2c0fda55535721510cac0a3201e3666120786403f4b46c011fd749bfb8bb9eb673b6dec13ab031364119d55f5f4fe5d073708be9e4621aa878f40de462a9815658e369fc8c9154c216eeb097d2672bc8ff00903ebec8b61deaf765769a305a33f1271aff00947e54e95ed7b8b5abd413a7acf85af8f0d5c0d44105662b2d14b4b5f47344268569de331a178eda409e363abfa1e7ea3dcf9c9dcdf049344c24a19788c76f5246c7bcab494d743f9741f6e7d9a3afaa69b2bb7e9aa6ab68662714d2b25a638569cbcd0c5597f4e98f5928f6fde8cf2750e666b3b9896313c3943e5d4a56974974996eeea361a8a9ccb24ea918192bc2748f1584521d0d66b1577b5c5bfd87b31448d98c9c2bc7a310c68ade83a47f70616aab7acfb93178ca57ada8cc7556f4a0a7c7c11297c8d51c2d4ab2425501699ffd8dc8f75f0cc723e80749f4f5f5eafaf52f0ab7975a6075c53b51f5e6efa1ac88d2557f1dc4d50591944cf152452d0d6431c64ea49686a630b27f6aff0081efae9f731e7ae5ebb9772e5596fd63dd27b78da388915731ad1c21386206597881d73d3ef51ca3bbc736c5cc10db33edf04d2248c057c369320bfa063402941d160ee8a759c2441883ad8c44802337e4585af763f9fafb9afdcb81a29e68c2f06aa9fceb4aff00abf675187b6970d1b1722a7cfa29fbb716d42aa246fdd7f09757525e3d515823865b692002bee08dfedbc18e39bf116a53ce94eb20760be8ee195929a34b0f956a474164fa848d61fa41f57e2c7ea79fc73ec21707f4da8334e86b100578f4969c9150c757a44ad72bfeb7f8fe0fb09ce489d483907a3d8bfb25fb3a7ac74a55880351055fea06ab5ac0716fcfb11d9b6a8bb9abd21ba4d4453cfa5fd1cf2140cea11cc77bea00b82b6201b8b5d78f6f042d205a79f4453a160e0bd169fe0eaf2bf97dc52546dcec49e3916514951b40c114a8544be6c6b2ac9a7d21cc654af03e82fef2abd989d536bddede9442c2a7d3e7d61bfbd564973bd6d57ab2567854b05fe2a8229f97560b511c160d2c6018ceb0e17d37742191e51c30bfd07d6fc0f73d4371702b1c4c0c74f33d63e6e3b7d9c83fc6e01ad28d51da0d41a825680fae7f2cf5029b09575c665a48a3b0a79e5694ba46ab1471b5df538b2b4bab85373c71ed2ef3bbc76f168624c84529f6f4e72c72abdf3b5d2269455670d50574508a673ab201539a827cbad96baa824dd45d44cc4b797606d4d04336b6d18aa6889fad998053f4ff006defe7fbdc98f4f3e734ad307719ff00205cff009faee072813fd57d873c2ca01f6fe92ff9bad703f9fcf913b1ba91480237eb89ad703582bb8726034848f4b30e2c2dee2adecb7d4da82d8f08d7f6ff00b27a5b7c46804713d6ba9182d122b1d26e2c6e3ebc13fedc8f614ba3473f67f93a055f7c64fdbd193e992c72103151e349012058963e451abfad87b8c79b8298dc11524751fef2d96a8eb619f85d44f26e3db30d02c28d5594a7ab9cb8d704ec157c91cf1b929a668fd240b0fcdafcfbc6370f73ccd6311c8f140a7cab91d06f6e7f12e1d5c5541eb755eb5a88e2ebac4c52c72432d262a3a7786460c042d1ab40f1c9ea26384bd96f76b7e7df59794848796768565d2896e00f900a7fc9d4dd632c636e24ae7453cf850ff83ad45bf997ec7addd3989f338ea00b8cda7ba377ad79d332180e5eb235a5aebb6a028aa678ca2bff00aa65bf1ef9e1f773b4ff00916fbb5731a69812ff0048f9ea91cd73d04fda2b72b37303eaaeb65fd809c75afe6f3c37db54491491a090495004603b2ab80091a881ad641f8bfa7fd63ef3111869a8e3d4d4d1b015af40b6468659e9679f413578b0f574e6360b2d452c5fbf534a97d25dd563051491722c393ca956014af17a1a7ce82a7f9027f2eb4a353015c74617e61edaddd8aeaef85f87de7b7ab36f64b13f1926c6c18daa6fd7415dd97b9b7662b2a90dd9a05cb61772d34a51b4b2b31041e2ded9965460274d2c622c29fc2d2c8ca7ed208ea853fb520e4b67e7414ff0003aac0ccd23179223688c6ecc09525b40f4b462fcf20ffafec4d149a4d01e929425be5d041b9e94b4120b33b1d7620370186a1abfda481ecdd0ab00de7d55815634e93fb5774677686730dba76d65a7c2ee5da99bc4ee2dbf98a76659b159fc355435989ad56421c2c7570a8702fa919ae0fb4377651ddc4f130a0209a8e38e14f9d7874a15a94a9ebe823d5bf28319f343e006d7f933837868f724f81acc3767edda27f2c9b73b5b6ad19a7dc343511836a68b24e9f794d7035c13dd781ecb64f126b37693fdc88ce8907f487061ea1d723a5b049ae5d2d8c63ad75bb0b64cff0027bac3b33aeda163d8184aeafecbeae8e28a17adc8677151541aedbd4a934d00739fa05685c0707588f8627d9746a086057047f3eb573178d13a83ddd53a6d3c8cc0f8e60f0491cd2c33c12a9124134323433d3488caad1c90488518117d4a7d915ec7dc7d73d049eb1bb46debd0f18ba91324772538b2b1e138b0fc1f645229049ebc08f319e9432c44c6d770d2902ca45d34fe4a916ff6373fd3da5d615801c3ad1f4f2e98268d548b692578e757e6d7fc8bdadef7255b80c1e92ca8450fa74f589a823c6a4ead1a9815e07a78b1b0bfb2a9e3a6ac67a46c284f429e22a5090140f52a9d209fadec49e7f3ec9274ad4d3ad1c8e9774d223aead64ba86b0b2d974916e4820d87e3ebec86ea3208c629d17ce9923cba5446da97d005d9469b7a431fa90c3eabc73fd7d85ef2300b0d3d06afa2c161c7a9e8cc1ae5ae8482ac003f41621bfa2823ebf5f64ce80d411d06e642c6be54e9474536a172cab6b01626cd602e541bdc1bfd7d96c8b43f2e913000d40e9fa29401e40cc8559597e801fad8ff00afa87b46f1862030edea8555b3e63ab22f8b5d8752b83aec6c55be1a88f1f3bab899a3935d2c46ad5c2a292c22fb7b1fc5d8021afec1973ab6cbe94a92be2a1a7db5143fb2b5f2ce47469b5cc90a3435ed26bf9798ea967b57be36e6f8effed0c561292b30785c5e5320b4343972af91accbd24cd1648c7140cd12c71b06d202ea923218693ee76dab94e6db39776bbb721de61ab1f851b2bc3ed3d2bfa01147e332e4b11feafc8f460fa16bb1ebd6df25f74ee095668b1db43aea0d99495118fb79f7455efba4a7a8c95054bc727866c7e125961a868d0b98a4d0cd627d8af68dbe2b7da3996f0ad268a08da23f8bc412ab2b27ae9a51be47a12ed5b715b5bd32801648d80ce722847d841ea92fe53f5dd26c0ded96afa4ac5aac6662b73a30304b1186aa8529f22e67a4af66b01351ad40034d832693f9f7d69e5fe70feb8f286c7cdf77088ef67dbe10c8386ad011a87d3b6bf9f40bd8acded5d76d8947d36b6cfa05c014ff003fdbd1affe5c3f20bafb62418cd81b9367d06473f376be0f71d3ee0ae30454b0edfac9a862ce415f5f24b0ff000ec5b50d2bfdd3fee6ba7d51a805fde3ff00b8db0ee326eb0ee3660bdb9855542d4b06535040f235e0c287a94b65be810fd34eea956c1fe2c50a9af900387035cf459be4dd575fc9defdc87a8e57a8eb47ec5dd4fb1aa02b2473ed87cad44941240b25a45a508e441abd5e203de5b6d977b85c72decc6f0b1bd369187d40162748ad4d3cfa882fa3b24ddefdac028b232be914c0049c0afa79745e3cb2104063eb6176fa03f5b5c0e0920f27ea471f4f689de42142d5403fcc74e100915191d668e2699782a0297d4588e2c8c3d37b9fa31ff6fede88065d5afbbcfaa348233a49607f3eb34928648225445745d2ce8d6f2a2af1aac792bf4febc7bdccf198e3550350e27f3ea81599da4624a9e15ea3f90fd4853ab48fcfd41e00fc5fdb258bc9ae951f67f9ba748269f21d662e649098c37d05902b69b8fa9fc8e6deefa9598b28209f21c3fcdd3750b1e977fe74eb2b8760cc5197d2013a4690dc5c823f17fc7b7d7585ad0ffabe5d323c35a0d5d652a4955e2e8aad727d3c9b156b7e4fb794d248811c47e63aa540d669515ea665717514125205ada1ae8e68125434751e4fb70e2e61a9888ba54203622fc1f6be55b88e48d632190f9d7cbadc33c0e8e6855c7f3ea0b53323a95b032285209e07fbcf163ef4f6a5a752afdda723fc3d6d26ec35e1d485c749aac6541a8dc87608dfa6e6da8a031ff43fef3eec2cd908633a0539a3120fe5d366f230a7f4cd40f2c8fcf8d3a9316d9c86591a1a38ab6a96a049085c7e3aaaba53291ad846208dccceb173a4026dc93ed25fde6d969a22badc618de9abb885a533c4b79fd9d2fb4372ef0c96f60f2678ad683e4707f91eb695dd9d4fbb773ff229eadeadda389cb6efdd9b928ba4b1f16c7c261eaea7702487b3776e5eaea2aa84c41c53aa44b2b093488f4ea3c5bde136c9bad86dfee5ee9bc5e5d8162db83b0201228c5e86b5c8a8afa1fb3a9ed2de7b8d844080adc35b7e63e5d56ffc53f83ff203a57e517c36de1dbfd3f9ed8db2b78fca4eb3d8d8acbe5eb68e1a8acdc15b5753590e3d3154f3cb52ae61889d720552c34fd7dce9bef3cf2cf34f2fef7b76d17e4dd8b624808549543c2a788af9ff0093a8e2db96777d96fec773be80185ae2341dc31a8f1f51519f9758be6d7ccdf94bf30f77777f4162f0d9ac8f5075cf6276154e676b6dcc0d6652ba968f6067f39888b3bbd33aa675fb6c5242f3f8d5a3862d5a991cadc06762e54e53e5ce5cfdf1ba6e41b76bdb6611a484d05412342d6b5e1d09db75dfef7988dadb58d36eb59b4b951965a716ad700fa52bebd125fe5e6bf1cf0bbf7b4f3bf21050d463f11d45b8a836252e5b3d0e1b155bb877063f23846aba98c912e5aa31b12a4b454eac0354302f71ee26dcda66fa468aa52a7f9e3a913c60af1b0f849eabf68b132d556792811ea20a59eb84925f95890d47823717b6a9a2238ff1f674b2a840af4d54e9c0aac1980eead7a1136af447676f2a68f234d8dc7edec355431554393ced74189a7fb7a9902455866a878bf6a6f22db4023503ed34fbc5bd9ab6ac91c3e5d281692c8b2695ad38742f663e32edad858aa3ce6f6dc353b96a27af828862f6eda0a4f3c88ced14d5f56909b46233fa402ff8f643b8735dc00ab6a3453cf8ff0086bd14cf702143e7d1beea3eb0ebca13827c4ed4c552c59489a69a2aa87efab2491630478eb268dbd11ffbb2c058fd3dc6fb86f97d7b7013ea1844fc47afeccfece90fd5dc3ad4501e8e0743ee3a9d99f2330bbb71d0d2475bb07aa7bd775e3e8aa633f6693e0f60e52a2863a88a9da39129e4993d441d5e3fcfb4f69aee6e1636627b5eb5f97f9ba7b6dacf7d6a8c4f74801c9c8a7415e03e577697c8fa5cac1bfc6d74c76cfd8cd95c6d36ddc23630c35f99a6871f209676a9aba9a8823859ada85ac05cfe7dafb7b35845412148e8777d07d3a64f566fd294d3e3fe166d59cd94d56e3ad91cba7ed148a96ae4420202ac0f161f51f93ee9745d2d641c0f40ebf3559086f3e8c4ee8966c17c0eafa9103c428fa53796419ecc8886b70b92f4bcac3c6be4fbb3a45c9e7d87adb50b885554ea07d3d7a66d74fd2ccaadddd6be3f1df1de5db1b199626712be42bd995915955d7d20bbb96bafe2dcf1c7b5bb8c2d2ae95d5503269e5d152b301333ae6bd6e8dfcb7b7bd1657af23cc56e571b1633ac7a5baf765bd6d7e568921a59b05b1339b832ed533d4cd12d3c5064b74329d5cadacdcfb31e5b493c14959a8b0da2c601a0e11c8c4f1afc4e7d7874aeca78c6df6f6f522b2134f5c83fe41c3a3f1f373b576751ff002badf153b7376eddcfff0078627c2473e03378cc9a4956330e95a83ecea6a05a98528592da846585fea2e7dbc4d07ee086d126533bcc8a7491c50d5bf2d2bfcfa57b648b25c2c95c9d47fd5f975a08f7a66953e43d52eba7276bed0daf83a68a799a2856a9b0f149fb93157b689ab4fe0f3f8f614bba2b2556a42f42f868e348e07a64e9aed0db1f1ef7e6decb52d1e52614d95dc197cdad0d737fb94aaaac5d4a626ae4577643263b2131259efaa36f48049f61add36d6e61b4b94bac3e8d2adc08a1a8a529e7d1dc17bf43770b47c704fce9ebd2ff007a7cbded0ee8cee3f1d92c9d453edaa67934e328aa5a3aa6131263699fc8b1cce6670da156d7fa0f6576dcad69656daa53e35c114151f3ff005678f4b6e374b9ba923ee216bebc3a3a5f1e369c9bb287e5377d54d0cdbc379ec1f8e7b7eaa77cfe597171a55514d92a5c8d4bd65654d2d2d66371980a5896286490b34a34e9274fb12ecaecb6ae35125479795091e5e80019e8a7725490085542a0ab7e7c49fcfa112976c41d61ff0009e9f939be248e0a6abef0ee2e83eb589bc0125a986832790df99180b49ea2b25664198701d7c5cfd7d9f58a6bb5dceed1b2f24110fb103330fda6b5e3f3a741b8a531cb7401a2885cff00bd941fce9d6b21b449fe369a7492674d27fc7cba40b03cdac3fdb7b7f7734b33515a2740bbc042d41c024d3ad91be0af506ccec8c4ee0aedddb5e93714bb6b03b6bf850ac6a92947264a4ae9aab5430491095645a14176b91616b7e62cd95de39afe446ee2d5fcf87f80f42af6faea6b4faffa77d35a578791f9d7d7ab54c27497566169a3fb5eaed994f2cae0bd4cf84a6a9694fa0975fbe8ea2cb1a5ed7fa1f6255ba94214238f521bee57ce6a6e5a9fb3fc1d292a71383c1603713516dedad4e60c167658e6836ee2295e0418ca956227868e356658f95e393ed979a4114c495182780aff0083a60dc4ec1834ee41078927fcbd6a5d945b4ae1097323cac0c86ecead3b3a5bfa925ffdb9f68e13a80f3ed18fb78ff2e82b2503b8f43d5aff0043ed64d9fd73b530c91b25755d28cc64d9d4ab7dc64d8cc41e6c19226416b5bdc31cc976f7fb9dc4ec6b1eb207c94600fc8fe7ebd1adaa68855a996e3d0a7938e29e0a882673225d8480131ea8c1f572a549b5ff00d8fb2684e860e08007f97a515d5c7a64a7c7474b1c91c2a224f4048a35b2225c68bdadf506e4fd7daa925d46ade9d34b19ee27d3a00f311c9bebb5f0bb669d25fb5c1f8a3950fa9a5aeae9e3aca8736e14b51428807d05ec2dec7db05998ad1a573dd29ae38e0547f83fcfd2bb58caaa83c6bd1f4ee98e936e43fc28d5d351d16cec3260aa55c85fb9ccc7411e572ca604f5bd443573f8a3039408093eaf638b6b48c78510621a9a4d0798c9fe648fcba5f3c8168be5d29ba2e2c77587c71dddd83b8ea63a4a9dd3419dcf65ab1dca18b135145535f95aaf248408921db34155211ea50241abeb62ef30cdf4fb125ac551777b2adbc74aeaee3dcdf9286e836804b7923ffa1ad4f5af4766ee0aeec0dcbb577ce44486b376ecdc56ebaa1202cd17f7932790cd430c7c7f9ba7c755c51853c2f8f8001f72d6cb671d9585bc2ab84017cea48e3fe7fcfa25b97f11d5eb5ad7fc3d7fffd0d687edc29d28a4d958b1d43f009ff5bf1ef1e244c1a0e88244a92d4c75880bea706c8485f57eab15fa13fd2fed2bc4738cf49cae3e5d73b22aaea88b926fe96bdff3feb9b7fc47b4eca463a61e20c4d071eba369082410037e93c1b03fd45bf3ee817a48f6e735e3e9d73b5d6ccc134a9566b7ad9ae48bfe391ee841a93a6a7a4524256a48eb986562a1801e9b29feba7ea0927e87db124628483435e92344a410cb8ea6c53cab3235d58203f902cb61603e82ded14b0020f6e7a4b2c55069f0f4f895619801e30c01d26e0badc7245ee0fd3d97b210093ebd16bc478818e9d68eb9225f1ea26c482cdf866e7fd8dffdebdb0f1d6848e9868f3423a7386a55cd9582d833823eb7008008e7837b8bfb6cc641af9f5a034e40e9c12651a81083d60836bdc80ac2df520f3ed9284d6bd5949272bd3c5357cac4132310ca2e971a7836e0fd41e78f6965b715040cf5a295a9031d3ed35587b2ab6922f60f6d278fc9e1891ed34887cc67aa152287a9aae7c76b1049b91c903f1c58dc823da72a7208eb5d492ea63467d0a43e831a29f4861a449f5e0dcfb67411abcf1d6ebd7091961baa9254b69908e59fe84330bf039e3e83dec21a548a107af1a83d67a47d3ad640d253b37aac2ceb6e54a93f402fcfb6e406bda7b875a22bc7a70655beb53ce95092017b86fec9faf361cdfdb04b7027a6c92682b81d71218388e4fdc953495d370083aae580b0f76a06a69a0eb5d7524e90a4d258a88949d7c58dfeb7fcea1f8ff5fdf821242faf5653424f953a635792726b840c54051ac5efeab69201b8b3006fed710a8ab1961f674e231709215a01d28d67b2a316d2ac12df52ba8a100b05b1b8b7e78f688a312e45283d7a584d6324f1a742e5051c5b776f36e9392aba2ab869b4c51d33188bcd3a0548f41e245706fc83ec332cb26e178bb7fd3ab271278e07974565ccb218a951d0798dcdd665eb2b6aebaa6b2aeb8aa6a9ea66564118b05899597f501fd2c7f1eceae6cd2da38a3862544f90ff0057fc575b9214a51540d23cba5ce1eb5d627987a5d5c87b922c3f2505c8b11ec8aee11e214d3c7a2578892e4ae6bd2961cbabd2aa42e09335f4ca4fa9c11722f6d26decb9ed995ea3f869fcf8748658188aa8cf4fd0d52cadad4b44e918d51b96d2bf92f0b0373acf1637fa7b2e96dca511b353fea1d21920ab2b31eea7f97a55d2e54cf12bd8a4c23f1b904d985b4dc0e45881febfb2f92d8ab30ae3a6a48bce99e951419141e31248cce15d56327ea3480ec4817e14f1ecae68482742f6f489a322b8c74a6a3ad1a55039d44030163cb05faa37d3fd6f65f24755a0e3d32f1b0439e953495bcc5390b6537052ff00b32ff66392c45d0fd3d964d011504745aca6a5b47774aaa1ac5d403b786560ce14b0e1ed768d50f1e290fd09e7d97490b66833d216a93919e9ea0c82b48bead2444ba858d8311770b726dcfd0fb44d09d391d54d4601ede9ea9eaf45bc6dc7f6978171fe26d7373fe3ed34916aa8233d78af882a73d3ed256f3ea023527c8e45868b02a083f5fd36f6826b7c5145474d321538e1d29a9aa4a59bca2455b5ec75300dc8b1fafd1bd97489a470eabc7ece9f63963d26491daeac015beab8e086b0b106c47b68fc874ea3678f4fb0ce182bc728291800120a32dee7f26dcff8dfdb2557274d4f4fd7f10e3d3d433dc8642aa4a80ea0ea16e4e9079e0fd7db214b1a5283a5d0c84908a33d3e535415fcadc80082c6d63c8fa9fafba345f110315e8c96a06470e9fe92a16eab7043720d8f1f9b1e78f68991812471af5e5a824f4f11ce181bb292ad65b28bdaff004b7f88f6e2b69207e2a74b619d4b00dd3e60a96ab319dc361b1d08972392cbd05151425636f25455d4c30d3c63cb640aef27ab55c70dec43b1d9cfb9ee9b7d9d9a86ba9e658d413c59b014f971e07d3e7d1fd8ea92444451dd81d0a9bbdb27b7f78e636a6768b1f4193c156be3b2915202b4d3d5d2e88e96b28aec0c2c908e6cd65078f628e64b2dcb97b7bdcf66dded563bcb490c3205fe203882734ad699e1d184d6cf6cf224b9907f87a596dedc7153e469beefcd48d4f12d533a460a55985a2b341387d0b1aad8e823511f43efd657896d75033e11694a7cb81ff571f3e8b5d748af1e84a9b714af3bcb2d64f2450e4cd6466252d1ce9544c8ce626d5e04407d5f4e47b36937592561faac515cb71a79d7cbfc1c3aa9734008e848c6e755a991d2377449e499e3a601a488e9b0bf935131c8feabf3ec5363baa18bc44e23c87af56461427a5c6132303d4622b7ef1a8047279aaa48a3679a97863e5f0946bc28386239e7d8df61dc563bbdbae05c181a37d55502a0fa8a834fcba36b2974cd1b2b6975e1f2e97199cad4d7d6d4c2d2f93efa2417aa4548e6851d5a267705dfee027e9370403ec69bfefb75bcee1732cd2ea32201534caaf027e63c87edaf46d7574f752f8aee757af4c39fb342d04e93ac72d3c702c7232b8f2c4c64a6781f510be5b9d44dcfb076f8ed323c2cc595b02a6b4e8a6ec97c713d05b53208673388668eaa4022951d4ea818127f72327448d73f5523d836099609db5290edc4fafe5d27b760ae55b8749bc852e995bc4ac9154a4b0332b5b4480ddbd27f6d57fa73c7b38b0bb9769ba3730b111939ff00567a3bb5b836ce1d7874fbb7b2d144b2e172718c8636b20f0490d495914c6486226571a448a795b016600fbc97e4fe665bab7b66d60ab7c431dbd4a7b2ef08f12ca1ea6bc3a48e7b6ac3b7aae18c992a682a2a7ef7155659f4c891297920aa28abe3aea60c032701d6c40f728c324732ad389f87e63e7e9d493697897309657eef4e9beb6395e9a78925657a886610d42e9568750d2141b68b10d637e0fe7d98354ab50d31d284f8f4f9547f87ad76bf993fc18aed995993f90fd1d8743b72a29d327da7b1719148c31d5cac61afddfb5e8c6b78e8aacda5ae853856bb700fb1d724f345f72dee3b5ee3b7deb41b859ca2586406851c106b5f46a5181a822b507a0f734f2fd9f30ed97fb6dec0b25ace851d58543023fc22b506b51e47ad78fb432f0e65229688abdc83680829c1d2ed1a925c46cdc107d48dfedbdf5576bf746cfdd6e56b2dd4388398e2455b888d34b38c9923f930eea70af01d60849edfcfc85bfdd58bd5f6c90b340e6bdc9e87d190e3e6067a2f9bff0021fc4569a55d4d24514115548fc99aa122d1aa4d200255001f4b5bd86b998ab2472035ee35fb74f42ae58b716d23c75fd32491f656b8e817a955075370d7e00fa5eff423d82246c7cba906238a0e1d236b068ac901fa0763c0e2e4703fa7b085c8a5cbd781e847051a05f5a753a8e45f493c006c39ff0001c1b7f5f669b7cb42a1df04f49ee53181e5c7a59515621d1adafa63f19f4df516b00f6e2d607d9e229d408cd4f4433c550f8cd0f57e3fcbd1a36c2760cb209278a06d9af0c91a98e0d631b2a78c106e19ff00d63cfbc93f680c836edea30402481d624fbaca8779db65f0ab24618feda8341c335a756631e12ab254f52f052d928d62a8ae5b285884aa043a61942de6d5cb1bdbdcadfbc61b6b840646666c0a7007a8d0eccfb8db4a3e934f864170e010a0114f996ad315a5388e9920828ea23c8b4b254d1cf044f1c3470c36a6aa9a3521669a673650a093c5c71ef7bb3ccbf4a000fa88ab79a8affa8754d8e28a59efc48c61952a3c355211f046baf0ad3d3ad927a9e8e2ff00445d4ec94c6148362eda7820770ef4d1ad0c7fa9d4e963fd961fd7df0afdc7ab73cf36ca477fd7cfff001e6ff30ebae9ca5dbcabb001c3e922fe51af5adc7fc280ceadfbd4172babfb81502c17842bb832618936bb5ef6b1bfb89b7d23eaedc01fe87fe56ff30e975efc0bf9f5ae2c2b78c28d0c006d448b58ab00b6e0736f613bbf8fa05df7f6847464fa6c8190a659154eb7503470181b13a883c73fd3dc5bcddabc398a9c818ea3ade4d19cf9e3ad877e14d563e0de7b0df24956f43066b1cf5098f506a88521632887d2d1a3905c106e97f78d513c51f366da6e09f0fea141a7cce3a0fed3fee63ab1e27add5764c74edb4a9e35d3244d8d8a37f1a855689e259352382582e96f45bfc7df5c3605b7feafed811ab6e6015f5a69c8ff0057e5d4d760bfeebd8715287fc1d6bf9d95458ade5d87bfb039068f2db66b8e7f04f4525fc951492550a696acaba6ad50d818ee7d32c7a85bdf3f7eee4d04fcc1eebac458db2ee442061425433004fcc70e89bda48c2fefca2e038a7ed3d6bb3f27ba2325d5fbbf39b72bd259568aacd662eb48262c9e1aa9a46c7e4299c5af68974483fe3a2907e9ef29c46d0928c7e7d4cbd11aa5da9266b766dddb9e5142db8772e1306f5d229f151d3e6b35418eaaac9957d463a7a5a9766b588b5c7d3da7beb830dbc92ea2a00a123cab8ad3f3a1f91af974d88d75e3c857edcf5613fcdaa87295fbd3a2bee36f54e13083ae77ce368a96aa9ea69a6a0936f764d7ed74c5a2d4451b3d05162b0940d4d2025668e6bfe2e4db6d799a28a668cac275a28229849196801cd348421aa430351d37a3f4c3a8a9f3f96063f9f5459b9b1061ac2e5e332445e0a802c4ca8d7f1ca3ea383e9e3d9e2f9f495c10680f4056e6c7b19ebc166962fb70c9a7d223d164e6d6bdafecd2d9b501ddfeaff557a65d48a316ad7a07f2910a51e4608de83ca9019f4917551a4979745ed6b1fe87dac3445f13cc1af5653ab14c8e1d5b0ff2b8f9d4df1bebfb6fa4b7ae5a483a63e49edb9b1333d4348906cced9c5e3de93666ee447d7e0a3cd412ff000eaffa10ac8c7e97f653750b2bc93a61251423eccd4f4ae263a941f88746ea3ce677a937d60b7de2a2f0d76dda9a2aea88d0f93c908689f25125814969e4a5f5a7d6e545fd95c884444c67bbcbfcbd2dc16523a217fcc2f656c5eb2f977babfd1c57d0c9b5bb436c6d2eeba5c5639a1f06daabec6c7a65b218488c378969855b3cf0a280123942dae3da0bdb70e9e2aae29fcfcfa0bee71013b48062bd02781afb8537054229504dc0e05cf26dc5fd85664fdb9e9103500f429c0e26813d4058f3c8d4dfed3f5faff4f653229527ede9c3431d7cc7f9fa8390874c8c7958f4290ad6d61981377d361e9238f6e46e29a5857a61c547cba6fa09258e6500ab35ece3e97526dc8e00b7b4f72aa45699e9048b439f5e84cc3cecb281e92da7f1c70391f4e0dadec86653a481f11ea829435f8ba1231d20e351b2c839fa690c6d722e0d891ec96e63a8ad320749e54a8a81d2c69e4d618d8f03e971762058f3f5e6dec3177093534e882ee22430f5eb3ac82e8ceda4372101202f3a7f07fa8e7d904b1b035031d05ae2265a81c3a77a59b4ba8ff904717d5abf03f1c5ff001ecba741934cd3a297c123a54473688d41b1013faf2482483c93c827da123c88e91ea2011e67a1dba1772be173356a93346b3d39d4a8ccb2153ad65f19fc1d079f61ce62b633c5038c696cfcea294e9fb62412c38ff9f8f5519f2dba673fb53be77366b1150d8ea4dd3929774e17274e24a6109ac8e35ad897405f23349a84815bf3cfbc8ce41e65b7bfe55b082740f2451786ea7cf4e01f960e29e9d0c3c65b9b78416cf49ec6ee0cee043c8f9fc855b3637f87cd4eb5334540b022897c71d2090c2abe74d44db516e49f669388eed3c158f4c6ac1864814c803e7f61afcfa5a2f5aa80c942053a273f2c77656e6bb66ba965aa2d8c187c2e628e9d5d9d16a7358ba69325300c58f94cf4e01b9b1fe9ef387d98dd64b8f6e364b595897b6f123e3c0073d2eb6b08d636bc45ef77cfe54a7eda9af0e93bd7f43b757078eadabc8578ca5535697a6a4a0f3fdbc25cac415c6a6649401f4002b1b7b9b6c57c2b1170be16b3507c4a5327b684fa0e82bbccaefba4a851fc314a69c640ff00570e9555581aaaba99df1189dd75aadacc8d538aaa9267963b16b2c309b2043737b5bd892cb7ab28a0d377ba5b23aa804975a607ccd7a223677c5d44564de17976938f9d071ea32ec2de334324d16d4cff00822065949c6552948896d326ad3a7c4da4f3f8b7b42bcd7cb33cc6d5b7cb5f17fa2e2b9340389e27a311b5ee62367fa0948fe2d0da71f97495f12c67d6b22d894d24dc293c163f43c5ac47b39d31a862a9415f5afcab5f9f1fcfa42d231f3151f2a7f87af080737d24d9b9b9fcfa6ffec473eed15b864727d7a6de520fcfaca222b208d5ac2c1ef6041b2806d7b8f6f786b1caa8ac403c475af11997537536277565e156ea421b0b9bdfebf8fcfb795a4014051a7c89a03d2590230aea3abcc75d09254211d8155bb117bdfea473fec7ddab206357ff0063aae9461503ac912b332b8e41f59274fd08f48b7e47fb0f7b55273ab3fe1ea84800af98eb2244b691f4956d56b1fa137faff8fd3db91ad2b452bf99eb4ce4841abc874f382c1e437166f1181c363e7c9e673592a2c3e2a828d4bd56472993a88e86828a9a263a7eeaa6b6544524e925871eed3df5bed96979b8dc620b781a476fe8ae5dbed02807dbd391472cf2241051a5665503e6dfe6ff00563adbbbe33ff2e5e9ceb5e8bd9db4bb3be39ec6ec9edaabc1be537fef2dd356a936377166a69666db7430a6494343b4a3b53b698d4b946e4f1ef0439bfdcbe6adf77a9efe3b89a2b72e442b1b9548d751d355e2683e74eb23765e5cdb768b18ed5a189eec00242543548c36483c4fa53a1ff67746ed9ea2dbb4db5b6ebf5cec6c4e1abb2d251e3e968f1f38c3bd5d43d42cb4c463eab24f555ac48915ea4c887d3190a40f71e6e5b9eed7f72f73ba6ea2499b892ee6bf91040fb3f6f47d0c70c09e0db40b1c55ad14003f974a7eaede1b0f35d7588c226ecc8656b7099ada09b9a9a8b0f9c83298faca79f7856cb4b5c6ba2a38568b231d6432472c6eead1380413ed2472db3c7286b99090f1f0563c35934f8719eb4a25562da46aa11f956bfe1e8967f361edfa0eb4f8f1d0b9cebddead85ed0d9ddf78fec5ebf9564a31baf1f55b47139791f76d2d1689228e9f6fd74e155dd3493a54827dcb1ed1da7d46f7b83cab2b593594d1bb90680d3b07a0e1c3f99e893980c6d6d6f1b046d57519a13dc6847701fd1f975a92d0fc91ed8a4aadd75581ec4dcd84cbf6257e5b2dd8191dbb929b1136f0a9dd13b9cebe67ed8469571e69eb25f2a10108958003d9bdec4f74b1fd59321856884fe11c31e9d1bc71244ed2c63bdb8918ae299a71fcfa95f22f69e3697b1f3ffdd3786ab6b6d5c1ecaa58e4923828e59b275182a49f214f4d40d669bc35f310580bb69bfb476accd1454f841ff63adab2a951a8e91f2e1d33ece3b176c752e7f71ee6dc790a5def59d8389c5edfd9b0e06a64a6ce6d78b0b5151b97733e7aff006d472e2322d0d325291e497c9e4034823dd9ede49a4fd135fb7a7629a5498a9887d2d685bcc37a7d9f3e95389f90fb1a80e6c57e1f70e55eab09b730b864aa9e945261bf84e6a6c8d5d4ca646925869e485c246224b9fcdfd955e72fdd4f14d4a06e84569bbc36af36a883218ea07cfd7a89d93f2ae9f79e2e9b0b43b51e821a6ce1c9fdc4d9459ccc2249e301b4c49fa95c01fea7f16f69ff00aa13dc4019ae3f2e8253c1e2034e1d39e17e6cee5dbcb8c8313b2b6e17c2c661a57adabac98bcbe3b34c648e353c8fa8bd8ff4f65d1721a898335db691c31d235b1900019891d778ff009d3db386dcd91dd389c7ecfa2c964b69eefd99541f13555710c26f5c64d86cfd3b2cd50ae667a39c8a771fe6d8ddae3dacb6e4db5b491e43312e0915fb78fede975ac26d6e16756ef56041f9ff00abd7a0eb11f257b236fc591a4db8f8ec2c198c6d2e2724297110cf254d0530568a08649cbb230650495b7b367d8ad9680f0e8eae771b9b9fed063a17687e777ca0a5d9947b0076b6e7a5da5432b4f8cc2d0d0e12929e88cb11492c7f879ab90bc6c431321e3da49b9676f7247884ff0097a2c9638e4421ab43d64cb7ccbf947bd76e36c8cc77476ae6f68d3624e3ced76ce4349859f0a02acb8daca5a2a384cd44cbc58b6b23826c7de979736f89d25083c40467fc9c7a696da3801a0a29c7e7d04943bd771505309969738b4b4d28a7a7719ec9d1e3d607660d4e90c33440a6b520fe6dc5fdaf1b55a36bac286a0f97edff008aeb4b6e3b85453a10765770ee4c7d68a2a79f20b156f9e1aa136ebdcaf492a3a059a2a8a15ca2d156c33c202324d1ba328b116f67db0ec3b7dc6f16686ca21dc49ec1e4a7ca94c54e29d23dca3169697124600641dbf2a8cfedeae07e237756e6dedb47b3369646580d12ed6db583c4d0d0c4f4b140727d8b82a9ae97c31914df73531d158c810bb2a8524af1eca3dd0e53db76afddb2db42a199db82d00c2d387cfa22e56b9bab8be915cd225048ff002f4557b6b2a73fde1dc133d5c8ad4dbdeba9e39e050523c7edc21008cbb5b5a2d0841fa47f5f70e4b0072c0fa53a9422241420e3a2f12e764afc9b978dde7a9ad2aecefae1479250a228d01b0f11161f5e3de85b88a2e385cf4af2cc09e3d0d1b3b038ec9673c15f4cf2c51e3ab6585e8a59a96aa1a9829dda96a29aa2260d0cf4f3f28dc8d5f5f64b71732429a90f9d780ff374690c4a4b291f87f9f5709d078bde1b3ff9577cb2eeddc0d2bd67c8accedbe89d87356521a4abcee2b05b86876f653394c3c71a56452d5f92033464a4d2231b920fbbc36cd6705cc83114e3b3d6b5ef5fb0138f5af1e8bee6669049a9c9f09483fe98f0e8d57f32cda90f52ff00c27f3e2f6caa589a924de3deb49d9759096d7ae9e5a9cdedfc2cacc0a80bf6b426c2c40b71f5f673b7c5e1ed960b5a09ee26980fe8d74a7ec008ff000d7a2314fa2dddc2e34471d7e6a6a7ad49f64696cc40ca006351086239ba6b66703ea01d2bfebfbb6ee48b692a71a7a04dd93520e4015eb697fe5b183aecad2ee0af8a4c9491e2a8b67d24d8ca2abfb5a2c83cd4f94a989ab64377d146109162356b20df8b451b5c52cb7334913d5431aafaff00c57428e466062bed4bddd99fb41afeda756db2a534f3d2c552f5b4af24ceb278565ab8d2195a664014fa558c3a6f7e091c7b115159d55890c3d3a1d66874d2bd059d9588c74b81dc1fc3b219589e6db9b8ea6a27947ec3fdae3df4a252870b0b78d1ef716b1f6c5c4684398a4efd078fd9d6d0be96d4a3875ab36d0dbb2eeddf3b5b6ec71eb5c9e4a97ce8a41229637fb8aa66b317411c0a2f6fa7b2fbbb9165b6dd5c9615584533e7e47a0f189da6652b927ab8cc5d12e3a9169fcd24be155851e4d1acc7122c68aba10808ab1afe3dc15348679199502474af13924d6b9e8f150aa22f97523f6a657d2a9208836b050f3abf558b0b1b917f7a248c7e1ff2f5a6a57b7a73da3b7d7746f4d9db44cf1517f7b377ed9db3f7b3d44147052459bcc525156d7cd5352cb4f4d1e371f24d36a90841e3e78f6aa088cd2440d4a9615ff4be7f67dbd3334a60864982ead209a7ad0134fcfa8bf1cfaf76bc1f2a7b1e6c7550cfecbebade3be3710cb642a219e6caed2d995d57350bcd353034d39cb56d0d153248968dda7d238facd1b24718748cad20883383e5a128c2beba9805047d9d1b4aab0ba786d55201fb2a01a7e55a74c5d834dba77b6efa883314b2d3e5b7bee138fc450443ce5a9aa6a63c96e2ccb300156b32733c4a350d49042154a8b8232db63596269f84cc48fb30751ff9fbed1f3e8b6fe421aae3b7a47ff342ee083ab7e33c7d538caaa4a3cd7625563fab6868a03e030e10d3c196df751470062d152d2ed6c7d363e47fed4993d17bdfda7daece6de79eeca2f0bfc476c83570edf11c5081f355affbd1f4142b9241058cad5fd5734af9d2991d237637c70d89be3a1f636f8dc632d4f53b776b1c7bae264a2a747c5d060b119072c668999e6a42e542dec23200b7b92a290d498f09e21c7f87fc1d154641444a669fcbafffd1d6dde10f1d93480d617b10401c3026ff00471cff00b0f78fe7d3a27e069e7d6034eb67b6891540d456ff00eb7d0ffaff008f752a286833d51903038cf51238ac47ab4a9bdb5037fd3737fa7d2ded14b19ee34cf499942d719eba78c0592efa90db469fab73737fe9ed3b2e960474d1524f0eba64461ff0601c96370197fd6fcb0e3db6757970e98921d60d38faf5cc2a94407530173a45aca3e9f5b5f9ff0079b7b65d6bc3e2e8ba780ae789eb1392ada13506b13cf365fa7d07fbeb7ba68343aa94e92321a11e5d678e4407d4594a69360b6d47fc5adf4e7da57814d68b5e91b5bae405c74ef0d5050e38f510c13e973cfea2791fe3f4f689e026b414e93bc3a4fcba74fbd58d15c80923d918123411f4b2db9d5c7b63c16ad3a6da163c463a76a5ad5bfa05c83a8ea3ea06c14d87d34dbdb0f1356bd32e9a01a267a768a42da5a28cc71dfd4c1afc9e4900927f1ed86535cad4f4da862b4e02bd3ad3cd6bab2b3b101d4dff00b17d36bff81f69a588d066b9eb7a00f3049e1d3a8af66520c32bf85799037aaf7bdac2d755fc7b4fe0026a4d7ad04208d4015e9b22ce857657676666e636e1945f8bff005e4fb51f4434d475b68056a0003a9f154b544e0891e20c541209d240fa0e6ff4f6c3c6a80ad013feaff0f4d3211c57a53532b4a8c236566563a90372c0802e0dff00da7d9748349074e09e9aea6473b477560ca8190696b92396fae9078e7fd7f699d30580e3d347e2207538bdf50421b4d8ebfd2cb7bf04b017bfb64292453af0af01d37481a5915103be862d32391a5974310d62391e9ff1f6a90784037974e05a9a571d3950ca90ca01d4f038f1c91b84b22b28b902c0d85bfd87b6e405bbd70c7853a50012840f8479753968608a9e7c979d63a4a66d5e3974b79111892516ea491fd05f8f69cc85de38425588353d6b51c2571d40c96eec9674418ea89239a82963578d027855bc6bfb26455b6a641f43ed4db6d76f6b2b5c050256e273d563548a56208a904d7ac34319842ba58f9033c850dd812435dcdeda01ff00637f75b8219803f0f4c3d0b569dc78f4a182ba5864b6b678d98f3f5463c2a9fc1d23fdefda178637d44815af48a60b53aab5e9fa2c811e3f1491bce072a4597eacc47fae148f65ef6e0a92571d2392353a047824f4aac7668992165712905bd2c0052a542b2b71c58a9b7b2b9ed6832bf6748e58175b63a58d1d705540bc2bb35ec395b15751fef7fec3d95cd030a9a7489e1a6aa70e951495ae7c4e40e5ecc4b000937b6a1f502d6fe9ecb9a1342a4f4974d4951c3a53d1576a0a7f6ded70f12b7ac951a99ee7e8028e2dfd3d954f05092a314e934c9f8ba56d3d588d85d8813441b49f52fa45d1ae2c2f63ecb248b50e1d2074aa91d2861ae864f1a19d56568ad1cb21b1bdacc0122f7f65d242e0fc3da3a2f963f2e1d3c51d5a2f8d1dd8fea45bfab95045c30b5c3373cfb4b2c6c47c3d2792324f6a9e951433b0d68fe9fdb52a6d72015bdc726f7bfb2f96305410283a4fa185298e9414b5777465624690a750163c5adcf3f51ed13c74ed031d5e9519e3d2829eb956f7b46c080cdabd320e2d6038165e3fd71ed0c900604f9790e992b4afa74a682b02dad72ac41f2311f4205c1b7d403ecbde2231e9d5002403d3dd3d5232b052ca4100eaf52b0ff037fa1bfb4aea41009e94466828c3a5150d449a8855bc491a91a000a0fd39bfabe9eeba0d70307a34b48db5835c9e9fa9ea410be44263bf2622059be97b1e48f6ff00d3b152c14d29d0963b44f0b5357553a7ca7a8ba8e78b8b1bf2470437d7d95cd111523a2d990c64d3874f305425cdd8fa45bf4950d7b11763f5ff005fda160ca6a78f49c6a52adafa72a7ac9a0aa86a69653056d3491cd4f3445c4f1cf118e6a79a2375378a54e483f5fa7b36daaeee6dae6d6fad242b77048194f020a9a823e63c8f475b6dd94991aa430351f6faf4b1dc1bcf33bcb3b96dcbb9aa464b2b9c9e19f29551471c0d513c10ad34720b22a41e941a8281aedec49beefbb9f316e97dbc6f1399770b8a34921a6a7205013400540c600f9f4239af5a772ee75487893d67c565de902096691a38e554d2e4342be474bc811812be84fa7d00f65b0cc4307d469d3722865aaad0f42c62f73522d4d47daf3154524936a151a8b4c935cc25189f123a9d68c7863e9b7b5f0df0d4403466c7481958f139e850dbf932344a6a1a301431649009a585183947470aa4943c8fc7b3fdbee9a260c1a8074dea284055a8e852a7c934314192a590c87432b52ab17f240e0bc909b1d465fa1e0d87b1a5bdeb24504f1c95a9c8f5e95a39a86ae3a5f534ed2c1055ab3d53baa4f0428f18f1d3b21f253540fd70d42106c4ff0041ec642e3c48bc7328790669f3ff0057e5d1809b5af1a8e9e52be2ac26a6614f278fc691b08db422e92b62ac4a83a45be9efcd762e74b483870f974d890bf1635e9bf73e291eae39a10512548e5000bc72349faa5d3c8f45ff001c7b6773b205e39a1a107af18cb0d4a68dd23da96f1fdad4420c5231297008901371a00b0517ff0063ed1c469108a450c0f91ff0f4a6394842a723a4e56e33c645502ebe19c06844644afe23a9de223eaadc5ef7e3d9b72def5272fdfc9a89362cda5c7929afc43ce9d19ed1b9bedf3d1dbb3a52e2b29065a86a71b5e9f7505470624755aa4a845e5e9758252581183037f5dadc8e3de4fecbbd8b8852689c3c6dc7e7f3ff008aea5fdaf745531cb1bf691fb7a0ff0072e36a7028f8fa944929ea5922a5ab2dfb190a5985bee21916fe2987e978c9055c1f63b8aea37855c356b8fdbd0fada68e741323649e1d17fee0751b3aae26521529ea68886515024a79a2649fc8ad71241347e97437565e08f6f348d169d03b870fcbfd9f5e9410198fa71afd9d6911f3a7aff0bd43dd91ee4c0c231bb5f72e6aa7efb1f1e9fe1d8ecd79958d4d27fbaa2c76435faa3e0237f403de40fb3fcf975b5dec566ec68c42d6b800903f957fd43a8b3dc4e55b5de76f69d70f1ea7c713406b4fb4790c744937f56e36b434d8da5a9c7ac956cf252ce134c6c53d0239632cb27991f58fc69f79ab7776d77b6c6ced5d5256a3cfb7ac73da209adeee60eb4880edaf100e694fe8d29f9f40a5429321d44fe411c7fb7f61a99869a79f43589868069d2432034d530b9bb497b902c2c0900f16b8f617bb1aa639e847699801f975ce91589e00b0209604707fa816f6ec048641a6a2bd567601083e9d3fd237e95209e34f16be9d57279fc8b7b14db9d51afe5d13dc0f31d6c17fcb75cc98fec6a6593446b41b36b2289a2baca69a9e4019a3e344b27e909f520dfde417b5ae23b0dd154d1ce8fe6483fb47589fee14464dde0523887fe471fb3ab3e9253208a0ad69121924677791e78a4547064fb69523016681a46b7a892bf823dcaa9a013e0901c640f9fae7a00b0925445990e800826a4629f239fb4f4db10822952030b554337923c68a895aea02b34ac542dc5aeba435ee0fbd5ecb23af8aade1b822b9e391ebfeac756dbd2d6029005692035084d6a3049069e5f6f5b1e747ce2a7a57ab65285563d89b6e0d457500c946b0bd9ae18ea71cf07df12fdca4d1cfdce094ac7f5f3d3fe7237f93aea8f2710fcadcbf55ff0088717f3887f97ad723fe14274ea37f74c4850aff00c63bae31e92815a4fef2576b62a0024e9bff00adee23e61005d5b5063c3ff9f9ba5f784695a8c67fc9d6b5e9614faafa496007f53f43623fa123d826ec933b8af68e8177dfda9a0c7463fa6bfe074319b5d9d1b5afd4920580fe857dc61cda4aa4d4f4ea38de88d6d538af5b067c316922dddb31a32a08cbd22c66456652c86eff00a41624a0207e2fef19653a799b6e92bfe8e2bf657a20b31fe3208f43fcbadd47acb23154ec4c79854956c6c6611145a1c37dba9d05d88b9955bd23e97f7d64e48945c72becd3ad4a9806071268787957edc75346d9328db829c9287fc07aa2cde53407b7f7c408c92b0cce7269eaa28529a992715f12cd471a2b062b4b2f0f6e0b96f782ff0077b907f5a3dd91505cee8c6a05054336001e9c1bfa5c3a2ff6a41077d0786b14fda7a2c3f2d7a7e1ed4ebe4c8d34307f7bb69d1d555e3008c49365f12124a8ca61d9d145d9628fcb4c3ea641a7fb5ef29e5d4f4626ae3a9801f5e1d6b95bc76f4d4394699627a4922ab95a91ef279564421e168ca1463351d404fa69d4a48febed05f2c7258ddacd85f0d81f5c82283e753d7947ea230346071d6d71fcdc763ec4f921fca87e3cfc92c7d3e1a3dc5b5f6ff4ee6b059b2d00aa18adfdb7f1d82caedb8ab18f9aae9d37155534a50b3e99699dbeba8fb1c34d6f71cb9b65d1d2a8521d27cc5400ca7fe3a7ecf5e915bb32cf730b31d26a69f3ae0fec34eb464cd6320c8d35455ffc06c863e59a8a64d5f47a69a412c4ebfda78aa015d5f436fe9ed1a32b8241cd787caa7af323548f3e804ced0c695b5b04fe928ab2592e6fe4437b8fe8f2104fe3dad898e457a66b4f227a04373d205ab2671e38a18c36ad16b4a45d1502db927ea7d99c5de9938eaa08041d24741fd43d404b4b20432b97132afae391ade231693a7ca922ab2923823dea45d6a54f0e9d534624fedeaeafe3b76d1eefe98c6be5e6136edd818f1b377dac8cd2545554450a0dbd980cb66316668802ee0001811ec9244f09c21e1d2c470d51f880eaa93e436f1ac97e426f46aaab6aba7c355d06d6a4679da65a6c7e1a8a9e8e9e8e2620698a91ae15470ab6b7b71eccb5bb003b7a23bd6691dd467a1036ae585440a3cbc7a5c737561e9205c7e5adcffadec0d79078721522873d14820769c01d0f783ae89cc7a8963e93c0fa10bf43aae003ec9274c123a72a694ae3a54d5c06480be9fab13a458d8372adf9240d3ed1a9a1e391d57a4a4b1ba3eb0ba74b68217d20afd78febaadcfb7a440c3a4b3a1a8a8c74aec3d569e6e5c591585f9e78163ff053feb7b24993492471ff00557a47e7d0a78b9974a06fd3abe9f9d00f173cdac4fb2899304fe2eb6457a5d53cc348362ba57f50fab258690c07fa9fa7b0f5cc2431078745771154924629d64564923904682465b7909bd86a3fa87abeb1fd7d86ae23757615ed3d052f217562c7e0e9ce8646b020b12bcaea20722c9abfc490becaee12833d07ae9429254797f9fa7c8ea47a5410430274dd88078bd8dff3ecbf4907e7d16d056be7d087b3aba5c6d5d35643e92a1e1d162757910b3ddbeba485f65d7907d42e822ab5ad3ece8cece3d7db4c1e811f9bdbca2ced1f53c0a6359f1b41b8d250b1852c66aea668cb4800662351fa93ec7dede5a35b43b8694c5450fa57cba3b480c1decbdb4eabb67a992557b0d374941d46ea54fe38b0b5febf9f7282c401d073fe6e23abc4a59c315a9af9f44cbe44b11db5212c198ed0db2e0c7c2ea141a57eb7b10bef2d7d939dbfaad711d093e3c9fb2b5e86f64356dcb8ff00453fe01fe5eac3ff0095660e9739bd77b8a8c4c192969fa8b3b2442a20a6a97a36198a491b274c9588f129a2891dd80b3b05201e7d897dd7bc99795f650933aeb968d424568b515a53cfa45b3a7fc8a2f41a11a2a300e703cebe58ead331669770d15663f6dd7d3d46eb832f5f149975a0a9c652e476949044b5f5102cb4cb4747514f1fa1226bc9292194fbc707bab90ee5d9ddabc4927ec19f4ea4052148d268bf2c7dbc3a08733b1776554b26161afdb34f538ddb95f4d96ab8e5ae769b1b4c2bab692b2055a7289903102b52b27019b8e3dbb6d7729bbb511ae75a79014a3fd95e9448aad0cc5892854f99f43fe6ea8a2a757dc4ad62f1bc92158c903d05dbf5e9b7ac1faff8fbe91212521272342ffc747a758ccecbadea7b8139f5a9ebb881e2c80a9f4b0b5ec383febfd7e9ed7c26a5469a46470fb3a4b2115357eb3e95b5ecc08074027eb660393f8239ff005c7b54b93ae991fcbaa82694d7d7164b95d6468170c14fe9209b5adfd3db522248575935f4ebc1a8085e3fe1ebb0a3d41c5fd5a16dc9b71c0ff0ff001f765422aa454797552c7054fdbd6442a8ca40b00147abe86df45e3ded548923655ab0e20f01d55bb81ce3acc65690b101406762549b0507f4816e6c3dbb233bcac4a71271d5028000e2401d099d2fbb68f62f6e758ef1cad44f498dda5d83b3771e46b69699abaaa9b1d86dc18dc8d74f4f429ebaa9a2a4a4768e31cc8c2c3d94f306dd36edcbbbf6cf00ff0018bbb492251e5522a8c7ec23ece96d84d1dadfd8dd49508920269e95eb65bec6fe73df1463af353b1d7bef37142f50eb0e2b6ee0b014d5950f572c90d5b56e72692b638e582455d053f49b9e7de1ec1ec47b83315731476e2a6a5a5500d78e28c457d314ea6993dc1d894c8045296a7a0ff3d7f6f452b7b7f393d93957ab936afc64c8d4d54d115359bcfb3e68c5449e679d2ae5c6e0689927af598290de4e10003e9ec5b6ff0076ade196296e77bb6406950a24929f2f2ad3857cfa2693dd1b7550b6db6331f52c41fcfb71fcfa444bfcdf7e42d6f5b6fecded5d93d3fb3abb0fbaf6462b1d4ed82c9ee8116232b49938da4326732090d5d6504b4c823671fb71b30b7d3d9dd8fb09611ef69b6ee1bc3c9b7344ccceaa168ca0768d44f0cd0749a7f706f65b2335bdb471499aeaab1c669407aab6dfbdc3d8ddff00d8199df1dadba1b70672b30b9d9aa2710d3d1e331908c7543d2d06230905a931d4724c4048a217918ea727dcc90f29ec5c99caf7f06cd122c8e85dd9983ea2061980e069e4081d06ecf73bedef98b6db8be958ceb2a88d4fc22a780a5079e6bd123dbd8979aae8504004b356626158ee47dd4926468d7edd4db4a7dceb31adb80c4fbc5fbe9c859d81a93fe7ff00075904cbe10601687fcbd1b2f9fdb6a876e7ca1dd7458aa04c1e3eb36af5c677f8052cb2cb160eb323b431ed598f965958b355c122de5b5fd4dc7b2ad9dccb651b3fc5a8e7f3e9e8da82b404f453335593e636ce2a8047fbd8fcbd44914fe53fb89251d3a4d235f90ecd173fd6f6fa7b341d92658d075ef0b59c56b4a7490384b8d44ac77fd2acc2c2f6274f3c0fe9ed719a3208241af1e3d50474000614029f97a7589f0c242843414cca16378cb194395b59cf27916fc7b7924854d6834f5bf089c039eb2438d540fe49502eaf2002dea4000d3702f6b71ef4655ae0f5e58e9c4d7a9a9414ef20549045ad84a4c69ac90bcac45947d05adfe3f9bfbd09154b29f8bad88b563574e869e1a7923b993903f6dd1c301a4e965bdec7da5790cb56d2a3abac62bc3574ea90d3ca2cf1cac1d7f54a58599800a5782458df81c7b46f32e2ac2bd3d212065f1e9d3d504d362c8928d6aa9a5951a17651e8a881ca9657ba3594db9fe9eeac0483e21d27752f42df079753ebabaaf2947494cb8e9922a54654540ecb34ad2b4cc5942804932d87e7dea2f0d1b4975ad7d7aae802a6b83d3d6dcc1e424c944ff69e38fc32323babaca408ca993edcd892f29d3a45edf526dec47cb5b84169bc5abcbc6a7248fdbfe7e906ef1493edd2aa465988a1fd98e8e5f45efecc759d2ee2c8c51ac71d4ae2a16692ba6a1b3d2d73e429e58eabc4d1c9341247a820b123d5f41ecdbdce9acef36cb768dd5e7595a94cd05387ece839b0dbcf6b744491d31d39ed6cb9cceeaddd9b96956a3fbc359997ac86adaf24f065fcaf3d3cec558486a125660e0860c3de3349f1b938cf528420514fcabd0613458ec764ea68e95673578f91a19daa1046b4552ae408a14173388d005f2d80663ed9615aea3553e5e5d2815aaf4673ada003195956c9532653238b6c2d2cf1d4252a0c866e68b1d4b3d433ab1fe1d154552bca534b85524116f613be0a65f035510b53ece8e20242b39cd075b207cebdbf5dd5df16be0afc57adce637712ed9cd6cec13d7e2a9a2c7622a30bd63b4ea3724ef88a38638d5e92a7766e477699c3495322891d989f66db85cbc10db78a4b88e3007c820c8c7af9f9f44131ac7310b4695fbbe7e79eb27fc28a63a6d89f057a3fa4e88a0ff4694ff1c76d55c209558326fb3f2db8f29180094fb835797d535acc6e2f6f678745bdfed5b58c8b7b551f9b02c47e551f3e9051d360b89db84d26a1f3ce9ff275a7775ec0cd96a20a00669e3e6d70a75595ed7faa6ae3f07da0de9c8b39989fc3d012edf2d51d6d57fcb9219d309bda968eaea686a2ae2d937984b1a47f6eb8daf52583291660f7b7d4fd01f7176cbab55d08d8a92dfe5e85dc8e4186f491fefbff0001ead6e4a0a9a3b0598cb14b19967d44c464551756846a2c880a9604ff00bd7b1414640a2b5af1e871d0739ca3a8af390a2a9816aa8ebe81b1d252ab0fb84a4ab82582aef2a8b3f9164603f3f4bfb4cd1f881e360c430381d38a005269d570efaea6eb5d87bf76d50ecbd858bdb75b87c665b315b95823a86aeab82aa38f1b8ea4632cd2a80f25d98800d97dc75ce137d1c02c446ebe252b5e1407a65e240432a00debd7a1ab8e5b80a61056fa9c68b382411a98dc6906c07b8e5a1d006751f23e807975bd6beb8ea04f3c11ce5c9ac7631bb8641a923082e7485b2967bf1707dbb46684822b4a754ae4d063a2e1f24b770c1ec68a8848f0c9bbf274f866a7595e3aefe1e596af272c7e360eb1454b1804ff00563feb7b1df23ed1fbcb7c41e186b7846a6f96287f3cf035e983200694cf4737e236d39f6f7c62de5daf5ff674553dc1b9a1d81b168645ff00298f646c08e0aadc152e0956a78329b81a921082e4f84936e3dcad776716dd6f728a45262b1a81e69190e49f4ee2a28295d19f3e975a812b020f60191ea7fd44f4ebd4b8c5cef77e6b375ec95387ebdc28ab9a5c753d554c54f939e9dea2b8c91a96a89a7a486392c91f2e42a804d87b30d958e2673dde44faf45fbb4859c44a38f55a1f25faa3a5fbe77e49b8f7e76a768e42bb1f366531b4b55b632b4eb8719dcbb656ae9a831d14693518769208cace3cc228954db47b17ec96e9b69bab88199a599b531f9d2983f67f2e88e790485622b8519eaccbadf6e63e9be39cb828dda3c3c387dd58f82b2a2195e687154d85a3a09269e30049f7868a056d1c3ab0d24fb5f13546a0b4eee93a922534f21fe6ebffd2d67a92b0ad9f5acc925954eabdc20f4923e9c28b7fb1f703bc4413db41d17bc66b91d3c412c725f51d078b227d38e45873f91cfb648a74c95a6389eb349e37042488ae45b43db9b0bdedfec3db6ca1811415e9a28ac6a474d9e370aca581bb0b054bfd39b0ff000b0ff6ded3b20e141aba6594a904f58e358cea670e8c0955f56916e5b85fa9bfb4cf19afcfa6d81a923875d08c33bad9a316166b9d3f4bf24fe4fb61871aae7a6248848287ac9691ac0b7e3496e2e6df41f4bfb6cafaf0f4e90bdb1a9a71ea34b2e84fc02783213f4039e3fc7de9517557e5d2468334af501b28daff006e22c5878d941f493c7eaff0603fde3dbab66af8723ab7d2a9e3d495c95431400a8d3c1878b29fafe7f03fe27db6d6b1a9a5057aafd2a839a53a74832c54a19e6d0e469f1c4a19ed71f4ff00623da396cd5850003e7d2696d96b4e23a50d1d6d4bbebf3353530b0f58b96bfd4903fd50e07fafecb66b7110a11df5e8bee2002941e7c3a52c1500945692c547ed422f76b0d5a59bf2e6dc73ed034649a818e922c546a85c751ea736eade54f226a56492094da68e402cae8c2c0a8fc8e78f775b45201d02bd285859b35c759a0a88aae682a6786ca5069626c2571e92f15bf248e6fefce8ca0aa9e1d69b554291d2ba8a769191195b4026eaf1faec07ea66e2ff00e1ecb254a6a2a3aa380757663cbede9fe09a25591d0b5c82b645b15707d247f5fafb43247ac0d43a44e8c298ea4b55225de53a58695b02578520ea6b9e5bd5fef3edb10b569c57a6f491e59eb97dd2cf3cd16a0acba241662cad17e1b83cc8b6e7fd7f7410955048c75a20d3a92b288ea2173720282df521a26520f07f3ef4ca1d4af9f574e1f3ea6fdbb3912a000300e40365283f4dc13f52bf5f69438556422a6bfb3d7ab82c2a013a4f51f315124f00a6d4aa918f446840b03fa85ac4fa8ff5f6f5b44237f109c1ff000f5a3a706bd47c7d268d21d7d650b6ae2c3501faff00c587d3db97137c4074c9600d460d3a7981162421405e6eba7fb46d6d27ebc71cff005f68092789e9a3c280d0f59fcd7b2b70c79603e9f53c706d6fa11febfba9507edeb64d453a9d0cc386b8e402ae6de920d8a81c5cdbdb4ca48d27a64a2960590123cfa76a2a840f3abb10d2081d594801b4b9d4bfd02916ff006fed1dc42da5718e90cd6edacb06c53a56d1d7b47c936b9375bdf55bf4b9b5ed6536ff0061eca2488d5815c57a40cb4c15c74aaa0caab2c6b6506490091ffd52e92037278d16b7b2e9ed2a4b038a7491edca92c1abfe6e963415f14d0314921322290d1db4ca236528fcf1752bfef1eca2584aba2b2761e91ba06570c28c074a9a4af229e9ceb8a48d23b5ee4315b5b4f26f7503d964b6c35be9e903474504798e9f52ba19044b1e965d0a071731b30be8627f2d6f4ff41ed018a400d47498c64f103a75a4ad4baa3542ea0c554721c106cc1c83c916ff0063ed978c32b5533d35247524a8c7faabd2b69720eac83ca1c78ecbaaff00406c6c6e3fd87b2b92dc53e11d249215a926a0f4aea3a8060d4b2696664d22470645e06a52bf8463cff5b1f6513c4759a2f48a4528d8afdbd2828eb753594091814e02d9412d66bdfea01e3fd6f69258a9534a0eaa083db5cf4a8a3ab560d1b591f59b2a8fdb5407f50b9fadc7b2e9206209071d36c0ad3d3a7ca7aa2b6657b8e4142bfd4900f1ed13459c8048eae32453a54d0d4854572ffb8ed62875006303d21ed6b589f7b8a1679634031d09b6a85a468c1e351d286923a8962a89e38666a6a1317ddd58e23a4157294826909e1e39655f1851c83cfb150daa6fa296e5612205c13e5d48dfbb425a3b152348cf4f14b520726dac0d2c47f9b627fd47f417e7d81ae800ce11bb6bd47db84cab269ae093d3d432b5c9d5f50a42ff00ab000240bdff004dadecaa55f31c0745cceca450f691d093b2766e4b7dd46729b135f87a5adc06d7cbeecfb5cb55252c995a5c2ac735763f19248cab2e47edd9e444bdad191f5e3d89b95396eff999f785b096146b4b196e0890d0c890d19c47fd30a683d7a3bd9ade5bc69dd080918a9af1c7a749ba7a98e6b9fc6ad42e48240fd2c0102fc7d2e3d950a0ef8ce0ff0083a30496a6aa71e5fecf4ef1cc4902e54120a165bf2b7b5ffe0ded446411a49e3d194728206a6f2e95b8eca449551fdfc34f1c2a22958c113a493340856969f4c773a9641720f1f9f760de1b03a73d6de1d60946e851dbd96965c94095cfa04b47e780ca47851c297ab8b91cb3c7620ff5f66f6770cd246923510a13f9f491934034c9e853c3678475d4292d4552d350c753f6f244b1c94a44e0931d5b2d8c7300742b9fd438e3d88f6fbd64993f50f86380f2eb6b814a71e850c7562a3b5553c7234956d1814d48af21629a84c6a579d2648c00b6f62cb4b8f0ca4a832c70173fcba750915cd074a55c878e9aa1d5c45a845abca1d96fe4b59e30a1bc801b5bd9825e94490027c4f43d54484360d3a5453e429aaa0a3a69dd95e25921a7a921a3454e7f626b93a9cff5f6716dba44cb142fc0f9f4a23b8a1a30c74d790a1928ea6ebff019dc928535688c2023c7cdc0b9f6998c8939183191d5a39759a70ea3a5229691263aa29632f193fac17003229fc71f5f6b122493b6423485a53e43cba554d66a064f484ae2b89cb46ce02d3cec635d1e97d715db548400459b904117f62ce52e686d82f22db7726236c940d0dfc15c01f21eb5f2e84fb16eaf6c45b4e4941c0f4a181e833f4126dbccb343057b33515694121c4553bab415d1dee4989c03228e194dad7f7911b46e9186486690340c7b581c03e543e95ea54da37368668cebfd36c1e8acf77e172781c36431f9a893f88c464a786450452d75332b7da56d24a3d0d0548b313f963a7f1ec68cf54d264248fc5d0e62952402489ea3ad3c3f99de229b21b2373cb34092cf8ecec7e06234450bc8ec930d5fdb2e848e383ec51ca8fe16e5406874578fcba49b9006dc96a6a27aa7daef29dbf8a59492c9498f427ebafc746b189189fa9b10b7ff000f7d06e559de7e49d8a69189768c549c92687ac57dea38e0e6fde91140512360790a834ff2f41ed5a9590dc127e83fde4126dedd9fe215ff00570e97c04151418e9235ebaabc80cdf8247e2fc5ed7fc91ec3175537007f487421b57ff15048eb3c09f5b5edf5bf1aafc5ff00c2ded5dbab9a6938af4dcc720f4f948a58ac67f4b8e4eafd23eb7bfd791ec496f55894371e8aee0aad5ab523ad817f96641354d3f6342d1a4d5306076454278a678f52b4f3c70f964b13e95007f5238fcfb9dfdba9425bee401ff7dff9fac63e77b779776501819031a57d0d6a3ec3c7ab6fa7c756cc63a596ae0a9434f52f551553410d3c1259845043524ea74123026ffa585bf3ee46376809645a483cc71e8169692ba28760d157b83701f670f3ea2c5fc3e9c389e96922c9d4f84434de59354ce874cd29a860600a8ea08890eab7d78f6c5e4970f18612168b8927cbd3f9d3a5b631db2864750276c0f9f5b027c7ff002c9d1bd50ace92491ed2c5b4ec1349d4c25bad87d428fa1febef8e5ee78d3ee173785f87f784a29f6b9af5d24e4d0472af2f9273f4b1ff00c7147f83ad767fe1438918dedd24c1a4e7605778d8afa495dc9904975717b36aff006e3dc3dcc3fdbdad78f85ff3f3f4617d90c3cabd6b491dda341a492b722ff4f4df9ff5c5bd826eff00b407cc8e81f7bc49a66bd189e9d665ada6b02aa2646724004702ec0fd6e3fdefdc63cda2ab28f9751d6f2959482b8eb602f881394dc3b4199df4364a8b469621809ce96652b660ef7b9ff5bde305e1ff00910dae30251fe1e83b624b5cca07c22bd6e65d532e9ebca245f31f0e2238e95667f54de3894065907e86b5c8279b8f7d4ef6e6e645e41b3963ee31c0e47d8aa4d0752bedf294db55b8b043fe03d51aee0d127676eaaf5d734f167f713cb5950748a98a5aff000c112d29b0631fd646fab373f5f7839f76890cdbb7ba376a4b2b6e6c4b1f88f7363ec1e7fcfa6fda693c4fdf2de5abf9d4f4e18fca45532c46260c29a67b2ba0f189232a02ca8e0e9011410a7eb7f79791caad534ad070f5f97532508ea97be757438d9fbb1b7ae029346d7ddf53595c9042a238f0db8b992b713a40215ea8334f4ca08531b90781c56650b223920c473a4f0af928ff000fe5d6e980699af447b78fcb6f90157f1c28be26e4f7cd655f446dede916f9c16ccaca18a5abc1e7a89ebcc18fc467588aca5da51643292562631b5c11d5b968c8550a112d9dc8ff00177bc906dfafc458bc95ab5c62b4a92695e3d32de1abebd0359f3e8806e2804752b978c47e1a8963a0c94525818eb9804a6ac545ff00389536f148dfd9900bfd6fecf63270e681787cebebfeaf5e9b6258d7a06776615a2a8aaac00b0aba659627234b02352bc53aff00ab8c0009fa1bfb3389ca8a93d324e4f400eebc7f9a91a72589689a221796132f2ac3ebcdb81ecda19140a7a8e9b752c053a06eaf59a62c635b00a823b5f498cd8ff8abb1fafb519001f9f56f21d0eff113b9a1ea0eeea339b730ecaddd0d36cfde48ee5a9c5264aa523c5e69d6f657c3d7ca3531fd30bb7f4f692e2dd6401c0a383c7a722708d422a0f40177ccbafba3b4e300b7837d67a14980004d1ad73ac7282095915e20a5587f66ded469a47a698a0e8ae42c65723009e947d69b844b0fd9c92b8969ca81a6c4ba8274ff005fa5bd8437bb328de2015a8c7cba2d9851ab4e3d1b0db59156f197665591f45cd94dc81724f3f9ff005bd835d6b50475a53d0dd420d44034027f6ca1b0d6ba058167bfd3571eca1d4a48c070eadd25b2703a3140a0020afd49f19bdc48b6fa7fafcfb7e292a9461dc7aa3ad57ac78bac4866d064d2068065b70d203f91f9bfb417709cb2f45aeb834343d0b184ac5d03595d4ce41bdfd7cfe3f23d92cc840e14eb43a5dc154cb658fd1c2966249b81f553f5056dec9ee220ea588f2e999541538e9de3657210b81e7436287952382a7faa91fef1ec337b1b50b798c7fb1d072fe1ac6c08c752629990807f66df41fabd22cbc7d78b0f64b2a6a06a31d03ee63a8351d3fd34cb291cad87d3e8a00b8170393c9bfb2d74d24d0744fa5b38f3e872ea8c4267abab29eb35c5152e2eaea6268c8f54f237dbc322ff00aa6815c923fa0f75b4b317533233600e3fe4e851b3dba960ec829d118f9a8cb8cdcbb130ef25e54db9555d2693c1fbbcacf1d34eca394d71538207f8fb95b94ecfc0b2bba2d4547e7d1fcd15534b2d7e5d1306a83e36b5f94751a8905aff00ea01166005cffafec5a1292ab53b6b91d250aca4031d074507e45dd3b93254921bb5060b6fd0c82c00568f1b0c9a56df8025bfbca5f63c3af2c2171996793fc24742edbea76c06bfe8a7fc83a33ff0bfe44e7be33e56af79e136ae2b75499cdad5bb5a5a4cc56d4d0d353433e463ac3591c94abae6904908421ae34923dcd3cc5edf43cedcbdb6598be682e91cb2b608c1a1a8fb31d036ef7d6d937abd9e28d2490d06924f0c1f2fb2bd1e7dc3fcd0bba32544f494fb0bad68e1a9d4dac415752f0970505370f0abc28a7806fc0ff5bd86b6ff00bbd6df3022ef99260c2a4d23555fcab5fdbd323dc5dc496d36d0815c0a31fe751fb3a2fb92f9b7dd1573e6eaa8e4d9189abdc30c94997a8a2c12354d4c2d47f632157a8a875a6315235974817fadafece6dbd88e4db49e2964beb96b846049d6343d0d40200f2e18ea937b83bfc91b46a2358d81a694351e5c4fae7a27120a60fe479e1e490472e1d8b359805fa13f5b7e3dcd48b144115a65c281ebc052b5e81559d8b110b135afa75dc6d4c834f91db4faaeb13966bfd12d6fa73ed6abc03480ec4fa85c7edebcc923126816be47af17446b94a8d4093610f07558e8b37363ed40645219229b4fae9e3d78239c556a7ae0f5600d49492124fd5ac01b9373a7f1eecd7249502c9b4791383f691d5d603521ee1430f23c7ac4f592fd452a25981576900e6ffea7f02fefcf35c06622d828f56c8fe5d6d6de3f87c6a9f974e48a1b1f5755356e3e2a8829a9a58295753cb3d44d51e3318b0b00b19d47fa7b7dc968bc57b9847e98381c3a6d5545c24489214d, 'AN', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_reparacion`
--

CREATE TABLE IF NOT EXISTS `solicitud_reparacion` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=76 ;

--
-- Volcado de datos para la tabla `solicitud_reparacion`
--

INSERT INTO `solicitud_reparacion` (`id_solicitud`, `numero`, `id_tipo`, `nivel`, `solicitante`, `f_solicitado`, `f_sugerido`, `hora_sug`, `id_equipo`, `correctivo`, `causa`, `observaciones`, `estado`, `usrId`, `fecha_conformidad`, `observ_conformidad`, `foto1`, `foto2`, `foto3`, `foto`, `id_empresa`) VALUES
(1, NULL, NULL, NULL, 'Jose Perez', '2017-11-08 10:44:25', '2017-11-09', '08:00:00', 1, NULL, 'rotura de rueda', NULL, 'T', 3, '2018-09-29', 'Conformidad ', NULL, NULL, NULL, NULL, 6),
(2, NULL, NULL, NULL, 'wqewqe', '2017-11-08 10:45:54', '2017-11-09', '08:00:00', 1, NULL, 'assdas', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(3, NULL, NULL, NULL, 'asdsadasd', '2017-11-08 10:46:39', '2017-11-09', '08:00:00', 1, NULL, 'asdad', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(4, NULL, NULL, NULL, 'sssss', '2017-11-08 10:47:21', '2017-11-09', '08:00:00', 1, NULL, 'sadasdas', NULL, 'T', 1, '2018-01-30', 'trabajo terminado', NULL, NULL, NULL, NULL, 6),
(5, NULL, NULL, NULL, 'huggo', '2017-11-08 12:53:19', '2017-11-09', '08:00:00', 1, NULL, 'observc test2', NULL, 'T', 1, '2018-09-25', 'nuevaaaa', NULL, NULL, NULL, NULL, 6),
(6, NULL, NULL, NULL, 'Hugo Gallardo', '2017-11-14 15:23:31', '2017-11-15', '08:00:00', 2, NULL, 'Rotura de llanta', NULL, 'C', 5, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(7, NULL, NULL, NULL, 'Hugo Gallardo', '2017-12-01 05:35:25', '2017-12-04', '08:00:00', 2, NULL, 'Falla test sobre RS-0001 (01-12)', NULL, 'C', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(8, NULL, NULL, NULL, 'hugo gallardo', '2018-01-13 21:54:50', '2018-01-14', '08:00:00', 2, NULL, 'rotura de equipo test', NULL, 'S', 5, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(9, NULL, NULL, NULL, 'juan perez', '2018-01-17 13:38:28', '2018-01-19', '08:00:00', 4, NULL, 'mancha de aceite abajo del equipo ', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(10, NULL, NULL, NULL, '1', '2018-01-18 18:05:53', '2018-01-18', '18:04:00', 8, NULL, 'ccg', '18:04', 'AN', 0, '2018-02-08', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(11, NULL, NULL, NULL, '1', '2018-01-18 18:07:20', '2018-01-18', '18:06:00', 6, NULL, 'mancha de aceite debajo del equipo', '18:06', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(12, NULL, NULL, NULL, '1', '2018-01-30 14:06:43', '2018-01-30', '14:03:00', 9, NULL, 'No tiene fuerza para levantar la carga', '14:03', 'AN', 0, '2018-02-08', 'ok\r\n', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(13, NULL, NULL, NULL, '3', '2018-02-05 19:01:38', '2018-02-05', '18:59:00', 9, NULL, 'bateria descargada\n\n', '18:59', 'C', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(14, NULL, NULL, NULL, '1', '2018-02-05 19:42:17', '2018-02-07', '05:41:00', 9, NULL, 'fhjh', '05:41', 'AN', 0, '2018-02-08', 'Trabajo OK ', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(15, NULL, NULL, NULL, '1', '2018-02-05 19:46:36', '2018-02-17', '05:41:00', 6, NULL, 'ggggjffufjffg', '05:41', 'T', 0, '2018-04-11', 'TERMINADO CON EXITO', NULL, NULL, NULL, 'assets/files/reclamos/15.jpg', 6),
(16, NULL, NULL, NULL, '1', '2018-02-07 12:36:19', '2018-02-16', '12:35:00', 7, NULL, 'fff', '12:35', 'AN', 0, '2018-02-08', '', NULL, NULL, NULL, 'assets/files/reclamos/16.jpg', 6),
(17, NULL, NULL, NULL, '1', '2018-02-08 14:38:14', '2018-02-08', '14:35:00', 10, NULL, 'Ruido en cuerpo de bomba int 0057A', '14:35', 'C', 0, '2018-04-11', 'lista la solicitud', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(18, NULL, NULL, NULL, '1', '2018-02-08 14:46:00', '2018-02-08', '14:45:00', 6, NULL, 'Gets con desgaste excesivo', '14:45', 'C', 0, '2018-04-10', 'CONFORMIDAD', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(19, NULL, NULL, NULL, 'hugo gallardo cloud', '2018-04-11 12:56:39', '2018-04-12', '08:00:00', 10, NULL, 'solicitud de servicios prrueba coud', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(20, NULL, NULL, NULL, 'hugo de nuevo', '2018-04-11 13:15:16', '2018-04-13', '16:00:00', 10, NULL, 'sol de servicio test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(21, NULL, NULL, NULL, 'ssss', '2018-04-12 10:53:14', '2018-04-13', '08:00:00', 10, NULL, 'asdadasdas', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(22, NULL, NULL, NULL, 'ssss', '2018-04-12 10:57:40', '2018-04-13', '08:00:00', 10, NULL, 'zcxczx', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(23, NULL, NULL, NULL, 'hugo', '2018-06-18 17:19:46', '2018-06-19', '08:00:00', 10, NULL, 'falla de equipo prueba', NULL, 'AC', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(24, NULL, NULL, NULL, 'hugo gallardo', '2018-06-18 17:22:00', '2018-06-19', '08:00:00', 10, NULL, 'fala en quipo testeado', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(25, NULL, NULL, NULL, 'hugo gallardo', '2018-06-18 17:36:20', '2018-06-19', '08:00:00', 10, NULL, 'fala en quipo testeado', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(26, NULL, NULL, NULL, 'hugo ggggg', '2018-06-18 17:38:17', '2018-06-19', '08:00:00', 10, NULL, 'fallaa test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(27, NULL, NULL, NULL, 'hugo g', '2018-06-19 11:09:05', '2018-06-20', '08:00:00', 4, NULL, 'falla test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(28, NULL, NULL, NULL, 'hugo g', '2018-06-19 11:13:04', '2018-06-20', '08:00:00', 4, NULL, 'falla test 1', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(29, NULL, NULL, NULL, 'hugo g', '2018-06-19 11:17:36', '2018-06-20', '08:00:00', 4, NULL, 'falla testing 1', NULL, 'T', 3, '2018-06-19', 'terminada conforme', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(30, NULL, NULL, NULL, 'hugo', '2018-06-21 09:41:58', '2018-06-22', '08:00:00', 4, NULL, 'falla testing solicitud', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(31, NULL, NULL, NULL, 'hugo', '2018-06-25 09:29:37', '2018-06-26', '08:00:00', 4, NULL, 'fala ttesting 25-06', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(32, NULL, NULL, NULL, 'hugo ggg', '2018-06-28 12:52:09', '2018-06-29', '08:00:00', 4, NULL, 'falla calendario ', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(33, NULL, NULL, NULL, '1', '2018-07-30 03:30:17', '2018-07-30', '10:23:00', 2, NULL, 'Ventana sucia', '10:23', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 0),
(34, NULL, NULL, NULL, '1', '2018-08-30 04:35:56', '2018-08-30', '15:30:00', 4, NULL, 'falla en rodillo de cinta', '15:30', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 0),
(35, NULL, NULL, NULL, '1', '2018-08-30 08:00:51', '2018-08-30', '18:16:00', 7, NULL, 'ddd', '18:16', 'AN', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/reclamos/35.jpg', 6),
(36, NULL, NULL, NULL, 'dasasdasd', '2018-08-30 08:18:16', '2018-08-31', '08:00:00', 1, NULL, 'asdad', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(37, NULL, NULL, NULL, '1', '2018-08-30 22:50:07', '2018-08-31', '10:05:00', 2, NULL, 'fgggsf', '10:05', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/reclamos/37.jpg', 0),
(38, NULL, NULL, NULL, 'juan perez', '2018-09-04 23:33:51', '2018-09-06', '08:00:00', 1, NULL, 'dsadas', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(39, NULL, NULL, NULL, 'juan perez', '2018-09-07 00:08:47', '2018-09-08', '08:00:00', 1, NULL, 'sadasda', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(40, NULL, NULL, NULL, 'asd', '2018-09-07 00:38:52', '2018-09-08', '18:30:00', 0, NULL, 'asdsad', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(41, NULL, NULL, NULL, 'nose', '2018-09-07 00:41:25', '2018-09-08', '08:00:00', 0, NULL, 'nueva', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(42, NULL, NULL, NULL, 'nose', '2018-09-07 00:42:09', '2018-09-08', '08:00:00', 0, NULL, 'anda?', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(43, NULL, NULL, NULL, 'nueva', '2018-09-07 00:42:27', '2018-09-08', '08:00:00', 0, NULL, 'anda?', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(44, NULL, NULL, NULL, 'nose', '2018-09-07 00:43:06', '2018-09-08', '08:00:00', 0, NULL, 'test', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(45, NULL, NULL, NULL, 'nose', '2018-09-07 00:44:57', '2018-09-08', '08:00:00', 0, NULL, 'test', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(46, NULL, NULL, NULL, 'nueva', '2018-09-07 00:46:02', '2018-09-08', '08:00:00', 0, NULL, 'test', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(47, NULL, NULL, NULL, 'nose', '2018-09-07 00:46:27', '2018-09-08', '08:00:00', 0, NULL, 'jjj', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(48, NULL, NULL, NULL, 'kkk', '2018-09-07 00:46:40', '2018-09-08', '08:00:00', 0, NULL, 'jjjj', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(49, NULL, NULL, NULL, 'yo', '2018-09-24 09:42:30', '0000-00-00', '08:00:00', -1, NULL, 'nose', NULL, 'S', 16, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(50, NULL, NULL, NULL, 'yo', '2018-09-24 10:19:02', '0000-00-00', '08:00:00', 13, NULL, 'Fuga de aceite hidraulico por pto', NULL, 'AN', 16, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(51, NULL, NULL, NULL, 'Nuevo solicitante', '2018-09-25 10:23:40', '0000-00-00', '19:00:00', 1, NULL, 'equipo averiado ', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(52, NULL, NULL, NULL, 'nuevo', '2018-09-25 10:24:58', '2018-11-08', '10:00:00', 5, NULL, 'Nota Nueva', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(53, NULL, NULL, NULL, 'Hugo', '2018-09-25 10:27:46', '0000-00-00', '10:00:00', 5, NULL, 'falla grave', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(54, NULL, NULL, NULL, 'nn', '2018-09-26 00:13:28', '0000-00-00', '12:30:00', 5, NULL, 'nueva borrar', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(55, NULL, NULL, NULL, 'yo', '2018-09-26 18:26:01', '0000-00-00', '08:00:00', 13, NULL, 'vidrio', NULL, 'AN', 16, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(56, NULL, NULL, NULL, 'yo', '2018-10-04 16:55:24', '2018-10-05', '10:15:00', 5, NULL, 'nota', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(57, NULL, NULL, NULL, 'eli', '2018-10-04 21:51:39', '2018-10-25', '09:00:00', 5, NULL, 'eli', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(58, NULL, NULL, NULL, 'nose', '2018-10-05 09:34:38', '2018-10-25', '09:00:00', 5, NULL, 'sera o no seraaaaa', NULL, 'T', 1, '2018-10-05', 'dgsgg', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(59, NULL, NULL, NULL, 'nuevo pabloncho', '2018-10-05 09:50:25', '2018-10-25', '13:00:00', 5, NULL, 'pabloncho', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(60, NULL, NULL, NULL, 'pabli', '2018-10-05 09:51:06', '2018-10-12', '12:00:00', 9, NULL, 'jaajaja', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(61, NULL, NULL, NULL, 'mauriiiiiiii peeeeee', '2018-10-05 09:55:42', '2018-10-24', '12:30:00', 5, NULL, 'borrarrrr', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(62, NULL, NULL, NULL, 'nose', '2018-10-05 09:57:01', '2018-10-06', '08:00:00', 5, NULL, 'eliminarrrrrrr', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(63, NULL, NULL, NULL, 'nose', '2018-10-05 09:58:24', '2018-10-06', '08:00:00', 9, NULL, 'jajajajajaja', NULL, 'T', 1, '2018-10-05', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(64, NULL, NULL, NULL, 'nose', '2018-10-05 10:02:33', '2018-10-06', '08:00:00', 5, NULL, 'no anda', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(65, NULL, NULL, NULL, 'hugo gallarete', '2018-10-05 10:04:25', '2018-10-06', '13:00:00', 9, NULL, 'falla 1', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(66, NULL, NULL, NULL, 'huguis', '2018-10-05 10:04:53', '2018-10-24', '08:00:00', 9, NULL, 'falla 2', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(67, NULL, NULL, NULL, 'aabbcc', '2018-10-05 10:08:52', '2018-10-19', '11:00:00', 5, NULL, 'falla 3', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(68, NULL, NULL, NULL, 'dfghdfgh', '2018-10-05 10:17:13', '2018-10-06', '08:00:00', 9, NULL, 'dfghfhfgh', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(69, NULL, NULL, NULL, 'asas', '2018-10-05 10:24:05', '2018-10-06', '08:00:00', 9, NULL, 'asasas', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(70, NULL, NULL, NULL, 'nueva 123', '2018-10-05 10:25:12', '2018-10-06', '08:00:00', 5, NULL, 'nueva y ultima', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(71, NULL, NULL, NULL, 'nose', '2018-10-05 10:25:29', '2018-10-06', '08:00:00', 9, NULL, 'eli', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(72, NULL, NULL, NULL, 'nn', '2018-10-05 11:23:25', '2018-10-06', '08:00:00', 5, NULL, 'falllaaaaaaa', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(73, NULL, NULL, NULL, 'Marcelo Muriel ', '2018-10-08 08:47:51', '2018-10-15', '12:00:00', 16, NULL, 'Engrase de cardan ', NULL, 'S', 18, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(74, NULL, NULL, NULL, 'Perez', '2018-10-08 11:57:58', '2018-10-24', '12:00:00', 9, NULL, 'falla fatal', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(75, NULL, NULL, NULL, '1', '2018-10-08 12:05:47', '2018-10-08', '12:04:00', 13, NULL, 'ggg', '12:04', 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/reclamos/75.jpg', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE IF NOT EXISTS `sucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `dire` varchar(3000) NOT NULL,
  `telefono` varchar(3000) NOT NULL,
  `zonas` varchar(3000) NOT NULL,
  `id_localidad` int(11) NOT NULL,
  `descripc` varchar(3000) NOT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `dire`, `telefono`, `zonas`, `id_localidad`, `descripc`, `estado`, `id_empresa`) VALUES
(1, 'Av. Libertador San Martín 890 oeste', '4253133', 'desamparados', 1, 'Casa central', 'AC', 6),
(2, 'algun lugar', '235040', 'capital', 2, 'Sucursal de capital', 'AC', 6),
(3, 'Presidente Roca s/n', '12345678', 'Calingasta', 1, 'Seccional Barreal', 'AC', 6),
(4, '1', '1', '1', 1, 'MRS SERVICE', 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE IF NOT EXISTS `tareas` (
  `id_tarea` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_tarea`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=231 ;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id_tarea`, `descripcion`, `estado`, `id_empresa`) VALUES
(1, 'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)', 'AC', 6),
(2, 'Limpie las Mangueras y las Conexiones del Radiador.', 'AC', 6),
(3, 'Cambie Liquido de Refrigerante de Motor (Revise la Mezcla Anticongelante antes de la Epoca Invernal).', 'AC', 6),
(4, 'Revise la Bomba de Agua', 'AC', 6),
(5, 'Compruebe el Intercooler y las Mangueras de Conexion.', 'AC', 6),
(6, 'Drene la Valvula de Purga de Agua del Deposito de Combustible', 'AC', 6),
(7, 'Cambie el Filtro de Combustible del Motor', 'AC', 6),
(8, 'Cambie el Respiradero del Deposito de Combustible.', 'AC', 6),
(9, 'Limpie el Cuerpo del Radiador.', 'AC', 6),
(10, 'Lubricar Todos los Puntos de Engrase de la Corredera ', 'AC', 6),
(11, 'Compruebe la Holgura del Carro del Martillo Perforador y el Carril de la Corredera.', 'AC', 6),
(12, 'Compruebe el Estado de las Mordazas del Centralizador del Retenedor.', 'AC', 6),
(13, 'Compruebe el Aceite del Engranaje de la Corredera.', 'AC', 6),
(14, 'Cambie el Aceite del Engranaje de la Corredera.', 'AC', 6),
(15, 'Cambie los Filtros del Motor', 'AC', 6),
(16, 'Lubrique los 13 Puntos de Engrase Segun Diagrama.', 'AC', 6),
(17, 'Compruebe las Soldaduras del Brazo y de la Cuna.', 'AC', 6),
(18, 'Compruebe los Soportes de los Cilindros ', 'AC', 6),
(19, 'Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.', 'AC', 6),
(20, 'Revisar Apriete de las Varillas Tirantes. ', 'AC', 6),
(21, 'Revisar Presion y Estado de Valvulas y Tapones de Llenado de Acumulacion.', 'AC', 6),
(22, 'Revisar Apriete de los Tornillos del Acumulador, Motor de Rotación y Tapa Trasera.', 'AC', 6),
(23, 'Engrase los Ejes de Oscilación y Pasadores del Cilindro de Oscilación.', 'AC', 6),
(24, 'Compruebe el Estado y la Sujeccion del Cable del Cabrestante.', 'AC', 6),
(25, 'Compruebe que no Existen Roturas en las Costuras de Soldadura.', 'AC', 6),
(26, 'Compruebe el Electrolito y las Conexiones de las Baterias.', 'AC', 6),
(27, 'Inspección: Revisar Desgaste de Correa de Distribución (de ser necesario cambiar). ', 'AC', 6),
(28, 'Regular Luz de Válvula de Motor (cada 2000hs segun horometro).', 'AC', 6),
(29, 'Probar la Capacidad de Retención del Freno de Servicio y del Freno de Estacionamiento (procedimiento CAT SMCS - 4251-081; 4267-081).', 'AC', 6),
(30, 'Inspección: Revisar Anclaje , Desgaste y Fecha de Instalacion del Cinturón de Seguridad (de ser necesario cambie el cinturón de seguridad con mas de tres años o por excesivo desgaste). ', 'AC', 6),
(31, 'Inspeccion: Revisar Nivel del Liquido Limpiaparabrisas (de ser necesario rellenar).', 'AC', 6),
(32, 'Lubricar Articulación de Cucharón y Cojinete del Cilindro Cargador (utilizar grasa EP68). ', 'AC', 6),
(33, 'Inspeccion: Revisar Desgaste en Cuchillas, Cantoneras y Planchas de Desgaste Inferiores (controlar par de apriete en bulones, de ser necesario cambiar).', 'AC', 6),
(34, 'Lubricar Cojinete del Pivote Inferior y Superior del Cucharon (limpie todas las conexiones de engrase antes de lubricar, utilizar grasa EP68 ).', 'AC', 6),
(35, 'Inspección: Revisar Desgaste en Puntas del Cucharon (de ser necesario, programar cambiarlo).', 'AC', 6),
(36, 'Cambiar Aceite de Transmisión (cada 1000hs según horometro, utilizar el aceite SAE10W). ', 'AC', 6),
(37, 'Inspección: Nivel de Aceite de Transmisión. ', 'AC', 6),
(38, 'Cambiar Aceite Hidráulico (cada 500hs segun horometro, utilizar aceite hidráulico 68).. ', 'AC', 6),
(39, 'Inspección: Nivel de Aceite Hidráulico.', 'AC', 6),
(40, 'Lubricar Estrias de la Columna de Dirección (tener en cuenta 8 puntos de engrase).', 'AC', 6),
(41, 'Lubricar Rodamiento de la Columna de Dirección (utilizar la grasa EP68).', 'AC', 6),
(42, 'Inspección: Revisar Corrosion en Terminales y Desgaste o Daño en los Cables (de ser necesario, limpiar bornes de bateria y/o cambiar cables).', 'AC', 6),
(43, 'Lubricar Cojinetes Superior e Inferior de Articulación (limpie todas las conexiones de engrase antes de lubricar, utilizar grasa EP68).', 'AC', 6),
(44, 'Limpiar Equipo (utilice aire comprimido).', 'AC', 6),
(45, 'Cambiar Filtro de Aceite de Motor (1R-1808 ITEM 57874).', 'AC', 6),
(46, 'Cambiar Aceite de Motor (cada 250 hs según horometro, utilizar aceite 15W40).', 'AC', 6),
(47, 'Limpiar Tanque de Combustible.', 'AC', 6),
(48, 'Inspección: Revisar Desgaste de Correa de Distribución (de ser necesario cambiar).', 'AC', 6),
(49, 'Cambiar Filtro de Aire Primario 245-3818 Item 57871 (cada 250 hs según horometro).', 'AC', 6),
(50, 'Cambiar Filtro De Aire Secundario  245-3819 Item 57872 (cada 250 hs según horometro).', 'AC', 6),
(51, 'Cambiar Filtro Separador De Agua Del Sistema De Combustible (cada 250 hs según horometro).', 'AC', 6),
(52, 'Inspección: Revisar Holgura De La Válvula (cada 1000 hs según horómetro. la holgura debe ser de 0,508 mm).', 'AC', 6),
(53, 'Limpiar Respiradero Del Carter (utilice disolvente liquido no inflamable).', 'AC', 6),
(54, 'Limpiar Válvula de Alivio de Tanque Hidráulico (utilice disolvente liquido no inflamable).', 'AC', 6),
(55, 'Limpiar Rejilla de Aceite de Dirección Piloto (utilice disolvente liquido no inflamable).', 'AC', 6),
(56, 'Lubricar Cojinetes (Vástago y Cabezal) del Cilindro de Dirección (limpie todas las conexiones de engrase antes de lubricar. utilizar grasa EP68).', 'AC', 6),
(57, 'Inspección: Revisar Holgura De La Válvula (cada 1000 hs según horómetro. la holgura debe ser de 0,254 mm).', 'AC', 6),
(58, 'Inspección Visual: Nivel de Aceite de Transmisión (cuando se requiera).', 'AC', 6),
(59, 'Cambiar Filtro de Aceite de Transmisión (cada 500 hs según horometro).', 'AC', 6),
(60, 'Limpieza Respiradero (remover barro y suciedad. lavar con líquido limpiador. cada 1000 hs según horometro).', 'AC', 6),
(61, 'Inspección Visual: Nivel de Aceite del Eje de Mando Delantero.', 'AC', 6),
(62, 'Lubricar Eje de Mando Delantero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites. capacidad 16 litros).', 'AC', 6),
(63, 'Inspección Visual: Nivel de Aceite del Eje de Mando Trasero (Tomar lectura de nivel con varilla de medición).', 'AC', 6),
(64, 'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).', 'AC', 6),
(65, 'Cambiar Aceite de Diferencial Delantero y Trasero (cada 1000 hs según horometro útilizar aceite sae50).', 'AC', 6),
(66, 'Limpiar Filtro Acondicionador de Aire (utilizar aire comprimido seco, en caso de daños, cambiar. realizar cada 100 hs según horómetro).', 'AC', 6),
(67, 'Cambiar Filtro Acondicionador de Aire (realizar cada 2000 hs según horómetro).', 'AC', 6),
(68, 'Inspección: Nivel de Aceite Hidráulico (controlar el nivel por medio del medidor visual. revisar cada 100 hs según horómetro).', 'AC', 6),
(69, 'Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).', 'AC', 6),
(70, 'Revisar Presión de Inflado (revisar cada 50 hs según horómetro. la presión de inflado debe ser entre 2,5kg/cm2  a 3,5 kg/cm2).', 'AC', 6),
(71, 'Inspección Visual: Revisar Estado General de los Neumáticos (controlar que no tengan ningún tipo de daños. revisar cada 50 hs según horómetro).', 'AC', 6),
(72, 'Revisar el Apriete de los Tornllos de los Cubos de las Ruedas (revisar cada 250 hs. según horómetro. la tensión de apriete  es de 94,5 +/- 10,5 kgm).', 'AC', 6),
(73, 'Cambiar Aceite de Mandos Finales (cada 1000 hs según horometro utilizar aceite SAE 50).', 'AC', 6),
(74, 'Limpiar el Equipo (utilice aire comprimido).', 'AC', 6),
(75, 'Inspección: Comprobar Funcionamiento de Alarma de Retroceso (con el equipo en contacto, active el freno de servicio y coloque marcha en retroceso).', 'AC', 6),
(76, 'Inspección: Revisar Presencia de Fisuras y Bulones Flojos o Dañados.', 'AC', 6),
(77, 'Inspección: Comprobar Funcionamiento de las Luces.', 'AC', 6),
(78, 'Cambiar Aceite de Motor (utilizar aceite 15W40).', 'AC', 6),
(80, 'Inspección Visual: Controlar Pérdida y Nivel de Aceite Motor (de ser necesario nivelar con aceite 15W40).', 'AC', 6),
(81, 'Inspección Visual: Controlar Soportes del Motor.', 'AC', 6),
(82, 'Inspección Visual: Controlar la Tensión de la Cadena.', 'AC', 6),
(83, 'Presión Según Fabricante.', 'AC', 6),
(84, 'Inspección Visual de los Neumáticos (control del dibujo de los neumáticos).', 'AC', 6),
(85, 'Cambiar Filtro de Aceite de Motor ITEM. 51488.', 'AC', 6),
(86, 'Inspección Visual: Controlar la Tensión de la Correa (utilice medidor de tensión de correa).', 'AC', 6),
(87, 'Cambiar Filtro de  Aire (primario ITEM 51518).', 'AC', 6),
(88, 'Cambiar Filtro Separador de Agua del Sistema de Combustible.', 'AC', 6),
(89, 'Inspección Visual: Controlar Soportes del Motor.', 'AC', 6),
(90, 'Probar la Capacidad de Retención del Freno de Servicio y del Freno de Estacionamiento.', 'AC', 6),
(91, 'Inspección Visual: Controlar Pérdida y Nivel de Agua del Radiador.', 'AC', 6),
(92, 'Cambiar Cartucho Filtro de Aire.', 'AC', 6),
(93, 'Inspección: Revisar Corrosión en Terminales y Desgaste o Daño en los Cables (de ser necesario, limpiar bornes de bateria y/o cambiar cables).', 'AC', 6),
(94, 'Inspección: Comprobar Funcionamiento de la Bocina.', 'AC', 6),
(95, 'Lubricar Movimiento (utilizar grasa EP 62).', 'AC', 6),
(96, 'Inspeccion Visual: Controlar el Nivel de Aceite del Convertidor.', 'AC', 6),
(97, 'Inspección Visual: Controlar Manguera.', 'AC', 6),
(98, 'Limpie el Filtro de Admisión de Aire (se puede limpiar como máximo 6 veces, luego cambiar).', 'AC', 6),
(99, 'Cambie el Filtro de Admisión de Aire (ITEM. 51549).', 'AC', 6),
(100, 'Cambie el Cartucho de Filtro de Aire.', 'AC', 6),
(101, 'Compruebe Juego y Desgaste en Patas de Motor.', 'AC', 6),
(102, 'Compruebe el Amortiguador de Vibraciones del Cigüeñal.', 'AC', 6),
(103, 'Revise las Tuberias y Conexiones de la Admisión de Aire.', 'AC', 6),
(104, 'Cambie el Aceite de Motor (aceite 15W40).', 'AC', 6),
(105, 'Cambie los Filtros de Aceite (ITEM. 58108).', 'AC', 6),
(106, 'Sustituya el Elemento del Respiradero del Carter de Motor.', 'AC', 6),
(107, 'Compruebe las Boquillas del Inyector.', 'AC', 6),
(108, 'Revise el Sensor de Temperatura.', 'AC', 6),
(109, 'Compruebe la Holgura de la Cuna.', 'AC', 6),
(111, 'TEST', 'AN', 6),
(112, 'Orden y Limpieza', 'AC', 7),
(113, 'Cambio de Vidrios ', 'AC', 7),
(114, 'Cambio Asiento  ', 'AN', 7),
(115, 'Reemplazo de butaca', 'AC', 7),
(116, 'Regulación de cerradura ', 'AC', 7),
(117, 'Cambio de Cerradura ', 'AC', 7),
(118, 'Cambio de Manómetros ', 'AC', 7),
(119, 'Reemplazo de motores de Rotación de Cabezal ', 'AC', 7),
(120, 'Reemplazo de cabezal', 'AC', 7),
(121, 'Regulación Eléctrica de Joysticks ', 'AC', 7),
(122, 'Regulación Mecánica de Joysticks', 'AC', 7),
(123, 'Cambio de TIM', 'AC', 7),
(124, 'Calibración de TIM ', 'AC', 7),
(125, 'Reparación de Calefacción ', 'AC', 7),
(126, 'Limpieza  de Filtro Interior de Cabina ', 'AC', 7),
(127, 'Cambio de Filtro Exterior de Cabina ', 'AC', 7),
(128, 'Cambio de Filtro Interior de Cabina', 'AC', 7),
(129, 'Resellado de Cabina ', 'AC', 7),
(130, 'Cambio de Burletes de Puerta ', 'AC', 7),
(131, 'Cambio de Puerta de Acceso ', 'AC', 7),
(132, 'Cambio de Lampara  Luz de cabina ', 'AC', 7),
(133, 'Cambio de Interruptores en Cabina ', 'AC', 7),
(134, 'Cambio de Joysticks ', 'AC', 7),
(135, 'Carga de Gas de A/C ', 'AC', 7),
(136, 'Chequeo de Sistema de A/C', 'AC', 7),
(137, 'Cambio de Compresor de A/C ', 'AC', 7),
(138, 'Cambio de Equipo A/C de Cabina ', 'AC', 7),
(139, 'Cambio de Escobillas Limpiaparabrisas ', 'AC', 7),
(140, 'Cambio de Escalera de Acceso ', 'AC', 7),
(141, 'Reparación de Escalera de Acceso ', 'AC', 7),
(142, 'Cambio de llave U ', 'AC', 7),
(143, 'Cambio de Cilindro de Llave U ', 'AC', 7),
(144, 'Cambio de Goma de Cierre  ', 'AC', 7),
(145, 'Cambio de Guías de  Teflon Cabezal ', 'AC', 7),
(146, 'Regulación de Motores de Rotación ', 'AC', 7),
(147, 'Cambio de Sellos Agua-Aire en Cabezal ', 'AC', 7),
(148, 'Cambio de Retenes de Cabezal ', 'AC', 7),
(149, 'Cambio de Sensor de RPM  de Cabezal ', 'AC', 7),
(150, 'Alineación de Cabezal ', 'AC', 7),
(151, 'Regulación de Sostenimiento de Cabezal ', 'AC', 7),
(152, 'Cambio de Luces de Trabajo ', 'AC', 7),
(153, 'Chequeo de Sistema Eléctrico ', 'AC', 7),
(154, 'Cambio de Bomba Principal ', 'AC', 7),
(155, 'Cambio de Bombas Auxiliares ', 'AC', 7),
(156, 'Cambio de Retenes de Bomba ', 'AC', 7),
(157, 'Regulación De Bombas ', 'AC', 7),
(158, 'Cambio de Actuadores de Bomba ', 'AC', 7),
(159, 'Cambio de Banco de 6 Carretes ', 'AC', 7),
(160, 'Cambio de Banco de 9 Carretes ', 'AC', 7),
(161, 'Cambio de Válvulas Pulsar ', 'AC', 7),
(162, 'Resellado de Banco Principales ', 'AC', 7),
(163, 'Cambio de Válvulas Diversoras ', 'AC', 7),
(164, 'Reparación de Válvulas Diversoras ', 'AC', 7),
(165, 'Reparación de Válvulas de Aceite Caliente ', 'AC', 7),
(166, 'Reparación de Válvula DR/PR ', 'AC', 7),
(167, 'Cambio de Válvula Fema ', 'AC', 7),
(168, 'Cambio de Motor de Traslación ', 'AC', 7),
(169, 'Cambio de Motor Hidráulico ', 'AC', 7),
(170, 'Regulación  RPM de ventilador  de Enfriamiento ', 'AC', 7),
(171, 'Reparación de Fugas Hidráulicas ', 'AC', 7),
(172, 'Reparación de Válvulas Contrabalance ', 'AC', 7),
(173, ' Reparación de Válvulas de Sostenimiento', 'AC', 7),
(174, 'Cambio de Válvulas de Sostenimiento ', 'AC', 7),
(175, 'Cambio de Cilindro Hidráulico ', 'AC', 7),
(176, 'Chequeo  de Sistema Hidráulico ', 'AC', 7),
(177, 'Cambio de Radiador ', 'AC', 7),
(178, 'Limpieza de Radiador ', 'AC', 7),
(179, 'Cambio de Termostato ', 'AC', 7),
(180, 'Cambio de bomba de Agua ', 'AC', 7),
(181, 'Reparación de Boba de Agua  ', 'AC', 7),
(182, 'Purgado de Sistema de Iyeccion de Agua ', 'AC', 7),
(183, 'Reparación de Válvula Check ', 'AC', 7),
(184, 'Cambio de Válvula Check ', 'AC', 7),
(185, 'Limpieza de Filtros De Aire ', 'AC', 7),
(186, 'Cambio de Filtro de Aceite de Motor ', 'AC', 7),
(187, 'Cambio de Filtro de Aceite Hidráulico ', 'AC', 7),
(188, 'Cambio de Filtro de Aceite de Compresor ', 'AC', 7),
(189, 'Cambio de Filtro de Aire ', 'AC', 7),
(190, 'Cambio de Filtros Colector de Polvo', 'AC', 7),
(191, 'Limpieza de Filtros Colector de Polvo ', 'AC', 7),
(192, 'Cambio de Sensores ', 'AC', 7),
(193, 'Cambio de Arnés ', 'AC', 7),
(194, 'Calibración de Sensores ', 'AC', 7),
(195, 'Chequeo Sistema Neumático ', 'AC', 7),
(196, 'Cambio de Módulos Eléctricos  ', 'AC', 7),
(197, 'Cambio de Fusibles ', 'AC', 7),
(198, 'Cambio de Baterías ', 'AC', 7),
(199, 'Cambio de Presoswitchs ', 'AC', 7),
(200, 'Cambio de Solenoides ', 'AC', 7),
(201, 'Limpieza de Sensores', 'AC', 7),
(202, 'Tensado de Cadenas de Tren Rodante ', 'AC', 7),
(203, 'Cambio de Rolos Superiores Tren Rodante ', 'AC', 7),
(204, 'Cambio de Rolos Inferiores Tren Rodante', 'AC', 7),
(205, 'Cambio de Rueda GuíaTren Rodante  ', 'AC', 7),
(206, 'Cambio de Mando Final ', 'AC', 7),
(207, 'Tenzado de Cables de Avance ', 'AC', 7),
(208, 'Tensado de Cables de Holdback ', 'AC', 7),
(209, 'Cambio de Poleas Cables de Avance ', 'AC', 7),
(210, 'Cambio de Sprocket de Holdback ', 'AC', 7),
(211, 'Cambio de Mangueras Hidráulicas ', 'AC', 7),
(212, 'Cambio de Mangueras Neumáticas ', 'AC', 7),
(213, 'Cambio de Vidrios ', 'AN', 7),
(214, 'Cambio de Guías Metálicas  de Viga ', 'AC', 7),
(215, 'Cambio de Zapatas de Oruga ', 'AC', 7),
(216, 'Retorqueo de Zapatas de Orugas ', 'AC', 7),
(217, 'Recarga de Fluidos ', 'AC', 7),
(218, 'Cambio de Baterías ', 'AC', 7),
(219, 'Engrase de Equipo ', 'AC', 7),
(220, 'Toma de Muestras ', 'AC', 7),
(221, 'Ejecución de BKL ', 'AC', 7),
(222, 'Inspección Perforadora 901 ', 'AC', 7),
(223, 'Inspección Perforadora 903 ', 'AC', 7),
(224, 'Inspección Perforadora 905 ', 'AC', 7),
(225, 'Inspección Perforadora 906 ', 'AC', 7),
(226, 'Regulación de Cmpresor ', 'AC', 7),
(227, 'Reparación de Válvula UL-88 ', 'AC', 7),
(228, 'Regulación de Intercambiador de Barras ', 'AC', 7),
(229, 'Limpieza de Difusor de Grasa de Barras', 'AC', 7),
(230, 'Limpieza de Mangon de Succión primario ', 'AC', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_back`
--

CREATE TABLE IF NOT EXISTS `tbl_back` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `tbl_back`
--

INSERT INTO `tbl_back` (`backId`, `id_equipo`, `tarea_descrip`, `fecha`, `horash`, `estado`, `back_duracion`, `back_canth`, `id_empresa`, `idcomponenteequipo`) VALUES
(16, 10, '4', '2018-04-27', NULL, 'AN', 60, 0, 6, NULL),
(17, 8, '10', '2018-04-29', NULL, 'AN', 120, 0, 6, NULL),
(18, 5, '10', '2018-05-02', NULL, 'AN', 20, 0, 6, NULL),
(19, 6, '6', '2018-05-04', NULL, 'AN', 15, 0, 6, NULL),
(20, 7, '8', '2018-05-02', NULL, 'AN', 50, 0, 6, NULL),
(21, 4, '4', '2018-05-11', NULL, 'AN', 20, 0, 6, NULL),
(22, 10, '5', '2018-05-01', NULL, 'AN', 30, 0, 6, NULL),
(23, 4, '5', '2018-05-31', NULL, 'AN', 80, 0, 6, NULL),
(24, 4, '5', '2018-10-31', NULL, 'C', 650, 0, 6, NULL),
(25, 11, '9', '2018-06-28', NULL, 'C', 60, 0, 6, NULL),
(26, 1, '3', '2018-08-30', NULL, 'C', 10, 0, 6, NULL),
(27, 13, '124', '0000-00-00', NULL, 'C', 250, 0, 7, NULL),
(28, 1, '1', '0000-00-00', NULL, 'C', 1233, 0, 6, NULL),
(29, 9, '111', '2018-10-25', NULL, 'C', 200, 0, 6, NULL),
(30, 13, '125', '2018-10-09', NULL, 'AN', 2, 0, 7, NULL),
(31, 19, '1', '2018-10-19', NULL, 'C', 30, 0, 6, 345),
(32, 9, '1', '2018-10-21', NULL, 'C', 5, 0, 6, 337),
(33, 9, '1', '2018-10-21', NULL, 'C', 23, 0, 6, 342),
(34, 19, '12', '2018-10-21', NULL, 'C', 3, 0, 6, 347),
(35, 9, '111', '2018-10-31', NULL, 'C', 60, 0, 6, 335);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detanotapedido`
--

CREATE TABLE IF NOT EXISTS `tbl_detanotapedido` (
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
  KEY `id_notaPedido` (`id_notaPedido`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=83 ;

--
-- Volcado de datos para la tabla `tbl_detanotapedido`
--

INSERT INTO `tbl_detanotapedido` (`id_detaNota`, `id_notaPedido`, `artId`, `cantidad`, `provid`, `fechaEntrega`, `fechaEntregado`, `remito`, `estado`) VALUES
(60, 57, 3, 2, 1, '2017-11-14', '2017-11-14', 454554, 'E'),
(61, 58, 1, 15, 1, '2017-11-21', '2017-11-21', 1, 'P'),
(62, 59, 1, 15, 1, '2017-12-01', '2017-12-01', 879797, 'E'),
(63, 60, 1, 0, 2, '2018-01-30', '2018-01-30', 1, 'P'),
(64, 60, 4, 2, 1, '2018-01-30', '2018-01-30', 1, 'P'),
(65, 61, 2, 13, 2, '2018-06-27', '2018-06-27', 1, 'P'),
(66, 62, 4, 14, 2, '2018-06-27', '2018-06-27', 1, 'P'),
(67, 63, 1, 14, 2, '2018-06-30', '2018-06-30', 1, 'P'),
(68, 63, 3, 34, 1, '2018-07-06', '2018-07-06', 1, 'P'),
(69, 64, 2, 12, 1, '2018-07-22', '2018-07-22', 1234567, 'E'),
(70, 65, 14, 2, 1, '2018-11-01', '2018-11-01', 1, 'P'),
(71, 65, 92, 11, 3, '2018-11-07', '2018-11-07', 1, 'P'),
(72, 66, 10, 3, 1, '2018-11-01', '2018-11-01', 1, 'P'),
(73, 67, 30, 4, 1, '2018-10-31', '2018-10-31', 1, 'P'),
(74, 68, 21, 8, 2, '2018-10-31', '2018-10-31', 1, 'P'),
(75, 69, 11, 5, 1, '2018-10-31', '2018-10-31', 1, 'P'),
(76, 69, 14, 1, 2, '2018-11-02', '2018-11-02', 1, 'P'),
(77, 69, NULL, NULL, NULL, '1969-12-31', '1969-12-31', 1, 'P'),
(78, 70, 11, 5, 1, '2018-10-31', '2018-10-31', 1, 'P'),
(79, 70, 14, 1, 2, '2018-11-02', '2018-11-02', 1, 'P'),
(80, 70, NULL, NULL, NULL, '1969-12-31', '1969-12-31', 1, 'P'),
(81, 71, 221, 24, 3, '2018-10-30', '2018-10-30', 1, 'P'),
(82, 71, 201, 1, 5, '2018-10-30', '2018-10-30', 1, 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detavaledescarga`
--

CREATE TABLE IF NOT EXISTS `tbl_detavaledescarga` (
  `detavaledid` int(11) NOT NULL AUTO_INCREMENT,
  `valedid` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `observa` varchar(255) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`detavaledid`),
  KEY `equipid` (`herrId`) USING BTREE,
  KEY `valedid` (`valedid`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tbl_detavaledescarga`
--

INSERT INTO `tbl_detavaledescarga` (`detavaledid`, `valedid`, `herrId`, `observa`, `dest`, `id_empresa`) VALUES
(1, 1, 4, NULL, NULL, 6),
(2, 2, 103, NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detavalesalida`
--

CREATE TABLE IF NOT EXISTS `tbl_detavalesalida` (
  `detavid` int(10) NOT NULL AUTO_INCREMENT,
  `valesid` int(11) DEFAULT NULL,
  `herrId` int(10) DEFAULT NULL,
  `observa` text,
  `dest` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`detavid`),
  KEY `equiid` (`herrId`) USING BTREE,
  KEY `valesid` (`valesid`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Volcado de datos para la tabla `tbl_detavalesalida`
--

INSERT INTO `tbl_detavalesalida` (`detavid`, `valesid`, `herrId`, `observa`, `dest`, `id_empresa`) VALUES
(1, 1, 8, NULL, NULL, 6),
(2, 2, 1, NULL, NULL, 6),
(3, 4, 2, NULL, NULL, 6),
(4, 5, 4, NULL, NULL, 6),
(5, 6, 0, NULL, NULL, 0),
(6, 6, 0, NULL, NULL, 0),
(7, 6, 0, NULL, NULL, 0),
(8, 6, 4, NULL, NULL, 0),
(15, 10, 103, NULL, NULL, 7),
(16, 11, 16, NULL, NULL, 6),
(17, 11, 2, NULL, NULL, 6),
(18, 12, 16, NULL, NULL, 6),
(19, 12, 2, NULL, NULL, 6),
(20, 13, 17, NULL, NULL, 6),
(21, 14, 24, NULL, NULL, 6),
(22, 15, 27, NULL, NULL, 6),
(23, 15, 29, NULL, NULL, 6),
(24, 16, 90, NULL, NULL, 6),
(25, 16, 29, NULL, NULL, 6),
(26, 17, 19, NULL, NULL, 6),
(27, 17, 86, NULL, NULL, 6),
(28, 18, 2, NULL, NULL, 6),
(29, 18, 6, NULL, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estado`
--

CREATE TABLE IF NOT EXISTS `tbl_estado` (
  `estadoid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`estadoid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `tbl_estado`
--

INSERT INTO `tbl_estado` (`estadoid`, `descripcion`, `estado`) VALUES
(1, 'ACTIVO', 'AC'),
(2, 'TRANSITO', 'TR'),
(3, 'REPARACION', 'RE'),
(4, 'COMODATO', 'CO'),
(5, 'CURSO', 'C'),
(6, 'INACTIVO', 'IN'),
(7, 'SOLICITADO', 'S'),
(8, 'TAREA REALIZADA', 'RE'),
(9, 'TERMINADO PARCIAL', 'TE'),
(10, 'TERMINADO', 'T'),
(11, 'ENTREGADO', 'E'),
(12, 'PEDIDO', 'P'),
(13, 'ASIGNADO', 'As'),
(14, 'ANULADO', 'AN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estanteria`
--

CREATE TABLE IF NOT EXISTS `tbl_estanteria` (
  `id_estanteria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fila` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_estanteria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `tbl_estanteria`
--

INSERT INTO `tbl_estanteria` (`id_estanteria`, `descripcion`, `fila`, `codigo`, `id_empresa`) VALUES
(1, 'estanteria 1', '1', 'dd1', 6),
(2, 'estanteria 2', '1', 'dd2', 6),
(3, 'estanteria 3', '1', 'dd3', 6),
(4, 'estanteria 4', '1', 'dd4', 6),
(5, 'estanteria 5', '1', 'd5', 6),
(6, 'Estantería de prueba 01', '12', 'ESTANTERIA TEST 01', 6),
(7, '', '6', 'E1 ', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_listarea`
--

CREATE TABLE IF NOT EXISTS `tbl_listarea` (
  `id_listarea` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden` int(11) NOT NULL,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_listarea`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=114 ;

--
-- Volcado de datos para la tabla `tbl_listarea`
--

INSERT INTO `tbl_listarea` (`id_listarea`, `id_orden`, `tareadescrip`, `id_usuario`, `fecha`, `estado`) VALUES
(1, 1, 'tarea 12', NULL, NULL, 'IN'),
(2, 1, 'tarea1212', NULL, NULL, 'C'),
(3, 1, 'tarea130', NULL, NULL, 'IN'),
(4, 1, 'tareanueva1', NULL, NULL, 'C'),
(5, 1, 'tarea gemma1', NULL, NULL, '1'),
(6, 1, 'TAREA2', NULL, NULL, '6'),
(7, 1, 'TAREA 25', NULL, NULL, '6'),
(8, 1, 'nombre de tarea 1 ', NULL, NULL, '5'),
(9, 1, 'nuevatrea30', NULL, NULL, '5'),
(10, 1, 'tarea de gemma', NULL, NULL, '5'),
(11, 1, 'nueva tarea 34 ', NULL, NULL, '5'),
(12, 1, 'nueva tarea 50', 3, NULL, '5'),
(13, 0, 'nueva tares 45 45', NULL, NULL, '5'),
(14, 1, 'nueva tarea12', 1, NULL, '6'),
(15, 1, 'gemmma belen tarea', 3, NULL, '5'),
(16, 1, 'nueva tare ', NULL, NULL, '5'),
(17, 1, 'nueva tarea ', NULL, NULL, '5'),
(18, 1, 'TAREA 10 ', NULL, NULL, '5'),
(19, 1, 'hhu', NULL, NULL, '5'),
(20, 1, 'hyhy12', NULL, NULL, '5'),
(21, 1, 'dedede', NULL, NULL, '5'),
(22, 1, 'genemmma ', NULL, NULL, '6'),
(23, 1, 'gemma', NULL, NULL, '6'),
(24, 1, 'fefefef', NULL, NULL, '5'),
(25, 1, 'fefeenueva ', NULL, NULL, '6'),
(26, 1, 'gemama', NULL, NULL, '5'),
(27, 1, 'geegegegegeg', NULL, NULL, '5'),
(28, 1, 'nueva traea gemma', NULL, NULL, '6'),
(29, 1, 'gemma ingresi ntarea', NULL, NULL, '6'),
(30, 1, 'hola ', NULL, NULL, '6'),
(31, 1, 'vuev tarea maruicio', NULL, NULL, '5'),
(32, 1, 'tarea AHORA SI', 2, NULL, '5'),
(33, 1, 'TAREA SI12', 1, NULL, '5'),
(34, 1, 'TAREA 100', 2, NULL, '5'),
(35, 8, 'sASA', NULL, NULL, 'C'),
(36, 8, 'asSa', NULL, NULL, 'C'),
(37, 8, 'ASA', NULL, NULL, 'C'),
(38, 22, 'desarme', NULL, NULL, 'C'),
(39, 22, 'limpieza ', NULL, NULL, 'C'),
(40, 22, 'armado', 1, NULL, 'C'),
(41, 22, 'limpieza', 2, NULL, 'C'),
(42, 22, 'desarme', 3, NULL, 'C'),
(43, 16, 'DDFDS', NULL, NULL, 'C'),
(44, 16, 'SDFSF', 3, '2017-12-11', 'C'),
(45, 16, 'nueva tarea: Limpieza ', 1, '2017-12-11', 'RE'),
(46, 17, 'jadfñjdskjfd', NULL, NULL, 'C'),
(47, 16, 'saadsa', 6, '2017-12-13', 'C'),
(48, 16, 'sadadasd', NULL, NULL, 'C'),
(49, 16, 'sdadasdsa', 3, NULL, 'C'),
(50, 16, '1111', NULL, NULL, 'C'),
(51, 16, '2222', 3, NULL, 'C'),
(52, 16, 'dedede', 1, NULL, 'RE'),
(53, 16, 'gegeg', 1, NULL, 'RE'),
(54, 21, 'tarea 1', 1, NULL, 'C'),
(55, 21, 'tarea2', 3, NULL, 'C'),
(56, 21, 'tarea3', NULL, NULL, 'C'),
(57, 21, 'tarea4', NULL, NULL, 'C'),
(58, 21, 'tarea6', 1, NULL, 'RE'),
(59, 37, 'dsadadad', 1, '2017-12-20', 'C'),
(60, 34, 'fsdfsfsd', 1, '2017-12-29', 'C'),
(61, 34, 'qwewqeqw', 1, '2017-12-29', 'C'),
(62, 47, 'sdadsad', NULL, NULL, 'C'),
(63, 47, 'sadad', NULL, NULL, 'C'),
(64, 47, 'dasdd', NULL, NULL, 'RE'),
(65, 47, 'dthdhgd', NULL, NULL, 'RE'),
(66, 73, 'dffgrrb', NULL, NULL, 'C'),
(67, 73, 'geegtgt', 5, NULL, 'C'),
(68, 73, 'evefvev', 1, NULL, 'C'),
(69, 532, 'ssss', NULL, NULL, 'RE'),
(70, 532, 'subtarea 1', NULL, NULL, 'RE'),
(71, 532, 'subtarea 2', NULL, NULL, 'IN'),
(72, 532, 'bababbaa', NULL, NULL, 'C'),
(73, 220, 'tarea test', NULL, NULL, 'C'),
(74, 535, 'ttajalads', NULL, NULL, 'C'),
(75, 535, 'afasdfadsf', NULL, '2018-06-22', 'C'),
(76, 535, 'tareaaaaa', 3, NULL, 'RE'),
(77, 535, 'tarea 3', 2, NULL, 'C'),
(78, 535, 'tareaaaa 4', NULL, '2018-06-23', 'C'),
(79, 536, 'tarea 1', NULL, '2018-06-23', 'RE'),
(80, 536, 'tarea 2', 3, '2018-06-29', 'C'),
(81, 536, 'aaaa', 2, '2018-06-23', 'C'),
(82, 538, 'tarea 1 asociada a OT id 538', NULL, NULL, 'C'),
(83, 539, 'tarea asociada a la OT 539', 3, NULL, 'C'),
(84, 539, 'tarea 2 asociada a la OT 539', 3, NULL, 'C'),
(85, 539, 'tarea 3 ot 539', NULL, NULL, 'C'),
(86, 540, 'hhhhhh', NULL, NULL, 'C'),
(87, 541, 'tarea ot 540', 2, '2018-06-30', 'C'),
(88, 158, 'kkkkk', 2, '2018-08-30', 'RE'),
(89, 23, 'Tarea 1', NULL, NULL, 'IN'),
(90, 23, 'Tarea 2', NULL, NULL, 'RE'),
(91, 23, 'Tarea3', 1, '0000-00-00', 'C'),
(92, 510, 'Tarea3', NULL, NULL, 'IN'),
(93, 510, 'Tarea de Prueba', NULL, NULL, 'IN'),
(94, 510, 'nueva tarea', 1, '2018-11-10', 'RE'),
(95, 510, 'fer', NULL, NULL, 'IN'),
(96, 510, 'tarea 03', 1, '2018-10-04', 'RE'),
(97, 563, 'tarea 03b', NULL, NULL, 'C'),
(98, 568, 'tarea de test', NULL, NULL, 'C'),
(99, 510, 'tarea test', 1, '2018-10-05', 'IN'),
(100, 510, 'asdasdasd', NULL, NULL, 'IN'),
(101, 576, 'rgreghfgjfhgjhjkhjk', NULL, NULL, 'C'),
(102, 576, 'asdasdasd', NULL, NULL, 'C'),
(103, 576, 'rgreghfgjfhgjhjkhjk', NULL, NULL, 'C'),
(104, 545, 'Tarea3', NULL, NULL, 'C'),
(105, 510, 'nueva tarea fer', NULL, NULL, 'IN'),
(106, 510, 'nuevaaaaa', NULL, NULL, 'IN'),
(107, 510, 'holis', NULL, NULL, 'IN'),
(108, 510, 'tarea 11222', NULL, NULL, 'IN'),
(109, 510, 'Tarea 999', -1, '0000-00-00', 'IN'),
(110, 510, 'tarea 8888', NULL, NULL, 'RE'),
(111, 510, 'holis fer', 1, NULL, 'IN'),
(112, 510, 'estas ahi???', NULL, '0000-00-00', 'IN'),
(113, 549, 'Cambio de vidrio lateral de cabina ', NULL, NULL, 'RE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_lote`
--

CREATE TABLE IF NOT EXISTS `tbl_lote` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tbl_lote`
--

INSERT INTO `tbl_lote` (`loteid`, `codigo`, `fecha`, `cantidad`, `artId`, `lotestado`, `depositoid`, `usrId`, `id_empresa`) VALUES
(1, 'cod-0001', '2018-10-06', '72', 2, 'AC', 1, NULL, 6),
(2, 'cod-002', '2018-10-01', '114', 10, 'AC', 1, NULL, 6),
(3, 'Cod-0003', '2018-10-01', '98', 11, 'AC', 2, NULL, 6),
(4, NULL, '2018-10-17', '30', 41, 'AC', 1, NULL, 7),
(5, NULL, '2018-10-22', '2', 252, 'AC', 6, NULL, 7),
(6, NULL, '2018-10-25', '10', 2, 'AC', 2, NULL, 6),
(7, NULL, '2018-10-25', '58', 10, 'AC', 2, NULL, 6),
(8, '50712', '2018-10-27', '100', 42, 'AC', 1, NULL, 6),
(9, '1111', '2018-10-27', '2', 253, 'AC', 4, NULL, 7),
(10, '58080', '2018-10-29', '10', 36, 'AC', 1, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notapedido`
--

CREATE TABLE IF NOT EXISTS `tbl_notapedido` (
  `id_notaPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_ordTrabajo` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_notaPedido`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=72 ;

--
-- Volcado de datos para la tabla `tbl_notapedido`
--

INSERT INTO `tbl_notapedido` (`id_notaPedido`, `fecha`, `id_ordTrabajo`, `id_empresa`) VALUES
(57, '2017-11-14', 1, 6),
(58, '2017-11-21', 2, 6),
(59, '2017-11-30', 1, 6),
(60, '2018-01-30', 1, 6),
(61, '2018-06-27', 25, NULL),
(62, '2018-06-27', 25, 6),
(63, '2018-06-29', 541, 6),
(64, '2018-07-22', 1, 6),
(65, '2018-10-30', 510, 6),
(66, '2018-10-30', 510, 6),
(67, '2018-10-30', 510, 6),
(68, '2018-10-30', 510, 6),
(69, '2018-10-30', 510, 6),
(70, '2018-10-30', 510, 6),
(71, '2018-10-30', 600, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_preventivoherramientas`
--

CREATE TABLE IF NOT EXISTS `tbl_preventivoherramientas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prevId` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prevId` (`prevId`),
  KEY `tbl_preventivoherramientas_ibfk_2` (`herrId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Volcado de datos para la tabla `tbl_preventivoherramientas`
--

INSERT INTO `tbl_preventivoherramientas` (`id`, `prevId`, `herrId`, `cantidad`, `id_empresa`) VALUES
(1, 22, 20, 1, 6),
(2, 23, 1, 2, 0),
(3, 23, 2, 20, 0),
(4, 24, 1, 2, 0),
(5, 26, 1, 4, 6),
(6, 26, 2, 5, 6),
(7, 26, 4, 1, 6),
(11, 1, 1, 11, 6),
(12, 1, 4, 22, 6),
(13, 1, 5, 33, 6),
(14, 1, 2, 44, 6),
(15, 1, 1, 1, 6),
(16, 1, 2, 2, 6),
(17, 1, 5, 3, 6),
(18, 1, 1, 1, 6),
(19, 1, 2, 2, 6),
(20, 1, 5, 3, 6),
(21, 1, 1, 1, 6),
(22, 1, 2, 2, 6),
(23, 1, 5, 3, 6),
(24, 1, 4, 2, 6),
(25, 1, 4, 2, 6),
(26, 41, 1, 11, 6),
(27, 41, 2, 22, 6),
(28, 42, 4, 2, 6),
(29, 55, 1, 1111, 6),
(30, 55, 2, 222, 6),
(31, 42, 1, 3, 3),
(32, NULL, 1, 0, 6),
(33, NULL, 2, 0, 6),
(34, NULL, 4, 0, 6),
(35, NULL, 2, 0, 6),
(36, NULL, 1, 0, 6),
(37, NULL, 5, 0, 6),
(38, NULL, 1, 45, 6),
(39, NULL, 2, 33, 6),
(40, NULL, 5, 22, 6),
(62, 43, 4, 333, 6),
(63, 43, 1, 55, 6),
(67, 56, 2, 1, 6),
(68, 56, 4, 2, 6),
(79, 47, 1, 15, 6),
(80, 128, 4, 1, 6),
(81, 129, 93, 1, 7),
(82, 134, 4, 22, 6),
(83, 135, 4, 22, 6),
(87, 136, 2, 2222, 6),
(90, 141, 2, 34, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_preventivoinsumos`
--

CREATE TABLE IF NOT EXISTS `tbl_preventivoinsumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prevId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prevId` (`prevId`),
  KEY `artId` (`artId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Volcado de datos para la tabla `tbl_preventivoinsumos`
--

INSERT INTO `tbl_preventivoinsumos` (`id`, `prevId`, `artId`, `cantidad`, `id_empresa`) VALUES
(1, 22, 3, 45, 6),
(2, 23, 1, 15, 6),
(3, 23, 2, 20, 6),
(4, 24, 3, 20, 6),
(5, 26, 1, 5, 6),
(6, 26, 2, 15, 6),
(7, 26, 3, 45, 6),
(8, 27, 1, 11, 6),
(9, 27, 2, 22, 6),
(10, 1, 1, 1, 6),
(11, 1, 2, 2, 6),
(12, 1, 3, 3, 6),
(13, 55, 1, 111, 6),
(14, 55, 2, 222, 6),
(15, 42, 1, 20, 6),
(16, 42, 3, 15, 6),
(17, 42, 4, 35, 6),
(29, 43, 1, 11, 6),
(30, 43, 3, 45, 6),
(33, 56, 1, 2, 6),
(56, 47, 1, 25, 6),
(57, 128, 21, 1, 6),
(58, 134, 2, 22, 6),
(59, 135, 2, 22, 6),
(63, 136, 173, 22, 6),
(65, 141, 2, 50, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipoordentrabajo`
--

CREATE TABLE IF NOT EXISTS `tbl_tipoordentrabajo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_orden` int(11) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tbl_tipoordentrabajo`
--

INSERT INTO `tbl_tipoordentrabajo` (`id`, `tipo_orden`, `descripcion`, `color`) VALUES
(1, 1, 'Orden de Trabajo', ''),
(2, 2, 'Solicitud de servicio', ''),
(3, 3, 'Preventivo', ''),
(4, 4, 'Backlog', ''),
(5, 5, 'Predictivo', ''),
(6, 6, 'Correctivo Programado', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_trazacomponente`
--

CREATE TABLE IF NOT EXISTS `tbl_trazacomponente` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tbl_trazacomponente`
--

INSERT INTO `tbl_trazacomponente` (`id_trazacomponente`, `idcomponenteequipo`, `id_estanteria`, `fila`, `fecha`, `fecha_Entrega`, `ult_recibe`, `estado`, `observaciones`, `usrId`, `id_empresa`) VALUES
(1, 71, 1, 2, '2017-10-05 07:29:05', '2017-10-05 07:31:25', 'Balderramo', 'E', 'se lleva balderrama para reparar bomba inyectora', 5, 6),
(2, 72, 2, 3, '2017-10-05 07:29:05', '2017-10-05 07:29:05', 'Sr Perez', 'REC', 'recibo radiador para reparar', 5, 6),
(3, 3, 1, 1, '2017-12-02 07:12:21', '2017-12-02 07:12:21', 'pedro perez', 'C', 'sadadsa', 1, 6),
(4, 3, 1, 1, '2017-12-02 07:12:53', '2017-12-02 07:12:53', 'motores balderramo', 'C', 'dasdasd', 1, 6),
(5, 0, 6, 6, '2018-07-03 00:39:20', '2018-07-03 00:39:20', 'qwerty', 'C', 'qwerty', 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_unidadmedida`
--

CREATE TABLE IF NOT EXISTS `tbl_unidadmedida` (
  `id_unidadmedida` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_unidadmedida`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tbl_unidadmedida`
--

INSERT INTO `tbl_unidadmedida` (`id_unidadmedida`, `descripcion`, `estado`, `id_empresa`) VALUES
(1, 'Unidad', 'AC', 7),
(2, 'Litro', 'AC', 7),
(3, 'Metro', 'AC', 7),
(4, 'Kg', 'AC', 7),
(5, 'm2', 'AC', 7),
(6, 'm3', 'AC', 7),
(7, 'unidad', 'AN', 6),
(8, 'unidad nueva!!!!!!', 'AN', 6),
(9, 'Litro ', 'AN', 6),
(10, 'metro', 'AN', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_valedesacarga`
--

CREATE TABLE IF NOT EXISTS `tbl_valedesacarga` (
  `valedid` int(11) NOT NULL AUTO_INCREMENT,
  `valedfecha` datetime DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`valedid`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tbl_valedesacarga`
--

INSERT INTO `tbl_valedesacarga` (`valedid`, `valedfecha`, `usrId`, `respons`, `dest`, `id_empresa`) VALUES
(1, '2018-07-02 00:00:00', 1, 'Hugo G', 'Destino 01 prueba', 6),
(2, '2018-10-08 00:00:00', 18, 'Rodriguez Guillermo ', 'mina chinchillas ', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_valesalida`
--

CREATE TABLE IF NOT EXISTS `tbl_valesalida` (
  `valesid` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `usrId` int(10) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`valesid`),
  KEY `repid` (`usrId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `tbl_valesalida`
--

INSERT INTO `tbl_valesalida` (`valesid`, `fecha`, `usrId`, `respons`, `dest`, `id_empresa`) VALUES
(1, '2017-11-14', NULL, 'Roberto Pérez', 'Obra 1', 6),
(2, '2017-11-14', NULL, 'Francisco Rodriguez', 'Obra 2', 6),
(4, '2017-11-14', 5, NULL, NULL, 6),
(5, '2018-07-02', 1, 'hugo G', 'destino 01 prueba', 6),
(6, '2018-09-19', 1, NULL, NULL, 0),
(10, '2018-10-08', 18, 'Rodriguez Guillermo ', 'mina chinchillas ', 7),
(11, '2018-10-21', 1, NULL, NULL, 6),
(12, '2018-10-21', 1, NULL, NULL, 6),
(13, '2018-10-21', 1, NULL, NULL, 6),
(14, '2018-10-21', 1, NULL, NULL, 6),
(15, '2018-10-21', 1, NULL, NULL, 6),
(16, '2018-10-23', 1, NULL, NULL, 6),
(17, '2018-10-23', 1, NULL, NULL, 6),
(18, '2018-10-24', 1, NULL, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocuenta`
--

CREATE TABLE IF NOT EXISTS `tipocuenta` (
  `tipocuentaid` int(11) NOT NULL AUTO_INCREMENT,
  `tipocuentadescrip` varchar(255) DEFAULT NULL,
  `tipocuentamonto` varchar(50) DEFAULT NULL,
  `tipocuentausuarios` varchar(50) DEFAULT NULL,
  `tipocuentaactivos` varchar(50) DEFAULT NULL,
  `tipocuentaempresas` varchar(50) DEFAULT NULL,
  `apps` varchar(2) DEFAULT NULL,
  `modulo_alerta` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`tipocuentaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipocuenta`
--

INSERT INTO `tipocuenta` (`tipocuentaid`, `tipocuentadescrip`, `tipocuentamonto`, `tipocuentausuarios`, `tipocuentaactivos`, `tipocuentaempresas`, `apps`, `modulo_alerta`) VALUES
(1, 'GO', '0', '10', '100', '1', 'NO', 'NO'),
(2, 'PRO', '100', '50', '1000', '3', 'SI', 'SI'),
(3, 'CORPORATE', '300', 'ILIMITADO', 'ILIMITADO', 'ILIMITADO', 'SI', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_industrial`
--

CREATE TABLE IF NOT EXISTS `unidad_industrial` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `unidad_industrial`
--

INSERT INTO `unidad_industrial` (`id_unidad`, `descripcion`, `id_empresa`) VALUES
(1, 'veladero', 6),
(2, 'nueva unidad insdutrial 2', 6),
(3, 'MINA CHINCHILLAS', 7),
(4, 'La Laja', 2),
(5, 'unidad agregada 1', 6),
(6, 'unidad agregada 2', 6),
(7, 'unidad agregada 3', 6),
(8, 'unidad agregada 4', 6),
(9, 'unidad agregada 5', 6),
(10, 'unidadagregada 6', 6),
(11, 'La laja', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_tiempo`
--

CREATE TABLE IF NOT EXISTS `unidad_tiempo` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `unidaddescrip` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `unidad_tiempo`
--

INSERT INTO `unidad_tiempo` (`id_unidad`, `unidaddescrip`) VALUES
(1, 'minutos'),
(2, 'horas'),
(3, 'dias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioasempresa`
--

CREATE TABLE IF NOT EXISTS `usuarioasempresa` (
  `empresaid` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` tinyint(1) NOT NULL,
  `grpId` int(11) NOT NULL,
  PRIMARY KEY (`empresaid`,`usrId`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarioasempresa`
--

INSERT INTO `usuarioasempresa` (`empresaid`, `usrId`, `fecha`, `tipo`, `grpId`) VALUES
(6, 1, NULL, 1, 0),
(6, 17, '2018-09-18 00:00:00', 1, 0),
(7, 16, '2018-09-17 00:00:00', 1, 0),
(7, 18, '2018-09-21 00:00:00', 1, 7),
(7, 19, '2018-09-12 00:00:00', 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_detanotapedido`
--
ALTER TABLE `tbl_detanotapedido`
  ADD CONSTRAINT `tbl_detanotapedido_ibfk_1` FOREIGN KEY (`id_notaPedido`) REFERENCES `tbl_notapedido` (`id_notaPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
