-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2019 a las 14:58:12
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `programar_tareas_armado` (IN `formid` INT, IN `petrid` INT, IN `ordenid` INT)  NO SQL
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE nom VARCHAR(50);
DECLARE idtarea INT;
DECLARE tareas CURSOR FOR
           SELECT VALO_NOMBRE,id_tarea FROM frm_formularios_completados A JOIN tareas B ON A.VALO_NOMBRE=B.descripcion  WHERE form_id = formid and petr_id=petrid and valor="tilde" and descripcion IN (
			'850-LAVADO DE MOTOR DE 4 CILINDRO',
			'860-LAVADO DE MOTOR DE 5 CILINDRO',
			'870-LAVADO DE MOTOR DE 6 CILINDRO',
			'880-LAVADO DE MOTOR DE 8 CILINDRO',
			'881-LAVADO DE MOTOR DE 12 CILINDRO',
			'748-LAVADO DE TAPA DE CILINDRO',
			'750-GRANALLADO DE TAPA DE CILINDRO',
			'1014-SEMI-ARMADO MOTOR NAFTERO 4 CIL.',
			'1020-SEMI-ARMADO MOTOR NAFTERO 5 CIL.',
			'1022-SEMI-ARMADO MOTOR NAFTERO 6 CIL.',
			'1024-SEMI-ARMADO MOTOR NAFTERO 8 CIL.',
			'1054-SEMI-ARMADO MOTOR GASOLERO GR. 4 CIL.',								
			'1060-SEMI-ARMADO MOTOR GASOLERO GR. 5 CIL.',							
			'1062-SEMI-ARMADO MOTOR GASOLERO GR. 6 CIL.',
			'1064-SEMI-ARMADO MOTOR GASOLERO GR. 8 CIL.',
			'1065-SEMI-ARMADO MOTOR GASOLERO GR.12 CIL.',
			'1188-COLOCAR Y PROBAR MOTOR EN BANCO PRUEBA',
			'1191-MANO DE OBRA DESARME & EVALUACION',
			'2066-CONTROLAR Y CALIBRAR BOMBA INYECTORA',
			'2069-CONTROLAR Y CALIBRAR INYECTORES',
			'2075-CAMBIO DE PUNTA DE MANGA DIFERENCIAL',
			'2110-MANO DE OBRA DE SERVICIO EN CAMPO',
			'2110-TRASLADO PARA SERVICIO EN CAMPO',
			'2102-COLOCAR ESCANER PARA EXTRAER DATOS',
			'2045-REPARAR TURBO CAMION',
			'2050-REPARAR TURBO AUTOMOVIL',
			'2060-REPARAR TURBO MAQUINA INDUSTRIAL',
			'1074-ARMADO DE MOTOR NAFTERO 4 CIL.',
			'1080-ARMADO DE MOTOR NAFTERO 5 CIL.',
			'1082-ARMADO DE MOTOR NAFTERO 6 CIL.',
			'1084-ARMADO DE MOTOR NAFTERO 8 CIL.',
			'1094-ARMADO DE MOTOR GASOLERO CH. 4 CIL.',
			'1100-ARMADO DE MOTOR GASOLERO CH. 5 CIL.',
			'1102-ARMADO DE MOTOR GASOLERO CH. 6 CIL.',
			'1104-ARMADO DE MOTOR GASOLERO CH. 8 CIL.',
			'1114-ARMADO DE MOTOR GASOLERO GR. 4 CIL.',
			'1120-ARMADO DE MOTOR GASOLERO GR. 5 CIL.',
			'1122-ARMADO DE MOTOR GASOLERO GR. 6 CIL.',
			'1124-ARMADO DE MOTOR GASOLERO GR. 8 CIL.'
);  
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN tareas;


Iteracion: LOOP
    FETCH tareas INTO nom,idtarea;
    IF done = 1 THEN
      LEAVE Iteracion;
    END IF;
	INSERT INTO tbl_listarea (tareadescrip,id_tarea,id_orden) values(nom,idtarea,ordenid);

END LOOP Iteracion;

CLOSE tareas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `programar_tareas_reparacion` (IN `formid` INT, IN `petrid` INT, IN `ordenid` INT)  NO SQL
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE nom VARCHAR(50);
DECLARE idtarea INT;
DECLARE tareas CURSOR FOR
           SELECT VALO_NOMBRE,id_tarea FROM frm_formularios_completados A JOIN tareas B ON A.VALO_NOMBRE=B.descripcion  WHERE form_id = formid and petr_id=petrid and valor="tilde" and descripcion NOT IN (
			'850-LAVADO DE MOTOR DE 4 CILINDRO',
			'860-LAVADO DE MOTOR DE 5 CILINDRO',
			'870-LAVADO DE MOTOR DE 6 CILINDRO',
			'880-LAVADO DE MOTOR DE 8 CILINDRO',
			'881-LAVADO DE MOTOR DE 12 CILINDRO',
			'748-LAVADO DE TAPA DE CILINDRO',
			'750-GRANALLADO DE TAPA DE CILINDRO',
			'1014-SEMI-ARMADO MOTOR NAFTERO 4 CIL.',
			'1020-SEMI-ARMADO MOTOR NAFTERO 5 CIL.',
			'1022-SEMI-ARMADO MOTOR NAFTERO 6 CIL.',
			'1024-SEMI-ARMADO MOTOR NAFTERO 8 CIL.',
			'1054-SEMI-ARMADO MOTOR GASOLERO GR. 4 CIL.',								
			'1060-SEMI-ARMADO MOTOR GASOLERO GR. 5 CIL.',							
			'1062-SEMI-ARMADO MOTOR GASOLERO GR. 6 CIL.',
			'1064-SEMI-ARMADO MOTOR GASOLERO GR. 8 CIL.',
			'1065-SEMI-ARMADO MOTOR GASOLERO GR.12 CIL.',
			'1188-COLOCAR Y PROBAR MOTOR EN BANCO PRUEBA',
			'1191-MANO DE OBRA DESARME & EVALUACION',
			'2066-CONTROLAR Y CALIBRAR BOMBA INYECTORA',
			'2069-CONTROLAR Y CALIBRAR INYECTORES',
			'2075-CAMBIO DE PUNTA DE MANGA DIFERENCIAL',
			'2110-MANO DE OBRA DE SERVICIO EN CAMPO',
			'2110-TRASLADO PARA SERVICIO EN CAMPO',
			'2102-COLOCAR ESCANER PARA EXTRAER DATOS',
			'2045-REPARAR TURBO CAMION',
			'2050-REPARAR TURBO AUTOMOVIL',
			'2060-REPARAR TURBO MAQUINA INDUSTRIAL',
			'1074-ARMADO DE MOTOR NAFTERO 4 CIL.',
			'1080-ARMADO DE MOTOR NAFTERO 5 CIL.',
			'1082-ARMADO DE MOTOR NAFTERO 6 CIL.',
			'1084-ARMADO DE MOTOR NAFTERO 8 CIL.',
			'1094-ARMADO DE MOTOR GASOLERO CH. 4 CIL.',
			'1100-ARMADO DE MOTOR GASOLERO CH. 5 CIL.',
			'1102-ARMADO DE MOTOR GASOLERO CH. 6 CIL.',
			'1104-ARMADO DE MOTOR GASOLERO CH. 8 CIL.',
			'1114-ARMADO DE MOTOR GASOLERO GR. 4 CIL.',
			'1120-ARMADO DE MOTOR GASOLERO GR. 5 CIL.',
			'1122-ARMADO DE MOTOR GASOLERO GR. 6 CIL.',
			'1124-ARMADO DE MOTOR GASOLERO GR. 8 CIL.'
);  
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN tareas;


Iteracion: LOOP
    FETCH tareas INTO nom,idtarea;
    IF done = 1 THEN
      LEAVE Iteracion;
    END IF;
	INSERT INTO tbl_listarea (tareadescrip,id_tarea,id_orden) values(nom,idtarea,ordenid);

END LOOP Iteracion;

CLOSE tareas;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id_tarea` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `form_asoc` int(11) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id_tarea`, `descripcion`, `estado`, `id_empresa`, `form_asoc`, `visible`) VALUES
(214, 'Cambio de Guías Metálicas  de Viga ', 'AC', 7, NULL, 1),
(215, 'Cambio de Zapatas de Oruga ', 'AC', 7, NULL, 1),
(216, 'Retorqueo de Zapatas de Orugas ', 'AC', 7, NULL, 1),
(217, 'Recarga de Fluidos ', 'AC', 7, NULL, 1),
(218, 'Cambio de Baterías ', 'AC', 7, NULL, 1),
(219, 'Engrase de Equipo ', 'AC', 7, NULL, 1),
(220, 'Toma de Muestras ', 'AC', 7, NULL, 1),
(221, 'Ejecución de BKL ', 'AC', 7, NULL, 1),
(224, 'Inspección Perforadora 905 ', 'AC', 7, NULL, 1),
(225, 'Inspección Perforadora 906 ', 'AC', 7, NULL, 1),
(226, 'Regulación de Cmpresor ', 'AC', 7, NULL, 1),
(227, 'Reparación de Válvula UL-88 ', 'AC', 7, NULL, 1),
(228, 'Regulación de Intercambiador de Barras ', 'AC', 7, NULL, 1),
(229, 'Limpieza de Difusor de Grasa de Barras', 'AC', 7, NULL, 1),
(230, 'Limpieza de Mangon de Succión primario ', 'AC', 7, NULL, 1),
(231, 'Rectificacion de Motor naftero', 'AC', 6, 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
