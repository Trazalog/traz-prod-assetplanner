<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Backlogs extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	// Trae listado de backlogs - Listo
	function backlog_List(){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
          
	    $this->db->select('tbl_back.backId, 
												tbl_back.id_equipo,
												tbl_back.tarea_descrip, 
												tbl_back.fecha, 
												tbl_back.estado,
												tbl_back.back_duracion, 
												tbl_back.back_adjunto,
												equipos.descripcion AS des, 
												equipos.marca, equipos.codigo, 
												equipos.ubicacion, 
												equipos.fecha_ingreso, 
												tareas.id_tarea, 
												tareas.descripcion as de1,
												componentes.descripcion AS componente,
												sistema.descripcion as sistema');	 
	    $this->db->from('tbl_back'); 
	    $this->db->join('equipos', 'equipos.id_equipo = tbl_back.id_equipo');
	    $this->db->join('tareas', 'tareas.id_tarea = tbl_back.tarea_descrip');
        $this->db->join('componenteequipo', 'componenteequipo.idcomponenteequipo = tbl_back.idcomponenteequipo');
        $this->db->join('componentes', 'componentes.id_componente = componenteequipo.id_componente');
        $this->db->join('sistema', 'sistema.sistemaid = componenteequipo.sistemaid');
	    $this->db->where('tbl_back.id_empresa', $empId);
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

	// Trae equipos para llenar select vista por empresa logueada - Listo
	function getequipo(){
			
	    $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
        
    	$this->db->select('equipos.*');
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

	// Trae info de equipo por id - Listo
	function getInfoEquipos($data = null){

		if($data == null)
		{
			return false;
		}
		else
		{			
			$id_equipo = $data['id_equipo'];
			//Datos del usuario
			$query= $this->db->get_where('equipos',array('id_equipo'=>$id_equipo));
			if($query->num_rows()>0){
					return $query->result();
			}
			else{
					return false;
			}			
		}
	}

	// Trae tareas por empresa logueada - Listo
	function gettareas(){

		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa']; 

		$query= $this->db->get_where('tareas', array('id_empresa' => $empId));
		
		if($query->num_rows()>0){
				return $query->result();
		}
		else{
				return false;
		}			
	}

	//Inserta  Backlog nuevo - Listo
	function insert_backlog($data)
	{
		$query = $this->db->insert("tbl_back",$data);
		return $query;
	}  

	// Guarda el bacht de datos de herramientas de Preventivo - Listo
	function insertBackHerram($herram){
		dump($herram, 'herramientas en model: ');
		$query = $this->db->insert_batch("tbl_backlogherramientas",$herram);
		return $query;
	}

	// Guarda insumos del Preventivo - Listo 
	function insertBackInsum($insumo){

		$query = $this->db->insert_batch("tbl_backloginsumos",$insumo);
		return $query;
	}

	// Guarda el nombre de adjunto
	function updateAdjunto($adjunto,$ultimoId){
		$this->db->where('backId', $ultimoId);
		$query = $this->db->update("tbl_back",$adjunto);
		return $query;
	}

	// Trae datos de backlog para editar
	function geteditar($id){

		$this->db->select('tbl_back.*');	
		$this->db->from('tbl_back');
		$this->db->where('tbl_back.backId',$id);	    
		$query= $this->db->get();
		
		if( $query->num_rows() > 0)
		{
			return $query->result_array();	
		} 
		else {
			return 0;
		}
	}

	// Trae datos de equipo del backlog para editar
	function traerequiposprev($ide,$id){

	    $this->db->select('tbl_back.backId, 
	    				   tbl_back.id_equipo,
	    				   tbl_back.tarea_descrip, 
	    				   tbl_back.fecha, 
	    				   tbl_back.estado,
	    				   tbl_back.horash, 
	    				   equipos.descripcion AS des, 
	    				   equipos.marca, 
	    				   equipos.codigo, 
	    				   equipos.ubicacion, 
	    				   equipos.fecha_ingreso, 
	    				   tareas.id_tarea, 
	    				   tareas.descripcion as de1,
                           componenteequipo.codigo as codcompeq,
                           componentes.descripcion as componente,
                           sistema.descripcion as sistema');
	    $this->db->from('tbl_back');
	    $this->db->join('equipos', 'equipos.id_equipo = tbl_back.id_equipo');
        $this->db->join('tareas', 'tareas.id_tarea = tbl_back.tarea_descrip');
	    $this->db->join('componenteequipo', 'componenteequipo.idcomponenteequipo = tbl_back.idcomponenteequipo');
        $this->db->join('componentes', 'componentes.id_componente = componenteequipo.id_componente');
        $this->db->join('sistema', 'sistema.sistemaid = componenteequipo.sistemaid');
	    $this->db->where('tbl_back.backId', $id);
	    $this->db->where('tbl_back.id_equipo', $ide);
	    $query = $this->db->get();
	    
	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();	
	    } 
	    else {
	      return 0;
	    }
	}

	// Anula backlog por ID - Listo
	function update_back($data,$id){
	    $this->db->where('backId', $id);
	    $query = $this->db->update("tbl_back",$data);
	    return $query;
	}
  	
  	// Actualiza edicion de Backlog
 	function editar_backlogs($datos,$id_back){
 		$this->db->where('backId', $id_back);
	    $query = $this->db->update("tbl_back",$datos);
	    return $query;
 	}

 	function getComponentes($idEquipo)
 	{
 		$userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('componenteequipo.idcomponenteequipo AS idce, componenteequipo.codigo, componentes.descripcion, sistema.descripcion AS sistema');
        $this->db->from('componenteequipo');
        $this->db->join('componentes', 'componentes.id_componente = componenteequipo.id_componente');
        $this->db->join('sistema', 'sistema.sistemaid = componenteequipo.sistemaid');
        if($idEquipo!="") {
        	$this->db->where('componenteequipo.id_equipo', $idEquipo);	
        }
        $this->db->where('componenteequipo.id_empresa', $empresaId);
        $this->db->where('componenteequipo.estado !=', 'AN');
        $this->db->order_by('componenteequipo.codigo');
        $query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else
        {
            return false;
        }     
 	}
}	
