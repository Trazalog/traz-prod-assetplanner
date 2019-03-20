<input type="hidden" id="permission" value="<?php echo $permission; ?>">
<div class="row">
  <div class="col-xs-12">
    <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
      <h4><i class="icon fa fa-ban"></i> ERROR!</h4>
      INGRESE TAREA A REALIZAR!!
    </div>
  </div>
</div>

<style>
  #id {
    margin-top: 20px;
  }
</style>

<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h1 class="box-title"> Asignación de tareas</h1>

          <button class="btn btn-block btn-primary" style="width: 100px; float:right" id="listado">Volver</button>
          <hr>
        </div><!-- /.box-header -->
        <br>
        <div class="box-body">
          <div class="col-xs-8">
          <div id="desplegable" class="box box-default collapsed-box">
            <div class="box-header with-border">
              <h3 id="tituloInfo" class="box-title">Seleccionar Tarea</h3>
              <select id="lista_tareas" name="lista_tareas" class="form-control " placeholder="" value=""></select>
              <div class="box-tools pull-right">
                <button id="desplegar" type="button" class="btn btn-box-tool hidden" data-widget="collapse">
                  <i class="fa fa-plus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul id="lista_subtareas">
                <!-- Lista de Tareas de lista_tareas -->
              </ul>
              <button class="btn btn-primary" style="float:right;" onclick="rellenar_tabla()">Agregar</button>
            </div>
            <!-- /.box-body -->
          </div>

            <div class="col-xs-4">
              <input type="hidden" id="numord" name="numord" value="<?php echo $id_orden; ?>">
            </div>
            <br>

            <br>
            <div class="input-group" >
              <input class="form-control" type="text" id="tarea_adicional"
                placeholder="Ingrese Tareas Adicionales a Realizar" style="text-align: center;">
              <div class="input-group-btn">
                <button type="button" class="btn btn-primary" onclick="agregar_tarea()">Agregar</button>
              </div>
              <!-- /btn-group -->
            </div>
            <br>

            <table id="orden" class="table table-bordered table-hover" width="80%">
              <thead>
                <tr>
                  <th width="90%">Descripcion Subtarea</th>
                  <th width="5%">Accion</th>
                </tr>
              </thead>
              <tbody id="tabla_subtareas">
                <!-- Contenido de Tabla -->
              </tbody>
            </table>
          </div>
        </div>
        <!-- box-body -->
        <button class="btn btn-success" style="float:right;margin-top:-40px;margin-right:5px" onclick="guardar()">Guardar</button>

      </div>
    </div>
  </div>
</section>

<script>
  Obtener_Tareas()

  function Obtener_Tareas() {
    var lista_tareas = $('#lista_tareas');
    $.ajax({
      type: 'POST',
      url: 'index.php/Tarea/Obtener_Todas',
      success: function (data) {
        lista_tareas.append($('<option />',
          {
            value: "0",
            text: "Seleccione..."
          }));

        for (var i = 0; i < data.length; i++) {
          lista_tareas.append($('<option />',
            {
              value: data[i]['id_tarea'],
              text: data[i]['descripcion']
            }
          ));
        };
      },
      error: function (result) {
        console.log(result);
      },
      dataType: 'json'
    });
  }

  var data_sub;

  $('#lista_tareas').on('change', function () {
    //EVENTO SELECCIONAR TAREA >> MOSTRAR PLANTILLA
    var lista = $('#lista_subtareas');
    lista.html('');
    data_sub=[];
    $.ajax({
      type: 'POST',
      data: { 'tarea_std': this.value },
      url: 'index.php/Tarea/Obtener_Subtareas',
      success: function (data) {
        data_sub = data;
        console.table(data);
        for (let i = 0; i < data.length; i++) {
          const element = '<li>' + data[i]['tareadescrip'] + '</li>';
          lista.append(element);
        }
        collapse_box();

      },
      error: function (result) {
        console.log(result);
      },
      dataType: 'json'
    });
  });

  function agregar_tarea() {
    if ($('#tarea_adicional').val() == '') return;
    var aux = '<td>' + $('#tarea_adicional').val() + '</td><td><i class="fa fa-close" onclick="eliminar_fila(this)"></i></td>';
    aux = '<tr class="tarea_add" id="0" tarea="'+$("#tarea_adicional").val()+'">' + aux + '<tr>';
    //data_sub.push({'tareadescrip': $('#tarea_adicional').val()});
    $('#tabla_subtareas').append(aux);
    $('#tarea_adicional').val('');
  }

  function rellenar_tabla() {
    var aux = "";
    for (let i = 0; i < data_sub.length; i++) {
      aux = '<td>' + data_sub[i]['tareadescrip'] + '</td><td><i class="fa fa-close" onclick="eliminar_fila(this)"></i></td>';
      aux = '<tr class="tarea_add" id_sub="'+data_sub[i]['id_subtarea']+'" tarea="'+data_sub[i]['tareadescrip']+'">' + aux + '<tr>';
      $('#tabla_subtareas').append(aux);
    }
    collapse_box();
    $('#lista_tareas').val(0);

  }

  function eliminar_fila(e) {
    $(e).parent().parent().remove();
  }

  function guardar(){
    WaitingOpen();
    var aux=[];
    $('.tarea_add').each(function(i,e){

      aux.push({
        'id_subtarea':$(e).attr('id_sub'),
        'id_orden':$('#numord').val(),
        'tareadescrip':$(e).attr('tarea'),
        'id_usuario':'<?php echo $this->session->userdata('user_data')[0]['usrId'];?>',
        'fecha':new Date().toISOString().slice(0,10),
        'estado':'C'
      });

    });

    if(aux.length==0){WaitingClose();alert('No hay tareas seleccionadas');return;}
    var obj = $.extend({}, aux);
    
    $.ajax({
      type: 'POST',
      data: obj,
      url: 'index.php/Tarea/Guardar_Subtareas',
      success: function (data) {
        WaitingClose();
        $('#tabla_subtareas').html('');
      },
      error: function (result) {
        WaitingClose();
        console.log(result);
      }
    });
  }

 

  function collapse_box() {
    // if ($('#desplegable').is('.collapsed-box:not(.show)')) {
    //   $('#desplegar').click();
    // }
    $('#desplegar').click();
  }
</script>