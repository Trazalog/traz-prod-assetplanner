<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ordenservicios extends CI_Model {
	
    function __construct()
    {
		parent::__construct();
	}
	
    function getOrdServiciosList()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('
            orden_servicio.id_orden, 
            orden_servicio.estado,
            orden_servicio.comprobante,
            orden_servicio.fecha, 
            orden_servicio.id_ot,
            orden_trabajo.descripcion AS descripcion_ot,
            equipos.codigo AS equipo,
            equipos.id_equipo
        ');
            /*
            equipos.id_equipo,
            equipos.codigo,
            solicitud_reparacion.id_solicitud,
            solicitud_reparacion.solicitante, 
            solicitud_reparacion.f_solicitado,                     
            solicitud_reparacion.causa,*/
            //TODO: ACA CAMBIE LA QUERY (se tomo id equipos de OT en vez de sol rep)
        $this->db->from('orden_servicio');
        $this->db->join('orden_trabajo', 'orden_servicio.id_ot = orden_trabajo.id_orden');
        $this->db->join('equipos', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->where('orden_servicio.id_empresa', $empresaId);
        //$this->db->join('solicitud_reparacion', 'orden_servicio.id_solicitudreparacion = solicitud_reparacion.id_solicitud');
        //$this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
        $query = $this->db->get();

        if ($query->num_rows()!=0)
        {
            return $query->result_array();  
        }
        else
        {   
            return array();
        }      
    }

		function getEquipos($data) // FUNCIONA BIEN 
    {
        $id = $data['id_equipo']; 
        log_message('DEBUG','#Main/index | OrdenServicio >getEquipo> id_equipo '.$data);
        $this->db->select('
            equipos.codigo AS nomb_equipo,                
            equipos.descripcion AS desc_equip,
            equipos.fecha_ingreso,
            equipos.fecha_baja,
            equipos.fecha_garantia,
            equipos.estado,
            equipos.marca,
            grupo.descripcion AS grupo_desc,
            sector.descripcion As sector_desc,
            equipos.ubicacion
            ');           
        $this->db->from('equipos');        
        $this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo', 'left');
        $this->db->join('sector', 'equipos.id_sector = sector.id_sector');      
				$this->db->group_by('equipos.id_equipo');
        $this->db->where('equipos.id_equipo', $id);
        $query = $this->db->get();      			
				
				foreach ($query->result_array() as $row){ 	

					$datos['nomb_equipo']    = $row['nomb_equipo'];
					$datos['desc_equipo']    = $row['desc_equip'];
					$datos['fecha_ingreso']  = $row['fecha_ingreso'];
					$datos['fecha_baja']     = $row['fecha_baja'];
					$datos['fecha_garantia'] = $row['fecha_garantia'];
					$datos['estado']         = $row['estado'];
					$datos['marca']          = $row['marca'];
					$datos['grupo_desc']     = $row['grupo_desc'];
					$datos['sector']         = $row['sector_desc'];
					$datos['ubicacion']      = $row['ubicacion'];
				}
				
				return $datos;
    }

    

    function getDatosOrdenServicios($data = null) // Ok ¿al pedo?
    {
        $id = $data['id_ordenservicio'];       
        $this->db->select('
            orden_servicio.lectura,
            orden_servicio.comprobante,
            contratistas.id_contratista,
            contratistas.nombre');
        $this->db->from('orden_servicio');
        $this->db->join('contratistas', 'contratistas.id_contratista = orden_servicio.id_contratista');
        $this->db->where('orden_servicio.id_solicitudreparacion', $id);
        $query = $this->db->get();
        foreach ($query->result_array() as $row)
        { 
                $data['comprobante']    = $row['comprobante'];
                $data['lectura']        = $row['lectura'];
                $data['contratista']    = $row['nombre'];
                $data['id_contratista'] = $row['id_contratista'];
                return $data;
        }
    }

    function getHerramientas() // Ok
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('herrdescrip, herrmarca, herrcodigo, herrId');
        $this->db->from('herramientas');
        $this->db->where('id_empresa', $empresaId);
        $this->db->where('equip_estad !=', 'AN');
        $query = $this->db->get();
        $i     = 0;
        foreach ($query->result() as $row)
        {
            $herramientas[$i]['label'] = $row->herrdescrip;
            $herramientas[$i]['value'] = $row->herrmarca;
            $herramientas[$i]['codherram'] = $row->herrcodigo;
            $herramientas[$i]['herrId'] = $row->herrId;
            $i++;
        }
        return $herramientas;
    }

    function getOperarios() // Ok
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('sisusers.usrId, sisusers.usrLastName, sisusers.usrname');
        $this->db->join('usuarioasempresa', 'usuarioasempresa.usrId = sisusers.usrId');
        $this->db->from('sisusers');
        $this->db->where('usuarioasempresa.empresaid', $empresaId);
        $this->db->where('usuarioasempresa.estado', 'AC');
        $query = $this->db->get();
        $i     = 0;
        foreach ($query->result() as $row)
        {   
            $equipos[$i]['label'] = $row->usrLastName.", ". $row->usrname ;
            $equipos[$i]['value'] = $row->usrId;
            $i++;
        }
        return $equipos;
    }

		function getRRHHOrdenTrabajo($idOT){
			//dump($idOT, 'id de OT en modell');	
			$this->db->select('tbl_listarea.id_usuario,
												sisusers.usrName,
												sisusers.usrLastName');			
			$this->db->from('tbl_listarea');
			$this->db->join('sisusers', 'sisusers.usrId = tbl_listarea.id_usuario');
			$this->db->where('tbl_listarea.id_orden', $idOT);
			$query = $this->db->get();
			$i     = 0;
			foreach ($query->result() as $row)
			{   
					$equipos[$i]['label'] = $row->usrLastName.", ". $row->usrName ;
					$equipos[$i]['value'] = $row->id_usuario;
					$i++;
			}
			return $equipos; 
		}
		function getResponsableOT($idOT){
			$this->db->select('sisusers.usrId,
												sisusers.usrName,
												sisusers.usrLastName');			
			$this->db->from('orden_trabajo');
			$this->db->join('sisusers', 'sisusers.usrId = orden_trabajo.id_usuario_a');
			$this->db->where('orden_trabajo.id_orden', $idOT);
			$query = $this->db->get();
			$i     = 0;
						
			foreach ($query->result() as $row)
			{   
					$equipos['label'] = $row->usrLastName.", ". $row->usrName ;
					$equipos['value'] = $row->usrId;
					$i++;
			}
			return $equipos;
		}


		// Devuelve id de Orden Servicios por id de OTrabajo
		function getOServicioPorIdOT($id_ot){

			$this->db->select('orden_servicio.id_orden');
			$this->db->from('orden_servicio');
			$this->db->where('orden_servicio.id_ot', $id_ot);
			$query = $this->db->get();
			$result = $query->row();      
      return $result->id_orden;		
		}

		// Guarda Informe de Servicios nuevo
    function setOrdenServicios($data){

			$userdata      = $this->session->userdata('user_data');
			$usrId         = $userdata[0]['usrId'];     // guarda usuario logueado
			$empresaId     = $userdata[0]['id_empresa'];
			////////// para guardar herramientas 
			if ( !empty($data['herramienta']) ){
				$date          = $data['fecha'];
				$valeSalHerram = array(
						'fecha'      => $date,
						'usrid'      => $usrId,
						'id_empresa' => $empresaId
				);
				if ( ! $this->db->insert('tbl_valesalida', $valeSalHerram) ){
						return $this->db->error(); // Has keys 'code' and 'message'
				}
				$idInsertVale = $this->db->insert_id();

				// detalle herramientas
				for ($i=0; $i < count($data['herramienta']) ; $i++){ 
						$detavalHerram["valesid"]    = $idInsertVale;
						$detavalHerram["herrId"]     = $data["herramienta"][$i][3];
						$detavalHerram["id_empresa"] = $empresaId;
						if ( ! $this->db->insert('tbl_detavalesalida', $detavalHerram) ){
								return $this->db->error(); // Has keys 'code' and 'message'
						}
				}
			}else{

				$idInsertVale = 0;    // esta ba en 1 hardcode (no puede ser 0 por la clave foranea)
			}						
			////// guarda orden servicio
			$id_equipo              = $data['id_equipo'];
			$id_solicitudreparacion = $data['id_solicitudreparacion'];
			$id_ot                  = $data['id_ot'];
			$horometroinicio        = $data['horometro_inicio'];
			$horometrofin           = $data['horometro_fin'];
			$fechahorainicio        = $data['fecha_inicio'];
			$fechahorafin           = $data['fecha_fin'];
			$ord_serv               = array(
																	'fecha'                  => date('Y-m-d H:i:s'), 
																	'id_equipo'              => $id_equipo,
																	'id_solicitudreparacion' => $id_solicitudreparacion,
																	'valesid'                => $idInsertVale,	
																	'id_ot'                  => $id_ot,
																	'estado'                 => 'C',
																	'id_empresa'             => $empresaId,
																	'fechahorainicio'        => $fechahorainicio,
																	'fechahorafin'           => $fechahorafin,
																	'horometroinicio'        => $horometroinicio,
																	'horometrofin'           => $horometrofin,
															);				

			if ( ! $this->db->insert('orden_servicio', $ord_serv) ){
					return $this->db->error(); // Has keys 'code' and 'message'
			}
			$idInsertOrden = $this->db->insert_id();

			// deta orden servicio
			for ($i=0; $i < count($data['tarea']) ; $i++)
			{
					$tarea_id        = $data['tarea'][$i][0];
					$tarea           = array(
							'id_ordenservicio' => $idInsertOrden,
							'id_tarea'         => $tarea_id
					);
					if ( ! $this->db->insert('deta_ordenservicio', $tarea) )
					{
							return $this->db->error(); // Has keys 'code' and 'message'
					}
			}

			// ////// guarda Operarios
			if (!empty($data['operario'])) 
			{
					$fechaSist = date('Y-m-d H:i:s');
					for ($i=0; $i < count($data['operario']) ; $i++) 
					{
							$asigUsr["usrId"]     = $data['operario'][$i][1];
							$asigUsr["id_orden"]  = $idInsertOrden;      // id orden servicio
							$asigUsr["fechahora"] = $fechaSist;
							if ( ! $this->db->insert('asignausuario', $asigUsr) )
							{
									return $this->db->error(); // Has keys 'code' and 'message'
							}
					}
			}

			return true;
        
		}
		// borra herramientas de Informe Servicios
		function borrarHerramOrden($id_ot){

			$this->db->select('orden_servicio.valesid');
			$this->db->from('orden_servicio');
			$this->db->where('orden_servicio.id_ot', $id_ot);
			$resp = $this->db->get();
			$valeSalId = $resp->row('valesid');
			// si hay Vale salida
			if ($valeSalId) {
				// borra el detalle de vale salida				
				$this->db->where('valesid', $valeSalId);							
				$response = $this->db->delete('tbl_detavalesalida');
				// borra vale salida
				$this->db->where('valesid', $valeSalId);							
				$response = $this->db->delete('tbl_valesalida');				
				return $response;	
			}else{
				return TRUE;
			}			
		}

		// borra RRHH de Informe de Servicios
		function borrarRecursosOrden($id_ot){
			
			$this->db->select('orden_servicio.id_orden');
			$this->db->from('orden_servicio');
			$this->db->where('orden_servicio.id_ot', $id_ot);
			$resp = $this->db->get();
			$idOrdServ = $resp->row('id_orden');
		
			// si hay orden servicios
			if ($idOrdServ) {
				// borra el detalle de vale salida				
				$this->db->where('id_orden', $idOrdServ);							
				$response = $this->db->delete('asignausuario');
				return $response;
			}else{
				return TRUE;
			}	

		}

		// borra Informe Servicios completo
		function borrarOrden($id_ot){

			$this->db->select('orden_servicio.id_orden');
			$this->db->from('orden_servicio');
			$this->db->where('orden_servicio.id_ot', $id_ot);
			$resp = $this->db->get();
			$idOrdServ = $resp->row('id_orden');

			$this->db->where('id_ordenservicio', $idOrdServ);							
			$response = $this->db->delete('deta_ordenservicio');
			
			if($response){
				$this->db->where('id_ot', $id_ot);							
				$response = $this->db->delete('orden_servicio');
				return $response;
			}else{
				return $response;
			}		

		}

    function getLecturasOrden($id_ot) // Ok FUNCIONANDO BIEN!!!
    {		
			$this->db->select('orden_servicio.horometroinicio,
											orden_servicio.horometrofin,
											orden_servicio.fechahorainicio,
											orden_servicio.fechahorafin
											');
			$this->db->from('orden_servicio');
			$this->db->where('orden_servicio.id_ot', $id_ot);
			$query = $this->db->get();
			if ($query->num_rows()!=0)
			{
					return $query->result_array();
			}
			else
			{   
					return false;
			}   
    }

    function getTareasOrden($id_ot) // Ok FUNCIONANDO BIEN!!!
    {        
        $this->db->select('
            deta_ordenservicio.id_tarea
            ');
        $this->db->from('orden_servicio');
        $this->db->join('deta_ordenservicio', 'deta_ordenservicio.id_ordenservicio = orden_servicio.id_orden');
        $this->db->where('orden_servicio.id_ot', $id_ot);
        $query = $this->db->get();
        if ($query->num_rows()!=0)
        {
            return $query->result_array();
        }
        else
        {   
            return false;
        }   
    }

    function getHerramOrdenes($id_ot) // Ok FUNCIONANDO BIEN!!!
    {		
			$this->db->select('herramientas.herrcodigo,
													herramientas.herrmarca,
													herramientas.herrdescrip
											');
			$this->db->from('orden_servicio');        
			$this->db->join('tbl_valesalida', 'orden_servicio.valesid = tbl_valesalida.valesid');        
			$this->db->join('tbl_detavalesalida', 'tbl_detavalesalida.valesid = tbl_valesalida.valesid');
			$this->db->join('herramientas', 'tbl_detavalesalida.herrId = herramientas.herrId');        
			$this->db->where('orden_servicio.id_ot', $id_ot);
			$query = $this->db->get();
			if ($query->num_rows()!=0)
			{
					return $query->result_array();  
			}
			else
			{   
					return array();
			}   
    }

    function getOperariosOrden($id_orden){
			
			$this->db->select('sisusers.usrName,
												sisusers.usrLastName');
			$this->db->from('asignausuario');        
			$this->db->join('sisusers', 'asignausuario.usrId = sisusers.usrId');        
			$this->db->join('orden_servicio', 'orden_servicio.id_orden = asignausuario.id_orden'); 
			$this->db->where('orden_servicio.id_ot', $id_orden);
			$query = $this->db->get();
			if ($query->num_rows()!=0)
			{
					return $query->result_array();  
			}
			else
			{   
					return array();
			}                
    }

		// devuelve insumos pedidos por id de OT
    function getInsumosPorOT($id_ot){        

			$this->db->select('alm_pedidos_materiales.pema_id, 
												alm_pedidos_materiales.ortr_id , 
												alm_articulos.barcode, alm_articulos.descripcion, 
												alm_pedidos_materiales.fecha,
												alm_pedidos_materiales.estado,
												alm_deta_pedidos_materiales.cantidad');
			$this->db->from('alm_pedidos_materiales');
			$this->db->join('alm_deta_pedidos_materiales', 'alm_pedidos_materiales.pema_id = alm_deta_pedidos_materiales.pema_id');
			$this->db->join('alm_articulos', 'alm_deta_pedidos_materiales.arti_id = alm_articulos.arti_id');
		
			$this->db->where('alm_pedidos_materiales.ortr_id', $id_ot);
			$query = $this->db->get();
		
			if ($query->num_rows()!=0){
					return $query->result_array();
			}else{   
					return array();
			}  

    }




	//Ordenn de trabajo por id
		function getorden($id){

			$this->db->select('orden_trabajo.*, 
												tareas.id_tarea, 
												tareas.descripcion AS tareadescrip, 
												sisusers.usrId, 
												CONCAT(sisusers.usrLastName,", ",sisusers.usrName) AS responsable');
			$this->db->from('orden_trabajo');
			$this->db->join('tareas','tareas.id_tarea  = orden_trabajo.id_tarea', 'left');
			$this->db->join('sisusers','sisusers.usrId  = orden_trabajo.id_usuario_a');
			$this->db->where('id_orden',$id);
			
				$query= $this->db->get();		

				if( $query->num_rows() > 0)
				{
					return $query->result_array();	
				} 
				else {
					return 0;
				}
		}











    function getsolicitudes($data=null){

        $this->db->select('solicitud_reparacion.id_solicitud, 
                            solicitud_reparacion.causa, 
                            solicitud_reparacion.id_equipo');
        $this->db->from('solicitud_reparacion');
        $this->db->where('estado', 'S');
        $query = $this->db->get();

        if ($query->num_rows()!=0)
        {               
            return $query->result_array();
        }
        else
        {
            return array();
        }       
    }

    function getOrdenInactivas(){

        $this->db->select(
                    'orden_servicio.id_orden, 
                    orden_servicio.estado,
                    equipos.id_equipo,
                    orden_servicio.comprobante,
                    orden_servicio.fecha, 
                    equipos.codigo,
                    solicitud_reparacion.id_solicitud,
                    solicitud_reparacion.solicitante, 
                    solicitud_reparacion.f_solicitado,                     
                    solicitud_reparacion.causa');
        $this->db->from('orden_servicio');
        $this->db->join('solicitud_reparacion', 'orden_servicio.id_solicitudreparacion = solicitud_reparacion.id_solicitud');
        $this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
        $this->db->where('orden_servicio.estado','T');
        $query = $this->db->get();

        if ($query->num_rows()!=0)
        {
            return $query->result_array();  
        }
        else
        {   
            return array();
        }  
    }

    function getComponentes($data = null){
        
        $id = $data['id_equipo'];
    
        $this->db->select('componentes.id_componente, componentes.descripcion');
        $this->db->from('componentes');
        $this->db->join('componenteequipo', 'componentes.id_componente = componenteequipo.id_componente');
        $this->db->join('equipos', 'componenteequipo.id_equipo = equipos.id_equipo'); 
        $this->db->where('equipos.id_equipo', $id);
        $query = $this->db->get();      
        
        return $query->result_array();                
    }

    function getContratistas()
    {
        $this->db->select('id_contratista, nombre');
        $this->db->from('contratistas');
        $query = $this->db->get();
        return $query->result_array();
    }

    function getArticulos(){
        $query = $this->db->query("SELECT articles.artId, articles.artBarCode,articles.artDescription FROM articles");
        $i=0;
        foreach ($query->result() as $row){

        	$insumos[$i]['value'] = $row->artId;
            $insumos[$i]['label'] = $row->artBarCode;
            $insumos[$i]['descripcion'] = $row->artDescription;
            $i++;
        }
        return $insumos;
    }

    // function getInsumOrdenes($data){        

    //     $id_orden = $data['id_orden'];

    //     $this->db->select(
    //                 'deta_ordeninsumos.cantidad,
    //                 articles.artDescription AS descripcion,
    //                 abmdeposito.depositodescrip AS deposito');        
    //     $this->db->from('orden_insumos');
    //     $this->db->join('orden_servicio', 'orden_servicio.id_orden_insumo = orden_insumos.id_orden');        
    //     $this->db->join('deta_ordeninsumos', 'deta_ordeninsumos.id_ordeninsumo = orden_insumos.id_orden');        
    //     $this->db->join('tbl_lote', 'deta_ordeninsumos.loteid = tbl_lote.loteid');        
    //     $this->db->join('articles','articles.artId = tbl_lote.artId');
    //     $this->db->join('abmdeposito','abmdeposito.depositoId = tbl_lote.depositoid');
    //     $this->db->where('orden_servicio.id_orden', $id_orden);

    //     $query = $this->db->get();

    //     if ($query->num_rows()!=0)
    //     {
    //         return $query->result_array();  
    //     }
    //     else
    //     {   
    //         return array();
    //     }   
    // }

    function getDepositos(){

        $query = $this->db->query("SELECT `depositoId`, `depositodescrip` FROM `abmdeposito`");
        $depositos = $query->result_array();

        return $depositos;
    }



    function getTareas(){      

        $query = $this->db->query("SELECT `id_tarea`, `descripcion` FROM `tareas`");
        $tareas = $query->result_array();
        
        return $tareas;
    }



    function validaOperarios($data){
        
			$query = $this->db->query("SELECT CONCAT(`usrLastName`,', ',`usrname`)  as `operario` FROM `sisusers`");
			$recurso = (string)$data['operario'];
			
			foreach($query->result_array() as $row){                
						
					$usuario = (string)$row['operario'];
					
					if (strcasecmp ($usuario , $recurso) == 0) { 
							$resp['resp'] = true;                
							return $resp;  
					}  
					
			}
			$resp['resp'] = false;
			return $resp;
    }



    function getSolEquipCausas($data){

        $id_solicitud = $data['id_solic'];
        $this->db->select('solicitud_reparacion.id_solicitud, solicitud_reparacion.causa, solicitud_reparacion.id_equipo ');
        $this->db->from('solicitud_reparacion');       
        $this->db->where('solicitud_reparacion.id_solicitud', $id_solicitud);
        $query = $this->db->get();

        if ($query->num_rows()!=0)
        {
            return $query->result_array();  
        }
        else
        {   
            return array();
        }  
    }

    function getLotesActivos($depos){  // devuelve id lote y cant s/dep, estado e id de articulo
        
        $depo = $depos['depoid'];
        $insum = $depos['id_insum'];
        
        $this->db->select('loteid, cantidad');
        $this->db->from('tbl_lote');
        $this->db->where('lotestado', 'AC');
        $this->db->where('depositoid', $depo);
        $this->db->where('artId', $insum);
                                
        $query = $this->db->get();               
        
        foreach ($query->result() as $row){ 
          
            $datos_lote['id_lote'] = $row->loteid;
            $datos_lote['cantidad'] = $row->cantidad;           
        } 

        return $datos_lote;                       
    }
    ////// Cierra Informe de Servicios
    function setEstados($data){
        
        $id_ordenservicio = $data['id_orden'];       
        $estado['estado'] = 'T';
        
        $this->db->where('id_orden', $id_ordenservicio);
        $this->db->update('orden_servicio', $estado); 

        // cierra Solicitud de Servicio
        // $this->db->select('orden_servicio.id_solicitudreparacion');
        // $this->db->from('orden_servicio');
        // $this->db->where('orden_servicio.id_orden', $id_ordenservicio);
        // $query= $this->db->get();

        // foreach ($query->result() as $row){                            
        //     $id_solicitud =  $row->id_solicitudreparacion;       
        // }

        // $this->db->where('id_solicitud', $id_solicitud);
        // $this->db->update('solicitud_reparacion', $estado);        
    }


}

