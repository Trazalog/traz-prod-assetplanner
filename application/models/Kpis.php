<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Kpis extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function getHistorialLecturas($id, $fi = false, $ff = false)
    {
        if ($fi) {
            $this->db->where('fecha >=', $fi);
        }

        if ($ff) {
            $this->db->where('fecha <', $ff);
        }

        $this->db->where('id_equipo', $id);
        $this->db->order_by('fecha', 'asc');
        return $this->db->get('historial_lecturas')->result();
    }

    public function getEquiposKpi($id,$sector,$grupo){

        log_message('DEBUG','KPI ||  getEquiposKpi || Equipo: '.$id.' Sector: '.$sector.' Grupo: '.$grupo);
		        
		$this->db->select('equipos.id_equipo, meta_disponibilidad');									
		$this->db->from('equipos');		
		$this->db->where("(equipos.estado = 'AC' or equipos.estado ='RE')");	
        if ($id != 'all') {
            log_message('DEBUG','KPI ||  getEquiposKpi || Entro Equipo: '.$id);
            $this->db->where('equipos.id_equipo', $id);
        }
        if($sector != ''){
            log_message('DEBUG','KPI ||  getEquiposKpi || Entro Sector: '.$sector);
            $this->db->where('equipos.id_sector', $sector);
        }
        if($grupo !=''){
            log_message('DEBUG','KPI ||  getEquiposKpi || Entro Grupo:'.$grupo);
            $this->db->where('equipos.id_grupo', $grupo);
        }
		$query = $this->db->get();
        
		return $query->result_array();
    }

    public function getEquipos($id = false)
    {

        $empId = empresa();

        $this->db->select('equipos.id_equipo, meta_disponibilidad as meta_dsp');
        $this->db->from('equipos');
        #$this->db->where("(estado = 'AC' or estado ='RE')");
        $this->db->where('estado!=', 'AL');
        $this->db->where('equipos.id_empresa', $empId);

        if ($id) {
            $this->db->where('equipos.id_equipo', $id);
        }

        $this->db->order_by('equipos.id_equipo', 'ASC');

        return $this->db->get()->result();
    }

    public function estadoEquipoAlta($eq, $fecha, $checkMes = false)
    {
        $his = $this->getHistorialLecturas($eq);

        if (!$his) {
            return $fecha;
        }

        $fechaAlta = $his[0]->fecha;

        $f1 = strtotime($fechaAlta);
        $f2 = strtotime($fecha);
        if($checkMes && (date('m', $f1) != date('m', $f2))) return $fecha; 
        return ( $f1 > $f2) ? $fechaAlta : $fecha;
    }

    public function estadoEquipoBaja($eq, $fecha, $checkMes = false)
    {
        $his = $this->getHistorialLecturas($eq);

        if (!$his ||  end($his)->estado!='IN') {
            return $fecha;
        }

        $fechaBaja = end($his)->fecha;

        $f1 = strtotime($fechaBaja);
        $f2 = strtotime($fecha);
        if($checkMes && (date('m', $f1) != date('m', $f2))) return $fecha; 
        return ( $f1 < $f2) ? $fechaBaja : $fecha;
    }


    /**
     * trae los grupos de una empresa 
     * param $id_grupo 
     * @return  Array con los grupos que pertenecen a esa empresa
     */
     public function getGruposEmpresa($id_grupo = false){
        
        $empId = empresa();

        $this->db->select('grupo.id_grupo, grupo.descripcion');
        $this->db->from('grupo');
        $this->db->where('estado!=', 'AN');
        $this->db->where('grupo.id_empresa', $empId);

        if ($id_grupo) {
            $this->db->where('grupo.id_grupo', $id_grupo);
        }

        $this->db->order_by('grupo.id_grupo', 'ASC');

        return $this->db->get()->result();
    }

     /**
     * trae los sectores de una empresa 
     * param $id_sector 
     * @return  Array con los sectores que pertenecen a esa empresa
     */
    public function getSectoresEmpresa($id_sector = false){
        
        $empId = empresa();

        $this->db->select('sector.id_sector, sector.descripcion');
        $this->db->from('sector');
        $this->db->where('estado!=', 'AN');
        $this->db->where('sector.id_empresa', $empId);

        if ($id_sector) {
            $this->db->where('sector.id_sector', $id_sector);
        }

        $this->db->order_by('sector.id_sector', 'ASC');

        return $this->db->get()->result();
    }


   /**
     * trae los equipos de un grupo/sector de una empresa 
     * param $id_sector y/o $id_grupo
     * @return  Array con los equipos que pertenecen a ese sector y/o grupo
     */
    public function getEquiposGrupoSector($id_grupo = null, $id_sector = null)
    {
        $empId = empresa();

        $this->db->select('equipos.id_equipo, equipos.descripcion, equipos.codigo');
        $this->db->from('equipos');
        $this->db->where('estado!=', 'AN');
        $this->db->where('equipos.id_empresa', $empId);

        if ($id_grupo) {
            $this->db->where('equipos.id_grupo', $id_grupo);
        }

        if ($id_sector) {
            $this->db->where('equipos.id_sector', $id_sector);
        }

        $this->db->order_by('equipos.id_equipo', 'ASC');

        return $this->db->get()->result();
    }


    /**
     * Trae datos de disponibilidad x fecha desde y hasta
     * @param date;date;  $fecha_desde, $fecha_hasta
     * @return Array  valor de disponibilidad, 0 en caso de que sea false
     */
    public function getDisponibilidadxFecha($fecha_desde, $fecha_hasta)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."kpiDisponibilidadxFecha/".$empId."/fecinicio/".$fecha_desde."/fecfin/".$fecha_hasta."/idempr/".$empId."/fecinicio2/".$fecha_desde."/fecfin2/".$fecha_hasta);
		$aux =json_decode($aux["data"]);
		
        if ($aux->respuesta->disponibilidad) {
			return $aux->respuesta->disponibilidad;
		} else {
			return  0;
		}
		
    }

    /**
     * Trae datos de disponibilidad x fecha desde y hasta por equipo
     * @param date;date;interger  $fecha_desde, $fecha_hasta, $id_equipo
     * @return  Array  valor de disponibilidad, 0 en caso de que sea false
     */
    public function getDisponibilidadxFechaxEquipo($fecha_desde, $fecha_hasta, $id_equipo)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."kpiDisponibilidadxFechaxEquipo/".$empId."/idEquipo/".$id_equipo."/fecinicio/".$fecha_desde."/fecfin/".$fecha_hasta."/idempr/".$empId."/idEquipo2/".$id_equipo."/fecinicio2/".$fecha_desde."/fecfin2/".$fecha_hasta);
		$aux =json_decode($aux["data"]);
		
        if ($aux->respuesta->disponibilidad) {
			return $aux->respuesta->disponibilidad;
		} else {
			return  0;
		}
		
    }

    
    /**
     * Trae datos de mttr x fecha desde y hasta
     * @param date;date;  $fecha_desde, $fecha_hasta
     * @return Array valor de mttr, 0 en caso de que sea false
     */
    public function getMttrxFecha($fecha_desde, $fecha_hasta)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."KpiMttrxFecha/empresa/".$empId."/fec_inicio/".$fecha_desde."/fec_fin/".$fecha_hasta."/empresa2/".$empId."/fec_inicio2/".$fecha_desde."/fec_fin2/".$fecha_hasta);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->mttr) {
			return $aux->respuesta->mttr;
		} else {
			return  0;
		}
		
    }

    /**
     * Trae datos de mttr x fecha desde y hasta
     *  @param date;date;interger  $fecha_desde, $fecha_hasta, $id_equipo
     * @return Array valor de mttr, 0 en caso de que sea false
     */
    public function getMttrxFechaxEquipo($fecha_desde, $fecha_hasta, $id_equipo)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."KpiMttrxFechaxEquipo/empresa/".$empId."/equipo/".$id_equipo."/fecinicio/".$fecha_desde."/fecfin/".$fecha_hasta."/empresa2/".$empId."/equipo2/".$id_equipo."/fecinicio2/".$fecha_desde."/fecfin2/".$fecha_hasta);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->mttr) {
			return $aux->respuesta->mttr;
		} else {
			return  0;
		}
		
    }

    
    /**
     * Trae datos de mttf x fecha desde y hasta
     * @param date;date;  $fecha_desde, $fecha_hasta
     * @return Array valor de mttf, 0 en caso de que sea false
     */
    public function getMttfxFecha($fecha_desde, $fecha_hasta)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."KpiMttfxFecha/empresa/".$empId."/fec_inicio/".$fecha_desde."/fec_fin/".$fecha_hasta."/empresa2/".$empId."/fec_inicio2/".$fecha_desde."/fec_fin2/".$fecha_hasta);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->mttf) {
			return $aux->respuesta->mttf;
		} else {
			return  0;
		}
		
    }


    /**
     * Trae datos de mttf x fecha desde y hasta
     *  @param date;date;interger  $fecha_desde, $fecha_hasta, $id_equipo
     * @return Array valor de mttf, 0 en caso de que sea false
     */
    public function getMttfxFechaxEquipo($fecha_desde, $fecha_hasta, $id_equipo)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."KpiMttfxFechaxEquipo/empresa/".$empId."/equipo/".$id_equipo."/fecinicio/".$fecha_desde."/fecfin/".$fecha_hasta."/empresa2/".$empId."/equipo2/".$id_equipo."/fecinicio2/".$fecha_desde."/fecfin2/".$fecha_hasta);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->mttf) {
			return $aux->respuesta->mttf;
		} else {
			return  0;
		}
		
    }


    /**
     * Trae el tiempo total en horas de un mes
     *  @param date;date;interger  $fecha_desde, $fecha_hasta, $horas_laborales
     * @return Array tiempo total, 0 en caso de que sea false
     */
    public function getTiempoTotal($fecha_desde, $fecha_hasta)
    {
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."getTiempoTotal/".$fecha_desde."/".$fecha_hasta);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->tiempo_total) {
			return $aux->respuesta->tiempo_total;
		} else {
			return  0;
		}
		
    }

    /**
     * Trae el tiempo total en reparacion en horas de un mes de todos los equipos 
     *  @param date;date;interger  $fecha_desde, $fecha_hasta, $horas_laborales
     * @return Array valor de tiempo total de reparacion, 0 en caso de que sea false
     */
    public function getTiempoTotalReparacion($fecha_desde, $fecha_hasta, $id_sector, $id_grupo)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."getTiempoTotalReparacion/".$fecha_desde."/".$fecha_hasta."/".$fecha_desde."/".$fecha_hasta."/".$empId."/".$id_sector."/".$id_grupo);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->tiempo_total_reparacion) {
			return $aux->respuesta->tiempo_total_reparacion;
		} else {
			return  0;
		}
		
    }

        /**
     * Trae el tiempo total en reparacion en horas de un equipo
     * @param date;date;interger;interger  $fecha_desde, $fecha_hasta, $horas_laborales, $id_equipo
     * @return Array valor de tiempo total de reparacion, 0 en caso de que sea false
     */
    public function getTiempoTotalReparacionxEquipo($fecha_desde, $fecha_hasta, $id_equipo)
    {
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."getTiempoTotalReparacionxEquipo/".$fecha_desde."/".$fecha_hasta."/".$fecha_desde."/".$fecha_hasta."/".$id_equipo);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->tiempo_total_reparacion) {
			return $aux->respuesta->tiempo_total_reparacion;
		} else {
			return  0;
		}
		
    }



            /**
     * Trae la cantidad de equipos de una empresa con estado AC o RE
     * @return int cantidad de equipos
     */
    public function getCantEquiposxEmpresa()
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."getCantEquiposxEmpresa/".$empId);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->cantidad) {
			return $aux->respuesta->cantidad;
		} else {
			return  0;
		}
		
    }

      /**
     * Trae la cantidad de equipos de una empresa con estado AC, RE x grupo o sector
     * @return int cantidad de equipos
     */
    public function getCantEquiposxEmpresaxSectorxGrupo($id_sector, $id_grupo, $fecha_inicio, $fecha_fin)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."getCantEquiposxEmpresaxSectorxGrupo/".$empId."/".$id_sector."/".$id_grupo."/".$fecha_inicio."/".$fecha_fin);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->cantidad) {
			return $aux->respuesta->cantidad;
		} else {
			return  0;
		}
		
    }

     /**
     * Trae la cantidad de fallos de equipos de una empresa
     * @return int cantidad de equipos con fallos
     */
    public function getCantidadFallos($fecha_desde, $fecha_hasta, $id_sector, $id_grupo)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."getCantidadFallos/".$fecha_desde."/".$fecha_hasta."/".$empId."/".$id_sector."/".$id_grupo);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->numero_fallos) {
			return $aux->respuesta->numero_fallos;
		} else {
			return  0;
		}
		
    }


     /**
     * Trae la cantidad de fallos de un equipo
     * @return int cantidad de fallos x equipo
     */
    public function getCantidadFallosxEquipo($fecha_desde, $fecha_hasta, $id_equipo)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."getCantidadFallosxEquipo/".$fecha_desde."/".$fecha_hasta."/".$empId."/".$id_equipo);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->numero_fallos) {
			return $aux->respuesta->numero_fallos;
		} else {
			return  0;
		}
		
    }

     /**
     * Trae el estado de un equipo
     * @return int estado actual de un equipo
     */
    public function getEstadoEquipo($id_equipo)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."getEstadoEquipo/".$id_equipo);
		$aux =json_decode($aux["data"]);

        if ($aux->estados->estado) {
			return $aux->estados->estado;
		} else {
			return  false;
		}
		
    }

    
 /**
     * Trae el estado de un equipo
     * @return int estado actual de un equipo
     */
    public function fechaAltaEquipo($id_equipo)
    {
        $empId = empresa();
        $ci =& get_instance();
		$aux = $ci->rest->callAPI("GET",REST_MAN."getFechaAltaEquipo/".$empId."/".$id_equipo);
		$aux =json_decode($aux["data"]);

        if ($aux->respuesta->fecha) {
			return $aux->respuesta->fecha;
		} else {
			return  false;
		}
    }

}
