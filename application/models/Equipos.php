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
        equipos.estado AS estadoEquipo,
        equipos.meta_disponibilidad as meta_disp,
        unidad_industrial.id_unidad,
        unidad_industrial.descripcion AS deun,
        area.id_area,
        area.descripcion AS dear,
        empresas.id_empresa,
        empresas.descripcion AS deem,
        sector.id_sector,
        sector.descripcion AS desec,
        criticidad.id_criti,
        criticidad.descripcion AS decri,
        proceso.id_proceso,
        proceso.descripcion AS depro');
    $this->db->from('equipos');
    $this->db->join('sector', 'sector.id_sector=equipos.id_sector');
    $this->db->join('empresas', 'empresas.id_empresa=equipos.id_empresa');
    $this->db->join('unidad_industrial', 'unidad_industrial.id_unidad=equipos.id_unidad');
    $this->db->join('criticidad', 'criticidad.id_criti=equipos.id_criticidad');
    $this->db->join('area', 'area.id_area=equipos.id_area');
    $this->db->join('proceso', 'proceso.id_proceso=equipos.id_proceso');
    $this->db->where('equipos.estado !=', 'AN');
    $this->db->where('equipos.id_empresa', $empId);
    $this->db->order_by('equipos.id_equipo', 'ASC');
    $query = $this->db->get();

	  if ($query->num_rows()!=0)
		{
			$equipos = $query->result_array();
      foreach ($equipos as &$valor) 
      {
        if( ($valor['estadoEquipo'] == 'AC') || ($valor['estadoEquipo'] == 'RE'))
        {
            $idEquipo = $valor['id_equipo'];
            $this->db->select('*');
            $this->db->from('historial_lecturas');
            $this->db->where('id_equipo', $valor['id_equipo']);
            $this->db->order_by('fecha', 'DESC');
            $this->db->limit(1);
            
            $query2 = $this->db->get();
            $estado = $query2->result_array();
            $valor['estado'] = $estado[0]['estado'];
        }
        else {
            $valor['estado'] = $valor['estadoEquipo'];   
        }
      }
      return $equipos;
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
        $this->db->where('marcasequipos.estado', 'AC');
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
        $this->db->where('admcustomers.estado !=', 'AN');
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
    function update_cambio($data, $idequipo)
    {
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];

        $this->db->where('id_equipo', $idequipo);
        $this->db->where('id_empresa', $empId);

        $query = $this->db->update("equipos",$data);
        return $query;
    }

    function update_estado($data, $idequipo)
    {
        $this->db->where('id_equipo', $idequipo);
        $query = $this->db->update("equipos", $data);
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


	function getcodigo($data = null){

		$query= $this->db->get_where('equipos');
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

    function getco($data = null)
    {
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

    public function delContra($id_contratistaquipo)
    {
        $this->db->where('id_contratistaquipo', $id_contratistaquipo);
        $query = $this->db->delete('contratistaquipo');
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

		// Guarda edicion de lectura
		function setLecturaEdit($data){

			$idLectura = $data["id_lectura"];
			$lectura = $data["lectura"];			
			$this->db->where('id_lectura', $idLectura);
      $query = $this->db->update("historial_lecturas",array('lectura' =>$lectura));
      return $query;  
		}

    /// Trae lecturas de equipo por id de equipo
    function getHistoriaLecturas($data){
    	$id = $data['idequipo'];
    	$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];     // guarda empresa logueadda

        $this->db->select('historial_lecturas.id_lectura,
                        historial_lecturas.id_equipo,
												historial_lecturas.lectura,
												historial_lecturas.fecha,
												historial_lecturas.observacion,
												historial_lecturas.operario_nom AS operario,
												historial_lecturas.turno');
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
        $sql = "SELECT equipos.id_equipo, equipos.estado
        FROM equipos
        JOIN sector ON sector.id_sector=equipos.id_sector
        JOIN empresas ON empresas.id_empresa=equipos.id_empresa
        JOIN unidad_industrial ON unidad_industrial.id_unidad=equipos.id_unidad
        JOIN criticidad ON criticidad.id_criti=equipos.id_criticidad
        JOIN area ON area.id_area=equipos.id_area
        JOIN proceso ON proceso.id_proceso=equipos.id_proceso
        WHERE equipos.estado != 'AN'
        AND equipos.id_empresa = '".$empresaId."'
        ";
        //GROUP BY equipos.estado
        /*$sql = "SELECT COUNT(equipos.estado) AS cantEstadoActivo, equipos.estado
            FROM equipos
            WHERE equipos.id_empresa = '".$empresaId."'
            AND (equipos.estado = 'AC' OR equipos.estado = 'RE')
            GROUP BY equipos.estado
            ";*/
        $query = $this->db->query($sql);

        if ($query->num_rows()!=0)
        {
            $equipos = $query->result_array();
            foreach ($equipos as &$valor) 
            {
                if( ($valor['estado'] == 'AC') || ($valor['estado'] == 'RE') )
                {
                    $idEquipo = $valor['id_equipo'];
                    $this->db->select('estado');
                    $this->db->from('historial_lecturas');
                    $this->db->where('id_equipo', $idEquipo);
                    $this->db->order_by('id_equipo', 'DESC');
                    $this->db->limit(1);
                    
                    $query2 = $this->db->get();
                    $estado = $query2->result_array();
                    $valor['estado'] = $estado[0]['estado'];
                    $valor['cantEstadoActivo'] = 0;
                }
                else {
                    $valor['estado'] = $valor['estado'];   
                    $valor['cantEstadoActivo'] = 0;
                }
            }
            return $equipos;
        }

    }











    /**
     * Calcula la disponibilidad de los ultimos 12meses de los equipos.
     *
     * @param   Int     $idEquipo   id del equipo a evaluar | todos los equipos.
     *
     * @return  Array|Void  Disponibilidad de equipos x mes de los ultimos 12meses.
     */
    function kpiCalcularDisponibilidad($idEquipo, $fechaInicio=false, $fechaFin=false )
    {
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];     // guarda usuario logueado

        $disponibilidad = array();

        $this->db->select('equipos.id_equipo, meta_disponibilidad as meta_dsp');
        $this->db->from('historial_lecturas');
        $this->db->join('equipos', 'equipos.id_equipo = historial_lecturas.id_equipo');
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

        
        
        if($idEquipo != 'all')
        {
            $this->db->where('equipos.id_equipo', $idEquipo);
        }

        $this->db->order_by('equipos.id_equipo', 'ASC');
        $this->db->group_by('equipos.id_equipo');

        //$aux = $this->db->get_compiled_select();
        $query   = $this->db->get();
        $equipos = $query->result_array();

        $nroEquipos = sizeof($equipos) == 0?1:sizeof($equipos);
        //dump($equipos, 'equipos');
        $metaPromedio = 0;
        //para cada equipo con lecturas calculo la disponibilidad
        for ($k=0; $k < sizeof($equipos); $k++) 
        { 
            $metaPromedio = $metaPromedio + $equipos[$k]["meta_dsp"];
            //para cada mes
            for ($mes=1; $mes<=12; $mes++)
            {
                $mes2 = date('m')-11 + $mes-1;
                $fecha  = date('Y-m', mktime(0, 0, 0, $mes2 , 1, date('Y')));
                $inicio = date_create($fecha);

                $inicio->modify('first day of this month');
                $fin                  = date_create($fecha);
                $fin->modify('last day of this month');
                $fechasInicio[$mes-1] = $inicio->format('Y-m-d 00:00:00');
                $fechasFin[$mes-1]    = $fin->format('Y-m-d 23:59:59');
                //dump($fechasInicio[$mes-1]);
                //dump($fechasFin[$mes-1]);
                //dump( $equipos[$k]["id_equipo"], 'id-equipo');

                //traigo historial de lecturas entre las fechas inicio y fin de mes        
                $historialLecturasMes[$k] = $this->getHistorialLecturasMes($equipos[$k]["id_equipo"], $fechasInicio[$mes-1], $fechasFin[$mes-1]);
                //dump($historialLecturasMes, 'historial del mes '.$mes.' - equipo '.$equipos[$k]["id_equipo"]);
                $estadoaux            = $historialLecturasMes[$k][0]['estado'];
                //$arrayIntervalos = array();
                $arrayIntervalos[$k][$mes-1][0]   = $historialLecturasMes[$k][0];

                //obtengo arreglo con los intervalos entre cambios de estado
                $i              = 1;
                $nroLecturasMes = sizeof($historialLecturasMes[$k]);
                for($j=0; $j<$nroLecturasMes; $j++)
                {
                    if($historialLecturasMes[$k][$j]['estado'] != $estadoaux)
                    {
                        $arrayIntervalos[$k][$mes-1][$i] = $historialLecturasMes[$k][$j];
                        $i++;
                        $estadoaux = $historialLecturasMes[$k][$j]['estado'];
                    }
                }
                //revisar siguiente linea
                $arrayIntervalos[$k][$mes-1][$i] = $historialLecturasMes[$k][$nroLecturasMes-1];
            }
            //dump($arrayIntervalos[$k], 'arrayIntervalos'.$mes.' - equipo'.$equipos[$k]["id_equipo"]);
            

            //Cambio la fecha de finalizacion del intervalo del mes actual
            $finDeMes       = new DateTime(date('Y-m'));
            $finDeMes->modify('last day of this month')->setTime(23,59,59);
            $finDeMesString = $finDeMes->format('Y-m-d H:i:s');
            $ultimaFecha    = date( 'Y-m-d H:i:s' );
            //dump($finDeMesString);
            //dump($arrayIntervalos[$k][11][$nroLecturasMes-1]['fecha']);
            //dump($ultimaFecha);
            $sizeIntervalos = sizeof($arrayIntervalos[$k][11]);
            //dump($sizeIntervalos, 'tamaño intervalos');
            $arrayIntervalos[$k][11][$sizeIntervalos-1]['fecha'] = $ultimaFecha;
            //dump($arrayIntervalos[$k], 'arrayIntervalos '.$mes.' - equipo'.$equipos[$k]["id_equipo"]);


            //calculo tiempo operativo y disponibilidad
            for ($mes=1; $mes<=12; $mes++)
            {
                $tiempoOperativo[$k][$mes-1] = 0;
                $nroLecturasMes          = sizeof($arrayIntervalos[$k][$mes-1]);

                for($j=0; $j<$nroLecturasMes; $j++)
                {
                    if($arrayIntervalos[$k][$mes-1][$j]['estado'] == 'AC')
                    {
                        if((isset($arrayIntervalos[$k][$mes-1][$j-1])) AND ($arrayIntervalos[$k][$mes-1][$j-1]['estado'] == 'AC'))
                        {
                            $fin             = $arrayIntervalos[$k][$mes-1][$j]['fecha'];
                            $tiempoOperativo[$k][$mes-1] = $tiempoOperativo[$k][$mes-1] + (int)$this->diferencia($inicio, $fin);
                            $inicio          = $arrayIntervalos[$k][$mes-1][$j]['fecha'];
                        }
                        else
                        {
                            $inicio = $arrayIntervalos[$k][$mes-1][$j]['fecha'];
                        }
                    }
                    else
                    {
                        if((isset($arrayIntervalos[$k][$mes-1][$j-1])) AND ($arrayIntervalos[$k][$mes-1][$j-1]['estado'] == 'AC'))
                        {
                            $fin = $arrayIntervalos[$k][$mes-1][$j]['fecha'];
                            $tiempoOperativo[$k][$mes-1] = $tiempoOperativo[$k][$mes-1] + (int)$this->diferencia($inicio, $fin);
                        }
                    }
                }


                // Tiempo operativo en meses futuros = 0 
                // (para perdiodos de tiempo parametrizados)
                /*$diferenciaFecha = strtotime($finDeMesString) < strtotime($arrayIntervalos[$k][$mes-1][$nroLecturasMes-1]['fecha']);
                if( ($nroLecturasMes == '2') AND ($diferenciaFecha) )
                {
                    $tiempoOperativo[$k][$mes-1] = 0;
                }*/


                //saco la fecha inicio y fecha fin de mes
                $mesActualInt = date('m')-11 + $mes-1;//date( 'Y-'.$mes );
                $mesActual  = date('Y-m', mktime(0, 0, 0, $mesActualInt , 1, date('Y')));

                $fechaInicio = new DateTime( date('Y-m', mktime(0, 0, 0, $mesActualInt , 1, date('Y'))) );
                $fechaInicioString = $fechaInicio->format('Y-m-d H:i:s');

                $fechaFin = new DateTime(date('Y-m', mktime(0, 0, 0, $mesActualInt , 1, date('Y'))) );
                $fechaFin->modify('last day of this month')->setTime(23,59,59);
                $fechaFinString    = $fechaFin->format('Y-m-d H:i:s');


                $cantSegundosPorMes      = $this->diferencia($fechaInicioString, $fechaFinString);
                //dump($cantSegundosPorMes);
                $disponibilidadMes[$k][$mes] = number_format($tiempoOperativo[$k][$mes-1] * 100 / $cantSegundosPorMes, 2, '.', '');
                $yearMonth[$mes]         = $mesActual;

                //dump($disponibilidadMes[$k]);
            }

            //calculo disponibilidad de mes actual
            //dump($arrayIntervalos[$k][11][0]['fecha']);
            //dump($arrayIntervalos[$k][11][$nroLecturasMes-1]['fecha']);
            if( $ultimaFecha == $arrayIntervalos[$k][11][$nroLecturasMes-1]['fecha'] )
            {
                $cantSegundosPorMes      = $this->diferencia($arrayIntervalos[$k][11][0]['fecha'], $arrayIntervalos[$k][11][$nroLecturasMes-1]['fecha']);
                $disponibilidadMes[$k][12] = number_format($tiempoOperativo[$k][11] * 100 / $cantSegundosPorMes, 2, '.', '');
            }
            //dump($cantSegundosPorMes);
            //dump($disponibilidadMes[$k], 'Disponibilidad equipo '.$equipos[$k]["id_equipo"]);

        }

        //disponibilidad de todos los equipos        
        $dispon = array();
        foreach ($disponibilidadMes as $x=>$disponiEquipos) 
        {
            foreach ($disponiEquipos as $id=>$value) 
            {
                if( array_key_exists( $id, $dispon ) )
                {
                    $dispon[$id] += $value;
                    //$dispon[$id] = $dispon[$id] / 2;
                } 
                else 
                {
                    $dispon[$id] = $value;
                }
            }
        }
        for ($x=1; $x <= 12; $x++) { 
            $dispon[$x] = $dispon[$x] / $nroEquipos;
        }
        //dump($dispon, 'TO');



        //preparo info para mandar
        $i = 0;
        foreach ($dispon as $value)
        {
            $disp[$i] = $value;
            $i++;
        }
        $i = 0;
        foreach ($yearMonth as $value)
        {
            $mesAnio[$i] = $value;
            $i++;
        }
        

        $disponibilidad['promedioMetas'] = $metaPromedio/$nroEquipos;
        $disponibilidad["porcentajeHorasOperativas"] = $disp;
        $disponibilidad["tiempo"] = $mesAnio;
        //dump_exit($disponibilidad);
        return $disponibilidad;
    }

    /**
     * Calcula el estado inicial del primer periodo.
     *
     * @param   String  $fechaInicio    Fecha de inicio.
     *
     * @return  String  Estado del último historial de lectura antes de la fecha inicial.
     */
    function getEstadoAnterior($fechaInicio, $idEquipo) // Ok
    {
        $this->db->select('estado');
        $this->db->from('historial_lecturas');
        $this->db->where('id_equipo', $idEquipo);
        $this->db->where('fecha <=', $fechaInicio);
        $this->db->order_by('fecha', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get();
        $lecturaAnterior = $query->result_array();
        return $lecturaAnterior[0]['estado'];
    }

    /**
     * Saca diferencia entre dos fechas.
     *
     * @param   Datetime    $fecha_inicio   Fecha de inicio.
     * @param   Datetime    $fecha_fin      Fecha final de la comparacion.
     *
     * @return  Datetime    Diferencia de fechas.
     */
    function diferencia($fecha_inicio, $fecha_fin, $formato="s") // Ok
    {
        $datetime1 = new DateTime($fecha_inicio);
        $datetime2 = new DateTime($fecha_fin);
        $diferencia = $datetime1->diff($datetime2, false);
        switch( $formato ){
            case "y": //años
                $total = $diferencia->y + $diferencia->m / 12 + $diferencia->d / 365.25; break;
            case "m": //meses
                $total= $diferencia->y * 12 + $diferencia->m + $diferencia->d/30 + $diferencia->h / 24;
                break;
            case "d": //dias
                $total = $diferencia->y * 365.25 + $diferencia->m * 30 + $diferencia->d + $diferencia->h/24 + $diferencia->i / 60;
                break;
            case "h": //horas
                $total = ($diferencia->y * 365.25 + $diferencia->m * 30 + $diferencia->d) * 24 + $diferencia->h + $diferencia->i/60;
                break;
            case "i": //minutos
                $total = (($diferencia->y * 365.25 + $diferencia->m * 30 + $diferencia->d) * 24 + $diferencia->h) * 60 + $diferencia->i + $diferencia->s/60;
                break;
            case "s": //segundos
                $total = ((($diferencia->y * 365.25 + $diferencia->m * 30 + $diferencia->d) * 24 + $diferencia->h) * 60 + $diferencia->i)*60 + $diferencia->s;
                break;
        }
        //dump_exit($total);
        return $total;
    }

    function getHistorialLecturasMes($idEquipo, $fechaInicio, $fechaFin)
    {
        //saco las lecturas del mes
        $this->db->select('id_lectura, id_equipo, lectura, fecha, estado');
        $this->db->from('historial_lecturas');
        $this->db->where('id_equipo', $idEquipo);
        $this->db->where('fecha >=', $fechaInicio);
        $this->db->where('fecha <=', $fechaFin);
        $this->db->order_by("fecha", "asc");

//        $aux = $this->db->get_compiled_select();

        $query = $this->db->get();
        $historialLecturas = $query->result_array();
        //dump($historialLecturas, 'Historial de lecturas del mes');

        //agrego lectura el primer dia del mes a las 00:00hs
        $estadoInicial = $this->getEstadoAnterior($fechaInicio, $idEquipo);
        //dump($estadoInicial, 'Estado inicial');
        $lecturaInicio[0] = array(
            'id_lectura' => '0', 
            'id_equipo'  => '0', 
            'lectura'    => '0', 
            'fecha'      => $fechaInicio, 
            'estado'     => $estadoInicial
        );
        $historialLecturas = array_merge( $lecturaInicio, $historialLecturas);

        //agrego lectura al final del mes a las 23:59
        $ultimaLectura = end($historialLecturas);
        $ultimoEstado = $ultimaLectura['estado'];
        //dump($ultimoEstado, 'Último estado');
        $lecturaFin[0] = array(
            'id_lectura' => '0', 
            'id_equipo'  => '0', 
            'lectura'    => '0', 
            'fecha'      => $fechaFin, 
            'estado'     => $ultimoEstado
        );
        $historialLecturas = array_merge( $historialLecturas, $lecturaFin);
        //dump($historialLecturas, 'Historial de lecturas del mes');
        return $historialLecturas;
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
                    equipos.adjunto,
                    unidad_industrial.id_unidad,
                    unidad_industrial.descripcion AS deun,
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
        $this->db->join('sector', 'sector.id_sector=equipos.id_sector');
        $this->db->join('empresas', 'empresas.id_empresa=equipos.id_empresa');
        $this->db->join('unidad_industrial', 'unidad_industrial.id_unidad=equipos.id_unidad');
        $this->db->join('criticidad', 'criticidad.id_criti=equipos.id_criticidad');
        $this->db->join('area', 'area.id_area=equipos.id_area');
        $this->db->join('proceso', 'proceso.id_proceso=equipos.id_proceso');
        $this->db->join('marcasequipos', 'marcasequipos.marcaid = equipos.marca');
        $this->db->where('equipos.id_empresa', $empId);
        $this->db->where('equipos.estado !=', 'AN');
        /*// esta validacion hay que hacerla al traer grupos sectores y equipos
        $this->db->where('sector.estado !=', 'AN');
        $this->db->where('marcasequipos.estado !=', 'AN');*/
        $this->db->where('equipos.id_equipo', $idEquipo);

        $query = $this->db->get();
        if ($query->num_rows()!=0)
        {
            $datosEquipo = $query->result_array();

            //traer cliente
            $this->db->select('admcustomers.cliId, admcustomers.cliRazonSocial');
            $this->db->from('equipos');
            $this->db->join('admcustomers', 'admcustomers.cliId=equipos.id_customer');
            $this->db->where('equipos.id_empresa', $empId);
            $this->db->where('equipos.id_equipo', $idEquipo);
            $query = $this->db->get();
            if ($query->num_rows()!=0)
            {
                $datosEquipoCustomer = $query->result_array();
                $datosEquipo[0]["cliId"]          = $datosEquipoCustomer[0]["cliId"];
                $datosEquipo[0]["cliRazonSocial"] = $datosEquipoCustomer[0]["cliRazonSocial"];
            } else {
                $datosEquipo[0]["cliId"]          = null;
                $datosEquipo[0]["cliRazonSocial"] = null;
            }


            //traer grupo
            $this->db->select('grupo.id_grupo, grupo.descripcion AS degr');
            $this->db->from('equipos');
            $this->db->join('grupo', 'grupo.id_grupo=equipos.id_grupo');
            $this->db->where('equipos.id_empresa', $empId);
            $this->db->where('equipos.id_equipo', $idEquipo);
            $query = $this->db->get();
            if ($query->num_rows()!=0)
            {
                $datosEquipoCustomer = $query->result_array();
                $datosEquipo[0]["id_grupo"] = $datosEquipoCustomer[0]["id_grupo"];
                $datosEquipo[0]["degr"]     = $datosEquipoCustomer[0]["degr"];
            } else {
                $datosEquipo[0]["id_grupo"] = null;
                $datosEquipo[0]["degr"]     = null;
            }

            return $datosEquipo;
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


    function estado_alta($idEquipo)
    {
        $this->db->select('equipos.id_equipo, equipos.estado, equipos.ultima_lectura, equipos.fecha_ultimalectura');
        $this->db->from('equipos');
        $this->db->where('equipos.id_equipo', $idEquipo);
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

    function alta_historial_lectura($parametros)
    {
        $id_equipo    = $parametros['id_equipo'];
        $lectura      = $parametros['lectura'];
        $fecha        = $parametros['fecha']=="0000-00-00 00:00:00"?(new DateTime())->format('Y-m-d H:i:s'):$parametros['fecha'];
        $userdata = $this->session->userdata('user_data');
        $usrId        = $userdata[0]['usrId'];
        $observacion  = $parametros['observacion'];
        $operario     = $parametros['operario'];
        $turno        = $parametros['turno'];
        $estado       = $parametros['estado'];

        $datos = array(
            'id_equipo'    => $id_equipo,
            'lectura'      => $lectura,
            'fecha'        => $fecha,
            'usrId'        => $usrId,
            'observacion'  => $observacion,
            'operario_nom' => $operario,
            'turno'        => $turno,
            'estado'       => $estado,
				);
				// dump($datos, 'datos en alta historial: ');
        // dump_exit($datos);
        $this->db->insert('historial_lecturas',$datos);
        $query = $this->db->insert_id();
        return $query;
    }


    /**
     * Equipos:updateAdjuntoEquipo();
     *
     * @param  String   $adjunto    Nombre del archivo
     * @param  Int      $ultimoId   Id del equipo al que se le va a adjuntar archivo
     * @return String               Nombre del archivo adjuntado
     */
    public function updateAdjuntoEquipo($adjunto,$ultimoId)
    {
        $this->db->where('id_equipo', $ultimoId);
        $query = $this->db->update("equipos", $adjunto);
        return $adjunto;
    }

    /**
     * Equipos:eliminarAdjunto
     * Elimina el Archivo Adjunto de un preventivo dado (no elimina el archivo).
     *
     * @param Int       $idPreventivo   Id de preventivo
     * @return Bool                     True o False
     */
    public function eliminarAdjunto($idEquipo)
    {
        $data  = array( 'adjunto' => '' );
        $this->db->where('id_equipo', $idEquipo);
        $query = $this->db->update("equipos", $data);
        return $query;
    }

    public function informe_equipos()
    {
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 

        $this->db->select('count(*) as result');
        $this->db->where('estado', 'AC');
        $this->db->where('id_empresa', $empId);
        $data['eqActivos'] = $this->db->get('equipos')->row()->result;

        $this->db->select('count(*) as result');
        $this->db->where('estado', 'RE');
        $this->db->where('id_empresa', $empId);
        $data['eqReparacion'] = $this->db->get('equipos')->row()->result;

        return $data;
    }

    function asignarMeta($data){
        $this->db->set('meta_disponibilidad', $data['meta']);
        $this->db->where('id_equipo', $data['eq']);
        return $this->db->update('equipos');
    }
    
}