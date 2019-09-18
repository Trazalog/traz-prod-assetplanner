<?php defined('BASEPATH') or exit('No direct script access allowed');

class Form extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();
        $this->load->model(FRM . 'Forms');
    }

    public function formCalidad()
    {
        $data['formId'] = SIM_FORMS['eval_ope'];

        $data['list'] = $this->Forms->listado();

        $this->load->view(SIM . 'form-calidad', $data);
        $this->load->view(FRM . 'scripts');
    }

    public function newFormCalidad()
    {
        $data['formId'] = SIM_FORMS['eval_ope'];

        $data['infoId'] = $this->Forms->crear($data['formId']);

        $this->load->view(SIM . 'new-form-calidad', $data);
    }

    public function Obtener_Formulario()
    {
        $infoId = $this->input->post('infoId');

        $data['form'] = $this->Forms->get_form2($infoId);

        $response['html'] = $this->load->view('tareas/viewFormSubtareas', $data, true);

        echo json_encode($response);
    }

    public function guardarFormEval()
    {
        $data = $this->input->post();

        $rsp = $this->Forms->guardarFormEval($data);

        echo json_encode($rsp);
    }

    public function eliminarForm($id)
    {
        echo $this->Forms->eliminar($id);
    }
}
