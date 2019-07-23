<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Test extends CI_Controller {
    function __construct(){

      parent::__construct();
    
      
   }
   function index(){
      
      $this->load->view('test');
      $this->load->view('tareas/scripts/abm_forms');
      $this->load->view('tareas/scripts/validacion_forms');
     
   }

   public function setForm()
   {
      $this->load->model('Forms');

      $this->Forms->setFormInicial(1000,1,777);

      echo 'Formulario Inciado';
   }
}
?>