<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Asociar Componentes a Equipo</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="btnAgre">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="comp" class="table table-bordered table-hover">
            <thead>
              <tr>                
                <th>Acciones</th>
                <th>Código Componente</th> 
                <th>Descripción Componente</th>   
                <th>Adjunto Componente</th>
                <th>Código Equipo</th>
                <th>Descripción Equipo</th>
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($list as $a)
              {
                //dump($a);
                $idc = 0;
                if ($a['estado'] !=='AN'){
                  $ideq   = $a['id_equipo'];
                  $idcom  = $a['id_componente'];
                  $idcome = $a['idcomponenteequipo'];
                  echo '<tr id="'.$ideq.'" class="'.$idcom.'" data-equipo="'.$ideq.'" data-componente="'.$idcom.'" data-componenteequipo="'.$idcome.'">';
                  echo '<td>';
                  if (strpos($permission,'Del') !== false) {
                    echo '<i href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar asociación" data-toggle="modal" data-target="#modalaviso"></i>';
                  }
                  if (strpos($permission,'Edit') !== false) {
                    echo '<i href="#" class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar asociación" data-toggle="modal" data-target="#"></i>';
                  }
                  echo '</td>';
                  '<input type="hidden" id="id_equipo" name="id_equipo">';
                  echo '<td id="'.$idc.'">'.$a['codcomponente'].'</td>';
                  echo '<td>'.$a['descomp'].'</td>';
                  $url = base_url().'assets/files/equipos/'.$a['pdf'];
                  echo '<td><a href="'.$url.'" target="_blank">'.basename($a['pdf']).'</td>';
                  echo '<td>'.$a['codigo'].'</td>';
                  echo '<td>'.$a['descripcion'].'</td>';
                  $idc++;
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

<script>
var isOpenWindow = false;
var comglob      = "";
var datos        = "";
var idequipo     = "";

//$(document).ready(function(event) {

  edit  = 0;  
  datos = Array();

  $('#btnAgre').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Componente/cargarcomp/<?php echo $permission; ?>");
    WaitingClose();
  });  
 
  //Toma id de equipo y de componente - Listo
  $(".fa-times-circle").click(function (e) {  
    console.log("ESTOY ELIMINANDO"); 
    var ide    = $(this).parent('td').parent('tr').attr('id');
    idequipo   = ide;
    console.log("El id de equipo es:");
    console.log(idequipo);
    var idcomp = $(this).parent('td').parent('tr').attr('class');
    console.log(idcomp);
    datos      = parseInt(idcomp);
    console.log("El id de datos es:");
    console.log(datos);
  });    

  // Trae datos para llenar el modal editar
  $('.fa-pencil').click(function(e){
    var idCompEq = $(this).parent('td').parent('tr').data('componenteequipo');
    console.log("ID de componenteequipo es: "+idCompEq);
    $('#modalEditar').modal('show');
    $.ajax({
      data: { idCompEq:idCompEq },
      dataType: 'json',
      type: 'POST',
      url:  'index.php/Componente/getEditar',
      success: function(data){
        traer_marca();
        //console.table(data);
        $('#idcomponenteequipo').val(idCompEq);
        $('#id_equipo').val(data['id_equipo']);
        $('#equipo').val(data['codigoEq']);
        $('#descrip').val(data['descripcion']);
        llenarComponentes(data['id_equipo'], data['id_componente']);
        $('#codigo').val(data['codigo']);
      },
      error: function(result){
        console.error("Error al traer datos para editar");
        console.table(result);
      },
    });
  });

  // Llena los datos del modal editar
  function llenarComponentes(idEquipo, idComponente) { // Ok
    $.ajax({
      //data: { idequipo:idEquipo },
      dataType: 'json',
      type: 'POST',
      //url:  'index.php/Componente/getcompo',
      url:  'index.php/Componente/getcomponente',
      success: function(data){
        //console.table(data);
        $('#componente').empty();
        for(var i=0; i < data.length ; i++) {
          var nombre = data[i]['descripcion'];
          var selected = (idComponente == data[i]['id_componente']) ? 'selected' : '';
          var opcion  = "<option value='"+data[i]['id_componente']+"' " +selected+ ">" +nombre+ "</option>" ; 
          $('#componente').append(opcion); 
        }
      },
      error: function(result){
        console.error("Error al traer componentes de equipos.");
        console.table(result);
      },
    });
  }

  // Editar asociacion de componente a equipo - 
  function editarAsoc(){
    var idcomponenteequipo = $('#idcomponenteequipo').val();
    var id_equipo          = $('#id_equipo').val();
    var id_componente      = $('#componente').val();
    var codigo             = $('#codigo').val();

    var parametros = {
      'id_equipo'          : id_equipo,
      'id_componente'      : id_componente,
      'codigo'             : codigo,
    };
    console.log(parametros);
    $.ajax({
      type: 'POST',
      data: {data:parametros, idCompEq: idcomponenteequipo},
      url: 'index.php/Componente/editarCompEq',
      success: function(data){
        $('#modalEditar').modal('hide');
        $('#content').empty();
        $("#content").load("<?php echo base_url(); ?>index.php/Componente/asigna/<?php echo $permission; ?>");                    
      },
      error: function(result){
        console.error("Error al editar Asociación componente equipo");
        console.table(result);
      }
      //dataType: 'json'
    });
  }


  // Datatable
  $('#comp').DataTable({
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

//});

// Carga list componentes
function cargarVista(){
  //$('#content').empty();
  //$('#modalaviso').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Componente/asigna/<?php echo $permission; ?>");
  //WaitingClose();
}

function cerro(){
  isOpenWindow = false;
}

// Elimina asociacion de Equipo/componente Chequeado
function eliminar(){
  //var idpre = $(this).parent('td').parent('tr').attr('id');
  console.log("Estoy por la opcion SI a eliminar")
  console.log(idequipo);
  console.log(datos);
  $.ajax({
    data: { idequipo: idequipo,datos: datos},
    //dataType: 'json'
    type: 'POST',
    url: 'index.php/Componente/baja_comp', //index.php/
    success: function(data){  
      cargarVista();
    },
    error: function(result){                
      console.log(result);
    }
  });
}



// Guarda un componente nuevo - chequeado
function guardarcompo(){ 
  var descripcion = $('#descrip1').val();
  var id_equipo   = $('#equipo').val(); 
  var informacion = $('#informacion').val();
  var marcaid     = $('#ma').val();
  var pdf         = $('#input-4').val();
  var parametros  = {
    'descripcion': descripcion,
    'informacion': informacion,
    'marcaid': marcaid,
    'id_equipo': id_equipo,
    'pdf': pdf,
  };                                              
  //console.log(parametros);
  var hayError = false; 
  if( id_equipo>0 && marcaid >0){                                     
    $.ajax({
      type:"POST",
      url: "index.php/Componente/agregar_componente", 
      data:{parametros:parametros},
      success: function(data){
        //console.log("exito");
        var datos= parseInt(data);
        //console.log(datos);
          if(data > 0) //Agrego la descripcion dinamicamte en el select con id componente
          {  
            var texto = '<option value="'+data+'">'+ parametros.descripcion +'</option>';
            //console.log(texto);
            $('#componente').append(texto);
          }  
        },
      error: function(result){
          console.log("entro por el error");
          console.log(result);
      },
       dataType: 'json'
    });
  }
  else 
  { 
    alert("Los campos obligatorios deben estar completos: EQUIPO, COMPONENTE Y MARCA deben estar");
  }
}

// Trae marcas para modal agregar componente - Chequeado
function traer_marca(){
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Componente/getmarca', 
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#ma').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['marcadescrip'];
        var opcion  = "<option value='"+data[i]['marcaid']+"'>" +nombre+ "</option>" ; 
        $('#ma').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
}
</script>

<!-- Modal Aviso eliminar -->
<div class="modal" id="modalaviso">
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
</div>
<!-- / Modal -->

<!-- Modal Editar asociación -->
<div class="modal" id="modalEditar">
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
            <br>
            <label>Descripción:</label>
            <textarea class="form-control" id="descrip" name="descrip" cols="18" rows="3" disabled></textarea>
          </div>

          <div class="col-xs-12 col-md-6"><label>Componente <strong style="color: #dd4b39">*</strong> :</label>
            <select id="componente" name="componente" class="form-control"></select>
            <br>
            <label for="codigo">Código: </label>
            <input type="text" name="codigo" id="codigo" class="form-control">
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="editarAsoc()">Editar</button>
      </div>
    </div>
  </div>
</div>
<!-- / Modal -->

<!-- Modal Agregar componente-->
<div class="modal" id="modalOrder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span class="fa fa-plus-square text-light-blue"></span> Agregar Componente</h4>
       </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >

          <div class="alert alert-danger alert-dismissable" id="error1" style="display: none">
            <h4><i class="icon fa fa-ban"></i> Error!</h4>
            Revise que todos los campos esten completos...                  
          </div>
          <div class="col-xs-12 col-sm-6">
            <label>Marca <strong style="color: #dd4b39">*</strong>: </label>
            <select class="form-control input-md" id="ma" name="ma" />
          </div>
          <div class="col-xs-12 col-sm-6">
            <label>Descripción <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text"   class="form-control input-md" id="descrip1"  name="descrip1" placeholder="Ingrese Descripcion" />
          </div>
          <div class="col-xs-12"><label>Información:</label>
            <textarea class="form-control" id="informacion" name="informacion" placeholder="Ingrese Informacion Adicional"></textarea>
          </div>
          <div class="col-xs-12">
            <label><span class="fa fa-file-pdf-o"></span> Adjuntar</label>
            <input id="input-4" name="input4[]" type="file"  class="form-control input-md">
          </div>

        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardarcompo()">Guardar</button>
      </div>  <!-- /.modal footer -->

       </div>  <!-- /.modal-body -->
    </div> <!-- /.modal-content -->

  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->