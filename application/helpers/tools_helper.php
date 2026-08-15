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

if (!function_exists('tools_herramientas_autocomplete')) {
    /**
     * Catálogo de herramientas con el shape del autocomplete de asset
     * (reemplaza getHerramientasB): value / codigo / marca / label.
     *
     * @return array de arrays asociativos
     */
    function tools_herramientas_autocomplete()
    {
        $out = array();
        foreach (tools_herramientas() as $h) {
            if (isset($h['estado']) && $h['estado'] === 'AN') {
                continue;
            }
            $out[] = array(
                'value'  => (int) $h['herr_id'],
                'codigo' => $h['codigo'],
                'marca'  => $h['marca'],
                'label'  => $h['descripcion'],
            );
        }
        usort($out, function ($x, $y) {
            return strcasecmp($x['label'], $y['label']);
        });
        return $out;
    }
}

if (!function_exists('tools_herramientas_full')) {
    /**
     * Catálogo completo con los nombres de columna de la tabla `herramientas`
     * de asset (para los consumidores que esperaban result() del modelo viejo).
     *
     * @return array de objetos con herrId/herrcodigo/herrmarca/herrdescrip/...
     */
    function tools_herramientas_full()
    {
        $out = array();
        foreach (tools_herramientas() as $h) {
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
