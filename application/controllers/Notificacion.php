<?php defined('BASEPATH') or exit('No direct script access allowed');

class Notificacion extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model('Notificaciones');
    }

    //reguistra los usuarios con el token del equipo
    public function registraToken(){
        $token = $_POST['currentToken'];

        $res = $this->Notificaciones->registrarToken($token);
        echo json_encode($res);
    }
}
