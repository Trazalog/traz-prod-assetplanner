<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
		
class Depositos extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}

	function Listado_Depositos()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		
		$this->db->where('estado', 'AC');
		$this->db->where('alm_depositos.empr_id', $empresaId);
		$query = $this->db->get('alm_depositos');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Depositos($id)
	{
		$this->db->where('depo_id', $id);
		$query = $this->db->get('alm_depositos');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();  
		}
	}
	// Guard deposito nuevo
	function Guardar_Depositos($data)	{		
	
		$query = $this->db->insert("alm_depositos", $data);
		return $query;
	}
	// guarda deposito editado
	function Modificar_Depositos($data){		
	
		$this->db->where('depo_id', $data['depo_id']);
		$query = $this->db->update('alm_depositos', $data);
		return $query;
	}

	function Eliminar_Depositos($id)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('depo_id', $id);
		$query = $this->db->update('alm_depositos');
		return $query;
	}

	// devuelve provincias para llenar select
	function getProvincias(){
		$this->db->select('provincias.*');
		$this->db->from('provincias');
		$result = $this->db->get();    
		//dump_exit($this->db->last_query());
		if($result->num_rows()>0){
				return $result->result_array();
		}
		else{
				return false;
		}
	}
	//Devuelve departamentos por id
	function getLocalidadPorIds($id){
		$this->db->select('localidades.*');
		$this->db->from('localidades');
		$this->db->join('provincias', 'provincias.id = localidades.id_privincia');
		$this->db->where('provincias.id',$id);
		$result = $this->db->get();    

		if($result->num_rows()>0){
				return $result->result_array();
		}
		else{
				return false;
		}
}

}	
