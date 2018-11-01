<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Artículos</h3>
          <?php
          if (strpos($permission,'Add') !== false) { 
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" onclick="LoadArt(0,\'Add\')" id="btnAdd">Agregar</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="articles" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Código</th>
                <th>Descripción</th>
                <th>Familia</th>
                <th>Unidad de Medida</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              <?php
                if(isset($list))
                { 
                  if(count($list) > 0){              
                  	foreach($list as $a)
                    {
                      if ($a['artEstado'] != "AN") {
                        $id=$a['artId'];
                        echo '<tr  id="'.$id.'" >';
                        echo '<td>';
                        if (strpos($permission,'Edit') !== false) {
                          echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar" data-toggle="modal" data-target="#modaleditar"></i>';
                        }
                        if (strpos($permission,'Del') !== false) {
                          echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar" data-toggle="modal" data-target="#modaleliminar"></i>';
                        }
                        if (strpos($permission,'View') !== false) {
      	                	echo '<i class="fa fa-fw fa-search text-light-blue" style="cursor: pointer; margin-left: 15px;" onclick="LoadArt('.$a['artId'].',\'View\')"></i>';
                        }
      	                echo '</td>';
                        echo '<td>'.$a['artBarCode'].'</td>';
      	                echo '<td>'.$a['artDescription'].'</td>';
                        echo '<td>'.$a['famName'].'</td>';
                        echo '<td>'.$a['descripcion'].'</td>';
                        echo '<td>'.($a['artEstado'] == 'AC' ? '<small class="label pull-left bg-green">Activo</small>' : ($a['artEstado'] == 'IN' ? '<small class="label pull-left bg-red">Inactivo</small>' : '<small class="label pull-left bg-yellow">Suspendido</small>')).'</td>';
      	                echo '</tr>';
          		        }
                    }
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
var idArt     = 0;
var acArt     = "";
var idelim    = "";
var ida       = "";
var estadovar = "";
var estadoid  = "";

// Abre modal agregar artículos
function LoadArt(id_, action){
  idArt = id_;
  acArt = action;
  LoadIconAction('modalAction',action);
  WaitingOpen('Cargando Artículo');
  $.ajax({
    type: 'POST',
    data: { id : id_, act: action },
    url: 'index.php/Article/getArticle', 
    success: function(result){
      $("#modalBodyArticle").html(result.html);
      $('#modalArticle').modal('show');
      WaitingClose();
      //$("#artCantBox").maskMoney({allowNegative: true, thousands:'', decimal:'.'});
      //$("#artCoste").maskMoney({allowNegative: true, thousands:'', decimal:'.'});
      //$("#artMargin").maskMoney({allowNegative: true, thousands:'', decimal:'.'});
      //CalcularPrecio();
      //$("[data-mask]").inputmask();
    },
    error: function(result){
      console.error("error");
      console.table(result);
      WaitingClose();
    },
    dataType: 'json'
  });// Ok
}

// Trae datos para llenar el modal Editar 
$(".fa-pencil").click(function (e) { // Ok
  var idartic = $(this).parent('td').parent('tr').attr('id');
  console.log("ID de articulo es: "+idartic);
  ida = idartic;
  $('#artBarCode').val('');
  $('#artDescription').val('');
  $('#artIsByBox').val('');
  $('#artCantBox').val('');
  $('#famId').html('');
  $('#unidmed').html('');
  $('#artEstado').val('');
  $('#puntped').val('');
  $.ajax({
    data: { idartic:idartic },
    dataType: 'json',
    type: 'POST',
    url:  'index.php/Article/getpencil',
    success: function(data){
      datos = {
        'codigoart'       : data[0]['artBarCode'],
        'descripart'      : data[0]['artDescription'],
        'artIsByBox'      : data[0]['artIsByBox'],
        'artcant'         : data[0]['artCantBox'],
        'idfam'           : data[0]['famId'],
        'famDsc'          : data[0]['famName'],
        'estado'          : data[0]['artEstado'],
        'idunidad'        : data[0]['unidadmedida'],
        'unidadmedidades' : data[0]['descripcion'],
        'punto_pedido'    : data[0]['punto_pedido'],
      }
      completarEdit(datos);
    },
    error: function(result){
      console.error("Error al traer datos para llenar Modal Editar");
      console.table(result);
    },
  });
});

// Llena campos del modal Editar
function completarEdit(datos){ // Ok
  console.table(datos);
  $('#artBarCode').val(datos['codigoart']);
  $('#artDescription').val(datos['descripart']);

  if(datos['artIsByBox'] == 1) {
    $('#artIsByBox').prop('checked', true);
    $('#artCantBox').val(datos['artcant']);
    $('#artCantBox').removeAttr('disabled');
  } else {
    $('#artIsByBox').prop('checked', false);
    $('#artCantBox').val('');
    $('#artCantBox').attr('disabled', true);
  }

  traer_familia(datos['idfam']);
  traer_estado(datos['estado']);
  traer_unidad(datos['idunidad']);
  $('#puntped').val(datos['punto_pedido']);
}

// Trae familias y llena select
function traer_familia(famId){ // Ok
  $.ajax({
    data: { famId:famId },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Article/getdatosfam',
    success: function(data){
      $('#famId').empty();
      for(var i=0; i < data.length ; i++) {
        var nombre = data[i]['famName'];
        var selected = (famId == data[i]['famId']) ? 'selected' : '';
        var opcion  = "<option value='"+data[i]['famId']+"' " +selected+ ">" +nombre+ "</option>" ; 
        $('#famId').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
  });
}

// Trae estado de artículo y llena select
function traer_estado(estado){ // Ok
  var estados = [
    ['AC', 'Activo'],
    ['IN', 'Inactivo'],
    ['AN', 'Anulado'],
  ];
  $('#artEstado').empty();
  for(var i=0; i < estados.length ; i++) {
    var nombre = estados[i][1];
    var selected = (estado == estados[i][0]) ? 'selected' : '';
    var opcion  = "<option value='"+estados[i][0]+"' " +selected+ ">" +nombre+ "</option>" ; 
    $('#artEstado').append(opcion); 
  }
}

// trae unidad de medida y llena select
function traer_unidad(idunidad){ // Ok
  $.ajax({
    data: { },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Article/getdatosart', 
    success: function(data){
      $('#unidmed').empty(); 
      for(var i=0; i < data.length ; i++)  {    
        var nombre = data[i]['descripcion'];
        var selected = (idunidad == data[i]['id_unidadmedida']) ? 'selected' : '';
        var opcion  = "<option value='"+data[i]['id_unidadmedida']+"' " +selected+ ">" +nombre+ "</option>" ; 
        $('#unidmed').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
  });// Ok
}

// Edita los datos de artículo
function guardareditar(){ // Ok
  var codigo     = $('#artBarCode').val();
  var desc       = $('#artDescription').val();
  if($('#artIsByBox').is(':checked')){
    var box      = 1; 
    var unidades = $('#artCantBox').val();
  } else {
    var box = 0;
    var unidades   = '';
  }
  //var box        = $('#artIsByBox').val();
  
  var fam        = $('#famId').val();
  var estado     = $('#artEstado').val();
  var unmed      = $('#unidmed').val();
  var punto      = $('#puntped').val();
  var parametros = {
    // 'id_equipo': id_equipo, // el id_equipo es ida
    'artBarCode'    : codigo,
    'artDescription': desc,
    'artIsByBox'    : box,
    'artCantBox'    : unidades,
    'famId'         : fam,
    'artEstado'     : estado,
    'unidadmedida'  : unmed,
    'punto_pedido'  : punto
  };
  console.log("estoy editando");
  console.table(parametros);
  $.ajax({
    type: 'POST',
    data: {data:parametros, ida: ida},
    url: 'index.php/Article/editar_art',
    success: function(data){
      regresa();                    
    },
    error: function(result){
      console.error("Error al editar Artículo");
      console.table(result);
    }
    //dataType: 'json'
  });
}






$(document).ready(function(event) { 
   
  $('#btnSave').click(function(){
  	if(acArt == 'View')
  	{
  		$('#modalArticle').modal('hide');
  		return;
  	}

  	var hayError = false;
    if($('#artBarCode').val() == '')
    {
      hayError = true;
    }

    if($('#artDescription').val() == '')
    {
      hayError = true;
    }

    if(hayError == true){
    	$('#errorArt').fadeIn('slow');
    	return;
    }

    $('#error').fadeOut('slow');
    WaitingOpen('Guardando cambios');
    $.ajax({
      type: 'POST',
      data: { 
        id :      idArt, 
        act:      acArt, 
        code:     $('#artBarCode').val(),
        name:     $('#artDescription').val(),
        fam:      $('#famId').val(),
        status:   $('#artEstado').val(),
        box:      $('#artIsByBox').prop('checked'),
        boxCant:  $('#artCantBox').val(),
        unidmed:  $('#unidmed').val(),
        puntped:  $('#puntped').val()  
      },
      url: 'index.php/Article/setArticle', 
      success: function(result){
        console.log("estoy Guardando");
        WaitingClose();
        $('#modalArticle').modal('hide');
        setTimeout("cargarView('Article', 'index', '"+$('#permission').val()+"');",1000);
      },
      error: function(result){
        WaitingClose();
        alert("error");
      },
      dataType: 'json'
    });
  });

  $(".fa-times-circle").click(function (e) { 
    console.log("Esto eliminando"); 
    var idar = $(this).parent('td').parent('tr').attr('id');
    console.log("El id del articulo es:");
    console.log(idar);
    idelim=idar;
  });



  $('#artIsByBox').click(function() {
    if($('#artIsByBox').is(':checked')){
      $('#artCantBox').prop('disabled', false);
    } else {
      $('#artCantBox').val('');
      $('#artCantBox').prop('disabled', true);
    }
    CalcularPrecio();
  });

  $('#artMargin').keyup(function(){
    CalcularPrecio();
  });

  $('#artMarginIsPorcent').click(function() {
    CalcularPrecio();
  });

  $('#artCoste').keyup(function(){
    CalcularPrecio();
  });

  $('#artCantBox').keyup(function(){
    CalcularPrecio();
  });

  $('#articles').DataTable({
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

function CalcularPrecio(){
  var precioCosto   = $('#artCoste').val() == '' ? 0 : parseFloat($('#artCoste').val()).toFixed(2);
  var margen        = $('#artMargin').val() == '' ? 0 : parseFloat($('#artMargin').val()).toFixed(2);
  var margenEsPor   = $('#artMarginIsPorcent').is(':checked');
  var cantCaja      = $('#artCantBox').val() == '' ? 0 : parseFloat($('#artCantBox').val()).toFixed(2);
  var esPorCaja     = $('#artIsByBox').is(':checked');
  var costoUnitario = parseFloat(precioCosto);

  if(esPorCaja == true){
    costoUnitario = parseFloat(parseFloat(precioCosto) / parseFloat(cantCaja)).toFixed(2);
  }

  var pVenta = 0;
  if(margenEsPor){
    var importe = (parseFloat(margen) / 100) * parseFloat(costoUnitario);
    pVenta = parseFloat(parseFloat(importe) + parseFloat(costoUnitario)).toFixed(2);
  } else {
    pVenta = parseFloat(parseFloat(costoUnitario) + parseFloat(margen)).toFixed(2);
  }

  $('#pventa').html(pVenta);
}

function guardareliminar(){
  console.log("Estoy guardando el eliminar , el id de articulo es:");
  console.log(idelim);
  $.ajax({
    type: 'POST',
    data: { idelim: idelim},
    url: 'index.php/Article/baja_articulo', //index.php/
    success: function(data){
      //var data = jQuery.parseJSON( data );
      console.log(data);
      //$(tr).remove();
      alert("Articulo Eliminado");
      regresa();
    },
    error: function(result){
      console.log(result);
    }
    // dataType: 'json'
  });
} 

function regresa(){
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Article/index/<?php echo $permission; ?>");
  WaitingClose();
}
</script>





<!-- Modal -->
<div class="modal" id="modalArticle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Artículo</h4> 
      </div>

      <div class="modal-body" id="modalBodyArticle">
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal eliminar-->
<div class="modal" id="modaleliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar Artículo</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <p>¿Realmente desea ELIMINAR ARTICULO? </p>
      </div>  <!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave" data-dismiss="modal" onclick="guardareliminar()" >Eliminar</button>
      </div>  <!-- /.modal footer -->
      
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal -->
<!-- / Modal -->

<!-- Modal editar-->
<div class="modal" id="modaleditar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-pencil text-light-blue"></span> Editar Artículo</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Código <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control" id="artBarCode" value="" >
          </div>
        </div><br>

        <!-- Código del Artículo -->
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Descripción <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <input type="text" class="form-control" id="artDescription" value="" >
          </div>
        </div><br>
      
        <!-- Descripción del Artículo -->
        <div class="row">
          <div class="col-xs-10 col-sm-4">
            <label style="margin-top: 7px;">Se Compra x Caja <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-2 col-sm-1">
            <input type="checkbox" id="artIsByBox" style="margin-top:10px;" >
          </div>
          <div class="col-xs-12 col-sm-3">
            <label style="margin-top: 7px;">Unidades <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-4">
            <input type="text" class="form-control" id="artCantBox" value="" >
          </div>
        </div><br>

        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Familia: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control" id="famId"  name="famId" value="" >
            </select>
          </div>
        </div><br>

        <!-- -->
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Estado: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select class="form-control" id="artEstado"  name="artEstado"  value="" >
              
            </select>
          </div>
        </div><br>

        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Unidad de medida <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-12 col-sm-8">
            <select  class="form-control" id="unidmed" name="unidmed" value="">
            </select>
          </div>
        </div><br>

        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <label style="margin-top: 7px;">Punto de pedido<strong style="color: #dd4b39">*</strong>:</label>
        </div>
        <div class="col-xs-12 col-sm-8">
          <input type="text" name="puntped" id="puntped" class="form-control">
        </div>
      </div>  <!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave" data-dismiss="modal" onclick="guardareditar()" >Guardar</button>
      </div>  <!-- /.modal footer -->

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal -->
