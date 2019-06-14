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
        Ubicación: <?php echo $ubicacion; ?><br>
        Código de Componente: <?php echo $tarea['compEquipo']['codigoComponente']; ?><br>
        Descripción de Componente: <?php echo $tarea['compEquipo']['descripComponente']; ?><br>
        Sistema: <?php echo $tarea['compEquipo']['descripSistema']; ?><br>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3>Datos de la tarea</h3>
        Tarea: <?php print_r($tarea['tareadescrip']); ?><br>
        Fecha: <?php print_r($tarea['fecha']); ?><br>
        Duración: <?php print_r($tarea['back_duracion']); ?><br>
    </div>
</div>      
