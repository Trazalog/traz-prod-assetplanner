<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Widget helper. Helper para traer los valores de los widgets del sistema.
 * @author Pablo Andrés Rojo
 * @version 1.0
 */

if (!function_exists('cantOrdenesServicio')) {
    /**
     * Muestra cantidad de ordenes en curso.
     *
     * @var    Bool    $echo   Si muestra o devuelve la variable.
     * @return Void|String     Imprime la cantidad o la devuelve.
     */
    function cantOrdenesServicio($echo = true)
    {
        // Get a reference to the controller object
        $CI = get_instance();
        // You may need to load the model if it hasn't been pre-loaded
        $CI->load->model('Widget');
        // Call a function of the model
        $output = $CI->Widget->getCantidad('orden_trabajo');
        // Output
        if ($echo == true) {
            echo $output;
        } else {
            return $output;
        }
    }
}

// --------------------------------------------------------------------

if (!function_exists('cantOrdenesEnCurso')) {
    /**
     * Muestra cantidad de ordenes en curso.
     *
     * @var    Bool    $echo   Si muestra o devuelve la variable.
     * @return Void|String     Imprime la cantidad o la devuelve.
     */
    function cantOrdenesEnCurso($echo = true)
    {
        // Get a reference to the controller object
        $CI = get_instance();
        // You may need to load the model if it hasn't been pre-loaded
        $CI->load->model('Widget');
        // Call a function of the model
        $output = $CI->Widget->getCantidadWhere('orden_trabajo', 'estado', 'C');
        // Output
        if ($echo == true) {
            echo $output;
        } else {
            return $output;
        }
    }
}

// --------------------------------------------------------------------

if (!function_exists('cantOrdenesVencidas')) {
    /**
     * Muestra cantidad de ordenes en curso.
     *
     * @var    Bool    $echo   Si muestra o devuelve la variable.
     * @return Void|String     Imprime la cantidad o la devuelve.
     */
    function cantOrdenesVencidas($echo = true)
    {
        // Get a reference to the controller object
        $CI = get_instance();
        // You may need to load the model if it hasn't been pre-loaded
        $CI->load->model('Widget');
        // Call a function of the model
        $output = $CI->Widget->getCantidadWhere('orden_trabajo', 'estado', 'V');
        // Output
        if ($echo == true) {
            echo $output;
        } else {
            return $output;
        }
    }
}

// --------------------------------------------------------------------

if (!function_exists('cantOrdenesAsignadas')) {
    /**
     * Muestra cantidad de ordenes en curso.
     *
     * @var    Bool    $echo   Si muestra o devuelve la variable.
     * @return Void|String     Imprime la cantidad o la devuelve.
     */
    function cantOrdenesAsignadas($echo = true)
    {
        // Get a reference to the controller object
        $CI = get_instance();
        // You may need to load the model if it hasn't been pre-loaded
        $CI->load->model('Widget');
        // Call a function of the model
        $output = $CI->Widget->getCantidadWhere('orden_trabajo', 'estado', 'As');
        // Output
        if ($echo == true) {
            echo $output;
        } else {
            return $output;
        }
    }
}

// --------------------------------------------------------------------

if (!function_exists('cantOrdenesCritico')) {
    /**
     * Muestra cantidad de ordenes en curso.
     *
     * @var    Bool    $echo   Si muestra o devuelve la variable.
     * @return Void|String     Imprime la cantidad o la devuelve.
     */
    function cantOrdenesCritico($echo = true)
    {
        // Get a reference to the controller object
        $CI = get_instance();
        // You may need to load the model if it hasn't been pre-loaded
        $CI->load->model('Widget');
        // Call a function of the model
        $output = $CI->Widget->getCantidadWhere('orden_trabajo', 'estado', 'Cr');
        // Output
        if ($echo == true) {
            echo $output;
        } else {
            return $output;
        }
    }
}

// --------------------------------------------------------------------

if (!function_exists('cantTipoOrdenTrabajo')) {
    /**
     *
     *
     */
    function cantTipoOrdenTrabajo($echo = false)
    {
        // Get a reference to the controller object
        $CI = get_instance();
        // You may need to load the model if it hasn't been pre-loaded
        $CI->load->model('Otrabajos');
        // Call a function of the model
        $output = $CI->Otrabajos->kpiCantTipoOrdenTrabajo();
        // En DB tabla orden_trabajo, en el campo tipo
        // 1 = correctivo
        // 2 = preventivo
        // 3 = predictivo
        // 4 = backlog
        // Output

        $aux = new StdClass();
        $aux->cantidad = 0;
        $aux->descripcion = "Correctivo Urgente";
        if ($output) {
            foreach ($output as $key => $value) {
                if ($value->descripcion == 'Orden de Trabajo') {
                    $aux->cantidad = $aux->cantidad + $value->cantidad;
                    unset($output[$key]);
                }

                if ($value->descripcion == "Solicitud de servicio") {
                    $aux->cantidad = $aux->cantidad + $value->cantidad;
                    unset($output[$key]);
                }
            }
        
            array_unshift($output, $aux);
        }


        if ($echo == true) {
            echo $output;
        } else {
            return $output;
        }
    }
}

if (!function_exists('sacarEquiposOperativos')) {
    /**
     *
     *
     */
    function sacarEquiposOperativos($echo = false)
    {
        // Get a reference to the controller object
        $CI = get_instance();
        // You may need to load the model if it hasn't been pre-loaded
        $CI->load->model('Equipos');
        // Call a function of the model
        $equipos = $CI->Equipos->kpiSacarEquiposOperativos();
        /* En DB tabla historial lectura, en el campo estado */
        // AC = activo
        // RE = reparacion
        /* en campo equipos: IN, AN, etc... */

        // En un bucle me fijo si el estado de equipos está en el arreglo equipos
        // Si no está lo agrego en el arreglo estados
        $estados = [];
        for ($i = 0; $i < sizeof($equipos); $i++) {
            if (!in_array($equipos[$i]['estado'], $estados)) {
                array_push($estados, $equipos[$i]['estado']);
            }
        }
        
        //cuento cantidad de cada estado y agrego esos campos (Estado y cantidad) al arreglo $outuput
        $output[0]['cantEstadoActivo'] = "0";                        //Aca he colocado el 0 entre comillas pero veo como que no lo usan
        $estados = array_filter($estados);                           //esto es nuevo lo coloque porque a veces trae un null
        log_message("DEBUG","HELPER". json_encode($estados));
        log_message("DEBUG","HELPER". json_encode($equipos));
        foreach ($estados as $clave) {   // no esta en mas ningun lugar solo aqui y a mi me parecio tambien extraño no creo que no
            if ($clave == 'AC') {
                $output[0]['estado'] = 'OP'; //Operativo
                $output[0]['cantEstadoActivo'] = array_count_values(array_column($equipos, 'estado'))[$clave];
            } else {
                $output[1]['estado'] = 'NO'; //No Operativo
                $output[1]['cantEstadoActivo'] += array_count_values(array_column($equipos, 'estado'))[$clave];
            }
        }

        // si solo hay un estado (todos activos, o todos en reparacion)
        if (sizeof($equipos) == 1) {
            if ($equipos[0]['estado'] == 'OP') { //si solo tiene activos
                $output[1]['cantEstadoActivo'] = '0';
                $output[1]['estado'] = 'NO';
            } else { //si tiene todos en reparacion
                $output[1]['cantEstadoActivo'] = '0';
                $output[1]['estado'] = 'OP';
            }
        }

        // Output
        if ($echo == true) {
            echo $output;
        } else {
            return $output;
        }
    }
}

if (!function_exists('calcularDisponibilidad')) {
    /**
     *
     *
     */
    function calcularDisponibilidad($idEquipo)
    {
        //dump($fechaFin);
        // Get a reference to the controller object
        $CI = get_instance();
        // You may need to load the model if it hasn't been pre-loaded
        $CI->load->model('Equipos');
        // Call a function of the model
        $output = $CI->Equipos->kpiCalcularDisponibilidad($idEquipo);
        //dump_exit($output);
        return $output;
    }
}
