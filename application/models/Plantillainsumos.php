<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Plantillainsumos extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	function plantillaList(){

		$this->db->select('asp_plantillainsumos.*');
		$this->db->from('asp_plantillainsumos');
		$this->db->where('asp_plantillainsumos.estado !=', 'AN');
		$query = $this->db->get();
		if ($query->num_rows()!=0){
			return $query->result_array();	
		}else{
			return array();
		}
	}
	
	function getArticulos(){
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];	
		
		$query = $this->db->query("SELECT articles.artId, articles.artBarCode,articles.artDescription FROM articles");
    $i     = 0;
    foreach ($query->result() as $row){
      $insumos[$i]['value']       = $row->artId;
      $insumos[$i]['label']       = $row->artBarCode;
      $insumos[$i]['descripcion'] = $row->artDescription;
      $i++;
    }
    return $insumos;
	}
	// guarda encabezado de plantilla
	function setPlantilla($plantCabecera){
		$this->db->insert('asp_plantillainsumos', $plantCabecera);
		$id = $this->db->insert_id();
		return $id;
	}
	// guarda detalle de plantilla
	function setDetaPantilla($detaplantilla){
		$response = $this->db->insert_batch('asp_detaplantillainsumos', $detaplantilla);
		return $response;
	}
	// devuelve plantilla por ID
	function getDetaPlantilla($idplantilla){
		//dump($idplantilla,'id pantilla en modelo');
		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa'];
	 	$this->db->select('asp_detaplantillainsumos.*,
											articles.artDescription,
											articles.artBarCode,
											asp_plantillainsumos.descripcion,
											asp_plantillainsumos.plant_nombre');
		$this->db->from('asp_detaplantillainsumos');
		$this->db->join('asp_plantillainsumos', 'asp_plantillainsumos.plant_id = asp_detaplantillainsumos.plant_id', 'left');
		$this->db->join('articles', 'asp_detaplantillainsumos.artId = articles.artId', 'left');
		$this->db->where('asp_plantillainsumos.plant_id', $idplantilla);
		$this->db->where('asp_plantillainsumos.id_empresa', $empId);		
		$query = $this->db->get();
		//dump($this->db->last_query());
		if ($query->num_rows()!=0){
			return $query->result_array();	
		}else{
			return array();
		}
	}
	// elimina cabecera de plantilla por ID
	function deletePlantilla($idplantilla){

		$this->db->set('estado', 'AN');
		$this->db->where('asp_plantillainsumos.plant_id', $idplantilla);
		$response = $this->db->update('asp_plantillainsumos');	
		return $response;
	}
	// update cabecera plantilla
	function updatePlantilla($plantCabecera, $idPlantilla){
		
		$this->db->where('asp_plantillainsumos.plant_id', $idPlantilla);
		$response = $this->db->update('asp_plantillainsumos', $plantCabecera);	

		return $response;
	}
	// elimina detalle de plantilla por ID
	function deleteDetaPlantilla($idPlantilla){
		$this->db->where('asp_detaplantillainsumos.plant_id', $idPlantilla);
		$response = $this->db->delete('asp_detaplantillainsumos');	

		return $response;
	}


}	

?>