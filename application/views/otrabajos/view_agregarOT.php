<input type="hidden" id="permission" value="<?php echo $permission;?>">
<div class="row">
    <div class="col-xs-12">
        <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
            <h4><i class="icon fa fa-ban"></i> Error!</h4>
            Revise que todos los campos obligatorios esten seleccionados
        </div>
    </div>
</div>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Nueva Orden de Trabajo</h3>
                    <?php
                        echo '<button class="btn btn-block btn-primary" style="width: 250px; margin-top: 10px;" id="listadoOT">Ver Listado Ordenes de Trabajo</button>';
                        ?>
                </div><!-- /.box-header -->
                <form id="formOT" role="form" action="<?php base_url();?>Otrabajo/guardar_agregar" method="POST">

                    <div class="box-body">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del equipo </h3>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 com-md-4">
                                        <label for="idSector">Sector <strong style="color: #dd4b39">*</strong></label>
                                        <input type="text" class="form-control buscSector" placeholder="Buscar Sector..." id="buscSector" name="buscSector" >
                                        <input type="text" class="hidden idSector" id="idSector" name="idSector" >
                                    </div>
                                    <div class="col-xs-12 col-sm-6 com-md-4">
                                        <label for="equipo">Equipos <strong style="color: #dd4b39">*</strong></label>
                                        <select id="equipo" name="equipo" class="form-control equipo" >
                                            <option value="-1" selected disabled>Seleccione opción</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-xs-12 col-sm-6 com-md-4">
                                        <label for="cliente">Cliente:</label>
                                        <input type="text" id="nomCliente" name="cliente" class="form-control input-md"
                                            disabled />
                                    </div>
                                    <div class="col-xs-12 col-sm-6 com-md-4">
                                        <label for="fecha_ingreso">Fecha:</label>
                                        <input type="text" id="fecha_ingreso" name="fecha_ingreso"
                                            class="form-control input-md" disabled />
                                    </div>
                                    <div class="col-xs-12 col-sm-6 com-md-4">
                                        <label for="marca">Marca:</label>
                                        <input type="text" id="marca" name="marca" class="form-control input-md"
                                            disabled required/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 com-md-4">
                                        <label for="ubicacion">Ubicacion:</label>
                                        <input type="text" id="ubicacion" name="ubicacion" class="form-control input-md"
                                            disabled />
                                    </div>
                                    <div class="col-xs-12">
                                        <label for="descripcion">Descripcion: </label>
                                        <textarea class="form-control" id="descripcion" name="descripcion"
                                            disabled></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><span class="fa fa-building-o"></span> Programación</h4>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <label for="tarea">Tarea Estandar<strong
                                                style="color: #dd4b39">*</strong>:</label>
                                        <input type="text" id="tarea" name="tarea" class="form-control"
                                            placeholder="Buscar Tarea..." >
                                        <input type="hidden" id="id_tarea" name="id_tarea" required>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label for="tarea_manual">Tarea Personalizada<strong
                                                style="color: #dd4b39">*</strong>:</label>
                                        <input type="text" id="tareacustom" name="tareacustom" class="form-control"
                                            placeholder="Ingresar Tarea...">
                                    </div>
                                </div>
                                <div class="row">

                                    <!-- <div class="col-xs-12 col-sm-6">
                      <label for="fechaEntrega">Fecha Entrega:</label>
                      <input type="text" class="datepicker form-control fecha" id="fechaEntrega" name="fechaEntrega" value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>" size="27"/>
                    </div> -->

                                    <div class="col-xs-12 col-sm-6 hidden">
                                        <label for="suci">Sucursal</label>
                                        <input type="text" id="suci" name="suci" value="1">

                                        <!-- <select  id="suci" name="suci" class="form-control" /> -->
                                    </div>
                                    <div class="col-xs-12 col-sm-6 hidden">
                                        <label for="prov">Proveedor</label>
                                        <input type="text" id="prov" name="prov" value="1">

                                        <!-- <select  id="prov" name="prov" class="form-control" /> -->
                                    </div>

                                    <input type="hidden" id="suci" name="suci" value="1">
                                    <input type="hidden" id="prov" name="prov" value="1">

                                    <div class="col-xs-12 col-sm-6">
                                        <label for="fechaInicio">Fecha Programación:</label>
                                        <input type="text" class="datepicker form-control fecha" id="fechaInicio"
                                            name="fechaInicio"
                                            value="<?php echo date_format(date_create(date("Y-m-d H:i:s")), 'd-m-Y H:i:s') ; ?>"
                                            size="27" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <div class="nav-tabs-custom">
                                    <!--tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#herramin"
                                                aria-controls="profile" role="tab" data-toggle="tab">Herramientas</a>
                                        </li>
                                        <li role="presentation"><a href="#insum" aria-controls="messages" role="tab"
                                                data-toggle="tab">Insumos</a></li>
                                        <li role="presentation"><a href="#adj" aria-controls="messages" role="tab"
                                                data-toggle="tab">Adjunto</a></li>
                                    </ul>
                                    <!-- /tabs -->

                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="herramin">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-4">
                                                    <label for="herramienta">Codigo <strong
                                                            style="color: #dd4b39">*</strong>:</label>
                                                    <input type="text" id="herramienta" name="" class="form-control" />
                                                    <input type="hidden" id="id_herramienta" name="id_herramienta">
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-4">
                                                    <label for="marcaherram">Marca <strong
                                                            style="color: #dd4b39">*</strong>:</label>
                                                    <input type="text" id="marcaherram" name="" class="form-control" />
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-4">
                                                    <label for="descripcionherram">Descripcion <strong
                                                            style="color: #dd4b39">*</strong>:</label>
                                                    <input type="text" id="descripcionherram" name=""
                                                        class="form-control" />
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-4">
                                                    <label for="cantidadherram">Cantidad <strong
                                                            style="color: #dd4b39">*</strong>:</label>
                                                    <input type="text" id="cantidadherram" name="" class="form-control"
                                                        placeholder="Ingrese Cantidad" />
                                                </div>
                                                <br>
                                                <div class="col-xs-12">
                                                    <label></label>
                                                    <br>
                                                    <button type="button" class="btn btn-primary" id="agregarherr"><i
                                                            class="fa fa-check">Agregar</i></button>
                                                </div>
                                            </div><!-- /.row -->
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <br>
                                                    <table class="table table-bordered" id="tablaherramienta">
                                                        <thead>
                                                            <tr>
                                                                <th>Acciones</th>
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

                                        <div role="tabpanel" class="tab-pane" id="insum">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-4">
                                                    <label for="insumo">Codigo <strong
                                                            style="color: #dd4b39">*</strong>:</label>
                                                    <input type="text" id="insumo" name="insumo" class="form-control" />
                                                    <input type="hidden" id="id_insumo" name="">
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-4">
                                                    <label for="">Descripcion:</label>
                                                    <input type="text" id="descript" name="" class="form-control" />
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-4">
                                                    <label for="cant">Cantidad <strong
                                                            style="color: #dd4b39">*</strong>:</label>
                                                    <input type="text" id="cant" name="" class="form-control"
                                                        placeholder="Ingrese Cantidad" />
                                                </div>
                                            </div><!-- /.row -->
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <br>
                                                    <button type="button" class="btn btn-primary" id="agregarins"><i
                                                            class="fa fa-check">Agregar</i></button>
                                                </div>
                                            </div><!-- /.row -->
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <table class="table table-bordered" id="tablainsumo">
                                                        <thead>
                                                            <tr>
                                                                <th>Acciones</th>
                                                                <th>Código</th>
                                                                <th>Descripcion</th>
                                                                <th>Cantidad</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody></tbody>
                                                    </table>
                                                </div>
                                            </div><!-- /.row -->
                                        </div>
                                        <!--/#insum -->

                                        <div role="tabpanel" class="tab-pane" id="adj">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <input id="inputPDF" name="inputPDF" type="file"
                                                        class="form-control input-md">
                                                    <style type="text/css">
                                                    #inputPDF {
                                                        padding-bottom: 40px;
                                                    }
                                                    </style>
                                                </div>
                                            </div><!-- /.row -->
                                        </div> <!-- /.tab-pane #adj -->
                                    </div> <!-- tab-content -->

                                    <!-- <div class="modal-footer">
                      <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>  -->
                                </div><!-- /.nav-tabs-custom -->
                            </div>
                        </div>

                    </div><!-- /.box-body -->

                    <div class="modal-footer">
                        <button type="submit" id="btn_guardar" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
                <!--cierre form-->
            </div>
        </div>
    </div>
</section>

<script>

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
    /*
    focus: function(event, ui) {
        console.log('Focus');
        // prevent autocomplete from updating the textbox
        event.preventDefault();
        // manually update the textbox
        $(this).val(ui.item.label);
        console.log(ui.item);
        if(ui.item === null){
            $("#equipo").html('<option value="-1" disabled selected>Seleccione opción</option>');
            $("#idSector").val('');
            alert("Debe seleccionar un Sector");
        }
    },
    */
    change: function(event,ui){
      // prevent autocomplete from updating the textbox
      console.log('Change');
      event.preventDefault();
      console.log(ui.item);      
      if(ui.item === null){
        $("#equipo").html('<option value="-1" disabled selected>Seleccione opción</option>');
        $("#idSector").val('');
        alert("Debe seleccionar un Sector");
      }else{
        $("#idSector").val(ui.item.value);
        $(this).val(ui.item.label);
        $("#equipo").html('<option value="-1" disabled selected>Seleccione opción</option>');
        // guardo el id de sector
        var idSect =  $("#idSector").val();
        if(idSect && idSect != '')
          getEquiSector(idSect);
        else
          alert("Debe seleccionar un sector");
      }
    },
    select: function(event, ui) {
      // prevent autocomplete from updating the textbox
      console.log('Select');
      event.preventDefault();
      // manually update the textbox and hidden field
      console.log(ui.item);
      if(ui.item === null){
        $("#equipo").html('<option value="-1" disabled selected>Seleccione opción</option>');
        $("#idSector").val('');
      }else{
        $("#idSector").val(ui.item.value);
        $(this).val(ui.item.label);
        $("#equipo").html('<option value="-1" disabled selected>Seleccione opción</option>');
        // guardo el id de sector
        var idSect =  $("#idSector").val();
        getEquiSector(idSect);
      }
      /*$(this).val(ui.item.label);
      $("#idSector").val(ui.item.value);
      $("#equipo").html('<option value="-1" disabled selected>Seleccione opcion</option>');
      // guardo el id de sector
      var idSect =  $("#idSector").val();
      getEquiSector(idSect);
      //console.log("id sector en autocompletar: ");
      //console.log(ui.item.value);
      */
    },
  }); 
  //  llena select de equipos segun sector
  function getEquiSector(idSect){
    var id =  idSect;
    $("#fecha_ingreso").val("");
    $("#marca").val("");
    $("#ubicacion").val("");
    $("#descripcion").val("");
    $("#componente").html("<option value='-1'>Seleccione..</option>");
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
        var $select = $("#equipo");
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

// Nuevos //

//va listado de OTs
$("#listadoOT").click(function(e) {
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Otrabajo/listOrden/<?php echo $permission; ?>");
    WaitingClose();
});

// limpia un input al seleccionar o llenar otro
$('#tarea').change(function() {
    $('#tareacustom').val('');
});
$('#tareacustom').change(function() {
    $('#tarea').val('');
    $('#id_tarea').val('');
});




$("#formOT").submit(function(event) {
    event.preventDefault();
    WaitingOpen('Guardando Nueva Orden de Trabajo');
    var equipo = $('#equipo').val();
    var tarea = $('#id_tarea').val();
    var tareacustom = $('#tareacustom').val();
    var fecha_inicio = $('#fechaInicio').val();
    var fecha_entrega = $('#fechaEntrega').val();
    var sucursal = $('#suci').val();
    var proveedor = $('#prov').val();

    var hayError = false;
    $('#error').hide();
    if (equipo == '-1') {
        hayError = true;
    }
    if ((tarea == '') && (tareacustom == '')) {
        hayError = true;
    }
    if ((fecha_inicio == '') || (fecha_entrega == '0000-00-00 00:00:00')) {
        hayError = true;
    }
    // if(sucursal == '-1')
    // {
    //   hayError = true;
    // }
    // if(proveedor == '-1')
    // {
    //   hayError = true;
    // }

    if (hayError == true) {
        
        $('#error').fadeIn('slow');
        $('#btn_guardar').prop("disabled", false);
        WaitingClose();
        return;
    } else {
        $('#error').fadeOut('slow');
        var formData = new FormData($("#formOT")[0]);
        $.ajax({
            url: $("form").attr("action"),
            type: $("form").attr("method"),
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function(respuesta) {
                WaitingClose(),
                    recargaLista();
            },
            error: function(result) {
                WaitingClose();
                alert('Ocurrio un error en el guardado...');
                console.error(
                    "Error al agregar nueva OT. Ver console.table");
                console.table(result);
            }
        });
    }

});


// Limpia modales y regresa al listado de OTs - Ok test 
function recargaLista() {
    //WaitingOpen('');
    $('#content').empty();
    $("#content").load(
        "<?php echo base_url(); ?>index.php/Otrabajo/listOrden/<?php echo $permission; ?>");
    WaitingClose();
}

$("#fechaEntrega, #fechaInicio").datepicker({
    dateFormat: 'dd/mm/yy',
    firstDay: 1
}).datepicker("setDate", new Date());


// Fin Nuevos //


$("#formPredictivo").submit(function(event) {
    event.preventDefault();
    var equipo = $('#equipo').val();
    var tarea = $('#tarea').val();
    var compon = $('#componente').val();
    var periodo = $('#periodo').val();
    var freq = $('#cantidad').val();
    var lectbase = $('#lectura_base').val();
    var alerta = $('#alerta').val();
    var duracion = $('#duracion').val();
    var unidad = $('#unidad').val();
    var oper = $('#cantOper').val();
    var hh = $('#hshombre').val();

    if ((periodo == 'horas') || (periodo == 'ciclos')) {
        if ((lectbase < 0) || (alerta < 0)) {
            $('#error').fadeIn('slow');
        }
    }
    if ((equipo < 0) || (tarea < 0) || (periodo < 0) || (unidad < 0) || (duracion ==
            "") || (freq == "") || (oper == "") || (hh == "")) {
        $('#error').fadeIn('slow');
    } else {
        $('#error').fadeOut('slow');
        var formData = new FormData($("#formPredictivo")[0]);
        $.ajax({
            url: $("form").attr("action"),
            type: $("form").attr("method"),
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function(respuesta) {
                //alert(respuesta);
                console.log('resp prenevt: ');
                console.log(respuesta.resPrenvent);
                if (respuesta) {
                    //alert("Los datos han sido guardados correctamente");
                    cargarVista();
                } else if (respuesta === "error") {
                    alert("Los datos no se han podido guardar");
                } else {
                    //$("#msg-error").show();
                    //$(".list-errors").html(respuesta);
                }
            }
        });
    }
});

$('#listado').click(function cargarVista() {
    WaitingOpen();
    $('#content').empty();
    $("#content").load(
        "<?php echo base_url(); ?>index.php/Predictivo/index/<?php echo $permission; ?>"
    );
    WaitingClose();
});

$(".datepicker").datepicker({

    changeMonth: true,
    changeYear: true
});

// Trae equipos por empresa logueada - Chequeado
/** Desactivamos esta funcion para que no cargue a la primera */
/*$(function() {
    $.ajax({
        type: 'POST',
        data: {},
        url: 'index.php/Otrabajo/getEquiposNuevaOT',
        success: function(data) {

            var opcion = "<option value='-1'>Seleccione...</option>";
            $('#equipo').append(opcion);
            for (var i = 0; i < data.length; i++) {
                var nombre = data[i]['codigo'];
                var opcion = "<option value='" + data[i]['id_equipo'] +
                    "'>" + nombre + "</option>";
                $('#equipo').append(opcion);
            }
        },
        error: function(result) {

            console.log(result);
        },
        dataType: 'json'
    });
});*/

// Trae info de equipos por ID - Chequeado 
$('#equipo').change(function() {
    var id_equipo = $(this).val();
    $.ajax({
        type: 'POST',
        data: {
            id_equipo: id_equipo
        },
        url: 'index.php/Otrabajo/getInfoEquipoNuevaOT',
        success: function(data) {
            console.table(data);
            var fecha_ingreso = data[0]['fecha_ingreso'];
            var marca = data[0]['marcadescrip'];
            var ubicacion = data[0]['ubicacion'];
            var criterio1 = data[0]['criterio1'];
            var descripcion = data[0]['descripcion'];
            var nomCliente = data[0]['nomCli'];
            $('#fecha_ingreso').val(fecha_ingreso);
            $('#marca').val(marca);
            $('#descripcion').val(descripcion);
            $('#ubicacion').val(ubicacion);
            $('#nomCliente').val(nomCliente);
        },
        error: function(result) {

            console.log(result);
        },
        dataType: 'json'
    });
});

//Trae tareas y permite busqueda en el input
var dataTarea = function() {
    var tmp = null;
    $.ajax({
            'async': false,
            'type': "POST",
            'dataType': 'json',
            'url': 'index.php/Preventivo/gettarea',
        })
        .done((data) => {
            tmp = data
        })
        .fail(() => alert("Error al traer tareas"));
    return tmp;
}();
$("#tarea").autocomplete({
    source: dataTarea,
    delay: 500,
    minLength: 1,
    focus: function(event, ui) {
        event.preventDefault();
        $(this).val(ui.item.label);
        $('#id_tarea').val(ui.item.value);
    },
    select: function(event, ui) {
        event.preventDefault();
        $(this).val(ui.item.label);
        $('#id_tarea').val(ui.item.value);
    },
});


// Trae unidades de tiempo - Chequeado
$(function() {
    $.ajax({
        type: 'POST',
        data: {},
        url: 'index.php/Predictivo/getUnidTiempo',
        success: function(data) {

            var opcion = "<option value='-1'>Seleccione...</option>";
            $('#unidad').append(opcion);
            for (var i = 0; i < data.length; i++) {
                var nombre = data[i]['unidaddescrip'];
                var opcion = "<option value='" + data[i]['id_unidad'] +
                    "'>" + nombre + "</option>";
                $('#unidad').append(opcion);
            }
        },
        error: function(result) {

            console.log(result);
        },
        dataType: 'json'
    });
});

// Trae periodo y llena select
traer_periodo();

function traer_periodo(periodoId) {
    if (periodoId === undefined) {
        periodoId = null;
    }
    $('#periodo').html("");
    $.ajax({
        data: {
            periodoId: periodoId
        },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Calendario/getperiodo',
        success: function(data) {
            var opcion = "<option value='-1'>Seleccione...</option>";
            $('#periodo').append(opcion);
            for (var i = 0; i < data.length; i++) {
                var nombre = data[i]['descripcion'];
                var selected = (periodoId == data[i]['idperiodo']) ? 'selected' :
                    '';
                var opcion = "<option value='" + data[i]['idperiodo'] + "' " +
                    selected + "'>" + nombre + "</option>";
                $('#periodo').append(opcion);
            }
        },
        error: function(result) {
            console.log(result);
        },
    });
}

// Calcula horas hombre por tiempo y unidades
function calcularHsHombre() {

    var entrada = $('#duracion').val();
    var unidad = $('#unidad').val();
    var operarios = $('#cantOper').val();
    var hs = 0;
    var hsHombre = 0;
    //minutos
    if (unidad == 1) {
        hs = entrada / 60;
    }
    // horas
    if (unidad == 2) {
        hs = entrada;
    }
    // dias
    if (unidad == 3) {
        hs = entrada * 24;
    }

    hsHombre = hs * operarios;
    hsHombre = Math.round(hsHombre * 100) / 100;
    var mens = $("<h4 class='before'>HH: <span class='hh'>" + hsHombre + "</span></h4>");
    $('#dato').html(mens);
    $('#hshombre').val(hsHombre);
}

// Calcula hs hombre si están los 3 parametros y cambia alguno de ellos
$('#duracion, #unidad, #cantOper').change(function() {
    if ($('#duracion').val() != "" && $('#unidad').val() != "-1" && $('#cantOper')
        .val() != "")
        calcularHsHombre();
});


// Carga Lista predicitivos - Chequeado
function cargarVista() {
    WaitingOpen();
    $('#content').empty();
    $("#content").load(
        "<?php echo base_url(); ?>index.php/Predictivo/index/<?php echo $permission; ?>");
    WaitingClose();
}

function ordenaArregloDeObjetosPor(propiedad) {
    return function(a, b) {
        if (a[propiedad] > b[propiedad]) {
            return 1;
        } else if (a[propiedad] < b[propiedad]) {
            return -1;
        }
        return 0;
    }
}

////// HERRAMIENTAS //////

//Trae herramientas
var dataHerramientas = function() {
    var tmp = null;
    $.ajax({
            'async': false,
            'type': "POST",
            'dataType': 'json',
            'url': 'index.php/Preventivo/getHerramientasB',
        })
        .done((data) => {
            tmp = data
        });
    //.fail( () => alert("Error al traer Herramientas") );
    return tmp;
}();

// data busqueda por codigo de herramientas
function dataCodigoHerr(request, response) {
    function hasMatch(s) {
        return s.toLowerCase().indexOf(request.term.toLowerCase()) !== -1;
    }
    var i, l, obj, matches = [];

    if (request.term === "") {
        response([]);
        return;
    }

    //ordeno por codigo de herramientas
    dataHerramientas = dataHerramientas.sort(ordenaArregloDeObjetosPor("codigo"));

    for (i = 0, l = dataHerramientas.length; i < l; i++) {
        obj = dataHerramientas[i];
        if (hasMatch(obj.codigo)) {
            matches.push(obj);
        }
    }
    response(matches);
}
// data busqueda por marca de herramientas
function dataMarcaHerr(request, response) {
    function hasMatch(s) {
        return s.toLowerCase().indexOf(request.term.toLowerCase()) !== -1;
    }
    var i, l, obj, matches = [];

    if (request.term === "") {
        response([]);
        return;
    }

    //ordeno por marca de herramientas
    dataHerramientas = dataHerramientas.sort(ordenaArregloDeObjetosPor("marca"));

    for (i = 0, l = dataHerramientas.length; i < l; i++) {
        obj = dataHerramientas[i];
        if (hasMatch(obj.marca)) {
            matches.push(obj);
        }
    }
    response(matches);
}


//busqueda por marcas de herramientas
$("#herramienta").autocomplete({
        source: dataCodigoHerr,
        delay: 500,
        minLength: 1,
        focus: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.codigo);
            $('#id_herramienta').val(ui.item.value);
            $('#marcaherram').val(ui.item.marca);
            $('#descripcionherram').val(ui.item.label);
        },
        select: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.codigo);
            $('#id_herramienta').val(ui.item.value);
            $('#marcaherram').val(ui.item.marca);
            $('#descripcionherram').val(ui.item.label);
        },
    })
    //muestro marca en listado de resultados
    .data("ui-autocomplete")._renderItem = function(ul, item) {
        return $("<li>")
            .append("<a>" + item.codigo + "</a>")
            .appendTo(ul);
    };

//busqueda por marcas de herramientas
$("#marcaherram").autocomplete({
        source: dataMarcaHerr,
        delay: 500,
        minLength: 1,
        focus: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.marca);
            $('#id_herramienta').val(ui.item.value);
            $('#herramienta').val(ui.item.codigo);
            $('#descripcionherram').val(ui.item.label);
        },
        select: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.marca);
            $('#id_herramienta').val(ui.item.value);
            $('#herramienta').val(ui.item.codigo);
            $('#descripcionherram').val(ui.item.label);
        },
    })
    //muestro marca en listado de resultados
    .data("ui-autocomplete")._renderItem = function(ul, item) {
        return $("<li>")
            .append("<a>" + item.marca + "</a>")
            .appendTo(ul);
    };

//busqueda por descripcion de herramientas
$("#descripcionherram").autocomplete({
    source: dataHerramientas,
    delay: 500,
    minLength: 1,
    focus: function(event, ui) {
        event.preventDefault();
        $(this).val(ui.item.label);
        $('#id_herramienta').val(ui.item.value);
        $('#herramienta').val(ui.item.codigo);
        $('#marcaherram').val(ui.item.marca);
    },
    select: function(event, ui) {
        event.preventDefault();
        $(this).val(ui.item.label);
        $('#id_herramienta').val(ui.item.value);
        $('#herramienta').val(ui.item.codigo);
        $('#marcaherram').val(ui.item.marca);
    },
});

// Agrega herramientas a la tabla - Chequeado
var nrofila = 0; // hace cada fila unica
$("#agregarherr").click(function(e) {
    // FALTA HACER VALIDACION
    var id_her = $('#id_herramienta').val();
    var herramienta = $("#herramienta").val();
    var marcaherram = $('#marcaherram').val();
    var descripcionherram = $('#descripcionherram').val();
    var cantidadherram = $('#cantidadherram').val();

    nrofila = nrofila + 1;
    var tr = "<tr id='" + id_her + "' data-nrofila='" + nrofila + "'>" +
        "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>" +
        "<td class='herr'>" + herramienta + "</td>" +
        "<td class='marca'>" + marcaherram + "</td>" +
        "<td class='descrip'>" + descripcionherram + "</td>" +
        "<td class='cant'>" + cantidadherram + "</td>" +
        // guardo id de herram y cantidades
        "<input type='hidden' name='id_her[" + nrofila + "]' value='" + id_her + "'>" +
        "<input type='hidden' name='cant_herr[" + nrofila + "]' value='" +
        cantidadherram + "'>" +
        "</tr>";
    if (id_her > 0 && cantidadherram > 0) {
        $('#tablaherramienta tbody').append(tr);
    } else {
        return;
    }

    $(document).on("click", ".elirow", function() {
        var parent = $(this).closest('tr');
        $(parent).remove();
    });

    $('#herramienta').val('');
    $('#marcaherram').val('');
    $('#descripcionherram').val('');
    $('#cantidadherram').val('');
});
////// HERRAMIENTAS //////

////// INSUMOS //////

//Trae insumos
var dataInsumos = function() {
    var tmp = null;
    $.ajax({
            'async': false,
            'type': "POST",
            'dataType': 'json',
            'url': 'index.php/Preventivo/getinsumo',
        })
        .done((data) => {
            tmp = data
        });
    //.fail( () => alert("Error al traer Herramientas") );
    return tmp;
}();

// data busqueda por codigo de herramientas
function dataCodigoInsumo(request, response) {
    function hasMatch(s) {
        return s.toLowerCase().indexOf(request.term.toLowerCase()) !== -1;
    }
    var i, l, obj, matches = [];

    if (request.term === "") {
        response([]);
        return;
    }

    //ordeno por codigo de herramientas
    dataHerramientas = dataHerramientas.sort(ordenaArregloDeObjetosPor("codigo"));

    for (i = 0, l = dataInsumos.length; i < l; i++) {
        obj = dataInsumos[i];
        if (hasMatch(obj.codigo)) {
            matches.push(obj);
        }
    }
    response(matches);
}


//busqueda por marcas de herramientas
$("#insumo").autocomplete({
        source: dataCodigoInsumo,
        delay: 500,
        minLength: 1,
        focus: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.codigo);
            $('#id_insumo').val(ui.item.value);
            $('#descript').val(ui.item.label);
        },
        select: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.codigo);
            $('#id_insumo').val(ui.item.value);
            $('#descript').val(ui.item.label);
        },
    })
    //muestro marca en listado de resultados
    .data("ui-autocomplete")._renderItem = function(ul, item) {
        return $("<li>")
            .append("<a>" + item.codigo + "</a>")
            .appendTo(ul);
    };

//busqueda por descripcion de herramientas
$("#descript").autocomplete({
    source: dataInsumos,
    delay: 500,
    minLength: 1,
    focus: function(event, ui) {
        event.preventDefault();
        $(this).val(ui.item.label);
        $('#id_insumo').val(ui.item.value);
        $('#insumo').val(ui.item.codigo);
    },
    select: function(event, ui) {
        event.preventDefault();
        $(this).val(ui.item.label);
        $('#id_herramienta').val(ui.item.value);
        $('#herramienta').val(ui.item.codigo);
        $('#marcaherram').val(ui.item.marca);
    },
});

// Agrega insumos a la tabla 
var nrofilaIns = 0;
$("#agregarins").click(function(e) {
    var id_insumo = $('#id_insumo').val();
    var $insumo = $("#insumo").val();
    var descript = $('#descript').val();
    var cant = $('#cant').val();
    console.log("El id  del insumo");
    console.log(id_insumo);
    var hayError = false;
    var tr = "<tr id='" + id_insumo + "'>" +
        "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>" +
        "<td>" + $insumo + "</td>" +
        "<td>" + descript + "</td>" +
        "<td>" + cant + "</td>" +

        // guardo id de insumos y cantidades
        "<input type='hidden' name='id_insumo[" + nrofilaIns + "]' value='" +
        id_insumo + "'>" +
        "<input type='hidden' name='cant_insumo[" + nrofilaIns + "]' value='" + cant +
        "'>" +
        "</tr>";
    nrofilaIns = nrofilaIns + 1;
    if (id_insumo > 0 && cant > 0) {
        $('#tablainsumo tbody').append(tr);
    } else {
        return;
    }

    $(document).on("click", ".elirow", function() {
        var parent = $(this).closest('tr');
        $(parent).remove();
    });

    $('#insumo').val('');
    $('#descript').val('');
    $('#cant').val('');
});
////// INSUMOS //////

function limpiar() {

    $("#equipo").val("");
    $("#tarea").val("");
    $("#fecha").val("");
    $("#periodo").val("");
    $("#cantidad").val("");

}
</script>

<!--desactiva keypress-->
<script type="text/javascript">
$(document).ready(function() {
    $("form").keypress(function(e) {
        if (e.which == 13) {
            return false;
        }
    });
});
</script>