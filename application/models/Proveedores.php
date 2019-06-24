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
		
		$this->db->select('alm_proveedores.prov_id AS provid, 
											alm_proveedores.nombre AS provnombre,
											alm_proveedores.cuit AS provcuit,
											alm_proveedores.domicilio AS provdomicilio,
											alm_proveedores.telefono AS provtelefono,
											alm_proveedores.email AS provmail ,
											alm_proveedores.eliminado AS estado');
		$this->db->from('alm_proveedores');
		$this->db->where('eliminado', '0');
		$this->db->where('alm_proveedores.empr_id', $empresaId);
		$query = $this->db->get();
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
	}

	function Guardar_Proveedores($data)
	{
		//$userdata           = $this->session->userdata('user_data');
		//$data['id_empresa'] = $userdata[0]['id_empresa'];
		//$data = $this->map($data);
		$query              = $this->db->insert("alm_proveedores", $data);
		return $query;
	}
			
	function Modificar_Proveedores($id, $data)
	{
		//$id = $data['provid'];
		// $userdata           = $this->session->userdata('user_data');
		// $data['id_empresa'] = $userdata[0]['id_empresa']; 
		// $data = $this->map($data);
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

	
}
