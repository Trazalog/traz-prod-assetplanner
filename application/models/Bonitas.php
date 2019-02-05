<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Bonitas Class
 * Clase para el manejo de Bonita,
 * que extiende de la clase MY_Model.
 */
class Bonitas extends CI_Model
{
	/**
     * __construct()
     * Método constructor de la clase Bonitas.
     *
     * @return  void
     */
	function __construct(){
		parent::__construct();
	}

	/**
     * Login de bonita y creacion de contexto para llamadas a los métodos de API (Conexión al motor de Bonita).
     *
     * @param 	$metodo
     *
     * @return  Resources|Bool  Contexto de flujos de bonita ó false si no se logueó correctamente
     */
	function loginBonita($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			//
	        $opciones = array(
	            'http' => array(
	                'method' => "POST",
	                'header' => "Path=/bonita". 
	                            "HttpOnly"                                   
	            )
	        );
	        //crea un contexto de flujo (devuelve un recurso [contiene una referencia a un recurso externo])
	        $contexto = stream_context_create($opciones);
	        //creo la URL de la solicitud
	        //$bonitaBaseUrl    = 'http://35.239.41.196:8080/bonita/';
	        $data         = array(
	              'username'=>$data['usr'],
	              'password'=>$data['pas'],
	              'redirect'=>'false'
	          	);
	        $url = http_build_query( $data );
			$url = BONITA_URL.'loginservice?'.$url;
			//dump_exit( $url );

	        // Transmite un fichero completo a una cadena
	        /*if (file_get_contents($url, false, $contexto) === false)
	        {
	        	echo "Error al loguearse a Bonita.";
	        	return false;
	        }
	        */
	        file_get_contents($url, false, $contexto);
	        //dump_exit($http_response_header);
	        //la respuesta a esta llamada genera cookies que serán transferidas para las subsiguientes llamadas

	        //guardo la respuesta de bonita en cookies
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
	        //
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
			
	        //devulevo los parametros para ser usados en ejecuciones API REST
	        return $parametros;
	    }
	}

	/**
     * Logout de Bonita (Desconexión al motor de Bonita).
     *
     * @return  Bool  True si se deslogueó o false si hubo algún error.
     */
	function logoutBonita()
	{
		//
        $opciones = array(
            'http' => array(
                'method' => "GET",
                'header' => "Path=/bonita". 
                            "HttpOnly"                                   
            )
        );
        $contexto = stream_context_create($opciones);
        $url = BONITA_URL.'logoutservice?redirect=false';
        if (file_get_contents($url, false, $contexto) === false)
        {
        	echo "Error al desloguearse a Bonita.";
        	return false;
        }
        else
        {
        	return true;
        }
	}

	function conexiones(){	

		$userdata = $this->session->userdata('user_data');
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

	function LoggerAdmin(){	
		//FIXME: PONER USUARIO ADMINISTRADOR!!
		//$userdata = $this->session->userdata('user_data');
		//$usrNick= $userdata[0]["usrNick"];

		//$usrNick = 'admin';
		$usrNick = 'supervisor1';
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

	function getTareas($param){
		$tareas = file_get_contents('http://35.239.41.196:8080/bonita/API/bpm/humanTask?p=0&c=10&f=assigned_id%3D5', false, $param);

		dump_exit($tareas);
	}




}