<body class="skin-blue-light sidebar-mini">
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a id="dash" href="#" onClick="cargarView('<?php echo $grpDash; ?>', 'index', 'View')" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini">A<b></b>P</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>Asset</b> PLANNER <i id="conexion" class="fa fa-circle text-green"
                        data-state="true"></i></span>

            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <p class="empresa" style="color:#fff !important"><?php echo $descEmpresas; ?></p>
                <style>
                .empresa {
                    margin: 0;
                    float: left;
                    padding-left: 5px;
                    font-size: 20px;
                    line-height: 50px;
                }

                .footer{
                    display: none;
                }

                .dropdown-menu{
                    border: 2px solid #3c8dbc;
                }
                </style>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">

                        <!-- <li id="notiTareas" class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<?php base_url()?>assets/img/customers/record.png"  width = "20" height= "20"  alt="Notificaciones">
                            </a>
                        </li> -->
                        <!-- notificaciones -->
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <i class="fa fa-bell-o"></i>
                                 <span class="label label-warning cantidadNotificaciones"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header"></li> 
                            <li> 

                            <ul class="menu">
                              <!--   <li>
                                    <a href="#">
                                        <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                    </a> 
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                                        page and may cause design problems
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-users text-red"></i> 5 new members joined
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-user text-red"></i> You changed your username
                                    </a>
                                </li> -->
                            </ul>
                            </li>
                                <li class="footer"><a href="#">Ver todas</a></li> 
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            
                            <?php
                            if( $usrimag != '' ) {
                                $usrimag = 'data:image/jpg;base64,'.base64_encode($usrimag).'" ';
                            } else {
                                $usrimag = base_url()."assets/img/customers/avatar.png";
                            }
                            ?>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<?php echo $usrimag ?>" class="user-image" alt="User Image">
                                <span class="hidden-xs"><?php echo $userName; ?></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="user-body">
                                    <a href="#"><i class="fa fa-pencil"></i> Editar Perfil</a>
                                </li>
                                <li class="user-body">
                                    <?php foreach($empresas as $e){ ?>
                                    <a href="#" class="btnEmpresa" data-ui="<?php echo $e['id_empresa'] ?>">
                                        <?php
                                            if($e['tipo']==1)
                                                echo '<i class="fa fa-check"></i>';
                                            else
                                                echo '<i class="notFA"></i>';
                                            ?>
                                        <?php echo $e['descripcion'] ?>
                                    </a>
                                    <?php } ?>
                                </li>
                                <style>
                                .notFA {
                                    margin-left: 27px;
                                }

                                .navbar-nav>.user-menu>.dropdown-menu>.user-body {
                                    padding: 15px 0;
                                }

                                .navbar-nav>.user-menu>.dropdown-menu>.user-footer {
                                    padding: 10px 20px;
                                }
                                </style>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-right">
                                        <a href="#" onclick="logout()" class="btn btn-default btn-flat">Salir <i
                                                class="fa fa-fw fa-sign-out"></i></a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- <?php $this->load->view('sw') ?> -->


        <script>

var id_notificaciones = [];
        $(document).ready(function() {
            

            //cuando esta oculta la campanita
            $('.dropdown.notifications-menu').on('hidden.bs.dropdown', function () {
                    // Resetear notificacionesMostradas cuando se cierra el menú desplegable
                    $('.dropdown-menu .menu').empty();
                    // Actualizar la cantidad de notificaciones a cero
                    $('.cantidadNotificaciones').text('0');
                    // Actualizar el texto del encabezado
                    $('.dropdown-menu .header').text("No tienes notificaciones nuevas");
                    $('.dropdown-menu .footer').css('display', 'none');
                    marcarNotificacionesLeidas();
            });
          
        });

        function logout() {
            if(conexion())
            location.href = '<?php echo base_url() ?>';
            else{
                alert("Sin Conexion");
            }
        }
        
        function miTareas() {
            location.href = '<?php echo base_url() ?>Tarea';
        }

        function procesarCola() {
            if (navigator.serviceWorker.controller) {
                navigator.serviceWorker.controller.postMessage('processQueue')
            }
        }

       
        $(document).on('click', '.btnEmpresa', function() {
            var idNewEmpresa = $(this).data('ui');
            cambiarDeEmpresa(idNewEmpresa);
        });

        function cambiarDeEmpresa(idNewEmpresa) {
            console.info("id de empresa nueva: " + idNewEmpresa);

            $.ajax({
                data: {
                    idNewEmpresa: idNewEmpresa
                },
                dataType: 'json',
                type: 'POST',
                url: 'index.php/Dash/cambiarDeEmpresa',
                success: function(result) {
                    //console.table(result);
                    window.location.href = 'dash';
                },
                error: function(result) {
                    console.error("Error al cambiar de empresa");
                    console.table(result);
                },
            });
        }

        //va a la bandeja cuando clickea una notificacion
        $(document).on('click', '.notificacion-link', function() {
                event.preventDefault(); // Evita el comportamiento predeterminado del enlace
                // Ejecutar la función cargarView con el ID o cualquier otro dato necesario
                $('.dropdown-menu .menu').empty();
                // Actualizar la cantidad de notificaciones a cero
                $('.cantidadNotificaciones').text('0');
                // Actualizar el texto del encabezado
                $('.dropdown-menu .header').text("No tienes notificaciones nuevas");
                $('.dropdown-menu .footer').css('display', 'none');
                marcarNotificacionesLeidas();
                cargarView('Tarea', 'index', 'Add-Edit-Del-View-');

        });

        //va a la bandeja cuando clickea ver todos en notificaciones
        $(document).on('click', '.footer', function() {
                event.preventDefault(); // Evita el comportamiento predeterminado del enlace
                // Ejecutar la función cargarView con el ID o cualquier otro dato necesario
                $('.dropdown-menu .menu').empty();
                // Actualizar la cantidad de notificaciones a cero
                $('.cantidadNotificaciones').text('0');
                // Actualizar el texto del encabezado
                $('.dropdown-menu .header').text("No tienes notificaciones nuevas");
                $('.dropdown-menu .footer').css('display', 'none');
                marcarNotificacionesLeidas();
                cargarView('Tarea', 'index', 'Add-Edit-Del-View-');

        });

        
    // Función para obtener las notificaciones nuevas
    function obtenerNotificaciones() {
        console.log("Obteniendo notificaciones...");
        $.ajax({
            data: '',
            dataType: 'json',
            type: 'GET',
            url: 'index.php/Dash/notificaciones',
            success: function(result) {
                console.log(result);

                if (result.length > 0) {
                    result.forEach(function(notification) {
                        // Convertir la cadena JSON en un objeto JavaScript
                        id_notificaciones.push(notification.queue_id);
                        var data = JSON.parse(notification.data_json);

                        // Construir el HTML de la notificación
                        var notificationHtml = '<li><a href="#" class="notificacion-link" >' +
                            '<i class="fa fa-bell-o"></i> ' + data.notificationTitle +
                            '</a></li>';

                        // Agregar la notificación al menú
                        $('.dropdown-menu .menu').append(notificationHtml);
                    });

                    // Actualizar la cantidad de notificaciones
                    var cantidadNotificaciones = result.length;
                    $('.cantidadNotificaciones').text(cantidadNotificaciones);
                    $('.dropdown-menu .header').text("Tienes " + cantidadNotificaciones + " notificaciones nuevas");
                    $('.dropdown-menu .footer').css('display', 'block');
  
                }
                else{
                    // Resetear notificacionesMostradas cuando se cierra el menú desplegable
                    $('.dropdown-menu .menu').empty();
                    // Actualizar la cantidad de notificaciones a cero
                    $('.cantidadNotificaciones').text('0');
                    // Actualizar el texto del encabezado
                    $('.dropdown-menu .header').text("No tienes notificaciones nuevas");
                    $('.dropdown-menu .footer').css('display', 'none');
                }
            },
            error: function(result) {
                console.log(result);
            },
        });
    }


    //cambia estado de notificacion a leida para no mostrarla nuevamente
    function marcarNotificacionesLeidas(){

        $.ajax({
            data:{ 
                id_notificaciones: id_notificaciones
            },
            dataType: 'json',
            type: 'POST',
            url: 'index.php/Dash/marcarNotificacionesLeidas',
            success: function(result) {
                console.log(result);
                id_notificaciones.splice(0, id_notificaciones.length);
                debugger;
            },
            error: function(result) {
                console.log(result);
            },
        });
    }

        </script>
