<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Recepción de deposito</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-4">
                        <label>Establecimiento</label>
                        
                        
                        <!-- -- -->
                        <select onchange="seleccionesta(this)" class="form-control select2 select2-hidden-accesible" id="esta_dest_id" required>
									<option value="" disabled selected>-Seleccione Su establacimiento-</option>
											<?php
											foreach ($establecimiento as $a) {
											echo '<option value="'.$a->esta_id.'">'.$a->esta_nom.'</option>';
											}
											?>
						</select>
                        <!-- -- -->
                    </div>
                    <div class="col-md-4">
                        <label>Deposito</label>
                        <!-- -- -->
                        <select  class="form-control select2 select2-hidden-accesible" id="depo_id" readonly>
									<option value="" disabled selected>-Seleccione Su deposito-</option>
										
						</select>
                        <!-- -- -->
                    </div>
                    <div class="col-md-1" style="margin-top:2.5rem;">
                        <button class="btn btn-primary "  onclick="BucarRecepciones()"><i
                                class="fa fa-search"></i>Buscar</button>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        <!-- <br><br> -->
                        <table class="table table-striped" id="tbl_recepciones" style="display:none">
                            <thead class="thead-dark" bgcolor="#eeeeee">
                            <th>Acciones</th>
                            <th>Deposito Origen</th>
                            <th style="display:none;">DepoIdorigen</th>
                            <th>Nro Comprobante</th>
                            </thead>
                        
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
               
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Datos del remito</h3>
            </div>
            <div class="box-body">
                <div class="row">
                <div class="col-md-4">
                        <div class="form-group">
                            <label>Remito enviado</label>
                            <input type="number" id="remito" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Fecha actual</label>
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="date" value="<?php echo date('Y-m-d');?>" class="form-control pull-right" id="fecha_actual"  readonly>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Fecha envío</label>
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" id="fec_envio" class="form-control pull-right"  readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Datos del transporte</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-4">
                        <label>Patente</label>
                        <input id="patente" class="form-control" readonly>
                    </div>
                    <div class="col-md-4">
                        <label>Acoplado</label>
                        <input id="acoplado" class="form-control" readonly>
                    </div>
                    <div class="col-md-4">
                        <label>Conductor</label>
                        <input id="conductor" class="form-control" readonly>
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
                <!-- <div class="row">
                    <div class="col-md-4">
                        <label>Deposito origen</label>
                        <?php 
                        // echo "<select class='form-control'>";
                        // echo "<option selected disabled> Default </option>";
                        // foreach($deposito as $depo){
                        //     echo "<option id='$depo.id'>$depo.nombre</option>";
                        // }
                        // echo "</select>";
                        ?>
                    </div>
                    <div class="col-md-4">
                        <label>Codigo</label>
                        <input id='codi_id' class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label>Cantidad</label>
                        <input type="number" id="cant_id" class="form-control">
                    </div>
                </div> -->
                <!-- <br>
                <div class="row">
                    <div class="col-md-3" style="float:right">
                        <button class="btn btn-primary " style="float:right;" onclick="agregarProducto()"><i
                                class="fa fa-check"></i>Agregar</button>
                    </div>
                </div> -->
                <div class="row">
                    <div class="col-md-12">
                        <!-- <br><br> -->
                        <table class="table table-striped" id="tbl_productos_recepcion" style="display:none">
                            <thead class="thead-dark" bgcolor="#eeeeee">
                            <th>Codigo</th>
                            <th>Lote</th>
                            <th>Articulo</th>
                            <th>Cantidad Enviada</th>
                            <th>Cantidad Recepcion</th>
                            <th>Deposito Descargar</th>
                            <th>Estado</th>
                            </thead>
                        
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
                <br><br>
                <div class="row">
                    <div class="col-md-9">
                        <div class="form-group">
                            <label>Observaciones</label>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <!-- <div class="col-md-3">
                        <div class="form-group">
                            <label>Productos recepcionados</label>
                            <br>
                            <label style=" font-size: xx-large; margin-left: 7rem;" id="total">0</label>
                            <input type="number" id="totalCont" style="display:none;">
                        </div>
                    </div> -->
                </div>
                <div class="row">
                    <div class="col-md-1" style="float:right">
                        <button class="btn btn-primary " style="float:right;" onclick="guardar()"><i
                                class="fa fa-check"></i>Guardar</button>
                    </div>
                    <div class="col-md-1" style="float:right">
                        <button class="btn btn-primary " style="float:right;" onclick="imprimir()"><i
                                class="fa fa-clone"></i>Imprimir</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$("#depo_dest").click(function(){
    alert("dentro depo");
});

$("#estado").click(function(){
    alert("dentro estado");
});

$(document).on("click",".ver",function() {
   
    datajson = $(this).parents("tr").attr("data-json");
    var data = JSON.parse(datajson);
    console.table(data);
    $("#tbl_productos_recepcion").removeAttr('style');
    $("#remito").val(data.nro_comprobante);
    $("#fec_envio").val(data.fecha_envio);
    $("#patente").val(data.patente);
    $("#conductor").val(data.conductor);
    $("#acoplado").val(data.acoplado);
    var tabla = $('#tbl_productos_recepcion').DataTable();
    tabla.clear().draw();
    for(var i=0; i<data.productos.length; i++)
    {
        var table = $('#tbl_productos_recepcion').DataTable();
        var row = `<tr data-json=''>  
                <td>${data.productos[i].cod_art}</td>
                <td>${data.productos[i].lote}</td>
                <td>${data.productos[i].desc_art}</td>   
                <td>${data.productos[i].cant_enviada}</td>
                <td><input id='cant${i}' style='border:none;' placeholder='Ingrese cantidad recepcion'></td>
                <td><input id='depodesc${i}' style='border:none;' placeholder='Ingrese deposito a descargar'></td>
                <td><input id='estado${i}' style='border:none;' placeholder='Ingrese estado'></td>
            </tr>`;
        table.row.add($(row)).draw();
    
    }
  
           
});
function BucarRecepciones()
{
    var id_esta_dest = $("#esta_origen_id").val();
    var id_depo_dest = $("#depo_id").val();
   
    $.ajax({
            type: 'POST',
            data: {id_esta_dest, id_depo_dest},
            url: 'index.php/<?php echo ALM?>MovimientoDepoRecep/traerRecepciones',
            success: function(data) {
                var resp = JSON.parse(data);
                console.table(resp);
                // console.table(resp[0].depo_id);
                // $('#depo_id').empty();
                $("#tbl_recepciones").removeAttr('style');
                for(var i=0; i<resp.length; i++)
                {
                    var table = $('#tbl_recepciones').DataTable();
                    var row = `<tr data-json='${resp[i].json}'>  
                            <td> <i class='fa fa-fw fa-search text-light-blue ver' style='cursor: pointer; margin-left: 15px;'></i> </td>
                            <td>${resp[i].descripcion_depo_origen}</td>
                            <td style='display:none;'>${resp[i].depo_id_origen}</td>
                            <td>${resp[i].nro_comprobante}</td>
                        </tr>`;
                    table.row.add($(row)).draw();
                }
               
            },
            error: function(data) {
                alert('Error');
            }
        });
   
}

function guardar()
{
    
    var auxe = 0;
            //VALIDADOR DE SI ESTA VACIO LA TABLA DE PRODUCTOS A CARGAR
            if(  $('#tbl_productos_recepcion').DataTable().data().any() ) 
            {
                    //VALIDADOR DE VACIO DE ULTIMAS 3 COLUMNAS DE TABLA PRODUCTOS A CARGAR
                    var a = $('#tbl_productos_recepcion tr').length;
                    var idcant="";
                    var iddepodes="";
                    var idestado="";
                    for(var i=0; i<a-1; i++)
                    {   
                        idcant="#cant"+i;
                        iddepodes="#depodesc"+i;
                        idestado="#estado"+i;
                        if($(idcant).val()!="")
                        {
                            if($(iddepodes).val()!="")
                            {
                                if($(idestado).val()!="")
                                {
                                    auxe=auxe+1;
                                }
                            }
                        }

                    }
                    //FIN VALIDADOR
            }
    
    if((auxe!=0) && (auxe==a-1))
    {
        debugger;
        var postRecepcion = new FormData();
        postRecepcion = formToObject(postRecepcion);
        postRecepcion.fecha_recepcion = $("#fecha_actual").val();
        postRecepcion.depo_id = $("#depo_id").val();
        var productosRecep= [];	
					var rows = $('#tbl_productos_recepcion tbody tr');	
						
					rows.each(function(i,e) {
						productosRecep.push(getJSON(e));	
					});
        postRecepcion.productos = productosRecep;
    }else{
        alert("ATENCION REVISE QUE HAYA COMPLETATDO cantidad de recepcion/ deposito a descargar/ estado");
    }
}

function seleccionesta(opcion){
    // alert("dentro");
    var id_esta = $("#esta_dest_id").val();
    console.table(id_esta);
    $.ajax({
            type: 'POST',
            data: {id_esta},
            url: 'index.php/<?php echo ALM?>MovimientoDepoRecep/traerDepositos',
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
//Date picker
$('#datepicker').datepicker({
    autoclose: true
});

$('#myTable').DataTable("");


</script>