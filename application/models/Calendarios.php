<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Calendarios extends CI_Model {
	
    function __construct()
	{
		parent::__construct();
	}	

    /**
     * MANDA ORDENES DE TRABAJO AL CALENDARIO (programadas).
     *
     * @param   Array   $data   Arreglo con el mes y el año a mostrar.
     * @return  Array           Ordenes de trabajo de la fecha especificada.
     */
    function getot($data = null) // Ok
    {
        $userdata = $this->session->userdata('user_data');
        $empId    = $userdata[0]['id_empresa'];
        //dump_exit($data);
        $month = $data['month'] + 1 ; 
        $year  = $data['year'] ;
        $sql= "SELECT orden_trabajo.id_orden,
            orden_trabajo.nro,
            orden_trabajo.fecha_program,
            orden_trabajo.tipo,
            orden_trabajo.descripcion,
            orden_trabajo.duracion,
            equipos.codigo 
            from orden_trabajo
            INNER JOIN equipos ON equipos.id_equipo = orden_trabajo.id_equipo
            WHERE orden_trabajo.id_empresa = $empId
            AND orden_trabajo.estado != 'T'
            AND month(orden_trabajo.fecha_program) = $month
            AND year(orden_trabajo.fecha_program) = $year";
        $query= $this->db->query($sql);
        
        if ($query->num_rows()!=0)
        {
            return $query->result_array();  
        }
        else
        {
            return false;
        }
    }

    // Preventivos por Hora para la Tabla
    function getPreventivosHoras($mes, $year)
    {
        $userdata = $this->session->userdata('user_data');
        $empId    = $userdata[0]['id_empresa'];
        //$month = $data;//['month'] + 1 ;    
        //$month = $data['month'] + 1 ; 
        //$year  = $data['year'] ;
        $sql = "SELECT preventivo.prevId, 
            preventivo.id_tarea, 
            preventivo.perido, 
            preventivo.cantidad, 
            preventivo.ultimo,
            preventivo.id_equipo,
            preventivo.critico1,
            preventivo.lectura_base,
            equipos.codigo, 
            equipos.id_equipo,
            equipos.ultima_lectura, 
            tareas.descripcion,
            DATE_ADD(preventivo.ultimo, INTERVAL preventivo.cantidad DAY) AS prox 
            from preventivo 
            join equipos ON preventivo.id_equipo = equipos.id_equipo 
            join tareas ON preventivo.id_tarea = tareas.id_tarea 
            WHERE preventivo.id_empresa = $empId AND preventivo.estadoprev = 'C' AND ((preventivo.perido = '5') OR (preventivo.perido = '6'))";//horas o ciclos
            //AND month(DATE_ADD(preventivo.ultimo, INTERVAL preventivo.cantidad DAY)) = $mes 
            //AND year(orden_trabajo.fecha_program) = $year
            //";
        $query = $this->db->query($sql);
                if ($query->num_rows()!=0)
        {
            return $query->result_array();  
        }
        else
        {
            return false;
        }       
    }

    // Predictivos para la Tabla por id de empresa logueada
    function getpredlist($month, $year) // Ok
    {
        $userdata = $this->session->userdata('user_data');
        $empId    = $userdata[0]['id_empresa'];
        $sql      = "SELECT predictivo.predId, 
            predictivo.tarea_descrip,  
            predictivo.periodo, 
            predictivo.cantidad, 
            predictivo.fecha,
            predictivo.horash, 
            predictivo.id_equipo,               
            equipos.id_equipo,
            equipos.codigo,     
            tareas.descripcion,
            sector.descripcion AS sector 
            FROM predictivo 
                JOIN equipos ON predictivo.id_equipo = equipos.id_equipo 
                JOIN tareas ON predictivo.tarea_descrip = tareas.id_tarea
                JOIN sector ON sector.id_sector = equipos.id_sector 
            WHERE predictivo.id_empresa = $empId
                AND month(predictivo.fecha) = $month 
                AND year(predictivo.fecha) = $year 
                AND predictivo.estado = 'C'
            ";
        $query = $this->db->query($sql);
        if ($query->num_rows()!=0)
        {
            return $query->result_array();  
        }
        else
        {
            return false;
        }
    }

    // Backlog para la Tabla por id de empresa logueada
    function getbacklog($month, $year) // Ok
    {
        $userdata = $this->session->userdata('user_data');
        $empId    = $userdata[0]['id_empresa'];    
        $sql      = "SELECT
                    tbl_back.backId,
                    tbl_back.sore_id,
                    tbl_back.estado,
                    tbl_back.fecha,
                    tbl_back.id_tarea,
                    tbl_back.id_equipo,
                    tbl_back.back_duracion,
                    tbl_back.tarea_opcional,
                    equipos.descripcion,
                    equipos.codigo,
                    tareas.descripcion AS tarea
                    FROM tbl_back
                    INNER JOIN equipos ON equipos.id_equipo = tbl_back.id_equipo
                    LEFT JOIN tareas ON tareas.id_tarea = tbl_back.id_tarea
                    WHERE tbl_back.id_empresa = $empId
                    AND year(tbl_back.fecha) = $year 
                    AND month(tbl_back.fecha) = $month 
                    AND tbl_back.estado != 'AN' 
										AND tbl_back.estado != 'OT'
										AND tbl_back.estado != 'PL'";
        $query= $this->db->query($sql);
        if ($query->num_rows()!=0)
        {
            return $query->result_array();  
        }
        else
        {
            return false;
        }
    }

    // Trae preventivos
    function getPreventivos($month, $year) // Ok
    {   
        $userdata = $this->session->userdata('user_data');
        $empId    = $userdata[0]['id_empresa'];
        $sql  = "select preventivo.prevId, preventivo.id_tarea, preventivo.perido, preventivo.cantidad, preventivo.ultimo, preventivo.id_equipo, equipos.codigo, equipos.id_equipo, tareas.descripcion, 
            DATE_ADD(preventivo.ultimo, INTERVAL preventivo.cantidad DAY) AS prox 
            from preventivo join equipos ON preventivo.id_equipo = equipos.id_equipo 
            join tareas ON preventivo.id_tarea = tareas.id_tarea 
            where (preventivo.estadoprev = 'C') AND 
            (month(DATE_ADD(preventivo.ultimo, INTERVAL preventivo.cantidad DAY)) = $month or month(preventivo.ultimo) = $month)";  
        // $sql = "SELECT preventivo.prevId, 
        //     preventivo.id_tarea, 
        //     preventivo.perido, 
        //     preventivo.cantidad, 
        //     preventivo.ultimo,
        //     preventivo.id_equipo,
        //     equipos.codigo, 
        //     equipos.id_equipo, 
        //     tareas.descripcion,
        //     DATE_ADD(preventivo.ultimo, INTERVAL preventivo.cantidad DAY) AS prox 
        //     FROM preventivo 
        //         JOIN equipos ON preventivo.id_equipo = equipos.id_equipo 
        //         JOIN tareas ON preventivo.id_tarea = tareas.id_tarea 
        //     WHERE preventivo.id_empresa = $empId
        //         AND preventivo.estadoprev = 'C'
        //         AND year(DATE_ADD(preventivo.ultimo, INTERVAL preventivo.cantidad DAY)) = $year 
        //         AND month(DATE_ADD(preventivo.ultimo, INTERVAL preventivo.cantidad DAY)) = $month 
        //     ";    
        $query = $this->db->query($sql);
        if ($query->num_rows()!=0)
        {
            return $query->result_array();  
        }
        else
        {
            return false;
        }       
    }

    // Correctivos para la Tabla por id de empresa logueada
    function getsservicio($month, $year) // Ok
    {        
        $userdata = $this->session->userdata('user_data');
        $empId    = $userdata[0]['id_empresa'];
        $sql      = " SELECT solicitud_reparacion.id_solicitud,
											solicitud_reparacion.numero,
											solicitud_reparacion.id_tipo,
											solicitud_reparacion.nivel,
											solicitud_reparacion.solicitante,
											solicitud_reparacion.f_solicitado,
											solicitud_reparacion.f_sugerido,
											solicitud_reparacion.hora_sug,
											solicitud_reparacion.estado,
											equipos.descripcion,
											equipos.codigo,
											equipos.id_equipo,
											solicitud_reparacion.correctivo,
											solicitud_reparacion.causa,
											sector.descripcion AS sector
											FROM solicitud_reparacion
											INNER JOIN equipos ON equipos.id_equipo = solicitud_reparacion.id_equipo
											INNER JOIN sector ON sector.id_sector = equipos.id_sector
											WHERE solicitud_reparacion.id_empresa = $empId
											AND solicitud_reparacion.estado != 'AN'										
											AND solicitud_reparacion.estado != 'PL'
											AND year(solicitud_reparacion.f_solicitado) = $year
											AND month(solicitud_reparacion.f_solicitado) = $month";
        $query = $this->db->query($sql);
        if ($query->num_rows()!=0)
        {
            return $query->result_array();  
        }
        else
        {
            return false;
        }       
    }



    // Preventivo por Id
    function getPrevPorIds($data)
    {
        $id = $data;
        $this->db->select('preventivo.id_tarea, 
            preventivo.ultimo, 
            preventivo.prevId,
            preventivo.id_equipo,
            tareas.descripcion
            ');
        $this->db->from('preventivo');
        $this->db->join('tareas', 'tareas.id_tarea = preventivo.id_tarea');
        $this->db->where('preventivo.prevId', $id);
        $query = $this->db->get();      
        return $query->result_array();                
    }

    function actualizarFechaBasePreventivos($fecha_limite, $id_orden)
    {
        $this->db->set('ultimo', $fecha_limite);
        $this->db->where('prevId', $id_orden);
        $resposnse = $this->db->update('preventivo');
        return $resposnse;
    }



    function getperiodo($data = null)
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];      

        $this->db->select('periodo.idperiodo, periodo.descripcion');
        $this->db->from('periodo');
        if($data == null) {
            $id = $data['periodoId'];
            $this->db->where('periodo.idperiodo', $id);
        }
        $this->db->where('periodo.id_empresa', $empresaId);
        $this->db->where('periodo.estado', 'AC');
        $this->db->order_by('periodo.descripcion');
        $query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
    }









	function Equipos_List()
    {
		$this->db->order_by('codigo','asc');
		$this->db->order_by('descripcion','asc');
		$query = $this->db->get('equipos');
		
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{
			return false;
		}
	}
	
	function setVisit($data = null)
    {
		if($data == null)
		{
			return false;
		}
		else
		{
			$equipId = $data['equip'];
			$dia = $data['fecha'];
			$hora = $data['hora'];
			$min = $data['min'];
			$note = $data['falla'];
	       	$dia = explode('-', $dia);
			$insert = array(
				   'fecha_inicio' => $dia[2].'-'.$dia[1].'-'.$dia[0],
				   'id_equipo' => $equipId,
				   'estado' => 'C',
				   'tipo' => '2',
				   'id_sucursal' => '1',
				   'id_tarea' => '1',
				   'id_usuario' => '1',
				   'id_usuario_a' => '1',
				    'id_usuario_e' => '1',
				   'descripcion' => $note
				);


			if($this->db->insert('orden_trabajo', $insert) == false) {
				return false;
			}else{
				return "Se programo la Orden de Trabajo para el día <br>".$data['dia']." a las ".$data['hora'].":".$data['min'];
			}
		}
	}		

	function getpred($data = null){
		
		if($data == null)
		{
			return false;
		}
		else
		{
			$month = $data['month'] + 1 ;

			$sql= "select predictivo.predId, 
					predictivo.tarea_descrip, 
					predictivo.periodo, 
					predictivo.cantidad, 
					predictivo.fecha, 
					equipos.id_equipo, 
					predictivo.estado,
					predictivo.id_equipo, 
					tareas.descripcion,					 
					DATE_ADD(predictivo.fecha, INTERVAL predictivo.cantidad DAY) AS prox 
					from predictivo 
					join equipos ON predictivo.id_equipo = equipos.id_equipo 
					join tareas ON predictivo.tarea_descrip = tareas.id_tarea 
					where predictivo.estado = 'C' 
					AND month(DATE_ADD(predictivo.fecha, INTERVAL predictivo.cantidad DAY)) = $month ";
			
			$query= $this->db->query($sql);
			
			if ($query->num_rows()!=0)
			{
				return $query->result_array();	
			}
			else
			{
				return false;
			}
		}
	}
		
	// FUNCIONES DE OT	
		//Guarda orden de trabajo a partir de Pred/Correc/Backlog/Prevent
		function guardar_agregar($data){
	
			$query = $this->db->insert("orden_trabajo",$data);
			$idOT = $this->db->insert_id();
			return $idOT;        
		}

		// guarda case_id en Otrabajo
		function setCaseidenOT($case_id, $id){
			$this->db->where('orden_trabajo.id_orden', $id);
			return $this->db->update('orden_trabajo', array('case_id'=>$case_id));			
		}

		function cambiarEstado($id_solicitud, $estado, $tipo){						
			
			if ($tipo == 'correctivo') {
				$this->db->set('estado', $estado);
				$this->db->where('id_solicitud', $id_solicitud);
				$response = $this->db->update('solicitud_reparacion');
			}

			if ($tipo == 'preventivo') {
				$this->db->set('estadoprev', $estado);
				$this->db->where('prevId', $id_solicitud);
				$response = $this->db->update('preventivo');
			}

			if ($tipo == 'backlog') {
				$this->db->set('estado', $estado);
				$this->db->where('backId', $id_solicitud);
				$response = $this->db->update('tbl_back');
			}			

			if ($tipo == 'predictivo') {
				$this->db->set('estado', $estado);
				$this->db->where('predId', $id_solicitud);
				$response = $this->db->update('predictivo');
			}			

			return $response;
		}

		// Trae adjunto de Tarea original segun tipo (Backlog, Prevent y predict)
		function getAdjunto($id_solicitud,$tipo){
			
			switch ($tipo) {
				case '5':		// Predictivo
								$this->db->select('predictivo.pred_adjunto');
								$this->db->from('predictivo');
								$this->db->where('predictivo.predId',$id_solicitud);
								$query = $this->db->get();
								$row = $query->row();
								$result =  $row->pred_adjunto; 
								break;
				case '4':		//Backlog
								$this->db->select('tbl_back.back_adjunto');
								$this->db->from('tbl_back');
								$this->db->where('tbl_back.backId',$id_solicitud);
								$query = $this->db->get();
								$row = $query->row();
								$result =  $row->back_adjunto; 
								break;		
				default:		//Preventivo
								$this->db->select('preventivo.prev_adjunto');
								$this->db->from('preventivo');
								$this->db->where('preventivo.prevId',$id_solicitud);
								$query = $this->db->get();
								$row = $query->row();
								$result =  $row->prev_adjunto; 								
			}
			return $result;
		}

		// guarda el adjunto que viene de la Tarea Original(Backlog, prevent y predict)
		function insertAdjunto($idOT,$adjunto){		
			$data = array('otId'=>$idOT,
										'ot_adjunto'=>$adjunto);
			$query = $this->db->insert("tbl_otadjuntos",$data);
			return $query;
		}

		// TODO: ENTENDER SI YA NO SE USA CON LA NUEVA MODIFICACION DE HERRAM E INSUMOS
		// Guarda batch de OT 
		function setOTbatch($data)
		{
			$this->db->insert_batch('orden_trabajo', $data);
		}

		//devuelve valores de todos los datos de la OT para mostrar en modal.
		function getDataOt($idOt){
				$this->db->select('orden_trabajo.id_orden,
													orden_trabajo.id_tarea,
													orden_trabajo.descripcion,
													orden_trabajo.tipo,
													orden_trabajo.id_solicitud,
													orden_trabajo.fecha_program,
													equipos.codigo,
													equipos.descripcion AS descripcionEquipo,
													tbl_tipoordentrabajo.descripcion AS descrpcionSolicitud');
				$this->db->from('orden_trabajo');			
				$this->db->join('equipos', 'orden_trabajo.id_equipo = equipos.id_equipo');
				$this->db->join('tbl_tipoordentrabajo', 'tbl_tipoordentrabajo.id = orden_trabajo.tipo');			
				$this->db->where('orden_trabajo.id_orden', $idOt);
				$query = $this->db->get();
				if($query->num_rows()!=0)
				{
					
						return $query->result_array();
				}
				else
				{
						return array();
				}
		}

		function getInfoTareaProgram($numtipo, $id_solicitud){
			switch ($numtipo) {	
				// correctivo
				case '2':
					// correctivo no tiene duracion...
					$tipo = 'correctivo';
					break;
				// preventivo
				case '3':
					$this->db->select('unidad_tiempo.unidaddescrip,
														preventivo.prev_duracion AS duracionTarea,
														preventivo.cantidad AS frecuencia,
														periodo.descripcion AS especieFrecuencia');
					$this->db->from('unidad_tiempo');
					$this->db->join('preventivo', 'unidad_tiempo.id_unidad = preventivo.id_unidad');
					$this->db->join('periodo', 'preventivo.perido = periodo.idperiodo');
					
					$query = $this->db->get();
					return $query->result_array();
					break;
				// backlog
				case '4':
					$this->db->select('tbl_back.back_duracion AS duracionTarea,
														tbl_back.back_duracion AS frecuencia,
														unidad_tiempo.unidaddescrip');
					$this->db->from('unidad_tiempo');									
					$this->db->join('tbl_back', 'unidad_tiempo.id_unidad = tbl_back.id_unidad');
					$query = $this->db->get();
					return $query->result_array();				
					break;
				// predictivo
				default:			
					$this->db->select('predictivo.pred_duracion AS duracionTarea,
														predictivo.id_unidad,
														predictivo.cantidad AS frecuencia,
														unidad_tiempo.unidaddescrip');
					$this->db->from('unidad_tiempo');
					$this->db->join('predictivo', 'predictivo.id_unidad = predictivo.id_unidad');
					$this->db->where('predictivo.predId', $id_solicitud);	
					$query = $this->db->get();
					return $query->result_array();
					break;
			}
		}

		//devuelve valores de todos los datos de la OT para mostrar en modal.
		function getOrigenOt($idot)
		{
			$this->db->select('orden_trabajo.tipo, orden_trabajo.id_solicitud');
				$this->db->from('orden_trabajo');
				$this->db->where('orden_trabajo.id_orden', $idot);

				$query = $this->db->get();
				if($query->num_rows()!=0)
				{
						return $query->result_array();
				}
				else
				{
						return false;
				}
		}

		// devuelve usuarios a asignar OT
		function getOperarios(){
			$userdata  = $this->session->userdata('user_data');
			$empresaId = $userdata[0]['id_empresa'];
			dump($empresaId, 'id de empresa: ');
			// $this->db->select('sisusers.usrId, sisusers.usrLastName, sisusers.usrname');
			// $this->db->join('usuarioasempresa', 'usuarioasempresa.usrId = sisusers.usrId');
			// $this->db->from('sisusers');
			// $this->db->where('usuarioasempresa.empresaid', $empresaId);
			// $this->db->where('usuarioasempresa.estado', 'AC');
			// $query = $this->db->get();
			// $i     = 0;
			// foreach ($query->result() as $row)
			// {   
			// 		$operarios[$i]['label'] = $row->usrLastName.", ". $row->usrname ;
			// 		$operarios[$i]['value'] = $row->usrId;
			// 		$i++;
			// }
			// return $operarios; 
		} 

		// Trae tareas por empresa logueada - Listo
		function gettareas(){

			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa']; 

			$this->db->select('tareas.id_tarea, tareas.descripcion');			
			$this->db->from('tareas');
			$this->db->where('tareas.id_empresa',$empId);
			$query= $this->db->get();
			//$query->result_array();
			
			if($query->num_rows()>0){
					return $query->result_array();
			}
			else{
					return array();
			}			
		}

	//////// FUNCIONES CALENDARIO	
    // Actualiza dia nueva fecha de programacion en OT
    function updateDiaProgramacion($id, $diaNuevo){   		
   		
   		$this->db->set('fecha_program', $diaNuevo);
			$this->db->where('id_orden', $id);
			$resposnse = $this->db->update('orden_trabajo');
			return $resposnse;
   	}
   	// Actualiza la nueva duracion de la OT 
   	function updateDuraciones($id, $nueva){

   		$this->db->set('duracion', $nueva);
		$this->db->where('id_orden', $id);
		$resposnse = $this->db->update('orden_trabajo');
		return $resposnse;
   	}

	////// CORRECTIVOS 
		function getCorrectPorIds($data){

			$id = $data;
			
					$this->db->select('solicitud_reparacion.id_solicitud,
									solicitud_reparacion.f_solicitado, 
									solicitud_reparacion.causa,
							solicitud_reparacion.id_equipo						
							');
					$this->db->from('solicitud_reparacion');        
					$this->db->where('solicitud_reparacion.id_solicitud', $id);
					$query = $this->db->get();      
					
					return $query->result_array();  
		}

	/////	BACKLOG
		function getBackPorIds($data){
			$id = $data;
			
			$this->db->select('tbl_back.*,
			tareas.descripcion as tareadesc');
			$this->db->from('tbl_back'); 
			$this->db->join('tareas', 'tbl_back.id_tarea = tareas.id_tarea', 'left');       
			$this->db->where('tbl_back.backId', $id);
			$query = $this->db->get();      
			
			return $query->result_array(); 
		}
		// Trae herramientas ppor id de preventivo para Editar
		function getBacklogHerramientas($id){
				
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa']; 

			$this->db->select('tbl_backlogherramientas.cantidad,
													herramientas.herrcodigo,
													herramientas.herrmarca,
													herramientas.herrdescrip,
													herramientas.herrId');
			$this->db->from('tbl_backlogherramientas');
			$this->db->join('herramientas', 'herramientas.herrId = tbl_backlogherramientas.herrId');   
			$this->db->where('tbl_backlogherramientas.backId', $id);        
			$this->db->where('tbl_backlogherramientas.id_empresa', $empId);
			$query= $this->db->get();

			if( $query->num_rows() > 0)
			{
				return $query->result_array();
			}
			else {
				return 0;
			}
		}	
		// Trae insumos por id de preventivo para Editar
		function getBacklogInsumos($id){
				
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa']; 

			$this->db->select('tbl_backloginsumos.id,
													tbl_backloginsumos.cantidad,
													articles.artBarCode,
													articles.artId,
													articles.artDescription,
													articles.id_empresa');                            
			$this->db->from('tbl_backloginsumos');
			$this->db->join('articles', 'articles.artId = tbl_backloginsumos.artId');   
			$this->db->where('tbl_backloginsumos.backId', $id);        
			$this->db->where('articles.id_empresa', $empId);
			$query= $this->db->get(); 

			if( $query->num_rows() > 0)
			{
				return $query->result_array();
			}
			else {
				return 0;
			}
		}



		
	///// PREDICTIVOS	
		function getPredictPorIds($data){
			$id = $data;
			
			$this->db->select('predictivo.tarea_descrip,
												tareas.descripcion,
												predictivo.predId,
												predictivo.id_equipo,
												predictivo.fecha');
			$this->db->from('predictivo');
			$this->db->join('tareas', 'tareas.id_tarea = predictivo.tarea_descrip');
			$this->db->where('predictivo.predId', $id);
			$query = $this->db->get();      
			
			return $query->result_array(); 
		}
		// Trae herramientas por id de predictivo para guardar en OT
		function getPredictivoHerramientas($id){
					
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa']; 

			$this->db->select('tbl_predictivoherramientas.cantidad,
													herramientas.herrcodigo,
													herramientas.herrmarca,
													herramientas.herrdescrip,
													herramientas.herrId');
			$this->db->from('tbl_predictivoherramientas');
			$this->db->join('herramientas', 'herramientas.herrId = tbl_predictivoherramientas.herrId');   
			$this->db->where('tbl_predictivoherramientas.predId', $id);        
			$this->db->where('tbl_predictivoherramientas.id_empresa', $empId);
			$query= $this->db->get();

			if( $query->num_rows() > 0)
			{
				return $query->result_array();
			}
			else {
				return 0;
			}
		}
		// Trae insumos por id de preventivo para Editar
    function getPredictivoInsumos($id){
        
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa']; 

			$this->db->select('tbl_predictivoinsumos.id,
													tbl_predictivoinsumos.cantidad,
													articles.artBarCode,
													articles.artId,
													articles.artDescription,
													articles.id_empresa');                            
			$this->db->from('tbl_predictivoinsumos');
			$this->db->join('articles', 'articles.artId = tbl_predictivoinsumos.artId');   
			$this->db->where('tbl_predictivoinsumos.predId', $id);        
			$this->db->where('articles.id_empresa', $empId);
			$query= $this->db->get(); 

			if( $query->num_rows() > 0)
			{
				return $query->result_array();
			}
			else {
				return 0;
			}
		}
		// Guarda el bacht de datos de herramientas 
		function insertOTHerram($idOT,$herra){

			$userdata  = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];	
			$i = 0;
			foreach ($herra as $h) {
				$herramientas[$i]['otId'] = $idOT;
				$herramientas[$i]['herrId'] = $h["herrId"];
				$herramientas[$i]['cantidad'] = $h["cantidad"];
				$herramientas[$i]['id_empresa']= $empId;
				$i++;                                
			} 			
			$query = $this->db->insert_batch("tbl_otherramientas",$herramientas);
			return $query;
		}
		// Guarda el bacht de insumos 
		function insertOTInsum($idOT,$ins){
			//dump($ins, 'insumos en entrada de funcion insert: ');
			$userdata  = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];	
			$j = 0;
			foreach ($ins as $in) {
				$insumo[$j]['otId'] = $idOT;
				$insumo[$j]['artId'] = $in['artId'];
				$insumo[$j]['cantidad'] = $in['cantidad'];
				$insumo[$j]['id_empresa'] = $empId;
				$j++;                                
			}			
			$query = $this->db->insert_batch("tbl_otinsumos",$insumo);
			return $query;
		}
	 






	///// PREVENTIVOS	
				
		// Trae herramientas ppor id de preventivo para Editar
		function getPreventivoHerramientas($id){
				
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa']; 

			$this->db->select('tbl_preventivoherramientas.cantidad,
													herramientas.herrcodigo,
													herramientas.herrmarca,
													herramientas.herrdescrip,
													herramientas.herrId');
			$this->db->from('tbl_preventivoherramientas');
			$this->db->join('herramientas', 'herramientas.herrId = tbl_preventivoherramientas.herrId');   
			$this->db->where('tbl_preventivoherramientas.prevId', $id);        
			$this->db->where('tbl_preventivoherramientas.id_empresa', $empId);
			$query= $this->db->get();

			if( $query->num_rows() > 0)
			{
				return $query->result_array();
			}
			else {
				return 0;
			}
		}	
		// Trae insumos por id de preventivo para Editar
		function getPreventivoInsumos($id){
				
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa']; 

			$this->db->select('tbl_preventivoinsumos.id,
													tbl_preventivoinsumos.cantidad,
													articles.artBarCode,
													articles.artId,
													articles.artDescription,
													articles.id_empresa');                            
			$this->db->from('tbl_preventivoinsumos');
			$this->db->join('articles', 'articles.artId = tbl_preventivoinsumos.artId');   
			$this->db->where('tbl_preventivoinsumos.prevId', $id);        
			$this->db->where('articles.id_empresa', $empId);
			$query= $this->db->get(); 

			if( $query->num_rows() > 0)
			{
				return $query->result_array();
			}
			else {
				return 0;
			}
		}
	

		/**
     * Trae listado de equipos que tengan mantenimiento preventivo por horas
     *
     * @return  Array   Vuleca la variable o no devuelve nada
     */
    function getPreventivosPorHora()
    {
        $this->db->select('equipos.codigo, equipos.descripcion, equipos.id_equipo, equipos.ultima_lectura, sector.descripcion as descripSector, preventivo.estadoprev, preventivo.prevId, preventivo.cantidad, preventivo.critico1');
        $this->db->from('preventivo');
        $this->db->join('equipos', 'equipos.id_equipo = preventivo.id_equipo', 'inner');
        $this->db->join('sector', 'sector.id_sector = equipos.id_sector', 'inner');
        $this->db->where('preventivo.perido', '5');//horas
        $this->db->where('equipos.estado', 'AC');

        $query= $this->db->get();

        if ($query->num_rows() > 0)
        {
            $preventivos  = $query->result_array();
            $data['data'] = $this->revisaEstadoPreventivosPorHoras( $preventivos );
            //$data['data'] = $query->result_array();
            return  $data;
        }
        else
        {
            return false;
        }
    }

    
    // bucle que recorra preventivos
			//      con id_equipo traigo historial_lecturas ->ultima lectura
			//      hago cuenta
			//      si es necesario llamo funcion que cambia estado de preventivo
			//      cambio $preventivos[estadoprev]
			// cierro bucle
			// devuelvo $preventivos
    function revisaEstadoPreventivosPorHoras($preventivos)
    {
        $cantPreventivos = sizeof( $preventivos );
        for ($i=0; $i<$cantPreventivos; $i++)
        {
            $lecturaActual = $this->getLecturaActual( $preventivos[$i]['id_equipo'] );
            //dump( $lecturaActual, 'Lectura Actual' );
            //dump( $preventivos[$i]['ultima_lectura'], 'Ultima lectura' );
            //dump( $preventivos[$i]['cantidad'], 'cantidad' );
            //dump( $preventivos[$i]['critico1'], 'critico' );

            //1er caso: lecturaactual - ultimalectura >= cantidad  => estado vencido
            if (($lecturaActual - $preventivos[$i]['ultima_lectura']) >= $preventivos[$i]['cantidad'])
            {
                if ($preventivos[$i]['estadoprev'] != 'VE')
                {
                    $this->cambiaEstadoPreventivo( $preventivos[$i]['prevId'], 'VE' );
                    $preventivos[$i]['estadoprev'] = 'VE';
                }
            }

            //2do caso: lecturaactual - ultimalectura < cantidad  => estado en curso
            if (($lecturaActual - $preventivos[$i]['ultima_lectura']) < $preventivos[$i]['cantidad'])
            {
                //3er caso: > cantidad => estado critico
                if (($lecturaActual - $preventivos[$i]['ultima_lectura']) > $preventivos[$i]['cantidad'])
                {
                    if ($preventivos[$i]['estadoprev'] != 'CR')
                    {
                        $this->cambiaEstadoPreventivo( $preventivos[$i]['prevId'], 'CR' );
                        $preventivos[$i]['estadoprev'] = 'CR';
                    }
                }
                else // si no es critico => esta en curso
                {
                    if ($preventivos[$i]['estadoprev'] != 'C')
                    {
                        $this->cambiaEstadoPreventivo( $preventivos[$i]['prevId'], 'C' );
                        $preventivos[$i]['estadoprev'] = 'C';
                    }
                }
            }
        }
        return $preventivos;
    }

    /**
     * Devuelve la ultima lectura de un equipo determinado
     *
     * @param   String  $id_equipo  Equipo que se quiere saber la ultima lectura
     * @return  Int     Última lectura
     */
    function getLecturaActual($id_equipo)
    {
        $this->db->select('lectura');
        $this->db->from('historial_lecturas');
        $this->db->where('id_equipo', $id_equipo);
        $this->db->order_by('id_lectura', 'desc');
        $this->db->limit(1);

        $query= $this->db->get();

        if ($query->num_rows() > 0)
        {
            $data  = $query->result_array();
            return  (int)$data[0]['lectura'];
        }
        else
        {
            return false;
        }
    }

    /**
     * Cambia el campo Estado de la tabla preventivo
     *
     * @param   String  $idPreventivo   Id del preventivo a modificar
     * @param   String  $estado         Valor del nuevo estado
     * @return  bool                    Cambio correcto o incorrecto
     */
    function cambiaEstadoPreventivo($idPreventivo, $estado)
    {
        $data = array(
           'estadoprev' => $estado
        );
        $this->db->where('prevId', $idPreventivo);
        $this->db->update('preventivo', $data);

        if ($this->db->trans_status() === FALSE)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
   


/* funciones para BPM */
    function getCaseIdporIdBacklog($id_solicitud){
			// $this->db->select('solicitud_reparacion.case_id');
			// $this->db->from('tbl_back');
			// $this->db->join('solicitud_reparacion', 'tbl_back.sore_id = solicitud_reparacion.id_solicitud');
			// $this->db->where('tbl_back.sore_id', $id_solicitud);
			// $query = $this->db->get();
			// if ($query->num_rows() > 0){
			// 	return $query->row('case_id');				
			// }
			// else{
			// 	return 0;
			// }
				
			$this->db->select('solicitud_reparacion.case_id');
			$this->db->from('solicitud_reparacion');
			$this->db->join('tbl_back', 'tbl_back.sore_id = solicitud_reparacion.id_solicitud');
			$this->db->where('tbl_back.backId', $id_solicitud);
			$query = $this->db->get();
			if ($query->num_rows() > 0){
				return $query->row('case_id');				
			}
			else{
				return 0;
			}


		}
						
		function getCaseIdporIdSolServicios($id_solicitud){
			$this->db->select('solicitud_reparacion.case_id');
			$this->db->from('solicitud_reparacion');			
			$this->db->where('solicitud_reparacion.id_solicitud', $id_solicitud);
			$query = $this->db->get();
			if ($query->num_rows() > 0){
				return $query->row('case_id');				
			}
			else{
				return 0;
			}
		}
	}		
