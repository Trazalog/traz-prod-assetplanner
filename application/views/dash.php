<body class="skin-blue-light sidebar-mini">
    <div class="wrapper">

        <header class="main-header" style=''>
            <!-- Logo -->
            <a href="#" onClick="cargarView('<?php echo $grpDash; ?>', 'index', 'View')" class="logo" style="background: -moz-linear-gradient(45deg, rgba(60,148,201,1) 0%, rgba(70,170,232,1) 100%); /* ff3.6+ */
background: -webkit-gradient(linear, left bottom, right top, color-stop(0%, rgba(60,148,201,1)), color-stop(100%, rgba(70,170,232,1))); /* safari4+,chrome */
background: -webkit-linear-gradient(45deg, rgba(60,148,201,1) 0%, rgba(70,170,232,1) 100%); /* safari5.1+,chrome10+ */
background: -o-linear-gradient(45deg, rgba(60,148,201,1) 0%, rgba(70,170,232,1) 100%); /* opera 11.10+ */
background: -ms-linear-gradient(45deg, rgba(60,148,201,1) 0%, rgba(70,170,232,1) 100%); /* ie10+ */
background: linear-gradient(45deg, rgba(60,148,201,1) 0%, rgba(70,170,232,1) 100%); /* w3c */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#46aae8', endColorstr='#3c94c9',GradientType=1 ); /* ie6-9 */">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini">A<b></b>P</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>Asset</b> PLANNER</span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation" style='background: -moz-linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%); background: -webkit-gradient(linear, left bottom, right top, color-stop(0%, rgba(64,154,207,1)), color-stop(100%, rgba(3,75,128,1))); background: -webkit-linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%);background: -o-linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%);background: -ms-linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%); background: linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%); filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#034B80", endColorstr="#409ACF",GradientType=1 );'>
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
                        margin:0;
                        float: left;
                        padding-left: 5px;
                        font-size: 20px;
                        line-height: 50px;
                    }
                </style>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">

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
                                    <a href="#" data-ui=""><i class="fa fa-check"></i> U industrial activa</a>
                                    <?php foreach($unidad_industrial as $uIndustrial){ ?>
                                    <a href="#" data-ui="<?php echo $uIndustrial['id_unidad'] ?>" ><i class="notFA"></i> <?php echo $uIndustrial['descripcion'] ?></a>
                                    <?php } ?>
                                </li>
                                <style>
                                    .notFA { margin-left: 27px; }
                                    .navbar-nav > .user-menu > .dropdown-menu > .user-body { padding: 15px 0; }
                                   .navbar-nav > .user-menu > .dropdown-menu > .user-footer {padding: 10px 20px; }
                                </style>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-right">
                                        <a href="<?php echo base_url(); #" onClick="cargarView('login', 'logout', '')?>" class="btn btn-default btn-flat">Salir <i class="fa fa-fw fa-sign-out"></i></a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- Control Sidebar Toggle Button -->
                        <!--
                        <li>
                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                        </li>
                        -->

                    </ul>
                </div>
            </nav>
        </header>
