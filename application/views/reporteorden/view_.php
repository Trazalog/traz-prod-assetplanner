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

            </div><!-- /.panel-body -->
            <div class="panel-footer">
              <button class="btn btn-primary" id="consultar">Consultar</button>  
              <!--<button class="btn btn-primary" id="btnExportExcel">Exportar</button>-->
            </div>

          </div><!-- /.panel -->
        </div><!-- /.box-body -->

        <div class="box-footer">
          <div class="panel panel-default" id="panelReporteOT">
            <div class="panel-heading">
              <h3 class="panel-title">Consulta</h3>
            </div>

            <div class="panel-body">    
              <table id="tablaReporteOT" class="table table-bordered table-hover">
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
</section>

<script>
// Oculto el panel resultados
$("#panelReporteOT").css("display", "none");



// cargo plugin DateTimePicker
$('#desde, #hasta').datetimepicker({
  //format: 'YYYY-MM-DD H:mm:ss', // datetime
  //format: 'YYYY-MM-DD', // es igual al campo date
  format: 'YYYY-MM-DD', 
  locale: 'es',
});



// Habilito y deshabilito los select de opciones de busqueda
var opcionEquipo = 0;
var opcionOT     = 0;
var opcionEstado = 0;
var opcionFecha  = 0;

function enabDisabEquipo() {
  if (this.checked) {
    opcionEquipo = 1;
    $("select#equipSelec").removeAttr("disabled");
  } else {
    opcionEquipo = 0;
    $("select#equipSelec").attr("disabled", true);
    $("select#equipSelec").val('');
  }
}

function enabDisabOT() {
  if (this.checked) {
    opcionOT = 1;
    $("select#otSelec").removeAttr("disabled");
  } else {
    opcionOT = 0;
    $("select#otSelec").attr("disabled", true);
    $("select#otSelec").val('');
  }
}

function enabDisabEstado() {
  if (this.checked) {
    opcionEstado = 1;
    $("select#estSelec").removeAttr("disabled");
  } else {
    opcionEstado = 0;
    $("select#estSelec").attr("disabled", true);
    $("select#estSelec").val('');
  }
}

function enabDisabFecha() {
  if (this.checked) {
    opcionFecha = 1;
    $("input.fecha").removeAttr("disabled");
  } else {
    opcionFecha = 0;
    $("input.fecha").attr("disabled", true);
    $("input.fecha").val('');
  }
}

enabDisabEquipo();
$("#selEquipo").click(enabDisabEquipo);
enabDisabOT();
$("#selOt").click(enabDisabOT);
enabDisabEstado();
$("#selestado").click(enabDisabEstado);
enabDisabFecha();
$("#selFecha").click(enabDisabFecha);



// Trae equipos y llena su select
function traeEquipos(){
  return new Promise( function(resolve, reject){
    $.ajax({
      'dataType': 'json',
      'type'    : "POST",
      'url'     : "Sservicio/getEquipo",
    })
    .done(resolve)
    .fail(reject)
  });
}
traeEquipos().then(
  function resolve(data){
    //console.table(data);
    var $select = $("#equipSelec");
    for (var i = 0; i < data.length; i++) {
      $select.append($('<option />', { value: data[i]['id_equipo'], text: data[i]['descripcion'] }));
    }
  },
  function reject(reason){
    alert("Error al traer los equipos");
    console.table(reason);
  }
);



// Trae OTs y llena su select
function traeOTs(){
  return new Promise( function(resolve, reject){
    $.ajax({
      'dataType': 'json',
      'type'    : "POST",
      'url'     : "Reporteorden/getorden",
    })
    .done(resolve)
    .fail(reject)
  });
}
traeOTs().then(
  function resolve(data){
    var $select = $("#otSelec");
    for (var i = 0; i < data.length; i++) {
      $select.append($('<option/>', { value: data[i]['id_orden'], text: data[i]['descripcion'] }));
    }
  },
  function reject(reason){
    alert("Error al traer las OTs");
    console.table(reason);
  }
);



// Trae Estados y llena su select
function traeEstados(){
  return new Promise( function(resolve, reject){
    $.ajax({
      'dataType': 'json',
      'type'    : 'POST',
      'url'     : 'Reporteorden/getestado',
    })
    .done(resolve)
    .fail(reject)
  });
}
traeEstados().then(
  function resolve(data){
    var $select = $("#estSelec");
    for (var i = 0; i < data.length; i++) {
      if( data[i]['estado'] != 'AN') //Si viene estado anulado lo ignora
        $select.append($('<option />', { value: data[i]['estado'], text: data[i]['descripcion'] }));
    }
  },
  function reject(reason){
    alert("Error al traer los Estados");
    console.table(reason);
  }
);



// Valido datos para consulta
function validaDatos(){
  //si equipo está tildado y está vacío
  if(opcionEquipo && $("select#equipSelec").val() == ""){
    alert("Seleccione un equipo.");
    return false;
  }
  //si OT está tildado y está vacío
  if(opcionOT && $("select#otSelec").val() == ""){
    alert("Seleccione una OT.");
    return false;
  }
  //si estado está tildado y está vacío
  if(opcionEstado && $("select#estSelec").val() == ""){
    alert("Seleccione un estado.");
    return false;
  }
  return true;
}


// Llenar tabla
function llenarTabla(data){
  $('#tablaReporteOT').DataTable().clear().draw();
  for (var i = 0; i < data.length; i++) {
    $('#tablaReporteOT').DataTable().row.add( [
        data[i].id_orden,
        data[i].descripcionOT,
        data[i].descripcioTarea,
        data[i].codigoEquipo,
        data[i].fecha,
        data[i].fecha_program,
        data[i].fecha_terminada,
        data[i].fecha_entregada,
        data[i].origenOT,
        data[i].estado,
      ]
    ).draw();
  }
}

// trae datos del reporte
function traeDatosReporte(){
  let idEquipo = $('#equipSelec').val();
  let idOT     = $('#otSelec').val();
  let estado   = $('#estSelec').val();
  let desde    = $('#desde').val();
  let hasta    = $('#hasta').val();
  let parametros = {
    'opcionEquipo' : opcionEquipo,
    'opcionOT'     : opcionOT,
    'opcionEstado' : opcionEstado,
    'opcionFecha'  : opcionFecha,
    'idEquipo'     : idEquipo,
    'idOT'         : idOT,
    'estado'       : estado,
    'desde'        : desde,
    'hasta'        : hasta,
  }
  console.table(parametros);
  WaitingOpen("Cargando Reporte de OTs...");
  $.ajax({    
    data:{ parametros : parametros },
    dataType: 'json',
    type: 'POST',             
    url: 'index.php/Reporteorden/getDatosReporte',
  })
  .done( (data) => { llenarTabla(data) })
  .fail( () => alert("Error al traer el reporte.") )
  .always( () => WaitingClose() );
}

// 
$("#consultar").click(function(evento){
  evento.preventDefault();
  //muestro el panel que tiene la tabla
  $("#panelReporteOT").css("display", "block");
  //limpio la tabla
  $('#tablaReporteOT').DataTable().clear().draw();
  //
  if (validaDatos()){
    traeDatosReporte();
  }
});



// Inicializo DataTable
/*$('#tablaReporteOT').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "columnDefs": [ 
      { 
        "targets": [ 0 ],
        "type": "num",
      }
    ],
  "order": [[0, "asc"]],
});*/
//<i class="fa fa-download" aria-hidden="true"></i>
var table = $('#tablaReporteOT').DataTable({
  dom: 'Bfrtip',
  buttons: [
    {
      extend: 'print',
      className: 'btn btn-primary',
      text: '<i class="fa fa-print"></i>',
      init: function(api, node, config) {
       $(node).removeClass('btn-default')
      }
    },
    {
      extend: 'excel',
      className: 'btn btn-primary',
      text: '<i class="fa fa-download"></i> Excel',
      init: function(api, node, config) {
       $(node).removeClass('btn-default')
      },
      filename: function(){
        var date = new Date();
        var n = getFechaHoraFormateada(date);
        return n + ' reporte OT';
      },
    }
  ],
  "columnDefs": [ 
    { 
      "targets": [ 0 ],
      "type": "num",
    }
  ],
  "order": [[0, "asc"]],
});
/*new $.fn.dataTable.Buttons( table, {
    buttons: [
        'copy', 'excel', 'pdf'
    ]
} );*/
</script>
