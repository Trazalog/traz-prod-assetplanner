<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reportes extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}
	
	function getRepOrdServicio($data)
    {
    $userdata = $this->session->userdata('user_data');
    $empresaId = $userdata[0]['id_empresa'];
    
    // Procesamiento de fechas
    if (!empty($data['desde'])) {
        $datDesde = explode('-', $data['desde']);
        $desde = $datDesde[2].'-'.$datDesde[1].'-'.$datDesde[0];
    }
    
    if (!empty($data['hasta'])) {
        $datHasta = explode('-', $data['hasta']);
        $hasta = $datHasta[2].'-'.$datHasta[1].'-'.$datHasta[0];
    }
    
   // Para $id_equipo
    if (isset($data['id_equipo'])) {
        $id_equipo = $data['id_equipo'];
    } else {
        $id_equipo = null;
    }

    // Para $id_sector
    if (isset($data['id_sector'])) {
        $id_sector = $data['id_sector'];
    } else {
        $id_sector = null;
    }

    $this->db->select("
    sr.id_solicitud AS id,
    'Solicitud' AS origen,
    sr.f_solicitado, 
    sr.id_equipo,
    sr.estado,
    MAX(ot.fecha_inicio) AS fecha_inicio, 
    MAX(ot.fecha_terminada) AS fecha_terminada,
    ot.id_usuario_a, 
    e.codigo AS equipo, 
    s.descripcion AS sector, 
    g.descripcion AS grupo, 
    e.ubicacion,
    ot.id_orden,
    us.usrName AS asignado,
    COUNT(DISTINCT au.usrId) AS cantidad_personas
    ");

    $this->db->from('solicitud_reparacion sr');
    $this->db->join('equipos e', 'sr.id_equipo = e.id_equipo');
    $this->db->join('sector s', 'e.id_sector = s.id_sector');
    $this->db->join('grupo g', 'e.id_grupo = g.id_grupo');
    $this->db->join('orden_trabajo ot', 'ot.id_solicitud = sr.id_solicitud', 'left');
    $this->db->join('sisusers us', 'us.usrId = ot.id_usuario_a', 'left');
    $this->db->join('tbl_tipoordentrabajo tt', "tt.descripcion = 'Solicitud de servicio' AND tt.id = ot.tipo", 'left');

    //Cantidad de personas en informe de servicio
    $this->db->join('orden_servicio os', 'os.id_ot = ot.id_orden', 'left');
    $this->db->join('asignausuario au', 'au.id_orden = os.id_orden', 'left');   

    //tipo de solicitud servicio
    $this->db->where('ot.tipo = tt.id');
    $this->db->where('sr.id_empresa', $empresaId);
    $this->db->group_by('sr.id_solicitud'); // Mantiene la agrupación

    // Filtros opcionales
    if (!empty($id_sector)) {
        $this->db->where('s.id_sector', $id_sector);
    }
    if (!empty($id_equipo)) {
        $this->db->where('e.id_equipo', $id_equipo);
    }
    if (!empty($desde) && !empty($hasta)) {
        $this->db->where('sr.f_solicitado >=', $desde);
        $this->db->where('sr.f_solicitado <=', $hasta);
    }

    $query = $this->db->get();

    return ($query->num_rows() > 0) ? $query->result_array() : [];
    

    }

    public function getRepPreventivos($data)
    {
        $userdata = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];

        // Procesamiento de fechas
        if (!empty($data['desde'])) {
            $datDesde = explode('-', $data['desde']);
            $desde = $datDesde[2].'-'.$datDesde[1].'-'.$datDesde[0];
        }

        if (!empty($data['hasta'])) {
            $datHasta = explode('-', $data['hasta']);
            $hasta = $datHasta[2].'-'.$datHasta[1].'-'.$datHasta[0];
        }

        // Para $id_equipo
        if (isset($data['id_equipo'])) {
            $id_equipo = $data['id_equipo'];
        } else {
            $id_equipo = null;
        }

        // Para $id_sector
        if (isset($data['id_sector'])) {
            $id_sector = $data['id_sector'];
        } else {
            $id_sector = null;
        }

        $this->db->select("
            p.prevId AS id,
            'Preventivo' AS origen,
            ot.fecha as f_solicitado, 
            p.id_equipo,
            ot.estado,
            MAX(ot.fecha_inicio) as fecha_inicio, 
            MAX(ot.fecha_terminada) as fecha_terminada,
            ot.id_usuario_a, 
            e.codigo AS equipo, 
            s.descripcion AS sector, 
            g.descripcion AS grupo, 
            e.ubicacion,
            ot.id_orden,
            us.usrName as asignado,
            COUNT(DISTINCT au.usrId) AS cantidad_personas
        ");

        $this->db->from('preventivo p');
        $this->db->join('equipos e', 'p.id_equipo = e.id_equipo');
        $this->db->join('sector s', 'e.id_sector = s.id_sector');
        $this->db->join('grupo g', 'e.id_grupo = g.id_grupo');
        $this->db->join('orden_trabajo ot', 'ot.id_solicitud = p.prevId', 'left');
        $this->db->join('sisusers us', 'us.usrId = ot.id_usuario_a', 'left');
        //tipo preventivo
        $this->db->join('tbl_tipoordentrabajo tt', "tt.descripcion = 'Preventivo' AND tt.id = ot.tipo", 'left');
        $this->db->where('ot.tipo = tt.id');

         //Cantidad de personas en informe de servicio
        $this->db->join('orden_servicio os', 'os.id_ot = ot.id_orden', 'left');
        $this->db->join('asignausuario au', 'au.id_orden = os.id_orden', 'left');   

        $this->db->where('p.id_empresa', $empresaId);
        $this->db->group_by('p.prevId');

        // Filtros
        if (!empty($id_sector)) {
            $this->db->where('s.id_sector', $id_sector);
        }
        if (!empty($id_equipo)) {
            $this->db->where('e.id_equipo', $id_equipo);
        }
        if (!empty($desde) && !empty($hasta)) {
            $this->db->where('p.ultimo >=', $desde);
            $this->db->where('p.ultimo <=', $hasta);
        }

        $query = $this->db->get();
        return ($query->num_rows() > 0) ? $query->result_array() : [];
    }

    public function getRepbacklog($data)
    {
        $userdata = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];

        // Procesamiento de fechas
        if (!empty($data['desde'])) {
            $datDesde = explode('-', $data['desde']);
            $desde = $datDesde[2] . '-' . $datDesde[1] . '-' . $datDesde[0];
        }

        if (!empty($data['hasta'])) {
            $datHasta = explode('-', $data['hasta']);
            $hasta = $datHasta[2] . '-' . $datHasta[1] . '-' . $datHasta[0];
        }

         // Para $id_equipo
        if (isset($data['id_equipo'])) {
            $id_equipo = $data['id_equipo'];
        } else {
            $id_equipo = null;
        }

        // Para $id_sector
        if (isset($data['id_sector'])) {
            $id_sector = $data['id_sector'];
        } else {
            $id_sector = null;
        }

        $this->db->select("
            tb.backId AS id,
            'Backlog' AS origen,
            tb.fecha AS f_solicitado, 
            tb.id_equipo,
            ot.estado,
            MAX(ot.fecha_inicio) AS fecha_inicio, 
            MAX(ot.fecha_terminada) AS fecha_terminada,
            ot.id_usuario_a, 
            e.codigo AS equipo, 
            s.descripcion AS sector, 
            g.descripcion AS grupo, 
            e.ubicacion,
            ot.id_orden,
            us.usrName AS asignado,
            COUNT(DISTINCT au.usrId) AS cantidad_personas
        ");

        $this->db->from('tbl_back tb');
        $this->db->join('equipos e', 'tb.id_equipo = e.id_equipo');
        $this->db->join('sector s', 'e.id_sector = s.id_sector');
        $this->db->join('grupo g', 'e.id_grupo = g.id_grupo');
        $this->db->join('orden_trabajo ot', 'ot.id_solicitud = tb.backId', 'left');
        $this->db->join('tbl_tipoordentrabajo tt', "tt.descripcion = 'Backlog' AND tt.id = ot.tipo", 'left');
        $this->db->join('sisusers us', 'us.usrId = ot.id_usuario_a', 'left');

        //Cantidad de personas en informe de servicio
        $this->db->join('orden_servicio os', 'os.id_ot = ot.id_orden', 'left');
        $this->db->join('asignausuario au', 'au.id_orden = os.id_orden', 'left');   

        $this->db->where('tb.id_empresa', $empresaId);
        $this->db->group_by('tb.backId');

        // Filtros
        if (!empty($id_sector)) {
            $this->db->where('s.id_sector', $id_sector);
        }

        if (!empty($id_equipo)) {
            $this->db->where('e.id_equipo', $id_equipo);
        }

        if (!empty($desde) && !empty($hasta)) {
            $this->db->where('tb.fecha >=', $desde);
            $this->db->where('tb.fecha <=', $hasta);
        }

        $query = $this->db->get();
        return ($query->num_rows() > 0) ? $query->result_array() : [];
    }


    function getConsulta($data){

        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
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
                                        $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                                        $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                                $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                                $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                                                                    $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                                                                    $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                              $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                        $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                                                                $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                                                                                $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                    $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                                    $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                    $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
                                $this->db->where('orden_trabajo.id_empresa', $empresaId);
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
        $empresaId = $userdata[0]['id_empresa'];
       // $empId    = $userdata[0]['id_empresa']; 
        $this->db->select('admcustomers.cliId, admcustomers.cliRazonSocial');
                $this->db->from('admcustomers');    
                $this->db->where('admcustomers.id_empresa', $empresaId);	
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
        $empresaId = $userdata[0]['id_empresa'];
        //$empId = $userdata[0]['id_empresa'];     // guarda usuario logueado
        $id_cliente = $data['id_cli'];

       
		$this->db->select('equipos.id_equipo,
					equipos.codigo,
					equipos.descripcion');
    	$this->db->from('equipos');
        $this->db->where('equipos.estado !=', 'AN');
        if($id_cliente != 'sin cliente' )
        {$this->db->where('equipos.id_customer', $id_cliente);}
        $this->db->where('equipos.id_empresa', $empresaId);
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
       $empresaId = $userdata[0]['id_empresa'];
      
        
      
                $this->db->select('articles.artId, 
                articles.artBarCode,               
                articles.artDescription'
                            );
                    $this->db->from('articles');
                    $this->db->where('articles.id_empresa', $empresaId);
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
                        $this->db->join('orden_trabajo','orden_trabajo.id_usuario_a = sisusers.usrId');
                        $this->db->order_by('sisusers.usrId', 'ASC');
                        $this->db->distinct (); 

                    
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

