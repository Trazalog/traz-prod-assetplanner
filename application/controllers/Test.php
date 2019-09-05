<?php defined('BASEPATH') or exit('No direct script access allowed');

class Test extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();
        $this->load->model(FRM . 'Forms');

    }

    public function lp($pemaId)
    {
        $contract = [
            'pIdPedidoMaterial' => $pemaId,
        ];

        $rsp = $this->bpm->lanzarProceso(BPM_PROCESS_ID_PEDIDOS_NORMALES, $contract);

        echo json_encode($rsp);

    }

    public function form($id)
    {
        echo $this->Forms->guardar($id);
    }

}
