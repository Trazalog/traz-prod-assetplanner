<section class="content">
    <div class="box box-primary">
        <div class="box-header">
            <div class="box-title">Reporte de Disponibilidad de Equipos</div>
        </div>
        <div class="box-body">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Rango de Fechas
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Fecha Inicio:</label>
                                <input id="fi" class="form-control date" type="text">
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Fecha Fin:</label>
                                <input id="ff" class="form-control date" type="text">
                            </div>
                        </div>
                        <div class="col-md-2" style="margin-top: 23px">
                            <button class="btn btn-primary" onclick="calcularDsp()">Calcular</button>
                        </div>
                    </div>

                    <hr>

                    <table id="tbl-equipos" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Equipo</th>
                                <th>Descripción</th>
                                <th>Área</th>
                                <th>Proceso</th>
                                <th>Sector</th>
                                <th>Criticidad</th>
                                <th>Estado</th>
                                <th>Dsp %</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
           
           foreach($list as $a)
           {
               $id = $a['id_equipo'];                  
               echo '<tr id="'.$id.'" data-equipo="'.$id.'" data-meta="'.$a['meta_disp'].'">';
               echo '<td class="maquin">'.$a['codigo'].'</td>';
               echo '<td>'.$a['deeq'].'</td>';
               echo '<td>'.$a['dear'].'</td>';
               echo '<td>'.$a['depro'].'</td>';
               echo '<td>'.$a['desec'].'</td>';
               echo '<td>'.$a['decri'].'</td>';
               echo '<td>';
               if($a['estadoEquipo'] == 'AC' ) echo '<small class="label pull-left bg-green">Activo</small>' ;
               if($a['estadoEquipo'] == 'IN' ) echo '<small class="label pull-left bg-yellow">Inhabilitado</small>';
               if($a['estadoEquipo'] == 'RE' ) echo '<small class="label pull-left bg-orange">Reparación</small>' ;
               if($a['estadoEquipo'] == 'AL' ) echo '<small class="label pull-left bg-blue">Alta</small>' ;
               echo '</td>';
               echo "<td id='dsp-$id'></td>";
               echo '</tr>';
            }
            ?>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</section>

<script>
$('.date').datepicker();

function calcularDsp() {
    var fi = $('#fi').val();
    var ff = $('#ff').val();

    if (fi == '' || ff == '') return;

    $.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: 'index.php/Kpi/dspRangoFecha?fi=' + fi + '&ff=' + ff,
        success: function(rsp) {
            rsp.forEach(function(e) {
                $('#dsp-' + e.id_equipo).html(e.dsp + ' %');
            });

            initTable($('#tbl-equipos'));

        },
        error: function(rsp) {
            alert('Error: ' + rsp.msj);
            console.log(rsp.msj);
        }
    });
}

initTable($('#tbl-equipos'));

function initTable(e) {

    var aux = $(e).DataTable();
    if (aux) aux.destroy();

    $(e).DataTable({
        dom: 'Bfrtip',
        buttons: ['excel']
    });

    $('.buttons-excel').removeClass('btn-default').addClass('btn-danger').html('Exportar Excel');
}
</script>