<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class proceso extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('procesos');
	}

	public function index($permission)
	{
		$data['list'] = $this->procesos->Listado_procesos();
		$data['permission'] = $permission;
        $this->load->view('proceso/view_', $data);
	}

	public function Obtener_proceso(){

		$id=$_POST['id_proceso'];
		$result = $this->procesos->Obtener_procesos($id);
		echo json_encode($result);

	}

	public function Guardar_proceso(){
	  	
	    $descripcion=$this->input->post('descripcion');
	    $id_empresa=$this->input->post('id_empresa');
	    $data = array(
						    'descripcion' => $descripcion,
							'id_empresa' => $id_empresa,
							'estado' => "AC"
	    );
	    $sql = $this->procesos->Guardar_procesos($data);
	    echo json_encode($sql);
	   
	}
	  
	public function Modificar_proceso(){
  		$id=$this->input->post('id_proceso');
	    $descripcion=$this->input->post('descripcion');
	    $id_empresa=$this->input->post('id_empresa');
	    $data = array(
	    	    		   'id_proceso' => $id,
						    'descripcion' => $descripcion,
					   );
	    $sql = $this->procesos->Modificar_procesos($data);
	    echo json_encode($sql);

	}
	  
	public function Eliminar_proceso(){
	
		$id=$_POST['id_proceso'];	
		$result = $this->procesos->Eliminar_procesos($id);
		echo json_encode($result);
		
	}
}	

?>