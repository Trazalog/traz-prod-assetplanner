<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Proveedores extends CI_Model {
		
	function __construct()
	{
		parent::__construct();
	}

	function Listado_Proveedores()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$this->db->where('estado', 'AC');
		$this->db->where('abmproveedores.id_empresa', $empresaId);
		$query = $this->db->get('abmproveedores');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Proveedores($id)
	{
		$this->db->where('provid', $id);
		$query = $this->db->get('abmproveedores');
		if ($query->num_rows()!=0)
		{   
			return $query->result_array();  
		}
	}

	function Guardar_Proveedores($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->insert("abmproveedores", $data);
		return $query;
	}
			
	function Modificar_Proveedores($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 
		$query              = $this->db->update('abmproveedores', $data, array('provid' => $data['provid']));
		return $query;
	}

	function Eliminar_Proveedores($data)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('provid', $data);
		$query = $this->db->update('abmproveedores');
		return $query;
	}

}
