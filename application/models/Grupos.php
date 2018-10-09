<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Grupos extends CI_Model {
		
	function __construct()
	{
		parent::__construct();
	}
		
	function Listado_Grupos()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$this->db->where('estado', 'AC');
		$this->db->where('grupo.id_empresa', $empresaId);
		$query = $this->db->get('grupo');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Grupos($id)
	{
		$this->db->where('id_grupo', $id);
		$query = $this->db->get('grupo');
		if ($query->num_rows()!=0)
		{   
			return $query->result_array();  
		}
	}	

	function Guardar_Grupos($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->insert("grupo",$data);
		return $query;
	}

	function Modificar_Grupos($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->update('grupo', $data, array('id_grupo' => $data['id_grupo']));
		return $query;
	}

	function Eliminar_Grupos($id)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('id_grupo', $id);
		$query = $this->db->update('grupo');
		return $query;
	}

}	
