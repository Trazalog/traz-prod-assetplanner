<input type="hidden" id="permission" value="<?php echo $permission;?>">

	<?php info_header('Orden de Trabajo N°'.$ot,info_orden($ot)); ?>
	<!-- <?php #info_header('Nota de Pedido N° ???','Informacion Nota'); ?> -->
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
										<?php
													echo "<button class='btn btn-block btn-success' id='btontomar' style='width: 100px; margin-top: 10px ;display: inline-block;' onclick='tomarTarea()'>Tomar tarea</button>";
													
													echo "<button class='btn btn-block btn-danger grupNoasignado' id='btonsoltr' style='width: 100px; margin-top: 10px; display: inline-block;' onclick='soltarTarea()'>Soltar tarea</button>";											
													echo "</br>"; 
													echo "</br>"; 			
												?>
											
											<div class="panel-body">

												<!-- botones Tomar y soltar tareas -->
												

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
																 <input type="text" id="caseid" style="display:none;" value="<?php echo $TareaBPM['parentCaseId']?>">
																<input type="text" class="hidden" id="tbl_listarea" value="<?php #echo #$datos[0]['id_listarea'] ?>">
																<!-- id de task en bonita -->
																<input type="text" class="hidden" id="idTarBonita" value="<?php echo $idTarBonita ?>">
																<input type="text" class="hidden" id="esTareaStd" value="<?php #echo #$infoTarea['visible'] ?>">
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
																 placeholder=" " value="<?php #echo $datos[0][ 'id_orden'] ?>" disabled>
															</div>
														</div><br>

														<div class="form-group">
															<div class="col-sm-6 col-md-6">
																<label for="duracion_std">Duracion Estandar (minutos):</label>
																<input type="text" class="form-control" id="duracion_std" placeholder="" value="<?php #echo $datos[0]['duracion_std']  ?>"
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
													


<<<<<<< HEAD:application/views/almacen/proceso/tareas/view_.php
												</form>
=======
            </div><!-- /.row -->


            <div class="modal-footer">
            <?php echo (isset($estadoOT) && $estado==false?'<h4 class="text-danger text-center">La Orden de Trabajo Asociada al Pedido de Materiales ha sido Cerrada</h4><h5 class="text-center">No se podran realizar mas Entregas</h5>':null) ?>  
              <button type="button" id="cerrar" class="btn btn-primary" onclick="linkTo('Tarea');">Cerrar</button>
                <button type="button" class="btn btn-success" id="hecho" onclick="cerrarTarea()" <?php echo (isset($estadoOT) && $estado==false?'disabled':null) ?> >Hecho</button>
            </div> <!-- /.modal footer -->
>>>>>>> parent of d5ecaab... Merge remote-tracking branch 'origin/develop' into develop:application/views/traz-comp-almacen/proceso/tareas/view_.php

													
											</div>
											</div>
											<div id="view" class="oculto" style="margin-left:3%;">

												<?php echo $view ?>
										
											</div>
										</div>

										<div role="tabpanel" class="tab-pane" id="profile">
									    	<div class="panel-body">
											   <!-- COMENTARIOS -->
											   <?php echo $comentarios ?>
									    	</div>
									  </div>
										
										<div role="tabpanel" <?php echo ($device == 'android' ? 'class= "hidden"' :'class= "tab-pane"') ?> id="messages" >							
										<!-- <div role="tabpanel" class="tab-pane" id="messages" > -->
											
											<div class="panel-body">
												<div class="panel panel-primary">
													<?php timeline($timeline) ?>
												</div>
											</div>

										</div>

									</div>
									
								</div>
								
							</div>
							
						</div>

					</div><!-- /.row -->
					
					
					<div class="modal-footer">
						<button type="button" id="cerrar" class="btn btn-primary" onclick="linkTo('Tarea');">Cerrar</button>
						<button type="button" class="btn btn-success" id="hecho" onclick="cerrarTarea()">Hecho</button>
						<button type="button" class="btn btn-primary" id="btncerrarTarea" style="display:none;" onclick="BtnCerrarTarea()">Cerrar Tarea</button>
					</div> <!-- /.modal footer -->

				</div><!-- /.box body -->
			</div> <!-- /.box  -->
		</div><!-- /.col -->
	</div><!-- /.row -->

<?php $this->load->view(ALM.'/proceso/tareas/scripts/tarea_std'); ?>
<script>  
	$(document).ready(function(event){
		if($("#tarea").val()=="Entrega pedido pendiente")
		{
			$("#btncerrarTarea").removeAttr("style");
		}
	});
	$('.fecha').datepicker({
		autoclose: true
	}).on('change', function(e) {
       // $('#genericForm').bootstrapValidator('revalidateField',$(this).attr('name'));
	   console.log('Validando Campo...'+$(this).attr('name'));
	   $('#genericForm').data('bootstrapValidator').resetField($(this),false);
	   $('#genericForm').data('bootstrapValidator').validateField($(this));
  });
  function BtnCerrarTarea()
  {
	  $("#modalaviso").modal("show");
  }
  function CerrarTarea()
  {
	var caseid = $("#caseid").val();
	var taskid = $("#idTarBonita").val();
	$.ajax({
        type: 'POST',
        data: {
			'IdtarBonita': taskid,
			'caseid':caseid
        },
        url: 'index.php/Tarea/CerrarTarea',
        success: function(result) {
		  debugger;
		  if(result==" ok")
		  {
			$("#modalaviso").modal("hide");
			alert("Tarea Cerrada Exitosamente");
		  }else{
			$("#modalaviso").modal("hide");
			alert("Error al cerrar Tarea");
		  }
        },
        error: function(result) {
			debugger;
        }
    });
  }
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
<!---///////--- MODAL AVISO ---///////--->
<div class="modal fade" id="modalaviso">		
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-blue">
				
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
				<h5 class="modal-title" id="exampleModalLabel">AVISO</h5>
			</div>
			<input id="circuito_delete" style="display: none;">
			<div class="modal-body">
				<center>
				<h4><p>¿ DESEA CERRAR LA TAREA ?</p></h4>
				</center>
			</div>
			<div class="modal-footer">
				<center>
				<button type="button" class="btn btn-primary" onclick="CerrarTarea()">SI</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
				</center>
			</div>
		</div>
	</div>
</div>
<!---///////--- FIN MODAL AVISO ---///////--->