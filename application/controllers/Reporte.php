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
}