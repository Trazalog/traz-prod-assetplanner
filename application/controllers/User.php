<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class user extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Users');
	}

	public function index($permission)
	{
		$data = $this->session->userdata();
		log_message('DEBUG','#Main/index | User >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();

			echo ("<script>location.href='login'</script>");

		}else{
			$data['list'] = $this->Users->User_List();
			$data['permission'] = $permission;
			$this->load->view('users/list', $data);
		}
	}

	public function getUser()
	{
		$data['data']     = $this->Users->getUser($this->input->post());
		$response['html'] = $this->load->view('users/view_', $data, true);

		echo json_encode($response);
	}

	public function setUser()
	{
		$data = $this->Users->setUser($this->input->post());

		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);
		}
	}


	public function test()
	{
		//Creamos las variables necesarias
		$dataForm['id']          = $_POST['id'];
		$dataForm['act']         = $_POST['act'];
		$dataForm['usrNick']     = $_POST['usrNick'];
		$dataForm['usrName']     = $_POST['usrName'];
		$dataForm['usrLastName'] = $_POST['usrLastName'];
		//$dataForm['usrComision'] = $_POST['usrComision'];
		$dataForm['usrPassword'] = $_POST['usrPassword'];
		$dataForm['grpId']       = $_POST['grpId'];

		//Convertimos la información de la imagen en binario para insertarla en la BBDD
		if( $_FILES['imagen']['size'] != 0 ) {
			$imagenBinaria       = file_get_contents($_FILES['imagen']['tmp_name']);
			$dataForm['usrimag'] = $imagenBinaria;
		} else {
			$dataForm['usrimag'] = '';
		}


		$data = $this->Users->setUser( $dataForm );

		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);
		}
	}

}
