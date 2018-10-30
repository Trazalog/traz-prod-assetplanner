<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Unidades de medida</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalagregar" id="btnAdd">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="tbl-unidadMedida" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Nro Unidad de Medida</th>
                <th>Descripción</th>
              </tr>
            </thead>
            <tbody>
              <?php 
              if($list) {
                foreach($list as $u)
                {
                  $idUnidadMedida = $u['id_unidadmedida'];
                  echo '<tr data-idunidadmedida="'.$idUnidadMedida.'">';
                  echo '<td>';
                  if (strpos($permission,'Del') !== false) {
                    echo '<a href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar componente" data-toggle="modal" data-target="#modaleliminar"></a>';
                  }
                  if (strpos($permission,'Edit') !== false) {
                    echo '<a href="#" class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar componente" data-toggle="modal" data-target="#modaleditar"></a>';
                  }
                  echo '</td>';
                  echo '<td style="text-align: left">'.$u['id_unidadmedida'].'</td>';
                  echo '</td>';
                  echo '<td style="text-align: left">'.$u['descripcion'].'</td>';
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

<!-- Modal agregar -->
<div class="modal" id="modalagregar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-pencil text-light-blue"></span> Agregar Unidad de Medida</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
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
            <label style="margin-top: 7px;">Descripción <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control" id="descripcion" name="descripcion">
          </div>
        </div><br>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave" onclick="guardar()" >Guardar</button>
      </div>  <!-- /.modal footer -->

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog -->
</div>  <!-- /.modal -->

<!-- Modal editar-->
<div class="modal" id="modaleditar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-pencil text-light-blue"></span> Editar Unidad de Medida</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Descripción <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="hidden" id="idunidadmedidaE" name="idunidadmedidaE" value="">
            <input type="text" class="form-control" id="descripcionE" value="" >
          </div>
        </div><br>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave" onclick="guardareditar()" >Guardar</button>
      </div>  <!-- /.modal footer -->

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog -->
</div>  <!-- /.modal -->

<!-- Modal eliminar-->
<div class="modal" id="modaleliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar Unidad de Medida</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <p>¿Realmente desea Eliminar la Unidad de medida?</p>
      </div>  <!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave" data-dismiss="modal" onclick="eliminarUnidadMedida()" >Eliminar</button>
      </div>  <!-- /.modal footer -->
      
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog -->
</div>  <!-- /.modal -->
<!-- / Modal -->

<script>
/*$('[data-toggle="tooltip"]').tooltip({
    trigger:'hover'
  });
  $('body').tooltip({
    selector: '[data-toggle="tooltip], [title]:not([data-toggle="popover"])',
    trigger: 'hover',
    container: 'body'
  }).on('click mousedown mouseup', '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])', function(){
    $('[data-toggle="tooltip"], [title]:not([data-toggle="popover"])').tooltip('destroy');
})*/

// agregar unidad de medida
function guardar() {
  var descripcion = $('#descripcion').val();
  var hayError = false; 
  $('#error').hide();
  if($('#descripcion').val() == '')
  {
    hayError = true;
  }
  if(hayError == true){
    $('#error').fadeIn('slow');     
    return;
  }
  $.ajax({
    data:{descripcion:descripcion},
    // dataType: 'json',
    type:"POST",
    url: "index.php/UnidadMedida/agregarUnidadMedida",
    success: function(data){
      //console.log("data: "+data);
      $('#modalagregar').modal('hide');
      regresa();
    },
    error: function(result){
        console.error("Error al agregar herramientas");
        console.table(result);
    },
  });
}

// Carga datos del modal editar
$(".fa-pencil").click(function (e) { 
  var idunidadmedida = $(this).parent('td').next().html();
  var descripcion    = $(this).parent('td').next().next().html();
  //console.info(idunidadmedida);
  $('#idunidadmedidaE').val(idunidadmedida);
  $('#descripcionE').val(descripcion);
});
// edita unidad de medida
function guardareditar(){
  var idunidadmedida = $('#idunidadmedidaE').val();
  var descripcion    = $('#descripcionE').val();
  var parametros = {
    'descripcion'     : descripcion,
  };                                            
  //console.log(idunidadmedida);
  var hayError = false; 
  $('#errorE').hide();

  if($('#descripcionE').val() == '')
  {
    hayError = true;
  }

  if(hayError == true){
    $('#errorE').fadeIn('slow');     
    return;
  }

  $.ajax({
    type:"POST",
    url: "index.php/UnidadMedida/editarUnidadMedida",
    data:{parametros:parametros, idunidadmedida:idunidadmedida},
    success: function(data){
      //console.log("data: "+data);
      $('#modaleditar').modal('hide');
      regresa();    
    },
    error: function(result){
      console.error("Error al editar unidad de medida");
      console.table(result);
    },
  });
}

// Saca el id de componente a eliminar
$(".fa-times-circle").click(function (e) { // Ok
    idUnidadMedida = $(this).parent('td').parent('tr').data('idunidadmedida');
    console.log("El id de unidad de medida a eliminar es: "+idUnidadMedida);
});
// Elimina componente
function eliminarUnidadMedida() { // Ok
  WaitingOpen('Eliminando Unidad de medida');
  $.ajax({
    data: { idUnidadMedida:idUnidadMedida },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/UnidadMedida/bajaUnidadMedida',
    success: function(data){
      WaitingClose();
      regresa();
      /*console.table(data['unidadMedida']);
      tabla = $('#tbl-unidadMedida').DataTable();
      tabla.clear().draw();
      for(i = 0; i < data['unidadMedida'].length; i++) {
        var idUnidadMedida = data['unidadMedida'][i]['id_unidadmedida'];
        var descripcion    = data['unidadMedida'][i]['descripcion'];
        //agrego valores a la tabla
        tablaCompleta = tabla.row.add( [
          '<a href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar componente" data-toggle="modal" data-target="#modaleliminar"></a>'+
          '<a href="#" class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar componente" data-toggle="modal" data-target="#modalEditar"></a>',
          idUnidadMedida,
          descripcion,
        ]).node().id = idUnidadMedida;
        $('#tbl-unidadMedida').DataTable().draw();
        WaitingClose();
      }*/
    },
    error: function(result){
      console.error("Error al eliminar unidad de medida");
      console.table(result);
      WaitingClose();
    }
  });
} 


// recarga la vista del listado de componentes
function regresa(){ // Ok
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/UnidadMedida/index/<?php echo $permission; ?>");
  WaitingClose();
}


$('#tbl-unidadMedida').DataTable({
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
</script>