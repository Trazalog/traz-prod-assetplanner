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
    <div class="alert alert-success" id="error2" style="display: none">
          <h4>EL EQUIPO POSEE COMPONENTES ASOCIADOS</h4>
      </div>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-success" id="error3" style="display: none">
          <h4>EL EQUIPO NO POSEE COMPONENTES ASOCIADOS</h4>
      </div>
  </div>
</div>
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h2 class="box-title ">Asociar Componentes a Equipo</h2>
           <?php
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-primary" style="width: 240px; margin-top: 10px;" id="listado"> Ver Listado Componentes</button>';
          }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">

          <form  id="form_comp" action="" accept-charset="utf-8">
            
            <div class="row" >
              <div class="col-xs-12">

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h3 class="panel-title"><span class="fa fa-cogs"></span> Datos de Equipo</h3>
                  </div><!-- /.panel-heading -->
                  <div class="panel-body">
                    <div class="row">
                      <div class="col-xs-12 col-md-6">
                        <label>Equipo <strong style="color: #dd4b39">*</strong> :</label>
                        <select id="equipo" name="equipo" class="form-control select2" />
                        <input type="hidden" id="id_equipo" name="id_equipo">
                      </div>
                      <br>
                      <br>
                      <div class="col-xs-12">
                      </div>
                      <br>
                      <br>
                      <div class="col-xs-12 col-md-6"><label>Descripción:</label>
                        <textarea class="form-control" id="descrip" name="descrip"  cols="18" rows="3" disabled></textarea>
                      </div>
                      <div class="col-xs-12 col-md-6">
                        <table class="table table-bordered table-responsive" id="tablacompo">
                          <thead>
                            <tr>
                              <!-- <th width="2%"></th>   -->                
                              <th>Componentes asociados:</th>
                            </tr>
                          </thead>
                          <tbody>

                          </tbody>
                        </table>
                      </div>
                    </div><!-- /.row -->
                  </div><!-- /.panel-body -->
                </div><!-- /.panel-default -->

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h3 class="panel-title"><span class="fa fa-th-large"></span> Asociar Componentes</h3>
                  </div>
                  <div class="panel-body">
                    <div class="row" >
                      <div class="col-xs-12 col-md-6"><label>Componente <strong style="color: #dd4b39">*</strong> :</label>
                        <select  id="componente" name="componente" class="form-control" />
                      </div>
                      <div class="col-xs-12 col-md-6">
                        <br>
                        <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#modalAddComp2"><i class="fa fa-plus"> Nuevo</i></a>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-xs-12 col-md-6">
                        <br>
                        <label for="codigo">Código: </label>
                        <input type="text" name="codigo" id="codigo" class="form-control">
                      </div>
                      <div class="col-xs-12">
                        <br>
                        <button type="button" class="btn btn-primary pull-right" id="addcompo"><i class="fa fa-check"> Asociar</i></button>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-xs-12">
                        <table class="table table-bordered" id="tablaequipos" border="1px">
                          <br>
                          <thead>
                            <tr>
                              <th>Acciones</th>
                              <th>Equipo</th>
                              <th>Componente</th>
                              <th>Código</th>
                              <th class="hidden"></th>
                            </tr>
                          </thead>
                          <tbody>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div><!-- /.panel-body -->
                </div><!-- /.panel-default -->

              </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-default delete" onclick="volverAsocCompEquipo()">Cancelar</button>
              <button type="button" class="btn btn-primary" onclick="guardar()">Guardar</button>
            </div>  <!-- /.modal footer -->
              <!-- / Modal -->
          </form>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<!-- Modal Agregar componente-->
<div class="modal" id="modalAddComp2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span class="fa fa-plus-square text-light-blue"></span> Agregar Componente</h4>
       </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="alert alert-danger alert-dismissable" id="errorComponentes" style="display: none">
          <h4><i class="icon fa fa-ban"></i> ALERTA!</h4>
          Complete todos los datos obligatorios.
        </div>
        <form id="formComponentes" enctype="multipart/form-data">
          <div class="row" >
            <div class="alert alert-danger alert-dismissable" id="error1" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos...                  
            </div>
            <div class="col-xs-12 col-sm-6">
              <label>Marca <strong style="color: #dd4b39">*</strong>: </label>
              <select class="form-control input-md" id="ma" name="ma" />
            </div>
            <div class="col-xs-12 col-sm-6">
              <label>Descripción <strong style="color: #dd4b39">*</strong>: </label>
              <input type="text"   class="form-control input-md" id="descrip1"  name="descrip1" placeholder="Ingrese Descripcion" />
            </div>
            <div class="col-xs-12"><label>Información:</label>
              <textarea class="form-control" id="info" name="info" placeholder="Ingrese Informacion Adicional"></textarea>
            </div>
            <div class="col-xs-12">
              <label><span class="fa fa-file-pdf-o"></span> Adjuntar</label>
              <input id="pdf" name="pdf" type="file"  class="form-control input-md">
            </div>

          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary" id="guardarComponente">Guardar</button>
        </div>  <!-- /.modal footer -->
        </form>
      </div>  <!-- /.modal-body -->
    </div> <!-- /.modal-content -->

  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal fade -->
<!-- / Modal -->

<script>
$('#tablaequipos').DataTable({
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


//si abre mas de dos modales...
$(document).on('show.bs.modal', '.modal', function () {
    if ($(".modal-backdrop").length > -1) {
        $(".modal-backdrop").not(':first').remove();
    }
});

var di="";
var ge="";
// Completa el select equipos
traer_equipo();
function traer_equipo(){
 
  $.ajax({
    type: 'POST',
    url: 'index.php/Componente/traerequipo', 
    success: function(data){
           
            var opcion  = "<option value='-1'>Seleccione...</option>" ; 
            $('#equipo').append(opcion); 
            for(var i=0; i < data.length ; i++){    
                
                var nombre = data[i]['codigo'];
                var opcion  = "<option value='"+data[i]['id_equipo']+"'>" +nombre+ "</option>" ;
                $('#equipo').append(opcion);                                
            }
          },
    error: function(result){          
          console.log(result);
        },
       dataType: 'json'
    });
}

// Trae componentes segun empresa (no equipos)
  // traer_componente();
  // function traer_componente(){
  //   $.ajax({
  //     type: 'POST',
  //     data: { },
  //     url: 'index.php/Componente/getcomponente', //index.php/
  //     success: function(data){
  //            $('#componente').empty();
  //             var opcion  = "<option value='-1'>Seleccione...</option>" ; 
  //             $('#componente').append(opcion); 
  //             for(var i=0; i < data.length ; i++){  
  //               var nombre = data[i]['descripcion'];
  //               var opcion  = "<option value='"+data[i]['id_componente']+"'>" +nombre+ "</option>" ; 
  //               $('#componente').append(opcion);                                
  //             }
  //           },
  //     error: function(result){          
  //           console.log(result);
  //          },
  //         dataType: 'json'
  //     });
  // }

// Trae componentes segun empresa (no equipos)
traer_componente();
function traer_componente(){
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Componente/getcomponente',
    success: function(data){
      $('#componente').empty();
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#componente').append(opcion); 
      for(var i=0; i < data.length ; i++){  
        var nombre = data[i]['descripcion']+" - "+data[i]['marcadescrip']+" - "+data[i]['informacion'];
        var opcion  = "<option value='"+data[i]['id_componente']+"'>" +nombre+ "</option>" ; 
        $('#componente').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
}





// Trae marcas para modal agregar componente - Chequeado
traer_marca();
function traer_marca(){
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Componente/getmarca', 
    success: function(data){
            $('#ma').empty();
            var opcion  = "<option value='-1'>Seleccione...</option>" ; 
            $('#ma').append(opcion); 
            for(var i=0; i < data.length ; i++){    
                  var nombre = data[i]['marcadescrip'];
                  var opcion  = "<option value='"+data[i]['marcaid']+"'>" +nombre+ "</option>" ;
                $('#ma').append(opcion);                                
            }
          },
    error: function(result){
          
          console.log(result);
        },
        dataType: 'json'
    });
}

// Llena textarea Descrip segun id de euipo
function traer_descripcion(idequipo){
  $.ajax({
    type: 'POST',
    data: { idequipo: idequipo},
    url: 'index.php/Componente/getequipo',
    success: function(data){
            console.log(data);
            console.log(data.datos);

            
            if(data=='nada'){
              var d='No hay Descripcion cargada';
              $('#descrip').append(d);
            }
             $('#descrip').val(data.datos);

        },
    error: function(result){
          console.log(result);
            },
           dataType: 'json'
        });   
}

// Limpia modal agregar componente
function limpiarModal(){

  $("#equipo").val("");
  $("#descrip").val("");
  $("#componente").val("");
  $('#tablacompo tbody tr').remove();
  $('#tablaequipos tbody tr').remove();
}

// Guarda asociacion Equipo/componente 
function guardar(){ 
  var id_equipo = new Array();     
  $("#tablaequipos tbody tr").each(function (index){
    var idequipo = $(this).attr('id');
    id_equipo.push(idequipo); 
  });  

  comp   = {};
  codigo = {};
  var j  = 1;
  var f  = 1;
  $("#tablaequipos tbody tr").each(function (index){
    var campo1, campo2, campo3, campo4;
    $(this).children("td").each(function (index2){
      switch (index2){
        case 0: 
          campo1 = $(this).text();
          break;
        case 1: 
          campo2 = $(this).text();
          break;
        case 2: 
          campo3 = $(this).text();
          break;
        case 3: 
          campo3    = $(this).text();
          codigo[j] = campo3; 
          break;
        case 4: 
          campo4  = $(this).text();
          comp[j] = campo4;
          j++;
          break;
      }
    });
    console.log(codigo);
  });

  var eq     = $('#equipo').val();
  //console.log(eq);
  var parametros = {
    'id_equipo': $('#equipo').val(),
  };
  console.log("parametros (id_equipo): ");
  console.table(parametros);
  console.log("componentes: ");
  console.table(comp);
  console.log("codigo: ");
  console.table(codigo);
  console.log("bandera: "+x);
  var hayError = false;
  if(eq !== '-1' && comp !== '-1'){   
    $.ajax({
        type: 'POST',
        data: {data:parametros, codigo:codigo, comp:comp, x:x, ge:ge},
        url: 'index.php/Componente/guardar_componente',  //index.php/
        success: function(data){
          console.log("entre por el guardado del componente equipo");
                console.log(data);
                alert ("guardado con exito");
                cargarVista();
              },
        error: function(result){
          console.log("entre por el error del componente equipo");
              
              console.log(result);
              
            }
           // dataType: 'json'
        });
        limpiarModal();
        }
  else{
    hayError=true;
    $('#error').fadeIn('slow');
  }
  if(hayError == false){
    $('#error').fadeOut('slow');
  }
}

// Guarda un componente nuevo
$('#guardarComponente').click(function(e) { //
  e.preventDefault();

  var descripcion = $('#descrip1').val();
  var informacion = $('#informacion').val();
  var marcaid     = $('#ma').val();
  var pdf         = $('#input-4').val();
  var parametros  = {
    'descripcion' : descripcion,
    'informacion' : informacion,
    'marcaid'     : marcaid,
    'pdf'         : pdf,
  };                                              
  //console.log("marcaid"+marcaid);
  var hayError = false; 
  $('#errorComponentes').hide();
  if ( marcaid < 0 ) {
    hayError = true;
    console.log("entro x marcaid");
  }
  if( descripcion == "" ) {
    hayError = true;
    console.log("entro x descrip");
  }

  if(hayError == true){
    $('#errorComponentes').fadeIn('slow');
  }
  else{
    var formData = new FormData(document.getElementById("formComponentes"));
    $.ajax({
      cache: false,
      contentType: false,
      data: formData,
      dataType: "html",
      processData: false,
      type: "POST",
      url: "index.php/Componente/agregarComponente", 
      success: function(data){
        traer_componente();
        $("#modalAddComp2").modal("hide");
        //$("#modalAddComp2").css("display":"none");
        //$('.modal.in:visible').modal('hide');
        //$(".modal-backdrop.in").hide();
      },
      error: function(result){
          console.error("Error al crear componente");
          console.table(result);
      },
    });
  }
});

// Crea la tabla con la asociacion de equipo/componente
var equipoglob="";
var x=0;
$('#addcompo').click(function (e) {
  var $equipo       = $("select#equipo option:selected").html();
  var id_equipo     = $('#equipo').val();
  var $componente   = $("select#componente option:selected").html();
  var codigo        = $('#codigo').val();
  var id_componente = $('#componente').val();
  equipoglob        = id_equipo;
  console.info('codigo: '+codigo);
  /*var tr = "<tr id='"+id_equipo+"'>"+
              "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
              "<td>"+$equipo +"</td>"+
              "<td>"+$componente+"</td>"+
              "<td class='hidden' >"+id_componente+"</td>"+
            "</tr>";*/
  var table   = $('#tablaequipos').DataTable();
  if(id_componente >0 && equipoglob >0) {
    /*$('#tablaequipos tbody').append(tr);*/
    var rowNode = table.row.add( [
      "<i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i>",
      id_equipo,
      $componente,
      codigo,
      id_componente
    ] ).node();
    rowNode.id = id_equipo;
    table.draw();
    $( rowNode ).find('td').eq(4).addClass('hidden');

    $('#error').fadeOut('slow');
    $('#descrip').val('');
    $('#tablacompo tbody tr').remove('');
    $('#equipo').val('');
    $('#codigo').val('');
    $('#componente').val('');
  }
  else{
    var hayError = true;
    $('#error').fadeIn('slow')
  }
  if(hayError == false){ 
    $('#error').fadeOut('slow');
  }
  x++;
  //console.log(tr);
  $(document).on("click",".elirow",function(){
    //var parent = $(this).closest('tr');
    //$(parent).remove();
    table.row($(this).parents('tr')).remove().draw(false);
  });
});

// Vuelve al listado al guardar
$('#listado').click( function cargarVista(){
    WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Componente/index/<?php echo $permission; ?>");
    WaitingClose();
});

function volverAsocCompEquipo(){
  WaitingOpen();
    $('#content').empty();
    $("#content").load("<?php echo base_url(); ?>index.php/Componente/asigna/<?php echo $permission; ?>");
    WaitingClose();
}

// Cuando selecciona equipo carga componentes
var s=0; 
$('#equipo').change(function(){

  var idequipo = $(this).val();
  var d=$(this).parent('td').parent('tr').attr('id');
  di=d;
  ge=idequipo;
  console.log("id de equipo");
  console.log(idequipo);
  $('#tablacompo tbody tr').html("");
  
  $.ajax({
      type: 'POST',
      data: { idequipo: idequipo},
      url: 'Componente/getcompo', 
      success: function(data){                  
                  console.log(data); 
                  if (data!= 0) {
                    var de = data[0]['descripcion']; 
                    var comp = data[0]['dee11'];
                    $('#descrip').val(de); 
                    
                    for(var i=0; i < data.length ; i++){
                      
                    var  table= "<tr id='"+i+"'>"+   
                                  // "<td ></td>"+
                                 "<td>"+data[i]['dee11']+"</td>"+
                                 "<td class='hidden' id='"+data[i]['id_componente']+"' >"+data[i]['id_componente']+"</td>"+
                                 
                               "</tr>";
                      $('#tablacompo').append(table); 
                      s++;
                    }             
                 
                    console.log(table);
                    console.log(s);
                    $('#tablacompo').val('');
                  }
                   else{
                   traer_descripcion(idequipo); 
                  } 
              },
      error: function(result){
              //alert("error entr en la otra consulta");
              console.log(result);
             traer_descripcion(idequipo);
            },
      dataType: 'json'
  });
});

</script>
  


























 