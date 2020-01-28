<?php defined('BASEPATH') or exit('No direct script access allowed');

class Mapa extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        //   $this->load->helper('file');
        $this->load->model('Mapas');
        // $this->load->libraries('BPM');        
    }

    public function index($permission)
    {
        // $this->load->library('BPM');      
        // var_dump($this->BPM->getUser(12));
        // var_dump("hecho");
        // var_dump($this->bpm->getUsuariosBPM());
        // var_dump("hecho");
        
        $data['gpsOT']       = $this->Mapas->getCoordOT();
        // var_dump($data['gpsOT']);
        $data['permission'] = $permission;
        $this->load->view('mapa/Mapa', $data);
    }

    // retorna formulario de arbol por info_id
    function getDetalle()
    {
        $id = $this->input->post('id');
        $data['html'] = json_decode($this->Mapas->Detalles($id))->formulario;

        // transforma el json traido del DS en un html que se inserta en el modal formulario
        $data['html'] =  form($data['html']);
        echo json_encode($data);
    }

    function getImagen()
    {
        $id = $this->input->post('id');
        $data['html'] = json_decode($this->Mapas->Imagen($id))->imagenes->imagen;

        echo json_encode($data);
    }

    public function getOperarios()
    {
        // $estado = $this->Reporteordenes->getestados();
        $this->load->library('BPM');
        // var_dump("hecho");
        // $operarios = $this->Mapas->getOperarios();
        var_dump($this->bpm->getUsuariosBPM());
        // if ($operarios) {
        //     $arre = array();
        //     foreach ($operarios as $row) {
        //         $arre[] = $row;
        //     }
        //     echo json_encode($arre);
        // } else {
        //     echo json_encode(0);
        // }
    }
}
