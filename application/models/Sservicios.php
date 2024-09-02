<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sservicios extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	/* FUNCIONES ORIGINALES DE ASSET	*/
	// Trae solicitudes en estado en Curso	
	function getServiciosList($showConformes){
		$userdata = $this->session->userdata('user_data');
		$usrId    = $userdata[0]['usrId'];   
		$grupoId  = $userdata[0]["grpId"];
		$empId    = $userdata[0]['id_empresa'];
		
		// $this->db->select('solicitud_reparacion.*,
		// 									equipos.codigo as equipo,
		// 									sector.descripcion as sector, 
		// 									grupo.descripcion as grupo,
		// 									equipos.ubicacion');
		// $this->db->from('solicitud_reparacion');
		// $this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
		// $this->db->join('sector', 'equipos.id_sector = sector.id_sector');
		// $this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo', 'left');
		// $this->db->where('solicitud_reparacion.estado !=', 'AN');
		// //$this->db->or_where('solicitud_reparacion.estado', 'S');
		// $this->db->where('solicitud_reparacion.id_empresa', $empId);

		$this->db->select('solicitud_reparacion.*,
											equipos.codigo as equipo,
											sector.descripcion as sector, 
											grupo.descripcion as grupo,
											equipos.ubicacion,
											orden_trabajo.fecha_terminada,
											orden_trabajo.fecha_inicio as "f_inicio",
											orden_trabajo.f_asignacion,
											solicitud_reparacion.f_solicitado,
											orden_trabajo.case_id,
											orden_trabajo.id_usuario_a,
											sisusers.usrName as mantenedor');
		$this->db->from('solicitud_reparacion');
		$this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
		$this->db->join('sector', 'equipos.id_sector = sector.id_sector');
		$this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo', 'left');
		$this->db->join('orden_trabajo', 'solicitud_reparacion.case_id = orden_trabajo.case_id', 'left');
		$this->db->join('sisusers', 'orden_trabajo.id_usuario_a = sisusers.usrId', 'left');
		$this->db->where('solicitud_reparacion.estado !=', 'AN');
		if ($showConformes == 'false') {
			$this->db->where('solicitud_reparacion.estado !=', 'CN');
		}
		$this->db->where('solicitud_reparacion.id_empresa', $empId);
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

	function getEquipoSector($idequipo){
		$this->db->select('A.codigo as equipo,A.descripcion as descripcion,B.descripcion as sector, A.id_area as area, A.id_proceso as proceso');
		$this->db->from('equipos as A');
		$this->db->join('sector as B', 'B.id_sector=A.id_sector');
		$this->db->where('A.id_equipo', $idequipo);
		$query = $this->db->get()->result();
		return $query;
	}

		// Elimina solicitud - Listo
		function elimSolicitudes($id){
			$estado = array(
							'estado' => 'AN'		        
					);

			$this->db->where('id_solicitud', $id);
			$result = $this->db->update('solicitud_reparacion', $estado);
		}		
		// Trae equipos segun sector de empresa logueada
		function getEquipSectores($data = null){
			$id = $data["id_sector"];
			$this->db->select('equipos.id_equipo, equipos.codigo');
					$this->db->from('equipos');
					$this->db->where('equipos.estado', 'AC');
					$this->db->where('equipos.id_sector', $id);
					$query = $this->db->get();
			if ($query->num_rows()!=0)
			{
				$i = 0;
				foreach ($query->result() as $row)
				{   
					$data2[$i]["descripcion"] = $row->codigo;
					$data2[$i]["id_equipo"]   = $row->id_equipo;
					$i++;
				}		
						return $data2;
			}	    
		}	

		function getSSs($idSS)
		{
			$this->db->select('solicitud_reparacion.*, CONCAT(sisusers.usrName, " ", sisusers.usrLastName) as nombre_usuario');
			$this->db->from('solicitud_reparacion');
			$this->db->join('sisusers', 'solicitud_reparacion.id_usuario_eliminada = sisusers.usrId', 'left');
			$this->db->where('solicitud_reparacion.id_solicitud', $idSS);

			$query = $this->db->get()->result();
			return $query;
		}
	
		// Trae sectores por empresa logueada - Listo
		function getSectores(){
			$userdata = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];  

			$this->db->select('sector.id_Sector, sector.descripcion');
				$this->db->from('sector');    	
				$this->db->where('sector.id_empresa', $empId);
				$this->db->where('sector.estado !=', 'AN');
			$query = $this->db->get();

			$i     = 0;
					foreach ($query->result() as $row)
					{
						$sectores[$i]['label'] = $row->descripcion;
							$sectores[$i]['value'] = $row->id_Sector;
							$i++;
					}
					return $sectores;
			}

		//Trae datos para impresion de solicitud - Listo	
		function getsolImps($id){
			
			$this->db->select('solicitud_reparacion.solicitante, 
								solicitud_reparacion.f_solicitado, 
								solicitud_reparacion.f_sugerido, 
								solicitud_reparacion.hora_sug, 
								solicitud_reparacion.causa, 
								equipos.codigo, 
								equipos.ubicacion, 
								equipos.id_sector, 
								equipos.id_grupo, 
								grupo.descripcion AS degr, 
								sector.descripcion AS sec');
				$this->db->from('solicitud_reparacion');
				$this->db->join('equipos', 'equipos.id_equipo = solicitud_reparacion.id_equipo');
				$this->db->join('grupo', 'grupo.id_grupo=equipos.id_grupo');
				$this->db->join('sector', 'sector.id_sector=equipos.id_sector');
				$this->db->where('solicitud_reparacion.id_solicitud', $id);
				$query= $this->db->get();
				
			foreach ($query->result_array() as $row){		
						
						$data['f_solicitado'] = $row['f_solicitado'];
						$data['solicitante'] = $row['solicitante'];
						$data['causa'] = $row['causa'];
						$data['hora_sug'] = $row['hora_sug'];
						$data['codigo'] = $row['codigo'];
						$data['ubicacion'] = $row['ubicacion'];
						$data['degr'] = $row['degr'];
						$data['sec'] = $row['sec'];
					
					return $data; 
			}
		}
		// Trae usuarios para solicitantes de la SServicios
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
		// Guarda solicitud de Servicio - Listo
		function setservicios($data = null){
			if($data == null)
			{
				return false;
			}
			else
			{			
				$equipId  = $this->input->post('equipo');//
				$falla    = $this->input->post('falla');//
				$userdata = $this->session->userdata('user_data');
				$empId    = $userdata[0]['id_empresa'];

				//solicitud de servicio desde mantenimiento autonomo
				if(!$equipId) $equipId = $this->input->post('id_equipo');

				$userdata = $this->session->userdata('user_data');
				$usrId    = $userdata[0]['usrId'];     // guarda usuario logueado
				$usrName  = $userdata[0]['usrName'];
				$insert   = array(
					'f_solicitado' => date('Y-m-d H:i:s'), 
					'id_equipo'    => $equipId,
					'estado'       => 'S',	// graba estado Solicitado, cambia a 'C' en Ord Serv
					'usrId'        => $usrId,
					'solicitante'  => $usrName,
					'causa'        => $falla,
					'foto'         => 'assets/files/orders/sinImagen.jpg',
					'id_empresa'   => $empId
				);
				$this->db->insert('solicitud_reparacion', $insert);

				$idSolServicios = $this->db->insert_id();
				return $idSolServicios;

			}
		}	
	/* 	./ FUNCIONES ORIGINALES DE ASSET	*/

			// guarda adjunto en Edicion y en SS nueva
			function setAdjunto($adjunto,$ultimoId){	
				$this->db->where('id_solicitud', $ultimoId);
				$query = $this->db->update("solicitud_reparacion",$adjunto);
				return $query;
			}

			public function eliminar($id)
			{
				$this->db->where('id_solicitud', $id);
				return $this->db->delete('solicitud_reparacion');
			}

/* INTEGRACION CON BPM */
	// trae tareas STD para llenar select por empresa logueada
		function getTareasStandar(){

			$userdata = $this->session->userdata('user_data');
   $empId = $userdata[0]['id_empresa'];
			$this->db->select('tareas.id_tarea,tareas.descripcion');		
			$this->db->from('tareas');			
			$this->db->where('tareas.estado !=', 'AN');
			$this->db->where('tareas.id_empresa', $empId);
			$this->db->where('tareas.visible', 1);
			$query= $this->db->get();

			if ($query->num_rows()!=0){
				return $query->result_array();	
			}else{
				return array();
			}
		}
	// Lanza proceso en BPM
	// 	function lanzarProcesoBPM($param)
	// 	{
	// 		$resource = 'API/bpm/process/';
	// 		$url = BONITA_URL.$resource;
	// 		$com = '/instantiation';			
	// 		$caseId = file_get_contents($url.BPM_PROCESS_ID.$com, false, $param);
	// 		$response['responsecabecera'] = $this->parseHeaders( $http_response_header );
	// 		$response['caseId'] = $caseId;
	// 		return $response;
	// 	}

	// // toma la respuesta del server y devuelve el codigo de respuesta solo
	// 	function parseHeaders( $headers ){
	// 		$head = array();
	// 		foreach( $headers as $k=>$v ){
	// 			$t = explode( ':', $v, 2 );
	// 			if( isset( $t[1] ) )
	// 				$head[ trim($t[0]) ] = trim( $t[1] );
	// 			else{
	// 				$head[] = $v;
	// 				if( preg_match( "#HTTP/[0-9\.]+\s+([0-9]+)#",$v, $out ) )
	// 					$head['reponse_code'] = intval($out[1]);
	// 			}
	// 		}
	// 		return $head;
	// 	}

	// guarda CaseId en solic de servicios
		function setCaseId($caseId,$id_solServicio){			
			
			$caseId = array(
				'case_id' => $caseId		        
			);
			$this->db->where('id_solicitud', $id_solServicio);
			return $this->db->update('solicitud_reparacion', $caseId);
		}	

/*	./ INTEGRACION CON BPM */


//////// no vistas

	// Trae solicitudes en estado Terminado
	function get_SolicTerminadas(){		
		
		$this->db->select('solicitud_reparacion.*,
			equipos.descripcion as equipo, 
			sector.descripcion as sector, 
			grupo.descripcion as grupo, 
			equipos.ubicacion');
		$this->db->from('solicitud_reparacion');
		$this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
		$this->db->join('sector', 'equipos.id_sector = sector.id_sector');
		$this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo');				
		$this->db->where('solicitud_reparacion.estado', 'T');
		$this->db->order_by('solicitud_reparacion.id_solicitud','DESC');
		$query= $this->db->get();

		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{
			return false;
		}
	}

	// Activa solicitudes terminadas.
	function activSolicitudes($data){ 

		$this->db->trans_start();   

			$id_solicitud = $data['id_solicitud']; 	

	        $estado['estado'] = 'S';
	        $this->db->where('id_solicitud', $id_solicitud);
	        $this->db->update('solicitud_reparacion', $estado);

        $this->db->trans_complete();

		if ($this->db->trans_status() === FALSE)
		{
		 return false;  
		} else{
		 return true;
		}  
	}

	// Guarda confirmacion de Solicitud de Servicio, por usr que la hizo
	function confSolicitudes($data){
		
		$id = $data['id_sol'];
		$fecha = $data['fecha_conformidad'];
		$obs = $data['observ_conformidad'];		
		
		$datos = array(
		        'fecha_conformidad' => $fecha,
		        'observ_conformidad' => $obs,
		        'estado' => 'T'		        
				);
		
		$this->db->trans_start();
			$this->db->where('id_solicitud', $id);
			$this->db->update('solicitud_reparacion', $datos);
		$this->db->trans_complete();

		if ($this->db->trans_status() === FALSE)
		{
			return false;  
		}
		else{
		    
			return true;
		}
	}	

	function getequipos()
	{
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];     // guarda usuario logueado

		$this->db->select('equipos.id_equipo,
					equipos.codigo,
					equipos.descripcion');
    	$this->db->from('equipos');
    	$this->db->where('equipos.estado !=', 'AN');
    	$this->db->where('equipos.id_empresa', $empId);
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
	

	/**
	*Genera lista pedido de trabajo paginados
	* @param integer;integer;string start donde comienza el listado; length cantidad de registros; search cadena a buscar
	* @return array listado de solicitudes paginada, filtrada por empresa y la cantidad
	**/
	public function solicitudespaginadas($start, $length, $search, $ordering, $showConformes) {
		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];
	
		// Total de registros
		$this->db->select('COUNT(*) as count');
		$this->db->from('solicitud_reparacion');
		$this->db->where('solicitud_reparacion.id_empresa', $empId); // Aquí califica id_empresa con el nombre de la tabla
	
		if ($showConformes == 'false') {
			$this->db->where('solicitud_reparacion.estado !=', 'CN');
		}
	
		if (!empty($search)) {
			// Añade los JOINs solo si hay criterio de búsqueda
			$this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo', 'inner');
			$this->db->join('sector', 'equipos.id_sector = sector.id_sector', 'inner');
			$this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo', 'left');

			// Convierte la búsqueda a minúsculas y aplica LIKE
			$this->db->group_start();
			$this->db->like('LOWER(solicitud_reparacion.id_solicitud)', strtolower($search));
			$this->db->or_like('LOWER(solicitud_reparacion.solicitante)', strtolower($search));
			$this->db->or_like('LOWER(equipos.codigo)', strtolower($search));
			$this->db->or_like('LOWER(sector.descripcion)', strtolower($search));
			$this->db->or_like('LOWER(grupo.descripcion)', strtolower($search));
			$this->db->group_end();
		}
	
		$countQuery = $this->db->get();
		$countResult = $countQuery->row();
		$totalFiltered = $countResult->count;
		//fin Total de registros

		//completado de datos
		$this->db->select('solicitud_reparacion.*, equipos.codigo AS equipo, sector.descripcion AS sector, grupo.descripcion AS grupo, equipos.ubicacion, orden_trabajo.fecha_terminada, orden_trabajo.fecha_inicio AS f_inicio, orden_trabajo.descripcion, orden_trabajo.f_asignacion, solicitud_reparacion.f_solicitado, COALESCE(orden_trabajo.case_id, solicitud_reparacion.case_id) as case_id, orden_trabajo.id_orden, orden_trabajo.id_usuario_a, sisusers.usrName AS mantenedor');
		$this->db->from('solicitud_reparacion');
		$this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo', 'inner');
		$this->db->join('sector', 'equipos.id_sector = sector.id_sector', 'inner');
		$this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo', 'left');
		$this->db->join("(SELECT case_id, MAX(id_orden) AS max_id FROM orden_trabajo GROUP BY case_id) ot_max", 'solicitud_reparacion.case_id = ot_max.case_id', 'left');
		$this->db->join('orden_trabajo', 'ot_max.max_id = orden_trabajo.id_orden', 'left');
		$this->db->join('sisusers', 'orden_trabajo.id_usuario_a = sisusers.usrId', 'left');
		$this->db->where('solicitud_reparacion.id_empresa', $empId); 
	
		if ($showConformes == 'false') {
			$this->db->where('solicitud_reparacion.estado !=', 'CN');
		}
	
		if (!empty($search)) {
			$this->db->group_start();
			$this->db->like('LOWER(solicitud_reparacion.id_solicitud)', strtolower($search));
			$this->db->or_like('LOWER(solicitud_reparacion.solicitante)', strtolower($search));
			$this->db->or_like('LOWER(equipos.codigo)', strtolower($search));
			$this->db->or_like('LOWER(sector.descripcion)', strtolower($search));
			$this->db->or_like('LOWER(grupo.descripcion)', strtolower($search));
			$this->db->group_end();
		}
	
		if (!empty($ordering)) {
			foreach ($ordering as $order) {
				$column = $order['column'];
				$dir = $order['dir'];
				$this->db->order_by($column, $dir);
			}
		}
	
		$this->db->limit($length, $start);
		$data_query = $this->db->get();
		$result = $data_query->result_array();
	
		return array(
			'datos' => $result,
			'numDataTotal' => $totalFiltered,
			'totalData' => $totalData 
		);
	}

	public function eliminar_solicitud($id, $id_usuario, $motivo)
	{
		$data = array(
			'estado' => 'EL',
			'id_usuario_eliminada' => $id_usuario,
			'fecha_eliminada' => date('Y-m-d H:i:s'),
			'motivo_eliminada' => $motivo
		);

		$this->db->where('id_solicitud', $id);
		return $this->db->update('solicitud_reparacion', $data);
	}

	public function eliminar_orden_trabajo($id, $id_usuario, $motivo)
	{
		$data = array(
			'estado' => 'EL',
			'id_usuario_eliminada' => $id_usuario,
			'fecha_eliminada' => date('Y-m-d H:i:s'),
			'motivo_eliminada' => $motivo
		);

		$this->db->where('id_solicitud', $id);
		return $this->db->update('orden_trabajo', $data);
	}
	

	public function validaUsuarioSolicitantes($id_usuario, $empresaId)
	{
		$this->db->select('sisusers.usrId');
		$this->db->from('sisusers');
		$this->db->join('usuarioasempresa', 'usuarioasempresa.usrId = sisusers.usrId');
		$this->db->join('sisgroups', 'sisgroups.grpId = usuarioasempresa.grpId');
		$this->db->where('usuarioasempresa.empresaid', $empresaId);
		$this->db->where('usuarioasempresa.estado', 'AC');
		$this->db->where('sisgroups.grpName', 'Solicitante');
		$this->db->where('sisusers.usrId', $id_usuario); 
		$query = $this->db->get();

		if ($query->num_rows() > 0) {
			return true;
		} else {
			return false;
		}

	}

	 /**
	* Obtengo la informacion relacionada al proceso guardada en pro.procesos
	* @param $processname (se obtiene de la data del usuario processname que se le carga desde el menú)
	* @return array datos del proceso asociado
	*/
    public function procesos(){
        $proccessname = $this->session->userdata('proccessname');

        $resource = "/proceso/nombre/$proccessname/empresa/" . empresa();

        $url = REST_PRO . $resource;
        
        $array = $this->rest->callApi('GET', $url);

        return json_decode($array['data']);
    }
	
}	
