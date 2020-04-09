<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content"> 
  <div class="row">
    <div class="col-xs-12">
      <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
        <h4><i class="icon fa fa-ban"></i> Error!</h4>
        Revise que todos los campos esten completos
      </div>
    </div>
  </div><!--Fin msj error  -->

  <div class="row"><!--Inicio decontenedor con filtos  -->
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Reporte de Consumo</h3>
        </div><!-- /.box-header -->

        <div class="box-body"> 
          <div class="row">
            <div class="col-xs-12 col-sm-6">
              <div class="checkbox">
                <label>
                  <input type="checkbox" class="check" id="selCliente"><strong>Cliente</strong>
                </label>
              </div>
              <input type="text" class="form-control buscCliente" placeholder="Buscar Cliente..." id="buscCliente">
              <input type="text" class="hidden idCliente" id="idCliente">
            </div><!--Fin cliente  -->

            <div class="col-xs-12 col-sm-6">
              <div class="checkbox">
                <label>
                  <input type="checkbox" class="check" id="selEquipo"><strong>Equipo</strong>
                </label>
              </div>
              <select class="form-control" id="equipSelec">
                <option value="">Selecciona Equipo...</option>
                <option id="opt" value=""  ></option>						  			  
              </select>						    	
            </div><!--Fin Equipo  -->

            <div class="col-xs-12 col-sm-6" style="display: none;">
              <div class="checkbox">
                <label>
                  <input type="checkbox" class="check" id="selTipo"><strong>Tipo de almacen</strong>
                </label>
              </div>
              <select class="form-control" id="TipoSelec" placeholder="Seleccione tipo..." >
                <option value="" disabled>Por defecto 'Insumos'</option>
                <option value="1">Insumos</option>	
                <option value="2">Herramientas</option>			  			  
              </select>						    	
            </div><!--Fin Tipo de almacen  -->

            <div class="col-xs-12 col-sm-6">
              <div class="checkbox">
                <label>
                  <input type="checkbox" class="check" id="selArticulo" ><strong>Articulo</strong>
                </label>
              </div>
              <select class="form-control" id="ArticuloSelec" placeholder="Seleccione Articulo..." >
                <option value="">Selecciona Articulo...</option>
                <option value=""></option>						  			  
              </select>						    	
            </div><!--Fin Articulo  -->

            <div class="col-xs-12 col-sm-6">
              <div class="checkbox">
                <label>
                  <input type="checkbox" class="check" id="selSupervisor"><strong>Supervisor</strong>
                </label>
              </div>
              <select class="form-control" id="SupervisorSelec" placeholder="Seleccione supervisor...">
                <option value="">Selecciona Supervisor...</option>
                <option value=""></option>						  			  
              </select>						    	
            </div><!--Fin Supervisor -->

           
          </div>

          <div class="row">
            <div class="col-xs-12">
              <div class="checkbox">
                <label>
                  <input type="checkbox" class="check" id="selFecha"> <strong>Fecha</strong>
                </label>
              </div>
            </div><!--Fin select fecha  -->
            <div class="col-xs-12 col-sm-6">
              <label for="desde">Desde</label>
              <input type="text" class="form-control fecha check" id="desde" placeholder="Selecciona Fecha...">
            </div>  <!--Fin fecha desde  -->
            <div class="col-xs-12 col-sm-6">
              <label for="hasta">Hasta</label>
              <input type="text" class="form-control fecha check" id="hasta" placeholder="Selecciona Fecha...">
            </div> <!--Fin fecha hasta  -->
          </div><!--Fin parte de fechas  -->

          <br>
          
          <button  class="btn btn-primary pull-right" id="consulta" onclick="javascript:consReporte()">Consultar</button>

        </div><!-- /.box-body fin contenedor con filtros -->

        <div class="box-footer"> <!--Inicio contenedor de resultados style="display:none;" hace que este contenedor este oculto y colo apaerzca cuando se muestra la consulta  -->
          <div id="tablaReportes" data-tableName="Test Table 2" style="display: none;">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Consulta</h3>
                
              </div>
              
              <div><button style="margin:1rem;" class="btn btn-primary" onclick="javascript:exportTableToExcel('sales', 'reporte-consumo')"><i class="fa fa-download"></i> Excel</button></div>
              

              <div class="panel-body">   
               
                <table id="sales" class="table table-bordered table-hover">
                  <thead>
                    <tr>                
                     

                      <th>CÓDIGO ART</th>
                      <th>DESCRIPCIÓN</th>   
                      <th>NRO. PEDIDO</th>                 
                      <th>OT</th>
                      <th>DESCRIPCIÓN</th>
                      <th>CANTIDAD</th>
                     
                    </tr>
                  </thead>
                  <tbody>
                    <!-- -->
                  </tbody>
                </table>
               
              </div>

            </div>
          </div>
        </div><!-- /.box-footer Fin contenedor resultado de consultas -->
      </div><!-- /.box -->
    </div><!--Fin calse que cintiene los dos sectores filtros y resultado  -->
  </div><!--Fin contnedor de filtros y tabla resultado  -->
</section>


<!-- comienzo script -->
<script>// Habilitar y deshabilitar cliente y equipo, articulo, supervisor tipo de almacen, fecha-->


// Datatables -->
$('#sales').DataTable({
  "aLengthMenu": [ 10, 25, 50, 100 ],
  "order": [[0, "asc"]],
});
//variables para controlar que se carguen solo una vez los equipos y los articulos en los select
var opEquipo1 = 1;
var opArticulo = 1;
var opsup = 1;


$(function() {
  enabDisabCliente();
  $("#selCliente").click(enabDisabCliente);
  enabDisabEquipo();
  $("#selEquipo").click(enabDisabEquipo);
  enabDisabArticulo();
  $("#selArticulo").click(enabDisabArticulo);
  enabDisabSupervisor();
  $("#selSupervisor").click(enabDisabSupervisor);
  enabDisabTipo();
  $("#selTipo").click(enabDisabTipo);
  enabDisabFecha();
  $("#selFecha").click(enabDisabFecha);
});

function enabDisabCliente() {
  if (this.checked) {
    $("input.buscCliente").removeAttr("disabled");
   
  } else {
    $("input.buscCliente").attr("disabled", true);
    $("input.buscCliente").val('');
    
  }
}

function enabDisabEquipo() {
  if (this.checked) {    
    $("select#equipSelec").removeAttr("disabled");
  } else {  
    $("select#equipSelec").attr("disabled", true);
    $("select#equipSelec").val('');
   
    
   
    
  }
  
}

function enabDisabArticulo() {
  if (this.checked) {
    $("select#ArticuloSelec").removeAttr("disabled");
  } else {
    $("select#ArticuloSelec").attr("disabled", true);
    $("select#ArticuloSelec").val('');
  }
}

function enabDisabSupervisor() {
  if (this.checked) {
    $("select#SupervisorSelec").removeAttr("disabled");
  } else {
    $("select#SupervisorSelec").attr("disabled", true);
    $("select#SupervisorSelec").val('');
  }
}

function enabDisabTipo() {
  if (this.checked) {
    $("select#TipoSelec").removeAttr("disabled");
  } else {
    $("select#TipoSelec").attr("disabled", true);
    $("select#TipoSelec").val('');
  }
}

function enabDisabFecha() {
  if (this.checked) {
    $("input.fecha").removeAttr("disabled");
  } else {
    $("input.fecha").attr("disabled", true);
    $("input.fecha").val('');
  }
}



// <!-- Trae clientes y equipos p/ cliente seleccionado -->


$(function() {
  // trae clientes para el input text
  var dataF = function() {
    var tmp = null;
    $.ajax({
      'async': false,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "Reporte/getCliente",
      'success': function(data) {
        tmp = data;
      }
    });
    return tmp;
  }();
  $(".buscCliente").autocomplete({
    source: dataF,
    delay: 100,
    minLength: 1,
    focus: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox
      $(this).val(ui.item.label);
    },
    select: function(event, ui) {
      // prevent autocomplete from updating the textbox
      event.preventDefault();
      // manually update the textbox and hidden field
      $(this).val(ui.item.label);
      $("#idCliente").val(ui.item.value); // ui.item.value es cliId del cliente que se elige
      $id_cli= ui.item.value;
      //alert($id_cli);
      
      //getEquipos($id_cli);

    },
  });
  
 

});



//Trae euqipos en funcion del cliente que se elgio
// function getEquipos($id_cli){
//   $.ajax({
//      'data':{id_cli: $id_cli },
//     'async': true,
//     'dataType': 'json',
//     'global': false,
//     'type': "POST",
//     'url': "Reporte/getEquipo",
//     'success': function (data) {
//       console.table(data);
     
      
//       var $select = $("#equipSelec");
//       for (var i = 0; i < data.length; i++) {
//         $select.append( $('<option />',{ value:data[i]['id_equipo'], text:data[i]['descripcion'], title:data[i]['codigo'] }) );
//       }
//      },
//     'error' : function (data){
//       console.log('Error al traer equipos');
//       //alert('error');
//     }
//   });

// }

$("#selEquipo").click(function(e){
  $cliente = $('#idCliente').val(); //recupero el valor (id) del cliente seleccionado 
  if($cliente == ''){ 
    $cli = 'sin cliente';  //em el caso de que no se sellecciono ningun cliente colo sin cliente, entonces la consulata me arrojara todos los equipos
  }else{
    $cli = $cliente; //caso contrario me devolvera solos los equipos de un determinado clinte con su id determinado
  }
   
  //alert($cliente);
 $.ajax({
     'data':{id_cli : $cli },
    'async': true,
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "Reporte/getEquipo",
    'success': function (data) {
      console.table(data);      
       $select = $("#equipSelec"); 
      //console.table($select);

      //if que controla que se ingrese solo una vex a cargar los elementos al select     
      if(opEquipo1 == 1){
       
        for (var i = 0; i < data.length; i++) {
        $select.append( $('<option />',{ value:data[i]['id_equipo'], text:data[i]['codigo']+' - '+data[i]['descripcion'], title:data[i]['codigo'] }) );
      }
      
      opEquipo1 = 0;//sete la variable para que no vuelva a ingresar a caragar los equipis nevamente y asi evitar que salgan repetidos
      }
     
   
      
    
     
      
     },
    'error' : function (data){
      console.log('Error al traer equipos');
      //alert('error');
    }
    
});
});


</script>
<script>
 $("#selFecha").click(function(e){
              $(".fecha").datepicker();
         $.datepicker.setDefaults($.datepicker.regional["es"]);
         $("#desde").datepicker({
             dateFormat: 'dd/mm/yy',
             firstDay: 1
         }).datepicker("setDate", new Date());
         $("#hasta").datepicker({
             dateFormat: 'dd/mm/yy',
             firstDay: 1
         }).datepicker("setDate", new Date());
         $.datepicker.setDefaults($.datepicker.regional["es"]);
   
    });
</script>

<!-- Trear articulos en funcion de tipo de almacen -->
<script>
$("#selArticulo").click(function (e) { 
  //e.preventDefault();
  $tipo = document.getElementById("TipoSelec").value; // para obetener el valor de tipo de almacen que se selecciono
  // alert($tipo);
   //por defecto si no se selecciono nada muestra en articulos los de la tabla herramientad, si no 1=herramientas y 2 = articulos
  $.ajax({
    'async': true,
    'data': {tipo:$tipo },
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "reporte/getArticulo",
    'success': function (data) {
      console.table(data);
      var $select = $("#ArticuloSelec");
      if(opArticulo == 1){
        if($tipo=='1'){
        for (var i = 0; i < data.length; i++) {
        
         $select.append( $('<option />',{ value:data[i]['artId'], text:data[i]['artDescription'], title:data[i]['artBarCode'] }) );
             }
      }else{ // no iria en caso de que se agregue herramientas se coloca 2 opcion
        if($tipo == '2'){
          for (var i = 0; i < data.length; i++) {
          $select.append( $('<option />',{ value:data[i]['herrId'], text:data[i]['herrdescrip'], title:data[i]['herrcodigo'] }) );
            }
        }else{
          for (var i = 0; i < data.length; i++) {
            $select.append( $('<option />',{ value:data[i]['artId'], text:data[i]['artDescription'], title:data[i]['artBarCode'] }) );
             }
        }
      }
       opArticulo = 0;
      }
     
    },
    'error' : function (data){
      console.log('Error al traer equipos');
      //alert('error');
    }
  });
});

$("#selSupervisor").click(function (e) { 
  $.ajax({
    'async': true,
    'dataType': 'json',
    'global': false,
    'type': "POST",
    'url': "Reporte/getSupervisor",
    'success': function (data) {
      console.table(data);
     
      
      var $select = $("#SupervisorSelec");
      if(opsup == 1){
      for (var i = 0; i < data.length; i++) {
        $select.append( $('<option />',{ value:data[i]['usrId'], text:data[i]['usrName'], title:data[i]['usrNick'] }) );
      }
      opsup =0;
    }
     },
    'error' : function (data){
      console.log('Error al traer equipos');
      //alert('error');
    }
  });


});

</script>


<script>
//EXPORTAR TABLA A EXCEL
function exportTableToExcel(tableID, filename = ''){
  
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}




</script>

<script>

// limpio datos a consultar
function limpCombo(){
  $('.check').attr('checked',false);

  $("input.buscCliente").attr("disabled", true);
  $("input.buscCliente").val('');
  $("#idCliente").val('');

  $("select#selEquipo").attr("disabled", true);
  $("select#equipSelec").val('');

  $("select#selTipo").attr("disabled", true);
  $("select#TipoSelec").val('');

  $("select#selArticulo").attr("disabled", true);
  $("select#ArticuloSelec").val('');
  
  $("select#selSupervisor").attr("disabled", true);
  $("select#SupervisorSelec").val('');

  $("input.fecha").attr("disabled", true);
  $("input.fecha").val('');
}

  function consReporte(){

    var id_cliente  = $('#idCliente').val();
    var id_equipo   = $('#equipSelec').val();
    var tipo_alm    = $('#TipoSelec').val();
    var id_articulo = $('#ArticuloSelec').val();
    var id_supervisor = $('#SupervisorSelec').val();
    var desde     = $('#desde').val(); 
    var a         = $('#hasta').val();
     //VACIAR TBLA
    //  if($('#'))
    //     var resultados = document.getElementById('sales');
    //         resultados.innerHTML = '';
     
    // alert(a);
    //  alert(id_cliente);
     if(id_cliente == '' && id_equipo == '' && id_articulo == '' && id_supervisor == '' && tipo_alm == null)
     {
      
         if(desde == '' & a == ''){
             alert("Los campos estan vacios");
             ejemplo.reload();
              }
            

     }
     //vaciar tabla 
    //  var yea=document.getElementById("sales").rows.length;
    //  alert(yea);
    //     for(var i=0; i <= yea.length-1; i++){
                      
                   // }
       // myTable.row( this ).delete();

    // alert(tipo_alm);
    // alert(id_supervisor);

    //console.log(id_cliente);
    WaitingOpen('Cargando Solicitud de Servicios...'); //aparace el logo de cargando va a estar presente el tiempo que tarde en volver la respuesta en el ajax
    //Comienzo de AJAX
    $.ajax({
      data:{
            id_cliente: id_cliente,
            id_equipo: id_equipo,
            tipo_alm: tipo_alm,
            id_articulo: id_articulo,
            id_supervisor: id_supervisor,
            desde: desde,
            a: a
           },
      type: 'POST',             
      dataType: 'json',
      url: 'index.php/Reporte/consultaConFiltros', 
      success: function(result){
        console.table(result[0]);
        limpCombo();
        //hace vicible la tabla 
        $("#tablaReportes").css("display", "block");
        //Limpia la tabla, no es recomendable usar cuando esta activado serverside
        $('#sales').DataTable().clear().draw();
        if(result !==0){

           if((tipo_alm==1) || (tipo_alm==null)) {
                    //pinta en la tabla  resultado que devolvio el ajax
                    for(var i=0; i <= result.length-1; i++){
                      $('#sales').DataTable().row.add( [
                        
                        result[i]['artBarCode'],
                        result[i]['artDescription'],
                        result[i]['pema_id'],
                        result[i]['id_orden'],
                        result[i]['descripcion'],
                        result[i]['cantidad'],
                        
                        
                       
                        
                      ] ).draw();
                    }
           }else{

                    for(var i=0; i <= result.length-1; i++){
                      $('#sales').DataTable().row.add( [
                        result[i]['herrId'],
                        result[i]['herrcodigo'],
                        result[i]['pema_id'],
                        result[i]['id_orden'],
                        result[i]['descripcion'],
                        result[i]['cantidad'],
                        
                        
                        
                      ] ).draw();
                    }
                 }
          
           
          }
          else{
            alert("NO SE HALLARON RESULTADOS, POR FAVOR SELCCIONE OTRO");
          }
          WaitingClose();
         
        // dato={
        //         'orden':result[0]['id_orden'],
        //       };
        // $('#res').val(dato['orden']);
        // WaitingClose();
      
      },
      error: function(result){
        limpCombo();
        WaitingClose();                                              
        console.error("Error al traer solicitud de servicio");
      }
    });
  }
  //                     <th>codigo art</th>
  //                     <th>descripción</th>
  //                     <th>nro pedido</th>
  //                     <th>OT</th>
  //                     <th>descripción</th>
  //                     <th>cantidad</th>
</script>