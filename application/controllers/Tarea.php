<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Tarea extends CI_Controller {

	function __construct(){
		parent::__construct();		
		$this->load->model('Tareas');		
		$this->load->model('Backlogs');
		$this->load->model('Otrabajos');
		$this->load->model('Ordenservicios');
	}

	// llama ABM tareas estandar
	public function index2($permission)
    {
		$data = $this->session->userdata();
		//log_message('DEBUG','#Main/index2 | Tarea >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index2 | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();
			echo ("<script>location.href='login'</script>");
		}else{
			//$data['list']       = $this->Tareas->Listado_Tareas();
			//log_message('DEBUG','#TRAZA | #Tarea/index2()>> data '.json_encode($data));
			$data['permission'] = $permission;
			$this->load->view('tarea/list', $data);
		}
    }

	public function Obtener_Tarea(){
		$id = $_POST['id_tarea'];
		$result = $this->Tareas->Obtener_Tareas($id);
		log_message('DEBUG','#TRAZA | #Tarea/Obtener_Tarea()>> data '.json_encode($result));
		echo json_encode($result);
	}

	/*Fernando Leiva */
	public function Obtener_Todas(){
		log_message('DEBUG','#TRAZA | #Tarea/Obtener_Todas()>> data '.json_encode($this->Tareas->Listado_Tareas()));
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
		$data = array(
			'descripcion' 	=> $descripcion,
			'estado'      	=> "AC"
		);
		$sql = $this->Tareas->Guardar_Tareas($data);
		echo json_encode($sql);
	}

    public function Modificar_Tarea(){
		$id=$this->input->post('id_tarea');
		$descripcion=$this->input->post('descripcion');		
		$data = array(
			'id_tarea' 		=> $id,
			'descripcion' 	=> $descripcion
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
				$data = $this->session->userdata();
				//log_message('DEBUG','#TRAZA | TAREA | index() | UserId: '. $data['user_data'][0]['usrId'] ." ||| UserName: ". $data['user_data'][0]['usrName'] ." ||| id_empresa: ". $data['user_data'][0]['id_empresa']);
				//log_message('DEBUG','#TRAZA | TAREA | index() | UserId: '. json_encode($data));
				if(empty($data['user_data'][0]['usrName'])){
					log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
					$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
					$this->session->set_userdata($var);
					$this->session->unset_userdata(null);
					$this->session->sess_destroy();
					echo ("<script>location.href='login'</script>");
				}else{
					$detect = new Mobile_Detect();    				
					//Obtener Bandeja de Usuario desde Bonita
					$response = $this->bpm->getToDoList();
					if(!$response['status']){
						return;
					}					
					$empr_id = empresa();
					$array=[];
					$aux=[];					
					//Filtra datos por empresa
					foreach($response['data'] as $o){
					 	if($this->Tareas->bandejaEmpresa($o['caseId'] , $empr_id)){
								$aux['caseId'] = $o['caseId'];
								$aux['displayDescription'] = $o['displayDescription'];
								$aux['executedBy'] = $o['executedBy'];
								$aux['rootContainerId'] = $o['rootContainerId'];
								$aux['assigned_date'] = $o['assigned_date'];
								$aux['displayName'] = $o['displayName'];
								$aux['executedBySubstitute'] = $o['executedBySubstitute'];
								$aux['dueDate'] = $o['dueDate'];
								$aux['description'] = $o['description'];
								$aux['type'] = $o['type'];
								$aux['priority'] = $o['priority'];
								$aux['actorId'] = $o['actorId'];
								$aux['processId'] = $o['processId'];
								$aux['name'] = $o['name'];
								$aux['reached_state_date'] = $o['reached_state_date'];
								$aux['rootCaseId'] = $o['rootCaseId'];
								$aux['id'] = $o['id'];
								$aux['state'] = $o['state'];
								$aux['parentCaseId'] = $o['parentCaseId'];
								$aux['last_update_date'] = $o['last_update_date'];
								$aux['pema_id'] = $o['pema_id'];
								$aux['ot'] = $o['ot'];
								$aux['equipoDesc'] = $o['equipoDesc'];
								$aux['sectorDesc'] = $o['sectorDesc'];
								$aux['nomCli'] = $o['nomCli'];
								$aux['usr_asignado'] = $o['usr_asignado'];
								$aux['assigned_id'] = $o['assigned_id'];
							
							$array[] = $aux; 
						} 
					}					
					//guardo en session todas las tareas filtradas por case_id
					$_SESSION['listadoTareas'] = $array;
					$data['permission'] = $permission;	
					//tiempo de recarga harkode en constant
					$data['tiempoRecarga'] = TIEMPO_RECARGA;
					//log_message('DEBUG','#TRAZA | TAREA | index() | variable Sesion: '. json_encode($array));
					if ($detect->isMobile() || $detect->isTablet() || $detect->isAndroidOS()) {								
						$data['device'] = "android";
					}else{					
						$data['device'] = "pc";				
					}		
					//log_message('DEBUG','#TRAZA >> TAREA >> index() >> list: '. json_encode($data));
					$this->load->view('tareas/list',$data);	
				}
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
				$lati = $this->input->post('lat');
				$long = $this->input->post('lon');
				$estado = 'C';
				log_message('DEBUG','#Tarea/inicioTarea lat: '.json_encode($lati));
				log_message('DEBUG','#Tarea/inicioTarea long: '.json_encode($long));
				log_message('DEBUG','#Tarea/inicioTarea idOT: '.json_encode($id_OT));
				// graba fecha de inicio en OT
				if ($this->Tareas->inicioTareas($id_OT)) {
					$res = $this->Tareas->actualizarLatLng($lati,$long,$id_OT);
					log_message('DEBUG','#Tarea/inicioTarea: '.json_encode($res));
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
				$userdata = $this->session->userdata('user_data'); 

				log_message('DEBUG','#TRAZA | #Tarea/tomarTarea(usrNick)>> '.$userdata[0]['usrNick']);
				log_message('DEBUG','#TRAZA | #Tarea/tomarTarea(userBpm)>> '.$userdata[0]['userBpm']);
				log_message('DEBUG','#TRAZA | #Tarea/tomarTarea(idTarBonita)>> '.$idTarBonita);
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
				log_message('DEBUG', 'TRAZA | TRAZA | ASSET | TAREAS | verificarInforme()');					
				$id_eq = $this->input->post('id_eq');
				$id_OT = $this->input->post('id_OT');
				$id_SS = $this->input->post('id_SS');
				$idTarBonita = $this->input->post('idTarBonita');
				$opcion = $this->input->post('opcion');
				$justificacion = $this->input->post('justificacion');
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
					log_message('DEBUG', 'TRAZA | Informe correcto?: '.$opcion);

				// si cierra la tarea en BPM
				if ($result['status']){

						// La respuesta es Informe de Servicios 'CORRECTO'
						if($opcion == "true"){
							
								// cambia el estado a lo que no sea SServicios(esta cambia con la conformidad del solicitante)
								if($tipo != 'correctivo'){
									//cambia el estado de la Tarea (Back, Prevent o Predict) a CERRADO
									$result = $this->Tareas->cambiarEstado($id_solicitud, $estado, $tipo);
								}else{								
									//Cambio Sol Servicio  a TERMINADO					
									$result = $this->Tareas->cambiarEstado($id_SS, $estado, $tipo);
								}		
																		
								// Cambia  estado de la OT a CERRADO					
								$result = $this->Tareas->cambiarEstado($id_OT, $estado, 'OT', true);

								// Cambio Inform Servicio  a TERMINADO					
								$result = $this->Tareas->cambiarEstado($id_OT, 'CE', 'informe servicios');

								// si guarda en BD	
								if ($result) {
									
									$data["id_equipo"] = $id_eq;
									$infoOt = $this->Ordenservicios->getorden($id_OT);
									// si la tareas es opcional
									if (($infoOt[0] ["id_tarea"] < 0) || ($infoOt[0] ["id_tarea"] == NULL)) {
									  $causa = $infoOt[0]["descripcion"];
									} else {
									  $causa = $infoOt[0]["tareadescrip"];
									}             
									$data["observacion"] = 'Descripcion: '.$causa.' | OT: '.$id_OT;
									$data["estado"] = $this->Ordenservicios->getEquipos($data)["estado"];
									$data["lectura"] = $this->Ordenservicios->getLecturasOrden($id_OT)[0]["horometrofin"];
									$data["fecha"] = $this->Ordenservicios->getLecturasOrden($id_OT)[0]["fechahorafin"];
									$data["operario_nom"] = $infoOt[0]["responsable"];
									$data["turno"] = "-";
									$data["usrId"] = $infoOt[0]["usrId"];

									log_message('DEBUG','TRAZA | ASSET | TAREAS |verificarInforme() |  $data: '.json_encode($data));

									$result = $this->Tareas->setUltimaLecturaIS($data);

									if($result){
										echo json_encode(['status'=>true, 'msj'=>'OK']);
										return;
									}else{
										echo json_encode(['status'=>false, 'msj'=> 'Error en Cambio Estado OT']);
										return;
									}
								}else{								
									echo json_encode(['status'=>false, 'msj'=> 'Error en Cambio Estado OT']);
									return;
								}
						
						}else{	// no conforme con trabajo	NO CAMBIA ESTADOS
								$result = $this->Tareas->setJustificacionOT($id_OT,$justificacion);
								if(!$result){
									echo json_encode(['status'=>false, 'msj'=>'error en setear la justificacion']);
									return;
								}	 

									/* ASIGNACION INFORME DE SERVICIO AL MISMO USUARIO QUE SE REALIZO CONFECCIONA INFORME DE SERVICIO */

									$infoOt = $this->Ordenservicios->getorden($id_OT);
									$responsable = $data["usrId"] = $infoOt[0]["responsable"];
									$usrId = $data["usrId"] = $infoOt[0]["id_usuario_a"];
									$case_id = $this->Otrabajos->getCaseIdOT($id_OT);

									// buscar task pa asignar la tarea siguiente (Confecciona informe servicio) a un responsable		
									$nextTask = $this->bpm->ObtenerTaskidXNombre(BPM_PROCESS_ID,$case_id,'Confecciona informe servicio');

									if($nextTask == 0){
										echo json_encode(msj(false,'No se pudo Obtener Tarea Siguiente | Confecciona informe servicio'));return;
									}
								
									log_message('DEBUG', 'TRAZA | ASSET | TAREAS | $case_id: '.$case_id);
									log_message('DEBUG', 'TRAZA | ASSET | TAREAS | INFORME SERVICIO-> $task_id: '.$nextTask);

									if($responsable)
									{
										// sincroniza usuario local con el de BPM, para asignar el usr de BPM
										$rsp = $this->bpm->getInfoSisUserenBPM($usrId);
										if(!$rsp['status']){echo json_encode($rsp);return;}
									
										$usuarioBPM = $rsp['data']['id'];
										// log	
										log_message('DEBUG', 'TRAZA | ASSET | Usr asignado (responsable Re Confecciona informe servicio) en BPM: '.$usuarioBPM);
										log_message('DEBUG', 'TRAZA | ASSET |  Usr asignado (responsable Re Confecciona informe servicio) en LOCAL: '.$responsable);
									
										//Asignar Usuario a Tarea para Finanlizar
										$responce = $this->bpm->setUsuario($nextTask,$usuarioBPM);
									
										if(!$responce['status']){
											echo json_encode($responce);
											return;
										}
									}
									echo json_encode(['status'=>true, 'msj'=>'se rechazo el informe de servicio']);
									return;
						}	

				} else {	// fallo al cerrar la tarea en BPM				
					echo json_encode(['status'=>true, 'msj'=>'OK', 'code'=>$code]);
				}	

			}
			// terminar tarea prestar conformidad
			public function prestarConformidad(){

				//log
				log_message('DEBUG', 'TRAZA | ASSET | Tarea | prestarConformidad()');	

				$idTarBonita = $this->input->post('idTarBonita');				
				$opcion = $this->input->post('opcion');	
				$id_SS = 	$this->input->post('id_SS');	
				$id_OT =  $this->input->post('id_OT');
				// log
					/*log_message('DEBUG', 'TRAZA | $idTarBonita: '.$idTarBonita);
					log_message('DEBUG', 'TRAZA | Conforme?: '.$opcion);	
					log_message('DEBUG', 'TRAZA | $idSServicos: '.$id_SS);
					log_message('DEBUG', 'TRAZA | $idOT: '.$id_OT);	*/
							
				// averigua origen de OT
				$origen = $this->Tareas->getOrigenOt($id_OT);
				$numtipo = 	$origen[0]['tipo'];
				$id_solicitud = $origen[0]['id_solicitud'];
				$estado = 'CN';
				if($opcion == 'false'){
					$estado = 'S';
				}
				//log_message('DEBUG', 'TRAZA | Tarea/prestarConformidad >> numtipo: '.$numtipo." Id Solicitud: ".$id_solicitud." Estado: ".$estado);
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
				//log_message('DEBUG', 'TRAZA | Tarea/prestarConformidad  $response >>'.$response['status']);
				// si cierra la tarea en BPM
				if ($response['status']){
						// La respuesta es conforme con trabajo
						if($opcion){
							
								// Si hay SServicios cambio estado a 'Conforme'
								if ($id_SS != NULL) {
									$result = $this->Tareas->cambiarEstado($id_SS, $estado, 'correctivo', true);															
								}	
								// Otrabajo cambio estado a 'Conforme'
								if ($id_OT != NULL) {
									$result = $this->Tareas->cambiarEstado($id_OT, $estado, 'OT', true);																
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

							/* ASIGNACION INFORME DE SERVICIO AL MISMO USUARIO QUE SE ASIGNO Ejecutar OT */
							$case_id = $this->Otrabajos->getCaseIdOT($id_OT);
							/* obtengo usuario asignado */
							$userdata = $this->session->userdata('user_data');
							$userSession = $userdata[0]['userBpm']; 
							$responsable = $userSession;

							// buscar task pa asignar la tarea siguiente (Confecciona informe servicio) a un responsable		
							$nextTask = $this->bpm->ObtenerTaskidXNombre(BPM_PROCESS_ID,$case_id,'Confecciona informe servicio');

							if($nextTask == 0){
								echo json_encode(msj(false,'No se pudo Obtener Tarea Siguiente | Confecciona informe servicio'));return;
							}

							log_message('DEBUG', 'TRAZA |TAREAS | $case_id: '.$case_id);
							log_message('DEBUG', 'TRAZA | TAREAS | INFORME SERVICIO-> $task_id: '.$nextTask);
							
							if($responsable)
							{
								// sincroniza usuario local con el de BPM, para asignar el usr de BPM
								// $rsp = $this->bpm->getInfoSisUserenBPM($responsable);
								// if(!$rsp['status']){echo json_encode($rsp);return;}

								$usuarioBPM = $responsable;
								// log	
								log_message('DEBUG', 'TRAZA | Usr asignado (responsable Confecciona informe servicio) en BPM: '.$usuarioBPM);
								log_message('DEBUG', 'TRAZA | Usr asignado (responsable Confecciona informe servicio) en LOCAL: '.$responsable);

								//Asignar Usuario a Tarea para Finanlizar
								$responce = $this->bpm->setUsuario($nextTask,$usuarioBPM);

								if(!$responce['status']){
									echo json_encode($responce);
									return;
								}
								
								$rsp_update_user_a = $this->Otrabajos->updateResponsables($id_OT,$userdata[0]['usrId']);
							}
							
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
					log_message('DEBUG','#TRAZA | #TAREA >> detatarea id_SS: '.$id_SS);
					log_message('DEBUG','#TRAZA | #TAREA >> detatarea tarea BPM: '.json_encode($data['TareaBPM']));
					//dump($id_SS, 'id SolServicios en detatarea: ');
				// si la tarea se origino en una SServicio
					// if ($id_SS == 0) {
					// 	$id_OT = $this->getIdOTPorIdCase($caseId);					
					// } else {	// sino busca el id de OT en BPM
					// 	$id_OT = $this->Tareas->getIdOtPorid_SS($id_SS);
					
					// }
					// TODO: AHORA TODAS LAS OT TIENEN UN CASE ASOCIADO		
					$id_OT = $this->Tareas->getIdOTPorIdCaseEnBD($caseId);
					
					//para ver si se va a editar el informe de servicio y en ese caso, mostrar la justificacion de rechazo
					$idOServ = $this->Ordenservicios->getOServicioPorIdOT($id_OT);
					if($idOServ != NULL){
						$data['idOServ'] = true;
						$data['justificacion'] = $this->Tareas->getJustifiacionOT($caseId);
					}else{
						$data['idOServ'] = false;
					}
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
							$this->load->model(ALM.'/new/Pedidos_Materiales');
							
							$data['descripcionOT'] = $this->Otrabajos->obtenerOT($id_OT)->descripcion;
							#COMPONENTE ARTICULOS
							$data['items'] = $this->Componentes->listaArticulos();
							$data['lang'] = lang_get('spanish', 'Ejecutar OT');
							#PEDIDO MATERIALES
							$info = new StdClass();
							$info->ortr_id = $id_OT;
							$info->modal = 'agregar_pedido';
							$data['info'] = $info;
							$this->load->model(ALM.'/Notapedidos');
							$data['list'] = $this->Notapedidos->notaPedidos_List($id_OT);
							$this->load->model('traz-comp/Componentes');
							$this->load->view('tareas/view_ejecutarOT', $data);
							//$this->load->view('tareas/scripts/tarea_std');	
						
									
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

			public function procedimiento(){
		
				$id_OT = $this->input->post('ot');				
				$response['adjunto'] = $this->Tareas->procedimientos($id_OT);
				//log_message('DEBUG','#Tarea/procedimiento: '.json_encode($response));
				echo json_encode($response['adjunto']);
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
				//log_message('INFO','#TRAZA|Tarea|GuardarComentario() >> ');
				//log_message('DEBUG','#Tarea/GuardarComentario: '.json_encode($data));
				$response = $this->bpm->GuardarComentario($data["processInstanceId"],$data["content"]);
				//log_message('DEBUG','#Tarea/GuardarComentario: '.json_encode($response));
				echo json_encode($response);
			}	

			public function ObtenerComentariosBPM($case_id){
			
				//log_message('INFO','#TRAZA|Tarea|ObtenerComentariosBPM() >> ');
    			//_message('DEBUG','#Tarea/ObtenerComentariosBPM: '.json_encode($case_id));
				$auxx = $this->bpm->ObtenerComentarios($case_id);
				//log_message('DEBUG','#Tarea/ObtenerComentariosBPM: '.json_encode($auxx));
				$aux =json_decode($auxx["data"]);
				$data['comentarios'] = $aux;
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
	public function CerrarTarea()
	{
		$id = $this->input->post('IdtarBonita');
		$case_id= $this->input->post('caseid');
		$tipo= $this->input->post('tipo');

		$contract = array(
			"entregaCompleta" => "true"
		);
		$result = $this->bpm->cerrarTarea($id, $contract);
		if ($result['status']){

			$resp = $this->Tareas->CambiarEstadoPedidoMat($case_id, $tipo);
			if($resp){
				echo json_encode(['status'=>true, 'msj'=> 'Tarea cerrada y cambio de Estado con Exito...!']);
			}else{
				echo json_encode(['status'=>false, 'msj'=> 'Tarea cerrada, cambio de Estado ha fallado...!']);
			}
			
		}else{
			echo json_encode(['status'=>false, 'msj'=> 'Error al cerrar Tarea']);
		}
	}

 	/**
	* Genera el listado de las tareas paginadas
	* @param integer;integer;string start donde comienza el listado; length cantidad de registros; search cadena a buscar
	* @return array listado paginado y la cantidad
	*/
	public function paginado(){
		$start = $this->input->post('start');
		$length = $this->input->post('length');
		$search = $this->input->post('search')['value'];
		$ordering = $this->input->post('order');

		$r = $this->Tareas->tareaspaginadas($start,$length,$search,$ordering);
	
		$datos =$r['datos'];
		$totalDatos = $r['numDataTotal'];
		$datosPagina = count($datos);

		$json_data = array(
			"draw" 				=> intval($this->input->post('draw')),
			"recordsTotal"  	=> intval($datosPagina),
			"recordsFiltered"	=> intval($totalDatos),
			"data" 				=> $datos
		);
		$result = json_encode($json_data);
		echo $result;
	}



	/**
	* Genera un nuevo listado de las tareas 
	* @param 
	* @return array con nuevo listado de tareas
	*/

	//actualiza $_SESSION['listadoTareas'] con las nuevas tareas
	function actualizaTareas(){
		$data = $this->session->userdata();

		$response = $this->bpm->getToDoList();

						if(!$response['status']){
							return;
						}
						
						$empr_id = empresa();
						$array=[];
						$aux=[];
						
						//Filtra datos por empresa
						foreach($response['data'] as $o){
							if($this->Tareas->bandejaEmpresa($o['caseId'] , $empr_id)){
								$aux['caseId'] = $o['caseId'];
								$aux['displayDescription'] = $o['displayDescription'];
								$aux['executedBy'] = $o['executedBy'];
								$aux['rootContainerId'] = $o['rootContainerId'];
								$aux['assigned_date'] = $o['assigned_date'];
								$aux['displayName'] = $o['displayName'];
								$aux['executedBySubstitute'] = $o['executedBySubstitute'];
								$aux['dueDate'] = $o['dueDate'];
								$aux['description'] = $o['description'];
								$aux['type'] = $o['type'];
								$aux['priority'] = $o['priority'];
								$aux['actorId'] = $o['actorId'];
								$aux['processId'] = $o['processId'];
								$aux['name'] = $o['name'];
								$aux['reached_state_date'] = $o['reached_state_date'];
								$aux['rootCaseId'] = $o['rootCaseId'];
								$aux['id'] = $o['id'];
								$aux['state'] = $o['state'];
								$aux['parentCaseId'] = $o['parentCaseId'];
								$aux['last_update_date'] = $o['last_update_date'];
								$aux['pema_id'] = $o['pema_id'];
								$aux['ot'] = $o['ot'];
								$aux['equipoDesc'] = $o['equipoDesc'];
								$aux['sectorDesc'] = $o['sectorDesc'];
								$aux['nomCli'] = $o['nomCli'];
								$aux['usr_asignado'] = $o['usr_asignado'];
								$aux['assigned_id'] = $o['assigned_id'];

								$array[] = $aux; 
							}
						}
						
						//guardo en session todas las tareas filtradas por case_id
						$_SESSION['listadoTareas'] = $array;

	}


	
} 

?>