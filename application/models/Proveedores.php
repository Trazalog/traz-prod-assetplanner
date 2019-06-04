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
		$data = $this->map($data);
		$query              = $this->db->insert("alm_proveedores", $data);
		return $query;
	}
			
	function Modificar_Proveedores($data)
	{
		$id = $data['provid'];
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 
		$data = $this->map($data);
		$query = $this->db->update('alm_proveedores', $data, array('prov_id' => $id));
		return $query;
	}

	function Eliminar_Proveedores($data)
	{
		$this->db->set('eliminado', 1);
		$this->db->where('prov_id', $data);
		$query = $this->db->update('alm_proveedores');
		return $query;
	}

	public function map($data)
	{
		return array(
			'nombre'=>   $data['provnombre'],
			'cuit'=>     $data['provcuit'],
			'domicilio'=>$data['provdomicilio'],
			'telefono'=> $data['provtelefono'],
			'email'=>    $data['provmail'],
			'empr_id'=>  $data['id_empresa']
		);
	}

}
