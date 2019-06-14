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
          <table id="empresas" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Empresa/institucion</th>
                <th>CUIT/DNI</th>
                <th>Domicilio</th>
                <th>Télefonos</th>
              </tr>
            </thead>
            <tbody>
              <?php
              foreach($list as $c)
              {
                $id=$c['id_empresa'];
                echo '<tr id="'.$id.'" class="'.$id.'" >';
                echo '<td>';
                if (strpos($permission,'Edit') !== false) {
                  echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" onclick="LoadCust('.$c['id_empresa'].',\'Edit\')"></i>';
                }
                if (strpos($permission,'Del') !== false) {
                  echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar"></i>';
                }
                if (strpos($permission,'View') !== false) {
                  echo '<i class="fa fa-fw fa-search text-light-blue" style="cursor: pointer; margin-left: 15px;" onclick="LoadUsr('.$c['id_empresa'].',\'View\')"></i>';
                }
                echo '</td>';
                echo '<td>'.$c['id_empresa'].' , '.$c['descripcion'].'</td>';
                echo '<td>'.$c['empcuit'].'</td>';
                echo '<td>'.$c['empdir'].'</td>';
                echo '<td>'.($c['emptelefono'] != "" ? $c['emptelefono'] : '').'</td>';
                echo '</tr>';
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

function LoadCust(id_, action){
  idCli = id_;
  acCli = action;
  //alert('id: '+idCli+' - action: '+acCli);
  LoadIconAction('modalAction',action);
  WaitingOpen('Cargando Cliente');
  $.ajax({
    type: 'POST',
    data: { id : id_, act: action },
    url: 'index.php/Empresa/getempresa',
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

$('#btnSave').click(function(){
	if(acCli == 'View')
	{
		$('#modalCustomer').modal('hide');
		return;
	}

	var hayError = false;

  if($('#empName').val() == '')
  {
    hayError = true;
  }

  if($('#empcuit').val() == '')
  {
    hayError = true;
  }

  if(hayError == true){
  	$('#errorCust').fadeIn('slow');
  	return;
  }

  $('#errorCust').fadeOut('slow');
  WaitingOpen('Guardando cambios');
  $.ajax({
    type: 'POST',
    data: {
      id : idCli,
      act: acCli,
      nro: $('#emproCustomer').val(),
      name: $('#empName').val(),
      cuit: $('#empcuit').val(),
      mail: $('#empEmail').val(),
      dom: $('#empAddress').val(),
      tel: $('#empPhone').val(),
      movil: $('#empMovil').val(),
      zona: $('#zonaId').val(),
    },
    url: 'index.php/empresa/setempresa',
    success: function(result){
      WaitingClose();
      $('#modalCustomer').modal('hide');
      setTimeout("cargarView('empresa', 'index', '"+$('#permission').val()+"');",1000);
    },
    error: function(result){
      WaitingClose();
      alert("error");
    },
    dataType: 'json'
  });
});

var ed="";
//eliminar cliente
$(".fa-times-circle").click(function (e) {
  console.log("Esto eliminando");
  var idcli = $(this).parent('td').parent('tr').attr('id');
  console.log(idcli);
  ed=idcli;

  $.ajax({
    type: 'POST',
    data: { idcli: idcli},
    url: 'index.php/Empresa/baja_cliente', //index.php/
    success: function(data){
      //var data = jQuery.parseJSON( data );
      console.log(data);
      //$(tr).remove();
      alert("Cliente Eliminado");
      regresa();
    },
    error: function(result){
      console.log(result);
    },
    // dataType: 'json'
  });
});

function regresa(){
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Empresa/index/<?php echo $permission; ?>");
  WaitingClose();
}


$(function(){
  
  /* cargo plugin DataTable (debe ir al final de los script) */
  $("#empresas").DataTable({
    "aLengthMenu": [ 10, 25, 50, 100 ],
    "columnDefs": [ {
      "targets": [ 0 ], 
      "searchable": false
    },
    {
      "targets": [ 0 ], 
      "orderable": false
    } ],
    "order": [[1, "asc"]],
  });
  
});
</script>

<style type="text/css">
.contenedor { 
    width: 350px; 
    float: center;
}
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