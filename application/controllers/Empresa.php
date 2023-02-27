<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class empresa extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Empresas');
	}

	public function check_session(){

        $data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Customer >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();

			echo ("<script>location.href='login'</script>");

		}else{
            return true;
        }
    }

	public function index($permission)
	{
		if($this->check_session()){
			$data['list']       = $this->Empresas->Empresas_List();
			$data['permission'] = $permission;
			$this->load->view('empresas/list', $data);
		}
	}

	public function getEmpresa()
	{
		$data['data']     = $this->Empresas->getEmpresa($this->input->post());
		$response['html'] = $this->load->view('empresas/view_', $data, true);

		echo json_encode($response);
	}

	public function setEmpresa()
	{
		$data = $this->Empresas->setEmpresa($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);
		}
	}

	public function baja_cliente()
	{
	    $idcliente = $_POST['idcli'];
    	$result    = $this->Empresas->eliminacion($idcliente);
    	print_r(true);
	}

}
