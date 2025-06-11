<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reporte extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('Reportes');
		$this->load->model('Ordenservicios');
	}

	public function check_session(){

        $data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Reporte >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

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
			$data['permission'] = $permission;
			$this->load->view('reportes/view_', $data);
		}
	}
	
	/**
	 * Trae reportes de SS, Preventivo y Backlog
	 *
	 * @param 	filtros 	array[].
	 */
	public function getReporte()
	{
      	$solicitudServicio = $this->Reportes->getRepOrdServicio($this->input->post());
		$preventivos = $this->Reportes->getRepPreventivos($this->input->post());
		$backlog = $this->Reportes->getRepbacklog($this->input->post());
		$resultado = array_merge($solicitudServicio, $preventivos, $backlog);

		log_message('DEBUG','#ASSET | Reporte | getReporte() $response >> '.json_encode($resultado));

		if($resultado)
		{	
			 echo json_encode($resultado);
		}
		else 
			echo json_encode(0);
	}

	public function ejemplo(){

		if($this->check_session()){
			$this->load->view('reportes/ejemplo');
		}

	}
	public function consultaConFiltros(){
		//$id     = $_GET['id_orden'];

		//$data['codigo_equipo'] = $this->input->post('');
	
     
		$resp = $this->Reportes->getConsulta($this->input->post());
		if($resp)
		{	//$arre['datos'] = $resp;
		//	echo json_encode($arre);
			$arre = array();
			 foreach ($resp as $row ) 
			 {   
			 	$arre[] = $row;
			 }
			 echo json_encode($arre);
		}
		else 
			echo json_encode(0);

	}
	public function getCliente(){
		$response = $this->Reportes->getClientes($this->input->post());
		echo json_encode($response);

	}
	public function getEquipo(){
		$response = $this->Reportes->getEquipos($this->input->post()); //no se escribe nada en el pasaje de parametros post(nada)
		echo json_encode($response);
	}
	public function getArticulo(){
		$response = $this->Reportes->getArticulos($this->input->post()); //no se escribe nada en el pasaje de parametros post(nada)
		echo json_encode($response);
	}
	Public function getSupervisor(){
		$response = $this->Reportes->getSupervisors($this->input->post()); //no se escribe nada en el pasaje de parametros post(nada)
		echo json_encode($response);
	}

	public function tiempo()
	{
		echo "Holis Mundo";
	}
}