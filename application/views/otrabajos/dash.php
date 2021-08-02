<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Salida de deposito</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Nro. Comprobante</label>
                            <input type="number" id="nroCompr" class="form-control" placeholder="Ingrese Numero de comprobante">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Fecha</label>
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="date" class="form-control pull-right" value="<?php echo date('Y-m-d');?>" id="fecha" placeholder="Seleccione Fecha">
                            </div>

                           <?php //$this->load->view('kpis/disponibilidad'); ?>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label>Establecimiento destino</label>
                        
                        
                        <!-- -- -->
                        <select onchange="seleccionesta(this)" class="form-control select2 select2-hidden-accesible" id="esta_dest_id" required>
									<option value="" disabled selected>-Seleccione opcion-</option>
											<?php
											foreach ($establecimiento as $a) {
											echo '<option value="'.$a->esta_id.'">'.$a->esta_nom.'</option>';
											}
											?>
						</select>
                        <!-- -- -->
                        
                    </div>
                    <div class="col-md-3">
                        <label>Deposito</label>
                        <!-- -- -->
                        <select  class="form-control select2 select2-hidden-accesible" id="depo_id" readonly>
									<option value="" disabled selected>-Seleccione opcion-</option>
										
						</select>
                        <!-- -- -->
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Datos del transporte</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-4">
                        <label>Conductor</label>
                        <input id="conductor" class="form-control" placeholder="Ingrese Nombre">
                    </div>
                    <div class="col-md-4">
                        <label>Acoplado</label>
                        <input id="acoplado" class="form-control" placeholder="Ingrese numero de acoplado">
                    </div>
                    <div class="col-md-4">
                        <label>DNI</label>
                        <input id="conductor" class="form-control" placeholder="Ingrese DNI">
                    </div>
                </div>
                <br>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Productos a cargar</h3>
            </div>
            <div class="box-header">
                <div class="row">
                    <div class="col-md-4">
                        <label>Deposito origen</label>
                        <select  class="form-control select2 select2-hidden-accesible" id="depo_origen_id" required>
									<option value="" disabled selected>-Seleccione opcion-</option>
											<?php
											foreach ($depositos as $b) {
											echo '<option value="'.$b->depo_id.'">'.$b->descripcion.'</option>';
											}
											?>
						</select>
                    </div>
                    <div class="col-md-4">
                        <label>Codigo</label>
                        <?php $this->load->view(ALM . '/articulo/componente');?>
                    </div>
                    <div class="col-md-4">
                        <label>Cantidad</label>
                        <input type="number" id="cant_id" class="form-control" placeholder="Ingrese cantidad">
                    </div>
                    <div class="col-md-4">
                        <label>Unidad de Medida</label>
                        <select  class="form-control select2 select2-hidden-accesible" id="id_un" required>
									<option value="" disabled selected>-Seleccione opcion-</option>
											<?php
											foreach ($unidades as $u) {
											echo '<option value="'.$u->idun.'">'.$u->desc.'</option>';
											}
											?>
						</select>
                    </div>

                </div>
                <br>
                <div class="row">
                    <div class="col-md-3" style="float:right">
                        <button class="btn btn-primary " style="float:right;" onclick="agregarProducto()"><i
                                class="fa fa-check"></i>Agregar</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <br><br>
                        <table class="table table-striped" id="tbl_productos">
                            <thead class="thead-dark" bgcolor="#eeeeee">
                            <th>Acciones</th>
                            <th>Deposito Origen</th>
                            <th style="display:none;">DepoIdorigen</th>
                            <th>Lote</th>
                            <th>Codigo Articulo</th>
                            <th style="display:none;">arti_id</th>
                            <th>Descripcion Articulo</th>
                            <th>Cantidad</th>
                            <th>UM</th>
                            </thead>
                        
                            <tbody>

                            </tbody>
                        </table>


<?php
  //$kpiot = cantTipoOrdenTrabajo();

  //$equipoOperativo = sacarEquiposOperativos();
?>

<style type="text/css">
.daterange {
    position: relative;
}

.daterange i {
    position: relative;
    right: 24px;
    cursor: pointer;
}
</style>

<script>
 $(document).ready(function() {
               $("#totalCont").val(0);
 });
// remueve registro de tabla temporal 
$(document).on("click",".fa-minus",function() {
    
    var cantdel = $('#tbl_productos tr td')[7].innerText;
    if(parseInt(cantdel) > parseInt($("#totalCont").val()))
    { var contauxx = parseInt(cantdel) -  parseInt($("#totalCont").val());
      $("#total").text(contauxx);
      $("#totalCont").val(contauxx);
    }
    else{
        var contauxx = parseInt($("#totalCont").val()) - parseInt(cantdel);
        $("#total").text(contauxx);
        $("#totalCont").val(contauxx);
    }
    
	$('#tbl_productos').DataTable().row( $(this).closest('tr') ).remove().draw();
           
});



/* obtengo datos de disponibilidad */
var idEquipo = 'all';
//getDisponibilidad(idEquipo);

function getDisponibilidad(idEquipo) {
    //WaitingOpen("Obteniendo datos de disponibilidad...");
    $.ajax({
            type: 'POST',
            data: {id_esta},
            url: 'index.php/<?php echo ALM?>MovimientoDepo/traerDepositos',
            success: function(data) {
                var resp = JSON.parse(data);
                console.table(resp);
                console.table(resp[0].depo_id);
                $('#depo_id').empty();
                for(var i=0; i<resp.length; i++)
                {
                    $('#depo_id').append("<option value='" + resp[i].depo_id + "'>" +resp[i].descripcion+"</option");
                }
                $("#depo_id").removeAttr('readonly');
            },
            error: function(data) {
                alert('Error');
            }
        });
}

$('#checkboxEquipoID').focusin(function() {
    //console.log('Equipos');
    $(this).prev().prop("checked", true);
});
// $('#radioDisponibilidadAll').focusin(function() {
//     //console.log('Todos');
//     getDisponibilidad('all');
// });

// autocomplete para codigo
// var dataEquipos = function() {
//     var tmp = null;
//     $.ajax({
//         'async': false,
//         'type': "POST",
//         'global': false,
//         'dataType': 'json',
//         'url': "index.php/Otrabajo/getEquipoDisponibilidad",
//         'success': function(data) {
//             tmp = data;
//         }
//     });
//     return tmp;
// }();
// $("#checkboxEquipoID").autocomplete({
//     source: dataEquipos,
//     delay: 500,
//     minLength: 1,
//     focus: function(event, ui) {
//         event.preventDefault();
//         $(this).val(ui.item.label);
//     },
//     select: function(event, ui) {
//         event.preventDefault();
//         $(this).val(ui.item.label); //value

//         getDisponibilidad(ui.item.value);
//     },
// });



//graficarMantenimiento();


function graficarMantenimiento() {
 //   WaitingOpen("Obteniendo datos de Mantenimiento...");
    var areaChartCanvas = document.getElementById("graficoMantenimiento");

    var myChart = new Chart(areaChartCanvas, {
                type: 'doughnut',
                data: {
                    <?php
            echo "labels: [";

            foreach ($kpiot as $key => $o) {
              echo "\"$o->descripcion\",";
            }
           
           echo "],datasets: [{
                data: [";
                foreach ($kpiot as $key => $o) {
                  echo $o->cantidad.",";
                }
           echo "]" 
            ?>,
                    backgroundColor: [
                        "#dd1100",
                        "#00CC00",
                        "#006612",
                        "#009933",
                        "#fad61d"
                    ]
                    // hoverBackgroundColor: [
                    //     "#f3fa1d",
                    //     "#ee2211",
                    //     "#117723",
                    //     "#11aa44",
                    //     "#11dd11"
                    // ]
                //}]
        },
        options: {
         //   cutoutPercentage: 40,
            legend: {
                position: 'bottom',
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //calculate the total of this data set
                        var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
                            return previousValue + currentValue;
                        });
                        //get the current items value
                        var currentValue = dataset.data[tooltipItem.index];
                        //calculate the precentage based on the total and current item, also this does a rough rounding to give a whole number
                        var precentage = Math.floor(((currentValue / total) * 100) + 0.5);

                        return currentValue + " (" + precentage + "%)";
                    }
                }
            }
        }
    }
    if(aux != 0)
    {
        
        var depoOrigen_id = $("#depo_origen_id").val();
        var descDepo = $("#depo_origen_id option:selected").text();
        var Lote = 200;
        var codigoArt = $("#inputarti").val();
        var idARTICULO = $("#articulos");
        var idarti = $("#idArt").val();
        var aux = $("#info").text();
        var descArt = "";
        //le saco el stock para mostrar solo el nombre del articulo
        var len = aux.length;
                for(var j=0; j<aux.length; j++)
                {
                    if(aux[j] != "|")
                    {descArt = descArt + aux[j];}
                    else{
                        j = aux.length;
                    }
                    
                }

        var cant = $("#cant_id").val();
        var um = $("#id_un option:selected").text();

        var table = $('#tbl_productos').DataTable();
        var row = `<tr data-json=''>  
                <td> <i class='fa fa-fw fa-minus text-light-blue' style='cursor: pointer; margin-left: 15px;'></i> </td>
                <td>${descDepo}</td>
                <td style='display:none;'>${depoOrigen_id}</td>
                <td>${Lote}</td>
                <td>${codigoArt}</td>
                <td style='display:none;'>${idarti}</td>    
                <td>${descArt}</td>
                <td>${cant}</td>
                <td>${um}</td>
            </tr>`;
        table.row.add($(row)).draw();
        var contaux = parseInt(cant) +  parseInt($("#totalCont").val());
        $("#total").text(contaux);
        $("#totalCont").val(contaux);

//graficarEquiposOperativos();
/* grafico KPI Equipos Operativos */
function graficarEquiposOperativos() {
   // WaitingOpen("Obteniendo datos de Equipos Operativos...");
    var areaChartCanvas = document.getElementById("graficoEquiposOperativos");

    }else{
        alert("ATENCION!!! HAY CAMPOS DE PRODUCTOS A CARGAR VACIOS");
    }
}
function guardar()
{
    var auxe = 0;
    if($("#nroCompr").val()!=null)
    {
        if($("#depo_id").val()!=null)
        {
            if(  $('#tbl_productos').DataTable().data().any() ) 
            {
                auxe = 1;
            }
        }
    }
    if(auxe!=0)
    {

    }else{
        alert("ATENCION REVISE QUE HAYA CARGADO: Nro comprobante/deposito destino/productos");
    }
}
//Date picker
$('#datepicker').datepicker({
    autoclose: true
});

$('#myTable').DataTable("");
// $('.select2').select2();
</script>