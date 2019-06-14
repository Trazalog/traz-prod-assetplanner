<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Contratista extends CI_Controller {
	function __construct()
        {
		parent::__construct();
		$this->load->model('Contratistas');
	}


	public function index($permission)
	{
		$data['list'] = $this->Contratistas->Listado_Contratistas();
		$data['permission'] = $permission;
		$this->load->view('contratistas/list', $data);
	}

	public function Obtener_Contratista(){
		$id=$_POST['id_contratista'];
		$result = $this->Contratistas->Obtener_Contratistas($id);
		echo json_encode($result);
		return $result;

	}

	public function Guardar_Contratista(){

	    $nombre=$this->input->post('nombre');
	    $contradireccion=$this->input->post('contradireccion');
	    $contramail=$this->input->post('contramail');
	    $contramail1=$this->input->post('contramail1');
	    $contracelular1=$this->input->post('contracelular1');
	    $contracelular2=$this->input->post('contracelular2');
	    $contratelefono=$this->input->post('contratelefono');
	    $contracontacto=$this->input->post('contracontacto');
	    $id_empresa=$this->input->post('id_empresa');
	    $data = array(
						    'nombre' => $nombre,
						    'contradireccion' => $contradireccion,
						    'contramail' => $contramail,
						    'contramail1' => $contramail1,
						    'contracelular1' => $contracelular1,
						    'contracelular2' => $contracelular2,
						    'contratelefono' => $contratelefono,
						    'contracontacto' => $contracontacto,
						    'estado' => "AC",
						    'id_empresa' => $id_empresa
	    );
	    $sql = $this->Contratistas->Guardar_Contratistas($data);
	    echo json_encode($sql);
	   
  	}


	public function Modificar_Contratista(){

  		$id=$this->input->post('id_contratista');
	    $nombre=$this->input->post('nombre');
	    $contradireccion=$this->input->post('contradireccion');
	    $contramail=$this->input->post('contramail');
	    $contramail1=$this->input->post('contramail1');
	    $contracelular1=$this->input->post('contracelular1');
	    $contracelular2=$this->input->post('contracelular2');
	    $contratelefono=$this->input->post('contratelefono');
	    $contracontacto=$this->input->post('contracontacto');
	    $data = array(
	    	    		   'id_contratista' => $id,
						    'nombre' => $nombre,
						    'contradireccion' => $contradireccion,
						    'contramail' => $contramail,
						    'contramail1' => $contramail1,
						    'contracelular1' => $contracelular1,
						    'contracelular2' => $contracelular2,
						    'contratelefono' => $contratelefono,
						    'contracontacto' => $contracontacto,
					   );
	    $sql = $this->Contratistas->Modificar_Contratistas($data);
	    echo json_encode($sql);

  	}


	public function Eliminar_Contratista(){
	
		$id=$_POST['id_contratista'];	
		$result = $this->Contratistas->Eliminar_Contratistas($id);
		echo json_encode($result);
		
	}
}	

?>  