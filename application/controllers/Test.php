<?php defined('BASEPATH') or exit('No direct script access allowed');

class Test extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model('Kpis');
    }

    public function check_session(){

        $data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Customer >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

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


    public function index(){
    
        if($this->check_session()){
            $this->load->model('Tareas');

            $this->Tareas->instanciarSubtareas(233, 7);

            echo 'Hecho';
        }

    }

    public function index4()
    {
        if($this->check_session()){
            $this->load->model('traz-comp/Componentes');

            #COMPONENTE ARTICULOS
            $data['items'] = $this->Componentes->listaArticulos();
            $data['lang'] = lang_get('spanish', 'Ejecutar OT');

            if ($ot) {
                $info = new stdClass();
                $info->ortr_id = $ot;
                $data['info'] = $info;
            }
            $data['hecho'] = false;
            $this->load->view(ALM . '/notapedido/generar_pedido', $data);
        }
    }

    public function index2()
    {
        return true;
    }

    public function index1()
    {
        if($this->check_session()){
            $this->load->view('kpis/disponibilidad');
        }
    }

    public function filtro()
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
                $fi = $this->Kpis->estadoEquipo($o->id_equipo, $fi);
                $acum += $this->calcularDisponibilidad($o->id_equipo, $fi, $ff);
            }

            $dsp[$fi . ' - ' . $ff] = number_format($acum / $cant, 2);

        }
        print("<pre>" . print_r($dsp, true) . "</pre>");

    }

    public function kpiDisponibilidad()
    {
        $tiempo = array();
        $dsp = array();
        $fecha_actual = date("Y-m-d");

        $eq = $this->input->post('idEquipo');

        $data = $this->Kpis->getEquipos($eq == 'all' ? false : $eq);
        $cant = sizeof($data);

        if ($cant == 0) {
            $data['promedioMetas'] = 0;
            $data['tiempo'] = [];
            $data['porcentajeHorasOperativas'] = [];
            echo json_encode($data);
            return;
        }

        for ($i = 0; $i < 12; $i++) {
            $fi = date("Y-m-01 00:00:00", strtotime($fecha_actual . "- $i month"));

            $ff = ($i == 0 ? date("Y-m-d H:i:00") : date("Y-m-d 23:59:59", strtotime($fi . "+ 1 month - 1 second")));

            //Ajustar Rango de Fecha con Respecto a la primera vez que se activo el Equipo

            array_unshift($tiempo, date("m-Y", strtotime($fi)));

            $acum = 0;
            foreach ($data as $o) {
                $fi = $this->Kpis->estadoEquipo($o->id_equipo, $fi);
                $acum += $this->calcularDisponibilidad($o->id_equipo, $fi, $ff);
            }

            array_unshift($dsp, number_format($acum / $cant, 2));
        }

        $acum = 0;
        foreach ($data as $o) {
            if ($o->meta_dsp) {
                $acum += $o->meta_dsp;
            } else {
                $cant--;
            }
        }

        $data['promedioMetas'] = number_format($acum / $cant, 2);
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
            $his = $this->Kpis->getHistorialLecturas($eq, false, $fi);
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

    public function conexion()
    {
        return true;
    }

    public function test()
    {
        $this->load->view('test1');
    }

    public function A()
    {
        echo 'A';
    }
    public function B()
    {
        echo 'B';
    }
    public function C()
    {
        echo 'C';
    }

    public function testeando(){
        $token = $_POST['currentToken'];
        echo $token;
    }
}
