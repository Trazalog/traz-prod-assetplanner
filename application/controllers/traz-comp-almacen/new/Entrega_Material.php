<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Entrega_Material extends CI_Controller {
    function __construct(){

      parent::__construct();
      $this->load->model(ALM.'/new/Entregas_Materiales');
   }
   function index(){

      $data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Entrega_Material >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));
	
		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();
	
			echo ("<script>location.href='login'</script>");
	
		}else{

         $data['list'] = $this->Entregas_Materiales->listado();
         $this->load->view(ALM.'/new/entregas_materiales/list',$data);
      }
   }

   public function detalle()
   {
      $id = $this->input->get('id');
      echo json_encode($this->Entregas_Materiales->obtenerDetalles($id));
   }

   public function getEntregasPedido($pema)
   {
      $data['list'] = $this->Entregas_Materiales->getEntregasPedido($pema);
      $this->load->view(ALM.'/new/entregas_materiales/list', $data);
   }
   public function getEntregasPedidoOffline()
   {
      $pema = $this->input->get('pema');
      $data['list'] = $this->Entregas_Materiales->getEntregasPedido($pema);
      $this->load->view(ALM.'/new/entregas_materiales/list', $data);
      
   }
   public function detallPrint()
   {
      $id = $this->input->get('id');
      $data['materiales'] = $this->Entregas_Materiales->obtenerDetallesPrint($id);

      // $this->load->view(ALM.'new/entregas_materiales/printEntregaMat', $data);
      // echo json_encode($this->Entregas_Materiales->obtenerDetallesPrint($id));
       echo json_encode($data);
   }
   public function PrintEntrega()
   {
      $data = $this->input->post('datos');
      $this->load->view(ALM.'/new/entregas_materiales/printEntregaMat', $data);
      
   }
}
?>