<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Contratistas extends CI_Model {
		
	function __construct()
	{
		parent::__construct();
	}

	function Listado_Contratistas()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$this->db->where('estado', 'AC');
		$this->db->where('contratistas.id_empresa', $empresaId);
		$query = $this->db->get('contratistas');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Contratistas($id)
	{
		$this->db->where('id_contratista', $id);
		$query = $this->db->get('contratistas');
		if ($query->num_rows()!=0)
		{   
			return $query->result_array();  
		}
	}

	function Guardar_Contratistas($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->insert("contratistas",$data);
		return $query;
	}

	function Modificar_Contratistas($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 
		$query              = $this->db->update('contratistas', $data, array('id_contratista' => $data['id_contratista']));
		return $query;
	}

	function Eliminar_Contratistas($id)
	{	    	
		$this->db->set('estado', 'AN');
		$this->db->where('id_contratista', $id);
		$query=$this->db->update('contratistas');
		return $query;
	}

}	
