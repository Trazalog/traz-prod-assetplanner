<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Marca extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Marcas');
	}

	public function index($permission)
	{
		$data['list']       = $this->Marcas->Listado_Marcas();
		$data['permission'] = $permission;
		$this->load->view('marca/list', $data);
	}

	public function Obtener_Marca()
	{
		$id     =$_POST['marcaid'];
		$result = $this->Marcas->Obtener_Marcas($id);
		echo json_encode($result);
		
	}

	public function Guardar_Marca()
	{
		$marcadescrip = $this->input->post('marcadescrip');
		$estado       = $this->input->post('estado');
		$id_empresa   = $this->input->post('id_empresa');
		$data         = array(
			'marcadescrip' => $marcadescrip,
			'estado'       => "AC"
		);
		$sql = $this->Marcas->Guardar_Marcas($data);
		echo json_encode($sql);
	}


	public function Modificar_Marca()
	{
		$id           = $this->input->post('marcaid');
		$marcadescrip = $this->input->post('marcadescrip');
		$data         = array(
			'marcaid'      => $id,
			'marcadescrip' => $marcadescrip,
		);
		$sql = $this->Marcas->Modificar_Marcas($data);
		echo json_encode($sql);
	}

	public function Eliminar_Marca()
	{
		$id     = $_POST['marcaid'];	
		$result = $this->Marcas->Eliminar_Marcas($id);
		echo json_encode($result);
	}

}	
