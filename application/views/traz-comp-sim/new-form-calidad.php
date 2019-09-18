<input class="hidden form" <?php echo "data-infoid = \"$infoId\" data-formid=\"$formId\"" ?>></input>

<div class="content">
    <div class="box box-primary">
        <div class="box-header">
            <button class="btn btn-primary" onclick="volver()"><i class="fa fa-reply"></i> Volver</button><br><br>
            <form>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Nombre y Apellido:</label>
                            <input type="text" class="form-control" id="empleado">
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="box-body">
            <div id="form-container">
                <!-- CONTENEDOR DE FORMULARIO -->
            </div>
            <button class="btn btn-primary" style="float:right" onclick="GuardarFormulario()">Guardar</button>
        </div>
    </div>
</div>

<script>
abrirFormulario($('.form'));

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
            llenaComp();
            index();
            WaitingClose();
        },
        error: function(result) {
            WaitingClose();
            alert('No se puedo Cargar el Formulario');
        },
    });
};

function index() {
    $('.form-acciones').remove();
}

function GuardarFormulario() {

    var imgs = $('input.archivo');

    var formData = new FormData($('form')[1]);

    var aux = $('input.auxiliar');

    var auxArray = [];

    aux.each(function() {
        auxArray.push($(this).val());
    });

    for (var i = 0; i < imgs.length; i++) {
        var inpValor = $(imgs[i]).val();
        var idValor = $(imgs[i]).attr('name');
        // si tiene algun valor (antes de subir img)
        if (inpValor != "") {
            //al subir primera img
            formData.append(idValor, inpValor);
        } else {
            //formData.delete(idValor);
        }
    }
    /* text tipo check */
    var check = $('input.check');
    var checkArray = [];
    for (var i = 0; i < check.length; i++) {
        var idCheckValor = $(check[i]).attr('name');
        if ($(check[i]).is(':checked')) {
            chekValor = 'tilde';
        } else {
            chekValor = 'notilde';
        }
        formData.append(idCheckValor, chekValor);
    }
    for (var pair of formData.entries()) {
        console.log(pair[0] + ', ' + pair[1]);
    }
    /* Ajax de Grabado en BD */
    $.ajax({
        url: 'Form/guardarForm',
        type: 'POST',
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(respuesta) {
            //} console.log(form_actual_id + "...OK");
            WaitingClose();
            guardarRegistro();
        }
    });
}

function guardarRegistro() {
    var empl = $('#empleado').val();

    if (empl == null || empl == '') {
        alert('Completar Nombre y Apellido del Emplado');
        return;
    }

    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '<?php echo SIM ?>Form/guardarFormEval',
        data: {
            nombre: empl,
            fecha_hora: newDate(true),
            info_id: $(origen).data("infoid")
        },
        success: function(rsp) {
            back();
        },
        error: function(rsp) {
            alert('Error: ' + rsp.msj);
            console.log(rsp.msj);
        }
    });
}

function volver() {
    $.ajax({
        type: 'POST',
        url: 'index.php/<?php echo SIM ?>Form/eliminarForm/<?php echo $infoId ?>'
    });
    back();
}
</script>