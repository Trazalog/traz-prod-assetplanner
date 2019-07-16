<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Plantillainsumo extends CI_Controller {
	function __construct(){
		parent::__construct();
		$this->load->model('Plantillainsumos');
	}
	function index($permission){

		$data['list'] = $this->Plantillainsumos->plantillaList();
		$data['permission'] = $permission;
		$this->load->view('plantillas/list',$data);	
	}
	public function getArticulo(){
		$response = $this->Plantillainsumos->getArticulos($this->input->post());
    echo json_encode($response);
	}
	// guarda plantilla nueva
	public function setPlantilla(){
		
		

		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa'];

		$articulos = $this->input->post('articulos');
		$descripcion_plant = $this->input->post('descripcion_plant');
		$nom_plant = $this->input->post('nom_plant');
		
		$plantCabecera['descripcion'] = $descripcion_plant;
		$plantCabecera['plant_nombre'] = $nom_plant;
		$plantCabecera['id_empresa'] = $empId;
		$plantCabecera['estado'] = 'AC';
		$id = $this->Plantillainsumos->setPlantilla($plantCabecera);
		
		for ($i=0; $i < count($articulos); $i++) { 
			$detaplantilla[$i]['artId'] =  $articulos[$i];
			$detaplantilla[$i]['plant_id'] =  $id;
		}		
		$resp = $this->Plantillainsumos->setDetaPantilla($detaplantilla);
		echo json_encode($resp);
	}
	// devuelve plantilla por Id
	public function getDetaPlantilla(){
		$response = $this->Plantillainsumos->getDetaPlantilla($this->input->post('idPlantilla'));
    echo json_encode($response);
	}
	// devuelve todas las plantillas para select Nota de Pedido
	public function getPlantillas(){
		$response = $this->Plantillainsumos->plantillaList();
		echo json_encode($response);
	}

	// public function ObtenerTareas()
	// {
	// 	$result = $this->Plantillas->ObtenerTareas();
	// 	echo json_encode($result);
	// }

	// public function agregar_tarea(){
	  
	// $data=$this->input->post();
	
	
	// $result = $this->Plantillas->agregar_tareas($data);
	// echo json_encode($result);
	   
  // 	}
	// public function EliminarTarea(){
	
	// $id=$_POST['id_detaplantilla'];	
	// $result = $this->Plantillas->EliminarTareas($id);
	// echo json_encode($result);
	
	// }

	// 	//NUEVA
	// public function cargartarea($permission,$idglob)
	// { 
	// 	$data['list'] = $this->Plantillas->cargartareas($idglob);
	// 	$data['id_plantilla'] = $idglob; 
	// 	$data['permission'] = $permission;    // envia permisos       
	// 	$this->load->view('plantillas/asignacion',$data); //equipo controlador 
  //   }


	// public function index($permission)
	// {
	// 	$data['list'] = $this->Plantillas->plantilla_List();
	// 	$data['permission'] = $permission;
	// 	$this->load->view('plantillas/list', $data);
	// }
	
	// public function getplantillas()
	// {
	// 	$data['data'] = $this->Plantillas->getplantilla($this->input->post());
	// 	$response['html'] = $this->load->view('plantillas/view_', $data, true);

	// 	echo json_encode($response);
	// }
	
	// public function setplantillas()
	// {
	// 	$data = $this->Plantillas->setplantilla($this->input->post());
	// 	if($data  == false)
	// 	{
	// 		echo json_encode(false);
	// 	}
	// 	else
	// 	{
	// 		echo json_encode(true);	
	// 	}
	// }
	
}
?>