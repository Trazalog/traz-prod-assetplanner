<input type="hidden" id="permission" value="<?php echo $permission; ?>">
<div class="row">
    <div class="col-xs-12">
        <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
            <h4><i class="icon fa fa-ban"></i> Error!</h4>
            Revise que todos los campos obligatorios esten seleccionados
        </div>
    </div>
</div>
<section class="content">
    <?php  echo cargarCabecera($id_OT,$id_SS,$id_EQ) ?>
    <div class="row">
        <div class="col-xs-12">

            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Edición Nuevo Backlog</h3>

                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <!-- botones Tomar y soltar tareas -->

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
                                        <li <?php echo ($device == 'android' ? 'class= "hidden"' : 'class= ""') ?>role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Vista
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
                                                <input type="text" class="form-control hidden" id="asignado" value="<?php echo $TareaBPM["assigned_id"] ?>">
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
                                                                <input type="text" class="hidden" id="case_id" value="<?php echo $TareaBPM['caseId'] ?>">
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
                                                                <input type="text " class="form-control " id="ot" placeholder=" " value="<?php echo $datos[0]['id_orden'] ?>" disabled>
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
                                                        </div></br> </br> </br> </br> </br>


                                                        <div class="form-group">
                                                            <div class="col-sm-12 col-md-12">
                                                                <!-- Modal formulario tarea -->
                                                                <?php if ($idForm != 0) {
                                                                  echo '<button type="button" id="formulario" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="getformulario()">Completar Formulario </button>';
                                                                } ?>
                                                            </div>
                                                        </div>

                                                </form>
                                            </div>
                                        </div>
                                        <!-- Formulario -->
                                        <div class="panel panel-default oculto">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del equipo</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                                        <label for="equipo">Equipos <strong style="color: #dd4b39">*</strong></label>
                                                        <input id="equipoDescrip" name="equipoDescrip" class="form-control" value="<?php echo $info[0]["codigo"] ?>" disabled />
                                                        <input type="hidden" id="equipo" name="equipo" class="form-control" value="<?php echo $info[0]["id_equipo"] ?>" />
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
                                                        <input type="text" id="ubicacion" name="ubicacion" class="form-control input-md" value="<?php echo $info[0]["ubicacion"] ?>" disabled />
                                                    </div>

                                                    <div class="col-xs-12">
                                                        <label for="descripcion">Descripción: </label>
                                                        <textarea class="form-control" id="descripcion" name="descripcion" disabled> <?php echo $info[0]["descripcion"] ?></textarea>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                                        <label for="codigo_componente">Código de componente-equipo :</label>
                                                        <input type="text" id="codigo_componente" name="codigo_componente" class="form-control input-md" value="<?php echo $info[0]["componentecodigo"] ?>" placeholder="Ingrese código de componente" />
                                                        <input type="hidden" id="idcomponenteequipo" name="idcomponenteequipo" value="<?php echo $info[0]["idcomponenteequipo"] ?>" />
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

                                        <div class="panel panel-default oculto">
                                            <div class="panel-heading">
                                                <h4 class="panel-title"><span class="fa fa-building-o"></span> Programación</h4>
                                            </div>

                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6">
                                                        <label for="tareaest">Tarea Estandar<strong style="color: #dd4b39">*</strong>:</label>
                                                        <select id="tareaest" name="tareaest" class="form-control">
                                                        </select>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6">
                                                        <label for="tareaOpcional">Tarea No Estandar<strong style="color: #dd4b39">*</strong>:</label>
                                                        <input type="text" class="form-control" id="tareaOpcional" name="tareaOpcional" value="<?php echo $info[0]["tarea_opcional"] ?>" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6">
                                                        <label for="vfecha">Fecha <strong style="color: #dd4b39">*</strong>:</label>
                                                        <input type='text' class="form-control" id="fechaEdit" name="denunciasfecha" value="<?php echo date("Y-m-d") ?>">
                                                    </div>


                                                    <div class="col-xs-12 col-sm-6">
                                                        <label for="back_duracion">Duración (minutos)<strong style="color: #dd4b39">*</strong>:</label>
                                                        <input type="text" class="form-control" id="back_duracion" name="back_duracion" value="<?php echo $info[0]["back_duracion"] ?>" />
                                                    </div>
                                                </div><!-- /.row -->
                                            </div>
                                        </div>

																				<!-- bloque herram ins y adj -->	

																				<div class="row">
																					<div class="col-xs-12">
																						<div class="nav-tabs-custom">
																							<!--tabs -->
																							<ul class="nav nav-tabs" role="tablist">                
																								<li role="presentation" class="active"><a href="#herramin" aria-controls="profile" role="tab" data-toggle="tab">Herramientas</a></li>
																								<li role="presentation"><a href="#insum" aria-controls="messages" role="tab" data-toggle="tab">Insumos</a></li>
																								<li role="presentation"><a href="#adj" aria-controls="messages" role="tab" data-toggle="tab">Adjunto</a></li>                        
																							</ul>
																							<!-- /tabs -->

																							<!-- Tab panes -->
																							<div class="tab-content">
																								<div role="tabpanel" class="tab-pane active" id="herramin">
																									<div class="row">
																										<div class="col-xs-12 col-sm-6 col-md-4">
																											<label for="herramienta">Codigo <strong style="color: #dd4b39">*</strong>:</label>
																											<input type="text" id="herramienta"  name="" class="form-control" />
																											<input type="hidden" id="id_herramienta" name="id_herramienta">
																										</div>                          
																										<div class="col-xs-12 col-sm-6 col-md-4">
																											<label for="marcaherram">Marca <strong style="color: #dd4b39">*</strong>:</label>
																											<input type="text" id="marcaherram"  name="" class="form-control" />
																										</div>
																										<div class="col-xs-12 col-sm-6 col-md-4">
																											<label for="descripcionherram">Descripcion <strong style="color: #dd4b39">*</strong>:</label>
																											<input type="text" id="descripcionherram"  name="" class="form-control" />
																										</div>
																										<div class="col-xs-12 col-sm-6 col-md-4">
																											<label for="cantidadherram">Cantidad <strong style="color: #dd4b39">*</strong>:</label>
																											<input type="text" id="cantidadherram"  name="" class="form-control" placeholder="Ingrese Cantidad" />
																										</div>
																										<br>
																										<div class="col-xs-12">
																											<label></label> 
																											<br>
																											<button type="button" class="btn btn-primary" id="agregarherr"><i class="fa fa-check">Agregar</i></button>
																										</div>
																									</div><!-- /.row -->
																									<div class="row">
																										<div class="col-xs-12">
																											<br>
																											<table class="table table-bordered" id="tablaherramienta"> 
																												<thead>
																													<tr>                      
																														<th>Acciones</th>
																														<th>Código</th>
																														<th>Marca</th>
																														<th>Descripcion</th>
																														<th>Cantidad</th>
																													</tr>
																												</thead>
																												<tbody></tbody>
																											</table>  
																										</div>
																									</div><!-- /.row -->
																								</div> <!-- /.tabpanel #herramin-->

																								<div role="tabpanel" class="tab-pane" id="insum">
																									<div class="row">
																										<div class="col-xs-12 col-sm-6 col-md-4">
																											<label for="insumo">Codigo <strong style="color: #dd4b39">*</strong>:</label>
																											<input type="text" id="insumo" name="insumo" class="form-control" />
																											<input type="hidden" id="id_insumo" name="">
																										</div>
																										<div class="col-xs-12 col-sm-6 col-md-4">
																											<label for="">Descripcion:</label>
																											<input type="text" id="descript"  name="" class="form-control" />
																										</div>
																										<div class="col-xs-12 col-sm-6 col-md-4">
																											<label for="cant">Cantidad <strong style="color: #dd4b39">*</strong>:</label>
																											<input type="text" id="cant"  name="" class="form-control" placeholder="Ingrese Cantidad"/>
																										</div>
																									</div><!-- /.row -->
																									<div class="row">
																										<div class="col-xs-12">
																											<br>
																											<button type="button" class="btn btn-primary" id="agregarins"><i class="fa fa-check">Agregar</i></button>
																										</div>
																									</div><!-- /.row -->
																									<div class="row">
																										<div class="col-xs-12">
																											<table class="table table-bordered" id="tablainsumo"> 
																												<thead>
																													<tr>                           
																														<th>Acciones</th>
																														<th>Código</th>
																														<th>Descripcion</th>
																														<th>Cantidad</th>
																													</tr>
																												</thead>
																												<tbody></tbody>
																											</table>  
																										</div>
																									</div><!-- /.row -->
																								</div><!--/#insum -->

																								<div role="tabpanel" class="tab-pane" id="adj">
																									<div class="row">
																										<div class="col-xs-12">
																											<input id="inputPDF" name="inputPDF" type="file" class="form-control input-md">
																											<style type="text/css">
																												#inputPDF {
																													padding-bottom: 40px;
																												}
																											</style>
																										</div> 
																									</div><!-- /.row -->
																								</div> <!-- /.tab-pane #adj -->
																							</div>  <!-- tab-content -->

																							<!-- <div class="modal-footer">
																								<button type="submit" class="btn btn-primary">Guardar</button>
																							</div>  -->
																						</div><!-- /.nav-tabs-custom -->
																					</div>
																				</div> 

																				<!--	/  bloque herram ins y adj -->

                                    </div>

                                    <div role="tabpanel" class="tab-pane" id="profile">
                                      <?php  
																				echo $comentarios;																			
																			?>	
                                    </div>

                                    <div role="tabpanel" <?php echo ($device == 'android' ? 'class= "hidden"' : 'class= "tab-pane"') ?> id="messages">
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

                    <div class="modal-footer">
                        <button type="button" id="cerrar" class="btn btn-primary" onclick="">Cerrar</button>
                        <button type="button" class="btn btn-success" id="hecho" onclick="guardar()">Hecho</button>
                    </div>
                </div><!-- /.row -->

            </div>

            
        </div>
    </div>
    </div>
</section>

<script>
    var codhermglo = "";
    var codinsumolo = "";
    var preglob = "";

    // cargo plugin DateTimePicker
    $('#fechaEdit').datetimepicker({
        format: 'YYYY-MM-DD',
        locale: 'es',
		});
		
    // Trae tareas llena select - Chequeado
    traer_tarea();
    function traer_tarea() {
        $('#tareaest').html('');
        $.ajax({
            type: 'POST',
            data: {},
            url: 'index.php/Backlog/gettarea', //index.php/
            success: function(data) {

                var opcion = "<option value='-1'>Ninguna...</option>";
                $('#tareaest').append(opcion);
                for (var i = 0; i < data.length; i++) {

                    var nombre = data[i]['descripcion'];
                    var opcion = "<option value='" + data[i]['id_tarea'] + "'>" + nombre + "</option>";
                    $('#tareaest').append(opcion);
                }
            },
            error: function(result) {

                console.log(result);
            },
            dataType: 'json'
        });
    }

    // autocomplete para componente
    function dataC() {
        var tmp = null;
        var idEquipo = $('#equipo').val();
        console.info("id equipo: " + idEquipo);
        $.ajax({
            'async': false,
            'data': {
                idEquipo: idEquipo
            },
            'dataType': 'json',
            'global': false,
            'type': "POST",
            'url': "index.php/Backlog/getComponente",
            'success': function(data) {
                //console.info("trae componentes para autocomplete");
                console.log(data);
                if (data == 0) {
                    data = "0: { value: null, label: null, descrip: null, sistema:null }";
                }
                tmp = data;
            }
        });
        return tmp;
    };
    refrescarAutocompletar();
    function refrescarAutocompletar() {
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
                $(this).val(ui.item.value); //label
                $("#descrip_componente").val(ui.item.descrip);
                $("#sistema_componente").val(ui.item.sistema);
                $('#idcomponenteequipo').val(ui.item.idce);
            }
        });

        $('#tareaest').change(function() {
            $('#tareaOpcional').val('');
        });
        $('#tareaOpcional').click(function() {
            $('#tareaest').val(-1);
        });
    }

    // Guarda Backlog (Edicion de Nuevo Backlog Autogenerado)- Chequeado
    function guardar() {
				var componente = $('#codigo_componente').val();
				var idCompo = "";       
				if (componente == "") {					
						idComponenteEquipo = 0;					
				} else {
					var idComponenteEquipo = $('#idcomponenteequipo').val();					
				}
        var equipo = $('#equipo').val();
        var tarea = $('#tareaest').val();
        var fecha = $('#fechaEdit').val();
        var horas = $('#back_duracion').val();
        var tarea_opcional = $('#tareaOpcional').val();
        var idBacklog = $('#idBacklog').val();
        var idTarBonita = $('#idTarBonita').val();
        console.log("Estoy guardando");

        if (horas !== '') {
            if ((tarea != -1) || (tarea_opcional != '')) {
						
                WaitingOpen();
                $.ajax({
                    type: 'POST',
                    data: {
                        idce: idComponenteEquipo,
                        equipo: equipo,
                        tarea: tarea,
                        fecha: fecha,
                        horas: horas,
                        tarea_opcional: tarea_opcional,
                        idBacklog: idBacklog,
                        idTarBonita: idTarBonita
                    },
                    url: 'index.php/Backlog/editarNuevo',
                    success: function(data) {
                        WaitingClose();
                        $("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
                    },
                    error: function(result) {
                        console.log(result);
                        WaitingClose();
                    },
                    dataType: 'json'
                });
            } else {

                var hayError = true;
                $('#error').fadeIn('slow');
                return;
            }

        } else {

            var hayError = true;
            $('#error').fadeIn('slow');
            return;
        }

        if (hayError == false) {
            $('#error').fadeOut('slow');
        }
    }

/////////////////////////////////////////////////////////////		

////// HERRAMIENTAS //////

  //Trae herramientas
  var dataHerramientas = function() {
    var tmp = null;
    $.ajax({
      'async': false,
      'type': "POST",
      'dataType': 'json',
      'url': 'index.php/Preventivo/getHerramientasB',
    })
    .done( (data) => { tmp = data } )
    .fail( () => alert("Error al traer Herramientas") );
    return tmp;
  }();

  // data busqueda por codigo de herramientas
  function dataCodigoHerr(request, response) {
    function hasMatch(s) {
      return s.toLowerCase().indexOf(request.term.toLowerCase())!==-1;
    }
    var i, l, obj, matches = [];

    if (request.term==="") {
      response([]);
      return;
    }
    
    //ordeno por codigo de herramientas
    dataHerramientas = dataHerramientas.sort(ordenaArregloDeObjetosPor("codigo"));

    for  (i = 0, l = dataHerramientas.length; i<l; i++) {
      obj = dataHerramientas[i];
      if (hasMatch(obj.codigo)) {
        matches.push(obj);
      }
    }
    response(matches);
  }
  // data busqueda por marca de herramientas
  function dataMarcaHerr(request, response) {
    function hasMatch(s) {
      return s.toLowerCase().indexOf(request.term.toLowerCase())!==-1;
    }
    var i, l, obj, matches = [];

    if (request.term==="") {
      response([]);
      return;
    }

    //ordeno por marca de herramientas
    dataHerramientas = dataHerramientas.sort(ordenaArregloDeObjetosPor("marca"));

    for  (i = 0, l = dataHerramientas.length; i<l; i++) {
      obj = dataHerramientas[i];
      if (hasMatch(obj.marca)) {
        matches.push(obj);
      }
    }
    response(matches);
  }


  //busqueda por marcas de herramientas
  $("#herramienta").autocomplete({
    source:    dataCodigoHerr,
    delay:     500,
    minLength: 1,
    focus: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.codigo);
      $('#id_herramienta').val(ui.item.value);
      $('#marcaherram').val(ui.item.marca);
      $('#descripcionherram').val(ui.item.label);
    },
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.codigo);
      $('#id_herramienta').val(ui.item.value);
      $('#marcaherram').val(ui.item.marca);
      $('#descripcionherram').val(ui.item.label);
    },
  })
  //muestro marca en listado de resultados
  .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li>" )
    .append( "<a>" + item.codigo + "</a>" )
    .appendTo( ul );
  };

  //busqueda por marcas de herramientas
  $("#marcaherram").autocomplete({
    source:    dataMarcaHerr,
    delay:     500,
    minLength: 1,
    focus: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.marca);
      $('#id_herramienta').val(ui.item.value);
      $('#herramienta').val(ui.item.codigo);
      $('#descripcionherram').val(ui.item.label);
    },
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.marca);
      $('#id_herramienta').val(ui.item.value);
      $('#herramienta').val(ui.item.codigo);
      $('#descripcionherram').val(ui.item.label);
    },
  })
  //muestro marca en listado de resultados
  .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li>" )
    .append( "<a>" + item.marca + "</a>" )
    .appendTo( ul );
  };

  //busqueda por descripcion de herramientas
  $("#descripcionherram").autocomplete({
    source:    dataHerramientas,
    delay:     500,
    minLength: 1,
    focus: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.label);
      $('#id_herramienta').val(ui.item.value);
      $('#herramienta').val(ui.item.codigo);
      $('#marcaherram').val(ui.item.marca);
    },
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.label);
      $('#id_herramienta').val(ui.item.value);
      $('#herramienta').val(ui.item.codigo);
      $('#marcaherram').val(ui.item.marca);
    },
  });

  // Agrega herramientas a la tabla - Chequeado
  var nrofila = 0;  // hace cada fila unica
  $("#agregarherr").click(function (e) {
    // FALTA HACER VALIDACION
    var id_her            = $('#id_herramienta').val();
    var herramienta       = $("#herramienta").val(); 
    var marcaherram       = $('#marcaherram').val();
    var descripcionherram = $('#descripcionherram').val();
    var cantidadherram    = $('#cantidadherram').val();
    
    nrofila = nrofila + 1;
    var tr = "<tr id='"+id_her+"' data-nrofila='"+nrofila+"'>"+
                "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
                "<td class='herr'>"+herramienta+"</td>"+
                "<td class='marca'>"+marcaherram+"</td>"+
                "<td class='descrip'>"+descripcionherram+"</td>"+
                "<td class='cant'>"+cantidadherram+"</td>"+ 
                // guardo id de herram y cantidades
                "<input type='hidden' name='id_her["+nrofila+"]' value='"+id_her+"'>" +                
                "<input type='hidden' name='cant_herr["+nrofila+"]' value='"+cantidadherram+"'>" +
              "</tr>";
    if(id_her > 0 && cantidadherram > 0){
      $('#tablaherramienta tbody').append(tr);
    }
    else{
      return;
    } 

    $(document).on("click",".elirow",function(){
      var parent = $(this).closest('tr');
      $(parent).remove();
    });

    $('#herramienta').val('');
    $('#marcaherram').val(''); 
    $('#descripcionherram').val(''); 
    $('#cantidadherram').val('');        
  });
////// HERRAMIENTAS //////

////// INSUMOS //////

  //Trae insumos
  var dataInsumos = function() {
    var tmp = null;
    $.ajax({
      'async': false,
      'type': "POST",
      'dataType': 'json',
      'url': 'index.php/Preventivo/getinsumo',
    })
    .done( (data) => { tmp = data } )
    .fail( () => alert("Error al traer Herramientas") );
    return tmp;
  }();

  // data busqueda por codigo de herramientas
  function dataCodigoInsumo(request, response) {
    function hasMatch(s) {
      return s.toLowerCase().indexOf(request.term.toLowerCase())!==-1;
    }
    var i, l, obj, matches = [];

    if (request.term==="") {
      response([]);
      return;
    }

    //ordeno por codigo de herramientas
    dataHerramientas = dataHerramientas.sort(ordenaArregloDeObjetosPor("codigo"));

    for  (i = 0, l = dataInsumos.length; i<l; i++) {
      obj = dataInsumos[i];
      if (hasMatch(obj.codigo)) {
        matches.push(obj);
      }
    }
    response(matches);
  }	
  //busqueda por marcas de herramientas
  $("#insumo").autocomplete({
    source:    dataCodigoInsumo,
    delay:     500,
    minLength: 1,
    focus: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.codigo);
      $('#id_insumo').val(ui.item.value);
      $('#descript').val(ui.item.label);
    },
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.codigo);
      $('#id_insumo').val(ui.item.value);
      $('#descript').val(ui.item.label);
    },
  })
  //muestro marca en listado de resultados
  .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li>" )
    .append( "<a>" + item.codigo + "</a>" )
    .appendTo( ul );
  };
  //busqueda por descripcion de herramientas
  $("#descript").autocomplete({
    source:    dataInsumos,
    delay:     500,
    minLength: 1,
    focus: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.label);
      $('#id_insumo').val(ui.item.value);
      $('#insumo').val(ui.item.codigo);
    },
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.label);
      $('#id_herramienta').val(ui.item.value);
      $('#herramienta').val(ui.item.codigo);
      $('#marcaherram').val(ui.item.marca);
    },
  });
  // Agrega insumos a la tabla 
  var nrofilaIns = 0; 
  $("#agregarins").click(function (e) {
      var id_insumo = $('#id_insumo').val(); 
      var $insumo   = $("#insumo").val();
      var descript = $('#descript').val();
      var cant = $('#cant').val();     
      console.log("El id  del insumo");
      console.log(id_insumo);
      var hayError = false;
      var tr = "<tr id='"+id_insumo+"'>"+
                    "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
                    "<td>"+$insumo+"</td>"+
                    "<td>"+descript+"</td>"+
                    "<td>"+cant+"</td>"+

                    // guardo id de insumos y cantidades
                    "<input type='hidden' name='id_insumo["+nrofilaIns+"]' value='"+id_insumo+"'>" +
                    "<input type='hidden' name='cant_insumo["+nrofilaIns+"]' value='"+cant+"'>" +
                "</tr>";
      nrofilaIns = nrofilaIns + 1;          
      if(id_insumo > 0 && cant > 0){
        $('#tablainsumo tbody').append(tr); 
      }
      else {
            return;
      }    

      $(document).on("click",".elirow",function(){
        var parent = $(this).closest('tr');
        $(parent).remove();
      });
      
      $('#insumo').val('');
      $('#descript').val(''); 
      $('#cant').val(''); 
  });
////// INSUMOS //////


//////////////////////////////////////////////////////////////
</script> 