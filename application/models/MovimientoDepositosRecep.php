<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MovimientoDepositosRecep extends CI_Model {

	function __construct()
	{
		parent::__construct();
    }

    //FUNCIONES DE LA PANTALLA SALIDA DEPOSITO - MIGRAR LUEGO A ALMACENES
	//--- Get_Esta () lo que hace es trear todos los establecimientos para listarlos - servicio(falta) ahora se usa soapUI
	public function Get_Esta()
    {
      $url = 'http://localhost:9132/oeosft/api/rest/esta';
      $array = $this->rest->callAPI("GET",$url); 
      $resp =  json_decode($array['data']);		
      return $resp->establecimientos->establecimiento;	
	}
	//--- Get_depo () lo que hace es traer todos los depositos dado un id de establecimieto -Servicio(falta) ahora se usa suapUI 
	public function Get_depo($id)
	{
	  $url = 'http://localhost:9132/oeosft/api/rest/depodadoidesta';
      $array = $this->rest->callAPI("GET",$url); 
      $resp =  json_decode($array['data']);		
      return $resp->depositos->deposito;
	}
	public function Get_depo_todos()
	{
	  $url = 'http://localhost:9132/oeosft/api/rest/depodadoidesta';
      $array = $this->rest->callAPI("GET",$url); 
      $resp =  json_decode($array['data']);		
      return $resp->depositos->deposito;
	}
	public function Get_unidades()
	{
		$this->db->select('T.id_unidadmedida as idun, T.descripcion as desc');
		$this->db->from('tbl_unidadmedida T');
		$query = $this->db->get();	
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{	
			return array();
		}
	}
	//FIN FUNCION SAL DEPO
	public function Get_Recpciones()
	{
	  $url = 'http://localhost:9132/oeosft/api/rest/recepcion';
      $array = $this->rest->callAPI("GET",$url); 
      $resp =  json_decode($array['data']);		
      return $resp->Recepciones->recepcion;
	}
    
}