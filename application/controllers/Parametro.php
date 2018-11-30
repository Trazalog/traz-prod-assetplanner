<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Parametro extends CI_Controller {
	
	function __construct()
    {
		parent::__construct();
		$this->load->model('Parametros');
	}

	public function index($permission)
	{
		//$data['list'] = $this->Parametros->parametros_List();
		$data['permission'] = $permission;
		$this->load->view('parametro/list', $data);
		//$id = $datos=$_POST['id_equipo'];
		//$data = $this->Parametros->getparametros($id);
	}

	public function getequipo(){
		//$this->load->model('Parametros');
		$equipo = $this->Parametros->getequipo();
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

	public function getparametros()
	{
		//$this->load->model('Parametros');
		$id         = $_POST['id_equipo'];
		$parametros = $this->Parametros->getparametros($id);
		if($parametros)
		{	
			$arre = array();
	        foreach ($parametros as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre );
		}
		else echo "nada";
	}

	public function traerparametro()
	{
		//$this->load->model('Parametros');
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

	public function guardar()
	{
		$datos  = $_POST['data'];
		$result = $this->Parametros->guardar($datos);
		print_r($result);
		/*if($result)
		echo $this->db->insert_id();
		else echo 0;*/       
	}

	public function guardar_todo()
	{
		$datos  = $_POST['data'];
		$result = $this->Parametros->guardar_todo($datos);
		print_r(json_encode($result));
		/*if($result)
		echo $this->db->insert_id();
		else echo 0;*/
	}

	public function baja_parametro()
	{
		$t  = $_POST['tr'];
		$co = $_POST['comp'];
		$eq = $_POST['e'];
		//$p=$_POST['parent'];
		//$idp=$_POST['idparam'];
		//$i=0;
		/*if(count($p) > 0 ){ 
	       	if($co[$p] ){
	       		$datos2 = $co[$p];
				$result = $this->Parametros->delete_parametro($idq,$datos2);
				print_r($result);
			}
		}*/
		if($co[$t]){  
       		$datos2 = $co[$t];
       		//$i++;
			$result = $this->Parametros->delete_parametro($eq,$datos2);
		}
		return $result;
	}

	public function bajaparametro()
	{
		$idq    = $_POST['id_equipo'];
		$idp    = $_POST['id_parametro'];
		if(count($idq) > 0 ){
			if($idp){
				$result = $this->Parametros->delete_p($idq,$idp);
				print_r($result);
			}
		}
	}

	public function geteditar()
	{
		$id     = $_GET['equipoglob'];
		$idp    = $_GET['id_parametro'];
		$result = $this->Parametros->geteditar($id,$idp);
		if($result)
		{	
			$arre['datos'] = $result;
			echo json_encode($arre); //echo json_encode($arre)
		}
		else echo "nada";
	}

	public function editar()
	{
		//$pa=$_GET['idparam'];
		//$i=0;
		$id  = $_GET['e'];//id_equipo
		$pp  = $_GET['parent'];//numer de fila
		$cop = $_GET['comp']; //id de param
		if (count($pp>0)) {
			if ($cop[$pp]) {
				$idp2   = $cop[$pp];
				$result = $this->Parametros->editar($id,$idp2);
			}
		}
		/*if ($pa[$i]) {
			$idp2=$pa[$i];
			$i++;
			$result = $this->Parametros->editar($id,$idp2);
		}*/
		if($result)
		{	
			$arre['datos'] = $result;
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function agregar_componente()
	{
		//$ide=$_POST['e'];
		$datos = $_POST['datos'];
		if ($datos) {
			$pa     = $datos['id_parametro'];
			$m      = $datos['maximo'];
			$n      = $datos['minimo'];
			$equ    = $datos['id_equipo'];
			//doy de baja
			$result = $this->Parametros->update_editar($m,$n,$pa,$equ);
			print_r(json_encode($result));
		}
  	}

  	public function agregarcomponente()
	{
		$ide   = $_POST['equipoglob'];
		$datos = $_POST['datos'];
		print_r($ide);
		print_r($datos);
		if ($datos) {
			$pa     = $datos['id_parametro'];
			$maxi   = $datos['maximo'];
			$mini   = $datos['minimo'];
			//doy de baja
			$result = $this->Parametros->update_editar($maxi,$mini, $ide,$pa);
			print_r(json_encode($result));
		}
  	}



	/*function __construct()
    {
		parent::__construct();
		$this->load->model('parametros');
		$this->load->model('Altparametros');
		$this->load->model('Equipos');
	}

	public function index($permission)
	{
		$data['list']       = $this->parametros->Listado_setparames();
		$data['permission'] = $permission;
		$this->load->view('parametro/list', $data);
	}

	public function Obtener_setparam(){
		$id     = $_POST['id_parametro'];
		$result = $this->parametros->Obtener_setparames($id);
		echo json_encode($result);
	}

	public function Guardar_setparam()
	{
		$id_equipo    = $this->input->post('id_equipo');
		$id_parametro = $this->input->post('id_parametro');
		$maximo       = $this->input->post('maximo');
		$minimo       = $this->input->post('minimo');
		$data         = array(
			'id_equipo'    => $id_equipo,
			'id_parametro' => $id_parametro,
			'maximo'       => $maximo,
			'minimo'       => $minimo
		);
	    $sql = $this->parametros->Guardar_setparames($data);
		echo json_encode($sql);
	}

	public function Modificar_setparam(){

		$id_equipo=$this->input->post('id_equipo');
		$id_parametro=$this->input->post('id_parametro');
	    $maximo=$this->input->post('maximo');
	    $minimo=$this->input->post('minimo');
	    $data = array(
							'id_equipo' => $id_equipo,
							'id_parametro' => $id_parametro,
						    'maximo' => $maximo,
						    'minimo' => $minimo
						    
					   );
	    $sql = $this->parametros->Modificar_setparames($data);
	    echo json_encode($sql);
	}
	  
	public function Eliminar_setparam(){
	
		$ide=$this->input->post('id_equipo');	
		$idp=$this->input->post('id_parametro');	
	
		$result = $this->parametros->Eliminar_setparames($ide,$idp);
		echo json_encode($result);	
	}

	public function guardarParametro(){

		$paramdescrip = $this->input->post('paramdescrip');
		$data = array(
			'paramdescrip' => $paramdescrip
		);
		$sql = $this->Altparametros->Guardar_Altparametros($data);
		echo json_decode($sql);
	}

	public function getParametros(){

		$result = $this->Altparametros->Listado_Altparametros();
		echo json_encode($result);
	}

	public function getEquipos()
	{
		$result = $this->Equipos->equipos_List();
		echo json_encode($result);
	}*/

}	
