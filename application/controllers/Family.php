<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Family extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('Familys');
	}

	public function index($permission)
	{
		$data['list']       = $this->Familys->Listado_Familys();
		$data['permission'] = $permission;
		$this->load->view('familys/list', $data);
	}

	public function Obtener_Family()
	{
		$id     = $_POST['famId'];
		$result = $this->Familys->Obtener_Familys($id);
		echo json_encode($result);
	}

	public function Guardar_Family()
	{
		$famName    = $this->input->post('famName');
		$id_empresa = $this->input->post('id_empresa');
		$estado     = $this->input->post('estado');
		$data       = array(
			'famName' => $famName,
			'estado'  => "AC"
		);
		$sql = $this->Familys->Guardar_Familys($data);
		echo json_encode($sql);
	}

	public function Modificar_Family()
	{
		$id         =$this->input->post('famId');
		$famName    =$this->input->post('famName');
		$id_empresa =$this->input->post('id_empresa');
		$estado     =$this->input->post('estado');
		$data       = array(
			'famId'   => $id,
			'famName' => $famName,
		);
		$sql = $this->Familys->Modificar_Familys($data);
		echo json_encode($sql);
	}

	public function Eliminar_Family()
	{
		$id     = $_POST['famId'];	
		$result = $this->Familys->Eliminar_Familys($id);
		echo json_encode($result);
	}

}	
