<?php defined('BASEPATH') or exit('No direct script access allowed');

class Test extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        return true;
    }

    public function filtro()
    {
       $this->load->model('Calendarios');
      
        $res = $this->Calendarios->opcionesFiltro();
        $data['filtro'] = $res;
        $this->load->view('test1',$data);
    }
}
