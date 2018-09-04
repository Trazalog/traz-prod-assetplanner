<input type="hidden" id="permission" value="<?php echo $permission;?>">
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error1" style="display: none">
          <h4><i class="icon fa fa-ban"></i> ALERTA!</h4>
          Este equipo! SI tiene datos tecnicos cargados
      </div>
  </div>
</div>
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Equipo/Sector</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="btnAgre">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="sales" class="table table-bordered table-hover">
            <thead>
              <tr>                
                <th>Acciones</th>
                <th>Equipo</th>
                <th>Descripción</th>
                <th>Área</th>
                <th>Proceso</th>
                <th>Sector</th>
                <th>Criticidad</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach($list as $a)
                {
                  $id = $a['id_equipo'];                  
                  echo '<tr id="'.$id.'" >';
                  echo '<td>';
                  if (strpos($permission,'Del') !== false) {
                    echo '<i href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar"></i>';
                  }
                  if (strpos($permission,'Edit') !== false) {
                    echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar" data-toggle="modal" data-target="#modaleditar"></i>' ;
                    //echo '<i class="fa fa-sticky-note-o text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Datos Tecnicos" data-toggle="modal" data-target="#modaltecnico"></i>' ;
                    //echo '<i class="fa fa-fw fa-print text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Imprimir"></i>';
                  }
                  if (strpos($permission,'Del') !== false) {
                    echo '<i class="fa fa-fw  fa fa-user text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Contratista" data-toggle="modal" data-target="#modalasignar"></i>';
                    //antes estaba el estado R por que ERA REPARACION pero ahora reparacion es R
                    if( ($a['estado'] == 'AC') || ($a['estado'] == 'RE') ){
                      echo '<i  href="#"class="fa fa-fw fa fa-toggle-on text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Inhabilitar"></i>';
                    }
                    else {
                      echo '<i class="fa fa-fw fa fa-toggle-off text-light-blue" title="Habilitar" style="cursor: pointer; margin-left: 15px;"></i>';
                    }
                  }
                  if (strpos($permission,'Lectura') !== false) {
                     echo '<i class="fa fa-hourglass-half text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Mantenimiento Autónomo" data-toggle="modal" data-target="#modalectura"></i>';
                     echo '<i class="fa fa-history text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Historial de Lecturas" data-toggle="modal" data-target="#modalhistlect"></i>';
                  }
                  echo '</td>';
                  '<input type="hidden" id="id_equipo" name="id_equipo">';
                  echo '<td class="maquin">'.$a['codigo'].'</td>';
                  echo '<td>'.$a['deeq'].'</td>';
                  echo '<td>'.$a['dear'].'</td>';
                  echo '<td>'.$a['depro'].'</td>';
                  echo '<td>'.$a['desec'].'</td>';
                  echo '<td>'.$a['decri'].'</td>';
                  echo '<td>'
                    .($a['estado'] == 'AC' ? '<small class="label pull-left bg-green">Activo</small>' 
                    :($a['estado'] == 'IN' ? '<small class="label pull-left bg-blue">Inhabilitado</small>'
                    :($a['estado'] == 'RE' ? '<small class="label pull-left bg-yellow">Reparación</small>' 
                    : '<small class="label pull-left bg-red">Anulado</small>'))).'</td>';
                  echo '</tr>';
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
$('#modalhistlect').on('shown.bs.modal', function (e) {
  // recalcula el ancho de las columnas
  $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
})


var isOpenWindow = false;
var comglob      = "";
var ide          = "";
var idglob       = "";

$(document).ready(function(event) {
  
  $( function() {
    $( ".datepicker" ).datepicker();
  } );

  // Carga vista para agregar equipo nuevo - Chequeado
  edit=0;  datos=Array()  
  $('#btnAgre').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Equipo/cargarequipo/<?php echo $permission; ?>");
    WaitingClose();
  });

  // Elimina Equipos (Cambio de estado a AN) - Chequeado
  $(".fa-times-circle").click(function (e) { 
    if (!confirm("Realmente desea eiminar este equipo?")){
      return;
    } else {
      console.log("Estoy eliminando"); 
      var idequipo = $(this).parent('td').parent('tr').attr('id');
      console.log(idequipo);
      $.ajax({
        type: 'POST',
        data: { idequipo: idequipo},
        url: 'index.php/Equipo/baja_equipo', 
        success: function(data){
          alert("Equipo/sector ANULADO");
          regresa();                  
        },                
        error: function(result){                    
          console.log(result);
        },
        dataType: 'json'
      });
    }    
  });
  
  //Editar Revisar no trae los datos para lenar los combos
  $(".fa-pencil").click(function(e) { 
    limpiarselect();  //limpia select modal edicion
    var id_equipo = $(this).parent('td').parent('tr').attr('id');
    comglob = id_equipo;
    console.log(id_equipo);
    console.log(comglob);
    $.ajax({
      data: { id_equipo: id_equipo},
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Equipo/getpencil', 
      success: function(data){                                  
        console.log(data); 
        datos = {
          'id_equipo':id_equipo,
          'descripcion':data[0]['descripcion'],
          'fecha_ingreso':data[0]['fecha_ingreso'],
          'fecha_garantia':data[0]['fecha_garantia'],
          'marca':data[0]['marca'],
          'codigo':data[0]['codigo'],
          'ubicacion':data[0]['ubicacion'],
          'empresa':data[0]['deemp'], //descricion de empresa
          'id_empresa':data[0]['id_empresa'], // id de empresa
          'id_sector':data[0]['id_sector'], //desect
          'sector':data[0]['desect'],
          'id_grupo':data[0]['id_grupo'], //degrup
          'grupo':data[0]['degrupo'], //degrup
          'criticidad':data[0]['decriti'], //decriti
          'id_criticidad':data[0]['id_criti'], //decriti
          'estado':data[0]['estado'],
          'fecha_ultimalectura':data[0]['fecha_ultimalectura'],
          'ultima_lectura':data[0]['ultima_lectura']       
        },             
        edit = 1;
        console.log("datos a enviar");
        console.log(datos);
        completarEdit(datos,edit);                
      },
      error: function(result){
        console.log(result);
      },
    });  
  });

  // Asigna contratista - Chequeado
  $(".fa-user ").click(function (e) { 
    var id_equipo = $(this).parent('td').parent('tr').attr('id');
    console.log(id_equipo);
    idglob = id_equipo;
    console.log("variable global- id de equipo");
    console.log(idglob);
    click_empresa();
    click_co(id_equipo);
    traer_contratista();        
  });
   
  // Cambiar a estado - Chequeado
  $(".fa-toggle-on").click(function (e) { 
    var idequipo = $(this).parent('td').parent('tr').attr('id');
    console.log(idequipo);
    $.ajax({
      type: 'POST',
      data: { idequipo: idequipo},
      url: 'index.php/Equipo/cambio_equipo', 
      success: function(data){
        console.log(data);
        alert("Se cambio el estado del equipo a INACTIVO");            
        regresa();          
      },
      error: function(result){
        console.log(result);
      },
      dataType: 'json'
    });
  });

  // Cambiar a estado - Chequeado
  $(".fa-toggle-off").click(function (e) { 
    var idequipo = $(this).parent('td').parent('tr').attr('id');
    console.log(idequipo);
    $.ajax({
      type: 'POST',
      data: { idequipo: idequipo},
      url: 'index.php/Equipo/cambio_estado', 
      success: function(data){
        console.log(data);
        alert("Se cambio el estado del equipo a ACTIVO");
        regresa();    
      },
      error: function(result){
        console.log(result);
      },
      dataType: 'json'
    });
  });
 
  // Impresion - Chequeado
  $(".fa-print").click(function (e) {
    e.preventDefault();
    var idequip = $(this).parent('td').parent('tr').attr('id');
    console.log("El id de orden al imprimir es :");
    console.log(idequip);
    // alert(id_orden);
    $.ajax({
      type: 'POST',
      data: { idequip: idequip},
      dataType: 'json',
      url: 'index.php/Equipo/getsolImp', //index.php/
      success: function(data){
        console.log("Entre a la impresion");
        console.log(data);
        console.log(data.datos.codigo);
        console.log(data.equipos.asegurado);
        console.log(data.orden.nombre);
        var fecha = new Date(data.datos.fechain);
        var day = fecha.getDate();
        var month = fecha.getMonth();
        var year = fecha.getUTCFullYear();
        fecha = day + '-' + month + '-' + year;
        //data.equipos.fecha_vigencia
        //data.equipos.fecha_inicio
        var fechav = new Date(data.equipos.fecha_vigencia);
        var day = fechav.getDate();
        var month = fechav.getMonth();
        var year = fechav.getUTCFullYear();
        fechav = day + '-' + month + '-' + year;
        var fechai = new Date(data.equipos.fecha_inicio);
        var day = fechai.getDate();
        var month = fechai.getMonth();
        var year = fechai.getUTCFullYear();
        fechai = day + '-' + month + '-' + year;
        var trequipos = '';
        for(var i=0; i < data['orden'].length ; i++){   
          var fecha1 = new Date(data['orden'][i]['fecha']);
          var day = fecha1.getDate();
          var month = fecha1.getMonth();
          var year = fecha1.getUTCFullYear();
          fecha1 = day + '-' + month + '-' + year;
          trequipos  = trequipos+"<tr>  <td width='10%'>"+ fecha1+"</td> <td width='10%'>"+data['orden'][i]['causa']+"</td> <td width='10%'>"+data['orden'][i]['causa']+"</td> <td width='10%'>"+data['orden'][i]['nombre']+"</td><td width='10%'>"+data['orden'][i]['estado']+"</td>  </tr>" ;                           
        }
        var texto =
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
                                      '<div  class="col-md-4 "><h3> FICHA TECNICA DE SERVICIO</h3>'+
                                      '</div>'+
                                    '</td>'+
                                  '</tr>'+
                                  '</tr>'+
                                '</table>'+
                              '</div>'+
                            '</div>'+
                            '<div class="row">'+
                              '<div class="col-sm-12 col-md-12">'+
                                '<table width="100%" style="text-align:justify" border="1px solid black" >'+  
                                  '<tr>'+
                                      '<td>Numero de serie</td>'+
                                      '<td>'+data.datos.numero_serie+'</td>'+
                                      '<td style="text-align: left"" >Codigo del equipo</td>'+
                                      '<td>'+data.datos.codigo+'</td>'+
                                      '</tr>'+

                                      '<tr>'+
                                      '<td>Marca del motor</td>'+
                                      '<td>'+data.datos.marca+'</td>'+
                                      '<td align="left" >Estado del equipo</td>'+
                                      '<td>'+data.datos.estado+'</td>'+
                                      '</tr>'+

                                      '<tr>'+
                                      '<td>Modelo del motor</td>'+
                                      '<td>'+data.datos.modelo+'</td>'+
                                      '<td>Dominio</td>'+
                                      '<td>'+data.datos.dominio+'</td>'+
                                      '</tr>'+

                                      '<tr>'+
                                      '<td>Numero de motor</td>'+
                                      '<td>'+data.datos.numero_motor+'</td>'+
                                      '<td>Marca de equipo</td>'+
                                      '<td>'+data.datos.marcaeq+'</td>'+
                                      '</tr>'+

                                      '<tr>'+
                                      '<td>Año de fabricacion</td>'+
                                      '<td>'+data.datos.fabricacion+'</td>'+
                                      '<td>Modelo de equipo</td>'+
                                      '<td>'+data.datos.modelo+'</td>'+
                                      '</tr>'+

                                      '<tr>'+
                                      '<td>Baterias</td>'+
                                      '<td>'+data.datos.bateria+'</td>'+
                                      '<td>Ubicacion</td>'+
                                      '<td>'+data.datos.ubicacion+'</td>'+
                                      '</tr>'+

                                      '<tr>'+
                                      '<td>Peso Operativo</td>'+
                                      '<td>'+data.datos.ubicacion+'</td>'+
                                      '<td>Sector</td>'+
                                      '<td>'+data.datos.sector+'</td>'+
                                      '</tr>'+

                                      '<tr>'+
                                      '<td>Ingreso a la Reparacion</td>'+
                                      '<td>'+fecha+'</td>'+  //data.datos.fechain
                                      '<td>Horas del equipo a la fecha</td>'+
                                      '<td>'+data.datos.hora_lectura+'</td>'+
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
                                      '<td colspan="4" align="center">Datos de Poliza de Seguro</td>'+   
                                  '</tr>'+
                                  '<tr>'+
                                      '<td colspan="4" align="left">Seguro Obligatorio Automotor</td>'+   
                                  '</tr>'+
                                   '<tr>'+
                                      '<td colspan="4" align="left">Decreto 1716/08 - Reclamo Ley: 26.363</td>'+   
                                  '</tr>'+
                                  '<tr>'+
                                      '<td>Asegurado</td>'+ 
                                      '<td colspan="4">'+data.equipos.asegurado+'</td>'+
                                  '</tr>'+

                                      '<tr>'+
                                      '<td>Ref</td>'+
                                      '<td>'+data.equipos.ref+'</td>'+
                                      '<td >Poliza</td>'+
                                      '<td>'+data.equipos.numero_pliza+'</td>'+
                                      '</tr>'+

                                      '<tr>'+
                                      '<td>Vigencia desde</td>'+
                                      '<td>'+fechav+'</td>'+ //data.equipos.fecha_vigencia
                                      '<td>Hasta</td>'+
                                      '<td>'+fechai+'</td>'+ //data.equipos.fecha_inicio
                                      '</tr>'+

                                '</table>'+
                              '</div>'+
                            '</div>'+
                            '<div class="col-sm-6 col-md-6" border="1" >'+
                            '</div>'+
                        
                            '<br>'+
                            '<br>'+

                           //aca va la tabla 

                            '<div class="row">'+
                              '<div class="col-xs-10 col-xs-offset-1 text-center">'+
                             
                                '<table class="table table-bordered"  style="text-align:justify" border="1px solid black" >'+ //class="table table-bordered"
                                  '<thead>'+
                                    '<tr colspan="6" height="30">'+
                                      '<th width="20%">Fecha </th>'+
                                      '<th width="40%">Descripcion del arreglo</th>'+
                                      '<th width="25%">Diagnostico realizado por </th>'+
                                      '<th width="25%">Reparacion realizado por </th>'+
                                      '<th width="10%">Estado de la reparacion </th>'+
                                    '</tr>'+
                                  '</thead>'+
                                  
                                  '<tbody style="text-align:center">'+trequipos+
                                  '<tr colspan="2">'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                  '<tr colspan="2">'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                  '<tr colspan="2">'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                  '<tr colspan="2">'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                  '<tr colspan="2">'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                  '<tr colspan="2">'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                    '<tr colspan="2">'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                    '<tr colspan="2">'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                    '<tr>'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                    '<tr>'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                  '<tr>'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                  '<tr colspan="2">'+
                                    '<td style="text-align: center" ></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                    '<td><br></td>'+
                                  '</tr>'+
                                  '</tbody>'+
                                '</table>'+    
                              '</div>'+
                            '</div>'+
                            //'<div class="container-fluid">'+
                     
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
    });
  });   

  /// Lectura Hugo   
    // Modal ingreso lectura - Chequeado
    $(".fa-hourglass-half").click(function(e){
     
        $(".clear").val("");  //llimpia los inputs del modal lectura
        
        var $id_equipo = $(this).parent('td').parent('tr').attr('id');
        $('#id_maquina').val($id_equipo);
        var $nom_equipo = $(this).parents("tr").find("td").eq(1).html();
        $('#maquina').val($nom_equipo);
        var $estado = $(this).parents("tr").find("td").eq(7).find("small").html();

        console.log("estado: ");
        console.log($estado);
        $.ajax({
              type: 'POST',
              data: { idequipo: $id_equipo},
              url: 'index.php/Equipo/getEqPorId', 
              success: function(data){                                    
                      estBoton($estado);       //agrega boton de estados
                    },                
              error: function(result){
                    
                    console.log(result);
                  },
                  dataType: 'json'
        });   
    });

    /// agrega el estado del boton en modal - Chequeado
    function estBoton($estado){
      
      var estado = $estado;
      console.log(estado);
      if (estado == 'Reparación') {  //reparacion
        inhabilitar();          
      }
      if (estado == 'Activo') {  //activo
        habilitar();
      }
    }

    /// cambio de estado desde el boton - Chequeado
    $(".llave").click(function(e){

      var estadobton = $(this).attr("class");
      
      if (estadobton == 'fa fa-fw llave fa-toggle-on') {
        inhabilitar();
      }
      if (estadobton == 'fa fa-fw llave fa-toggle-off') {         
        habilitar();
      }  
    });  

    // Chequeado
    function habilitar(){
      $(".llave").removeClass("fa-toggle-off");  
      $(".llave").addClass("fa-toggle-on");
      $("label#botestado").text('Activo');
      $("input#estado").val('AC'); // Estado Activo
    }
    // Chequeado
    function inhabilitar(){
      $(".llave").removeClass("fa-toggle-on");  
      $(".llave").addClass("fa-toggle-off");
      $("label#botestado").text('Reparación');
      $("input#estado").val('RE'); // Estado Reparacion
    }
  
  // Datatable - Chequeado
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
  $('#tblhistorial').DataTable({
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

// Completa campos y select para Editar equipos - Listo
function completarEdit(datos ,edit){

  console.log("datos que llegaron");
  $('#equipo').val(datos['id_equipo']);
  $('#descripcion').val(datos['descripcion']);
  $('#fecha_ingreso').val(datos['fecha_ingreso']);
  $('#fecha_garantia').val(datos['fecha_garantia']);  
  
  $('#marca1').append($('<option>', {
      text: datos['marca']
  }));   

  $('#codigo').val(datos['codigo']);
  $('#ubicacion').val(datos['ubicacion']); 
  $('#empresa').val(datos['empresa']);
  $('#id_empresa').val(datos['id_empresa']);

  $('#criticidad').append($('<option>', {
      text: datos['criticidad'],
      value: datos['id_criticidad']
  }));

  $('#etapa').append($('<option>', {
      text: datos['sector'],
      value: datos['id_sector']
  }));

  $('#grupo').append($('<option>', {
      text: datos['grupo'],
      value: datos['id_grupo']
  }));  
  $('#estado').val(datos['estado']);

  var fecha = datos['fecha_ultimalectura'];

  $('#fecha_ultimalectura').val(fecha);

  $('#ultima_lectura').val(datos['ultima_lectura']);
  
  traer_empresa();
  traer_etapa();
  traer_grupo();
  traer_criticidad();
  traer_marca();
}

// limpia los select modal editar - listo
function limpiarselect(){
  $('#criticidad').html("");
  $('#marca1').html("");
  $('#etapa').html("");
  $('#grupo').html("");
}

// Chequeado
function regresa(){

  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Equipo/index/<?php echo $permission; ?>");
  WaitingClose();
}

// Chequeado para impresion
function cerro(){
  
  isOpenWindow = false;
}

// guarda contratista asignado a equipo - Chequeado
function guardarsi(){

    var idequipo = $(this).parent('td').parent('tr').attr('id');
    console.log("Equipo");
    console.log(idglob);
    var ideq = $(this).parent('td').parent('tr').attr('class');
    console.log(ideq);
    datos= parseInt(ideq);
    console.log(datos);

    var idscontra = new Array();     
    $("#tablaempresa tbody tr").each(function (index){

      var id_contratista = $(this).attr('id');
      idscontra.push(id_contratista);           
    }); 

    var parametros = {
       'id_equipo': idglob       
    };

    $.ajax({
      type:"POST",
      url: 'index.php/Equipo/guardarcontra', 
      data:{ idglob:idglob, idscontra:idscontra},
      success: function(data){
              alert("Contratista guardado con exito");              
              },          
      error: function(data){ 
              alert("Error en guardado...");
              console.log("Error: " + data['status']);
              },
      dataType: 'json'
    });
}

// Guarda edicion de equipo
function guardar(){

  var codigo = $('#codigo').val();
  var ubicacion = $('#ubicacion').val();
  var marca= $('#marca1 option:selected').text();
  var descripcion = $('#descripcion').val();
  var fecha_ingreso = $('#fecha_ingreso').val();
  var fecha_ultimalectura = $('#fecha_ultimalectura').val();
  var ultima_lectura = $('#ultima_lectura').val();
  var fecha_garantia = $('#fecha_garantia').val();
  var id_empresa = $('#id_empresa').val();
  var sector = $('#etapa option:selected').val();
  var criticidad = $('#criticidad option:selected').val();
  var grupo = $('#grupo').val();

  var parametros = { 'descripcion': descripcion,
                    'fecha_ingreso': fecha_ingreso,
                    'fecha_garantia': fecha_garantia,
                    'marca': marca,
                    'codigo': codigo,
                    'ubicacion': ubicacion,
                    'id_empresa' : id_empresa,
                    'id_sector' : sector,
                    'id_grupo' : grupo,
                    'id_criticidad' : criticidad,
                    'estado' : 'AC',
                    'fecha_ultimalectura': fecha_ultimalectura,
                    'ultima_lectura': ultima_lectura,             
                  };

  console.log("estoy editando");
  console.log("parametros");
  $.ajax({
      type: 'POST',
      data: {data:parametros, comglob: comglob},
      url: 'index.php/Equipo/editar_equipo',  //index.php/
      success: function(data){
               
              console.log(data);
              regresa();                    
              },
      error: function(result){
              
              console.log(result);
              
            }
            //dataType: 'json'
  });
}

// Trae grupo y completa el select grupo - Chequeado
function traer_grupo(){
      
  $.ajax({
    type: 'POST',
    url: 'index.php/Equipo/getgrupo', //index.php/
    success: function(data){
           
              //var opcion  = "<option value='-1'>Seleccione...</option>" ; 
              //$('#grupo').append(opcion); 
              for(var i=0; i < data.length ; i++){    

                var nombre = data[i]['descripcion'];
                var opcion  = "<option value='"+data[i]['id_grupo']+"'>" +nombre+ "</option>" ;
                $('#grupo').append(opcion);                                    
              }
            },
    error: function(result){
          
            console.log(result);
          },
    dataType: 'json'
  });
}
// Trae criticidad y completa el select grupo - Chequeado
function traer_criticidad(){
    
  $.ajax({
      type: 'POST',
      url: 'index.php/Equipo/getcriti', //index.php/
      success: function(data){
             
                for(var i=0; i < data.length ; i++){    
                  var nombre = data[i]['descripcion'];
                  var opcion  = "<option value='"+data[i]['id_criti']+"'>" +nombre+ "</option>" ; 
                  $('#criticidad').append(opcion);                                   
                }
              },
      error: function(result){              
              console.log(result);
            },
      dataType: 'json'
  });
}

// Trae etapa/sector y llena el select - Chequeado
function traer_etapa(){
  $.ajax({
    type: 'POST',    
    url: 'index.php/Equipo/getetapa', //index.php/
    success: function(data){           
                      
              for(var i=0; i < data.length ; i++){ 
                var nombre = data[i]['descripcion'];
                var opcion  = "<option value='"+data[i]['id_sector']+"'>" +nombre+ "</option>" ;
                $('#etapa').append(opcion);                               
              }            
            },
    error: function(result){
          
            console.log(result);
          },
    dataType: 'json'
  });
}

// Llena select en modal editar de marcas
function traer_marca(){

    //$('#marca1').html('');
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Equipo/getmarca', //index.php/
      success: function(data){
             
               //var opcion  = "<option value='-1'>Seleccione...</option>" ; 
              $('#marca1').append(opcion); 
              for(var i=0; i < data.length ; i++) 
              {    
                  var nombre = data[i]['marcadescrip'];
                  var opcion  = "<option value='"+data[i]['marcaid']+"'>" +nombre+ "</option>" ; 
                  $('#marca1').append(opcion); 
                                 
              }
              
            },
      error: function(result){
            
            console.log(result);
          },
          dataType: 'json'
      });
}

// Trae contratistas y llena selecte en modal editar
function traer_contratista(){
    
    $.ajax({
        type: 'POST',
        data: { },
        url: 'index.php/Equipo/getcontra', 
        success: function(data){
                       
                var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                $('#empresae').append(opcion); 
                for(var i=0; i < data.length ; i++) {    
                      
                      var nombre = data[i]['nombre'];
                      var opcion  = "<option value='"+data[i]['id_contratista']+"'>" +nombre+ "</option>" ; 
                      $('#empresae').append(opcion);                     
                }
              },
        error: function(result){
              
              console.log(result);
            },
            dataType: 'json'
    });
}

function click_empresa(){
      
      $("#adde").click(function (e) {

          var $empresae = $("select#empresae option:selected").html();
          var id_equipo= $('#codigoe').val();
          var id_contratista= $('#empresae').val();

          console.log(id_contratista);
          console.log(id_equipo);
          var tr = "<tr id='"+id_contratista+"' >"+
                            "<td><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
                            "<td>"+id_equipo+"</td>"+
                            "<td>"+$empresae+"</td>"+
                            
                        "</tr>";
           

          $('#tablaempresa tbody').append(tr);
                
          $(document).on("click",".elirow",function(){
          var parent = $(this).closest('tr');
          $(parent).remove();
          });
               
          $('#empresae').val(''); 
           
      });
}
    
function click_co(id_equipo){
      
  console.log(id_equipo);

  $.ajax({
      type: 'POST',
      data: { id_equipo: id_equipo},
      url: 'index.php/Equipo/getco',
      success: function(data){
              //var data = jQuery.parseJSON( data );
              
              //console.log(data);
             
              var fechai = data[0]['fecha_ingreso'];
              var fechag= data[0]['fecha_garantia']; 
              var mar = data[0]['marca']; 
              var ubica = data[0]['ubicacion']; 
              var descrip = data[0]['descripcion'];
              var codigoe= data[0]['codigo']; 

              $('#codigoe').val(codigoe);
              $('#fecha_ingresoe').val(fechai); 
              $('#fecha_garantiae').val(fechag);      
              $('#marcae').val(mar);   
              $('#descripcione').val(descrip);       
              $('#ubicacione').val(ubica);  

            },
        
      error: function(result){
            
            console.log(result);
          },
          dataType: 'json'
  });
   
}



/// Hitorial de lecturas
  $(".fa-history").click(function(e){
    $("tr.registro").remove();
    var $id_equipo = $(this).parent('td').parent('tr').attr('id');      
    console.log("id de equipo: "+$id_equipo);

    $.ajax({
      type: 'POST',
      data: { idequipo: $id_equipo},
      url: 'index.php/Equipo/getHistoriaLect', 
      success: function(data){   
        console.table(data);
        llenarModal(data);
      },
      error: function(result){
        console.log(result);
      },
      dataType: 'json'
    });   
  });

   /// llena modal historial de lecturas
  function llenarModal(data){
    console.table(data);
    if(Array.isArray(data) && data.length) {
      console.log("El equipo SI tiene historial de lecturas");
      $("#codEquipo").text(data[0]['codigo']);
      //borro los datos de la tabla
      $('#tblhistorial').DataTable().clear().draw();
      for (var i=0; i< data.length; i++) {      
        $('#tblhistorial').DataTable().row.add( [
          data[i]['lectura'],
          data[i]['fecha'],
          data[i]['turno'],
          data[i]['operario'],
          data[i]['observacion']
        ]).draw();
        /*$("#tblhistorial tbody").append(  
         '<tr class="registro">'+         
              '<td class="clear">'+ data[i]['lectura'] +'</td>'+
              '<td class="clear">'+ data[i]['fecha'] +'</td>'+                            
              '<td class="clear">'+ data[i]['turno'] +'</td>'+
              '<td class="clear">'+ data[i]['operario'] +'</td>'+
              '<td class="clear">'+ data[i]['observacion'] +'</td>'+
          '</tr>'
        );*/
      } 
    } else { 
      $("#codEquipo").text("Equipo sin historial de lecturas");
      $('#tblhistorial').DataTable().clear().draw();
      console.log("El equipo NO tiene historial de lecturas"); 
    }
  }  

  function guardarlectura() {
    
    var lectura = $("#formlectura").serializeArray();
    console.table(lectura);
    $.ajax({
            type:"POST",
            url: "index.php/Equipo/setLectura", 
            data:lectura,
            success: function(data){
              console.log("Guardado con exito...");
              regresa();
            },          
            error: function(result){
                console.log("Error en guardado de Lectura...");
                console.log(result);                 
            },
            dataType: 'json'
    });
  }  


</script>


<!-- Modal ASIGNAR-->
<div id="modalasignar" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Asignación de contratista a equipo</h4>
      </div>
      <div class="modal-body">
        <div class="row" >
          <div class="col-xs-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title fa fa-cogs"> Datos del Equipo</h4>
              </div><!-- /.panel-heading -->

              <div class="panel-body">
                <div class="row">
                  <div class="col-xs-12 col-md-6">
                    <label for="codigoe">Codigo:</label>
                    <input id="codigoe" name="codigoe" class="form-control"/>
                    <input type="hidden" id="id_equipo" name="id_equipo">
                  </div>

                  <div class="col-xs-12 col-md-6">
                    <label for="ubicacione">Ubicacion:</label>
                    <input type="text" id="ubicacione" name="ubicacione" class="form-control" disabled>
                  </div>

                  <div class="col-xs-12 col-md-6">
                    <label for="marcae">Marca:</label>
                    <input type="text" id="marcae" name="marcae" class="form-control" disabled>
                  </div>

                  <div class="col-xs-12 col-md-6">
                    <label for="fecha_ingresoe">Fecha de Ingreso:</label>
                    <input type="date" id="fecha_ingresoe"  name="fecha_ingresoe" class="form-control input-md" disabled>
                  </div>

                  <div class="col-xs-12 col-md-6">
                    <label for="fecha_garantiae">Fecha de Garantia:</label>
                    <input type="date" id="fecha_garantiae"  name="fecha_garantiae" class="form-control input-md" disabled>
                  </div>

                  <div class="col-xs-12">
                    <label for="">Descripcion: </label>
                    <textarea class="form-control" id="descripcione" name="descripcione" disabled></textarea>
                  </div>
                </div>
              </div><!-- /.panel-body -->
            </div><!-- /.panel -->
          </div>
        </div>

        <div class="row">
          <div class="col-xs-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title fa fa-file-text-o"> Contratista</h4>
              </div><!-- /.panel-heading -->

              <div class="panel-body">
                <div class="row">
                  <div class="col-xs-12 col-md-6">
                    <select id="empresae" name="empresae" class="form-control"/>
                    <input type="hidden" id="id_contratista" name="id_contratista">
                  </div>
                  <div class="col-xs-12 col-md-6">
                    <button type="button" class="btn btn-primary" id="adde"><i class="fa fa-check">Agregar</i></button>
                  </div>
                </div><br>
                <div class="row" >
                  <div class="col-xs-12">
                    <table class="table table-bordered" id="tablaempresa"> 
                      <thead>
                        <tr>                     
                          <th>Acción</th>
                          <th>Equipo</th>
                          <th>Contratistas Asignados</th>
                        </tr>
                      </thead>
                      <tbody></tbody>
                    </table>
                  </div>
                </div>
              </div><!-- /.panel-body -->
            </div><!-- /.panel -->
          </div>
        </div>       
      </div><!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cerro()">Cancelar</button>
        <button type="button" class="btn btn-primary" id="reset" data-dismiss="modal" onclick="guardarsi()">Guardar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal EDITAR-->
<div id="modaleditar" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><span class="fa fa-fw fa-pencil text-light-blue"></span> Editar Equipo/Sector</h4>
      </div>
      
      <div class="modal-body">
        <div class="row" >
          <div class="col-xs-12">
            
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del Equipo/ Sector</h3>
              </div>
              <div class="panel-body">
                <div class="col-xs-12">
                  <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
                    <h4><i class="icon fa fa-ban"></i> Error!</h4>
                    Revise que todos los campos esten completos...                  
                  </div>
                </div>

                <div class="row">
                  <div class="col-xs-12 col-md-6">
                    <label for="">Codigo <strong style="color: #dd4b39">*</strong>:</label>
                    <input type="text" id="codigo" name="codigo" class="form-control" placeholder="Ingrese Codigo">
                    <input type="hidden" id="id_equipo" name="id_equipo">
                  </div>

                  <div class="col-xs-12 col-md-6">
                    <label for="">Ubicacion <strong style="color: #dd4b39">*</strong>:</label>
                    <input type="text" id="ubicacion" name="ubicacion" class="form-control" placeholder="Ingrese Ubicacion">
                  </div>

                  <div class="col-xs-12 col-md-6">
                    <label for="">Marca <strong style="color: #dd4b39">*</strong>:</label>
                    <select id="marca1" name="marca1" class="form-control" value="" ></select> 
                  </div>     

                  <div class="col-xs-12 col-md-6">
                    <label for="">Fecha de Ingreso:</label>
                    <input type="date" id="fecha_ingreso"  name="fecha_ingreso" class="form-control input-md">
                  </div>           

                  <div class="col-xs-12 col-md-6">
                    <label for="">Fecha de Ultima lectura:</label>
                    <input type="text" id="fecha_ultimalectura"  name="fecha_ultima" class="form-control input-md">
                  </div>             

                  <div class="col-xs-12 col-md-6">
                    <label for="">Ultima Lectura:</label>
                    <input type="text" id="ultima_lectura"  name="ultima_lectura" class="form-control input-md" placeholder="Ingrese Ultima Lectura">
                  </div>
                  
                  <div class="col-xs-12 col-md-6">
                    <label for="">Fecha de Garantia:</label>
                    <input type="date" id="fecha_garantia"  name="fecha_garantia" class="form-control input-md">
                  </div>

                  <div class="col-xs-12">
                    <label for="">Descripcion <strong style="color: #dd4b39">*</strong>: </label>
                    <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Ingrese Descripcion..."></textarea>
                  </div>
                </div><!-- /.row -->
              </div><!-- /.panel-body -->
            </div><!-- /.panel -->

            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><span class="fa fa-globe"></span> Ubicacion del Equipo / Sector</h4>
              </div><!-- /.panel-heading -->

              <div class="panel-body">
                <div class="row">
                  <div class="col-xs-12 col-md-6">
                    <label for="empresa">Empresa <strong style="color: #dd4b39">*</strong>:</label>
                    <!-- <select  id="empresa" name="empresa" class="form-control" /> -->
                    <input type="text" name="empresa" id="empresa" value="" placeholder="" class='form-control' autocomplete='off' disabled>
                    <input type="hidden" id="id_empresa" name="id_empresa">
                  </div>

                  <div class="col-xs-12 col-md-6">
                    <label for="etapa">Sector <strong style="color: #dd4b39">*</strong>:</label>
                    <select id="etapa" name="etapa" class="form-control"   />
                    <input type="hidden" id="id_sector" name="id_sector">
                  </div>

                  <div class="col-xs-12 col-md-6">
                    <label for="criticidad">Criticidad <strong style="color: #dd4b39">*</strong>:</label>
                    <select id="criticidad" name="criticidad" class="form-control"   />
                    <input type="hidden" id="id_criticidad" name="id_criticidad">
                  </div>

                  <div class="col-xs-12 col-md-6">
                    <label for="grupo">Grupo <strong style="color: #dd4b39">*</strong>:</label>
                    <select id="grupo" name="grupo" class="form-control"></select>
                    <input type="hidden" id="id_grupo" name="id_grupo">
                  </div>
                </div><!-- /.row -->
              </div><!-- /.panel-body -->
            </div><!-- /.panel -->

          </div><!-- /.col-xs-12 -->
        </div><!-- /.row -->
      </div><!-- /.modal-body -->

      <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cerro()">Cancelar</button>
          <button type="button" class="btn btn-primary" id="reset" data-dismiss="modal" onclick="guardar()">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- / Modal EDITAR-->

<!-- Modal LECTURA -->
<div class="modal fade" id="modalectura" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Lectura Equipo</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle"> 
        <form id="formlectura">

          <div class="form-group">
            <i href="#" class="fa fa-fw llave" style="cursor:pointer; color:#3c8dbc" title=""></i>
            <label class="radio-inline" id="botestado"></label>
            <input type="hidden" name="estado" id="estado">
          </div>
          <div class="form-group">
            <label for="maquina">Equipo </label> <!-- <strong style="color: #dd4b39">*</strong>: -->
            <input type="text" id="maquina" class="form-control clear" disabled>
            <!-- id_equipo = id_maquina -->
            <input type="text" id="id_maquina" name="id_equipo" class="form-control hidden clear">
          </div>
          <div class="form-group">
            <label for="">Lectura <strong style="color: #dd4b39">*</strong>:</label>
            <input type="text" id="lectura" name="lectura" class="form-control clear"> 
          </div>
          <div class="form-group">
            <label for="">Operario <strong style="color: #dd4b39">*</strong>:</label>
            <input type="text" id="operario" name="operario" class="form-control clear"> 
          </div>
          <div class="form-group">
            <label for="">Turno <strong style="color: #dd4b39">*</strong>:</label>
            <input type="text" id="turno" name="turno" class="form-control clear"> 
          </div>
          <div class=form-group">
            <label for="observacion">Observaciones <strong style="color: #dd4b39">*</strong>:</label>
              <textarea class="form-control clear" id="observacion" name="observacion" placeholder="Observaciones..."></textarea>
          </div> 
        </form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>       
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardarlectura()">Guardar</button>
      </div>  <!-- /.modal footer -->

    </div>  <!-- /.modal-content --><!-- /.modal-body -->
  </div> <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal LECTURA -->

<!-- Modal Historial de Lecturas --> 
<div class="modal fade" id="modalhistlect" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Historial de Lecturas</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body">
        <label>Equipo: <span id="codEquipo"></span></label>  
        <table id="tblhistorial" class="table table-condensed table-responsive">
          <thead>                        
            <tr>                          
              <th>Lectura</th>
              <th>Fecha</th>                
              <th>Operario</th>
              <th>Turno</th>
              <th>Observación</th> 
            </tr>  
          </thead>
          <tbody>
            <!-- -->
          </tbody>
        </table>
      </div> <!-- /.modal-body -->

      <div class="modal-footer">  
        <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
      </div>  <!-- /.modal footer -->
    </div> <!-- /.modal-content -->

  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal Historial de Lecturas -->