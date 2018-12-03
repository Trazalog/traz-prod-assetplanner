<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Parametro extends CI_Controller {
	
	function __construct()
    {
		parent::__construct();
		$this->load->model('Parametros');
	}

	public function index($permission){
		//$data['list'] = $this->Parametros->parametros_List();
		$data['permission'] = $permission;
		$this->load->view('parametro/list', $data);
		//$id = $datos=$_POST['id_equipo'];
		//$data = $this->Parametros->getparametros($id);
	}
	// trae equipos
	public function getequipo(){
		//$this->load->model('Parametros');
		$equipo = $this->Parametros->getequipo();
		if($equipo){	
			$arre = array();
	        foreach ($equipo as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}
	// trae parametros asociados por id de equipo
	public function getparametros(){
		
		$id         = $_POST['id_equipo'];
		$parametros = $this->Parametros->getparametros($id);
		if($parametros){	
			$arre = array();
	        foreach ($parametros as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre );
		}
		else echo "nada";
	}
	// trae datos para la edicion
	public function editar(){
	
		$id_equipo  = $_POST['id_equipo'];
		$id_param  = $_POST['id_param'];
	
		$result = $this->Parametros->editar($id_equipo,$id_param);
		
		if($result){	
			$arre['datos'] = $result;
			echo json_encode($arre);
		}
		else echo array();
	}
	//guarda la asociacio de parametros editada
	public function guardarmodif(){
		
		$datos = $_POST['datos'];
		
		if ($datos) {
			$pa     = $datos['id_parametro'];
			$m      = $datos['maximo'];
			$n      = $datos['minimo'];
			$equ    = $datos['id_equipo'];
			//doy de baja
			$result = $this->Parametros->update_editar($m,$n,$pa,$equ);
			if($result){
				$parametros = $this->Parametros->getparametros($equ);
			}else{
				$parametros = false;
			}
			
		echo json_encode($parametros);
		}
	}
	// elimina asociacion
	public function eliminar(){

		$id_equipoElim = $_POST['id_equipoElim'];
		
		$id_parametroElim = $_POST['id_parametroElim'];

		// dump($id_equipoElim, 'id de equipo');
		// dump($id_parametroElim,'ide parametro');
		$response = $this->Parametros->elimina_param($id_equipoElim,$id_parametroElim);
		if($response){
			$parametros = $this->Parametros->getparametros($id_equipoElim);
		}else{
			$parametros = false;
		}
		
		echo json_encode($parametros);
	}
	// guarda asociacion nueva de parametros
	public function guardar_todo(){
		$datos  = $_POST['data'];
		$id_equipo = $datos['id_equipo'];
		$response = $this->Parametros->guardar_todo($datos);
		if($response){
			$parametros = $this->Parametros->getparametros($id_equipo);
		}else{
			$parametros = false;
		}		
		echo json_encode($parametros);
	}
	// guarda parametro nuevo
	public function guardar(){
		$datos  = $_POST['data'];
		$result = $this->Parametros->guardar($datos);
		echo json_encode($result);  
	}
	// trae parametros para asociar
	public function traerparametro(){
		
		$equipo = $this->Parametros->traerparametro();
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

}	
