<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">KPIs</h3>
                    <!--<div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
          </div>-->
                </div><!-- /.box-header -->

                <div class="box-body">

                
                    <div class="container">
                        <div class="row">
                        <form id="formKpi">
                           
                            <div class="col-md-6 col-xs-12">

                                <div class="col-md-12 col-xs-12 form-group">

                                    <div class="col-md-2 col-xs-12">
                                        <label for="grupo" >Grupo:</label>
                                    </div>

                                    <div class="col-md-6 col-xs-12">
                                        <select  id="grupo" name="grupo" class="form-control grupo">
                                            <option value="" selected disabled>Seleccione grupo</option>
                                        </select>
                                       <!--  <input class="form-control" type="text" id="checkboxGrupoID" placeholder="Ingrese grupo del equipo"> -->
                                    </div>    

                                    <div class="col-md-4 col-xs-12">
                                    </div>

                                </div>


                                <div class="col-mt-12 col-xs-12 form-group" >

                                    <div class="col-md-2 col-xs-12">
                                        <label for="sector">Sector: </label>
                                    </div>

                                    <div class="col-md-6 col-xs-12">
                                        <select  id="sector" name="sector" class="form-control sector">
                                            <option value="" selected disabled>Seleccione sector</option>
                                        </select>
                                            <!-- <input class="form-control" type="text" id="sector" placeholder="Ingrese el sector del equipo"> -->
                                    </div> 

                                    <div class="col-md-4 col-xs-12">
                                    </div>

                                </div> 

                                <div class="col-md-12 col-xs-12 form-group">

                                    <div class="col-md-2 col-xs-12">
                                        <label for="equipo" >Equipo:</label>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <select  id="equipo" name="equipo" class="form-control equipo">
                                            <option value="" selected disabled>Seleccione equipo</option>
                                        </select>
                                           <!--  <input class="form-control" type="text" id="checkboxEquipoID" placeholder="Ingrese código del equipo"> -->
                                    </div>

                                    <div class="col-md-4 col-xs-12">
                                    </div>
                                </div>

                            </div><!-- fin col-md-6 col-xs-12 -->
                     
                            <div class="col-md-6 col-xs-12">
                            <div class="col-md-6 col-xs-12 form-group">

                                <div class="col-md-4 col-xs-12">
                                    <label for="fechaDesde">Fecha Desde:</label>
                                </div>
                                <div class="col-md-2 col-xs-12">
                                        <div class="input-group date">
                                        <a class="input-group-addon" id="daterange-btn" title="Más fechas">
                                <i class="fa fa-magic"></i>
                                <span></span>
                                </a>
                                            <input class="form-control" type="date" id="datepickerDesde">
                                        </div>

                                </div>
                            </div>
                            <div class="col-md-6 col-xs-12 form-group" >

                                <div class="col-md-3 col-xs-12">
                                    <label for="fechaHasta">Fecha Hasta:</label>
                                </div>
                                <div class="col-md-9 col-xs-12">
                                        <input class="form-control" type="date" id="datepickerHasta">
                                </div>
                                </div>

                            </div><!-- fin class="col-md-6 col-xs-12"  -->

                            <div class="col-md-6 col-xs-12">
                                <div class="col-md-8 col-xs-12">
                                </div>

                                <div class="col-md-4 col-xs-12">
                                    <button type="button" class="btn btn-default"  onclick="buscar()">Filtrar</button>
                                    <button type="reset" class="btn btn-primary">Limpiar</button>
                                </div>
                                
                            </div> 
                </form>
                
                        </div><!-- fin row  -->
                    </div>  <!--  fin container -->

               
<br>

                    <div class="row">
                        <div class="col-md-6 col-xs-12">
                            <!-- class="daterange"-->
                            <?php //$disponibilidad = calcularDisponibilidad('all');
                            /*
                            echo "<pre>";
                            //echo json_encode($disponibilidad["porcentajeHorasOperativas"]);
                            print_r ($disponibilidad);
                            echo "</pre>";
                            */
                            ?>                       
                            <h4>
                                <center>Disponibilidad [%]</center>
                            </h4>
                            <!--  <div data-disponibilidad="">
                                <div class="row">
                                    <div class="col-md-5 col-xs-12">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="radioDisponibilidad"
                                                    id="radioDisponibilidadAll" value="all" checked>
                                                Todos los equipos.
                                            </label>
                                        </div>
                                    </div>
                                     <div class="col-md-7 col-xs-12">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="radioDisponibilidad"
                                                    id="radioDisponibilidadEquipo" value="">
                                                <input type="text" class="form-control" id="checkboxEquipoID"
                                                    name="checkboxEquipoID" placeholder="Ingrese código de equipo"
                                                    value="">
                                            </label>
                                        </div></div>
                                </div>
                            </div>-->
                            <div class="row">
                                <div class="col-md-12 col-xs-12">     
                                    <div style="padding: 0px 0px 0px 5px;">
                                    <strong>[%] </strong>
                                    </div>                                    
                                </div>
                            </div>
                            <div id="graph-container">
                                <canvas id="miGrafico"></canvas>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-xs-12">     
                                    <div style="padding:  0px 0px 0px 15px;">
                                        <strong id="metastrong"> </strong>
                                    </div>                                    
                                </div>
                            </div>

                           
                        </div>

                        <div class="col-md-3 col-xs-12 daterange">
                            <h4>
                                <center>Mantenimiento [%]</center>
                            </h4>
                            <div class="form-inline">
                                <!--<label>Rango de fechas: </label>
                  <input type="text" id="daterange-mantenimiento" class="form-control">
                  <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>-->
                            </div>
                            <div class="graph-container-1" style="width:100%; max-width: 250px; margin:0 auto 20px;">
                                <canvas id="graficoMantenimiento"></canvas>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-12 daterange">
                            <h4>
                                <center>Equipos Operativos [%]</center>
                            </h4>
                            <div class="graph-container-2" style="width:100%; max-width: 250px; margin:0 auto 20px;">
                                <canvas id="graficoEquiposOperativos"></canvas>
                            </div>
                        </div>

                        <div class="col-md-6 col-xs-12" >
                            
                            <h4>
                                <center>MTBF</center>
                            </h4>
                            <div class="row">
                                <div class="col-md-12 col-xs-12">     
                                    <div style="padding: 0px 0px 0px 5px;">
                                    <strong>[Hs] </strong>
                                    </div>                                    
                                </div>
                            </div>
                            <div id="graph-containerMtbf">
                                <canvas id="miGraficoMtbf"></canvas>
                            </div>
                             
                           
                        </div>

                        <div class="col-md-6 col-xs-12">
                            
                            <h4><center>MTTR</center></h4>
                            <div class="row">
                                <div class="col-md-12 col-xs-12">     
                                    <div style="padding: 0px 0px 0px 5px;">
                                        <strong>[Hs] </strong>
                                    </div>                                    
                                </div>
                            </div>
                            <div id="graph-containerMttr">
                                <canvas id="miGraficoMttr"></canvas>
                            </div>
                         
                        </div>

                        <div class="col-md-6 col-xs-12">
                            
                            <h4><center>MTTF</center></h4>
                            <div class="row">
                                <div class="col-md-12 col-xs-12">     
                                    <div style="padding: 0px 0px 0px 5px;">
                                        <strong>[Hs] </strong>
                                    </div>                                    
                                </div>
                            </div>
                            <div id="graph-containerMttf">
                            <canvas id="miGraficoMttf"></canvas>
                            </div>
                            
                        </div>

                        <div class="col-md-6 col-xs-12">
                            
                            <h4><center>Indice de Confiabilidad</center></h4>
                            <div class="row">
                                <div class="col-md-12 col-xs-12">     
                                    <div style="padding: 0px 0px 0px 5px;">
                                        <strong>[%] </strong>
                                    </div>                                    
                                </div>
                            </div>
                            <div id="graph-containerConfiabilidad">
                            <canvas id="miGraficoConfiabilidad"></canvas>
                            </div>
                           
                        </div>

                    </div><!-- /.row -->
                </div>

            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->


<?php
  $kpiot = cantTipoOrdenTrabajo();

  $equipoOperativo = sacarEquiposOperativos();
?>

<style type="text/css">
.daterange {
    position: relative;
    margin-bottom:5%;
}

.daterange i {
    position: relative;
    right: 24px;
    cursor: pointer;
}
</style>

<script>



/* buscador fechas-grupo-sector-equipo*/
function buscar()
{
  
  var fechaDesde =  $('#datepickerDesde').val();
  var fechaHasta =  $('#datepickerHasta').val();
  var idEquipo = $('#equipo').val();
  var iGrupo = $('#grupo').val();
  var idSector = $('#sector').val();

  if((idEquipo == null) || (idEquipo == "") )
  {
    alert("Seleccione algun equipo");
    return;
  }

  if(fechaDesde == "")
  {
    alert("Seleccione fecha desde");
    return;
  }

  if(fechaHasta == "")
  {
    alert("Seleccione fecha hasta");
    return;
  }
  WaitingOpen("Obteniendo datos de disponibilidad...");

  getDisponibilidad();

  //debugger;
}

/* obtengo datos de disponibilidad */
var idEquipo = 'all';

getDisponibilidad(idEquipo);

/* Obtener datos de disponibilidad para graficos KPI */
function getDisponibilidad(idEquipo) {
    //WaitingOpen("Obteniendo datos de disponibilidad...");
    if($('#equipo').val())  {idEquipo= $('#equipo').val()}
    //if($('#sector').val())  { var idSector= $('#sector').val()}
    
    $.ajax({
            data: {
                'fecha_desde':$('#datepickerDesde').val(),
                'fecha_hasta':$('#datepickerHasta').val(),
                'id_grupo': $('#grupo').val(),
                'id_sector': $('#sector').val(),
                'id_equipo': idEquipo
            }, 
            dataType: 'json',
            type: 'POST',
            url: 'index.php/Kpi/disponibilidadKpi',
        })
        .done((data) => {
            WaitingClose();
            console.log(data);
            graficarParametroMttf(data);
            graficarParametro(data);
            graficarParametroConfiabilidad(data);
            graficarParametroMttr(data);
            graficarParametroMtbf(data);
        })
        .fail(() => alert("Error al traer datos de Disponibilidad."))

}

//disponibilidad anterior
/* function getDisponibilidad(idEquipo) {
    //WaitingOpen("Obteniendo datos de disponibilidad...");
    $.ajax({
            data: {
                idEquipo: idEquipo
            },
            dataType: 'json',
            type: 'POST',
            url: 'index.php/Kpi/kpiDisponibilidad',
        })
        .done((data) => {
            graficarParametro(data);
        })
        .fail(() => alert("Error al traer datos de Disponibilidad."))
       
} */

/* grafico KPI de Disponibilidad*/
function graficarParametro(disponibilidad) {
    //elimino grafico anterior si existe
    $('#miGrafico').remove();
    $('#graph-container').html('<canvas id="miGrafico" style="width: 100%; margin:0 auto"></canvas>');
    

    var ctx = document.getElementById("miGrafico");
    //var ctx = canvas.getContext("2d");

    /* plugin linea meta  */
    var horizonalLinePlugin = {
        afterDraw: function(chartInstance) {
            var yScale = chartInstance.scales["y-axis-0"];
            var canvas = chartInstance.chart;
            var ctx = canvas.ctx;
            var index;
            var line;
            var style;

            if (chartInstance.options.horizontalLine) {
                for (index = 0; index < chartInstance.options.horizontalLine.length; index++) {
                    line = chartInstance.options.horizontalLine[index];

                    if (!line.style) {
                        style = "#86888e";
                    } else {
                        style = line.style;
                    }

                    if (line.y) {
                        yValue = yScale.getPixelForValue(line.y);
                    } else {
                        yValue = 0;
                    }

                    ctx.lineWidth = 2;

                    if (yValue) {
                        ctx.beginPath();
                        ctx.moveTo(0, yValue);
                        ctx.lineTo(canvas.width, yValue);
                        ctx.strokeStyle = style;
                        ctx.stroke();
                    }

                    if (line.text) {
                        ctx.fillStyle = style;
                        ctx.fillText(line.text, 0, yValue + ctx.lineWidth);
                    }
                }
                return;
            };
        }
    };
    Chart.pluginService.register(horizonalLinePlugin);
    var promedioMetas =disponibilidad['promedioMetas'];
    if(promedioMetas == 0){
        $('#metastrong').html('En este periodo no existen metas');
    }else{
        $('#metastrong').html('Meta: '+promedioMetas+'%');
    }
    var porcentajeHorasOperativas = [disponibilidad['promedioMetas']].concat(disponibilidad["porcentajeHorasOperativas"]);
    //var porcentajeHorasOperativas = disponibilidad.porcentajeHorasOperativas;
    var tiempo = ["meta"].concat(disponibilidad["tiempo"]);
    //var tiempo = disponibilidad.tiempo;

    //var colors = ["#00A65A"];
    var colors = [];
    for (let i = 0; i < tiempo.length; i++) colors.push('#81B5D4');
        
    

    var data = {
        labels: tiempo,
        //['Meta', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        datasets: [{
            backgroundColor: colors,
            data: porcentajeHorasOperativas,
           // data:[80, 66, 70, 71, 75, 81, 77, 78, 77, 82, 81, 78, 80],
           // fill: false,
            //label: ['Meta 80%'],
            lineTension: 0.2,
            pointRadius: 2,
            pointHitRadius: 10,
            spanGaps: false,
        }],
    };

    var miGrafico = new Chart(ctx, {
        
        type: 'bar',
        data: data,
        options: {
            legend: {
                position: 'bottom',
            },
            "horizontalLine": [{
                "y": disponibilidad['promedioMetas'],
                "style": "#ffa031",
                "text": promedioMetas
            }],
            
            responsive: true,
            maintainAspectRatio: true,
            scales: {
                yAxes: [{
                    display: true, 
                    ticks: {
                        max: 100,
                        min:0,
                        beginAtZero:true,
                    }
                }]                
            },
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //get the current items value
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue + "%";
                    }
                }
            }
        }
    });
}


$("#sector").change(function(){
      var idSector = $("#sector").val();
      getEquiSectorGrupo();
});

$("#grupo").change(function(){
      var idGrupo = $("#grupo").val();
      getEquiSectorGrupo();
});


/* trae los grupos */
var dataGrupos = function() {
    $.ajax({
        'async': false,
        'type': "POST",
        'global': false,
        'dataType': 'json',
        'url': "index.php/Kpi/getGruposxEmpresa",
        'success': function(data) {
            if(data){
                var opcion = "<option value=''>Todos</option>" ;
                $('#grupo').append(opcion);
                for (var i = 0; i < data.length; i++) {
                var nombre = data[i]['descripcion'];
                var opcion = "<option value='"+data[i]['id_grupo']+"'>" +nombre+ "</option>" ; 
                $('#grupo').append(opcion);  
        }
        }
        },
        'error': function(result){
            console.log(result);
          },
    });
}();


/*    trae equipos de sector y/o grupos */
  function getEquiSectorGrupo(){
    var id_grupo =  $("#grupo").val();
    var id_sector =  $("#sector").val();
    $("#equipo").html("");
    $.ajax({
      'data' : {id_sector : id_sector, 
                id_grupo : id_grupo
                },
      'async': true,
      'type': "POST",
      'global': false,
      'dataType': 'json',
      'url': "index.php/Kpi/getEquiposxGrupoSector",
      'success': function (data) {
        //console.table(data);
        if(data){
            var opcion = "<option value='all'>Todos</option>" ;
            $('#equipo').append(opcion);
            for (var i = 0; i < data.length; i++) {
            var nombre = data[i]['descripcion'];
            var opcion = "<option value='"+data[i]['id_equipo']+"'>" +nombre+ "</option>" ; 
            $('#equipo').append(opcion);  
          }
        }
      },
      'error' : function(data){
        console.log('Error en getEquiSector');
        console.table(data);
    },
});
  }

/* trae los sectores */
var dataSectores = function() {
    
    $.ajax({
        'async': false,
        'type': "POST",
        'global': false,
        'dataType': 'json',
        'url': "index.php/Kpi/getSectoresxEmpresa",
        'success': function(data) {
            if(data){
                var opcion = "<option value=''>Todos</option>" ;
                $('#sector').append(opcion);
                for (var i = 0; i < data.length; i++) {
                var nombre = data[i]['descripcion'];
                var opcion = "<option value='"+data[i]['id_sector']+"'>" +nombre+ "</option>" ; 
                $('#sector').append(opcion);  
            }
        }
        },
        'error': function(result){
            console.log(result);
          },
    });
}();


graficarMantenimiento();

/* grafico KPI de Mantenimiento*/
function graficarMantenimiento() {
 //   WaitingOpen("Obteniendo datos de Mantenimiento...");
    var areaChartCanvas = document.getElementById("graficoMantenimiento");

    var myChart = new Chart(areaChartCanvas, {
                type: 'doughnut',
                data: {
                    <?php
            echo "labels: [";

            foreach ($kpiot as $key => $o) {
              echo "\"$o->descripcion\",";
            }
           
           echo "],datasets: [{
                data: [";
                foreach ($kpiot as $key => $o) {
                  echo $o->cantidad.",";
                }
           echo "]" 
            ?>,
                    backgroundColor: [
                        "#dd1100",
                        "#00CC00",
                        "#006612",
                        "#009933",
                        "#fad61d"
                    ]
                    // hoverBackgroundColor: [
                    //     "#f3fa1d",
                    //     "#ee2211",
                    //     "#117723",
                    //     "#11aa44",
                    //     "#11dd11"
                    // ]
                }]
        },
        options: {
         //   cutoutPercentage: 40,
            legend: {
                position: 'bottom',
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //calculate the total of this data set
                        var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
                            return previousValue + currentValue;
                        });
                        //get the current items value
                        var currentValue = dataset.data[tooltipItem.index];
                        //calculate the precentage based on the total and current item, also this does a rough rounding to give a whole number
                        var precentage = Math.floor(((currentValue / total) * 100) + 0.5);

                        return currentValue + " (" + precentage + "%)";
                    }
                }
            }
        }
});
//WaitingClose();
}



graficarEquiposOperativos();
/* grafico KPI Equipos Operativos */
function graficarEquiposOperativos() {
   // WaitingOpen("Obteniendo datos de Equipos Operativos...");
    var areaChartCanvas = document.getElementById("graficoEquiposOperativos");

    var myChart = new Chart(areaChartCanvas, {
        type: 'doughnut',
        data: {
            labels: ["Activos", "En Reparación"],
            datasets: [{
                data: [<?php echo $kpi['eqActivos'] ?>,
                    <?php echo $kpi['eqReparacion'] ?>
                ],

                backgroundColor: [
                    "#008d4c",
                    "#FF9600"
                ],
                hoverBackgroundColor: [
                    "#00a65a",
                    "#ffa711"
                ]
            }]
        },
        options: {
            cutoutPercentage: 40,
            legend: {
                position: 'bottom',
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //calculate the total of this data set
                        var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex,
                            array) {
                            return previousValue + currentValue;
                        });
                        //get the current items value
                        var currentValue = dataset.data[tooltipItem.index];
                        //calculate the precentage based on the total and current item, also this does a rough rounding to give a whole number
                        var precentage = Math.floor(((currentValue / total) * 100) + 0.5);

                        return currentValue + " (" + precentage + "%)";
                    }
                }
            }
        }
    });
   // WaitingClose();
}


fechaMagic();

// config de daterangepicker
function fechaMagic() {
    
    $('#daterange-btn').daterangepicker({
        ranges: {
          'Hoy': [moment(), moment()],
          'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Últimos 7 días': [moment().subtract(6, 'days'), moment()],
          'Últimos 30 días': [moment().subtract(29, 'days'), moment()],
          'Este mes': [moment().startOf('month'), moment().endOf('month')],
          'Último mes': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate: moment()
      },
      function(start, end) {
        $('#datepickerDesde').val(start.format('YYYY-MM-DD'));
        $('#datepickerHasta').val(end.format('YYYY-MM-DD'));
      }
    );
  }

/* grafico KPI de Mttf*/
  function graficarParametroMttf(disponibilidad) {
    //debugger;
    //elimino grafico anterior si existe
    $('#miGraficoMttf').remove();
    $('#graph-containerMttf').html('<canvas id="miGraficoMttf"></canvas>');

    var ctx = document.getElementById("miGraficoMttf");
    
    var dataMttf = disponibilidad.mttf;
    //var porcentajeHorasOperativas = [disponibilidad.promedioMetas].concat(disponibilidad.porcentajeHorasOperativas);
    //var tiempo = ["meta"].concat(disponibilidad.tiempo);
    var tiempo = disponibilidad.tiempo;

    var colors = [];
    for (let i = 0; i < tiempo.length; i++) colors.push('#4682B4');

    var data = {
        labels: tiempo,
        datasets: [{
            backgroundColor: colors,
            data: dataMttf,
            label: ''/* ['Meta'].concat(disponibilidad.promedioMetas) */,
            lineTension: 0.2,
            pointRadius: 2,
            pointHitRadius: 10,
            spanGaps: false,
        }],
    };
   
   
    var miGraficoMttf = new Chart(ctx, {
        type: 'bar',
        data: data,
        //data:[80, 66, 70, 71, 75, 81, 77, 78, 77, 82, 81, 78, 80],
        options: {
            legend: {
                position: 'bottom',
                backgroundColor: 'blue',
            },
             /* linea meta */
           /* "horizontalLine": [{
                "y": disponibilidad.promedioMetas,
                "style": "#00CC00",
                "text": "meta " + disponibilidad.promedioMetas + 'hs     ',
            }],*/
            responsive: true,
            maintainAspectRatio: true,
             scales: {
                yAxes: [{
                    ticks: {
                        //min:100, // Valor mínimo del eje Y
                        min: 0, // Valor máximo del eje Y
                        //stepSize: 10 // Incremento entre los valores del eje Y
                        // max:100,
                        beginAtZero:true, 
                    }
                }]
            }, 
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //get the current items value
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue;
                    }
                }
            }
        }
    });
   
}

/* grafico KPI de Confiabilidad*/
function graficarParametroConfiabilidad(disponibilidad) {
    //debugger;
    //elimino grafico anterior si existe
    $('#miGraficoConfiabilidad').remove();
    $('#graph-containerConfiabilidad').html('<canvas id="miGraficoConfiabilidad"></canvas>');

    var ctx = document.getElementById("miGraficoConfiabilidad");
   
    var porcentajeHorasOperativas = disponibilidad.confiabilidad;
 
    var tiempo = disponibilidad.tiempo;
    var data = {
        labels: tiempo,
        datasets: [{
            //backgroundColor: colors,
            data: porcentajeHorasOperativas,
            label: '',
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1

        }],
    };
   
    var miGraficoConfiabilidad = new Chart(ctx, {
        type: 'line',
        data: data,
        options: {
            legend: {
                position: 'bottom',
            },
          
            responsive: true,
            maintainAspectRatio: true,
             scales: {
                yAxes: [{
                    ticks: {
                        min:0, // Valor mínimo del eje Y
                        beginAtZero:true, 

                    }
                }]
            }, 
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //get the current items value
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue;
                    }
                }
            }
        }
    });
   
}

/* grafico KPI de Mtbf*/
function graficarParametroMtbf(disponibilidad) {
    //debugger;
    //elimino grafico anterior si existe
    $('#miGraficoMtbf').remove();
    $('#graph-containerMtbf').html('<canvas id="miGraficoMtbf"></canvas>');

    var ctx = document.getElementById("miGraficoMtbf");
    var horasmtbf = disponibilidad.mtbf;  
    var hmtbf = '';
    var tiempo = disponibilidad.tiempo;
    /*console.log(horasmtbf);
    for(var i=0; i < horasmtbf.length; i++){
        hmtbf[i] = (horasmtbf[i]/100);
    }      
    console.log(hmtbf);
    console.log(tiempo);*/

    var colors = [];
    //#75aa31
    for (let i = 0; i < tiempo.length; i++) colors.push('#008d4c');
    //console.log(colors);
    var data = {
        labels: tiempo,
        datasets: [{
            backgroundColor: colors,
            data: horasmtbf,
            label: ''/* ['Meta'].concat(disponibilidad.promedioMetas) */,
            lineTension: 0.2,
            pointRadius: 2,
            pointHitRadius: 1,
            spanGaps: false,
        }],
    };
   
    var miGraficoMtbf = new Chart(ctx, {
        type: 'bar',
        data: data,
        //data:[1000, 2000, 3000, 7100, 7500, 8100, 7700, 7800, 7700, 8200, 8100, 7800, 8000],
        options: {
            legend: {
                position: 'bottom',
                backgroundColor: 'blue',
            },
            /*"horizontalLine": [{
                "y": disponibilidad.promedioMetas,
                //"style": "#00A65A",
                "style": "#ffa031",
                "text": "meta " + disponibilidad.promedioMetas  + 'hs     ',
            }],*/
            responsive: true,
            maintainAspectRatio: true,
             scales: {
                yAxes: [{
                    ticks: {
                        //min:0, // Valor mínimo del eje Y
                        //max: 0, // Valor máximo del eje Y
                        //stepSize: 100 // Incremento entre los valores del eje Y
                         max:1000,
                        beginAtZero:true, 
                    }
                }]
            }, 
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //get the current items value
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue;
                    }
                }
            }
        }
    });
}


/* grafico KPI de Mttr*/
function graficarParametroMttr(disponibilidad) {
    //debugger;
    //elimino grafico anterior si existe
    $('#miGraficoMttr').remove();
    $('#graph-containerMttr').html('<canvas id="miGraficoMttr"></canvas>');

    var ctx = document.getElementById("miGraficoMttr");
    
    var horasMttr = disponibilidad.mttr;
    //var porcentajeHorasOperativas = [disponibilidad.promedioMetas].concat(disponibilidad.porcentajeHorasOperativas);
    //var tiempo = ["meta"].concat(disponibilidad.tiempo);
    var tiempo = disponibilidad.tiempo;

    var colors = [];
    for (let i = 0; i < tiempo.length; i++) colors.push('#ffa031');

    var data = {
        labels: tiempo,
        datasets: [{
            backgroundColor: colors,
            data: horasMttr,
            label: ''/* ['Meta'].concat(disponibilidad.promedioMetas) */,
            lineTension: 0.2,
            pointRadius: 2,
            pointHitRadius: 10,
            spanGaps: false,
        }],
    };
   
    var miGraficoMttr = new Chart(ctx, {
        type: 'bar',
        data: data,
        //data:[80, 66, 70, 71, 75, 81, 77, 78, 77, 82, 81, 78, 80],
        options: {
            legend: {
                position: 'bottom',
                backgroundColor: 'blue',
            },
           /* "horizontalLine": [{
                "y": disponibilidad.promedioMetas,
                "style": "#008d4c",
                "text": "meta " + disponibilidad.promedioMetas + 'hs     ',
            }],*/
            responsive: true,
            maintainAspectRatio: true,
             scales: {
                yAxes: [{
                    ticks: {
                        min:0, // Valor mínimo del eje Y
                        //max: 0, // Valor máximo del eje Y
                        //stepSize: 10 // Incremento entre los valores del eje Y
                        /* max:100,*/
                        beginAtZero:true, 
                    }
                }]
            }, 
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //get the current items value
                        var currentValue = dataset.data[tooltipItem.index];
                        return currentValue;
                    }
                }
            }
        }
    });
   
}


</script>