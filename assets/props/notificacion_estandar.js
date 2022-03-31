
//Script para Vista Standar  
if (conexion()) evaluarEstado();

function evaluarEstado() {
    var asig = $('#asignado').val();
    // si esta tomada la tarea
    if (asig != "") {
        habilitar();
    } else {
        deshabilitar();
    }
}

function habilitar() {
    console.log('Habilitar');

    // habilito btn y textarea
    $("#btonsoltr").show();
    $("#hecho").show();
    $("#guardarComentario").show();
    $("#comentario").show();
    //desahilito btn tomar
    $("#btontomar").hide();
    $("#formulario").show();
    $('#acciones_view').show();
    // deshabilito columna y formulario
    $(".columheader").show();
    $(".getFormularioTarea").show();
    $("#pedidoInsumos").show();
    $('#decisionSolicitud').show();
    $('#verOrden').show();
    $('.panel_form').show();
    $('.oculto').show();
}

function deshabilitar() {
    console.log('Deshabiltar');

    $('.oculto').hide();
    // habilito btn tomar
    $("#btontomar").show();
    // habilito btn y textarea
    $("#btonsoltr").hide();
    $("#hecho").hide();
    $("#guardarComentario").hide();
    $("#comentario").hide();
    $("#formulario").hide();
    $('#acciones_view').hide();
    // deshabilito columna y formulario
    $(".columheader").hide();
    $(".getFormularioTarea").hide();
    $("#pedidoInsumos").hide();
    $('#decisionSolicitud').hide();
    $('#verOrden').hide();
}
// Volver al atras
$('#cerrar').click(function cargarVista() {
    WaitingOpen();
    console.log("click en boton cerrar");
    $('#content').empty();
    $("#content").load(base_url + "index.php/Tarea/index/add-edit-del-view");
    WaitingClose();
});

/* Funciones BPM */
//Ckeck Tarea realizada
$('.btncolor').click(function (e) {
    //var id = <?php //echo $idorden?>; //tomo valor de id_orden
    console.log(id);
    var id_tarea = $(this).parents('tr').find('td').eq(1).html();
    console.log("Estoy finalizando una tarea");
    $.ajax({
        type: 'POST',
        data: {
            id_tarea: id_tarea,
        }, //Id tarea
        url: 'index.php/Taller/TareaRealizada', //index.php/
        success: function (data) {
            console.log(data);
            //alert("Se Finalizando la SUBTAREA");
            refresca(id);
        },
        error: function (result) {
            console.log(result);
            alert("NO se Finalizo la SUBTAREA");
            refresca(id);
        }
    });
});

function terminarTarea() {
    //FIXME: DESHARCODEAR ID DE OT PARA TRAER FORMULARIOS ASOCIADOS A TAREAS ESTANDAR
    var formOt = [];
    var i = 0;
    $('.getFormularioTarea').each(function (index) {
        var data = {};
        var idForm = $(this).attr('data-formid');
        console.log('id form: ' + idForm);
        var idOT = $('#ot').val();
        data.idForm = idForm;
        data.idOT = 22;

        formOt.push(data);
    });



    //if ( validarCamposObligatorios(formOt) ) {
    $.ajax({
        type: 'POST',
        data: {
            formIdOt: formOt
        },
        url: 'index.php/Tarea/terminarTareaStandarenBPM',
        success: function (data) {
            WaitingClose();
            // toma a tarea exitosamente
            // if(data['reponse_code'] == 204){
            // 		$("#content").load("<?php echo base_url(); ?>index.php/Tarea/index/<?php echo $permission; ?>");
            // }
        },
        error: function (data) {
            //alert("Noo");
            console.log(data);
        },
        dataType: 'json'
    });
}

// cerrar tarea Analisis de urgencia
function decidirUrgencia() {

    
    var opcion = $('input[name="opcion"]:checked').val();
    var idTarBonita = $('#idTarBonita').val();


    
    $.ajax({
        type: 'POST',
        data: {
            opcion: opcion,
            idTarBonita: idTarBonita
        },
        url: 'index.php/Tarea/decidirUrgencia',
        success: function (data) {
            //console.table(data);
            //console.log('Opcion: '+opcion);
            if(opcion == 'true'){
                alert('Guardado de Solicitud Urgente Exitoso!');
                console.log('Opcion: '+opcion);
            }
            if(opcion == 'false'){
                alert('Guardado de Solicitud No Urgente Exitoso');
                console.log('Opcion: '+opcion);
            }
            WaitingOpen();
        },
        error: function (data) {
            WaitingClose();
            //alert("Noo");
            console.log(data);
        },
        dataType: 'json',
        complete: function(data){
            WaitingClose();
            console.table(data);
            //	WaitingClose();
            // toma a tarea exitosamente
            if (data.status) {
                back()
            }
        }
    });
    
}
// cierra tarea Verificar Informe
function verificarInforme() {
    WaitingOpen();
    var id_eq  = $('#id_EQ').val();
    var opcion = $('input[name="opcion"]:checked').val();
    var id_OT = $('#id_OT').val();
    var id_SS = $('#id_SS').val();
    var idTarBonita = $('#idTarBonita').val();
    var justificacion = ""; 
    if(opcion){
        var justificacion = $('#justificacion').val();
    }
    $.ajax({
        type: 'POST',
        data: {
            opcion: opcion,
            idTarBonita: idTarBonita,
            id_OT: id_OT,
            id_SS: id_SS,
            id_eq: id_eq,
            justificacion: justificacion
        },
        url: 'index.php/Tarea/verificarInforme',
        success: function (data) {
            WaitingClose();
            console.table(data);

            if (data['status']) {
                $("#content").load(base_url + "index.php/Tarea/index/add-edit-del-view");
            } else {
                alert(data['status']);
            }
        },
        error: function (data) {
            WaitingClose();
            //alert("Noo");
            console.log(data);
        },
        dataType: 'json'
    });
}
// cierra tarea Prestar Conformidad de
function prestarConformidad() {

    WaitingOpen('Cerrando Tarea');
    var opcion = $('input[name="opcion"]:checked').val();
    var idTarBonita = $('#idTarBonita').val();
    var id_SS = $('#id_SS').val();
    var id_OT = $('#id_OT').val();

    $.ajax({
        type: 'POST',
        data: {
            opcion: opcion,
            idTarBonita: idTarBonita,
            id_SS: id_SS,
            id_OT: id_OT
        },
        url: 'index.php/Tarea/prestarConformidad',
        success: function (data) {
            WaitingClose();

            if (data['status']) {
                $("#content").load(base_url + "index.php/Tarea/index/add-edit-del-view");
            } else {
                alert(data['status']);
            }

        },
        error: function (data) {
            WaitingClose();
            alert(data['msj']);
            //	alert("Noo");
            $("#content").load(base_url + "index.php/Tarea/index/add-edit-del-view");
        },
        dataType: 'json'
    });
}
// cierra tarea Ejecutar OT
function ejecutarOT() {

    WaitingOpen('Cerrando Tarea');
    
    var idTarBonita = $('#idTarBonita').val();
    var id_OT = $('#id_OT').val();

    guardarEstado("tareas_cerradas", true, idTarBonita);

    if (!conexion()) {
        WaitingOpen('Cerrando Tarea');
    }
    var post = {
        type: 'POST',
        data: {
            idTarBonita: idTarBonita,
            id_OT: id_OT
        },
        url: 'index.php/Tarea/ejecutarOT',
        success: function (data) {
            console.table(data);
            WaitingClose();
            console.log(data['status']);
            if (data['status']) {
                $("#content").load(base_url + "index.php/Tarea/index/add-edit-del-view");
            } else {
                alert(data['code']);
            }
        },
        error: function (data) {
            console.table(data);
            WaitingClose();
            alert(data['msj']);
            //	alert("Noo");
            $("#content").load(base_url + "index.php/Tarea/index/add-edit-del-view");
        },
        dataType: 'json'
    }

    if(SW) ajax(post);
    else $.ajax(post);
}


// Boton Hecho generico
function estado() {
    var idTarBonita = $('#idTarBonita').val();
    $.ajax({
        type: 'POST',
        data: {
            'idTarBonita': idTarBonita,
        },
        url: 'index.php/Tarea/estadoCuenta',
        success: function (result) {
            console.log(result);
            //alert("SII");
        },
        error: function (result) {
            alert("Noo");
            console.log(result);
        },
        dataType: 'json'
    });
}

// Toma tarea en BPM
function tomarTarea() {
    var idTarBonita = $('#idTarBonita').val();
    var post = {
        type: 'POST',
        data: {
            idTarBonita: idTarBonita
        },
        url: 'index.php/Tarea/tomarTarea',
        success: function (data) {

            // toma a tarea exitosamente
            if (data.status) {
                habilitar();
            } else {
                alert(data.msj)
            }

        },
        error: function (result) {
            console.log(result);
        },
        dataType: 'json'
    };

    if (conexion()) $.ajax(post);
    else {
        ajax(post);
        habilitar();
    }


    //Guardar Estado en Sesion
    var task = $('#task').val() + '_tomar';
    var id = 'tomar';
    var value = true;
    guardarEstado(task, value, id);
}
// Soltar tarea en BPM
function soltarTarea() {
    var idTarBonita = $('#idTarBonita').val();
    var post = {
        type: 'POST',
        data: {
            idTarBonita: idTarBonita
        },
        url: 'index.php/Tarea/soltarTarea',
        success: function (data) {

            // toma a tarea exitosamente
            if (data.status) {
                deshabilitar();
            } else {
                alert(data.msj)
            }
        },
        error: function (result) {
            console.log(result);
        },
        dataType: 'json'
    };

    if (conexion()) $.ajax(post);
    else {
        ajax(post);
        deshabilitar();
    }

    //Guardar Estado en Sesion
    var task = $('#task').val() + '_tomar';
    var id = 'tomar';
    var value = false;
    guardarEstado(task, value, id);
}