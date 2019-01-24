<input type="hidden" id="permission" value="<?php echo $permission;?>">


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
          <table id="sector" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th width="10%"> </th>
                <th>Razón Social</th>
                <th>Tarea</th>
                <th>Detalle</th>
                <!-- <th>Descripcion:</th> -->
                <th>Fecha</th>
                <th style="display:none">Fecha Vto.:</th>
                <th style="display:none">Estado:</th>
                <th style="display:none">Prioridad:</th>

                <th style="display:none">id tarea bonit</th>
                <th>Estado:</th>
              </tr>
            </thead>
            <tbody>
              <?php

                $lista = json_decode($list,true);
                //FIXME: SACAR VAR DUMP
                 //echo "<pre>";
                 //dump($list, 'tareas:');
                foreach($list as $f){

                  $id=$f["id"];
                  $asig = $f['assigned_id'];
                  echo '<tr id="'.$id.'" class="'.$id.'" >';
                  // td 0
                  echo '<td>';
                    if (strpos($permission,'Del') !== false){
                      if ($asig != "") {
                        echo '<button type="button" id="btncolor" class="btn btnFin btn-success" >
                            <span class="glyphicon glyphicon-ok"></span>  </button> ';
                      }else{
                        echo '<button type="button" id="btncolor" class="btn btn-success" data-toggle="modal" data-target="#finalizar" disabled>
                            <span class="glyphicon glyphicon-ok"></span>  </button> ';
                      }
                    }
                  echo '</td>';
                  // td 1
                  echo '<td class="celda" style="text-align: left">C.U.I.T.: '.$f["empleacui"].' - '.$f["emplearazsoc"].'<br>'. $f["establecalle"].' - '. $f["establealtura"].' </td>';
                  // td 2
                  echo '<td class="celda nomTarea" style="text-align: left">'.$f['displayName'].'</td>';
                  // td 3
                  echo '<td class="celda tareaDesc" style="text-align: left">'.substr($f['displayDescription'],0,500).'</td>';
                  // td 4
                  echo '<td class="celda" style="text-align: left">'.$f['assigned_date'].'</td>';
                  // td 5
                  echo '<td class="celda hidden" style="text-align: left">'.$f['dueDate'].'</td>';
                  if ( $asig != "")  {
                    echo '<td class="celda" style="text-align: left"><i class="fa fa-user" style="color: #A9A9A9 ; cursor: pointer;"" title="Tomado" data-toggle="modal" data-target="#modalSale"></i></td>';
                  }else{

                      echo '<td class="celda" style="text-align: left"></td>';
                  }
                  // td 6
                  echo '<td class="celda hidden" style="text-align: left">'.$f['priority'].'</td>';

                  // id de tarea en bonita
                  // td 7
                  echo '<td class="celda hidden" style="text-align: left">'.$f['id'].'</td>';
                  // td 8
                  echo '<td class="celda hidden" style="text-align: left">'.$f['assigned_id'].'</td>';
                  // echo '<td class="celda" style="text-align: left">'.($f['estado'] == 'TE' ? '<small class="label pull-left bg-orange">Parcial</small>' : ($f['estado'] == 'C' ? '<small class="label pull-left bg-green">Iniciada</small>' : ($f['estado'] == 'P' ? '<small class="label pull-left bg-blue">Pedido</small>' : ($f['estado'] == 'As' ? '<small class="label pull-left bg-yellow">Asignado</small>' : '<small class="label pull-left bg-red">Entregado</small>')))).'</td>';

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
        <!--<div class="modal-footer">
           <button  type="button" class="btn btn-success" data-dismiss="modal" onclick=""> PARCIAL</button>
          <button  type="button" class="btn btn-success" data-dismiss="modal" onclick="" >Aceptar</button>
        </div>-->
    </div>
  </div>
</div>

<script>

    var idfin="";
    var id_tarea = "";
    var nomTarea = "";
    var tareaDesc = "";
    var fechaCreacion = "";
//Tomo valor de la celda y carga detalle de la tarea
  $('.celda').click( function () {

    var idTarBonita = $(this).parents('tr').find('td').eq(8).html();
    //console.log('id tarea INTERNO de bonita: ');
    //console.log(idTarBonita);

    //var id_orden = 17;
    var estado = $(this).parents('tr').find('td').eq(6).html();

    // toma nombre y descripcion de tarea para Notific Estandar
    nomTarea = $(this).parents('tr').find('td').eq(2).html();
    //console.log('nom tarea: ');
    //console.log(nomTarea);
    tareaDesc = $(this).parents('tr').find('td').eq(3).html();
    tareaDesc = "descripcion";
    //console.log('desc tarea: ');
    //console.log(tareaDesc);

    //fechaCreacion = $(this).parents('tr').find('td').eq(4).html();
    fechaCreacion = "2018-12-01";

    //console.log('fechaCreacion tarea: ');
    //console.log(fechaCreacion);

    var estadoTarea = "";
    if (estado!="") {
      estadoTarea ="asignado";
    }else{
      estadoTarea ="noasignado";
    }
    //getIdTareaTraJobs(idTarBonita,id_orden,estadoTarea);
    verTarea(idTarBonita);
    //idfin = id_orden;
    //console.log(idfin);

  });


  // Carga notif strandar

  function verTarea(idTarBonita){

    WaitingOpen();

    $(".content").load("<?php echo base_url(); ?>index.php/Tarea/detaTarea/<?php echo $permission; ?>/" + idTarBonita+ "/"  );
    WaitingClose();
  }

/////////// TERMINAR TAREA   ///////

  // boton terminar tarea
  $('.btnFin').click( function () {

    //var id_orden= $(this).parents('tr').find('td').eq(1).html();
    var idTarBonita = $(this).parents('tr').find('td').eq(8).html();
    //validarRelacTareaForm(idTarBonita);
  });
////////REVISAR TODO ESTO
  // Trae id de listarea desde BPM y llama a func validarFormGuardado();
  // function validarRelacTareaForm(idTarBonita,id_orden){
  //   var idTJobs = "";
  //   $.ajax({
  //           type: 'POST',
  //           data: { idTarBonita: idTarBonita},
  //           url: 'index.php/Tarea/getIdTareaTraJobs',
  //           success:function(data){

  //                  // console.log('value en lista: ');
  //                  // console.log(data['value']);
  //                   idTJobs = data['value'];
  //                   validarFormGuardado(idTJobs);
  //                 },

  //           error: function(result){
  //                 console.log(result);
  //               },
  //           dataType: 'json'
  //       });
  // }


  // function validarFormGuardado(id_listarea){

  //   $.ajax({
  //           type: 'POST',
  //           data: { id_listarea: id_listarea},
  //           url: 'index.php/Tarea/validarFormGuardado',
  //           success:function(data){
  //                   //alert('Validado puede guardar');
  //                   console.log(data);
  //                   // si no hay campos no validados finaliza la tarea
  //                   if (data) {
  //                     finalizarTarea(id_listarea);
  //                   }else{
  //                     // si hay campos sin validar
  //                     $('#finalizar').modal('show');
  //                   }
  //                 },

  //           error: function(result){
  //                 console.log(result);
  //                 alert('complete el formulario asociado');
  //               },
  //           dataType: 'json'
  //       });
  // }

  // function finalizarTarea(id_listarea){
  //   $.ajax({
  //           type: 'POST',
  //           data: { id_listarea: id_listarea},
  //           url: 'index.php/Tarea/terminarTarea',
  //           success:function(data){
  //                   console.log(data);
  //                 },

  //           error: function(result){
  //                 console.log(result);
  //                 recargar();
  //                 alert('complete el formulario asociado');
  //               },
  //           dataType: 'json'
  //       });
  // }
////////////// HASTA ACA
  // Recargar vista
  function recargar(){
    WaitingOpen();
    $(".content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>/");
    WaitingClose();
  }



 

  //$('#sector').DataTable();


$("#sector").DataTable({
    "aLengthMenu": [ 10, 25, 50, 100 ],
    "autoWidth": true,
    "columnDefs": [ {
      "targets": [ 0 ], //no busco en acciones
      "searchable": false
    },
    {
      "targets": [ 0 ], //no ordena columna 0
      "orderable": false
    } ],
    "info": true,
    "ordering": true,
    "order": [[1, "asc"]],
    "paging": true,
    "language": {
      "sProcessing":     "Procesando...",
      "sLengthMenu":     "Mostrar _MENU_ registros",
      "sZeroRecords":    "No se encontraron resultados",
      "sEmptyTable":     "Ningún dato disponible en esta tabla",
      "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
      "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
      "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
      "sInfoPostFix":    "",
      "sSearch":         "Buscar:",
      "sUrl":            "",
      "sInfoThousands":  ",",
      "sLoadingRecords": "Cargando...",
      "oPaginate": {
        "sFirst":    "Primero",
        "sLast":     "Último",
        "sNext":     "Sig.",
        "sPrevious": "Ant."
      },
      "oAria": {
        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
      }
    },
    "lengthChange": true,
    "searching": true,
    "sPaginationType": "full_numbers",
    "sScrollX": '100%',
    "sScrollXInner": "100%",
    "bScrollCollapse": true,
  });

</script>


















