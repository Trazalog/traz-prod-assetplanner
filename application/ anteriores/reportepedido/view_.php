<input type="hidden" id="permission" value="<?php echo $permission;?>">
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
      <h4><i class="icon fa fa-ban"></i> Error!</h4>
      Revise que todos los campos esten completos
    </div>
  </div>
</div>
<section class="content"> 
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Reporte de Artículos de pedidos</h3>
        </div><!-- /.box-header -->
        <div class="box-body">
          <div class="row" >
            <div class="col-xs-12">
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
                      <select class="form-control" id="otSelec" placeholder="Seleccione tipo...">
                        <option value=""></option>                      
                      </select>
                    </div>

                    <div class="col-xs-12 col-sm-6">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" class="check" id="selArticulo"><strong>Artículo</strong> 
                        </label>
                      </div>                
                      <select class="form-control" id="artSelec" placeholder="Seleccione tipo...">
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
                        <!--<option value="1">ENTREGADO</option> 
                        <option value="2">PEDIDO</option>-->
                      </select>                   
                    </div>

                    <div class="col-xs-12 col-sm-6">
                      <div class="checkbox">
                        <label for="selnota">
                          <input type="checkbox" class="check" id="selnota"><strong>Nota de Pedido</strong> 
                        </label>
                      </div>               
                      <select class="form-control" id="notSelec" placeholder="Seleccione tipo..." >
                        <option value=""></option> 
                      </select>
                    </div>

                  </div><!-- /.row -->
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
                
                  </div><!-- /.row -->
                </div><!-- /.panel-body -->
                <div class="modal-footer">
                  <!--onclick="javascript:consReporte()" <span class="glyphicon glyphicon-search"></span>-->
                  <button class="btn btn-primary" id="consulta">Consultar</button>  
                  <!--<a class="btn btn-default" id="export-btn" onclick=" descargarExcel()">Exportar</a>-->
                </div><!-- /.modal-footer -->
              </div><!-- /.panel-default -->
            </div><!-- /.col -->
          </div><!-- /.row -->

            <div id="tablaReportes" data-tableName="Test Table 2" style="display: none;">
              <div class="panel panel-default">
                <div class="panel-body">
                  <table id="sales" class="table table-bordered table-hover">
                    <thead>
                      <tr>                
                        <th>Id Nota Pedido</th>
                        <th>Nº O. Trabajo</th>
                        <th>Fecha Entrega</th>
                        <th>Artículo</th>
                        <th>Cantidad</th>
                        <th>Proveedor</th>
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

        </div><!-- /.box-body -->
        
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->

</section>

<style type="text/css">
  .check:hover {
    cursor: pointer;
  }
  table thead {
    color: #040404;
    background-color: #D6DBDF;
  }
</style>

<script>  
// Datepicker
$(".fecha").datepicker();

// Datatables 
$('#sales').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "order": [[0, "asc"]],
});

// descargar excel 
function descargarExcel() {
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
</script>

<!-- Habilitar y deshabilitar fecha sector y equipo -->
<script>
var opcs     = 0;
var opce     = 0; //opcion equipo
var opcf     = 0; //opcion fecha
var opca     = 0; //opcion articulo
var opcest   = 0; //opcion estado
var avestado = "";
var opcnot   = 0; //opcion nota
var opcot    = 0; //opcion orden de trabajo

$(function() {
  enabDisabFecha();
  enabDisabArticulo();
  enabDisabEquipo();
  enabDisabestado();
  enabDisabot();
  enabDisabnota();
  $("#selFecha").click(enabDisabFecha);
  $("#selArticulo").click(enabDisabArticulo);
  $("#selEquipo").click(enabDisabEquipo);
  $("#selestado").click(enabDisabestado);
  $("#selOt").click(enabDisabot);
  $("#selnota").click(enabDisabnota);
});

function enabDisabEquipo() {
  if (this.checked) {
    $("select#equipSelec").removeAttr("disabled");
  } else {
    $("select#equipSelec").attr("disabled", true);
    $("select#equipSelec").val('');
  }
}

function enabDisabot() {
  if (this.checked) {
    $("select#otSelec").removeAttr("disabled");
  } else {
    $("select#otSelec").attr("disabled", true);
    $("select#otSelec").val('');
  }
}

function enabDisabArticulo() {
  if (this.checked) {
    $("select#artSelec").removeAttr("disabled");
  } else {
    $("select#artSelec").attr("disabled", true);
    $("select#artSelec").val('');
  }
}

function enabDisabestado() {
  if (this.checked) {
    $("select#estSelec").removeAttr("disabled");
  } else {
    $("select#estSelec").attr("disabled", true);
    $("select#estSelec").val('');
  }
}

function enabDisabnota() {
  if (this.checked) {
    $("select#notSelec").removeAttr("disabled");
  } else {
    $("select#notSelec").attr("disabled", true);
    $("select#notSelec").val('');
  }
}

function enabDisabFecha() {
  if (this.checked) {
    $("input.fecha").removeAttr("disabled");
  } else {
    $("input.fecha").attr("disabled", true);
    $("input.fecha").val('');
  }
}
</script>


<!-- Trae sectores y equipos p/ sector seleccionado -->
<script> 
$(function() {
  //llena select con equipos
  $.ajax({
    'async': true,
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "Sservicio/getEquipo",
    'success': function (data) {
      var $select = $("#equipSelec");
      for (var i = 0; i < data.length; i++) {
        $select.append($('<option />', { value: data[i]['id_equipo'], text: data[i]['descripcion'], title:data[i]['codigo'] }));
      }
    },
    'error' : function (data){
      console.error('Error al traer equipos');
      //alert('error');
    }
  });

  //llena select con ordenes de trabajo
  $.ajax({
    'async': true,
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "Reportepedido/getorden",
    'success': function (data) {
      var $select = $("#otSelec");
      for (var i = 0; i < data.length; i++) {
        $select.append($('<option />', { value: data[i]['id_orden'], text: data[i]['descripcion'], title: data[i]['id_orden'] }));
      }
    },
    'error' : function (data){
      console.error('Error al traer OTs');
      //alert('error');
    }
  });

  //llena select con artículos
  $.ajax({
    'async': true,
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "Reportepedido/getarticulo",
    'success': function (data) {
      var $select = $("#artSelec");
      for (var i = 0; i < data.length; i++) {
        $select.append($('<option />', { value: data[i]['artId'], text: data[i]['artDescription'], title: data[i]['artBarCode'] }));
      }
    },
    'error' : function (data){
      console.error('Error al traer articulos');
      //alert('error');
    }
  });

  //llena select con estados
  $.ajax({
    'async': true,
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "Reportepedido/getReporteEstado",
    'success': function (data) {
      var $select = $("#estSelec");
      for (var i = 0; i < data.length; i++) {
        $select.append($('<option />', { value: data[i]['id_detaNota'], text: data[i]['estado'] }));
      }
    },
    'error' : function (data){
      console.log('Error al traer estados');
      //alert('error');
    }
  });

  //llena select con notas de pedido
  $.ajax({
    'async': true,
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "Reportepedido/getnota",
    'success': function (data) {
      var $select = $("#notSelec");
      for (var i = 0; i < data.length; i++) {
        $select.append($('<option />', { value: data[i]['id_notaPedido'], text: data[i]['id_notaPedido'] }));
      }
    },
    'error' : function (data){
      console.error('Error al traer nota de pedidos');
      //alert('error');
    }
  });
});
</script>

<!-- Validacion de campos y Envio form -->
<script> 
// limpio datos al consultar
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

$("#consulta").click(function(evento) {
  evento.preventDefault();
  
  var id_equipo     = $('#equipSelec').val();
  var id_ot         = $('#otSelec').val();
  var id_articulo   = $('#artSelec').val();
  var id_estado     = $('#estSelec').val();
  var id_notaPedido = $('#notSelec').val();
  var desde         = $('#desde').val();
  var hasta         = $('#hasta').val();
  console.log("eq: "+id_equipo+" - ot: "+id_ot+" - art: "+id_articulo+" - est: "+id_estado+" - notap: "+id_notaPedido);
  //WaitingOpen('Cargando Solicitud de Servicios...');
  //limpio la tabla
  $('#sales').DataTable().clear().draw();

  $.ajax({    
    data:{
      id_equipo: id_equipo,
      id_ot: id_ot,
      id_articulo: id_articulo,
      id_estado: id_estado,
      id_notaPedido: id_notaPedido,
      desde: desde,
      hasta: hasta,
    },
    type: 'POST',             
    dataType: 'json',
    url: 'index.php/Reportepedido/getReporte',  // trae las notas de pedido (articulos pedidos)       
    success: function(result){  
      console.table(result); 
      limpCombo();
      $("#tablaReportes").css("display", "block");
      if(result !==0){
        for(var i=0; i <= result.length-1; i++){
          switch( result[i]['estado'] ){
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
            case 'S':
              var e = 'Solicitado';
              break;
            default:
              var e = result[i]['estado'];
          }
          //agrego valores a la tabla
          $('#sales').DataTable().row.add( [
            result[i]['id_notaPedido'],
            result[i]['id_ordTrabajo'],
            result[i]['fechaEntrega'],
            result[i]['artDescription'],
            result[i]['cantidad'],
            result[i]['provnombre'],
            e,
          ] ).draw();
        }
      }
      else 
        alert("Este equipo no se puede filtrar, POR FAVOR SELCCIONO OTRO ");
    },
    error: function(result){
      limpCombo();
      // WaitingClose();                                              
      alert("Error en consulta Ordenes");
    }
  });

});

</script>
<!-- / Validacion de campos y Envio form -->
