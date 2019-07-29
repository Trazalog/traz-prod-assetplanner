<?php defined('BASEPATH') OR exit('No direct script access allowed');
if(!function_exists('validaSesion')){

    function validaSesion(){
        
        // vlaidar sesion
        // validar BPm
        $ci =& get_instance();

        if( empty ($ci->session->userdata()) ){
            $ci->load->view('equipo/recarga');
            //print_r('vacia');
            return FALSE;
        }else{
            //print_r('lleno');
            return TRUE;
        }
        
    }
} 
?> 