<input type="hidden" id="permission" value="<?php echo $permission;?>">
<div class="row">
    <div class="col-xs-12">
        <div class="alert alert-danger alert-dismissable" id="error1" style="display: none">
            <h4><i class="icon fa fa-ban"></i> ALERTA!</h4>
            Este equipo! SI tiene datos tecnicos cargados
        </div>
    </div>
</div>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Equipo/Sector</h3>
                    <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="btnAgre">Agregar</button>';
          }
          ?>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <table id="sales" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Acciones</th>
                                <th>Equipo</th>
                                <th>Descripción</th>
                                <th>Área</th>
                                <th>Proceso</th>
                                <th>Sector</th>
                                <th>Criticidad</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
           
                foreach($list as $a)
                {
                  $id = $a['id_equipo'];                  
                  echo '<tr id="'.$id.'" data-equipo="'.$id.'" data-meta="'.$a['meta_disp'].'">';
                  echo '<td>';
                  if (strpos($permission,'Del') !== false) {
                    echo '<i href="#" class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar"></i>';
                  }
                  if (strpos($permission,'Edit') !== false) {
                    echo '<i class="fa fa-fw fa-pencil text-light-blue editEquipo" style="cursor: pointer; margin-left: 15px;" title="Editar"></i>' ;
                    //echo '<i class="fa fa-sticky-note-o text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Datos Tecnicos" data-toggle="modal" data-target="#modaltecnico"></i>' ;
                    //echo '<i class="fa fa-fw fa-print text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Imprimir"></i>';
                  }
                  if (strpos($permission,'Del') !== false) {
                    echo '<i class="fa fa-fw fa-user text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Contratista" data-toggle="modal" data-target="#modalasignar"></i>';
                    //antes estaba el estado R por que ERA REPARACION pero ahora reparacion es R
                    if( ($a['estado'] == 'AC') || ($a['estado'] == 'RE') ){
                      echo '<i  href="#"class="fa fa-fw fa-toggle-on text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Inhabilitar"></i>';
                    }
                    else {
                      echo '<i class="fa fa-fw fa-toggle-off text-light-blue" title="Habilitar" style="cursor: pointer; margin-left: 15px;"></i>';
                    }
                  }
                  if (strpos($permission,'Lectura') !== false) {
                    if( $a['estado'] == 'AC' OR $a['estado'] == 'RE' ) {
                      echo '<i class="fa fa-hourglass-half text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Mantenimiento Autónomo" data-toggle="modal" data-target="#modalectura"></i>';
                    }
                    echo '<i class="fa fa-history text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Historial de Lecturas" data-toggle="modal" data-target="#modalhistlect"></i>';
                  }

                  echo '<button class="btn-link" onclick="asignar_meta(this)"><i class="fa fa-bar-chart text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Asignar Meta"></i></button>';

                  echo '</td>';
                 # '<input type="hidden" id="id_equipo" name="id_equipo">';
                  echo '<td class="maquin">'.$a['codigo'].'</td>';
                  echo '<td>'.$a['deeq'].'</td>';
                  echo '<td>'.$a['dear'].'</td>';
                  echo '<td>'.$a['depro'].'</td>';
                  echo '<td>'.$a['desec'].'</td>';
                  echo '<td>'.$a['decri'].'</td>';
                  echo '<td>'.estado($a['estadoEquipo']).'</tr>';
                }
              ?>
                        </tbody>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->


<script>
$('#modalhistlect').on('shown.bs.modal', function(e) {
    // recalcula el ancho de las columnas
    $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
})


var tr = "";
var isOpenWindow = false;
var idEquipo = "";
var ide = "";
var idglob = "";

$(function() {
    $(".datepicker").datepicker();
});

// Carga vista para agregar equipo nuevo - Chequeado
edit = 0;
datos = Array()
$('#btnAgre').click(function cargarVista() {
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Equipo/cargarequipo/<?php echo $permission; ?>");
    WaitingClose();
});


// Asigna contratista - Chequeado
$(".fa-user ").click(function(e) {
    var id_equipo = $(this).parent('td').parent('tr').attr('id');
    idglob = id_equipo;
    console.log("variable global -> id de equipo: " + idglob);

    $('#tablaempresa tbody').html("");
    tr = null;

    click_co(id_equipo);
    traer_contratista();
    llenaContratistasEquipo(id_equipo);
});

// Cambiar a estado - Chequeado
$(".fa-toggle-on").click(function(e) {
    WaitingOpen('Cambiando estado...');
    var idequipo = $(this).parent('td').parent('tr').attr('id');
    console.log(idequipo);
    $.ajax({
        type: 'POST',
        data: {
            idequipo: idequipo
        },
        url: 'index.php/Equipo/cambio_equipo',
        success: function(data) {
            console.log(data);
            //alert("Se cambio el estado del equipo a INACTIVO");   
            WaitingClose();
            regresa();
        },
        error: function(result) {
            console.log(result);
        },
        dataType: 'json'
    });
});

// Cambiar a estado - Chequeado
$(".fa-toggle-off").click(function(e) {
    var idequipo = $(this).parent('td').parent('tr').attr('id');
    console.log("id de equipo: " + idequipo);
    WaitingOpen('Cambiando estado...');
    habilitarEquipo(idequipo);
});

function habilitarEquipo(idequipo) {
    console.log("ID equipo en fcion: " + idequipo);
    // Si el estado es Alta (saco lectura de tabla equipo (ultima lectura))
    $.ajax({
        async: true,
        data: {
            idequipo: idequipo
        },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/estado_alta',
        success: function(data) {
            WaitingClose();
            linkTo();
        },
        error: function(result) {
            console.log(result);
        }
    });
}

function alta_historial_lectura(parametros) {
    console.log("parametros:");
    console.table(parametros);
    $.ajax({
        data: {
            parametros: parametros
        },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/alta_historial_lectura',
        success: function(data) {
            console.table(data);
            //alert("Se agregó historial lecturas");
        },
        error: function(result) {
            console.error("Error al agregar historial lecturas");
            console.table(result);
        },
    });
}

//cambio el estado a activo, sin importar si el anterior es alta, inhabilitado, etc...
function cambiar_estado(idequipo, vuelve = true) {
    $.ajax({
        data: {
            idequipo: idequipo
        },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/cambio_estado',
        success: function(data) {
            console.log(data);
            WaitingClose();
            alert("Se cambio el estado del equipo a ACTIVO");
            if (vuelve == true) {
                regresa();
            }
        },
        error: function(result) {
            console.error("Error al cambiar el estado");
            console.table(result);
        },
    });
}

// Impresion - Chequeado
$(".fa-print").click(function(e) {
    e.preventDefault();
    var idequip = $(this).parent('td').parent('tr').attr('id');
    console.log("El id de orden al imprimir es :");
    console.log(idequip);
    // alert(id_orden);
    $.ajax({
        type: 'POST',
        data: {
            idequip: idequip
        },
        dataType: 'json',
        url: 'index.php/Equipo/getsolImp', //index.php/
        success: function(data) {
            console.log("Entre a la impresion");
            console.log(data);
            console.log(data.datos.codigo);
            console.log(data.equipos.asegurado);
            console.log(data.orden.nombre);
            var fecha = new Date(data.datos.fechain);
            var day = fecha.getDate();
            var month = fecha.getMonth();
            var year = fecha.getUTCFullYear();
            fecha = day + '-' + month + '-' + year;
            //data.equipos.fecha_vigencia
            //data.equipos.fecha_inicio
            var fechav = new Date(data.equipos.fecha_vigencia);
            var day = fechav.getDate();
            var month = fechav.getMonth();
            var year = fechav.getUTCFullYear();
            fechav = day + '-' + month + '-' + year;
            var fechai = new Date(data.equipos.fecha_inicio);
            var day = fechai.getDate();
            var month = fechai.getMonth();
            var year = fechai.getUTCFullYear();
            fechai = day + '-' + month + '-' + year;
            var trequipos = '';
            for (var i = 0; i < data['orden'].length; i++) {
                var fecha1 = new Date(data['orden'][i]['fecha']);
                var day = fecha1.getDate();
                var month = fecha1.getMonth();
                var year = fecha1.getUTCFullYear();
                fecha1 = day + '-' + month + '-' + year;
                trequipos = trequipos + "<tr>  <td width='10%'>" + fecha1 +
                    "</td> <td width='10%'>" + data['orden'][i]['causa'] +
                    "</td> <td width='10%'>" + data['orden'][i]['causa'] +
                    "</td> <td width='10%'>" + data['orden'][i]['nombre'] +
                    "</td><td width='10%'>" + data['orden'][i]['estado'] + "</td>  </tr>";
            }
            var texto =
                '<div class="" id="vistaimprimir">' +
                '<div class="container">' +
                '<div class="thumbnail">' +

                '<div class="caption">' +
                '<div class="row" >' +
                '<div class="panel panel-default">' +
                '<div class="form-group">' +
                '<h3 class="text-center" align="center"></h3>' +
                '</div>' +
                '<hr/>' +
                '<div class="panel-body">' +
                '<div class="container">' +
                '<div class="thumbnail">' +
                '<div class="row">' +
                '<div class="col-sm-12 col-md-12">' +
                '<table width="100%" style="text-align:justify" >' +
                '<tr>' +
                '<tr>' +
                '<td  colspan="1"  align="left" >' +
                '<div class="text-left"> <img src="img/LOGO.jpg" width="280" height="80" /> </div></td>' +
                '</td>' +
                '<td >' +
                '<div  class="col-md-4 "><h3> FICHA TECNICA DE SERVICIO</h3>' +
                '</div>' +
                '</td>' +
                '</tr>' +
                '</tr>' +
                '</table>' +
                '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col-sm-12 col-md-12">' +
                '<table width="100%" style="text-align:justify" border="1px solid black" >' +
                '<tr>' +
                '<td>Numero de serie</td>' +
                '<td>' + data.datos.numero_serie + '</td>' +
                '<td style="text-align: left"" >Codigo del equipo</td>' +
                '<td>' + data.datos.codigo + '</td>' +
                '</tr>' +

                '<tr>' +
                '<td>Marca del motor</td>' +
                '<td>' + data.datos.marca + '</td>' +
                '<td align="left" >Estado del equipo</td>' +
                '<td>' + data.datos.estado + '</td>' +
                '</tr>' +

                '<tr>' +
                '<td>Modelo del motor</td>' +
                '<td>' + data.datos.modelo + '</td>' +
                '<td>Dominio</td>' +
                '<td>' + data.datos.dominio + '</td>' +
                '</tr>' +

                '<tr>' +
                '<td>Numero de motor</td>' +
                '<td>' + data.datos.numero_motor + '</td>' +
                '<td>Marca de equipo</td>' +
                '<td>' + data.datos.marcaeq + '</td>' +
                '</tr>' +

                '<tr>' +
                '<td>Año de fabricacion</td>' +
                '<td>' + data.datos.fabricacion + '</td>' +
                '<td>Modelo de equipo</td>' +
                '<td>' + data.datos.modelo + '</td>' +
                '</tr>' +

                '<tr>' +
                '<td>Baterias</td>' +
                '<td>' + data.datos.bateria + '</td>' +
                '<td>Ubicacion</td>' +
                '<td>' + data.datos.ubicacion + '</td>' +
                '</tr>' +

                '<tr>' +
                '<td>Peso Operativo</td>' +
                '<td>' + data.datos.ubicacion + '</td>' +
                '<td>Sector</td>' +
                '<td>' + data.datos.sector + '</td>' +
                '</tr>' +

                '<tr>' +
                '<td>Ingreso a la Reparacion</td>' +
                '<td>' + fecha + '</td>' + //data.datos.fechain
                '<td>Horas del equipo a la fecha</td>' +
                '<td>' + data.datos.hora_lectura + '</td>' +
                '</tr>' +

                '</table>' +
                '</div>' +
                '</div>' +
                '<br>' +
                '<br>' +
                '<div class="row">' +
                '<div class="col-sm-12 col-md-12">' +
                '<table width="100%" style="text-align:justify" border="1px solid black" >' +
                '<tr>' +
                '<td colspan="4" align="center">Datos de Poliza de Seguro</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="4" align="left">Seguro Obligatorio Automotor</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="4" align="left">Decreto 1716/08 - Reclamo Ley: 26.363</td>' +
                '</tr>' +
                '<tr>' +
                '<td>Asegurado</td>' +
                '<td colspan="4">' + data.equipos.asegurado + '</td>' +
                '</tr>' +

                '<tr>' +
                '<td>Ref</td>' +
                '<td>' + data.equipos.ref + '</td>' +
                '<td >Poliza</td>' +
                '<td>' + data.equipos.numero_pliza + '</td>' +
                '</tr>' +

                '<tr>' +
                '<td>Vigencia desde</td>' +
                '<td>' + fechav + '</td>' + //data.equipos.fecha_vigencia
                '<td>Hasta</td>' +
                '<td>' + fechai + '</td>' + //data.equipos.fecha_inicio
                '</tr>' +

                '</table>' +
                '</div>' +
                '</div>' +
                '<div class="col-sm-6 col-md-6" border="1" >' +
                '</div>' +

                '<br>' +
                '<br>' +

                //aca va la tabla 

                '<div class="row">' +
                '<div class="col-xs-10 col-xs-offset-1 text-center">' +

                '<table class="table table-bordered"  style="text-align:justify" border="1px solid black" >' +
                //class="table table-bordered"
                '<thead>' +
                '<tr colspan="6" height="30">' +
                '<th width="20%">Fecha </th>' +
                '<th width="40%">Descripcion del arreglo</th>' +
                '<th width="25%">Diagnostico realizado por </th>' +
                '<th width="25%">Reparacion realizado por </th>' +
                '<th width="10%">Estado de la reparacion </th>' +
                '</tr>' +
                '</thead>' +

                '<tbody style="text-align:center">' + trequipos +
                '<tr colspan="2">' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr colspan="2">' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr colspan="2">' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr colspan="2">' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr colspan="2">' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr colspan="2">' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr colspan="2">' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr colspan="2">' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr>' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr>' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr>' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '<tr colspan="2">' +
                '<td style="text-align: center" ></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '<td><br></td>' +
                '</tr>' +
                '</tbody>' +
                '</table>' +
                '</div>' +
                '</div>' +
                //'<div class="container-fluid">'+

                '</div>' +
                '</div>' +
                '</div>' +


                '</div>' +
                '</div>' +
                '</div>' +
                '<style>' +
                '.table, .table>tr, .table>td  {} ' +
                '</style>';
            //border:  1px solid black;


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
        error: function(result) {
            console.log(result);
            console.log("error en la vistaimprimir");
        },
    });
});

// Modal ingreso lectura
$(".fa-hourglass-half").click(function(e) {
    $(".clear").val(""); //llimpia los inputs del modal lectura

    var $id_equipo = $(this).parent('td').parent('tr').attr('id');
    $('#id_maquina').val($id_equipo);
    console.log("id_equipo: " + $id_equipo);

    var $nom_equipo = $(this).parents("tr").find("td").eq(1).html();
    $('#maquina').val($nom_equipo);
    //console.log("nom_equipo: "+$nom_equipo);

    var $estado = $(this).closest('tr').find(".estado").html();
    console.log("estado: " + $estado);

   
    $.ajax({
        data: {
            idequipo: $id_equipo
        },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/getEqPorId',
        success: function(data) {
            console.table(data);
            estBoton($estado); //agrega boton de estados
        },
        error: function(result) {
            console.log(result);
        },
    });
});

/// agrega el estado del boton en modal - Chequeado
function estBoton($estado) {

    var estado = $estado;
    console.log(estado);
    if (estado == 'Reparación') { //reparacion
        inhabilitar();
    }
    if (estado == 'Activo') { //activo
        habilitar();
    }
}

/// cambio de estado desde el boton - Chequeado
$(".llave").click(function(e) {

    var estadobton = $(this).attr("class");

    if (estadobton == 'fa fa-fw llave fa-toggle-on') {
        inhabilitar();
    }
    if (estadobton == 'fa fa-fw llave fa-toggle-off') {
        habilitar();
    }
});

// Chequeado
function habilitar() {
    $(".llave").removeClass("fa-toggle-off");
    $(".llave").addClass("fa-toggle-on");
    $("label#botestado").text('Activo');
    $("input#estado").val('AC'); // Estado Activo
}
// Chequeado
function inhabilitar() {
    $(".llave").removeClass("fa-toggle-on");
    $(".llave").addClass("fa-toggle-off");
    $("label#botestado").text('Reparación');
    $("input#estado").val('RE'); // Estado Reparacion
}


// Completa campos y select para Editar equipos - Listo
function completarEdit(datos, edit) {
    console.log("datos que llegaron");
    $('#equipo').val(datos['id_equipo']);
    $('#descripcion').val(datos['descripcion']);
    $('#fecha_ingreso').val(datos['fecha_ingreso']);
    $('#fecha_garantia').val(datos['fecha_garantia']);

    $('#marca1').append($('<option>', {
        text: datos['marca']
    }));

    $('#codigo').val(datos['codigo']);
    $('#ubicacion').val(datos['ubicacion']);
    $('#empresa').val(datos['empresa']);
    $('#id_empresa').val(datos['id_empresa']);

    $('#criticidad').append($('<option>', {
        text: datos['criticidad'],
        value: datos['id_criticidad']
    }));

    $('#etapa').append($('<option>', {
        text: datos['sector'],
        value: datos['id_sector']
    }));

    $('#grupo').append($('<option>', {
        text: datos['grupo'],
        value: datos['id_grupo']
    }));
    $('#estado').val(datos['estado']);

    var fecha = datos['fecha_ultimalectura'];

    $('#fecha_ultimalectura').val(fecha);

    $('#ultima_lectura').val(datos['ultima_lectura']);

    //traer_empresa();
    traer_etapa();
    traer_grupo();
    traer_criticidad();
    traer_marca();
}

// limpia los select modal editar - listo
function limpiarselect() {
    $('#criticidad').html("");
    $('#marca1').html("");
    $('#etapa').html("");
    $('#grupo').html("");
}

// Chequeado
function regresa() {
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Equipo/index/<?php echo $permission; ?>");
    WaitingClose();
}

// Chequeado para impresion
function cerro() {
    isOpenWindow = false;
}

// Guarda edicion de equipo
function guardar() {
    var idEquipo = $('#id_equipo').val();
    var codigo = $('#codigo').val();
    var ubicacion = $('#ubicacion').val();
    var marca = $('#marca option:selected').val();
    var descripcion = $('#descripcion').val();
    var fecha_ingreso = $('#fecha_ingreso').val();
    var fecha_ultimalectura = $('#fecha_ultimalectura').val();
    var ultima_lectura = $('#ultima_lectura').val();
    var fecha_garantia = $('#fecha_garantia').val();
    var estado = $('#estado').val();
    var sector = $('#etapa option:selected').val();
    var criticidad = $('#criticidad option:selected').val();
    var grupo = $('#grupo').val();
    var id_area = $('#area option:selected').val();
    var id_proceso = $('#proceso option:selected').val();
    var id_cliente = $('#cliente option:selected').val();
    var numero_serie = $('#numse').val();
    var descrip_tecnica = $('#destec').val();

    var parametros = {
        'descripcion': descripcion,
        'fecha_ingreso': fecha_ingreso,
        'fecha_garantia': fecha_garantia,
        'marca': marca,
        'codigo': codigo,
        'ubicacion': ubicacion,
        //'id_empresa' : id_empresa,
        'id_sector': sector,
        'id_grupo': grupo,
        'id_area': id_area,
        'id_proceso': id_proceso,
        'id_criticidad': criticidad,
        'id_customer': id_cliente,
        'numero_serie': numero_serie,
        'estado': estado,
        'fecha_ultimalectura': fecha_ultimalectura,
        'ultima_lectura': ultima_lectura,
        'descrip_tecnica': descrip_tecnica,
    };

    console.log("estoy editando");
    console.log(idEquipo);
    console.table(parametros);
    $.ajax({
        type: 'POST',
        data: {
            data: parametros,
            idEquipo: idEquipo
        },
        url: 'index.php/Equipo/editar_equipo',
        success: function(data) {
            console.log(data);
            regresa();
        },
        error: function(result) {
            console.log(result);
        }
        //dataType: 'json',
    });
}

// Trae grupo y completa el select grupo - Chequeado
function traer_grupo() {
    $.ajax({
        type: 'POST',
        url: 'index.php/Equipo/getgrupo', //index.php/
        success: function(data) {

            //var opcion  = "<option value='-1'>Seleccione...</option>" ; 
            //$('#grupo').append(opcion); 
            for (var i = 0; i < data.length; i++) {

                var nombre = data[i]['descripcion'];
                var opcion = "<option value='" + data[i]['id_grupo'] + "'>" + nombre + "</option>";
                $('#grupo').append(opcion);
            }
        },
        error: function(result) {

            console.log(result);
        },
        dataType: 'json'
    });
}
// Trae criticidad y completa el select grupo - Chequeado
function traer_criticidad() {
    $.ajax({
        type: 'POST',
        url: 'index.php/Equipo/getcriti', //index.php/
        success: function(data) {

            for (var i = 0; i < data.length; i++) {
                var nombre = data[i]['descripcion'];
                var opcion = "<option value='" + data[i]['id_criti'] + "'>" + nombre + "</option>";
                $('#criticidad').append(opcion);
            }
        },
        error: function(result) {
            console.log(result);
        },
        dataType: 'json'
    });
}

// Trae etapa/sector y llena el select - Chequeado
function traer_etapa() {
    $.ajax({
        type: 'POST',
        url: 'index.php/Equipo/getetapa', //index.php/
        success: function(data) {
            for (var i = 0; i < data.length; i++) {
                var nombre = data[i]['descripcion'];
                var opcion = "<option value='" + data[i]['id_sector'] + "'>" + nombre + "</option>";
                $('#etapa').append(opcion);
            }
        },
        error: function(result) {
            console.log(result);
        },
        dataType: 'json'
    });
}

// Llena select en modal editar de marcas
function traer_marca() {
    //$('#marca1').html('');
    $.ajax({
        type: 'POST',
        data: {},
        url: 'index.php/Equipo/getmarca', //index.php/
        success: function(data) {

            //var opcion  = "<option value='-1'>Seleccione...</option>" ; 
            $('#marca1').append(opcion);
            for (var i = 0; i < data.length; i++) {
                var nombre = data[i]['marcadescrip'];
                var opcion = "<option value='" + data[i]['marcaid'] + "'>" + nombre + "</option>";
                $('#marca1').append(opcion);

            }

        },
        error: function(result) {

            console.log(result);
        },
        dataType: 'json'
    });
}

// Trae contratistas y llena selecte en modal editar
function traer_contratista() {
    $.ajax({
        type: 'POST',
        data: {},
        url: 'index.php/Equipo/getcontra',
        success: function(data) {
            var opcion = "<option value='-1'>Seleccione...</option>";
            $('#empresae').html('');
            $('#empresae').append(opcion);
            for (var i = 0; i < data.length; i++) {
                var nombre = data[i]['nombre'];
                var opcion = "<option value='" + data[i]['id_contratista'] + "'>" + nombre + "</option>";
                $('#empresae').append(opcion);
            }
        },
        error: function(result) {
            //alert("Error al traer contratistas");
            console.error(result);
        },
        dataType: 'json'
    });
}


function llenaContratistasEquipo(id_equipo) {
    //console.log("id equipo para contratista: "+id_equipo);
    $.ajax({
        data: {
            id_equipo: id_equipo
        },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/getContratistasEquipo',
        success: function(data) {
            //console.table(data);
            tabla = $('#tablaempresa').DataTable();
            tabla.clear().draw();
            for (var i = 0; i < data.length; i++) {
                //agrego valores a la tabla
                tablaCompleta = tabla.row.add([
                    '<i class="fa fa-fw fa-times-circle text-light-blue elirow btnDel" style="cursor: pointer; margin-left: 15px;" data-eqContr="' +
                    data[i]['id_contratistaquipo'] + '"></i>',
                    data[i]['codigo'],
                    data[i]['nombre']
                ]);
                tablaCompleta.node().id = data[i]['id_contratistaquipo'];
                tablaCompleta.nodes().to$().attr("data-equipo", data[i]['id_codigo']);
                tablaCompleta.nodes().to$().attr("data-contratista", data[i]['id_contratista']);
                tabla.draw();
            }
        },
        error: function(result) {
            console.error(result);
        },
    });
}

//agrega contratista
$("#adde").click(function(e) {
    var id_equipo = $('#id_equipoC').val();
    var id_contratista = $('#empresae').val();
    console.log("id_contratista: " + id_contratista);
    console.log("id_equipo: " + id_equipo);

    WaitingOpen("Agregando contratista a equipo")
    var hayError = false;
    if ($('#empresae').val() == -1) {
        hayError = true;
    }
    if (hayError == true) {
        $('#errorC').fadeIn('slow');
        WaitingClose();
        return;
    } else {
        $('#errorC').fadeOut('slow');
        $.ajax({
                data: {
                    id_equipo: id_equipo,
                    id_contratista: id_contratista
                },
                dataType: 'json',
                type: "POST",
                url: 'index.php/Equipo/guardarcontra',
            })
            .done(function(data) {
                console.table(data);
                alert("Contratista guardado con exito");
                llenaContratistasEquipo(id_equipo);
            })
            .error(function(result) {
                alert("Error en guardado...");
                console.log("Error: " + result['status']);
                console.table(result);
            })
            .always(function() {
                WaitingClose();
            });
    }
});

$(document).on("click", ".btnDel", function() {
    var id_contratistaquipo = $(this).parent().parent().attr('id');
    var id_equipo = $('#id_equipoC').val();

    WaitingOpen("Agregando contratista a equipo")
    $.ajax({
            data: {
                id_contratistaquipo: id_contratistaquipo
            },
            dataType: 'json',
            type: "POST",
            url: 'index.php/Equipo/delContra',
        })
        .done(function(data) {
            llenaContratistasEquipo(id_equipo);
        })
        .error(function(result) {
            alert("Error eliminando contratista...");
            console.log("Error: " + result['status']);
            console.table(result);
        })
        .always(function() {
            WaitingClose();
        });
});


function click_co(id_equipo) {
    //console.log(id_equipo);
    $.ajax({
        type: 'POST',
        data: {
            id_equipo: id_equipo
        },
        url: 'index.php/Equipo/getco',
        success: function(data) {
            var fechai = data[0]['fecha_ingreso'];
            var fechag = data[0]['fecha_garantia'];
            var mar = data[0]['marca'];
            var ubica = data[0]['ubicacion'];
            var descrip = data[0]['descripcion'];
            var codigoe = data[0]['codigo'];
            $('#codigoe').val(codigoe);
            $('#fecha_ingresoe').val(fechai);
            $('#fecha_garantiae').val(fechag);
            $('#marcae').val(mar);
            $('#descripcione').val(descrip);
            $('#ubicacione').val(ubica);
            $('#id_equipoC').val(id_equipo);
        },
        error: function(result) {
            //alert("Error al traer equipos");
            console.error(result);
        },
        dataType: 'json'
    });
}



/// Hitorial de lecturas
$(".fa-history").click(function(e) {
    $("tr.registro").remove();
    var $id_equipo = $(this).parent('td').parent('tr').attr('id');
    console.log("id de equipo: " + $id_equipo);

    $.ajax({
        type: 'POST',
        data: {
            idequipo: $id_equipo
        },
        url: 'index.php/Equipo/getHistoriaLect',
        success: function(data) {
            console.table(data);
            llenarModal(data);
        },
        error: function(result) {
            console.log(result);
        },
        dataType: 'json'
    });
});


function recargarTabla() {
    $("tr.registro").remove();
    var $id_equipo = $('#id_Equipo_modal').val();

    $.ajax({
        type: 'POST',
        data: {
            idequipo: $id_equipo
        },
        url: 'index.php/Equipo/getHistoriaLect',
        success: function(data) {
            console.table(data);
            llenarModal(data);
        },
        error: function(result) {
            console.log(result);
        },
        dataType: 'json'
    });
}






/// llena modal historial de lecturas
function llenarModal(data) {

    $('#tblhistorial').DataTable().clear().draw();
    if (data.length == 0) return;
    $('#id_Equipo_modal').val(data[0]['id_equipo']);

    console.table(data);
    if (Array.isArray(data) && data.length) {
        console.log("El equipo SI tiene historial de lecturas");
        $("#codEquipo").text(data[0]['codigo']);
        //borro los datos de la tabla
        $('#tblhistorial').DataTable().clear().draw();
        for (var i = 0; i < data.length; i++) {
            $('#tblhistorial').DataTable().row.add([
                '<i class="fa fa-fw fa-pencil text-light-blue editLectura" style="cursor: pointer; margin-left: 15px;" title="Editar lectura" data-idLectura="' +
                data[i]['id_lectura'] + '"></i>',
                data[i]['lectura'],
                data[i]['fecha'],
                data[i]['operario_nom'],
                data[i]['turno'],
                data[i]['observacion'],
                estado(data[i]['estado'])
            ]).draw();
        }
    } else {
        $("#codEquipo").text("Equipo sin historial de lecturas");
        $('#tblhistorial').DataTable().clear().draw();
        console.log("El equipo NO tiene historial de lecturas");
    }
}


$(document).on("click", ".editLectura", function(e) {

    e.preventDefault();
    e.stopImmediatePropagation();
    $("#modalEditarLectura").modal('show');
    var idLectura = $(this).data("idlectura");
    var lectura = $(this).parents("tr").find("td").eq(1).html();
    $('#idLecturaEdit').val(idLectura);
    $('#lecturaEdit').val(lectura);
});

function guardarEditLectura() {
    $('#errorEditLectura').fadeOut('fast');
    console.log('estoy guardando');
    var id_lectura = $('#idLecturaEdit').val();
    var lectura = $('#lecturaEdit').val();

    if ((id_lectura == "") || (lectura == "")) {
        $('#errorEditLectura').fadeIn('slow');
        return;
    } else {
        $("#modalEditarLectura").modal('hide');
        $.ajax({
            type: "POST",
            url: "index.php/Equipo/setLecturaEdit",
            data: {
                lectura,
                id_lectura
            },
            success: function(data) {
                console.log("Guardado con exito...");
                $("#modalEditarLectura").modal('hide');
                recargarTabla();
            },
            error: function(result) {
                $("#modalEditarLectura").modal('hide');
                alert('Ocurrió un error en la Edición...');
                console.log(result);
            },
            dataType: 'json'
        });

        //   $('#modalectura').modal('hide');
        //   $('#errorLectura').hide();
    }
}





// Chequea los campos llenos - Chequeado
function validarCampos() {
    var hayError = "";
    if ($('#lectura').val() == "") {
        hayError = true;
    }
    if ($('#operario').val() == "") {
        hayError = true;
    }
    if ($('#turno').val() == "") {
        hayError = true;
    }
    if ($('#observacion').val() == "") {
        hayError = true;
    }
    return hayError;
}


function guardarlectura() {
    var hayError = false;
    hayError = validarCampos();
    if (hayError == true) {
        $('#errorLectura').fadeIn('slow');
    } else {

        var lectura = $("#formlectura").serializeArray();
        console.table(lectura);
        $.ajax({
            type: "POST",
            url: "index.php/Equipo/setLectura",
            data: lectura,
            success: function(data) {
                console.log("Guardado con exito...");
                regresa();
            },
            error: function(result) {
                console.log("Error en guardado de Lectura...");
                console.log(result);
            },
            dataType: 'json'
        });

        $('#modalectura').modal('hide');
        $('#errorLectura').hide();
    }
}





/************************************/
/********** ELIMINA EQUIPO **********/
/************************************/

// Elimina Equipos (Cambio de estado a AN) - Chequeado
$(".fa-times-circle").click(function(e) {
    if (!confirm("Realmente desea eliminar este equipo?")) {
        return;
    } else {
        console.log("Estoy eliminando");
        var idequipo = $(this).parent('td').parent('tr').attr('id');
        console.log(idequipo);
        $.ajax({
            type: 'POST',
            data: {
                idequipo: idequipo
            },
            url: 'index.php/Equipo/baja_equipo',
            success: function(data) {
                alert("Equipo/sector ANULADO");
                regresa();
            },
            error: function(result) {
                console.log(result);
            },
            dataType: 'json'
        });
    }
});





/************************************/
/**********  EDITA EQUIPO  **********/
/************************************/

// Traigo datos del equipo
$(".editEquipo").click(function() {
    //WaitingOpen(); 
    var idEquipo = $(this).parent('td').parent('tr').attr('id');
    //$('#id_equipo').val(idEquipo);
    console.info('id de equipo a editar: ' + idEquipo);

    $.ajax({
        data: {
            idEquipo: idEquipo
        },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/geteditar',
        success: function(result) {
            console.log(result);
            llenarCampos(result);
        },
        error: function(result) {
            console.error(result);
        },
    });
});

function llenarCampos(data) {
    //ubicacion
    llenar_area(data[0]['id_area']);
    llenar_proceso(data[0]['id_proceso']);
    llenar_criticidad(data[0]['id_criti']);
    llenar_sector(data[0]['id_sector']);
    llenar_grupo(data[0]['id_grupo']);
    //equipo/sector
    $('#id_equipo').val(data[0]['id_equipo']);
    $('#codigo').val(data[0]['codigo']);
    llenar_marca(data[0]['marcaid']);
    llenar_cliente(data[0]['cliId']);
    $('#descripcion').val(data[0]['deeq']);
    $('#numse').val(data[0]['numero_serie']);
    $('#ubicacion').val(data[0]['ubicacion']);
    $('#fecha_ingreso').val(data[0]['fecha_ingreso']);
    $('#fecha_garantia').val(data[0]['fecha_garantia']);
    $('#fecha_ultimalectura').val(data[0]['fecha_ultimalectura']);
    $('#ultima_lectura').val(data[0]['ultima_lectura']);
    $('#destec').val(data[0]['descrip_tecnica']);
    $('#estado').val(data[0]['estado']);
    //info complementaria
    llenar_adjunto(data[0]['adjunto']);
    //abro modal
    $('#modaleditar').modal('show');
    WaitingClose();
}
// Trae area y llena el select Area - Listo
function llenar_area(id) {
    $.ajax({
        data: {},
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/getarea', //index.php/
        success: function(data) {
            //console.table(data);
            $('#area').text("");
            for (var i = 0; i < data.length; i++) {
                var selectAttr = '';
                if (data[i]['id_area'] == id) {
                    var selectAttr = 'selected';
                }
                var nombre = data[i]['descripcion'];
                var opcion = "<option value='" + data[i]['id_area'] + "' " + selectAttr + ">" + nombre +
                    "</option>";
                $('#area').append(opcion);
            }
        },
        error: function(result) {
            console.error(result);
        },
    });
}
// Trae area y llena el select Proceso - Listo
function llenar_proceso(id) {
    $.ajax({
        data: {},
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/getproceso', //index.php/
        success: function(data) {
            //console.log("proceso: "+id);
            //console.table(data);
            $('#proceso').text("");
            for (var i = 0; i < data.length; i++) {
                var selectAttr = '';
                if (data[i]['id_proceso'] == id) {
                    var selectAttr = 'selected';
                }
                var nombre = data[i]['descripcion'];
                var opcion = "<option value='" + data[i]['id_proceso'] + "' " + selectAttr + ">" + nombre +
                    "</option>";
                $('#proceso').append(opcion);
            }
        },
        error: function(result) {
            console.error(result);
        },
    });
}
// Trae area y llena el select Criticidad - Listo
function llenar_criticidad(id) {
    $.ajax({
        data: {},
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/getcriti', //index.php/
        success: function(data) {
            //console.log("criticidad: "+id);
            //console.table(data);
            $('#criticidad').text("");
            for (var i = 0; i < data.length; i++) {
                var selectAttr = '';
                if (data[i]['id_criti'] == id) {
                    var selectAttr = 'selected';
                }
                var nombre = data[i]['descripcion'];
                var opcion = "<option value='" + data[i]['id_criti'] + "' " + selectAttr + ">" + nombre +
                    "</option>";
                $('#criticidad').append(opcion);
            }
        },
        error: function(result) {
            console.error(result);
        },
    });
}
// Trae area y llena el select Sector - Listo
function llenar_sector(id) {
    $.ajax({
        data: {},
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/getetapa', //index.php/
        success: function(data) {
            //console.log("sector/etapa: "+id);
            //console.table(data);
            $('#etapa').text("");
            for (var i = 0; i < data.length; i++) {
                var selectAttr = '';
                if (data[i]['id_sector'] == id) {
                    var selectAttr = 'selected';
                }
                var nombre = data[i]['descripcion'];
                var opcion = "<option value='" + data[i]['id_sector'] + "' " + selectAttr + ">" + nombre +
                    "</option>";
                $('#etapa').append(opcion);
            }
        },
        error: function(result) {
            console.error(result);
        },
    });
}
// Trae area y llena el select Grupo - Listo
function llenar_grupo(id) {
    $.ajax({
        data: {},
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/getgrupo', //index.php/
        success: function(data) {
            //console.table(data);
            $('#grupo').text("");
            var opcion = "<option value='-1'>Seleccione...</option>";
            $('#grupo').append(opcion);
            for (var i = 0; i < data.length; i++) {
                var selectAttr = '';
                if (data[i]['id_grupo'] == id) {
                    var selectAttr = 'selected';
                }
                var nombre = data[i]['descripcion'];
                var opcion = "<option value='" + data[i]['id_grupo'] + "' " + selectAttr + ">" + nombre +
                    "</option>";
                $('#grupo').append(opcion);
            }
        },
        error: function(result) {
            console.error(result);
        },
    });
}
// Trae area y llena el select Grupo - Listo
function llenar_marca(id) {
    $.ajax({
        data: {},
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/getmarca', //index.php/
        success: function(data) {
            //console.log("marca: "+id);
            //console.table(data);
            $('#marca').text("");
            for (var i = 0; i < data.length; i++) {
                var selectAttr = '';
                if (data[i]['marcaid'] == id) {
                    var selectAttr = 'selected';
                }
                var nombre = data[i]['marcadescrip'];
                var opcion = "<option value='" + data[i]['marcaid'] + "' " + selectAttr + ">" + nombre +
                    "</option>";
                $('#marca').append(opcion);
            }
        },
        error: function(result) {
            console.table(result);
        },
    });
}
// Trae area y llena el select Grupo - Listo
function llenar_cliente(id) {
    $.ajax({
        data: {},
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Equipo/getcliente', //index.php/
        success: function(data) {
            //console.log("cliente: "+id);
            //console.table(data);
            $('#cliente').text("");
            var opcion = "<option value='-1'>Seleccione...</option>";
            $('#cliente').append(opcion);
            for (var i = 0; i < data.length; i++) {
                var selectAttr = '';
                if (data[i]['cliId'] == id) {
                    var selectAttr = 'selected';
                }
                var nombre = data[i]['cliRazonSocial'];
                var opcion = "<option value='" + data[i]['cliId'] + "' " + selectAttr + ">" + nombre +
                    "</option>";
                $('#cliente').append(opcion);
            }
        },
        error: function(result) {
            console.table(result);
        },
    });
}
//llena los datos de archivo adjunto
function llenar_adjunto(adjunto) {
    //console.info( "adjunto: "+adjunto );
    $('#adjunto').text(adjunto);
    $('#adjunto').attr('href', 'assets/filesequipos/' + adjunto);
    if (adjunto == null || adjunto == '') {
        var accion =
            '<i class="fa fa-plus-square agregaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Agregar Adjunto"></i>';
    } else {
        var accion =
            '<i class="fa fa-times-circle eliminaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Eliminar Adjunto"></i>' +
            '<i class="fa fa-pencil editaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Editar Adjunto"></i>';
    }
    $('#accionAdjunto').html(accion);
}

// Agrega las areas nuevas - Listo
function guardararea() {

    var descripcion = $('#nomarea').val();
    var parametros = {
        'descripcion': descripcion
    };
    console.log(parametros);
    var hayError = false;

    if (parametros != 0) {

        $.ajax({
            type: "POST",
            url: "index.php/Equipo/agregar_area",
            data: {
                parametros: parametros
            },
            success: function(data) {
                console.log("exito");
                var datos = parseInt(data);
                console.log(datos);
                //alert(data);
                if (data >
                    0) { //Agrego la descripcion dinamicamte en el select con id componente             

                    var texto = '<option value="' + data + '">' + parametros.descripcion + '</option>';
                    console.log(texto);
                    $('#area').append(texto);
                }
            },
            error: function(result) {
                console.log("entro por el error");
                console.log(result);
            },
            dataType: 'json'
        });

    } else {
        alert("Por favor complete la descripcion del grupo, es un campo obligatorio");

    }
}

// Agrega las procesos nuevos - Listo
function guardarproceso() {

    var descripcion = $('#nomproceso').val();
    var parametros = {
        'descripcion': descripcion
    };
    console.log(parametros);
    var hayError = false;

    if (parametros != 0) {

        $.ajax({
            type: "POST",
            url: "index.php/Equipo/agregar_proceso",
            data: {
                parametros: parametros
            },
            success: function(data) {
                console.log("exito");
                var datos = parseInt(data);
                console.log(datos);
                //alert(data);
                if (data >
                    0) { //Agrego la descripcion dinamicamte en el select con id componente              

                    var texto = '<option value="' + data + '">' + parametros.descripcion + '</option>';
                    console.log(texto);
                    $('#proceso').append(texto);
                }
            },

            error: function(result) {
                console.log("entro por el error");
                console.log(result);
            },
            dataType: 'json'
        });

    } else {
        alert("Por favor complete la descripcion del grupo, es un campo obligatorio");

    }
}

// Agrega criticidad nueva - Listo
function guardarcri() {

    var descripcion = $('#de').val();
    var parametros = {
        'descripcion': descripcion
    };
    console.log(parametros);
    var hayError = false;

    if (parametros != 0) {
        $.ajax({
            type: "POST",
            url: "index.php/Equipo/agregar_criti",
            data: {
                parametros: parametros
            },
            success: function(data) {
                console.log("exito");
                var datos = parseInt(data);
                console.log(datos);
                //Agrego la descripcion dinamicamte en el select con id componente
                if (data > 0) {

                    var texto = '<option value="' + data + '">' + parametros.descripcion + '</option>';
                    console.log(texto);
                    $('#criticidad').append(texto);
                }
            },

            error: function(result) {
                console.log("entro por el error");
                console.log(result);
            },
            dataType: 'json'
        });

    } else {
        alert("Por favor complete criticidad, es un campo obligatorio");

    }
}

// Agrega las grupos nuevos - Listo
function guardargrupo() {

    var descripcion = $('#nomgrupo').val();
    var parametros = {
        'descripcion': descripcion,
        'estado': 'AC',
    };
    console.table(parametros);
    var hayError = false;

    if (parametros != 0) {

        $.ajax({
            type: "POST",
            url: "index.php/Equipo/agregar_grupo",
            data: {
                parametros: parametros
            },
            success: function(data) {
                console.log("exito");
                var datos = parseInt(data);
                console.log(datos);
                //alert(data);
                if (data > 0) {

                    var texto = '<option value="' + data + '">' + parametros.descripcion + '</option>';
                    console.log(texto);

                    $('#grupo').append(texto);
                }
            },

            error: function(result) {
                console.log("entro por el error");
                console.log(result);
            },
            dataType: 'json'
        });
    } else {
        alert("Por favor complete la descripcion del grupo, es un campo obligatorio");

    }
}

// Agrega sector/etapa nuevos - Listo
function guardaretapa() {

    var descripcion = $('#nometapa').val();
    var parametros = {
        'descripcion': descripcion,
        'estado': 'AC',
    };
    console.table(parametros);
    var hayError = false;

    if (parametros != 0) {

        $.ajax({
            type: "POST",
            url: "index.php/Equipo/agregar_etapa",
            data: {
                parametros: parametros
            },
            success: function(data) {
                console.log("exito");
                var datos = parseInt(data);
                console.log(datos);
                //alert(data);
                if (data > 0) {

                    var texto = '<option value="' + data + '">' + parametros.descripcion + '</option>';
                    console.log(texto);

                    $('#etapa').append(texto);
                }
            },
            error: function(result) {
                console.log("entro por el error");
                console.log(result);
            },
            dataType: 'json'
        });
    } else {
        alert("Por favor complete la descripcion del grupo, es un campo obligatorio");
    }
}

// Agrega sector/etapa nuevos
function guardarCliente() {
    var cliName = $('#cliName').val();
    var cliLastName = $('#cliLastName').val();
    var cliDni = $('#cliDni').val();
    var cliAddress = $('#cliAddress').val();
    var cliPhone = $('#cliPhone').val();
    var cliEmail = $('#cliEmail').val();
    var cliRazonSocial = $('#cliRazonSocial').val();

    var parametros = {
        'cliName': cliName,
        'cliLastName': cliLastName,
        'cliDni': cliDni,
        'cliAddress': cliAddress,
        'cliPhone': cliPhone,
        'cliEmail': cliEmail,
        'cliRazonSocial': cliRazonSocial,
        'estado': 'AC',
    };
    console.table(parametros);
    var hayError = false;

    if (parametros != 0) {

        $.ajax({
            data: {
                parametros: parametros
            },
            dataType: 'json',
            type: "POST",
            url: "index.php/Equipo/agregar_cliente",
            success: function(data) {
                console.log("exito");
                console.log(data);
                if (data > 0) {
                    var texto = '<option value="' + data + '">' + parametros.cliRazonSocial + '</option>';
                    console.log(texto);
                    $('#cliente').append(texto);
                    $('#modalCliente').modal('hide');
                }
            },
            error: function(result) {
                console.log("entro por el error");
                console.log(result);
            },
        });
    } else {
        alert("Por favor complete la descripcion del grupo, es un campo obligatorio");
    }
}

// Agrega las grupos nuevos - Listo
function guardarmarca() {
    var descripcion = $('#nombreMarca').val();
    var parametros = {
        'marcadescrip': descripcion,
        'estado': 'AC',
    };
    console.table(parametros);
    var hayError = false;
    if (parametros != 0) {
        $.ajax({
            data: {
                parametros: parametros
            },
            dataType: 'json',
            type: 'POST',
            url: "index.php/Equipo/agregar_marca",
            success: function(data) {
                console.log("exito");
                var datos = parseInt(data);
                console.log(datos);
                if (data > 0) {
                    var texto = '<option value="' + data + '">' + parametros.marcadescrip + '</option>';
                    console.log(texto);
                    $('#marca').append(texto);
                }
            },
            error: function(result) {
                console.log("entro por el error");
                console.log(result);
            }
        });
    } else {
        alert("Por favor complete la descripcion de Marca, es un campo obligatorio");
    }
}




//abrir modal eliminar adjunto
$(document).on("click", ".eliminaAdjunto", function() {
    $('#modalEliminarAdjunto').modal('show');
    var idEquipo = $('#id_equipo').val();
    $('#idAdjunto').val(idEquipo);
});
//eliminar adjunto
function eliminarAdjunto() {
    $('#modalEliminarAdjunto').modal('hide');
    var idEquipo = $('#idAdjunto').val();
    $.ajax({
            data: {
                idEquipo: idEquipo
            },
            dataType: 'json',
            type: 'POST',
            url: 'index.php/Equipo/eliminarAdjunto',
        })
        .done(function(data) {
            //console.table(data); 
            let prevAdjunto = '';
            llenar_adjunto(prevAdjunto);
        })
        .error(function(result) {
            console.error(result);
        });
}

//abrir modal agregar adjunto
$(document).on("click", ".agregaAdjunto", function() {
    $('.btnAgregarEditar').text("Agregar");
    $('#modalAgregarAdjunto .modal-title').html(
        '<span class="fa fa-fw fa-plus-square text-light-blue"></span> Agregar');

    $('#modalAgregarAdjunto').modal('show');
    var idEquipo = $('#id_equipo').val();
    $('#idAgregaAdjunto').val(idEquipo);
});
//abrir modal editar adjunto
$(document).on("click", ".editaAdjunto", function() {
    $('.btnAgregarEditar').text("Editar");
    $('#modalAgregarAdjunto .modal-title').html(
        '<span class="fa fa-fw fa-pencil text-light-blue"></span> Editar');

    $('#modalAgregarAdjunto').modal('show');
    var idEquipo = $('#id_equipo').val();
    $('#idAgregaAdjunto').val(idEquipo);
});
//agregar/editar adjunto
$("#formAgregarAdjunto").submit(function(event) {
    $('#modalAgregarAdjunto').modal('hide');

    event.preventDefault();
    if (document.getElementById("inputPDF").files.length == 0) {
        $('#error').fadeIn('slow');
    } else {
        $('#error').fadeOut('slow');
        var formData = new FormData($("#formAgregarAdjunto")[0]);
        //debugger
        $.ajax({
                cache: false,
                contentType: false,
                data: formData,
                dataType: 'json',
                processData: false,
                type: 'POST',
                url: 'index.php/Equipo/agregarAdjunto',
            })
            .done(function(data) {
                console.table(data['adjunto']);
                llenar_adjunto(data['adjunto']);
            })
            .error(function(result) {
                console.error(result);
            });
    }
});

$('#modaleditar').on('hidden.bs.modal', function(e) {
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Equipo/index/<?php echo $permission; ?>");
})


// Datatable - Chequeado
$('#sales').DataTable({
    "aLengthMenu": [10, 25, 50, 100],
    "columnDefs": [{
            "targets": [0],
            "searchable": false
        },
        {
            "targets": [0],
            "orderable": false
        }
    ],
    "order": [
        [1, "asc"]
    ],
});
$('#tblhistorial').DataTable({
    "aLengthMenu": [10, 25, 50, 100],
    "columnDefs": [{
            "targets": [0],
            "searchable": false
        },
        {
            "targets": [0],
            "orderable": false
        }
    ],
    "order": [
        [1, "asc"]
    ],
});
$('#tablaempresa').DataTable({
    "aLengthMenu": [10, 25, 50, 100],
    "columnDefs": [{
            "targets": [0],
            "searchable": false
        },
        {
            "targets": [0],
            "orderable": false
        }
    ],
    "order": [
        [1, "asc"]
    ],
});
</script>


<!-- Modal CONTRATISTA -->
<div id="modalasignar" class="modal" role="dialog">
    <div class="modal-dialog modal-lg">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Asignación de contratista a equipo</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title fa fa-cogs"> Datos del Equipo</h4>
                            </div><!-- /.panel-heading -->

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <label for="codigoe">Codigo:</label>
                                        <input id="codigoe" name="codigoe" class="form-control" disabled>
                                        <input type="hidden" id="id_equipoC" name="id_equipoC">
                                    </div>

                                    <div class="col-xs-12 col-md-6">
                                        <label for="ubicacione">Ubicacion:</label>
                                        <input type="text" id="ubicacione" name="ubicacione" class="form-control"
                                            disabled>
                                    </div>

                                    <div class="col-xs-12 col-md-6">
                                        <label for="marcae">Marca:</label>
                                        <input type="text" id="marcae" name="marcae" class="form-control" disabled>
                                    </div>

                                    <div class="col-xs-12 col-md-6">
                                        <label for="fecha_ingresoe">Fecha de Ingreso:</label>
                                        <input type="date" id="fecha_ingresoe" name="fecha_ingresoe"
                                            class="form-control input-md" disabled>
                                    </div>

                                    <div class="col-xs-12 col-md-6">
                                        <label for="fecha_garantiae">Fecha de Garantia:</label>
                                        <input type="date" id="fecha_garantiae" name="fecha_garantiae"
                                            class="form-control input-md" disabled>
                                    </div>

                                    <div class="col-xs-12">
                                        <label for="">Descripcion: </label>
                                        <textarea class="form-control" id="descripcione" name="descripcione"
                                            disabled></textarea>
                                    </div>
                                </div>
                            </div><!-- /.panel-body -->
                        </div><!-- /.panel -->
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title fa fa-file-text-o"> Contratista</h4>
                            </div><!-- /.panel-heading -->

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="alert alert-danger alert-dismissable" id="errorC"
                                            style="display: none">
                                            <h4><i class="icon fa fa-ban"></i> Error!</h4>
                                            Revise que todos los campos esten completos
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-md-6">
                                        <select id="empresae" name="empresae" class="form-control" />
                                        <input type="hidden" id="id_contratista" name="id_contratista">
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <button type="button" class="btn btn-primary" id="adde">Agregar</button>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <table class="table table-bordered" id="tablaempresa">
                                            <thead>
                                                <tr>
                                                    <th>Acción</th>
                                                    <th>Equipo</th>
                                                    <th>Contratistas Asignados</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div><!-- /.panel-body -->
                        </div><!-- /.panel -->
                    </div>
                </div>
            </div><!-- /.modal-body -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cerro()">Cancelar</button>
                <!--<button type="button" class="btn btn-primary" id="reset" data-dismiss="modal" onclick="guardarsi()">Guardar</button>-->
            </div>
        </div>
    </div>
</div>
<!-- / Modal CONTRATISTA -->

<!-- Modal EDITAR -->
<div id="modaleditar" class="modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><span class="fa fa-fw fa-pencil text-light-blue"></span> Editar Equipo/Sector
                </h4>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h2 class="panel-title"><span class="fa fa-globe"></span> Ubicación del Equipo / Sector
                                </h2>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <input type="hidden" id="unin" name="unin" class="form-control"
                                        value="<?php echo $empresa ?>">

                                    <div class="col-md-6 col-sm-12">
                                        <!-- FIRST COLUMN -->
                                        <div class="row">
                                            <div class="col-xs-8"><label>Área<strong
                                                        style="color: #dd4b39">*</strong>:</label>
                                                <input type="hidden" id="id_area" name="id_area">
                                                <select id="area" name="area" class="form-control"
                                                    value="<?php echo $area ?>"></select>
                                            </div>
                                            <div class="col-xs-4">
                                                <label>&emsp;</label><br>
                                                <button type="button" class="btn btn-primary" id="addarea"
                                                    data-toggle="modal" data-target="#modalarea"><i class="fa fa-plus">
                                                        Agregar</i></button>
                                            </div>

                                            <div class="col-xs-8"><label>Proceso<strong
                                                        style="color: #dd4b39">*</strong>:</label>
                                                <input type="hidden" id="id_proceso" name="id_proceso">
                                                <select id="proceso" name="prid_procesooceso" class="form-control"
                                                    value=""></select>
                                            </div>
                                            <div class="col-xs-4">
                                                <label>&emsp;</label><br>
                                                <button type="button" class="btn btn-primary" id="addproceso"
                                                    data-toggle="modal" data-target="#modalproceso"><i
                                                        class="fa fa-plus"> Agregar</i></button>
                                            </div>

                                            <div class="col-xs-8"><label>Criticidad<strong
                                                        style="color: #dd4b39">*</strong>:</label>
                                                <select id="criticidad" name="criticidad" class="form-control"></select>
                                            </div>
                                            <div class="col-xs-4">
                                                <label>&emsp;</label><br>
                                                <button type="button" class="btn btn-primary" id="addcriti"
                                                    data-toggle="modal" data-target="#modalcrit"><i class="fa fa-plus">
                                                        Agregar</i></button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-sm-12">
                                        <!-- FIRST COLUMN -->
                                        <div class="row">
                                            <div class="col-xs-8"><label>Sector/Etapa<strong
                                                        style="color: #dd4b39">*</strong>:</label>
                                                <select id="etapa" name="etapa" class="form-control" value=""></select>
                                            </div>
                                            <div class="col-xs-4">
                                                <label>&emsp;</label><br>
                                                <button type="button" class="btn btn-primary" id="addetapa"
                                                    data-toggle="modal" data-target="#modaletapa"><i class="fa fa-plus">
                                                        Agregar</i></button>
                                            </div>

                                            <div class="col-xs-8"><label>Grupo:</label>
                                                <select id="grupo" name="grupo" class="form-control"></select>
                                            </div>
                                            <div class="col-xs-4">
                                                <label>&emsp;</label><br>
                                                <button type="button" class="btn btn-primary" id="addgrupo"
                                                    data-toggle="modal" data-target="#modalgrupo"><i class="fa fa-plus">
                                                        Agregar</i></button>
                                            </div>

                                            <div class="col-xs-8"><label>Cliente:</label>
                                                <select id="cliente" name="cliente" class="form-control"></select>
                                            </div>
                                            <div class="col-xs-4">
                                                <label>&emsp;</label><br>
                                                <button type="button" class="btn btn-primary" id="addcliente"
                                                    data-toggle="modal" data-target="#modalCliente"><i
                                                        class="fa fa-plus"> Agregar</i></button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-sm-12">
                                        <!-- FIRST COLUMN -->
                                        <div class="row">

                                        </div>
                                    </div>
                                </div><!-- /.row -->
                            </div><!-- /.panel-body -->
                        </div><!-- /.panel -->

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del Equipo / Sector</h3>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Código</label> <strong style="color: #dd4b39">*</strong>:
                                        <input type="text" id="codigo" name="codigo" class="form-control"
                                            placeholder="Ingrese Código de Equipo">
                                        <input type="hidden" id="id_equipo" name="id_equipo">
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Marca</label> <strong style="color: #dd4b39">*</strong>:
                                        <select id="marca" name="marca" class="form-control" value=""></select>
                                    </div>
                                    <div class="col-xs-4">
                                        <label>&emsp;</label><br>
                                        <button type="button" class="btn btn-primary" id="addcriti" data-toggle="modal"
                                            data-target="#modalMarca"><i class="fa fa-plus"> Agregar</i></button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Descripción</label> <strong style="color: #dd4b39">*</strong>:
                                        <textarea class="form-control" id="descripcion" name="descripcion"
                                            placeholder="Ingrese breve Descripción (Tamaño Máx 255 caracteres) ..."
                                            cols="20" rows="3"></textarea>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Número de serie:</label>
                                        <input type="text" id="numse" name="numse" class="form-control input-md"
                                            placeholder="Ingrese Número de serie">
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Ubicación (Georeferencial)</label>:
                                        <input type="text" id="ubicacion" name="ubicacion" class="form-control"
                                            placeholder="Ingrese Ubicación">
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Fecha de Ingreso:</label>
                                        <input type="date" id="fecha_ingreso" name="fecha_ingreso"
                                            class="form-control input-md">
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Fecha de Garantía:</label>
                                        <input type="date" id="fecha_garantia" name="fecha_garantia"
                                            class="form-control input-md">
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Fecha de Lectura Inicial:</label>
                                        <input type="datetime" id="fecha_ultimalectura" name="fecha_ultima"
                                            class="form-control input-md" disabled="">
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Lectura Inicial:</label>
                                        <input type="text" id="ultima_lectura" name="ultima_lectura"
                                            class="form-control input-md" placeholder="Ingrese Ultima Lectura" disabled>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <label>Archivo Adjunto:</label>
                                        <table class="table table-bordered" id="tablaadjunto">
                                            <tbody>
                                                <tr>
                                                    <td id="accionAdjunto">
                                                        <!-- -->
                                                    </td>
                                                    <td>
                                                        <a id="adjunto" href="" target="_blank"></a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-xs-12">
                                        <label>Descripción Técnica:</label>
                                        <textarea class="form-control" id="destec" name="destec"
                                            placeholder="Ingrese Descripción Técnica..."></textarea>
                                        <input type="hidden" id="estado" name="estado" class="form-control input-md">
                                    </div>
                                </div>
                            </div><!-- /.panel-body-->
                        </div><!-- /.panel -->

                    </div><!-- /.col-xs-12 -->
                </div><!-- /.row -->

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"
                        onclick="cerro()">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="reset" data-dismiss="modal"
                        onclick="guardar()">Guardar</button>
                </div>

            </div><!-- /.modal-body -->


        </div>
    </div>
</div>
<!-- / Modal EDITAR -->

<!-- Modal LECTURA -->
<div class="modal" id="modalectura" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Lectura Equipo</h4>
            </div> <!-- /.modal-header  -->

            <div class="modal-body" id="modalBodyArticle">
                <div class="alert alert-danger alert-dismissable" id="errorLectura" style="display: none">
                    <h4><i class="icon fa fa-ban"></i> ALERTA!</h4>
                    Complete todos los datos obligatorios.
                </div>
                <form id="formlectura">

                    <div class="form-group">
                        <i href="#" class="fa fa-fw llave" style="cursor:pointer; color:#3c8dbc" title=""></i>
                        <label class="radio-inline" id="botestado"></label>
                        <input type="hidden" name="estado" id="estado">
                    </div>
                    <div class="form-group">
                        <label for="maquina">Equipo </label> <!-- <strong style="color: #dd4b39">*</strong>: -->
                        <input type="text" id="maquina" class="form-control clear" disabled>
                        <!-- id_equipo = id_maquina -->
                        <input type="text" id="id_maquina" name="id_equipo" class="form-control hidden clear">
                    </div>
                    <div class="form-group">
                        <label for="">Lectura <strong style="color: #dd4b39">*</strong>:</label>
                        <input type="text" id="lectura" name="lectura" class="form-control clear">
                    </div>
                    <div class="form-group">
                        <label for="">Operario <strong style="color: #dd4b39">*</strong>:</label>
                        <input type="text" id="operario" name="operario" class="form-control clear">
                    </div>
                    <div class="form-group">
                        <label for="">Turno <strong style="color: #dd4b39">*</strong>:</label>
                        <input type="text" id="turno" name="turno" class="form-control clear">
                    </div>
                    <div class="form-group">
                        <label for="observacion">Observaciones <strong style="color: #dd4b39">*</strong>:</label>
                        <textarea class="form-control clear" id="observacion" name="observacion"
                            placeholder="Observaciones..."></textarea>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" onclick="guardarlectura()">Guardar</button>
            </div> <!-- /.modal footer -->

        </div> <!-- /.modal-content -->
        <!-- /.modal-body -->
    </div> <!-- /.modal-dialog modal-lg -->
</div> <!-- /.modal fade -->
<!-- / Modal LECTURA -->

<!-- Modal Historial de Lecturas -->
<div class="modal" id="modalhistlect" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Historial de Lecturas</h4>
            </div> <!-- /.modal-header  -->

            <div class="modal-body">
                <input type="hidden" id="id_Equipo_modal">
                <label>Equipo: <span id="codEquipo"></span></label>
                <table id="tblhistorial" class="table table-condensed table-responsive">
                    <thead>
                        <tr>
                            <th>Edición</th>
                            <th>Lectura</th>
                            <th>Fecha</th>
                            <th>Operario</th>
                            <th>Turno</th>
                            <th>Observación</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- -->
                    </tbody>
                </table>
            </div> <!-- /.modal-body -->

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div> <!-- /.modal footer -->
        </div> <!-- /.modal-content -->

    </div> <!-- /.modal-dialog modal-lg -->
</div> <!-- /.modal fade -->
<!-- / Modal Historial de Lecturas -->

<!-- Modal Edicion de Lecturas -->
<div class="modal" id="modalEditarLectura">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Editar Lectura</h4>
            </div>
            <form id="formEditarLectura">
                <div class="modal-body">
                    <div class="alert alert-danger alert-dismissable" id="errorEditLectura" style="display: none">
                        <h4><i class="icon fa fa-ban"></i> Error!</h4>
                        Por favor ingrese una nueva lectura antes de guardar...
                    </div>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="lecturaEdit" class="col-sm-2 control-label">Nueva Lectura</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="lecturaEdit"
                                    placeholder="Ingrese nueva lectura...">
                                <input type="hidden" class="form-control" id="idLecturaEdit">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary btnAgregarEditar"
                        onclick="guardarEditLectura()">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- / Modal Edicion de Lecturas -->

<!-- Modal criticidad-->
<div class="modal" id="modalcrit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="modalAction"
                        class="fa fa-plus-square text-light-blue"></span> Agregar Sector </h4>
            </div> <!-- /.modal-header  -->

            <div class="modal-body" id="modalBodyArticle">
                <div class="row">
                    <div class="col-xs-12">
                        <label>Criticidad <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" id="de" name="de" placeholder="Ingrese criticidad" class="form-control" />
                    </div>
                </div>
            </div> <!-- /.modal-body -->

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal"
                    onclick="guardarcri()">Guardar</button>
            </div> <!-- /.modal footer -->

        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal area-->
<div class="modal" id="modalarea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="modalAction"
                        class="fa fa-plus-square text-light-blue"></span> Agregar Área </h4>
            </div> <!-- /.modal-header  -->

            <div class="modal-body" id="modalBodyArticle">
                <div class="row">
                    <div class="col-xs-12">
                        <label>Nombre de Área: <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" id="nomarea" name="nomarea" placeholder="Ingrese Nombre o Descripción"
                            class="form-control input-md" size="30" />
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal"
                    onclick="guardararea()">Guardar</button>
            </div> <!-- /.modal footer -->
        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Proceso-->
<div class="modal" id="modalproceso" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="modalAction"
                        class="fa fa-plus-square text-light-blue"></span> Agregar Proceso </h4>
            </div> <!-- /.modal-header  -->

            <div class="modal-body" id="modalBodyArticle">
                <div class="row">
                    <div class="col-xs-12">
                        <label>Nombre de Proceso: <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" id="nomproceso" name="nomproceso" placeholder="Ingrese Nombre o Descripción"
                            class="form-control input-md" size="30" />
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal"
                    onclick="guardarproceso()">Guardar</button>
            </div> <!-- /.modal footer -->
        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Etapa-->
<div class="modal" id="modaletapa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="modalAction"
                        class="fa fa-plus-square text-light-blue"></span> Agregar Sector/Etapa de Proceso </h4>
            </div> <!-- /.modal-header  -->

            <div class="modal-body" id="modalBodyArticle">
                <div class="row">
                    <div class="col-xs-12">
                        <label>Nombre de Sector/Etapa de Proceso: <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" id="nometapa" name="nometapa" placeholder="Ingrese Nombre o Descripcion"
                            class="form-control input-md" size="30" />
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal"
                    onclick="guardaretapa()">Guardar</button>
            </div> <!-- /.modal footer -->
        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Grupo-->
<div class="modal" id="modalgrupo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="modalAction"
                        class="fa fa-plus-square text-light-blue"></span> Agregar Grupo </h4>
            </div> <!-- /.modal-header  -->

            <div class="modal-body" id="modalBodyArticle">
                <div class="row">
                    <div class="col-xs-12">
                        <label>Nombre de Grupo: <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" id="nomgrupo" name="nomgrupo" placeholder="Ingrese Nombre o Descripción"
                            class="form-control input-md" size="30" />
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal"
                    onclick="guardargrupo()">Guardar</button>
            </div> <!-- /.modal footer -->
        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Marca-->
<div class="modal" id="modalMarca" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="modalAction"
                        class="fa fa-plus-square text-light-blue"></span> Agregar Marca </h4>
            </div> <!-- /.modal-header  -->

            <div class="modal-body" id="modalBodyArticle">
                <div class="row">
                    <div class="col-xs-12">
                        <label>Nombre de Marca: <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" id="nombreMarca" name="nombreMarca"
                            placeholder="Ingrese Nombre o Descripción" class="form-control input-md" size="30" />
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal"
                    onclick="guardarmarca()">Guardar</button>
            </div> <!-- /.modal footer -->
        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Clientes -->
<div class="modal" id="modalCliente">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Agregar Cliente</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
                            <h4><i class="icon fa fa-ban"></i> Error!</h4>
                            Revise que todos los campos esten completos
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <label style="margin-top: 7px;">Nombre <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" class="form-control" id="cliName">
                    </div>
                </div><br>
                <div class="row">
                    <div class="col-xs-12">
                        <label style="margin-top: 7px;">Apellido <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" class="form-control" id="cliLastName">
                    </div>
                </div><br>
                <div class="row">
                    <div class="col-xs-12">
                        <label style="margin-top: 7px;">Dni <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" class="form-control" id="cliDni">
                    </div>
                </div><br>
                <div class="row">
                    <div class="col-xs-12">
                        <label style="margin-top: 7px;">Direccion <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" class="form-control" id="cliAddress">
                    </div>
                </div><br>
                <div class="row">
                    <div class="col-xs-12">
                        <label style="margin-top: 7px;">Telefono <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" class="form-control" id="cliPhone">
                    </div>
                </div><br>
                <div class="row">
                    <div class="col-xs-12">
                        <label style="margin-top: 7px;">Email <strong style="color: #dd4b39">*</strong>: </label>
                    </div>
                    <div class="col-xs-5">
                        <input type="text" class="form-control" id="cliEmail">
                    </div>
                </div><br>
                <div class="row">
                    <div class="col-xs-12">
                        <label style="margin-top: 7px;">Razon Social <strong style="color: #dd4b39">*</strong>: </label>
                        <input type="text" class="form-control" id="cliRazonSocial">
                    </div>
                </div><br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="guardarCliente()">Guardar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Modal -->

<!-- Modal Eliminar Adjunto -->
<div class="modal" id="modalEliminarAdjunto">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><span class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="idAdjunto">
                <h4>¿Desea eliminar Archivo Adjunto?</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal"
                    onclick="eliminarAdjunto();">Eliminar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Agregar adjunto -->
<div class="modal" id="modalAgregarAdjunto">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><span class="fa fa-fw fa-plus-square text-light-blue"></span> Agregar</h4>
            </div>

            <form id="formAgregarAdjunto" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
                        <h4><i class="icon fa fa-ban"></i> Error!</h4>
                        Seleccione un Archivo Adjunto
                    </div>
                    <input type="hidden" id="idAgregaAdjunto" name="idAgregaAdjunto">
                    <input id="inputPDF" name="inputPDF" type="file" class="form-control input-md">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary btnAgregarEditar">Agregar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php
 $modal = new StdClass();
 $modal->id = 'asignar_meta';
 $modal->titulo = 'Equipos | Asignar Meta';
 $modal->icono = 'fa fa-bar-chart';
 $modal->body = "<div class='form-group'><label>Meta:</label><input class='form-control' type='number' min='1' max='100' step='1'><a href='#' class='flt-clear pull-right text-red'><small><i class='fa fa-times'></i> Borrar Meta</small></a></div>";
 $modal->accion = 'Guardar';
 $modal->tam ='sm';
 echo modal($modal);
?>

<script>
var equipo = null;
function asignar_meta(e){

  equipo = $(e).closest('tr')[0];

  $('#asignar_meta input').val(equipo.dataset.meta);


  $('#asignar_meta').modal('show');
};

$('#asignar_meta .btn-accion').click(function() {
    var meta = $('#asignar_meta input').val();
    if (meta == null || meta == '') {
        alert('No se ingreso ningún valor.');
        return;
    }
    if (meta <= 0 || meta > 100) {
        alert('Solo valores del 1 al 100');
        return;
    }

    var eq = equipo.dataset.equipo;

    if(eq == null || eq == ''){
      alert('Equipo Inválido');
      return;
    }

    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: 'index.php/Equipo/asignarMeta',
        data: {eq, meta},
        success: function(rsp) {
            $('.modal').modal('hide');
            equipo.dataset.meta = meta;
        },
        error: function(rsp) {
            alert('Error: ' + rsp.msj);
            console.log(rsp.msj);
        }
    });

});
</script>