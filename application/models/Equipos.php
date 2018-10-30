<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Equipos extends CI_Model {

    function __construct() {
        parent::__construct();
    }

	function equipos_List()
    {
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];     // guarda usuario logueado

		$this->db->select('equipos.id_equipo,
					equipos.codigo,
					equipos.descripcion AS deeq,
					equipos.estado,
					unidad_industrial.id_unidad,
					unidad_industrial.descripcion AS deun,
					grupo.id_grupo,
					grupo.descripcion AS degr,
					area.id_area,
					area.descripcion AS dear,
					empresas.id_empresa,
					empresas.descripcion AS deem,
					sector.id_sector,
					sector.descripcion AS desec,
                    admcustomers.cliLastName,
					criticidad.id_criti,
					criticidad.descripcion AS decri,
					proceso.id_proceso,
					proceso.descripcion AS depro');
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

	// Da de baja equipos (AN)
	function baja_equipos($data, $idequipo)
    {
        $userdata = $this->session->userdata('user_data');
        $empId    = $userdata[0]['id_empresa'];     // empresa logueado
		$this->db->where('equipos.id_empresa', $empId);
        $this->db->where('id_equipo', $idequipo);
        $query = $this->db->update('equipos',$data);

        return $query;
    }

    function getareas()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $query     = $this->db->get_where('area',array('id_empresa' => $empresaId, 'estado' => 'AC'));
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
            }
    }

	function getequipofichas($id){

		$this->db->select('ficha_equipo.*');
    	$this->db->from('ficha_equipo');
    	$this->db->join('equipos', 'equipos.id_equipo = ficha_equipo.id_equipo');
    	$this->db->where('equipos.id_equipo', $id);
    	$query= $this->db->get();

		if($query->num_rows()>0){
		    return $query->result();
		}
		else{
		    return false;
		    }
	}


	function getsector()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
		$query     = $this->db->get_where('sector',array('id_empresa' => $empresaId));
		if($query->num_rows()>0){
		    return $query->result();
		}
		else{
		    return false;
		    }
	}

	// Trae criticidad y llena el select - Listo
	function getcriti()
    {
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->select('criticidad.*');
    	$this->db->from('criticidad');
		$this->db->where('criticidad.id_empresa', $empId);
        $this->db->where('criticidad.estado', 'AC');
		$query= $this->db->get();
		if($query->num_rows()>0){
		    return $query->result();
		}
		else{
		    return false;
		}
	}



	// Trae grupo por empresa y llena el select - Listo
    function getgrupos()
    {

        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->select('grupo.*');
        $this->db->from('grupo');
		$this->db->where('grupo.id_empresa', $empId);
        $this->db->where('grupo.estado', 'AC');
		$query = $this->db->get();

        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
    }

    // Trae proceso y llena el select - Listo
	function getprocesos()
    {

        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->select('proceso.*');
        $this->db->from('proceso');
		$this->db->where('proceso.id_empresa', $empId);
        $this->db->where('proceso.estado', 'AC');
		$query = $this->db->get();

        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
    }

    // Trae empresa logueada (Listo)
	function getempresa()
    {

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
		$this->db->select('empresas.id_empresa,
							empresas.descripcion');
    	$this->db->from('empresas');
		$this->db->where('empresas.id_empresa', $empId);
    	$query= $this->db->get();
    	if($query->num_rows()>0){
		    return $query->result();
		}
		else{
		    return false;
		}
	}


	// function getgrupo(){

		// 	$query= $this->db->get_where('grupo');
		// 	if($query->num_rows()>0){
		// 	    return $query->result();
		// 	}
		// 	else{
		// 	    return false;
		// 	}

	// }



	// Trae etapa/sector y llena el select - Listo
  	function getetapas(){

  		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->select('sector.*');
        $this->db->from('sector');
		$this->db->where('sector.id_empresa', $empId);
        $this->db->where('sector.estado', 'AC');
		$query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
    }

    // Trae contratistas segun empresa logueada - Listo
	function getcontra()
    {
        $userdata = $this->session->userdata('user_data');
        $empId    = $userdata[0]['id_empresa'];

        $this->db->select('contratistas.*');
        $this->db->from('contratistas');
		$this->db->where('contratistas.id_empresa', $empId);
		$query = $this->db->get();
		if($query->num_rows()>0){
		    return $query->result();
		}
		else{
		    return false;
		}

	}
	// Trae todas las marcas y llena el select - Listo
	function getmarcas(){
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->select('marcasequipos.*');
        $this->db->from('marcasequipos');
        $this->db->where('marcasequipos.id_empresa', $empId);
        $query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
            }

    }
    // Trae todas las marcas y llena el select - Listo
    function getclientes(){
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->select('admcustomers.*');
        $this->db->from('admcustomers');
        $this->db->where('admcustomers.id_empresa', $empId);
        $query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
            }

    }

    // Trae unidades industriales - Listo
	function getunidads(){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->select('unidad_industrial.*');
        $this->db->from('unidad_industrial');
		$this->db->where('unidad_industrial.id_empresa', $empId);
		$query = $this->db->get();

		if($query->num_rows()>0){
		    return $query->result();
		}
		else{
		    return false;
		}
	}

	// Agrega unidad industrial y devuelve id de insercion - Listo
	function agregar_unidades($data){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
		$data['id_empresa'] = $empId;

		$this->db->insert('unidad_industrial',$data);
		$query = $this->db->insert_id();
		return $query;
	}

	// Agrega las areas nuevas - Listo
	function agregar_area($data){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
        $data['id_empresa'] = $empId;
        $data['estado'] = 'AC';
		$this->db->insert("area",$data);
		$query = $this->db->insert_id();
    	return $query;
	}

	// Agrega las procesos nuevos - Listo
	function agregar_proceso($data){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
        $data['id_empresa'] = $empId;
        $data['estado'] = 'AC';
		$this->db->insert("proceso",$data);
		$query = $this->db->insert_id();
    	return $query;
	}

	// Agrega sector/etapa nuevos - Listo
	function agregar_etapa($data){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
        $data['id_empresa'] = $empId;
        $data['estado'] = 'AC';
		$this->db->insert("sector",$data);
		$query = $this->db->insert_id();
    	return $query;
	}

	// Agrega criticidad nueva - Listo
   	function agregar_criti($data){

   		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
        $data['id_empresa'] = $empId;
        $data['estado'] = 'AC';
        $query = $this->db->insert("criticidad",$data);
    	return $query;
    }

    // Agrega las grupos nuevos - Listo
    function agregar_grupos($data){
    	$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
        $data['id_empresa'] = $empId;
        $data['estado'] = 'AC';
        $query = $this->db->insert("grupo",$data);
    	return $query;
    }

    function agregar_marcas($data){
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
        $data['id_empresa'] = $empId;
        $query = $this->db->insert("marcasequipos",$data);
        return $query;
    }

    function agregar_clientes($data){
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];
        $data['id_empresa'] = $empId;
        $query = $this->db->insert("admcustomers",$data);
        return $query;
    }

    function agregar_sector($data){

        $query = $this->db->insert("sector",$data);
    	return $query;
   	}

    function agregar_componente($data){

        $query = $this->db->insert("componentes",$data);
    	return $query;

    }

    function agregar_seguros($data){

        $query = $this->db->insert("seguro",$data);
    	return $query;

    }

    // Agrega equipo nuevo - Listo
    function insert_equipo($data)
    {
        $userdata           = $this->session->userdata('user_data');
        $empId              = $userdata[0]['id_empresa'];
        $data['id_empresa'] = $empId;
        $query              = $this->db->insert("equipos",$data);
        return $query;
    }

    // Agrega info adicional de equipo nuevo - Listo
    function insert_equipinfo($data)
    {
        $userdata           = $this->session->userdata('user_data');
        $empId              = $userdata[0]['id_empresa'];
        $data['id_empresa'] = $empId;
        $query = $this->db->insert("informacionequipo",$data);
        return $query;
    }



    function update_equipo2($estado, $idequi){

       $this->db->where('id_equipo', $idequi);
        $query = $this->db->update("equipos",$estado);
        return $query;
    }
    // Cambia estado del equipo a inhabilitado desde la lista
    function update_cambio($data, $idequipo){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->where('id_equipo', $idequipo);
        $this->db->where('id_empresa', $empId);

        $query = $this->db->update("equipos",$data);
        return $query;
    }

    function update_estado($data, $idequipo){

        $this->db->where('id_equipo', $idequipo);
        $query = $this->db->update("equipos",$data);
        return $query;
    }

    function update_e($estado, $idequi){

        $this->db->where('id_equipo', $idequi);
        $query = $this->db->update("equipos",$estado);
        return $query;
    }

    // Devuelve datos para editar equipos - Listo
	function getpencil($id){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

		$this->db->select('equipos.*,
	    					empresas.descripcion AS deemp,
	    					empresas.id_empresa,
	    					sector.id_sector,
	    					sector.descripcion AS desect,
	    					grupo.id_grupo,
	    					grupo.descripcion AS degrupo,
	    					criticidad.id_criti,
	    					criticidad.descripcion AS decriti,
	    					');
    	$this->db->from('equipos');
    	$this->db->join('empresas', 'empresas.id_empresa = equipos.id_empresa');
    	$this->db->join('sector', 'sector.id_sector = equipos.id_sector');
    	$this->db->join('criticidad', 'criticidad.id_criti = equipos.id_criticidad');
    	$this->db->join('grupo', 'grupo.id_grupo = equipos.id_grupo');
    	//$this->db->join('marcasequipos', 'marcasequipos.marcaid = equipos.marca');
    	$this->db->where('equipos.id_equipo', $id);
        $this->db->where('equipos.id_empresa', $empId);

	    $query= $this->db->get();

	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();
	    }
	    else {
	      return 0;
	    }
	}

	function getdatosfichas($id){

	    $this->db->select('equipos.id_equipo,
	    					equipos.descripcion,
	    					equipos.fecha_ingreso,
	    					equipos.fecha_garantia,
	    					equipos.marca,
	    					equipos.ubicacion,
	    					equipos.codigo,
	    					equipos.estado,
	    					equipos.fecha_ultimalectura,
	    					equipos.ultima_lectura,
	    					sector.id_sector,
	    					sector.descripcion AS desect');
    	$this->db->from('equipos');
    	$this->db->join('sector', 'sector.id_sector = equipos.id_sector');
    	$this->db->where('equipos.id_equipo', $id);
    	$query= $this->db->get();

	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();
	    }
	    else {
	      return 0;
	    }
	}

	//aparentemente no se usa
	function contratista($id)
	{
	    $this->db->select('equipos.*');
    	$this->db->from('equipos');
    	$this->db->where('equipos.id_equipo', $id);
    	$query= $this->db->get();

	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();
	    }
	    else {
	      return 0;
	    }
	}


	function getcodigo($data = null)
    {
		$query = $this->db->get_where('equipos');
		if($query->num_rows()>0){
		    return $query->result();
		}
		else{
		    return false;
		    }
	}

	function Buscar($a){

		$sql="SELECT id_equipo
	    	  FROM equipos
	    	 WHERE codigo=$a
	    	  ";

	    $query= $this->db->query($sql);

	    foreach ($query->result_array() as $row)
						{

						        $data = $row['id_equipo'];


						       return $data;
						}
	}

	// Guarda la equipo editado
	public function update_editar($data, $id)
    {
        $this->db->where('id_equipo', $id);
        $query = $this->db->update("equipos",$data);
        return $query;
    }

    function getco($data = null){

		if($data == null)
		{
			return false;
		}
		else
		{

			$ide = $data['id_equipo'];

			$query= $this->db->get_where('equipos',array('id_equipo'=>$ide));
			if($query->num_rows()>0){
                return $query->result();
            }
            else{
                return false;
            }

		}
	}

	function getinfo($data = null){

		if($data == null)
		{
			return false;
		}
		else
		{

			$ide1 = $data['idequipo'];

			$query= $this->db->get_where('equipos',array('id_equipo'=>$ide1));
			if($query->num_rows()>0){
                return $query->result();
            }
            else{
                return false;
            }

		}
	}
	//Guarda contratista asignado a equipo por empresa
	public function insert_contratista($data)
    {
        $query = $this->db->insert("contratistaquipo", $data);
        return $query;
    }

    public function insert_componentes($data)
    {
        $query = $this->db->insert("componentes",$data);
         return 1;

    }


	public function insert_componenteequip($data)
    {
        $query = $this->db->insert("componenteequipo",$data);
        //$query= $this->db->query($sql);
         return 1;

    }

	public function agregar_ficha($data)
    {
        $query = $this->db->insert("ficha_equipo",$data);
         return 1;

    }

    public function update_ficha($data, $id)
    {
        $this->db->where('id_equipo', $id);
        $query = $this->db->update("ficha_equipo",$data);
        return $query;
    }

    function getsolImps($id){

     	$sql="SELECT equipos.ubicacion, equipos.marca, equipos.codigo, equipos.estado, equipos.id_sector, ficha_equipo.marca AS marcaeq, ficha_equipo.modelo, ficha_equipo.numero_motor, ficha_equipo.numero_serie, ficha_equipo.fecha_ingreso as fechain, ficha_equipo.dominio, ficha_equipo.fabricacion, ficha_equipo.peso, ficha_equipo.bateria, ficha_equipo.hora_lectura, sector.descripcion AS sector
     		FROM equipos
     		JOIN ficha_equipo ON ficha_equipo.id_equipo=equipos.id_equipo
     		JOIN sector ON  sector.id_sector=equipos.id_sector



                  WHERE equipos.id_equipo=$id
              ";

        $query= $this->db->query($sql);
        foreach ($query->result_array() as $row){

            $data['codigo'] = $row['codigo'];
            $data['estado'] = $row['estado'];
            $data['ubicacion'] = $row['ubicacion'];
            $data['marca'] = $row['marca'];
            $data['marcaeq'] = $row['marcaeq'];
            $data['modelo'] = $row['modelo'];
            $data['numero_motor'] = $row['numero_motor'];
            $data['numero_serie'] = $row['numero_serie'];
            $data['fechain'] = $row['fechain'];
            $data['dominio'] = $row['dominio'];
            $data['fabricacion'] = $row['fabricacion'];
            $data['peso'] = $row['peso'];
          	$data['bateria'] = $row['bateria'];
          	$data['hora_lectura'] = $row['hora_lectura'];
          	$data['sector'] = $row['sector'];

           return $data;
        }

    }


    function getequiposseguro($id){

     	$sql="SELECT *
     		FROM seguro
     		JOIN equipos ON equipos.id_equipo=seguro.id_equipo



                  WHERE equipos.id_equipo=$id
              ";

        $query= $this->db->query($sql);
        foreach ($query->result_array() as $row){

            $data['asegurado'] = $row['asegurado'];
            $data['ref'] = $row['ref'];
            $data['numero_pliza'] = $row['numero_pliza'];
            $data['fecha_inicio'] = $row['fecha_inicio'];
            $data['fecha_vigencia'] = $row['fecha_vigencia'];
            $data['cobertura'] = $row['cobertura'];


           return $data;
        }

    }


    function getequiposorden($id){

     	$sql="SELECT orden_servicio.fecha, orden_servicio.id_contratista, orden_servicio.id_equipo, orden_servicio.id_solicitudreparacion, orden_servicio.estado, solicitud_reparacion.causa, contratistas.nombre
     		FROM orden_servicio
     		JOIN solicitud_reparacion ON solicitud_reparacion.id_solicitud=orden_servicio.id_solicitudreparacion
     		JOIN equipos ON equipos.id_equipo= orden_servicio.id_equipo
     		JOIN contratistas ON contratistas.id_contratista= orden_servicio.id_contratista
     		WHERE orden_servicio.id_equipo=$id
              ";

        /*$query= $this->db->query($sql);
        foreach ($query->result_array() as $row){

            $data['fecha'] = $row['fecha'];
            $data['causa'] = $row['causa'];
            $data['nombre'] = $row['nombre'];
            $data['estado'] = $row['estado'];



        }

        return $data; */

        $query= $this->db->query($sql);

        if( $query->num_rows() > 0)
        {
          return $query->result_array();
        }
        else {
          return 0;
        }

    }


    /// Guarda lectura Hugo
    function setLecturas($data){

    	 $this->db->trans_start();
             $id_equipo   = $data["id_equipo"];
             $lectura     = $data["lectura"];
             $observacion = $data["observacion"];
             $operario    = $data['operario'];
             $turno       = $data['turno'];
             $estado      = $data['estado'];
             $userdata    = $this->session->userdata('user_data');
             $usrId       = $userdata[0]['usrId'];

	     	$datos = array(
                 'id_equipo'    => $id_equipo,
                 'lectura'      => $lectura,
                 'fecha'        => date('Y-m-d H:i:s'),
                 'usrId'        => $usrId,
                 'observacion'  => $observacion,
                 'operario_nom' => $operario,
                 'turno'        => $turno,
                 'estado'       => $estado
                 );
	     		//guarda la lectura
            //dump_exit($datos);
	     	$this->db->where('id_equipo', $id_equipo);
	     	$this->db->insert('historial_lecturas', $datos);

	     		// actualiza el estado en equipos (R reparacion y O a AC)
	     	if ($estado == "RE") {
	     		$estado_eq = array('estado'=>"RE");;
	     	}
	     	if ($estado == "AC") {
	     		$estado_eq = array('estado'=>"AC");;
	     	}
	     	$this->db->where('equipos.id_equipo',$id_equipo);
	     	$this->db->update('equipos',$estado_eq);

    	 $this->db->trans_complete();

    	 if ($this->db->trans_status() === FALSE)
    	 {
    	     return false;
    	 }
    	 else{
    	     return true;
    	 }
    }
    /// Trae lecturas de equipo por id de equipo
    function getHistoriaLecturas($data){
    	$id = $data['idequipo'];
    	$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];     // guarda empresa logueadda

    	$this->db->select('historial_lecturas.id_equipo,
				    	historial_lecturas.lectura,
				    	historial_lecturas.fecha,
				    	historial_lecturas.usrId,
				    	historial_lecturas.observacion,
				    	historial_lecturas.operario_nom AS operario,
				    	historial_lecturas.turno,
				    	equipos.codigo');
    	$this->db->from('historial_lecturas');
    	$this->db->join('equipos', 'equipos.id_equipo = historial_lecturas.id_equipo');
    	$this->db->where('historial_lecturas.id_equipo', $id);
		$this->db->where('equipos.id_empresa', $empId);

    	$query= $this->db->get();

		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return [];
		}
    }

    function getEqPorIds($data){

    	$id = $data['idequipo'];

		$this->db->select('equipos.id_equipo,
							equipos.codigo,
							historial_lecturas.lectura,
							historial_lecturas.fecha,
							historial_lecturas.estado');
		$this->db->from('historial_lecturas');
		$this->db->join('equipos', 'equipos.id_equipo = historial_lecturas.id_equipo');
		$this->db->where('historial_lecturas.id_equipo',$id);
		$this->db->order_by('id_lectura','DESC');
		$this->db->limit(1);

		$query= $this->db->get();

        if ($query->num_rows()>0)
        {
            return $query->result_array();
        }
        else
        {
            return array();
        }
    }



    /**
     * Devuleva la cantidad de equipos operativos.
     *
     * @return Void|Array     Cantidad de equipos operativos (estado activo o reparacion).
     */
    function kpiSacarEquiposOperativos()
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        /*$this->db->select('count(equipos.estado) as cantEstadoActivo');
        $this->db->from('equipos');
        $this->db->where('equipos.estado', 'AC');
        $this->db->or_where('equipos.estado', 'RE');
        $this->db->group_by('equipos.estado');
        $query = $this->db->get();*/
        $sql = "SELECT COUNT(equipos.estado) AS cantEstadoActivo
            FROM equipos
            WHERE equipos.id_empresa = '".$empresaId."'
            AND (equipos.estado = 'AC' OR equipos.estado = 'RE')
            GROUP BY equipos.estado
            ";
        $query = $this->db->query($sql);

        if ($query->num_rows()!=0)
        {
            return $query->result_array();
        }
    }





















    /**
     * Historial de lecturas de los últimos 12 meses.
     * //Si un mes no tiene historial se agraga una lectura default.//
     * para cada mes, agrego una lectura con el dia 1 a las 00:00:00hs y otro el ultimo dia del mes a las 23:59:59hs
     *
     * @param   Array   $historial_lecturas     Historial de lecturas.
     *
     * @return  Array   Lecturas de los últimos 12 meses.
     */
    function historialLectures12Meses( $historial_lecturas ) {
        $mesActual      = date( 'Y-m', strtotime($historial_lecturas[1]["fecha"] ) ); // mes con formato "año-mes"
        $fecha2         = date_create($mesActual);
        $fecha2->modify('last day of this month');
        $mesActual2     = $fecha2->format('Y-m');
        $ultimoDiaMes2  = $fecha2->format('d');
        $punteroFecha   = $mesActual2."-".$ultimoDiaMes2." 23:59:59";
        //dump_exit( $fecha2 );

        $lecturasPorMes = array();
        $nroLecturas    = sizeof($historial_lecturas);
        $j = 0; // lecturas;
        $k = 0;
        $arrancaMesActual = true;
        $estadoInicial = $historial_lecturas[0]["estado"];
        //dump_exit( $estadoInicial );

        // recorro el historial de lecturas
        for($i=1; $i<$nroLecturas; $i++) {
            if( $mesActual2 == date( 'Y-m', strtotime($historial_lecturas[$i]["fecha"]) ) ) {
                //
                if ($arrancaMesActual == true) {
                    //agrego lectura con estado mes anterior
                    //$lecturasPorMes[$mesActual2][$j] = array(
                    $j=0;
                    $lecturasPorMes[$k][$j] = array(
                            'id_lectura' => "0",
                            'id_equipo'  => "0",
                            'lectura'    => "0",
                            'fecha'      => $mesActual2."-01 00:00:00",
                            'estado'     => $historial_lecturas[$i-1]["estado"]
                        );
                    $j++;
                    $arrancaMesActual = false;
                }
                // cargo el historial de lecturas
                //$lecturasPorMes[$mesActual2][$j] = $historial_lecturas[$i];
                $lecturasPorMes[$k][$j] = $historial_lecturas[$i];
                $j++;
            } else {
                $fecha2         = date_create($mesActual2);
                $fecha2->modify('last day of this month');
                $mesActual2     = $fecha2->format('Y-m');
                $ultimoDiaMes2  = $fecha2->format('d');
                //$lecturasPorMes[$mesActual2][$j] = array(
                $lecturasPorMes[$k][$j] = array(
                        'id_lectura' => "0",
                        'id_equipo'  => "0",
                        'lectura'    => "0",
                        'fecha'      => $mesActual2."-".$ultimoDiaMes2." 23:59:59",
                        'estado'     => $historial_lecturas[$i-1]["estado"]
                    );
                $mesActual2 = date( 'Y-m', strtotime($mesActual2." +1 month") );
                $j++; $k++;
                $i--; //para volver a la lectura
                $arrancaMesActual = true;
            }
            //FALTA VER EL ULTIMO MES. TENGO DESDE LA FEHCA ACTUAL
            //HAY QUE VER QUE PASA DESDE LA FECHA ACTUAL HASTA EL FINAL DE MES.
            //(PORQUE TOMO FECHA TOTAL DE MES.
            //CREO ESTO VA CDO CUENTO EL TIEMPO OPERATIVO)
        }

        //dump_exit($lecturasPorMes);
        return $lecturasPorMes;
    }

    /**
     * Saca diferencia entre dos fechas.
     *
     * @param   Datetime    $fecha_inicio   Fecha de inicio.
     * @param   Datetime    $fecha_fin      Fecha final de la comparacion.
     *
     * @return  Datetime    Diferencia de feachas.
     */
    function diferencia($fecha_inicio, $fecha_fin, $formato="s"){
        $datetime1 = new DateTime($fecha_inicio);
        $datetime2 = new DateTime($fecha_fin);
        $diferencia = $datetime1->diff($datetime2, false);
        switch( $formato ){
            case "y":
                $total = $diferencia->y + $diferencia->m / 12 + $diferencia->d / 365.25; break;
            case "m":
                $total= $diferencia->y * 12 + $diferencia->m + $diferencia->d/30 + $diferencia->h / 24;
                break;
            case "d":
                $total = $diferencia->y * 365.25 + $diferencia->m * 30 + $diferencia->d + $diferencia->h/24 + $diferencia->i / 60;
                break;
            case "h":
                $total = ($diferencia->y * 365.25 + $diferencia->m * 30 + $diferencia->d) * 24 + $diferencia->h + $diferencia->i/60;
                break;
            case "i":
                $total = (($diferencia->y * 365.25 + $diferencia->m * 30 + $diferencia->d) * 24 + $diferencia->h) * 60 + $diferencia->i + $diferencia->s/60;
                break;
            case "s":
                $total = ((($diferencia->y * 365.25 + $diferencia->m * 30 + $diferencia->d) * 24 + $diferencia->h) * 60 + $diferencia->i)*60 + $diferencia->s;
                break;
        }
        //dump_exit($total);
        return $total;
    }

    /**
     * Calcula la disponibilidad de los ultimos 12meses de los equipos.
     *
     * @param   Int     $idEquipo   id del equipo a evaluar | todos los equipos.
     *
     * @return  Array|Void  Disponibilidad de equipos x mes de los ultimos 12meses.
     */
    function kpiCalcularDisponibilidad($idEquipo, $fechaInicio=false, $fechaFin=false ) {
        $disponibilidad = array();

        // Si no hay una fecha específica saco los últimos 12 meses
        // (13 meses para saber el estado inicial de la primera lectura)
        if( $fechaInicio==false && $fechaFin==false) {
            $fechaInicio = date("Y-m-d H:i:s");
            $fechaFin    = strtotime($fechaInicio.' -12 month');//12 o 13...no me queda claro (si es 12 para atras es 12. pero si pone cada mes en una cajita, serian 13)
            $fechaFin    = date('Y-m-d H:i:s', $fechaFin);
            //dump_exit($fechaFin);
        }

        //trae el historial de lecturas
        $this->db->select('id_lectura, id_equipo, lectura, fecha, estado');
        $this->db->from('historial_lecturas');
        if( $idEquipo != "all" ) // si idequipo = 'all' => traigo todos los datos
            $this->db->where('id_equipo', $idEquipo);
        $this->db->where('fecha <=', $fechaInicio);
        $this->db->where('fecha >=', $fechaFin);
        $this->db->order_by("fecha", "asc");
        $query = $this->db->get();
        $historial_lecturas = $query->result_array();

        /* Saco el historial de los 12 meses a mostrar. */
        /* para cada mes, agrego una lectura con el dia 1 a las 00:00:00hs y otro el ultimo dia del mes a las 23:59:59hs */
        /* el estado de esas lecturas se saca del elemento anterior y posterior */
        $historial_lecturas = $this->historialLectures12Meses($historial_lecturas);
        //dump_exit($historial_lecturas);

        $nroMeses = sizeof($historial_lecturas); //12 meses
        $j = 0;
        //ordeno las lecturas x meses (los mas viejos primero)
        for($i=0; $i<$nroMeses; $i++){
            $lecturasMes[$j] = $historial_lecturas[$i];
            $j++;
        }
        //dump_exit($lecturasMes);
        // En lugar de $lecturames[2][0] está $lecturames[2][5]
        //y despues $lecturames[3][6], $lecturames[4][7] ... $lecturames[8][11], $lecturames[9][0]
        $estado = $historial_lecturas[0][0]["estado"];
        $inicio = $historial_lecturas[0][0]["fecha"];

        // para cada mes
        for($i=0; $i<$nroMeses; $i++) {
            //dump($lecturasMes);
            $inicio = $lecturasMes[$i][0]["fecha"];
            $horasOperativas = 0;
            $fin = false;

            $nroLecturasMes = sizeof($lecturasMes[$i]);

            // Para cada lectura
            for($j=1; $j<$nroLecturasMes; $j++) {
                if($lecturasMes[$i][$j]["estado"] == "AC") {
                    // (B)
                    if( $lecturasMes[$i][$j-1]["estado"] != "AC") {
                        $inicio = $lecturasMes[$i][$j]["fecha"];
                    }
                } else {
                    // (C)
                    if( $lecturasMes[$i][$j-1]["estado"] == "AC") {
                        $fin = $lecturasMes[$i][$j]["fecha"];
                        $horasOperativas = $horasOperativas + (int)$this->Equipos->diferencia($inicio, $fin);
                        //print_r($horasOperativas);
                    }
                }
            } //fin for lecturas
            if ( $fin == false ) {

                if( $lecturasMes[$i][$j-1]["estado"] != "AC") {
                    $fin = $lecturasMes[$i][0]["fecha"];
                } else {
                    $fin = $lecturasMes[$i][$j-1]["fecha"];
                }
            }
            $horasOperativas = $horasOperativas + (int)$this->Equipos->diferencia($inicio, $fin);
            //print_r($horasOperativas);
            //echo "<hr><br><br>";
            $totalHorasMes = $this->Equipos->diferencia($lecturasMes[$i][0]["fecha"], $lecturasMes[$i][$nroLecturasMes-1]["fecha"]);
            //$disponibilidadp[$i] = $horasOperativas * 100 / $totalHorasMes ;
            $disponibilidadp[$i] = number_format($horasOperativas * 100 / $totalHorasMes, 2, '.', '');
            $tiempo = date( 'Y-m', strtotime($lecturasMes[$i][$nroLecturasMes-1]["fecha"]) );
            $disponibilidadt[$i] = $tiempo;
            $inicio = $fin;
            //echo "<hr>";
        }//fin for meses

        $disponibilidad["porcentajeHorasOperativas"] = $disponibilidadp;
        $disponibilidad["tiempo"] = $disponibilidadt;
        //dump_exit($disponibilidad, "hsOperativas/tiempo");
        return $disponibilidad;
    }


    /**
     * Trae info de equipo a editar
     *
     * @param   Int     Id de equipo a editar
     *
     * @return  Array  Información del equipo.
     */
    function getEquipoId($idEquipo)
    {
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];     // guarda usuario logueado

        $this->db->select('equipos.id_equipo,
                    equipos.descripcion AS deeq,
                    equipos.fecha_ingreso,
                    equipos.fecha_garantia,
                    equipos.codigo,
                    equipos.ubicacion,
                    equipos.fecha_ultimalectura,
                    equipos.ultima_lectura,
                    equipos.descrip_tecnica,
                    equipos.numero_serie,
                    equipos.estado,
                    unidad_industrial.id_unidad,
                    unidad_industrial.descripcion AS deun,
                    grupo.id_grupo,
                    grupo.descripcion AS degr,
                    admcustomers.cliId,
                    admcustomers.cliRazonSocial,
                    area.id_area,
                    area.descripcion AS dear,
                    empresas.id_empresa,
                    empresas.descripcion AS deem,
                    sector.id_sector,
                    sector.descripcion AS desec,
                    criticidad.id_criti,
                    criticidad.descripcion AS decri,
                    proceso.id_proceso,
                    proceso.descripcion AS depro,
                    marcasequipos.marcaid,
                    marcasequipos.marcadescrip'
                );
        $this->db->from('equipos');
        $this->db->join('grupo', 'grupo.id_grupo=equipos.id_grupo');
        $this->db->join('sector', 'sector.id_sector=equipos.id_sector');
        $this->db->join('empresas', 'empresas.id_empresa=equipos.id_empresa');
        $this->db->join('unidad_industrial', 'unidad_industrial.id_unidad=equipos.id_unidad');
        $this->db->join('criticidad', 'criticidad.id_criti=equipos.id_criticidad');
        $this->db->join('admcustomers', 'admcustomers.cliId=equipos.id_customer');
        $this->db->join('area', 'area.id_area=equipos.id_area');
        $this->db->join('proceso', 'proceso.id_proceso=equipos.id_proceso');
        $this->db->join('marcasequipos', 'marcasequipos.marcadescrip = equipos.marca');
        $this->db->where('equipos.id_empresa', $empId);
        $this->db->where('equipos.estado !=', 'AN');
        /*// esta validacion hay que hacerla al traer grupos sectores y equipos
        $this->db->where('grupo.estado !=', 'AN'); 
        $this->db->where('sector.estado !=', 'AN');
        $this->db->where('marcasequipos.estado !=', 'AN');*/
        $this->db->where('equipos.id_equipo', $idEquipo);
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


    function getContratistasEquipo($idEquipo)
    {
        $this->db->select('
            contratistaquipo.id_contratistaquipo, contratistaquipo.id_equipo, contratistaquipo.id_contratista,
            equipos.codigo,
            contratistas.nombre
            ');
        $this->db->from('contratistaquipo');
        $this->db->join('equipos', 'equipos.id_equipo=contratistaquipo.id_equipo');
        $this->db->join('contratistas', 'contratistas.id_contratista = contratistaquipo.id_contratista');
        $this->db->where('contratistaquipo.id_equipo', $idEquipo);
        $query = $this->db->get();

        if ($query->num_rows()>0)
        {
            return $query->result_array();
        }
        else
        {
            return array();
        }
    }
}