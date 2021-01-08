<div class="col-md-12">
<br>
<form autocomplete="off" method="POST" id="formTotal">
    <?php
        $this->load->view(ALM.'ajustestock/componentes/cabecera');
    ?>

    <div class="row">
        <div class="col-md-6">
            <?php
            $this->load->view(ALM.'ajustestock/componentes/salida');
            ?>
        </div>
				<div class="col-md-6">
            <?php
                $this->load->view(ALM.'ajustestock/componentes/entrada');
            ?>
        </div>
    </div>

    <?php 
        $this->load->view(ALM.'ajustestock/componentes/justificacion');
    ?>
    <?php 
        // $this->load->view('traz-comp-form/scripts.php');
    ?>
</form>
</div>

<script>
obtenerArticulos();

function obtenerArticulos() {
    $.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: 'traz-comp-almacen/Articulo/obtener',
        success: function(rsp) {
            // if (!rsp.status) {
            //     alert('No hay Articulos Disponibles');
            //     return;
            // }
            console.log(rsp);
            rsp.articulos.articulo.forEach(function(e) {
                $('.articulos').append(
                    `<option value="${e.arti_id}" data="${e.unidad_medida}">${e.barcode} | ${e.titulo}</option>`
                );
            });
        },
        error: function(rsp) {
            alert('Error: ' + rsp.msj);
            console.log(rsp.msj);
        }
    });
}

$(".select2").select2();

$("#articuloent").on('change', function() {
    $("#unidadesent").val($("#articuloent>option:selected").attr("data"));
});
$("#articulosal").on('change', function() {
    $("#unidadsal").val($("#articulosal>option:selected").attr("data"));
});

$("#articulosal").on('change', function() {
    var idarticulo = $("#articulosal>option:selected").val();
    var iddeposito = $("#deposito>option:selected").val();
    // codigo referido a la muestra de lotes por articulos
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: '<?php echo ALM ?>Lote/listarPorArticulo?arti_id=' + idarticulo + '&depo_id=' + iddeposito,
        success: function(result) {
            console.log("success del ajax");
            if (result == null) {
                var option_lote = '<option value="" disabled selected>Sin lotes</option>';
                // $('#deposito').html(option_depo);
                console.log("Sin lotes");
            } else {
                var option_lote = '<option value="" disabled selected>-Seleccione opcion-</option>';
                for (let index = 0; index < result.length; index++) {
                    option_lote += '<option value="' + result[index].lote_id + '">' + result[index].codigo +'</option>';
                }
            }
            $('#lotesal').html(option_lote);
        },
        error: function() {
            alert('Error');
        }
    });
});

$("#articuloent").on('change', function() {
    var idarticulo = $("#articuloent>option:selected").val();
    var iddeposito = $("#deposito>option:selected").val();
    // codigo referido a la muestra de lotes por articulos
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: '<?php echo ALM ?>Lote/listarPorArticulo?arti_id=' + idarticulo + '&depo_id=' + iddeposito,
        success: function(result) {
            if (result == null) {
                var option_lote = '<option value="" disabled selected>Sin lotes</option>';
                // $('#deposito').html(option_depo);
                console.log("Sin lotes");
            } else {
                var option_lote = '<option value="" disabled selected>-Seleccione opcion-</option>';
                for (let index = 0; index < result.length; index++) {
                    option_lote += '<option value="' + result[index].lote_id + '">' + result[index]
                        .codigo +
                        '</option>';
                }
            }
            $('#loteent').html(option_lote);
        },
        error: function() {
            alert('Error');
        }
    });
});

function guardar(){
    //esta funcion guarda el ajuste y espera un id_ajuste para luego llamar a otra funcion con este id que va a ser la encargada de guardar los datos especificos del lote (dependiendo si es entrada o salida) 
		WaitingOpen('Guardando Ajuste Stock...');
debugger;
		var formdata = new FormData($("#formTotal")[0]);
    var formobj = formToObject(formdata);
    $.ajax({
        type: 'POST',
        data: {
            data: formobj
        },
        url: '<?php echo ALM ?>Ajustestock/guardarAjuste',
        success: function(rsp) {
            console.log(rsp);
            if(!rsp){
								WaitingClose();
                alert("error");
                return;
            }else{
                rsp = JSON.parse(rsp);
                rsp = rsp.GeneratedKeys.Entry[0].ID;
                if(rsp != null || rsp != ""){
                    guardaAjusteDetalle(rsp,formobj);
                }
                else{
										WaitingClose();
                    alert("error");
                    return;
                }
            }
        },
        error: function(rsp) {
						WaitingClose();
            alert('Error: ' + rsp.msj);
            console.log(rsp.msj);
        },
        complete: function() {}
    });
}

function guardaAjusteDetalle($rsp, $formobj){
    //console.log($rsp);
    $formobj['ajus_id'] = $rsp;
    $formobj['tipo_ent_sal'] = $("#tipoajuste>option:selected").attr("data");
    // console.log($formobj);
    $.ajax({
        type: 'POST',
        data: {
            data: $formobj
        },
        url: '<?php echo ALM ?>Ajustestock/guardarDetalleAjuste',
        success: function(rsp) {
            if(!rsp){
								WaitingClose();
                alert("error guardadno detalle...");
                return;
            }else{
								WaitingClose();
                alert("Accion realizada con exito");
                setTimeout("linkTo()",1700);
            }
        },
        error: function(rsp) {
						WaitingClose();
            alert('Error: ' + rsp.msj);
            console.log(rsp.msj);
        },
        complete: function() {WaitingClose();}
    });
}
</script>