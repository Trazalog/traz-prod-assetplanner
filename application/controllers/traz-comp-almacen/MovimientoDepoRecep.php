<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MovimientoDepoRecep extends CI_Controller {

	function __construct() 
    {
		parent::__construct();

        $this->load->model(ALM.'/MovimientoDepositosRecep');

	}

	// Muestra listado de articulos
	public function index()
	{
		$this->load->model('traz-comp/Componentes');
    if($_GET)
		{
			$permission = $_GET["permisos"];
		}
    $data['items'] = $this->Componentes->listaArticulos(); // esto se agrego para la funcionalidad de depositos - esto me permite buscar articulo por codigo para eso necesita la funcion que esta en el model anterior
		$data['permission'] = $permission;
		$data['establecimiento'] = $this->MovimientoDepositosRecep->Get_Esta();
		$data['depositos'] = $this->MovimientoDepositosRecep->Get_depo_todos();
		$list = json_decode(json_encode($this->MovimientoDepositosRecep->Get_unidades()));
		$data['unidades'] = $list;
		$this->load->view(ALM.'/Depositos/MovimientoRecepcion', $data);
  }
    // Funciones creadas para la pantalla salida deposito MIGRAR
	 //----funcion que trea todos los depositos dado un id de un establecimineto que se selecciono anteriormente
	public function traerDepositos()
	{
		$id = $this->input->post('id_esta');
		$resp = $this->MovimientoDepositosRecep->Get_depo($id);
		echo json_encode($resp);

	}
	// FIN FUNCIONES SAL DEPO
	public function traerRecepciones()
	{
		$id_dest_esta = $this->input->post('id_esta_dest');
		$id_dest_depo = $this->input->post('id_depo_dest');
		$otralist = $this->MovimientoDepositosRecep->Get_Recpciones($id_dest_esta, $id_dest_depo);
		$movim = $otralist[0]->detallesMovimientosInternos->detalleMovimientoInterno;
		echo json_encode($otralist);
	}

	public function traerLotes(){
		$arti_id = $this->input->post('arti_id');
		$depo_id = $this->input->post('depo_id');
		$resp = $this->MovimientoDepositosRecep->traerLotes($arti_id, $depo_id);
		echo json_encode($resp);
	}
	/**
	* Actualiza datos de movimientos de recepcion
	* @param array con datos de actualizacion
	* @return array respuesta devolucion de servicios
	*/
	public function guardar(){

		// actualizacion cabecera movimiento
		$cabecera = $this->input->post("cabecera");
		$resp = $this->MovimientoDepositosRecep->guardarCabecera($cabecera);
		if (!$resp) {
			log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPORECEP|guardar() >> ERROR de no actualizó la cabecera de movimiento de deposito');
			echo json_encode(['status' => $resp, 'data' => 'Error en guardado de cabecera...']);
			return;
		}

		// modificacion lotes y de detalle movimiento
		$resp = $this->updateLotesDetalles($this->input->post("detalle"));
		if (!$resp['status']) {
			log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPORECEP|guardar() >> ERROR de no actualizó la cabecera de movimiento de deposito');
			echo json_encode($resp);
			return;
		}

		echo json_encode($resp);
	}

	/**
	* Updatea lotes y detalles de movimientos de recepcion
	* @param array detalle de movimiento
	* @return array con respuesta de servicios
	*/
	function updateLotesDetalles($detalote){

		$error = 0;

		foreach ($detalote as $value) {

			// actualiza lotes
			$lotes = $this->armarDatosLote($value);// probablemente no ande pide fecha-hora
			$resp_set_lote = $this->MovimientoDepositosRecep->actualizarLotes($lotes);
			if(!$resp_set_lote){
				log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPORECEP|updateLotesDetalles($detalote) >> ERROR: no actualizo lote en modelo');
				$resp = array('status' => $resp, 'data' => 'Error No Actualizó Lote...');
				$error = 1;
				break;
			}

			//traer id de lote
			$lote_id = $this->getLoteIdGenerado($value);// cuando no encuentra devuelve null
			if ($lote_id == null) {
				log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPORECEP|updateLotesDetalles($detalote) >> ERROR: no devolvio $lote_id desde modelo');
				$resp = array('status' => false, 'data' => 'Error No Devuelve Codigo de Lote...');
				$error = 1;
				break;
			}

			// armar detalle
			$detalle = $this->armarDatosDetalle($lote_id, $value);
			$resp_detalle = $this->MovimientoDepositosRecep->guardarDetalle($detalle);
			if (!$resp_detalle) {
				log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPORECEP|updateLotesDetalles($detalote) >> ERROR: no guardo detalle de movimiento...');
				$resp = array('status' => $resp, 'data' => 'Error en Guardado detalle de Movimiento Interno...');
				$error = 1;
				break;
			}
		}

		// respuesta
		if($error){
			return $resp;
		}else{
			$resp = array('status' => true, 'data' => 'Guardado con Exito...');
			return $resp;
		}
	}

	/**
	* Trata datos y arma array para actualizar lotes
	* @param array con datos
	* @return array con datos tratados
	*/
	function armarDatosLote($data){

		$data['empr_id'] = empresa();
		$data['cantidad'] = $data['cantidad_recibida'];
		unset($data["cantidad_recibida"]);
		unset($data["demi_id"]);
		unset($data["cantidad_cargada"]);
		return $data;
	}

	/**
	* Devuleve lote_id generado segn parametros
	* @param array con datos
	* @return string lote_id
	*/
	function getLoteIdGenerado($data){

		$prov_id = $data['prov_id'];
		$arti_id = $data['arti_id'];
		$depo_id = $data['depo_id'];
		$cod_lote = $data['cod_lote'];
		$lote_id = $this->MovimientoDepositosRecep->getLoteIdGenerado($prov_id, $arti_id, $depo_id, $cod_lote);
		if ($lote_id == null) {
				log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|MOVIMIENTODEPORECEP|getLoteIdGenerado($data) >> ERROR NO DEVOLVIO $lote_id desde servicio');
		}
		return $lote_id;
	}

	/**
	* Trata datos para insertar en detalles de movimientos
	* @param array con datos detalle , id_lote
	* @return array con datos tratados
	*/
	function armarDatosDetalle($lote_id, $value){

		$detalle['demi_id'] = $value['demi_id'];
		$detalle['cantidad_recibida'] = $value['cantidad_recibida'];
		$detalle['lote_id_destino'] = $lote_id;
		return $detalle;
	}

}