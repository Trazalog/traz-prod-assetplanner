<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class criticidad extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('criticidades');
	}

	public function index($permission)
	{
		$data['list'] = $this->criticidades->Listado_criticidades();
		$data['permission'] = $permission;
		$this->load->view('criticidad/view_', $data);
	}
	public function Obtener_criticidad(){

			$id=$_POST['id_criti'];
			$result = $this->criticidades->Obtener_criticidades($id);
			echo json_encode($result);
	}

	public function Guardar_criticidad(){

	    $descripcion=$this->input->post('descripcion');
	    $id_empresa=$this->input->post('id_empresa');
	    $data = array(
						    'descripcion' => $descripcion,
							'id_empresa' => $id_empresa,
							'estado' => "AC"
	    );
	    $sql = $this->criticidades->Guardar_criticidades($data);
	    echo json_encode($sql);
	   
	  }
	  
	public function Modificar_criticidad(){
  		$id=$this->input->post('id_criti');
	    $descripcion=$this->input->post('descripcion');
	    $id_empresa=$this->input->post('id_empresa');
	    $data = array(
	    	    		   	'id_criti' => $id,
						    'descripcion' => $descripcion,
						
					   );
	    $sql = $this->criticidades->Modificar_criticidades($data);
	    echo json_encode($sql);

	  }
	  
	public function Eliminar_criticidad(){
	
		$id=$_POST['id_criti'];	
		$result = $this->criticidades->Eliminar_criticidades($id);
		echo json_encode($result);
		
	}
}	

?>