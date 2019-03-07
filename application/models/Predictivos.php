<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Predictivos extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	// Lista Predictivos con estado 'C' por Empresa Logueada
	function predictivo_List(){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
        
			$this->db->select('predictivo.predId, 
												predictivo.id_equipo,
												predictivo.tarea_descrip, 
												predictivo.fecha,  												 
												predictivo.cantidad,
												predictivo.estado, 
												predictivo.horash,
												predictivo.pred_adjunto, 
												equipos.descripcion AS des, 
												equipos.marca, 
												equipos.codigo, 
												equipos.ubicacion, 
												equipos.fecha_ingreso, 
												tareas.descripcion as de1,
												periodo.descripcion AS periodo');
    	$this->db->from('predictivo');
    	$this->db->join('equipos','equipos.id_equipo = predictivo.id_equipo');
			$this->db->join('tareas', 'tareas.id_tarea = predictivo.tarea_descrip');
			$this->db->join('periodo', 'periodo.idperiodo = predictivo.periodo');    	
    	$this->db->where('predictivo.estado', 'C');
    	$this->db->where('predictivo.id_empresa', $empId);    	    	
    	$query= $this->db->get(); 		
	    
	    if( $query->num_rows() > 0)
	    {
	      
	      $data['data'] = $query->result_array();	
	      return  $data;
	    } 
	    else 
	    	$data['data'] = 0;
	      return  $data; 
	}

	// Trae equipos por empresa logueada - Listo
	function getEquipos(){
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
        
    	$this->db->select('equipos.id_equipo,equipos.codigo');
    	$this->db->from('equipos');
    	$this->db->where('equipos.estado', 'AC');
    	$this->db->where('equipos.id_empresa', $empId);    	
    	$query= $this->db->get();		
		
	 	if ($query->num_rows()!=0)
	 	{
	 		return $query->result_array();	
	 	}
	 	else
	 	{	
	 		return false;
	 	}	
	}

	// Trae info de equipos por ID y por empresa logueada - Listo
	function getInfoEquipos($id){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
        
    	$this->db->select('equipos.*');
    	$this->db->from('equipos');
    	$this->db->where('equipos.estado', 'AC');
    	$this->db->where('equipos.id_empresa', $empId);
    	$this->db->where('equipos.id_equipo', $id);      	
    	$query= $this->db->get();   

		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	// Trae tareas por empresa logueada - Listo
	function gettarea(){

		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa']; 
		$this->db->select('tareas.id_tarea AS value, tareas.descripcion AS label');
		$this->db->from('tareas');    	
		$this->db->where('tareas.id_empresa', $empId);
		$this->db->where('estado', 'AC');
		$this->db->order_by('label', 'ASC');
		$query= $this->db->get();

		if($query->num_rows()>0){
			return $query->result_array();
		}
		else{
			return false;
		}
	}

	// Trae unidades de tiempo  - Listo
	function getUnidTiempos(){

		$this->db->select('unidad_tiempo.*');
    	$this->db->from('unidad_tiempo');    	
    	$query= $this->db->get();

		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
	}

	//Insertar  predictivo  - Listo
	function insert_predictivo($data){
		$query = $this->db->insert("predictivo",$data);
		return $query;
	}

	// Guarda el bacht de datos de herramientas de Preventivo - Listo
	function insertPredHerram($herramPred){

		$query = $this->db->insert_batch("tbl_predictivoherramientas",$herramPred);
		return $query;
	}

	// Guarda insumos del Preventivo - Listo 
	function insertPredInsum($insumoPred){

		$query = $this->db->insert_batch("tbl_predictivoinsumos",$insumoPred);
		return $query;
}

// Guarda el nombre de adjunto
function updateAdjunto($adjunto,$ultimoId){
	$this->db->where('predId', $ultimoId);
	$query = $this->db->update("predictivo",$adjunto);
	return $query;
}

	// Trae info para edicion de preventivo por id - Listo
    function getInfopred($ide,$id){
		
	    $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
        
    	$this->db->select('predictivo.id_equipo,
												predictivo.predId, 												
												predictivo.fecha, 
												predictivo.estado as es, 
												predictivo.cantidad, 
												predictivo.periodo,
												predictivo.pred_duracion as duracion,
												predictivo.id_unidad as unidtiempo, 
												predictivo.pred_canth as operarios,
												predictivo.horash as hh,
												equipos.codigo, 
												equipos.ubicacion, 
												equipos.marca, 
												equipos.fecha_ingreso, 
												equipos.descripcion,
												tareas.id_tarea, 
                        tareas.descripcion AS tarea_descrip');    	
    	$this->db->from('predictivo'); 
			$this->db->join('equipos', 'equipos.id_equipo=predictivo.id_equipo');   
			$this->db->join('tareas', 'tareas.id_tarea=predictivo.tarea_descrip');	
    	$this->db->where('predictivo.predId', $id);
    	$this->db->where('predictivo.id_equipo', $ide);
    	$this->db->where('predictivo.id_empresa', $empId);
    	$query= $this->db->get();

			if($query->num_rows()>0){
							return $query->result();
					}
					else{
							return false;
					}	
		}	

	// Trae herramientas ppor id de preventivo para Editar
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

	
	// Devuelve info de Predictivo por ID
	function getInfoPredId($id){	 

	    $this->db->select('predictivo.*');
    	$this->db->from('predictivo');    	
    	$this->db->where('predictivo.predId', $id);
    	$query= $this->db->get();
	    
	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();	
	    } 
	    else {
	      return 0;
	    }
	}
	
	// Guarda Preventivo editado
	function updatePredictivos($datos,$id){
	    $this->db->where('predId', $id);
	    $query = $this->db->update("predictivo",$datos);
	    return $query;
	}

	// Update herramientas preventivo
	function deleteHerramPred($id_predictivo){        
		$this->db->where('predId', $id_predictivo);
		$query = $this->db->delete('tbl_predictivoherramientas');
		return $query;
}

function deleteInsumPred($id_predictivo){
		$this->db->where('predId', $id_predictivo);
		$query = $this->db->delete('tbl_predictivoinsumos');
		return $query;
}

	// Cambia predictivo a aestado AN
	function baja_predictivos($datos,$id){
	    $this->db->where('predId', $id);
	    $query = $this->db->update("predictivo",$datos);
	    return $query;
	}
}	

?>