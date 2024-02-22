<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Cliente extends CI_Controller {
	function __construct()
        {
		parent::__construct();
		$this->load->model('Clientes');
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
			$data['list'] = $this->Clientes->Listado_Clientes();
			$data['permission'] = $permission;
			$this->load->view('cliente/view_', $data);
		}
	}

	public function Obtener_Cliente(){
		$id     = $this->input->post('cliId');
		$result = $this->Clientes->Obtener_Clientes($id);
		//dump_exit($result);
		return $result;
	}
    
    public function Guardar_Cliente()
    {
		$cliName        = $this->input->post('cliName');
		$cliLastName    = $this->input->post('cliLastName');
		$cliDni         = $this->input->post('cliDni');
		$cliAddress     = $this->input->post('cliAddress');
		$cliPhone       = $this->input->post('cliPhone');
		$cliEmail       = $this->input->post('cliEmail');
		$cliRazonSocial = $this->input->post('cliRazonSocial');
	    $data = array(
	    	'cliName'        => $cliName,
	    	'cliLastName'    => $cliLastName,
	    	'cliDni'         => $cliDni,
	    	'cliAddress'     => $cliAddress,
	    	'cliPhone'       => $cliPhone,
	    	'cliEmail'       => $cliEmail,
	    	'cliRazonSocial' => $cliRazonSocial,
	    	'estado'         => "AC"
	    );
	    $sql = $this->Clientes->Guardar_Clientes($data);
	    print_r($sql);
  	}	            
          
    public function Modificar_Cliente(){

  		$id=$this->input->post('cliId');
	    $cliName=$this->input->post('cliName');
	    $cliDni=$this->input->post('cliDni');
	    $cliAddress=$this->input->post('cliAddress');
	    $cliPhone=$this->input->post('cliPhone');
	    $cliEmail=$this->input->post('cliEmail');
	    $cliRazonSocial=$this->input->post('cliRazonSocial');
	    $data = array(
	    	    		   'cliId' => $id,
						    'cliName' => $cliName,
						    'cliDni' => $cliDni,
						    'cliAddress' => $cliAddress,
						    'cliPhone' => $cliPhone,
						    'cliEmail' => $cliEmail,
						    'cliRazonSocial' => $cliRazonSocial
					   );
	    $sql = $this->Clientes->Modificar_Clientes($data);
	     echo json_encode($sql);
  	}
	    


	public function Eliminar_Cliente(){
        
    $id=$_POST['cliId'];	
		$result = $this->Clientes->Eliminar_Clientes($id);
   	echo json_encode($result);
	}
	
}	
