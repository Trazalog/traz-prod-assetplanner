<input type="hidden" id="permission" value="<?php echo $permission;?>">

<section class="content">
	<?php //echo cargarCabecera($idPedTrabajo); ?>
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
														echo "<input type='text' class='hidden' id='id_OT' value='$id_OT' >";
														//echo "<input type='text' class='hidden' id='idPedTrabajo' value='$idPedTrabajo' >";
												?>
												<input type="text" class="form-control hidden" id="asignado" value="<?php echo $TareaBPM["assigned_id"] ?>"
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
																<input type="text" class="hidden" id="esTareaStd" value="<?php echo $infoTarea['visible'] ?>">
															</div>
														</div>


														<div class="form-group">
															<div class="col-sm-6 col-md-6">
																<label for="fecha">Fecha de Creación</label>
																<input type="text" class="form-control" id="fecha" placeholder="" value="<?php echo $TareaBPM['last_update_date'] ?>"
																 disabled>
															</div>
														</div><br>


														<div class="form-group hidden">
															<div class="col-sm-6 col-md-6 ">
																<label for="ot ">Orden de Trabajo:</label>
																<input type="text " class="form-control " id="ot
                                                                    "
																 placeholder=" " value="<?php echo $datos[0][ 'id_orden'] ?>" disabled>
															</div>
														</div><br>

														<div class="form-group hidden">
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

													<div class="col-sm-12 col-md-12" style="margin-top:15px;"> 
                              
															<?php											
																if ($idOT != "") {
																	echo '<h4>Se ha generado la Orden de Trabajo Nº  '.$idOT.', haga click en el boton Orden Trabajo para modificarla</h4>';
																} 											
															?>
															<div class="col-sm-12 col-md-12" id="infoOT"></div>
																	 </br>
															<button class="btn btn-primary" id="verOT">Orden Trabajo</button>
															</div>

																</br>


													<div class="form-group">
														<div class="col-sm-12 col-md-12">
															<!-- Modal formulario tarea -->
															<?php if($idForm != 0){echo '<button type="button" id="formulario" class="btn btn-primary" data-toggle="modal"data-target=".bs-example-modal-lg" onclick="getformulario()">Completar Formulario </button>';}?>
														</div>
													</div>

												</form>

                        
                        <table id="subtask" class="table table-hover">
													<thead>
														<tr>															
															<th width="2%"></th>
															<th width="10%">Subtarea</th>
															<th width="10%">Duración</th>
															<th width="10%">Formulario</th>
														</tr>
													</thead>
													<tbody>
													<?php 
														foreach($subtareas as $subt){
															echo '<tr>';	
//echo "<input class='check' type='checkbox' value='tilde' name='".$a['idValor']."' ".($a['valDefecto'] == 'tilde' ? "checked" : "")." style='transform: scale(1.4);'>";	
echo '<td>';										
					// echo "<input class='checkSubt' id='".$subt['id_subtarea']."' type='checkbox' data-idSubtarea='".$subt['id_subtarea']."' value=' ".($subt['estado'] == 'Terminada' ? "checked": "")."'>";	
					echo "<input class='checkSubt' id='".$subt['id_subtarea']."' type='checkbox' data-idSubtarea='".$subt['id_subtarea']."' value='".($subt['estado'] == "T" ? "checked" : "")."'  ".($subt['estado'] == 'T' ? 'checked = checked' : '').">";	
					echo '</td>';					
															//echo '<td>'.$subt['tareadescrip'].'</td>';
																echo '<td>'.$subt['tareadescrip'].'</td>';
																echo '<td>'.$subt['duracion_prog'].'</td>';
																echo '<td><i class="fa fa-paperclip text-light-blue" style="cursor: pointer; margin-left: 15px;" aria-hidden="true" data-idformsub="'.$subt["form_asoc"].'"></i></td>';
															echo '</tr>';
														}	
													?>
													</tbody>
												</table>

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
																	echo '<h3 style="margin-left:50px;">Actividades Pendientes</h3>';
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
																		echo '<h3 style="margin-left:50px;">Actividades Terminadas</h3>';
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

										</div>

									</div>
								</div>
							</div>
						</div>

					</div><!-- /.row -->

					<div class="modal-footer">
						<button type="button" id="cerrar" class="btn btn-primary" onclick="cargarVista()">Cerrar</button>
						<button type="button" class="btn btn-success" id="hecho" onclick="terminarTarea()">Hecho</button>
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
	/* Validaciones form y botones tomar y soltar tarea */
		$('#genericForm').bootstrapValidator({ //VALIDADOR
					message: 'This value is not valid',
					feedbackIcons: {
							valid: 'glyphicon glyphicon-ok',
							invalid: 'glyphicon glyphicon-remove',
							validating: 'glyphicon glyphicon-refresh'
					},
					fields: {		
						fecha:{
								selector: '.fecha',
								validators:{
													date: {
															format: 'DD-MM-YYYY',
															message: '(*) Formato de Fecha Inválido'
													}
								}
						},
						number: {
										selector: '.numerico',
										validators: {
												integer: {
														message: '(*) Solo Valores Numéricos'
												}
										}
						}

					}
		}).on('success.form.bv', function(e) {
							// Prevent form submission
							e.preventDefault();
				guardarFormulario(true);
						
		});

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
		}
	/*  ./ Validaciones form y botones tomar y soltar tarea */
	
	
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
		var validado=($('#idform').val()==0);	
		// Toma tarea en BPM
		function tomarTarea() {
			var idTarBonita = $('#idTarBonita').val();
			//alert(idTarBonita);
			$.ajax({
				type: 'POST',
				data: {
					idTarBonita: idTarBonita
				},
				url: 'index.php/Tarea/tomarTarea',
				success: function (data) {
					//console.log(data['reponse_code']);
					// toma a tarea exitosamente
					if (data['reponse_code'] == 200) {
						habilitar();
						// agrega mensaje sobre boton Orden trabajo 
						$('#infoOT').after('<h4>Se ha generado la Orden de Trabajo Nº ' + data['resInsert'] + ', haga click en el boton Orden Trabajo para modificarla</h4>');
					}

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
		// terminar tarea
		function terminarTarea() {
			
			//if(!validado){alert("Para concluir esta actividad primero debe Validar el Formulario");return;}
			WaitingOpen('Cerrando Tarea');
			var idTarBonita = $('#idTarBonita').val();
			// var id_listarea = $('#id_listarea').val();
			// var esTareaStd = $('#esTareaStd').val();
			//alert(idTarBonita+'_'+id_listarea+'_'+esTareaStd);
			$.ajax({
				type: 'POST',
				data: {
					'idTarBonita': idTarBonita//,
					//'id_listarea': id_listarea,
					//'esTareaStd': esTareaStd
				},
				url: 'index.php/Tarea/terminarTareaStandarenBPM',
				success: function (data) {
					WaitingClose();
					// toma a tarea exitosamente
					if (data['reponse_code'] == 204) {
						$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
					
					}
						
				
				},
				error: function (data) {
					WaitingClose();
					console.log(data);
				},
				dataType: 'json'
			});
		}
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
					alert("SII");
				},
				error: function (result) {
					alert("Noo");
					console.log(result);
				},
				dataType: 'json'
			});
		}
		//Funcion COMENTARIOS
		function guardarComentario() {
			console.log("Guardar Comentarios...");
			var id = <?php echo json_encode($TareaBPM['caseId']);?>;
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
	/*  ./ Funciones BPM */


	/* Formulario de sub Tareas */
		var click = 0;
		$('#formulario').click(function () {
			click = 1;
		});
		// llevanta modal con formulario generico de subtareas
		$(document).on("click", ".fa-paperclip", function(e) {       
				// agregar esto para que no se repita el evento
				e.preventDefault();
				e.stopImmediatePropagation();
				//var form_id = $(this).data("idformsub");
				//FIXME:SACAR HARDCODE FORMID
				var form_id = 1000;
				var bpm_task_id = 160501;
				console.log(form_id);
				console.log(bpm_task_id);
				//alert(form_id);
				WaitingOpen();
				$.ajax({
				data: {form_id:form_id, bpm_task_id: bpm_task_id},
				dataType: 'json',
				type: 'POST',
				url: 'index.php/Tarea/Obtener_Formulario',
				success: function(result){   
					//form_actual_id = 'genericForm'+idListTarea;        
					$("#contFormSubtarea").html(result.html);
					$('#modalFormSubtarea').modal('show');
					WaitingClose();
				},
				error: function(result){
					WaitingClose();
					alert("Error: No se pudo obtener el Formulario");
				},
			});				
		});

		function ValidarCampos(){
		//	WaitingOpen('Validando Formulario');
			$('#genericForm').data('bootstrapValidator').validate();
			if(!$('#genericForm').data('bootstrapValidator').isValid()){
				alert('Error de Validación.\nCompruebe que los Datos esten cargados Correctamente.');
			return false;
			}	
			return true;
		}
		function OcultarModal(){
			$('#genericForm').data('bootstrapValidator').resetForm();
			$('#modalForm').modal('hide');
			guardarFormulario(false);
		}
		// Guarda formulario al cerrar el modal (btn Cerrar)
		function guardarFormulario(validarOn){
			console.log("Guardando Formulario...");
			var imgs = $('input.archivo');
			var formData = new FormData($("#genericForm")[0]);
			// Display the key/value pairs
				// for(var pair of formData.entries()) {
				// console.log(pair[0]+ ', '+ pair[1]); 
				// }		

			/** subidad y resubida de imagenes **/
			// Tomo los inputs auxiliares cargados
			var aux = $('input.auxiliar');
			var auxArray = [];
			aux.each(function () {
				auxArray.push($(this).val());
			});
			for (var i = 0; i < imgs.length; i++) {

				var inpValor = $(imgs[i]).val();
				var idValor = $(imgs[i]).attr('name');				
				// si tiene algun valor (antes de subir img)
				if (inpValor != "") {
					//al subir primera img
					formData.append(idValor, inpValor);
				} else {
					// sino sube img guarda la del auxiliar         
					//inpValor = auxArray[i]; //valor del input auxiliar
					//console.table(inpValor);
					//formData.append(idValor, inpValor);
				}
			}
			/* text tipo check */
			var check = $('input.check');			
			var checkArray = [];		
			for (var i = 0; i < check.length; i++) {			
				var idCheckValor = $(check[i]).attr('name');				
				if ($(check[i]).is(':checked')) {
					chekValor = 'tilde';
				} else {
					chekValor = 'notilde';
				}
				formData.append(idCheckValor, chekValor);
			}			
			/* Ajax de Grabado en BD */
			$.ajax({
				url: 'index.php/Tarea/guardarForm',
				type: 'POST',
				data: formData,
				cache: false,
				contentType: false,
				processData: false,
				success: function (respuesta) {
					WaitingClose();
					ValidarObligatorios(validarOn);					
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
		}
		//TODO: REVISAR VAIDACIONES
		function ValidarObligatorios(validarOn){
			console.log("Validando Campos Obligatorios...");
			var form_id = $('#idform').val();
			var id_OT = $('#id_OT').val();
			$.ajax({
				type: 'POST',
				data: {'form_id':form_id,'id_OT':id_OT},
				url: 'index.php/Tarea/ValidarObligatorios',
				success: function (result) {
					validado = (result == 1);				
					WaitingClose();
					if(!validarOn) return;
					if(validado){
						$('#modalFormSubtarea').modal('hide');
					}
					else {
						alert("Fallo Validación: Campos Obligatorios Incompletos. Por favor verifique que todos los campos obligatorios marcados con (*) esten completos.");
					}

				},
				error: function(result){
					alert("Fallo la Validación del formularios en el Servidor. Por favor vuelva a intentar.");
				}
			});
		}
		
		// Cierra modal y llama a guardar el formulario
		function CerrarModal(){
			$('#modalFormSubtarea').modal('hide');
			//WaitingOpen('Guardando Cambios');
			guardarFormulario(false);        
		}



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

				idForm = idForm;
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

			//console.log(data);
			
			$.each(data, function (index) {
				//$( "#" + i ).append(  );
				var idSelect = data[index]['idValor'];
				console.log('idvalor: '+ idSelect + '-- valor: ' + data[index]['VALOR']);
				var i = 0;
				var valor = "";
				var valorSig = "";
				if(data[index]['VALOR']!=$('#' + idSelect).val()){
					$('#' + idSelect).append($('<option>',
						{ value: data[index]['VALOR'], text: data[index]['VALOR'] }));
				}
				valor = data[index]['idValor'];
				valorSig = data[index]['idValor'];
				// $('#' + idSelect+" option").val(function(idx, val) {
				// 	//if(!$(this).is(':selected')){
				// 		$(this).siblings('[value="'+ val +'"]').remove();
				// 	//}
				// });
			});
			
		}
		//Trae valor de las imagenes
		function getImgValor() {
			var valores;
			// guarda el id form asoc a tarea std en modal para guardar
			idForm = $('#idform').val();
			idPedTrabajo = $('#idPedTrabajo').val();
			// trae valores validos para llenar componentes input files.
			$.ajax({
				type: 'POST',
				data: {
					idForm: idForm,
					idPedTrabajo: idPedTrabajo
				},
				url: 'index.php/Tarea/getImgValor',
				success: function (data) {
					console.table(data);
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
			// FIXME: CAMBIAR URL DE PROCESO
			var id_listarea = $('inptut.archivo').val();
			var base_url = "http://35.239.41.196/mtba-desa-procprod-desarrollo/";
			var imagen = "";
			$.each(data, function (index) {
				var id = data[index]['valoid'];
				var valor = data[index]['valor'];
				//carga el valor que viene de DB
				//$("."+data[index]['valoid']).val(valor);
				imagen = base_url + valor;
				$("a." + data[index]['valoid']).attr("href", imagen);

				console.log("valor id: ");
				console.log(data[index]['valoid']);
				console.log("  imagen: ");
				console.log(valor);

				console.log(" url imagen: ");
				console.log(imagen);
			});
		}

		$('.fecha').datepicker({
			autoclose: true
		}).on('change', function(e) {
				// $('#genericForm').bootstrapValidator('revalidateField',$(this).attr('name'));
			console.log('Validando Campo...'+$(this).attr('name'));
			$('#genericForm').data('bootstrapValidator').resetField($(this),false);
			$('#genericForm').data('bootstrapValidator').validateField($(this));
		});
		
		// detecta cambio en checkbox y cambia el estado de la subtarea
		$('.checkSubt').change(function(){
			//TODO:CAMBIAR A ID DE LISTAREA
			var idlistarea = $(this).attr("data-idSubtarea");
			var estadoInic = $(this).val();
			alert(estadoInic);
			
			if( $(this).attr('checked') ) {				
				$(this).attr('checked',false);
			}else{
				$(this).attr('checked',true);
			}
			var tilde = $(this).attr('checked');
			if (tilde == 'checked') {
				var estado = 'T';
			} else {
				var estado = 'C';
			}			
			
			alert(estado);
			// TODO: HACER UPDATE DEL ESTADO DE TAREAen tabla listareas
			// $.ajax({
			// 	type: 'POST',
			// 	data: {'idlistarea':idlistarea,'estado':estado},
			// 	url: 'index.php/Tarea/cambioEstadoSubtarea',
			// 	success: function (result) {					

			// 	},
			// 	error: function(result){
					
			// 	},
			// 	dataType: 'json'
			// });

 		});
		
	
	// $('.checkSubt').iCheck({
  //   checkboxClass: 'icheckbox_minimal',
  //   radioClass: 'iradio_minimal'//,
  //   //increaseArea: '20%' // optional
  // });


	/*  /. Formulario de subareas */	


// Volver atras
$('#cerrar').click(function cargarVista() {
		WaitingOpen();
		$('#content').empty();
		$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
		WaitingClose();
	});
</script>

<!-- Modal Formularios -->
	<div class="modal fade bs-example-modal-lg" id="modalFormSubtarea" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-sm-12">
						<div class="box">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-12 col-md-12" id="contFormSubtarea">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--  ./ Modal Formularios -->