<input type="hidden" id="permission" value="<?php echo $permission;?>">



<section class="content">

    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">


                    <h1 class="box-title">Mis Tareas</h1>
                    <!-- <button id="pruebagps">gps</button> -->


                </div><!-- /.box-header -->
                <div class="box-body">
                    <div class="datagrid">
                    
                    <table id="bandeja" class="table table-hover table-striped">
                            <thead>
                                <tr>

                                    <?php  

                  echo '<th width="7%"'.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Estado</td>';

                  echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Asignado</td>';

                  echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Fecha Asignación</td>';

                  echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Hora Asignación</td>';

                  echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Equipo</td>'; 

                  echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').'  >Sector</td>'; 

                  echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Cliente</td>'; 
                 
                  echo '<th>Tarea</th>';

                  echo '<th class="'.($device == 'android'?'hidden':null).'">Descripción</th>';

                  echo '<th width="7%">Id S.S</td>';    
                 
                  echo '<th width="7%">Id OT</td>';          
                 
                  echo '<th width="10%">Id Pedido</td>';                                                                                               



                  // echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Prioridad</td>';
                                  
                 
              
              ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php                
                foreach($list as $f){
                //   var_dump($list);
                  $id=$f["id"];
                  $asig = $f['assigned_id'];
                  $fechaasig = substr($f['assigned_date'], 0, 10);
                  $horaasig = substr($f['assigned_date'],10);

                //    if (strpos($permission,'Add') !== false) {
                    echo '<tr id="'.$id.'" class="'.$id.'" style="cursor: pointer;" tags="'.tagProceso($f['processId']).'" onclick="detalleTarea(this)">';
                //    }else{
                    //  echo '<tr id="'.$id.'" class="'.$id.'" style="cursor: pointer;" tags="'.tagProceso($f['processId']).'">';
                //    }
                   

                  if ( $asig != "")  {
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea hidden"' :'class= "celda nomTarea text-center"').'><i class="fa fa-user" style="color: #5c99bc ; cursor: pointer;"" title="Asignado" data-toggle="modal" data-target="#modalSale"></i></td>';
                  }else{
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea hidden"' :'class= "celda nomTarea text-center"').'><i class="fa fa-user" style="color: #d6d9db ; cursor: pointer;"" title="Sin Asignar" data-toggle="modal" data-target="#modalSale"></i></td>';
                  }
                  
                    echo '</td>';

                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$f['usr_asignado'].'</td>'; 

                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$fechaasig.'</td>'; 

                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">
                    '.$horaasig.'										
                    </td>'; 
                    
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea  tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$f['equipoDesc'].'</td>';
                    
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea  tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$f['sectorDesc'].'</td>';

                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea  tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$f['nomCli'].'</td>';
                    
                    echo '<td class="celda nomTarea" style="text-align: left">'.$f['displayName'].'</td>';  
                     
                    echo '<td class="celda tareaDesc '.($device == 'android' ? 'hidden':null).'" style="text-align: left">'.substr($f['displayDescription'],0,500).'</td>';                
                      

                    echo '<td class= "celda nomTarea text-center">'.bolita($f['ss'],'blue').'</td>';   
                    
                    echo '<td class= "celda nomTarea text-center">'.bolita($f['ot'],'orange').'</td>';                  
                  
                    echo '<td class= "celda nomTarea text-center">'.bolita($f['pema_id'],'green').'</td>';                  
                    
                    echo '</tr>';

                }
              ?>

                            </tbody>
                        </table>
                    </div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->

<div class="modal fade" id="finalizar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="modalAction"
                        class="glyphicon glyphicon-check btncolor " style="color: #6aa61b"> </span> Finalización </h4>
            </div>
            <center>
                <div>Debe completar el formulario asociado a esta tarea para terminarla</div>
            </center>

        </div>
    </div>
</div>

<script>

var idfin = "";
var id_tarea = "";
var nomTarea = "";
var tareaDesc = "";
var fechaCreacion = "";

actualizar_terminadas();

function actualizar_terminadas() {
    var aux = sessionStorage.getItem("tareas_cerradas");
    if (aux == null || aux.length == 0) return;
    var aux = aux.split("-");
    for (var i = 0; i < aux.length - 1; i++) {
        $("#" + aux[i]).remove();
    }
}



//Tomo valor de la celda y carga detalle de la tarea
function detalleTarea(e) {
    var id = $(e).attr('id');

    WaitingOpen();
    if (!$(e).attr('tags').includes('#pedidoMaterial')) {
        linkTo("Tarea/detaTarea/<?php echo $permission; ?>/" + id);
    } else {
        linkTo('almacen/Proceso/detalleTarea/' + id);
    }
    WaitingClose();

};


// Carga para cargar notif estandar
function verTarea(idTarBonita) {

    WaitingOpen();
    linkTo("Tarea/detaTarea/<?php echo $permission; ?>/" + idTarBonita);
    WaitingClose();

}


/////////// TERMINAR TAREA   ///////

// boton terminar tarea
$('.btnFin').click(function() {
    var idTarBonita = $(this).parents('tr').find('td').eq(8).html();
});
//PROBANDO TRAER COORDENADAS GPS
$("#pruebagps").click(function(e){
    debugger;
    var xlat = null;
    var xlon = null;
            // if (!window.mobileAndTabletcheck()) {
            if(true){
                if (obtenerPosicion()) {
                console.log('LAT: ' + lat + ' - LON: ' + lon + ' - ACC: ' + ac);
                xlat = lat;
                xlon = lon;
                }
                else {
                    alert('GPS | No se pudo Obtener Ubicación, Por favor Activar el GPS del Dispositivo.');
                    return;
                }
            }else{
                console.log('GPS | No Mobile');
            }
            console.table("latitud y long antes de llamar a ajax");
            console.table(xlat);
            console.table(xlon);
});
//FIN PREUBA TRAER CORDENADAS GPS

// Recargar vista
function recargar() {
    WaitingOpen();
    $(".content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>/");
    WaitingClose();
}

if (!conexion()) offline();
else {
    sessionStorage.removeItem('tareas_cerradas');
}

function offline() {
    console.log('Pagina Offline | Cargando Contenido...');

    //Checks Subtareas
    var aux = JSON.parse(sessionStorage.getItem('tareas_cerradas'));
    if (aux != null) {
        Object.keys(aux).forEach(function(key) {
            $('#' + key).remove();
        });
    }
}
DataTable('#bandeja',true, false);
</script>