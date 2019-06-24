-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2019 a las 11:14:58
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planner_assetcloud_integracion`
--

DELIMITER $$
--
-- Procedimientos
--

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
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abmproveedores`
--

INSERT INTO `abmproveedores` (`provid`, `provnombre`, `provcuit`, `provdomicilio`, `provtelefono`, `provmail`, `provestado`, `estado`, `id_empresa`) VALUES
(1, 'Juan Perez', '2023339814', 'dsadasdasd', '2645677', 'permauricio@gmail.com', '8', 'AC', 6),
(2, 'Trazalog', '20-54545454-9', 'Lib. Gral S Martin 1890', '15555555', 'soporte@trazalog.com', '8', 'AC', 6),
(3, 'Proveedor test', '20-20202022-7', 'Calle proveedor', '1777777777', 'info@proveedor.com', '8', 'AN', 7),
(5, 'Leonardo Pantano Tornero', 'xxxxxx', 'San Juan', '2645053221', 'leonardo.pantano@gmail.com', '8', 'AC', 7),
(6, 'MRS Service ', 'a', 'a', 'a', 'm.rodriguez@mrsservice.com.ar ', NULL, 'AC', 7),
(7, 'conteiner mina chinchillas', '44', '44', '44', '44', NULL, 'AC', 7),
(8, 'Proveedor 1', '1111', 'domicilio 1', '11111', 'email1', NULL, 'AC', 8),
(9, 'n/a', '11111', 'aaaa', '111111', '3333', NULL, 'AC', 8),
(10, 'Finning CAT', '222222', 'domicilio 2', '22222222', 'sssssss', NULL, 'AC', 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abmproveedores`
--
ALTER TABLE `abmproveedores`
  ADD PRIMARY KEY (`provid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abmproveedores`
--
ALTER TABLE `abmproveedores`
  MODIFY `provid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
