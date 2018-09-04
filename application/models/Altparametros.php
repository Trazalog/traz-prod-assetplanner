<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Altparametros extends CI_Model{

	function __construct()
	{
		parent::__construct();
	}

	function Listado_Altparametros()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$this->db->where('estado', 'AC');
		$this->db->where('parametros.id_empresa', $empresaId);
		$query = $this->db->get('parametros');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Obtener_Altparametros($id)
	{
		$this->db->where('paramId', $id);
		$query = $this->db->get('parametros');
		if ($query->num_rows()!=0)
		{   
			return $query->result_array();  
		}
	}

	function Guardar_Altparametros($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];	
		$query              = $this->db->insert("parametros",$data);
		return $query;
	}

	function Modificar_Altparametros($data)
	{
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$query              = $this->db->update('parametros', $data, array('paramId' => $data['paramId']));
		return $query;
	}

	function Eliminar_Altparametros($data)
	{
		$this->db->set('estado', 'AN');
		$this->db->where('paramId', $data);
		$query = $this->db->update('parametros');
		return $query;
	}
}	

?>