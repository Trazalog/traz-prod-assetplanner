<div class="row">
    <div class="col-xs-12">
        <h1>Entrega de materiales</h1>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3>Datos de Materiales de Entrega</h3>
        Id de Entrega de Materiales: <?php echo $materiales[0]['enma_id']; ?><br>
        Solicitante: <?php echo $materiales[0]['solicitante']; ?><br>
        DNI: <?php echo $materiales[0]['dni']; ?><br>
        Destino: <?php echo $materiales[0]['destino']; ?><br>
        Comprobante: <?php echo $materiales[0]['comprobante']; ?><br>
        Id de Pedido de Materiales: <?php echo $materiales[0]['pema_id']; ?><br>
        Fecha de Alta: <?php echo $materiales[0]['fec_alta']; ?><br>
		Estado: <?php echo $materiales[0]['estado']; ?><br>
		 <!--__________________TABLA___________________________-->
		 <table id="tabla_entrega" class="table table-bordered table-striped">
		<thead class="thead-dark" bgcolor="#eeeeee">
				<th>Descripcion</th>
				<th>Cantidad</th>
		</thead>
		<tbody>
			<?php
				if($materiales)
				{
					foreach($materiales as $fila)
					{					
						echo "<tr>";
						echo    '<td>'.$fila['descripcion'].'</td>';
						echo    '<td>'.$fila['cantidad'].'</td>';                      
						echo "</tr>";
					}
				}
			?>
		</tbody>
	</table>
<!--__________________FIN TABLA___________________________-->
        
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="firma">
<label for="">_______________________</label>
<p>Firma</p>

<label for="">_______________________</label>
<p>DNI</p>

<label for="">_______________________</label>
<p>Aclaracion</p>



</div>
<script>
    DataTable($('#tabla_entrega'))
</script> 