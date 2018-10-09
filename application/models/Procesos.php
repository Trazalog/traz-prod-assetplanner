<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class procesos extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	function Listado_procesos(){

		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];// guarda usuario logueado
	
		$this->db->where('estado', 'AC');
		$this->db->where('proceso.id_empresa', $empId);

 		$query= $this->db->get('proceso');

		if ($query->num_rows()!=0)
		{
		return $query->result_array();	
		}

 	}

	function Obtener_procesos($id){
		
    $this->db->where('id_proceso', $id);
    $query=$this->db->get('proceso');
   
		if ($query->num_rows()!=0)
			{   
				return $query->result_array();  
			}
	}

	function Guardar_procesos($data){

		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa']; 
		$data['id_empresa'] = $empId;

		$query = $this->db->insert("proceso",$data);
        return $query;

	}

	function Modificar_procesos($data){

		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa']; 
		$data['id_empresa'] = $empId;

		$query =$this->db->update('proceso', $data, array('id_proceso' => $data['id_proceso']));
		return $query;
	}

	function Eliminar_procesos($data){
    	
        $this->db->set('estado', 'AN');
		$this->db->where('id_proceso', $data);
		$query=$this->db->update('proceso');
		return $query;

    }
}	

?>