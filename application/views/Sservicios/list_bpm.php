<input type="hidden" id="permission" value="<?php echo $permission;?>"> 
<section class="content">    
  <div class="row">
    <div class="col-xs-12">
      <div class="box box-primary">
        <div class="box-header">
          <h3 class="box-title">Solicitud de Servicios</h3>
          <?php
           if (strpos($permission,'Add') !== false) {
              echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modalservicio" id="btnAdd">Agregar</button>';
           }          
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="servicio" class="table table-striped table-hover">
              <thead>
                  <tr>
                      <th width="2%">Acciones</th>
                      <th>Nro</th>
                      <th>Fecha</th>
											<th>Fecha Fin</th>
											<th>T. Generaciòn</th>
                      <th>Solicitante</th>
                      <th>Equipo</th>
                      <th>Sector</th>
                      <th>Grupo</th>
                      <th>Causa</th>
                      <th>Mantenedor</th>
                      <th>Estado</th>
                  </tr>
              </thead>
              <tbody>
                <?php

                  $userdata = $this->session->userdata('user_data');
                  $usrId = $userdata[0]['usrId'];   
                  $grupoId = $userdata[0]["grpId"];

                    if(count($list) > 0) {

                      foreach($list as $f){
                        // var_dump($list);
                          // usuario logueado o grupo administrador
                    //    if (($f['usrId'] == $usrId) || ($grupoId == 1)) {
																												$fecTerminada = $f['fecha_terminada'];
                            $id_sol = $f['id_solicitud'];
                            $id_eq = $f['id_equipo'];

                          echo '<tr id="'.$id_sol.'" class="'.$id_eq.'" data-idequipo="'.$id_eq.'" >' ;
                            echo '<td>';

                            //if (strpos($permission,'Del') !== false) {

                                //echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar"></i>';
                            //}                                      

                            //echo '<i class="fa fa-picture-o text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Imagen" data-imagen ="'.$f['foto'].'" data-toggle="modal" data-target="#foto"></i> '; 
                            
                            // echo '<i class="fa fa-print text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Imprimir"></i> '; 
                            echo '<a onclick="mostrarOT(this)" href="#"><i class="fa fa-search text-white" style="cursor: pointer;margin-left:-3px"></i>   Ver</a>';

                            //if ($f['estado'] !== 'T') { 
                            //echo '<i class="fa fa-thumbs-up text-light-blue" data-toggle="modal" data-target="#modalConformidad" style="cursor: pointer; margin-left: 15px;" title="Conformidad"></i>';
                            //}   

                            //echo '<i class="fa fa-print text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Imprimir"></i> ';

                            echo '</td>';
                            echo '<td style="text-align: left">'.$f['id_solicitud'].'</td>';
                            echo '<td style="text-align: left">'.$f['f_solicitado'].'</td>';

																												if ( ($fecTerminada == '0000-00-00 00:00:00') || ($fecTerminada == '') ) {

																														echo '<td style="text-align: left"> S/Fecha</td>';
																												} else {

																														echo '<td style="text-align: left">'.$f['fecha_terminada'].'</td>';
																												}
                            if(!is_null($f['f_asignacion'])){

                              $f_asignacion = strtotime($f['f_asignacion']);
                              $f_solicitado = strtotime($f['f_solicitado']);
                              $tiempo = number_format((($f_asignacion - $f_solicitado)/3600), 2, ':', ' ');
                             
                              echo '<td style="text-align: left">'.$tiempo.'</td>';
                            }else{
                              echo '<td style="text-align: left">No Aplica</td>';
                            }                           
                            
                            echo '<td style="text-align: left">'.$f['solicitante'].'</td>';
                            echo '<td style="text-align: left">'.$f['equipo'].'</td>';
                            echo '<td style="text-align: left">'.$f['sector'].'</td>';
                            echo '<td style="text-align: left">'.$f['grupo'].'</td>';  
                            echo '<td style="text-align: left">'.$f['causa'].'</td>';
                            echo '<td style="text-align: left">'.$f['mantenedor'].'</td>';

                            echo '<td>';           
                            
                            if ($f['estado'] == 'S') {
                              // echo  '<small class="label pull-left bg-red">Solicitada</small>';
                               echo bolita('Solicitada', 'red');
                             }
                             if($f['estado'] == 'PL'){                           
                               //echo '<small class="label pull-left bg-orange">Planificada</small>';
                               echo bolita('Planificada', 'yellow');
                             }
                             if($f['estado'] == 'AS'){
                               // echo '<small class="label pull-left bg-yellow">Asignada</small>';
                               echo bolita('Asignada', 'purple');
                             }
                             if ($f['estado'] == 'C') {
                               //echo '<small class="label pull-left bg-blue">Curso</small>' ;
                               echo bolita('Curso', 'green');
                             }
                             if ($f['estado'] == 'T') {
                               //echo  '<small class="label pull-left bg-navy">Terminada</small>';
                               echo bolita('Terminada', 'blue');
                             }
                             if ($f['estado'] == 'CE') {
                               //echo  '<small class="label pull-left bg-green">Cerrada</small>';
                               echo bolita('Cerrada', 'default');
                             }  
                             if ($f['estado'] == 'CN') {
                               //echo  '<small class="label pull-left bg-black">Conforme</small>';
                               echo bolita('Conforme', 'black');
                             }
                                                  

                            echo '</td>';            
                         echo '</tr>'; 
                      //  } // if ($f['usrId'] == $usrId)
                      } // fin foreach($list as $f)   
                    } // fin if(count($list) > 0)

                ?>
              </tbody>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col 8 -->
  </div><!-- /.row -->

</section><!-- /.content -->

<!-- Modal Ver Orden de Trabajo Solicitud de Servicio-->
<div class="modal" id="verOtSolServicio" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Solicitud de servicio</h4>
      </div>
      <div class="modal-body">
        
        <div class="panel-group" id="accordionSolServicio" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOneSolServicio">
              <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordionSolServicio" href="#collapseOtSolServicio" aria-expanded="true" aria-controls="collapseOtSolServicio">
                  Datos
                </a>
              </h4>
            </div>
            <div id="collapseOtSolServicio" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOneSolServicio">
              <div class="panel-body">

                <div class="row">
                  <!-- <div class="col-xs-12 col-sm-6">
                    <label for="vIdOtSolServicio">Nº de SS:</label>
                    <input type="text" class="form-control " name="vIdOtSolServicio" id="vIdOtSolServicio" disabled>
                  </div> -->
                 
                  <div class="col-xs-12 col-sm-6">
                    <label for="vSector">Sector:</label>
                    <input type="text" class="form-control vSector" id="vSector" disabled>
                  </div>

                  <div class="col-xs-12 col-sm-6 col-md-6">
                    <label for="vEquipo">Equipo:</label>
                    <input type="text" class="form-control " name="vEquipo" id="vEquipo" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-6">
                    <label for="vArea">Area:</label>
                    <input type="text" class="form-control " name="vArea" id="vArea" disabled>
                  </div>
                  <div class="col-xs-12 col-sm-6 col-md-6">
                    <label for="vProceso">Proceso:</label>
                    <input type="text" class="form-control " name="vProceso" id="vProceso" disabled>
                  </div>
                  <div class="col-xs-12">
                    <label for="vDescripcion">Descripción:</label>
                    <Textarea class="form-control " name="vDescripcion" id="vDescripcion" disabled></Textarea>
                  </div>
                  
                  <div class="col-xs-12">
                    <label for="vFalla">Falla:</label>
                    <Textarea class="form-control " name="vFalla" id="vFalla" disabled></Textarea>
                  </div>  
                </div>

              </div>
            </div>
          </div> 
          <br>
          <div class="panel-group" id="panelAdj" role="tablist" aria-multiselectable="true">
          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOneSolServicio">
              <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#panelAdj" href="#collapseadj" aria-expanded="false" aria-controls="collapseadj">
                  Adjunto
                </a>
              </h4>
            </div>
            <div id="collapseadj" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOneSolServicio">
              <div class="panel-body">

                <div class="row">
                                 <div class="col-xs-12">
                                  <table class="table table-bordered" id="tbladjSolicitud"> 
                                    <thead>
                                      <tr>                                       
                                        <th>Archivo/s</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    <tr>                                     
                                      <td>
                                        <a id="adjunto" href="" target="_blank"></a> 
                                      </td>
                                    </tr>
                                    </tbody>
                                  </table>
                                </div>
                </div>

              </div>
            </div>
          </div> 

          <!-- vista herramientas -->
          <div class="panel panel-default" hidden>
            <div class="panel-heading" role="tab" id="headingThreePred">
              <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionBack" href="#collapseTareaSolicitudInsHerr" aria-expanded="false" aria-controls="collapseTareaSolicitudInsHerr">
                  Herramientas - Tareas - Insumos
                </a>
              </h4>
            </div>
            <div id="collapseTareaSolicitudInsHerr" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThreePred">
              <div class="panel-body">
                
                  <div class="row">
                      <div class="col-xs-12">
                        <div class="nav-tabs-custom">
                          <!--tabs -->
                          <ul class="nav nav-tabs" role="tablist">                
                            <li role="presentation" class="active"><a href="#herrSolicitu" aria-controls="profile" role="tab" data-toggle="tab">Herramientas</a></li>
                            <li role="presentation"><a href="#insumSolicitu" aria-controls="messages" role="tab" data-toggle="tab">Insumos</a></li>
                            <li role="presentation"><a href="#TabAdjuntoSolicitud" aria-controls="messages" role="tab" data-toggle="tab">Adjunto</a></li>                        
                          </ul>
                          <!-- /tabs -->
        
                          <!-- Tab panes -->
                          <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="herrSolicitu">
                              
                              <div class="row">
                                <div class="col-xs-12">
                                  <br>
                                  <table class="table table-bordered" id="tblherrsolicitud"> 
                                    <thead>
                                      <tr>             
                                        <th>Código</th>
                                        <th>Marca</th>
                                        <th>Descripcion</th>
                                        <th>Cantidad</th>
                                      </tr>
                                    </thead>
                                    <tbody></tbody>
                                  </table>  
                                </div>
                              </div><!-- /.row -->
                            </div> <!-- /.tabpanel #herramin--> 
        
                            <div role="tabpanel" class="tab-pane" id="insumSolicitu">
                            
                              <div class="row">
                              
                              </div><!-- /.row -->
                              <div class="row">
                                <div class="col-xs-12">
                                  <table class="table table-bordered" id="tblinsSolicitud"> 
                                    <thead>
                                      <tr>    
                                        <th>Código</th>
                                        <th>Descripcion</th>
                                        <th>Cantidad</th>
                                      </tr>
                                    </thead>
                                    <tbody></tbody>
                                  </table>  
                                </div>
                              </div><!-- /.row -->
                            </div><!--/#insum -->
        
                            <div role="tabpanel" class="tab-pane" id="TabAdjuntoSolicitud">
                              <div class="row" >  
                              
                                <div class="col-xs-12">
                                  <table class="table table-bordered" id="tbladjSolicitud"> 
                                    <thead>
                                      <tr>                                       
                                        <th>Archivo/s</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      
                                    </tbody>
                                  </table>
                                </div>
                  
                              </div>
                            </div><!--cierre de TabAdjunto--> 
                            
                          </div>  <!-- tab-content -->
                          
                        </div><!-- /.nav-tabs-custom -->
                      </div>
                    </div>
              </div>
            </div>
          </div>
          <!--  ./vista herramientas -->

        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>

  // VER OT 
  function mostrarOT(o){

    let idSS = $(o).closest('tr').attr('id');
    //console.log(idSS); 
    
    WaitingOpen('Obteniendo datos de OT...');
    // datos = getDataOtSolServicio(idSS, "Solicitud de Servicio");
    // fillModalViewSolServicio(datos);
    $.ajax({
        async: false,
        data: { idSS: idSS },
        dataType: 'json',
        method: 'POST',
        url: 'index.php/Sservicio/getSS',
      })
      .done( (data) => {
        // console.table(data);
        console.log(data);
        $("#vArea").val(data.AR);
        $("#vProceso").val(data.PR);
        $("#vEquipo").val(data.EQ_SEC[0].equipo);
        $("#vSector").val(data.EQ_SEC[0].sector);
        $("#vFalla").val(data.SS[0].causa);
        $("#vDescripcion").val(data.EQ_SEC[0].descripcion);
        if((data.SS[0].sol_adjunto != "")||(data.SS[0].sol_adjunto != null)){
          $("#adjunto").text("Archivo adjunto");
          $("#adjunto").attr("href", data.SS[0].sol_adjunto);

        }
        
      })
      .fail( () => alert( "Error al traer los datos de la OT." ) )
      .always( () => WaitingClose() );
    $('#verOtSolServicio').modal('show');
    WaitingClose();
  }

  // Trae datos de Solicitud de Servicios con origen Backlog
  function getDataOtSolServicio(idOt, idSolServicio, origen) {
      WaitingOpen('Cargando datos...');
      var datos = null;
      $.ajax({
        async: false,
        data: { idOt:idOt, idSolServicio:idSolServicio },
        dataType: 'json',
        method: 'POST',
        url: 'index.php/Otrabajo/getViewDataSolServicio',
      })
      .done( (data) => {
        console.table(data);
        datos = {
          //Panel datos de OT
          'id_ot'          : data['solicitud'][0]['id_orden'],
          'nro'            : data['solicitud'][0]['nro'],
          'descripcion_ot' : data['solicitud'][0]['descripcionFalla'],
          'grupo'          : data['solicitud'][0]['grupodescrip'],
          'fecha_program'  : data['solicitud'][0]['fecha_program'],
          'fecha_inicio'   : data['solicitud'][0]['fecha_inicio'],
          'fecha_terminada'  : data['solicitud'][0]['fecha_terminada'], 
          'estado'         : data['solicitud'][0]['estado'],
          'sucursal'       : data['solicitud'][0]['descripc'],
          'nombreprov'     : data['solicitud'][0]['provnombre'],
          'origen'         : origen,          
          'asignado'       : data['solicitud'][0]['usrLastName']+' '+data['solicitud'][0]['usrLastName'],
          'estado'         : data['solicitud'][0]['estado'],
          //Panel datos de equipos
          'codigo'         : data['solicitud'][0]['codigo'],
          'marca'          : data['solicitud'][0]['marca'],
          'ubicacion'      : data['solicitud'][0]['ubicacion'],
          'descripcion_eq' : data['solicitud'][0]['descripcionEquipo'],
          'comp_equipo'    : data['solicitud'][0]['compEquipo'],
          'solServicio'   : data['solicitud'][0]['solServicio']
        };
        
        
        var herram = data['herramientas'];
        var insum = data['insumos'];
        var adjunto = data['adjunto'];
         

        $('#tblherrsolicitud tbody tr').remove();
        for (var i = 0; i < herram.length; i++) {
          var tr = "<tr id='"+herram[i]['herrId']+"'>"+          
          "<td>"+herram[i]['herrcodigo']+"</td>"+
          "<td>"+herram[i]['herrmarca']+"</td>"+
          "<td>"+herram[i]['herrdescrip']+"</td>"+
          "<td>"+herram[i]['cantidad']+"</td>"+                   
          "</tr>";
          $('#tblherrsolicitud tbody').append(tr);
        }
        $('#tblinsSolicitud tbody tr').remove();
        for (var i = 0; i < insum.length; i++){                                             
          var tr = "<tr id='"+insum[i]['artId']+"'>"+
         
          "<td>"+insum[i]['artBarCode']+"</td>"+
          "<td>"+insum[i]['artDescription']+"</td>"+
          "<td>"+insum[i]['cantidad']+"</td>"+                   
          "</tr>";
          $('#tblinsSolicitud tbody').append(tr);
        }   
        recargaTablaAdjuntoSolic(adjunto);  
      })
      .fail( () => alert( "Error al traer los datos de la OT." ) )
      .always( () => WaitingClose() );
      return datos;
    }

  // Agregar SS Nueva
  $('#btnAdd').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Sservicio/nuevaSS/<?php echo $permission; ?>");
    WaitingClose();
  });
</script>

<!-- carga solicitudes inactivas -->
<script>
 $('#activarSol').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Sservicio/get_SolicTerminada/<?php echo $permission; ?>");
    WaitingClose();
  });
</script>
<!-- / carga solicitudes inactivas -->

<script>
  // Elimina Solicitud - Chequeado
  $('.fa-times-circle').click( function eliminarSolicitud(){
    if (!confirm("Realmente desea eliminar esta Solicitud?")){
      return;
    }else{
        var id_solic = parseInt($(this).parent('td').parent('tr').attr('id'));
        
        $.ajax({
                type: 'POST',
                data: { id_solic: id_solic},
                url: 'index.php/Sservicio/elimSolicitud',
                success: function(result){
                            WaitingClose('Guardado exitosamente...');
                            //var permisos = '<?php //echo $permission; ?>';
                            var permisos = 'Add-Edit-Del-View-Asignar-Finalizar-OP-';
                            cargarView('Sservicio', 'index', permisos) ;                        
                      },
                error: function(result){
                      WaitingClose();
                      alert("Error en guardado...");
                    },
                dataType: 'json'
              });
    }
  });
  // Imprime Solicitud de Servicios - Chequeado
  $(".fa-print").click(function (e) {

    e.preventDefault();
    var idservicio = $(this).closest('tr').attr('id');
    console.log("El id de solicitud de servicio al imprimir es :");
    console.log(idservicio);

    $.ajax({
        type: 'POST',
        data: { idservicio: idservicio},
        url: 'index.php/Sservicio/getsolImp',
        success: function(data){
                    data = JSON.parse(data,true);
                    console.log(data);
                    console.log(data.datos.sec);
                    // console.log(data['f_solicitado']);
                    //alert("entre");
                    var fecha = new Date(data.datos.f_solicitado);
                    var day = fecha.getDate();
                    var month = fecha.getMonth() + 1;
                    var year = fecha.getUTCFullYear();
                    fecha = day + ' - ' + month + ' - ' + year;

                    datos={
                      'idservicio':idservicio,
                      'f_solicitado':data.datos.f_solicitado,
                      'solicitante':data.datos.solicitante,
                      'hora_sug':data.datos.hora_sug,
                      'codigo':data.datos.codigo,
                      //'descripcion':data['datos'][0]['descripcion'],
                      'ubicacion':data.datos.ubicacion,
                      'sector':data.datos.sec,
                      'grupo':data.datos.degr,
                      'causa':data.datos.causa,
                    };


                    var  texto =
                        '<div class="" id="vistaimprimir">'+
                          '<div class="container">'+
                            '<div class="thumbnail">'+

                              '<div class="caption">'+
                                '<div class="row" >'+
                                  '<div class="panel panel-default">'+
                                    '<div class="form-group">'+
                                      '<h3 class="text-center" align="center"></h3>'+
                                    '</div>'+
                                    '<hr/>'+
                                    '<div class="panel-body">'+
                                      '<div class="container">'+
                                        '<div class="thumbnail">'+
                                          '<div class="row">'+
                                            '<div class="col-sm-12 col-md-12">'+
                                              '<table width="100%" style="text-align:justify">'+
                                                '<tr>'+
                                                '<tr>'+
                                                  '<td  colspan="1"  align="left" valign="top">'+
                                                    '<div class="text-left"> <img src="img/logo.jpg" width="280" height="80" />'+
                                                     '</div>'+
                                                    '</td>'+
                                                    '<td>'+     
                                                    '<div class="col-xs-4" align="rigth">Solicitud Nº: '+datos.idservicio+
                                                      
                                                    '</div>'+

                                                    '<div class="col-xs-4">Fecha: '+fecha+
                                        
                                                    '</div>'+
                                                  '</td>'+

                                                '</tr>'+
                                                '<tr>'+
                                                  '<td >'+
                                                  '</td>'+
                                                '<tr>'+
                                                  '<td>'+
                                                  '<td/>'+
                                                  '<td height="4" colspan="4">'+
                                                    '<div class="col-xs-8">'+
                                                    '</h3>'+
                                                    '</div>'+
                                                  '</td>'+
                                                '</tr>'+
                                                '<tr>'+
                                                  '<td height="4" colspan="4">'+
                                                    '<div class="col-md-3 col-md-offset-9">Solicitado :  '+
                                                    '<br>'+
                                                    '<textarea class="form-control" id="solicitante" name="solicitante" style="padding-left:15px"  value='+datos.solicitante+' rows="2" cols="98">'+datos.solicitante+'</textarea>'+
                                                    '</div>'+
                                                      
                                                  '</td'+
                                                '</tr>'+
                                                
                                                '<tr>'+
                                                  '<td>'+
                                                  '<br>'+
                                                 
                                                    '<div class="col-md-3 col-md-offset-9">Equipo: '+
                                                    '<textarea class="form-control" id="equipo" name="equipo" style="padding-left:15px"  value='+datos.codigo+' rows="2" cols="46">'+datos.codigo+'</textarea>'+
                                                    '</div>'+
                                                    '<br>'+
                                                   
                                                    '<div class="col-md-3 col-md-offset-9">Ubicacion: '+
                                                    '<textarea class="form-control" id="ubicacion" name="ubicacion" style="padding-left:15px"  value='+datos.ubicacion+' rows="2" cols="46">'+datos.ubicacion+'</textarea>'+
                                                      
                                                    '</div>'+
                                                  '</td>'+
                                                 // '<br>'+
                                                  '<td>'+
                                                  '<br>'+
                                                  //'<br>'+
                                                                                       
                                                    '<div class="col-md-3 col-md-offset-9">Sector: '+
                                                      '<textarea class="form-control" id="sector" name="sector" style="padding-left:15px"  value='+datos.sector+' rows="2" cols="46">'+datos.sector+'</textarea>'+
                                                      
                                                    '</div>'+
                                                    '<br>'+
                                                    //'<br>'+
                                                    
                                                    
                                                    '<div class="col-md-3 col-md-offset-9">Grupo: '+
                                                    '<textarea class="form-control" id="grupo" name="grupo" style="padding-left:15px"  value='+datos.grupo+' rows="2" cols="46">'+datos.grupo+'</textarea>'+

                                                   '</td>'+
                                                '</tr>'+
                                                '</tr>'+
                                              '</table>'+
                                            '</div>'+
                                          '</div>'+
                                          '<br>'+
                                          '<div class="row">'+
                                            '<div class="col-xs-12">Causa: '+
                                            
                                            '</div>'+
                                            '<br>'+
                                            '<div class="col-xs-12">'+
                                              '<textarea class="form-control" id="descripcion" name="descripcion" style="padding-left:15px"  value='+datos.causa+' rows="4" cols="98">'+datos.causa+'</textarea>'+
                                            '</div>'+ 
                                          '</div>'+
                                          '<br>'+
                                          '<div class="row">'+
                                          '<div class="col-xs-3">'+
                                                                         
                                            
                                          // causa 93 '<div class="col-sm-12 col-md-12">'+
                                            
                                              //'<div class="col-sm-1>'+
                                                '<label for="inputPassword3" >Realizado:</label>'+
                                                
                                                  ' <input type="text" class="form-control" id="inputPassword3" size="32">'+
                                                '</div>'+
                                                '<br>'+
                                              
                                              '<div class="col-xs-3">'+
                                                '<label for="inputPassword3" >Supervisado:</label>'+
                                                
                                                  ' <input type="text" class="form-control" id="inputPassword3" size="30">'+
                                                '</div>'+
                                                '<br>'+
                                              
                                              
                                              '<div class="col-xs-3" align="rigth">'+
                                                '<label for="inputPassword3"  control-label">Fecha Realizado:</label>'+
                                         
                                                  ' <input type="text" class="form-control" id="inputPassword3" size="27">'+
                                                '</div>'+
                                                '<br>'+
                                              
                                              '<div class="col-xs-3">'+
                                              '<label for="inputPassword3" >Conforme servicio:</label>'+
                                              
                                                
                                                  '__________________________________'+
                                                '</div>'+    
                                            
                                          '</div>'+
                                          
                                          '<br>'+
                                          '<br>'+
                                          //
                                          '<div class="row">'+
                                            '<div class="col-xs-10 col-xs-offset-1" style="text-align: center">'+
                                           
                                              '<table  class="table table-bordered table-hover" style="text-align: center" >'+ //class="table table-bordered"
                                             
                                                '<tr align="center" bottom="middle>'+
                                                  '<td align="center" colspan="1" >'+
                                                    '<div class="text-center">'+
                                                    ' <img src="img/logo.jpg" width="280" height="80" align="right"/>'+
                                                    '</div>'+
                                                  '</td>'+
                                                  //'<br>'+
                                                '</tr>'+
                                                '<tr>'+
                                                  '<td><h3> Vale de Materiales:'+'</h3>'+
                                                  '</td>'+
                                                '</tr>'+
                                              '</table>'+
                                            '</div>'+
                                          '</div>'+
                                          //'<br>'+
                                          //style="text-align: center"
                                          
                                          '<div class="row">'+
                                            '<div class="col-xs-10 col-xs-offset-1 text-center">'+
                                           
                                              '<table class="table table-bordered"  border="1px solid black"  >'+ //class="table table-bordered"
                                             
                                                '<tr colspan="8">'+
                                                  '<th width="2%">Item  (Tachar sino corresponde)</th>'+
                                                  '<th width="15%">Codigo</th>'+ 
                                                  '<th width="40%">Descripcion</th>'+
                                                  '<th width="5%">Cantidad</th>'+
                                                '</tr>'+
                                                '<tr>'+
                                                  '<td style="text-align: center" >1</td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                '</tr>'+
                                                '<tr>'+
                                                  '<td style="text-align: center" >2</td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                '</tr>'+
                                                '<tr>'+
                                                  '<td style="text-align: center" >3</td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                '</tr>'+
                                                '<tr>'+
                                                  '<td style="text-align: center" >4</td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                '</tr>'+
                                                '<tr>'+
                                                  '<td style="text-align: center" >5</td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                  '<td><br></td>'+
                                                '</tr>'+
                                                
                                              '</table>'+ 
                                            '</div>'+
                                          '</div>'+
                                          '<br>'+
                                          '<div class="row">'+
                                            '<div class="col-sm-12 col-md-12">'+
                                              '<div class="col-sm-2-2">Entrega (Firma y aclaracion): '+ 
                                              '<input type="text"  size="30">'+
                                                      
                                              '</div>'+
                                              '<br>'+
                                              '<div class="col-sm-2-2">Recibe (Firma y aclaracion): '+ '<input type="text"  size="30">'+
                                             
                                              '</div>'+
                                            '</div>'+
                                          '</div>'+                                                            

                                        '</div>'+
                                      '</div>'+
                                    '</div>'+
                                   
                                  '</div>'+
                                '</div>'+
                              '</div>'+
                              '<style>'+
                                 '.table, .table>tr, .table>td {border: 2px solid #f4f4f4;} '+
                              '</style>';


                    var mywindow = window.open('', 'Imprimir', 'height=700,width=900');
                    mywindow.document.write('<html><head><title></title>');
                    //mywindow.document.write('<link rel="stylesheet" href="main.css" type="text/css" />');
                    //mywindow.document.write('<link rel="stylesheet" href="main.css">
                    mywindow.document.write('</head><body onload="window.print();">');
                    mywindow.document.write(texto);
                    mywindow.document.write('</body></html>');

                    mywindow.document.close(); // necessary for IE >= 10
                    mywindow.focus(); // necessary for IE >= 10
                    //mywindow.print();
                    //mywindow.close();
                    return true;

                },

        error: function(result){
                  console.log(result);
                  console.log("error en la vistaimprimir");
                },
                //dataType: 'json'
    });
  });
  // Levanta imagen de solicitud - Chequeado
  $('.fa-picture-o').click(function(){
    $('#imgSolServ').attr('src',''); 
    $('#resp').remove();    

    var imag = $(this).data('imagen');
    if (imag != 'assets/files/orders/sinImagen.jpg') {
      $('#imgSolServ').attr('src',imag); 
    }else{
      $('.imagen').append('<h5 id="resp">Sin imagen cargada.<h5>');
    }
  });
  // Datepicker  
  $("#vstFecha").datepicker({    
    firstDay: 0      
  }).datepicker("setDate", "+1d"); // agrega la cantidad de dias o meses a partir de hoy

  $("#fecha_conformidad").datepicker({
    dateFormat: 'yy/mm/dd',
    firstDay: 1
  }).datepicker("setDate", new Date());

  // Trae Sectores y autocompleta el campo
  var dataF = function () {
    var tmp = null;
    $.ajax({
      'async': false,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "Sservicio/getSector",
      'success': function (data) {
        tmp = data;
      }
    });
    return tmp;
  }();  
  $(".buscSector").autocomplete({
    source: dataF,
    delay: 100,
    minLength: 1,
    focus: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox
      $(this).val(ui.item.label);
    },
    select: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox and hidden field
      $(this).val(ui.item.label);
      $("#idSector").val(ui.item.value);
      $("#equipSelec").html("");
      // guardo el id de sector
      var idSect =  $("#idSector").val();
      getEquiSector(idSect);
      //console.log("id sector en autocompletar: ");
      //console.log(ui.item.value);
    },
  }); 
  //  llena select de equipos segun sector
  function getEquiSector(idSect){
    var id =  idSect;
    console.log("id de sector para traer equipos: "+id);
    $.ajax({
      'data' : {id_sector : id },
      'async': true,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "Sservicio/getEquipSector",
      'success': function (data) {
        console.log("Entro por getEquiSector ok");
        console.table(data);//[0]['id_equipo']);
        // Asigna opciones al select Equipo en modal
        //console.log("length: "+data.length);
        var $select = $("#equipSelec");
        for (var i = 0; data.length; i++) {
          $select.append($('<option />', { value: data[i]['id_equipo'], text: data[i]['descripcion'] }));
        }
      },
      'error' : function(data){
        console.log('Error en getEquiSector');
        console.table(data);
      },
    });
  }
  // trae tareas estandar para llenar select
  // getTareasStandar();
  // function getTareasStandar(){
  //   $.ajax({      
  //     'async': true,
  //     'type': "POST",
  //     'global': false,
  //     'dataType': 'json',
  //     'url': "Sservicio/getTareasStandar",
  //     'success': function (data) {
        
  //       console.table(data);        
  //       var $select = $("#tareaSelec");
  //       for (var i = 0; data.length; i++) {
  //         $select.append($('<option />', { value: data[i]['id_tarea'], text: data[i]['descripcion'] }));
  //       }
  //     },
  //     'error' : function(data){
  //       console.log('Error en Traer tareas...');
  //       console.table(data);
  //     },
  //   });
  // }

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
$("#vstsolicita").autocomplete({
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
    $("#id_vstsolicita").val(ui.item.value);                 
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



  // Guardado de datos y validaciones
  $("#btnSave").click(function(){

    WaitingOpen('Generando Solcitud');
  	var hayError = false;
    if($('#nombre').val() == '')
    {
    	hayError = true;
    }
    if($('#equipId').val() == '')
    {
      hayError = true;
    }
    if($('#vstsolicita').val() == '')
    {
      hayError = true;
    }
    if($('#vstNote').val() == '')
    {
      hayError = true;
    }
    if(hayError == true){
    	$('#error').fadeIn('slow');
    	return;
    }

    $('#error').fadeOut('slow');
    $('#modalservicio').modal('hide');

    var permisos = $('#permission').val();

    	$.ajax({
          	type: 'POST',
          	data: {
                    equip: $('#equipSelec').val(),
                    solici: $('#vstsolicita').val(),
                    fecha: $('#vstFecha').val(),
                    hora: $('#vstHora').val(),
                    min: $('#vstMinutos').val(),
                    falla: $('#vstNote').val(),
                    tarea: $('#tareaSelec').val()
                  },
        		url: 'index.php/Sservicio/lanzarProcesoBPM',
        		success: function(data){
                    WaitingClose();
                    console.log(data);
                    if (data.status == true){
                      //alert("Solicitud generada exitosamente");
                     
                      cargarView('Sservicio', 'index', permisos) ;           
                    } else{             
                        alert("Falla: "+data.msj);
                    }                   
        					},
        		error: function(data){
        					  WaitingClose();
        					  alert("Error: "+data.msj);         
        				},
            dataType: 'json'
    		});
  });
  //Guardar conformidad 
  $('.fa-thumbs-up').click(function(){
      var id = $(this).parent('td').parent('tr').attr('id'); 
      $('.clear').val('');
      $('#id_sol').val(id);

  });
  function guardarConf(){
    
    var hayError = false;
    if($('#fecha_conformidad').val() == '')
    {
      hayError = true;
    }
    if($('#id_sol').val() == '')
    {
      hayError = true;
    }    

    if(hayError == true){
      $('#errorconf').fadeIn('slow');
      return;
    }

    $('#errorconf').fadeOut('slow');

    WaitingOpen('Guardando...');
    var data = $('#formConform').serializeArray();
    $.ajax({
            type: 'POST',
            data: data,
            url: 'index.php/Sservicio/confSolicitud',
            success: function(result){
                        WaitingClose('Guardado exitosamente...');
                        var permisos = '<?php echo $permission; ?>';
                        cargarView('Sservicio', 'index', permisos) ;
                        //alert("guardado con exito");
                  },
            error: function(result){
                  WaitingClose();
                  alert("Error en guardado...");
                },
            dataType: 'json'
        });
  }

  // Datatable
  // $(function () {

  //   $('#servicio').DataTable({
  //     "aLengthMenu": [ 10, 25, 50, 100 ],
  //     "columnDefs": [ {
  //       "targets": [ 0 ], 
  //       "searchable": false
  //     },
  //     {
  //       "targets": [ 0 ], 
  //       "orderable": false
  //     } ],
  //     "order": [[1, "asc"]],
  //   });

  // });

  // Datatables
  $('#servicio').DataTable({
    <?php echo (!DT_SIZE_ROWS ? '"paging": false,' : null) ?>

    "aLengthMenu": [ 10, 25, 50, 100 ],
    "columnDefs": [ 
      {
        "targets": [ 0 ], 
        "searchable": false,
      },
      {
        "targets": [ 0 ], 
        "orderable": false,
      },
      { 
        "targets": [ 1, 8 ],
        "type": "num",
      }
    ],
    "order": [[1, "desc"]],
  });
</script>


<!-- Modal Solicitud Nueva-->
<div class="modal" id="modalservicio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Solicitud Servicios</h4>
      </div>
      <div class="modal-body" id="modalBodyservicio">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos...
            </div>
          </div>
        </div>
        <style>
          .ui-autocomplete{
              z-index:1050;
          }
        </style>
        <div class="row">
          <div class="col-xs-12 col-md-3">
              <label style="margin-top: 7px;">Sector <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-md-9">
              <input type="text" class="form-control buscSector" placeholder="Buscar Sector..." id="buscSector" name="buscSector">
              <input type="text" class="hidden idSector" id="idSector" name="idSector">
          </div>
        </div><br>

        <div class="row">
          <div class="col-xs-12 col-md-3">
            <label style="margin-top: 7px;">Equipo <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-md-9">
              <select name="equipSelec" class="form-control equipSelec" id="equipSelec">
                <option value="-1" placeholder="Seleccione..."></option>
              </select>
          </div>
        </div><br>

        <div class="row">
          <div class="col-xs-12 col-md-3">
            <label style="margin-top: 7px;">Solicitante: </label>
          </div>
          <div class="col-xs-12 col-md-9">
              <input placeholder="Buscar Nombre..." class="form-control" rows="3" id="vstsolicita" value="">
              <input type="hidden" class="form-control" rows="3" id="id_vstsolicita" value="">
          </div>
        </div><br>

        <div class="row">
          <div class="col-xs-12 col-md-3">
            <label style="margin-top: 7px;">Fecha Sugerido <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-md-9">
              <input class="form-control datepicker" placeholder="dd-mm-aaaa" name="datepicker" id="vstFecha">
          </div>
        </div><br>

        <div class="row">
          <div class="col-xs-12 col-md-3">
            <label style="margin-top: 7px;">Horario sugerido <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-5 col-md-4">
              <select class="form-control" id="vstHora" style="width: 100%;">
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
              </select>
          </div>
          <div class="col-xs-2 col-md-1">
            <center>:</center>
          </div>
          <div class="col-xs-5 col-md-4">
              <select class="form-control select_equip" id="vstMinutos" style="width: 100%;">
                <option value="00">00</option>
                <option value="15">15</option>
                <option value="30">30</option>
                <option value="45">45</option>
              </select>
          </div>
        </div><br>

        <div class="row">
          <!-- <div class="col-xs-12 col-md-3">
            <label style="margin-top: 7px;">Tarea <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-md-9">
              <select name="tareaSelec" class="form-control tareaSelec" id="tareaSelec">
                <option value="-1" placeholder="Seleccione...">Seleccione tarea...</option>
              </select>
          </div> -->
          <div class="col-xs-12 col-md-3">
            <label style="margin-top: 7px;">Falla <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-md-9">
              <textarea placeholder="Agregar una Nota" class="form-control" rows="3" id="vstNote" value=""></textarea>
          </div>
        </div>
      </div> <!--/ .modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
      </div>
    </div> <!-- / .modal-conten -->
  </div>
</div>

<!-- Modal Conformidad -->
<div class="modal" id="modalConformidad" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
      <div class="row">
        <div class="col-xs-12">
          <div class="alert alert-danger alert-dismissable" id="errorconf" style="display: none">
                <h4><i class="icon fa fa-ban"></i> Error!</h4>
                Revise que todos los campos esten completos
            </div>
        </div>
      </div>

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Conformidad</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle"> 
        <form id="formConform">
          <div class="row">
            <div class="col-xs-12">
              <label for="">Fecha <!--<strong style="color: #dd4b39">*</strong>:--></label>
              <input type="text" id="fecha_conformidad" name="fecha_conformidad" class="form-control">
              <input type="hidden" id="id_sol" name="id_sol" class="form-control clear">
            </div>
            <div class="col-xs-12">
              <label for="">Observaciones<strong style="color: #dd4b39">*</strong>:</label>
              <textarea class="form-control clear" id="observ_conformidad" name="observ_conformidad" placeholder="Observaciones..."></textarea>
            </div> 
          </div>      
        </form>
      </div> 
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>       
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardarConf()">Guardar</button>
      </div>  <!-- /.modal footer -->

    </div>  <!-- /.modal-content --><!-- /.modal-body -->
  </div> <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal Conformidad -->

<!-- Modal Foto-->
<div class="modal" id="foto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Imagen de Solicitud de Servicio</h4>
      </div>
      
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12 imagen">
            <img id="imgSolServ" src="" style="max-width: 300px; float: center;">
          </div>
        </div>        
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>
