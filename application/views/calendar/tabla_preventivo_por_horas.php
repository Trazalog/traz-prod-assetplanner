<!-- PREVENTIVO P/HORAS-->
<div class="col-md-6">
  <div class="box collapsed-box">

    <div class="box-header">
      <h3 class="box-title">Preventivo por Horas</h3>
      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="">
          <i class="fa fa-plus"></i></button>
        </div>
      </div><!-- /.box-header -->

      <div class="box-body">
        <table id="preventivo_horas" class="table table-bordered table-hover">
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
            if( $list!=false && count($list) > 0) 
            {
              //dump_exit($list);
              foreach( $list as $p ) 
              {
                // curso, critico, vencido
                $estado = 'bg-gray';
                if( $p['estadoprev'] == 'C'  ) { $estado = 'bg-green'; }
                if( $p['estadoprev'] == 'CR' ) { $estado = 'bg-orange'; }
                if( $p['estadoprev'] == 'VE' ) { $estado = 'bg-red'; }

                echo "<tr>";
                  // 0
                  echo "<td>";
                   // if (strpos($permission,'Del') !== false) {
                        echo '<i class="fa fa-history" id="cargOrden" style="color: #A4A4A4; cursor: pointer; margin-left: 15px;" title="Orden de Trabajo" data-toggle="modal" data-target="#modal-preventivo"></i>';
                   // }
                  echo "</td>";
                  // 1  //id de preventivo
                  echo "<td style='text-align: center' class='hidden'>".$p['prevId']."</td>";
                  // 2  //id de equipo
                  echo "<td style='text-align: center' class='hidden'>".$p['id_equipo']."</td>";
                  // 3  //id de tarea
                  echo "<td style='text-align: center' class='hidden'>".$p['id_tarea']."</td>";
                  // 4  //codigo equipo
                  echo "<td style='text-align: center'>".$p['codigo']."</td>";
                  // 5  //descrip prevent
                  echo "<td style='text-align: center'>".$p['descripcion']."</td>";
                  // 6  //prox prevent
                  echo "<td style='text-align: center'>".$p['prox']."</td>";
                  // 7  //horas hombre
                  //echo "<td style='text-align: center'>".$p['horash']."</td>";
                  // 8  //periodo
                  echo "<td style='text-align: center'>".$p['perido']."</td>";
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
