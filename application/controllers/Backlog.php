<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Backlog extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Backlogs');
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
		$data = $this->input->post();		     
		$ideq=$data['equipo'];
		$idce=$data['idcomponenteequipo'];
		$fe=$data['vfecha'];
		$ta=$data['id_tarea'];
		$hs=$data['hshombre'];		
		$back_dur = $data['back_duracion'];
		// fecha convertida		
			$uno=substr($fe, 0, 2); 
			$dos=substr($fe, 3, 2); 
			$tres=substr($fe, 6, 4); 
			$resul = ($tres."/".$dos."/".$uno); 

		$datos = array(
				'id_equipo'     => $ideq,//
				'tarea_descrip' => $ta,		//				
				'fecha'         => $resul, //
				'horash'				=> $hs, //
				'estado'        => 'C',//				
				'back_duracion' => $back_dur,
				'id_empresa'    => $empId,
				'idcomponenteequipo' => $idce,//				
		);		

		$response['respBacklog'] = $this->Backlogs->insert_backlog($datos);	

		if($response['respBacklog']){

			$ultimoId = $this->db->insert_id(); 
			
			////////// para guardar herramientas                 
				if ( !empty($data['id_her']) ){
					//saco array con herramientas y el id de empresa
					$herr = $data["id_her"]; 
					$i = 0;
					foreach ($herr as $h) {
						$herram[$i]['herrId']= $h;
						$herram[$i]['id_empresa']= $empId;
						$i++;                                
					} 
					//saco array con cant de herramientas y el id de preventivo 
					$cantHerr = $data["cant_herr"];
					$z = 0;
					foreach ($cantHerr as $c) {
						$herram[$z]['cantidad']= $c;
						$herram[$z]['backId']= $ultimoId;
						$z++;                                
					}				
					// Guarda el bacht de datos de herramientas
					$response['respHerram'] = $this->Backlogs->insertBackHerram($herram);
				}else{

					$response['respHerram'] = true;	// no habia herramientas
				}	


			////////// para guardar insumos
				if ( !empty($data['id_insumo']) ){
					//saco array con herramientas y el id de empresa
					$ins = $data["id_insumo"]; 
					$j = 0;
					foreach ($ins as $in) {
						$insumo[$j]['artId'] = $in;
						$insumo[$j]['id_empresa'] = $empId;
						$j++;                                
					} 
					//saco array con cant de herramientas y el id de preventivo 
					$cantInsum = $data["cant_insumo"];
					$z = 0;
					foreach ($cantInsum as $ci) {
						$insumo[$z]['cantidad'] = $ci;
						$insumo[$z]['backId'] = $ultimoId;
						$z++;                                
					}
					// Guarda el bacht de datos de herramientas
					$response['respInsumo'] = $this->Backlogs->insertBackInsum($insumo);
				}else{

					$response['respInsumo'] = true;	// no habia insumos
				}	

			////////// Subir imagen o pdf 
				$nomcodif = $this->codifNombre($ultimoId,$empId); // codificacion de nomb  		
				$config = [
					"upload_path" => "./assets/filesbacklog",
					'allowed_types' => "png|jpg|pdf|xlsx",
					'file_name'=> $nomcodif
				];

				$this->load->library("upload",$config);
				
				if ($this->upload->do_upload('inputPDF')) {					
					$data = array("upload_data" => $this->upload->data());
					$extens = $data['upload_data']['file_ext'];//guardo extesnsion de archivo
					$nomcodif = $nomcodif.$extens;
					$adjunto = array('back_adjunto' => $nomcodif);
					$response['respNomImagen'] = $this->Backlogs->updateAdjunto($adjunto,$ultimoId);
				}else{
					$response['respImagen'] = false;
				}							
		}		
		
		// si todas las inserciones se hicieron devuelve true
		if ($response['respBacklog'] && $response['respHerram'] && $response['respInsumo']) {
			$result = true;
		} else {
			$result = false;
		}
		echo json_encode($result);
	}

	// Codifica nombre de imagen para no repetir en servidor
	// formato "12_6_2018-05-21-15-26-24" idpreventivo_idempresa_fecha(año-mes-dia-hora-min-seg)
	function codifNombre($ultimoId,$empId){
		$guion = '_';
		$guion_medio = '-';
		$hora = date('Y-m-d H:i:s');// hora actual del sistema	
		$delimiter = array(" ",",",".","'","\"","|","\\","/",";",":");
		$replace = str_replace($delimiter, $delimiter[0], $hora);
		$explode = explode($delimiter[0], $replace);		
		$strigHora = $explode[0].$guion_medio.$explode[1].$guion_medio.$explode[2].$guion_medio.$explode[3];		
		$nomImagen = $ultimoId.$guion.$empId.$guion.$strigHora;		
		return $nomImagen;
	}

	public function getComponente()
	{
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
}
