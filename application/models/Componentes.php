<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Componentes extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	//
	function listadoABM()
	{
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa'];

			$this->db->select('componentes.id_componente, componentes.descripcion, componentes.informacion, componentes.marcaid, componentes.pdf,
					marcasequipos.marcaid, marcasequipos.marcadescrip');
			$this->db->from('componentes');
			$this->db->join('marcasequipos', 'componentes.marcaid = marcasequipos.marcaid');
			$this->db->where('componentes.id_empresa', $empId);
			$this->db->where('componentes.estado', 'AC');
			$this->db->where('marcasequipos.estado', 'AC');				
			$query= $this->db->get();   

			if ($query->num_rows()!=0)
			{
					return $query->result_array();
			}
			else
			{
					return false;
			}
	}

	// Trae listado de componentes por empresa logueada - Listo
	function componentes_List(){
	 
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];    

	 	$this->db->select('equipos.id_equipo, 
												equipos.codigo, 
												equipos.descripcion, 
												componentes.id_componente, 
                        componentes.descripcion AS descomp,
                        componentes.pdf,  
                        sistema.descripcion AS sistema,
                        componenteequipo.idcomponenteequipo,
                        componenteequipo.estado,
                        componenteequipo.codigo AS codcomponente');
    	$this->db->from('equipos');
    	$this->db->join('componenteequipo', 'componenteequipo.id_equipo = equipos.id_equipo');
    	$this->db->join('componentes', 'componentes.id_componente=componenteequipo.id_componente');
        $this->db->join('sistema', 'componenteequipo.sistemaid = sistema.sistemaid');
    	$this->db->where('componentes.id_empresa', $empId);
    	$query= $this->db->get();   
		
		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	// Trae equipos segun empresa logueada - Listo
	function traerequipo()
  {
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];    

	 	$this->db->select('equipos.*');
	 	$this->db->from('equipos');
	 	
		// $this->db->join('grupo', 'grupo.id_grupo=equipos.id_grupo');
		// $this->db->join('sector', 'sector.id_sector=equipos.id_sector');
		// $this->db->join('empresas', 'empresas.id_empresa=equipos.id_empresa');
		// $this->db->join('unidad_industrial', 'unidad_industrial.id_unidad=equipos.id_unidad');
		// $this->db->join('criticidad', 'criticidad.id_criti=equipos.id_criticidad');
		// $this->db->join('area', 'area.id_area=equipos.id_area');
		// $this->db->join('proceso', 'proceso.id_proceso=equipos.id_proceso');
		// $this->db->join('admcustomers', 'admcustomers.cliId=equipos.id_customer');
		$this->db->where('equipos.estado !=', 'AN');
		$this->db->where('equipos.id_empresa', $empId);
		$this->db->order_by('equipos.id_equipo', 'ASC');

        /*$this->db->where('equipos.id_empresa', $empId);
        $this->db->order_by('equipos.codigo');*/
	 	$query= $this->db->get();   
		
		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

  // Devuelve descripcion de equipo segun id 
	function getequipo($id)
    {
        $query= $this->db->get_where('equipos',$id);
	    foreach ($query->result() as $row){	
	       $data['descripcion'] = $row['descripcion']; 
	       return $data; 
		}		
	}

	// Trae marcas para modal agregar componente - Chequeado
	function getmarca()
  {
		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];    

		$this->db->select('marcasequipos.*');
		$this->db->from('marcasequipos');
		$this->db->where('marcasequipos.id_empresa', $empId);
		$this->db->where('marcasequipos.estado !=', 'AN');
		$this->db->order_by('marcasequipos.marcadescrip');
		$query= $this->db->get();
		if($query->num_rows()>0){
			return $query->result();
		}
		else{
			return false;
		}	
	}	

 
	// Trae componentes segun empresa (no equipos)
	function getcomponente(){	
		$userdata = $this->session->userdata('user_data');
		$empId    = $userdata[0]['id_empresa'];

		$this->db->select('CONCAT(descripcion,\' - \',marcadescrip,\' - \', informacion) AS label, 
											id_componente AS value', FALSE);    	
		$this->db->from('componentes');
		$this->db->join('marcasequipos', 'componentes.marcaid=marcasequipos.marcaid');
		$this->db->where('componentes.id_empresa', $empId);
		$this->db->where('componentes.estado !=', 'AN');
		$this->db->order_by('label', 'ASC');
		$query = $this->db->get();
		
		if($query->num_rows()>0){
			return $query->result_array(); 
		}
		else{
			return array();
		} 
		
	}
    
	// Trae componentes segun empresa (no equipos)
	function getsistema()
	{   
			$userdata = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];
			$this->db->select('sistema.*');     
			$this->db->from('sistema');
			$this->db->where('sistema.id_empresa', $empId);
			$this->db->where('sistema.estado', 'AC');
			$this->db->order_by('descripcion');
			$query = $this->db->get();
			if($query->num_rows()>0){
					return $query->result();
			}
			else{
					return false;
			}   
	}
	

	// Agrega componente nuevo - Listo
	function agregar_componente($insert){
		
		$userdata             = $this->session->userdata('user_data');
		$insert['id_empresa'] = $userdata[0]['id_empresa'];                 
		$query = $this->db->insert("componentes", $insert);
		return $query;    
	}

  // Asocia equipo/componente - Listo
	function insert_componente($data2)
	{
			$userdata            = $this->session->userdata('user_data');
			$data2['id_empresa'] = $userdata[0]['id_empresa'];  
			$query = $this->db->insert("componenteequipo", $data2);
			return $query;
	}

	// Devuelve componentes asociados a un equipo
	function getcompo($id){

			$sql= "SELECT equipos.id_equipo, equipos.descripcion, marcasequipos.marcadescrip, 
			componentes.descripcion AS dee11, componentes.informacion, componenteequipo.id_componente
			FROM equipos			
			LEFT JOIN componenteequipo ON componenteequipo.id_equipo = equipos.id_equipo 
			AND componenteequipo.estado = 'AC'			
			LEFT JOIN componentes ON componentes.id_componente=componenteequipo.id_componente
			LEFT JOIN marcasequipos ON componentes.marcaid=marcasequipos.marcaid
			WHERE equipos.id_equipo = $id
			ORDER BY dee11";

			$query = $this->db->query($sql);   

			if($query->num_rows()>0){
					return $query->result();
			}
			else{
					return false;
			}		
	}
  
	// guarda path de pdf subido
	function updatecomp($ultimoId, $update)
	{
			$this->db->where('id_componente', $ultimoId);
			$query = $this->db->update("componentes", $update);
			return $query;
	}

	// Camba estado de la asociacion equipo/componente
	function delete_asociacion($idequip,$idcomp)
	{
			$update = array('estado' => 'AN' );
	$this->db->where('id_componente', $idcomp);
	$this->db->where('id_equipo', $idequip);
			$query = $this->db->update("componenteequipo", $update);
			return $query;		
	}	


	function getEditar($idCompEq)
	{
			$userdata = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];

			$this->db->select('componenteequipo.idcomponenteequipo, componenteequipo.id_equipo, componenteequipo.id_componente, componenteequipo.codigo, 
					equipos.codigo as codigoEq, equipos.descripcion');
			$this->db->from('componenteequipo');
			$this->db->join('equipos', 'componenteequipo.id_equipo = equipos.id_equipo');
			$this->db->where('componenteequipo.estado', 'AC');
			$this->db->where('componenteequipo.id_empresa', $empId);
			$this->db->where('componenteequipo.idcomponenteequipo', $idCompEq);
			$query = $this->db->get();   
			if($query->num_rows()>0){
					return $query->result();
			}
			else{
					return false;
			}       
	}

	function updateEditar($data, $id)
	{
			$this->db->where('idcomponenteequipo', $id);
			$query = $this->db->update("componenteequipo",$data);
			return $query;
	}   

	//
	function bajaComponente($idcomp) // Ok
	{
			$update = array('estado' => 'AN' );
			$this->db->where('id_componente', $idcomp);
			$query = $this->db->update("componentes", $update);
			return $query;
	}

	//
	function editarComponente($datos,$idComponente) // Ok
	{
			//dump($datos);
			//dump_exit($idComponente);
			$this->db->where('id_componente', $idComponente);
			$query = $this->db->update('componentes', $datos);
			
			return $query;
	}
}	
