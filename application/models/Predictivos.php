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
        
    	$this->db->select('predictivo.predId, predictivo.id_equipo,predictivo.tarea_descrip, predictivo.fecha,  predictivo.periodo,  predictivo.cantidad,predictivo.estado, predictivo.horash, equipos.descripcion AS des, equipos.marca, equipos.codigo, equipos.ubicacion, equipos.fecha_ingreso, tareas.descripcion as de1');
    	$this->db->from('predictivo');
    	$this->db->join('equipos','equipos.id_equipo = predictivo.id_equipo');
    	$this->db->join('tareas', 'tareas.id_tarea = predictivo.tarea_descrip');    	
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
	function getTareas(){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
        
    	$this->db->select('tareas.*');
    	$this->db->from('tareas');    	
    	$this->db->where('tareas.id_empresa', $empId);
    	$query= $this->db->get();

		if($query->num_rows()>0){
            return $query->result();
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
	
	// Trae info para edicion de preventivo por id - Listo
    function getInfoprev($ide,$id){
		
	    $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
        
    	$this->db->select('predictivo.id_equipo,
    					   predictivo.predId, 
    					   predictivo.tarea_descrip, 
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
    					   equipos.descripcion');    	
    	$this->db->from('predictivo'); 
    	$this->db->join('equipos', 'equipos.id_equipo=predictivo.id_equipo');   	
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

	// Cambia predictivo a aestado AN
	function baja_predictivos($datos,$id){
	    $this->db->where('predId', $id);
	    $query = $this->db->update("predictivo",$datos);
	    return $query;
	}
}	

?>