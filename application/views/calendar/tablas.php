<?php 
  setlocale(LC_ALL,"es_ES");
  $month = date("F", mktime(0, 0, 0, $mes, 10));
  $meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
  $monthSpanish = $meses[$mes-1];
  $mostrarFecha = $monthSpanish .' '. $year;
 //dump($permission, 'permisos');
  if (strpos($permission,'Correctivo') !== false){
?>
<!-- CORRECTIVO -->
<div class="col-md-6">
  <div class="box collapsed-box">

    <div class="box-header">
      <h3 class="box-title">Solicitud de Servicios (<?php echo $mostrarFecha ?>)</h3>
      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="">
          <i class="fa fa-plus"></i></button>
        </div>
      </div><!-- /.box-header -->

      <div class="box-body">
        <table id="correctivo" class="table table-bordered table-hover">
          <thead>
            <tr>
              <th style="text-align: center" class="hidden">Id Equipo</th>
              <th style="text-align: center" class="hidden">Id predictivo</th>
              <th style="text-align: center">OT</th>
              <th style="text-align: center">ID Solic.</th>           
              <th style="text-align: center">Codigo</th>
              <th style="text-align: center">Causa</th>
              <!-- <th style="text-align: center">sector</th> -->
              <!--<th style="text-align: center">Tipo</th>-->
              <th style="text-align: center">F.Solicitado</th>
            </tr>
          </thead>
          <tbody>
            <?php
            //dump_exit($list4);
            if( $list4!=false && count($list4) > 0) 
            {
              foreach( $list4 as $c ) 
              {
                $id_sol = $c['id_solicitud'];
                $id_eq = $c['id_equipo'];
                echo '<tr id="'.$id_sol.'" data-idequipo="'.$id_eq.'" >';
                      //echo "<tr >";
                echo "<td>";
                      
                if ($c['estado'] != 'OT') {
                  echo '<i class="fa fa-stop-circle" id="cargOrden" style="color: #A4A4A4; cursor: pointer; margin-left: 15px;" title="Orden de Trabajo" data-toggle="modal" data-target="#modal-correctivo" onclick="fill_Correc('.$c['id_solicitud'].')"></i>';
                } else {
                  echo '<i class="fa fa-stop-circle-o" id="cargOrden" style="color: #A4A4A4; cursor: pointer; margin-left: 15px;" title="Orden Generada"></i>';
                }                          
                            
                echo "</td>";
                      // 1 // id equipo
                echo "<td style='text-align: center' class='hidden'>".$c['id_equipo']."</td>";
                      // 2 // id solicitud reparacion
                echo "<td style='text-align: center' class='hidden'>".$c['id_solicitud']."</td>";

                echo "<td style='text-align: center'>".$id_sol."</td>";
                      // 3 // codigo de equipo
                echo "<td style='text-align: center'>".$c['codigo']."</td>";
                      // 4 // descripcion causa solicitud
                echo "<td style='text-align: center'>".$c['causa']."</td>";
                      // 5 // fecha guardada anteriromente
                echo "<td style='text-align: center'>".$c['f_solicitado']."</td>";
                echo "</tr>";
              }
            }
            ?>
          </tbody>
        </table>
      </div><!-- /.box-body -->

    </div><!-- /.box collapsed-box-->
  </div><!-- /.col-md-6 -->
  <?php
}
?>

<?php     
  if (strpos($permission,'Preventivos') !== false){
?>
<!-- PREVENTIVO -->
<div class="col-md-6">
  <div class="box collapsed-box">

    <div class="box-header">
      <h3 class="box-title">Preventivo (<?php echo $mostrarFecha ?>)</h3>
      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="">
          <i class="fa fa-plus"></i></button>
        </div>
      </div><!-- /.box-header -->

      <div class="box-body">
        <table id="preventivo" class="table table-bordered table-hover">
          <thead>
            <tr>
              <th style="text-align: center" class="hidden">Id Preventivo</th>
              <th style="text-align: center" class="hidden">Id Equipo</th>
              <th style="text-align: center" class="hidden">Id tarea</th>
              <th style="text-align: center">OT</th>
              <th style="text-align: center">Equipo</th>
              <th style="text-align: center">Tarea</th>
              <th style="text-align: center">Fecha</th>
              <!-- <th style="text-align: center">Horas H.</th> -->
              <th style="text-align: center">Periodo</th>
              <th style="text-align: center">Frec.</th>
            </tr>
          </thead>
          <tbody>
            <?php
            if($list3!=false && count($list3) > 0) 
            {
              foreach( $list3 as $p ) 
              {
                //echo "<tr>";
                echo '<tr id="'.$p['prevId'].'" >';
                // 0
                echo "<td>";
                //if (strpos($permission,'Del') !== false) {
                echo '<i class="fa fa-square" id="cargOrden" style="color: #A4A4A4; cursor: pointer; margin-left: 15px;" title="Orden de Trabajo" data-toggle="modal" data-target="#modal-preventivo" onclick="fill_Prevent('.$p['prevId'].')"></i>';
                //}
                echo "</td>";                           
                // 1  //id de preventivo
                echo "<td style='text-align: center' data-prevId".$p['prevId']." class='hidden'>".$p['prevId']."</td>";
                // 2  //id de equipo
                echo "<td style='text-align: center' class='hidden'>".$p['id_equipo']."</td>";
                // 3  //id de tarea
                echo "<td style='text-align: center' class='hidden'>".$p['id_tarea']."</td>";
                // 4  //codigo equipo
                echo "<td style='text-align: center'>".$p['codigo']."</td>";
                // 5  //descrip prevent
                echo "<td style='text-align: center'>".$p['descripcion']."</td>";
                // 6  //ult prevent
                echo "<td style='text-align: center'>".$p['ultimo']."</td>";
                // 7  //horas hombre
                //echo "<td style='text-align: center'>".$p['horash']."</td>";
                // 8  //periodo
                switch ($p['perido']) {
                  case '1':
                          $periodo = 'Diario';
                    break;
                  case '2':
                          $periodo = 'Mensual';
                    break;
                  case '3':
                          $periodo = 'Semestral';
                    break;
                  case '4':
                          $periodo = 'Anual';
                    break;
                  
                  default:
                          $periodo = 'Diario';
                    break;
                }
                echo "<td style='text-align: center'>".$periodo."</td>";               
                // 9  //frecuencia
                echo "<td style='text-align: center'>".$p['cantidad']."</td>";
              echo "</tr>";
            }
          }
          ?>
        </tbody>
      </table>
    </div><!-- /.box-body -->

  </div><!-- /.box collapsed-box-->
</div><!-- /.col -->

<!-- PREVENTIVO P/HORAS-->
<div class="col-md-6">
  <div class="box collapsed-box">

    <div class="box-header">
      <h3 class="box-title">Preventivo por ciclos/horas (<?php echo $mostrarFecha ?>)</h3>
      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="">
          <i class="fa fa-plus"></i></button>
        </div>
      </div><!-- /.box-header -->

      <div class="box-body">
        <table id="preventivo_horas" class="table table-bordered table-hover">
          <thead>
            <tr>
              <th class="hidden">Id Preventivo</th>
              <th class="hidden">Id Equipo</th>
              <th class="hidden">Id tarea</th>
              <th style="text-align: center">OT</th>
              <th style="text-align: center">Equipo</th>
              <th style="text-align: center">Tarea</th>
              <th style="text-align: center">Fecha</th>
              <!-- <th style="text-align: center">Horas H.</th> -->
              <th style="text-align: center">Periodo</th>
              <th style="text-align: center">Frec.</th>
              <th class="hidden">Próximo Servicio</th>
              <th class="hidden">Última Lectura</th>
            </tr>
          </thead>
          <tbody>
            <?php
            if( $list!=false && count($list) > 0) 
            {
              //dump_exit($list);
              foreach( $list as $p ) 
              {

                if( $p['tipoAlerta'] == 'A' ) { $classAlerta = 'bg-yellow color-palette'; }
                if( $p['tipoAlerta'] == 'R' ) { $classAlerta = 'bg-red-active color-palette'; }
                
                echo "<tr class='<?php echo $classAlerta ?>'>";
                  // 0
                  echo "<td>";
                   // if (strpos($permission,'Del') !== false) {
                        echo '<i class="fa fa-history" id="cargOrden" style="color: #A4A4A4; cursor: pointer; margin-left: 15px;" title="Orden de Trabajo" data-toggle="modal" data-target="#modal-preventivoH"></i>';
                   // }
                  echo "</td>";
                  // 1  //id de preventivo
                  echo "<td class='hidden'>".$p['prevId']."</td>";
                  // 2  //id de equipo
                  echo "<td class='hidden'>".$p['id_equipo']."</td>";
                  // 3  //id de tarea
                  echo "<td class='hidden'>".$p['id_tarea']."</td>";
                  // 4  //codigo equipo
                  echo "<td style='text-align: center'>".$p['codigo']."</td>";
                  // 5  //descrip prevent
                  echo "<td style='text-align: center'>".$p['descripcion']."</td>";
                  // 6  //prox prevent
                  echo "<td style='text-align: center'>".$p['prox']."</td>";
                  // 7  //horas hombre
                  //echo "<td style='text-align: center'>".$p['horash']."</td>";
                  // 8  //periodo
                  switch ($p['perido']) {
                    case '5':
                            $periodo = 'Horas';
                      break;
                    case '6':
                            $periodo = 'Ciclos';
                      break;
                    case '7':
                            $periodo = 'Km';
                      break; 
                    default:
                            $periodo = 'Horas';
                      break;
                  }
                  echo "<td style='text-align: center'>".$periodo."</td>";
                  // 9  //frecuencia
                  echo "<td style='text-align: center'>".$p['cantidad']."</td>";
                  // 10  //proximo Servicio
                  echo "<td class='hidden'>".$p['proximoServicio']."</td>";
                  // 11  //ultima Lectura
                  echo "<td class='hidden'>".$p['ultimaLectura']."</td>";
                echo "</tr>";
              }
            }
            ?>
          </tbody>
        </table>
      </div><!-- /.box-body -->

    </div><!-- /.box collapsed-box-->
  </div><!-- /.col --> 
<?php
} // cierre de if preventivos
?>

<?php     
  if (strpos($permission,'Backlog') !== false){
?>

<!-- TAREAS BACKLOG -->
<div class="col-md-6">
  <div class="box collapsed-box">

    <div class="box-header">
      <h3 class="box-title">Backlog (<?php echo $mostrarFecha ?>)</h3>
      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="">
          <i class="fa fa-plus"></i></button>
        </div>
      </div><!-- /.box-header -->

      <div class="box-body">
        <table id="backlog" class="table table-bordered table-hover">
          <thead>
            <tr>
              <th style="text-align: center" class="hidden">Id Equipo</th>
              <th style="text-align: center" class="hidden">Id Backlog</th>    
              <th style="text-align: center">OT</th>
              <th style="text-align: center">ID Solic.</th>
              <th style="text-align: center">Codigo</th>
              <th style="text-align: center">Causa</th>
              <th style="text-align: center">Fecha</th>
              <th style="text-align: center" class="hidden">Id tarea</th>
              <th style="text-align: center" class="hidden">Duracion</th>
            </tr>
          </thead>
          <tbody>
            <?php
            //dump_exit($list2);
            if( $list2!=false && count($list2) > 0) 
            {
              foreach( $list2 as $b ) 
              {
          
                echo "<tr>";
                echo "<td>";
  
                  if($b['estado'] != 'OT'){
                    echo '<i class="fa fa-check-square" id="cargOrden" style="color: #A4A4A4; cursor: pointer; margin-left: 15px;" title="Orden de Trabajo" data-toggle="modal" data-target="#modal-backlog" onclick="fill_Backlog('.$b['backId'].')"></i>';
                  }else{
                    echo '<i class="fa fa-check-square-o" id="cargOrden" style="color: #A4A4A4; cursor: pointer; margin-left: 15px;" title="Orden Generada"></i>';
                  }                
               
                echo "</td>";
                // 1 // id equipo
                echo "<td style='text-align: center' class='hidden equipo'>".$b['id_equipo']."</td>";
                // 2 // id solicitud reparacion
                echo "<td style='text-align: center' class='hidden backlog'>".$b['backId']."</td>";
                echo "<td style='text-align: center'>".$b['sore_id']."</td>";
                // 3 // codigo de equipo
                echo "<td style='text-align: center'>".$b['codigo']."</td>";
                // 4 // descripcion causa solicitud
                if($b['tarea'] != null){
                  echo "<td style='text-align: center'>".$b['tarea']."</td>";
                } else{
                  echo "<td style='text-align: center'>".$b['tarea_opcional']."</td>";
                }
                // 5 // fecha guardada anteriromente
                echo "<td style='text-align: center'>".$b['fecha']."</td>";
                // 6 // id de tarea
                echo "<td style='text-align: center' class='hidden'>".$b['id_tarea']."</td>";
                echo "<td style='text-align: center' class='hidden'>".$b['back_duracion']."</td>";
                echo "</tr>";
              }
            }
            ?>
          </tbody>
        </table>
      </div><!-- /.box-body -->

    </div><!-- /.box collapsed-box-->
  </div>
  <?php
}
?> 

<?php     
  if (strpos($permission,'Predictivo') !== false){
?>

<!-- TAREAS PREDICTIVO -->
<div class="col-md-6">
  <div class="box collapsed-box">

    <div class="box-header">
      <h3 class="box-title">Predictivo (<?php echo $mostrarFecha ?>)</h3>
      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="">
          <i class="fa fa-plus"></i></button>
        </div>
      </div><!-- /.box-header -->

      <div class="box-body">
        <table id="predictivo" class="table table-bordered table-hover">
          <thead>
            <tr>
              <th style="text-align: center" class="hidden">Id tarea</th>
              <th style="text-align: center" class="hidden">Id Equipo</th>
              <th style="text-align: center" class="hidden">Id predictivo</th>
              <th style="text-align: center">OT</th>
              <th style="text-align: center">Código</th>
              <th style="text-align: center">Descrip</th>
              <th style="text-align: center">Fecha</th>
              <th style="text-align: center">Período</th>
              <th style="text-align: center">Frec.</th>
            </tr>
          </thead>
          <tbody>
            <?php
            //dump_exit($list1);
            if($list1!=false && count($list1) > 0) 
            {
              foreach( $list1 as $p ) 
              {
                echo "<tr>";
                // 0
                echo "<td>";
                  //  if (strpos($permission,'Del') !== false) {
                        echo '<i class="fa fa-circle-thin predictivo" id="cargOrden" style="color: #A4A4A4; cursor: pointer; margin-left: 15px;" title="Orden de Trabajo" data-toggle="modal" data-target="#modal-fecha" onclick="fill_Predictivo('.$p['predId'].')"></i>';
                  //  }
                echo "</td>";
                // 1  //id de tarea
                echo "<td style='text-align: center' class='hidden'>".$p['tarea_descrip']."</td>";
                // 2 // id equipo
                echo "<td style='text-align: center' class='hidden'>".$p['id_equipo']."</td>";
                // 3 // id predictivo
                echo "<td style='text-align: center' class='hidden'>".$p['predId']."</td>";
                // 4 // codigo de equipo
                echo "<td style='text-align: center'>".$p['codigo']."</td>";
                // 5 // descripcion tarea
                echo "<td style='text-align: center'>".$p['descripcion']."</td>";
                // 6 // fecha guardada anteriromente
                echo "<td style='text-align: center'>".$p['fecha']."</td>";
                // 7 // periodo de tiempo
                echo "<td style='text-align: center'>".$p['periodo']."</td>";
                // 8 // cantidad de tiempo
                echo "<td style='text-align: center'>".$p['cantidad']."</td>";
                echo "</tr>";
              }
            }
            ?>
          </tbody>
        </table>

      </div><!-- /.box-body -->

    </div><!-- /.box collapsed-box-->
  </div>
  <?php
}
?> 