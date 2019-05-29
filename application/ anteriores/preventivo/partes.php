<script>

  var isOpenWindow = false;
  var codhermglo="";
  var codinsumolo="";
  var preglob="";

  edit=0;  datos=Array();
  

  





  function ordenaArregloDeObjetosPor(propiedad) {  
    return function(a, b) {  
      if (a[propiedad] > b[propiedad]) {  
        return 1;  
      } else if (a[propiedad] < b[propiedad]) {  
        return -1;  
      }  
      return 0;  
    }  
  } 
////// HERRAMIENTAS //////

  //Trae herramientas
  var dataHerramientas = function() {
                          var tmp = null;
                          $.ajax({
                            'async': false,
                            'type': "POST",
                            'dataType': 'json',
                            'url': 'index.php/Preventivo/getHerramientasB',
                          })
                          .done( (data) => { tmp = data } )
                          .fail( () => alert("Error al traer Herramientas") );
                          return tmp;
                        }();

  // data busqueda por codigo de herramientas
  function dataCodigoHerr(request, response) {
    function hasMatch(s) {
      return s.toLowerCase().indexOf(request.term.toLowerCase())!==-1;
    }
    var i, l, obj, matches = [];

    if (request.term==="") {
      response([]);
      return;
    }
    
    //ordeno por codigo de herramientas
    dataHerramientas = dataHerramientas.sort(ordenaArregloDeObjetosPor("codigo"));

    for  (i = 0, l = dataHerramientas.length; i<l; i++) {
      obj = dataHerramientas[i];
      if (hasMatch(obj.codigo)) {
        matches.push(obj);
      }
    }
    response(matches);
  }
  // data busqueda por marca de herramientas
  function dataMarcaHerr(request, response) {
    function hasMatch(s) {
      return s.toLowerCase().indexOf(request.term.toLowerCase())!==-1;
    }
    var i, l, obj, matches = [];
  }  

  var cod="";
  $("#agregarherr").click(function (e) {   

    //ordeno por marca de herramientas
    dataHerramientas = dataHerramientas.sort(ordenaArregloDeObjetosPor("marca"));

    for  (i = 0, l = dataHerramientas.length; i<l; i++) {
      obj = dataHerramientas[i];
      if (hasMatch(obj.marca)) {
        matches.push(obj);
      }
    }
    response(matches);
  });
  

  //busqueda por marcas de herramientas
  $("#herramienta").autocomplete({
    source:    dataCodigoHerr,
    delay:     500,
    minLength: 1,
    focus: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.codigo);
      $('#id_herramienta').val(ui.item.value);
      $('#marcaherram').val(ui.item.marca);
      $('#descripcionherram').val(ui.item.label);
    },
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.codigo);
      $('#id_herramienta').val(ui.item.value);
      $('#marcaherram').val(ui.item.marca);
      $('#descripcionherram').val(ui.item.label);
    },
  })
  //muestro marca en listado de resultados
  .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li>" )
    .append( "<a>" + item.codigo + "</a>" )
    .appendTo( ul );
  };

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
    $('#insumo').html("");
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
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.marca);
      $('#id_herramienta').val(ui.item.value);
      $('#herramienta').val(ui.item.codigo);
      $('#descripcionherram').val(ui.item.label);
    },
  })
  //muestro marca en listado de resultados
  .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li>" )
    .append( "<a>" + item.marca + "</a>" )
    .appendTo( ul );
  };

  //busqueda por descripcion de herramientas
  $("#descripcionherram").autocomplete({
    source:    dataHerramientas,
    delay:     500,
    minLength: 1,
    focus: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.label);
      $('#id_herramienta').val(ui.item.value);
      $('#herramienta').val(ui.item.codigo);
      $('#marcaherram').val(ui.item.marca);
    },
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.label);
      $('#id_herramienta').val(ui.item.value);
      $('#herramienta').val(ui.item.codigo);
      $('#marcaherram').val(ui.item.marca);
    },
  });


  
////// HERRAMIENTAS //////


////// INSUMOS //////

  //Trae insumos
  var dataInsumos = function() {
    var tmp = null;
    $.ajax({
      'async': false,
      'type': "POST",
      'dataType': 'json',
      'url': 'index.php/Preventivo/getinsumo',
    })
    .done( (data) => { tmp = data } )
    .fail( () => alert("Error al traer Herramientas") );
    return tmp;
  }();

  // data busqueda por codigo de herramientas
  function dataCodigoInsumo(request, response) {
    function hasMatch(s) {
      return s.toLowerCase().indexOf(request.term.toLowerCase())!==-1;
    }
    var i, l, obj, matches = [];

    if (request.term==="") {
      response([]);
      return;
    }

    //ordeno por codigo de herramientas
    dataHerramientas = dataHerramientas.sort(ordenaArregloDeObjetosPor("codigo"));

    for  (i = 0, l = dataInsumos.length; i<l; i++) {
      obj = dataInsumos[i];
      if (hasMatch(obj.codigo)) {
        matches.push(obj);
      }
    }
    response(matches);
  }


  //busqueda por marcas de herramientas
  $("#insumo").autocomplete({
    source:    dataCodigoInsumo,
    delay:     500,
    minLength: 1,
    focus: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.codigo);
      $('#id_insumo').val(ui.item.value);
      $('#descript').val(ui.item.label);
    },
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.codigo);
      $('#id_insumo').val(ui.item.value);
      $('#descript').val(ui.item.label);
    },
  })
  //muestro marca en listado de resultados
  .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li>" )
    .append( "<a>" + item.codigo + "</a>" )
    .appendTo( ul );
  };

  //busqueda por descripcion de herramientas
  $("#descript").autocomplete({
    source:    dataInsumos,
    delay:     500,
    minLength: 1,
    focus: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.label);
      $('#id_insumo').val(ui.item.value);
      $('#insumo').val(ui.item.codigo);
    },
    select: function(event, ui) {
      event.preventDefault();
      $(this).val(ui.item.label);
      $('#id_herramienta').val(ui.item.value);
      $('#herramienta').val(ui.item.codigo);
      $('#marcaherram').val(ui.item.marca);
    },
  });

  // Agrega insumos a la tabla 
  var nrofilaIns = 0; 
  $("#agregarins").click(function (e) {
      var id_insumo = $('#id_insumo').val(); 
      var $insumo   = $("#insumo").val();
      var descript = $('#descript').val();
      var cant = $('#cant').val();     
      console.log("El id  del insumo");
      console.log(id_insumo);
      var hayError = false;
      var tr = "<tr id='"+id_insumo+"'>"+
                    "<td ><i class='fa fa-ban elirow' style='color: #f39c12'; cursor: 'pointer'></i></td>"+
                    "<td>"+$insumo+"</td>"+
                    "<td>"+descript+"</td>"+
                    "<td>"+cant+"</td>"+

                    // guardo id de insumos y cantidades
                    "<input type='hidden' name='id_insumo["+nrofilaIns+"]' value='"+id_insumo+"'>" +
                    "<input type='hidden' name='cant_insumo["+nrofilaIns+"]' value='"+cant+"'>" +
                "</tr>";
      nrofilaIns = nrofilaIns + 1;          
      if(id_insumo > 0 && cant > 0){
        $('#tablainsumo tbody').append(tr); 
      }
      else {
             return;
      }    

      $(document).on("click",".elirow",function(){
        var parent = $(this).closest('tr');
        $(parent).remove();
      });
       
      $('#insumo').val('');
      $('#descript').val(''); 
      $('#cant').val(''); 
  });
////// INSUMOS //////





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



function cargarVista(){
  $('#content').empty();  
  $("#content").load("<?php echo base_url(); ?>index.php/Preventivo/index/<?php echo $permission; ?>");
  WaitingClose(); 
}


/////// Edicion de Adjunto

  //abrir modal eliminar adjunto
  $(document).on("click",".eliminaAdjunto",function(){
    $('#modalEliminarAdjunto').modal('show');
    var idprev = $('#id_preventivo').val();
    $('#idAdjunto').val(idprev);
  });
  //eliminar adjunto
  function eliminarAdjunto() {
    $('#modalEliminarAdjunto').modal('hide');
    var idprev = $('#idAdjunto').val();
    $.ajax({
      data: { idprev: idprev },
      dataType: 'json',
      type: 'POST',
      url: 'index.php/Preventivo/eliminarAdjunto',
    }) 
    .done( function(data){     
      //console.table(data); 
      let prevAdjunto = '';
      recargaTablaAdjunto(prevAdjunto);
    })                
    .error( function(result){                      
      console.error(result);
    }); 
  }

  //abrir modal agregar adjunto
  $(document).on("click",".agregaAdjunto",function(){
    $('#btnAgregarEditar').text("Agregar");
    $('#modalAgregarAdjunto .modal-title').html('<span class="fa fa-fw fa-plus-square text-light-blue"></span> Agregar');

    $('#modalAgregarAdjunto').modal('show');
    var idprev = $('#id_preventivo').val();
    $('#idAgregaAdjunto').val(idprev);
  });
  //abrir modal editar adjunto
  $(document).on("click",".editaAdjunto",function(){
    $('#btnAgregarEditar').text("Editar");
    $('#modalAgregarAdjunto .modal-title').html('<span class="fa fa-fw fa-pencil text-light-blue"></span> Editar');

    $('#modalAgregarAdjunto').modal('show');
    var idprev = $('#id_preventivo').val();
    $('#idAgregaAdjunto').val(idprev);
  });
  //eliminar adjunto
  $("#formAgregarAdjunto").submit(function (event){
    $('#modalAgregarAdjunto').modal('hide');

    event.preventDefault();  
    if (document.getElementById("inputPDF").files.length == 0) {
      $('#error').fadeIn('slow');
    }
    else{
      $('#error').fadeOut('slow');
      var formData = new FormData($("#formAgregarAdjunto")[0]);
      //debugger
      $.ajax({
        cache:false,
        contentType:false,
        data:formData,
        dataType:'json',
        processData:false,
        type:'POST',
        url:'index.php/Preventivo/agregarAdjunto',
      })
      .done( function(data){     
        console.table(data['prev_adjunto']); 
        recargaTablaAdjunto( data['prev_adjunto'] );
      })                
      .error( function(result){                      
        console.error(result);
      }); 
    }
  });

  function recargaTablaAdjunto(prevAdjunto) {
    //console.info( "adjunto: "+prevAdjunto );
    $('#adjunto').text(prevAdjunto);
    $('#adjunto').attr('href', 'assets/filespreventivos/'+prevAdjunto);
    if( prevAdjunto == null || prevAdjunto == '') {
      var accion = '<i class="fa fa-plus-square agregaAdjunto text-light-blue" style="color:#f39c12; cursor:pointer; margin-right:10px" title="Agregar Adjunto"></i>';
    } else {
      var accion = '<i class="fa fa-times-circle eliminaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Eliminar Adjunto"></i>'+'<i class="fa fa-pencil editaAdjunto text-light-blue" style="cursor:pointer; margin-right:10px" title="Editar Adjunto"></i>';
    }
    $('#accionAdjunto').html(accion);
  }

  $('#modalSale').on('hidden.bs.modal', function (e) {
    $('#content').empty();  
    $("#content").load("<?php echo base_url(); ?>index.php/Preventivo/index/<?php echo $permission; ?>");
  })



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


</script>