<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Backlog</h3>
          <?php
          //if (strpos($permission,'Add') !== false) {
          ?>
          <button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;"  id="btnAgre" >Agregar</button>
          <? 
          // }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="sales" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Nº Backlog</th>
                <th>Equipo</th>
                <th>Componente</th>
                <th>Sistema</th>
                <th>Tarea</th>
                <th>Fecha</th>
                <th>Duración (min)</th>
              </tr>
            </thead>
            <tbody>
              <?php        
                foreach($list['data'] as $a){
                  if ($a['estado'] == 'C') {
                    $id  = $a['backId'];
                    $ide = $a['id_equipo'];
                    echo '<tr id="'.$id.'" class="'.$ide.'">';
                      echo '<td>';                     
                        if (strpos($permission,'Add') !== false) {
                          echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar" data-toggle="modal" data-target="#modalaviso"></i>';
                          echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar" ></i>';
                          if ($a['back_adjunto']) {
                            echo '<a href="'.base_url().'assets/filesbacklog/'.$a['back_adjunto'].'" target="_blank"><i class="fa fa-file-pdf-o text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Ver Pdf"></i></a>';
                          }                          
                        }                     
                      echo '</td>';
                      echo '<td>'.$a['backId'].'</td>';
                      echo '<td>'.$a['codigo'].'</td>';
                      echo '<td>'.$a['componente'].'</td>';
                      echo '<td>'.$a['sistema'].'</td>';
                      echo '<td>'.$a['de1'].'</td>';
                      echo '<td>'.date_format(date_create($a['fecha']), 'd-m-Y').'</td>';
                      //echo '<td>'.$a['horash'].'</td>'; 
                      echo '<td>'.$a['back_duracion'].'</td>';                   
                    echo '</tr>';
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

$(document).ready(function(event) {

  edit=0;  datos=Array();
  $('#btnAgre').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Backlog/cargarback/<?php echo $permission; ?>");
    WaitingClose();
  });

  //Eliminar - Chequeado
  $(".fa-times-circle").click(function (e) {                  
    var idpre = $(this).parent('td').parent('tr').attr('id');
    console.log("ESTOY ELIMINANDO , el id de back es:");
    console.log(idpre);
    gloid=idpre;                                
  });    

  //Editar - Busca los datos de backlog por id - Chequeado
  $(".fa-pencil").click(function (e) {     

    $('#limpiar').val('');  // limpia los inputs del modal editar 
    $('#modalSale').modal('show'); // levanta el modal 

    var idpred = $(this).parent('td').parent('tr').attr('id');  // id de backlog
    var ide = $(this).parent('td').parent('tr').attr('class');  // ide de equipo
    console.log("Id de Backlog: " + idpred);
    datos = parseInt(ide);   //parsea a int para sacar el resto de las clases.    

    $.ajax({
        type: 'GET',
        data: { idpred:idpred, datos:datos},
        url: 'index.php/Backlog/geteditar',
        success: function(data){
                    
                    console.table(data);                  
                    datos={ 'codigo':data['equipo'][0]['codigo'],
                            'marca':data['equipo'][0]['marca'],
                            'descripcion':data['equipo'][0]['des'],   
                            'fecha_ingreso':data['equipo'][0]['fecha_ingreso'],
                            'idtarea': data['equipo'][0]['id_tarea'],
                            'tarea': data['equipo'][0]['tarea_descrip'],
                            'fecha':data['datos'][0]['fecha'],
                            'desta':data['equipo'][0]['de1'],
                            'hora':data['equipo'][0]['horash'],
                            'ubicacion':data['equipo'][0]['ubicacion'],
                            'duracion' :data['datos'][0]['back_duracion'],
                            'sistema' :data['equipo'][0]['sistema'],
                            'componente' :data['equipo'][0]['componente'],
                            'codcompeq' :data['equipo'][0]['codcompeq'],
                            'backId': idpred              
                          };
                    completarEdit(datos); 
                  },        
        error: function(result){
              
                console.log(result);
              },
        dataType: 'json'
    });
  });  

  // $(".datepicker").datepicker({
      
  //     changeMonth: true,
  //     changeYear: true
  // });

  $('#sales').DataTable({
    "aLengthMenu": [ 10, 25, 50, 100 ],
    "columnDefs": [ {
      "targets": [ 0 ], 
      "searchable": false
    },
    {
      "targets": [ 0 ], 
      "orderable": false
    } ],
    "order": [[1, "asc"]],
  });

});

//Eliminar - Chequeado     
function eliminarpred(){

  var idpre = $(this).parent('td').parent('tr').attr('id');
  $.ajax({
    type: 'POST',
    data: { gloid: gloid},
    url: 'index.php/Backlog/baja_backlog', 
    success: function(data){    
            
            Refrescar1();
          },      
    error: function(result){
          alert('Error en la operación eliminar...');
          console.log(result);
        },
    dataType: 'json'
  });
}

// Completa los campos con datos de backlpog - Chequeado
function completarEdit(datos){   
  
  var fecha= new Date(datos['fecha']);
  var day = getFormattedPartTime(fecha.getDate() + 1);
  var month = getFormattedPartTime(fecha.getMonth() + 1);
  var year = fecha.getUTCFullYear();
  var fechater = day + '-' + (month) + '-' + year;

  $("#equipo").val(datos['codigo']);
  $("#id_backlog").val(datos['backId']);
  $('#fecha_ingreso').val(datos['fecha_ingreso']);
  $('#marca').val(datos['marca']);
  $('#ubicacion').val(datos['ubicacion']);
  $('#descripcion').val(datos['descripcion']);
  $('#tarea').val(datos['tarea']);
  $('#fecha').val(fechater);
  $('#periodo').val(datos['periodo']);
  $('#horash').val(datos['duracion']); 
  $('#sistema_componente').val(datos['sistema']); 
  $('#descrip_componente').val(datos['componente']); 
  $('#codigo_componente').val(datos['codcompeq']); 
}
  
function getFormattedPartTime(partTime) {
 
  if (partTime<10)
    return "0"+partTime;
  return partTime;
}

// Guarda Backlog Editado - Chequeado
function guardar(){
    
    var backid = $('#id_backlog').val();
    var tarea = $('#tarea').val();
    var fecha = $('#fecha').val();
    var duracion = $('#horash').val();  //duracion de la tarea(minutos)
    console.log("estoy editando");

    $.ajax({
      type: 'POST',
      data: { backid:backid,
              tarea:tarea, 
              fecha:fecha,
              duracion:duracion },
      url: 'index.php/Backlog/editar_backlog', 
      success: function(data){
                $('#modalSale').modal('hide');
                console.log(data);
                console.log("exito");
                Refrescar();                     
              },
      error: function(result){
            
            console.log(result);
            console.log("Entre por el error");
            //$('#modalSale').modal('hide');
          },
      dataType: 'json'
      });
}

// trae equipo para llenar select en edicion
traer_equipo();
function traer_equipo(){
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Backlog/getequipo', //index.php/
      success: function(data){
             
                   // var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                   //  $('#equipo').append(opcion); 
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
}

// trae tareas para llenar select en edicion
traer_tarea();
function traer_tarea(){
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Backlog/gettarea', //index.php/
      success: function(data){
             
               var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                $('#tarea').append(opcion); 
              for(var i=0; i < data.length ; i++) 
              {    
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



function Refrescar(){

  $('#content').empty();
  $('#modalSale').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Backlog/index/<?php echo $permission; ?>");
  WaitingClose();
  WaitingClose();
}
function Refrescar1(){

  $('#content').empty();
  // $('#modalSale').empty();
  // $('#modalaviso').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Backlog/index/<?php echo $permission; ?>");
  // WaitingClose();
   WaitingClose();
}
 
</script>
<!-- Datepicker -->
<script>     
  // $("#fecha").datepicker({
  //  // format: 'dd/mm/yy',
  //   //format: 'yy/mm/dd',
  //   startDate: '-3d'
  //   //firstDay: 1
  // }).datepicker("setDate", new Date());


  $("#fecha").datepicker();
</script>


<!-- Modal Editar -->
<div class="modal fade" id="modalSale" tabindex="2000" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span class="fa fa-fw fa-pencil"></span> Backlog</h4> 
      </div>

      <div class="modal-body" id="modalBodySale">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del Equipo</h3>
          </div>
     
          <div class="panel-body">
            <div class="row">
              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="equipo">Equipos <strong style="color: #dd4b39">*</strong></label>
                <!-- <select id="equipo" name="equipo" value="" class="form-control" ></select> -->
                <input id="equipo" name="equipo" value="" class="form-control limpiar" disabled>
                <input type="hidden" id="id_backlog" name="id_backlog">
              </div>

              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="fecha_ingreso">Fecha:</label>
                <input type="text" id="fecha_ingreso" name="fecha_ingreso" class="form-control limpiar input-md" disabled />
              </div>

              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="marca">Marca:</label>
                <input type="text" id="marca" name="marca" class="form-control limpiar input-md"  disabled />
              </div>

              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="ubicacion">Ubicacion:</label>
                <input type="text" id="ubicacion" name="ubicacion" class="form-control limpiar input-md" disabled/>
              </div>

              <div class="col-xs-12">
                <label for="descripcion">Descripcion: </label>
                <textarea class="form-control limpiar" id="descripcion" name="descripcion" disabled></textarea>
              </div>

              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="codigo_componente">Código de componente-equipo :</label>
                <input type="text" id="codigo_componente" name="codigo_componente" class="form-control input-md" placeholder="Ingrese código de componente" disabled/>
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
            <h4 class="panel-title">Programación</h4>
          </div>
          <div class="panel-body">
            <div class="row">
              <div class="col-xs-12">
                <label for="tarea">Tarea <strong style="color: #dd4b39">*</strong>:</label>
                <select id="tarea" name="tarea" value="" class="form-control limpiar" >
                </select>                              
              </div>
              <div class="col-xs-12 col-sm-6">
                <label for="vfecha">Fecha:</label>
                <!-- <input type="text" class="datepicker  form-control limpiar fecha" id="fecha" name="vfecha" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>" size="27"/> -->
                <input type="text" class="form-control limpiar fecha" id="fecha" name="vfecha" size="27"/>
              </div>
              <!--<div class="col-xs-12 col-sm-6">
              <label for="horash">Horas.H:</label>
                <input type="text" class="form-control limpiar" id="horash" name="horash" />                         
              </div> -->  
              <div class="col-xs-12 col-sm-6">
                <label for="horash">Duración (minutos):</label>
                <input type="text" class="form-control limpiar" id="horash" name="horash" />
              </div>                       
            </div><!-- /.row -->
          </div><!-- /.panel-body -->
        </div><!-- /.panel -->

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" id="reset" data-dismiss="modal" onclick="guardar()">Guardar</button>
        </div>
      </div>
    </div>
   </div>
</div>

<!-- Modal Precaucion Eliminar -->
<div class="modal fade" id="modalaviso">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" ><span class="fa fa-fw fa-times-circle" style="color:#A4A4A4"></span>  Eliminar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" >&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <center>
        <h4><p>¿ DESEA ELIMINAR BACKLOG ?</p></h4>
        </center>
      </div>
      <div class="modal-footer">
        <center>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarpred()">SI</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
        </center>
      </div>
    </div>
  </div>
</div>


