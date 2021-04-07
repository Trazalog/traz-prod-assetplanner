<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MovimientoDepoSal extends CI_Controller {

	function __construct() 
    {
		parent::__construct();

        $this->load->model(ALM.'/MovimientoDepositosSal');

	}

	// Muestra listado de articulos
	public function index()
	{
		$this->load->model('traz-comp/Componentes'); // esto se agrego para la funcionalidad de depositos
    if($_GET)
		{
			$permission = $_GET["permisos"];
		}
    $data['items'] = $this->Componentes->listaArticulos(); // esto se agrego para la funcionalidad de depositos - esto me permite buscar articulo por codigo para eso necesita la funcion que esta en el model anterior
		$data['permission'] = $permission;
		$data['establecimiento'] = $this->MovimientoDepositosSal->Get_Esta(); // esto se agrego para la funcionalidad de depositos
		$data['depositos'] = $this->MovimientoDepositosSal->Get_depo_todos(); // esto se agrego para la funcionalidad de depositos
		//para traer las unidades
		$list = json_decode(json_encode($this->MovimientoDepositosSal->Get_unidades()));
		$data['unidades'] = $list;
		//fin traer las unidades
		$this->load->view(ALM.'/Depositos/MovimientoSalida', $data);
  }
    // Funciones creadas para la pantalla salida deposito MIGRAR
	 //----funcion que trea todos los depositos dado un id de un establecimineto que se selecciono anteriormente
	public function traerDepositos()
	{
		$id = $this->input->post('id_esta');
		$resp = $this->MovimientoDepositosSal->Get_depo($id);
		echo json_encode($resp);
	}
	// FIN FUNCIONES SAL DEPO

	public function traerLotes(){
		$arti_id = $this->input->post('arti_id');
		$depo_id = $this->input->post('depo_id');
		$resp = $this->MovimientoDepositosSal->traerLotes($arti_id, $depo_id);
		echo json_encode($resp);
	}

	/**
	* Guarda salida deposito y descuenta en lote
	* @param array detalle de artic, lotes
	* @return bool true or false respuesta de servicios
	*/
	public function guardar(){

		$data['_post_movimientointerno'] = $this->input->post('cabecera');
		$data['_post_movimientointerno']['empr_id'] = empresa();
		$data['_post_movimientointerno']['usuario_app'] = userNick();
		log_message('DEBUG','#TRAZA|ALM|MOVIMIENTOSALIDA|guardar()  $data >> '.json_encode($data));
		$moin_id = (string) $this->MovimientoDepositosSal->guardarCabecera($data);
		if ($moin_id == null) {
			log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPOSAL|guardar() >> ERROR EN GUARDADO DE CABECERA');
			echo json_encode(['status' => false, 'data' => 'Error al guardar Cabecera de Movimiento...']);
			return;
		}

		$post_detalle = $this->input->post('detalle');
		$detalle = $this->armarDetalle($post_detalle, $moin_id);
		$resp = $this->MovimientoDepositosSal->guardarDetalle($detalle);
		if (!$resp) {
			log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPOSAL|guardar() >> ERROR EN GUARDADO DE DETALLE');
			echo json_encode(['status' => false, 'data' => 'Error al guardar Detalle de Movimiento...']);
			return ;
		}

		$resp_desc = $this->descontarLote($post_detalle);
		echo json_encode(['status' => $resp_desc, 'data' => 'Guardado Exitoso...']);
	}

	/**
	* Commpleta array con detalle a guardar
	* @param arrary con detalle
	* @return array completo
	*/
	function armarDetalle($detalle, $moin_id){

		foreach ($detalle as $value) {

				$a = json_decode($value);
				$tmp['codigo'] = $a->codigo;
				$tmp['cantidad'] = $a->cantidad;
				$tmp['arti_id'] = $a->arti_id;
				$tmp['lote_id_origen'] = $a->lote_id_origen;
				$tmp['moin_id'] = $moin_id;
				$tmp['usuario_app'] = userNick();
				$item[] = $tmp;
		}

		return $item;
	}

	/**
	* Descuenta articulos de lote por arti_id
	* @param array articulos
	* @return bool true o false segun respuesta de servicio
	*/
	function descontarLote($detalle){

		foreach ($detalle as $value) {

			$a = json_decode($value);
			$tmp['cantidad'] = $a->cantidad;
			$tmp['lote_id'] = $a->lote_id_origen;
			$item[] = $tmp;
			$resp_det = $this->MovimientoDepositosSal->descontarEnLote($item);
			if (!$resp_det) {
				return $resp_det;
			}
			unset($item);
		}

		return $resp_det;
	}

	/**
	* Levanta vista de impresion
	* @param array datos de salida deposito
	* @return view para impresion
	*/
	function imprimir()
	{     
		log_message('INFO','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPOSAL|IMPRIMIR  >> ');

		$datos['cabecera'] = $this->input->post('cabecera');
		$datos['detalle'] = $this->input->post('detalle');

		$this->load->view(ALM.'/notapedido/printSalidaDeposito');
	}
}