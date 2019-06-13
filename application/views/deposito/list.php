<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Depositos</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalAgregar" id="btnAdd">Agregar</button>';
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
                  echo '<td>'.$f['depo_id'].'</td>';
                  echo '<td>'.$f['descripcion'].'</td>';
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
  
  // guarda deposito nuevo
  function guardarDeposito(){

    var depositodescrip = $('#depositodescrip').val();
    var direccion       = $('#direccion').val();   
    var provincias      = $('#provincias').val();
    var departamentos   = $('#departamentos').val();
    var gps             = $('#gps').val();

    var hayError        = false;
    if( depositodescrip == '' || direccion == '' ){
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
      data: { depositodescrip:depositodescrip,  
              direccion:direccion,  
              provincias: provincias,
              departamentos: departamentos,
              gps: gps},
      url: 'index.php/Deposito/Guardar_Deposito', 
      success: function(result){
        WaitingClose();
        $('#modalAgregar').modal('hide');
        ActualizarPagina();
      },
      error: function(result){
        WaitingClose();
        alert("OPERACIÓN FALLIDA");
      }
    });
  }

  //  edita deposito
  $(".fa-pencil").click(function (e) { 
    var id = $(this).parents("tr").find("td").eq(1).html();
    $.ajax({
      type: 'POST',
      data: {id: id },
      url: 'index.php/Deposito/Obtener_Deposito', 
      success: function(result){
        WaitingClose(result);
        console.table(result);
        $('#idDepo').val(result[0]['depo_id']);
        $('#depositodescripE').val(result[0]['descripcion']);
        $('#direccionE').val(result[0]['direccion']);
        $('#provinciasEdit').val(result[0]['esta_id']); 
        $('#gpsEdit').val(result[0]['GPS']);
        $("#departamentosEdit").removeAttr( "disabled" );       
        traerDepartamentos( result[0]['esta_id'] );
        $('#departamentosEdit').val(result[0]['loca_id']);   
      },
      error: function(result){
        WaitingClose();
        alert("OPERACIÓN FALLIDA");
      },
      dataType: 'json'
    });

    $('#modalEditar').modal('show');
  });  
  function editarDeposito(){
   
    var depoid = $('#idDepo').val();
    var depositodescrip = $('#depositodescripE').val();    
    var direccion       = $('#direccionE').val();   
    var provincia      =  $('#provinciasEdit').val(); 
    var localidad   = $('#departamentosEdit').val();  
    var gps             = $('#gpsEdit').val();  
    var hayError        = false;
    if(depositodescrip == '' || direccion == '')
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
      data: {depo_id : depoid,  
            descripcion:depositodescrip,  
            direccion:direccion, 
            gps: gps,
            estado: 'AC',
            loca_id: localidad,
            esta_id: provincia
             },
      url: 'index.php/Deposito/Modificar_Deposito', 
      success: function(result){
        WaitingClose();
        $('#modalEditar').modal('hide');
        ActualizarPagina();
      },
      error: function(result){
       
        WaitingClose();
        alert("OPERACIÓN FALLIDA");
        console.log(result);
      }
    });
  }

  // eliminar deposito
  $(".fa-times-circle").click(function (e) { 
    var id_ = $(this).parents('tr').find('td').eq(1).html();
    $("#iddepoEd").val(id_);
    $('#modalEliminar').modal('show');
    
  });
  function eliminarDeposito(){
    var idEd = $("#iddepoEd").val();
    alert(idEd);
    WaitingOpen();
    $.ajax({
      type: 'POST',
      data: { depo_id: idEd},
      url: 'index.php/Deposito/Eliminar_Deposito', 
      success: function(data){
        $('#modalEditar').modal('hide');
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

  // trae provincias
  traerProvincias();
  function traerProvincias() {   	

    $.ajax({
      type: 'POST',
      //data: {id_provincia},
      dataType: 'json',
      url: 'index.php/Deposito/getProvincia',
      success: function(result){     
        var opcion  = "<option value='-1'>Seleccione provincia...</option>";       
        $('#provincias').append(opcion);
        for(var i=0; i < result.length ; i++){
          var opcion = "<option value='"+result[i]['id']+"'>" +result[i]['provincia']+ "</option>" ;
          $('#provincias').append(opcion);
        }  
        // llena select de edicion
        var opcionEdit  = "<option value='-1'>Seleccione provincia...</option>";       
        $('#provinciasEdit').append(opcionEdit);
        for(var i=0; i < result.length ; i++){
          var opcionEdit = "<option value='"+result[i]['id']+"'>" +result[i]['provincia']+ "</option>" ;
          $('#provinciasEdit').append(opcionEdit);
        }       
      },
      error: function(result){
        //alert(result);
        console.error("problemas al llenar los departamentos: " + result);
        WaitingClose();
      },
    });
  }  
  /* trae departamentos al seleccionar la provincia */
	$("#provincias").on("change", function() {
		id_provincia = $(this).val();
    //console.info( 'provincia: '+ id_provincia );
    $("#departamentos").removeAttr( "disabled" );
    traerDepartamentos( id_provincia );
  });
  
  /* Trae los departamentos de la provincia */
  function traerDepartamentos( id_provincia ) {  
  	WaitingOpen('Cargando Localidades');
  	$('#departamentos').empty();
    $.ajax({
      type: 'POST',
      data: {id_provincia},
      dataType: 'json',
      url: 'index.php/Deposito/getLocalidadPorId',
      success: function(result){        
        // para nuevo
        var opcion  = "<option value='-1'>Todos las Localidades...</option>";
        $('#departamentos').empty();
        $('#departamentos').append(opcion);
        for(var i=0; i < result.length ; i++)
        {
          var opcion = "<option value='"+result[i]['id']+"'>" +result[i]['localidad']+ "</option>" ;
          $('#departamentos').append(opcion);
        }

        // para edicion
        $('#departamentosEdit').empty();
        $('#departamentosEdit').append(opcionEd);
        for(var i=0; i < result.length ; i++)
        {
          var opcionEd = "<option value='"+result[i]['id']+"'>" +result[i]['localidad']+ "</option>" ;
          $('#departamentosEdit').append(opcionEd);
        }
        WaitingClose();
      },
      error: function(result){        
        console.error("problemas al llenar localidades: " + result);
        WaitingClose();
      },
    });
  }  
  // Datatables
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

<!-- Deposito Nuevo -->
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
        <div class="row"> 
          <div class="col-xs-12 col-sm-4">          
            <label for="provincias">Provincia:</label>
          </div>
          <div class="col-xs-12 col-sm-8">  
            <select class="form-control" id="provincias"></select>
          </div>
        </div><br>
        <div class="row">  
          <div class="col-xs-12 col-sm-4">          
            <label for="departamentos">Departamento:</label>
          </div> 
          <div class="col-xs-12 col-sm-8"> 
            <select class="form-control" id="departamentos" disabled="disabled"></select>
          </div>       
        </div><br>
        <div class="row"> 
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Punto GPS: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control"  id="gps" >
          </div>
        </div><br> 


        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" onclick="guardarDeposito()" >Guardar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal --><!-- Modal -->
</div>
<!-- / Deposito Nuevo -->

<!-- Editar deposito -->
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
          
          <div class="row">
            <div class="col-xs-12 col-sm-4">
               <label style="margin-top: 7px;">Descripcion <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-12 col-sm-8">
              <input type="text" class="form-control"  id="depositodescripE" value="" >
              <input type="hidden" class="form-control"  id="idDepo" value="" >
            </div>
          </div><br>
          <div class="row">
            <div class="col-xs-12 col-sm-4">
               <label style="margin-top: 7px;">Direccion <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-12 col-sm-8">
              <input type="text" class="form-control"  id="direccionE" value="" >
            </div>
          </div><br>
  
          <div class="row"> 
            <div class="col-xs-12 col-sm-4">          
              <label for="provinciasEdit">Provincia:</label>
            </div>
            <div class="col-xs-12 col-sm-8">  
              <select class="form-control" id="provinciasEdit"></select>
            </div>
          </div><br>
          <div class="row">  
            <div class="col-xs-12 col-sm-4">          
              <label for="departamentosEdit">Departamento:</label>
            </div> 
            <div class="col-xs-12 col-sm-8"> 
              <select class="form-control" id="departamentosEdit" disabled="disabled"></select>
            </div>       
          </div><br>
          <div class="row"> 
            <div class="col-xs-12 col-sm-4">
              <label style="margin-top: 7px;">Punto GPS: </label>
            </div>
            <div class="col-xs-12 col-sm-8">
              <input type="text" class="form-control"  id="gpsEdit" >
            </div>
          </div><br> 

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" onclick="editarDeposito()" >Guardar</button>
        </div> 
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!--/.modal Modal -->
<!-- / Editar deposito -->

<!-- Eliminiar -->
<div class="modal" id="modalEliminar">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Eliminar Deposito</h4>
      </div>
      <input type="hidden" class="form-control"  id="iddepoEd" value="" >
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
<!-- / Eliminiar -->


