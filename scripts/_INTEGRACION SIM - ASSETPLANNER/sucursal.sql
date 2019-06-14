-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2019 a las 17:05:50
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
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `dire` varchar(3000) NOT NULL,
  `telefono` varchar(3000) NOT NULL,
  `zonas` varchar(3000) NOT NULL,
  `id_localidad` int(11) NOT NULL,
  `descripc` varchar(3000) NOT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `dire`, `telefono`, `zonas`, `id_localidad`, `descripc`, `estado`, `id_empresa`) VALUES
(1, 'mmmm', '4253133', 'desamparados', 1, 'Casa central', 'AC', 6),
(2, 'algun lugar', '235040', 'capital', 2, 'sucursal de capital', 'AC', 6),
(3, '1', '1', '1', 1, 'Conteiner de Mina Chinchillas', 'AC', 7),
(4, '1', '1', '1', 1, 'Taller de General Guemes', 'AC', 7),
(5, 'Direccion 1', '1234', 'zona 1', 0, 'Sucursal 1', 'AC', 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
