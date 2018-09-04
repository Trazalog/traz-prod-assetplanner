<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reporteordenes extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
    function getordenes()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('orden_trabajo.id_orden, orden_trabajo.descripcion');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_empresa', $empresaId);
        $query = $this->db->get();
        if($query->num_rows()>0)
        {
            return $query->result();
        }
        else{
            return false;
        }
    }

    function getestados()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('tbl_estado.estadoid, tbl_estado.descripcion, orden_trabajo.estado');
        $this->db->join('tbl_estado', 'tbl_estado.estado = orden_trabajo.estado');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_empresa', $empresaId);
        $this->db->group_by('orden_trabajo.estado');
        $query = $this->db->get();
        if($query->num_rows()>0)
        {
            return $query->result();
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

}