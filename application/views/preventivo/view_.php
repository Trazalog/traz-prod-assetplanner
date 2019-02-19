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
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Preventivo</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="listado">Ver Listado</button>';
          }
          ?>
        </div><!-- /.box-header -->

        <div class="box-body">
          <form id="formPreventivo" role="form" action="<?php base_url();?>Preventivo/guardar_preventivo" method="POST" >
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title"><div class="fa fa-cogs"></div> Datos del Equipo</h3>
              </div>                  

              <div class="panel-body">
                <div class="row">
                  <div class="col-xs-12 col-sm-4">Equipos <strong style="color: #dd4b39">*</strong>
                    <select  id="equipo" name="id_equipo" class="form-control" />
                    <!-- <input type="hidden" id="id_equipo" name="id_equipo">-->
                  </div>
                </div><!-- /.row -->
                <div class="row">
                  <div class="col-xs-12 col-sm-4">Fecha:
                    <input type="text" id="fecha_ingreso" name="" class="form-control input-md" disabled />
                  </div>
                  <div class="col-xs-12 col-sm-4">Marca:
                    <input type="text" id="marca" name="" class="form-control input-md"  disabled />
                  </div>
                  <div class="col-xs-12 col-sm-4">Ubicación:
                    <input type="text" id="ubicacion" name="" class="form-control input-md" disabled/>
                  </div>
                  <div class="col-xs-12">Descripción: 
                    <textarea class="form-control" id="descripcion" name="" disabled></textarea>
                  </div>
                </div> <!-- /.row -->
              </div> <!-- panel-body -->                    
            </div><!-- panel-default -->

            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><div class="fa fa-building-o"></div> Programación</h4>
              </div><!-- /.panel-heading -->

              <div class="panel-body">
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-4">Tarea <strong style="color: #dd4b39">*</strong>:
                    <input type="text" id="tarea" name="tarea" class="form-control">
                    <input type="hidden" id="id_tarea" name="id_tarea">
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">Componente <strong style="color: #dd4b39">*</strong>:
                    <select id="componente" name="id_componente" class="form-control input-md"   />
                    <!--<input type="hidden" id="id_componente" name="id_componente" />-->
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">Fecha Base:
                    <input type="text" class="form-control ultimo" id="ultimo" name="ultimo" value="<?php echo date("Y-m-d"); ?>" size="27"/>
                  </div> 
                  <div class="col-xs-12 col-sm-6">Periodo <strong style="color: #dd4b39">*</strong>:
                    <select id="periodo" name="periodo" class=" selectpicker form-control input-md">
                    </select>
                  </div>
                  <div class="col-xs-12 col-sm-6">Frecuencia <strong style="color: #dd4b39">*</strong>:
                    <input type="text"  id="cantidad" name="cantidad" class="form-control input-md" placeholder="Ingrese valor"/>
                  </div>
                  <div class="col-xs-12 col-sm-6">Lectura base <strong style="color: #dd4b39">*</strong>:
                    <input type="text"  id="lectura_base" name="lectura_base" class="form-control input-md" placeholder="Ingrese valor" disabled/>
                  </div>
                  <div class="col-xs-12 col-sm-6">Alerta <strong style="color: #dd4b39">*</strong>:
                    <input type="text"  id="alerta" name="alerta" class="form-control input-md" placeholder="Ingrese valor" disabled/>
                  </div>
                </div> <!-- /.row -->
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-4">Duración <strong style="color: #dd4b39">*</strong>:
                    <input type="text" class="form-control" id="duracion" name="duracion"/>
                  </div> 
                  <div class="col-xs-12 col-sm-6 col-md-4">U. de tiempo <strong style="color: #dd4b39">*</strong>
                    <select  id="unidad" name="unidad" class="form-control" />
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">Cant. Operarios <strong style="color: #dd4b39">*</strong>:
                    <input type="text" class="form-control" id="cantOper" name="cantOper"/>
                  </div>          
                  <div class="col-xs-12" id="dato" name="" style="margin-top: 19px;"></div>
                  <input type="hidden" name="hshombre" id="hshombre">
                </div><!-- /.row -->
              </div><!-- /.panel-body -->
            </div><!-- /.panel-default -->

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

                  <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Guardar</button>
                  </div> 
                </div><!-- /.nav-tabs-custom -->
              </div>
            </div> <!-- /.row -->
          </form>
        </div> <!-- box-body --> 
      </div> <!-- box -->    
    </div> <!-- col-xs-12 -->  
  </div>  <!-- row -->        
</section>

<script>
// Volver al listado
$('#listado').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Preventivo/index/<?php echo $permission; ?>");
    WaitingClose();
});



$('#ultimo').datetimepicker({
  format: 'YYYY-MM-DD', 
  locale: 'es',
});



// Trae equipos
WaitingOpen("Cargando Equipos...");
$.ajax({
  data: { },
  dataType: 'json',
  url: 'index.php/Preventivo/getequipo',
  type: 'POST',
})
.done( (data) => {
  let opcion  = "<option value='-1'>Seleccione...</option>" ;
  $('#equipo').append(opcion);
  for(let i=0; i < data.length ; i++){
    let nombre = data[i]['codigo'];
    let opcion  = "<option value='"+data[i]['id_equipo']+"'>" +nombre+ "</option>";
    $('#equipo').append(opcion);
  }
})
.fail( () => alert("Error al traer Equipos.") )
.always( () => WaitingClose() );




// Trae componente segun equipo seleccionado
function traer_componente(id_equipo){
  $('#componente').html("");
  $.ajax({
    async:false,
    type: 'POST',
    data: {id_equipo:id_equipo },
    dataType: 'json',
    url: 'index.php/Preventivo/getcomponente',
    success: function(data){
      //console.log(data);
      $('#componente option').remove();
      if(data == false){
        //alert("El equipo no tiene componentes");
        var opcion = "<option value='-1'>No tiene componente asociado</option>" ; 
      } else {
        var opcion = "<option value='-1'>Seleccione...</option>" ; 
      }
      $('#componente').append(opcion); 
      for(var i=0; i < data.length ; i++){    
        var nombre = data[i]['descripcion'];
        var opcion  = "<option value='"+data[i]['id_componente']+"'>" +nombre+ "</option>" ;
        $('#componente').append(opcion);                                  
      }                         
    },
    error: function(result){              
      console.log(result);
    },
  });
}

// Trae equipo seleccionado y llama fcion para traer sus componentes
$('#equipo').change(function(){
  WaitingOpen("Cargando datos de Equipo...");
  var id_equipo = $(this).val();
  $.ajax({
    type: 'POST',
    data: { id_equipo: id_equipo},
    dataType: 'json',
    url: 'index.php/Preventivo/getEquipoNuevoPrevent', 
  })
  .done( (data) => {
    var fecha_ingreso = data[0]['fecha_ingreso']; 
    var marca         = data[0]['marca']; 
    var ubicacion     = data[0]['ubicacion']; 
    var criterio1     = data[0]['criterio1']; 
    var descripcion   = data[0]['descripcion']; 
    $('#fecha_ingreso').val(fecha_ingreso);       
    $('#marca').val(marca);   
    $('#descripcion').val(descripcion);       
    $('#ubicacion').val(ubicacion);  
    
    traer_componente(id_equipo); 
  })
  .fail( () => alert("Error al traer Equipos.") )
  .always( () => WaitingClose() );
});



//Trae tareas y permite busqueda en el input
var dataTarea = function() {
  var tmp = null;
  $.ajax({
    'async': false,
    'type': "POST",
    'dataType': 'json',
    'url': 'index.php/Preventivo/gettarea',
  })
  .done( (data) => { tmp = data } )
  .fail( () => alert("Error al traer tareas") );
  return tmp;
}();
$("#tarea").autocomplete({
  source:    dataTarea,
  delay:     500,
  minLength: 1,
  focus: function(event, ui) {
    event.preventDefault();
    $(this).val(ui.item.label);
    $('#id_tarea').val(ui.item.value);
  },
  select: function(event, ui) {
    event.preventDefault();
    $(this).val(ui.item.label);
    $('#id_tarea').val(ui.item.value);
  },
});



// Trae periodo y llena select
traer_periodo();
function traer_periodo(periodoId){
  if (periodoId === undefined) {
    periodoId = null;
  }
  $('#periodo').html(""); 
  $.ajax({
    data: {periodoId:periodoId },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Calendario/getperiodo',
    success: function(data){
      var opcion = "<option value='-1'>Seleccione...</option>" ; 
      $('#periodo').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre   = data[i]['descripcion'];
        var selected = (periodoId == data[i]['idperiodo']) ? 'selected' : '';
        var opcion   = "<option value='"+data[i]['idperiodo']+"' " +selected+ "'>" +nombre+ "</option>" ; 
        $('#periodo').append(opcion);                        
      }
    },
    error: function(result){  
      console.log(result);
    },
  });
}



//Habilita lectura base y alerta si el periodo es horas ó ciclos
$('#periodo').change(function(){
  //alert('hola');
  let optionText = $('#periodo option:selected').text().toLowerCase();
  console.info( optionText );
  if( optionText=='horas' || optionText=='ciclos' ) { //horas=5 ciclos=6
    $('#alerta').prop('disabled', false);
    $('#lectura_base').prop('disabled', false);
  } else {
    $('#alerta').prop('disabled', 'disabled');
    $('#lectura_base').prop('disabled', 'disabled');
  }
});



// Trae unidades de tiempo y llena select
$('#unidad').html("");
$.ajax({
  type: 'POST',
  data: { },
  url: 'index.php/Predictivo/getUnidTiempo', 
  success: function(data){
    var opcion  = "<option value='-1'>Seleccione...</option>" ; 
    $('#unidad').append(opcion); 
    for(var i=0; i < data.length ; i++){    
      var nombre = data[i]['unidaddescrip'];
      var opcion = "<option value='"+data[i]['id_unidad']+"'>" +nombre+ "</option>" ; 
      $('#unidad').append(opcion);                                
    }
  },
  error: function(result){
    console.log(result);
  },
  dataType: 'json'
});



// Calcula horas hombre por tiempo y unidades
function calcularHsHombre(){
  var entrada   = $('#duracion').val();
  var unidad    = $('#unidad').val();
  var operarios = $('#cantOper').val();
  var hs        = 0;
  var hsHombre  = 0;
  //minutos
  if (unidad == 1) {
    hs = entrada / 60;
  }
  // horas
  if (unidad == 2) {
    hs = entrada;
  }
  // dias
  if (unidad == 3) {
    hs = entrada * 24;
  }

  hsHombre = hs * operarios;
  hsHombre = Math.round(hsHombre * 100) / 100;
  var mens = $("<h4 name='hshombre' class='before'>HH: <span class='hh'>" + hsHombre + "</span></h4>");
  $('#dato').html(mens);
  $('#hshombre').val(hsHombre);
}

// Calcula hs hombre si están los 3 parametros y cambia alguno de ellos
$('#duracion, #unidad, #cantOper').change(function(){
  if( $('#duracion').val()!="" && $('#unidad').val()!="-1" && $('#cantOper').val()!="")
    calcularHsHombre();
});



// Vuelve a la vista de listado de preventivos
function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Preventivo/index/<?php echo $permission; ?>");
    WaitingClose();
}



// Guarda Preventivo  
$("#formPreventivo").submit(function (event){   
  event.preventDefault();  

  var equipo   = $('#equipo').val();
  var tarea    = $('#tarea').val();
  var compon   = $('#componente').val();
  var periodo  = $('#periodo').val();
  var freq     = $('#cantidad').val();
  var lectbase = $('#lectura_base').val();
  var alerta   = $('#alerta').val();
  var duracion = $('#duracion').val();
  var unidad   = $('#unidad').val();
  var oper     = $('#cantOper').val();
  var hh       = $('#hshombre').val();

  if((periodo=='horas') || (periodo=='ciclos')){
    if ((lectbase < 0)||(alerta < 0)) {
      $('#error').fadeIn('slow');
    }
  }
  if ((equipo < 0)||(tarea < 0)||(periodo < 0)||(unidad < 0)||(duracion == "")||(freq == "")||(oper == "")||(hh == "")) {
      $('#error').fadeIn('slow');
  }
  else{
    $('#error').fadeOut('slow');
    var formData = new FormData($("#formPreventivo")[0]);
    $.ajax({
      url:$("form").attr("action"),
      type:$("form").attr("method"),
      data:formData,
      cache:false,
      contentType:false,
      processData:false,
      success:function(respuesta){
        //alert(respuesta);
        console.log('resp prenevt: ');
        console.log(respuesta.resPrenvent);
        if (respuesta) {
          //alert("Los datos han sido guardados correctamente");
          cargarVista();
        }
        else if(respuesta==="error"){
          alert("Los datos no se han podido guardar");
        }
        else{
          //$("#msg-error").show();
          //$(".list-errors").html(respuesta);
        }
      }
    });
  }
});











function ordenaArregloDeObjetosPor(propiedad) {  
  return function(a, b) {  
    if (a[propiedad] > b[propiedad]) {  
      return 1;  
    } else if (a[propiedad] < b[propiedad]) {  
      return -1;  
    }  
    return 0;  
  }  
} 
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









/*
  $(".datepicker").datepicker({
      changeMonth: true,
      changeYear: true
  });



  function limpiar(){
        $("#equipo").val("");
        $("#tarea").val("");
        $("#componente").val("");
        $("#periodo").val("");
        $("#cantidad").val("");
        $("#ultimo").val("");
        $("#critico1").val("");
        $("#cantidadhm").val("");
  }

  $("#fecha").datepicker({
      dateFormat: 'dd/mm/yy',
      firstDay: 1
  }).datepicker("setDate", new Date());
*/
</script>
