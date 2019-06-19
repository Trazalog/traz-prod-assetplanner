<!-- <section class="content"> -->
<div class="row">

    <div class="col-xs-12">
      <div class="box">
          <input type="hidden" id="idOt" value="<?php echo $idOt; ?>">
          <input type="hidden" id="task" value="<?php echo $task; ?>">
          <input type="hidden" id="id_solicitud" value="<?php echo $detaOT[0]['id_solicitud']; ?>">
          <input type="hidden" id="tipo" value="<?php echo $detaOT[0]["tipo"]; ?>">

          
          <div class="box-header">
       
          </div><!-- /.box-header -->
          
          <div class="box-body">            
              
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title"><span class="fa fa-cogs"></span> Orden de Trabajo </h3>
                </div>
                <div class="panel-body">                

                  <div class="row">
                    <div class="col-xs-12">
                      <div class="nav-tabs-custom">
                        <!--tabs -->
                        <ul class="nav nav-tabs" role="tablist">                
                          <li role="presentation" class="active"><a href="#detalle" aria-controls="profile" role="tab" data-toggle="tab">Detalle</a></li>
                          
                          <?php 
                            if($btnVisibilidad){
                              echo '<li role="presentation"><a href="#responsable" aria-controls="messages" role="tab" data-toggle="tab">Asignación Responsable</a></li>';                          
                              echo '<li role="presentation"><a href="#tareas" aria-controls="messages" role="tab" data-toggle="tab">Agregar Tareas</a></li>';                            
                            }   
                          ?>        
                        </ul>
                        <!-- /tabs -->
    
                        <!-- Tab panes -->
                        <div class="tab-content">
                         
                          <!-- Tab detalle -->
                          <div role="tabpanel" class="tab-pane active" id="detalle">
                            <div class="row">
                             
                              <table id="tblOrden">
                                <thead>
                                  <th>F. Prog</th>
                                  <th>Nº Orden</th>
                                  <th>Tipo</th>
                                  <th>Nº Tarea</th>
                                  <th>Desc. Tarea</th>
                                  <!-- <th>Origen</th> -->
                                  <th>Duracion</th>
                                  <th>Frec.</th>  
                                  
                                  <!-- <th>Nº Solicitud Origen</th> -->
                                  <th>Codigo de Equipo</th>
                                  <th>Desc. Equipo</th>
                                </thead>
                                <tbody>
                                <?php
                                  echo '<td>'.$detaOT[0]["fecha_program"].'</td>';
                                  if ($detaOT[0]['id_orden'] != NULL) {
                                    echo '<td>'.$detaOT[0]['id_orden'].'</td>';
                                  } else {
                                    echo '<td> </td>';
                                  }
                                  //dump($detaOT[0], 'datos de ot: ');
                                  
                                  echo '<td>'.$detaOT[0]["descrpcionSolicitud"].'</td>';
                                  echo '<td>'.$detaOT[0]["id_solicitud"].'</td>';
                                  echo '<td>'.$detaOT[0]['descripcion'].'</td>';                         
                                  echo '<td>'.$infoSolicOrigen[0]["duracionTarea"]." ".$infoSolicOrigen[0]["unidaddescrip"] .'</td>';
                                  
                                  echo '<td>'.$infoSolicOrigen[0]['frecuencia'].'</td>';
                                 
                                  echo '<td>'.$detaOT[0]['codigo'].'</td>';
                                  echo '<td>'.$detaOT[0]['descripcionEquipo'].'</td>';
                                ?>  
                                </tbody>
                              </table>

                            </div><!-- /.row -->
                            
                          </div> <!-- /.tabpanel #detalle-->
                          <!-- Tab responsable -->

                          <div role="tabpanel" class="tab-pane" id="responsable">
                            <div class="row">
                              <div class="col-xs-12">
                                <div class="alert alert-danger alert-dismissable" id="errorTable" style="display: none">
                                  <h4><i class="icon fa fa-ban"></i> Error!</h4>
                                  Por favor seleccione Responsable para esta Tarea...
                                </div>
                              </div>
                              <div class="col-xs-12 col-sm-6 col-md-4">
                                <label for="operario">Apellido y Nombre <strong style="color: #dd4b39">*</strong> :</label>
                                <input type="text" class=" form-control operario" id="operario" name="operario" value="" placeholder="Buscar...">
                                <input type="hidden" class=" form-control operario" id="id_operario" name="id_operario" value="">
                              </div>
                            </div><!-- /.row -->                              
                          </div><!--/#responsable -->
                          
                          <!-- Tab tareas -->
                          <div role="tabpanel" class="tab-pane" id="tareas">
                            <div class="row">
                              <div class="col-xs-12">
                                <div class="alert alert-danger alert-dismissable" id="errorTarea" style="display: none">
                                  <h4><i class="icon fa fa-ban"></i> Error!</h4>
                                  Por favor seleccione una Tarea...
                                </div>
                              </div>  
                              <div class="col-xs-12 col-sm-6">
                                  <label for="tareaest">Tarea Estandar<strong style="color: #dd4b39">*</strong>:</label>                                 
                                  <?php
                                  //dump($tareas, 'tareas en select: ');
                                    echo '<select id="tareaest" name="tareaest" class="form-control">';
                                    echo '<option value="-1" >"Seleccione..."</option>';            
                                   
                                    foreach ($tareas as $tarea) {    
                                      
                                      $t = $tarea['id_tarea'];
                                      $tOT = $detaOT[0]['id_tarea'];
                                      // dump($t, 'id tarea std');
                                      // dump($tOT, 'id tarea de OT');

                                     if($t == $tOT){                                     
                                      
                                      echo '<option value="'.$tarea['id_tarea'].'" selected="selected">'.$tarea['descripcion'].'</option>';
                                      }else{
                                        echo '<option value="'.$tarea['id_tarea'].'">'.$tarea['descripcion'].'</option>';
                                      }
                                    }

                                    echo '</select>';    


                                  ?>                                  
                              </div>
                              <div class="col-xs-12 col-sm-6">
                                  <label for="tareaOpcional">Tarea No Estandar<strong style="color: #dd4b39">*</strong>:</label>
                                  <?php
                                  // if ($detaOT[0]["id_tarea"] != 1) {
                                  //   echo '<input type="text" class="form-control" id="tareaOpcional" name="tareaOpcional" value=""/>';
                                  // } else {
                                  //   echo '<input type="text" class="form-control" id="tareaOpcional" name="tareaOpcional" value="'.$detaOT[0]["descripcion"].'"/>';
                                  // }

                                  if ( ($detaOT[0]["id_tarea"] == 0) || ($detaOT[0]["id_tarea"] == -1) ) {
                                    echo '<input type="text" class="form-control" id="tareaOpcional" name="tareaOpcional" value="'.$detaOT[0]["descripcion"].'"/>';
                                    
                                  } else {
                                    echo '<input type="text" class="form-control" id="tareaOpcional" name="tareaOpcional" value=""/>';
                                  }
                                  
                                 
                                  ?>
                              </div>

                            </div><!-- /.row -->                              
                          </div><!--/#tareas -->    
                        </div>  <!-- tab-content -->    
                        
                      </div><!-- /.nav-tabs-custom -->
                    </div>
                  </div>
                </div>
              </div>     
            
          </div><!-- /.box-body -->

          <div class="modal-footer">
            <?php if($btnVisibilidad){
              echo '<button type="button" class="btn btn-success" id="ejecutar_ot" onclick="EjecutarOT()">Ejecutar OT</button>';
            }
            ?>
            
            <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
          </div>
      
      </div>
    </div>
  </div>
<!-- </section> -->
<script>
   $('#tblOrden').DataTable({
    "paging": false,
    "lengthChange": true,
    "searching": false,
    "ordering": true,
    "info": false,
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

  validarTarea();
  function validarTarea(){
    $('#tareaest').change(function() {
        $('#tareaOpcional').val('');
    });
    $('#tareaOpcional').click(function() {
        $('#tareaest').val(-1);
    });
  }

  // Trae Operarios
  var dataO = function () {
    var tmp = null;
    $.ajax({
      'async': false,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "ordenservicio/getOperario",
      'success': function (data) {
          tmp = data;
      }
    });
    return tmp;
  }();
  $("#operario").autocomplete({
    autoFocus: true,
    delay: 300,
    minLength: 1,
    source: dataO,
    /*focus: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox
      $(this).val(ui.item.label);
      $("#id-Operario").val(ui.item.value);
    },*/
    select: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox and hidden field
      $(this).val(ui.item.label); 
      $('#id_operario').val(ui.item.value);                 
    },
    /*open: function( event, ui ) {
      $("#ui-id-3").css('z-index',1050);
    },*/
    change: function (event, ui) {
      if (!ui.item) {
        this.value = '';
      }
    }
  });

  //cierra la tarea ejecutar OT y asigna la tarea a la OT
  function EjecutarOT(){

    $('#errorTable').fadeIn('slow');
    
    var task           = $('#task').val();
    var ot             = $('#idOt').val();
    var responsable    = $('#id_operario').val();
    var id_solicitud   = $('#id_solicitud').val();
    var tipo           = $('#tipo').val();    
    var tareaOpcional  = $('#tareaOpcional').val();
    var tareastd       = $('#tareaest').val();
    var tareastdDesc = $('#tareaest option:selected').text();  
   
    if (responsable == "") {      
      $('#errorTable').fadeIn('slow');
      activaTab('responsable');
      return;
    }else{
      $('#errorTable').fadeOut('slow');
    }

    if (tareastd == -1 && tareaOpcional == "") {      
      $('#errorTarea').fadeIn('slow');
      activaTab('tareas');
      return;
    }else{
      $('#errorTarea').fadeOut('slow');
    }

    if(ot == null || task == null){alert('Error');return;}
    
    WaitingOpen();
    
    $.ajax({
        type: 'POST', 
        data: {ot:ot, 
              task:task, 
              responsable:responsable, 
              id_solicitud:id_solicitud,
              tipo:tipo,
              tareaOpcional:tareaOpcional,
              tareastd:tareastd,
              tareastdDesc:tareastdDesc
              }, 
        url: 'index.php/Otrabajo/EjecutarOT',  
        success: function(data){
                    WaitingClose();
                    // {"status":true,"msj":"OK"}
                    if(data.status) {
                      $('#modalInforme').modal('hide');
                      regresa1();
                    }else{
                      $('#modalInforme').modal('hide');
                      alert('Falla | No se pudo Ejecutar la Orden de Trabajo | '+data.msj);
                    }
        },
        error: function(data){
                    WaitingClose();
                    $('#modalInforme').modal('hide');
                    alert('Error | No se pudo Ejecutar la Orden de Trabajo | '+data.msj);
        },
        dataType: 'json'    
    }); 
  }

  //activa el tab= tab
  function activaTab(tab){
      $('.nav-tabs a[href="#' + tab + '"]').tab('show');
  };


</script>  

