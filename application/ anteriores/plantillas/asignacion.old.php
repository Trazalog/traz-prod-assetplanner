<input type="hidden" id="permission" value="<?php echo $permission;?>">
 <div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
          <h4><i class="icon fa fa-ban"></i> ERROR!</h4>
          INGRESE TAREA A REALIZAR!! 
      </div>
  </div>
</div>
<section class="content">
  <div class="row">
    <div class="col-sm-12 col-md-12">
      <div class="box">
        <div class="box-header">
          <center>
          <h2> Plantilla </h2>  
          </center>
          <?php
            if (strpos($permission,'Add') !== false) {
              echo '<button class="btn btn-block btn-success" style="width: 100px; margin-top: 10px;" onclick="regresa()">Volver</button>';           
            }
            ?>
             </br>
              </br>
        </div><!-- /.box-header -->
        <div class="box-body">
          <div class="row" >
            <div class="col-sm-12 col-md-12">
            </br>


              <h4><div class="col-sm-8">Nueva Tarea:
              <input type="text" class="form-control" id="tarea"  name="tarea" placeholder="Ingrese descripcion de tarea...">
              </div></h4>
              <div class="col-xs-4">
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<input type="hidden"  id="numord" name="numord" value="<?php echo $id_plantilla;?>"> </input>
              </div> 
            </br>

              <div class="col-xs-4">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <button type="button" class="btn btn-success agregar" id="agregar">Agregar</button>
              </div>
              </br>
              </br>
              </br>
              </br>
              </br>
              <center>
               <h3> Tareas cargadas</h3> 
             </center>
              </br>
              
                <table id="subtareas" class="table table-hover">
                <thead>
                  <tr>  
                    <th style="display:none"></th>
                    <th>Descripcion</th>
                    <th width="20%">Acciones</th>
                  </tr>
                </thead>
                <tbody>  
                    <?php
                          foreach($list as $a){
                          $id=$a['id_detaplantilla'];
                          echo '<tr id="'.$id.'" class="'.$id.'">';
                          echo '<td style="text-align: left; display:none">'.$a['id_detaplantilla'].'</td>';
                          echo '<td style="text-align: left">'.$a['descripcion_deta'].'</td>';
                          echo '<td>';

                          if (strpos($permission,'Del') !== false)
                          {
                            echo '<i class="fa fa-times-circle" style="color: #8eb29a; cursor: pointer;cursor: pointer;" title="Eliminar"></i>';
                          }               
                          echo '</td>';
                          echo '</tr>';
                          }
                     ?> 
                </tbody>
              </table>
            </div>
          </div>          
         
        </div>
      </div>
    </div>
  </div>        
</section>

<script>


//Agregar la tarea de una plantilla
$('#agregar').click(function (e) {
    console.log("Funcion Agregar");
     WaitingOpen();
        var descripcion=$('#tarea').val(); 
        console.log(descripcion);
        var idPlantilla=$('#numord').val();
        $.ajax({
            type: 'POST',
            data:{"descripcion":descripcion,"idPlantilla":idPlantilla},
            url: 'index.php/Plantilla/agregar_tarea', 
            success: function(data){
                alert("Tarea Guardada");
                regresa1();
            },
            error: function(result){
                console.log("Error al guardar tarea");
            }    
        });
     WaitingClose();
  });



//Elimina la tarea de una plantilla
$(".fa-times-circle").click(function (e) { 
      
    console.log("Estoy eliminando tarea");
    var idt = $(this).parents('tr').find('td').eq(0).html();
    console.log("id de tarea es:");
    console.log(idt); 
    id_detaplantilla=idt;  
    $.ajax({
            type: 'POST',
            data: { id_detaplantilla: id_detaplantilla},
            url: 'index.php/Plantilla/EliminarTarea', //index.php/
            success: function(data){
                     console.log("TAREA ELIMINADA");
                     console.log(data);
                     alert("TAREA ELIMINADA");
                     regresa1();
                    
                  },
              
            error: function(result){
               }
    });
  });

  function regresa1(){
  var numord= $('#numord').val();
  no=numord;
  console.log(no);
  $("#content").load("<?php echo base_url(); ?>index.php/Plantilla/cargartarea/<?php echo $permission; ?>/"+no+"");
}

//vuelve a la pagina ppal
 function regresa(){
        WaitingOpen();
        $('.content').empty();
        $(".content").load("<?php echo base_url(); ?>index.php/Plantilla/index/<?php echo $permission; ?>");
        WaitingClose();
      }

$(function () {
      
      $('#subtareas').DataTable({
          "paging": true,
          "lengthChange": true,
          "searching": true,
          "ordering": true,
          "info": true,
          "autoWidth": true,
          "language": {
                "lengthMenu": "Ver _MENU_ filas por página",
                "zeroRecords": "No hay registros",
                "info": "Mostrando pagina _PAGE_ de _PAGES_",
                "infoEmpty": "No hay registros disponibles",
                "infoFiltered": "(filtrando de un total de _MAX_ registros)",
                "oPaginate": {
                    "sNext": "Sig.",
                    "sPrevious": "Ant."
                  }
          }
      });
    });

</script>

