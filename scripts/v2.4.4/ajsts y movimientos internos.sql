-- agrandar campo justificacion en tbl ajustes
ALTER TABLE assetv2.ajustes MODIFY COLUMN justificacion varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
-- no null empr_id en deta
ALTER TABLE assetv2.deta_ajustes MODIFY COLUMN empr_id int(11) NULL;

ALTER TABLE assetv2.alm_deta_movimientos_internos MODIFY COLUMN usuario varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'hugoDS' NOT NULL;
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












