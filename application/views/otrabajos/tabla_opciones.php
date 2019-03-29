
<?php
    echo '<div class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
    <i class="fa fa-ellipsis-h text-light-blue opcion" style="cursor: pointer;"></i></a>
    <ul class="dropdown-menu" style="background: -moz-linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%); 
    background: -webkit-gradient(linear, left bottom, right top, color-stop(0%, rgba(64,154,207,1)), color-stop(100%, rgba(3,75,128,1))); 
    background: -webkit-linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%);
    background: -o-linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%); 
    background: linear-gradient(45deg, rgba(64,154,207,1) 0%, rgba(3,75,128,1) 100%); 
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#034B80", endColorstr="#409ACF",GradientType=1 );">';

    if (strpos($permission,'Pedidos') !== false) { 

        echo '<li role="presentation"><a style="color:white;" role="menuitem" tabindex="-1" href="#"><i class="fa fa-cart-plus text-white" style="color:white; cursor: pointer;margin-left:-3px"></i>Agregar Nota de Pedido</a></li>';
   
    }

    if (strpos($permission,'Asignar') !== false) {

        echo '<li role="presentation"><a style="color:white;" role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#modalAsig"><i class="fa fa-user text-white" style="color:white; cursor: pointer;" ></i>Asignar OT</a></li>';
       
        echo '<li role="presentation" id="btnAddtarea"><a style="color:white;" role="menuitem" tabindex="-1" href="#"><i class="fa fa-check-square text-white" style="color:white; cursor: pointer;"></i>Asignar Tareas</a></li>';
        
    }

    if (strpos($permission,'Edit') !== false) {

        echo '<li role="presentation"><a style="color:white;" role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#modaleditar"><i class="fa fa-pencil text-white" style="color:white; cursor: pointer;"></i>Editar</a></li>';
  
    }

    if (strpos($permission,'Del') !== false) {

        echo '<li role="presentation"><a style="color:white;" role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#modalaviso"><i class="fa fa-times-circle text-white" style="color:white; cursor: pointer;"></i>Eliminar</a></li>';
   
    }

    //// GENERA INFORME DE SERVICIOS
    if (strpos($permission,'Del') !== false) {

        echo '<li role="presentation" id="cargOrden"><a style="color:white;" role="menuitem" tabindex="-1" href="#" ><i class="fa fa-file-text text-white" style="color:white; cursor: pointer;margin-left:-1px"></i>Informe de Servicios</a></li>';
   
    }
   
  
    if (strpos($permission,'Pedidos') !== false) {

        echo '<li role="presentation"><a style="color:white;" role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#modallista"><i class="fa fa-truck text-white" style="color:white; cursor: pointer;margin-left:-3px"></i>Mostrar Pedido</a></li>';
    
    }

    
    echo '</ul><div>';
?>

