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
 	// 	public function guardar_equipo(){
		
		// 	$datos=$_POST['data'];
		// 	$mar=$_POST['marca'];
		// 	$cod=$_POST['codigo'];
		// 	$com=$_POST['comp'];
		// 	$can=$_POST['j'];
		// 	//var_dump($com);
		// 	// $c= $can / 2;
		// 	// $i=1;
		// 	// $j=2;
			

		// 	$result = $this->Equipos->insert_equipo($datos);
		// 	if($result!=0){

		// 		$ultimoId=$this->db->insert_id();
		// 		$arre=array();
		// 		//if($i<$c){
		// 			//if ($com[$i]<$can ) 
		// 			foreach ($com as $row) 
		// 	        {   
		// 	        	//if ($com[$j]<$can )
		// 	        	foreach ($com as $row2) 
		// 	        	 { 
		// 	           		$datos2 = array(
								
		// 			        	'titulo'=>$row, 
		// 			        	'descripcion'=>$row2,
		// 			        	'id_equipo'=>$ultimoId
					        

		// 		    			);
		// 	           		 $result2 = $this->Equipos->insert_equipinfo($datos2);

		// 	           	}
		// 	           	$i++;
		// 	           	$j++;
			        

		// 	        }
		          
	       


		// 	}
			
		// 	print_r(json_encode($result));		
	// }

  	// Agrega equipo nuevo - Listo
	public function guardar_equipo()
	{
		$datos = $_POST['data'];	// todos los datos de equipo
		$mar   = $_POST['marca'];	// marca equipo
		$cod   = $_POST['codigo'];	// nombre del equipo
		
		if(isset($_POST['comp'])){
			$com = $_POST['comp'];	// registros titulo/descripcion
		}
		
		$can    = $_POST['j'];	//cantidad de registros titulo/descripción
		$result = $this->Equipos->insert_equipo($datos);
		
		if($result)
		{
			$ultimoId = $this->db->insert_id(); // ultimo registro insertado en equipos (id_equipos)
			$datos    = array();			
			$j        = 1;
			$long     = (int)$can - 1; // llega hasta 2 comp antes del final

			for ($i = 0; $i < $long ; $i++)
			{ 
				$datos = array(
					'titulo'=>$com[$i], 
					'descripcion'=>$com[$j],
					'id_equipo'=>$ultimoId
				);			 	
				$j = $j+2;
				$i++;
				$result = $this->Equipos->insert_equipinfo($datos);
			}
		}

		print_r(json_encode($result));
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
	
		$idequipo=$_POST['idequipo'];
		
		$datos = array('estado'=>"IN");

		//doy de baja
		$result = $this->Equipos->update_cambio($datos, $idequipo);
		print_r($result);
	
	}

	public function cambio_estado(){
	
		$idequipo=$_POST['idequipo'];
		
		$datos = array('estado'=>"AC");

		//doy de baja
		$result = $this->Equipos->update_estado($datos, $idequipo);
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
		$datos  = $_POST['idscontra'];//contratista		
		$contra = $_POST['idglob'];//idequipo
		$arre   = array();
		
	    if(count($datos) > 0 )
	    {	    		
	        foreach ($datos as $row )
	        {
	        	$datos2 = array(
					'id_equipo'      => $contra, 
					'id_contratista' => $row
				);	
	          	$r1 = $this->Equipos->insert_contratista($datos2);
	        }	    	
		}
		echo json_encode($r1);
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

}
