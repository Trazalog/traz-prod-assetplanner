<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Clientes</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" onclick="LoadCust(0,\'Add\')" id="btnAdd">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="customers" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Cliente</th>
                <th>CUIT/DNI</th>
                <th>Domicilio</th>
                <th>Télefonos</th>
              </tr>
            </thead>
            <tbody>
              <?php
              	foreach($list as $c){
                  if ($c['estado'] !='AN'){
	                $id = $c['cliId'];
                  echo '<tr  id="'.$id.'" >';
                  echo '<td>';
                    if (strpos($permission,'Edit') !== false) {
  	                	echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar Cliente" onclick="LoadCust('.$c['cliId'].',\'Edit\')"></i>';
                    }
                    if (strpos($permission,'Del') !== false) {
                     	echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar Cliente" data-toggle="modal" data-target="#modaleliminar"></i>';
                    }
                    if (strpos($permission,'View') !== false) {
  	                	echo '<i class="fa fa-fw fa-search text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Ver Cliente" onclick="LoadCust('.$c['cliId'].',\'View\')"></i>';
                    }
  	                echo '</td>';
  	                echo '<td style="text-align: left">'.$c['cliLastName'].' , '.$c['cliName'].'</td>';
                    echo '<td style="text-align: left">'.$c['cliDni'].'</td>';
                    echo '<td style="text-align: left">'.$c['cliAddress'].'</td>';
                    echo '<td style="text-align: left">'.($c['cliPhone'] != "" ? $c['cliPhone'].'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' : '').$c['cliMovil'].'</td>';
  	                echo '</tr>';
                } 
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
var idCli = 0;
var acCli = '';
var idcliglo = "";

  //Eliminacion del cliente
  $(".fa-times-circle").click(function (e) { 
    
    console.log("Esto eliminando"); 
    var cli = $(this).parent('td').parent('tr').attr('id');
    console.log("El id del cliente es:");
    console.log(cli);
    idcliglo=cli;
     
  });

  $(function () {
    //$("#groups").DataTable();
    $('#customers').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      "language": {
            "lengthMenu": "Ver _MENU_ filas por página",
            "zeroRecords": "No hay registros",
            "info": "Mostrando pagina _PAGE_ de _PAGES_",
            "infoEmpty": "No hay registros disponibles",
            "infoFiltered": "(filtrando de un total de _MAX_ registros)",
            "sSearch": "Buscar:  ",
            "oPaginate": {
                "sNext": "Sig.",
                "sPrevious": "Ant."
              }
        }
    });
  });
  
  $('#btnSave').click(function(){

  	if(acCli == 'View')
  	{
  		$('#modalCustomer').modal('hide');
  		return;
  	}

  	var hayError = false;
    if($('#cliNroCustomer').val() == '')
    {
    	hayError = true;
    }

    if($('#cliName').val() == '')
    {
      hayError = true;
    }

    if($('#cliLastName').val() == '')
    {
      hayError = true;
    }

    if($('#cliDni').val() == '')
    {
      hayError = true;
    }

    if($('#cliDateOfBirth').val() == '')
    {
      hayError = true;
    }

    if(hayError == true){
    	$('#errorCust').fadeIn('slow');
    	return;
    }

    var picture = jQuery('#foto');
    var blob = picture[0].toDataURL("image/png");

    var preferences = [];
    preferences.push(0);
    $('#preferences :checked').each(function() {
        preferences.push($(this).attr('id'));
    });

    $('#errorCust').fadeOut('slow');
    WaitingOpen('Guardando cambios');
    	$.ajax({
          	type: 'POST',
          	data: { 
                    id : idCli, 
                    act: acCli, 
                    nro: $('#cliNroCustomer').val(),
                    name: $('#cliName').val(),
                    lnam: $('#cliLastName').val(),
                    dni: $('#cliDni').val(),
                    mail: $('#cliEmail').val(),
                    fech: $('#cliDateOfBirth').val(),
                    dom: $('#cliAddress').val(),
                    tel: $('#cliPhone').val(),
                    movil: $('#cliMovil').val(),
                    zona: $('#zonaId').val(),
                    img: blob,
                    update: $('#updatePicture').val(),
                    pref: preferences,
                    days: $('#cliDay').val(),
                    color: $('#cliColor').val()
                  },
    		url: 'index.php/Customer/setCustomer', 
    		success: function(result){
                			WaitingClose();
                			$('#modalCustomer').modal('hide');
                			//setTimeout("cargarView('Customer', 'index', '"+$('#permission').val()+"');",1000);
                      regresa();
    					},
    		error: function(result){
    					WaitingClose();
    					alert("error");
    				},
          	dataType: 'json'
    		});
  });

  function LoadCust(id_, action){
    idCli = id_;
    acCli = action;
    LoadIconAction('modalAction',action);
    WaitingOpen('Cargando Cliente');
      $.ajax({
            type: 'POST',
            data: { id : id_, act: action },
        url: 'index.php/Customer/getCustomer', 
        success: function(result){
                      WaitingClose();
                      $("#modalBodyCustomer").html(result.html);
                      $('#cliDateOfBirth').datepicker({
                        changeMonth: true,
                        changeYear: true
                      });
                      //ActiveCamera();
                      setTimeout("$('#modalCustomer').modal('show')",800);
              },
        error: function(result){
              WaitingClose();
              alert("error");
            },
            dataType: 'json'
        });
  }

  function guardareliminar(){

    console.log("Estoy guardando el eliminar , el id de cliente es:");
    console.log(idcliglo);
    $.ajax({
            type: 'POST',
            data: { idcliglo: idcliglo},
            url: 'Customer/BajaCliente', //index.php/
            success: function(data){
          
                    console.log(data);
                    alert("CLIENTE Eliminado");
                    regresa();
                  
                  },
              
            error: function(result){
                  
                  console.log(result);
                }
               // dataType: 'json'
      });

  } 

  function regresa(){
  
   //$('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Customer/index/<?php echo $permission; ?>");
    WaitingClose();
  }

</script>

<style type="text/css">
    .contenedor{ width: 350px; float: center;}
    #camara, #foto, #imgCamera{
        width: 320px;
        min-height: 240px;
        border: 1px solid #008000;
    }
</style>

<!-- Modal -->
<div class="modal fade" id="modalCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Cliente</h4> 
      </div>
      <div class="modal-body" id="modalBodyCustomer">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal eliminar-->
<div class="modal fade" id="modaleliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document" style="width: 50%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-times-circle" style="color: #dd4b39" > </span> Eliminar Equipos</h4>
      </div> <!-- /.modal-header  -->
      <div class="modal-body input-group ui-widget" id="modalBodyArticle">

        <label >¿Realmente desea ELIMINAR CLIENTE?  </label>
            
      </div>  <!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        <button type="button" class="btn btn-primary" id="btnSave" data-dismiss="modal" onclick="guardareliminar()" >SI</button>
      </div>  <!-- /.modal footer -->  
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->