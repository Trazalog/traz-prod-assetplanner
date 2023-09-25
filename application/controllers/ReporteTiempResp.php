<?php

    defined('BASEPATH') OR exit('No direct script access allowed');

    class ReporteTiempResp extends CI_Controller {

        public function check_session(){

            $data = $this->session->userdata();
            log_message('DEBUG','#Main/index | Customer >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));
    
            if(empty($data['user_data'][0]['usrName'])){
                log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
                $var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
                $this->session->set_userdata($var);
                $this->session->unset_userdata(null);
                $this->session->sess_destroy();
    
                echo ("<script>location.href='login'</script>");
    
            }else{
                return true;
            }
        }
    

        public function index($permission)
        {
            if($this->check_session()){
                //Console.log("estoy en el controlador");
                
                $this->load->ext_view('reports/tiempoDeRespuesta', 'tiempoDeRespuesta', $view_data);
            }
        }
        

    }

?>