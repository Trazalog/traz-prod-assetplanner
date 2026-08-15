<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

/**
 * Pedidos de materiales del flujo ejecutar-OT.
 *
 * F5 (REQ-ASSET-ALM): esta clase dejó de escribir en el espejo local
 * `alm_pedidos_materiales` (MariaDB) — los pedidos viven en el almacén de
 * traz-tools (PostgreSQL) y se operan vía REST contra ALMDataService.
 * El proceso Bonita es el MISMO de siempre (BPM_PROCESS_ID_PEDIDOS_NORMALES,
 * compartido con tools — decisión D6): asset lo lanza con su propia librería BPM.
 * Lo único que sigue local es la lectura de los insumos declarados en la OT
 * (`tbl_otinsumos`), que es dato de asset.
 */
class Pedidos_Materiales extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('tools');
    }

    /** GET al DataService, devuelve el JSON decodificado como array asociativo. */
    private function apiGet($path)
    {
        $aux = $this->rest->callAPI('GET', REST_TOOLS_ALM . $path);
        return json_decode($aux['data'], true);
    }

    /**
     * Escritura contra el DataService. El DSS exige la envoltura
     * `_<metodo><path con / reemplazada por _>` en el body JSON
     * (verificado en el smoke de F3 con `_posttablas`).
     */
    private function apiWrite($metodo, $path, $params)
    {
        $wrapper = '_' . strtolower($metodo) . str_replace('/', '_', ltrim($path, '/'));
        $body    = json_encode(array($wrapper => $params));
        $headers = array('Content-Type: application/json', 'Accept: application/json');
        return $this->rest->callAPI($metodo, REST_TOOLS_ALM . $path, $body, $headers);
    }

    /** Normaliza la lista {root:{item:[...]}} del DSS (objeto único → lista). */
    private function lista($resp, $root, $item)
    {
        if (empty($resp[$root][$item])) {
            return array();
        }
        $rows = $resp[$root][$item];
        return isset($rows[0]) ? $rows : array($rows);
    }

    /**
     * Pedidos de una OT (o de la empresa si $ot es null), con las claves que
     * esperan las vistas del modal ejecutar-OT.
     */
    public function getListado($ot = null)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Pedidos_Materiales | getListado($ot)");
        $emprId = tools_empr_id();
        if ($emprId === null) {
            return array();
        }

        if ($ot) {
            $resp    = $this->apiGet('/pedidos/orden/' . $ot . '/' . $emprId);
            $pedidos = $this->lista($resp, 'pedidos', 'pedido');
            // la descripción de la OT es dato de asset (MariaDB)
            $descOT = $this->db->select('descripcion')->from('orden_trabajo')
                ->where('id_orden', $ot)->get()->row('descripcion');
        } else {
            $resp    = $this->apiGet('/pedidos/empresa/' . $emprId);
            $pedidos = $this->lista($resp, 'pedidos', 'pedido');
            $descOT  = null;
        }

        $out = array();
        foreach ($pedidos as $p) {
            $out[] = array(
                'id_notaPedido' => $p['pema_id'],
                'fecha'         => $p['fecha'],
                'id_ordTrabajo' => isset($p['ortr_id']) ? $p['ortr_id'] : $ot,
                'justificacion' => isset($p['justificacion']) ? $p['justificacion'] : '',
                'estado'        => $p['estado'],
                'descripcion'   => $descOT,
            );
        }
        return $out;
    }

    /**
     * Lanza el proceso Bonita del pedido (el mismo que usa tools) y deja el
     * pedido Solicitado con su case_id.
     */
    public function pedidoNormal($pemaId)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Pedidos_Materiales | pedidoNormal($pemaId)");
        $contract = array('pIdPedidoMaterial' => $pemaId);

        $rsp = $this->bpm->lanzarProceso(BPM_PROCESS_ID_PEDIDOS_NORMALES, $contract);

        if (!$rsp['status']) {
            return $rsp;
        }

        $rsp['data']['pemaId'] = $pemaId;

        $this->setCaseId($pemaId, $rsp['data']['caseId'], 'Solicitado');

        return $rsp;
    }

    function listado()
    {
        return $this->getListado(null);
    }

    /**
     * Detalle de un pedido (artículos con nombre y resto), desde tools.
     */
    public function obtener($id)
    {
        log_message('DEBUG', '#TRAZA | ASSET | Pedidos_Materiales | obtener(' . $id . ')');
        $resp = $this->apiGet('/pedidos/detalle/' . $id);
        return $this->lista($resp, 'detalles', 'detalle');
    }

    public function eliminar($id)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Pedidos_Materiales | eliminar($id)");
        $this->apiWrite('DELETE', '/pedidos/detalle', array('pema_id' => (string) $id));
        $aux = $this->apiWrite('DELETE', '/pedidos', array('pema_id' => (string) $id));
        return $aux['status'];
    }

    /**
     * Pedido existente de una OT. Devuelve un objeto con pema_id (como el
     * first_row() original) o null si la OT no tiene pedido.
     */
    public function getPedidoMaterialesOT($ot)
    {
        $emprId = tools_empr_id();
        if ($emprId === null) {
            return null;
        }
        $resp    = $this->apiGet('/pedidos/orden/' . $ot . '/' . $emprId);
        $pedidos = $this->lista($resp, 'pedidos', 'pedido');
        return empty($pedidos) ? null : (object) $pedidos[0];
    }

    /** Crea el pedido (cabecera) en tools y devuelve el pema_id nuevo. */
    public function crear($ot)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Pedidos_Materiales | crear($ot)");
        $aux  = $this->apiWrite('POST', '/pedidos/orden', array(
            'ortr_id' => (string) $ot,
            'estado'  => 'Creada',
            'empr_id' => (string) tools_empr_id(),
        ));
        $resp = json_decode($aux['data'], true);
        return isset($resp['respuesta']['pema_id']) ? (int) $resp['respuesta']['pema_id'] : false;
    }

    public function setEstado($id, $estado)
    {
        $this->apiWrite('PUT', '/pedidos/estado', array(
            'estado'  => $estado,
            'pema_id' => (string) $id,
        ));
    }

    public function setCaseId($id, $case, $estado = 'Solicitado')
    {
        $this->apiWrite('PUT', '/pedidos/caseid', array(
            'case_id' => (string) $case,
            'estado'  => $estado,
            'pema_id' => (string) $id,
        ));
    }

    /**
     * Insumos declarados en la OT — dato de ASSET, sigue en MariaDB.
     * El artId guardado es el arti_id del catálogo de tools (F3).
     */
    public function getInsumosOT($ot)
    {
        $this->db->select('artId as arti_id, cantidad');
        $this->db->where('otId', $ot);
        return $this->db->get('tbl_otinsumos')->result();
    }

    /**
     * Crea en tools el pedido completo (cabecera + detalle con resto=cantidad)
     * a partir de los insumos declarados en la OT.
     */
    public function crearPedidoOT($ot)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Pedidos_Materiales | crearPedidoOT($ot)");
        $result = $this->getInsumosOT($ot);

        if (!$result) {
            return false;
        }

        $pema_id = $this->crear($ot);
        if (!$pema_id) {
            return false;
        }

        foreach ($result as $o) {
            $this->apiWrite('POST', '/pedidos/detalle/orden', array(
                'cantidad' => (string) $o->cantidad,
                'pema_id'  => (string) $pema_id,
                'arti_id'  => (string) $o->arti_id,
            ));
        }

        return $pema_id;
    }

    /**
     * Relanza pedidos que quedaron Creada sin case_id (bug histórico del
     * lanzamiento). Ahora contra los pedidos de tools.
     */
    public function reLanzaPedidosErroneos()
    {
        log_message('DEBUG', '#TRAZA | ASSET | Pedidos_Materiales | reLanzaPedidosErroneos()');
        $emprId = tools_empr_id();
        if ($emprId === null) {
            return;
        }
        $resp = $this->apiGet('/pedidos/empresa/' . $emprId);
        foreach ($this->lista($resp, 'pedidos', 'pedido') as $p) {
            if ($p['estado'] === 'Creada' && empty($p['case_id'])) {
                $this->pedidoNormal($p['pema_id']);
            }
        }
    }
}
