<input type="hidden" id="permission" value="<?php echo $permission;?>">
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
          <h4><i class="icon fa fa-ban"></i> Error!</h4>
          Revise que todos los campos obligatorios esten seleccionados
      </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable"  id="error1" style="display: none">
          <h4><i class="icon fa fa-ban"></i> Error!</h4>
          NO HAY INSUMOS SUFICIENTES
      </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-success" id="error2" style="display: none">
          <h4></h4>
          HAY INSUMOS SUFICIENTES
      </div>
  </div>
</div>

<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Orden de Insumo</h3> 
          <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="listado">Ver Listado</button>';
          }
          ?>
        </div><!-- /.box-header -->
           
        <div class="box-body">
          <div class="row" >
            <div class="col-xs-12">

              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">Datos de Orden</h4>
                </div>

                <div class="panel-body">
                  <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="">Comprobante <strong style="color: #dd4b39">*</strong> :</label>
                      <input type="text" align=\"right\"  class="form-control" id="comprobante"  min="1" size="30" placeholder="Ingrese numero de comprobante..." >
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="">Fecha <strong style="color: #dd4b39">*</strong> :</label>
                      <input type="date" align=\"right\" class="form-control datepicker" id="fecha" size="29"  >
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="">Solicitante <strong style="color: #dd4b39">*</strong> :</label>
                      <!--<input type="text"  id="solicitante" name="solicitante" class="form-control input" placeholder="Ingrese Nombre..." >-->
                      <select id="solicitante" name="solicitante" class="form-control"   />  
                    </div>
                  </div><br>

                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                      <a href="#insum" aria-controls="home" role="tab" data-toggle="tab" class="fa fa-file-text-o icotitulo"> Insumos</a>
                    </li>
                  </ul>

                  <!-- Tab panes -->
                  <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="insum">
                      <div class="row">
                        <br>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                          <label for="">Codigo <strong style="color: #dd4b39">*</strong> :</label>
                          <select id="codigo" name="codigo" class="form-control"   />  
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                          <label for="">Descripción <strong style="color: #dd4b39">*</strong> :</label>
                          <input type="text" id="descripcion" name="descripcion" class="form-control" />  
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                          <label for="">Cantidad <strong style="color: #dd4b39">*</strong> :</label>
                          <input type="text" id="cantidad" name="cantidad" class="form-control">  
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                          <label for="">Deposito <strong style="color: #dd4b39">*</strong> :</label>
                          <select  id="deposito" name="deposito" class="form-control"  />  
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-3">
                          <br>
                          <button type="button" class="btn btn-primary" id="agregar"><i class="fa fa-check">Agregar</i></button>
                        </div>
                      </div><br>

                      <div class="row">
                        <div class="col-xs-12">
                          <table class="table table-bordered" id="tablainsumo"> 
                            <thead>
                              <tr>                      
                                <th></th>
                                <th>Código</th>
                                <th>Descripcion</th>
                                <th>Cantidad</th>
                                <th>Deposito</th>
                              </tr>
                            </thead>
                            <tbody></tbody>
                          </table>  
                        </div>
                      </div>

                    </div><!--div que cierra el panel-->
                  </div><!-- div que cierra el tab conte -->
                </div><!-- </div> CIERRE div del body-->
              </div>

            </div>
          </div>
        </div><!-- /.box-body -->
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default delete" onclick="limpiar()">Cancelar</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardar()" >Guardar</button>
        </div>  <!-- /.modal footer -->

      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->
<script>

 $('#listado').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Ordeninsumo/index/<?php echo $permission; ?>");
    WaitingClose();
  });
  
var idslote = new Array(); 
traer_codigo();
function traer_codigo(){
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Ordeninsumo/getcodigo', //index.php/
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#codigo').append(opcion);
      for(var i=0; i < data.length ; i++) 
      {   
          idslote[i] = data[i]['loteid'];
          var nombre = data[i]['artBarCode'];
          var opcion  = "<option value='"+data[i]['artId']+"'>" +nombre+ "</option>" ;
          $('#codigo').append(opcion); 
      }
    },
    error: function(result){       
      console.log(result);
    },
      dataType: 'json'
  });
}

trae_solicitante();
function trae_solicitante(){
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Ordeninsumo/getsolicitante',
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#solicitante').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {
        var nombre = data[i]['solicitante'];
        var opcion = "<option value='"+data[i]['id_solicitud']+"'>" +nombre+ "</option>" ; 
        $('#solicitante').append(opcion);
      }
    },
    error: function(result){   
      console.log(result);
    },
    dataType: 'json'
  });
}

traer_deposito();
function traer_deposito(artId){
  $('#deposito').html(""); 
  $.ajax({
    type: 'POST',
    data: {artId:artId },
    url: 'index.php/Ordeninsumo/getdeposito', //index.php/
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#deposito').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['depositodescrip'];
        var opcion  = "<option value='"+data[i]['depositoId']+"'>" +nombre+ "</option>" ; 
        $('#deposito').append(opcion);                        
      }
    },
    error: function(result){  
      console.log(result);
    },
    dataType: 'json'
  });
}

function limpiar(){
  $("#comprobante").val("");
  $("#fecha").val("");
  $("#solicitante").val("");
  $("#destino").val("");
  $("#codigo").val("");
  $("#descripcion").val("");
  $("#cantidad").val("");
  $("#deposito").val("");
  $('#tablainsumo tbody tr').remove();
}

function guardar(){    
  console.log("estoy guardando");
  var parametros = {
    'fecha': $('#fecha').val(),
    'solicitante': $('#solicitante').val(),
    'comprobante': $('#comprobante').val(),        
  };

  var idsinsumo = new Array();     
  $("#tablainsumo tbody tr").each(function (index) 
  {
    var i = $(this).attr('id');
    idsinsumo.push(i);            
  }); 

  comp = {};
  depo = {};

  $("#tablainsumo tbody tr").each(function (index) 
  {
    var campo1, campo2, campo3, campo4,campo5, campo6;
    var i = $(this).attr('id'); 
    console.log(i);
    $(this).children("td").each(function (index2) 
    {
      switch (index2) 
      {
        case 0: campo1 = $(this).text();
          break;
        case 1: campo2 = $(this).text();
          break;
        case 2: campo3 = $(this).text();
          break;
        case 3: campo4 = $(this).text();
          comp[i]=campo4;
          break;
        case 4: campo5 = $(this).text();               
          break;
        case 5: campo6 = $(this).text();
          depo[i]=campo6;                   
          break;
      }
    });
    console.log(comp);
    console.log(depo);
  });
     
  console.log("parametros de Orden");
  console.log(parametros);
  console.log("insumos id");
  console.log(idsinsumo);
  console.log("cantidad");
  console.log(comp);
  console.log("lotes");
  console.log(idslote);
  console.log("depo");
  console.log(depo);
  var hayError = false;

  if(parametros !=0 && idsinsumo !=0){
    //&& depo !=0 && idsinsumo >0 && comp >0
    $.ajax({
      type: 'POST',
      data: {data:parametros, comp:comp, idslote:idslote, depo:depo},
      url: 'index.php/Ordeninsumo/guardar',  //index.php/
      success: function(data){
        console.log("exito");
        console.log(data);
        regresa();                   
      },
      error: function(result){
        console.log("entro por el error");
        console.log(result);
      },
           // dataType: 'json'
    });
    limpiar();
  }
  else {
    var hayError = true;
    $('#error').fadeIn('slow');
    return;
  }

  if(hayError == false){
    $('#error').fadeOut('slow');
  }
}

$('#codigo').change(function(){
  var artId = $(this).val();
  console.log(artId);
  $.ajax({
    type: 'POST',
    data: {artId:artId }, 
    url: 'index.php/Ordeninsumo/getdescrip',
    success: function(data){
      console.log(data);
      var descrip = data[0]['artDescription']; 
      $('#descripcion').val(descrip);       
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
  traer_deposito(artId);
});

//agrega insumos a la tabla detainsumos
var i = 1;
$('#agregar').click(function (e) { 
  var $codigo     = $("select#codigo option:selected").html(); 
  var id_her      = $('#codigo').val();
  var descripcion = $('#descripcion').val();
  var cantidad    = $('#cantidad').val();
  var deposito    = $("select#deposito option:selected").html(); 
  var id_deposito = $('#deposito').val();
  var tr          = "<tr id='"+i+"'>"+
    "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
    "<td>"+$codigo+"</td>"+
    "<td>"+descripcion+"</td>"+
    "<td>"+cantidad+"</td>"+
    "<td>"+deposito+"</td>"+
    "<td class='hidden' id='"+id_deposito+"'>"+id_deposito+"</td>"+
    "</tr>";
  i++;    
  console.log(tr);
  console.log("El id de deposito es :"+ id_deposito);
  console.log("El codigo es:" +$codigo);
  console.log("El id de articulo:" + id_her);
  /* mando el codigo y el id _ deposito entonces traigo esa cantidad de lote*/
  var hayError = false;
  var Error1   = false;
  var Error2   = false;
  if ($codigo !=0 && cantidad >0 && id_deposito>0  ) {
    $.ajax({
      type: 'POST',
      data: { id_her:id_her, id_deposito:id_deposito}, 
      url: 'index.php/Ordeninsumo/alerta',
      success: function(data){
        console.log("exito en la elerta");
        console.log(data);
        var datos = parseInt(data);
        console.log(datos);
        if( cantidad<=datos ){
          if(Error1 == false){
            $('#error1').fadeOut('slow');
          }
          $('#error2').fadeIn('slow');
          $('#tablainsumo tbody').append(tr);
          $('#error2').fadeOut('slow');
        }
        else {
          // alert("No hay insumos suficientes,la cantidad de insumos disponibles es: " + data); 
          var Error1 = true;
          $('#error1').fadeIn('slow');
          return; 
        }           
      },
      error: function(result){
        console.log(result);
      },
      dataType: 'json'
    });
  }
  else {
    var hayError = true;
    $('#error').fadeIn('slow');
    return;
  }

  if(hayError == false){
    $('#error').fadeOut('slow');
  }

  if(Error1 == false){
    $('#error1').fadeOut('slow');
  }

  $(document).on("click",".elirow",function(){
    var parent = $(this).closest('tr');
    $(parent).remove();
  });

  $('#codigo').val('');
  $('#descripcion').val(''); 
  $('#cantidad').val(''); 
  $('#deposito').val('');
});

function regresa(){
  WaitingOpen();
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Ordeninsumo/index/<?php echo $permission; ?>");
  WaitingClose();
}

</script>