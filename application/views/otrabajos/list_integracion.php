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
// var globales
  var iort  = "";
  var ido   = "";
  var idp   = "";
  var idArt = 0;
  var acArt = "";
  var i     = "";
  var idord = "";
  var idfin = "";
  var descrip = "";
  var sol_id;

$('.ot-row').on('click',function(){
  sol_id = $(this).data('idsolicitud');
});
// cargo plugin DateTimePicker
$('#fechaEntrega, #fecha_inicio1, #fecha_inicio, #fecha_entrega1, #fecha_entregaa').datetimepicker({
  format: 'YYYY-MM-DD H:mm:ss', //format: 'YYYY-MM-DD', // es igaul a campo date
  locale: 'es',
}); 
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
}


// boton agregar nueva ot
$("#btnAdd").click(function (e) {   
  WaitingOpen('Cargando Nueva OT...');
  $('#content').empty();   
  $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/nuevaOT/<?php echo $permission; ?>");
  WaitingClose();
});
// boton guardar 
$("#btn_cancGuardado").click(function (e) { 
  $('#btn_guardar').prop("disabled", false);
  $('#error').fadeOut('slow');
  $('.text_box').val('');
  $('.select_box').val('-1');
});



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


///// EDICION DE ORDEN DE TRABAJO  

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
      $('#tareacustom').val('');  // borra la tarea custom
    },
  });

  // limpia un input al seleccionar o llenar otro
  $('#tarea').change(function(){    
    $('#tareacustom').val(''); 
  });
  $('#tareacustom').change(function(){
    $('#tarea').val('');
    $('#id_tarea').val('');
  });

  // Trae datos para llenar el modal Editar OT - Ok
  $(".fa-pencil").click(function(e) { 

    $('#errorE').hide();
    $('#btnEditar').prop("disabled", false); 
    var idord = $(this).parent('td').parent('tr').attr('id');
    idp = idord;
    // agrega id de ot par guardar con adjuntos
    $('#idAgregaAdjunto').val(idp);
    //borra la tabla de adjuntos antes de cargar 
    $('#tablaadjunto tbody tr').remove();
    
    console.log("idp: "+idp);
    $.ajax({
      data: { idp:idp },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Otrabajo/getpencil',
      success: function(data){
        console.table(data);
        var resp = data['datos'];
        datos = {
          'id_ot'         : resp[0]['id_orden'],        //
          'nro'           : resp[0]['nro'],             //
          'equipo_descrip': resp[0]['codigo'],          //
          'fecha_ingreso' : resp[0]['fecha_ingreso'],
          'id_equipo'     : resp[0]['id_equipo'],       //
          'marca'         : resp[0]['marca'],
          'ubicacion'     : resp[0]['ubicacion'],
          'descripcion'   : resp[0]['equipodescrip'],
          'id_tarea'      : resp[0]['id_tarea'],            
          'fecha_inicio'  : resp[0]['fecha_inicio'],    //
          'fecha_entrega' : resp[0]['fecha_entrega'],   //
          'idusuario'     : resp[0]['id_usuario'],      //
          'tareadescrip'  : resp[0]['tareadescrip'],     //
          'id_sucu'       : resp[0]['id_sucursal'],     //
          'sucursal'      : resp[0]['descripc'],        //
          'id_proveedor'  : resp[0]['provid'],          //
          'nombreprov'    : resp[0]['provnombre']//,      //
          //'adjunto'       :resp[0]['ot_adjunto']        //
        }
        
        var herram = data['herramientas'];             
        var insum  = data['insumos']; 
        var adjunto = data['adjunto'];
        console.table(adjunto);
        completarEdit(datos, herram, insum, adjunto);
      },
      error: function(result){
        console.error("Error al Editar OT. Ver console.table");
        console.table(result);
      },
    });
  });

  // completa los datos del modal Editar - Ok
  function completarEdit(datos, herram, insum, adjunto){  

    $('#equipo_descrip').val(datos['equipo_descrip']);
    $('#equipo').val(datos['id_equipo']);
    $('#fecha_ingreso').val(datos['fecha_ingreso']);
    $('#marca').val(datos['marca']);
    $('#ubicacion').val(datos['ubicacion']);
    $('#descripcion').val(datos['descripcion']);   
    if(datos['id_tarea'] != '0'){   
      $('#id_tarea').val(datos['id_tarea']);
      $('#tarea').val(datos['tareadescrip']);    
    }else{
      $('#tareacustom').val(datos['tareadescrip']); }
    $('#fechaInicio').val(datos['fecha_inicio']); 
    $('#fechaEntrega').val(datos['fecha_entrega']);  
    $("#suci").val(datos['id_sucu']);
    $("#prov").val(datos['id_proveedor']);
    

    $('#tablaherramienta tbody tr').remove();
    for (var i = 0; i < herram.length; i++) {
      var tr = "<tr id='"+herram[i]['herrId']+"'>"+
      "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
      "<td>"+herram[i]['herrcodigo']+"</td>"+
      "<td>"+herram[i]['herrmarca']+"</td>"+
      "<td>"+herram[i]['herrdescrip']+"</td>"+
      "<td>"+herram[i]['cantidad']+"</td>"+                   
      "</tr>";
      $('#tablaherramienta tbody').append(tr);
    }

    $('#tablainsumo tbody tr').remove();
    for (var i = 0; i < insum.length; i++){                                             
      var tr = "<tr id='"+insum[i]['artId']+"'>"+
      "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
      "<td>"+insum[i]['artBarCode']+"</td>"+
      "<td>"+insum[i]['artDescription']+"</td>"+
      "<td>"+insum[i]['cantidad']+"</td>"+                   
      "</tr>";
      $('#tablainsumo tbody').append(tr);
    }

    recargaTablaAdjunto(adjunto);

    $(document).on("click",".elirow",function(){
      var parent = $(this).closest('tr');
      $(parent).remove();
    });  
  } 

  // Guarda Edicion de OT - Ok
  function guardareditar(){
    WaitingOpen('Guardando Edición...');
    $('#errorE').hide(); 
    $('#btnEditar').prop("disabled", true);
    var hayError = false; 
    
    //var nro           = $('#nroedit').val();
    var fecha_inicio  = $('#fechaInicio').val();
    var fecha_entrega = $('#fechaEntrega').val();
    var id_sucu       = $('#suci').val();
    var id_prov     = $('#prov').val();
    var id_equipo     = $('#equipo').val();
    var tareacustom   = $('#tareacustom').val();
    var tareaestandar = $('#tarea').val();
    var id_tarea      = $('#id_tarea').val();
    var descripcion   = '';    
    if (tareacustom == '') {
      descripcion   = $('#tarea').val();      
    } else {
      descripcion   = $('#tareacustom').val();
      id_tarea = 0;
    }

    var parametros = {
      //'nro'           : nro,                                          
      'fecha_inicio'  : fecha_inicio,
      'fecha_entrega' : fecha_entrega,   
      'id_tarea'      : id_tarea,  
      'descripcion'   : descripcion,    
      'id_sucursal'   : id_sucu,                  
      'id_proveedor'  : id_prov,                
      'id_equipo'     : id_equipo                    
    };    

    // Arma array de herramientas y cantidades
    var idsherramienta = new Array();     
    $("#tablaherramienta tbody tr").each(function (index){
      var id_her = $(this).attr('id');
      idsherramienta.push(id_her);        
      });    
    var cantHerram = new Array(); 
    $("#tablaherramienta tbody tr").each(function (index){         
      var cant_herr = $(this).find("td").eq(4).html();
      cantHerram.push(cant_herr);                   
    });
    // Arma array de insumos y cantidades
    var idsinsumo = new Array();     
    $("#tablainsumo tbody tr").each(function (index){
      var id_ins = $(this).attr('id');
      idsinsumo.push(id_ins);        
    });
    var cantInsum = new Array(); 
    $("#tablainsumo tbody tr").each(function (index){         
      var cant_insum = $(this).find("td").eq(3).html();
      cantInsum.push(cant_insum); 
    });     

    //validaciones
      // if($('#equipo').val() == '')
      // {
      //   hayError = true;
      // }      
      // if ((tareacustom == '') && (id_tarea == '')){
      //   hayError = true;
      // }
      // if($('#fechaInicio').val()=='' || $('#fechaEntrega').val()=='0000-00-00 00:00:00')
      // {
      //   hayError = true;
      // }
      // if(fecha_entrega=='' || fecha_entrega=='0000-00-00 00:00:00')
      // {
      //   hayError = true;
      // }
      // if($('#suci').val() == '-1')
      // {
      //   hayError = true;
      // }
      // if($('#prov').val() == '-1')
      // {
      //   hayError = true;
      // }
      // //console.error( hayError );
      // if(hayError == true){
      //   $('#errorE').fadeIn('slow');     
      //   return;
      // }

    $.ajax({
      type: 'POST',
      data: {parametros:parametros, 
              idOT:idp,
              idsherramienta: idsherramienta,
              cantHerram: cantHerram,
              idsinsumo: idsinsumo, 
              cantInsum: cantInsum },
      url: 'index.php/Otrabajo/guardar_editar',
      success: function(data){
        WaitingClose();
        $('#modaleditar').modal('hide');
        regresa1();
      },
      error: function(result){
        WaitingClose();
        $('#btnEditar').prop("disabled", false);
        console.error("Error al guardar en modal Editar Ot");
        console.table(result);
      }
    });
    
  }
///// EDICION DE ORDEN DE TRABAJO  


/// EDICION Y AGREGADO DE ADJUNTOS
  //abrir modal eliminar adjunto
  $(document).on("click",".eliminaAdjunto",function(){
    $('#modalEliminarAdjunto').modal('show');  
    var id_adjunto = $(this).parents("tr").attr('id');
    $('#idAdjunto').val(id_adjunto);
    console.log(id_adjunto + 'adjunto');
  });
  //eliminar adjunto
  function eliminarAdjunto() {
    $('#modalEliminarAdjunto').modal('hide');
    var id_adjunto = $('#idAdjunto').val();
    $.ajax({
      data: { id_adjunto: id_adjunto },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Otrabajo/eliminarAdjunto',
    }) 
    .done( function(data){     
      //console.table(data); 
      let prevAdjunto = '';
      borrarRegistro(id_adjunto);
      //recargaTablaAdjunto(prevAdjunto);
    })                
    .error( function(result){                      
      console.error(result);
    }); 
  }
  // //abrir modal agregar adjunto
  $(document).on("click",".agregaAdjunto",function(){
    $('#btnAgregarEditar').text("Agregar");
    $('#modalAgregarAdjunto .modal-title').html('<span class="fa fa-fw fa-plus-square text-light-blue"></span> Agregar');

    $('#modalAgregarAdjunto').modal('show');
    // var idprev = $('#id_Predictivo').val();
    // $('#idAgregaAdjunto').val(idprev);
  });
  //abrir modal editar adjunto
  $(document).on("click",".editaAdjunto",function(){
    $('#btnAgregarEditar').text("Editar");
    $('#modalAgregarAdjunto .modal-title').html('<span class="fa fa-fw fa-pencil text-light-blue"></span> Editar');

    $('#modalAgregarAdjunto').modal('show');
    var idprev = $('#id_Predictivo').val();
    $('#idAgregaAdjunto').val(idprev);
  });
  //eliminar adjunto
  $("#formAgregarAdjunto").submit(function (event){
    $('#modalAgregarAdjunto').modal('hide');
    WaitingOpen('Guardando Adjunto...');
    event.preventDefault();  
    if (document.getElementById("inputPDF").files.length == 0) {
      $('#error').fadeIn('slow');
    }
    else{
      $('#error').fadeOut('slow');
      var formData = new FormData($("#formAgregarAdjunto")[0]);
      //debugger
      $.ajax({
        cache:false,
        contentType:false,
        data:formData,
        dataType:'json',
        processData:false,
        type:'POST',
        url:'index.php/Otrabajo/agregarAdjunto',
      })
      .done( function(data){  
        nuevoAdjunto(data);
        WaitingClose();
      })                
      .error( function(result){ 
        WaitingClose();                     
        console.error(result);
      }); 
    }
  });
  // recarga tablas de adjuntos al iniciar la edicion
  function recargaTablaAdjunto(Adjunto) {
    
    for (var i = 0;  i < Adjunto.length; i++) {       

      var tr = "<tr id='"+Adjunto[i]['id']+"'>"+
      "<td ><i class='fa fa-times-circle eliminaAdjunto text-light-blue' style='cursor:pointer; margin-right:10px' title='Eliminar Adjunto'></i></td>'"+
      "<td><a id='' href='"+Adjunto[i]['ot_adjunto']+"' target='_blank'>Archivo adjunto</a></td>"+      
      "</tr>";
      $('#tablaadjunto tbody').append(tr);
    }  

  }
  // agrega nuevo registro en tabla despues de guardarlo
  function nuevoAdjunto(data){
    var tr = "<tr id='"+data['id']+"'>"+
      "<td ><i class='fa fa-times-circle eliminaAdjunto text-light-blue' style='cursor:pointer; margin-right:10px' title='Eliminar Adjunto'></i></td>'"+
      "<td><a id='' href='"+data['ot_adjunto']+"' target='_blank'>Archivo adjunto</a></td>"+      
      "</tr>";
      $('#tablaadjunto tbody').append(tr);
  }
  // borra registro en tabla si fue eliminado con exito
  function borrarRegistro(id_adjunto){
    var tabla = $('#tablaadjunto tbody tr');
    $.each(tabla, function(){
      var idTrow = $(this).attr('id');
      if (idTrow == id_adjunto) {
        $(this).remove();
      }
    });
  }
///  / EDICION Y AGREGADO DE ADJUNTOS

  

  ////// HERRAMIENTAS //////

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

  $(".fa-toggle-on").click(function (e) { 
    var idord = $(this).parent('td').parent('tr').attr('id');
    console.log(idord);  
    idfin=idord;
  });
  

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



// AGREGAR NOTA DE PEDIDO
  $(".fa-cart-plus").click(function (e) { 
    var id = $(this).parent('td').parent('tr').attr('id');
    console.log("El id de OT es: "+id);
    iort = id;
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Notapedido/agregarnota/<?php echo $permission; ?>/"+iort);
    WaitingClose();  
  });

//  VER OT  //
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
      //console.table(data);
      traerDatosOt(idot, data.tipo, data.id_solicitud);
    })
    .fail( () => alert( "Error al traer los datos de la OT." ) )
    .always( () => WaitingClose() );
  });

  // Elige a que fcion que trae datos de OT llamar, según su origen
  function traerDatosOt(idOt, tipo, idSolicitud) {
    console.info(idOt+' - '+idSolicitud);
    var datos = null;
    switch (tipo) {
      case '1': //Orden de trabajo
        datos = getDataOt(idOt, "orden de Trabajo");
        fillModalView(datos);
        $('#verOt').modal('show');
        WaitingClose();
        break;
      case '2': //Solicitud de servicio
        datos = getDataOtSolServicio(idOt, idSolicitud, "Solicitud de Servicio");
        fillModalViewSolServicio(datos);
        $('#verOtSolServicio').modal('show');
        WaitingClose();
        break;
      case '3': //preventivo
        datos = getDataOtPreventivo(idOt, idSolicitud, "Preventivo");
        fillModalViewPreventivo(datos);
        $('#verOtPreventivo').modal('show');
        WaitingClose();
        break;
      case '4': //Backlog
        datos = getDataOtBacklog(idOt, idSolicitud, "Backlog");
        fillModalViewBacklog(datos);
        $('#verOtBacklog').modal('show');
        WaitingClose();
        break;
      case '5': //predictivo
        datos = getDataOtPredictivo(idOt, idSolicitud, "Predictivo");
        fillModalViewPredictivo(datos);
        $('#verOtPredictivo').modal('show');
        WaitingClose();
        break;
      case '6': //correctivo programado
        //break;
      default:
        console.error('Tipo de dato desconocido');
        WaitingClose();
        break;
    }
  }

  /***** 1 OT *****/
  // Trae datos de OT 
  function getDataOt(idOt, origen) {
    WaitingOpen('Cargando datos...');
    var datos = null;
    $.ajax({
      async:false,
      data: { idOt:idOt },
      dataType: 'json',
      method: 'POST',
      url: 'index.php/Otrabajo/getViewDataOt',
    })
    .done( (data) => {
      //console.table(data);
      datos = {
        //Panel datos de OT
        'id_ot'          : data['id_orden'],
        'nro'            : data['nro'],
        'descripcion_ot' : data['descripcionFalla'],
        'fecha_inicio'   : data['fecha_inicio'],
        'fecha_entrega'  : data['fecha_entrega'],
        'fecha_program'  : data['fecha_program'],
        'estado'         : data['estado'],
        'sucursal'       : data['descripc'],
        'nombreprov'     : data['provnombre'],
        'origen'         : origen,
        'fecha_program'  : data['fecha_program'],
        'asignado'       : data['usrLastName']+' '+data['usrLastName'],
        'estado'         : data['estado'],
        //Panel datos de equipos
        'codigo'         : data['codigo'],
        'marca'          : data['marca'],
        'ubicacion'      : data['ubicacion'],
        'descripcion_eq' : data['descripcionEquipo'],
        'comp_equipo'    : data['compEquipo'],
      }
    })
    .fail( () => alert( "Error al traer los datos de la OT." ) );
    return datos;
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

    $('#vIdOt').val(datos['id_ot']);
    $('#vOrigen').val(datos['origen']);
    $('#vFechaProgram').val(datos['fecha_program']);
    $('#vAsignado').val(datos['asignado']);
    $('#vEstado').val(datos['estado']);
    //llenar datos de equipo
    $('#vCodigoEquipo').val(datos['codigo']);
    $('#vMarcaEquipo').val(datos['marca']);
    $('#vUbicacionEquipo').val(datos['ubicacion']);
    $('#vDescripcionEquipo').val(datos['descripcion_eq']);
  }

  /***** 2 Solicitud de Servicios *****/
  // Trae datos de Solicitud de Servicios con origen Backlog
  function getDataOtSolServicio(idOt, idSolServicio, origen) {
    WaitingOpen('Cargando datos...');
    var datos = null;
    $.ajax({
      async: false,
      data: { idOt:idOt, idSolServicio:idSolServicio },
      dataType: 'json',
      method: 'POST',
      url: 'index.php/Otrabajo/getViewDataSolServicio',
    })
    .done( (data) => {
      console.table(data);
      datos = {
        //Panel datos de OT
        'id_ot'          : data['id_orden'],
        'nro'            : data['nro'],
        'descripcion_ot' : data['descripcionFalla'],
        'fecha_inicio'   : data['fecha_inicio'],
        'fecha_entrega'  : data['fecha_entrega'],
        'fecha_program'  : data['fecha_program'],
        'estado'         : data['estado'],
        'sucursal'       : data['descripc'],
        'nombreprov'     : data['provnombre'],
        'origen'         : origen,
        'fecha_program'  : data['fecha_program'],
        'asignado'       : data['usrLastName']+' '+data['usrLastName'],
        'estado'         : data['estado'],
        //Panel datos de equipos
        'codigo'         : data['codigo'],
        'marca'          : data['marca'],
        'ubicacion'      : data['ubicacion'],
        'descripcion_eq' : data['descripcionEquipo'],
        'comp_equipo'    : data['compEquipo'],
        'solServicio'   : data['solServicio'],
      };
    })
    .fail( () => alert( "Error al traer los datos de la OT." ) );
    return datos;
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

    $('#vIdOtSolServicio').val(datos['id_ot']);
    $('#vOrigenSolServicio').val(datos['origen']);
    $('#vFechaProgramSolServicio').val(datos['fecha_program']);
    $('#vAsignadoSolServicio').val(datos['asignado']);
    $('#vEstadoSolServicio').val(datos['estado']);
    //llenar datos de equipo
    $('#vCodigoEquipoSolServicio').val(datos['codigo']);
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
  function getDataOtPreventivo(idOt, idPreventivo, origen) {
    WaitingOpen('Cargando datos...');
    var datos = null;
    $.ajax({
      async: false,
      data: { idOt:idOt, idPreventivo:idPreventivo },
      dataType: 'json',
      method: 'POST',
      url: 'index.php/Otrabajo/getViewDataPreventivo',
    })
    .done( (data) => {
      //console.table(data);
      datos = {
        //Panel datos de OT
        'id_ot'          : data['id_orden'],
        'nro'            : data['nro'],
        'descripcion_ot' : data['descripcionFalla'],
        'fecha_inicio'   : data['fecha_inicio'],
        'fecha_entrega'  : data['fecha_entrega'],
        'fecha_program'  : data['fecha_program'],
        'estado'         : data['estado'],
        'sucursal'       : data['descripc'],
        'nombreprov'     : data['provnombre'],
        'origen'         : origen,
        'fecha_program'  : data['fecha_program'],
        'asignado'       : data['usrLastName']+' '+data['usrLastName'],
        'estado'         : data['estado'],
        //Panel datos de equipos
        'codigo'         : data['codigo'],
        'marca'          : data['marca'],
        'ubicacion'      : data['ubicacion'],
        'descripcion_eq' : data['descripcionEquipo'],
        'tarea' : data['tarea'],
      };
    })
    .fail( () => alert( "Error al traer los datos de la OT." ) );
    return datos;
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

    $('#vIdOtPrev').val(datos['id_ot']);
    $('#vOrigenPrev').val(datos['origen']);
    $('#vFechaProgramPrev').val(datos['fecha_program']);
    $('#vAsignadoPrev').val(datos['asignado']);
    $('#vEstadoPrev').val(datos['estado']);
    //llenar datos de equipo
    $('#vCodigoEquipoPrev').val(datos['codigo']);
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

  /***** 4 Backlog *****/
  // Trae datos de OT con origen Backlog
  function getDataOtBacklog(idOt, idBacklog, origen) {
    WaitingOpen('Cargando datos...');
    var datos = null;
    $.ajax({
      async: false,
      data: { idOt:idOt, idBacklog:idBacklog },
      dataType: 'json',
      method: 'POST',
      url: 'index.php/Otrabajo/getViewDataBacklog',
    })
    .done( (data) => {
      //console.table(data);
      datos = {
        //Panel datos de OT
        'id_ot'          : data['id_orden'],
        'nro'            : data['nro'],
        'descripcion_ot' : data['descripcionFalla'],
        'fecha_inicio'   : data['fecha_inicio'],
        'fecha_entrega'  : data['fecha_entrega'],
        'fecha_program'  : data['fecha_program'],
        'estado'         : data['estado'],
        'sucursal'       : data['descripc'],
        'nombreprov'     : data['provnombre'],
        'origen'         : origen,
        'fecha_program'  : data['fecha_program'],
        'asignado'       : data['usrLastName']+' '+data['usrLastName'],
        'estado'         : data['estado'],
        //Panel datos de equipos
        'codigo'         : data['codigo'],
        'marca'          : data['marca'],
        'ubicacion'      : data['ubicacion'],
        'descripcion_eq' : data['descripcionEquipo'],
        'comp_equipo'    : data['compEquipo'],
        'tarea'          : data['tarea'],
      };
    })
    .fail( () => alert( "Error al traer los datos de la OT." ) );
    return datos;
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

    $('#vIdOtBack').val(datos['id_ot']);
    $('#vOrigenBack').val(datos['origen']);
    $('#vFechaProgramBack').val(datos['fecha_program']);
    $('#vAsignadoBack').val(datos['asignado']);
    $('#vEstadoBack').val(datos['estado']);
    //llenar datos de equipo
    $('#vCodigoEquipoBack').val(datos['codigo']);
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

  /***** 5 Predictivo *****/
  // Trae datos de OT con origen Predictivo
  function getDataOtPredictivo(idOt, idPredictivo, origen) {
    WaitingOpen('Cargando datos...');
    var datos = null;
    $.ajax({
      async: false,
      data: { idOt:idOt, idPredictivo:idPredictivo },
      dataType: 'json',
      method: 'POST',
      url: 'index.php/Otrabajo/getViewDataPredictivo',
    })
    .done( (data) => {
      console.table(data);
      datos = {
        //Panel datos de OT
        'id_ot'          : data['id_orden'],
        'nro'            : data['nro'],
        'descripcion_ot' : data['descripcionFalla'],
        'fecha_inicio'   : data['fecha_inicio'],
        'fecha_entrega'  : data['fecha_entrega'],
        'fecha_program'  : data['fecha_program'],
        'estado'         : data['estado'],
        'sucursal'       : data['descripc'],
        'nombreprov'     : data['provnombre'],
        'origen'         : origen,
        'fecha_program'  : data['fecha_program'],
        'asignado'       : data['usrLastName']+' '+data['usrLastName'],
        'estado'         : data['estado'],
        //Panel datos de equipos
        'codigo'         : data['codigo'],
        'marca'          : data['marca'],
        'ubicacion'      : data['ubicacion'],
        'descripcion_eq' : data['descripcionEquipo'],
        'tarea'          : data['tarea'],
      };
    })
    .fail( () => alert( "Error al traer los datos de la OT." ) );
    return datos;
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

    $('#vIdOtPred').val(datos['id_ot']);
    $('#vOrigenPred').val(datos['origen']);
    $('#vFechaProgramPred').val(datos['fecha_program']);
    $('#vAsignadoPred').val(datos['asignado']);
    $('#vEstadoPred').val(datos['estado']);
    //llenar datos de equipo
    $('#vCodigoEquipoPred').val(datos['codigo']);
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

// IMPRIMIR
  $(".fa-print").click( function(e){
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
      traerDatosImprimirOt(idot, data.tipo, data.id_solicitud);
    })
    .fail( () => alert( "Error al traer los datos de la OT." ) )
    .always( () => WaitingClose() );
  });

  // Elige a que fcion que trae datos de OT llamar, según su origen
  function traerDatosImprimirOt(idOt, tipo, idSolicitud) {
    console.info(idOt+' - '+idSolicitud);
    var datos = null;
    switch (tipo) {
      case '1': //Orden de trabajo
        datos = getDataOt(idOt, "orden de Trabajo");
        fillPrintView(datos, tipo);
        WaitingClose();
        break;
      case '2': //Solicitud de servicio
        datos = getDataOtSolServicio(idOt, idSolicitud, "Solicitud de Servicio");
        fillPrintView(datos, tipo);
        WaitingClose();
        break;
      case '3': //preventivo
        datos = getDataOtPreventivo(idOt, idSolicitud, "Preventivo");
        fillPrintView(datos, tipo);
        WaitingClose();
        break;
      case '4': //Backlog
        datos = getDataOtBacklog(idOt, idSolicitud, "Backlog");
        fillPrintView(datos, tipo);
        WaitingClose();
        break;
      case '5': //predictivo
        datos = getDataOtPredictivo(idOt, idSolicitud, "Predictivo");
        fillPrintView(datos, tipo);
        WaitingClose();
        break;
      case '6': //correctivo programado
        //break;
      default:
        console.error('Tipo de dato desconocido');
        WaitingClose();
        break;
    }
  }

  //llena datos del modal preventivo
  function fillPrintView(datos, tipo){
    console.table(datos);
    $.ajax({
      type: 'POST',
      data: { datos:datos, tipo:tipo },
      dataType: 'text',
      url: 'index.php/Otrabajo/printOT',
      success: function(data){
        texto = data;
        var mywindow = window.open('', 'Imprimir', 'height=700,width=900');
        mywindow.document.write('<html><head><title></title>');
        mywindow.document.write('</head><body onload="window.print();">');
        mywindow.document.write(texto);
        mywindow.document.write('</body></html>');
        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10
        return true; 
      },
      error: function(result){
        console.log(result);
        console.log("error en la vista imprimir");
      },
    });
  }

</script>