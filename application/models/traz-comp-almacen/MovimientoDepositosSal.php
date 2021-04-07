<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MovimientoDepositosSal extends CI_Model {

	function __construct()
	{
		parent::__construct();
  }

  //FUNCIONES DE LA PANTALLA SALIDA DEPOSITO - MIGRAR LUEGO A ALMACENES
	//--- Get_Esta () lo que hace es trear todos los establecimientos para listarlos - servicio(falta) ahora se usa soapUI
	public function Get_Esta()
  {
			$empr_id = empresa();
			$url = AJST.'/services/asp/ALMDataService/establecimientos/empresa/'.$empr_id;
      $array = $this->rest->callAPI("GET",$url);
      $resp =  json_decode($array['data']);
      return $resp->establecimientos->establecimiento;
	}
	//--- Get_depo () lo que hace es traer todos los depositos dado un id de establecimieto -Servicio(falta) ahora se usa suapUI
	public function Get_depo($id)
	{
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

	function traerLotes($arti_id, $depo_id){

		$url = AJST.'/services/asp/ALMDataService/deposito/'.$depo_id.'/articulo/'.$arti_id.'/lote/list';
		$aux = $this->rest->callAPI("GET",$url);
		$aux =json_decode($aux['data']);
		return $aux->lotes->lote;
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

	/**
	* Guarda cabecera moviemiento depposito
	* @param array detalle cabecera
	* @return bool id de movimiento deposito
	*/
	function guardarCabecera($cabecera){

		log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPOSITOSAL|guardarCabecera($cabecera)  $cabecera: >> '.json_encode($cabecera));

		$aux = $this->rest->callAPI("POST",AJST."/services/asp/ALMDataService/movimientoInterno", $cabecera);
		$id =json_decode($aux["data"]);
		return $id->GeneratedKeys->Entry[0]->ID;
	}
	/**
	* Guarda detalle de movimiento deposito
	* @param array detalle de articulos
	* @return bool true or false respuesta de servicios
	*/
	function guardarDetalle($detalle){

		$post['_post_movimientointerno_detalle_batch_req']['_post_movimientointerno_detalle'] = $detalle;
		log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPOSITOSSAL|guardarDetalle($detalle)  $post: >> '.json_encode($post));
		$aux = $this->rest->callAPI("POST",AJST."/services/asp/ALMDataService/_post_movimientointerno_detalle_batch_req", $post);
		$aux =json_decode($aux["status"]);
		return $aux;
	}
	/**
	* Descuenta de lotes las cantidaddes porarticulo
	* @param array con art_id y cantidaddes
	* @return bool true o false segun respuesta de servicio
	*/
	function descontarEnLote($descuento){

		$post['_post_lote_descontar'] = $descuento;
		log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|TR|MOVIMIENTODEPOSITOSSAL  descontarEnLote($descuento)  $post >> '.json_encode($post));
		$aux = $this->rest->callAPI("POST",AJST."/services/asp/ALMDataService/lote/descontar", $post);
		$aux =json_decode($aux["data"]);
		return $aux->UpdatedRowCount->Value;

	}



	//FIN FUNCION SAL DEPO
    
}