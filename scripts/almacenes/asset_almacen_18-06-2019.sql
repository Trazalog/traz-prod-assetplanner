-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2019 a las 19:21:48
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asset_almacen_v3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_articulos`
--

CREATE TABLE `alm_articulos` (
  `arti_id` int(11) NOT NULL,
  `barcode` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `costo` decimal(14,2) NOT NULL,
  `es_caja` tinyint(4) NOT NULL,
  `cantidad_caja` int(11) DEFAULT NULL,
  `punto_pedido` int(11) DEFAULT NULL,
  `estado_id` varchar(45) COLLATE utf8_spanish_ci DEFAULT '1',
  `unidad_id` int(11) NOT NULL,
  `empr_id` int(11) NOT NULL,
  `es_loteado` tinyint(4) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alm_articulos`
--

INSERT INTO `alm_articulos` (`arti_id`, `barcode`, `descripcion`, `costo`, `es_caja`, `cantidad_caja`, `punto_pedido`, `estado_id`, `unidad_id`, `empr_id`, `es_loteado`, `fec_alta`, `eliminado`) VALUES
(1, 'AAA_111_EMP6', 'duplicado', '0.00', 0, 0, 200, '1', 22, 6, 0, '2019-06-13 11:48:57', 0),
(35, 'AAA_111', 'Descripcion A', '0.00', 1, 10, 111, '1', 21, 1, 1, '2019-04-23 18:26:07', 0),
(36, 'BBB_222', 'Descripcion B', '0.00', 0, 0, 222, '1', 21, 1, 1, '2019-04-23 18:29:26', 0),
(37, 'CCC_333', 'Descripcion C', '0.00', 0, 0, 333, '1', 21, 1, 1, '2019-04-23 18:30:04', 0),
(38, '7790463000114', 'Ceramicol', '0.00', 1, 6, 100, '1', 22, 1, 0, '2019-05-24 00:56:58', 0),
(39, 'AAA_111_EMP6', 'Descripcion A', '0.00', 0, 0, 100, '1', 22, 6, 1, '2019-06-04 18:43:52', 1),
(40, 'BBB_222_EMP6', 'Descripcion B', '0.00', 0, 0, 200, '1', 22, 6, 1, '2019-06-04 18:44:19', 0),
(41, 'CCC_333_EMP6', 'Descripcion C', '0.00', 1, 10, 300, '1', 22, 6, 0, '2019-06-04 18:45:18', 0),
(42, 'ART_TEST', 'Descripcion Test', '0.00', 0, 0, 500, '1', 22, 6, 1, '2019-06-06 15:44:55', 0),
(43, 'AAA_111_EMP6', 'articulo duplicado', '0.00', 0, 0, 200, '1', 21, 6, 0, '2019-06-13 11:44:20', 1),
(44, 'ebernal', 'soy muy pitifuz', '0.00', 1, 10, 100, '1', 21, 6, 1, '2019-06-18 11:36:24', 0),
(45, 'fleiva', 'Descripcion A', '0.00', 0, 0, 555, '1', 22, 6, 1, '2019-06-18 11:51:54', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_depositos`
--

CREATE TABLE `alm_depositos` (
  `depo_id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `GPS` varchar(255) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `loca_id` varchar(255) DEFAULT NULL,
  `esta_id` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_deta_entrega_materiales`
--

CREATE TABLE `alm_deta_entrega_materiales` (
  `deen_id` int(11) NOT NULL,
  `enma_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `arti_id` int(11) NOT NULL,
  `prov_id` int(10) DEFAULT NULL,
  `lote_id` int(11) NOT NULL,
  `depo_id` int(11) DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `precio` double DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_deta_pedidos_materiales`
--

CREATE TABLE `alm_deta_pedidos_materiales` (
  `depe_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `resto` int(11) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_entregado` date DEFAULT NULL,
  `pema_id` int(11) NOT NULL,
  `arti_id` int(11) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_deta_recepcion_materiales`
--

CREATE TABLE `alm_deta_recepcion_materiales` (
  `dere_id` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `empr_id` int(11) NOT NULL,
  `rema_id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL,
  `prov_id` int(10) NOT NULL,
  `arti_id` int(11) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_entrega_materiales`
--

CREATE TABLE `alm_entrega_materiales` (
  `enma_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `solicitante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comprobante` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `pema_id` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_lotes`
--

CREATE TABLE `alm_lotes` (
  `lote_id` int(11) NOT NULL,
  `prov_id` int(10) NOT NULL,
  `arti_id` int(11) NOT NULL,
  `depo_id` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `fec_vencimiento` date DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_pedidos_extraordinario`
--

CREATE TABLE `alm_pedidos_extraordinario` (
  `peex_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `detalle` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `motivo_rechazo` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `pema_id` int(11) DEFAULT NULL,
  `ortr_id` int(11) DEFAULT NULL,
  `empr_id` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_pedidos_materiales`
--

CREATE TABLE `alm_pedidos_materiales` (
  `pema_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `motivo_rechazo` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `ortr_id` int(11) DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci DEFAULT 'Solicitado',
  `justificacion` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empr_id` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_proveedores`
--

CREATE TABLE `alm_proveedores` (
  `prov_id` int(10) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `cuit` varchar(50) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alm_proveedores`
--

INSERT INTO `alm_proveedores` (`prov_id`, `nombre`, `cuit`, `domicilio`, `telefono`, `email`, `empr_id`, `fec_alta`, `eliminado`) VALUES
(1, 'Proveedor A', '111', '-', '-', '-', 6, '2019-04-23 18:44:14', 0),
(2, 'Proveedor B', '222', '-', '-', '-', 1, '2019-06-05 22:24:05', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_proveedores_articulos`
--

CREATE TABLE `alm_proveedores_articulos` (
  `prov_id` int(10) NOT NULL,
  `arti_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alm_proveedores_articulos`
--

INSERT INTO `alm_proveedores_articulos` (`prov_id`, `arti_id`) VALUES
(1, 35),
(1, 36),
(1, 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alm_recepcion_materiales`
--

CREATE TABLE `alm_recepcion_materiales` (
  `rema_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `empr_id` int(11) NOT NULL,
  `prov_id` int(10) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utl_tablas`
--

CREATE TABLE `utl_tablas` (
  `tabl_id` int(11) NOT NULL,
  `tabla` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `valor` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Volcado de datos para la tabla `utl_tablas`
--

INSERT INTO `utl_tablas` (`tabl_id`, `tabla`, `valor`, `descripcion`, `fec_alta`, `eliminado`) VALUES
(1, 'estado', 'AC', 'ACTIVO', '2019-04-23 18:28:29', 0),
(21, 'unidad', 'KM', 'KILOMETROS', '2019-04-23 18:25:47', 0),
(22, 'unidad', 'UN', 'UNIDAD', '2019-05-24 00:56:16', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alm_articulos`
--
ALTER TABLE `alm_articulos`
  ADD PRIMARY KEY (`arti_id`);

--
-- Indices de la tabla `alm_depositos`
--
ALTER TABLE `alm_depositos`
  ADD PRIMARY KEY (`depo_id`);

--
-- Indices de la tabla `alm_deta_entrega_materiales`
--
ALTER TABLE `alm_deta_entrega_materiales`
  ADD PRIMARY KEY (`deen_id`);

--
-- Indices de la tabla `alm_deta_pedidos_materiales`
--
ALTER TABLE `alm_deta_pedidos_materiales`
  ADD PRIMARY KEY (`depe_id`);

--
-- Indices de la tabla `alm_deta_recepcion_materiales`
--
ALTER TABLE `alm_deta_recepcion_materiales`
  ADD PRIMARY KEY (`dere_id`);

--
-- Indices de la tabla `alm_entrega_materiales`
--
ALTER TABLE `alm_entrega_materiales`
  ADD PRIMARY KEY (`enma_id`);

--
-- Indices de la tabla `alm_lotes`
--
ALTER TABLE `alm_lotes`
  ADD PRIMARY KEY (`lote_id`,`prov_id`,`arti_id`,`depo_id`);

--
-- Indices de la tabla `alm_pedidos_extraordinario`
--
ALTER TABLE `alm_pedidos_extraordinario`
  ADD PRIMARY KEY (`peex_id`);

--
-- Indices de la tabla `alm_pedidos_materiales`
--
ALTER TABLE `alm_pedidos_materiales`
  ADD PRIMARY KEY (`pema_id`);

--
-- Indices de la tabla `alm_proveedores`
--
ALTER TABLE `alm_proveedores`
  ADD PRIMARY KEY (`prov_id`);

--
-- Indices de la tabla `alm_proveedores_articulos`
--
ALTER TABLE `alm_proveedores_articulos`
  ADD PRIMARY KEY (`prov_id`,`arti_id`);

--
-- Indices de la tabla `alm_recepcion_materiales`
--
ALTER TABLE `alm_recepcion_materiales`
  ADD PRIMARY KEY (`rema_id`),
  ADD UNIQUE KEY `comprobante_UNIQUE` (`comprobante`);

--
-- Indices de la tabla `utl_tablas`
--
ALTER TABLE `utl_tablas`
  ADD PRIMARY KEY (`tabl_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alm_articulos`
--
ALTER TABLE `alm_articulos`
  MODIFY `arti_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `alm_depositos`
--
ALTER TABLE `alm_depositos`
  MODIFY `depo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alm_deta_entrega_materiales`
--
ALTER TABLE `alm_deta_entrega_materiales`
  MODIFY `deen_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alm_deta_pedidos_materiales`
--
ALTER TABLE `alm_deta_pedidos_materiales`
  MODIFY `depe_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alm_deta_recepcion_materiales`
--
ALTER TABLE `alm_deta_recepcion_materiales`
  MODIFY `dere_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alm_entrega_materiales`
--
ALTER TABLE `alm_entrega_materiales`
  MODIFY `enma_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alm_lotes`
--
ALTER TABLE `alm_lotes`
  MODIFY `lote_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alm_pedidos_extraordinario`
--
ALTER TABLE `alm_pedidos_extraordinario`
  MODIFY `peex_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alm_pedidos_materiales`
--
ALTER TABLE `alm_pedidos_materiales`
  MODIFY `pema_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alm_proveedores`
--
ALTER TABLE `alm_proveedores`
  MODIFY `prov_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `alm_recepcion_materiales`
--
ALTER TABLE `alm_recepcion_materiales`
  MODIFY `rema_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `utl_tablas`
--
ALTER TABLE `utl_tablas`
  MODIFY `tabl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
