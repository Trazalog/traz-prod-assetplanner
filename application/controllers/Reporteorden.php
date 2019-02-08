<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Reporteorden extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('Reporteordenes');
	}

	public function index($permission)
	{
		$data['permission'] = $permission;
		$this->load->view('reporteorden/view_', $data);
	}

	public function getEquipo()
	{
		$response = $this->Sservicios->getEquipos();
		echo json_encode($response);
	}

	public function getestado()
	{
		$response = $this->Reporteordenes->getestados();
		echo json_encode($response);
	}

	public function getDatosReporte()
	{
		$parametros = $this->input->post('parametros');
		$response   = $this->Reporteordenes->getDatosReporte($parametros);
		echo json_encode($response);
	}

}