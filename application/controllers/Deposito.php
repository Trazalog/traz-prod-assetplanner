<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Deposito extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Depositos');
	}

	public function index($permission)
	{
		$data['list'] = $this->Depositos->Listado_Depositos();
		$data['permission'] = $permission;
		$this->load->view('deposito/list', $data);
	}

	public function Obtener_Deposito(){
		$id = $this->input->post('id');
		$result = $this->Depositos->Obtener_Depositos($id);
		echo json_encode($result);

	}
	// crea deposito nuevo
	public function Guardar_Deposito(){		
	
		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];		
		$fecha = date("Y-m-d H:i:s");		
		$depositodescrip = $this->input->post('depositodescrip');
		$direccion = $this->input->post('direccion');
		$gps = $this->input->post('gps');		
		$departamentos = $this->input->post('departamentos');
		$provincias = $this->input->post('provincias');
	
		$data = array(
							'descripcion' => $depositodescrip,
							'direccion' => $direccion,
							'GPS'	=> 	$gps,
							'estado' => "AC",
							'loca_id'=> $departamentos,
							'esta_id' => $provincias,
							'empr_id' => 6,
							'fec_alta' => $fecha,						
							'eliminado'=> 0);

		$sql = $this->Depositos->Guardar_Depositos($data);
		echo json_encode($sql);
		
	}
	// guarda edicion de deposito
	public function Modificar_Deposito(){
	
		$data = $this->input->post();
		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];		
		$fecha = date("Y-m-d H:i:s");		
		
		$data['empr_id'] = $empId;
		$data['fec_alta'] = $fecha;
		$data['eliminado'] = 0;		
		
		$sql = $this->Depositos->Modificar_Depositos($data);
		echo json_encode($sql);

	}
	// cambia estado a anulado de deposito
	public function Eliminar_Deposito(){	
	
		$id = $this->input->post('depo_id');

		$result = $this->Depositos->Eliminar_Depositos($id);
		echo json_encode($result);
		
	}	
	//Devuelve listado de provincias
	public function getProvincia(){		
		$response = $this->Depositos->getProvincias();  
		echo json_encode($response);
	}
	//Devuelve localidades por id de provincia
	public function getLocalidadPorId(){
		$id = $this->input->post('id_provincia');
		$response = $this->Depositos->getLocalidadPorIds($id);  
		echo json_encode($response);
	}
}	

?>