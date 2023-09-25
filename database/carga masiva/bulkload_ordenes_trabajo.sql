CREATE DEFINER=`rootremote`@`%` PROCEDURE `assetv2`.`bulkload_ordenes_trabajo`(p_id_empresa int)
BEGIN
	DECLARE id_orden_aux varchar(255);
	DECLARE fecha_program_aux varchar(255);
	DECLARE fecha_inicio_aux varchar(255);
	DECLARE fecha_terminada_aux varchar(255);
	DECLARE descripcion_aux varchar(255);
	DECLARE estado_aux varchar(255);
	DECLARE nick_usuario_a_aux varchar(255);
	DECLARE id_usuario_a_aux int;
	DECLARE cod_equipo_aux varchar(255);
	DECLARE id_equipo_aux int;
	DECLARE done INT DEFAULT FALSE;

	DECLARE cur_ots CURSOR FOR SELECT id_orden
								,fecha_program
								,fecha_inicio
								,fecha_terminada
								,descripcion
								,estado
								,nick_usuario_a
								,cod_equipo
                               from sta_orden_trabajo sot
			      			   WHERE sot.procesado = 0;
 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;                          
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
			GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
			@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
			SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);

		    ROLLBACK;
			
		    DELETE FROM sta_orden_trabajo 
 			WHERE procesado = 0;

 			SELECT CONCAT('BULKOT:ERROR al cargar OTs: ',@full_error);

    END;
  
		SELECT 'BULKOT:Insertando registros';
   		SET @@SQL_MODE = REPLACE(@@SQL_MODE, 'STRICT_TRANS_TABLES', '');
		START TRANSACTION;
		open cur_ots;
		lp: loop
			fetch cur_ots into id_orden_aux,fecha_program_aux, fecha_inicio_aux, fecha_terminada_aux
							   , descripcion_aux, estado_aux, nick_usuario_a_aux, cod_equipo_aux; 


			if done then
					SELECT 'BULKOT:No hay más registros';
                	leave lp;
    		end if;
			
    		SELECT CONCAT('BULKOT:Procesando registro equipo, desc, estado, user ',cod_equipo_aux,descripcion_aux, estado_aux ,nick_usuario_a_aux);


    		BEGIN
				DECLARE EXIT HANDLER FOR NOT FOUND
				BEGIN
						GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
						@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
						SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);															
			 			SELECT concat('BULKOT:ERROR al traducir datos de equipos: ',@full_error);
			 			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hay datos que no pueden ser traducidos, abortando...';
			    END;

				select eq.id_equipo 
				into id_equipo_aux
				from equipos eq 
				where codigo = cod_equipo_aux
				and eq.id_empresa = p_id_empresa;
	
	
				select s.usrId
				into id_usuario_a_aux 
				from sisusers s				 
				where s.usrNick = nick_usuario_a_aux
			    limit 1;

			end;
		
			SELECT CONCAT('BULKOT:Datos traducidos equipo y user_a ',id_equipo_aux,id_usuario_a_aux);

			INSERT
				INTO
				orden_trabajo (
				nro,
				fecha,
				fecha_program,
				fecha_inicio,
				fecha_terminada,
				descripcion,
				estado,
				id_usuario,
				id_usuario_a,
				id_usuario_e,
				id_proveedor,
				id_solicitud,
				tipo,
				id_equipo,
				id_empresa )
			VALUES(
			    id_orden_aux,
				current_timestamp,
				str_to_date(fecha_program_aux,'%d-%m-%Y %H:%i'),
				str_to_date(fecha_inicio_aux,'%d-%m-%Y %H:%i'),
				str_to_date(fecha_terminada_aux,'%d-%m-%Y %H:%i'),
				descripcion_aux,
				estado_aux,
				1,
				id_usuario_a_aux,
				1,
				1,
				0,
				10, 
				id_equipo_aux,
				p_id_empresa
			);
			

		end loop lp;
	
		CLOSE cur_ots;
		SELECT 'BULKOT:Registros cargados, marcando batch como procesado';

		UPDATE
			sta_orden_trabajo
		SET
			procesado = TRUE
			, fec_proceso = current_timestamp()
		WHERE
			procesado = FALSE;

		COMMIT;
		SELECT 'BULKOT:Carga bulk terminada exitosamente';
END