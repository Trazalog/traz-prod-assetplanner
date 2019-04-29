<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Calendario extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('Calendarios');
		$this->load->model('Bonitas');
		$this->load->model('Overviews');
		$this->load->model('Tareas');
	}	

	public function indexot($permission) // Ok
	{
		$data['permission'] = $permission."Correctivo-Preventivos-Backlog-Predictivo-";
		$this->load->view('calendar/calendar1', $data);
	}

	public function getcalendarot() // Ok
	{
		$data = $this->Calendarios->getot($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);
		}
	}

	public function getTablas() // Ok
	{	
		$mes          = $this->input->post('mes');
		$year         = $this->input->post('year');
		$permission   = $this->input->post('permission');
		$data['mes']  = $mes;
		$data['year'] = $year;
		$preventivosHoras  = $this->Calendarios->getPreventivosHoras($mes, $year);
		$data['list1'] = $this->Calendarios->getpredlist($mes, $year); 	// listo
		$data['list2'] = $this->Calendarios->getbacklog($mes, $year);		// listo
		$data['list3'] = $this->Calendarios->getPreventivos($mes, $year);  // listo 
		$data['list4'] = $this->Calendarios->getsservicio($mes, $year);	// listo
		$data['permission'] = $permission;
	
		//para cada preventivo
		if($preventivosHoras) {
			$j = 0;
			for ($i=0; $i<sizeof($preventivosHoras) ; $i++) { 
				$estaAlertado = false;
				//sacar tipo alerta
				//proximo servicio = lectura base + frecuencia
				$proximoServicio = $preventivosHoras[$i]['lectura_base'] + $preventivosHoras[$i]['cantidad'];
				$proximaAlerta = $preventivosHoras[$i]['lectura_base'] + $preventivosHoras[$i]['critico1'];
				$lecturaAutonomo = $preventivosHoras[$i]['ultima_lectura'];
				//si alerta amarilla pone en array y agrega dato amarillo
				if($lecturaAutonomo >= $proximaAlerta) {
					$tipoAlerta = 'A';
					$estaAlertado = true;
				}
				//si alerta es roja pone en array y agrega rojo
				if($lecturaAutonomo >= $proximoServicio) {
					$tipoAlerta = 'R';
					$estaAlertado = true;
				}				
				//si esta alertado guardo
				if($estaAlertado) {
					$preventivosHorasVisible[$j] = $preventivosHoras[$i];
					//agrego tipo alerta, proximo servicio y ultima lectura
					$preventivosHorasVisible[$j]['tipoAlerta'] = $tipoAlerta;
					$preventivosHorasVisible[$j]['proximoServicio'] = $proximoServicio;
					$preventivosHorasVisible[$j]['ultimaLectura'] = $preventivosHoras[$i]['ultima_lectura'];
					$j++;
				} else {
					$preventivosHorasVisible = false;
				}
			}
		} else {
			$preventivosHorasVisible = false;
		}

		$data['list'] = $preventivosHorasVisible;

		$response['html'] = $this->load->view('calendar/tablas', $data);
		echo json_encode($response);
	}


	//
	public function getPrevPorId() //
	{
		$id   = $this->input->post('id');
		$data = $this->Calendarios->getPrevPorIds($id);
		echo json_encode($data);
	}


	// Guarda la OT simple o redirije para guardar varias
	public function guardar_agregar()
	{
		$data     = $this->input->post();
		//dump_exit($data);
		$userdata = $this->session->userdata('user_data');
		$usrId    = $userdata[0]['usrId'];
		$empId    = $userdata[0]['id_empresa'];

	    if($_POST){
				
				if( isset($_POST['event_tipo']) ){
					$event_tipo       = $_POST['event_tipo'];//evento unico '1' evnto repetitivo '2'
				}
				$id_solicitud     = $_POST['id_sol'];// id predic - correct - back 
				$id_tarea         = $_POST['id_tarea'];
				$hora_progr       = $_POST['hora_progr'];
				$fecha_progr      = $_POST['fecha_progr'];
				$fecha_progr      = explode('-', $fecha_progr);
				$fec_programacion = $fecha_progr[2].'-'.$fecha_progr[1].'-'.$fecha_progr[0].' '.$hora_progr.':00';
				$fecha_inicio     = $_POST['fecha_inicio'];
				$descripcion      = $_POST['descripcion'];//descripcion del predictivo/correc/backlog/etc
				$tipo             = $_POST['tipo'];//numero de tipo segun tbl orden_trabajo
				$equipo           = $_POST['ide'];  
				if( isset($_POST['cant_meses']) ){
					$cant_meses = $_POST['cant_meses'];//cantidad de meses a programar las OT
				}	
				if( isset($_POST['lectura_programada']) ) {
					$lectura_programada = $_POST['lectura_programada'];
				} else {
					$lectura_programada = '0000-00-00 00:00:00';
				}
				if( isset($_POST['lectura_ejecutada']) ) {
					$lectura_ejecutada  = $_POST['lectura_ejecutada'];
				} else {
					$lectura_ejecutada = '0000-00-00 00:00:00';
				}

				// si no es correctivo busca duracion sino pone 60' por defecto	    	
				if ($tipo != '2'){
					$duracion = $this->getDurTarea($tipo,$id_solicitud); 					
				}else{
					$duracion =  60;	
				}

				$datos2 = array(
						'id_tarea'      => $id_tarea,// id de tarea a realizar(tabla tareas)
						'nro'           => 1,//por defecto( no se usa)
						'fecha'         => date('Y-m-d'),				
						'fecha_program' => $fec_programacion,
						'fecha_inicio'  => $fecha_inicio,
						'descripcion'   => $descripcion,
						'cliId'         => 1,//por defecto( no se usa)
						'estado'        =>'C',
						'id_usuario'    => $usrId,
						'id_usuario_a'  => 1,
						'id_usuario_e'  => 1,
						'id_sucursal'   => 1,
						'id_solicitud'  => $id_solicitud,// id prev-correct-back-predict
						'tipo'          => $tipo,// tipo solicitud (prev-correct-back-predict )
						'id_equipo'     => $equipo,
						'duracion'      => $duracion,
						'id_tareapadre' => $id_solicitud,//solic que genera la 1º OT y las repetitivas
						'id_empresa'    => $empId,
						'lectura_programada' => $lectura_programada,
						'lectura_ejecutada'  => $lectura_ejecutada,
					);			
			
				// si el evento es unico lo guarda
				if ($event_tipo == '1'){
					
					/// Interaccion con BPM ///
					$estado = 'OT';
					// $tipo == '2' -> S.Servicios
					if($tipo == '2'){
						// si es correctivo u S.Servicio
						$tipo = 'correctivo';				
						$infoTarea = $this->getInfoTareaporIdSolicitud($id_solicitud, $tipo);						
					
						$respCerrar = $this->cerrarTarea($infoTarea['taskId']);			
						if($respCerrar == 204 ){
							$resActualizar = $this->actualizarIdOTenBPM($infoTarea['caseId'], $idOTnueva);
						}
						//if($resActualizar == 200){					
						$this->Calendarios->cambiarEstado($id_solicitud, $estado, $tipo);
						$response = true;
						//}
        	}
        
					// $tipo == '4' -> Backlog			
					if($tipo == '4'){	
						// actualizo estado del backlog
						$tipo = 'backlog';
						//Actualizar Tablas >> Backlog ||Solicitud
						$this->Calendarios->cambiarEstado($id_backlog, $estado, $tipo);	
						//Obtener TaskID y CaseID
						$infoTarea = $this->getInfoTareaporIdSolicitud($id_solicitud, $tipo);				
						$respCerrar = $this->cerrarTarea($infoTarea['taskId']);							
						$resActualizar = $this->actualizarIdOTenBPM($infoTarea['caseId'], $idOTnueva);
						$response = true;					
					}

					$idOT = $this->Calendarios->guardar_agregar($datos2);
					$this->setHerramInsPorTarea($idOT,$tipo,$id_solicitud);
					if($idOT){
							$this->Calendarios->setEstadoSServicio($id_solicitud);
					}

	    	}else{	// evento repetitivo 
					
					// Sumo a la fecha de program la cant de meses p/ sacar fecha limite
					$fecha_limite = strtotime ( '+'.$cant_meses.' month' , strtotime ( $fec_programacion ) );
					$fecha_limite = date ( 'Y-m-d H:i:s' , $fecha_limite ); /// "2018-06-16 00:00:00"					
					//busco la frecuencia de la tarea
					$diasFrecuencia = $this->getPeriodTarea($tipo,$id_solicitud);	
					// guarda las OT que corrrespondan de acuerdo a la cantidad que entren en $cantidad_meses
					$this->setOTenSerie($fecha_limite, $fec_programacion, $diasFrecuencia, $datos2, $tipo,$id_solicitud);

					// si es preventivo ACTUALIZA NUEVAMENTE LA FECHA BASE_ OK!
					if($tipo == '3'){	    		
						//pongo nueva fecha base en preventivos
						$this->Calendarios->actualizarFechaBasePreventivos($fecha_limite, $id_solicitud);
					}
				}	     	
					
				// guarda los Insumos y herramientas de Backlog, predict y prenvent segun tipo
				$this->setHerramInsPorTarea($idOT,$tipo,$id_solicitud);
		}
	  return true;
	    
  }

	function getDurTarea($tipo,$id_solicitud)
	{
		$duracion = 0;
		// devuelve la duracion de la taresa segun prde prev o backlog
		switch ($tipo) {
			case '1':					// O Trabajo
				$this->db->select('orden_trabajo.duracion');
		        $this->db->from('orden_trabajo');        
		        $this->db->where('orden_trabajo.id_orden', $id_solicitud);
		        $query = $this->db->get(); 
        		$duracion = $query->row('duracion');
				break;
			case '2':					// Sol de Servicio
				break;
			case '3':					// Preventivo
				$this->db->select('preventivo.prev_duracion');
		        $this->db->from('preventivo');        
		        $this->db->where('preventivo.prevId', $id_solicitud);
		        $query = $this->db->get(); 
        		$duracion = $query->row('prev_duracion');
				break;
			case '4':					// Backlog
				$this->db->select('tbl_back.back_duracion');
		        $this->db->from('tbl_back');        
		        $this->db->where('tbl_back.backId', $id_solicitud);
		        $query = $this->db->get(); 
        		$duracion = $query->row('back_duracion');
				break;
			case '5':					// Predictivo
				$this->db->select('predictivo.pred_duracion');
		        $this->db->from('predictivo');        
		        $this->db->where('predictivo.predId', $id_solicitud);
		        $query = $this->db->get(); 
        		$duracion = $query->row('pred_duracion');
				break;					
		}
		return $duracion;
	}	

	// Devuelve duracion de la tarea original (backlog, predictivo, preventivo)
	function getPeriodTarea($tipo,$id_solicitud)
	{
		$duracion = 0;
		// devuelve la duracion de la tarea segun prde prev o backlog	
		switch ($tipo) {							
			case '3':					// Preventivo
				$this->db->select('preventivo.cantidad');
		        $this->db->from('preventivo');        
		        $this->db->where('preventivo.prevId', $id_solicitud);
		        $query = $this->db->get(); 
        		$duracion = $query->row('cantidad');
				break;
			case '5':					// Predictivo
				$this->db->select('predictivo.cantidad');
		        $this->db->from('predictivo');        
		        $this->db->where('predictivo.predId', $id_solicitud);
		        $query = $this->db->get(); 
        		$duracion = $query->row('cantidad');
				break;				
		}
		return $duracion;
	}
	// guarda las OT que correspondan de acuerdo a la fecuencia y $cantidad_meses
	function setOTenSerie($fecha_limite, $fec_programacion, $diasFrecuencia, $datos2, $tipo, $id_solicitud){	
		$data[] = $datos2;
		while ($fecha_limite >= $fec_programacion  ) {
		// a la fecha de programacion le sumo la frecuencia en dias	   	
			$nuev_fecha = strtotime ( '+'.$diasFrecuencia.'day' , strtotime ( $fec_programacion ) ) ;
			$nuev_fecha = date ( 'Y-m-d H:i:s' , $nuev_fecha );
			// guardo la fecha nueva en el array para nuevva OT
			$datos2['fecha_program'] = $nuev_fecha;
			// guardo el componete en el array batch
			$data[] = $datos2;
			// actualizo la fecha de programacion
			$fec_programacion = $nuev_fecha;			 
			$idOT = $this->Calendarios->guardar_agregar($data);
			$this->setHerramInsPorTarea($idOT, $tipo, $id_solicitud);
		} 
		return;	
	}
	
	// Guarda herramientas e insumos que vienen de Backlog, Prevent y Predictivo
	function setHerramInsPorTarea($idOT, $tipo, $id_solicitud){
		
		switch ($tipo) {
			case '5':		// Predictivo
				$herra = $this->Calendarios->getPredictivoHerramientas($id_solicitud);
				$insumos = $this->Calendarios->getPredictivoInsumos($id_solicitud);
				$adjunto = $this->Calendarios->getAdjunto($id_solicitud,$tipo);	
				// Guarda el bacht de datos de herramientas
				if (!empty($herra)) {		
					$result['respHerram'] = $this->Calendarios->insertOTHerram($idOT, $herra);
				}
				// Guarda el bacht de datos de insumos
				if ( !empty($insumos) ){ 					
					$result['respInsumo'] = $this->Calendarios->insertOTInsum($idOT,$insumos);
				}
				// guarda el adjunto en la taba Orden trabajos (url)
				if ( !empty($adjunto) ) {
					$url = 'assets/filespredictivos/';
					$file = $url.$adjunto;
					$result['respAdjunto'] = $this->Calendarios->insertAdjunto($idOT,$file);
				}
				break;
			case '4':		//Backlog			
				$herra = $this->Calendarios->getBacklogHerramientas($id_solicitud);
				$insumos = $this->Calendarios->getBacklogInsumos($id_solicitud);
				$adjunto = $this->Calendarios->getAdjunto($id_solicitud,$tipo);				
				
				if (!empty($herra)) {		
					$result['respHerram'] = $this->Calendarios->insertOTHerram($idOT, $herra);
				}
				if ( !empty($insumos) ){ 					
					$result['respInsumo'] = $this->Calendarios->insertOTInsum($idOT,$insumos);
				}
				if ( !empty($adjunto) ) {
					$url = 'assets/filesbacklog/';
					$file = $url.$adjunto;
					$result['respAdjunto'] = $this->Calendarios->insertAdjunto($idOT,$file);
				}
				break;
			default:		// Preventivos (tipo 3)				
				$herra = $this->Calendarios->getPreventivoHerramientas($id_solicitud);
				$insumos = $this->Calendarios->getPreventivoInsumos($id_solicitud);
				$adjunto = $this->Calendarios->getAdjunto($id_solicitud,$tipo);	
				if (!empty($herra)) {		
					$result['respHerram'] = $this->Calendarios->insertOTHerram($idOT, $herra);
				}
				if ( !empty($insumos) ){ 					
					$result['respInsumo'] = $this->Calendarios->insertOTInsum($idOT,$insumos);
				}
				if ( !empty($adjunto) ) {
					$url = 'assets/filespreventivos/';
					$file = $url.$adjunto;
					$result['respAdjunto'] = $this->Calendarios->insertAdjunto($idOT,$file);
				}	
				break;
		}
	}








  public function getperiodo()
	{
		$periodo = $this->Calendarios->getperiodo($this->input->post());
		if($periodo)
		{	
			$arre = array();
	        foreach ($periodo as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}





	public function indexpred($permission){

		$this->load->view('calendar/calendar2');
	}

	public function setot(){
		$dato = $this->input->post();

		$data = $this->Calendarios->setVisit($this->input->post());

		 if($data  == false)
		 {
			echo json_encode(false);

		 }
		 else
		 {
		 	echo json_encode($data);
		 }
	}

	public function getPreventivo(){
		$data = $this->Calendarios->getPreventivos($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);
		}
	}



	public function getbacklog(){
		$data = $this->Calendarios->getbacklog($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);
		}
	}

	public function getcalendarpred(){
		$data = $this->Calendarios->getpred($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);
		}
	}


	///////////// Hugo

	// vista calendario






	public function getCorrectPorId(){

		$id = $_POST['id'];
		$data = $this->Calendarios->getCorrectPorIds($id);

		echo json_encode($data);
	}

	public function getBackPorId(){

		$id = $_POST['id'];
		$data = $this->Calendarios->getBackPorIds($id);
		//dump($data, 'backlog info: ');
		echo json_encode($data);
	}

	public function getPredictPorId(){
		
		$id = $_POST['id'];	
		$data = $this->Calendarios->getPredictPorIds($id);

		echo json_encode($data);
	}





   	// Cambio de dia nuevo de programacion
   	public function updateDiaProg(){

   		$id = $this->input->post('id');
   		$diaNuevo = $this->input->post('prog');
   		$response = $this->Calendarios->updateDiaProgramacion($id, $diaNuevo);

		echo json_encode($response);
   	}

   	// Devuelve duracion de tarea de acuerdo a un id de OT
   	function getDuracionOTrabajo($id){

   		$this->db->select('orden_trabajo.duracion');
   		$this->db->from('orden_trabajo');
   		$this->db->where('orden_trabajo.id_orden', $id);
   		$query = $this->db->get(); 
        $duracion = $query->row('duracion');
        return $duracion;
   	}

   	public function updateDuracion(){

   		$id = $this->input->post('id');
   		$duracion = $this->input->post('duracion');		// duracion adicional
   		
   		$nueva = $this->getDuracionOTrabajo($id, $duracion);
   		$nueva = $nueva + $duracion;		

   		$response = $this->Calendarios->updateDuraciones($id, $nueva);
		echo json_encode($response);
   	}



	/* INTEGRACION CON BPM */
		function getInfoTareaporIdSolicitud($id_solicitud, $tipo){
			//TODO: TRAER ID DE BACKLOG GENERADO EN BPM(TRAER POR REST O GUARDAR EN TABLA BACKLOG)

			if ($tipo == 'correctivo') {
				//$id_solicitud	-> id sol de servicios
				$caseId = $this->Calendarios->getCaseIdporIdSolServicios($id_solicitud);
			}
			if ($tipo == 'backlog') {
				//$id_solicitud	-> id de backlog
				$caseId = $this->Calendarios->getCaseIdporIdBacklog($id_solicitud);
			}
		
			// traer de bpm el id de tarea (id)			
			$parametros = $this->Bonitas->LoggerAdmin();
			$parametros["http"]["method"] = "GET";
			$param = stream_context_create($parametros);
			//dump($param, 'param: ');
			$actividades = $this->Overviews->ObtenerActividades($caseId,$param);			
			$infoTarea['taskId'] = json_decode($this->getIdTask($actividades,$tipo),true);
			$infoTarea['caseId'] = $caseId;			
			return $infoTarea;		
		}
		// devuelve task_id coincidente con la actividad 'Analisis de Solicitud de Servicio'
		function getIdTask($actividades,$tipo){

			if($tipo == 'correctivo'){
				$actividad = 'Planificar Solicitud';
			}
			if($tipo == 'backlog'){
				$actividad = 'Planificar Backlog';
			}	


			for ($i=0; $i < count($actividades); $i++) { 				
				if ($actividades[$i]["displayName"] == $actividad) {
					$id = $actividades[$i]["id"];
				}
			}
			return $id;
		}

		function cerrarTarea($idTask){			
			$parametros = $this->Bonitas->conexiones();				
			$parametros["http"]["method"] = "POST";			
			$param = stream_context_create($parametros);	
			$response = $this->Tareas->cerrarTarea($idTask,$param);
			return $response;
		}

		function actualizarIdOTenBPM($caseId, $idOTnueva){

			dump($caseId, 'id de case en actualizar');
			dump($idOTnueva, 'id ot en actuallizar');
			
			$idOT = (integer)$idOTnueva;
			$contract = array(
				"type" => "java.lang.Integer",
  			"value" => $idOT
			);		
			// trae la cabecera
			$parametros = $this->Bonitas->conexiones();
			// Cambio el metodo de la cabecera a "PUT"
			$parametros["http"]["method"] = "PUT";
			$parametros["http"]["content"] = json_encode($contract);
			// Variable tipo resource referencia a un recurso externo.
			$param = stream_context_create($parametros);
			$response = $this->Tareas->actualizarIdOTenBPM($caseId, $param);
		}
		

	/*	./ INTEGRACION CON BPM */
	}