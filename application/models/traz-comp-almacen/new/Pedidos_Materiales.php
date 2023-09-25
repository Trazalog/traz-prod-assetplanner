<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Pedidos_Materiales extends CI_Model
{
    private $tabla = 'alm_pedidos_materiales';
    private $key = 'pema_id';
    private $columnas = '*';

    public function __construct()
    {
        parent::__construct();
    }

    public function getListado($ot = null)
    {
        $this->db->select('T.pema_id as id_notaPedido,T.fecha,T.ortr_id as id_ordTrabajo,orden_trabajo.descripcion,T.justificacion, T.estado');
        $this->db->from('alm_pedidos_materiales T');
        $this->db->join('orden_trabajo', 'T.ortr_id = orden_trabajo.id_orden','left');
        $this->db->where('T.empr_id', empresa());
        if($ot)  $this->db->where('orden_trabajo.id_orden', $ot);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    public function pedidoNormal($pemaId)
    {
        log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|PEDIDOS_MATERIALES|pedidoNormal($pemaId) -> $pemaId:  >> '.json_encode($pemaId));
        $contract = [
            'pIdPedidoMaterial' => $pemaId,
        ];

        $rsp = $this->bpm->lanzarProceso(BPM_PROCESS_ID_PEDIDOS_NORMALES, $contract);
				log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|NEW|PEDIDOS_MATERIALES|pedidoNormal($pemaId)-> $rsp >> '.json_encode($rsp));

				if (!$rsp['status']) {
					log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|PEDIDOS_MATERIALES|pedidoNormal($pemaId) >> ERROR: NO LANZO PROCESO PEDIDO MATERIAL NORMAL');
					$this->eliminar($pemaId);
          return $rsp;
        }

				$this->setCaseId($pemaId, $rsp['data']['caseId']);
				log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|NEW|PEDIDOS_MATERIALES|pedidoNormal($pemaId)-> $rsp["data"]["caseId"] >> '.json_encode($rsp['data']['caseId']));

        $this->setEstado($pemaId, 'Solicitado');

        return $rsp;

    }

    function listado() {
        $this->db->select($this->columnas);
        $this->db->where('eliminado', false);
        return $this->db->get($this->tabla)->result_array();
    }

    public function obtener($id)
    {
        $this->db->select('*');
        $this->db->from('alm_deta_pedidos_materiales T');
        $this->db->join('alm_articulos A', 'A.arti_id = T.arti_id');
        $this->db->where($this->key, $id);
        $this->db->where('T.eliminado', false);
        return $this->db->get()->result_array();
    }

    public function eliminar($id)
    {
        $this->db->where('pema_id', $id);
        $this->db->delete('alm_deta_pedidos_materiales');

        $this->db->where('pema_id', $id);
        return $this->db->delete('alm_pedidos_materiales');

    }

    public function getPedidoMaterialesOT($ot)
    {
        $this->db->where('empr_id', empresa());
        $this->db->where('ortr_id', $ot);
        return $this->db->get($this->tabla)->first_row();
    }

    public function crear($ot)
    {
        $pema = array(
            'fecha' => date('Y-m-d H:i:s'),
            'ortr_id' => $ot,
            'estado' => 'Creada',
            'empr_id' => empresa(),
        );
        $this->db->insert($this->tabla, $pema);
        return $this->db->insert_id();
    }

    public function setEstado($id, $estado)
    {
        $this->db->where('pema_id', $id);
        $this->db->set('estado', $estado);
        $this->db->update($this->tabla);
    }

    public function setCaseId($id, $case)
    {
        $this->db->set('case_id', $case);
        $this->db->where('pema_id', $id);
        $this->db->update('alm_pedidos_materiales');
    }

    public function getInsumosOT($ot)
    {
        $this->db->select('artId as arti_id, cantidad');
        $this->db->where('id_empresa', empresa());
        $this->db->where('otId', $ot);
        return $this->db->get('tbl_otinsumos')->result();
    }

    public function crearPedidoOT($ot)
    {
        $result = $this->getInsumosOt($ot);

        if (!$result) {
            return false;
        }

        $pema_id = $this->crear($ot);

        foreach ($result as $o) {
            $detalle = array(
                'pema_id' => $pema_id,
                'arti_id' => $o->arti_id,
                'cantidad' => $o->cantidad,
                'resto' => $o->cantidad
            );
            $this->db->insert('alm_deta_pedidos_materiales', $detalle);
        }

        return $pema_id;

    }



    /**
	* reLanza Pedidos de materiales Erroneos 
	* @param array
	* @return 
	*/
    //solucion a bug que genera pedido de materiales en estado creado y no solicitado
    public function reLanzaPedidosErroneos()
    {
        log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|PEDIDOS_MATERIALES|reLanzaPedidosErroneos()  >> ');

        //Traigo todos los casos con estado "Creada" y case_id = null
        $this->db->select('*');
        $this->db->from('alm_pedidos_materiales');
        $this->db->where('empr_id', empresa());
        $this->db->where('estado', 'Creada');
        $this->db->where('case_id', null);
        $data = $this->db->get()->result_array();
        //$aux=[];
        //$array=[];

        //Recorro los casos
        for ($i=0; $i < count($data); $i++) { 

            //Filtro por pema_id los que necesito relanzar
            if( ($data[$i]['pema_id'] >  9256 ) && ($data[$i]['pema_id'] < 10821 ))
            {
                $contract = [
                    'pIdPedidoMaterial' => $data[$i]['pema_id'],
                ];
        
                $rsp = $this->bpm->lanzarProceso(BPM_PROCESS_ID_PEDIDOS_NORMALES, $contract);

				if ($rsp['status']) {
				    log_message('DEBUG','#TRAZA|TRAZ-COMP-ALMACEN|NEW|PEDIDOS_MATERIALES|reLanzaPedidosErroneos()-> $rsp >> '.json_encode($rsp));
				    //actualiza el case_id con el del proceso lanzado
                    $this->setCaseId($data[$i]['pema_id'], $rsp['data']['caseId']);
                    //Actualiza el estado a creado
                    $this->setEstado($data[$i]['pema_id'], 'Solicitado');
                }
                else{
                    log_message('ERROR','#TRAZA|TRAZ-COMP-ALMACEN|PEDIDOS_MATERIALES|reLanzaPedidosErroneos() >> ERROR: NO SE RELANZO PROCESO PEDIDO MATERIAL NORMAL');
                }
                //$aux[$i]['pema_id'] = $data[$i]['pema_id'] ;
                //$array = $aux;
            }         
        }
        return $data;   
    }
}