<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reportepedidos extends CI_Model {
    
	function __construct()
	{
		parent::__construct();
	}

    function getequipos($ideq)
    {
        $this->db->select('equipos.id_equipo, equipos.descripcion AS deseq, equipos.fecha_ingreso, equipos.codigo, tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_detanotapedido.id_detaNota, tbl_detanotapedido.artId, tbl_detanotapedido.cantidad, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.estado AS estdet, abmproveedores.provid, abmproveedores.provnombre, articles.artBarCode, articles.artDescription, orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, fecha_entregada, orden_trabajo.descripcion AS desot, orden_trabajo.id_solicitud, orden_trabajo.tipo, tareas.id_tarea, tareas.descripcion AS deta');
        $this->db->from('equipos');
        $this->db->join('orden_trabajo', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->join('tbl_notapedido', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('equipos.id_equipo', $ideq);
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

    function getReporteEstados()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];

        $this->db->select('tbl_detanotapedido.id_detaNota, tbl_detanotapedido.estado');
        $this->db->from('tbl_detanotapedido');
        $this->db->join('tbl_estado', 'tbl_estado.estado = orden_trabajo.estado');
        $this->db->join('orden_trabajo', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
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

    function getfechas($resul, $resul1){

        $this->db->select('equipos.id_equipo, equipos.descripcion AS deseq, equipos.fecha_ingreso, equipos.codigo, tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_detanotapedido.id_detaNota, tbl_detanotapedido.artId, tbl_detanotapedido.cantidad, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.estado AS estdet, abmproveedores.provid, abmproveedores.provnombre, articles.artBarCode, articles.artDescription, orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, fecha_entregada, orden_trabajo.descripcion AS desot, orden_trabajo.id_solicitud, orden_trabajo.tipo, tareas.id_tarea, tareas.descripcion AS deta');
        $this->db->from('equipos');
        $this->db->join('orden_trabajo', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->join('tbl_notapedido', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('tbl_notapedido.fecha >=',  $resul);
        $this->db->where('tbl_notapedido.fecha <=', $resul1);
        $query= $this->db->get();
    
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
            }


    }

    function getarticulos()
    {
		$this->db->select('*');
        $this->db->from('articles');
        $query = $this->db->get();
		if ($query->num_rows()!=0)
        {
			$i = 0;
			foreach ($query->result() as $row){
                $data[$i]["artBarCode"]     = $row->artBarCode;
                $data[$i]["artDescription"] = $row->artDescription;
                $data[$i]["artId"]          = $row->artId;
			   $i++;
			}		
	        return $data;
	    }
	}

    function getordenes()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('*');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_empresa', $empresaId);
        $query = $this->db->get();
        if ($query->num_rows()!=0){
            $i = 0;
            foreach ($query->result() as $row){
               $data[$i]["descripcion"] = $row->descripcion;
               $data[$i]["id_orden"]    = $row->id_orden;
               $i++;
            }       
            return $data;
        }
    }

    function getnotas()
    {
        $this->db->select('*');
        $this->db->from('tbl_notapedido');
        $query = $this->db->get();
        if ($query->num_rows()!=0){
            $i = 0;
            foreach ($query->result() as $row){
                $data[$i]['id_ordTrabajo'] = $row->id_ordTrabajo;
                $data[$i]['fecha']         = $row->fecha;
                $data[$i]['id_notaPedido'] = $row->id_notaPedido;
                $i++;
            }       
            return $data;
        }
    }

	function traerArticulos($idart){


        $this->db->select('equipos.id_equipo, equipos.descripcion AS deseq, equipos.fecha_ingreso, equipos.codigo, tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_detanotapedido.id_detaNota, tbl_detanotapedido.artId, tbl_detanotapedido.cantidad, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.estado AS estdet, abmproveedores.provid, abmproveedores.provnombre, articles.artBarCode, articles.artDescription, orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, fecha_entregada, orden_trabajo.descripcion AS desot, orden_trabajo.id_solicitud, orden_trabajo.tipo, tareas.id_tarea, tareas.descripcion AS deta');
        $this->db->from('equipos');
        $this->db->join('orden_trabajo', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->join('tbl_notapedido', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('articles.artId',  $idart);
        
        $query= $this->db->get();


    
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }

	}

    function calestados($est){


        $this->db->select('equipos.id_equipo, equipos.descripcion AS deseq, equipos.fecha_ingreso, equipos.codigo, tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_detanotapedido.id_detaNota, tbl_detanotapedido.artId, tbl_detanotapedido.cantidad, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.estado AS estdet, abmproveedores.provid, abmproveedores.provnombre, articles.artBarCode, articles.artDescription, orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, fecha_entregada, orden_trabajo.descripcion AS desot, orden_trabajo.id_solicitud, orden_trabajo.tipo, tareas.id_tarea, tareas.descripcion AS deta');
        $this->db->from('equipos');
        $this->db->join('orden_trabajo', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->join('tbl_notapedido', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('tbl_detanotapedido.estado',  $est);
        
        $query= $this->db->get();


    
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }

    }
    function calnotas($idnot){


        $this->db->select('equipos.id_equipo, equipos.descripcion AS deseq, equipos.fecha_ingreso, equipos.codigo, tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_detanotapedido.id_detaNota, tbl_detanotapedido.artId, tbl_detanotapedido.cantidad, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.estado AS estdet, abmproveedores.provid, abmproveedores.provnombre, articles.artBarCode, articles.artDescription, orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, fecha_entregada, orden_trabajo.descripcion AS desot, orden_trabajo.id_solicitud, orden_trabajo.tipo, tareas.id_tarea, tareas.descripcion AS deta');
        $this->db->from('equipos');
        $this->db->join('orden_trabajo', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->join('tbl_notapedido', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('tbl_notapedido.id_notaPedido',  $idnot);
        
        $query= $this->db->get();


    
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }


    }
    
    function traerorden($idot){

        $this->db->select('equipos.id_equipo, equipos.descripcion AS deseq, equipos.fecha_ingreso, equipos.codigo, tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_detanotapedido.id_detaNota, tbl_detanotapedido.artId, tbl_detanotapedido.cantidad, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.estado AS estdet, abmproveedores.provid, abmproveedores.provnombre, articles.artBarCode, articles.artDescription, orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, fecha_entregada, orden_trabajo.descripcion AS desot, orden_trabajo.id_solicitud, orden_trabajo.tipo, tareas.id_tarea, tareas.descripcion AS deta');
        $this->db->from('equipos');
        $this->db->join('orden_trabajo', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->join('tbl_notapedido', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('orden_trabajo.id_orden',  $idot);
        
        $query= $this->db->get();


        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }

    }

    
    function guardaroteq($idot,$ideq){

        $this->db->select('equipos.id_equipo, equipos.descripcion AS deseq, equipos.fecha_ingreso, equipos.codigo, tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_detanotapedido.id_detaNota, tbl_detanotapedido.artId, tbl_detanotapedido.cantidad, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.estado AS estdet, abmproveedores.provid, abmproveedores.provnombre, articles.artBarCode, articles.artDescription, orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, fecha_entregada, orden_trabajo.descripcion AS desot, orden_trabajo.id_solicitud, orden_trabajo.tipo, tareas.id_tarea, tareas.descripcion AS deta');
        $this->db->from('equipos');
        $this->db->join('orden_trabajo', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->join('tbl_notapedido', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('orden_trabajo.id_orden',  $idot);
        $this->db->where('orden_trabajo.id_equipo',  $ideq);
        $query= $this->db->get();


        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }

    }


    function guardarestaeq($estad,$ideq){

        $this->db->select('equipos.id_equipo, equipos.descripcion AS deseq, equipos.fecha_ingreso, equipos.codigo, tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_notapedido.id_ordTrabajo, tbl_detanotapedido.id_detaNota, tbl_detanotapedido.artId, tbl_detanotapedido.cantidad, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.estado AS estdet, abmproveedores.provid, abmproveedores.provnombre, articles.artBarCode, articles.artDescription, orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, fecha_entregada, orden_trabajo.descripcion AS desot, orden_trabajo.id_solicitud, orden_trabajo.tipo, tareas.id_tarea, tareas.descripcion AS deta');
        $this->db->from('equipos');
        $this->db->join('orden_trabajo', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->join('tbl_notapedido', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('orden_trabajo.id_equipo',  $ideq);
        $this->db->where('tbl_detanotapedido.estado',  $estad);
        $query= $this->db->get();


        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }

    }

    function guardareqfechas($resul,$resul1,$ideq){

        $this->db->select('equipos.id_equipo, equipos.descripcion AS deseq, equipos.fecha_ingreso, equipos.codigo, tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_notapedido.id_ordTrabajo, tbl_detanotapedido.id_detaNota, tbl_detanotapedido.artId, tbl_detanotapedido.cantidad, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.estado AS estdet, abmproveedores.provid, abmproveedores.provnombre, articles.artBarCode, articles.artDescription, orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, fecha_entregada, orden_trabajo.descripcion AS desot, orden_trabajo.id_solicitud, orden_trabajo.tipo, tareas.id_tarea, tareas.descripcion AS deta');
        $this->db->from('equipos');
        $this->db->join('orden_trabajo', 'orden_trabajo.id_equipo = equipos.id_equipo');
        $this->db->join('tbl_notapedido', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
        $this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea');
        $this->db->where('orden_trabajo.id_equipo',  '$ideq');
        $this->db->where('tbl_notapedido.fecha >=',  '$resul');
        $this->db->where('tbl_notapedido.fecha <=', '$resul1');
        $query= $this->db->get();


        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }

    }



    function getReporteArt($data)
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        //dump_exit($data);

        $id_equipo     = $data['id_equipo'];
        $id_ot         = $data['id_ot'];
        $id_articulo   = $data['id_articulo'];
        $id_estado     = $data['id_estado'];
        $id_notaPedido = $data['id_notaPedido'];

        if (($data['desde'] !== "") || ($data['hasta'] !== "")) {
            $datDesde = $data['desde'];
            $datDesde = explode('-', $datDesde);
            $desde    = $datDesde[2].'-'.$datDesde[1].'-'.$datDesde[0];
            $datHasta = $data['hasta'];
            $datHasta = explode('-', $datHasta);
            $hasta    = $datHasta[2].'-'.$datHasta[1].'-'.$datHasta[0];
        }
        $this->db->select('orden_trabajo.nro,
            tbl_detanotapedido.id_detaNota,
            tbl_detanotapedido.id_notaPedido,
            tbl_detanotapedido.artId,
            tbl_detanotapedido.cantidad,
            tbl_detanotapedido.provid,
            tbl_detanotapedido.fechaEntrega,
            tbl_detanotapedido.fechaEntregado,
            tbl_detanotapedido.remito,
            tbl_detanotapedido.estado,
            tbl_notapedido.id_ordTrabajo,
            tbl_notapedido.fecha,
            articles.artDescription,
            abmproveedores.provnombre'
        );
        $this->db->from('tbl_notapedido');
        $this->db->join('orden_trabajo', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
        $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
        $this->db->join('articles', 'tbl_detanotapedido.artId = articles.artId');
        
        if ($id_equipo !== "") {
            $this->db->join('equipos', 'orden_trabajo.id_equipo = equipos.id_equipo');
            $this->db->where('equipos.id_equipo', $id_equipo);
        }
        if ($id_ot !== "") {
            $this->db->where('orden_trabajo.id_orden', $id_ot);
        }
        if ($id_articulo !== "") {
            $this->db->where('articles.artId', $id_articulo);
        }
        if ($id_estado !== "") {
            $this->db->where('tbl_detanotapedido.estado', $id_estado);
        }
        if ($id_notaPedido !== "") {
            $this->db->where('tbl_detanotapedido.id_notaPedido', $id_notaPedido);
        }
        if ($data['desde'] || $data['hasta'] !== "") {
            $this->db->where('tbl_notapedido.fecha >=', $desde);
            $this->db->where('tbl_notapedido.fecha <=', $hasta);
        }
        //$this->db->where('tbl_detanotapedido.estado', 'C');
        $this->db->where('orden_trabajo.id_empresa', $empresaId);
        $query = $this->db->get();
        if ($query->num_rows()!=0)
        {
            //dump_exit($query->result_array());
            return $query->result_array();  
        }
        else
        {   
            return array();
        } 
    }

}
