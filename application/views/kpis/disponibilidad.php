<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">KPIs</h3>

                </div><!-- /.box-header -->

                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">

                            <h4>
                                <center>Disponibilidad [%]</center>
                            </h4>

                            <div data-disponibilidad="">
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
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-inline">

                            </div>
                            <div id="graph-container">

                            </div>
                        </div>

                    </div><!-- /.row -->
                </div>

            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->


<style type="text/css">
.daterange {
    position: relative;
}

.daterange i {
    position: relative;
    right: 24px;
    cursor: pointer;
}
</style>

<script>
/* obtengo datos de disponibilidad */
var idEquipo = 'all';
getDisponibilidad(idEquipo);

function getDisponibilidad(idEquipo) {
    //WaitingOpen("Obteniendo datos de disponibilidad...");
    $.ajax({
            data: {
                idEquipo
            },
            dataType: 'json',
            type: 'POST',
            url: 'index.php/Test/kpiDisponibilidad',
        })
        .done((data) => {
            graficarParametro(data);
        })
        .fail(() => alert("Error al traer datos de Disponibilidad."))

}

/* grafico KPI de Disponibilidad*/
function graficarParametro(disponibilidad) {
    //elimino grafico anterior si existe
    $('#miGrafico').remove();
    $('#graph-container').append('<canvas id="miGrafico" style="width: 100%; margin:0 auto"></canvas>');

    var ctx = document.getElementById("miGrafico");
    //var ctx = canvas.getContext("2d");

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
    var porcentajeHorasOperativas = [disponibilidad['promedioMetas']].concat(disponibilidad[
        "porcentajeHorasOperativas"]);
    var tiempo = ["meta"].concat(disponibilidad["tiempo"]);

    var colors = ["#00A65A"];
    for (let i = 1; i < tiempo.length; i++) colors.push('#81B5D4');

    var data = {
        labels: tiempo,
        datasets: [{
            backgroundColor: colors,
            data: porcentajeHorasOperativas,
            label: ['Meta'],
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
            "horizontalLine": [{
                "y": disponibilidad['promedioMetas'],
                "style": "#00A65A",
                "text": "meta"
            }],

            responsive: true,
            maintainAspectRatio: true,
            scales: {
                yAxes: [{
                    ticks: {
                        //max: 100,
                        //beginAtZero:true,
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

$('#checkboxEquipoID').focusin(function() {
    //console.log('Equipos');
    $(this).prev().prop("checked", true);
});
$('#radioDisponibilidadAll').focusin(function() {
    //console.log('Todos');
    getDisponibilidad('all');
});

// autocomplete para codigo
var dataEquipos = function() {
    var tmp = null;
    $.ajax({
        'async': false,
        'type': "POST",
        'global': false,
        'dataType': 'json',
        'url': "index.php/Otrabajo/getEquipoDisponibilidad",
        'success': function(data) {
            tmp = data;
        }
    });
    return tmp;
}();
$("#checkboxEquipoID").autocomplete({
    source: dataEquipos,
    delay: 500,
    minLength: 1,
    focus: function(event, ui) {
        event.preventDefault();
        $(this).val(ui.item.label);
    },
    select: function(event, ui) {
        event.preventDefault();
        $(this).val(ui.item.label); //value

        getDisponibilidad(ui.item.value);
    },
});
</script>