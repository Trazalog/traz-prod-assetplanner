<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Parámetro</h3>
          <?php
            if (strpos($permission,'Add') !== false) {
              echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modaltarea" id="btnAdd">Agregar</button>';
            }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="deposito" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Descripción</th>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach($list as $z)
                {
                  $id=$z['paramId'];
                    echo '<tr id="'.$id.'" class="'.$id.'" >';
                    echo '<td>';
                  if (strpos($permission,'Edit') !== false) {
                      echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar" data-toggle="modal" data-target="#modaleditar"></i>';
                  }
                  if (strpos($permission,'Del') !== false) {
                      echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;"></i>';
                  }
                  echo '</td>';
                  echo '<td>'.$z['paramdescrip'].'</td>';
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
var ed="";
$(document).ready(function(event) {

   //Editar
  $(".fa-pencil").click(function (e) { 
    var id_pa = $(this).parent('td').parent('tr').attr('id');
    console.log("ID de tarea");
    console.log(id_pa);
    ed=id_pa;
    $.ajax({
      type: 'GET',
      data: { id_pa:id_pa},
      url: 'index.php/Altparametro/getpencil', //index.php/
      success: function(data){
        console.log("Estoy editando");           
        console.log(data);
        datos={
          'descripcion':data[0]['paramdescrip'],
        }
        completarEdit(datos);
      },
      error: function(result){
        console.log(result);
      },
      dataType: 'json'
    });
  });

  //Cambio de estado a un equipo
  $(".fa-times-circle").click(function (e) { 
    console.log("Esto eliminando"); 
    var idpa = $(this).parent('td').parent('tr').attr('id');
    console.log(idpa);
    
    $.ajax({
      type: 'POST',
      data: { idpa: idpa},
      url: 'index.php/Altparametro/baja_parametro', //index.php/
      success: function(data){
        //var data = jQuery.parseJSON( data );
        console.log(data);
        //$(tr).remove();
        alert("PARAMETRO Eliminado");
        regresa();
      },
      error: function(result){
        console.log(result);
      },
      dataType: 'json'
    });
  });

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
 

function completarEdit(datos){
  console.log("datos que llegaron");
  $('#descripcionedit').val(datos['descripcion']);
}
  
function guardareditar(){
  console.log("Estoy editando");
  console.log("El id de tarea es:"); 
  console.log(ed);
    
  var descripcion = $('#descripcionedit').val();
  var parametros  = {
    'paramdescrip': descripcion
  };                                              
  console.log(parametros);
  var hayError = false; 

  if( parametros !=0)
  {                                     
    $.ajax({
      type:"POST",
      url: "index.php/Altparametro/edit_param", //controlador /metodo
      data:{parametros:parametros, ed:ed},
      success: function(data){
        console.log("exito ");
        regresa();     
        },
      error: function(result){
          console.log("entro por el error");
          console.log(result);
      },
      // dataType: 'json'
    });
  }
  else 
  { 
    alert("Por favor complete la descripcion del grupo, es un campo obligatorio");
  }
}

function guardar(){
  console.log("Estoy guardando");
  var descripcion = $('#descripcion').val();
  var parametros = {
    'paramdescrip': descripcion    
  };                                              
  console.log(parametros);
  var hayError = false; 

  if( parametros !="")
  {                                     
    $.ajax({
      type:"POST",
      url: "index.php/Altparametro/agregar_parametro", //controlador /metodo
      data:{parametros:parametros},
      success: function(data){
        console.log("exito ");
        regresa();
      },
      error: function(result){
          console.log("entro por el error");
          console.log(result);
      },
      // dataType: 'json'
    });
  }
  else 
  { 
    alert("Por favor complete toda la informacion para poder guardar");
  }
}

function regresa(){
  //WaitingOpen();
  //$('#modaldeposito').empty();
  //$('#modaleditar').empty(); 
  //$('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Altparametro/index/<?php echo $permission; ?>");
   WaitingClose();
}
</script>


<!-- Modal alta de Tarea-->
 <div class="modal fade" id="modaltarea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Parametro</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <div class="form-group">
              <label for="descripcion">Descripcion:</label>
              <input type="text" id="descripcion" name="descripcion" class="form-control" placeholder="Ingrese Descripcion de Parametro...">
            </div>                   
          </div>
        </div>
      </div><!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave" data-dismiss="modal" onclick="guardar()" >Guardar</button>
      </div>  <!-- /.modal footer -->

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->


<!-- Modal editar-->
 <div class="modal fade" id="modaleditar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-pencil text-light-blue"></span> Editar Tarea</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <div class="form-group">
              <label for="descripcionedit">Descripcion:</label>
              <input type="text" id="descripcionedit" name="descripcionedit" class="form-control" placeholder="Ingrese Descripcion de desposito">
            </div>
          </div>
        </div>
      </div><!-- /.modal-body -->
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" ata-dismiss="modal" onclick="guardareditar()" >Guardar</button>
      </div>  <!-- /.modal footer -->

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->