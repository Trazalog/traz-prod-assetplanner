<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Tareas</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd" title="Nueva">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="tarea" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Nro:</th>
                <th>Descripción:</th>
                <th>id_empresa</th>
                <th>estado</th>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach($list as $f)
                {
                  echo '<tr>';
                  echo '<td>';
                  if (strpos($permission,'Edit') !== false) {
                    echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar"></i>';
                  }
                  if (strpos($permission,'Del') !== false) {
                   echo '<i class="fa fa-fw fa-times-circle text-light-blue" title="Eliminar" style="cursor: pointer; margin-left: 15px;" ></i>';
                  }
                  echo '</td>';
                  echo '<td>'.$f['id_tarea'].'</td>';
                  echo '<td>'.$f['descripcion'].'</td>';
                  echo '<td>'.$f['id_empresa'].'</td>';
                  echo '<td>'.$f['estado'].'</td>';
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
function guardarTarea(){
  var descripcion = $('#descripcion').val();
  var id_empresa  = $('#id_empresa').val();
  var estado      = $('#estado').val();
  var hayError    = false;

  if($('#descripcion').val() == '' || $('#id_empresa').val() == '' || $('#estado').val() == '' )
  {
    hayError = true;
  }
  if(hayError == true){
    $('#error').fadeIn('slow');
    return;
  }
  $('#error').fadeOut('slow');          
  WaitingOpen();
  $.ajax({
   type: 'POST',
   data: {"descripcion":descripcion, "id_empresa":id_empresa, "estado":estado},
   url: 'index.php/Tarea/Guardar_Tarea', 
   success: function(result){
     WaitingClose();
     $('#modalAgregar').modal('hide');
     ActualizarPagina();
   },
   error: function(result){
     alert("OPERACIÓN FALLIDA");
   }
 });
}

var id_ = "";
$(".fa-pencil").click(function (e) { 
  id_ = $(this).parents('tr').find('td').eq(1).html();
  var descripcion = $(this).parents('tr').find('td').eq(2).html();
  
  $('#cuerpoModalEditar').html(' <div class="row">'+
    '<div class="col-xs-12">'+
      '<div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">'+
        '<h4><i class="icon fa fa-ban"></i> Error!</h4>'+
        'Revise que todos los campos esten completos'+
      '</div>'+
    '</div>'+
  '</div>'+
    '<div class="row">'+
      '<div class="col-xs-12 col-sm-4">'+
         ' <label style="margin-top: 7px;">Descripcion <strong style="color: #dd4b39">*</strong>: </label>'+
      '</div>'+
      '<div class="col-xs-12 col-sm-8">'+
        '<input type="text" class="form-control"  id="descripcionE" value="'+descripcion+'" >'+
      '</div>'+
  '</div><br>');
  $('#modalEditar').modal('show');
});    

function editarTarea(){
  var id          = id_;
  var descripcion = $('#descripcionE').val();
  var hayError    = false;
  if($('#descripcionE').val() == '' )
  {
    hayError = true;
  }
  if(hayError == true){
    $('#errorE').fadeIn('slow');
    return;
  }
  $('#errorE').fadeOut('slow');
  WaitingOpen();
  $.ajax({
    type: 'POST',
    dataType : "json",
    data: {"id_tarea" : id,  "descripcion":descripcion },
    url: 'index.php/Tarea/Modificar_Tarea', 
    success: function(result){
      WaitingClose();
      $('#modalEditar').modal('hide');
      ActualizarPagina();
    },
    error: function(result){
      alert("OPERACIÓN FALLIDA");
      console.log(result);
    }
  });
}

$(".fa-times-circle").click(function (e) { 
  id_ = $(this).parents('tr').find('td').eq(1).html();
  $('#modalEliminar').modal('show');
});

function eliminarTarea(){
  WaitingOpen();
  $.ajax({
    type: 'POST',
    data: { "id_tarea": id_},
    url: 'index.php/Tarea/Eliminar_Tarea', 
    success: function(data){
      WaitingClose();
      ActualizarPagina();                
    },
    error: function(result){
      alert("OPERACION FALLIDA");
    }
  });
}

function ActualizarPagina(){ //Funcion Resfresca
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Tarea/index2/<?php echo $permission; ?>");
}

$(function () {
  $('#tarea').DataTable({
    "aLengthMenu": [ 10, 25, 50, 100 ],
    "columnDefs": [ {
      "targets": [ 0 ], 
      "searchable": false,
      "orderable": false,
      "className": "text-center"
    },
    {
      "targets": [1],
      "type": "num",
      "visible": true,
      "orderable": true,
      "className": "text-center"
    },
    {
      "targets": [2], 
      "visible": true,
      "orderable": true
    },
    {
      "targets": [3], 
      "visible": false,
      "orderable": false
    },
    {
      "targets": [4], 
      "visible": false,
      "orderable": false
    }],
    "order": [[1, "asc"]],
    "columns": [
      { "width": "5%" },
      { "width": "8%" },
      { "width": "87%" },
      { "width": "0%" },
      { "width": "0%" }
    ]
  });
});
</script>

<div class="modal" id="modalAgregar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Agregar Tarea</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos
            </div>
          </div>
        </div>

        <div class="row"> 
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Descripcion <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control"  id="descripcion" >
          </div>
        </div><br>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="guardarTarea()" >Guardar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- Modal -->



<div class="modal" id="modalEditar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Editar Tarea</h4>
      </div>

      <div class="modal-body" id="cuerpoModalEditar">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos
            </div>
          </div>
        </div> 
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="editarTarea()" >Guardar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- Modal -->


<div class="modal" id="modalEliminar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Eliminar Tarea</h4>
      </div>
      
      <div class="modal-body" id="cuerpoModalEditar">
        <h5>¿Desea eliminar el registro?</h5> 
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarTarea()" >Eliminar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->