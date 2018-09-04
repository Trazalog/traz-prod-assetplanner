<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tareas extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}

	function Listado_Tareas()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$this->db->where('estado', 'AC');
		$this->db->where('tareas.id_empresa', $empresaId);
		$query = $this->db->get('tareas');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Tareas($id)
	{
		$this->db->where('id_tarea', $id);
		$query = $this->db->get('tareas');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();  
		}
	}

	function Guardar_Tareas($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 	
		$query              = $this->db->insert("tareas", $data);
		return $query;
	}

	function Modificar_Tareas($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 	
		$query              =$this->db->update('tareas', $data, array('id_tarea' => $data['id_tarea']));
		return $query;
	}

	function Eliminar_Tareas($id)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('id_tarea', $id);
		$query=$this->db->update('tareas');
		return $query;
	}

}
