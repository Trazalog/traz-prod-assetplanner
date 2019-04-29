<input type="hidden" id="permission" value="<?php echo $permission;?>">

<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error3" style="display: none">
          <h4><i class="icon fa fa-ban"></i> Error!</h4>
          Revise que todos los campos obligatorios estén seleccionados.
      </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
          <h4><i class="icon fa fa-ban"></i> Error!</h4>
          Este artículo no está en el depósito seleccionado.
      </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error1" style="display: none">
          <h4><i class="icon fa fa-ban"></i> Error!</h4>
          NO HAY INSUMOS SUFICIENTES
      </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-success" id="error2" style="display: none">
          <h4></h4>
          HAY INSUMOS SUFICIENTES
      </div>
  </div>
</div>

<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Informe de Servicio</h3>
          <?php
            //if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 250px; margin-top: 10px;" id="listadoOT">Ver Listado Ordenes de Trabajo</button>';
            echo '<button class="btn btn-block btn-primary" style="width: 250px; margin-top: 10px;" id="listado">Ver Listado de Informes de servicio</button>';

            //echo '<button class="btn btn-block btn-primary" id="imprimir" style="width: 250px; margin-top: 10px;" id="listado">Imprimir</button>';
            
            //}
          ?>
        </div><!-- /.box-header -->

        <div class="box-body">
          
          <!-- form  -->
          <form class="form-horizontal" role="form" id="form_order" action="" accept-charset="utf-8">

            <!--  ORDEN SERVICIO  -->
            <div class="row">             
              <div class="col-xs-12 col-sm-6">
                <label for="numSolic">Número de OT</label>
                <input class="form-control numSolic form_equipos" name="numSolic" id="numSolic" value="<?php echo $id_ot;?>" disabled/>
              </div>
              <div class="col-xs-12 col-sm-6">
                <label for="causa">Descripción de la Tarea</label>
                <input type="text" name="causa" class="form-control causa form_equipos" id="causa" value="<?php echo $causa;?>" disabled>
              </div>
              <div class="col-xs-12 col-sm-6">
                <label for="fecha">Fecha</label>
                <input type="text" name="fecha" class="form-control fecha" id="fechaOrden" disabled>
              </div>
              <input type="hidden" name="id_ordenservicio" class="id_ordenservicio" id="id_ordenservicio" value="<?php echo $id_solicitudServicio;?>">
              <input type="hidden" name="id_ot" class="id_ot" id="id_ot" value="<?php echo $id_ot;?>">
              <input type="hidden" name="id_equipoSolic" class="id_equipoSolic" id="id_equipoSolic" value="<?php echo $id_eq; ?>">
            </div>
            <br>

            <!--  EQUIPOS  -->
            <div class="panel panel-default">
              <div class="panel-heading">
                <span class="fa fa-cogs icotitulo"></span> Datos de Equipo
              </div>

              <div class="panel-body">
                <div class="row">                  

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="nomEquipo">Nombre Equipo</label>
                    <input type="text" name="nomEquipo" class="form-control nomEquipo form_equipos" id="nomEquipo" value="" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="descEquipo">Descripción</label>
                    <input type="text" name="descEquipo" class="form-control descEquipo form_equipos" id="descEquipo" value="" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="estado">Estado</label>
                    <input type="text" name="estado" class="form-control estado form_equipos" id="estado" value="" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="sector">Sector</label>
                    <input type="text" name="sector" class="form-control sector form_equipos" id="sector" value="" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="grupo">Grupo</label>
                    <input type="text" name="grupo" class="form-control grupo form_equipos" id="grupo" value="" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="ubicacion">Ubicación</label>
                    <input type="text" name="ubicacion" class="form-control ubicacion form_equipos" id="ubicacion" value="" disabled>
                  </div>                
                </div>
              </div><!-- end .panel-body -->
            </div><!--  / <div class="panel panel-default"> -->   

            <!-- TABS -->
            <!-- Nav tabs -->
            <ul class="nav nav-tabs nav-justified" role="tablist">
              <li role="presentation" class="active"><a href="#lecturaTab" aria-controls="lecturaTab" role="tab" data-toggle="tab">Lecturas</a></li>
              <li role="presentation"><a href="#tar" aria-controls="tar" role="tab" data-toggle="tab">Tareas</a></li>
              <li role="presentation"><a href="#herramientas" aria-controls="herramientas" role="tab" data-toggle="tab">Herramientas</a></li>
              <li role="presentation"><a href="#rrhh" aria-controls="rrhh" role="tab" data-toggle="tab">Recursos Humanos</a></li> 
              <li role="presentation"><a href="#insumosPed" aria-controls="insumosPed" role="tab" data-toggle="tab">Insumos </a></li>       
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
              <div role="tabpanel" class="tab-pane active" id="lecturaTab">
                <!--  LECTURAS REALIZADAS  -->
                <div class="panel panel-default">
                  <div class="panel-heading"><span class="fa fa-file-text-o icotitulo" aria-hidden="true"></span> Lecturas Realizadas
                  </div>
                  <div class="panel-body">
                    
                    <input type="hidden" name="id-comp" class="id-comp" id="id-comp" value="" disabled>
                    <div class="row">
                      <div class="col-xs-12 col-sm-6">
                        <label for="lectura_inicio">Horómetro inicio <strong style="color: #dd4b39">*</strong> :</label>
                        <input type="number" class="form-control Horómetro_inicio" name="lectura_inicio" id="lectura_inicio" step="any" lang="en-150" placeholder="">
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <label for="fecha_inicio">Fecha inicio <strong style="color: #dd4b39">*</strong> :</label>
                        <input type="text" class="form-control fecha_inicio" id="fecha_inicio" value="" placeholder="">
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <label for="lectura_fin">Horómetro fin <strong style="color: #dd4b39">*</strong> :</label>
                        <input type="number" class="form-control lectura_fin" name="lectura_fin" id="lectura_fin" step="any" lang="en-150" placeholder="">
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <label for="fecha_fin">Fecha fin <strong style="color: #dd4b39">*</strong> :</label>
                        <input type="text" class="form-control fecha_fin" id="fecha_fin" value="" placeholder="">
                      </div>
                    </div>
                    <br><br>

                  </div><!-- end .panel-body -->
                </div><!-- end .panel-default -->
              </div><!-- end .tabpanel -->

              <div role="tabpanel" class="tab-pane" id="tar">
                <!--  TAREAS REALIZADAS  -->
                <div class="panel panel-default">
                  <div class="panel-heading"><span class="fa fa-file-text-o icotitulo" aria-hidden="true"></span> Tareas Realizadas
                  </div>
                  <div class="panel-body">
                    
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="alert alert-danger alert-dismissable" id="errorTareas" style="display: none">
                          <h4><i class="icon fa fa-ban"></i> Error!</h4>
                          Revise que todos los campos obligatorios de las tareas realizadas estén seleccionados.
                        </div>
                      </div>
                    </div>

                    <input type="hidden" name="id-comp" class="id-comp" id="id-comp" value="" disabled>
                    <div class="row">
                      <div class="col-xs-12">
                        <label for="tareas">Tarea <strong style="color: #dd4b39">*</strong> :</label>
                        <input type="text" class="form-control tareas" name="tareas" id="tareas" placeholder="Ingrese tarea realizada">
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xs-12">
                        <br>
                        <button type="button" class="botones btn btn-primary" onclick="armarTablaTareas()">Agregar</button>
                      </div>

                    </div>

                    <div class="row">
                      <div class="col-xs-12">
                        <hr>
                        <div class="row">
                          <div class="col-xs-12">
                            <div class="alert alert-danger alert-dismissable" id="errorTable" style="display: none">
                              <h4><i class="icon fa fa-ban"></i> Error!</h4>
                              Agregue al menos una tarea.
                            </div>
                          </div>
                        </div>
                        <table class="table table-condensed table-responsive" id="tablalistareas">
                          <thead>
                            <tr>
                              <th>Acciones</th>
                              <th>Tareas</th>
                            </tr>
                          </thead>
                          <tbody></tbody>
                        </table>
                      </div>
                      <br/><br/>
                    </div>
                  </div><!-- end .panel-body -->
                </div><!-- end .panel-default -->
              </div><!-- end .tabpanel -->

              <div role="tabpanel" class="tab-pane" id="herramientas">
                <!--  ORDEN DE HERRAMIENTAS  -->
                <div class="panel panel-default">
                  <div class="panel-heading"><span class="fa fa-file-text-o icotitulo" aria-hidden="true"></span> Orden de Herramientas</div>
                  <div class="panel-body">
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="alert alert-danger alert-dismissable" id="errorHerramientas" style="display: none">
                          <h4><i class="icon fa fa-ban"></i> Error!</h4>
                          Revise que todos los campos obligatorios de las Herramientas estén seleccionados.
                        </div>
                      </div>
                    </div>

                    <input type="hidden" name="id-comp" class="id-comp" id="id-comp" value="">
                    <input type="hidden" name="herrId" class="herrId" id="herrId" value="" placeholder="">
                    <div class="row">
                      <div class="col-xs-12 col-sm-6 col-md-4">
                        <label for="herramienta">Herramienta <strong style="color: #dd4b39">*</strong> :</label>
                        <input type="text" class="form-control herramienta" id="herramienta" name="herramienta" value="" placeholder="Buscar...">
                      </div>
                      <div class="col-xs-12 col-sm-6 col-md-4">
                        <label for="marcaherram">Marca <strong style="color: #dd4b39">*</strong> :</label>
                        <input type="text" class="form-control marcaherram" id="marcaherram" name="marcaherram" value="" placeholder="" disabled>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-md-4">
                        <label for="codherram">Código <strong style="color: #dd4b39">*</strong> :</label>
                        <input type="text" class="form-control codherram" id="codherram" name="codherram" value="" placeholder="" disabled>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xs-12">
                        <br>
                        <button type="button" class="botones btn btn-primary" onclick="armartablistherr()">Agregar</button>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xs-12">
                        <hr>
                        <table class="table table-condensed table-responsive tablalistherram" id="tablalistherram">
                          <thead>
                            <tr>
                              <th>Acciones</th>
                              <th>Herramienta</th>
                              <th>Marca</th>
                              <th>Código</th>
                            </tr>
                          </thead>
                          <tbody>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div><!-- end .tabpanel -->

              <div role="tabpanel" class="tab-pane" id="rrhh">
                <!--  ORDEN DE RECURSOS HUMANOS  -->
                <div class="panel panel-default">
                  <div class="panel-heading"><span class="fa fa-file-text-o icotitulo" aria-hidden="true"></span> Orden de Recursos Humanos</div>

                  <div class="panel-body">
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="alert alert-danger alert-dismissable" id="errorRRHH" style="display: none">
                          <h4><i class="icon fa fa-ban"></i> Error!</h4>
                          Revise que todos los campos obligatorios de Recursos Humanos estén seleccionados.
                        </div>
                      </div>
                    </div>

                    <input type="hidden" class="id-Operario" id="id-Operario" value="">
                    <div class="row">
                      <div class="col-xs-12">
                        <label for="responsable">Responsable<strong style="color: #dd4b39">*</strong> :</label>
                        <input type="text" class=" form-control responsable" id="responsable" name="responsable" value="<?php echo $nom_responsable;?>" disabled> 
                        <input type="" value="<?php echo $idresponsable;?>" id="id_responsable" name="id_responsable">
                      </div>
                      <div class="col-xs-12 col-sm-6 col-md-4">
                        <label for="operario">Apellido y Nombre <strong style="color: #dd4b39">*</strong> :</label>
                        <input type="text" class=" form-control operario" id="operario" name="operario" value="" placeholder="Buscar...">
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xs-12">
                        <br>
                        <button type="button" class="botones btn btn-primary" onclick="armarTablaRecursos()">Agregar</button>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xs-12">
                        <hr>
                        <table class="table table-condensed table-responsive tabModRecursos" id="tabModRecursos">
                          <thead>
                            <tr>
                              <th>Acciones</th>
                              <th>Apellido y Nombre</th>                           
                            </tr>
                          </thead>
                          <tbody>
                            
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div><!-- end .panel-default -->
              </div><!-- end .tabpanel -->

              <div role="tabpanel" class="tab-pane" id="insumosPed">
                <!--  INSUMOS PEDIDOS  -->
                <div class="panel panel-default">
                  <div class="panel-heading"><span class="fa fa-file-text-o icotitulo" aria-hidden="true"></span> Insumos Usados
                  </div>
                  <div class="panel-body">
                    
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="alert alert-danger alert-dismissable" id="errorTareas" style="display: none">
                          <h4><i class="icon fa fa-ban"></i> Error!</h4>
                          Revise que todos los campos obligatorios de las tareas realizadas estén seleccionados.
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xs-12">
                        <hr>
                        <div class="row">
                          <div class="col-xs-12">
                            <div class="alert alert-danger alert-dismissable" id="errorTable" style="display: none">
                              <h4><i class="icon fa fa-ban"></i> Error!</h4>
                              Agregue al menos una tarea.
                            </div>
                          </div>
                        </div>
                        <table class="table table-condensed table-responsive" id="tablalistinsumos">
                          <thead>
                            <tr>
                              <th>Nº O.Insumo</th>
                              <th>Fecha</th>
                              <th>Solicitante</th>
                              <th>Código</th>
                              <th>Descripción</th>
                              <th>Cantidad</th>
                            </tr>
                          </thead>
                          <tbody></tbody>
                        </table>
                      </div>
                      <br/><br/>
                    </div>
                  </div><!-- end .panel-body -->
                </div><!-- end .panel-default -->
              </div><!-- end .tabpanel -->
              
            </div>
          </form>      

          <div class="pull-right">
            <button type="button" class="botones btn btn-primary" onclick="enviarOrden()">Guardar</button> 
          </div>           

        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->


<script>
// Datepicker 
$("#fechaOrden").datepicker({
  dateFormat: 'yy-mm-dd',
  firstDay: 1
}).datepicker("setDate", new Date());

//datetimepicker
$( "#fecha_inicio, #fecha_fin" ).datetimepicker({
  format: 'YYYY-MM-DD H:mm:ss',
  locale: 'es',
});

//va listado de OTs
$("#listadoOT").click(function (e) {
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/listOrden/<?php echo $permission; ?>");
  WaitingClose();
});

//va a listado de nota de pedido
$("#listado").click(function (e) {
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Ordenservicio/index/<?php echo $permission; ?>");
  WaitingClose();
});

// Trae datos de equipo
var id_eq = $("#id_equipoSolic").val(); 
$.ajax({
  'data' : { id_equipo:id_eq },
  'async': true,
  'type': "POST",
  'global': false,
  'dataType': 'json',
  'url': "ordenservicio/getEquipo",
  'success': function (data) {
    //console.table(data);
    $("#nomEquipo").val(data.nomb_equipo);              
    $("#descEquipo").val(data.desc_equipo);
    $("#estado").val(data.estado);
    $("#marca").val(data.marca);
    $("#sector").val(data.sector);
    $("#ubicacion").val(data.ubicacion)
    $("#fecha_ingreso").val(data.fecha_ingreso);
    $("#fecha_baja").val(data.fecha_baja);
    $("#fecha_garantia").val(data.fecha_garantia);                 
    $("#grupo").val(data.grupo_desc);
    //$("#contratista").val(data.contratista);
    //$("#id_contratista").val(data.id_contratista);
  }
});

// Llenar tabla tareas
var regTar = 0;              // variable incrementable en func, para diferenciar los inputs
function armarTablaTareas(){ // inserta valores de inputs en la tabla 
  var tareas       = $("#tareas").val();

  var hayError = false;
  if (tareas == '') {
    hayError = true;
  }

  if(hayError == true){
     $('#errorTareas').fadeIn('slow');
     $('#tar').tab('show');
     return;
  }
  else{
    $('#errorTareas').fadeOut('slow');
    $('#errorTarea').fadeOut('slow');
    //agrego valores a la tabla
    $('#tablalistareas').DataTable().row.add( [
        "<i class ='fa fa-ban elirow text-primary' style='cursor:pointer'></i>",
        tareas
      ]
    ).draw();

    //limpio formulario
    $('#tareas').val('');
  }
}

// elimina fila de la tabla listareas
$(document).on("click",".elirow",function(){
  $('#tablalistareas').DataTable().row( $(this).closest('tr') ).remove().draw();
});  

// Trae herramientas
var dataH = function () {
  var tmp = null;
  $.ajax({
    'async': false,
    'type': "POST",
    'global': false,
    'dataType': 'json',
    'url': "ordenservicio/getHerramienta",
    'success': function (data) {
        tmp = data;
    }
  });
  return tmp;
}();
$("#herramienta").autocomplete({
  //autoFocus: true,
  delay: 300,
  minLength: 1,
  source: dataH,
  focus: function(event, ui) {
    // prevent autocomplete from updating the textbox
    event.preventDefault();
    // manually update the textbox
    $(this).val(ui.item.label);
    $("#herrId").val(ui.item.herrId);
    $("#marcaherram").val(ui.item.value);
    $("#codherram").val(ui.item.codherram);
  },
  select: function(event, ui) {
    // prevent autocomplete from updating the textbox
    event.preventDefault();
    // manually update the textbox and hidden field
    $(this).val(ui.item.label);
    $("#herrId").val(ui.item.herrId);
    $("#marcaherram").val(ui.item.value);
    $("#codherram").val(ui.item.codherram);
  },
  change: function (event, ui) {
    if (!ui.item) {
      this.value = '';
      $("#herrId").val("");
      $("#marcaherram").val("");
      $("#codherram").val("");
    }
  }
});

//Llenar tabla herramientas
function armartablistherr() {   // inserta valores de inputs en la tabla 
  var herrId      = $("#herrId").val();
  var herramienta = $("#herramienta").val();
  var marcaherram = $("#marcaherram").val();
  var codherram   = $("#codherram").val(); 

  var hayError = false;
  if (herramienta == '') {
    hayError = true;
  }

  if(hayError == true){
     $('#errorHerramientas').fadeIn('slow');
     return;
  }
  else{
    $('#errorHerramientas').fadeOut('slow');
    //agrego valores a la tabla
    $('#tablalistherram').DataTable().row.add( [
        "<i class ='fa fa-ban elirow text-primary' id='delFileH' style='cursor:pointer'></i>",
        herramienta,
        marcaherram,
        codherram
      ]
    ).node().id = herrId;
    $('#tablalistherram').DataTable().draw();

    //limpio formulario
    $('#herramienta').val('');
    $('#marcaherram').val('');
    $('#codherram').val('');
  }
}

//elimina fila de la tabla listareas
$(document).on("click","#delFileH",function(){
  $('#tablalistherram').DataTable().row( $(this).closest('tr') ).remove().draw();
});


// Trae Operarios
var dataO = function () {
  var tmp = null;
  $.ajax({
    'async': false,
    'type': "POST",
    'global': false,
    'dataType': 'json',
    'url': "ordenservicio/getOperario",
    'success': function (data) {
        tmp = data;
    }
  });
  return tmp;
}();
$("#operario").autocomplete({
  autoFocus: true,
  delay: 300,
  minLength: 1,
  source: dataO,
  /*focus: function(event, ui) {
    // prevent autocomplete from updating the textbox
    event.preventDefault();
    // manually update the textbox
    $(this).val(ui.item.label);
    $("#id-Operario").val(ui.item.value);
  },*/
  select: function(event, ui) {
    // prevent autocomplete from updating the textbox
    event.preventDefault();
    // manually update the textbox and hidden field
    $(this).val(ui.item.label);                  
  },
  /*open: function( event, ui ) {
    $("#ui-id-3").css('z-index',1050);
  },*/
  change: function (event, ui) {
    if (!ui.item) {
      this.value = '';
    }
  }
});

// Llenar tabla operario
function armarTablaRecursos() {   // inserta valores de inputs en la tabla 
  var operarioId = $("#id-Operario").val();
  var operario = $("#operario").val();

  var hayError = false;
  if (operario == '') {
    hayError = true;
  }

  if(hayError == true){
     $('#errorRRHH').fadeIn('slow');
     return;
  }
  else{
    $('#errorRRHH').fadeOut('slow');
    //agrego valores a la tabla
    $('#tabModRecursos').DataTable().row.add( [
        "<i class ='fa fa-ban elirow text-primary' id='delRRHH' style='cursor:pointer'></i>",
        operario
      ]
    ).node().id = operarioId;
    $('#tabModRecursos').DataTable().draw();

    //limpio formulario
    $('#operario').val('');
  }
}

getRRHHOrdenTrabajo();
function getRRHHOrdenTrabajo(){
  var idOT = $('#numSolic').val();
  $.ajax({
    'data' : { idOT:idOT },
    'async': false,
    'type': "POST",
    'global': false,
    'dataType': 'json',
    'url': "Ordenservicio/getRRHHOrdenTrabajo",
    'success': function (data) {
        var recursos = data['recursos'];
        for(i = 0; i < recursos.length; i++) {
          var idRRHH = recursos[i].value;
          var nameRRHH = recursos[i].label;
          $('#tabModRecursos').DataTable().row.add( [
          "<i class ='fa fa-ban elirow text-primary' id='delRRHH' style='cursor:pointer'></i>",
          nameRRHH
            ]
          ).node().id = idRRHH;
          $('#tabModRecursos').DataTable().draw();
        }    
    },
    'error': function(){
      //alert('Fallo la carga de RRHH...');
    }
    
  });
}


getInsumos();
function getInsumos(){

  var id_ot = $("#numSolic").val(); 
  $.ajax({
    data: { id_ot:id_ot },
    async: true,
    type: "POST",
    global: false,
    dataType: 'json',
    url: "Ordenservicio/getInsumosPorOT",
    success: function (data) { 

        tabla = $('#tablalistinsumos').DataTable();
        tabla.clear().draw();

        for(i = 0; i < data.length; i++) {
          
          var otNro = data[i]['nroOT'];
          var fecha = data[i]['fecha'];
          var solicitante = data[i]['nombre'] + ' '+ data[i]['apellido'];
          var codigo = data[i]['codigo'];
          var descripcion = data[i]['descripcion'];
          var cantidad = data[i]['cantidad'];
          //agrego valores a la tabla
          $('#tablalistinsumos').DataTable().row.add( [            
            otNro,
            fecha,
            solicitante,
            codigo,
            descripcion, 
            cantidad             
          ] );
          $('#tablalistinsumos').DataTable().draw();        
        }   
    },
    error: function(data){

    }
  });

}


// elimina fila de la tabla listareas
$(document).on("click","#delRRHH",function(){
  $('#tabModRecursos').DataTable().row( $(this).closest('tr') ).remove().draw();
});



//guardar orden de servicio
function enviarOrden() {
  var hayError = false;
  var hayError2 = false;
  var hayError3 = false;
  /*if ($('#numSolic').val() == '') {// nro de OT
    hayError = true;
  }*/
  if ($('#lectura_inicio').val() == '') {// nro de OT
    hayError3 = true;
  }
  if ($('#lectura_fin').val() == '') {// nro de OT
    hayError3 = true;
  }
  if ($('#fecha_inicio').val() == '') {// nro de OT
    hayError3 = true;
  }
  if ($('#fecha_fin').val() == '') {// nro de OT
    hayError3 = true;
  }
  
  if( ! $('#tablalistareas').DataTable().data().any() ) {
      console.info("tabla tarea vacia");
      hayError2 = true;
  }
  if(hayError3 == true){
    $('#error3').fadeIn('slow');
    activaTab('lecturaTab');
    return;
  }
  if(hayError2 == true) {
    $('#errorTable').fadeIn('slow');
    activaTab('tar');
    return;
  }
  else {
    $('#error').fadeOut('slow');
    $('#error2').fadeOut('slow');
    $('#errorTable').fadeOut('slow');

    // tarea 
    var tarea = new Array(); 
    var j = 0;
    $("#tablalistareas tbody tr").each(function (index) {
        var act = new Array();
        //var id_tarea = $(this).attr('id');
        var i = 0;
        $(this).children("td").each(function (index2) {
          if (index2) {
            act[i] = $(this).text();
            i++;
          }
        });
        //act[0]=id_tarea;
        tarea[j] = act;
        j++;
    });
    //console.table(tarea);

    // herramienta 
    var herramienta = new Array(); 
    var j = 0;
    $("#tablalistherram tbody tr").each(function (index) {
        var act = new Array();
        var id_herramienta = $(this).attr('id');
        var i = 0;
        $(this).children("td").each(function (index2) {
          if (index2) {
            act[i] = $(this).text();
            i++;
          }
        });
        act[i]=id_herramienta;
        herramienta[j] = act;
        j++;
    });
    console.table(herramienta);

    // operario 
    var operario = new Array(); 
    var j = 0;
    $("#tabModRecursos tbody tr").each(function (index) {
        var act = new Array();
        var id_operario = $(this).attr('id');
        var i = 0;
        $(this).children("td").each(function (index2) {
          if (index2) {
            act[i] = $(this).text();
            i++;
          }
        });
        act[i]=id_operario;
        operario[j] = act;
        j++;
    });
    //console.table(operario);

    //datosInfoServicio
    var datosInfoServicio = {
      'id_equipo'              : $("#id_equipoSolic").val(),
      'fecha'                  : $("#fechaOrden").val(),
      //'comprobante'            : $("#comprobante").val(),
      //'id_contratista'         : $("#id_contratista").val(),
      'id_solicitudreparacion' : $("#id_ordenservicio").val(),           
      'id_ot'                  : $("#id_ot").val(),
      'horometro_inicio'       : $("#lectura_inicio").val(),
      'horometro_fin'          : $("#lectura_fin").val(),
      'fecha_inicio'           : $("#fecha_inicio").val(),
      'fecha_fin'              : $("#fecha_fin").val(),
    };
    //console.log( "horometro_inicio: " + horometro_inicio );
    //console.table( datosInfoServicio );

    WaitingOpen('Guardando cambios');
    
    $.ajax({
      data: {datosInfoServicio:datosInfoServicio, 
              tarea:tarea,  
              operario:operario, 
              herramienta:herramienta},
      type: 'POST',
      dataType: 'json',
      url: 'index.php/Ordenservicio/setOrdenServ',
      success: function(result){
        WaitingClose();
        cargarView('Ordenservicio', 'index', '<?php echo $permission ?>');
      },
      error: function(result){
        console.error("Error en guardado...");
        console.table(result);
        WaitingClose();
      },
    });
  }
}

//activa el tab= tab
function activaTab(tab){
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
};

// datatables 
/* ajusto el anocho de la cabecera de la tabla */
$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    // https://datatables.net/reference/api/columns.adjust() states that this function is trigger on window resize
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
});

$('#tablalistareas, #tablalistherram').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
    "columnDefs": [ {
      "targets": [ 0 ], 
      "searchable": false
    },
    {
      "targets": [ 0 ], 
      "orderable": false
    } ],
    "order": [[0, "asc"]],
});


</script>
