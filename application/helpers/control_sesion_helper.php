<?php defined('BASEPATH') OR exit('No direct script access allowed');
		if(!function_exists('validaSesion')){

				function validaSesion(){
				     	log_message('ERROR','DESLOGUEO DEL CULO');
						// validar BPm
						$ci =& get_instance();

						if( empty ($ci->session->userdata()) ){
								$ci->load->view('recarga');								
								return FALSE;
						}else{
							
								return TRUE;
						}
						
				}
		} 

		if(!function_exists('validaSesionBPM')){

				function validaSesionBPM(){
					log_message('ERROR','DESLOGUEO DEL CULO!');
					$ci =& get_instance();
					$ci->load->view('recarga');
				}

		}
?> 