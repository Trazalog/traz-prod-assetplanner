<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Pedidos extends CI_Model {

  public function xOT($ot)
  {
     $this->db->where('ortr_id', $ot);
     $res = $this->db->get('alm_pedidos_materiales')->result();
     
     if(!$res) return false;

     foreach ($res as $key => $o) {
         $this->db->where('pema_id', $o->pema_id);
         $aux = $this->db->get('alm_deta_pedidos_materiales')->result();
         $res[$key]->detalle = $aux;
     }

     return $res;
  }
}
?>