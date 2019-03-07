<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Informe de Servicio</h3> <!-- EX Orden de Servicios-->
        </div><!-- /.box-header -->

        <div class="box-body">
          <table id="tblorden" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th> 
                <th>Nº de Informe</th>             
                <th>Nº de OT</th>
                <th>Descripción de OT</th>
                <th>Equipo</th> 
                <th>Fecha</th>                
                <th>Estado</th>                          
              </tr>
            </thead>
            <tbody>
              <?php
                if(count($list) > 0)
                {                  
                	foreach($list as $a)
                  {
  	                $id = $a['id_orden'];
                    echo '<tr id="'.$id.'">';
                      echo '<td class="icono">';
                        echo '<i class="fa fa-sticky-note-o text-light-blue" data-toggle="modal" data-target="#modalOrder" style="cursor: pointer; margin-left: 15px;" title="Ver Informe"></i>'; 
                        echo '<i class="text-light-blue fa fa-fw '.($a['estado'] == 'C' ? 'fa fa-toggle-on' : 'fa fa-toggle-off').'" title="'.($a['estado'] == 'C' ? 'Finalizar Informe' : 'Finalizado').'" style="cursor: pointer; margin-left: 15px;"></i>';
                      echo '</td>';
                      echo '<td>'.$a['id_orden'].'</td>';
                      echo '<td>'.$a['id_ot'].'</td>';
                      echo '<td>'.$a['descripcion_ot'].'</td>';
                      echo '<td>'.$a['equipo'].'</td>';
                      echo '<td>'.$a['fecha'].'</td>';
                      echo '<td>'.($a['estado'] == 'C' ? '<small class="label pull-left bg-green">Curso</small>' :($a['estado'] == 'T' ? '<small class="label pull-left bg-blue">Terminado</small>' : '<small class="label pull-left bg-red">Solicitado</small>')).'</td>';
  	                echo '</tr>';
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


<!-- Modal Ver -->           
<div class="modal" id="modalOrder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Informe de Servicio</h4>
      </div> <!-- /.modal-header  -->  
       
      <div class="modal-body">  
        <table id="modOrden" class="table table-bordered table-hover">
          <thead>
            <tr>
              <!-- <th width="5%">Acciones</th> --> 
              <th>Nº de Informe</th>             
              <th>Nº de OT</th>
              <th>Descripción de OT</th>
              <th>Equipo</th>
              <th>Fecha</th>
              <th>Estado</th>               
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>      
       
        <div class="panel-group collapse-group" id="accordion" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
              <h4 class="panel-title">
                <a class="tarea"role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseZero" aria-expanded="false" aria-controls="collapseZero">
                  Lecturas
                </a>
              </h4>
            </div>
            <div id="collapseZero" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                <table id="modLectura" class="table table-bordered table-hover">
                  <thead>
                    <tr>                            
                      <th>Horómetro inicio</th>
                      <th>Horómetro fin</th>
                      <th>Fecha inicio</th>
                      <th>Fecha fin</th>                            
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table> 
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
              <h4 class="panel-title">
                <a class="tarea"role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                  Tareas
                </a>
              </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
              <div class="panel-body">
                <table id="modTarea" class="table table-bordered table-hover">
                  <thead>
                    <tr>                            
                      <th>Tareas</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table> 
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
              <h4 class="panel-title">
                <a class="herramientas collapsed" id="herramientas" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  Orden de Herramientas
                </a>
              </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
              <div class="panel-body">
                <table id="modHerram" class="table table-bordered table-hover">
                  <thead>
                    <tr>                            
                      <th>Herramientas</th>             
                      <th>Marcca</th>
                      <th>Código</th>     
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThree">
              <h4 class="panel-title">
                <a class=" insumos collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                  Orden de Insumos
                </a>
              </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
              <div class="panel-body">
               <table id="modInsum" class="table table-bordered table-hover">
                <thead>
                  <tr>                            
                    <th>Nº O.Insumo</th>
                    <th>Fecha</th>
                    <th>Solicitante</th>
                    <th>Código</th>  
                    <th>Descripción</th>           
                    <th>Cantidad</th> 
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFour">
              <h4 class="panel-title">
                <a class=" insumos collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                  Recursos Humanos
                </a>
              </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
              <div class="panel-body">
               <table id="modRecurso" class="table table-bordered table-hover">
                <thead>
                  <tr>                            
                    <th>Apellido</th> 
                    <th>Nombre</th> 
                  </tr>
                </thead>
                <tbody>
                </tbody>
                </table>
              </div>
            </div>
          </div>
        </div> <!-- / .panel-group -->

      </div> <!-- /.modal-body -->

      <div class="modal-footer">                    
        <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
      </div>  <!-- /.modal footer -->
    
    </div> <!-- /.modal-content -->

  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<script>
// Resetea Nº de orden al recargar la pagina -->
 $('#cargOrden').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Ordenservicio/getOrdenInactiva/<?php echo $permission; ?>");
    WaitingClose();
  });


/////// Carga la tabla del Modal y valida que  no se duplique 
var $flag = 0;    
$(".fa-sticky-note-o").click(function () {     
  var row = $(this).parent("td").parent("tr").clone();
  //row.eq(0).css({"display:none"});
  row.find('td.icono').remove();

  var id_ord = row.attr('id'); // guardo el Id de la orden de servicio.
  console.log('id de orden servicio: '+id_ord);

  // guarda id de OT
  var id_ot = $(this).parents("tr").find("td").eq(2).html();

  if ($flag == 0) {     //primera vez
      mostrarOrd(row); 
      getLecturaOrden(id_ord);
      getTarOrden(id_ord);
      getHerrramOrden(id_ord);
      getInsumOrd(id_ot);
      getRecOrden(id_ord);             
      $flag = 1;
  } 
  else{     //mas de una vez
      $("#modOrden tbody tr").remove();
      $("#modTarea tbody tr").remove();
      $("#modHerram tbody tr").remove();
      $("#modInsum tbody tr").remove();
      $("#modRecurso tbody tr").remove();
      mostrarOrd(row);
      getLecturaOrden(id_ord);
      getTarOrden(id_ord);
      getHerrramOrden(id_ord);
      getInsumOrd(id_ot);  
      getRecOrden(id_ord);      
      $flag = 1;
  };
});

// muestra el encabezado de la Orden de servicio en Modal
function mostrarOrd(row){
  $("#modOrden tr").remove();
  $("#modOrden tbody").append(row);      
}

// trae lecturas segun id de orden y arma tabla en modal 
function getLecturaOrden(id_ord){
  var dataF = function () {
    var tmp = null;
    $.ajax({
      'data' : {id_orden:id_ord },
      'async': false,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "Ordenservicio/getLecturaOrden",
      'success': function (data) {
        tmp = data;
        //console.table(data);
      }
    });
    return tmp;
  }();  
  // Asigna opciones al select #tareas  
  tabla = $('#modLectura').DataTable(); 
  tabla.clear().draw();
  $.each(dataF, function(i, val){           
    $('#modLectura').DataTable().row.add( [
      val.horometroinicio,
      val.horometrofin,
      val.fechahorainicio,
      val.fechahorafin
    ]).draw();
  });
}

// trae tareas segun id de orden y arma tabla en modal 
function getTarOrden(id_ord){
  var dataF = function () {
    var tmp = null;
    $.ajax({
      'data' : {id_orden:id_ord },
      'async': false,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "Ordenservicio/getTareaOrden",
      'success': function (data) {
        tmp = data;
        //console.table(data);
      }
    });
    return tmp;
  }();  
  // Asigna opciones al select #tareas  
  tabla = $('#modTarea').DataTable(); 
  tabla.clear().draw();
  $.each(dataF, function(i, val){           
    $('#modTarea').DataTable().row.add( [
      val.id_tarea
    ]).draw();
  });
}

// trae herramientas segun id de orden y arma tabla en modal 
function getHerrramOrden(id_ord){
  var dataF = function () {
    var tmp = null;
    $.ajax({
      'data' : {id_orden:id_ord },
      'async': false,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "Ordenservicio/getHerramOrden",
      'success': function (data) {
        tmp = data;
        console.table(data);
      }
    });
    return tmp;
  }();        
  tabla = $('#modHerram').DataTable(); 
  tabla.clear().draw();
  $.each(dataF, function(i, val){           
    $('#modHerram').DataTable().row.add( [
      val.herrdescrip,
      val.herrmarca,
      val.herrcodigo
    ]).draw();
  });
}

// trae Insumos segun id de orden y arma tabla en modal 
function getInsumOrd(id_ot){
  var dataF = function () {
    var tmp = null;
    $.ajax({
      'data' : {id_ot:id_ot },
      'async': false,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "Ordenservicio/getInsumosPorOT",
      'success': function (data) {
        tmp = data;
        console.table(data);
      }
    });
    return tmp;
  }();
  tabla = $('#modInsum').DataTable(); 
  tabla.clear().draw();
  $.each(dataF, function(i, val){ 
         
    $('#modInsum').DataTable().row.add( [
      val.nroOT,
      val.fecha,
      val.nombre,
      val.codigo,
      val.descripcion,
      val.cantidad
    ]).draw();
  });      
}

// trae RRHH segun id de orden y arma tabla en modal 
function getRecOrden(id_ord){
  var dataO = function () {
    var tmp = null;
    $.ajax({
      'data' : {id_orden:id_ord },
      'async': false,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "Ordenservicio/getOperarioOrden",
      'success': function (data) {
        tmp = data;
        console.table(data);
      },
    });
    return tmp;
  }();
  tabla = $('#modRecurso').DataTable(); 
  tabla.clear().draw();
  $.each(dataO, function(i, val){           
    $('#modRecurso').DataTable().row.add( [
      val.usrLastName,
      val.usrname
    ]).draw();
  });     
}

// Cambia el estado de Orden servicio y de solicitud de servicio
$(".fa-toggle-on").click(function () {  

  var id_orden = $(this).parent('td').parent('tr').attr('id'); // guarda el id de orden en var global id_orden
  $.ajax({
        type: 'POST',
        data: {id_orden: id_orden},
        url: 'index.php/Ordenservicio/setEstado', 
        success: function(data){                   
                setTimeout("cargarView('Ordenservicio', 'index', '"+$('#permission').val()+"');",0);
              },            
        error: function(result){
              alert("Error en cambio de estado");
            },
            dataType: 'json'
        });
});

// Cambia el estado de solicitud de servicio 
$(".fa-thumbs-up").click(function () {  

  var id_solServ = $(this).parent('td').parent('tr').attr('id'); // guarda el id de orden en var global id_solServ
  $.ajax({
        type: 'POST',
        data: {id_solServ: id_solServ},
        url: 'index.php/Ordenservicio/setEstado', 
        success: function(data){                   
                setTimeout("cargarView('Ordenservicio', 'index', '"+$('#permission').val()+"');",0);
              },            
        error: function(result){
              alert("Error en cambio de estado");
            },
            dataType: 'json'
        });
});

//cierro todos los collapse
$('#modalOrder').on('shown.bs.modal', function () {
  $('.collapse-group').find('.collapse').collapse('hide');
});
//cierro collapse al abrir otro
$('.collapse-group').on('show.bs.collapse','.collapse', function() {
    $('.collapse-group').find('.collapse.in').collapse('hide');
});

// ajusto ancho de columnas
$('#collapseZero, #collapseOne, #collapseTwo, #collapseThree, #collapseFour').on('shown.bs.collapse', function () {
   $($.fn.dataTable.tables(true)).DataTable()
      .columns.adjust();
});

$('#tblorden').DataTable({
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

$('#modLectura, #modTarea, #modHerram, #modInsum, #modRecurso').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "order": [[0, "asc"]],
});
</script>
