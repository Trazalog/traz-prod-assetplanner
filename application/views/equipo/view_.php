<input type="hidden" id="permission" value="<?php echo $permission;?>">
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
          <h4><i class="icon fa fa-ban"></i> Error!</h4>
          Revise que todos los campos obligatorios esten seleccionados
      </div>
  </div>
</div>
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Equipo/Sector</h3>
          <?php
            if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="listado">Ver Listado</button>';
            }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          
          <div class="panel panel-default">
            <div class="panel-heading">
              <h2 class="panel-title"><span class="fa fa-globe"></span> Ubicación del Equipo / Sector</h2>
            </div>

            <div class="panel-body"">
              <div class="row">
                <div class="col-xs-12"> <!-- FIRST COLUMN -->
                  <!--<label>Empresa<strong style="color: #dd4b39">*</strong>: </label>
                  <select  id="empresa" name="empresa" class="form-control" value=""></select> -->
                  <input type="hidden" id="empresa" name="empresa" class="form-control" readonly>
                  <input type="hidden" id="id_empresa" name="id_empresa" class="form-control hidden" Disabled>
                </div>

                <!--<button type="button" class="btn btn-success" id="addempresa"  data-toggle="modal" data-target="#modalOrder"><i class="fa fa-plus"> Agregar</i></button>-->

                <!--<div class="col-xs-8"><label>Unidad Industrial<strong style="color: #dd4b39">*</strong> :</label>
                  <select id="unin" name="unin" class="form-control" value=""></select>
                </div>
                <div class="col-xs-4">
                  <label>&emsp;</label><br>
                  <button type="button" class="btn btn-success" id="addunidad"  data-toggle="modal" data-target="#modalunidad"><i class="fa fa-plus"> Agregar</i></button> 
                </div>-->
                <input type="hidden" id="unin" name="unin" class="form-control" value="<?php echo $empresa ?>">

                <div class="col-md-6 col-sm-12"> <!-- FIRST COLUMN -->
                  <div class="row">
                    <div class="col-xs-8"><label>Área:</label>
                      <select id="area" name="area" class="form-control" value=""></select>
                    </div>
                    <div class="col-xs-4">
                      <label>&emsp;</label><br>
                      <button type="button" class="btn btn-primary" id="addarea" data-toggle="modal" data-target="#modalarea"><i class="fa fa-plus"> Agregar</i></button> 
                    </div>

                    <div class="col-xs-8"><label>Proceso:</label>
                      <select  id="proceso" name="proceso" class="form-control" value=""></select>
                    </div>
                    <div class="col-xs-4">
                      <label>&emsp;</label><br>
                      <button type="button" class="btn btn-primary" id="addproceso" data-toggle="modal" data-target="#modalproceso"><i class="fa fa-plus"> Agregar</i></button>
                    </div>

                    <div class="col-xs-8"><label>Criticidad:</label>
                      <select id="criticidad" name="criticidad" class="form-control"></select>
                    </div>
                    <div class="col-xs-4">
                      <label>&emsp;</label><br>
                      <button type="button" class="btn btn-primary" id="addcriti" data-toggle="modal" data-target="#modalcrit"><i class="fa fa-plus"> Agregar</i></button> 
                    </div>
                  </div>
                </div>

                <div class="col-md-6 col-sm-12"> <!-- FIRST COLUMN -->
                  <div class="row">
                    <div class="col-xs-8"><label>Sector/Etapa<strong style="color: #dd4b39">*</strong>:</label>
                      <select id="etapa" name="etapa" class="form-control" value=""></select>
                    </div>
                    <div class="col-xs-4">
                      <label>&emsp;</label><br>
                      <button type="button" class="btn btn-primary" id="addetapa" data-toggle="modal" data-target="#modaletapa"><i class="fa fa-plus"> Agregar</i></button> 
                    </div>

                    <div class="col-xs-8"><label>Grupo:</label>
                      <select id="grupo" name="grupo" class="form-control"></select>
                    </div>
                    <div class="col-xs-4">
                      <label>&emsp;</label><br>
                      <button type="button" class="btn btn-primary" id="addgrupo" data-toggle="modal" data-target="#modalgrupo"><i class="fa fa-plus"> Agregar</i></button> 
                    </div>

                    <div class="col-xs-8"><label>Cliente:</label>
                      <select id="cliente" name="cliente" class="form-control"></select>
                    </div>
                    <div class="col-xs-4">
                      <label>&emsp;</label><br>
                      <button type="button" class="btn btn-primary" id="addcliente" data-toggle="modal" data-target="#modalCliente"><i class="fa fa-plus"> Agregar</i></button> 
                    </div>
                  </div>
                </div>
              </div><!-- /.row -->
            </div><!-- /.panel-body -->
          </div><!-- /.panel -->

          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del Equipo / Sector</h3>
            </div>

            <div class="panel-body">
              <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label>Código</label> <strong style="color: #dd4b39">*</strong>:
                  <input type="text" id="codigo" name="codigo" class="form-control" placeholder="Ingrese Código de Equipo">
                  <input type="hidden" id="id_equipo" name="id_equipo">
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label>Marca</label> <strong style="color: #dd4b39">*</strong>:
                  <!--   <input type="text" id="marca" name="marca" class="form-control" placeholder="Ingrese Marca"> -->
                  <select id="marca" name="marca" class="form-control" value="" ></select>   
                </div>
                <div class="col-xs-4">
                  <label>&emsp;</label><br>
                  <button type="button" class="btn btn-primary" id="addcriti"  data-toggle="modal" data-target="#modalMarca"><i class="fa fa-plus"> Agregar</i></button> 
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label>Descripción</label> <strong style="color: #dd4b39">*</strong>:
                  <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Ingrese breve Descripción (Tamaño Máx 255 caracteres) ..." cols="20" rows="3"></textarea>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label>Número de serie: <strong style="color: #dd4b39">*</strong></label>
                  <input type="text" id="numse"  name="numse" class="form-control input-md" placeholder="Ingrese Número de serie">
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label>Ubicación (Georeferencial)</label><strong style="color: #dd4b39">*</strong>:
                  <input type="text" id="ubicacion" name="ubicacion" class="form-control" placeholder="Ingrese Ubicación">
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label>Fecha de Ingreso:</label>
                  <input type="date" id="fecha_ingreso"  name="fecha_ingreso" class="form-control input-md">
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label>Fecha de Garantía:</label>
                  <input type="date" id="fecha_garantia"  name="fecha_garantia" class="form-control input-md">
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label>Fecha de Última lectura:</label>
                  <input type="date" id="fecha_ultimalectura"  name="fecha_ultima" class="form-control input-md">
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label>Última Lectura:</label>
                  <input type="text" id="ultima_lectura"  name="ultima_lectura" class="form-control input-md" placeholder="Ingrese Ultima Lectura">
                </div>
                <div class="col-xs-12">
                  <label>Descripción Técnica:</label>
                  <textarea class="form-control" id="destec" name="destec" placeholder="Ingrese Descripción Técnica..."></textarea>
                </div>
              </div>
              <br>
              <?php /*<div class="row">
                <div id="exTab1" class="col-xs-12"> 
                  <ul  class="nav nav-tabs">
                    <li>
                      <a  href="#1a" id="ag" data-toggle="tab" class="glyphicon glyphicon-plus" >Información complementaria</a>
                    </li>
                  </ul>
                  <div class="tab-content clearfix">
                    <div class="tab-pane" id="1a">
                      <br>
                      <div class="row">
                        <div class="col-xs-12">
                          <div class="col-xs-12 col-sm-6">
                            <input type="text" id="tit" name="tit" class="form-control" placeholder="Ingrese Título ...">
                          </div>
                          <div class="col-xs-12 col-sm-6">
                            <input type="text" id="info" name="info" class="form-control" placeholder="Ingrese Descripción ...">
                          </div><br><br>
                          <div class="col-xs-12">
                            <button type="button" class="btn btn-primary" id="agregar" ><i class="fa fa-plus"> Agregar</i></button> 
                          </div>
                        </div>
                      </div><!-- /.row -->
                      <br>
                      <div class="row">
                        <div class="col-xs-12">
                          <table id="sales" class="table table-bordered table-hover">
                            <thead>
                              <tr>                
                                <th>Acción</th>
                                <th>Título</th>
                                <th>Descripción</th>
                              </tr>
                            </thead>
                            <tbody>
                              <!-- -->
                            </tbody>
                          </table>
                        </div>
                      </div><!-- /.row -->
                    </div><!-- /.tab-pane -->
                  </div><!-- /.tab-content -->
                </div>
              </div>*/?>
            </div><!-- /.panel-body-->   
          </div><!-- /.panel -->
          
          <div class="modal-footer">
            <!--<button type="button" class="btn btn-default" onclick="limpiar()">Cancelar</button>-->
            <button type="button" class="btn btn-primary" onclick="guardar()">Guardar</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
//datatables
$('#sales').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "order": [[0, "asc"]],
});
$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
   $($.fn.dataTable.tables(true)).DataTable()
      .columns.adjust();
});


// Carga vista 
var eq = "";
$(document).ready(function() {

  $('#1a').click(function (e) {
    $(".tab_content").hide();
    $("#ag").addClass("active");        
  });

  $('#listado').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Equipo/index/<?php echo $permission; ?>");
    WaitingClose();
  });

  var i = 1;
  // Arma tabla de info nueva para agregar - Chequeado
  $('#agregar').click(function (e){
    var des = $('#info').val();
    var tit = $('#tit').val();   
    //var i   = 1;
    /*var tr  = "<tr id='"+i+"'>"+
        "<td  style='text-align: center' ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer' title='Eliminar Información'></i></td>"+
        "<td title='Título'>"+tit+"</td>"+
        "<td  title='Descripción'>"+des+"</td>"+                               
      "</tr>";  
    i++;        
    $('#sales tbody').append(tr);*/

    //agrego valores a la tabla
    var table   = $('#sales').DataTable();
    var rowNode = table.row.add( [
      "<i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer' title='Eliminar Información'></i>",
      tit,
      des,
    ] ).node();
    rowNode.id = i; i++;
    table.draw();

    $(document).on("click",".elirow",function(){
      //var parent = $(this).closest('tr');
      //$(parent).remove();
      table.row($(this).parents('tr')).remove().draw(false);
    });
    $('#tit').val('');
    $('#info').val('');
  });
  
});
  
// Guarda equipo/sector nuevo - Chequeado
function guardar(){
  var hayError = false;
  hayError     = validarCampos();
  if(hayError == true){
    $('#error').fadeIn('slow');
    return;
  }
  else{
    $('#error').fadeOut('slow');
    var idEquipo            = $('#id_equipo').val();
    var codigo              = $('#codigo').val();
    var ubicacion           = $('#ubicacion').val();
    var marca               = $('#marca option:selected').text();
    var descripcion         = $('#descripcion').val();
    var fecha_ingreso       = $('#fecha_ingreso').val();
    var fecha_ultimalectura = $('#fecha_ultimalectura').val();
    var ultima_lectura      = $('#ultima_lectura').val();
    var fecha_garantia      = $('#fecha_garantia').val();
    //var id_empresa        = $('#id_empresa').val();
    var sector              = $('#etapa option:selected').val();
    var criticidad          = $('#criticidad option:selected').val();
    var grupo               = $('#grupo').val();
    var unidad              = $('#unin').val();
    var id_area             = $('#area option:selected').val();
    var id_proceso          = $('#proceso option:selected').val();
    var id_cliente          = $('#cliente option:selected').val();
    var numero_serie        = $('#numse').val();

    var parametros = {
      'descripcion': descripcion,
      'fecha_ingreso': fecha_ingreso,
      'fecha_garantia': fecha_garantia,
      'marca': marca,
      'codigo': codigo,
      'ubicacion': ubicacion,
      //'id_empresa' : id_empresa,
      'id_sector' : sector,
      'id_grupo' : grupo,
      'id_area' : id_area,
      'id_proceso' : id_proceso,
      'id_criticidad' : criticidad,
      'id_customer' : id_cliente,
      'id_unidad': unidad,
      'numero_serie' : numero_serie,
      'estado' : 'AL',
      'fecha_ultimalectura': fecha_ultimalectura,
      'ultima_lectura': ultima_lectura,             
    };
    console.table(parametros);
    var i    = 0;
    var j    = 0;
    var item = new Array();  
    var comp = new Array();
    $("#sales tbody tr").each(function (index){
      $(this).children("td").each(function (index2){
        if (index2) {
          item.push(i); //arreglo de indices 
          i++; 
        } 
      });     
    }); 
    $("#sales tbody tr").each(function (index){
      var campo2, campo3;
      $(this).children("td").each(function (index2){
        if (index2) {
          if( j <= item.length-1 ){
            campo2 = $(this).text();
            comp[j]=campo2; 
            campo3 = $(this).text();
            comp[j]=campo3;  
            j++;
          }     
        }   
      });
    });

    $.ajax({
      data: { data:parametros, codigo:codigo, marca:marca, comp:comp, j:j },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Equipo/guardar_equipo',  //index.php/
      success: function(data){                  
        alert("Guardado con exito...");
        regresa();
      },
      error: function(result){
        alert("Error en guardado...");
        console.log ("entre por error");
        console.log(result);               
      },
    });   
  }             
}

// Chequea los campos llenos - Chequeado
function validarCampos(){
  var hayError = "";
  if ( $('#unin').val() == -1 ) {
      hayError = true;
  }
  if ( $('#area').val() == -1 ) {
      hayError = true;
  }
  if ( $('#proceso').val() == -1 ) {
      hayError = true;
  }
  if ( $('#etapa').val() == -1 ) {
      hayError = true;
  }
  if ( $('#grupo').val() == -1 ) {
      hayError = true;
  }
  if ( $('#criticidad').val() == -1 ) {
      hayError = true;
  }
  if ( $('#marca').val() == -1 ) {
      hayError = true;
  }
  if ( $('#codigo').val() == "" ) {
      hayError = true;
  }
  if ( $('#numse').val() == "" ) {
      hayError = true;
  }
  if ( $('#descripcion').val() == "" ) {
      hayError = true;
  }
  if ( $('#numse').val() == "" ) {
      hayError = true;
  }
  if ( $('#ubicacion').val() == "" ) {
      hayError = true;
  }

  return hayError;
}

// Recarga vista list
function regresa(){
  $('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Equipo/index/<?php echo $permission; ?>");
  WaitingClose();    
}
  








//Trae empresa logueada - Listo
/*traer_empresa();
function traer_empresa(){
  $.ajax({
    data: { },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Equipo/getempresa',
    success: function(data){
      var desc = data[0]['descripcion'];
      var id   = data[0]['id_empresa'];
      $('#empresa').val(desc);
      $('#id_empresa').val(id);
    },
    error: function(data){
      console.log(data);
    },
  });
}*/

// Trae unidad industrial segun empresa - Listo
/*traer_unidad();
function traer_unidad(){
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Equipo/getunidad', //index.php/
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#unin').append(opcion); 
      for(var i=0; i < data.length ; i++){    
        var nombre = data[i]['descripcion'];
        var opcion  = "<option value='"+data[i]['id_unidad']+"'>" +nombre+ "</option>" ; 
        $('#unin').append(opcion);                                    
      }
    },
    error: function(result){              
      console.log(result);
    },
    dataType: 'json'
  });
}*/
  

// Trae area y llena el select - Listo
traer_area();
function traer_area(){
  $.ajax({
    data: { },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Equipo/getarea', 
    success: function(data){
      console.log("estoy en area");
      console.log(data);
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#area').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['descripcion'];
        var opcion  = "<option value='"+data[i]['id_area']+"'>" +nombre+ "</option>" ; 
        $('#area').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
  });
}

// Trae proceso y llena el select - Listo
traer_proceso();
function traer_proceso(){
 $.ajax({
   type: 'POST',
   data: { },
   url: 'index.php/Equipo/getproceso',
   success: function(data){
     var opcion = "<option value='-1'>Seleccione...</option>" ; 
     $('#proceso').append(opcion); 
     for(var i=0; i < data.length ; i++) 
     {    
       var nombre = data[i]['descripcion'];
       var opcion = "<option value='"+data[i]['id_proceso']+"'>" +nombre+ "</option>" ; 
       $('#proceso').append(opcion); 
     }
   },
   error: function(result){
     console.log(result);
   },
   dataType: 'json'
 });
}

// Trae criticidad y llena el select - Listo
traer_criticidad();
function traer_criticidad(){
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Equipo/getcriti', 
    success: function(data){
      var opcion = "<option value='-1'>Seleccione...</option>" ; 
      $('#criticidad').append(opcion); 
      for(var i=0; i < data.length ; i++){    
        var nombre = data[i]['descripcion'];
        var opcion = "<option value='"+data[i]['id_criti']+"'>" +nombre+ "</option>" ; 
        $('#criticidad').append(opcion);                                    
      }
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
} 

// Trae etapa/sector y llena el select - Listo
traer_etapa();
function traer_etapa(){
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Equipo/getetapa',
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#etapa').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['descripcion'];
        var opcion  = "<option value='"+data[i]['id_sector']+"'>" +nombre+ "</option>" ; 
        $('#etapa').append(opcion);                                    
      }                
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
} 

// Trae grupo y llena el select - Listo
traer_grupo();
function traer_grupo(){
  $.ajax({
    data: { },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Equipo/getgrupo', 
    success: function(data){
      console.log("estoy en area");
      console.log(data);
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#grupo').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['descripcion'];
        var opcion  = "<option value='"+data[i]['id_grupo']+"'>" +nombre+ "</option>" ; 
        $('#grupo').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
  });
}

// Trae grupo y llena el select - listo
traer_cliente();
function traer_cliente(){
  $.ajax({
    data: { },
    dataType: 'json',
    type: 'POST',
    url: 'index.php/Equipo/getcliente', 
    success: function(data){
      console.log("estoy en cliente");
      console.log(data);
      var opcion = "<option value='-1'>Seleccione...</option>" ; 
      $('#cliente').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['cliRazonSocial'];
        var opcion = "<option value='"+data[i]['cliId']+"'>" +nombre+ "</option>" ; 
        $('#cliente').append(opcion); 
      }
      $('modalCliente').modal('hide');
    },
    error: function(result){
      console.log(result);
    },
  });
}
  
// Trae marca y llena el select - Listo
traer_marca();
function traer_marca(){
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Equipo/getmarca', 
      success: function(data){
             
               var opcion  = "<option value='-1'>Seleccione...</option>" ; 
                $('#marca').append(opcion); 
              for(var i=0; i < data.length ; i++) 
              {    
                  var nombre = data[i]['marcadescrip'];
                  var opcion  = "<option value='"+data[i]['marcaid']+"'>" +nombre+ "</option>" ; 
                  $('#marca').append(opcion); 
                                 
              }
              
            },
      error: function(result){
            
            console.log(result);
          },
          dataType: 'json'
      });
}  

// Limpia campos al cancelar
function limpiar(){
    $("#equipo").val("");
    $("#codigo").val("");
    $("#ubicacion").val("");
    $("#marca").val("");
    $("#fecha_ingreso").val("");
    $("#descripcion").val("");
    $("#fecha_ultimalectura").val("");
    $("#ultima_lectura").val("");
    $("#fecha_garantia").val("");
    $("#empresa").val("");
    $("#sector").val("");
    $("#criticidad").val("");
    $("#grupo").val("");
}

// Agrega unidad industrial y llena el select - Listo
function guardarunidad(){ 
     
  var descripcion= $('#nombreunidad').val(); 
  var datos = {
    'descripcion': descripcion        
    };                                              
    console.log(datos);
    var hayError = false; 

    if( datos !=0){  

      $.ajax({
        type:"POST",
        url: "index.php/Equipo/agregar_unidad", //controlador /metodo
        data:{datos:datos},
        success: function(data){
                  console.log("exito");
                  var dat= parseInt(data);
                 
                  if(dat > 0){  //Agrego la descripcion dinamicamte en el select con id componente            
                    
                      var texto = '<option value="'+dat+'">'+ datos.descripcion +'</option>';
                      console.log(texto);
                      $('#unin').append(texto);
                  } 
        },        
        error: function(result){
            console.log("entro por el error");
            console.log(result);
        },
         dataType: 'json'
      });     
    }
    else 
    { 
      alert("Por favor complete el nombre del sector, es un campo obligatorio");
    }
}

// Agrega las areas nuevas - Listo
function guardararea(){ 
     
    var descripcion= $('#nomarea').val(); 
    var parametros = {
        'descripcion': descripcion        
    };                                              
    console.log(parametros);
    var hayError = false; 

    if( parametros !=0){

      $.ajax({
        type:"POST",
        url: "index.php/Equipo/agregar_area",
        data:{parametros:parametros},
        success: function(data){
                console.log("exito");
                var datos= parseInt(data);
                console.log(datos);
                  //alert(data);
                  if(data > 0){  //Agrego la descripcion dinamicamte en el select con id componente             
                    
                      var texto = '<option value="'+data+'">'+ parametros.descripcion +'</option>';
                      console.log(texto);
                      $('#area').append(texto);
                  } 
        },        
        error: function(result){
            console.log("entro por el error");
            console.log(result);
        },
         dataType: 'json'
      });
     
    }
    else 
    { 
      alert("Por favor complete la descripcion del grupo, es un campo obligatorio");

    }
}

// Agrega las procesos nuevos - Listo
function guardarproceso(){ 
     
    var descripcion= $('#nomproceso').val(); 
    var parametros = {
        'descripcion': descripcion        
    };                                              
    console.log(parametros);
    var hayError = false; 

    if( parametros !=0){                                     
      
      $.ajax({
        type:"POST",
        url: "index.php/Equipo/agregar_proceso", 
        data:{parametros:parametros},
        success: function(data){
                console.log("exito");
                var datos= parseInt(data);
                console.log(datos);
                  //alert(data);
                  if(data > 0){ //Agrego la descripcion dinamicamte en el select con id componente              
                    
                      var texto = '<option value="'+data+'">'+ parametros.descripcion +'</option>';
                      console.log(texto);
                      $('#proceso').append(texto);
                  }            
        },
        
        error: function(result){
            console.log("entro por el error");
            console.log(result);
        },
         dataType: 'json'
      });
     
    }
    else 
    { 
      alert("Por favor complete la descripcion del grupo, es un campo obligatorio");

    }
}

// Agrega criticidad nueva - Listo
function guardarcri(){ 
     
    var descripcion= $('#de').val(); 
    var parametros = {
        'descripcion': descripcion        
    };                                              
    console.log(parametros);
    var hayError = false; 

    if( parametros !=0){                                     
      $.ajax({
        type:"POST",
        url: "index.php/Equipo/agregar_criti", 
        data:{parametros:parametros},
        success: function(data){
                console.log("exito");
                var datos= parseInt(data);
                console.log(datos);
                  //Agrego la descripcion dinamicamte en el select con id componente
                  if(data > 0){               
                    
                      var texto = '<option value="'+data+'">'+ parametros.descripcion +'</option>';
                      console.log(texto);
                      $('#criticidad').append(texto);
                  } 
                }, 

        error: function(result){
                  console.log("entro por el error");
                  console.log(result);
              },
         dataType: 'json'
      });
     
    }
    else 
    { 
      alert("Por favor complete criticidad, es un campo obligatorio");

    }
}

// Agrega las grupos nuevos - Listo
function guardargrupo(){ 
     
    var descripcion= $('#nomgrupo').val(); 
    var parametros = {
        'descripcion': descripcion,
        'estado': 'AC',
    };                                              
    console.table(parametros);
    var hayError = false; 

    if( parametros !=0){      

      $.ajax({
        type:"POST",
        url: "index.php/Equipo/agregar_grupo", 
        data:{parametros:parametros},
        success: function(data){
          console.log("exito");
          var datos= parseInt(data);
          console.log(datos);
            //alert(data);
            if(data > 0){  
              
                var texto = '<option value="'+data+'">'+ parametros.descripcion +'</option>';
                console.log(texto);

                $('#grupo').append(texto);
            }   
          },
        
        error: function(result){
            console.log("entro por el error");
            console.log(result);
        },
         dataType: 'json'
      });     
    }
    else 
    { 
      alert("Por favor complete la descripcion del grupo, es un campo obligatorio");

    }
}

// Agrega sector/etapa nuevos - Listo
function guardaretapa(){ 
     
    var descripcion= $('#nometapa').val(); 
    var parametros = {
        'descripcion': descripcion,
        'estado': 'AC',        
    };                                              
    console.table(parametros);
    var hayError = false; 

    if( parametros !=0){                                     
      
      $.ajax({
        type:"POST",
        url: "index.php/Equipo/agregar_etapa", 
        data:{parametros:parametros},
        success: function(data){
              console.log("exito");
              var datos= parseInt(data);
              console.log(datos);
                //alert(data);
                if(data > 0){  

                    var texto = '<option value="'+data+'">'+ parametros.descripcion +'</option>';
                    console.log(texto);

                    $('#etapa').append(texto);
                }            
          },        
        error: function(result){
            console.log("entro por el error");
            console.log(result);
        },
         dataType: 'json'
      });     
    }
    else 
    { 
      alert("Por favor complete la descripcion del grupo, es un campo obligatorio");
    }
}

// Agrega sector/etapa nuevos
function guardarCliente(){  
  var cliName        = $('#cliName').val();
  var cliLastName    = $('#cliLastName').val();
  var cliDni         = $('#cliDni').val();
  var cliAddress     = $('#cliAddress').val();
  var cliPhone       = $('#cliPhone').val();
  var cliEmail       = $('#cliEmail').val();
  var cliRazonSocial = $('#cliRazonSocial').val();

  var parametros = {
        'cliName'     : cliName,
        'cliLastName' : cliLastName,
        'cliDni'      : cliDni,
        'cliAddress'  : cliAddress,
        'cliPhone'    : cliPhone,
        'cliEmail'    : cliEmail,
        'cliRazonSocial' : cliRazonSocial,
        'estado'      : 'AC',    
    };                                              
    console.table(parametros);
    var hayError = false; 

    if( parametros !=0){                                         

    $.ajax({
      data:{parametros:parametros},
      dataType: 'json',
      type:"POST",
      url: "index.php/Equipo/agregar_cliente", 
      success: function(data){
        console.log("exito");
        console.log(data);
        if(data > 0){  
          var texto = '<option value="'+data+'">'+ parametros.cliRazonSocial +'</option>';
          console.log(texto);
          $('#cliente').append(texto);
          $('#modalCliente').modal('hide');
        }           
      },        
      error: function(result){
        console.log("entro por el error");
        console.log(result);
      },
    });     
  }
  else 
  { 
    alert("Por favor complete la descripcion del grupo, es un campo obligatorio");
  }
}

// Agrega las grupos nuevos - Listo
function guardarmarca(){ 
  var descripcion = $('#nombreMarca').val(); 
  var parametros = {
    'marcadescrip': descripcion,
    'estado': 'AC',        
  };                                              
  console.table(parametros);
  var hayError = false; 
  if( parametros !=0){    
    $.ajax({
      data:{parametros:parametros},
      dataType: 'json',
      type: 'POST',
      url: "index.php/Equipo/agregar_marca", 
      success: function(data){
        console.log("exito");
        var datos= parseInt(data);
        console.log(datos);
        if(data > 0){  
          var texto = '<option value="'+data+'">'+ parametros.marcadescrip +'</option>';
          console.log(texto);
          $('#marca').append(texto);
        }      
      },
      error: function(result){
        console.log("entro por el error");
        console.log(result);
      }
    });
  }
  else 
  { 
    alert("Por favor complete la descripcion de Marca, es un campo obligatorio");
  }
}
</script>

<!-- Modal empresa -->
<div class="modal" id="modalOrder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span>  Agregar Empresa </h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <label>Nombre de la empresa <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text"  id="nombre"  name="nombre" placeholder="Ingrese Nombre o Descripción" class="form-control input-md" size="30"/>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal" onclick="guardaremp()" >Guardar</button>
      </div>  <!-- /.modal footer -->
    </div>  <!-- /.modal-body -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Unidad indus.-->
<div class="modal" id="modalunidad" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-plus-square" style="color: #A4A4A4"  ></span>     Agregar Unidad Industrial </h4>
       </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        
        <div class="row" >
                               
            <div class="col-xs-12"><h4>Nombre de la unidad industrial <strong style="color: #dd4b39">*</strong>: </h4>
              <input type="text"  id="nombreunidad"  name="nombreunidad" placeholder="Ingrese Nombre o Descripción" class="form-control input-md" size="30"/>
            </div>
                    
                    
          </div>
        </div>
      </div>
       
     

      <div class="modal-footer">
       
        <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal" onclick="guardarunidad()" >Guardar</button>
      </div>  <!-- /.modal footer -->

       </div>  <!-- /.modal-body -->
    </div> <!-- /.modal-content -->

  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal criticidad-->
<div class="modal" id="modalcrit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Sector </h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <label>Criticidad <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text"  id="de"  name="de" placeholder="Ingrese criticidad" class="form-control"/>
          </div>
        </div>
      </div>  <!-- /.modal-body -->
       
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardarcri()" >Guardar</button>
      </div>  <!-- /.modal footer -->

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal area-->
<div class="modal" id="modalarea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Área </h4>
       </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <label>Nombre de Área: <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text"  id="nomarea"  name="nomarea" placeholder="Ingrese Nombre o Descripción" class="form-control input-md" size="30"/>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardararea()" >Guardar</button>
      </div>  <!-- /.modal footer -->
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Proceso-->
<div class="modal" id="modalproceso" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Proceso </h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <label>Nombre de Proceso: <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text"  id="nomproceso"  name="nomproceso" placeholder="Ingrese Nombre o Descripción" class="form-control input-md" size="30"/>
          </div>
        </div>
      </div>
  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardarproceso()" >Guardar</button>
      </div>  <!-- /.modal footer -->
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Etapa-->
<div class="modal" id="modaletapa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Sector/Etapa de Proceso </h4>
       </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <label>Nombre de Sector/Etapa de Proceso: <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text"  id="nometapa"  name="nometapa" placeholder="Ingrese Nombre o Descripcion" class="form-control input-md" size="30"/>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardaretapa()" >Guardar</button>
      </div>  <!-- /.modal footer -->
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Grupo-->
<div class="modal" id="modalgrupo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Grupo </h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <label>Nombre de Grupo: <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text"  id="nomgrupo"  name="nomgrupo" placeholder="Ingrese Nombre o Descripción" class="form-control input-md" size="30"/>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardargrupo()" >Guardar</button>
      </div>  <!-- /.modal footer -->
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Marca-->
<div class="modal" id="modalMarca" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Marca </h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row" >
          <div class="col-xs-12">
            <label>Nombre de Marca: <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text"  id="nombreMarca"  name="nombreMarca" placeholder="Ingrese Nombre o Descripción" class="form-control input-md" size="30"/>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="guardarmarca()" >Guardar</button>
      </div>  <!-- /.modal footer -->
    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<!-- Modal Clientes --> 
<div class="modal" id="modalCliente">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Agregar Cliente</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos
            </div>
          </div>
        </div>

        <div class="row"> 
          <div class="col-xs-12">
            <label style="margin-top: 7px;">Nombre <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text" class="form-control" id="cliName" >
          </div>
        </div><br>
        <div class="row"> 
          <div class="col-xs-12">
            <label style="margin-top: 7px;">Apellido <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text" class="form-control" id="cliLastName" >
          </div>
        </div><br>
        <div class="row"> 
          <div class="col-xs-12">
            <label style="margin-top: 7px;">Dni <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text" class="form-control"  id="cliDni" >
          </div>
        </div><br>
        <div class="row"> 
          <div class="col-xs-12">
            <label style="margin-top: 7px;">Direccion <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text" class="form-control"  id="cliAddress" >
          </div>
        </div><br>
        <div class="row"> 
          <div class="col-xs-12">
            <label style="margin-top: 7px;">Telefono <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text" class="form-control"  id="cliPhone" >
          </div>
        </div><br>
        <div class="row"> 
          <div class="col-xs-12">
            <label style="margin-top: 7px;">Email <strong style="color: #dd4b39">*</strong>: </label>
          </div>
          <div class="col-xs-5">
            <input type="text" class="form-control"  id="cliEmail" >
          </div>
        </div><br>
        <div class="row"> 
          <div class="col-xs-12">
            <label style="margin-top: 7px;">Razon Social <strong style="color: #dd4b39">*</strong>: </label>
            <input type="text" class="form-control"  id="cliRazonSocial" >
          </div>
        </div><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="guardarCliente()" >Guardar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --><!-- Modal -->