<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
		<div class="row">
				<div class="col-xs-12">
						<div class="box">
								<div class="box-header">
										<h3 class="box-title">Usuarios</h3>
										<?php
										if (strpos($permission,'Add') !== false) {
														echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" onclick="LoadUsr(0,\'Add\')" id="btnAdd">Agregar</button>';
										}
										?>
								</div><!-- /.box-header -->
								<div class="box-body" id="tabla">

								</div><!-- /.box-body -->
						</div><!-- /.box -->
				</div><!-- /.col -->
		</div><!-- /.row -->
</section><!-- /.content -->

<script>

$("#tabla").load("<?php echo base_url(); ?>User/getTabla/<?php echo $permission; ?>");

var idUsr = 0;
var acUsr = '';

function LoadUsr(id_, action){
    idUsr = id_;
    acUsr = action;

    //Se cambia el texto de #btnSave de acuerdo al contexto
    if( action == 'Add') {
        $('#btnSave').html('Agregar').show();
    }
    if( action == 'Edit') {
        $('#btnSave').html('Editar').show();
    }
    if( action == 'Del') {
        $('#btnSave').html('Eliminar').show();
    }
    if( action == 'View') {
        $('#btnSave').hide();
    }
    LoadIconAction('modalAction',action);
    WaitingOpen('Cargando Usuario');

    $.ajax({
        data: { id : id_, act: action },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/user/getUser',
        success: function(result){
            WaitingClose();
            $("#modalBodyUsr").html(result.html);
            setTimeout("$('#modalUsr').modal('show')",800);
        },
        error: function(result){
            WaitingClose();
            alert("error");
        },
    });
}

$("#0").on("submit", function(e){
    e.preventDefault();

    if(acUsr == 'View') {
        $('#modalUsr').modal('hide');
        return;
    }

    var hayError = false;

    if($('#usrNick').val() == '') {
        hayError = true;
    }

    if($('#usrName').val() == '') {
      hayError = true;
    }

    if($('#usrLastName').val() == '') {
      hayError = true;
    }

    if($('#usrComision').val() == '') {
      hayError = true;
    }

    if($('#usrPassword').val() != $('#usrPasswordConf').val()) {
      hayError = true;
    }

    if(hayError == true) {
        $('#errorUsr').fadeIn('slow');
        return;
    }

    $('#errorUsr').fadeOut('slow');

    //Preparo los datos para enviarlos al controlador
    var formData = new FormData(document.getElementById("0"));
    formData.append('id', idUsr); //estas 2 variables se cargan al llamar al usuario
    formData.append('act', acUsr);

    WaitingOpen('Guardando cambios');

    $.ajax({
        cache: false,
        contentType: false,
        data: formData,
        dataType: "html",
        processData: false,
        type: "POST",
        url: "index.php/user/test",
        success: function(data){
            WaitingClose();
            $('#modalUsr').modal('hide');
            $('.modal-backdrop').remove();//fix cierre del modal
												$("#tabla").load("<?php echo base_url(); ?>User/getTabla/<?php echo $permission; ?>");
            //cargarView( 'User', 'index', $('#permission').val() );
        },
        error: function(result){
            WaitingClose();
            //alert(result);
            //VER QUE MENSAJE MOSTRAR
            alert('Hubo un error al realizar la operación!');
        },
    });
});
</script>

<!-- Modal -->
<div class="modal fade" id="modalUsr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="POST" id="0" enctype="multipart/form-data" accept-charset="utf-8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Usuario</h4>
                </div>
                <div class="modal-body" id="modalBodyUsr">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" id="btnSave">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>













