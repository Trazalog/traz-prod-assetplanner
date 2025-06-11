<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Dump helper. Función que vuelca variables en pantalla de una manera bien formateada. Basada en el helper 'Dump Helper' de Joos Van Veen.
 * @author Pablo Andrés Rojo
 * @version 1.0
 */

if (!function_exists('dump')) {
    /**
     * dump
     * Volcado de variable en pantalla, de una manera bien formateada.
     *
     * @var    string  $var    Variable a volcar
     * @var    string  $label  Nombre a mostrar de la variable
     * @var    bool    $echo   Si muestra o devuelve la variable
     * @return string|void     Vuleca la variable o no devuelve nada
     */
    function dump ($var, $label = 'Dump', $echo = TRUE)
    {
        // Almacenar volcado en variable
        ob_start();
        var_dump($var);
        $output = ob_get_clean();

        // Agregar formato
        $output = preg_replace("/\]\=\>\n(\s+)/m", "] => ", $output);
        $output = '<pre style="background: #FFFEEF; color: #000; border: 1px dotted #000; padding: 10px; margin: 10px 0; text-align: left;">' . $label . ' => ' . $output . '</pre>';

        // Output
        if ($echo == TRUE) {
            echo $output;
        }
        else {
            return $output;
        }
    }
}

// --------------------------------------------------------------------

if (!function_exists('dump_exit')) {
    /**
     * dump_exit
     * Volcado de variable en pantalla, de una manera bien formateada, y termina la ejecución.
     *
     * @var    string  $var    Variable a volcar
     * @var    string  $label  Nombre a mostrar de la variable
     * @return void
     */
    function dump_exit($var, $label = 'Dump') {
        dump ($var, $label, $echo = TRUE);
        exit;
    }

     function tagProceso($id)
    {
        if($id == BPM_PROCESS_ID_PEDIDOS_NORMALES) return '#pedidoMaterial';

        if($id == BPM_PROCESS_ID_PEDIDOS_EXTRAORDINARIOS) return '#pedidoMaterial#extraordinario';
    }
}

//Funcion para obtener la extension del archivo codificado
function obtenerExtension($archivo){
    $ext = explode('.',$archivo);
        switch(strtolower(array_pop($ext))){
            case 'jpg': $ext = 'data:image/jpg;base64,';break;
            case 'png': $ext = 'data:image/png;base64,';break;
            case 'jpeg': $ext = 'data:image/jpeg;base64,';break;
            case 'jfif': $ext = 'data:image/jpeg;base64,';break;
            case 'pjpeg': $ext = 'data:image/pjpeg;base64,';break;
            case 'wbmp': $ext = 'data:image/vnd.wap.wbmp;base64,';break;
            case 'webp': $ext = 'data:image/webp;base64,';break;
            case 'pdf': $ext = 'data:application/pdf;base64,';break;
            case 'doc': $ext = 'data:application/msword;base64,';break;
            case 'xls': $ext = 'data:application/vnd.ms-excel;base64,';break;
            case 'docx': $ext = 'data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64,';break;
            case 'txt': $ext = 'data:text/plain;base64,';break;
            case 'csv': $ext = 'data:text/csv;base64,';break;
            default: $ext = "";
        }
    return $ext;
}
