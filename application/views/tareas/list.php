<input type="hidden" id="permission" value="<?php echo $permission;?>">
<?php 
  // echo " dispositivo: ";
  // echo $dispositivo;  
  // echo '<input type="text" class="form-control" id="dispositivo" value="'.$dispositivo.'" >';
?>

<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">

        <center>
          <h1 class="box-title">Listado de Tareas</h1>
        </center>

        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="sector" class="table table-hover">
            <thead>
              <tr>
                <!-- <th>disp</th> -->
                <th width="10%"> </th>
                <?php  
//echo '<th>Id Pedido Trabajo:</th>';
echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Id Pedido Trabajo:</td>';    
                
                echo '<th>Tarea:</th>';
                echo '<th>Descripcion:</th>';
                 
//echo '<th>Fecha Asignacion:</th>';
echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Fecha Asignacion:</td>';                 
                
//echo '<th>Fecha Vto.:</th>';
echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Fecha Vto.:</td>'; 
                
//echo '<th>Estado:</th>';
echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Estado:</td>';
                
//echo '<th>Prioridad:</th>';
echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Prioridad:</td>';
                
echo '<th style="display:none">Id tarea bonita</th>';

echo '<th>?</th>'

//echo '<th>Estado:</th>';
              
              ?>  
              </tr>
            </thead>
            <tbody>
              <?php                
                foreach($list as $f){
                  
                  $id=$f["id"];
                  $asig = $f['assigned_id'];

                  echo '<tr id="'.$id.'" class="'.$id.'" >';                    
                    // td 0                  
                    echo '<td>';
                      if (strpos($permission,'Del') !== false){
                        if ($asig != "") {
                          echo '<button type="button" id="btncolor" class="btn btnFin btn-success btn-sm" >
                              <span class="glyphicon glyphicon-ok"></span>  </button> ';
                        }else{
                          echo '<button type="button" id="btncolor" class="btn btn-success btn-sm" data-toggle="modal" data-target="#finalizar" disabled>
                              <span class="glyphicon glyphicon-ok"></span>  </button> ';
                        }
                      }
                    echo '</td>';
                    // td 1
                    //echo '<td class="celda" style="text-align: left">'.$f['cod_interno'].'</td>';
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea hidden"' :'class= "celda nomTarea"').' style="text-align: left">'.$f['cod_interno'].'</td>';                  
                    // td 2
                    echo '<td class="celda nomTarea" style="text-align: left">'.$f['displayName'].'</td>';  
                    // td 3
                    echo '<td class="celda tareaDesc" style="text-align: left">'.substr($f['displayDescription'],0,500).'</td>';                
                    // td 4
                    //echo '<td class="celda" style="text-align: left">'.$f['assigned_date'].'</td>';
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea hidden"' :'class= "celda nomTarea"').' style="text-align: left">'.$f['assigned_date'].'</td>'; 
                    // td 5
                    //echo '<td class="celda" style="text-align: left">'.$f['dueDate'].'</td>';
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea hidden"' :'class= "celda nomTarea"').' style="text-align: left">'.$f['dueDate'].'</td>';
                    
                    if ( $asig != "")  {
                      //echo '<td class="celda" style="text-align: left"><i class="fa fa-user" style="color: #A9A9A9 ; cursor: pointer;"" title="Tomado" data-toggle="modal" data-target="#modalSale"></i></td>';
                      echo '<td '.($device == 'android' ? 'class= "celda nomTarea hidden"' :'class= "celda nomTarea"').' style="text-align: left"><i class="fa fa-user" style="color: #A9A9A9 ; cursor: pointer;"" title="Tomado" data-toggle="modal" data-target="#modalSale"></i></td>';
                    }else{
                      //echo '<td class="celda" style="text-align: left"></td>';
                      echo '<td '.($device == 'android' ? 'class= "celda nomTarea hidden"' :'class= "celda nomTarea"').' style="text-align: left"></td>';
                    }
                    // td 6
                    //echo '<td class="celda" style="text-align: left">'.$f['priority'].'</td>';
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea hidden"' :'class= "celda nomTarea"').' style="text-align: left">'.$f['priority'].'</td>';
                    // id de tarea en bonita
                    // td 7
                    echo '<td class="celda" style="text-align: left">'.$f['id'].'</td>';
                    // td 8
                    //FIXME: OCULTAR CELDA NUEVAMENTE
                    echo '<td class="celda" style="text-align: left">'.$f['caseId'].'</td>';
                    echo '<td class="celda hidden" style="text-align: left">'.($f['estado'] == 'TE' ? '<small class="label pull-left bg-orange">Parcial</small>' : ($f['estado'] == 'C' ? '<small class="label pull-left bg-green">Iniciada</small>' : ($f['estado'] == 'P' ? '<small class="label pull-left bg-blue">Pedido</small>' : ($f['estado'] == 'As' ? '<small class="label pull-left bg-yellow">Asignado</small>' : '<small class="label pull-left bg-red">Entregado</small>')))).'</td>';
                  
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

<div class="modal fade" id="finalizar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="glyphicon glyphicon-check btncolor " style="color: #6aa61b" > </span> Finalización </h4>
        </div>
        <center>
        <div>Debe completar el formulario asociado a esta tarea para terminarla</div>
        </center>
        
    </div>
  </div>
</div>

<script>

  var idfin="";
  var id_tarea = "";
  var nomTarea = "";
  var tareaDesc = "";
  var fechaCreacion = "";

  actualizar_terminadas();
  function actualizar_terminadas(){
    var aux = sessionStorage.getItem("tareas_cerradas");
    if(aux==null || aux.length==0) return;
    var aux = aux.split("-");
    for(var i=0 ;i<aux.length-1;i++){
      $("#"+aux[i]).remove();
    }
  }

 

//Tomo valor de la celda y carga detalle de la tarea
  $('.celda').click( function () {

   // var idTarBonita = $(this).parents('tr').find('td').eq(9).html();   
    var idTarBonita = $(this).parents('tr').find('td').eq(8).html();     
    var estado = $(this).parents('tr').find('td').eq(6).html();

    // toma nombre y descripcion de tarea para Notific Estandar
    nomTarea = $(this).parents('tr').find('td').eq(2).html();   
    tareaDesc = $(this).parents('tr').find('td').eq(3).html();
    tareaDesc = "descripcion";
    
    //fechaCreacion = $(this).parents('tr').find('td').eq(4).html();
    fechaCreacion = "2018-12-01";
    var estadoTarea = "";
    if (estado!="") {
      estadoTarea ="asignado";
    }else{
      estadoTarea ="noasignado";
    }
      verTarea(idTarBonita);
  });


  // Carga para cargar notif estandar
  function verTarea(idTarBonita){

    WaitingOpen();

    $(".content").load("<?php echo base_url(); ?>index.php/Tarea/detaTarea/<?php echo $permission; ?>/" + idTarBonita);
    WaitingClose();
  }

/////////// TERMINAR TAREA   ///////

  // boton terminar tarea
  $('.btnFin').click( function () {   
    var idTarBonita = $(this).parents('tr').find('td').eq(8).html();   
  });

  // Recargar vista
  function recargar(){
    WaitingOpen();
    $(".content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>/");
    WaitingClose();
  }

  // Datatable
  $(function () {

    $('#sector').DataTable({
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
              "sSearch": "Buscar:  ",
              "oPaginate": {
                  "sNext": "Sig.",
                  "sPrevious": "Ant."
                }
        }
    });
  });


</script>


















