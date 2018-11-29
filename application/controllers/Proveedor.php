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

	public function Obtener_Proveedor()
	{
		$id     = $_POST['provid'];
		$result = $this->Proveedores->Obtener_Proveedores($id);
		echo json_encode($result);
	}

	public function Guardar_Proveedor()
	{
		$provnombre    = $this->input->post('provnombre');
		$provcuit      = $this->input->post('provcuit');
		$provdomicilio = $this->input->post('provdomicilio');
		$provtelefono  = $this->input->post('provtelefono');
		$provmail      = $this->input->post('provmail');
		$id_empresa    = $this->input->post('id_empresa');
		$estado        = $this->input->post('estado');
		$data          = array(
			'provnombre'    => $provnombre,
			'provcuit'      => $provcuit,
			'provdomicilio' => $provdomicilio,
			'provtelefono'  => $provtelefono,
			'provmail'      => $provmail,
			'estado'        => "AC",
			'id_empresa'    => $id_empresa);
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
		$data           = array(
			'provid'        => $id,
			'provnombre'    => $provnombre,
			'provcuit'      => $provcuit,
			'provdomicilio' => $provdomicilio,
			'provtelefono'  => $provtelefono,
			'provmail'      => $provmail,);
		$sql            = $this->Proveedores->Modificar_Proveedores($data);
	    echo json_encode($sql);
  	}

	public function Eliminar_Proveedor()
	{
		$id     = $_POST['provid'];	
		$result = $this->Proveedores->Eliminar_Proveedores($id);
		echo json_encode($result);	
	}

}	
