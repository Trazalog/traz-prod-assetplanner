<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Tarea extends CI_Controller {

    function __construct(){
			parent::__construct();
			$this->load->model('Tareas');
			$this->load->model('Bonitas');
			$this->load->model('Overviews');
    }
	/* TAREAS ASSET ORIGINALES */	
    // public function index($permission)
    // {
    //     $data['list']       = $this->Tareas->Listado_Tareas();
    //     $data['permission'] = $permission;
    //     $this->load->view('tarea/list', $data);
    // }
    public function Obtener_Tarea(){

        $id     =$_POST['id_tarea'];
        $result = $this->Tareas->Obtener_Tareas($id);
        echo json_encode($result);
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

				//$this->load->library('Mobile_Detect');
				$detect = new Mobile_Detect();    

				$parametros = $this->Bonitas->conexiones();
				$param = stream_context_create($parametros);
				$data['list'] = $this->Tareas->getTareas($param);
				$data['permission'] = "Add-Edit-Del-View-";		

				if ($detect->isMobile() || $detect->isTablet() || $detect->isAndroidOS()) {				
					//$this->load->view('tareas/list_mobile',$data);
					$data['device'] = "android";
				}else{
					//$this->load->view('tareas/list_mobile',$data);
					$data['device'] = "pc";				
				}
				//$data['device'] = "android";
				//dump_exit($data['device']);
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
			// termina tareas en BPM
			public function terminarTareaStandarenBPM(){

				$idTarBonita = $this->input->post('idTarBonita');
				//$id_listarea = $this->input->post('id_listarea');
				// trae la cabecera
				$parametros = $this->Bonitas->conexiones();
				// Cambio el metodo de la cabecera a "PUT"
				$parametros["http"]["method"] = "POST";
				// Variable tipo resource referencia a un recurso externo.
				$param = stream_context_create($parametros);
				$response = $this->Tareas->terminarTareaStandarenBPM($idTarBonita,$param);
	
				// guarda el taskId de BPM en tbl_listareas
				if($this->input->post('esTareaStd')==1){
					$resp = $this->Tareas->updateTaskEnListarea($id_listarea,$idTarBonita);
				}
	
				echo json_encode($response);
			}
			// trae datos para llenar notificaion estandar y formulario asociado
			public function detaTarea($permission,$idTarBonita){

				// detecta dispositivo
				//$this->load->library('Mobile_Detect');
				$detect = new Mobile_Detect();
				if ($detect->isMobile() || $detect->isTablet() || $detect->isAndroidOS()) {				
					$data['device'] = "android";
				}else{
					$data['device'] = "pc";				
				}

				//OBTENER DATOS DE TAREA SELECCIONADA DESDE BONITA
				$data['TareaBPM'] = json_decode($this->getDatosBPM($idTarBonita),true);	
				$data['idTarBonita'] = $idTarBonita;
				$caseId = $data['TareaBPM']["caseId"];

				//FIXME: SACAR HARDCODEO A NOMBRE DE TAREA
				$data['TareaBPM']["displayName"] = 'Revision total de motor';

				//Devuelve datos de tarea por nombre 
				$data['infoTarea'] = $this->Tareas->getDatosTarea($data['TareaBPM']["displayName"]);
				//dump($data['infoTarea'], 'info tarea');
				$id_listarea = 0;
				if($data['infoTarea']['visible']==1){// Pregunta si es Una TareasSTD o de BPM
					//FIXME: FUNCION Q DEVOLVERA id de OT desde BPM
					//$id_listarea = $this->getIdTareaTraJobs($idTarBonita); 
					//$id_OT = $this->getIdOT($idTarBonita);
					$id_OT = 22;
					$data['id_OT'] = $id_OT;
					$data['id'] = 160501;
				}
				
				// Formularios para subtareas (las tareas no tienen fomularios)
				// si hay OT
				if($id_OT != 0){
					/* funcion nueva de asset */
					// trae id de form asociado a tarea std (las tareas de BPM se cargaran para asociar a form).						
					// traer subtareas estandar en funcion de tarea estandar					
					$idTareaSTD = $this->Tareas->getIdTareaSTD($data['TareaBPM']["displayName"]);
					$data['subtareas'] = $this->Tareas->getSubtareas($idTareaSTD);
				
					foreach ($data['subtareas'] as $subtarea) {
						// confirma si hay form guardado de esa
						if ($this->Tareas->getEstadoForm($idTarBonita)) {
							//echo "hay form guardado";
						}
						else{
							// guarda form inicial vacio
							$idForm = $subtarea['form_asoc'];						
							$this->Tareas->setFormInicial($idTarBonita,$idForm,$id_OT);
						}
					}	
				}	

				// comentarios y linea de tiempo desde libreria					
				$idCase = array('caseId'=>$data['TareaBPM']["caseId"]);
				$this->load->library('BPM',$idCase);
				$data['timeline'] = $this->bpm->ObtenerLineaTiempo();	
				$data['comentarios'] = $this->bpm->ObtenerComentariosBPM();

				switch ($data['TareaBPM']['displayName']) {
 
					
					default:
						//dump($data, 'datos');
						$this->load->view('tareas/view_', $data);
					break;
				}
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
			public function cambioEstadoSubtarea(){
				$idlistarea = $this->input->post('idlistarea');
				$estado = $this->input->post('estado');
			}
		/*	./ FUNCIONES BPM */
		
		/* COMENTARIOS */
		public function GuardarComentario(){
			$comentario = $this->input->post();
			$this->load->library('BPM',$idCase);
			$response = $this->bpm->GuardarComentario($comentario);
			echo json_encode($response);
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
				$bpm_task_id = $this->input->post('bpm_task_id');	
				// traer el bpm_task_id para traer el formulario de la subtarea (consulta en formcompletados)
				$id_form = $this->input->post('form_id');
				$data['idForm']	= $this->input->post('form_id');
				$data['form'] = $this->Tareas->get_form($bpm_task_id,$id_form);
				//dump($data['form'], 'formulariosss:  ');
				$response['html'] = $this->load->view('tareas/viewFormSubtareas', $data, true);
				echo json_encode($response);
			}
			// valida que los campos obligatorios esten completados
			public function ValidarObligatorios(){
				$form_id = $this->input->post("form_id");
				$id_OT = $this->input->post("id_OT");
				$result = $this->Tareas->ValidarObligatorios($form_id,$id_OT);
				//dump($result, 'validaaion: ');
				echo $result['result'];
			}			
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
						$data = $this->Tareas->getDatos($key);// en este punto $key = FOCO_ID
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