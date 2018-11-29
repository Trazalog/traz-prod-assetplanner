<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
	<?php cargarCabecera($idPedTrabajo); ?>
	<input type="text" class="form-control hidden" id="idPedTrabajo" value="<?php echo $idPedTrabajo ?>">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">

				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div role="tabpanel" class="tab-pane">
								<div class="form-group">

									<!-- Nav tabs -->
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Tareas</a></li>
										<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Comentarios</a></li>
										<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Vista
												Global
											</a></li>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content">

										<div role="tabpanel" class="tab-pane active" id="home">
											<!-- <h4 class="panel-heading">Tarea</h4> -->
											<div class="panel-body">

												<?php
														//echo"id de form: ";
														//dump_exit($TareaBPM["assigned_id"]);
														//$TareaBPM["assigned_id"] = 'asignado';
														//echo "<input type='text' class='hidden' id='estadoTarea' value='$estadoTarea' >";
												//if ($estadoTarea == "noasignado") {´
														echo' <input type="hidden"  id="idTareaBPM" name="grpId" value="'.$idTarBonita.'">' ;
														echo "<input type='hidden' class='' id='caseId' value='". $TareaBPM["caseId"] ."'>";

														echo "<input type='hidden' class='' id='idOT' value='". $idOT ."'>";

														echo "<button class='btn btn-block btn-success' id='btontomar' style='width: 100px; margin-top: 10px ;display: inline-block;' onclick='tomarTarea()'>Tomar tarea</button>";
												//}else{
														echo "&nbsp"; 
														echo "&nbsp"; 
														echo "&nbsp";
														echo "<button class='btn btn-block btn-danger grupNoasignado' id='btonsoltr' style='width: 100px; margin-top: 10px; display: inline-block;' onclick='soltarTarea()'>Soltar tarea</button>";
												//}    
														echo "</br>"; 
														echo "</br>"; 

														$userdata = $this->session->userdata('user_data');
														$usrId = $userdata[0]['usrId'];     // guarda usuario logueado 
														$usrName =  $userdata[0]['usrName'];
														$usrLastName = $userdata[0]["usrLastName"];
														
														echo "<input type='text' class='hidden' id='usrName' value='$usrName' >";
														echo "<input type='text' class='hidden' id='usrLastName' value='$usrLastName' >";
														echo "<input type='text' class='hidden' id='id_listarea' value='$id_listarea' >";

														echo "<input type='text' class='hidden' id='idPedTrabajo' value='$idPedTrabajo' >";
														echo "<input type='text' class='hidden' id='tipo_tarea' value='$tipo_tarea' >";
												?>
												<input type="text" class="form-control hidden" id="asignado" value="<?php echo $TareaBPM[" assigned_id"] ?>"
												>
												<form>
													<div class="panel panel-default">
														<h4 class="panel-heading">INFORMACION:</h4>
														<div class="form-group">
															<div class="col-sm-6 col-md-6">
																<label for="tarea">Tarea</label>
																<input type="text" class="form-control" id="tarea" value="<?php echo $TareaBPM['displayName'] ?>"
																 disabled><!-- id de listarea -->
																<input type="text" class="hidden" id="tbl_listarea" value="<?php echo $datos[0]['id_listarea'] ?>">
																<input type="text" class="hidden" id="idform" value="<?php echo $idForm ?>">
																<!-- id de task en bonita -->
																<input type="text" class="hidden" id="idTarBonita" value="<?php echo $idTarBonita ?>">
															</div>
														</div>


														<div class="form-group">
															<div class="col-sm-6 col-md-6">
																<label for="fecha">Fecha de Creación</label>
																<input type="text" class="form-control" id="fecha" placeholder="" value="<?php echo $TareaBPM['last_update_date'] ?>"
																 disabled>
															</div>
														</div><br>


														<div class="form-group ">
															<div class="col-sm-6 col-md-6 ">
																<label for="ot ">Orden de Trabajo:</label>
																<input type="text " class="form-control " id="ot
                                                                    "
																 placeholder=" " value="<?php echo $datos[0][ 'id_orden'] ?>" disabled>
															</div>
														</div><br>

														<div class="form-group">
															<div class="col-sm-6 col-md-6">
																<label for="duracion_std">Duracion Estandar (minutos):</label>
																<input type="text" class="form-control" id="duracion_std" placeholder="" value="<?php echo $datos[0]['duracion_std']  ?>"
																 disabled>
															</div></br>
														</div>

														<br>

														<div class="form-group">
															<div class="col-sm-12 col-md-12">
																<label for="detalle">Detalle</label>
																<textarea class="form-control" id="detalle" rows="3" disabled><?php echo $TareaBPM['displayDescription']?></textarea>
															</div>
														</div></br> </br> </br> </br> </br>
													</div>

													<div class="form-group">
														<div class="col-sm-12 col-md-12">
															<!-- Modal formulario tarea -->
															<?php if($idForm != 0){echo '<button type="button" id="formulario" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="getformulario()">Completar Formulario</button>';}
															?>
														</div>
													</div>

													

												</form>

											</div>
										</div>

										<div role="tabpanel" class="tab-pane" id="profile">
											<div class="panel-body">
												<div class="panel panel-primary">
													<div class="panel-heading">Comentarios</div>
													<div class="panel-body" style="max-height: 500px;overflow-y: scroll;">
														<ul id="listaComentarios">
															<?php 
																foreach($comentarios as $f){

																		if(strcmp($f['userId']['userName'],'System')!=0){
																		echo '<hr/>';
																		echo '<li><h4>'.$f['userId']['firstname'].' '.$f['userId']["lastname"].'<small style="float: right">'.date_format(date_create($f['postDate']),'H:i  d/m/Y').'</small></h4>';
																		echo '<p>'.$f['content'].'</p></li>';
																		}
																	}
														?>
														</ul>
													</div>
												</div>
												<textarea id="comentario" class="form-control" placeholder="Nuevo Comentario..."></textarea>
												<br />
												<button class="btn btn-primary" id="guardarComentario" onclick="guardarComentario()">Agregar</button>
											</div>
										</div>

										<div role="tabpanel" class="tab-pane" id="messages">
											<div class="panel-body">

										<div class="panel panel-primary">
											<div class="panel-heading">Línea de Tiempo</div>
											<div class="panel-body" style="max-height: 500px;overflow-y: scroll;">


												<div class="container">
													<ul class="timeline">
														<?php
																													echo '<h2 style="margin-left:50px;">Actividades Pendientes</h2>';
																													foreach ($timeline['listAct'] as $f) {       
																													echo '<li>
																															<div class="timeline-badge info"><i class="glyphicon glyphicon-time"></i></div>
																															<div class="timeline-panel">
																																	<div class="timeline-heading">
																																	<h4 class="timeline-title">'.$f['displayName'].'</h4>
																																	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> '.date_format(date_create($f['last_update_date']),'H:i  d/m/Y').'</small></p>
																																	</div>
																																	<div class="timeline-body">';
																																	if(array_key_exists ( 'assigned_id' , $f ) && $f['assigned_id']!=''){
																																			echo '<p>Usuario: '.$f['assigned_id']['firstname'].' '.$f['assigned_id']['lastname'].'</p>';
																																	}else{
																																			echo '<p>Usuario: Sin Asignar</p>';
																																	}
																													echo   '<p>Descripción: '.$f['displayDescription'].'</p>
																																	<p>Case: '.$f['caseId'].'</p>
																																	</div>
																															</div>
																															</li>';
																													}
																													echo '<h2 style="margin-left:50px;">Actividades Terminadas</h2>';
																													foreach ($timeline['listArch'] as $f) {
																													
																													echo '<li>
																															<div class="timeline-badge danger"><i class="glyphicon glyphicon-check"></i></div>
																															<div class="timeline-panel">
																																	<div class="timeline-heading">
																																	<h4 class="timeline-title">'.$f['displayName'].'</h4>
																																	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> '.date_format(date_create($f['last_update_date']),'H:i  d/m/Y').'</small></p>
																																	</div>
																																	<div class="timeline-body">';
																																	if(array_key_exists ( 'assigned_id' , $f )){
																																			echo '<p>Usuario: '.$f['assigned_id']['firstname'].' '.$f['assigned_id']['lastname'].'</p>';
																																	}else{
																																			echo '<p>Usuario: Sin Asignar</p>';
																																	}
																													echo    '<p>Descripción: '.$f['displayDescription'].'</p>           
																																	<p>Case: '.$f['caseId'].'</p>
																																	</div>
																															</div>
																															</li>';
																													}
																													?>
													</ul>
												</div>

											</div>
										</div>


									</div>
											<!--p<nelbody-->

										</div>
										<div class="col-sm-12 col-md-12" id="infoOT">
											<h4>Por favor asigne los recursos para las actividades planificadas
												presionando el botón Orden de Trabajo</h4>
											<button class="btn btn-primary" id="verOT" onclick="verOT()">Orden de
												Trabajo</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div><!-- /.row -->

					<div class="modal-footer">
						<button type="button" id="cerrar" class="btn btn-primary" onclick="cargarVista()">Cerrar</button>
						<!-- <button type="button" class="btn btn-success" id="hecho" onclick="terminarTarea()">Hecho</button> -->
					</div> <!-- /.modal footer -->

				</div><!-- /.box body -->
			</div> <!-- /.box  -->
		</div><!-- /.col -->
	</div><!-- /.row -->
</section><!-- /.content -->

<!-- estilos de linea de tiempo -->
<style type="text/css">
	.timeline {
		list-style: ;
		padding: 0 0 20px;
		position: relative;
		margin-top: -15px;
		margin-left: 70px;
	}

	.timeline:before {
		top: 30px;
		bottom: 25px;
		position: absolute;
		content: " ";
		width: 3px;
		background-color: #ccc;
		left: 25px;
		margin-right: -1.5px
	}

	.timeline>li,
	.timeline>li>.timeline-panel {
		margin-bottom: 5px;
		position: relative
	}

	.timeline>li:after,
	.timeline>li:before {
		content: " ";
		display: table
	}

	.timeline>li:after {
		clear: both
	}

	.timeline>li>.timeline-panel {
		margin-left: 55px;
		float: left;
		top: 19px;
		padding: 4px 10px 8px 15px;
		border: 1px solid #ccc;
		border-radius: 5px;
		width: 45%
	}

	.timeline>li>.timeline-badge {
		color: #fff;
		width: 36px;
		height: 36px;
		line-height: 36px;
		font-size: 1.2em;
		text-align: center;
		position: absolute;
		top: 26px;
		left: 9px;
		margin-right: -25px;
		background-color: #fff;
		z-index: 100;
		border-radius: 50%;
		border: 1px solid #d4d4d4
	}

	.timeline>li.timeline-inverted>.timeline-panel {
		float: left
	}

	.timeline>li.timeline-inverted>.timeline-panel:before {
		border-right-width: 0;
		border-left-width: 15px;
		right: -15px;
		left: auto
	}

	.timeline>li.timeline-inverted>.timeline-panel:after {
		border-right-width: 0;
		border-left-width: 14px;
		right: -14px;
		left: auto
	}

	.timeline-badge.primary {
		background-color: #2e6da4 !important
	}

	.timeline-badge.success {
		background-color: #3f903f !important
	}

	.timeline-badge.warning {
		background-color: #f0ad4e !important
	}

	.timeline-badge.danger {
		background-color: #d9534f !important
	}

	.timeline-badge.info {
		background-color: #5bc0de !important
	}

	.timeline-title {
		margin-top: 0;
		color: inherit
	}

	.timeline-body>p,
	.timeline-body>ul {
		margin-bottom: 0;
		margin-top: 0
	}

	.timeline-body>p+p {
		margin-top: 5px
	}

	.timeline-badge>.glyphicon {
		margin-right: 0px;
		color: #fff
	}

	.timeline-body>h4 {
		margin-bottom: 0 !important
	}
</style>


<script>
	// Trae id de ot por id tarea BPM (la oT fue generada por la Tarea anterior. Lo vincula por CASE ID)
	getIdOTporIdBPM();
	function getIdOTporIdBPM() {
		var caseId = $('#caseId').val();
		$.ajax({
			type: 'POST',
			data: {
				'caseId': caseId,
			},
			url: 'index.php/Tarea/getIdOTPorCaseId',
			success: function (data) {
				console.log('id de ot en vista: ');
				console.log(data);
				$('#idOT').val(data);
			},
			error: function (data) {
				console.log(data);
			},
			dataType: 'json'
		});
	}

	function verOT() {

		var iort = $('#idOT').val();
		var idTarea = $('#idTarBonita').val();// idde tarea para cerrar la tarea asignacion
		var idPedTrabajo = $('#idPedTrabajo').val();
		//alert(iort);
		//alert(idTarea);  
		WaitingOpen('Cargando Tareas...');
		$('#content').empty();
		$("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/cargarAsignacion/<?php echo $permission; ?>/" + iort + "/" + idTarea + "/"+ idPedTrabajo + "/");
		WaitingClose();
	}

	evaluarEstado();
	function evaluarEstado() {

		var asig = $('#asignado').val();
		// si esta tomada la tarea
		if (asig != "") {
			habilitar();
		} else {
			deshabilitar();
		}
	}

	function habilitar() {
		// habilito btn y textarea       
		$("#btonsoltr").show();
		$("#hecho").show();
		$("#guardarComentario").show();
		$("#comentario").show();
		$("#infoOT").show();
		//desahilito btn tomar      
		$("#btontomar").hide();
		$("#formulario").show();
	}
	function deshabilitar() {
		// habilito btn tomar
		$("#btontomar").show();
		// habilito btn y textarea  
		$("#btonsoltr").hide();
		$("#hecho").hide();
		$("#guardarComentario").hide();
		$("#comentario").hide();
		$("#formulario").hide();
		$("#infoOT").hide();

	}

	// Volver al atras
	$('#cerrar').click(function cargarVista() {
		WaitingOpen();
		$('#content').empty();
		$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
		WaitingClose();
	});

	/* Funciones BPM */
	//Ckeck Tarea realizada
	$('.btncolor').click(function (e) {
		//var id = <?php //echo $idorden?>; //tomo valor de id_orden
		console.log(id);
		var id_tarea = $(this).parents('tr').find('td').eq(1).html();
		console.log("Estoy finalizando una tarea");
		$.ajax({
			type: 'POST',
			data: {
				id_tarea: id_tarea,
			}, //Id tarea
			url: 'index.php/Taller/TareaRealizada', //index.php/
			success: function (data) {
				console.log(data);
				//alert("Se Finalizando la SUBTAREA");
				refresca(id);
			},
			error: function (result) {
				console.log(result);
				alert("NO se Finalizo la SUBTAREA");
				refresca(id);
			}
		});
	});

	//TODO: METODO NUEVO CAMBIADO POR TERNINAR TAREA
	// para poder probar  terminar la planificacion
	function terminarAsigPersPlanificacion() {
		var idTarBonita = $('#idTarBonita').val();
		//alert(idTarBonita);
		$.ajax({
			type: 'POST',
			data: {
				'idTarBonita': idTarBonita,
			},
			url: 'index.php/Tarea/terminarAsigPersPlanificacion',
			success: function (data) {

				// toma a tarea exitosamente
				if (data['reponse_code'] == 204) {
					$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
				}
			},
			error: function (data) {
				//alert("Noo");
				console.log(data);
			},
			dataType: 'json'
		});
	}
	// function terminarTarea(){
	//     var idTarBonita = $('#idTarBonita').val();
	//     alert(idTarBonita);
	//     $.ajax({
	//         type: 'POST',
	//         data: {
	//             'idTarBonita': idTarBonita,
	//         },
	//         url: 'index.php/Tarea/terminarTarea',
	//         success: function(data) {

	//                 // toma a tarea exitosamente
	//                 if(data['reponse_code'] == 204){
	//                     $("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
	//                 }
	//         },
	//         error: function(data) {
	//             //alert("Noo");
	//             console.log(data);
	//         },
	//         dataType: 'json'
	//     }); 
	// }   




	// Boton Hecho generico
	function estado() {
		var idTarBonita = $('#idTarBonita').val();
		$.ajax({
			type: 'POST',
			data: {
				'idTarBonita': idTarBonita,
			},
			url: 'index.php/Tarea/estadoCuenta',
			success: function (result) {
				console.log(result);
				//alert("SII");
			},
			error: function (result) {
				//alert("Noo");
				console.log(result);
			},
			dataType: 'json'
		});
	}
	//Funcion COMENTARIOS
	function guardarComentario() {
		console.log("Guardar Comentarios...");
		var id =<?php echo json_encode($TareaBPM['caseId']);?>;
		var nombUsr = $('#usrName').val();
		var apellUsr = $('#usrLastName').val();;

		var comentario = $('#comentario').val();
		$.ajax({
			type: 'POST',
			data: { 'processInstanceId': id, 'content': comentario },
			url: 'index.php/Tarea/GuardarComentario',
			success: function (result) {
				console.log("Submit");
				var lista = $('#listaComentarios');
				lista.prepend(' <hr/><li><h4>' + nombUsr + ' ' + apellUsr + '<small style="float: right">Hace un momento</small></h4><p>' + comentario + '</p></li>');
				$('#comentario').val('');
			},
			error: function (result) {
				console.log("Error");
			}
		});
	}

	// Toma tarea en BPM y genera OT Inicial
	function tomarTarea() {
		var idTarBonita = $('#idTarBonita').val();
		var idPedido = $('#id_pedido').val();   //petr_id
		var cod_interno = $('#cod_interno').val(); // codigo interno balderramo
		var detalle = $('#detalle').html();
		var tipo_tarea = $('#tipo_tarea').val();
		//alert("idPedido:"+idPedido+"/cod_interno:"+cod_interno+"/tipo_tarea:"+tipo_tarea);

		$.ajax({
			type: 'POST',
			data: {
				idTarBonita: idTarBonita,
				idPedido: idPedido,
				cod_interno: cod_interno,
				detalle: detalle,
				tipo_tarea:tipo_tarea
			},
			url: 'index.php/Tarea/tomarTareaPlanificacion',
			success: function (data) {
				console.log('codigo de respuesta: ' + data['respRest']['reponse_code']);
				console.log('respuesta insercion: ' + data['resInsert']);

				// toma a tarea exitosamente en BPM                    
				if (data['respRest']['reponse_code'] == 200) {
					habilitar();
				}
				// inserta OT en BD
				if (data['resInsert'] != 0) {

					// agrega mensaje sobre boton Orden trabajo 
					$('#infoOT').after('<h5>Se ha generado la Orden de Trabajo Nº ' + data['resInsert'] + ', haga click en el bton OT para modificarla</h5>');

					// guarda id de ot  para usar
					$('#idOT').val(data['resInsert']);
				}

				// <h5>Se ha generado la Orden de Trabajo Nº <span id="numOT"></span> haga click en el bton OT para modificarla</h5>
				// $('h5 span:last-child').after('<span>'+data['resInsert']+'</span>');
			},
			error: function (result) {
				console.log(result);
			},
			dataType: 'json'
		});
	}
	// Soltar tarea en BPM
	function soltarTarea() {
		var idTarBonita = $('#idTarBonita').val();
		//alert(idTarBonita);
		$.ajax({
			type: 'POST',
			data: {
				idTarBonita: idTarBonita
			},
			url: 'index.php/Tarea/soltarTarea',
			success: function (data) {
				console.log(data['reponse_code']);
				// toma a tarea exitosamente
				if (data['reponse_code'] == 200) {
					deshabilitar();
				}
			},
			error: function (result) {
				console.log(result);
			},
			dataType: 'json'
		});
	}

	/** Formulario **/

	var click = 0;
	$('#formulario').click(function () {
		click = 1;
	});

	// evento de cierre de modal guarda parcialmente los datos
	$('#modalForm').on('hidden.bs.modal', function (e) {

		$('#error').fadeOut('slow');
		// toma  el valor de todos los input file 
		var imgs = $('input.archivo');

		var formData = new FormData($("#genericForm")[0]);

		/** subidad y resubida de imagenes **/
		// Tomo los inputs auxiliares cargados
		var aux = $('input.auxiliar');

		var auxArray = [];
		aux.each(function () {
			auxArray.push($(this).val());
		});
		//console.table(aux);
		for (var i = 0; i < imgs.length; i++) {

			var inpValor = $(imgs[i]).val();
			var idValor = $(imgs[i]).attr('name');
			//console.log("idValor: "+idValor);
			// si tiene algun valor (antes de subir img)
			if (inpValor != "") {
				//al subir primera img
				formData.append(idValor, inpValor);
			} else {
				// sino sube img guarda la del auxiliar         
				inpValor = auxArray[i]; //valor del input auxiliar
				//console.table(inpValor);
				formData.append(idValor, inpValor);
			}
		}

		/* text tipo check */
		var check = $('input.check');
		//console.log("aux");
		//console.table(aux);
		var checkArray = [];
		// check.each(function() {
		//     checkArray.push($(this).val());
		// });
		//console.log('array de chech: ');
		//console.table(checkArray);

		for (var i = 0; i < check.length; i++) {
			//var chekValor = $(check[i]).val();
			var idCheckValor = $(check[i]).attr('name');
			console.log('valor: ');
			console.log(idCheckValor);
			if ($(check[i]).is(':checked')) {
				chekValor = 'tilde';
			} else {
				chekValor = 'notilde';
			}
			formData.append(idCheckValor, chekValor);
		}
		// console.log('array de chech: ');
		// console.table(check);

		/* Ajax de Grabado en BD */
		$.ajax({
			url: 'index.php/Tarea/guardarForm',
			type: 'POST',
			data: formData,
			cache: false,
			contentType: false,
			processData: false,

			success: function (respuesta) {


				if (respuesta === "exito") {

				}
				else if (respuesta === "error") {
					alert("Los datos no se han podido guardar");
				}
				else {
					//$("#msg-error").show();
					//$(".list-errors").html(respuesta);
					//alert("Los datos no se han guardado");
				}
			}
		});

	});

	// trae valores validos para llenar form asoc.  
	function getformulario(event) {

		// trae valor de imagenes y llena inputs.
		getImgValor();

		// llena form una sola vez al primer click
		if (click == 0) {
			var estadoTarea = $('#estadoTarea').val();
			// toma id de form asociado a listarea en TJS
			var idForm = $('#idform').val();
			console.log('id de form: ');
			console.log(idForm);

			// guarda el id form asoc a tarea std en modal para guardar
			$('#idformulario').val(idForm);

			idForm = 1;
			// trae valores validos para llenar componentes de form asoc.
			$.ajax({
				type: 'POST',
				data: { idForm: idForm },
				url: 'index.php/Tarea/getValValido',
				success: function (data) {
					//console.log('valores de componentes: ');
					//console.table(data);                   

					llenaComp(data);
				},
				error: function (result) {

					console.log(result);
				},
				dataType: 'json'
			});
		}
	}

	// llena los componentes de form asoc con valores validos
	function llenaComp(data) {

		var id_listarea = $('#tbl_listarea').val();
		$('#id_listarea').val(id_listarea);


		$.each(data, function (index) {
			//$( "#" + i ).append(  );
			var idSelect = data[index]['idValor'];
			//console.log('idvalor: '+ data[index]['idValor'] + '-- valor: ' + data[index]['VALOR']);
			var i = 0;
			var valor = "";
			var valorSig = "";

			if(data[index]['VALOR']!=$('#' + idSelect).val()){
				$('#' + idSelect).append($('<option>',
					{ value: data[index]['VALOR'], text: data[index]['VALOR'] }));
			}

			valor = data[index]['idValor'];
			valorSig = data[index]['idValor'];
		});
	}

	//Trae valor de las imagenes
	function getImgValor() {
		var valores;
		// guarda el id form asoc a tarea std en modal para guardar
		idForm = $('#idform').val();
		// trae valores validos para llenar componentes input files.
		$.ajax({
			type: 'POST',
			data: { idForm: idForm },
			url: 'index.php/Tarea/getImgValor',
			success: function (data) {

				valores = data;
				llenarInputFile(valores);
			},
			error: function (result) {

				console.log(result);
			},
			dataType: 'json'
		});
	}

	// carga inputs auxiliares con url de imagen desde BD
	function llenarInputFile(data) {
		var id_listarea = $('inptut.archivo').val();

		$.each(data, function (index) {

			var id = data[index]['valoid'];
			var valor = data[index]['valor'];
			//carga el valor que viene de DB
			$("." + data[index]['valoid']).val(valor);
			//$("#"+data[index]['valoid']).val(valor);
		});
	}

	// Validacion de campos obligatorios y vacios
	function validarFormGuardado() {

		var id_listarea = $('#id_listarea').val();

		var oblig = $('.requerido');
		//console.log("oblig");
		//console.table(oblig);
		var obligArrayIds = [];
		oblig.each(function () {
			obligArrayIds.push($(this).attr('name'));
		});
		//console.log('obligatorios: ');
		//console.log(obligArray),
		$.ajax({
			type: 'POST',
			data: {
				obligArrayIds: obligArrayIds,
				id_listarea: id_listarea
			},
			url: 'index.php/Tarea/validarFormGuardado',
			success: function (data) {
				console.log('por sucess: ');
				console.log(data);
				if (data == false) {
					$('#error').fadeIn('slow');
				}
				else {
					$('#error').fadeOut('slow');
				}

			},
			error: function (result) {
				console.log('por error: ');
				console.log(data);
				console.log(result);
			},
			dataType: 'json'
		});
	}

	$('.fecha').datepicker({
		autoclose: true
	});



</script>



<div class="modal fade bs-example-modal-lg" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">

			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-body">
							<div class="row">
								<div class="col-sm-12 col-md-12">
									<?php
                                    if($form != ''){
                                        cargarFormulario($form);
                                    }                                    
                                    ?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>