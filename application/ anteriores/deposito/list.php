<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Depositos</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd" title="Nueva">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="deposito" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Nro:</th>
                <th>Descripcion:</th>
                <th>Direccion:</th>
                <th style="display:none">Empresa:</th>
                <th style="display:none">Estado:</th>
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
                   echo '<i class="fa fa-fw fa-times-circle text-light-blue" title="Eliminar" style="cursor: pointer; margin-left: 15px;"></i>';
                  }
                  echo '</td>';
                  echo '<td>'.$f['depositoId'].'</td>';
                  echo '<td>'.$f['depositodescrip'].'</td>';
                  echo '<td>'.$f['direccion'].'</td>';
                  echo '<td style="display:none">'.$f['id_empresa'].'</td>';
                  echo '<td style="display:none">'.$f['estado'].'</td>';
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
function guardarDeposito(){
  var depositodescrip = $('#depositodescrip').val();
  var direccion       = $('#direccion').val();
  var id_empresa      = $('#id_empresa').val();
  var estado          = $('#estado').val();
  var hayError        = false;
  if($('#depositodescrip').val() == '' || $('#direccion').val() == '' || $('#id_empresa').val() == '' || $('#estado').val() == '' )
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
    data: {    "depositodescrip":depositodescrip,  "direccion":direccion,    "id_empresa":id_empresa,  "estado":estado },
    url: 'index.php/Deposito/Guardar_Deposito', 
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

var id_ ="";
$(".fa-pencil").click(function (e) { 
  id_                 = $(this).parents('tr').find('td').eq(1).html();
  var depositodescrip = $(this).parents('tr').find('td').eq(2).html();
  var direccion       = $(this).parents('tr').find('td').eq(3).html();
  var id_empresa      = $(this).parents('tr').find('td').eq(8).html();
  var estado          = $(this).parents('tr').find('td').eq(9).html();
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
      '<input type="text" class="form-control"  id="depositodescripE" value="'+depositodescrip+'" >'+
    '</div>'+
  '</div><br>'+
  '<div class="row">'+
    '<div class="col-xs-12 col-sm-4">'+
      ' <label style="margin-top: 7px;">Direccion <strong style="color: #dd4b39">*</strong>: </label>'+
    '</div>'+
    '<div class="col-xs-12 col-sm-8">'+
      '<input type="text" class="form-control"  id="direccionE" value="'+direccion+'" >'+
    '</div>'+
  '</div><br>' );
  $('#modalEditar').modal('show');
});

function editarDeposito(){
  var id              = id_;
  var depositodescrip = $('#depositodescripE').val();
  var direccion       = $('#direccionE').val();
  var id_empresa      = $('#id_empresaE').val();
  var estado          = $('#estadoE').val();
  var hayError        = false;
  if($('#depositodescripE').val() == '' || $('#direccionE').val() == '')
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
    data: {"depositoId" : id,  "depositodescrip":depositodescrip,  "direccion":direccion, "id_empresa":id_empresa,  "estado":estado },
    url: 'index.php/Deposito/Modificar_Deposito', 
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

function eliminarDeposito(){
  WaitingOpen();
  $.ajax({
    type: 'POST',
    data: { "depositoId": id_},
    url: 'index.php/Deposito/Eliminar_Deposito', 
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
  $("#content").load("<?php echo base_url(); ?>index.php/Deposito/index/<?php echo $permission; ?>");
}

$(function () {
  $('#deposito').DataTable({
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
</script>

<div class="modal" id="modalAgregar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Agregar Deposito</h4>
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
            <input type="text" class="form-control"  id="depositodescrip" >
          </div>
        </div><br>

        <div class="row"> 
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Direccion <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control"  id="direccion" >
          </div>
        </div><br>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="guardarDeposito()" >Guardar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- Modal -->


<div class="modal" id="modalEditar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Editar Deposito</h4>
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
        <button type="button" class="btn btn-primary" onclick="editarDeposito()" >Guardar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- Modal -->


<div class="modal" id="modalEliminar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Eliminar Deposito</h4>
      </div>

      <div class="modal-body" id="cuerpoModalEditar">
        <h5>¿Desea eliminar el registro?</h5> 
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarDeposito()" >Eliminar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->