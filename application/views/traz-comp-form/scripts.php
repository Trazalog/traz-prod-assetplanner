<script>
var modal = true;

function initForm() {

    $('form').each(function() {

        $(this).bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                select: {
                    selector: '.frm-select',
                    validators: {
                        callback: {
                            message: 'Seleccionar Opción',
                            callback: function(value, validator, $field) {
                                if (value == '') {
                                    return false;
                                } else {
                                    return true;
                                }

                            }
                        }
                    }
                }


            }
        }).on('success.form.bv', function(e) {
            e.preventDefault();
        });
    });

    $('.datepicker').datepicker({
        dateFormat: 'DD-MM-YYYY'
    });

    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
    })

    $('input[type="file"]').on('change', function(e) {

        var filename = $(this).val();

        if (filename != "" && filename != null) {

            var link = $(this).closest('.form-group').find('a').show();
            var file = e.target.files[0];
            var filename = e.target.files[0].name;
            var blob = new Blob([file]);
            var url = URL.createObjectURL(blob);

            $(link).find('a').attr({
                'download': filename,
                'href': url
            });
        }
    });



}



function frmGuardar(e) {

    var form = $(e).closest('form').attr('id');
    var info = $(e).closest('form').data('info');

    $('#' + form).bootstrapValidator('validate');

    var bv = $('#' + form).data('bootstrapValidator');

    //if (!bv.isValid()) return;

    var formData = new FormData($('#' + form)[0]);

    console.log('#'+form);
    
    for (var pair of formData.entries()) {
        console.log(pair[0] + ', ' + pair[1]);
    }

    var checkbox = $('#' + form).find("input[type=checkbox]");

    $.each(checkbox, function(key, val) {
        if (!formData.has($(val).attr('name'))) {
            formData.append($(val).attr('name'), '');
        }
    });


    if (!navigator.onLine) {

        console.log('Offline | Formulario Guardado...');

        var json = formToJson(formData);

        guardarEstado($('#task').val() + '_frm', json, '#' + form);

        $('#' + form).closest('.modal').modal('hide');

        ajax({
            type: 'POST',
            dataType: 'JSON',
            url: 'index.php/<?php echo FRM ?>Form/guardarJson/' + info,
            data: {
                json
            },
            success: function(rsp) {

            },
            error: function(rsp) {

            }
        });

    } else {

        var files = $('#' + form + ' input[type="file"]');

        files.each(function() {
            if (this.value != null && this.value != '') formData.append('-file-' + this.name, this
                .value);
        });


        $.ajax({
            type: 'POST',
            dataType: 'JSON',
            cache: false,
            contentType: false,
            processData: false,
            url: 'index.php/<?php echo FRM ?>Form/guardar/' + info,
            data: formData,
            success: function(rsp) {

                $('#' + form).closest('.modal').modal('hide');

            },
            error: function(rsp) {

                alert('Error al Guardar Formulario');

            }
        });

    }
}

$('.btn-form').click(function() {

    obtenerForm(this.dataset.info);

});

function obtenerForm(info, show = true) {

    $.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: 'index.php/<?php echo FRM ?>Form/obtener/' + info + '/' + modal,
        success: function(rsp) {
            if (modal) {
                $('#frm-modal-' + info).remove();
                $('#frm-list').append(rsp.html);
                if (!navigator.onLine) {
                    console.log('Offiline | Sin Conexión...');

                    var task = $('#task').val();
                    var id = '#frm-' + info;
                    var aux = JSON.parse(sessionStorage.getItem(task + '_frm'));
                    if (aux != null) {

                        if (aux[id] != null) {

                            var form = JSON.parse(aux[id]);

                            console.log('Offline | Abriendo Estado Intermedio Formulario');

                            Object.keys(form).forEach(function(key) {

                                //Tipo Checks
                                if (key.includes('[]')) {

                                    $(id + ' [name="' + key + '"]').each(function() {

                                        this.checked = form[key].includes(this.value)

                                    });

                                } else {

                                    var input = $(id + ' [name="' + key + '"]')[0];

                                    //Ignorar Tipos Files
                                    if (input.getAttribute('type') == 'file') return;

                                    //Radio
                                    if (input.getAttribute('type') == 'radio' && input.value ==
                                        form[key]) {
                                        alert(input.value);
                                        input.checked = true;
                                        return;
                                    }

                                    //Default
                                    $(id + ' [name="' + key + '"]').val(form[key]);

                                }

                            });
                        }
                    }
                }
                if (show) $('#frm-modal-' + info).modal('show');
                $('#frm-modal-' + info + ' .btn-accion').click(function() {
                    $(this).closest('.modal').find('.frm-save').click();
                });
            }

            initForm();
        },
        error: function(rsp) {

            console.log('Error al Obtener Formulario');

        }
    });
}

function formToJson(formData) {

    var object = {};

    formData.forEach((value, key) => {

        if (!object.hasOwnProperty(key)) {
            object[key] = value;
            return;
        }

        if (!Array.isArray(object[key])) {
            object[key] = [object[key]];
        }

        object[key].push(value);

    });

    return JSON.stringify(object);
}
</script>


<div id="frm-list"></div>