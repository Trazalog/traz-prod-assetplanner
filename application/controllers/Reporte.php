<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reporte extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('Reportes');
	}

	public function index($permission)
	{
		$data['permission'] = $permission;
		$this->load->view('reportes/view_', $data);
	}
	
	public function getReporte()
	{
      	$solicitudServicio = $this->Reportes->getRepOrdServicio($this->input->post());
		if($solicitudServicio)
		{	
			$arre = array();
			foreach ($solicitudServicio as $row ) 
			{   
				$arre[] = $row;
			}
			echo json_encode($arre);
		}
		else 
			echo json_encode(0);
	}

	public function ejemplo(){

		$this->load->view('reportes/ejemplo');

	}
	public function consultaConFiltros(){
		//$id     = $_GET['id_orden'];

		//$data['codigo_equipo'] = $this->input->post('');
	
     
		$resp = $this->Reportes->getConsulta($this->input->post());
		if($resp)
		{	//$arre['datos'] = $resp;
		//	echo json_encode($arre);
			$arre = array();
			 foreach ($resp as $row ) 
			 {   
			 	$arre[] = $row;
			 }
			 echo json_encode($arre);
		}
		else 
			echo json_encode(0);

	}
	public function getCliente(){
		$response = $this->Reportes->getClientes($this->input->post());
		echo json_encode($response);

	}
	public function getEquipo(){
		$response = $this->Reportes->getEquipos($this->input->post()); //no se escribe nada en el pasaje de parametros post(nada)
		echo json_encode($response);
	}
	public function getArticulo(){
		$response = $this->Reportes->getArticulos($this->input->post()); //no se escribe nada en el pasaje de parametros post(nada)
		echo json_encode($response);
	}
	Public function getSupervisor(){
		$response = $this->Reportes->getSupervisors($this->input->post()); //no se escribe nada en el pasaje de parametros post(nada)
		echo json_encode($response);
	}

	public function tiempo()
	{
		echo "Holis Mundo";
	}
}