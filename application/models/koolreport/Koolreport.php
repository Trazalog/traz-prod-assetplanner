<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Koolreport extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function depurarJson($url)
    {
        $rsp = $this->rest->callApi('GET', $url);
        if ($rsp['status']) {
            $json = json_decode($rsp['data']);
        }
        log_message('DEBUG', '#TRAZA| #KOOLREPORT.PHP|#KOOLREPORT|#DEPURARJSON| #JSON: >>' . $json);
        return $json;
    }

    public function getDatosTarjeta($valores)
    {        
        // var_dump($valores);
        $res =  new StdClass();
        // $res->etapa = $valores['etapa'];
        $res->etapa = $valores[0]->etapa;
        // var_dump($valores[0]->etapa);
        // $res->responsable = $valores['responsable'];
        $res->responsable = $valores[0]->responsable;
        // $res->producto = $valores['producto'];
        $res->producto = $valores[0]->producto;
        // var_dump($res);

        log_message('DEBUG', '#TRAZA| #OPCIONES_FILTROS.PHP|#OPCIONES_FILTROS|#FILTROSPRODRESPONSABLE| #ETAPA: >>' . $res->etapa . '#RESPONSABLE: >>' . $res->responsable . '#PRODUCTO: >>' . $res->producto);
        return $res;
    }

    public function getOrdenesDeTrabajo(){

        $url = RTR.'/ordenTrabajo';
        $rsp = $this->rest->callApi('GET', $url);
        $rsp = json_decode($rsp['data']);
        $rsp = $rsp->ordenesTrabajo->ordenTrabajo;
        log_message('DEBUG', '#ASSET| #KOOLREPORT.PHP|#KOOLREPORT|#GETORDENESDETRABAJO| #ARRAY: >>' . $rsp);
        return $rsp;
    }

    public  function getFiltrosTiempoDeRespuesta()
    {

        $url = RTR.'/proceso';
        $rsp = $this->rest->callApi('GET', $url);
        $rsp = json_decode($rsp['data']);
        $data['filtro']->procesos = $rsp->procesos->proceso;

        $url = RTR.'/sector';
        $rsp = $this->rest->callApi('GET', $url);
        $rsp = json_decode($rsp['data']); 
        $data['filtro']->sectores = $rsp->sectores->sector;

        $url = RTR.'/equipo';
        $rsp = $this->rest->callApi('GET', $url);
        $rsp = json_decode($rsp['data']); 
        $data['filtro']->equipos = $rsp->equipos->equipo;

        $url = RTR.'/area';
        $rsp = $this->rest->callApi('GET', $url);
        $rsp = json_decode($rsp['data']); 
        $data['filtro']->areas = $rsp->areas->area;

        $aux = '
        {
            "criticidades":{
                "criticidad":[
                 {
                     "id":"001",
                     "descripcion":"alta"
                 },
                 {
                     "id":"002",
                     "descripcion":"media"
                 },
                 {
                     "id":"003",
                     "descripcion":"baja"
                 }
                ]
             }
        }';

        $aux = json_decode($aux);
        $data['filtro']->criticidades = $aux->criticidades->criticidad;

        // $data['filtro']->criticidad[] = 'Alta';
        // $data['filtro']->criticidad[] = 'Media';
        // $data['filtro']->criticidad[] = 'Baja';
        // $data['filtro'] = $this->Koolreport->getFiltrosTiempoDeRespuesta();
        // // $data['op'] = "produccion";
        // $array = $this->Koolreport->getFiltrosTiempoDeRespuesta();
        // $data['filtro']->equipos = $array['equipos'];
        // $data['filtro']->areas = $array['areas'];


        $data['panelReporte'] = true;
        $data['op'] = "tiempoDeRespuesta";


        //esta bien que le ponga q es un array?
        log_message('DEBUG', '#ASSET| #KOOLREPORT.PHP|#KOOLREPORT|#GETFILTROSTIEMPODERESPUESTA| #ARRAY: >>' . $data);
        return $data;
    }

}
