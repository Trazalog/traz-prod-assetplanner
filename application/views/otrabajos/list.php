<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Orden de trabajo</h3>
          <?php
          if (strpos($permission,'Add') !== false) {           
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="btnAdd">Agregar</button>'; 
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
                        echo '<i class="fa fa-fw fa-print text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Imprimir Orden de Trabajo"></i>';
                        
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



/////////////////////////// FUNCIONES COMENTADAS PARA PROBAR SI SACAR O NO
    // Guarda una nueva OT - Ok
  // function guardaragregar(){
    
  //   $('#btn_guardar').prop("disabled", true);
    
  //   var num           = $('#nro1').val();
  //   var fecha_inicio  = $('#fechaInicio').val();
  //   var fecha_entrega = $('#fechaEntrega').val();
  //   var descripcion   = $('#vsdetal').val();
  //   var sucursal      = $('#suci').val();
  //   var proveedor     = $('#prov').val();
  //   var equipo        = $('#equipo').val();
    
  //   var hayError = false; 
  //   $('#error').hide();
  //   if($('#equipo').val() == '')
  //   {
  //     hayError = true;
  //   }
  //   if($('#fechaEntrega').val()=='' || $('#fechaEntrega').val()=='0000-00-00 00:00:00')
  //   {
  //     hayError = true;
  //   }
  //   if($('#suci').val() == '-1')
  //   {
  //     hayError = true;
  //   }
  //   if($('#prov').val() == '-1')
  //   {
  //     hayError = true;
  //   }
  //   if(hayError == true){
  //     $('#error').fadeIn('slow');  
  //     $('#btn_guardar').prop("disabled", false);   
  //     return;
  //   }  

  //   $.ajax({
  //     type: 'POST', 
  //     data: {num:num, 
  //           fecha_inicio: fecha_inicio,
  //           fecha_entrega:fecha_entrega, 
  //           equipo:equipo, 
  //           descripcion:descripcion, 
  //           sucursal:sucursal, 
  //           proveedor:proveedor},
  //     url: 'index.php/Otrabajo/guardar_agregar',
  //     success: function(data){
  //       //console.log(data);  
  //       $('#modalagregar').modal('hide');
  //       regresa1();
  //     },
  //     error: function(result){
  //       //$('#modalagregar').modal('hide');
  //       alert('Ocurrio un error en el guardado...');
  //       console.error("Error al agregar nueva OT. Ver console.table");
  //       console.table(result);
  //     }
  //   });        
  // }
  // llena select equipos en modal Editar OT - Ok
  // function traer_equipo2(id_equipo){
  //   $('#equipo1').empty();
  //   $.ajax({
  //     data: { },
  //     dataType: 'json',
  //     type: 'POST',
  //     url: 'index.php/Otrabajo/getequipo',
  //     success: function(data){
  //       var opcion  = "<option value='-1'>Seleccione...</option>" ; 
  //       $('#equipo1').append(opcion); 
  //       for(var i=0; i < data.length ; i++) 
  //       {    
  //         var selectAttr = '';
  //         if(data[i]['id_equipo'] == id_equipo) { var selectAttr = 'selected'; }
  //         var nombre = data[i]['codigo'];
  //         var opcion = "<option value='"+data[i]['id_equipo']+"' "+selectAttr+">" +nombre+ "</option>" ; 
  //         $('#equipo1').append(opcion);             
  //       }
  //     },
  //     error: function(result){
  //       console.error("Error al traer equipos. Ver console.table");
  //       console.table(result);
  //     },
  //   });
  // }

  // // llena select sucursales en modal Editar - Ok
  // function traer_sucursal2(id_sucursal){
  //   $('#sucidedit').text("");
  //   $.ajax({
  //     type: 'POST',
  //     data: { },
  //     url: 'index.php/Otrabajo/traer_sucursal',
  //     success: function(data){
  //       for(var i=0; i < data.length ; i++) 
  //       {
  //         //console.info("i:"+data[i]['id_equipo']);
  //         var selectAttr = '';
  //         if(data[i]['id_sucursal'] == id_sucursal) { var selectAttr = 'selected';}
  //         var nombre = data[i]['descripc'];
  //         var opcion = "<option value='"+data[i]['id_sucursal']+"' "+selectAttr+">" +nombre+ "</option>";
  //         $('#sucidedit').append(opcion); 
  //       }
  //     },
  //     error: function(result){
  //       console.error("Error al traer sucursales en Editar OT");
  //       console.table(result);
  //     },
  //     dataType: 'json'
  //   });
  // }    

  // // llena select proveedores en modal Editar - Ok
  // function traer_prov1(id_proveedor){
  //   $('#prov1').text("");
  //   $.ajax({
  //     type: 'POST',
  //     data: {},
  //     url: 'index.php/Otrabajo/getproveedor',
  //     success: function(data){
  //       for(var i=0; i < data.length ; i++) 
  //       {
  //         //console.info("i:"+data[i]['id_equipo']);
  //         var selectAttr = '';
  //         if(data[i]['provid'] == id_proveedor) { var selectAttr = 'selected'; }
  //         var nombre = data[i]['provnombre'];
  //         var opcion = "<option value='"+data[i]['provid']+"' "+selectAttr+">" +nombre+ "</option>";
  //         $('#prov1').append(opcion); 
  //       }
  //     },
  //     error: function(result){
  //       console.log(result);
  //     },
  //     dataType: 'json'
  //   });
  // }
///////////////////////////  FIN FUNCIONES COMENTADAS PARA PROBAR SI SACAR O NO





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

// DATATABLE
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


<!-- Modal editar -->
<div class="modal" id="modaleditar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">      
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">
                  <h4><i class="icon fa fa-ban"></i> Error!</h4>
                  Revise que todos los campos obligatorios esten seleccionados
            </div>
          </div>
        </div>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-pencil text-light-blue"></span> Editar Orden de Trabajo </h4>
        </div> <!-- /.modal-header  -->

        <div class="modal-body" id="modalBodyArticle">
          
          <div class="panel panel-default">        
            <div class="panel-heading">
              <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del equipo </h3>
            </div>

            <div class="panel-body">
              <div class="row">
                <div class="col-xs-12 col-sm-6 com-md-4">
                  <label for="equipo">Equipo:</label>
                  <input type="text" id="equipo_descrip"  name="equipo_descrip" class="form-control input-md" disabled />
                  <input type="hidden" id="equipo"  name="equipo" class="form-control input-md" disabled />
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
                  <label for="tarea">Tarea Estandar<strong style="color: #dd4b39">*</strong>:</label>
                  <input type="text" id="tarea" name="tarea" class="form-control" placeholder="Buscar Tarea...">
                  <input type="hidden" id="id_tarea" name="id_tarea"> 
                </div>
                <div class="col-xs-12 col-sm-6">  
                  <label for="tarea_manual">Tarea Personalizada<strong style="color: #dd4b39">*</strong>:</label> 
                  <input type="text" id="tareacustom" name="tareacustom" class="form-control" placeholder="Ingresar Tarea...">     
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12 col-sm-6">
                  <label for="fechaInicio">Fecha Inicio:</label>
                  <input type="text" class="datepicker form-control fecha" id="fechaInicio" name="fechaInicio" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>" size="27"/>
                </div> 
                
                <div class="col-xs-12 col-sm-6">
                  <label for="fechaEntrega">Fecha Entrega:</label>
                  <input type="text" class="datepicker form-control fecha" id="fechaEntrega" name="fechaEntrega" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>" size="27"/>
                </div>

                <div class="col-xs-12 col-sm-6">
                  <label for="suci">Sucursal</label>
                  <select  id="suci" name="suci" class="form-control" />
                </div>
                <div class="col-xs-12 col-sm-6">
                  <label for="prov">Proveedor</label>
                  <select  id="prov" name="prov" class="form-control" />
                </div>            
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-xs-12">
              <div class="nav-tabs-custom">
                <!--tabs -->
                <ul class="nav nav-tabs" role="tablist">                
                  <li role="presentation" class="active"><a href="#herramin" aria-controls="profile" role="tab" data-toggle="tab">Herramientas</a></li>
                  <li role="presentation"><a href="#insum" aria-controls="messages" role="tab" data-toggle="tab">Insumos</a></li>
                  <li role="presentation"><a href="#TabAdjunto" aria-controls="messages" role="tab" data-toggle="tab">Adjunto</a></li>                        
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

                  <!-- <div role="tabpanel" class="tab-pane" id="adj">
                    <div class="row">
                      <div class="col-xs-12">
                        <input id="inputPDF" name="inputPDF" type="file" class="form-control input-md">
                        <style type="text/css">
                          #inputPDF {
                            padding-bottom: 40px;
                          }
                        </style>
                      </div> 
                    </div><!- - /.row - ->
                  </div> <!- - /.tab-pane #adj - -> -->






                  <div role="tabpanel" class="tab-pane" id="TabAdjunto">
                    <div class="row" >

                    <div class="col-xs-12"><i class="fa fa-plus-square agregaAdjunto text-light-blue" style="color:#f39c12; cursor:pointer; margin-right:10px" title="Agregar Adjunto"></i> Agregar Archivo</div>
                    
                    
                      <div class="col-xs-12">
                        <table class="table table-bordered" id="tablaadjunto"> 
                          <thead>
                            <tr>
                              <th></th>
                              <th>Archivo</th>
                            </tr>
                          </thead>
                          <tbody>
                            <!-- <tr>
                              <td id="accionAdjunto">
                                  <!- - - ->
                              </td>
                              <td>
                                <!- - <a id="adjunto" href="" target="_blank"></a> - ->
                              </td>
                            </tr> -->
                          </tbody>
                        </table>
                      </div>
        
                    </div>
                  </div><!--cierre de TabAdjunto--> 




                  
                </div>  <!-- tab-content -->
                
              </div><!-- /.nav-tabs-custom -->
            </div>
          </div>
          
        </div>      <!-- /.modal-body --> 
                   
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" >Cancelar</button>
          <button type="button" class="btn btn-primary" id="btnEditar" onclick="guardareditar()">Guardar</button> 
        </div>  <!-- /.modal footer -->
        </div>
                        
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>

<!--------------- MODALES ADJUNTO ------------->

<!-- Modal Eliminar Adjunto -->
<div class="modal" id="modalEliminarAdjunto">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="idAdjunto">
        <h4>¿Desea eliminar Archivo Adjunto?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarAdjunto();">Eliminar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Agregar adjunto -->
<div class="modal" id="modalAgregarAdjunto">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span class="fa fa-fw fa-plus-square text-light-blue"></span> Agregar</h4>
      </div>

      <form id="formAgregarAdjunto">
        <div class="modal-body">
          <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
            <h4><i class="icon fa fa-ban"></i> Error!</h4>
            Seleccione un Archivo Adjunto
          </div>
          <input type="hidden" id="idAgregaAdjunto" name="idAgregaAdjunto">
          <input id="inputPDF" name="inputPDF" type="file" class="form-control input-md">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary" id="btnAgregarEditar">Agregar</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!--------------- MODALES ADJUNTO ------------->




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
                  <div class="col-xs-12 col-sm-3">
                    <label for="vIdOt">Id de OT:</label>
                    <input type="text" class="form-control " name="vIdOt" id="vIdOt" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-3">
                    <label for="vNroOt">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOt" id="vNroOt" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6">
                    <label for="vDescripFalla">Descripción:</label>
                    <input type="text" class="form-control vDescripFalla" id="vDescripFalla" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaProgram">Fecha Programación:</label>
                    <input type="text" class="form-control " name="vFechaProgram" id="vFechaProgram" disabled>
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
                    <label for="vEstado">Estado:</label>
                    <input type="text" class="form-control " name="vEstado" id="vEstado" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursal">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursal" id="vSucursal" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedor">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedor" id="vProveedor" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vOrigen">Origen:</label>
                    <input type="text" class="form-control " name="vOrigen" id="vOrigen" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vAsignado">Asignado:</label>
                    <input type="text" class="form-control " name="vAsignado" id="vAsignado" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">

                    <a href="" alt="adjunto" target="_blank">adjunto</a>
                     
                    
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
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vCodigoEquipo">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipo" id="vCodigoEquipo" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vMarcaEquipo">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipo" id="vMarcaEquipo" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
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
                  <div class="col-xs-12 col-sm-3">
                    <label for="vIdOtSolServicio">Id de OT:</label>
                    <input type="text" class="form-control " name="vIdOtSolServicio" id="vIdOtSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-3">
                    <label for="vNroOtSolServicio">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOtSolServicio" id="vNroOtSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6">
                    <label for="vDescripFallaSolServicio">Descripción:</label>
                    <input type="text" class="form-control vDescripFallaSolServicio" id="vDescripFallaSolServicio" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaProgramSolServicio">Fecha Programación:</label>
                    <input type="text" class="form-control " name="vFechaProgramSolServicio" id="vFechaProgramSolServicio" disabled>
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
                    <label for="vEstadoSolServicio">Estado:</label>
                    <input type="text" class="form-control " name="vEstadoSolServicio" id="vEstadoSolServicio" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursalSolServicio">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursalSolServicio" id="vSucursalSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedorSolServicio">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedorSolServicio" id="vProveedorSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vOrigenSolServicio">Origen:</label>
                    <input type="text" class="form-control " name="vOrigenSolServicio" id="vOrigenSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vAsignadoSolServicio">Asignado:</label>
                    <input type="text" class="form-control " name="vAsignadoSolServicio" id="vAsignadoSolServicio" disabled>
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
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vCodigoEquipoSolServicio">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipoSolServicio" id="vCodigoEquipoSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vMarcaEquipoSolServicio">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipoSolServicio" id="vMarcaEquipoSolServicio" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
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
                  <div class="col-xs-12 col-sm-3">
                    <label for="vIdOtPrev">Id de OT:</label>
                    <input type="text" class="form-control " name="vIdOtPrev" id="vIdOtPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-3">
                    <label for="vNroOtPrev">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOtPrev" id="vNroOtPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6">
                    <label for="vDescripFallaPrev">Descripción:</label>
                    <input type="text" class="form-control vDescripFallaPrev" id="vDescripFallaPrev" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaProgramPrev">Fecha Programación:</label>
                    <input type="text" class="form-control " name="vFechaProgramPrev" id="vFechaProgramPrev" disabled>
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
                    <label for="vEstadoPrev">Estado:</label>
                    <input type="text" class="form-control " name="vEstadoPrev" id="vEstadoPrev" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursalPrev">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursalPrev" id="vSucursalPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedorPrev">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedorPrev" id="vProveedorPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vOrigenPrev">Origen:</label>
                    <input type="text" class="form-control " name="vOrigenPrev" id="vOrigenPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vAsignadoPrev">Asignado:</label>
                    <input type="text" class="form-control " name="vAsignadoPrev" id="vAsignadoPrev" disabled>
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
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vCodigoEquipoPrev">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipoPrev" id="vCodigoEquipoPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vMarcaEquipoPrev">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipoPrev" id="vMarcaEquipoPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
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
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vAlertaPrev">Alerta:</label>
                    <input type="text" class="form-control " name="vAlertaPrev" id="vAlertaPrev" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vDuraciónPrev">Duración:</label>
                    <input type="text" class="form-control " name="vDuraciónPrev" id="vDuraciónPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vUnidadTiempoPrev">Unidad de tiempo:</label>
                    <input type="text" class="form-control " name="vUnidadTiempoPrev" id="vUnidadTiempoPrev" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
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
                  <div class="col-xs-12 col-sm-3">
                    <label for="vIdOtBack">Id de OT:</label>
                    <input type="text" class="form-control " name="vIdOtBack" id="vIdOtBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-3">
                    <label for="vNroOtBack">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOtBack" id="vNroOtBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6">
                    <label for="vDescripFallaBack">Descripción:</label>
                    <input type="text" class="form-control vDescripFallaBack" id="vDescripFallaBack" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaProgram">Fecha Programación:</label>
                    <input type="text" class="form-control " name="vFechaProgram" id="vFechaProgram" disabled>
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
                    <label for="vEstadoBack">Estado:</label>
                    <input type="text" class="form-control " name="vEstadoBack" id="vEstadoBack" disabled>
                  </div>
                  
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursalBack">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursalBack" id="vSucursalBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedorBack">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedorBack" id="vProveedorBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vOrigenBack">Origen:</label>
                    <input type="text" class="form-control " name="vOrigenBack" id="vOrigenBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vAsignadoBack">Asignado:</label>
                    <input type="text" class="form-control " name="vAsignadoBack" id="vAsignadoBack" disabled>
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
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vCodigoEquipoBack">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipoBack" id="vCodigoEquipoBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vMarcaEquipoBack">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipoBack" id="vMarcaEquipoBack" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
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
                  <div class="col-xs-12 col-sm-3">
                    <label for="vIdOt">Id de OT:</label>
                    <input type="text" class="form-control " name="vIdOt" id="vIdOt" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-3">
                    <label for="vNroOtPred">Número de OT:</label>
                    <input type="text" class="form-control " name="vNroOtPred" id="vNroOtPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6">
                    <label for="vDescripFallaPred">Descripción:</label>
                    <input type="text" class="form-control vDescripFallaPred" id="vDescripFallaPred" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vFechaProgramPred">Fecha Programación:</label>
                    <input type="text" class="form-control " name="vFechaProgramPred" id="vFechaProgramPred" disabled>
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
                    <label for="vEstadoPred">Estado:</label>
                    <input type="text" class="form-control " name="vEstadoPred" id="vEstadoPred" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vSucursalPred">Sucursal:</label>
                    <input type="text" class="form-control " name="vSucursalPred" id="vSucursalPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vProveedorPred">Proveedor:</label>
                    <input type="text" class="form-control " name="vProveedorPred" id="vProveedorPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vOrigenPred">Origen:</label>
                    <input type="text" class="form-control " name="vOrigenPred" id="vOrigenPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-3">
                    <label for="vAsignadoPred">Asignado:</label>
                    <input type="text" class="form-control " name="vAsignadoPred" id="vAsignadoPred" disabled>
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
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vCodigoEquipoPred">Equipo:</label>
                    <input type="text" class="form-control " name="vCodigoEquipoPred" id="vCodigoEquipoPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
                    <label for="vMarcaEquipoPred">Marca:</label>
                    <input type="text" class="form-control " name="vMarcaEquipoPred" id="vMarcaEquipoPred" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-4">
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