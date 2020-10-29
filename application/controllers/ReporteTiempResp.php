<?php

    defined('BASEPATH') OR exit('No direct script access allowed');

    class ReporteTiempResp extends CI_Controller {

        public function index($permission)
        {
            Console.log("estoy en el controlador");
            $this->load->ext_view('reports/tiempoDeRespuesta', 'tiempoDeRespuesta', $view_data);
        }
        

    }

?>