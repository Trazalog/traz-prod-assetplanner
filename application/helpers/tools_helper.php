<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Helper de integración con traz-tools (REQ-ASSET-ALM, fase F3).
 *
 * AssetPlanner deja de leer su catálogo local de almacén (tabla `articles`)
 * y consume el de traz-tools vía REST (ALMDataService). Este helper resuelve:
 *   - el empr_id de tools a partir del id_empresa de asset (lookup porAssetId,
 *     cacheado en sesión) — nunca asumir que ambos ids coinciden;
 *   - la config por empresa registrada en el setup del cliente (core.tablas,
 *     clave ASSET + DEPO/PANO/ESTA — ver doc/v3/setup-cliente-alm-pan.md paso 6);
 *   - el catálogo de artículos de tools, con cache por request.
 *
 * Si la empresa no está vinculada en tools (core.empresas.empr_id_mysql) las
 * funciones devuelven null/array vacío y lo dejan logueado: es un error de
 * configuración del cliente, no un estado normal.
 */

if (!function_exists('tools_empr_id')) {
    /**
     * Devuelve el empr_id de tools para la empresa logueada en asset.
     * Cachea en sesión ('tools_empr_id').
     *
     * @return int|null
     */
    function tools_empr_id()
    {
        $ci =& get_instance();

        $cached = $ci->session->userdata('tools_empr_id');
        if ($cached) {
            return (int) $cached;
        }

        $userdata = $ci->session->userdata('user_data');
        if (empty($userdata[0]['id_empresa'])) {
            log_message('ERROR', '#TRAZA | ASSET | tools_helper | tools_empr_id() >> sin empresa en sesion');
            return null;
        }
        $idAsset = $userdata[0]['id_empresa'];

        $aux  = $ci->rest->callAPI('GET', REST_TOOLS_CORE . '/empresa/porAssetId/' . $idAsset);
        $resp = json_decode($aux['data']);

        if (empty($resp->empresa->empr_id)) {
            log_message('ERROR', '#TRAZA | ASSET | tools_helper | tools_empr_id() >> empresa asset ' . $idAsset
                . ' sin vinculo en tools (core.empresas.empr_id_mysql) — correr el setup del cliente');
            return null;
        }

        $emprId = (int) $resp->empresa->empr_id;
        $ci->session->set_userdata('tools_empr_id', $emprId);
        return $emprId;
    }
}

if (!function_exists('tools_config')) {
    /**
     * Lee la config por empresa registrada en el setup del cliente.
     * Claves válidas: 'DEPO' (depósito único), 'PANO' (pañol único), 'ESTA' (establecimiento).
     * Cachea en sesión ('tools_cfg_<clave>').
     *
     * @param  string $clave
     * @return string|null  el id guardado, o null si falta config
     */
    function tools_config($clave)
    {
        $ci =& get_instance();

        $cacheKey = 'tools_cfg_' . $clave;
        $cached   = $ci->session->userdata($cacheKey);
        if ($cached) {
            return $cached;
        }

        $emprId = tools_empr_id();
        if ($emprId === null) {
            return null;
        }

        $aux  = $ci->rest->callAPI('GET', REST_TOOLS_CORE . '/tabla/ASSET/valor/' . $clave . '/empresa/' . $emprId);
        $resp = json_decode($aux['data']);

        if (empty($resp->configuracion->valor)) {
            log_message('ERROR', '#TRAZA | ASSET | tools_helper | tools_config(' . $clave . ') >> sin config para empr_id '
                . $emprId . ' — correr el paso 6 del setup del cliente');
            return null;
        }

        $ci->session->set_userdata($cacheKey, $resp->configuracion->valor);
        return $resp->configuracion->valor;
    }
}

if (!function_exists('tools_articulos')) {
    /**
     * Catálogo de artículos de tools para la empresa logueada (getArticulos,
     * vía /articulos/empresa/{empr_id} — path SIN duplicados; /articulos/{empr_id}
     * está definido dos veces en el DataService y el que responde depende del
     * orden de los resources). Cache por request (static). Claves devueltas:
     * arti_id, barcode, titulo, descripcion, costo, cantidad_caja, punto_pedido,
     * estado, unidad_medida, es_loteado, batch_id, stock.
     *
     * @return array
     */
    function tools_articulos()
    {
        static $cache = null;
        if ($cache !== null) {
            return $cache;
        }

        $ci =& get_instance();

        $emprId = tools_empr_id();
        if ($emprId === null) {
            return $cache = array();
        }

        $aux  = $ci->rest->callAPI('GET', REST_TOOLS_ALM . '/articulos/empresa/' . $emprId);
        $resp = json_decode($aux['data'], true);

        if (empty($resp['articulos']['articulo'])) {
            return $cache = array();
        }

        $articulos = $resp['articulos']['articulo'];
        // El DataService devuelve un objeto (no una lista) cuando hay una sola fila.
        if (isset($articulos['arti_id'])) {
            $articulos = array($articulos);
        }

        return $cache = $articulos;
    }
}

if (!function_exists('tools_articulos_map')) {
    /**
     * Catálogo indexado por arti_id.
     *
     * @return array [arti_id => articulo]
     */
    function tools_articulos_map()
    {
        $map = array();
        foreach (tools_articulos() as $a) {
            $map[(int) $a['arti_id']] = $a;
        }
        return $map;
    }
}

if (!function_exists('tools_articulos_autocomplete')) {
    /**
     * Catálogo con el shape que esperan los autocompletes de asset
     * (reemplaza a los SELECT sobre `articles`): value / codigo / label.
     *
     * @return array de objetos {value, codigo, label}
     */
    function tools_articulos_autocomplete()
    {
        $out = array();
        foreach (tools_articulos() as $a) {
            if (isset($a['estado']) && $a['estado'] === 'AN') {
                continue;
            }
            $out[] = (object) array(
                'value'  => (int) $a['arti_id'],
                'codigo' => $a['barcode'],
                'label'  => $a['descripcion'],
            );
        }
        usort($out, function ($x, $y) {
            return strcasecmp($x->label, $y->label);
        });
        return $out;
    }
}

if (!function_exists('tools_merge_articulos')) {
    /**
     * Completa filas locales de insumos (tbl_preventivoinsumos / tbl_predictivoinsumos /
     * tbl_backloginsumos / tbl_otinsumos) con los datos del catálogo de tools,
     * conservando las claves que las vistas de asset ya esperan
     * (artBarCode, artDescription, id_empresa).
     *
     * @param  array $rows filas con al menos ['artId' => ...]
     * @return array mismas filas + artBarCode / artDescription / id_empresa
     */
    function tools_merge_articulos($rows)
    {
        if (empty($rows)) {
            return array();
        }

        $map    = tools_articulos_map();
        $emprId = tools_empr_id();

        foreach ($rows as &$r) {
            $artId = isset($r['artId']) ? (int) $r['artId'] : 0;
            if (isset($map[$artId])) {
                $r['artBarCode']     = $map[$artId]['barcode'];
                $r['artDescription'] = $map[$artId]['descripcion'];
            } else {
                // Referencia histórica a un id que no existe en el catálogo de tools
                // (dato anterior al setup del cliente). Se muestra, no se oculta.
                $r['artBarCode']     = '';
                $r['artDescription'] = '(articulo ' . $artId . ' no disponible en tools)';
            }
            $r['id_empresa'] = $emprId;
        }
        unset($r);

        return $rows;
    }
}

if (!function_exists('tools_herramientas')) {
    /**
     * Catálogo de herramientas de tools (pañol) para la empresa logueada
     * (PANDataservice herramientasGet, vía /herramientas/empresa/{empr_id}).
     * Cache por request (static). Claves devueltas: herr_id, codigo, marca
     * (nombre resuelto desde core.tablas), marca_id, modelo, tipo, descripcion,
     * pano_id, estado, pan_descrip.
     *
     * @return array
     */
    function tools_herramientas()
    {
        static $cache = null;
        if ($cache !== null) {
            return $cache;
        }

        $ci =& get_instance();

        $emprId = tools_empr_id();
        if ($emprId === null) {
            return $cache = array();
        }

        $aux  = $ci->rest->callAPI('GET', REST_TOOLS_PAN . '/herramientas/empresa/' . $emprId);
        $resp = json_decode($aux['data'], true);

        if (empty($resp['herramientas']['herramienta'])) {
            return $cache = array();
        }

        $herr = $resp['herramientas']['herramienta'];
        // El DataService devuelve un objeto (no una lista) cuando hay una sola fila.
        if (isset($herr['herr_id'])) {
            $herr = array($herr);
        }

        return $cache = $herr;
    }
}

if (!function_exists('tools_herramientas_map')) {
    /**
     * Catálogo de herramientas indexado por herr_id.
     *
     * @return array [herr_id => herramienta]
     */
    function tools_herramientas_map()
    {
        $map = array();
        foreach (tools_herramientas() as $h) {
            $map[(int) $h['herr_id']] = $h;
        }
        return $map;
    }
}

if (!function_exists('tools_merge_herramientas')) {
    /**
     * Completa filas locales (tbl_preventivoherramientas / tbl_predictivoherramientas /
     * tbl_backlogherramientas / tbl_otherramientas) con los datos del catálogo del
     * pañol de tools, conservando las claves que las vistas de asset esperan
     * (herrcodigo, herrmarca, herrdescrip).
     *
     * @param  array $rows filas con al menos ['herrId' => ...]
     * @return array mismas filas + herrcodigo / herrmarca / herrdescrip
     */
    function tools_merge_herramientas($rows)
    {
        if (empty($rows)) {
            return array();
        }

        $map = tools_herramientas_map();

        foreach ($rows as &$r) {
            $herrId = isset($r['herrId']) ? (int) $r['herrId'] : 0;
            if (isset($map[$herrId])) {
                $r['herrcodigo'] = $map[$herrId]['codigo'];
                $r['herrmarca']  = $map[$herrId]['marca'];
                $r['herrdescrip'] = $map[$herrId]['descripcion'];
            } else {
                // Referencia histórica a un id que no existe en el pañol de tools
                // (dato anterior al setup del cliente). Se muestra, no se oculta.
                $r['herrcodigo'] = '';
                $r['herrmarca']  = '';
                $r['herrdescrip'] = '(herramienta ' . $herrId . ' no disponible en tools)';
            }
        }
        unset($r);

        return $rows;
    }
}

if (!function_exists('tools_herramientas_disponibles')) {
    /**
     * Herramientas que se pueden OFRECER para usar: las del pañol asignado a
     * la empresa (config `PANO`) y con estado 'ACTIVO'. Se excluyen las que
     * están en 'TRANSITO' (salieron y no volvieron) y las de otros pañoles.
     * Ordenadas por nombre (descripción). Devuelve las filas crudas del
     * catálogo (mismas claves que tools_herramientas()).
     *
     * Si no hay pañol configurado, filtra solo por estado (no rompe).
     *
     * @return array
     */
    function tools_herramientas_disponibles()
    {
        $pano = tools_config('PANO');
        $out  = array();
        foreach (tools_herramientas() as $h) {
            $disponible = isset($h['estado']) && $h['estado'] === 'ACTIVO';
            $delPanol   = ($pano === null) || (isset($h['pano_id']) && (string) $h['pano_id'] === (string) $pano);
            if ($disponible && $delPanol) {
                $out[] = $h;
            }
        }
        usort($out, function ($x, $y) {
            return strcasecmp($x['descripcion'], $y['descripcion']);
        });
        return $out;
    }
}

if (!function_exists('tools_herramientas_autocomplete')) {
    /**
     * Catálogo de herramientas disponibles del pañol asignado, con el shape del
     * autocomplete de los planes (reemplaza getHerramientasB): value / codigo /
     * marca / label. Ordenado por nombre.
     *
     * @return array de arrays asociativos
     */
    function tools_herramientas_autocomplete()
    {
        $out = array();
        foreach (tools_herramientas_disponibles() as $h) {
            $out[] = array(
                'value'  => (int) $h['herr_id'],
                'codigo' => $h['codigo'],
                'marca'  => $h['marca'],
                'label'  => $h['descripcion'],
            );
        }
        return $out;
    }
}

if (!function_exists('tools_herramientas_informe')) {
    /**
     * Catálogo de herramientas disponibles del pañol asignado, con el shape que
     * espera el autocomplete del INFORME de servicio (distinto del de los
     * planes): label=descripción, value=marca, codherram=código, herrId=id.
     *
     * @return array de arrays asociativos
     */
    function tools_herramientas_informe()
    {
        $out = array();
        foreach (tools_herramientas_disponibles() as $h) {
            $out[] = array(
                'label'     => $h['descripcion'],
                'value'     => $h['marca'],
                'codherram' => $h['codigo'],
                'herrId'    => (int) $h['herr_id'],
            );
        }
        return $out;
    }
}

if (!function_exists('tools_herramientas_full')) {
    /**
     * Catálogo de herramientas disponibles del pañol asignado, con los nombres
     * de columna de la tabla `herramientas` de asset (para los consumidores que
     * esperaban result() del modelo viejo).
     *
     * @return array de objetos con herrId/herrcodigo/herrmarca/herrdescrip/...
     */
    function tools_herramientas_full()
    {
        $out = array();
        foreach (tools_herramientas_disponibles() as $h) {
            $out[] = (object) array(
                'herrId'      => (int) $h['herr_id'],
                'herrcodigo'  => $h['codigo'],
                'herrmarca'   => $h['marca'],
                'modid'       => isset($h['marca_id']) ? $h['marca_id'] : null,
                'tipoid'      => isset($h['tipo']) ? $h['tipo'] : null,
                'equip_estad' => isset($h['estado']) ? $h['estado'] : null,
                'herrdescrip' => $h['descripcion'],
                'depositoId'  => isset($h['pano_id']) ? $h['pano_id'] : null,
                'id_empresa'  => tools_empr_id(),
            );
        }
        return $out;
    }
}

if (!function_exists('tools_crear_vale_salida')) {
    /**
     * Registra un vale de salida de herramientas contra el módulo Pañol de tools
     * (PANDataservice) y marca cada herramienta como 'TRANSITO' (fuera del pañol).
     * Se usa al confeccionar el informe de servicio: las herramientas usadas
     * salen del pañol asignado a la empresa.
     *
     * @param  array  $herrIds ids de herramienta (herr_id de tools)
     * @param  array  $meta    opcional: destino, observaciones, comprobante, responsable
     * @return int|false       sapa_id de la salida creada, o false si no se pudo
     */
    function tools_crear_vale_salida($herrIds, $meta = array())
    {
        $ci =& get_instance();

        if (empty($herrIds)) {
            return false;
        }

        $emprId = tools_empr_id();
        $panoId = tools_config('PANO');
        if ($emprId === null || $panoId === null) {
            log_message('ERROR', '#TRAZA | ASSET | tools_helper | tools_crear_vale_salida() >> sin empr_id o PANO configurado');
            return false;
        }

        $userdata = $ci->session->userdata('user_data');
        $usuario  = isset($userdata[0]['usrNick']) ? $userdata[0]['usrNick'] : 'informe';

        // cabecera de la salida
        $cab = array(
            'usuario_app'   => $usuario,
            'destino'       => isset($meta['destino']) ? $meta['destino'] : 'Informe de servicio',
            'empr_id'       => (string) $emprId,
            'pano_id'       => (string) $panoId,
            'observaciones' => isset($meta['observaciones']) ? $meta['observaciones'] : '',
            'comprobante'   => isset($meta['comprobante']) ? $meta['comprobante'] : '',
            'responsable'   => isset($meta['responsable']) ? $meta['responsable'] : $usuario,
        );
        $aux  = tools_pan_write('POST', '/panol/salida/herramientas', $cab);
        $resp = json_decode($aux['data'], true);
        if (empty($resp['respuesta']['sapa_id'])) {
            log_message('ERROR', '#TRAZA | ASSET | tools_helper | tools_crear_vale_salida() >> no se creó la salida en pañol');
            return false;
        }
        $sapaId = (int) $resp['respuesta']['sapa_id'];

        // detalle + marcar cada herramienta en TRANSITO
        foreach ($herrIds as $herrId) {
            $herrId = (int) $herrId;
            if ($herrId <= 0) {
                continue;
            }
            tools_pan_write('POST', 'panol/salida/herramientas/detalle', array(
                'sapa_id' => (string) $sapaId,
                'herr_id' => (string) $herrId,
            ));
            tools_pan_write('PUT', '/herramientas/estado', array(
                'estado'  => 'TRANSITO',
                'herr_id' => (string) $herrId,
            ));
        }

        return $sapaId;
    }
}

if (!function_exists('tools_pan_write')) {
    /**
     * Escritura contra PANDataservice con la envoltura `_<metodo><path>` que
     * exige el DSS (mismo patrón que las escrituras de ALM).
     */
    function tools_pan_write($metodo, $path, $params)
    {
        $ci =& get_instance();
        $wrapper = '_' . strtolower($metodo) . str_replace('/', '_', ltrim($path, '/'));
        $body    = json_encode(array($wrapper => $params));
        $headers = array('Content-Type: application/json', 'Accept: application/json');
        return $ci->rest->callAPI($metodo, REST_TOOLS_PAN . '/' . ltrim($path, '/'), $body, $headers);
    }
}

if (!function_exists('tools_entregas_pedido')) {
    /**
     * Entregas (parciales o totales) de un pedido de materiales, desde el
     * almacen de tools. F2 REQ-ASSET-ALM: /entregas/pedido/{pema_id}.
     *
     * @param  int|string $pema
     * @return array  lista de entregas: enma_id, fecha, solicitante, dni, comprobante
     */
    function tools_entregas_pedido($pema)
    {
        $ci =& get_instance();
        if (!$pema) {
            return array();
        }
        $aux  = $ci->rest->callAPI('GET', REST_TOOLS_ALM . '/entregas/pedido/' . $pema);
        $resp = json_decode($aux['data'], true);
        $ent  = isset($resp['entregas']['entrega']) ? $resp['entregas']['entrega'] : array();
        if ($ent && !isset($ent[0])) {
            $ent = array($ent);
        }
        return $ent;
    }
}

if (!function_exists('tools_entrega_detalle')) {
    /**
     * Detalle de una entrega: articulos entregados con lote y deposito.
     * El precio NO se expone (decision del PM). F2: /entregas/detalle/{enma_id}.
     *
     * @param  int|string $enma
     * @return array
     */
    function tools_entrega_detalle($enma)
    {
        $ci =& get_instance();
        if (!$enma) {
            return array();
        }
        $aux  = $ci->rest->callAPI('GET', REST_TOOLS_ALM . '/entregas/detalle/' . $enma);
        $resp = json_decode($aux['data'], true);
        $det  = isset($resp['detalles']['detalle']) ? $resp['detalles']['detalle'] : array();
        if ($det && !isset($det[0])) {
            $det = array($det);
        }
        return $det;
    }
}

if (!function_exists('tools_salida_fecha')) {
    /** Fecha (y datos) de un vale de salida de panol. F5 REQ-ASSET-ALM. */
    function tools_salida_fecha($sapa)
    {
        $ci =& get_instance();
        if (!$sapa) { return null; }
        $aux  = $ci->rest->callAPI('GET', REST_TOOLS_PAN . '/salida/fecha/' . $sapa);
        $resp = json_decode($aux['data'], true);
        return isset($resp['salida']) ? $resp['salida'] : null;
    }
}

if (!function_exists('tools_devolucion_herramienta')) {
    /**
     * Fecha de devolucion de una herramienta: la primera entrada al panol
     * posterior a la salida (definicion 10). Devuelve 'YYYY-MM-DD' o null.
     */
    function tools_devolucion_herramienta($herrId, $desde)
    {
        $ci =& get_instance();
        if (!$herrId || !$desde) { return null; }
        $aux  = $ci->rest->callAPI('GET', REST_TOOLS_PAN . '/herramienta/' . $herrId . '/devolucion/desde/' . $desde);
        $resp = json_decode($aux['data'], true);
        $f = isset($resp['devolucion']['fecha']) ? $resp['devolucion']['fecha'] : '';
        return ($f !== '' && $f !== null) ? $f : null;
    }
}

if (!function_exists('tools_dias_entre')) {
    /** Dias entre dos fechas 'YYYY-MM-DD' (hasta=null => hoy). >=0. */
    function tools_dias_entre($desde, $hasta)
    {
        if (!$desde) { return 0; }
        $d1 = strtotime(substr($desde, 0, 10));
        $d2 = $hasta ? strtotime(substr($hasta, 0, 10)) : time();
        $dias = (int) floor(($d2 - $d1) / 86400);
        return $dias < 0 ? 0 : $dias;
    }
}

if (!function_exists('tools_vales_por_dni')) {
    /**
     * Vales de salida de panol filtrados por el DNI del formulario del vale
     * y un rango de fechas (MANTENEDOR). Definiciones 2 y 3. Devuelve array de
     * salidas: array('sapa_id','fecha','comprobante','responsable','destino').
     */
    function tools_vales_por_dni($dni, $desde, $hasta)
    {
        $ci =& get_instance();
        $dni = trim($dni);
        if ($dni === '') { return array(); }
        $empr = tools_empr_id();
        if ($empr === null) { return array(); }
        $url = REST_TOOLS_PAN . '/salidas/dni/' . rawurlencode($dni)
             . '/empresa/' . $empr . '/desde/' . $desde . '/hasta/' . $hasta;
        $aux  = $ci->rest->callAPI('GET', $url);
        $resp = json_decode($aux['data'], true);
        return tools_normaliza_salidas($resp);
    }
}

if (!function_exists('tools_vales')) {
    /** Vales de salida por rango de fechas, sin filtro de DNI (SUPERVISOR). */
    function tools_vales($desde, $hasta)
    {
        $ci =& get_instance();
        $empr = tools_empr_id();
        if ($empr === null) { return array(); }
        $url = REST_TOOLS_PAN . '/salidas/empresa/' . $empr
             . '/desde/' . $desde . '/hasta/' . $hasta;
        $aux  = $ci->rest->callAPI('GET', $url);
        $resp = json_decode($aux['data'], true);
        return tools_normaliza_salidas($resp);
    }
}

if (!function_exists('tools_normaliza_salidas')) {
    /** Desempaqueta {salidas:{salida:[...] | {...}}} a un array plano. PHP 5.6. */
    function tools_normaliza_salidas($resp)
    {
        if (!isset($resp['salidas']['salida'])) { return array(); }
        $s = $resp['salidas']['salida'];
        // DSS devuelve objeto suelto cuando hay un solo registro
        if (isset($s['sapa_id'])) { $s = array($s); }
        return $s;
    }
}

if (!function_exists('tools_herramientas_de_vale')) {
    /** Herramientas de un vale: array de array('herr_id','codigo','descripcion'). */
    function tools_herramientas_de_vale($sapa)
    {
        $ci =& get_instance();
        if (!$sapa) { return array(); }
        $aux  = $ci->rest->callAPI('GET', REST_TOOLS_PAN . '/panol/salida/' . $sapa . '/herramientas');
        $resp = json_decode($aux['data'], true);
        if (!isset($resp['herramientas']['herramienta'])) { return array(); }
        $h = $resp['herramientas']['herramienta'];
        if (isset($h['herr_id'])) { $h = array($h); }
        return $h;
    }
}
