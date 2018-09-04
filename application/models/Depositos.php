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
		$this->db->where('abmdeposito.id_empresa', $empresaId);
		$query = $this->db->get('abmdeposito');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Depositos($id)
	{
		$this->db->where('depositoId', $id);
		$query = $this->db->get('abmdeposito');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();  
		}
	}

	function Guardar_Depositos($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->insert("abmdeposito", $data);
		return $query;
	}

	function Modificar_Depositos($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->update('abmdeposito', $data, array('depositoId' => $data['depositoId']));
		return $query;
	}

	function Eliminar_Depositos($id)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('depositoId', $id);
		$query = $this->db->update('abmdeposito');
		return $query;
	}

}	
