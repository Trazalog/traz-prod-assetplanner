<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Reporteorden extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('Reporteordenes');
	}

	public function index($permission)
	{
		$data['permission'] = $permission;
		$this->load->view('reporteorden/view_', $data);
	}

	public function getEquipo()
	{
		$response = $this->Reporteordenes->getEquipos();
		echo json_encode($response);
	}

	public function getestado()
	{
		$response = $this->Reporteordenes->getestados();
		echo json_encode($response);
	}

	public function getDatosReporte()
	{
		$parametros = $this->input->post('parametros');
		$response   = $this->Reporteordenes->getDatosReporte($parametros);
		echo json_encode($response);
	}

}
		if($ordenesTrabajo)
		{	
			$arre = array();
			foreach ($ordenesTrabajo as $row ) 
			{   
				$arre[] = $row;
			}
			echo json_encode($arre);
		}
		else 
			echo json_encode(0);
	}

	public function getestado()
	{
		$estado = $this->Reporteordenes->getestados();
		if($estado)
		{	
			$arre = array();
			foreach ($estado as $row ) 
			{   
				$arre[] = $row;
			}
			echo json_encode($arre);
		}
		else 
			echo json_encode(0);
	}

	public function getOTequipo()
	{
		$ideq   = $_POST['id_eq'];
		$equipo = $this->Reporteordenes->getOTequipos($ideq);
		if($equipo)
		{	
			$arre = array();
	        foreach ($equipo as $row) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function traerot()
	{
		$idot     = $_POST['id_ot'];
		$orden = $this->Reporteordenes->traerOrdenes($idot);
		if($orden)
		{	
			$arre = array();
	        foreach ($orden as $row) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo json_encode(0);
	}

	public function traerOTestado()
	{
		$idest       = $_POST['id_est'];
		$ordenEstado = $this->Reporteordenes->traerOTestados($idest);
		if($ordenEstado)
		{	
			$arre = array();
	        foreach ($ordenEstado as $row) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo json_encode(0);
	}
	


	
	public function getfecha(){
		
		$de=$_POST['de'];
		$hs=$_POST['a'];

		$uno=substr($de, 0, 2); //d
	  	$dos=substr($de, 3, 2); //m
	  	$tres=substr($de, 6, 4); //a
	  	$resul = ($tres."-".$dos."-".$uno); 

	  	$uno1=substr($hs, 0, 2); 
	   	$dos1=substr($hs, 3, 2); 
	   	$tres1=substr($hs, 6, 4); 
	   	$resul1 = ($tres1."-".$dos1."-".$uno1);
    
		$fecha = $this->Reportepedidos->getfechas($resul,$resul1);
		//echo json_encode($Customers);

		if($fecha)
		{	
			$arre=array();
	        foreach ($fecha as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	
	public function getarticulo(){
		$response = $this->Reportepedidos->getarticulos();
      	echo json_encode($response);
	}
	
	public function traerArticulo(){
		
		$idart=$_POST['id_art'];
		
    
		$articulo = $this->Reportepedidos->traerArticulos($idart);
		//echo json_encode($Customers);

		if($articulo)
		{	
			$arre=array();
	        foreach ($articulo as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function calestado(){
		
		$est=$_POST['avestado'];
		
		$articulo = $this->Reporteorden->calestados($est);

		if($articulo)
		{	
			$arre=array();
	        foreach ($articulo as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else 
		echo json_encode(0);
	}
	
	


	

}