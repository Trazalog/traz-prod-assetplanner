<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Test extends CI_Controller {
    function __construct(){

      parent::__construct();
      $this->load->model('Users');
      
   }
   function index(){
     
      $this->Users->sessionStart_(['usr'=>'mantenedor1', 'pas'=>'bpm']);
   }
}
?>