<input type="hidden" id="permission" value="<?php echo $permission;?>">
<?php 
	$userdata = $this->session->userdata('user_data');
	$usrId = $userdata[0]['usrId'];     // guarda usuario logueado 
	$usrName =  $userdata[0]['usrName'];
	$usrLastName = $userdata[0]["usrLastName"];
	echo "<input type='text' class='hidden' id='empresa_id' value='".$userdata[0]['id_empresa']."'>";
	echo "<input type='text' class='hidden' id='usrName' value='$usrName' >";
	echo "<input type='text' class='hidden' id='usrLastName' value='$usrLastName' >";
 	echo "<input type='text' class='hidden' id='case' value='".$TareaBPM['caseId']."'>";
?>

<section class="content">
	<?php cargarCabecera($id_OT,$id_SS,$id_EQ); ?>
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

												<?php
												//dump($subtareas, 'subtareas: ');
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
																 placeholder=" " value="<?php echo $id_OT?>" disabled />
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
															<?php if($idForm != 0){echo '<button type="button" id="formulario" class="btn btn-primary" data-toggle="modal"data-target=".bs-example-modal-lg" onclick="getformulario()">Completar Formulario </button>';}?>
														</div>
													</div>

												</form>

												<table id="subtask" class="table table-hover">
													<thead>
														<tr>
															<th width="2%">Estado</th>
															<th width="10%">Subtarea</th>
															<th width="10%">Duración</th>
															<th width="10%">Formulario</th>
														</tr>
													</thead>
													<tbody>
														<?php 
														//dump($subtareas, 'subtareas');
															foreach($subtareas as $subt){
																echo '<tr>';
																	echo '<td>';			
																		if( $subt["estado"] != 'T' )
																			echo '<input class="check" type="checkbox" name="estado" value="" id="'.$subt["id_listarea"].'">';
																		else
																			echo '<input class="check" type="checkbox" name="estado" value="" id="'.$subt["id_listarea"].'" checked>';
																	echo '</td>';

																	if($subt['tareadescrip']!= null){
																		echo '<td>'.$subt['tareadescrip'].'</td>';
																	}	else{
																		echo '<td>'.$subt['subtareadescrip'].'</td>';
																	}
																	echo '<td>'.$subt['duracion_prog'].'</td>';
																	if($subt['subtareadescrip']!= null){				
																		echo '<td><i class="fa fa-paperclip text-light-blue btn-form" style="cursor: pointer; margin-left: 15px;" aria-hidden="true" id="'.$subt["id_listarea"].'" data-infoId="'.$subt["info_id"].'" data-valido="true"></i></td>';
																	}	
																	
																echo '</tr>';
															}	
														?>
													</tbody>
												</table>		
											</div>
											</div>
											<div class="row">
												<div class="col-sm-12 col-md-12">
														<button type="button" id="pedidoInsumos" class="btn btn-primary" onclick="pedirInsumos()">Pedido de Insumos</button>
												</div>
											</div>	
											<br>

											<div id="nota_pedido"></div>			
										</div>

										<div role="tabpanel" class="tab-pane" id="profile">
											<div class="panel-body">
												<div class="panel panel-primary" id="panel-comentarios">
															
															<!-- COMENTARIOS -->
														
												</div>
											</div>
										</div>
										
										<div role="tabpanel" <?php echo ($device == 'android' ? 'class= "hidden"' :'class= "tab-pane"') ?> id="messages" >							
											
											<div class="panel-body">
												<div class="panel panel-primary">
													<div class="panel-heading">Línea de Tiempo</div>
													<div class="panel-body" style="max-height: 500px;overflow-y: scroll;">
													
													<div class="container" >
														
																<?php
																	timeline($timeline);
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

					</div><!-- /.row -->			
					
					<div class="modal-footer">
						<button type="button" id="cerrar" class="btn btn-primary" onclick="cargarVista()">Cerrar</button>
						<button type="button" class="btn btn-success" id="hecho" onclick="validarSubtareas()">Hecho</button>
					</div> <!-- /.modal footer -->

				</div><!-- /.box body -->
			</div> <!-- /.box  -->
		</div><!-- /.col -->
	</div><!-- /.row -->
</section><!-- /.content -->

<script>
	cargarPedidos();
	function cargarPedidos(){
		var iort = $('#ot').val();
		$('#nota_pedido').empty();
		$("#nota_pedido").load("<?php echo base_url(); ?>index.php/Notapedido/ObtenerNotasPedidosxOT/<?php echo $permission; ?>/"+iort);
		
	}
	ObtenerComentarios();
	function ObtenerComentarios(){
		 $('#panel-comentarios').empty();
		 $("#panel-comentarios").load("<?php echo base_url(); ?>index.php/Tarea/ObtenerComentariosBPM/"+$('#case').val());
	}
function validarFormularios(){
	console.log('Validando Formularios...');
	ban = true;

	$('.btn-form').each(function(i){
		ban = ban && $(this).data('valido');
	});

	if(ban) alert('Valido'); else alert('Invalido');

	return ban;
}

/* verifica estado de subrtareas para cerrar OT */
	function validarSubtareas(){

		if(validarFormularios() && validarEstSubTareas()){
			ejecutarOT();
		}else{
			alert("Por favor cierre las Tareas que faltan antes de Terminar");
		}
	}

/* camba el estado de las subtareas en BD (tblListareas) */
	$('.check').change(function() {
		var idListarea = $(this).attr("id");
		if(this.checked) {		
			var estado = 'T';
			cambiarEstadoSubtask(estado, idListarea);
		}else{		
			var estado = 'C';
			cambiarEstadoSubtask(estado, idListarea);
		}
	});	

	function cambiarEstadoSubtask(estado, idListarea){

		WaitingOpen();
				$.ajax({
				data: {estado: estado,
								idListarea:idListarea},
				dataType: 'json',
				type: 'POST',
				url: 'index.php/Tarea/cambiarEstadoSubtask',
				success: function(result){  
								WaitingClose();
				},
				error: function(result){
					WaitingClose();
					//alert("Error: No se pudo obtener el Formulario");
				},
			});
	} 
	// devueve bool si estan todas las subt tildadas
	function validarEstSubTareas(){
		var tabla = $('#subtask tbody tr');
		var band = '';
		$.each(tabla, function (index) {
    	var check = $(this).find('input.check');
			if( check.prop('checked')){
				band = true;
			}else{
				band = false;
				return band;
			}
		});	
		return band;
	}
/* /. camba el estado de las subtareas en BD (tblListareas) */

/* Formulario de subareas */

	// levanta cada formulario por id 
	$(document).on("click", ".fa-paperclip", function(e) {    
      e.preventDefault();
      e.stopImmediatePropagation();		
			infoId = $(this).attr("data-infoId");			
			WaitingOpen();
			$.ajax({
      data: {infoId: infoId},
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Tarea/Obtener_Formulario',
      success: function(result){       
        $("#contFormSubtarea").html(result.html);
        $('#modalFormSubtarea').modal('show');
        WaitingClose();
	    	ValidarObligatorios();
      },
      error: function(result){
        WaitingClose();
        alert("Error: No se pudo obtener el Formulario");
      },
    });

  });

/*  /. Formulario de subareas */

/* Pantalla pedido de insumos */
    load_view_insumos();
  	function load_view_insumos(){
		var emp_id = $('#empresa_id').val();
		var iort = $('#ot').val();
		$('#body-pedidos').empty();
		$("#body-pedidos").load("<?php echo base_url(); ?>index.php/Notapedido/agregarListInsumos/<?php echo $permission; ?>/"+iort+"/"+emp_id); 
	}
	function pedirInsumos(){ 
		$('.modal#pedidos').modal('show');
	}


function cargarNotasOffline(){
	console.log("Cargando Pedidos Offline...");
	$('.ped_pendientes').remove();
	var data = sessionStorage.getItem('list_pedidos_'+$('#ot').val());
	if(data==null){console.log("sin nota pedidos");return;}
	data = JSON.parse(data);
	for(var i=0;i<data.length;i++){
		var aux = JSON.stringify(data[i]).replace(/'/g, "\\'");
		$('#deposito tbody').append(
			"<tr class='ped_pendientes' data-offline='true' data-detalle='"+aux+"' id='ped_"+i+"'><td><i class='fa fa-fw fa-search text-light-blue' style='cursor: pointer; margin-left: 15px;' title='Ver Nota Pedido' onclick='VerDetalles(this)'</i></td><td># ? </td><td>Esperando Conexión...</td></tr>"
		);
	}
}



//////////////////////////////////////////////////


</script>

<div class="modal" id="pedidos" tabindex="-1" role="dialog">
  <div class="modal-dialog" id="body-pedidos" role="document">

  </div>
</div>



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
