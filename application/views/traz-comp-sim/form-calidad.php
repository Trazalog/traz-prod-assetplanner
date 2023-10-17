<div class="content">
    <div class="box box-primary">
        <div class="box-body">
 
      <!--       <button class="btn btn-primary frm-new" data-form="">
                <i class="fa fa-plus"></i> Nuevo Formulario</button><br><br><br>  -->

            <table class="table" id="lista-forms">
                <thead>
                    <th>Empleado</th>
                    <th>Fecha</th>
                    <th class="text-center" width="3%">Formulario</th>
                </thead>
                <tbody>
                    <?php
                        foreach ($list as $key => $o) {
                          
                            echo '<tr>';
                            echo "<td> $o->nombre </td>";
                            echo "<td>".fecha_hora($o->fecha)."</td>";
                            echo "<td class='text-center'><a class='frm-open' data-readonly='true' href='#' data-info='$o->info_id'><i class='fa fa-paperclip'></i></a></td>";
                            echo '</tr>';
                           
                        }

                    ?>
                </tbody>
            </table>
        </div>
    </div>

</div>

<script>
//DataTable($('#lista-forms'), false);
$( document ).ready(function() {
    detectarForm();
});

var miTabla =  $('#lista-forms').DataTable();
function getInfo() {

    var operario = $('#operario').val();
    var cliente = $('#cliente').val();
    var fecha = $('#fecha').val();

    return {
        operario,
        cliente,
        fecha
    };
}

function dgf(){
    $('.modal-backdrop').hide();
    linkTo();
}

function guardarEstado(){
    return;
};
</script>