<script>

    $('.opcion').on('mouseover',function(){
       alert('Holis');
    });

</script>

<!-- if (strpos($permission,'Del') !== false) {
                          echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Eliminar" data-toggle="modal" data-target="#modalaviso"></i>';
                          //echo '<i class="fa fa-fw fa-print text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Imprimir"  ></i> '; 
                        }
                        if (strpos($permission,'Edit') !== false) {
      	                	echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar" data-toggle="modal" data-target="#modaleditar" ></i>';
                        }
                        if (strpos($permission,'Asignar') !== false) {
                          echo '<i class="fa fa-check-square-o text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Asignar tarea" id="btnAddtarea"></i>';
                          echo '<i class="fa fa-thumb-tack text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Asignar OT" data-toggle="modal" data-target="#modalAsig" ></i>';
                         
                        }
                        /*if (strpos($permission,'OP') !== false) {
                          echo '<i class="fa fa-tags text-light-blue" style="cursor: pointer; margin-left: 15px;"  title="Cargar Pedido " data-toggle="modal" data-target="#modalpedido"></i>';
                        }*/
                        if (strpos($permission,'Pedidos') !== false) {
                          echo '<i class="fa fa-truck text-light-blue" style="cursor: pointer; margin-left: 15px;"  title="Mostrar Perdido " data-toggle="modal" data-target="#modallista"></i>';
                          echo '<i class="fa fa-cart-plus text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Agregar Nota de Pedido"></i>';
                        }
                        if(($a['estado'] == 'As' || $a['estado'] == 'P') && ($a['id_usuario_a'] == $usrId)){
                        //if($a['estado'] == 'As' ){
                          echo '<i  href="#"class="fa fa-fw fa fa-toggle-on text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Finalizar Orden" data-toggle="modal" data-target="#modalfinalizar"></i>';
                        }
                        //// GENERA INFORME DE SERVICIOS
                        if (strpos($permission,'Del') !== false) {
                          echo '<i class="fa fa-sticky-note-o text-light-blue" id="cargOrden" style="cursor: pointer; margin-left: 15px;" title="Informe de Servicios" ></i>';
                        } -->