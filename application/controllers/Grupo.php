<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Grupo extends CI_Controller {
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('Grupos');
		$this->load->model(FRM . 'Forms');
	}

	public function index($permission){

		$data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Grupo >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));
	
		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();
	
			echo ("<script>location.href='login'</script>");
	
		}else{

			$data['list'] = $this->Grupos->Listado_Grupos();
			$data['permission'] = $permission;
			$this->load->view('grupos/list', $data);
		}
	}

	public function Obtener_Grupo(){

		$id=$_POST['id_grupo'];
		$result = $this->Grupos->Obtener_Grupos($id);
		echo json_encode ($result);
	}

	public function Guardar_Grupo(){

	    $descripcion=$this->input->post('descripcion');
		$form_id=$this->input->post('form_id');
	    $data = array(
						'descripcion' => $descripcion,
				 		'estado' =>"AC",
						'form_id' => $form_id );
	    $sql = $this->Grupos->Guardar_Grupos($data);
	    echo json_encode($sql);
  	}

	public function Modificar_Grupo(){

  		$id=$this->input->post('id_grupo');
	    $descripcion=$this->input->post('descripcion');
		$formulario=$this->input->post('formulario');
	    
	    $data = array(
	    	    		   	'id_grupo' => $id,
						    'descripcion' => $descripcion,
							'form_id' => $formulario
						);
	    $sql = $this->Grupos->Modificar_Grupos($data);
	    echo json_encode($sql);
  	}

  	public function Eliminar_Grupo(){

		$id=$_POST['id_grupo'];	
		$result = $this->Grupos->Eliminar_Grupos($id);
		echo json_encode($result);	
	}

	public function get_formularios(){
        $res = $this->Forms->get_formularios();
        echo json_encode($res);
    }
}	
