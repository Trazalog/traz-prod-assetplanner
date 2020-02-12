<?php defined('BASEPATH') OR exit('No direct script access allowed');

class  Equipo extends CI_Controller {

    public function __construct()
    {
       parent::__construct();
       $this->load->model('Equipos');
    }

    public function index($permission)
    {
		$userdata           = $this->session->userdata('user_data');
		$data['empresa']    = $userdata[0]['id_empresa'];
		$data['list']       = $this->Equipos->equipos_List();
		$data['permission'] = $permission;
		//dump( $data['list'] );
		$this->load->view('equipo/list', $data);		     
    }

    /********** ELIMINAR EQUIPO **********/
    
    // Da de baja equipos (AN)
    public function baja_equipo()
    {
		$idequipo = $_POST['idequipo'];
		$datos    = array('estado'=>"AN");
		$result   = $this->Equipos->baja_equipos($datos, $idequipo);
		print_r(json_encode($result));	
	}

	/********** EDITAR EQUIPO **********/

	/**
	 * Equipo::getEditar()
	 * Trae info de equipo a editar
	 *
	 * @return 	String 	Json con información del equipo.
	 */
	public function getEditar()
	{
		$idEquipo = $this->input->post('idEquipo');
		$info     = $this->Equipos->getEquipoId($idEquipo); 
		
		//dump_exit($info);
		if($info)
			echo json_encode($info);
		else 
			echo "nada";
	}

	// Trae areas
    public function getarea()
	{
		$area = $this->Equipos->getareas();
		if($area)
		{
			$arre = array();
	        foreach ($area as $row ) 
	        {
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	// Trae procesos
	public function getproceso()
	{
		$proceso = $this->Equipos->getprocesos();
		if($proceso)
		{	
			$arre = array();
	        foreach ($proceso as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	// Trae criticidad
	public function getcriti()
	{
		$criti = $this->Equipos->getcriti();
		if($criti)
		{	
			$arre = array();
	        foreach ($criti as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	// Trae sector/etapa
	public function getetapa()
	{	
		$etapa = $this->Equipos->getetapas();
		if($etapa)
		{	
			$arre = array();
	        foreach ($etapa as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	// Trae grupo
	public function getgrupo()
	{	
		$grupo = $this->Equipos->getgrupos();
		if($grupo)
		{	
			$arre = array();
	        foreach ($grupo as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	//	Trae marcas
	public function getmarca()
	{
		$marca = $this->Equipos->getmarcas();
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

	//	Trae marcas
	public function getcliente()
	{
		$cliente = $this->Equipos->getclientes();
		if($cliente)
		{	
			$arre = array();
	        foreach ($cliente as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}


	//Guarda datos editados
	public function editar_equipo()
	{
		$datos            = $_POST['data'];
		//dump($datos, 'datos a editar: ');
		$id               = $_POST['idEquipo'];	
		$userdata         = $this->session->userdata('user_data');
		$datos['id_empresa'] = $userdata[0]['id_empresa'];
		$result           = $this->Equipos->update_editar($datos,$id);
		print_r(json_encode($result));
		
	}











	//trae asiganciones de contratistas
	public function getContratistasEquipo()
	{
		$id_equipo = $this->input->post('id_equipo');
		//dump_exit($id_equipo, 'id_equipo');
		$info     = $this->Equipos->getContratistasEquipo($id_equipo); 
		echo json_encode($info);
	}










	// Trae contratistas
	public function getcontra()
	{
		$empresa = $this->Equipos->getcontra();
		//echo json_encode($Customers);
		if($empresa)
		{	
			$arre = array();
	        foreach ($empresa as $row ) 
	        {   
	           $arre[] = $row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}
    
    // Trae empresa logueada (Listo)
	public function getempresa(){
		$empresa = $this->Equipos->getempresa();
		echo json_encode($empresa);
	}
   
    public function cargarequipo($permission){ 
    	$userdata = $this->session->userdata('user_data');
		//dump_exit($userdata);
		$data['empresa'] = $userdata[0]['id_empresa'];//unidad insdustrial es una rreglo(hay que ligar unidad productiva con usuario)
        $data['permission'] = $permission;    // envia permisos 
        //$data['id_equipo'] = $idglob;      
        $this->load->view('equipo/view_',$data); //equipo controlador 
    }

    public function getequipoficha(){
		$id=$_POST['idglob'];
		$equipo = $this->Equipos->getequipofichas($id);
		//echo json_encode($Customers);

		if($equipo!=false)
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


	public function getunidad(){
		
		$unidad = $this->Equipos->getunidads();
		
		if($unidad)
		{	
			$arre=array();
	        foreach ($unidad as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}


	
	


	public function getcodigo(){
		$this->load->model('Equipos');
		$codigo = $this->Equipos->getcodigo();

		if($codigo)
		{	
			$arre=array();
	        foreach ($codigo as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function getasegurado(){
		$this->load->model('Equipos');
		$codigo = $this->Equipos->getasegurados();

		if($codigo)
		{	
			$arre=array();
	        foreach ($codigo as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}
	// public function agregar_empresa(){

		//     if($_POST)
		//     {
		//     	$datos=$_POST['parametros'];

		//      	$result = $this->Equipos->agregar_empresa($datos);
		//       	//print_r($this->db->insert_id());
		//       	if($result)
		//       		echo $this->db->insert_id();
		//       	else echo 0;
		//     }
	 //  	}

  	public function agregar_seguro(){

	    if($_POST)
	    {
	    	$datos=$_POST['parametros'];

	     	$result = $this->Equipos->agregar_seguros($datos);
	      	//print_r($this->db->insert_id());
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  	// Agrega unidad industrial y devuelve id de insercion - Listo
  	public function agregar_unidad(){

	    if($_POST)
	    {
	    	$datos=$_POST['datos'];

	     	$result = $this->Equipos->agregar_unidades($datos);
	      	//print_r($this->db->insert_id());
	      	if($result > 0)
	      		echo json_encode($result); // devuelve id de insercion en BD
	      	else echo 0;
	    }
  	}

  	// Agrega las areas nuevas - Listo
  	public function agregar_area(){

	    if($_POST)
	    {
	    	$datos=$_POST['parametros'];

	     	$result = $this->Equipos->agregar_area($datos);
	      	//print_r($this->db->insert_id());
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  	// Agrega criticidad nueva - Listo
  	public function agregar_criti(){

	    if($_POST)
	    {
	    	$datos=$_POST['parametros'];

	     	$result = $this->Equipos->agregar_criti($datos);
	      	//print_r($this->db->insert_id());
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}
  	
  	// Agrega las procesos nuevos - Listo
  	public function agregar_proceso(){

	    if($_POST)
	    {
	    	$datos=$_POST['parametros'];

	     	$result = $this->Equipos->agregar_proceso($datos);
	      	//print_r($this->db->insert_id());
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  	// Agrega sector/etapa nuevos - Listo
  	public function agregar_etapa(){

	    if($_POST)
	    {
	    	$datos=$_POST['parametros'];

	     	$result = $this->Equipos->agregar_etapa($datos);
	      	//print_r($this->db->insert_id());
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}
  	// Agrega las grupos nuevos - Listo
  	public function agregar_grupo(){

	    if($_POST)
	    {
	    	$datos=$_POST['parametros'];

	     	$result = $this->Equipos->agregar_grupos($datos);

	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  	// Agrega las grupos nuevos - Listo
  	public function agregar_marca(){

	    if($_POST)
	    {
	    	$datos=$_POST['parametros'];

	     	$result = $this->Equipos->agregar_marcas($datos);

	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  	// Agrega las grupos nuevos - Listo
  	public function agregar_cliente(){

	    if($_POST)
	    {
	    	$datos=$_POST['parametros'];

	     	$result = $this->Equipos->agregar_clientes($datos);

	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  	// Agrega equipo nuevo - Listo
	public function guardar_equipo()
	{
		//$data     = $this->input->post();
		$userdata = $this->session->userdata('user_data');

		$descripcion         = $this->input->post("descripcion");
		$fecha_ingreso       = $this->input->post("fecha_ingreso");
		//fecha_baja
		$fecha_garantia      = $this->input->post("fecha_garantia");
		$marca               = $this->input->post("marca");
		$codigo              = $this->input->post("codigo");
		$id_hubicacion       = $this->input->post("ubicacion");
		$id_empresa          = $userdata[0]['id_empresa'];
		$id_sector           = $this->input->post("etapa");
		//id_hubicacion
		$id_grupo            = $this->input->post("grupo");
		$id_customer         = $this->input->post("cliente");
		$id_criticidad       = $this->input->post("criticidad");
		$estado              = "AL";
		$fecha_ultimalectura = $this->input->post("fecha_ultima");
		$ultima_lectura      = $this->input->post("ultima_lectura");
		//tipo_horas
		//id-centrodecosto
		//valor_reposicion
		//fecha_reposicion
		//id_proveedor
		//valor
		//comprobante
		$descrip_tecnica     = $this->input->post("destec");
		$id_unidad           = $this->input->post("unin");
		$id_area             = $this->input->post("area");
		$id_proceso          = $this->input->post("proceso");
		$numero_serie        = $this->input->post("numse");

		$data = array(
			'descripcion'         => $descripcion,
			'fecha_ingreso'       => $fecha_ingreso,
			'fecha_garantia'      => $fecha_garantia,
			'marca'               => $marca,
			'codigo'              => $codigo,
			'id_hubicacion'       => $id_hubicacion,
			'id_empresa'          => $id_empresa,
			'id_sector'           => $id_sector,
			'id_grupo'            => $id_grupo,
			'id_customer'         => $id_customer,
			'id_criticidad'       => $id_criticidad,
			'estado'              => $estado,
			'fecha_ultimalectura' => $fecha_ultimalectura,
			'ultima_lectura'      => $ultima_lectura,
			'descrip_tecnica'     => $descrip_tecnica,
			'id_unidad'           => $id_unidad,
			'id_area'             => $id_area,
			'id_proceso'          => $id_proceso,
			'numero_serie'        => $numero_serie
		);
		//dump($data);
		$result = $this->Equipos->insert_equipo($data);

		if($result)
		{
			$ultimoId = $this->db->insert_id(); 
			$nomcodif = $this->codifNombre($ultimoId, $id_empresa); // codificacion de nombre
			$nomcodif = 'equipo'.$nomcodif;
			// $config = [
			// 	"upload_path"   => "./assets/filesequipos",
			// 	'allowed_types' => "png|jpg|pdf|xlsx",
			// 	'file_name'     => $nomcodif
			// ];
			$config = [
				"upload_path"   => "./assets/filesequipos",
				'allowed_types' => "*",
				'file_name'     => $nomcodif
			];

			$this->load->library("upload",$config);
			if ($this->upload->do_upload('inputPDF')) {
				
				$data     = array("upload_data" => $this->upload->data());
				$extens   = $data['upload_data']['file_ext'];//guardo extesnsion de archivo
				$nomcodif = $nomcodif.$extens;
				$adjunto  = array('adjunto' => $nomcodif);
				$response = $this->Equipos->updateAdjuntoEquipo($adjunto,$ultimoId);
			}else{
				$response = false;
			}

			echo json_encode($response);
		} else {
			echo json_encode($result);
		}

	}

	// Codifica nombre de imagen para no repetir en servidor
	// formato "12_6_2018-05-21-15-26-24" idpreventivo_idempresa_fecha(año-mes-dia-hora-min-seg)
	function codifNombre($ultimoId,$empId)
	{
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

	public function mostrar_ventana(){		  
	
		echo $this->load->view('equipo/ventana','' , true);	
	}
	
	public function mostrar_asignar()
	{
		$data['permission'] = $permission;     //envia permisos       
        $this->load->view('equipo/asigna',$data);
	
		// echo $this->load->view('equipo/asigna','' , true);
	
		
	
	}

	
	public function cambio_equipo()
	{
		$idequipo = $_POST['idequipo'];
		$datos    = array('estado'=>"IN");
		$result   = $this->Equipos->update_cambio($datos, $idequipo);
		print_r($result);
	}

	public function cambio_estado()
	{
		$idequipo = $_POST['idequipo'];
		$result   = $this->Equipos->update_estado($idequipo);
		print_r($result);
	}

	// Trae datos de equipo segun id
	public function getpencil(){
		
		$id = $this->input->post('id_equipo');		
		$result = $this->Equipos->getpencil($id);
		print_r(json_encode($result));
	}
	
	public function getdatosficha(){

		$id=$_POST['cod'];
		//print_r($id);
		$result = $this->Equipos->getdatosfichas($id);
		print_r(json_encode($result));

	}

	public function contratista(){

		$ide=$_GET['id_equipo'];
		//print_r($id);
		$result = $this->Equipos->contratista($ide);
		
	}

	public function autocompleteempresa(){
	 
	 if (isset($_GET['term'])){
	  $q = strtolower($_GET['term']);
	  $valores = $this->autocomplete->getAutocompleteempresa($q);
	  echo json_encode($valores);
	 } 
	}


	
	public function getco(){
		
		$this->load->model('Equipos');
		$codi = $this->Equipos->getco($this->input->post());
		if($codi){	
			$arre=array();
        	foreach ($codi as $row ){   
           		$arre[]=$row;
        	}
			echo json_encode($arre);
		}
		else echo "nada";
	}

	public function getinfo(){
		
		$this->load->model('Equipos');
		$info = $this->Equipos->getco($this->input->post());
		if($info)
		{	
			$arre=array();
	        foreach ($info as $row ) 
	        {   
	           $arre[]=$row;
	        }
			echo json_encode($arre);
		}
		else echo "nada";
	}

	//Guarda contratista asignado a equipo
	public function guardarcontra()
	{
		$id_equipo      = $_POST['id_equipo'];//idequipo
		$id_contratista = $_POST['id_contratista'];//contratista		
		$datos          = array(
			'id_equipo'      => $id_equipo, 
			'id_contratista' => $id_contratista
		);	
		$response = $this->Equipos->insert_contratista($datos);
		echo json_encode($response);
	}

	public function delContra()
	{
		$id_contratistaquipo = $_POST['id_contratistaquipo'];
		$response = $this->Equipos->delContra($id_contratistaquipo);
		echo json_encode($response);
	}

	public function agregar_componente(){

	    if($_POST){
	    	$datos=$_POST['datos'];

	     	$result = $this->Equipos->agregar_componente($datos);	    
	      	
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  	public function guardar_ficha(){

	    if($_POST)
	    {
	    	$datos=$_POST['data'];

	     	$result = $this->Equipos->agregar_ficha($datos);
	      	//print_r($this->db->insert_id());
	      	
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  	public function editar_ficha(){

	    if($_POST)
	    {
	    	$datos=$_POST['data'];
	    	$id=$_POST['idglob'];

	     	$result = $this->Equipos->update_ficha($datos, $id);
	      	//print_r($this->db->insert_id());
	      	
	      	if($result)
	      		echo $this->db->insert_id();
	      	else echo 0;
	    }
  	}

  	public function getsolImp(){  

      $id=$_POST['idequip'];
      $result = $this->Equipos->getsolImps($id);

      if($result){ 
        
        $arre['datos']=$result;
       $equipos = $this->Equipos->getequiposseguro($id);
        
        if($equipos)
        {
          $arre['equipos']=$equipos;
        }
        else $arre['equipos']=0;

        $orden = $this->Equipos->getequiposorden($id);
        
        if($orden)
        {
          $arre['orden']=$orden;
        }
        else $arre['orden']=0;


        echo json_encode($arre);
      }
      else echo "nada";


  	}

  	/// Guarda lectura Hugo
  	public function setLectura(){
  		$result = $this->Equipos->setLecturas($this->input->post());
  		echo json_encode($result);
		}
		
	public function setLecturaObservacionEdit(){
		$result = $this->Equipos->setLecturaObservacionEdit($this->input->post());
  		echo json_encode($result);
		}

  	public function getHistoriaLect(){
  		$result = $this->Equipos->getHistoriaLecturas($this->input->post());
  	  	echo json_encode($result);	
  	}

  	public function getEqPorId(){
  		$result = $this->Equipos->getEqPorIds($this->input->post());
  	  	echo json_encode($result);
  	}


  	public function estado_alta()
  	{
  		$datos  = $this->input->post();
  		$result = $this->Equipos->estado_alta( $datos["idequipo"] );
  	  	echo json_encode($result);
  	}

  	public function alta_historial_lectura()
  	{
  		$datos  = $this->input->post();
  		$result = $this->Equipos->alta_historial_lectura( $datos['parametros'] );
  	  	echo json_encode($result);
  	}

  	/**
	 * Equipo:eliminarAdjunto();
	 *
	 * @return Bool 	True si se eliminó el archivo o false si hubo error
	 */
	public function eliminarAdjunto()
	{
		$idEquipo = $this->input->post('idEquipo');
		$response = $this->Equipos->eliminarAdjunto($idEquipo);
		echo json_encode($response);
	}
	
	/**
	 * Equipo:agregarAdjunto();
	 *
	 * @param 
	 * @return String nomre de archivo adjunto
	 */
	public function agregarAdjunto()
	{
		$userdata     = $this->session->userdata('user_data');
		$empId        = $userdata[0]['id_empresa'];

		$idEquipo = $this->input->post('idAgregaAdjunto');

		$nomcodif = $this->codifNombre($idEquipo, $empId); // codificacion de nombre
		$nomcodif = 'equipo'.$nomcodif;
		$config   = [
			"upload_path"   => "./assets/filesequipos",
			'allowed_types' => "png|jpg|pdf|xlsx",
			'file_name'     => $nomcodif
		];

		$this->load->library("upload",$config);
		if ($this->upload->do_upload('inputPDF')) 
		{	
			$data     = array("upload_data" => $this->upload->data());
			$extens   = $data['upload_data']['file_ext'];//guardo extesnsion de archivo
			$nomcodif = $nomcodif.$extens;
			$adjunto  = array('adjunto' => $nomcodif);
			$response = $this->Equipos->updateAdjuntoEquipo($adjunto,$idEquipo);
		}else{
			$response = false;
		}

		echo json_encode($response);
	}

	function asignarMeta(){

		$data = $this->input->post();
		if(!$this->Equipos->asignarMeta($data)){
			echo json_encode(['msj'=>'Error al asinar Meta']);
		}else{
			echo json_encode(['msj'=>'OK']);
		}
	}

}
