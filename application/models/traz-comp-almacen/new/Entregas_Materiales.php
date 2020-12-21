<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Entregas_Materiales extends CI_Model
{
    private $tabla = 'alm_entrega_materiales';
    private $key = 'enma_id';
    private $columnas = '*';

    public function __construct()
    {
        parent::__construct();
    }

    function listado($ot = null) {
        $this->db->select('T.enma_id, T.fecha, T.comprobante, T.solicitante');
        $this->db->select('A.pema_id, A.estado, A.ortr_id');
        $this->db->from($this->tabla.' T');
        $this->db->join('alm_pedidos_materiales A','A.pema_id = T.pema_id');
        $this->db->order_by('T.fecha','desc');
        $this->db->where('T.eliminado',0);
        $this->db->where('T.empr_id',empresa());

         if($ot) $this->db->where('A.ortr_id', $ot);

        return $this->db->get()->result_array();
    }

    function getEntregasPedido($pema) {
        $this->db->select('T.enma_id, T.fecha, T.comprobante, T.solicitante');
        $this->db->select('A.pema_id, A.estado, A.ortr_id');
        $this->db->from($this->tabla.' T');
        $this->db->join('alm_pedidos_materiales A','A.pema_id = T.pema_id');
        $this->db->order_by('T.fecha','desc');
        $this->db->where('T.eliminado',0);
        $this->db->where('T.empr_id',empresa());
        
        $this->db->where('A.pema_id', $pema);

        return $this->db->get()->result_array();
    }

    

    public function obtenerDetalles($id)
    {
        $this->db->select('A.barcode, A.descripcion, B.descripcion as deposito, C.codigo as lote, T.cantidad');
        $this->db->from('alm_deta_entrega_materiales T');
        $this->db->join('alm_articulos A','A.arti_id=T.arti_id');
        $this->db->join('alm_depositos B','B.depo_id=T.depo_id');
        $this->db->join('alm_lotes C','C.lote_id=T.lote_id');
        $this->db->order_by('barcode');
        $this->db->where($this->key, $id);
        $this->db->where('T.eliminado',false);
        $this->db->where('T.empr_id',empresa());
        return $this->db->get()->result_array();
    } 

    public function obtenerDetallesPrint($id)
    {
        $this->db->select('T.enma_id, T.dni, T.solicitante, T.destino, T.comprobante, T.fec_alta, T.pema_id, A.cantidad, B.descripcion, C.estado, DE.cantidad as cantEntregada');
        $this->db->from('alm_entrega_materiales T');
        $this->db->join('alm_deta_pedidos_materiales A','A.pema_id=T.pema_id');
        $this->db->join('alm_pedidos_materiales C','C.pema_id=T.pema_id');
				$this->db->join('alm_deta_entrega_materiales DE','DE.enma_id=T.enma_id');
				$this->db->join('alm_articulos B','B.arti_id=A.arti_id');
        $this->db->order_by('T.fecha','desc');
        $this->db->where('T.enma_id', $id);
        $query = $this->db->get();
        if($query->num_rows()!=0)
        {
						$datos = $query->result_array();
            return $datos;
        }
        else
        {
            return false;
        }
    }
}
