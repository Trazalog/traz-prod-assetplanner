<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Proveedor extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Proveedores');
	}

	public function index($permission)
	{
		$data['list']       = $this->Proveedores->Listado_Proveedores();
		$data['permission'] = $permission;
		$this->load->view('proveedores/list', $data);
	}

	public function Guardar_Proveedor()
	{

		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];		
		$fecha = date("Y-m-d H:i:s");		

		$provnombre    = $this->input->post('provnombre');
		$provcuit      = $this->input->post('provcuit');
		$provdomicilio = $this->input->post('provdomicilio');
		$provtelefono  = $this->input->post('provtelefono');
		$provmail      = $this->input->post('provmail');
		$id_empresa    = $this->input->post('id_empresa');
		$estado        = $this->input->post('estado');
		
		$data          = array('nombre'    	=> $provnombre,
														'cuit'      => $provcuit,
														'domicilio' => $provdomicilio,
														'telefono'  => $provtelefono,
														'email' 		=> $$provmail,	
														'empr_id'   => $empId,
														'fec_alta'  => $fecha,
														'eliminado' => 0);

		//dump($data, 'datos en controller');

		$sql           = $this->Proveedores->Guardar_Proveedores($data);
		echo json_encode($sql);
  }

	public function Modificar_Proveedor()
	{
		$id             = $this->input->post('provid');
		$provnombre     = $this->input->post('provnombre');
		$provcuit       = $this->input->post('provcuit');
		$provdomicilio  = $this->input->post('provdomicilio');
		$provtelefono   = $this->input->post('provtelefono');
		$provmail       = $this->input->post('provmail');
		$data           = array('nombre'    => $provnombre,
														'cuit'      => $provcuit,
														'domicilio' => $provdomicilio,
														'telefono'  => $provtelefono,
														'email'      => $provmail);

		$sql = $this->Proveedores->Modificar_Proveedores($id, $data);
	  echo json_encode($sql);
  }

	public function Eliminar_Proveedor()
	{		
		$id     = $this->input->post('provid');
		$result = $this->Proveedores->Eliminar_Proveedores($id);
		echo json_encode($result);	
	}

}	
