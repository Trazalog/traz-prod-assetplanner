<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Familys extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}

	function Listado_Familys()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$this->db->where('estado', 'AC');
		$this->db->where('id_empresa', $empresaId);
		$query = $this->db->get('conffamily');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Familys($id)
	{
		$this->db->where('famId', $id);
		$query = $this->db->get('conffamily');
		if ($query->num_rows()!=0)
		{   
			return $query->result_array();  
		}
	}

	function Guardar_Familys($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 
		$query              = $this->db->insert("conffamily",$data);
		return $query;
	}

	function Modificar_Familys($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 
		$query              = $this->db->update('conffamily', $data, array('famId' => $data['famId']));
		return $query;
	}

	function Eliminar_Familys($data)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('famId', $data);
		$query = $this->db->update('conffamily');
		return $query;
	}
	
}	
