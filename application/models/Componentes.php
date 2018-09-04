<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Componentes extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	// Trae listado de componentes por empresa logueada - Listo
	function componentes_List(){
	 
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];    

	 	$this->db->select('equipos.id_equipo, 
	 					equipos.codigo, 
	 					equipos.descripcion, 
	 					componentes.id_componente, 
	 					componentes.descripcion AS descomp, 
	 					componenteequipo.estado');
    	
    	$this->db->from('equipos');
    	$this->db->join('componenteequipo', 'componenteequipo.id_equipo = equipos.id_equipo');
    	$this->db->join('componentes', 'componentes.id_componente=componenteequipo.id_componente');
    	$this->db->where('componentes.id_empresa', $empId);
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

	// Trae equipos segun empresa logueada - Listo
	function traerequipo(){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];    

	 	$this->db->select('equipos.*');
	 	$this->db->from('equipos');
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

    // Devuelve descripcion de equipo segun id 
	function getequipo($id){

        $query= $this->db->get_where('equipos',$id);
	    foreach ($query->result() as $row){	
	       $data['descripcion'] = $row['descripcion']; 
	       return $data; 
		}		
	}

	// Trae marcas para modal agregar componente - Chequeado
	function getmarca(){

		$query= $this->db->get_where('marcasequipos');
		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }	
	}	

	// Trae componentes segun empresa (no equipos)
	function getcomponente(){
		
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
		
        $this->db->select('componentes.*');    	
    	$this->db->from('componentes');
		$this->db->where('componentes.id_empresa', $empId); 
	 	$query= $this->db->get();  
		
		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }	
	}
	
	// Agrega componente nuevo - Listo
	function agregar_componente($insert)
    {
        $userdata             = $this->session->userdata('user_data');
        $insert['id_empresa'] = $userdata[0]['id_empresa'];                 
        $query = $this->db->insert("componentes", $insert);
    	return $query;    
    }

    // Asocia equipo/componente - Listo
	function insert_componente($data2)
    {
        $userdata            = $this->session->userdata('user_data');
        $data2['id_empresa'] = $userdata[0]['id_empresa'];  
        $query = $this->db->insert("componenteequipo", $data2);
        return $query;
    }

    // Devuelve componentes asociados a un equipo
    function getcompo($id)
    {
		$this->db->select('equipos.id_equipo, 
				equipos.descripcion, 
				componentes.descripcion AS dee11, 
				componenteequipo.id_componente');
    	$this->db->from('equipos');
    	$this->db->join('componenteequipo', 'componenteequipo.id_equipo = equipos.id_equipo');
    	$this->db->join('componentes', 'componentes.id_componente=componenteequipo.id_componente');
    	$this->db->where('componenteequipo.id_equipo', $id);
    	$this->db->where('componenteequipo.estado', 'AC');
    	$query = $this->db->get();   
		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }		
	}
  
	// guarda path de pdf subido
	function updatecomp($ultimoId, $update)
    {
        $this->db->where('id_componente', $ultimoId);
        $query = $this->db->update("componentes", $update);
        return $query;
    }

    // Camba estado de la asociacion equipo/componente
    function delete_asociacion($idequip,$idcomp)
    {
      	$update = array('estado' => 'AN' );
		$this->db->where('id_componente', $idcomp);
		$this->db->where('id_equipo', $idequip);
        $query = $this->db->update("componenteequipo", $update);
        return $query;		
    }	

}	
