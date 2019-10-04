<div id="filtros" class="row">
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
            <a href='#' class='flt-clear pull-right text-red'><small><i class='fa fa-times'></i> Limpiar </small></a>
        </div>

    </div>
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