<?php defined('BASEPATH') or exit('No direct script access allowed');

class Test extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();
        $this->load->model(FRM.'Forms');

    }
    
    public function form($id)
    {
       echo $this->Forms->guardar($id);
    }
    
}
