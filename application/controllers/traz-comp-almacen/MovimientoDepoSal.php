<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MovimientoDepoSal extends CI_Controller {

	function __construct() 
    {
		parent::__construct();

        $this->load->model('MovimientoDepositosSal');

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
		
	

}