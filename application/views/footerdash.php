        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.0.0
            </div>
            <strong>Copyright © 2015-<?php echo date('Y'); ?> <a href="http://trazalog.com">trazalog</a>.</strong> Todos
            los derechos reservados.
        </footer>

        </body>

        <!--Arma Tablas -->
        <script src="<?php echo base_url('lib/tabla.js'); ?>"></script>
        <script>
var link = '';

var linkAnt = '';

$('.menu .link').on('click', function() {
    linkAnt = link;
    link = $(this).data('link');
    linkTo();
});

function linkTo(uri = '') {
    if (link == '' && uri == '') return;
    $('#content').empty();
    $('#content').load('<?php base_url()?>' + (uri == '' ? link : uri));
    linkAnt = link;
    link = (uri == '' ? link : uri);

}

function back() {
    linkTo(linkAnt);
}

function newDate(db = false) {
    var d = new Date();

    if (db) {
         return d.getFullYear() + "-" + ("0" + (d.getMonth() + 1)).slice(-2) + "-" + ("0" + d.getDate()).slice(-2) +
            " " + ("0" + d.getHours()).slice(-2) + ":" + ("0" + d.getMinutes()).slice(-2);
    } else {
      
         return datestring = ("0" + d.getDate()).slice(-2) + "-" + ("0" + (d.getMonth() + 1)).slice(-2) + "-" +
            d.getFullYear() + " " + ("0" + d.getHours()).slice(-2) + ":" + ("0" + d.getMinutes()).slice(-2);
    }
}

function collapse(e) {
    e = $(e).closest('.box');

    if (e.hasClass('collapsed-box')) {
        $(e).removeClass('collapsed-box');
    } else {
        $(e).addClass('collapsed-box');
    }

}
//Esto dispara un evento para que se cargue el Dash en forma automatica cuando ingreso.
cargarView('<?php echo $grpDash; ?>', 'index', 'View');
        </script>