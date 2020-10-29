<div id="filtros" class="row">
    <?php if (!isset($panelReporte)) {?>
        <?php foreach ($filtro as $key => $o) { ?>
        <div class="col-md-12">
            <div class="form-group">
                <label class="text-withe"for=""><?php echo ucfirst($key)?>:</label>
                <input list="<?php echo $key ?>" id="flt-<?php echo $key ?>" onchange="filtroSelect()"
                    class="form-control" placeholder="- Seleccionar -" autocomplete="off">
                <datalist id="<?php echo $key ?>">
                    <?php
                    foreach ($o as $opt) {
                        echo "<option>$opt->descripcion</option>";
                    }
                    ?>
                </datalist>
                <a href='#' class='flt-clear pull-right text-red'><small><i class='fa fa-times '></i> Limpiar </small></a>
            </div>
        </div>
        <?php } ?>
    <?php }else { ?>
        <form id="formulario">
            <?php foreach ($filtro as $key => $o) { ?>
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="text-withe"for=""><?php echo ucfirst($key)?>:</label>
                        <input list="<?php echo $key ?>" id="flt-<?php echo $key ?>" name="<?php echo $key ?>" onchange="filtroSelect()"
                            class="form-control" placeholder="- Seleccionar -" autocomplete="off">
                        <datalist id="<?php echo $key ?>">
                            <?php
                            foreach ($o as $opt) {
                                echo "<option value='$opt->descripcion'>$opt->descripcion</option>";
                            }
                            ?>
                        </datalist>
                        <a href='#' class='flt-clear pull-right text-red'><small><i class='fa fa-times'></i> Limpiar </small></a>
                    </div>
                </div>
            <?php } ?>
            
            <!--calendario desde-->
            <div class="col-md-12">
                <div class="form-group">
                    <label>Desde:</label>
                    <div class="input-group date">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right datepicker" id="datepickerDesde" name="datepickerDesde" placeholder="Seleccione fecha">
                    </div>
                    <a href='#' class='flt-clear pull-right text-red'><small><i class='fa fa-times'></i> Limpiar </small></a>
                    <!-- /.input group -->
                </div>
            </div>

            <!--calendario hasta-->
            <div class="form-group col-md-12">
                <label>Hasta:</label>
                <div class="input-group date">
                    <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" class="form-control pull-right datepicker" id="datepickerHasta" name="datepickerHasta" placeholder="Seleccione fecha">
                </div>
                <a href='#' class='flt-clear pull-right text-red'><small><i class='fa fa-times'></i> Limpiar </small></a>
                <!-- /.input group -->
            </div>

            <?php if (isset($desde) && $desde) { ?>
                        <div class="form-group">
                            <label for='flt-desde'><?php echo $numero ?> desde:</label>
                            <input id='flt-desde' name="desde" placeholder='Ingrese valor' class='form-control'>
                        </div>
                    <?php } ?>
                    <?php if (isset($hasta) && $hasta) { ?>
                        <div class="form-group">
                            <label for='flt-hasta'><?php echo $numero ?> hasta:</label>
                            <input id='flt-hasta' name="hasta" placeholder='Ingrese valor' class='form-control'>
                        </div>
                    <?php } ?>
                    <?php if (isset($calendarioDesde) && $calendarioDesde) { ?>
                        <div class="form-group">
                            <label for="datepickerDesde">Fecha desde:</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right datepicker" id="datepickerDesde" name="datepickerDesde" placeholder="Seleccione fecha">
                            </div>
                        </div>
                    <?php } ?>
                    <?php if (isset($calendarioHasta) && $calendarioHasta) { ?>
                        <div class="form-group">
                            <label for="datepickerHasta">Fecha hasta:</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right datepicker" id="datepickerHasta" name="datepickerHasta" placeholder="Seleccione fecha">
                            </div>
                        </div>
                    <?php } ?>
                    <br>


            <div class="form-group" style="padding: 20px">
                <button type="button" value="Filtrar" class="btn btn-block btn-success btn-flat" onclick="filtrar()">Filtrar</button>
                <input type="hidden" value="<?php echo $op ?>" id="op" name="op" hidden="true">
            </div>
        </form>
    <?php } ?>
</div>

<script>
function filtroSelect() {
    $('#calendar').fullCalendar('rerenderEvents');
}

$('.flt-clear').click(function(){
    $(this).closest('.form-group').find('input').val('');
    filtroSelect();
});

</script>

<!-- script para cargar el calendario-->
<script src="<?php echo base_url() ?>application/views/header.php"></script>


<!--script para refrescar los datos filtrados-->
<script>    

    // $('.flt-clear').click(function() {
    //     $('#formulario')[0].reset();
    // });

    $('.datepicker').datepicker({
        autoclose: true
    })

    function filtrar() {
        debugger;
        var data = new FormData($('#formulario')[0]);
        // var data = $('#formulario')[0].serialize();
        console.table(data);
        data = formToObject(data);
        console.table(data);
        //wo();
        var url = $('#op').val();
        $.ajax({
            type: 'POST',

            data: {
                data
            },
            url: 'Reportes/' + url,
            success: function(result) {
                console.log(result);
                $('#reportContent').empty();
                $('#reportContent').html(result);
            },
            error: function() {
                alert('Error');
            },
            complete: function(data) {
                //wc();
            }
        });
    }
</script>