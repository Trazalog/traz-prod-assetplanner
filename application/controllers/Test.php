<?php defined('BASEPATH') or exit('No direct script access allowed');

class Test extends CI_Controller
{
    public function __construct()
    {

        parent::__construct();
        $this->load->model('Kpis');
    }

    public function index()
    {
        $this->load->view('kpis/disponibilidad');
    }

    public function dsp($eq)
    {
        $tiempo = array();
        $dsp = array();
        $fecha_actual = date("Y-m-d");

        $data = $this->Kpis->getEquipos($eq == 'all'?false:$eq);
        $cant = sizeof($data);

        if($cant == 0) echo json_encode(false);

        for ($i = 0; $i < 12; $i++) {
            $fi = date("Y-m-d 00:00:00", strtotime($fecha_actual . "- $i month"));

            //Ajustar Rango de Fecha con Respecto a la primera vez que se activo el Equipo
            $ff = date("Y-m-d 23:59:59", strtotime($fi . "+ 1 month - 1 second"));

            $fi = $this->Kpis->estadoEquipo($eq, $fi);

            array_unshift($tiempo,date("m-Y", strtotime($fi)));
            
            $acum = 0;
            foreach ($data as $o) {
                $acum += $this->calcularDisponibilidad($o->id_equipo, $fi, $ff);
            }

            $dsp[$fi .' - '.$ff] = number_format($acum/$cant,2);

        }
        echo var_dump($dsp);

    }

    public function kpiDisponibilidad()
    {
        $tiempo = array();
        $dsp = array();
        $fecha_actual = date("Y-m-d");

        $eq = $this->input->post('idEquipo');

        $data = $this->Kpis->getEquipos($eq == 'all'?false:$eq);
        $cant = sizeof($data);

        if($cant == 0) echo json_encode(false);

        for ($i = 0; $i < 12; $i++) {
            $fi = date("Y-m-d 00:00:00", strtotime($fecha_actual . "- $i month"));

            //Ajustar Rango de Fecha con Respecto a la primera vez que se activo el Equipo
            $fi = $this->Kpis->estadoEquipo($eq, $fi);

            $ff = date("Y-m-d 00:00:00", strtotime($fi . "+ 1 month"));
            array_unshift($tiempo,date("m-Y", strtotime($fi)));
            
            $acum = 0;
            foreach ($data as $o) {
                $acum += $this->calcularDisponibilidad($o->id_equipo, $fi, $ff);
            }

            array_unshift($dsp, number_format($acum/$cant,2));
        }

        $acum = 0;
        foreach ($data as $o) {
            if($o->meta_dsp){
                $acum += $o->meta_dsp;
            }else{
                $cant--;
            }
        }

        $data['promedioMetas'] = number_format($acum/$cant,2);
        $data['tiempo'] = $tiempo;
        $data['porcentajeHorasOperativas'] = $dsp;
        echo json_encode($data);
    }

    public function calcularDisponibilidad($eq, $fi, $ff)
    {
        $disp = 0;
        $tc = $this->calcularMinutos($fi, $ff);

        // Historial de Lecturas
        $data = $this->Kpis->getHistorialLecturas($eq, $fi, $ff);

        if (sizeof($data) == 0) {
            return 0;
        }

        if ($data[0]->estado == 'RE') {
            $disp += $this->calcularMinutos($fi, $data[0]->fecha);
            unset($data[0]);
        }

        $fechaActivo = null;

        foreach ($data as $key => $o) {

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
