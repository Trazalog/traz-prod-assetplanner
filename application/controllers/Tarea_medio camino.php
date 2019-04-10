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
			//$data['device'] = "android";


			//OBTENER DATOS DE TAREA SELECCIONADA DESDE BONITA
			$data['TareaBPM'] = json_decode($this->getDatosBPM($idTarBonita),true);

			/* funcion nueva de asset */
			//FIXME: SACAR HARDCODEO A NOMBRE DE TAREA
			// traer subtareas estandar en funcion de tarea estandar
			$data['TareaBPM']["displayName"] = 'Revision total de motor';
			$data['subtareas'] = $this->Tareas->getSubtareas($data['TareaBPM']["displayName"]);			
			//$data['subtareas'] = $this->Tareas->getSubtareaseEstandar('Revision total de motor');
			//dump($data['subtareas'], 'subtareas: ');




			//Verificar si es tarea Std (tabla tareas)
			//$data['infoTarea'] = $this->Tareas->getDatosTarea($data['TareaBPM']["displayName"]);

			//$id_listarea = 0;
			// tareas visible = 1 (tarea est), visible = 0 (tarea BPM)
			//if($data['infoTarea']['visible']==1){// Pregunta si es Una TareasSTD
				// siempre serran tareas estandar or eso nopregunta ( if arriba)
				$id_listarea = $this->getIdTareaTraJobs($idTarBonita); 
			//}
			//FIXME: SACAR COMENTARIO LINEA SIGUIENTE ($idOT)
			// Trae id_listarea desde BPM sino '0' si la tarea es solo de BPM(no form asociado)
				//$idOT = $this->Tareas->getIdOtPorIdBPM($idTarBonita);

			//FIXME: SACAR COMENTARIO LINEA SIGUIENTE ($caseId, $ptr_id)
			// trae id de pedido trabajo por caseId para guardar en form inicial
				// $caseId = $data['TareaBPM']["caseId"];
				// $ptr_id = $this->Tareas->getPtrIdPorCaseId($caseId);
			
			//si trae id_listarea (TJobs)
			if($id_listarea != 0){
				// trae id de form asociado a tarea std (las tareas de BPM se cargaran para asociar a form).

				$data['id_listarea'] = $id_listarea;

				$idTareaStd = $this->Tareas->getTarea_idListarea($id_listarea);
				$idForm = $this->Tareas->getIdFormPorIdTareaSTD($idTareaStd); // si es 0 no hay form asociado

				// si hay id de formulario
				if($idForm != 0){
					// confirma si hay form guardado de esa listarea
					if ($this->Tareas->getEstadoForm($idTarBonita)) {
						//echo "hay form guardado";
					}
					else{
						//echo "no hay form guradado";
						// guarda form inicial vacio
						$this->Tareas->setFormInicial($idTarBonita,$idForm,$ptr_id);
					}
				}

				// si hay formulario
				if($idForm != 0){
					$data['idForm']	= $idForm;
					// carga datos del formulario para modal
					$data['form'] = $this->Tareas->get_form($idTarBonita,$idForm);
				}else{
					$data['idForm'] = 0;
				}

			//solo tarea BPM con o sin formulario
			}else{

					$nomtarea = $data['TareaBPM']["displayName"];
					$id = $this->Tareas->getidFormTareaBPM($nomtarea);

					if($id){
						$idForm = $id[0]['form_asoc'];

						// si hay id de formulario
						if($idForm != 0){
							// confirma si hay form guardado de esa listarea
							if ($this->Tareas->getEstadoForm($idTarBonita)) {
								//echo "hay form guardado";
							}
							else{

								$this->Tareas->setFormInicial($idTarBonita,$idForm,$ptr_id);
							}
						}

						$data['idForm'] = $id[0]['form_asoc'];
						$data['form'] = $this->Tareas->get_form($idTarBonita,$idForm);

					}else{

						$data['idForm'] = 0;
						$idForm=0;
					}

			}
				// si es 0 no hay form asociado
			//dump_exit($idForm);
			$data['permission'] = $permission;
			//FIXME: SACA HARDCODEO $idOT
			//$data['idOT'] = $idOT;
			//OBTENER DATOS DE TAREA SELECCIONADA DESDE BONITA
			$data['TareaBPM'] = json_decode($this->getDatosBPM($idTarBonita),true);
			$caseId = $data['TareaBPM']["caseId"];
			//$caseId =75;
			//FIXME: SACAR HARDCODEO 
			// trae id pedido de trabajo desde trj_pedido_trabajo
			//$pedTrab = $this->Tareas->getIdPedTrabajo($caseId);
			//var_dump($pedTrab[0]['petr_id']);
			//$data['idPedTrabajo'] = $pedTrab[0]['petr_id'];
			//$data['codInterno'] = $pedTrab[0]['cod_interno'];
			//FIXME: SACAR COMENTADO
			// $data['datos'] = $this->Tareas->detaTareas($id_listarea);

			$data['idTarBonita'] = $idTarBonita;

			//FLEIVA COMENTARIOS
			$data['comentarios'] = $this->ObtenerComentariosBPM($caseId);
			$data['timeline'] = $this->ObtenerLineaTiempo($caseId);
			//	$data['TareaBPM']['displayName'] = 'Programar Armado';
			switch ($data['TareaBPM']['displayName']) {

				// case 'Evaluación del estado de cuenta del cliente':
				// 	$this->load->view('tareas/view_1', $data);
				// 	break;
				// case 'Entender si seguir esperando':
				// 	$this->load->view('tareas/view_2', $data);
				// 	break;					
				// case 'Análisis financiero y emisión de reportes':
				// 	$this->load->view('tareas/view_3', $data);
				// 	break;
				//TODO: NO SACAR ESTE COMENTARIO (Solicita ok al cliente para iniciar diagnostico)
					// case 'Solicita ok al cliente para iniciar diagnostico':					
				// 	$this->load->model('AceptacionTrabajos');
				// 	$data['presupuesto'] = $this->AceptacionTrabajos->ObtenerPresupuesto($pedTrab[0]['petr_id']);
				// 	$this->load->view('tareas/view_', $data);
				// 	break;
				// case 'Evalua y envia presupuesto al cliente':
				// 	$this->load->model('AceptacionTrabajos');
				// 	$data['presupuesto'] = $this->AceptacionTrabajos->ObtenerPresupuesto($pedTrab[0]['petr_id']);
				// 	$this->load->view('tareas/view_4', $data);
				// 	break;
				// case 'Planificar Diagnóstico':
				// 	$data['tipo_tarea'] = 'Diagnostico';
				// 	$data['nombre_boton_planificacion'] = 'Orden de Trabajo';						
				// 	$this->load->view('tareas/view_planificacion', $data);
				// 	break;
				// case 'Programar Armado':
				// 	$data['tipo_tarea'] = 'Armado';
				// 	$data['nombre_boton_planificacion'] = 'Programar Armado';					
				// 	$this->load->view('tareas/view_planificacion', $data);
				// 	break;
				// case 'Programar Reparación':
				// 	$data['tipo_tarea'] = 'Reparacion';
				// 	$data['nombre_boton_planificacion'] = 'Programar Reparacion';					
				// 	$this->load->view('tareas/view_planificacion', $data);
				// 	break;
				// case 'Asignar personal a Planificación':		//con comentarios listo
				// 	$ot = $this->Tareas->getOrdenTrabajoPorCaseId($caseId);
				// 	$data['idOT'] = $ot['id_orden'];
				// 	$data['tipo_tarea'] = $ot['tipo'];
				// 	$this->load->view('tareas/view_asigPersPlanif', $data);
				// 	break;				
				// 	case 'Revisión Diagnóstico':
				// 	$this->load->model('Preinformes');
				// 	$data['formularios'] = $this->Preinformes->ObtenerIdFormulariosCompletados($data['idPedTrabajo']);
				// 	$this->load->view('tareas/view_8', $data);
				// 	break;
				// case 'Cotización de trabajo Industrial':
				// 	$this->load->model('Preinformes');
				// 	$data['formularios'] = array(2500);
				// 	$data['list'] = $this->Notapedidos->notaPedidosxId($datos[0][ 'id_orden']);
				// 	$data['list'] = $this->Notapedidos->notaPedidosxId($data['codInterno']);
				// 	$this->load->view('tareas/view_9', $data);
				// 	break;
				// case 'Confección de Presupuesto Industrial':
				// 	$data['cotizacion'] = $this->Tareas->ObtenerCotizacion($data['idPedTrabajo']);
				// 	$this->load->view('tareas/view_10', $data);
				// 	break;
				// case 'Revisión Diagnóstico por el Coordinador':
				// 	$idForm = 2500;
				// 	$data['idForm'] = $idForm;
				// 	if(!$this->Tareas->getEstadoForm($idTarBonita))$this->Tareas->setFormInicial($idTarBonita,$idForm,$data['idPedTrabajo']);
				// 	$data['form']   = $this->Tareas->get_form($idTarBonita,$idForm);
				// 						//dump_exit($data['form']);
				// 	$data['list']   = $this->Tareas->tareasPorSector($caseId);
				// 	$this->load->view('tareas/view-revision-diagnostico-coordinador', $data);
				// 	break;
				// case 'Analiza Vigencia del presupuesto aprobado':
				// 	$this->load->view('tareas/view_11',$data);
				// 	break;
				default:
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
		
		
		
		// Comentarios
		public function ObtenerComentariosBPM($caseId){
			$parametros = $this->Bonitas->conexiones();
			$param = stream_context_create($parametros);
			return $this->Tareas->ObtenerComentariosBPM($caseId,$param);
		}		
		
		public function GuardarComentario(){
			$comentario = $this->input->post();
			// trae la cabecera
			$parametros = $this->Bonitas->conexiones();
	
			// Cambio el metodo de la cabecera a "PUT"
			$parametros["http"]["method"] = "POST";
			$parametros["http"]["content"] = json_encode($comentario);
			// Variable tipo resource referencia a un recurso externo.
			$param = stream_context_create($parametros);
			$response = $this->Tareas->GuardarComentarioBPM($param);
			echo json_encode($response);
		}	

		public function ObtenerLineaTiempo($caseId){
			$parametros = $this->Bonitas->LoggerAdmin();
			$parametros["http"]["method"] = "GET";
			$param = stream_context_create($parametros);
					$data['listAct'] = $this->Overviews->ObtenerActividades($caseId,$param);
					$data['listArch'] = $this->Overviews->ObtenerActividadesArchivadas($caseId,$param);
					return $data;
		}
		
		/*FORMULARIOS */

		// guarda  form commpletado 
		public function guardarForm(){

			//  array con id de dato->valor(dato es FOCO_ID)
			$datos = $this->input->post();
			//dump_exit($datos);
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
					$data = $this->Tareas->getDatos($key);
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

					$this->Tareas->UpdateForm($data,$key); // key es FOCO_ID

					$i++;
				}

			}
		}



	/*  ./ INTEGRACION CON BPM */
	

	
} 

?>