<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Lecturas extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function lectura_List(){

			/*$this->db->select('parametroequipo.*');
			$this->db->from('parametroequipo');
			$this->db->join('parametros', 'parametros.paramId= parametroequipo.paramId');
			$this->db->join('equipos', 'equipos.id_equipo= parametroequipo.id_equipo');
		

			
			$query= $this->db->get();*/
			 $sql="SELECT * 
	    	  FROM parametroequipo
	    	  JOIN parametros ON parametros.paramId=parametroequipo.paramId
	    	  JOIN equipos ON equipos.id_equipo= parametroequipo.id_equipo
	    	  

	    	  ";
	    
	    $query= $this->db->query($sql);
		
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{	
			return false;
		}
	}

	// trae equipos quu tengan parametros asociados y por id de empresa.
	function getEquipo(){
		
		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];
		$this->db->select('DISTINCT(equipos.id_equipo),
											equipos.descripcion');
		$this->db->from('setupparam');
		$this->db->join('equipos', 'equipos.id_equipo = setupparam.id_equipo');
		$this->db->where('equipos.id_empresa', $empId);
		$this->db->where('equipos.estado', 'AC');

		$query = $this->db->get();				
		$i=0;
		foreach ($query->result() as $row){
			$empleadores[$i]['label'] = $row->descripcion;
			$empleadores[$i]['id'] = $row->id_equipo;
			$i++;
		}

		return $empleadores;
	}
	// trae parametros asociados al equipo.
	function getParametrosAsoc($equipoId){	

		$this->db->select('DISTINCT(parametros.paramId),
												parametros.paramdescrip');
		$this->db->from('setupparam');
		$this->db->join('parametros', 'parametros.paramId = setupparam.id_parametro');
		$this->db->where('setupparam.id_equipo', $equipoId);
		$query = $this->db->get();				
		$i=0;
		foreach ($query->result() as $row){
			$parametros[$i]['param'] = $row->paramdescrip;
			$parametros[$i]['id'] = $row->paramId;
			$i++;
		}
		return $parametros;
	}
	// guarda las lecturas de los parametros
	function guardar_lectura($datas2){
		
		$query = $this->db->insert("parametroequipo",$datas2);		
		return $query;		
	}
	// trae lectura por fecha e id de equipo
	function getLecturasCargadas($fechaformateada,$idequipo){
		
		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];	
		
		$fecha = strtotime($fechaformateada);
		$fecha = date("Y-m-d", $fecha);
		
		$this->db->select('parametroequipo.id,	
											parametroequipo.valor,
											parametros.paramdescrip');									
		$this->db->from('parametroequipo');
		$this->db->join('parametros', 'parametros.paramId = parametroequipo.paramId');
		$this->db->where('parametroequipo.id_equipo', $idequipo);
		$this->db->where('DATE(parametroequipo.fechahora)', $fecha);
		$query = $this->db->get();

		return $query->result_array();
	}
	// borra lectura por id de registro en tabla
	function deleteLectura($id){
		$this->db->where('id', $id);
		$result = $this->db->delete('parametroequipo');	
		return  $result;
	}











// 	function getcriticidad(){

// 		$query= $this->db->get_where('criticidad');
// 		if($query->num_rows()>0){
// 							return $query->result();
// 					}
// 					else{
// 							return false;
// 					}
	

// }

// public function insert_lectura($data)
// {
// 		$query = $this->db->insert("parametroequipo",$data);
// 		return $query;
// }

// function getparametros($id){

	
// 	/*$sql= "SELECT *
// 	FROM parametros 
// 	JOIN setupparam ON setupparam.id_parametro=parametros.paramId
// 	WHERE setupparam.id_equipo=$id" ;*/

// 	$sql= "SELECT *
// 	FROM parametros 
// 	JOIN setupparam ON setupparam.id_parametro=parametros.paramId
	
// 	WHERE setupparam.id_equipo=$id   ";

// 	//$this->db->get_where('parametroequipo',array('id'=>$id));
	
// 	$query= $this->db->query($sql);
	
// 	//if($query->num_rows()>0){
// 						return $query->result();
// 				//}
// 				//else{
// 					//  return false;
// 				//}


// }





	// function getequipo(){

		// 	$sql="SELECT * 
		//     	  FROM equipos
		//     	  WHERE equipos.estado='AC'
						

		//     	  ";
				
		//     $query= $this->db->query($sql);
			
		// 	if ($query->num_rows()!=0)
		// 	{
		// 		return $query->result_array();	
		// 	}
		// 	else
		// 	{	
		// 		return false;
		// 	}

		// 			/*$query= $this->db->get_where('equipos');
		// 			if($query->num_rows()>0){
		//                 return $query->result();
		//             }
		//             else{
		//                 return false;
		//             }*/
				

		// }

	
    

	


}	

?>