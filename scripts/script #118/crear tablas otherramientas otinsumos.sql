-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2019 a las 13:55:09
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planner_assetcloudtest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_otherramientas`
--

CREATE TABLE `tbl_otherramientas` (
  `id` int(11) NOT NULL,
  `otId` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_otinsumos`
--

CREATE TABLE `tbl_otinsumos` (
  `id` int(11) NOT NULL,
  `otId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_otherramientas`
--
ALTER TABLE `tbl_otherramientas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_otinsumos`
--
ALTER TABLE `tbl_otinsumos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_otherramientas`
--
ALTER TABLE `tbl_otherramientas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_otinsumos`
--
ALTER TABLE `tbl_otinsumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
