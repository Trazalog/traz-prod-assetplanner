<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Predictivo extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Predictivos');
		$this->load->model('Otrabajos');
	}

	public function index($permission){
		$data['list'] = $this->Predictivos->predictivo_List();
		$data['permission'] = $permission;
		$this->load->view('predictivo/list', $data);
	}

	// Carga vista nuevo Predictivo
	public function cargarpredictivo($permission){ 
        $data['permission'] = $permission;    // envia permisos       
        $this->load->view('predictivo/view_',$data);
    }

	// Trae equipos por empresa logueada - Listo
	public function getEquipo(){
		
		$equipo = $this->Predictivos->getEquipos();

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

	// Trae info de equipos por ID y por empresa logueada - Listo
	public function getInfoEquipo(){
		$id = $this->input->post('id_equipo');
		$equipo = $this->Predictivos->getInfoEquipos($id);

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

	// Trae tareas por empresa logueada - Listo
	public function getTarea(){
		
		$tarea = $this->Predictivos->getTareas();

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

	// Trae unidades de tiempo - Listo
	public function getUnidTiempo(){
		
		$tarea = $this->Predictivos->getUnidTiempos();

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

	// Guarda predictivos nuevos - Listo
	public function guardar_predictivo(){
		
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];		

		$eq = $this->input->post('equipo');
		$ta = $this->input->post('tarea');
		$fe = $this->input->post('fecha');
		$per = $this->input->post('periodo');
		$can = $this->input->post('cantidad');
		$hh = $this->input->post('horash');
		$dur = $this->input->post('duracion');
		$uTi = $this->input->post('unidad');
		$op = $this->input->post('operarios');
		
		$uno=substr($fe, 0, 2); 
        $dos=substr($fe, 3, 2); 
        $tres=substr($fe, 6, 4); 
        $resul = ($tres."/".$dos."/".$uno); 
		
		$datos = array(	'id_equipo'=>$eq,
						'tarea_descrip'=>$ta,
						'fecha'=>$resul,
						'periodo'=>$per,
						'cantidad'=>$can,
						'horash'=>$hh,
						'estado'=>'C',
						'pred_duracion'=>$dur,
						'pred_canth'=>$op,
						'id_empresa'=>$empId,
						'id_unidad'=>$uTi
					);

		$result = $this->Predictivos->insert_predictivo($datos);			
		echo json_encode($result);			
	}

	// Trae info de Predictivo para editar - Listo 
	public function getEditar(){

		$id = $this->input->post('idpred');
		$ide = $this->input->post('datos');

		$result2 = $this->Predictivos->getInfoprev($ide,$id);
		if($result2){

			$arre['datos'] = $result2;
		}
		else 
			$arre['datos'] = 0;
		
		echo json_encode($arre);
	}	

	// Guarda Predictivo editado -
	public function updatePredictivo(){

		$id = $this->input->post('id_Predictivo');
		$ta = $this->input->post('tarea');
		$fe = $this->input->post('fecha');
		$per = $this->input->post('periodo');
		$can = $this->input->post('cantidad');
		$hh = $this->input->post('horash');
		$dur = $this->input->post('duracion');
		$uTi = $this->input->post('unidad');
		$op = $this->input->post('operarios');
		
		$uno=substr($fe, 0, 2); 
        $dos=substr($fe, 3, 2); 
        $tres=substr($fe, 6, 4); 
        $resul = ($tres."/".$dos."/".$uno); 
		
		$datos = array(	'tarea_descrip'=>$ta,
						'fecha'=>$resul,
						'periodo'=>$per,
						'cantidad'=>$can,
						'horash'=>$hh,
						'estado'=>'C',
						'pred_duracion'=>$dur,
						'id_unidad'=>$uTi,
						'pred_canth'=>$op
						
					);

		$result = $this->Predictivos->updatePredictivos($datos,$id);			
		echo json_encode($result);
	}

	//Cambia de estado a "AN"
	public function baja_predictivo(){
		
		$idpre= $this->input->post('idpre');		
		$datos = array('estado'=>"AN");

		$result = $this->Predictivos->updatePredictivos($datos,$idpre);
		if ($result) {
			echo json_encode(true);
		}
		else {
			echo json_encode(false);
		}
	}

}