<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Remito extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Remitos');
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


    public function index($permission) // Ok
    {
		if($this->check_session()){
			$data['permission'] = $permission;
			$data['list'] = $this->Remitos->getRemitosList();
			$this->load->view('remito/list',$data);
			//$this->load->view('remito/view_',$data);
		}
    }

    public function cargarlista($permission) // Ok
    {
        $data['permission'] = $permission;
        $this->load->view('remito/view_',$data);
    }

    /*public function getcodigo()
    {
		$sol = $this->Remitos->getcodigo();
		if($sol)
		{	
			$arre = array();
	        foreach ($sol as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}*/
	public function getcodigo()
    {
		$codigo = $this->Remitos->getcodigo();
		if($codigo)
		{	
			$arre = array();$i=0;
	        foreach ($codigo as $valor ) 
	        {   
				$valorS = (array)$valor;
				$arre[$i]['value'] = $valorS['artId'];
				$arre[$i]['label'] = $valorS['artBarCode'];
				$arre[$i]['artDescription'] = $valorS['artDescription'];
				$i++;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function getdeposito()
	{
		$deposito = $this->Remitos->getdeposito();
		if($deposito)
		{	
			$arre = array();
	        foreach ($deposito as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function getproveedor()
	{
		$sol = $this->Remitos->getproveedor();
		if($sol)
		{	
			$arre = array();
	        foreach ($sol as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function getdescrip()
 	{
		//$this->load->model('Remitos');
		$des = $this->Remitos->getdescrip($this->input->post());
		//echo json_encode($Customers);
		if($des)
		{	
			$arre = array();
	        foreach ($des as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function consultar()
	{
		$id     = $_POST['idremito'];
		$result = $this->Remitos->getConsulta($id);
		if($result)
		{	
			$arre['datosRemito'] = $result;
			$datosDetaRemitos       = $this->Remitos->getDetaRemitos($id);
			if($datosDetaRemitos)
			{
				$arre['datosDetaRemitos'] = $datosDetaRemitos;
			}
			echo json_encode($arre);
		}
		else echo "nada";
	}
	
	public function alerta()
	{
		$deposito = $_POST['id_deposito'];
		$codigo   = $_POST['id_her'];
		$s        = $this->Remitos->alerta($codigo, $deposito);
		if($s)
		{				
			echo json_encode($s);
		}
		else echo "nada";
	}

	public function getlote()
	{
		$idd = $_POST['id_deposito'];
		$ide = $_POST['id_her'];
		$sol = $this->Remitos->getlote($ide, $idd);
		//echo json_encode($Customers);
		if($sol)
		{	
			$arre = array();
	        foreach ($sol as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function guardar()
	{
		$datos  = $_POST['data'];
		$co     = $_POST['comp']; // cnt
		$dep    = $_POST['depo']; // deposito
		$indice = $_POST['idsinsumo'];
		$ar     = $_POST['art']; //id de articulos 
		$i      = 1;
		//$res  =array();
		$result = $this->Remitos->insert_orden($datos);
		if($result)
		{
			//$this->db->trans_start();   // inicio transaccion
			$ultimoId=$this->db->insert_id(); //traigo el ultimo id 
			$this->Remitos->detaorden($ultimoId, $co, $dep, $indice, $ar);
			/*foreach ($indice as $row) {
				if($ar[$i]){
					if($dep[$i]){
						$a=$ar[$i];
						$d=$dep[$i];
						$res=$this->Remitos->loteres($a,$d); //id de lote 
						print_r($res);
						if($co[$i]){
							$datos2 = array(
				        	 'id_remito'=>$ultimoId, 
				        	 'loteid'=>$res,
				        	 'cantidad'=>$co[$i]
			        		);
				        	print_r($datos2);
				        	$this->Remitos->insert_detaremito($datos2);
						}
					}
				}
				$i++;
			}*/
		}
		return $result;
	}




	public function getsolicitante(){
		$this->load->model('Ordeninsumos');
		$solicitante = $this->Ordeninsumos->getsolicitante();
		if($solicitante)
		{	
			$arre = array();
	        foreach ($solicitante as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

}
