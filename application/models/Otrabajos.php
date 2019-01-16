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
	function otrabajos_List() // Ok
	{
		$userdata = $this->session->userdata('user_data');
		$empId    = $userdata[0]['id_empresa'];
		$this->db->select('orden_trabajo.id_orden,
			orden_trabajo.nro,
			orden_trabajo.fecha_inicio,
			orden_trabajo.fecha_entrega,
			orden_trabajo.fecha_terminada,
			orden_trabajo.fecha_aviso,
			orden_trabajo.fecha_entregada,
			orden_trabajo.descripcion,
			orden_trabajo.id_solicitud,
			orden_trabajo.cliId,
			orden_trabajo.estado,
			orden_trabajo.id_usuario,
			orden_trabajo.id_usuario_a,
			tbl_tipoordentrabajo.descripcion AS tipoDescrip,
			user1.usrName AS nombre,
			user1.usrLastName,
			usuarioasempresa.grpId AS grp,
			orden_trabajo.id_usuario_e,
			orden_trabajo.id_sucursal,
			sisusers.usrName,
			sisusers.usrLastName,
			sucursal.descripc,
    		equipos.codigo,
    		equipos.id_equipo,
            usuarioasempresa.grpId');
		$this->db->from('orden_trabajo');
		$this->db->join('tbl_tipoordentrabajo', 'tbl_tipoordentrabajo.tipo_orden = orden_trabajo.tipo');
		$this->db->join('sisusers', 'sisusers.usrId = orden_trabajo.id_usuario');
		$this->db->join('sisusers AS user1', 'user1.usrId = orden_trabajo.id_usuario_a');//usuario asignado?
		$this->db->join('usuarioasempresa', 'usuarioasempresa.usrId = user1.usrId');
		$this->db->join('sucursal', 'sucursal.id_sucursal = orden_trabajo.id_sucursal');
		$this->db->join('equipos','equipos.id_equipo = orden_trabajo.id_equipo');
		$this->db->where('equipos.estado !=','AN');
		$this->db->where('orden_trabajo.id_empresa', $empId);
		$this->db->order_by('orden_trabajo.fecha_inicio', 'DESC');
		$query = $this->db->get();

		//$sql= $this->db->last_query(); 
		//dump($sql);
		//dump_exit($query);

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
	/**
	 * Guarda Orden de Trabajo
	 *
	 * @param   Array   $data   Arreglo con los datos de la OT.
	 */
	function guardar_agregar($data) // Ok
	{
			$query = $this->db->insert("orden_trabajo", $data);
			return $query;
	}
	/**
	 * Devuelve valores de la OT con id_orden = $id.
	 *
	 * @param   Int     Id de Orden de Trabajo.
	 */
	function getpencil($id) // Ok
	{
			$sql = "SELECT orden_trabajo.id_orden,
							orden_trabajo.nro,
							orden_trabajo.fecha_inicio,
							orden_trabajo.fecha_entrega,
							orden_trabajo.descripcion,
							orden_trabajo.estado,
							orden_trabajo.id_usuario,
							orden_trabajo.id_usuario_a,
							orden_trabajo.id_usuario,
							orden_trabajo.id_sucursal,
							sucursal.descripc,
							sisusers.usrNick,
							abmproveedores.provnombre,
							abmproveedores.provid,
							equipos.id_equipo,
							equipos.codigo
					FROM orden_trabajo
					JOIN equipos ON equipos.id_equipo=orden_trabajo.id_equipo
					JOIN sucursal ON sucursal.id_sucursal=orden_trabajo.id_sucursal
					jOIN sisusers ON sisusers.usrId=orden_trabajo.id_usuario
					JOIN abmproveedores ON abmproveedores.provid=orden_trabajo.id_proveedor
					WHERE orden_trabajo.id_orden=$id
					";
			$query = $this->db->query($sql);
//$sql= $this->db->last_query(); 
//dump($sql);
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
	function update_edita($idequipo,$data) // Ok
	{
			$this->db->where('id_orden', $idequipo);
			dump($data);
			$query = $this->db->update("orden_trabajo",$data);
			return $query;
	}
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
	    $sql="SELECT orden_trabajo.id_orden, orden_trabajo.id_tarea, orden_trabajo.nro, orden_trabajo.fecha, orden_trabajo.fecha_program, orden_trabajo.fecha_inicio, orden_trabajo.fecha_entrega, orden_trabajo.fecha_terminada, orden_trabajo.fecha_aviso, orden_trabajo.fecha_entregada, orden_trabajo.descripcion, orden_trabajo.estado, orden_trabajo.id_usuario, orden_trabajo.id_usuario_a, orden_trabajo.id_solicitud, orden_trabajo.tipo, orden_trabajo.id_equipo, orden_trabajo.duracion, orden_trabajo.id_tareapadre, tareas.descripcion AS detarea, orden_trabajo.id_equipo, equipos.codigo, equipos.descripcion AS deequipos, user1.usrName AS nombre,user1.usrLastName, user1.grpId AS grp, sisusers.usrName, sisusers.usrLastName, sisgroups.grpId, tbl_tipoordentrabajo.id
	    	FROM orden_trabajo
	    	JOIN tareas ON tareas.id_tarea=orden_trabajo.id_tarea
	    	JOIN tbl_tipoordentrabajo ON tbl_tipoordentrabajo.id=orden_trabajo.tipo
	    	JOIN equipos ON equipos.id_equipo=orden_trabajo.id_equipo
	    	JOIN sisusers ON sisusers.usrId = orden_trabajo.id_usuario
			join sisusers AS user1 ON user1.usrId = orden_trabajo.id_usuario_a
			join sisgroups ON sisgroups.grpId = user1.grpId
	    	  WHERE equipos.estado !='AN' AND orden_trabajo.id_orden=$id";

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

	//PEDIDOS
	function getorden($id){

	    $sql="SELECT * 
	    	  FROM orden_pedido
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
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $this->db->select('count(orden_trabajo.tipo) as CantidadTipoOT');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_empresa', $empresaId);
        $this->db->group_by('orden_trabajo.tipo');
        $query = $this->db->get();
        if($query->num_rows()!=0)
        {
            return $query->result_array();
        }
        else
        {
            return false;
        }
    }

}	
