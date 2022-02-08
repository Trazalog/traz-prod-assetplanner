<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pedido extends CI_Controller {

	function __construct(){
		
		parent::__construct();
		$this->load->model('Pedidos');
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


	//////////////// ADMINISTRACION PEDIDOS ////////////////
	public function index($permission){

		if($this->check_session()){
			$data['list'] = $this->Pedidos->otrabajos_List();
			$data['permission'] = $permission;
			$this->load->view('pedidos/list', $data);
		}
	}

	public function getProveedor(){
      $response = $this->Pedidos->getProveedores();
      echo json_encode($response);
  	}

	public function getNotaPedidoId(){

	    $response = $this->Pedidos->getNotaPedidoIds($this->input->post());
	    echo json_encode($response);
  	}

  	public function ArtListPorIdNota($permission, $id_nota){
    		//echo("en cintroldor");
    		//dump_exit($id_nota);  		
      $data['list'] = $this->Pedidos->getNotaPedidoIds($id_nota);
  		$data['permission'] = $permission;
  		$this->load->view('pedidos/view_', $data);
  	}

  	public function setArtNotPedido(){
  		$response = $this->Pedidos->setArtNotPedidos($this->input->post());
  		echo json_encode($response);
  	}

  	public function setNuevoProveedor(){
  	    
  		$response = $this->Pedidos->setNuevosProveedores($this->input->post());
  		echo json_encode($response);
  	}

	
}