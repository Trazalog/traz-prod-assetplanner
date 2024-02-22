<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Unload extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Unloads');
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

            $data['permission'] = $permission;
            $data['list']       = $this->Unloads->getValeDescarga();
            $this->load->view('unloads/list',$data);
        }
    }  

    public function cargarValDesc($permission)
    { 
        $data['permission'] = $permission;       
        $this->load->view('unloads/view_',$data);
    }  

    public function getHerramienta()
    {
        $response = $this->Unloads->getHerramientas($this->input->post());
        echo json_encode($response);
    }

    public function setHerramienta()
    {
        $data     = $this->input->post();
        $response = $this->Unloads->setHerramientas($data);
        if($response  == false){
            echo json_encode(false);
        }
        else
        {
            echo json_encode(true);
        }
    }


}
