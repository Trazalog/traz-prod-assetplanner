<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Backlog extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Backlogs');
		$this->load->model('Tareas');
		$this->load->model('Bonitas');
	}

	public function index($permission){
		$data['list'] = $this->Backlogs->backlog_List();
		$data['permission'] = $permission;
		$this->load->view('backlog/list', $data);
	}

	// Trae equipos para llenar select vista - Listo
	public function getequipo(){
		
		$equipo = $this->Backlogs->getequipo();		

		if($equipo)
		{	
			$arre=array();
	        foreach ($equipo as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	// Trae info de equipo por id
	public function getInfoEquipo(){
			
		$cantidad = $this->Backlogs->getInfoEquipos($this->input->post());
		if($cantidad)
		{	
			$arre=array();
	        foreach ($cantidad as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	// Trae tareas por empresa logueada - Listo
	public function gettarea(){
	
		$tarea = $this->Backlogs->gettareas();
		
		if($tarea)
		{	
			$arre=array();
	        foreach ($tarea as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}	
	
	// Trae datos de backlog para editar - Listo
	public function geteditar(){

		$id=$_GET['idpred'];
		$ide=$_GET['datos'];

		$result = $this->Backlogs->geteditar($id);
		if($result){	

			$arre['datos'] = $result;
			$result2 = $this->Backlogs->traerequiposprev($ide,$id);
			if($result2){

				$arre['equipo']=$result2;
			}
			else 
				$arre['equipo']=0;
			
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function editar_backlog(){

		$id_back = $this->input->post('backid');
		$tarea = $this->input->post('tarea');
		$fecha = $this->input->post('fecha');
		$duracion = $this->input->post('duracion');
		
		$uno=substr($fecha, 0, 2); 
        $dos=substr($fecha, 3, 2); 
        $tres=substr($fecha, 6, 4); 
        $resul = ($tres."-".$dos."-".$uno); 

		$datos = array('tarea_descrip'=>$tarea,
					   'fecha'=>$resul,
					   'back_duracion'=>$duracion
						);		

		$result1 = $this->Backlogs->editar_backlogs($datos,$id_back);			
		echo json_encode($result1);
	}
	//Cambia de estado a "AN" - Listo
	public function baja_backlog(){
	
		$idpre=$_POST['gloid'];
		
		$datos = array('estado'=>"AN");
		$result = $this->Backlogs->update_back($datos, $idpre);
		echo json_encode($result);	
	}

	// Carga vista para backolg nuevo - Listo
	public function cargarback($permission){ 
        $data['permission'] = $permission;       
        $this->load->view('backlog/view_',$data);
  }
  	
  	//Inserta  Backlog nuevo - Listo
	public function guardar_backlog(){
			
		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa']; 

    $idce=$_POST['idce'];
		$eq=$_POST['equipo'];
		$fe=$_POST['fecha'];
		$ta=$_POST['tarea'];
		$hs=$_POST['horas'];		
		$tarOpc = $_POST['tarea_opcional'];
		$idBacklog = $_POST['idBacklog'];

		$uno=substr($fe, 0, 2); 
        $dos=substr($fe, 3, 2); 
        $tres=substr($fe, 6, 4); 
        $resul = ($tres."/".$dos."/".$uno); 

		$datos = array(
				'id_equipo'     => $eq,
				'tarea_descrip' => $ta,						
				'fecha'         => $resul,
				'estado'        => 'C',
				'back_duracion' => $hs,
				'id_empresa'    => $empId,
				'idcomponenteequipo' => $idce,
				'tarea_opcional'=> $tarOpc
			);

		$result = $this->Backlogs->insert_backlog($datos);
		echo json_encode($result);
	}

	public function getComponente(){
		$idEquipo = $this->input->post('idEquipo');
		$componentes = $this->Backlogs->getComponentes($idEquipo);
		if($componentes)
		{	
			$arre = array();$i=0;
	        foreach ($componentes as $valor ) 
	        {   
				$valorS = (array)$valor;
				$arre[$i]['value']   = $valorS['codigo'];
				$arre[$i]['label']   = $valorS['codigo'];
				$arre[$i]['descrip'] = $valorS['descripcion'];
				$arre[$i]['sistema'] = $valorS['sistema'];
				$arre[$i]['idce']    = $valorS['idce'];
				$i++;
	        }
			echo json_encode($arre);
		}
		else echo json_encode(0);
	}

/* Funciones para BPM */
	public function editarNuevo(){ 
		
		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa']; 
    $idce = $this->input->post('idce');
		$eq = $this->input->post('equipo');
		$fe = $this->input->post('fecha');
		$ta = $this->input->post('tarea');
		$hs = $this->input->post('horas');
		$tarOpc = $this->input->post('tarea_opcional');
		$idBacklog = $this->input->post('idBacklog');
		$idTarBonita = $this->input->post('idTarBonita');
		
		$datos = array(
				'id_equipo'     => $eq,
				'id_tarea' 		=> $ta,						
				'fecha'         => $fe,
				'estado'        => 'C',
				'back_duracion' => $hs,
				'id_empresa'    => $empId,
				'idcomponenteequipo' => $idce,
				'tarea_opcional'=> $tarOpc
			);

		$result = $this->Backlogs->editarNuevo($datos,$idBacklog);
		
		// trae la cabecera
		$parametros = $this->Bonitas->conexiones();
		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";	
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);
		$result = $this->Tareas->cerrarTarea($idTarBonita, $param);


		echo json_encode($result);
	}

/* Fin Funciones para BPM */
}
