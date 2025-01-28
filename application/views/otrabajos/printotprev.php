<div class="row">
    <div class="col-xs-12">
        <h1>Orden de trabajo</h1>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3>Datos de OT</h3>
        Id de Orden de trabajo: <?php echo $id_ot; ?><br>
        Nro de Orden de trabajo: <?php echo $nro; ?><br>
        Descripción: <?php echo $descripcion_ot; ?><br>
        Fecha Inicio: <?php echo $fecha_inicio; ?><br>
        Fecha de Entrega: <?php echo $fecha_entrega; ?><br>
        Fecha Programada: <?php echo $fecha_program; ?><br>
        Estado: <?php echo $estado; ?><br>
        Sucursal: <?php echo $sucursal; ?><br>
        Proveedor: <?php echo $nombreprov; ?><br>
        Origen: <?php echo $origen; ?><br>
        Asignado: <?php echo $asignado; ?><br>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3>Datos de Equipo</h3>
        Equipo: <?php echo $codigo; ?><br>
        Descripción: <?php echo $descripcion_eq; ?><br>
        Marca: <?php echo $marca; ?><br>
        Ubicación: <?php echo $ubicacion; ?>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3>Datos de la tarea</h3>
        Tarea: <?php echo $tarea['tareadescrip']; ?><br>
        Componente: <?php echo $tarea['descripComponente']; ?><br>
        Periodo: <?php echo $tarea['perido']; ?><br>
        Frecuencia: <?php echo $tarea['frecuencia']; ?><br>
        Lectura Base: <?php echo $tarea['lectura_base']; ?><br>
        Alerta: <?php echo $tarea['alerta']; ?><br>
        Duración: <?php echo $tarea['prev_duracion'].' '.$tarea['unidaddescrip']; ?><br>
        Cantidad Operarios: <?php echo $tarea['prev_canth']; ?><br>
    </div>
</div> 
<div class="row">
    <div class="col-xs-12">
        <h3>Herramientas</h3>
        <div class="table-responsive">
            <table class="table table-bordered" id="TablaHerramientas" width="100%" style="text-align:justify; border-collapse: collapse;" border="1px solid black">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Marca</th>
                        <th>descripción</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                    if( $tarea['herramientas'][0]!=false && count($tarea['herramientas'][0]) > 0) 
                    {
                        foreach($tarea['herramientas'][0] as $a)
                        {
                            echo '<tr>';
                            echo '<td>'.$a['herrcodigo'].' </td>';
                            echo '<td>'.$a['herrmarca'].' </td>';
                            echo '<td>'.$a['herrdescrip'].' </td>';
                            echo '<td>'.$a['cantidad'].' </td>';
                            echo '</tr>';
                        }
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3>Insumos</h3>
        <div class="table-responsive">
            <table class="table table-bordered" id="TablaInsumos" width="100%" style="text-align:justify; border-collapse: collapse;" border="1px solid black">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>descripción</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                    if( $tarea['insumos'][0]!=false && count($tarea['insumos'][0]) > 0) 
                    {
                        foreach($tarea['insumos'][0] as $a)
                        {
                            echo '<tr>';
                            echo '<td>'.$a['artBarCode'].' </td>';
                            echo '<td>'.$a['artDescription'].' </td>';
                            echo '<td>'.$a['cantidad'].' </td>';
                            echo '</tr>';
                        }
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php if ($muestraFirma): ?>

<div class="row">
    <div class="col-xs-12">
        <br>
        Fecha y hora inicio: <?php ($fecha_inicio) ? print_r($fecha_inicio) : print_r('') ?><br>
        Fecha y hora fin: <?php ($fecha_terminada) ? print_r($fecha_terminada) : print_r('') ?><br>
    </div>
</div> 


<div class="row" style="display: flex; justify-content: center; align-items: center; margin-top: 150px; text-align: center;">
    
    <div style="margin-right: 50px;">
        ___________________________<br>
        <strong>Firma y Aclaración del Supervisor</strong>
    </div>
    <div style="margin-left: 50px;">
        ___________________________<br>
        <strong>Firma y Aclaración del Mantenedor</strong>
    </div>
</div>
<?php endif; ?>