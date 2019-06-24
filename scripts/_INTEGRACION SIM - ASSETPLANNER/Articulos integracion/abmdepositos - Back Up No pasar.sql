-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2019 a las 11:03:00
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24


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
  `GPS` varchar(255) DEFAULT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(8, 'Deposito 3', 'san lorenzo 1442 este, santa lucia', NULL, NULL, NULL, NULL, 'AC', 6),
(9, 'Asistencia Técnica ', 'MRS SERVICE ', NULL, NULL, NULL, NULL, 'AC', 7),
(10, 'DEPOSITO 1', 'DIRECCION 1', NULL, NULL, NULL, NULL, 'AN', 6),
(11, 'Deposito CSJ', 'aaaaa', NULL, NULL, NULL, NULL, 'AC', 6),
(12, 'Deposito 1', 'aaaaaa', NULL, NULL, NULL, NULL, 'AC', 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abmdeposito`
--
ALTER TABLE `abmdeposito`
  ADD PRIMARY KEY (`depositoId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abmdeposito`
--
ALTER TABLE `abmdeposito`
  MODIFY `depositoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
