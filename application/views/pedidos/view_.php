<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Artículos Pedidos</h3>         
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="adminsPedidos" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Seleccione</th>
                <th>ID</th>
                <th>Nº O. Trabajo</th>
                <th>Fecha Entrega</th>
                <th>Artículo</th>
                <th>Cantidad</th>
                <th>Proveedor</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              <?php
              //dump_exit($list);
                if(count($list) > 0) { 

                  $userdata = $this->session->userdata('user_data');
                  $usrId= $userdata[0]['usrId']; 
                  foreach($list as $a){
                    //if ($a['estado'] !='T' && $a['estado'] !='E'  && $a['estado'] !='TE') {
                    $id=$a['artId'];
                    $id_deta_nota = $a['id_detaNota'];

                    echo '<tr id="'.$id_deta_nota.'" class="'.$id.'">';
    	                echo '<td>';
                      echo '<input type="checkbox" class="seleccionado " name="seleccionado" style="margin-left: 15px; color: #3c8dbc">';
                      echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar Proveedor" data-toggle="modal" data-target="#modalProveedor"></i>';
    	                echo '</td>';
                      echo '<td class="hidden">'.$a['id_ordTrabajo'].'</td>';
                      echo '<td class="">'.$a['id_detaNota'].'</td>';
                      echo '<td >'.$a['nro'].'</td>';
    	                echo '<td >'.$a['fechaEntrega'].'</td>';
                      echo '<td >'.$a['artDescription'].'</td>';
                      echo '<td >'.$a['cantidad'].'</td>';
                      echo '<td >'.$a['provnombre'].'</td>';
                      echo '<td >'.($a['estado'] == 'C' ? '<small class="label pull-left bg-green">Curso</small>' : ($a['estado'] == 'P' ? '<small class="label pull-left bg-red">Pedido</small>' : ($a['estado'] == 'E' ? '<small class="label pull-left bg-green">Entregado</small>' : '<small class="label pull-left bg-blue">Terminado</small>'))).'</td>';
      	            echo '</tr>';                    
      		          //}
                  } //  fin foreach                  
                }
              ?>
            </tbody>
          </table>
          <br>

          <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
            <h4><i class="icon fa fa-ban"></i> Error!</h4>
            Revise que haya algún artículo seleccionado...
          </div>  

          <div class="pull-right">
            <button type="button" class="botones btn btn-primary" data-toggle="modal" data-target="#modaleliminar" onclick="javascript:tableToArray()">Guardar</button> 
          </div> 

        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<script>
  // Trae Proveedores y llena select
  $(function(){ 

    $.ajax({
      type: 'POST',
      url: 'index.php/Pedido/getProveedor', 
      success: function(data){               
        //alert(data);
        var opcion  = "<option value='-1'>Seleccione...</option>" ; 
        $('#proveedor').append(opcion); 
        for(var i=0; i < data.length ; i++){ 
          //var nombre = data[i]['codigo'];
          var opcion  = "<option value='"+data[i]['provid']+"'>" +data[i]['provnombre']+ "</option>" ; 
          $('#proveedor').append(opcion);                                   
        }
      },
      error: function(result){              
        console.log(result);
      },
      dataType: 'json'
    });
  });
 
  var arrayId = new Array(); // array con id art para guardar
  var hayError = true;

  //Arma arrary con id de articulos para enviar 
  function tableToArray(){ 
    $("#num_rem").val("");
    arrayId.length=0;     //limpio array antes de llenarlo
    $("input[name=seleccionado]:checked").each(function(i) {
      console.log( $(this) );
      var id = $(this).parents("tr").find("td").eq(2).html();
      arrayId.push(id);
      hayError = false;
    });
    console.log('ids seeleccionados: ');
    console.log(arrayId);
  }

  function setArtNotaPedido(){
    // tomo valor del remito desde input modalnum remito
    var num_remito = $("#num_rem").val();
    
    if(hayError == true){
      $('#error').fadeIn('slow');
      return;
    }else{
      $('#error').fadeOut('slow');
      $.ajax({    
        data:{ arrayId, num_remito },
        type: 'POST',             
        dataType: 'json',
        url: 'index.php/Pedido/setArtNotPedido',                
        success: function(result){                                                    
          WaitingClose("Guardado con Exito...");
          setTimeout("cargarView('Administracion', 'index', '"+$('#permission').val()+"');",0);
        },
        error: function(result){
          WaitingClose();                                                    
          alert("Error en guardado...");
        },
      });
    }
  }

  // Guarda el id de nota, deta nota y el id de articulo
  
  $(".fa-pencil").on("click",function(){
    var id_art = $(this).parent('td').parent('tr').attr('class');
    id_art = parseInt(id_art);
    console.log("id articulo: ");
    console.log(id_art);
    
    var id_deta = $(this).parent('td').parent('tr').attr('id');
    id_deta = parseInt(id_deta);
    console.log("id deta: ");
    console.log(id_deta);
      // Mando Id de articulo e Id de detanota al modal
    $("#idArt").val(id_art);
    $("#idDeta").val(id_deta); 

    var ideNota = $(this).parents("tr").find("td").eq(1).html();
    ideNota = parseInt(ideNota);
    $("#idNota").val(ideNota);
    console.log("id Orden trabajo: ");
    console.log(ideNota);
  });

  var ideNota = "";
  // cambia el proveedor por el nuevo
  function setProveedor(){
    WaitingOpen('Guardando cambios...');
    var id_proveedor = $("#proveedor").val(); //parametro
    var id_articulo =$("#idArt").val();  // parametro
    var id_detanota = $("#idDeta").val();  //parametro
    ideNota = $("#idNota").val();  // id de nota para 
    
    $.ajax({   
      data:{ id_articulo, id_proveedor, id_detanota},
      type: 'POST',             
      dataType: 'json',
      url: 'index.php/Pedido/setNuevoProveedor',                
      success: function(result){ 
        //$("#modalProveedor").modal('hide');
        WaitingClose();
        $('#content').empty();
        $("#content").load("<?php echo base_url(); ?>index.php/Pedido/ArtListPorIdNota/<?php echo $permission; ?>/"+ideNota+"");
      },
      error: function(result){
        WaitingClose();                                                    
        alert("Error en guardado...");
      },
    });
  }

  $('input').iCheck({
    checkboxClass: 'icheckbox_minimal-blue',
  });
</script>

<!-- Modal mostrar pedido-->
<div class="modal fade" id="modallista" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-truck text-light-blue"></span> Lista de Orden de Pedido</h4>
       </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <form id="tblremito">
              <div class="form-group">
                <label for="numremito">Ingrese el Nº de Remito</label>
                <input type="text" class="form-control" id="numremito" placeholder="Numero remito...">
              </div>
              <div id="texto" style="display:none">Algun input está checkeado</div>
              <br><br>
              <table class="table table-bordered table-hover" id="tabladetalle">
                <thead>
                  <tr>   
                    <th>Id Orden</th>                                 
                    <th>Id Orden</th>
                    <th>Nota Pedido</th>
                    <th>Artículo</th>
                    <th>Cantidad</th>
                    <th>Fecha</th>
                    <th>F. Entrega</th>
                    <th>F. Entregado</th>
                    <th>Proveedor</th>                  
                    <th>Estado</th>
                  </tr>
                </thead>
                <tbody>              
                </tbody>
              </table>
            </form>    
          </div>
        </div>  
      </div>  <!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <!-- <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnSave" onclick="setArtNotaPedido()">Guardar</button> -->
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnSave" onclick="tableToArray()">Guardar</button>
      </div>

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Editar Proveedor -->
<div class="modal fade" id="modalProveedor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-exclamation-triangle text-light-blue"> </span> Actualizar Proveedor</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">               
        <h4 id="mensaje">Desea cambiar el Proveedor?</h4><br>            
        <select id="proveedor" class="form-control" />                                             
      </div>  <!-- /.modal-body -->
      
      <!-- <div>
        <input type="" id="idArt">
        <input type="" id="idDeta">
      </div> -->
      <input type="hidden" id="idNota">

      <div class="modal-footer">         
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave" data-dismiss="modal" onclick="setProveedor()" >Cambiar</button>
      </div>  <!-- /.modal footer --> 

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal Editar Proveedor -->

<!-- Modal Warning Actualizar -->
<div class="modal fade" id="modaleliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-exclamation-triangle text-light-blue"> </span> ACTUALIZAR ARTICULOS</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">               
          <h4 id="mensaje">Desea actualizar estos artículos como recibidos?</h4><br>
          <label for="num_rem">Ingrese Nº Remito</label> <strong style="color: #dd4b39">* </strong>:
          <input type="text" class="num_rem form-control" id="num_rem" value="" placeholder="">
      </div>  <!-- /.modal-body -->
       
      <div class="modal-footer">         
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave" data-dismiss="modal" onclick="setArtNotaPedido()" >Actualizar</button>
      </div>  <!-- /.modal footer --> 

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal Warning -->

<!-- Modal Error -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" id="modalerror" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-times-circle text-light-blue"></span> ERROR</h4>
        </div> <!-- /.modal-header  -->

        <div class="modal-body" id="modalBodyArticle">               
          <h4 id="mensaje" style="color: #dd4b39;">Algun artículo debe estar seleccionado...</h4>
        </div>  <!-- /.modal-body -->

        <div class="modal-footer">         
          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">No</button> -->
          <button type="button" class="btn btn-primary" id="btnSave" data-dismiss="modal">Aceptar</button>
        </div>  <!-- /.modal footer -->

    </div>
  </div>
</div>
<!-- / Modal Error -->