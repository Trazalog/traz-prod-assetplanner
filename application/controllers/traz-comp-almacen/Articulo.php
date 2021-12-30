<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Articulo extends CI_Controller {

	function __construct() 
    {
		parent::__construct();

		$this->load->model(ALM.'/Articulos');
		$this->load->model(ALM.'/Lotes');

	}

	// Muestra listado de articulos
	public function index()
	{
		if($_GET)
		{
			$permission = $_GET["permisos"];
		}
		$data['list'] = $this->Articulos->getList();
		$data['permission'] = $permission;
		$this->load->view(ALM.'/articulo/list', $data);
	}

	public function paginado(){//server side processing

		$start = $this->input->post('start');
		$length = $this->input->post('length');
		$search = $this->input->post('search')['value'];

		$r = $this->Articulos->articulosPaginados($start,$length,$search);

		$resultado =$r['datos'];
		$totalDatos = $r['numDataTotal'];

		$datos = $resultado->result_array();
		$datosPagina = $resultado->num_rows();

		$json_data = array(
			"draw" 				=> intval($this->input->post('draw')),
			"recordsTotal"  	=> intval($datosPagina),
			"recordsFiltered"	=> intval($totalDatos),
			"data" 				=> $datos
		);
		$result = json_encode($json_data);
		echo $result;
	}
		
	public function getdatosart() // Ok
	{
		$art = $this->Articulos->getUnidadesMedidas();
		if($art)
		{	
			$arre = array();
	        foreach ($art as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	//
	public function getArticle() // Ok
	{
		$data['data']   = $this->Articulos->getArticle($this->input->post());
		$response['html'] = $this->load->view(ALM.'/articulo/view_', $data, true);

		echo json_encode($response);
	}

	//
	public function getpencil() // Ok
	{
		$id     = $this->input->post('idartic');
		$result = $this->Articulos->getpencil($id);
		echo json_encode($result);
	}

	//
	public function editar_art()  // Ok
	{
		$datos  = $this->input->post('data');
		$id     = $this->input->post('ida');
		$result = $this->Articulos->update_editar($datos,$id);
		print_r(json_encode($result));	
	}


	public function setArticle(){
		$data = $this->input->post();
		$id = $this->Articulos->setArticle($data);


		if($id  == false)
		{
			echo json_encode(false);
		}
		else
		{
			
			echo json_encode(true);	
		}
	}


	public function baja_articulo()
	{
		$idarticulo = $_POST['idelim'];
		$result     = $this->Articulos->eliminar($idarticulo);
		print_r($result);
	}

	public function searchByCode() {
		$data = $this->Articulos->searchByCode($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);	
		}
	} 

	public function searchByAll() {
		$data = $this->Articulos->searchByAll($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);	
		}
	}

	public function getestado(){

		$response = $this->Articulos->getestados();

		echo json_encode($response);
		  
	}

	public function getLotes($id = null) //fleiva
	{
		if(!$id){ $this->load->view('no_encontrado');return;}

		$data['articulo'] = $this->Articulos->get($id);

		$data['list'] = $this->Articulos->getLotes($id);
			
		$this->load->view(ALM.'/proceso/tareas/componentes/tabla_lote_deposito', $data);
	}

	public function obtener(){
		$empr_id = empresa();
		// $url = 'http://localhost:8008/services/asp/ALMDataService/articulos/empresa';
		$url = AJST.'/services/asp/ALMDataService/articulos/empresa/'.$empr_id;
		$data = $this->rest->callAPI("GET",$url);
		$rsp = $data['data'];
		// $rsp = json_decode($rsp);
		// $rsp = $rsp->articulos->articulo;
		// if($data['status']) $data['data'] = json_decode($data['data'])->articulos->articulo;
		echo $rsp;
	}

}