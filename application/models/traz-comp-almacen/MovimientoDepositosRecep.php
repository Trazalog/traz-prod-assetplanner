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
			$empr_id = empresa();
			//$url = 'http://localhost:9132/oeosft/api/rest/esta';
			$url = AJST.'/services/asp/ALMDataService/establecimientos/empresa/'.$empr_id;
      $array = $this->rest->callAPI("GET",$url);
      $resp =  json_decode($array['data']);		
      return $resp->establecimientos->establecimiento;
	}
	//--- Get_depo () lo que hace es traer todos los depositos dado un id de establecimieto -Servicio(falta) ahora se usa suapUI 
	public function Get_depo($id)
	{
			// $url = 'http://localhost:9132/oeosft/api/rest/depodadoidesta';
			$url = AJST.'/services/asp/ALMDataService/establecimiento/'.$id.'/deposito/list';
      $array = $this->rest->callAPI("GET",$url);
      $resp =  json_decode($array['data']);
      return $resp->depositos->deposito;
	}
	public function Get_depo_todos()
	{
			$empr_id = empresa();
			$url = AJST.'/services/asp/ALMDataService/empresa/'.$empr_id.'/deposito/list';
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
	public function Get_Recpciones($id_dest_esta, $id_dest_depo)
	{
		//$url = 'http://localhost:9132/oeosft/api/rest/recepcion';
			$empr_id = empresa();
			$url = AJST.'/services/asp/ALMDataService/movimientosInternos/estado/EN_CURSO/origen/TODOS/destino/'.$id_dest_depo.'/moin_id/TODOS/empresa/'.$empr_id;
      $array = $this->rest->callAPI("GET",$url);
      $resp =  json_decode($array['data']);
      return $resp->movimientosInternos->movimientoInterno;
	}

	function traerLotes($arti_id, $depo_id){

		$url = AJST.'/services/asp/ALMDataService/deposito/'.$depo_id.'/articulo/'.$arti_id.'/lote/list';
		$aux = $this->rest->callAPI("GET",$url);
		$aux =json_decode($aux['data']);
		return $aux->lotes->lote;
	}

	/**
	* Actualiza cabecera de movimiento interno
	* @param array con datos principales
	* @return bool true o false rsultado de servicio
	*/
	function guardarCabecera($cabecera){

		$post['_put_movimientointerno'] = $cabecera;
		log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPOSITOSRECEP|guardarCabecera($cabecera) $post: >> '.json_encode($post));
		$url = AJST.'/services/asp/ALMDataService/movimientoInterno';
		$aux = $this->rest->callAPI("PUT", $url, $post);
		$aux =json_decode($aux["status"]);
		return $aux;
	}

	/**
	* Actualiza lotes (agregando o creandolotes nuevos sino los hay)
	* @param	array con datos de lotes
	* @return bool true o false resultado del servicio
	*/
	function actualizarLotes($lotes)
	{
		$post["_post_lote_agregaractualizar"] = $lotes;
		log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPOSITOSRECEP|actualizarLotes($lotes) $post: >> '.json_encode($post));
		$url = AJST.'/services/asp/ALMDataService/lote/agregarActualizar';
		$aux = $this->rest->callAPI("POST",$url, $post);
		$aux =json_decode($aux["status"]);
		return $aux;
	}

	/**
	* Averigua el lote_id generadoal insertarun movim de deposito
	* @param string $prov_id, $arti_id, $depo_id, $cod_lote
	* @return string lote_id
	*/
	function getLoteIdGenerado($prov_id, $arti_id, $depo_id, $cod_lote){

		$empr_id = empresa();
		$url = AJST.'/services/asp/ALMDataService/lote/id/prov_id/'.$prov_id.'/arti_id/'.$arti_id.'/depo_id/'.$depo_id.'/empr_id/'.$empr_id.'/cod_lote/'.$cod_lote;
		$aux = $this->rest->callAPI("GET",$url);
		$aux =json_decode($aux["data"]);
		return $aux->lote->lote_id;
	}

	/**
	* Actualiza detalle del movimiento interno
	* @param array detalle de movimiento
	* @return bool true o false resultado del servicio
	*/
	function guardarDetalle($detalle){

		$post['_put_movimientointerno_detalle'] = $detalle;
		log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPOSITOSRECEP|guardarDetalle($detalle) $post:  >> '.json_encode($post));
		$url = AJST.'/services/asp/ALMDataService/movimientoInterno/detalle';
		$aux = $this->rest->callAPI("PUT", $url, $post);
		$aux = json_decode($aux["status"]);
		return $aux;
	}
}