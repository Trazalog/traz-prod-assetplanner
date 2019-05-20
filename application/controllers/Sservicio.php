<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sservicio extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('Sservicios');
		$this->load->model('Bonitas');
	}
	// Trae sectores por empresa logueada - Listo
	public function getSector()
	{
		$response = $this->Sservicios->getSectores($this->input->post());
		echo json_encode($response);
	}
	public function getEquipo()
	{
		$response = $this->Sservicios->getEquipos($this->input->post());
		echo json_encode($response);
	}
	// Elimina solicitud - Listo 
	public function elimSolicitud()
	{
		$id = $this->input->post('id_solic');
		$response = $this->Sservicios->elimSolicitudes($id);
		echo json_encode($response);
	}
	// Trae equipos segun sector de empresa logueada - Listo
	public function getEquipSector()
	{
		$response = $this->Sservicios->getEquipSectores($this->input->post());
		echo json_encode($response);
	}
	//Trae datos para impresion de solicitud - Listo
	public function getsolImp()
	{
		$id = $_POST['idservicio'];

		$result = $this->Sservicios->getsolImps($id);

		if ($result) {

			$arre['datos'] = $result;
			print_r(json_encode($arre));
		} else echo "nada";
	}
	// Trae usuarios registrados (para solicitantes de la SServicio)
	public function getOperario() // Ok
	{
		$response = $this->Sservicios->getOperarios($this->input->post());
		echo json_encode($response);
	}
	/* FUNCIONES ORIGINALES DE ASSET	*/

	/* INTEGRACION CON BPM */

		public function index($permission)
		{
			$data['list']       = $this->Sservicios->servicios_List();
			//dump($data, ' sservicios: ');
			$data['permission'] = $permission;
			$this->load->view('Sservicios/list_bpm', $data);
		}
		// trae tareas estandar para select de nueva solicitud
		public function getTareasStandar()
		{
			$result = $this->Sservicios->getTareasStandar();
			echo json_encode($result);
		}
		// GUARDA SSERVICIOS y lanza proceso en BPM (inspección)
		function lanzarProcesoBPM()
		{
			$this->load->library('BPM');
			// inserta registro en  tabla solicitud de reparacion
			$id_solServicio  = $this->Sservicios->setservicios($this->input->post());

			if ($id_solServicio) {
				//Contrato para lanzar Solcitud de Servicio
				$contract = array(
					"idSolicitudServicio"	=>	$id_solServicio,
					"idOT"  => 	0
				);

				//Lanzar Proceso
				$responce  = $this->bpm->LanzarProceso($contract);
				if(!$responce['status']){echo json_encode($responce); return;}

				//Validar Resultado
			
				if ($responce['case_id']) {

					//update de solic de servicio concaseid
					if($this->Sservicios->setCaseId($responce['case_id'],$id_solServicio)){

						echo json_encode(['status'=> true, 'msj'=>'OK']);return;

					}else{

						echo json_encode(['status'=> false, 'msj'=>ASP_0200]);return;

					}				

				} else{ 

					//Falla Lanzar el Procesoy elimina la solicitud
					$result = $this->Sservicios->elimSolicitudes($id_solServicio);
					echo json_encode(['status'=> false, 'msj'=>ASP_0100]);
					return;
				}
		
			}else{ 

				//Falla Lanzar el Procesoy elimina la solicitud
				$result = $this->Sservicios->elimSolicitudes($id_solServicio);
				echo json_encode(['status'=> false, 'msj'=>ASP_0100]);
				return;
			}
		}

	/*	./INTEGRACION CON BPM */



	public function getInfoEquipo()
	{
		$data = $this->Sservicios->getInfoEquipos($this->input->post());
		if ($data  == false) {
			echo json_encode(false);
		} else {
			echo json_encode($data);
		}
	}

	
	
	// Guarda solicitud de Servicio - Listo
	public function setservicios(){

		$data = $this->Sservicios->setservicios($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);	
		}
	}

	
//////// no vistas
	public function get_SolicTerminada(){

		$data['list'] = $this->Sservicios->get_SolicTerminadas();
		$data['permission'] = $permission;
		$this->load->view('Sservicios/list_term', $data);
	}
	public function confSolicitud()
	{
		$data = $this->Sservicios->confSolicitudes($this->input->post());
		if ($data  == false) {
			echo json_encode(false);
		} else {
			echo json_encode(true);
		}
	}
	public function activSolicitud()
	{
		$data = $this->input->post();
		$response = $this->Sservicios->activSolicitudes($data);
		$this->load->view('Sservicios/list', $data);
	}	
	

}
