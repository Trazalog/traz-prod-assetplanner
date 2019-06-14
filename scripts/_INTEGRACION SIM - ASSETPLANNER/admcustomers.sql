-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2019 a las 14:57:27
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planner_assetcloud_sim`
--

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
  `cliColor` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `cliRazonSocial` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `plant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `admcustomers`
--

INSERT INTO `admcustomers` (`cliId`, `cliName`, `cliLastName`, `cliDni`, `cliDateOfBirth`, `cliNroCustomer`, `cliAddress`, `cliPhone`, `cliMovil`, `cliEmail`, `cliImagePath`, `zonaId`, `cliDay`, `cliColor`, `estado`, `id_empresa`, `cliRazonSocial`, `plant_id`) VALUES
(13, 'Daniel', 'Osvaldo', '31324200', '1984-05-01', '1', 'Av La Humareda 12', '', '', '', '13.png', 10, 30, '#00a65a', 'AC', 6, 'Dani Osvaldo', NULL),
(14, 'Mariana', 'Romero', '31324205', '2016-05-04', '14', 'Av. Simpre Viva 123', '', '', '', '14.png', 11, 15, '#f39c12', 'AC', 6, 'MRomero', NULL),
(15, 'Patricia', 'Moreno', '45632145', '2016-05-19', '15', 'Rogelio Funes Mori y No Fue Corner', '', '', '', '15.png', 10, 10, '#dd4b39', 'AC', 6, 'Pato Moreno', NULL),
(16, 'Homero', 'Perez', '45888882', '2000-05-10', '16', 'Rivadavia 124s', '', '', '', '16.png', 12, 20, '#00a65a', 'AC', 6, 'Homero''s', NULL),
(17, 'Mauricio', 'perez', '23339814', '2016-06-01', '17', 'dd', '26465', '026457070785', 'permaucirio@gmail.com', '17.png', 10, 30, '#00a65a', 'AC', 6, 'Master of ', NULL),
(18, 'asAS', 'ASas', 'ss', '2016-12-16', '18', 'sASAs', 'sss', 's333', 'permauricio23', '18.png', 10, 30, '#00a65a', 'AN', 6, 'ASSAs', NULL),
(19, 'eliana', NULL, '1234', NULL, NULL, 'san lorenzo 1442 este, santa lucia', '02644510131', NULL, 'eli', NULL, NULL, 30, NULL, 'AN', 6, 'nose', NULL),
(20, 'Mina Chinchilla', 'Mina chinchilla', '02333981', NULL, NULL, '-', '-', NULL, '-', NULL, NULL, 30, NULL, 'AC', 7, 'Mina Chinchilla', NULL),
(21, 'Hugo Cliente', NULL, '11111111', NULL, NULL, 'calle 13', '15555555', NULL, 'hugo@trazalog.com', NULL, NULL, 30, NULL, 'AC', 6, 'hugpo s.a.', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admcustomers`
--
ALTER TABLE `admcustomers`
  ADD PRIMARY KEY (`cliId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admcustomers`
--
ALTER TABLE `admcustomers`
  MODIFY `cliId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
