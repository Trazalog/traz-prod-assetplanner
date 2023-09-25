<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Notapedido extends CI_Controller {

  function __construct(){

    parent::__construct();
    $this->load->model('Notapedidos');
  }

  public function check_session(){

    $data = $this->session->userdata();
    log_message('DEBUG','#Main/index | Customer >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

    if(empty($data['user_data'][0]['usrName'])){
      log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
      $var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
      $this->session->set_userdata($var);
      $this->session->unset_userdata(null);
      $this->session->sess_destroy();

      echo ("<script>location.href='login'</script>");

    }else{
            return true;
        }
  }


  public function index($permission){

    if($this->check_session()){
      $data['list'] = $this->Notapedidos->notaPedidos_List();
      $data['permission'] = $permission;
      $this->load->view(ALM.'notapedido/list',$data);
      //$this->load->view(ALM.'notapedido/view_');
    }
  }

  public function getNotasxOT($permission, $idot){
    $data['permission'] = $permission;
    $data['list']       = $this->Notapedidos->getNotasxOT($idot);
    $this->load->view(ALM.'notapedido/listOt', $data);
  }

  public function ObtenerNotasPedidosxOT($permission,$idot){
    $data['permission'] = $permission;
    $data['list']  = $this->Notapedidos->getNotasxOT($idot);
    $this->load->view(ALM.'notapedido/list',$data);
  }

  public function agregarNota($permission, $idot){
    $data['permission'] = $permission;
    $data['ot']         = $this->Notapedidos->getOTporId($idot);
    $this->load->view(ALM.'notapedido/view_', $data);
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

 // guardar pedido especial
  public function setPedidoEspecial(){

    $pedido = $this->input->post('pedido');
    $justif = $this->input->post('justif');

    // Lanza proceso (retorna case_id)
    $result = $this->lanzarProcesoBPM($inspectorid);
    $caseId = json_decode($result, true)['caseId'];

  }
// lanza proceso en BPM (inspección)
  // function lanzarProcesoBPM($inspectorid){

  //   $parametros = $this->bpm->conexiones();
  //   $parametros["http"]["method"] = "POST";
  //   $idInspector = array (
  //     "idInspector"	=>	$inspectorid
  //   );	
  //   $parametros["http"]["content"] = json_encode($idInspector);
  //   $param = stream_context_create($parametros);
  //   $result = $this->Inspecciones->lanzarProcesoBPM($param);
   
  //   return $result;		
  // } 


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

   // devuelve plantilla de insumos a pedir por cliente 
   public function agregarListInsumos($permission, $ot ,$idcliente){
    $data['permission'] = $permission;    
    $data['plantilla']  = $this->Notapedidos->getPlantillaPorCliente($idcliente);
    $data['ot'] = $ot;
    $this->load->view(ALM.'notapedido/insumolist',$data);
    
  }
  
}
