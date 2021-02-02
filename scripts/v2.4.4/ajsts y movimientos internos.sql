-- agrandar campo justificacion en tbl ajustes
ALTER TABLE assetv2.ajustes MODIFY COLUMN justificacion varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
-- no null empr_id en deta
ALTER TABLE assetv2.deta_ajustes MODIFY COLUMN empr_id int(11) NULL;

-- TABLA MOVIMIENTOS INTERNOS
CREATE TABLE `alm_movimientos_internos` (
  `moin_id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) NOT NULL,
  `num_comprobante` varchar(100) DEFAULT NULL,
  `fec_envio` datetime NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  `patente` varchar(100) DEFAULT NULL,
  `acoplado` varchar(100) DEFAULT NULL,
  `conductor` varchar(100) DEFAULT NULL,
  `fec_recepcion` date DEFAULT NULL,
  `observaciones_recepcion` varchar(100) DEFAULT NULL,
  `fec_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(100) NOT NULL,
  `usuario_app` varchar(100) NOT NULL,
  `depo_id_origen` int(11) NOT NULL,
  `depo_id_destino` int(11) NOT NULL,
  `empr_id` int(11) NOT NULL,
  PRIMARY KEY (`moin_id`),
  KEY `alm_movimientos_internos_depo_id_origen_FK` (`depo_id_origen`),
  KEY `alm_movimientos_internos_depo_id_destino_FK` (`depo_id_destino`),
  CONSTRAINT `alm_movimientos_internos_depo_id_destino_FK` FOREIGN KEY (`depo_id_destino`) REFERENCES `alm_depositos` (`depo_id`),
  CONSTRAINT `alm_movimientos_internos_depo_id_origen_FK` FOREIGN KEY (`depo_id_origen`) REFERENCES `alm_depositos` (`depo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8

-- DETA MOVIMIETOS INTERNOS
CREATE TABLE `alm_deta_movimientos_internos` (
  `demi_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `cantidad_cargada` float NOT NULL,
  `cantidad_recibida` float DEFAULT NULL,
  `fec_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(100) DEFAULT 'hugoDS',
  `usuario_app` varchar(100) DEFAULT NULL,
  `moin_id` int(11) NOT NULL,
  `arti_id` int(11) DEFAULT NULL,
  `lote_id_origen` int(11) DEFAULT NULL,
  `lote_id_destino` int(11) DEFAULT NULL,
  PRIMARY KEY (`demi_id`),
  KEY `alm_deta_movimientos_internos_FK` (`moin_id`),
  KEY `alm_deta_movimientos_internos_FK_1` (`arti_id`),
  KEY `alm_deta_movimientos_internos_lote_id_destino_FK` (`lote_id_destino`),
  KEY `alm_deta_movimientos_internos_lote_id_origen_FK` (`lote_id_origen`),
  CONSTRAINT `alm_deta_movimientos_internos_FK` FOREIGN KEY (`moin_id`) REFERENCES `alm_movimientos_internos` (`moin_id`),
  CONSTRAINT `alm_deta_movimientos_internos_FK_1` FOREIGN KEY (`arti_id`) REFERENCES `alm_articulos` (`arti_id`),
  CONSTRAINT `alm_deta_movimientos_internos_lote_id_destino_FK` FOREIGN KEY (`lote_id_destino`) REFERENCES `alm_lotes` (`lote_id`),
  CONSTRAINT `alm_deta_movimientos_internos_lote_id_origen_FK` FOREIGN KEY (`lote_id_origen`) REFERENCES `alm_lotes` (`lote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8


ALTER TABLE assetv2.alm_deta_movimientos_internos MODIFY COLUMN usuario varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'current_user()' NOT NULL;
-- cambio en campo fecha formato
ALTER TABLE assetv2.alm_movimientos_internos MODIFY COLUMN fec_recepcion DATE NULL;


/* ajuste_detallle_ingresar */

CREATE DEFINER=`rootremote`@`%` PROCEDURE `assetv2`.`ajuste_detalle_ingresar`(p_ajus_id INT,  p_lote_id INT,  p_cantidad float8)
begin
declare	v_deaj_id INT;
declare v_empr_id INT;

	    select empr_id 
		into  v_empr_id
		from ajustes
		where ajus_id = p_ajus_id;
		     

		insert into deta_ajustes (
			   cantidad
	          ,empr_id
	          ,lote_id
	          ,ajus_id)
		values (
			p_cantidad
		    ,v_empr_id
		    ,p_lote_id
		    ,p_ajus_id);
		

		   
		update alm_lotes
		set cantidad = cantidad + p_cantidad
		where lote_id = p_lote_id;


end

/* SPLIT_PART */

CREATE DEFINER=`rootremote`@`%` FUNCTION `assetv2`.`SPLIT_PART`(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
) RETURNS varchar(255) CHARSET latin1
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '')












