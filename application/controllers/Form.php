<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Form extends CI_Controller {

	function __construct(){

		parent::__construct();		
		$this->load->model('Forms');
	}

	public function index($permission){
		$data['list'] = $this->Forms->get_form();

		// guarda form inicia sin datos validos
		$this->Forms->setFormInicial();

	    $data['permission'] = $permission;
	    $this->load->view('form/view_', $data);
	}

	// Devuelve formulario asociado a la Tarea por id
	public function formTarea(){
		$data['form'] = $this->Forms->get_form($id_tarea);
	}

	// trae valores validos para llenar componentes
	public function getValValido(){

		$idForm = $this->input->post('idForm');
		$response = $this->Forms->getValValidos($idForm);
		echo json_encode($response);		
	}

	// guarda  form commpletado (revisar no funciona bien)
	public function guardar(){
		//  array con id de dato->valor
		$datos = $this->input->post();
		$data = json_encode($datos);
		//echo "datos desde formuario: ";
		//dump_exit($data);

		$userdata = $this->session->userdata('user_data');
    $usrId = $userdata[0]['usrId'];     // guarda usuario logueado

		$id_listarea = array_shift($datos);
		$response = $this->Forms->deleteFormComp($id_listarea);
		if($response) {
			echo "respuesta de delete: ";
			echo $response;
		}
		//echo "listarea: ";
		//var_dump($id_listarea);
		//echo "demas datos: ";
		//dump_exit($datos);



        $i = 1;// para guardar el orden de categorias, grupos y valores
		foreach ($datos as $key => $value) {	
			//trae array con info de dato por id		
			$data = $this->Forms->getDatos($key);
			$data['USUARIO'] = $usrId;
			$data['ORDEN'] = $i;
			// echo "  key: ";
			// echo($key);
			// echo "---------------------------";
			//dump_exit($data);

			$this->Forms->setForm($data);
			$i++;
		}

		
		//echo json_encode(true);	usala para el alburo nomas
	}
}	