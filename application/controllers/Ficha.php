<?php defined('BASEPATH') OR exit('No direct script access allowed');

class  Ficha extends CI_Controller {

    public function __construct(){
        parent::__construct();
       $this->load->model('Fichas');
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
            
            $data['list'] = $this->Fichas->equipos_List();
            $data['permission'] = $permission;
            
            $this->load->view('ficha/list', $data);
        }
		     
    }
    
    public function cargarequipo($permission,$idglob){ 
    	//$data['list'] = $this->Fichas->equipos($idglob);
        $data['permission'] = $permission;    // envia permisos  
        $data['id_equipo'] = $idglob;      
        $this->load->view('ficha/view_',$data);
    }

    public function cargarequipoDos($permission,$idglob){ 
    	$data['list'] = $this->Fichas->equipos($idglob);
        $data['permission'] = $permission;    // envia permisos  
        $data['id_equipo'] = $idglob;     

        $this->load->view('ficha/editar',$data);
    }
    //   public function cargarficha($permission,$idglob){ 
    //     // $data['list'] = $this->Fichas->equipos();
    //     $data['permission'] = $permission;    // envia permisos 
    //     $data['id_equipo'] = $idglob;      
    //     $this->load->view('ficha/view_',$data);
    // }

    public function getcodigo(){
		$this->load->model('Fichas');
		$empresa = $this->Fichas->getcodigos();
		//echo json_encode($Customers);

		if($empresa)
		{	
			$arre=array();
	        foreach ($empresa as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}



}
 


