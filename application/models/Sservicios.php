<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sservicios extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	// Trae solicitudes en estado en Curso por empresa logueada 	
	function servicios_List()
	{			
		$userdata = $this->session->userdata('user_data');
		$usrId    = $userdata[0]['usrId'];   
		$grupoId  = $userdata[0]["grpId"];
		$empId    = $userdata[0]['id_empresa'];
		//$empId    = 7;
		
		$this->db->select('solicitud_reparacion.*,
											equipos.codigo as equipo, 
											sector.descripcion as sector, 
											grupo.descripcion as grupo, 
											equipos.ubicacion');
		$this->db->from('solicitud_reparacion');
		$this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
		$this->db->join('sector', 'equipos.id_sector = sector.id_sector');
		$this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo');
		$this->db->where('solicitud_reparacion.id_empresa', $empId);
		$this->db->where('solicitud_reparacion.estado !=', 'T');
		$this->db->where('solicitud_reparacion.estado !=', 'AN');
		//$this->db->where('solicitud_reparacion.estado', 'C');
		//$this->db->or_where('solicitud_reparacion.estado', 'S');
		$query = $this->db->get();
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{
			return false;
		}
	}	

	// Elimina solicitud - Listo
	function elimSolicitudes($id){
		$estado = array(
		        'estado' => 'AN'		        
				);

		$this->db->where('id_solicitud', $id);
		$this->db->update('solicitud_reparacion', $estado);
	}			
	
	// Trae equipos segun sector de empresa logueada
	function getEquipSectores($data = null)
	{
		$id = $data["id_sector"];
		$this->db->select('equipos.id_equipo, equipos.codigo');
        $this->db->from('equipos');
        $this->db->where('equipos.estado !=', 'AN');
        $this->db->where('equipos.id_sector', $id);
        $query = $this->db->get();
		if ($query->num_rows()!=0)
		{
			$i = 0;
			foreach ($query->result() as $row)
			{   
			   $data2[$i]["descripcion"] = $row->codigo;
			   $data2[$i]["id_equipo"]   = $row->id_equipo;
			   $i++;
			}		
	        return $data2;
	    } else {
	    	return null;
	    }
	}	
	
	// Trae sectores por empresa logueada - Listo
	function getSectores()
	{
		$userdata = $this->session->userdata('user_data');
		$empId    = $userdata[0]['id_empresa'];  

		$this->db->select('sector.id_Sector, sector.descripcion');
    	$this->db->from('sector');    	
    	$this->db->where('sector.id_empresa', $empId);
    	$this->db->where('sector.estado !=', 'AN');
		$query = $this->db->get();

		$i     = 0;
        foreach ($query->result() as $row)
        {
        	$sectores[$i]['label'] = $row->descripcion;
            $sectores[$i]['value'] = $row->id_Sector;
            $i++;
        }
        return $sectores;
    }

	//Trae datos para impresion de solicitud - Listo	
	function getsolImps($id){
		
		$this->db->select('solicitud_reparacion.solicitante, 
							solicitud_reparacion.f_solicitado, 
							solicitud_reparacion.f_sugerido, 
							solicitud_reparacion.hora_sug, 
							solicitud_reparacion.causa, 
							equipos.codigo, 
							equipos.ubicacion, 
							equipos.id_sector, 
							equipos.id_grupo, 
							grupo.descripcion AS degr, 
							sector.descripcion AS sec');
    	$this->db->from('solicitud_reparacion');
    	$this->db->join('equipos', 'equipos.id_equipo = solicitud_reparacion.id_equipo');
    	$this->db->join('grupo', 'grupo.id_grupo=equipos.id_grupo');
    	$this->db->join('sector', 'sector.id_sector=equipos.id_sector');
    	$this->db->where('solicitud_reparacion.id_solicitud', $id);
    	$query= $this->db->get();
	   	
		foreach ($query->result_array() as $row){		
					
	        $data['f_solicitado'] = $row['f_solicitado'];
	        $data['solicitante'] = $row['solicitante'];
	        $data['causa'] = $row['causa'];
	        $data['hora_sug'] = $row['hora_sug'];
	        $data['codigo'] = $row['codigo'];
	        $data['ubicacion'] = $row['ubicacion'];
	        $data['degr'] = $row['degr'];
	        $data['sec'] = $row['sec'];
	       
	       return $data; 
		}
	}

	// Guarda solicitud de Servicio - Listo
	function setservicios($data = null)
	{ 	
		if($data == null)
		{
			return false;
		}
		else
		{			
			$equipId  = $data['equip'];//
			$solicita = $data['solici'];//
			$dia      = $data['fecha'];//
			$dia      = explode('-', $dia);
			$hora     = $data['hora'];//
			$min      = $data['min'];//
			$falla    = $data['falla'];//
			//$idPreventivo = $data['id_prev'];
			$userdata = $this->session->userdata('user_data');
        	$empId    = $userdata[0]['id_empresa'];
			
			// if ($idPreventivo !== "") { //actualiza fecha preventivo (fecha sistema)
			// 	  $fechUltimo['ultimo'] = date('Y-m-d H:i:s');
			//    $this->db->where('prevId', $idPreventivo);
			//    $this->db->update('preventivo', $fechUltimo);		        
			// }

			$userdata = $this->session->userdata('user_data');
			$usrId    = $userdata[0]['usrId'];     // guarda usuario logueado
			$insert   = array(
				'f_solicitado' => date('Y-m-d H:i:s'), 
				'f_sugerido'   => $dia[2].'-'.$dia[1].'-'.$dia[0],
				'hora_sug'     => $hora.':'.$min,
				'id_equipo'    => $equipId,
				'estado'       => 'S',	// graba estado Solicitado, cambia a 'C' en Ord Serv
				'usrId'        => $usrId,
				'solicitante'  => $solicita,
				'causa'        => $falla,
				'foto'         => 'assets/files/orders/sinImagen.jpg',
				'id_empresa'   => $empId
			);
			$this->db->insert('solicitud_reparacion', $insert);

            if ($this->db->trans_status() === FALSE){
                 return false;  
             }
             else{
                 return true;
             } 

				// if($this->db->insert('solicitud_reparacion', $insert) == false) {
				// 	return false;
				// }else{
				// 	return "Se programo la Solicitud de Servicio para el día <br>".$data['fecha']." a las ".$data['hora'].":".$data['min'];
				// }	


		}	
	}	
	

//////// no vistas

	// Trae solicitudes en estado Terminado
	function get_SolicTerminadas(){		
		
		$this->db->select('solicitud_reparacion.*,
			equipos.descripcion as equipo, 
			sector.descripcion as sector, 
			grupo.descripcion as grupo, 
			equipos.ubicacion');
		$this->db->from('solicitud_reparacion');
		$this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
		$this->db->join('sector', 'equipos.id_sector = sector.id_sector');
		$this->db->join('grupo', 'equipos.id_grupo = grupo.id_grupo');				
		$this->db->where('solicitud_reparacion.estado', 'T');
		$this->db->order_by('solicitud_reparacion.id_solicitud','DESC');
		$query= $this->db->get();

		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{
			return false;
		}
	}

	// Activa solicitudes terminadas.
	function activSolicitudes($data){ 

		$this->db->trans_start();   

			$id_solicitud = $data['id_solicitud']; 	

	        $estado['estado'] = 'S';
	        $this->db->where('id_solicitud', $id_solicitud);
	        $this->db->update('solicitud_reparacion', $estado);

        $this->db->trans_complete();

		if ($this->db->trans_status() === FALSE)
		{
		 return false;  
		} else{
		 return true;
		}  
	}



	// Guarda confirmacion de Solicitud de Servicio, por usr que la hizo
	function confSolicitudes($data){
		
		$id = $data['id_sol'];
		$fecha = $data['fecha_conformidad'];
		$obs = $data['observ_conformidad'];		
		
		$datos = array(
		        'fecha_conformidad' => $fecha,
		        'observ_conformidad' => $obs,
		        'estado' => 'T'		        
				);
		
		$this->db->trans_start();
			$this->db->where('id_solicitud', $id);
			$this->db->update('solicitud_reparacion', $datos);
		$this->db->trans_complete();

		if ($this->db->trans_status() === FALSE)
		{
			return false;  
		}
		else{
		    
			return true;
		}
	}	

	function getequipos()
	{
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];     // guarda usuario logueado

		$this->db->select('equipos.id_equipo,
					equipos.codigo,
					equipos.descripcion');
    	$this->db->from('equipos');
    	$this->db->where('equipos.estado !=', 'AN');
    	$this->db->where('equipos.id_empresa', $empId);
    	$this->db->order_by('equipos.id_equipo', 'ASC');
    	$query = $this->db->get();

	    if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return [];
		}
	}
	
}	
