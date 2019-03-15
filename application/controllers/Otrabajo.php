<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Otrabajo extends CI_Controller {

	function __construct()
    {
		parent::__construct();
		$this->load->model('Otrabajos');
	}

	/**
	 * Muestra pantalla de listado de Ordenes de Trabajo.
	 *
	 * @param 	String 	$permission 	Permisos de ejecución.
	 */
	public function index($permission) // Ok
	{
		$data['list'] = $this->Otrabajos->otrabajos_List();
		$data['permission'] = $permission;
		$this->load->view('otrabajos/dash', $data);
	}

	/**
	 * Muestra pantalla de listado de Ordenes de Trabajo.
	 *
	 * @param 	String 	$permission 	Permisos de ejecución.
	 */
	public function listOrden($permission,$ot=null) // Ok
	{
		$this->load->library('BPM',null);
		$data['list']    = $this->Otrabajos->otrabajos_List($ot);
		$data['permission'] = $permission;
		$data['list_usuarios'] = $this->bpm->ObtenerUsuarios();					
		$this->load->view('otrabajos/list', $data);
	}

	/**
  	 * Traer proveedores de empresa con estado AC.
  	 *
  	 * @return 	String 	Arreglo con proveedores.
  	 */
  	public function getproveedor() // Ok
  	{	
		$proveedores = $this->Otrabajos->getproveedor();
		if($proveedores)
		{	
			$arre=array();
	        foreach ($proveedores as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	/**
  	 * Traer Sucursales de empresa con estado AC.
  	 *
  	 * @return 	String 	Arreglo con sucursales.
  	 */
	public function traer_sucursal() // Ok
	{
		$sucursales = $this->Otrabajos->traer_sucursal();
		if($sucursales)
		{	
			$arre = array();
	        foreach ($sucursales as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	/**
  	 * Traer Equipos de empresa con estado AC.
  	 *
  	 * @return 	String 	Arreglo con equipos.
  	 */
	public function getequipo() // Ok
	{
		$equipos = $this->Otrabajos->getequipo();
		if($equipos)
		{
			$arre = array();
	        foreach ($equipos as $row )
	        {
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	/**
	 * Agrega nueva OTs.
	 *
	 * @return
	 */
	public function guardar_agregar() // Ok
	{
		$userdata  = $this->session->userdata('user_data');
		$usrId     = $userdata[0]['usrId'];
		$empresaId = $userdata[0]['id_empresa'];
	    
		$num           = $this->input->post('num');
		$descripcion   = $this->input->post('descripcion');
		$fecha_entrega = $this->input->post('fecha_entrega');
		$equipo        = $this->input->post('equipo');
		$sucursal      = $this->input->post('sucursal');
		$proveedor     = $this->input->post('proveedor');
    	
    	$datos2 = array(
			'nro'           => $num,
			'fecha_inicio'  => date('Y-m-d H:i:S'),
			'fecha_entrega' => $fecha_entrega,
			'descripcion'   => $descripcion,
			'estado'        => 'C',
			'id_usuario'    => $usrId,
			'id_usuario_a'  => $usrId,
			'id_sucursal'   => $sucursal,
			'id_proveedor'  => $proveedor,
			'id_equipo'     => $equipo,
			'tipo'          => 1,
			'id_empresa'    => $empresaId
		);

     	$result = $this->Otrabajos->guardar_agregar($datos2);
      	/*if($result)
      		echo $this->db->insert_id();
      	else echo 0;*/
      	return true;
  	}

  	/**
  	 * Trae datos para editar
  	 *
  	 */
    public function getpencil() // Ok
    {
		$id = $this->input->post('idp');
		$result = $this->Otrabajos->getpencil($id);
		echo json_encode($result);
	}

	/**
  	 * Actualiza la OT.
  	 *
  	 */
	public function guardar_editar() // Ok
	{
		$idequipo = $this->input->post('idp');
		$datos    = $this->input->post('parametros');
		$result   = $this->Otrabajos->update_edita($idequipo,$datos);
		print_r($result);
	}

	/**
	 * Muestra la vista de Asignar Tarea
	 *
	 * @param 	String 	$permission 	Permisos de ejecución.
	 * @param 	Int 	$idglob 		Id de orden de trabajo.
	 */
	public function cargartarea($permission, $idglob) // Ok
	{ 
		$data['list']       = $this->Otrabajos->cargartareas($idglob);
		$data['permission'] = $permission;
		$data['id_orden']   = $idglob; 
    $this->load->view('otrabajos/asignacion',$data);
  }

    /**
     * Trae datos a mostrar en el Modal Asignar OT.
     *
     * @return 	String 	Arreglo con datos a mostrar en Modal Asignar OT.
     */
    public function getasigna() // Ok
    {
		$id     = $_GET['id_orden'];
		$result = $this->Otrabajos->getasigna($id);
		if($result)
		{
			$arre['datos'] = $result;
			echo json_encode($arre);
		}
		else echo "nada";
	}

	/**
	 * Trae usuarios por id de empresa logueada.
	 *
	 * @return 	String 	Arreglo con usuarios.
	 */
	public function getusuario() // Ok
	{	
		$usuarios = $this->Otrabajos->getusuario();
		if($usuarios)
		{
			$arre = array();
	        foreach ($usuarios as $row )
	        {
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	






	/**
	 *
	 *
	 */
	// public function traer_cli()
	// {
	// 	$usuario = $this->Otrabajos->traer_cli();
	// 	if($usuario)
	// 	{	
	// 		$arre = array();
	//         foreach ($usuario as $row ) 
	//         {   
	//            $arre[] = $row;
	//         }
	// 		echo json_encode($arre);
	// 	}
	// 	else echo "nada";
	// }


	// Cargar orden de servicios(Informe de servicios)
	public function cargarOrden($permission, $id_sol = null, $id_eq = null, $causa = null){ 
        $data['permission'] = $permission;    // envia permisos 
        $data['id_solicitud'] = $id_sol;      // id de O.T. 
        $data['id_eq'] = $id_eq;              // id de equipo
        $data['causa'] = $causa;              // motivo de la O.T.
        
        $this->load->view('ordenservicios/view_',$data);
    }




	
	public function getotrabajo(){
		$data['data'] = $this->Otrabajos->getotrabajos($this->input->post());
		$response['html'] = $this->load->view('otrabajos/view_', $data, true);

		echo json_encode($response);
	}
	
	public function setotrabajo(){

		$data = $this->Otrabajos->setotrabajos($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);	
		}
	}

	public function getprint(){

		$id=$_POST['ido'];
		//print_r($id);
		$result = $this->Otrabajos->getprint($id);
		 print_r(json_encode($result));

	}

	
	//pedidos
	public function getorden(){

		$id=$_POST['id_orden'];
		$result = $this->Otrabajos->getorden($id);
		if($result)
		{	
			$arre['datos']=$result;

			echo json_encode($arre);
		}
		else echo "nada";
	}



	//pedidos a entregar x fecha
	public function getpedidos(){

		$id=$_GET['fechai'];
		$result = $this->Otrabajos->getpedidos($id);
		if($result)
		{	
			$arre['datos']=$result;

			echo json_encode($arre);
		}
		else echo "nada";
	}
	// boton agregar

	public function agregar(){//ajax

	    if($_POST){
	      $agregar = $this->Otrabajos->agregar($_POST);
	      echo ($agregar===true)?"bien":"mal";
	    }
  	}

  	public function guardar(){	

		$case_id = $this->input->post('case_id');
		$task_id = $this->input->post('task_id');
		$user_id = $this->input->post('usuario');

		//CERRAR TAREA EN BONITA  
		$this->load->library('BPM',0);

		//CERRAR TAREA BPM
		$result = $this->bpm->CerrarTareaBPM($task_id);
		if(!$result['status']) {echo $result['msj'];return;}

		//OBTENER TASK_ID EJECTURAR OT
		$task_id = $this->bpm->ObtenerTaskidXNombre($case_id,'Ejecutar OT');
		if($task_id == 0) {echo ASP_0100; return;}

		//ASIGNO USUARIO A TAREA EJECTURA OT
		$result = $this->bpm->setUsuario($task_id, $user_id);
		if(!$result['status']) {echo $result['msj'];return;}
		
		//GUARDAR DATOS DE OT EN BD MYSQL	
		$id = $_POST['id_orden'];
		$fee = $_POST['fecha_entrega'];
	
		$uno=substr($fee, 0, 2); 
        $dos=substr($fee, 3, 2); 
        $tres=substr($fee, 6, 4); 
        $resul = ($tres."-".$dos."-".$uno); 
		$datos = array(	'fecha_entrega'=>$resul,
						'estado'=>'As',
						'id_usuario_a'=>$user_id
						);
		$result = $this->Otrabajos->update_guardar($id, $datos);		
		
		if($result >0)
		{   echo 1;
		}
		else echo "error al insertar";
	}

	public function getcliente(){
		
		$cliente = $this->Otrabajos->getcliente($this->input->post());
		if($cliente)
		{	
			$arre=array();
	        foreach ($cliente as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}



	

	/*public function getusuario (){
      $response = $this->Ordenservicios->getusuario();
      echo json_encode($response);
    }*/

	
	//nuevo


	//traer grupo
	public function getgrupo(){
				
		$grupo = $this->Otrabajos->getgrupo();
		
		if($grupo)
		{	
			$arre=array();
	        foreach ($grupo as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	

	public function getnum(){
	
		$id=$_POST['id_orden'];
		
		$grupo = $this->Otrabajos->getnums();
		
		echo json_encode($grupo);
	}

	//GUARDAR PEDIDO
	public function guardarorden(){
		
		$datos=$_POST['datos'];
		$result = $this->Otrabajos->insert_pedido($datos);	
		$id=$this->db->insert_id();
		$result2 = $this->Otrabajos->get_pedido($id);

		echo json_encode($result2);

	}



	public function agregar_usuario(){

	    if($_POST) {
	    	$datos=$_POST['datos'];

	     	$result = $this->Otrabajos->agregar_usuario($datos);
	      	//print_r($this->db->insert_id());
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}



	//argegar un proveedor
	public function agregar_proveedor()
	{
	    if($_POST)
	    {
	    	$datos  = $_POST['datos'];
	     	$result = $this->Otrabajos->agregar_proveedor($datos);
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  public function agregar_pedido(){

	    $datos=$_POST['data'];
	    $idot=$_POST['ido'];

	    $result = $this->Otrabajos->agregar_pedidos($datos);
	      	//print_r($this->db->insert_id());
	    if($result){
	      
	    	
	    	$id= $this->db->insert_id();
	    	$fec= date("Y-m-d H:i:s");
	    	
	    	$fecha = array(
			        	 'fecha'=>$fec
 
		        		);
	    	$result1 = $this->Otrabajos->agregar_pedidos_fecha($fecha,$id);

	    	$arre=array();
	    	$datos2 = array(
			        	 'id_orden'=>$idot, 
			        	 'estado'=>'P'			        	
			        	 
		        		);

	    	$result2 = $this->Otrabajos->update_ordtrab($idot, $datos2);
	    }
	   return $result2; 		
	   
  	}
  	
  	public function agregar_tarea(){
	  
	    $datos=$_POST['parametros'];
	    $result = $this->Otrabajos->agregar_tareas($datos);
	      	//print_r($this->db->insert_id());
	   
	   	if($result)
	      		echo $this->db->insert_id();
	    else echo 0;	
	   
  	}

  	public function getmostrar(){

	    $idm=$_POST['idorde'];
	    $dat= $this->Otrabajos->getdatos($idm); //traigo todos los datos 
	    echo json_encode($dat);
  	}

  	public function baja_orden(){
  
	    $idO=$_POST['idord'];
	    $result = $this->Otrabajos->eliminacion($idO);
	    print_r($result);
  	}



	

	public function getArticulo (){
      $response = $this->Otrabajos->getArticulos($this->input->post());
      echo json_encode($response);
    }

 	//mdificado

 	public function EliminarTarea(){
	
		$idord=$_POST['idtarea'];	
		$datos = array('estado'=>'IN');
		$result = $this->Otrabajos->EliminarTareas($idord, $datos);
		print_r($result);
	
	}
		//de aca para adelante nuevo 
		/*public function cambiar_estado(){
		
			$idord=$_GET['id_orden'];
			
			$datos = array('tarea_realizada'=>'RE');
			 //$this->load->model('modalbaja');

			//doy de baja
			$result = $this->Otrabajos->cambiar_estados($idord, $datos);
			print_r($result);
		
		}*/
	//modificada
	public function TareaRealizada(){
	
		$idord=$_GET['id_orden'];	
		$datos = array('estado'=>'RE');
		//$datos = array('estado'=>8);
		$result = $this->Otrabajos->TareaRealizadas($idord, $datos);
		print_r($result);
	
	}

	public function ModificarUsuario(){
	
		$idta=$_POST['idtarea'];
		$idu=$_POST['idusu'];
		$datos = array('id_usuario'=>$idu);
		$result = $this->Otrabajos->ModificarUsuarios($idta, $datos);
		print_r($result);
	
	}

	public function ModificarFecha(){
	
		$idta=$_POST['idtarea'];
		$idu=$_POST['idusu'];
		$fe=$_POST['fe'];
		
		$uno=substr($fe, 0, 2); 
        $dos=substr($fe, 3, 2); 
        $tres=substr($fe, 6, 4); 
        $resul = ($tres."/".$dos."/".$uno); 
		$datos = array('fecha'=>$resul);

		
		$result = $this->Otrabajos->ModificarFechas($idta, $datos);
		print_r($result);
	
	}

	public function CambioParcial(){
	
		$idor=$_POST['idfin'];
		$datos = array('estado'=>'TE');
		$result = $this->Otrabajos->CambioParcials($idor, $datos);
		print_r($result);	
	}

	public function FinalizaOt(){
	
		$idequipo=$_POST['idfin'];
		$fecha = date("Y-m-d");
		$result = $this->Otrabajos->update_cambio($idequipo, $fecha);
		print_r($result);	
	}

	//Cambia de estado a "AN"
	public function baja_predictivo(){
	
		$idpre=$_POST['gloid'];
		
		$datos = array('estado'=>"AN");

		//doy de baja
		$result = $this->Otrabajos->update_predictivo($datos, $idpre);
		if ($result) {
			return true;
		}
		else {
			return false;
		}
	}

	
 
}
