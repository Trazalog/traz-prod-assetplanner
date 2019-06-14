<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Overview extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('Overviews');
        $this->load->model('Bonitas');
    }
    public function index($permission){
        $parametros = $this->Bonitas->LoggerAdmin();
		$parametros["http"]["method"] = "GET";	
		$param = stream_context_create($parametros);
        $data['listAct'] = $this->Overviews->ObtenerActividades(1070,$param);
        $data['listArch'] = $this->Overviews->ObtenerActividadesArchivadas(1070,$param);
        $this->load->view('tareas/view_overviews',$data);
    }
}
?>