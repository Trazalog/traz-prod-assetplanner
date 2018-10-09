<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Grupo extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('Grupos');
	}

	public function index($permission){

		$data['list'] = $this->Grupos->Listado_Grupos();
		$data['permission'] = $permission;
		$this->load->view('grupos/list', $data);
	}

	public function Obtener_Grupo(){

		$id=$_POST['id_grupo'];
		$result = $this->Grupos->Obtener_Grupos($id);
		echo json_encode ($result);
	}

	public function Guardar_Grupo(){

	    $descripcion=$this->input->post('descripcion');
	    $data = array(
						'descripcion' => $descripcion,
				 		'estado' =>"AC");
	    $sql = $this->Grupos->Guardar_Grupos($data);
	    echo json_encode($sql);
  	}

	public function Modificar_Grupo(){

  		$id=$this->input->post('id_grupo');
	    $descripcion=$this->input->post('descripcion');
	    
	    $data = array(
	    	    		   	'id_grupo' => $id,
						    'descripcion' => $descripcion,
						);
	    $sql = $this->Grupos->Modificar_Grupos($data);
	    echo json_encode($sql);
  	}

  	public function Eliminar_Grupo(){

		$id=$_POST['id_grupo'];	
		$result = $this->Grupos->Eliminar_Grupos($id);
		echo json_encode($result);	
	}

}	
