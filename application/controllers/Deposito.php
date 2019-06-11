<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Deposito extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Depositos');
	}

	public function index($permission)
	{
		$data['list'] = $this->Depositos->Listado_Depositos();
		$data['permission'] = $permission;
		$this->load->view('deposito/list', $data);
	}

	public function Obtener_Deposito(){
		$id=$_POST['depositoId'];
		$result = $this->Depositos->Obtener_Depositos($id);
		echo json_encode($result);

	}

	public function Guardar_Deposito(){

	  	
	    $depositodescrip=$this->input->post('depositodescrip');
	    $direccion=$this->input->post('direccion');
	    $id_empresa=$this->input->post('id_empresa');
	    $estado=$this->input->post('estado');
	    $data = array(
						    'depositodescrip' => $depositodescrip,
						    'direccion' => $direccion,
						    'id_empresa' => $id_empresa,
						    'estado' => "AC");
	    $sql = $this->Depositos->Guardar_Depositos($data);
	    echo json_encode($sql);
	   
  	}
	  	public function Modificar_Deposito(){
  		$id=$this->input->post('depositoId');
	    $depositodescrip=$this->input->post('depositodescrip');
	    $direccion=$this->input->post('direccion');
	    $id_empresa=$this->input->post('id_empresa');
	    $estado=$this->input->post('estado');
	    $data = array(
	    	    		   	'depositoId' => $id,
						    'depositodescrip' => $depositodescrip,
						    'direccion' => $direccion,);
	    $sql = $this->Depositos->Modificar_Depositos($data);
	    echo json_encode($sql);

  	}
	public function Eliminar_Deposito(){
	
		$id=$_POST['depositoId'];	
		$result = $this->Depositos->Eliminar_Depositos($id);
		echo json_encode($result);
		
	}
}	

?>