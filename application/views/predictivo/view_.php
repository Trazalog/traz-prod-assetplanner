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
        <h3 class="box-title">Programación Predictivo</h3>
        <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="listado">Ver Listado</button>';
          }
          ?>
        </div><!-- /.box-header -->
        
        <div class="box-body">

          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del equipo </h3>
            </div>

            <div class="panel-body">
              <div class="row">
                <div class="col-xs-12 col-sm-6 com-md-4">
                  <label for="equipo">Equipos <strong style="color: #dd4b39">*</strong></label>
                  <select  id="equipo" name="equipo" class="form-control" />
                </div>
                <div class="col-xs-12 col-sm-6 com-md-4">
                  <label for="fecha_ingreso">Fecha:</label>
                  <input type="text" id="fecha_ingreso"  name="fecha_ingreso" class="form-control input-md" disabled />
                </div>
                <div class="col-xs-12 col-sm-6 com-md-4">
                  <label for="marca">Marca:</label>
                  <input type="text" id="marca"  name="marca" class="form-control input-md"  disabled />
                </div>
                <div class="col-xs-12 col-sm-6 com-md-4">
                  <label for="ubicacion">Ubicacion:</label>
                  <input type="text" id="ubicacion"  name="ubicacion" class="form-control input-md" disabled/>
                </div>
                <div class="col-xs-12">
                  <label for="descripcion">Descripcion: </label>
                  <textarea class="form-control" id="descripcion" name="descripcion" disabled></textarea>
                </div> 
              </div>
            </div>
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title"><span class="fa fa-building-o"></span> Programación</h4>
            </div>

            <div class="panel-body"> 
              <div class="row">
                <div class="col-xs-12 col-sm-6">
                  <label for="tarea">Tarea <strong style="color: #dd4b39">*</strong>:</label>
                  <select id="tarea" name="tarea" class="form-control"   />
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="vfecha">Fecha:</label>
                  <input type="text" class="datepicker form-control fecha" id="fecha" name="vfecha" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>" size="27"/>
                </div> 
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="periodo">Periodo:                       </label>
                  <select id="periodo" name="periodo" class=" selectpicker form-control">
                    <!-- -->
                  </select>
                </div> 
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="cantidad">Frecuencia <strong style="color: #dd4b39">*</strong>:</label>
                  <input type="text" class="form-control" id="cantidad" name="cantidad"/>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="duracion">Duración <strong style="color: #dd4b39">*</strong>:</label>
                  <input type="text" class="form-control" id="duracion" name="duracion"/>
                </div> 
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="unidad">U. de tiempo <strong style="color: #dd4b39">*</strong></label>
                  <select  id="unidad" name="unidad" class="form-control" />
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="cantOper">Cant. Operarios <strong style="color: #dd4b39">*</strong>:</label>
                  <input type="text" class="form-control" id="cantOper" name="cantOper"/>
                </div>
                <div class="col-xs-12">
                  <button type="button" class="btn btn-primary" onclick="calcularHsHombre()"style="margin-top: 19px;">Calcular</button>
                </div>
                <div class="col-xs-12" id="dato"></div> 
              </div>
            </div>
          </div>
      
        </div><!-- /.box-body -->

        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="limpiar()">Cancelar</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardar()">Guardar</button>
        </div>
      </div>
    </div>
  </div>
</section>

<script> 

$('#listado').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Predictivo/index/<?php echo $permission; ?>");
    WaitingClose();
});

$(".datepicker").datepicker({
    
    changeMonth: true,
    changeYear: true
});

// Trae equipos por empresa logueada - Chequeado
$(function() {  
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Predictivo/getEquipo', 
      success: function(data){
             
               var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                $('#equipo').append(opcion); 
                for(var i=0; i < data.length ; i++){    
                    var nombre = data[i]['codigo'];
                    var opcion  = "<option value='"+data[i]['id_equipo']+"'>" +nombre+ "</option>" ;
                    $('#equipo').append(opcion);                                    
                }
              },
      error: function(result){
            
              console.log(result);
            },
          dataType: 'json'
      });
});

// Trae info de equipos por ID - Chequeado 
$('#equipo').change(function(){        
  var id_equipo = $(this).val();
  $.ajax({
      type: 'POST',
      data: { id_equipo: id_equipo},
      url: 'index.php/Predictivo/getInfoEquipo', 
      success: function(data){    
                  console.log(data);                     
                  var fecha_ingreso = data[0]['fecha_ingreso']; 
                  var marca = data[0]['marca']; 
                  var ubicacion = data[0]['ubicacion']; 
                  var criterio1 = data[0]['criterio1']; 
                  var descripcion = data[0]['descripcion']; 
                  $('#fecha_ingreso').val(fecha_ingreso);       
                  $('#marca').val(marca);   
                  $('#descripcion').val(descripcion);       
                  $('#ubicacion').val(ubicacion);  
              },        
      error: function(result){
                    
              console.log(result);
            },
      dataType: 'json'
  });    
});

// Trae tareas por empresa logueada - Chequeado
$(function(){  
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Predictivo/getTarea', 
    success: function(data){
           
            var opcion  = "<option value='-1'>Seleccione...</option>" ; 
            $('#tarea').append(opcion); 
            for(var i=0; i < data.length ; i++){    
                  var nombre = data[i]['descripcion'];
                  var opcion  = "<option value='"+data[i]['id_tarea']+"'>" +nombre+ "</option>" ; 
                $('#tarea').append(opcion);                                
            }
          },
    error: function(result){
          
          console.log(result);
        },
        dataType: 'json'
  });
});    

// Trae unidades de tiempo - Chequeado
$(function(){  
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Predictivo/getUnidTiempo', 
    success: function(data){
           
            var opcion  = "<option value='-1'>Seleccione...</option>" ; 
            $('#unidad').append(opcion); 
            for(var i=0; i < data.length ; i++){    
                  var nombre = data[i]['unidaddescrip'];
                  var opcion  = "<option value='"+data[i]['id_unidad']+"'>" +nombre+ "</option>" ; 
                $('#unidad').append(opcion);                                
            }
          },
    error: function(result){
          
          console.log(result);
        },
        dataType: 'json'
  });
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

// Calcula horas hombre por tiempo y unidades
function calcularHsHombre(){
  
  var entrada = $('#duracion').val();
  var unidad = $('#unidad').val();
  var operarios = $('#cantOper').val();
  var hs = 0;
  var hsHombre = 0;
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
  var mens=$("<h4 class='before'>HH: <span class='hh'>" + hsHombre + "</span></h4>");
 // var mens=$("<input class='before' value='"+ hsHombre +"' style='border:none;'/>");
  $('#dato').html(mens);
  //alert("horas hombre: " + hsHombre);  
}

// Carga Lista predicitivos - Chequeado
function cargarVista(){
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Predictivo/index/<?php echo $permission; ?>");
  WaitingClose();
}

// Guarda Predictivo - Chequeado
function guardar(){    
 
  console.log("guardando");
  var equipo = $('#equipo').val();
  var tarea = $('#tarea').val();        // Guarda id de tarea en tarea_descrip
  var fecha = $('#fecha').val();        // Fecha actual de creacion de la tarea
  var periodo = $('#periodo').val();    // diario siempre (especie de tiempo)  
  var cantidad = $('#cantidad').val();  // Frecuencia (cantidad de dias)  
  var horash = $('#dato h4 span.hh').html(); // cantidad de horas hombre
  var duracion = $('#duracion').val();  // Duracion de la tarea en minutos(guarda en pred_duracion)
  var unidad = $('#unidad').val();      // id de unidad de tiempo
  var operarios = $('#cantOper').val(); // Cantidad de operarios(guarda en pred_canth)

  if((fecha !=='') || (cantidad !=='') || (duracion !=='') || (cantOper !=='') || (equipo > 0) || (tarea > 0) || (unidad > 0) || (periodo > 0 )){
    $.ajax({
          type: 'POST',
          data: { equipo: equipo, 
                  tarea: tarea, 
                  fecha: fecha,
                  periodo: periodo,  
                  cantidad: cantidad,
                  horash:horash, 
                  duracion: duracion,
                  unidad: unidad,
                  operarios: operarios
                },
          url: 'index.php/Predictivo/guardar_predictivo',  
          success: function(data){
            console.log("exito");   
            cargarVista();
          },
          error: function(result){
            console.log(result);                     
          },
          dataType: 'json'
    });
  } else{
      var hayError = true;
      $('#error').fadeIn('slow');
      return;
  }

  if(hayError == false){
    $('#error').fadeOut('slow');
  }

}

function limpiar(){
  
  $("#equipo").val("");
  $("#tarea").val("");
  $("#fecha").val("");
  $("#periodo").val("");
  $("#cantidad").val("");   

}
    
$("#fecha").datepicker({
  dateFormat: 'dd/mm/yy',
  firstDay: 1
}).datepicker("setDate", new Date());

</script>
