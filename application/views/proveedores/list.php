<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Proveedores</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd" title="">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="proveedor" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Nro:</th>
                <th>Nombre:</th>
                <th>Cuit:</th>
                <th>Domicilio:</th>
                <th>Telefono:</th>
                <th>Email:</th>
                <th>Estado:</th>
                <th style="display:none">id_empresa</th>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach($list as $f)
                {
                  echo '<tr>';
                  echo '<td>';
               if (strpos($permission,'Edit') !== false) {
                   echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar" onclick="Loadprovee('.$f['provid'].',\'Edit\')"></i>';
                  }
                  if (strpos($permission,'Del') !== false) {
                   echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar"></i>';
                  }
                  echo '</td>';
                  echo '<td>'.$f['provid'].'</td>';
                  echo '<td>'.$f['provnombre'].'</td>';
                  echo '<td>'.$f['provcuit'].'</td>';
                  echo '<td>'.$f['provdomicilio'].'</td>';
                  echo '<td>'.$f['provtelefono'].'</td>';
                  echo '<td>'.$f['provmail'].'</td>';
                  echo '<td style="text-align: center">'.($f['estado'] == '0' ? '<small class="label pull-left bg-green">Activo</small>' : ($f['estado'] == '1' ? '<small class="label pull-left bg-red">Inactivo</small>' : '<small class="label pull-left bg-yellow">Suspendido</small>')).'</td>';
                  echo '<td style="display:none">'.$f['id_empresa'].'</td>';
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

  function guardarProveedor(){

      var provnombre=$('#provnombre').val();
      var provcuit=$('#provcuit').val();
      var provdomicilio=$('#provdomicilio').val();
      var provtelefono=$('#provtelefono').val();
      var provmail=$('#provmail').val();
      var estado=$('#estado').val();
      var id_empresa=$('#id_empresa').val();

      var hayError = false;
      
        if($('#provnombre').val() == '' || $('#provcuit').val() == '' || $('#provdomicilio').val() == '' || $('#provtelefono').val() == '' || $('#provmail').val() == '' || $('#estado').val() == '' || $('#id_empresa').val() == '' )
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
             data: {"provnombre":provnombre,  "provcuit":provcuit,  "provdomicilio":provdomicilio,  "provtelefono":provtelefono,  "provmail":provmail,  "estado":estado,  "id_empresa":id_empresa },
             url: 'index.php/Proveedor/Guardar_Proveedor', 
             success: function(result){
                WaitingClose();
                $('#modalAgregar').modal('hide');
                 ActualizarPagina();
            },
            error: function(result){
              $('#modalAgregar').modal('hide');
              alert("OPERACIÓN FALLIDA");
            }
          });
  }
    
  $(".fa-pencil").click(function (e) { 

      id_ = $(this).parents('tr').find('td').eq(1).html();
      var provnombre = $(this).parents('tr').find('td').eq(2).html();
      var provcuit = $(this).parents('tr').find('td').eq(3).html();
      var provdomicilio = $(this).parents('tr').find('td').eq(4).html();
      var provtelefono = $(this).parents('tr').find('td').eq(5).html();
      var provmail = $(this).parents('tr').find('td').eq(6).html();
      var estado = $(this).parents('tr').find('td').eq(7).html();
      var id_empresa = $(this).parents('tr').find('td').eq(8).html();

      $('#cuerpoModalEditar').html(' <div class="row">'+
        '<div class="col-xs-12">'+
          '<div class="alert alert-danger alert-dismissable" id="errorE" style="display: none">'+
            '<h4><i class="icon fa fa-ban"></i> Error!</h4>'+
            'Revise que todos los campos esten completos'+
          '</div>'+
        '</div>'+
      '</div>'+
        '<div class="row">'+
          '<div class="col-xs-4">'+
              ' <label style="margin-top: 7px;">Nombre <strong style="color: #dd4b39">*</strong>: </label>'+
          '</div>'+
          '<div class="col-xs-8">'+
              '<input type="text" class="form-control"  id="provnombreE" value="'+provnombre+'" >'+
              '<input type="text" class="form-control"  id="idProveedor" value="'+ id_+'" >'+
          '</div>'+
      '</div><br>'+
        '<div class="row">'+
          '<div class="col-xs-4">'+
              ' <label style="margin-top: 7px;">Cuit <strong style="color: #dd4b39">*</strong>: </label>'+
          '</div>'+
          '<div class="col-xs-8">'+
              '<input type="text" class="form-control"  id="provcuitE" value="'+provcuit+'" >'+
          '</div>'+
      '</div><br>'+
        '<div class="row">'+
          '<div class="col-xs-4">'+
              ' <label style="margin-top: 7px;">Domicilio <strong style="color: #dd4b39">*</strong>: </label>'+
          '</div>'+
          '<div class="col-xs-8">'+
              '<input type="text" class="form-control"  id="provdomicilioE" value="'+provdomicilio+'" >'+
          '</div>'+
      '</div><br>'+
        '<div class="row">'+
          '<div class="col-xs-4">'+
              ' <label style="margin-top: 7px;">Telefono <strong style="color: #dd4b39">*</strong>: </label>'+
          '</div>'+
          '<div class="col-xs-8">'+
              '<input type="text" class="form-control"  id="provtelefonoE" value="'+provtelefono+'" >'+
          '</div>'+
      '</div><br>'+
        '<div class="row">'+
          '<div class="col-xs-4">'+
              ' <label style="margin-top: 7px;">Email <strong style="color: #dd4b39">*</strong>: </label>'+
          '</div>'+
          '<div class="col-xs-8">'+
              '<input type="text" class="form-control"  id="provmailE" value="'+provmail+'" >'+
          '</div>'+
      '</div><br>');
      $('#modalEditar').modal('show');

  }); 

  function editarProveedor(){
    

    var id = $('#idProveedor').val();;
    var provnombre = $('#provnombreE').val();
    var provcuit = $('#provcuitE').val();
    var provdomicilio = $('#provdomicilioE').val();
    var provtelefono = $('#provtelefonoE').val();
    var provmail = $('#provmailE').val();
          
    var hayError = false;

    if($('#provnombreE').val() == '' || $('#provcuitE').val() == '' || $('#provdomicilioE').val() == '' || $('#provtelefonoE').val() == '' || $('#provmailE').val() == '' )
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
      data: {provid : id,  
            provnombre:provnombre,  
            provcuit:provcuit,  
            provdomicilio:provdomicilio,  
            provtelefono:provtelefono,  
            provmail:provmail },
      url: 'index.php/Proveedor/Modificar_Proveedor', 
      success: function(result){
              WaitingClose();
              $('#modalEditar').modal('hide');
              ActualizarPagina();
        },
        error: function(result){
              $('#modalEditar').modal('hide');
              alert("OPERACIÓN FALLIDA");
              console.log(result);
        }

    });

  }

  $(".fa-times-circle").click(function (e) { 

    var id_ = $(this).parents('tr').find('td').eq(1).html();
    $('#idProveedor').val(id_);
    $('#modalEliminar').modal('show');
    
  });

  function eliminarProveedor(){

    var id = $('#idProveedor').val();
    WaitingOpen('Elilminando proveedor...');
    $.ajax({
      type: 'POST',
      data: {provid: id},
      url: 'index.php/Proveedor/Eliminar_Proveedor', 
      success: function(data){
        WaitingClose();
        ActualizarPagina();                
      },

      error: function(result){
        WaitingClose();
        alert("OPERACION FALLIDA");
      }
    });

  }

  function ActualizarPagina(){ //Funcion Resfresca
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Proveedor/index/<?php echo $permission; ?>");
  }

  $(function () {
    $('#proveedor').DataTable({
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

<!-- Modal Agregar -->
  <div class="modal" id="modalAgregar">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Agregar Proveedor</h4>
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
            <div class="col-xs-4">
              <label style="margin-top: 7px;">Nombre <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-8">
              <input type="text" class="form-control"  id="provnombre" >
            </div>
          </div><br>

          <div class="row"> 
            <div class="col-xs-4">
              <label style="margin-top: 7px;">Cuit <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-8">
              <input type="text" class="form-control"  id="provcuit" >
            </div>
          </div><br>

          <div class="row"> 
            <div class="col-xs-4">
              <label style="margin-top: 7px;">Domicilio <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-8">
              <input type="text" class="form-control"  id="provdomicilio" >
            </div>
          </div><br>

          <div class="row"> 
            <div class="col-xs-4">
              <label style="margin-top: 7px;">Telefono <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-8">
              <input type="text" class="form-control"  id="provtelefono" >
            </div>
          </div><br>

          <div class="row"> 
            <div class="col-xs-4">
              <label style="margin-top: 7px;">Email <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-8">
              <input type="text" class="form-control"  id="provmail" >
            </div>
          </div><br>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" onclick="guardarProveedor()" >Guardar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal --><!-- Modal -->
<!-- / Modal Agregar -->

<!-- Modal Editar -->
<div class="modal" id="modalEditar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Editar Proveedor</h4>
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
        <button type="button" class="btn btn-primary" onclick="editarProveedor()" >Guardar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- Modal -->
<!-- / Modal Editar -->

<!-- Modal Aviso Eliminar -->
<div class="modal" id="modalEliminar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Eliminar Proveedor</h4>
      </div>
      <div class="modal-body" id="cuerpoModalEditar">
       <h5>¿Desea eliminar este Proveedor?</h5> 
      </div>
      <div class="modal-footer">
        <input type="hidden" class="form-control"  id="idProveedor" >
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarProveedor()" >Eliminar</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- / Modal Aviso Eliminar -->