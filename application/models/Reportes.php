<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reportes extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}
	
	function getRepOrdServicio($data)
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
		if (($data['desde'] !== "") || ($data['hasta'] !== "")) {
            $datDesde = $data['desde'];
            $datDesde = explode('-', $datDesde);
            $desde    = $datDesde[2].'-'.$datDesde[1].'-'.$datDesde[0];
            $datHasta = $data['hasta'];
            $datHasta = explode('-', $datHasta);
            $hasta    = $datHasta[2].'-'.$datHasta[1].'-'.$datHasta[0];
		}
        $id_equipo = $data['id_equipo'];
        $id_sector = $data['id_sector'];
        $this->db->select('solicitud_reparacion.*,
            equipos.codigo as equipo, 
            sector.descripcion as sector, 
            grupo.descripcion as grupo, 
            equipos.ubicacion');
        $this->db->from('solicitud_reparacion');
        $this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
        $this->db->join('sector', 'equipos.id_sector = sector.id_sector');
        $this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo');
        
        if ($id_sector !== "") {
            $this->db->where('sector.id_sector', $id_sector);
        }
        if ($id_equipo !== "") {
            $this->db->where('equipos.id_equipo', $id_equipo);
        }
        if ($data['desde'] || $data['hasta'] !== "") {
            $this->db->where('solicitud_reparacion.f_solicitado >=', $desde);
            $this->db->where('solicitud_reparacion.f_solicitado <=', $hasta);
        }
        //$this->db->where('solicitud_reparacion.estado', 'C');
        $this->db->where('solicitud_reparacion.id_empresa', $empresaId);
        $query = $this->db->get();
        if ($query->num_rows()!=0)
        {
            //dump_exit($query->result_array());
            return $query->result_array();  
        }
        else
        {   
            return array();
        }  
    }

    function getConsulta($data){

        $userdata  = $this->session->userdata('user_data');
        $id_eq = $data['id_equipo'];
        $id_cli = $data['id_cliente'];
        $tipo = $data['tipo_alm'];
        $id_art = $data['id_articulo'];
        $id_sup = $data['id_supervisor'];
        // $d = $data['desde'];
        // $a = $data['a'];  
        
        //MANEJO DE LAS FECHAS
        if (($data['desde'] !== "") || ($data['a'] !== "")) {
            $datDesde = $data['desde'];
            $datDesde = explode('-', $datDesde);
            $desde    = $datDesde[2].'-'.$datDesde[1].'-'.$datDesde[0];
            $datHasta = $data['a'];
            $datHasta = explode('-', $datHasta);
            $hasta    = $datHasta[2].'-'.$datHasta[1].'-'.$datHasta[0];
        }
        
       
        
        //FECHA VAN EN TODDOS// 
        if($id_eq !== ""){  //Si solo se quiere saber para un equipo en especifico y no se selecciono cliente
            

            if(($tipo == 1) || ($tipo == null)){ //para insumos
               
                    
                        $this->db->select('orden_trabajo.id_orden,
                                alm_deta_entrega_materiales.cantidad,
                                alm_entrega_materiales.pema_id, 
                                articles.artDescription,                               
                                articles.artBarCode,                                                           
                                orden_trabajo.descripcion'
                                );
                                        $this->db->from('orden_trabajo');
                                        $this->db->join('alm_pedidos_materiales','alm_pedidos_materiales.ortr_id = orden_trabajo.id_orden');//id del insumo que se uso                                        
                                        $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                                        $this->db->join('alm_entrega_materiales',' alm_entrega_materiales.pema_id = alm_pedidos_materiales.pema_id ');
                                        $this->db->join('alm_deta_entrega_materiales', 'alm_deta_entrega_materiales.enma_id = alm_entrega_materiales.enma_id ');
                                        $this->db->join('articles', 'articles.artId = alm_deta_entrega_materiales.arti_id');//obtengo el o los insumos
                                        $this->db->where('orden_trabajo.id_equipo', $id_eq );
                                        if ($data['desde'] || $data['hasta'] !== null) {
                                            $this->db->where('alm_entrega_materiales.fecha >=', $desde);
                                            $this->db->where('alm_entrega_materiales.fecha <=', $hasta);
                                        }
                                        if($id_art !== ''){
                                        $this->db->where('alm_deta_entrega_materiales.arti_id', $id_art);
                                        }
                                        if($id_sup != null)
                                        {
                                        $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                        }

                                        $query = $this->db->get();
                }else{ //para herramientas no va borrar este else
                   
                        $this->db->select('orden_trabajo.id_orden,
                                equipos.codigo,
                                herramientas.herrcodigo,
                                herramientas.herrId,                
                                tbl_otherramientas.cantidad,
                                tbl_otherramientas.id,
                                tbl_tipoordentrabajo.descripcion AS desc,
                                orden_trabajo.descripcion,
                                orden_trabajo.estado');
                                        $this->db->from('orden_trabajo');
                                        $this->db->join('tbl_otherramientas','orden_trabajo.id_orden = tbl_otherramientas.otId');//herrameintas que se uso
                                        $this->db->join('herramientas', 'herramientas.herrId = tbl_otherramientas.HerrId');//nombre de las herramientas
                                        $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                                        $this->db->join('tbl_tipoordentrabajo','tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
                                        if ($data['desde'] || $data['hasta'] !== null) {
                                            $this->db->where('orden_trabajo.fecha_program >=', $desde);
                                            $this->db->where('orden_trabajo.fecha_program <=', $hasta);
                                        }
                                        if($id_art !== ''){
                                            $this->db->where('tbl_otherramientas.herrId', $id_art);
                                        }
                                        $this->db->where('orden_trabajo.id_equipo', $id_eq );// elegimos la ot del equipo que se desea
                                        if($id_sup != null)
                                        {
                                        $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                        }
                                        // $this->db->where('orden_trabajo.estaddo','T');
                                        // $this->db->where('orden_trabajo.estaddo','RE');
                                        // $this->db->where('orden_trabajo.estaddo','E');
                                        $query = $this->db->get();

                }//fin herr
              
               

            }else{//si solo se desea saber los insumos o herramientas de un cliente en especifico es decir abarcaria todos sus equipos
                if(($tipo == 1) || ($tipo == null)){  //para insumos
                    
                    $this->db->select('orden_trabajo.id_orden,
                    alm_deta_entrega_materiales.cantidad,
                    alm_entrega_materiales.pema_id, 
                    articles.artDescription,                               
                    articles.artBarCode,                                                           
                    orden_trabajo.descripcion');
                                $this->db->from('admcustomers');                   
                                $this->db->join('equipos','equipos.id_customer = admcustomers.cliId');
                                $this->db->join('orden_trabajo','equipos.id_equipo = orden_trabajo.id_equipo');                                                              
                                $this->db->join('alm_pedidos_materiales','alm_pedidos_materiales.ortr_id = orden_trabajo.id_orden');
                                $this->db->join('alm_entrega_materiales',' alm_entrega_materiales.pema_id = alm_pedidos_materiales.pema_id ');
                                $this->db->join('alm_deta_entrega_materiales', 'alm_deta_entrega_materiales.enma_id = alm_entrega_materiales.enma_id ');
                                $this->db->join('articles', 'articles.artId = alm_deta_entrega_materiales.arti_id');
                                $this->db->where('admcustomers.cliId', $id_cli );
                                if ($data['desde'] || $data['hasta'] !== null) {
                                    $this->db->where('alm_entrega_materiales.fecha >=', $desde);
                                    $this->db->where('alm_entrega_materiales.fecha <=', $hasta);
                                }
                                if($id_art !== ''){
                                $this->db->where('alm_deta_entrega_materiales.arti_id', $id_art);
                                }
                                if($id_sup != null)
                                {
                                $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                }

                                $query = $this->db->get();
                    }else{ //para Herramientas no va este else
                        
                    $this->db->select('equipos.codigo,
                            orden_trabajo.id_orden,
                            herramientas.herrcodigo,
                            herramientas.herrId,
                            tbl_otherramientas.cantidad,
                            tbl_otherramientas.id,                          
                            tbl_tipoordentrabajo.descripcion AS desc,
                            orden_trabajo.descripcion,
                            orden_trabajo.estado');
                                $this->db->from('equipos');
                                $this->db->join('orden_trabajo','orden_trabajo.id_equipo = equipos.id_equipo');
                                $this->db->join('tbl_otherramientas','orden_trabajo.id_orden = tbl_otherramientas.otId');//herrameintas que se uso
                                $this->db->join('herramientas', 'herramientas.herrId = tbl_otherramientas.HerrId');//nombre de las herramientas
                                $this->db->join('tbl_tipoordentrabajo','tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
                                $this->db->where('equipos.id_customer', $id_cli );
                                // if($id_art !== '' ){
                                //     $this->db->where('tbl_otherramientas.herrId', $id_art);
                                // }
                                if ($data['desde'] || $data['hasta'] !== null) {
                                    $this->db->where('orden_trabajo.fecha_program >=', $desde);
                                    $this->db->where('orden_trabajo.fecha_program <=', $hasta);
                                    // if($id_art !== ''){
                                    // $this->db->where('tbl_otherramientas.herrId', $id_art);
                                    // }
                                }             
                                //else{
                                        if($id_art !== ''){
                                        $this->db->where('tbl_otherramientas.herrId', $id_art);
                                        }
                                        if($id_sup != null)
                                        {
                                        $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                        }
                                        $query = $this->db->get();

                 }

            }

          //Si viene cli art eq
          
          
         //SI SOLO SE SELECCIONO UN ARTICULO EN ESCPECIFICO   
        if(($id_eq == null) && ($id_cli == null)){
        if($id_art != ''){
            if(($tipo == 1) || ($tipo == null)){//INSUMOS
                                                
                                                                
                                                        $this->db->select('orden_trabajo.id_orden,
                                                        alm_deta_entrega_materiales.cantidad,
                                                        alm_entrega_materiales.pema_id, 
                                                        articles.artDescription,                               
                                                        articles.artBarCode,                                                           
                                                        orden_trabajo.descripcion');
                                                                    $this->db->from('orden_trabajo');
                                                                    $this->db->join('alm_pedidos_materiales','alm_pedidos_materiales.ortr_id = orden_trabajo.id_orden');//id del insumo que se uso                                        
                                                                    $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                                                                    $this->db->join('alm_entrega_materiales',' alm_entrega_materiales.pema_id = alm_pedidos_materiales.pema_id ');
                                                                    $this->db->join('alm_deta_entrega_materiales', 'alm_deta_entrega_materiales.enma_id = alm_entrega_materiales.enma_id ');
                                                                    $this->db->join('articles', 'articles.artId = alm_deta_entrega_materiales.arti_id');//obtengo el o los insumos
                                                                    $this->db->where('alm_deta_entrega_materiales.arti_id',$id_art);
                                                                    if($id_sup != ''){
                                                                    $this->db->where('sisusers.usrId', $id_sup);    
                                                                    }
                                                                    if ($data['desde'] || $data['hasta'] !== null) {
                                                                        $this->db->where('alm_entrega_materiales.fecha >=', $desde);
                                                                        $this->db->where('alm_entrega_materiales.fecha <=', $hasta);
                                                                    }
                                                                    $query = $this->db->get();
                                                                    

            }else{//HERRAMIENTAS no este else borrar
               
                                                        $this->db->select('tbl_otherramientas.cantidad,
                                                                 tbl_otherramientas.id,                                                       
                                                                orden_trabajo.id_orden,
                                                                orden_trabajo.descripcion,
                                                                orden_trabajo.estado,
                                                                herramientas.herrcodigo,
                                                                herramientas.herrId,                
                                                                tbl_tipoordentrabajo.descripcion AS desc,
                                                                equipos.codigo');
                                                                    $this->db->from('tbl_otherramientas');
                                                                    $this->db->join('orden_trabajo','orden_trabajo.id_orden = tbl_otherramientas.otId');
                                                                    $this->db->join('herramientas','herramientas.herrId = tbl_otherramientas.herrId');
                                                                    $this->db->join('tbl_tipoordentrabajo','tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
                                                                    $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                                                                    $this->db->where('tbl_otherramientas.herrId',$id_art);
                                                                    if ($data['desde'] || $data['hasta'] !== null) {
                                                                        $this->db->where('orden_trabajo.fecha_program >=', $desde);
                                                                        $this->db->where('orden_trabajo.fecha_program <=', $hasta);
                                                                    }
                                                                    $query = $this->db->get();

             }
          }

       }
       //si solo se selecciono el supervisor y el tipo de articulo(si no se selecciono por defecto se toma como herramientas)
        if(($id_eq == null) && ($id_cli == null) && ($id_art == null) ){
            if(($tipo == 1) || ($tipo == null)){//Insumos
               
                $this->db->select('orden_trabajo.id_orden,
                alm_deta_entrega_materiales.cantidad,
                alm_entrega_materiales.pema_id, 
                articles.artDescription,                               
                articles.artBarCode,                                                           
                orden_trabajo.descripcion'
                              );
                              $this->db->from('orden_trabajo');
                              $this->db->join('alm_pedidos_materiales','alm_pedidos_materiales.ortr_id = orden_trabajo.id_orden');//id del insumo que se uso                                        
                              $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                              $this->db->join('alm_entrega_materiales',' alm_entrega_materiales.pema_id = alm_pedidos_materiales.pema_id ');
                              $this->db->join('alm_deta_entrega_materiales', 'alm_deta_entrega_materiales.enma_id = alm_entrega_materiales.enma_id ');
                              $this->db->join('articles', 'articles.artId = alm_deta_entrega_materiales.arti_id');//obtengo el o los insumos
                              if($id_sup != null)
                                   {
                                   $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                   }
                              if ($data['desde'] || $data['hasta'] !== null) {
                                $this->db->where('alm_entrega_materiales.fecha >=', $desde);
                                $this->db->where('alm_entrega_materiales.fecha <=', $hasta);
                           }
                              $query = $this->db->get();
            
            }else{//Herramientas este else no va borrar

                $this->db->select('orden_trabajo.id_orden,
                     herramientas.herrcodigo,
                     herramientas.herrId,               
                     tbl_otherramientas.cantidad, 
                     tbl_otherramientas.id,                                
                     tbl_tipoordentrabajo.descripcion AS desc,
                     orden_trabajo.descripcion,
                     orden_trabajo.estado,
                     equipos.codigo'
                        );
                        $this->db->from('orden_trabajo');
                        $this->db->join('tbl_otherramientas','orden_trabajo.id_orden = tbl_otherramientas.otId');//herrameintas que se uso
                        $this->db->join('herramientas', 'herramientas.herrId = tbl_otherramientas.HerrId');//nombre de las herramientas
                        $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                        $this->db->join('tbl_tipoordentrabajo','tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
                        if($id_sup != null)
                        {
                        $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                        }
                        if ($data['desde'] || $data['hasta'] !== null) {
                            $this->db->where('orden_trabajo.fecha_program >=', $desde);
                            $this->db->where('orden_trabajo.fecha_program <=', $hasta);
                        }
                           $query = $this->db->get();

            }
        }
        //si se selecciono unicamente el cliente y un articulo especifico
        if(($id_eq == null) && ($id_cli != null) && ($id_art!=null)){
            if(($tipo == 1) || ($tipo == null)){              
                        
                                                                $this->db->select('orden_trabajo.id_orden,
                                                                alm_deta_entrega_materiales.cantidad,
                                                                alm_entrega_materiales.pema_id, 
                                                                articles.artDescription,                               
                                                                articles.artBarCode,                                                           
                                                                orden_trabajo.descripcion'             
                                                                );
                                                                $this->db->from('admcustomers');
                                                                $this->db->join('equipos','equipos.id_customer = admcustomers.cliId'); 
                                                                $this->db->join('orden_trabajo','equipos.id_equipo = orden_trabajo.id_equipo');                                                                                                                             
                                                                $this->db->join('alm_pedidos_materiales','alm_pedidos_materiales.ortr_id = orden_trabajo.id_orden');
                                                                $this->db->join('alm_entrega_materiales',' alm_entrega_materiales.pema_id = alm_pedidos_materiales.pema_id ');
                                                                $this->db->join('alm_deta_entrega_materiales', 'alm_deta_entrega_materiales.enma_id = alm_entrega_materiales.enma_id ');
                                                                $this->db->join('articles', 'articles.artId = alm_deta_entrega_materiales.arti_id');
                                                                $this->db->where('admcustomers.cliId', $id_cli ); 
                                                                $this->db->where('alm_deta_entrega_materiales.arti_id',$id_art);
                                                                                if ($data['desde'] || $data['hasta'] !== null) {
                                                                                $this->db->where('alm_entrega_materiales.fecha >=', $desde);
                                                                                $this->db->where('alm_entrega_materiales.fecha <=', $hasta);
                                                                                }
                                                                                $query = $this->db->get();
                                                                                if($id_sup != null)
                                                                                {
                                                                                $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                                                                }


            }else{// no va borrar
               
                                                                $this->db->select('tbl_otherramientas.cantidad,
                                                                tbl_otherramientas.id,                               
                                                                orden_trabajo.id_orden,
                                                                orden_trabajo.descripcion,
                                                                orden_trabajo.estado,
                                                                herramientas.herrcodigo,
                                                                herramientas.herrId,                
                                                                tbl_tipoordentrabajo.descripcion AS desc,
                                                                equipos.codigo'
                                                                    

                                                                );
                                                                                $this->db->from('tbl_otherramientas');
                                                                                $this->db->join('orden_trabajo','orden_trabajo.id_orden = tbl_otherramientas.otId');
                                                                                $this->db->join('herramientas','herramientas.herrId = tbl_otherramientas.herrId');
                                                                                $this->db->join('tbl_tipoordentrabajo','tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
                                                                                $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                                                                                $this->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');
                                                                                $this->db->where('tbl_otherramientas.herrId',$id_art);
                                                                                $this->db->where('admcustomers.cliId',$id_cli);
                                                                                if ($data['desde'] || $data['hasta'] !== null) {
                                                                                    $this->db->where('orden_trabajo.fecha_program >=', $desde);
                                                                                    $this->db->where('orden_trabajo.fecha_program <=', $hasta);
                                                                                }
                                                                                if($id_sup != null)
                                                                                {
                                                                                $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                                                                }
                                                                                $query = $this->db->get();


            }




        }
        else{ //si se selecciono cliente, equipo y articulo
            if((($id_eq != null) && ($id_cli != null) && ($id_art!=null))){

                if(($tipo == 1) || ($tipo == null)){              
                        
                    $this->db->select('orden_trabajo.id_orden,
                    alm_deta_entrega_materiales.cantidad,
                    alm_entrega_materiales.pema_id, 
                    articles.artDescription,                               
                    articles.artBarCode,                                                           
                    orden_trabajo.descripcion'                
                    );
                    $this->db->from('orden_trabajo');
                    $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                    $this->db->join('admcustomers','equipos.id_customer = admcustomers.cliId');                   
                    $this->db->join('alm_pedidos_materiales','alm_pedidos_materiales.ortr_id = orden_trabajo.id_orden');
                    $this->db->join('alm_entrega_materiales',' alm_entrega_materiales.pema_id = alm_pedidos_materiales.pema_id ');
                    $this->db->join('alm_deta_entrega_materiales', 'alm_deta_entrega_materiales.enma_id = alm_entrega_materiales.enma_id ');
                    $this->db->join('articles', 'articles.artId = alm_deta_entrega_materiales.arti_id');                                 
                    $this->db->where('admcustomers.cliId', $id_cli ); 
                    $this->db->where('alm_deta_entrega_materiales.arti_id',$id_art);
                    $this->db->where('equipos.id_equipo',$id_eq);
                                    if ($data['desde'] || $data['hasta'] !== null) {
                                        $this->db->where('alm_entrega_materiales.fecha >=', $desde);
                                        $this->db->where('alm_entrega_materiales.fecha <=', $hasta);
                                    }
                                    if($id_sup != null)
                                        {
                                        $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                        }
                                    $query = $this->db->get();


                }else{ //no va borrar este else

                    $this->db->select('tbl_otherramientas.cantidad,
                    tbl_otherramientas.id,
                    orden_trabajo.id_orden,
                    orden_trabajo.descripcion,
                    orden_trabajo.estado,
                    herramientas.herrcodigo,
                    herramientas.herrId,                
                    tbl_tipoordentrabajo.descripcion AS desc,
                    equipos.codigo'
                        

                    );
                                    $this->db->from('tbl_otherramientas');
                                    $this->db->join('orden_trabajo','orden_trabajo.id_orden = tbl_otherramientas.otId');
                                    $this->db->join('herramientas','herramientas.herrId = tbl_otherramientas.herrId');
                                    $this->db->join('tbl_tipoordentrabajo','tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
                                    $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                                    $this->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');
                                    $this->db->where('tbl_otherramientas.herrId',$id_art);
                                    $this->db->where('admcustomers.cliId',$id_cli);
                                    $this->db->where('equipos.id_equipo',$id_eq);
                                    if ($data['desde'] || $data['hasta'] !== null) {
                                        $this->db->where('orden_trabajo.fecha_program >=', $desde);
                                        $this->db->where('orden_trabajo.fecha_program <=', $hasta);
                                    }
                                    if($id_sup != null)
                                        {
                                        $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                        }
                                    $query = $this->db->get();


                }
            }
        }

        if(($id_eq != null) && ($id_art!=null) && ($id_cli == null)){

            if(($tipo == 1) || ($tipo == null)){              
                        
                $this->db->select('orden_trabajo.id_orden,
                alm_deta_entrega_materiales.cantidad,
                alm_entrega_materiales.pema_id, 
                articles.artDescription,                               
                articles.artBarCode,                                                           
                orden_trabajo.descripcion'            
                );
                $this->db->from('orden_trabajo');
                    $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');                                      
                    $this->db->join('alm_pedidos_materiales','alm_pedidos_materiales.ortr_id = orden_trabajo.id_orden');
                    $this->db->join('alm_entrega_materiales',' alm_entrega_materiales.pema_id = alm_pedidos_materiales.pema_id ');
                    $this->db->join('alm_deta_entrega_materiales', 'alm_deta_entrega_materiales.enma_id = alm_entrega_materiales.enma_id ');
                    $this->db->join('articles', 'articles.artId = alm_deta_entrega_materiales.arti_id');                                
                    $this->db->where('alm_deta_entrega_materiales.arti_id',$id_art);
                    $this->db->where('equipos.id_equipo',$id_eq);
                                if ($data['desde'] || $data['hasta'] !== null) {
                                    $this->db->where('alm_entrega_materiales.fecha >=', $desde);
                                    $this->db->where('alm_entrega_materiales.fecha <=', $hasta);
                                }
                                if($id_sup != null)
                                        {
                                        $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                        }
                                $query = $this->db->get();


            }else{ // no va borrar

                $this->db->select('tbl_otherramientas.cantidad,
                tbl_otherramientas.id,
                orden_trabajo.id_orden,
                orden_trabajo.descripcion,
                orden_trabajo.estado,
                herramientas.herrcodigo,
                herramientas.herrId,
                tbl_tipoordentrabajo.descripcion AS desc,
                equipos.codigo'
                    

                );
                                $this->db->from('tbl_otherramientas');
                                $this->db->join('orden_trabajo','orden_trabajo.id_orden = tbl_otherramientas.otId');
                                $this->db->join('herramientas','herramientas.herrId = tbl_otherramientas.herrId');
                                $this->db->join('tbl_tipoordentrabajo','tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
                                $this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
                                $this->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');
                                $this->db->where('tbl_otherramientas.herrId',$id_art);
                                $this->db->where('equipos.id_equipo',$id_eq);
                                if ($data['desde'] || $data['hasta'] !== null) {
                                    $this->db->where('orden_trabajo.fecha_program >=', $desde);
                                    $this->db->where('orden_trabajo.fecha_program <=', $hasta);
                                }
                                if($id_sup != null)
                                        {
                                        $this->db->where('orden_trabajo.id_usuario_a', $id_sup);
                                        }
                                $query = $this->db->get();


            }




        }
        


        // $id_eq = $data['id_equipo'];
        // $id_cli = $data['id_cliente'];
        // $tipo = $data['tipo_alm'];
        // $id_art = $data['id_articulo'];
        // $id_sup = $data['id_supervisor'];
        // equipos.codigo,
        //             orden_trabajo.id_orden,*
        //             herramientas.herrcodigo,*
        //             tbl_otherramientas.cantidad, *
        //             tbl_tipoordentrabajo.descripcion AS desc,*
        //             orden_trabajo.descripcion,*
        //             orden_trabajo.estado'*
        //             equipos.codigo
        //cliente solo

        //supervisor solo con tipo o  todos los tipos

        //igual al primero (todos los filtro del primero) pero con articulo en especifico o articulo solo sin demas filtros


        if ($query->num_rows()!=0)
        {
            //dump_exit($query->result_array());
            return $query->result_array();  
        }
        else
        {   
            return array();
        }  


   
        // //$fecha = $data['fechaDesde'];
        // $this->db->select('orden_trabajo.*
        //                   '); 
        // $this->db->from('orden_trabajo');
        //             //$this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
        //            // $this->db->join('tbl_otherramientas','tbl_otherramientas.otId = orden_trabajo.id_orden');
        //             $this->db->where('orden_trabajo.id_equipo ',  $codigo_equipo);
        //            // $this->db->where('orden_trabajo.fecha <' $fecha);
        //             $query = $this->db->get();
        //             if ($query->num_rows()!=0)
        //             {
        //                 //dump_exit($query->result_array());
        //                 return $query->result_array();  
        //             }
        //             else
        //             {   
        //                 return array();
        //             }  
    }

    function getClientes(){
        $userdata = $this->session->userdata('user_data');
       // $empId    = $userdata[0]['id_empresa']; 
        $this->db->select('admcustomers.cliId, admcustomers.cliRazonSocial');
				$this->db->from('admcustomers');    	
				//$this->db->where('admcustomers.id_empresa', $empId); //esto es si queremos buscar solamente los clientes de la empresa con la que se esta logueada que en este caso es empresa 6
				$this->db->where('admcustomers.estado !=', 'AN');
			$query = $this->db->get();

			$i     = 0;
					foreach ($query->result() as $row)
					{
						$clientes[$i]['label'] = $row->cliRazonSocial;
							$clientes[$i]['value'] = $row->cliId;
							$i++;
					}
					return $clientes;
    }
    function getEquipos($data){
        $userdata = $this->session->userdata('user_data');
        //$empId = $userdata[0]['id_empresa'];     // guarda usuario logueado
        $id_cliente = $data['id_cli'];

       
		$this->db->select('equipos.id_equipo,
					equipos.codigo,
					equipos.descripcion');
    	$this->db->from('equipos');
        $this->db->where('equipos.estado !=', 'AN');
        if($id_cliente != 'sin cliente' )
        {$this->db->where('equipos.id_customer', $id_cliente);}
    	//$this->db->where('equipos.id_empresa', $empId);
    	$this->db->order_by('equipos.id_equipo', 'ASC');
    	$query = $this->db->get();

	    if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return [];
		}
    }

    function getArticulos(){
       $userdata = $this->session->userdata('user_data');
      
        
      
                $this->db->select('articles.artId, 
                articles.artBarCode,               
                articles.artDescription'
                            );
                    $this->db->from('articles');
                    $this->db->order_by('articles.artId', 'ASC');
                
                    $query = $this->db->get();
                    //_________________________________
                    $i     = 0;
					foreach ($query->result() as $row)
					{
                        $articulos[$i]['label'] = $row->artDescription; 
                        $articulos[$i]['labelcod'] = $row ->artBarCode;                       
							$articulos[$i]['value'] = $row->artId;
							$i++;
					}
					return $articulos;

                    //________________________________        
                    // if ($query->num_rows()!=0)
                    // {
                    // return $query->result_array();
                    // }
                    // else
                    // {
                    // return [];
                    // }
       
      

         
       
    }

    function getSupervisors(){
        $userdata = $this->session->userdata('user_data');
        //$userId = $userdata[0]['usrId'];
        $this->db->select('sisusers.usrId,
                                sisusers.usrNick,
                                sisusers.usrName'
                                );
                        $this->db->from('sisusers');
                        $this->db->join('usuarioasempresa','usuarioasempresa.usrId = sisusers.usrId');
                        $this->db->join('sisgroups','sisgroups.grpId = usuarioasempresa.grpId');
                        $this->db->where('sisgroups.grpName','Mantenedor');
                        $this->db->order_by('sisusers.usrId', 'ASC');
                    
                        $query = $this->db->get();

                        if ($query->num_rows()!=0)
                        {
                        return $query->result_array();
                        }
                        else
                        {
                        return [];
                        }
    }

}

