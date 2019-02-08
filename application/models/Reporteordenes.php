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
        $empresaId = $userdata[0]['id_empresa'];     // guarda usuario logueado
        $this->db->select('equipos.id_equipo,
                    equipos.codigo,
                    equipos.descripcion');
        $this->db->from('equipos');
        $this->db->where('equipos.estado !=', 'AN');
        $this->db->where('equipos.id_empresa', $empresaId);
        $this->db->order_by('equipos.descripcion', 'ASC');
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

    function getordenes()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('orden_trabajo.id_orden, orden_trabajo.descripcion');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_empresa', $empresaId);
        $this->db->order_by('orden_trabajo.descripcion', 'ASC');
        $query = $this->db->get();
        if($query->num_rows()>0)
        {
            return $query->result_array();
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

    function getDatosReporte($parametros)
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];

        $this->db->select('orden_trabajo.id_orden,
            orden_trabajo.descripcion as descripcionOT, 
            tareas.descripcion AS descripcioTarea,
            equipos.codigo AS codigoEquipo,
            orden_trabajo.fecha,
            orden_trabajo.fecha_program,
            orden_trabajo.fecha_terminada,
            orden_trabajo.fecha_entregada,
            tbl_tipoordentrabajo.descripcion AS origenOT,
            tbl_estado.descripcion AS estado
        ');
        $this->db->from('orden_trabajo');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
        $this->db->join('tbl_tipoordentrabajo', 'tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
        $this->db->join('tbl_estado', 'tbl_estado.estado = orden_trabajo.estado');
        $this->db->where('orden_trabajo.id_empresa', $empresaId);

        if( $parametros['opcionEquipo'] == 1 )
        {
            $this->db->where('orden_trabajo.id_equipo', $parametros['idEquipo']);
        }
        
        if( $parametros['opcionOT'] == 1 )
        {
            $this->db->where('orden_trabajo.id_orden', $parametros['idOT']);
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