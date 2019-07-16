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
		$query = $this->db->get();
		if ($query->num_rows()!=0){
			return $query->result_array();	
		}else{
			return array();
		}
	}
	// TODO: entender si se usa o no este metodo
	function detaPlantilla(){ 

		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa'];
		 $this->db->select('asp_detaplantillainsumos.*,
											 asp_plantillainsumos.descripcion,
											 asp_plantillainsumos.plant_nombre,
											articles.artDescription');
		$this->db->from('asp_detaplantillainsumos');
		$this->db->join('asp_plantillainsumos', 'asp_plantillainsumos.plant_id = asp_detaplantillainsumos.plant_id');
		$this->db->join('articles', 'articles.artId = asp_detaplantillainsumos.artId');
		$this->db->where('asp_plantillainsumos.id_empresa', $empId);
		
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

	//  	function agregar_tareas($arre) {

	//     $query = $this->db->insert("tbl_listplantilla",$arre);
	//     return $query;
	// }

	// function ObtenerTareas(){
	// 	$query = $this->db->get("tareas");
	// 	return $query->result_array();

	// }




 	// function EliminarTareas($id){
    	
  //       $this->db->where('id_detaplantilla', $id);
  //       $this->db->delete('tbl_listplantilla');
  //       if ($this->db->affected_rows() > 0) {
	// 		return true;
	// 	}
	// 	else{
	// 		return false;
	// 	}

  //   }


  //   function cargartareas($idglog){  

	// 	$this->db->select();
	// 	$this->db->from('tbl_listplantilla as A');	
	// 	$this->db->join('tareas as B',"A.id_tarea=B.id_tarea");	
	// 	$this->db->where('A.id_plantilla', $idglog);		
	// 	$query= $this->db->get();
		
	// 	if ($query->num_rows()!=0)
	// 	{
	// 		return $query->result_array();	
	// 		print_r($query->result_array());
	// 	}
	// 	else
	// 	{	
	// 		return false;
	// 	}
  //   }


	// function getplantilla($data = null)
	// {
	// 	if($data == null)
	// 	{
	// 		return false;
	// 	}
	// 	else
	// 	{
	// 		$action = $data['act'];
	// 		$idplantilla = $data['id'];

	// 		$data = array();

	// 		//Datos de la plantilla
	// 		$query= $this->db->get_where('plantilla',array('id_plantilla'=>$idplantilla));
	// 		if ($query->num_rows() != 0)
	// 		{

	// 			$f = $query->result_array();
	// 			$data['plantilla'] = $f[0];
	// 		} else {
	// 			$plantilla = array();
	// 			$plantilla['id_plantilla'] = '';
	// 			$plantilla['descripcion'] = '';
	// 			$data['plantilla'] = $plantilla;
	// 		}

	// 		//Readonly
	// 		$readonly = false;
	// 		if($action == 'Del' || $action == 'View'){
	// 			$readonly = true;
	// 		}
	// 		$data['read'] = $readonly;

	// 		return $data;
	// 	}
	// }
	
	// function setplantilla($data = null)
	// {
	// 	if($data == null)
	// 	{
	// 		return false;
	// 	}
	// 	else
	// 	{
	// 		$id = $data['id'];
	// 		$name = $data['name'];
			
			
	// 		$act = $data['act'];

	// 		$data = array(
	// 				   'descripcion' => $name,
	// 				);

	// 		switch($act)
	// 		{
	// 			case 'Add':
	// 				//Agregar Plantilla
	// 				if($this->db->insert('plantilla', $data) == false) {
	// 					return false;
	// 				}
	// 				break;

	// 			case 'Edit':
	// 				//Actualizar nombre
	// 				if($this->db->update('plantilla', $data, array('id_plantilla'=>$id)) == false) {
	// 					return false;
	// 				}
	// 				break;

	// 			case 'Del':
	// 				//Eliminar Plantilla
	// 				if($this->db->delete('plantilla', $data, array('id_plantilla'=>$id)) == false) {
	// 					return false;
	// 				}
					
	// 				break;
	// 		}

	// 		return true;

	// 	}
	// }

}	

?>