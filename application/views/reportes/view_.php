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
                      <th>Solicitud de Servicio</th>
                      <th>Fecha</th>
                      <th>Solicitante</th>
                      <th>Equipo</th>
                      <th>Sector</th>
                      <th>Grupo</th>
                      <th>Ubicación</th>
                      <th>Causa</th>
                      <th>Observaciones</th>
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
$('#sales').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "order": [[0, "asc"]],
});

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
  //console.log("id_eq: "+id_eq+" - id_sec: "+id_sec+" - de: "+de+" - a: "+a);
  WaitingOpen('Cargando Solicitud de Servicios...');
  //limpio la tabla
  $('#sales').DataTable().clear().draw();

  $.ajax({    
    data:{
    	id_equipo: id_eq,
    	id_sector: id_sec,
    	desde: de,
    	hasta: a
    },
    type: 'POST',             
    dataType: 'json',
    url: 'index.php/Reporte/getReporte',                
    success: function(result){
      console.table(result[0]);
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
          $('#sales').DataTable().row.add( [
            result[i]['id_solicitud'],
            result[i]['f_solicitado'],
            result[i]['solicitante'],
            result[i]['equipo'],
            result[i]['sector'],
            result[i]['grupo'],
            result[i]['ubicacion'],
            result[i]['causa'],
            result[i]['observaciones'],
            e,
          ] ).draw();
        }
      }
      else{
        alert("Este equipo no se puede filtrar, POR FAVOR SELCCIONO OTRO");
      }
      WaitingClose();
    },
    error: function(result){
     	limpCombo();
      WaitingClose();                                              
      console.error("Error al traer solicitud de servicio");
    }
  });
}


</script>
