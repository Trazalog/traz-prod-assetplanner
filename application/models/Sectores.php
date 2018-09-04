<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sectores extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}

	function Listado_Sectores()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$this->db->where('estado', 'AC');
		$this->db->where('sector.id_empresa', $empresaId);
		$query = $this->db->get('sector');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Sectores($id)
	{
		$this->db->where('id_sector', $id);
		$query = $this->db->get('sector');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();  
		}
	}

	function Guardar_Sectores($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 
		$query              = $this->db->insert("sector", $data);
		return $query;
	}

	function Modificar_Sectores($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->update('sector', $data, array('id_sector' => $data['id_sector'])
		);
		return $query;
	}

	function Eliminar_Sectores($id)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('id_sector', $id);
		$query = $this->db->update('sector');
		return $query;
	}

}	
