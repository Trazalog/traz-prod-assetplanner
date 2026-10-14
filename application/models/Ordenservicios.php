<?php if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Ordenservicios extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    function getOrdServiciosList()
    {
        $userdata = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('
            orden_servicio.id_orden, 
            orden_servicio.estado,
            orden_servicio.comprobante,
            orden_servicio.fecha, 
            orden_servicio.id_ot,
            orden_servicio.fechahorainicio,
            orden_servicio.fechahorafin,
            orden_trabajo.descripcion AS descripcion_ot,
            orden_trabajo.case_id,
            equipos.codigo AS equipo,
            equipos.id_equipo,
            tareas.descripcion AS tarea,
            (SELECT GROUP_CONCAT(CONCAT(su.usrName, " ", su.usrLastName) SEPARATOR ", ") 
             FROM asignausuario au 
             INNER JOIN sisusers su ON au.usrId = su.usrId 
             WHERE au.id_orden = orden_servicio.id_orden) AS recursos_humanos
        ', FALSE);
        /*
        equipos.id_equipo,
        equipos.codigo,
        solicitud_reparacion.id_solicitud,
        solicitud_reparacion.solicitante, 
        solicitud_reparacion.f_solicitado,                     
        solicitud_reparacion.causa,*/
        //TODO: ACA CAMBIE LA QUERY (se tomo id equipos de OT en vez de sol rep)
        $this->db->from('orden_servicio');
        $this->db->join('orden_trabajo', 'orden_servicio.id_ot = orden_trabajo.id_orden');
        $this->db->join('tareas', 'tareas.id_tarea  = orden_trabajo.id_tarea', 'left');
        $this->db->join('equipos', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->where('orden_servicio.id_empresa', $empresaId);
        $this->db->order_by('orden_servicio.id_orden', 'DESC');
        //$this->db->join('solicitud_reparacion', 'orden_servicio.id_solicitudreparacion = solicitud_reparacion.id_solicitud');
        //$this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function getEquipos($data) // FUNCIONA BIEN 
    {
        $id = $data['id_equipo'];
        log_message('DEBUG', '#Main/index | OrdenServicio >getEquipo> id_equipo ' . json_encode($data));
        log_message('DEBUG', '#Main/index | OrdenServicio >getEquipo> id_equipo ' . $id);
        $this->db->select('
            equipos.codigo AS nomb_equipo,                
            equipos.descripcion AS desc_equip,
            equipos.fecha_ingreso,
            equipos.fecha_baja,
            equipos.fecha_garantia,
            equipos.estado,
            equipos.marca,
            grupo.descripcion AS grupo_desc,
            sector.descripcion As sector_desc,
            equipos.ubicacion
            ');
        $this->db->from('equipos');
        $this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo', 'left');
        $this->db->join('sector', 'equipos.id_sector = sector.id_sector');
        $this->db->group_by('equipos.id_equipo');
        $this->db->where('equipos.id_equipo', $id);
        $query = $this->db->get();

        foreach ($query->result_array() as $row) {

            $datos['nomb_equipo'] = $row['nomb_equipo'];
            $datos['desc_equipo'] = $row['desc_equip'];
            $datos['fecha_ingreso'] = $row['fecha_ingreso'];
            $datos['fecha_baja'] = $row['fecha_baja'];
            $datos['fecha_garantia'] = $row['fecha_garantia'];
            $datos['estado'] = $row['estado'];
            $datos['marca'] = $row['marca'];
            $datos['grupo_desc'] = $row['grupo_desc'];
            $datos['sector'] = $row['sector_desc'];
            $datos['ubicacion'] = $row['ubicacion'];
        }

        log_message('DEBUG', '#Main/getEquipos |  datos: ' . json_encode($datos));

        return $datos;
    }



    function getDatosOrdenServicios($data = null) // Ok ¿al pedo?
    {
        $id = $data['id_ordenservicio'];
        $this->db->select('
            orden_servicio.lectura,
            orden_servicio.comprobante,
            contratistas.id_contratista,
            contratistas.nombre');
        $this->db->from('orden_servicio');
        $this->db->join('contratistas', 'contratistas.id_contratista = orden_servicio.id_contratista');
        $this->db->where('orden_servicio.id_solicitudreparacion', $id);
        $query = $this->db->get();
        foreach ($query->result_array() as $row) {
            $data['comprobante'] = $row['comprobante'];
            $data['lectura'] = $row['lectura'];
            $data['contratista'] = $row['nombre'];
            $data['id_contratista'] = $row['id_contratista'];
            return $data;
        }
    }

    function getHerramientas() // Ok
    {
        log_message('DEBUG', "#TRAZA | ASSET | Ordenservicios | getHerramientas()");
        // Mejora: el catálogo del informe sale del pañol de tools (como los
        // planes) y solo muestra las herramientas DISPONIBLES del pañol
        // asignado a la empresa, ordenadas por nombre. Shape del autocomplete
        // del informe: label / value(marca) / codherram / herrId.
        $this->load->helper('tools');
        return tools_herramientas_informe();
    }

    function getOperarios() // Ok
    {
        $userdata = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('sisusers.usrId, sisusers.usrLastName, sisusers.usrname');
        $this->db->join('usuarioasempresa', 'usuarioasempresa.usrId = sisusers.usrId');
        $this->db->from('sisusers');
        $this->db->where('usuarioasempresa.empresaid', $empresaId);
        $this->db->where('usuarioasempresa.estado', 'AC');
        $query = $this->db->get();
        $i = 0;
        foreach ($query->result() as $row) {
            // $equipos[$i]['label'] = $row->usrLastName.", ". $row->usrname ;
            $equipos[$i]['label'] = $row->usrname . ", " . $row->usrLastName;
            $equipos[$i]['value'] = $row->usrId;
            $i++;
        }
        return $equipos;
    }

    function getRRHHOrdenTrabajo($idOT)
    {
        //dump($idOT, 'id de OT en modell');	
        $this->db->select('tbl_listarea.id_usuario,
												sisusers.usrName,
												sisusers.usrLastName');
        $this->db->from('tbl_listarea');
        $this->db->join('sisusers', 'sisusers.usrId = tbl_listarea.id_usuario');
        $this->db->where('tbl_listarea.id_orden', $idOT);
        $query = $this->db->get();
        $i = 0;
        foreach ($query->result() as $row) {
            $equipos[$i]['label'] = $row->usrLastName . ", " . $row->usrName;
            $equipos[$i]['value'] = $row->id_usuario;
            $i++;
        }
        return $equipos;
    }
    function getResponsableOT($idOT)
    {
        $this->db->select('sisusers.usrId,
												sisusers.usrName,
												sisusers.usrLastName');
        $this->db->from('orden_trabajo');
        $this->db->join('sisusers', 'sisusers.usrId = orden_trabajo.id_usuario_a');
        $this->db->where('orden_trabajo.id_orden', $idOT);
        $query = $this->db->get();
        $i = 0;

        foreach ($query->result() as $row) {
            $equipos['label'] = $row->usrLastName . ", " . $row->usrName;
            $equipos['value'] = $row->usrId;
            $i++;
        }
        return $equipos;
    }


    // Devuelve id de Orden Servicios por id de OTrabajo
    function getOServicioPorIdOT($id_ot)
    {

        $this->db->select('orden_servicio.id_orden');
        $this->db->from('orden_servicio');
        $this->db->where('orden_servicio.id_ot', $id_ot);
        $query = $this->db->get();
        $result = $query->row();
        return $result->id_orden;
    }

    // Guarda Informe de Servicios nuevo
    function setOrdenServicios($data)
    {

        $userdata = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId'];     // guarda usuario logueado
        $empresaId = $userdata[0]['id_empresa'];
        ////////// para guardar herramientas 
        if (!empty($data['herramienta'])) {
            $date = $data['fecha'];
            $valeSalHerram = array(
                'fecha' => $date,
                'usrid' => $usrId,
                'id_empresa' => $empresaId
            );
            if (!$this->db->insert('tbl_valesalida', $valeSalHerram)) {
                return $this->db->error(); // Has keys 'code' and 'message'
            }
            $idInsertVale = $this->db->insert_id();

            // detalle herramientas (registro local del informe, para su visualización)
            $herrIds = array();
            for ($i = 0; $i < count($data['herramienta']); $i++) {
                $detavalHerram["valesid"] = $idInsertVale;
                $detavalHerram["herrId"] = $data["herramienta"][$i][3];
                $detavalHerram["id_empresa"] = $empresaId;
                if (!$this->db->insert('tbl_detavalesalida', $detavalHerram)) {
                    return $this->db->error(); // Has keys 'code' and 'message'
                }
                $herrIds[] = $data["herramienta"][$i][3];
            }
            // Mejora: además del registro local, se genera el vale de salida
            // contra el módulo Pañol de tools (descuenta disponibilidad: las
            // herramientas quedan en TRANSITO hasta que se devuelvan).
            $this->load->helper('tools');
            tools_crear_vale_salida($herrIds, array(
                'destino'     => 'Informe de servicio OT ' . (isset($data['id_ot']) ? $data['id_ot'] : ''),
                'comprobante' => isset($data['id_ot']) ? (string) $data['id_ot'] : '',
            ));
        } else {

            $idInsertVale = 0;    // esta ba en 1 hardcode (no puede ser 0 por la clave foranea)
        }
        ////// guarda orden servicio
        $id_equipo = $data['id_equipo'];
        $id_solicitudreparacion = $data['id_solicitudreparacion'];
        $id_ot = $data['id_ot'];
        $horometroinicio = $data['horometro_inicio'];
        $horometrofin = $data['horometro_fin'];
        $fechahorainicio = $data['fecha_inicio'];
        $fechahorafin = $data['fecha_fin'];
        $ord_serv = array(
            'fecha' => date('Y-m-d H:i:s'),
            'id_equipo' => $id_equipo,
            'id_solicitudreparacion' => $id_solicitudreparacion,
            'valesid' => $idInsertVale,
            'id_ot' => $id_ot,
            'estado' => 'C',
            'id_empresa' => $empresaId,
            'fechahorainicio' => $fechahorainicio,
            'fechahorafin' => $fechahorafin,
            'horometroinicio' => $horometroinicio,
            'horometrofin' => $horometrofin,
        );

        if (!$this->db->insert('orden_servicio', $ord_serv)) {
            return $this->db->error(); // Has keys 'code' and 'message'
        }
        $idInsertOrden = $this->db->insert_id();

        // deta orden servicio
        for ($i = 0; $i < count($data['tarea']); $i++) {
            $tarea_id = $data['tarea'][$i][0];
            $tarea = array(
                'id_ordenservicio' => $idInsertOrden,
                'id_tarea' => $tarea_id
            );
            if (!$this->db->insert('deta_ordenservicio', $tarea)) {
                return $this->db->error(); // Has keys 'code' and 'message'
            }
        }

        // ////// guarda Operarios
        if (!empty($data['operario'])) {
            $fechaSist = date('Y-m-d H:i:s');
            for ($i = 0; $i < count($data['operario']); $i++) {
                $asigUsr["usrId"] = $data['operario'][$i][1];
                $asigUsr["id_orden"] = $idInsertOrden;      // id orden servicio
                $asigUsr["fechahora"] = $fechaSist;
                if (!$this->db->insert('asignausuario', $asigUsr)) {
                    return $this->db->error(); // Has keys 'code' and 'message'
                }
            }
        }

        return $idInsertOrden;

    }
    // borra herramientas de Informe Servicios
    function borrarHerramOrden($id_ot)
    {

        $this->db->select('orden_servicio.valesid');
        $this->db->from('orden_servicio');
        $this->db->where('orden_servicio.id_ot', $id_ot);
        $resp = $this->db->get();
        $valeSalId = $resp->row('valesid');
        // si hay Vale salida
        if ($valeSalId) {
            // borra el detalle de vale salida				
            $this->db->where('valesid', $valeSalId);
            $response = $this->db->delete('tbl_detavalesalida');
            // borra vale salida
            $this->db->where('valesid', $valeSalId);
            $response = $this->db->delete('tbl_valesalida');
            return $response;
        } else {
            return TRUE;
        }
    }

    // borra RRHH de Informe de Servicios
    function borrarRecursosOrden($id_ot)
    {

        $this->db->select('orden_servicio.id_orden');
        $this->db->from('orden_servicio');
        $this->db->where('orden_servicio.id_ot', $id_ot);
        $resp = $this->db->get();
        $idOrdServ = $resp->row('id_orden');

        // si hay orden servicios
        if ($idOrdServ) {
            // borra el detalle de vale salida				
            $this->db->where('id_orden', $idOrdServ);
            $response = $this->db->delete('asignausuario');
            return $response;
        } else {
            return TRUE;
        }

    }

    // borra Informe Servicios completo
    function borrarOrden($id_ot)
    {

        $this->db->select('orden_servicio.id_orden');
        $this->db->from('orden_servicio');
        $this->db->where('orden_servicio.id_ot', $id_ot);
        $resp = $this->db->get();
        $idOrdServ = $resp->row('id_orden');

        $this->db->where('id_ordenservicio', $idOrdServ);
        $response = $this->db->delete('deta_ordenservicio');

        // Eliminar adjuntos relacionados
        $this->db->where('id_orden', $idOrdServ);
        $this->db->delete('orden_servicio_adjuntos');

        $this->db->where('id_ordenservicio', $idOrdServ);
        $response = $this->db->delete('deta_ordenservicio');

        if ($response) {
            $this->db->where('id_ot', $id_ot);
            $response = $this->db->delete('orden_servicio');
            return $response;
        } else {
            return $response;
        }

    }

    function getLecturasOrden($id_ot) // Ok FUNCIONANDO BIEN!!!
    {
        $this->db->select('orden_servicio.horometroinicio,
											orden_servicio.horometrofin,
											orden_servicio.fechahorainicio,
											orden_servicio.fechahorafin
											');
        $this->db->from('orden_servicio');
        $this->db->where('orden_servicio.id_ot', $id_ot);
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    function getTareasOrden($id_ot) // Ok FUNCIONANDO BIEN!!!
    {
        $this->db->select('
            deta_ordenservicio.id_tarea
            ');
        $this->db->from('orden_servicio');
        $this->db->join('deta_ordenservicio', 'deta_ordenservicio.id_ordenservicio = orden_servicio.id_orden');
        $this->db->where('orden_servicio.id_ot', $id_ot);
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    function getHerramOrdenes($id_ot) // Ok FUNCIONANDO BIEN!!!
    {
        $this->db->select('herramientas.herrcodigo,
													herramientas.herrmarca,
													herramientas.herrdescrip
											');
        $this->db->from('orden_servicio');
        $this->db->join('tbl_valesalida', 'orden_servicio.valesid = tbl_valesalida.valesid');
        $this->db->join('tbl_detavalesalida', 'tbl_detavalesalida.valesid = tbl_valesalida.valesid');
        $this->db->join('herramientas', 'tbl_detavalesalida.herrId = herramientas.herrId');
        $this->db->where('orden_servicio.id_ot', $id_ot);
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function getOperariosOrden($id_orden)
    {

        $this->db->select('sisusers.usrName,
												sisusers.usrLastName');
        $this->db->from('asignausuario');
        $this->db->join('sisusers', 'asignausuario.usrId = sisusers.usrId');
        $this->db->join('orden_servicio', 'orden_servicio.id_orden = asignausuario.id_orden');
        $this->db->where('orden_servicio.id_ot', $id_orden);
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    // devuelve insumos pedidos por id de OT
    function getInsumosPorOT($id_ot)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Ordenservicios | getInsumosPorOT($id_ot)");
        // F5 (REQ-ASSET-ALM): los pedidos viven en el almacen de tools;
        // se leen via REST (pedido por OT + detalle con nombres de articulo).
        $this->load->helper('tools');
        $emprId = tools_empr_id();
        if ($emprId === null) {
            return array();
        }

        $aux  = $this->rest->callAPI('GET', REST_TOOLS_ALM . '/pedidos/orden/' . $id_ot . '/' . $emprId);
        $resp = json_decode($aux['data'], true);
        $pedidos = isset($resp['pedidos']['pedido']) ? $resp['pedidos']['pedido'] : array();
        if ($pedidos && !isset($pedidos[0])) {
            $pedidos = array($pedidos);
        }

        $out = array();
        foreach ($pedidos as $p) {
            $auxD  = $this->rest->callAPI('GET', REST_TOOLS_ALM . '/pedidos/detalle/' . $p['pema_id']);
            $respD = json_decode($auxD['data'], true);
            $detalles = isset($respD['detalles']['detalle']) ? $respD['detalles']['detalle'] : array();
            if ($detalles && !isset($detalles[0])) {
                $detalles = array($detalles);
            }
            foreach ($detalles as $d) {
                // Consumo real (mejora): el detalle del pedido trae la cantidad
                // pedida y el `resto` pendiente de entregar. Lo entregado (el
                // consumo real) es pedido - resto.
                $pedido    = (float) $d['cantidad'];
                $pendiente = isset($d['resto']) ? (float) $d['resto'] : $pedido;
                $entregado = $pedido - $pendiente;
                $out[] = array(
                    'pema_id'     => $p['pema_id'],
                    'ortr_id'     => $p['ortr_id'],
                    'barcode'     => $d['barcode'],
                    'descripcion' => $d['descripcion'],
                    'fecha'       => $p['fecha'],
                    'estado'      => $p['estado'],
                    'cantidad'    => $d['cantidad'],
                    'pedido'      => $pedido,
                    'entregado'   => $entregado,
                    'pendiente'   => $pendiente,
                );
            }
        }
        return $out;
    }

    /**
     * F4 REQ-ASSET-ALM: entregas (parciales/totales) de los pedidos de una OT,
     * leidas del almacen de tools. Devuelve, por pedido, su lista de entregas y
     * el detalle de cada una (articulo, cantidad, lote, deposito; sin precio).
     */
    function getEntregasPorOT($id_ot)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Ordenservicios | getEntregasPorOT($id_ot)");
        $this->load->helper('tools');
        $emprId = tools_empr_id();
        if ($emprId === null) {
            return array();
        }
        $aux  = $this->rest->callAPI('GET', REST_TOOLS_ALM . '/pedidos/orden/' . $id_ot . '/' . $emprId);
        $resp = json_decode($aux['data'], true);
        $pedidos = isset($resp['pedidos']['pedido']) ? $resp['pedidos']['pedido'] : array();
        if ($pedidos && !isset($pedidos[0])) {
            $pedidos = array($pedidos);
        }
        $out = array();
        foreach ($pedidos as $p) {
            $pema = isset($p['pema_id']) ? $p['pema_id'] : null;
            $entregas = tools_entregas_pedido($pema);
            foreach ($entregas as $k => $e) {
                $enma = isset($e['enma_id']) ? $e['enma_id'] : null;
                $entregas[$k]['detalle'] = tools_entrega_detalle($enma);
            }
            $out[] = array(
                'pema_id'  => $pema,
                'estado'   => isset($p['estado']) ? $p['estado'] : '',
                'fecha'    => isset($p['fecha']) ? $p['fecha'] : '',
                'entregas' => $entregas,
            );
        }
        return $out;
    }

    /**
     * F5 REQ-ASSET-ALM: herramientas usadas en la OT, construidas desde los
     * vales de panol asociados. Lee las tablas de asset (directo) y enriquece
     * con el catalogo de panol de tools; calcula los dias de uso (desde la
     * salida hasta la devolucion, o hasta hoy si no volvio).
     */
    function getHerramientasUsadas($id_ot)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Ordenservicios | getHerramientasUsadas($id_ot)");
        $this->load->helper('tools');
        $emprId = tools_empr_id();
        if ($emprId === null) {
            return array();
        }
        $empresaAsset = empresa();
        // lista de asset (tabla propia) + origen del vale
        $this->db->select('u.herrId, u.sapa_id, u.activa, v.origen');
        $this->db->from('tbl_otherramientasusadas u');
        $this->db->join('tbl_otvales v', 'v.sapa_id = u.sapa_id AND v.id_empresa = u.id_empresa', 'left');
        $this->db->where('u.otId', $id_ot);
        $this->db->where('u.id_empresa', $empresaAsset);
        $rows = $this->db->get()->result_array();
        if (!$rows) {
            return array();
        }
        // catalogo de panol para nombres/marca (mapa herr_id -> datos)
        $cat = array();
        foreach (tools_herramientas() as $h) {
            if (isset($h['herr_id'])) {
                $cat[(string) $h['herr_id']] = $h;
            }
        }
        // cache de fecha de salida por vale
        $salidas = array();
        $out = array();
        foreach ($rows as $r) {
            $sapa = $r['sapa_id'];
            if (!isset($salidas[$sapa])) {
                $salidas[$sapa] = tools_salida_fecha($sapa);
            }
            $fsalida = isset($salidas[$sapa]['fecha']) ? $salidas[$sapa]['fecha'] : null;
            $fdevol  = tools_devolucion_herramienta($r['herrId'], $fsalida);
            $h = isset($cat[(string) $r['herrId']]) ? $cat[(string) $r['herrId']] : array();
            $out[] = array(
                'herrId'      => $r['herrId'],
                'sapa_id'     => $sapa,
                'origen'      => $r['origen'] ? $r['origen'] : 'MANTENEDOR',
                'activa'      => (int) $r['activa'],
                'codigo'      => isset($h['codigo']) ? $h['codigo'] : '',
                'descripcion' => isset($h['descripcion']) ? $h['descripcion'] : ('herr ' . $r['herrId']),
                'marca'       => isset($h['marca']) ? $h['marca'] : '',
                'salida'      => $fsalida,
                'devolucion'  => $fdevol,
                'dias'        => tools_dias_entre($fsalida, $fdevol),
            );
        }
        return $out;
    }

    /**
     * Asocia un vale de panol (y sus herramientas) a una OT. Definicion 5:
     * un vale, una sola OT -> la unique de tbl_otvales evita duplicar.
     * $origen: PANOLERO | MANTENEDOR | SUPERVISOR (quien lo asocia).
     * Devuelve array('ok'=>bool,'msg'=>str,'herr'=>int).
     */
    function asociarVale($otId, $sapa, $origen)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Ordenservicios | asociarVale($otId,$sapa,$origen)");
        $this->load->helper('tools');
        $otId = (int) $otId;
        $sapa = (int) $sapa;
        $origen = in_array($origen, array('PANOLERO', 'MANTENEDOR', 'SUPERVISOR')) ? $origen : 'MANTENEDOR';
        if (!$otId || !$sapa) {
            return array('ok' => false, 'msg' => 'Faltan datos (OT o vale).', 'herr' => 0);
        }
        $empresaAsset = empresa();
        $userdata = $this->session->userdata('user_data');
        $usrId = isset($userdata[0]['usrId']) ? (int) $userdata[0]['usrId'] : 0;

        // Definicion 5: el vale no puede estar ya asociado a OTRA OT.
        $ya = $this->db->select('otId')
            ->from('tbl_otvales')
            ->where('sapa_id', $sapa)
            ->where('id_empresa', $empresaAsset)
            ->get()->row_array();
        if ($ya) {
            if ((int) $ya['otId'] === $otId) {
                return array('ok' => false, 'msg' => 'Este vale ya esta asociado a esta OT.', 'herr' => 0);
            }
            return array('ok' => false, 'msg' => 'El vale ya esta asociado a la OT ' . $ya['otId'] . '.', 'herr' => 0);
        }

        $herrs = tools_herramientas_de_vale($sapa);
        if (!$herrs) {
            return array('ok' => false, 'msg' => 'El vale no tiene herramientas.', 'herr' => 0);
        }

        $this->db->trans_start();
        $this->db->insert('tbl_otvales', array(
            'otId'       => $otId,
            'sapa_id'    => $sapa,
            'origen'     => $origen,
            'usrId'      => $usrId,
            'fecha'      => date('Y-m-d H:i:s'),
            'id_empresa' => $empresaAsset,
        ));
        $n = 0;
        foreach ($herrs as $h) {
            $herrId = (int) $h['herr_id'];
            $existe = $this->db->select('otherrusada_id')
                ->from('tbl_otherramientasusadas')
                ->where('otId', $otId)
                ->where('herrId', $herrId)
                ->where('sapa_id', $sapa)
                ->where('id_empresa', $empresaAsset)
                ->get()->row_array();
            if (!$existe) {
                $this->db->insert('tbl_otherramientasusadas', array(
                    'otId'       => $otId,
                    'herrId'     => $herrId,
                    'sapa_id'    => $sapa,
                    'activa'     => 1,
                    'id_empresa' => $empresaAsset,
                ));
                $n++;
            }
        }
        $this->db->trans_complete();
        if ($this->db->trans_status() === false) {
            return array('ok' => false, 'msg' => 'No se pudo asociar el vale.', 'herr' => 0);
        }
        return array('ok' => true, 'msg' => 'Vale asociado.', 'herr' => $n);
    }

    /**
     * Quita un vale asociado y sus herramientas usadas. Definicion 8:
     * el MANTENEDOR solo quita lo que el asocio (origen MANTENEDOR);
     * el SUPERVISOR puede quitar ademas los vales del PANOLERO.
     * $rolActor: MANTENEDOR | SUPERVISOR.
     */
    function quitarVale($otId, $sapa, $rolActor)
    {
        log_message('DEBUG', "#TRAZA | ASSET | Ordenservicios | quitarVale($otId,$sapa,$rolActor)");
        $otId = (int) $otId;
        $sapa = (int) $sapa;
        $empresaAsset = empresa();
        if (!$otId || !$sapa) {
            return array('ok' => false, 'msg' => 'Faltan datos.');
        }
        $vale = $this->db->select('origen')
            ->from('tbl_otvales')
            ->where('otId', $otId)
            ->where('sapa_id', $sapa)
            ->where('id_empresa', $empresaAsset)
            ->get()->row_array();
        if (!$vale) {
            return array('ok' => false, 'msg' => 'El vale no esta asociado a esta OT.');
        }
        $origen = $vale['origen'];
        // Permisos definicion 8 (control en servidor, no solo en la vista).
        $permitido = array('MANTENEDOR' => array('MANTENEDOR'),
                           'SUPERVISOR' => array('SUPERVISOR', 'PANOLERO'));
        $rolActor = isset($permitido[$rolActor]) ? $rolActor : 'MANTENEDOR';
        if (!in_array($origen, $permitido[$rolActor])) {
            return array('ok' => false, 'msg' => 'No tiene permiso para quitar este vale (' . $origen . ').');
        }
        $this->db->trans_start();
        $this->db->where('otId', $otId)->where('sapa_id', $sapa)
                 ->where('id_empresa', $empresaAsset)->delete('tbl_otherramientasusadas');
        $this->db->where('otId', $otId)->where('sapa_id', $sapa)
                 ->where('id_empresa', $empresaAsset)->delete('tbl_otvales');
        $this->db->trans_complete();
        if ($this->db->trans_status() === false) {
            return array('ok' => false, 'msg' => 'No se pudo quitar el vale.');
        }
        return array('ok' => true, 'msg' => 'Vale quitado.');
    }

    /**
     * Marca/desmarca una herramienta usada (el tilde de "se uso"). Definicion 6.
     */
    function setActivaHerramienta($otId, $herrId, $sapa, $activa)
    {
        $empresaAsset = empresa();
        $this->db->where('otId', (int) $otId)
                 ->where('herrId', (int) $herrId)
                 ->where('sapa_id', (int) $sapa)
                 ->where('id_empresa', $empresaAsset)
                 ->update('tbl_otherramientasusadas', array('activa' => $activa ? 1 : 0));
        return array('ok' => true);
    }







    //Ordenn de trabajo por id
    function getorden($id)
    {

        $this->db->select('orden_trabajo.*, 
												tareas.id_tarea, 
												tareas.descripcion AS tareadescrip, 
												sisusers.usrId, 
												CONCAT(sisusers.usrLastName,", ",sisusers.usrName) AS responsable');
        $this->db->from('orden_trabajo');
        $this->db->join('tareas', 'tareas.id_tarea  = orden_trabajo.id_tarea', 'left');
        $this->db->join('sisusers', 'sisusers.usrId  = orden_trabajo.id_usuario_a');
        $this->db->where('id_orden', $id);

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return 0;
        }
    }











    function getsolicitudes($data = null)
    {

        $this->db->select('solicitud_reparacion.id_solicitud, 
                            solicitud_reparacion.causa, 
                            solicitud_reparacion.id_equipo');
        $this->db->from('solicitud_reparacion');
        $this->db->where('estado', 'S');
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function getOrdenInactivas()
    {

        $this->db->select(
            'orden_servicio.id_orden, 
                    orden_servicio.estado,
                    equipos.id_equipo,
                    orden_servicio.comprobante,
                    orden_servicio.fecha, 
                    equipos.codigo,
                    solicitud_reparacion.id_solicitud,
                    solicitud_reparacion.solicitante, 
                    solicitud_reparacion.f_solicitado,                     
                    solicitud_reparacion.causa'
        );
        $this->db->from('orden_servicio');
        $this->db->join('solicitud_reparacion', 'orden_servicio.id_solicitudreparacion = solicitud_reparacion.id_solicitud');
        $this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
        $this->db->where('orden_servicio.estado', 'T');
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function getComponentes($data = null)
    {

        $id = $data['id_equipo'];

        $this->db->select('componentes.id_componente, componentes.descripcion');
        $this->db->from('componentes');
        $this->db->join('componenteequipo', 'componentes.id_componente = componenteequipo.id_componente');
        $this->db->join('equipos', 'componenteequipo.id_equipo = equipos.id_equipo');
        $this->db->where('equipos.id_equipo', $id);
        $query = $this->db->get();

        return $query->result_array();
    }

    function getContratistas()
    {
        $this->db->select('id_contratista, nombre');
        $this->db->from('contratistas');
        $query = $this->db->get();
        return $query->result_array();
    }

    function getArticulos()
    {
        $query = $this->db->query("SELECT articles.artId, articles.artBarCode,articles.artDescription FROM articles");
        $i = 0;
        foreach ($query->result() as $row) {

            $insumos[$i]['value'] = $row->artId;
            $insumos[$i]['label'] = $row->artBarCode;
            $insumos[$i]['descripcion'] = $row->artDescription;
            $i++;
        }
        return $insumos;
    }

    // function getInsumOrdenes($data){        

    //     $id_orden = $data['id_orden'];

    //     $this->db->select(
    //                 'deta_ordeninsumos.cantidad,
    //                 articles.artDescription AS descripcion,
    //                 abmdeposito.depositodescrip AS deposito');        
    //     $this->db->from('orden_insumos');
    //     $this->db->join('orden_servicio', 'orden_servicio.id_orden_insumo = orden_insumos.id_orden');        
    //     $this->db->join('deta_ordeninsumos', 'deta_ordeninsumos.id_ordeninsumo = orden_insumos.id_orden');        
    //     $this->db->join('tbl_lote', 'deta_ordeninsumos.loteid = tbl_lote.loteid');        
    //     $this->db->join('articles','articles.artId = tbl_lote.artId');
    //     $this->db->join('abmdeposito','abmdeposito.depositoId = tbl_lote.depositoid');
    //     $this->db->where('orden_servicio.id_orden', $id_orden);

    //     $query = $this->db->get();

    //     if ($query->num_rows()!=0)
    //     {
    //         return $query->result_array();  
    //     }
    //     else
    //     {   
    //         return array();
    //     }   
    // }

    function getDepositos()
    {

        $query = $this->db->query("SELECT `depositoId`, `depositodescrip` FROM `abmdeposito`");
        $depositos = $query->result_array();

        return $depositos;
    }



    function getTareas()
    {

        $query = $this->db->query("SELECT `id_tarea`, `descripcion` FROM `tareas`");
        $tareas = $query->result_array();

        return $tareas;
    }



    function validaOperarios($data)
    {

        $query = $this->db->query("SELECT CONCAT(`usrLastName`,', ',`usrname`)  as `operario` FROM `sisusers`");
        $recurso = (string) $data['operario'];

        foreach ($query->result_array() as $row) {

            $usuario = (string) $row['operario'];

            if (strcasecmp($usuario, $recurso) == 0) {
                $resp['resp'] = true;
                return $resp;
            }

        }
        $resp['resp'] = false;
        return $resp;
    }



    function getSolEquipCausas($data)
    {

        $id_solicitud = $data['id_solic'];
        $this->db->select('solicitud_reparacion.id_solicitud, solicitud_reparacion.causa, solicitud_reparacion.id_equipo ');
        $this->db->from('solicitud_reparacion');
        $this->db->where('solicitud_reparacion.id_solicitud', $id_solicitud);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return array();
        }
    }

    function getLotesActivos($depos)
    {  // devuelve id lote y cant s/dep, estado e id de articulo

        $depo = $depos['depoid'];
        $insum = $depos['id_insum'];

        $this->db->select('loteid, cantidad');
        $this->db->from('tbl_lote');
        $this->db->where('lotestado', 'AC');
        $this->db->where('depositoid', $depo);
        $this->db->where('artId', $insum);

        $query = $this->db->get();

        foreach ($query->result() as $row) {

            $datos_lote['id_lote'] = $row->loteid;
            $datos_lote['cantidad'] = $row->cantidad;
        }

        return $datos_lote;
    }
    ////// Cierra Informe de Servicios
    function setEstados($data)
    {

        $id_ordenservicio = $data['id_orden'];
        $estado['estado'] = 'T';

        $this->db->where('id_orden', $id_ordenservicio);
        $this->db->update('orden_servicio', $estado);

        // cierra Solicitud de Servicio
        // $this->db->select('orden_servicio.id_solicitudreparacion');
        // $this->db->from('orden_servicio');
        // $this->db->where('orden_servicio.id_orden', $id_ordenservicio);
        // $query= $this->db->get();

        // foreach ($query->result() as $row){                            
        //     $id_solicitud =  $row->id_solicitudreparacion;       
        // }

        // $this->db->where('id_solicitud', $id_solicitud);
        // $this->db->update('solicitud_reparacion', $estado);        
    }

    /**
     * Guarda archivos, imagenes de evidencia cargados en confeccion informe de servicios
     * @param 	data.
     * 
     */
    public function guardarEvidencia($data)
    {
        return $this->db->insert('orden_servicio_adjuntos', $data);
    }

    /**
     * trae imagenes, documentos de evidencia
     * @param id_orden.
     * @return array evidencias
     */
    public function getEvidenciasOrden($id_orden)
    {
        $this->db->select('id_adjunto, valor_base64, nombre');
        $this->db->from('orden_servicio_adjuntos');
        $this->db->where('id_orden', $id_orden);
        $query = $this->db->get();
        return $query->result_array();
    }

    /**
     * trae id_orden de informe de servicio por id_ot
     * @param id_ot.
     * @return id_orden
     */
    public function getIdOrdenPorOT($id_ot)
    {
        $this->db->select('id_orden');
        $this->db->from('orden_servicio');
        $this->db->where('id_ot', $id_ot);
        $this->db->order_by('id_orden', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get();
        $result = $query->row_array();
        return $result['id_orden'];
    }

}

