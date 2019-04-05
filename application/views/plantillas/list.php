<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Plantillas Insumos</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="btnAgre" data-toggle="modal" data-target="#modalnueva">Nueva</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="insumoList" class="table table-bordered table-hover">
            <thead>
              <tr>                
                <!-- <th>Acciones</th> -->
                <th>Plantilla</th>
                <th>Descripción</th>                 
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($list as $a)
              {  
                echo '<tr>';                  
                  echo '<td>';
                    if (strpos($permission,'Del') !== false) {
                      echo '<i href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar asociación" data-toggle="modal" data-target="#modalaviso"></i>';
                    }
                    if (strpos($permission,'Edit') !== false) {
                      echo '<i href="#" class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar asociación" data-toggle="modal" data-target="#"></i>';
                    }       
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
//Trae Articulos y autocompleta campo
// $("#codigo").autocomplete({
//   source:function(request, response) {
//           $.ajax( {
//             url: "index.php/Plantillainsumo/getArticulo",
//             dataType: "json",
//             success: function(data) {
//               response(data);
//             }
//           });
//   },
//   //delay: 100,
//   minLength: 1,
//   focus: function(event, ui) {
//         // prevent autocomplete from updating the textbox
//         event.preventDefault();
//         // manually update the textbox
//         $(this).val(ui.item.label);
//   },
//   select: function(event, ui) {
//           // prevent autocomplete from updating the textbox
//           event.preventDefault();
//           // manually update the textbox and hidden field
//           $(this).val(ui.item.label);
//           $("#id_codigo").val(ui.item.value);
//           $("#descripcion_cod").val(ui.item.descripcion);
//   }
//   // change: function (event, ui) {
//   //         if (ui.item == null || ui.item == undefined) {
//   //             $("#id_codigo").val("");
//   //             $("#descripcion").val("");
//   //             alert("Articulo Inexistente");
//   //           // $("#artOrdInsum").attr("disabled", false);
//   //         } else {
//   //           // $("#artOrdInsum").attr("disabled", true);
//   //         }
//   // }
// });

function agregar(){
  ///alert('cllick');
  var artCodigo= $('#codigo').val();
  var descripcion = $('#descripcion_cod').val();
  var tabla = $('#tablainsumo');
  //agrego valores a la tabla
  $('#tablainsumo').DataTable().row.add( [
        "<i class ='fa fa-ban elirow text-primary' style='cursor:pointer'></i>",
        artCodigo,
        descripcion
      ]
    ).draw();
}
$(document).on("click",".elirow",function() {
    $('#tablainsumo').DataTable().row( $(this).closest('tr') ).remove().draw();
});

$('#tablainsumo').DataTable( {
  "createdRow": function ( row, data, index ) {            
    $('td', row).eq(1).addClass('ids');        
  }
});

// agregar
function guardar(){
  WaitingOpen('Guardando Plantila');
  var articulos = new Array();  
  var i = 0;
  var gruppo = $("#tablainsumo tbody tr td.ids");
  $("#tablainsumo tbody tr td.ids").each(function (index) {  
    var id = $(this).text();
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
        $('#insumoList').DataTable().row.add( [
          '<i href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar asociación" data-toggle="modal" data-target="#modalaviso"></i>'+
          '<i href="#" class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar asociación" data-toggle="modal" data-target="#"></i>',
          nom_plant,
          descripcion_plant
          ]
        ).draw();
        WaitingClose();
      },
      error: function(result){
        console.error("problemas al guardar plantilla: " + result);
        WaitingClose();
      },
	});
}

 
$('#insumoList').DataTable({
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

<!-- Modal Plantila nueva-->
<div class="modal" id="modalnueva" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span class="fa fa-plus-square text-light-blue"></span> Nueva Plantilla</h4>
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
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardar()">Guardar</button>
      </div>  <!-- /.modal footer -->

       </div>  <!-- /.modal-body -->
    </div> <!-- /.modal-content -->

  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->


<!-- Modal Aviso eliminar -->
<!-- <div class="modal" id="modalaviso">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><span class="fa fa-fw fa-times-circle text-light-blue"></span>Eliminar</h4>
      </div>
      <div class="modal-body">
        <h4>¿Desea eliminar Asociación?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminar()">Eliminar</button>
      </div>
    </div>
  </div>
</div> -->
<!-- / Modal -->

<!-- Modal Editar asociación -->
<!-- <div class="modal" id="modalEditar">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><span class="fa fa-fw fa-pencil text-light-blue"></span>Editar asociacion</h4>
      </div>
      
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12 col-md-6">
            <input type="hidden" name="idcomponenteequipo" id="idcomponenteequipo">
            <label for="codigo">Equipo: </label>
            <input type="text" name="equipo" id="equipo" class="form-control" disabled>
          </div>
          <div class="col-xs-12 col-md-6">
            <label>Descripción:</label>
            <textarea class="form-control" id="descrip" name="descrip" cols="18" rows="3" disabled></textarea>
          </div>
        </div><hr>
        <div class="row">
          <div class="col-xs-12 col-md-6">
            <label>Componente <strong style="color: #dd4b39">*</strong> :</label>
            <select id="componente" name="componente" class="form-control"></select>
          </div>
          <div class="col-xs-12 col-md-6">
            <label for="codigo">Código: </label>
            <input type="text" name="codigo" id="codigo" class="form-control">
          </div>
          <div class="col-xs-12 col-md-6">
            <label for="sistema">Sistema: </label>
            <select id="sistema" name="sistema" class="form-control"></select>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="editarAsoc()">Editar</button>
      </div>
    </div>
  </div>
</div> -->
<!-- / Modal -->
