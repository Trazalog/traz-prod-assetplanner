-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2019 a las 11:00:26
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
  `id_empresa` int(11) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `urgente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `solicitud_reparacion`
--
ALTER TABLE `solicitud_reparacion`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_equipo` (`id_equipo`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `solicitud_reparacion`
--
ALTER TABLE `solicitud_reparacion`
  MODIFY `id_solicitud` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
