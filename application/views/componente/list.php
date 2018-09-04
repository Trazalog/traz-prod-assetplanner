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
                <th>Equipo</th>
                <th>Descripción</th>
                <th>Componente</th>   
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($list as $a)
              {
                // var_dump($a['estado']);
                $idc = 0;
                if ($a['estado'] !=='AN'){
                  $id    = $a['id_equipo'];
                  $idcom = $a['id_componente'];
                  echo '<tr id="'.$id.'" class="'.$idcom.'">';
                  echo '<td>';
                  if (strpos($permission,'Del') !== false) {
                    echo '<i href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar asociacion" data-toggle="modal" data-target="#modalaviso"></i>';
                  }
                  echo '</td>';
                  '<input type="hidden" id="id_equipo" name="id_equipo">';
                  echo '<td>'.$a['codigo'].'</td>';
                  echo '<td>'.$a['descripcion'].'</td>';
                  echo '<td id="'.$idc.'">'.$a['descomp'].'</td>';
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

$(document).ready(function(event) {

  edit=0;  datos=Array(); 
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

});

// Carga list componentes
function cargarVista(){
  //$('#content').empty();
  //$('#modalaviso').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Componente/index/<?php echo $permission; ?>");
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

</script>
<div class="modal fade" id="modalaviso">
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
