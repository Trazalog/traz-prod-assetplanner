<?php defined('BASEPATH') or exit('No direct script access allowed');

class Kpi extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();

        $this->load->model('Kpis');
        $this->load->model('Equipos');
    }

    public function check_session(){

        $data = $this->session->userdata();
		log_message('DEBUG','#Main/index | KPI >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();

			echo ("<script>location.href='login'</script>");

		}else{
            return true;
        }
    }

    public function index()
    {
       
        if($this->check_session()){
        
            $data['list'] = $this->Equipos->equipos_List();
            $this->load->view('test', $data);
        }
        
    }

    public function index1()
    {
        if($this->check_session()){
            $this->load->view('kpis/disponibilidad');
        }
    }

    public function dsp($eq)
    {
        $tiempo = array();
        $dsp = array();
        $fecha_actual = date("Y-m-d");

        $data = $this->Kpis->getEquipos($eq == 'all' ? false : $eq);
        $cant = sizeof($data);

        if ($cant == 0) {
            echo json_encode(false);
        }

        for ($i = 0; $i < 12; $i++) {
            $fi = date("Y-m-01 00:00:00", strtotime($fecha_actual . "- $i month"));

            //Ajustar Rango de Fecha con Respecto a la primera vez que se activo el Equipo
            $ff = ($i == 0 ? date("Y-m-d H:i:00") : date("Y-m-d 23:59:59", strtotime($fi . "+ 1 month - 1 second")));

            array_unshift($tiempo, date("m-Y", strtotime($fi)));

            $acum = 0;
            foreach ($data as $o) {
                $fi = $this->Kpis->estadoEquipoAlta($o->id_equipo, $fi, true);
                #Ajustar Rango de Fecha con Respecto a la fecha que se dio de baja al Equipo
                $ff = $this->Kpis->estadoEquipoBaja($o->id_equipo, $ff, true);
                $acum += $this->calcularDisponibilidad($o->id_equipo, $fi, $ff);
            }

            $dsp[$fi . ' - ' . $ff] = number_format($acum / $cant, 2);

        }
        print("<pre>" . print_r($dsp, true) . "</pre>");

    }

    public function kpiDisponibilidad($equipo = false)
    {
        $tiempo = array();
        $dsp = array();
        $fecha_actual = date("Y-m-d");

        $eq = ($equipo ? $equipo : $this->input->post('idEquipo'));

        $data = $this->Kpis->getEquipos($eq == 'all' ? false : $eq);
        #var_dump($data);
        $cant = sizeof($data);

        #echo "Cantidad Equipos: $cant <hr>";

        if ($cant == 0) {
            $data['promedioMetas'] = 0;
            $data['tiempo'] = [];
            $data['porcentajeHorasOperativas'] = [];
            echo json_encode($data);
            return;
        }

        for ($i = 0; $i < 12; $i++) {
            #Calular Fecha Inicio del Mes
            $fi = date("Y-m-01 00:00:00", strtotime($fecha_actual . "- $i month"));

            #Calcular Fecha Fin del Mes
            $ff = ($i == 0 ? date("Y-m-d H:i:00") : date("Y-m-d 23:59:59", strtotime($fi . "+ 1 month - 1 second")));

            #Guardar Labels para Gráfico MES/AÑO
            array_unshift($tiempo, date("m-Y", strtotime($fi)));

            $acum = 0;
            $cantIgnorar = 0;

            foreach ($data as $o) {
                #Ajustar Rango de Fecha con Respecto a la primera vez que se activo el Equipo
                $fi = $this->Kpis->estadoEquipoAlta($o->id_equipo, $fi, true);

                #Ajustar Rango de Fecha con Respecto a la fecha que se dio de baja al Equipo
                #$ff = $this->Kpis->estadoEquipoBaja($o->id_equipo, $ff, true);

                #Acumular Disponibilidad del Equipo entre FI y FF
                $res = $this->calcularDisponibilidad($o->id_equipo, $fi, $ff);

                if ($res) {
                    $acum += $res;
                } else {
                    $cantIgnorar++;
                }

            }

            array_unshift($dsp, number_format($acum / ($cant == $cantIgnorar ? 1 : ($cant - $cantIgnorar)), 2));
        }

        # Calcular Promedio Metas
        $acum = 0;
        $cantMetas = 0;
        foreach ($data as $o) {
            if ($o->meta_dsp) {
                $acum += $o->meta_dsp;
                $cantMetas++;
            }
        }

        $promedioMetas = ($cantMetas == 0 ? 0 : round($acum / ($cantMetas), 2));

        // echo "Acum Metas: $acum <hr>";
        // echo "Cantidad: $cantMetas <hr>";
        // echo "Promedio Metas: $promedioMetas <hr>";

        $data['promedioMetas'] = $promedioMetas;
        $data['tiempo'] = $tiempo;
        $data['porcentajeHorasOperativas'] = $dsp;
        echo json_encode($data);
    }

    public function calcularDisponibilidad($eq, $fi, $ff)
    {
        $disp = 0;
        $tc = $this->calcularMinutos($fi, $ff);

        #Obtener Historial de Lecturas
        $data = $this->Kpis->getHistorialLecturas($eq, $fi, $ff);

        #No Registra Historial de Lecturas en el Rango FI y FF
        if (sizeof($data) == 0) {

            #Busco Ultimo Estado antes de FI
            $his = $this->Kpis->getHistorialLecturas($eq, false, $fi);

            #Si no hay Registros antes de FI no registrar DSP
            if (!$his) {
                return false;
            }

            # Si hay registro returno DSP seguno estado antes de FI
            if (end($his)->estado == 'AC') {
                return 100;
            } else {
                return 0;
            }

        }

        if ($data[0]->estado == 'RE') {
            $disp += $this->calcularMinutos($fi, $data[0]->fecha);
            unset($data[0]);
        }

        $fechaActivo = null;

        foreach ($data as $key => $o) {

            // Ignora los Registros con campo OBS == true, representan los mantenimientos que no cambiaron el estado del equipo

            if ($o->obs == 1) {
                continue;
            }

            if ($o->estado == 'AC') {
                $fechaActivo = $o->fecha;
            }

            if ($o->estado == 'RE') {
                $disp += $this->calcularMinutos($fechaActivo, $o->fecha);
                $fechaActivo = null;
            }

        }

        if ($fechaActivo) {
            $disp += $this->calcularMinutos($fechaActivo, $ff);
        }

        $disp = number_format(($disp * 100) / $tc, 2);

        return $disp;
    }

    public function dspRangoFecha($eq = 'all')
    {
        $fi = reformat($this->input->get('fi')).' 00:00:00';
        $ff = reformat($this->input->get('ff')).' 00:00:00';

        $data = $this->Kpis->getEquipos($eq == 'all' ? false : $eq);

        foreach ($data as $key=>$o) {
            #Ajustar Rango de Fecha con Respecto a la primera vez que se activo el Equipo
            $fi1 = $this->Kpis->estadoEquipoAlta($o->id_equipo, $fi);

            #Ajustar Rango de Fecha con Respecto a la fecha que se dio de baja al Equipo
            $ff2 = $this->Kpis->estadoEquipoBaja($o->id_equipo, $ff);

            #Acumular Disponibilidad del Equipo entre FI y FF
            $res = $this->calcularDisponibilidad($o->id_equipo, $fi1, $ff2);

            $data[$key]->fi = $fi1;
            $data[$key]->ff = $ff2;
            $data[$key]->dsp = $res;
        }

        echo json_encode($data);
    }

    public function calcularMinutos($fi, $ff)
    {
        $fecha1 = new DateTime($fi); //fecha inicial
        $fecha2 = new DateTime($ff); //fecha de cierre
        
        $intervalo = $fecha1->diff($fecha2);

        #echo $intervalo->format('%Y años %m meses %d days %H horas %i minutos %s segundos'); //00 años 0 meses 0 días 08 horas 0 minutos 0 segundos

        $anos = (int) $intervalo->format('%Y');
        $meses = $anos * 12; //Anos a Meses
        $dias = (($meses + (int) $intervalo->format('%m')) * 30) + ($anos * 5); //Meses a Dias
        $horas = ($dias + (int) $intervalo->format('%d')) * 24; // Dias a Horas
        $minutos = ($horas + (int) $intervalo->format('%H')) * 60; // Horas a Minutos
        $totalMin = $minutos + (int) $intervalo->format('%i'); // Acumulo Minutos

        return $totalMin;
    }


    /* Calculo de todos los kpis, 
        Busqueda por todos los equipos dentro de un rango de fecha o todo el año
        Busqueda por equipo y fechas dentro de un rango ingresado 
    */
    public function disponibilidadKpi(){

        $tiempo = array();
        $fecha_actual = date("Y-m-d");
        $disponibilidadMeses = array();
        $mtbf = array();
        $mttr = array();
        $mttf = array();
        $confiabilidad = array();

        $id_equipo =  $this->input->post('id_equipo');
        $id_sector =  $this->input->post('id_sector') ?  $this->input->post('id_sector') : 'all';
        $id_grupo =  $this->input->post('id_grupo') ? $this->input->post('id_grupo') : 'all';
        $fecha_desde =  $this->input->post('fecha_desde')/* ." 00:00:00" */;
        $fecha_hasta =  $this->input->post('fecha_hasta')/* ." 23:59:59" */;

        /* harkcodeo horas laborales */
        $horasLaborales = 8;
        
		log_message('DEBUG','KPI ||  disponibilidadKpi || $id_equipo '. $id_equipo);

        /*busca todos los equipos */
        if($id_equipo == 'all'){

            /* Si ingresa fechas busco por las fechas ingresadas */
            if(($fecha_desde) && ($fecha_hasta)){
                // Convertir las fechas de texto a objetos DateTime

                $fechaInicioObj = new DateTime($fecha_desde);
                $fechaFinObj = new DateTime($fecha_hasta);

                $mesDesde = $fechaInicioObj->format('m');

                $i=0;
                /* Recorro los meses del intervalo ingresado */
                while ($fechaInicioObj <= $fechaFinObj) {
                
                    #Calcular Fecha inicio del Mes
                    $fi = date("Y-m-01", strtotime($fecha_desde . "+ $i month"));
                     #Calcular Fecha Fin del Mes
                    $ff = (date("Y-m-d", strtotime($fi . "+ 1 month - 1 second")));
                
                    /* guardo mes que recorro para comparar con el numero de mes ingresado y elegir que parametro mandar */
                    $mesRecorrido = $fechaInicioObj->format('m');

                    $mesHasta = $fechaFinObj->format('m');

                    $anioRecorrido = $fechaInicioObj->format('Y');

                    $anioHasta = $fechaFinObj->format('Y');

                    if($mesHasta == $mesRecorrido && $anioRecorrido == $anioHasta) 
                    {

                        //calcula cantidad de equipos de acuerdo al alta
                        $cantidad_equipos = $this->Kpis->getCantEquiposxEmpresaxSectorxGrupo($id_sector, $id_grupo, $fi, $fecha_hasta);   
                        
                        if($cantidad_equipos == 0){
                            $disponibilidadMeses[] = 0;
                            $mttr[]=0;
                            $mttf[]=0;
                            $mtbf[]=0;
                            $confiabilidad[] = 0 ;
                        }
                        else{
                                /*calculo tiempo total en base a las horas laborales de cada mes y lo multiplico por todos los equipos*/
                                $tiempoTotal = $this->Kpis->getTiempoTotal($fi, $fecha_hasta) * $cantidad_equipos;
                            
                                /*calculo tiempo total en reparacion */
                                $tiempoTotalReparacion = $this->Kpis->getTiempoTotalReparacion($fi, $fecha_hasta, $id_sector, $id_grupo);

                                /* calculo el tiempo Activo multiplicando el tiempoTotal - tiempoReparacion*/
                                $tiempoActivo =  $tiempoTotal  - $tiempoTotalReparacion;

                                #kpi disponibilidad
                                /* calculo disponibilidad (tiempoActivo / Tiempototal)*100 */
                                $disponibilidadMeses[] =round(($tiempoActivo / $tiempoTotal) * 100 , 2);
                            
                                $cantidadFallos = $this->Kpis->getCantidadFallos($fi, $fecha_hasta, $id_sector, $id_grupo);
                                if($cantidadFallos == 0) {
                                    $mttr[]=0;
                                    $mttf[]=round($tiempoActivo);
                                }
                                else 
                                {
                                    #kpi Mttr
                                    $mttr[] =($tiempoTotalReparacion) ? round($tiempoTotalReparacion/$cantidadFallos , 2) : 0 ;
                                                        
                                    #kpi Mttf
                                    $mttf[] =  round($tiempoActivo/$cantidadFallos, 2);
                                    
                                }
                                #Guardar tiempo medio entre fallos MTBF
                                $mtbf[] = round($mttr[$i] + $mttf[$i] , 2);
                                /* si ambos valores viene en 0 el resultado es 0 */
                                if(($mtbf[$i] == 0) && ($mttr[$i] == 0))
                                {
                                    $confiabilidad[] = 0 ;
                                }
                                else{
                                    $confiabilidad[] = round(($mtbf[$i] / ($mtbf[$i] +  $mttr[$i])) * 100 , 2);
                                }
                        }
                   
                        log_message('DEBUG','KPI ||  disponibilidadKpi || MES: '.$mesRecorrido);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotal: '.$tiempoTotal);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotalReparacion: '.$tiempoTotalReparacion);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoActivo: '.$tiempoActivo);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || cantidadFallos: '.$cantidadFallos);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || Cantidadequipos: '. $cantidad_equipos);


                    }
                    else if($mesDesde == $mesRecorrido){

                        //calcula cantidad de equipos de acuerdo al alta
                        $cantidad_equipos = $this->Kpis->getCantEquiposxEmpresaxSectorxGrupo($id_sector, $id_grupo, $fecha_desde, $ff);

                        if($cantidad_equipos == 0){
                            $disponibilidadMeses[] = 0;
                            $mttr[]=0;
                            $mttf[]=0;
                            $mtbf[]=0;
                            $confiabilidad[] = 0 ;
                        }
                        else{
                                /*calculo tiempo total en base a las horas laborales de cada mes y lo multiplico por todos los equipos*/
                                                    
                                $tiempoTotal = $this->Kpis->getTiempoTotal($fecha_desde, $ff) * $cantidad_equipos;
                                
                                /*calculo tiempo total en reparacion */
                                $tiempoTotalReparacion = $this->Kpis->getTiempoTotalReparacion($fecha_desde, $ff, $id_sector, $id_grupo);

                                /* calculo el tiempo Activo multiplicando el tiempoTotal - tiempoReparacion*/
                                $tiempoActivo =  $tiempoTotal  - $tiempoTotalReparacion;

                                #kpi disponibilidad
                                /* calculo disponibilidad (tiempoActivo / Tiempototal)*100 */
                                $disponibilidadMeses[] = round(($tiempoActivo / $tiempoTotal) * 100, 2);

                                $cantidadFallos = $this->Kpis->getCantidadFallos($fecha_desde, $ff, $id_sector, $id_grupo);
                                if($cantidadFallos == 0) {
                                    $mttr[]=0;
                                    $mttf[]=round($tiempoActivo);
                                }
                                else 
                                {
                                    #kpi Mttr
                                    $mttr[] = ($tiempoTotalReparacion) ? round($tiempoTotalReparacion/$cantidadFallos, 2) : 0 ;
                                                        
                                    #kpi Mttf
                                    $mttf[] =  round($tiempoActivo/$cantidadFallos, 2);
                                
                                }
                                  #Guardar tiempo medio entre fallos MTBF
                                  $mtbf[] = round($mttr[$i] + $mttf[$i] , 2);
                                  /* si ambos valores viene en 0 el resultado es 0 */
                                  if(($mtbf[$i] == 0) && ($mttr[$i] == 0))
                                  {
                                      $confiabilidad[] = 0 ;
                                  }
                                  else{
                                      $confiabilidad[] = round(($mtbf[$i] / ($mtbf[$i] +  $mttr[$i])) * 100 , 2);
                                  }
                        }
                         
                        log_message('DEBUG','KPI ||  disponibilidadKpi || MES: '.$mesRecorrido);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotal: '.$tiempoTotal);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotalReparacion: '.$tiempoTotalReparacion);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoActivo: '.$tiempoActivo);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || cantidadFallos: '.$cantidadFallos);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || Cantidadequipos: '. $cantidad_equipos);
                    }
                        else{
                        
                        //calcula cantidad de equipos de acuerdo al alta
                        $cantidad_equipos = $this->Kpis->getCantEquiposxEmpresaxSectorxGrupo($id_sector, $id_grupo, $fi, $ff);

                        if($cantidad_equipos == 0){
                            $disponibilidadMeses[] = 0;
                            $mttr[]=0;
                            $mttf[]=0;
                            $mtbf[]=0; 
                            $confiabilidad[] = 0 ;
                        }else{
                                /*calculo tiempo total en base a las horas laborales de cada mes y lo multiplico por todos los equipos*/
                                                        
                                $tiempoTotal = $this->Kpis->getTiempoTotal($fi, $ff) * $cantidad_equipos;

                                /*calculo tiempo total en reparacion */
                                $tiempoTotalReparacion = $this->Kpis->getTiempoTotalReparacion($fi, $ff, $id_sector, $id_grupo);

                                /* calculo el tiempo Activo multiplicando el tiempoTotal - tiempoReparacion*/
                                $tiempoActivo = $tiempoTotal  - $tiempoTotalReparacion;

                                /* calculo kpi disponibilidad (tiempoActivo / Tiempototal)*100 */
                                $disponibilidadMeses[] = round(($tiempoActivo / $tiempoTotal) * 100, 2);
                                
                                $cantidadFallos = $this->Kpis->getCantidadFallos($fi, $ff, $id_sector, $id_grupo);

                                if($cantidadFallos == 0) {
                                    $mttr[]=0;
                                    $mttf[]=round($tiempoActivo);
                                }
                                else 
                                {
                                    #kpi Mttr
                                    $mttr[] = ($tiempoTotalReparacion) ? round($tiempoTotalReparacion/$cantidadFallos, 2) : 0 ;
                                                            
                                    #kpi Mttf
                                    $mttf[] =  round($tiempoActivo/$cantidadFallos, 2);
                                    
                                }

                                 #Guardar tiempo medio entre fallos MTBF
                                $mtbf[] = round($mttr[$i] + $mttf[$i] , 2);
                                /* si ambos valores viene en 0 el resultado es 0 */
                                if(($mtbf[$i] == 0) && ($mttr[$i] == 0))
                                {
                                    $confiabilidad[] = 0 ;
                                }
                                else{
                                    $confiabilidad[] = round(($mtbf[$i] / ($mtbf[$i] +  $mttr[$i])) * 100 , 2);
                                }
                        }
                       
                        
                        log_message('DEBUG','KPI ||  disponibilidadKpi || MES: '.$mesRecorrido);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotal: '.$tiempoTotal);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotalReparacion: '.$tiempoTotalReparacion);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoActivo: '.$tiempoActivo);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || cantidadFallos: '.$cantidadFallos);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || Cantidadequipos: '. $cantidad_equipos);
                        
                        }
                    
                   
                 
                     #Guardar Labels para Gráfico MES/AÑO
                     $tiempo[] =  date("m-Y", strtotime($fi));
                    // Moverse al siguiente mes
                    $fechaInicioObj->modify('+1 month');
                    $i++;
                 
                }

            }
            /* si no ingreso fecha busca todos los equipos por todo el año */
            else{ 
           
                    for ($i = 0; $i < 12; $i++) {
                        #Calular Fecha Inicio del Mes
                        $l=1;
                        $fi = ($i == 0 ?  date("Y-m-01", strtotime($fecha_actual)) : date("Y-m-01", strtotime("-$l months", strtotime($fi))));
                        
                        #Calcular Fecha Fin del Mes
                        $ff = ($i == 0 ? date("Y-m-d") : date("Y-m-d", strtotime($fi . "+ 1 month - 1 second")));
                        
                        //calcula cantidad de equipos de acuerdo al alta
                        $cantidad_equipos = $this->Kpis->getCantEquiposxEmpresaxSectorxGrupo($id_sector, $id_grupo, $fi, $ff);
                    
                        if($cantidad_equipos == 0){
                            array_unshift($disponibilidadMeses,  0);
                            array_unshift($mttr ,0);
                            array_unshift($mttf ,0);
                            array_unshift($mtbf ,0); 
                        }
                        else{
                                /*calculo tiempo total en base a las horas laborales de cada mes y lo multiplico por todos los equipos*/
                                $tiempoTotalMes = $this->Kpis->getTiempoTotal($fi, $ff) ;
                                $tiempoTotal = $tiempoTotalMes * $cantidad_equipos;

                                /*calculo tiempo total en reparacion */
                                $tiempoTotalReparacion = $this->Kpis->getTiempoTotalReparacion($fi, $ff, $id_sector, $id_grupo);

                                /* calculo el tiempo Activo multiplicando el tiempoTotal - tiempoReparacion*/
                                $tiempoActivo =  $tiempoTotal  - $tiempoTotalReparacion;

                                /* calculo disponibilidad (tiempoActivo / Tiempototal)*100 */
                                $disponibilidad = round(($tiempoActivo / $tiempoTotal) * 100 , 2);
                            
                                #Guardar disponibilidad por cada mes
                                array_unshift($disponibilidadMeses,  $disponibilidad);
                                //array_unshift($disponibilidadMeses ,$this->Kpis->getDisponibilidadxFecha($fi, $ff));
                            
                                #Guardar Tiempo promedio de reparación MTTR
                                $cantidadFallos = $this->Kpis->getCantidadFallos($fi, $ff, $id_sector, $id_grupo);
                                
                                if($cantidadFallos == 0) {
                                    array_unshift($mttr ,0);
                                    array_unshift($mttf ,round($tiempoActivo));
                                }
                                else 
                                {
                                    array_unshift($mttr ,round($tiempoTotalReparacion/$cantidadFallos, 2));
                                    #Guardar Tiempo medio hasta el fallo MTTF
                                    array_unshift($mttf ,round($tiempoActivo/$cantidadFallos, 2));
                                }

                                #Guardar Labels para Gráfico MES/AÑO
                                array_unshift($tiempo, date("m-Y", strtotime($fi)));
                            
                                #Guardar tiempo medio entre fallos MTBF
                                array_unshift($mtbf , round($mttr[0] + $mttf[0], 2));
                            
                                /* si ambos valores viene en 0 el resultado es 0 */
                                if(($mtbf[0] == 0) && ($mttr[0] == 0))
                                {
                                    array_unshift($confiabilidad, 0 );
                                }
                                else{
                                    array_unshift($confiabilidad,round(($mtbf[0] / ($mtbf[0] +  $mttr[0])) * 100 , 2));
                                }
                            
                        }
                        
                        
                         log_message('DEBUG','KPI ||  disponibilidadKpi || Cantidadequipos: '. $cantidad_equipos);
                         log_message('DEBUG','KPI ||  disponibilidadKpi || MES: '. ($i + 1));
                         log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotalMes: '.$tiempoTotalMes);
                         log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotal: '.$tiempoTotal);
                         log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotalReparacion: '.$tiempoTotalReparacion);
                         log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoActivo: '.$tiempoActivo);
                    }
            }

            $dataeq = $this->Kpis->getEquiposKpi('all',$id_sector,$id_grupo);
            log_message('DEBUG','KPI ||  disponibilidadKpi || $dataeq '. json_encode($dataeq));

            # Calcular Promedio Metas all
            $acum = 0;
            $cantMetas = 0;
            foreach ($dataeq as $o) {        
                if ($o["meta_disponibilidad"]) {                    
                    $acum += $o["meta_disponibilidad"];
                    $cantMetas++;
                }
            }
            $promedioMetas = ($cantMetas == 0 ? 0 : round($acum / ($cantMetas), 2));
            log_message('DEBUG','KPI ||  disponibilidadKpi || Metas: '.$acum.' CantMetas: '.$cantMetas);
            $data['promedioMetas'] = $promedioMetas;
            $data['tiempo'] =  $tiempo;
            $data['porcentajeHorasOperativas'] = $disponibilidadMeses;
            $data['mtbf']=  $mtbf;
            $data['mttr'] = $mttr;
            $data['mttf'] = $mttf;
            $data['confiabilidad'] = $confiabilidad;

            log_message('DEBUG','KPI ||  disponibilidadKpi || $data '. json_encode($data));

            echo json_encode($data);
        
        }else{/* busqueda por id_equipo */

            // verifica estado del equipo
            $estadoEquipo = $this->Kpis->getEstadoEquipo($id_equipo);

            //obtengo fecha de alta
            $fechaAltaEquipo = date("Y-m-d",strtotime($this->Kpis->fechaAltaEquipo($id_equipo)));

            // Convertir las fechas de texto a objetos DateTime
            $fechaInicioObj = new DateTime($fecha_desde);
            $fechaFinObj = new DateTime($fecha_hasta);
            
            $mesDesde = $fechaInicioObj->format('m');
            
            $i=0;
            /* Recorro los meses del intervalo ingresado */
            while ($fechaInicioObj <= $fechaFinObj) {

                #Calcular Fecha inicio del Mes
                $fi = date("Y-m-01", strtotime($fecha_desde . "+ $i month"));
                 #Calcular Fecha Fin del Mes
                $ff = (date("Y-m-d", strtotime($fi . "+ 1 month - 1 second")));

                /* guardo mes que recorro para comparar con el numero de mes ingresado y elegir que parametro mandar */
                $mesRecorrido = $fechaInicioObj->format('m');
                $mesHasta = $fechaFinObj->format('m');

                if($mesHasta == $mesRecorrido)
                {
                
                    // si el equipo esta en estado alta debe mostrar 0 o si el equipo no fue dado de alta en el tiempo recorrido
                    if($estadoEquipo == 'AL' || $fechaAltaEquipo > $fi && $fechaAltaEquipo > $fecha_hasta)
                    {
                        $disponibilidadMeses[] = 0;
                        $mttr[] = 0;
                        $mttf[]= 0;
                        $confiabilidad[] = 0 ;
                        $mtbf[]= 0;
                    }
                    else{
                        #Calcular desde inicio de mes a fecha_hasta
                        /*calculo tiempo total en base a las horas laborales de cada mes y lo multiplico por todos los equipos*/
                        
                        $tiempoTotal = $this->Kpis->getTiempoTotal($fi, $fecha_hasta);
                        /*calculo tiempo total en reparacion */
                        $tiempoTotalReparacion = $this->Kpis->getTiempoTotalReparacionxEquipo($fi, $fecha_hasta, $id_equipo);
                        /* calculo el tiempo Activo multiplicando el tiempoTotal - tiempoReparacion*/
                        $tiempoActivo =  $tiempoTotal  - $tiempoTotalReparacion;
                        
                        log_message('DEBUG','KPI ||  disponibilidadKpi || MES: '.$mesRecorrido);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotal: '.$tiempoTotal);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotalReparacion: '.$tiempoTotalReparacion);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoActivo: '.$tiempoActivo);

                        
                        #kpi disponibilidad
                        /* calculo disponibilidad (tiempoActivo / Tiempototal)*100 */
                        $disponibilidadMeses[] = round(($tiempoActivo / $tiempoTotal)*100, 2) ;

                        $cantidadFallos=  $this->Kpis->getCantidadFallosxEquipo($fi, $fecha_hasta, $id_equipo);
                        if($cantidadFallos == 0){
                        
                            $mttr[] = 0;
                            $mttf[]= round($tiempoActivo);
                        }
                        else
                        {
                            #kpi Mttr
                            $mttr[] = round($tiempoTotalReparacion/$cantidadFallos, 2);
                            
                            #kpi Mttf
                            $mttf[]= round($tiempoActivo/$cantidadFallos, 2);
                        }

                         #Guardar tiempo medio entre fallos MTBF
                         $mtbf[] = round($mttr[$i] + $mttf[$i] , 2);
                         /* si ambos valores viene en 0 el resultado es 0 */
                         if(($mtbf[$i] == 0) && ($mttr[$i] == 0))
                         {
                             $confiabilidad[] = 0 ;
                         }
                         else{
                             $confiabilidad[] = round(($mtbf[$i] / ($mtbf[$i] +  $mttr[$i])) * 100, 2) ;
                         }
                    }
                
                }
                else if($mesDesde == $mesRecorrido){
                    
                     // si el equipo esta en estado alta debe mostrar 0 o si el equipo no fue dado de alta en el tiempo recorrido
                    if($estadoEquipo == 'AL' || $fechaAltaEquipo > $fecha_desde && $fechaAltaEquipo > $ff)
                    {
                        $disponibilidadMeses[] = 0;
                        $mttr[] = 0;
                        $mttf[]= 0;
                        $confiabilidad[] = 0 ;
                        $mtbf[]= 0;
                    }
                    else{
                        #kpi disponibilidad
                        /*calculo tiempo total en base a las horas laborales de cada mes y lo multiplico por todos los equipos*/
                        
                        $tiempoTotal = $this->Kpis->getTiempoTotal($fecha_desde, $ff);

                        /*calculo tiempo total en reparacion */
                        $tiempoTotalReparacion = $this->Kpis->getTiempoTotalReparacionxEquipo($fecha_desde, $ff ,  $id_equipo);

                        /* calculo el tiempo Activo multiplicando el tiempoTotal - tiempoReparacion*/
                        $tiempoActivo =  $tiempoTotal  - $tiempoTotalReparacion;
                        log_message('DEBUG','KPI ||  disponibilidadKpi || MES: '.$mesRecorrido);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotal: '.$tiempoTotal);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotalReparacion: '.$tiempoTotalReparacion);
                        log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoActivo: '.$tiempoActivo);


                        /* calculo disponibilidad (tiempoActivo / Tiempototal)*100 */
                        $disponibilidadMeses[] =round( ($tiempoActivo / $tiempoTotal)*100, 2) ;

                        $cantidadFallos=  $this->Kpis->getCantidadFallosxEquipo($fecha_desde, $ff, $id_equipo);
                        if($cantidadFallos == 0){
                        
                            $mttr[] = 0;
                            $mttf[]= round($tiempoActivo);
                        }
                        else
                        {
                            #kpi Mttr
                            $mttr[] = round($tiempoTotalReparacion/$cantidadFallos, 2);
                            
                            #kpi Mttf
                            $mttf[]= round($tiempoActivo/$cantidadFallos, 2);
                        }

                         #Guardar tiempo medio entre fallos MTBF
                         $mtbf[] = round($mttr[$i] + $mttf[$i], 2);
                         /* si ambos valores viene en 0 el resultado es 0 */
                         if(($mtbf[$i] == 0) && ($mttr[$i] == 0))
                         {
                             $confiabilidad[] = 0 ;
                         }
                         else{
                             $confiabilidad[] = round(($mtbf[$i] / ($mtbf[$i] +  $mttr[$i])) * 100, 2) ;
                         }
                    }

                }
                    else{

                         // si el equipo esta en estado alta debe mostrar 0 o si el equipo no fue dado de alta en el tiempo recorrido
                        if($estadoEquipo == 'AL' || $fechaAltaEquipo > $fi && $fechaAltaEquipo > $ff)
                        {
                            $disponibilidadMeses[] = 0;
                            $mttr[] = 0;
                            $mttf[]= 0;
                            $confiabilidad[] = 0 ;
                            $mtbf[]= 0;
                        }
                        else{

                                #kpi disponibilidad
                                /*calculo tiempo total en base a las horas laborales de cada mes y lo multiplico por todos los equipos*/

                                $tiempoTotal = $this->Kpis->getTiempoTotal($fi, $ff);

                                /*calculo tiempo total en reparacion */
                                $tiempoTotalReparacion = $this->Kpis->getTiempoTotalReparacionxEquipo($fi, $ff,  $id_equipo);

                                /* calculo el tiempo Activo multiplicando el tiempoTotal - tiempoReparacion*/
                                $tiempoActivo =  $tiempoTotal  - $tiempoTotalReparacion;

                                log_message('DEBUG','KPI ||  disponibilidadKpi || MES: '.$mesRecorrido);
                                log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotal: '.$tiempoTotal);
                                log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoTotalReparacion: '.$tiempoTotalReparacion);
                                log_message('DEBUG','KPI ||  disponibilidadKpi || tiempoActivo: '.$tiempoActivo);


                                /* calculo disponibilidad (tiempoActivo / Tiempototal)*100 */
                                $disponibilidadMeses[] = round(($tiempoActivo / $tiempoTotal)*100, 2);

                                $cantidadFallos=  $this->Kpis->getCantidadFallosxEquipo($fi, $ff, $id_equipo);
                                
                                if($cantidadFallos == 0){
                                
                                    $mttr[] = 0;
                                    $mttf[]= round($tiempoActivo,0,'.', '');
                                }
                                else
                                {
                                    #kpi Mttr
                                    $mttr[] = number_format($tiempoTotalReparacion/$cantidadFallos, 2);
                                    
                                    #kpi Mttf
                                    $mttf[]= round($tiempoActivo/$cantidadFallos, 2);
                                }
                                #Guardar tiempo medio entre fallos MTBF
                            $mtbf[] = round($mttr[$i] + $mttf[$i], 2);
                            /* si ambos valores viene en 0 el resultado es 0 */
                            if(($mtbf[$i] == 0) && ($mttr[$i] == 0))
                            {
                                $confiabilidad[] = 0 ;
                            }
                            else{
                                $confiabilidad[] = round(($mtbf[$i] / ($mtbf[$i] +  $mttr[$i])) * 100, 2) ;
                            }

                            }
                            
                }
                 #Guardar Labels para Gráfico MES/AÑO
                 $tiempo[] =  date("m-Y", strtotime($fi));
                // Moverse al siguiente mes
                $fechaInicioObj->modify('+1 month');
                $i++;

            }


            $dataeq = $this->Kpis->getEquiposKpi($id_equipo,$id_sector,$id_grupo);
            log_message('DEBUG','KPI ||  disponibilidadKpi || $dataeq '. json_encode($dataeq));

            # Calcular Promedio Metas all
            $acum = 0;
            $cantMetas = 0;
            foreach ($dataeq as $o) {        
                if ($o["meta_disponibilidad"]) {                    
                    $acum += $o["meta_disponibilidad"];
                    $cantMetas++;
                }
            }
            $promedioMetas = ($cantMetas == 0 ? 0 : round($acum / ($cantMetas), 2));
            log_message('DEBUG','KPI ||  disponibilidadKpi || Metas: '.$acum.' CantMetas: '.$cantMetas);
            $data['promedioMetas'] = $promedioMetas;
            $data['tiempo'] =  $tiempo;
            $data['porcentajeHorasOperativas'] = $disponibilidadMeses;
            $data['mtbf']= $mtbf;
            $data['mttr'] = $mttr;
            $data['mttf'] = $mttf;
            $data['confiabilidad'] = $confiabilidad;

            log_message('DEBUG','KPI ||  disponibilidadKpi || $data '. json_encode($data));

            echo json_encode($data);
        }

        
    }


    public function getGruposxEmpresa(){
        $grupos = $this->Kpis->getGruposEmpresa();
		log_message('DEBUG',' KPI || getGruposxEmpresa '.json_encode($grupos));

        echo json_encode($grupos);
    }

    public function getSectoresxEmpresa(){
        $sectores = $this->Kpis->getSectoresEmpresa();
		//log_message('DEBUG',' KPI || getSectoresxEmpresa '.json_encode($sectores));

        echo json_encode($sectores);
    }

    public function getEquiposxGrupoSector(){

        $id_grupo = ($this->input->post('id_grupo')) ? $this->input->post('id_grupo') : '' ;
        $id_sector = ($this->input->post('id_sector')) ? $this->input->post('id_sector') : ''; 
        $equipos = $this->Kpis->getEquiposGrupoSector($id_grupo, $id_sector);
		log_message('DEBUG',' KPI || getEquiposxGrupoSector '.json_encode($equipos));

        echo json_encode($equipos);
    }

}
