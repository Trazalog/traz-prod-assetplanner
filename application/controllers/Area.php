<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class area extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('areas');
	}

	public function index($permission)					
	{
		$data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Trazacomp >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));
	
		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();
	
			echo ("<script>location.href='login'</script>");
	
		}else{
			$data['list']       = $this->areas->Listado_areas();
			$data['permission'] = $permission;
			$this->load->view('area/view_', $data);
		}
	}

	public function Obtener_area(){

		$id=$_POST['id_area'];
		$result = $this->areas->Obtener_areas($id);
		echo json_encode($result);
	}

	public function Guardar_area(){

	    $descripcion=$this->input->post('descripcion');
	    $id_empresa=$this->input->post('id_empresa');
	    $data = array(
						    'descripcion' => $descripcion,
							'id_empresa' => $id_empresa,
							'estado' => "AC"
	    );
	    $sql = $this->areas->Guardar_areas($data);
	    echo json_encode($sql);
	   
  	}
	  	public function Modificar_area(){

  		$id=$this->input->post('id_area');
	    $descripcion=$this->input->post('descripcion');
	    $id_empresa=$this->input->post('id_empresa');
	    $data = array(
	    	    		   	'id_area' => $id,
						    'descripcion' => $descripcion,
					   );
	    $sql = $this->areas->Modificar_areas($data);
	    echo json_encode($sql);

	  }
	  
	public function Eliminar_area(){
	
		$id=$_POST['id_area'];	
		$result = $this->areas->Eliminar_areas($id);
		echo json_encode($result);
		
	}
}	



