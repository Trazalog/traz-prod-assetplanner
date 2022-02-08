<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Administracion extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Administraciones');
	}

	public function check_session(){

        $data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Administracion >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

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

	public function index($permission)
	{	
		if($this->check_session()){
			$data['list'] = $this->Administraciones->otrabajos_List();
			$data['permission'] = $permission;		
			$this->load->view('administracion/list', $data);
		}
	}


	public function cargartarea($permission,$idglob){ 
		$data['list'] = $this->Administraciones->cargartareas($idglob);
		//var_dump($idglob);
		$data['id_orden'] = $idglob; 
        $data['permission'] = $permission;    // envia permisos       
        $this->load->view('administracion/pedido',$data); //equipo controlador 
    }
	


  	public function agregar_pedido()
	{

	    $num=$_POST['numero'];
	    $idop=$_POST['iort'];
	    $fecha = date("Y-m-d H:i:s");

	   //date('Y-m-d H:i:s')
	   
	   $arre=array();
	    $datos = array(
			       	 'fecha_entregada'=> $fecha, 
			       	 'estado'=>'E',
			         'numero_remito'=>$num

			        	 
		       		);
	    	
 //$idop, $num, $fecha
	    $result2 = $this->Administraciones->update_ordpedid($idop,  $datos);
	    
	   	return $result2; 		
	   
  	}
  	
  	
	

	
 
}