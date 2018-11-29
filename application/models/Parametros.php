<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class parametros extends CI_Model
{

	function __construct()
	{
		parent::__construct();
	}

	function getequipo()
    {
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

	function getparametros($id)
    {
		$sql  = "SELECT *
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

    function traerparametro()
    {
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

	function guardar($data)
    {
        $userdata           = $this->session->userdata('user_data');
        $data['id_empresa'] = $userdata[0]['id_empresa'];
        $query              = $this->db->insert("parametros", $data);
    	return $query;    
    }

    function guardar_todo($data)
    {
        $userdata           = $this->session->userdata('user_data');
        $data['id_empresa'] = $userdata[0]['id_empresa']; 
        $query              = $this->db->insert("setupparam", $data);
    	return $query;    
    }

    function delete_parametro($eq, $dato2)
    {	
    	$sql   = "DELETE FROM setupparam 
            WHERE id_equipo = $eq 
            AND id_parametro = $dato2
            ";
    	$query = $this->db->query($sql);  
	    return $query;
       /* $this->db->where('id_equipo', $idq);
        $query = $this->db->delete("setupparam");
        return $query;*/
    }
    
    function delete_p($idq, $idp)
    {
    	$sql   = "DELETE FROM setupparam 
            WHERE id_equipo = $idq 
            AND id_parametro = $idp";
    	$query = $this->db->query($sql);
	    return $query;
       /* $this->db->where('id_equipo', $idq);
        $query = $this->db->delete("setupparam");
        return $query;*/
    }

    function geteditar($id, $idp)
    {
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

	function editar($id, $idp2)
    {
	    $sql   = "SELECT setupparam.id_equipo, setupparam.id_parametro, setupparam.maximo, setupparam.minimo, 
            equipos.codigo, 
            parametros.paramdescrip
            FROM setupparam
            JOIN equipos ON equipos.id_equipo = setupparam.id_equipo
            JOIN parametros ON parametros.paramId = setupparam.id_parametro
            WHERE setupparam.id_equipo = $id 
            AND setupparam.id_parametro = $idp2
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

    function update_editar($m, $n, $pa, $equ)
    {
    	$sql   = "UPDATE setupparam 
            SET maximo = $m, minimo = $n
    		WHERE id_equipo = $equ 
            AND id_parametro = $pa
            ";
        $query = $this->db->query($sql);
        return $query;
        /* id_equipo=$ide,
    		id_parametro=$pa, 
        $this->db->where('id_equipo' AND 'id_parametro', $ide, $pa);
        $query = $this->db->update("setupparam",$data);
        return $query;*/
	    /* if( $query->num_rows() > 0)
	    {
	      return $query->result_array();	
	    } 
	    else {
	      return 0;
	    }*/
    }




	/*function Listado_setparames(){
		$this->db->select('*');
		$this->db->from('setupparam as A');
		$this->db->join('parametros as B','A.id_parametro = B.paramId');
		$this->db->join('equipos as C','C.id_equipo = A.id_equipo');
		$this->db->where('C.estado','AC');
		$this->db->where('A.id_empresa', 6);
		$query= $this->db->get();
		
			if($query->num_rows()>0){
				

				return $query->result_array();
			}
			else{
				return false;
			}
	}
	 
	function Obtener_setparames($id){
    	$this->db->where('id_parametro', $id);
   		$query=$this->db->get('setupparam');
   
		if ($query->num_rows()!=0)
			{   
				return $query->result_array();  
			}
	}

	function Guardar_setparames($data){

		$data['id_empresa']=6;
		$query = $this->db->insert("setupparam",$data);
		return $query;
	}

	function Modificar_setparames($data){
	
		$query =$this->db->update('setupparam', $data, array('id_parametro' => $data['id_parametro'],'id_equipo' => $data['id_equipo']));
		return $query;
	}

	function Eliminar_setparames($ide,$idp){

		$this->db->where('id_equipo',$ide);
		$this->db->where('id_parametro',$idp);
		$query =$this->db->delete('setupparam');
		return $query;
	}*/

}	
