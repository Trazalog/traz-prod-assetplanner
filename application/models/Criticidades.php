<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class criticidades extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	function Listado_criticidades(){

		$userdata = $this->session->userdata('user_data');
		$empId = 6;//variable de prueba despues borrar
		  //$empId = $userdata[0]['id_empresa'];// guarda usuario logueado
	
		$this->db->where('estado', 'AC');
		$this->db->where('criticidad.id_empresa', $empId);

		$query= $this->db->get('criticidad');

		if ($query->num_rows()!=0)
		{
		return $query->result_array();	
		}

	}
	function Obtener_criticidades($id){

		$this->db->where('id_criti', $id);
		$query=$this->db->get('criticidad');
	
		if ($query->num_rows()!=0)
			{   
				return $query->result_array();  
			}
	}

	function Guardar_criticidades($data){

		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa']; 
		$data['id_empresa'] = $empId;

		$query = $this->db->insert("criticidad",$data);
		return $query;
	}

	function Modificar_criticidades($data){

		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa']; 
		$data['id_empresa'] = $empId;

		$query =$this->db->update('criticidad', $data, array('id_criti' => $data['id_criti']));
		return $query;
	}

	function Eliminar_criticidades($data){
    	
        $this->db->set('estado', 'AN');
		$this->db->where('id_criti', $data);
		$query=$this->db->update('criticidad');
		return $query;

    }
}	

?>