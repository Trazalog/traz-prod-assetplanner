<?php defined('BASEPATH') OR exit('No direct script access allowed');
class BPM
{
  // declaro variables a usar se mandan desde la carga de la libreria
  private $caseId;
  protected $CI;


  public function __construct($idCase = null){

    $this->caseId = $idCase['caseId'];
    $this->CI =& get_instance();
    $this->CI->load->model('Bonitas');
  }
  // Gestiona Actividaddes desde BPM
  public function ObtenerLineaTiempo(){
    
    $parametros = $this->LoggerAdmin();
		$parametros["http"]["method"] = "GET";
		$param = stream_context_create($parametros);
		$data['listAct'] = $this->ObtenerActividades($this->caseId, $param);
		$data['listArch'] = $this->ObtenerActividadesArchivadas($this->caseId, $param);
		return $data;
  }
  // Obtiene Actividades desde BPM por id de caso
  function ObtenerActividades($caseId,$param){
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
  function ObtenerActividadesArchivadas($caseId,$param){
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
  public function ObtenerComentariosBPM(){
    $parametros = $this->CI->Bonitas->conexiones();
    $param = stream_context_create($parametros);

    $processInstance = 'processInstanceId%3D'.$this->caseId;
		$comentarios = file_get_contents(BONITA_URL.'API/bpm/comment?f='.$processInstance.'&o=postDate%20DESC&p=0&c=200&d=userId',false,$param);
		return json_decode($comentarios,true);
    //return $this->Tareas->ObtenerComentariosBPM($caseId,$param);
  }		
  
  public function GuardarComentario($comentario){
    
    //$comentario = $this->input->post();
    // trae la cabecera
    $parametros = $this->CI->Bonitas->conexiones();

    // Cambio el metodo de la cabecera a "PUT"
    $parametros["http"]["method"] = "POST";
    $parametros["http"]["content"] = json_encode($comentario);
    // Variable tipo resource referencia a un recurso externo.
    $param = stream_context_create($parametros);
    $response = file_get_contents(BONITA_URL.'API/bpm/comment',false,$param);
    
    echo json_encode($response);
  }	
  


  // TODO: SACAR DE ACA Y ACCEDER A TRAVES DE MODELO BONITAS
  /* FUNCIONES DE BPM */
  function LoggerAdmin(){	

		//$userdata = $this->session->userdata('user_data');
		//$usrNick= $userdata[0]["usrNick"];

		$usrNick = 'admin';
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

		// Abre el fichero usando las cabeceras HTTP establecidas arriba
			//  file_get_contents('http://35.239.41.196:8080/bonita/loginservice?username=admin&password=bpm&redirect=false', false, $contexto);
			
			 //file_get_contents('http://192.168.100.112:8080/bonita/loginservice?username=ernesto.clavel&password=bpm&redirect=false', false, $contexto);	

			$data = array(
					'username'=>$usrNick,
					'password'=>'bpm',
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
			// echo "<pre>";
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
			
		//Variable tipo resource referencia a un recurso externo. Ahora en c/metodo para cambiar a distintos metodos(PUT,GET,POST) que usa Bonita. 	
		//$param = stream_context_create($parametros);

		//return $param;	
	}
  /* ./ FUNCIONES DE BPM */
}