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
          <h3 class="box-title">Reporte Ordenes de Servicio</h3>
        </div><!-- /.box-header -->

        <div class="box-body"> 
          <div class="row">
            <div class="col-xs-12 col-sm-6">
              <div class="checkbox">
                <label>
                  <input type="checkbox" class="check" id="selSector"><strong>Sector</strong>
                </label>
              </div>
              <input type="text" class="form-control buscSector" placeholder="Buscar Sector..." id="buscSector">
              <input type="text" class="hidden idSector" id="idSector">
            </div>
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
          <button class="btn btn-primary pull-right" id="consulta" onclick="javascript:consReporte()">Consultar</button>
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
                      <th>Orden</th>
                      <th>Id</th>
                      <th>Fecha Creac.</th>
                      <th>Fecha Inicio</th>
                      <th>Fecha Fin</th>
                      <th>Cant. Personas</th>
                      <th>H.H Ejecutadas</th>
                      <th>Equipo</th>
                      <th>Sector</th>
                      <th>Asignado</th>
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
        </div><!-- /.box-footer -->
      </div><!-- /.box -->
    </div>
  </div>
</section>

<script>  
// Datepicker -->
$(".fecha").datepicker();

// Datatables -->
/* $('#sales').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "order": [[0, "asc"]],
}); */

// Habilitar y deshabilitar fecha sector y equipo -->
$(function() {
  enabDisabSector();
  $("#selSector").click(enabDisabSector);
  enabDisabEquipo();
  $("#selEquipo").click(enabDisabEquipo);
  enabDisabFecha();
  $("#selFecha").click(enabDisabFecha);
});

function enabDisabSector() {
  if (this.checked) {
    $("input.buscSector").removeAttr("disabled");
  } else {
    $("input.buscSector").attr("disabled", true);
    $("input.buscSector").val('');
  }
}

function enabDisabEquipo() {
  if (this.checked) {
    $("select#equipSelec").removeAttr("disabled");
  } else {
    $("select#equipSelec").attr("disabled", true);
    $("select#equipSelec").val('');
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
  // trae sectores para el input text
  var dataF = function() {
    var tmp = null;
    $.ajax({
      'async': false,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "Sservicio/getSector",
      'success': function(data) {
        tmp = data;
      }
    });
    return tmp;
  }();
  $(".buscSector").autocomplete({
    source: dataF,
    delay: 100,
    minLength: 1,
    focus: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox
      $(this).val(ui.item.label);
    },
    select: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox and hidden field
      $(this).val(ui.item.label);
      $("#idSector").val(ui.item.value);
    },
  });
  

  // trae equipo para llenar el select
  $.ajax({
    'async': true,
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "Sservicio/getEquipo",
    'success': function (data) {
      console.table(data);
      var $select = $("#equipSelec");
      for (var i = 0; i < data.length; i++) {
        $select.append( $('<option />',{ value:data[i]['id_equipo'], text:data[i]['descripcion'], title:data[i]['codigo'] }) );
      }
     },
    'error' : function (data){
      console.log('Error al traer equipos');
      //alert('error');
    }
  });
});
</script>

<!-- Validacion de campos y Envio form -->
<script> 
// limpio datos a consultar
function limpCombo(){
  $('.check').attr('checked',false);

  $("input.buscSector").attr("disabled", true);
  $("input.buscSector").val('');
  $("#idSector").val('');

  $("select#equipSelec").attr("disabled", true);
  $("select#equipSelec").val('');

  $("input.fecha").attr("disabled", true);
  $("input.fecha").val('');
}


function consReporte() {    
  var id_eq  = $('#equipSelec').val();
  var id_sec = $('#idSector').val();
  var de     = $('#desde').val();
  var a      = $('#hasta').val();  
  WaitingOpen('Cargando Solicitud de Servicios...');
  
  if ($.fn.dataTable.isDataTable('#sales')) {
    $('#sales').DataTable().destroy();
  }

  $.ajax({    
    data: {
      id_equipo: id_eq,
      id_sector: id_sec,
      desde: de,
      hasta: a
    },
    type: 'POST',             
    dataType: 'json',
    url: 'index.php/Reporte/getReporte',                
    success: function(result) {
      console.table(result[0]);
      limpCombo();
      $("#tablaReportes").css("display", "block");
      
      // Prepare data array
      var tableData = [];
      if (result !== 0) {
        for (var i = 0; i < result.length; i++) {
          let color = 'secondary';
          let texto = result[i]['estado'];
          let estadoValor = result[i]['estado'].trim().toUpperCase();

          switch (estadoValor) {
            case 'C': texto = 'Curso'; color = 'info'; break;
            case 'IN': texto = 'Inactivo'; color = 'secondary'; break;
            case 'RE': texto = 'Reparación'; color = 'warning'; break;
            case 'AN': texto = 'Anulado'; color = 'danger'; break;
            case 'T': texto = 'Terminada'; color = 'success'; break;
            case 'AS': texto = 'Asignada'; color = 'primary'; break;
            case 'P': texto = 'Pedido'; color = 'primary'; break;
            case 'S': texto = 'Solicitado'; color = 'primary'; break;
            case 'CN': texto = 'Conforme'; color = 'success'; break;
            case 'CE': texto = 'Cerrado'; color = 'dark'; break;
            case 'PL': texto = 'Planificada'; color = 'warning'; break;
            default: texto = estadoValor; color = 'secondary';
          }

          let bolita = estado(texto, color);

          const fechaInicio = new Date(result[i]['fecha_inicio']);
          const fechaFin = new Date(result[i]['fecha_terminada']);
          const cantidadPersonas = result[i]['cantidad_personas'];
          let total_horas_persona = '';

          if (cantidadPersonas !== "0") {
            const diffMs = fechaFin - fechaInicio;
            const diffHoras = diffMs / (1000 * 60 * 60);
            const totalHorasPersona = diffHoras * cantidadPersonas;
            total_horas_persona = totalHorasPersona.toFixed(2);
          }

          tableData.push([
            result[i]['origen'],
            result[i]['id'],
            result[i]['f_solicitado'],
            result[i]['fecha_inicio'],
            result[i]['fecha_terminada'],
            result[i]['cantidad_personas'],
            total_horas_persona,
            result[i]['equipo'],
            result[i]['sector'],
            result[i]['asignado'],
            bolita,
          ]);
        }
      } else {
        alert("Este equipo no se puede filtrar, POR FAVOR SELCCIONO OTRO");
      }
      
      // Initialize DataTable with all data at once
      initTable($('#sales'), tableData);
      WaitingClose();
    },
    error: function(result) {
      limpCombo();
      WaitingClose();                                              
      console.error("Error al traer solicitud de servicio");
    }
  });
}

//inicializa los botones del datatable
function initTable(e, data) {
  $(e).DataTable({
    data: data, 
    responsive: true,
    dom: 'lBfrtip',
    buttons: [
      {
        extend: 'excel',
        text: 'Exportar Excel',
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        },
        //Aquí es donde generas el botón personalizado
        text: '<button class="btn btn-success ml-2 mb-2 mb-2 mt-3">Exportar a Excel <i class="fa fa-file-excel-o"></i></button>'
      },
      {
        extend: 'pdf',
        text: 'Exportar PDF',
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        },
        text: '<button class="btn btn-danger ml-2 mb-2 mb-2 mt-3">Exportar a PDF <i class="fa fa-file-pdf-o mr-1"></i></button>'

      },
      {
        extend: 'copy',
        text: 'Copiar',
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        },
        text: '<button class="btn btn-primary ml-2 mb-2 mb-2 mt-3">Copiar <i class="fa fa-file-text-o mr-1"></i></button>'
      },
      {
        extend: 'print',
        text: 'Imprimir',
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        },
        text: '<button class="btn btn-default ml-2 mb-2 mb-2 mt-3">Imprimir <i class="fa fa-print mr-1"></i></button>'
      }
    ],
    language: {
      url: '<?php echo base_url(); ?>lib/bower_components/datatables.net/js/es-ar.json'
    },
    lengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]],
    paging: true,
    processing: true,
    serverSide: false, 
    order: [[2, "asc"]],
  });
}



function estado(texto, color, detalle = null) {
  //no toma los colores de bootstrap
   let colores = {
    'primary': '#0d6efd',
    'secondary': '#6c757d',
    'success': '#198754',
    'danger': '#dc3545',
    'warning': '#ffc107',
    'info': '#0dcaf0',
    'dark': '#212529'
  }; 

  let colorFondo = colores[color] || '#6c757d'; // Usa gris si no encuentra el color
  return `<span class="badge estado" style="background-color:${colorFondo} !important; color: white !important;">${texto}</span>`;
} 

</script>
