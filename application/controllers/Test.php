<?php defined('BASEPATH') or exit('No direct script access allowed');

class Test extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();

    }

    public function index()
    {
        echo (new DateTime())->format('Y-m-d H:i:s');die;
        $array = array(
            0 => array(
                0 => "How was the Food?",
                1 => 3,
                2 => 4,
            ),
            1 => array(
                0 => "How was the first party of the semester?",
                1 => 2,
                2 => 4,
                3 => 0,
            ),
        );

        header("Content-Disposition: attachment; filename=\"demo.xls\"");
        header("Content-Type: application/vnd.ms-excel;");
        header("Pragma: no-cache");
        header("Expires: 0");
        $out = fopen("php://output", 'w');
        foreach ($array as $data) {
            fputcsv($out, $data, "\t");
        }
        fclose($out);
    }
    
    public function close($id, $user = 'admin', $pass = '123traza')
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
