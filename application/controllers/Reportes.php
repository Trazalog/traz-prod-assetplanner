<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . "/reports/tiempoDeRespuesta/TiempoDeRespuesta.php";

class Reportes extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('koolreport/Koolreport');
        $this->load->model('koolreport/Opciones_Filtros');
    }

    public function produccion()
    {
        $data = $this->input->post('data');
        $producto = $data['producto'];
        $etapa = $data['etapa'];
        $desde = $data['datepickerDesde'];
        $hasta = $data['datepickerHasta'];

        if ($producto || $etapa || $desde || $hasta) {
            $desde = ($desde) ? date("d-m-Y", strtotime($desde)) : null;
            $hasta = ($hasta) ? date("d-m-Y", strtotime($hasta)) : null;
            log_message('INFO', '#TRAZA| #REPORTES.PHP|#REPORTES|#PRODUCCION| #ETAPA: >>' . $etapa . '#DESDE: >>' . $desde . '#HASTA: >>' . $hasta);
            $url = REST_TDS . 'productos/etapa/' . $etapa . '/desde/' . $desde . '/hasta/' . $hasta . '/producto/' . $producto;
            $json = $this->Koolreport->depurarJson($url)->productos->producto;
            $reporte = new Produccion($json);
            $reporte->run()->render();
        } else {
            log_message('INFO', '#TRAZA| #REPORTES.PHP|#REPORTES|#PRODUCCION| #INGRESO');
            $url = REST_TDS . 'productos/etapa//desde//hasta//producto/';
            $json = $this->Koolreport->depurarJson($url)->productos->producto;
            log_message('DEBUG', '#TRAZA| #REPORTES.PHP|#REPORTES|#PRODRESPONSABLE| #JSON: >>' . $json);
            $reporte = new Produccion($json);
            $reporte->run()->render();
        }
    }

    public function filtroProduccion()
    {
        log_message('INFO', '#TRAZA| #REPORTES.PHP|#REPORTES|#FILTROPRODUCCION| #INGRESO');
        // $url['responsables'] = '';
        $url['productos'] = REST_TDS . 'productos/list';
        // $url['unidades_medida'] = '';
        $url['etapas'] = REST_TDS . 'etapas/all/list';

        // $valores['responsables'] = $this->Koolreport->depurarJson($url['responsables'])->responsables->responsable;
        $valores['productos'] = $this->Koolreport->depurarJson($url['productos'])->productos->producto;
        // $valores['unidades_medida'] = $this->Koolreport->depurarJson($url['unidades_medida'])->unidades->unidad;
        $valores['etapas'] = $this->Koolreport->depurarJson($url['etapas'])->etapas->etapa;

        $data['filtro'] = $this->Opciones_Filtros->filtrosProduccion($valores);
        // $data['filtro'] = $this->Opciones_Filtros->filtrosProduccion();
        // $data['numero'] = 'Cantidad'; //cambiar el campo de valor numerico para filtrado
        // $data['desde'] = true;
        // $data['hasta'] = true;
        $data['calendarioDesde'] = true;
        $data['calendarioHasta'] = true;
        $data['op'] = "produccion";

        $this->load->view('layout/Filtro', $data);
    }

    public function tiempoDeRespuesta($permisos=null)
    {
        log_message('INFO', '#ASSET| #REPORTES.PHP|#REPORTES|#TIEMPODERESPUESTA| #INGRESO');
        $a = $this->input->post('data');
        $sector = $a['sectores'];
        $equipo = $a['equipos'];
        $area = $a['areas'];
        $proceso = $a['procesos'];
        $criticidad = $a['criticidades'];
        
        //revisar si esta bien
        $desde = $a['datepickerDesde'];
        $hasta = $a['datepickerHasta'];

        if($desde || $hasta || $criticidad || $sectores || $equipos || $areas || $procesos)
        {
            //revisar si esta bien
            $desde = ($desde) ? date("d-m-Y", strtotime($desde)) : null;
            $hasta = ($hasta) ? date("d-m-Y", strtotime($hasta)) : null;
            $url = RTR.'/ordenTrabajo?desde='.$desde.'&hasta='.$hasta.'&sector='.$sector.'&equipo='.$equipo.'&area='.$area.'&proceso='.$proceso;
            
            //$url = RTR.'/ordenTrabajo?sector='.$sector.'&equipo='.$equipo.'&area='.$area.'&proceso='.$proceso;
            // $url = REST_TDS .'sectores/'.$sectores.'/equipos/'.$equipos.'/areas/'.$areas.'/procesos/'.$procesos;
            // $json = $this->Koolreport->getOrdenesDeTrabajo($url)->ordenesTrabajo->ordenTrabajo;
            $reporte = new TiempoDeRespuesta($json);
            $reporte->run()->render();
        }else
        {
            // // $url = REST_TDS .'sectores//equipos//areas//procesos';
            // $url = RTR.'/ordenTrabajo';
            // //$rsp = $this->Koolreport->depurarJson($url)->ordenesTrabajo->ordenTrabajo;
            // $rsp = $this->rest->callApi('GET', $url);
            // if($rsp['status']){
            //     $rsp = json_decode($rsp['data']);
            //     $rsp = $rsp->ordenesTrabajo->ordenTrabajo;
            //     // $array = $rsp['data'];
            //     // $array = $array->ordenesTrabajo->ordenTrabajo;
            // }
            // else{
            //     console.log('arreglo vacio');
            // }
            // //$json = $this->Koolreport->getOrdenesDeTrabajo()->ordenesTrabajo->ordenTrabajo;
            
            $rsp = $this->Koolreport->getOrdenesDeTrabajo();
            $reporte = new TiempoDeRespuesta($rsp);
            $reporte->run()->render();
        }
    }

    
    public function filtroTiempoDeRespuesta()
    {
        log_message('INFO', '#ASSET| #REPORTES.PHP|#REPORTES|#FILTROTIEMPODERESPUESTA| #INGRESO');
        $data = $this->Koolreport->getFiltrosTiempoDeRespuesta();
        $this->load->view('calendar/filtro', $data);
    }
}
