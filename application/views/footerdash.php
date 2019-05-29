        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.0.0
            </div>
            <strong>Copyright © 2015-<?php echo date('Y'); ?> <a href="http://trazalog.com">trazalog</a>.</strong> Todos los derechos reservados.
        </footer>

    </body>

    <script>

        var link = '';
        linkTo('almacen/Proceso');
        $('.menu .link').on('click',function(){
            link = $(this).data('link');
            linkTo();
        });

        function linkTo(uri = ''){
            if(link == '' && uri == '') return;
            $('#content').empty();
            $('#content').load('<?php base_url()?>'+(uri==''?link:uri));
            link = (uri==''?link:uri);

        }
        //Esto dispara un evento para que se cargue el Dash en forma automatica cuando ingreso.
      //  cargarView('<?php #echo $grpDash; ?>', 'index', 'View');

    </script>