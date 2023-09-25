<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lectura extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Lecturas');
	}

	public function index($permission){
		$data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Lectura >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));
	
		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();
	
			echo ("<script>location.href='login'</script>");
	
		}else{
			$data['list'] = $this->Lecturas->lectura_List();
			$data['permission'] = $permission;
			$this->load->view('lectura/lect', $data);
		}
	}
	// trae equipos quu tengan parametros asociados y por id de empresa.
	public function getEquipo(){
		$result= $this->Lecturas->getEquipo();
		echo json_encode($result);
	}
	// trae parametros asociados al equipo.
	public function getParametrosAsoc(){
		$result= $this->Lecturas->getParametrosAsoc($this->input->post('equipoId'));
		echo json_encode($result);
	}
	// guarda la lecturas de los parametros del equipo
	public function guardar_lectura(){
		
		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa'];

		$id_equipo = $_POST['id_equipo'];
		$id_parametro = $_POST['id_parametro'];
		$fecha = $_POST['fecha'];
		$valor = $_POST['valor'];

		$insert = array(					
									'paramId' => $id_parametro,
									'id_equipo' =>$id_equipo ,
									'valor' => $valor,
									'fechahora'=> $fecha,
									'id_empresa' => $empId					
									);
		$result = $this->Lecturas->guardar_lectura($insert);
		echo json_encode($result);        
	}
	// borra lectura por id de registro en tabla
	public function deleteLectura(){
		$result= $this->Lecturas->deleteLectura($this->input->post('id'));
		echo json_encode($result);
	}	
	// trae lectura por fecha e id de equipo
	public function getLecturasCargadas(){

		$fechaformateada = $this->input->post('fecha');
		$idequipo = $this->input->post('idequipo');
		$response = $this->Lecturas->getLecturasCargadas($fechaformateada, $idequipo);
		echo json_encode($response);		
	}







	// public function guardar_lectura(){
		
	// 	$datos=$_POST['data'];
		

	// 	$result = $this->Lecturas->insert_lectura($datos);
		
	// 	if($result)
	// 	{
	// 		$ultimoId=$this->db->insert_id(); 
			
	// 		$arre=array();
		    
	//         echo 1;
			
	// 	}
	// 	else echo "error al insertar";
	// }

	// public function getparametros(){
	// 	//$this->load->model('Lecturas');
	// 	$id = $datos=$_POST['id_equipo'];
	// 	$parametros = $this->Lecturas->getparametros($id);
	// 	if($parametros)
	// 	{	
	// 		$arre=array();
	//         foreach ($parametros as $row ) 
	//         {   
	//            $arre[]=$row;
	//         }
	// 		echo json_encode($arre);
	// 	}
	// 	else echo "nada";
	// }

	

	


	// public function getequipo(){
		// 	$this->load->model('Lecturas');
		// 	$equipo = $this->Lecturas->getequipo();
		// 	//echo json_encode($Customers);

		// 	if($equipo)
		// 	{	
		// 		$arre=array();
		//         foreach ($equipo as $row ) 
		//         {   
		//            $arre[]=$row;
		//         }
		// 		echo json_encode($arre);
		// 	}
		// 	else echo "nada";
		// }

	// public function getcriticidad(){
		// 	$this->load->model('LecturaS');
		// 	$criticidad = $this->Lecturas->getcriticidad();
		// 	//echo json_encode($Customers);

		// 	if($criticidad)
		// 	{	
		// 		$arre=array();
		//         foreach ($criticidad as $row ) 
		//         {   
		//            $arre[]=$row;
		//         }
		// 		echo json_encode($arre);
		// 	}
		// 	else echo "nada";
		// }
	
	

	/*public function guardar_lectura()
		{
			$datos=$_POST['data'];
			//$parametros=$_POST['idsparametro'];

			$result = $this->Lecturas->insert_lectura($datos);
			
			
		}*/

	

	
	
	

}