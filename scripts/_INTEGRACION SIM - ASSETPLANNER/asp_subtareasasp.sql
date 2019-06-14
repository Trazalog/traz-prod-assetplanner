-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2019 a las 11:02:37
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planner_sim_fer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asp_detaplantillainsumos`
--

CREATE TABLE `asp_detaplantillainsumos` (
  `deta_id` int(11) NOT NULL,
  `artId` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asp_detaplantillainsumos`
--

INSERT INTO `asp_detaplantillainsumos` (`deta_id`, `artId`, `plant_id`) VALUES
(1, 2, 1),
(2, 10, 1),
(3, 1234, 8),
(4, 65878, 8),
(5, 0, 9),
(6, 0, 10),
(7, 1234132, 11),
(8, 2345, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asp_plantillainsumos`
--

CREATE TABLE `asp_plantillainsumos` (
  `plant_id` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `plant_nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asp_plantillainsumos`
--

INSERT INTO `asp_plantillainsumos` (`plant_id`, `descripcion`, `id_empresa`, `plant_nombre`, `estado`) VALUES
(1, 'descripcion plantilla1', 6, 'Plant-001', 'AC'),
(2, 'descrp palnt 1', 6, 'nom palt 1', 'AC'),
(3, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(4, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(5, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(6, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(7, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(8, 'descrp palnt 2', 6, 'nom palt 2', 'AC'),
(9, 'descripcion 4', 6, 'plant 4 prueba', 'AC'),
(10, 'descrp 5', 6, 'paltilla 5', 'AC'),
(11, 'etrtq', 6, '66666666', 'AC'),
(12, 'adsfa', 6, 'plant 7', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asp_subtareas`
--

CREATE TABLE `asp_subtareas` (
  `id_subtarea` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `duracion_prog` int(11) DEFAULT NULL,
  `form_asoc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asp_subtareas`
--

INSERT INTO `asp_subtareas` (`id_subtarea`, `id_orden`, `tareadescrip`, `id_tarea`, `estado`, `duracion_prog`, `form_asoc`) VALUES
(46, 0, 'Tarea 1', 231, '', NULL, 1000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asp_detaplantillainsumos`
--
ALTER TABLE `asp_detaplantillainsumos`
  ADD PRIMARY KEY (`deta_id`);

--
-- Indices de la tabla `asp_plantillainsumos`
--
ALTER TABLE `asp_plantillainsumos`
  ADD PRIMARY KEY (`plant_id`);

--
-- Indices de la tabla `asp_subtareas`
--
ALTER TABLE `asp_subtareas`
  ADD PRIMARY KEY (`id_subtarea`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asp_detaplantillainsumos`
--
ALTER TABLE `asp_detaplantillainsumos`
  MODIFY `deta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `asp_plantillainsumos`
--
ALTER TABLE `asp_plantillainsumos`
  MODIFY `plant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `asp_subtareas`
--
ALTER TABLE `asp_subtareas`
  MODIFY `id_subtarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
