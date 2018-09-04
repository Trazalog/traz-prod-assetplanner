<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Componente extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Componentes');
	}

	// Listo
	public function index($permission)
	{	
		$data['list']       = $this->Componentes->componentes_List();
		$data['permission'] = $permission;
		$this->load->view('componente/list', $data);
	}

	//Carga vista agregar relacion comp/equipo
	public function cargarcomp($permission)
	{ 
        $data['permission'] = $permission;          
        $this->load->view('componente/view_', $data);
    }

	// Trae equipos segun empresa logueada - Listo
	public function traerequipo()
	{
		$equipo = $this->Componentes->traerequipo();
		if($equipo)
		{	
			$arre = array();
	        foreach ($equipo as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);			
		}
		else echo "nada";
	}

    // Elimina la Asociacion compon/equipo
	public function baja_comp()
	{    
		$idequip = $_POST['idequipo'];
		$idcomp  = $_POST['datos'];		
		$result  = $this->Componentes->delete_asociacion($idequip, $idcomp);
		print_r($result);	
	}

    // Devuelve descripcion de equipo segun id - Listo
	public function getequipo()
	{	
		$id     = $_POST['idequipo'];
		$equipo = $this->Componentes->getequipo($id);
		if($equipo)
		{
			$arre = array();
	        foreach ($equipo as $row )
	        {
	            $arre['datos'] = $row;
	        }
			print_r(json_encode($arre)) ;
		}
		else echo "nada";
	}
		
	// Trae marcas para modal agregar componente - Chequeado
	public function getmarca()
	{
		$marca = $this->Componentes->getmarca();
		if($marca)
		{	
			$arre = array();
	        foreach ($marca as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

    // Trae componentes segun empresa (no equipos)
	public function getcomponente()
	{	
		$compo = $this->Componentes->getcomponente();	
		if($compo){	
			$arre = array();
	        foreach ($compo as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	// Agrega componente nuevo - Listo
	public function agregar_componente()
	{
		$datos = $_POST['parametros'];
		//print_r($datos);
        if ($datos >0) {
			$descripcion = $datos['descripcion'];
			$equipId     = $datos['id_equipo'];
			$fechahora   = date("Y-m-d H:i:s");
			$informacion = $datos['informacion'];
			$marca       =$datos['marcaid'];
			$pdf         = $datos['pdf'];
			$insert = array(
				'id_equipo'   => $equipId ,
				'descripcion' => $descripcion,
				'informacion' => $informacion,
				'fechahora'   => $fechahora,
				'marcaid'     => $marca
			);
	     	$result = $this->Componentes->agregar_componente($insert);
	     	print_r(json_encode($result));
	     	if ($result){
	     		$ultimoId = $this->db->insert_id(); 
				//print_r($ultimoId);
	     		$path = "assets/filesequipos/".$ultimoId.".pdf"; 
	     		file_put_contents($path,base64_decode($pdf));
				//actualizar path en base de datos
	     		$update = array(
	     			'pdf' => $path
	     		);
	     		$comp = $this->Componentes->updatecomp($ultimoId,$update);
				//print_r($comp);
	     		return $comp;
	     	}
	    }
  	}

  	// Asocia equipo/componente - Listo
	public function guardar_componente()
	{	
		$datos  = $_POST['data'];
		$compo  = $_POST['comp'];
		$codigo = $_POST['codigo'];
		$ba     = $_POST['x'];
		$ede    = $_POST['ge'];
		$j      = 1;	
	    for ($i=0; $i < $ba ; $i++)
	    {     
	 	    if($compo[$j])
	 	    {
	        	$datos2 = array(
					'id_equipo'     => $ede, 
					'id_componente' => $compo[$j],
					'codigo'        => $codigo[$j],
					'estado'        => 'AC'	        	 
	        	);	
	        	//print_r($datos2);
	        	$res = $this->Componentes->insert_componente($datos2);	     
	        }
	        $j++;
	    }
		return $res;    
	}

	// Trae componentes segun id de equipo - Listo
  	public function getcompo()
  	{
		$id    = $_POST['idequipo']; 
		$compo = $this->Componentes->getcompo($id);
		if($compo!=0)
		{	
			$arre = array();
	        foreach ($compo as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		return $compo;
	}

}
