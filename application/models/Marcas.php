<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Marcas extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}

	function Listado_Marcas()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$this->db->where('estado', 'AC');
		$this->db->where('id_empresa', $empresaId);	
		$query = $this->db->get('marcasequipos');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}


	function Obtener_Marcas($id)
	{
		$this->db->where('marcaid', $id);
		$query = $this->db->get('marcasequipos');
		if ($query->num_rows()!=0)
		{   
			return $query->result_array();  
		}
	}

	function Guardar_Marcas($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->insert("marcasequipos", $data);
		return $query;
	}

	function Modificar_Marcas($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->update('marcasequipos', $data, array('marcaid' => $data['marcaid']));
		return $query;
	}


	function Eliminar_Marcas($data)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('marcaid', $data);
		$query = $this->db->update('marcasequipos');
		return $query;
	}
}	
