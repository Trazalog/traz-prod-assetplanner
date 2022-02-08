<?php defined('BASEPATH') or exit('No direct script access allowed');

class Ajustestock extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('general/Establecimientos');
        $this->load->model(ALM.'Ajustestocks');
    }
    public function index()
    {
        $data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Envio >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));
	
		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();
	
			echo ("<script>location.href='login'</script>");
	
		}else{
            $data['establecimientos'] = $this->Establecimientos->listar()->establecimientos->establecimiento;
            $this->load->view(ALM.'ajustestock/ajuste_stock',$data);
        }
    }

    public function guardarAjuste()
    {
        $data = $this->input->post('data');
        $rsp = $this->Ajustestocks->guardarAjustes($data);
        echo json_encode($rsp);
    }

    public function guardarDetalleAjuste()
    {
        $data = $this->input->post('data');
        $rsp = $this->Ajustestocks->guardarDetalleAjustes($data);
        echo json_encode($rsp);
    }


}