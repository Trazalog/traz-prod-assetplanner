<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lote extends CI_Controller {

	private $path = ALM.'/';

	function __construct()
  {
		parent::__construct();
		$this->load->model($this->path.'Lotes');
	}

	public function index()
	{
		$data = $this->session->userdata();
		log_message('DEBUG','#TRAZA | LOTE | index() | UserId: '. $data['user_data'][0]['usrId'] ." ||| UserName: ". $data['user_data'][0]['usrName'] ." ||| id_empresa: ". $data['user_data'][0]['id_empresa']);
		//log_message('DEBUG','#Main/index | Envio >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));
	
		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();
	
			echo ("<script>location.href='login'</script>");
	
		}else{
			$data['list']       = $this->Lotes->getList();
			$data['permission'] = "Add-Edit-Del-View";
			$this->load->view($this->path.'lotes/list', $data);
		}
	}
	
	public function puntoPedList()
	{
		$data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Lote >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));
	
		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();
	
			echo ("<script>location.href='login'</script>");
	
		}else{
			$data['list']       = $this->Lotes->getPuntoPedido();
			$data['permission'] = "Add-Edit-Del-View";
			$this->load->view($this->path.'lotes/list_punto_ped', $data);
		}
	}

	public function getMotion(){
		$data['data'] = $this->Stocks->getMotion($this->input->post());
		$response['html'] = $this->load->view($this->path.'stock/view_', $data, true);

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

	function verificarExistencia()
	{
		$lote = $this->input->post('lote');
		$depo = $this->input->post('depo');
		$arti = $this->input->post('arti');
		echo $this->Lotes->verificarExistencia($arti, $lote, $depo);
	}
	public function listarPorArticulo(){
		
        $idarticulo = $this->input->get("arti_id");
		$iddeposito = $this->input->get("depo_id");
		$datos = $this->Lotes->listarPorArticulos($idarticulo,$iddeposito)->lotes->lote;
        echo json_encode($datos);
    }
}