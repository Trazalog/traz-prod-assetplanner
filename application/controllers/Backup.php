<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class backup extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Backups');
	}

	public function index($permission)
	{
		$data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Backup >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();

			echo ("<script>location.href='login'</script>");

		}else{
			$data['list'] = $this->Backups->Backup_List();
			$data['permission'] = $permission;
			$this->load->view('backups/list', $data);
		}
	}

	public function generate()
	{
		$data = $this->Backups->Backup_Generate();
		echo json_encode($data);
	}
}