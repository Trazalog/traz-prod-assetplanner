<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Ordeninsumo extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Ordeninsumos');
    }

    public function index($permission)
    {
    	$data['list']       = $this->Ordeninsumos->getList();
      	$data['permission'] = $permission;
        $this->load->view('ordeninsumos/list',$data);
    }

    public function cargarlista($permission)
    {
        $data['permission'] = $permission;
        $this->load->view('ordeninsumos/view_',$data);
    }

	public function getcodigo()
	{
		$sol = $this->Ordeninsumos->getcodigo();
		//echo json_encode($Customers);
		if($sol)
		{	
			$arre=array();
	        foreach ($sol as $row ) 
	        {   
	        	$arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function getsolicitante()
	{
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

	public function getdeposito()
	{
		$deposito = $this->Ordeninsumos->getdeposito($this->input->post());
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

 	public function getdescrip()
 	{
		$des = $this->Ordeninsumos->getdescrip($this->input->post());
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

	public function guardar()
	{
		$datos  = $_POST['data'];
		$lote   = $_POST['idslote'];
		$co     = $_POST['comp'];
		$dep    = $_POST['depo'];
		$i      = 1;
		$y      = 1;
		$r      = 1;
		$result = $this->Ordeninsumos->insert_orden($datos);
		if($result)
		{
			$ultimoId = $this->db->insert_id(); 
			$arre     = array();
		    if(count($lote) > 0 ){
		        foreach ($lote as $row ) 
		        {   
		        	if($co[$i])
		        	{
		        		$datos2 = array(
		        			'id_ordeninsumo' =>$ultimoId, 
		        			'loteid'         =>$row,
		        			'cantidad'       =>$co[$i]
		        		);
			        	print_r($datos2);
			          	$this->Ordeninsumos->insert_detaordeninsumo($datos2);
		      		}
					$i++;
		        }
		    }
			//$lote as $row 
			foreach($lote as $row) 
		    { 
	        	$val = $row;
	        	print_r($val); //id de lote 
				if($co[$y]){ //cantidad 123
					$d = $dep[$r];
					$this->Ordeninsumos->lote($val,$co[$y],$d);
         		}
			         	
	         	$y++;
	         	$r++;
	        	//	$f=0;
	        }        
		}
		return $result;
	}

	public function alerta(){
		
		$deposito=$_POST['id_deposito'];
		$codigo=$_POST['id_her'];
		
			
			
			$s = $this->Ordeninsumos->alerta($codigo,$deposito);
			if($s)
		{	
			
			echo json_encode($s);
		}
		else echo "nada";	
	}

	public function getsolImp(){  
      $id=$_POST['id_orden'];
      $result = $this->Ordeninsumos->getsolImps($id);

      if($result){ 
        
        $arre['datos']=$result;
        $equipos = $this->Ordeninsumos->getequiposBycomodato($id);
        
        if($equipos)
        {
          $arre['equipos']=$equipos;
        }
        else $arre['equipos']=0;


        echo json_encode($arre);
      }
      else echo "nada";
  	}

	public function consultar()
	{
		$id     = $_POST['idor'];
		$result = $this->Ordeninsumos->getConsult($id);
		if($result)
		{	
			$arre['datos'] = $result;
			$equipos       = $this->Ordeninsumos->getequipos($id);
			if($equipos)
			{
				$arre['equipos'] = $equipos;
			}
			else $arre['equipos'] = 0;
			$total = $this->Ordeninsumos->total($id);
			if($total)
			{
				$arre['total'] = $total;
			}
			else $arre['total'] = 0;
			echo json_encode($arre);
		}
		else echo "nada";
	}

   
}