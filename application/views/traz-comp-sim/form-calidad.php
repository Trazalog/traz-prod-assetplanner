<div class="content">
    <div class="box box-primary">
        <div class="box-body">

            <button class="btn btn-primary" onclick="linkTo('<?php echo SIM.'Form/newFormCalidad' ?>')">
                <i class="fa fa-plus"></i> Nuevo Formulario</button><br><br><br>

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
                            echo "<td>". fecha_hora($o->fecha_hora) ."</td>";
                            echo "<td class='text-center'><a onclick='abrirFormulario(this)' href='#' data-infoid='$o->info_id' data-formid='$formId'><i class='fa fa-paperclip'></i></a></td>";
                            echo '</tr>';
                           
                        }

                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <div class="box box-primary">
        <div class="box-header with-border">
            <h4>Formulario: Evaluación de Desempeño</h4>
        </div>
        <div class="box-body">
            <div id="form-container">

            </div>
        </div>
    </div>
</div>

<script>
DataTable($('#lista-forms'), false);

var form = $('#info');

var origen = null;

var aux = $(form).data('bootstrapValidator');

if (aux != null) aux.destroy();

$('#info').bootstrapValidator({
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        select: {
            selector: '#info select',
            validators: {
                callback: {
                    message: 'Seleccionar Opcion',
                    callback: function(value, validator, $field) {
                        //return false;
                        return true;
                    }
                }
            }
        }
    }
}).on('success.form.bv', function(e) {

    e.preventDefault();

});


function index() {
    $('.form-acciones').remove();
}


$('.date').datepicker({});

//abrirFormulario($('.form'));

function abrirFormulario(e) {

    origen = e;

    var infoId = $(origen).data("infoid");

    if (infoId == null || infoId == 0) {
        alert('No se puedo Cargar el Formulario');
        console.log('Instancia de Form Vacía');
        return;
    }

    WaitingOpen();

    $.ajax({
        data: {
            infoId
        },
        dataType: 'json',
        type: 'GET',
        url: 'index.php/Tarea/Obtener_Formulario',
        success: function(result) {
            $("#form-container").html(result.html);
            index();
            llenaComp();
            WaitingClose();
        },
        error: function(result) {
            WaitingClose();
            alert('No se puedo Cargar el Formulario');
        },
    });
};

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

function guardarInfo() {

    var info = getInfo();

    $.ajax({
        data: info,
        dataType: 'json',
        type: 'POST',
        url: 'index.php/<?php echo SIM ?>Form/guardar',
        success: function(result) {
            $("#form-container").html(result.html);
            WaitingClose();
        },
        error: function(result) {
            WaitingClose();
            alert('No se puedo Cargar el Formulario');
        }
    });
}

// llena los componentes de form asoc con valores validos
function llenaComp() {

    var idForm = $(origen).data("formid");

    if (idForm == null || idForm == '') {
        alert('Id de Formulario Nulo');
        return;
    }

    $.ajax({
        data: {
            idForm
        },
        dataType: 'json',
        type: 'POST',
        url: 'Form/getValValido',
        success: function(data) {

            //console.table(data);
            $.each(data, function(index) {

                var idSelect = data[index].idValor;


                var i = 0;
                var valor = "";
                var valorSig = "";

                var aux = data[index]['VALOR'];

                // if (data[index]['VALOR'] != $('#' + idSelect).val()) {
                $('#' + idSelect).append($('<option>', {
                    value: aux,
                    text: aux
                }));
                // }
                // valor = data[index]['idValor'];
                // valorSig = data[index]['idValor'];
            });
        },
        error: function(result) {
            WaitingClose();
            alert("Error: No se pudo obtener el Formulario");
        },
    });
}

</script>