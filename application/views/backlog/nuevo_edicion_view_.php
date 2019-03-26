<input type="hidden" id="permission" value="<?php echo $permission;?>">
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
          <h4><i class="icon fa fa-ban"></i> Error!</h4>
          Revise que todos los campos obligatorios esten seleccionados
      </div>
  </div>
</div>
<section class="content">
<?php //echo cargarCabecera($id_OT,$id_SS,$id_EQ); ?>
  <div class="row">
    <div class="col-xs-12">

      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Edición Nuevo Backlog</h3>
          <?php
            // if (strpos($permission,'Add') !== false) {
            //   echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="listado">Ver Listado</button>';
            // }
            ?>
          <div class="clearfix"></div>  
          <div class="col-xs-12 col-sm-6 col-md-4">
            <!-- botones Tomar y soltar tareas -->
            <?php
              // echo "<button class='btn btn-block btn-success' id='btontomar' style='width: 100px; margin-top: 10px ;display: inline-block;' onclick='tomarTarea()'>Tomar tarea</button>";
              // echo "&nbsp"; 
              // echo "&nbsp"; 
              // echo "&nbsp";
              // echo "<button class='btn btn-block btn-danger grupNoasignado' id='btonsoltr' style='width: 100px; margin-top: 10px; display: inline-block;' onclick='soltarTarea()'>Soltar tarea</button>";											
              // echo "</br>"; 
              // echo "</br>"; 	
             
            ?>

            <!-- <input type="text" class="form-control hidden" id="asignado" value="<?php //echo $TareaBPM["assigned_id"] ?>" 
            >-->
            <!-- id de task en bonita -->
            <input type="text" class="hidden" id="idTarBonita" value="<?php echo $TareaBPM['id'] ?>">
            <input type="text" class="hidden" id="idBacklog" value="<?php echo $info[0]['backId'] ?>">

          </div>    






        </div><!-- /.box-header -->
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
                      <!-- Formulario -->
                      <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del equipo</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="equipo">Equipos <strong style="color: #dd4b39">*</strong></label>
                  <input  id="equipoDescrip" name="equipoDescrip" class="form-control" value="<?php echo $info[0]["codigo"] ?>" disabled />
                  <input  type="hidden" id="equipo" name="equipo" class="form-control" value="<?php echo $info[0]["id_equipo"] ?>" />
                  <!-- <input type="hidden" id="id_equipo" name="id_equipo">-->
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="fecha_ingreso">Fecha:</label>
                  <input type="text" id="fecha_ingreso" name="fecha_ingreso" class="form-control input-md" value="<?php echo $info[0]["fecha_ingreso"] ?>" disabled />
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="marca">Marca:</label>
                  <input type="text" id="marca" name="marca" class="form-control input-md" value="<?php echo $info[0]["marca"] ?>" disabled />
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="ubicacion">Ubicación:</label>
                  <input type="text" id="ubicacion" name="ubicacion" class="form-control input-md" value="<?php echo $info[0]["ubicacion"] ?>" disabled/>
                </div>

                <div class="col-xs-12">
                  <label for="descripcion">Descripción: </label>
                  <textarea class="form-control" id="descripcion" name="descripcion" value="<?php echo $info[0]["tareadescrip"] ?>" disabled></textarea>
                </div> 

                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="codigo_componente">Código de componente-equipo :</label>
                  <input type="text" id="codigo_componente" name="codigo_componente" class="form-control input-md" name="descripcion" value="<?php echo $info[0]["componentecodigo"] ?>" placeholder="Ingrese código de componente"/>
                  <input type="hidden" id="idcomponenteequipo" name="idcomponenteequipo" value="<?php echo $info[0]["idcomponenteequipo"] ?>"/>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="descrip_componente">Descripción de componente:</label>
                  <input type="text" id="descrip_componente" name="descrip_componente" class="form-control input-md" value="<?php echo $info[0]["componentedescrip"] ?>" disabled />
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="sistema_componente">Sistema:</label>
                  <input type="text" id="sistema_componente" name="sistema_componente" class="form-control input-md" value="<?php echo $info[0]["sistemadescrip"] ?>" disabled />
                </div>
          
              </div><!-- /.row -->
            </div><!-- /.panel-body -->
          </div><!-- /.panel -->

          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title"><span class="fa fa-building-o"></span> Programación</h4>
            </div>
            
            <div class="panel-body">  
              <div class="row">
                <div class="col-xs-12 col-sm-6">
                  <label for="tareaest">Tarea Estandar<strong style="color: #dd4b39">*</strong>:</label>
                  <select id="tareaest" name="tareaest" class="form-control" >
                  </select>
                </div>
                <div class="col-xs-12 col-sm-6">
                  <label for="tareaOpcional">Tarea No Estandar<strong style="color: #dd4b39">*</strong>:</label>
                  <input type="text" class="form-control" id="tareaOpcional" name="tareaOpcional" value="<?php echo $info[0]["tarea_opcional"] ?>"/>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12 col-sm-6">
                  <label for="vfecha">Fecha <strong style="color: #dd4b39">*</strong>:</label>                 
                  <input type='text' class="form-control" id="fechaEdit" name="denunciasfecha" value="<?php echo date("Y-m-d") ?>">
                </div>
    

                <div class="col-xs-12 col-sm-6">
                  <label for="back_duracion">Duración (minutos)<strong style="color: #dd4b39">*</strong>:</label>
                  <input type="text" class="form-control" id="back_duracion" name="back_duracion" value="<?php echo $info[0]["back_duracion"] ?>"/>
                </div>                         
              </div><!-- /.row -->
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

					</div><!-- /.row -->
          
          </div>
          
          <div class="modal-footer">
            <!-- <button type="button" class="btn btn-danger btn-sm delete" onclick="limpiar()">Cancelar</button> -->
            <button type="button" id="cerrar" class="btn btn-primary" onclick="">Cerrar</button>
						<button type="button" class="btn btn-success" id="hecho" onclick="guardar()">Hecho</button>
            <!-- <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardar()">Guardar</button> -->
          </div>
        </div>
      </div>
    </div>
</section>

<script>
  
var codhermglo  = "";
var codinsumolo = "";
var preglob     = "";
  


// cargo plugin DateTimePicker
$('#fechaEdit').datetimepicker({
    format: 'YYYY-MM-DD',
    locale: 'es',
  });


// Trae tareas llena select - Chequeado
traer_tarea();
function traer_tarea(){
  $('#tareaest').html(''); 
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Backlog/gettarea', //index.php/
      success: function(data){
             
                var opcion  = "<option value='-1'>Ninguna...</option>" ; 
                  $('#tareaest').append(opcion); 
                for(var i=0; i < data.length ; i++) { 

                    var nombre = data[i]['descripcion'];
                    var opcion  = "<option value='"+data[i]['id_tarea']+"'>" +nombre+ "</option>" ; 
                    $('#tareaest').append(opcion);                                  
                }
              },
      error: function(result){
            
            console.log(result);
          },
          dataType: 'json'
      });
}

// autocomplete para componente

function dataC() {
  var tmp = null;
  var idEquipo = $('#equipo').val();
  console.info("id equipo: "+idEquipo);
  $.ajax({
    'async': false,
    'data': {idEquipo:idEquipo},
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "index.php/Backlog/getComponente",
    'success': function(data) {
      //console.info("trae componentes para autocomplete");
      console.log(data);
      if(data==0){
        data = "0: { value: null, label: null, descrip: null, sistema:null }";
      }
      tmp = data;
    }
  });
  return tmp;
};

refrescarAutocompletar();
function refrescarAutocompletar(){
  $("#codigo_componente").autocomplete({
    source: dataC(),
    delay: 100,
    minLength: 1,
    messages: {
      noResults: function(count) {
        $('#codigo_componente').val("");
        $('#codigo_componente').attr("placeholder", "No se encontraron resultados");
      },
      results: function(count) {
        console.log("There were " + count + " matches")
      },
    },
    focus: function(event, ui) {
      //console.table(ui.item);
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox
      $(this).val(ui.item.value);
      $('#descrip_componente').val(ui.item.descrip);
      $('#sistema_componente').val(ui.item.sistema);
      $('#idcomponenteequipo').val(ui.item.idce);
    },
    select: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox and hidden field
      $(this).val(ui.item.value);//label
      $("#descrip_componente").val(ui.item.descrip);
      $("#sistema_componente").val(ui.item.sistema);
      $('#idcomponenteequipo').val(ui.item.idce);
    }
  });
  


  $('#tareaest').change(function(){
    $('#tareaOpcional').val('');
  });
  $('#tareaOpcional').click(function(){
    $('#tareaest').val(-1);
  });
}


// Guarda Backlog - Chequeado
function guardar(){     
  
  var idComponenteEquipo = $('#idcomponenteequipo').val();
  var equipo = $('#equipo').val();
  var tarea  = $('#tareaest').val();       
  var fecha  = $('#fechaEdit').val();
  var horas  = $('#back_duracion').val(); 
  var tarea_opcional = $('#tareaOpcional').val(); 
  var idBacklog = $('#idBacklog').val();
  var idTarBonita = $('#idTarBonita').val();
  console.log("Estoy guardando");

  if(equipo > 0 && horas !=='' ){    
    if((tarea != -1) || (tarea_opcional != '')){
      WaitingOpen();
      $.ajax({
          type: 'POST',
          data: {
            idce:idComponenteEquipo,
            equipo:equipo, 
            tarea:tarea,  
            fecha:fecha, 
            horas:horas,
            tarea_opcional:tarea_opcional,
            idBacklog:idBacklog,
            idTarBonita:idTarBonita
          },
          url: 'index.php/Backlog/editarNuevo', 
          success: function(data){                 
                  WaitingClose(); 
                  alert('editado con exito');             
                },
          error: function(result){
                  console.log(result);   
                  WaitingClose();           
                },
          dataType: 'json'        
      });  
    }else{
       
      var hayError = true;
        $('#error').fadeIn('slow');
        return;
    }
        
  }
  else{
       
        var hayError = true;
        $('#error').fadeIn('slow');
        return;
      }

  if(hayError == false){
    $('#error').fadeOut('slow');
  }    
}

</script>
