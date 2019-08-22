<input type="hidden" id="permission" value="<?php echo $permission; ?>">
<?php 
$userdata = $this->session->userdata('user_data');
$usrId = $userdata[0]['usrId'];     // guarda usuario logueado 
$usrName =  $userdata[0]['usrName'];
$usrLastName = $userdata[0]["usrLastName"];
echo "<input type='text' class='hidden' id='empresa_id' value='" . $userdata[0]['id_empresa'] . "'>";
echo "<input type='text' class='hidden' id='usrName' value='$usrName' >";
echo "<input type='text' class='hidden' id='usrLastName' value='$usrLastName' >";
echo "<input type='text' class='hidden' id='case' value='" . $TareaBPM['caseId'] . "'>";
echo "<input type='text' class='hidden' id='id_OT' value='" . $id_OT. "'>";
echo "<input type='text' class='hidden' id='estadoTarea' value=''>";
?>

<section class="content">
    <?php cargarCabecera($id_OT, $id_SS, $id_EQ); ?>
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
																	<li role="presentation"><a href="#info2" aria-controls="info2" role="tab" data-toggle="tab">Info </a></li>
																	<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Comentarios</a></li>
																	<li <?php echo ($device == 'android' ? 'class= "hidden"' : 'class= ""') ?>role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Trazabildad
																			</a></li>
															</ul>

															<!-- Tab panes -->
															<div class="tab-content">

																	<div role="tabpanel" class="tab-pane active" id="home">
																			<!-- <h4 class="panel-heading">Tarea</h4> -->

																			<div class="panel-body">

																					<!-- botones Tomar y soltar tareas -->
																					<?php
																					echo '<div class="row">';
																						// BTN Tomar y soltar Tarea
																						echo '<div class="col-md-4">';
																							echo "<button class='btn btn-block btn-success' id='btontomar' style='width: 100px; margin-top: 10px ;display: inline-block;' onclick='tomarTarea()'>Tomar tarea</button>";
																							echo "&nbsp";
																							echo "&nbsp";
																							echo "&nbsp";
																							echo "<button class='btn btn-block btn-danger grupNoasignado' id='btonsoltr' style='width: 100px; margin-top: 10px; display: inline-block;' onclick='soltarTarea()'>Soltar tarea</button>";
																						echo '</div>';											
																						// BTN Iniciar Tarea 
																						echo '<div class="col-md-4 col-md-offset-4 oculto" id="llave">';	
																							echo '<button type="button" class="btn btn-success" id="iniciarTarea"><i class="fa fa-play"> </i> Iniciar Tarea</button>';
																							echo '<button type="button" class="btn btn-success disabled" id="tareaIniciada"><i class="fa fa-play"> </i> Tarea Iniciada</button>';
																						echo '</div>';

																					echo '</div>';		
																					echo "</br>";	
																					?>

																					<input type="text" class="form-control hidden" id="asignado" value="<?php echo $TareaBPM["assigned_id"] ?>">

																					<h4> <b>Tarea: </b><?php echo  $TareaBPM['displayName'] ?></h3>
																					
																						<?php 																							
																							if ($subtareas !== NULL) { 		
																								echo' <div class="panel panel-default">';	
																								// echo 'entre en subtareas'	;
																								// dump($subtareas , 'subtareas en vista:');			
																								echo '<table id="subtask" class="table table-hover">';
																									echo '<thead>';
																										echo	'<tr>';
																											echo	'<th width="2%">Estado</th>';
																											echo	'<th width="10%">Subtarea</th>';
																											echo	'<th width="10%">Duración</th>';
																											echo	'<th width="10%">Formulario</th>';
																										echo '</tr>';
																									echo '</thead>';
																									echo '<tbody>';
																											
																										//dump($subtareas, 'subtareas');
																										foreach ($subtareas as $subt) {
																											echo '<tr>';
																											echo '<td>';
																											if ($subt["estado"] != 'T')
																												echo '<input class="check" type="checkbox" name="estado" value="" id="' . $subt["id_listarea"] . '">';
																											else
																												echo '<input class="check" type="checkbox" name="estado" value="" id="' . $subt["id_listarea"] . '" checked>';
																											echo '</td>';

																											if ($subt['tareadescrip'] != null) {
																												echo '<td>' . $subt['tareadescrip'] . '</td>';
																											} else {
																												echo '<td>' . $subt['subtareadescrip'] . '</td>';
																											}
																											echo '<td>' . $subt['duracion_prog'] . '</td>';
																											
																											if ($subt['subtareadescrip'] != null) {
																												echo '<td class="btn-form" data-info="' . $subt["info_id"] . '"><i class="fa fa-paperclip text-light-blue " style="cursor: pointer; margin-left: 15px;" aria-hidden="true" id="' . $subt["id_listarea"] . '" ></i></td>';
																											}

																											echo '</tr>';
																										}
																											
																									echo'</tbody>';
																								echo '</table></div>';																						
																							}																								
																						?>	
																					
															</div>
															
														
															<br>

																<div id="nota_pedido">
																
																<?php 
																	$this->load->view(CMP_ALM.'/notapedido/list');
																	
																?>
																</div>
															</div>
															
															<!-- Info Tarea-->
															<div role="tabpanel" class="tab-pane" id="info2">
																<div class="panel-body">

																	<form>
																		<div class="panel panel-default">
																				<!-- <h4 class="panel-heading">INFORMACION:</h4> -->
																				<div class="panel-heading">INFORMACION:</div>

																				<div class="form-group">
																						<div class="col-sm-6 col-md-6">
																								<label for="tarea">Tarea</label>
																								<input type="text" class="form-control" id="tarea" value="<?php echo $TareaBPM['displayName'] ?>" disabled><!-- id de listarea -->
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
																								<input type="text" class="form-control" id="fecha" placeholder="" value="<?php echo $TareaBPM['last_update_date'] ?>" disabled>
																						</div>
																				</div><br> 

																				<div class="form-group ">
																						<div class="col-sm-6 col-md-6 ">
																								<label for="ot ">Orden de Trabajo:</label>
																								<input type="text " class="form-control " id="ot" placeholder=" " value="<?php echo $id_OT ?>" disabled />
																						</div>
																				</div><br>

																				<div class="form-group">
																						<div class="col-sm-6 col-md-6">
																								<label for="duracion_std">Duracion Estandar (minutos):</label>
																								<input type="text" class="form-control" id="duracion_std" placeholder="" value="<?php echo $datos[0]['duracion_std']  ?>" disabled>
																						</div></br>
																				</div>

																				<br>

																				<div class="form-group">
																						<div class="col-sm-12 col-md-12">
																								<label for="detalle">Detalle</label>
																								<textarea class="form-control" id="detalle" rows="3" disabled><?php echo $TareaBPM['displayDescription'] ?></textarea>
																						</div>
																				</div><br> <br> <br> <br> <br>


																				<div class="form-group">
																						<div class="col-sm-12 col-md-12">
																								<!-- Modal formulario tarea -->
																								<?php if ($idForm != 0) {
																									echo '<button type="button" id="formulario" class="btn btn-primary" data-toggle="modal"data-target=".bs-example-modal-lg" onclick="getformulario()">Completar Formulario </button>';
																								} ?>
																						</div>
																				</div>

																	</form>
																	
																</div>
															</div>
											</div>

											<div role="tabpanel" class="tab-pane" id="profile">
												<div class="panel-body">
													<!-- COMENTARIOS -->
													<?php echo $comentarios ?>
												</div>
											</div>

											<div role="tabpanel" <?php echo ($device == 'android' ? 'class= "hidden"' : 'class= "tab-pane"') ?> id="messages">

													<div class="panel-body">

															<?php
															timeline($timeline);
															?>

													</div>
											</div>

										</div>
									</div>
							</div>
							<div class="modal-footer">
									<button type="button" id="cerrar" class="btn btn-primary" onclick="cargarVista()">Cerrar</button>
									<button type="button" class="btn btn-success" id="hecho" onclick="validarSubtareas()">Terminar Tarea</button>
							</div> <!-- /.modal footer -->
						</div>
				</div>
		</div><!-- /.row -->



        </div><!-- /.box body -->
    </div> <!-- /.box  -->
    </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->

<script>
 $('#frm-modal').show();  
		// valida el estado de la OT y muestra llave segun corressponda 		
		validaInicio();
		function validaInicio() { 			
			$("#iniciarTarea").hide(); 
			$("#tareaIniciada").hide(); 
			var id_OT = $('#id_OT').val();
			url='index.php/Tarea/confInicioTarea?id_OT='+id_OT;
			console.log(url);
			//alert(id_OT + 'id de ot');
			$.ajax({
						type: 'GET',
						url: url, 
						success: function(data){
							//alert(data);
											// si la tarea esta iniciada el #estadoTarea de tarea es 1                   
											if (data) {												
												$("#tareaIniciada").show();		
												$("#estadoTarea").val(1);									
											} else {												
												$("#iniciarTarea").show();
												$("#estadoTarea").val(0);											
											}									
										},            
						error: function(data){
								alert('Error en Validacion Inicio Tareas' + data);
									},
								dataType: 'json'
						});
		}		

		// Cambia el estado de Orden servicio y de solicitud de servicio
		$("#iniciarTarea").click(function () {  
			
			WaitingOpen('Iniciando Tarea...');
			var id_OT = $('#id_OT').val();
			ajax({
						type: 'POST',
						data: {id_OT: id_OT},
						url: 'index.php/Tarea/inicioTarea', 
						success: function(data){   
										WaitingClose();                
										if (data) {
											$("#iniciarTarea").hide();
											$("#tareaIniciada").show();	
											// guarda el estado de la tarea (inicializado)
											$("#estadoTarea").val(1);									
										} else {
											alert('Error al iniciar a Tarea...');
										}									
									},            
						error: function(data){
							WaitingClose();
							alert('NO iniciada' + data);
								},
						dataType: 'json'
			});
		});																			

 

    // /* verifica estado de subrtareas para cerrar OT */
    // function validarSubtareas() {

	// 		if (validarFormularios() && validarEstSubTareas()) {
	// 				var iniciarTarea = $('#estadoTarea').val();
	// 				// valida que la tarea haya sido iniciallizada con anterioridad para poder terminarla
	// 				if (iniciarTarea == 1) {
	// 					ejecutarOT();
	// 				} else {
	// 					alert('Para Terminar Tarea, esta debe estar inicializada con anterioridad desde el boton Iniciar Tarea');
	// 				}
					
	// 		} else {
	// 				alert("Por favor cierre las Tareas que faltan antes de Terminar");
	// 		}
    // }

    /* camba el estado de las subtareas en BD (tblListareas) */
    $('.check').change(function() {
        var idListarea = $(this).attr("id");
        if (this.checked) {
            var estado = 'T';
            cambiarEstadoSubtask(estado, idListarea);
        } else {
            var estado = 'C';
            cambiarEstadoSubtask(estado, idListarea);
        }
    });

		/* cambia estado de subtareas a T o a C en BD */
    function cambiarEstadoSubtask(estado, idListarea) {

        WaitingOpen();
        $.ajax({
            data: {
                estado: estado,
                idListarea: idListarea
            },
            dataType: 'json',
            type: 'POST',
            url: 'index.php/Tarea/cambiarEstadoSubtask',
            success: function(result) {
                WaitingClose();
            },
            error: function(result) {
                WaitingClose();
                //alert("Error: No se pudo obtener el Formulario");
            },
        });
    }
    // devueve bool si estan todas las subt tildadas
    function validarEstSubTareas() {
			var tabla = $('#subtask tbody tr');				
			// si hay subtareas en la tabla 
			if(Object.keys(tabla).length === 0){
				var band = '';
				// recorre validadno que esten los checkbox tildados
				$.each(tabla, function(index) {
						var check = $(this).find('input.check');
						if (check.prop('checked')) {
								band = true;
						} else {
								band = false;
								return band;
						}
				});
				return band;
			}else{	// sino hay tareas retorna true
				return true;
			}					
    }
  

  

			function cargarNotasOffline() {
					console.log("Cargando Pedidos Offline...");
					$('.ped_pendientes').remove();
					var data = sessionStorage.getItem('list_pedidos_' + $('#ot').val());
					if (data == null) {
							console.log("sin nota pedidos");
							return;
					}
					data = JSON.parse(data);
					for (var i = 0; i < data.length; i++) {
							var aux = JSON.stringify(data[i]).replace(/'/g, "\\'");
							$('#deposito tbody').append(
									"<tr class='ped_pendientes' data-offline='true' data-detalle='" + aux + "' id='ped_" + i + "'><td><i class='fa fa-fw fa-search text-light-blue' style='cursor: pointer; margin-left: 15px;' title='Ver Nota Pedido' onclick='VerDetalles(this)'</i></td><td># ? </td><td>Esperando Conexión...</td></tr>"
							);
					}
			}
		/*  /.	Pantalla pedido de insumos */	
		//Rearmo ajax para guardar Post en indexedDB//
		
		function ajax(options) {
    if (navigator.serviceWorker.controller) {
      navigator.serviceWorker.controller.postMessage(options.data)
    }

    return $.ajax(options);
  }
  //Fin redifinicion//
</script>



<?php
	$modal = new StdClass();
	$modal->id = 'frm-modal';
	$modal->titulo = 'Formulario Tarea';
	$modal->body = '<div id="frm-field"></div>';

	echo modal($modal);
?>