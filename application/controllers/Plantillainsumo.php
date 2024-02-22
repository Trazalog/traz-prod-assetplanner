<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Plantillainsumo extends CI_Controller {
	function __construct(){
		parent::__construct();
		$this->load->model('Plantillainsumos');
	}
	function index($permission){

		$data = $this->session->userdata();
		log_message('DEBUG','#Main/index | PlantillaInsumo >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();

			echo ("<script>location.href='login'</script>");

		}else{

			$data['list'] = $this->Plantillainsumos->plantillaList();
			$data['permission'] = $permission;
			$this->load->view('plantillas/list',$data);	
		}
	}
	public function getArticulo(){
		$response = $this->Plantillainsumos->getArticulos($this->input->post());
    echo json_encode($response);
	}
	// guarda plantilla nueva
	public function setPlantilla(){	

		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa'];

		$articulos = $this->input->post('articulos');
		$descripcion_plant = $this->input->post('descripcion_plant');
		$nom_plant = $this->input->post('nom_plant');
		
		$plantCabecera['descripcion'] = $descripcion_plant;
		$plantCabecera['plant_nombre'] = $nom_plant;
		$plantCabecera['id_empresa'] = $empId;
		$plantCabecera['estado'] = 'AC';
		$id = $this->Plantillainsumos->setPlantilla($plantCabecera);
		
		if($id){

			for ($i=0; $i < count($articulos); $i++) { 
				$detaplantilla[$i]['artId'] =  $articulos[$i];
				$detaplantilla[$i]['plant_id'] =  $id;
			}

		}else{

			echo json_encode($id);
			return;

		}
				
		$resp = $this->Plantillainsumos->setDetaPantilla($detaplantilla);
		echo json_encode($resp);
	}
	// guarda edicion de plantilla
	public function setEdicion(){

		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa'];

		$articulos = $this->input->post('articulos');
		dump($articulos, 'art en controller');
		$descripcion_plant = $this->input->post('descripcion_plant');
		$nom_plant = $this->input->post('nom_plant');
		$idPlantilla =  $this->input->post('idPlantilla');
		
		$plantCabecera['descripcion'] = $descripcion_plant;
		$plantCabecera['plant_nombre'] = $nom_plant;
		$plantCabecera['id_empresa'] = $empId;
		$plantCabecera['estado'] = 'AC';

		$response = $this->Plantillainsumos->updatePlantilla($plantCabecera, $idPlantilla);
		
		if ($response) {
			
			$response = $this->Plantillainsumos->deleteDetaPlantilla($idPlantilla);
			dump($response, 'respuesta deleteDetaPlantilla pantilla');
			if ($response) {
			
				for ($i=0; $i < count($articulos); $i++) { 
					$detaplantilla[$i]['artId'] =  $articulos[$i];
					$detaplantilla[$i]['plant_id'] =  $idPlantilla;
				}

				$resp = $this->Plantillainsumos->setDetaPantilla($detaplantilla);			
				echo json_encode($resp);
				
			} else {
				echo json_encode($response);
				return;
			}
			
		} 		
	}
	// devuelve plantilla por Id
	public function getDetaPlantilla(){
		$response = $this->Plantillainsumos->getDetaPlantilla($this->input->post('idPlantilla'));
    echo json_encode($response);
	}
	// devuelve todas las plantillas para select Nota de Pedido
	public function getPlantillas(){
		$response = $this->Plantillainsumos->plantillaList();
		echo json_encode($response);
	}

	public function deletePlantilla(){
		
		$response = $this->Plantillainsumos->deletePlantilla($this->input->post('idPlantilla'));
		echo json_encode($response);
	}
	

}
?>