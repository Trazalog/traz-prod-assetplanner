<?php defined('BASEPATH') or exit('No direct script access allowed');

class Test extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();
     

    }
    public function close($id, $user = 'admin', $pass= '123traza');
    {

        // $this->load->view('test');
        // $this->load->view('tareas/scripts/abm_forms');
        // $this->load->view('tareas/scripts/validacion_forms');
      

        $method = '/execution';

        $resource = 'API/bpm/userTask/';

        $url = 'http://trazalog.com.ar:8080/bonita/' . $resource . $id . $method;

        $rsp = $this->rest->callAPI('POST', $url, null, $this->loggin($user, $pass));

        if (!$rsp['status']) {

            log_message('DEBUG', '#TRAZA | #BPM >> ' . ASP_104);

            return msj(false, ASP_104);

        }

        return msj(true, 'OK');

    }

    public function loggin($user, $pass)
    {
        $data = array(
            'username' => $user,
            'password' => $pass,
            'redirect' => 'false',
        );

        $url = 'http://trazalog.com.ar:8080/bonita/' . 'loginservice';

        $rsp = $this->rest->callAPI('GET', $url, $data, false);

        if (!$rsp['status']) {

            log_message('DEBUG', '#TRAZA | #BPM >> ' . ASP_109);
            //validaSesionBPM();
            return false;

        }

        return $this->bpm->crearHeader($rsp['header']);
    }

    public function setForm()
    {
        $this->load->model('Forms');

        $this->Forms->setFormInicial(1000, 1, 777);

        echo 'Formulario Inciado';
    }
}
