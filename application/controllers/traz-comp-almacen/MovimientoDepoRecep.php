<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MovimientoDepoRecep extends CI_Controller {

	function __construct() 
    {
		parent::__construct();

        $this->load->model('MovimientoDepositosRecep');

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
		$data['establecimiento'] = $this->MovimientoDepositosRecep->Get_Esta(); // esto se agrego para la funcionalidad de depositos
		$data['depositos'] = $this->MovimientoDepositosRecep->Get_depo_todos(); // esto se agrego para la funcionalidad de depositos
		//para traer las unidades
		$list = json_decode(json_encode($this->MovimientoDepositosRecep->Get_unidades()));
		$data['unidades'] = $list;
		//fin traer las unidades
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
		$list = json_decode(json_encode($this->MovimientoDepositosRecep->Get_Recpciones($id_dest_esta, $id_dest_depo)));
		$aux = array();
		$obj = null;
		foreach ($list as $key =>$o) {
			$obj = new stdClass();
			$obj->nro_comprobante = $o->nro_comprobante;
			$obj->depo_id_origen = $o->depo_id_origen;
			$obj->descripcion_depo_origen = $o->descripcion_depo_origen;
			$obj->patente = $o->patente;
			$obj->acoplado = $o->acoplado;
			$obj->conductor = $o->conductor;
			$obj->fecha_envio = $o->fecha_envio;
			$obj->json = json_encode($o);
			array_push($aux, $obj);
		}
		echo json_encode($aux);
	}	
	

}