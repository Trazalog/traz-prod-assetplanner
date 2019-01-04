<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sservicio extends CI_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('Sservicios');
		$this->load->model('Bonitas');
	}
	/* FUNCIONES ORIGINALES DE ASSET	*/
		// public function index($permission){
		// 	$data['list']       = $this->Sservicios->servicios_List();
		// 	$data['permission'] = $permission;
		// 	$this->load->view('Sservicios/list', $data);
		// }	
		// Trae sectores por empresa logueada - Listo
		public function getSector(){
			$response = $this->Sservicios->getSectores($this->input->post());
			echo json_encode($response);
		}
		public function getEquipo(){
			$response = $this->Sservicios->getEquipos($this->input->post());
			echo json_encode($response);
		}
		// Elimina solicitud - Listo 
		public function elimSolicitud(){
			$id = $this->input->post('id_solic');
			$response = $this->Sservicios->elimSolicitudes($id);
			echo json_encode($response);
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
		// Trae equipos segun sector de empresa logueada - Listo
		public function getEquipSector(){
			$response = $this->Sservicios->getEquipSectores($this->input->post());
					echo json_encode($response);
		}
		//Trae datos para impresion de solicitud - Listo
		public function getsolImp(){  
			$id=$_POST['idservicio'];

			$result = $this->Sservicios->getsolImps($id);		
			
			if($result)
			{	
				
				$arre['datos']=$result;
				print_r(json_encode($arre));
				
			}
			else echo "nada";
			//return json_encode($arre);
		}
	/* FUNCIONES ORIGINALES DE ASSET	*/	

	/* INTEGRACION CON BPM */

		public function index($permission){
			$data['list']       = $this->Sservicios->servicios_List();
			$data['permission'] = $permission;
			$this->load->view('Sservicios/list_bpm', $data);
		}
		// trae tareas estandar para select de nueva solicitud
		public function getTareasStandar(){
			$result = $this->Sservicios->getTareasStandar();
			echo json_encode($result);
		}
		// lanza proceso en BPM (inspección)
		function lanzarProcesoBPM(){
			//TODO: traer id de solicitud de servicio para enviar a bpm
					//	revisar contract		
			
			// inserta registro en  tabla solicitud de reparacion
			$id_solServicio = $this->Sservicios->setservicios($this->input->post());
			
			if($id_solServicio){
				$parametros = $this->Bonitas->conexiones();
				$parametros["http"]["method"] = "POST";
				$idInspector = array (
					"id_solServicio"	=>	$id_solServicio
				);	
				$parametros["http"]["content"] = json_encode($idInspector);
				$param = stream_context_create($parametros);
				$result = $this->Sservicios->lanzarProcesoBPM($param);
				echo json_encode($result);		
			}else{ 
				$result = $this->Sservicios->elimSolicitudes($id_solServicio);
				$result = 100;// codigo inventado
				echo json_encode($result);
			}
			
		}




	/*	./INTEGRACION CON BPM */


	


//////// no vistas
	public function get_SolicTerminada(){

		$data['list'] = $this->Sservicios->get_SolicTerminadas();
		$data['permission'] = $permission;
		$this->load->view('Sservicios/list_term', $data);
	}

	public function getInfoEquipo(){

		$data = $this->Sservicios->getInfoEquipos($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);	
		}
	}	

	public function confSolicitud(){

		$data = $this->Sservicios->confSolicitudes($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);	
		}
	}

	public function activSolicitud(){
		$data = $this->input->post();
		$response = $this->Sservicios->activSolicitudes($data);
		echo json_encode($response);
	}

	// public function indexSolicitante($permission){
		
	// 	//echo "est en el controller";
	// 	$data['list'] = $this->Sservicios->servicios_List();
	// 	$data['permission'] = $permission;
	// 	$this->load->view('Sservicios/list_solicitante', $data);
	// }

}
