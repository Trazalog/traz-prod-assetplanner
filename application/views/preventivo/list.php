<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">

  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Tareas Preventivas por frecuencia</h3>
          <?php
          if (strpos($permission,'Add') !== false) {
            ?>
            <button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" id="btnAgre">Agregar</button>             
            <?php 
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="tabprev" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Tarea</th>
                <th>Equipo</th>
                <th>Grupo</th>
                <th>Componente</th>
                <th>Periodo</th>
                <th>Frecuencia</th>
                <th>Fecha Base</th>
              </tr>
            </thead>
            <tbody>
              <?php
              if(count($list['data']) > 0)
              {
                foreach($list['data'] as $a)
                {
                    //if ($a['estadoprev'] !== "AN") {
                  $id  = $a['prevId'];
                  $ide = $a['id_equipo'];
                  echo '<tr id="'.$id.'" class="'.$ide.'">';
                  echo '<td>';
                  if (strpos($permission,'Add') !== false) {
                    echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar"></i>';
                    echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar"></i>';
                      //echo '<i class="fa fa-file-text text-light-blue" id="cargOrden" style="cursor: pointer; margin-left: 15px;" title="Orden de Trabajo" ></i>';
                  }
                  echo '</td>';
                  echo '<td>'.$a['deta'].'</td>';
                  echo '<td>'.$a['des'].'</td>';
                  echo '<td>'.$a['des1'].'</td>';
                  echo '<td>'.$a['descripcion'].'</td>';
                  echo '<td>'.$a['perido'].'</td>';
                  echo '<td>'.$a['cantidad'].'</td>';
                  echo '<td>'.date_format(date_create($a['ultimo']), 'd-m-Y').'</td>';
                    //echo '<td>'.$a['descripcion'].'</td>';
                  echo '</tr>';
                    //}
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
  var isOpenWindow = false;
  var codhermglo="";
  var codinsumolo="";
  var preglob="";

  $(document).ready(function(event) {

    edit=0;  datos=Array();
    $('#btnAgre').click( function cargarVista(){
      WaitingOpen();
      $('#content').empty();
      $("#content").load("<?php echo base_url(); ?>index.php/Preventivo/cargarpreventivo/<?php echo $permission; ?>");
      WaitingClose();
    });

  //Eliminar
  $(".fa-times-circle").click(function (e) {                 
    $('#modalaviso').modal('show');
    //var tr = $(this).parent('td').parent('tr');
    var idprev = $(this).parent('td').parent('tr').attr('id');
    $('#id').val(idprev);
  });   

  //Editar
  $(".fa-pencil").click(function (e) { 

    $('#error').fadeOut('fast');        
    $('#modalSale').modal('show');

    var idprev = $(this).parent('td').parent('tr').attr('id');
    $('#id_preventivo').val(idprev);  
    console.info('id de prev a editar: ' + idprev);  

    $.ajax({
      type: 'POST',
      data: { idprev: idprev},
      url: 'index.php/Preventivo/geteditar',
      success: function(data){                         

        datos={
          'idprev':data['datos'][0]['idprev'],
          'codigo' : data['datos'][0]['codigo'],
                'id_equipo':data['datos'][0]['id_equipo'], // id_equipo
                'fecha_ingreso':data['datos'][0]['fecha_ingreso'],
                'marca':data['datos'][0]['marca'],
                'codigo':data['datos'][0]['codigo'],  // nombre del equipo
                'ubicacion':data['datos'][0]['ubicacion'],
                'descripcion':data['datos'][0]['descripcion'],                
                'id_tarea':data['datos'][0]['id_tarea'], //iria  id_tarea descripta
                'perido':data['datos'][0]['perido'],
                'cantidad':data['datos'][0]['cantidad'],
                'ultimo':data['datos'][0]['ultimo'],
                'id_componente':data['datos'][0]['id_componente'],
                'critico1':data['datos'][0]['critico1'],
                'horash':data['datos'][0]['horash'],
                'ultimo':data['datos'][0]['ultimo'],
              };             

              var herram = data['herramientas'];             
              var insum = data['insumos'];

              console.log(herram);
              console.log(insum);
              completarEdit(datos, herram, insum);                        
            },        
            error: function(result){            
              console.log(result);
            },
            dataType: 'json'
          });      
  });  

  // Trae unidades de tiempo - Chequeado
  $(function(){  

    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Preventivo/getUnidTiempo', 
      success: function(data){

        var opcion  = "<option value='-1'>Seleccione...</option>" ; 
        $('#unidad').append(opcion); 
        for(var i=0; i < data.length ; i++){    
          var nombre = data[i]['unidaddescrip'];
          var opcion  = "<option value='"+data[i]['id_unidad']+"'>" +nombre+ "</option>" ; 
          $('#unidad').append(opcion);                                
        }
      },
      error: function(result){

        console.log(result);
      },
      dataType: 'json'
    });
  });   

  // Trae tareas
  $(function(){
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Preventivo/gettarea', //index.php/
      success: function(data){             
        var opcion  = "<option value='-1'>Seleccione...</option>" ; 
        $('#tarea').append(opcion); 
        for(var i=0; i < data.length ; i++){    
          var nombre = data[i]['descripcion'];
          var opcion  = "<option value='"+data[i]['id_tarea']+"'>" +nombre+ "</option>" ; 
          $('#tarea').append(opcion);                                  
        }
      },
      error: function(result){

        console.log(result);
      },
      dataType: 'json'
    });
  });

   //Trae herramientas
   $(function(){
    $.ajax({
      type: 'POST',
      data: { },
            url: 'index.php/Preventivo/getherramienta', //index.php/
            success: function(data){                   
             var opcion  = "<option value='-1'>Seleccione...</option>" ; 
             $('#herramienta').append(opcion); 
             for(var i=0; i < data.length ; i++){    
              var nombre = data[i]['herrcodigo'];
              var opcion  = "<option value='"+data[i]['herrId']+"'>" +nombre+ "</option>" ;
              $('#herramienta').append(opcion);                                    
            }
          },
          error: function(result){

            console.log(result);
          },
          dataType: 'json'
        });
  });

   $("#herramienta").change(function(){     
    var id_herramienta = $(this).val();
    console.log("El id de la herramienta que seleccione es:");
    console.log(id_herramienta); 
    codhermglo=id_herramienta;
    $.ajax({
      type: 'POST',
      data: { id_herramienta: id_herramienta},
        url: 'index.php/Preventivo/getdatos', //index.php/
        success: function(data){    

          console.log(data);
          var marca = data[0]['herrmarca']; 
          $('#marcaherram').val(marca); 
          var des = data[0]['herrdescrip'];
          $('#descripcionherram').val(des); 
          var codigo = data[0]['herrcodigo'];
        },

        error: function(result){

          console.log(result);
        },
        dataType: 'json'
      });
  });  

   var cod="";
   $("#agregarherr").click(function (e) {   


     var id_herramienta= $("#herramienta").val(codhermglo);    
     var id_her=codhermglo;
     
     //console.log("herramienta:"+id_her);
     var id_herramienta1= $("#herramienta").val();
     console.log("herramienta de prueba :"+id_herramienta1);

     var $herramienta = $("select#herramienta option:selected").html(); 
     var marcaherram = $('#marcaherram').val();
     var descripcionherram = $('#descripcionherram').val();
     var cantidadherram = $('#cantidadherram').val();

     var tr = "<tr id='"+id_her+"'>"+
     "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
     "<td>"+$herramienta+"</td>"+
     "<td>"+marcaherram+"</td>"+
     "<td>"+descripcionherram+"</td>"+
     "<td>"+cantidadherram+"</td>"+                    
     "</tr>";
     console.log(tr);        
     $('#tablaherramienta tbody').append(tr);   

     $(document).on("click",".elirow",function(){
      var parent = $(this).closest('tr');
      $(parent).remove();
    });

     $('#herramienta').val('');
     $('#marcaherram').val(''); 
     $('#descripcionherram').val(''); 
     $('#cantidadherram').val('');
   });   

  // trae insumos
  $(function(){
    $.ajax({
      type: 'POST',
      data: { },
      url: 'index.php/Preventivo/getinsumo', 
      success: function(data){

       var opcion  = "<option value='-1'>Seleccione...</option>" ; 
       $('#insumo').append(opcion); 
       for(var i=0; i < data.length ; i++) 
       {    
        var nombre = data[i]['artBarCode'];
        var opcion  = "<option value='"+data[i]['artId']+"'>" +nombre+ "</option>" ; 

        $('#insumo').append(opcion); 

      }
    },
    error: function(result){

      console.log(result);
    },
    dataType: 'json'
  });
  });

  $("#insumo").change(function(){

    var id_insumo = $(this).val();
    codinsumolo=id_insumo;
    console.log("El id de insumo que seleccione es:");
    console.log(id_insumo);
    console.log(codinsumolo);
    $.ajax({
      type: 'POST',
      data: { id_insumo: id_insumo},
          url: 'index.php/Preventivo/traerinsumo', //index.php/
          success: function(data){
            console.log(data);
            var d = data[0]['artDescription']; 
            $('#descript').val(d);  
            var insumo = data[0]['artBarCode']; 
                    //$('#insumo').val(insumo);
                  },

                  error: function(result){

                    console.log(result);
                  },
                  dataType: 'json'
                });
  });

  $("#agregarins").click(function (e) {

    var id_insumo= $('#insumo').val(codinsumolo);
    var id_in= codinsumolo;
    //var id_insumo1= $('#insumo').val();
    
    var $insumo = $("select#insumo option:selected").html();
    var descript = $('#descript').val();
    var cant = $('#cant').val();
      //var datos=Array();
      //datos=marca.split('%%');  //class='quitarEquipo'


      var tr = "<tr id='"+id_in+"'>"+
      "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
      "<td>"+$insumo+"</td>"+
      "<td>"+descript+"</td>"+
      "<td>"+cant+"</td>"+

      "</tr>";

      console.log(tr); 
      console.log("el id de insumo");
      console.log(id_in);


      $('#tablainsumo tbody').append(tr);



      $(document).on("click",".elirow",function(){
        var parent = $(this).closest('tr');
        $(parent).remove();
      });

      $('#insumo').val('');
      $('#descript').val(''); 
      $('#cant').val('');  
    });

  $('#tabprev').DataTable({
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

//Elimina Preventivo
function eliminaPrevent(){

  $('#modalaviso').modal('hide');
  var idP = $('#id').val();
  console.log(idP);    
  $.ajax({
    type: 'POST',
    data: { idprev: idP},
    url: 'index.php/Preventivo/baja_preventivo', 
    success: function(data){     
      console.log(data); 
      cargarVista();
    },                  
    error: function(result){                      
      console.log(result);
    },
    dataType: 'json'
  }); 
}

// commpleta los campos de modal de edicion
function completarEdit(datos, herram,insum){

  $('#hshombre').val(" ");
  $('#duracion').val(" ");
  $('#cantOper').val(" ");
  $('#unidad').val('-1');
  $('#tarea').val('-1');
  $('#herramienta').val('-1');
  $('#insumo').val('-1');    
  $('#equipo').val(datos['codigo']);
  $('#id_equipo').val(datos['id_equipo']);
  $('#fecha_ingreso').val(datos['fecha_ingreso']);
  $('#marca').val(datos['marca']);
    //$('#codigo').val(datos['codigo']);
    $('#ubicacion').val(datos['ubicacion']);
    $('#descripcion').val(datos['descripcion']);
    traer_componente(datos['id_equipo']);
    $('#tarea').val(datos['id_tarea']);     
    $('#periodo').val('0');    
    $('#cantidad').val(datos['cantidad']);
    $('#ultimo').val(datos['ultimo']);    
    $('#componente').val(datos['id_componente']);    
    $('#critico1').val(datos['critico1']);
    $('#hshombre').val(datos['horash']);    

    $('#tablaherramienta tbody tr').remove();
    for (var i = 0; i < herram.length; i++) {
      var tr = "<tr id='"+herram[i]['herrId']+"'>"+
      "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
      "<td>"+herram[i]['herrcodigo']+"</td>"+
      "<td>"+herram[i]['herrmarca']+"</td>"+
      "<td>"+herram[i]['herrdescrip']+"</td>"+
      "<td>"+herram[i]['cantidad']+"</td>"+                   
      "</tr>";
      $('#tablaherramienta tbody').append(tr);
    }

    $('#tablainsumo tbody tr').remove();
    
    for (var i = 0; i < insum.length; i++){                                             

      var tr = "<tr id='"+insum[i]['artId']+"'>"+
      "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
      "<td>"+insum[i]['artBarCode']+"</td>"+
      "<td>"+insum[i]['artDescription']+"</td>"+
      "<td>"+insum[i]['cantidad']+"</td>"+                   
      "</tr>";
      $('#tablainsumo tbody').append(tr);
    }

    $(document).on("click",".elirow",function(){
      var parent = $(this).closest('tr');
      $(parent).remove();
    });
  }

// Calcula horas hombre por tiempo y unidades -chequeado
function calcularHsHombre(){

  var entrada = $('#duracion').val(); 
  var unidad = $('#unidad').val();
  var operarios = $('#cantOper').val(); 
  var hs = 0;
  var hsHombre = 0;
  if ((entrada > 0)&&(unidad!= '-1')&&(operarios> 0)) {      
      //minutos
      if (unidad == 1) {
        hs = entrada / 60;
      }
      // horas
      if (unidad == 2) {
        hs = entrada;
      }
      // dias
      if (unidad == 3) {
        hs = entrada * 24;
      }
      hsHombre = hs * operarios;      
      $('#hshombre').val(hsHombre);      
    }  
  }

//traer_herramienta();
    //traer_insumo(); 

// function traer_herramienta(){
//       $.ajax({
//             type: 'POST',
//             data: { },
//             url: 'index.php/Preventivo/getherramienta', //index.php/
//             success: function(data){                   
//                      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
//                       $('#herramienta').append(opcion); 
//                     for(var i=0; i < data.length ; i++){    
//                         var nombre = data[i]['herrcodigo'];
//                         var opcion  = "<option value='"+data[i]['herrId']+"'>" +nombre+ "</option>" ;
//                         $('#herramienta').append(opcion);                                    
//                     }
//                   },
//             error: function(result){

//                   console.log(result);
//                 },
//             dataType: 'json'
//         });
// }

// function traer_insumo(){
//       $.ajax({
//         type: 'POST',
//         data: { },
//         url: 'index.php/Preventivo/getinsumo', 
//         success: function(data){

//                  var opcion  = "<option value='-1'>Seleccione...</option>" ; 
//                   $('#insumo').append(opcion); 
//                 for(var i=0; i < data.length ; i++) 
//                 {    
//                       var nombre = data[i]['artBarCode'];
//                       var opcion  = "<option value='"+data[i]['artId']+"'>" +nombre+ "</option>" ; 

//                     $('#insumo').append(opcion); 

//                 }
//               },
//         error: function(result){

//               console.log(result);
//             },
//             dataType: 'json'
//         });
// }

function traer_componente(id_equipo){
  $('#componente').html("");
  $.ajax({
    type: 'POST',
    data: {id_equipo: id_equipo },
      url: 'index.php/Preventivo/getcomponente', //index.php/
      async:false,
      success: function(data){

       $('#componente option').remove();
       var opcion  = "<option value='-1'>Seleccione...</option>" ; 
       $('#componente').append(opcion); 
       for(var i=0; i < data.length ; i++) 
       {    
        var nombre = data[i]['descripcion'];
        var opcion  = "<option value='"+data[i]['id_componente']+"'>" +nombre+ "</option>" ; 

        $('#componente').append(opcion); 

      }
             //$('#componente').html("");

             
           },
           error: function(result){

            console.log(result);
          },
          dataType: 'json'
        });
}

function guardarEdicion(){

    var id_prevent = $('#id_preventivo').val();//
    var id_equipo = $('#id_equipo').val();//
    var tarea = $('#tarea').val();//
    var componente = $('#componente').val();
    var ultimo = $('#ultimo').val();
    var periodo = $('#periodo').text();    
    var cantidad = $('#cantidad').val();
    var cantidadhm= $('#hshombre').val();    
    var duracion = $('#duracion').val();
    var unidad = $('#unidad').val();
    var cantOper = $('#cantOper').val();   
    
    // Arma array de herramientas y cantidades
    var idsherramienta = new Array();     
    $("#tablaherramienta tbody tr").each(function (index){
      var id_her = $(this).attr('id');
      idsherramienta.push(id_her); 
        //console.log('id de herram: ');
        //console.log(id_her); 
      });    
    var cantHerram = new Array(); 
    $("#tablaherramienta tbody tr").each(function (index){         
      var cant_herr = $(this).find("td").eq(4).html();
      cantHerram.push(cant_herr);                   
    });

    // Arma array de insumos y cantidades
    var idsinsumo = new Array();     
    $("#tablainsumo tbody tr").each(function (index){
      var id_ins = $(this).attr('id');
      idsinsumo.push(id_ins); 
        //console.log('id de insumos: ');
        //console.log(id_ins); 
      });    
        //console.log('id de insumos: ');
        //console.log(idsinsumo);
        var cantInsum = new Array(); 
        $("#tablainsumo tbody tr").each(function (index){         
          var cant_insum = $(this).find("td").eq(3).html();
          cantInsum.push(cant_insum);  

        //console.log('cantidad de insumos: ');
        //console.log(cant_insum);                  
      });    
        //console.log('cantidad de insumos arreglo: ');
        //console.log(cantInsum);                       
        $.ajax({
          type: 'POST',
          data: { id_equipo: id_equipo,
            id_tarea: tarea,
            perido: periodo,
            cantidad: cantidad,
            ultimo : ultimo,
            id_componente: componente, 
            horash: cantidadhm,  
            prev_duracion: duracion,                                    
            cantOper: cantOper,
            unidad: unidad,
            id_prevent: id_prevent,
            idsherramienta: idsherramienta,
            cantHerram: cantHerram, 
            idsinsumo: idsinsumo, 
            cantInsum: cantInsum
          },
          url: 'index.php/Preventivo/editar_preventivo',  
          success: function(data){                 
            $('#modalSale').modal('hide');                    
            console.log("resp preventivo: ");
            console.log(data.resPrenvent);
            if (data.resPrenvent == false) {
              alert("Preventivo no se ha guardado correctamente...");
            }     
            if(data.respHerram == false){
              alert("Herramientas no se ha guardado correctamente...");
            }
            if (data.respInsumo == false) {
              alert("Insumos no se ha guardado correctamente...");
            }
            cargarVista();                     
          },
          error: function(result){      
           $('#modalSale').modal('hide');                      
           console.log(result);
           console.log("Entre por el error");            
         },
         dataType: 'json'
       });
      };

      function cargarVista(){
        $('#content').empty();  
        $("#content").load("<?php echo base_url(); ?>index.php/Preventivo/index/<?php echo $permission; ?>");
        WaitingClose(); 
      }

</script>

<!-- Modal editar-->
<div class="modal fade" id="modalSale" tabindex="2000" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="row">
        <div class="col-xs-12">
          <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
            <h4><i class="icon fa fa-ban"></i> Error!</h4>
            Revise que todos los campos obligatorios esten seleccionados
          </div>
        </div>
      </div><!-- /.row -->

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Preventivo</h4> 
      </div>

      <div class="modal-body" id="modalBodySale">

        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos del Equipo </h3>
          </div>

          <div class="panel-body">
            <div class="row">
              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="equipo">Equipos <strong style="color: #dd4b39">*</strong></label>
                <select  id="equipo" name="componente" class="form-control" value="" disabled></select>
                <input type="hidden" id="id_equipo" name="id_equipo">
                <input type="hidden" id="id_preventivo" name="id_preventivo">
              </div>
            </div><!-- /.row -->
            <div class="row">
              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="fecha_ingreso">Fecha:</label>
                <input type="text" id="fecha_ingreso"  name="fecha_ingreso" class="form-control input-md" disabled />
              </div>
              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="marca">Marca:</label>
                <input type="text" id="marca"  name="marca" class="form-control input-md"  disabled />
              </div>
              <div class="col-xs-12 col-sm-6 col-md-4">
                <label for="ubicacion">Ubicacion:</label>
                <input type="text" id="ubicacion"  name="ubicacion" class="form-control input-md" disabled/>
              </div>
              <div class="col-xs-12">
                <label for="descripcion">Descripción:</label>
                <textarea class="form-control" id="descripcion" name="descripcion" disabled></textarea>
              </div>
            </div><!-- /.row -->
          </div>
        </div>

        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">Nueva Tarea </h4>
          </div>

          <div class="panel-body">
            <div class="row">
              <input type="hidden" id="id" name="id">
              <div class="col-xs-12 col-sm-6 col-md-4">Tarea <strong style="color: #dd4b39">*</strong>:
                <select id="tarea" name="tarea" class="form-control" value=""></select>
                <input type="hidden" id="id_tarea" name="id_tarea">
              </div>  
              <input type="hidden" id="id" name="id">
              <div class="col-xs-12 col-sm-6 col-md-4">Componente <strong style="color: #dd4b39">*</strong>:
                <select id="componente" name="equipo" class="form-control input-md"   />
                <input type="hidden" id="id_componente" name="id_componente" />
              </div>
              <div class="col-xs-12 col-sm-6 col-md-4">Fecha:
                <input type="date" id="ultimo"  name="ultimo" class="form-control " />
              </div>
            </div><!-- /.row -->
            <div class="row">
              <div class="col-xs-12 col-sm-6">Periodo <strong style="color: #dd4b39">*</strong>:
                <select id="periodo" name="periodo" class=" selectpicker form-control input-md">
                  <!--<option >Anual</option>-->
                  <option value="0">Diario</option>
                  <!--<option >Mensual</option>
                  <option >Periodos</option>
                  <option >Ciclos</option>
                  <option >Semestral</option>-->
                </select>
              </div>
              <div class="col-xs-12 col-sm-6 col-md-4">Frecuencia <strong style="color: #dd4b39">*</strong>:
                <input type="text"  id="cantidad" name="cantidad" class="form-control input-md" placeholder="Ingrese valor" />
              </div>
            </div><!-- /.row -->
          </div>
        </div>

        <div class="nav-tabs-custom">
          <!--tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#choras" aria-controls="home" role="tab" data-toggle="tab">Cantidad Horas/Hombres</a></li>
            <li role="presentation"><a href="#herramin" aria-controls="profile" role="tab" data-toggle="tab">Herramientas</a></li>
            <li role="presentation"><a href="#insum" aria-controls="messages" role="tab" data-toggle="tab">Insumos</a></li>
          </ul>

          <!-- Tab panes -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="choras">
              <div class="row" >
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="">Horas Hombre <strong style="color: #dd4b39">*</strong>:</label>
                  <input type="text" class="form-control" name="hshombre" id="hshombre">
                </div> 
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="">Duración <strong style="color: #dd4b39">*</strong>:</label>
                  <input type="text" class="form-control" id="duracion" name="duracion"/>
                </div> 
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="">U. de tiempo <strong style="color: #dd4b39">*</strong></label>
                  <select  id="unidad" name="unidad" class="form-control" />
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                  <label for="">Cant. Operarios <strong style="color: #dd4b39">*</strong>:</label>
                  <input type="text" class="form-control" id="cantOper" name="cantOper"/>
                </div>          
                <div class="col-xs-12">
                  <button type="button" class="btn btn-primary" onclick="calcularHsHombre();"style="margin-top: 19px;">Calcular</button>
                </div>                              
              </div>
            </div><!--cierre de choras-->

            <div role="tabpanel" class="tab-pane" id="herramin">
              <div class="panel panel-default">
                <div class="panel-body">
                  <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="herramienta">Codigo <strong style="color: #dd4b39">*</strong>:</label>
                      <select  id="herramienta"  name="herramienta" class="form-control input-md" value=""></select>
                      <input type="hidden" id="id_herramienta" name="id_herramienta">
                    </div>       
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="marcaherram">Marca:</label>
                      <input type="text" id="marcaherram" name="marcaherram" class="form-control input-md" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="descripcionherram">Descripcion:</label>
                      <input type="text" id="descripcionherram" name="descripcionherram" class="form-control input-md" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="cantidadherram">Cantidad <strong style="color: #dd4b39">*</strong>:</label>
                      <input type="text" id="cantidadherram" name="cantidadherram" class="form-control input-md" placeholder="Ingrese Cantidad" />
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-xs-12"> 
                      <br>
                      <button type="button" class="btn btn-primary" id="agregarherr"><i class="fa fa-check">Agregar</i></button>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-xs-12">
                      <table class="table table-bordered" id="tablaherramienta"> 
                        <thead>
                          <tr>                      
                            <th></th>
                            <th>Código</th>
                            <th>Marca</th>
                            <th>Descripcion</th>
                            <th>Cantidad</th>
                          </tr>
                        </thead>
                        <tbody></tbody>
                      </table>  
                    </div>
                  </div>
                </div>
              </div>
            </div> <!-- cierre div herram -->

            <div role="tabpanel" class="tab-pane" id="insum">
              <div class="panel panel-default">
                <div class="panel-body">
                  <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="insumo">Codigo:</label>
                      <select  id="insumo"  name="insumo" class="form-control input-md" value=""></select>
                      <input type="hidden" id="id_insumo" name="id_insumo">
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="descript">Descripcion:</label>
                      <input type="text" id="descript"  name="descript" class="form-control input-md" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                      <label for="cant">Cantidad:</label>
                      <input type="text" id="cant"  name="cant" class="form-control input-md" placeholder="Ingrese Cantidad"/>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-xs-12">
                      <br>
                      <button type="button" class="btn btn-primary" id="agregarins"><i class="fa fa-check">Agregar</i></button>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-xs-12">
                      <table class="table table-bordered" id="tablainsumo"> 
                        <thead>
                          <tr>
                            <th></th>
                            <th>Código</th>
                            <th>Descripcion</th>
                            <th>Cantidad</th>
                          </tr>
                        </thead>
                        <tbody></tbody>
                      </table>  
                    </div>
                  </div>
                </div>
              </div>
            </div><!--cierre div insum-->                       
          </div><!--tab-content-->
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="reset" data-dismiss="modal" onclick="guardarEdicion()">Guardar</button>
      </div>

    </div>
  </div>
</div>


  <!-- Modal Eliminar Warning -->
  <div class="modal fade" id="modalaviso">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" ><span class="fa fa-fw fa-times-circle text-light-blue"></span> Eliminar</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" >&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="id">
            <h4>¿Desea eliminar Preventivo?</h4>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminaPrevent();">Eliminar</button>
        </div>
      </div>
    </div>
  </div>
