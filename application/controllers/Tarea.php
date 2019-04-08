<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Tarea extends CI_Controller {

    function __construct(){
			parent::__construct();
			$this->load->model('Tareas');
			$this->load->model('Bonitas');
			$this->load->model('Overviews');
			$this->load->model('Backlogs');
    }

    public function Obtener_Tarea(){

        $id     =$_POST['id_tarea'];
        $result = $this->Tareas->Obtener_Tareas($id);
        echo json_encode($result);
	}
	
	/*Fernando Leiva */
	public function Obtener_Todas(){
		echo json_encode($this->Tareas->Listado_Tareas());
	}

	public function Obtener_Subtareas(){
		$tarea_std = $this->input->post('tarea_std');
		$data = $this->Tareas->ObtenerSubtareas($tarea_std);
		echo json_encode($data);
	}

	public function Guardar_Subtareas(){
		$datos = $this->input->post();
		echo $this->Tareas->Guardar_SubTareas($datos);
	}

    public function Guardar_Tarea(){
        
			$descripcion =$this->input->post('descripcion');
			$data        = array(
					'descripcion' => $descripcion,
					'estado'      => "AC");
			$sql = $this->Tareas->Guardar_Tareas($data);
			echo json_encode($sql);
		}

    public function Modificar_Tarea(){

			$id=$this->input->post('id_tarea');
			$descripcion=$this->input->post('descripcion');
			
			$data = array(
										'id_tarea' => $id,
										'descripcion' => $descripcion,
							);
			$sql = $this->Tareas->Modificar_Tareas($data);
			echo json_encode($sql);
		}


    public function Eliminar_Tarea(){
    
        $id=$_POST['id_tarea']; 
        $result = $this->Tareas->Eliminar_Tareas($id);
        echo json_encode($result);      
		}
	/* ./ TAREAS ASSET ORIGINALES */
	
	/* INTEGRACION CON BPM */
		
		/*	./ FUNCIONES BPM */
			public function index($permission){

				$this->load->library('BPM');
				$detect = new Mobile_Detect();    
				
				//Obtener Bandeja de Usuario desde Bonita
				$response = $this->bpm->getToDoList();
				if(!$response['status']){echo json_encode($response);return;}

				//Completar Tareas con ID Solicitud y ID OT
				$data_extend = $this->Tareas->CompletarToDoList($response['data']);
				
				$data['list'] = $data_extend;
				$data['permission'] = $permission;		

				if ($detect->isMobile() || $detect->isTablet() || $detect->isAndroidOS()) {				
					
					$data['device'] = "android";

				}else{
					
					$data['device'] = "pc";				

				}
			
				$this->load->view('tareas/list',$data);
				
			}
			// Usr Toma tarea en BPM (Vistas tareas comunes)
			public function tomarTarea(){
				$userdata = $this->session->userdata('user_data');
						$usrId = $userdata[0]['usrId'];     // guarda usuario logueado
				//dump_exit($usrId);
				$idTarBonita = $this->input->post('idTarBonita');
				$estado = array (
					"assigned_id"	=>	$usrId
				);
				// trae la cabecera
				$parametros = $this->Bonitas->conexiones();
				// Cambio el metodo de la cabecera a "PUT"
				$parametros["http"]["method"] = "PUT";
				$parametros["http"]["content"] = json_encode($estado);
				// Variable tipo resource referencia a un recurso externo.
				$param = stream_context_create($parametros);
				$response = $this->Tareas->tomarTarea($idTarBonita,$param);
				echo json_encode($response);
			}
			// Usr Toma tarea en BPM  
			public function soltarTarea(){

				$idTarBonita = $this->input->post('idTarBonita');

				$estado = array (
					"assigned_id"	=>	""
				);
				// trae la cabecera
				$parametros = $this->Bonitas->conexiones();
				// Cambio el metodo de la cabecera a "PUT"
				$parametros["http"]["method"] = "PUT";
				$parametros["http"]["content"] = json_encode($estado);
				// Variable tipo resource referencia a un recurso externo.
				$param = stream_context_create($parametros);
				$response = $this->Tareas->soltarTarea($idTarBonita,$param);
				echo json_encode($response);
			}		

			// terminar tarea analisis de Solicitud de Servicios
			public function decidirUrgencia(){

				$idTarBonita = $this->input->post('idTarBonita');
				$opcion = $this->input->post('opcion');				
				$opcionSel = array(
					"esUrgente" => $opcion
				);
				// trae la cabecera
				$parametros = $this->Bonitas->conexiones();
				// Cambio el metodo de la cabecera a "PUT"
				$parametros["http"]["method"] = "POST";
				$parametros["http"]["content"] = json_encode($opcionSel);
				// Variable tipo resource referencia a un recurso externo.
				$param = stream_context_create($parametros);
				$result = $this->Tareas->cerrarTarea($idTarBonita, $param);
				echo json_encode($result);
			}

			public function ejecutarOT(){
				$idTarBonita = $this->input->post('idTarBonita');
				dump($idTarBonita, 'id bonita');
				// $id_listarea = $this->input->post('id_listarea');
				// trae la cabecera
				$parametros = $this->Bonitas->conexiones();
				// Cambio el metodo de la cabecera a "PUT"
				$parametros["http"]["method"] = "POST";
				// Variable tipo resource referencia a un recurso externo.
				$param = stream_context_create($parametros);
				$response = $this->Tareas->terminarTareaStandarenBPM($idTarBonita, $param);
				echo json_encode($response);
			}

			// trae datos para llenar notificaion estandar y formulario asociado
			public function detaTarea($permission,$idTarBonita){

				// detecta dispositivo				
					$detect = new Mobile_Detect();
					if ($detect->isMobile() || $detect->isTablet() || $detect->isAndroidOS()) {				
						$data['device'] = "android";
					}else{
						$data['device'] = "pc";				
					}
				//dump($idTarBonita, 'id tarea bonita en controller:');
				$data['permission'] = $permission;

				//OBTENER DATOS DE TAREA SELECCIONADA DESDE BONITA
				$data['TareaBPM'] = json_decode($this->getDatosBPM($idTarBonita),true);	
				$data['idTarBonita'] = $idTarBonita;
				$caseId = $data['TareaBPM']["caseId"];
			
				// Trae id de OT y de Sol Serv por CaseId			
				$id_SS = $this->getIdSolServPorIdCase($caseId);		
				$id_OT = $this->Tareas->getIdOtPorid_SS($id_SS);

				// Si hay Sol Serv trae el id de equpo sino por id de Ot
				if($id_SS!= null){
					$id_EQ = $this->Tareas->getIdEquipoPorIdSolServ($id_SS);
				}
				if($id_OT!= null){
					$id_EQ = $this->Tareas->getIdEquipoPorIdOT($id_OT);				
				}
	
				$data['id_OT'] = $id_OT;
				$data['id_SS'] = $id_SS;
				$data['id_EQ'] = $id_EQ;
				
				//$id_OT = 1;
				/* Bloque subtareas estandar */	
				if($id_OT != 0){
					/* funcion nueva de asset */										
					// traer subtareas estandar en funcion de tarea estandar					
					$tareaSTD = $this->Tareas->getIdTareaSTD($id_OT);
					$data['subtareas'] = $this->Tareas->getSubtareas($id_OT);
				}	

				//LIBRERIA BPM
				$case_id = $data['TareaBPM']["caseId"];
				$case = array('caseId'=>$case_id);
				$this->load->library('BPM',$case);

				// LINEA DE TIEMPO 			
				$data['timeline'] =$this->bpm->ObtenerLineaTiempo();	

				//CARGAR VISTA COMENTARIOS 
				$data_aux = ['case_id'=>$case_id, 'comentarios'=>$this->bpm->ObtenerComentarios()];
				$data['comentarios'] = $this->load->view('tareas/componentes/comentarios',$data_aux,true);
					
				switch ($data['TareaBPM']['displayName']) {
 
					case 'Analisis de Solicitud de Servicio':
							$this->load->view('tareas/view_analisisSServicios', $data);
							$this->load->view('tareas/scripts/tarea_std');							
							break;
					case 'Planificar Solicitud':					
							$this->load->view('tareas/view_planificar', $data);
							$this->load->view('tareas/scripts/tarea_std');							 						
							break;
					case 'Asignar Responsable OT Urgente ':
							$this->load->view('tareas/view_asignar', $data);
							$this->load->view('tareas/scripts/tarea_std');													
							break;						
					case 'Asignar Resonsable OT':
							$this->load->view('tareas/view_asignar', $data);
							$this->load->view('tareas/scripts/tarea_std');													
							break;
					case 'Editar Backlog':									
							$data['info'] = $this->getEditarBacklog($id_SS);						
							$this->load->view('backlog/nuevo_edicion_view_',$data);
							$this->load->view('tareas/scripts/tarea_std');
							break;					
					case 'Planificar Backlog':					
							$this->load->view('tareas/view_planificar', $data);
							$this->load->view('tareas/scripts/tarea_std');													
							break;							
					case 'Ejecutar OT':
							$this->load->view('tareas/view_ejecutarOT', $data);
							$this->load->view('tareas/scripts/tarea_std');
							$this->load->view('tareas/scripts/abm_forms');
							$this->load->view('tareas/scripts/validacion_forms');							
							break;
					case 'Esperando cambio estado "a Ejecutar"':
						$this->load->view('tareas/view_cambio_estado', $data);
						$this->load->view('tareas/scripts/tarea_std');
						break;
					case 'Esperando cambio estado "a Ejecutar" 2':
							$this->load->view('tareas/view_cambio_estado', $data);
							$this->load->view('tareas/scripts/tarea_std');
							break;
					default:
							$this->load->view('tareas/view_', $data);					
							$this->load->view('tareas/scripts/tarea_std');	
							break;
				}
			}	

			function getIdSolServPorIdCase($caseId){
				// trae la cabecera
				$parametros = $this->Bonitas->conexiones();
				// Cambio el metodo de la cabecera a "GET"
				$parametros["http"]["method"] = "GET";				
				$param = stream_context_create($parametros);
				$response = $this->Tareas->getIdSolServPorIdCase($caseId, $param);
				//dump($response["value"], 'respuesta bonita');
				return $response["value"];
			}			
		
			// Trae datos de backlog para editar
			function getEditarBacklog($id_SS){
				$result = $this->Tareas->geteditar($id_SS);	
				return $result;
			}	
			
			// Trae datos de BPM para notif estandar
			public function getDatosBPM($idTarBonita){

				// trae la cabecera
				$parametros = $this->Bonitas->conexiones();

				// Cambio el metodo de la cabecera a "PUT"
				$parametros["http"]["method"] = "GET";

				// Variable tipo resource referencia a un recurso externo.
				$param = stream_context_create($parametros);
				$response = $this->Tareas->getDatosBPM($idTarBonita,$param);

				return $response;
			}
			// Trae id de tarea de trazajobs segun id de tarea bonita - NO TOCAR
			public function getIdTareaTraJobs($idTarBonita){

				try {
					$metodo = "GET";
					$parametros = $this->Bonitas->LoggerAdmin();
					$param = stream_context_create($parametros);
					$idTJobs = $this->Tareas->getIdTareaTraJobs($idTarBonita,$param);
				} catch (Exception $e) {
					$idTJobs = 0;
					echo 'Excepción capturada: ',  $e->getMessage(), "\n";
				}

				return $idTJobs;
			}
			// cambia el estado de cada subtarea 
			public function cambiarEstadoSubtask(){
				$idlistarea = $this->input->post('idListarea');
				$estado = $this->input->post('estado');
				$response = $this->Tareas->cambiarEstadoSubtask($idlistarea,$estado);
			}
		/*	./ FUNCIONES BPM */
		
		/* COMENTARIOS */
		public function GuardarComentario(){
			$comentario = $this->input->post();
			$this->load->library('BPM',$idCase);
			$response = $this->bpm->GuardarComentario($comentario);
			echo json_encode($response);
		}	

		public function ObtenerComentariosBPM($case_id){
			$this->load->library('BPM',$case_id);
			$data['comentarios'] = $this->bpm->ObtenerComentariosBPM();
			$data['case_id'] = $case_id;
			$this->load->view('tareas/componentes/comentarios',$data);
		}
			// Comentarios
				// public function ObtenerComentariosBPM($caseId){
				// 	$parametros = $this->Bonitas->conexiones();
				// 	$param = stream_context_create($parametros);
				// 	return $this->Tareas->ObtenerComentariosBPM($caseId,$param);
				// }		
				
				// public function GuardarComentario(){
				// 	$comentario = $this->input->post();
				// 	// trae la cabecera
				// 	$parametros = $this->Bonitas->conexiones();
			
				// 	// Cambio el metodo de la cabecera a "PUT"
				// 	$parametros["http"]["method"] = "POST";
				// 	$parametros["http"]["content"] = json_encode($comentario);
				// 	// Variable tipo resource referencia a un recurso externo.
				// 	$param = stream_context_create($parametros);
				// 	$response = $this->Tareas->GuardarComentarioBPM($param);
				// 	echo json_encode($response);
				// }	

				// public function ObtenerLineaTiempo($caseId){
				// 	$parametros = $this->Bonitas->LoggerAdmin();
				// 	$parametros["http"]["method"] = "GET";
				// 	$param = stream_context_create($parametros);
				// 	$data['listAct'] = $this->Overviews->ObtenerActividades($caseId,$param);
				// 	$data['listArch'] = $this->Overviews->ObtenerActividadesArchivadas($caseId,$param);
				// 	return $data;
				// }
		/*	./	COMENTARIOS */

		/*	FORMULARIOS */
			// trae datos para dibujar formulario en modal
			public function Obtener_Formulario(){
				
				$infoId = $this->input->post('infoId');
				$data['form'] = $this->Tareas->get_form($infoId);				
				$response['html'] = $this->load->view('tareas/viewFormSubtareas', $data, true);
				echo json_encode($response);
			}

			public function validarCamposObligatorios(){
				
				$info = $this->input->post('formIdOt');
				//dump($info, 'formularios ids: ');
				$i=0;
				foreach ($info as $value) {
					$idForm = $value['idForm'];
					$idOT = $value['idOT'];
				
					if ($this->Tareas->validarCamposObligatorios($idForm,$idOT)) {
						$novalidados[$i] = $idForm;
						$i++;
					}
				}
				echo json_encode($novalidados);
			}
			// valida que los campos obligatorios esten completados
			// public function ValidarObligatorios(){
			// 	$form_id = $this->input->post("form_id");
			// 	$id_OT = $this->input->post("id_OT");
			// 	$result = $this->Tareas->ValidarObligatorios($form_id,$id_OT);
			// 	//dump($result, 'validaaion: ');
			// 	echo $result['result'];
			// }			
			// guarda  form commpletado 
			public function guardarForm(){

				//  array con id de dato->valor(dato es FOCO_ID)
				$datos = $this->input->post();

				$userdata = $this->session->userdata('user_data');
				$usrId = $userdata[0]['usrId'];     // guarda usuario logueado

				$listarea = $datos['id_listarea'];
				$idformulario = $datos['idformulario'];
				$i = 1;// para guardar el orden de categorias, grupos y valores
				$j = 0;

				foreach ($datos as $key => $value) {
					
					// Si no son los primeros dos campos id listarea e id formulario
					if (($key != 'id_listarea') && ($key != 'idformulario')) {
						//trae array con info de dato por id
						//dump($key, 'key: ');
						$data = $this->Tareas->getDatos($key);// en este punto $key = FOCO_ID
						//dump($data, 'dat por foco id:');
						
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

						$this->Tareas->UpdateForm($data,$key); // $key = FOCO_ID

						$i++;
					}
				}
				//FIXME: VER LA VUELTA ECHO
				echo true;
			}
		/*	./ FORMULARIOS */


	/*  ./ INTEGRACION CON BPM */
	

	
} 

?>