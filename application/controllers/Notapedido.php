<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Notapedido extends CI_Controller {

	function __construct(){

		parent::__construct();
		$this->load->model('Notapedidos');
	}

  public function index($permission){
    $data['list'] = $this->Notapedidos->notaPedidos_List();
    $data['permission'] = $permission;
    $this->load->view('notapedido/list',$data);
    //$this->load->view('notapedido/view_');
  }

  public function getNotasxOT($permission, $idot){
    $data['permission'] = $permission;
    $data['list']       = $this->Notapedidos->getNotasxOT($idot);
    $this->load->view('notapedido/listOt', $data);
  }

  /*public function agregarNota($permission){
    //$data['list'] = $this->Notapedidos->notaPedidos_List();
    $data['permission'] = $permission;
    $this->load->view('notapedido/view_',$data);
    //$this->load->view('notapedido/view_');
  }*/

  public function agregarNota($permission, $idot){
    $data['permission'] = $permission;
    $data['ot']         = $this->Notapedidos->getOTporId($idot);
    $this->load->view('notapedido/view_', $data);
  }


  // devuelve plantilla de insumos a pedir por cliente 
  public function agregarListInsumos($permission, $idcliente){
    $data['permission'] = $permission;    
    $data['plantilla']  = $this->Notapedidos->getPlantillaPorCliente($idcliente);
    $this->load->view('notapedido/insumolist', $data);
  }

  public function getOrdenesCursos(){
    $response = $this->Notapedidos->getOrdenesCursos();
    echo json_encode($response);
  }

  public function getDetalle(){
    $response = $this->Notapedidos->getDetalles($this->input->post());
    echo json_encode($response);
  }

  public function getArticulo (){
    $response = $this->Notapedidos->getArticulos($this->input->post());
    echo json_encode($response);
  }

  public function getProveedor(){
      $response = $this->Notapedidos->getProveedores();
      echo json_encode($response);
  }

  public function getNotaPedidoId(){
    $response = $this->Notapedidos->getNotaPedidoIds($this->input->post());
    echo json_encode($response);
  }

  public function setNotaPedido(){
    
    $userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa'];

    $ids = $this->input->post('idinsumos');
    $cantidades = $this->input->post('cantidades');
    $idOT = $this->input->post('idOT');
    
    $cabecera['fecha'] = date('Y-m-d');
    $cabecera['id_ordTrabajo'] = $idOT;
    $cabecera['id_empresa'] = $empId;
    $idnota = $this->Notapedidos->setCabeceraNota($cabecera);
    
    for ($i=0; $i < count($ids); $i++) { 
      $deta[$i]['id_notaPedido'] = $idnota;
      $deta[$i]['artId'] = $ids[$i];
      $deta[$i]['cantidad'] = $cantidades[$i];
      $deta[$i]['fechaEntrega'] = date('Y-m-d');
      $deta[$i]['estado'] = 'P';
    }

    $response = $this->Notapedidos->setDetaNota($deta);
    echo json_encode($response);
  }
  
}
