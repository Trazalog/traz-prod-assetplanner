-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2019 a las 17:22:39
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
-- Estructura de tabla para la tabla `tbl_listarea`
--

CREATE TABLE `tbl_listarea` (
  `id_listarea` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `info_id` int(11) DEFAULT NULL,
  `id_subtarea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_listarea`
--

INSERT INTO `tbl_listarea` (`id_listarea`, `id_orden`, `tareadescrip`, `id_usuario`, `fecha`, `estado`, `info_id`, `id_subtarea`) VALUES
(61, 53, 'Tarea 1', 101, '2019-04-08', 'C', 19, 46),
(62, 53, 'Tarea 1', 101, '2019-04-08', 'C', 21, 46);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  ADD PRIMARY KEY (`id_listarea`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_listarea`
--
ALTER TABLE `tbl_listarea`
  MODIFY `id_listarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
