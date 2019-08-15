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

	public function getImgValor()
	{
		$idForm = $this->input->post('idForm');
		$idPedTrabajo = $this->input->post('idPedTrabajo');
		$response = $this->Forms->getImgValor($idForm, $idPedTrabajo);
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

	// trae datos para dibujar formulario en modal
	public function Obtener_Formulario(){
		$infoId = $this->input->post('infoId');
		$data['form'] = $this->Forms->get_form2($infoId);				
		$response['html'] = $this->load->view('tareas/viewFormSubtareas', $data, true);
		echo json_encode($response);
	}

	// guarda  form commpletado 
	public function guardarForm(){

		//  array con id de dato->valor(dato es FOCO_ID)
		$datos = $this->input->post();
		unset($datos['artId']);			
		$userdata = $this->session->userdata('user_data');
		$usrId = $userdata[0]['usrId'];     // guarda usuario logueado
		$listarea = $datos['id_listarea'];
		$idformulario = $datos['idformulario'];
		$i = 1;// para guardar el orden de categorias, grupos y valores
		$j = 0;

		foreach ($datos as $key => $value) {
			
			// Si no son los primeros dos campos id listarea e id formulario
			if (($key != 'id_listarea') && ($key != 'idformulario')) {						
				$data = $this->Forms->getDatos($key);// en este punto $key = FOCO_ID		
				// Agrego datos adicionales al formulario
				$data['USUARIO'] = $usrId;
				// Solo si los valores vienen con info guarda
				if (($value != "") || ($value != -1) ) {
					$data['VALOR'] = $value;
				}
				// si el valor es -1 guarda Seleccione..
				if (($value == -1) ) {
					$data['VALOR'] = 'Seleccione...';
				}
				// Si un componente viene "" o -1  o "notilde" guarda 0 (no validado)
				if( ($value == "") || ($value == -1) || ($value == "notilde") )  {
					$data['VALIDADO'] = 0;
				}else{
					$data['VALIDADO'] = 1;
				}
				$tipoComp = $data['TIDA_NOMBRE'];
				// Si el tipo de dato es "input_archivo"
				if ($tipoComp == "input_archivo") {
					// si el value no esta vacio
					if($value != ""){
						$config = [
							'upload_path' => './assets/imgformularios/',
							'allowed_types' => '*'
						];
						$this->load->library("upload",$config);
						if($this->upload->do_upload($key)){
							echo "subio ok";
						}else{
							$this->upload->display_errors('<p>', '</p>');
							echo "error en subida";
						}
						$dataImag = array("upload_data" => $this->upload->data());
						$nom = $dataImag['upload_data']['file_name'];
						$data['VALOR'] = "assets/imgformularios/".$nom;

					}else{
						echo $data['VALOR'];
					}
				}

				$this->Forms->UpdateForm($data,$key); // $key = FOCO_ID
				$i++;
			}
		}
		//FIXME: VER LA VUELTA ECHO
		echo true;
	}
}	