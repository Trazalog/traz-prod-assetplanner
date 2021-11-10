CREATE DEFINER=`rootremote`@`%` PROCEDURE `asp2tecn`.`bulkload_articulos`(p_id_empresa int)
BEGIN
	DECLARE codigo_aux varchar(255);
	DECLARE descripcion_aux varchar(255);
	DECLARE u_medida_aux varchar(255);
	DECLARE done boolean DEFAULT FALSE;

	DECLARE cur_ar CURSOR FOR SELECT
						ltrim(rtrim(upper(ar.codigo))) codigo
						, ar.descripcion
						, ltrim(rtrim(upper( ar.u_medida))) u_medida
						FROM sta_articulos ar
						WHERE ar.procesado = 0;
 
					
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;                          
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
			GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
			@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
			SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
			
		    ROLLBACK;
			
		    DELETE FROM sta_articulos
 			WHERE procesado = 0;

 			SELECT concat('BULKAR:ERROR al cargar articulos: ',@full_error);

    END;
   
   		SET @@SQL_MODE = REPLACE(@@SQL_MODE, 'STRICT_TRANS_TABLES', '');
		SELECT 'BULKAR:Insertando registros';
		START TRANSACTION;
		open cur_ar;
		lp: loop

			fetch cur_ar into codigo_aux,descripcion_aux,u_medida_aux; 


			if done then
					SELECT 'BULKAR:No hay más registros';
                	leave lp;
    		end if;
			
    		SELECT CONCAT('BULKAR:Procesando registro ',codigo_aux,'-',descripcion_aux,'-',u_medida_aux); 

	
			INSERT
				INTO
				alm_articulos(barcode
				,descripcion
				,unidad_medida
				,empr_id)
				VALUES
				(codigo_aux,
				descripcion_aux,
				u_medida_aux,
			    p_id_empresa);
						
		end loop lp;
	
		CLOSE cur_ar;
		SELECT 'BULKAR:Registros cargados, marcando batch como procesado';

		UPDATE
			sta_articulos
		SET
			procesado = TRUE
			, fec_proceso = current_timestamp()
		WHERE
			procesado = FALSE;

		COMMIT;
		SELECT 'BULKAR:Carga bulk terminada exitosamente';
END