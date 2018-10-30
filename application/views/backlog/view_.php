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
          <h3 class="box-title">Programación Backlog</h3>
          <?php
            if (strpos($permission,'Add') !== false) {
              echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="listado">Ver Listado</button>';
            }
            ?>
          </div><!-- /.box-header -->
          <div class="box-body">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del equipo</h3>
              </div>

              <div class="panel-body">
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="equipo">Equipos <strong style="color: #dd4b39">*</strong></label>
                    <select  id="equipo" name="equipo" class="form-control" />
                    <!-- <input type="hidden" id="id_equipo" name="id_equipo">-->
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="fecha_ingreso">Fecha:</label>
                    <input type="text" id="fecha_ingreso" name="fecha_ingreso" class="form-control input-md" disabled />
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="marca">Marca:</label>
                    <input type="text" id="marca" name="marca" class="form-control input-md"  disabled />
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="ubicacion">Ubicación:</label>
                    <input type="text" id="ubicacion" name="ubicacion" class="form-control input-md" disabled/>
                  </div>

                  <div class="col-xs-12">
                    <label for="descripcion">Descripción: </label>
                    <textarea class="form-control" id="descripcion" name="descripcion" disabled></textarea>
                  </div> 

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="codigo_componente">Código de componente-equipo :</label>
                    <input type="text" id="codigo_componente" name="codigo_componente" class="form-control input-md" placeholder="Ingrese código de componente"/>
                    <input type="hidden" id="idcomponenteequipo" name="idcomponenteequipo" value=""/>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="descrip_componente">Descripción de componente:</label>
                    <input type="text" id="descrip_componente" name="descrip_componente" class="form-control input-md"  disabled />
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="sistema_componente">Sistema:</label>
                    <input type="text" id="sistema_componente" name="sistema_componente" class="form-control input-md"  disabled />
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
                    <label for="tarea">Tarea <strong style="color: #dd4b39">*</strong>:</label>
                    <select id="tarea" name="tarea" value="" class="form-control" >
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xs-12 col-sm-6">
                    <label for="vfecha">Fecha:</label>
                    <input type="text" class="datepicker form-control fecha" id="fecha" name="vfecha" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>" size="27"/>                         
                  </div>

                  <div class="col-xs-12 col-sm-6">
                    <label for="back_duracion">Duración (minutos)<strong style="color: #dd4b39">*</strong>:</label>
                    <input type="text" class="form-control" id="back_duracion" name="back_duracion" />
                  </div>                         
                </div><!-- /.row -->
              </div>
            </div>
          </div>

          <div class="modal-footer">
            <!-- <button type="button" class="btn btn-danger btn-sm delete" onclick="limpiar()">Cancelar</button> -->
            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardar()">Guardar</button>
          </div>
        </div>
      </div>
    </div>
</section>

<script>
  
var codhermglo  = "";
var codinsumolo = "";
var preglob     = "";
  
//carga listado backlog(desde boton) - Chequeado
$('#listado').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Backlog/index/<?php echo $permission; ?>");
    WaitingClose();
});

$(".datepicker").datepicker({
    changeMonth: true,
    changeYear: true
});

// trae info de equipo por id para completar los campos - Chequeado
$('#equipo').change(function(){
  var id_equipo = $(this).val();
  $.ajax({
    data: { id_equipo:id_equipo },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Backlog/getInfoEquipo',
    success: function(data){
      //console.table(data);
      var fecha_ingreso = data[0]['fecha_ingreso']; 
      var marca         = data[0]['marca']; 
      var ubicacion     = data[0]['ubicacion']; 
      var criterio1     = data[0]['criterio1']; 
      var descripcion   = data[0]['descripcion']; 
      $('#fecha_ingreso').val(fecha_ingreso);       
      $('#marca').val(marca);   
      $('#descripcion').val(descripcion);       
      $('#ubicacion').val(ubicacion);
      refrescarAutocompletar();
      $('#codigo_componente').val("");
      $('#descrip_componente').val("");
      $('#sistema_componente').val("");
    },
    error: function(result){
      console.error("Error al traer info de equipo.");
      console.table(result);
    },
  });   
});

$("#fecha").datepicker({
  format: 'dd/mm/yy',
  startDate: '-3d'
  //firstDay: 1
}).datepicker("setDate", new Date());


// Trae equipos llena select - Chequeado
traer_equipo();
function traer_equipo(){
  $('#equipo').html('');
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Backlog/getequipo', //index.php/
      success: function(data){
             
               var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                $('#equipo').append(opcion); 
              for(var i=0; i < data.length ; i++) 
              {    
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
}

// Trae tareas llena select - Chequeado
traer_tarea();
function traer_tarea(){
  $('#tarea').html(''); 
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Backlog/gettarea', //index.php/
      success: function(data){
             
                var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                  $('#tarea').append(opcion); 
                for(var i=0; i < data.length ; i++) { 

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
  });/*/
  $("#codigo_componente").autocomplete({
    source: dataC,
    delay: 100,
    minLength: 1,
    focus: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox
      $(this).val(ui.item.label);
      $('#descrip_componente').val(ui.item.descrip);
      $('#sistema_componente').val(ui.item.sistema);
    },
    select: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox and hidden field
      $(this).val(ui.item.value);//label
      $('#descrip_componente').val(ui.item.descrip);
      $('#sistema_componente').val(ui.item.sistema);               
    },
  });*/
}

// Carga lista de backlog - Chequeado
function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Backlog/index/<?php echo $permission; ?>");
    WaitingClose();
}

// Guarda Backlog - Chequeado
function guardar(){     
  var idComponenteEquipo = $('#idcomponenteequipo').val();
  var equipo = $('#equipo').val();
  var tarea  = $('#tarea').val();       
  var fecha  = $('#fecha').val();
  var horas  = $('#back_duracion').val();  
  console.log("Estoy guardando");

  if(equipo > 0 && tarea !=='' && horas !=='' ){
    
      $.ajax({
          type: 'POST',
          data: {
            idce:idComponenteEquipo,
            equipo:equipo, 
            tarea:tarea,  
            fecha:fecha, 
            horas:horas
          },
          url: 'index.php/Backlog/guardar_backlog', 
          success: function(data){
                 
                  console.log("exito");   
                  cargarVista();               
                },
          error: function(result){
                  console.log(result);              
                },
          dataType: 'json'        
      });    
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
