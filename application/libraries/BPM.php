<?php defined('BASEPATH') OR exit('No direct script access allowed');
class BPM
{
  // declaro variables a usar se mandan desde la carga de la libreria
  private $caseId;
  protected $CI;


  public function __construct($idCase = null){

    $this->CI =& get_instance();
    
	}
	
	// Lanza proceso en BPM
	function LanzarProceso($contract)
	{
		//Contrato para lanzar proceso (NO BORRAR PLEASE!!)
			// $contract = array(
			// 	"idSolicitudServicio"	=>	$id_solServicio,
			// 	"idOT"  => 	0
			// );

		//Preparar Ambiente
		$parametros = $this->conexiones();
		$parametros["http"]["method"] = "POST";
		$parametros["http"]["content"] = json_encode($contract);
		$param = stream_context_create($parametros);

		//Lanzar Proceso en Bonita
		$resource = 'API/bpm/process/';
		$url = BONITA_URL.$resource;
		$com = '/instantiation';			
		$body = @file_get_contents($url.BPM_PROCESS_ID.$com, false, $param);

		//Interpretar Responce
		$response = $this->parseHeaders( $http_response_header);
		//dump($response, 'respuesta en libreria: ');		
		$code = $response['response_code'];
		$body  = json_decode($body);
		
		if($code<300){
			return ['status'=>true, 'msj'=>'OK', 'code'=>$code, 'case_id'=> $body->caseId];
		}else {
			return ['status'=>false, 'msj'=> ASP_0100.' | '.$body, 'code'=>'ERROR_BPM('.$code.')'];
		}
	}

	// trae tareas por ID de usuario
	function getToDoList(){

		//Preparar Ambiente
		$parametros = $this->conexiones();
		$param = stream_context_create($parametros);
		
		//Datos Usuario
		$userdata = $this->CI->session->userdata('user_data');
		$usrId= $userdata[0]["userBpm"];		

		//Enviar Request
		$resource = 'API/bpm/humanTask?p=0&c=1000&f=user_id%3D';
		$url = BONITA_URL.$resource.$usrId;
		$body = @file_get_contents($url, false, $param);

		//Interpretar Responce
		$response = $this->parseHeaders( $http_response_header);
		$code = $response['response_code'];

		//Segun el Codigo de Responce
		if($code<300){
			//Transformar datos en Arreglo Asociativo
			$body = json_decode($body,true);
			return ['status'=>true, 'msj'=>'OK', 'code'=>$code, 'data'=>$body];

		}else {
	
			return ['status'=>false, 'msj'=> ASP_0100.' | '.json_decode($body), 'code'=>'ERROR_BPM('.$code.')'];

		}
	}
  // Gestiona Actividaddes desde BPM
  public function ObtenerLineaTiempo($case_id){
    
    $parametros = $this->LoggerAdmin();
		$parametros["http"]["method"] = "GET";
		$param = stream_context_create($parametros);
		$data['listAct'] = $this->ObtenerActividades($case_id, $param);
		$data['listArch'] = $this->ObtenerActividadesArchivadas($case_id, $param);
		return $data;
  }
  // Obtiene Actividades desde BPM por id de caso
  public function ObtenerActividades($caseId,$param){	
	
    $respuesta = file_get_contents(BONITA_URL.'API/bpm/activity?p=0&c=200&f=processId%3D'.BPM_PROCESS_ID.'&f=rootCaseId%3D'.$caseId.'&d=assigned_id',false,$param);
    $array = json_decode($respuesta,true);
		$ord = array();
    foreach ($array as $key=>$value)if($value['type']=='MULTI_INSTANCE_ACTIVITY'){unset($array[$key]);}
    foreach ($array as $key => $value){
        $ord[] = strtotime($value['last_update_date']);
       // $sort['a'][$key] = strtotime($value['last_update_date']);
      //  $sort['b'][$key] = $value['caseId'];
    }
		array_multisort($ord, SORT_DESC, $array);	
    return $array;
  }
  // Obtiene Actividades Archivadas desde BPM por id de caso
  public function ObtenerActividadesArchivadas($caseId,$param){
    $respuesta = file_get_contents(BONITA_URL.'API/bpm/archivedActivity?p=0&c=200&f=processId%3D'.BPM_PROCESS_ID.'&f=rootCaseId%3D'.$caseId.'&d=assigned_id',false,$param);
    $array = json_decode($respuesta,true);
    $ord = array();
    //$sort = array();
    foreach ($array as $key=>$value)if($value['type']=='MULTI_INSTANCE_ACTIVITY'){unset($array[$key]);}
    foreach ($array as $key => $value){
        
        $ord[] = strtotime($value['last_update_date']);
       // $sort['a'][$key] = strtotime($value['last_update_date']);
        //$sort['b'][$key] = $value['caseId'];
    }
    array_multisort($ord, SORT_DESC, $array);
    return $array;
  }
  // Comentarios
  public function ObtenerComentarios($case_id){
    //CONTEXTO
    $parametros = $this->LoggerAdmin();
		$param = stream_context_create($parametros);
		
		//URL Y ENVIO
    $processInstance = 'processInstanceId%3D'.$case_id;
		$result = file_get_contents(BONITA_URL.'API/bpm/comment?f='.$processInstance.'&o=postDate%20DESC&p=0&c=200&d=userId',false,$param);
		
		//RETORNO RESULTADO
		return json_decode($result,true);
	}		
	//Guardar Comentarios
  public function GuardarComentario($comentario){
    
		$parametros = $this->conexiones();

    // Cambio el metodo de la cabecera a "PUT"
    $parametros["http"]["method"] = "POST";
    $parametros["http"]["content"] = json_encode($comentario);
    // Variable tipo resource referencia a un recurso externo.
    $param = stream_context_create($parametros);
    $response = file_get_contents(BONITA_URL.'API/bpm/comment',false,$param);
    
    echo json_encode($response);
  }	
	// trae usuarios de BPM
  public function ObtenerUsuarios(){

    $parametros = $this->LoggerAdmin();
		$parametros["http"]["method"] = "GET";		 
    $param = stream_context_create($parametros);    
		$resource = 'API/identity/user?p=0&c=50';	 	
	 	$url = BONITA_URL.$resource;
		$usrs = file_get_contents($url, false, $param);
    return json_decode($usrs,true);
	}
	// Devuelve usuarios id de susario por nombre 
	public function getUser($user){

		$list = $this->ObtenerUsuarios();
		foreach ($list as $o) {
			if($o['userName']==$user) 
			return $o['id'];
		}
		return null;
	}
	// Con usrId local devuelve usr en BPM
	public function getInfoSisUserenBPM($usrId){
	
		$CI =& get_instance();
		$CI->load->database();
		$CI->db->select('sisusers.usrNick');
		$CI->db->from('sisusers');
		$CI->db->where('sisusers.usrId', $usrId);
		$query = $CI->db->get();
		$usrNick =  $query->row('usrNick');

		$idUsrBPM = $this->getUser(	$usrNick);	
		return $idUsrBPM;
	}	

	public function ObtenerTaskidXNombre($case_id,$nombre){
		$parametros = $this->LoggerAdmin();
		$parametros["http"]["method"] = "GET";		 
		$param = stream_context_create($parametros);
		
		$actividades = $this->ObtenerActividades($case_id,$param);	
		if($actividades == null) return 0;

		for ($i=0; $i < count($actividades); $i++) { 				
			if ($actividades[$i]["displayName"] == $nombre) {
				return $actividades[$i]["id"];
			}
		}
		return 0;
	}

  public function setUsuario($tarea_id, $user_id){
		$parametros = $this->LoggerAdmin();
		$parametros["http"]["method"] = "PUT";
		$contract = array (
			"assigned_id"	=>	$user_id
		);	
		
		log_message('DEBUG', 'TRAZA | Contract: '.$contract);

		$parametros["http"]["content"] = json_encode($contract);
		$param = stream_context_create($parametros);		

		$resource = 'API/bpm/humanTask/';
		$url = BONITA_URL.$resource.$tarea_id;

		log_message('DEBUG', 'TRAZA | URL del Servicio: '.$url);

		$body = @file_get_contents($url, false, $param);
		$response = $this->parseHeaders($http_response_header);

		$code = $response['response_code'];

		log_message('DEBUG', 'TRAZA | Code Respuesta: '.$code);
		log_message('DEBUG', 'TRAZA | Body de Respuesta: '.json_decode($body));

		if($code<300){
			return ['status'=>true, 'msj'=>'OK', 'code'=>$code];
		}else {
			return ['status'=>false, 'msj'=> ASP_0101.' | '.json_decode($body), 'code'=>'ERROR_BPM('.$code.')'];
		}
	}

	function CerrarTareaBPM($idTarBonita,$data=null){
		// trae la cabecera
		$parametros = $this->LoggerAdmin();
		// Cambio el metodo de la cabecera a "PUT"
		$parametros["http"]["method"] = "POST";
		if($data)$parametros["http"]["content"] = json_encode($data);
		// Variable tipo resource referencia a un recurso externo.
		$param = stream_context_create($parametros);

		//SEND
		$method = '/execution';
		$resource = 'API/bpm/userTask/';
		$url = BONITA_URL.$resource.$idTarBonita.$method;
		$body = @file_get_contents($url, false, $param);
		$response = $this->parseHeaders( $http_response_header);

		$code = $response['response_code'];
		if($code<300){
			return ['status'=>true, 'msj'=>'OK', 'code'=>$code];
		}else {
			return ['status'=>false, 'msj'=> ASP_0100.' | '.json_decode($body), 'code'=>'ERROR_BPM('.$code.')'];
		}
	}

	function parseHeaders( $headers ){
		$head = array();
		foreach( $headers as $k=>$v ){
			$t = explode( ':', $v, 2 );
			if( isset( $t[1] ) )
				$head[ trim($t[0]) ] = trim( $t[1] );
			else{
				$head[] = $v;
				if( preg_match( "#HTTP/[0-9\.]+\s+([0-9]+)#",$v, $out ) )
					$head['response_code'] = intval($out[1]);
			}
		}
		return $head;
	}


  function LoggerAdmin(){	


		$usrNick = BPM_ADMIN_USER;
		//dump_exit($userdata);
		// Array de parametros (cabecera HTTP)
		$opciones = array(
		  'http'=>array(
		    'method'=>"POST",
		    'header'=>"Path=/bonita". 
		               "HttpOnly"						 			
		  )
		);

		$contexto = stream_context_create($opciones);

			$data = array(
					'username'=>$usrNick,
					'password'=> BPM_ADMIN_PASS,
					'redirect'=>'false'
					);
			$url = http_build_query( $data );
			$url = BONITA_URL.'loginservice?'.$url;
			file_get_contents($url, false, $contexto);	


		$cookies = array();
		foreach ($http_response_header as $hdr) {
		    if (preg_match('/^Set-Cookie:\s*([^;]+)/', $hdr, $matches)) {
		        parse_str($matches[1], $tmp);
		        $cookies += $tmp;
		    }
		}

		// extrae cookies para que sea dinamico el cambio
			$idsesion      = $cookies['JSESSIONID'];
			$bonita_tenant = $cookies['bonita_tenant'];
			$apiToken      = $cookies['X-Bonita-API-Token'];		

			$parametros = array(
			  'http'=>array(
			    'method'=>"GET",
			    'header'=> 	
				"X-Bonita-API-Token: ".$apiToken."\r\n".
			    "Cookie: JSESSIONID=".$idsesion."\r\n".
			    			"X-Bonita-API-Token=".$apiToken."\r\n".
			    			"bonita_tenant=".$bonita_tenant."\r\n".
							"Content-Type: application/json"."\r\n"	
			  )
			);
			
			return $parametros;	
	}

  function conexiones(){	

		$userdata = $this->CI->session->userdata('user_data');
		$usrNick= $userdata[0]["usrNick"];

		// Array de parametros (cabecera HTTP)
		$opciones = array(
		  'http'=>array(
		    'method'=>"POST",
		    'header'=>"Path=/bonita". 
		               "HttpOnly"						 			
		  )
		);

		$contexto = stream_context_create($opciones);

			$data = array(
					'username'=>$usrNick,
					'password'=> BPM_USER_PASS,
					'redirect'=>'false'
					);
			$url = http_build_query( $data );
			$url = BONITA_URL.'loginservice?'.$url;
			file_get_contents($url, false, $contexto);	


		$cookies = array();
		foreach ($http_response_header as $hdr) {
		    if (preg_match('/^Set-Cookie:\s*([^;]+)/', $hdr, $matches)) {
		        parse_str($matches[1], $tmp);
		        $cookies += $tmp;
		    }
		}

		// parametro con cokies para comprobar
			// $jsoncokies = json_encode($cookies);
			// var_dump($jsoncokies);	

		// extrae cookies para que sea dinamico el cambio
			$idsesion      = $cookies['JSESSIONID'];
			$bonita_tenant = $cookies['bonita_tenant'];
			$apiToken      = $cookies['X-Bonita-API-Token'];		

			$parametros = array(
			  'http'=>array(
			    'method'=>"GET",
			    'header'=> 	
				"X-Bonita-API-Token: ".$apiToken."\r\n".
			    "Cookie: JSESSIONID=".$idsesion."\r\n".
			    			"X-Bonita-API-Token=".$apiToken."\r\n".
			    			"bonita_tenant=".$bonita_tenant."\r\n".
							"Content-Type: application/json"."\r\n"	
			  )
			);
			
			return $parametros;
	}

}