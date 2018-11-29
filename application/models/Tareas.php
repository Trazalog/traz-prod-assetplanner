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
	// trae tareas por ID de usuario
	function getTareas($param){
		
		$userdata = $this->session->userdata('user_data');
		$usrId= $userdata[0]["usrId"];
		//$tareas = file_get_contents(BONITA_URL.'API/bpm/humanTask?p=0&c=10&f=user_id%3D5', false, $param);
		$resource = 'API/bpm/humanTask?p=0&c=1000&f=user_id%3D';
		$url = BONITA_URL.$resource.$usrId;
		$tareas = file_get_contents($url, false, $param);
		
		$tar = json_decode($tareas,true);
		//dump($tar,'tareas bpm: ');
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
	//Verificar si es tarea Std
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



/* ./ INTEGRACION CON BPM */
}
