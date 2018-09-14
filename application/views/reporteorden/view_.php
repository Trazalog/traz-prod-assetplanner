<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content"> 
  <div class="row">
    <div class="col-xs-12">
      <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
        <h4><i class="icon fa fa-ban"></i> Error!</h4>
        Revise que todos los campos esten completos
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Reporte Ordenes de Trabajo</h3>
        </div>

        <div class="box-body">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Datos a filtrar</h3>
            </div><!-- /.panel-heading -->
          
            <div class="panel-body">
              <div class="row">
                <div class="col-xs-12 col-sm-6">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" class="check" id="selEquipo"><strong>Equipo</strong>
                    </label>
                  </div>
                  <select class="form-control" id="equipSelec" placeholder="Seleccione tipo...">
                    <option value=""></option>                      
                  </select>                   
                </div>
                <div class="col-xs-12 col-sm-6">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" class="check" id="selOt"><strong>Orden de Trabajo</strong>
                    </label>
                  </div>
                  <select class="form-control" id="otSelec" placeholder="Seleccione tipo..." >
                    <option value=""></option>                      
                  </select>                   
                </div>
                <div class="col-xs-12 col-sm-6">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" class="check" id="selestado"><strong>Estado</strong>
                    </label>
                  </div>
                  <select class="form-control" id="estSelec" placeholder="Seleccione tipo..." >
                    <option value=""></option>  
                    <!--<option value="1">Curso</option>
                    <option value="2">Asignadas</option>
                    <option value="3">Terminadas</option>
                    <option value="4">Entregadas</option>-->
                  </select>                   
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" class="check" id="selFecha"> <strong>Fecha</strong>
                    </label>
                  </div>
                </div>
                <div class="col-xs-12 col-sm-6">
                  <label for="desde">Desde</label>
                  <input type="text" class="form-control fecha check" id="desde" placeholder="">
                </div>  
                <div class="col-xs-12 col-sm-6">
                  <label for="hasta">Hasta</label>
                  <input type="text" class="form-control fecha check" id="hasta" placeholder="">
                </div>
              </div>
              <br>
              <!--onclick="javascript:consReporte()"   <span class="glyphicon glyphicon-search"></span>-->
              <button class="btn btn-primary" id="consulta">Consultar</button>  
              <!--<a class="btn btn-primary" id="export-btn" onclick=" descargarExcel()">Exportar</a>-->
              <br>
            </div><!-- /.panel-body -->

          </div><!-- /.panel -->
        </div><!-- /.box-body -->

        <div class="box-footer">
          <div id="tablaReportes" data-tableName="Test Table 2" style="display: none;">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Consulta</h3>
              </div>

              <div class="panel-body">    
                <table id="sales" class="table table-bordered table-hover">
                  <thead>
                    <tr>                
                      <th>Orden de Trabajo</th>
                      <th>Descripcion</th>
                      <th>Tarea</th>
                      <th>Equipo</th>
                      <th>Fecha</th>
                      <th>Fecha de Programacion</th>
                      <th>Fecha Terminacion</th>
                      <th>Fecha de Entregada</th>
                      <th>Origen</th>
                      <th>Estado</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- -->
                  </tbody>
                </table>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<style type="text/css">
table thead {
  color: #040404;
  background-color: #D6DBDF;
}
</style>

<!-- Datepicker -->
<script>  
  $(".fecha").datepicker();
</script>


<!-- Habilitar y deshabilitar fecha sector y equipo-->
<script>
$('#sales').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "order": [[0, "asc"]],
});

var opcionOT     = 0; //5
var opcionEquipo = 0; //2
var opcionFecha  = 0; //3
var opcionEstado = 0; //4
//var avestado = "";

function descargarExcel(){
  //Creamos un Elemento Temporal en forma de enlace
  var tmpElemento      = document.createElement('a');
  // obtenemos la información desde el div que lo contiene en el html
  // Obtenemos la información de la tabla
  var data_type        = 'data:application/vnd.ms-excel';
  var tabla_div        = document.getElementById('sales');
  var tabla_html       = tabla_div.outerHTML.replace(/ /g, '%20');
  tmpElemento.href     = data_type + ', ' + tabla_html;
  //Asignamos el nombre a nuestro EXCEL
  tmpElemento.download = 'Reporte_Articulos_Pedido.xls';
  // Simulamos el click al elemento creado para descargarlo
  tmpElemento.click();
}
   
$(function() {
  enabDisabEquipo();
  $("#selEquipo").click(enabDisabEquipo);
  enabDisabot();
  $("#selOt").click(enabDisabot);
  enabDisabestado();
  $("#selestado").click(enabDisabestado);
  enabDisabFecha();
  $("#selFecha").click(enabDisabFecha);
});

function enabDisabEquipo() {
  if (this.checked) {
    opcionEquipo = 2;
    $("select#equipSelec").removeAttr("disabled");
    //eliminar desde aca
    $("input.fecha, select#estSelec, select#otSelec").attr("disabled", true);
    $("input.fecha, select#estSelec, select#otSelec").val('');
    $(".check").not(this).prop('checked', false);
    //hasta aca
  } else {
    opcionEquipo = 0;
    $("select#equipSelec").attr("disabled", true);
    $("select#equipSelec").val('');
  }
}

function enabDisabot() {
  if (this.checked) {
    opcionOT = 5;
    $("select#otSelec").removeAttr("disabled");
    //eliminar desde aca
    $("input.fecha, select#equipSelec, select#estSelec").attr("disabled", true);
    $("input.fecha, select#equipSelec, select#estSelec").val('');
    $(".check").not(this).prop('checked', false);
    //hasta aca
  } else {
    opcionOT = 0;
    $("select#otSelec").attr("disabled", true);
    $("select#otSelec").val('');
  }
}

function enabDisabestado() {
  if (this.checked) {
    opcionEstado = 4;
    $("select#estSelec").removeAttr("disabled");
    //eliminar desde aca
    $("input.fecha, select#equipSelec, select#otSelec").attr("disabled", true);
    $("input.fecha, select#equipSelec, select#otSelec").val('');
    $(".check").not(this).prop('checked', false);
    //hasta aca
  } else {
    opcionEstado = 0;
    $("select#estSelec").attr("disabled", true);
    $("select#estSelec").val('');
  }
}

function enabDisabFecha() {
  if (this.checked) {
    opcionFecha = 3;
    $("input.fecha").removeAttr("disabled");
    //eliminar desde aca
    $("select#equipSelec, select#estSelec, select#otSelec").attr("disabled", true);
    $("select#equipSelec, select#estSelec, select#otSelec").val('');
    $(".check").not(this).prop('checked', false);
    //hasta aca
  } else {
    opcionFecha = 0;
    $("input.fecha").attr("disabled", true);
    $("input.fecha").val('');
  }
}
</script>

<script> 
$(function() {
  // trae equipo para llenar el select
  $.ajax({
    'async': true,
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "Sservicio/getEquipo",
    'success': function (data) {
      //console.table(data);
      var $select = $("#equipSelec");
      for (var i = 0; i < data.length; i++) {
        $select.append($('<option />', { value: data[i]['id_equipo'], text: data[i]['descripcion'] }));
      }
    },
    'error' : function (data){
      console.log('Error al traer equipos');
      //alert('error');
    }
  });

  // trae OT para llenar el select
  $.ajax({
    'async': true,
    'type': "POST",
    'global': false,
    'dataType': 'json',
    'url': "Reporteorden/getorden",
    'success': function (data) {
      //console.table(data);
      var $select = $("#otSelec");
      for (var i = 0; i < data.length; i++) {
        $select.append($('<option/>', { value: data[i]['id_orden'], text: data[i]['descripcion'] }));
      }
    },
    'error' : function (data){
      console.log('Error al traer OTs');
      //alert('error');
    }
  });

  // trae estados para llenar el select
  $.ajax({
    'async': true,
    'global': false,
    'dataType': 'json',
    'type': "POST",
    'url': "Reporteorden/getestado",
    'success': function (data) {
      //console.table(data);
      var $select = $("#estSelec");
      for (var i = 0; i < data.length; i++) {
        $select.append($('<option />', { value: data[i]['estado'], text: data[i]['descripcion'] }));
      }
    },
    'error' : function (data){
      console.log('Error al traer estados');
      //alert('error');
    }
  });
});
</script>

<!-- Validacion de campos y Envio form -->
<script> 
$("#consulta").click(function(evento){
  evento.preventDefault();
  $("#tablaReportes").css("display", "block");//muestro tabla
  //limpio la tabla
  $('#sales').DataTable().clear().draw();

  //seleccione equipo
  if(opcionEquipo == 2){ 
    var id_eq = $('#equipSelec').val();
    console.log("seleccione equipo "+id_eq);

    WaitingOpen("Cargando Ordenes de trabajo...");
    $.ajax({    
      data:{ id_eq: id_eq },
      dataType: 'json',
      type: 'POST',             
      url: 'index.php/Reporteorden/getOTequipo',                
      success: function(result){  
        console.table(result[0]); 
        // console.log(result[0]['id_equipo']); 
        limpCombo();
        if(result !==0){
          for(var i=0; i <= result.length-1; i++){
            switch( result[i]['estadoeq'] ){
              case 'C':
                var e ='Curso';
                break;
              case 'IN':
                var e ='Inactivo';
                break;
              case 'RE':
                var e = 'Reparación';
                break;
              case 'AN':
                var e = 'Anulado';
                break;
              case 'T':
                var e = 'Terminadas';
                break;
              case 'AS':
                var e = 'Asignadas';
                break;
              case 'P':
                var e = 'Pedido';
                break;
              default:
                var e = result[i]['estadoeq'];
            }
            var diasSemana = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");
            fecha  = new Date(result[i]['fecha_inicio']);
            fecha2 = new Date(result[i]['fecha_entrega']);
            fecha3 = new Date(result[i]['fecha_terminada']);
            fecha4 = new Date(result[i]['fecha_entregada']);
            //agrego valores a la tabla
            $('#sales').DataTable().row.add( [
              result[i]['id_orden'],
              result[i]['desot'],
              result[i]['det'],
              result[i]['codigo'],
              fecha.toLocaleDateString("es-ES", diasSemana),
              fecha2.toLocaleDateString("es-ES", diasSemana),
              fecha3.toLocaleDateString("es-ES", diasSemana),
              fecha4.toLocaleDateString("es-ES", diasSemana),
              result[i]['destipo'],
              e,
            ] ).draw();
          }
          WaitingClose();
        }
        else {
          alert("Este equipo no se puede filtrar, POR FAVOR SELCCIONO OTRO");
        }
      },
      error: function(result){
        limpCombo();
        WaitingClose();                                              
        console.error("Error al traer OTs desde equipos");
      }
    });
  }

  //selecciono OT
  if((opcionEquipo ==0) && (opcionFecha==0) && (opcionEstado==0) && (opcionOT==5)){ 
    var id_ot = $('#otSelec').val();
    console.log("seleccione OT "+id_ot);

    calcular_ordenT(id_ot);
  }

  //seleccionar estado 
  if((opcionEquipo ==0) && (opcionFecha==0) && (opcionEstado==4)){
    var est    = $('#estSelec').val();
    var nombre = $("select#estSelec option:selected").html();
    console.log("seleccioné estado: "+nombre+" id: "+est);

    veretado(est);
  }

/*  }
  else {
    if((opcionEquipo ==0) && (opcionFecha==3)){ //selecciono fecha
      console.log("Seleccione las fechas");
      var de = $('#desde').val();
      var a = $('#hasta').val();  
      console.log(de);
      console.log(a);
      console.log("Bandera que me indica, que seleccione fecha:");
      console.log(opcionFecha);
      calcular_fecha(de,a);
    }
  }
  if((opcionEquipo ==0) && (opcionFecha==0) && (opca==1)){ //seleccione articulo
    var id_art = $('#artSelec').val();
    console.log("Id de articulo es:");
    console.log(id_art);
    console.log("Bandera que me indica que seleccione articulo es:")
    console.log(opca);
    calcular_articulo(id_art);
  }
  else{
    if((opcionEquipo ==0) && (opcionFecha==0) && (opca==0) && (opcionEstado==4)){
      var est = $('#estSelec').val();
      var nombre =$("select#estSelec option:selected").html();
      console.log("Id de estado es:");
      console.log(est);
      console.log(nombre);
      console.log("Bandera que me indica que seleccione estado es:")
      console.log(opcionEstado);
      //1- Entregado, 2- Pedido
      veretado(nombre, est);
    }
  }
  if((opcionEquipo ==2) && (opcionFecha==0) && (opca==0) && (opcionEstado==0) && (opcionOT==5)){ //selecciono equipo y ot 
    var id_ot = $('#otSelec').val();
    console.log("Id de ot es:");
    console.log(id_ot);
    var id_eq = $('#equipSelec').val();
    console.log("Id de equipo es:");
    console.log(id_eq);
    console.log("Bandera que me indica que seleccione ot y equipo es:")
    console.log(opcionOT);
    console.log(id_eq);
   calcular_eqot(id_ot, id_eq);
  }*/
});

// limpio datos a consultar
function limpCombo(){
  $('.check').attr('checked',false);

  $("input.buscSector").attr("disabled", true);
  $("input.buscSector").val('');
  $("#idSector").val('');

  $("select#equipSelec").attr("disabled", true);
  $("select#equipSelec").val('');

  $("select#artSelec").attr("disabled", true);
  $("select#artSelec").val('');

  $("input.fecha").attr("disabled", true);
  $("input.fecha").val('');

  $("select#estSelec").attr("disabled", true);
  $("select#estSelec").val('');
}

function calcular_ordenT(id_ot){
  WaitingOpen("Cargando Ordenes de trabajo...");
  $.ajax({    
    data:{ id_ot: id_ot },
    type: 'POST',             
    dataType: 'json',
    url: 'index.php/Reporteorden/traerot',                
    success: function(result){  
      console.table(result); 
      // console.log(result[0]['id_equipo']); 
      limpCombo();
      if(result!==0){
        $("#tablaReportes").css("display", "block");//muestro tabla
        $("#sales tbody tr").remove();//limpio tr de tabla 
        for(var i=0; i <= result.length-1; i++){
          switch( result[i]['estadoeq'] ){
            case 'C':
              var e ='Curso';
              break;
            case 'IN':
              var e ='Inactivo';
              break;
            case 'RE':
              var e = 'Reparación';
              break;
            case 'AN':
              var e = 'Anulado';
              break;
            case 'T':
              var e = 'Terminadas';
              break;
            case 'AS':
              var e = 'Asignadas';
              break;
            case 'P':
              var e = 'Pedido';
              break;
            default:
              var e = result[i]['estadoeq'];
          }
          var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
          fecha = new Date(result[i]['fecha_inicio']);
          fecha2 = new Date(result[i]['fecha_entrega']);
          fecha3 = new Date(result[i]['fecha_terminada']);
          fecha4 = new Date(result[i]['fecha_entregada']);
          //agrego fila a la tabla
          $('#sales').DataTable().row.add( [
            result[i]['id_orden'],
            result[i]['desot'],
            result[i]['det'],
            result[i]['codigo'],
            fecha.toLocaleDateString("es-ES", diasSemana),
            fecha2.toLocaleDateString("es-ES", diasSemana),
            fecha3.toLocaleDateString("es-ES", diasSemana),
            fecha4.toLocaleDateString("es-ES", diasSemana),
            result[i]['destipo'],
            e,
          ] ).draw();
        }
      }
      else {
        alert("Esta OT no se puede filtrar, POR FAVOR SELCCIONO OTRA OT");
      }
      WaitingClose();
    },
    error: function(result){
      limpCombo();
      WaitingClose();                                              
      console.error("Error en consulta Ordenes");
    }
  });
}

function veretado(id_est){
  WaitingOpen("Cargando Ordenes de trabajo...");
  $.ajax({    
    data:{ id_est: id_est },
    type: 'POST',             
    dataType: 'json',
    url: 'index.php/Reporteorden/traerOTestado',                
    success: function(result){  
      console.table(result); 
      // console.log(result[0]['id_equipo']); 
      limpCombo();
      if(result!==0){
        for(var i=0; i <= result.length-1; i++){
          switch( result[i]['estadoeq'] ){
            case 'C':
              var e ='Curso';
              break;
            case 'IN':
              var e ='Inactivo';
              break;
            case 'RE':
              var e = 'Reparación';
              break;
            case 'AN':
              var e = 'Anulado';
              break;
            case 'T':
              var e = 'Terminadas';
              break;
            case 'AS':
              var e = 'Asignadas';
              break;
            case 'P':
              var e = 'Pedido';
              break;
            default:
              var e = result[i]['estadoeq'];
          }
          var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
          fecha  = new Date(result[i]['fecha_inicio']);
          fecha2 = new Date(result[i]['fecha_entrega']);
          fecha3 = new Date(result[i]['fecha_terminada']);
          fecha4 = new Date(result[i]['fecha_entregada']);
          $('#sales').DataTable().row.add( [
            result[i]['id_orden'],
            result[i]['desot'],
            result[i]['det'],
            result[i]['codigo'],
            fecha.toLocaleDateString("es-ES", diasSemana),
            fecha2.toLocaleDateString("es-ES", diasSemana),
            fecha3.toLocaleDateString("es-ES", diasSemana),
            fecha4.toLocaleDateString("es-ES", diasSemana),
            result[i]['destipo'],
            e,
          ] ).draw();
        }
      }
      else {
        alert("Esta OT no se puede filtrar, POR FAVOR SELCCIONO OTRA OT ");
      }
      WaitingClose();
    },
    error: function(result){
      limpCombo();
      WaitingClose();                                              
      console.error("Error en consulta Ordenes");
    }
  });

}

/* function calcular_fecha(de, a){
  console.log("Esoty calculando fechas");
  console.log(de);
  console.log(a);
      $.ajax({    
          data:{
            de: de,
            a:a
          },
          type: 'POST',             
          dataType: 'json',
          url: 'index.php/Reportepedido/getfecha',                
          success: function(result){  
            console.log(result); 
            limpCombo();
            if(result !==0){
               $("#tablaReportes").css("display", "block");//muestro tabla
               $("#sales tbody tr").remove();//limpio tr de tabla 
                for(var i=0; i <= result.length-1; i++){
                  if(result[i]['estdet']=='E'){
                    var e='Entregado';
                  }
                  else {
                    if(result[i]['estdet']=='P'){
                    var e='Pedido';
                    }
                  }
                  var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
                      fecha = new Date(result[i]['fechaEntrega']);
                      fecha2 = new Date(result[i]['fechaEntregado']);
                  var tr ="<tr>"+
                      "<td>"+result[i]['id_orden']+"</td>"+ 
                      "<td>"+result[i]['desot']+"</td>"+
                      "<td>"+result[i]['deta']+"</td>"+ 
                      "<td>"+result[i]['codigo']+"</td>"+ 
                      "<td>"+result[i]['artBarCode']+"</td>"+ 
                      "<td>"+result[i]['cantidad']+"</td>"+
                      "<td>"+result[i]['provnombre']+"</td>"+
                      "<td>"+ fecha.toLocaleDateString("es-ES", diasSemana)+"</td>"+
                      "<td>"+fecha2.toLocaleDateString("es-ES", diasSemana)+"</td>"+
                      "<td>"+e+"</td>"+
                      "</tr>";
                  $('#sales tbody').append(tr);
                }
            }
            else 
              alert("Las fechas seleccionadas no se pueden filtrar, POR FAVOR seleccione otro rango de fecha");
          },
          error: function(result){
                  limpCombo();                                            
                  alert("Error en consulta Ordenes");
          }
      });
}

function calcular_articulo(id_art){
  console.log("Esoty calculando articulo");
  console.log(id_art);
      $.ajax({    
          data:{
            id_art: id_art
          },
          type: 'POST',             
          dataType: 'json',
          url: 'index.php/Reportepedido/traerArticulo',                
          success: function(result){  
            console.log(result); 
            // console.log(result[0]['id_equipo']); 
            limpCombo();
                if(result!==0){
                   $("#tablaReportes").css("display", "block");//muestro tabla
                   $("#sales tbody tr").remove();//limpio tr de tabla 
                    for(var i=0; i <= result.length-1; i++){
                       if(result[i]['estdet']=='E'){
                        var e='Entregado';
                      }
                      else {
                        if(result[i]['estdet']=='P'){
                        var e='Pedido';
                        }
                      }
                      var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
                      fecha = new Date(result[i]['fechaEntrega']);
                      fecha2 = new Date(result[i]['fechaEntregado']);
                       var tr ="<tr>"+
                      "<td>"+result[i]['id_orden']+"</td>"+ 
                      "<td>"+result[i]['desot']+"</td>"+
                      "<td>"+result[i]['deta']+"</td>"+ 
                      "<td>"+result[i]['codigo']+"</td>"+ 
                      "<td>"+result[i]['artBarCode']+"</td>"+ 
                      "<td>"+result[i]['cantidad']+"</td>"+
                      "<td>"+result[i]['provnombre']+"</td>"+
                      "<td>"+ fecha.toLocaleDateString("es-ES", diasSemana)+"</td>"+
                      "<td>"+fecha2.toLocaleDateString("es-ES", diasSemana)+"</td>"+
                      "<td>"+e+"</td>"+
                      "</tr>";
                      $('#sales tbody').append(tr);
                    }
                }
                  else 
                    alert("Este articulo no se puede filtrar , POR FAVOR seleccione otro articulo");
          },
          error: function(result){
                  limpCombo();
                  //WaitingClose();                                              
                  alert("Error en consulta Ordenes");
          }
      });
}

function calcular_estado(avestado){
  console.log("Estoy calculando estado");
  console.log(avestado);
   $.ajax({    
          data:{
            avestado: avestado
          },
          type: 'POST',             
          dataType: 'json',
          url: 'index.php/Reportepedido/calestado',                
          success: function(result){ 
                    console.log(result);             
                    limpCombo();
                    if(result!==0){
                      $("#sales tbody tr").remove();
                      $("#tablaReportes").css("display", "block");//muestro foto
                      for(var i=0; i <= result.length-1; i++){
                         if(result[i]['estdet']=='E'){
                          var e='Entregado';
                        }
                        else {
                          if(result[i]['estdet']=='P'){
                          var e='Pedido';
                          }
                        }
                        var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
                        fecha = new Date(result[i]['fechaEntrega']);
                        fecha2 = new Date(result[i]['fechaEntregado']);
                        var tr ="<tr>"+
                                "<td>"+result[i]['id_orden']+"</td>"+ 
                                "<td>"+result[i]['desot']+"</td>"+
                                "<td>"+result[i]['deta']+"</td>"+ 
                                "<td>"+result[i]['codigo']+"</td>"+ 
                                "<td>"+result[i]['artBarCode']+"</td>"+ 
                                "<td>"+result[i]['cantidad']+"</td>"+
                                "<td>"+result[i]['provnombre']+"</td>"+
                                "<td>"+ fecha.toLocaleDateString("es-ES", diasSemana)+"</td>"+
                                "<td>"+fecha2.toLocaleDateString("es-ES", diasSemana)+"</td>"+
                                "<td>"+e+"</td>"+
                                "</tr>";
                       $('#sales tbody').append(tr);
                      }
                    }
                    else 
                      alert("El dato que selecionado no se puede filtrar, POR FAVOR SELECCIONE OTRO ESTADO");
          },
          error: function(result){
                  limpCombo();
                  WaitingClose();                                              
                  alert("Error en consulta estado");
          }
      });
}

function calcular_eqot(id_ot, id_eq){
  console.log("Esoty calculando OT y eq");
  console.log(id_ot);
  console.log(id_eq);
      $.ajax({    
          data:{
            id_ot: id_ot,
            id_eq:id_eq
          },
          type: 'POST',             
          dataType: 'json',
          url: 'index.php/Reportepedido/guardaroteq',                
          success: function(result){  
            console.log(result); 
            // console.log(result[0]['id_equipo']); 
            limpCombo();
                // if(result!==0){
                //    $("#tablaReportes").css("display", "block");//muestro tabla
                //    $("#sales tbody tr").remove();//limpio tr de tabla 
                //     for(var i=0; i <= result.length-1; i++){
                //       if(result[i]['estdet']=='E'){
                //         var e='Entregado';
                //       }
                //       else {
                //         if(result[i]['estdet']=='P'){
                //         var e='Pedido';
                //         }
                //       }
                //       var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
                //       fecha = new Date(result[i]['fechaEntrega']);
                //       fecha2 = new Date(result[i]['fechaEntregado']);
                //        var tr ="<tr>"+
                //       "<td>"+result[i]['id_orden']+"</td>"+ 
                //       "<td>"+result[i]['desot']+"</td>"+
                //       "<td>"+result[i]['deta']+"</td>"+ 
                //       "<td>"+result[i]['codigo']+"</td>"+ 
                //       "<td>"+result[i]['artBarCode']+"</td>"+ 
                //       "<td>"+result[i]['cantidad']+"</td>"+
                //       "<td>"+result[i]['provnombre']+"</td>"+
                //       "<td>"+ fecha.toLocaleDateString("es-ES", diasSemana)+"</td>"+
                //       "<td>"+fecha2.toLocaleDateString("es-ES", diasSemana)+"</td>"+
                //       "<td>"+e+"</td>"+
                //       "</tr>";
                //       $('#sales tbody').append(tr);
                //     }
                // }
                //   else 
                //     alert("Este articulo no se puede filtrar , POR FAVOR seleccione otro articulo");
          },
          error: function(result){
                  limpCombo();
                  //WaitingClose();                                              
                  alert("Error en consulta Ordenes");
          }
      });
}*/

</script>
<!-- / Validacion de campos y Envio form -->
