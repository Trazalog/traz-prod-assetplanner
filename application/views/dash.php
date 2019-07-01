<body class="skin-blue-light sidebar-mini">
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="#" onClick="cargarView('<?php echo $grpDash; ?>', 'index', 'View')" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini">A<b></b>P</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>Asset</b> PLANNER</span>
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
                                    <?php foreach($empresas as $e){ ?>
                                        <a href="#" class="btnEmpresa" data-ui="<?php echo $e['id_empresa'] ?>" >
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
                                    .notFA { margin-left: 27px; }
                                    .navbar-nav > .user-menu > .dropdown-menu > .user-body { padding: 15px 0; }
                                    .navbar-nav > .user-menu > .dropdown-menu > .user-footer { padding: 10px 20px; }
                                </style>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-right">
                                        <a href="<?php echo base_url(); #" onClick="cargarView('login', 'logout', '')?>" class="btn btn-default btn-flat">Salir <i class="fa fa-fw fa-sign-out"></i></a>
                                        <button class="btn btn-success" onclick="procesarCola()">Aceptar</button>
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

<script>
 if (!indexedDB) {
      alert("Este browser no soporta IndexedDB, necesita otro para poder utilizar la aplicación.");
  }

  indexedDB.open('traz-prod-assetplanner-ajax').onupgradeneeded = function (event) {
    event.target.result.createObjectStore('ajax_requests', {
      autoIncrement:  true,
      keyPath: 'id'
    });
  };
  caches.open('traz-prod-assetplanner-cache').then(function(cache) {
    return cache.addAll([
                'http://localhost/traz-prod-assetplanner/Tarea/index/'+'<?php echo $permiso?>',
                'http://localhost/traz-prod-assetplanner/index.php/Tarea/index/'+'<?php echo $permiso?>'
            ]);
        });
        tareas = JSON.parse('<?php echo $tareas?>');
        tareas = tareas.data;
        console.log(tareas);
            caches.open('traz-prod-assetplanner-cache').then(function(cache) {
                for(i=0;i<tareas.length;i++)
        {
         
     cache.addAll([
        'http://localhost/traz-prod-assetplanner/index.php/Tarea/detaTarea/'+'<?php echo $permiso?>/'+tareas[i].id
               
            ]);
        }
        });

  if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
      navigator.serviceWorker.register('sw1.js').then(function(){
        if (!navigator.serviceWorker.controller) {
       location.reload();
      }
    })
    });
  }
  function procesarCola() {
  if (navigator.serviceWorker.controller) {
      navigator.serviceWorker.controller.postMessage('processQueue')
    }
}
$(document).on('click', '.btnEmpresa', function () {
    var idNewEmpresa = $(this).data('ui');
    cambiarDeEmpresa(idNewEmpresa);
});

function cambiarDeEmpresa(idNewEmpresa) {
    console.info("id de empresa nueva: "+idNewEmpresa);

    $.ajax({
        data: { idNewEmpresa:idNewEmpresa },
        dataType: 'json',
        type: 'POST',
        url: 'index.php/Dash/cambiarDeEmpresa',
        success: function(result){
            //console.table(result);
            window.location.href = 'dash';
        },
        error: function(result){
            console.error("Error al cambiar de empresa");
            console.table(result);
        },
    });
}
</script>
