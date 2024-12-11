<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reporteordenes extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
    function getequipos()
    {
        $userdata = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('equipos.id_equipo,
                    equipos.codigo,
                    equipos.descripcion');
        $this->db->from('equipos');
        $this->db->join('grupo', 'grupo.id_grupo=equipos.id_grupo');
        $this->db->join('sector', 'sector.id_sector=equipos.id_sector');
        $this->db->join('empresas', 'empresas.id_empresa=equipos.id_empresa');
        $this->db->join('unidad_industrial', 'unidad_industrial.id_unidad=equipos.id_unidad');
        $this->db->join('criticidad', 'criticidad.id_criti=equipos.id_criticidad');
        $this->db->join('area', 'area.id_area=equipos.id_area');
        $this->db->join('proceso', 'proceso.id_proceso=equipos.id_proceso');
        $this->db->join('admcustomers', 'admcustomers.cliId=equipos.id_customer');
        $this->db->where('equipos.estado !=', 'AN');
        $this->db->where('equipos.id_empresa', $empresaId);
        $this->db->order_by('equipos.codigo', 'ASC');
        $query = $this->db->get();
        if ($query->num_rows()>0)
        {
            return $query->result_array();
        }
        else
        {
            return false;
        }
    }

    function getestados()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        //log_message('DEBUG','#Reporteordenes/getequipos | getequipos >> data: '.$userdata.' '.$empresaId);
        $this->db->select('tbl_estado.estadoid, tbl_estado.descripcion, orden_trabajo.estado');
        $this->db->join('tbl_estado', 'tbl_estado.estado = orden_trabajo.estado');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_empresa', $empresaId);
        $this->db->group_by('orden_trabajo.estado');
        $this->db->order_by('tbl_estado.descripcion', 'ASC');
        $query = $this->db->get();
        if($query->num_rows()>0)
        {
            return $query->result_array();
        }
        else{
            return false;
        }
		}		
    function getOTequipos($ideq)
    {
        $this->db->select('orden_trabajo.id_orden, orden_trabajo.descripcion as desot, orden_trabajo.fecha_inicio,orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, orden_trabajo.fecha_entregada,
            tareas.descripcion AS det,
            tbl_tipoordentrabajo.descripcion AS destipo,
            equipos.codigo, equipos.estado AS estadoeq');
        $this->db->from('orden_trabajo');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
        $this->db->join('tbl_tipoordentrabajo', 'tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
        $this->db->where('orden_trabajo.id_equipo', $ideq);
        $query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else {
            return false;
        }
    }

    function traerOrdenes($idot)
    {
        $this->db->select('orden_trabajo.id_orden, orden_trabajo.descripcion as desot, orden_trabajo.fecha_inicio,orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, orden_trabajo.fecha_entregada,
            tareas.descripcion AS det,
            tbl_tipoordentrabajo.descripcion AS destipo,
            equipos.codigo, equipos.estado AS estadoeq');
        $this->db->from('orden_trabajo');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
        $this->db->join('tbl_tipoordentrabajo', 'tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
        $this->db->where('orden_trabajo.id_orden', $idot);
        $query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
    }

    function traerOTestados($est)
    {
        $this->db->select('orden_trabajo.id_orden, orden_trabajo.descripcion as desot, orden_trabajo.fecha_inicio,orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, orden_trabajo.fecha_entregada,
            tareas.descripcion AS det,
            tbl_tipoordentrabajo.descripcion AS destipo,
            equipos.codigo, equipos.estado AS estadoeq');
        $this->db->from('orden_trabajo');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
        $this->db->join('tbl_tipoordentrabajo', 'tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
        $this->db->where('orden_trabajo.estado',  $est);
        $query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
    }

// }
//     }

    function getDatosReporte($parametros)
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        

        $this->db->select('orden_trabajo.id_orden,
            orden_trabajo.descripcion as descripcionOT, 
            tareas.descripcion as desc,
            equipos.codigo AS codigoEquipo,
            equipos.descripcion AS descripcionEquipo,
            orden_trabajo.fecha,
            orden_trabajo.fecha_program,
            orden_trabajo.fecha_terminada,
            orden_trabajo.fecha_entregada,
            CONCAT(sisusers.usrName, " ", sisusers.usrLastName) as nombre_usuario,
            tbl_tipoordentrabajo.descripcion AS origenOT,
            tbl_estado.descripcion AS estado
        ');
        $this->db->from('orden_trabajo');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea', 'left');
        $this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
        $this->db->join('tbl_tipoordentrabajo', 'tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
        $this->db->join('tbl_estado', 'tbl_estado.estado = orden_trabajo.estado');
        $this->db->join('sisusers', 'orden_trabajo.id_usuario_a = sisusers.usrId', 'left');
        
        $this->db->where('orden_trabajo.id_empresa', $empresaId);

        if( $parametros['opcionEquipo'] == 1 )
        {
            $this->db->where('orden_trabajo.id_equipo', $parametros['idEquipo']);
        }

        if( $parametros['opcionEstado'] == 1 )
        {
            $this->db->where('orden_trabajo.estado', $parametros['estado']);
        }

        if( $parametros['opcionFecha'] == 1 )
        {
            $this->db->where('orden_trabajo.fecha >=', $parametros['desde']);
            $this->db->where('orden_trabajo.fecha <=', $parametros['hasta']);
        }

        $query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else {
            return false;
        }
    }

}