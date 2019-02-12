<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
	<?php echo cargarCabecera($id_OT,$id_SS,$id_EQ); ?>
  <input type="text" class="form-control hidden" id="idOt" value="<?php echo $id_OT; ?>">
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
										<li <?php echo ($device == 'android' ? 'class= "hidden"' :'class= ""') ?>role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Vista
												Global
											</a></li>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content">

										<div role="tabpanel" class="tab-pane active" id="home">
											<!-- <h4 class="panel-heading">Tarea</h4> -->
											
											<div class="panel-body">

												<!-- botones Tomar y soltar tareas -->
												<?php
													echo "<button class='btn btn-block btn-success' id='btontomar' style='width: 100px; margin-top: 10px ;display: inline-block;' onclick='tomarTarea()'>Tomar tarea</button>";
													echo "&nbsp"; 
													echo "&nbsp"; 
													echo "&nbsp";
													echo "<button class='btn btn-block btn-danger grupNoasignado' id='btonsoltr' style='width: 100px; margin-top: 10px; display: inline-block;' onclick='soltarTarea()'>Soltar tarea</button>";											
													echo "</br>"; 
													echo "</br>"; 			
												?>

												<input type="text" class="form-control hidden" id="asignado" value="<?php echo $TareaBPM["assigned_id"] ?>"
												>
												<form>
													<div class="panel panel-default">
														<!-- <h4 class="panel-heading">INFORMACION:</h4> -->
														<div class="panel-heading">INFORMACION:</div>

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
                                <input type="text" class="hidden" id="case_id" value="<?php echo $TareaBPM['caseId'] ?>">
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
																<input type="text " class="form-control " id="ot"
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
													

													<div class="form-group">
														<div class="col-sm-12 col-md-12">
															<!-- Modal formulario tarea -->
															<?php if($idForm != 0){echo '<button type="button" id="formulario" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="getformulario()">Completar Formulario </button>';}?>
														</div>
													</div>

												</form>

												<!-- <table id="subtask" class="table table-hover">
													<thead>
														<tr>
															<th width="50%">Subtarea</th>
															<th width="10%">Duración</th>
															<th class="columheader" width="10%">Formulario</th>
														</tr>
													</thead>
													<tbody>
													<?php 
													//	foreach($subtareas as $subt){
															// echo '<tr>';	
															// 	echo '<td>'.$subt['tareadescrip'].'</td>';
															// 	echo '<td>'.$subt['duracion_prog'].'</td>';	
															// 	echo '<td><i class="fa fa-paperclip text-light-blue  getFormularioTarea" style="cursor: pointer; margin-left: 15px;" aria-hidden="true" data-open="false" data-validado="false" data-formid="'.$subt["form_asoc"].'" data-bpmIdTarea="'.$subt["infoId"].'"></i></td>';													
															// echo '</tr>';
													//	}	
													?>
													</tbody>
												</table>		 -->
											</div>
											</div>
										</div>

                    <!-- prioridad de la SServicios -->
                    <!-- <div class="form-group" id="decisionSolicitud">
                      <div class="radioBtn col-sm-12 col-md-12">
                        <center>
                          <label class="control-label">¿La Solicitud de Servicios es Urgente?
                          </label>
                          </br>
                          <div class="col-md-12">
                            <label class="radio-inline" for="radios-0">
                              <input type="radio" name="opcion" id="radios-0" value="correctivo" checked="checked"> Si
                            </label>
                            <label class="radio-inline" for="radios-1">
                              <input type="radio" name="opcion" id="radios-1" value="backlog" checked="checked"> No
                            </label>
                          </div>
                        </center>
                      </div>
                    </div>         -->



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
										
										<div role="tabpanel" <?php echo ($device == 'android' ? 'class= "hidden"' :'class= "tab-pane"') ?> id="messages" >							
										  <!-- <div role="tabpanel" class="tab-pane" id="messages" > -->
											
											<div class="panel-body">
												<div class="panel panel-primary">
													<div class="panel-heading">Línea de Tiempo</div>
													<div class="panel-body" style="max-height: 500px;overflow-y: scroll;">
													
													<div class="container" >
															<ul class="timeline">
																<?php
																	//echo '<h2 style="margin-left:50px;">Actividades Pendientes</h2>';
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
																		//echo '<h2 style="margin-left:50px;">Actividades Terminadas</h2>';
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
						<div class="col-sm-12 col-md-12">
								<button type="button" id="verOrden" class="btn btn-primary" onclick="asignarTareas()">Asignar Tareas</button>
						</div>
					</div>	</br>											


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
	
    
/* ver calendario Ot */
function asignarTareas(){

  var iort = $('#idOt').val();
  console.log("El id de OT es: "+iort);
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/listOrden/<?php echo $permission; ?>/"+iort+"");
  WaitingClose(); 
}

/* Pantalla pedido de insumos */
// function pedirInsumos(){ 
// 	
// 	var iort = $('#ot').val();
// 	var iort = 22;
// 	console.log("El id de OT es: " + iort);
		
// 	WaitingOpen();
// 	$('#content').empty();
// 	$("#content").load("<?php echo base_url(); ?>index.php/Notapedido/agregarListInsumos/<?php echo $permission; ?>/"+iort);
// 	WaitingClose();  
// }
/* pedido de insumos */


// $('.fecha').datepicker({
// 		autoclose: true
// 	}).on('change', function(e) {
//        // $('#genericForm').bootstrapValidator('revalidateField',$(this).attr('name'));
// 	   console.log('Validando Campo...'+$(this).attr('name'));
// 	   $('#genericForm').data('bootstrapValidator').resetField($(this),false);
// 	   $('#genericForm').data('bootstrapValidator').validateField($(this));
//   });
</script>


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