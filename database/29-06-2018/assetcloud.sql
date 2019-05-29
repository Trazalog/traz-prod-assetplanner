-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2018 a las 16:13:30
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `assetcloud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abmdeposito`
--

CREATE TABLE `abmdeposito` (
  `depositoId` int(11) NOT NULL,
  `depositodescrip` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `id_provincial` varchar(255) DEFAULT NULL,
  `id_localidad` varchar(255) DEFAULT NULL,
  `id_pais` varchar(255) DEFAULT NULL,
  `GPS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abmdeposito`
--

INSERT INTO `abmdeposito` (`depositoId`, `depositodescrip`, `direccion`, `id_provincial`, `id_localidad`, `id_pais`, `GPS`) VALUES
(1, 'deposito 1', 'I. de la Rosa 2345 Rivadavia', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abmproveedores`
--

CREATE TABLE `abmproveedores` (
  `provid` int(10) NOT NULL,
  `provnombre` varchar(255) DEFAULT NULL,
  `provcuit` varchar(50) DEFAULT NULL,
  `provdomicilio` varchar(255) DEFAULT NULL,
  `provtelefono` varchar(50) DEFAULT NULL,
  `provmail` varchar(100) DEFAULT NULL,
  `provestado` varchar(4) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abmproveedores`
--

INSERT INTO `abmproveedores` (`provid`, `provnombre`, `provcuit`, `provdomicilio`, `provtelefono`, `provmail`, `provestado`, `id_empresa`) VALUES
(1, ' Don Perez', '2023339814', 'dsadasdasd', '2645677', 'permauricio@gmail.com', 'AC', 6),
(2, 'Trazalog', '20-54545454-9', 'Lib. Gral S Martin 1890', '15555555', 'soporte@trazalog.com', 'AC', 6),
(3, 'Proveedor test', '20-20202022-7', 'Calle proveedor', '1777777777', 'info@proveedor.com', 'AC', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admcustomers`
--

CREATE TABLE `admcustomers` (
  `cliId` int(11) NOT NULL,
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
  `cliColor` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `admcustomers`
--

INSERT INTO `admcustomers` (`cliId`, `cliName`, `cliLastName`, `cliDni`, `cliDateOfBirth`, `cliNroCustomer`, `cliAddress`, `cliPhone`, `cliMovil`, `cliEmail`, `cliImagePath`, `zonaId`, `cliDay`, `cliColor`) VALUES
(13, 'Daniel', 'Osvaldo', '31324200', '1984-05-01', '1', 'Av La Humareda 12', '', '', '', '13.png', 10, 30, '#00a65a'),
(14, 'Mariana', 'Romero', '31324205', '2016-05-04', '14', 'Av. Simpre Viva 123', '', '', '', '14.png', 11, 15, '#f39c12'),
(15, 'Patricia', 'Moreno', '45632145', '2016-05-19', '15', 'Rogelio Funes Mori y No Fue Corner', '', '', '', '15.png', 10, 10, '#dd4b39'),
(16, 'Homero', 'Perez', '45888882', '2000-05-10', '16', 'Rivadavia 124s', '', '', '', '16.png', 12, 20, '#00a65a'),
(17, 'Mauricio', 'perez', '23339814', '2016-06-01', '17', 'dd', '26465', '026457070785', 'permaucirio@gmail.com', '17.png', 10, 30, '#00a65a'),
(18, 'asAS', 'ASas', 'ss', '2016-12-16', '18', 'sASAs', 'sss', 's333', 'permauricio23', '18.png', 10, 30, '#00a65a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admstock`
--

CREATE TABLE `admstock` (
  `stkId` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `stkCant` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `stkDate` datetime NOT NULL,
  `stkMotive` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

CREATE TABLE `admvisits` (
  `vstId` int(11) NOT NULL,
  `vstDate` datetime NOT NULL,
  `cliId` int(11) NOT NULL,
  `vstNote` text COLLATE utf8_spanish_ci NOT NULL,
  `vstStatus` varchar(2) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `descripcion`, `id_empresa`) VALUES
(1, 'proceso nuevo de area', 6),
(2, 'gemma area 1', 0),
(3, 'Industrial', 0),
(4, 'Area Nueva', 6),
(5, 'otra area 8', 6),
(6, 'area 9', 4),
(7, 'area 51', 6),
(8, 'Area Testing', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

CREATE TABLE `articles` (
  `artId` int(11) NOT NULL,
  `artBarCode` varchar(50) NOT NULL,
  `artDescription` varchar(50) NOT NULL,
  `artCoste` decimal(14,2) NOT NULL,
  `artMargin` decimal(10,2) NOT NULL,
  `artIsByBox` bit(1) NOT NULL,
  `artCantBox` int(11) DEFAULT NULL,
  `artMarginIsPorcent` bit(1) NOT NULL,
  `artEstado` varchar(2) NOT NULL DEFAULT 'AC',
  `famId` int(11) DEFAULT NULL,
  `unidadmedida` int(11) NOT NULL,
  `punto_pedido` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`artId`, `artBarCode`, `artDescription`, `artCoste`, `artMargin`, `artIsByBox`, `artCantBox`, `artMarginIsPorcent`, `artEstado`, `famId`, `unidadmedida`, `punto_pedido`, `id_empresa`) VALUES
(1, 'FERR - 0001', 'caño cuadrado', '0.00', '0.00', b'1', 0, b'0', 'AC', 1, 1, 25, 6),
(2, 'FERRE - 002', 'Electrodos', '0.00', '0.00', b'0', 0, b'0', 'AC', 1, 1, 50, 6),
(3, 'test- 01', 'rallador ', '0.00', '0.00', b'0', 0, b'0', 'AC', 1, 1, 1, 6),
(4, '00001-09988', 'alambre', '0.00', '0.00', b'0', 0, b'0', 'AN', 1, 1, 23, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaherramientas`
--

CREATE TABLE `asignaherramientas` (
  `id` int(11) NOT NULL,
  `herrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignausuario`
--

CREATE TABLE `asignausuario` (
  `id` int(11) NOT NULL,
  `usrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componenteequipo`
--

CREATE TABLE `componenteequipo` (
  `idcomponenteequipo` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `codigo` varchar(11) DEFAULT NULL,
  `estado` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `componenteequipo`
--

INSERT INTO `componenteequipo` (`idcomponenteequipo`, `id_equipo`, `id_componente`, `observacion`, `codigo`, `estado`) VALUES
(6, 3, 0, NULL, '', 'AC'),
(16, 4, 0, NULL, '', 'AC'),
(18, 4, 0, NULL, '', 'AC'),
(19, 4, 13, NULL, '', 'AN'),
(21, 4, 16, NULL, '', 'AN'),
(22, 4, 17, NULL, '', 'AN'),
(24, 4, 19, NULL, '', 'AN'),
(26, 5, 13, NULL, '', 'AC'),
(28, 5, 16, NULL, '', 'AC'),
(29, 5, 17, NULL, '', 'AC'),
(31, 5, 19, NULL, '', 'AC'),
(32, 6, 13, NULL, '', 'AC'),
(34, 6, 16, NULL, '', 'AC'),
(35, 6, 17, NULL, '', 'AC'),
(37, 6, 19, NULL, '', 'AC'),
(38, 7, 13, NULL, '', 'AN'),
(40, 7, 16, NULL, '', 'AN'),
(41, 7, 17, NULL, '', 'AN'),
(43, 7, 19, NULL, '', 'AN'),
(44, 8, 13, NULL, '', 'AC'),
(46, 8, 16, NULL, '', 'AN'),
(47, 8, 17, NULL, '', 'AC'),
(49, 8, 19, NULL, '', 'AC'),
(50, 9, 13, NULL, '', 'AC'),
(51, 9, 15, NULL, '', 'AC'),
(52, 9, 16, NULL, '', 'AC'),
(53, 9, 17, NULL, '', 'AC'),
(55, 9, 19, NULL, '', 'AC'),
(56, 10, 13, NULL, '', 'AN'),
(57, 10, 15, NULL, '', 'AN'),
(58, 10, 16, NULL, '', 'AN'),
(59, 10, 17, NULL, '', 'AN'),
(61, 10, 19, NULL, '', 'AN'),
(62, 4, 12, NULL, '', 'AN'),
(63, 7, 19, NULL, '', 'AN'),
(64, 9, 2, NULL, '', 'AN'),
(65, 10, 18, NULL, '', 'AN'),
(66, 4, 15, NULL, '', 'AN'),
(67, 4, 18, NULL, '', 'AC'),
(68, 10, 12, NULL, '', 'AN'),
(69, 10, 12, NULL, NULL, 'AN'),
(70, 10, 20, NULL, NULL, 'AN'),
(71, 10, 13, NULL, NULL, 'AN'),
(72, 10, 16, NULL, NULL, 'AN'),
(73, 10, 19, NULL, NULL, 'AN'),
(74, 10, 19, NULL, NULL, 'AN'),
(75, 10, 13, NULL, NULL, 'AC'),
(76, 10, 12, NULL, NULL, 'AC'),
(77, 4, 19, NULL, NULL, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE `componentes` (
  `id_componente` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL,
  `informacion` text COLLATE utf8_spanish_ci,
  `marcaid` int(11) DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`id_componente`, `descripcion`, `id_equipo`, `fechahora`, `informacion`, `marcaid`, `pdf`, `id_empresa`) VALUES
(1, 'IT-0001-04', 1, '2017-11-06 00:00:00', NULL, 1, '', 0),
(2, 'RS- 0001', 2, '2017-11-08 00:00:00', NULL, 1, '', 0),
(3, 'Cargadorea komatsu CDM812', 3, '2017-12-02 00:00:00', NULL, 1, '', 0),
(4, 'filstro RS 224', 3, '2017-12-04 11:01:39', 'dasdasd', 4, 'assets/filesequipos/4.pdf', 0),
(5, 'EMPER001', 4, '2018-01-16 00:00:00', NULL, 1, '', 0),
(6, 'EMPER002', 5, '2018-01-16 00:00:00', NULL, 1, '', 0),
(7, 'EMCAR002', 6, '2018-01-16 00:00:00', NULL, 1, '', 0),
(8, 'EMCAR006', 7, '2018-01-16 00:00:00', NULL, 1, '', 0),
(9, 'EMCAR003', 8, '2018-01-16 00:00:00', NULL, 1, '', 0),
(10, 'EMAUT001', 9, '2018-01-16 00:00:00', NULL, 1, '', 0),
(11, 'EMAUT008', 10, '2018-01-16 00:00:00', NULL, 1, '', 0),
(12, 'xxx', 4, '2018-01-16 11:23:31', 'eqweqeqeqe', 1, 'assets/filesequipos/12.pdf', 6),
(13, 'MOTOR DIESEL', 4, '2018-01-16 11:30:15', '', 4, 'assets/filesequipos/13.pdf', 6),
(14, 'MOTOR DIESEL', 4, '2018-01-16 11:30:45', '', 4, 'assets/filesequipos/14.pdf', 6),
(15, 'FILTRO DE COMBUSTIBLE ', 4, '2018-01-16 11:33:31', '', 4, 'assets/filesequipos/15.pdf', 6),
(16, 'TANQUE DE COMBUSTIBLE', 4, '2018-01-16 11:34:19', '', 4, 'assets/filesequipos/16.pdf', 6),
(17, 'MOTOR DE ARRANQUE', 4, '2018-01-16 11:35:50', '', 4, 'assets/filesequipos/17.pdf', 6),
(18, 'RADIADOR', 4, '2018-01-16 11:36:07', '', 4, 'assets/filesequipos/18.pdf', 6),
(19, 'SENSOR DE TEMPERATURA', 4, '2018-01-16 11:37:30', '', 4, 'assets/filesequipos/19.pdf', 6),
(20, 'MOTOR DIESEL', 4, '2018-01-16 12:05:11', '', 4, 'assets/filesequipos/20.pdf', 6),
(21, 'componente nuevo hugo', 4, '2018-03-28 20:39:44', 'componente agregado despues', 3, 'assets/filesequipos/21.pdf', 4),
(22, 'componete nuevo hugo', 10, '2018-04-10 12:31:32', 'info componente hugo', 3, 'assets/filesequipos/22.pdf', 0),
(23, 'componente hugo', 11, '2018-06-29 15:16:14', 'compnuevo', 1, 'assets/filesequipos/23.pdf', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conffamily`
--

CREATE TABLE `conffamily` (
  `famId` int(11) NOT NULL,
  `famName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `conffamily`
--

INSERT INTO `conffamily` (`famId`, `famName`) VALUES
(1, 'Filstros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confsubfamily`
--

CREATE TABLE `confsubfamily` (
  `sfamId` int(11) NOT NULL,
  `sfamName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `famId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

CREATE TABLE `confzone` (
  `zonaId` int(11) NOT NULL,
  `zonaName` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

CREATE TABLE `contratistaquipo` (
  `id_equipo` int(1) NOT NULL,
  `id_contratista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `contratistaquipo`
--

INSERT INTO `contratistaquipo` (`id_equipo`, `id_contratista`) VALUES
(4, 17),
(10, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratistas`
--

CREATE TABLE `contratistas` (
  `id_contratista` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `contradireccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `contramail` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contramail1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracelular1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracelular2` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contratelefono` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracontacto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `estado` char(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `contratistas`
--

INSERT INTO `contratistas` (`id_contratista`, `nombre`, `contradireccion`, `contramail`, `contramail1`, `contracelular1`, `contracelular2`, `contratelefono`, `contracontacto`, `estado`, `id_empresa`) VALUES
(17, 'Clorox', 'Clorox', 'Clorox', 'Clorox', '156565665', '156565665', '156565665', '156565665', '', 6),
(19, 'Trazalog', 'Lib. Gral. S. Martin 1890', 'soporte@tazalog.com', 'soporte@tazalog.com', '155555555', '155555555', '155555555', 'Soporte', '', 0),
(20, 'contratista emp 6', 'calle sin numero', 'contratista@gmail.com', '', '1555555', '16666666', '42555555', 'hugo', '', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criticidad`
--

CREATE TABLE `criticidad` (
  `id_criti` int(10) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `criticidad`
--

INSERT INTO `criticidad` (`id_criti`, `descripcion`, `id_empresa`) VALUES
(1, 'Alta', 6),
(2, 'Media', 6),
(3, 'Baja', 0),
(4, 'nueva cric', 0),
(6, 'criticidad 6', 0),
(7, 'criticidad 6', 6),
(8, 'criticidad testing', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta-remito`
--

CREATE TABLE `deta-remito` (
  `detaremitoid` int(11) NOT NULL,
  `id_remito` int(11) NOT NULL,
  `loteid` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deta-remito`
--

INSERT INTO `deta-remito` (`detaremitoid`, `id_remito`, `loteid`, `cantidad`, `precio`) VALUES
(1, 1, 1, 34, 0),
(2, 2, 1, 23, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta_ordeninsumos`
--

CREATE TABLE `deta_ordeninsumos` (
  `id_detaordeninsumo` int(11) NOT NULL,
  `id_ordeninsumo` int(11) DEFAULT NULL,
  `loteid` int(10) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `deta_ordeninsumos`
--

INSERT INTO `deta_ordeninsumos` (`id_detaordeninsumo`, `id_ordeninsumo`, `loteid`, `cantidad`, `precio`) VALUES
(1, 1, 1, 10, NULL),
(2, 2, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deta_ordenservicio`
--

CREATE TABLE `deta_ordenservicio` (
  `id_detasercicio` int(11) NOT NULL,
  `id_ordenservicio` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `tiempo` varchar(100) CHARACTER SET latin1 NOT NULL,
  `observacion` text CHARACTER SET latin1,
  `monto` double NOT NULL,
  `id_componente` int(11) NOT NULL,
  `rh` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `deta_ordenservicio`
--

INSERT INTO `deta_ordenservicio` (`id_detasercicio`, `id_ordenservicio`, `id_tarea`, `tiempo`, `observacion`, `monto`, `id_componente`, `rh`) VALUES
(1, 1, 1, ' 1 ', NULL, 150, 2, 1),
(2, 2, 1, ' 12 ', NULL, 1200, 1, 2),
(3, 3, 1, ' 10 ', NULL, 1000, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(50) NOT NULL,
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
  `emlogo` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `descripcion`, `empcuit`, `empdir`, `emptelefono`, `empemail`, `cliImagePath`, `localidadid`, `provinciaid`, `paisid`, `gps`, `empcelular`, `zonaId`, `emlogo`) VALUES
(2, 'Oficinas trazalog', '30125612569', 'Caseros 650 Sur', '0264 427-4296', '', NULL, NULL, NULL, NULL, NULL, '', 10, NULL),
(6, 'Sibelco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envio` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `ultimo_envio` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envio`, `fecha`, `ultimo_envio`) VALUES
(1, '2014-08-20', '2010-06-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
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
  `numero_serie` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `descripcion`, `fecha_ingreso`, `fecha_baja`, `fecha_garantia`, `marca`, `codigo`, `ubicacion`, `id_empresa`, `id_sector`, `id_hubicacion`, `id_grupo`, `id_criticidad`, `estado`, `fecha_ultimalectura`, `ultima_lectura`, `tipo_horas`, `id-centrodecosto`, `valor_reposicion`, `fecha_reposicion`, `id_proveedor`, `valor`, `comprobante`, `descrip_tecnica`, `id_unidad`, `id_area`, `id_proceso`, `numero_serie`) VALUES
(4, 'PERFORADORA RANGER 500', '2017-01-01', '0000-00-00', '2018-12-31', 'Tamrock', 'EMPER001', 'La Laja', 6, 1, 0, 2, 7, 'AC', '2018-06-12 15:53:57', 9000, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 3, 0),
(5, 'PERFORADORA RANGER 680', '2017-06-01', '0000-00-00', '2018-01-19', 'Tamrock', 'EMPER002', 'La Laja', 6, 4, 0, 4, 1, 'AN', '2018-06-06 15:54:06', 7000, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 3, 0),
(6, 'CARGADORA FRONTAL CAT 980H', '2017-08-01', '0000-00-00', '2018-03-14', 'Caterpillar', 'EMCAR002', 'La Laja', 6, 5, 0, 4, 2, 'AN', '2018-05-31 15:54:12', 4500, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 3, 0),
(7, 'CARGADORA WA470', '2018-01-01', '0000-00-00', '2020-01-01', 'Komatsu', 'EMCAR006', 'La Laja', 6, 5, 0, 4, 0, 'AC', '2018-05-28 18:54:17', 80, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 3, 0),
(8, 'CARGADORA WA250 ', '2017-10-01', '0000-00-00', '2019-12-01', 'Komatsu', 'EMCAR003', 'La Laja', 6, 5, 0, 4, 0, 'AC', '2018-06-07 11:54:23', 700, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 3, 0),
(9, 'AUTOELEVADOR 01\n', '2017-03-01', '0000-00-00', '2018-01-31', 'Toyota', 'EMAUT001', 'La Laja', 6, 6, 0, 4, 0, 'AC', '2018-06-14 20:54:43', 100, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 3, 0),
(10, 'AUTOELEVADOR 02 - editado', '2017-05-05', '0000-00-00', '2018-06-08', 'Black & Decker', 'EMAUT008 - editado', 'La Laja - editado', 6, 7, 0, 5, 7, 'AN', '2018-04-07 12:26:57', 155, '', 0, 0, '0000-00-00', 0, 0, '', '', 1, 3, 3, 0),
(11, 'equipo de testing descripcion', '2018-06-22', '0000-00-00', '2018-06-29', 'Marca Unica', 'codigo de equipo testing', 'ubicacion testing', 6, 8, 0, 6, 8, 'AC', '2018-06-22 00:00:00', 55555, '', 0, 0, '0000-00-00', 0, 0, '', 'equipo descripcion ficha', 1, 8, 6, 123456789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fallas`
--

CREATE TABLE `fallas` (
  `id_reparacion` int(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fallas`
--

INSERT INTO `fallas` (`id_reparacion`, `descripcion`) VALUES
(1, 'Reparación por falla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_equipo`
--

CREATE TABLE `ficha_equipo` (
  `id_fichaequip` int(11) NOT NULL,
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
  `hora_lectura` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

CREATE TABLE `grupo` (
  `id_grupo` int(10) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `descripcion`, `id_empresa`) VALUES
(1, 'Instlaciones', 6),
(2, 'Rodados', 6),
(3, 'Instalaciones Electricas', 0),
(4, 'Equipos Moviles', 0),
(5, 'grupo nuevo 6', 6),
(6, 'Grupo testing', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
  `herrId` int(11) NOT NULL,
  `herrcodigo` varchar(255) NOT NULL DEFAULT '',
  `herrmarca` varchar(255) DEFAULT NULL,
  `modid` int(10) DEFAULT NULL,
  `tipoid` int(10) DEFAULT NULL,
  `equip_estad` varchar(4) DEFAULT NULL,
  `herrdescrip` varchar(255) DEFAULT NULL,
  `depositoId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`herrId`, `herrcodigo`, `herrmarca`, `modid`, `tipoid`, `equip_estad`, `herrdescrip`, `depositoId`, `id_empresa`) VALUES
(1, 'AK47', 'Black & Decker', 1, NULL, 'AC', 'Amoladora', 1, 6),
(2, 'SW80', 'Robust', 1, NULL, 'AC', 'Taladro', 1, 6),
(4, 'HR-TT-Organizador Tornillos', 'Organizador tornillos - Stanley', 1, NULL, 'AC', 'HR-TT-Organizador Tornillos', 1, 6),
(5, 'HR-TT-Escalera 7 peldaños', 'Escalera 7 peldaño - Ayinco', 1, NULL, 'AC', 'HR-TT-Escalera 7 peldaños', 1, 6),
(6, 'HR-TT-Mascara facial', 'Mascara facial', 2, NULL, 'AC', 'HR-TT-Mascara facial', 1, 6),
(7, 'HR-TT-Prot Audit-Vincha', 'Protector auditivo copa tipo vincha', 1, NULL, 'AC', 'HR-TT-Prot Audit-Vincha', 1, 0),
(8, 'HR-TT-Llave combinada 10mm', 'Llave combinada 10mm', 3, NULL, 'TR', 'HR-TT-Llave combinada 10mm', 1, 0),
(9, 'HR-TT-Llave combinada 13mm', 'Llave combinada 13mm', 1, NULL, 'AC', 'HR-TT-Llave combinada 13mm', 1, 0),
(10, 'HR-TT-Llave combinada 15mm', 'Llave combinada 13mm', 1, NULL, 'AC', 'HR-TT-Llave combinada 15mm', 1, 0),
(11, 'HR-TT-Llave combinada 17mm', 'Llave combinada 17mm', 1, NULL, 'AC', 'HR-TT-Llave combinada 17mm', 1, 0),
(12, 'HR-TT-Llave combinada 7/16"', 'Llave combinada 7/16"', 1, NULL, 'AC', 'HR-TT-Llave combinada 7/16"', 1, 0),
(13, 'HR-TT-Llave combinada 9/16"', 'Llave combinada 9/16"', 1, NULL, 'AC', 'HR-TT-Llave combinada 9/16"', 1, 0),
(14, 'HR-TT-Destornillador de puño philips', 'Destornillador de puño philips - Bulit', 1, NULL, 'AC', 'HR-TT-Destornillador de puño philips', 1, 0),
(15, 'HR-TT-Llave Francesa 30mm', 'Llave Francesa 30mm', 1, NULL, 'AC', 'HR-TT-Llave Francesa 30mm', 1, 0),
(16, 'HR-TT-Cinta métrica de 5 m ', 'Cinta métrica de 5 m ', 1, NULL, 'AC', 'HR-TT-Cinta métrica de 5 m ', 1, 0),
(17, 'HR-OFA-Linterna', 'Linterna', 1, NULL, 'AC', 'HR-OFA-Linterna', 1, 0),
(18, 'HR-OFA-Arco de sierra', 'Arco de sierra', 1, NULL, 'AC', 'HR-OFA-Arco de sierra', 1, 0),
(19, 'HR-OFA-Extractor de poleas 150 mm', 'Extractor de poleas 150 mm', 1, NULL, 'AC', 'HR-OFA-Extractor de poleas 150 mm', 1, 0),
(20, 'HR-OFA-Alargues', 'Alargues', 1, NULL, 'AC', 'HR-OFA-Alargues', 1, 0),
(21, 'HR-OFE-Espatula chica', 'Espatula chica', 1, NULL, 'AC', 'HR-OFE-Espatula chica', 1, 0),
(22, 'HR-OFE-Espatulas medianas', 'Espatulas medianas', 1, NULL, 'AC', 'HR-OFE-Espatulas medianas', 1, 0),
(23, 'HR-OFE-Barretines de 0,80 y 0,90 negro, naranja', 'barretines de 0,80 y 0,90 negro, naranja', 1, NULL, 'AC', 'HR-OFE-Barretines de 0,80 y 0,90 negro, naranja', 1, 0),
(24, 'HR-OFE-Arnés', 'Arnés', 1, NULL, 'AC', 'HR-OFE-Arnés', 1, 0),
(25, 'HR-OFE-Llanas', 'Llanas', 1, NULL, 'AC', 'HR-OFE-Llanas', 1, 0),
(26, 'HR-OFE-Llana dentada', 'Llana dentada', 1, NULL, 'AC', 'HR-OFE-Llana dentada', 1, 0),
(27, 'HR-OFE-Balde de Albañil', 'Balde de Albañil', 1, NULL, 'AC', 'HR-OFE-Balde de Albañil', 1, 0),
(28, 'HR-OFE-Anchada', 'Anchada', 1, NULL, 'AC', 'HR-OFE-Anchada', 1, 0),
(29, 'HR-OFE-Bota de goma', 'Bota de goma', 1, NULL, 'AC', 'HR-OFE-Bota de goma', 1, 0),
(30, 'HR-ODE-Boquilla para termofusión 1"', 'Boquilla para termofusión 1"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1"', 1, 0),
(31, 'HR-ODE-Boquilla para termofusión 4"', 'Boquilla para termofusión 4"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 4"', 1, 0),
(32, 'HR-ODE-Boquilla para termofusión 2,5"', 'Boquilla para termofusión 2,5"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 2,5"', 1, 0),
(33, 'HR-ODE-Boquilla para termofusión 80mm', 'Boquilla para termofusión 80mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 80mm', 1, 0),
(34, 'HR-ODE-Boquilla para termofusión 2"', 'Boquilla para termofusión 2"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 2"', 1, 0),
(35, 'HR-ODE-Boquilla para termofusión 1 1/2"', 'Boquilla para termofusión 1 1/2"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1 1/2"', 1, 0),
(36, 'HR-ODE-Boquilla para termofusión 1 1/4"', 'Boquilla para termofusión 1 1/4"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1 1/4"', 1, 0),
(37, 'HR-ODE-Boquilla para termofusión 3/4"', 'Boquilla para termofusión 3/4"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 3/4"', 1, 0),
(38, 'HR-ODE-Boquilla para termofusión 1/2"', 'Boquilla para termofusión 1/2"', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 1/2"', 1, 0),
(39, 'HR-ODE-Termofusora 1', 'Termofusora 1', 1, NULL, 'AC', 'HR-ODE-Termofusora 1', 1, 0),
(40, 'HR-ODE-Termofusora 1600w', 'Termofusora 1600w', 1, NULL, 'AC', 'HR-ODE-Termofusora 1600w', 1, 0),
(41, 'HR-ODE-Boquilla para termofusión 75mm', 'Boquilla para termofusión 75mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 75mm', 1, 0),
(42, 'HR-ODE-Boquilla para termofusión 90mm', 'Boquilla para termofusión 90mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 90mm', 1, 0),
(43, 'HR-ODE-Boquilla para termofusión 110mm', 'Boquilla para termofusión 110mm', 1, NULL, 'AC', 'HR-ODE-Boquilla para termofusión 110mm', 1, 0),
(44, 'HR-OVI-TermoAnemómetro ', 'TermoAnemómetro ', 1, NULL, 'AC', 'HR-OVI-TermoAnemómetro ', 1, 0),
(45, 'HR-OVI-Termometro infrarojo', 'Termometro infrarojo', 1, NULL, 'AC', 'HR-OVI-Termometro infrarojo', 1, 0),
(46, 'HR-OVI-Pinza extractora de fusible NH', 'Pinza extractora de fusible NH', 1, NULL, 'AC', 'HR-OVI-Pinza extractora de fusible NH', 1, 0),
(47, 'HR-OVI-Pinza amperometrica con puntas', 'Pinza amperometrica con puntas', 1, NULL, 'AC', 'HR-OVI-Pinza amperometrica con puntas', 1, 0),
(48, 'HR-OVI- Soldador Cautín 30w', 'Soldador Cautín 30w', 1, NULL, 'AC', 'HR-OVI- Soldador Cautín 30w', 1, 0),
(49, 'HR-OFE-Multimetro con puntas', 'Multimetro con puntas', 1, NULL, 'AC', 'HR-OFE-Multimetro con puntas', 1, 0),
(50, 'HR-TTA-Pértiga DPA 3 KV', 'Pértiga DPA 3 KV', 1, NULL, 'AC', 'HR-TTA-Pértiga DPA 3 KV', 1, 0),
(51, 'HR-OVI-Detector de metál ', 'Detector de metál ', 1, NULL, 'AC', 'HR-OVI-Detector de metál ', 1, 0),
(52, 'HR-OVI-Programador de variador vel.', 'Programador de variador vel.', 1, NULL, 'AC', 'HR-OVI-Programador de variador vel.', 1, 0),
(53, 'HR-OVI-Pinza amp con puntas', 'Pinza amp con puntas', 1, NULL, 'AC', 'HR-OVI-Pinza amp con puntas', 1, 0),
(54, 'HR-OFA-Caja de llaves tubos medidas chicas(completa)', 'Caja de llaves tubos medidas chicas(completa)', 1, NULL, 'AC', 'HR-OFA-Caja de llaves tubos medidas chicas(completa)', 1, 0),
(55, 'HR-OFA-Caja de llaves tubos medidas grandes(completa)', 'Caja de llaves tubos medidas grandes(completa)', 1, NULL, 'AC', 'HR-OFA-Caja de llaves tubos medidas grandes(completa)', 1, 0),
(56, 'HR-OFA-Caja de mechas(12,16,20mm y 1/2")', 'Caja de mechas(12,16,20mm y 1/2")', 1, NULL, 'AC', 'HR-OFA-Caja de mechas(12,16,20mm y 1/2")', 1, 0),
(57, 'HR-OFA-Amoladora 4,5" 840w 9557 HP', 'Amoladora 4,5" 840w 9557 HP', 1, NULL, 'TR', 'HR-OFA-Amoladora 4,5" 840w 9557 HP', 1, 0),
(58, 'HR-OFA-Llave Stillson 36"', 'Llave Stillson 36"', 1, NULL, 'AC', 'HR-OFA-Llave Stillson 36"', 1, 0),
(59, 'HR-OFA-Pistola de calor', 'Pistola de calor', 1, NULL, 'AC', 'HR-OFA-Pistola de calor', 1, 0),
(60, 'HR-OFA-Serrucho 24"', 'Serrucho 24"', 1, NULL, 'AC', 'HR-OFA-Serrucho 24"', 1, 0),
(61, 'HR-OFA-Atornillador ? 13 con bateria ', 'Atornillador ? 13 con bateria ', 1, NULL, 'AC', 'HR-OFA-Atornillador ? 13 con bateria ', 1, 0),
(63, 'HR-OFA-Atornillador  13 con bateria ', 'Atornillador  13 con bateria ', 1, NULL, 'AC', 'HR-OFA-Atornillador  13 con bateria ', 1, 0),
(64, 'HR-OFA-Llave Inglesa 22"', 'Llave Inglesa 22"', 1, NULL, 'AC', 'HR-OFA-Llave Inglesa 22"', 1, 0),
(65, 'HR-OFA-Rotomartillo con mandril y llave', 'Rotomartillo con mandril y llave', 1, NULL, 'AC', 'HR-OFA-Rotomartillo con mandril y llave', 1, 0),
(66, 'HR-ODE-Extractor de poleas 400 mm', 'Extractor de poleas 400 mm', 1, NULL, 'AC', 'HR-ODE-Extractor de poleas 400 mm', 1, 0),
(67, 'HR-OFE-Espatulas grandes', 'Espatulas grandes', 1, NULL, 'AC', 'HR-OFE-Espatulas grandes', 1, 0),
(68, 'HR-OFE-Soplete para colocar membrana', 'Soplete para colocar membrana', 1, NULL, 'AC', 'HR-OFE-Soplete para colocar membrana', 1, 0),
(69, 'HR-OFE-Cola de vida ', 'Cola de vida ', 1, NULL, 'AC', 'HR-OFE-Cola de vida ', 1, 0),
(73, 'HR-OFE-Serrucho para corte en durlock', 'Serrucho para corte en durlock', 1, NULL, 'AC', 'HR-OFE-Serrucho para corte en durlock', 1, 0),
(74, 'HR-OFE-Llana de durlock', 'Llana de durlock', 1, NULL, 'AC', 'HR-OFE-Llana de durlock', 1, 0),
(75, 'HR-OFE-Fratacho', 'Fratacho', 1, NULL, 'TR', 'HR-OFE-Fratacho', 1, 0),
(76, 'HR-OFE-Cortafierro', 'Cortafierro', 1, NULL, 'AC', 'HR-OFE-Cortafierro', 1, 0),
(77, 'HR-OFE-Mazo mediano', 'Mazo mediano', 1, NULL, 'AC', 'HR-OFE-Mazo mediano', 1, 0),
(78, 'HR-OFE-Cuchara mediana de albañil', 'Cuchara mediana de albañil', 1, NULL, 'AC', 'HR-OFE-Cuchara mediana de albañil', 1, 0),
(79, 'HR-OFE-Cuchara grande de albañil', 'Cuchara grande de albañil', 1, NULL, 'AC', 'HR-OFE-Cuchara grande de albañil', 1, 0),
(80, 'HR-OFE-Chocla', 'Chocla', 1, NULL, 'AC', 'HR-OFE-Chocla', 1, 0),
(81, 'HR-OFE-Martelina', 'Martelina', 1, NULL, 'AC', 'HR-OFE-Martelina', 1, 0),
(82, 'HR-OFE-Bomba de combustible', 'Bomba de combustible', 1, NULL, 'AC', 'HR-OFE-Bomba de combustible', 1, 0),
(83, 'HR-OFE-Grasera', 'Grasera', 1, NULL, 'AC', 'HR-OFE-Grasera', 1, 0),
(86, 'A-Hormigonera', 'azul', 1, NULL, 'AC', 'A-Hormigonera', NULL, 0),
(87, 'w80', '989', 1, NULL, 'AC', 'w80', NULL, 0),
(89, 'HVLL-TT-MANIFOLD', '', 1, NULL, 'AC', 'MANOMETRO DE GASES REFRIGERANTE', 2, 0),
(90, 'HVLL-TT', 'SSP', 1, NULL, 'AC', 'Agujereadora de mano eléctrica 13 mm con percutor', 3, 0),
(91, '2334343242', 'ssss', 0, NULL, 'AC', 'Taladro', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_lecturas`
--

CREATE TABLE `historial_lecturas` (
  `id_lectura` int(10) NOT NULL,
  `id_equipo` int(10) NOT NULL,
  `lectura` int(10) NOT NULL,
  `fecha` datetime NOT NULL,
  `usrId` int(11) NOT NULL,
  `observacion` text,
  `operario_nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `turno` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(25, 11, 2134, '2018-01-26 17:26:10', 1, 'no op', 'rs', 'mañana', 'RE'),
(26, 10, 0, '2018-02-08 12:55:18', 1, '', '', '', 'RE'),
(27, 10, 0, '2018-02-08 12:56:07', 1, '', '', '', 'RE'),
(28, 7, 0, '2018-02-08 12:56:52', 1, '', '', '', 'RE'),
(29, 6, 0, '2018-02-08 16:01:48', 1, '', '', '', 'RE'),
(30, 10, 0, '2018-03-06 13:10:18', 1, '', '', '', 'AC'),
(31, 10, 0, '2018-03-06 13:10:29', 1, '', '', '', 'RE'),
(32, 10, 0, '2018-03-06 13:10:40', 1, '', '', '', 'AC'),
(33, 10, 0, '2018-03-06 13:10:52', 1, '', '', '', 'RE'),
(34, 10, 0, '2018-03-06 13:11:44', 1, '', '', '', 'AC'),
(35, 10, 0, '2018-03-09 12:57:53', 1, '', '', '', 'RE'),
(36, 9, 122, '2018-03-21 13:23:05', 3, 'se rompio', 'juan', 'mañana', 'RE'),
(37, 10, 34, '2018-03-21 13:24:21', 3, 'agfgadf', 'ya', 'a', 'RE'),
(38, 4, 0, '2018-03-22 11:04:05', 3, '', '', '', 'RE'),
(39, 4, 0, '2018-03-22 11:04:43', 3, '', '', '', 'RE'),
(40, 4, 150, '2018-05-24 12:58:46', 3, 'sarasa', 'Hugo', 'mañana', 'AC'),
(41, 4, 500, '2018-06-19 15:42:25', 3, 'se rompio', 'yop', 'mañana', 'RE'),
(42, 4, 486, '2018-06-19 15:55:46', 3, 'todo ok', 'hugo g', 'tarde', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infocomponentes`
--

CREATE TABLE `infocomponentes` (
  `infocompid` int(11) NOT NULL,
  `infocompdescrip` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infoequipos`
--

CREATE TABLE `infoequipos` (
  `infoid` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacionequipo`
--

CREATE TABLE `informacionequipo` (
  `id_informacion` int(11) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `informacionequipo`
--

INSERT INTO `informacionequipo` (`id_informacion`, `titulo`, `descripcion`, `id_equipo`) VALUES
(1081, 'titulo 1', 'descr 1', 51),
(1082, 'titulo 2', 'desc 2', 51),
(1083, 'titulo3', 'desc3', 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcasequipos`
--

CREATE TABLE `marcasequipos` (
  `marcaid` int(11) NOT NULL,
  `marcadescrip` varchar(255) DEFAULT NULL,
  `estado` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcasequipos`
--

INSERT INTO `marcasequipos` (`marcaid`, `marcadescrip`, `estado`) VALUES
(1, 'Marca Unica', 'AC'),
(2, 'Black & Decker', 'AC'),
(3, 'Bahco', 'AC'),
(4, 'Caterpillar', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_año`
--

CREATE TABLE `modelo_año` (
  `id_año` int(100) NOT NULL,
  `descripcion` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modelo_año`
--

INSERT INTO `modelo_año` (`id_año`, `descripcion`) VALUES
(1, 'wqeqewqeqw');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_insumos`
--

CREATE TABLE `orden_insumos` (
  `id_orden` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `solicitante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destino` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comprobante` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `orden_insumos`
--

INSERT INTO `orden_insumos` (`id_orden`, `fecha`, `solicitante`, `destino`, `comprobante`) VALUES
(1, '2017-11-13', 'edsfsdfs', NULL, 43434),
(2, '0000-00-00', '3', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_pedido`
--

CREATE TABLE `orden_pedido` (
  `id_orden` int(11) NOT NULL,
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
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(31, 2, 1111, 'pedido test asociado a ot con id 538', '2018-06-29 11:11:06', '2018-07-06 00:00:00', '0000-00-00 00:00:00', 'P', 538, '', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_servicio`
--

CREATE TABLE `orden_servicio` (
  `id_orden` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  `id_solicitudreparacion` int(11) NOT NULL,
  `valesid` int(11) DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_ordenherraminetas` int(11) DEFAULT NULL,
  `id_orden_insumo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `orden_servicio`
--

INSERT INTO `orden_servicio` (`id_orden`, `fecha`, `comprobante`, `id_equipo`, `id_contratista`, `id_solicitudreparacion`, `valesid`, `estado`, `id_ordenherraminetas`, `id_orden_insumo`) VALUES
(1, '2017-11-14', '', 2, 17, 6, 4, 'C', NULL, 1),
(2, '2017-12-09', '', 1, 17, 16, 1, 'C', NULL, 1),
(3, '2017-12-11', '', 1, 17, 16, 1, 'C', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_trabajo`
--

CREATE TABLE `orden_trabajo` (
  `id_orden` int(11) NOT NULL,
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
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden_trabajo`
--

INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`) VALUES
(1, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:44:25', '2017-11-08 10:47:45', '2017-11-08 10:47:45', '2017-11-08 10:47:45', '2017-11-08 10:47:45', 'rotura de rueda', 13, 'C', 1, 1, 1, 1, 0, 1, '1', 0, 60, NULL, 1),
(2, 0, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 00:00:00', '2017-11-29 00:00:00', '2017-11-23 08:39:37', '2017-11-08 10:48:19', '2017-12-10 00:00:00', 'sadasdas', 13, 'E', 1, 1, 1, 1, 0, 4, '1', 0, 60, NULL, 1),
(3, 0, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:47:21', '2017-11-08 10:58:41', '2017-11-08 10:58:41', '2017-11-08 10:58:41', '2017-11-08 10:58:41', 'sadasdas', 1, 'C', 1, 1, 1, 1, 0, 4, '2', 0, 60, NULL, 1),
(4, 4, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:47:21', '2017-11-08 12:52:35', '2017-11-08 12:52:35', '2017-11-08 12:52:35', '2017-11-08 12:52:35', 'sadasdas', 1, 'C', 1, 1, 1, 1, 0, 4, '2', 0, 60, NULL, 1),
(5, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:44:25', '2017-11-09 16:09:14', '2017-11-09 16:09:14', '2017-11-09 16:09:14', '2017-11-09 16:09:14', 'rotura de rueda', 13, 'C', 1, 1, 1, 1, 0, 1, '', 0, 60, NULL, 1),
(6, 0, '5', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 12:53:19', '2017-12-09 16:09:34', '2017-11-09 16:09:34', '2017-11-09 16:09:34', '2017-11-09 16:09:34', 'observc test2', 1, 'C', 1, 1, 1, 1, 1, 5, '', 0, 60, NULL, 1),
(7, 0, '5', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 12:53:19', '2017-12-07 10:38:07', '2017-11-13 10:38:07', '2017-11-13 10:38:07', '2017-11-13 10:38:07', 'observc test2', 1, 'C', 1, 1, 1, 1, 1, 5, '', 0, 60, NULL, 1),
(8, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 00:00:00', '0000-00-00 00:00:00', '2017-11-14 14:39:59', '2017-11-14 14:39:59', '2017-11-14 14:39:59', 'rotura de rueda', 13, 'P', 1, 1, 1, 1, 1, 1, '2', 0, 60, NULL, 1),
(9, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-11-14 15:38:02', '2017-11-14 15:38:02', '2017-11-14 15:38:02', '2017-11-14 15:38:02', 'Rotura de llanta', 13, 'C', 5, 5, 5, 1, 0, 6, '', 0, 60, NULL, 1),
(10, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-11-14 15:42:27', '2017-11-14 15:42:27', '2017-11-14 15:42:27', '2017-11-14 15:42:27', 'Rotura de llanta', 13, 'C', 5, 5, 5, 1, 0, 6, '1', 0, 60, NULL, 1),
(11, 0, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:44:25', '2017-11-23 08:26:01', '2017-11-23 08:26:01', '2017-11-23 08:26:01', '2017-11-23 08:26:01', 'rotura de rueda', 1, 'C', 1, 1, 1, 1, 0, 1, '', 0, 60, NULL, 1),
(12, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-11-17 08:25:52', '2017-11-28 08:25:52', '2017-11-28 08:25:52', '2017-11-28 08:25:52', 'Rotura de llanta', 1, 'C', 3, 3, 3, 1, 0, 6, '', 0, 60, NULL, 1),
(13, 0, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-11-14 15:23:31', '2017-12-22 08:26:22', '2017-11-28 08:26:22', '2017-11-28 08:26:22', '2017-11-28 08:26:22', 'Rotura de llanta', 1, 'C', 3, 3, 3, 1, 0, 6, '', 0, 60, NULL, 1),
(14, 0, '5', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 12:53:19', '2017-12-12 10:58:50', '2017-11-28 10:58:50', '2017-11-28 10:58:50', '2017-11-28 10:58:50', 'observc test2', 13, 'C', 3, 3, 3, 1, 0, 5, '1', 0, 60, NULL, 1),
(15, NULL, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-12-07 10:44:25', '2017-12-06 12:04:24', '2017-11-28 12:04:24', '2017-11-28 12:04:24', '2017-11-28 12:04:24', 'rotura de rueda', 1, 'C', 3, 3, 3, 1, 0, 1, '2', 0, 60, NULL, 1),
(16, 1, '3', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 1, 0, 1, 0, 0, '5', 1, 60, NULL, 1),
(17, 1, '3', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'P', 3, 6, 0, 1, 0, 0, '5', 1, 60, NULL, 1),
(18, 1, '1', '0000-00-00', '0000-00-00 00:00:00', '2017-12-14 10:44:25', '0000-00-00 00:00:00', '2017-11-28 13:16:25', '2017-11-28 13:16:25', '2017-11-28 13:16:25', 'rotura de rueda', 1, 'As', 3, 0, 3, 1, 2, 1, '2', 2, 60, NULL, 1),
(19, 1, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-12-30 00:00:00', '2017-12-09 00:00:00', '2017-12-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'T', 3, 1, 0, 1, 0, 0, '4', 1, 60, NULL, 1),
(20, 1, '4', '0000-00-00', '0000-00-00 00:00:00', '0002-01-08 20:00:00', '2017-12-20 00:00:00', '2017-12-18 00:00:00', '0000-00-00 00:00:00', '2017-12-27 00:00:00', 'Predictivo', 1, 'E', 3, 1, 0, 1, 0, 0, '5', 1, 60, NULL, 1),
(21, 1, '4', '0000-00-00', '0000-00-00 00:00:00', '2017-12-21 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 4, 0, 1, 0, 0, '5', 1, 60, NULL, 1),
(22, NULL, '7', '0000-00-00', '0000-00-00 00:00:00', '2017-12-01 05:35:25', '2017-12-13 00:00:00', '2017-12-01 05:35:44', '2017-12-01 05:35:44', '2017-12-01 05:35:44', 'Falla test sobre RS-0001 (01-12)', 1, 'As', 3, 6, 3, 1, 0, 7, '2', 2, 60, NULL, 1),
(23, 1, '3', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 0, 1, 0, 0, '5', 1, 60, NULL, 1),
(25, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'C', 1, 0, 0, 1, 0, 0, '2', 1, 60, NULL, 1),
(26, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-29 00:00:00', '2017-12-27 00:00:00', '0000-00-00 00:00:00', '2018-06-27 00:00:00', 'Preventivo', 1, 'E', 1, 1, 1, 1, 0, 1, '2', 1, 60, NULL, 1),
(27, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-28 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'As', 1, 6, 1, 1, 0, 0, '2', 1, 60, NULL, 1),
(28, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-11 00:00:00', '2017-12-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'T', 1, 1, 1, 1, 0, 0, '2', 3, 60, NULL, 1),
(29, 1, '8', '0000-00-00', '0000-00-00 00:00:00', '2017-12-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 0, 0, 1, 0, 0, '4', 3, 60, NULL, 1),
(30, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2017-02-01 00:00:00', '2017-12-13 00:00:00', '2017-12-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Preventivo', 1, 'TE', 1, 1, 1, 1, 0, 0, '2', 3, 60, NULL, 1),
(31, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 0, 1, 0, 0, '5', 2, 60, NULL, 1),
(32, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 1, 1, 0, 0, '5', 2, 60, NULL, 1),
(33, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 1, 1, 0, 0, '5', 2, 60, NULL, 1),
(34, 1, '6', '0000-00-00', '0000-00-00 00:00:00', '2017-12-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 1, 1, 1, 1, 0, 0, '5', 2, 60, NULL, 1),
(35, 2, '9', '0000-00-00', '0000-00-00 00:00:00', '2017-12-12 00:00:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 1, 1, 1, 0, 0, '4', 2, 60, NULL, 1),
(36, NULL, '100', '0000-00-00', '0000-00-00 00:00:00', '2017-12-12 21:22:00', '2017-12-13 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'prueba', 1, 'As', 3, 1, 1, 1, 2, 0, '1', 2, 60, NULL, 1),
(37, 2, '9', '0000-00-00', '0000-00-00 00:00:00', '2017-12-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 1, 1, 1, 0, 0, '4', 2, 60, NULL, 1),
(38, 1, '10', '0000-00-00', '0000-00-00 00:00:00', '2018-01-10 00:00:00', '0000-00-00 00:00:00', '2018-01-12 00:00:00', '0000-00-00 00:00:00', '2018-01-12 00:00:00', 'Backlog', 1, 'E', 1, 1, 1, 1, 0, 0, '4', 1, 60, NULL, 1),
(39, 1, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-20 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Backlog', 1, 'As', 1, 0, 0, 1, 0, 0, '4', 2, 60, NULL, 1),
(40, 1, '2', '0000-00-00', '0000-00-00 00:00:00', '2017-11-08 10:45:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'assdas', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(41, 1, '9', '0000-00-00', '0000-00-00 00:00:00', '2018-01-17 13:38:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite abajo del equipo ', 1, 'C', 1, 1, 1, 1, 0, 0, '', 10, 60, NULL, 1),
(42, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(43, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(46, 1, '1', '2018-01-29', '2018-01-31 00:00:00', '2017-11-14 15:23:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rotura de llanta', 1, 'C', 3, 1, 1, 1, 0, 6, '2', 2, 60, NULL, 1),
(47, 16, '1', '2018-01-29', '2018-01-30 00:00:00', '2018-02-10 00:00:00', '2018-03-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 5, 1, 1, 0, 8, '5', 4, 60, NULL, 1),
(48, 1, '1', '2018-01-29', '2018-01-29 00:00:00', '2017-12-01 05:35:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Falla test sobre RS-0001 (01-12)', 1, 'C', 3, 1, 1, 1, 0, 7, '2', 2, 60, NULL, 1),
(49, 16, '1', '2018-01-29', '2018-01-29 00:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 1, 1, 1, 1, 0, 8, '5', 4, 60, NULL, 1),
(50, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(51, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(52, NULL, '11', '0000-00-00', '0000-00-00 00:00:00', '2018-01-18 18:07:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'mancha de aceite debajo del equipo', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(53, NULL, '12', '0000-00-00', '0000-00-00 00:00:00', '2018-01-30 14:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No tiene fuerza para levantar la carga', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(54, NULL, '12', '0000-00-00', '0000-00-00 00:00:00', '2018-01-30 14:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No tiene fuerza para levantar la carga', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(55, NULL, '12', '0000-00-00', '0000-00-00 00:00:00', '2018-01-30 14:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No tiene fuerza para levantar la carga', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(56, NULL, '7', '0000-00-00', '0000-00-00 00:00:00', '2017-12-01 05:35:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Falla test sobre RS-0001 (01-12)', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(57, 1, '1', '2018-02-08', '2018-02-08 00:00:00', '2017-11-08 10:44:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'rotura de rueda', 1, 'C', 1, 1, 1, 1, 0, 1, '2', 1, 60, NULL, 1),
(58, NULL, '13', '0000-00-00', '0000-00-00 00:00:00', '2018-02-05 19:01:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(59, NULL, '15', '0000-00-00', '0000-00-00 00:00:00', '2018-02-05 19:46:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ggggjffufjffg', 1, 'C', 1, 1, 1, 1, 0, 0, '', 0, 60, NULL, 1),
(60, 8, '1', '2018-02-08', '2018-01-08 15:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 1, 'C', 1, 1, 1, 1, 0, 16, '3', 4, 60, NULL, 1),
(61, 4, '1', '2018-02-08', '2018-01-12 15:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, NULL, 1),
(62, 4, '1', '2018-02-17', '2018-02-17 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(63, 4, '1', '2018-02-17', '2018-03-04 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(64, 4, '1', '2018-02-17', '2018-03-19 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(65, 4, '1', '2018-02-17', '2018-04-03 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(66, 4, '1', '2018-02-17', '2018-04-18 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(67, 4, '1', '2018-02-17', '2018-05-03 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(68, 4, '1', '2018-02-17', '2018-05-18 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(69, 4, '1', '2018-02-17', '2018-06-02 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(70, 4, '1', '2018-02-17', '2018-06-17 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(71, 4, '1', '2018-02-17', '2018-07-02 11:01:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 3, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(72, 16, '1', '2018-02-17', '2018-02-17 20:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(73, 16, '1', '2018-02-17', '2018-02-19 15:20:00', '2018-02-10 00:00:00', '2018-03-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(74, 4, '1', '2018-02-18', '2018-02-18 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(75, 4, '1', '2018-02-18', '2018-03-05 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(76, 4, '1', '2018-02-18', '2018-03-20 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(77, 4, '1', '2018-02-18', '2018-04-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(78, 4, '1', '2018-02-18', '2018-04-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(79, 4, '1', '2018-02-18', '2018-05-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(80, 4, '1', '2018-02-18', '2018-05-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(81, 4, '1', '2018-02-18', '2018-06-03 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(82, 4, '1', '2018-02-18', '2018-06-18 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(83, 4, '1', '2018-02-18', '2018-07-03 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(84, 4, '1', '2018-02-18', '2018-07-18 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(85, 4, '1', '2018-02-18', '2018-08-02 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(86, 4, '1', '2018-02-18', '2018-08-17 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(87, 4, '1', '2018-02-18', '2018-09-01 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(88, 4, '1', '2018-02-18', '2018-09-16 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(89, 4, '1', '2018-02-18', '2018-10-01 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(90, 4, '1', '2018-02-18', '2018-10-16 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(91, 4, '1', '2018-02-18', '2018-10-31 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(92, 4, '1', '2018-02-18', '2018-11-15 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(93, 4, '1', '2018-02-18', '2018-11-30 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(94, 4, '1', '2018-02-18', '2018-12-15 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(95, 4, '1', '2018-02-18', '2018-12-30 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(96, 4, '1', '2018-02-18', '2019-01-14 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(97, 4, '1', '2018-02-18', '2019-01-29 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(98, 4, '1', '2018-02-18', '2019-02-13 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(99, 4, '1', '2018-02-18', '2019-02-28 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(100, 4, '1', '2018-02-18', '2019-03-15 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(101, 4, '1', '2018-02-18', '2019-03-30 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(102, 4, '1', '2018-02-18', '2019-04-14 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(103, 4, '1', '2018-02-18', '2019-04-29 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(104, 4, '1', '2018-02-18', '2019-05-14 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(105, 4, '1', '2018-02-18', '2019-05-29 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(106, 4, '1', '2018-02-18', '2019-06-13 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(107, 4, '1', '2018-02-18', '2019-06-28 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(108, 4, '1', '2018-02-18', '2019-07-13 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(109, 4, '1', '2018-02-18', '2019-07-28 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(110, 4, '1', '2018-02-18', '2019-08-12 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(111, 4, '1', '2018-02-18', '2019-08-27 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(112, 4, '1', '2018-02-18', '2019-09-11 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(113, 4, '1', '2018-02-18', '2019-09-26 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(114, 4, '1', '2018-02-18', '2019-10-11 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(115, 4, '1', '2018-02-18', '2019-10-26 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(116, 4, '1', '2018-02-18', '2019-11-10 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(117, 4, '1', '2018-02-18', '2019-11-25 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(118, 4, '1', '2018-02-18', '2019-12-10 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(119, 4, '1', '2018-02-18', '2019-12-25 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(120, 4, '1', '2018-02-18', '2020-01-09 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(121, 4, '1', '2018-02-18', '2020-01-24 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(122, 4, '1', '2018-02-18', '2020-02-08 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(123, 4, '1', '2018-02-18', '2020-02-23 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(124, 4, '1', '2018-02-18', '2020-03-09 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(125, 4, '1', '2018-02-18', '2020-03-24 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(126, 4, '1', '2018-02-18', '2020-04-08 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(127, 4, '1', '2018-02-18', '2020-04-23 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(128, 4, '1', '2018-02-18', '2020-05-08 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(129, 4, '1', '2018-02-18', '2020-05-23 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(130, 4, '1', '2018-02-18', '2020-06-07 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(131, 4, '1', '2018-02-18', '2020-06-22 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(132, 4, '1', '2018-02-18', '2020-07-07 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(133, 4, '1', '2018-02-18', '2020-07-22 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(134, 4, '1', '2018-02-18', '2020-08-06 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(135, 4, '1', '2018-02-18', '2020-08-21 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(136, 4, '1', '2018-02-18', '2020-09-05 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(137, 4, '1', '2018-02-18', '2020-09-20 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(138, 4, '1', '2018-02-18', '2020-10-05 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(139, 4, '1', '2018-02-18', '2020-10-20 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(140, 4, '1', '2018-02-18', '2020-11-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(141, 4, '1', '2018-02-18', '2020-11-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(142, 4, '1', '2018-02-18', '2020-12-04 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(143, 4, '1', '2018-02-18', '2020-12-19 12:59:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(144, 5, '1', '2018-02-18', '2018-02-18 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(145, 5, '1', '2018-02-18', '2018-03-20 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(146, 5, '1', '2018-02-18', '2018-04-19 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(147, 5, '1', '2018-02-18', '2018-05-19 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(148, 5, '1', '2018-02-18', '2018-06-18 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(149, 5, '1', '2018-02-18', '2018-07-18 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(150, 5, '1', '2018-02-18', '2018-08-17 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(151, 5, '1', '2018-02-18', '2018-09-16 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(152, 5, '1', '2018-02-18', '2018-10-16 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(153, 5, '1', '2018-02-18', '2018-11-15 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(154, 5, '1', '2018-02-18', '2018-12-15 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(155, 5, '1', '2018-02-18', '2019-01-14 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(156, 5, '1', '2018-02-18', '2019-02-13 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(157, 5, '1', '2018-02-18', '2019-03-15 01:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(158, 5, '1', '2018-02-19', '2018-02-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(159, 5, '1', '2018-02-19', '2018-02-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(160, 5, '1', '2018-02-19', '2018-03-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(161, 5, '1', '2018-02-19', '2018-03-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(162, 5, '1', '2018-02-19', '2018-03-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(163, 5, '1', '2018-02-19', '2018-03-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(164, 5, '1', '2018-02-19', '2018-04-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(165, 5, '1', '2018-02-19', '2018-04-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(166, 5, '1', '2018-02-19', '2018-04-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(167, 5, '1', '2018-02-19', '2018-04-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(168, 5, '1', '2018-02-19', '2018-04-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(169, 5, '1', '2018-02-19', '2018-05-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(170, 5, '1', '2018-02-19', '2018-05-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(171, 5, '1', '2018-02-19', '2018-05-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(172, 5, '1', '2018-02-19', '2018-05-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(173, 5, '1', '2018-02-19', '2018-06-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(174, 5, '1', '2018-02-19', '2018-06-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(175, 5, '1', '2018-02-19', '2018-06-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(176, 5, '1', '2018-02-19', '2018-06-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(177, 5, '1', '2018-02-19', '2018-07-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(178, 5, '1', '2018-02-19', '2018-07-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(179, 5, '1', '2018-02-19', '2018-07-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(180, 5, '1', '2018-02-19', '2018-07-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(181, 5, '1', '2018-02-19', '2018-07-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(182, 5, '1', '2018-02-19', '2018-08-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(183, 5, '1', '2018-02-19', '2018-08-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(184, 5, '1', '2018-02-19', '2018-08-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(185, 5, '1', '2018-02-19', '2018-08-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(186, 5, '1', '2018-02-19', '2018-09-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(187, 5, '1', '2018-02-19', '2018-09-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(188, 5, '1', '2018-02-19', '2018-09-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(189, 5, '1', '2018-02-19', '2018-09-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(190, 5, '1', '2018-02-19', '2018-10-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(191, 5, '1', '2018-02-19', '2018-10-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(192, 5, '1', '2018-02-19', '2018-10-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(193, 5, '1', '2018-02-19', '2018-10-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(194, 5, '1', '2018-02-19', '2018-10-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(195, 5, '1', '2018-02-19', '2018-11-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(196, 5, '1', '2018-02-19', '2018-11-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(197, 5, '1', '2018-02-19', '2018-11-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(198, 5, '1', '2018-02-19', '2018-11-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(199, 5, '1', '2018-02-19', '2018-12-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(200, 5, '1', '2018-02-19', '2018-12-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(201, 5, '1', '2018-02-19', '2018-12-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(202, 5, '1', '2018-02-19', '2018-12-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1);
INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`) VALUES
(203, 5, '1', '2018-02-19', '2018-12-31 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(204, 5, '1', '2018-02-19', '2019-01-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(205, 5, '1', '2018-02-19', '2019-01-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(206, 5, '1', '2018-02-19', '2019-01-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(207, 5, '1', '2018-02-19', '2019-01-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(208, 5, '1', '2018-02-19', '2019-02-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(209, 5, '1', '2018-02-19', '2019-02-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(210, 5, '1', '2018-02-19', '2019-02-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(211, 5, '1', '2018-02-19', '2019-02-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(212, 5, '1', '2018-02-19', '2019-03-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(213, 5, '1', '2018-02-19', '2019-03-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(214, 5, '1', '2018-02-19', '2019-03-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(215, 5, '1', '2018-02-19', '2019-03-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(216, 5, '1', '2018-02-19', '2019-04-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(217, 5, '1', '2018-02-19', '2019-04-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(218, 5, '1', '2018-02-19', '2019-04-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(219, 5, '1', '2018-02-19', '2019-04-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(220, 5, '1', '2018-02-19', '2019-04-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(221, 5, '1', '2018-02-19', '2019-05-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(222, 5, '1', '2018-02-19', '2019-05-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(223, 5, '1', '2018-02-19', '2019-05-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(224, 5, '1', '2018-02-19', '2019-05-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(225, 5, '1', '2018-02-19', '2019-06-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(226, 5, '1', '2018-02-19', '2019-06-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(227, 5, '1', '2018-02-19', '2019-06-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(228, 5, '1', '2018-02-19', '2019-06-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(229, 5, '1', '2018-02-19', '2019-07-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(230, 5, '1', '2018-02-19', '2019-07-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(231, 5, '1', '2018-02-19', '2019-07-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(232, 5, '1', '2018-02-19', '2019-07-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(233, 5, '1', '2018-02-19', '2019-07-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(234, 5, '1', '2018-02-19', '2019-08-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(235, 5, '1', '2018-02-19', '2019-08-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(236, 5, '1', '2018-02-19', '2019-08-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(237, 5, '1', '2018-02-19', '2019-08-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(238, 5, '1', '2018-02-19', '2019-09-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(239, 5, '1', '2018-02-19', '2019-09-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(240, 5, '1', '2018-02-19', '2019-09-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(241, 5, '1', '2018-02-19', '2019-09-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(242, 5, '1', '2018-02-19', '2019-09-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(243, 5, '1', '2018-02-19', '2019-10-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(244, 5, '1', '2018-02-19', '2019-10-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(245, 5, '1', '2018-02-19', '2019-10-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(246, 5, '1', '2018-02-19', '2019-10-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(247, 5, '1', '2018-02-19', '2019-11-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(248, 5, '1', '2018-02-19', '2019-11-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(249, 5, '1', '2018-02-19', '2019-11-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(250, 5, '1', '2018-02-19', '2019-11-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(251, 5, '1', '2018-02-19', '2019-12-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(252, 5, '1', '2018-02-19', '2019-12-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(253, 5, '1', '2018-02-19', '2019-12-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(254, 5, '1', '2018-02-19', '2019-12-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(255, 5, '1', '2018-02-19', '2019-12-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(256, 5, '1', '2018-02-19', '2020-01-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(257, 5, '1', '2018-02-19', '2020-01-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(258, 5, '1', '2018-02-19', '2020-01-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(259, 5, '1', '2018-02-19', '2020-01-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(260, 5, '1', '2018-02-19', '2020-02-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(261, 5, '1', '2018-02-19', '2020-02-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(262, 5, '1', '2018-02-19', '2020-02-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(263, 5, '1', '2018-02-19', '2020-02-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(264, 5, '1', '2018-02-19', '2020-03-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(265, 5, '1', '2018-02-19', '2020-03-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(266, 5, '1', '2018-02-19', '2020-03-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(267, 5, '1', '2018-02-19', '2020-03-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(268, 5, '1', '2018-02-19', '2020-03-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(269, 5, '1', '2018-02-19', '2020-04-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(270, 5, '1', '2018-02-19', '2020-04-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(271, 5, '1', '2018-02-19', '2020-04-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(272, 5, '1', '2018-02-19', '2020-04-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(273, 5, '1', '2018-02-19', '2020-05-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(274, 5, '1', '2018-02-19', '2020-05-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(275, 5, '1', '2018-02-19', '2020-05-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(276, 5, '1', '2018-02-19', '2020-05-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(277, 5, '1', '2018-02-19', '2020-06-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(278, 5, '1', '2018-02-19', '2020-06-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(279, 5, '1', '2018-02-19', '2020-06-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(280, 5, '1', '2018-02-19', '2020-06-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(281, 5, '1', '2018-02-19', '2020-06-29 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(282, 5, '1', '2018-02-19', '2020-07-06 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(283, 5, '1', '2018-02-19', '2020-07-13 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(284, 5, '1', '2018-02-19', '2020-07-20 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(285, 5, '1', '2018-02-19', '2020-07-27 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(286, 5, '1', '2018-02-19', '2020-08-03 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(287, 5, '1', '2018-02-19', '2020-08-10 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(288, 5, '1', '2018-02-19', '2020-08-17 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(289, 5, '1', '2018-02-19', '2020-08-24 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(290, 5, '1', '2018-02-19', '2020-08-31 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(291, 5, '1', '2018-02-19', '2020-09-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(292, 5, '1', '2018-02-19', '2020-09-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(293, 5, '1', '2018-02-19', '2020-09-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(294, 5, '1', '2018-02-19', '2020-09-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(295, 5, '1', '2018-02-19', '2020-10-05 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(296, 5, '1', '2018-02-19', '2020-10-12 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(297, 5, '1', '2018-02-19', '2020-10-19 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(298, 5, '1', '2018-02-19', '2020-10-26 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(299, 5, '1', '2018-02-19', '2020-11-02 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(300, 5, '1', '2018-02-19', '2020-11-09 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(301, 5, '1', '2018-02-19', '2020-11-16 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(302, 5, '1', '2018-02-19', '2020-11-23 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(303, 5, '1', '2018-02-19', '2020-11-30 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(304, 5, '1', '2018-02-19', '2020-12-07 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(305, 5, '1', '2018-02-19', '2020-12-14 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(306, 5, '1', '2018-02-19', '2020-12-21 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(307, 5, '1', '2018-02-19', '2020-12-28 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(308, 5, '1', '2018-02-19', '2021-01-04 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(309, 5, '1', '2018-02-19', '2021-01-11 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(310, 5, '1', '2018-02-19', '2021-01-18 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(311, 5, '1', '2018-02-19', '2021-01-25 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(312, 5, '1', '2018-02-19', '2021-02-01 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(313, 5, '1', '2018-02-19', '2021-02-08 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(314, 5, '1', '2018-02-19', '2021-02-15 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(315, 5, '1', '2018-02-19', '2021-02-22 03:30:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(316, 5, '1', '2018-02-19', '2018-02-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(317, 5, '1', '2018-02-19', '2018-02-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(318, 5, '1', '2018-02-19', '2018-03-07 08:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(319, 5, '1', '2018-02-19', '2018-03-12 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 240, 12, 1),
(320, 5, '1', '2018-02-19', '2018-03-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(321, 5, '1', '2018-02-19', '2018-03-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(322, 5, '1', '2018-02-19', '2018-04-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(323, 5, '1', '2018-02-19', '2018-04-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(324, 5, '1', '2018-02-19', '2018-04-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(325, 5, '1', '2018-02-19', '2018-04-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(326, 5, '1', '2018-02-19', '2018-04-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(327, 5, '1', '2018-02-19', '2018-05-07 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(328, 5, '1', '2018-02-19', '2018-05-14 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(329, 5, '1', '2018-02-19', '2018-05-21 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(330, 5, '1', '2018-02-19', '2018-05-28 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(331, 5, '1', '2018-02-19', '2018-06-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(332, 5, '1', '2018-02-19', '2018-06-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(333, 5, '1', '2018-02-19', '2018-06-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(334, 5, '1', '2018-02-19', '2018-06-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(335, 5, '1', '2018-02-19', '2018-07-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(336, 5, '1', '2018-02-19', '2018-07-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(337, 5, '1', '2018-02-19', '2018-07-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(338, 5, '1', '2018-02-19', '2018-07-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(339, 5, '1', '2018-02-19', '2018-07-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(340, 5, '1', '2018-02-19', '2018-08-06 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(341, 5, '1', '2018-02-19', '2018-08-13 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(342, 5, '1', '2018-02-19', '2018-08-20 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(343, 5, '1', '2018-02-19', '2018-08-27 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(344, 5, '1', '2018-02-19', '2018-09-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(345, 5, '1', '2018-02-19', '2018-09-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(346, 5, '1', '2018-02-19', '2018-09-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(347, 5, '1', '2018-02-19', '2018-09-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(348, 5, '1', '2018-02-19', '2018-10-01 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(349, 5, '1', '2018-02-19', '2018-10-08 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(350, 5, '1', '2018-02-19', '2018-10-15 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(351, 5, '1', '2018-02-19', '2018-10-22 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(352, 5, '1', '2018-02-19', '2018-10-29 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(353, 5, '1', '2018-02-19', '2018-11-05 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(354, 5, '1', '2018-02-19', '2018-11-12 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(355, 5, '1', '2018-02-19', '2018-11-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(356, 5, '1', '2018-02-19', '2018-11-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(357, 5, '1', '2018-02-19', '2018-12-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(358, 5, '1', '2018-02-19', '2018-12-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(359, 5, '1', '2018-02-19', '2018-12-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(360, 5, '1', '2018-02-19', '2018-12-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(361, 5, '1', '2018-02-19', '2018-12-31 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(362, 5, '1', '2018-02-19', '2019-01-07 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(363, 5, '1', '2018-02-19', '2019-01-14 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(364, 5, '1', '2018-02-19', '2019-01-21 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(365, 5, '1', '2018-02-19', '2019-01-28 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(366, 5, '1', '2018-02-19', '2019-02-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(367, 5, '1', '2018-02-19', '2019-02-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(368, 5, '1', '2018-02-19', '2019-02-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(369, 5, '1', '2018-02-19', '2019-02-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(370, 5, '1', '2018-02-19', '2019-03-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(371, 5, '1', '2018-02-19', '2019-03-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(372, 5, '1', '2018-02-19', '2019-03-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(373, 5, '1', '2018-02-19', '2019-03-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(374, 5, '1', '2018-02-19', '2019-04-01 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(375, 5, '1', '2018-02-19', '2019-04-08 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(376, 5, '1', '2018-02-19', '2019-04-15 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(377, 5, '1', '2018-02-19', '2019-04-22 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(378, 5, '1', '2018-02-19', '2019-04-29 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(379, 5, '1', '2018-02-19', '2019-05-06 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(380, 5, '1', '2018-02-19', '2019-05-13 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(381, 5, '1', '2018-02-19', '2019-05-20 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(382, 5, '1', '2018-02-19', '2019-05-27 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(383, 5, '1', '2018-02-19', '2019-06-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(384, 5, '1', '2018-02-19', '2019-06-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(385, 5, '1', '2018-02-19', '2019-06-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(386, 5, '1', '2018-02-19', '2019-06-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(387, 5, '1', '2018-02-19', '2019-07-01 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(388, 5, '1', '2018-02-19', '2019-07-08 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(389, 5, '1', '2018-02-19', '2019-07-15 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(390, 5, '1', '2018-02-19', '2019-07-22 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(391, 5, '1', '2018-02-19', '2019-07-29 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(392, 5, '1', '2018-02-19', '2019-08-05 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(393, 5, '1', '2018-02-19', '2019-08-12 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(394, 5, '1', '2018-02-19', '2019-08-19 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(395, 5, '1', '2018-02-19', '2019-08-26 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(396, 5, '1', '2018-02-19', '2019-09-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(397, 5, '1', '2018-02-19', '2019-09-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(398, 5, '1', '2018-02-19', '2019-09-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(399, 5, '1', '2018-02-19', '2019-09-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(400, 5, '1', '2018-02-19', '2019-09-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(401, 5, '1', '2018-02-19', '2019-10-07 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(402, 5, '1', '2018-02-19', '2019-10-14 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(403, 5, '1', '2018-02-19', '2019-10-21 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(404, 5, '1', '2018-02-19', '2019-10-28 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(405, 5, '1', '2018-02-19', '2019-11-04 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(406, 5, '1', '2018-02-19', '2019-11-11 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(407, 5, '1', '2018-02-19', '2019-11-18 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(408, 5, '1', '2018-02-19', '2019-11-25 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(409, 5, '1', '2018-02-19', '2019-12-02 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(410, 5, '1', '2018-02-19', '2019-12-09 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1);
INSERT INTO `orden_trabajo` (`id_orden`, `id_tarea`, `nro`, `fecha`, `fecha_program`, `fecha_inicio`, `fecha_entrega`, `fecha_terminada`, `fecha_aviso`, `fecha_entregada`, `descripcion`, `cliId`, `estado`, `id_usuario`, `id_usuario_a`, `id_usuario_e`, `id_sucursal`, `id_proveedor`, `id_solicitud`, `tipo`, `id_equipo`, `duracion`, `id_tareapadre`, `id_empresa`) VALUES
(411, 5, '1', '2018-02-19', '2019-12-16 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(412, 5, '1', '2018-02-19', '2019-12-23 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(413, 5, '1', '2018-02-19', '2019-12-30 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(414, 5, '1', '2018-02-19', '2020-01-06 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(415, 5, '1', '2018-02-19', '2020-01-13 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(416, 5, '1', '2018-02-19', '2020-01-20 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(417, 5, '1', '2018-02-19', '2020-01-27 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(418, 5, '1', '2018-02-19', '2020-02-03 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(419, 5, '1', '2018-02-19', '2020-02-10 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(420, 5, '1', '2018-02-19', '2020-02-17 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(421, 5, '1', '2018-02-19', '2020-02-24 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 12, '3', 4, 60, 12, 1),
(422, 4, '1', '2018-02-19', '2018-02-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(423, 4, '1', '2018-02-19', '2018-03-05 07:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 150, 11, 1),
(424, 4, '1', '2018-02-19', '2018-03-22 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(425, 4, '1', '2018-02-19', '2018-04-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(426, 4, '1', '2018-02-19', '2018-04-27 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(427, 4, '1', '2018-02-19', '2018-05-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(428, 4, '1', '2018-02-19', '2018-05-21 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(429, 4, '1', '2018-02-19', '2018-06-05 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(430, 4, '1', '2018-02-19', '2018-06-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(431, 4, '1', '2018-02-19', '2018-07-05 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(432, 4, '1', '2018-02-19', '2018-07-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(433, 4, '1', '2018-02-19', '2018-08-04 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(434, 4, '1', '2018-02-19', '2018-08-19 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(435, 4, '1', '2018-02-19', '2018-09-03 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(436, 4, '1', '2018-02-19', '2018-09-18 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(437, 4, '1', '2018-02-19', '2018-10-03 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(438, 4, '1', '2018-02-19', '2018-10-18 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(439, 4, '1', '2018-02-19', '2018-11-02 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(440, 4, '1', '2018-02-19', '2018-11-17 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(441, 4, '1', '2018-02-19', '2018-12-02 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(442, 4, '1', '2018-02-19', '2018-12-17 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(443, 4, '1', '2018-02-19', '2019-01-01 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(444, 4, '1', '2018-02-19', '2019-01-16 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(445, 4, '1', '2018-02-19', '2019-01-31 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(446, 4, '1', '2018-02-19', '2019-02-15 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(447, 4, '1', '2018-02-19', '2019-03-02 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(448, 4, '1', '2018-02-19', '2019-03-17 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(449, 4, '1', '2018-02-19', '2019-04-01 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(450, 4, '1', '2018-02-19', '2019-04-16 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(451, 4, '1', '2018-02-19', '2019-05-01 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(452, 4, '1', '2018-02-19', '2019-05-16 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(453, 4, '1', '2018-02-19', '2019-05-31 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(454, 4, '1', '2018-02-19', '2019-06-15 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(455, 4, '1', '2018-02-19', '2019-06-30 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(456, 4, '1', '2018-02-19', '2019-07-15 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(457, 4, '1', '2018-02-19', '2019-07-30 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(458, 4, '1', '2018-02-19', '2019-08-14 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(459, 4, '1', '2018-02-19', '2019-08-29 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(460, 4, '1', '2018-02-19', '2019-09-13 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(461, 4, '1', '2018-02-19', '2019-09-28 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(462, 4, '1', '2018-02-19', '2019-10-13 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(463, 4, '1', '2018-02-19', '2019-10-28 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(464, 4, '1', '2018-02-19', '2019-11-12 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(465, 4, '1', '2018-02-19', '2019-11-27 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(466, 4, '1', '2018-02-19', '2019-12-12 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(467, 4, '1', '2018-02-19', '2019-12-27 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(468, 4, '1', '2018-02-19', '2020-01-11 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(469, 4, '1', '2018-02-19', '2020-01-26 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(470, 4, '1', '2018-02-19', '2020-02-10 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(471, 4, '1', '2018-02-19', '2020-02-25 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(472, 4, '1', '2018-02-19', '2020-03-11 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(473, 4, '1', '2018-02-19', '2020-03-26 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(474, 4, '1', '2018-02-19', '2020-04-10 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(475, 4, '1', '2018-02-19', '2020-04-25 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(476, 4, '1', '2018-02-19', '2020-05-10 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(477, 4, '1', '2018-02-19', '2020-05-25 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(478, 4, '1', '2018-02-19', '2020-06-09 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(479, 4, '1', '2018-02-19', '2020-06-24 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(480, 4, '1', '2018-02-19', '2020-07-09 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(481, 4, '1', '2018-02-19', '2020-07-24 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(482, 4, '1', '2018-02-19', '2020-08-08 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(483, 4, '1', '2018-02-19', '2020-08-23 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(484, 4, '1', '2018-02-19', '2020-09-07 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(485, 4, '1', '2018-02-19', '2020-09-22 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(486, 4, '1', '2018-02-19', '2020-10-07 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(487, 4, '1', '2018-02-19', '2020-10-22 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(488, 4, '1', '2018-02-19', '2020-11-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(489, 4, '1', '2018-02-19', '2020-11-21 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(490, 4, '1', '2018-02-19', '2020-12-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(491, 4, '1', '2018-02-19', '2020-12-21 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(492, 4, '1', '2018-02-19', '2021-01-05 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(493, 4, '1', '2018-02-19', '2021-01-20 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(494, 4, '1', '2018-02-19', '2021-02-04 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(495, 4, '1', '2018-02-19', '2021-02-19 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(496, 4, '1', '2018-02-19', '2021-03-06 09:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 1, 'C', 1, 1, 1, 1, 0, 11, '3', 6, 60, 11, 1),
(497, 16, '1', '2018-02-19', '2018-02-19 12:02:00', '2018-02-10 00:00:00', '2018-03-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'As', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(498, 16, '1', '2018-02-19', '2018-02-28 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(499, 16, '1', '2018-02-19', '2018-03-30 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(500, 16, '1', '2018-02-19', '2018-04-29 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(501, 16, '1', '2018-02-19', '2018-05-29 12:02:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(502, 16, '1', '2018-02-19', '2018-02-21 11:23:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(503, 16, '1', '2018-02-19', '2018-03-23 11:23:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(504, 16, '1', '2018-02-19', '2018-04-22 11:23:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(505, 16, '1', '2018-02-19', '2018-02-22 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(506, 16, '1', '2018-02-19', '2018-03-24 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(507, 16, '1', '2018-02-19', '2018-04-23 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(508, 16, '1', '2018-02-19', '2018-05-23 12:22:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Predictivo', 1, 'C', 3, 1, 1, 1, 0, 8, '5', 4, 60, 8, 1),
(509, 12, '1', '2018-02-26', '2018-02-14 11:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 1, 'C', 1, 1, 1, 1, 0, 14, '4', 4, 60, 14, 1),
(510, 1, '1', '2018-02-26', '2018-02-05 15:00:00', '2018-02-05 19:01:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'C', 1, 1, 1, 1, 0, 13, '2', 9, 60, 13, 1),
(511, 1, '1', '2018-02-26', '2018-02-23 17:00:00', '2018-02-08 14:38:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ruido en cuerpo de bomba int 0057A', 1, 'C', 1, 1, 1, 1, 0, 17, '2', 10, 60, 17, 1),
(512, 1, '1', '2018-02-26', '2018-02-21 22:00:00', '2018-02-05 19:01:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'bateria descargada\n\n', 1, 'C', 1, 1, 1, 1, 0, 13, '2', 9, 60, 13, 1),
(513, 5, '1', '2018-02-26', '2018-02-23 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(514, 5, '1', '2018-02-26', '2018-03-25 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(515, 5, '1', '2018-02-26', '2018-04-24 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(516, 5, '1', '2018-02-26', '2018-05-24 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(517, 5, '1', '2018-02-26', '2018-06-23 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(518, 5, '1', '2018-02-26', '2018-07-23 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(519, 5, '1', '2018-02-26', '2018-08-22 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(520, 5, '1', '2018-02-26', '2018-09-21 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(521, 5, '1', '2018-02-26', '2018-10-21 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(522, 5, '1', '2018-02-26', '2018-11-20 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(523, 5, '1', '2018-02-26', '2018-12-20 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(524, 5, '1', '2018-02-26', '2019-01-19 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(525, 5, '1', '2018-02-26', '2019-02-18 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(526, 5, '1', '2018-02-26', '2019-03-20 16:00:00', '2018-01-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REVISE LA BOMBA DE AGUA', 1, 'C', 1, 1, 1, 1, 0, 22, '3', 6, 60, 22, 1),
(527, 12, '1', '2018-02-26', '2018-02-22 19:00:00', '2018-02-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 1, 'C', 1, 1, 1, 1, 0, 14, '4', 4, 60, 14, 1),
(528, 8, '1', '2018-03-09', '2018-03-22 02:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 1, 'C', 1, 1, 1, 1, 0, 16, '3', 4, 30, 16, 1),
(529, 9, '1', '2018-03-10', '2018-03-14 00:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE LOS FILTROS DE ACEITE.', 1, 'C', 1, 1, 1, 1, 0, 17, '3', 4, 0, 17, 1),
(530, 8, '1', '2018-03-12', '2018-03-12 01:00:00', '2018-01-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 1, 'C', 1, 1, 1, 1, 0, 16, '3', 4, 0, 16, 1),
(531, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-03-12 05:28:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'weqeqwqweqweqwewqeqwe\neqweqweqwe\nqweqw', 1, 'C', 1, 1, 0, 1, 2, 0, '1', 4, 0, NULL, 1),
(532, NULL, '', '0000-00-00', '0000-00-00 00:00:00', '2018-03-12 14:17:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'editado', 1, 'P', 1, 1, 0, 1, 1, 0, '1', 8, 0, NULL, 1),
(533, 1, '1', '2018-06-19', '2018-06-19 05:00:00', '2018-06-19 11:09:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla test', 1, 'AN', 3, 1, 1, 1, 0, 27, '2', 4, 60, 27, 1),
(534, 1, '1', '2018-06-21', '2018-06-21 05:15:00', '2018-06-19 11:17:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla testing 1', 1, 'AN', 3, 1, 1, 1, 0, 29, '2', 4, 60, 29, 1),
(535, 1, '1', '2018-06-21', '2018-06-21 18:00:00', '2018-06-19 11:09:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla test', 1, 'C', 3, 1, 1, 1, 0, 27, '2', 4, 60, 27, 1),
(536, 1, '', '0000-00-00', '0000-00-00 00:00:00', '2018-06-22 10:33:00', '2018-06-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'orden de trabajos testing 11 editado', 1, 'C', 3, 3, 1, 1, 1, 0, '1', 11, 60, NULL, 1),
(537, 1, '1', '2018-06-25', '2018-06-26 15:00:00', '2018-06-25 09:29:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'fala ttesting 25-06', 1, 'C', 3, 1, 1, 1, 0, 31, '2', 4, 60, 31, 6),
(538, 1, '1', '2018-06-28', '2018-06-28 20:00:00', '2018-06-28 12:52:09', '2018-06-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'As', 3, 3, 1, 1, 1, 32, '2', 4, 60, 32, 6),
(539, 1, '1', '2018-06-28', '2018-06-28 15:00:00', '2018-06-28 12:52:09', '2018-06-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'As', 3, 3, 1, 1, 0, 32, '2', 4, 60, 32, 6),
(540, 1, '1', '2018-06-28', '2018-06-28 15:00:00', '2018-06-28 12:52:09', '2018-06-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'As', 3, 3, 1, 1, 0, 32, '2', 4, 60, 32, 6),
(541, 1, '1', '2018-06-28', '2018-06-28 15:00:00', '2018-06-28 12:52:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'falla calendario ', 1, 'C', 3, 1, 1, 1, 1, 32, '2', 4, 60, 32, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametroequipo`
--

CREATE TABLE `parametroequipo` (
  `id` int(11) NOT NULL,
  `paramId` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `fechahora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametroequipo`
--

INSERT INTO `parametroequipo` (`id`, `paramId`, `id_equipo`, `valor`, `fechahora`) VALUES
(1, 1, 1, '67', '2017-11-09 16:09:02'),
(2, 1, 1, '56', '2017-11-16 08:57:55'),
(3, 1, 1, '23', '2017-11-21 11:44:46'),
(4, 1, 1, '150', '2017-11-29 04:38:11'),
(5, 2, 2, '88888', '2017-11-29 04:39:02'),
(6, 3, 3, '34', '2017-12-02 03:01:45'),
(7, 3, 3, '34', '2017-12-02 03:02:41'),
(8, 3, 3, '45', '2017-12-02 03:02:59'),
(9, 3, 3, '34', '2017-12-02 03:26:30'),
(10, 2, 2, '45', '2017-12-02 03:33:22'),
(11, 1, 3, '444', '2017-12-02 03:43:37'),
(12, 1, 3, '56', '2017-12-02 03:45:01'),
(13, 1, 3, '56', '2017-12-02 03:45:59'),
(14, 1, 3, '45', '2017-12-02 03:50:41'),
(15, 3, 3, '55555', '2017-12-02 04:25:07'),
(16, 3, 3, '444', '2017-12-02 04:27:55'),
(17, 3, 3, '445', '2017-12-02 04:58:08'),
(18, 1, 3, '12', '2017-12-02 05:02:48'),
(19, 1, 3, '45', '2017-12-02 06:46:42'),
(20, 1, 1, '78', '2017-12-11 04:50:13'),
(21, 1, 2, '12', '2017-12-11 04:50:23'),
(22, 1, 1, '25', '2017-12-11 04:56:50'),
(23, 1, 2, '34', '2017-12-11 11:28:24'),
(24, 1, 2, '45', '2017-12-11 11:28:40'),
(25, 1, 2, '34', '2017-12-11 11:29:00'),
(26, 2, 1, '44', '2017-12-11 11:29:15'),
(27, 1, 2, '444', '2017-12-11 11:29:29'),
(28, 8, 4, '45', '2018-02-08 17:55:28'),
(29, 8, 4, '67', '2018-02-08 17:56:05'),
(30, 10, 4, '200', '2018-06-27 12:38:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `paramId` int(11) NOT NULL,
  `paramdescrip` varchar(255) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`paramId`, `paramdescrip`, `min`, `id_empresa`) VALUES
(8, 'TEMPERATURA', NULL, 6),
(10, 'VIBRACION', NULL, 6),
(11, 'AMPERAJE', NULL, 6),
(12, 'humedad', NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predictivo`
--

CREATE TABLE `predictivo` (
  `predId` int(11) NOT NULL,
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
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(18, 11, '15', '2018-06-28', 'Diario', 21, 1, 'C', 60, 1, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preventivo`
--

CREATE TABLE `preventivo` (
  `prevId` int(11) NOT NULL,
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
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `preventivo`
--

INSERT INTO `preventivo` (`prevId`, `id_equipo`, `id_tarea`, `perido`, `cantidad`, `ultimo`, `id_componente`, `critico1`, `fechaprobable`, `horash`, `estadoprev`, `prev_duracion`, `id_unidad`, `prev_canth`, `prev_adjunto`, `id_empresa`) VALUES
(1, 1, 1, 'diario', 30, '2017-10-01', 1, 29, NULL, 0, 'AN', 0, 0, 0, '', 0),
(2, 1, 1, 'diario', 30, '2017-11-23', 1, 20, NULL, 0, 'AN', 0, 0, 0, '', 0),
(3, 1, 2, 'diario', 15, '0000-00-00', 1, 0, NULL, 15, 'AN', 0, 0, 0, '', 0),
(4, 3, 1, 'diario', 90, '2017-12-04', 3, 0, NULL, 0, 'AN', 0, 0, 0, '', 0),
(5, 3, 1, 'diario', 30, '2017-12-05', 4, 0, NULL, 0, 'C', 0, 0, 0, '', 0),
(6, 3, 1, 'diario', 45, '2017-12-05', 3, 0, NULL, 0, 'C', 0, 0, 0, '', 0),
(7, 3, 2, 'diario', 30, '2017-12-05', 3, 0, NULL, 0, 'C', 0, 0, 0, '', 0),
(8, 3, 2, 'diario', 30, '2017-12-06', 3, 0, NULL, 0, 'C', 0, 0, 0, '', 0),
(9, 1, 1, 'diario', 30, '2018-01-18', 1, 0, NULL, 0, 'AN', 0, 0, 0, '', 0),
(10, 3, 1, 'diario', 23, '2018-01-18', 4, 0, NULL, 23, 'C', 0, 0, 0, '', 0),
(11, 6, 4, 'diario', 15, '2018-01-18', 13, 0, NULL, 0, 'C', 0, 0, 0, '', 0),
(12, 4, 5, 'diario', 7, '2018-01-18', 13, 0, NULL, 0, 'C', 0, 0, 0, '', 0),
(13, 4, 6, 'diario', 7, '2018-01-18', 13, 0, NULL, 160015, 'C', 0, 0, 0, '', 0),
(14, 4, 5, 'diario', 30, '2018-01-18', 13, 0, NULL, 0, 'C', 0, 0, 0, '', 0),
(15, 1, 7, 'diario', 30, '2018-01-18', 13, 0, NULL, 0, 'C', 0, 0, 0, '', 0),
(16, 4, 8, 'diario', 60, '2018-01-18', 13, 0, NULL, 2, 'C', 0, 0, 0, '', 0),
(17, 4, 9, 'diario', 60, '2018-01-18', 13, 0, NULL, 1, 'AN', 0, 0, 0, '', 6),
(18, 4, 10, 'diario', 60, '2018-01-18', 13, 0, NULL, 0, 'AN', 0, 0, 0, '', 6),
(19, 4, 12, 'diario', 365, '2018-01-18', 13, 0, NULL, 8, 'AN', 0, 0, 0, '', 6),
(20, 4, 13, 'diario', 7, '2018-01-18', 13, 0, NULL, 0, 'AN', 0, 0, 0, '', 6),
(21, 0, 14, 'diario', 7, '2018-01-18', 13, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(22, 6, 5, 'diario', 30, '2018-01-25', 13, 0, NULL, 150015, 'AN', 0, 0, 0, '', 6),
(23, 0, 5, 'Diario', 2, '2018-05-02', 13, 0, NULL, 3, 'C', 0, 0, 0, '', 6),
(24, 0, 10, 'Diario', 30, '2018-04-25', 13, 0, NULL, 300, 'C', 0, 0, 0, '', 6),
(25, 0, 5, 'Diario', 12, '2018-04-25', 16, 0, NULL, 800, 'C', 0, 0, 0, '', 6),
(26, 0, 4, 'Diario', 33, '2018-04-25', 16, 0, NULL, 2200, 'C', 0, 0, 0, '', 6),
(27, 7, 10, 'Diario', 15, '2018-03-30', 13, 0, NULL, 300, 'C', 0, 0, 0, '', 6),
(28, 7, 4, 'Diario', 12, '0000-00-00', 13, 0, NULL, 300, 'C', 0, 0, 0, '', 6),
(29, 7, 6, 'Diario', 15, '0000-00-00', 13, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(30, 10, 4, 'Diario', 20, '0000-00-00', 15, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(31, 10, 5, 'Diario', 15, '2018-04-24', 20, 0, NULL, 800, 'C', 0, 0, 0, '', 6),
(32, 10, 5, 'Diario', 44, '2018-04-24', 13, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(33, 16, 15, 'Diario', 2, '0000-00-00', 5, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(34, 16, 5, 'Diario', 0, '0000-00-00', 5, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(35, 16, 9, 'Diario', 45, '2018-06-11', 5, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(36, 16, 6, 'Diario', 11, '0000-00-00', 5, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(37, 16, 5, 'Diario', 22, '0000-00-00', 4, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(38, 16, 15, 'Diario', 33, '0000-00-00', 5, 0, NULL, 0, 'C', 0, 0, 0, '', 6),
(39, 4, 0, 'Diario', 22, '2018-04-04', 19, 0, NULL, 8, 'C', 4, 2, 2, '', 6),
(40, 6, 10, 'Diario', 22, '2018-06-07', 16, 0, NULL, 4, 'C', 2, 2, 2, NULL, 6),
(41, 6, 10, 'Diario', 22, '2018-06-07', 16, 0, NULL, 6, 'C', 2, 2, 2, 'prev_41', 6),
(42, 0, 0, '', 0, '0000-00-00', 0, 0, NULL, 0, 'C', 0, 0, 0, '42_6_2018-06-07-16-19-07', 6),
(43, 4, 6, '\n                                      \n          ', 22, '0000-00-00', 17, 0, NULL, 4, 'AN', 0, -1, 0, '43_6_2018-06-08-09-49-50', 6),
(44, 4, 6, 'Diario', 22, '2018-06-08', 17, 0, NULL, 4, 'AN', 2, 2, 2, '44_6_2018-06-08-09-58-08', 6),
(45, 5, 4, 'Diario', 2, '2018-06-08', 13, 0, NULL, 4, 'AN', 2, 2, 2, '45_6_2018-06-08-10-14-47', 6),
(46, 5, 4, 'Diario', 2, '2018-06-08', 13, 0, NULL, 4, 'AN', 2, 2, 2, '46_6_2018-06-08-10-16-09', 6),
(47, 5, 4, 'Diario', 2, '2018-03-21', 13, 0, NULL, 4, 'C', 0, -1, 0, '47_6_2018-06-08-10-18-25.pdf', 6),
(48, 5, 4, 'Diario', 2, '0000-00-00', 13, 0, NULL, 4, 'C', 0, -1, 0, '48_6_2018-06-08-10-33-08.pdf', 6),
(49, 5, 4, 'Diario', 2, '2018-05-07', 13, 0, NULL, 4, 'C', 0, -1, 0, '49_6_2018-06-08-10-37-48.pdf', 6),
(50, 5, 4, 'Diario', 2, '2018-05-07', 13, 0, NULL, 4, 'C', 0, -1, 0, '50_6_2018-06-08-10-39-02.png', 6),
(51, 5, 4, '\n                                      \n          ', 2, '2018-05-07', 13, 0, NULL, 4, 'C', 0, -1, 0, '51_6_2018-06-08-10-41-33.png', 6),
(52, 5, 4, '\n                                      \n          ', 2, '2018-05-07', 13, 0, NULL, 4, 'C', 0, -1, 0, NULL, 6),
(53, 5, 4, 'Diario', 2, '2018-06-08', 13, 0, NULL, 4, 'C', 2, 2, 2, '53_6_2018-06-08-10-45-35.xlsx', 6),
(54, 7, 15, 'Diario', 22, '2018-06-08', 13, 0, NULL, 2, 'C', 2, 2, 1, '54_6_2018-06-08-19-25-23.pdf', 6),
(55, 10, 15, 'Diario', 25, '2018-06-14', 20, 0, NULL, 2, 'AN', 1, 2, 2, NULL, 6),
(56, 10, 8, '\n                                      \n          ', 30, '0000-00-00', 13, 0, NULL, 2, 'AN', 0, -1, 0, '56_6_2018-06-15-15-53-05.jpg', 6),
(57, 4, 4, 'Diario', 5, '2018-06-28', 13, 0, NULL, 10, 'C', 5, 2, 2, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE `proceso` (
  `id_proceso` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `proceso`
--

INSERT INTO `proceso` (`id_proceso`, `descripcion`, `id_empresa`) VALUES
(1, 'un proceso nuevo 1', 0),
(2, 'nuevo proceso 001', 0),
(3, 'Extracción y Transporte', 0),
(4, 'proceso nuevo', 6),
(5, 'proceso emp 6', 6),
(6, 'proceso testing', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitos`
--

CREATE TABLE `remitos` (
  `remitoId` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `provid` int(11) NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `remitos`
--

INSERT INTO `remitos` (`remitoId`, `fecha`, `provid`, `comprobante`) VALUES
(1, '0000-00-00 00:00:00', 1, '233'),
(2, '0000-00-00 00:00:00', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

CREATE TABLE `rubro` (
  `id_rubro` int(10) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `id_sector` int(10) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sector`
--

INSERT INTO `sector` (`id_sector`, `descripcion`, `id_empresa`) VALUES
(1, 'Planta', 6),
(3, 'Administracion', 6),
(4, 'Perforación', 0),
(5, 'Carguío', 0),
(6, 'Auxiliar', 0),
(7, 'etapa/ sector 6', 6),
(8, 'sector testing', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE `seguro` (
  `id_seguro` int(11) NOT NULL,
  `asegurado` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `ref` int(11) NOT NULL,
  `numero_pliza` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_vigencia` datetime NOT NULL,
  `cobertura` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

CREATE TABLE `setupparam` (
  `id_equipo` int(11) NOT NULL,
  `id_parametro` int(11) NOT NULL,
  `maximo` double NOT NULL,
  `minimo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `setupparam`
--

INSERT INTO `setupparam` (`id_equipo`, `id_parametro`, `maximo`, `minimo`) VALUES
(1, 1, 96, 20),
(2, 1, 80, 10),
(3, 1, 39, 56),
(1, 2, 80, 10),
(1, 3, 80, 15),
(2, 4, 20, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisactions`
--

CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL,
  `actDescription` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL,
  `grpName` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpDash` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisgroups`
--

INSERT INTO `sisgroups` (`grpId`, `grpName`, `grpDash`) VALUES
(1, 'Administrador', 'Otrabajo'),
(2, 'Vendedor', 'Sservicio'),
(3, 'Depósito', 'Sservicio'),
(4, 'Operario1', 'Sservicio'),
(5, 'Supervisor de Taller', 'Sservicio'),
(6, 'Grupo Test', 'Equipo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisgroupsactions`
--

CREATE TABLE `sisgroupsactions` (
  `grpactId` int(11) NOT NULL,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisgroupsactions`
--

INSERT INTO `sisgroupsactions` (`grpactId`, `grpId`, `menuAccId`) VALUES
(154, 151, 1),
(158, 158, 1),
(159, 159, 1),
(160, 160, 1),
(166, 6, 151),
(841, 1, 6),
(842, 1, 7),
(843, 1, 8),
(844, 1, 9),
(845, 1, 10),
(846, 1, 11),
(847, 1, 12),
(848, 1, 13),
(849, 1, 14),
(850, 1, 15),
(851, 1, 16),
(852, 1, 17),
(853, 1, 18),
(854, 1, 19),
(855, 1, 20),
(856, 1, 21),
(857, 1, 23),
(858, 1, 24),
(859, 1, 25),
(860, 1, 151),
(861, 1, 26),
(862, 1, 27),
(863, 1, 28),
(864, 1, 29),
(865, 1, 30),
(866, 1, 31),
(867, 1, 32),
(868, 1, 33),
(869, 1, 34),
(870, 1, 35),
(871, 1, 36),
(872, 1, 37),
(873, 1, 38),
(874, 1, 39),
(875, 1, 40),
(876, 1, 41),
(877, 1, 42),
(878, 1, 43),
(879, 1, 115),
(880, 1, 116),
(881, 1, 117),
(882, 1, 155),
(883, 1, 156),
(884, 1, 157),
(885, 1, 118),
(886, 1, 119),
(887, 1, 120),
(888, 1, 121),
(889, 1, 122),
(890, 1, 123),
(891, 1, 152),
(892, 1, 153),
(893, 1, 154),
(894, 1, 177),
(895, 1, 178),
(896, 1, 179),
(897, 1, 180),
(898, 1, 64),
(899, 1, 65),
(900, 1, 66),
(901, 1, 67),
(902, 1, 68),
(903, 1, 69),
(904, 1, 70),
(905, 1, 71),
(906, 1, 72),
(907, 1, 73),
(908, 1, 74),
(909, 1, 75),
(910, 1, 79),
(911, 1, 80),
(912, 1, 81),
(913, 1, 1),
(914, 1, 2),
(915, 1, 3),
(916, 1, 4),
(917, 1, 85),
(918, 1, 86),
(919, 1, 87),
(920, 1, 88),
(921, 1, 90),
(922, 1, 91),
(923, 1, 92),
(924, 1, 93),
(925, 1, 94),
(926, 1, 95),
(927, 1, 96),
(928, 1, 97),
(929, 1, 98),
(930, 1, 99),
(931, 1, 100),
(932, 1, 101),
(933, 1, 102),
(934, 1, 103),
(935, 1, 104),
(936, 1, 105),
(937, 1, 106),
(938, 1, 107),
(939, 1, 108),
(940, 1, 109),
(941, 1, 110),
(942, 1, 111),
(943, 1, 170),
(944, 1, 171),
(945, 1, 172),
(946, 1, 127),
(947, 1, 128),
(948, 1, 129),
(949, 1, 130),
(950, 1, 132),
(951, 1, 136),
(952, 1, 137),
(953, 1, 138),
(954, 1, 139),
(955, 1, 140),
(956, 1, 141),
(957, 1, 142),
(958, 1, 143),
(959, 1, 144),
(960, 1, 145),
(961, 1, 146),
(962, 1, 147),
(963, 1, 148),
(964, 1, 149),
(965, 1, 150),
(966, 1, 45),
(967, 1, 46),
(968, 1, 47),
(969, 1, 48),
(970, 1, 49),
(971, 1, 50),
(972, 1, 54),
(973, 1, 55),
(974, 1, 56),
(975, 1, 57),
(976, 1, 58),
(977, 1, 59),
(978, 1, 60),
(987, 4, 116),
(988, 4, 155),
(989, 4, 156);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenu`
--

CREATE TABLE `sismenu` (
  `id` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sismenu`
--

INSERT INTO `sismenu` (`id`, `parent`, `name`, `icon`, `slug`, `number`) VALUES
(1, 29, 'Clientes', 'fa fa-file-picture-o', 'empresa', 1),
(2, NULL, 'Seguridad', 'fa fa-lock', '', 2),
(3, 2, 'Usuarios', 'fa fa-fw fa-user', 'user', 2),
(4, 2, 'Grupos', 'fa fa-fw fa-users', 'group', 1),
(5, 2, 'Menu', 'fa fa-fw fa-bars', 'menu', 3),
(6, 2, 'Database', 'fa fa-fw fa-database', 'backup', 4),
(7, NULL, 'Mantenimiento', 'fa  fa-wrench ', '', 3),
(8, 7, 'Equipos', 'fa fa-cogs', 'Equipo', 1),
(9, 7, 'Componentes', 'fa fa-cogs', 'Componente', 2),
(10, 7, 'Preventivo', 'fa fa-tasks', 'Preventivo', 4),
(12, 7, 'Backlog', 'fa fa-tasks', 'Backlog', 5),
(13, 7, 'Registro_de_Parametros', 'fa fa-tasks', 'Lectura', 10),
(14, 7, 'Predictivo', 'fa fa-tasks', 'Predictivo', 7),
(15, 7, 'Solicitud_de_Servicio', 'fa fa-sitemap', 'Sservicio', 3),
(16, NULL, 'Pañol', 'fa fa-briefcase', '', 4),
(17, 59, 'Articulos', 'fa fa-barcode ', 'Article', 1),
(18, 59, 'Stock', 'fa fa-cubes', 'Lote', 2),
(20, 59, 'Orden_Insumos', 'fa fa-check', 'Ordeninsumo', 3),
(21, 59, 'Remitos', 'fa fa-paperclip ', 'Remito', 4),
(23, 16, 'Herramientas', 'fa fa-sign-out ', 'Herramienta', 5),
(24, 16, 'Salida_Herramientas', 'fa fa-paper-plane', 'Order', 6),
(25, 16, 'Entrada_Herramientas', 'fa fa-paper-plane', 'Unload', 7),
(26, 16, 'Trazabilidad_Componentes', 'fa fa-exchange', 'Trazacomp', 8),
(28, 16, 'Punto_Pedido', 'fa fa-bookmark', 'Lote/puntoPedList', 10),
(29, NULL, 'ABM', 'fa fa-book', '', 6),
(30, 29, 'ABM_Grupo', 'fa fa-server ', 'Grupo', 2),
(31, 29, 'ABM_Sector', 'fa fa-sitemap ', 'Sector', 3),
(32, 29, 'ABM_Contratista', 'fa fa-life-ring', 'Contratista', 4),
(33, 29, 'Parametrizar_Predictivo', 'fa fa-bullhorn', 'Parametro', 5),
(34, 29, 'ABM_Deposito', 'fa fa-qrcode', 'Deposito', 5),
(35, 29, 'ABM_Tareas', 'fa fa-street-view', 'Tarea', 6),
(36, 29, 'ABM_Parametros', 'fa fa-adjust', 'Altparametro', 6),
(37, 29, 'ABM_Proveedor', 'fa fa-truck', 'Proveedor', 7),
(38, 29, 'ABM_Familia', 'fa fa-check-square', 'Family', 8),
(40, 7, ' Ordenes_de_trabajo', 'fa fa-tasks', 'Otrabajo/listorden', 8),
(41, 7, 'Administrar_Ordenes', 'fa fa-thumbs-up', 'Envio', 10),
(43, 7, 'Alta_Nota_Pedido', 'fa fa-cart-plus', 'Notapedido', 11),
(44, NULL, 'Compras', 'fa fa-shopping-cart ', '', 5),
(45, 44, 'Enviar_Pedidos', 'fa fa-envelope-open-o', '', 1),
(46, 44, 'Recepción_pedidos', 'fa fa-check', 'Administracion', 2),
(47, NULL, 'Reportes', ' fa fa-line-chart ', '', 8),
(48, 47, ' Rep_Solicitud_de_Servicio', 'fa fa-file-text-o ', '', 1),
(49, 47, 'Rep_Informe_de_Servicios', 'fa fa-file-text-o ', 'Reporte', 2),
(50, 47, 'Rep_Ordenes_de_trabajo', 'fa fa-file-text-o ', 'Reporteorden', 3),
(51, 47, 'Grafica_de_predictivos', 'fa fa-pie-chart ', 'Grafica', 4),
(52, 47, 'Rep_articulos', 'fa fa-file-text-o', 'Reportepedido', 5),
(53, 29, 'ABM_modelos', '', '', 0),
(54, 7, 'Plan_de_Mantenimiento', 'fa fa-calendar', 'calendario/indexot', 9),
(55, 7, 'trazabilidad_ Activos', 'fa fa-exchange', 'fa fa-calendar', 0),
(58, NULL, 'Equipos', 'fa fa-exchange', '', 0),
(59, NULL, 'Almacenes', 'fa fa-check', '', 4),
(60, 29, 'ABM Marca', 'fa fa-sitemap', 'Marca', 9),
(61, 47, 'Rep_articulos_pedidos', 'fa fa-file-text-o ', 'Reportepedido', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sismenuactions`
--

CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(180, 54, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisusers`
--

CREATE TABLE `sisusers` (
  `usrId` int(11) NOT NULL,
  `usrNick` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrComision` int(11) NOT NULL,
  `usrPassword` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpId` int(11) NOT NULL,
  `usrimag` blob NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sisusers`
--

INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `id_empresa`) VALUES
(1, 'admin', 'admin', 'admin', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0x89504e470d0a1a0a0000000d49484452000000d7000000d70806000000897dc4b50000373c4944415478daed7df77714d7b6a6fe8879e9cefc7267d65b33f7be993bebad3773efbc07f6c5016363636cc0986b1b9b8cc1981c6cc0062cc0e49c4124814012412491834822482401226392c9395a20f6d477c42e9dae3e15babbbafb74ab6aadbd105277d53975f67776de27e379412d4a652a9f518beabff33afdf5af7fa566cd9a51d3a64de9edb7df16ff677ae38d37e8fdf7df177f6bdebc39b56ad58abefefa6b4fd4b66d5bfafcf3cfc5f7f97eefbefbaef81dee05c2fff17bfcece57e5f7ef9a5f95d993ef9e4135bfaf4d34f95dfb1528b162da875ebd6d4ae5d3bcf734c34619c5813bcb3d5436a53aaf3a01d65a4f2e0ef2eae06162f16d33befbc23c00466f38b2900caf7de7b4fdc1f0006c3376edc58fc1fe073fb7ecb962d4d10e0bb0d1b3614e37cf3cd3743c61e09611cb8874cf5ebd7a70f3ffc506c3698bf8e40c32683b1620e433abc16804b376ad5e47525a022914cd1109e81e7d5a953c794924ecf6cdfbe3d7df5d55702541f7ffc719864659000b85e48f57d277aebadb7a8418306026cf17e3701c0d2005c597d5e33990752c34f09e585c0a8fc7c4809a7cf32b03ef8e083908d00520fbf0793f93936bc0bdc17f7c7bb514975fc2dd1efaca6012c25c15532b1b6a90a2693415845741a032405181daa1a3e8bef78b1cdfc268c031b023602196c9082005a32255aba022c2395edac6430a9ccac0c16bbcfc0d681e3831d1e60205dd4326c08506f99a959030000930db0747172a41cb8be6f55a50e62b74d2673b22303e071726030b00042bfd53f3f370acc876d39fc9b8c8d0bef07cfc6e6092f7000ae04d2b651b54d09906c866470d931219c18ac0abad964bab9c931de64a9b090a8505b01b04bf30270255c1dd4c1106770d9fd9d193495806595229823181d204ba43a0b6d4078609bbc1e802b1134beab1eea205393264d6cc1c5c04b55605941f6d1471f099025f2dde3997887f00a07e08a23413d605b40078683cac7992076bbae97a0722a112417e69448a70c7b63e11d0ec0156727861ffa3f766230079c0d883f710cca8990ae84cfe13bf82ed4d2bffded6f619e42fc0d3b3c185057e7851f3611361527478e9f8066fb0b664100ae38c5b49c5cde6eccc0f11d303db22adc321a908ec46944c8a8b0031dfe263f8bf30f75b00913618f41754b94fd05b3200097cf84a06234520b8002b30394f817cce0855815b1820d40e38c0a59a2599920110ca79314c37ce32da5d939046f71002e9f6d2daf520b8bccc1513f5448764bcb8156483ec4ae20b5002864a0e3b9e9ae0ebae55ac673defc7e534d3dcc48050fa1d7528e781adab83fc6819d5a4e9cad5bb7aea734a848a401242440ed96c08bcfe0b3894856f6b211c5730cb87faaa9875a83ab6983d7b5f110aa6c017617c79ae708c65125d846439c949b2c8f6222bc87a992bda12db8905f8617895d59771735c781220518ec42ab8d87cd04d9f3a8f5722a9e6482f4c2e7557561b8379e912eaa2ae77376fefcf5005c7eb8df75aa3f72531b3911d60d60f8ac0c2a9636727573b48410010067f58ae277c94c74f63b332615927b33747664a46a201620b19316f81bab7f708c000cb102ca2954c089c3b2644c6569964ace0d2dc1b5f8c7da664f8c74f2aab18d06a90249a292541cd806416a7b2504b8ed5447ecf6d60a683068aabe5fae04d73d354a4b7071f97ebad80a72ad12f7de90333ea29927544f6e9c1369d9bfb5794f2a828c4b5374ce9ccf0854c2f813676e346ad448002a96863100951c7793ed366e4ce344f89c0a8cc9aa908eb5cd82ce95cb19baaa84ba7b0923556162910e9c6e2483a25ebd7a022c50fba2b5c9f05d0052be6f2abd771eb7aed22b23f012c6bfb236daf817de81b5e705a4e0175f7c21eeed446ddab409495076031a545559754d0529c681655da59756e082f747a7d292681284d9a53ea84f37caecfd2d6d9b339cca0ba62869e3ec11943b2193ba75fec6d6f921f7b688d50665e021658b3b44c924f7fb48953c490e69e828bdb4021797f1ebbca89c06c5294abcdbd7af579726f4eb44c7964da4cabd391113800690e1deb8277b13e33917d87e9070906e72176004b0394ee6256e17d85e2900ae487209e3a96a80a955f97daaf4a4be1dbfa2a2ac215101ca4ae7564fa56fdb274f1d06d858aa414d4c155b4c57db2b434717bc9fe9320c1455d9092464245d6c9b7ef43e756ed98c660fee4ea539a3e8feb639be80ca2f7ab87dbe5037772d18432ba7fd4ca307f651aa9c5eabadf1fe20c564f554c7f0084b2fdde25e19bab9e0a32d8ab4d618a9dcd54e04b50ec019dabdad099e93cb2768059e6869c5a481d4b3631b73530133ca073778c93861a91d8b832611712f9db2363274b3b7a2c9e8e6ba2b6600ae24c6efe49d77d384be543c63a049250b46a40578bcd08d4db3e950ee185a337980d844ec3619b9b8940f72b0e643e23deba62672c843a79cc38c54b5b73851163b166792ab623e48fbc17dc7f46c4b8fd74f31e9c9c6693506587604c90cb0415a0370ad9a35b2cde2e02398e4a394740af473cea14eedd83252d1dec2ae8a933b0028a773aba0cee073f5df799baeaf181702ae8a1d736b3cb89c4007270dd463386ca0325bc1266786e81293e4f0852ef55eda80cb8bbd05b0e0334e4d6364e2de0b33fa770c01d6e30d53e9c59e850190a290727660d3c10ee37a2f5ddcf25a808b3b3cd9c5b7b831a5b5418c13018888d5a8a4d6b3adb302c0c448b9a3be0b51237589878933da1abc1e80cb7ad6962a680a607df6d96711e7cdd94a2d835e142f0800e2135d593b5dd86c9066906089e867e8c5b1a14323d10c9df309f96c2bf9ac5ff9e8d368a4d6934dd30350c4496d441c30d98e0ef0892e312f2dc0a56a4483b41c6e5ba63aa5315aa9153832e24708aa438a25dbd1a14b9f8d0c5d9275bdec76c81af02ab5704fabd4122a61e0c8883bc1cbc88e8e64a4b28953599a04e0329d195e82c790645efa46e07e999dbe0a03d6d32d3303e64f10c195cf5ec544079c39d85de3c1c5ce0c2f3b9c177b8b4b26cee58e0c54428decb0449ef1c581ee1a0f2eee05ef2521d4c9de423099539d3a356f1206acc04b987c3b2c516a22b75fabf1e082e1e9b538d24e0db466b42387d00aacc04ba8871d96881e8a9ca951e3c1e535139e8b14e5fe0f728759fef9930fdf534aad67dbb20226d7404d9403cff16a8a83fb2243be46830b39605e8f376567865c8a0e40e1bb68ac6997a0cbf47cd7fc80c1357276346d583fa4512927063bd9d36cb3b9991000578d77c5475266026706979f6331acf9854e8e0c50c0d47a1152d050f68358246c64a6e68dab5a2780b0a6d83cb1d67267628464dc6abb6a3cb8bc7a0ab99608c0b24bdac5df5a7ed25009acc0ded28f7edb3e47b956eb26f477945e706a790922d7f80c0d2f6dd4a0066227b26bffcccd62709f85995dd4f65690a8ab1d3ddf9d1db64e47e60fa1c9fd3a39820b1a4c90fee4430d1774702f8715a0aecb49250ce25b7a92759da026b6f8b491e35ac3f6f67286b20e15c9193a7a0aa1063668d0c07337593836ecbc848133435f7aba794618b8b821a91db93933588ba9d159f1769e42a88868b1ccfd1bdc32e121d59cbc848133436fa786bc4e884fb20d6e475e03c8351a5c2a4f2180c4ad9abd6666b00b5e15380e9c199a3b358a6687ac153c87225669a3b1a071a91bb8b822a246174b469253e8042e4839bb0cf820595773a786a1aeabc085908bddd965a992b49b54704572e0829bbd65e7820761770c1839353c860c2eebf9d01ce772f31406e092720abd767b8ac5de0a3c85a9e331647001541c4866421c13c726216fd0a95747002e8390fbe5256117fdcbedc0c5c66bc1c85e81a7308dc06567734155e433c5e04d56693da261694d6f50136dc2ae2abe85e0a31db8823293d471c7bb810b6a211f7d04e7864a82e952e29fb2e0b29e236507acc00d9f5ee092bdc87cce9835cf3000570ce0b21e6de3143c46f3cf80815327d6c5712ebbfc51b7b3a4c12b01b85e810b866a24e0c28e06c316df6367865dd5b170c31bbb62c0c0a913eb4286865c4c19690059b7635c93ee2d744b676170613793b3e20134bb463401b86a26b85872e9724e57d283c86ea7dce3857129bf7ce802834bd59b300057fa81cb4b00997bc5eb728c50d2c0c52dd5dcaa900128b85ead117b4e73b14b7b0a4afb53832a76ce0b2939c19ac259150db8582dd421af30e959f16eb12e004a052c195cd8ed82ec8cf44981625b3c1670e972ba6452c1c56dd554f10afc0e1179bb18171fcb6a975318802bbdc0e525f54997966a5a800bbab1eae820d8596858e29453c8e0728a7105e04a4d70a9ca4ebce4a006e052f489b7bae41b356a64561f0368aaac787cc731c615802b25c18535659e9009315138b19c4006534197d4276d9a82cad9f1388b0bde41008aa3ef76e0728a7105e04a4d70614ded0e43e7aebd00912a84a34b4b356dc0c5aa21fa65e085e1c559fb24c8e77405e04a6f70216ea94a81c206cb7985d87c91b86b0de304e0b2d0a579555e43804555856c77ba0902ca01b8d2bb60d2cee6c2d96d001b7f46ce88479d60002e07d5d04bf2ae5bea5300aed404975d20d9adeb934efd0ab502975be75dd5a17701b8d21b5c886f46d2f549b7d4276dc0e525a08cfa9d005ce90f2ec42d55b12e37573cf34400ae0803ca1c54b6562007e04a3f7071ac0bbd51a201972ea94f5a818b55436b40d9ea31e4eae3005ce90b2e8e7545022e789b0370b9a886f0f8d8e9d42cb1b80a3900577a828b635d724ea91bb8746a06aa25b85835c44b55810baa021bba01b8d2175caa58975b6ea12ea7496a0b2ea732143e94418e7305e94fe9092e552f0db7ac789d5aaa69092e1072c354aa2132e465352148dc4d5f70a1559e35d6e5055c3a1cd5aa35b8c6770d570df133525de44c0d2fe08aa495f583c20974b76064085dcbfe912e4eed664bf83b7f16df8f85c970af5bb9837d3954ae7c7073f16f2cf790df83d33b0061dcd677e7f5f92a70a902c96ee0023fe894faa425b854a79f708a8b1c4c763ba6d54b993f18e04a561f2aedf61e15b7aded1bedfbe64d3afa63533a3da2750808550c87dfe133f81e40112bb8f02cdc0bcf7fb2699ae346c2e0c0670ff769e8eb3b0061fe7663302b9177cc0d5b3755accb0d5c3a757dd2165cb26aa88aca73bccb4b25b21db898a10102bf19ca0b8191c1d020790c7e482e907c4f7e8ef559892427a05b4f3ab12b9a743be1049fd729af505b70b16aa86a5ec3aa219236dd7a68a8c0851d3b1ebb74ace487d4620248759b1f808d0dcd2bb870b806bcc3d84499e06e577992753aaa557b70b16a886a64bbdef15eba3f3dd918ba5bb2faa51b9d1bd731261bc94e3d4c96a4729362f25cedc0e556d7c5f698aea94fda82cb2d531efa37ba42b9f52de476d6584c2caa5245fbfe633a33ba1d5d9ed5cb906a23e8c19a712184df5d9dd7cfa4f313be119f9709f790a9a4cb3b11d925f1f2c4c1b68a0460d67994677e1e3657f95d5ccf1918f6be40f83d3e8b77beb7e31b4a29c60e2074e852ad1b4eae41b805d20a1ba94c08cb40ab41612d9f3a0a5e58fc63ed005c9116515ac125bf50b74032747dab1a08c601485460f29bace0b412fe1e4f573798d8e9f9f19e3f08cf3939ac4518d0a0a25bcf45b6c6baac591a300bacb6b88ed9195a83cbaebf865cdfc53de3ed807577d908d3138885c54e7c2b7f4842182a128a772c49a7b95e98da950ef67cdf04d88d9c41cab5e358971c484ea5d427adc125a743a954433777fc8355e38c45fc804abbd6130b6a95529bc7f5a4293dbfa2e1df34a34fdea96dd29ffef8dfe9f7bfff7dd424df4b45ad1abe259e092a18faad1887df60bab07a32ed9e3398660df886c6f66a4d3fb46ee43aae776bffdf98e68deff3bdba34ab6fceaf7cfe4fb6aa23363b6c7ab77287d8c6ba2201176cf5005c3e64ca433574eaba7b627073fa75f6f7228e222f2a00152b80fca63ffdcb1fa8478b460210d102eaee962c01a6fa75fe5dabb9f186a3021954766817582b6c862a70c9e5fea994faa415b8eecfab45a706d50a337eebbda14e87421f052e33b07a0cb160f2b1ad4fb7ce148b99fd433b73c15b37fd9046f6ee40d30676a76d73470b7ab27f45ccc4f7b2a35593078be782308677ebd40e61c4b69fd41740890458eb26f5170035c1fa3fff859a357c8f06756b4f637fe8463387f4711dd781fc2931cffdf49a392173fcf19b1654ebcfff664ab62b4b475683ab707cc899c8f29ac98164f60a3a0591195cc21bd9a78a970270bda23b59b5685f875a4a0f56df86ea4c79ced6c0dffab4fdcc35bff064ced05752e28fbe30925ff4ec60215dd8be9466fdfc3dd5fef3bf8a31428a45a20232a87ab46c42ebb24652e5c9a2107a51be35a973ecdae25331beae5f7c6482eb595156d8b1adaa40b21770712a9ce98dec50c55301b80cc26e230753e5bcb51ddf37b58d79e18543aa21e0e87618c3a08e9f57eda086a48898414ad7d0833d057473c3fca8e846e10cdb7b57946d344170b7640dd5fe4bd54e0fd07801178088cfcf1ad28b2a4f6c0d0316d3b3436bab9f5bb28a1e1f581bf57c6eae9b4d0f76e64624cd79039081a5ca2bb4828b4b8cecc0c5279bf468feb1e01d339ed62700173dcaa90616f2fc540cd4b96533e5595ef83fab046e591a2c15660ceb4fcf8e1755d3895df4dbe9bd215471e1083d3d534ab7f6aca36bdb0a7ca11b3b57d3dd035be8c989e2ea679dd94795bf941a544295678ba9f2d4766afb59e32ab018f6931770b13a5856984d95a77756dd07f7bb78902aaf1cada6ab27e8b75f0ed3c3a3bbe8f6be0dbeceebdec12d61eff059f98e90f75cfbdfff22c65938e17bc7a45d99eabff3b6990265072eaee32aca1a22ee091e627e026fd568705d1e5bcb0c2cda6529ac993cc036e6c59e22abc7b0f5477595c6f5c5833be8c595e30240760410dc285e4f4f6ffe4abfddbd4987776ca69dabf3a864e3722a3568cbb21c9356e56653c1e26c2a5c9a43bb3715d0b6b54b6885f1bbc78f1e125f4fae5e108c787377213d3a5e2c18fcc9a9fd06c39fa497d74f9b54796697b091583574b3bdca72ab2582905006a8e4fb313dbf748c9e9d3b448fcaf7d0c363bbc5586eeddf4295cf2bcc3196eed94585c67c766c582ee6803981d6e62f30e7ba6b4d1e1ddc5c40fb372ea3adcb73e8eee5f3e2fd3c387d44800c730a799717cb8c671fa5e7978fd1c03e5d95eb513acb3e3714314c2770b1d46ad5ac5148de2807cec15b351a5ce5fd6b9969314e8cd4f4a3f795dda110a95725f0d6fa3fff3b6c2161e4575eab6668fc8c1dfdc5af2704e09e9e2e1100b85bb6c764bc8adf7ea355f90b69fb8665b46b6301ad5eb2d0643c2b6d5d932f00b665cd123a72603fc9d7c3f3e582a91f1cd911062a3116481703200c2e73ccefbfa92496c421e032249f3c3f2b619ed7b7afa4eb3b568700cb9ce37acc7139adcc5b603bc7220378aa396223c27def1f366cbc5fcbc3c671b1748b125c0b0776f4042e5525326b2da539a3427885b371c05b351a5c6c6fa9923a659a3db8bb3299979d1a568fa16a21f32619aac385034ac6831a7863f75a7a74e94c08286e5ebf461b57e586ede82a82f42a3676f69d0683eedaba91acd7bdf2520130489110605d2daf52e90c80600388c6ddbd3b7f7a15c0ceedb50518d44100a0e2e1bdb0396e58e1718ecb1651f19615628ec5db42e7f8e2e963ba6d6806774a360b2087ccd15057ebbff5d7b0718ffcf6734fe0b23605e57587c960e515ce214db6dd9574709576f606aefbdbe6d0476f8597a27033482fe03219d0b047e48587ba0435c9ca74cc789b0c9510cc74e9dc09f1bbf2b2c3b68cb7c7603cecfe7b8a3691ea02c0c0e426d3c13682c479e578a8fdff4283b9885b21102c135446d9f56e6e1cecc000500d4928cf118056014b9e63f1d6d5f4bca24248b2d54b17bbccb180f66c57cf1152fa56f13aa18e0aede0fc3edb8dc32bb8acf63667e75c593bdd165ce0ad1a0d2e76c1cbe082de8c4c71ab5b7e52d3d7949d79553986efbef6677b7031035e3a4c8f4fec153683ac26c9176c27482e06d7ad1bd76dc1b5d55095185c470f9590dd75ab641b3d39b6bdcaf92079f4ee96ae0d092c237ee51434464c8c3f8f98569897104c7df98829b5601fa92e8009e0dabf633dddbf7353cc71fdca652e732ca0c3fb8b6de788675ddfb68c2a8e6d36c7a302d7cae1dd3c814b6567776ff09ab29485c105de0ad4424b3d1332c5ed32b71154b6da5ed0bdade0da36f13bfaa1759310908580cba0fbbb96d283b347c9ed2ac8994dd9937fa2c5d387d0a2a9836958dfee34e4bbae213466606f5a326b18e5cd184a73c60fa4cb17cedbdeefc5b32774bb283f0c0c903e3c562760c9c40083c47372c33f3c77dc718e6b97cc37e73867dcc0b0f981a60def47cbb2868b39ce759923cff3669101b0a39b42c0858d0376a393d492c165b5b7a0bd800fb6b4aae60b1960ec92aff16a21834b7668b0f710ff1e1bd08cce8ded20e848df4662b7b20695dddcf14debbd1e062e2cf8f31be7c9cb75e7d64d9a3cb40fcd1ad99be68dfb9e164dec47137fea4a13067631a82bcd18d693161960c81ed797660eef45eb0a725deff9f2c5f33010f468d7dcccd2f0daebe245f102139008462b0176fd4cc473cc3668dc80ce345eccb10bcd1bf3ddab397e2fe6b861659ea777f7b2e2a970cbcbe0429ad78b3d0b1d81c5cd41012e64e3581d58e33bfd4df086bcf15a1d1a351e5c72ca13bf1c2e83c7ef9077c62ffbd2f49eb4f0f3f0f66b1cebb05b244830113b1ad62f9cf12e1ea2970f6f8a5dd6e9ba72f102e5cc1c4bb347f7110cb670423f5a3cb9bfa01c036cd9e3fb52d6e8beb46fc7667786bb734930bc752c485b62e6f304aea2d954b1731e3579eb3fece7c72efa5bbfd0cba70f5d01669d230005c2cfd83ce68efb818ad6af72955800159ec98e1a797e0890bbc5b838888c0ecbb2d4423201e25f488f6270710f10ae11637e026f0571ae572f032f07c99c202e5547d634bf6c644fe37778e9b26ac83ab8dde1e370f70a89f059635bd5094c003be8e985635471ffb62de31c3db88f8a562fa02d0559b4f515ed285c4807766da0278f1fbb4b2b047815cf4710985526cf5d9a0c703ddb3a8b26776fee3ebf57f4f2de5557f09f3a7a90766dc80f99237edebb75a5e31c1f5f38414f4eeda3e7a78b6de7871082684c636c0a4ec03a327f48586c939d575c202bf71e1149c0afba70f1ef6b7c9c0b3960fc32509a2e0792593594933af1ff0ef543ab94195c76cd6a10a874b34b647ab27f253d3abc996eee5c498f2f9f71049bdb855dfcc5fd1b229e26efe256824322d2bc42c1a01ba6d2a99c9f4dd5104e11d73942921920abb87b8362b9f06eee1ddf4f77f7aca6472585a66da522b62759e5b52befb7164bcae5463005f03b008f375af088ac2673f72b50b2f30bb5c82db42b79678fe1f50503aa7734c3eeca6c14dac086631e4e9da038a86c756ab85145f936e1f8b8b9355f18e737f76e104e1030961d09862bdd44f7f7ad1140f5f21c76c1ef9a9d197143cd7b2b460b0741984bde6d6e0618303780e3dee11d626e18bbddbc10c3c28683770187cc9303859e9ef3e2c436d3deca1b5155bf869e926ece0c6b35043651ce238589c0fd47e477223bc382c45dc9a981aa616ba726fc1e7559fcd24f0f6f6dda5dec92f702ae4599df56676944002e5bef5bf1322539edde76045b096383e325925213760a402dda95f593299d3d492f07a96d37b768ef59b6665e884a28c06553de2fe715c25165b5b7166676117f87838b5b05c8ef842bcf83c4dd57746144a8dd25bf2cb13b192f925ffa2f933a53618b2a70f1cbf7022e560da3915ef12478f8785cab47455e950cb510a5f24fb7cc300b25e175d4657eb29750f6823a010b79a2aa7826d61b2aa10c2e6bbf10e623f05400ae578592aa7805bb55b1339b4574868ac84e8d48c0f5b070a2e992471a8e2e8cc759f0505be19c88145c900000d7bd95a385cac5401559f21acc6fdd9cb1d59bda2b2f28c2074ee0e22a646ba2b6ec1106b8acf9a872eb3c1d0a26b5a944e64c0dab6a089dfaf6929f435fbef1b996ef5657287b01d783d5e3456099171a09b2c9663c560741181baaa623eeeb5e345b800b1b10becfb657aceaa11f84e7b3fb1de3f25a6ac2ce0c3933e3dbf66d43120544ecd3626fb14a98eccc0cedc025c7bb64d510f539d0ab43dcb47d1b098f612492ebfecab12131af488d7fbf09aaa935bf0e3654c4a784ecce16e0124e1f4345bcb379969977e8877d190bb0385117e3918b3fbd7a0a65700d68df5cf432e4cf5c9bd73fa4fe4f5609931ddfd20e5c37a6a955438e5dc82f1f4e0d780cb93a99c16517e7aa925ce3846a889fbb7ef6417569bc619f247a8707b07847c758223d9125acbbeefc1fe8eadcbeaffa344ea7b2c5a34c8025637e5005d9fbf9a73ffe0f3abc6058c878a1fe3a810b6d1bb09eb24a38a4fd6721c9d9584fd99921ab84e0a5005c123dcd57ab86fc0265ef12bc8748e2fde293506fa1d3823d5c33412c08ff1f09a372cd176c1f3045bc9d179ce2245a0ebcf667baba7c8c180f54a568c17563e140012e9e1f009637bc87f91c307abca534e606555bceeac7c681f959d55d374f21b7b296c195d5ad79886682f725834b5609c14b01b81c54437e711c549617044165b8e37ffcaa9167703d5a3799eeaf1813f23b2cbcaa6259ee9c04c045e35d04b3e1bbb807806bad6562c653f5b48ff8e085bc21025c77974beab3a122164de9272487aa2b14ecbd68e785ef01ac3c376b990c362db908120e8c100fa74bda930a5c0b0776363d85d6cd8843363aa984da814bced6b00694adbbddc68ef528ab5dc3b0e0a21359c1c5840c07d862aaea6515f0dcc8e9fbf058c279213f3f1a47866cbfdcce1f6ad85c3fd2edbca16173038061d3c920b312c0e1362755a1a395b051592b8b2145ad366234e0da3c7940c8676470c981631dba3e69db14948b27414ea76120a17779db7a26b8dc7ac60b70ad1aebfa19000d2a231812800318bc80ce0e48b8c7b4dead04a05852399dc4122db8e02d943359ec627d3c370021967981701f9e9b6d6b3b4b5f14d561776ee0ead1be5558575e39e589f925d9c591da834b4ee4459e981db890fe2283cbe92821593504b97dce0978602437c2e7bcde3316a95515449e22c05525bd0644352f2f73b2db1c1cc9504dad1e50374fa10a5c39df34529e5e239fa4a943a2aef6e0925bada18cc06ec7e3c44d06171af77b597091d3662c7ab400f393dc8e95f5420f0b2798e082ede5453a27848c778cc46255d03b1270416a21f462bdb75c9ea44b2bb5d438fcae7f78cc4b157844390aa7c5389d8d6cedc0eb45354904f3c1fe88155cb2e4023d5c3b31f99b870db0385dcb0bb8384120bbdd0721e96ff2a6843213b3996c7ffdf8584b70c9312f0e14aac005bb6b64bb4fa9cfa7ef452c2db0f8b07792c580b1aa8366f26ef102bab36498092eb8e3c5e6912480e1fdda6d1a6e694f32b8b061426a59ab22e435d431b69512a79c70cc8bf3c75465e15c7630a9cd871131809c550e4684472b51cc8767f9052c956a08a031230bfb26412083ba6d27ad42eacf3cdc0bf6332acd21b5b0be762dca5925d425dd2965c0a52aff579dc185bfa35189f5081a2752edac6046303db207fc9468b817765a30841f6aa092698d71cbaaa115bcbc8970e532c613f586628055ccc7b80fee1749f0db8b3343548e6776a18e9f35367ba8a8547bd94ba8536c2b25c0757562784059c51038e0ce5af3e5974a06c68996a2c9138c8510586770c5eade8f177971667089ffa2165555e828310a5b3f4302721b085d5542adc12597a1b04b5e753835f20cad8d6cdc289ad20edd49560defaf1ca3e518235151f9fc64d5a993d032e4be96baa43ba5d4c992d6445e55749febbb4abad48b48554b3770614eb26a684d394a3679c9ccb08659e4e644d68c0fee0e76a887befc9b52e0b2532d9c76393b4ab4da166fe24c0d263f62687edb855ed786ab8c55da08abf4baf4264c5970712a949c6768dd01616b416ad9e9e7b676978b672bd9b649e5fedc88c17525eb3b01ac7b05a3844b5ea739b99599a8ec68a8fc76798a01b8e2d08d9777c1ab73fa86b5bac6a278b6bbb665259de1acfd424c26dc30852a0fada0ca927cef6ae1e6e926b8f07e50407967d9707dd4568fde493866aceb8a0d141b8eac6d04e08a13b81099e79e8656b21e5c1dcfd4a398bc7b05239587fdc11901e744e5be4554796a87678001480016e68fffe3e7b2fe9f68012c2fadabadb14b99b0d65873f99ebcfe678704e08a290d4ace31941bede305730607ef64589c4883c9c920d591496c3799debeb2b5f4f2cc2eaa3cb2a60a6c2ef713e94fafa4217e3e35aca51ef696c7e031885b54635d410c22f9a00eb965b50e5d9e52125c72cb356b4728bc74b91295cfc255051d6d83c93154ffc64a2c8da1c2418a3e5a3729248dc9fcecd1f55459be992a8f6fa4cad2a5f647b8f66f22becf06bf4ee05285506c3b3fbd5a6f9654886761adadda4b00ae38810bbb98b519a49cc4e9355b03922299e0825d247bf8a2f5f6e15d94677e2100ca5918b8077e974af6166c2b550730c43903c915c7da2e59e7c66ea65a44ce35f3aa1a5aab64130dae4bd37b9860c2cf32c176f212ab8253042e6b7cc70ad643bd3f4c297bebc42b75dfda328d7bc0abcafa91c913802bc6b27faba45211ab8661f53f1ac6bb105e103d190d105c9bdf9ff676a81362c4e3ffe7277c630b30a85a722d131300c5e03afcdd4729636f41dbe078a5ca8baa5a67ddcafa530a5c486be19768ddcdd4eac7b488bd86898e773dda3e4f9cef7c61e9682ae9569f2e4cee2c807035ef67ba94fb331d9bd98fcaa6f6a60363bea503435bdbaa8ef81e6c2afc2b4badeb798614ccfa8e4e4ee9416593ba8b33834177b66489e756ec5ea0657ccb4e25b4db9874396c2165c105427a8bd7972e7b0dbd0694e39567f874e77cc1d060ec93cb26082acd19154625593f0952fd0d743067245dc81d16022c382e00ce638b465059ce08dbefda5159de58319ef3ab26d3b5f53304e8e29996158b4aa83a4dd3f420f6af1580cb2fbb4beeb0aa7ae958187ef15e730dfdc833843400830248670a26d1a1c5a3236678273abd7c82082c336143c0f3fc7c06e8f892717471cd54bab9719690b07e1472469aa88b3554c5ff542aa1cef6564a804b6e16aa0218f47339435a26afb986d124b932982005fc66722bc3dba9720081df40b6124bb768d4498024dac031543fabed25034bb74e4f29092e2e3f9101e64450235995b4e6a6796dffe524a1c06c7e333000c2aa23eecf7612c0e3654cf81c7f87a527df0fe41700b19140d5f5ac1abb1c70670d1c63ddbcac333ea3c3292669012e6bf1a48a902ac59e23feac57d5d04b9f763031a488574664c696999eed1b901f6a57b4c463609b10aa602420f4027a2f9d75adb984000c341539bea922ddd5c1940317b75d4349378004c2cfb0c9acbb98ac4a7a8d79b9310aa481d38e0e0605b326da1b170f6f263601a78d042084c3c60f173c1c4faaba2cac35d6d6badebab54f4b1b7045d383c36b3a94934bdec97900464cb7c24b1968762083faea870b9ecb4b52451a05e0b2b409f012f37272c9dbd95950a9d215585e36162729eda5a49fabc8753a992400578431324f8e0da98bab95a261ae74223b8fa89dede5b5a49f635bba766f0ac0e5c10982188a97645e956a68b773435d8a3c81755a585d52e29368a70917b7977432b39cc5b02723510dbd64c1735b3c5dce2f0ec015438ccc8b6343a51a42f5b3f3064692a4ab3a162919c042ac884b76909be805ec9050916c305e54427664e85c491c80cb8550a9ead92daf500dedecad48c0852037981a295c286a8c547a210e07492313ee877b3101b8008d4c76ae6c7c1663c07ddd9264ddecae68bd84dcf7241d1d1935065cf2a9295ea497b561a85d4e6024e09241022080f12135ac60b0922aeb3d52e2424300dcae54271670595df25ebc849c91910a591601b83cbae5bd94a25803ca7e824ba5a681e159fab8818d094091a516ee214bb5447a0cad49bf5e5442ac43ba4bad1a032eb92ecccb017172aea15dd6821fe04a0777bc0c2e2fbd09d9fd9eee52abc6804bee24e5457ac9e5ff4e09b535055cc83cf1022e2fbde06b8ad4aa51e08a447ac965284e397635055c761e5339d6e5a5bc84a596ce2da80370c528bdbc780ed9b1e104ae9a1244b68b73c9592a5e1c199ceaa473697e00ae04780eb9fb9213b8e259c1ab13d93975185c5e9ad0705c4bf7eae1005c3ec4bdbc646da0afa113b8e2995bc871281dc0e5548a820dc62d23839bcfa46b0e61002e45d686f5206b95f472dab5518612b723770c6023f70eb12eabeb9d83c6877a3510764cbc33e39d36987b5b677b2e86d4b9c76000ae38e41cba65cc97e78f498a53831d04bf4cec5cd576ad4d2d938e7cdfc83c49d34ba1672c84921aa7f9df5aebadab533aa73905e08ad2357f74e1705faa726339e6146ad5f5ec0182acaaacdf879747626f952c1841d7578e77540739cd29958a1c0370f9e0dcf092d47b2e7724edcf1eeed8c0259ed2cba93559bca516bca14e1bcbded983e9fa8a71813a18802b3af510e0da9395e958f29e88aeb5e2047b8912d1ccd42e1b1e840da778c6c088cbf70370d520e2bc43bb83f32e2d1d2d9868dfdca1b68c164947a47471c163c3b103175adab177b026aa8301b824ef211f0fabf21e42ed0113814a168e4cb8d710aa1982b8567738aa83e36aefedb40f4360a3e177a2b2b3d2b92f4600ae18fa225aedafbb6b269a8cb477ce10cfa5177e01cbade9288097c8ac0c6c30fc3e8ecc1b52e34af70370c5687f593bf5323381ec9c1bf1706c38b57393c9ef1e8800b55de0184e0c3b7041f2d7743b2b00974b5f7a6bf606984806989d7ae8b7f4f2daa4d3eff66e7689bafbe70f0b790f70f6a84a496a52164600ae283a46c16e60809d5818ca5476de433f6d2fb7cc88783dd7ced692d541a65ff247853830d2b9d94c002e1f83cbb207913d8632d9790ffdf21c3a65a2c7331c60e72164efa04c70f6c8c0aae90e8c005c11808b01767de9a830c6b2b3bfc0e87ed8404e6ef07895bfd8a983b2775026c406195848880ef8270097e743ce39c30000db33b53fed9d39288c0e2c1a45070d40c954be6c7ccccc6ebda71bdddc149b5b1edf57ddb774c108e5bcf74ee865a636d5e42c8c005c51824b762dafedf82e151b00db376b5008ed9f9d49071755492c994ec40030947158efe746bfac9e1235b06e6d9aa5bc274eb5b4ce17b4636c4f5adffeed10091f802b0057c4e062806d6c599b96b4799b768deb691eb56a1eb93a6f281dc91b1b46e54bc7d383a2b951d95baafbb9d1a31d91a9a315c50b6c9f7538770c95ce191c3657cc3faf451ddadaaab699e214802b0057d4e0021dcf6c4eb95fd4a67c83b1768fef49a5b37f0aa183f3878a80af8ac0c08f3d32feddadb36defe346c7f2c7797a0e407563e34c3a6180dfee5e078c0dc33a47cc1bf3cffba23ad81e802b0097277ab1a3133dba788a0e0f6a11062e50e998ce94d7dc90602deb50d1d0afe9e09ccc103a9cfd331d5b32ce9620c92e174e13f6cdb35dd9610c7f7dc34cf119a77b78213ce3a1213165c2bd11e83eb36292ebf7310febdc305fcc1d74787cd7ea00bb04aeca0b6be8c59171012f05e0b2d0ea7af4f2f1af84ebf9e3070260aa3cc3dd63bbd35263f7ce3776ef75bd3ea5fd53fbd1a1b9834d3ab2609868bb96aa84f1cbf301619e982fe68df9df5b33310c5cb7f7ae11efee65c5037abebe71c04f01b8aaa9f24c2e59af67659bc300767cc1cf543aad1fadeaf01e2d3176f1658614db3db2b3c8e2602a33181412e8c4b2092945280c95e78179f13cf1efbe497de8d4a2e11675f94b21ede5ebe5cd03014f05e07a45c64e6b77559cd917c24cd70a0c9b64fe103a943590b667b6a1a5cd6b09da36a085f83dd3510384f0189e5c3e417bc2388f2e1c1632fecdfd3e37e7b6ae7b23315ffcfed62aa9f278f32caab87545f9de5e940e0ec01580abca5670ba9e5f2e178c64f6855836968e197649d9fca1b4775c0f2a30a4d73263775fdbf9432a99fc9df8bd20e33308069f5a3e515bc2f88e2e18668e19e35f6d4829cc6765dbba21f3b9bc744c75e3d4ddb95479ffa6ed3b838a1d802b905ae4e50223c9007bb876325d5936868e1912eac89c9fa8f09bfab4fccbda82b60f6a297e2fc89008a70cc90047826e8471f13831078c7b45ab3a620e1b7a3416bfc3dfcee68e10a53732b05e563c737d67355d7a6504b6562e79bd2a9fdc178c25ab89f70b2709e6832d563cbc23ad3498b3c060ced5edead2be315dc4ef41a7968ca5b32b276943180f8f0de35e6b6c0e183768d79076e2f7277386d14d4b031ad8a15eaf97f74e05e0aac904ef56241776ec67070ac31c1dd8d9cfe78da4b2ac1f6973afc6b4e2abda82d675aa4ffbc776a51306a39eca1b45e7564ea6f3aba6248df07c8c03e3c1b8303e1e2bc67d6c5e269d5c344cd896612dbe7f394c915ecfb77c1580ab46c6b5f67c47d15e2a4f22830c59f40727f5a2f506e3ae349816849f4b0c66863438573041a42b259af0dc938b868b71c863dbd8b5211d9ef63d9d32407575f958a1f286cccb50875fdcbe1cd57b826610802b706444be2bc3d161d3fd08eae2af864d76687c375af7755d5a6d3031083f1767b6a2d306935f583559646fc49bf09c13f33369efcfeda9b0751d732c1b0d801d18d7558ce5b2b12160cc6127be14653b3a2e5c257d0d766c64042a616cd7f3ebe7421c1d2ababd6a021d1ddf5530333336684bb78674d000dfd9fc9174a970aaef746ae110717feb73b7f56a227e0f097bad609c1254c2be32d45f2f8e8b40350cc0453be67d4e2327f4a3963f4fa4dd67ee905f97cad1a1a287eb26d3d5dc61b4b75f335adff60d2a6c51dba42d5d1bd0bea16de8f8cc7e747ec968515b15299d9c3788caa6f4a6e2815f8afbc9f75fd7a60e150ff8924e66fd20324d1eac9d643f56c4afa2b0af54d7d12b0fa871e64c5a34fd1b3abca07100ae74a0f38bdfa73559ade987319954776036fde75e1b43a8ee9862f2fbfaad7c87a793ece53eea877ef894b6b57f83d6b5a865802094b676fd80b6f76ee44af85ca1e2fb1b3bd415403b35adb7f0fa01dc6e638a550d94af7b4f2ae82f437784bcf73f7cb74a6c6ed3a7f4109b5d00ae1420ec8a58b02e2347d25ffae787814945a3379cf51d6050139f16cd8d0864dc87e2fcc4ce74f8c766b4ebdb7ab4a5556d51e6b21e52c723edeef531950cf8824e4dee4ed7f286d9aa7b4a506d9a4e15a776d3cbe7bff9f62eba2e3eea691d20d9a051006cb797bc15802b99840560150f0be3650155f4871fb6d2c5db4f7c071818f4c5d10de27c2da75eef5e0087ae4a6ee476528b53af79d116bb249f5edef077a3595b763dea7581a6018d039a073490005c7156f1a0b3dba978b15093a92514afebe5d51355676dedce1607c4413a440b345f68c35471bc2a408fd32045b9cbc9227af9eca1aff3c686858dcbaf358226824d34d554c90cdd1d0fd0d1fd0413d3ef7aaca77feaba8afea1533e151ebc183f80ddbf46152505d52797184c0d6901b0f11141f122484d48271cdc80c3f44c408120ad2e1f89cb9c1b4ddc29de6f3cd68ded36069bce922d43277b092f2cee60ea984b7fd76e1efda7d6b34cfa6fdf2ea07b8f9f513cafca5f4aec8f0a32981eccef1bedce76ae463ebec97769c5d7f015a5d5efb6ed1cfafb0e8be81fbe5d4affd46d4d5cc1868d18da8d4e604b1ab8a04f47e27c8886feb1cb0a2199feae7d76089854d4775131c5fb8214ab3cb822792797405a19aa6abcae9d277e757dcf580bac0936ba784937808d6db6643a4832126d3b61d2f10214160bbbe4df7fbdd0759155b4f3e4b5f803ecf96f8e522c6e74b6d8574f6098dbdd90fcffda7b71c4ef1c5a04a4db3f765e1e37e9962c153223513614c4763c5e1cdb4d5ea4931bd519544089ba84142b2b8c3fa80c498967c5fb6a3e7143ccef5f509b2c53ba41f3f09b5fe010833d9f08a065c41b54b1b8ca9d0085dd0e3abd2f0b2ad1b48dc72891179c0a7103551c5540f9cad979d2f775504937bf55496850906829072eec0e7101541c1711f45f3bcda78bb71e251660cf1e0a97b86f769501d878aa80f275e4c22df1cee2bd2e76769b5fd22c1eb659463c02bc7ec5a2a083c3bb170f09e544cd276da2645c31393c120caa58ecac78800d36dbefbaafd50a60be832b5635305980b2523c635fae20bb71d63bc8a0fe2518547cd519b82ce9c00a23836fc03fb0d722051b78575b7045ab0aea022899b02323f134999700999dd303a032fe9e0c50e1ea9455a41fb06cec357890bd020dde6cedc08540b0ec1277333c75049495fa2dde4b3a5c21ae7b048013e0fd73baa66d284b096029a59a61abb901cdaf142bdfc0c5761640253220da6485012c1500652518ecc9be84c3e315b812e501b4bbd61cf82535816521372fa21ff65786dfeaa000cfab09609790072dff2d5508768516d2eb950d06a975e3ce7d910d61a574f40cc64b554c847a98e147d685a90e1ae2d61a10b44aae545c0ca84189bc2edc7c209e294b4d76d5bf7c7487fa64adb3dd08e22569e1194c0760b177d18bfd156be574cce092332f5471286b941d804bb5c5005381e1e3edd64630f6c311ab95529383cdb8de1fb8d071ac50ddfc1e9b969ec138832b56ef6146ac1918b213433511004e1e70b4797fc926307d3caed3976f52cfb9dbe877ada62a9f3bb2b0bcda7358924fcf9e3da37fee30c375bcc84ef7ebc2f8d205582a70214666073024ff26055c724c0bf6955dae987522a9ba287e322ceca64139db5d9ff9cf3d965607988f6fa2b3172e2574439854b033ad80a5f205c0c1e6e4dc4838b864a9c503b49b8cac1aa6aadde5a7f710ea9f67fbc578afb9fbaf5481cbb0bbf237ef8bd821136dad5abc730675001752a854e68b4cd1e61f66f8616b61608e93e9989bf27697195cee931735b3e27bd1648fb798b54f800b76979d33c36f806113f92fed66a63db8589382b9e2541f168d6b3e23560fa1273bca227653d5ee62ea347b47429d02a66a78f504fd6df892e8334e3c020c7660ba7806ddc0259b334ec165849b12022ec4006cddef362417c2211d25d51768d1eeb389f3b6199b139a98427afdaf4ed3638ad9b9012cdd3c836ee092eb00adb698557a25045c729f0b5b4786073d3795097d37ca2edff3a45ef9c1acd3b79ea65f4f1d897b50fcddcca5690d2c2b2f86f80a1c1c1b20f4e8882bb8f000f981d6662f5e55c37458a43732573b26f7fa99d1005574c5cec3fedc2bab28a59371fd74c5bbc56563f11c66c4e2c8f0aa12aa54c354766ac8d4397b5f425285e0561f99e75fbcc99a75326175498d00960c2e9523cec9b11169526f462c8e8c487305e580b21f3d2fb420639358bcf7424272f03e1ebac4d7fb7158215d5dee6e5a941dff3a393622c9dac888a55e2be2ec7629a09cea1ec310fbab4b8e697fa512a3c2fe42c26fbabadcddb2e2edf8d7c9b11149ce6144e0925ba2451b0ce65413af8e9054a17feb5790ba754e35919c04838b6303fd367d051772ac426255d1368b31068e3cc474925c01a51fb9b575f3d29acd33b880d674c9b208282057ff808b63c34b50f9ff035bede88965ec2ad60000000049454e44ae42608289504e470d0a1a0a0000000d49484452000000d7000000d70806000000897dc4b50000373c4944415478daed7df77714d7b6a6fe8879e9cefc7267d65b33f7be993bebad3773efbc07f6c5016363636cc0986b1b9b8cc1981c6cc0062cc0e49c4124814012412491834822482401226392c9395a20f6d477c42e9dae3e15babbbafb74ab6aadbd105277d53975f67776de27e379412d4a652a9f518beabff33afdf5af7fa566cd9a51d3a64de9edb7df16ff677ae38d37e8fdf7df177f6bdebc39b56ad58abefefa6b4fd4b66d5bfafcf3cfc5f7f97eefbefbaef81dee05c2fff17bfcece57e5f7ef9a5f95d993ef9e4135bfaf4d34f95dfb1528b162da875ebd6d4ae5d3bcf734c34619c5813bcb3d5436a53aaf3a01d65a4f2e0ef2eae06162f16d33befbc23c00466f38b2900caf7de7b4fdc1f0006c3376edc58fc1fe073fb7ecb962d4d10e0bb0d1b3614e37cf3cd3743c61e09611cb8874cf5ebd7a70f3ffc506c3698bf8e40c32683b1620e433abc16804b376ad5e47525a022914cd1109e81e7d5a953c794924ecf6cdfbe3d7df5d55702541f7ffc719864659000b85e48f57d277aebadb7a8418306026cf17e3701c0d2005c597d5e33990752c34f09e585c0a8fc7c4809a7cf32b03ef8e083908d00520fbf0793f93936bc0bdc17f7c7bb514975fc2dd1efaca6012c25c15532b1b6a90a2693415845741a032405181daa1a3e8bef78b1cdfc268c031b023602196c9082005a32255aba022c2395edac6430a9ccac0c16bbcfc0d681e3831d1e60205dd4326c08506f99a959030000930db0747172a41cb8be6f55a50e62b74d2673b22303e071726030b00042bfd53f3f370acc876d39fc9b8c8d0bef07cfc6e6092f7000ae04d2b651b54d09906c866470d931219c18ac0abad964bab9c931de64a9b090a8505b01b04bf30270255c1dd4c1106770d9fd9d193495806595229823181d204ba43a0b6d4078609bbc1e802b1134beab1eea205393264d6cc1c5c04b55605941f6d1471f099025f2dde3997887f00a07e08a23413d605b40078683cac7992076bbae97a0722a112417e69448a70c7b63e11d0ec0156727861ffa3f766230079c0d883f710cca8990ae84cfe13bf82ed4d2bffded6f619e42fc0d3b3c185057e7851f3611361527478e9f8066fb0b664100ae38c5b49c5cde6eccc0f11d303db22adc321a908ec46944c8a8b0031dfe263f8bf30f75b00913618f41754b94fd05b3200097cf84a06234520b8002b30394f817cce0855815b1820d40e38c0a59a2599920110ca79314c37ce32da5d939046f71002e9f6d2daf520b8bccc1513f5448764bcb8156483ec4ae20b5002864a0e3b9e9ae0ebae55ac673defc7e534d3dcc48050fa1d7528e781adab83fc6819d5a4e9cad5bb7aea734a848a401242440ed96c08bcfe0b3894856f6b211c5730cb87faaa9875a83ab6983d7b5f110aa6c017617c79ae708c65125d846439c949b2c8f6222bc87a992bda12db8905f8617895d59771735c781220518ec42ab8d87cd04d9f3a8f5722a9e6482f4c2e7557561b8379e912eaa2ae77376fefcf5005c7eb8df75aa3f72531b3911d60d60f8ac0c2a9636727573b48410010067f58ae277c94c74f63b332615927b33747664a46a201620b19316f81bab7f708c000cb102ca2954c089c3b2644c6569964ace0d2dc1b5f8c7da664f8c74f2aab18d06a90249a292541cd806416a7b2504b8ed5447ecf6d60a683068aabe5fae04d73d354a4b7071f97ebad80a72ad12f7de90333ea29927544f6e9c1369d9bfb5794f2a828c4b5374ce9ccf0854c2f813676e346ad448002a96863100951c7793ed366e4ce344f89c0a8cc9aa908eb5cd82ce95cb19baaa84ba7b0923556162910e9c6e2483a25ebd7a022c50fba2b5c9f05d0052be6f2abd771eb7aed22b23f012c6bfb236daf817de81b5e705a4e0175f7c21eeed446ddab409495076031a545559754d0529c681655da59756e082f747a7d292681284d9a53ea84f37caecfd2d6d9b339cca0ba62869e3ec11943b2193ba75fec6d6f921f7b688d50665e021658b3b44c924f7fb48953c490e69e828bdb4021797f1ebbca89c06c5294abcdbd7af579726f4eb44c7964da4cabd391113800690e1deb8277b13e33917d87e9070906e72176004b0394ee6256e17d85e2900ae487209e3a96a80a955f97daaf4a4be1dbfa2a2ac215101ca4ae7564fa56fdb274f1d06d858aa414d4c155b4c57db2b434717bc9fe9320c1455d9092464245d6c9b7ef43e756ed98c660fee4ea539a3e8feb639be80ca2f7ab87dbe5037772d18432ba7fd4ca307f651aa9c5eabadf1fe20c564f554c7f0084b2fdde25e19bab9e0a32d8ab4d618a9dcd54e04b50ec019dabdad099e93cb2768059e6869c5a481d4b3631b73530133ca073778c93861a91d8b832611712f9db2363274b3b7a2c9e8e6ba2b6600ae24c6efe49d77d384be543c63a049250b46a40578bcd08d4db3e950ee185a337980d844ec3619b9b8940f72b0e643e23deba62672c843a79cc38c54b5b73851163b166792ab623e48fbc17dc7f46c4b8fd74f31e9c9c6693506587604c90cb0415a0370ad9a35b2cde2e02398e4a394740af473cea14eedd83252d1dec2ae8a933b0028a773aba0cee073f5df799baeaf181702ae8a1d736b3cb89c4007270dd463386ca0325bc1266786e81293e4f0852ef55eda80cb8bbd05b0e0334e4d6364e2de0b33fa770c01d6e30d53e9c59e850190a290727660d3c10ee37a2f5ddcf25a808b3b3cd9c5b7b831a5b5418c13018888d5a8a4d6b3adb302c0c448b9a3be0b51237589878933da1abc1e80cb7ad6962a680a607df6d96711e7cdd94a2d835e142f0800e2135d593b5dd86c9066906089e867e8c5b1a14323d10c9df309f96c2bf9ac5ff9e8d368a4d6934dd30350c4496d441c30d98e0ef0892e312f2dc0a56a4483b41c6e5ba63aa5315aa9153832e24708aa438a25dbd1a14b9f8d0c5d9275bdec76c81af02ab5704fabd4122a61e0c8883bc1cbc88e8e64a4b28953599a04e0329d195e82c790645efa46e07e999dbe0a03d6d32d3303e64f10c195cf5ec544079c39d85de3c1c5ce0c2f3b9c177b8b4b26cee58e0c54428decb0449ef1c581ee1a0f2eee05ef2521d4c9de423099539d3a356f1206acc04b987c3b2c516a22b75fabf1e082e1e9b538d24e0db466b42387d00aacc04ba8871d96881e8a9ca951e3c1e535139e8b14e5fe0f728759fef9930fdf534aad67dbb20226d7404d9403cff16a8a83fb2243be46830b39605e8f376567865c8a0e40e1bb68ac6997a0cbf47cd7fc80c1357276346d583fa4512927063bd9d36cb3b9991000578d77c5475266026706979f6331acf9854e8e0c50c0d47a1152d050f68358246c64a6e68dab5a2780b0a6d83cb1d67267628464dc6abb6a3cb8bc7a0ab99608c0b24bdac5df5a7ed25009acc0ded28f7edb3e47b956eb26f477945e706a790922d7f80c0d2f6dd4a0066227b26bffcccd62709f85995dd4f65690a8ab1d3ddf9d1db64e47e60fa1c9fd3a39820b1a4c90fee4430d1774702f8715a0aecb49250ce25b7a92759da026b6f8b491e35ac3f6f67286b20e15c9193a7a0aa1063668d0c07337593836ecbc848133435f7aba794618b8b821a91db93933588ba9d159f1769e42a88868b1ccfd1bdc32e121d59cbc848133436fa786bc4e884fb20d6e475e03c8351a5c2a4f2180c4ad9abd6666b00b5e15380e9c199a3b358a6687ac153c87225669a3b1a071a91bb8b822a246174b469253e8042e4839bb0cf820595773a786a1aeabc085908bddd965a992b49b54704572e0829bbd65e7820761770c1839353c860c2eebf9d01ce772f31406e092720abd767b8ac5de0a3c85a9e331647001541c4866421c13c726216fd0a95747002e8390fbe5256117fdcbedc0c5c66bc1c85e81a7308dc06567734155e433c5e04d56693da261694d6f50136dc2ae2abe85e0a31db8823293d471c7bb810b6a211f7d04e7864a82e952e29fb2e0b29e236507acc00d9f5ee092bdc87cce9835cf3000570ce0b21e6de3143c46f3cf80815327d6c5712ebbfc51b7b3a4c12b01b85e810b866a24e0c28e06c316df6367865dd5b170c31bbb62c0c0a913eb4286865c4c19690059b7635c93ee2d744b676170613793b3e20134bb463401b86a26b85872e9724e57d283c86ea7dce3857129bf7ce802834bd59b300057fa81cb4b00997bc5eb728c50d2c0c52dd5dcaa900128b85ead117b4e73b14b7b0a4afb53832a76ce0b2939c19ac259150db8582dd421af30e959f16eb12e004a052c195cd8ed82ec8cf44981625b3c1670e972ba6452c1c56dd554f10afc0e1179bb18171fcb6a975318802bbdc0e525f54997966a5a800bbab1eae820d8596858e29453c8e0728a7105e04a4d70a9ca4ebce4a006e052f489b7bae41b356a64561f0368aaac787cc731c615802b25c18535659e9009315138b19c4006534197d4276d9a82cad9f1388b0bde41008aa3ef76e0728a7105e04a4d70614ded0e43e7aebd00912a84a34b4b356dc0c5aa21fa65e085e1c559fb24c8e77405e04a6f70216ea94a81c206cb7985d87c91b86b0de304e0b2d0a579555e43804555856c77ba0902ca01b8d2bb60d2cee6c2d96d001b7f46ce88479d60002e07d5d04bf2ae5bea5300aed404975d20d9adeb934efd0ab502975be75dd5a17701b8d21b5c886f46d2f549b7d4276dc0e525a08cfa9d005ce90f2ec42d55b12e37573cf34400ae0803ca1c54b6562007e04a3f7071ac0bbd51a201972ea94f5a818b55436b40d9ea31e4eae3005ce90b2e8e7545022e789b0370b9a886f0f8d8e9d42cb1b80a3900577a828b635d724ea91bb8746a06aa25b85835c44b55810baa021bba01b8d2175caa58975b6ea12ea7496a0b2ea732143e94418e7305e94fe9092e552f0db7ac789d5aaa69092e1072c354aa2132e465352148dc4d5f70a1559e35d6e5055c3a1cd5aa35b8c6770d570df133525de44c0d2fe08aa495f583c20974b76064085dcbfe912e4eed664bf83b7f16df8f85c970af5bb9837d3954ae7c7073f16f2cf790df83d33b0061dcd677e7f5f92a70a902c96ee0023fe894faa425b854a79f708a8b1c4c763ba6d54b993f18e04a561f2aedf61e15b7aded1bedfbe64d3afa63533a3da2750808550c87dfe133f81e40112bb8f02cdc0bcf7fb2699ae346c2e0c0670ff769e8eb3b0061fe7663302b9177cc0d5b3755accb0d5c3a757dd2165cb26aa88aca73bccb4b25b21db898a10102bf19ca0b8191c1d020790c7e482e907c4f7e8ef559892427a05b4f3ab12b9a743be1049fd729af505b70b16aa86a5ec3aa219236dd7a68a8c0851d3b1ebb74ace487d4620248759b1f808d0dcd2bb870b806bcc3d84499e06e577992753aaa557b70b16a886a64bbdef15eba3f3dd918ba5bb2faa51b9d1bd731261bc94e3d4c96a4729362f25cedc0e556d7c5f698aea94fda82cb2d531efa37ba42b9f52de476d6584c2caa5245fbfe633a33ba1d5d9ed5cb906a23e8c19a712184df5d9dd7cfa4f313be119f9709f790a9a4cb3b11d925f1f2c4c1b68a0460d67994677e1e3657f95d5ccf1918f6be40f83d3e8b77beb7e31b4a29c60e2074e852ad1b4eae41b805d20a1ba94c08cb40ab41612d9f3a0a5e58fc63ed005c9116515ac125bf50b74032747dab1a08c601485460f29bace0b412fe1e4f573798d8e9f9f19e3f08cf3939ac4518d0a0a25bcf45b6c6baac591a300bacb6b88ed9195a83cbaebf865cdfc53de3ed807577d908d3138885c54e7c2b7f4842182a128a772c49a7b95e98da950ef67cdf04d88d9c41cab5e358971c484ea5d427adc125a743a954433777fc8355e38c45fc804abbd6130b6a95529bc7f5a4293dbfa2e1df34a34fdea96dd29ffef8dfe9f7bfff7dd424df4b45ad1abe259e092a18faad1887df60bab07a32ed9e3398660df886c6f66a4d3fb46ee43aae776bffdf98e68deff3bdba34ab6fceaf7cfe4fb6aa23363b6c7ab77287d8c6ba2201176cf5005c3e64ca433574eaba7b627073fa75f6f7228e222f2a00152b80fca63ffdcb1fa8478b460210d102eaee962c01a6fa75fe5dabb9f186a3021954766817582b6c862a70c9e5fea994faa415b8eecfab45a706d50a337eebbda14e87421f052e33b07a0cb160f2b1ad4fb7ce148b99fd433b73c15b37fd9046f6ee40d30676a76d73470b7ab27f45ccc4f7b2a35593078be782308677ebd40e61c4b69fd41740890458eb26f5170035c1fa3fff859a357c8f06756b4f637fe8463387f4711dd781fc2931cffdf49a392173fcf19b1654ebcfff664ab62b4b475683ab707cc899c8f29ac98164f60a3a0591195cc21bd9a78a970270bda23b59b5685f875a4a0f56df86ea4c79ced6c0dffab4fdcc35bff064ced05752e28fbe30925ff4ec60215dd8be9466fdfc3dd5fef3bf8a31428a45a20232a87ab46c42ebb24652e5c9a2107a51be35a973ecdae25331beae5f7c6482eb595156d8b1adaa40b21770712a9ce98dec50c55301b80cc26e230753e5bcb51ddf37b58d79e18543aa21e0e87618c3a08e9f57eda086a48898414ad7d0833d057473c3fca8e846e10cdb7b57946d344170b7640dd5fe4bd54e0fd07801178088cfcf1ad28b2a4f6c0d0316d3b3436bab9f5bb28a1e1f581bf57c6eae9b4d0f76e64624cd79039081a5ca2bb4828b4b8cecc0c5279bf468feb1e01d339ed62700173dcaa90616f2fc540cd4b96533e5595ef83fab046e591a2c15660ceb4fcf8e1755d3895df4dbe9bd215471e1083d3d534ab7f6aca36bdb0a7ca11b3b57d3dd035be8c989e2ea679dd94795bf941a544295678ba9f2d4766afb59e32ab018f6931770b13a5856984d95a77756dd07f7bb78902aaf1cada6ab27e8b75f0ed3c3a3bbe8f6be0dbeceebdec12d61eff059f98e90f75cfbdfff22c65938e17bc7a45d99eabff3b6990265072eaee32aca1a22ee091e627e026fd568705d1e5bcb0c2cda6529ac993cc036e6c59e22abc7b0f5477595c6f5c5833be8c595e30240760410dc285e4f4f6ffe4abfddbd4987776ca69dabf3a864e3722a3568cbb21c9356e56653c1e26c2a5c9a43bb3715d0b6b54b6885f1bbc78f1e125f4fae5e108c787377213d3a5e2c18fcc9a9fd06c39fa497d74f9b54796697b091583574b3bdca72ab2582905006a8e4fb313dbf748c9e9d3b448fcaf7d0c363bbc5586eeddf4295cf2bcc3196eed94585c67c766c582ee6803981d6e62f30e7ba6b4d1e1ddc5c40fb372ea3adcb73e8eee5f3e2fd3c387d44800c730a799717cb8c671fa5e7978fd1c03e5d95eb513acb3e3714314c2770b1d46ad5ac5148de2807cec15b351a5ce5fd6b9969314e8cd4f4a3f795dda110a95725f0d6fa3fff3b6c2161e4575eab6668fc8c1dfdc5af2704e09e9e2e1100b85bb6c764bc8adf7ea355f90b69fb8665b46b6301ad5eb2d0643c2b6d5d932f00b665cd123a72603fc9d7c3f3e582a91f1cd911062a3116481703200c2e73ccefbfa92496c421e032249f3c3f2b619ed7b7afa4eb3b568700cb9ce37acc7139adcc5b603bc7220378aa396223c27def1f366cbc5fcbc3c671b1748b125c0b0776f4042e5525326b2da539a3427885b371c05b351a5c6c6fa9923a659a3db8bb3299979d1a568fa16a21f32619aac385034ac6831a7863f75a7a74e94c08286e5ebf461b57e586ede82a82f42a3676f69d0683eedaba91acd7bdf2520130489110605d2daf52e90c80600388c6ddbd3b7f7a15c0ceedb50518d44100a0e2e1bdb0396e58e1718ecb1651f19615628ec5db42e7f8e2e963ba6d6806774a360b2087ccd15057ebbff5d7b0718ffcf6734fe0b23605e57587c960e515ce214db6dd9574709576f606aefbdbe6d0476f8597a27033482fe03219d0b047e48587ba0435c9ca74cc789b0c9510cc74e9dc09f1bbf2b2c3b68cb7c7603cecfe7b8a3691ea02c0c0e426d3c13682c479e578a8fdff4283b9885b21102c135446d9f56e6e1cecc000500d4928cf118056014b9e63f1d6d5f4bca24248b2d54b17bbccb180f66c57cf1152fa56f13aa18e0aede0fc3edb8dc32bb8acf63667e75c593bdd165ce0ad1a0d2e76c1cbe082de8c4c71ab5b7e52d3d7949d79553986efbef6677b7031035e3a4c8f4fec153683ac26c9176c27482e06d7ad1bd76dc1b5d55095185c470f9590dd75ab641b3d39b6bdcaf92079f4ee96ae0d092c237ee51434464c8c3f8f98569897104c7df98829b5601fa92e8009e0dabf633dddbf7353cc71fdca652e732ca0c3fb8b6de788675ddfb68c2a8e6d36c7a302d7cae1dd3c814b6567776ff09ab29485c105de0ad4424b3d1332c5ed32b71154b6da5ed0bdade0da36f13bfaa1759310908580cba0fbbb96d283b347c9ed2ac8994dd9937fa2c5d387d0a2a9836958dfee34e4bbae213466606f5a326b18e5cd184a73c60fa4cb17cedbdeefc5b32774bb283f0c0c903e3c562760c9c40083c47372c33f3c77dc718e6b97cc37e73867dcc0b0f981a60def47cbb2868b39ce759923cff3669101b0a39b42c0858d0376a393d492c165b5b7a0bd800fb6b4aae60b1960ec92aff16a21834b7668b0f710ff1e1bd08cce8ded20e848df4662b7b20695dddcf14debbd1e062e2cf8f31be7c9cb75e7d64d9a3cb40fcd1ad99be68dfb9e164dec47137fea4a13067631a82bcd18d693161960c81ed797660eef45eb0a725deff9f2c5f33010f468d7dcccd2f0daebe245f102139008462b0176fd4cc473cc3668dc80ce345eccb10bcd1bf3ddab397e2fe6b861659ea777f7b2e2a970cbcbe0429ad78b3d0b1d81c5cd41012e64e3581d58e33bfd4df086bcf15a1d1a351e5c72ca13bf1c2e83c7ef9077c62ffbd2f49eb4f0f3f0f66b1cebb05b244830113b1ad62f9cf12e1ea2970f6f8a5dd6e9ba72f102e5cc1c4bb347f7110cb670423f5a3cb9bfa01c036cd9e3fb52d6e8beb46fc7667786bb734930bc752c485b62e6f304aea2d954b1731e3579eb3fece7c72efa5bbfd0cba70f5d01669d230005c2cfd83ce68efb818ad6af72955800159ec98e1a797e0890bbc5b838888c0ecbb2d4423201e25f488f6270710f10ae11637e026f0571ae572f032f07c99c202e5547d634bf6c644fe37778e9b26ac83ab8dde1e370f70a89f059635bd5094c003be8e985635471ffb62de31c3db88f8a562fa02d0559b4f515ed285c4807766da0278f1fbb4b2b047815cf4710985526cf5d9a0c703ddb3a8b26776fee3ebf57f4f2de5557f09f3a7a90766dc80f99237edebb75a5e31c1f5f38414f4eeda3e7a78b6de7871082684c636c0a4ec03a327f48586c939d575c202bf71e1149c0afba70f1ef6b7c9c0b3960fc32509a2e0792593594933af1ff0ef543ab94195c76cd6a10a874b34b647ab27f253d3abc996eee5c498f2f9f71049bdb855dfcc5fd1b229e26efe256824322d2bc42c1a01ba6d2a99c9f4dd5104e11d73942921920abb87b8362b9f06eee1ddf4f77f7aca6472585a66da522b62759e5b52befb7164bcae5463005f03b008f375af088ac2673f72b50b2f30bb5c82db42b79678fe1f50503aa7734c3eeca6c14dac086631e4e9da038a86c756ab85145f936e1f8b8b9355f18e737f76e104e1030961d09862bdd44f7f7ad1140f5f21c76c1ef9a9d197143cd7b2b460b0741984bde6d6e0618303780e3dee11d626e18bbddbc10c3c28683770187cc9303859e9ef3e2c436d3deca1b5155bf869e926ece0c6b35043651ce238589c0fd47e477223bc382c45dc9a981aa616ba726fc1e7559fcd24f0f6f6dda5dec92f702ae4599df56676944002e5bef5bf1322539edde76045b096383e325925213760a402dda95f593299d3d492f07a96d37b768ef59b6665e884a28c06553de2fe715c25165b5b7166676117f87838b5b05c8ef842bcf83c4dd57746144a8dd25bf2cb13b192f925ffa2f933a53618b2a70f1cbf7022e560da3915ef12478f8785cab47455e950cb510a5f24fb7cc300b25e175d4657eb29750f6823a010b79a2aa7826d61b2aa10c2e6bbf10e623f05400ae578592aa7805bb55b1339b4574868ac84e8d48c0f5b070a2e992471a8e2e8cc759f0505be19c88145c900000d7bd95a385cac5401559f21acc6fdd9cb1d59bda2b2f28c2074ee0e22a646ba2b6ec1106b8acf9a872eb3c1d0a26b5a944e64c0dab6a089dfaf6929f435fbef1b996ef5657287b01d783d5e3456099171a09b2c9663c560741181baaa623eeeb5e345b800b1b10becfb657aceaa11f84e7b3fb1de3f25a6ac2ce0c3933e3dbf66d43120544ecd3626fb14a98eccc0cedc025c7bb64d510f539d0ab43dcb47d1b098f612492ebfecab12131af488d7fbf09aaa935bf0e3654c4a784ecce16e0124e1f4345bcb379969977e8877d190bb0385117e3918b3fbd7a0a65700d68df5cf432e4cf5c9bd73fa4fe4f5609931ddfd20e5c37a6a955438e5dc82f1f4e0d780cb93a99c16517e7aa925ce3846a889fbb7ef6417569bc619f247a8707b07847c758223d9125acbbeefc1fe8eadcbeaffa344ea7b2c5a34c8025637e5005d9fbf9a73ffe0f3abc6058c878a1fe3a810b6d1bb09eb24a38a4fd6721c9d9584fd99921ab84e0a5005c123dcd57ab86fc0265ef12bc8748e2fde293506fa1d3823d5c33412c08ff1f09a372cd176c1f3045bc9d179ce2245a0ebcf667baba7c8c180f54a568c17563e140012e9e1f009637bc87f91c307abca534e606555bceeac7c681f959d55d374f21b7b296c195d5ad79886682f725834b5609c14b01b81c54437e711c549617044165b8e37ffcaa9167703d5a3799eeaf1813f23b2cbcaa6259ee9c04c045e35d04b3e1bbb807806bad6562c653f5b48ff8e085bc21025c77974beab3a122164de9272487aa2b14ecbd68e785ef01ac3c376b990c362db908120e8c100fa74bda930a5c0b0776363d85d6cd8843363aa984da814bced6b00694adbbddc68ef528ab5dc3b0e0a21359c1c5840c07d862aaea6515f0dcc8e9fbf058c279213f3f1a47866cbfdcce1f6ad85c3fd2edbca16173038061d3c920b312c0e1362755a1a395b051592b8b2145ad366234e0da3c7940c8676470c981631dba3e69db14948b27414ea76120a17779db7a26b8dc7ac60b70ad1aebfa19000d2a231812800318bc80ce0e48b8c7b4dead04a05852399dc4122db8e02d943359ec627d3c370021967981701f9e9b6d6b3b4b5f14d561776ee0ead1be5558575e39e589f925d9c591da834b4ee4459e981db890fe2283cbe92821593504b97dce0978602437c2e7bcde3316a95515449e22c05525bd0644352f2f73b2db1c1cc9504dad1e50374fa10a5c39df34529e5e239fa4a943a2aef6e0925bada18cc06ec7e3c44d06171af77b597091d3662c7ab400f393dc8e95f5420f0b2798e082ede5453a27848c778cc46255d03b1270416a21f462bdb75c9ea44b2bb5d438fcae7f78cc4b157844390aa7c5389d8d6cedc0eb45354904f3c1fe88155cb2e4023d5c3b31f99b870db0385dcb0bb8384120bbdd0721e96ff2a6843213b3996c7ffdf8584b70c9312f0e14aac005bb6b64bb4fa9cfa7ef452c2db0f8b07792c580b1aa8366f26ef102bab36498092eb8e3c5e6912480e1fdda6d1a6e694f32b8b061426a59ab22e435d431b69512a79c70cc8bf3c75465e15c7630a9cd871131809c550e4684472b51cc8767f9052c956a08a031230bfb26412083ba6d27ad42eacf3cdc0bf6332acd21b5b0be762dca5925d425dd2965c0a52aff579dc185bfa35189f5081a2752edac6046303db207fc9468b817765a30841f6aa092698d71cbaaa115bcbc8970e532c613f586628055ccc7b80fee1749f0db8b3343548e6776a18e9f35367ba8a8547bd94ba8536c2b25c0757562784059c51038e0ce5af3e5974a06c68996a2c9138c8510586770c5eade8f177971667089ffa2165555e828310a5b3f4302721b085d5542adc12597a1b04b5e753835f20cad8d6cdc289ad20edd49560defaf1ca3e518235151f9fc64d5a993d032e4be96baa43ba5d4c992d6445e55749febbb4abad48b48554b3770614eb26a684d394a3679c9ccb08659e4e644d68c0fee0e76a887befc9b52e0b2532d9c76393b4ab4da166fe24c0d263f62687edb855ed786ab8c55da08abf4baf4264c5970712a949c6768dd01616b416ad9e9e7b676978b672bd9b649e5fedc88c17525eb3b01ac7b05a3844b5ea739b99599a8ec68a8fc76798a01b8e2d08d9777c1ab73fa86b5bac6a278b6bbb665259de1acfd424c26dc30852a0fada0ca927cef6ae1e6e926b8f07e50407967d9707dd4568fde493866aceb8a0d141b8eac6d04e08a13b81099e79e8656b21e5c1dcfd4a398bc7b05239587fdc11901e744e5be4554796a87678001480016e68fffe3e7b2fe9f68012c2fadabadb14b99b0d65873f99ebcfe678704e08a290d4ace31941bede305730607ef64589c4883c9c920d591496c3799debeb2b5f4f2cc2eaa3cb2a60a6c2ef713e94fafa4217e3e35aca51ef696c7e031885b54635d410c22f9a00eb965b50e5d9e52125c72cb356b4728bc74b91295cfc255051d6d83c93154ffc64a2c8da1c2418a3e5a3729248dc9fcecd1f55459be992a8f6fa4cad2a5f647b8f66f22becf06bf4ee05285506c3b3fbd5a6f9654886761adadda4b00ae38810bbb98b519a49cc4e9355b03922299e0825d247bf8a2f5f6e15d94677e2100ca5918b8077e974af6166c2b550730c43903c915c7da2e59e7c66ea65a44ce35f3aa1a5aab64130dae4bd37b9860c2cf32c176f212ab8253042e6b7cc70ad643bd3f4c297bebc42b75dfda328d7bc0abcafa91c913802bc6b27faba45211ab8661f53f1ac6bb105e103d190d105c9bdf9ff676a81362c4e3ffe7277c630b30a85a722d131300c5e03afcdd4729636f41dbe078a5ca8baa5a67ddcafa530a5c486be19768ddcdd4eac7b488bd86898e773dda3e4f9cef7c61e9682ae9569f2e4cee2c807035ef67ba94fb331d9bd98fcaa6f6a60363bea503435bdbaa8ef81e6c2afc2b4badeb798614ccfa8e4e4ee9416593ba8b33834177b66489e756ec5ea0657ccb4e25b4db9874396c2165c105427a8bd7972e7b0dbd0694e39567f874e77cc1d060ec93cb26082acd19154625593f0952fd0d743067245dc81d16022c382e00ce638b465059ce08dbefda5159de58319ef3ab26d3b5f53304e8e29996158b4aa83a4dd3f420f6af1580cb2fbb4beeb0aa7ae958187ef15e730dfdc833843400830248670a26d1a1c5a3236678273abd7c82082c336143c0f3fc7c06e8f892717471cd54bab9719690b07e1472469aa88b3554c5ff542aa1cef6564a804b6e16aa0218f47339435a26afb986d124b932982005fc66722bc3dba9720081df40b6124bb768d4498024dac031543fabed25034bb74e4f29092e2e3f9101e64450235995b4e6a6796dffe524a1c06c7e333000c2aa23eecf7612c0e3654cf81c7f87a527df0fe41700b19140d5f5ac1abb1c70670d1c63ddbcac333ea3c3292669012e6bf1a48a902ac59e23feac57d5d04b9f763031a488574664c696999eed1b901f6a57b4c463609b10aa602420f4027a2f9d75adb984000c341539bea922ddd5c1940317b75d4349378004c2cfb0c9acbb98ac4a7a8d79b9310aa481d38e0e0605b326da1b170f6f263601a78d042084c3c60f173c1c4faaba2cac35d6d6badebab54f4b1b7045d383c36b3a94934bdec97900464cb7c24b1968762083faea870b9ecb4b52451a05e0b2b409f012f37272c9dbd95950a9d215585e36162729eda5a49fabc8753a992400578431324f8e0da98bab95a261ae74223b8fa89dede5b5a49f635bba766f0ac0e5c10982188a97645e956a68b773435d8a3c81755a585d52e29368a70917b7977432b39cc5b02723510dbd64c1735b3c5dce2f0ec015438ccc8b6343a51a42f5b3f3064692a4ab3a162919c042ac884b76909be805ec9050916c305e54427664e85c491c80cb8550a9ead92daf500dedecad48c0852037981a295c286a8c547a210e07492313ee877b3101b8008d4c76ae6c7c1663c07ddd9264ddecae68bd84dcf7241d1d1935065cf2a9295ea497b561a85d4e6024e09241022080f12135ac60b0922aeb3d52e2424300dcae54271670595df25ebc849c91910a591601b83cbae5bd94a25803ca7e824ba5a681e159fab8818d094091a516ee214bb5447a0cad49bf5e5442ac43ba4bad1a032eb92ecccb017172aea15dd6821fe04a0777bc0c2e2fbd09d9fd9eee52abc6804bee24e5457ac9e5ff4e09b535055cc83cf1022e2fbde06b8ad4aa51e08a447ac965284e397635055c761e5339d6e5a5bc84a596ce2da80370c528bdbc780ed9b1e104ae9a1244b68b73c9592a5e1c199ceaa473697e00ae04780eb9fb9213b8e259c1ab13d93975185c5e9ad0705c4bf7eae1005c3ec4bdbc646da0afa113b8e2995bc871281dc0e5548a820dc62d23839bcfa46b0e61002e45d686f5206b95f472dab5518612b723770c6023f70eb12eabeb9d83c6877a3510764cbc33e39d36987b5b677b2e86d4b9c76000ae38e41cba65cc97e78f498a53831d04bf4cec5cd576ad4d2d938e7cdfc83c49d34ba1672c84921aa7f9df5aebadab533aa73905e08ad2357f74e1705faa726339e6146ad5f5ec0182acaaacdf879747626f952c1841d7578e77540739cd29958a1c0370f9e0dcf092d47b2e7724edcf1eeed8c0259ed2cba93559bca516bca14e1bcbded983e9fa8a71813a18802b3af510e0da9395e958f29e88aeb5e2047b8912d1ccd42e1b1e840da778c6c088cbf70370d520e2bc43bb83f32e2d1d2d9868dfdca1b68c164947a47471c163c3b103175adab177b026aa8301b824ef211f0fabf21e42ed0113814a168e4cb8d710aa1982b8567738aa83e36aefedb40f4360a3e177a2b2b3d2b92f4600ae18fa225aedafbb6b269a8cb477ce10cfa5177e01cbade9288097c8ac0c6c30fc3e8ecc1b52e34af70370c5687f593bf5323381ec9c1bf1706c38b57393c9ef1e8800b55de0184e0c3b7041f2d7743b2b00974b5f7a6bf606984806989d7ae8b7f4f2daa4d3eff66e7689bafbe70f0b790f70f6a84a496a52164600ae283a46c16e60809d5818ca5476de433f6d2fb7cc88783dd7ced692d541a65ff247853830d2b9d94c002e1f83cbb207913d8632d9790ffdf21c3a65a2c7331c60e72164efa04c70f6c8c0aae90e8c005c11808b01767de9a830c6b2b3bfc0e87ed8404e6ef07895bfd8a983b2775026c406195848880ef8270097e743ce39c30000db33b53fed9d39288c0e2c1a45070d40c954be6c7ccccc6ebda71bdddc149b5b1edf57ddb774c108e5bcf74ee865a636d5e42c8c005c51824b762dafedf82e151b00db376b5008ed9f9d49071755492c994ec40030947158efe746bfac9e1235b06e6d9aa5bc274eb5b4ce17b4636c4f5adffeed10091f802b0057c4e062806d6c599b96b4799b768deb691eb56a1eb93a6f281dc91b1b46e54bc7d383a2b951d95baafbb9d1a31d91a9a315c50b6c9f7538770c95ce191c3657cc3faf451ddadaaab699e214802b0057d4e0021dcf6c4eb95fd4a67c83b1768fef49a5b37f0aa183f3878a80af8ac0c08f3d32feddadb36defe346c7f2c7797a0e407563e34c3a6180dfee5e078c0dc33a47cc1bf3cffba23ad81e802b0097277ab1a3133dba788a0e0f6a11062e50e998ce94d7dc90602deb50d1d0afe9e09ccc103a9cfd331d5b32ce9620c92e174e13f6cdb35dd9610c7f7dc34cf119a77b78213ce3a1213165c2bd11e83eb36292ebf7310febdc305fcc1d74787cd7ea00bb04aeca0b6be8c59171012f05e0b2d0ea7af4f2f1af84ebf9e3070260aa3cc3dd63bbd35263f7ce3776ef75bd3ea5fd53fbd1a1b9834d3ab2609868bb96aa84f1cbf301619e982fe68df9df5b33310c5cb7f7ae11efee65c5037abebe71c04f01b8aaa9f24c2e59af67659bc300767cc1cf543aad1fadeaf01e2d3176f1658614db3db2b3c8e2602a33181412e8c4b2092945280c95e78179f13cf1efbe497de8d4a2e11675f94b21ede5ebe5cd03014f05e07a45c64e6b77559cd917c24cd70a0c9b64fe103a943590b667b6a1a5cd6b09da36a085f83dd3510384f0189e5c3e417bc2388f2e1c1632fecdfd3e37e7b6ae7b23315ffcfed62aa9f278f32caab87545f9de5e940e0ec01580abca5670ba9e5f2e178c64f6855836968e197649d9fca1b4775c0f2a30a4d73263775fdbf9432a99fc9df8bd20e33308069f5a3e515bc2f88e2e18668e19e35f6d4829cc6765dbba21f3b9bc744c75e3d4ddb95479ffa6ed3b838a1d802b905ae4e50223c9007bb876325d5936868e1912eac89c9fa8f09bfab4fccbda82b60f6a297e2fc89008a70cc90047826e8471f13831078c7b45ab3a620e1b7a3416bfc3dfcee68e10a53732b05e563c737d67355d7a6504b6562e79bd2a9fdc178c25ab89f70b2709e6832d563cbc23ad3498b3c060ced5edead2be315dc4ef41a7968ca5b32b276943180f8f0de35e6b6c0e183768d79076e2f7277386d14d4b031ad8a15eaf97f74e05e0aac904ef56241776ec67070ac31c1dd8d9cfe78da4b2ac1f6973afc6b4e2abda82d675aa4ffbc776a51306a39eca1b45e7564ea6f3aba6248df07c8c03e3c1b8303e1e2bc67d6c5e269d5c344cd896612dbe7f394c915ecfb77c1580ab46c6b5f67c47d15e2a4f22830c59f40727f5a2f506e3ae349816849f4b0c66863438573041a42b259af0dc938b868b71c863dbd8b5211d9ef63d9d32407575f958a1f286cccb50875fdcbe1cd57b826610802b706444be2bc3d161d3fd08eae2af864d76687c375af7755d5a6d3031083f1767b6a2d306935f583559646fc49bf09c13f33369efcfeda9b0751d732c1b0d801d18d7558ce5b2b12160cc6127be14653b3a2e5c257d0d766c64042a616cd7f3ebe7421c1d2ababd6a021d1ddf5530333336684bb78674d000dfd9fc9174a970aaef746ae110717feb73b7f56a227e0f097bad609c1254c2be32d45f2f8e8b40350cc0453be67d4e2327f4a3963f4fa4dd67ee905f97cad1a1a287eb26d3d5dc61b4b75f335adff60d2a6c51dba42d5d1bd0bea16de8f8cc7e747ec968515b15299d9c3788caa6f4a6e2815f8afbc9f75fd7a60e150ff8924e66fd20324d1eac9d643f56c4afa2b0af54d7d12b0fa871e64c5a34fd1b3abca07100ae74a0f38bdfa73559ade987319954776036fde75e1b43a8ee9862f2fbfaad7c87a793ece53eea877ef894b6b57f83d6b5a865802094b676fd80b6f76ee44af85ca1e2fb1b3bd415403b35adb7f0fa01dc6e638a550d94af7b4f2ae82f437784bcf73f7cb74a6c6ed3a7f4109b5d00ae1420ec8a58b02e2347d25ffae787814945a3379cf51d6050139f16cd8d0864dc87e2fcc4ce74f8c766b4ebdb7ab4a5556d51e6b21e52c723edeef531950cf8824e4dee4ed7f286d9aa7b4a506d9a4e15a776d3cbe7bff9f62eba2e3eea691d20d9a051006cb797bc15802b99840560150f0be3650155f4871fb6d2c5db4f7c071818f4c5d10de27c2da75eef5e0087ae4a6ee476528b53af79d116bb249f5edef077a3595b763dea7581a6018d039a073490005c7156f1a0b3dba978b15093a92514afebe5d51355676dedce1607c4413a440b345f68c35471bc2a408fd32045b9cbc9227af9eca1aff3c686858dcbaf358226824d34d554c90cdd1d0fd0d1fd0413d3ef7aaca77feaba8afea1533e151ebc183f80ddbf46152505d52797184c0d6901b0f11141f122484d48271cdc80c3f44c408120ad2e1f89cb9c1b4ddc29de6f3cd68ded36069bce922d43277b092f2cee60ea984b7fd76e1efda7d6b34cfa6fdf2ea07b8f9f513cafca5f4aec8f0a32981eccef1bedce76ae463ebec97769c5d7f015a5d5efb6ed1cfafb0e8be81fbe5d4affd46d4d5cc1868d18da8d4e604b1ab8a04f47e27c8886feb1cb0a2199feae7d76089854d4775131c5fb8214ab3cb822792797405a19aa6abcae9d277e757dcf580bac0936ba784937808d6db6643a4832126d3b61d2f10214160bbbe4df7fbdd0759155b4f3e4b5f803ecf96f8e522c6e74b6d8574f6098dbdd90fcffda7b71c4ef1c5a04a4db3f765e1e37e9962c153223513614c4763c5e1cdb4d5ea4931bd519544089ba84142b2b8c3fa80c498967c5fb6a3e7143ccef5f509b2c53ba41f3f09b5fe010833d9f08a065c41b54b1b8ca9d0085dd0e3abd2f0b2ad1b48dc72891179c0a7103551c5540f9cad979d2f775504937bf55496850906829072eec0e7101541c1711f45f3bcda78bb71e251660cf1e0a97b86f769501d878aa80f275e4c22df1cee2bd2e76769b5fd22c1eb659463c02bc7ec5a2a083c3bb170f09e544cd276da2645c31393c120caa58ecac78800d36dbefbaafd50a60be832b5635305980b2523c635fae20bb71d63bc8a0fe2518547cd519b82ce9c00a23836fc03fb0d722051b78575b7045ab0aea022899b02323f134999700999dd303a032fe9e0c50e1ea9455a41fb06cec357890bd020dde6cedc08540b0ec1277333c75049495fa2dde4b3a5c21ae7b048013e0fd73baa66d284b096029a59a61abb901cdaf142bdfc0c5761640253220da6485012c1500652518ecc9be84c3e315b812e501b4bbd61cf82535816521372fa21ff65786dfeaa000cfab09609790072dff2d5508768516d2eb950d06a975e3ce7d910d61a574f40cc64b554c847a98e147d685a90e1ae2d61a10b44aae545c0ca84189bc2edc7c209e294b4d76d5bf7c7487fa64adb3dd08e22569e1194c0760b177d18bfd156be574cce092332f5471286b941d804bb5c5005381e1e3edd64630f6c311ab95529383cdb8de1fb8d071ac50ddfc1e9b969ec138832b56ef6146ac1918b213433511004e1e70b4797fc926307d3caed3976f52cfb9dbe877ada62a9f3bb2b0bcda7358924fcf9e3da37fee30c375bcc84ef7ebc2f8d205582a70214666073024ff26055c724c0bf6955dae987522a9ba287e322ceca64139db5d9ff9cf3d965607988f6fa2b3172e2574439854b033ad80a5f205c0c1e6e4dc4838b864a9c503b49b8cac1aa6aadde5a7f710ea9f67fbc578afb9fbaf5481cbb0bbf237ef8bd821136dad5abc730675001752a854e68b4cd1e61f66f8616b61608e93e9989bf27697195cee931735b3e27bd1648fb798b54f800b76979d33c36f806113f92fed66a63db8589382b9e2541f168d6b3e23560fa1273bca227653d5ee62ea347b47429d02a66a78f504fd6df892e8334e3c020c7660ba7806ddc0259b334ec165849b12022ec4006cddef362417c2211d25d51768d1eeb389f3b6199b139a98427afdaf4ed3638ad9b9012cdd3c836ee092eb00adb698557a25045c729f0b5b4786073d3795097d37ca2edff3a45ef9c1acd3b79ea65f4f1d897b50fcddcca5690d2c2b2f86f80a1c1c1b20f4e8882bb8f000f981d6662f5e55c37458a43732573b26f7fa99d1005574c5cec3fedc2bab28a59371fd74c5bbc56563f11c66c4e2c8f0aa12aa54c354766ac8d4397b5f425285e0561f99e75fbcc99a75326175498d00960c2e9523cec9b11169526f462c8e8c487305e580b21f3d2fb420639358bcf7424272f03e1ebac4d7fb7158215d5dee6e5a941dff3a393622c9dac888a55e2be2ec7629a09cea1ec310fbab4b8e697fa512a3c2fe42c26fbabadcddb2e2edf8d7c9b11149ce6144e0925ba2451b0ce65413af8e9054a17feb5790ba754e35919c04838b6303fd367d051772ac426255d1368b31068e3cc474925c01a51fb9b575f3d29acd33b880d674c9b208282057ff808b63c34b50f9ff035bede88965ec2ad60000000049454e44ae426082, 6);
INSERT INTO `sisusers` (`usrId`, `usrNick`, `usrName`, `usrLastName`, `usrComision`, `usrPassword`, `grpId`, `usrimag`, `id_empresa`) VALUES
(2, 'uco', 'Operario', 'Operario', 0, 'ee11cbb19052e40b07aac0ca060c23ee', 4, '', 6),
(3, 'soporte', 'Soporte', 'Trazalog', 0, '855fa866d6d3f72f6a50bc213244e36d', 1, '', 6),
(4, 'insumos', 'Insumos', 'Pañol', 0, '3c6ff27f8f4c3efa42bcee681d78589f', 3, '', 6),
(5, 'supervisor', 'Supervisor', 'Supervisor', 0, '09348c20a019be0318387c08df7a783d', 5, '', 6),
(6, 'superadmin', 'Super', 'Admin', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0xffd8ffe000104a46494600010100000100010000ffdb00840009060713101015131312151515171617151715151515151518151615171718171715181d2820181d251d181621312125292b2e2e2e171f3338332c37282d2e2b010a0a0a0e0d0e1b10101a2d221f252f2d2d2f2d2d2d2d2d2d2f2f352f2d372d2b2d2d2d352d2d2d2d2d2d2e2d2b2d2f2e2d2d2d2d2d2d2f2d2d2d2d2d2d2d2d2dffc000110800dd00e503012200021101031101ffc4001c0001000202030100000000000000000000000506030401020708ffc400471000020102020606070604040309000000010200031104210506123141511322617181910714324252a1b123728292c1d1334362e12473a2f015b2c21625637493c3d2e2f1ffc400190101000301010000000000000000000000000103040205ffc4002c11000202010402000502070000000000000001021103041221314151132232617142b114338191d1e1f0ffda000c03010002110311003f00f71888802222008888026869ad2a984a46a3dce7b2aa3da773b957b66e57aca8a5d880aa0b12770005c99e6b8ec7b62eb1aed70b98a287dc43ef11f135afdd6100e98ac454c454e96b9bb7b883d8a60f051c4f3692380d145f37c872e3fda66d1b80b599875b80e5dbdf26956c266c99bc44d38f0f17231d0c3aa0b2a81f5f1332988945d979acb4853cfa4603933023cce7f39cbd2652cc9625b64ec9dd9646c78122de536275a8b7045c8bf11bc49b228c05d54f48d74eaecd8db9df2b6f9c3301f6ac08ead829de093bbbce533520d6eb5891c47d6c77198e92ab9dbda2d626df083b8d871ef9241db114998001b647bd6df6e40f09cd657392903b48248eee1385c2a86dab126f7cc936ee0774cd22c9a3ad35b00333616cf7f8cc38bc1ad5198cf81e3e7362245bec5782af8dc0b53ed1cf977cd7d1f8ca985a9d251cc1fe252bd96a0e63e17e47ce5aebd3b8ff007ba57f4860b63acbecf11cbfb4d38f2df0ccf930d2b45e345e91a789a42ad33753bc1c99586f561c08e536e79a68ad247075ba5fe53d8565ecdc2a0ed5e3cc774f4a56045c1b83982375a5e5073111004444011110044440111100444e1d80049c801727b0402a1af58fda29855391b54abf701eaa7e261e4a64668bc36d36d1dc3777c8ff005835dea573beab161d883ab4c7e503ce58f0b4b6100eccfbcef94e69ed8d176086e95b3730ebc6669c20b09ccc86b6222208111100e1941041cc1c88ec84500580b01b809cc4902222401111004d4ac9991c0fd26dcc588195e09455f1b87d862bbc1ddda0cb1ea263cb526c3b1bb51236799a4dec7958af8091fa5a95d36b8afd0c8dd118ae831746a7063d0bfdda9ecf9385f39b714b744c5961b647a54444b0ac4444011110044440111100483d74c49a782a801cded4877d43b3f427ca4e4a8ebfd4bfab53e06a3543f81081f37804060a90db45e1703c04b220b912bfa3ff008abdff00a4b15019cc9a8fa91af4ff004b366222525a22220088880222200888802222009d6a0c8ced06011f596ea473065571ca4d36b6fb5c1e4cb983e604b6caccd1a7f253a9f07a4e8fc48ad492a0dce8ad97f50066c482d48a9b580a3fd2193f23b2fe9276693288888022220088880222200948d7737c5511ca9543e6e83f4977944d723fe357fc8ffdc3008fc235aa29ed1fb4b2e1f7f84aa032d3827da17e60199b50b94cd5a77c346d4444ce5c22220088880222200888802222008888068576b063c8195b93ba5aa591bb4dbe720a69d3ae1b33ea1f2916bf47ef7c338f86bd51e6437fd52cd2afe8fbf815bff30fff002a4b44d0671111004444011110044440128faeab6c6533ce8b0fcb517f797894dd7ca76ad877e62aa7c9587d0c020a9216200e26d272ae3930ca058b3116545cd9bf61db23f4425dc9e43ebfeccdb6c2d9cbef277b71b72ec131ea24ee91bb4b0556cd4aba63177ca8281cafb47eb35db59312bed501f95c7ce4a48c6d2ad50b2e1a91ae56e19f6b628291915356c769867755048e36999464fa66b7282ee282eb891ed511e0e47d44d9a5adf48fb54dc776cb7ed312e8ac6565da3570a97f77a0a956df88d45bf94d5c5682af4c5da851c40e3d03350a9e14dc956eeda13ad993c339f8983cc5a27686b1619ff99b3f7815f9ee9274ea0600a9041dc41041f1128d86d1d42b86e89dd594ecba38b3a37c2e86cca7eb2c7ab5a3fa0a6c368b5dafc80b0e024272ba684e18f6dc59311113b2831d7c42531777551cd881f59195b5930cbef96fbaa4fce4769fd0c6ad72fd258586445ed61c33dd20a961054bfabd37ae01b1accdd161efc95ec4d4fc208ed9c5cdbe11a1431249c9962a9ae1487b34dcf7955fde6b9d7127d9a1e6e4fd04c54355f1160c2a6116e2f6342ad4b766d35517f29b0f87c5e1c5cd0a55d789c392950768a2f937706bf7c9f8793d91f1302fd2cea9acb886f670d7f07facdac3e9faa33ad872abc597323b4af1138c0e3a9d75daa6d717b10410cac37aba9cd587239cd89cfccbc9d5c1f513be2c2d6a7752187b4a448293780c36c5c8c8367b3c2ff15b848ac5a6cd461dbf5ce6bd3cbc330eaa093b4593d1faff0086a879d7aa7cacbfa4b3c80d455b60699f88d46f06a8c47d64fcd464111100444401111004444020f5af4c361a928a62f56a36c20df63c5adc7879ca7e9ad1f5d169d5ab886ab6a8b7537b297badc1bdb8db70933a71f6f4a53527ab4a917ee26fff00d669e954af5f08f5369402bb6b4b66e7657ac3af7f6b2beeb7098a536f2fe0df1c6961f1cabff08e7428f6bc3f592f477c87d02fb409e614f98325e97b43be466fad8c3fcb4446984f59afeaa84a2aa8a98974c9ba36b85a2adeeb3d8ddb7851966c0893c5503470afd1d2e8e953a6c400022aa2adf2bf60f8675d4a7fb2ab5c805ab622b313c6d4ea1a299f62535963ad569ba32b8eab02ac08de08b112d8c2354d9539caed2b289a2758d5a8ab59bac5ad98befec0248d0d34adbafe36fdbf59a0fabb5a9d15c3d370f4919990f5558062726be64e7ce6ce86d00e1874bd5504139825adc05b7090a2aaac9791b77471a67479adf6d46cb89a62c09b815177f4354726dc09bec9371c4191d0d895ab412a25ecc2e41c9836e6561c0a90411cc49cae29bef163c1ad9f71e63b279f68fd62a343138ca14c55c45abedaad0a4f53659d474a8c40b29e915ce647b4644e1eb92633fe85ca2570eb257e1a2b184769c3afc8d49cff00daad817ad81c6d21ccd1154789a4cd695ed675b91ce3b0febd887a37b61e8ecfac106dd23b0da5a17198001566e619471333e9fd20b87a1900aaa55400058700b6dcbddf28d42ab4abe092a2d4dadb7ab56a917b8ab51cbb29bf15b85ecb760933a7f46d1c5615f0e7a81ac5580becba9055bb7319f3ce58e0aaae8e63929a75657f0fac0bd1a7b46eaa77f317e426fe0b4974acaaa0ddaf6b91c013c476190d8bd0d8aa9b1b76251152ebb01485191032f9c9cd59d13d0b0a954805410a80dcdc8b166232dc4e5db3a4a3d59cca72ee88ed62d17510fad53a645641d751602bd21bd09f676c0b956363716dc649e8ea94aad25ab48864750cadcc11f29627c58e19ca7eaf1d818aa23751c55545e412a2a57503901d2951d8273922bb4758e727c3e0de903a69b659cf25bf92c9e95bd62058ba8dedb34c77bd97f59183ea2751f499f0586c5e170e9569e219b65158d120ececdae4589e17e425f745639711452aaee617b723b88f03712b486a52645a8cb511fecf24d8d96b1b0b5cdd48047399bd1f3114ab523fcbacc0771fee0f9c619bdf5eceb3c13c77e57af45aa2226c300888802222008888052b4b530ba573dd56815fa823fd3f39bf81a6452546de1760f8757e7bfc673ae9a3dd95311485ea513b561bca71fa795e74d1b8e4af4c3a6e3bc710788330645b66ff00b9e8c65bb126bc70caf6ac756e877aed27fe9b95fa5a4f839c86a54fa3c7d453b9fed57c55430f30d26232494a5688c51718d334f549cad07a47daa55f108477d67a8be6aea64c932b78dabea58938937e82b0515c8dd4dd06cad73fd36b2b1e0029dc0cb1a904020dc1cc1198239830f9e484ab8398889c9273b479cf3df467a2eb5038fe9495271056f704b1a7b44b5f91db1f396ed39a57a05094c07af52e28d3bef237bb7c34d2e0b3786f2260d1b84187c36ced6d1ceee722eec4b5473f798b19d5d45af6428dc93f44951a3750496bdbe233b361ee080cc2e08df7198ed9ce156c8b7dfb22fde73332ce4e9be4a27a21d1f56861b102a640e25c2adf8d2fb3736e17653f965ee570d5f51c4b96cb0f5d83331dd46b1b2ed3724a9d504f0619fb579639dcddbb388aa5422227074720caf6afb6d1c6541baa62df67ba9a53a27fd549a6c6b06936a6051a241c4541d4e229a6e6acfc95780f79ac38e5974760d68504a6b7b28005f79005ae4f12779ed327a412b666902abd26369af00ed50f75306df32b27e446afd3dac55671721074409f88b12df459d63924991962dd7a26b174b6da98e01f6c9ec506c3cc8f23316a075971153835636f2bfea26beb0691e8d3a3405ab54eaaa8cce795ff006962d5ed19eab874a595c0bb11c58e67f6f09386373bf44e696dc54fc925111369e788888022220088880251f1f406071a08ca86232b705a9ffeff00cc794bc48ad66d15eb587641ed0eb21feb1bbcf31e32acd0dd1e3b2fd3e4d93e7a7c3ffbec55f4f0d8c4e1ea732699f1ddf59272b7a43480ad8401cecd7a2ea594e4d753b3717f9f74b0d2a9b4a1b9807cc5e604f967a338b5157f8363a20e963db2013035f066d8675e8f861eaed7443fcaa8b76a43fa6ccbc80960c39c8cca45f7ced32875e482ff008ed71ed602a13ce9d6c332f817746f3513ad5d278ba82c9469d0bfbf5aa0aae3ba952254f8b89327088784ec98651c3cf3937f62297b64468bd121599cb33bbdb6eb54cddc0dcab6c9107045c8769ce4863a993b2aa381c87809b935057542db570e6fbc1b102e4056dd6b70e7790fee751fb19b0ad745277ec8bf7dac7e732ce10587fbef9d6b3aaa92d6b6e37cef7e16e37e50476cc78cc30a8a54806e08208041077ab03bc19034b0f88c2756832bd3e142bb3757b295700955e4acad6e040ca4e600304eb5c759b6437b412fd507b6dfa4d865077807be130d2e990674ed61bf01589e695b0acbe05aaa9f30263aba43175725a74f0c3e37615ea8e76a69d407b4b9ee9347089cbe73ba5051b87eb26fec452f6c8ad0fa1d695cf59998ddea543b556a1e6cdc8705160380124710739b1356b1ccc86748c751f6416e409f21791faae453c21aaf96d33d463d832fd3e739d3f5b630ce798d91f88dbe979a6df6eb470344dc90a6ab2e61546673e39e7e4271fab82e4be4e7abe7f0899d4bc11aacf8daa3ace48a60e7b2832b8e5cbc0f396e98f0d4169a2a28b2a8000ec1324f471c36468f2f2e4f8937211113b2b11110044440111100444402134eeae50c486728055d93671704b5aca5adbed96f95dd5cadb5875077add0f81cbe5697d9424a7eaf8eaf47dd7fb54f1ccfd48fc3326a20935246ed34dca2e0df5ca25f0e739b13510d889b72945921112b9a5b4b3b546a749b6154ecb381762dc552f9003713cfba7518b93a4572928ab658ce53062a92d442b91bf0b8329d528a9377bb9e7518b9ff00519c0c2d3e08be000fa4bbf87fb957f114fa2d5431db0366a2b1b6408173e239cc4d8a4da152b3ad303d8576516bef6df99fa79cae85719a5475f1db1f95ee2755c3a83722ec77b366c7bc990b4efcb3a7a955c2e4b4a69ac331b0c452fceb3751c30b8208e60dc79894a7d93bf67c6d3ad1a010ed522699e74cd878afb27c44e9e0f4ce167f68bcc489d0ba4daa934ea5b6c0b82320ebbaf6e041de3b4496944a2d3a65e9a6ad09a64cdaaa6c0cd49c33b8915a5e974d5b0f87f8df69bee8dff2da972d17a228e18114902df79dec7bd8e72b3ab14ba7c755adeed25e897ef1dfff00579cba4d3a682adc53ab9b4d413e12e7f222226931888880222200888802222008888025575e30642d3c520eb513d6eda677f97ea65aa75740c082010458839820f02271386f8b4598b2384949152c3d65a8a1d4dc117137e9b5c482d23826d1d54b005b0ae7bcd363c3bbebdf2530d5c10181ba9e2375b9cc1ca74fb3d06935ba3d1b6279f9566ea8246d5465cb7976a8c333bed733d0254928ece3b6780ae587e343507cc9f29a30bab32e65744f51d0d41542f434dac00bb22963da4917bcc4fabb863fc903ee923e864a44a5bb2e5c74442ead6187b8df9dff007991757f0c3f92a7ef5dbea662c4e8fadb44d3aceaa4df641040eedadde137b0141914ed33313c58dffb7948527d1d4a2aaeceb4b45505f668521f817f69a5ac1a350d066545564eb82a029b0f685c765fc409333a57174607e13f433a8b69d9c495ae4a8e8066f58a57cfdbcf9af46d91ee207ca5c655354d36aa83f0515f3a87f65f9cb4bb584b333f98af0af94c7886e122f4c637a1a45bde3d541c4b1fdb7ccf8fc6ad252ee72f993c846ad6887af5062f10b603f834cee038311f4f3e52851737b51a6d423ba5d7ee4ceaae8bf56c32a9f6dbaefcf69ad9780b0f0931113d18c545523cd9c9ca4e4fc8888927222220088880222200888802222008888063af456a2956019585883b8833cef48ffddd89349369e8901f64ef4049bd8f65a7a44a36b10be921fe40f993336a97cb7e4d9a297ced3ea8dfc0e316a28653753b8fe879484d2ae1319b7f09a2c7bb30dfe9bcc2f847a0c6a50dc7daa4771eeff7fb4d0a98c15eb543622eaaa54ef1d5b11e779569ddca9966a61b63b97565f22446ae690e929f46c7ed29800df7b28c837cac7b7bc49790d53a64276ad0898b11884a62eecaa39b103eb39a15d6a286460ca78a90479890499269e98afd1e1ea371d9207de6eaa8f3226e4ad6b1637a4a8b454dc21dba9f780eaaf81209f09d423ba5471396d8d9db552ca6b8e5d10f00840fd66f694d26945769ce7eea8de7fdf3959d1da48d3a9595136ddb6028e02db599f313362f471e8aa54aadb750aefe0b98c84e73cbe76917e971a704e458757f413621971389b11be952dea14e619bf6f3e42e523f579ef84a07ff00093e4a04909b3141463c18336494e6ec4444b0a8444401111004444011110044440112bda775df47e0ae2be2a9ab0f7012eff912e651b497a74c30b8c3e16b55e4cfb3494fcc9f941167ad44f9ef48fa69d2552fd151c3511c2e1ea3f75cb6cffa656f19e91f49e2012f8e74077ad30b4ec790205e01f544a3a815f48e25fdd40b4c1edb0bdbc55a7846ae6b862f0b89e97d6710d4decb599dd9d8a5fda5da372545c8f2e33dff0057e8535a0ad49fa45a9f69d27c7b5c666d45ba5e0d9a6a49bbe7aff6715b0c57b473fde43696c11245541d75de07bebcbbc70f296c982ae155bb0f67ed33c6e2ed17b6a4aa45293ac455a6d62388c883bbc0f020820f1125d74d57d9b7d913c1b65be6a1adf49db4868062c6a51601efd6072563da381ed121ebd76a26d590d33ccfb27b9b71f39b22e193b31ca32c7d746520b31a9518bb9f78e400e4a3dd133616bbd162d4c804fb4a45d5adc481620f68f9cd37c482b9719d4e3028cf216de4db39652aa2ab77649e2f4ae22a0b0294c7f406da3f8cfb3e02f228fd98d851b551b200713fb6f373da4cd8c2d0ad88fe12597e36baa799cdbc24ee0b4353c32b3bbdcdaeefd8380e43b25529c71ae0ba109647c9aba2701d0a5b7bb66c40dec79760dc248e234717a4e0ef2ac00edb6579b5a373a618aeced7580e214fb20f6dad36a63ef966cddb785e06a462454c153e69743d854f1f020f8c9e9e47af7a57fe114daad0aec956b37d9d00010cdef35be11ddc84f20c0eb163118ba63b10ae58bbdaa300589b9250e466dc326e3cae8c7a8494db8bef9fc1f5dc4f98f07e9574b526d91895abc4f4b490dbbc800cb3e8cf4e18a5cb1183a4e39d176a66df75cb5fcc4b4a0f7589e6fa2bd3468eab95615b0e79d44da4fcd4eff312f5a2b4ce1f16bb587af4eaaf3460de76dd02cde8888022220088907ae5acb4b4660df13573d9eaa26e2f50fb283c89ec0098047ebf6be61f445206a5deabff000e8a91b47fa9be15bf1f2bcf04d62d7dd21a4efd25734a91bda8d0ba2db316637bb78932bfa7748d5c53d4c4e21b6ead53727801c1547000656ec9894ec803901041da9d055dc3f53324c05cf39c412672e26b56166db519f11cc7ef3b44039476717076479b7f6970d41d786d18fd0bed54c331bb20cde91e2e9d9cd7c476d25d08b9536bef1cff00633252aea059459b971bf32644a29aa64a6d3b47d51a3b1f4f11496ad175a94d85c329b8fec7b26ccf97b42e99c56018b61eb32163765df4dcf6afebbe7a2e82f4994ea80989acf42a6eda74152813f796ccbe23c6649e2947ae4d98f2465dba3d42957b5565e0c72fbc0663c47d26db2822c4020ef0731e52b186c5f489b4362aa6fe970efd228e20903acbcf7499d1ba4054ea920b5ae08dce06f23b4711c2509f865f287168ecda230e4dfa0a57fb8b3b51d19450dd68d3079845bfd26dce1d801733bb65548335b3320aa31c6d5d81fc0a6d773f1b0cc20e7cccd8acb53147656e94b8b7bcc3927ff2f2bcc1a4f58703a3a9ecd5af4e98519530769ff22dc9339a72e0b6d6357e7f627656f5cf5ca868ca7d73b75987d9d053d66ed6f857b7ca79feb27a5aab5414c0d33494e5d35500bdb9a2660779bcf3ac4835199dd999d8ed354624b96e6499a2185fea324f32f067d35a46be36bb626bb8354e405ba8abc1147002e668d4ae4656ebf9d873bf29d3d61bd91627716e1dfdf0896efe266ae8cc66a2a146fcf793ccccb79af100d89c52069b87a6cd49c6e7a6c518771130033b2b9807a36a5fa64c5e1dba3c68f59a2a6c6a00057517dfc038ec39f6cf7bd17a4a962a8ad6a1516a53717575dc78781be569f1ed336a8c39d8cbc7a2ed743a2f1429d46ff095dace0eea750d80a8390e7d9dd041f4ac4e01be62209399f387a68d6538ed23eae86f430b753c9ab1f6cf864bf84f39ef3ad9a49b0b81c4d74176a745dd7ef0536f9cf9230f7d8da24966bb1273249e24c1074c575881fd43fbceec6e6700441222220088880274a94c1efe7c67788062058104f580ddcfbfb6655aa8dd8791ca2756407788066a14cd360f49da9b0dcc8c548ee224ad0d65c7d370eb8a72c083760ac6e3892467e320451b7b248ee3386aaebef5fbc090e29f68ea32947a745e93d27e951fcca27b4d15bfca63c47a47d295058d6a4a3fa68a7ea0ca37af376797f7818c73c87848d91f437cbd963c7eb163b102d5b1959871556d853d965b6522169227003b4ff79806d1dee7c0013814071ccf6e72524886eccaf8b1b94163d9bbce746da6f68d8721fa99d809cc920e145b74e6220088880222201c55dea7bd7f5996c1d4833a5ae3e70873807d0be85f5b7d6b01d0d67fb6c3114c93bda9907a36bf1c811f8627cef8b665375665befd9245edbb777c411c9fffd9, 6),
(12, 'prueba', 'gemma', 'gonzalez', 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0x89504e470d0a1a0a0000000d49484452000000e1000000e10803000000096d2248000001aa504c5445fffffff0d0b4231f20414142cf9e778d9f23ebc19c000000dbaf88f7d6b9ca767a81494d201c1df2d2b7c1d531cd9b7300000b161317fad9bb1a151639383900000d000007110f14f5f4f4292627191415130c0e3d3d3e3332332522231c191be9c6a7e2bb9adf9e92d4a57fe2c6addddddd343334dcb28fececec8c7d71cc9971c86f76b6b5b50b0002d1b8a2a9a8a84b45425f7900bba592bf9573cc7b7dc1c0c0d5d4d4544d49838282000b177b6d618c715cad8352a18f81c9b19c887769695f58a794846c841b6b6969908f8f8195219f5c60743900675649605e5fb86b6f894e52a5b82ab5c92e6362627f491fa29f43d4dac2eae0d63c2f27cba681a3763ddfaa9ba280665a4d43777576b68f70d49798ecdbdbe6cbccdcafb0816958d0898bb5847bd5ad9a936163ad9092a27d7f773439c39789d4c6c7c1aaaae0bcbcab6a6bf4decadb978e8b9e55af9f52798f37627a1d7c921ecbd3b7a89f4a9dac7491987cbc9e63454e295462281d1420c2ad76b0bc91d3b6869aae364d5a282e31258a9766424832734726cec2b492714b413026671c004b2e1a885a3a3c2f286440274021045f3410bd1ae06600001f8349444154789ced5dfb7fda5696b73089ac440a0803b26c40103006c726049c10b0c1d8711e4e3be38ec70989e7914c3bdd9d9de97b66b6d3ce63bb9bb4d3b4bbfff39e73f5ba7a2284c09dcfa7e787d68ea5abfbd5799f7beed5c2c28ff423fd483fd28ff4af442bb5daba46b5da454f265aaaddd93abad74ccbcbdbac4adb6bbc9ceb3cbf797b7de5a2e73635d56edf3d9611d2aac2f37ccc20f865790d00af75ee6ead5ff42443d3fad6f335c0b04c017310afe025cfb7fe05a5f6ce517a9b5df50347c15c055edefc970279e76e815d0b864e07093a7abc75d1f30e48eb47db13c2d3689965effef0757265ab190e9e4a6becf1ed8b86e04b2b473156090d4f63e4e20f17e3faf369d86790c2a67f9818d7efb16bd3c3d3301edfb968380eaadd635723c287b4cc3eff61453bb5e791e2435a636f5e342a8a6eae45259f14f16ce787e23a6e57d950f6054253be80447e72b960f987c14650c050f80af9746ed1a074552e3851f26cf3e243b9ade590025a90f3e9450be5f2b203e3eaf2053b8e95900cd458c4db51e6f27646f2ecdd8b04787b6a0b030a285b41e6ed975ca4a41e4dc3400a652c9fa3f96897d555f9a2dcff311b1a5401ed0a25905646a66d572bec852863ad308d8402d372e9bc1c3340f2051aa39d8decd1fc01de595e9e02208148d8952fe8602c18f37688cfe70e707b5a15346552d6c595974d7d4cdb21de9b2fc0f5e96d4c81b69f3a23f9bc27c4edce3c01d65c83ac0949a67d4455c34889aa1de25a738e089b512412bc05e26255b33a261bedbab8363f2e3edf8e002092c50fea8878437e65dbe56b8b73027833bc1fb411043455dad7ebeaa84baafdfa3971711a2b53401768b99d8f510654f7837cd55d1563db3f9d03c015799a629aac7b7a7a09a36032b26a5546bb9ccec52fde9b32d856253047c73318991a16344643cc39c465f6d1cdd6b44ac89bee4036396962cc69ff20bb3331c6ceb8f45f9b3a9631944c054945a69a42e60a1444271363ec6c338de3083c2115b8a0e65151b686b1405de664221f9b65be188da3a0b9b8684decf376880e730af9e20cdd626d4a80bc468aad420389bd1e98aae80be69b283887d99e5d6123b48c22930a723e5f4de7728bae64622491a90631ed8cdd90669611df0ec5429ec7b29a07301aa39128ca86458db9da9a18bf361b555cb165148e9a911b15ec35436fa20a34691da2ec666b66a68a77695fcf17722e1ae20e520ec4c34574f7462eacf10eac8d9b98c666520d5fa76514a6e0fa640fe255511d8f316f68634eb5a27cda4d4c633c3b03393da60a3368c82777fd00335f1dc34ca3cec6a7d518b5e0c830082d479f66d06606cdb8c94250cf829bb2b8a31cab99ba36f279f208f89feb40d1cb69ce4c29889f32d9823a16c8ea9828653f561a922aabefcd7d6c9e8d7809958ab809402242bc36537b0937004878339e208de10ad47f1db416712245a5015abc6816e327b1393448d90b646efcdd406ca40ba866406ac4fc4670e95c139b00a4874e06b97bf5384a84260ab54e54b5a7aca1415acb51699daf419c6d94c11bc5429b604d09900c69616481578d6d00884a3a3a8466cc58b501b42f684a92248a8a3299e05a4a6e202e606cf3415e5d744c340da9b58aab178e0c12f3a3d1ee8b47cf9a79b12b8913e0a42a35aa5e07aaaa2b9185a769c317e6fc00f2e28bb841e7a3dd47df150067409814c6c0e143644cbca3b3d05a7fb08ba8983f8fc713f1446233018428cbedf3dd4769e4e6641883c6f491c56ef78cc4d70720df7d548e27ca4541109862b1b4b101bf119ce5f8e8c5b34237084a5eaf760786184d59caa85d58cd8cd52d2bcaa81c8f97044625018132001471223b472fd28a341ea456700be6f281562359563cd217620a16165a01cae784818c9508434b1bf1cd048aece859571a6b7d544d702940b95324599411ec5be20f8b39909aa0811b767c144c6026f2b23c7a248fe5241195a091e076043570236db2b0d03203e9519c92507794c0cba5380aece859610c4822aa016341be3a3d42ddce68e2e3626524b031718784baa2dc404eb677d3dd314ea41ad8da4c6f6b560c3b436453b332f4fcba2fca89323316a086b2b8019c2c9fbff06724166a82219cded66ce97606c1e565a712828802c0e0044a49c475d4ecfa0a6b3a98b5e1f9693361bd3c837626a7f90b5a0941442702a88a6ba90c8c04db2afa4cdda37c61a769e39a1a6d670a6a6641cba8f80c000693502bc8e2126ae423c51b231f2c7a9b564c8da03b8fac2bd8655401373121070d900c6a64fb851563886c9a9d0e212da4dad210a51fbcd28ec7c30124184b04232dabe90913afd8b462ba623c909466aab660463a9f022062145021e38fcca05519a67d74d395d6a65a8a32dc3d29b31335a4cc4c77379e18ef0703606c3f33ecaab2fba83b194225370d427dad02dcbdacb9447368f1597cd3379209861165b57cdeec6a6f4e1a8d82655b064d159b2a464c8a0694b8446360bee01d8b4eca470c59654d3c33a3f864923a4df382993811039ab7780a6914d68c3a31825d8dc75f68614e77547e244d8070758adaf0969938c5b4e50a635c116299624408016311d4f13c4d80f1d27979770265e4a7a8b93dd7b37b19ed0b181a9385bc1c4f4caf84344654c75da2827cb75d1e49c1ddc6144bc206a03c89f46943da05198d12201155b0aa4d89bcbe76fc3c787b59788f68f65e9030a6401952a5598e5046758c45880076d17160acd40e0c317c1a6c6b4d90a9f2a1741e8d1db5634436a23642bc1b8fe703420c1f9a1e59bbf4f266560a6666aa60c61b62118c2afa7c8826006b30887c2c2cc263cb8e03be6ada996e3b5a3343416420e91881a47621226c07e462e8e0db5a0ee27386ab0016466c66688c256270c0580305d3c5b04b8935ab90f2667f09b030723343412c965152892ab60355a4c21ad33bb61e28236d5266c942429056ef7633bbb8fe1124bad90ed9b670d3da932f1b99af783e4b1622a14d3d2f74db587d0c10dd844da06ca654d6855479165f9a2d0b3565949ba88abbe3b918d65dfcd4a315b13b9a350b19cd6da4514ecb8fc6661a4ac8fd341e4ace5767ad852a44060ccd3394d37873ec42801c0ea147b3a5f8c2bf821f1d41ba314284edb1cbac6ba18aa62b1e0833edd98433ee10098db536e11aa4d6dd11829d99130b41529754886355319ccbb7bb438d20b59f133e0a627ccc6a5bb8f5198fa6e742dbcd550802a7d294ecb50f838e91343e646680f0a6eb263c105287ab8009355afdfd5e6fbf7e30a8844609e82a304ebd5eef1f342a298e86587ee12ba7e1c2b623d71d4e20a436001cd3eae5a5a42402495252c9ed0f186e727c1c33a8370b99a48494cc143afd0a7955baa0faca693884775d1176dbd6cc9713fad52c6dcd7945cce6eb95d4448c1452957a3e4baff2f38a94190ec828aa45f5b5a7e10a8acfdd102a4dab9072078a5e32a2ce10e0257638082eac0237e8b066e5c91846643b0d94863291d3673e7e3f2442b7a04d7c41d748b94a2743a6234a19450652327a13d47266d80828ab802fa3ce9e1741da95424ccc64256ddc3abe2722a66d1f26864378cf0d61f79c12526e5040fd1793dd617f50a9304ca5d238e8e559b5b22b667a41f491ab0cb3e47a4562e55e7fd0a8547098fdb4cad54c07e2b72281e8636ca244480929d74ac21cc4eeb0659a77b087a9463da7ce59920ec64114b8bebab8266673f5464a1f0787a9f4ab4918464c5704a14854d13b1b0e87f0a72ee74228cf4c21151a20a14a725871281c270c3a499c379f19567cb5916b7492049f341c08f67138a195cec2df9a6a32e5974785b3a56e08c51794bbcf2b3129ef6e5038b41dc84731d6f08128b4247c110a0b3aebc66d4ea8031ba5614a738b9e1e233a84dd732326e57a522c3914bce62fa4064d146276e08390ab0357f86ca7e1e95bb846558cb12d8e11d0678cbc98182ea6714358681b081ac958a6eea76682009e44cafb5cc10883ac22c9077e7e85639a229fc69fd063786962b8c8dbc5d2f0df19b92f3714b3be00f19a4a7d8ccbe0facd7ac57f140120669189c54d6f4d0cb748ea82507964fa0a56eaa5fc013224621d77c158872254f26293d3ac8d872686cb0f5d3cbeb87b599b3177904d3be722a87da51113d7c84a151cbeecc5445e0987d019b54923dd1b724376c0114c6ab6934a415ed01800351a15fc6dd20c431d2895029b03b183803fa969140c93aab3aa6385c0c635740bd9a1e812797755438393a9828c42ec31681df4ebbd61272db26c369b04ca6659b6d0ecd55b8034104cf4ee02a64dfbc34e55d14efc66bbf9c54e0fd2288871981427f7d0daa22aba66fbcbe1b6cf90ec49cc66a9c5d84219e75c19b4fa3d2597960b2220920c028019f2bb282e8bf05b218dc19ce0a769301c067a9dbc8237e27d2405c31fc5d555fc09e254b9396ca6e185315c6ac31a9d2a529638d490f552cc8033bd56ab5ecd1a1d1900ad23039f605c359550a424db5d1c42eedb3f386821214f3b79369b141505704acdde41c38d992882000e0ca5a4269659b69b6e0e318daed7f7f77bc3c50219041fa4f07c32dbad767afd51bb69bc7085cdf55b07bd6ce89af7161bcb0e501952adbca6dfbc64dd27a2403039a8681a833ac3e96a09497faf99c1101c6192c85cd72a55e32aad7aa79bc5e18011f2332c0e08c6409a6a6b831839190c2575cd45da5c2b05cf4bb5d8b0eb16b759a9aefa038e1926dd145c6ab63c655040013ce84892264ec918c86c0b3387c6e0a03e4c2b192d034942c4cd78682c19a49f762d97267b82fae8d4500cb9f67487152be43188b19e750158375f7a4ab37dd67902abf6f5be3ce44016ec10da23493f895ec14cd97213672760652fe6342fc97e4a9b9bd09042ae1fd6d80e0e522a61eb5aaaefe0a2d849a64101f77b604a3bcd5c6e1194a8dfaad898ca557a59cfa4476a5a235214de3ea8606738d414b25eef35d99630b4bbc14c2b85b695cc8d6b865d0366fb30d9f266826ca4707051da17d09610529078b42c19b17960cb7bb996d742ae3414e84b39e6a0a924d5cd6f8a6e5425516a82d7b541cc1e70a4c928b1b9845353c2221c086a5e467a8352d687f032a4f898a16a9f7160453c2f17052f630fa5b94ad515a234a4f1412e2c27d5eb001ff9600429d88822a698826588e4be9e4fc5378b105f853d3e6ab1420225320ec6a39625204cdf217fcd74c5f4f1dd9b77d64f4f4e5e690b8c7cb6698da6b98a5b5fac92b60868a39ad12efaf9c9c9eefa9d9b47f7726bac94ec901c1adea679a7f80c86d7abe1900b34c2f6d31c316aca525e2a6317a27056482a061f3344c985d2dea97af1c8008893975a56882d175b9ca4afe10eccdd09ca37270f5faba3befe5aaf1170c6fbe52519260300cb4b4bc80086a984ed89da62982219070805b5346a55fa49d5ac89ba84ed69737978f22dc562257960493cb89c434e79890298aad3e648f9fee46b75d4b3b67e114996f16fd942bd5d421125f3c2bd2c0c137643c23a262c2a4084c8143705ac8c49340384b33d72ede9c313bab5fee7c4165008eb3af3795d60154a0bb93a2b53b7f3df9c9c9049af3c31b235411553b1d9e2b8324c25aecd8b349f8545b88208978c91ca4c82086687d45f1ada838b4f8898be7e7842f3e79b5731927b186644135349ac3665ad14ba6ffc9deb67e557f40b924f1eaaa33e3187a8e0da8cd211b0a0c194e3fa9b5f9a06e12976441a08e38962b9a8eb3c2f1bef76ef4c4368746aaf2df3df9dbc12950a85b081be864fd62134630e0844c9a810007bf8572785d8b2f1451a1de1de19658cb0829125af6da99430e6b5142f4d87b06c228c2f6d90ec90cbe0bbd4d54c2811269a52babd78f798fdf6e4cd1db6433191204cb6c85d5c236341c8280abca0efd8cebd35adf4fdf3938735c2427a05015be949d5a75882c998139b928714c0c446893c30b5c89b860699d8866b571e9e7c4338408eabb8f97f27a3859baca98a448b327d4e974a899252ae0761e5c393ff058358539b92c0d2bc71b0500063aaea6eb1b81437214e879029eaa280042f4f9d9118134d068026a239fdfae41561805a317983e6fe384be96116fc9f794fde7c4942030f251f3d1ce17deaaa2c08690b7e69ec511c6450ff55be978a6a095c9bdb7408191360a20861a0a07140ea9b12289c3da91131fd1e21aa21e21be4418ddda76d3de5ff70083ea7252e9d023e8b6022bd037cecd5c94398f3e9134bbf00224cb630bc29a975371d22130142f4aba461963c12258e46c830ed3d78440b20ca8a7af6f6e93f89a1b8c9eac626d5512c214c05c434c3a9f2aba63ead1372475651be7b451cfea945465529cda2051760266ac8568e00a140c9a83a364e4fb42164f610e2e821046edf7ffbfdebd3d7275a186058934a81b7dcc20db5e90276adc672303a5d79fdedb7df7e7f4264b4b6d7662c242cc22d9c3e0bb21a4510e26fe1fd218ca623c452b08610b448b21583f730787b7d0218617eff7ca345720bb7450d502b13eb52ce838471aad4568cdceef5c37faaf7e3fb397d6203c830555e594c19ef39ae8b69693a844c4997528a875c4711ede5eef693013ce6f5e8cd9baf5b3abe855a836fa977ec8ba2259160846e4cec71a8a0cf3e309e87b7bf1901be95b32756114592797207c31808cb9aa1990aa1a1889840e908eb926dbea8fe7b4fce4e2d77bf3e3b63faea7529994fda62f19ec8a3620af941b13db0dcb8707af664cfd99464ea06a48424ab33d4900909706181bc30c3d6200f7511333dbe015128b5f79eb41baf4f815e37cef6f6361881a93489e634585eb4be1261900145840baa90e915cff6f0c65aedf4f48346fbc91388ac9d559b4a369651d7b1f03d1b00f15508a111e2788647c4fc69437f189f774e01b7f79eb5f790cece4a8c3a499de976c5c56c888adb98e2c619b973af6ddc6a1b1d423b9ea8721126524e50de704a84aaad21a1774947c8e4153ae8a4411a64f9f7bc22356c977207499ef61f5eb71ad783e0e488409436c057e8110dd19b0fc643f1a00fc8d846e0b659d410724331e9b7f0e99c9c3874ae53c97ca635c120a0fc3d1561a9b46944a5e46fd322d4e5b4046f4e8d84212471489ddfe43a4ad2b9d60d53766ab3cf2043453556205489528906c89c8e87e241a7dae8ea7890976daa08c17228cdc0938374cb617a912ac918ebb7c86f2570c2aa471596363704f5ad97b4bf853f7360451f1dc279c456d437c5a6149e755544374a3515572484894125416880fd566d577913ff073332343634405d4ccdc7e808c19bd9e2366fe25a59d17db5b8e2f0923ea38062684f8cdb5b07c3abe1826a4d298465ad6c02decc5a0bf4a18aec6178711d59f16d64a02895d6a5a698b0f5b74e05d0c645a1ac0f2ea495ecd87e2715c650f4bc92eb88928b917521c84074b354dcb436474e09d00a5158d25b31d09b55834c2d554f4a6e66461dafd2e583bd28784f19b5b205f19a05e1d4002171a372dd25a3c55bc09064fceb4f1db07e820872ca2707e32172a0159a51124a161e460070e13955b0289b082b199e1d6b26b87e5629f875b66125580a00b1aa6434730cf10ca587e13d2145b7d9a17e80909030b70341cac78bfe7313845e52298c6919ea2521b419033135948cee245c49d155a512cd27d96aab525a9b653141ed1c454b280e7c0435d5684aa23ca6e309340c04755ff0b94a80b760eab2108f6f6ae30fe4888edc3b5e56327d8ea4f88984a57f3626b17d8fb909b832ba9c35d8eff322fa4945925b9e18b94a279b1c1ac3089bea39009c50cf46755a321ec293ec3438d2c64afb22ae32cc649b2e731338a1013181140b662707b2c427d37dfbeab1f6a2eaa2083c36ff09ab6c45811b34b3d11c47b7a0edca17a517ed329275edb39566d966bf62b44009a4fd6750cf65252933ae27cf18850197a248d2b0df20034134269066ab14d3822c2629b7285d28c67116e78f924a84877baa2d7c6237d3cd2bb6705448b5861996cdf7faad06b65960675333890d09b9fe049b2e805372561425b6dbd93f8091800630d2220b23550f6821e10e32e92acc04d7f8a23bd2dbdc1ec4ab3559cbe4b8cac150ceb22c9b215d3fd8fb5568d61b7eb6c3958fad216e4b91b21918000480b47e49d5dec03a1084ebc687e822fc4202b501ca2d2f04fd69b4ea3dd28fd11986dd1884ca8ba3a465b1db15e55c07e5c2d9fb3d341a4f5623fcf813b53fc823df11bc7b6acc6bc6a23646d146722bd798cd04517e5287da89c8cbe3b9e141a55251adc668d96638327a1ea63995c649d4f111d9e069b985209e4c24e2e50df570dacdb087bc358cae9eb07bf0dd89da8a387e9388c7dcd4f617ed84e1b0c713414e630869b45f0e5834a4dfb5e412848a89384589708370fbbaa199ee9436275187b2bbd4820391be1b54ed400ab9953865189a68bf1b00b46ab4bb4c5229b5425c3220863efaa5a137ad44fded079a89da025018881baa1226426f06270d00b361e1c282f1ddde582624405cf2dfc0c3cc37021e58eb82509f4534a75c5bc964e224e56e0746015c61e81d19a6259dc5a782168c53b0f858e06270d4a49f1b15bd1622991f4890f6832f3744499cdea7cc6fcfe6ab64667ba11432ae99928c2ed5288e297723f31409a539b1266234faeebbb804823f3c0da38c293dade063117f08c920f323abc9a08b163a3ee6e9cb1b483b4f99a73bf8c3950f8b13be25aea5bfe1997c748d10f511d26ed09de82abeeb004923f38797931d5f5bd13dc57467cefad31125a793e0bbe24e37ae4f20ab66ea3bd34fad9a9b54036caf24f9b920a8528982b9f3f217482f5fee5cd1fe69e7a99ae58e2f0998fb3d66e32974a28eac61c76551c2bbbf79972b3e05303bbff8f5af7e69b5ef2bb55ffeeaf7bffec5ce8d2b607452effee6dfc76d353594902fcccacca844ed490cb0dcf09b07a06dbfafc194565c8800fdfdcbc73b7ff843654c0c21348cd47e66df20d568c50c4f79c5ff30019cd8e3b7ae5e7deffddffeee770e0f0d4cfcdd7ffcf6fdf7ae5ebdfad6e3712647a8182744ae45fa293237a2b27dff552542c51b00f1ead57f03bafa1e4025f4fefbefbda5fe13a10737ae8f1506e36ce8901b7e2722eacbe34a7a1c44e1fa8d07577de9adc75776c6e1633a460571d65fe5465a3173613cb1621c1777ae3c7ecb07e003f019ef8e7b4de686ab90fb7d2724facbd56275dcd244113cfc032f8c0f8853f40728084d7347d94c922627d11b7c96c741e4ae6310e3c6c7b71e10b7ffd21f2057a100465d7df2a22dfa94b3716bbc8cf0920079fc8028e45b48847d8fb5c0c6f76600481d403faba4c94996e337c6afe6ef5c7979fdfaf50f770026e0447afcd888dcfc1d0537a0bf45332f16da98088946dd7f45a27865e7fa750da33d32f5b73290f2d22f734e5a08b462fb568ad4f45546a1784383e840e8cb418e195a0eda8b72ad691cd9cf9350babe47cc08c59d1d1784375efafa1aae65fbcaceace3359a1ca762f2c98ebf4dfdf0ca87d7af5ba414626e5f7c9561d22a29fcf6fc00d2cb183ae1c16a7e1d23c50f6f985930e41b579efa3150e0fa8ecf24cdcfce20b91da928292dffd3909e7ea8268690273e2dfa66845c2b9f746c8d9e69e2eb20d7a34df94cc7d7379a16d7dff662138b73eb372fcf3ee6a6c9e378da8cafa806221050c9ed089a795a5224af83b0254bef4b084a0d724e01458a76c9773cb99fde4a44b517b04fc895814c3de371c2c40c169b7cc9e38c61958d01ba293d18d8487b1d39c7873bcf3a3cd59cc6d43c75f4d152a8e5254ea8b39e47942a11b5210627c7b9697c533ffd8c4f07f966a71360a3e97380fe34df740a478e83e097ef1992dbf5f9b0ac37c003df4f5aaecd6831c69b1c07f241c8a1f315bf9fe2f271603f12981e8b772fbb9cd548681e051a2b39a21ab0e67a1d4eda25ed08132cd60bc5f85fbe2a7ca988c7c71e10e71bd12039dcc536bce48eca58fc90507c1249c51da187879f7ef15f5fad78b9a1793b0bea8b6cb418d558f54884a6d65312f41bba7834e9678780f1f0f0bfbffad21de1dcb25f03a16e56f4d33a88a2903a1cffe5ff189d410194917c532e9eb80484280fffa242b4d9ea887bbc0290ae736b479a1fdc26a6e0de36ffe5575f1c26e25a77d0f8d620413de7f9f34b2a01c82f10226ffb98d58521e457f54faf6b71e371ec0be0c3e7f1cb1ac4cd31ca2894362d082fdd0788c040b6663d6ef6c210a29b52e55473587f045dfaecd2c7f1a5cbe500ca2818e759190811e2a7327b642b954cf949dcf008f1d5aa3f922ea5958f10dfa54b7f0284970d6574db7bae3130aeb7ba7d7cc92480f8dcd0745eb9201eaacf57db3ec851aef8b99e9fdd3afc84ccf11d4468404c944b2e7c145413e38210207ea41783f8dcb17231b694f82daded63857ce0525e58393cbcafcd315e068466bb25c168398a45fd34b7497fba648178eb93851562c2d8db6a30387f7f4810ea6d1fe4756fd7fe6c0054115210e30900593436dd17d5cfab7b2204881f9136b33590fd638c23e61fd3a01d5836be2385aa98f9cfc3c39fe8334cc42fdb2022c8cd78796963a98c47315ae0c5cbf1772eddb741fc738e8f2de7173053e3e75b2c5509e3474a726eb2bcfce9e1db6feb13fc5c457879233e9e1265b8cc8ef012fac5e5424d1d7cfe450c523165e984e626fbc5e1fd6b0e849445f522a2b14e849730bad15e21c4bbf3ad9602adc8fcaa35ebdebaf5e94fae19d3fbd840a8fb450ffec5375456bff3990d20f8c55bfa0e51887767d132eb4bebdbf65d471fddba74cd15e1e5a58437c2255d982f1dda114200f7893ef8163bcb562f57bacdda541f5ce135152191b63f51083dd99828eb176cc4ef3b7848ac8d3efc5d76de2eff88b555153ef9f46d0d2181f88e05e165bb6f501570c3bc20ee642181f8477dfce379bb8ba64d2dfe78eb3e00bcf60f225d4e8488d18e6f89fef3c72e2c241075ceadaccdd998da77551d82990122b6f43e3231be61837899ec77d2cc8b857f407f776521bc2c534ed7e7d26862d0ba4d29fe86664647488c861321e1e4d2527969c9f9a74feebb230426fecceb99f3a55b878485d7d49806ad863b420ffac8838508f193f14f9f03fdedd63faea9a44debfe4408ff6a03f836f5f367b7fe76d1e8805688a7a09808726ab7347e006f5965f427c6305663738164b2d090d3c3cf0303fcfbe1a11da06e95c9503f0026ae1c7e7aed9a03e25f8302bc6505a88f6388eae1ade992dfff074bc26e0d67388a210000000049454e44ae426082, 6),
(13, '22', 'weqeqw', 'wqeewq', 0, 'd41d8cd98f00b204e9800998ecf8427e', 2, '', 6),
(14, 'Usrtest', 'usuario', 'usuario', 0, 'f8032d5cae3de20fcec887f395ec9a6a', 1, '', 6),
(15, 'Juan', 'Juan', 'Perez', 0, 'a94652aa97c7211ba8954dd15a3cf838', 6, '', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_reparacion`
--

CREATE TABLE `solicitud_reparacion` (
  `id_solicitud` int(100) NOT NULL,
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
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `solicitud_reparacion`
--

INSERT INTO `solicitud_reparacion` (`id_solicitud`, `numero`, `id_tipo`, `nivel`, `solicitante`, `f_solicitado`, `f_sugerido`, `hora_sug`, `id_equipo`, `correctivo`, `causa`, `observaciones`, `estado`, `usrId`, `fecha_conformidad`, `observ_conformidad`, `foto1`, `foto2`, `foto3`, `foto`, `id_empresa`) VALUES
(1, NULL, NULL, NULL, 'Jose Perez', '2017-11-08 10:44:25', '2017-11-09', '08:00:00', 1, NULL, 'rotura de rueda', NULL, 'C', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(2, NULL, NULL, NULL, 'wqewqe', '2017-11-08 10:45:54', '2017-11-09', '08:00:00', 1, NULL, 'assdas', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(3, NULL, NULL, NULL, 'asdsadasd', '2017-11-08 10:46:39', '2017-11-09', '08:00:00', 1, NULL, 'asdad', NULL, 'S', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(4, NULL, NULL, NULL, 'sssss', '2017-11-08 10:47:21', '2017-11-09', '08:00:00', 1, NULL, 'sadasdas', NULL, 'T', 1, '2018-01-30', 'trabajo terminado', NULL, NULL, NULL, NULL, 5),
(5, NULL, NULL, NULL, 'huggo', '2017-11-08 12:53:19', '2017-11-09', '08:00:00', 1, NULL, 'observc test2', NULL, 'C', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(6, NULL, NULL, NULL, 'Hugo Gallardo', '2017-11-14 15:23:31', '2017-11-15', '08:00:00', 2, NULL, 'Rotura de llanta', NULL, 'C', 5, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(7, NULL, NULL, NULL, 'Hugo Gallardo', '2017-12-01 05:35:25', '2017-12-04', '08:00:00', 2, NULL, 'Falla test sobre RS-0001 (01-12)', NULL, 'C', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(8, NULL, NULL, NULL, 'hugo gallardo', '2018-01-13 21:54:50', '2018-01-14', '08:00:00', 2, NULL, 'rotura de equipo test', NULL, 'S', 5, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(9, NULL, NULL, NULL, 'juan perez', '2018-01-17 13:38:28', '2018-01-19', '08:00:00', 4, NULL, 'mancha de aceite abajo del equipo ', NULL, 'AN', 1, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(10, NULL, NULL, NULL, '1', '2018-01-18 18:05:53', '2018-01-18', '18:04:00', 8, NULL, 'ccg', '18:04', 'AN', 0, '2018-02-08', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(11, NULL, NULL, NULL, '1', '2018-01-18 18:07:20', '2018-01-18', '18:06:00', 6, NULL, 'mancha de aceite debajo del equipo', '18:06', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(12, NULL, NULL, NULL, '1', '2018-01-30 14:06:43', '2018-01-30', '14:03:00', 9, NULL, 'No tiene fuerza para levantar la carga', '14:03', 'AN', 0, '2018-02-08', 'ok\r\n', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(13, NULL, NULL, NULL, '3', '2018-02-05 19:01:38', '2018-02-05', '18:59:00', 9, NULL, 'bateria descargada\n\n', '18:59', '', 0, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(14, NULL, NULL, NULL, '1', '2018-02-05 19:42:17', '2018-02-07', '05:41:00', 9, NULL, 'fhjh', '05:41', 'AN', 0, '2018-02-08', 'Trabajo OK ', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(15, NULL, NULL, NULL, '1', '2018-02-05 19:46:36', '2018-02-17', '05:41:00', 6, NULL, 'ggggjffufjffg', '05:41', 'T', 0, '2018-04-11', 'TERMINADO CON EXITO', NULL, NULL, NULL, 'assets/files/reclamos/15.jpg', 5),
(16, NULL, NULL, NULL, '1', '2018-02-07 12:36:19', '2018-02-16', '12:35:00', 7, NULL, 'fff', '12:35', 'AN', 0, '2018-02-08', '', NULL, NULL, NULL, 'assets/files/reclamos/16.jpg', 5),
(17, NULL, NULL, NULL, '1', '2018-02-08 14:38:14', '2018-02-08', '14:35:00', 10, NULL, 'Ruido en cuerpo de bomba int 0057A', '14:35', 'T', 0, '2018-04-11', 'lista la solicitud', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(18, NULL, NULL, NULL, '1', '2018-02-08 14:46:00', '2018-02-08', '14:45:00', 6, NULL, 'Gets con desgaste excesivo', '14:45', 'C', 0, '2018-04-10', 'CONFORMIDAD', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(19, NULL, NULL, NULL, 'hugo gallardo cloud', '2018-04-11 12:56:39', '2018-04-12', '08:00:00', 10, NULL, 'solicitud de servicios prrueba coud', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(20, NULL, NULL, NULL, 'hugo de nuevo', '2018-04-11 13:15:16', '2018-04-13', '16:00:00', 10, NULL, 'sol de servicio test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(21, NULL, NULL, NULL, 'ssss', '2018-04-12 10:53:14', '2018-04-13', '08:00:00', 10, NULL, 'asdadasdas', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(22, NULL, NULL, NULL, 'ssss', '2018-04-12 10:57:40', '2018-04-13', '08:00:00', 10, NULL, 'zcxczx', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(23, NULL, NULL, NULL, 'hugo', '2018-06-18 17:19:46', '2018-06-19', '08:00:00', 10, NULL, 'falla de equipo prueba', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(24, NULL, NULL, NULL, 'hugo gallardo', '2018-06-18 17:22:00', '2018-06-19', '08:00:00', 10, NULL, 'fala en quipo testeado', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(25, NULL, NULL, NULL, 'hugo gallardo', '2018-06-18 17:36:20', '2018-06-19', '08:00:00', 10, NULL, 'fala en quipo testeado', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(26, NULL, NULL, NULL, 'hugo ggggg', '2018-06-18 17:38:17', '2018-06-19', '08:00:00', 10, NULL, 'fallaa test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(27, NULL, NULL, NULL, 'hugo g', '2018-06-19 11:09:05', '2018-06-20', '08:00:00', 4, NULL, 'falla test', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(28, NULL, NULL, NULL, 'hugo g', '2018-06-19 11:13:04', '2018-06-20', '08:00:00', 4, NULL, 'falla test 1', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, NULL, 5),
(29, NULL, NULL, NULL, 'hugo g', '2018-06-19 11:17:36', '2018-06-20', '08:00:00', 4, NULL, 'falla testing 1', NULL, 'T', 3, '2018-06-19', 'terminada conforme', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(30, NULL, NULL, NULL, 'hugo', '2018-06-21 09:41:58', '2018-06-22', '08:00:00', 4, NULL, 'falla testing solicitud', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(31, NULL, NULL, NULL, 'hugo', '2018-06-25 09:29:37', '2018-06-26', '08:00:00', 4, NULL, 'fala ttesting 25-06', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 5),
(32, NULL, NULL, NULL, 'hugo ggg', '2018-06-28 12:52:09', '2018-06-29', '08:00:00', 4, NULL, 'falla calendario ', NULL, 'S', 3, '0000-00-00', '', NULL, NULL, NULL, 'assets/files/orders/sinImagen.jpg', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `dire` varchar(3000) NOT NULL,
  `telefono` varchar(3000) NOT NULL,
  `zonas` varchar(3000) NOT NULL,
  `id_localidad` int(11) NOT NULL,
  `descripc` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `dire`, `telefono`, `zonas`, `id_localidad`, `descripc`) VALUES
(1, 'mmmm', '4253133', 'desamparados', 1, 'Casa central');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id_tarea` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id_tarea`, `descripcion`, `id_empresa`) VALUES
(4, 'LIMPIE EL CUERPO DEL RADIADOR. UTILICE AIRE COMPRIMIDO.', 6),
(5, 'REVISE LA BOMBA DE AGUA', 6),
(6, 'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE. SE PUEDE LIMPIAR COMO MÁXIMO 6 VECES, LUEGO CAMBIAR.', 6),
(7, 'CAMBIE EL FILTRO DE ADMISIÓN DE AIRE', 6),
(8, 'CAMBIE EL ACEITE DE MOTOR. ACEITE 15W40', 6),
(9, 'CAMBIE LOS FILTROS DE ACEITE.', 6),
(10, 'CAMBIE EL FILTRO DE COMBUSTIBLE DE MOTOR.', 6),
(12, 'LIMPIE EL DEPÓSITO DE COMBUSTIBLE.', 6),
(13, 'COMPRUEBE EL MOTOR DE ARRANQUE', 6),
(14, 'REVISE EL SENSOR DE TEMPERATURA.', 6),
(15, 'TOMAR MUESTRA DE ACEITE PARA ANÁLISIS DE LABORATORIO. USAR PROCEDIMIENTO PR0004EM', 6),
(16, 'REALIZAR ANÁLISIS DE TEMPERATURA. UTIIZAR CÁMARA TERMOMÉTRICA O PIRÓMETRO', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_back`
--

CREATE TABLE `tbl_back` (
  `backId` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `tarea_descrip` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `horash` int(11) DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `back_duracion` int(11) NOT NULL,
  `back_canth` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_back`
--

INSERT INTO `tbl_back` (`backId`, `id_equipo`, `tarea_descrip`, `fecha`, `horash`, `estado`, `back_duracion`, `back_canth`, `id_empresa`) VALUES
(16, 10, '4', '2018-04-27', NULL, 'AN', 60, 0, 6),
(17, 8, '10', '2018-04-29', NULL, 'AN', 120, 0, 6),
(18, 5, '10', '2018-05-02', NULL, 'AN', 20, 0, 6),
(19, 6, '6', '2018-05-04', NULL, 'AN', 15, 0, 6),
(20, 7, '8', '2018-05-02', NULL, 'AN', 50, 0, 6),
(21, 4, '4', '2018-05-11', NULL, 'AN', 20, 0, 6),
(22, 10, '5', '2018-05-01', NULL, 'AN', 30, 0, 6),
(23, 4, '5', '2018-05-31', NULL, 'AN', 80, 0, 6),
(24, 4, '5', '2018-05-06', NULL, 'C', 60, 0, 6),
(25, 11, '9', '2018-06-28', NULL, 'C', 60, 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detanotapedido`
--

CREATE TABLE `tbl_detanotapedido` (
  `id_detaNota` int(11) NOT NULL,
  `id_notaPedido` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `provid` int(11) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `fechaEntregado` date DEFAULT NULL,
  `remito` int(11) DEFAULT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(68, 63, 3, 34, 1, '2018-07-06', '2018-07-06', 1, 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detavaledescarga`
--

CREATE TABLE `tbl_detavaledescarga` (
  `detavaledid` int(11) NOT NULL,
  `valedid` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `observa` varchar(255) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detavalesalida`
--

CREATE TABLE `tbl_detavalesalida` (
  `detavid` int(10) NOT NULL,
  `valesid` int(11) DEFAULT NULL,
  `herrId` int(10) DEFAULT NULL,
  `observa` text,
  `dest` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_detavalesalida`
--

INSERT INTO `tbl_detavalesalida` (`detavid`, `valesid`, `herrId`, `observa`, `dest`) VALUES
(1, 1, 8, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 4, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estado`
--

CREATE TABLE `tbl_estado` (
  `estadoid` int(11) NOT NULL,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

CREATE TABLE `tbl_estanteria` (
  `id_estanteria` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fila` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_estanteria`
--

INSERT INTO `tbl_estanteria` (`id_estanteria`, `descripcion`, `fila`, `codigo`) VALUES
(1, 'estanteria 1', '1', 'dd1'),
(2, 'estanteria 2', '1', 'dd2'),
(3, 'estanteria 3', '1', 'dd3'),
(4, 'estanteria 4', '1', 'dd4'),
(5, 'estanteria 5', '1', 'd5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_listarea`
--

CREATE TABLE `tbl_listarea` (
  `id_listarea` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(87, 541, 'tarea ot 540', 2, '2018-06-30', 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_lote`
--

CREATE TABLE `tbl_lote` (
  `loteid` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `lotestado` char(4) DEFAULT NULL,
  `depositoid` int(11) DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_lote`
--

INSERT INTO `tbl_lote` (`loteid`, `codigo`, `fecha`, `cantidad`, `artId`, `lotestado`, `depositoid`, `usrId`) VALUES
(1, NULL, '2017-11-06', '45', 1, 'AC', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notapedido`
--

CREATE TABLE `tbl_notapedido` (
  `id_notaPedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_ordTrabajo` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(63, '2018-06-29', 541, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_preventivoherramientas`
--

CREATE TABLE `tbl_preventivoherramientas` (
  `id` int(11) NOT NULL,
  `prevId` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(79, 47, 1, 15, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_preventivoinsumos`
--

CREATE TABLE `tbl_preventivoinsumos` (
  `id` int(11) NOT NULL,
  `prevId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(56, 47, 1, 25, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipoordentrabajo`
--

CREATE TABLE `tbl_tipoordentrabajo` (
  `id` int(11) NOT NULL,
  `tipo_orden` int(11) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `tbl_trazacomponente` (
  `id_trazacomponente` int(11) NOT NULL,
  `idcomponenteequipo` int(11) NOT NULL,
  `id_estanteria` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fecha_Entrega` datetime DEFAULT NULL,
  `ult_recibe` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_trazacomponente`
--

INSERT INTO `tbl_trazacomponente` (`id_trazacomponente`, `idcomponenteequipo`, `id_estanteria`, `fila`, `fecha`, `fecha_Entrega`, `ult_recibe`, `estado`, `observaciones`, `usrId`) VALUES
(1, 71, 1, 2, '2017-10-05 07:29:05', '2017-10-05 07:31:25', 'Balderramo', 'E', 'se lleva balderrama para reparar bomba inyectora', 5),
(2, 72, 2, 3, '2017-10-05 07:29:05', '2017-10-05 07:29:05', 'Sr Perez', 'REC', 'recibo radiador para reparar', 5),
(3, 3, 1, 1, '2017-12-02 07:12:21', '2017-12-02 07:12:21', 'pedro perez', 'C', 'sadadsa', 1),
(4, 3, 1, 1, '2017-12-02 07:12:53', '2017-12-02 07:12:53', 'motores balderramo', 'C', 'dasdasd', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_unidadmedida`
--

CREATE TABLE `tbl_unidadmedida` (
  `id_unidadmedida` int(11) NOT NULL,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_unidadmedida`
--

INSERT INTO `tbl_unidadmedida` (`id_unidadmedida`, `descripcion`) VALUES
(1, 'Unidad'),
(2, 'Litro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_valedesacarga`
--

CREATE TABLE `tbl_valedesacarga` (
  `valedid` int(11) NOT NULL,
  `valedfecha` datetime DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_valesalida`
--

CREATE TABLE `tbl_valesalida` (
  `valesid` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `usrId` int(10) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_valesalida`
--

INSERT INTO `tbl_valesalida` (`valesid`, `fecha`, `usrId`, `respons`, `dest`) VALUES
(1, '2017-11-14', NULL, 'Roberto Pérez', 'Obra 1'),
(2, '2017-11-14', NULL, 'Francisco Rodriguez', 'Obra 2'),
(4, '2017-11-14', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_industrial`
--

CREATE TABLE `unidad_industrial` (
  `id_unidad` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `unidad_industrial`
--

INSERT INTO `unidad_industrial` (`id_unidad`, `descripcion`, `id_empresa`) VALUES
(1, 'veladero', 6),
(2, 'nueva unidad insdutrial 2', 6),
(3, 'La Laja', 0),
(4, 'La Laja', 0),
(5, 'unidad agregada 1', 6),
(6, 'unidad agregada 2', 6),
(7, 'unidad agregada 3', 6),
(8, 'unidad agregada 4', 6),
(9, 'unidad agregada 5', 6),
(10, 'unidadagregada 6', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_tiempo`
--

CREATE TABLE `unidad_tiempo` (
  `id_unidad` int(11) NOT NULL,
  `unidaddescrip` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidad_tiempo`
--

INSERT INTO `unidad_tiempo` (`id_unidad`, `unidaddescrip`) VALUES
(1, 'minutos'),
(2, 'horas'),
(3, 'dias');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abmdeposito`
--
ALTER TABLE `abmdeposito`
  ADD PRIMARY KEY (`depositoId`);

--
-- Indices de la tabla `abmproveedores`
--
ALTER TABLE `abmproveedores`
  ADD PRIMARY KEY (`provid`);

--
-- Indices de la tabla `admcustomers`
--
ALTER TABLE `admcustomers`
  ADD PRIMARY KEY (`cliId`);

--
-- Indices de la tabla `admstock`
--
ALTER TABLE `admstock`
  ADD PRIMARY KEY (`stkId`),
  ADD KEY `prodId` (`prodId`),
  ADD KEY `usrId` (`usrId`);

--
-- Indices de la tabla `admvisits`
--
ALTER TABLE `admvisits`
  ADD PRIMARY KEY (`vstId`),
  ADD KEY `cliId` (`cliId`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`artId`),
  ADD UNIQUE KEY `artBarCode` (`artBarCode`) USING BTREE,
  ADD UNIQUE KEY `artDescription` (`artDescription`) USING BTREE;

--
-- Indices de la tabla `asignaherramientas`
--
ALTER TABLE `asignaherramientas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `herrId` (`herrId`),
  ADD KEY `id_orden` (`id_orden`);

--
-- Indices de la tabla `asignausuario`
--
ALTER TABLE `asignausuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usrId` (`usrId`),
  ADD KEY `id_orden` (`id_orden`);

--
-- Indices de la tabla `componenteequipo`
--
ALTER TABLE `componenteequipo`
  ADD PRIMARY KEY (`idcomponenteequipo`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `marcaid` (`marcaid`);

--
-- Indices de la tabla `conffamily`
--
ALTER TABLE `conffamily`
  ADD PRIMARY KEY (`famId`);

--
-- Indices de la tabla `confsubfamily`
--
ALTER TABLE `confsubfamily`
  ADD PRIMARY KEY (`sfamId`),
  ADD KEY `famId` (`famId`);

--
-- Indices de la tabla `confzone`
--
ALTER TABLE `confzone`
  ADD PRIMARY KEY (`zonaId`);

--
-- Indices de la tabla `contratistaquipo`
--
ALTER TABLE `contratistaquipo`
  ADD PRIMARY KEY (`id_contratista`,`id_equipo`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `contratistas`
--
ALTER TABLE `contratistas`
  ADD PRIMARY KEY (`id_contratista`);

--
-- Indices de la tabla `criticidad`
--
ALTER TABLE `criticidad`
  ADD PRIMARY KEY (`id_criti`);

--
-- Indices de la tabla `deta-remito`
--
ALTER TABLE `deta-remito`
  ADD PRIMARY KEY (`detaremitoid`);

--
-- Indices de la tabla `deta_ordeninsumos`
--
ALTER TABLE `deta_ordeninsumos`
  ADD PRIMARY KEY (`id_detaordeninsumo`),
  ADD KEY `loteid` (`loteid`),
  ADD KEY `id_ordeninsumo` (`id_ordeninsumo`);

--
-- Indices de la tabla `deta_ordenservicio`
--
ALTER TABLE `deta_ordenservicio`
  ADD PRIMARY KEY (`id_detasercicio`),
  ADD KEY `id_ordenservicio` (`id_ordenservicio`),
  ADD KEY `id_componente` (`id_componente`),
  ADD KEY `deta_ordenservicio_ibfk_2` (`id_tarea`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envio`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_sector` (`id_sector`),
  ADD KEY `id_criticidad` (`id_criticidad`),
  ADD KEY `id_grupo` (`id_grupo`);

--
-- Indices de la tabla `fallas`
--
ALTER TABLE `fallas`
  ADD PRIMARY KEY (`id_reparacion`);

--
-- Indices de la tabla `ficha_equipo`
--
ALTER TABLE `ficha_equipo`
  ADD PRIMARY KEY (`id_fichaequip`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`herrId`),
  ADD UNIQUE KEY `1` (`herrcodigo`) USING BTREE,
  ADD KEY `depositoId` (`depositoId`);

--
-- Indices de la tabla `historial_lecturas`
--
ALTER TABLE `historial_lecturas`
  ADD PRIMARY KEY (`id_lectura`);

--
-- Indices de la tabla `infocomponentes`
--
ALTER TABLE `infocomponentes`
  ADD PRIMARY KEY (`infocompid`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `infoequipos`
--
ALTER TABLE `infoequipos`
  ADD PRIMARY KEY (`infoid`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `informacionequipo`
--
ALTER TABLE `informacionequipo`
  ADD PRIMARY KEY (`id_informacion`);

--
-- Indices de la tabla `marcasequipos`
--
ALTER TABLE `marcasequipos`
  ADD PRIMARY KEY (`marcaid`);

--
-- Indices de la tabla `modelo_año`
--
ALTER TABLE `modelo_año`
  ADD PRIMARY KEY (`id_año`);

--
-- Indices de la tabla `orden_insumos`
--
ALTER TABLE `orden_insumos`
  ADD PRIMARY KEY (`id_orden`);

--
-- Indices de la tabla `orden_pedido`
--
ALTER TABLE `orden_pedido`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_trabajo` (`id_trabajo`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_empresaservicio` (`id_contratista`),
  ADD KEY `id_solicitudreparacion` (`id_solicitudreparacion`),
  ADD KEY `id_orden_insumo` (`id_orden_insumo`);

--
-- Indices de la tabla `orden_trabajo`
--
ALTER TABLE `orden_trabajo`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `orden_trabajo_ibfk_1` (`cliId`) USING BTREE,
  ADD KEY `id_usuario` (`id_usuario`) USING BTREE,
  ADD KEY `id_usuariosolicitante` (`id_usuario_a`) USING BTREE,
  ADD KEY `usuario_entrega` (`id_usuario_e`) USING BTREE,
  ADD KEY `id_sucursal` (`id_sucursal`) USING BTREE;

--
-- Indices de la tabla `parametroequipo`
--
ALTER TABLE `parametroequipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `paramId` (`paramId`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`paramId`);

--
-- Indices de la tabla `predictivo`
--
ALTER TABLE `predictivo`
  ADD PRIMARY KEY (`predId`);

--
-- Indices de la tabla `preventivo`
--
ALTER TABLE `preventivo`
  ADD PRIMARY KEY (`prevId`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_tarea` (`id_tarea`),
  ADD KEY `id_componente` (`id_componente`);

--
-- Indices de la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD PRIMARY KEY (`id_proceso`);

--
-- Indices de la tabla `remitos`
--
ALTER TABLE `remitos`
  ADD PRIMARY KEY (`remitoId`),
  ADD KEY `provid` (`provid`);

--
-- Indices de la tabla `rubro`
--
ALTER TABLE `rubro`
  ADD PRIMARY KEY (`id_rubro`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id_sector`);

--
-- Indices de la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id_seguro`);

--
-- Indices de la tabla `setupparam`
--
ALTER TABLE `setupparam`
  ADD PRIMARY KEY (`id_parametro`,`id_equipo`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `sisactions`
--
ALTER TABLE `sisactions`
  ADD PRIMARY KEY (`actId`);

--
-- Indices de la tabla `sisgroups`
--
ALTER TABLE `sisgroups`
  ADD PRIMARY KEY (`grpId`);

--
-- Indices de la tabla `sisgroupsactions`
--
ALTER TABLE `sisgroupsactions`
  ADD PRIMARY KEY (`grpactId`),
  ADD KEY `grpId` (`grpId`) USING BTREE,
  ADD KEY `menuAccId` (`menuAccId`) USING BTREE;

--
-- Indices de la tabla `sismenu`
--
ALTER TABLE `sismenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indices de la tabla `sismenuactions`
--
ALTER TABLE `sismenuactions`
  ADD PRIMARY KEY (`menuAccId`);

--
-- Indices de la tabla `sisusers`
--
ALTER TABLE `sisusers`
  ADD PRIMARY KEY (`usrId`);

--
-- Indices de la tabla `solicitud_reparacion`
--
ALTER TABLE `solicitud_reparacion`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`);

--
-- Indices de la tabla `tbl_back`
--
ALTER TABLE `tbl_back`
  ADD PRIMARY KEY (`backId`);

--
-- Indices de la tabla `tbl_detanotapedido`
--
ALTER TABLE `tbl_detanotapedido`
  ADD PRIMARY KEY (`id_detaNota`),
  ADD KEY `id_notaPedido` (`id_notaPedido`);

--
-- Indices de la tabla `tbl_detavaledescarga`
--
ALTER TABLE `tbl_detavaledescarga`
  ADD PRIMARY KEY (`detavaledid`),
  ADD KEY `equipid` (`herrId`) USING BTREE,
  ADD KEY `valedid` (`valedid`) USING BTREE;

--
-- Indices de la tabla `tbl_detavalesalida`
--
ALTER TABLE `tbl_detavalesalida`
  ADD PRIMARY KEY (`detavid`),
  ADD KEY `equiid` (`herrId`) USING BTREE,
  ADD KEY `valesid` (`valesid`) USING BTREE;

--
-- Indices de la tabla `tbl_estado`
--
ALTER TABLE `tbl_estado`
  ADD PRIMARY KEY (`estadoid`);

--
-- Indices de la tabla `tbl_estanteria`
--
ALTER TABLE `tbl_estanteria`
  ADD PRIMARY KEY (`id_estanteria`);

--
-- Indices de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  ADD PRIMARY KEY (`id_listarea`);

--
-- Indices de la tabla `tbl_lote`
--
ALTER TABLE `tbl_lote`
  ADD PRIMARY KEY (`loteid`),
  ADD KEY `depositoid` (`depositoid`),
  ADD KEY `artId` (`artId`);

--
-- Indices de la tabla `tbl_notapedido`
--
ALTER TABLE `tbl_notapedido`
  ADD PRIMARY KEY (`id_notaPedido`);

--
-- Indices de la tabla `tbl_preventivoherramientas`
--
ALTER TABLE `tbl_preventivoherramientas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prevId` (`prevId`),
  ADD KEY `tbl_preventivoherramientas_ibfk_2` (`herrId`);

--
-- Indices de la tabla `tbl_preventivoinsumos`
--
ALTER TABLE `tbl_preventivoinsumos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prevId` (`prevId`),
  ADD KEY `artId` (`artId`);

--
-- Indices de la tabla `tbl_tipoordentrabajo`
--
ALTER TABLE `tbl_tipoordentrabajo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_trazacomponente`
--
ALTER TABLE `tbl_trazacomponente`
  ADD PRIMARY KEY (`id_trazacomponente`),
  ADD KEY `idcomponenteequipo` (`idcomponenteequipo`),
  ADD KEY `id_estanteria` (`id_estanteria`),
  ADD KEY `usrId` (`usrId`);

--
-- Indices de la tabla `tbl_unidadmedida`
--
ALTER TABLE `tbl_unidadmedida`
  ADD PRIMARY KEY (`id_unidadmedida`);

--
-- Indices de la tabla `tbl_valedesacarga`
--
ALTER TABLE `tbl_valedesacarga`
  ADD PRIMARY KEY (`valedid`),
  ADD KEY `usrId` (`usrId`);

--
-- Indices de la tabla `tbl_valesalida`
--
ALTER TABLE `tbl_valesalida`
  ADD PRIMARY KEY (`valesid`),
  ADD KEY `repid` (`usrId`) USING BTREE;

--
-- Indices de la tabla `unidad_industrial`
--
ALTER TABLE `unidad_industrial`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `unidad_tiempo`
--
ALTER TABLE `unidad_tiempo`
  ADD PRIMARY KEY (`id_unidad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abmdeposito`
--
ALTER TABLE `abmdeposito`
  MODIFY `depositoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `abmproveedores`
--
ALTER TABLE `abmproveedores`
  MODIFY `provid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `admcustomers`
--
ALTER TABLE `admcustomers`
  MODIFY `cliId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `admstock`
--
ALTER TABLE `admstock`
  MODIFY `stkId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `admvisits`
--
ALTER TABLE `admvisits`
  MODIFY `vstId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `articles`
--
ALTER TABLE `articles`
  MODIFY `artId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `asignaherramientas`
--
ALTER TABLE `asignaherramientas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `asignausuario`
--
ALTER TABLE `asignausuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `componenteequipo`
--
ALTER TABLE `componenteequipo`
  MODIFY `idcomponenteequipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `id_componente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `conffamily`
--
ALTER TABLE `conffamily`
  MODIFY `famId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `confsubfamily`
--
ALTER TABLE `confsubfamily`
  MODIFY `sfamId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `confzone`
--
ALTER TABLE `confzone`
  MODIFY `zonaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `contratistas`
--
ALTER TABLE `contratistas`
  MODIFY `id_contratista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `criticidad`
--
ALTER TABLE `criticidad`
  MODIFY `id_criti` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `deta-remito`
--
ALTER TABLE `deta-remito`
  MODIFY `detaremitoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `deta_ordeninsumos`
--
ALTER TABLE `deta_ordeninsumos`
  MODIFY `id_detaordeninsumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `deta_ordenservicio`
--
ALTER TABLE `deta_ordenservicio`
  MODIFY `id_detasercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id_envio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `fallas`
--
ALTER TABLE `fallas`
  MODIFY `id_reparacion` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ficha_equipo`
--
ALTER TABLE `ficha_equipo`
  MODIFY `id_fichaequip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  MODIFY `herrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT de la tabla `historial_lecturas`
--
ALTER TABLE `historial_lecturas`
  MODIFY `id_lectura` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `infocomponentes`
--
ALTER TABLE `infocomponentes`
  MODIFY `infocompid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `infoequipos`
--
ALTER TABLE `infoequipos`
  MODIFY `infoid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `informacionequipo`
--
ALTER TABLE `informacionequipo`
  MODIFY `id_informacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1084;
--
-- AUTO_INCREMENT de la tabla `marcasequipos`
--
ALTER TABLE `marcasequipos`
  MODIFY `marcaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `modelo_año`
--
ALTER TABLE `modelo_año`
  MODIFY `id_año` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `orden_insumos`
--
ALTER TABLE `orden_insumos`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `orden_pedido`
--
ALTER TABLE `orden_pedido`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `orden_trabajo`
--
ALTER TABLE `orden_trabajo`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=542;
--
-- AUTO_INCREMENT de la tabla `parametroequipo`
--
ALTER TABLE `parametroequipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `paramId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `predictivo`
--
ALTER TABLE `predictivo`
  MODIFY `predId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `preventivo`
--
ALTER TABLE `preventivo`
  MODIFY `prevId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT de la tabla `proceso`
--
ALTER TABLE `proceso`
  MODIFY `id_proceso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `remitos`
--
ALTER TABLE `remitos`
  MODIFY `remitoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rubro`
--
ALTER TABLE `rubro`
  MODIFY `id_rubro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `id_sector` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `seguro`
--
ALTER TABLE `seguro`
  MODIFY `id_seguro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT de la tabla `sisactions`
--
ALTER TABLE `sisactions`
  MODIFY `actId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `sisgroups`
--
ALTER TABLE `sisgroups`
  MODIFY `grpId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `sisgroupsactions`
--
ALTER TABLE `sisgroupsactions`
  MODIFY `grpactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=990;
--
-- AUTO_INCREMENT de la tabla `sismenu`
--
ALTER TABLE `sismenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT de la tabla `sismenuactions`
--
ALTER TABLE `sismenuactions`
  MODIFY `menuAccId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT de la tabla `sisusers`
--
ALTER TABLE `sisusers`
  MODIFY `usrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `solicitud_reparacion`
--
ALTER TABLE `solicitud_reparacion`
  MODIFY `id_solicitud` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `tbl_back`
--
ALTER TABLE `tbl_back`
  MODIFY `backId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `tbl_detanotapedido`
--
ALTER TABLE `tbl_detanotapedido`
  MODIFY `id_detaNota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT de la tabla `tbl_detavaledescarga`
--
ALTER TABLE `tbl_detavaledescarga`
  MODIFY `detavaledid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_detavalesalida`
--
ALTER TABLE `tbl_detavalesalida`
  MODIFY `detavid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tbl_estado`
--
ALTER TABLE `tbl_estado`
  MODIFY `estadoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tbl_estanteria`
--
ALTER TABLE `tbl_estanteria`
  MODIFY `id_estanteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  MODIFY `id_listarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT de la tabla `tbl_lote`
--
ALTER TABLE `tbl_lote`
  MODIFY `loteid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_notapedido`
--
ALTER TABLE `tbl_notapedido`
  MODIFY `id_notaPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT de la tabla `tbl_preventivoherramientas`
--
ALTER TABLE `tbl_preventivoherramientas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT de la tabla `tbl_preventivoinsumos`
--
ALTER TABLE `tbl_preventivoinsumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT de la tabla `tbl_tipoordentrabajo`
--
ALTER TABLE `tbl_tipoordentrabajo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tbl_trazacomponente`
--
ALTER TABLE `tbl_trazacomponente`
  MODIFY `id_trazacomponente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbl_unidadmedida`
--
ALTER TABLE `tbl_unidadmedida`
  MODIFY `id_unidadmedida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_valedesacarga`
--
ALTER TABLE `tbl_valedesacarga`
  MODIFY `valedid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_valesalida`
--
ALTER TABLE `tbl_valesalida`
  MODIFY `valesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `unidad_industrial`
--
ALTER TABLE `unidad_industrial`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `unidad_tiempo`
--
ALTER TABLE `unidad_tiempo`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
