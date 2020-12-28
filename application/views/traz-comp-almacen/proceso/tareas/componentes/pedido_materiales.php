<input id="pema_id" type="number" class="hidden" value="<?php echo (isset($info->pema_id) ? $info->pema_id : null) ?>">
<input id="ortr_id" type="number" class="hidden" value="<?php echo (isset($info->ortr_id) ? $info->ortr_id : null) ?>">

<div class="row">
    <div
        class="<?php echo (isset($info->pema_id) ? 'hidden' : null) ?>  col-xs-12 col-sm-12 col-md-12 <?php echo (viewOT ? 'hidden' : null) ?>">
        <div class="form-group">
            <label>Justificacíon:</label>
            <textarea id="just" type="text" class="form-control <?php echo (isset($info->pema_id) ? 'hidden' : null) ?>"
                placeholder="Ingrese Justificación..."></textarea>
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-6">
        <div class="form-group">
            <label>Seleccionar Artículo:</label>
            <?php $this->load->view(ALM . '/articulo/componente');?>
        </div>
    </div>
    <div class="col-xs-3 col-sm-3 col-md-3">
        <div class="form-group">
            <label>Cantidad:</label>
            <input id="add_cantidad" type="number" min="0" class="form-control" placeholder="Cantidad">
        </div>
    </div>
    <div class="col-xs-3 col-sm-3 col-md-3" style="margin-top:25px">
        <button class="btn btn-primary" onclick="guardar_pedido();"><i class="fa fa-check"></i>Agregar</button>
    </div>
</div>
<table id="tabladetalle2" class="table table-bordered table-striped table-hover">
    <thead>
        <tr>
            <th width="1%">Acciones</th>
            <th>Artículo</th>
            <th class="text-center">Cantidad</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>
<div class="modal-footer <?php echo (isset($info->pema_id) ? 'hidden' : null) ?>">
<button class="btn btn-default" data-dismiss="modal" onclick="if(exist('descartarPedido'))descartarPedido()">Cerrar</button>
    <?php
if (isset($info->modal)) {
    echo '<button class="btn btn-primary" style="float:right;"
        onclick="lanzarPedidoModal()">Hecho</button>';
} else {
    echo '<button class="btn btn-primary" style="float:right;"
        onclick="lanzarPedido()">Hecho</button>';
}
?>
</div>
<script>
// var tablaDetalle2 = $('#tabladetalle2').DataTable({});
var selectRow = null;

get_detalle();

function del(e) {
    selectRow = $(e).closest('tr');
    $('#eliminar').modal('show');
}

function del_detalle() {
    if (selectRow.hasClass('new')) $(selectRow).remove();
    else {
        $.ajax({
            type: 'POST',
            data: {
                id: $(selectRow).attr('data-id')
            },
            url: 'index.php/almacen/Notapedido/eliminarDetalle',
            success: function(data) {

                $('#eliminar').modal('hide');

                get_detalle();
            },
            error: function(data) {
                alert('Error');
            }
        });
    }
}

function edit() {

    var id = $(selectRow).closest('tr').data('id');
    var cantidad = $('#set_cantidad #cantidad').val();
    $.ajax({
        type: 'POST',
        data: {
            id,
            cantidad
        },
        url: 'index.php/almacen/Notapedido/editarDetalle',
        success: function(data) {
            get_detalle();
            selectRow = null;
            $('#set_cantidad').modal('hide');
        },
        error: function(data) {
            alert('Error');
        }
    });

}

function edit_cantidad(e) {
    selectRow = $(e).closest('tr');
    $('#set_cantidad input').val($(selectRow).find('.cantidad').html());
    $('#set_cantidad h5').html($(selectRow).find('.articulo').html());
    $('#set_cantidad').modal('show');
}


function get_detalle() {
    var id = $('#pema_id').val();
    if (id == null || id == '') {
        return;
    }
   // $(tabla).DataTable().destroy();
    console.log("ALM | Detalle Pedido N° "+id);
    
    $.ajax({
        type: 'POST',
        url: 'index.php/almacen/Notapedido/getNotaPedidoId?id_nota=' + id,
        success: function(data) {
            
            if(data.length == 0){
                console.log('Sin Detalle de Pedidos');
                $('#tabladetalle2 tbody').empty();
                return;
            }
            
            console.log(data);

            var html = '';
            for (var i = 0; i < data.length; i++) {
                html  += "<tr class='celdas' data-id='" + data[i]['depe_id'] + "'data-id='" + data[i][
                        'arti_id'
                    ] + "' data-json='" + JSON.stringify(data) + "'>" +
                    "<td class='text-light-blue'>" +
                    "<i class='fa fa-fw fa-pencil' style='cursor: pointer;' title='Editar' onclick='edit_cantidad(this)'></i>" +
                    "<i class='fa fa-fw fa-times-circle' style='cursor: pointer;' title='Eliminar' onclick='del(this);'></i></td>" +
                    "<td class='articulo'>" + data[i]['barcode'] + "</td>" +
                    "<td class='cantidad text-center'>" + data[i]['cantidad'] + "</td></tr>";
                }
           $('#tabladetalle2 tbody').html(html);
           //DataTable('#tabladetalle2');
        },
        error: function(result) {
            alert('Error');
            console.log(result);
        },
        dataType: 'json'
    });
}
</script>


<div class="modal fade" id="set_cantidad">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Ingresar Cantidad</h4>
            </div>
            <div class="modal-body">
                <h5 class="text-center"></h5>
                <input id="cantidad" class="form-control text-center" type="number" placeholder="Cantidad">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" onclick="$(this).closest('.modal').modal('hide')">Cerrar</button>
                <button type="button" class="btn btn-primary btn-accion" onclick="edit()">Guardar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal eliminar-->
<div class="modal" id="eliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="modalAction"
                        class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar Artículo</h4>
            </div> <!-- /.modal-header  -->

            <div class="modal-body" id="modalBodyArticle">
                <h4 class="text-center">¿Confirmar Operación? </h4>
            </div> <!-- /.modal-body -->

            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="$(this).closest('.modal').modal('hide')">Cancelar</button>
                <button type="button" class="btn btn-primary" onclick="del_detalle()">Eliminar</button>
            </div> <!-- /.modal footer -->

        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog modal-lg -->
</div> <!-- /.modal fade -->
<!-- / Modal -->


<script>
//('#tabladetalle2').dataTable({});
function guardar_pedido() {

    if (!validarCampos()) {
        alert('Completar Campos');
        return;
    }

    if ($('#pema_id').val() == '' || $('#pema_id').val() == 0) {

        set_pedido();

    } else {

        edit_pedido();

    }
}

function set_pedido() {

    var idinsumos = new Array();
    var cantidades = new Array();

    id = selectItem.arti_id;
    idinsumos.push(id);
    cant = $('#add_cantidad').val();
    cantidades.push(cant);

    var idOT = $('#ortr_id').val();

    if (idinsumos.length == 0) {
        alert('Error');
        return;
    }

    var peex_id = $('#peex_id').val();
    var justificacion = $('#just').val();

    WaitingOpen("Guardando pedido...");

    $.ajax({
        data: {
            idinsumos,
            cantidades,
            idOT,
            peex_id,
            justificacion
        },
        type: 'POST',
        dataType: 'json',
        url: 'index.php/almacen/Notapedido/setNotaPedido',
        success: function(result) {
            $('#pema_id').val(result.pema_id);
            WaitingClose();
            get_detalle();
            clear();
        },
        error: function() {
            data = {
                arti_id: id,
                cantidad: cant
            };

            detalle = {
                arti_id: id,
                cantidad: cant,
                detalle: selectItem
            };

            var tr = "<tr class='celdas detalle-pedido' data-json='[" + JSON.stringify(data) +
                "]' data-articulo='" + JSON.stringify(detalle) + "'>" +
                "<td class='text-light-blue'>" +
                "<i class='fa fa-fw fa-pencil' style='cursor: pointer;' title='Editar' onclick='edit_cantidad(this)'></i>" +
                "<i class='fa fa-fw fa-times-circle' style='cursor: pointer;' title='Eliminar' onclick='del(this);'></i></td>" +
                "<td class='articulo'>" + document.getElementById('inputarti').value + "</td>" +
                "<td class='cantidad text-center'>" + data.cantidad + "</td></tr>";
            tablaDetalle2.row.add($(tr)).draw();
            WaitingClose();

        },
    });
}

function lanzarPedido() {
    WaitingOpen();
    $.ajax({
        data: {
            id: $('#pema_id').val()
        },
        dataType: 'json',
        type: 'POST',
        url: '<?php echo base_url(ALM) ?>new/Pedido_Material/pedidoNormal',
        success: function(result) {

            if (result.status) {
								$('#tabladetalle2 tbody').empty();

								var idOT = $('#ot').val();
								if ( idOT == undefined ) {
									idOT = 0;
								} else {
									idOT = $('#ot').val();
								}

								var desc = $('#info-tarea').val();
								if ( desc == undefined ) {
									desc = '';
								} else {
									desc = $('#info-tarea').val();
								}

                data = {
                    id_notaPedido: $('#pema_id').val(),
                    fecha: fechaActual(),
                    id_ordTrabajo: idOT,
                    descripcion: desc,
                    justificacion: "",
                    estado: "Solicitado"
                };

                html = "";
                html += "<tr data-json='" + JSON.stringify(data) + "' id='" + data.id_notaPedido +
                    "'>";
                html +=
                    '<td class="text-center"> <i onclick="ver(this)" class="fa fa-fw fa-search text-light-blue buscar" style="cursor: pointer;margin:5px;" title="Detalle Pedido Materiales"></i> </td>';
                html +=
                    '<td class="text-center"><span data-toggle="tooltip" title="" class="badge bg-blue estado">' +
                    data
                    .id_notaPedido + '</span></td>';
                html +=
                    '<td class="text-center"><span data-toggle="tooltip" class="badge bg-yellow estado">' +
                    data.id_ordTrabajo +
                    '</span></td>';
                html += '<td class="text-center">' + data.fecha + '</td>';
                html += '<td>' + data.descripcion + ' ' + data.justificacion + '</td>';
                html += '<td class="text-center ped-estado"><span data-toggle="tooltip" title="" class="badge bg-orange estado">Solicitado</span></td>';
                html += '</tr>';

                tablaDeposito.row.add($(html)).draw();

                $('.modal').modal('hide');

								//proceso lanzado con exito borra pema_id
								$('#pema_id').val('');

            } else {
                alert(result.msj);
            }
        },
        error: function(result) {

						WaitingClose();
            alert("Error al Lanzar Pedido");
        },
        complete: function(){
            WaitingClose();
        }      
    });
}

function lanzarPedidoModal() {

    if($('#tabladetalle2 tbody tr').length == 0){
        $('#agregar_pedido').modal('hide');
        return;
    }

    if (conexion()) {
        lanzarPedido();
        return;
    }

    console.log('ALM | Pedido Materiales...');

    notaid = document.getElementById('pema_id').value;
    idOT = document.getElementById('ortr_id').value;
    descripcion = document.getElementById('descripcionOT').value;

    fecha = new Date();
    mes = fecha.getMonth() + 1;
    dia = fecha.getDate();
    año = fecha.getFullYear();
    fecha = dia + '/' + mes + '/' + año;
    document.getElementById('pema_id').value = null;
    modal = '<?php echo $info->modal; ?>';
    data = {
        id_notaPedido: notaid,
        fecha: fecha,
        id_ordTrabajo: idOT,
        descripcion: descripcion,
        justificacion: "",
        estado: " Esperando Conexión.."
    };

    //Detalle Articulos
    var articulos = [];
    var deta_articulos = [];
    $('#tabladetalle2 tbody').find('tr').each(function() {
        json = "";
        json = JSON.tr  ($(this).attr('data-json'));
        articulos.push(json[0]);

        json = $(this).attr('data-articulo');
        deta_articulos.push(JSON.parse(json));
    });
    articulos = JSON.stringify(articulos);
    deta_articulos = JSON.stringify(deta_articulos);


    html = "";
    html += "<tr data-json='" + JSON.stringify(data) + "' id='" + data.id_notaPedido + "' data-detalle='" +
        deta_articulos + "'>";
    html +=
        '<td class="text-center"> <i onclick="verDetalleOffiline(this)" class="fa fa-fw fa-search text-light-blue buscar" style="cursor: pointer;margin:5px;" title="Detalle Pedido Materiales"></i> </td>';
    html += '<td class="text-center"><span data-toggle="tooltip" title="" class="badge bg-blue estado">' + data
        .id_notaPedido + '</span></td>';
    html += '<td class="text-center"><span data-toggle="tooltip" class="badge bg-yellow estado">' + data.id_ordTrabajo +
        '</span></td>';
    html += '<td class="text-center">' + data.fecha + '</td>';
    html += '<td>' + data.descripcion + ' ' + data.justificacion + '</td>';
    html += '<td class="text-center ped-estado">' + data.estado + '</td>';
    html += '</tr>';

    tablaDeposito.row.add($(html)).draw();

    //Guardar Estado en Sesion
    guardarEstado($('#task').val() + '_pedidos', html);


    if (conexion()) {
        WaitingOpen();
        $.ajax({
            type: 'POST',
            url: 'index.php/almacen/Notapedido/pedidoNormal/' + notaid,
            success: function() {
                $('#' + notaid).find('.ped-estado').html(
                    '<span data-toggle="tooltip" title="" class="badge bg-orange estado">Solicitado</span>'
                );
                $('#tabladetalle2 tbody').empty();
                alert('Hecho');
            },
            error: function() {
                console.log('ALM | Error Pedido Materiales');
            },
            complete:function(){
                WaitingClose();
            }
        });
    } else {
         $('#tabladetalle2 tbody').empty();
        ajax({
            data: {
                articulos: articulos,
                idOT: idOT
            },
            type: 'POST',
            url: 'index.php/almacen/Notapedido/pedidoOffline',
            success: function(result) {
                console.log('OFFLINE | Pedido Material Enviado');

            },
            error: function(result) {
                console.log('ALM | Error Pedido Materiales');
            }
        });
    }

    $('#' + modal).modal('hide');
}

function edit_pedido() {

    var idinsumos = new Array();
    var cantidades = new Array();

    id = selectItem.arti_id;
    idinsumos.push(id);
    cant = $('#add_cantidad').val();
    cantidades.push(cant);

    var idOT = $('#ortr_id').val();

    if (idinsumos.length == 0) {
        alert('Error');
        return;
    }

    WaitingOpen("Guardando pedido...");

    $.ajax({
        data: {
            idinsumos,
            cantidades,
            idOT,
            pema: $('#pema_id').val()
        },
        type: 'POST',
        dataType: 'json',
        url: 'index.php/almacen/Notapedido/editPedido',
        success: function(result) {
            WaitingClose();
            get_detalle();
            clear();
        },
        error: function(result) {
            alert('editesrt');
            WaitingClose();
            //  alert("Error en guardado...");
        }
    });
}

function validarCampos() {

    if ($('#inputarti').val() == null) return false;

    if ($('#add_cantidad') == null) return false;

    return true;
}

function clear() {
    $('#inputarti').val(null);
    $('#add_cantidad').val(null);
}
//Rearmo ajax para guardar Post en indexedDB//

function ajax(options) {
    if (navigator.serviceWorker.controller) {
        navigator.serviceWorker.controller.postMessage(options.data)
    }

    return $.ajax(options);
}
//Fin redifinicion//

function verDetalleOffiline(e) {
    console.log('OFFLINE | Detalle Pedido');
    var fecha = fechaActual();
    var aux = {
        id_notaPedido: "-",
        justificacion: "-",
        fecha,
        estado: "Esperando Conexión",
        id_ordTrabajo: $('#ot').val()
    }
    rellenarCabecera(aux);

    json = $(e).closest('tr').attr('data-detalle');

    json = JSON.parse(json);

    tablaDetalle.clear().draw();

    json.forEach(function(e) {
        console.log(e);

        var tr = "<tr>" +
            "<td>" + e.detalle.barcode + "</td>" +
            "<td>" + e.detalle.descripcion + "</td>" +
            "<td class='text-center' width='15%'><b>" + e.cantidad + "</b></td>" +
            "<td class='text-center' width='15%'><b>0</b></td>" +
            "</tr>";
        tablaDetalle.row.add($(tr)).draw();
    });
    //DataTable('#tabladetalle');
    $('#detalle_pedido').modal('show');

}


function fechaActual() {
    var date = new Date();

    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();

    if (month < 10) {
        return day + "-0" + month + "-" + year;
    } else {
        return day + "-" + month + "-" + year;
    }
}
</script>