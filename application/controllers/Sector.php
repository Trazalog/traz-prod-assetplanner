<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Sector extends CI_Controller {

	function __construct(){

		parent::__construct();
		$this->load->model('Sectores');
	}

	public function index($permission)
	{
		$data['list'] = $this->Sectores->Listado_Sectores();
		$data['permission'] = $permission;
		$this->load->view('sectores/list', $data);
	}

	public function Obtener_Sector(){
		
		$id=$_POST['id_sector'];
		$result = $this->Sectores->Obtener_Sectores($id);
		echo json_encode($result);
	}

	public function Guardar_Sector(){

	  	
	    $descripcion=$this->input->post('descripcion');
	    $id_empresa=$this->input->post('id_empresa');
	    $estado=$this->input->post('estado');
	    $data = array(
						    'descripcion' => $descripcion,
						    'id_empresa' => $id_empresa,
						    'estado' => "AC");
	    $sql = $this->Sectores->Guardar_Sectores($data);
	    echo json_encode($sql);
	   
  	}

	public function Modificar_Sector(){
		
  		$id=$this->input->post('id_sector');
	    $descripcion=$this->input->post('descripcion');
	    $data = array(
	    	    		 	'id_sector' => $id,
						    'descripcion' => $descripcion,);
	    $sql = $this->Sectores->Modificar_Sectores($data);
	    echo json_encode($sql);

  	}

	public function Eliminar_Sector(){
	
		$id=$_POST['id_sector'];	
		$result = $this->Sectores->Eliminar_Sectores($id);
		echo json_encode($result);
		
	}
}	

?>