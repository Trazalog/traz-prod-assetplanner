<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tareas extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}
/* TAREAS ASSET ORIGINALES (TAREAS ESTANDAR)*/
	function Listado_Tareas()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$this->db->where('estado', 'AC');
		$this->db->where('tareas.id_empresa', $empresaId);
		$query = $this->db->get('tareas');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Tareas($id)
	{
		$this->db->where('id_tarea', $id);
		$query = $this->db->get('tareas');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();  
		}
	}

	function Guardar_Tareas($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 	
		$query              = $this->db->insert("tareas", $data);
		return $query;
	}

	function Modificar_Tareas($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 	
		$query              =$this->db->update('tareas', $data, array('id_tarea' => $data['id_tarea']));
		return $query;
	}

	function Eliminar_Tareas($id)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('id_tarea', $id);
		$query=$this->db->update('tareas');
		return $query;
	}
/* ./ TAREAS ASSET ORIGINALES (TAREAS ESTANDAR)*/	

/* INTEGRACION CON BPM */
	
/*********** funciones nuevas de asset */
	//devuelve array con subtareas 
	function getSubtareaseEstandar($nomTarea){
		
		$idTarea = $this->getIdTareaSTD($nomTarea);
		$subtareas= array();

		if($idTarea !=0){
			$subtareas = $this->getSubtareas($idTarea);
			return $subtareas;
		}else{
			return $subtareas;
		}
	}
	// devuelve id de tarea estandar por nombre
	function getIdTareaSTD($nomTarea){

		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];

		$this->db->select('tareas.id_tarea');
		$this->db->from('tareas');
		$this->db->where('tareas.descripcion',$nomTarea);
		$this->db->where('tareas.id_empresa',$empId);
		$query = $this->db->get();
			if ($query->num_rows()!=0){
				return $query->row('id_tarea');	
			}else{
				return 0;
			}
	}
	// devuelve subtareas por 
	function getSubtareas($idTareaSTD){
		$this->db->select('asp_subtareas.id_subtarea,
											asp_subtareas.tareadescrip,
											asp_subtareas.id_tarea,											
											asp_subtareas.fecha,
											asp_subtareas.duracion_prog,
											asp_subtareas.estado,											
											asp_subtareas.form_asoc');
		$this->db->from('asp_subtareas');
		$this->db->where('asp_subtareas.id_tarea',$idTareaSTD);
		$query = $this->db->get();
		if ($query->num_rows()!=0){
			return $query->result_array();	
		}else{
			return 0;
		}
	}
	function cambioEstadoSubtarea($idsubtarea,$estado){
		$this->db->where('FOCO_ID', $key);
		$response = $this->db->update('frm_formularios_completados', $datos);
		return $response;
	}


	// trae tareas por ID de usuario
	function getTareas($param){
		
		$userdata = $this->session->userdata('user_data');
		$usrId= $userdata[0]["usrId"];		
		//$tareas = file_get_contents(BONITA_URL.'API/bpm/humanTask?p=0&c=10&f=user_id%3D5', false, $param);
		$resource = 'API/bpm/humanTask?p=0&c=1000&f=user_id%3D';
		$url = BONITA_URL.$resource.$usrId;
		$tareas = file_get_contents($url, false, $param);
		
		$tar = json_decode($tareas,true);
	
		return $tar;
		// TODO: AGREGAR DESDE ACA LOS DATOS A MOSTRAR DE LA ORDEN TRABAJO
		//$tar = $this->AgregarDatos($tareas);
		//return $tar;
	}
	// agrega datos de pedido de trabajo desde la base local 
	function AgregarDatos($tareas){
		
		$tar = json_decode($tareas,true);
		foreach ($tar as $key => $value) {

			$caseId = $tar[$key]["caseId"];
			$datos = $this->getDatPedidoTrabajo($caseId);
			$tar[$key]['petr_id'] = $datos[0]['petr_id'];
			$tar[$key]['cod_interno'] = $datos[0]['cod_interno'];
		}
		return $tar;
	}
	// trae cod interno de pedido trabajo en funcion del caseId de BPM
	function getDatPedidoTrabajo($caseId){
		$this->db->select('trj_pedido_trabajo.petr_id,
							trj_pedido_trabajo.cod_interno');
		$this->db->from('trj_pedido_trabajo');
		$this->db->where('trj_pedido_trabajo.bpm_id',$caseId);

		$query = $this->db->get();

		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
	}
	//devuelve datos de tarea por nombre 
	function getDatosTarea($nombre){
		$this->db->where('descripcion',$nombre);
		return $this->db->get('tareas')->result_array()[0];
	}
	//TODO: TRAER DESDE EL BPM
	// Devuelve el id de tareas de trazaj correspond al id_tarea bonita para detatareas
	function getIdTareaTraJobs($idBonita,$param){

		$urlResource = 'API/bpm/activityVariable/';
		$idListEnBPM = '/trazajobsTaskId';

		try {
			$idTJ = @file_get_contents(BONITA_URL.$urlResource.$idBonita.$idListEnBPM , false, $param);
			$idTJobs = json_decode($idTJ,true); //sin true no se puede acceder
			$id_listarea = $idTJobs["value"];
		} catch (Exception $e) {
			echo 'Excepción capturada: ',  $e->getMessage(), "\n";
			$id_listarea = 0;
		}

		return $id_listarea;
	}
	// Trae los datos de la tarea desde BPM
	function getDatosBPM($idTarBonita,$param){

		// $response = file_get_contents(BONITA_URL.'API/bpm/humanTask/54', false, $param);	
		$urlResource = BONITA_URL.'API/bpm/humanTask/';
		$data = file_get_contents($urlResource.$idTarBonita , false, $param);
		return $data;
	}
	// Devuelve id de OT por id de BPM
	function getIdOtPorIdBPM($idTarBonita){

		$this->db->select('orden_trabajo.id_orden');
		$this->db->from('orden_trabajo');
		$this->db->where('orden_trabajo.bpm_task_id_plan', $idTarBonita);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
			return $query->row('id_orden');
		}else{
			return 0;
		}
	}

	//devuelve el id de tarea estandar asociada a listarea
	function getTarea_idListarea($id_listarea){

		$this->db->select('tbl_listarea.id_tarea');
		$this->db->from('tbl_listarea');
		$this->db->where('tbl_listarea.id_listarea', $id_listarea);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('id_tarea');
	 	}else{
	 		return false;
	 	}
	}
	// devuelve id de equipo por id Sol Servicios
	function getIdEquipoPorIdSolServ($id_SS){
		
		$this->db->select('solicitud_reparacion.id_equipo');
		$this->db->from('solicitud_reparacion');
		$this->db->where('solicitud_reparacion.id_solicitud', $id_SS);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('id_equipo');
	 	}else{
	 		return false;
	 	}
	}

	// devuelve id de equipo por id OT
	function getIdEquipoPorIdOT($id_OT){
		
		$this->db->select('orden_trabajo.id_equipo');
		$this->db->from('orden_trabajo');
		$this->db->where('orden_trabajo.id_orden', $id_OT);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->row('id_equipo');
	 	}else{
	 		return false;
	 	}
	}
	
	/*FORMULARIOS */
		// Devuelve form asociado a una tarea std
		function getIdFormPorIdTareaSTD($idTareaStd){

				$this->db->select('tareas.form_asoc');
				$this->db->from('tareas');
				$this->db->where('tareas.id_tarea', $idTareaStd);
				$query = $this->db->get();

				if ($query->num_rows()!=0){
					return $query->row('form_asoc');
				}else{
					return 0;
				}
		}
		// Comprueba si hay form guardado asoc a id de orden y de tarea
		function getEstadoForm($bpm_task_id, $idForm){
			
			$this->db->select('frm_formularios_completados.LITA_ID');
			$this->db->from('frm_formularios_completados');
			$this->db->where('frm_formularios_completados.LITA_ID', $bpm_task_id);
			$this->db->where('frm_formularios_completados.FORM_ID', $idForm);			
			$query = $this->db->get();

			if ($query->num_rows()>0){
				return true;
			}else{
				return false;
			}
		}
		
		// Guarda la configuracion inicial del formulario
		function setFormInicial($bpm_task_id,$idFormAsoc,$ot_id) { //$id_listarea){

			$userdata = $this->session->userdata('user_data');
			$usrId = $userdata[0]['usrId'];     // guarda usuario logueado
			$empId = $userdata[0]['id_empresa']; 
			$i=1	;
			$dat= array();
			//	instancia form y devuelve id  para relacionar form con OT 
			//	en form_completados(desp se toca frm_instanciasform)
			$idInstanciaForm = $this->instanciarForm($ot_id);

			// Trae la info del form sin valores validos desp se actualiza al guardar
			$form = $this->getFormInicial($idFormAsoc); 

			// Agrego id de usuario y demas datos al array para insertar
			foreach ($form as $key) {
				$key['USUARIO'] = $usrId;
				$key['LITA_ID'] = $bpm_task_id; //$id_listarea;
				$key['INFO_ID'] = $idInstanciaForm;//  
				$key['ORDEN'] = $i;
				$key['ID_EMPRESA'] = $empId; // guarda id de empresa logueada
				$i++;
				$dat[$i] =  $key;
			}

			$response = $this->db->insert_batch('frm_formularios_completados', $dat);

			return $idInstanciaForm;		
		}

		

		// Trae configuracion de form inicial para guardar en frm_frm_completados
		function getFormInicial($idFormAsoc){

			////  ID DE EMPRESA PARA CLOUD
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa'];

			$sql = "SELECT	
					form.form_id AS FORM_ID,
					form.nombre AS FORM_NOMBRE,
					form.fec_creacion AS FEC_CREACION,
					cate.NOMBRE AS CATE_NOMBRE,						
					grup.NOMBRE AS GRUP_NOMBRE,
					tida.NOMBRE AS TIDA_NOMBRE,						
					valo.NOMBRE AS VALO_NOMBRE,						
					valo.ORDEN										
					FROM
					frm_formularios form, 
					frm_categorias cate, 
					frm_grupos grup ,  
					frm_tipos_dato tida,
					frm_valores valo
					where FORM.FORM_ID = CATE.FORM_ID 
					AND CATE.CATE_ID = GRUP.CATE_ID 
					AND GRUP.GRUP_ID = VALO.GRUP_ID 
					AND TIDA.TIDA_ID = VALO.TIDA_ID
					AND FORM.FORM_ID = $idFormAsoc						
					ORDER BY cate.ORDEN,grup.ORDEN,valo.ORDEN
					AND FORM.ID_EMPRESA = $empId";

			$query= $this->db->query($sql);

			if($query->num_rows()>0){
					return $query->result_array();
				}
				else{
					return false;
				}
		}

		// instancia el form inicial relacionandolo con la OT
		function instanciarForm($ot_id){

			$data['ortra_id'] = $ot_id;
			$this->db->insert('frm_instancias_formulario',$data);
			return $idInstanciaForm = $this->db->insert_id();
		}

		// trae instancias de form guardado por id de OT
		function getInstaciasForm($id_OT){
			
			$this->db->select('frm_instancias_formulario.*');
			$this->db->from('frm_instancias_formulario');
			$this->db->where('ortra_id',$id_OT);
			$query = $this->db->get();			
			$i=0;
			foreach ($query->result() as $row){
        $inst[$i] = $row->info_id;				   
				$i++;    
			}
			return $inst;
		}
		// Trae form para dibujar pantalla (agregar where de id de form)
		function get_form($bpm_task_id,$idFormAsoc){

			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa']; 
			$sql = "SELECT foco.FOCO_ID AS idValor,
						foco.FORM_ID,
						foco.FORM_NOMBRE,
						'' AS habilitado,
						foco.FEC_CREACION,
						foco.CATE_NOMBRE AS nomCategoria,
						'' AS idCategoria,
						foco.GRUP_NOMBRE AS nomGrupo,
						foco.TIDA_NOMBRE AS nomTipoDatos,
						'' AS idGrupo,
						foco.VALO_NOMBRE AS nomValor,
						foco.TIDA_ID,
						foco.VALOR AS valDefecto,
						'' AS LONGITUD,
						'' AS PISTA,
						foco.VALO_ID,
						foco.OBLIGATORIO as obligatorio,
						foco.ORDEN
						FROM
						frm_formularios_completados foco
						WHERE foco.FORM_ID = $idFormAsoc
						AND foco.INFO_ID = $bpm_task_id
						AND foco.ID_EMPRESA = $empId
						ORDER BY foco.ORDEN";

			$query= $this->db->query($sql);

			if($query->num_rows()>0){
					return $query->result_array();
				}
				else{
					return false;
				}
		}
		// valida campos obligatorios en form generico
			// function ValidarObligatorios($form_id,$id_OT){
			// 	$this->db->select('count(*)=0 as result');
			// 	$this->db->from('frm_formularios_completados');
			// 	$this->db->join('frm_instancias_formulario', 'frm_instancias_formulario.info_id = frm_formularios_completados.INFO_ID');
			// 	$this->db->where('frm_instancias_formulario.ortra_id ',$id_OT);
			// 	$this->db->where('FORM_ID',$form_id);			
			// 	$this->db->where('frm_formularios_completados.OBLIGATORIO',true);
			// 	$this->db->where('frm_formularios_completados.VALIDADO',false);
			// 	return $this->db->get()->result_array()[0];
			// }
		
		function validarCamposObligatorios($idForm,$idOT){
			
			$this->db->select('count(*) > 0 AS result');
			$this->db->from('frm_formularios_completados');
			$this->db->join('frm_instancias_formulario', 'frm_instancias_formulario.info_id = 																				frm_formularios_completados.INFO_ID');
			$this->db->where('frm_instancias_formulario.ortra_id', $idOT);
			$this->db->where('FORM_ID',$idForm);
			$this->db->where('frm_formularios_completados.OBLIGATORIO', TRUE);
			$this->db->where('frm_formularios_completados.VALIDADO', FALSE);
			$query = $this->db->get();
			return $query->row('result');
		}
		
		
		
		
		// Arma array p/ insertar en frm_formularios_completados por focoId
		function getDatos($focoId){
			//dump($focoId, 'en getdatos: ');
			$this->db->select('frm_formularios_completados.*');
			$this->db->from('frm_formularios_completados');
			$this->db->where('frm_formularios_completados.FOCO_ID',$focoId);
			$query= $this->db->get();

			foreach ($query->result_array() as $row){
				$response['FORM_ID'] = $row['FORM_ID'];
				$response['FORM_NOMBRE'] = $row['FORM_NOMBRE'];
				$response['CATE_NOMBRE'] = $row['CATE_NOMBRE'];
				$response['GRUP_NOMBRE'] = $row['GRUP_NOMBRE'];
				$response['VALO_NOMBRE'] = $row['VALO_NOMBRE'];
				$response['TIDA_NOMBRE'] = $row['TIDA_NOMBRE'];
							$response['VALOR'] = $row['VALOR'];
			}

			return $response;
		}
		// Inserta datos de Form en frm_formularios_completados
		function UpdateForm($datos,$key){

			$this->db->where('FOCO_ID', $key);
			$response = $this->db->update('frm_formularios_completados', $datos);
			return $response;
		}
	/*	./ FORMULARIOS */	

	// Trae id de Ped de Trabajo segun CaseId
	function getIdPedTrabajo($caseId){
		$this->db->select('trj_pedido_trabajo.petr_id,trj_pedido_trabajo.cod_interno');
		$this->db->from('trj_pedido_trabajo');
		$this->db->where('trj_pedido_trabajo.bpm_id', $caseId);

		$query = $this->db->get();

		if ($query->num_rows()!=0){
			return $query->result_array();
			//return $query->row('petr_id');
	 	}else{
	 		return false;
	 	}
	}
	// devuelve detalle de tareas para notificacion standart a partir de id_listarea
	function detaTareas($id_listarea){

		$this->db->select('tbl_listarea.id_listarea,
							tbl_listarea.id_orden,
							tareas.duracion_std,
							tbl_listarea.tareadescrip,
							tbl_listarea.id_tarea,
							tbl_listarea.id_usuario,
							tbl_listarea.estado,
							tbl_listarea.fecha');
		$this->db->from('tbl_listarea');
		$this->db->join('tareas', 'tareas.id_tarea = tbl_listarea.id_tarea');
		$this->db->where('tbl_listarea.id_listarea', $id_listarea);
		$query = $this->db->get();

		if ($query->num_rows()!=0){
				return $query->result_array();
		}else{
			return false;
		}
	 }
	 

	// devuelve id tarea y form asociado por nomb de tarea BPM
	function getidFormTareaBPM($nomtarea){

		$this->db->select('tareas.id_tarea,
							tareas.form_asoc');
		$this->db->from('tareas');
		$this->db->where('tareas.descripcion', $nomtarea);
		$query = $this->db->get();

		if($query->num_rows()>0){
				return $query->result_array();
			}
			else{
				return false;
			}
	}
	//obtener Comentarios
	function ObtenerComentariosBPM($caseId,$param){
		$processInstance = 'processInstanceId%3D'.$caseId;
		$comentarios = file_get_contents(BONITA_URL.'API/bpm/comment?f='.$processInstance.'&o=postDate%20DESC&p=0&c=200&d=userId',false,$param);
		return json_decode($comentarios,true);
	}

	/* TAREAS BPM */
		// Tomar Tareas
		function tomarTarea($idTarBonita,$param){

			try {
				$resource = 'API/bpm/humanTask/';
				$url = BONITA_URL.$resource.$idTarBonita;

				file_get_contents($url, false, $param);
				$response = $this->parseHeaders( $http_response_header );

				return $response;
			}catch (Exception $e) {
				var_dump($e->getMessage());
			}
		}
		// Soltar Tareas
		function soltarTarea($idTarBonita,$param){

			$resource = 'API/bpm/humanTask/';
			$url = BONITA_URL.$resource.$idTarBonita;
			file_get_contents($url, false, $param);
			$response = $this->parseHeaders( $http_response_header );
			return $response;
		}

		// function getIdOtPorIdCase($caseId, $param){
		// 	// [URL_BONITA]/API/bpm/caseVariable/:caseId/gIdOT
		// 	$urlResource = BONITA_URL.'API/bpm/caseVariable/';
		// 	$var = '/gIdOT';

		// 	$data = file_get_contents($urlResource.$caseId.$var , false, $param);
		// 	return $data;
		// }
		function getIdSolServPorIdCase($caseId, $param){
				// [URL_BONITA]/API/bpm/caseVariable/:caseId/gIdOT
			$urlResource = BONITA_URL.'API/bpm/caseVariable/';
			$var = '/gIdSolicitudServicio';
			$data =json_decode(file_get_contents($urlResource.$caseId.$var , false, $param), true);

			return $data;
		}
		// devuelve id de backlog
		function getIdBackporid_OT($id_OT, $tipo){
			
			$this->db->select('orden_trabajo.id_solicitud AS idBacklog');
			$this->db->from('orden_trabajo');
			$this->db->where('orden_trabajo.id_orden',$id_OT);
			$this->db->where('orden_trabajo.tipo',$tipo);
			$query = $this->db->get();
			
			if ($query->num_rows()!=0){
				return $query->row('idBacklog');	
			}else{
				return 0;
			}
		}

		// Trae datos de backlog para editar
	function geteditar($idBack){
	
		$this->db->select('tbl_back.*,		
											equipos.descripcion AS codigo,
											equipos.id_equipo,
											equipos.fecha_ingreso,
											equipos.marca,
											equipos.ubicacion,
											componenteequipo.id_componente,
											componenteequipo.codigo AS componentecodigo,
											componentes.descripcion AS componentedescrip,
											tareas.descripcion AS tareadescrip,
											sistema.sistemaid,
											sistema.descripcion AS sistemadescrip,
											componenteequipo.id_equipo');	
		$this->db->from('tbl_back');
		$this->db->join('equipos', 'tbl_back.id_equipo = equipos.id_equipo');
		$this->db->join('componenteequipo', 'tbl_back.idcomponenteequipo = componenteequipo.idcomponenteequipo');
		$this->db->join('componentes', 'componentes.id_componente = componenteequipo.id_componente');
		$this->db->join('tareas', 'tareas.id_tarea = tbl_back.tarea_descrip');
		$this->db->join('sistema', 'sistema.sistemaid = componenteequipo.sistemaid');
		$this->db->where('tbl_back.backId=(SELECT orden_trabajo.id_solicitud FROM orden_trabajo WHERE orden_trabajo.id_orden = '.$idBack.' AND orden_trabajo.tipo = 4)');	    
		$query= $this->db->get();
		
		if( $query->num_rows() > 0)
		{
			return $query->result_array();	
		} 
		else {
			return 0;
		}
	}

	// Terminar Tarea
	function terminarTareaStandarenBPM($idTarBonita,$param){

		$userdata = $this->session->userdata('user_data');
		$usrId = $userdata[0]['usrId'];
		$method = '/execution';
		$resource = 'API/bpm/userTask/';
		$url = BONITA_URL.$resource.$idTarBonita.$method;
		//$url = BONITA_URL.$resource.$usrId.$method;
		file_get_contents($url, false, $param);
		$response = $this->parseHeaders( $http_response_header );
		return $response;
	}

	// terminar tarea analisis de Solicitud de Servicios
	function decidirUrgencia($caseId, $param){
		$resource = 'API/bpm/userTask/';
		$com = '/execution';
		$url = BONITA_URL.$resource.$caseId.$com;
		file_get_contents($url,false, $param);
		$response = $this->parseHeaders( $http_response_header );
		return $response;
	}
	// toma la respuesta del server y devuelve el codigo de respuesta solo
	function parseHeaders( $headers ){
		$head = array();
		foreach( $headers as $k=>$v ){
			$t = explode( ':', $v, 2 );
			if( isset( $t[1] ) )
				$head[ trim($t[0]) ] = trim( $t[1] );
			else{
				$head[] = $v;
				if( preg_match( "#HTTP/[0-9\.]+\s+([0-9]+)#",$v, $out ) )
					$head['reponse_code'] = intval($out[1]);
			}
		}
		return $head;
	}
	// Comentarios
	function GuardarComentarioBPM($param){
		$respuesta = file_get_contents(BONITA_URL.'API/bpm/comment',false,$param);
		return $respuesta;
	}
	/* 	./ TAREAS BPM */	

/* ./ INTEGRACION CON BPM */
}
