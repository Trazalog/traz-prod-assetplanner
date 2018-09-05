<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Predictivo</h3>          
            <button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;"  id="btnAgre" >Agregar</button> 
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="sales" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Equipo</th>
                <th>Tarea</th>
                <th>Fecha</th>
                <th>Periodo</th>
                <th>Cantidad</th>
                <th>Horas.H</th>
              </tr>
            </thead>
            <tbody>
              <?php
                if(count($list['data']) > 0){                  
                  foreach($list['data'] as $a){

                    if ($a['estado'] == "C") {
                      
                      $id  = $a['predId'];
                      $ide = $a['id_equipo'];

                      echo '<tr id="'.$id.'" class="'.$ide.'">';
                      echo '<td >';
                     
                      if (strpos($permission,'Add') !== false) {
                        echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar" data-toggle="modal" data-target="#modalaviso"></i>';
                        echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar" ></i>';
                      }     
                      echo '</td>';
                      echo '<td>'.$a['codigo'].'</td>';
                      echo '<td>'.$a['de1'].'</td>';
                      echo '<td>'.date_format(date_create($a['fecha']),'d-m-Y').'</td>';
                      echo '<td>'.$a['periodo'].'</td>';
                      echo '<td>'.$a['cantidad'].'</td>';
                      echo '<td>'.$a['horash'].'</td>'; 
                      echo '</tr>';
                    }                    
                  }
                } 
              ?>
            </tbody>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<script>

var gloid="";
var globi="";

$(document).ready(function(event) {

  edit=0;  datos=Array();
  $('#btnAgre').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Predictivo/cargarpredictivo/<?php echo $permission; ?>");
    WaitingClose();
  });

  //Eliminar
  $(".fa-times-circle").click(function (e) { 
                 
    var idpre = $(this).parent('td').parent('tr').attr('id');
    console.log("ESTOY ELIMINANDO , el id de predictivo es:");
    console.log(idpre);
    gloid=idpre;
                                
  });    
  //Editar
  $(".fa-pencil").click(function (e) { 
            
    $('#modalSale').modal('show');

    var idpred = $(this).parent('td').parent('tr').attr('id');
    var ide = $(this).parent('td').parent('tr').attr('class');
    console.log("Id de predictivo");
    console.log(idpred);

    //guardo id de predictivo en modal para editar 
    $('#id_Predictivo').val(idpred);

    //globi=idpred;
    console.log("Id de equipo");
    console.log(ide);  
    datos= parseInt(ide);
    console.log(datos); 

    $.ajax({
      type: 'POST',
      data: { idpred: idpred, datos:datos},
      url: 'index.php/Predictivo/getEditar', //index.php/
      success: function(data){             

              console.log(data);
              console.log("codigo");
              console.log(data['datos'][0]['tarea_descrip']);
              datos = {             
                        'id_equipo':data['datos'][0]['id_equipo'], 
                        'codigo':data['datos'][0]['codigo'],
                        'marca':data['datos'][0]['marca'],
                        'descripcion':data['datos'][0]['descripcion'],
                        'fecha_ingreso':data['datos'][0]['fecha_ingreso'],
                        'tarea': data['datos'][0]['tarea_descrip'],
                        'fecha':data['datos'][0]['fecha'],
                        'periodo':data['datos'][0]['periodo'],
                        'cantidad':data['datos'][0]['cantidad'], 
                        'duracion':data['datos'][0]['duracion'],
                        'unidtiempo':data['datos'][0]['unidtiempo'],
                        'operarios':data['datos'][0]['operarios'],
                        'hh':data['datos'][0]['hh']
                      };              
              completarEdit(datos);   
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

  $(".datepicker").datepicker({
      
      changeMonth: true,
      changeYear: true
  });

  $('#sales').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": true,
                "language": {
                      "lengthMenu": "Ver _MENU_ filas por página",
                      "zeroRecords": "No hay registros",
                      "info": "Mostrando página _PAGE_ de _PAGES_",
                      "infoEmpty": "No hay registros disponibles",
                      "infoFiltered": "(filtrando de un total de _MAX_ registros)",
                      "sSearch": "Buscar:  ",
                      "oPaginate": {
                          "sNext": "Sig.",
                          "sPrevious": "Ant."
                                  }
                            }
  });

}); 

// Calcula horas hombre por tiempo y unidades - Chequeado
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

// Completa modal con datos para editar - Chequeado     
function completarEdit(datos){
    
  $('#equipo').val(datos['codigo']);
  $('#id_equipo').val(datos['id_equipo']);
  $('#fecha_ingreso').val(datos['fecha_ingreso']);
  $('#marca').val(datos['marca']);
  $('#ubicacion').val(datos['ubicacion']);
  $('#descripcion').val(datos['descripcion']);
  $('#tarea').val(datos['tarea']);
  $('#fecha').val(datos['fecha']);
  $('#cantidad').val(datos['cantidad']);
  $('#periodo').val(datos['periodo']);  
  $('#duracion').val(datos['duracion']);
  $('#unidad').val(datos['unidtiempo']);
  $('#cantOper').val(datos['operarios']); 
  var mens=$("<h4 class='before'>HH: <span class='hh'>" + datos['hh'] + "</span></h4>");
  $('#dato').html(mens);
}

// Guarda Predictivo Editado
function guardar(){    
 
  console.log("guardando");
  var id_Pred = $('#id_Predictivo').val(); // Guarda id de predictivo
  var tarea = $('#tarea').val();        // Guarda id de tarea en tarea_descrip
  var fecha = $('#fecha').val();        // Fecha actual de creacion de la tarea
  var periodo = $('#periodo').val();    // diario siempre (especie de tiempo)  
  var cantidad = $('#cantidad').val();  // Frecuencia (cantidad de dias)  
  var horash = $('#dato h4 span.hh').html(); // cantidad de horas hombre
  var duracion = $('#duracion').val();  // Duracion de la tarea en minutos(guarda en pred_duracion)
  var unidad = $('#unidad').val();      // id de unidad de tiempo
  var operarios = $('#cantOper').val(); // Cantidad de operarios(guarda en pred_canth)

  if((fecha !=='') || (cantidad !=='') || (duracion !=='') || (cantOper !=='') || (tarea > 0) || (unidad > 0) || (periodo > 0 )){
    WaitingOpen("Guardando");

    $.ajax({
          type: 'POST',
          data: { id_Predictivo: id_Pred,
                  tarea: tarea, 
                  fecha: fecha,
                  periodo: periodo,  
                  cantidad: cantidad,
                  horash:horash, 
                  duracion: duracion,
                  unidad: unidad,
                  operarios: operarios
                },
          url: 'index.php/Predictivo/updatePredictivo',  
          success: function(data){
            console.log("exito");   
            Refrescar();
          },
          error: function(result){
            WaitingClose("Error en guardado...");
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

function eliminarpred(){

  //gloid vaariable que guarda el id de predictivo
  WaitingOpen("Eliminando Predictivo...");        
  $.ajax({
    type: 'POST',
    data: { idpre: gloid},
    url: 'index.php/Predictivo/baja_predictivo', 
    success: function(data){  
            console.log(data);  
            Refrescar();
          },      
    error: function(result){
          WaitingClose("Error eliminando predictivo...");     
          console.log(result);
        },
    dataType: 'json'
  });
}

function Refrescar(){

  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Predictivo/index/<?php echo $permission; ?>");
  WaitingClose('Cargando...');
}
  
</script>
<!-- Datepicker -->
<script>     
  $("#fecha").datepicker({
    Format: 'dd/mm/yy',
    startDate: '-3d'
    //firstDay: 1
  }).datepicker("setDate", new Date());
</script>

<!-- Modal Editar -->
<div class="modal fade" id="modalSale" tabindex="2000" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerro()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalActionSale" class="fa fa-fw fa-pencil text-light-blue"></span> Predictivo</h4> 
      </div>

      <div class="modal-body" id="modalBodySale">

        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del Equipo </h3>
          </div>

          <div class="panel-body">
            <div class="row">
              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="">Equipos <strong style="color: #dd4b39">*</strong></label>
                <input type="text" class="form-control input-md" id="equipo" name="equipo" disabled />
                <input type="hidden" id="id_equipo" name="id_equipo">
                <input type="hidden" id="id_Predictivo" name="id_Predictivo">
              </div>

              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="fecha_ingreso">Fecha:</label>
                <input type="text" id="fecha_ingreso"  name="fecha_ingreso" class="form-control input-md" disabled />
              </div>

              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="marca">Marca:</label>
                <input type="text" id="marca"  name="marca" class="form-control input-md"  disabled />
              </div>

              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="ubicacion">Ubicacion:</label>
                <input type="text" id="ubicacion"  name="ubicacion" class="form-control input-md" disabled/>
              </div>

              <div class="col-xs-12">
                <label for="descripcion">Descripcion:</label>
                <textarea class="form-control" id="descripcion" name="descripcion" disabled></textarea>
              </div>
            </div><!-- /.row -->
          </div><!-- /.panel-body -->
        </div><!-- /.panel -->

        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title fa fa-building-o">   Programación</h4>
          </div>

          <div class="panel-body">  
            <div class="row">
              <div class="col-xs-12">
                <label for="tarea">Tarea <strong style="color: #dd4b39">*</strong>:</label>
                <select id="tarea" name="tarea" class="form-control"   />                             
              </div> 
              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="vfecha">Fecha <strong style="color: #dd4b39">*</strong>:</label>
                <input type="text" class="datepicker form-control fecha" id="fecha" name="vfecha" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>" size="27"/>
              </div>                        
              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="periodo">Periodo <strong style="color: #dd4b39">*</strong>:</label>
                <select id="periodo"  name="periodo" class=" selectpicker form-control input-md" value="">
                  <!-- <option >Anual</option> -->
                  <option >Diario</option>
                  <!-- <option >Mensual</option>
                  <option >Periodos</option>
                  <option >Ciclos</option>
                  <option >Semestral</option> -->                                      
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
            </div><!-- /.row -->
          </div><!-- /.panel-body -->           
        </div><!-- /.panel -->

      </div><!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cerro()">Cancelar</button>
        <button type="button" class="btn btn-primary" id="reset" data-dismiss="modal" onclick="guardar()">Guardar</button>
      </div>
    </div>
  </div>
</div>

  <!-- Modal Eliminar Warning -->
  <div class="modal fade" id="modalaviso">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" ><span class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h4>¿Desea eliminar Predictivo?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarpred()">Eliminar</button>
      </div>
    </div>
  </div>
</div>


