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
                            <input type="number" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Fecha</label>
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="datepicker">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label>Establecimiento destino</label>
                        <?php 
                        echo "<select class='form-control'>";
                        echo "<option selected disabled> Default </option>";
                        foreach($establecimiento as $esta){
                            echo "<option id='$esta.id'>$esta.nombre</option>";
                        }
                        echo "</select>";
                        ?>
                    </div>
                    <div class="col-md-3">
                        <label>Deposito</label>
                        <?php 
                        echo "<select class='form-control'>";
                        echo "<option selected disabled> Default </option>";
                        foreach($depositos as $depo){
                            echo "<option id='$depo.id'>$depo.nombre</option>";
                        }
                        echo "</select>";
                        ?>
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
                        <input id="conductor" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label>Acoplado</label>
                        <input id="acoplado" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label>Conductor</label>
                        <input id="conductor" class="form-control">
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
                        <?php 
                        echo "<select class='form-control'>";
                        echo "<option selected disabled> Default </option>";
                        foreach($deposito as $depo){
                            echo "<option id='$depo.id'>$depo.nombre</option>";
                        }
                        echo "</select>";
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
                        <table class="egt" id="myTable">
                            <thead>
                                <tr>
                                    <td>Deposito origen</td>
                                    <td>Lote</td>
                                    <td>Código</td>
                                    <td>Artículo</td>
                                    <td>Cantidad</td>
                                    <td>UM</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Celda 1</td>
                                    <td>Celda 2</td>
                                    <td>Celda 3</td>
                                    <td>Celda 4</td>
                                    <td>Celda 5</td>
                                    <td>Celda 6</td>
                                </tr>
                                <tr>
                                    <td>Celda 1</td>
                                    <td>Celda 2</td>
                                    <td>Celda 3</td>
                                    <td>Celda 4</td>
                                    <td>Celda 5</td>
                                    <td>Celda 6</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <br><br>
                <div class="row">
                    <div class="col-md-9">
                        <div class="form-group">
                            <label>Observaciones</label>
                            <input type="number" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Productos recepcionados</label>
                            <input type="number" class="form-control">
                        </div>
                    </div>
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
//Date picker
$('#datepicker').datepicker({
    autoclose: true
});

$('#myTable').DataTable("");
</script>