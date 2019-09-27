<?php defined('BASEPATH') or exit('No direct script access allowed');

class Kpi extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();

        $this->load->model('Kpis');
        $this->load->model('Equipos');
    }

    public function index()
    {
        $data['list'] = $this->Equipos->equipos_List();

        $this->load->view('test', $data);
    }

    public function index1()
    {
        $this->load->view('kpis/disponibilidad');
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
                $ff = $this->Kpis->estadoEquipoBaja($o->id_equipo, $ff, true);

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

        $promedioMetas = ($cantMetas == 0 ? 0 : number_format($acum / ($cantMetas), 2));

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

}
