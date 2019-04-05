<input type="hidden" id="permission" value="<?php echo $permission ?>">
<style>
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; }.datagrid table td, .datagrid table th { padding: 13px 20px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3B8BBA), color-stop(1, #45A4DB) );background:-moz-linear-gradient( center top, #3B8BBA 5%, #45A4DB 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3B8BBA', endColorstr='#45A4DB');background-color:#3B8BBA; color:#FAF2F8; font-size: 13px; font-weight: bold; border-left: 1px solid #A3A3A3; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #002538; font-size: 13px;border-bottom: 1px solid #E1EEF4;font-weight: normal; }.datagrid table tbody .alt td { background: #EBEBEB; color: #00273B; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }
</style>
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Orden de trabajo</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;"  data-toggle="modal" data-target="#modalagregar" id="btnAdd">Agregar</button>'; 
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
      

          <table id="otrabajo" class="table table-striped table-hover">
            <thead>
              <tr>
                <th></th>
                <th>Id Orden</th>
                <th>Fecha Inicio</th>
                <th>Fecha Entrega</th>
                <th>Fecha Terminada</th>
                <th>Detalle</th>
                <th>Equipo</th>
                <th>Origen</th>
                <th>Id Solicitud</th>
                <th>Asignado</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              <?php
              //dump_exit($list);
                if( $list!=false && count($list) > 0) 
                {
                  $userdata = $this->session->userdata('user_data');
                  $usrId    = $userdata[0]['usrId']; 
               	  foreach($list as $a)
                  {
                    $gr = $a['grpId'];
                    //echo "grupo: ".$gr;
                    if ($gr=='1') { 
                      if (($a['estado'] =='As') || ($a['estado'] =='P') || ($a['estado'] =='C') || $a['estado']=='Ej') {
                        $id          = $a['id_orden'];
                        $id_equipo   = $a['id_equipo'];
                        $causa       = $a['descripcion'];
                        $idsolicitud = $a['id_solicitud'];
                        echo '<tr id="'.$id.'" class="'.$id.' ot-row" data-id_equipo="'.$id_equipo.'" data-causa="'.$causa.'" data-idsolicitud="'.$idsolicitud.'">';
                        echo '<td>';
                        echo $opciones;
                        echo '</td>';
                        echo '<td>'.$a['id_orden'].'</td>';
                        $fecha_inicio = ($a['fecha_inicio'] == '0000-00-00 00:00:00') ? "0000-00-00" : date_format(date_create($a['fecha_inicio']), 'd-m-Y');
                        echo '<td>'.$fecha_inicio.'</td>';
                        $fecha_entrega = ($a['fecha_entrega'] == '0000-00-00 00:00:00') ? "0000-00-00" : date_format(date_create($a['fecha_entrega']), 'd-m-Y');
                        echo '<td>'.$fecha_entrega.'</td>';
                        $fecha_terminada = ($a['fecha_terminada'] == '0000-00-00 00:00:00') ? "0000-00-00" : date_format(date_create($a['fecha_terminada']), 'd-m-Y');
                        echo '<td>'.$fecha_terminada.'</td>';
                        echo '<td>'.$a['descripcion'].'</td>';
                        // echo '<td">'.$a['cliLastName'].' , '.$a['cliName'].'</td>';
                        echo '<td>'.$a['codigo'].' </td>';
                        echo '<td>'.$a['tipoDescrip'].'</td>';
                        echo '<td>'.$a['id_solicitud'].'</td>';
                        echo '<td>'.$a['nombre'].'</td>';
                        echo '<td>'.($a['estado'] == 'C' ? '<small class="label pull-left bg-green">Curso</small>' : ($a['estado'] == 'P' ? '<small class="label pull-left bg-red">Pedido</small>' : '<small class="label pull-left bg-yellow">Asignado</small>')).'</td>';
      	                echo '</tr>';
        		          }
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
var sol_id;
$('.ot-row').on('click',function(){
  sol_id = $(this).data('idsolicitud');
});
// cargo plugin DateTimePicker
$('#fechaEntrega, #fecha_inicio1, #fecha_inicio, #fecha_entrega1, #fecha_entregaa').datetimepicker({
  format: 'YYYY-MM-DD H:mm:ss', //format: 'YYYY-MM-DD', // es igaul a campo date
  locale: 'es',
});

var iort  = "";
var ido   = "";
var idp   = "";
var idArt = 0;
var acArt = "";
var i     = "";
var idord = "";
var idfin = "";
var descrip = "";
// llena select de proveedores - Ok
traer_prov();
function traer_prov(){
  $.ajax({
    type: 'POST',
    data: {},
    url: 'index.php/Otrabajo/getproveedor',
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#prov').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['provnombre'];
        var opcion = "<option value='"+data[i]['provid']+"'>" +nombre+ "</option>" ; 
        $('#prov').append(opcion);                
      }
    },
    error: function(result){
      console.error("Error al traer proveedor. Ver console.table")
      console.table(result);
    },
    dataType: 'json'
  });
}

// llena el select de sucursales - Ok 
traer_sucursal()
function traer_sucursal(){
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Otrabajo/traer_sucursal',
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#suci').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['descripc'];
        var opcion = "<option value='"+data[i]['id_sucursal']+"'>" +nombre+ "</option>" ;
        $('#suci').append(opcion);        
      }
    },
    error: function(result){
      console.error("Error al traer sucursal. Ver console.table");
      console.table(result);
    },
    dataType: 'json'
  });
} 

// llena el select de equipos - Ok 
traer_equipo()
function traer_equipo(){
  $.ajax({
    data: { },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Otrabajo/getequipo',
    success: function(data){
      $('#equipo').empty();
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#equipo').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['codigo'];
        var opcion = "<option value='"+data[i]['id_equipo']+"'>" +nombre+ "</option>" ; 
        $('#equipo').append(opcion);             
      }
    },
    error: function(result){
      console.error("Error al traer equipos. Ver console.table");
      console.table(result);
    },
  });
}

// Limpia modales y regresa al listado de OTs - Ok test 
function regresa1(){
    $('#content').empty();
    $('#modalOT').empty();
    $('#modalAsig').empty(); //local index 
    $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/listOrden/<?php echo $permission; ?>");
    WaitingClose();
    //WaitingClose();
}

// Guarda una nueva OT - Ok
function guardaragregar(){
  console.log("Guardando OT...");
  
  var num           = $('#nro1').val();
  var fecha_entrega = $('#fechaEntrega').val();
  var descripcion   = $('#vsdetal').val();
  var sucursal      = $('#suci').val();
  var proveedor     = $('#prov').val();
  var equipo        = $('#equipo').val();;

  var hayError = false; 
  $('#error').hide();
  if($('#equipo').val() == '')
  {
    hayError = true;
  }
  if($('#fechaEntrega').val()=='' || $('#fechaEntrega').val()=='0000-00-00 00:00:00')
  {
    hayError = true;
  }
  if($('#suci').val() == '-1')
  {
    hayError = true;
  }
  if($('#prov').val() == '-1')
  {
    hayError = true;
  }
  if(hayError == true){
    $('#error').fadeIn('slow');     
    return;
  }

  $.ajax({
    type: 'POST', 
    data: {num:num, fecha_entrega:fecha_entrega, equipo:equipo, descripcion:descripcion, sucursal:sucursal, proveedor:proveedor},
    url: 'index.php/Otrabajo/guardar_agregar',
    success: function(data){
      //console.log(data);  
      $('#modalagregar').modal('hide');
      regresa1();
    },
    error: function(result){
      $('#modalagregar').modal('hide');
      console.error("Error al agregar nueva OT. Ver console.table");
      console.table(result);
    }
  });        
}

// Elimina OT (estado = AN) - Ok
function eliminarpred(){
  var idpre = $(this).parent('td').parent('tr').attr('id');
  console.log("Estoy por la opcion SI a eliminar")
  console.log(gloid);
          
  $.ajax({
    type: 'POST',
    data: { gloid: gloid},
    url: 'index.php/Otrabajo/baja_predictivo',
    success: function(data){
      regresa1();
    },
    error: function(result){
      console.error("Error al eliminar OT. Ver console.table");
      console.table(result);
    }
  });
}

// Trae datos para llenar el modal Editar OT - Ok
$(".fa-pencil").click(function(e) { 
  $("#modaleditar tbody").remove();
  var idord = $(this).parent('td').parent('tr').attr('id');
  idp = idord;
  //console.log("idp: "+idp);
  $.ajax({
    data: { idp:idp },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Otrabajo/getpencil',
    success: function(data){
      //console.table(data);
      datos = {
        'id_ot'         : data[0]['id_orden'],
        'nro'           : data[0]['nro'],
        'equipo'        : data[0]['codigo'],
        'id_equipo'     : data[0]['id_equipo'],
        'fecha_inicio'  : data[0]['fecha_inicio'],
        'fecha_entrega' : data[0]['fecha_entrega'],
        'idusuario'     : data[0]['id_usuario'],
        'nota'          : data[0]['descripcion'],
        'id_sucu'       : data[0]['id_sucursal'],
        'sucursal'      : data[0]['descripc'],
        'id_proveedor'  : data[0]['provid'],
        'nombreprov'    : data[0]['provnombre'],
      }
      completarEdit(datos);
    },
    error: function(result){
      console.error("Error al Editar OT. Ver console.table");
      console.table(result);
    },
  });
});

// completa los datos del modal Editar - Ok
function completarEdit(datos){
  //console.log("datos que llegaron: ");
  //console.table(datos);
  $('#nroedit').val(datos['nro']);
  traer_equipo2(datos['id_equipo']);
  $('#fecha_inicio1').val(datos['fecha_inicio']);
  $('#fecha_entrega1').val(datos['fecha_entrega']);
  $('#vsdetalleedit').val(datos['nota']);
  traer_sucursal2(datos['id_sucu']);
  traer_prov1(datos['id_proveedor']);
}

// llena select equipos en modal Editar OT - Ok
function traer_equipo2(id_equipo){
  $('#equipo1').empty();
  $.ajax({
    data: { },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Otrabajo/getequipo',
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#equipo1').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var selectAttr = '';
        if(data[i]['id_equipo'] == id_equipo) { var selectAttr = 'selected'; }
        var nombre = data[i]['codigo'];
        var opcion = "<option value='"+data[i]['id_equipo']+"' "+selectAttr+">" +nombre+ "</option>" ; 
        $('#equipo1').append(opcion);             
      }
    },
    error: function(result){
      console.error("Error al traer equipos. Ver console.table");
      console.table(result);
    },
  });
}

// llena select sucursales en modal Editar - Ok
function traer_sucursal2(id_sucursal){
  $('#sucidedit').text("");
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Otrabajo/traer_sucursal',
    success: function(data){
      for(var i=0; i < data.length ; i++) 
      {
        //console.info("i:"+data[i]['id_equipo']);
        var selectAttr = '';
        if(data[i]['id_sucursal'] == id_sucursal) { var selectAttr = 'selected';}
        var nombre = data[i]['descripc'];
        var opcion = "<option value='"+data[i]['id_sucursal']+"' "+selectAttr+">" +nombre+ "</option>";
        $('#sucidedit').append(opcion); 
      }
    },
    error: function(result){
      console.error("Error al traer sucursales en Editar OT");
      console.table(result);
    },
    dataType: 'json'
  });
}    

// llena select proveedores en modal Editar - Ok
function traer_prov1(id_proveedor){
  $('#prov1').text("");
  $.ajax({
    type: 'POST',
    data: {},
    url: 'index.php/Otrabajo/getproveedor',
    success: function(data){
      for(var i=0; i < data.length ; i++) 
      {
        //console.info("i:"+data[i]['id_equipo']);
        var selectAttr = '';
        if(data[i]['provid'] == id_proveedor) { var selectAttr = 'selected'; }
        var nombre = data[i]['provnombre'];
        var opcion = "<option value='"+data[i]['provid']+"' "+selectAttr+">" +nombre+ "</option>";
        $('#prov1').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
}

// Guarda Edicion de OT - Ok
function guardareditar(){
  //var id_orden      = $('#id_orden').val();
  var nro           = $('#nroedit').val();
  var fecha_inicio  = $('#fecha_inicio1').val();
  var fecha_entrega = $('#fecha_entrega1').val();
  var descripcion   = $('#vsdetalleedit').val();
  var id_sucu       = $('#sucidedit').val();
  var proveedor     = $('#prov1').val();
  var equipo        = $('#equipo1').val();
  //var equipo1       = $('#id_equipo1').val();
  var parametros = {
    //'id_orden'     : id_orden,
    'nro'           : nro,                                          
    'fecha_inicio'  : fecha_inicio,
    'fecha_entrega' : fecha_entrega,     
    'descripcion'   : descripcion,     
    'id_sucursal'   : id_sucu,                  
    'id_proveedor'  : id_sucu,                
    'id_equipo'     : equipo                    
  };

  var hayError = false; 
  $('#errorE').hide();

  console.info( $('#equipo1').val() );
  console.info( $('#fecha_inicio1').val() );
  console.info( fecha_entrega );
  console.info( $('#sucidedit').val() );
  console.info( $('#prov1').val() );

  if($('#equipo1').val() == '-1')
  {
    hayError = true;
  }
  if($('#fecha_inicio1').val()=='' || $('#fecha_inicio1').val()=='0000-00-00 00:00:00')
  {
    hayError = true;
  }
  if(fecha_entrega=='' || fecha_entrega=='0000-00-00 00:00:00')
  {
    hayError = true;
  }
  if($('#sucidedit').val() == '-1')
  {
    hayError = true;
  }
  if($('#prov1').val() == '-1')
  {
    hayError = true;
  }
  console.error( hayError );
  if(hayError == true){
    $('#errorE').fadeIn('slow');     
    return;
  }

  $.ajax({
    type: 'POST',
    data: {parametros:parametros, idp:idp},
    url: 'index.php/Otrabajo/guardar_editar',
    success: function(data){
      $('#modaleditar').modal('hide');
      regresa1();
    },
    error: function(result){
      console.error("Error al guardar en modal Editar Ot");
      console.table(result);
    }
  });
  
}

// Lleva a la pantalla Asignar Tareas - Ok (no revisé la asignación!!!)
function agregar_tareas(o) { 
  var id = $(o).closest('tr').attr('id');
  console.log("El id de OT es: "+id);
  iort = id;
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/cargartarea/<?php echo $permission; ?>/"+iort+"");
  WaitingClose();  
};

// Trae los datos a mostrar en el modal Asignar OT - Ok
function asigarOT_usuario(o) { 

  var id_orden = $(o).closest('tr').attr('id');  

  $.ajax({
    type: 'GET',
    data: { id_orden: id_orden},
    url: 'index.php/Otrabajo/getasigna', 
    success: function(data){
      datos = {
        'id_orden'     : id_orden,
        'nro'          : data['datos'][0]['nro'],
        'fecha_inicio' : data['datos'][0]['fecha_inicio'],
        'estado'       : data['datos'][0]['estado'],
        'descripcion'  : data['datos'][0]['descripcion'],
        'equipo'       : data['datos'][0]['codigo'],
        'id_usuario'   : data['datos'][0]['id_usuario'],
        'id_equipo'    : data['datos'][0]['id_equipo'],
        'equipoDescrip': data['datos'][0]['equipoDescrip'],
      };
      var arre = new Array();
      arre = datos['fecha_inicio'].split(' ');
      //var fe= date_format(date_create(arre[0]), 'd-m-Y');
      $('#id_orden').val(datos['id_orden']);
      $('#nro').val(datos['nro']);
      $('#descripcion').val(datos['descripcion']);
      $('#fecha_inicio').val(arre[0]); 
      $('#estado').val(datos['estado']);
      $('#equipo13').val(datos['equipo']);
      $('#equipo13').prop('title', datos['equipoDescrip']);
      $('#equipo13id').val(datos['id_equipo']);
      traer_usuario( datos['id_usuario'] ); 
      // click_pedent();
    },
    error: function(result){
      console.error("Error al ")
      console.table(result);
    },
    dataType: 'json'
  });
};


// 
function orden(){
  WaitingOpen();
  var id_orden = $('#id_orden').val();
  var fecha_entrega = $('#fecha_entrega').val();
  var usuario= $('#usuario1').val();
  var cliente = $('#id_cliente').val();
  var task_id = sessionStorage.getItem('task_id');
  var case_id = sessionStorage.getItem('case_id');
  
  console.log("Guardando>> OT: "+id_orden+" | SOID: "+sol_id+" | USER:"+usuario);

  $.ajax({
      type: 'POST',
      data: { id_orden:id_orden, fecha_entrega:fecha_entrega, usuario:usuario, sol_id:sol_id,case_id:case_id, task_id: task_id},
      url: 'index.php/Otrabajo/guardar', 
    

      success: function(data){
        WaitingClose();    
        sessionStorage.clear();
        regresa1();
        
      },
      error: function(result){
        WaitingClose();    
        console.log("ERROR>> "+result);
        
      }
  });              
}



  //cargar pedido
  $(".fa-tags").click(function (e) { 
    var id_orden = $(this).parent('td').parent('tr').attr('id');
    ido=id_orden; //aca esta el id de orden de trabajo
    console.log("El id de orden para la carga de pedido es :");
    console.log(ido);
    i=1;
    var opcion =i; 
    $('#num1').append(opcion);
    i=i+1; 
    traer_proveedor();
  });


    function mostrar_pedido(o) { 
    $("#modallista tbody tr").remove();
    var idorde = $(o).parent('td').parent('tr').attr('id');
    console.log("ID de orden de trabajo para mostrar pedido es: "+idorde);  
   
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Notapedido/getNotasxOT/<?php echo $permission; ?>/"+idorde+"");
    WaitingClose(); 
  };

  //guardar pedido
  $('#btnSave').click(function(){

      if(acArt == 'View')
      {
        $('#modalOT').modal('hide');
        return;
      }

      var hayError = false;
      if($('#nro').val() == '')
      {
        hayError = true;
      }

      if($('#vfech').val() == '')
      {
        hayError = true;
      }

      if($('#vsdetalle').val() == '')
      {
        hayError = true;
      }

      if($('#sucid').val() == '')
      {
        hayError = true;
      }

     


      $('#error').fadeOut('slow');
      WaitingOpen('Guardando cambios');
        $.ajax({
              type: 'POST',
              data: { 
                      id : idArt, 
                      act: acArt, 
                      nro: $('#nro').val(),
                      fech: $('#vfech').val(),
                      deta: $('#vsdetalle').val(),
                      sucid: $('#sucid').val(),
                      cli: $('#cliid').val()
                      
                    },
          url: 'index.php/Otrabajo/setotrabajo', 
          success: function(result){
                        WaitingClose();
                        //$('#modalOT').modal('hide');
                        //setTimeout("cargarView('otrabajos', 'index', '"+$('#permission').val()+"');",1000);
                        regresa1();
                },
          error: function(result){
                WaitingClose();
                alert("error");
              },
              dataType: 'json'
          });
  });

  //Eliminar
  $(".fa-times-circle").click(function (e) { 
                 
    var ido = $(this).parent('td').parent('tr').attr('id');
    console.log("ESTOY ELIMINANDO , el id de orden es:");
    console.log(ido);
    gloid=ido;
                                
  }); 
  var origen="";

  $(".fa-print").click(function (e) {
        e.preventDefault();
        var ido = $(this).parent('td').parent('tr').attr('id');
        console.log("El id de orden al imprimir es :");
        console.log(ido);
        

        $.ajax({
              type: 'POST',
              data: { ido: ido},
              url: 'index.php/Otrabajo/getprint', //index.php/
              success: function(data){
                   
                    console.log("Entre a la impresion");
                    console.log(data);
                    // console.log(data.datos.codigo);
                     console.log(data[0]['codigo']);
                    // console.log(data.equipos.asegurado);
                    // console.log(data.orden.nombre);

                    var fecha = new Date(data[0]['fecha']);
                    var day = fecha.getDate();
                    var month = fecha.getMonth();
                    var year = fecha.getUTCFullYear();
                    fecha = day + '-' + (month+1) + '-' + year;
                    //data.equipos.fecha_vigencia
                    //data.equipos.fecha_inicio
                    var fechapro = new Date(data[0]['fecha_program']);
                    var day = fechapro.getDate();
                    var month = fechapro.getMonth();
                    var year = fechapro.getUTCFullYear();
                    fechapro = day + '-' + (month+1) + '-' + year;

                    var fechaent = new Date(data[0]['fecha_entrega']);
                    var day = fechaent.getDate();
                    var month = fechaent.getMonth();
                    var year = fechaent.getUTCFullYear();
                    fechaent = day + '-' + (month+1) + '-' + year;

                    var fechater = new Date(data[0]['fecha_terminada']);
                    var day = fechater.getDate();
                    var month = fechater.getMonth();
                    var year = fechater.getUTCFullYear();
                    fechater = day + '-' + (month+1) + '-' + year;

                    var fechaentregada = new Date(data[0]['fecha_entregada']);
                    var day = fechaentregada.getDate();
                    var month = fechaentregada.getMonth();
                    var year = fechaentregada.getUTCFullYear();
                    fechaentregada = day + '-' + (month+1) + '-' + year;
                    
                    if(data[0]['id']==1){
                      origen='OT';

                    }
                    else{
                      if(data[0]['id']==2){
                      origen='Solicitud de Servicio';
                      }

                    }
                     if(data[0]['id']==3){
                      origen='Preventivo';

                    }
                    else{
                      if(data[0]['id']==4){
                      origen='Backlog';
                      }
                     
                    }
                     if(data[0]['id']==5){
                      origen='Predictivo';

                    }
                    else{
                      if(data[0]['id']==6){
                      origen='Correctivo Programado';
                      }
                     
                    }

                     var  texto =

                                '<div class="" id="vistaimprimir">'+
                                  '<div class="container">'+
                                    '<div class="thumbnail">'+

                                      '<div class="caption">'+
                                        '<div class="row" >'+
                                          '<div class="panel panel-default">'+
                                            '<div class="form-group">'+
                                              '<h3 class="text-center" align="center"></h3>'+
                                            '</div>'+
                                            '<hr/>'+
                                            '<div class="panel-body">'+
                                              '<div class="container">'+
                                                '<div class="thumbnail">'+
                                                  '<div class="row">'+
                                                    '<div class="col-sm-12 col-md-12">'+
                                                      '<table width="100%" style="text-align:justify" >'+
                                                        '<tr>'+
                                                        '<tr>'+
                                                          '<td  colspan="1"  align="left" >'+
                                                            '<div class="text-left"> <img src="img/LOGO.jpg" width="280" height="80" /> </div></td>'+
                                                          '</td>'+ 
                                                          '<td >'+
                                                            '<div  class="col-md-4 "><h3> ORDEN DE TRABAJO</h3>'+
                                                            '</div>'+
                                                            
                                                          '</td>'+

                                                        '</tr>'+
                                                        '</tr>'+
                                                      '</table>'+
                                                    '</div>'+
                                                  '</div>'+
                                                  '<br>'+
                                                  '<br>'+
                                                  '<div class="row">'+
                                                    '<div class="col-sm-12 col-md-12">'+
                                                      '<table width="100%" style="text-align:justify" border="1px solid black" >'+  
                                                        '<tr>'+
                                                            '<td>ID de Orden de trabajo</td>'+
                                                            '<td>'+data[0]['id_orden']+'</td>'+
                                                            '</tr>'+
                                                            '<tr>'+
                                                            '<td style="text-align: left"" >fecha</td>'+
                                                            '<td>'+fecha+'</td>'+
                                                            '</tr>'+

                                                            '<tr>'+
                                                            '<td>Fecha de programación</td>'+
                                                            '<td>'+fechapro+'</td>'+
                                                            '</tr>'+
                                                            '<tr>'+
                                                            '<td align="left" >Fecha de Entrega</td>'+
                                                            '<td>'+fechaent+'</td>'+
                                                            '</tr>'+

                                                            '<tr>'+
                                                            '<td>Fecha Entregada</td>'+
                                                            '<td>'+fechaentregada+'</td>'+
                                                            '</tr>'+
                                                            '<tr>'+
                                                            '<td>Fecha Terminada</td>'+
                                                            '<td>'+fechater+'</td>'+
                                                            '</tr>'+

                                                            '<tr>'+
                                                            '<td>Tarea</td>'+
                                                            '<td>'+data[0]['detarea']+'</td>'+
                                                            '</tr>'+
                                                            '<tr>'+
                                                            '<td>Equipo</td>'+
                                                            '<td>'+data[0]['codigo']+'</td>'+
                                                            '</tr>'+

                                                            '<tr>'+
                                                            '<td>Diración</td>'+
                                                            '<td>'+data[0]['duracion']+'</td>'+
                                                            '</tr>'+
                                                            '<tr>'+
                                                            '<td>Origen de OT</td>'+
                                                            '<td>'+origen+'</td>'+
                                                            '</tr>'+

                                                            

                                                            
                                                      
                                                      '</table>'+
                                                    '</div>'+
                                                  '</div>'+
                                                  '<br>'+
                                                  '<br>'+
                                                 
                                              
                                                  '<br>'+
                                                  '<br>'+

                                                 //aca va la tabla 

                                              
                                           
                                                '</div>'+
                                              '</div>'+
                                            '</div>'+

                                           
                                          '</div>'+
                                        '</div>'+
                                      '</div>'+
                                      '<style>'+
                                         '.table, .table>tr, .table>td  {} '+
                                      '</style>';
                                      //border:  1px solid black;


                                       var mywindow = window.open('', 'Imprimir', 'height=700,width=900');
                                        mywindow.document.write('<html><head><title></title>');
                                        //mywindow.document.write('<link rel="stylesheet" href="main.css" type="text/css" />');
                                        //mywindow.document.write('<link rel="stylesheet" href="main.css">
                                        mywindow.document.write('</head><body onload="window.print();">');
                                        mywindow.document.write(texto);
                                        mywindow.document.write('</body></html>');

                                        mywindow.document.close(); // necessary for IE >= 10
                                        mywindow.focus(); // necessary for IE >= 10
                                        //mywindow.print();
                                        //mywindow.close();
                                        return true; 
                 

                  
                   
                    },
              error: function(result){

                        console.log(result);
                        console.log("error en la vistaimprimir");
                                      },
                    dataType: 'json'
        });
  });    

  $(".fa-toggle-on").click(function (e) { 
    var idord = $(this).parent('td').parent('tr').attr('id');
    console.log(idord);  
    idfin=idord;
  });
  

  // Genera Informe de Servicio - Hugo
  function generar_informe_servicio(o){
      var id_sol = parseInt($(o).parent('td').parent('tr').attr('id'));
      var id_eq  = parseInt($(o).parent('td').parent('tr').data('id_equipo')); 
      var desc   = $(o).parent('td').parent('tr').data('causa');
      var id_solicitud = parseInt($(o).parent('td').parent('tr').data('idsolicitud'));
      desc = encodeURIComponent(desc);
      WaitingOpen();
      $('#content').empty();
      $("#content").load("<?php echo base_url(); ?>index.php/Ordenservicio/cargarOrden/<?php echo $permission; ?>/"+id_sol+"/"+id_eq+"/"+desc+"/"+id_solicitud+"/");
      WaitingClose();
  };

  $('#otrabajo').DataTable({
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
 
  $('#tabladetalle').DataTable({
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


    
function LoadOT(id_, action){
  idArt = id_;
  acArt = action;
  LoadIconAction('modalAction',action);
  WaitingOpen('Cargando Orden de trabajo');
  $.ajax({
          type: 'POST',
          data: { id : id_, act: action },
    		  url: 'index.php/otrabajo/getotrabajo', 
    		    success: function(result){
			                WaitingClose();
			                $("#modalBodyOT").html(result.html);
                      $('#vfech').datepicker({
                        changeMonth: true,
                        changeYear: true
                      });
			                setTimeout("$('#modalOT').modal('show')",800);
                      
    					},
    		    error: function(result){
    					WaitingClose();
    					alert("error");
    				},
          dataType: 'json'
  });
}

function traer_clientes(idcliente){
    $.ajax({
          type: 'POST',
          data: { idcliente: idcliente},
          url: 'index.php/Otrabajo/getcliente',  //index.php/
          async:false,
          success: function(data){
                  
                  $('#cliente option').remove();
                   var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                  $('#cliente').append(opcion); 
                  for(var i=0; i < data.length ; i++) {   
                   
                      var apellido = data[i]['cliLastName']; 
                      var opcion  = "<option value='"+data[i]['cliId']+"'>" +apellido+ "</option>" ; 
                      $('#cliente').append(opcion);                
                  }
                },
          error: function(result){
                
                console.log(result);
              },
              dataType: 'json'
    });
}

function finalOT(id_, action){ //esto es nuevo 
  idot = id_;
  ac = action;
  est='T';
  LoadIconAction('modalAction',action);
  WaitingOpen('Finalizando');
  $.ajax({
          type: 'POST',
          data: { id : id_, act: action,estado:est },
          url: 'index.php/otrabajo/setfinal', 
            success: function(data){
                      WaitingClose();
                    
                    
            },
            error: function(result){
              WaitingClose();
              alert("error");
            },
            dataType: 'json'
  });
}
 
   


 
// Trae proveedores por empresa logueada      
function traer_proveedor(){
  $('#proveedor').html('');
  $.ajax({
    type: 'POST',
    data: {},
    url: 'index.php/Otrabajo/getproveedor', //index.php/
    success: function(data){
           
             var opcion  = "<option value='-1'>Seleccione...</option>" ; 
              $('#proveedor').append(opcion); 
            for(var i=0; i < data.length ; i++) 
            {    
                  var nombre = data[i]['provnombre'];
                  var opcion  = "<option value='"+data[i]['provid']+"'>" +nombre+ "</option>" ; 

                $('#proveedor').append(opcion);                
            }
          },
    error: function(result){
          
          console.log(result);
        },
        dataType: 'json'
    });
}


function click_pedent(){  
  var fechai= $("#fecha_inicio").val(); //optengo el valor del campo fecha 
  $.ajax({
        type: 'GET',
        data: {fechai:fechai }, /* destinodo*/
        url: 'index.php/Otrabajo/getpedidos', //index.php/
        success: function(data){
                              
                console.log(data);             
                var direccion = data[0]['destinodireccion']; 
                var contacto = data[0]['destinocontacto']; 
                $('#domicilio').val(direccion);       
                $('#contacto').val(contacto);                

              },
         error: function(result){
              
              console.log(result);
            },
            dataType: 'json'
        });
}


function guardarpedido(){
  console.log("si guardo pedido");
  var id_orden = $(this).parent('td').parent('tr').attr('id');
  var numero = $('#num1').val();
  var fecha = $('#fecha1').val();
  var fecha_entrega = $('#fecha_entrega2').val();
  var proveedor= $('#proveedor').val();
  var descripcion2 = $('#descripcion2').val(); 
  var parametros = {
     
      'id_proveedor': proveedor,
      'nro_trabajo': numero,
      'descripcion': descripcion2,
      'fecha' : fecha,
      'fecha_entrega': fecha_entrega,
      'estado': 'P',
      'id_trabajo' :ido 
      
  };
  console.log(parametros);
  console.log(ido);
  console.log(numero);
  console.log(fecha);
  console.log(fecha_entrega2);
  console.log(proveedor);
  console.log(descripcion2);
  $.ajax({
        type: 'POST',
        data: {data:parametros, ido:ido},
        url: 'index.php/Otrabajo/agregar_pedido',  //index.php/
        success: function(data){
                console.log("Estoy guardando pedido");
                regresa1();
               
              },
        error: function(result){
              
              console.log(result);
             
           }
           // dataType: 'json'
  });                 
}


//OT TOTAL, pasa a la partalla de ot terminadas 
function guardartotal(){
  console.log("Estoy finalizando total la ot ");
  console.log(idfin);
  $.ajax({
        type: 'POST',
        data: { idfin: idfin},
        url: 'index.php/Otrabajo/FinalizaOt', //index.php/
        success: function(data){
                console.log(data);
                alert("Se Finalizando la ORDEN TRABAJO");
                regresa();
              },
          
        error: function(result){
              console.log(result);
            }
            //dataType: 'json'
    });
} 

//OT PARCIAL, pasa a la partalla de ot PARCIAL 
function guardarparcial(){
  console.log("Estoy finalizando parcial la ot ");
  console.log(idfin); 
  $.ajax({
        type: 'POST',
        data: { idfin: idfin},
        url: 'index.php/Otrabajo/CambioParcial', //index.php/
        success: function(data){
                console.log(data);
                alert("Se Finalizando PARCIAL LA ORDEN TRABAJO");
                regresa();
              },
          
        error: function(result){
              console.log(result);
            }
            //dataType: 'json'
    });
}

//Agrega nota de pedido desde la OT
function nota_pedido(o) { 
  var id = $(o).parent('td').parent('tr').attr('id');
  console.log("El id de OT es: "+id);
  iort = id;
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Notapedido/agregarnota/<?php echo $permission; ?>/"+iort);
  WaitingClose();  
}



</script>

<!-- Modal agregar -->
<div class="modal" id="modalagregar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span class="fa fa-plus-square text-light-blue"></span> Orden de Trabajo</h4>
       </div> <!-- /.modal-header  -->

       <div class="modal-body" id="modalBodyArticle">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos obligatorios estén completos.
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Nro: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control"  id="nro1" name="nro1" placeholder="Ingrese Numero de OT">
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Equipo <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control " id="equipo" name="equipo" value="" style="width: 100%;">

            </select>
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Fecha Inicio<strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control" id="vfech" name="vfech" value="<?php echo date_format(date_create(date("Y-m-d")), 'd-m-Y ') ; ?>"  disabled/>
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Fecha Entrega<strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="datetime" class="form-control" id="fechaEntrega" name="fechaEntrega" value=""/>
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Nota: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <textarea placeholder="Orden de trabajo" class="form-control" rows="10" id="vsdetal" name="vsdetal" value=""></textarea>
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Sucursal <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control select2" id="suci" name="suci" style="width: 100%;">

            </select>
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Proveedor <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control select2" id="prov" name="prov"  value="" style="width: 100%;">

            </select>
          </div>
        </div>
        <br>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" onclick="guardaragregar()">Guardar</button> 
        </div>  <!-- /.modal footer -->
      </div>  <!-- /.modal-body -->
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div><!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Aviso desea eliminar -->
<div class="modal" id="modalaviso">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" >&times;</span>
        </button>
        <h5 class="modal-title" ><span class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar</h5>
      </div>
      <div class="modal-body">
        <h4>¿Desea eliminarl Orden de Trabajo?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarpred()">Eliminar</button>
      </div>
    </div>
  </div>
</div><!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal editar -->
<div class="modal" id="modaleditar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-pencil text-light-blue"></span> Editar Orden de Trabajo</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos obligatorios estén completos.
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs12 col-sm-4">
            <label style="margin-top: 7px;">Nro: </label>
          </div>
          <div class="col-xs12 col-sm-8">
            <input type="text" class="form-control" placeholder="Nro Orden de trabajo" id="nroedit" name="nroedit">
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs12 col-sm-4">
            <label style="margin-top: 7px;">Equipo <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs12 col-sm-8">
            <select class="form-control" id="equipo1" name="equipo1" value="">
              <!-- options -->
            </select>
            <input type="hidden" class="form-control"  id="id_equipo1" name="id_equipo1">
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Fecha Inicio<strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control" id="fecha_inicio1" name="fecha_inicio1" value=""/>
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Fecha Entrega<strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control" id="fecha_entrega1" name="fecha_entrega1" value=""/>
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Nota: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <textarea placeholder="Orden de trabajo" class="form-control" rows="10" id="vsdetalleedit" name="vsdetalleedit" value=""></textarea>
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Sucursal <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control" id="sucidedit" name="sucidedit" value="" style="width: 100%;">

            </select>
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Proveedor <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control" id="prov1" name="prov1"  value="" style="width: 100%;">
            </select>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="guardareditar()">Guardar</button> 
        </div>  <!-- /.modal footer -->
      </div>
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal ASIGNA OT -->
<div id="modalAsig" class="modal" role="dialog">
  <div class="modal-dialog">

    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><span class="fa fa-thumb-tack text-light-blue"></span> Asignación Orden de trabajo</h4>
      </div>
      <div class="modal-body">
        <div class="row" >
          <div class="col-xs-12">
            <label for="nro">Nro:</label>
            <input type="text" class="form-control" id="nro" name="nro" disabled>
          </div>
          <input type="hidden" id="id_orden" name="id_orden">
          <div class="col-xs-12">
            <label for="fecha_inicio">Fecha de inicio:</label>
            <input type="text" class="form-control" id="fecha_inicio" name="fecha_inicio" disabled>
          </div>
          <div class="col-xs-12">
            <label for="equipo13">Equipo:</label>
            <input type="text"  id="equipo13" name="equipo13" class="form-control" title="" disabled>
            <input type="hidden" id="equipo13id" name="equipo13id">
          </div>
          <div class="col-xs-12">
            <label for="descripcion">Descripcion:</label>
            <textarea  class="form-control" rows="6" cols="500" id="descripcion" name="descripcion" value="" disabled ></textarea>
          </div>
          <div class="col-xs-12">Fecha de entrega:
            <input type="text" id="fecha_entregaa" name="fecha_entrega" class="form-control" />
          </div>
          <div  class="col-xs-12">Usuario:
            <select id="usuario1" name="usuario1" class="form-control">
              <option value="0">Seleccionar...</option>
              <?php 
                foreach ($list_usuarios as $o) {
                  echo '<option value="'.$o['id'].'">'.$o['firstname']." ".$o['lastname'].'</option>';
                }
              ?>
            </select>
            <input type="hidden" id="id_usuario" name="id_usuario">
          </div>
        </div><!-- /.row-->   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >Cancelar</button>
        <button type="button" class="btn btn-primary" id="reset" data-dismiss="modal" onclick="orden()">Guardar</button>
      </div>
    </div>

  </div>
</div><!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal FINALIZAR-->
<div class="modal" id="modalfinalizar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa fa-toggle-on text-light-blue"></span> Finalización </h4>
       </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <h4>
          Elija la opción de finalización de orden:
        </h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="guardarparcial()"> Parcial</button>     
        <button type="button" class="btn btn-primary" id="btnSave" data-dismiss="modal" onclick="guardartotal()" >Total</button>
      </div>  <!-- /.modal footer -->
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->
