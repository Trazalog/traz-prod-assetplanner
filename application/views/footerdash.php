        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.0.0
            </div>
            <strong>Copyright © 2015-<?php echo date('Y'); ?> <a href="http://trazalog.com">trazalog</a>.</strong> Todos
            los derechos reservados.
        </footer>


        <?php
            $this->load->view('panelDerecho');
        ?>


        </body>

        <!--Arma Tablas -->
        <script src="<?php echo base_url('lib/tabla.js'); ?>"></script>
        <script>
var link = '';

$('.menu .link').on('click', function() {
    link = $(this).data('link');
    linkTo();
});

function linkTo(uri = '') {
    if (link == '' && uri == '') return;
    $('#content').empty();
    $('#content').load('<?php base_url()?>' + (uri == '' ? link : uri));
    link = (uri == '' ? link : uri);

}

function collapse(e) {
    e = $(e).closest('.box');

    if (e.hasClass('collapsed-box')) {
        $(e).removeClass('collapsed-box');
    } else {
        $(e).addClass('collapsed-box');
    }

}

linkTo('<?php echo $grpDash; ?>/index/View');
</script>



        <script>
function estado(e) {
    switch (e) {
        case 'AC':
            return '<span data-toggle="tooltip" title="" class="badge bg-green estado">Activo</span>';
            break;
        case 'RE':
            return '<span data-toggle="tooltip" title="" class="badge bg-yellow estado">Reparación</span>';
            break;
        case 'AL':
            return '<span data-toggle="tooltip" title="" class="badge bg-blue estado">Alta</span>';
            break;
        case 'IN':
            return '<span data-toggle="tooltip" title="" class="badge bg-red estado">Inhabilitado</span>';
            break;
        default:
            return '<span data-toggle="tooltip" title="" class="badge bg-gray estado">S/E</span>';
            break;
    }
}
        </script>

        <?php
$this->load->view(FRM . 'scripts');

?>