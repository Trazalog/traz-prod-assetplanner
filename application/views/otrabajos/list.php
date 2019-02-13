<input type="hidden" id="permission" value="<?php echo $permission;?>">
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
          <table id="otrabajo" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
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
                      if (($a['estado'] =='As') || ($a['estado'] =='P') || ($a['estado'] =='C')) {
                        $id          = (int)$a['id_orden'];
                        $id_equipo   = $a['id_equipo'];
                        $causa       = $a['descripcion'];
                        $idsolicitud = $a['id_solicitud'];
                        echo '<tr id="'.$id.'" class="'.$id.'" data-id_equipo="'.$id_equipo.'" data-causa="'.$causa.'" data-idsolicitud="'.$idsolicitud.'">';
      	                echo '<td>';
                        if (strpos($permission,'Del') !== false) {
                          echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar" data-toggle="modal" data-target="#modalaviso"></i>';
                          //echo '<i class="fa fa-fw fa-print text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Imprimir"  ></i> '; 
                        }
                        if (strpos($permission,'Edit') !== false) {
      	                	echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar" data-toggle="modal" data-target="#modaleditar" ></i>';
                        }
                        if (strpos($permission,'Asignar') !== false) {
                          echo '<i class="fa fa-check-square-o text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Asignar tarea" id="btnAddtarea"></i>';
                          echo '<i class="fa fa-thumb-tack text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Asignar OT" data-toggle="modal" data-target="#modalAsig" ></i>';
                         
                        }
                        /*if (strpos($permission,'OP') !== false) {
                          echo '<i class="fa fa-tags text-light-blue" style="cursor: pointer; margin-left: 15px;"  title="Cargar Pedido " data-toggle="modal" data-target="#modalpedido"></i>';
                        }*/
                        if (strpos($permission,'Pedidos') !== false) {
                          echo '<i class="fa fa-truck text-light-blue" style="cursor: pointer; margin-left: 15px;"  title="Mostrar Nota de Pedido" data-toggle="modal" data-target="#modallista"></i>';
                          echo '<i class="fa fa-cart-plus text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Agregar Nota de Pedido"></i>';
                        }
                        if(($a['estado'] == 'As' || $a['estado'] == 'P') && ($a['id_usuario_a'] == $usrId)){
                        //if($a['estado'] == 'As' ){
                          echo '<i  href="#"class="fa fa-fw fa fa-toggle-on text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Finalizar Orden" data-toggle="modal" data-target="#modalfinalizar"></i>';
                        }
                        //// GENERA INFORME DE SERVICIOS
                        if (strpos($permission,'Del') !== false) {
                          echo '<i class="fa fa-sticky-note-o text-light-blue" id="cargOrden" style="cursor: pointer; margin-left: 15px;" title="Informe de Servicios" ></i>';
                        }
                        //echo '<i class="fa fa-fw fa-print text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Imprimir Orden de Trabajo"></i>';
                        
                        echo '<i class="fa fa-fw fa-search text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Ver Orden de Trabajo"></i>';

      	                echo '</td>';
                        echo '<td>'.$id.'</td>';
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
// cargo plugin DateTimePicker
$('#fechaEntrega, #fecha_inicio1, #fecha_entrega1, #fechaInicio').datetimepicker({
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
// boton cancelar
$("#btnAdd").click(function (e) { 
  $('#btn_guardar').prop("disabled", false);
});
// boton guardar 
$("#btn_cancGuardado").click(function (e) { 
  $('#btn_guardar').prop("disabled", false);
  $('#error').fadeOut('slow');
  $('.text_box').val('');
  $('.select_box').val('-1');
});

// Guarda una nueva OT - Ok
function guardaragregar(){
  
  $('#btn_guardar').prop("disabled", true);
  
  var num           = $('#nro1').val();
  var fecha_inicio  = $('#fechaInicio').val();
  var fecha_entrega = $('#fechaEntrega').val();
  var descripcion   = $('#vsdetal').val();
  var sucursal      = $('#suci').val();
  var proveedor     = $('#prov').val();
  var equipo        = $('#equipo').val();
  
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
    $('#btn_guardar').prop("disabled", false);   
    return;
  }  

  $.ajax({
    type: 'POST', 
    data: {num:num, 
          fecha_inicio: fecha_inicio,
          fecha_entrega:fecha_entrega, 
          equipo:equipo, 
          descripcion:descripcion, 
          sucursal:sucursal, 
          proveedor:proveedor},
    url: 'index.php/Otrabajo/guardar_agregar',
    success: function(data){
      //console.log(data);  
      $('#modalagregar').modal('hide');
      regresa1();
    },
    error: function(result){
      //$('#modalagregar').modal('hide');
      alert('Ocurrio un error en el guardado...');
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
  console.log("idp: "+idp);
  $.ajax({
    data: { idp:idp },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Otrabajo/getpencil',
    success: function(data){
      console.table(data);
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
  // console.info("Parametros:");
  // console.table(parametros);
  // console.log("El id de orden es:");
  // console.log(idp);
  // console.log("El id de equipo es:");
  // console.log(equipo);
  // console.log(equipo1);
  // console.log("El id de proveedor es:");
  // console.log(proveedor);
  //console.info($('#fecha_inicio1').val());
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
$(".fa-check-square-o").click(function (e) { 
  var id = $(this).parent('td').parent('tr').attr('id');
  console.log("El id de OT es: "+id);
  iort = id;
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/cargartarea/<?php echo $permission; ?>/"+iort+"");
  WaitingClose();  
});

// Trae los datos a mostrar en el modal Asignar OT - Ok
$(".fa-thumb-tack").click(function (e) { 
  // $('#modalAsig').modal('show');
  var id_orden = $(this).parent('td').parent('tr').attr('id');  
  console.log("El id de OT: "+id_orden);
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
});

// llena select usuario en modal Asignar OT - Ok
function traer_usuario(id_usuario){
  $("#usuario1").html("");
  $.ajax({
    data: {},
    dataType: 'json',
    type: 'POST',
    url: "Otrabajo/getusuario",
    success: function (data) {
      $('#usuario1').text("");
      for(var i=0; i < data.length ; i++) 
      {
        var selectAttr = '';
        if(data[i]['usrId'] == id_usuario) { var selectAttr = 'selected';}
        var nombre = data[i]['usrName']+' '+data[i]['usrLastName'];
        var opcion = "<option value='"+data[i]['usrId']+"' "+selectAttr+">" +nombre+ "</option>";
        $('#usuario1').append(opcion); 
      }
    },
    error : function (data){
      console.error('Error al traer usuarios en modal Asignar OT');
      console.table(data);
    },
  });
}

// 
function orden(){
  console.log("si guardo ");
  var id_orden = $('#id_orden').val();
  var nro = $('#nro').val();
  var fecha_inicio = $('#fecha_inicio').val();
  var fecha_entrega = $('#fecha_entrega').val();
  var usuario= $('#usuario1').val();
  var estado= $('#estado').val();
  var cliente = $('#id_cliente').val();
  var parametros = {
      //'id_orden': id_orden,
      'nro': nro,
      'fecha_inicio': fecha_inicio,
      'fecha_entrega': fecha_entrega,
      'id_usuario_a': usuario,
      'estado': 'As',     
      'cliId': cliente
  };
  console.log(parametros);
  console.log(id_orden);
  $.ajax({
      type: 'POST',
      data: { id_orden:id_orden, fecha_entrega:fecha_entrega, usuario:usuario},
      url: 'index.php/Otrabajo/guardar', 
      success: function(data){
              console.log(data);
              regresa1();
             
            },
      error: function(result){
            
            console.log(result);
           
          },
          dataType: 'json'
  });              
}

/*/ Refresca    
function regresa(){
  $('#content').empty(); //listOrden  
  $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/listOrden/<?php echo $permission; ?>");
  WaitingClose();
}*/

// llena select clientes en modal Asignar OT - 
function traer_clientes(id_cliente){
  $.ajax({
    type: 'POST',
    data: {},
    url: 'index.php/Otrabajo/traer_cli',
    success: function(data){
      console.info(data);
      /*var selectAttr = '';
      if(data[i]['cliId'] == id_cliente) { var selectAttr = 'selected'; console.log("sel")}
      var nombre = data[i]['cliLastName']+'. .'+datos['cliName'];
      var opcion = "<option value='"+data[i]['cliId']+"' "+selectAttr+">" +nombre+ "</option>";
      $('#cli').append(opcion); 

      /*var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#cli').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['cliLastName']+'. .'+datos['cliName'];
        var opcion = "<option value='"+data[i]['cliId']+"'>" +nombre+ "</option>" ; 
        $('#cli').append(opcion);          
      }*/
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
}


$(document).ready(function(event) {

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


  $(".fa-truck").click(function (e) { 

    $("#modallista tbody tr").remove();
    var idorde = $(this).parent('td').parent('tr').attr('id');
    
    /*console.log("ID de orden de trabajo para mostrar pedido es: "+idorde);  
    $.ajax({
      dataType: 'json',
      data: { id:idorde},
      type: 'POST',
      url: 'index.php/Otrabajo/getmostrar',
          success: function(data){
            
            $('#tabladetalle').DataTable().clear().draw();
            for (var i = 0; i < data.length; i++) {

              switch (data[i]['estado']) {
                case 'P':
                  var estado= '<small class="label pull-left bg-green">Pedido</small>';
                  break;
                case 'C':
                  var estado= '<small class="label pull-left bg-blue">Curso</small>';
                  break;
                case 'E':
                  var estado= '<small class="label pull-left bg-red">Entregado</small>'; 
                default:
                  var estado= '<small class="label pull-left bg-yellow">Terminado</small>';
                break;
              }
              
              $('#tabladetalle').DataTable().row.add( [
                data[i]['artBarCode'],
                data[i]['artDescription'],
                data[i]['cantidad'],
                data[i]['fecha'],
                data[i]['fechaEntrega'],
                data[i]['provnombre'],
                estado
              ] ).draw(); 
            }  
            // for (var i = 0; i < data.length; i++) {

              //   if (data[i]['estado']== 'P'){
              //   var estado= '<small class="label pull-left bg-green">Pedido</small>';
              //   }else {
              //     if (data[i]['estado']== 'C'){
              //     var estado= '<small class="label pull-left bg-blue">Curso</small>';
              //     }else {
              //       if (data[i]['estado']== 'E'){ 
              //       var estado= '<small class="label pull-left bg-red">Entregado</small>';
              //       }else{ 
              //         var estado= '<small class="label pull-left bg-yellow">Terminado</small>';
              //       }
              //       $('#tabladetalle').DataTable().clear().draw();
              //       $('#tabladetalle').DataTable().row.add( [
              //         //"",
              //         data[i]['id_ordTrabajo'],
              //         data[i]['fecha'],
              //         data[i]['fecha_entrega'],
              //         data[i]['provnombre'],
              //         data[i]['descripcion'],
              //         estado,
              //       ] ).draw();
              //     }
              //   }
              // }
          },
            
          error: function(result){
                console.error("Entro x el error de detalle");                
                console.table(result);
          },
    });*/
    //iort = id;
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Notapedido/getNotasxOT/<?php echo $permission; ?>/"+idorde+"");
    WaitingClose(); 
  });

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
  
  /*$('#vfecha').datepicker({
      changeMonth: true,
      changeYear: true
  }); 

  $("#fecha_entrega").datepicker({
    dateFormat: 'dd/mm/yy',
    firstDay: 1
  }).datepicker("setDate", new Date());

  $("#fecha1").datepicker({
    dateFormat: 'dd/mm/yy',
    firstDay: 1
  }).datepicker("setDate", new Date()); 

  $("#fecha_inicio1").datepicker({
    dateFormat: 'dd/mm/yy',
    firstDay: 1
  }).datepicker("setDate", new Date()); 

  $(".datepicker").datepicker({    
      changeMonth: true,
      changeYear: true
  });*/


  // Genera Informe de Servicio - Hugo
  $('.fa-sticky-note-o').click( function cargarVista(){
      var id_sol = parseInt($(this).parent('td').parent('tr').attr('id'));
      var id_eq  = parseInt($(this).parent('td').parent('tr').data('id_equipo')); 
      var desc   = $(this).parent('td').parent('tr').data('causa');
      var id_solicitud = parseInt($(this).parent('td').parent('tr').data('idsolicitud'));
      desc = encodeURIComponent(desc);
      WaitingOpen();
      $('#content').empty();
      $("#content").load("<?php echo base_url(); ?>index.php/Ordenservicio/cargarOrden/<?php echo $permission; ?>/"+id_sol+"/"+id_eq+"/"+desc+"/"+id_solicitud+"/");
      WaitingClose();
  });

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


$(".fa-cart-plus").click(function (e) { 
  var id = $(this).parent('td').parent('tr').attr('id');
  console.log("El id de OT es: "+id);
  iort = id;

  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Notapedido/agregarnota/<?php echo $permission; ?>/"+iort);
  WaitingClose();  
});




















// ver Orden de Trabajo
$(".fa-search").click( function(e){
  let idot = $(this).parent('td').parent('tr').attr('id');
  //console.log("id Orden de trabajo: "+idot);
  
  WaitingOpen('Obteniendo datos de OT...');
  //buscar datos 
  $.ajax({
    data: { idot:idot },
    dataType: 'json',
    method: 'POST',
    url: 'index.php/Otrabajo/getOrigenOt',
  })
  .done( (data) => {
    console.table(data);
    traerDatosOt(idot, data.tipo, data.id_solicitud);
  })
  .fail( () => alert( "Error al traer los datos de la OT." ) )
  .always( () => WaitingClose() );
});

// Elige a que fcion que trae datos de OT llamar, según su origen
function traerDatosOt(idOt, tipo, idSolicitud) {
  console.info(idOt+' - '+idSolicitud);
  switch (tipo) {
    case '1': //Orden de trabajo
      getDataOt(idOt);
      break;
    case '2': //Solicitud de servicio
      getDataOtSolServicio(idOt, idSolicitud);
      break;
    case '3': //preventivo
      getDataOtPreventivo(idOt, idSolicitud);
      break;
    case '4': //Backlog
      getDataOtBacklog(idOt, idSolicitud);
      break;
    case '5': //predictivo
      getDataOtPredictivo(idOt, idSolicitud);
      break;
    case '6': //correctivo programado
      //break;
    default:
    console.error('Tipo de dato desconocido')
      break;
  }
}



/* 1 OT */

// Trae datos de OT con origen Backlog
function getDataOt(idOt) {
  WaitingOpen('Cargando datos...');
  $.ajax({
    data: { idOt:idOt },
    dataType: 'json',
    method: 'POST',
    url: 'index.php/Otrabajo/getViewDataOt',
  })
  .done( (data) => {
    //console.table(data);
    let datos = {
      //Panel datos de OT
      'id_ot'          : data['id_orden'],
      'nro'            : data['nro'],
      'descripcion_ot' : data['descripcionFalla'],
      'fecha_inicio'   : data['fecha_inicio'],
      'fecha_entrega'  : data['fecha_entrega'],
      'sucursal'       : data['descripc'],
      'nombreprov'     : data['provnombre'],
      //Panel datos de equipos
      'codigo'         : data['codigo'],
      'fecha_ingreso'  : data['fecha_ingreso'],
      'marca'          : data['marca'],
      'ubicacion'      : data['ubicacion'],
      'descripcion_eq' : data['descripcionEquipo'],
      'comp_equipo'    : data['compEquipo'],
    }
    fillModalView(datos);
    $('#verOt').modal('show');
    WaitingClose();
  })
  .fail( () => alert( "Error al traer los datos de la OT." ) );
}
//llena datos del modal preventivo
function fillModalView(datos){
  //llenar datos de ot
  $('#vNroOt').val(datos['nro']);
  $('#vDescripFalla').val(datos['descripcion_ot']);
  $('#vFechaCreacion').val(datos['fecha_inicio']);
  $('#vFechaEntrega').val(datos['fecha_entrega']);
  $('#vSucursal').val(datos['sucursal']);
  $('#vProveedor').val(datos['nombreprov']);
  //llenar datos de equipo
  $('#vCodigoEquipo').val(datos['codigo']);
  $('#vFechaEquipo').val(datos['fecha_ingreso']);
  $('#vMarcaEquipo').val(datos['marca']);
  $('#vUbicacionEquipo').val(datos['ubicacion']);
  $('#vDescripcionEquipo').val(datos['descripcion_eq']);
}



/* 1 Solicitud de Servicios */

// Trae datos de Solicitud de Servicios con origen Backlog
function getDataOtSolServicio(idOt, idSolServicio) {
  WaitingOpen('Cargando datos...');
  $.ajax({
    data: { idOt:idOt, idSolServicio:idSolServicio },
    dataType: 'json',
    method: 'POST',
    url: 'index.php/Otrabajo/getViewDataSolServicio',
  })
  .done( (data) => {
    console.table(data);
    let datos = {
      //Panel datos de OT
      'id_ot'          : data['id_orden'],
      'nro'            : data['nro'],
      'descripcion_ot' : data['descripcionFalla'],
      'fecha_inicio'   : data['fecha_inicio'],
      'fecha_entrega'  : data['fecha_entrega'],
      'sucursal'       : data['descripc'],
      'nombreprov'     : data['provnombre'],
      //Panel datos de equipos
      'codigo'         : data['codigo'],
      'fecha_ingreso'  : data['fecha_ingreso'],
      'marca'          : data['marca'],
      'ubicacion'      : data['ubicacion'],
      'descripcion_eq' : data['descripcionEquipo'],
      'comp_equipo'    : data['compEquipo'],
      'solServicio'   : data['solServicio'],
    }
    fillModalViewSolServicio(datos);
    $('#verOtSolServicio').modal('show');
    WaitingClose();
  })
  .fail( () => alert( "Error al traer los datos de la OT." ) );
}
//llena datos del modal preventivo
function fillModalViewSolServicio(datos){
  //llenar datos de ot
  $('#vNroOtSolServicio').val(datos['nro']);
  $('#vDescripFallaSolServicio').val(datos['descripcion_ot']);
  $('#vFechaCreacionSolServicio').val(datos['fecha_inicio']);
  $('#vFechaEntregaSolServicio').val(datos['fecha_entrega']);
  $('#vSucursalSolServicio').val(datos['sucursal']);
  $('#vProveedorSolServicio').val(datos['nombreprov']);
  //llenar datos de equipo
  $('#vCodigoEquipoSolServicio').val(datos['codigo']);
  $('#vFechaEquipoSolServicio').val(datos['fecha_ingreso']);
  $('#vMarcaEquipoSolServicio').val(datos['marca']);
  $('#vUbicacionEquipoSolServicio').val(datos['ubicacion']);
  $('#vDescripcionEquipoSolServicio').val(datos['descripcion_eq']);
  //llenar datos de soolicitud de servicios
  $('#vSectorSolServicio').val( datos['solServicio']['sector'] );
  $('#vGrupoSolServicio').val( datos['solServicio']['grupo'] );
  $('#vSolicitanteSolServicio').val( datos['solServicio']['solicitante'] );
  $('#vFechaSugeridaSolServicio').val( datos['solServicio']['fechaSugerida'] );
  $('#vHorarioSugeridoSolServicio').val( datos['solServicio']['horarioSugerido'] );
  $('#vFallaSolServicio').val( datos['solServicio']['falla'] );
}



/***** 3 preventivo *****/

// Trae datos de OT con origen Preventivo
function getDataOtPreventivo(idOt, idPreventivo) {
  WaitingOpen('Cargando datos...');
  $.ajax({
    data: { idOt:idOt, idPreventivo:idPreventivo },
    dataType: 'json',
    method: 'POST',
    url: 'index.php/Otrabajo/getViewDataPreventivo',
  })
  .done( (data) => {
    //console.table(data);
    let datos = {
      //Panel datos de OT
      'id_ot'          : data['id_orden'],
      'nro'            : data['nro'],
      'descripcion_ot' : data['descripcionFalla'],
      'fecha_inicio'   : data['fecha_inicio'],
      'fecha_entrega'  : data['fecha_entrega'],
      'sucursal'       : data['descripc'],
      'nombreprov'     : data['provnombre'],
      //Panel datos de equipos
      'codigo'         : data['codigo'],
      'fecha_ingreso'  : data['fecha_ingreso'],
      'marca'          : data['marca'],
      'ubicacion'      : data['ubicacion'],
      'descripcion_eq' : data['descripcionEquipo'],
      'tarea' : data['tarea'],
    }
    fillModalViewPreventivo(datos);
    $('#verOtPreventivo').modal('show');
    WaitingClose();
  })
  .fail( () => alert( "Error al traer los datos de la OT." ) );
}
//llena datos del modal preventivo
function fillModalViewPreventivo(datos){
  //llenar datos de ot
  $('#vNroOtPrev').val(datos['nro']);
  $('#vDescripFallaPrev').val(datos['descripcion_ot']);
  $('#vFechaCreacionPrev').val(datos['fecha_inicio']);
  $('#vFechaEntregaPrev').val(datos['fecha_entrega']);
  $('#vSucursalPrev').val(datos['sucursal']);
  $('#vProveedorPrev').val(datos['nombreprov']);
  //llenar datos de equipo
  $('#vCodigoEquipoPrev').val(datos['codigo']);
  $('#vFechaEquipoPrev').val(datos['fecha_ingreso']);
  $('#vMarcaEquipoPrev').val(datos['marca']);
  $('#vUbicacionEquipoPrev').val(datos['ubicacion']);
  $('#vDescripcionEquipoPrev').val(datos['descripcion_eq']);
  //llenar campos de tarea
  $('#vTareaPrev').val( datos['tarea']['tareadescrip'] );
  $('#vComponentePrev').val( datos['tarea']['descripComponente'] );
  $('#vFechaBasePrev').val( datos['tarea']['ultimo'] );
  $('#vPeriodoPrev').val( datos['tarea']['perido'] );
  $('#vFrecuenciaPrev').val( datos['tarea']['frecuencia'] );
  $('#vLecturaBasePrev').val( datos['tarea']['lectura_base'] );
  $('#vAlertaPrev').val( datos['tarea']['alerta'] );
  $('#vDuraciónPrev').val( datos['tarea']['prev_duracion'] );
  $('#vUnidadTiempoPrev').val( datos['tarea']['unidaddescrip'] );
  $('#vCantOperariosPrev').val( datos['tarea']['prev_canth'] );
  //llenar tabla herramientas
  llenarTablaHerramientas(datos['tarea']);
  llenarTablaInsumos(datos['tarea']);
  llenarAdjuntos(datos['tarea'].prev_adjunto);
}
//llena tabla herramientas del modal preventivo
function llenarTablaHerramientas(tareas) {
  //console.table(tareas['herramientas'][0]);
  $('#vTablaHerramientas').DataTable().clear().draw();
  for (var i = 0; i < tareas['herramientas'][0].length; i++) {
    //console.info('Herramientas: '+tareas['herramientas'][0][i]);
    $('#vTablaHerramientas').DataTable().row.add( [
        tareas['herramientas'][0][i].herrcodigo,
        tareas['herramientas'][0][i].herrmarca,
        tareas['herramientas'][0][i].herrdescrip,
        tareas['herramientas'][0][i].cantidad,
      ]
    ).draw();
  }
}
//llena tabla insumos del modal preventivo
function llenarTablaInsumos(tareas) {
  //console.table(tareas['insumos'][0]);
  $('#vTablaInsumos').DataTable().clear().draw();
  for (var i = 0; i < tareas['insumos'][0].length; i++) {
    $('#vTablaInsumos').DataTable().row.add( [
        tareas['insumos'][0][i].artBarCode,
        tareas['insumos'][0][i].artDescription,
        tareas['insumos'][0][i].cantidad,
      ]
    ).draw();
  }
}
//muestra adjunto del modal preventivo
function llenarAdjuntos(adjunto) {
  pdfEmbeded = '<embed src="./assets/filespreventivos/'+adjunto+'" type="application/pdf" style="width:100%;height:800px"></embed>';
  $('#collapseAdjunto .panel-body').html(pdfEmbeded);
}



/* 4 Backlog */

// Trae datos de OT con origen Backlog
function getDataOtBacklog(idOt, idBacklog) {
  WaitingOpen('Cargando datos...');
  $.ajax({
    data: { idOt:idOt, idBacklog:idBacklog },
    dataType: 'json',
    method: 'POST',
    url: 'index.php/Otrabajo/getViewDataBacklog',
  })
  .done( (data) => {
    //console.table(data);
    let datos = {
      //Panel datos de OT
      'id_ot'          : data['id_orden'],
      'nro'            : data['nro'],
      'descripcion_ot' : data['descripcionFalla'],
      'fecha_inicio'   : data['fecha_inicio'],
      'fecha_entrega'  : data['fecha_entrega'],
      'sucursal'       : data['descripc'],
      'nombreprov'     : data['provnombre'],
      //Panel datos de equipos
      'codigo'         : data['codigo'],
      'fecha_ingreso'  : data['fecha_ingreso'],
      'marca'          : data['marca'],
      'ubicacion'      : data['ubicacion'],
      'descripcion_eq' : data['descripcionEquipo'],
      'comp_equipo'    : data['compEquipo'],
      'tarea'          : data['tarea'],
    }
    fillModalViewBacklog(datos);
    $('#verOtBacklog').modal('show');
    WaitingClose();
  })
  .fail( () => alert( "Error al traer los datos de la OT." ) );
}
//llena datos del modal preventivo
function fillModalViewBacklog(datos){
  //llenar datos de ot
  $('#vNroOtBack').val(datos['nro']);
  $('#vDescripFallaBack').val(datos['descripcion_ot']);
  $('#vFechaCreacionBack').val(datos['fecha_inicio']);
  $('#vFechaEntregaBack').val(datos['fecha_entrega']);
  $('#vSucursalBack').val(datos['sucursal']);
  $('#vProveedorBack').val(datos['nombreprov']);
  //llenar datos de equipo
  $('#vCodigoEquipoBack').val(datos['codigo']);
  $('#vFechaEquipoBack').val(datos['fecha_ingreso']);
  $('#vMarcaEquipoBack').val(datos['marca']);
  $('#vUbicacionEquipoBack').val(datos['ubicacion']);
  $('#vDescripcionEquipoBack').val(datos['descripcion_eq']);
  //llenar campos de componente-equipo
  $('#vCodigoCompBack').val( datos['tarea']['compEquipo']['codigoComponente'] );
  $('#vDescripCompBack').val( datos['tarea']['compEquipo']['descripComponente'] );
  $('#vSistemaBack').val( datos['tarea']['compEquipo']['descripSistema'] );
  //llenar campos de tarea
  $('#vTareaBack').val( datos['tarea']['tareadescrip'] );
  $('#vFechaBack').val( datos['tarea']['fecha'] );
  $('#vDuracionBack').val( datos['tarea']['back_duracion'] );
}



/* 5 Predictivo */

// Trae datos de OT con origen Predictivo
function getDataOtPredictivo(idOt, idPredictivo) {
  WaitingOpen('Cargando datos...');
  $.ajax({
    data: { idOt:idOt, idPredictivo:idPredictivo },
    dataType: 'json',
    method: 'POST',
    url: 'index.php/Otrabajo/getViewDataPredictivo',
  })
  .done( (data) => {
    console.table(data);
    let datos = {
      //Panel datos de OT
      'id_ot'          : data['id_orden'],
      'nro'            : data['nro'],
      'descripcion_ot' : data['descripcionFalla'],
      'fecha_inicio'   : data['fecha_inicio'],
      'fecha_entrega'  : data['fecha_entrega'],
      'sucursal'       : data['descripc'],
      'nombreprov'     : data['provnombre'],
      //Panel datos de equipos
      'codigo'         : data['codigo'],
      'fecha_ingreso'  : data['fecha_ingreso'],
      'marca'          : data['marca'],
      'ubicacion'      : data['ubicacion'],
      'descripcion_eq' : data['descripcionEquipo'],
      'tarea'          : data['tarea'],
    }
    fillModalViewPredictivo(datos);
    $('#verOtPredictivo').modal('show');
    WaitingClose();
  })
  .fail( () => alert( "Error al traer los datos de la OT." ) );
}
//llena datos del modal preventivo
function fillModalViewPredictivo(datos){
  //llenar datos de ot
  $('#vNroOtPred').val(datos['nro']);
  $('#vDescripFallaPred').val(datos['descripcion_ot']);
  $('#vFechaCreacionPred').val(datos['fecha_inicio']);
  $('#vFechaEntregaPred').val(datos['fecha_entrega']);
  $('#vSucursalPred').val(datos['sucursal']);
  $('#vProveedorPred').val(datos['nombreprov']);
  //llenar datos de equipo
  $('#vCodigoEquipoPred').val(datos['codigo']);
  $('#vFechaEquipoPred').val(datos['fecha_ingreso']);
  $('#vMarcaEquipoPred').val(datos['marca']);
  $('#vUbicacionEquipoPred').val(datos['ubicacion']);
  $('#vDescripcionEquipoPred').val(datos['descripcion_eq']);
  //llenar campos de tarea
  $('#vTareaPred').val( datos['tarea']['tareadescrip'] );
  $('#vFechaPred').val( datos['tarea']['fecha'] );
  $('#vPeriodoPred').val( datos['tarea']['periodo'] );
  $('#vFrecuenciaPred').val( datos['tarea']['frecuencia'] );
  $('#vDuraciónPred').val( datos['tarea']['duracion']+' '+datos['tarea']['unidaddescrip'] );
  $('#vCantOperariosPred').val( datos['tarea']['cantOperarios'] );
  $('#vCantHsHombrePred').val( datos['tarea']['horash'] );
}



// ajusto el ancho de la cabecera de las tablas al cargar el modal
$('#verOtPreventivo').on('shown.bs.modal', function (e) {
  $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
});
//y al mostrar panel de acordeon
$('#collapseHerramientas, #collapseInsumos').on('shown.bs.collapse', function () {
  $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
})



$('#otrabajo').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "columnDefs": [ 
    {
      "targets": [ 0 ], 
      "searchable": false,
    },
    {
      "targets": [ 0 ], 
      "orderable": false,
    },
    { 
      "targets": [ 1, 8 ],
      "type": "num",
    }
  ],
  "order": [[1, "desc"]],
});
 
$('#tabladetalle').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "columnDefs": [ 
    {
      "targets": [ 0 ], 
      "searchable": false
    },
    {
      "targets": [ 0 ], 
      "orderable": false
    }
  ],
  "order": [[1, "asc"]],
});


$('#vTablaHerramientas').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "columnDefs": [ 
    { 
      "targets": [ 3 ],
      "type": "num",
    }
  ],
  "order": [[0, "asc"]],
});

$('#vTablaInsumos').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "order": [[0, "asc"]],
});

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
            <input type="text" class="form-control text_box"  id="nro1" name="nro1" placeholder="Ingrese Numero de OT">
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Equipo <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control select_box" id="equipo" name="equipo" value="" style="width: 100%;">

            </select>
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Fecha Inicio<strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="datetime" class="form-control" id="fechaInicio" name="fechaInicio" />
            <!-- <input type="text" class="form-control" id="fechaInicio" name="fechaInicio" value="<?php //echo date_format(date_create(date("Y-m-d")), 'd-m-Y ') ; ?>"/> -->
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Fecha Entrega<strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="datetime" class="form-control text_box" id="fechaEntrega" name="fechaEntrega" value=""/>
          </div>
        </div><br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Nota: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <textarea placeholder="Orden de trabajo" class="form-control text_box" rows="10" id="vsdetal" name="vsdetal" value=""></textarea>
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Sucursal <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control select2 select_box" id="suci" name="suci" style="width: 100%;">

            </select>
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Proveedor <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control select2 select_box" id="prov" name="prov"  value="" style="width: 100%;">

            </select>
          </div>
        </div>
        <br>
        <div class="modal-footer">
          <button type="button" id="btn_cancGuardado" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" id="btn_guardar" onclick="guardaragregar()">Guardar</button> 
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
            <input type="text" id="fecha_entrega" name="fecha_entrega" class="form-control datepicker" / >
          </div>
          <div  class="col-xs-12">Usuario:
            <select id="usuario1" name="usuario1" class="form-control"></select>
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

<!-- Modal mostrar pedido-->
<div class="modal" id="modallista" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><spanclass="fa fa-truck text-light-blue"></span> Lista de Orden de Pedido</h4>
      </div> <!-- /.modal-header  -->
      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <table class="table table-bordered table-hover" id="tabladetalle">
              <thead>
                <tr>                                
                  <th>Cod. Artículo</th>
                  <th>Detalle</th>
                  <th>Cantidad</th>
                  <th>Fecha Creación</th>
                  <th>Fecha Entrega</th>
                  <th>Proveedor</th>
                  <th>Estado</th>
                </tr>
              </thead>
              <tbody>              
              </tbody>
            </table>    
          </div>
        </div>  
      </div>  <!-- /.modal-body -->
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->


<!-- Modal Ver Orden de Trabajo -->
<div class="modal" id="verOt" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Orden de Trabajo</h4>
      </div>
      <div class="modal-body">
        
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
              <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOt" aria-expanded="true" aria-controls="collapseOt">
                  Datos de OT
                </a>
              </h4>
            </div>
            <div id="collapseOt" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">

                <div class="row">
                  <div class="col-xs-12 col-sm-4">
                    <label for="vNroOt">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOt" id="vNroOt" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-8">
                    <label for="vDescripFalla">Descripción:</label>
                    <input type="text" class="form-control vDescripFalla" id="vDescripFalla" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaCreacion">Fecha Inicio:</label>
                    <input type="text" class="form-control " name="vFechaCreacion" id="vFechaCreacion" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEntrega">Fecha Entrega:</label>
                    <input type="text" class="form-control " name="vFechaEntrega" id="vFechaEntrega" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursal">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursal" id="vSucursal" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedor">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedor" id="vProveedor" disabled>
                  </div>
                </div>

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEquipo" aria-expanded="false" aria-controls="collapseEquipo">
                  Datos de equipo
                </a>
              </h4>
            </div>
            <div id="collapseEquipo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
              <div class="panel-body">
                
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vCodigoEquipo">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipo" id="vCodigoEquipo" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEquipo">Fecha:</label>
                    <input type="text" class="form-control " name="vFechaEquipo" id="vFechaEquipo" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vMarcaEquipo">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipo" id="vMarcaEquipo" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vUbicacionEquipo">Ubicación:</label>
                    <input type="text" class="form-control " name="vUbicacionEquipo" id="vUbicacionEquipo" disabled>
                  </div>

                  <div class="col-xs-12">
                    <label for="vDescripcionEquipo">Descripción:</label>
                    <Textarea class="form-control " name="vDescripcionEquipo" id="vDescripcionEquipo" disabled></Textarea>
                  </div>              
                </div>

              </div>
            </div>
          </div> 
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal Ver Orden de Trabajo Solicitud de Servicio-->
<div class="modal" id="verOtSolServicio" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Orden de Trabajo</h4>
      </div>
      <div class="modal-body">
        
        <div class="panel-group" id="accordionSolServicio" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOneSolServicio">
              <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordionSolServicio" href="#collapseOtSolServicio" aria-expanded="true" aria-controls="collapseOtSolServicio">
                  Datos de OT
                </a>
              </h4>
            </div>
            <div id="collapseOtSolServicio" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOneSolServicio">
              <div class="panel-body">

                <div class="row">
                  <div class="col-xs-12 col-sm-4">
                    <label for="vNroOtSolServicio">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOtSolServicio" id="vNroOtSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-8">
                    <label for="vDescripFallaSolServicio">Descripción:</label>
                    <input type="text" class="form-control vDescripFallaSolServicio" id="vDescripFallaSolServicio" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaCreacionSolServicio">Fecha Inicio:</label>
                    <input type="text" class="form-control " name="vFechaCreacionSolServicio" id="vFechaCreacionSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEntregaSolServicio">Fecha Entrega:</label>
                    <input type="text" class="form-control " name="vFechaEntregaSolServicio" id="vFechaEntregaSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursalSolServicio">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursalSolServicio" id="vSucursalSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedorSolServicio">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedorSolServicio" id="vProveedorSolServicio" disabled>
                  </div>
                </div>

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwoSolServicio">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionSolServicio" href="#collapseEquipoSolServicio" aria-expanded="false" aria-controls="collapseEquipoSolServicio">
                  Datos de equipo
                </a>
              </h4>
            </div>
            <div id="collapseEquipoSolServicio" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwoSolServicio">
              <div class="panel-body">
                
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vCodigoEquipoSolServicio">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipoSolServicio" id="vCodigoEquipoSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEquipoSolServicio">Fecha:</label>
                    <input type="text" class="form-control " name="vFechaEquipoSolServicio" id="vFechaEquipoSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vMarcaEquipoSolServicio">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipoSolServicio" id="vMarcaEquipoSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vUbicacionEquipoSolServicio">Ubicación:</label>
                    <input type="text" class="form-control " name="vUbicacionEquipoSolServicio" id="vUbicacionEquipoSolServicio" disabled>
                  </div>

                  <div class="col-xs-12">
                    <label for="vDescripcionEquipoSolServicio">Descripción:</label>
                    <Textarea class="form-control " name="vDescripcionEquipoSolServicio" id="vDescripcionEquipoSolServicio" disabled></Textarea>
                  </div>              
                </div>

              </div>
            </div>
          </div> 
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThreeSolServicio">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionSolServicio" href="#collapseSolServicio" aria-expanded="false" aria-controls="collapseSolServicio">
                  Solicitud de Servicio
                </a>
              </h4>
            </div>
            <div id="collapseSolServicio" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThreeSolServicio">
              <div class="panel-body">
                
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vSectorSolServicio">Sector:</label>
                    <input type="text" class="form-control " name="vSectorSolServicio" id="vSectorSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vGrupoSolServicio">Grupo:</label>
                    <input type="text" class="form-control " name="vGrupoSolServicio" id="vGrupoSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vSolicitanteSolServicio">Solicitante:</label>
                    <input type="text" class="form-control " name="vSolicitanteSolServicio" id="vSolicitanteSolServicio" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vFechaSugeridaSolServicio">Fecha sugerida:</label>
                    <input type="text" class="form-control " name="vFechaSugeridaSolServicio" id="vFechaSugeridaSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vHorarioSugeridoSolServicio">Horario sugerido:</label>
                    <input type="text" class="form-control " name="vHorarioSugeridoSolServicio" id="vHorarioSugeridoSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vFallaSolServicio">Causa:</label>
                    <input type="text" class="form-control " name="vFallaSolServicio" id="vFallaSolServicio" disabled>
                  </div>

         
                </div>

              </div>
            </div>
          </div> 
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal Ver Orden de Trabajo Preventivo -->
<div class="modal" id="verOtPreventivo" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Orden de Trabajo</h4>
      </div>
      <div class="modal-body">
        
        <div class="panel-group" id="accordionPrev" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOnePrev">
              <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordionPrev" href="#collapseOtPrev" aria-expanded="true" aria-controls="collapseOtPrev">
                  Datos de OT
                </a>
              </h4>
            </div>
            <div id="collapseOtPrev" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOnePrev">
              <div class="panel-body">

                <div class="row">
                  <div class="col-xs-12 col-sm-4">
                    <label for="vNroOtPrev">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOtPrev" id="vNroOtPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-8">
                    <label for="vDescripFallaPrev">Descripción:</label>
                    <input type="text" class="form-control vDescripFallaPrev" id="vDescripFallaPrev" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaCreacionPrev">Fecha Inicio:</label>
                    <input type="text" class="form-control " name="vFechaCreacionPrev" id="vFechaCreacionPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEntregaPrev">Fecha Entrega:</label>
                    <input type="text" class="form-control " name="vFechaEntregaPrev" id="vFechaEntregaPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursalPrev">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursalPrev" id="vSucursalPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedorPrev">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedorPrev" id="vProveedorPrev" disabled>
                  </div>
                </div>

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwoPrev">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionPrev" href="#collapseEquipoPrev" aria-expanded="false" aria-controls="collapseEquipoPrev">
                  Datos de equipo
                </a>
              </h4>
            </div>
            <div id="collapseEquipoPrev" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwoPrev">
              <div class="panel-body">
                
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vCodigoEquipoPrev">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipoPrev" id="vCodigoEquipoPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEquipoPrev">Fecha:</label>
                    <input type="text" class="form-control " name="vFechaEquipoPrev" id="vFechaEquipoPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vMarcaEquipoPrev">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipoPrev" id="vMarcaEquipoPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vUbicacionEquipoPrev">Ubicación:</label>
                    <input type="text" class="form-control " name="vUbicacionEquipoPrev" id="vUbicacionEquipoPrev" disabled>
                  </div>

                  <div class="col-xs-12">
                    <label for="vDescripcionEquipoPrev">Descripción:</label>
                    <Textarea class="form-control " name="vDescripcionEquipoPrev" id="vDescripcionEquipoPrev" disabled></Textarea>
                  </div>                  
                </div>

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThreePrev">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionPrev" href="#collapseTareaPrev" aria-expanded="false" aria-controls="collapseTareaPrev">
                  Datos de la Tarea
                </a>
              </h4>
            </div>
            <div id="collapseTareaPrev" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThreePrev">
              <div class="panel-body">
                
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vTareaPrev">Tarea:</label>
                    <input type="text" class="form-control " name="vTareaPrev" id="vTareaPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vComponentePrev">Componente:</label>
                    <input type="text" class="form-control " name="vComponentePrev" id="vComponentePrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vFechaBasePrev">Fecha Base:</label>
                    <input type="text" class="form-control " name="vFechaBasePrev" id="vFechaBasePrev" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vPeriodoPrev">Periodo:</label>
                    <input type="text" class="form-control " name="vPeriodoPrev" id="vPeriodoPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vFrecuenciaPrev">Frecuencia:</label>
                    <input type="text" class="form-control " name="vFrecuenciaPrev" id="vFrecuenciaPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vLecturaBasePrev">Lectura Base:</label>
                    <input type="text" class="form-control " name="vLecturaBasePrev" id="vLecturaBasePrev" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vAlertaPrev">Alerta:</label>
                    <input type="text" class="form-control " name="vAlertaPrev" id="vAlertaPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vDuraciónPrev">Duración:</label>
                    <input type="text" class="form-control " name="vDuraciónPrev" id="vDuraciónPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vUnidadTiempoPrev">Unidad de tiempo:</label>
                    <input type="text" class="form-control " name="vUnidadTiempoPrev" id="vUnidadTiempoPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vCantOperariosPrev">Cantidad Operarios:</label>
                    <input type="text" class="form-control " name="vCantOperariosPrev" id="vCantOperariosPrev" disabled>
                  </div>
                </div>

              </div>
            </div>
          </div>  
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFourPrev">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionPrev" href="#collapseHerramientas" aria-expanded="false" aria-controls="collapseHerramientas">
                  Herramientas
                </a>
              </h4>
            </div>
            <div id="collapseHerramientas" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFourPrev">
              <div class="panel-body">
                
                <!-- tabla -->
                <div class="row" >
                  <div class="col-xs-12">
                    <form id = "form_order">
                      <table class="table table-bordered" id="vTablaHerramientas" border="1px">
                        <thead>
                           <tr>
                            <th>Código</th>
                            <th>Marca</th>
                            <th>descripción</th>
                            <th>Cantidad</th>
                          </tr>
                        </thead>
                        <tbody>
                        </tbody>
                      </table>
                    </form>  
                  </div>
                </div>
                <!-- / tabla-->

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFivePrev">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionPrev" href="#collapseInsumos" aria-expanded="false" aria-controls="collapseInsumos">
                  Insumos
                </a>
              </h4>
            </div>
            <div id="collapseInsumos" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFivePrev">
              <div class="panel-body">
                
                <!-- tabla -->
                <div class="row" >
                  <div class="col-xs-12">
                    <form id = "form_order">
                      <table class="table table-bordered" id="vTablaInsumos" border="1px">
                        <thead>
                           <tr>
                            <th>Código</th>
                            <th>descripción</th>
                            <th>Cantidad</th>
                          </tr>
                        </thead>
                        <tbody>
                        </tbody>
                      </table>
                    </form>  
                  </div>
                </div>
                <!-- / tabla-->

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingSix">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionPrev" href="#collapseAdjunto" aria-expanded="false" aria-controls="collapseAdjunto">
                  Adjunto
                </a>
              </h4>
            </div>
            <div id="collapseAdjunto" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
              <div class="panel-body">
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal Ver Orden de Trabajo Backlog -->
<div class="modal" id="verOtBacklog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Orden de Trabajo</h4>
      </div>
      <div class="modal-body">
        
        <div class="panel-group" id="accordionBack" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOneBack">
              <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordionBack" href="#collapseOtBack" aria-expanded="true" aria-controls="collapseOtBack">
                  Datos de OT
                </a>
              </h4>
            </div>
            <div id="collapseOtBack" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOneBack">
              <div class="panel-body">

                <div class="row">
                  <div class="col-xs-12 col-sm-4">
                    <label for="vNroOtBack">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOtBack" id="vNroOtBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-8">
                    <label for="vDescripFallaBack">Descripción:</label>
                    <input type="text" class="form-control vDescripFallaBack" id="vDescripFallaBack" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaCreacionBack">Fecha Inicio:</label>
                    <input type="text" class="form-control " name="vFechaCreacionBack" id="vFechaCreacionBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEntregaBack">Fecha Entrega:</label>
                    <input type="text" class="form-control " name="vFechaEntregaBack" id="vFechaEntregaBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursalBack">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursalBack" id="vSucursalBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedorBack">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedorBack" id="vProveedorBack" disabled>
                  </div>
                </div>

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwoBack">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionBack" href="#collapseEquipoBack" aria-expanded="false" aria-controls="collapseEquipoBack">
                  Datos de equipo
                </a>
              </h4>
            </div>
            <div id="collapseEquipoBack" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwoBack">
              <div class="panel-body">
                
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vCodigoEquipoBack">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipoBack" id="vCodigoEquipoBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEquipoBack">Fecha:</label>
                    <input type="text" class="form-control " name="vFechaEquipoBack" id="vFechaEquipoBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vMarcaEquipoBack">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipoBack" id="vMarcaEquipoBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vUbicacionEquipoBack">Ubicación:</label>
                    <input type="text" class="form-control " name="vUbicacionEquipoBack" id="vUbicacionEquipoBack" disabled>
                  </div>

                  <div class="col-xs-12">
                    <label for="vDescripcionEquipoBack">Descripción:</label>
                    <Textarea class="form-control " name="vDescripcionEquipoBack" id="vDescripcionEquipoBack" disabled></Textarea>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vCodigoCompBack">Código de componente-equipo:</label>
                    <input type="text" class="form-control " name="vCodigoCompBack" id="vCodigoCompBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vDescripCompBack">Descripción de componente:</label>
                    <input type="text" class="form-control " name="vDescripCompBack" id="vDescripCompBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vSistemaBack">Sistema:</label>
                    <input type="text" class="form-control " name="vSistemaBack" id="vSistemaBack" disabled>
                  </div>               
                </div>

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThreeBack">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionBack" href="#collapseTareaBack" aria-expanded="false" aria-controls="collapseTareaBack">
                  Datos de la Tarea
                </a>
              </h4>
            </div>
            <div id="collapseTareaBack" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThreeBack">
              <div class="panel-body">
                
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vTareaBack">Tarea:</label>
                    <input type="text" class="form-control " name="vTareaBack" id="vTareaBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vFechaBack">Fecha:</label>
                    <input type="text" class="form-control " name="vFechaBack" id="vFechaBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vDuracionBack">Duración:</label>
                    <input type="text" class="form-control " name="vDuracionBack" id="vDuracionBack" disabled>
                  </div>
                </div>

              </div>
            </div>
          </div>  
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal Ver Orden de Trabajo Predictivo -->
<div class="modal" id="verOtPredictivo" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Orden de Trabajo</h4>
      </div>
      <div class="modal-body">
        
        <div class="panel-group" id="accordionPred" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOnePred">
              <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordionPred" href="#collapseOtPred" aria-expanded="true" aria-controls="collapseOtPred">
                  Datos de OT
                </a>
              </h4>
            </div>
            <div id="collapseOtPred" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOnePred">
              <div class="panel-body">

                <div class="row">
                  <div class="col-xs-12 col-sm-4">
                    <label for="vNroOtPred">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOtPred" id="vNroOtPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-8">
                    <label for="vDescripFallaPred">Descripción:</label>
                    <input type="text" class="form-control vDescripFallaPred" id="vDescripFallaPred" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaCreacionPred">Fecha Inicio:</label>
                    <input type="text" class="form-control " name="vFechaCreacionPred" id="vFechaCreacionPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEntregaPred">Fecha Entrega:</label>
                    <input type="text" class="form-control " name="vFechaEntregaPred" id="vFechaEntregaPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursalPred">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursalPred" id="vSucursalPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedorPred">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedorPred" id="vProveedorPred" disabled>
                  </div>
                </div>

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwoPred">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionPred" href="#collapseEquipoPred" aria-expanded="false" aria-controls="collapseEquipoPred">
                  Datos de equipo
                </a>
              </h4>
            </div>
            <div id="collapseEquipoPred" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwoPred">
              <div class="panel-body">
                
                <div class="row">
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vCodigoEquipoPred">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipoPred" id="vCodigoEquipoPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaEquipoPred">Fecha:</label>
                    <input type="text" class="form-control " name="vFechaEquipoPred" id="vFechaEquipoPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vMarcaEquipoPred">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipoPred" id="vMarcaEquipoPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vUbicacionEquipoPred">Ubicación:</label>
                    <input type="text" class="form-control " name="vUbicacionEquipoPred" id="vUbicacionEquipoPred" disabled>
                  </div>

                  <div class="col-xs-12">
                    <label for="vDescripcionEquipoPred">Descripción:</label>
                    <Textarea class="form-control " name="vDescripcionEquipoPred" id="vDescripcionEquipoPred" disabled></Textarea>
                  </div>                  
                </div>

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThreePred">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionPred" href="#collapseTareaPred" aria-expanded="false" aria-controls="collapseTareaPred">
                  Datos de la Tarea
                </a>
              </h4>
            </div>
            <div id="collapseTareaPred" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThreePred">
              <div class="panel-body">
                
                <div class="row">
                  <div class="col-xs-12">
                    <label for="vTareaPred">Tarea:</label>
                    <input type="text" class="form-control " name="vTareaPred" id="vTareaPred" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vFechaPred">Fecha:</label>
                    <input type="text" class="form-control " name="vFechaPred" id="vFechaPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vPeriodoPred">Periodo:</label>
                    <input type="text" class="form-control " name="vPeriodoPred" id="vPeriodoPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vFrecuenciaPred">Frecuencia:</label>
                    <input type="text" class="form-control " name="vFrecuenciaPred" id="vFrecuenciaPred" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vDuraciónPred">Duración:</label>
                    <input type="text" class="form-control " name="vDuraciónPred" id="vDuraciónPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vCantOperariosPred">Cantidad Operarios:</label>
                    <input type="text" class="form-control " name="vCantOperariosPred" id="vCantOperariosPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vCantHsHombrePred">Cantidad horas hombre:</label>
                    <input type="text" class="form-control " name="vCantHsHombrePred" id="vCantHsHombrePred" disabled>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->