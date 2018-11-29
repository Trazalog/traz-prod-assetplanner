-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-11-2018 a las 13:54:26
-- Versión del servidor: 5.6.23
-- Versión de PHP: 5.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `planner_assetcloud1`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `abmdeposito`
--

INSERT INTO `abmdeposito` (`depositoId`, `depositodescrip`, `direccion`, `id_provincial`, `id_localidad`, `id_pais`, `GPS`, `estado`, `id_empresa`) VALUES
(1, 'deposito 1', 'I. de la Rosa 2345 Rivadavia', NULL, NULL, NULL, NULL, 'AC', 6),
(2, 'Depósito EPP', 'Av. Libertador San Martín 2450 oeste', NULL, NULL, NULL, NULL, 'AC', 6),
(4, 'Conteiner Mina Chinchillas', 'MINA Chinchillas', NULL, NULL, NULL, NULL, 'AC', 7),
(5, 'Sucursal Gral. Guemes', 'Tte. Ibañes 42 Gral Guemes Salta', NULL, NULL, NULL, NULL, 'AC', 7),
(6, 'Taller Central ', 'San Juan', NULL, NULL, NULL, NULL, 'AC', 7),
(7, 'EPP', 'Mina chinchillas ', NULL, NULL, NULL, NULL, 'AC', 7),
(8, 'Deposito 3', 'san lorenzo 1442 este, santa lucia', NULL, NULL, NULL, NULL, 'AC', 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `abmproveedores`
--

INSERT INTO `abmproveedores` (`provid`, `provnombre`, `provcuit`, `provdomicilio`, `provtelefono`, `provmail`, `provestado`, `estado`, `id_empresa`) VALUES
(1, 'Juan Perez', '2023339814', 'dsadasdasd', '2645677', 'permauricio@gmail.com', '8', 'AC', 6),
(2, 'Trazalog', '20-54545454-9', 'Lib. Gral S Martin 1890', '15555555', 'soporte@trazalog.com', '8', 'AC', 6),
(3, 'Proveedor test', '20-20202022-7', 'Calle proveedor', '1777777777', 'info@proveedor.com', '8', 'AC', 7),
(5, 'Leonardo Pantano Tornero', 'xxxxxx', 'San Juan', '2645053221', 'leonardo.pantano@gmail.com', '8', 'AC', 7),
(6, 'MRS Service ', 'a', 'a', 'a', 'm.rodriguez@mrsservice.com.ar ', NULL, 'AC', 7),
(7, 'conteiner mina chinchillas', '44', '44', '44', '44', NULL, 'AC', 7);

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
  UNIQUE KEY `artBarCode` (`artBarCode`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=308 ;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`artId`, `artBarCode`, `artDescription`, `artCoste`, `artMargin`, `artIsByBox`, `artCantBox`, `artMarginIsPorcent`, `artEstado`, `famId`, `unidadmedida`, `punto_pedido`, `id_empresa`) VALUES
(2, '51574', 'FILTRO DE COMBUSTIBLE P/TAMROCK N°88', 0.00, 0.00, 1, 0, b'0', 'AC', 3, 1, 0, 6),
(10, '123456', 'BUJE DE ROTACION P/TAMROCK 680', 0.00, 0.00, 0, 6, b'0', 'AN', 9, 2, 0, 6),
(11, '50686', 'BULON NRO. 86321729 P/TAMROCK HL 500', 0.00, 0.00, 1, 1, b'0', 'AC', 1, 7, 0, 6),
(12, '51258', 'DIAFRAGMA N:04114808 P/TAMROCK', 0.00, 0.00, 1, 3, b'0', 'AC', 4, 1, 0, 6),
(13, '51265', 'DIAFRAGMA P/COMP. TAMROCK HL 680-2 A', 0.00, 0.00, 1, 0, b'0', 'AC', 4, 1, 0, 6),
(14, '51315', 'EJE P/ TAMROCK N† 15178158', 0.00, 0.00, 1, 0, b'0', 'AC', 5, 0, 2, 6),
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
(41, '50465', 'BULON ART. NRO. 6729510 P/ BOB CATERPILLAR', 0.00, 0.00, 0, 0, b'0', 'AC', 1, 0, 5, 6),
(42, '50712', 'BULON   P/ CAT- 966 DIENTE DE CARGAD', 0.00, 0.00, 1, 22, b'0', 'AC', 1, 7, 5, 6),
(43, '50714', 'BULON  8T -6466 P/AIRE ACONDI CAT -', 0.00, 0.00, 1, 0, b'0', 'AC', 1, 7, 5, 6),
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
(97, '50684', 'BULON NRO. 16202091-12050 P/ KOMATSU', 0.00, 0.00, 1, 22, b'0', 'AC', 1, 0, 5, 6),
(98, '50685', 'BULON NRO. 419-70-13150 P/KOMATSU 25', 0.00, 0.00, 1, 12, b'0', 'AC', 1, 0, 5, 6),
(99, '50689', 'BULON P/KOMATSU 470 N 2 ART. 09208-1', 0.00, 0.00, 1, 0, b'0', 'AC', 1, -1, 0, 6),
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
(249, '57653456', 'bulon de escalera ', 0.00, 0.00, 1, 0, b'0', 'AC', 1, -1, 1, 7),
(250, '1R-1825 ', 'filtro ', 0.00, 0.00, 1, 2, b'0', 'AN', 3, 1, 4, 7),
(251, 'sdsad', 'sdsd', 0.00, 0.00, 1, 0, b'0', 'AN', 12, 1, 2, 7),
(252, '07', 'Mamelucos descartables ', 0.00, 0.00, 1, 23, b'0', 'AC', 0, 1, 10, 7),
(254, 'TVK ', 'Guantes ', 0.00, 0.00, 1, 22, b'0', 'AN', 1, 1, 12, 7),
(256, 'TVK 01', 'Mameluco Descartable Nobus ', 0.00, 0.00, 1, 25, b'0', 'AN', 37, 1, 10, 7),
(257, 'TVK 02 ', '3M', 0.00, 0.00, 1, 3, b'0', 'AN', 37, 1, 1, 7),
(258, 'TVK 03', 'Dupont ', 0.00, 0.00, 1, 2, b'0', 'IN', 37, 1, 1, 7),
(265, '1626105281// 1604707982', 'Valvulas', 0.00, 0.00, 1, 2, b'0', 'AN', 6, 1, 2, 7),
(266, '3128082907', 'Mordazas', 0.00, 0.00, 1, 2, b'0', 'AN', 54, 1, 2, 7),
(267, '3222327788', 'Sensor de Nivel', 0.00, 0.00, 1, 1, b'0', 'AC', 55, -1, 1, 7),
(271, '265326447', 'Sensor de proximidad ', 0.00, 0.00, 1, 1, b'0', 'AN', 56, 1, 2, 7),
(272, '165788', 'Sensor IFM ', 0.00, 0.00, 1, 2, b'0', 'AN', 57, 1, 2, 7),
(273, '333', 'dsdasdad', 0.00, 0.00, 0, 0, b'0', 'AC', 1, 7, 4, 6),
(274, 'P164699', 'Filtro Hidraulico 52263183', 0.00, 0.00, 1, 3, b'0', 'AC', 58, 1, 1, 7),
(275, '57516098', 'filtro cabina SC90271', 0.00, 0.00, 1, 6, b'0', 'AC', 58, 1, 1, 7),
(276, 'P182042', 'Filtro aire Motor 52252061', 0.00, 0.00, 1, 8, b'0', 'AC', 58, 1, 2, 7),
(280, 'P128408', 'filtro aire motor 52146966', 0.00, 0.00, 1, 8, b'0', 'AC', 58, 1, 2, 7),
(282, 'P551808', 'Filtro aceite motor  1R1808', 0.00, 0.00, 1, 8, b'0', 'AC', 58, 1, 2, 7),
(285, '222', 'Filtro aire', 0.00, 0.00, 0, 0, b'0', 'AN', 1, 1, 0, 7),
(286, 'P551311', 'Filtro combustible 1R0749', 0.00, 0.00, 1, 8, b'0', 'AC', 58, 1, 2, 7),
(287, 'P564425', 'Filtro respiradero 50903236', 0.00, 0.00, 1, 6, b'0', 'AC', 58, 1, 1, 7),
(288, 'P165672', 'Filtro Hidráulico 36860336', 0.00, 0.00, 1, 2, b'0', 'AC', 58, 1, 1, 7),
(289, 'P181054', 'Filtro aire cabina superior 59860841', 0.00, 0.00, 1, 6, b'0', 'AC', 58, 1, 1, 7),
(290, 'P520620', 'Filtro aire 56958945', 0.00, 0.00, 1, 2, b'0', 'AC', 58, 1, 1, 7),
(291, 'P552055', 'Filtro Refrigerante  56985971', 0.00, 0.00, 1, 6, b'0', 'AC', 58, 1, 2, 7),
(292, 'SC 90270', 'Filtro cabina 57516106', 0.00, 0.00, 1, 6, b'0', 'AC', 58, 1, 1, 7),
(293, 'P550900', 'Filtro trampa 3261643', 0.00, 0.00, 1, 6, b'0', 'AC', 58, 1, 2, 7),
(294, '57569758', 'Filtro separador', 0.00, 0.00, 1, 2, b'0', 'AC', 58, 1, 1, 7),
(295, 'P566278', 'Filtro hidraulico 57336406', 0.00, 0.00, 1, 2, b'0', 'AC', 58, 1, 1, 7),
(296, '57451890', 'Compresor Aire Acondicionado', 0.00, 0.00, 1, 1, b'0', 'AC', 59, 1, 1, 7),
(297, '88257429', 'Compresor Aire Acondicionado. DP 1500', 0.00, 0.00, 1, 1, b'0', 'AC', 59, 1, 1, 7),
(298, '57364366', 'Filtro secador A/A', 0.00, 0.00, 1, 1, b'0', 'AC', 59, 1, 1, 7),
(299, '3128 0829 07', 'Mordazas mesa de quiebre ', 0.00, 0.00, 1, 4, b'0', 'AC', 54, 1, 2, 7),
(300, '3222 3113 62', 'Espaciador ', 0.00, 0.00, 1, 2, b'0', 'AC', 54, 1, 2, 7),
(301, ' 0211 1963 16', 'Bulon  M12 ', 0.00, 0.00, 1, 8, b'0', 'AC', 1, 1, 4, 7),
(302, '0211 1960 85', 'Bulon M12 ', 0.00, 0.00, 1, 4, b'0', 'AC', 1, 1, 2, 7),
(303, '1626 1052 81', 'Valvulas ', 0.00, 0.00, 1, 2, b'0', 'AC', 6, 1, 1, 7),
(304, '3222 3277 88', 'Sensor de nivel ', 0.00, 0.00, 1, 1, b'0', 'AC', 55, 1, 1, 7),
(305, '3222 3208 86 ', 'Sensor de proximidad ', 0.00, 0.00, 1, 1, b'0', 'AC', 56, 1, 1, 7),
(306, '2653 1264 47', 'Sensor de proximidad ', 0.00, 0.00, 1, 1, b'0', 'AC', 56, 1, 1, 7),
(307, '3222 1488 00', 'Sensor de proximidad ', 0.00, 0.00, 1, 2, b'0', 'AC', 56, 1, 1, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `asignausuario`
--

INSERT INTO `asignausuario` (`id`, `usrId`, `id_orden`, `fechahora`) VALUES
(1, 16, 4, '2018-09-19 11:50:17'),
(2, 17, 4, '2018-09-19 11:50:17'),
(3, 17, 14, '2018-10-22 08:09:35'),
(4, 17, 15, '2018-10-23 19:20:38'),
(5, 1, 16, '2018-10-23 19:25:41'),
(6, 16, 18, '2018-10-25 08:34:13'),
(7, 23, 20, '2018-10-29 12:36:38'),
(8, 23, 22, '2018-11-03 10:51:38'),
(9, 23, 27, '2018-11-03 14:33:56'),
(10, 23, 29, '2018-11-03 14:52:58'),
(11, 23, 30, '2018-11-03 14:56:43'),
(12, 23, 31, '2018-11-03 15:16:38'),
(13, 23, 32, '2018-11-03 15:27:05'),
(14, 23, 33, '2018-11-03 15:41:07'),
(15, 23, 34, '2018-11-03 15:46:09'),
(16, 23, 35, '2018-11-03 15:49:25'),
(17, 23, 36, '2018-11-03 15:54:02'),
(18, 23, 38, '2018-11-03 16:08:49'),
(19, 23, 39, '2018-11-03 17:46:19'),
(20, 23, 40, '2018-11-03 17:47:58'),
(21, 23, 41, '2018-11-03 17:50:57'),
(22, 23, 42, '2018-11-04 16:44:59'),
(23, 23, 43, '2018-11-04 17:16:04'),
(24, 23, 44, '2018-11-04 17:18:59'),
(25, 23, 45, '2018-11-04 17:21:37'),
(26, 23, 46, '2018-11-04 17:26:42'),
(27, 18, 46, '2018-11-04 17:26:42');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=345 ;

--
-- Volcado de datos para la tabla `componenteequipo`
--

INSERT INTO `componenteequipo` (`idcomponenteequipo`, `id_equipo`, `id_componente`, `observacion`, `codigo`, `estado`, `id_empresa`, `sistemaid`) VALUES
(1, 1, 1, NULL, NULL, 'AN', 6, 1),
(2, 1, 3, NULL, '12345', 'AC', 6, 1),
(3, 1, 5, NULL, '123', 'AC', 6, 1),
(4, 1, 1, NULL, '123', 'AC', 6, 2),
(5, 1, 5, NULL, 'radiador emper0001', 'AC', 6, 2),
(6, 2, 6, NULL, NULL, 'AC', 6, 2),
(7, 2, 7, NULL, NULL, 'AC', 6, 2),
(8, 2, 8, NULL, NULL, 'AC', 6, 2),
(9, 2, 9, NULL, NULL, 'AC', 6, 1),
(10, 2, 10, NULL, NULL, 'AC', 6, 2),
(11, 3, 11, NULL, NULL, 'AC', 6, 1),
(12, 3, 12, NULL, NULL, 'AC', 6, 1),
(13, 3, 13, NULL, NULL, 'AC', 6, 1),
(14, 3, 14, NULL, NULL, 'AC', 6, 0),
(15, 3, 15, NULL, NULL, 'AC', 6, 0),
(16, 4, 16, NULL, NULL, 'AC', 6, 0),
(17, 4, 17, NULL, NULL, 'AC', 6, 0),
(18, 4, 18, NULL, NULL, 'AC', 6, 0),
(19, 4, 19, NULL, NULL, 'AC', 6, 0),
(20, 4, 20, NULL, NULL, 'AC', 6, 0),
(21, 5, 21, NULL, NULL, 'AC', 6, 0),
(22, 5, 22, NULL, NULL, 'AC', 6, 0),
(23, 5, 23, NULL, NULL, 'AC', 6, 0),
(24, 5, 24, NULL, NULL, 'AC', 6, 0),
(25, 5, 25, NULL, NULL, 'AC', 6, 0),
(26, 1, 26, NULL, NULL, 'AC', 6, 0),
(27, 1, 27, NULL, NULL, 'AC', 6, 0),
(28, 1, 28, NULL, NULL, 'AC', 6, 0),
(29, 1, 29, NULL, NULL, 'AC', 6, 0),
(30, 1, 30, NULL, NULL, 'AC', 6, 0),
(31, 2, 31, NULL, NULL, 'AC', 6, 0),
(32, 2, 32, NULL, NULL, 'AC', 6, 0),
(33, 2, 33, NULL, NULL, 'AC', 6, 0),
(34, 2, 34, NULL, NULL, 'AC', 6, 0),
(35, 2, 35, NULL, NULL, 'AC', 6, 0),
(36, 2, 36, NULL, NULL, 'AC', 6, 0),
(37, 2, 37, NULL, NULL, 'AC', 6, 0),
(38, 2, 38, NULL, NULL, 'AC', 6, 0),
(39, 2, 39, NULL, NULL, 'AC', 6, 0),
(40, 2, 40, NULL, NULL, 'AC', 6, 0),
(41, 2, 41, NULL, NULL, 'AC', 6, 0),
(42, 2, 42, NULL, NULL, 'AC', 6, 0),
(43, 2, 43, NULL, NULL, 'AC', 6, 0),
(44, 2, 44, NULL, NULL, 'AC', 6, 0),
(45, 3, 46, NULL, NULL, 'AC', 6, 0),
(46, 3, 47, NULL, NULL, 'AC', 6, 0),
(47, 3, 48, NULL, NULL, 'AC', 6, 0),
(48, 3, 49, NULL, NULL, 'AC', 6, 0),
(49, 3, 50, NULL, NULL, 'AC', 6, 0),
(50, 3, 51, NULL, NULL, 'AC', 6, 0),
(51, 3, 52, NULL, NULL, 'AC', 6, 0),
(52, 3, 53, NULL, NULL, 'AC', 6, 0),
(53, 3, 54, NULL, NULL, 'AC', 6, 0),
(54, 3, 55, NULL, NULL, 'AC', 6, 0),
(55, 3, 56, NULL, NULL, 'AC', 6, 0),
(56, 3, 57, NULL, NULL, 'AC', 6, 0),
(57, 3, 58, NULL, NULL, 'AC', 6, 0),
(58, 3, 59, NULL, NULL, 'AC', 6, 0),
(59, 4, 61, NULL, NULL, 'AC', 6, 0),
(60, 4, 62, NULL, NULL, 'AC', 6, 0),
(61, 4, 63, NULL, NULL, 'AC', 6, 0),
(62, 4, 64, NULL, NULL, 'AC', 6, 0),
(63, 4, 65, NULL, NULL, 'AC', 6, 0),
(64, 4, 66, NULL, NULL, 'AC', 6, 0),
(65, 4, 67, NULL, NULL, 'AC', 6, 0),
(66, 4, 68, NULL, NULL, 'AC', 6, 0),
(67, 4, 69, NULL, NULL, 'AC', 6, 0),
(68, 4, 70, NULL, NULL, 'AC', 6, 0),
(69, 4, 71, NULL, NULL, 'AC', 6, 0),
(70, 4, 72, NULL, NULL, 'AC', 6, 0),
(71, 4, 73, NULL, NULL, 'AN', 6, 0),
(72, 1, 1, NULL, '455441', 'AN', 6, 0),
(73, 1, 19, NULL, '222222', 'AN', 6, 0),
(74, 11, 74, NULL, '44444444444', 'AN', 7, 0),
(75, 13, 76, NULL, 'xxxxx', 'AC', 7, 0),
(76, 14, 76, NULL, 'xxxx', 'AC', 7, 0),
(77, 13, 77, NULL, '', 'AC', 7, 0),
(78, 13, 80, NULL, '', 'AN', 7, 0),
(79, 13, 82, NULL, '', 'AN', 7, 0),
(80, 13, 83, NULL, '', 'AN', 7, 0),
(81, 13, 84, NULL, '', 'AN', 7, 0),
(82, 13, 85, NULL, '', 'AN', 7, 0),
(83, 13, 86, NULL, '', 'AN', 7, 0),
(84, 13, 87, NULL, '', 'AN', 7, 0),
(85, 13, 88, NULL, '', 'AN', 7, 0),
(86, 14, 80, NULL, '', 'AN', 7, 0),
(87, 14, 82, NULL, '', 'AN', 7, 0),
(88, 14, 83, NULL, '', 'AN', 7, 0),
(89, 14, 84, NULL, '', 'AN', 7, 0),
(90, 14, 85, NULL, '', 'AN', 7, 0),
(91, 14, 86, NULL, '', 'AN', 7, 0),
(92, 14, 88, NULL, '', 'AN', 7, 0),
(93, 13, 89, NULL, '', 'AN', 7, 0),
(94, 14, 89, NULL, '', 'AN', 7, 0),
(95, 13, 90, NULL, '', 'AC', 7, 0),
(96, 14, 90, NULL, '', 'AC', 7, 0),
(97, 13, 91, NULL, '', 'AN', 7, 0),
(98, 14, 91, NULL, '', 'AN', 7, 0),
(99, 13, 82, NULL, '1R-1808', 'AN', 7, 0),
(100, 13, 93, NULL, '56958945', 'AC', 7, 0),
(101, 14, 93, NULL, '56958945', 'AC', 7, 0),
(102, 16, 83, NULL, '1R-0749', 'AC', 7, 0),
(103, 16, 82, NULL, '1R-1808', 'AC', 7, 0),
(104, 13, 94, NULL, '59860841', 'AN', 7, 0),
(105, 14, 94, NULL, '59860841', 'AN', 7, 0),
(106, 13, 96, NULL, '57516106', 'AC', 7, 0),
(107, 14, 96, NULL, '57516106', 'AC', 7, 0),
(108, 13, 96, NULL, '57516098', 'AC', 7, 0),
(109, 14, 96, NULL, '57516098', 'AC', 7, 0),
(110, 16, 80, NULL, '3222 1881 6', 'AN', 7, 0),
(111, 16, 84, NULL, '1604 6944 9', 'AC', 7, 0),
(112, 13, 97, NULL, '57569758', 'AC', 7, 0),
(113, 14, 97, NULL, '57569758', 'AC', 7, 0),
(114, 13, 98, NULL, '57336406', 'AC', 7, 0),
(115, 14, 98, NULL, '57336406', 'AC', 7, 0),
(116, 13, 99, NULL, '52263183', 'AC', 7, 0),
(117, 14, 99, NULL, '52263183', 'AC', 7, 0),
(118, 13, 100, NULL, '36860336', 'AC', 7, 0),
(119, 14, 100, NULL, '36860336', 'AC', 7, 0),
(120, 16, 88, NULL, '3222 1180 0', 'AC', 7, 0),
(121, 16, 88, NULL, '3222 3187 2', 'AC', 7, 0),
(122, 16, 94, NULL, '3222 9861 4', 'AN', 7, 0),
(123, 16, 85, NULL, '3222 3253 7', 'AC', 7, 0),
(124, 16, 97, NULL, '2911 0117 0', 'AN', 7, 0),
(125, 13, 88, NULL, '50903236', 'AC', 7, 0),
(126, 14, 88, NULL, '50903236', 'AC', 7, 0),
(127, 13, 101, NULL, '56985971', 'AC', 7, 0),
(128, 14, 101, NULL, '56985971', 'AN', 7, 0),
(129, 13, 102, NULL, '326-1643', 'AC', 7, 0),
(130, 14, 101, NULL, '326-1643', 'AN', 7, 0),
(131, 16, 98, NULL, '8231 1018 0', 'AC', 7, 0),
(132, 16, 98, NULL, '3222 3098 4', 'AC', 7, 0),
(133, 14, 102, NULL, '326-1643', 'AC', 7, 0),
(134, 13, 83, NULL, '57294829', 'AN', 7, 0),
(135, 14, 83, NULL, '57294829', 'AC', 7, 0),
(136, 13, 109, NULL, '52146966', 'AC', 7, 0),
(137, 14, 109, NULL, '52146966', 'AC', 7, 0),
(138, 13, 113, NULL, '52252061', 'AC', 7, 0),
(139, 14, 113, NULL, '52252061', 'AC', 7, 0),
(140, 13, 114, NULL, '1R-1808', 'AC', 7, 0),
(141, 14, 114, NULL, '1R-1808', 'AC', 7, 0),
(142, 13, 115, NULL, '57368524', 'AC', 7, 0),
(143, 14, 115, NULL, '57368524', 'AC', 7, 0),
(144, 13, 116, NULL, '57651234', 'AN', 7, 0),
(145, 14, 116, NULL, '57651234', 'AN', 7, 0),
(146, 13, 116, NULL, '57572398', 'AN', 7, 0),
(147, 14, 116, NULL, '57572398', 'AN', 7, 0),
(148, 13, 116, NULL, '57572406', 'AN', 7, 0),
(149, 14, 116, NULL, '57572406', 'AN', 7, 0),
(150, 13, 117, NULL, '95200663', 'AC', 7, 0),
(151, 14, 117, NULL, '95200663', 'AC', 7, 0),
(152, 13, 119, NULL, '57572398', 'AC', 7, 0),
(153, 14, 119, NULL, '57572398', 'AC', 7, 0),
(154, 13, 119, NULL, '57572406', 'AC', 7, 0),
(155, 13, 120, NULL, '50597442', 'AC', 7, 0),
(156, 14, 120, NULL, '50597442', 'AC', 7, 0),
(157, 13, 121, NULL, '9523475', 'AC', 7, 0),
(158, 14, 121, NULL, '9523475', 'AC', 7, 0),
(159, 13, 122, NULL, '50595115', 'AC', 7, 0),
(160, 14, 122, NULL, '50595115', 'AC', 7, 0),
(161, 13, 123, NULL, '50597640', 'AC', 7, 0),
(162, 14, 123, NULL, '50597640', 'AC', 7, 0),
(163, 13, 124, NULL, '50597434', 'AC', 7, 0),
(164, 14, 124, NULL, '50597434', 'AC', 7, 0),
(165, 13, 124, NULL, '59595629', 'AC', 7, 0),
(166, 14, 124, NULL, '59595629', 'AC', 7, 0),
(167, 13, 124, NULL, '50717743', 'AC', 7, 0),
(168, 14, 124, NULL, '50717743', 'AC', 7, 0),
(169, 13, 125, NULL, '50717750', 'AC', 7, 0),
(170, 14, 125, NULL, '50717750', 'AC', 7, 0),
(171, 14, 126, NULL, '57651234', 'AC', 7, 0),
(172, 14, 126, NULL, '57651234', 'AC', 7, 0),
(173, 16, 111, NULL, '3222 3324 7', 'AC', 7, 0),
(174, 13, 127, NULL, '57326274', 'AC', 7, 0),
(175, 14, 127, NULL, '57326274', 'AC', 7, 0),
(176, 16, 112, NULL, '3222 3162 4', 'AN', 7, 0),
(177, 16, 103, NULL, '3222 3195 3', 'AN', 7, 0),
(178, 16, 104, NULL, '3222 3232 0', 'AN', 7, 0),
(179, 14, 128, NULL, '56262579', 'AC', 7, 0),
(180, 14, 128, NULL, '56262579', 'AC', 7, 0),
(181, 14, 102, NULL, '52154515', 'AC', 7, 0),
(182, 14, 129, NULL, '52154515', 'AC', 7, 0),
(183, 13, 130, NULL, '57307902', 'AC', 7, 0),
(184, 13, 130, NULL, '57307902', 'AC', 7, 0),
(185, 14, 131, NULL, '57484263', 'AC', 7, 0),
(186, 14, 131, NULL, '57484263', 'AC', 7, 0),
(187, 14, 132, NULL, '57389983', 'AC', 7, 0),
(188, 14, 132, NULL, '57389983', 'AC', 7, 0),
(189, 14, 133, NULL, '57106429', 'AC', 7, 0),
(190, 14, 133, NULL, '57106429', 'AC', 7, 0),
(191, 14, 134, NULL, ' 52235207', 'AC', 7, 0),
(192, 14, 134, NULL, ' 52235207', 'AC', 7, 0),
(193, 14, 135, NULL, '57572984', 'AC', 7, 0),
(194, 14, 135, NULL, '57572984', 'AC', 7, 0),
(195, 14, 136, NULL, '57477242', 'AC', 7, 0),
(196, 14, 136, NULL, '57477242', 'AC', 7, 0),
(197, 13, 137, NULL, '57415044', 'AC', 7, 0),
(198, 13, 137, NULL, '', 'AC', 7, 0),
(199, 14, 137, NULL, '57415044', 'AC', 7, 0),
(200, 14, 138, NULL, '57209637', 'AC', 7, 0),
(201, 13, 138, NULL, '57209637', 'AC', 7, 0),
(202, 14, 139, NULL, '57632366', 'AN', 7, 0),
(203, 14, 139, NULL, '57632366', 'AN', 7, 0),
(204, 13, 139, NULL, '57632366', 'AC', 7, 0),
(205, 14, 139, NULL, '57632366', 'AC', 7, 0),
(206, 14, 140, NULL, '57506446', 'AN', 7, 0),
(207, 14, 140, NULL, '57506446', 'AN', 7, 0),
(208, 13, 140, NULL, '57506446', 'AC', 7, 0),
(209, 14, 140, NULL, '57506446', 'AC', 7, 0),
(210, 14, 141, NULL, '57501116', 'AN', 7, 0),
(211, 14, 141, NULL, '57501116', 'AN', 7, 0),
(212, 13, 141, NULL, '57501116', 'AC', 7, 0),
(213, 14, 141, NULL, '57501116', 'AC', 7, 0),
(214, 13, 142, NULL, '52228848', 'AC', 7, 0),
(215, 14, 142, NULL, '52228848', 'AC', 7, 0),
(216, 13, 143, NULL, '57407173', 'AC', 7, 0),
(217, 14, 143, NULL, '57407173', 'AC', 7, 0),
(218, 13, 144, NULL, '57371999', 'AC', 7, 0),
(219, 14, 144, NULL, '57371999', 'AC', 7, 0),
(220, 13, 145, NULL, '57008740', 'AC', 7, 0),
(221, 14, 145, NULL, '57008740', 'AC', 7, 0),
(222, 13, 146, NULL, '52192556', 'AC', 7, 0),
(223, 14, 146, NULL, '52192556', 'AC', 7, 0),
(224, 13, 147, NULL, '57400350', 'AC', 7, 0),
(225, 14, 147, NULL, '57400350', 'AC', 7, 0),
(226, 13, 148, NULL, '57389561', 'AC', 7, 0),
(227, 14, 148, NULL, '57389561', 'AC', 7, 0),
(228, 13, 149, NULL, '56248362', 'AC', 7, 0),
(229, 14, 149, NULL, '56248362', 'AC', 7, 0),
(230, 13, 150, NULL, '57541005', 'AC', 7, 0),
(231, 14, 150, NULL, '57541005', 'AC', 7, 0),
(232, 13, 150, NULL, '57569444', 'AC', 7, 0),
(233, 14, 151, NULL, '57569444', 'AC', 7, 0),
(234, 13, 151, NULL, '57372484', 'AC', 7, 0),
(235, 14, 152, NULL, '57372484', 'AC', 7, 0),
(236, 13, 153, NULL, '52106291', 'AC', 7, 0),
(237, 14, 153, NULL, '52106291', 'AC', 7, 0),
(238, 13, 154, NULL, '57814683', 'AC', 7, 0),
(239, 14, 154, NULL, '57814683', 'AC', 7, 0),
(240, 13, 155, NULL, '57745127', 'AC', 7, 0),
(241, 14, 155, NULL, '57745127', 'AC', 7, 0),
(242, 13, 156, NULL, 'Switch 2 po', 'AN', 7, 0),
(243, 14, 156, NULL, '57332215', 'AC', 7, 0),
(244, 13, 156, NULL, '57332215', 'AN', 7, 0),
(245, 13, 156, NULL, '57332215', 'AC', 7, 0),
(246, 13, 157, NULL, '57493868', 'AC', 7, 0),
(247, 14, 157, NULL, '57493868', 'AC', 7, 0),
(248, 13, 158, NULL, '52185832', 'AC', 7, 0),
(249, 14, 158, NULL, '52185832', 'AC', 7, 0),
(250, 13, 159, NULL, '57637704', 'AC', 7, 0),
(251, 14, 159, NULL, '57637704', 'AC', 7, 0),
(252, 13, 160, NULL, '57391047', 'AC', 7, 0),
(253, 14, 160, NULL, '57391047', 'AC', 7, 0),
(254, 13, 161, NULL, '50621986', 'AC', 7, 0),
(255, 14, 161, NULL, '50621986', 'AC', 7, 0),
(256, 13, 162, NULL, '57922445', 'AC', 7, 0),
(257, 14, 162, NULL, '57922445', 'AC', 7, 0),
(258, 13, 163, NULL, '57358145', 'AC', 7, 0),
(259, 14, 163, NULL, '57358145', 'AC', 7, 0),
(260, 13, 164, NULL, '35612712', 'AC', 7, 0),
(261, 14, 164, NULL, '35612712', 'AC', 7, 0),
(262, 13, 165, NULL, '36861144', 'AC', 7, 0),
(263, 14, 165, NULL, '36861144', 'AC', 7, 0),
(264, 13, 166, NULL, '57705048', 'AC', 7, 0),
(265, 14, 166, NULL, '57705048', 'AC', 7, 0),
(266, 13, 167, NULL, '30441570', 'AC', 7, 0),
(267, 14, 167, NULL, '30441570', 'AC', 7, 0),
(268, 13, 168, NULL, '57705063', 'AC', 7, 0),
(269, 14, 168, NULL, '57705063', 'AC', 7, 0),
(270, 13, 168, NULL, '51869907', 'AC', 7, 0),
(271, 14, 168, NULL, '51869907', 'AC', 7, 0),
(272, 13, 169, NULL, '57705055', 'AC', 7, 0),
(273, 14, 169, NULL, '57705055', 'AC', 7, 0),
(274, 16, 102, NULL, '326-1643', 'AC', 7, 0),
(275, 16, 171, NULL, '3222 1881 6', 'AN', 7, 0),
(276, 16, 171, NULL, '3222 1881 6', 'AN', 7, 0),
(277, 16, 171, NULL, '3222 1881 6', 'AC', 7, 0),
(278, 16, 172, NULL, '3222 1180 0', 'AN', 7, 0),
(279, 16, 172, NULL, '3222 1180 0', 'AN', 7, 0),
(280, 16, 172, NULL, '3222 1180 0', 'AN', 7, 0),
(281, 16, 172, NULL, '3222 1180 0', 'AN', 7, 0),
(282, 16, 172, NULL, '3222 118000', 'AC', 7, 0),
(283, 16, 172, NULL, '3222 318729', 'AC', 7, 0),
(284, 16, 96, NULL, '3222 986146', 'AC', 7, 0),
(285, 16, 89, NULL, '2911 011702', 'AC', 7, 0),
(286, 16, 98, NULL, '8231 101804', 'AC', 7, 0),
(287, 16, 98, NULL, '3222 309848', 'AC', 7, 0),
(288, 16, 103, NULL, '3222 319534', 'AN', 7, 0),
(289, 16, 104, NULL, '3222 323209', 'AC', 7, 0),
(290, 16, 137, NULL, '3222 311156', 'AC', 7, 0),
(291, 16, 173, NULL, '3222 330237', 'AN', 7, 0),
(292, 16, 173, NULL, '3222 330237', 'AN', 7, 0),
(293, 16, 173, NULL, '3128 307488', 'AN', 7, 0),
(294, 16, 174, NULL, '3128 307488', 'AC', 7, 0),
(295, 16, 175, NULL, '3177 308500', 'AC', 7, 0),
(296, 16, 111, NULL, '3222 331632', 'AC', 7, 0),
(297, 16, 112, NULL, '3222 323704', 'AN', 7, 0),
(298, 16, 111, NULL, '3222 332477', 'AC', 7, 0),
(299, 16, 112, NULL, '3222 316242', 'AC', 7, 0),
(300, 16, 176, NULL, '3222 331466', 'AC', 7, 0),
(301, 16, 177, NULL, '3222 328342', 'AC', 7, 0),
(302, 16, 178, NULL, '3216 755500', 'AC', 7, 0),
(303, 16, 179, NULL, '3222 3309 1', 'AN', 7, 0),
(304, 16, 179, NULL, '3222 330916', 'AC', 7, 0),
(305, 16, 180, NULL, '1604 610980', 'AC', 7, 0),
(306, 16, 181, NULL, '3222 989241', 'AC', 7, 0),
(307, 16, 181, NULL, '3222 989242', 'AC', 7, 0),
(308, 16, 182, NULL, '3222 986201', 'AN', 7, 0),
(309, 16, 182, NULL, '3222 986204', 'AN', 7, 0),
(310, 16, 153, NULL, '3222 986202', 'AC', 7, 0),
(311, 16, 153, NULL, '3222 986199', 'AC', 7, 0),
(312, 16, 182, NULL, '3214 873401', 'AN', 7, 0),
(313, 16, 183, NULL, '3214 873401', 'AC', 7, 0),
(314, 16, 184, NULL, '3222 324896', 'AC', 7, 0),
(315, 16, 184, NULL, '5541 902100', 'AC', 7, 0),
(316, 16, 150, NULL, '3222 989268', 'AC', 7, 0),
(317, 16, 185, NULL, '3222 148800', 'AC', 7, 0),
(318, 16, 186, NULL, '4350 266200', 'AC', 7, 0),
(319, 16, 187, NULL, '3222 317308', 'AC', 7, 0),
(320, 16, 188, NULL, '3222 323726', 'AC', 7, 0),
(321, 16, 189, NULL, '3176 000272', 'AC', 7, 0),
(322, 16, 190, NULL, '3176 000038', 'AC', 7, 0),
(323, 16, 191, NULL, '3222 330246', 'AC', 7, 0),
(324, 16, 192, NULL, '3176 001300', 'AC', 7, 0),
(325, 16, 193, NULL, '3222 329288', 'AC', 7, 0),
(326, 16, 194, NULL, '3222 329287', 'AC', 7, 0),
(327, 16, 195, NULL, '3176 000172', 'AC', 7, 0),
(328, 16, 196, NULL, '3222 316254', 'AC', 7, 0),
(329, 16, 197, NULL, '3222 329472', 'AC', 7, 0),
(330, 16, 198, NULL, '3222 327788', 'AC', 7, 0),
(331, 16, 199, NULL, '3222 320883', 'AC', 7, 0),
(332, 1, 68, NULL, '0303456', 'AC', 6, 0),
(333, 1, 200, NULL, '12345678992', 'AN', 6, 0),
(334, 1, 1, NULL, '12345678992', 'AN', 6, 0),
(335, 9, 1, NULL, '00000000666', 'AC', 6, 0),
(336, 18, 1, NULL, '12345678910', 'AN', 6, 0),
(337, 9, 211, NULL, '123456789', 'AC', 6, 0),
(338, 9, 3, NULL, 'cod 66', 'AN', 6, 0),
(339, 8, 17, NULL, 'motorair5''7', 'AC', 6, 0),
(340, 8, 18, NULL, 'soporteMotorair507', 'AC', 6, 0),
(341, 8, 38, NULL, 'filtroaceiteaor507', 'AC', 6, 0),
(342, 8, 65, NULL, '001122', 'AC', 6, 0),
(343, 1, 1, NULL, '00001', 'AC', 6, 0),
(344, 1, 212, NULL, '111', 'AC', 6, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=225 ;

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
(12, 'CARTER DEL MOTOR', 3, '2018-07-03 11:19:06', '', 5, 'assets/filesequipos/12.pdf', 'AC', 6),
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
(23, 'BRAZO', 5, '2018-07-03 11:37:54', '', 1, 'assets/filesequipos/23.pdf', 'AC', 6),
(24, 'SENSOR DE TEMPERATURA', 5, '2018-07-03 11:39:00', '', 1, 'assets/filesequipos/24.pdf', 'AC', 6),
(25, 'BATERIA', 5, '2018-07-03 11:39:11', '', 1, 'assets/filesequipos/25.pdf', 'AC', 6),
(26, 'CORREDERA', 1, '2018-07-03 16:08:09', '', 1, 'assets/filesequipos/26.pdf', 'AC', 6),
(27, 'BRAZO', 1, '2018-07-03 16:50:47', '', 1, 'assets/filesequipos/27.pdf', 'AC', 6),
(28, 'MARTILLO', 1, '2018-07-03 21:50:00', '', 1, 'assets/filesequipos/28.pdf', 'AC', 6),
(29, 'BASTIDOR', 1, '2018-07-03 22:14:02', '', 1, 'assets/filesequipos/29.pdf', 'AC', 6),
(30, 'BATERIA ', 1, '2018-07-03 22:20:52', '', 1, 'assets/filesequipos/30.pdf', 'AC', 6),
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
(67, 'BATERÍA', 4, '2018-07-05 11:37:26', '', 6, 'assets/filesequipos/67.pdf', 'AC', 6),
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
(216, 'nueva prueba', -1, '2018-10-10 11:51:15', 'no tiene', 8, 'comp216.pdf', 'AC', 6),
(217, 'xsss', 1, '2018-10-10 11:53:29', 'sss', 2, 'comp217.pdf', 'AC', 6),
(218, 'ee', -1, '2018-10-10 11:57:12', 'eeeeeee', 1, '', 'AC', 6),
(219, 'eli test', -1, '2018-10-10 12:01:45', 'nuevo componente con adjunto', 20, 'comp219.pdf', 'AN', 6),
(220, 'nueva eli', -1, '2018-10-10 12:02:38', 'eli', 8, 'comp220.pdf', 'AC', 6),
(221, 'eli', -1, '2018-10-11 12:00:56', 'eli', 2, 'comp221.pdf', 'AC', 6),
(222, 'nnnn', -1, '2018-10-11 12:17:01', 'nnnn', 1, 'comp222.pdf', 'AC', 6),
(223, 'Filtros de aire ', -1, '2018-10-28 10:44:39', 'baja vuelta motor', 13, '', 'AC', 7),
(224, 'tren rodante', -1, '2018-10-29 16:55:17', 'rueda guía', 13, '', 'AC', 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=60 ;

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
(35, 'Llantas', 'AC', 0),
(37, 'Mamelucos Descartables ', 'AC', 7),
(38, 'Guantes de vaqueta ', 'AC', 7),
(39, 'Guantes de nitrillo descartables ', 'AC', 7),
(40, 'Guantes de Nitrillo ', 'AC', 7),
(41, 'Gafas Transparentes', 'AC', 7),
(42, 'Gafas oscuras', 'AC', 7),
(43, 'Gafas amarilla ', 'AC', 7),
(44, 'Guantes multiflex ', 'AC', 7),
(45, 'Barbijos ', 'AC', 7),
(46, 'Semi-mascara ', 'AC', 7),
(47, 'Protectores auditivos endoaurales ', 'AC', 7),
(48, 'Protección auditiva tipo copa ', 'AC', 7),
(49, 'Casco ', 'AC', 7),
(50, 'Antiparras para viento ', 'AC', 7),
(51, 'Arnes de casco ', 'AC', 7),
(52, 'Filtros para semi-mascara ', 'AC', 7),
(53, 'Tijera de bloqueo ', 'AC', 7),
(54, 'Mordazas ', 'AC', 7),
(55, 'Sensor de nivel', 'AC', 7),
(56, 'Sensor de proximidad', 'AC', 7),
(57, 'Sensores IFM ', 'AC', 7),
(58, 'Filtros', 'AC', 7),
(59, 'Sistema Aire Acondicionado.', 'AC', 7);

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
(10, 20);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=24 ;

--
-- Volcado de datos para la tabla `contratistas`
--

INSERT INTO `contratistas` (`id_contratista`, `nombre`, `contradireccion`, `contramail`, `contramail1`, `contracelular1`, `contracelular2`, `contratelefono`, `contracontacto`, `estado`, `id_empresa`) VALUES
(17, 'Clorox', 'Clorox', 'Clorox', 'Clorox', '156565665', '156565665', '156565665', '156565665', 'AC', 6),
(19, 'Trazalog', 'Lib. Gral. S. Martin 1890', 'soporte@tazalog.com', 'soporte@tazalog.com', '155555555', '155555555', '155555555', 'Soporte', 'AC', 6),
(20, 'contratista emp 6', 'calle sin numero', 'contratista@gmail.com', '', '1555555', '16666666', '42555555', 'hugo', 'AC', 2),
(23, 'MRS', '-', '-', '-', '-', '-', '-', '-', 'AC', 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `deta_ordeninsumos`
--

INSERT INTO `deta_ordeninsumos` (`id_detaordeninsumo`, `id_ordeninsumo`, `loteid`, `cantidad`, `precio`, `id_empresa`) VALUES
(1, 1, 1, 20, NULL, 6),
(2, 2, 1, 2, NULL, 6),
(3, 3, 2, 2, NULL, 6),
(4, 3, 3, 20, NULL, 6),
(5, 4, 1, 45, NULL, 6),
(6, 5, 1, 45, NULL, 6),
(7, 6, 14, 1, NULL, 7),
(8, 7, 8, 1, NULL, 7),
(9, 8, 8, 1, NULL, 7),
(10, 9, 8, 1, NULL, 7),
(11, 10, 8, 1, NULL, 7),
(12, 11, 20, 22, NULL, 6),
(13, 12, 20, 3, NULL, 6),
(14, 13, 21, 1, NULL, 7),
(15, 14, 27, 4, NULL, 7),
(16, 14, 25, 2, NULL, 7),
(17, 14, 24, 4, NULL, 7),
(18, 15, 25, 4, NULL, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=53 ;

--
-- Volcado de datos para la tabla `deta_ordenservicio`
--

INSERT INTO `deta_ordenservicio` (`id_detasercicio`, `id_ordenservicio`, `id_tarea`, `tiempo`, `observacion`, `monto`, `id_componente`, `rh`) VALUES
(1, 1, '1', ' 1 ', NULL, 150, 2, 1),
(2, 2, '1', ' 12 ', NULL, 1200, 1, 2),
(3, 3, '1', ' 10 ', NULL, 1000, 1, 3),
(4, 4, '1', '  ', NULL, 0, 0, 4),
(7, 8, '1', '  ', NULL, 0, 0, 8),
(8, 14, 'tarea test 01', '', NULL, 0, 0, NULL),
(9, 15, 'tarea test 02 a', '', NULL, 0, 0, NULL),
(10, 15, 'tarea test 02 b', '', NULL, 0, 0, NULL),
(11, 15, 'tarea test 02 c', '', NULL, 0, 0, NULL),
(12, 16, 'Tarea Nº 1', '', NULL, 0, 0, NULL),
(13, 16, 'Tarea Nº 2', '', NULL, 0, 0, NULL),
(14, 16, 'Tarea Nº 3', '', NULL, 0, 0, NULL),
(15, 17, 'Gg', '', NULL, 0, 0, NULL),
(16, 18, 'Se remplazan guias de martillo. ', '', NULL, 0, 0, NULL),
(17, 19, 'reemplazo filtro aceite', '', NULL, 0, 0, NULL),
(18, 20, 'reemplazo compresor aire acondicionado', '', NULL, 0, 0, NULL),
(19, 21, 'ttt1', '', NULL, 0, 0, NULL),
(20, 21, 'ttt2', '', NULL, 0, 0, NULL),
(21, 22, 'Chequeo diario ', '', NULL, 0, 0, NULL),
(22, 23, 'Inspección de equipo ', '', NULL, 0, 0, NULL),
(23, 24, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(24, 25, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(25, 26, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(26, 27, 'PM de 500 Hs', '', NULL, 0, 0, NULL),
(27, 27, 'Chequeo diario ', '', NULL, 0, 0, NULL),
(28, 28, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(29, 29, 'Chequeo diario ', '', NULL, 0, 0, NULL),
(30, 30, 'Chequeo diario ', '', NULL, 0, 0, NULL),
(31, 31, 'Chequeo diario ', '', NULL, 0, 0, NULL),
(32, 32, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(33, 33, 'Chequeo de equipo', '', NULL, 0, 0, NULL),
(34, 33, 'Cambio de manguera hidráulica por fuga ', '', NULL, 0, 0, NULL),
(35, 33, 'se completan niveles. ', '', NULL, 0, 0, NULL),
(36, 34, 'Cmbio de sello de bomba pricipal lado colector. ', '', NULL, 0, 0, NULL),
(37, 35, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(38, 36, 'Chequeo diario de equipo. ', '', NULL, 0, 0, NULL),
(39, 37, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(40, 38, 'Chequeo diario ', '', NULL, 0, 0, NULL),
(41, 38, 'Reparación de fuga hidráulica ', '', NULL, 0, 0, NULL),
(42, 39, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(43, 40, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(44, 41, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(45, 42, 'Chequeo diario ', '', NULL, 0, 0, NULL),
(46, 43, 'Chequeo diario ', '', NULL, 0, 0, NULL),
(47, 44, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(48, 45, 'Chequeo diario de equipo ', '', NULL, 0, 0, NULL),
(49, 46, 'Engrase general ', '', NULL, 0, 0, NULL),
(50, 46, 'cambio de burlete de puerta lado perforacion ', '', NULL, 0, 0, NULL),
(51, 46, 'Cambio de sello en válvula de gato trasero ', '', NULL, 0, 0, NULL),
(52, 46, 'Chequo con soldadores por posibles fisuras ', '', NULL, 0, 0, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Volcado de datos para la tabla `deta_remito`
--

INSERT INTO `deta_remito` (`detaremitoid`, `id_remito`, `loteid`, `cantidad`, `precio`, `id_empresa`) VALUES
(1, 1, 1, 23, 0, 6),
(2, 4, 1, 12, 0, 6),
(3, 4, 3, 6, 0, 6),
(4, 5, 1, 35, 0, 6),
(5, 6, 1, 45, 0, 6),
(6, 7, 1, 34, 0, 6),
(7, 8, 4, 100, 0, 6),
(8, 9, 5, 34, 0, 6),
(9, 10, 6, 1, 0, 7),
(10, 11, 6, 2, 0, 7),
(11, 13, 7, 6, 0, 7),
(12, 14, 8, 8, 0, 7),
(13, 15, 9, 8, 0, 7),
(14, 16, 10, 8, 0, 7),
(15, 17, 11, 6, 0, 7),
(16, 18, 12, 2, 0, 7),
(17, 19, 13, 6, 0, 7),
(18, 20, 14, 2, 0, 7),
(19, 21, 15, 6, 0, 7),
(20, 22, 16, 6, 0, 7),
(21, 23, 17, 6, 0, 7),
(22, 24, 18, 2, 0, 7),
(23, 25, 19, 2, 0, 7),
(24, 26, 14, 1, 0, 7),
(25, 27, 8, 3, 0, 7),
(26, 28, 20, 40, 0, 6),
(27, 29, 21, 1, 0, 7),
(28, 30, 22, 1, 0, 7),
(29, 31, 23, 1, 0, 7),
(30, 32, 24, 4, 0, 7),
(31, 32, 25, 2, 0, 7),
(32, 32, 25, 4, 0, 7),
(33, 32, 26, 8, 0, 7),
(34, 33, 27, 4, 0, 7),
(35, 34, 24, 2, 0, 7),
(36, 34, 25, 2, 0, 7),
(37, 34, 26, 8, 0, 7),
(38, 35, 28, 2, 0, 7),
(39, 35, 29, 1, 0, 7),
(40, 35, 30, 1, 0, 7),
(41, 35, 31, 1, 0, 7),
(42, 35, 32, 2, 0, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `descripcion`, `fecha_ingreso`, `fecha_baja`, `fecha_garantia`, `marca`, `codigo`, `ubicacion`, `id_empresa`, `id_sector`, `id_hubicacion`, `id_grupo`, `id_customer`, `id_criticidad`, `estado`, `fecha_ultimalectura`, `ultima_lectura`, `tipo_horas`, `id-centrodecosto`, `valor_reposicion`, `fecha_reposicion`, `id_proveedor`, `valor`, `comprobante`, `descrip_tecnica`, `id_unidad`, `id_area`, `id_proceso`, `numero_serie`) VALUES
(1, 'Perforadora Ranger 500', '0000-00-00', '0000-00-00', '0000-00-00', 'TamRock', 'EMPER001', 'La Laja', 6, 10, 0, 2, 13, 1, 'AC', '0000-00-00 00:00:00', 1000, '', 0, 0, '0000-00-00', 0, 0, '', '', 11, 3, 8, 11111),
(3, 'Cargadora WA250', '2018-09-02', '0000-00-00', '2018-09-29', 'Komatsu', 'EMCAR003', '0', 6, 12, 0, 1, 14, 1, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 8, 11111),
(4, 'Autoelevador 01', '0000-00-00', '0000-00-00', '0000-00-00', 'Toyota', 'EMAUT001', 'La Laja', 6, 10, 0, 3, 15, 2, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 8, 11111),
(5, 'Perforadora 680', '0000-00-00', '0000-00-00', '0000-00-00', 'TamRock', 'EMPER002', 'La Laja', 6, 11, 0, 2, 16, 1, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 11, 3, 8, 11111),
(7, 'este equipo es una pruba', '2018-08-11', '0000-00-00', '2018-08-10', 'Black & Decker', 'AIR000507', '4444', 6, 11, 0, 3, 17, 9, 'RE', '2018-08-17 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', 'dasdsadsadsa', 2, 10, 9, 2234444),
(8, 'este equipo es una pruebaaaaa', '2018-08-11', '0000-00-00', '2018-08-10', 'Black & Decker', 'AIR000507', '4444', 6, 13, 0, 1, 18, 9, 'AC', '2018-08-17 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', 'dasdsadsadsa', 11, 10, 9, 2234444),
(9, 'PERFONADORA TOYOTA', '2018-09-16', '0000-00-00', '2018-09-22', 'Toyota', 'MT666', '0', 6, 12, 0, 2, 18, 10, 'AC', '2018-09-14 00:00:00', 7, '', 0, 0, '0000-00-00', 0, 0, '', 'sdfgdfdfg', 6, 10, 9, 123),
(10, 'Descrip', '2018-09-08', '0000-00-00', '2018-09-29', 'Toyota', 'Cod12-2018', '13456,46123', 6, 12, 0, 2, 15, 3, 'AC', '2018-09-07 00:00:00', 20, '', 0, 0, '0000-00-00', 0, 0, '', 'gfhfdgdhhfh', 6, 3, 7, 123),
(11, 'Perforadora Drilltech Tamrock 500', '2018-09-17', '0000-00-00', '2018-09-17', 'DRILLTECH', 'EMPER11', '0', 7, 14, 0, 5, 20, 11, 'AN', '2018-09-17 00:00:00', 5, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 12, 11, 23344),
(13, 'Perforadora DM45', '2018-01-01', '0000-00-00', '0000-00-00', 'Atlas Copco', '901', '0', 7, 15, 0, 7, 20, 11, 'AC', '2018-09-18 00:00:00', 8000, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 13, 8614),
(14, 'Perforadora DM 45', '0000-00-00', '0000-00-00', '0000-00-00', 'Atlas Copco', '903', '0', 7, 15, 0, 7, 20, 11, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 13, 6052),
(15, 'Pantera DP 1500', '0000-00-00', '0000-00-00', '0000-00-00', 'Sandvik', '905', '0', 7, 15, 0, 8, 20, 11, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 11, 12),
(16, 'Roc L8-30', '0000-00-00', '0000-00-00', '0000-00-00', 'DRILLTECH', '906', '0', 7, 15, 0, 9, 20, 11, 'AC', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 7, 14, 11, 10),
(17, 'descrip', '0000-00-00', '0000-00-00', '0000-00-00', 'Bahco', '123456789', 'La Laja', 6, 10, 0, 1, 13, 10, 'AN', '0000-00-00 00:00:00', 0, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 3, 4, 2222222222),
(18, 'Equipo de prueba', '2018-10-19', '0000-00-00', '2018-10-30', 'Toyota', '123456789', '0', 6, 16, 0, 11, 19, 9, 'AN', '2018-10-25 00:00:00', 22, '', 0, 0, '0000-00-00', 0, 0, '', '', 6, 10, 4, 123456789);

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
(5, 'Perforadoras DM 45 Producción', 'AC', 7),
(6, 'Perforadora Rotary', 'AC', 6),
(7, 'Perforadora Rotary', 'AC', 7),
(8, 'Perforadora Auxiliar L8 DP1500', 'AC', 7),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=174 ;

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
(36, 'HR-ODE-Boquilla para termofusión 1 1/4"', 'Boquilla para termofusión 1 1/4"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1 1/4"', 1, 6),
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
(95, 'CJ 01 ', 'METALICA ', 19, NULL, 'AC', 'CAJA DE HERRAMIENTAS ', 4, 7),
(96, 'CJ 02 ', 'COMPLETA ', 23, NULL, 'AC', 'CAJA DE HERRAMIENTAS ', 4, 7),
(97, 'CJ 03', 'ENCASTRE 3/4 ', 24, NULL, 'AC', 'CAJA DE TUBOS ', 4, 7),
(98, 'CJ O4 ', 'PLASTICA CHICA ', 33, NULL, 'AC', 'CAJA DE HERRAMIENTAS ', 4, 7),
(99, 'CJ 05 ', 'ALTA Y BAJA ', 32, NULL, 'AC', 'CAJA CON MANOMETROS DE CARGA DE A/C', 4, 7),
(100, 'LLVF 01', '450MM', 35, NULL, 'AC', 'LLAVE FRANCESA', 4, 7),
(101, 'LLST 01', 'PINZA ', 35, NULL, 'AC', ' STILSON ', 4, 7),
(103, 'LLIN 01', 'REGULABLE', 20, NULL, 'AC', 'LLAVE INGLESA', 4, 7),
(105, 'LLCO 01', 'COMBINADA 36MM', 20, NULL, 'AC', 'LLAVE ', 4, 7),
(115, '11', '2', 10, NULL, 'AC', '2', 6, 7),
(126, 'MR01', 'Encastre 1/2', 3, NULL, 'AC', 'Mango de fuerza', 2, 6),
(137, '', '', -1, NULL, 'AC', '', -1, 7),
(139, 'MF 01', 'Encastre 1/2', 35, NULL, 'AC', 'Mango de fuerza ', 4, 7),
(140, 'LLBO 01 ', 'DE BOCA', 35, NULL, 'AC', 'LLAVE 60MM', 4, 7),
(141, 'PNZ 01', 'PICO DE LORO ', 30, NULL, 'AC', 'PINZA ', 4, 7),
(142, 'PNZ 02', 'DE FUERZA ', 29, NULL, 'AC', 'PINZA ', 4, 7),
(143, 'LLCO 02', 'CONVINADA', 35, NULL, 'AC', 'LLAVE 3/4 ', 4, 7),
(144, 'LLCO 03 ', 'COMBINADA ', 27, NULL, 'AC', 'LLAVE 14MM', 4, 7),
(145, 'LLCO  04', 'COMBINADA ', 24, NULL, 'AC', 'LLAVE 10MM', 4, 7),
(146, 'LLBO 02 ', 'DE BOCA ', 26, NULL, 'AC', 'LLAVE', 4, 7),
(147, 'LLCO 05', 'COMBINADA ', 21, NULL, 'AC', 'LLAVE  18MM', 4, 7),
(148, 'LLCO06', 'COMBINADA', 35, NULL, 'AC', 'LLAVE 11/16', 4, 7),
(149, 'LLCU 01', 'TIPO C', 21, NULL, 'AC', 'LLAVE 17MM-13MM', 4, 7),
(150, 'DS P 01', 'Plano ', 27, NULL, 'AC', 'Destornillador ', 4, 7),
(151, 'DS PH 01', 'Philips ', 35, NULL, 'AC', 'Destornillador ', 4, 7),
(152, 'LLALM 01 ', 'ALEM', 35, NULL, 'AC', 'JUEGO DE LLAVES', 4, 7),
(153, 'LLCO 08 ', 'Combinada', 28, NULL, 'AC', 'Llave 8MM', 4, 7),
(154, 'PNZS 01', 'Zeguer recta ', 32, NULL, 'AC', 'Pinza', 4, 7),
(155, 'PNZS 02', 'Zeguers curva ', 32, NULL, 'AC', 'Pinza', 4, 7),
(156, 'PNZ 03', 'De  punta ', 32, NULL, 'AC', 'Pinza', 4, 7),
(157, 'PLC 01 ', 'Encastre 1/2 ', 27, NULL, 'AC', 'Palanca ', 4, 7),
(158, 'LLCO 09', 'Combinada', 21, NULL, 'AC', 'Llave 3/4 ', 4, 7),
(159, 'TST 01', 'Pinza', 25, NULL, 'AC', 'Tester ', 4, 7),
(160, 'HD 01 ', 'EP 450 S ', 22, NULL, 'TR', 'Handye ', 4, 7),
(161, 'HD 2 ', 'EP450 S ', 22, NULL, 'AC', 'Handye ', 4, 7),
(162, 'TB 01 ', 'Encastre 1/2 ', 21, NULL, 'AC', 'TUBO 32 MM', 4, 7),
(163, 'TBAL 01 ', 'ALEM ', 32, NULL, 'AC', 'TUBO 14MM', 4, 7),
(164, 'MT 01', 'De mano ', 32, NULL, 'AC', 'Masa de 10 kg ', 4, 7),
(165, 'MT 02 ', 'De mano', 32, NULL, 'AC', 'Martillo ', 4, 7),
(166, 'PNZ 04 ', 'Amarilla con negro ', 36, NULL, 'AC', 'Pinza', 4, 7),
(167, 'LIM 01 ', 'Plana ', 35, NULL, 'AC', 'Lima ', 4, 7),
(168, 'TR 01', 'Cuter ', 27, NULL, 'AC', 'Trincheta ', 4, 7),
(169, 'LLVF 02', 'Francesa 30mm', 21, NULL, 'AC', 'Llave', 4, 7),
(170, 'LLCO 10 ', 'Combinada ', 20, NULL, 'AC', 'LLAVE 15/16 ', 4, 7),
(171, 'LLCO 11', 'Combinada', 35, NULL, 'AC', 'Llave 24mm', 4, 7),
(172, 'LLCO 12', 'Combinada ', 27, NULL, 'AC', 'Llave 17mm ', 4, 7),
(173, 'LLALM 02 ', 'Alem', 32, NULL, 'AC', 'Llave 4mm', 4, 7);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=99 ;

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
(91, 13, 0, '2018-10-09 12:17:37', 18, 'Cambio de válvula de pilotaje, falta conector ', 'admin', 'b', ''),
(92, 16, 0, '2018-10-10 09:15:22', 18, '3222 3316 32 cable de avance (corto)', '1', 'Grupo 2 ', ''),
(93, 15, 0, '2018-10-10 09:57:23', 18, 'Cambio de correa de A/C  N°P 550 587 12', '2', 'grupo 2 ', ''),
(94, 5, 2000, '2018-10-10 16:00:48', 1, 'ok', 'rs', 'm', 'RE'),
(95, 5, 2000, '2018-10-10 16:01:02', 1, 'ok', 'rs', 'm', 'AC'),
(96, 15, 15893, '2018-10-10 16:23:45', 19, 'Prueba', 'Santo Guanuco', 'Mañana', 'AC'),
(97, 8, 122, '2018-10-11 10:13:03', 1, 'aaa', 'Pablo Paz', 'Mañana', 'AC'),
(98, 7, 33, '2018-10-23 16:28:11', 1, 'sadada', 'dsasadad', 'dsadsa', 'RE');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

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
(35, 'BAHCO', 'AC', 7),
(36, 'Pretul', 'AC', 7),
(37, 'NUBUS ', 'AC', 7),
(38, '3M', 'AC', 7),
(39, 'LIBUS ', 'AC', 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `orden_insumos`
--

INSERT INTO `orden_insumos` (`id_orden`, `fecha`, `solicitante`, `destino`, `comprobante`, `id_empresa`, `id_ot`) VALUES
(1, '2018-10-25', 'dfsdfsd', '', 3434, 6, 54),
(2, '2018-10-11', 'mauriiiiiiii peeeeee', '-1', 111, 6, 55),
(3, '2018-10-03', 'nueva 123', '', 333, 6, 33),
(4, '2018-10-27', '4', '', 51574, 6, 4),
(5, '2018-10-27', '44', '', 51574, 6, 67),
(6, '2018-10-28', 'lazzarini', '', 1, 7, 614),
(7, '2018-10-28', 'lazzarini', '', 1, 7, 645),
(8, '2018-10-29', 'lazzarini', '', 0, 7, 645),
(9, '2018-10-28', 'lazzarini', '', 0, 7, 646),
(10, '2018-10-29', 'lazzarini', '', 1, 7, 650),
(11, '2018-10-30', 'eliana', '', 455, 6, 1),
(12, '2018-10-30', 'eli', '', 9193, 6, 5),
(13, '2018-10-29', 'lazzarini', '', 85, 7, 653),
(14, '2018-11-01', 'Julio Medina', '', 2, 7, 660),
(15, '2018-11-05', 'Marcelo Muriel ', '', 0, 7, 657);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

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
(39, -1, 0, '', '2018-10-05 12:23:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 510, '', NULL, 0),
(40, 7, 1, 'Filtro de aire', '2018-10-28 08:37:12', '2018-10-28 00:00:00', '0000-00-00 00:00:00', 'P', 644, '', NULL, 0),
(41, -1, 0, '', '2018-10-29 12:28:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'P', 653, '', NULL, 0);

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
  `id_ot` int(11) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=47 ;

--
-- Volcado de datos para la tabla `orden_servicio`
--

INSERT INTO `orden_servicio` (`id_orden`, `lectura`, `fecha`, `comprobante`, `id_equipo`, `id_contratista`, `id_solicitudreparacion`, `valesid`, `estado`, `id_ordenherraminetas`, `id_orden_insumo`, `id_ot`, `id_empresa`, `fechahorainicio`, `fechahorafin`, `horometroinicio`, `horometrofin`) VALUES
(1, 0, '2017-11-14', '', 2, 17, 6, 4, 'C', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(2, 0, '2017-12-09', '', 1, 17, 16, 1, 'T', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3, 0, '2017-12-11', '', 1, 17, 16, 1, 'C', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(4, 0, '2018-09-19', '', 1, 19, 23, 6, 'C', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(8, 0, '2018-09-19', '', 1, 17, 23, 1, 'C', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(9, 0, '2018-09-20', '', 1, 17, 23, 1, 'C', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(12, 112, '2018-07-18', '1978', 4, 17, 12, 1, 'C', NULL, 1, 0, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(13, 112, '2018-07-18', '1978', 4, 17, 12, 1, 'C', NULL, 1, 0, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(14, 112, '2018-10-22', '1978', 4, 17, 12, 16, 'C', NULL, NULL, 160, 6, '2018-10-21 00:00:00', '2018-10-23 15:51:17', 220, 214),
(15, 0, '2018-10-23', '', 4, 17, 12, 17, 'C', NULL, NULL, 161, 6, '2018-10-22 14:05:43', '2018-10-22 23:49:56', 12.5, 13.8),
(16, 0, '2018-10-23', '', 4, 17, 12, 18, 'C', NULL, NULL, 170, 6, '2018-10-23 21:30:56', '2018-10-30 21:30:59', 400, 550),
(17, 0, '2018-10-23', '', 4, 17, 12, 1, 'C', NULL, NULL, 160, 6, '2018-10-23 22:20:27', '2018-10-23 22:20:34', 25, 23),
(18, 0, '2018-10-25', '', 15, 0, 0, 19, 'T', NULL, NULL, 643, 7, '2018-10-11 10:35:37', '2018-10-12 10:35:46', 16232, 16240),
(19, 0, '2018-10-28', '', 14, 0, 0, 1, 'T', NULL, NULL, 646, 7, '2018-10-28 12:12:35', '2018-10-28 13:12:37', 55261, 55262),
(20, 0, '2018-10-29', '', 14, 0, 0, 1, 'T', NULL, NULL, 653, 7, '2018-10-30 15:30:00', '2018-10-29 19:00:26', 56229.8, 5229.8),
(21, 0, '2018-11-03', '', 4, 0, 12, 24, 'C', NULL, NULL, 172, 6, '2018-11-03 12:23:18', '2018-11-03 12:23:21', 111, 222),
(22, 0, '2018-11-03', '', 15, 0, 0, 25, 'T', NULL, NULL, 663, 7, '2018-10-29 08:10:00', '2018-10-29 08:20:28', 16281, 16281),
(23, 0, '2018-11-03', '', 16, 0, 0, 1, 'T', NULL, NULL, 664, 7, '2018-10-28 15:25:20', '2018-10-29 08:35:18', 2106, 2106),
(24, 0, '2018-11-03', '', 13, 0, 0, 1, 'T', NULL, NULL, 665, 7, '2018-10-30 08:20:11', '2018-10-30 08:35:37', 55650, 55650),
(25, 0, '2018-11-03', '', 16, 0, 0, 26, 'T', NULL, NULL, 666, 7, '2018-11-03 08:35:14', '2018-10-30 08:48:19', 2118, 2818),
(26, 0, '2018-11-03', '', 15, 0, 0, 27, 'T', NULL, NULL, 667, 7, '2018-10-30 08:50:08', '2018-11-03 09:00:30', 16291, 16291),
(27, 0, '2018-11-03', '', 15, 0, 0, 28, 'T', NULL, NULL, 668, 7, '2018-10-31 09:00:46', '2018-10-31 19:20:29', 16303, 16303),
(28, 0, '2018-11-03', '', 13, 0, 0, 1, 'T', NULL, NULL, 669, 7, '2018-10-31 08:00:09', '2018-11-03 08:15:30', 55658, 55658),
(29, 0, '2018-11-03', '', 16, 0, 0, 29, 'C', NULL, NULL, 670, 7, '2018-11-03 08:40:01', '2018-10-31 08:57:56', 2133, 2133),
(30, 0, '2018-11-03', '', 14, 0, 0, 30, 'C', NULL, NULL, 671, 7, '2018-10-31 09:02:12', '2018-10-31 09:15:14', 56259, 56259),
(31, 0, '2018-11-03', '', 14, 0, 0, 31, 'C', NULL, NULL, 672, 7, '2018-11-01 08:00:10', '2018-11-01 08:15:15', 56277, 56277),
(32, 0, '2018-11-03', '', 13, 0, 0, 32, 'C', NULL, NULL, 673, 7, '2018-11-01 17:28:44', '2018-11-01 17:28:48', 55686, 55686),
(33, 0, '2018-11-03', '', 15, 0, 0, 33, 'C', NULL, NULL, 674, 7, '2018-11-01 09:00:58', '2018-11-01 14:00:09', 16311, 16311),
(34, 0, '2018-11-03', '', 13, 0, 0, 34, 'C', NULL, NULL, 676, 7, '2018-11-02 10:00:40', '2018-11-02 14:00:52', 55708, 55708),
(35, 0, '2018-11-03', '', 13, 0, 0, 35, 'C', NULL, NULL, 677, 7, '2018-11-02 08:00:01', '2018-11-03 08:12:23', 55703, 55703),
(36, 0, '2018-11-03', '', 16, 0, 0, 36, 'C', NULL, NULL, 678, 7, '2018-11-02 08:18:05', '2018-11-02 08:28:00', 2161, 2161),
(37, 0, '2018-11-03', '', 14, 0, 0, 1, 'C', NULL, NULL, 680, 7, '2018-11-02 08:50:42', '2018-11-02 08:59:44', 56295, 56295),
(38, 0, '2018-11-03', '', 15, 0, 0, 1, 'C', NULL, NULL, 682, 7, '2018-11-02 09:05:21', '2018-11-02 09:50:18', 16321, 16321),
(39, 0, '2018-11-03', '', 13, 0, 0, 1, 'C', NULL, NULL, 683, 7, '2018-11-03 09:00:09', '2018-11-03 00:10:11', 55719, 55719),
(40, 0, '2018-11-03', '', 14, 0, 0, 37, 'C', NULL, NULL, 685, 7, '2018-11-03 08:25:51', '2018-11-03 08:40:52', 56314, 56314),
(41, 0, '2018-11-03', '', 15, 0, 0, 38, 'C', NULL, NULL, 686, 7, '2018-11-03 08:50:28', '2018-11-03 09:10:30', 16335, 16335),
(42, 0, '2018-11-04', '', 13, 0, 0, 40, 'C', NULL, NULL, 687, 7, '2018-11-04 08:00:32', '2018-11-04 08:10:31', 55733, 55733),
(43, 0, '2018-11-04', '', 14, 0, 0, 41, 'C', NULL, NULL, 688, 7, '2018-11-04 08:17:37', '2018-11-04 08:27:38', 16351, 16351),
(44, 0, '2018-11-04', '', 15, 0, 0, 42, 'C', NULL, NULL, 689, 7, '2018-11-04 08:09:23', '2018-11-04 08:16:24', 16351, 16351),
(45, 0, '2018-11-04', '', 16, 0, 0, 43, 'C', NULL, NULL, 690, 7, '2018-11-04 08:00:20', '2018-11-04 08:08:20', 2184, 2184),
(46, 0, '2018-11-04', '', 13, 0, 0, 44, 'C', NULL, NULL, 691, 7, '2018-11-04 08:31:28', '2018-11-04 12:31:29', 55733, 55733);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=692 ;

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
(160, 5, '1', '2018-02-19', '2018-03-05 03:30:00', '2018-01-18 00:00:00', '2018-10-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 17, 1, 1, 0, 12, '3', 4, 60, 12, 6, 0, 0),
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
(510, 1, '1', '2018-02-26', '2018-02-07 15:00:00', '2018-02-05 19:01:38', '2018-10-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'P', 1, 19, 1, 1, 0, 13, '2', 9, 60, 13, 6, 0, 0),
(511, 1, '1', '2018-02-26', '2018-02-23 17:00:00', '2018-02-08 14:38:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ruido en cuerpo de bomba int 0057A', 1, 'C', 1, 1, 1, 1, 0, 17, '2', 10, 60, 17, 6, 0, 0),
(512, 1, '1', '2018-02-26', '2018-02-21 22:00:00', '2018-02-05 19:01:38', '2018-10-05 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'As', 1, 19, 1, 1, 0, 13, '2', 9, 60, 13, 6, 0, 0),
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
(545, 3, '1', '2018-07-28', '2018-07-28 20:15:00', '2018-01-01 00:00:00', '2018-10-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambie Liquido de Refrigerante de Motor (Revise la Mezcla Anticongelante antes de la Epoca Invernal).', 1, 'As', 1, 1, 1, 1, 0, 97, '3', 5, 20, 97, 6, 0, 0),
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
(600, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'eliana probando nueva', 1, 'C', 1, 1, 0, 2, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(601, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-08 12:37:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', 9, 0, NULL, 6, 0, 0),
(602, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-08 12:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'C', 1, 1, 0, -1, -1, 0, '1', 9, 0, NULL, 6, 0, 0),
(603, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 11:17:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'nva', 1, 'AN', 19, 1, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(604, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 11:18:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Regulación de sostenimiento de cabezal ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(605, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 11:18:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'eliiiiiiiiiii', 1, 'AN', 1, 1, 0, 2, 2, 0, '1', 9, 0, NULL, 6, 0, 0),
(606, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 11:33:00', '2018-10-15 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se chequea sistema de colector de polvo, se encuentra cpu3 con mal funcionamiento, colector de polvo fuera de servicio ', 1, 'AN', 18, 16, 0, 3, 3, 0, '1', 16, 0, NULL, 7, 0, 0),
(607, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 11:42:00', '2018-10-15 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Carga de acumulador de martillo , chequeo y reparación de sistema  de aire acondicionado ', 1, 'AN', 18, 16, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(608, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 11:45:00', '2018-10-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo de sistema de arranque, se cambia batería por bornes en mal estado.\n\nequipo operativo ', 1, 'AN', 18, 16, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(609, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 11:47:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se cambia filtro de alta presión de compresor, se sopletea radiador de compresor,  se cambia cerradura .', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(610, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 11:56:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de cilindro de campana de succión.\nse completa nivel hidráulico  con 40 lts. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(611, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 12:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se  agrega 40 lts de aceite hidráulico por bajo nivel.\nse agregan 10 lts de aceite torcula . ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 16, 0, NULL, 7, 0, 0),
(612, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 12:40:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'se agregan 40 lts de aceite hidráulico por bajo nivel. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 14, 0, NULL, 7, 0, 0),
(613, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 12:41:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se agrega aceite de motor por bajo nivel, (8lts) ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 14, 0, NULL, 7, 0, 0),
(614, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 12:43:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se cambian filtros de Aire primario y secundario por saturacio  excesiva. \nse completa nivel de refrigerante.', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 16, 0, NULL, 7, 0, 0),
(615, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 12:48:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Colocación de bulon de fijación de alternador.\ncambio de correa por bajo voltaje ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(616, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 18:38:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se coloca correa de compresor de aire acondicionado. \nse prueba sistema .\nse encuentra compresor con problema. \nRemplazar compresor. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(617, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 19:01:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se bloque equipo,  se chequea sistema de A/C.\nCompresor no enclocha.\nSe revisa conexión eléctrica. \nSe deja compresor andando desde tecla frió calor.  \nSe carga gas R134A. \n', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 14, 0, NULL, 7, 0, 0),
(618, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-10 19:04:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-Chequeo de sistema eléctrico de forzador. \nSe encuentra cable cortado . \nSe repara el mismo. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(619, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-12 08:55:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se chequea lubricacion  de artillo.\nSe purga sistema.\nchequeo y sistema  eléctrico y limpieza de reles. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(620, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-12 08:58:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo de sistema de rotación, \nse detecta falla mecánica en servo de bomba principal lado colector. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(621, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-12 09:03:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo de niveles, se completa aceite de lubricacion de martillo y aceite de compresor. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(622, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-12 09:06:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se completa nivel de aceite de compresor.\n se revisan solenoides de traslación, se realiza limpieza de conectores de solenoides de actuadores de bomba. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 14, 0, NULL, 7, 0, 0),
(623, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-12 09:16:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se chequea fuga de hidráulico. \nChequeo de compresor. \nChoqueo de joysticks de perforacion . ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(624, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-12 18:08:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se completa nivel de torcula y se vacía deposito de retorno de martillo \n\nHs: 16063. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(625, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-12 18:18:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limpieza de filtros de aire de motor y compresor. \nse completa nivel de refrigerante.', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 16, 0, NULL, 7, 0, 0),
(626, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-12 18:26:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se chequea equipo, se detecta descarrilamiento de cable de avance por polea dañada, se remplaza y rodamiento y se tenzan cables de avance. \nHs: 1879. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 16, 0, NULL, 7, 0, 0),
(627, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-15 10:40:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se completan niveles de torcula.\nse drena deposito del retorno de lubricacion de martillo ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(628, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-15 10:40:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se completan niveles de torcula.\nse drena deposito del retorno de lubricacion de martillo ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 15, 0, NULL, 7, 0, 0),
(629, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-15 10:42:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se chequean niveles\nchequo por alta temperatura de compresor.\nse realiza limpieza de radiadores.\n ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 16, 0, NULL, 7, 0, 0),
(630, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-15 10:44:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se chequea equipo por falta de barrido.\n se detecta falla en ul-88.\n', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(631, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-15 10:50:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Se realiza desmontaje de válvula ul-88, presenta daños en la membrana.\nla cámara de potencia. se realiza reparación de válvula. \nse regula compresor. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(632, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-15 10:53:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo de equipo por falla en intercambiador de barras.\nse remplazan fusibles quemados. \nse entrega operativa. ', 1, 'AN', 18, 1, 0, 3, 3, 0, '1', 16, 0, NULL, 7, 0, 0),
(633, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-15 11:27:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'nose', 1, 'AN', 16, 1, 0, 3, -1, 0, '1', 16, 0, NULL, 7, 0, 0),
(634, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-10-18 06:41:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'prueba', 1, 'AN', 16, 1, 0, 3, 6, 0, '1', 16, 0, NULL, 7, 0, 0),
(635, 108, '1', '2018-10-18', '2018-10-18 01:01:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(636, 108, '1', '2018-10-18', '2018-11-22 01:01:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(637, 108, '1', '2018-10-18', '2018-12-27 01:01:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(638, 108, '1', '2018-10-18', '2019-01-31 01:01:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(639, 108, '1', '2018-10-18', '2019-03-07 01:01:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(640, 108, '1', '2018-10-18', '2019-04-11 01:01:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(641, 108, '1', '2018-10-18', '2019-05-16 01:01:00', '2018-10-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Revise el Sensor de Temperatura.', 1, 'C', 1, 1, 1, 1, 0, 110, '3', 5, 0, 110, 6, 0, 0),
(642, NULL, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-10-22 17:51:00', '2018-10-23 19:57:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'AN', 20, 1, 0, 3, 6, 0, '1', 16, 0, NULL, 7, 0, 0),
(643, NULL, '1', '0000-00-00', '0000-00-00 00:00:00', '2018-10-23 16:37:00', '2018-10-28 18:43:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'reemplazo guias de cuna martillo', 1, 'AN', 20, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, 0, 0),
(644, NULL, '01', '0000-00-00', '0000-00-00 00:00:00', '2018-10-28 07:56:00', '2018-10-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Filtro de aire reemplazo', 1, 'AN', 20, 20, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(645, NULL, '1', '0000-00-00', '0000-00-00 00:00:00', '2018-10-28 08:51:00', '2018-10-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'reemplazo filtro aire motor', 1, 'AN', 20, 20, 0, 3, 3, 0, '1', 13, 0, NULL, 7, 0, 0),
(646, NULL, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-10-28 09:24:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Reemplazo filtro aceite motor', 1, 'AN', 20, 20, 0, 3, 6, 0, '1', 14, 0, NULL, 7, 0, 0),
(647, NULL, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-10-28 10:34:00', '2018-10-28 00:41:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'reemplazo de filtro aire', 1, 'AN', 16, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, 0, 0),
(648, NULL, '77', '0000-00-00', '0000-00-00 00:00:00', '2018-10-28 10:36:00', '2018-10-29 00:43:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'nose', 1, 'AN', 16, 1, 0, 3, 6, 0, '1', 14, 0, NULL, 7, 0, 0),
(649, 1, '1', '2018-10-28', '2018-10-31 00:00:00', '2018-10-28 10:49:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'baja vueltas', 1, 'C', 20, 1, 1, 1, 0, 82, '2', 13, 60, 82, 7, NULL, NULL),
(650, 1, '1', '2018-10-28', '2018-10-28 15:00:00', '2018-10-28 15:13:17', '0000-00-00 00:00:00', '2018-10-28 00:00:00', '0000-00-00 00:00:00', '2018-10-29 00:00:00', 'baja revoluciones', 1, 'E', 20, 20, 1, 1, 0, 84, '2', 14, 60, 84, 7, NULL, NULL),
(651, NULL, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-10-28 15:36:00', '2018-10-28 17:42:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'chequeo de horometros', 1, 'C', 20, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, NULL, NULL),
(652, NULL, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-10-28 15:36:00', '2018-10-28 17:42:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'chequeo de horometros', 1, 'C', 20, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, NULL, NULL),
(653, NULL, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-10-29 12:26:00', '2018-10-29 00:00:00', '2018-10-29 00:00:00', '0000-00-00 00:00:00', '2018-10-29 00:00:00', 'reemplazo compresor aire acondicionado.', 1, 'E', 20, 20, 0, 3, 6, 0, '1', 14, 0, NULL, 7, NULL, NULL),
(654, 1, '1', '2018-10-29', '2018-10-29 15:30:00', '2018-10-29 12:39:49', '2018-10-28 00:00:00', '2018-10-29 00:00:00', '0000-00-00 00:00:00', '2018-10-29 00:00:00', 'carga de aire acondicionado', 1, 'E', 20, 20, 1, 1, 0, 86, '2', 14, 60, 86, 7, NULL, NULL),
(655, NULL, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-10-29 12:43:00', '2018-10-29 14:49:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'carga de aire acondicionado', 1, 'C', 20, 1, 0, 3, 6, 0, '1', -1, 0, NULL, 7, NULL, NULL),
(656, 1, '1', '2018-10-29', '2018-10-29 01:00:00', '2018-10-15 11:04:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Equipo sin barrido, no modula el compresor. se encuentran válvula de pilotaje de ul- 88 mal conectada.\nse observa valvula ul88 con mal funcionamiento ', 1, 'C', 20, 1, 1, 1, 0, 76, '2', 13, 60, 76, 7, NULL, NULL),
(657, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-01 06:45:00', '2018-11-01 08:50:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de Mordazas de mesa de quiebre, bulones y espaciadores ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 16, 0, NULL, 7, NULL, NULL),
(658, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-01 06:45:00', '2018-11-01 08:50:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de Mordazas de mesa de quiebre, bulones y espaciadores ', 1, 'AN', 18, 1, 0, 3, 6, 0, '1', 16, 0, NULL, 7, NULL, NULL),
(659, 1, '1', '2018-11-01', '2018-11-01 00:00:00', '2018-11-01 06:48:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mordazas de mesa de quiebre en mal estado. ', 1, 'AN', 18, 1, 1, 1, 0, 88, '2', 16, 60, 88, 7, NULL, NULL),
(660, 1, '1', '2018-11-01', '2018-11-01 00:00:00', '2018-11-01 06:48:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mordazas de mesa de quiebre en mal estado. ', 1, 'C', 18, 1, 1, 1, 0, 88, '2', 16, 60, 88, 7, NULL, NULL),
(661, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-02 15:42:00', '2018-10-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo de equipo, \nse repara fuga hidráulica por conector de bomba triple  ', 1, 'C', 18, 1, 0, 3, 7, 0, '1', 13, 0, NULL, 7, NULL, NULL),
(662, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-02 15:48:00', '2018-10-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo.\nse remplaza compresor de A/C, se carga gas ', 1, 'C', 18, 1, 0, 3, 7, 0, '1', 14, 0, NULL, 7, NULL, NULL),
(663, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-02 16:19:00', '2018-10-29 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Equipo operativo. chequeo diario ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, NULL, NULL),
(664, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 13:42:00', '2018-10-29 15:48:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo.', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 16, 0, NULL, 7, NULL, NULL),
(665, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 13:52:00', '2018-10-30 15:59:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo. ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 13, 0, NULL, 7, NULL, NULL),
(666, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 14:00:00', '2018-10-30 08:50:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo. ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 16, 0, NULL, 7, NULL, NULL),
(667, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 14:06:00', '2018-10-30 16:12:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, NULL, NULL),
(668, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 14:24:00', '2018-10-31 16:27:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario.\nse realiza asistencia en  Pm de 500 HS ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, NULL, NULL),
(669, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 14:40:00', '2018-10-31 19:46:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo.\n', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 13, 0, NULL, 7, NULL, NULL),
(670, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 14:50:00', '2018-10-31 16:56:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 16, 0, NULL, 7, NULL, NULL),
(671, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 14:54:00', '2018-10-31 17:00:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo.', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 14, 0, NULL, 7, NULL, NULL),
(672, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 15:02:00', '2018-11-03 17:06:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo. ', 1, 'C', 18, 1, 0, 3, 3, 0, '1', 14, 0, NULL, 7, NULL, NULL),
(673, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 15:17:00', '2018-11-03 17:23:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 13, 0, NULL, 7, NULL, NULL),
(674, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 15:38:00', '2018-11-01 17:38:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario.\n\nFuga de aceite hidráulico, se remplaza manguera.', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, NULL, NULL),
(675, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 15:44:00', '2018-11-02 17:50:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de sello de bomba principal lado colector. ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 13, 0, NULL, 7, NULL, NULL),
(676, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 15:44:00', '2018-11-02 17:50:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de sello de bomba principal lado colector. ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 13, 0, NULL, 7, NULL, NULL),
(677, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 15:47:00', '2018-11-02 17:53:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo. ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 13, 0, NULL, 7, NULL, NULL),
(678, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 15:50:00', '2018-11-02 17:56:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo. .', 1, 'C', 18, 1, 0, 3, 3, 0, '1', 16, 0, NULL, 7, NULL, NULL),
(679, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 15:55:00', '2018-11-02 18:01:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cambio de filtros de aire primario y secundario de compresor ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 16, 0, NULL, 7, NULL, NULL),
(680, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 16:00:00', '2018-11-03 18:06:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo. ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 14, 0, NULL, 7, NULL, NULL),
(681, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 16:05:00', '2018-11-02 18:11:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo de equipo.\n\nreparación de fuga hidráulica ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', -1, 0, NULL, 7, NULL, NULL),
(682, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 16:06:00', '2018-11-02 18:13:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo de equipo.\nreparación de fuga hidráulica ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, NULL, NULL),
(683, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 17:44:00', '2018-11-03 19:51:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo de equipo ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 13, 0, NULL, 7, NULL, NULL),
(684, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 17:46:00', '2018-11-03 19:53:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 14, 0, NULL, 7, NULL, NULL),
(685, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 17:46:00', '2018-11-03 19:53:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 14, 0, NULL, 7, NULL, NULL),
(686, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-03 17:48:00', '2018-11-03 19:55:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, NULL, NULL),
(687, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-04 16:42:00', '2018-11-04 18:48:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo.', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 13, 0, NULL, 7, NULL, NULL),
(688, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-04 16:54:00', '2018-11-04 18:51:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo. ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 14, 0, NULL, 7, NULL, NULL),
(689, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-04 17:16:00', '2018-11-04 19:23:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 15, 0, NULL, 7, NULL, NULL),
(690, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-04 17:20:00', '2018-11-04 19:26:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chequeo diario de equipo ', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 16, 0, NULL, 7, NULL, NULL),
(691, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-11-04 17:24:00', '2018-11-04 19:28:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Equipo sin área.\nEngrase General de equipo.\nCambio de burlete de puerta lado perforacion.\nCambio de sello de válvula de gato trasero.\nChequeo de fisuras con soldadores.', 1, 'C', 18, 1, 0, 3, 6, 0, '1', 13, 0, NULL, 7, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

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
(39, 13, 1, '44', '2018-09-20 12:33:04', 0),
(40, 1, 5, '45', '2018-10-10 16:02:28', 6),
(41, 1, 5, '49', '2018-10-10 16:03:38', 6),
(42, 1, 5, '34', '2018-10-10 16:03:41', 6),
(43, 1, 5, '63', '2018-10-10 16:04:47', 7),
(44, 19, 15, '96', '2018-10-10 16:42:26', 7),
(45, 13, 1, '45', '2018-10-31 10:16:30', 0),
(46, 13, 1, '88', '2018-10-31 10:16:52', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`paramId`, `paramdescrip`, `min`, `estado`, `id_empresa`) VALUES
(1, 'TEMPERATURA', NULL, 'AC', 6),
(10, 'VIBRACION', NULL, 'AC', 6),
(11, 'AMPERAJE', NULL, 'AC', 6),
(13, 'HUMEDAD', NULL, 'AC', 6),
(17, 'rer', NULL, 'AN', 7),
(18, 'TEMPERATURA', NULL, 'AC', 7),
(19, 'TEMPERATURA COMPRESOR', NULL, 'AC', 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=143 ;

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
(142, 9, 3, 'Diario', 60, '2018-10-04', 200, 0, NULL, 0, 'C', 1, 1, 2, NULL, 6, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `remitos`
--

INSERT INTO `remitos` (`remitoId`, `fecha`, `provid`, `comprobante`, `id_empresa`) VALUES
(1, '2018-10-25 00:00:00', 2, '2323', 6),
(2, '2018-10-26 00:00:00', 6, '01', 7),
(3, '2018-10-01 11:58:21', 2, '111', 6),
(4, '2018-10-22 12:19:03', 1, '222', 6),
(5, '2018-10-27 12:22:58', 2, '51574', 6),
(6, '2018-10-27 12:28:00', 2, '334', 6),
(7, '2018-10-27 12:37:19', 2, '333', 6),
(8, '2018-10-14 15:14:50', 2, '444', 6),
(9, '2018-10-27 15:25:10', 2, '333', 6),
(10, '2018-10-27 15:27:27', 6, '01', 7),
(11, '2018-10-27 15:33:52', 6, '01', 7),
(12, '2018-10-27 15:36:39', 6, '01', 7),
(13, '2018-10-27 15:40:10', 6, '00', 7),
(14, '2018-10-27 15:43:34', 6, '01', 7),
(15, '2018-10-27 15:52:27', 6, '01', 7),
(16, '2018-10-27 16:11:20', 6, '01', 7),
(17, '2018-10-27 16:15:41', 6, '01', 7),
(18, '2018-10-27 16:26:24', 6, '01', 7),
(19, '2018-10-27 16:29:52', 6, '01', 7),
(20, '2018-10-27 16:35:29', 6, '01', 7),
(21, '2018-10-27 16:51:25', 6, '01', 7),
(22, '2018-10-27 17:03:25', 6, '01', 7),
(23, '2018-10-27 17:13:46', 6, '01', 7),
(24, '2018-10-27 17:22:15', 6, '01', 7),
(25, '2018-10-27 17:47:22', 6, '01', 7),
(26, '2018-10-28 10:40:24', 6, '01', 7),
(27, '2018-10-28 11:55:07', 6, '01', 7),
(28, '2018-10-30 09:43:14', 1, '499', 6),
(29, '2018-10-29 11:35:54', 6, '01', 7),
(30, '2018-10-29 11:38:03', 6, '01', 7),
(31, '2018-10-29 11:43:12', 6, '01', 7),
(32, '2018-10-25 08:43:14', 6, '00', 7),
(33, '2018-11-01 09:03:58', 6, '00', 7),
(34, '2018-11-02 09:54:09', 6, '00', 7),
(35, '2018-10-17 11:04:00', 6, '00000164', 7);

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
(15, 'Mantenimiento Mecánico Mina', 'AC', 7),
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
(5, 1, 60, 30, 6),
(7, 1, 60, 30, 6),
(1, 2, 80, 10, 6),
(1, 3, 80, 15, 6),
(2, 4, 20, 100, 6),
(1, 13, 12, 23, 6),
(15, 19, 105, 85, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1171 ;

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
(1170, 1, 212);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

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
(55, 7, 'trazabilidad Activos', 'fa fa-fw fa-exchange', 'fa fa-calendar', 11, 6),
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
(69, 7, 'Informe de Servicios', 'fa fa-fw fa-file-text-o', 'Ordenservicio', 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenuactions`
--

CREATE TABLE IF NOT EXISTS `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=213 ;

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
(212, 69, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema`
--

CREATE TABLE IF NOT EXISTS `sistema` (
  `sistemaid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`sistemaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `sistema`
--

INSERT INTO `sistema` (`sistemaid`, `descripcion`) VALUES
(1, 'Electrico'),
(2, 'Hidraulico');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `sisusers`
--

INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(1, 'admin', 'admin', 'admin', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0x89504e470d0a1a0a0000000d49484452000000d7000000d70806000000897dc4b50000373c4944415478daed7df77714d7b6a6fe8879e9cefc7267d65b33f7be993bebad3773efbc07f6c5016363636cc0986b1b9b8cc1981c6cc0062cc0e49c4124814012412491834822482401226392c9395a20f6d477c42e9dae3e15babbbafb74ab6aadbd105277d53975f67776de27e379412d4a652a9f518beabff33afdf5af7fa566cd9a51d3a64de9edb7df16ff677ae38d37e8fdf7df177f6bdebc39b56ad58abefefa6b4fd4b66d5bfafcf3cfc5f7f97eefbefbaef81dee05c2fff17bfcece57e5f7ef9a5f95d993ef9e4135bfaf4d34f95dfb1528b162da875ebd6d4ae5d3bcf734c34619c5813bcb3d5436a53aaf3a01d65a4f2e0ef2eae06162f16d33befbc23c00466f38b2900caf7de7b4fdc1f0006c3376edc58fc1fe073fb7ecb962d4d10e0bb0d1b3614e37cf3cd3743c61e09611cb8874cf5ebd7a70f3ffc506c3698bf8e40c32683b1620e433abc16804b376ad5e47525a022914cd1109e81e7d5a953c794924ecf6cdfbe3d7df5d55702541f7ffc719864659000b85e48f57d277aebadb7a8418306026cf17e3701c0d2005c597d5e33990752c34f09e585c0a8fc7c4809a7cf32b03ef8e083908d00520fbf0793f93936bc0bdc17f7c7bb514975fc2dd1efaca6012c25c15532b1b6a90a2693415845741a032405181daa1a3e8bef78b1cdfc268c031b023602196c9082005a32255aba022c2395edac6430a9ccac0c16bbcfc0d681e3831d1e60205dd4326c08506f99a959030000930db0747172a41cb8be6f55a50e62b74d2673b22303e071726030b00042bfd53f3f370acc876d39fc9b8c8d0bef07cfc6e6092f7000ae04d2b651b54d09906c866470d931219c18ac0abad964bab9c931de64a9b090a8505b01b04bf30270255c1dd4c1106770d9fd9d193495806595229823181d204ba43a0b6d4078609bbc1e802b1134beab1eea205393264d6cc1c5c04b55605941f6d1471f099025f2dde3997887f00a07e08a23413d605b40078683cac7992076bbae97a0722a112417e69448a70c7b63e11d0ec0156727861ffa3f766230079c0d883f710cca8990ae84cfe13bf82ed4d2bffded6f619e42fc0d3b3c185057e7851f3611361527478e9f8066fb0b664100ae38c5b49c5cde6eccc0f11d303db22adc321a908ec46944c8a8b0031dfe263f8bf30f75b00913618f41754b94fd05b3200097cf84a06234520b8002b30394f817cce0855815b1820d40e38c0a59a2599920110ca79314c37ce32da5d939046f71002e9f6d2daf520b8bccc1513f5448764bcb8156483ec4ae20b5002864a0e3b9e9ae0ebae55ac673defc7e534d3dcc48050fa1d7528e781adab83fc6819d5a4e9cad5bb7aea734a848a401242440ed96c08bcfe0b3894856f6b211c5730cb87faaa9875a83ab6983d7b5f110aa6c017617c79ae708c65125d846439c949b2c8f6222bc87a992bda12db8905f8617895d59771735c781220518ec42ab8d87cd04d9f3a8f5722a9e6482f4c2e7557561b8379e912eaa2ae77376fefcf5005c7eb8df75aa3f72531b3911d60d60f8ac0c2a9636727573b48410010067f58ae277c94c74f63b332615927b33747664a46a201620b19316f81bab7f708c000cb102ca2954c089c3b2644c6569964ace0d2dc1b5f8c7da664f8c74f2aab18d06a90249a292541cd806416a7b2504b8ed5447ecf6d60a683068aabe5fae04d73d354a4b7071f97ebad80a72ad12f7de90333ea29927544f6e9c1369d9bfb5794f2a828c4b5374ce9ccf0854c2f813676e346ad448002a96863100951c7793ed366e4ce344f89c0a8cc9aa908eb5cd82ce95cb19baaa84ba7b0923556162910e9c6e2483a25ebd7a022c50fba2b5c9f05d0052be6f2abd771eb7aed22b23f012c6bfb236daf817de81b5e705a4e0175f7c21eeed446ddab409495076031a545559754d0529c681655da59756e082f747a7d292681284d9a53ea84f37caecfd2d6d9b339cca0ba62869e3ec11943b2193ba75fec6d6f921f7b688d50665e021658b3b44c924f7fb48953c490e69e828bdb4021797f1ebbca89c06c5294abcdbd7af579726f4eb44c7964da4cabd391113800690e1deb8277b13e33917d87e9070906e72176004b0394ee6256e17d85e2900ae487209e3a96a80a955f97daaf4a4be1dbfa2a2ac215101ca4ae7564fa56fdb274f1d06d858aa414d4c155b4c57db2b434717bc9fe9320c1455d9092464245d6c9b7ef43e756ed98c660fee4ea539a3e8feb639be80ca2f7ab87dbe5037772d18432ba7fd4ca307f651aa9c5eabadf1fe20c564f554c7f0084b2fdde25e19bab9e0a32d8ab4d618a9dcd54e04b50ec019dabdad099e93cb2768059e6869c5a481d4b3631b73530133ca073778c93861a91d8b832611712f9db2363274b3b7a2c9e8e6ba2b6600ae24c6efe49d77d384be543c63a049250b46a40578bcd08d4db3e950ee185a337980d844ec3619b9b8940f72b0e643e23deba62672c843a79cc38c54b5b73851163b166792ab623e48fbc17dc7f46c4b8fd74f31e9c9c6693506587604c90cb0415a0370ad9a35b2cde2e02398e4a394740af473cea14eedd83252d1dec2ae8a933b0028a773aba0cee073f5df799baeaf181702ae8a1d736b3cb89c4007270dd463386ca0325bc1266786e81293e4f0852ef55eda80cb8bbd05b0e0334e4d6364e2de0b33fa770c01d6e30d53e9c59e850190a290727660d3c10ee37a2f5ddcf25a808b3b3cd9c5b7b831a5b5418c13018888d5a8a4d6b3adb302c0c448b9a3be0b51237589878933da1abc1e80cb7ad6962a680a607df6d96711e7cdd94a2d835e142f0800e2135d593b5dd86c9066906089e867e8c5b1a14323d10c9df309f96c2bf9ac5ff9e8d368a4d6934dd30350c4496d441c30d98e0ef0892e312f2dc0a56a4483b41c6e5ba63aa5315aa9153832e24708aa438a25dbd1a14b9f8d0c5d9275bdec76c81af02ab5704fabd4122a61e0c8883bc1cbc88e8e64a4b28953599a04e0329d195e82c790645efa46e07e999dbe0a03d6d32d3303e64f10c195cf5ec544079c39d85de3c1c5ce0c2f3b9c177b8b4b26cee58e0c54428decb0449ef1c581ee1a0f2eee05ef2521d4c9de423099539d3a356f1206acc04b987c3b2c516a22b75fabf1e082e1e9b538d24e0db466b42387d00aacc04ba8871d96881e8a9ca951e3c1e535139e8b14e5fe0f728759fef9930fdf534aad67dbb20226d7404d9403cff16a8a83fb2243be46830b39605e8f376567865c8a0e40e1bb68ac6997a0cbf47cd7fc80c1357276346d583fa4512927063bd9d36cb3b9991000578d77c5475266026706979f6331acf9854e8e0c50c0d47a1152d050f68358246c64a6e68dab5a2780b0a6d83cb1d67267628464dc6abb6a3cb8bc7a0ab99608c0b24bdac5df5a7ed25009acc0ded28f7edb3e47b956eb26f477945e706a790922d7f80c0d2f6dd4a0066227b26bffcccd62709f85995dd4f65690a8ab1d3ddf9d1db64e47e60fa1c9fd3a39820b1a4c90fee4430d1774702f8715a0aecb49250ce25b7a92759da026b6f8b491e35ac3f6f67286b20e15c9193a7a0aa1063668d0c07337593836ecbc848133435f7aba794618b8b821a91db93933588ba9d159f1769e42a88868b1ccfd1bdc32e121d59cbc848133436fa786bc4e884fb20d6e475e03c8351a5c2a4f2180c4ad9abd6666b00b5e15380e9c199a3b358a6687ac153c87225669a3b1a071a91bb8b822a246174b469253e8042e4839bb0cf820595773a786a1aeabc085908bddd965a992b49b54704572e0829bbd65e7820761770c1839353c860c2eebf9d01ce772f31406e092720abd767b8ac5de0a3c85a9e331647001541c4866421c13c726216fd0a95747002e8390fbe5256117fdcbedc0c5c66bc1c85e81a7308dc06567734155e433c5e04d56693da261694d6f50136dc2ae2abe85e0a31db8823293d471c7bb810b6a211f7d04e7864a82e952e29fb2e0b29e236507acc00d9f5ee092bdc87cce9835cf3000570ce0b21e6de3143c46f3cf80815327d6c5712ebbfc51b7b3a4c12b01b85e810b866a24e0c28e06c316df6367865dd5b170c31bbb62c0c0a913eb4286865c4c19690059b7635c93ee2d744b676170613793b3e20134bb463401b86a26b85872e9724e57d283c86ea7dce3857129bf7ce802834bd59b300057fa81cb4b00997bc5eb728c50d2c0c52dd5dcaa900128b85ead117b4e73b14b7b0a4afb53832a76ce0b2939c19ac259150db8582dd421af30e959f16eb12e004a052c195cd8ed82ec8cf44981625b3c1670e972ba6452c1c56dd554f10afc0e1179bb18171fcb6a975318802bbdc0e525f54997966a5a800bbab1eae820d8596858e29453c8e0728a7105e04a4d70a9ca4ebce4a006e052f489b7bae41b356a64561f0368aaac787cc731c615802b25c18535659e9009315138b19c4006534197d4276d9a82cad9f1388b0bde41008aa3ef76e0728a7105e04a4d70614ded0e43e7aebd00912a84a34b4b356dc0c5aa21fa65e085e1c559fb24c8e77405e04a6f70216ea94a81c206cb7985d87c91b86b0de304e0b2d0a579555e43804555856c77ba0902ca01b8d2bb60d2cee6c2d96d001b7f46ce88479d60002e07d5d04bf2ae5bea5300aed404975d20d9adeb934efd0ab502975be75dd5a17701b8d21b5c886f46d2f549b7d4276dc0e525a08cfa9d005ce90f2ec42d55b12e37573cf34400ae0803ca1c54b6562007e04a3f7071ac0bbd51a201972ea94f5a818b55436b40d9ea31e4eae3005ce90b2e8e7545022e789b0370b9a886f0f8d8e9d42cb1b80a3900577a828b635d724ea91bb8746a06aa25b85835c44b55810baa021bba01b8d2175caa58975b6ea12ea7496a0b2ea732143e94418e7305e94fe9092e552f0db7ac789d5aaa69092e1072c354aa2132e465352148dc4d5f70a1559e35d6e5055c3a1cd5aa35b8c6770d570df133525de44c0d2fe08aa495f583c20974b76064085dcbfe912e4eed664bf83b7f16df8f85c970af5bb9837d3954ae7c7073f16f2cf790df83d33b0061dcd677e7f5f92a70a902c96ee0023fe894faa425b854a79f708a8b1c4c763ba6d54b993f18e04a561f2aedf61e15b7aded1bedfbe64d3afa63533a3da2750808550c87dfe133f81e40112bb8f02cdc0bcf7fb2699ae346c2e0c0670ff769e8eb3b0061fe7663302b9177cc0d5b3755accb0d5c3a757dd2165cb26aa88aca73bccb4b25b21db898a10102bf19ca0b8191c1d020790c7e482e907c4f7e8ef559892427a05b4f3ab12b9a743be1049fd729af505b70b16aa86a5ec3aa219236dd7a68a8c0851d3b1ebb74ace487d4620248759b1f808d0dcd2bb870b806bcc3d84499e06e577992753aaa557b70b16a886a64bbdef15eba3f3dd918ba5bb2faa51b9d1bd731261bc94e3d4c96a4729362f25cedc0e556d7c5f698aea94fda82cb2d531efa37ba42b9f52de476d6584c2caa5245fbfe633a33ba1d5d9ed5cb906a23e8c19a712184df5d9dd7cfa4f313be119f9709f790a9a4cb3b11d925f1f2c4c1b68a0460d67994677e1e3657f95d5ccf1918f6be40f83d3e8b77beb7e31b4a29c60e2074e852ad1b4eae41b805d20a1ba94c08cb40ab41612d9f3a0a5e58fc63ed005c9116515ac125bf50b74032747dab1a08c601485460f29bace0b412fe1e4f573798d8e9f9f19e3f08cf3939ac4518d0a0a25bcf45b6c6baac591a300bacb6b88ed9195a83cbaebf865cdfc53de3ed807577d908d3138885c54e7c2b7f4842182a128a772c49a7b95e98da950ef67cdf04d88d9c41cab5e358971c484ea5d427adc125a743a954433777fc8355e38c45fc804abbd6130b6a95529bc7f5a4293dbfa2e1df34a34fdea96dd29ffef8dfe9f7bfff7dd424df4b45ad1abe259e092a18faad1887df60bab07a32ed9e3398660df886c6f66a4d3fb46ee43aae776bffdf98e68deff3bdba34ab6fceaf7cfe4fb6aa23363b6c7ab77287d8c6ba2201176cf5005c3e64ca433574eaba7b627073fa75f6f7228e222f2a00152b80fca63ffdcb1fa8478b460210d102eaee962c01a6fa75fe5dabb9f186a3021954766817582b6c862a70c9e5fea994faa415b8eecfab45a706d50a337eebbda14e87421f052e33b07a0cb160f2b1ad4fb7ce148b99fd433b73c15b37fd9046f6ee40d30676a76d73470b7ab27f45ccc4f7b2a35593078be782308677ebd40e61c4b69fd41740890458eb26f5170035c1fa3fff859a357c8f06756b4f637fe8463387f4711dd781fc2931cffdf49a392173fcf19b1654ebcfff664ab62b4b475683ab707cc899c8f29ac98164f60a3a0591195cc21bd9a78a970270bda23b59b5685f875a4a0f56df86ea4c79ced6c0dffab4fdcc35bff064ced05752e28fbe30925ff4ec60215dd8be9466fdfc3dd5fef3bf8a31428a45a20232a87ab46c42ebb24652e5c9a2107a51be35a973ecdae25331beae5f7c6482eb595156d8b1adaa40b21770712a9ce98dec50c55301b80cc26e230753e5bcb51ddf37b58d79e18543aa21e0e87618c3a08e9f57eda086a48898414ad7d0833d057473c3fca8e846e10cdb7b57946d344170b7640dd5fe4bd54e0fd07801178088cfcf1ad28b2a4f6c0d0316d3b3436bab9f5bb28a1e1f581bf57c6eae9b4d0f76e64624cd79039081a5ca2bb4828b4b8cecc0c5279bf468feb1e01d339ed62700173dcaa90616f2fc540cd4b96533e5595ef83fab046e591a2c15660ceb4fcf8e1755d3895df4dbe9bd215471e1083d3d534ab7f6aca36bdb0a7ca11b3b57d3dd035be8c989e2ea679dd94795bf941a544295678ba9f2d4766afb59e32ab018f6931770b13a5856984d95a77756dd07f7bb78902aaf1cada6ab27e8b75f0ed3c3a3bbe8f6be0dbeceebdec12d61eff059f98e90f75cfbdfff22c65938e17bc7a45d99eabff3b6990265072eaee32aca1a22ee091e627e026fd568705d1e5bcb0c2cda6529ac993cc036e6c59e22abc7b0f5477595c6f5c5833be8c595e30240760410dc285e4f4f6ffe4abfddbd4987776ca69dabf3a864e3722a3568cbb21c9356e56653c1e26c2a5c9a43bb3715d0b6b54b6885f1bbc78f1e125f4fae5e108c787377213d3a5e2c18fcc9a9fd06c39fa497d74f9b54796697b091583574b3bdca72ab2582905006a8e4fb313dbf748c9e9d3b448fcaf7d0c363bbc5586eeddf4295cf2bcc3196eed94585c67c766c582ee6803981d6e62f30e7ba6b4d1e1ddc5c40fb372ea3adcb73e8eee5f3e2fd3c387d44800c730a799717cb8c671fa5e7978fd1c03e5d95eb513acb3e3714314c2770b1d46ad5ac5148de2807cec15b351a5ce5fd6b9969314e8cd4f4a3f795dda110a95725f0d6fa3fff3b6c2161e4575eab6668fc8c1dfdc5af2704e09e9e2e1100b85bb6c764bc8adf7ea355f90b69fb8665b46b6301ad5eb2d0643c2b6d5d932f00b665cd123a72603fc9d7c3f3e582a91f1cd911062a3116481703200c2e73ccefbfa92496c421e032249f3c3f2b619ed7b7afa4eb3b568700cb9ce37acc7139adcc5b603bc7220378aa396223c27def1f366cbc5fcbc3c671b1748b125c0b0776f4042e5525326b2da539a3427885b371c05b351a5c6c6fa9923a659a3db8bb3299979d1a568fa16a21f32619aac385034ac6831a7863f75a7a74e94c08286e5ebf461b57e586ede82a82f42a3676f69d0683eedaba91acd7bdf2520130489110605d2daf52e90c80600388c6ddbd3b7f7a15c0ceedb50518d44100a0e2e1bdb0396e58e1718ecb1651f19615628ec5db42e7f8e2e963ba6d6806774a360b2087ccd15057ebbff5d7b0718ffcf6734fe0b23605e57587c960e515ce214db6dd9574709576f606aefbdbe6d0476f8597a27033482fe03219d0b047e48587ba0435c9ca74cc789b0c9510cc74e9dc09f1bbf2b2c3b68cb7c7603cecfe7b8a3691ea02c0c0e426d3c13682c479e578a8fdff4283b9885b21102c135446d9f56e6e1cecc000500d4928cf118056014b9e63f1d6d5f4bca24248b2d54b17bbccb180f66c57cf1152fa56f13aa18e0aede0fc3edb8dc32bb8acf63667e75c593bdd165ce0ad1a0d2e76c1cbe082de8c4c71ab5b7e52d3d7949d79553986efbef6677b7031035e3a4c8f4fec153683ac26c9176c27482e06d7ad1bd76dc1b5d55095185c470f9590dd75ab641b3d39b6bdcaf92079f4ee96ae0d092c237ee51434464c8c3f8f98569897104c7df98829b5601fa92e8009e0dabf633dddbf7353cc71fdca652e732ca0c3fb8b6de788675ddfb68c2a8e6d36c7a302d7cae1dd3c814b6567776ff09ab29485c105de0ad4424b3d1332c5ed32b71154b6da5ed0bdade0da36f13bfaa1759310908580cba0fbbb96d283b347c9ed2ac8994dd9937fa2c5d387d0a2a9836958dfee34e4bbae213466606f5a326b18e5cd184a73c60fa4cb17cedbdeefc5b32774bb283f0c0c903e3c562760c9c40083c47372c33f3c77dc718e6b97cc37e73867dcc0b0f981a60def47cbb2868b39ce759923cff3669101b0a39b42c0858d0376a393d492c165b5b7a0bd800fb6b4aae60b1960ec92aff16a21834b7668b0f710ff1e1bd08cce8ded20e848df4662b7b20695dddcf14debbd1e062e2cf8f31be7c9cb75e7d64d9a3cb40fcd1ad99be68dfb9e164dec47137fea4a13067631a82bcd18d693161960c81ed797660eef45eb0a725deff9f2c5f33010f468d7dcccd2f0daebe245f102139008462b0176fd4cc473cc3668dc80ce345eccb10bcd1bf3ddab397e2fe6b861659ea777f7b2e2a970cbcbe0429ad78b3d0b1d81c5cd41012e64e3581d58e33bfd4df086bcf15a1d1a351e5c72ca13bf1c2e83c7ef9077c62ffbd2f49eb4f0f3f0f66b1cebb05b244830113b1ad62f9cf12e1ea2970f6f8a5dd6e9ba72f102e5cc1c4bb347f7110cb670423f5a3cb9bfa01c036cd9e3fb52d6e8beb46fc7667786bb734930bc752c485b62e6f304aea2d954b1731e3579eb3fece7c72efa5bbfd0cba70f5d01669d230005c2cfd83ce68efb818ad6af72955800159ec98e1a797e0890bbc5b838888c0ecbb2d4423201e25f488f6270710f10ae11637e026f0571ae572f032f07c99c202e5547d634bf6c644fe37778e9b26ac83ab8dde1e370f70a89f059635bd5094c003be8e985635471ffb62de31c3db88f8a562fa02d0559b4f515ed285c4807766da0278f1fbb4b2b047815cf4710985526cf5d9a0c703ddb3a8b26776fee3ebf57f4f2de5557f09f3a7a90766dc80f99237edebb75a5e31c1f5f38414f4eeda3e7a78b6de7871082684c636c0a4ec03a327f48586c939d575c202bf71e1149c0afba70f1ef6b7c9c0b3960fc32509a2e0792593594933af1ff0ef543ab94195c76cd6a10a874b34b647ab27f253d3abc996eee5c498f2f9f71049bdb855dfcc5fd1b229e26efe256824322d2bc42c1a01ba6d2a99c9f4dd5104e11d73942921920abb87b8362b9f06eee1ddf4f77f7aca6472585a66da522b62759e5b52befb7164bcae5463005f03b008f375af088ac2673f72b50b2f30bb5c82db42b79678fe1f50503aa7734c3eeca6c14dac086631e4e9da038a86c756ab85145f936e1f8b8b9355f18e737f76e104e1030961d09862bdd44f7f7ad1140f5f21c76c1ef9a9d197143cd7b2b460b0741984bde6d6e0618303780e3dee11d626e18bbddbc10c3c28683770187cc9303859e9ef3e2c436d3deca1b5155bf869e926ece0c6b35043651ce238589c0fd47e477223bc382c45dc9a981aa616ba726fc1e7559fcd24f0f6f6dda5dec92f702ae4599df56676944002e5bef5bf1322539edde76045b096383e325925213760a402dda95f593299d3d492f07a96d37b768ef59b6665e884a28c06553de2fe715c25165b5b7166676117f87838b5b05c8ef842bcf83c4dd57746144a8dd25bf2cb13b192f925ffa2f933a53618b2a70f1cbf7022e560da3915ef12478f8785cab47455e950cb510a5f24fb7cc300b25e175d4657eb29750f6823a010b79a2aa7826d61b2aa10c2e6bbf10e623f05400ae578592aa7805bb55b1339b4574868ac84e8d48c0f5b070a2e992471a8e2e8cc759f0505be19c88145c900000d7bd95a385cac5401559f21acc6fdd9cb1d59bda2b2f28c2074ee0e22a646ba2b6ec1106b8acf9a872eb3c1d0a26b5a944e64c0dab6a089dfaf6929f435fbef1b996ef5657287b01d783d5e3456099171a09b2c9663c560741181baaa623eeeb5e345b800b1b10becfb657aceaa11f84e7b3fb1de3f25a6ac2ce0c3933e3dbf66d43120544ecd3626fb14a98eccc0cedc025c7bb64d510f539d0ab43dcb47d1b098f612492ebfecab12131af488d7fbf09aaa935bf0e3654c4a784ecce16e0124e1f4345bcb379969977e8877d190bb0385117e3918b3fbd7a0a65700d68df5cf432e4cf5c9bd73fa4fe4f5609931ddfd20e5c37a6a955438e5dc82f1f4e0d780cb93a99c16517e7aa925ce3846a889fbb7ef6417569bc619f247a8707b07847c758223d9125acbbeefc1fe8eadcbeaffa344ea7b2c5a34c8025637e5005d9fbf9a73ffe0f3abc6058c878a1fe3a810b6d1bb09eb24a38a4fd6721c9d9584fd99921ab84e0a5005c123dcd57ab86fc0265ef12bc8748e2fde293506fa1d3823d5c33412c08ff1f09a372cd176c1f3045bc9d179ce2245a0ebcf667baba7c8c180f54a568c17563e140012e9e1f009637bc87f91c307abca534e606555bceeac7c681f959d55d374f21b7b296c195d5ad79886682f725834b5609c14b01b81c54437e711c549617044165b8e37ffcaa9167703d5a3799eeaf1813f23b2cbcaa6259ee9c04c045e35d04b3e1bbb807806bad6562c653f5b48ff8e085bc21025c77974beab3a122164de9272487aa2b14ecbd68e785ef01ac3c376b990c362db908120e8c100fa74bda930a5c0b0776363d85d6cd8843363aa984da814bced6b00694adbbddc68ef528ab5dc3b0e0a21359c1c5840c07d862aaea6515f0dcc8e9fbf058c279213f3f1a47866cbfdcce1f6ad85c3fd2edbca16173038061d3c920b312c0e1362755a1a395b051592b8b2145ad366234e0da3c7940c8676470c981631dba3e69db14948b27414ea76120a17779db7a26b8dc7ac60b70ad1aebfa19000d2a231812800318bc80ce0e48b8c7b4dead04a05852399dc4122db8e02d943359ec627d3c370021967981701f9e9b6d6b3b4b5f14d561776ee0ead1be5558575e39e589f925d9c591da834b4ee4459e981db890fe2283cbe92821593504b97dce0978602437c2e7bcde3316a95515449e22c05525bd0644352f2f73b2db1c1cc9504dad1e50374fa10a5c39df34529e5e239fa4a943a2aef6e0925bada18cc06ec7e3c44d06171af77b597091d3662c7ab400f393dc8e95f5420f0b2798e082ede5453a27848c778cc46255d03b1270416a21f462bdb75c9ea44b2bb5d438fcae7f78cc4b157844390aa7c5389d8d6cedc0eb45354904f3c1fe88155cb2e4023d5c3b31f99b870db0385dcb0bb8384120bbdd0721e96ff2a6843213b3996c7ffdf8584b70c9312f0e14aac005bb6b64bb4fa9cfa7ef452c2db0f8b07792c580b1aa8366f26ef102bab36498092eb8e3c5e6912480e1fdda6d1a6e694f32b8b061426a59ab22e435d431b69512a79c70cc8bf3c75465e15c7630a9cd871131809c550e4684472b51cc8767f9052c956a08a031230bfb26412083ba6d27ad42eacf3cdc0bf6332acd21b5b0be762dca5925d425dd2965c0a52aff579dc185bfa35189f5081a2752edac6046303db207fc9468b817765a30841f6aa092698d71cbaaa115bcbc8970e532c613f586628055ccc7b80fee1749f0db8b3343548e6776a18e9f35367ba8a8547bd94ba8536c2b25c0757562784059c51038e0ce5af3e5974a06c68996a2c9138c8510586770c5eade8f177971667089ffa2165555e828310a5b3f4302721b085d5542adc12597a1b04b5e753835f20cad8d6cdc289ad20edd49560defaf1ca3e518235151f9fc64d5a993d032e4be96baa43ba5d4c992d6445e55749febbb4abad48b48554b3770614eb26a684d394a3679c9ccb08659e4e644d68c0fee0e76a887befc9b52e0b2532d9c76393b4ab4da166fe24c0d263f62687edb855ed786ab8c55da08abf4baf4264c5970712a949c6768dd01616b416ad9e9e7b676978b672bd9b649e5fedc88c17525eb3b01ac7b05a3844b5ea739b99599a8ec68a8fc76798a01b8e2d08d9777c1ab73fa86b5bac6a278b6bbb665259de1acfd424c26dc30852a0fada0ca927cef6ae1e6e926b8f07e50407967d9707dd4568fde493866aceb8a0d141b8eac6d04e08a13b81099e79e8656b21e5c1dcfd4a398bc7b05239587fdc11901e744e5be4554796a87678001480016e68fffe3e7b2fe9f68012c2fadabadb14b99b0d65873f99ebcfe678704e08a290d4ace31941bede305730607ef64589c4883c9c920d591496c3799debeb2b5f4f2cc2eaa3cb2a60a6c2ef713e94fafa4217e3e35aca51ef696c7e031885b54635d410c22f9a00eb965b50e5d9e52125c72cb356b4728bc74b91295cfc255051d6d83c93154ffc64a2c8da1c2418a3e5a3729248dc9fcecd1f55459be992a8f6fa4cad2a5f647b8f66f22becf06bf4ee05285506c3b3fbd5a6f9654886761adadda4b00ae38810bbb98b519a49cc4e9355b03922299e0825d247bf8a2f5f6e15d94677e2100ca5918b8077e974af6166c2b550730c43903c915c7da2e59e7c66ea65a44ce35f3aa1a5aab64130dae4bd37b9860c2cf32c176f212ab8253042e6b7cc70ad643bd3f4c297bebc42b75dfda328d7bc0abcafa91c913802bc6b27faba45211ab8661f53f1ac6bb105e103d190d105c9bdf9ff676a81362c4e3ffe7277c630b30a85a722d131300c5e03afcdd4729636f41dbe078a5ca8baa5a67ddcafa530a5c486be19768ddcdd4eac7b488bd86898e773dda3e4f9cef7c61e9682ae9569f2e4cee2c807035ef67ba94fb331d9bd98fcaa6f6a60363bea503435bdbaa8ef81e6c2afc2b4badeb798614ccfa8e4e4ee9416593ba8b33834177b66489e756ec5ea0657ccb4e25b4db9874396c2165c105427a8bd7972e7b0dbd0694e39567f874e77cc1d060ec93cb26082acd19154625593f0952fd0d743067245dc81d16022c382e00ce638b465059ce08dbefda5159de58319ef3ab26d3b5f53304e8e29996158b4aa83a4dd3f420f6af1580cb2fbb4beeb0aa7ae958187ef15e730dfdc833843400830248670a26d1a1c5a3236678273abd7c82082c336143c0f3fc7c06e8f892717471cd54bab9719690b07e1472469aa88b3554c5ff542aa1cef6564a804b6e16aa0218f47339435a26afb986d124b932982005fc66722bc3dba9720081df40b6124bb768d4498024dac031543fabed25034bb74e4f29092e2e3f9101e64450235995b4e6a6796dffe524a1c06c7e333000c2aa23eecf7612c0e3654cf81c7f87a527df0fe41700b19140d5f5ac1abb1c70670d1c63ddbcac333ea3c3292669012e6bf1a48a902ac59e23feac57d5d04b9f763031a488574664c696999eed1b901f6a57b4c463609b10aa602420f4027a2f9d75adb984000c341539bea922ddd5c1940317b75d4349378004c2cfb0c9acbb98ac4a7a8d79b9310aa481d38e0e0605b326da1b170f6f263601a78d042084c3c60f173c1c4faaba2cac35d6d6badebab54f4b1b7045d383c36b3a94934bdec97900464cb7c24b1968762083faea870b9ecb4b52451a05e0b2b409f012f37272c9dbd95950a9d215585e36162729eda5a49fabc8753a992400578431324f8e0da98bab95a261ae74223b8fa89dede5b5a49f635bba766f0ac0e5c10982188a97645e956a68b773435d8a3c81755a585d52e29368a70917b7977432b39cc5b02723510dbd64c1735b3c5dce2f0ec015438ccc8b6343a51a42f5b3f3064692a4ab3a162919c042ac884b76909be805ec9050916c305e54427664e85c491c80cb8550a9ead92daf500dedecad48c0852037981a295c286a8c547a210e07492313ee877b3101b8008d4c76ae6c7c1663c07ddd9264ddecae68bd84dcf7241d1d1935065cf2a9295ea497b561a85d4e6024e09241022080f12135ac60b0922aeb3d52e2424300dcae54271670595df25ebc849c91910a591601b83cbae5bd94a25803ca7e824ba5a681e159fab8818d094091a516ee214bb5447a0cad49bf5e5442ac43ba4bad1a032eb92ecccb017172aea15dd6821fe04a0777bc0c2e2fbd09d9fd9eee52abc6804bee24e5457ac9e5ff4e09b535055cc83cf1022e2fbde06b8ad4aa51e08a447ac965284e397635055c761e5339d6e5a5bc84a596ce2da80370c528bdbc780ed9b1e104ae9a1244b68b73c9592a5e1c199ceaa473697e00ae04780eb9fb9213b8e259c1ab13d93975185c5e9ad0705c4bf7eae1005c3ec4bdbc646da0afa113b8e2995bc871281dc0e5548a820dc62d23839bcfa46b0e61002e45d686f5206b95f472dab5518612b723770c6023f70eb12eabeb9d83c6877a3510764cbc33e39d36987b5b677b2e86d4b9c76000ae38e41cba65cc97e78f498a53831d04bf4cec5cd576ad4d2d938e7cdfc83c49d34ba1672c84921aa7f9df5aebadab533aa73905e08ad2357f74e1705faa726339e6146ad5f5ec0182acaaacdf879747626f952c1841d7578e77540739cd29958a1c0370f9e0dcf092d47b2e7724edcf1eeed8c0259ed2cba93559bca516bca14e1bcbded983e9fa8a71813a18802b3af510e0da9395e958f29e88aeb5e2047b8912d1ccd42e1b1e840da778c6c088cbf70370d520e2bc43bb83f32e2d1d2d9868dfdca1b68c164947a47471c163c3b103175adab177b026aa8301b824ef211f0fabf21e42ed0113814a168e4cb8d710aa1982b8567738aa83e36aefedb40f4360a3e177a2b2b3d2b92f4600ae18fa225aedafbb6b269a8cb477ce10cfa5177e01cbade9288097c8ac0c6c30fc3e8ecc1b52e34af70370c5687f593bf5323381ec9c1bf1706c38b57393c9ef1e8800b55de0184e0c3b7041f2d7743b2b00974b5f7a6bf606984806989d7ae8b7f4f2daa4d3eff66e7689bafbe70f0b790f70f6a84a496a52164600ae283a46c16e60809d5818ca5476de433f6d2fb7cc88783dd7ced692d541a65ff247853830d2b9d94c002e1f83cbb207913d8632d9790ffdf21c3a65a2c7331c60e72164efa04c70f6c8c0aae90e8c005c11808b01767de9a830c6b2b3bfc0e87ed8404e6ef07895bfd8a983b2775026c406195848880ef8270097e743ce39c30000db33b53fed9d39288c0e2c1a45070d40c954be6c7ccccc6ebda71bdddc149b5b1edf57ddb774c108e5bcf74ee865a636d5e42c8c005c51824b762dafedf82e151b00db376b5008ed9f9d49071755492c994ec40030947158efe746bfac9e1235b06e6d9aa5bc274eb5b4ce17b4636c4f5adffeed10091f802b0057c4e062806d6c599b96b4799b768deb691eb56a1eb93a6f281dc91b1b46e54bc7d383a2b951d95baafbb9d1a31d91a9a315c50b6c9f7538770c95ce191c3657cc3faf451ddadaaab699e214802b0057d4e0021dcf6c4eb95fd4a67c83b1768fef49a5b37f0aa183f3878a80af8ac0c08f3d32feddadb36defe346c7f2c7797a0e407563e34c3a6180dfee5e078c0dc33a47cc1bf3cffba23ad81e802b0097277ab1a3133dba788a0e0f6a11062e50e998ce94d7dc90602deb50d1d0afe9e09ccc103a9cfd331d5b32ce9620c92e174e13f6cdb35dd9610c7f7dc34cf119a77b78213ce3a1213165c2bd11e83eb36292ebf7310febdc305fcc1d74787cd7ea00bb04aeca0b6be8c59171012f05e0b2d0ea7af4f2f1af84ebf9e3070260aa3cc3dd63bbd35263f7ce3776ef75bd3ea5fd53fbd1a1b9834d3ab2609868bb96aa84f1cbf301619e982fe68df9df5b33310c5cb7f7ae11efee65c5037abebe71c04f01b8aaa9f24c2e59af67659bc300767cc1cf543aad1fadeaf01e2d3176f1658614db3db2b3c8e2602a33181412e8c4b2092945280c95e78179f13cf1efbe497de8d4a2e11675f94b21ede5ebe5cd03014f05e07a45c64e6b77559cd917c24cd70a0c9b64fe103a943590b667b6a1a5cd6b09da36a085f83dd3510384f0189e5c3e417bc2388f2e1c1632fecdfd3e37e7b6ae7b23315ffcfed62aa9f278f32caab87545f9de5e940e0ec01580abca5670ba9e5f2e178c64f6855836968e197649d9fca1b4775c0f2a30a4d73263775fdbf9432a99fc9df8bd20e33308069f5a3e515bc2f88e2e18668e19e35f6d4829cc6765dbba21f3b9bc744c75e3d4ddb95479ffa6ed3b838a1d802b905ae4e50223c9007bb876325d5936868e1912eac89c9fa8f09bfab4fccbda82b60f6a297e2fc89008a70cc90047826e8471f13831078c7b45ab3a620e1b7a3416bfc3dfcee68e10a53732b05e563c737d67355d7a6504b6562e79bd2a9fdc178c25ab89f70b2709e6832d563cbc23ad3498b3c060ced5edead2be315dc4ef41a7968ca5b32b276943180f8f0de35e6b6c0e183768d79076e2f7277386d14d4b031ad8a15eaf97f74e05e0aac904ef56241776ec67070ac31c1dd8d9cfe78da4b2ac1f6973afc6b4e2abda82d675aa4ffbc776a51306a39eca1b45e7564ea6f3aba6248df07c8c03e3c1b8303e1e2bc67d6c5e269d5c344cd896612dbe7f394c915ecfb77c1580ab46c6b5f67c47d15e2a4f22830c59f40727f5a2f506e3ae349816849f4b0c66863438573041a42b259af0dc938b868b71c863dbd8b5211d9ef63d9d32407575f958a1f286cccb50875fdcbe1cd57b826610802b706444be2bc3d161d3fd08eae2af864d76687c375af7755d5a6d3031083f1767b6a2d306935f583559646fc49bf09c13f33369efcfeda9b0751d732c1b0d801d18d7558ce5b2b12160cc6127be14653b3a2e5c257d0d766c64042a616cd7f3ebe7421c1d2ababd6a021d1ddf5530333336684bb78674d000dfd9fc9174a970aaef746ae110717feb73b7f56a227e0f097bad609c1254c2be32d45f2f8e8b40350cc0453be67d4e2327f4a3963f4fa4dd67ee905f97cad1a1a287eb26d3d5dc61b4b75f335adff60d2a6c51dba42d5d1bd0bea16de8f8cc7e747ec968515b15299d9c3788caa6f4a6e2815f8afbc9f75fd7a60e150ff8924e66fd20324d1eac9d643f56c4afa2b0af54d7d12b0fa871e64c5a34fd1b3abca07100ae74a0f38bdfa73559ade987319954776036fde75e1b43a8ee9862f2fbfaad7c87a793ece53eea877ef894b6b57f83d6b5a865802094b676fd80b6f76ee44af85ca1e2fb1b3bd415403b35adb7f0fa01dc6e638a550d94af7b4f2ae82f437784bcf73f7cb74a6c6ed3a7f4109b5d00ae1420ec8a58b02e2347d25ffae787814945a3379cf51d6050139f16cd8d0864dc87e2fcc4ce74f8c766b4ebdb7ab4a5556d51e6b21e52c723edeef531950cf8824e4dee4ed7f286d9aa7b4a506d9a4e15a776d3cbe7bff9f62eba2e3eea691d20d9a051006cb797bc15802b99840560150f0be3650155f4871fb6d2c5db4f7c071818f4c5d10de27c2da75eef5e0087ae4a6ee476528b53af79d116bb249f5edef077a3595b763dea7581a6018d039a073490005c7156f1a0b3dba978b15093a92514afebe5d51355676dedce1607c4413a440b345f68c35471bc2a408fd32045b9cbc9227af9eca1aff3c686858dcbaf358226824d34d554c90cdd1d0fd0d1fd0413d3ef7aaca77feaba8afea1533e151ebc183f80ddbf46152505d52797184c0d6901b0f11141f122484d48271cdc80c3f44c408120ad2e1f89cb9c1b4ddc29de6f3cd68ded36069bce922d43277b092f2cee60ea984b7fd76e1efda7d6b34cfa6fdf2ea07b8f9f513cafca5f4aec8f0a32981eccef1bedce76ae463ebec97769c5d7f015a5d5efb6ed1cfafb0e8be81fbe5d4affd46d4d5cc1868d18da8d4e604b1ab8a04f47e27c8886feb1cb0a2199feae7d76089854d4775131c5fb8214ab3cb822792797405a19aa6abcae9d277e757dcf580bac0936ba784937808d6db6643a4832126d3b61d2f10214160bbbe4df7fbdd0759155b4f3e4b5f803ecf96f8e522c6e74b6d8574f6098dbdd90fcffda7b71c4ef1c5a04a4db3f765e1e37e9962c153223513614c4763c5e1cdb4d5ea4931bd519544089ba84142b2b8c3fa80c498967c5fb6a3e7143ccef5f509b2c53ba41f3f09b5fe010833d9f08a065c41b54b1b8ca9d0085dd0e3abd2f0b2ad1b48dc72891179c0a7103551c5540f9cad979d2f775504937bf55496850906829072eec0e7101541c1711f45f3bcda78bb71e251660cf1e0a97b86f769501d878aa80f275e4c22df1cee2bd2e76769b5fd22c1eb659463c02bc7ec5a2a083c3bb170f09e544cd276da2645c31393c120caa58ecac78800d36dbefbaafd50a60be832b5635305980b2523c635fae20bb71d63bc8a0fe2518547cd519b82ce9c00a23836fc03fb0d722051b78575b7045ab0aea022899b02323f134999700999dd303a032fe9e0c50e1ea9455a41fb06cec357890bd020dde6cedc08540b0ec1277333c75049495fa2dde4b3a5c21ae7b048013e0fd73baa66d284b096029a59a61abb901cdaf142bdfc0c5761640253220da6485012c1500652518ecc9be84c3e315b812e501b4bbd61cf82535816521372fa21ff65786dfeaa000cfab09609790072dff2d5508768516d2eb950d06a975e3ce7d910d61a574f40cc64b554c847a98e147d685a90e1ae2d61a10b44aae545c0ca84189bc2edc7c209e294b4d76d5bf7c7487fa64adb3dd08e22569e1194c0760b177d18bfd156be574cce092332f5471286b941d804bb5c5005381e1e3edd64630f6c311ab95529383cdb8de1fb8d071ac50ddfc1e9b969ec138832b56ef6146ac1918b213433511004e1e70b4797fc926307d3caed3976f52cfb9dbe877ada62a9f3bb2b0bcda7358924fcf9e3da37fee30c375bcc84ef7ebc2f8d205582a70214666073024ff26055c724c0bf6955dae987522a9ba287e322ceca64139db5d9ff9cf3d965607988f6fa2b3172e2574439854b033ad80a5f205c0c1e6e4dc4838b864a9c503b49b8cac1aa6aadde5a7f710ea9f67fbc578afb9fbaf5481cbb0bbf237ef8bd821136dad5abc730675001752a854e68b4cd1e61f66f8616b61608e93e9989bf27697195cee931735b3e27bd1648fb798b54f800b76979d33c36f806113f92fed66a63db8589382b9e2541f168d6b3e23560fa1273bca227653d5ee62ea347b47429d02a66a78f504fd6df892e8334e3c020c7660ba7806ddc0259b334ec165849b12022ec4006cddef362417c2211d25d51768d1eeb389f3b6199b139a98427afdaf4ed3638ad9b9012cdd3c836ee092eb00adb698557a25045c729f0b5b4786073d3795097d37ca2edff3a45ef9c1acd3b79ea65f4f1d897b50fcddcca5690d2c2b2f86f80a1c1c1b20f4e8882bb8f000f981d6662f5e55c37458a43732573b26f7fa99d1005574c5cec3fedc2bab28a59371fd74c5bbc56563f11c66c4e2c8f0aa12aa54c354766ac8d4397b5f425285e0561f99e75fbcc99a75326175498d00960c2e9523cec9b11169526f462c8e8c487305e580b21f3d2fb420639358bcf7424272f03e1ebac4d7fb7158215d5dee6e5a941dff3a393622c9dac888a55e2be2ec7629a09cea1ec310fbab4b8e697fa512a3c2fe42c26fbabadcddb2e2edf8d7c9b11149ce6144e0925ba2451b0ce65413af8e9054a17feb5790ba754e35919c04838b6303fd367d051772ac426255d1368b31068e3cc474925c01a51fb9b575f3d29acd33b880d674c9b208282057ff808b63c34b50f9ff035bede88965ec2ad60000000049454e44ae42608289504e470d0a1a0a0000000d49484452000000d7000000d70806000000897dc4b50000373c4944415478daed7df77714d7b6a6fe8879e9cefc7267d65b33f7be993bebad3773efbc07f6c5016363636cc0986b1b9b8cc1981c6cc0062cc0e49c4124814012412491834822482401226392c9395a20f6d477c42e9dae3e15babbbafb74ab6aadbd105277d53975f67776de27e379412d4a652a9f518beabff33afdf5af7fa566cd9a51d3a64de9edb7df16ff677ae38d37e8fdf7df177f6bdebc39b56ad58abefefa6b4fd4b66d5bfafcf3cfc5f7f97eefbefbaef81dee05c2fff17bfcece57e5f7ef9a5f95d993ef9e4135bfaf4d34f95dfb1528b162da875ebd6d4ae5d3bcf734c34619c5813bcb3d5436a53aaf3a01d65a4f2e0ef2eae06162f16d33befbc23c00466f38b2900caf7de7b4fdc1f0006c3376edc58fc1fe073fb7ecb962d4d10e0bb0d1b3614e37cf3cd3743c61e09611cb8874cf5ebd7a70f3ffc506c3698bf8e40c32683b1620e433abc16804b376ad5e47525a022914cd1109e81e7d5a953c794924ecf6cdfbe3d7df5d55702541f7ffc719864659000b85e48f57d277aebadb7a8418306026cf17e3701c0d2005c597d5e33990752c34f09e585c0a8fc7c4809a7cf32b03ef8e083908d00520fbf0793f93936bc0bdc17f7c7bb514975fc2dd1efaca6012c25c15532b1b6a90a2693415845741a032405181daa1a3e8bef78b1cdfc268c031b023602196c9082005a32255aba022c2395edac6430a9ccac0c16bbcfc0d681e3831d1e60205dd4326c08506f99a959030000930db0747172a41cb8be6f55a50e62b74d2673b22303e071726030b00042bfd53f3f370acc876d39fc9b8c8d0bef07cfc6e6092f7000ae04d2b651b54d09906c866470d931219c18ac0abad964bab9c931de64a9b090a8505b01b04bf30270255c1dd4c1106770d9fd9d193495806595229823181d204ba43a0b6d4078609bbc1e802b1134beab1eea205393264d6cc1c5c04b55605941f6d1471f099025f2dde3997887f00a07e08a23413d605b40078683cac7992076bbae97a0722a112417e69448a70c7b63e11d0ec0156727861ffa3f766230079c0d883f710cca8990ae84cfe13bf82ed4d2bffded6f619e42fc0d3b3c185057e7851f3611361527478e9f8066fb0b664100ae38c5b49c5cde6eccc0f11d303db22adc321a908ec46944c8a8b0031dfe263f8bf30f75b00913618f41754b94fd05b3200097cf84a06234520b8002b30394f817cce0855815b1820d40e38c0a59a2599920110ca79314c37ce32da5d939046f71002e9f6d2daf520b8bccc1513f5448764bcb8156483ec4ae20b5002864a0e3b9e9ae0ebae55ac673defc7e534d3dcc48050fa1d7528e781adab83fc6819d5a4e9cad5bb7aea734a848a401242440ed96c08bcfe0b3894856f6b211c5730cb87faaa9875a83ab6983d7b5f110aa6c017617c79ae708c65125d846439c949b2c8f6222bc87a992bda12db8905f8617895d59771735c781220518ec42ab8d87cd04d9f3a8f5722a9e6482f4c2e7557561b8379e912eaa2ae77376fefcf5005c7eb8df75aa3f72531b3911d60d60f8ac0c2a9636727573b48410010067f58ae277c94c74f63b332615927b33747664a46a201620b19316f81bab7f708c000cb102ca2954c089c3b2644c6569964ace0d2dc1b5f8c7da664f8c74f2aab18d06a90249a292541cd806416a7b2504b8ed5447ecf6d60a683068aabe5fae04d73d354a4b7071f97ebad80a72ad12f7de90333ea29927544f6e9c1369d9bfb5794f2a828c4b5374ce9ccf0854c2f813676e346ad448002a96863100951c7793ed366e4ce344f89c0a8cc9aa908eb5cd82ce95cb19baaa84ba7b0923556162910e9c6e2483a25ebd7a022c50fba2b5c9f05d0052be6f2abd771eb7aed22b23f012c6bfb236daf817de81b5e705a4e0175f7c21eeed446ddab409495076031a545559754d0529c681655da59756e082f747a7d292681284d9a53ea84f37caecfd2d6d9b339cca0ba62869e3ec11943b2193ba75fec6d6f921f7b688d50665e021658b3b44c924f7fb48953c490e69e828bdb4021797f1ebbca89c06c5294abcdbd7af579726f4eb44c7964da4cabd391113800690e1deb8277b13e33917d87e9070906e72176004b0394ee6256e17d85e2900ae487209e3a96a80a955f97daaf4a4be1dbfa2a2ac215101ca4ae7564fa56fdb274f1d06d858aa414d4c155b4c57db2b434717bc9fe9320c1455d9092464245d6c9b7ef43e756ed98c660fee4ea539a3e8feb639be80ca2f7ab87dbe5037772d18432ba7fd4ca307f651aa9c5eabadf1fe20c564f554c7f0084b2fdde25e19bab9e0a32d8ab4d618a9dcd54e04b50ec019dabdad099e93cb2768059e6869c5a481d4b3631b73530133ca073778c93861a91d8b832611712f9db2363274b3b7a2c9e8e6ba2b6600ae24c6efe49d77d384be543c63a049250b46a40578bcd08d4db3e950ee185a337980d844ec3619b9b8940f72b0e643e23deba62672c843a79cc38c54b5b73851163b166792ab623e48fbc17dc7f46c4b8fd74f31e9c9c6693506587604c90cb0415a0370ad9a35b2cde2e02398e4a394740af473cea14eedd83252d1dec2ae8a933b0028a773aba0cee073f5df799baeaf181702ae8a1d736b3cb89c4007270dd463386ca0325bc1266786e81293e4f0852ef55eda80cb8bbd05b0e0334e4d6364e2de0b33fa770c01d6e30d53e9c59e850190a290727660d3c10ee37a2f5ddcf25a808b3b3cd9c5b7b831a5b5418c13018888d5a8a4d6b3adb302c0c448b9a3be0b51237589878933da1abc1e80cb7ad6962a680a607df6d96711e7cdd94a2d835e142f0800e2135d593b5dd86c9066906089e867e8c5b1a14323d10c9df309f96c2bf9ac5ff9e8d368a4d6934dd30350c4496d441c30d98e0ef0892e312f2dc0a56a4483b41c6e5ba63aa5315aa9153832e24708aa438a25dbd1a14b9f8d0c5d9275bdec76c81af02ab5704fabd4122a61e0c8883bc1cbc88e8e64a4b28953599a04e0329d195e82c790645efa46e07e999dbe0a03d6d32d3303e64f10c195cf5ec544079c39d85de3c1c5ce0c2f3b9c177b8b4b26cee58e0c54428decb0449ef1c581ee1a0f2eee05ef2521d4c9de423099539d3a356f1206acc04b987c3b2c516a22b75fabf1e082e1e9b538d24e0db466b42387d00aacc04ba8871d96881e8a9ca951e3c1e535139e8b14e5fe0f728759fef9930fdf534aad67dbb20226d7404d9403cff16a8a83fb2243be46830b39605e8f376567865c8a0e40e1bb68ac6997a0cbf47cd7fc80c1357276346d583fa4512927063bd9d36cb3b9991000578d77c5475266026706979f6331acf9854e8e0c50c0d47a1152d050f68358246c64a6e68dab5a2780b0a6d83cb1d67267628464dc6abb6a3cb8bc7a0ab99608c0b24bdac5df5a7ed25009acc0ded28f7edb3e47b956eb26f477945e706a790922d7f80c0d2f6dd4a0066227b26bffcccd62709f85995dd4f65690a8ab1d3ddf9d1db64e47e60fa1c9fd3a39820b1a4c90fee4430d1774702f8715a0aecb49250ce25b7a92759da026b6f8b491e35ac3f6f67286b20e15c9193a7a0aa1063668d0c07337593836ecbc848133435f7aba794618b8b821a91db93933588ba9d159f1769e42a88868b1ccfd1bdc32e121d59cbc848133436fa786bc4e884fb20d6e475e03c8351a5c2a4f2180c4ad9abd6666b00b5e15380e9c199a3b358a6687ac153c87225669a3b1a071a91bb8b822a246174b469253e8042e4839bb0cf820595773a786a1aeabc085908bddd965a992b49b54704572e0829bbd65e7820761770c1839353c860c2eebf9d01ce772f31406e092720abd767b8ac5de0a3c85a9e331647001541c4866421c13c726216fd0a95747002e8390fbe5256117fdcbedc0c5c66bc1c85e81a7308dc06567734155e433c5e04d56693da261694d6f50136dc2ae2abe85e0a31db8823293d471c7bb810b6a211f7d04e7864a82e952e29fb2e0b29e236507acc00d9f5ee092bdc87cce9835cf3000570ce0b21e6de3143c46f3cf80815327d6c5712ebbfc51b7b3a4c12b01b85e810b866a24e0c28e06c316df6367865dd5b170c31bbb62c0c0a913eb4286865c4c19690059b7635c93ee2d744b676170613793b3e20134bb463401b86a26b85872e9724e57d283c86ea7dce3857129bf7ce802834bd59b300057fa81cb4b00997bc5eb728c50d2c0c52dd5dcaa900128b85ead117b4e73b14b7b0a4afb53832a76ce0b2939c19ac259150db8582dd421af30e959f16eb12e004a052c195cd8ed82ec8cf44981625b3c1670e972ba6452c1c56dd554f10afc0e1179bb18171fcb6a975318802bbdc0e525f54997966a5a800bbab1eae820d8596858e29453c8e0728a7105e04a4d70a9ca4ebce4a006e052f489b7bae41b356a64561f0368aaac787cc731c615802b25c18535659e9009315138b19c4006534197d4276d9a82cad9f1388b0bde41008aa3ef76e0728a7105e04a4d70614ded0e43e7aebd00912a84a34b4b356dc0c5aa21fa65e085e1c559fb24c8e77405e04a6f70216ea94a81c206cb7985d87c91b86b0de304e0b2d0a579555e43804555856c77ba0902ca01b8d2bb60d2cee6c2d96d001b7f46ce88479d60002e07d5d04bf2ae5bea5300aed404975d20d9adeb934efd0ab502975be75dd5a17701b8d21b5c886f46d2f549b7d4276dc0e525a08cfa9d005ce90f2ec42d55b12e37573cf34400ae0803ca1c54b6562007e04a3f7071ac0bbd51a201972ea94f5a818b55436b40d9ea31e4eae3005ce90b2e8e7545022e789b0370b9a886f0f8d8e9d42cb1b80a3900577a828b635d724ea91bb8746a06aa25b85835c44b55810baa021bba01b8d2175caa58975b6ea12ea7496a0b2ea732143e94418e7305e94fe9092e552f0db7ac789d5aaa69092e1072c354aa2132e465352148dc4d5f70a1559e35d6e5055c3a1cd5aa35b8c6770d570df133525de44c0d2fe08aa495f583c20974b76064085dcbfe912e4eed664bf83b7f16df8f85c970af5bb9837d3954ae7c7073f16f2cf790df83d33b0061dcd677e7f5f92a70a902c96ee0023fe894faa425b854a79f708a8b1c4c763ba6d54b993f18e04a561f2aedf61e15b7aded1bedfbe64d3afa63533a3da2750808550c87dfe133f81e40112bb8f02cdc0bcf7fb2699ae346c2e0c0670ff769e8eb3b0061fe7663302b9177cc0d5b3755accb0d5c3a757dd2165cb26aa88aca73bccb4b25b21db898a10102bf19ca0b8191c1d020790c7e482e907c4f7e8ef559892427a05b4f3ab12b9a743be1049fd729af505b70b16aa86a5ec3aa219236dd7a68a8c0851d3b1ebb74ace487d4620248759b1f808d0dcd2bb870b806bcc3d84499e06e577992753aaa557b70b16a886a64bbdef15eba3f3dd918ba5bb2faa51b9d1bd731261bc94e3d4c96a4729362f25cedc0e556d7c5f698aea94fda82cb2d531efa37ba42b9f52de476d6584c2caa5245fbfe633a33ba1d5d9ed5cb906a23e8c19a712184df5d9dd7cfa4f313be119f9709f790a9a4cb3b11d925f1f2c4c1b68a0460d67994677e1e3657f95d5ccf1918f6be40f83d3e8b77beb7e31b4a29c60e2074e852ad1b4eae41b805d20a1ba94c08cb40ab41612d9f3a0a5e58fc63ed005c9116515ac125bf50b74032747dab1a08c601485460f29bace0b412fe1e4f573798d8e9f9f19e3f08cf3939ac4518d0a0a25bcf45b6c6baac591a300bacb6b88ed9195a83cbaebf865cdfc53de3ed807577d908d3138885c54e7c2b7f4842182a128a772c49a7b95e98da950ef67cdf04d88d9c41cab5e358971c484ea5d427adc125a743a954433777fc8355e38c45fc804abbd6130b6a95529bc7f5a4293dbfa2e1df34a34fdea96dd29ffef8dfe9f7bfff7dd424df4b45ad1abe259e092a18faad1887df60bab07a32ed9e3398660df886c6f66a4d3fb46ee43aae776bffdf98e68deff3bdba34ab6fceaf7cfe4fb6aa23363b6c7ab77287d8c6ba2201176cf5005c3e64ca433574eaba7b627073fa75f6f7228e222f2a00152b80fca63ffdcb1fa8478b460210d102eaee962c01a6fa75fe5dabb9f186a3021954766817582b6c862a70c9e5fea994faa415b8eecfab45a706d50a337eebbda14e87421f052e33b07a0cb160f2b1ad4fb7ce148b99fd433b73c15b37fd9046f6ee40d30676a76d73470b7ab27f45ccc4f7b2a35593078be782308677ebd40e61c4b69fd41740890458eb26f5170035c1fa3fff859a357c8f06756b4f637fe8463387f4711dd781fc2931cffdf49a392173fcf19b1654ebcfff664ab62b4b475683ab707cc899c8f29ac98164f60a3a0591195cc21bd9a78a970270bda23b59b5685f875a4a0f56df86ea4c79ced6c0dffab4fdcc35bff064ced05752e28fbe30925ff4ec60215dd8be9466fdfc3dd5fef3bf8a31428a45a20232a87ab46c42ebb24652e5c9a2107a51be35a973ecdae25331beae5f7c6482eb595156d8b1adaa40b21770712a9ce98dec50c55301b80cc26e230753e5bcb51ddf37b58d79e18543aa21e0e87618c3a08e9f57eda086a48898414ad7d0833d057473c3fca8e846e10cdb7b57946d344170b7640dd5fe4bd54e0fd07801178088cfcf1ad28b2a4f6c0d0316d3b3436bab9f5bb28a1e1f581bf57c6eae9b4d0f76e64624cd79039081a5ca2bb4828b4b8cecc0c5279bf468feb1e01d339ed62700173dcaa90616f2fc540cd4b96533e5595ef83fab046e591a2c15660ceb4fcf8e1755d3895df4dbe9bd215471e1083d3d534ab7f6aca36bdb0a7ca11b3b57d3dd035be8c989e2ea679dd94795bf941a544295678ba9f2d4766afb59e32ab018f6931770b13a5856984d95a77756dd07f7bb78902aaf1cada6ab27e8b75f0ed3c3a3bbe8f6be0dbeceebdec12d61eff059f98e90f75cfbdfff22c65938e17bc7a45d99eabff3b6990265072eaee32aca1a22ee091e627e026fd568705d1e5bcb0c2cda6529ac993cc036e6c59e22abc7b0f5477595c6f5c5833be8c595e30240760410dc285e4f4f6ffe4abfddbd4987776ca69dabf3a864e3722a3568cbb21c9356e56653c1e26c2a5c9a43bb3715d0b6b54b6885f1bbc78f1e125f4fae5e108c787377213d3a5e2c18fcc9a9fd06c39fa497d74f9b54796697b091583574b3bdca72ab2582905006a8e4fb313dbf748c9e9d3b448fcaf7d0c363bbc5586eeddf4295cf2bcc3196eed94585c67c766c582ee6803981d6e62f30e7ba6b4d1e1ddc5c40fb372ea3adcb73e8eee5f3e2fd3c387d44800c730a799717cb8c671fa5e7978fd1c03e5d95eb513acb3e3714314c2770b1d46ad5ac5148de2807cec15b351a5ce5fd6b9969314e8cd4f4a3f795dda110a95725f0d6fa3fff3b6c2161e4575eab6668fc8c1dfdc5af2704e09e9e2e1100b85bb6c764bc8adf7ea355f90b69fb8665b46b6301ad5eb2d0643c2b6d5d932f00b665cd123a72603fc9d7c3f3e582a91f1cd911062a3116481703200c2e73ccefbfa92496c421e032249f3c3f2b619ed7b7afa4eb3b568700cb9ce37acc7139adcc5b603bc7220378aa396223c27def1f366cbc5fcbc3c671b1748b125c0b0776f4042e5525326b2da539a3427885b371c05b351a5c6c6fa9923a659a3db8bb3299979d1a568fa16a21f32619aac385034ac6831a7863f75a7a74e94c08286e5ebf461b57e586ede82a82f42a3676f69d0683eedaba91acd7bdf2520130489110605d2daf52e90c80600388c6ddbd3b7f7a15c0ceedb50518d44100a0e2e1bdb0396e58e1718ecb1651f19615628ec5db42e7f8e2e963ba6d6806774a360b2087ccd15057ebbff5d7b0718ffcf6734fe0b23605e57587c960e515ce214db6dd9574709576f606aefbdbe6d0476f8597a27033482fe03219d0b047e48587ba0435c9ca74cc789b0c9510cc74e9dc09f1bbf2b2c3b68cb7c7603cecfe7b8a3691ea02c0c0e426d3c13682c479e578a8fdff4283b9885b21102c135446d9f56e6e1cecc000500d4928cf118056014b9e63f1d6d5f4bca24248b2d54b17bbccb180f66c57cf1152fa56f13aa18e0aede0fc3edb8dc32bb8acf63667e75c593bdd165ce0ad1a0d2e76c1cbe082de8c4c71ab5b7e52d3d7949d79553986efbef6677b7031035e3a4c8f4fec153683ac26c9176c27482e06d7ad1bd76dc1b5d55095185c470f9590dd75ab641b3d39b6bdcaf92079f4ee96ae0d092c237ee51434464c8c3f8f98569897104c7df98829b5601fa92e8009e0dabf633dddbf7353cc71fdca652e732ca0c3fb8b6de788675ddfb68c2a8e6d36c7a302d7cae1dd3c814b6567776ff09ab29485c105de0ad4424b3d1332c5ed32b71154b6da5ed0bdade0da36f13bfaa1759310908580cba0fbbb96d283b347c9ed2ac8994dd9937fa2c5d387d0a2a9836958dfee34e4bbae213466606f5a326b18e5cd184a73c60fa4cb17cedbdeefc5b32774bb283f0c0c903e3c562760c9c40083c47372c33f3c77dc718e6b97cc37e73867dcc0b0f981a60def47cbb2868b39ce759923cff3669101b0a39b42c0858d0376a393d492c165b5b7a0bd800fb6b4aae60b1960ec92aff16a21834b7668b0f710ff1e1bd08cce8ded20e848df4662b7b20695dddcf14debbd1e062e2cf8f31be7c9cb75e7d64d9a3cb40fcd1ad99be68dfb9e164dec47137fea4a13067631a82bcd18d693161960c81ed797660eef45eb0a725deff9f2c5f33010f468d7dcccd2f0daebe245f102139008462b0176fd4cc473cc3668dc80ce345eccb10bcd1bf3ddab397e2fe6b861659ea777f7b2e2a970cbcbe0429ad78b3d0b1d81c5cd41012e64e3581d58e33bfd4df086bcf15a1d1a351e5c72ca13bf1c2e83c7ef9077c62ffbd2f49eb4f0f3f0f66b1cebb05b244830113b1ad62f9cf12e1ea2970f6f8a5dd6e9ba72f102e5cc1c4bb347f7110cb670423f5a3cb9bfa01c036cd9e3fb52d6e8beb46fc7667786bb734930bc752c485b62e6f304aea2d954b1731e3579eb3fece7c72efa5bbfd0cba70f5d01669d230005c2cfd83ce68efb818ad6af72955800159ec98e1a797e0890bbc5b838888c0ecbb2d4423201e25f488f6270710f10ae11637e026f0571ae572f032f07c99c202e5547d634bf6c644fe37778e9b26ac83ab8dde1e370f70a89f059635bd5094c003be8e985635471ffb62de31c3db88f8a562fa02d0559b4f515ed285c4807766da0278f1fbb4b2b047815cf4710985526cf5d9a0c703ddb3a8b26776fee3ebf57f4f2de5557f09f3a7a90766dc80f99237edebb75a5e31c1f5f38414f4eeda3e7a78b6de7871082684c636c0a4ec03a327f48586c939d575c202bf71e1149c0afba70f1ef6b7c9c0b3960fc32509a2e0792593594933af1ff0ef543ab94195c76cd6a10a874b34b647ab27f253d3abc996eee5c498f2f9f71049bdb855dfcc5fd1b229e26efe256824322d2bc42c1a01ba6d2a99c9f4dd5104e11d73942921920abb87b8362b9f06eee1ddf4f77f7aca6472585a66da522b62759e5b52befb7164bcae5463005f03b008f375af088ac2673f72b50b2f30bb5c82db42b79678fe1f50503aa7734c3eeca6c14dac086631e4e9da038a86c756ab85145f936e1f8b8b9355f18e737f76e104e1030961d09862bdd44f7f7ad1140f5f21c76c1ef9a9d197143cd7b2b460b0741984bde6d6e0618303780e3dee11d626e18bbddbc10c3c28683770187cc9303859e9ef3e2c436d3deca1b5155bf869e926ece0c6b35043651ce238589c0fd47e477223bc382c45dc9a981aa616ba726fc1e7559fcd24f0f6f6dda5dec92f702ae4599df56676944002e5bef5bf1322539edde76045b096383e325925213760a402dda95f593299d3d492f07a96d37b768ef59b6665e884a28c06553de2fe715c25165b5b7166676117f87838b5b05c8ef842bcf83c4dd57746144a8dd25bf2cb13b192f925ffa2f933a53618b2a70f1cbf7022e560da3915ef12478f8785cab47455e950cb510a5f24fb7cc300b25e175d4657eb29750f6823a010b79a2aa7826d61b2aa10c2e6bbf10e623f05400ae578592aa7805bb55b1339b4574868ac84e8d48c0f5b070a2e992471a8e2e8cc759f0505be19c88145c900000d7bd95a385cac5401559f21acc6fdd9cb1d59bda2b2f28c2074ee0e22a646ba2b6ec1106b8acf9a872eb3c1d0a26b5a944e64c0dab6a089dfaf6929f435fbef1b996ef5657287b01d783d5e3456099171a09b2c9663c560741181baaa623eeeb5e345b800b1b10becfb657aceaa11f84e7b3fb1de3f25a6ac2ce0c3933e3dbf66d43120544ecd3626fb14a98eccc0cedc025c7bb64d510f539d0ab43dcb47d1b098f612492ebfecab12131af488d7fbf09aaa935bf0e3654c4a784ecce16e0124e1f4345bcb379969977e8877d190bb0385117e3918b3fbd7a0a65700d68df5cf432e4cf5c9bd73fa4fe4f5609931ddfd20e5c37a6a955438e5dc82f1f4e0d780cb93a99c16517e7aa925ce3846a889fbb7ef6417569bc619f247a8707b07847c758223d9125acbbeefc1fe8eadcbeaffa344ea7b2c5a34c8025637e5005d9fbf9a73ffe0f3abc6058c878a1fe3a810b6d1bb09eb24a38a4fd6721c9d9584fd99921ab84e0a5005c123dcd57ab86fc0265ef12bc8748e2fde293506fa1d3823d5c33412c08ff1f09a372cd176c1f3045bc9d179ce2245a0ebcf667baba7c8c180f54a568c17563e140012e9e1f009637bc87f91c307abca534e606555bceeac7c681f959d55d374f21b7b296c195d5ad79886682f725834b5609c14b01b81c54437e711c549617044165b8e37ffcaa9167703d5a3799eeaf1813f23b2cbcaa6259ee9c04c045e35d04b3e1bbb807806bad6562c653f5b48ff8e085bc21025c77974beab3a122164de9272487aa2b14ecbd68e785ef01ac3c376b990c362db908120e8c100fa74bda930a5c0b0776363d85d6cd8843363aa984da814bced6b00694adbbddc68ef528ab5dc3b0e0a21359c1c5840c07d862aaea6515f0dcc8e9fbf058c279213f3f1a47866cbfdcce1f6ad85c3fd2edbca16173038061d3c920b312c0e1362755a1a395b051592b8b2145ad366234e0da3c7940c8676470c981631dba3e69db14948b27414ea76120a17779db7a26b8dc7ac60b70ad1aebfa19000d2a231812800318bc80ce0e48b8c7b4dead04a05852399dc4122db8e02d943359ec627d3c370021967981701f9e9b6d6b3b4b5f14d561776ee0ead1be5558575e39e589f925d9c591da834b4ee4459e981db890fe2283cbe92821593504b97dce0978602437c2e7bcde3316a95515449e22c05525bd0644352f2f73b2db1c1cc9504dad1e50374fa10a5c39df34529e5e239fa4a943a2aef6e0925bada18cc06ec7e3c44d06171af77b597091d3662c7ab400f393dc8e95f5420f0b2798e082ede5453a27848c778cc46255d03b1270416a21f462bdb75c9ea44b2bb5d438fcae7f78cc4b157844390aa7c5389d8d6cedc0eb45354904f3c1fe88155cb2e4023d5c3b31f99b870db0385dcb0bb8384120bbdd0721e96ff2a6843213b3996c7ffdf8584b70c9312f0e14aac005bb6b64bb4fa9cfa7ef452c2db0f8b07792c580b1aa8366f26ef102bab36498092eb8e3c5e6912480e1fdda6d1a6e694f32b8b061426a59ab22e435d431b69512a79c70cc8bf3c75465e15c7630a9cd871131809c550e4684472b51cc8767f9052c956a08a031230bfb26412083ba6d27ad42eacf3cdc0bf6332acd21b5b0be762dca5925d425dd2965c0a52aff579dc185bfa35189f5081a2752edac6046303db207fc9468b817765a30841f6aa092698d71cbaaa115bcbc8970e532c613f586628055ccc7b80fee1749f0db8b3343548e6776a18e9f35367ba8a8547bd94ba8536c2b25c0757562784059c51038e0ce5af3e5974a06c68996a2c9138c8510586770c5eade8f177971667089ffa2165555e828310a5b3f4302721b085d5542adc12597a1b04b5e753835f20cad8d6cdc289ad20edd49560defaf1ca3e518235151f9fc64d5a993d032e4be96baa43ba5d4c992d6445e55749febbb4abad48b48554b3770614eb26a684d394a3679c9ccb08659e4e644d68c0fee0e76a887befc9b52e0b2532d9c76393b4ab4da166fe24c0d263f62687edb855ed786ab8c55da08abf4baf4264c5970712a949c6768dd01616b416ad9e9e7b676978b672bd9b649e5fedc88c17525eb3b01ac7b05a3844b5ea739b99599a8ec68a8fc76798a01b8e2d08d9777c1ab73fa86b5bac6a278b6bbb665259de1acfd424c26dc30852a0fada0ca927cef6ae1e6e926b8f07e50407967d9707dd4568fde493866aceb8a0d141b8eac6d04e08a13b81099e79e8656b21e5c1dcfd4a398bc7b05239587fdc11901e744e5be4554796a87678001480016e68fffe3e7b2fe9f68012c2fadabadb14b99b0d65873f99ebcfe678704e08a290d4ace31941bede305730607ef64589c4883c9c920d591496c3799debeb2b5f4f2cc2eaa3cb2a60a6c2ef713e94fafa4217e3e35aca51ef696c7e031885b54635d410c22f9a00eb965b50e5d9e52125c72cb356b4728bc74b91295cfc255051d6d83c93154ffc64a2c8da1c2418a3e5a3729248dc9fcecd1f55459be992a8f6fa4cad2a5f647b8f66f22becf06bf4ee05285506c3b3fbd5a6f9654886761adadda4b00ae38810bbb98b519a49cc4e9355b03922299e0825d247bf8a2f5f6e15d94677e2100ca5918b8077e974af6166c2b550730c43903c915c7da2e59e7c66ea65a44ce35f3aa1a5aab64130dae4bd37b9860c2cf32c176f212ab8253042e6b7cc70ad643bd3f4c297bebc42b75dfda328d7bc0abcafa91c913802bc6b27faba45211ab8661f53f1ac6bb105e103d190d105c9bdf9ff676a81362c4e3ffe7277c630b30a85a722d131300c5e03afcdd4729636f41dbe078a5ca8baa5a67ddcafa530a5c486be19768ddcdd4eac7b488bd86898e773dda3e4f9cef7c61e9682ae9569f2e4cee2c807035ef67ba94fb331d9bd98fcaa6f6a60363bea503435bdbaa8ef81e6c2afc2b4badeb798614ccfa8e4e4ee9416593ba8b33834177b66489e756ec5ea0657ccb4e25b4db9874396c2165c105427a8bd7972e7b0dbd0694e39567f874e77cc1d060ec93cb26082acd19154625593f0952fd0d743067245dc81d16022c382e00ce638b465059ce08dbefda5159de58319ef3ab26d3b5f53304e8e29996158b4aa83a4dd3f420f6af1580cb2fbb4beeb0aa7ae958187ef15e730dfdc833843400830248670a26d1a1c5a3236678273abd7c82082c336143c0f3fc7c06e8f892717471cd54bab9719690b07e1472469aa88b3554c5ff542aa1cef6564a804b6e16aa0218f47339435a26afb986d124b932982005fc66722bc3dba9720081df40b6124bb768d4498024dac031543fabed25034bb74e4f29092e2e3f9101e64450235995b4e6a6796dffe524a1c06c7e333000c2aa23eecf7612c0e3654cf81c7f87a527df0fe41700b19140d5f5ac1abb1c70670d1c63ddbcac333ea3c3292669012e6bf1a48a902ac59e23feac57d5d04b9f763031a488574664c696999eed1b901f6a57b4c463609b10aa602420f4027a2f9d75adb984000c341539bea922ddd5c1940317b75d4349378004c2cfb0c9acbb98ac4a7a8d79b9310aa481d38e0e0605b326da1b170f6f263601a78d042084c3c60f173c1c4faaba2cac35d6d6badebab54f4b1b7045d383c36b3a94934bdec97900464cb7c24b1968762083faea870b9ecb4b52451a05e0b2b409f012f37272c9dbd95950a9d215585e36162729eda5a49fabc8753a992400578431324f8e0da98bab95a261ae74223b8fa89dede5b5a49f635bba766f0ac0e5c10982188a97645e956a68b773435d8a3c81755a585d52e29368a70917b7977432b39cc5b02723510dbd64c1735b3c5dce2f0ec015438ccc8b6343a51a42f5b3f3064692a4ab3a162919c042ac884b76909be805ec9050916c305e54427664e85c491c80cb8550a9ead92daf500dedecad48c0852037981a295c286a8c547a210e07492313ee877b3101b8008d4c76ae6c7c1663c07ddd9264ddecae68bd84dcf7241d1d1935065cf2a9295ea497b561a85d4e6024e09241022080f12135ac60b0922aeb3d52e2424300dcae54271670595df25ebc849c91910a591601b83cbae5bd94a25803ca7e824ba5a681e159fab8818d094091a516ee214bb5447a0cad49bf5e5442ac43ba4bad1a032eb92ecccb017172aea15dd6821fe04a0777bc0c2e2fbd09d9fd9eee52abc6804bee24e5457ac9e5ff4e09b535055cc83cf1022e2fbde06b8ad4aa51e08a447ac965284e397635055c761e5339d6e5a5bc84a596ce2da80370c528bdbc780ed9b1e104ae9a1244b68b73c9592a5e1c199ceaa473697e00ae04780eb9fb9213b8e259c1ab13d93975185c5e9ad0705c4bf7eae1005c3ec4bdbc646da0afa113b8e2995bc871281dc0e5548a820dc62d23839bcfa46b0e61002e45d686f5206b95f472dab5518612b723770c6023f70eb12eabeb9d83c6877a3510764cbc33e39d36987b5b677b2e86d4b9c76000ae38e41cba65cc97e78f498a53831d04bf4cec5cd576ad4d2d938e7cdfc83c49d34ba1672c84921aa7f9df5aebadab533aa73905e08ad2357f74e1705faa726339e6146ad5f5ec0182acaaacdf879747626f952c1841d7578e77540739cd29958a1c0370f9e0dcf092d47b2e7724edcf1eeed8c0259ed2cba93559bca516bca14e1bcbded983e9fa8a71813a18802b3af510e0da9395e958f29e88aeb5e2047b8912d1ccd42e1b1e840da778c6c088cbf70370d520e2bc43bb83f32e2d1d2d9868dfdca1b68c164947a47471c163c3b103175adab177b026aa8301b824ef211f0fabf21e42ed0113814a168e4cb8d710aa1982b8567738aa83e36aefedb40f4360a3e177a2b2b3d2b92f4600ae18fa225aedafbb6b269a8cb477ce10cfa5177e01cbade9288097c8ac0c6c30fc3e8ecc1b52e34af70370c5687f593bf5323381ec9c1bf1706c38b57393c9ef1e8800b55de0184e0c3b7041f2d7743b2b00974b5f7a6bf606984806989d7ae8b7f4f2daa4d3eff66e7689bafbe70f0b790f70f6a84a496a52164600ae283a46c16e60809d5818ca5476de433f6d2fb7cc88783dd7ced692d541a65ff247853830d2b9d94c002e1f83cbb207913d8632d9790ffdf21c3a65a2c7331c60e72164efa04c70f6c8c0aae90e8c005c11808b01767de9a830c6b2b3bfc0e87ed8404e6ef07895bfd8a983b2775026c406195848880ef8270097e743ce39c30000db33b53fed9d39288c0e2c1a45070d40c954be6c7ccccc6ebda71bdddc149b5b1edf57ddb774c108e5bcf74ee865a636d5e42c8c005c51824b762dafedf82e151b00db376b5008ed9f9d49071755492c994ec40030947158efe746bfac9e1235b06e6d9aa5bc274eb5b4ce17b4636c4f5adffeed10091f802b0057c4e062806d6c599b96b4799b768deb691eb56a1eb93a6f281dc91b1b46e54bc7d383a2b951d95baafbb9d1a31d91a9a315c50b6c9f7538770c95ce191c3657cc3faf451ddadaaab699e214802b0057d4e0021dcf6c4eb95fd4a67c83b1768fef49a5b37f0aa183f3878a80af8ac0c08f3d32feddadb36defe346c7f2c7797a0e407563e34c3a6180dfee5e078c0dc33a47cc1bf3cffba23ad81e802b0097277ab1a3133dba788a0e0f6a11062e50e998ce94d7dc90602deb50d1d0afe9e09ccc103a9cfd331d5b32ce9620c92e174e13f6cdb35dd9610c7f7dc34cf119a77b78213ce3a1213165c2bd11e83eb36292ebf7310febdc305fcc1d74787cd7ea00bb04aeca0b6be8c59171012f05e0b2d0ea7af4f2f1af84ebf9e3070260aa3cc3dd63bbd35263f7ce3776ef75bd3ea5fd53fbd1a1b9834d3ab2609868bb96aa84f1cbf301619e982fe68df9df5b33310c5cb7f7ae11efee65c5037abebe71c04f01b8aaa9f24c2e59af67659bc300767cc1cf543aad1fadeaf01e2d3176f1658614db3db2b3c8e2602a33181412e8c4b2092945280c95e78179f13cf1efbe497de8d4a2e11675f94b21ede5ebe5cd03014f05e07a45c64e6b77559cd917c24cd70a0c9b64fe103a943590b667b6a1a5cd6b09da36a085f83dd3510384f0189e5c3e417bc2388f2e1c1632fecdfd3e37e7b6ae7b23315ffcfed62aa9f278f32caab87545f9de5e940e0ec01580abca5670ba9e5f2e178c64f6855836968e197649d9fca1b4775c0f2a30a4d73263775fdbf9432a99fc9df8bd20e33308069f5a3e515bc2f88e2e18668e19e35f6d4829cc6765dbba21f3b9bc744c75e3d4ddb95479ffa6ed3b838a1d802b905ae4e50223c9007bb876325d5936868e1912eac89c9fa8f09bfab4fccbda82b60f6a297e2fc89008a70cc90047826e8471f13831078c7b45ab3a620e1b7a3416bfc3dfcee68e10a53732b05e563c737d67355d7a6504b6562e79bd2a9fdc178c25ab89f70b2709e6832d563cbc23ad3498b3c060ced5edead2be315dc4ef41a7968ca5b32b276943180f8f0de35e6b6c0e183768d79076e2f7277386d14d4b031ad8a15eaf97f74e05e0aac904ef56241776ec67070ac31c1dd8d9cfe78da4b2ac1f6973afc6b4e2abda82d675aa4ffbc776a51306a39eca1b45e7564ea6f3aba6248df07c8c03e3c1b8303e1e2bc67d6c5e269d5c344cd896612dbe7f394c915ecfb77c1580ab46c6b5f67c47d15e2a4f22830c59f40727f5a2f506e3ae349816849f4b0c66863438573041a42b259af0dc938b868b71c863dbd8b5211d9ef63d9d32407575f958a1f286cccb50875fdcbe1cd57b826610802b706444be2bc3d161d3fd08eae2af864d76687c375af7755d5a6d3031083f1767b6a2d306935f583559646fc49bf09c13f33369efcfeda9b0751d732c1b0d801d18d7558ce5b2b12160cc6127be14653b3a2e5c257d0d766c64042a616cd7f3ebe7421c1d2ababd6a021d1ddf5530333336684bb78674d000dfd9fc9174a970aaef746ae110717feb73b7f56a227e0f097bad609c1254c2be32d45f2f8e8b40350cc0453be67d4e2327f4a3963f4fa4dd67ee905f97cad1a1a287eb26d3d5dc61b4b75f335adff60d2a6c51dba42d5d1bd0bea16de8f8cc7e747ec968515b15299d9c3788caa6f4a6e2815f8afbc9f75fd7a60e150ff8924e66fd20324d1eac9d643f56c4afa2b0af54d7d12b0fa871e64c5a34fd1b3abca07100ae74a0f38bdfa73559ade987319954776036fde75e1b43a8ee9862f2fbfaad7c87a793ece53eea877ef894b6b57f83d6b5a865802094b676fd80b6f76ee44af85ca1e2fb1b3bd415403b35adb7f0fa01dc6e638a550d94af7b4f2ae82f437784bcf73f7cb74a6c6ed3a7f4109b5d00ae1420ec8a58b02e2347d25ffae787814945a3379cf51d6050139f16cd8d0864dc87e2fcc4ce74f8c766b4ebdb7ab4a5556d51e6b21e52c723edeef531950cf8824e4dee4ed7f286d9aa7b4a506d9a4e15a776d3cbe7bff9f62eba2e3eea691d20d9a051006cb797bc15802b99840560150f0be3650155f4871fb6d2c5db4f7c071818f4c5d10de27c2da75eef5e0087ae4a6ee476528b53af79d116bb249f5edef077a3595b763dea7581a6018d039a073490005c7156f1a0b3dba978b15093a92514afebe5d51355676dedce1607c4413a440b345f68c35471bc2a408fd32045b9cbc9227af9eca1aff3c686858dcbaf358226824d34d554c90cdd1d0fd0d1fd0413d3ef7aaca77feaba8afea1533e151ebc183f80ddbf46152505d52797184c0d6901b0f11141f122484d48271cdc80c3f44c408120ad2e1f89cb9c1b4ddc29de6f3cd68ded36069bce922d43277b092f2cee60ea984b7fd76e1efda7d6b34cfa6fdf2ea07b8f9f513cafca5f4aec8f0a32981eccef1bedce76ae463ebec97769c5d7f015a5d5efb6ed1cfafb0e8be81fbe5d4affd46d4d5cc1868d18da8d4e604b1ab8a04f47e27c8886feb1cb0a2199feae7d76089854d4775131c5fb8214ab3cb822792797405a19aa6abcae9d277e757dcf580bac0936ba784937808d6db6643a4832126d3b61d2f10214160bbbe4df7fbdd0759155b4f3e4b5f803ecf96f8e522c6e74b6d8574f6098dbdd90fcffda7b71c4ef1c5a04a4db3f765e1e37e9962c153223513614c4763c5e1cdb4d5ea4931bd519544089ba84142b2b8c3fa80c498967c5fb6a3e7143ccef5f509b2c53ba41f3f09b5fe010833d9f08a065c41b54b1b8ca9d0085dd0e3abd2f0b2ad1b48dc72891179c0a7103551c5540f9cad979d2f775504937bf55496850906829072eec0e7101541c1711f45f3bcda78bb71e251660cf1e0a97b86f769501d878aa80f275e4c22df1cee2bd2e76769b5fd22c1eb659463c02bc7ec5a2a083c3bb170f09e544cd276da2645c31393c120caa58ecac78800d36dbefbaafd50a60be832b5635305980b2523c635fae20bb71d63bc8a0fe2518547cd519b82ce9c00a23836fc03fb0d722051b78575b7045ab0aea022899b02323f134999700999dd303a032fe9e0c50e1ea9455a41fb06cec357890bd020dde6cedc08540b0ec1277333c75049495fa2dde4b3a5c21ae7b048013e0fd73baa66d284b096029a59a61abb901cdaf142bdfc0c5761640253220da6485012c1500652518ecc9be84c3e315b812e501b4bbd61cf82535816521372fa21ff65786dfeaa000cfab09609790072dff2d5508768516d2eb950d06a975e3ce7d910d61a574f40cc64b554c847a98e147d685a90e1ae2d61a10b44aae545c0ca84189bc2edc7c209e294b4d76d5bf7c7487fa64adb3dd08e22569e1194c0760b177d18bfd156be574cce092332f5471286b941d804bb5c5005381e1e3edd64630f6c311ab95529383cdb8de1fb8d071ac50ddfc1e9b969ec138832b56ef6146ac1918b213433511004e1e70b4797fc926307d3caed3976f52cfb9dbe877ada62a9f3bb2b0bcda7358924fcf9e3da37fee30c375bcc84ef7ebc2f8d205582a70214666073024ff26055c724c0bf6955dae987522a9ba287e322ceca64139db5d9ff9cf3d965607988f6fa2b3172e2574439854b033ad80a5f205c0c1e6e4dc4838b864a9c503b49b8cac1aa6aadde5a7f710ea9f67fbc578afb9fbaf5481cbb0bbf237ef8bd821136dad5abc730675001752a854e68b4cd1e61f66f8616b61608e93e9989bf27697195cee931735b3e27bd1648fb798b54f800b76979d33c36f806113f92fed66a63db8589382b9e2541f168d6b3e23560fa1273bca227653d5ee62ea347b47429d02a66a78f504fd6df892e8334e3c020c7660ba7806ddc0259b334ec165849b12022ec4006cddef362417c2211d25d51768d1eeb389f3b6199b139a98427afdaf4ed3638ad9b9012cdd3c836ee092eb00adb698557a25045c729f0b5b4786073d3795097d37ca2edff3a45ef9c1acd3b79ea65f4f1d897b50fcddcca5690d2c2b2f86f80a1c1c1b20f4e8882bb8f000f981d6662f5e55c37458a43732573b26f7fa99d1005574c5cec3fedc2bab28a59371fd74c5bbc56563f11c66c4e2c8f0aa12aa54c354766ac8d4397b5f425285e0561f99e75fbcc99a75326175498d00960c2e9523cec9b11169526f462c8e8c487305e580b21f3d2fb420639358bcf7424272f03e1ebac4d7fb7158215d5dee6e5a941dff3a393622c9dac888a55e2be2ec7629a09cea1ec310fbab4b8e697fa512a3c2fe42c26fbabadcddb2e2edf8d7c9b11149ce6144e0925ba2451b0ce65413af8e9054a17feb5790ba754e35919c04838b6303fd367d051772ac426255d1368b31068e3cc474925c01a51fb9b575f3d29acd33b880d674c9b208282057ff808b63c34b50f9ff035bede88965ec2ad60000000049454e44ae426082, 'AC', 6);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(16, 'm.rodriguez@mrsservice.com.ar', 'Mariano', 'Rodriguez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010101012c012c0000ffdb0043000503040404030504040405050506070c08070707070f0b0b090c110f1212110f111113161c1713141a1511111821181a1d1d1f1f1f13172224221e241c1e1f1effc0000b0801d601c201011100ffc4001d000100010403010000000000000000000000080206070903040501ffc400521000010303010405050a0c0404050501000100020304051106071221310813415161142242718109153254919293a1b1d118233352566272b2c1d2e1f016245382435563a22544738494344664b3c2c3ffda0008010100003f0098c0961dd7125a7938fd8572a22222222222222222222222222222222222222222222222222222a5eeddc0032e3c82a3ab97fd53f20fb9721008208c82b8c12cc35c72d3c89ecf02b9511111111111111111111111111111111111111111111111111152f76ee001971e4118dddc9272e3ccaa917c20104119055009690d77169e47bbc0ae4444444444444444444444444444444444444444444444444454bddbb80065c790463777249cb8f32aa4445f080410464154025a435dc5a791eef02b911111111111111111111111111111111111111111111111152f76ee001971e4118dddc9272e3ccaa9111117c201041190550096f9ae3969e44f67815c8888888888888888bc7d59a86cfa5b4fd5dfafd5d150dba919bf2cb21e03c00ed2790039a861b50e993a8eb2e12d36cfed94d6ca16921957591896793f5b74f9ad1e072b1abba4feda9cf2eff1681939c0a3840fdd5f3f09fdb57e979ffe1c3fca9f84fedabf4bcfff000e1fe55ebe9ee969b60b655324adb95beed003e7435346c6877fb981aefad4b7e8f9b7bd37b5981d4223f7a75040cde968249038483b5f1bbd21e1cc7d6b3222222222222222222222222a5eec6001971e4118dddc9272e3ccaa911111117c201182320aa012d3bae3969e47bbc0ae444444444444444517bdd17a5ac9765565ab827985343750da88dae218e0e8ddba5c3b70470f5a8108888b247468a4acaddbc68fa7a1a8969e637163cbe37169dd682e70cf716b483eb5b5044444444444444444444454bdd8c0032e3c8231bbb924e5c799552222222222f840230464154025a775c72d3c8f77815c88888888888ba974b850daedf357dc6ae0a3a481a5f2cd33c318c68e6493c0288bb74e97d1d3be7b1ecbe164ce1963ef150cf373ff0049879fed3be4ed59e3a306abafd69b0fd3f7dbad5beaee2f8e48aaa67fc27bd9239b938ed2003ed5e4f4cab37bf5d1e75234341751b23ac07bbab7827eacad652222290fd00ecdef96dd5b5ee66f476db7cd367b9cec35bf695b115093683d27357e87e901a9e869dd0ddf4dd3568a6f209b8757d5b431fd5bc71692e0e3c7232a4cec776b9a376a36af29d3b5fb9591b41a9b7cf86cf09f11e90fd6190b21222222222222222222a5eec70032e3c8231bbb924e5c79955222222222222f840230464154025a775c72d3c8f77815c888888888adada2eb5d3da034c546a1d4b5cda5a38461a39be57f6318df49c56baba40edd353ed5ae6e864924b6e9f89f9a6b6c6fe07b9d21f4ddf50ec58854f8f73a6f22af65579b2b9dbcfb7dd0c8067936560c0f958ef95482da15a997bd0b7db43d9be2aedf3441bde4b0e3ebc2d454f13e09e4864187c6e2c70ee20e0ae2444533bdcd8b30dcd5da808c1cc146d3e1c5e7f82989573c74b493544c7763898e7bcf7003256a1358dce5bceacbbdde776f49595b34ee3de5cf27f8aa74ddf6eda6ef34f78b15c27a0aea6707c5342fdd703fc478153eba2f748cb76d1218b4deaa920b7ea88da031d90d8abb1dacee7f7b7e4522511111111111111152f763000cb8f208c6eee493971e65548888888888888be1008c11905500969dd71cb4f23dde05722222222f135aea5b3e90d315da8efb56da5b7d1466491e799ee6b476b89e007795accdbeed66f9b57d5f25cab9efa7b6404b6df421de6c0cef3def3da7d8b1aa2963ee6f5e4c1ae352d89cfc32ae81950d19e6f8df8fb1e54e73c7815a96db2d98e9edab6a8b3630296e73b1beadf247d455a0888b62bd01acbef6ec1e2ae7b30fb9d7cd38777b06183eb6b964adbdde4583633ab6eb9dd315ae6634f8bc6e0fadcb54278f15f173d2544f4b55154d34af86789c1f1c8c761cd7039041ec2b619d1136ef16d1ad034c6a39991ea9a18810ee42b621e98fd71e90f6f7e242a2222222222222a5eec6001971e4118dddc9272e3ccaa91111111111111117c201182321500969c1396f61eef02b9111117c2400493803995af2e9a7b61935d6b07e93b25513a76cd29612c779b55503839e7bc37881ed3daa3aa22cd3d0aef22cfd21f4fef1c36b84b4673da5ec38fac05b2f5adee9d166f7a7a41dcea1acdc8ae34d055b3c4966eb8fce6958211116d73a3ed98583629a42d65bbae65ae291e318c3a41d6387cae2b1df4f4bd7bd9b04a9a364bb92dcab61a703f39a097387fdab5ce88bd7d297eba698d43437eb2d53e96be8a66cb0c8d38c11d87bc1e447685b45d85ed16dbb4ed9e50ea5a3dc8ea08eaaba9c1c982768f39beaed1e042bf11111111111152f763801971e4118dc71272e3ccaa9111111111111111117c201182321500969c1396f61eef02b91111612e98db4a76cff00651510dba7eaef57a268e8cb4f9d1b48fc6483d4d381e2e0b5aa492492724f35f1115c9b31babac5b44d3d7763f73c96e5048e767186ef8cfd595b718a46cb132561cb5ed0e69ef05424f749ed7147a9b485e411d6d4d1cf4ce1db88ded70fff00695115117a5a6a8bdf3d476db6ef8679555c50ef1e4379e067eb5b7ea2823a6a4829a2686c7146d635a390006005103dd27bd62974969e6bbe13e7ac701e003067e7150b911167ce853b4c7e86da8c565af98b6cd7f73696604f9b14d9fc5c9e1c4ee9f03e0b6388888888888a97bb1c00cb8f208c6e3249cb8f32aa44444444444444444445f0804608c854025a704e5bd87bbc0ae4445ad7e9a7addfac36d770a5866dfb7d90790538072d2e6f191c3d6e27e4583d11114b5d9674c4adb0e92a7b36aed3b35deaa8e21143594f3063a568186f580f6e31c473ee58436f3b56bd6d675736f374899494b4f175345471b8b9b0b339393dae2799f5772c7288b92391f1bdb246e2d7b487348e608ed52f34274d09edda5e1a1d53a5e5b95d29e2118aba7a86b1b390301cf691e69efc65478db4ed26f5b52d6b36a4bd08e1f30454b4b112594f10e4d19e678924f695632222e48a57c52b658dc5af63839ae1cc11c8ada87474d6bfe3ed8fd87504b26fd5983c9eb0ff00d68fcd713ebc03ed59111111111152e763801971e4118dc712724f32aa4444444444444444444444201183c57182587078b7b0f7782e456fed16fd1e96d097cd4529c36df432d47b5ad247d785a90afaa9ebabaa2baa9e649ea2574b2b8fa4e71249f94aeb22222222222222222299fee6fea873a1d4da3e693830c75f4ed2eeff0031e00f634fb54c9444444454bdd8e0065c79046377789392799552222222222222222222222221008c1e2b8c12c383c5bd87bbc160fe9cb7875aba3ddda18de5925c2a20a4691dc5e1ce1ed6b485adb44444444444444444459dba0c5e1d6be90b6aa7ce1b72a6a8a4771fd4df1f5c616c8911111152f763801971e4118ddde24e49e65548888888888888888888888888be1008c1e21461f7439ce9765f63b6b2501f2ddbad630fa7b913c633dfe72810e05ae2d702083820f62a511111111111111111646e8d353252edeb464b1fc2375899ec71dd3f515b524444454b9d8e03893c8235b8e3cc9e65548888888888888888888888888bab73aea4b6dbea2e15d3b29e969a374b34af386b18d1924fb1416db2f4b9d5576bcd450ecfdecb359e371632a9f107d44e01f87c78301ec038f7958275c6d275d6b6a7829f556a5aebac34f2196164ce188dc4632300762f0fcdb9b38e1b5cd1ea130fe6fb579ce05ae2d702083820f62a5111111111111111177acb73afb35da96eb6ba99296ba9256cb04f19c3a378390478acafa6ba4bed8acb5cca89355cb7460765d0d744d91ae1da39023d854dbe8e5b66b46d734e4b34703686f345815d45bf90dcf27b0f6b0f1f57259611152e76380e24f208d6e389e24f32aa444444444444444444444444445837a715d2b2d9d1e6f028de633573c14d2b87fa6e78de1edc616b651540904104823910bd11bb72660e1b5cd1c0f2130fe6fb579ce05ae2d702083820f62a511111111111111111676e83374acb7f481b5d3d36fba2aea79a0a8683c377777813ea2d0b6448a973b1c00cb8f208d6e39f12799552222222222222222222222222222b3f6c5a2a9b685b37bc693a8788cd6c3f89908cf572b4ef31dec700b56dae349df7466a2a9b06a3b74b435d4ee20b5edc078ec734f2734f610bc04550241041208e442f446edcd98386d734703c84c3f9bed5e73816b8b5c0820e083d8a94444444444444445f4024e0712a6af40ed8fdd6d3592ed2751d1be8fada7305aa095a5af735df0a52d3c810303da54c254b9d8e0065c79046b71db9279955222222222222222222222222222222f0356e8fd2daba91b4ba9ac16fbb44dcee794c01e599e7baee6df61566fe0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe641d1f36340823415b411c88749fcc93ec0b63d24bbf3684b63c9f48ba4cfb7cefad3f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f993f07bd8cfe80db3e749fcc9f83dec67f406d9f3a4fe64fc1ef633fa036cf9d27f327e0f7b19fd01b67ce93f997a1a7f631b2cb0d732bad7a1acf15430e58f7c3d6969ef1be4e0f8859000000006005f1cec70032e3c8235b8edc93ccaa911111111111111111111111111111115a5b52d7fa7b66fa6dba87533ea9942676c1bd4f0195c1ce048c81c8703c5636b3f4abd91dd6eb4b6ca5adbb79455ccc862dfa0706ef38803273c064acec8846460aa0799c0fc1ec3dcab44444444444458ff6bbb5cd1fb2c65b9fab2a2ae31713208053d3994f99bb9ce0f0f8415b7a0fa486cd35b6ada0d2f60a8bacb72ae739b0b64a22c6f9ad2e3924f0e0d2b322a5cec701c5c79046b71db9279955222222222222222222222222222222222c27d36ad86e5d1d6fe58cde7d23e0a96f806cadde3f3495adfb3d4ba8eef4756c76eba19d9203dd8702b70368ac65c2d7475f17e4ea6064cdf539a08fb576d108c8c1546770e0fc1ec3dcab444444444445063dd21ba9975c699b3b5e0b69adef9dc33c9cf908fb1a1597d032d82e1d20a8ea4b7228282a2a73dc7019ff00f6b632e763801971e411adc7893ccaa91111111111111111111111111111111115a3b61b2ff88b659a9ec8065d576c9e36f0e4edc383ebcad4b1c8e0460ada9746cbeff88b61ba4ee45c1d20b7b20938f2747e663e46859151108c8c1540f30e0fc1ec3dcab44444444445ad3e9b37b17ae9097b646ecc76f6454607716306f7d64aca7ee6fd89e6f5aa351c911dd653c549038f692e2e7fb38354d76b71e24f32aa44444444444444444444444444444444445448c6c91ba378cb5c0823bc15a98db1d81fa5b6a7a96c2f6ee8a4b8cad600386e171737ea214c9f73b7528b86cc6eba6a47832daab8c8c6e78f5728ce7d5bc1ca50a222119182a81e6703f07b0f72ad11111111752e9590dbadb5570a8735b0d342e95e49c001a093f62d4c6abb81d45aaaefaa2e0e7f575d5b2ced07839fbce2434780181953c7a08595f41b141779a2eaa5bbd6c93b5a06008d9e6331e1c0a902888888888888888888888888888888888888b5fdee83e9575a36b349a8e28c8a7bd51b4b88181d6c7e6b87af1ba7dabc7e829ac069adb6c16aa8977292fb03a8dd9381d68f3a327da0b7fdcb6328888878f02a968dde19c8ec5522222222c31d31f5845a4b61d7519ff3377736dd0b03b74bb7f3bfc7b30c0ee3ea5add68a9bbdce0a6899992691b0c31307019380005b67d9be9e8b49e82b169b89ad68b7d0c50bb1c8bc346f1f6bb255c4888888888888888888888888888888888888b00f4e8d1aed4fb149ee94d0f5959609856b70327aaf8328f560871fd85af3b25ceaacf79a2bb50cae8eaa8e764f0bc736bdae0e07e50b6cfb34d5147ad74259b5450b9a62b852b257341cee3f187b7d8e047b15c68888888888888a00fba05ae9b7fda4d1e91a29b7e92c111ebb0781a89305df234347af2ad1e863a30eaedba5ae59a2dfa1b30371a82470cb3f263daf2d38ee056cb11111111111111111111111111111111111111752eb454d73b6d4dbab226cb4d5313a1958e190e6b8608f90ad506d7347d5683da2de74b55077f92a97085e47c388f163bc72d23db95273dcf2da3869b86cdae3381bdbd5b6cde3dbff1183ea77caa672222222222222b4b6b9ace8b67fb3dbbeaaae7371470130b09fca4a783183d6e216a8eff0074adbe5eab6f37198cb595b3be799e7b5ce393f6a9f5d02b411d33b2c935356c3b95fa86412b778608a7664463da779ded523d11111171c92c51e3ac91adcf2c9c2ac104020e41e4bea2e27cf04670f9a369ee2e0172a2222222222222222222222222a2525b1b9c39804850d7a636969b5269b975d474d13ea6db0361ab7319e718cbbcd793e04e3da144cd1d7fb9696d516dd456998c55d6fa86cf13bbc83c41f02320f815b53d936b8b5ed0f42dbb555a9edeaeaa31d7459c98251f0e33e20fd583daaed4456e57dfe48f51c16a8a300195ad7b8f6e7b95c6adaa4bf4d57aa3dee6b1ac8185ed77697100ab9511111404e9d9b551aaf5747a1acb51bf69b2484d53d872d9aab91f5860e1eb2561dd86e81adda3ed32d5a629dae6c12c9d6d64b8e1140de2f77c9c07890b6875fd569ed2ec86dd0323868e1643047d8d6801a07b02a74655d4575a5f3d4bf7e4333867c3017b88889945666d25ce6ba88b5c4677b91f52b9add2b23b3d34b23dac60a7639ce71c003747125602db1f4a8d2da4e49ad9a4a8dfa9ee8cf34cb192da48ddfb7cdffede1e2a2a6d03a456d7753ccf6546a19ecd4cfce29adcdea001fb43cef6e562fafbedeae1389ebaf170ab97783b7e6a97bdd91c8e49e6a6a7445e918cbfb297426bbad6b6ecd023b7dc257605501ca379fcfee3dbeb52c511111111111111111111117997bbcd25a98d3312e91df0583995e07f8cdfbd9f223b9deae0b35ce3bb50be7898e6004b483df858da90d0cd6db9db2e5442b692e14aea69613c9cd77020fb1406dabe936e85d6b5961b85b246d3876fd24fc4759113e69f5f61f10b22f44bda74bb35d6d1db2aea9d3695be1dd973ff0097940e1263ea3e1ea53af48ea417e9098db1988c42563d8ec87038c107bb8af6ee550ea5b7d454b4073a28dcf00f6e06579161becd71b7d6543a26b5d00cb40ede04ff000565d45ce796fadb91871307b5c198ed185ed9d5b753ca847cc2bc4a2b95553dedd5f1420cee738ee6e93cf39e0af5d2d76aeb93a71594e2211805be6919f9579d79d5551e58ea3b54024703bbbfba5c49f001751ba96fb43235d71a4cc6e3e9c4584fa8abc2d95d05c28995501f31c3883cda7b4156b5e35555beb5d4768843b75dbbbfbbbce71f00b17edf36b973d13a36b6d4e9cc57fae8bf12e2cdd75342410f971dfd8df1f5281adafacad9e4f7ae81b8de25cf733ac7b89ed738f69536ba24688d41a26c115daef6a64775bdee176fc1bae8a0e6d6e472cfc23ecee59bb5fcb5e182289a4d2160321dde00e7bd78563a8bec744596d639d0ef9ce1b9f3b033fc15db59769ad9a721aaab6e6a9e37774f0f3b8ab6db75d4956d13441fb8ee5bace0af2d3efa97da29df599ebc83bf91c7e11c7d497eb836db6d92a9c32479ad1de4f2567d33f51deb7aa2191cd8f3818380b9e86eb79b4dc594d708df2b1c7963271de17cdac55535150535755ccc829e1648f92479c06b400492a1ef484dba5d757c11d8ecd5535bb4853d3461fd592d96e2edd1c1c79867eafcab035154cef2fba564862a561fc5c4de1be7b1a3c178d72ac96baadf5131e2e3c00e40772eaa97dd107a3a3eba6a2da06bba37329185b35aedd20c1948e2d9641f9bda076f3e4a6c818181c02fa888888888888888888888b1feb0fc5eac8e5aa6b9d4f98ce3bda3191f6ab9e9ab2c3511b58c34f870c00400bd2a2829e9e1dca6635b193bd86f2e2ac6d9e471c9779c48c6bb101232391de0adee949b2ba1da2ece6b5d053c42f76d8249e825c60b88193193dc71f2ad7d692a7a8a79a5a3ac89f14d495ad0e8de3058edd787023d8b3b7430db6c5a72e4ed2babeaf76d4620ca4ad90fff004c4bda031e7f332781ecf529bf78919369fad9237b5ec752c8e6b9a72082d3820ab7f669c61af69e232cff00fa5d1bdb1acd7d0343406f5f070c70f455f9d4c5fe9b7e45625b1a1bb427b481bbd7cbc3fdae57c4e0369e52d1ba770f2f52c7ba36be8add709a6ae76ee63dd69ddc9ce78af6f505fecb5d68a8a66cae7c8e6f9998cfc2ec5f3403ddef256b778f9af247879ab13eb9dabd9f65b64b95c676c7597934dfe4a8b7bce738b80de777301e67b790506ee7a96efacf54ddaefa86e0ea9b95d2370323dd81bd905ad1d81a00c01d8b2cf44dd9ff00bf17ef7df53db267586dd54d95ac3e6f94cede4cc1f84c1c09f914f4b5ea4b5d648d81af30bcf06b5e31ecee5cdac4674d567ecb7f782f3f66e7ff0004987ff92efdd6aa76891be4b6d36e30b889bb07815ea694696e9ea36b81690ce20facae4bd5da9ed5146fa80e224240c05e16b6aa657697a5aa8b219254348cfecb97ada331fe1aa3c0ec77ef15ea3e28def6bdcc6b9cde448e4a15f4feda59adaba5d0965a8229e9247fbe6f61f87261a445ea1ccf8fa94537d69af9e861ac71652c4d645c3b000012abd4ce9857750e68653c631035bf0777b0fb5790a5e7443e8e6eb89a4d7dafa84f910c4b6db6ccdfcb76896407d1ee6f6f33c14da6b5ad686b400d030001c005522222222222222222222222e9dcadf47708fabaa8daf2391ed0adeb9e92a3653cb353ccf8dcc6970c9e1c151b3cad9e5f29a595c5ec8c02d27b39f05d1d9e79b7ca81ff00448ffb82bcef43367ad1df4f27ee9514f6afb1b7ea386b756e96a506eb03a392b699831e52c01c379a3b5e3eb0a1c5a60904f71a2734b27742e6063860ef070247af82cf5d1c7a406a1d1d413e93d56ca9b969d6d2c82191c099a8f872693f099fabd9d9dca5e6c3b5159b52daaaae363b8c15b4afdc3bd1bb25a78f070e60f815d9d5cef26d5f0d4bc1dc0e8dfeb031f72be69aa60a88daf86563c386460ab0e699b41aedd3cfe6b04ee24f838119fad5f7d6c55303c432b24cb4fc17679858f74bd3d04b78969ae4d660821a1e71e7655d370b5e9ab7c066aca782260fce71e3f5ac2fb60dbfe92d1303acba26282ef75ab0e699a176f535390d3f09d9f39dfaa3daa0adc6f574d415d7abb5e2ae4acac9d9bcf9243fae380ee03b00e4af0e8efb21baed4b5379ce928b4fd0b83ee570c603073dc69ed79fab9ad90e9cb369ab5e9fa3b35aa1a514347136285b90e21a3bcf324f6956eeb482db4f5708b7eeb65e3d6358720777b55d572866a9d29246f04caea7048f1183fc15bda16ef4b4314f4955208b79fbed71e5c80c7d4af663a29e26c8ddd7b1c32d3cd705757525bd8c35323626b8e1aad0d7175a2afa6a78e9661239af24e3b173dce8e67681a56ee1de88b6423c38fdeb9f47dea862b4c74b5133629222479dda324ff15e3ed4369743a474c5c6ef0b3ca052d3b9c31e93f9300efc9c2d6cebc9a5aa69aca8a87d45454564d34d238e497bf0e77d6575e58e927a3a4b6b98d8a47d33248a4ef791c41f5aeb5381570bad35be654c44881eeeff00cd2a45f427d89da75757546b5d5223a9a4b5d57534f6f737cd926001de93bda32303b4f353b9ad0d686b406b40c00070015488888888888888888888888ad4bedbafcfb9c95747379871bad0ec602f3dd43aa2b1a619647861e7938571e99b332d14ce05dbf349c5eefe0bcdd2f63acb75da5a89cb3ab7308183e20ab8ebe274d433c2df85246e68f59185e268fb354da5d51e50e61eb3771bbe1951f7a4cf46666a9aea9d63a0faba3bdb8996a68fe0c7527b5cdfcd7fd45435bbdaaf56eada8b5de2abc8aa21718e686605af69ed0415dcd1fad2f1a027755e91bfd652573ded739f11c30819e0e69e0e1e05481d23d2d61bad24345b43b0e2a63186dc6d9c37bf6a271fb0fa82ccdb39db56c9a6aa35035e50d38733744558c740e0491f9dc15ed76d4bb39d40c1554fad2c6d9070eb1b5b1f1f582579543b4ad98e906d43ee3b44b13f7c0c3193873b8679004e5628da3f493d9636a647e9c92e170ab39cbba831405dfb47cef6805479da16d7f50eaf6c94f59a8db416c3ce8adb13da641dce7bb04fd9e0b1dc176845ce9b11982860de0d60f38f1046f1ef25665e8f3b03b9ed22696e2f9eae8b4dc84365ac7d3756651bc096c592778f8e303ea53c34e689d3fa6b47c3a56c144db75b616e1ad8be138f6b9c7d224f124ae8cba238e62ad047eb330bbf68d2747473367a890d43da720118683fc55c9818c638772b7ee1a4add553ba5639f0971c90de4bdaa281b4d49153b497363686827b70ba97cb441768a38e77b9a23248ddf15d0a3d256da79848e2f9707387725ef398c746632d05846318e1856fd6e91b7cf217c65d164f21c947ee9cb353691d9350d251f9f5573b8b2325fd8c635cf247b4354218ae54efa114f5b0be522473f781c712b82e95acaa961742c31b628dac6f1e3c1760dd29e711beae97ac9d800eb03b04e3929e5d00eb5b5fb2cbaced8bab3ef9969f1c31bc548f44445e26a1d53a7b4ed5dbe96f978a4b7cf719fa8a364d206999f8e43fbee5eda222222222222222222f27516a2b0e9da2756dfaf1436ca768c97d4ced8c63da78ac2facba59ec9ac2e7c3415770bf4ed2462869fcccfedbcb411eacac51a87a6e5c5ee7374f687a5847a325755b9ff2b58063e5572f460e91babb697b583a7351d3da2928e5a19658194b139a4cad2d2065ce24f9bbdf2296088b18eda7629a2f6a7427df9a334975637105ca9806cccee0eec7b7c0fd4a116d77a356d1b41cb2d553d03aff0067664b6b68185ce6b7f5e3f84dfac78ac2b2c6f8a4747231cd7b4e1cd70c10550888aead07b3fd61ae6e2da2d2d60adb8bc9c3a46478899e2e79f340f5952ff61fd10ad166960bced1aa62bbd6370f65b6027c9987f5ddce4f5701eb529e8e9a9e8e963a5a482382089a191c51b435ac039000720bb08b1ef486d6b59b3ed91deb54db9d08aea56c6da6eb5bbcd2f7bdad008ede6a28593a6b6b9a77b45df4c58aba31cfa93242f3edde70fa9649d2bd34f45d6bd916a2d3776b4b9c78c90b9b511b7d7f05df2059ab436d8f66bacc31b61d5d6e9677f2a79a4ea65f98fc157e8208041041e442fa88a1ff00ba56e3ef368c6e4e0d455123fdb1a84e88a7bfb9d55103f65779a66cd1ba68ee85cf8c386f34160c123b8e0a942888ac2db56d3f4f6cb749c97abdca24a8782da2a363bf19532638003b0779ec5ad5da9ed0b51ed1757cfa92ff0056e74ce38a7858e223a666783183b31dfcc9e2a5bf42fdbdd56a77d3ece7574cf9eed1c47decac392ea8631a498de7f39ad04877681de38cb044444444444444458ff6abb5ed09b34a2326a3bcc42af7731d0539125449ea60e43c4e02889b53e981acefce9a8b45d2c5a7280e5ad9dc04b54e1dfbc7cd6fb06477951db505faf5a82b9f5b7bbad65c6a5e4b9d254cce79c9e7cf92f2d15cdb2fd5757a1b5fd9b55d102e92dd52d95ccce3ac6727b3dad247b56d6b48dfed7aab4dd06a2b3d4b6a282ba16cd0bc1ec3d87b883c08ef0bd8444561ebad916ce75b073b50e93b7cf3b863ca238faa947fbdb82b0eea1e861b3dac95efb45f2f76b278b63df64cc1f386f7d6ad87f41fa4df3b9b409c373c01b70271f3d77ed1d08f4ec6f06ebadae950ded14f4cc8b3f3b7964ad1bd17b643a76464efb0c9779d9e9dc6632b49efdce0dfa9660b55b682d546ca3b6d153d1d3b061b141106347b02ee2222853ee826d261b855d0ecd2cf375c692515573319cfe33188e2e1da012e23c4772880f6b98e2c7b4b5c0e0823041542a9ae731c1cd25ae072083c42ca5b33dbeed37423e38edda826aea061e3455e4cd111dc33c5bec214b3d9074b5d11aa9f15bf55c474c5cdf86892476fd2c87c1fcd9ea770f1522e96782aa9d9514d34734320de6491b839ae1de08e6b9945af746ad2faad9958af11b0bbc86e9d5bc81f05b24678fcad68f6a81888af1d946bfd43b36d5b4fa8b4ed575723086cf0389eaaa23cf163c768f1e63985b2ad8b6d3b4eed4b49457bb1ca193b30dada27b875b4d2638b4f78ee7768f915fa8ac2db56d434f6cb749c97abd4a24a8782da3a363bf1953276003b0779ec5ad3daaebfd45b47d593ea1d43526495e4b6085a7f174f1e783183b07daad059fba065a1f72e9034558d1e6db286a2a5c7bb2deac7ff00b16c69111111111111174aef72a0b45b67b95d2b20a2a3a7617cd3ccf0c631a3b492a19edffa5c5555bea2c1b302ea6a6196497891bf8c93ff0049a7e08fd63c7c0289773aeadb9d74d5d71ab9eaeaa67174b34cf2f7bcf7927895d4444459f3a2b6df2af65d70f78ef7d6d6696ab943a46378be8de79c8c1da3bdbdbd9c56c234d5f2d1a92cd4f79b1dc69ee14150d0f8a681c1cd23f81f03c42f511152e76380e2e28d6e3c49e6554888888a3b74a0e9156ad9f5bea34e695a986bf55c837096f9d1d083e93cf22fee6fb4f8ebeee35d5970b84f70aea996a2aea2432cd348ecb9ef272493df95d80e6dc1818f21b58d1863cf0128ee3e3dc7fb1e7bdae63cb1ed2d734e082304154222cafb14dbaeb9d9855c705bab0dc6cc5c3acb6d538ba323f50f361f57c8b643b3ebfcbaa7475b350cb69adb4baba112f925580258f39e78ec3cc7811c02c57d35efda568362376b36a2ac0dadb9340b653b38c924cc70735d8ec682064fdf85adb444575eccb5dea2d9e6a8875069bad753d44671246ee31ceced63dbda0fd4b39fe1a5b46ff90e9ffa393f993f0d2da2ff00c8b4f7d1c9fccb07ed435fea3da36a99b50ea4aceba7779b0c4de1140cec631bd83eded568a29c7ee74e8c7d0e97bdeb7aa8b0eb94a2929091ff000e3c9711eb71c7fb54b544444444444456d6d175ae9ed01a62a350ea5ae6d2d1c230d1cdf2bfb18c6fa4e2b5d1d2076e5a9b6af757452c925bb4fc2fcd2db637f9be0e90fa4efa8762c468888888afed91ed635a6cc2e9e55a6ae4e14d23819e866f3e09bd6dec3e23054cfd92f4b2d05aa990d16a871d2f73760133bb7a95e7c24f47fdd8f5a9036eaea2b8d247574159055d3c837992c3207b5c3bc11c173b9d83ba38b8afad6ee8ef2799ef55222222c7db47db16cf367f4ef3a8b51d336a9a3228a9dc25a87786e3797ace078a883b6de967aa7554735a34543269cb5bf2d7546f66aa56fed0e0c07c38f8a8d72cb24d2ba595ee7c8f25ce738e4b89e6495c4be8241c8e057a4d736e0c0c9086d5b4618f3c04a3b8f8f71fec79ef6b98f2c7b4b5cd38208c10550be8049c019254cce887d1cb1e49b40da0d171e12db2d9337976896507e50d3eb2a436dcb6ada77653a49f75ba3c4d5b282ca0a063b0fa8781f534769ecf5ad6a6d335c6a0da1eaaa8d45a8eaccd5329c4718e11c2cec63076342b5d111111115d1b32d1976d7fadadda5ecf1174f59280f7e3cd8631c5f23bb80192b6aba1f4e5bb48e92b669bb547b9476fa76c31f7bb038b8f89393ed5eda22222222222b7b681abac7a174a56ea5d4354da6a1a56649f4a477a2c68ed713c005ad0dbbed66ffb57d54eb9dcde69edd065b4140d7659033bcf7bcf69fe0b1ba2222222222bc742eb0d55a364172b1ea3b8daa30ecb6282721b33877b3e091e247f4cbfa4fa61ed32d5865de92d37b8876cb118a43eb734ff000593ec3d36ec3206b2f7a2ebe9dde93e9aa5af6fc8402af1a0e985b249d83af17ea576393a8811f2872f5474add8c900fbf95a3ff64f5d6ace96db1ca71e65c2eb51c3388a84fc9c4856e5e7a68ecfa981f7aec17eaf3d81ed6439facac79a9fa6c6a19c3e3d3ba46df4608f365ab99d2b9a7d430161cd6dd2036b1ab44915c3565552533f9d3d07f9767fdbe77d6b184b23e591d24af73dee39739c7249f12b8d1117d048391c0af49ae65c182390b5956d1863cf0128ee3e3dc7fb1e7bd8f6c863735c1e0e0b48e20f72995d10fa3963c93681b40a2e3c25b65b266f2ed12ca0fca1a7d65487db9ed5b4feca749baeb747b66ae941650d0b1d87d43ff834769ec5ad5da66b8d41b42d5953a8b51d599eaa6388e307f17033b18c1d8d1fd55aa88888888bd7d2b60bbea7bed358ec3433575c2a9fb914313724f89ee03993d8b639d1936296ed9369c3354ba3abd495ec1e5d540708c73ea99faa0f33da7d8b32a22222222222ebd65553d151cd57573320a7818649647bb0d6340c924f60016b63a54ed96af6a7ac9d4f412be3d336d7b99410e71d69e46670ef3d9dc161644444444445e852c0c6c7e57560f55e8339194fddde7fb1d7aba892a65eb1f81d8d68e01a3b000bae8888888888888aa19c8c673d98534ba27747c3336835fed0adc3ae6e24b750cade247a32ccd3dbdc3e5ecc480db9ed5b4feca34a3aeb747b66ad9416d0d0b1d87d43ff008347695ad5da66b8d41b42d5953a8b515599aa66388e31f93823ec63076347f556aa2222efdc2d574b736175c2dd5746da86092133c0e609187939b91c47885d045cf4b4f3d54eca7a68249e579c3191b0b9ce3dc00e6b37ec9ba306d1b5ac91555ca89da6ed4ec13515ec225737f562f859f5e14dcd8cec7b476caed460b0d1f5d7095a054dc6700cf37867d16fea8fad6464444444444445117a7bed6df6eb7b766362a9dda9ac6096ef231dc5911e2d87fddccf860769508511111111117a14b031b1f95d58222f419c8ca7eeef3fd8ebd5d4495326fbf1dcd68e01a3b000bae8888888888888be8049c0192a667444e8e58f24da06d068b8f096d96c99bcbb44b283f2869f59521f6e7b56d3db28d26fbadd5c27ad981650d0b1d87d43f1f5347695ae0da1eb5bd6d33524f7bd4557bd717922068388991e722268f440ec3dbdbdeacd7b5cc7963da5ae69c1046082a844452c7a2274727dfdf4baef5e51b9b6969125bedd2b706a88e52483fd3ee1e97ab9cd6ba596cf75a2f21b9daa8ab6980ddea6781af663bb046158177d80ec76e6f73eab415a9ae773f270f807b0464617568ba386c56924eb22d0946e77fd5a89a41f239e42be74d68ad23a6411a7f4cda2d848c175352318e3eb2064ab8511111111111115b7b49d596fd11a1eedaa6e4f020b7d3ba40d27e1bf93583c4b881ed5aa3d617fb86a9d4f70d457698cb5b70a874f2b8f793c87801803d4bc74444444445e852c0c6c7e57560f55e8339194fddde7fb1d7aba892a65df791dcd68e01a3b000bae8888888888888be8049c019254cce887d1cb1e49b40da0d171e12db2d9337976896507e50d3eb2a43edcb6ada7b653a4dd74ba3db3574a0b686818ec3ea1ff00c1a3b4f62d6aed2f5c6a1da26aba9d47a8eb0cf5331c4718e11c0cec63076347f52ad60707217a4d732e3188e42055b4618f3c0483f34f8f71fec79ef6b98f2c7b4b5cd38208c105508a58f444e8e6fbfc94baef5e51b996969125badd2b706a88e52483fd3ee1e97ab9cdd33d253cf4f44668217c8d220877834b83471dd6f68031cb92ed22222222222222222286dee8aebb708ecdb3ca29c80eff00c42e01a79f31130ffdcec7eca860888888888bbf4b031b18aaab69eabd0672329fbbbcff0063af5551254cbd64847735a38068ee0b8111111111111117d009380324a999d10fa3963c935fed028b8f096d96c99bcbb44b283f286fb4a90db73dab69dd94e937dd2e9209eba505b416f63807d43ff83476bbb3d6b5a9b4cd73a83687aaea3516a3ab3354ca711c6383216763183b1a15ae8be838390bd26b9970608e421b54d1863cf0120fcd3e3dc7fb1e7bd8e8dee63da5ae69c10471054aee887d1c9f7e92975debca3732d2d224b75ba56e0d59ec9241fe9f70f4bd5ce586d6f689a6f65da3a4be5f266b18c6f5749491e04950fc706307da7900b5fb57b77d5975db95af69174a83fe42a8753451bc88a1a6270f89beb69393da78ad975aabe9ae96ca5b9514825a6ab8593c2f1c9cc70041f90aeda222222222222222a247b638dd23c86b1a09713d802d52ede75649ad76b7a8b50b9ee7453563e3a704e776261dd60f5602b111111111177e9606362157560f55e8339194fddde7fb1c15751254ca647e3b9ad1c0347600175d11111111111117d009380324a999d10fa3963c935fed028b8f096d96c99bed12ca0fca1bed2a436dcf6ada77653a49f74ba4827ae972ca0a063b0fa87ff068ed7767ad6b57697ae7506d0b55d46a2d455666a994e238c70642cec63076342b591117d1c0e42971d13fa3ebb5236875e6d0681c2dd110fa0a39060d601f064947e60ecefede0a54ed6b689a6f65da3e4bedf266b18c1d5d25247812543f1c18c1fc7900b5abb61da4ea2da7eae9afd7f9ce325b4b48c27aaa68f3c18d1f69e64ab1d6c7fa0deaf76a6d87d250d44dd655d9277513f2727abf851e7d871ec59e5111111111111111585d20f511d2db19d537a649d5cd15be46427fea3c6e37eb72d52222222222efd2c11b63155560f55e847c8ca7eeef3fd8e0aba892a65323f1dcd68e01a3b000bae8888888888888be8049c019254cce887d1c71e49aff0068145c784b6cb64cde5da25941f9437da5486db9ed5b4eeca7493ee975904d5b282ca0a063b12543ff0083476bbb3d6b5abb4cd73a83685aaea3516a2ab33d4cc711c60fe2e16763183b0056b22222965d10fa39beff002536bcd7946596969125bedf2b706a88e523c7fa7dc3d2f573961b5ada269bd97e8f92f97d95ac635bd5d251c7812543f1c2360fe3c805adfdabed12f7b57d4d25defb388a7692da1a6638f530c59c88c03c8feb769e7e1603d8e8dee63da5ae69c104710550a56fb9cba89d49af2fda62490f575f422a636766fc4ec13f23bea53ad111111111111111472f7416f06dfb0d8adcd760dcee90c2403cdad0e93e4cb02d7a22222222efd2d3c6c84555583d5fa0ce4643f778ff0063af5551254ca64908ee00700d1dc17022222222222222fa012400324a999d10fa3963c93681b41a2e3c25b65b266f2ed12ca0fca1a7d65486db9ed574eeca7493ae974789aba50594140c761f50f1f63476bbb3d6b5abb4cd71a83685aaea3516a2ab3354ca711c60fe2e06763183b1a15ac8888a58f443e8e6fbf494daf35e51b996969125bedf2b706acf648f1fe9f70f4bd5ce58ed6b689a6f65da3e4be5f666b18c6ee525247812543f1c18c1f69e402d6aed87693a8b6a1ab66bf5fe73ba32da4a4613d553479e0d68fb4f32559038715e931ccb8462391c1b54d1863cf0120fcd3e3dc7fb1e7bd8e8dee63da5ae69c1047105659e8817775a3a43696937cb63a999f4b27887b1c00f9dbab678888888888888888a20fba535ae658b46dbf7b84b5353316f7ee35833ff007a84a888888bbf4b4f1c708aaab07aaf419c8c87eef1fec75eaaa24a994c9211dc00e01a3b82e0444444444444445327a1c74788a7868b689ae2903d8ec4d6ab74ade047a33480fcad1ed522b6e5b56d3db29d24fbadd1e26ad94165050b1d87d43c0fa9a3b4f67ad6b57699ae3506d0b55d46a2d475666a994e238c1f3216763183b1a15ac8888a58f443e8e6ebf3e9b5e6bca3732d2d224b75be56e0d51ec91e3fd3ee1e97ab9cb1daded134decbb474b7cbe4cd6318ddca4a48f024a87e383183ed3c805ad5db0ed2750ed4356cd7ebfce7746594948c27aaa68f3c1ad1f69e64ab1d17d1c38af498e65c2311c8e0daa68c31e780907e69f1ee3fd8f6f6475125b76b3a56a5c0b1d05ea94b81e18c4adc8f932b6d4388ca222222222222222867ee987ff62ffefbff00f050cd1111177e969e38e2155560f57ff0e3e4643f778aebd5d449533192423b801c034770f05c088888888888888b2d7452d9ec5b45dafdbadd5d1192d5420d6d70c70731846187f69d81eacad886d4b595a7673b3eb86a6b88020a18836185bc3ad90f0646df59c0f52d5fed2f5cea0da16acaad47a8aaccf5331c47183e6411e783183b00fea9a53679adf55d2baab4ee95bb5ca06e733414ce31fa83b913e0bc6be59eed63b83edf7ab6565baad9f0a1aa85d1bc7b1c32bce4452c7a21f47375fdf4daf35e5139b6969125badf2b706a8f3123c7fa7dc3d2f573961b5bda269bd9768e96fb7c99ac6306e52524781254498e0c60fb4f2016b5b6c3b48d43b50d5d35feff0039038b6929184f554d1e7835a3ed3cc9563a2222bab43be3aed5d636ccf0caa657c1b921e5201237cd3e3dc7fb1b6c8ff26df5055222222222222222877ee9652bdd6ed155833b91cb5719eecb84447ee950ad111177a969e38e1155560f57ff000e3e4643f778ae0aaa892a6532484770038068ee0b811111111111111114d3f735ed51790eafbdb99f8eeb29e95aefd5c39c47ca02e6f748ef9510d974a69d639cd86aa69aae403938c61ad00fcfca8d9d1c744d2ed076c363d337027c8a57ba6aa68382f8a3697b9a0f6640c2da3daadf456ab7416eb6d24349474ec11c30c4c0d631a0600002c57d2b367367d79b2abb4d3d2462ef6ca67d5d055067e31ae60de2ccf3dd700411edec5ac6452c7a21f47275f9f4baef5e5196da5a4496eb74adc1ab3d92483fd3ee1e97ab9cb1daded134decbb48497cbeccd631a3aba4a48f024a87e383183ed3c805ad5db06d27516d4356cd7ebfce43725b4948c27aaa68f3c1ad1f69e64ab1d111115cbb2da535db4cd2f461bbdd7dde963c679e65685b6e68ea801e87eeff45ca88888888888888a367ba1766757ec5692e91b726d9748a47bb1c98f6b99f6b9ab5f4888bbd4b4f1c710aaab1f8bf423e4643f778ae0aaa892a6532487c001c0347705c08888888888888888a65fb9b37985aed5ba7deefc6bfa8ac6027b06f30e3e705ec7ba3da6e7abd27a7354431b9f1dbea64a69881f01b280413fee601ed515361bae1db3ada859b5618dd2c14b296d4c6df84e85e0b5e078e095b43d1baaf4feb0b2c379d3b75a6b851ccd0e0e89e096e7b1c39b4f81587fa5ced86c1a3b67b74d374571a7aad477481d4d1d3452073a9dae18748fc7c1c0ce01e24e16b914b1e889d1c9f7f7d2ebbd7946e6da5a4496fb74adc1aa2394920ff4fb87a5eae72c76b7b44d37b2ed1f25f2fb3358c68dca4a48f024a87e383183ed3c805ad5db0ed27516d4356cd7ebfce77465b4948c27aaa68f3c1ad1f69e64ab1d111111656e8996575f3a40e95a70c2e8e9ea8d5c87f3446d2e07e706fcab684b8ff27fb1fbbfd17222222222222222b336d7a586b4d95ea2d361a0cb5744f10646712b46f30fce016a82a21929e6920998639637163da79b5c0e082b85177a969e38e1155563f17ff0e3e4643f778ae0aaa892a65324878f200700d1dc170222222222222222222c91d1cf680766db57b56a098bbdef2e34d5ed1db0bf838e3bc703ec5b2cd5563b0ed0b435559ebbabadb45de946ec919072d70cb5ed3de381056b4f6ddb21d55b2dd412d1dda9249edaf79f23b8c6d26299b9e193e8bbbc156151dc2be8b3e455b534dbdc0f552b999f90ae173a5a8972e2f96471c6492e738a965d13fa35d45d2aa9f5aed0edaf82dd111250dae76e1d50ee61f2b4f260ec69e7dbc39cabdad6d134decbb47c97cbeccd6318ddca4a48f024a87e383183ed3c805ad5db0ed27516d3f574d7ebfce71c5b4948c27aaa68f3c18d1f69e64ab1d11111114b9f739348bea3515fb5acf11eaa9201434cf3daf79de7e3d4037e5537d171fe4ff63f77fa2e444444444444445ae6e9b1b3297446d3a6bf50d396d92fef75442e6b7cd8a6ff00891f871f38781f0580177a9a9e38e1155563f17ff0e3ed90fdde2b82aaa24a994c921e3c801c0347705c08888888888888888888a4c7455e9212e828e1d21ac4cd55a6cbb14d52df3a4a1c9e58f4a3f0e63b3b94e2a1acd2fae74df5d4b3db6fd68aa671c6ecd13c1ec23f8158e2f9d19362f76aa754bf48b692471c9149552c2cf506b5dba3d817bfa1f625b2ed1954dabb0e8fa18ea9872ca89f7a791a7c1d21247b151b64db268bd985aa49af3708ea2e5bbf88b6d3bc3a790f6647a23c4e16ba36c3b49d45b4fd5d35faff0039c716d252309eaa9a3cf06347da7992ac744444445dcb4d0565d6e74b6cb7c0fa8abaa95b0c113065cf7b8e001ed2b69db05d030ecdb6636bd32cdd754b19d756c8df4e77f179f50e0078057f222e3fc9fec7eeff0045c8888888888888ad1dac683b26d1f45d7697be4398a76ef4333479f4f28f83237c47d63216b4b69fb37be6ccb53d45a354d310d8dc7c92467c0ac67639a7bbbfb472564d5544951319243c790038068ee1e0b811111111111111111111115c1a3f58ea9d2157e57a6afd5f6a94f334f316877ac722b2ad074addb452d3885d7ea3a9dde4e9a8222ef940195e46a8e921b61d434eea7a8d5b351c2e182da18994f91dd96807eb58a6b6aaa6b6a5f5559512d44f21cbe495e5ce71f12575d11111117244c7cb23638d8e7bdc70d6b46493dc14e7e867b01974c887681aca9836f12b336da391bc691ae1f947773c8e43b07ad4ad44445c5f93fd8fddfe8b951111111111150f71ceeb78b8fd5e2ad8da2e81d2fb40d3b258f53dba3ab81de7472729617fe7b1dcda541bdb4f455d6ba3e59ae3a59926a5b28cb8752dff00350b7b9d1fa5eb6fc8147caaa79e9677d3d4c32432b0e1cc91a5ae69f1057022222222222222222222222222222222be366bb2bd75b43ad6d3e98b0d4d4425c03eae46f574f1f8b9e787b064a9bdd1ff00a32e99d9dc905f2fef8afda8da039b2399fe5e99dff4da799fd63c7b805209111111717e4bff004ff77fa2e5444444444543dc73bade2e3f578afac6868ef27993daaa4565ebcd96e82d70c77f89b4cd056cceff00cc08f7261e3bedc1581f58742cd235ae7cba6352dcad2e27cd8aa182a236fd8efad62bd43d0d369542e73ad373b1dda31c875ae8643ec70c7fdcac4bbf46edb3db77bacd13553b47a54d3c52e7d8d712ad9add92ed3a889f29d01a92319c64dba423e5030bc5a9d1fab29b1e51a6af116796f51c833f52e94d66bbc3218e5b55746f1cdaea7703f62e3f7aee7ff2eacfa177dca8f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb93c8ab7e2751f447ee4f22adf89d47d11fb954db75c1df0282a9dea85c7f82fbef5dcff00e5d59f42efb976e1d35a8a62ceaac5737efe3777695e739e58e0bd4a3d9cebfac38a5d15a82639ddf32df29e3ddc97bf6cd846d7ae0408767f7b667975f0753fbf857958fa256d8ae0e1e556db65a81e66aeb9a71f47bcb24695e8495af74726a8d690c4cf4e1b7d3173bd8f79c7fdab34684e8c7b26d2ae8e77d91f7aaa660f5b7293ac191da19c1a3e459928a969a869194b474d0d34118c32289818c68ee00700bb088888888b8bf25fb1fbbfd172a2222222a1ee20eeb78b8fd5e257d634347793cc9ed552222222260772f981dc10b5a46081f22eb7bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdc9ef7d0fc4a9be89bf727bdf43f12a6fa26fdcb96182084110c31c60f30d68195c981dc17dc0ee08888888888888888b87f25fb1fbbfd3ec5cc88888a87b883bade2e3f57895f58d0d1de4f327b554888888888888888888888888888888888888888888888888b87f25fb1fbbfd3ec5cc888a87b883bade2e3f57895f58d0d1de4f327b55488888888888888888888888888888888888888888888888888b87f25fb1fbbfd3ec5cc8b8dee20eeb38b8fc83c4aa98d0d1de4f127bd548888888888888888888888888888888888888888888888888888b87f27ff00a7fbbfd3ecfb39952d686e70399c955222222222222222222eb57d54345453d6543cc70411ba595f82775ad19270389e03b17cb6d6d3dc2df4d5f49275b4f53136685fba46f31c0169c1e23208e6bed555d2d23633555315389656c51995e1bbef71c35a33cdc4f003995f21aba69ea2a2086a61926a67064f1b5e0ba225a1c0380e2d25a41e3d8415da5d7ada9a6a2a596aeb278a9a08585f24d2bc318c68192e713c001de57334873439a41046411c8aa9742c576a0be5a69aeb6ba8ebe8aa99bf0c9b8e6ef37bf0e008f685df4445c7248c8e3749238318d04b9ce38000ed2adbb46bdd23756d63e8af90399474e6aa7748c7c404239ca0bc00e67eb3723c55141aff0049d7d0d656d25d1d24544c63e76f92cc246b5e70c708cb37dcd2793802171c5b47d1f2d2c9570dce79228e7f2790b682a09649bbbdba5bb991c083cbb526da3e8b86d745737df19e4b5b1be581cda795c4c6c76eb9e5a1bbcd60231bce0078aec5e75de93b3d5434f70bdd3c4f9a264ed2d6b9ec6c6f386bdee682d634f639c402973d73a5ed9786da2bae124358f9a3818d349316ba47e371a1e19ba7391daaaa1d6da5ebaffef152de2292bfac7c4d8c31e1af7b3e1b1af2371ce6e0e5a092307b95569d6ba5eeb7b759682ed14f5c0c81ac0c786c85870f0c791baf2deddd270ae3444444444444445c5d4b3f34fca7ef5ca88888888888888ac0db3457e8ed14179d354f575571a19e460829dae717b6685f164b4730d7ba37e7b0349563dbac9aba82c35b709a9eef5559a5ab29a96df1eec9bf5f0415323a47b5bcdfd6412b5b919c9663b175ecfa6f5ccb60bc50dc1b7335963b79a9b74ae0f02aeae674554430fa5baf89d1e38e37c8ed5e9e888f5643aa25b85eadd7b36d68aad4a23ea1e5c24959d5b28daded7b5bbe7abe60e3864a6a2a4b9cbaf6f13d2daaf75be5f4b500f5d495119a661a221a19235c619622e01bd5101e24713838caf3abb4ddeed560eaacd6dbdb7aed29472d5319d73dcfaa8ea222e6e09fca866f8dc1c71c00ec5d8d554359a96e17abc4964d44fb6457cb4d4c2c34d530cafa763436774710c3ce38f0037873c02b935158ee74b53b44758adb7c8eb2e5e475347235950e6cd4d8805435a738eb384837321f8e0dc04b269cb857cf65a57c7793649aff0033e48594955451c30790b810048f32b627483d2dd05ce70030467a77bd3d73ad9f5bdaa9ad57aae15b6fb839934d154d3bd92091ae861dede30d430e3f1659c43416b8712172eaca19268243159f55c909d32c8b4f363a7abdfa6b807cbbc5fe946fcf5477a4c0dd1cf0bdeb1d1d4335f4f26a4b7ea396f5e5f0ba86ae99929a56530a660707483f1419d675bbcd3e71241c15e56c6a1d41a5a8e193535a2f3539b4c5ef78a7a294f92b04a5b253ba3f46425cc90b8e0b867b1985dca2a1aff7ef50936fd4cdd56faab99a3ac6b656d2f93b98ff00260e91c7aa2cc7561ad6e5c1e3240c12add36bba4b60ad8b4f5ab5452c6eb251c57064d154c72495e2aa22f7303fce73c33acde7b32304715ed9d2f5b6ed4b51536ea0bcb194baba88511eb277b1948f8a2ebdcd0490632e73f79dcb2389e0b2f5d62ad9edf2c56fab652553b1d5ccf8bac0ce233e6e467864735c95c5cda39deca7754b9b1b8b61040321c7c1e3c38f2e3c160cd4b6ebc6aa9753d45a6d57e91953a625a664573a134c68e5eb18e14b079ad0f0434e4e1dc5adf3f8e15d54974acadd6179d656dd3d796d350e9aea190d55be58259ea1b23e510b18e01cf200032d0465d80572d45a2f369d92d2d9ededab7deef33451dc2ae38c992396aa41e533bb032ddd0e7e09f83badee4da7362b7e993a5ed76dbfd144eb61828eaad141e521d86968a57e1ae73011ba727773d8e0415686afb65fe86cf5f416cb6dc292b2fda72968eaa8a1b33eb2074cd85d188a29db2621dddedd719410079c092afea7b5d7d6ebbb3525c29a6f7b74fdad93c6f2d3d54d5b2663c827838c6c6bbc41941ee5655aad37c1aa34f69ca38ee9ef559f504f5dd5d5599f0f5116273bceaadf31ca09930d0c1921de7725eb6cfaaa6d41a9ed975bfdb2fd6faba6ebcdb6da6c53d2d1d007b5c1c5f2b9987c859c32486e5c40193959711111111111111111111111111111111111111111111111111111111111111111111111117fffd9, 'AC', 7),
(17, 'rosanchez@trazalog.com', 'Roberto ', 'Sanchez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010100000100010000ffdb008400090607101011120d1113110f0f1210121910100d161010100f12161716161615161f181e342c241a2a1c1613213d2d31352c2e313118203344352c4334393a2d010a0a0a0e0d0e1a0f10192d1d20253737372d2f2b372d372b2c312f2d333335372d2b2f2e2d312b2d2d2d2f2b2d2f372d2b2d3737372b2d372d2d2d2b2b2b2d2dffc00011080064006403012200021101031101ffc4001c0001000202030100000000000000000000000607040501030802ffc4003d1000010302030603010c0b00000000000001000203041105122106133141516107719122143233425253627281a1d1f015172325439293a2b1c2e2ffc4001a010100020301000000000000000000000000030401020506ffc40028110002020103020505010000000000000000010203110412210531152241516123528191a113ffda000c03010002110311003f00bc511100444401142f6abc4bc3e81ce84b8d45437430d359d90f47b8e83cb8f655fd778e35449dc52c11b796f9f24aefedb2c651b28b65e88bcfadf1ab13bdcc748474c930ff007532d93f18696a5cd86b19ee3909b093367a7713d4f16f2e3a774ca0e0d16822f96381008d411a11cd7d2c9a8444401111004444070aa6f1976edf4ffbae95e59339a0d4cacd1d131dc2369e4e2352790b7556ad4cc2363a4768d634b9c7a068b95e44c5f117d54f355bf57cd2bde7b6626c3c80b0fb16ad9bc239661a222d09c222202d5f0776edf0cacc2aa5d9a9e439699ef3f0121e11dcfc47701d0f62af65e350e23506c41b823911a83e7c17a4365fc4fc3aa591c724e20a82c607b6a4189a64b00eb38e9c6fcd6e990ce3ea89da2f88de1c03810e04684588217dad88c22220088880d1edbca59875738711473dbf91c1793c2f5aed6d3ef686b221a97d24e00ee58eb2a0fc33d9d13bbddd28bc519b44d3c1f2686fe4dd3edf255f516aaa0e6cb1a7839bc238c17c3a9a6877d2c9ee77b8031465b98d8f37f4e5a715815db018845ef636cedeb0b9a4fa3ac55cab0717c523a58ccf2e7dd820131b5cfb5efc6dcbbae1c7a8dce7c739f43a6f4d04b928caac22a62f848268feb31f6f5b2c78207c8ec8c6b9eef92c6973bd02b79fe2051866f036a8c7f2c44e0cf526cb7b475cd7c02adb1bda1f1978616b5b3380bd858733cbcd5b96bad82ccebc10aa2127e59151516c3e232dad0165ce9be7323edccdd6f3f53f8bdaf969fcb7dff2a5743b7146f7c408a88f79231ac3242f0d739ce000b8d15c015bd2596d99ff0048ed2b6a36c31b1e4a1703c376930521d1c124d4f7f6e9d8e6d442e1cec1a6ed3dc0f5573ece630dada78ea8472439ef9a29da58f8ded2439a6fc45c1d56d2c8aea4546f272888b26022220353b433b9b159ba663627b58a8ac4c6b6c0001a3e2b6cd1f729bd746d731cd7d8348d49b69dd42dc2c48bdc03c4735e7fab464ac52cf075740d38b58e4eedec5f367fa87f05db4c6173dad31900b803ed923ef0b0d173a3734d3c2fd1725526b197fd26fb8664dde56eeed6c96196dd2dc2ca2f513064a58cb08daf00b6c08234bdeff6fa2e062d3e5c99b4b71b7b5eab055fd5ebe36a8a82c60a9a7d2ca0dee26ef858f0039ad73410407004023810bb828352e3552ea98a9b38dde76dc3400e2d02f6254e576b4f7c6e8ee89ceba9954f0ce51115822088880e2eba6b27ddb1d25af945ec39aee5d751107b5cc3c1c085a4f3b5e3b9958cac910aeaf7cc7da366f268e03f15852bf282e3c00d576cd11638b1dc41d7f3d162d7fc1bfeafe0bc85929ca7e7ee7a1ae31515b7b1908b5f85d5e61bb3ef870fa402d828dac3240b4f886f58e2439f909d2c4d85f968b708917806bb65066ac86faeae3afd572b3944b67dbfb76f60eff1652e5e8fa5bcd4dfc9c7d7bfa9f80888ba6510888802222035b89e16d9b5f7af034775ec7b28ce2983d40639a185f71a64b1beaa6e96546fd0556cb73e1fc166ad54eb585ca2aa182558d443283d405b2a782ac68fa794fd26b75561d92ca17d2ab7eac9bc427ec884b28a63fc29079b485f5fa3e6f9b7fa29a592cb4f08afee63c427ec8d3607863a32647e8e22c1bd07e6cb7288ba54d31aa0a11ec53b2c7396e672888a534088880222200888802222008888022220088880222203ffd9, 'AC', 6),
(18, 'm.muriel@mrsservice.com.ar', 'Marcelo', 'Muriel', 1, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010100000100010000ffdb008400090607101011120d1113110f0f1210121910100d161010100f12161716161615161f181e342c241a2a1c1613213d2d31352c2e313118203344352c4334393a2d010a0a0a0e0d0e1a0f10192d1d20253737372d2f2b372d372b2c312f2d333335372d2b2f2e2d312b2d2d2d2f2b2d2f372d2b2d3737372b2d372d2d2d2b2b2b2d2dffc00011080064006403012200021101031101ffc4001c0001000202030100000000000000000000000607040501030802ffc4003d1000010302030603010c0b00000000000001000203041105122106133141516107719122143233425253627281a1d1f015172325439293a2b1c2e2ffc4001a010100020301000000000000000000000000030401020506ffc40028110002020103020505010000000000000000010203110412210531152241516123528191a113ffda000c03010002110311003f00bc511100444401142f6abc4bc3e81ce84b8d45437430d359d90f47b8e83cb8f655fd778e35449dc52c11b796f9f24aefedb2c651b28b65e88bcfadf1ab13bdcc748474c930ff007532d93f18696a5cd86b19ee3909b093367a7713d4f16f2e3a774ca0e0d16822f96381008d411a11cd7d2c9a8444401111004444070aa6f1976edf4ffbae95e59339a0d4cacd1d131dc2369e4e2352790b7556ad4cc2363a4768d634b9c7a068b95e44c5f117d54f355bf57cd2bde7b6626c3c80b0fb16ad9bc239661a222d09c222202d5f0776edf0cacc2aa5d9a9e439699ef3f0121e11dcfc47701d0f62af65e350e23506c41b823911a83e7c17a4365fc4fc3aa591c724e20a82c607b6a4189a64b00eb38e9c6fcd6e990ce3ea89da2f88de1c03810e04684588217dad88c22220088880d1edbca59875738711473dbf91c1793c2f5aed6d3ef686b221a97d24e00ee58eb2a0fc33d9d13bbddd28bc519b44d3c1f2686fe4dd3edf255f516aaa0e6cb1a7839bc238c17c3a9a6877d2c9ee77b8031465b98d8f37f4e5a715815db018845ef636cedeb0b9a4fa3ac55cab0717c523a58ccf2e7dd820131b5cfb5efc6dcbbae1c7a8dce7c739f43a6f4d04b928caac22a62f848268feb31f6f5b2c78207c8ec8c6b9eef92c6973bd02b79fe2051866f036a8c7f2c44e0cf526cb7b475cd7c02adb1bda1f1978616b5b3380bd858733cbcd5b96bad82ccebc10aa2127e59151516c3e232dad0165ce9be7323edccdd6f3f53f8bdaf969fcb7dff2a5743b7146f7c408a88f79231ac3242f0d739ce000b8d15c015bd2596d99ff0048ed2b6a36c31b1e4a1703c376930521d1c124d4f7f6e9d8e6d442e1cec1a6ed3dc0f5573ece630dada78ea8472439ef9a29da58f8ded2439a6fc45c1d56d2c8aea4546f272888b26022220353b433b9b159ba663627b58a8ac4c6b6c0001a3e2b6cd1f729bd746d731cd7d8348d49b69dd42dc2c48bdc03c4735e7fab464ac52cf075740d38b58e4eedec5f367fa87f05db4c6173dad31900b803ed923ef0b0d173a3734d3c2fd1725526b197fd26fb8664dde56eeed6c96196dd2dc2ca2f513064a58cb08daf00b6c08234bdeff6fa2e062d3e5c99b4b71b7b5eab055fd5ebe36a8a82c60a9a7d2ca0dee26ef858f0039ad73410407004023810bb828352e3552ea98a9b38dde76dc3400e2d02f6254e576b4f7c6e8ee89ceba9954f0ce51115822088880e2eba6b27ddb1d25af945ec39aee5d751107b5cc3c1c085a4f3b5e3b9958cac910aeaf7cc7da366f268e03f15852bf282e3c00d576cd11638b1dc41d7f3d162d7fc1bfeafe0bc85929ca7e7ee7a1ae31515b7b1908b5f85d5e61bb3ef870fa402d828dac3240b4f886f58e2439f909d2c4d85f968b708917806bb65066ac86faeae3afd572b3944b67dbfb76f60eff1652e5e8fa5bcd4dfc9c7d7bfa9f80888ba6510888802222035b89e16d9b5f7af034775ec7b28ce2983d40639a185f71a64b1beaa6e96546fd0556cb73e1fc166ad54eb585ca2aa182558d443283d405b2a782ac68fa794fd26b75561d92ca17d2ab7eac9bc427ec884b28a63fc29079b485f5fa3e6f9b7fa29a592cb4f08afee63c427ec8d3607863a32647e8e22c1bd07e6cb7288ba54d31aa0a11ec53b2c7396e672888a534088880222200888802222008888022220088880222203ffd9, 'AC', 7),
(20, 'a.lazarini@mrsservice.com.ar', 'Lazzarini ', 'Alejandro', 0, '21232f297a57a5a743894a0e4a801fc3', 1, '', 'AC', 7),
(21, 'pauspont@trazalog.com', 'Paula', 'Auspont', 0, '21232f297a57a5a743894a0e4a801fc3', 1, '', 'AC', 6),
(22, 'f.molina@mrsservice.com.ar', 'Federico', 'Molina', 0, '21232f297a57a5a743894a0e4a801fc3', 0, '', 'AC', 7),
(23, 'c.llampa@mrsservice.com.ar', 'Cesar ', 'Llampa', 0, '21232f297a57a5a743894a0e4a801fc3', 0, '', 'AC', 7),
(24, 'g.rodriguez@mrsservicve.com.ar', 'Guillermo', 'Rodriguez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, '', 'AC', 7);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(25, 'user test1', 'nombre test1', 'apellido test1', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010200000100010000ffed009c50686f746f73686f7020332e30003842494d04040000000000801c02670014686d37614e304456575350765f61657444746d4f1c0228006246424d4430313030306162633033303030303965313130303030636532353030303030353236303030303735323630303030326533383030303034663534303030306264353730303030393835393030303061653563303030306562396530303030ffe2021c4943435f50524f46494c450001010000020c6c636d73021000006d6e74725247422058595a2007dc00010019000300290039616373704150504c0000000000000000000000000000000000000000000000000000f6d6000100000000d32d6c636d7300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a64657363000000fc0000005e637072740000015c0000000b777470740000016800000014626b70740000017c000000147258595a00000190000000146758595a000001a4000000146258595a000001b80000001472545243000001cc0000004067545243000001cc0000004062545243000001cc0000004064657363000000000000000363320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074657874000000004642000058595a20000000000000f6d6000100000000d32d58595a20000000000000031600000333000002a458595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf63757276000000000000001a000000cb01c903630592086b0bf6103f15511b3421f1299032183b92460551775ded6b707a0589b19a7cac69bf7dd3c3e930ffffffdb004300090607080706090808080a0a090b0e170f0e0d0d0e1c14151117221e2323211e2020252a352d2527322820202e3f2f3237393c3c3c242d4246413a46353b3c39ffdb0043010a0a0a0e0c0e1b0f0f1b392620263939393939393939393939393939393939393939393939393939393939393939393939393939393939393939393939393939ffc2001108025801c203002200011101021101ffc4001b00000203010101000000000000000000000203000104050607ffc40017010101010100000000000000000000000000010203ffc40017010101010100000000000000000000000000010203ffda000c03000001110211000001c9b313f59e86c49ade26e68a1b00edb94b928b950baba2eea17550bb185a19cf34311a474904dd692d839acd58b7f3a57581177564d59fa7663b5e624bb965c23573fa5cdab28524b3d5a2c73044dd935ae09524cf6295ef684aac00b1963f3369572441212e540a0c2e5424aa0aa003cdd78cdfa12e86956bd33902a2a5d46de6f4b9b47756598f43522f1ea8c96072ddd5965446ae7efc7647b523b9b0a5a3bb26acfa6ce7c93371393dea3c4c49552c7e37acb95095244aba24a8b75512eaa16b24ae6b32471868345963ab80505522ece77439f616922b0f1492de943ecc46b394ec6e9841a6c333e61170b368a592eeeab4e7d29ce85256eb996846544d19d8666542e548952895296eaa12ea549551599b861eeb3b1ce8a1c96ac5905432d375d22772e9ab12884245e9cfa34e79514595ecd4a52821ea72851ace53212ab2a3b0742b69c99d6b32e23566dd5434e3d78c6d492d4825d412eaa8b952ae89e994f719826f8288e42e9905af451917bc4e7744561657e6a3241cae251a33466d5a73f45b51bcfa296cc4c2abbac8c0383312d42b3658cbe7ea979f064acaaacad8bd359a94d2558cb2a516304951d6069740a2861b4815d159e8d3796d355e52345a095b4365d5c001d49913bd6b8c8d637b7cd76b284a199acb12a3203a220659918b717aa613467164a5a50fb39b2494a54cade0ba5b2a4b06c495288335a0be206ad6b56824078e708d3594535cc70da5848de780d77b3034d879594fb51975705ade264d402989aa21c6a2a69a5946e4f5359c059939b65472db04ac27e7d1a73649352ea6269e7f439f4f92a5aa8258c658c78aa0974b505cca8c5a5850dac6b2dc0e7e82c586c518edfa0c2d5546d6f35abd266079b4b2b46c12a106519f3ee5990ec7518e30d675af0eacdc86864ad25b29840764d19f4ea73a1ccd4dd371454265d415955416c5c4a5c4a9a4525813107288c2d88d83897aab667d1cf1b50806c71ce8562f4bc4c2c335b7f35f1d06e179aa28eac4e088d599e8c2c37a5d673da964ad6a9da86c596a1ea5e90272eb355a72ebc5e668cba0b1b15961a518bb5a826d50357a6cc9906410401ba29d4d78acd387a1ce1c6b319a33ed397bcb251089ca2d16a7384ecad3924749d8342eb24b4b129494ea58a6a5bacf3d89d034d7b3a6434a7366bf4e5d15cf8331a1d591f960d19deb06085ad0d4149a655ac9875791d86d78f863112e42765b78a9c6a69b39bd3e60654f5aea63659cf34ba08a8969ca7273e4a04f5acc9a56b97a0fc1a0d8486d101c33a3626cc1a995a8fcf9ca0dca706eceee939d24e76b4657e6e36a8d65489ae8d4abccdcd0642d1bd0e79576bcf747a09e2677f8a7470ecc2687657475395d545510005bb26a5e438091a4b92b5f8b7d73b78e5492ee505b5653598ece8bf0e99755a9b516d132e6df9ac4909d30c0f59b6e77e9cf926343a72e9c3212cca62b40f4b50a843570c7ab4128a8a95d1aee8e3d471fccfd0f3a7836efce74f22e11a874ac62c852b5e4b2c0b72af66124ca60529d8d94a6a8d58b761b0b56691d1763d16e882452340d9869f9e984bbde6f4e3d358a554a3a3369e5711a8cadb87a01677e79728de848d0e6af5a63d14deb2fb71f30f6cae9d8d1e302fa2cb749e6d1ed39c797d598a5d84923467e8e5b0b34296a89412b564a3b0a86001d6b1d7ce47637d456be7eab76b733c655ca4e5dd9d318d37515dac19a963cc99753466d39bcf6258b7d2e674d267d19e5c9d7e4748e367b88dd9904f55d7f9d76adf64cc5af37c9f1fe85cab30f66bcbd9e8d9e53bebbf9ba44f3ccf50d4f3fcff6ce3c3dfb3e7af9c4eec31a71e9cb54b3e842982ba621f9919064a17166fd1874d6b2532ad4d14c99377380c823171925d4d48201105174b99d3221e8972efc3b93cf1812b86c50081f5dcebf0b01ef5de6b72f4bc3fabe99f39eaeed66a87a0ae82d90ca2a8b4b7955ab87db23c14f59e42b6265c52cd63b2ebc9570462c440d5ab06b36bb2bec7545d5737720f3fa68a249234a7a3ce1b9b4228fa7caea2929ca3274b9dd34f2f6370d19456fe76bad79f5651bd3e66f5eb757c3fa33b0bcc98e81aa5226ce4c7a1c5e18cf7fcef0fdcaf41d0ccc8d3c1f4994f9e68d9cf0d6603b2eac95144101ab5c3358d1a5aa7d1e853ac99f4a4e3a37e08a921ecfc8fd17c5cbcbb1bb17d5e47547a9812e6e9733aa9e4e4a195509af2ebad98b7601ba71f4235626e5aebfa5f0fea65d22cad33f8df49e5a346ac5d98ca0931becfc46f3d73f26b39fe2bdae5af2555923ab8cf7598f5a945ae04a34346cd38f49a5d99f63566358b97d7e58b9265e839958e95150d3b306b37d5c5c7d8e3f624f202d597210c6b155d1e7f444bceb70fcbb79e68eaf1f52fb05bfcda3bcefa9f312ecb5b4c0d49a3686d7dbebe079cafa1f9df41c4b0b87aa1c6af4de6606f0b65d20aa180346dd38b51a5f95d5a686ec4737a5cf32c9327a580211a9623a184abbc4b72e4e8e27271f1f678f146075d146e59a79cc82da97cbab9dd5e4d8741acf66cc5b287c8fade7cbc0ba1805e8ca85160bea7d5795f4068e36dc7a9cfe7f47ce1e9346791cdf3ded28f195a31cad1531356c434d0ecec5d44965061db8ecc72a46c050c355540a9f55d3d18778a5e8ccace07abf2d24d58f4d6ec8d40d721e65766297ad81fbaccca592f47d5787fa12724e6739fc8f5b865e2e1e8e7326fd9d4b3690dacccecb65785fa178e8e8f4793474d9c4ee85c2e8b2bca4f67c68e36bc1be1c6b3569a4c2c9a335639511c243142540032877538dd5b7465d2b8d1c0ed66b382ecae37e76e7346ce7748e76e2ce6a3cba0ccc436577d1bc4fbaacdcbef20f38bec0160491de7fb8662dcab263bcb61bb3c29abdc785f63c8eb180785d30b6f22f37b3c625d8c20294c944121a832c09a9a6ac72a1b12eaa89bf9cfaecde672a3428cf36beb72a34866df6174b9ba0ce6938d1a71ea5c6c56b3d87780ea4f23ca4fa0e42d4bc7477d0720f37213bde7f959c24f4000ef73731dd0e66dae96dc167270fa9f3d081b9055554cb0296ec616a351862aace8c3a80a2106ac4a9407636f1fa7460ecd2e8f2beb78672c9cb427e36569a24c3f772f42d7ade3fbcad1570f96afd371cf4ddecfa84f87ebf8e4094c84e9d943f31e3ad00352d28d475babe7b3d9eb782ece04922aa41963092a96d2684c10669d8131c846d645b1c03406b7582ce9d2dea925ec8f3abdfcf45a9a01829c3f6e262faef59837d63f29d0f127d476791f5c8b469f9d9cad39ba10b76475b00821b8b6e2abba1820806a434115b2b39a19835972ac2aba5aa8256776532c92bb011b221da20a072ccfab374eb2298a8d9b39baedd08d0a1dc3ea1270474846336999fd1713e8b6f640fc9a7a2f28cf5c65db59d78fe118819a736b8caecad1c030652b5a62594145bde66d18dd5cfba288d5e923008bab05a0b02b269c4832e5bea93b1499c98b0ef124ea2ed01a81702fcabaee3316b55133285c1f498e39656c4ec74b00dbed7c697753c7fd3d2e5af05def0488721b2b98ab482fca1d2a0ddc1bab3967222c97283f2441970861a064ba28096a2160064685970e2f7c1a322c1ab14d474a852d5aad6f08cb8fa284d1ab351d2053d726e524e9a1028755148d70e9fa1f248ae356234b65543cf3d9b72f4c4569cd288d2420d65102d6515d15240f542028d60a89652ed228c1ca70e1db12aa05b8e326f7059966951779146a672fa42b268413672f4cbd215b84d356518d0770cd1e5fd778ba113a28809363b9e67472128d379ca1afc8f11750194410ca2b536eaa589411714925159cd769bc1b25c917d2064ab34215a87e56ac5d18a8298891fa6d542b318cf9f6e71faf8bb8e94cef50a700bd9986b4f9cf4bc79310aa87a5ab15702d7bf0b90cb39468664236e6d7466629c56d72c92c2a2e04526d452ed05305aacba14b850ed298a50eb637d800420898aa91a9d2332ed55b958dcf0c0cca3467db9d03572db6f5dbcfd30e5b6ec56bccb1dcfdcc38197d581e547b888e3d74b3db9ada60bddd093027ba358f4aa1522cb0a5c5aa288a8a2aa996db2aa48f4ef1f58a575b3e9135af6acc8e990d818c0d45cdea9956d085d1800a6397564728cd9f6ad336dca9aecb79ed37de46ab06122a9d415508fa4d1a4734189ba24a1080420954b0962a0962ba9509618dc8542f3425a8a64091e8ddc9e95216c1028860546934b5a9aa0219440c04efc3d3b332f62e5ca3a8512fcbaa918ba1980d18823a8ce5baba0580cdb3243556683a6783c522ad05048d5a96354b018b19552e2cba8141b90f70e7258c0a0c3bed25541b18a1b155ad9a51d9cdb590760ae6d0bca9bdf8e095b82162c015d2e675eb2a9cb128d4b8c35a6e970ea2e008d9980d979d6691450e15c2d7616dd858752ca9212ade27656683a0bb0e86e0e0c3d4a2c2a0b5864b7c2f4f2f78391802e8c60166b3a21a73500184b4b68599fb187599d7a84c93528ad3ccd8232ebce631d0b85518ab92c14a9744b9605152ae9805cbbaad14a34a95649524b950bb1bb4a0c3d706388d4dd450dacd966baa021810305095ad1f9ed7507430c6e6e63a0039a969704285810ae9737a4250f5085356245862e9a22c5805c282e152d095146bd065b35d5d8d972a176365ca85ca87a41ba92aac4083b07e7b1aa183105ae30f4d5aa921984b59882b308eae7d19a856c085ada023adcaea5664b150a513c0a60800d11224c001a22e14044e853967422d5c2e8eadab1a0a5590adc0490eecb1920108ae873f78aaadd4a9312bf35d25efcae16243140602aacaba79366206882284c4474b06eac99f66a8e49c84a9015b162dea7002c0028c4113102884d39de9004c5468aa865d12430e880ffc4002d10000202010303030403010101010100000102000311041012132021052231143032332334414224154443ffda0008010000010502bbe2af855cc4f6cf31db936caa58da4337ddb0e057fc75889f96a7c6a76a6aeacb2dcad78e88eed5019a2aea33dd85ecd2fefed5a8f4edbb204d4e384b7f5d062cf99611d8c7a558fba4cd43785c9822fe5a8c7d44aea2d2eb031947e23bad44c5d69b4f6e9466edd54b1f6528f633ed89aac62379ae830342422ef50c4279bfdd2637bad5d93f2d4ff629af26cb33be9f381d832480b40d53721dda5c75ff00d12aacd8c6d5a27cf66ab1c20f8a8e269c102c6e476f99730000c0fb8639f14f982095fe6f5f2d459617ecd37ceea0b462ba72492751935f769bc5e7f25ab12ebf91edd491c22cd2d46cb2c61c77af28abee6fba65996958c01b69d39cd559ceeecd2f96daaacdaed6f4d76bb3f4ddda7cf5ee15d26cb1ad6eed511c220cca50256edc8ec0163a86100c0fbac669f275636aab2f3a81aeb0ff0037669b1d495d394bade7d96e7e9476d286c345a15ed39b7bf544149a6aa5cc71bd5ed51ee7fba6399a3c1b56575973632cabf65dfbfb3487f996b5a0bb973d8ffd3ec5ab88bad361a3c5ba8fdfdfa83fc52b55446624edf2750dc540c0fba4cb5bc68815aab52c5d82812bfd97fefdb3172eda602ab19cb3f6900e906caa49fe3aab7b1ac695fecd57f63bb11d4d9574b4f2e738de91ee279d9f778319d0ccfa548a8140189c44e338c2993c21430233365691a7cfd4b787dc6de3e904ad0bb338d39dd7f2d5ff0063b7e27002bd5599a639cb6ee7a74a7e3f682930550281f73138c4187b3f66d9dd31f4f5d25d2cb871edd60c6a476568d61ea2568496379ffcdd88393ea0f2b3ec8c98b5ef9999999999999fb188442b082266667294274abb2d2fdfad18d408364afcbdd06d713f4bd957b50796fb0a9983026666666666667299999ca666667bf1088562d6cce3a75256eeea0f7eb401a883e5b869dac76b586f6e7e93b2e21294f0bde95ccccccccccccccccccce5394e5394e533333333dd898c42269c1220eed663ad5545c3dc057db67f4f7ac167d5373b7bd1310c27ce66666729ca729ca729ca729ca729ca7281a06999999ee220256631b0ecf9970aebb1ed661dd667e93cef4e041e6ceead66618de466130b4ccccce67069d3f0d522d60089472adab98610f259ca0681a0680c0667b4c2215ec55660ceb49d6bf27efb33f49bb12ba7abe3b517309999984c684c262217995ae2d85d86d67e8aeb043b723b6a33c48ccc4ce20681a030180f7110aed556b86b89ac4d69c91b0ed7cfd26fab202af81d8064fc03b6613099f997415331cc7958c6d980674cefcdb6c4b40e8ef551ca79581a0680c0667b4888dd37762ed04d5926b820d86e549d2fd23ed52f2b352dceded41804c30984c265759b0bb8a613933e5ffea53572973f3d38ecb7074db2d2aa96d86c32c4029cc0d0180ccf69108d84d567a3041041b22725671f47b518e47cdbd8a324ec618622f236d9e36334c0b6a3feaaaf9977e51bfa83b1b2748066055a833176988f9fa598c40d0340603da443b6af3d1820d901765e14b16668dfd3daafc17f67627810c2613154b1b88ad7733440752a43633b0c439fa31b895235b4e52999c9dd87fe3d8880c530180f61867c4d483f4e20d96a32cbbc88238ffc9b0fd15fcee3c9861867ccd3d4bf4dadcf2dda7a783cdb15aed8ce906f5a3584322d43b7da74a37aea6b20388a60301ec30896722a22233c3d3ad2cb1ad68208e17e9363fd7abe37ac430c3b6312ad471a2ed325f4ba356c36ff00ad28e0018208b8e80daba8d91dc4a7f1583b17f46c290a1dcbc2333e22980c07b0c2256a9c9af3c36106cdc7e8f67feb57f8eebf8986318b01c95329b0a4b2b4d42b7a7df97054d2b96a4f27104129cf012bab90b6ce644d3e7aa20837a797000b1c2e98925b723318707530183b088443e371be57e8f6b7faf5fe1b0f2618619fe0d81c447c33bd3669f57a0bd8619669b3ce0304d279b12a0ab6dad691b69ffb0e3160db3394d1297b4dbc5373b6b3dda8062980c07b088c371b18587d1ed6ff00593f1dabfca18d3fd5f25476202f62b14965346a03681a973e0c0669178b5d617b60d94e1f5000bf6cc5a005aeceada0f699abe5d6314c060301ec221837309ffc5b59fd64fc76aa1863411461773344a102eaa9b0c5b0acbb4d46a66a7416d06b50a12c6eaea415d48837d5ff0062005d805a6312c6a216e6f0fd866a81ea182b72aa62980c1b91186f9d867e8f3b37f593f1dabfc4c6867f80f6221b2cf55acfd2a4f4db1adaf1b2d844bb4746a65fa5b34edabfdaa60df55c88aaa36b73545d81e2fa8046a3b0cb519a0a9156cb1ad2c3114c060ec22309999832c42fd3e9db56e5a7ff009abfc765fc4c68d34eaad358caae2d316dcce5340b0e08bbd2f2743a6fa54d66b4a3aeb5962b075316df6ea3d3ebbc594d94156999ca2d6b651659c97769ac07ea36cccc446b258cb4a6c7cc1e229820dcc612cf116826b6bb0adfd4c6cbe68afe361f0634694a854d4397b765b9786975553cf8808807bb5fa7e37dd933d289359db33aa185be9d5d92da2fa252a23da1b4a0f63cd5001f62625188cfed739d38dda298a603d8667812498c6730536a8fb57e60f9d9a1849e9b1e446c619a3d7b2c53158347ac30b3d36a795d69a7af55ab73655a8b44a6d16298a3cadad315b454581523d1a77967a72997536d318cb883b00cec1128849626312749d8229820dcc69678963451bd2dc5d871ba2fcecd3feae674106e653f2acc9a9a6f4ba2d9321a70c9d6d0d55b599a53fcd881625798a8176ff632663640d57a7ab8bcb04aaa2f39e13633ddf49daa629820dda5e3da3dc46c76d47cc5fcb669f2dabfebc1b9942966d6bff2038346b3946c895b59636a34e2e0fe9073a7d20a0c518965895c470e36ff00355ad5d28a35097d7357a44d4ab33abee62f9d2f666298a60306cd628879342b81c789d8edf956bf03e76698e4dacfeac1bfccfc17518e504d2d8c0d4cb644d4b2c7649e2020c0c44f50abab47a472e8597d75c6f51d3a9af574d93d4746754be9da56d3548465c627a96905f5d6db99571e96c61328d3b5c5c22859cc00198c084c550b0c6970f3b6aabe9d911b8b30e360f9d9a632fadfebc1bffab351f84128fdb96aadd36aba8a6acce27207158ad89add6f4a365cea176d26a2fa969d4aea11474de37b1bd4f4dd2753910cd3919860058ad55d42cb1ac630718a4080c106cd2e1e36d753c948dacf728307c4680e2cd7717abb07cacb31f4db56d8375482db2c2f349a928400d1b6b1fa55e4b36663969ba494c762ed5b9adb4f6add5a1e2c464603aea2a6d2db9db4848d4189433ce6b5ec4ccc1160820d8cb21d8e26beb5aed8a67c14fc6199e2fa84e54762413c9d2eca8291ab24d836f4db39567e67a91c539952bdae87a5a6df47774adf8226a5711c26a9353a7b34cdd49a563d7295d2ccecd33b18603160820d8c68ff00946d419759c86cde569394861fcae1fc3b0db8702257e690333034f3e4ea3f50dbd39b8ea0fce713d4bf5515f31cbd95fc0ecd259d5d3f56bcda335bf83d5564d4fa7608b3a22f602f0d333333b882083631a59f318c686662b4a7c410c795f231bf2821970c3cd27b9b228d84b3ce906d4371b9be7d4d6d57d482fa7af276a0ff0037c1dfd28e52ea2ed3df51269bd679c69ef646ba9af54bada592c0672999999d93e04106ed2dd8c308844cca5b306cf34dfab53c7abb0f2751fb110bb52cb53b787104183a71b7295b7529cf8c73564e2f109165abc6ddb33d1ff3990b2df923ca7b5b181cc38d57a7c20a9ccccced51f00c06080ec659da6112a3875d9a50f8afd4530fb57f36565dd9c015fe5a8fec08251e77ae8c8d0581eb33335f5677d463abb667a40c565e663cb4954af52e2c1ee06576143769ebd50be87a4ec8ad61415ac104106c659f13a6674cce9b42861598f287c4695b716d7d791b515e66a1f91826b3f7080cd391d52879045a0b3163a1b3a77d8313198bc44d5698a1335393b62269802a02aecf0d7d4aff0017d0b66bff0020f0bcd2e1abf4f29052143d84ae989160df3b18fdb933a8d39ca4e40867c31cf13e09339932dce209aac6d99a75766d4d812cd84c752a395d8380b7e8b9cbabb116bacd9114ca28e88d8c79a669ea75f0d47a68caeb72cda2bcb1c7f1c4b2c0134a8b35740ba147a6d83b5bec50705766958ccd5712f047c74a097e4e9e2541417e7357f98820f32b184b6be43135ba63753a2ea8aba84cf6cccf515b83e96c36550c683f2bf85e142d735f47b74bcbad9e358b92c6b8f10b6107ea032fd456b18e5bb5bec2f82bb309a72cada9416550199cd30188bd5a3d94c24b159a9fd6209a1ababa8dacac34c321eccf8dadbeaae75ea7db31a2b0b691a575bacacbd37f2aefb1f9accccf7b7d9a8f810cff00ab156cbad428e25676aeb2d11c74f3b09679d3413d26ae34ee4663531d58761c01aad74b80eaca6fb50a3e54cf838c0d3b4f55ab2e0154dbfcee699fb151c15e53847114ff0016b1196c333889c23d85a69bf382083cd334f59b6d450ab3d4bd4195e8d6de8da7b96fae18c8b2fd6e9eb367a9196df65bb5e098ba772392d70c4bcac565b27c0119b9cd47edfb2619e66263b7e0d6d0468afc25c39298a3266654d87b302c80cd3f979e8d46faafdca67a3fe999f3ea7ea06e7db32aa5ec0cd5575b3173b19f129d47f1d7623896fedd8c1dcd33f669388a7671178d8758bee4185236065a796d995b7bba03ad4d62aab6f53f4f767a741a973a7a469e913d6755c12d5f74aeb7b592baaa8ee5a796d30333b99564d20b29a757936e45bb1ef7f8eecc1541d213d888860844acaab3d79af99c176858c315b2b2bad9e2b2d73d3eaea6a26a6f5d3d7ffd6b79e9b50ba8ae7ccd4dcba7aacb0dd6f1e6ab52a93612b0cab1c7b74fc7940c54d9a96be29d8f7da7dbd84ce24c0a04314727b4e594c43b3094fbe6a1401b11b2910d84c4f274557474f3d6f3d39e859dbe27ab6afaf725471cf8e9c7669f3d6ecccd3362f6462dd24a8b39680e203de65bf1b133c98131b1865238a999886030c1ed774cadcaaadb1131b7a451d6d44697d2b7d5ff00c6b396974e9a6aa7aaea4d750c2cc925706a533333b567165a3164333111ec2958ae5f67163e77483b8cb3e679316b98dc898c9b3db0eca1a21d984a880d6d5c90be21b0ce64b72317931f4ba3a3a59ea9ae7aacf4ef5276b49c6d7dab4d5a8b9afb44128c971d999a924da622358c29ad03da619aafc86fa750d6fc1ee3e4c6012bd82b34e93e0d204aaba727a50d893aed19d8c468a76611597a7a9a46657b682ba855a7d4b5469d425b3d6a965bfd36a6bb57b7ac6abaaf06c870f68e36ed9d9d39d628aeb25c958619a8c9af75fcbb98f8d9ba7cf9d4275fc1bed2493099c7821dcc56c14680c318416234d4d20cc714aab6b59b18cc562a69d5a38ad502cf56d6742a3eeaa0df5192fb286765a1505961e80333b1318cff003755c761ddcc13131d8669d7958c7913bb4680700ad33088c256dd40da7a958b0e3d9a7d4b525b555ae9b537b5f6d3eed84ced663a78c94d38139f113ffce26666667fbba0c9dcec6187e47698620e14f6112b4e56b1cc07114ec44c60b3330073db482d6faa390d11b8b59f9ccccc159e8f538cce763131c36cc27b47c6c7630c63041da6569cecb0f2780133a364e9a027a216b34886cc2d963b9568a7623623301cf653ec4bac363ed983316a9cc2cac9681a66676a324ec60ec54ec30ec61820ede93b1aa8e08454a3ad5a93a8b30ccc618630e2a6113f188d14ec44f8846606d95791f506e951b8f90c440d332a6c3b787077a0816fc1ed4afa7da6130c63b0df1489d5ac2b6a1cc365963587c7619a750d633722618c27e251e2b6f89e0cf2b34beebb5eacc3879c243c22f124e36cc065c72d9999988487bfc5b98375a7a7da61d8ec20dbcee669c43da65438507731844e5cd5a0680ed8d8787bb8b3dba61c36ae1ecce566666663566c18aabdab47b4a04a3b4984c2763041b7c9cec7671c13b0c032d6fe4765adda744f12b506509c6cc655e0680ed8844577499466b6b12dd14e0c8bde122f4d63b97a92bb2c2ba5084bf8ec3098763041ba2723cb4fb19a65cd87e7b3e6514b753a3eefe100ea311adb1b6681714308460a3c5680c076c4222d8e93abce72ad94e955a7d1ab46d1343a4b7268b702ab1a2d3698347741e9e040ba6ad0dcc7b09db30984c2613b0db30427a690c6880d744f26745f814a94f52a563a970a8ec6a3d86632d6f863088cb15b115a0681a677c4c400886eb4c164ea879d459d54c9b429ead98393d9984c3330984ccc2761d94fb6672765ad9dedacf3cd35b7d4308493b19f26cf6f699a500dac7276c4658b907ca90d034e533dd8dbfeb7cccc26666613330999efad79b5afc8edd70929b6c359f3da66940ea76b4d3fb693be333a6c569d29eab8ac42de55e0681a729ca666666666667dd33333333330984c266667bc09e2aafb1fda9da6560a69bb4c6f6d7d07ce2a10d95e0ea1f25da697f22232c2b32441640d394e5394e5394cccf9cce5394e53333099999fb29fc23b34c9ced662cdd860196b78f23bf1633a04354b472bee31b27b0cd3f8a0c3088c2112bc97270dce729ca729ca729ca729ca7299999cbec8102ad50b127b2b0168ed334aadd42727a164e352bf511435d63299a404d861edc71d31dcc61281fca60a998f4f03f8c12c2667fc67ef256cd390afbed62c7b002c4699f920a6ba8defc0966ec32a0051d860f26ec64ee0133a2d8a2bad2c67c2bbbb1ecfff0096e3ecad4c666b48cc58fd8312b7b20a97893505b350ef0659ae3eeec3b5995afb0cd3a97bad6e562d4ef0a204ea56ac6f78499a7fc1842211d99f6ee3bc1c4eab4c93f68d6b5bf59519ad76dccd2a8672493d865632f763a9d8b558f28a55235e159dd9cee651e34c61876300fb6238f3f7cc31788d3f699a4f0fb2d363294a9275d519ad76947ea3d8618b8fa6876300ccc767fbdff287ef988a5dae6cb7699a747e8704adfafc21766ec51c74b0ee767c8a4c30c0391c76a8fb09f6802674dfb4cd2a9309c9dd11ec228f1fc01351672423bacc71ec3b5b8c184cf92063b5a018ef317e5860f6e760d8997c78ed31542e9a609869e0dcea466b9db641cdee6e567618a327519ea76198f3a83fc87e5d5c4518ee1e5bbcc1f16fe5f604e13fffc4001a110002030101000000000000000000000001114050706090ffda0008010211013f018671637cee1732e6ac1cf865ffc4001f1100020202030003000000000000000000014000111030122050216090ffda0008010111013f016074bdc3c31a69419bedf0a0f08096d0c5b43405c604a68418e50340cb8207038334ddcb9cf4d7d0c2f5e20747e0afffc40035100001030107020405040203010100000001000211210310122031415122611330327140425281912372a1b133620482925043ffda0008010000063f026de5630468a74bff00b585946f9e69d6efeae1ee9fef79ae10352859b28d1fcab69d633b23e90ab468d4a3676546cebce5198bc9c2d41967d2c1fcdd63fb72e92d1aaa6bf364a3bd42abbf9f26e1ee9f1a4dd8be41a950c1859fddd6bddb9ecad1fa47a570dd86613a6481aa97d5fb3554d0697d947d371ba8a5aed3f9393c48a34a9dbcff006bc7ba7fbac4fa59f2b0369663417dac7d196027788017ecd565fb73b651ba02736cba8fd596c7f6e4c549c9441ac51e7937b7dd5a9b430d07541ba3468325a47d072502187aad37e029352ac4f6ced4535d69d2d2a19d2cd3358fedbfb2d209feb278a23858bf1e7e16ea7262261a111b0d32bbf69bf0a36567a6eee6fb1e2b9d90bea7ccfb2971cf63fb6f8d0ea549be054a0d608d9479ec8dab793f28d5330b7a01d13fdf29c5f49bbc471c2d1fcac2c18583259f12737006a5065989976bca77bf9163fb6ed7dd411d5ae4369351a22ef807b8ec2975341aac2ca33fb4d8e53fdf2f320a0eb5af0d55fc71941ff7cad7dad19fcaa74b784cf74ff7f22c7daec2ea1d4a937c04181b045147c05a18f95405e1d99e9dfbdcddaaad3df2616ea5612315b4fe11277398f675f00495d5d56876e14b8dcdf74f9e7c8b1007dd7f9820d3aea72138a30895276f3b4552ab5440d0eaa94c937c008787eb8ab932b594e1df33f9c57068dd16d999747ab8c83dd3e79cf8de6381cab381845c72416c135f36be7b49d2538ed39ad87b22f9868dd0b3b310d1bf39427572c34286f55a1d4f0a492558d39ca068a267cbafc43cda8e9226170de33bb24da74342732cfa584df67ef95cfc323444ff00f0435a2495f55aff00015bb89996f9062f6e2eb77d2b138e46529395a03a773e4d7e2ed63e8f229b844e806e506597ddd99bfbb2002ab4dfc893f1870ee233c2c5683e510d58746f19d9c176473a4881447b6793e5fa90388925565179740dbbaa1baa08f82968d354df0a1cf1ab934ef86be4338c5936871953ce69cb22fe072557a913403b5f674dcac6ed01d3953a5f6267e5f812eb6385a36dcaf0db467f775998f93c81c62c800e3cd88aaaeb9839e68d75072a72597359c85cf381b1f9f3314031ca2e71937d8c8f97c811f52f5b3f370015773e676e561b3209fa8293701dd18bb13e8d081e1d4196ce9504de5d6b33b3557ec38bacdc1b1ad79f3ac388a672f9868dd745062af7be4890079b84507191b1ca3eea4fa46a5068f40d169a3b5cb11a3f55441ceff2cfa7845cea937b78c7e7587b65c2da94ec7d6f1a0d954d3853fed7da198a23e58038d72c95016067a7fbb9dc62cb6ac6f6287875b4dddc2939099f9f4f3ac6b4ae46bad0e061dd7e8f4b623b9be7fdd6b73a9bea9defe562226bca6ce914cb4134581b13b9bed2ba11921bb2b51666a1957739ad3ea0e19091468d4f9404d069774898d50f9ed35ec14bce49df15faefa659cde196c940b68561708c85d30e2da64b61158a5e4e8d1a9582ca8cfed5a8226599ad84717b1f6de93f2ee550616fd23cbfd430d1fcac0ce9666ff6c778a6fe54dc70ee8748718e6a11c22543841527409c4b67a7f192d5a06acb8bc9c2d1fca868c2c1a0ba0564119ad9a37655401529c28fb48fb0524ce4c3e799f563bdbaea87910a2f94622cdffda169ad160222150c50e489890b1dac81b0e55683617d9d62a9c3be53b0c264af0ecf4fab7398988f3e0eb8ef6d77f267286f2a8ba9b85cb16ac55bd8fb4f49d0729d277c8d9d253e349c85d6c4b786ee535a7a5a040033f550c0f3e23e7bdba6be71b577d9435e26ff00a1cb496f65e23fecde507775680d2b9498891376168925736c0fd82c4e3253091226a9c3be618883d22ec51039e7cd70db1dfa6fe686f29b8341adc5a6a5b7c1a852de97aea14e503332d196c9c62ad51a0dddc2c365aeefdcded77053e44574cd6587a8b9aa6d0cbf66852efb0e3cc8024a71b48757d3c2269f8b8ebae4192a0b88d82ff1e13c642f506ad3aac566e108c9925616a978e9db9589b506e87f53562b130ee143c64639ce863499418da306832ba4c9e729c228353c2b3f05d26082ef37c479c2ddb92832cc6068fca79c5f3697bd1ced3b6fdca7137c3995fa960a35dfc1be51791d3afba6b8ee1386c3261b5687058bfe3be3b15d4c3085a5a7a38dca70c3185d4ed99b067a4646bede8c358dcac0de9b3fa42b3a5413e66210aa6e22b337bdb3a8473e2698686d149df2e0b4ea6ff4a5a66e87091fd2f542c2cd116b4c00bd52a9af17c6a3baad8b3f0a962d5fe06fe1755980bf49ebadbf7bacc811d376168a94e062d1fcec14b8cdcd1140fd7e0c8cd54edd914cee733a5bbcae9a3b855542b09dd491737c9870c4d45f63f85641e220420e7f4d9fd4bc3b3a367ee727fae3f34a9cad7f3984a24eb34cc005801a7f6a8b0daffe948fc85d2faf05752e8742973b13ae0628aaa4641e2025c760b1356262c61bd636582d3e5d32da574229e5f3ecb817465238cc072a7ed1961606fdca6c08e9bf0fa870b1599516a29ca10e9ba8a8bc4898108e2e68bade0282f5d3680a0eb3f5047c43d4a451620bc5b3f505075192da4d62996a703054b8a0193dcf37d02ea74aa0be6f22f8ca0226299ec9dda2f6d611c26a0afd4187bec54b5428bf033d7fd297124ab374ccb6ec4e7740d9dbaa2ae974ec578ccf49d723c1132d317c3412535cfeb7eb8760a5d76e5507938af0771941ee9d274d33b2950ed6f09cfb4a09a377280d1a346f0b0bbd2a6f73b845c7537086990e5fa90f7ec38589c64ac4d53f9586e362ff00b2c27d3b5e204c822e0e3d3664fa8a7b6c64076fbf9d552df49ba362a10bc1e116b40d339ae8ed2fc56825fb35349332d17e13ab6f02ec2c1253c59bab4c4727fa9d6fc4160b4f52e5b7330eb29e2d3addb01a21274d3e020df8b29d4c89cb175a889a2a2ac1b4e360a4ab231daf8e6ffb2c4fe9b3e56060c2dfed5a0263a72b1dbe8b0e204df86d848e56361e83c2f0da22b53b94f83227e13dd1192444060011f7c82914b8b27d4174d6d39e2fd7d2ebd87bdc2d5b3d935d1eeabb5c29334cb68c5a199d795de2e215343b2e9e970f954e1a7c4f695d2201c9acd14041acea27d4511c1bed295d7231fc8509cce4237348e53870725a28a28c93b9586d848fab70b1d9c47f0a0fc18c968d3a426bc68469c6498c2d8aac16746ff687ba7d66badf68d9d5a6fc56870b4e9dd1606c61d05fe2b77d7def3874391cfe4e4a6a8e2ab54cdd4d371cae8a3b855d2f8684e68389dcf9274a775b7e6ed33107475139ed33062fc4ea35340f4c5f311205e244ac30654be1d6836d9494de0d2f2c755a7554a8dbbdd66e23560ba145a7f927d0100001ed931774e0794470ab712b0da8ff00b2c4cdff0005136b20ecd0837468d940dc79baaa819014df0c487937d4ab33dafb320cf4df22801f5709c2cfe6f53b9c8df6517617fa4ac5626530381242fa5a35276583fe3b0ebeb3aa9357e52c3be88bc68ed7dd13c94f35e95e1b8fb275d81bd58b6589c05a3b7e1a83ace711ed4403c169f83b1ad04ac4d113aded317d99e29762b5a70ddd703809870c748c8d1d9535ba5a7d3b2eb904155afbaff1b7f1731ed270ed0838eb97adb29a1a21a13cb7dd35c0686a8b8e8a01af0842d74405a371c69b23d133b1d913a7c13a3e928681cd6fe6f89def21a09702a90f7f3b05275bac8ccd3f17b46c2b7f7cd14215297439e02a3c64c33d6dfe50dacc19854e6a9db10530f23e1ba4d53c384616a20883711749a379568cb3a0c3f739053475fe21d5d968b4c92561b2ff00d2244c1bb0b7aa7640bba49d8de0ccca2cfa96303ab70980f1f0bd465515a62d74958a669adf89df8ba226464b413dc5cd60dd068d05c6cac8c46a54e32ef741e2faa80711ecba191eebadc6eb3718ab512fe8039dd7e8370988c475bab50ba4a6826eea83dd1f87703e976a9ec6d4619ca0a74697e1fa845ceb63ec2f77bdcff7bcd95998b31fce4c5a326311d10c1d667d47652e3279c9452f935854373bdfe20910d70657ba0e0cc3211391aee45e176268ddd35806979b5b118a750a3c32deee42cdb7782c3d4ed5031a89bb0b04940bbf51fc6cabf84e1b35d39ad4523552d30835e2a9c0f3f05d4e016e551beac871684426e318c4523651c64c3776e57e9ebf52f14d401fcdd8cad1b1c2c6dbcda3917bb52acf0c976881b533fea3541a3a5a3617da827e5a667076edb8386a162730023570dfe0c0cd67061cd289821e0d7be592bb71735bbef7338bad78bf034f4356271c2dfe57e9d21daef96009904666409aa706b49840db3b17fa34a8d1b33847c197d7b660782ad701c4c895d3a11be604fa595375116397f91b0b033ee6ef0d87a9da9e152a79524ab4078a6569d2a9d1ce486349298fb47efe96a7b186184cd3cea2ae60cfa6f9831908748046c998f4d03828c228b6be10fa9d53778566623528595b199d0deeb4768117b8eb7e11f308cd8888c426ec2d124aeb389f3a0d11c23034ecdba70c489c81a7e651e4860fbdf4692a610c568c08bf1ce1ec87a8f28c590fba1102380aae397099046853b7744822e26e75b5a093a342edc2a6bc2f13e572640a0326fc0df40fe7203dd380d272d9964b886d7b2fd538a9e96a0da068d85faab2ea9e9c808f2a5d6a5dec11e82ef72861b3685ea553706fdcf94cc521c3e6e53b0e1e93f95075585bf9418df48ba42c16c02e80d03b5d81a7addfc299a839438fcc2fc2d0492bf549c73e80ba198198b6f899340113ce6032b839989d0bc47374fbcac2c6e16e5e470bc73a273ddba73391958e03b1502a5075a981f48d561b31844fdee3d5a3b4f89d7d5a8cc3853980c5a6999a22795868182805c0a91a1d321168708074dd4598c3df7c96830cd3f1e481e786afe2ea042913caeab56fdaab57129ce0c77024ac218d52e339a46abbe475aefa0526f8ba5eec3fda86084f1a970caf00c4b7c8efe7c0694f73e06c10eb24ef0174590ffb2807083c2a9bdac9d0793c150eb801ba7300ed975bc22320913d94660e7899141e69c5684fed0a1b6527928682380b524941836cd5300224f9555c84cdea9c348aeaaae016a56ea80e8b4c81dc8c808e53bdf2875a6a746fc0979311a6799f5e6819c3934e1716bf545f664c83e98bdded963287b4408dd1ff00f431f8ba18d95487bf9d87c136ce94ae60161fa445f469525cd1f755b4247609ce0d2ba5b19fa5c56316a58ede506bda5f67b3805fa735d042787023c8a985a623dd093a5174b495facfff00a8586cc606f03cd851b6fd952cdf1ef7e2225ada947307161c2bf51ed6ff0028fa9c50c0c6b63b2ab8deda7aab74f91d2e2a2db1103482b00993f5685125ac07b15d2e777a230e6d3f2a1a03ff006a9c061518e2a8c2b45d76b1f6421b88efdd1021a0f1f0181aeabbd79057fc9add412b1440ee862b4c5ce15d3673fb910d868ec9ce2ed6919a1444408c95f2bd6556cda4f2bac11fb28bd3ff006dd5438ffb6ebf4c113cd5462a2a99f81f166adf48e54de006cac4618d3a4aded3f84704301e154df0833e819a4e8355396141f8f0c1ba0290da08bce0b36fdea9cec7187419f13fd235cee74d4d23252aa7094dc7006baa77a9c765a47c6f745820977a8f1db2426d9e182dd73cfd673d9b30d7550e867ba389c4f10806d9d792a4437d828929ce3341f1f8cc879f4e5a988aac4ed4e6850ca00325015168e6b175627568b0b48c23855ae5799d699805a7c3514baafe385272991d4ed3db3e31f25513ca188619fa9755a621fea11c3660f7720dc541b5d887ca273b047aab39b8ba034a92e0b525505d3dfcf9d07254335fab3814e911960024a87e167ee28ccbdc4d36581b0d1d829267293f3134ce00d864a09409801dc94feac70dd9616b40eea4b8e5fbf9b5860eeba4623c9524f95d2d254bed437b6aa8d25dc92b88d828dca0c88c0233d9b0f1399a0729c6224a302239526d3ab80102cb3d3ea46b13ac5d6848db3c797a28103d957ca1e2bc77c35536767ffaaaab8e42498812a4eb980460c8db29c2d34589d6803a2806ca6c9987b9a952e24e579e4d7ff89a75933f6ce5f8643456fc587a79284da62e4354d93037deaaae2ad1d13b676d2b3967cdf6f810d1ba0d88c030e7383e73857eabe7f623e1b03677d4aa939057d46a33d903a44fc111cf95412bd2733ad01f4095277c90c692897bdac85a39cfefa2b30294a8cf6622086d73d9c19e9be3cf051f22802aba17ab335d3d4e35ba810f15e073152a58cc5fbd1ac4f14b8346eb488a6783f288cfa45142f49f8bf505ffc40028100100020202020202020301010100000001001110213141516120718191a1b1c1d1f030e1f1ffda0008010000013f21e47b8a2c4a9b712df9459e09640a744632800a1ba7895961c68ffc6f2cb56544efddf8833cba8346efcb2e950369d4311e676a6a3c93f717c5bac0d585ea5a7880794d9f3f111fa5fea76fdfc3b881dd0a72c336fed2f2cb402a7fe32c9b87c32e02f1f4b9fca75b4b058c01d8eac285bcbff0b9791c0a00ed89791c2b6b1fa99806fa597d133fd9c2a345b7a9a7c095d4036691eccf0db43e3e45a7d1fea77a8102011b5d40418daf0fb6539a8a1e30784defa67ea6830270373922505b6dee2dc62ed0f11ee33ae0ff0039ee719bc5fca491d4084b6b8def2bc2537b29ab4acc8c50bdae5b370d22d6750c7fcd1d09b91f818f40dc4d479c3c37e5e89792dd7afd4dab6ee54095387e4c2973c92d54a4d4f40ff706d0a380c337a0b659cecfdb03ff0058a1969b17b737955a43d830f97d413c4fe016a70218e596bd4b3653b451259cb1a63c6ff3087c2a2b357b94403570ae7ca88c3ab43b25409508964611ce0a32a34e60b4e38f50e4a12c3418ac7c71ff0092e5cb8b14e217a02390f585cb1b54b62596fac9c0e5d3aa108606bb57a2025b4fb62a54e72ba2182109ea1b02e9dc69f49d7a4dd378f52a54acbc46517783ba21e6f79ea2bf745c09251e217a47ed00875ffb944adda375613a136a65ca81579c250357832f3ace0c352ccb035a81a0edfbf804d7a9556042758acdf29ba8bcf94f91e25c6ab6843e292843c27ea072828b538049b7d751cdc322d46c1b0d11f95e2f17952926ecedb7b9c236a762f0446b43f979973bd4a97dba6f084b8328256820122ab1ff0032c1a1d0e320c1b13ab590cea0375baed15d7c262541bacd35d6f0c10cd4b081e5b9af30582059e7c4449b6380402d7a854e3b7b655e56e5f9de2a200f6edea000b882c7679606cef8370d12db783860102f4043160d0bd422fbf80610ef7312a02b470139a0e1c776cff5027f172d7e926084a863e5b2784f2d9dca114a4b2f0567847dc47d9cbf3f3bf832e6d87060505bde09bad03cc1f739ac549a6e022e5ee3209684b130effeb271345ca7d7141827c1bd9550e01cee04f351ff0004e76b0204b53e60a5cb60843fb843f72c8ddabfdd14775bd4bf72edd5ebe153de1f5056dcbbf85cb8fc78927993843172fe751232c02841b24e32d4a9f3065c20611a61bd89549dd463ae6765921077e572a2db02138dce5039bf12fc3b21afa4b6b3dc643e867e7f8f80a6d176c5e2975f83ff00065c09412adc68352fff0003d72e5cbcd462d9e1d6404827122fcdcc42bbec3c18324ec94eb5e39c0426f252b57948b40d97b60812969abd33f3fc7c2cc582afb9f5dd1f3bc3eef100d1832cbf2ecf835cbf9939d5904e7c9bdb8ade01c5e065ff0072c0747f50854016ba2053479e847361608108e87677f160162af0c141e72e18b8ec3f88738cb2e365f8f08208249315fc18c5958a33b201bad94f307dc52e10847ea036ad0b03f43da6a0c49df72ce76c08430da6b4b959156cbc4d200be1972ce655ec8a50cf3b8c32cb81c0e41808330249207e158134aac5f516fb83ee29707cc19e0e614b9f917dcd81b6c3c608421195156c32b2d9d1c0f336d839bc532614e87247347de322740ac6fa4afccbd1e5e2a78ce3f107d93519343b853bfef1343705970f974522f35060a20c18788c2c1c9e2052fa16fd4e62b081970610cf65c92b2084803baed7f0b8b2e5b8c0c314cdbf94c2b1ee4916ae8faf128c785847c46bf9279970ea4afd878075163006daff005dc0d9372e70cbf2ce0e5472c4c1dc4060966879100155ff002f0db42c450c08431b71d9ea57d66d0f54fcc149f1d5135411458e157c4d98d9e257d28e3516b7d45a94ebb8389844816ed1e03ac54b4bb8af91c430c0144587fc6366fe38a45e2a260a9bde07096527b8608747979dc22c09a4254d92a5d93c81e9e184481bee303ca26173b079c0be11d1cd76f09ec18ec8a88ab16755771a286af53a205d3cef3e882a34d3e12a29ce5d5694b50255cfee81fdbea59f885071152c2058867c2d22f29933586aab97f943e20a1b8cf0ef3b7c460df53d92cf3856a90751d3e89c4638fa88a2c517b8e25353c84df84b97141754f69d8c2f11f8a95129c39551cedfd702108c3c7fd488a86dea0f362c74fb47820d3183bf5555e651dcb6c7c6b072980542a72c957afdc1c841c4ac4a21345fca69136d7421e17dc9662e14d2b5e66cff008c318b0edf3162cce85c76bc11e9b78747ea38b9c654db53b0f03c21cfb420d7ad7810629ba9dd1e655e27eaf422992d79b840c2b63aafe92b01c9f1dc1f804e52ebcba1e37949a01db7fa8220bb87fb27f2c0ab6df29ac183f3411ba64c3a23a2a2a8fc452ad15f93287ff67ea82aab3c47d4e1657e63b12e9ff5084a6cad15812e261b45be08d5bd42f15b0cb2acf4c1f59334f836bc4454fc181c8c164a78506e3c9a4b8a659a57f4fb9b64610608f166f1a27ef8e77dcb8b8e6c0a3977003703fd4e8de69be3b8e548f260b1d89bb8e7e38160db2d4abf391c69c965741eff003f795e722a8e22c0c318b5bc87c422c64937838230816d9c0418b5d3f068c5418aed705d1cfa4b02b1baedfb843e06ac2cc5cbc02f738e5e2e1ac0f0794f4038883717487b0c16508a0d48f717b03a6037bef73bd08087838ddaaebc58eb977fc094dd10c11e84d31fa9a3f11a16f67a53045c4a096a7083dbdfe621697b951c0464dd65dc1f890b420e172e341e862e53ccb6433409d471c7b8e80e582a8750c0aea9a83350dd0c19654047ba5d524f341c0e705bd3f88f60ad8681a0e08210ba2c697118e960334c126ddd06aa05272b7003262526d0d3f52a7e0c0e1cdf0c3252a4b4553f185e4eda9c38b86e1cc6e367a13b1cdb097ca8702d789500f2427fa50aa0460e1fa365cc355d543d4302120e82e02bbe0861daa208491cac9538d602187149a3fd1413a7e1418711ade04b8a5bb5ae5f8978fa4b4e39c6072fc1682ca8f2f303e1d099c5a5c6fed8d2dd8f50fe0f2cb35bcd1ab29712acecd3c108916daf71e04ff137e1753f1831716882ecfceffb62b42f2b349a7495138141cb38c2dc1d7f51461c4ddb5f87c105f10752f058f55c1bf12fff00183a3d39ce3c5cfe6c8e731c12cc90fb4101e8a42ddcf7b23d476b8905fc1b3f50d2888f48d6def2dcc2750d86f0fa9443e6388a2d42ff00e0e32e272293708bfd212e5cbc1cb92ebfd44fb0fa5f735135a0e07a966ce32ca18734fb628aa4e885c07a9797b9d8837171a745a542e3509c323caf1624d6743871013b9800af3c12ecf8226d5d4d04e545e65f6c4391a8144e84b8d9134cf74d18917f27b8708a110e82f5fa8a09ff00f78fc384d0240d3bd425e5b327e0208af3ba7e32014f736560717c46db9451d47f8617908f67cac6d4e46e3ef8d05ba46703c38ee704e198a57af1858c7345c21a94170ba0ca05e142d866e685ac9654f15748ad9ad1105766a54269e7897abe123ec9aee5cd84ad351d91e279d4059a41270203dcb9ef1c225545ff008c380ef12d07fc11743659011140d7cc593dfc021c996a449c59718b47adca4b940ecbfa9518ceb3f923d78e0fbc3c6700073822af32b9cf2f28d7d6bdc0a5613d032ccbd3cc303abf53efb15ee7afb688dd878631e1da36946d0bfc2171e50604252792a709fc027f489503b41f0c576d7840ab21fc423a8c30c782542e39ff003b97c0bde3cb28a8197163bd4d1c0e28604136ceb2572a31078deb78819c30ce841c2e5ae1a9f4eb1cf0ce13b3dc692bd9f09cbfd98c6bace1c2d20cd15750220477a67d258fa8a8b28611a37e709ca55f303869f50544d10a462f826fe72c45fcf9fd4ad67315fe4959ec9d7f2dd43897162c720e284609b039305a657b9b6879563830e140951708ab5404f190c63d4ef42268120df944052277001cfd09a2ff0049ccfcd0ff008668beb736663ee7864cf04a59bc4052e17c6603c46f87306604720fd4aeff00b251176794b0cde9e15070e06cf76e57163f004a0cd09b4768b8fcc2a2377f4c98cae1bb45fa4e3847018bdaa6b62178796188aa72cb2eb6ff00f94b1e9521869fb4668b7bf9272121655665f971373c2580b99a12770f1ee02d6ad2d07b83a2e7ea7255e2e3007152f24ad0537a744454b3e3b8abbfbf7286573467a390c385c1550fed3a8c5810200f024332c72c29b25947c7e588eef4875018194e2dcd41ab8cdc4bae8f11690c8405dacd8a6fa2ff00bc72c33a53885426f8bd41c7f35ab975a11b2073292ed951e725376971fbea270ed098e5e668ff00e2538dc49e25c9f49babec9bce4e184ea3cc4d1af2520d9e6387038df697a8a7a7b412911fb757bf72e15fa3826f2af24e23223cc590967d73a31badc6c90ba98f4c982e78440d1d3f582119be22907606083054f4cdeb7683a13ad71039ed7f12b01705b03a848f4d45b3692913703cb0e6e1b1a011e3ef135821f5a7b82ff578979d7a9744d75a7b45575ddbfc42e459b66d07e27b1087eb2a8043a65f322e06396551e634cd1c2a6c440b7fc32e072f64abd47722186a376b8d65aafd7792306ef145eb44c18a10ee7af6c3e7cd195b401b408fe41b61420afcc389c2d4ff00e28379a917a61502adf316a5c21a34747cc4623e5f100f736b6d2a01c7c07dce758287411858a29b3071450ce29619e5fb8f32c970d439399410c6805f30ad2e435f032d639ab9ce536c6e3e222a16c36bc1f2ff00eb05b0b5ee511d74a7cc70949d0d414a3655cd87da5233c2f9fa26a6a3e39fb403b01fe63832e3098d8da1aa0790671440211b99c6772196ddb7623824eea481ee2c2c1716585974dc71c514329e595cb109a9afa4fa8c8200b7202861a921584be9969f72b53ffaea6d6dc6e4d2b87ef019be6aa3be2f602b48a4d8e1f716b7a541d18d43a4d3ec9c841978bd1eee5db4b4101ec96c63f41c4a56dcca0b050d2ff11eeba835d4a61f0458ec62a2831711ac3c8484dea798e3c412fabbb1fd1365a80d788e35670df0f728ddb370c2bcbe8816f9a32816c8a0f88a5cd372a6e996f211fa853c5ed8c7469a466f95c5cfb4dfe894d5ac7b8f8019bafbc22ab5c4794744fad10ff8629b53e1397fa958513a7e02e6d179852c978f197163120c4de25e467ba8730687447e8c56117a0369493c8f72a9eeab94ae9af6f68b1290076bbc2ca071b8f32570fe861a6e09075fab066f95d0986e2a27aca32512ece4c64f2689683770c750b0cd4a9d98b9788be8f7f9fc4414bf2a972e19b1edd07e63fadb8f07c22f72f1e4c3de9384bda345d72d730776b510e99a5a5c61c412a058402951478d63a822ff00f3cbc0e9a33b216c5a8b113487550ec6c554de04d1d8fb9625596e7ca97ae5a17083a4b56c728241409fd0d44965016bc13689743fc8c304871c25e1471f0a4aec4222f9444ec95b9c5b670c7945ff0037e66d12b841b9e0723f30fa1c632a2f38e26a108b8a709b9f9c6fcc7cd28794eb62bd65075398386e1b5c46f550587870698cd46995d4a8386862db5c184006e717114a623f2ffac11223e2055da596171372b48f5304bf55dcb8a47e0960f2225a52e547fc21a35dcbe20de38470fd6fed2bc227e10dd3513a4da04deb3da0286fd448c87a358f94abb3c5fdc44e3456a8f307b27770e7020e17e5a891268228c31ac2db41d461d06c7b97714b2f2ed160c72cb0a4e98b668e8e5ffc8f4283e38a7ba7f34580b07b9e8f30ee8b46920a75ae128e940df894e887d2e5df858bba9ab9fc9dcd6cf065c64de342dd54d012ada77362c20ae55ebf50594856f113a08e63cade6232122b03231e1ea1d81357f4600a3e7d15e9342166e883830e6fc58a963860e70f4473bb7d45e0fa05ab239c0dd789e57fc47dcbc2abb70dbb708585c1e44adde36bc43fd4c5be601571e6e10dc8474c40e00f042e6d05e208dd8ee14949788028be9e22f57ee184cd82406f053ee719787db063f58bc177f27169c46a5ea72230d741280c7512732e34ecef1bdabe5cf32a5b1208a2fdb7f708e5b0787ebe06699daa2bbc0c2b4804e7fcff00e905de02e2541167177947ba29b9682f2cd92c82b6e387dc5d30152e53f7c77919b8e0ecee3859737e26e37e63d1ccb7803ee6e6d8a0d2a1da6d009e046952d796e0d4eeefd623bd0701c110b7be2a70d451462bb68213bdad4062828c7442a3af2762b9de4f2789700f328a8026af894f17b47208f1d62e969f1ea29d5aff00d441c5816723fd4e56f33457911a6fc307803bdcb11450a7846e535e7a833f1f1716d9f49ecca1d61c8d0cb01b8ae0b9a8ac2845af56db9186a69670c2367253d420766ae0e0560ad9b40a6a711c2f12c5d85caa9e36453be839895974a49a22c6288390e0401d3a07fc0961efd9c385aad2314ab45cce84fa97f08e181f058b5f131c336e82268e6ec8c490020bca31e67b57460d98185f6d0cb84117f1715dacd3b912ac40cd145b8f242f4de0a09ba4ae5f2c3adcfc1c3d1107d2bd306ac1386e6debff00739b5070382714287ed9571c360d01597a0a7204ec95369387c466e2c54e5e58c678136158f8dc034ddea3bad7e4f1855cb88617eb3a8a3b742e71aa40fa4677fc44f71372c7f39752c534397c13cdbcdfe2296b37063b7c1e65765bd50bfe53c60da3986b8f6c59ed2e2a9157494ec3cbff0028119c2c8b186f479dca972e2c66eaab03ee2c56692c63350687fca5a634c19b8b3630c6380f549d0c51c9ee0257068953583a9ea84a35a25f535c6bd34231303a9c46fd4a138e8258025b7d6fed8164ecdc5dc6bb70c003d4f5c93db292d4d6ff00c26cec3f7d1db8631d00550fd4d9a97165c611d6b4a9d800d752ba1d5bfa16c1da1ace02329617186562c5170c5e00e1350f6e58eb072f136d2c746f0dd05c52ce4edc9cc163770f0c262f080f8948b016a804f4ff000c575f7e984b7769cae19540fa11259db7727249f72e2525bed80c4b0de500b48205a34c28c777cb51cbc5b7757dc70ed53b476a8613c4db7e618631628ef0f0d6766f8244c0a120d12a94fde34bc1082a872d61e6688b8d1962d2ef7e86797fd6534adbd42bacdfa8f29aa80459b8e1b6c5fb12a40d7db887b8e868fdcdf215fd64b9a366d34d41972e68dd4600a943eb036a46a3cbc29e37dc420815c454bf81fc4b55d660a80e720b787352bea6b2c5c31dae3956e4d772b0e531e89bda43cb10023e1ba9632238ed1956ff00c20bb4e2d7511d3d2872e3f33561ac5bcdeb3e08c6b5bceff1187f1919b135f6669db913b579a23a7b65b1369f19717dfcf9439c097571ca07a218bc2c67f9310a30dfe09dfb61dfa50a955d61f412c3e33eb7c7c1a720371b5b79c318c5942612897ab472c38657506a147dd5c64dcbf115c8cb1fb88d3aa4044898fd3cf64ba0d60d40bd53a78855b6e6ec4b555276305fe45c111375ebdbe610016925adbda59376cef5d4b81c73fd23fc20831c19c6e6a558ba8b160ae03012fd4957c1ed9b5bba23e7594b8025b53a3e0dcb9cac5162ceac8c544c86c7937195e7960912083753705eb788b4bb09f5fdad2d4b220ae96927a6beebccbc5c19a23e58649c78f7e23b5b5fa97055218a1172c707290444a741370eb0ead0ec57f9459cbf43ff00b8b07c22bc405fa7c0364ac5e0b14515c19518c72d794de0e12263003c36cb0aee37213f1846f0720659c78a18f7e3e1701e8de9ea3606813ce3d40ca082b640e02bd42508dfba046906cff7cb6ccb8a35bc6c3172e308b50e33be20021c72f9f818a2941819f8c547163bb65a3415d3d467203f53b95f0749741aa5fc66f109a627909a84bddd6e5ccacc9bc1c4f0983d5d763e1cd783e03cc65c1d612172d0268158554878e603bb7eddb35bbccb354312ca84b37ee11629e7f0a817975e32b1451628ed820f86de21bfa7cea3ae77918f0f5c836a8fb5cb4122d0d4dab386fa94058b1f4c189b572dc23783701b9f64d95532a272a550468a2b5d19671ce191808b3aa1dd4fa5382e5cb060ea91d8ba65c798471a88acf1fb61a8e18b02c0430c5fd278ec8d30f230e053c344383ae1b9528d1d8f98912546282de60b1b952e4b25bea80977806e25c691a6a3aa28a501387418a149c505dddd116d47acb5fd8615fa860ec9b77420c0aa527296b6df94479cf9d112b345ff00b32b1628a2c51db0e0b52a2a315432f17ef62555e6318c639a20b549eb07025ff091592ae33c441070efdc6a9edae37e2584761ed53869d6341604952e1f55b83949b207cd55cad6dbf41419798fbaea6d2c4e5fc336b6b18b17e002c57061c43f160e0ed8dbb0363dc70c61d45f3acd4543ab95bdfae751317be9da57a0a5a0a6aee216abf772eef366e3834f429e27a85bb0caa52dd36bee50ecd5bf91f72f84e1d65c712e17e233c07dca226afd638ed743c1051b4af535d04f6ca686baf2fdf995858b1605162ea08211de91aadd36eb8445a60e258e10aa258b1c5ea3965741968dfef3460bcf31673b7a7827d09536978baf9dc57ce1e7e5b606a92dd3cfc0ce63825d00f1359d88a121e01d6bf6438cdaae4fa9682d443bab70e942dc157b5c13d772cd431f58229ebcf4dce97d6e026bbb90507a032b0e058fc400412a31e5cb28ec0dff00a65e1148f53d4602527d273becaa9a717825d34eb56b8b921d82301bd0bc615132110ed84a6a95333b48aea3db98a61232ca363492b96c38814373bf38abf7c8359a53cb705fb97b42850ece1e6c2db5dc4b6cbdb2b171c051c81c8109750db734b50d5e44558e5c351917e1154298b383ea3d2bef4b9af3d04f3e393753cc2db0346a318c70136f3d222256fb8c48c7aa528969e6328411662a54ac289fd089f2061c070185bc18b9cb15c0793d4a40a799c63be1dc4d62383dac4ecb2a5618e2ea3cf423b56e318c70147bbf8b0632da057a8b8283ba94a74adda7985db88b4a2096e1f642083e08c72fd4bc186187e01587e458dc05ae022a19e68c1786d4136bfe491cb1c76a15527d61c318770ba5136f3734e912edc37ee3c3500469ca5dc6be02b8a53b557c5cd90a2ecebe3152ef0927c038ce28e244619715ff00c2b8408d057ea7997e7e075560fe91925f2618c704205ac5403494f9c1707257e27540bdb702c4ad29a8d5e3811cc4b6d5e6561c3a59a53ce4b32c005edea5e520f181ef8fdf36fdcfb60c32cb17f3e65880b588e93e3afda32d8b2f172e0730c2ab25f86e0cd79cf2c289f13dd54d730120e5c3ad891c1e1089ee2da7cd8ad5f39318f304c8db118c184e8ae9bb9b3b9644d5c744f7557b8f49fad47154d772f0dedde9172dc1cc631c9f0af2c0387e12567d2572fd473795203a3eb0b2f16e43404da3496c1575051a2401027d8c72d2f7958a3facfd27718e2b01a250bb4227872672b7d27ad121ca22780cadd9eda6d8a946232a560b3198e51ca62f1fccda3f260ffec57ea6fcbff06296dace6012abe3b41a77cd0fd4a2d8780d54a081ac85c5ee2463972c35b6a97ee31c9d41036c23367045950d975a9bb2ff009ae37d1daf771bad3ea4536b28b04d07c32cca2448ce1a7dfc6e59502e58d87ee56697d228b572ff00f0b8714ba6e82c23543bc96dccca9b5931b8a9ed6d6318c7006b8bdc4b5cebe918e4d4a393c4ee28277f942414406893dca951c2c2268060208987632a54a8c0d44f833fa4e971cce25ffe37f1580a4aed8c18e1c6fccab05943d3c8a2597d51fe67404ab5696972fdc74ea93f19b448c72507cad1f51c18fb9f4d8544c55d30ca95861ccaa1fa304aff00c9f829c84aa9707f807c1720d0bde26928071b6fee017b51a21d4ede19dc441d583831c3b9a7964326bb89e8c2a5448cd8b87e0c672f03518c6712c94f5f0d3a600e58a2950d588dc9b3162c6384273539372a96d658c3b055096734d1283054a8c6772932e4118e1e70799417017e98b13753f300557c19e129562a54ac279823af6a54bab8e1c7181be78971fde9d44cacae621d89b75161ae8f50ca3bc1d12bd743b7f88c2d1c8d515e6e3f22744b051e07a8c631c2848f44586b1f809d3ee1af76013f102d05ac22ea2eb64afef1f9c3187f144951224a951c81bb7774c624654a953885902b51629c3ee7ffda000c030000011102110000101a04b00a4b9488a98ae1408d3bcd1ff587a4df6e440da7d5251f6d341955e23122dd2c09cf8f2a297b004c22a4a04b7bcfa5cb583dc27d2ca51510144b1d64523f9477e7435e23b88ba3fa2c7f522eb814a27dcd0011bb1195da9a62a036577b7df843b4c0f4f6d2e69e29b5c6f97559e3b946b93024d814d2d71e5d6f100187a8941f720b6e038f00021c3ad28a090801b2e47b5249850f250c2d059c8b7936928b1730aa0a82320096c060bc7dacbdac9d440d6cb34646225f62288c622177830b925e31f46e8a89e4d0cb3952c122b563db2f0a7d947297d8f0b3fcaa19e4c374383d460ad94c2188201525afd0cb5bd0161801fccb7edf8394840c6091c98585433303a49dc45aa586b8f8479baa48a52caec47814644c245390750a77b00c3e014ee1eb6a330280f3c0d3401290d46cb464b3cf82b2064d0fad8ed4384e62494509892ca7055f97b938df580c2ef6f7fe222a80a24483cd730e6f970074b7dbe78a79b079606df592214ca2d09bbe35657168bbff000447e31f80221a21ca6013522826ea802cbd5401c35f99f13c4ce25976063703b0f00988c68f877f14054d56c34ad2610820fc3f7523d9a74fb9ab7f5df759c3a828c4edc0fdb5ce1daa43c88931ed0cd40efddb01a759555869da4e02d92496b16121abdc0dca89fb0f9208bb97a7b964073318f3d4b92c5d3b6ab0abcfee18f90869d9aee5381706e30f158e061ad31745e1ce16e94401b12d3eaef1bbe3400012013cf79d0822fab0d342703cf412745c31200006037db15fe8f9909fc8595730a150c89721702382b853619493cba1c22b903b4dd1163c34a20c6dd03dbdd3365ce1faa0a17cb5b072e0c38513724a88a603ce410434e31de0790d35110338e730f54f9cb5ae00b5c3b197eb4ee7816d29f625f6835780f809aad87a19e264fc38cc95051c30fc963c7d0d3d4b2c708ad6d448f4b5cfc1777b4c3164fed10c297fc955632508747888d34504d40f7df374f2fece3b72c28e152ddd74e8c466727f38f79d4b1ca188997c3c61a5f0536e9185b25b7446670b8f3bb6610e3f7e831c9af49b58b2510d507bf932f548b27639a93cf28a3c7a3ad15d37c5d5b18bee9482592055e0b66be08b3c7272c7e68046bc3c799e315bfce4a28b8d675f6f04ef5fffc400221100020202030101000301000000000000000110112021303141514050617181ffda0008010211013f104272b3f0486b637425bb13de04be972fa3be84a8747fd8451fd7137b12fb1ec5df435552cbd9b655428f4a85c09bb1e85dcd6c77e09521f90d8db17f78270ae3da166c51ec595b97d43b6e90952d8fb8b2d1aad1af92b868a454fb2fa2fe095170de86e95895ecad6a5fc16171582cddd0a197bd8c24df62d0ca70fb17e16ad5431b45fa25eb86792b2b2f0a3ae07a36f43550c6c5ab2e3eb8d43e270dd0d89e8d0d0b82c4850c6a1e6d0f43b17d9a5d1a1f0fb1ec55f6287c0d5ba12486cbd14c79bc3d2be8c5d7131ba1fd3b45f0328a8f6575c4c687b3cc8e6ad0936f0b85c6c624eb27b29d169a1a17f714594cff0071596a2e564b45d169a9492eb95c57050a1574c69aee1167fa21f1286a143cedd54dca7e174eb9547b85ef421707d09e2b85cb14745c27868653f3f2ad0fe0908b3b862c3708ae7f7362715c362870d656f2ab1a84f758b2b896299dfe251d65562195e66f82b2a845f8313b85f7954dc6f17bea293ecda67676f17c7450d6752d3f0aa55172fa2f9f79dcd1ef2ecae3bc2bf0be06a2f063737158b2cb7e72d1b8ae442e0bc2f91e4c4597faeb3d170f9aa565659b287f9de7eff02f159fffc40020110100020203010101010100000000000001001110312021415130617181ffda0008010111013f103b6a259166e2d75cefec59e40b6295444eb21d7717ccbac0a0ee2dc301eee2d38283f160b22f861d437000b60ae0c5753a08b709eca207571605b1df3b9e40b8bd752f1e400ee2abde41703d629dd60254a97fb170745f371dcf27991a22df78da10e8b63681d380bee04ff65fd46117ce55f6512e5cb978ba86ab3b4288aac081d43b607514372ed9460fb1e04b97f905c2ae88b6e02074cf689351560764a71a2a393ec5fd469b9ec2067474c7c93703b86c96c22dbc2f358ba9dcb9bfc28cb020a8b081e4095d93fe4db82e7fb3b6102e3831a9be23536db8105c21e92a530fb1cde359a9ad4706ea6b07377705c002e3d2881e996cf1cbac5465425c63a810de4de2b88a400b8b5820a4951d470f0ea52471564bf90dc77825d65e040b82a1b254f307125b1ee5475d608ee545b8e2a3c08a107b25e791de4cdf7168717584ac27b16f0e08f52f80f705003dcb7d9e45cdf59a1258847f92f01eb149d7986045f91e063c8bf257e06e2fd943129ef075dc55ef00c1fb28dcbbc79c0c113bfc46a308ab047d9512ca8043ad448a2538f315f704def09ee0bd433e70604b94bbf70c32912cbc1a9ad648612c97172cf3062bab62c61bc7b3d8e2848364489d60c92e3a9de4c1f304fec5bc30c27b0638ee7b8a7b8ab95925e2b8fb2aa11c8751f906bb8b7131558357121a876e1e033be4f3f3884d7584ea056f9f5fb51f63d4b9fec5ad4ee5a4b9771fb9ac1f8ae1c1d61dc49744dca3d8b9b9e7137c021bfc1975e461dcbb7b9719e4afc0dcbe047171c9f605b1299b8a68867cc041ae462a75288d701a9ac0d4a1d45f2051c42586b07e464c9c00bb65dbdc73ad437f8b3bcd4a9d4eb9bacea6f2bf9592d8abf891df3de2bef178551c372a75833d4a3c949bc5cbc53ecd733752c86e5328f629e4df238dcea5cbfc746062bef2314c023fb30fb9726e3b94ca09d4b707ee5cef8d7d85045791d40654a25cbfc6f854b25bc48c0595f6286a2aef07e3efe2472144b3c8abbc31c19afd2f260c790e264e2f331fffc400271001000202020202020301010101000000010011213141516171819110a1b1c1d1e1f0f120ffda0008010000013f10794b8a5dcbc8e712b1c54b12a25e7897d6ad138dabbe1654ea503c04587b8aee50885db036c7a8c681a0acb5db1a0050153d7ff27eff001c47a83dc02b3345ee7c882dc1efee2dc05ba61a6b7af2b180e965744056a14b4e33b8e9377b5b7066183c6bd4b1a6be6bf983aad2f0383e6566de47b4be3c46b140f0da0b2121abea0f78c71cc1f04cf986a04e8b6aca806762ce6dd662d0745c1e17b62f0a2cc5c1e080d6ec817503d2c0ff00c92d050b5cd72895cd97ddc053dcaeebfd95f19dc2d66b357dc14c6ccc6aa0ebccc8d4faa1b3fa943509c2c420db6e4b3d12866c3352a4d88282a2a868a48d29d076c7208550633782bc45ae660dc61cc64cc219a2f05f0f711d7b5f1d10cddea6dc478f5f83a8ef306faae234df11d2e58660c43fdea6ccc40b2004bcaad5af30c608b00a56cb89e958a0d1441b2b357f11a80058d5179aedf11d52280e146bb18e73f72a651096a4473e22762abc41b3ff0054358cf507459f33fe1944746afc4050230d7793c6a5f4026840686b6caee040e6a065e61e2e052a2dbeed528194a141f4c0e79ccb9cf783cc51d8812ed823ad722570ff0044c8d08b800707f7038569961953c2b1bac3041c52de7dca3b85e181d5c32af64a4217800bccb0e418d886547835ee3ae455af6c4b7f9156e109bc3ca7412a3ae286057f916d5632f84174ea0e3bcc33a8e18835b8ae311462affd97adc5a372a1cc3238ad95438231bcd28ef312cb6b72b4c116e80ab1868d1db02fc555caf6f6ff0010e6f10c5de209d14c5d518ccd16fd10d3cf37cc1bda1e661bace29d420c550196f8aee54402eb6165abc114f0c5d94614b3c4d1f832eb3786059a2eea0bff0091c6540beb510c7582b74a3b80674b05f25c1e31ac92859792341cabd4495a768635907bbcc54a24daadacf4980dfa668f0b8cf31a2a591a345e3fb97ea24a4a42252bc355001894b455be144466300715ff0062d5ee2c4a618ad005b35dc06d4ed538a80c66b6f6f70eff0051aa995ccbe21d4bd54ba6e3f85aee5970712a23bb68ee0da9c4bd435ff2282e90b03d371f9282295c0396171a34303e5f2c281221752ae2ca66c13656894a32af73c1be4ac301bc25ba137e23d4d8b413476f8232056ec44c5769191a555bb5f329200cdb614b8f19c31e2eb7cc219f1881be9e3d4c1a16bbea1888084ab691310a49bc1ba42f1112ceab7286683cf7305de4e906f2edbea13835a86986a1c9c8712e0bb7ae217a868b58a1c7f732f0cbececee5645aa968a376c497d0b4aa0e3bb6203115cc5b8414922d54cbe2a32c50b673db16f716a2cb21f8d4bccbfa8db4cfe528ca2ea6fe71c42e31d43961b54e09e79989c770a5414282432aba3ccae5be46a8e7cac29af506fc4a62f99ad7ee2d364c872b5a879bb7b2677a7c7f72b86e2bd01b561eb5ca283a3a3cf30c9ce7cc0d6317b3b9769695cecc31da23f79a85f2f31f5983ad8dc18df5006b0330489e11b0aa7e25a25f70715d8ab6bcc4171a0140e83821d61a40717fec0cdb6bffb5033ca692eafc41792755fe42700516a8a1c7f72fc3f70805a9f51efa8a708341ddb13c0781a0e027512d6e566c4032c25b60472f35806605137bc462ee5fa65c5f32ef1f7e22ba7f717fc9ad13c4d1c6e37e20175fb89403642c685a8f0816ae3cb303bf11cb420b5017a3b7c42a0284640ed0dac5503404a42f9389dd29dcb1a2a29c7a9662001d5358b9764f3ee2ad550b955e4083ac26c03b57375a95783502b26e15936d44a946ec1c397ccd9cd45f1e18f21f09c906af4e317c9d4144ae320fee2aa0fc59fedea37e3472ce075db292416a5b4ccc92a8652bf895d5ee03ef980e0e5ff00df1014ff009a98326387c453411d92841a2bf733ff00c4b5944c2e83808e24ba6ef4c0ebd45f114aa6a2fb8054c2ab55c3f447706cbbcbcbf87b8e756cfb8fc0c5a2794bd9e3315f1e65e717d5cc8f3a658ebdcb940f12e7d43410682954c64868af3b9a602eb472314b4428ba31681065583a5b945311106c1bd44c5673322ec7b96e9fb817d14216e462942d8cdde3c08fd015712ce03898fe9854a19407eea5a850174358fb8ca35d660e31be7c40c186b5dc3b2978bf5b18d105439a4b28e9ee5362818221abadb2fb028359ba85cb70eeeb3a8b5fa216f3c3c454e37b2f5015de6fd40e1c7bfe65065bf9e7cc4d5a61d673ee0dfa3430978afdca95878d5ce181edd911a2d6ac5788c790a006d584e1cd36ae5b37508ec814f963db2eb5fb8c15ccf1c44e733ddfa67833175afa8be03cc5e33ea5edf3dc6829cee543190bcd42d01625cd90b8e817285d1caf8223c545f83af17051e78ae2551724756f712a36e42adbdc00e19606ceb38986ccbd9b8c29d476bd43d48038616aa6d630858aadbbd41b3f505ebdcbcc5d620682fc4b850b62e1131888e20dcea8bbebd45dd820b57c4448073e80edf3e222e221540e838263bcd710b55d280f4d951570561a711e2aefcc1bac79f136ce999b66eebdc395fcbc40facd37cca237adb786240a175802e2fa30cab15bc02afea30daec368ebd51c4f2ccbfd9771197270151a3310ea252f2b99ea7c93476cb62f98a79a8fa4bf7f107c8e2e59c3feb29f3e26441a0ab7c4d801db89a20f45cdd19b22d129e10e00e997bc4a5859d4a383ea3d04ad0611b1364bc55ad4dabdb37a34cbaa2f1a79859e45a715595b8f2f028ecd7a771a543c1e72defbb8553667adb366e139fdc1f199dbf506f330b815da2254451a38b23085a8a71aee16971f23e4efee22942adaae59dd03abbd7fb2e350803acd9994e96adaab28ac4b95d19f243c5f986df1cbc4cdd3e43f923d34f6adc496eaf6721fdc48bc4a292bca9c152d84ea5b10683df72fd209f6e0b3681a2fd4f5f51ddb38990c5760ad283c7a8c4ecdbdb2f15162c7831d22c1163cd92facba978b9b213b84d377821787ea08189439fc2cd4bf32c8ee6e24795417132727a616ea030c3b00394f30b68a08642edf3326e17aebc730b8cd799a73c6e3629c6eaabaa537f32a4372f42f41cac324c34554cabb0f103102f9e60735d6f50f2fb8811b0ace9b8cb0ec6d3288414fe8585c5f847acc1969ace1e2051a61cd8e9ff2545272b51dede0801004b03d55b0af72c88802ae80d1d12e50c8b36158fc0ae62dcfaf50d18a27072c3650d0bce223460d462e3f1673716ba8b4e73d459616f3c416a5d60834caf5c1028003d4a91f38fad4698631f685a07bc433fe27ac2d309895710cb9d4c81061e5c93b0f610ae5b3bbe3fe4af5c6cebfd988e6b78896e540e61859c0ac7d501e3dd775cc33a8aefccbc67778837ac304bd566417acc2a2e9455b54566658acee981677559fdcc507e3a666b826d29c01cad4a715106ba005ebc40db917440ad35cf7198406fe0e2be659da15c7e2eea204a29ac2e7ea66d92bf16e7dcffcc5ace739f516c97b8b5e1fd476cccafb3518305efcb292807ee35772a773cb2cd47ce3e6fbfc29cbbd43bb2ce61d602b2c3ce1bdb03e3c4bb977122198878960e239530d5622285d01ab7faf72a0bc45cda8ebcad7a973cd8d55640af5d46bab7ee5fa717441c6dbba85b106dcba2b5c4e8ffddca156a1417c5c29c0b82dd88af985a71aca2ebd45ded0032af12b006a497a605e6b6917b7d20e00ea64ce966a8b194fb8aacd34e7158aff00da96f8972aff00f6a7105d0f671a4fd4759b727cde67b97e5b8add45f517ccc18c332b465bc54212a756fe616ba1a26cd4af38aea5eee2af7f83cb19f7981948f44279e7966bccd7997e2f5c4d50ca1f5837bea509120975e2380436349146df703ed5917513508714f5c4d57ce7dc33e2b9add455a4c6962abdd5e6b88aeb75cd46f191b2b70b16936f6053f52f10cd60c585f2b1903630a3f0741329455caaddb38a1aa7a800ba9745d1eaa2442e46f251ff00bea5ba25c1f12b2a816a184c4484d6031028d07ccbe62e6d977962d45dc5b505baa84019e8ea0988d7d8a0a8b99410bb957398f9cc7b8f76506e3d5fc3cec3eb3cf2ad4f2fef52fe613cbf138b353efea0b8b82330c48f780dc7d2d11ca29201151c2713869e12008b5bbae1f040e6ef93fe430c9b0dcdca9acfb82a2c52006d977a804648a7c02a55c0193415fdfcc02f50ccfcd4a8f5cfc4ad7acd4a015f52a8156ce4aa3fd9ec9f72fee2b05ebc2de03f71e575af965e3fc8b117d46de6348b081b1d0caae5b74c15346f4ae4e4849778655cfe495f300283451cc2d520bc88d50ab6160f7ccb0f24450574a7364485866c1a5f536529cb4f5d1dca450568537cc6e34359c372c950aa258e93c4a9f33c9346497d6581cbe70cf27d4bf9b85f537e625c6d2db97ece23352c3a238e4b4ca5ec89c39ef8c45bf819fb2fcc5c0e04c05c0aeaae15216ecb4560e31dc1b74da44cd4be975dc2964f923fba84ab6fd40ab7a30d5c501b31e2078db63b1a2b3f73e5f716dbfe2059dc0ecca0e502b3e2e239252d1f717b8b4798d34b2c28fe6621c5fb651e266b7f059114656fd1e87b236601a87d5f16fa28ebb60890db179f572db03ae8b8ef6b02b01f984e3281615a73e2623901197b43a3cc530343a01a009d73b5398ee5856382c79a882c5654c5b362cf0c14513f896edaef30d4a6bc77296e774b25fea0c4a82e1fe3cda133708a05236566c8800b0954b003931b5c429ed541b55ed73c6214babc99f11706cdba6acb3ea261aceeae231d1e36456fbcee3ffb9d4df12c1a758c7ea64fe71b840accd2eb073f72dd7de3505700abc130053aae96c0750872a8a9717ee2a99c545bfeea2064bcbe261620997b9db38e5b79cf115daaf50528b515dc44a6128a319b3dc1026ad45e0b94aadb19df2b52301fc42886160ba22d1b4835eb1b89081285403457896d62293822c6750956203628e28e0a96f53f9ea51339cf51afbd56d5a01ce770d4b2764beb30ac6f5ccfae6bcaf9197d73009cc4eb98c14ec94192505878539adc7b896d42e33ff60acdd56d6388ca17d054f88eab3cef52ccebe70c58c779f11dadb699d7103d28031d42fcf10dac5f32f92a84ba680fdc292c79c8f067d913608a7423902854d6318fa8b1d45d0ca3c458b0f9e6fc4659bf39fb8d68bea55b94109e05cd80736b898881b264756ff246c056ab6af73ab10cb220205a979200285a0aaa2e34217759befc435f3de36be3817b98dce5c07851fdcc3b8362bacc0fdc3555f30668e4b041333b83aa089c0c3b31011188586d9f07f2811c044501a0388d8c830c80e43802559d9a8ed367984d66bcb997d53f2cf304bbff006c85b9dc188cf9259c4c96436cea0133d6626b154439a5618e878e71ff00b52815e84abf997790bbf960ace96d3b5388ab554160fee6d566c7b21b3144f1c00e5980d01ae68b55e33c788b2b6cf89703b1c0d8d61c473e29dadd2cb85dc57ac471b9566c656a0551aea167352e33b8dcaf736d4a7ae1955a2bdc0731c22e0983dc6de6386661584f04222c133f311da2ab42b963c25c3c23fd789a0635dfb7cb1e89a81845157c7a8b5551dd4cd20c4365dab6c5ba27c432c580195788dc0c4180ebcbe23f555abfd7885062a0bae3f52fc99b5d14147c3042858c7684fe276afcc34332caca7ae207afee1d7e2ae5d37623ab0f88a9ca550f5322a74832658b97057bf50e69d85d73f130294cbd60b8a8cd646cbc3ff66b3601b2f9be8ee160c1776ad9e41c57895a814835636a1ee5f702549a1c631dcf241ad459f6045a1428ea6459400dcb4dc513dfa25999d21cbe234aef52c7269dc6cdbf735e050c21795e219e2429566e9df989bccb48da3a5c113ac14ab1b06b52bd8b555680e55862d5da57cabfd43f23cc03a79fd8d3af136dcc7a9aa0bd4a1161ab957563c01b9a904d994714694ee36952a56aef7dc0d9c5b02be6563e39c405a06b1a2dd3fcc3dbaf50be666607f4c71a70cb6b212ce7e997d5aafa98b7706241f8d156acd27708f0860d5cedccbb5bdfcc219b5a7e731508ddd53d39dc3582a87940cd6d6f1136a04d03b5b16f89bab6ed6b7094b5ff006647d900684ac63c4b38bfd4bea58ea4b806d27bfc54523941d9cca00d06264752d1dbc4f132f831f1118ae94b3aecd8f129b48518817c1c1ee5df72ae272dcb4a73898728a8ab14e7dcbc40dedaf47a39ee63aa86dd3eee1612b0dc25a5d765c54752c64dcb0c31683ad01cab883d446c558581d035e65a3c2c17a816f9815c4187d42c0a0f756c44af0c0567de23e8ea3fb86bd92b43a3caf0135025a19b82eafe67c4cbe5dc4b98678a34a02ab82f75ee3d070df38b8a69ad5a00b55d7a8cb2ca0548c9e479e22e66b00a00d01a087e0aac71ff00655bddc4777090a1e2df158a3e3f0b18819da4a7c619977931a4f266592c52f1822ab9dfa826a8f51b68772fbb3a3b61b15963659eb5165a54b74e429fc46b3494859d9e252fe27dd309c5db2e869d801065f6ea5c672ddb3bb538ee98d4a8017542f3c5dc37a9a854745b407476f8966680bec39ff132c28d58b11bf06264331599ddc77702e8af334ce48f75414bb0d52f17730ee52984f71be0a8e21635c0b8b63981ae3050f96b96094ef87921f423dcbe85596694be7a965755b232bf99b8db32dbc4b364459081b6e0757dca2e758efc0f9a38d43beaf3f307d84156f137298a87afdcb9142fa5da56bd62783f51ce98cf4a03b68aa86aeadad9cc47398b963e16ee010e173ee2dcc9773653a8cb6c63b88eaeca1dbdca102de60b4052907ce39890eea504e6af3500cdd84369c0e771963d2348c638da17e8798af01125d2b097d4a8ec8cbd87f709ebcc33029d6a811b3fc83fda8eeccbec9e0e5619218341ae5ed7b9419830d1d6a1157fc4160ec6a3c60f314111261ea00b09634806cee21c302655715f30b07850b718791abd46a8205ab40d1e880364c2e1005accb04180d25957a7dcbea9ab9e496952e9b8973c04346e3d3a17705fbfea35b8e721fb86ab37fc5410f36b862f230c5814a4ca571e099e99c264400b575ae21ac158ee398ba6ea0a0cda151a29c100b9ba5d4b81da3a208c0057ccc371d0cb8d1774e9f0f886e0ab6aaf128eae2a9bc560be1f729a84a8295efcc0b210ba5537f728b0c3fcfe0bdbb206eb91e336b19ee3400a40cbbe2f8c6580481a3a1341fecd38c6e1e6aef72a14e8c5abb3fe43732478d2c78ff5834974bacf31c1c3a466176d3e61c1b1b1c193cc6c42f5954b8f41d102dbdf6bf83758945d468de2c44b8c6ab4a91adc421b29dc242df709acff0052cdfc4b0fe7f02132c85d1c98f344c78f3f334be032ff00707147aa81f314a2e1a6c42f3f52ded2ea0b6d069eb067e63d2b558b8ba8d2673a2e3bbe23dc5439d43f0b702b5534679881602b03e637001ccb89a175c06563e14956c89ea3652d130bdf899f75b6b70235920bc4b622332ee519baaf30b79af25eeb5baf3cc64058d2803401c7a8ee8ac1a8b530dd5771a62c11a52f3ea52576b1bb1c9fa65537fa8b7ecd177191c968a33f50d02086d4b1a74572c468566c3555bcabb5dcb14dd2998ac8af3386a1e7bdcb028e4d7700caaa0d8e39bf24b429a63089a487652666ab67f3457370ddcbaf11d1c062aabcb7f64606ef97d4740e312b1bc63ae2515b512b82f4fd4f6fd458d47015d1971cc637f5b8b97516e62f8889ff00ec74622dcc1aac238f96fe50802b531ec89150d6e522b0a63472ccd4caac2e57512310cb2c4f518db260605f7c46ceeac2bc43206a208a3be83f711e4324c50e00e02331378ac283879dcc7b99e3c45c5ff7150bc72cc3998b3e2ac75c3b8207262ee3da001155663e6cb0338384fd11bd2daad5f70ac0021765f5cc1665118ac5b53eaf504df041beefa878dc2dab75325c4b34256be78594e04398b8aacad00825b6e744712f52fe5abc54d45ffb304224b061f51581bddc31782a3432e6afdcae84be60ed56a5cca9bc46d70cad6a5d5a5837cb66a2b7f88b447ca1a2f65854c37fd458f3377b96d072841518c625c6ee0dc75360e02f472fd4468904305181f7003211f552dd2983dbc2e00f96994663701709d90654ab09af819d5990c5798e9cb7b177548faaa9af31d82dc58d4695aae73a8cf5183b5242fcd10e98450d11955eeb8885ad512acc51c94e372969afa8946bd54256ccb56895fb8428cca6db3757cee34a801f1df536abcf510f7f5331b711b82f219b14a7828dc26d705618e5670d2010928081d1340e0883b3fa66a9705a63f72f886a710592e1886405325ca6e826cb8d42de2c8efbc01b55e03b973cb68c1141e9f21ea3ce8baa359658e351e5602de02bf996570229314b8283a898aa39cc68e6131a800ae56f88392429811da9b63d68fdc20161f32ae4fa875dabb8d76cbb8153dd709e4dc36ca55b07e479f5336c458600d046362da68f1108f20252b329c210dc8ad108911ec948d0521b4f4c5b4e58e84e6bcc6a106aa35ff220337884d5530c4b8f3a296e8821dd7314b1283955d9cb02ad3ab877aafd47ad47491aa4a4e1ee06c61428b1a6a230607a6605effa8835eeb8635dae7f70a495af805ab5feb700c0ce56d9a3a1ba1dd4f2fcbfecaceb5c4514568c6dae311eccd456bb9773078f98e6e0b25572e5642fea5b6b4f3dcd7a3b711a5a943bc520e7c180861143aad70d3f772ee794523b35a1031bab62aec31f30a4639980741f80815cc0ae3ea2276d831cf60f341b2380c186e17a82d3dc342b0ca0e19a06b91349fb981e8ae1e8e985351aea10505eea50c16e47825cf352f815e9c30621a20d00d54b5e05b6853240858a297069ac9fecb48b3148e19678cab140f72a876ad4fc7fc97c66cce570a6e57fdba5aace0e0bc2b0020f9c912af96f9667c10b727703630eae21e7ea0ce9b69c46256e2db74bcf865d721eb88e9cf108bb5eb1196ae6d9180ae0bcbd46d6037302bb5da9db30dc71aa348df34e25c64be3aa967c6a387306c3b30cd579898cf3c302b2bf509fb977125c3750146494c1655d38b86d5851574701d10dd35e4839909e7404aaeeff00153011552aec361187f7645be63b37a41a0f5165711958eed314c6e204549556fb5c5f513ebb87b59a21aeff000498289911aa86ae3415fddc929c4b4d374f49c4383c757b8cee251d8793b3b20408aa00acef1afa8fcd437d97dc6e68abd9f987d73d9463e04f2da3c9e20be3056fb8cb64ac88cce8308d207cc54451b3fc42afa9d16b4a3b804114b3fe281da0e2cc7f51e6fb1ec7c5cac20b81b2bb8a6be1c4d789b62d14b3bbec8b14597af31dd7000b2df303788133619aec381d446ca6576e38f5151c6ae25283de66c14fe18cd67ce661853c6253d7796272538aabc4778f789a2e5e0f3cf89e6dc57af52ac989a263664ddd31aaccad752a072e5948a673059a2c04a6662b1504c0d7314457e49a11aa80085ecb81add5e6a38ad0c8084ac38cb7f173534412a38f280aa2c429d972ab5cc5850c53b7a9716136ad29d8c76b782b84f7dc42814e0624d852afdc310763581e1f49cc627728351a07511aa3f133f41e1cb329892fd10f80f245aca6e5033bd6620603ec8b5e53870a8af08912d2512eaa4bcf939fe654e8a46ec306b66e38c2513a6c1cba3ab63666d356fc58d01c18dc28011c79e22c38f2c044b228bc2db7d27f1172b8d2b59e2a61ce7cf502f1abbc47913ea5553835fdcb7aff002254424172c3d4b33037416cb2ad0d10535288aa350d5d371d5b6020505619765dee2fb487130215f30bc448bd1798612809aae07eb3f3f8799445994295ea2ad568036af11010fc01605abcc78af6069197181c1b27b39f71a9a897704182f28d0a4bdf941a05b4557f09c9cf6425e974843d5d31516968e5dbe58dc095986e0a6a3baea8285fab83531a4bba97899a8c2a0d3032eda2d2345d5be21b7aa5bcf1b3dc43c63ff35006d55b055c873fcc7f880aa80d51c1092cfc2b23bbbbaf1142614858dd837c57f70b314aecac4570e635ddb37d317b7fa9753dcb033317fd8ed30aaec3df1338278416df50388652b222916a94ab97dcab8a057c8656253ff89528d8eaa3a617f4384acbd84b48ef06547f24c83d4fbb3131fb86d6442b465ef88b205016681a29ef177e7f0aa062b8282d280818248adc3e1e0e62b11de56d045f99b43694c4252e6c650bb2f5a84921d8b4be7fd952f5c04bfe22a81d696e9e236ad505dc01c81abee1540608e463d81e52db26078acf88c39c56f419f8b8ce859cb2ed6b1a5692c7e4a60c0c74a8fee54e32e808d94f632c4c6f30555797b89ad05558f63b980212c1c22621ec985ee1a8aa44d8986e5d8a19dc56357dfa97adf8de485714edd5d66573860e00d9c1ff0063af12aeb328b215a68d4238a36ad20117495b3c9c21c01c4af7fb8380c35466016445df407aee27a4744a2bfb94f4bb0370f412db95b4c387fa8152fb11ce43b170e73dca8c29c36594caa9b6b55b9537923baa6f04e2e5f55310aa145bbea3134628a4040a796e3f31540c72d2e06f640633ee24a8829482c0f9ccf3531da7f31a5562557438772e44f09ba5fd4a480216293556f3e2685390d7c42dc96c2af102fa8e5ced94332d015b65c11b036d6876f9f132676557ff00c8c2857cd0229131d51075289a469232a2a2c5cd51cdc66dc445854a7c242c8eb16c3dca562a9d56a518db0712451535ab0387d9a6130d82f117ccf97c40b258d5d02c7f5b80a75ef12b33f0ac28c428e5a0b5a3a21fa98c6870332ac2860d31f9d200140680d01101152f9e48506c0bb684f5044bb6de732b5b1d973567ee2b0e63ab808f32d50ce44ac5caf32fd68a50b71a865b291a47886e3bc78a83006a600fb972f820d9ff00227ab84ed9081acdf71445400e16b679cac58b31c73742e894c7509e113a44108e57cca444051d25ea03c885d0978ac0677280096c343fcbe5cc442ea15b7fe65500d99df528854369d470cace230f6603cae88a71855cc28a97aae1ca05863aa71096c2c16ce6d9b42b063398b8954ae00e00d01d11fe0b85e13a61d9112939444ad394b75e3d427722544a0ad10c0a64f4c13532fe3cbcff0032b911186debe65e0a014145de5c6b3312e8e5a304cf8838182da36e3ac5e2339211b01557c0b943d4f479961743e4d4ddc78d91d2f7c4775af4112555e7ee66cfccf24e2e1c3052793440a1d33ff6a15001c36cb03052b97244b2e2c814032c19e4cd972c3e2a5925444a111a258d70cadc031c37b61e624e7116a2adc45e1961f138c46b9544b19e3986682f2e2885144b158530c7e88bbc5014056abc4e2f10d7ee5b65c19da3a8581b2f134406607f251895b5bdcb5336b7401b55c01db2f8172fc5ad51e81a5e6e653779dddc1c677319e6f888b4284eb381982802bb10d0b86a20945ca9d91a8d5a7c1d45e1e984ae34333d07fd3728169e62cc4202961786fee11bcada3b76ae53a31715b0714a1700609709cbb43246374d72446f9965ff00b08aa99f151609655ff31acdd77f89d9058c36331ce69659dcccaa6d55e65a810d6353c9996327dca840e096d5e1970e9a9990e357002600a7cc3670dcae801ae02f112b0ef9891594c18c8c47a5431d52591c168e914bc53ea1162b4016ac3075974004dbfd388bd8eb536ac0ee6536843777cb4cb023f38992a94bdec863396e1612dd0ee1d569a5f253047a340b505d3cbfa23512c2f2de5f3eb444681603431107ea293475cc077e2343184c95c310aa397626209e1c08a7b25f509b1388e4b29b181504ae093d9c904e544781dd1c3e1e60c363521c6780383171422bb84737ef3394beb3c4ab92fef11a939fb4f501cbd773025d9c1dcc1b567925f5fd44f0fb6575fdcbb78fe63d1e22b3c418940f84bf04bc4d446f3125ece4941d9051500b59743ccbd254362f24d0831775285f71a1ec4282ae46f9c37098aaadad6f888932660c076d4305aba76e37f31d27118d57f0ae1619f305c8a52703d23b7ccb4d8aaaaed657981b3522b92996fab23aa3f987f30f121adbc5c40869c919fc3b709a4f77c4a1d00a1aa69f9992aab472e68d1168a3a953d1472d5404f57703b014f919755ff30b6438e22d9c6bea3ae0002f166fef3317f7c2b93623cdcb9010139142c97eeb30c76d6d2ecf598d9f32b58f84d43d95880339cfef0c4db2a255801b38d46d9fb9ddbf399ff8112ae634c65afa966907ba97fe4c31747dca359eca9ab69ee5f5bd4b879f534980f997ee5ef2c163091c4364bc4a9070c1b45ad0ae2ba84f987b32db6be622c105a98046afb6e10bf18d2c99abe20ea0d7888c3b0dc6e05568d68c7c4197eb77401b578a83a5680c07003aa79e61ae8843c5310a17f1318830e4e88d37e1b9a1b98e3504cb38c8dc1597617c8531b0a95ba4107e6129cc3c264fd918c994a74e93ee2d67e20593617464df8953d40a6073b9789739a61d6df31566a903ef32cc02dd8baf50606c2d392129e4b53dc6450238b9598d929eae32b646155478fd40b65340fb3a7b84b7656e5ebcbc313e232149ff0025be3dcbbca54a39b7e237df519a051b39a272529355fc7e3ee1adc6d1d8ee0b77c3f866b806e34f0cb4ccd8f6a662e2559dcbeee6335ddf06dc51ee308018e5028f926265dcdb78cd472076a80006bb5ea354255fb0e5e8f04cf1a8d36677286446115441b9653f89eccc87152e8f38dc1a3fb80f35e7880ad4501638074796222500574dabb577ee04dfcc6d0348d93a76635c97d5c4451111c8c159bc58fb84bc32955c85ddf9b8b8893510ee52be13d814fed66a24682b0ddfbb98d17b2b5db0cc1d88166763bb875e5129c2561f11d03a8d946186cba4fee3c2897761efcfa61d382998af09c316ff0051cedfa8f5acd2ddacac1158d742461c81c9e580affb3e8751d678f1b957f8e25a962bc5ee0b1b98ea11b152d699f5dcbdb145986bfa8a10528506d8d9ed28ba98c4b9a46580191184d768417ff98950e2167da81696949e60c88cc50872f9b817281bc7b96bc0daa53e21df995d6163a1d67b7cc1c4458d5e6e3062a45638ab945661156cb2f7ac96aa21477988685e3b6c6b52f69054635dbe53a3e63f4870683c0683c111452577c3afdc65a61cc1addd3a2001c65dae93c93539d8e87fa751436e3486e5342429bb2d67a71a8b7a9634fa02d5e0080548ae256d4b586a8c9cc14a602a1e89a4ba94dbe6c82230cfbb42a08c5283a4526522b0781c92b280bdb571ae430239546d6ccf1e66121941053c0e1fb8e72131b0f0f0f8609c22864f6b407db352eb340d657b5ed8b42d19ad25f3ad4c1efa2ea33613be633565bf4cc5c569f30e39d62e5c2731dac6c9ff0099226ad44739628444408d2739cee5b363556e712aa44e0d2fda41bca01aa1c12a99ccbd07f12c24424774dcab35eb6f2a53fb96794a09d532831be22320201c1e8988dab9143ccec8cc66a04b612eba45c1e3f020d5d42dc32ba6325bde30129408822eca3a7833dcbbe7cc1d6613da5089b298c0d21f60c0b94820d4713b5dc7a8ea56a9ec7865d80e5155f09cfb21981280a33600e4777344806281775b5f0430890a950d53a176e339870bcf42f07f6cf526731a2eeaa541e0a8c546e0f5d7dc5b7dc13c49f3b88210831badff00315615c26801a58a5445bb6a1b2246bd8a343acc62c6ec9c17cb08af34e04ee2086b4302d3caf179e61342a107359628bb33ba846738343cfaa98b315c63716317e8324486ff005bf3176d9e78978a5fde2599b8b0e6216eb7150cea3fa89c46d3d152ed4b96e1c84b7a86cdc216043291a96176f631ab1a06b26d3c33217dce48470962e1e4081cc2a82ac6eedde61ac661f51b154f5628ebcb71fa7e04a35cd72f6c6200ef05552c12bba9685c561185ca809c5a92bd012b500c9e632a84723c46087295a8984f4c61b18e8a34c01eb50fe514c4470d37dc7aa3a0a3ea01aba5a00ec4edc30dc456f2ad317015b885bd1a63707e60395962354c045102aabc59cbe651094d06b304d0ce4bb45b015028c816b3eee350085738d11a8864a4bea6d32c1a6ab31e772b1ca7922070c1a45701b2f3dc3b4acc2c5e0d8a9dab7c40008c0a82dd07442a375c5306bc5f4d454d956f4ddf920946b5846a3f15d9dc7c73172e095e3713922f151a89b82aa539c398684424bae31da8894ce3ccab5a925015b3d84332ec48588155908e3932cba65759847d89a08a6f83dc0c150cd2c9381d8ef518a52d4b58b9cdcb357ad31a383d6799e68e214b6bfc19afba94a720afc06d0a37dfb9c884d863b536bb6a02c6baf31ab1dc572b5e629897dfbf331fbc51411ac38adc6299e4da7b0990a3a2e97ee1528c714e65c09a7a86904174779ef7500db04d7898d9e60d88e53d35fb86f5b5461393e219f4608e1d3fc4b7a83236334c6d896de6fdee26bc73ff0060bac9e36410cd0b82ff00cee3f40dc57323df5f871163960e5995712a9c4cd1c986310ce612952a64f060c796b3e25c2ce18142853cc6888cad915a09d59b9dbe91e099c45b82a1d538f41cbe0847034d720979e31a096567ee22effb956a89650820e36d35eb11eaa5699986c6a4990ffaff001ffe28a8cccdae69802e0e2b2470d22472aea30c9655a0970f686aaaf67fa94cea0aeb4839bcbccd837e2506ca8c52bc1cdc33862082adb5b0f75125e0d400941c5dcb376515a0231b00cd701d7dc56929e65ad277889c01c3c82a83e67dcf6fb99726eba27adf705835f27f9143021e387fc9b71478499067d7889f55e6529ee7cd18a2c20ce226b17f1173a47b8afa20a67f48a73b6898617dafea19cd5dd1820d007c14b0ed84cb50bd3c542613821bb303e628a9c3308a5e180d22da7a54ede08196610a83c1fdcad28bc2c530fc41516c53f24b3c0702a34fe98b5508dc8a7a397e082b8723802bf0844241b5e41e020ec86e989f3af882d222afcae4807505a027994e932ae03e63f56120b2fdea1282765a7c110d8b05a1f04c25578aee10b31de1919f34406a404a292c363666f51d50396772a70b82b8e615b4bcdb6e12788ae4f4cb1738bd24ad62888b52e9a8968727242aa055903dc48f428fa25c5aefcc56f4a73ea62afdee0f54f3dc153251e62f2fcc1a73ce422e3cb3037fb8bbb965271438b97a4b3c11e02fb8d06aa2b231771c872373b885ca5b94a57731f6efa4f243b2bf1518321dd4548959945c0cbe88aaa60b971770d328aaa90e6a58ce558469c93cd2a771032b8b50597f788888a469278b3327dbfc1f8b58375895f6adad7bbcc24df10ada5501ef19a8e3b088849ad3800db72eae02a51b6faea5706273dc4398502016a573bdb4752e550754044e12d79bc458edb6d2c529cd771bc5d4ce2590691a611c04a6012cbedc422824c6d4f98a1ac7c476bcd89808d158cc54e96c338835dca6302fea5eb3e98be4f997db3ab5327d5c7262c5b23348a2e311455b0be38806e46cf12f0896189c09a9c1044184eb1bb897145a284614f0d404b0a3fb258385e616e0539998d9d44290102a9315f50eb2aa8ac141507297a2a25b807215af5f39860ab12ef2e5cf39fc2c5508e40e50e46019969f72672fc11305957dbed7ff006aa64bb3b257d00b4b3d3f30b0128c84aabf788a8715c472b636d006555c01cb0cbce46d750bb4396b0ea5380a51d5edb41808a02ceb79109f5888566be667c9ebfc89f03d731de6a9ea35bceb895f83b77763561e986ac1e1fe65d00801d8aeac8100e2ad97921ac77513c13917bc6310c70622a35176bd55cb069cf75a96e0f599569c4b4de2996ee371e6613123ab8d9c8ae20ae056ee3d9308235600480153d94a83b9aa9950fe25c4071212a9b69fb964c7e5a8d8c014cf221b6f71f6ce7740fea1494a70e0cc5d96fe2a5a4196aae93fd83f09504deb5ee7bf110029f196359a683cee39e58e185141f06671339ad1b97d433faf218f7b9724669f6fafc3cbb0e6198050afa08e35b4af70cee6496a8d807a594a94b88260168bfba874310f437b576af6c5e5bbee31339afd444c36838405bf45d4b1e608dccb9bf1d46ae6a053341fb8139a74686960f8c42320beb88844805289a80844ac89c1d6fd40b86d614eb7d4c1bcdea198aba8b9fe22c7d2f9f32cdca29e712e65318f1b946230adf93704c59e576caeea5ec645d17472cc0ca840a10c4dc2a5b42c4bb712eb4c25dc24ea8bc89e6f64b5d03dac2d3d0908964c52c710aacdc62291a181f703c278c10f8e7db0842aa0072ca400be4b8f8d7e335aa3ed8afee3ed00e09eb79fdd44b13b250cc0cb6ea3adc66b71ccff0092a2ad4e48e5367fd9438c1d3480990d14710ac5b1cb704af273115b235759f0cd4c300c2877a992d846a539df9996b1e963ef09da2ec81218165dde39c7310e0948ba0d5bd11bb8ab853841e33c8661a9742d33fcfb61b6ec8601fdc5a3adfb825ffda8bdcc9fdc0af3305931f92fe1ac236c7f30b96669ec60a7989955ee300175f43cfea61cc688b9af32a99861bea1be280b5babe3cc0bb1d56677911cd99c917dc84116ec7ba620b4eb6cc582e355836b8c4c30150ac660132a703512d6a2e30bc1f7fc7e111456f352a01944d969239017c346bd77f32d332f904bfe71186c2baca1f17edeba8bc4546b7a3fd820876d55ac0cd10f3484bc7abfc684d5c4ebad456302b2179fd44f8b2cf25e1fa97873f0c7badc6c55b11918a0e00caae83dcaf8034b234ba0df1ba9738a828b825bb4f0b51c76bea0a0025412ad19a8ead12ca0f53ff8c4c6d7ee2ffc47377d4f86528705b332ae001a5ac1f303191d3a2042800e8fc37f11b82084b54021962880d8f248d8a2915c505b0d8941280bab9a6f304164b97719c13148f0bd97c462261a0a8717594f1118cda95baa72dff11e601db44ffc418a814e18087441042830441ca2a0b41dc27514b0cef47c1fcfe105382064a5d1d05cbdc5b052701ec63d00b5d428656bb80cb282e95c079588697d2f0380f441057b8c21ab1ad23fbc4ba72c63c91265a6e35e63cc1112c8d142d84a475ea21ab0f72bdc8a60f36e80db3129b2601caf2bd1503d61858343caf977092fe4525c74cba154167d412f6d7895d40f9f5198364a0a2986d8b55b6e5e1a8312b9f98bc3ed81f7fb8bb34466723e6588f352996ba6d289c0bf51cf0cefb94a00b445aee0cf2fa521bea9654cc15462af21cc35e140a0b5cfc4bfcc6ca82b908bbaa2ad7b3dc0cf2500df6bdcb6a85b4705f3051fb848171098cb1a9aa22f245cc8b913af247f03198c2d1db3bb8d31a4df8955dd0576c58ee14824e686995f5284ae729c7c75078745a99f8ee58aa021302008bde256718a608de5edd4abe2388b12f0070385f21a8ac398fc666967ee1ac421434d5e732ca6a9be1a727ea5ebcc49895e5cf53fec372b7a4085e082fa293704c2bb831f1c55bc4a852aae5bb576af2b101323f51058e086f44e6e5c62ea82b15976d4d79ea0660732ef0104d89a615baa6d5cdb011cdfc46bacc4eacb8f9fe655d4f546264df99e266dfa346af157035d187407b096441ce62f6ac5028d3ae3ac712c1e432dc610b5c0ae601908c1914d30663d7a970c1514adc9a612081f3039415772aba2560959aba6c7f71e58d10a31b2cd290bb17e4a40d42282c5450995581e83002b0e5f95fc4e05d623490d91715d3d8ff3022c3a227bc7329190af0539e57dba218a4d1b7026fee5d2885f71767ff235068d58baacf9c400db1c638a0a7957c4607e00d81cf00ba2a56851c540286f2bcabcc04c56651286578dfcc12c7d6f107745ac11f8b28f2ca818c42eaaf3006b48bf441001798a6782fa95789f07827732ef111019b6d8330c0d7dc28d5945d44a8eae16a096cb2cc83ed94c372d0a2e0bbbfc4e4c4cb881b59595f57c17898772a5dcc86b32b6cddfd43fca04f2450d7473b82eb32f313217c91220365b53caff005f8106557f33ed82ac5ca363eba65264a45b787b5cb735e01c0e03c11e52222ba4c95f52a7c90b99e680e7303c22dad146ca7d31e8880c55740107ba914b41bb340b8b6004d86dcb8ceed189bd5b5e56db8a9dc953844a3fa88730c331f597cdce6d2fb9727009558cc711995900bc1b7898172de2e34e63973ff7f05075dc6778d1114bdcf9c1f307883c6e1ad622b620c8b345a069bf3358972d3133e4848b567115945b02e8399630557615fa8d074168b86e2f3084274410207c3514ca5d56c2f65798c8305a57105b47632c87efcc1915a8289786d7c1166500aa9cd779dca4ee02a284a5d59c90d8875743c4c70a731c00aad005acb997e8140cd1c62b7079d6702af19f4e09614556d56d6538dc5388ca54c25e096be21a77ea6071f330e413aaa9c016d621021783f0ebe60241ce350bf155a329dbfd12b11a2f17f30ddea2c53f33d9eff05c56dd417b99cbce251f8301ea1c3dca982a15d0730c22801a5607f11ddea2ab465b45a835ed60a0679cf112293621b3d71165aeb54005e379981c0d65f9c86888b6f59debc16f10a9a60bd04bf9cf3349718386036c47325c12be7bf0c250af67f24c9b9733570a3d504b441926d6b46bb89158b09a0b95679946a21a2a645e275aa00b820d3747251d703e61b3041ced670f19ea08e9f92d13376fa9dc9f14c8bba98ff98830043c02e8f389816cb35af7503cfdc176b2eb32ce22c5cddd54bf6217e0f3e6253171cc0ef331f2fb9e799b713b898dc183f1d5529fc295701282ab40170e51ca03436db5884e0aed6edaabb8ae0a34819c96f32b6c042cbbda6ae26900005f89429c28556889cdac6d0655ac101e8014ab772eb868e22a2d5e4820461a199438849c444b256b53a1b849cae878635f5096b20f962ab4772eddbdbd7dc41d4aad4bf50562f392e2e843869a88b6ab7bf32dcdc3b50d254d3b2e10910501321c7ea224272f9998cf3b5510f7961ae22822644884aa3e22b208bfb9801145ee1a4f896c4e01fd84397dcedc45ea3de71bc41ce6744b62021b710ab29cb983077fc4bf0c03160a502e4b75ee2c445a7a8714144736a2854ad3acb14b850a55788429acce7b6678311397f139a70b85ec2b5f6d11b81bcb551770599821b267f96e10161cee595987062364414fb2aae18ed56bb0884694c0d23dfc6e07e50c975785795bb98a005a8de7ac7302ee4e1a4f16ee05bccec983cf986ad524b0e6b2caaa9b4376edee2000a779dfe1a51364c6401ae29309fa259819572c2def50e49889c19dca00665061bcdd465d01f71da2ed824b500aad00657a8c06b6eda0e9aebbadca555cfb62d4dd4fb98b3fb9bad7d4a6e6ecb041e226f752daa20d750cae6c97e739f3306e0a9a50200ad87a6bd466552aaf2b31cc330311d46d1195963cc8323e2d880ddc57104cc0fd430fdc028a88a9e02e5e19ccd56c11b888e625bbc7f8a681a00e4662d85b474a51a0d11ea3a2086e11375cc46815c89a8c059984167705dfe069a821db2e120b476f894f30c3730ed9dac39022d4230d2ed5ea54ef402ab8650db5c7100a0884d4ba307b5d07b95b8da964e8f2f97e25a94ae5b6e238616ae57b7d4c1bc4dd6b3c843ee3a416a2e21a4820bf1dc79170e7b94ffcca91c0986d8a14031ca8d3ebf14ccf2831a9958808d905bdb1dc382da29cfcc4472d197a25769176a01e6e13e151737a5a35160b0ab4dbc05f1e667f4664a16828e77982567452d3ed814e46fc4bf982844412b193c751da85c5ac1e687044f7670913ba4d7389765e1262e282fc311296291698752e07594dc04722e88df3121899c41559c66096fb9634257182e2e3644556e3c198f2c70ab15e40f1dc2fb6465145e38dcbf1342156f6e2300a455bbe14c0f7d42d8608d9ddbdaf730dc5abdcaef4cee94ff59fc187ccdb1dc27233cbea0a3551a846e150075534b95a8a9a54dc938e254f5367ea2ab0280683c7ba868d248e8bc1111dc799422c362b742c69f258a559c157e661e014b66f54731c85209a8e1acab19252880dbb5771db8b765995ad57ee2a1a6ae5f142297618a4f70d1b25d1a6748e430daccbeb30108906dfe04ad7b2d8fb352aadc5190fc52788329108e05e81c872c27234ba10d91b5ee03c734648708196089400741dd71eae380ab1321e6374daa8c0c36a96d0761ea5c010695281badbe6365e4a190bf1fdc4ac82c1a2f81cde718b87f1429951ab5c07808862952957c0cb3bcaf7280c4640d4f3bf8bb9cfe2a0db1b46f9855cca2a1a772af145344295451a036c2731442811b2fb40d9dcaf07d41fc45b8357b695038f266543f996a555d0b7f505077d06d4e6873323bb6328785c78891ab40d47ba28f888084865df1ea2c9b0e5df34f58d40a6ff0071abf852b255c543ff00ae12b680072accea10dba433f6c1709dc4bd09a49ae3e61a15f29a73701827e053501df102eebe20172ac4c247490d2284f9083226d4a26ef34d47ee230015be4a8dbdbb84e7c61c38f12848ea534ad0062b7bba84baa93a3ba2a8bf5188b4a2a5bb6b73830976301cc00d623495084c98661dfb81ab9e799b299954b30405f7289ce236710b9d418610f31416aedf01bbeea214555576ab6bf72fc9182d40d41415975806db744129e01dd0168cd4ae95c4af4095948896714abf6e67b46cb713b620dd6a50e45011f7e06f35cabe730c3397a871e7cc708744b0b4030fdd4638a5536be586e5e30ba772c2e9ee2ba514018ddd1e91ee121981dc26b305834a122195db1b39948966aea25d7593ee64c7e168d5b10798d6c96f78809ccffd5ca09b6a5b7d422dbc45d3501f3086e0c29ac45c19a798e6554bd0795f0110d182a841df6aeedee0f12fd4006f360abaa171fa846df80065257257d46ac2f6b71ce539951d4dcdc2e982d653c5fcc6a89556dcbf8e5935075318a8ad4a6808902af2bfc47c456bc4a85fcd41160e80afd47db7a43a1e9f31aa8220200b3073e25d5b19d8576ed5f10e825542e7b5be61f2af0c043352d7c279bde67a20eef994c6653b8898a503ecbb8e33498783f1f9a77d9c6e0d55fbcc0c4b34cdd9f32e8e5cc0af50f3b83e618e67465884536816af41cc58490e4c6e8fd5a6f52da96c4af07d4230aad07770e74eaec6cd3fa26dfd5c4fa8f3f83ddc6ad40a1d94ad0c8cc788aee382611d9fecb81bbd46534d0ca5d9a886a5865078ddf8962a38293e55d1e227852b698f5803c466d155021c8545349a5b2af96bb8919a9995382fc5b09e33501b68228d9b39310566d0940b5305c8e25f30f30f266bccbdee37873470888ca5cea27b9dc812fd4f3cf2f99e68fbcb572c08e1cdc352e0d337adbc40196a31c1880a7b17c8f47cc5aaab56d7b62db7dcbf3313651688362c0bf352fd12d555b1d45f82ddc58c31d62e802d594c206158196bdc5eff0002e330d131404497aab80055493607145b6c102c0354e576fc10ba14aa24d5ae71fd45ad2e536b1f9ca80a8fee5822eb45d56daf389a416ea750965e2c95ecc9e25aa681367c45083504da1037953dc17507946061b8df9c9af129d91ff9470732ce62d3998798cf12ced9770312e99772abfa8a4cac6a22a2a802d5ea201444f2a3f77c115a556ac22f189f4cea7afea2783b608da3c665f51c7cc48a674662e7c39a88a5e3b84791dd6c6b01fb8d496c50ce56e3ccdd82d0dda6c3e20f3e96d16f42f1e6a20fac454e8307cc764156207c114aa5605974a0b1ae233a0295af2dc189594ef88426333a6e5530a79018a86a1e73a82dfe60a41a6a11c82d264430fdc23d9555b798a54db5a00e6de215a3b6d61ca1a23a3566c017f9a824292b755f0cf23508aeb883a4adc0796aa5dcc6de58ed9d1709066183506a29e5c47132b8943477293065ad54ba6b95f04dc362360781c1fb8956db6ed5e63f52f8c4b620cb7cc344112f4985fcee2842cd4795cbacfdc22e6a15578272042028ea8b6fc46332c2a7df92e1c02a6a392d5b5fb8c5576a57f72b3df32abd9e2117996633d4a9fb0e904e97f5348e55f88d8cc34245102aa00770ba4d9baaf253e62ce7b8bde0dfa8687aafacc6296328568ef1c454d441918eeb61e62a384c16b9cb9aad51185e282cd78b5eba2362652aeceaba8c73fb8de6fb95f53228234be46b52b9772dc4bf899a7e20ce6244b2510dd42d32ee05a00ae82e003820bd392ec36c0454693501d8315adc7c8578382f7468972f997352e5e39f529edfb8adb5b5cbe653ce88c52360507b5c10c61402aa77580f9826197541be071ee517160a342b0119e6d00b795adc2daa15d886eff73141e3cc1aee388bf589fc90d4ad60a5bdd3eaa18eefd4ae668c7589627cc33c9107586e01c514e69baa80c0c2f50eb7bf885ec4a17029a1577e2590a2d5175b4d57210838dd085ad18e2124a8516ad4a0a008e512afc42b51bdc317d4a571ee56f532fee5039990d14aabdabd431c40dc4c5c342f6c57b8e65620dd7c11a661a4ecb3df508f03c68c0b40aa023694e77a8e509e56d996e2df39977e2e5f172ea5fdc23eff00011caaa814d0ba15f752c5c58045ec1287e23f743b41a17d18d4ab5dc71671fc4030b04886582a1607cc640db1b5ed891f137f9987fedc517ad4b19b92868bcfea18b2edb500603c446a2a7fa97863e9bd576c360d98a1d5ad67c444705744394607a3d4b0255672f6ab8bf4622712e54b157fec50fee6130af3012c2e55a6f1cd8c389e0ccb6eb7e663c9287cc570638bfc34d5c706b12c0dca895c4f64aa94c4d3056c8a91d284605a8dc029b188ad621683ee0ee5d625f2cbb975f50e732e53b95cee577128ccbad639947d442d0e06e1b2081a302847a59c6e3bc57b8be731d6782727e4985fd436f205615650fdb1776e7752acf90a97cc762464d82edf5194da8d601c82e7c8451582152b779c0f908d81d5a2a97bad4430152b4a5c27d41f0ee55b0f10e665ec813dcc92ea0548a79434073ddc38e087bcfb952d8008cc656ba68ee50324fd65175128b634b4225620e238771a6a25417e21aa77886daaeebd0ea0bf51438837bc4ba9731ffd9cdc52b44b9cf12bc418d4bccd51f1168b79230350de121bc16b1ce103a6c54da45a29cc51fe58b8a71fd4b2ebc45ab5ce6e151c5e2b128019553205edd45d2b0ac2e82b07b2e0b994a1a074babe6884c08905b0bcb47b896e583cc73b623072d02640294f6b17ba832defa9aea5ada87cf111461c305b1430c96d22fc47b4ba8aaff9ea33260ea508baefcf894000aac5113e23b463598686c9755c182252f305445d44b225e7b831fc434898a6e3ba2a631ca649583b3704157679826f0dc19306fcc445293e239a975aa8e089c145dc283f822b63818a873e2333f64a9de6e389d5036dd0463ad94ed5b6745773a9cc5f5982c72c1ba3b5e0f71ce417c8320178f3140d9b5be0367b9cbadb3978439c7306edfb8f5fb8d2138f93f1d8a2f3005a943576a8fd4d712bcdfd448387b86aff00fb0592aada85ce0623765d9e3d4a30eb5013c463cfdba20902bb8d7518ddc037e63a3c9af72a79566256b1cc6db94088752a5154de603c4af9aa02ea8d3044ba205da5e2088c1989f732b0c1f77ee332186eba99925714b42e2c32950106ddd0713ff119be2e5f1df11fdee3367c663f9040a890a13dbccac338d468b32041cae023a28c396b90c5fcca5ed8d82ba698c75311100420684288854af70241258e2dee2bca062b30abfd43f5c4159e3a837e21f3a7ee3dcabeed40ae2f1055976b69a3719e37b8f38758cc5bf3fd44b960dfa8aad2d401dc27b1b2aec02e203433005af808ad6dd629dd660d176b2bdb1f78ee51dbea278e611d6f8941e9e66c4b32961d47c21711239440273077058e789836ad1b25ee0c2238b42c875d571302e2058c30f6c42c21a4a6255338acc1436b44dfd491ffd9, 'AN', 6);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(26, 'permaurcio@gmail.com', 'Mauricio', 'Perez', 0, 'e00cf25ad42683b3df678c61f42c6bda', 1, 0xffd8ffe000104a46494600010100000100010000ffdb008400090607101011120d1113110f0f1210121910100d161010100f12161716161615161f181e342c241a2a1c1613213d2d31352c2e313118203344352c4334393a2d010a0a0a0e0d0e1a0f10192d1d20253737372d2f2b372d372b2c312f2d333335372d2b2f2e2d312b2d2d2d2f2b2d2f372d2b2d3737372b2d372d2d2d2b2b2b2d2dffc00011080064006403012200021101031101ffc4001c0001000202030100000000000000000000000607040501030802ffc4003d1000010302030603010c0b00000000000001000203041105122106133141516107719122143233425253627281a1d1f015172325439293a2b1c2e2ffc4001a010100020301000000000000000000000000030401020506ffc40028110002020103020505010000000000000000010203110412210531152241516123528191a113ffda000c03010002110311003f00bc511100444401142f6abc4bc3e81ce84b8d45437430d359d90f47b8e83cb8f655fd778e35449dc52c11b796f9f24aefedb2c651b28b65e88bcfadf1ab13bdcc748474c930ff007532d93f18696a5cd86b19ee3909b093367a7713d4f16f2e3a774ca0e0d16822f96381008d411a11cd7d2c9a8444401111004444070aa6f1976edf4ffbae95e59339a0d4cacd1d131dc2369e4e2352790b7556ad4cc2363a4768d634b9c7a068b95e44c5f117d54f355bf57cd2bde7b6626c3c80b0fb16ad9bc239661a222d09c222202d5f0776edf0cacc2aa5d9a9e439699ef3f0121e11dcfc47701d0f62af65e350e23506c41b823911a83e7c17a4365fc4fc3aa591c724e20a82c607b6a4189a64b00eb38e9c6fcd6e990ce3ea89da2f88de1c03810e04684588217dad88c22220088880d1edbca59875738711473dbf91c1793c2f5aed6d3ef686b221a97d24e00ee58eb2a0fc33d9d13bbddd28bc519b44d3c1f2686fe4dd3edf255f516aaa0e6cb1a7839bc238c17c3a9a6877d2c9ee77b8031465b98d8f37f4e5a715815db018845ef636cedeb0b9a4fa3ac55cab0717c523a58ccf2e7dd820131b5cfb5efc6dcbbae1c7a8dce7c739f43a6f4d04b928caac22a62f848268feb31f6f5b2c78207c8ec8c6b9eef92c6973bd02b79fe2051866f036a8c7f2c44e0cf526cb7b475cd7c02adb1bda1f1978616b5b3380bd858733cbcd5b96bad82ccebc10aa2127e59151516c3e232dad0165ce9be7323edccdd6f3f53f8bdaf969fcb7dff2a5743b7146f7c408a88f79231ac3242f0d739ce000b8d15c015bd2596d99ff0048ed2b6a36c31b1e4a1703c376930521d1c124d4f7f6e9d8e6d442e1cec1a6ed3dc0f5573ece630dada78ea8472439ef9a29da58f8ded2439a6fc45c1d56d2c8aea4546f272888b26022220353b433b9b159ba663627b58a8ac4c6b6c0001a3e2b6cd1f729bd746d731cd7d8348d49b69dd42dc2c48bdc03c4735e7fab464ac52cf075740d38b58e4eedec5f367fa87f05db4c6173dad31900b803ed923ef0b0d173a3734d3c2fd1725526b197fd26fb8664dde56eeed6c96196dd2dc2ca2f513064a58cb08daf00b6c08234bdeff6fa2e062d3e5c99b4b71b7b5eab055fd5ebe36a8a82c60a9a7d2ca0dee26ef858f0039ad73410407004023810bb828352e3552ea98a9b38dde76dc3400e2d02f6254e576b4f7c6e8ee89ceba9954f0ce51115822088880e2eba6b27ddb1d25af945ec39aee5d751107b5cc3c1c085a4f3b5e3b9958cac910aeaf7cc7da366f268e03f15852bf282e3c00d576cd11638b1dc41d7f3d162d7fc1bfeafe0bc85929ca7e7ee7a1ae31515b7b1908b5f85d5e61bb3ef870fa402d828dac3240b4f886f58e2439f909d2c4d85f968b708917806bb65066ac86faeae3afd572b3944b67dbfb76f60eff1652e5e8fa5bcd4dfc9c7d7bfa9f80888ba6510888802222035b89e16d9b5f7af034775ec7b28ce2983d40639a185f71a64b1beaa6e96546fd0556cb73e1fc166ad54eb585ca2aa182558d443283d405b2a782ac68fa794fd26b75561d92ca17d2ab7eac9bc427ec884b28a63fc29079b485f5fa3e6f9b7fa29a592cb4f08afee63c427ec8d3607863a32647e8e22c1bd07e6cb7288ba54d31aa0a11ec53b2c7396e672888a534088880222200888802222008888022220088880222203ffd9, 'AC', 6);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `estado`, `id_empresa`) VALUES
(27, 'ebernaldez@trazalog.com', 'r.sanchez@mrsservice.com.ar', 'Bernaldez11', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010102007600760000ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc00011080320032003012200021101031101ffc4001c0001000203010101000000000000000000000104020307060508ffc4006010000103020205060906070d04090304030100020304110506071221314113145152719122233233345361728115426274a1b10824273743b2c11628385556737576829394d1d263a2e1f02526365792b3c2c3f1173554184465d3456484ffc400190101010101010100000000000000000000000102030405ffc40027110101000203010002030002020300000000010211122131413251032271136191b1526281ffda000c03010002110311003f00fcc8888be9bca222202ca3798dc1cd3b562882d48c6ccce5221e17ce6aaab38a4746ed66add2c625672b16ff009cd45f55911110444404444044440444404444044440444404444044440444404444044440444404444044440444404444045296410a54d94d906364b2cac96434c6c8b2b2590608b2b28b208444404444044440444416287cf1ec2b41de56fa1f3c7b0ad077943e211110111101111011110111101111011110111101111011110111101111011110111101111014b7ca0a14b7ca0837d6f9ff008055d58adf3ff00aba42fa222202222022220222202ce291d13f59bf11d2b04416668db237958b7711d0ab2d90ca6275c6ee23a56e7c025b3e1b58ef1d08beaaa2b1cd25f677a73497d9de9b4d2ba2b1cd25f677a73497d9de9b34ae8ac73497d9de9cd25f677a6cd2ba2b1cd25f677a73497d9de9b34ae8ac73497d9de9cd25f677a6cd2ba2b1cd25f677a73497d9de9b34ae8ac73497d9de9cd25f677a6cd2ba2b1cd25f677a73497d9de9b34ae8ac73497d9deb5cb13a223586f434d688880888808888088880888808888088880a40520290100052029016c6b1174d61ab20d5b9ac5988d36ba570c53a8ac88d4f26a6cd2a16282d56cc6b031a6cd2a90a08561cc5acb5534d365042d842c484674c11490a10111101111058a1f3c7b0ad07795be87cf7c0ad0e0438822c50f8844440444404444044440444404444044440444404444044440444404444044440444404444052df282852df2820df5be7fe0157562b7cff00c02ae90be88888088880888808888088880a412371508826e7a4a5cf49508826e7a4a5cf49508826e7a4a5cf49508826e7a4a5cf49508826e7a4a5cf49508826e7a4a5cf49508826e7a4a5cf49508826e7a4a5cf49508826e7a4adf0ca1cde4a5dad3b8f42ae886db2688c4eb1ddc0f4ad6acc32091bc94bbb81e85a658dd1bf55df03d283044440444404444044440444405202059008002cdad468badcc6a3435ab6b18b38d8ac471acdab2353635b9b17b1588e256190fb14db5a5210a9e497d16c0b3e6e7a14dae9f28c2b5ba25f59d07b1697c3ec4da69f25f1ad4f62fa7244ab491ad4a9a7cf7356a70572462d0f6aacab90b1216c7058955182292a1104444120969041b10ad02da96d8d9b28e3d2aa29048371bd04b9a5ae21c2c42c55a6b9b52dd57ec906e3d2abbd858e2d70b1418a222022220222202222022220222202222022220222202222022220222202222022220296f9414296f94106fadf3ff00abab15be7fe0157485f444440444404444044440444404444044440444404444044440444404444044440444404444056a278999c94bbfe6b9554419c8c31b8b5dbd60ad46e13b3939363c792e55dec2c716b8588418a22202222022294108a6ca40400b3685016c60458cd8d562362c230ad44d52d6a36451ab90c4b1818be8411ac5adc888a15d272968a315c5a806298c4f4f80e0a06b1aaae3aa5cde96b091de48bf0baf4393f2e61791f2ed366cce14c2ab10a9f0b0ac29ff38ef123c1f81dbb85b79200a05b9af4a98f9d6d7a92d370cbea53d2b4fd83ed71f6ae572df8d48b7cd7455817805b8ce64a86ef7b4f25113ecdadd9de9fba3d1d1f01da3d786758561d6fbff6afaffb91c8f972f1e62c6ea714af6ec7d3e1c2cc61e82eff00323b1473bd1a91a872de2ad66ee50549d6edb728b3ff00957c8f92f459983c5d35562d96aa9de49a8f1b083ed24bbef0bcde75d17e3396a8ce21198714c1dc359b5d4475d81bd2e1bda3dbb47b57bb191729e65f0728e3b2d2d71dada2c49b6d6f6075afddacbe0d162b99b4618eba92489ec80ed96867f0a0a866e25bc3fb43e3d0acb7e0e3f2c3ec54e68bd8bb5e90b296158c65f39cf24c7a987936c430f03c2a37f120706edda370b82366ee413c7bd74c72db363e34ac556462fa93b15195ab72b1628bdab510acc816870dab6cb510b15b0ef58a32c514a5904229b28412acb1ed9dba929b386e72aa882cf36ff6acef4e6dfed59deab222f4b3cdbfdab3bd39b7fb5677aac8874b0695d63aae6b88e016822c6c77a96b8b1c0b4d8ab376548db66cbf7a1eaa22c9ec731d670b158a2088880888808888088880888808888088880888808888088880a5be5050a5be5041beb7cffc02aeac56f9ff008055d217d111101159fc5be9a7e2df4d174ac8acfe2df4d3f16fa686959159fc5be9a7e2df4d0d2b22b3f8b7d34fc5be9a1a564567f16fa69f8b7d3434ac8acfe2df4d3f16fa686959159fc5be9a7e2df4d0d2b22b3f8b7d34fc5be9a1a564567f16fa69f8b7d3434ac8acfe2df4d3f16fa686959159fc5be9a7e2df4d0d2b22b3f8b7d34fc5be9a1a5645640a626d778bf12b54d13a2758eee05134d688880888825596b854b355fb241b8f4aaab387ceb3b42118b9a5ae2d70b10a16eaa1f8c3d6a404b294410a51101022908326adac0b5356f8c2351be20aec2d55620af40162b51769daba5e8632cc19833635f8906fc9587466b6acbbc92d6ee69f613bfd80ae734c372ed193ff00e87d06665c423f067c52b19401c37ea002e3b8bd73cef4dc57ad9abf4a1a40060716b677f274ec77934f0378dbb369e9257bfabe5ea6a63c8d90da69e820b8acac06c6676e7b9ce1b6d7d86dbcec1b179dd158f91726669cc6c16aa631b454ceeab9d6b91f1737b97a5c21c72de8e295f1df9fe36f25d25fc26c2385fb3f58ae57f4db168caf94cf36c330e8f1bc4a3d925554db926bb8868da3bbbd6dfddc628763f0cc25d07aa301b5bbd55c2b0986a437913aaeea95f6865b9359ad74761c4a9d7d14461f97335c618da48f00c6a5d90ba3f332bb80b6c17ee3daaa530931ce5b22e7a16c463bfc9d5eedaf63edb06b7ce046e3c46c3b6cab662a61ca90cd8d66c6db66ee2ac66f7c98e645c3f3007118be1538a79661e5385c16b8fc754fc4a0f0b92b14a8c879e66c3f176014333cd0e2303b6b0b4ec0ff006817bdf8b49e95e434a395ff007299c2bf0c8ee694112d338f189db5bddb5bf05d0f4dd047881c033144d0df95a84196deb1a05fec75be0be76974fcaf90b2263f2785512533e8a67712596b5fe2d777adcbdcacd713a86ef5f3e66afab5017ce9c2ed18af9f20559e15b942acf0b7196872c4acdcb12ab28444441111042594a20c5164a2c82114d94202950882cb256cadd49fe0e5aa689d13b6ed07715ad599fd1a145f5591111044440444404444044440444404444044440444404444052df282852df2820df5be7fe0157562b7cffc02ae90be888880888808888088880888808888088880888808888088880888808888088880ac43282de4e6dace07a157441b6788c4ee969dc56a5b5b33844632010775f82d4808a6ca50459670f9d676858ace1f3aced0832aaf487ad4b6d57a43d6a485112ca5042594a2022222b36add1ad0d5be3458b517057e0e0a844af40562b51f529b82ecf4fe37f07687536f238d9d7f65c1ff00505c5698ee5da7445ff58323e6eca808355244dafa469e2f65ae07c5acef5cb3fdba47d7cb3e3b4238cb23dae83128e493dd3c9af4798889b28e4da98fcc8a5311b70700dbfdc7b9790d0be214f3d562796b1077274d8d4062693f36600eafc6c4fc405eb3288e714388646c75e29b10826325148fdc241b7547b0ef1d21c573bd5696b2fcac6b9a4af7d262304586b6e01246c078ae531b2af0bc45d478844e8278cf84d7711d20f11ed56eb31ce50901de08d814b362f63bcd6a4b8c4ee4dfd576e54cc6ea3d1666274fb1b3d546c8fda4165edff3c17cea1a6adcc188368f0e8cbe427c27fcd8c759c780fbd7d4cc65b8b62784647cbcfe5a9e99d7ab9f782ff9ee3ee827e240e09ff43cbe92fc4e8df22d3c9e74c52cb63bc34dadf785f2b3b78ad0564c8dfb1f2564f237ddbc9fe6158d2f62716399ba2c3308f0e1a06370fa66b7687bef636fed587f6554d3ccd161cfcbb95a9de1ccc1a81ad948ddcabc0bfd8d07fb4b53e2571da9e2be6cebe854397ce98aef18aa52aaaf5665559eb718ad2e58ac9cb1559111102ca2ca51042294b222112c880a14a208b285928410accfe8d0aaf65627f4685162b222220888808888088880888808888088880888808888088880a5be5050a5be5041beb7cffc02aeac56f9ff008055d217d111101111011110111101111011110111101111011110111101111011110111101114d902c8a510111101670f9d676858d967179d676841355e7deb5ab53405f239c1ecb1f6ac79abbaecef4db5a5745639abbaecef5aa58dd1baceefe944d3044440408837a0edb84e4fc85943256038ce91dd8b576218ec66a29a8f0f76a8821d9673b68b9b11c78d80d84af35a5ec934593f15c327c0ab64adc0318a515b432cbe5861b5daed82f6bb4dec37edda17dbc0349194f14c9d84e01a4acb957899c181650d5d14ba8fe4f678b7f84dd96006f208036022ebd7e656613a75cb50cf93d8ec3731e5f85d145824b237566a5b8b7276d97d806cdc7c13c0ae1bb2eeba75674fcfd19572172a6f8a5a79e48678df14d1b8b1ec7b4b5cd70362083b88e85ba272eb523eac0f5eaf24663a9cb198e8716a3f0a4a77ddccbd848c3b1cd3da2ff62f170bd5f824dcb166da95db349182450cd4f9cb2bbdcfc0b12709c3e3d8696726e41b793e1773ae3a17a4c3b15c2f491474d0d7d54785e6fa768645527c18eac0dc0db73bd9bc1da2e362e61a38cfd3e567cf475703710c06b3c1aba19368703b0b9b7d81d6f81e3c08f675d9028b1fa6762fa37af8f10a33e149874afd5a8a73d5dbbfb0dbd84ae366bd6deceaf306378252b6873d601f2a40cf05b536db6e9120163f61e95f2bf74d9081d76e0988b9fea8cfe0febaf254b9fb3a6527f33ac96a62633c1e6f88c25c00e805d636ec2af1d33e2a06b370cc09b2fad14e6ffaca71a6dec20c5332e66a5f93b28e0adc13097ec7ce0165c71bc961fee827dabe1e3b9830ac8983d4e0d95ea5b5b8e54b752b7136ee887523f6f66ede493bbccd666cced9e5e68e9df5b571bf6182862d48edf48b787bc6cbead2e4cc1b26d3c78a6922b223281ad060b4ce0f9253c35edc3b3c1e93c135af461a39c329f2f619367dcc8c2da3a50461b03b63aa663701c2fc37d8f69e0b91e61c5ea718c56b311ae7ebd4d54ae9643c2e780f60dc3d817dfd22e79afce388b25a86b69a869c6a5251467c085bfb5d6b5cfc0582f0f3c8ba633ed4b5a677dd5099cb7ccf54e572eb18ad12155de56d90ad0f5a8c302b12b22b15504444044440444404444116452888844b2202df3fa342b42b13fa342948aca164a2c8211110111101111011110111101111011110111101111014b7ca0a14b7ca0837d6f9ff008055d58adf3ff00aba42fa222202222022220222202222022220222202222022220222202222022220294b2940444404452822ca5111444440b25911015989c26672521f08792556417e0825ed2c716b858850ad5854c7fed5bf6aad6b26c4594d9110485f4701c5ebf02c5a9713c22a64a5aea67ebc52c676b4fed077107610be7290847e83c46870ad38e092e2f8145061fa42a3883abb0f0755988346cd765f8f41e1e4bb659cb87491cb4d51241511be29a2716491c8d2d731c0d8820ee20f058e078b576098ad362584d4c94b5d4cfd78a68ced69fda0ee20ec2362ee95d458669cf049315c163a7c3f487451035b420eab3106016d765f8f0078792ed9672e5f87f8e9eb89c6f56e293dabe7cd14d4b512d3d4c4f86789c59247234b5cc70362083b885b18f5ab136faf14cbe96198ad561d54ca9a0a99a96a59e4cb0bcb1c3e2179e648b7325f6ace9adbb0619a6acd14f00831075062d00d9ab5b4e093da5b6bfc57bb19e69c68b3f758dcab97c577ca3ccb93e6c352d6f2af6bdfe2bf34b665d760bbff0006ad9fc7ff00b173cb0934d4ad38c699736574060a4a9a6c2e9cecd4a180308ec71b91f0b2e735b5d3d554493d54d24d3c86ef92479739c7da4ed2ac4544f7b7602ab55d2ba306e16a493c14659afc5549244a825a4aa8f7adc8c123d567b94bdcb4bcad48cb1795a9cb2715815a441508888259110422944108a6ca101114817280013b96d1038f057f0ea4e55c059749cafa2fcc198680d5e1785cb3538b8e5096b1ae237805c45fe0b396723531db92ba2737785ad7b7cc7972a709aa969ab69e482a223aaf8e46d9cd3ed5e3eaa2e4de55996cb8e95ecac4fe8d0ad0b7cfe8d02acaba22222114a20c514d942022220222202222022220222202222022220296f9414296f94106fadf3ff00abab15be7fe0157485f44444044440444404444044440444404444044440444404444044528214a2940444404b2dd4f1891e43afbafb16a45d08888088880888809652880888832638b1c1cd36215879825b3dce2c71de02aaa6c837f274feb4f727274feb4f72d0a545db7f274feb4f727274feb8f72d0882c8653fad3dcafe0b88cd82e294d88e155f2d2d6d33c3e29a3d85a7f68e041d846c2be3ac826976fd0d5d478469cf079312c204141a42a2881aba469d56622c02daedbf1e83c3c93b2c570eaca59a8a79229e392392371648c91a5ae6381b16907715a306c52b705c529b11c2aa64a5ada6789229a3362d3fb47020ec23615dea48f0cd39e0925761d1d3e1fa43a28af55480eac788c605b59b7e3edde371d96239fe1fe35eb8435eb63645857d2cd41572d3d4c52452c6f2c7c7234b5cc70362d20ee21680f5b45e649b5771c1da1ff00838301e38ffec5c0db258aee185d4727f833364beecc36fb173ce78d635d5720e4ec128b2be15575b864389e2189466602775991b0701c2f623dabc3e9bb2a61b839c3f10c222305257c6e77204df93736d7b7b0dc2f41a12ce2fadcb58ce1f88c10d5d260f46eac85af1e101e112cbf46cfb572fd24e902a736d5b27a86c70c3133521822f2636fed3ed5cb197936e6b8900d795f25ce56f109f5de57ce7397a6472a97396b250958955104a8428aa212ca51111650b24418a29b2590422220594b3ca50a41b6d41e9b017343c5c81ed5fb7708a0ab9b2d65c34104f151b28231cddaf303a3975459cedd7ff9e95f9db21658c334779760cefa45875aaa5f0b08c11db2499fbc48f07701b0edd8d1b4edb05e6b1cd2763b8ee2f5388d5d7cd14937822382573191b3831a01dc3dbb4ef2bcd9ce77a76c6e9d1ff093aba19f3153c70c914b594f4ad8aa9ecb6d7dc9b1f6807e175f9c713b7286cbece258bba7b973ae4fb579da8975dc575fe3c78c672ad0ac4de8d02d2c639e6cd0495baa46ac513091ac3785d1cd5d4594a208452a110516528831452a1011110111101111011110111101111014b7ca0a14b7ca0837d6f9ff008055d58adf3ff00aba42fa2222022220222202d8219080430d8ad6b609640000f7587b504f212f50a7212f50a8e5a4ebbbbd39693aeeef45e93c84bd429c84bd42a39693aeeef4e5a4ebbbbd0e93c84bd429c84bd42a39693aeeef4e5a4ebbbbd0e93c84bd429c84bd42a39693aeeef4e5a4ebbbbd0e93c84bd429c84bd42a39693aeeef4e5a4ebbbbd0e93c84bd429c84bd42a39693aeeef4e5a4ebbbbd0e98b98e69b3810515a691531eabbceb771e95548209076108822259014a222ac51f9c77ba5571b558a3f38ef74ac69d9acf08ad9052ba4e0adfc9aed5beaaf5f9072e499831ba1c369cb5b2d54a230e76e6df793d82e57e873a21c9f2b5d8553d4628dc45b78db5afb722e940dadb5add3b3ed5cb2fe4d56e60fc7d3d33a3de156236af779c3049309c4aae8ea1a04d4f2ba2781baed3636ee5e2676eabcade376ce534d564445a6445296404b29440444b20229b222a2ca6c8a6c82114d94d904057707c4eb707c4e9b10c2ea64a5ada6789229a336731dff3b08dc46c2a9d94a947e85963c274ed81c95542ca7c3b48b470dea2981d48f116345b59b7e3edde371b8b11c16be92a30fac9a96b22921a885e5924723755cd7036208e05461588d661189536218654c94b5b4ef12453466ce638711fe5b88d8bb863f2615a61d1ee2b99f91661d9cb2fd389310e4d968ab6200d9c3a0d9a6dc45ac6e2c473fc3fc6fd709baec91c85bf82a970fe51ff00e95c62ebb183fbd44ff593ff004ab9fcff00522f7e0f752e7e19a44b93e0e0121fb1eb8d3eb1cf636e7805d6bf0763ff00466927fabd2fdcf5c5da7c06f604c67f6a5bd363dfac769581445b650a14a59518a2cac96418a8b2caca2c822c8a510422591116b0ac3ab317c469e830ca696aeb6a1da914313759cf3ec0bd866dd12675ca7847ca98d60ce8e85b6e52586664c22bf5f549d51eddded5edff0004bc3aa66cf38a57474cf104186cb1f3e2d0594b238b75492765c80ed9d17e0bd8e56cbb98b46d84676c574938cc5360f59432d3b207d599cd7ceef25ed69dc48b8b6ff0b6ec0b8e5fc9665a8dcc7a7e5bed5dcf24650c2347197e9f3ce91e1e52b64f0f07c09d6124cfde24901dd6d876ec6ef3b6c14e48ca58568d32f53678d23d3f2b88bc0760d81badaf2c805c49203badb0edf2779f0880b95e77cd78b674cc13e318e5472b5326c631bb190b3831838347dbbced5ab79f53c4fc7ba9cf19bb16ce99867c631c9f94a893c1646dd8c859c18c1c00ef2769dabe1095c38ad68ba49af19db3bbe43617256d103631ad3badf44251f9521fa2b4125c6e4dcf4a8adafa836d5886a37d9bd6844550444404444108a54220a14a20c514a840444404444044440444404444052df282852df2820df5be7fe0157562b7cffc02ae90be888880888808a5420222202222022220222202222022220952a14a09692d7020d885624689e3e5183c31e50559670bcc6f0e1f11d2846014adf3c60812c7e41dfec5a11444441628bce3bdd2b1a676abc2ca8bce3bdd2b434d8a2ba3642cc126058cd16234c5bcb5348246876e36e07d845c7c57e92a3d30e526ba2ab968f108a77c81f2c42ce8e371d8e78dbb7bafec5f8d696acc7c55ef951fab6d62b8e5fc7caba4cdd6f4ed96ea70dadfdd052ce311c0316799a0af8f68d6792751d6dc77dba6dd2085c3aa1d7795d3f463a4e665f15180e67a7f94f27e237655d23c6b186ffa48c74f1206fb5c588db4f4b7a377654753e3380d4fca994311b3e8abd875b52fba3908e3d078db81042b87f5bc6a65df71cd94d914aeae622259012ca5114453653641164b2952822ca40bee402e57d0a2a5329160a5aba5111b8f0505a42f590606f7b2e1aa957e16e86f76d96792f179f45b668f51cb5d96910bb16847f375a58fe876fdd2ae3f65d8b4243f277a58fe876fdd2ac7f278b8fae36bb18fe0a27fac9ffa571eb2ec43f8291feb27fe94cfe7fa62cbf076ff00ed9a49feaf4bf73d7186790dec0bb47e0eff00fdb3493fd5e97ee7ae32c1e037b0263f952f9116459592cb6cb14595945904229b28b2028528822ca2cb24546165ed745da3ec473f632e829dc2930ba61ca5762120f174ecde769d85c45ec3e26c02cf45ba3dc433ee30f8a178a3c26947295f88482d1d3b379da7617100d87c4ec0bd2e947485878c19b923478c34794a9bc19a76f9cc45fc5ce3bcb49ffc5d960b19656de38fad49f6a34a3a41c3a3c15b91f476d34994e98eacf50d3e33117f1738ef2d247f6bd8000bed650cb787e8e32f52677d24b24a9c4dc2f81e052bc97976f123c1beadb61e86ec26ee200c727657c2745f8053e76d215309f189bc2c1b027d83cbb789640775b61dbe4fb5c401ca33a66ac5739660a8c631da833554bb1ad1b19133831838347dbbced2b326fa9e2dbaeea33ae6bc5b39e3f3e2f8ed419aa64d8d68d8c859c18c1c1a3edde6e57c252a174d6bc62f628b294551be8ff4beeaacacd26e97dd559012c8882114a840444404444108a54220a14a20c5149508088880888808888088880a5be5050a5be5041beb7cff00c02aeac56f9ff8055d217d111101111059abf261f7556566afc987dd559214444404444044440444404444052814a02220400a51115b60975090edac76f093c5c9bb66d61dc56a5ba394724e8e404b785b820d28881058a2f38ef74ad0ac5179c77ba557517e0a6e54295505d2f44ba48195db5180e64a7f95326e237656513c6b7257df2463a789037dae2c402b9aa2cd9ca6aacba748d2d68d9d94f9be3580547ca993f11b3e8aba33ada97dd1c87a7a0f1b702085cdd74ad12e920e56e7181e61a7f95327623765650bc6b7277df2463a7891c6d7162014d2d68dff0072bcdf1bcbd51f2a64ec46cfa3ae61d6e4efba390f4f41e36b1b104298db2f1c9ab37dc73645365202db28b29b22940444b2809653653641310f082f538031a5e0badb36af2ed362bec61957c9386d59c9ac5fb2b03c0f2d659c1a8696ab0ea2a99e6a36d4cd5152c0ee509f9adb836f87b171fd3c65ba0c07303061cce4e9aae06d43623fa324905bd9b132b69aabb0ac1e9682bf0fa1c523a4b0a77d45c3e30370bedbdb81dfdabe8e9568067fc0df9eb28cf2d6c71c61988e1ee3ad352168de00f9a06d23fb42fb6de792e3976ebb7e79c400121b2a0acd4c9ca3af7bdd68b2f5471ac5762d097e6ef4affd0edfba55c7ecbb0e84ff00377a57fe876fdd2ac7f27e2b8fae3abb08fe0a47fac9ff00a5720b2ec23f8299feb27fe94cfe7fa46dfc1ae27d60cfd87d30e52b2af01923821040748ef08587c5c3bd7189229207ba19e37c72c64b1ec78b39ae1b0820ee20f05f4301c5ebf00c629714c22a5f4b5d4cfd78a56703c411c411b083b085dab31e0f8769a32ecd9a32ad3c74b9d68980e2d8530fa5002dcac7d2766ce9f24ed0095bc72ddf29ec70345b1cd2d716b816b81b1045883d042c6cb6cb1459592c831453644116516528831b2f6fa2cd1e57e7cc5e4632414583d20e52bf1193632060da4027617117b0e1bcec59e8b74795f9f31591ac905160d4835ebf1197632066f2013b0badc3701b4ecdfe834a5a41a097098f24e8fe334794690eac9236fca622fbed7bcef2d276eddae3b4ecb058cb2b6f1c5a93ed34a3a42c3dd83b324e8f2334794a98da595b7e53117df6b9c779693b76ed76ce160bed651caf84e8b701a7ce9a41804f8e4c35f07c09d6d7d6e12483811b0edf27daeb01394b2ce17a29c0a9f39e7fa713e3f30d6c1b0379f083b84b20e046c3b7c9f6b880392670ccb8a66ec7aa317c72a0cf5731e1b1b1b783183834747c4ed2b326fa9e2dfdd339667c533863f518c6395066ab98d801b19133831838347fc4ed2be2594a2eb3a62b1b28592821511650a5106fa5f266f755656697cdcdeeaaea150a164a2caa211110422950808888088882114a8441415288314525420222202222022220296f9414296f94106fadf3ff0000abab15be7fe0157485f4444404444166afc987dd559588e66b9bc9cc2ede07a16334263da3c261dc422d69444441111011110111101484528088880a5111444440444400a511058a2f3aef74aaeac5179d77ba56845f8294402e6c11002e6c15b8e1646d0661acf3f347046b5b4cdd676d94ee1d0b3a469965bb8dc952b522d53d2c526e85ddeba668c33bfee523a9c1b1aa2762594b10bb6b28641ae197df2301e3d238db8100a9d1564cfdd5e3d4f87890431b817cb25afaac6ef23dbb87c5762c6344b962be867a4c09f5f0628c89d240ea9378ea3577f0e3d22dd8570cf39e57491c3b4b1a38832b369f1ccbef389e51c42cea4ac8ddadc95f74721e9e009df6b1b10b9a6bc1ea8f7aec191b3c7ee427aac1f1ca6f94b29e217656d03c6b6a5f617b074f48e36e0402be1e967470dcb51d3e3f96aa3e54c9d88d9d4b58c3ac612774721e9e009df6b1b11b778e5f2b367e9cef5e9fd53bbd4ebd3dedc91b9f6ad002e87a22cc596f0ca8c4706ceb85c15581e30d6c52d66a5e6a370beabdaede1b73736da2c0edb10b77a9b6676e7f2161778b6ea8b6e5ecf449925b9eb343a86a6acd161b494efacada90012c89b6bdafb2e49de776d3b772cf4a7a3caec898a477905760959e1d06231d8b2661170091b03adc3711b46cdda34579da5c899a3e52e6adada29e1752d652b8db9589d6b804ecb8201dbb378e2a5bbc778aebbedef25c8fa3ece5806392e8dabb178f18c1e9cd53a0c476b2ae26ef73788f61d9b48b8dab89037008dc76afd3da3dabc878b6199a706d17453e0d9a715a17470fcac490e69beb4711d6758017f6ee3b4357e6ec570cacc1b12a8c3b13a69296b299dc9cb0c82ce611fb3a0ee236859c2f76532fda9d966c716a845d19586d4b80debd0e44cef8be4acc1162b83cbe10f06681e4f27511f16387dc7783b42f2ca6ca592fabbaecfa40c9985671cbf2e7cd1b4479bdcbb16c1da3c651c9bdce6b47cde240d96f086cb81c5d7a5c819cb16c8d9822c570596cf1e0cd03c9e4e767163c7dc7783b42e8d9fb26e159d72fcd9f346f0da31e162f833478ca4937b9ec68e1bc903611e10e20625e3d5f17d7145d87427f9bcd2b7f4437ee957201b45c15d9ff0007ba6f95b02d21601492c2315c530b11d24323c339570125c027a35877abfc9f898fae2f65d6b44f99b01c432d5568f73b014f8457d4738a4c458ed534b526c01770b5c0b1dc2e41d86e39757d154e1f5b3d1d7c1253d5c0f31cb0cadd5731c3782157b05729ca24ba7a6d21e49c5722e60930bc5e3041bbe9ea583c5d447d66fed1bc1f813f332c63f89658c729716c16a5d4f5b4eebb5c36870e2d70e2d3b885d4747b9df0acc9804790f492f2fc31d66e1b8ab8f8ca093734171f9bc013b86c3e0eef09a44c918ae44c7df86e2cc0e63aefa6aa60f17511f59bede91bc1f81325dff5c96fee3a6667c030cd2fe033e6dc950329b35d3b75f17c15876cc7d6c7d24f4fcedc7c21b784b9ae6b8b5c087036208b107a0afab9671ec4b2ce354d8ae0954fa5ad80ddaf6ed0e1c5ae1f39a7882bd7694b3665cce70d162d4382cd85e6895c7e53e488e6d36cf2dbb6fac4f1b0d9bee6c524b8dd7c3aae768b2b2596d18a29b25906365edf45ba3caecf78ac969050e0946394afc464b0642c02e40276175b86e0369d9bf2d1668f6b73d6272974a28702a21ca57e2325832160172013b0badf00369f6fdcd29690e8eaf0b8f26e4488d064ea3f0496dc3ebdc0ed7bcef2d276d8ed71da78018cb2b6f1c564fb4d2969068aa70b8b2664188d164fa43aae736e1f883efb5ef3bcb49db63b5c769e007deca79730bd13e034f9cb3e53b6a3314e35f06c11e7c263b84b28e046c3b7c9f6b880391e54c6e6cb798f0fc669a9e9aa67a2979564552cd68dc6c40b8f65ee0f0201539b731e299b31da9c5f1ca93515939dfb9ac6f06347068e03f6925387c9e1cbea336e65c5336e3b518be39526a2b263d8d8dbc18c1c1a380f89b9dabe3594d942dc9a4410a1649644628a48508a8b28b2c942a8dd4de6a7f7556b2b507999fb1564108a542222ca164a0a084444108a54202222022220845254220a14a8410888808888088880a5be5050a5be5041beb7cffc02aeac56f9ff008055d217d111101111016d866747b37b4ef056a441675e9fd5bbbd35e9fd5bbbd564436b3af4feaddde9af4feadddeab221b59d7a7f56eef4d7a7f56eef55910dacebd3fab777a6bd3fab777aaca421b580fa7f56eef53af4feadddeaba268dac6bd3fab777a6bd3fab777aae14a695603a9c9b16387b6eb5cd118ddd2d3b8ad6b7c1202de4e5dac3b8f422b422ce68cc4fb1ddc0f4ac110528880a500248005c9569ad6d33759f674a770e841313453b0be43e11160d5554bdee7b8b9c6e5428a0049b056da1b4cdd676d94ee1d0b5527a43144d732bc9dbb55562e717b8b9c6e4ab942f0d782a985931c5a54a8ebda2fce2fcab8ed36211b1b2865d92464db5d8778bf0ff82fd0197b48395f1cc41f4584cf5187e2f5703a1a592b45e28e423635b676fbf0d97b5bd8bf17d3d6b99b8ab2ec49e46c71b8e375c72fe2dba4c9e8b48385e2197f1ca9c3318a77415711da0ed0f0773da78b4f4fed57b457a467e529aa70ac6a9fe53ca588dd95d87bc6b000ec32301f9dd238db8100af6796333e17a59c120c9d9eaa1b4d98611ab83e36e1b5eee11487893b07d2f6380278fe6dcb78a653c7aa708c7298c15909ed6bdbc1ec3c5a781fda085ac7b9c724b7ec7b2d2be8e1b96e18330e58a8f95326e2167d2d5b0eb186fba393ee04f61b1dfcd5742d14691a5ca13546198bd3fca794f10bb2bb0f906b0b1d85ec0766b748f9ddb62ace95b4731e5e869f31656a8f94f2662167d35530eb1809fd1c87b76027a2c76efb2d978e4967d8b5a2cd21d1d2617264ecf911afc9d59e082eb97d0389d8f61de1a0edb0dad3b47107e2694b479599171388b6515f81568e5283118ec593308b8048d81d6f811b47b3c3aea7a2dd21d1d16192e4fcf509c4327561b78572fa1713e5b3886df6d86d0768e20acb8ddc3deab98d2d44d495315452cb243510bc491cb1b8b5cc70370411b885dde86b30dd3a6091e1b8b494f87e9168a22292b08d48f1160dba8eb71e91c3ca1b2e173dd29e8f2b323e251491ca2bf00ad1ca506231d8b2561170d711b03adf02368e2078ba69e6a5a88aa29a57c33c4e0f8e48dc5ae6381b8208dc4259329b879d56fc630badc1b13a9c3b14a69296b699e639619058b4fed1c411b08da153b2ef987d6e17a72c162c2f18920c3f4894716ad25691ab1e22c6edd475b8f48e1e53765dab8963385d760b8a54e1b8ad3494b5d4cfd4961906d69fda0ef046c236ab8e5beafa58a3645365365a442f4790b3862d92330458b60b2eac83c19a1793c9cf1df6b1e3a3a0ef07685e7ac9652f7d51da33de4ec273be01367ad1bc25a1be162d82b478ca57ef73d8d1c379206c236b7885c9707ada9c3a76d6e1f51253d540e1243344eb398e1b882be9e44cdd8ae49cc10e2d824dab2b7c196275f939e3bed63c747b7783b42e9d9d328e139df2ed5678d1cc25a6c5d8b60ad1e329a4b5dcf6346f0769b0d846d1c42e7be3d5f1af7b5b2dc374ef825c736c3b493410edf9916271b47d847fbbed69d9c3310a1a9c36baa28abe9e4a6aba7798e58646d9cc70de085341595387d6c1594151253d540f1245344ed5731c37105773070dd3ae081af34d876922821d876322c4e368fb0feafb5a763f0ff0f5c0edec5d8b4799db0acc397d9913492f2fc29d6186e28e3e32824dcd05c7e6f004eedc7c1ddc9f10a1aac36ba7a2af824a6ab81e6396195baae6386f042af65bb265125d3d3e91723e299131e761d8a343e27ddf4b56c1e2ea23eb37a0eeb8e1d9627cad9763d1d677c2f1dc05b91348ee3260ef21b87e24e3e330f937346b1f9bc01e1b8f83bbc4e9172362b9131d387e28c124325df4b5718f1750ceb37a0eebb787658998e5f2fa59f63c9592cb24b2d2315ee7459a3baccf188cb24928a0c068bc657e2325832268172d693b0badf00369e00ecd14e8f6a73c6273ba49d943825081257d7484011337d85f66b100efd806d3d07d9e7ecd54f8a61b0e53c9501a1ca147e080db8756b81f2dfc48bedb1da4ed3c00c6597c8d4c7ebe1e94b3f5256617164fc8b09a0c9d47b0dae1f5cf076bde7796df6d8ed2769e0072a23a57b6c432cd5d240d92a2967898ff0025d246e687761236af335b4a622762b8ea750b2be6d9166428b2db2c5410b2b28418d942cd41088c5410b250831b22cacb12106f83cc4fd8ab90ac43e8d32d08b5822c8858aa88452a104150b2505110888821149508088880a0a944108888882a164a1042222022220296f9414296f94106fadf3ff00abab15be7fe0157485f444440444404444044440444404444059280a50111020944445111105885ed919c94bfd93d0b5ba17b1c41693ed016b0b70a8940b6b7d8a2b0e4dfd577729113c90031db7d8b3e732f5fec53ce25ebfd8a9d365db4cdb0b3a53c7a156712e249372511405288151ba93cfb544be75fda56549e7d8b197ce3fb4a9f558a22901100b25088241b1b8debba652ccb84e95b01a6c9d9fea053e60806a60f8e3bca73b84529e24ec1b7caf6380278600a54cb1dacba7d9cdd96714ca38f546118e53982ae137d9b5b23783d878b4f4fc0ed0bd468a748d364e9aa30ec529c62795710bb2bb0f906b0b1d85ec0766b5b78dceedb11ec728665c2f4a780d3e4ccfd5020c7211ab83636fdaed6e114878df60dbe57b1c013ca738657c572863d51846394e61ab8b68236b246707b0f169ff81b10b3be5fd72f57cee3d869574750e034f4f9932a547ca593310b3a9ea58758d393fa3938efd809db7d876efe6a02e81a29d224b93aa2a30fc4e9fe52cad885d95f87c8358107617b01d9ad6de373bb6c45dd2a68ea0c0e960ccb946a0e27936bece82a1a4b9d4c49f37271dfb013b6fb0edde96cbac8bdf71b7459a42a3a0c365ca19e2235f936b4ea90eb97d0b89f38ce21b7da40da0ed1c41f91a53d1dd5e48af86686618865fad1af4188c762c95a45c35c46c0eb7c08da3881e1805d43459a42a5c330f9b29e7584e21936bbc17b1d72ea2713e723e205f6903683b46db832cb2ee1ef55cce9e6969a78e7a791f14d1383e3918e2d731c0dc1046e20f15ddb0dadc334e18245856352c187e9068a2d5a3ae70d56620c1b751f6e3d238794dd970bc0e94b47957926ba19e9e618865eadf0e83118ece6c8d22e1ae236075be046d1c40f1304b253cf1cd048f8a68dc1ec918e2d735c0dc1046e23a55b265370f1671ac26bb03c56a70dc569a4a5aea67ea4b13c6d69fda0ef046c2152b2ef385d7e1ba6ec0e2c1f1d960a0cff0045116d0e20e1aacaf60dba8fb71e91c3ca6f10b8ae3784d76078ad4e1b8b53494b5d4eed4922906d07f683bc11b084c72df57d2c50b295365365a46365e9f2066bc5326634316c166d49980092275f93999c58f1c47da0ed0bcd5958a71e266ec52cdc58ebf9e328e159f3009b3ce8ea02c95be162f82b45e4a7937b9ec68de0ed361b08da36dc2f95a1dc91cb119d731574b83e58c25e27156d7164951234ec64446db5f61237f9236dede3723e6cc5725e3f0e2d824da9333c192376d8e667163c711f683b42fb5a4fd246279f6aa06cb0c787e134de8f87c0ebb1878b89b0d676fdb6161bb8938d65f8fc5ebd74dc6a7cb9a7ae7a30a85b83674a3d6346c9de2d88538dcd711f380ed2df6b6f6fcff88d0556195f51458853c94d574ef31cb0c82ce6386f04251555450d64157453494f5503c4914b1bb55cc70dc41e057738a4c334e782b61a834f87691e8a1b4725b522c4a368dc7dbf6b778bb6e03f0ff0f5c0ecbb7e43c52a33568473be1398352ba0c029595386c928bc94eeb3ec03b7d86aecf612376c5c7313c3eaf0bc42a28711a7929ab29de639619059cc70e05756d0e7e6c34aff00d191fdd2ab9f9b27ae3a46d45911b52cb6cbb3e8b80ffe85692474c94df7b57a0fc1fe8282af37422b591c8e8e27c90b1e363a416b770b9f82f39a3376ae81f4967a24a6fbdabc76058f4d8754473d34cf8a68dc1cc7b1d62d23882b8d9bdba4afd8589364c569f16a1c75826c24d23df33a6875042f1b46a9e36dbb7d975f8ab1c6343dd65ddf4cb9bb1339172635f5b2ea62987f2f5401004ce0233e15b7ef3b372fcf588d572ae26ea7f14d2e55f2a41e12c166eda5459777262a085910a151822caca2c83121410b2444608a48441b62f4599575720617d3cad6ed71e0aa39a46f08a850429444608b22162a88452542220a859284108511042222022220150a54144141528831452542022220296f94142ce2697bc068b941b6b7cffc02aeb7d69067363c168485111101111011164c639e6cc17283145bb9bcbd43de9cde5ea1ef434d28b773797a87bd39bcbd43de869a516ee6f2f50f7a0a697a87bd0d35a2dbcde5ea1ef4e6f2f50f7a6cd35295b053cbd43dea79bcbd428ba6a4593d8e61b3858ac501114840444412a54294052140528a2c8280164836d2fa431612f9d7f6959d27a4317d8ca3814999f3861982452885d5f54d839422fa809b975b8d803b166dd2be180a57e8a8b04d13566769347906078a435ed91d44cc6f9c38b8d4341bddb7b5ae08f26d7e006d5c1b316152e0798312c26a1ed7cd43532533deddce2c71171db6ba98e5c8b34f9cb20164c8cb96f14ce2372d6c5745b5f0b9bbc2c2c801770c9f99f0bd276034f92b4815021c5e2f0706c71fb5e1fb847213befb06df2bd8e009e20a4059ca6c974fb59c32be299431ea8c231ca730d545b411b592b383d878b4ff00c0ed0bd2e8ab4873e4daa9e8b108062596310f02bf0e900735c08b17b01d81d6e1b9c361e047b1c9d9a70bd256034f92b483388b13886ae0f8e3b6bd8fdc23909df7d836f95b8d9d627e5cbf83ee7f64cf6b282865635c407b6b1a0385f780768bfb562e53ccdad7d8df2d3683a495ef65766e89ae71218c8f634740bb09b0f692b1e67a10fe32ce3fdd8ff42aff00fe9ff483fc5b45fe358ad619f83de789b11a58abe96929691f235b34e2a98f31b2fe138346f20705378fff0023bfd3d9e5bceda28c2b2b55e5896bf30e2181559b1a7c4698bdb01276b985ad05bb76ecdc45c58defca34a5a3ca8c975d0d4d1cc310cb95de1d0623190e6bda45c35c46cd6b7c1c368e2074c6613a2ba9ceefd1ec7977108ab1b2ba89b8d738264350d049d97dd7045ed6bf0036af2f94336c792f13c6720e778862d94b9cc94b330824d338388e563e207ce206d0768db7bcc7aee2dffb724825929e68e68247c5346e0f63d8e2d735c0dc1046e20f15dd30ac4b0dd3660b160b986582873e51c645062246ab2b9a36f26fb71e91fda6f10bc2e94b4793e4dab82ae867188e5aaff0e83108c8735cd22e18e2366b5b8ee70da3881e1e191f04ac9617be3963707b1ec710e6b81b8208dc474addd653713c5ac7308afc0b16a9c3316a69296ba99da9244fde0f48e9077823610a9597739f12a7d2a689f1cc4b1fa6d5cd195a06b9b88c40035519bd9af1fd937f6ed16b90b875b6ab8e5bf4b18d958a71e266ec5a6cb7d38f133762a2ba295206d44651c65e57d7c2e0a9a6aa86aa8e4920a985e248e58ceab98e1b883c0aaf87441cf175ddf43792f0bc5a92bf15c6d8f968e8b55a2061d5e51eedd7236db777fb1632cb4d48c25a6a1d33e0ad86b790c3f4814515a3988d48f118dbc0fb7f5778f06e07c4d1b6175784642d2ed0e234f253d5c187b1924520b39a4097fe6fc5748d21649c2a972fcf8e65ea69707c430c918f92364a48b122ce69b9b1170767b554a6cdd1e6fd13e7996b69238f1ea5c2f91abaa8da00a966abf9371b711e15c70becd86c3972ebaf1ad3f2b11b4ac6cb63c59c57bcd16e8f65cdf513d7e273fc9b95f0fbbebb1079d5000da58c2766b5b79f9bdb607d172d4dd61e8b4791c8dfc1f74992963846f929c35e46c7105b700f1b5c77ae44d95cd3bd746d29690e1c72960cb794e9fe4cc9f41e0c14ec1aa6a483e724e3bf68076df69dbbaa68b74792e6f9ea310c4ea3e4dcaf4177d7621210d000da58c2766b5b79dcdedb0389752dabff0051e8f4d921190b45a41df8393feec4b8db893bd742d30673a0cd588e1b438052735cbf82c0692803afaf23360d637dc3c116076db69da6c39f596b09a8958592cb2b71dc842d2302b1b2cca8b2230b2859d945ae8302142b0c85cee0a5d4ce03726cd2b8175729690c84582d31c643f6af7190f0638d63987e1cc21afaa9990871dcdb9b5d4cae964dbe0c78548007b5a410abd761faed2e6b6d20de3a57ec7a4d1fe4b7365c25b8748e9217081f5ae98890c87a05edf65bd8bf38690f03f9071eafa0d70f7534ae8f5c0b6b01b8fc45972c7f9375bb8b9648c2d710778582fa95b1b6725ccd920de3a57cc22dbf7aef2edcfc42c4859285518a82b22a1042852888c51495080542950501111011110422144442859282821116c86274aeb377713d082228dd23b55a3fe0b7c92361698e2daee2e512cad8dbc9c3f1774aac8be08888822220222ce28dd23b55bdfd081146e91daad5be491b0b79388edf9ce512c8d89bc9c5bfe7395645f19f2b275ddde9cac9d7777ac11119f2b275ddde9cac9d7777ac11067cac9d7777acb9593aeeef5ac29419f2b275ddde9cac9d7777ac1020d9ca3faeeef4e51fd7777ac11156637b666f2729f0be6b968918e8ddaaedff007ac5598ded99bc9cbbfe6b917d5652b2923746ed577ff2b14414850b24052d69276281bd7d0a0a7e51c3629e2c8acd81c46e526073782ea591b46d8ce6c121c26903e38bce4b238318d3d173bcfb02af9db20e2b956a1b062f48617bc6b31cd21cc78f6386fecdeb1ff24de9be2e6245b7a0da762bb594e58f200dab06b5b4cdd67ed94ee1d0b7b67431a29dbacfdb29dc3a16dc1f13abc1f17a4c4f0f9792ada499b3c4fb5ecf69b8d9c47b153712e71738dc9521a4ee4d0fd199374c9926af3a526318f650830ac76a3c5d46330bc3d91b8b75794d522e2fb89da40de48bae5fa5ac938c652cd33498a4dcfe971191f534d89b0781541c7589d9b03b6ed1f11b1786113b7d975ad1767fa0f91dd92748519accab506d04eedb261cfe0e69de1a09becf27da2e173e3c3bc5adefaae7f85d172ce02cbad615a18ccf5d8432ba3c3d8d63d9aec8e495ac91c3a754eef8d951c6b265468fb34d173dd5aec1e4959352d64601654c40875b66c0eb6f1edb8d857e9fa38c635893318c3aaa1aaa299b1ba099b29bc2079435474edd87a76ae59e7f63723f14e3d82c9413cb0cf1ba3963716b98e162d2378217979e3d572ed5a6ec4292bf3ae2d35237559ca7266edd525cd01ae363d2415c72b482f2bae17719ca2980a54a95b605679f567ff9755fdf3bfcd57014a0b1cfab3ffcbaafef9ffe6ad6198e627866234b5d455d52ca9a695b344e32b9c039a6e2e09b11ec5f3805900a2bb61d36616dac7e3d4f9170d8b38be3d438972b76071162fd4b5ef6f6dedb359719adaa9ebab6a2aeae474b533c8e96591dbdcf71b93de560184f05263216663278b6edd1f45ba418307a49f2c66e83e51c9d5fe0cd0b8173a95c4f9c8f8dafb481b6fb46ddff002f4ab91bf7158c530a4ad8f10c1b118b9ce1f54d7025f16cd8eb71171b46c2083d2078ab2ebfa6e1ff0052b45dfd0dff00a6252f5975f57d8c344bf9a8d2a7d421ff00dc5c908da575cd128fc94e953ea317fee2e4a46d298fb4ac6cac538f133762d365629c7899bb16d15ac8b2b25905da09351e1760d13e7b7e5eac75249032aa82b9cc8a681e6db49b0703d22ff15c55a754afad80d539b8c61e2fff00ee62fd76ac658ed657e86d39e70f9367aaca787d3b29e9dba92cf26b12e98901c06ddc3774ee5e3746b372ba39d299ff00f8d67dd2af97f847d416696b16603b0454ff00f94d5f77f076a5a1c4f2ce9069719aa34986cb4b0b6a67d60de4e3b4bac6e776cbae7ad61b6b7dbc2e8c3479266fa8a8c4714a8f9332bd05df5b8848754586d2c613b35ba4fcdedb05634a5a418b1da7832e65583e4dc9f4166d3d3306a9a823f49271dfb403da76ee9d29690599821832fe58a7f937285059b4d4ac1aa6723f4927c76807b4eddd5f45ba3d7e6c96a313c5ea3e4dcad87ddf5b5ef3aa081b4b184fcee93c2fd360b7ff00db267fea30d1768f25cdd34f896293fc9b95a82efaec4243aa2c3696309f9d6de7737b6c0d9d29e9062c7a0a7cbb95a0f93727e1f66d3d3306a9a823f49271dfb403da76ee9d29690999822832fe5983e4dc9f41665352306a99edba49076ed00f69dbbb9c10ac96ddd4ff001825ae762c8024d80b93d0bb7e55cb78668b7038337e7aa76cf8f4c35b08c15c7c26bb84920e046c3b7c9f6b8803572d126dab2ce56c1f46b97a2cd9a42a565563150d270ac0a400926de5cad3bb7f1d8df6b88038bd6cdce6b279f928a1e564749c9c4dd5632e49d568e005ec0742fad9b731e279ab1ca8c5b1aa833d5cc7b1b1b783183834747c4ed2be29098cd774ac2cb1b2cc850b48c16ea68f5dc16bb2b94046b8ba523d1e05814b5f3450d3c4e92591c1ac6305cb89dc005efb18d0ce67c3f0892be5c3d8e8e366bbd914ad7c8c1d25a37fc2eae681eaa1833c615af13a52e7398035bac412d203add0379e85fa0eb98dc1315931ac4aae1a4c3e08de6690cc499c9dc354f1dd61ecd9bd79f3cecba7591f862ba979190ec5d2f42795eab14ae38f55557c9797f09789ea31079d51acc20ea309de775cf0f69202b396723459bf13c471ac526184e50a391f2d555b8eaf837279361e9b1009e1ed2405e7b4a7a47198453e0396a9fe4dca187d994b48c1aa6623f4920fb403baf73b4ecdeee5d467c764c4f4df80b6beaab30cc00c9581c44353349aa1db2c1ee6817bdb86fb710b8266dc7a6c5ebaa6aeaa4e5279dee91eee924dcaf2e2aa4b6f2ab4d3b9fbd5c7f8e44b9309e53ca6b34d8a3a4864f0a461d6e365a5dbd405d74c375e9cfcc7ac83203f31eb651d3f28e1b17bcc99a3fc5f35543a0c1a8ccce60d691ee706b18386b38fddbd66e522c9b73e73201f31eb5934e37b1eba2e7ad1ce37941d10c668c471cd7e4e68de1f1bedc2e38fb0d973cab8793714c7294b34c35a9ba8f51ad4dd47f7ad0a0ade996fd6a6ea3fbd35a9ba8fef5a14150db7eb53751fde9ad4fd47f7aae8ae8db7eb53751fde9ad4dd47f7ad05421b6fd6a7ea3fbd35a9fa8fef5a11349b6fd6a7ea3d35a9ba8fef5a1414d0b1ad4dd47f7a82ea6ea3fbd6844d26dbf5a9ba8fef5124c3535211aade3d25685086c4444045b20687cad6bb7158c80364701b81b20c5111015a7bb92a66066cd7172555566a3cc41d8845644440445be084386bc9b231f6a088a0748dd6b868e92b3e6aeebb3bd6b9e5321b0d8c1b82d68bd364b118ad77037e85822220a54052808888a2229082c3256bd9a935f66e726ad3fac7f72ae89a5dac8653fac7f7290ca727ce3fb957562923d778508b1052c2f22cf7f72f4184d242d7b4973bb97a4d1ae42afce1881a5c39b1b1b1b3949a794d99137a4fec0bdd668d145665dc27e5282b29311a169d57cb4c4f80776d1d1edbae596737a7498ba4687a5a1c5721458352cd18aaa7a974b514e5fa8e9d84dc1f6f0ffc3b557d3f4715164ac228ea9af73f9c3df1c962e6c6dd53e06b5bda3ff0fb17e7e96ba4a171d571691c41b2f5591749d494d04d96f3ab0d7656adf05fad72fa471f9ede36bed206d1bc7107970bbdc6b6e5b8a3e08dee747773b85f82f82f25cf2e71b92ba0e96f21d664cc4619a29857e015c394a0c463b164ad22e1ae236075be046d1c40e7abd18eacdc73cbd671b759cbec61d879988b05f32945de1752d13d0516239b708a4c43579acd50c6480ec0e1d1f1361f14cae9719b79dfdcecfcdc4bc8bf933b03f54eadfb772f895d426071d96b2fde2c99d3d7c984cd491f322e3073334fe2c4207957dd6ddb372fc87a47a2a4a1cc589d350b83a9a1a891911bdeed0e206d5c70cf75bb1f5f45ba42a28b0b764ecf60d4e57a83686671f0e81fc1cd3bc341dbb3c9ecb85bb39e1b8ee8cf1da59a96b1efa290f2d87e2501f0266ef17b6cd6b6f1b88da2e0ae3b51b1e6cba8e8bf485431e12fc999f986b329551d58e53b5f87bf83da778683b76793bc6cb85bcb1d771997e3da57b70ed356092d5e1021a1cfb4516b54525f5595ec1b359b7e3ede1b8ecb15f9faba29a9eae6a7aa8a486789e59247234b5cc70362083b885ee73d652c7745d9a28eb686b1efa47384f8662d4e46aca2d71b46cd6b1daddc46eb82bdcd5d261ba73c15f5f86b29f0ed2251457a9a6bea4788b1a2dacdf6fb786e3b2c44978f7f0bdb8329016eaaa69a8eaa6a6ab86482a21798e48a46eab98e06c411c085ad75610b20100528a2b34d0ebb9686ef5f5f0a602f6dd66ac5ea2c25f301aad26fec5b2bf049a9b64b13d8edf673483f6afd01f83fe1d4661c52bc451cb8853318200e6eb16037bb80e9d83fe4af4da49823c6720e393e2cc8a47d016ba8eaf92d4739d700b47b0eef8fb171bfc9aba6f4fc795307264aea9a6e1ff52f45ff00d0dfb225cf71663448eb2e89a6e1ff00533461fd0c7ee896edee32c344c3f255a53fa8c5ff00b8b931de575ad138fc95694fea317fee2e4e46d2ae3ed2b1b2df00f133762d5656201e2a5ec5a156ca6cb2b29b2230b2faf9470eabc5333e15478753c95153254c65b1c62e480e049f6000124f05a703c1ebf1dc5a9b0dc2699f535b50ed58e3671e924f0037927600bb1e2b8861ba19c1a6c172f4d0d7679ab8f56bf1168bb689a76f26cbf1e81fda7700b395d753d591e5bf08f7b25d2fe32637b5e1ac81a754dec444db8ed5f434403f265a54fe8d8fee957299a492695f2ccf7492bdc5cf7bc92e7126e4927792bac68847e4cf4a7fd1b1fdd2ace5358e89eb9fe48a0c1f12cd1474d99b12f9330825ce9ea2c6f602faa0f02edd7e0bd36947484dcc514180e5ca7f93328d07834d48c1abcb11ba4907da01e9b9b9ddcf88dab1b2debbd8c0851aa49006d2762d81a49000249d8001b4aed996700c334538253e6bceb4eda9ccb50dd6c270671db11f5b27411feefb5c762e5a4d30cad97b0cd15e074f9bb3bd3b6a3314e35b08c19c76b0f09641c08ff77dae3b39566acc389e69c6aa315c6ea5d515731dfb9ac6f06347068e03f6acb3463f89668c6ea316c6aa0cf5731da77358de0c68e0d1c07ed5f31b1eb1d8a49f6faaae41589695f629f0f749b82d93616f636e5a56b669f05410ad5440584ec55c34b9daa05c9551806971000b92bec60385d4e278b52e1986d34b5988543f5238a2de4fec03792770daa306c2ab714c4e9f0cc1e99f578954bb5238d836dff601bc93b00da5760c5310c3742782cb846092c35fa40ad880aeaf0359940c3b75197e3d038f94ee01672cbe4247d3adc5709d0ce14fc2b0c962afcef551815754df09942d3b751b7e3d0379de76582f8b907009b390aac6b1fab968b2cd1974b5b884f211ae46d73584ef7749e17e2480bcb68c7214b9be6accc199ab5f4395a89ce9abf1199e43a675eee635c77b89deedb6bf12405af4aba4639a390c1700a7f93328e1f6651d1306af296dd2483a7881c2f73724958e3dea35c9774a9a478733360c1303a7750655a1b369691835794b6e91e3a7880775ee7695e0696961948b46e5f3e0f09fb5741d1ce13062d98b0ca1a87ea455350c89eee20136365bd4c67493b7c0f9263d5f36ebf45d7cdada386226f1b97edf8f0dc1db50ec15b8261830e6bc53720e8bc6bae2faf7e8e37dfc6ebf2c693f06a7c1b33629414ced6869e7746c24dcdb803ed1bbe0b18ff26eb571730a80cd61c9b48e9bad2df2958aa167955d778e4fbd8286f28dbafd65a0fc39b5fa3dafa52d969e39ea45e76f83cab6c06a83c6d623e3dab82e88722371aa7a8cc799ea3e4dc9f87ddd5154f3aa6723f471fc76123b06dddf5f3b69564c7aa23a3c222f93b2f51d994746cf0760d81cfb71f670edb95c339caea3a63d4750d320a5c13470fc0aaea993d6cd5827a7835f58d3c63ee1bc7f68d97e54c540e50d97dec5b1b7d4dcbde493bc92befe51d15e279ab0238f5762d85e03833e431415388c9aa2775c8f046cd97045c9db636055c2709da65df8e54edea17aad21e48c5f22634dc3b196c2fe563e569ea6076b453b3acd3f783b47c415e5577977371cd0885111054292a10142942821111010a2208444444150b258a022220dd4be90c584de75fda5674be90c584de75fda50f8c11110159a8f310762acacd479883b105644441be9e20e05f21b31bbfdab19e6321b0d8c1b82d8cf427fbcab228a428528894444121111144444052811014850a504abb40e01e1525b227969ba8b1fa2740f9930aa2a5c6b04c62a850c58ac4c6b2acee639b71671e00eb766cf6aec999658a2d18e32cc2a5a6c59cd8c4731a12d708c6f2f20124d86dffe17e29a1c45d15ac6cbd764cd21e27943198b11c32406de0cd03cf8b9d9c5aefd87782bcf97f1ddee3acc9f2b305535f2b8b0ec2bcb4d21738ed5daf48994f0cce39725cf5a388c9a66dce2b843478ca37ef739ad1f37890365bc21b2e070edfb7a575c2ee3393a9e8af48d4b8661d3652ced07ca3932b8eabd8e05cfa2713e723e36bed206d0768db707e5695747755922be1a8a698623976bc72987e231d9cd91a45c35c46c0eb7c1c368e207825d47455a44a5c2e826ca79d61388e4caef05f1b8173a8dc4f9c8f8817da40da0ed1b6e0acb8ddc4977eb99c2ed575d7a1c2312753bdae6b8b4837041b597dad2a68eea724d6c1554738c472dd78d7a0c46321cd7b48b86b88d81d6f8386d1c40f0cc90b772bd65370ee3f40e5ed3a63f87cd4adc4a66623431f832c5231a247b37797d3ed3f15f334af9469a4c19b9c724c86bb2bd4f852b1bb5f42fe2d78de1b7d9b7c9e3b2c5716150eb6f5ec7465a43c472362ef96168acc2aa7c0aec3e4376543371dfb0380dc7e0762e7c35de2d72dbc648759cb10babe93b2061ff0023b33b68fde6af29d51d69a068f0f0e7f16386f0d0766df27b2c57295d259674cd8ea9a30d20d143853f26e7d8cd6e50abf058f76d7e1efbec7b0ef0d076ecf2778d9706d51e4caac83a73ca546dac6d551d4d6c151455713bcf40e7db6db71b5c1e07b0ae42ef21dd87ee5fa3b397e747431f51a1fd70b19757afab3b728d33fe76335fd7dff73578d017b4d33fe75f357d7dff00705e316b1f217d14a2c80550015fa29b51c15202eb369b6e52aba3e4ccdb5b81e2304f8754be097583091b41048b820ec21741fc23333573735bf06754bf98430c52b611b1bace0769e93dbb9703a199c2aa0dbfa467eb05d3ff00097908d2b55b6fb39a53fea95cee3fda35be9cceb66e51c5752d34465f93746361bb06fd912e4f134bddb5775d25501abca9a376017d5c22dfeec4ae5d584edf0f457016e8b74a008f2a862ffdc5c95f1169375fa8747d907148747f9a29df0c71498d533194ad91faa5d60eda7a01b8b2e0599304a9c2310a8a3ae81d054c2e2d7c6e1b41ff009e2a6394b6963cc596f8078a97b160f6d8adb00f152f62e88af657f02c1ebf1ec5a9f0dc2699f535b50ed58e367da49e006f24ec0b2c0707afc7b16a6c3309a67d4d6d43b5638dbf6927801bc93b975fc6714c3b43d834d80e599a2acce954c0dc471368b8a4076f271df8fb3e276d80cdcb5d4f4d2318c4b0ed0e60b360597268ab73bd5c61b88624d176d1b4ede4e3bf1e81fda3c02e252bdf2c8f9257b9f23dc5ce7b8dcb89da49277959caf7cb23e495ee7c8f71739ce372e2769249de56164934315d67443f9b4d297f46c7f74ab95323748f6b23639ef710d6b5a2e493b801c4aed4dc362d17e8af1ca5cc33ff00d62cd14e228b0d8ec5d4f180e01ef3c3ca37f6d80bed2a677ad11c408da81a5c406824936000b925661a5ce01a0b9c4d8002e49e80176acbb8161ba26c160cd19c60654e69a869761583b8f993eb64e823fdddc3c2dd6e5a18e5cc070cd1460b4f9a739c0da9ccf3b75f0ac19c76c4784927411feeee1776ee5798719c4f35635538b6335266aa98f84f3b1ad1c1ad1c1a380fdaa71fc6311cd18d54e2d8d54ba7aa98ddef3b034706b47068e017cf91fac35582cc1f6a49f6fa31e6edf5ad56e8a99ae78bc8c541cb75249aaf0a8ed1a20c9f479831d8e1ad7de9a3619a46b0d8bc0b6cbf0da42ea98e648cb78d52d5e194d83c386d6369dd3d354c0ebeedc1fd3bc6fbf6dd784d11d1bb2b613fbb4cc950fa0c35ad2da486de32b0b86cb34fcd3c3a6d7d805cb33698f9ce1959060f8553e1d3d5b4b26a90fd77969e0360b1f6ed5c2eede9b711c62898c79b48c0be148590021843a43c7a17d3c52a048e2be2bf695de315d4ff00062fcf061f7dfcdaa3f517cfd1de498b38e398de2d98b101479770a95f3e2555249e1beee71d5077dcd8ddddd7242fa3f830fe77f0ff00ab547ea2b9913f337a5cfe721fd772ce5756ebfe88f39a55d221cd5cdf06c0a9fe4cca587d994742c1abaf6dd2483a7a070bf12495ce8859b86d2b13bb6ae92493519a98ddaaebeeb2ef7a39cbb439372fc19db3e07471b887617861d92d4bf7b5e41dc3880786d3c01f9190f27e1592f00873de91a12587c2c270670f195726f6bded3c37100ec03c23c01f059ff38e2d9c3303f15c626d67b85a18597e4e9d9c18c1f79de4ed2b17fbf51a9d3b25569e31b9a09b92a7c3a095f70c99b192f8da78024d8dba48f82e338fe2cfad9a496691cf91e4b9ce71b924ed24af81cedd6deabcb339e77ab8e12785c984eed6715d1f455a3a871da5a8ccd9baa0e1b9330fbba7a8712d75491fa38f8efd848db7d836eedba2ad1d53e37435199f384e70dc9f4075a6a8712d35247e8e3e245f61236df60dbba9e94f48a3395453d05040ec3b2ce1fe05061f18d56b40160f781b35adb86e68d836dc95b6ff0058cebed6ad2b691a6ce1514f876154ff0026655c3acca0c3e31aa001b03de06cd6b6e1f37b6e4f826cce1c56c3cdfa1ea1a29dce0d6b642e26c001724f42d4924d43d6b32bdee005c926c00da495fa5731648871cd12642c1f3563d87653c6a82191cca5c4246eacb11206b39bac0875b54fb0920fb3e0e5ccbf82e88304a5cd99d29c54e69a86ebe1382bcdcc2784b20e0474fcddc2eeddc7f35e61aacd58e54e2f8e544b535b39f09c7635a3835a3834701fb6eb17fbdebe2f9ebdc69cf30e0957499572c65caf38ad265da334efc4784ef21a0869e2d019c366db0bd97272ac934dd1221e6dd0f5d319c6699bdaaa8567f16e87a1e6dd0f5ada695941566f4dd0f5079b743d434ac8ad35b4f21d56eb35c7712abc8c746e2d70da88c111150444410514a84414152a0a0844441ba97d218b09bcebfb4ace97d218b09bcebfb4a1f18222202b351e620ec55959a8f3107620ac88882cb3d09fef2acacb3d09fef2ac8b52a54052882045210111114444412888824295014a0295014a2b2692165ae7a56214a0f4da3fce98b646cc3162b834b670f06781e4f27511df6b1e3ee3bc1da1747cfd92b09ce797e6cf9a3588f223c2c570568f194726f739ad1f3779206cb6d6ecb81c4c2f4b9073962d91b30c38b6092eabc783342f27939e3bed63c74741de0ed0b1963f67ad4bf2bcdac82ed59f7266159db00973e68da12180eb62d82b078ca4937b9ec68e1bc903611b471038b0ddb15c72e49669d3b455a44a6c228a7cab9ca0388e4caff06589c0b9d48e27ce47c6d7da40da0ed1b6e0d0d2a68eaa72555c1574730c472d57d9f4188c6439af69170c791b03adc77386d1c40f00174fd15e9121c16927cb19be038964caff0002681e0b9d4a49f391f102fb481b6fb46ddf9b3577167eab99a901764c7740598e4c41d3e4d752633804ed135255f3a631ce8ddb4075f791d2361f66e144680b487fc534bfe3a2ff0034ff00931fd9c6bcf68c33f62190f177cd03055e1754352bb0f90f8ba866ee3b0380bd8fc0dc2f5ba56d1ad3c18353e77c930cefcad5f18a87d33e32d928b5bd876f277e3c3da2c57d1cb9a298324473e65d2c8820c36888e6f87452b657d6cbbc3766c23e8f1e366837f99169d3317eee1f8c54319260d2339bbf05bf88e6fd51c35edf3adb775b5762c6f77782fcedc8dfe6dfd87ee5fa3739fe743433f51a1fd70b9de9c32b60f8062585e2596f948f09c768b9fc34d236c69c1b7823d9e10b0e1bb759744ce5f9d0d0cfd4687f5c26577abfeac9a729d33fe75f357d79ff00705e357b3d337e75f357d79ff705e3805bc7c897d005900a005985402901005980a0d9483f1b83f9c67eb05d47f0981f958acfaa53fea95cc28c7e3707f38cfd60ba8fe131f9d8abfaa53fea959bf945f8e654b60e0bf4466f9e3872ee8edcfb11f2503b7b235f9ce33aa576ad2bd518328e8d8836be117fb2259ce77163b8e28fa2cd58750d5e1d8851d3c4c0d74923e5d57d3db6eee047c17e7fd39637438e675aba9c35ed929d91b21128dd2168dae1ecdb6bfb178c7e2ee732c4dd7caabaa329372a6386aadaa33794afe5fc2eab19c421c370e8b95acaa788a265c0bb8f493b87b57cf3b4af73a141f94ecbdf5b1faae5bb7511ecb1ac570cd1060d3e0196268eb33954b03711c51a2e2941dbc9c7d04701c379db6038a48e7c9239f239cf7b89739ce372e276924f12bd269207e50b337f49547eb95e72ca6335d8c2cb28e37cb2323898e7c8f21ad6b45cb89d8001c4ad9144f9a5647131d248f706b58c172e2760000de576ac230bc3b43d83c38e6628a2adceb551eb61f869376d183fa47db8f49f8378956e5a34c306c2f0cd0fe0d063b99608ab73a5530bb0fc31c6e2907ac7f41e93f06edb95c8b1cc5b10cc38c4f88e293c9555f52fbb9e46d27706b40dc06e002cf1ac4f10cc18c4f886273c9575f52fbb9e45cb8ee0d006e1c000bad6038361ba24c160cc79ae08eaf36d4b75b0cc25c7d1ff00da49d0474f0dc36dc8cfe3ddf46197f04c3b44b82c199b36c0caacd750d2ec2f0971f31fed24e823a786e1e16ee538f62f88e66c66a315c6aa5d3d54c6ef7bb6003835a3834700a331e3588662c62a314c62a1d515939bb9c76003835a3834700aa545c6ab06c6daf60ac9aeefa35c8fd6f0582cc0b022c1661ab17ad234bd756d1de4ac3709c10677d2083160919068681c3c657c9bdbe0f16f40e3bcf8236e790325e1983e0633b690da63c199634387b878caf7ef6f8277b7a071de7c1dfe374879d712cef8e1aec4488a9e3bb2969187c5d3b3a0749dd73c7b2c166de5d43c6ecfb9f714ce98d1adaf708a9e3bb2969233e2e9d9d03a4eeb9e3ec160bcc4956e237aac42c4ad4921b24797ad256c216242a8ea7f8317e77b0ffab547ea2b9917f337a5bfe721fd772a9f831fe77b0ffab547ea2b9917f339a5bf7e1fd772e797bff8ff00dac719771bee5db720643a2c9f95dda42d20d14d2d343aafc3f0b119265793e03e516b34136b076ce27805f2b43782e074b82e3f9eb3241257d3600e608281a06acb33adaae75f65812dd9bb89bd805960ba6dc6ce6daeadcccc6e2781624391abc288bc4c8b701103c403c7cae3b6c45cadbd4274f079f737e2b9db1f9b15c6a5d690f83142d2793823bec63074749de4ed2be1d5fe8fdd5d9731684ab7189e2c5b4672d3e2d96eb9bcac1af50d8df074c675b7db7748b58ed173f36a340ba417ea6ae134bb05bd363ff35a99e29aae48ba5e8b34770633493e68ce139c3b26d078534ce25aeaa20f9b8f8dafb091b6fb06ddde832f684aaf059e5c6349f253e1596e85bcacc23a86c8fa837d918d5dd7ef37b0da6e3c86953489539d6ae0a5a48061d96e83c0a0c3a301ad6340b07b80d85d6f8346c1c4972e5d626b5eb1d2ae90ea33a55c1474300c372cd0781418746035ac68160f781b35adc37346c1c49f0056451ad2f735ac05ce7100002e493b800b72493a676c5ad73dc1ac69739c40000b924ee002eeb96f00c3343b81c19af3ad3b2ab36d434bb08c15c7cc1f5b2f411feeee1e16e9cb981e17a1bc0a9f34e72a78eaf385534bb09c1de7d1ff00dacbd0474f0dc3c2ddc6f33e3f89667c6aa716c6ea9d535b39bb9eed81a3835a3e6b4700163f3ea78bf899a3306259a31ca9c5b1ba9754d6d41bb9c76068e0d68e0d1c02f9054a15d3c4ac510a8444150b22b154422144462acc6f13344729f0be6b9572a10652b1d1bb55c36ac15a8ded999c9cbbfe6b957918e8ddaae1b520c51110142950510444418a295083752fa43161379d7f6959d2fa43161379d7f6943e3044440566a3cc41d8ab2b351e620ec415911105967a13fde5595967a13fde55916a42950a51052a14a0222228a42852101114a09444412a4285211592220504852814d907a3c839c716c919822c5b049b5641e0cb0bfcdcf1df6b1e3a3a0ef07685d2b3e64fc2b3ce5f9b3e68e212dd5f0b17c15a3c652c9bdcf6346f1bc903611b471038a05e8b21e6fc5b246618716c126d595be0cb0bafc9cf1df6b1e3a3dbbc1da1672c7ecf5a97e579e1b40b71592ed59e7286139ef2fcf9eb4710163d9e162f82340e529dfbcbd8d1bc1da6c3611b46db85c546dda3726396d2c5b82beb608c4705655451b773239ded68ec00d96c18ae23fc635dfe25ff00e6a900b20151be7aba9a90de73533cfabe4f2b2b9f6ecb9d8b5703d88029b6c3d88aebda7bff00b39a37feafb7ee62f5d9c87e53f435f51a2fd70bc8e9effece68dffabedfb98bd7e72fce7e86bea345fae170f93ffd6dcab4cc3f2ad9abebcffb82f1a02f69a641f955cd5f5e7fdc178f0174c7c8cd6202c8053aaa4054005900802c820db49e9707f38cfd60ba87e12df9d7abfaa53fea95cc693d2e0fe719fac174ff00c2547e55eafea94ffaa562fe517e39600bae699c919374676fe27fd912e4a02eb5a671ff00537467fd0ffb224bec58e521c537a00b201686365ee74283f29b97beb63f55cbc480bdce85bf39997beb63f55cb397948f91a471f941ccbfd233feb95e7e18649a56450b1f24af706b18c177389d80003792bd1e9185f483997fa467fd72ba06558b0ad1ae48c3f38d642cc4731e2cc77c950b9a792a6037bdc7a6c45f8edb0e2537a83761386e1da1ec1a2c6b1f8a2acced571975061ee376d1b4ece51f6e3d27fb23895c8b17c46bf1fc5e7afc46796aebea9f773c8bb9c4ec0001c370007605b316c4710c7f179abb119a5acc42a9e0b9c45dcf71d80003e0001d8175ac1709c3b44983c398333431d5e6fa961761b8638dc530f5925b71f6f0dc36dc89f8f77d1860783e1ba24c1e0cc39a618eaf375430bb0dc29c6e29bfda49d0474f0dc36dc8e4b98319c433062f5189e2f50ea8ac9dd77bcee038340e0d1b80e0b3c7b17afc7f16a8c4f16a87d4d64eed67bddf6003801b801b97ceb2b26bba35d958a86f8c1d8b580acd4b7c31eead0ac4582ea590f25e1982e08cceba41063c2596750e1ce1e32b9fbdb769f9bd038ef366efdd9172761b8160adce9a40616618c21d41873878cad7ef692d3f3788077ef3b37f86cff9c713ceb8e3b10c4dc191b41653d330f8ba76755bede93c7b2c0637cba831d20e73c4f3b638eafc49c23859765352b0f8ba76754749dd73c7b2c1796216c216242dc9af11ad410b32162aa30216256c2160420ea5f8327e7770ff00ab547ea2b9917f339a5afe721fd772a9f832fe7770ff00ab547ea2b9917f33ba5afe721fd772e797bff8ff00db515b247f07bd22fd6a9bf5a35c80ef5d7f247f07bd22fd6a9bf5a35c84ad63ed66b6c35b574cc2ca6aaa98584df56399cc17e9b02ad55e298878bb6215be4fff0092ff00f35f3cee5b6af7c7eeada31a8adaba86065455d4ccc06e1b2cce78bf4d8955964518c748f6b236b9ef710d6b5a2e5c4ec000e25544c0e3ac18c8b947b880d005c9276000712bbae0785617a1cc069f32e6ea486ab3955335b0bc2091f8b0f5b27411d3c370db7231c0706c2b433824199736c11d6e75aa617e178438dc52f0e564e82389e1b86db91c633263988e64c6aab15c6aa5f535d50ed67c8ed800e0d68e0d1b801b973fcffc6bc6eccb99710cc98cd4e2b8d49ce6b6a0ddef76e03835a38346e017cbe5c7aa62d2542e924676dc6a07a9628e703d4b1692b15746dbcd40f52c58f381ea58b5158a68db79a81ea98b13503d4b16a5894d1b6fe703d4b144d135cde561f2788e85a1650c8e89d76fc474a691aca856a689af6f2b0eee2de85555882b11bdb3379394edf9ae55d0a09923746ed577ff002b1566391b2b793977fcd72d32c6e8ddaaeffe50608511042222220a8525420dd4be90c584de75fda5674be90c584de75fda50f8c11110159a8f310762acacd479883b105644441659e84ff79565659e84ff00795708b5288888052a029451111014a85280a42852104a04408256416216f822321b9d8c1bca552088c87a1a3795b9d51abe0c206a0e9e2b5cd2823938f6463ed5a828ab3cea4e86f720aa93a1bdcaba909a36b3ce5fd0dee522aa4e86f72aea429a36f4f9273a62f9371e8715c1a56b256f83244ebea4ccbed63c711f683b42e9b9d32c61b9f32fcd9e3471086cccf0b17c100bc94efdee7b00de379b0d846d1b6e170d5e8f22e67c5b276608317c0e6e4e76782f8ddb593338b1e3883de0ed1b5672c7ecf5657c5154fe1abdcb215527437b976dc669f44b9b6ac6375389e29976b6ada1f55414f4c5ec64bf3883a846ddfb361df60495f35d95f43eddf9d71c1fff00c47ffeb59e73f4baae4c2a64e86f72b90d36233d1beae1a1a9929197d79d903dd1b7a6ee02c174e872de870cd187676c6882e0087519683b789e4f60f6aea799b19cf982e95306c07296136ca0d14f1c1143481d4f24240e51ce92de0eaf85c46e076df6cb9fea2c8f09834d8769832550e03ca4587e76c1294c541aeeb435d0b5a3c1f61b017e20ed171703ef67c8e7a2d2c688e96a63e4e68e9692395877b5c24008ef0b93e96e2a4c074b58d8cb327358e96a9b24469ceaf212eab5ce0db6eb3c9ecdcbae640cc384e96315cbb2e3d2b2873be053c73452b45995f0b5c1ce6db83b79206e3b46c240cd9aefe2cfd392698aa1edd2a66968d5b0ae7f0f605e4454bfa1bdcbd569998e6e95b348734b4f3e71da2db0b5b62bc705d27912ad0a87f437b96cd56cedbb7648378e95502dac7169041b10a86ad8d88da9656806d436e36483874ad7abb6c46d504d20fc6e0fe719fac174ff00c253f3ad57f54a7fd52b9a5237f1b83f9c67eb05d37f0936fe556acfff00ea53fea959bf94572d01759d337fd8ed1a7f43fec897280176c8a8e974ada3fc2687099b90cd5972979114323806d5c56682e61e9f04761d8761054cbab291c5405900b654412d3544b05446f8a789c59246f6eab98e1b082381582d800bb5e4fa8a4d1fe8aa8337d1e154d88e358855be2151520965235a5c00d9b89d5e1624bb7ecb2e2c1abdce43d2063194e82ae8e959495b874a794751d6465f1eb748b1046e17e0b194dc58fbda5fa5a1c5b2c659ce94f87b70cc4319748daba767932385cf2a3b6dbf8870bf4ac74983f249a32fabcff731791ceb9c317ce588c5558c49186c2dd4829e16ea450b78868dbbec369dbb02f63a4b1f925d19fd5e7fb98a6b5a18680e0a682b3336352d2c3515983e18eaba4e5412d64803b6dba765afc2e6cb9ce398b57e3d8a4f8962d52fa9ac9ceb3e477d800e006e006e5d2b4203fe88d207f423fee7ae5207823b159f951aec965b2c81ab48c5ad5f7b2ec51cb9bb038a5635f1beb206b98e170e0646dc11d0be3b5bb17dccb3ff006d300faf53ff00e6b52abd07e103895656e93313a6aaa87c94f4459153c47c989a58d71007b49da7b3a173421740d3a7e75f30ff003acffca62f044298f912b510b1216c216242d23590b121665625118158959958954751fc19bf3bb87fd5aa3f517dcd12e0d5b987471a4dc270b8c4b5b57510c5135ced5172f76d2780036fc17c5fc199ae3a5ba12d6921b4b504d86e1aa06d5f7b36e69c3f45b8357e52c91526a31fab90bf15c59a7cd3cdfc08fa1c0123e8fb5c7672cbf2d4ff00a6a78f99a41afc1320e49abd1ee032b712c52ae464b8cd7dfc063da4111b0748d503d837dc9d9c867c36ba0a46554f4557152c9e44cf81cd63afd0e22c57b2d0ad161d89e95300a7c6c324a592773b525dad9240d7398d75f7ddc06fdff15dcf2ae319eb1dd25e3981e73c2af945cca864f1cf481b04510bf265b25bc2b8b713bc9d96d96de1d26b6fc9c56eacfd1fbabacc996f43a247019db1a001205a8c916bf4f27b7b56e972c688dfa97ce98deed96a23ff00f5ad73869c6638df2c8c8e2639f23c86b5ad172e2760000de7d8bb960583e19a18c120cc79ae08ab33ad530bb0bc25c6e2906ee564b6e2389e1b86db919e0f5da36d1e8a8c6f2d5557663cc0c6ea50c55b018e381e77c87c168d9f13c05af75c6f3262b88e3f8c54e298cd4c9555d50ed69247fd800e0d1b801b027e7d7c4f1ab3163588e62c66ab14c66a5f555d50ed692477d800e0d03600372f96566562574658958959ac4aa20ac166b128882b12b250504282a5415462a14a828338a4744ebb7e23a56c9a30f6f2b0eee2de85a165148e89f76fc474a88d685599636c8de561ddc5bd0ab2a21598e412b793977fcd72ac8832923746ed577ff2b1562391b2379397fb2e5aa48dd1bb55ddfd2835a21444428592c506ea5f4862c26f3afed2b3a5f4862c26f3afed287c6088880acd479883b156566a3cc41d882b22220b2cf427fbcab85619e84ff795708b5288888908888a22220052811014a859250521429456da78f947904d80da56c9a5046a47b231f6a51ef93dd5a1454ac82c42c8220b20b6c31b256101d69385f71581696921c2c5150b20b10b2083389b772f41845019ded6b5b727805f0a036705ed329d5b692ba9e7b026291af00ee3620fec58cab58bad61da0daa928a06d762f87d16273b35e3a292e5dd8483b0f602b9666acb15582e2353455ac6c551038b1ed2ee3fb4715faae1ccd94f1661c5e5c5a969f940c7c90cfb2688b78378f0e17f62e6b9cb4d75b0e2952708a0c2e4a4d6b44eaaa72e790389b386f5c31cb2dba591f9c66a52d71f0e3ffc4bd6619a45ce98660c30aa0ccb550d0b5ba8c607b4ba36f435e41734761d9c17af9f4f9991ae21b8465c3db46eff005ad434ff00997f8a32dff8277fad74fed7d8c74e52619247b9ce91af7924b8975c927892b7520aaa3aa86a692730d442f12472c6f2d731c36820f02bb4e0d9cb05d2cd3bf2d677a5c3f08c52475f0bc4e8e2e4dac908b6a381277f45eceddb0d8ae4f9c72be299431e9f09c6a0e4aa23dad70dac959c1ec3c5a7ecdc76ab32df5475fa77e1da6ac15947893e9e834854715a9eabc98f106376eabbdbece1bc6cb81c4f14c36b308c4aa28313a7929ab29de639629058b4ff00cee3b88dab451d4cd475515452caf86789c1ec918ed5735c371046e2bb9d25461ba6dc123a2c42482833fd1456a7a9235595ec1b755d6e3f76f1b2e14fc3fc3d70a0b30ad62d865660f895461f89d3c94d5b4efd49629058b4fed1c41dc42aa16d1b18e2d208362adb489db716120dfed54c2cc28ab8d81fb082011c415dab06c430fd2be0b065fcd52c54b9b2999ab86e2a47a47fb393a49e8e3bc6db83c31a56f89ee6bdae638b5c082083620f020acd9b57d2cc380e2197b179f0dc5a9dd056426ce61da08e0e07883c0ad584d5d6e1388d3d7e1b3c94d5903b5e3963362d3fe5d23715d932f62941a54c160c07354aca7cd14cdd5c3b1470f3e3d5c9d24f471de36defe46af22e2f435b53495387d472f4e6d26a46e7b6dc08206d07815265f2ae9ea6b68e834c783bebb0f8e0a1cf94715ea2981d5657b06cd66fb7dbc371d962b8ccf4f2d3544905444f8a789c58f8dedd5731c37823815e9e28eb304c420ada09a4a6aca776bc72b0d8b4ff00cef1c5745afa3c3f4c1853eae86382833dd1c779a0075595ec1c47b7dbc371d96226f8ff00838900ac403c54bd8a2a29a6a5a8960a989f0cf138b248dedd5731c37823815b201e2a5ec5b45768da1753d250fc9368d3eaf37dcc5cc1a3685d474923f24fa35fabcdf731672f62a34223fe88cfff00d08ffb9eb95b47823b1757d098ff00a273f7f423fee7ae5607823b127b46165935ab20d5b1adb05a1adc2c17d7cb3ff6d300faf53ffe6b57c8917b8d17e54aecc39b292b21d5a7c370c963aaabac976471b58ed6d5bf58dbe036952dd41574e7f9d6cc3fceb3ff00298bc190bd7695316a3c7b4818d625864865a39e61c9496b6b86b1adb8f6120dbd8bc914c7c895ac85890b615815a1ac8589599589446b2bea657cbd89668c6e9f0ac1a9ccf5731ec6b1bc5ee3c1a389fdab3caf97b12cd18d418560b4e67ab94f6358de2f71e0d1d3fb5751cd39830dd17e095194b24d4367c7e61ab8b632df29aee31467811b47d1f789225cbe4f4333e3f8668af04a8ca9926a1b5198e71ab8b632d1b633eaa33c08ff0077dae3b388b892492492769278acddbee57a7d1e648c4f3ce3628b0e022a68acfaaac78f174ece93d277d9bc7d82e52498cdd3d7931218a46bd8f2c91a439ae0eb1046e20f05eaf16d26670c5b0638562198eb26a173751ec2e683237a1ce0039c3b4ede2ba2e33a50c2f2398b2f68e30cc36af0fa3bb67afad88caeab978b81045c6cdfb8f000017f97ff00d7dccbfc5196ff00c13bfd6a6edef4390c21ae36d61debdae5bcbd538f6274741411896a67218c6dfed278003692bd6c1a7bcc6e759d8465c1d946eff5af6b94b4d15afc5a8ce2f41864746e3e35d4b4e5af683c478477742995cbf4b247cec4341f551d0d4730c5e82bb11a766b4b4715c3b67006fb4f680b88e2f41c839c08b597ec67e65ca982539c4e2c5696a4b03df1470f9e90bbe6bbbf881ed5f943365536a6b279858191ee790385cdff006a9fc795bead8f112b755cb595ba7daf2b495ddc98ac4ac8a82a8c562564a0a2315054a1418a82a5420c4a82b22a0aa214152a0a2328a4746ebb7e23a56d9636c8de522f8b7a15759c523a376b37e23a54a35a2df56d6b6405a2dac2f65a150562abc987dd55d58aaf221f75056288511058ac94141b697d218b09bcebfb4ace97d218b09bcebfb4a1f18222202b351e620ec55959a8f3107620ac88882cb3d09fef2ae15867a13fde55c22d4a222225111144444121102202c94294a0a54294559a3df27bab42df47be4f75685152164b10b24448d8762b4c91b334325d8ee0e5542c915b248dd1bacef81e95885ba19816ea4db59d3d0a2588b3683acc3b8a83161b10be951559888dabe60590364b36b2bd5478d3c32dae7bd50adaf32dee57c80f2a6e4acf15db37bb58dd4050a42a8c82ed793334619a43c060c979fe7e4ebe3f0708c69db5f1bf708e4277df60dbe56e3b6c57140b36ee59ca6d63ef671caf8a650c7a7c2b1a80c5511ed63c6d64ace0f61e2d3f66e3b57cba3a99a92a62a8a691f14d1b83d8f638b5cd2368208dc575fc999ab0cd20605064bd20cfc9d5b3c1c231a76d7c4fdc18f277df60dbe56e3b6c5737ce595b14c9f8f4d84e350f273c7e131eddac999c1ec3c41ef0761daa4bf2abadd1d4e1ba6ac123a0c4e482873e51c4452d591aacae60dba8fb71f670de365c2e73268df3a452be37657c5cb984b4965397036e823611ed0bcbd1d4cd475314f4d23e3963707b5ec716b9a41b8208dc474af6434a19c3f9498b7f7a3fc94d59e2faa834779cbf92d8cff8572c868ef397f25f19ff000ae56c693f387f29315fef47f92c8693b387f29315fef47f927f63a551a3cce3fc97c63fc2b969afc9d99309a37d662780e25494b1db5e69a9dcd636e6c2e782fa6349b9bff9498aff007a3fc97dacaba5dc730fc4ef8f54d4635854cd3154d1d516bc39877eadc6fedd8771e913fb1d3cde03612b4824386d046f057ebf65655ba870d7d24f2c903a958f6cad6728667d86c71ff9e2bf3ce73ca3458750459a32838d6e56aa3ac0b492ea4713e43c6f001d973b41d87813ab01d22e2b83d0f35a0ae9a2836d99b1c1bd97bdbe0b194e5dc69e9f4e9494906652ea7631934b03649dacdc2437fb48b15c821aca9c331186b70f9df4f5703f5e3963362d3ff3c38afab8ce386be7926a97492cb21d67bdeeb971e9257c09c8906bc5bb885bc66a68aebb534d87e9830a75551b60a1cf549178e82fab1d7b00de3dbede1b8ecb11c91f4b35249554f5513e19e2259247236ce6386f04702986d754e1d5b05650cefa7aa81c1f1cac367348e2bb139987e977097cf4ed828b3c52c5e3621e0b2b98388f6fddb8ecb113f1ff0011c51adda1750d240fc94e8dbeaf37dcc5ceeb28a7a1ab969aae27c33c4e2c7b1e2c5a46f042e8fa471f92bd1c7d5e6fb9897d839ee158ce2384c55d161b54fa7656c269ea0340f1919f9bb46cf86dda57ceb2db651aab4310d52ed816602f57a3fc93559bebe473a414783d28d7acae7d836268172013b0badf01bcfb56e868d1ee48abce388c9e30526114be1d6d73f632268da40276175bbb79f6fd8d25e77a69b0e8f2ae4e6734cb14fb1ce6ec7d6bbace3bf56fb76efde7804d22e76a4a8c3a3cad936334995e976388b87d6bb8bde7796df6eddfbcf0039eca04cdd76f9406d0b326fba2995f7a9323e69aca68aa6932ee2b353cad0f8e4653388734ee23d8bdc647c9f87605833739e7f61661ac21d41873878cad7ef692d3f3788077ef3b37fc4c7f4b19bf13c567aba6c5ea70e81e7c5d2d2b80644d1b80d9b4f49e2aeedf07c63a3dce1fc98c63fc33962747b9c7f92f8c7f8672b274939d3f94f89ff783fc96274959d7f94f8a7f783fc95fec8aa74799c7f92f8c7f8572df8768c339d7d7c14adcbb88c065786f2b51098e367b5ce3b8043a4bcebfca7c53fbc1fe4b54da48ce9246e63f33e285ae05a4096db3b40ba7f63a7b8cd598b0dd196093e52c8f389b1b946ae2d8cb47841dc638cf02368d9e4fbc491c55db4dcacdcbd468ef23e239e31ae69456828e101f575b20f174ece93d2e3b6c3f6025592633753d61a3cc9189678c6f99505a1a58807d5d63c78ba76749e9276d871ec04af57a44cf18761b827ee274784c180c576d65734f8cc41fb9c75b8b4f13c770b346d9d22e78c368704392b47c0d3e5f8896d5d6b4f8cc41ff0038977169e27e76e166ec3c98a9272ee9e30589deb32b072da0d76a95f65b5c6231d8fcd5f11cb75592393f752c257de931990b2c5e7bd7c6adac3293b5522f2b026e9216b171b958159150569960541591589418a82a4a155182144283144288312a14950a8850a51118a2220df5be547eeaaeac56f951fbaaba4f0a2b155e443eeaaeac557910fba82b950a4a84414152a0a0db4be90c584de75fda5674be90c584de75fda50f8c11110159a8f310762acacd479883b105644441659e84ff0079570ac33d09fef2ae116a51111128888a2222090881104852a029400a540528ab547be4f75575628f7c9eeaaea2b20b38dda8f0eb036e056014a22d18d9302e8763b8b568208363b0a8638b5d769b15683993d83fc19383ba53c5570b743318f61dac3bc2d6f8dd19b387c7a5105892105baf11bb3a3a16a0a6291d1baedf88e95bf9480ed31bae7a145690b20b68741eadddeb20f83d5bbbd06a5216ed683d5bbbd641f07ab777a8ad4164372da1d07ab777acc3a0f56eef506a1ed5d972866ec233be5e8f27e916a0433420fc978dc846b40eb6c6c8e3c360173b08d876d8ae421d0fab777ac83a1f56e59b36b1d4868930effbc6ca7fdf0ff52c868970effbc5ca9fdf0ff52f0232f629fc418b7f8297fd2b3197b14fe20c5bfc14bfe953bfdabde8d1361dff00789953fbe1fea590d13e1dff00789957fbe1fea5e0865ec53f88716ff072ff00a56632f629fc438aff008397fd2a77fb1e8737644a4cbd839ae83376038abc48d6736a392f21bf102e760e2bc505f5db97f141ff00f82c5bfc1cbfe947e5fc60db5304c5474de8e5ff004ab3fec7ddd1b67aabc9b88c8d31f3cc1aabc0ada07ed6cad3b0900ec0eb7c0ee3ecfbda43c9b4d4987479a726ca6b32ad5ed21b72ea271dec78de1b7d973bb71e04f809303c5a089f2cf85623144c1ace7be9646b5a3a4922c02f47a38cf359937109008c5661155e056d0c9b592b4ec2403b03adf03b8fb259f62bcb191c77aca27963ae1742d21e48a3830e8f35e4c90d5e57aa37735bb5f44ee2c70de1b7d9b776e3c09e76159762d3981edd78f7711d0b761d5b538756c159433c94f550b83e396336734f4855a17961b8f885bdcc0e6f291eee23a107641cc34bd8497b041459de923f0d83c165730711edfbb71d9623e7e946966a3d1be8fe9aaa27c33c514ec7c6f16735c352e085cc70eaba8a0ad82ae8a67c1530bc3e3963367348e2175dd2f62b363f91b22e235e182a6aa299ef2c161ad665ec382e7ad58ae3baaa3556e7b0b0d9cbd568fb25d466bad9249641478352787595afd8d8da369009d9ad6f801b4fb776e91868ff0024d566dad91ee9051e0f4be156573f636368172013b0badf01bcfb6fe9173ad2d5d04796328c668f2bd2ecf0763ab1c3e7bf8917db63bf79e006cd21e74a7ada28f2de548cd1e58a5f0406dc3aadc3e7bf8dafb6c77ef3c00e74f1beea49bee8d0ee2ba9646ca78765ec1999cf3db4b6846dc3f0d23c6563f7b4969f9bc403da766fcf25e53c372ee0acce39f633ccf61c3f0c70f0eadfbc38b4fcde201d9c4ecb03e233ce6cc4738634fc4313780d176c1034f81033aadfda78f704df2ea0cf3d66ac473ae2cec43107db5016c34cd3e040ceab7f69e3dc1794217d866058d021ccc23133c4114926dff75672e5ec6256ebb707c4c3f88e6926dff756a6a743d165ed1dd162f82d257cb9d72ed03e766b1a6a896d245b77386b0dabe81d1461dff785957fbe1fea5e08e5dc6aff00fd9713ff000727fa56272ee35fc4b89ff8293fd2a77fb1ef4e89f0effbc3cabfdf0ff52c4e89b0effbc4cabfdf0ff52f0272e635fc4b8a7f8293fd2b039731bfe24c53fc14bfe94eff0068e83168970a32b04da45cae22d61ac59282e038daeeb5d69d22e77c3a8f05192b205e0cbd0922aaac1f19883fe712ee2d3d3f3bd8d001e7f36018c4513e49707c4991b01739cea3900681bc925bb02f9676ab31dfb536c0ac4acc85815b460562e59158b9060edcb7567e8fdd5a4adb57fa3f75515cac0accac15462541525414462562564562506250a142a958a82a5414462510a20c4a852542a21111118a2220b15bbe3f7556566b77c7eeaac93c28ac557910fbaabab155e443eea0aea14a844a282a54141b697d218b09bcebfb4ace97d218b09bcebfb4a1f18222202b351e620ec55959a8f3107620ac88882cb3d09fef2ae15867a13fde55c22d4a2222251111444441211022090a540528014a80a5156a8f7c9eeaaeac51ef93dd55d456414a80a5112164b10b2416229bc1d4946b33ed092c25a35987599d2b405b6295d19d9bb88515885905bcc6c941743b1dc5ab4588241d8506416416216411632592c564141b236eb15f469e89cf02c169a0607382ea9a33ca63326334d421e230fb97bed7d5681727b5672ba6a47397e1cf68f24aeb595f2d617a32c161cdd9e29c546352f8584e0cef283b84920e046c3b7c9f6b8803b160d9232a6158e4428a8a797158637494a6b1e4c723c0d8ee8b83ecf685f98f3fe2988e3b8f5557e333196adce2d23e6c601f21a38347fc77ae732e7d35ad3ebd4e9b33ecd532c8cc6c42d7b8b8471d345aac04ee1769361ed24ac0699f3f7f281ffe1a1ff42e76e167290b7c31fd33bae8a34cd9fbf940ff00f0d0ff00a16434cb9f7f8fdffe1a1ff42e76166138cfd2edd10698f3e7f1fbff00c343fe8590d3167cfe3f7ff8687fd0b9e377acc29c67e8dba760da6acdf4b89432e295acc4e841b4d492c31b5b2b0ec22ed6820f470e90558cfd9330eaec1ff76590ef36052dcd5d181e1d0bfe702de0d1c470de3c13b3958debd5e8ff0039e2192f19e774569a9650195548f3e04ece83d046db1e1d970a5c75de2ab7a39cef5993b11790c15784d50d4ada17ed64cd22c48076075bbf71d9bbeee90b24d145863335e4a90d5e58a9daf60b97d13b8b5c3786df66dddb8ecb15b73e64cc3b10c18e71c844cd82497755d13478ca17f11abc1a388e1bc5dbbbcf68ef3b5664ec49ef6305561752352b285fb5933375c5f6075b71e3b8ec53dee0f30d5ba17961b8f885d034819268d9863735e4b7f3acb351e13e31b5f44ee2d70de1a0ecdbe4ee3b2c573b0b52ec5b2c0ef0e3ddc4742e95a44fcd6e8e7f989bee62e610c858f047c42ea3a471ada2dd1db983c1104df731672f60f3fa3ecb5fbadc525a7aaaa8e9282923e715752f70059183c2fc7dbb86f3edfa7a44ce90d651c796f2bc3cc72cd2ec6b5bb1d5447cf7f1b5f6d8ed2769e81cf81b03b77ec2b609048dd490ede0e4d77b1a4bba5750c9d9570ecbb83479c33d32d4de561f863878754fded739a787100f69d9b0b27e55c3f2be10ccdf9f23f120df0ec31c3c3aa7ef0e734f0e201ed3b2c0f86ce79ab11cdb8d4988e2926df26285a7c0859c1ad1f79de4a7e5d419677cd188e6fc664c47149377830c2d3e040ceab7f69de4af719532d61991f0387376788394ab71d6c3309779723b787bc1dd6d876eede76d82cb2b65ec3f22e0d0e6ccef0ebd6bfc2c2f09779723f787bc1dd6d876f93bcedb05e0735663c4334e213e278b4dca4ef759ad1e444de0c68e007dbbced53dea783eed6e98f3bcd552cb1e2e29d8f7173628e9e32d60ea8bb49b0f695aa1d2f67974a03b1d7dbead0ffa57867b5440df1c16b8cfd0f68ed3167b0e2063cfdfff00e343fe8589d31e7cfe3f7ff8687fd0bc1c82cf3dab51578cfd23df1d3267dfe3f7ff008687fd0b13a65cfbfc7eff00f0d0ff00a17802b029c71fd1b74bc2b4dd9da9711826adc4995f4cc778da59608dad95bc5b76b411dbf7abf9eb246198f60cece9a3f6176172126bf0e03c650c9bdc4347cde91c378f07772785b7705d2f4518ce2397b1d8aa30c76b09888a6a771f027693e49f6edd87877852cd7709db9f9c3dfab7b2a5514e59bc2fd838fe8f326b6ae4754d1d6531a878d6753bed140e7700370dbb6d623b02fcf3a4acb0ecb398ab30c91e24e4482c900b6b308bb4db81b14c73956c73870b158396fa86d9e56872e8c302b6d5fe8fdd5a9db96eacfd1fbaa8ac560b32b02aa312a0a92a0a2312b12b22b128312850a154ac54152a0a23128851158950a4a8551088888c5111058addf1fbaab2b35bbe3f755649e14562abc887dd55d58aaf221f7505750a5422514152a0a0db4be90c584de75fda5674be90c584de75fda50f8c11110159a8f310762acacd479883b105644441ba9e50dbb1e2ec76ff00624d098cdc6d61dc5695be9e6d505926d8cfd88ad48b6cf098cdc6d61dc56a444a222288888242204412a562b24a0a54294559a3df27bab42df47be4f75685152164b10b7c5109233aaef18387b106b0b258dac6c76159222429501484566c716905a6c55813b5de5c4d73ba5560b20a0b2268fd4b564268fd4b5550b24d2ad72d1fa96a91347ea5aab8521457d5a1a98daf1e282e95a3dce072ee2d4d5d044d2e8ced69360e691623b97248dc5a762bd055b99b8ace58ed657ea0c534bd80d3412d6e118755fcaf2465ac33bc727093bc8da6ff00003e0bf3d62f5ec9e57bdd18739c49249de4af96faf7386f556494bced59c7098adadae9a3bf9a0a44b1faa0ab05905a45a12c7ea82c84b1faa0ab059041684acf541662567aa0aa8598455a12c7ea82cb956169b44015582c9a541eaf20e71c47266322b2808969e4019534af3e04ece83d07a0f0ecb85f4f4974f95df53458b64fab60a7c45ae926c388b3e8de2d70470049361ecd9b2d6f0a0acc1535dec7b0d1e676adc9b89ba489a2ab0da81a95944ff22666ee3b0380dc7e0762fb1a4ecb185505361b9932bcfad806305c6181c087c0f1b5ccdbc3611ecb5b68b15ce415d4b379fc85e44facd47df22cdeacb15cd9a7685d5b3f388d17e8dedb8c1303dcc5c9d87685d57481b345fa35fe626fb98997b07339ac24701baeba3e8f305c1b09cbb2678cd56a9a3a79cc14540d1733ce376b70b5f70ddb093b805cd27778d776ae93587f7bad0ff4e3bee7a643ca66ecd388671c5e4adc5a4f0f6886367910b3aad1f79de57ddd1ccd95f00a0aacc98fcd1d7629492f2743848dee92d7123bd9d0770b1de6c178085de35ab5ca7c3776abaeb43eae6bcc788e68c666c4f179ccb5126c6b46c646de0c60e007fc4ed5f343bf153ef2d04aceff008a9f79518ebad94e41942a85cb6533fc70f8aa8895b773bb5687356c73fc23dab124141a1c16b72b0e175a9ed54442eb397a9cbf88f359a391aeb39a410470217923b16d8aa1cce2966c95fa923d2de0355450cf8c61f56fc422009642e1c94ae1b89b91f683f15c3b48599a5cc98ed5e25521ad92776c634ec6b40b068ec017943883b56daca94f505fbcac63848b6b4d43aef2abb9664dcac0ef5d230c5cb6d67e8fdd5a5cb7566f8fdd54562b1591589551895054958a220ac4a92a0a0c4a14505518a144288c4a214418950a4a8544222844422220df5be547eeaaeac56f951fbaaba4f0a2b155e443eeaaeac557910fba82b950a4a84414152a0a0db4be90c584de75fda5674be90c584de75fda50f8c1111015a91bcad330b36ea0b10aaad9148627dc7c474a0d68ac4d18737958bc9e23a157405214290837c336a02c78d68cf0e8595e9baaf55d1346d62f4dd57a5e9baaf5a0226976df7a6eabd4de9baaf55d1346d601a6eabd6b979324724081c6eb585280b258a94a254a852115b619393d6d97b8b2c56216480166c716905a6c42c1641416acda96dc584a378e9580825ea15a4120dc1b15b048febbbbd1598a797a85642097a856be51fd7777a9123faeeef53b1b053cbd42b2104bd45ac48febbbbd4891fd7777a0da2097a85642097a856ae51fd7777ac848febbbbd15b4412f50a9104bd45ac48febbbbd65ca3faeeef515b0412f50acc412dfc92b4891fd7777acb947f5ddde8377212f54ac84127556a123faeeef59091fd7777a8370864eaac84127556a123faceef59091fd6777a2b68864eaacc43275569123faceef59091fd6777a8370864eaacc43275569123faceef59091fd6777a2b78864ea9590864eaad2247f59ddeb2123faceef506f10c9d551b5a6ce162b5891fd6777ab0c709da1ae3678dc7a50620aea79bcfe42b227d6aa3ef9172a376bace1621754cdff989c89f5aa8fbe459cbe2c7358f785d534866da2ed1aff3137dcc5ca9a6cba8e914fe4b74667fd84df7314cbd83984eef1afed5d2eb0fef73a0fe9c77dcf5cbe63e35ddaba7561fdee341fd38efb9eae5f073480f8e6ad729f18eed2a603e39ab5ca7c377695a4412b65ff1477bcb412b65ff001477bc834b8aca9bcf05a8ad94e7c7041a9e7c23dab1d6479f08f6ac095467aea09bad44a8d64466e0b5382cb594128353aeb595b9cb5b82a8d6560566e0b02a8c4adb57be3f75692b755fe8fdd415cac4a92b12aa216254950511895054ac4aa214152b12888428a0a0850a54141054142a0aa0a0a9505110888946fadf2a3f7557562b77c7eeaae90a2b155e443eeaaeac557910fba82b1442888282a56283752fa43161379d7f6959d2fa43161379d7f6943e304444044441b6094c4ebef69de1673c42dca45b587ec55d6c8a67c57d5dc78141858f42007a16fe7727d1ee4e7727d1ee43a69b1e84b1e85bf9dc9f47b939dc9f47b90e9a4045bc55c9f47b939d49f47b915a116fe7527d1ee53cee4fa3dc82bac96ee7727d1ee53cea4fa3dca0d0816fe7727d1ee522ae4fa3dcaaf4d0a403d056ee7727d1ee522ae4fa3dca0d22fd0564b6f3b93e8f72915527d1ee41a548ec5bb9d49f47b948aa93e8f722b57c148f8adbcea4fa3dca455c9f47b906a5216ee7527d1ee522aa4fa3dca0d4b20b60aa93e8f72c85549f47b906a0b20b68aa93e8f72915527d1ee456b17e8592d82aa4fa3dcb215527d1ee506a0b30b315527d1ee590aa93e8f722b06dd64167cea4fa3dcb215327d1ee50621641642aa4fa3dcb315327d1ee45601641662a64fa3dca454bfe8f728310b30a454c9f47b9642a64fa3dc8202c815936a5d7f0802de3b12566ad9ccdac3b91405640db72d60ac8141723709c06bf63c6e2ba867005ba0ac880ef15551f7c8b93337aeb99b2d2e82b22eb1f08d4d458fc6458cbd8ae5badb42ea3a463f92bd18ff3137dcc5ca1c6ceb1e05754d231fc94e8c3f989bee625f60e5d33bc6bfb574fac3fbdbe83fa75df73d72d99de35fdaba8561fdedb407ffe75df73d32f8399539f1cd584a7c63bb4a539f1cd5ae53e31dda5690256d07f143ef2d175b2ff008abbde41a8959d39f1c3e2b492b6531f1c151a9e7c23dab0254bcf847b5604a205604a925624aa882546b21589413aca09bac09504a0c8ad6e0a759413741acadd57fa3f756a72db57fa3f755154ac4ac8ac4aa882b12a4ac4a20b12a4ac4aa0b12b22b1444282a4ac4a0282a5415462a0a95080a0a9505110877221dc837d66f8fdd55d58acdf1fbaaba428ac557910fbaabab155e443eea0ac51111058a95083752fa43161379d7f6959d2fa43161379d7f6943e30444404444044440444412a5405280a5429404444514850a42029508832444412b20b1521159204450641140528320a540528320a42c42c91590592c02c828320b20b00b208acd4ac42c828320b3695ac2c822b605905ac15902a0d80ac82d60ac8141b015902b582b20541b015ba09437c17ed61fb15605640a2ac4acd4774b4ee2a01530c808e4e4f24ee3d08e6163ec515b19bd758cd47f219907eb553f7c8b9282babe6c3f90ad1ff00d6aa7ef91632f8b1ca9e7c6bbb5756d239fc9468bff989bee62e4cf3e35ddababe920fe49f45dfcc4ff73132f623964c7c6bfb5751ac3fbdae83fa79df73d72b98f8d7f6aea5587f7b5507f4f3bee7a65f0730a73e39ab090f8c77694a73e39ab090f8c776ad812b65ff00153ef2d175b6ff008a9f7906a25674c7c705a495b298f8e1f1446b7f94eed5812a5e7c2776ac094025628a0955025604a925625042c49524ac4aa2095892a4ac510256eab3e6fdd5a1cb6d5fe8fdd41a0ac4a9bac5544158ac8ac504158a92a1510562a4a8440ac5495080b12a4ac4aa0a10a202c5495088282a5414162b37c7eeaaeac566f8fdd55d2145beabc887dd5a16faaf221f75057444444150a4a841ba97d218b09bcebfb4ace97d218b09bcebfb4a1f1822220b3cedfd56f7273b7f55bdcab2268dd59e76feab7b939dbfaadee5591346eacf3b7f55bdc9cedfd56f72ac89a3756455bfaadee53cedfd56f72aca5346eac73b7f55bdc9ce9fd56f72ae8134bb59e74feab7b939d3faacee55d1346d639d3faacee4e74feab3b95744d2eeacf3a7f559dc9cedfd56772ae8a68dac8aa7f559dca79d3faacee558294d1b58156feab3b94f3a7f559dcab295746d68553faadee4e74feab3b9560b2534bb58154feab7b965ce9fd56f72aa1641342c73a7f559dcb2e74feab7b9555904d1b59154feab3b948aa7f55bdcab290a685a154feab7b948aa7f55bdcab2909a36b5ce9fd56f72c8553faadee5542909a5dad0aa7f55bdcb2e74feab7b9550b2054d0b22a9fd56f72c8553faadee5554a2ed6c553faadee590a977437b95405640a9a168553faadee590a97755bdcaa8520a0b8d709db6360f1b969da0d8ef5835c41041b10acbad3335dbe58de115a815902b5ac81446c6ef0ad5479d1d8aa337ab3527c67c1458c4b9757cd87f211a3efad54fdf22e465cbad66b3f907d1efd6aa7ef91672f8b1ca5c7c61ed5d674927f24da2dfe627fb98b91bcf8d776aeb1a4d76ae88b45aedf6a79fee6265ec23964c7c6bfb5753ac3fbda30ffe9e77dcf5c9defd67975ad75d5ab0fef67c3ffa79df73d32f8472ea73e39ab090f8c77694a73e39ab090f8c77695a42eb683f8a1f7968bacb94f14596de6f741892b6531f1c3e2b4dd6ca63e3c20d6f3e11ed58297f947b5624aa812b125095892804ac49524ac0a015892a495895502a0a2c4941056eabfd1fbab415baaff47eeaa2b95054ac4a220a828a0aa20a82a562511085141410511104158a92a1510511111054222028525420b159be3f7557562b37c7eeaae90a2df55e443eead0b7d57910fba82ba22222142220dd4be90c584de75fda5674be90c584de75fda50f8c1111059e4e0f5a7b939383d69ee55910dacf2707ad3dc9c9c1eb4f72ac886d679383d69ee4e4e0f5a7b9564436b3c9c1eb4f729e4e9fd69ee55548436b3c9d3fad3dc9c9d3fad3dcaba21b59d483d69ee4d483d69ee55d1176b1c9d3fad3dc9c9d3fad3dcaba21b580ca7f5a7b94f2707ad3dcab295176b1c9d3fad3dcb2e4e9fd69ee555484d1b59e4e9fd69ee5223a7f5a7b9564086d64320f5a7b965a907ad3dcaaac82ba558e4e9fd69ee521907ad3dcaba0505ad483d69ee521907ad3dcab04416b520f5a7b948641eb4f72ac0a94d0b21907ad3dca4320f5a7b9560b25342cea41eb4f72c8320f5a7b955054a2ad0641eb4f7290c83d69ee55948282d0641eb4f7290c83d69ee559482a685a0c83d69ee52626b985d13b5adbc2aab647218dc1cdff00e51520ac815b246b64672917f682d00a0d80ad914858e0e0b482b250599c0b3646792ee0b582b379fc562ed5a9a8adcd2b7d59f1bf00ab02b6d59f1bf00835df6aeb99b0fe41747bf5ba9fbe45c8015d7b361fc8268f3eb753f7c8b197c2393bcf8d776aeafa50fccfe8bbeaf3fdcc5c95e7c6bbb5758d28fe67b45bf579fee6265ec1ca2ebabd61fdecb87ff4fbbee7ae4b75d66b3f83261ffd3eefb9e997c2396d39f1cd58487c63bb4a539f1cd58487c63bb4ad05d45d45d45d544adb4c7c70ec2b45d6da53e3822b5bcf847b5624a3cf847b56088925624a12b1402541284ac55414228250095894504aa20add57fa3f75682b755fe8fdd41a0ac50a8288158a92a151054215080b12a4a84414152b12a885054a8405054a828884444105111058acf2a3f7557562b3ca8fdd55d2145beabc887dd55cab155e443eea0aea0a950511088883752fa43161379d7f6959d2fa43161379d7f6943e3044441363d0963d0b7f3b93e8f7273b93e8f721d3458f4258f42dfcee4fa3dc9cee4fa3dc874d163d0963d0b7f3b93e8f7273b93e8f721d3458f4258f42dfcee4fa3dc9cee4fa3dc874d363d0963d0b7f3b97e8f7273b97e8f727674d201e84b1e82b773b97e8f729e7527d1ee45e9a2c7a0a58f415bf9d49f47b939d49f47b9068b1e82a45fa0adfcee5fa3dc9cee4fa3dc8bd34d8f414dbd056fe7527d1ee4e772fd1ee50e9a6c7a0a58f415bc55cbf47b939dcbf47b9069b1e82a45fa0adc2ae5fa3dca79dcbf47b951ab6f414b1e82b68aa93e8f72cb9d49f47b9456917e82b2dbd056ce7727d1ee590aa93e8f720d3b7a0ac85fa0adbcea4fa3dc9cea4fa3dc8356de82b217e82b6f3a93e8f720aa93e8f72835ede82b217e82b60aa93e8f729e7527d1ee41af6f4153b7a0ad82aa4fa3dcb215527d1ee456b52b73271278130163b88e0b5cb1989d63b4702820152b1520a0db1486375dbf11d2b74ac0e6f2916ee23a1555b2194c6eb8ddc428a29056552d0c96cddc45d6b0505b79fc5a2ed5ac1593bd162ed5aeea0cf596dab3e37e0157bed5baacf8df8041802bad674247e0fda3d20d8f3ba9fbe45c8815d6f3b1fdef7a3dfadd4fdf22ce5ec58e500ed5d6f4a47f23ba2cfab4ff73172107685d734a67f239a2cfab4ff007314cbd84726baeb3587f7b161ff00d3eefb9eb91dd75aad3fbd870ffeb03bee7ab97c239407106e361504dced58dd45d69195d2eb1ba84124adb4a7c78ec5a2eb6d29f1e3e283079f09ddab0251fe5bbb5624aa25624a28ba20a11412804ac51412a812a11628815bab3f47eead04add57fa3f750685892a4958aa0a0952562511088a09410511104158952542a20a2222214292a1010a28404444162b3ca8fdd55d58acf2a3f755748542b155e443eeaaeac557910fba88aeb152542022220dd4be90c584de75fda5674be90c584de75fda50f8c11110111101111011110111104852b1592020444128888a22220908a14a02c962a4209521422090b20b15211592044506411402a50640a9582c81419052162a422b25902b39221a81f11259c7d8b5283356219416f272ed61dc7a15505648374b198cf4b4ee2b05b21946af2726d61fb144d198cf4b4ee28a80548deb0ba9076a0b3567c6fc02d216dab3e37e01690a2adbcfe2b176ad375b243f8a45daabdd41983b56fab3e37e01561bd6fac3e34760546b0575ccec7f7bde8f3eb753f7c8b9082bae677fe0f3a3cfadd4fdf22c65ec58e4e0ed0bae694cfe46f457f569fee62e400ed0baee950fe46b455f569fee6265ec23925d75cad3fbd7f0efeb03bee7ae4375d72b7f82f61dfd6077dcf4cbe11c96e9acb1ba8bada32ba8ba8ba8ba232badb487c78ec2abadd487c78ec28ad6f3e1bbb5628ff002ddda5422097504a85409509758dd0492a142844141284a8402b755fe8fdd5a095bab3f47eea0ae88b12554095088500ac50a228a0a1505544282a54202852a11108888054222022220b159e547eeaac559acdf1fbaab2428ac557910fbaabadf57e443eea22ba8444044441ba97d218b09bcebfb4ace97d218b09bcebfb4a1f1822220922c6c542b4e6b6a59acdb0906f1d2aaa0222202222022220290a110648888242285b1b1de273efb1a6d6458c1111014850882511104a950a5002950a5bb481d28ac8294959c9485a4deca0209520aca28f942eb1b585d60145648a015288c8152b1520a0dd04a62774b4ef0b64d18b7291ed61fb1565b6094c676ed61de1158a9056c9a30d01f1ed8cfd8b52832565849a3783c0ec556eac47e89276a558d57520ed58a91bd1166acf8ef805a8159d5f9ef805a6e8ab521fc562ed5a56c90fe2b176ad2a0c86f5beb0f8ef805581daac561f1df008ad40aeb99e0fef78d1dfd6ea7f5a45c8815d733c7f078d1dfd6eabf5a459cbd847251bc2ebda55fccd68abead3fdcc5c7c6f0baf6957f333a29fab4ff7314cbd847235d72b4fef5dc3bfac0efb9eb90aebb5bfc1730efeb0bbee7ab97c2391a5d425d691375175174ba095b690f8f6fc568badb487c78ec283079f08f6ac51e7c2776ac6ea89ba82545d45d112a2ea12e80a09517440504a82542a056fabfd1fbab53185eed56ef59d5b817b5a0df5458a0d24ac51110504a12a10111624aa05422828088a1102a111010a2840444404443b906fadf2a3f7557562b7ca8fdd55d22516fabf221f7557562abc887dd41591110111106ea5f4862c26f3afed2b3a5f4862c26f3afed287c6088882c5179c77bab42b145e71deeaae87c42222022220222202222090a562b2405623f4397b42aeac47e872f684ab1a111101111002950a420290a11064a59e5b7b42c42c99e5b7b42837567a43bb02d216eacf4877605a558b56a8f7c9eeaae372df47be4f75681b9454a9054222324500a941902a560a41416695e43c30ed6bb610561200d91c06e0529fcf33b544fe79fdaa7d542b119fc524ed0ab5d588fd124ed4a3502a41dab14076a0b5567c6fc02d375b2b0f8ef805a6e916acc9e8b176ad375b24f458bb569ba44660ed5beb0f8df805581dab7d61f1df008ad40aebd9e3f83b68efeb755f7c8b8fdd75fcf3fc1db475f5baafd691632f62c72307685d7f4adf999d14fd5a7fb98b8f03b42ec1a563f918d147d5a7fb98997b08e4375d7ab7f82de1dfd6177dcf5c7eebaf56ff00059c3bfac2ff00b9e99fc2391a858dd2eb68cae9758dd111375b690f8f1f15a2eb7521f1e3b0a51adfe53bb563747f94eed517412a2ea2ea10492a1141542ea0945080a58d2f706b45c946b4b9c1ad17256e7b853b75186f21deee84091e20698e33e19f29caaa221b141284a844111412804ac511502a111105085420222141088880b26b1ce0e2d17037a98a332bac37713d0b64d200de4a2f206f3d2834282a4ac51166b7ca8fdd55d58adf2a3f7556290a1562abc887dd55959aaf221f750564444044441ba97d218b09bcebfb4ace97d218b09bcebfb4a1f1822220b345e71deeaaeac5179c77baaba1f1088880888808888088880a42844192b11fa1cbda1560acc7e872f684ab15c2950a42208b28d8e9090dde05d628a222209450a50166cf2dbda160b26796ded0837567a43be0b4add59e90eec0b4a916acd1ef93dd55c1d8b7d16f93dd5a06e5465752b1ba90504a905429682e700379d8a2a511ed2c716bb784ba236d379f676a998f8e7f6a8a6f3eced513f9f7f6a7d542b11fa249da15505598fd124ed4a469ba9076ac5020b359e7be016959d4c8d924bb77596bba82cc87f148bb4ad1759be469818c1e503b56b4832076adf59e7be01560b6d4c82492eddd641885d7b3cff075d1d7d6eabf5a45c7eebafe793fbdd3473f5baafd691672f62c72207685d874aff997d13fd5a7fb98b8e83b42ec1a573f917d13fd5aa3ee62997b09e5720baebf5a7f7ace1dfd617fdcf5c7aebb0569fdeaf877f589ff0073d5cbe7fa4721ba5d6374bad2252eb1ba5d06575ba901e575be68de56b862321e868de56534a08d48f6307da83538ddc6dd2a145d6f89a23672b2ff0065bd283263442ce524f28f92d58f3a93a1bdcb4c923a479739609a1639dc9d0dee51cea4e86f72d0a095746d639d3fa1bdca0d5bfa1bdcabdd42685835525be68f82d076ef50a094369ba82545d6e8220e1af26c8c7da8698c7048f6eb340b7b4acb9acbd03bd6334c643b36346e0b5171e92837f3697a077a834b2f437bd68b9e93dea2e7a4f7abda37f3597a1bdea39acbf47bd69d63d27bd45cf49ef50db7f3597a1bdea0d2cbd0def5a4b8f49ef5173d27bd0e9bb9acbd0def4e6b2f40ef5a6e7a4f7a5cf49ef43a6ee6b2f437bd473597a1bdeb4dcf49ef4b9e93dea9d3773597a1bde82964bf0ef5a6e7a4f7a8b9e92874b133c46ce4a2fed1e955d14144b450a54222cd6f951fbaab2b35bbe3f7555485159aaf221f7556566abc887dd41591110111106ea5f4862c26f3afed2b3a5f4862c26f3afed287c6088882cd179c77baabab145e71deeaae87c4222202222022220222202222095663f4397b42aaacc5e872f684ab1a111111628bce3bdd5a16fa2f38ef7568451111010222095933cb6f6858059b3cb6f6841b6b3d21df05a56eacf4877605a10ab547be4f75570b7d1ef93dd55d45648a14aa320567179d67685a96c84f8d67684a365579f7ad4b654f9f7ad6a2b6d31f1eced533f9e7f6ac69bcfb3b5273e3dfda8315623f4393b42ad75663f4493b42523402a6eb1444668b1ba9ba095375174454dd4dd628832baec19ebf839e8e7eb755fad22e3abb0e7afe0e5a38fadd57eb48b197b163908de1761d2c7e65b44df56a8fb98b8e03b42ec5a59fccae89bead51f73132f613cae3cbb056ff00057c37fac4ff00b9eb8edd761aefe0ad86ff00589ff73d33f9fe91c82e9758dd16d195d6c863321b9d8c1bcad2ac3c9149181c4ed5044d3023523d918fb569ba85ba08c105f26c60fb55f04c3180de565f246e1d2b5cb2191d73f01d0934a64774346e0b5dd04a8ba8ba8444dd4222025d412a2e8249508b6c117284976c60de514822d7bb9fb231bca89e5d720376306e0a679b5fc166c60dc168253404a8562189ad6f2b3793c074a8e5e2f50d5763428563968bd435472d1fa86a9b46850558e5e3f50d51cb47ea1bde82ba2b1cb47ea1a9cb47ea1a9b15d42b1cb47ea1a9cb47ea1aa9a574563968fd4353968fd435115d158e5a3f50d51cb47ea1a834150ac72d17a86ad72bdafb6a3032dd088d6a0a95082c56ef8fdd55967248e92dad6d82db16085159aaf221f7556566abc887dd41591110111106ea5f4862c26f3afed2b3a5f4862c26f3afed287c6088882cd179c77baabab145e71deeaae87c422220222202222022220222202b31fa1cbdaab2b31fa1cbda8b15c2958a94459a2f38ef75570ac5179c77baaba7d54a280a5011110164cf2dbda162a59e5b7b420df59e7ddd81685bab3d21df05a548559a2df27baab85628f7c9eeaaca8c9145d4a05d6c87ceb3b42d6b387ceb3b422b6557a43d6bbaceabd21eb520df4fe7d9daa27f3cfed514c7c7b3b5273e39fdaa2b15623f4393b42aeb7c7e8727684a469ba9bac52e88c9145d2e8254dd45d104dd4dd62883205761cf5fc1cb471f5caafd69171d5d873d7f071d1c7d72abf5a458cbd8d4fae400ed0bb16967f32da26fab547dcc5c6c6f0bb1e96bf32ba25fab547dcc4cbd84f2b8f5d761aefe0ab86ff589ff0073d71c5d86bbf82a61bfd627fdcf4cfe7fa4720ba5d608b6cb2badf29fc522ed5595893d122ed4aad174b9b5afb142220897517412975175082495174440450b6431995d61b1a3794130c4643b76346f293cc1c3523d918fb527945b938b6307dab424516f86201bcacbb18370e948621abca4bb18370e95ae794caeb9d8d1b82a134ae95d73b0701d0b5a2233b145d14202222028444044440444405088882228280542220222202b355e443eeaacacd57910fba82b2222022220dd4be90c584de75fda5674be90c584de75fda50f8c1111059a2f38ef75575628bce3bdd55d0f8844440444404444044440444405663f4397b5565663f4397b5162b222222d50f9c77baabadf43e71deead087c10222094517528a296796ded0a14b3cb6f6841b6b3d21df05a56eacf4877605a5215668f7c9eeaaeb7d1ef93dd5a028bf052a11544ace1f3aced0b5ad909f1aced0833aaf487ad575b6abd21eb52915b69bcfb3b527f3f276a8a6f3eced49cf8f7f6aa31bab119fc524ed0ab2b11fa1c9da12ac6952b1ba9076a22516eabb096c001b06e5a1454dd2eb748073588d85efbd6941374ba81bd6eac004db0002c3720d775d873d7f071d1c7d6eabf5a45c702ec59eff83868dfeb755fad22c65ec59f5c801da1762d2d7e65744bf56a8fb98b8d83b42ec7a5bfcca6893ead51f73132f613cae3b75d8abbf82a61bfd627fdcf5c6eebb1d77f053c37fac4ff00b9e99fcff49f5c7ae9758dd16d96575be43f8a45daab2df2fa245da515a6ea2e888822284128a2ea2ea894ba8baca28dd2bf55bf13d082628ccafb0ddc4f42d93ca037928bc91bcf4a4d2358de4a2ddc4f4aad7454add0c435794976463ed5104408e524d918fb5633ca65774346e0a213ca65774346e0b5a28ba208a1151b6291ac043a30fbf4acf978fd435574ba86d63978fd4b5472f1fa86aae8ae976b1cbc7ea1a9cbc7ea1aaba268dac72f1fa96a72f1fa96aae89a4dac72f1fa96a8e5e3f50d55d1346d63978fd4353978fd43557509a4dac19e3f50d4e5e3f50d5591346d67978fd4353978fd4355644d1b59e5e3f50d4e5e3f50d5591346d67978fd4356b9e5e5756cdd50362d4886c44440453636bdb66eba841ba97d218b09bcebfb4ace97d218b09bcebfb4a1f1822220b345e71deeaaeac5179c77baaba1f108888088880888808888088b6c10994f4346f28104465774346f2b29e51abc9c5b183ed49e51abc9c5b183ed5a1144444459a2f38ef75575628bce3bdd5590f8c914294040888254b3cb6f6858ac99e5b7b422b6d67a43be0b4add59e90ef82d290ab147be4f75575628f7c9eeaae8a9ba284444ace2f3aced0b059c5e759da106755e90fed5aaeb65579f7ad4856ea6f3eced5151e7e4ed4a6f3eced49cf8f7f6a8bf182b119fc4e4ed0abab11fa1c9da108d09c5420de15166b7cf7c02d175bab4f8e1ee85a2e90ab321fc522ed5a2eb74be87176955c6d291598da559ac61337c02ce8a98cae0bd4b3009ea9e79185f210d048634bac3e0b372d2c9b78c2c20aec39f1ae6fe0e1a37d6045eaea88b8de0992c55bc83a33a0143266ccf8e34795a8fc26c46e1f5cfe0c68dfaa4ecd9b5db86cb95e2f4b39f6bf3ce311ba4885160f46393a0c3e3b0640cdd7206c2e200b9dc370d8b1be566be2eb51e146f0bb2696ff329a24fab547dcc543457a3ca1a8c2a4ce99fa434393a8ceb358eb87e20f076318379693b366d71d83891e7f4aba41abcfb8cc5218194383d134c387d046006c11ec1b6db358802fc05801b02b7fb6535f13c8f14bb1d6b49fc14b0e2012066275c81bb63d71abae93a25d23b72b0a9c0b31537ca793b12bb6b289e35b93bec323074eeb8e3604588055ce5d6e18b9c22e8da59d1b9ca829f1bc02a3e54c9f88d9f475d19d6d4bee8e43d3d078db81042e6f75ac6cca6e259a4ab121fc522ed2ab5d6f97d122ed4469ba5d628a89ba5d425d01145d64c639ee0d68b9282636191faadff00e16e96411339288edf9ce491e20672711f0be739565016e8220e1af26c8c7da90441c0be4368c71e958cf37286cd1660dc102794c86c36306e0b55d422ba41116e63612c05ef21dc45906945bf569fd63bb93529fd63bb945d2ba2b1a94feb1ddc9a94feb1ddca9a5745bf529fd63bb93520f58eee4da69a116fd483d63bb93529fd6bbb93669a142b1a94feb5ddc9a94feb1ddc9b34ae8ac6a53fac77726a53fac77726d34aca16f7b610d25b238bb80b2d08088880888808888088880b6c10990dcec60de52084c86e76306f2b29e6046a47b231f6a293ca08e4e3168c7dab422223752fa43161379d7f6959d2fa43161379d7f6943e3044441668bce3bdd55d58a2f38ef755743e21111011110111101116d821321b9d8c1bca0410990df7346f2b29e50472716c60fb5279811c9c7b231f6ad08a22222088882cd179c77baab2b345e71deeaac87c14a8441922c54a0952cf2dbda14296796ded083755fa43be0b4adb59e90ef82d5748b5628f7c9eeaae372b147be4f75571b90111101670f9d6768582ce2f3aced0833aaf3ef5a96caaf487ad5750add4de7d9daa27f3f276a5379f676a4fe79fda8bf1ad598cfe272768559588fd0e4ed0ad234291bd62a46f4458adf3dfd90b42dd5a7c77c02d17522d5997d122ed5a63f296e97d122ed55c1b1483d4600c6ba46dedbd7ecdca513304c9f810c1432186a6984f3d5361e50cb2d81d536f6923e160bf10e1957c9381baeb195b4a58f65ec38c184d7ead31dbc948c6c818789008d8b87f2636bae35eff00f09c964965c0d934ae61e6a6475283e046f27cab749da3e0b9be8ef216175187d4673cf73b69728d0bc8115fc3ae941f36d036dafb0db693b0585caf339af35566395b2d662352fa8a993ca7bced3d03d83d817aacd926bfe0c5955dd38dcfff00bc925c6485b1e3f4a9a44aecf98ac64c628704a31c9d061d1d832060160481b0badc7701b06cdfe19422ef249351cadda5142c98c2edc151daf44157513e84f4ab4334cf928e0a38e58a179bb237b849ace68e04eab4f680b8993b4aed5a1c85cdd1269685bcac3e1fba55c66489cd2762c63f956af91aeeb7cbe87176ad0d6973835a2e4adf5366451c57bb9bb4ad32af7444550444682e700d172504b1a5ee0d68b92ac3dc29d85919bc87ca774239c2999aadb194ef3d0aa937dea7abe175ba08b5eee7ec8c6f3d2a208b5eee71b4637949e6d7b3582d18dc10279b943aadd8c1b82d288aa089750826ea1110111101111011145d04a8444411145d01422202222022220222b1142d0ce526d8de03a505745635a9bd5bbbd4eb537ab777a1a565b6088c86e76306f2b3d6a6f56eef5134dacd0c60d560e1d28a4f3070d48f6463ed5a1111044441ba97d218b09bcebfb4ace97d218b09bcebfb4a1f1822220b345e71deeaaeac5179c77baaba1f10b64713a4bea0bd96b5669b64535baa8463cd65eafda9cd65eafdab56bbbaceef4d77759dde874dbcd65eafda9cd65eafdab56bbbaceef4d77759dde874dcca57eb78cf05bc4dd44f3023523d918fb56a2e71162e36ed58a1b11110111101111059a2f38ef75565668bce3bdd5590f822220222209bac99e5b7b42c1651f96ded0837567a43be0b4add59e90ef82d290ab147be4f75681b96fa3df27baaba2a5145d4a02ce2f3aced0b059c5e759da106555e90f5a96da9f3ef5a90ad94de7d9da93f9f7f6a5379f676a5479f93b53eafc6175623f4393b42acac47e8727684a4685237ac6ea41da88b15be7be0157562b41e543b811b0aaea42ac4be89176ad0ac3c13471db6d8ed5592159b5e5bb95ba6ac923778276711d2a8ab5471eb3c2558fa0f81d3b7948ae5a778e85d5f3252b8fe0c99563b6d18d4e7ff003979fc8196e7c7316a5a0a36b4cd50f0c1adb87493ec02e57e89c73473435d90a9726d062cc388514efaa88c9116b6592ce2e67b0784771365c33cf563acc5f8b2684b0ad2bd763f834949512c3286b248dc58e69de08362179b9291c1de533bd76976e7715760bb97dcc2a879670165f361a57078f099debd86576b22aa85f2ea3dad7025b7de01da14caae31dd7457a3fc661d19e7189f44637e3746c65231ee0d74960fdb63b81d616bdaeb81661c067c3eb26a6a885f15444e2c7b1e2c5a46f042fdb0c3163ae8718c32aa9e4a1746c314bcaea9a5b795b3a7d87e2bf38e9df19c3b12ce588d4e16f649190c8cc8ddce2d6805c3a7b7d8bcf8656d74b269c42a40a4bb59b643bcf42a04dd5baf3790aa6bd51c6a6e8a148049b0da554002e20017255936a665858ca7ec416a665f6194fd8ab1249249b92a2f8137373b4ad9045ca1bbb6306f290c5ca1b9d8c1bca99e60e1a918b463ed409e5d7b319b231b874ad2a115d226e8d05ce000b928d69738068b92ac92da66d858ca779e8418f3493a5bde9cd64e96f7ad04926e4dca84558e6b274b7bd39ac9d2def55d111639ac9d2def4e6b274b7bd57441639ac9d2def51cd64e96f7aaf74436b1cd24e96f7a73493a5bdeaba222c73493a5bde9cd24e96f7aaf751741639ac9d2def51cd24e96f7ad08837f3493a5bde9cd24e96f7ad088373e99ec69712db0f6ad0888088ac43106b79497c9e03a502189ad6f2936c6f01d2b5cd2995d73b0700934a6575ceee03a16b40445205cd86f4108ac0a57db6b9a0f45d4f3577599de9b34ac8b64d118880e20dc5f62d68088883752fa43161379d7f6959d2fa43161379d7f6943e3044441668bce3bdd55d58a2f38ef755743e2159a6f333fbaab2b34de667f752ac5644444111101111011110111101111059a2f38ef75565668bce3bdd5590f822220222202c99e5b7b562b26796ded41b6b3d21df05a56eacf4877c16842ad51ef93dd55958a3df27baaba1f12888826eb38bceb3b42d6b387ceb3b420cea7cfbd6a5b6a7cfbfb56a456ca7f3eced513f9e7f6a9a7f3eced513f9e7f6a1f182b11fa1c9da15756201af049183e11da12ac5744208363b084445886405bc94be49dc7a16a963744eb1ddc0f4ac1588646c8ce4a5fecbba117d610cc62774b4ef0b39a21abca45b587ec5aa58dd1bcb5dffca9865313ba5a7784185d5ca1786bc2d3344357948b6b0ef1d0b531c5a6ea1e3afe8c3340cb98fd0e221824103eee65edacd20822fd84aefb88693b26d36ae2f055d655d542c71a7a13116ea3dd7dee22c379e277f15f8d296bdd1ee2adc98abdcdb6b15c72fe2dd7499bea66cc48e218855554a47293c8e95f6dd77124fdebc8ca6ee2b7d4d49909daaa12bb6334c6576c9a6c57d3a0ac311162be5290484b3692e9ece2c7e564258247069de2fb0af9788624e9af72be172aee92a0b89de5498c5b93395faeebad6a116994efdcac802999acedb29dc3a118d14ecd778bc87c96f42acf717b8b9c6e4a8be0e7171249b92b6411194ed3668de52088caee868de5653ca08e4e2d918fb55113ca1c3523d918fb569444414b41738068b928d69738068b92ac12da66d9b6329de7a10492da66d9b6329de7a155249373b4a137373bd10111101145d110ba22202228412a2e8a10111101111011110111598620c6f2b36ee03a502189ac6f2b3793c074ad534ae95d73bb80e849a574aeb9ddc0742d68088a4024d86d2800126c369565a1b4cdd6758ca770e8520369997758ca770e8555ce2e712e372517c4b9c5ce25c6e4ac5111166b3ca67baab2b359e533dd55921444441ba97d218b09bcebfb4ace97d218b09bcebfb4a1f1822220b345e71deeaaeac5179c77baaba1f10acd37999fdd55959a6f333fba9562b2222208888088880888808a52c82114d94d906fa2f38ef755656a8878c77bab46aa2b045b3554862269a94ada23522345d34d94b0786ded0b7889671c3e1b7b426cd35d60fc61df05a2c57d2ab82f3bbe0b58a7f629b5b1aa8c1bc9eeaafaa57d7a3a6db26cf9ab50a5f626cd3e76a94d52bea0a4f62cdb45ec4d9c5f2750a96b5cd7023785f65b45ec59b682fc1392f17cc745ce5baec16906f1d2ab726e1c0af431d016b816ec2ad1c30543759adb48378e95392f17966b1ed7070d842b2e839c335982d20de3a57dc1859ea95b63c2dcd707341b85391c5e57917742c9b13da4117042f64706e5dbaec659fc45960dc15dd43dc9cce0f32fa7350cd760b48378e955b907742f69160cf6b816b4dfb1587e00656f28c66df9c2c9cd78bc1f20ee84e6eee85ee4600e3f316c6e5d79f989cce0f191c466672720f08792e5a1f49231c5ae69b85ef5b96e4e0c2adb72dbe766ab9875c6e36dea733839d431c913b75da778e95b4d2c24deef17e002f79fb95981b18cdfb148cab2fab3dc9cce0f03cd22eb3fb94f358bacfee5efc6549bd51ee53fb939bd51ee4e67173ee690f59fdc9cd21eb3fb9741fdc9cdea8f727ee4e6f547b939af173ee690f59fdc9cd21eb3fb97bf39526f567b941cab3708cf72734e2f03cd21eb3fb939a43d67f72f7dfb93a83ba07ffe12b17654a81be223b7627338bc173587acfee52d86288eb3759ce1b810bdc3b2c48dde1ab53b2eb870fb1391c5e1248def7173b692b28691f23b759a3795ee1b975ce75b54db89b289b0721bc9c6c21a37fb55e67078a9c1d5e4e21660fb557e45dd0bd9bb0523e6ad6ec188f9a9c938bc8724ee84e49cbd59c20f5560ec28f555e47179b8898d8ed56f867e72d458ebdcef5e95d867b16b761d6e09c8e2f3ba8ee84d42bef9c3fd8b59a0f62724e2f87aa546a95f68d17b16068fd8af24e2f91aa5354afa8693d8b034bec4d9c5f3ac54595f34fec581a7f62bb4d296d4b156cc0b130a6cd2b22b0625898d0d3422dda8b12d44d35a2cf553550608b2d556228846de526ddc1bd28691144d637959b7701d2b54d2ba575ddbb80e8499ee91d777c0742c2c8211148049000b92800126c36956806d336e6c653b874200da66dcd8ca78742aae71738971b928be0e71738971b92a111104459318e7b835a2e506facf299eeaacac5691aed00dc8162aba42888883752fa43161379d7f6959d2fa43161379d7f6943e3044441668bce3bdd55d58a2f38ef755743e2159a6f333fbaab2b34835992b46f23604ab159149041208b10a11044440444405214220c9162a5064a42c2e97417287ce3bdd2b405b288f8c77baabeb22edb810b2042d1ac9ac86d6410b3042a9afed522445dae8216c8c8d66f6af9fca159b26b3813d2a68dbead491cbbbe0b1690a8d45487cc5cd370b0139534bb7dca3736eff007562d7357cea3a83793dd5a4549e9534bb7db6b9ab6b5cc5f08559e9590ac3d29c4dbd0b5ec5b58f67b179b15a7a5662b8f4a9c5793d43248fd8b7c5346d2082015e4c579e9590c44f4a715e4f6e1f0ccdd66d83c6f1d2a592c437d978b6628e69043ac42b5f2972edd661b48378e9538af27b386a226381045d5e1353c8dd765b5b885ce462ae1b2e56c8f197b1c0b5ca71a728e8b1d4c038ab94f5d031c0dfb76ae6eec54c8ce52376de2d5a8634e1f39389ca3adf3ba5d50f691aa77fb16f8b10a31bf57ec5c8e1c7df1bb6b8969de16c9718732ce63aec3b94e2bc9d922c4e806f0cee0aec38ae1a2de030ff00642e1831f906e7ac866197d61ef5381ca3f42418ae1528db047ac3e88daaec38860e3cb829fe2405f9bff7432fac777a0cc3275cf7a703947e9c8b15cba3ce414e7b0956598d6541e55231dd84afcb7fba293ae7bd4fee8a4eb9ef53fe33947ea4763b94adb30eef916a763b963e6e1d1fc64257e60fdd149eb0f7a7ee8a4eb9ef4ff8ce51fa624c7b00f9945037b0ff009aa7363784bbc9606f6380fd8bf397ee864eb9ef51fba193ae7bd3fe339477f9f13c29fc0ffe3ff82a32d5e147737ed0b869cc1275cf7ac4e3efeb95781ca3b44b51871ddb3b953925a027ca03e0172138ebfae7bd6271c7f5cabc29ca3aa54565001a91bb6713abbd5092a293838772e7071b77596071977595e2728e8124f4bc1cdee5a8f22e6ddae658af04717775960716775938d4e51ee5ec8f83a3ef55dec67599debc59c55dd6589c4cf4abc6a728f5cf8dbd6677ad2f8c74b3bd7943891e9581c40f4a71a728f4ef8874b3bd69745ed677af366bcf4ac0d71e9578d393d13a2f6b7bd6a743ed6f7af806b4f4ac0d59e94e35393eeba13d2def5a9d01e96f7af8a6a8f4ac4d49e9578a728fb0ea73d2cef5add4eee9677af926a0f4ac4ce55d1b7d4753bba59deb034eee9677af9a662b13295749b8fa2699dd2cef581a6774b3bd50e50a82ff006a6937178d33ba59deb134afe96f7aa5aea359346e2e1a57f4b3bd63cd5fd6677aa9ac9aca9b8b8d89b0ddf3106db80e2abcd2195d777c0742d574ba6936c941517508895b6195b1871d5bbf815a5104b9c5ce25c6e4a84440445b6184ca7a1a379418c51ba4759bf13d0b7be46c2d2c876bb8b9632cc1ade4e1d8de27a55745f12b7410eb0d790da31f6a98611abca4bb183ed584f3190d86c60dc10632b9ae792c6eab5608888dd4be90c584de75fda5674be90c584de75fda50f8c1111059a2f38ef75575946f31bc39ab7491b656f2916ff9cd455652d716b8169b10a11116c86d4b6e2c251f6aaa4104822c4234969041b10ad78352de0251f6a2faa88a4820904588508822220222202222022220b345e71deeaacb6412724e26d7b8b2d680888808888088882514220b347be4f7557badf48e01ee04db58582d5246e8ddaae45f8c6e52e5422226e52e542209d62a758ac51065ac54b64731c0b4d8858220ba4f396eb3364a378e95575dc0d8deea18e2c70734d88565c1b52dd66d84a378e945f5aa2a87c6e0e69ff8adf2f8c672b17f69bd0a9916363bd65148e89f76fc474a1b65ca1e95ba0a92dbb1fb633bfd8b19a36bdbcac5bb88e855d0f16a4648d77817734ee216369ba8fee5a9b348d0035e400b2e712f5ca1b6769ba8fee4b4dd47f72c39c4bd729ce25eb950db3b4dd47f725a6ea3bb961ce25eb94e5e5eb9436ced3751ddc969ba8fee5872f2f5ca72f2f5ca1b6769ba8fee4b4dd47f72c39797ae539797ae50db3b4dd47f725a6ea3fb961cbcbd729ce25eb9436cad3751ddc969ba8eee58f3897ae539c4bd72a9b65ab3751ddc9ab2f51ddcb1e712f5ca73897ae50db2d597a8eee51a92f51ddcb1e712f5ca73897ae53b36cb525ea3bb946a4bd477728e712f5ca73897ae504ea4bd477728d497a8eee4e712f5ca73897ae50e8e4e5ea3bb939397a8eee4e712f5ca73897ae50e8e4e5ea3bb939297a8eee4e712f5ca73897ae50e91c94bd477727252f51ddca79c4bd729ce25eb943a47252751ddc9c949d477729e712f5ca73897ae50e91c949d477727232751ddca79c4bd729ce25eb943a47232751ddc9c8c9d477729e712f5ca73897ae50e91c8c9d477727232751ddca79c4bd729ce25eb943a47232751ddc9c8c9d477729e712f5ca73897ae50e91c8c9d477727232751ddca79c4bd729ce25eb943a47232751ddc9c8c9d477729e712f5ca73897ae50e91c8c9d477728313c0b96380ec5973897ae543a691c082e24144e9ad111064cd5d71af7d5e365b669b586a4635631f6ad0880ac45135ade526d8de03a54c71b626f2937c1ab54b23a575ddf01d08be134a6576dd806e0b5a2df0c20b4be43aac1f6a27ad08ac6ad375dfdca7569baefee4d9a614be90c584de75fda56f8cd3b1e1c1eeb8f62d1210e91c46e25158222220b38e4746ed66ac1105a9236ccde522dff39aaaace37ba376b34adf231b337948bcaf9cd45f5554b4969041b10a11116fc1a96f0128fb55520b49045884692d20836215af06a5bc04a3ed45f55114b8169208b10a1104444044440444404444044440444404444044440566391b33793977fcd72ac8833963746ed570ff008ac1598a46cade4e6dff0035cb134d282406dc74dd0d3422ddcda5ea7da9cda5ea7da869a516ee6d2f53ed4e6d2f53ed434d28a5cd2d710e16214202c9ae2d702d362162882db836a5bacdb0946f1d2aa916363bd1ae2d702d36215921b52dd66d84a378e945f5a6194c4eb8ddc474ad93441cde562f2788e85a0820d8ef59c32989d71b41de111ad15a740d90ebc4f6869e07828e6a7aecef4dae959159e6a7aecef4e6a7aecef4da6959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd39a9ebb3bd366959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd39a9ebb3bd366959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd39a9ebb3bd366959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd39a9ebb3bd366959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd39a9ebb3bd366959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd39a9ebb3bd366959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd39a9ebb3bd366959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd39a9ebb3bd366959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd39a9ebb3bd366959159e6a7aecef4e6a7aecef4d9a5645679a9ebb3bd62fa72d6976bb4dba0a6cd34222202b4c636068925daee0d58c263899ca1f09fc0742d2f7b9ee2e71b945f13248e91dace2b045be084386bc9b231f6a27a41102394936463ed58cf2990ecd8d1b824f2990d86c60dc16a404444044440444404444059c6f746ed66958220b5231b337948bcaf9cd555671bdd1bb59a76adf231b3b7948bcaf9cd45f5554b4969041b10a11116fc1a96f0128fb555702d2411621012d20836215af06a5bc04a3ed45f55114b8169208b10a110444404444044440444404444044440444404444059f28febbbbd608833e51fd7777a728febbbbd608833e51fd7777a728febbbbd60882db4b6a5baaed928dc7a556734b5c438588500d8dc6f565a5b52dd576c946e3d28beaaa2c9ed2c716b858858a20a5ae2d702d36214220b6436a5b76d84a378e9554820d8ec28d716b8169b10ad10da96ddb6128de3a53c5f551149041b1d8542208888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088880888808888088b7410ebf84fd918de504c10ebf86fd918de7a544f37286cdd8c1b824f36bd9add8c1b82d280888808888088880888808888088880b38dee8dc1cd3b560882d48c6cede522f2be735555946f746e0e69daac3d8d9dbca47b1e3ca6a2faaaa4120820d8850888b3ce9dc5ad27a6c9ce9dd46772ac89a36b3ce9dd4677273a77519dcab2268dacf3a77519dc9ce9dd46772ac89a36defa82f616ea345fa02d088808888246d3b15873190c475c032386c1d0a6368a7672920bbcf921577b8bdc5ce372517c628888822220222202222022220222202906c6e14220b4d736a5baafd920dc7a557734b5c5aede14036370876ef41088880a5ae2d702d36214220b26a18edaf89a5dc4a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1a9cbc7ea1aab2268dacf2f1fa86a72f1fa86aac89a36b3cbc7ea1ab09a63200d035583805a510d88888088880888808888088883fffd9, 'AN', 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=89 ;

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
(12, NULL, NULL, NULL, '1', '2018-01-30 14:06:43', '2018-01-30', '14:03:00', 9, NULL, 'No tiene fuerza para levantar la carga', '14:03', 'C', 0, '2018-02-08', 'ok\r\n', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(13, NULL, NULL, NULL, '3', '2018-02-05 19:01:38', '2018-02-05', '18:59:00', 9, NULL, 'bateria descargada\n\n', '18:59', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(14, NULL, NULL, NULL, '1', '2018-02-05 19:42:17', '2018-02-07', '05:41:00', 9, NULL, 'fhjh', '05:41', 'AN', 0, '2018-02-08', 'Trabajo OK ', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(15, NULL, NULL, NULL, '1', '2018-02-05 19:46:36', '2018-02-17', '05:41:00', 6, NULL, 'ggggjffufjffg', '05:41', 'T', 0, '2018-04-11', 'TERMINADO CON EXITO', NULL, NULL, NULL, 'assets/files/reclamos/15.jpg', 6),
(16, NULL, NULL, NULL, '1', '2018-02-07 12:36:19', '2018-02-16', '12:35:00', 7, NULL, 'fff', '12:35', 'AN', 0, '2018-02-08', '', NULL, NULL, NULL, 'assets/files/reclamos/16.jpg', 6),
(17, NULL, NULL, NULL, '1', '2018-02-08 14:38:14', '2018-02-08', '14:35:00', 10, NULL, 'Ruido en cuerpo de bomba int 0057A', '14:35', 'T', 0, '2018-04-11', 'lista la solicitud', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(18, NULL, NULL, NULL, '1', '2018-02-08 14:46:00', '2018-02-08', '14:45:00', 6, NULL, 'Gets con desgaste excesivo', '14:45', 'C', 0, '2018-04-10', 'CONFORMIDAD', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(19, NULL, NULL, NULL, 'hugo gallardo cloud', '2018-04-11 12:56:39', '2018-04-12', '08:00:00', 10, NULL, 'solicitud de servicios prrueba coud', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(20, NULL, NULL, NULL, 'hugo de nuevo', '2018-04-11 13:15:16', '2018-04-13', '16:00:00', 10, NULL, 'sol de servicio test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(21, NULL, NULL, NULL, 'ssss', '2018-04-12 10:53:14', '2018-04-13', '08:00:00', 10, NULL, 'asdadasdas', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(22, NULL, NULL, NULL, 'ssss', '2018-04-12 10:57:40', '2018-04-13', '08:00:00', 10, NULL, 'zcxczx', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
(23, NULL, NULL, NULL, 'hugo', '2018-06-18 17:19:46', '2018-06-19', '08:00:00', 10, NULL, 'falla de equipo prueba', NULL, 'AN', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 6),
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
(73, NULL, NULL, NULL, 'Marcelo Muriel ', '2018-10-08 08:47:51', '2018-10-15', '12:00:00', 16, NULL, 'Engrase de cardan ', NULL, 'T', 18, '2018-10-15', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(74, NULL, NULL, NULL, 'Perez', '2018-10-08 11:57:58', '2018-10-24', '12:00:00', 9, NULL, 'falla fatal', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(75, NULL, NULL, NULL, '1', '2018-10-08 12:05:47', '2018-10-08', '12:04:00', 13, NULL, 'ggg', '12:04', 'S', 1, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/reclamos/75.jpg', 6),
(76, NULL, NULL, NULL, 'Marcelo Muriel', '2018-10-15 11:04:07', '2018-10-13', '10:00:00', 13, NULL, 'Equipo sin barrido, no modula el compresor. se encuentran válvula de pilotaje de ul- 88 mal conectada.\nse observa valvula ul88 con mal funcionamiento ', NULL, 'T', 18, '2018-10-14', 'Se desmonta valvula ul-88 para reparación, se encuentra diafragma pinchado y seguro zeguer faltante. se monta válvula, se regula compresor ', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(77, NULL, NULL, NULL, 'Marcelo Muriel', '2018-10-15 11:29:38', '2018-10-04', '13:00:00', 16, NULL, 'sistema de colector de polvo, en ecuentra cpu 3 con mal funcionamiento, colector de polvo fuera de servicio ', NULL, 'AN', 18, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(78, NULL, NULL, NULL, 'Roberto Sánchez', '2018-10-16 08:22:45', '2018-10-17', '08:00:00', 4, NULL, 'Ruido en motor', NULL, 'T', 1, '2018-10-16', 'Se revisa sin novedades. El trabajo queda OK', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6),
(79, NULL, NULL, NULL, 'Marcelo Muriel', '2018-10-18 06:51:35', '2018-10-19', '08:00:00', 15, NULL, 'Mangon de succión tapado ', NULL, 'T', 18, '2018-10-18', 'se destranca mangon primario. w', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(80, NULL, NULL, NULL, 'yo', '2018-10-28 10:35:21', '2018-10-29', '08:00:00', -1, NULL, 'baja potencia', NULL, 'S', 16, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(81, NULL, NULL, NULL, 'lazzarini', '2018-10-28 10:40:54', '2018-10-29', '08:00:00', -1, NULL, 'sin revoluciones', NULL, 'S', 20, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(82, NULL, NULL, NULL, 'lazzarini', '2018-10-28 10:49:05', '2018-10-29', '08:00:00', 13, NULL, 'baja vueltas', NULL, 'T', 20, '2018-10-29', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(83, NULL, NULL, NULL, 'lazzarini', '2018-10-28 11:40:53', '2018-10-29', '08:00:00', 14, NULL, 'baja vueltas', NULL, 'S', 20, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(84, NULL, NULL, NULL, 'lazzarini', '2018-10-28 15:13:17', '2018-10-29', '08:00:00', 14, NULL, 'baja revoluciones', NULL, 'S', 20, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(85, NULL, NULL, NULL, 'Julio Medina', '2018-10-29 12:19:32', '2018-10-29', '15:30:00', 14, NULL, 'Reemplazo compresor aire acondicionado.', NULL, 'S', 20, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(86, NULL, NULL, NULL, 'Julio Medina', '2018-10-29 12:39:49', '2018-10-29', '15:30:00', 14, NULL, 'carga de aire acondicionado', NULL, 'T', 20, '2018-10-29', 'ok', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(87, NULL, NULL, NULL, 'lazzarini', '2018-10-29 16:41:24', '2018-10-30', '08:00:00', 13, NULL, 'chequeo', NULL, 'S', 20, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7),
(88, NULL, NULL, NULL, 'Marcelo Muriel', '2018-11-01 06:48:13', '2018-11-01', '08:00:00', 16, NULL, 'Mordazas de mesa de quiebre en mal estado. ', NULL, 'S', 18, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 7);

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
(1, 'mmmm', '4253133', 'desamparados', 1, 'Casa central', 'AC', 6),
(2, 'algun lugar', '235040', 'capital', 2, 'sucursal de capital', 'AC', 6),
(3, '1', '1', '1', 1, 'Conteiner de Mina Chinchillas', 'AC', 7),
(4, '1', '1', '1', 1, 'Taller de General Guemes', 'AC', 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=40 ;

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
(27, 13, '124', '0000-00-00', NULL, 'AN', 250, 0, 7, NULL),
(28, 1, '1', '0000-00-00', NULL, 'C', 1233, 0, 6, NULL),
(29, 9, '111', '2018-10-25', NULL, 'C', 200, 0, 6, NULL),
(30, 13, '125', '2018-10-09', NULL, 'AN', 2, 0, 7, NULL),
(31, 13, '116', '2018-10-19', NULL, 'AN', 200, 0, 7, NULL),
(32, 9, '111', '2018-10-18', NULL, 'AN', 30, 0, 6, NULL),
(33, 13, '229', '2018-10-24', NULL, 'C', 120, 0, 7, NULL),
(34, 15, '198', '2018-10-14', NULL, 'AN', 70, 0, 7, NULL),
(35, 13, '119', '2018-10-12', NULL, 'AN', 300, 0, 7, NULL),
(36, 1, '9', '2018-10-22', NULL, 'C', 30, 0, 6, 5),
(37, 1, '1', '2018-10-22', NULL, 'C', 34, 0, 6, 0),
(38, 1, '1', '2018-10-22', NULL, 'C', 3, 0, 6, 5),
(39, 1, '15', '2018-10-26', NULL, 'C', 5, 0, 6, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=70 ;

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
(69, 64, 2, 12, 1, '2018-07-22', '2018-07-22', 1234, 'E');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tbl_detavaledescarga`
--

INSERT INTO `tbl_detavaledescarga` (`detavaledid`, `valedid`, `herrId`, `observa`, `dest`, `id_empresa`) VALUES
(1, 1, 4, NULL, NULL, 6),
(2, 2, 103, NULL, NULL, 7),
(3, 3, 95, NULL, NULL, 7),
(4, 4, 95, NULL, NULL, 7),
(5, 5, 95, NULL, NULL, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

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
(16, 12, 0, NULL, NULL, 7),
(17, 13, 0, NULL, NULL, 7),
(18, 13, 95, NULL, NULL, 7),
(19, 15, 95, NULL, NULL, 7),
(20, 16, 2, NULL, NULL, 6),
(21, 17, 29, NULL, NULL, 6),
(22, 17, 126, NULL, NULL, 6),
(23, 18, 86, NULL, NULL, 6),
(24, 18, 16, NULL, NULL, 6),
(25, 19, 96, NULL, NULL, 7),
(26, 20, 95, NULL, NULL, 7),
(27, 21, 95, NULL, NULL, 7),
(28, 22, 95, NULL, NULL, 7),
(29, 23, 95, NULL, NULL, 7),
(30, 24, 2, NULL, NULL, 6),
(31, 25, 95, NULL, NULL, 7),
(32, 26, 95, NULL, NULL, 7),
(33, 27, 95, NULL, NULL, 7),
(34, 28, 95, NULL, NULL, 7),
(35, 29, 95, NULL, NULL, 7),
(36, 30, 95, NULL, NULL, 7),
(37, 31, 95, NULL, NULL, 7),
(38, 32, 95, NULL, NULL, 7),
(39, 33, 95, NULL, NULL, 7),
(40, 34, 95, NULL, NULL, 7),
(41, 35, 95, NULL, NULL, 7),
(42, 36, 95, NULL, NULL, 7),
(43, 37, 95, NULL, NULL, 7),
(44, 38, 95, NULL, NULL, 7),
(45, 39, 160, NULL, NULL, 7),
(46, 40, 95, NULL, NULL, 7),
(47, 40, 161, NULL, NULL, 7),
(48, 41, 96, NULL, NULL, 7),
(49, 41, 160, NULL, NULL, 7),
(50, 42, 95, NULL, NULL, 7),
(51, 42, 160, NULL, NULL, 7),
(52, 43, 95, NULL, NULL, 7),
(53, 43, 160, NULL, NULL, 7),
(54, 44, 95, NULL, NULL, 7),
(55, 44, 161, NULL, NULL, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=121 ;

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
(113, 549, 'Cambio de vidrio lateral de cabina ', NULL, NULL, 'RE'),
(114, 606, 'cambiar cpu 3 y flasjar equipo ', NULL, NULL, 'RE'),
(115, 606, 'Cambio cpu3', NULL, NULL, 'IN'),
(116, 607, 'Carga de acumuladores ', NULL, NULL, 'RE'),
(117, 628, 'reemplazo guias de acero mesa', NULL, NULL, 'C'),
(118, 645, 'reemplazo de filtro', NULL, NULL, 'C'),
(119, 653, 'reemplazo compresor aire acondicionado', NULL, NULL, 'C'),
(120, 654, 'reemplazo compresor aire acondicionado', NULL, NULL, 'C');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `tbl_lote`
--

INSERT INTO `tbl_lote` (`loteid`, `codigo`, `fecha`, `cantidad`, `artId`, `lotestado`, `depositoid`, `usrId`, `id_empresa`) VALUES
(1, NULL, '2018-10-25', '37', 2, 'AC', 1, NULL, 6),
(2, 'cod002', '2018-10-24', '98', 10, 'AC', 1, NULL, 6),
(3, NULL, '2018-10-25', '36', 10, 'AC', 2, NULL, 6),
(4, '54411', '2018-10-27', '100', 149, 'AC', 2, NULL, 6),
(5, '333', '2018-10-27', '34', 273, 'AC', 1, NULL, 6),
(6, 'P164699', '2018-10-27', '3', 274, 'AC', 4, NULL, 7),
(7, '57516098', '2018-10-27', '6', 275, 'AC', 4, NULL, 7),
(8, 'P182042', '2018-10-27', '7', 276, 'AC', 4, NULL, 7),
(9, 'P551808', '2018-10-27', '8', 282, 'AC', 4, NULL, 7),
(10, 'P551311', '2018-10-27', '8', 286, 'AC', 4, NULL, 7),
(11, 'P564425', '2018-10-27', '6', 287, 'AC', 4, NULL, 7),
(12, 'P165672', '2018-10-27', '2', 288, 'AC', 4, NULL, 7),
(13, 'P181054', '2018-10-27', '6', 289, 'AC', 4, NULL, 7),
(14, 'P520620', '2018-10-27', '2', 290, 'AC', 4, NULL, 7),
(15, 'P552055', '2018-10-27', '6', 291, 'AC', 4, NULL, 7),
(16, 'P550900', '2018-10-27', '6', 293, 'AC', 4, NULL, 7),
(17, 'SC 90270', '2018-10-27', '6', 292, 'AC', 4, NULL, 7),
(18, '57569758', '2018-10-27', '2', 294, 'AC', 4, NULL, 7),
(19, '27KZ1', '2018-10-27', '2', 295, 'AC', 4, NULL, 7),
(20, '50717', '2018-10-29', '15', 102, 'AC', 8, NULL, 6),
(21, '57451890', '2018-10-29', '0', 296, 'AC', 4, NULL, 7),
(22, '88257429', '2018-10-29', '1', 297, 'AC', 4, NULL, 7),
(23, '57364366', '2018-10-29', '1', 298, 'AC', 4, NULL, 7),
(24, '3128 0829 07', '2018-11-01', '2', 299, 'AC', 4, NULL, 7),
(25, '3222 3113 62', '2018-11-01', '2', 300, 'AC', 4, NULL, 7),
(26, ' 0211 1963 16', '2018-11-01', '16', 301, 'AC', 4, NULL, 7),
(27, '0211 1960 85', '2018-11-01', '0', 302, 'AC', 4, NULL, 7),
(28, '1626 1052 81', '2018-11-05', '2', 303, 'AC', 4, NULL, 7),
(29, '3222 3277 88', '2018-11-05', '1', 304, 'AC', 4, NULL, 7),
(30, '3222 3208 86 ', '2018-11-05', '1', 305, 'AC', 4, NULL, 7),
(31, '2653 1264 47', '2018-11-05', '1', 306, 'AC', 4, NULL, 7),
(32, '3222 1488 00', '2018-11-05', '2', 307, 'AC', 4, NULL, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=65 ;

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
(64, '2018-07-22', 1, 6);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tbl_tipoordentrabajo`
--

INSERT INTO `tbl_tipoordentrabajo` (`id`, `tipo_orden`, `descripcion`) VALUES
(1, 1, 'Orden de Trabajo'),
(2, 2, 'Solicitud de servicio'),
(3, 3, 'Preventivo'),
(4, 4, 'Backlog'),
(5, 5, 'Predictivo'),
(6, 6, 'Correctivo Programado');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `tbl_unidadmedida`
--

INSERT INTO `tbl_unidadmedida` (`id_unidadmedida`, `descripcion`, `estado`, `id_empresa`) VALUES
(1, 'Unidad', 'AN', 7),
(2, 'Litro', 'AC', 7),
(3, 'Metro', 'AC', 7),
(4, 'Kg', 'AC', 7),
(5, 'm2', 'AC', 7),
(6, 'm3', 'AC', 7),
(7, 'unidad', 'AC', 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tbl_valedesacarga`
--

INSERT INTO `tbl_valedesacarga` (`valedid`, `valedfecha`, `usrId`, `respons`, `dest`, `id_empresa`) VALUES
(1, '2018-07-02 00:00:00', 1, 'Hugo G', 'Destino 01 prueba', 6),
(2, '2018-10-08 00:00:00', 18, 'Rodriguez Guillermo ', 'mina chinchillas ', 7),
(3, '2018-10-12 00:00:00', 18, 'Marcelo Muriel ', 'Mina ', 7),
(4, '2018-11-03 00:00:00', 18, 'Muriel Marcelo ', 'Conteiner mina chinchillas ', 7),
(5, '2018-11-03 00:00:00', 18, 'Muriel Marcelo ', 'Conteiner mina chinchillas ', 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

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
(11, '2018-10-11', 18, 'Muriel Marcelo/Guillermo Rodriguez ', 'Mina ', 7),
(12, '2018-10-11', 18, 'Muriel Marcelo ', 'Mina ', 7),
(13, '2018-10-11', 18, 'Muriel Marcelo ', 'Mina ', 7),
(14, '2018-10-14', 18, 'Guillermo Rodriguez ', 'Mina', 7),
(15, '2018-10-14', 18, 'Guillermo Rodriguez ', 'Mina', 7),
(16, '2018-10-22', 1, NULL, NULL, 6),
(17, '2018-10-23', 1, NULL, NULL, 6),
(18, '2018-10-23', 1, NULL, NULL, 6),
(19, '2018-10-25', 18, NULL, NULL, 7),
(20, '2018-11-02', 18, NULL, NULL, 7),
(21, '2018-11-02', 18, NULL, NULL, 7),
(22, '2018-11-02', 18, NULL, NULL, 7),
(23, '2018-11-02', 18, NULL, NULL, 7),
(24, '2018-11-03', 1, NULL, NULL, 6),
(25, '2018-11-03', 18, NULL, NULL, 7),
(26, '2018-11-03', 18, NULL, NULL, 7),
(27, '2018-11-03', 18, NULL, NULL, 7),
(28, '2018-11-03', 18, NULL, NULL, 7),
(29, '2018-11-03', 18, NULL, NULL, 7),
(30, '2018-11-03', 18, NULL, NULL, 7),
(31, '2018-11-03', 18, NULL, NULL, 7),
(32, '2018-11-03', 18, NULL, NULL, 7),
(33, '2018-11-03', 18, NULL, NULL, 7),
(34, '2018-11-03', 18, NULL, NULL, 7),
(35, '2018-11-03', 18, NULL, NULL, 7),
(36, '2018-11-03', 18, NULL, NULL, 7),
(37, '2018-11-03', 18, NULL, NULL, 7),
(38, '2018-11-03', 18, NULL, NULL, 7),
(39, '2018-11-04', 18, 'Cesar Llampa ', 'Mina ', 7),
(40, '2018-11-04', 18, NULL, NULL, 7),
(41, '2018-11-04', 18, NULL, NULL, 7),
(42, '2018-11-04', 18, NULL, NULL, 7),
(43, '2018-11-04', 18, NULL, NULL, 7),
(44, '2018-11-04', 18, NULL, NULL, 7),
(45, '2018-11-05', 1, '', '', 6),
(46, '2018-11-05', 1, '', '', 6);

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
(6, 11, '2018-10-25 00:00:00', 0, 0),
(6, 17, '2018-09-18 00:00:00', 1, 0),
(7, 9, '2018-09-17 00:00:00', 1, 1),
(7, 16, '2018-09-17 00:00:00', 1, 0),
(7, 18, '2018-09-21 00:00:00', 1, 7),
(7, 20, '2018-09-12 00:00:00', 1, 1);

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
