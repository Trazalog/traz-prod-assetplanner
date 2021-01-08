<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Ajustestocks extends CI_Model {
    function __construct(){

      parent::__construct();
   }

   function guardarAjustes($data)
   {
			$data = array(
					'ajuste' => array(
					'empr_id' => strval(empresa()),
					'usuario_app' => userNick(),
					'justificacion' => $data['justificacion'],
					'tipo_ajuste' => $data['tipoajuste']
					)
				);

        log_message('DEBUG', 'Ajustestocks/guardarAjuste (datos)-> '.json_encode($data));
      //   $resource = 'stock/ajuste';
      //   $url = REST0.$resource;
      $url = AJST.'/services/asp/ALMDataService/stock/ajuste';
			$array = $this->rest->callAPI("POST", $url, $data);
			return json_decode($array['data']);
   }
   function guardarDetalleAjustes($data)
   {
      //$data = $data;
      if($data['tipo_ent_sal'] == "ENTRADA"){
         $dato = array(
               	'_post_stock_ajuste_detalle' => array(
                'ajus_id' => $data['ajus_id'],
                'lote_id' => $data['loteent'],
                'cantidad' => $data['cantidadent']
              )
         );
      }else if(($data['tipo_ent_sal'] == "SALIDA")){
         $dato = array(
               	'_post_stock_ajuste_detalle' => array(
                'ajus_id' => $data['ajus_id'],
                'lote_id' => $data['lotesal'],
                'cantidad' => strval(intval($data['cantidadsal']) * -1)
               )
         );
      }else if(($data['tipo_ent_sal'] == "E/S")){//FIXME:HACER BATCH REQUEST

				$entrada = array(
								'ajus_id' => $data['ajus_id'],
								'lote_id' => $data['loteent'],
								'cantidad' => $data['cantidadent']
				 );
				$post['_post_stock_ajuste_detalle_batch_req']['_post_stock_ajuste_detalle'][] = (object) $entrada;

				$salida  = array(
							'ajus_id' => $data['ajus_id'],
							'lote_id' => $data['lotesal'],
							'cantidad' => strval(intval($data['cantidadsal']) * -1)
				);
				$post['_post_stock_ajuste_detalle_batch_req']['_post_stock_ajuste_detalle'][] = (object) $salida;

				log_message('DEBUG', 'Ajustestocks/guardarDetalleAjustes (batch_req)-> '.json_encode($post));

				$url = AJST.'/services/asp/ALMDataService/_post_stock_ajuste_detalle_batch_req';
				$array = $this->rest->callAPI("POST", $url, $post);
				return json_decode($array['status']);

      }

      log_message('DEBUG', 'Ajustestocks/guardarDetalleAjustes (datos)-> '.json_encode($data));
      // $resource = 'stock/ajuste/detalle_batch_req';
      // $url = REST0.$resource;
      $url = AJST.'/services/asp/ALMDataService/stock/ajuste/detalle';
      $array = $this->rest->callAPI("POST", $url, $dato);
      return json_decode($array['status']);
   }
}
?>