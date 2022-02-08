<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lote extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Lotes');
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

			$data['list']       = $this->Lotes->Lotes_List();
			$data['permission'] = $permission;
			$this->load->view('lotes/list', $data);
		}
	}
	
	public function puntoPedList($permission)
	{
		if($this->check_session()){
			$data['list']       = $this->Lotes->puntoPedListado();
			$data['permission'] = $permission;
			$this->load->view('lotes/list_punto_ped', $data);
		}
	}

	public function getMotion(){
		$data['data'] = $this->Stocks->getMotion($this->input->post());
		$response['html'] = $this->load->view('stock/view_', $data, true);

		echo json_encode($response);
	}
	
	public function setMotion(){
		$data = $this->Stocks->setMotion($this->input->post());
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