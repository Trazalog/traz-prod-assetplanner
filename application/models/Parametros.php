<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Parametros extends CI_Model
{

	function __construct()
	{
		parent::__construct();
	}
	// trae equipos por empresa
	function getequipo(){

        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
		$sql       = "SELECT *
			FROM equipos 
			WHERE equipos.estado = 'AC'
            AND equipos.id_empresa = $empresaId 
            ";
		$query     = $this->db->query($sql);
		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
	}
	// trae parametros asociados por id de equipo
	function getparametros($id){
		$sql  = "SELECT setupparam.id_equipo,
						setupparam.id_parametro,
						setupparam.maximo,
						setupparam.minimo,						
						parametros.paramdescrip,
						equipos.descripcion
			FROM setupparam 
			JOIN parametros ON parametros.paramId = setupparam.id_parametro
			JOIN equipos ON equipos.id_equipo = setupparam.id_equipo 
			WHERE equipos.id_equipo = $id 
            AND equipos.estado = 'AC'
            ";
        $query = $this->db->query($sql);
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
	}
	// trae info para editar parametros
	function editar($id_equipo,$id_param){
		$sql   = "SELECT setupparam.id_equipo, setupparam.id_parametro, setupparam.maximo, 						setupparam.minimo,equipos.codigo,parametros.paramdescrip
					FROM setupparam
					JOIN equipos ON equipos.id_equipo = setupparam.id_equipo
					JOIN parametros ON parametros.paramId = setupparam.id_parametro
					WHERE setupparam.id_equipo = $id_equipo 
					AND setupparam.id_parametro = $id_param
					";
		$query = $this->db->query($sql);
		if( $query->num_rows() > 0)
		{
			return $query->result_array();	
		} 
		else {
			return 0;
		}
	}
	// trae info de parametro a editar
	function geteditar($id, $idp){
			$sql="SELECT setupparam.id_equipo, setupparam.id_parametro, setupparam.maximo, setupparam.minimo, 
						equipos.codigo, 
						parametros.paramdescrip
						FROM setupparam
						JOIN equipos ON equipos.id_equipo = setupparam.id_equipo
						JOIN parametros ON parametros.paramId = setupparam.id_parametro
						WHERE setupparam.id_equipo = $id 
						AND setupparam.id_parametro = $idp
						";
			$query = $this->db->query($sql);
			if( $query->num_rows() > 0)
			{
				return $query->result_array();	
			} 
			else {
				return 0;
			}
	}	
	//  actualiza el parametro editado
	function update_editar($m, $n, $pa, $equ){
		$sql   = "UPDATE setupparam SET maximo = $m, minimo = $n
							WHERE id_equipo = $equ 
							AND id_parametro = $pa";
		$query = $this->db->query($sql);
		return $query;			
	}
	// llimina asociacion de parametros
	function elimina_param($ide,$idp){

		$this->db->where('id_equipo',$ide);
		$this->db->where('id_parametro',$idp);
		$query =$this->db->delete('setupparam');
		return $query;
	}
	// guarda asociacion nueva de parametros
	function guardar_todo($data){
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa']; 
		$query              = $this->db->insert("setupparam", $data);
		return $query;    
	}
	// guarda parametro nuevo
	function guardar($data){
		$userdata           = $this->session->userdata('user_data');
		$data['id_empresa'] = $userdata[0]['id_empresa'];
		$data['estado'] = 'AC';
		$query = $this->db->insert("parametros", $data);
		return $query;    
	}
	// trae parametros para asociar
	function traerparametro(){
			$userdata  = $this->session->userdata('user_data');
			$empresaId = $userdata[0]['id_empresa'];
			$query     = $this->db->get_where('parametros', array('id_empresa' => $empresaId));
			if($query->num_rows()>0){
					return $query->result();
			}
			else{
					return false;
			}	
	}
	
}	
