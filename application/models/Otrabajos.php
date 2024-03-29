<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Otrabajos extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * Trae las ordenes de de trabajo de la empresa logueada.
	 *
	 * @return  Array   Arreglo con Ordenes de Trabajo.
	 */
	function otrabajos_List( $ot=NULL, $tipo ) // Ok
	{
	
		$userdata = $this->session->userdata('user_data');
		$empId    = $userdata[0]['id_empresa'];
	
		$this->db->select('orden_trabajo.*, tbl_tipoordentrabajo.descripcion AS tipoDescrip, 
												user1.usrName AS nombre, user1.usrLastName,
												sisusers.usrName, 
												sisusers.usrLastName, equipos.codigo, 
												0 as grpId,
												equipos.id_equipo,
												admcustomers.cliRazonSocial AS nomCli,
												orden_servicio.id_orden AS ordenservicioId');
		$this->db->from('orden_trabajo');
		$this->db->join('tbl_tipoordentrabajo', 'tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
		$this->db->join('sisusers', 'sisusers.usrId = orden_trabajo.id_usuario');
		$this->db->join('sisusers AS user1', 'orden_trabajo.id_usuario_a = user1.usrId', 'left');//usuario asignado?
		$this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
		$this->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');
	
		//LEFT JOIN orden_servicio ON orden_trabajo.id_orden = orden_servicio.id_ot

		$this->db->join('orden_servicio', 'orden_trabajo.id_orden = orden_servicio.id_ot', 'left');
	
		$this->db->where('equipos.estado !=','AN');

		if($tipo == 1){
			$this->db->where('orden_trabajo.tipo', 1);
			
		}

		$this->db->where('orden_trabajo.id_empresa', $empId);
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

	/**
	 * Trae los proveedores de la empresa logueada.
	 *
	 * @return  Array   Arreglo con Proveedores.
	 */
	function getproveedor() // Ok
	{
			$userdata = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];
			$this->db->select('abmproveedores.provnombre, abmproveedores.provid');
			$this->db->from('abmproveedores');
			$this->db->where('abmproveedores.estado', 'AC');
			$this->db->where('abmproveedores.id_empresa', $empId);
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
	/**
	 * Trae las ordenes de de trabajo de ua empresa logueada.
	 *
	 * @return  Array   Arreglo con Ordenes de Trabajo.
	 */
	function traer_sucursal() // Ok
	{
			$userdata = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];
			$query    = $this->db->get_where('sucursal', array('id_empresa' => $empId));
			if($query->num_rows()>0)
			{
					return $query->result();
			}
			else
			{
					return false;
			}       
	}
	/**
	 * Trae las ordenes de de trabajo de ua empresa logueada.
	 *
	 * @return  Array   Arreglo con Ordenes de Trabajo.
	 */
	function getequipo() // Ok
	{
			$userdata = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];
			$this->db->select('*');
			$this->db->from('equipos');
			$this->db->where('id_empresa', $empId);
			$this->db->where('estado !=', 'AN');
			//$this->db->where( array('estado'=>'AC', 'id_empresa'=>$empId) );
			//$this->db->or_where('estado', 'RE');
			$query = $this->db->get();
			if($query->num_rows()>0)
			{
					return $query->result();
			}
			else
			{
					return false;
			}   
	}

	
	// Trae equipos por empresa logueada - Listo
	function getEquiposNuevaOT(){
		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa']; 
			
		$this->db->select('equipos.id_equipo,equipos.codigo');
		$this->db->from('equipos');
		$this->db->where('equipos.estado!=', 'AN');
		$this->db->where('equipos.id_empresa', $empId);    	
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
	// Trae info de equipos por ID y por empresa logueada - Listo
	function getInfoEquiposNuevaOT($id){

		$userdata = $this->session->userdata('user_data');
    $empId = $userdata[0]['id_empresa']; 
			
		$this->db->select('equipos.*, marcasequipos.marcadescrip, admcustomers.cliRazonSocial AS nomCli');
		$this->db->join('marcasequipos', 'marcasequipos.marcaid = equipos.marca');
		$this->db->join('admcustomers', 'admcustomers.cliId = equipos.id_customer' );
		$this->db->from('equipos');    	
		$this->db->where('equipos.id_empresa', $empId);
		$this->db->where('equipos.id_equipo', $id);	 	
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


	function getDescTareaSTD($id_tar){
		
		$this->db->select('tareas.descripcion');
		$this->db->from('tareas');
		$this->db->where('tareas.id_tarea', $id_tar);
		$query = $this->db->get();
		$row = $query->row();	
		
		return $row->descripcion; 
	}



	/**
	 * Guarda Orden de Trabajo
	 *
	 * @param   Array   $data   Arreglo con los datos de la OT.
	 */
	function guardar_agregar($data) // Ok
	{
			$this->db->insert("orden_trabajo", $data);
			$id_insert = $this->db->insert_id(); 
			return $id_insert;
	}

	/**
	 * guarda responsable en modalejecutar ot al ser 
	 * seleccionado en tabla Orden_trabajo
	 * 
	 */
	function updateResponsables($id_orden, $id_responsable){
		$this->db->set('orden_trabajo.id_usuario_a', $id_responsable);
		$this->db->where('orden_trabajo.id_orden', $id_orden);
		$response = $this->db->update('orden_trabajo');
		return $response;
	}
	/**
	 * guarda responsable en modalejecutar ot al ser 
	 * seleccionado en tabla Orden_trabajo
	 * 
	 */
	function updateTarea($id_orden, $idTarea, $tarea){
		
	
		$this->db->where('orden_trabajo.id_orden', $id_orden);
		$response = $this->db->update('orden_trabajo', array('id_tarea'=>$idTarea,
		'descripcion'=>$tarea));
		return $response;
	}


	/**
	 * Guarda Case id en OT
	 *
	 * @param   
	 */
	// guarda case_id en Otrabajo
	function setCaseidenOTNueva($case_id, $id){
		$this->db->where('orden_trabajo.id_orden', $id);
		return $this->db->update('orden_trabajo', array('case_id'=>$case_id));			
	}




	
	//////////////		EDICION 	//////////////////
		/**
		 * Devuelve valores de la OT con id_orden = $id.
		 *
		 * @param   Int     Id de Orden de Trabajo.
		 */
		function getpencil($id) // Ok
		{
			$this->db->select('orden_trabajo.id_orden,
												orden_trabajo.id_tarea,												
												orden_trabajo.nro,
												orden_trabajo.fecha_program,
												orden_trabajo.fecha_inicio,
												orden_trabajo.fecha_terminada,
												orden_trabajo.descripcion AS tareadescrip,
												orden_trabajo.estado,
												orden_trabajo.id_usuario,
												orden_trabajo.id_usuario_a,
												orden_trabajo.id_usuario,
												orden_trabajo.id_sucursal,
												admcustomers.cliRazonSocial AS nomCli,
												sucursal.descripc,											
												abmproveedores.provnombre,
												abmproveedores.provid,
												equipos.id_equipo,
												equipos.fecha_ingreso,
												
												equipos.ubicacion,
												equipos.descripcion AS equipodescrip,
												equipos.codigo,
												marcasequipos.marcadescrip AS marca');
			$this->db->from('orden_trabajo');		
			$this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
			$this->db->join('sucursal', 'sucursal.id_sucursal = orden_trabajo.id_sucursal', 'left');
			$this->db->join('marcasequipos', 'equipos.marca = marcasequipos.marcaid');
			//$this->db->join('sisusers', 'sisusers.usrId=orden_trabajo.id_usuario');
			$this->db->join('abmproveedores', 'abmproveedores.provid=orden_trabajo.id_proveedor', 'left');
			$this->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');
			$this->db->where('orden_trabajo.id_orden', $id);
			$query = $this->db->get();
			
			if( $query->num_rows() > 0)
			{
				return $query->result_array();
			}
			else {
				return 0;
			}
		}
		// Trae herramientas ppor id de preventivo para Editar
		function getOTHerramientas($id){
					
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa']; 

			$this->db->select('tbl_otherramientas.cantidad,
													herramientas.herrcodigo,
													herramientas.herrmarca,
													herramientas.herrdescrip,
													herramientas.herrId');
			$this->db->from('tbl_otherramientas');
			$this->db->join('herramientas', 'herramientas.herrId = tbl_otherramientas.herrId');   
			$this->db->where('tbl_otherramientas.otId', $id);        
			$this->db->where('tbl_otherramientas.id_empresa', $empId);
			$query= $this->db->get();

			if( $query->num_rows() > 0)
			{
				return $query->result_array();
			}
			else {
				return 0;
			}
		}
		// Trae insumos por id de preventivo para Editar
		function getOTInsumos($id){

				$userdata = $this->session->userdata('user_data');
				$empId = $userdata[0]['id_empresa']; 

				$this->db->select('tbl_otinsumos.id,
														tbl_otinsumos.cantidad,
														articles.artBarCode,
														articles.artId,
														articles.artDescription,
														articles.id_empresa');                            
				$this->db->from('tbl_otinsumos');
				$this->db->join('articles', 'articles.artId = tbl_otinsumos.artId');   
				$this->db->where('tbl_otinsumos.otId', $id);        
				$this->db->where('articles.id_empresa', $empId);
				$query= $this->db->get(); 

				if( $query->num_rows() > 0)
				{
					return $query->result_array();
				}
				else {
					return 0;
				}
		}	
		// Trae adjuntos de OT por id
		function getOTadjuntos($id){
			$this->db->select('tbl_otadjuntos.*');
			$this->db->from('tbl_otadjuntos');
			$this->db->where('tbl_otadjuntos.otId', $id);
			$query = $this->db->get();

			if( $query->num_rows() > 0)
			{
				return $query->result_array();
			}
			else {
				return 0;
			}
		}
		/**
		 * Guarda le edicion de una OT (actualiza OT).
		 *
		 * @param   Int     $idequipo   Id de equipo.
		 * @param   Array   $data       Arreglo con los datos a editar del equipo $idequipo.
		 */
		function update_edita($id,$data) // Ok
		{
				$this->db->where('id_orden', $id);
				$query = $this->db->update("orden_trabajo",$data);
				return $query;
		}
		// guarda adjunto en Edicion y en OT nueva
		function setAdjunto($adjunto){	
			$query = $this->db->insert("tbl_otadjuntos", $adjunto);
			return $query;
		}
		// Elimina adjunto por id 
		function eliminarAdjunto($id){
			$this->db->where('id', $id);
			$query = $this->db->delete('tbl_otadjuntos');
			return $query;
		}

		// Delete herramientas 
		function deleteHerramOT($id){        
			$this->db->where('otId', $id);
			$query = $this->db->delete('tbl_otherramientas');
			return $query;
		}	
		// Guarda el bacht de datos de herramientas 
		function insertOTHerram($herram){
			$query = $this->db->insert_batch("tbl_otherramientas",$herram);
			return $query;
		}
		// Delete insumos
		function deleteInsumOT($id){
			$this->db->where('otId', $id);
			$query = $this->db->delete('tbl_otinsumos');
			return $query;
		}
		// Guarda el bacht de insumos 
		function insertOTInsum($insumo){
			$query = $this->db->insert_batch("tbl_otinsumos",$insumo);
			return $query;
		}

	//////////////		FIN EDICION 	//////////////////


	/**
	 * Devuelve el listado de tareas asociadas a una OT.
	 *
	 * @param   Int     $idglob     Id de Orden de Trabajo.
	 * @return  Array               Listado de Tareas.
	 */
	function cargartareas($idglob) // Ok
	{
			//$userdata = $this->session->userdata('user_data');
			//$empId    = $userdata[0]['id_empresa'];
			$this->db->select('*');
			$this->db->from('tbl_listarea');
			$this->db->join('sisusers', 'sisusers.usrId = tbl_listarea.id_usuario', 'left outer');
			$this->db->where('tbl_listarea.id_orden',$idglob);
			//$this->db->where('tbl_listarea.id_empresa',$empId);
			$this->db->group_by('tbl_listarea.id_listarea');
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
	/**
	 * Trae datos de orden de trabajo por id y empresa logueada para asignar.
	 *
	 * @param   Int     $id     Id de orden de trabajo.
	 *
	 * @return  Array|false     Arreglo con los datos de la orden de trabajo
	 */
	function getasigna($id) // Ok
	{
			$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa'];

			$this->db->select('orden_trabajo.id_orden, orden_trabajo.nro, orden_trabajo.id_usuario,
					orden_trabajo.fecha_inicio,
					orden_trabajo.fecha_entrega,
					orden_trabajo.descripcion,
					equipos.id_equipo,
					equipos.codigo,
					equipos.descripcion as equipoDescrip');
			$this->db->from('orden_trabajo');
			$this->db->join('equipos','equipos.id_equipo=orden_trabajo.id_equipo');
			$this->db->where('orden_trabajo.id_empresa', $empId);//no hace falta. Es redundante
			$this->db->where('orden_trabajo.id_orden', $id);
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
	/**
	 * Trae usuarios por id de empresa logueada
	 *
	 * @return  Array|false     Arreglo con usuarios de la empresa.
	 */
	function getusuario() // Ok
	{
			$userdata = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];
			$this->db->select('*');
			$this->db->from('sisusers');
			$this->db->join('usuarioasempresa', 'usuarioasempresa.usrId = sisusers.usrId');
			$this->db->where('usuarioasempresa.empresaid', $empId);
			$query = $this->db->get();
			if ($query->num_rows()!=0)
			{
					$i = 0;
					foreach ($query->result() as $row)
					{
							$data[$i]["usrId"]       = $row->usrId;
							$data[$i]["usrName"]     = $row->usrName;
							$data[$i]["usrLastName"] = $row->usrLastName;
							$i++;
					}
					return $data;
			}
	}
	/**
	 * trae detalle de nota de pedido (hg)
	 *
	 * @return  Array|false     Arreglo con detallle de la nota de pedido por id de OT
	 */
	function getdatos($id_OT){ //id_trabajo
		
		$this->db->select('tbl_detanotapedido.id_detaNota,
											tbl_detanotapedido.id_notaPedido,
											tbl_detanotapedido.artId,
											tbl_detanotapedido.cantidad,
											tbl_detanotapedido.provid,
											tbl_detanotapedido.fechaEntrega,
											tbl_detanotapedido.fechaEntregado,
											tbl_detanotapedido.remito,
											tbl_detanotapedido.estado,
											articles.artDescription,
											articles.artBarCode,
											abmproveedores.provnombre,
											tbl_notapedido.id_ordTrabajo,
											tbl_notapedido.fecha');
		$this->db->from('tbl_detanotapedido');
		$this->db->join('tbl_notapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
		$this->db->join('articles', 'articles.artId = tbl_detanotapedido.artId');
		$this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
		$this->db->where('tbl_notapedido.id_ordTrabajo', $id_OT);
		$query = $this->db->get();
		if($query->num_rows()>0){
			return $query->result();
		}else{
			return false;
		}		
	}













    function traer_cli()
    {
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->select('admcustomers.*');
        $this->db->from('admcustomers');
        $this->db->where('admcustomers.id_empresa', $empId);
        $this->db->where('admcustomers.estado', 'C');
        $query = $this->db->get();   
        if( $query->num_rows() > 0)
        {
          return $query->result_array();    
        } 
        else {
          return false;
        }
    }

	function getprint($id){ //JOIN grupo ON grupo.id_grupo=equipos.id_grupo
	    $sql="SELECT orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.nro, orden_trabajo.fecha, orden_trabajo.fecha_program, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, orden_trabajo.fecha_aviso, orden_trabajo.fecha_entregada, orden_trabajo.descripcion, orden_trabajo.estado, orden_trabajo.id_usuario, orden_trabajo.id_usuario_a, orden_trabajo.id_solicitud, orden_trabajo.tipo, orden_trabajo.id_equipo, orden_trabajo.duracion, orden_trabajo.id_tareapadre, tareas.descripcion AS detarea, orden_trabajo.id_equipo, equipos.codigo, equipos.descripcion AS deequipos, user1.usrName AS nombre,user1.usrLastName, sisgroups.grpId AS grp, sisusers.usrName, sisusers.usrLastName, sisgroups.grpId, tbl_tipoordentrabajo.id
	    	FROM orden_trabajo
	    	JOIN tareas ON tareas.id_tarea=orden_trabajo.id_tarea
	    	JOIN tbl_tipoordentrabajo ON tbl_tipoordentrabajo.id=orden_trabajo.tipo
	    	JOIN equipos ON equipos.id_equipo=orden_trabajo.id_equipo
	    	JOIN sisusers ON sisusers.usrId = orden_trabajo.id_usuario
			join sisusers AS user1 ON user1.usrId = orden_trabajo.id_usuario_a
			JOIN usuarioasempresa ON usuarioasempresa.usrId = user1.usrId
			join sisgroups ON sisgroups.grpId = usuarioasempresa.grpId
	    	  WHERE equipos.estado !='AN' AND orden_trabajo.id_orden=$id AND usuarioasempresa.tipo = 1";

	    $query= $this->db->query($sql);

	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();
	    }
	    else {
	      return 0;
	    }
	}
	
	function getotrabajos($data = null){

		if($data == null)
		{
			return false;
		}
		else
		{
			$action = $data['act'];
			$otid = $data['id'];
			$data = array();
			$query= $this->db->get_where('orden_trabajo',array('id_orden'=>$otid));

			if ($query->num_rows() != 0)
			{
				
				$f = $query->result_array();
				$data['ot'] = $f[0];
			} else {
				$ot = array();
				$ot['nro'] = '';
				$ot['fecha_inicio'] = '';
				$ot['fecha_fecha_entrega'] = '';
				$ot['descripcion'] = '';
				$ot['cliId'] = '';
				$ot['estado'] = '';
				$ot['id_usuario'] = '';
				$ot['id_sucursal'] = '';
				$data['ot'] = $ot;
			}

			//Readonly
			$readonly = false;
			if($action == 'Del' || $action == 'View'){
				$readonly = true;
			}
			$data['read'] = $readonly;
				$query= $this->db->get('sucursal');
			if ($query->num_rows() != 0)
			{
				$data['sucursal'] = $query->result_array();	
			}

				$query= $this->db->get('admcustomers');
			if ($query->num_rows() != 0)
			{
				$data['clientes'] = $query->result_array();	
			}
			

			return $data;
		}
	}
	
	function setotrabajos($data = null){

		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
			$nro = $data['nro'];
			$fech = $data['fech'];
			$deta = $data['deta'];
			$sucid = $data['sucid'];
			$act = $data['act'];
			$cli=$data['cli'];
			$usu=1;
			$estado='C';

			$data = array(
					   'nro' => $nro,
					    'fecha_inicio' => $fech,
					    'descripcion' => $deta,
					    'id_sucursal' => $sucid,
					     'cliId' => $cli,
					     'id_usuario' => $usu,
					     'id_usuario_a' => $usu,
					      'id_usuario_e' => $usu,
					      'estado' => $estado
					   
					);

			switch($act)
			{
				case 'Add':
					//Agregar familia
					if($this->db->insert('orden_trabajo', $data) == false) {
						return false;
					}
					break;

				case 'Edit':
					//Actualizar nombre
					if($this->db->update('orden_trabajo', $data, array('id_orden'=>$id)) == false) {
						return false;
					}
					break;

				case 'Del':
					//Eliminar familia
					if($this->db->delete('orden_trabajo', $data, array('id_orden'=>$id)) == false) {
						return false;
					}
					
					break;
			}

			return true;

		}
	}

	//pediso a entregar x fecha
	function getpedidos($id){

	    $sql="SELECT * 
	    	  FROM orden_trabajo
	    	  JOIN admcustomers ON admcustomers.cliId= orden_trabajo.cliId
	    	  WHERE id_orden=$id
	    	  ";
	    
	    $query= $this->db->query($sql);  
	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();	
	    } 
	    else {
	      return 0;
	    }
	}

	function getcliente($data = null){

		if($data == null)
		{
			return false;
		}
		else{
			
			$idcli = $data['idcliente'];
			//Datos del usuario
			$query= $this->db->get_where('admcustomers',array('cliId'=>$idcli));
			if($query->num_rows()>0){
                return $query->result();
            }
            else{
                return false;
            }
			
		}
	}

	/*	  function getusuario(){
        $query = $this->db->query("SELECT * FROM sisusers");
        $i=0;
        foreach ($query->result() as $row)
        {	
        	$insumos[$i]['label'] = $row->usrName;
            $insumos[$i]['value'] = $row->usrId;
            $i++;
        }
        return $insumos;
    }*/

	function getnums($id){

		$query= "SELECT id_orden
	        FROM orden_pedido
	        WHERE nro_trabajo=$id";

		$query= $this->db->query($sql);

		if($query!=""){

			foreach ($query->result_array() as $row){		
			$data = $row['id_orden'];
			}
		return $data;
		}
		else
			{
			return 0;
			}
	}


	function agregar_usuario($data){
                   
        $query = $this->db->insert("sisusers",$data);
    	return $query;
    }


    function agregar_pedidos($data){          
        $query = $this->db->insert("orden_pedido",$data);
    	return $query;
    }
        

    function update_guardar($id, $datos){
        $this->db->where('id_orden', $id);
        $query = $this->db->update("orden_trabajo",$datos);
        return $query;
    }

    
    function update_ordtrab($id, $datos){
        $this->db->where('id_orden', $id);
        $query = $this->db->update("orden_trabajo",$datos);
        return $query;
    }
		
	// seleccionar el grupo
	function getgrupo(){
       $query= $this->db->get_where('sisgroups');
		if($query->num_rows()>0){
			 return $query->result();
        }
        else{
            return false;
        }
	}

	//insertar pedido 
	function insert_pedido($data)
    {
        $query = $this->db->insert("orden_pedido",$data);
        return $query;
    }

    function agregar_tareas($data) {
        $query = $this->db->insert("tbl_listarea",$data);
        return $query;
    }

	function get_pedido($id){
		$query= "SELECT *
				 FROM orden_pedido 
				 WHERE id_orden=$id";

        $result = $this->db->query($query);
		if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }
	}
	
    //agrega proveedor
	function agregar_proveedor($data){
        $query = $this->db->insert("proveedores", $data);
    	return $query;
    }

	
	  
	function eliminacion($data){
       	$this->db->where('id_orden', $data);
		$query =$this->db->delete('orden_trabajo');
        return $query;
    }

    function update_cambio($ido,$fecha){
    	$consulta= "UPDATE orden_trabajo SET estado='T',
    										fecha_terminada='$fecha'
                               
				WHERE id_orden=$ido" ;

		$query= $this->db->query($consulta);
        
		return $query;
    }

	function getArticulos(){
		$sql= "SELECT *
			FROM sisusers
			
			"; //
			$query= $this->db->query($sql);

        //$query = $this->db->query("SELECT `artId`, `artBarCode` FROM `articles`");
        $i=0;
        foreach ($query->result() as $row)
        {	
        	$insumos[$i]['label'] = $row->usrName;
            $insumos[$i]['value'] = $row->usrId;
            
            
            $i++;
        }
        return $insumos;
    }

    function EliminarTareas($idor,$data){
        $this->db->where('id_listarea', $idor);
        $query = $this->db->update("tbl_listarea",$data);
        return $query;
    }

    function ModificarUsuarios($idta,$datos){
        $this->db->where('id_listarea', $idta);
        $query = $this->db->update("tbl_listarea",$datos);
        return $query;
    }

    function TareaRealizadas($id, $datos){
        $this->db->where('id_listarea', $id);
        $query = $this->db->update("tbl_listarea",$datos);
        return $query;
    }

    function ModificarFechas($idta,$datos){
        $this->db->where('id_listarea', $idta);
        $query = $this->db->update("tbl_listarea",$datos);
        return $query;
    }
    
    function CambioParcials($idor,$datos){
        $this->db->where('id_orden', $idor);
        $query = $this->db->update("orden_trabajo",$datos);
        return $query;
    }

    function agregar_pedidos_fecha($fecha,$id){
        $this->db->where('id_orden', $id);
        $query = $this->db->update("orden_pedido",$fecha);
        return $query;
    }

    function update_predictivo($data, $id){
	    $this->db->where('id_orden', $id);
	    $query = $this->db->update("orden_trabajo",$data);
	    return $query;
	}
	
    /**
     * Cuenta la cantidad de ordenes de trabajo agrupadas por tipo.
     *
     * @return Void|Array     Cantidad de ordenes de trabajo.
     */
    function kpiCantTipoOrdenTrabajo()
    {
		$empresaId = empresa();

        $sql = "SELECT tt.descripcion as descripcion, count(*) as cantidad 
		        FROM orden_trabajo ot
                JOIN tbl_tipoordentrabajo tt  on ot.tipo = tt.tipo_orden
                WHERE ot.id_empresa =".$empresaId."
                AND (ot.estado  = 'CE' or estado = 'CN')
                GROUP BY ot.tipo
                ORDER BY ot.tipo";

                $query = $this->db->query($sql);
                $res = $query->result();

		//log_message('DEBUG','#Main/index | kpiCantTipoOrdenTrabajo >> data '.json_encode($query));

        if($query->num_rows()!=0)
        {
            return $res;
        }
        else
        {
            return false;
        }
    }

    function getEquipoDisponibilidad() // Ok
    {
    	$userdata = $this->session->userdata('user_data');
    	$empId    = $userdata[0]['id_empresa'];

    	$this->db->select('equipos.id_equipo AS value, equipos.codigo AS label');
    	$this->db->from('equipos');
    	$this->db->where('id_empresa', $empId);
    	$this->db->where('estado !=', 'AN');
    	$query = $this->db->get();

    	if($query->num_rows()>0)
    	{
    		return $query->result();
    	}
    	else
    	{
    		return false;
    	}
    }


    //devuelve valores de todos los datos de la OT para mostrar en modal.
    function getOrigenOt($idot)
    {
    	$this->db->select('orden_trabajo.tipo, orden_trabajo.id_solicitud');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_orden', $idot);

        $query = $this->db->get();
        if($query->num_rows()!=0)
        {
            return $query->result();
        }
        else
        {
            return false;
        }
    }



    //devuelve valores de todos los datos de la OT para mostrar en modal.
    function getViewDataOt($idOt)
    {
    	$this->db->select('orden_trabajo.id_orden, orden_trabajo.nro, orden_trabajo.descripcion AS descripcionFalla, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, 
    		orden_trabajo.fecha_program, tbl_estado.descripcion AS estado, sisusers.usrName, sisusers.usrLastName, 
    		orden_trabajo.tipo, orden_trabajo.id_solicitud,
    		sucursal.id_sucursal, sucursal.descripc,
    		abmproveedores.provid, abmproveedores.provnombre,
    		equipos.codigo, equipos.fecha_ingreso, equipos.marca, equipos.ubicacion, equipos.descripcion AS descripcionEquipo');
        $this->db->from('orden_trabajo');
        $this->db->join('sisusers', 'sisusers.usrId = orden_trabajo.id_usuario_a');
        $this->db->join('sucursal', 'sucursal.id_sucursal = orden_trabajo.id_sucursal','left');
        $this->db->join('abmproveedores', 'abmproveedores.provid = orden_trabajo.id_proveedor','left');
        $this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
        $this->db->join('tbl_estado', 'tbl_estado.estado = orden_trabajo.estado');
        $this->db->where('orden_trabajo.id_orden', $idOt);

        $query = $this->db->get();
        if($query->num_rows()!=0)
        {
            $datos = $query->result_array();
        }
        else
        {
            return false;
        }
    }

    //devuelve valores de todos los datos de la OT para mostrar en modal.
    function getViewDataSolServicio($idOt, $idSolicitud=null)
    {
			$this->db->select('orden_trabajo.id_orden, 
				orden_trabajo.nro, orden_trabajo.descripcion AS descripcionFalla, 
				orden_trabajo.fecha_inicio,orden_trabajo.fecha_program, orden_trabajo.fecha_terminada, orden_trabajo.estado, 
				sisusers.usrName, sisusers.usrLastName, 
				orden_trabajo.tipo, orden_trabajo.id_solicitud,				
				sucursal.id_sucursal, sucursal.descripc,
				admcustomers.cliRazonSocial AS nomCli,
    			abmproveedores.provid, abmproveedores.provnombre,
				equipos.codigo, equipos.fecha_ingreso, equipos.ubicacion, equipos.descripcion AS descripcionEquipo,
				marcasequipos.marcadescrip AS marca,
				grupo.descripcion AS grupodescrip, grupo.id_grupo');
        $this->db->from('orden_trabajo');
        $this->db->join('sisusers', 'orden_trabajo.id_usuario_a = sisusers.usrId', 'left');
        $this->db->join('sucursal', ' orden_trabajo.id_sucursal = sucursal.id_sucursal ', 'left');
        $this->db->join('abmproveedores', 'orden_trabajo.id_proveedor = abmproveedores.provid', 'left');
		$this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
		$this->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');
		$this->db->join('marcasequipos', 'marcasequipos.marcaid = equipos.marca');
		$this->db->join('grupo', 'grupo.id_grupo = equipos.id_grupo');
		$this->db->where('orden_trabajo.id_orden', $idOt);

				$query = $this->db->get();

        if($query->num_rows()!=0)
        {
            $datos = $query->result_array();
            //dump_exit($datos);
            $datos[0]['solServicio'] = $this->getViewDataInfoSolServicio( $datos[0]['id_solicitud']);
            return $datos;
        }
        else
        {
            return false;
        }
    }

    	//
    	function getViewDataInfoSolServicio($id_solicitud)
	    {
	    
				$this->db->select('sector.descripcion AS sector, 			
													solicitud_reparacion.solicitante, 
													solicitud_reparacion.f_sugerido AS fechaSugerida, 
													solicitud_reparacion.hora_sug AS horarioSugerido, 										
													solicitud_reparacion.causa AS falla');
				$this->db->from('solicitud_reparacion');
				$this->db->join('equipos', 'solicitud_reparacion.id_equipo = equipos.id_equipo');
				$this->db->join('sector', 'equipos.id_sector = sector.id_sector');
				$this->db->where('solicitud_reparacion.id_solicitud', $id_solicitud);

				$query = $this->db->get();
				if($query->num_rows()!=0)
				{
						$solServicio = $query->result_array();
						return $solServicio[0];
				}
				else
				{
						return null;
				}
	    }



    //devuelve valores de todos los datos de la OT para mostrar en modal.
    function getViewDataPreventivo($idOt, $idSolicitud=null)
    {
			$this->db->select('orden_trabajo.id_orden, 
												orden_trabajo.nro, 
												orden_trabajo.descripcion AS descripcionFalla, 
												orden_trabajo.fecha_inicio, 
												orden_trabajo.fecha_terminada, 
												orden_trabajo.fecha_program, 
												orden_trabajo.estado, 
												sisusers.usrName, sisusers.usrLastName, 
												orden_trabajo.tipo, 
												orden_trabajo.id_solicitud,
												admcustomers.cliRazonSocial AS nomCli,
												sucursal.id_sucursal, 
												sucursal.descripc,
												equipos.codigo, 
												equipos.fecha_ingreso, 												 
												equipos.ubicacion, 
												equipos.descripcion AS descripcionEquipo,
												marcasequipos.marcadescrip AS marca');
        $this->db->from('orden_trabajo');
        $this->db->join('sisusers', 'orden_trabajo.id_usuario_a  = sisusers.usrId', 'left');
        $this->db->join('sucursal', 'orden_trabajo.id_sucursal = sucursal.id_sucursal', 'left');
        $this->db->join('abmproveedores', 'orden_trabajo.id_proveedor = abmproveedores.provid', 'left');
        $this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
		$this->db->join('marcasequipos', 'marcasequipos.marcaid = equipos.marca');
		$this->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');
        $this->db->where('orden_trabajo.id_orden', $idOt);
				$query = $this->db->get();
        if($query->num_rows()!=0)
        {
            $datos = $query->result_array();
            //dump_exit($datos);
            $datos[0]['tarea'] = $this->getViewDataTareaPreventivo( $datos[0]['id_solicitud']);
            return $datos;
        }
        else
        {
            return false;
        }
    }
    
	    function getViewDataTareaPreventivo($id_solicitud)
	    {
	    	$this->db->select('preventivo.prevId, preventivo.ultimo, preventivo.cantidad AS frecuencia, preventivo.lectura_base, preventivo.critico1 AS alerta, preventivo.prev_duracion, preventivo.prev_canth, preventivo.prev_adjunto,
	    		tareas.descripcion AS tareadescrip,
	    		unidad_tiempo.unidaddescrip AS perido,
	    		componentes.descripcion AS descripComponente');
	        $this->db->from('preventivo');
	        $this->db->where('preventivo.prevId', $id_solicitud);
	        $this->db->join('tareas', 'tareas.id_tarea = preventivo.id_tarea');
	        $this->db->join('unidad_tiempo', 'unidad_tiempo.id_unidad = preventivo.id_unidad');
	        $this->db->join('componentes', 'componentes.id_componente = preventivo.id_componente');
	        $query = $this->db->get();
	        if($query->num_rows()!=0)
	        {
	            $preventivos = $query->result_array();
	            for ($i=0; $i < sizeof($preventivos) ; $i++) { 
		            $herramientas = null;
		            $insumos      = null;

		            $herramientas[$i] = $this->getPreventivoHerramientas( $preventivos[$i]['prevId'] );
		            $insumos[$i]      = $this->getPreventivoInsumos( $preventivos[$i]['prevId'] );
	            }
	            $preventivos[0]['herramientas'] = $herramientas;
	            $preventivos[0]['insumos']  = $insumos;

	            return $preventivos[0];
	        }
	        else
	        {
	            return null;
	        }
	    }

		    // Trae herramientas ppor id de preventivo para Editar
		    function getPreventivoHerramientas($id)
		    {
		        $this->db->select('tbl_preventivoherramientas.cantidad,
		                            herramientas.herrcodigo,
		                            herramientas.herrmarca,
		                            herramientas.herrdescrip,
		                            herramientas.herrId');
		        $this->db->from('tbl_preventivoherramientas');
		        $this->db->join('herramientas', 'herramientas.herrId = tbl_preventivoherramientas.herrId');   
		        $this->db->where('tbl_preventivoherramientas.prevId', $id);   
		             
		        $query = $this->db->get();
		        if( $query->num_rows() > 0)
		        {
		        	$herramientas = $query->result_array();
		          	return $herramientas;
		        }
		        else {
		          return 0;
		        }
		    }

		    // Trae insumos por id de preventivo para Editar
		    function getPreventivoInsumos($id)
		    {    
		        $this->db->select('tbl_preventivoinsumos.id,
		                            tbl_preventivoinsumos.cantidad,
		                            articles.artBarCode,
		                            articles.artId,
		                            articles.artDescription,
		                            articles.id_empresa');                            
		        $this->db->from('tbl_preventivoinsumos');
		        $this->db->join('articles', 'articles.artId = tbl_preventivoinsumos.artId');   
		        $this->db->where('tbl_preventivoinsumos.prevId', $id);        
		        $query= $this->db->get(); 

		        if( $query->num_rows() > 0)
		        {
		          	$insumos = $query->result_array();
		          	return $insumos;
		        }
		        else {
		          return 0;
		        }
		    }



	//devuelve valores de todos los datos de la OT para mostrar en modal.
    function getViewDataBacklog($idOt, $idSolicitud)
    {
			$this->db->select('orden_trabajo.id_orden, orden_trabajo.nro,
												orden_trabajo.estado,
												orden_trabajo.descripcion AS descripcionFalla, 
												orden_trabajo.fecha_inicio, 
												orden_trabajo.fecha_program,
												orden_trabajo.fecha_terminada, 
												sisusers.usrName, sisusers.usrLastName, 
												orden_trabajo.tipo, orden_trabajo.id_solicitud,
												sucursal.id_sucursal, sucursal.descripc,
												abmproveedores.provid, abmproveedores.provnombre,
												equipos.codigo, equipos.fecha_ingreso, marcasequipos.marcadescrip AS marca,
												equipos.ubicacion, equipos.descripcion AS descripcionEquipo');
        $this->db->from('orden_trabajo');
        $this->db->join('sisusers', 'orden_trabajo.id_usuario_a = sisusers.usrId', 'left');
        $this->db->join('sucursal', 'orden_trabajo.id_sucursal =  sucursal.id_sucursal', 'left');
        $this->db->join('abmproveedores', 'orden_trabajo.id_proveedor = abmproveedores.provid', 'left');
        $this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
      	$this->db->join('marcasequipos', 'marcasequipos.marcaid = equipos.marca');
        $this->db->where('orden_trabajo.id_orden', $idOt);

        $query = $this->db->get();
				
				if($query->num_rows()!=0)
        {
            $datos = $query->result_array();
            $datos[0]['tarea'] = $this->getViewDataTareaBacklog( $datos[0]['id_solicitud']);
            //dump_exit($datos);
            return $datos;
        }
        else
        {
            return false;
        }
    }

		function getViewDataTareaBacklog($idBacklog){
			$this->db->select('tbl_back.fecha,
												tbl_back.id_tarea,	 
												tbl_back.back_duracion, 
												tbl_back.tarea_opcional,
												tbl_back.idcomponenteequipo,
												tareas.descripcion AS tareadescrip');
			$this->db->from('tbl_back');
			$this->db->join('tareas', 'tbl_back.id_tarea = tareas.id_tarea', 'left');
			$this->db->where('tbl_back.backId', $idBacklog);
			$query = $this->db->get();
			//$dato = $this->db->last_query();
			//dump($dato, 'backlog info: ');
				if($query->num_rows()!=0)
				{
						$tarea = $query->result_array();
						$tarea[0]['compEquipo'] = $this->getViewDataComponenteEquipoBacklog( $tarea[0]['idcomponenteequipo']);
						return $tarea[0];
				}
				else
				{
						return null;
				}
	  }

	  function getLecturasOrden($id_ot) //
	  {		
			  $this->db->select('orden_trabajo.fecha_inicio,
								 orden_trabajo.fecha_terminada');
			  $this->db->from('orden_trabajo');
			  $this->db->where('orden_trabajo.id_orden', $id_ot);
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

		function getViewDataComponenteEquipoBacklog($idComponenteEquipo)
		{
			$this->db->select('componenteequipo.codigo AS codigoComponente, 
				componentes.descripcion AS descripComponente,
				sistema.descripcion AS descripSistema');
				$this->db->from('componenteequipo');
				$this->db->join('componentes', 'componentes.id_componente = componenteequipo.id_componente');
				$this->db->join('sistema', 'sistema.sistemaid = componenteequipo.sistemaid');
				$this->db->where('componenteequipo.idcomponenteequipo', $idComponenteEquipo);

				$query = $this->db->get();
				if($query->num_rows()!=0)
				{
						$compEquipo = $query->result_array();
						return $compEquipo[0];
				}
				else
				{
						return null;
				}
		}

		function getViewDataPredictivo($idOt, $idSolicitud)
		{
			$this->db->select('orden_trabajo.id_orden, orden_trabajo.descripcion AS descripcionFalla, 
												orden_trabajo.fecha_inicio, orden_trabajo.fecha_terminada, 
												orden_trabajo.fecha_program, 
												orden_trabajo.tipo, orden_trabajo.id_solicitud, 
												orden_trabajo.estado,
												sisusers.usrName, 
												sisusers.usrLastName, 
												equipos.codigo, equipos.fecha_ingreso, equipos.ubicacion, 
												equipos.descripcion AS descripcionEquipo,	
												marcasequipos.marcadescrip AS marca,		
												sucursal.id_sucursal, sucursal.descripc, 
												abmproveedores.provid, abmproveedores.provnombre ');													
			$this->db->from('orden_trabajo');			
			$this->db->join('sucursal', 'orden_trabajo.id_sucursal = sucursal.id_sucursal','left');
			$this->db->join('sisusers', 'orden_trabajo.id_usuario_a = sisusers.usrId', 'left');
			$this->db->join('abmproveedores', 'orden_trabajo.id_proveedor = abmproveedores.provid', 'left');				
			$this->db->join('equipos', 'equipos.id_equipo = orden_trabajo.id_equipo');
			$this->db->join('marcasequipos', 'marcasequipos.marcaid = equipos.marca');				
			$this->db->where('orden_trabajo.id_orden', $idOt);
			$query = $this->db->get();	
		
			if($query->num_rows()!=0)
			{
					$datos = $query->result_array();
					//dump_exit($datos);
					$datos[0]['tarea'] = $this->getViewDataTareaPredictivo( $datos[0]['id_solicitud']);
					return $datos;
			}
			else
			{
					return false;
			}
		}	
    //
    function getViewDataTareaPredictivo($id_solicitud)
    {
      $this->db->select('tareas.descripcion AS tareadescrip,
        predictivo.fecha, predictivo.periodo, 
        predictivo.cantidad AS frecuencia, predictivo.pred_duracion AS duracion,
        unidad_tiempo.unidaddescrip,
        predictivo.pred_canth AS cantOperarios, predictivo.horash');
        $this->db->from('predictivo');
        $this->db->where('predictivo.predId', $id_solicitud);
        $this->db->join('tareas', 'tareas.id_tarea = predictivo.tarea_descrip');
        $this->db->join('unidad_tiempo', 'unidad_tiempo.id_unidad = predictivo.id_unidad');
        $query = $this->db->get();
        if($query->num_rows()!=0)
        {
            $predictivos = $query->result_array();
            return $predictivos[0];
        }
        else
        {
            return null;
        }
		}
		   
		//Define si la OT tiene un proceso lanzado
		function getCaseIdOT($id){	
			$this->db->select('orden_trabajo.case_id');
			$this->db->from('orden_trabajo');			
			$this->db->where('orden_trabajo.id_orden',$id);
			$query = $this->db->get();
      $row = $query->row('case_id');
      return $row;  
		}

		// develve tipo de solicitud e id q dieron origen a OT
		function getDatosOrigenOT($id){
			$this->db->select('orden_trabajo.id_solicitud, orden_trabajo.tipo');
			$this->db->from('orden_trabajo');
			$this->db->where('id_orden',$id);
			$query = $this->db->get();
			return $query->result_array();
		}
		// trae id de SServicio desde backlog
		function getIdSolReparacion($id_solicitud){
			
			//$id_solicitud = 7;
			$this->db->select('tbl_back.sore_id');
			$this->db->from('tbl_back');
			$this->db->where('backId',$id_solicitud);
			return $this->db->get()->first_row()->sore_id;
			
			// $query = $this->db->get();
			// $row = $query->row('sore_id');
			// return $row;;			
		}
		// trae case_id desde SServicios
		function getCaseIdenSServicios($id_solicitud){
			$this->db->select('orden_trabajo.case_id');
			$this->db->from('orden_trabajo');
			$this->db->where('id_orden',$id_solicitud);
			$query = $this->db->get();
			$row = $query->row('case_id');
			return $row;	
			// $this->db->select('solicitud_reparacion.case_id');
			// $this->db->from('solicitud_reparacion');
			// $this->db->where('id_solicitud',$id_solicitud);
			// $query = $this->db->get();
			// $row = $query->row('case_id');
			// return $row;		
		}
		//Valida si hay o no un proceso lanzado en BPM
		function validarProcesoEnOT($id){
			$this->db->select('orden_trabajo.case_id');
			$this->db->from('orden_trabajo');
			$this->db->where('id_orden',$id);
			$result = $query->row();			
			return $result->case_id;
		}
		// guarda case_id en Otrabajo
		function setCaseidenOT($case_id, $id){
			$this->db->where('orden_trabajo.id_orden', $id);
			return $this->db->update('orden_trabajo', array('case_id'=>$case_id));			
		}

		// devuelve id de SServicio por Case_id
		function getIdSServicioporCaseId($caseDeBacklog){
			$this->db->select('solicitud_reparacion.id_solicitud');
			$this->db->from('solicitud_reparacion');
			$this->db->where('solicitud_reparacion.case_id', $caseDeBacklog);			
			$query = $this->db->get();
			$row = $query->row('id_solicitud');
      return $row;
		}

		// cambbia de estado la Tareas(SServ, Prevent, Predic, Back y OT)
		function cambiarEstado($id_solicitud, $estado, $tipo){		
			$f_asignacion =  date("Y-m-d H:i:s"); 				
			
			if ($tipo == 'correctivo') {
				$this->db->set('estado', $estado);
				$this->db->where('id_solicitud', $id_solicitud);
				$response = $this->db->update('solicitud_reparacion');
			}

			if ($tipo == 'preventivo') {
				$this->db->set('estadoprev', $estado);
				$this->db->where('prevId', $id_solicitud);
				$response = $this->db->update('preventivo');
			}

			if ($tipo == 'backlog') {
				$this->db->set('estado', $estado);
				$this->db->where('backId', $id_solicitud);
				$response = $this->db->update('tbl_back');
			}			

			if ($tipo == 'predictivo') {
				$this->db->set('estado', $estado);
				$this->db->where('predId', $id_solicitud);
				$response = $this->db->update('predictivo');
			}	
			
			if ($tipo == 'OT') {
				$this->db->set('estado',$estado);
				$this->db->set('f_asignacion', $f_asignacion);
				$this->db->where('id_orden',$id_solicitud);
        		return $this->db->update('orden_trabajo');
			}

			return $response;
		}

		// Actualiza tareas en OT
		function updOT($ot, $datos){
			$this->db->where('orden_trabajo.id_orden', $ot);
			return $this->db->update('orden_trabajo', $datos);	
		} 

		function obtenerOT($ot){
			$this->db->where('orden_trabajo.id_orden', $ot);
			return $this->db->get('orden_trabajo')->first_row();	
		} 
		// Obtener OT dado un CaseID
		function ObtenerOTporCaseId($case_id)
		{
			$this->db->where('orden_trabajo.case_id', $case_id);
			$query = $this->db->get('orden_trabajo');
			return $query->row('id_orden');
		}

		function guardarPosicion($ot, $lat, $lon){
			$this->db->where('id_orden', $ot);
			$this->db->set('latitud', $lat);
			$this->db->set('longitud', $lon);
			return $this->db->update('orden_trabajo');
		}

		public function eliminar($id)
		{
			$this->db->where('id_orden', $id);
			return $this->db->delete('orden_trabajo');
		}

	public function filtrarListado($data, $tipo){
		$userdata = $this->session->userdata('user_data');
		$empId    = $userdata[0]['id_empresa'];
		//
		$this->db->select('orden_trabajo.*, tareas.descripcion as tareaSTD,
												tbl_tipoordentrabajo.descripcion AS tipoDescrip,
												user1.usrName AS nombre, user1.usrLastName,
												sisusers.usrName, 
												sisusers.usrLastName, equipos.codigo, 
												0 as grpId,
												equipos.id_equipo,
												admcustomers.cliRazonSocial AS nomCli,
												orden_servicio.id_orden AS ordenservicioId');
		$this->db->from('orden_trabajo');
		$this->db->join('tbl_tipoordentrabajo', 'tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
		$this->db->join('sisusers', 'sisusers.usrId = orden_trabajo.id_usuario');
		$this->db->join('sisusers AS user1', 'orden_trabajo.id_usuario_a = user1.usrId', 'left');//usuario asignado?
		$this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
		$this->db->join('admcustomers','admcustomers.cliId = equipos.id_customer');

		$this->db->join('tareas', 'tareas.id_tarea = orden_trabajo.id_tarea', 'left');

		//LEFT JOIN orden_servicio ON orden_trabajo.id_orden = orden_servicio.id_ot

		$this->db->join('orden_servicio', 'orden_trabajo.id_orden = orden_servicio.id_ot', 'left');
	
		$this->db->where('equipos.estado !=','AN');

		if($tipo == 1){
			$this->db->where('orden_trabajo.tipo', 1);
			
		}
		//FILTRADO
		//Entre Fechas
		if(!empty($data['fec_hasta']) && !empty($data['fec_desde'])){
			$this->db->where('DATE(orden_trabajo.fecha_program) >=', $data['fec_desde']);
			$this->db->where('DATE(orden_trabajo.fecha_program) <=', $data['fec_hasta']);
		}elseif (!empty($data['fec_desde'])) {
			$this->db->where('DATE(orden_trabajo.fecha_program)',$data['fec_desde']);
		}
		//Estado
        if(!empty($data['estadoFilt'])){
            $this->db->where('orden_trabajo.estado',$data['estadoFilt']);
        }
		//Equipo
        if(!empty($data['equipoFilt'])){
            $this->db->where('equipos.id_equipo',$data['equipoFilt']);
        }
		$this->db->where('orden_trabajo.id_empresa', $empId);
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
}	