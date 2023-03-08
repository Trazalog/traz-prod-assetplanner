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

                                      echo '<th width="7%"'.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Estado</th>';

                                      echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Asignado</th>';

                                      echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Fecha Asignación</th>';

                                      /*echo '<th '.($device == 'android' ? 'class= "hidden"' :'class= ""').' >Hora Asignación</td>';*/

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
              <!--          <?php                
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
                    echo '< '.($device == 'android' ? 'class= "celda nomTarea hidden"' :'class= "celda nomTarea text-center"').'>< class="fa fa-user" style="color: #d6d9db ; cursor: pointer;"" title="Sin Asignar" data-toggle="modal" data-target="#modalSale"></i></td>';
                  }
                  
                    echo '</td>';

                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$f['usr_asignado'].'</td>'; 

                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$f['assigned_date'].'</td>'; 

                    /*echo'<td '.($device == 'android' ? 'class= "celda nomTarea tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$horaasig.'</td>'; */
                    
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea  tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.($f['equipoDesc'] == 'null') ? ' ' : $f['equipoDesc'].'</td>';
                    
                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea  tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$f['sectorDesc'].'</td>';

                    echo '<td '.($device == 'android' ? 'class= "celda nomTarea  tddate"' :'class= "celda nomTarea tddate"').' style="text-align: left">'.$f['nomCli'].'</td>';
                    
                    echo '<td class="celda nomTarea" style="text-align: left">'.$f['displayName'].'</td>';  
                     
                    echo '<td class="celda tareaDesc '.($device == 'android' ? 'hidden':null).'" style="text-align: left">'.substr($f['displayDescription'],0,500).'</td>';                
                      

                    echo '<td class= "celda nomTarea text-center">'. ($f['ss'] == 'undefined') ? bolita($f['ss'],'blue') : " " .'</td>';   
                    
                    echo '<td class= "celda nomTarea text-center">'. ($f['ot'] == null) ? " " : bolita($f['ot'],'orange') .'</td>';                  
                  
                    echo '<td class= "celda nomTarea text-center">'. ($f['pema_id'] != null) ? bolita($f['pema_id'],'green') : " " .'</td>';                  
                    
                    echo '</tr>';

                }
              ?>  -->

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

$(document).ready(function(){
   
   /*  $.ajax({
        type: 'POST',
        url:'index.php/Tarea/paginado',
        success: function(result) {
                            console.log(result);
                           
                        },
    });   */
    $('#bandeja').DataTable({
    'lengthMenu':[[10,25,50,100,],[10,25,50,100]],
    'paging' : true,
    'processing':true,
    'serverSide': true,
    'ajax':{
        type: 'POST',
        url: 'index.php/Tarea/paginado',
    },
    'columnDefs':[
        {
                //Agregado para que funcione cabecera de imprimir,descargar excel o pdf.   
                "defaultContent": "-",
                "targets": "_all",
        },
        {
            'targets':[0],
             'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var asig = row['assigned_id'];
                    if( asig != ""){
                        clase =  (device == 'android' ?  "celda nomTarea hidden" : "celda nomTarea text-center");
    
                    }
                    else{
                        clase = (device == 'android' ?  "celda nomTarea hidden" : "celda nomTarea text-center");
                    } 
                    $(td).attr('class', clase);
            }, 
            'data':'Estado',
            'render':function(data,type,row){
                var id = row['id'];
                var asig = row['assigned_id'];
                var processId = row['processId'];
                var device ="<?php  echo $device ?>";
                r = '<tr';
                if( asig != ""){
                    r =  `<td> <i class="fa fa-user" style="color: #5c99bc ; cursor: pointer;"" title="Asignado" data-toggle="modal" data-target="#modalSale"></i></td>` 
                }
                else{
                    r = `<td> <i class="fa fa-user" style="color: #d6d9db ; cursor: pointer;"" title="Sin Asignar" data-toggle="modal" data-target="#modalSale"></i></td>`
                } 
                return r;
                }
        },
        {
            'targets':[1],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  (device == 'android' ? "celda nomTarea tddate" : "celda nomTarea tddate");
                    $(td).attr('class', clase); 
                    $(td).attr('style', 'text-align: left'); 
            },
            'data':'Asignado',
            'render': function(data, type, row){
                return `<td>${row['usr_asignado']}</td>`;
            }
        },
        {
            'targets':[2],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  (device == 'android' ? "celda nomTarea tddate" : "celda nomTarea tddate");
                    $(td).attr('class', clase); 
                    $(td).attr('style', 'text-align: left'); 
            },
            'data':'Fecha Asignación',
            'render': function(data, type, row){
                return `<td>${row['assigned_date']}</td>`;
            }
        },
        {
            'targets':[3],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  (device == 'android' ? "celda nomTarea tddate" : "celda nomTarea tddate");
                    $(td).attr('class', clase); 
                    $(td).attr('style', 'text-align: left'); 
            },
            'data':'Equipo',
            'render': function(data, type, row){
                return `<td>${(row['equipoDesc']) ? row['equipoDesc'] : ' '}</td>`;
            }
        },
        {
            'targets':[4],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  (device == 'android' ? "celda nomTarea tddate" : "celda nomTarea tddate");
                    $(td).attr('class', clase); 
                    $(td).attr('style', 'text-align: left'); 
            },
            'data':'Sector',
            'render': function(data, type, row){
                device ="<?php  echo $device ?>";
                return `<td>${(row['sectorDesc']) ? row['sectorDesc'] : ' ' }</td>`;
            }
        },
        {
            'targets':[5],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  (device == 'android' ? "celda nomTarea tddate" : "celda nomTarea tddate");
                    $(td).attr('class', clase); 
                    $(td).attr('style', 'text-align: left'); 
            },
            'data':'Cliente',
            'render': function(data, type, row){
                return `<td>${(row['nomCli']) ? row['nomCli'] : ' '}</td>`;
            }
        },
        {
            'targets':[6],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  "celda nomTarea tddate";
                    $(td).attr('class', clase); 
                    $(td).attr('style', 'text-align: left'); 
            },
            'data':'Tarea',
            'render': function(data, type, row){
                return `<td>${row['displayName']}</td>`;
            }
        },
        {
            'targets':[7],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  "celda tareaDesc " + (device == 'android' ? 'hidden':null); 
                    $(td).attr('class', clase); 
                    $(td).attr('style', 'text-align: left'); 
            },
            'data':'Descripcion',
            'render': function(data, type, row){
                var device ="<?php  echo $device ?>"; 
                return `<td>${(row['displayDescription']) ? row['displayDescription'] : ' '}</td>`;
            }
        },
        {
            'targets':[8],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  "celda nomTarea text-center"; 
                    $(td).attr('class', clase);
            },
            'data':'Id S.S',
            'render': function(data, type, row){
                return `<td>${(row['ss']) ? bolita(row['ss'],'blue') : ' '}</td>`;
            }
        },
        {
            'targets':[9],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  "celda nomTarea text-center"; 
                    $(td).attr('class', clase);
            },
            'data':'Id OT',
            'render': function(data, type, row){
                return `<td ">${(row['ot']) ? bolita(row['ot'],'orange') : ' '}</td>`;
            }
        },
        {
            'targets':[10],
            'createdCell':  function (td, cellData, rowData, row, col) {
                    var device ="<?php  echo $device ?>"; 
                    var clase =  "celda nomTarea text-center"; 
                    $(td).attr('class', clase);
            },
            'data':'Id Pedido',
            'render': function(data, type, row){
                return `<td>${(row['pema_id']) ? bolita(row['pema_id'],'green') : ' '}</td></tr>`;
            }
        },
    ],
    //agregado de data-json al tr de la tabla
    createdRow:function( row, data, dataIndex ) {
        var id = data['id'];
        //var processId = data['processId'];
        $(row).attr('id', id);
        $(row).attr('class', id);
        $(row).attr('style', 'cursor:pointer');
        $(row).attr('tags', 'tagProceso(processId)');
        $(row).attr('onclick', 'detalleTarea(this)');

        }, 
    }); 
});

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
//DataTable('#bandeja',true, false);
function bolita(texto, color, detalle = null)
{
    return `<span data-toggle='tooltip' title='${detalle}' class='badge bg-${color} estado'>${texto}</span>`;
}
</script>