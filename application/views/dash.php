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
                </style>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">

                        <li id="notiTareas" class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<?php base_url()?>assets/img/customers/record.png"  width = "20" height= "20"  alt="Notificaciones">
                            </a>
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

        $(document).ready(function(){
            $("#notiTareas").css('visibility','hidden');
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
        </script>