CREATE DEFINER=`rootremote`@`%` PROCEDURE `asp2tecn`.`bulkload_equipos`(p_id_empresa int)
BEGIN
	DECLARE cliente_aux varchar(255);
	DECLARE descripcion_aux varchar(255);
	DECLARE fecha_ingreso_aux varchar(255);
	DECLARE fecha_garantia_aux varchar(255);
	DECLARE marca_aux varchar(255);
	DECLARE codigo_aux varchar(255);
	DECLARE sector_aux varchar(255);
	DECLARE grupo_aux varchar(255);
	DECLARE criticidad_aux varchar(255);
	DECLARE estado_aux varchar(255);
	DECLARE fecha_ultimalectura_aux varchar(255);
	DECLARE ultima_lectura_aux varchar(255);
	DECLARE descrip_tecnica_aux varchar(255);
	DECLARE unidad_aux varchar(255);
	DECLARE area_aux varchar(255);
	DECLARE proceso_aux varchar(255);
	DECLARE numero_serie_aux varchar(255);
	DECLARE meta_disponibilidad_aux varchar(255);
	DECLARE id_cliente_aux int(11);
    DECLARE id_marca_aux int(11);
	DECLARE id_sector_aux int(11);
	DECLARE id_grupo_aux int(11);
	DECLARE id_criticidad_aux int(11);
	DECLARE id_area_aux int(11);
	DECLARE id_proceso_aux int(11);	
	DECLARE done INT DEFAULT FALSE;

	DECLARE cur_eq CURSOR FOR SELECT cliente
	                                ,descripcion
									,fecha_ingreso
									,fecha_garantia
									,marca
									,codigo
									,sector
									,grupo
									,criticidad
									,estado
									,fecha_ultimalectura
									,ultima_lectura
									,descrip_tecnica
									,area
									,proceso
									,numero_serie
									,meta_disponibilidad
                               from sta_equipos eq
			      			   WHERE procesado = 0;
 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;                          
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
			GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
			@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
			SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
			
		    ROLLBACK;
			
		    DELETE FROM sta_equipos
 			WHERE procesado = 0;

 			SELECT concat('BULKEQ:ERROR al cargar equipos: ',@full_error);

    END;

   		SET @@SQL_MODE = REPLACE(@@SQL_MODE, 'STRICT_TRANS_TABLES', '');
		SELECT 'BULKEQ:Insertando registros';
		START TRANSACTION;
		open cur_eq;
		lp: loop
			fetch cur_eq INTO cliente_aux,descripcion_aux,fecha_ingreso_aux,fecha_garantia_aux,marca_aux,codigo_aux,sector_aux,grupo_aux,criticidad_aux,estado_aux,fecha_ultimalectura_aux,ultima_lectura_aux
			                 ,descrip_tecnica_aux,area_aux,proceso_aux,numero_serie_aux,meta_disponibilidad_aux; 


			if done then
					SELECT 'BULKEQ:No hay más registros';
                	leave lp;
    		end if;
			
			BEGIN
				DECLARE EXIT HANDLER FOR NOT FOUND
				BEGIN
						GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
						@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
						SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);															
			 			SELECT concat('BULKEQ:ERROR al traducir datos de equipos: ',@full_error);
			 			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hay datos que no pueden ser traducidos, abortando...';
			    END;

				SELECT CONCAT('BULKEQ:Procesando registro y traduciendo: ',cliente_aux,'|',descripcion_aux,'|',fecha_ingreso_aux,'|',fecha_garantia_aux,'|',codigo_aux,'|',estado_aux,'|',fecha_ultimalectura_aux,'|',ultima_lectura_aux,'|',descrip_tecnica_aux,'|',numero_serie_aux,'|',meta_disponibilidad_aux,'|',marca_aux,'|',sector_aux,'|',grupo_aux,'|',criticidad_aux,'|',area_aux,'|',proceso_aux);

				select a.cliId 
				into id_cliente_aux
				from admcustomers a 
				where a.cliRazonSocial = trim(cliente_aux)
				and a.id_empresa = p_id_empresa;
	
				select CONCAT('BULKEQ:CLIENTE ',cast(id_cliente_aux AS CHAR));

				select m2.marcaid 
				into id_marca_aux
				from marcasequipos m2 
				where m2.marcadescrip = trim(marca_aux)
				and m2.id_empresa = p_id_empresa;
	
				select CONCAT('BULKEQ:MARCA ',cast(id_marca_aux AS CHAR));
			
				select s2.id_sector 
				into id_sector_aux
				from sector s2 
				where s2.descripcion = trim(sector_aux)
				and s2.id_empresa  = p_id_empresa
				limit 1;
		
				select CONCAT('BULKEQ:SECTOR :',cast(id_sector_aux AS CHAR));
			
				select g2.id_grupo 
				into id_grupo_aux
				from grupo g2 
				where g2.descripcion = trim(grupo_aux)
				and g2.id_empresa  = p_id_empresa;
	
				select CONCAT('BULKEQ:GRUPO ',cast(id_grupo_aux AS CHAR));
			
				select c.id_criti 
				into id_criticidad_aux
				from criticidad c  
				where c.descripcion  = trim(criticidad_aux)
				and c.id_empresa  = p_id_empresa;
				
				select CONCAT('BULKEQ:CRITICIDAD ',cast(id_criticidad_aux AS CHAR));
			
			
			   	select a2.id_area 
				into id_area_aux 
				from area a2 				 
				where a2.descripcion = trim(area_aux)
				and a2.id_empresa  = p_id_empresa;
	
				select CONCAT('BULKEQ:AREA ',cast(id_area_aux AS CHAR));
			
				select p2.id_proceso 
				into id_proceso_aux
				from proceso p2  				 
				where p2.descripcion = trim(proceso_aux)
				and p2.id_empresa  = p_id_empresa;
	
				select CONCAT('BULKEQ:PROCESO ',cast(id_proceso_aux AS CHAR));
			END;
		
			SELECT CONCAT('BULKEQ:Datos traducidos, insertando: ',cliente_aux,'|',descripcion_aux,'|',fecha_ingreso_aux,'|',fecha_garantia_aux,'|',codigo_aux,'|',estado_aux,'|',fecha_ultimalectura_aux,'|',ultima_lectura_aux,'|',descrip_tecnica_aux,'|',numero_serie_aux,'|',meta_disponibilidad_aux);

			INSERT
				INTO
				equipos (descripcion,
				fecha_ingreso,
				fecha_garantia,
				marca,
				codigo,
				id_empresa,
				id_sector,
				id_hubicacion,
				id_grupo,
				id_customer,
				id_criticidad,
				estado,
				fecha_ultimalectura,
				ultima_lectura,
				tipo_horas,
				`id-centrodecosto`,
				valor_reposicion,
				fecha_reposicion,
				id_proveedor,
				valor,
				comprobante,
				descrip_tecnica,
				id_unidad,
				id_area,
				id_proceso,
				numero_serie,
				meta_disponibilidad,
				fecha_baja,
				ubicacion
				)
			VALUES(descripcion_aux,
			str_to_date(fecha_ingreso_aux,'%d-%m-%Y %H:%i'),
			str_to_date(fecha_garantia_aux,'%d-%m-%Y %H:%i'),
			id_marca_aux,
			codigo_aux,
			p_id_empresa,
			id_sector_aux,
			0,
			id_grupo_aux,
			id_cliente_aux,
			id_criticidad_aux,
			estado_aux,
			str_to_date(fecha_ultimalectura_aux,'%d-%m-%Y %H:%i'),
			cast(ultima_lectura_aux as double),
			'a',
			0,
			0,
			null,
			0,
			0,
			'a',
			descrip_tecnica_aux,
			1,
			id_area_aux,
			id_proceso_aux,
			numero_serie_aux,
			cast(meta_disponibilidad_aux as integer),
		    NULL,
		    null);
						

		end loop lp;
	
		CLOSE cur_eq;
		SELECT 'BULKEQ:Registros cargados, marcando batch como procesado';

		UPDATE
			sta_equipos
		SET
			procesado = TRUE
			, fec_proceso = current_timestamp()
		WHERE
			procesado = FALSE;

		COMMIT;
		SELECT 'BULKEQ:Carga bulk terminada exitosamente';
END
