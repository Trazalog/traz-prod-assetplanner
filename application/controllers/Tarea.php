<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Tarea extends CI_Controller {

		function __construct(){
			parent::__construct();
			$this->load->model('Tareas');		
			$this->load->model('Backlogs');
		}

		// llama ABM tareas estandar
		public function index2($permission)
    {
        $data['list']       = $this->Tareas->Listado_Tareas();
        $data['permission'] = $permission;
        $this->load->view('tarea/list', $data);
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
			// Bandea de entrada
			public function index($permission = null){

				$detect = new Mobile_Detect();    				
				//Obtener Bandeja de Usuario desde Bonita
				$response = $this->bpm->getToDoList();
				//dump($response, 'respuesta tareas BPM: ');
				if(!$response['status']){
					//$this->load->view('404');
					return;
				}
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
			// Verifica si la tarea fue guardada la fecha de inicio
			public function confInicioTarea(){
				$id_OT = $this->input->get('id_OT');
				//dump($id_OT, 'id_OT: ');
				$fecha = $this->Tareas->confInicioTareas($id_OT);
				//dump($fecha, 'fecha: ');
				
				if ($fecha == '0000-00-00 00:00:00') {
					echo json_encode(FALSE);
				} else {
					echo json_encode(TRUE);
				}			
			}
			// marca inicio de Tarea en OT
			public function inicioTarea(){
				
				$id_OT = $this->input->post('id_OT');
				$estado = 'C';
				// graba fecha de inicio en OT
				if ($this->Tareas->inicioTareas($id_OT)) {
						//cambia el estado a a OT
						if ($this->Tareas->cambiarEstado($id_OT, $estado, 'OT')) {
								// averigua origen de OT
								$origen = $this->Tareas->getOrigenOt($id_OT);	
								$numtipo = 	$origen[0]['tipo'];
								$id_solicitud = $origen[0]['id_solicitud'];

								switch ($numtipo) {
									case '2':
										$tipo = 'correctivo';
										break;
									case '3':
										$tipo = 'preventivo';
										break;									
									case '4':
										$tipo = 'backlog';
										// aca buscar sore_id y cambiar estado a sol de serv
										$idSservicios = $this->Tareas->getSoreIdporBackId($id_solicitud);
										if ($idSservicios != NULL) {
											$response = $this->Tareas->cambiarEstado($idSservicios, $estado, 'correctivo');
										}									
										break;								
									default:
										$tipo = 'predictivo';
										break;
								}
								// cambia estado a la Tarrea origen de OT
								$response = $this->Tareas->cambiarEstado($id_solicitud, $estado, $tipo);
								echo json_encode($response);
								
						} else {
							echo json_encode(FALSE);
							
						}				
				} else {
					echo json_encode(FALSE);
				}
			}
			// Usr Toma tarea en BPM (Vistas tareas comunes)
			public function tomarTarea(){								

				$idTarBonita = $this->input->post('idTarBonita');
			
				$response = $this->bpm->setUsuario($idTarBonita, userId());

				echo json_encode($response);
			}
			// Usr Toma tarea en BPM  
			public function soltarTarea(){

				$idTarBonita = $this->input->post('idTarBonita');
				
				$response = $this->bpm->setUsuario($idTarBonita, '');

				echo json_encode($response);
			}		
			// terminar tarea analisis de Solicitud de Servicios
			public function decidirUrgencia(){

				$idTarBonita = $this->input->post('idTarBonita');
				$opcion = $this->input->post('opcion');				
				$contract = array(
					"esUrgente" => $opcion
				);
			
				$result = $this->bpm->cerrarTarea($idTarBonita, $contract);

				echo json_encode($result);
			}
			// terminar tarea verificar Informe Servicios
			public function verificarInforme(){
				
				//log
					log_message('DEBUG', 'TRAZA | Tarea/verificarInforme()');					

				$id_OT = $this->input->post('id_OT');
				$id_SS = $this->input->post('id_SS');
				$idTarBonita = $this->input->post('idTarBonita');
				$opcion = $this->input->post('opcion');	
				// averigua origen de OT
				$origen = $this->Tareas->getOrigenOt($id_OT);
				$numtipo = 	$origen[0]['tipo'];
				$id_solicitud = $origen[0]['id_solicitud'];
				$estado = 'CE';
				switch ($numtipo) {
					case '2':
						$tipo = 'correctivo';
						break;
					case '3':
						$tipo = 'preventivo';
						break;					
					case '4':
						$tipo = 'backlog';
						break;				
					default:
						$tipo = 'predictivo';
						break;
				}	

				$opcionSel = array(
					"informeServicioOk" => $opcion
				);
				
				$result = $this->bpm->cerrarTarea($idTarBonita,$opcionSel);

				// log
					log_message('DEBUG', 'TRAZA | $idTarBonita: '.$idTarBonita);
					log_message('DEBUG', 'TRAZA | Informe correcto?: '.$opcionSel);

				// si cierra la tarea en BPM
				if ($response['status']){

						// La respuesta es Informe de Servicios 'CORRECTO'
						if($opcion){
							
								// cambia el estado a lo que no sea SServicios(esta cambia con la conformidad del solicitante)
								if($tipo != 'correctivo'){
									//cambia el estado de la Tarea (Back, Prevent o Predict) a CERRADO
									$result = $this->Tareas->cambiarEstado($id_solicitud, $estado, $tipo);
								}else{								
									//Cambio Sol Servicio  a TERMINADO					
									$result = $this->Tareas->cambiarEstado($id_SS, $estado, $tipo);
								}		
																		
								// Cambia  estado de la OT a CERRADO					
								$result = $this->Tareas->cambiarEstado($id_OT, $estado, 'OT');

								// Cambio Inform Servicio  a TERMINADO					
								$result = $this->Tareas->cambiarEstado($id_OT, 'CE', 'informe servicios');

								// si guarda en BD	
								if ($result) {
									echo json_encode(['status'=>true, 'msj'=>'OK']);
									return;
								}else{								
									echo json_encode(['status'=>false, 'msj'=> 'Error en Cambio Estado OT']);
									return;
								}
						
						}else{	// no conforme con trabajo	NO CAMBIA ESTADOS
								echo $response;
								return;
						}	

				} else {	// fallo al cerrar la tarea en BPM				
					echo json_encode(['status'=>true, 'msj'=>'OK', 'code'=>$code]);
				}	

			}	
			// terminar tarea prestar conformidad
			public function prestarConformidad(){

				//log
					log_message('DEBUG', 'TRAZA | Tarea/prestarConformidad');	

				$idTarBonita = $this->input->post('idTarBonita');				
				$opcion = $this->input->post('opcion');	
				$id_SS = 	$this->input->post('id_SS');	
				$id_OT =  $this->input->post('id_OT');
				// log
					log_message('DEBUG', 'TRAZA | $idTarBonita: '.$idTarBonita);
					log_message('DEBUG', 'TRAZA | Conforme?: '.$opcion);	
					log_message('DEBUG', 'TRAZA | $idSServicos: '.$id_SS);
					log_message('DEBUG', 'TRAZA | $idOT: '.$id_OT);	
							
				// averigua origen de OT
				$origen = $this->Tareas->getOrigenOt($id_OT);
				$numtipo = 	$origen[0]['tipo'];
				$id_solicitud = $origen[0]['id_solicitud'];
				$estado = 'CN';
				switch ($numtipo) {
					case '2':
						$tipo = 'correctivo';
						break;
					case '3':
						$tipo = 'preventivo';
						break;					
					case '4':
						$tipo = 'backlog';					
						// cambia el estado del backlog	a 'CN'
						$response = $this->Tareas->cambiarEstado($id_solicitud, $estado, $tipo);								
							
						break;				
					default:
						$tipo = 'predictivo';
						break;
				}				
				// Cierro tarea en BPM
				$opcionSel = array(
					"prestaConformidad" => $opcion
				);
			
				$response = $this->bpm->cerrarTarea($idTarBonita,$opcionSel);
				// si cierra la tarea en BPM
				if ($response['status']){						
						// La respuesta es conforme con trabajo
						if($opcion){
							
								// Si hay SServicios cambio estado a 'Conforme'
								if ($id_SS != NULL) {
									$result = $this->Tareas->cambiarEstado($id_SS, $estado, 'correctivo');															
								}	
								// Otrabajo cambio estado a 'Conforme'
								if ($id_OT != NULL) {
									$result = $this->Tareas->cambiarEstado($id_OT, $estado, 'OT');																
								}		

								// si guarda en BD	
								if ($result) {
									echo json_encode(['status'=>true, 'msj'=>'OK']);
									return;
								}else{								
									echo json_encode(['status'=>false, 'msj'=> 'Error en Cambio Estado OT']);
									return;
								}
						
						}else{	// no conforme con trabajo	NO CAMBIA ESTADOS
								echo $response;
								return;
						}	

				} else {	// fallo al cerrar la tarea en BPM				
					echo json_encode(['status'=>true, 'msj'=>'OK', 'code'=>$code]);
				}					
			}
			// terminar tarea ejecutar OT
			public function ejecutarOT(){
				
				$idTarBonita = $this->input->post('idTarBonita');
				$id_OT = $this->input->post('id_OT');					
				//trae la cabecera
					
				$response = $this->bpm->cerrarTarea($idTarBonita);

				if ($response['status']) {
					//pone fecha terminada a la OT y pone estado 'T'
					$resp = $this->Tareas->finTareas($id_OT);								

					$origen = $this->Tareas->getOrigenOt($id_OT);
					$numtipo = 	$origen[0]['tipo'];
					$id_solicitud = $origen[0]['id_solicitud'];
					
					$estado = 'T';
					switch ($numtipo) {
						case '1':
							$tipo = 'OT';
							break;
						case '2':
							$tipo = 'correctivo';	
							// cambia el estado del SServicios a 'T'	
							$response = $this->Tareas->cambiarEstado($id_solicitud, $estado, $tipo);						
							break;
						case '3':
							$tipo = 'preventivo';
							break;					
						case '4':
							$tipo = 'backlog';							
								// cambia el estado del backlog	a 'T'
								$response = $this->Tareas->cambiarEstado($id_solicitud, $estado, $tipo);								
								// aca buscar sore_id y cambiar estado a sol de serv a 'T'
								$idSservicios = $this->Tareas->getSoreIdporBackId($id_solicitud);							
								if ($idSservicios != NULL) {
									$response = $this->Tareas->cambiarEstado($idSservicios, $estado, 'correctivo');
								}		
							break;				
						default:
							$tipo = 'predictivo';
							break;
					 }	
					
					if ($response) {
							$respuesta['status'] = true;
							$respuesta['msj'] = 'OK';
							$respuesta['code'] = 'Exito';
							echo json_encode($respuesta);
					} else {
							$respuesta['status'] = false;
							$respuesta['msj'] = 'ERROR';
							$respuesta['code'] = 'ASP_0200, Error ASP_0200: Comunicarse con el Proveedor de Servicio';
							echo json_encode($respuesta);
					}			
					
				}else{
					$respuesta['status'] = false;
					$respuesta['msj'] = 'ERROR';
					$respuesta['code'] = 'ASP_0100, Error ASP_0100: Comunicarse con el Proveedor de Servicio';
					echo json_encode($respuesta);
				}	
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
					$data['permission'] = $permission;

				//OBTENER DATOS DE TAREA SELECCIONADA DESDE BONITA
					$data['TareaBPM'] = $this->getDatosBPM($idTarBonita);	
					$data['idTarBonita'] = $idTarBonita;
					$caseId = $data['TareaBPM']["caseId"];
			
				// Trae id de OT y de Sol Serv por CaseId			
					$id_SS = $this->getIdSolServPorIdCase($caseId);	
					//dump($id_SS, 'id SolServicios en detatarea: ');
				// si la tarea se origino en una SServicio
					// if ($id_SS == 0) {
					// 	$id_OT = $this->getIdOTPorIdCase($caseId);					
					// } else {	// sino busca el id de OT en BPM
					// 	$id_OT = $this->Tareas->getIdOtPorid_SS($id_SS);
					
					// }
					// TODO: AHORA TODAS LAS OT TIENEN UN CASE ASOCIADO		
					$id_OT = $this->Tareas->getIdOTPorIdCaseEnBD($caseId);
				    
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
					
				
				/* Bloque subtareas estandar */	
					if($id_OT != 0){
						/* funcion nueva de asset */										
						// traer subtareas estandar en funcion de id tarea estandar	
						//$tareaSTD = $this->Tareas->getIdTareaSTD($id_OT);
						//if ($tareaSTD) {
							if(!empty($this->Tareas->getSubtareas($id_OT))){
								$data['subtareas'] = $this->Tareas->getSubtareas($id_OT);
							}						
						//} 					
					}	

				//LIBRERIA BPM
					$case_id = $data['TareaBPM']["caseId"];
					$case = array('caseId'=>$case_id);
							
				// LINEA DE TIEMPO 			
					$data['timeline'] = $this->bpm->ObtenerLineaTiempo(BPM_PROCESS_ID, $case_id);			
				//CARGAR VISTA COMENTARIOS 
					$data_aux = ['case_id'=>$case_id, 'comentarios'=>$this->bpm->ObtenerComentarios($case_id)['data']];
					$data['comentarios'] = $this->load->view('tareas/componentes/comentarios',$data_aux,true);
				// Carga de vistas segun orden del proceso	
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
							
							$this->load->model('traz-comp/Componentes');
							$this->load->model(CMP_ALM.'/new/Pedidos_Materiales');
							$data['descripcionOT'] = $this->Otrabajos->obtenerOT($id_OT)->descripcion;
							#COMPONENTE ARTICULOS
							$data['items'] = $this->Componentes->listaArticulos();
							$data['lang'] = lang_get('spanish', 'Ejecutar OT');
							#PEDIDO MATERIALES
							$info = new StdClass();
							$info->ortr_id = $id_OT;
							$info->modal = 'agregar_pedido';
							$data['info'] = $info;
							$this->load->model(CMP_ALM.'/Notapedidos');
							$data['list'] = $this->Notapedidos->notaPedidos_List($id_OT);
							$this->load->model('traz-comp/Componentes');
							$this->load->view('tareas/view_ejecutarOT', $data);
							$this->load->view('tareas/scripts/tarea_std');	
							$this->load->view('tareas/scripts/validacion_forms');					
							break;
					case 'Esperando cambio estado "a Ejecutar"':
						$this->load->view('tareas/view_cambio_estado', $data);
						$this->load->view('tareas/scripts/tarea_std');
						break;
					case 'Esperando cambio estado "a Ejecutar" 2':
							dump($data, 'datos de bpm: ');
							$this->load->view('tareas/view_cambio_estado', $data);
							$this->load->view('tareas/scripts/tarea_std');
							break;
					case 'Confecciona informe servicio':
							$this->load->view('tareas/view_informe_servicio', $data);
							$this->load->view('tareas/scripts/tarea_std');
							break;
					case 'Verifica Informe de Servicio':
							$this->load->view('tareas/view_verifica_informe', $data);
							$this->load->view('tareas/scripts/tarea_std');
							break;	
					case 'Presta conformidad':
						$this->load->view('tareas/view_presta_conformidad', $data);
						$this->load->view('tareas/scripts/tarea_std');
						break;							
							
					default:
							$this->load->view('tareas/view_', $data);					
							$this->load->view('tareas/scripts/tarea_std');	
							break;
				}
			}	
			//
			function getIdSolServPorIdCase($caseId){
			
				$rsp = $this->bpm->getCaseVariable($caseId,'gIdSolicitudServicio');

				if(!$rsp['status']){
					return 0;
				}
	
				return $rsp["data"];

			}	
		
			// Trae datos de backlog para editar
			function getEditarBacklog($id_SS){
				$result = $this->Tareas->geteditar($id_SS);	
				return $result;
			}				
			// Trae datos de BPM para notif estandar
			public function getDatosBPM($idTarBonita){
			
				return $this->bpm->getTarea($idTarBonita)['data'];
		
			}
			// Trae id de tarea de trazajobs segun id de tarea bonita - NO TOCAR
			public function getIdTareaTraJobs($idTarBonita){

				$rsp = $this->bpm->getActivityVariable($idTarBonita,'trazajobsTaskId');
				
				if(!$rsp['status']){
					return 0;
				}
				return $rsp['data'];
			}
			// cambia el estado de cada subtarea 
			public function cambiarEstadoSubtask(){
				$idlistarea = $this->input->post('idListarea');
				$estado = $this->input->post('estado');
				$response = $this->Tareas->cambiarEstadoSubtask($idlistarea,$estado);
			}
			// cambia a estado T en SServicio
			function cerrarSServicio($id_SS){
				$response = $this->Tareas->cerrarSServicios($id_SS);
				return $response;
			}
		/*	./ FUNCIONES BPM */
		
		/* COMENTARIOS */
			public function GuardarComentario(){
				$data = $this->input->post();
				$response = $this->bpm->GuardarComentario($data["processInstanceId"],$data["content"]);
				echo json_encode($response);
			}	

			public function ObtenerComentariosBPM($case_id){
			
				$data['comentarios'] = $this->bpm->ObtenerComentarios()['data'];
				$data['case_id'] = $case_id;
				$this->load->view('tareas/componentes/comentarios',$data);
			}
		/*	./	COMENTARIOS */

		/*	FORMULARIOS */
			// trae datos para dibujar formulario en modal
			public function Obtener_Formulario(){
				
				$infoId = $this->input->get('infoId');
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