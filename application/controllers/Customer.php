<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customer extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Customers');
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
			$data['list'] = $this->Customers->Customers_List();
			$data['permission'] = $permission;
			$this->load->view('customers/list', $data);
		}
	}
	
	public function getCustomer(){

		if($this->check_session()){
			$data['data'] = $this->Customers->getCustomer($this->input->post());
			$response['html'] = $this->load->view('customers/view_', $data, true);

			echo json_encode($response);
		}
	}
	
	public function setCustomer(){
		$data = $this->Customers->setCustomer($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);	
		}
	}

	public function visits(){
		$data = $this->Customers->visits($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);	
		}
	}

	public function status(){
		$data['data'] = $this->Customers->status($this->input->post());
		$response['html'] = $this->load->view('calendar/status_', $data, true);

		echo json_encode($response);
	}
}