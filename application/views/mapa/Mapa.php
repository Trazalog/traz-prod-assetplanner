<input type="hidden" id="permission" value="<?php echo $permission; ?>">
<section class="content">
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
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Reporte Ordenes de Trabajo</h3>
                </div>

                <div class="box-body">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Datos a filtrar</h3>
                        </div><!-- /.panel-heading -->

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="check" id="selEquipo"><strong>Equipo</strong>
                                        </label>
                                    </div>
                                    <select class="form-control" id="equipSelec" placeholder="Seleccione tipo...">
                                        <option selected disabled>Seleccione equipo</option>
                                    </select>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="check" id="selestado"><strong>Operario</strong>
                                        </label>
                                    </div>
                                    <select class="form-control" id="estSelec" placeholder="Seleccione tipo...">
                                        <option selected disabled>Seleccione operario</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="check" id="selFecha"> <strong>Fecha</strong>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <label for="desde">Desde</label>
                                    <input type="text" class="form-control fecha check" id="desde" placeholder="">
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <label for="hasta">Hasta</label>
                                    <input type="text" class="form-control fecha check" id="hasta" placeholder="">
                                </div>
                            </div>

                        </div><!-- /.panel-body -->
                        <div class="panel-footer">
                            <button class="btn btn-primary" id="consultar">Consultar</button>
                            <!--<button class="btn btn-primary" id="btnExportExcel">Exportar</button>-->
                        </div>

                    </div><!-- /.panel -->
                </div><!-- /.box-body -->

                <div class="box-footer">
                    <div class="panel panel-default" id="panelReporteOT">
                        <div class="panel-heading">
                            <h3 class="panel-title">Consulta</h3>
                        </div>

                        <div class="panel-body">
                            <table id="tablaReporteOT" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Orden de Trabajo</th>
                                        <th>Descripcion</th>
                                        <th>Tarea</th>
                                        <th>Equipo</th>
                                        <th>Fecha</th>
                                        <th>Fecha de Programacion</th>
                                        <th>Fecha Terminacion</th>
                                        <th>Fecha de Entregada</th>
                                        <th>Origen</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- -->
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    // Oculto el panel resultados
    $("#panelReporteOT").css("display", "none");



    // cargo plugin DateTimePicker
    $('#desde, #hasta').datetimepicker({
        format: 'YYYY-MM-DD',
        locale: 'es',
    });



    // Habilito y deshabilito los select de opciones de busqueda
    var opcionEquipo = 0;
    var opcionEstado = 0;
    var opcionFecha = 0;

    function enabDisabEquipo() {
        if (this.checked) {
            opcionEquipo = 1;
            $("select#equipSelec").removeAttr("disabled");
        } else {
            opcionEquipo = 0;
            $("select#equipSelec").attr("disabled", true);
            $("select#equipSelec").val('');
        }
    }

    function enabDisabEstado() {
        if (this.checked) {
            opcionEstado = 1;
            $("select#estSelec").removeAttr("disabled");
        } else {
            opcionEstado = 0;
            $("select#estSelec").attr("disabled", true);
            $("select#estSelec").val('');
        }
    }

    function enabDisabFecha() {
        if (this.checked) {
            opcionFecha = 1;
            $("input.fecha").removeAttr("disabled");
        } else {
            opcionFecha = 0;
            $("input.fecha").attr("disabled", true);
            $("input.fecha").val('');
        }
    }

    enabDisabEquipo();
    $("#selEquipo").click(enabDisabEquipo);
    enabDisabEstado();
    $("#selestado").click(enabDisabEstado);
    enabDisabFecha();
    $("#selFecha").click(enabDisabFecha);



    // Trae equipos y llena su select
    function traeEquipos() {
        return new Promise(function(resolve, reject) {
            $.ajax({
                    'dataType': 'json',
                    'type': "POST",
                    'url': "Reporteorden/getEquipo",
                })
                .done(resolve)
                .fail(reject)
        });
    }
    traeEquipos().then(
        function resolve(data) {
            var $select = $("#equipSelec");
            for (var i = 0; i < data.length; i++) {
                $select.append($('<option />', {
                    value: data[i]['id_equipo'],
                    text: data[i]['codigo'] + ' - ' + data[i]['descripcion']
                }));
            }
        },
        function reject(reason) {
            alert("Error al traer los equipos");
            console.table(reason);
        }
    );



    // Trae Estados y llena su select
    function traeEstados() {
        return new Promise(function(resolve, reject) {
            $.ajax({
                    'dataType': 'json',
                    'type': 'POST',
                    'url': 'Reporteorden/getestado',
                })
                .done(resolve)
                .fail(reject)
        });
    }
    traeEstados().then(
        function resolve(data) {
            var $select = $("#estSelec");
            for (var i = 0; i < data.length; i++) {
                if (data[i]['estado'] != 'AN') //Si viene estado anulado lo ignora
                    $select.append($('<option />', {
                        value: data[i]['estado'],
                        text: data[i]['descripcion']
                    }));
            }
        },
        function reject(reason) {
            alert("Error al traer los Estados");
            console.table(reason);
        }
    );

    // Trae Operarios y llena su select
    // function getOperarios() {
    //     return new Promise(function(resolve, reject) {
    //         $.ajax({
    //                 'dataType': 'json',
    //                 'type': 'POST',
    //                 'url': 'Mapa/getOperarios',
    //             })
    //             .done(resolve)
    //             .fail(reject)
    //     });
    // }
    // getOperarios().then(
    //     function resolve(data) {
    //         var $select = $("#estSelec");
    //         for (var i = 0; i < data.length; i++) {
    //             if (data[i]['estado'] != 'AN') //Si viene estado anulado lo ignora
    //                 $select.append($('<option />', {
    //                     value: data[i]['estado'],
    //                     text: data[i]['descripcion']
    //                 }));
    //         }
    //     },
    //     function reject(reason) {
    //         alert("Error al traer los Estados");
    //         console.table(reason);
    //     }
    // );

    // Valido datos para consulta
    function validaDatos() {
        //si equipo está tildado y está vacío
        if (opcionEquipo && $("select#equipSelec").val() == "") {
            alert("Seleccione un equipo.");
            return false;
        }
        //si estado está tildado y está vacío
        if (opcionEstado && $("select#estSelec").val() == "") {
            alert("Seleccione un estado.");
            return false;
        }
        return true;
    }


    // Llenar tabla
    function llenarTabla(data) {
        $('#tablaReporteOT').DataTable().clear().draw();
        for (var i = 0; i < data.length; i++) {
            $('#tablaReporteOT').DataTable().row.add([
                data[i].id_orden,
                data[i].descripcionOT,
                data[i].descripcioTarea,
                data[i].codigoEquipo + ' - ' + data[i].descripcionEquipo,
                data[i].fecha,
                data[i].fecha_program,
                data[i].fecha_terminada,
                data[i].fecha_entregada,
                data[i].origenOT,
                data[i].estado,
            ]).draw();
        }
    }

    // trae datos del reporte
    function traeDatosReporte() {
        let idEquipo = $('#equipSelec').val();
        let estado = $('#estSelec').val();
        let desde = $('#desde').val();
        let hasta = $('#hasta').val();
        let parametros = {
            'opcionEquipo': opcionEquipo,
            'opcionEstado': opcionEstado,
            'opcionFecha': opcionFecha,
            'idEquipo': idEquipo,
            'estado': estado,
            'desde': desde,
            'hasta': hasta,
        }
        console.table(parametros);
        WaitingOpen("Cargando Reporte de OTs...");
        $.ajax({
                data: {
                    parametros: parametros
                },
                dataType: 'json',
                type: 'POST',
                url: 'index.php/Reporteorden/getDatosReporte',
            })
            .done((data) => {
                llenarTabla(data)
            })
            .fail(() => alert("Error al traer el reporte."))
            .always(() => WaitingClose());
    }

    // 
    $("#consultar").click(function(evento) {
        evento.preventDefault();
        //muestro el panel que tiene la tabla
        $("#panelReporteOT").css("display", "block");
        //limpio la tabla
        $('#tablaReporteOT').DataTable().clear().draw();
        //
        if (validaDatos()) {
            traeDatosReporte();
        }
    });



    var d = new Date();
    var date = getFechaHoraFormateada(d);

    // Inicializo DataTable
    var table = $('#tablaReporteOT').DataTable({
        dom: 'Bfrtip',
        buttons: [{
                extend: 'print',
                className: 'btn btn-primary',
                text: '<i class="fa fa-print"></i>',
                title: function() {
                    return 'Reporte de Orden de Trabajo'
                },
                init: function(api, node, config) {
                    $(node).removeClass('btn-default')
                }
            },
            {
                extend: 'excel',
                className: 'btn btn-primary',
                text: '<i class="fa fa-download"></i> Excel',
                title: function() {
                    return 'Reporte de Orden de Trabajo'
                },
                init: function(api, node, config) {
                    $(node).removeClass('btn-default')
                },
                filename: function() {
                    return date + ' reporte OT';
                },
            }
        ],
        "columnDefs": [{
            "targets": [0],
            "type": "num",
        }],
        "order": [
            [0, "asc"]
        ],
    });
</script>



<!-- ******************************************************************************* -->


<style>
    .center {
        text-align: center;
    }

    .box img {
        width: 100%;
        height: auto;
    }

    @supports(object-fit: cover) {
        .box img {
            height: 100%;
            object-fit: cover;
            object-position: center center;
        }
    }
</style>
<?php $this->load->view('mapa/Modal_detalles') ?>
<?php //$this->load->view('mapa/modal_imagen') 
?>

<section class="content">

    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">


                    <h1 class="box-title">Mapa</h1>


                </div><!-- /.box-header -->
                <div class="box-body">

                    <div class="col-md-12">


                        <div id="map" class="z-depth-1-half map-container" style="height: 500px">


                            <div id="map" style="height: 100%"></div>


                        </div>
                        <input id="lat" type="hidden" value='<?php echo $gpsOT['latitud'] ?>'>
                        <input id="lon" type="hidden" value='<?php echo $gpsOT['longitud'] ?>'>

                    </div>


                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->

<script>
    // inicializo el mapa
    // var map;
    // map = new google.maps.Map(document.getElementById('map'), {
    //     center: {
    //         lat: -31.5361,
    //         lng: -68.5264
    //     },
    //     zoom: 8
    // });
    // var map = L.map('map').setView([-31.5367, -68.5257], 13); //Coordenadas y Zoom inicial
    /* Capa de mosaicos */

    var streets = L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 24, //0-24
        id: 'mapbox/streets-v11', //Mapbox Streets, Stamen, Thunderforest
        accessToken: 'pk.eyJ1IjoidGluY2hvZ2JjIiwiYSI6ImNrNTJpcndzZjE3MjYzbHRlMzl5Y3ZhOXEifQ.D9gyjKwgDRkTOJFkI-UtUw'
    });
    var satelital = L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 24, //0-24
        id: 'mapbox/satellite-streets-v11', //Mapbox Streets, Stamen, Thunderforest
        accessToken: 'pk.eyJ1IjoidGluY2hvZ2JjIiwiYSI6ImNrNTJpcndzZjE3MjYzbHRlMzl5Y3ZhOXEifQ.D9gyjKwgDRkTOJFkI-UtUw'
    });
    var map = L.map('map', {
        center: [-31.5367, -68.5257],
        zoom: 13,
        layers: [streets, satelital]
    });
    var baseMaps = {
        "Calles": streets,
        "<span style=''>Satelital</span>": satelital //el último es la capa predeterminada
    };
    var marcador = [];

    var gpsLat = $('#lat').val();
    var gpsLon = $('#lon').val();


    var marker = L.marker([gpsLat, gpsLon]).bindPopup('Forradas').addTo(map);
    // alert(gpsLat + '   ' + gpsLon);
    // var markers = [];

    // Selecciono censo para poblar mapa
    $('#censo_id').change(function() {
        //WaitingOpen();
        $(".leaflet-marker-pane, .leaflet-shadow-pane, .leaflet-popup").html('');
        var cens_id = this.value;
        renderCenso(cens_id);
    });

    // function setMapOnAll() {
    //     for (var i = 0; i < markers.length; i++) {
    //         markers[i].setMap(map);
    //     }
    //     markers = [];
    // }

    // function renderCenso(cens_id) {

    //     //  TODO: VER TECNICAS DE CLUSTERING EN GOOGLE MAPS
    //     // if (markers)
    //     //     setMapOnAll(null);          

    //     $.ajax({
    //         type: 'POST',
    //         data: {
    //             cens_id: cens_id
    //         },
    //         url: 'Mapa/getArbolesCensoId',
    //         success: function(result) {
    //             data = JSON.parse(result);

    //             if (data.puntos != null) {
    //                 for (var i = 0; i < data.puntos.length; i++) { //i  
    //                     if (typeof data.puntos[i].squares.square !== 'undefined') {
    //                         var length_i = data.puntos[i].squares.square.length;
    //                     } else {
    //                         var length_i = 0;
    //                     }

    //                     for (var j = 0; j < length_i; j++) { //j
    //                         if (typeof data.puntos[i].squares.square[j].trees.tree !== 'undefined') {
    //                             var length_j = data.puntos[i].squares.square[j].trees.tree.length;
    //                         } else {
    //                             var length_j = 0;
    //                         }

    //                         for (var k = 0; k < length_j; k++) { //k

    //                             // var marker = new google.maps.Marker({
    //                             //     position: {
    //                             //         lat: parseFloat(data.puntos[i]['squares']['square'][j][
    //                             //             'trees'
    //                             //         ][
    //                             //             'tree'
    //                             //         ][k]['lat']),
    //                             //         lng: parseFloat(data.puntos[i]['squares']['square'][j][
    //                             //             'trees'
    //                             //         ][
    //                             //             'tree'
    //                             //         ][k]['long'])
    //                             //     },
    //                             //     map: map,
    //                             //     title: 'Hello World!',
    //                             //     info_id: data.puntos[i].squares.square[j].trees.tree[k].info_id,
    //                             //     tipo: data.puntos[i].squares.square[j].trees.tree[k].name,
    //                             //     direccion: data.puntos[i].squares.square[j].trees.tree[k]
    //                             //         .street_name + ' ' + data.puntos[i].squares.square[j].trees
    //                             //         .tree[k].number
    //                             // });                                   
    //                             var info_id = data.puntos[i].squares.square[j].trees.tree[k].info_id;
    //                             var arbol_id = data.puntos[i].squares.square[j].trees.tree[k].id;
    //                             var tipo = data.puntos[i].squares.square[j].trees.tree[k].name;
    //                             var direccion = data.puntos[i].squares.square[j].trees.tree[k].street_name + ' ' + data.puntos[i].squares.square[j].trees.tree[k].number;
    //                             var lat = parseFloat(data.puntos[i]['squares']['square'][j][
    //                                 'trees'
    //                             ][
    //                                 'tree'
    //                             ][k]['lat']);
    //                             var lng = parseFloat(data.puntos[i]['squares']['square'][j][
    //                                 'trees'
    //                             ][
    //                                 'tree'
    //                             ][k]['long']);
    //                             var marker = L.marker([lat, lng]).bindPopup('<div id="content">' +
    //                                 '<div id="siteNotice">' +
    //                                 '</div>' +
    //                                 '<h4 class="firstHeading center">' + direccion +
    //                                 '</h4>' +
    //                                 '<p> Tipo: ' + tipo + '</p>' +
    //                                 '<div class="center"><button class="btn btn-info" onclick="Imagen(' + arbol_id + ')">Imagen</button> &nbsp;&nbsp;<button onclick="Detalles(' + info_id +
    //                                 ')"class="btn btn-success">Detalles</button></div>' +
    //                                 '</div>').addTo(map);
    //                         }
    //                     }
    //                 }
    //             }
    //         },

    //     })

    //     // if (markers)
    //     //     setMapOnAll();
    // }

    // var marcadores = L.layerGroup(marcador);
    // var overlayMaps = {
    //     "Marcadores": marcadores
    // };

    // L.control.layers(baseMaps, overlayMaps).addTo(map);
    L.control.layers(baseMaps).addTo(map);

    function Detalles(id) {

        $.ajax({
            type: 'POST',
            data: {
                id: id
            },
            url: 'Mapa/getDetalle',
            success: function(result) {

                $('#modal_detalles').find('.modal-body').html(result.html);
                $('#modal_detalles').modal('show');
                $('.modal-body > form').find('input, textarea, button, select').attr('disabled',
                    'disabled');
                $('#read_only').attr('disabled');
                $('.frm-save').hide();
            },
            dataType: 'json'
        })
    }

    function Imagen(id) {
        $.ajax({
            type: 'POST',
            data: {
                id: id
            },
            url: 'Mapa/getImagen',
            success: function(result) {
                var imagen = result.html.replace('dataimage/jpegbase64', 'data:image/jpeg;base64,');
                $('#modal_imagen').find('#imagen_modal').prop("src", imagen);
                $('#modal_imagen').modal('show');
            },
            dataType: 'json'
        })
    }
</script>
</body>