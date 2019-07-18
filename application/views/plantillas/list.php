<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Plantillas Insumos</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="btnAgre">Nueva</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="insumoList" class="table table-bordered table-hover">
            <thead>
              <tr>                
                <th>Acciones</th> 
                <th>Nombre Plantilla</th>
                <th>Descripción</th>                 
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($list as $a)
              {  
                $id = $a['plant_id'];                      
                echo '<tr id="'.$id.'" >';
                //echo '<tr>';                  
                  echo '<td>';
                    if (strpos($permission,'Del') !== false) {
                      echo '<i href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar asociación" ></i>';
                    }
                    if (strpos($permission,'Edit') !== false) {
                      echo '<i href="#" class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar asociación"></i>';
                    } 
                    
                    echo '<i class="fa fa-fw fa-search text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Ver Plantilla"></i>';
                  echo '</td>';                         
                  echo '<td>'.$a['plant_nombre'].'</td>';
                  echo '<td>'.$a['descripcion'].'</td>';                 
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

/**** NUEVA  */
  //Trae Articulos y autocompleta campo
  $("#codigo").autocomplete({
    source:function(request, response) {
            $.ajax( {
              url: "index.php/Plantillainsumo/getArticulo",
              dataType: "json",
              success: function(data) {
                response(data);
              }
            });
    },
    //delay: 100,
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
            $("#id_codigo").val(ui.item.value);
            $("#descripcion_cod").val(ui.item.descripcion);
    }
   
  });

  $('#btnAgre').click(function() {
    $('.fa-plus-square span').remove();
    $('.fa-plus-square').append('<span class="modal-title" style="color:#000;"> Nueva Plantilla</span>'); 
    $('#modalnueva').modal('show');
  });
  // Agregar a tabla nueva plantilla
  function agregar(){
  
    var artCodigo= $('#codigo').val();
    var descripcion = $('#descripcion_cod').val();
    var tabla = $('#tablainsumo');
    var id_codigo = $("#id_codigo").val();
    //agrego valores a la tabla
    $('#tablainsumo').DataTable().row.add( [
          "<i class ='fa fa-ban elirow text-primary' style='cursor:pointer'></i>",
          artCodigo,
          descripcion
        ]
      ).node().id = id_codigo;
      $('#tablainsumo').DataTable().draw();
  }

  $(document).on("click",".elirow",function() {
      $('#tablainsumo').DataTable().row( $(this).closest('tr') ).remove().draw();
  });

  // agregar
  function guardar(){
   
    var error = false;
    if($('#nom_plant').val() == ""){
      error = true;
    }
    if($('#descripcion_plant').val() == ""){
      error = true;
    }  
    if( ! $('#tablainsumo').DataTable().data().any() ) {
      console.info("tabla insumos (artículos) vacía");
      error = true;
    }
    if (error == true) {
      alert('Existen campos sin llenar...');
      return;
    }   

    WaitingOpen('Guardando Plantila');

    var articulos = new Array();  
    var i = 0; 
    $("#tablainsumo tbody tr").each(function (index) {  
      var id = $(this).attr("id");
      articulos[i] = id;    
      i++;    
    });
    var descripcion_plant = $("#descripcion_plant").val();
    var nom_plant = $("#nom_plant").val();
    $.ajax({
        data: {articulos:articulos,
              descripcion_plant:descripcion_plant,
              nom_plant:nom_plant
              },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Plantillainsumo/setPlantilla',
        success: function(data){
          
          //agrego valores a la tabla
          // $('#insumoList').DataTable().row.add( [
          //   '<i href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar asociación" data-toggle="modal" data-target="#modalaviso"></i>'+
          //   '<i href="#" class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar asociación" data-toggle="modal" data-target="#"></i>',
          //   nom_plant,
          //   descripcion_plant
          //   ]
          // ).draw();
          regresa();
          WaitingClose();
        },
        error: function(result){
          console.error("problemas al guardar plantilla: " + result);
          WaitingClose();
        },
    });
  }

  $('#modalnueva').on('shown.bs.modal', function (e) {
    // recalcula el ancho de las columnas
    $( $.fn.dataTable.tables( true ) ).DataTable().columns.adjust();
  })

/**** / NUEVA  */

/**** EDICION  */
  // Edicion
  $('.fa-pencil').click(function() {
    $('.fa-plus-square span').remove();
    $('.fa-plus-square').append('<span class="modal-title" style="color:#000;"> Editar Plantilla</span>');
    $('.oculta').show();
    $('#nom_plantEditar').removeAttr( 'disabled' );
    $('#descripcion_plantEditar').removeAttr( 'disabled' );
    $("#modalEditar").modal('show');
    var idPlantilla = $(this).parent('td').parent('tr').attr('id');
    llenamodal(idPlantilla, 'edit');
  });

  function llenamodal(idPlantilla, modo){
    
    $.ajax({
      data: { idPlantilla: idPlantilla },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Plantillainsumo/getDetaPlantilla',
      success: function(result){                         
        console.table(result);
        $('#descripcion_plantEditar').val(result[0]['descripcion']); 
        $('#nom_plantEditar').val(result[0]['plant_nombre']);
        var artId = '';
        var artDescripcion = '';
        $('#tablainsumoEdit').DataTable().clear().draw();
        
        if(modo == 'edit'){
          
          $('#idPlantilla').val(idPlantilla);

          for(i = 0; i < result.length; i++) {

            artId = result[i]['artId'];        
            artDescripcion = result[i]['artDescription'];       
            $('#tablainsumoEdit').DataTable().row.add( [
              '<i class ="fa fa-ban elirowEdit text-primary" style="cursor:pointer"></i>',
              artId,
              artDescripcion,
              ]       
            ).node().id = artId;
            $('#tablainsumoEdit').DataTable().draw();
            
          }
        }else{

          for(i = 0; i < result.length; i++) {

            artId = result[i]['artId'];        
            artDescripcion = result[i]['artDescription'];       
            $('#tablainsumoEdit').DataTable().row.add( [
              '<i class ="fa fa-ban text-primary" style="cursor:not-allowed"></i>',
              artId,
              artDescripcion,
              ]       
            ).draw();
          }
        }
          
      },
      error: function(result){            
        console.error(result);
      },
    });
  }
  //Trae Articulos y autocompleta campo
  $("#codigoEditar").autocomplete({
    source:function(request, response) {
            $.ajax( {
              url: "index.php/Plantillainsumo/getArticulo",
              dataType: "json",
              success: function(data) {
                response(data);
              }
            });
    },
    //delay: 100,
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
            $("#id_codigoEditar").val(ui.item.value);
            $("#descripcion_codEditar").val(ui.item.descripcion);
    }
    
  });
  // Agregar a tabla Edicion plantilla
  function agregarEditar(){
    

    var artCodigo= $('#codigoEditar').val();
    var descripcion = $('#descripcion_codEditar').val();
    var id_codigo = $("#id_codigoEditar").val();
    //agrego valores a la tabla
    $('#tablainsumoEdit').DataTable().row.add( [
          "<i class ='fa fa-ban elirow text-primary' style='cursor:pointer'></i>",
          artCodigo,
          descripcion
        ]
    ).node().id = id_codigo;
    $('#tablainsumoEdit').DataTable().draw();
  }

  $(document).on("click",".elirowEdit",function() {
      $('#tablainsumoEdit').DataTable().row( $(this).closest('tr') ).remove().draw();
  });

  function guardarEdicion(){
    

    var error = false;
    if($('#nom_plantEditar').val() == ""){
      error = true;
    }
    if($('#descripcion_plantEditar').val() == ""){
      error = true;
    }  
    if( ! $('#tablainsumoEdit').DataTable().data().any() ) {
      console.info("tabla Editar insumos (artículos) vacía");
      error = true;
    }
    if (error == true) {
      alert('Existen campos vacios...');
      return;
    }   

    WaitingOpen('Guardando Plantila');

    var articulos = new Array();  
    var i = 0; 
    $("#tablainsumoEdit tbody tr").each(function (index) {  
      var id = $(this).attr("id");
      articulos[i] = id;    
      i++;    
    });
    var descripcion_plant = $("#descripcion_plantEditar").val();
    var nom_plant = $("#nom_plantEditar").val();
    var idPlantilla = $('#idPlantilla').val();
    $.ajax({
        data: {articulos:articulos,
              descripcion_plant:descripcion_plant,
              nom_plant:nom_plant,
              idPlantilla:idPlantilla
              },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Plantillainsumo/setEdicion',
        success: function(data){
          WaitingClose();
          regresa();
        },
        error: function(result){
          console.error("problemas al guardar plantilla: " + result);
          WaitingClose();
        },
    });
  }

/**** / EDICION  */


/**** VISTA  */

  $('.fa-search').click(function() {
    $('.fa-plus-square span').remove();
    $('.fa-plus-square').append('<span class="modal-title" style="color:#000;"> Ver Plantilla</span>');  
    $('#nom_plantEditar').attr('disabled', 'disabled');
    $('#descripcion_plantEditar').attr('disabled', 'disabled');
    $('.oculta').hide();
    $("#modalEditar").modal('show');
    var idPlantilla = $(this).parent('td').parent('tr').attr('id');
    llenamodal(idPlantilla, 'ver');   
  });

/**** / VISTA  */

/**** ELIMINAR  */

  $('.fa-times-circle').click(function() {
    
    var idPlantilla = $(this).parent('td').parent('tr').attr('id');
    $('#idPlantElim').val(idPlantilla);
    $("#modalaviso").modal('show');
  });

  function eliminar(){
  
    var idPlantilla = $('#idPlantElim').val();
   
    $.ajax({
          data: {idPlantilla:idPlantilla},
          dataType: 'json',
          type: 'POST',
          url: 'index.php/Plantillainsumo/deletePlantilla',
          success: function(data){         
            regresa();
          },
          error: function(result){
            console.error("problemas al guardar plantilla: " + result);
            WaitingClose();
          },
      });
  }


/**** / ELIMINAR  */


// Recarga pagina
function regresa(){
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Plantillainsumo/index/<?php echo $permission; ?>");
  WaitingClose();
}

$('#insumoList').DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "ordering": true,
    "info": true,
    "autoWidth": true,
    "language": {
      "lengthMenu": "Ver _MENU_ filas por página",
      "zeroRecords": "No hay registros",
      "info": "Mostrando página _PAGE_ de _PAGES_",
      "infoEmpty": "No hay registros disponibles",
      "infoFiltered": "(filtrando de un total de _MAX_ registros)",
      "sSearch": "Buscar:  ",
      "oPaginate": {
        "sNext": "Sig.",
        "sPrevious": "Ant."
      }
    }
  });

$('#tablainsumo').DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "ordering": true,
    "info": true,
    "autoWidth": true,
    "language": {
      "lengthMenu": "Ver _MENU_ filas por página",
      "zeroRecords": "No hay registros",
      "info": "Mostrando página _PAGE_ de _PAGES_",
      "infoEmpty": "No hay registros disponibles",
      "infoFiltered": "(filtrando de un total de _MAX_ registros)",
      "sSearch": "Buscar:  ",
      "oPaginate": {
        "sNext": "Sig.",
        "sPrevious": "Ant."
      }
    }
  });



</script>

<!-- Modal Plantila nueva -->
<div class="modal" id="modalnueva" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span class="fa fa-plus-square text-light-blue"></span></h4>
       </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">        
 
          <div class="row">
            <br>
            <div class="col-xs-12 col-sm-6">
              <label for="">Nombre Plantilla<strong style="color: #dd4b39">*</strong> :</label>
              <input type="text" id="nom_plant" class="form-control" placeholder="Ingrese nombre...">  
            </div>
            <div class="col-xs-12 col-sm-6">
              <label for="">Descripcion<strong style="color: #dd4b39">*</strong> :</label>
              <input type="text" id="descripcion_plant" class="form-control" placeholder="Ingrese nombre...">  
            </div>
            
            <div class="col-xs-12 col-sm-6 col-md-4">
              <label for="">Codigo Artículo<strong style="color: #dd4b39">*</strong> :</label>             
              <input type="text" id="codigo" name="codigo" placeholder="Buscar código..." class="form-control">
              <input type="hidden" id="id_codigo" name="id_codigo">
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4">
              <label for="">Descripción Artículo<strong style="color: #dd4b39">*</strong> :</label>
              <input type="text" id="descripcion_cod" name="descripcion" class="form-control">  
            </div>            

            <div class="col-xs-12 col-sm-6 col-md-4">
              <br>
              <button type="button" class="btn btn-primary" id="agregar" onclick="agregar()"><i class="fa fa-check" >Agregar</i></button>
            </div>
            </div><br>

            <div class="row">
              <div class="col-xs-12">
                <table class="table table-bordered" id="tablainsumo"> 
                  <thead>
                    <tr>  
                      <th>Acción</th>
                      <th>Código Artículo</th>
                      <th>Descripcion</th>   
                    </tr>
                  </thead>
                  <tbody></tbody>
                </table>  
              </div>
            </div>      

          </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardar('nueva')">Guardar</button>
      </div>  <!-- /.modal footer -->

       </div>  <!-- /.modal-body -->
    </div> <!-- /.modal-content -->

  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Editar Plantilla y Ver-->
<div class="modal" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span class="fa fa-plus-square text-light-blue"></span> </h4>
       </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">        
 
          <div class="row">
            <br>
            <div class="col-xs-12 col-sm-6">
              <label for="">Nombre Plantilla<strong style="color: #dd4b39">*</strong> :</label>
              <input type="text" id="nom_plantEditar" class="form-control" placeholder="Ingrese nombre...">
              <input type="hidden" id="idPlantilla">  
            </div>
            <div class="col-xs-12 col-sm-6">
              <label for="">Descripcion<strong style="color: #dd4b39">*</strong> :</label>
              <input type="text" id="descripcion_plantEditar" class="form-control" placeholder="Ingrese nombre...">  
            </div>
            
            <div class="col-xs-12 col-sm-6 col-md-4 oculta">
              <label for="">Codigo Artículo<strong style="color: #dd4b39">*</strong> :</label>             
              <input type="text" id="codigoEditar" name="codigoEditar" placeholder="Buscar código..." class="form-control">
              <input type="hidden" id="id_codigoEditar" name="id_codigoEditar">
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4 oculta">
              <label for="">Descripción Artículo<strong style="color: #dd4b39">*</strong> :</label>
              <input type="text" id="descripcion_codEditar" name="descripcion_codEditar" class="form-control">  
            </div>            

            <div class="col-xs-12 col-sm-6 col-md-4 oculta">
              <br>
              <button type="button" class="btn btn-primary" id="agregar" onclick="agregarEditar()"><i class="fa fa-check" >Agregar</i></button>
            </div>
            </div><br>

            <div class="row">
              <div class="col-xs-12">
                <table class="table table-bordered" id="tablainsumoEdit"> 
                  <thead>
                    <tr>  
                      <th>Acción</th>
                      <th>Código Artículo</th>
                      <th>Descripcion</th>   
                    </tr>
                  </thead>
                  <tbody></tbody>
                </table>  
              </div>
            </div>      

          </div>

      <div class="modal-footer oculta">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardarEdicion()">Guardar</button>
      </div>  <!-- /.modal footer -->

       </div>  <!-- /.modal-body -->
    </div> <!-- /.modal-content -->

  </div>  <!-- /.modal-dialog modal-lg -->
</div>  
<!-- / Modal -->

<!-- Modal Aviso eliminar -->
<div class="modal" id="modalaviso" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><span class="fa fa-fw fa-times-circle text-light-blue"></span>Eliminar</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="idPlantElim">
        <h4>¿Desea eliminar esta planitilla?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminar()">Eliminar</button>
      </div>
    </div>
  </div>
</div> 
<!-- / Modal -->

