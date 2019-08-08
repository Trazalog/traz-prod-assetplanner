<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Preventivos extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	// Trae listado de Preventivos por empresa logueada - listo
	function preventivos_List(){	

		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa'];          

		$this->db->select('preventivo.prevId, 
											preventivo.id_equipo, 
											tareas.descripcion AS deta, 
											equipos.descripcion AS des,                            
											grupo.descripcion AS des1,
											componentes.descripcion,
											periodo.descripcion AS periodoDesc,
											preventivo.cantidad,
											preventivo.ultimo,
											preventivo.horash,
											preventivo.prev_adjunto,
											preventivo.estadoprev AS estado');
		$this->db->from('preventivo');
		$this->db->join('equipos', 'equipos.id_equipo = preventivo.id_equipo');
		$this->db->join('grupo', 'equipos.id_grupo=grupo.id_grupo');
		$this->db->join('tareas', 'tareas.id_tarea = preventivo.id_tarea');
		$this->db->join('componentes', 'componentes.id_componente = preventivo.id_componente');
		$this->db->join('periodo', 'periodo.idperiodo = preventivo.perido');
		$this->db->where('preventivo.estadoprev !=', 'AN');
		$this->db->where('preventivo.id_empresa', $empId);	

		$query= $this->db->get();

		if( $query->num_rows() > 0)
		{
			$data['data'] = $query->result_array();
			return  $data;
		}
	}

//// Edicion	

	// Trae equipos por empresa logueada - Listo
	function getequipo()
    {
		$userdata = $this->session->userdata('user_data');
        $empId    = $userdata[0]['id_empresa']; 
        $this->db->select('equipos.*');
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
        $this->db->order_by('equipos.codigo', 'ASC');   
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

    // Trae unidades de tiempo  - Listo
    function getUnidTiempos(){

        $this->db->select('unidad_tiempo.*');
        $this->db->from('unidad_tiempo');       
        $query= $this->db->get();

        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
    }

	// Trae datos de equipo por ID para nuevo preventivo - Listo
	function getEquipoNuevoPrevent($data = null){
		
		$id_equipo = $data['id_equipo'];

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
        
    	$this->db->select('equipos.*');
    	$this->db->from('equipos');    	
    	$this->db->where('equipos.id_equipo', $id_equipo);    	
    	$this->db->where('equipos.id_empresa', $empId);    	
    	$query= $this->db->get();		

		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
	}

	// Trae tareas por empresa logueada - Listo
	function gettarea()
    {
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 
    	$this->db->select('tareas.id_tarea AS value, tareas.descripcion AS label');
    	$this->db->from('tareas');    	
    	$this->db->where('tareas.id_empresa', $empId);
        $this->db->where('estado', 'AC');
        $this->db->order_by('label', 'ASC');
    	$query= $this->db->get();

		if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
	}	

	// Trae componente segun id de equipo - Listo
	function getcomponente($id)
    {
	   	$this->db->select('componentes.id_componente, componentes.descripcion');
    	$this->db->from('componentes');
    	$this->db->join('componenteequipo', 'componenteequipo.id_componente = componentes.id_componente');
        $this->db->join('marcasequipos', 'componentes.marcaid = marcasequipos.marcaid');
    	$this->db->where('componenteequipo.id_equipo', $id);
        $this->db->where('componentes.estado', 'AC');
        $this->db->where('marcasequipos.estado', 'AC');
        $this->db->order_by('componentes.descripcion', 'ASC');
    	$query = $this->db->get();
		if($query->num_rows()>0){
            return $query->result_array();
        }
        else{
            return false;
        }
	}

	// Trae periodo de tiempo (dias)
	function getperiodo(){

		$query= $this->db->get_where('periodo');
		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
	}

	// Trae herramientas por empresa logueada - Listo
	function getherramienta(){

		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 

		$query= $this->db->get_where('herramientas',array('id_empresa' => $empId));
		if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return false;
        }
	}

	function getHerramientasB()
	{
		$userdata = $this->session->userdata('user_data');
		$empId = $userdata[0]['id_empresa']; 
		$this->db->select('herramientas.herrId AS value, 
				herramientas.herrcodigo AS codigo,
				herramientas.herrmarca AS marca,
				herramientas.herrdescrip AS label');
		$this->db->from('herramientas');      
		$this->db->where('herramientas.id_empresa', $empId);
		//$this->db->where('herramientas.estado !=', 'AN');
		$this->db->order_by('label', 'ASC');
		$query = $this->db->get();

		if($query->num_rows()>0){
				return $query->result_array();
		}
		else{
				return false;
		}
	}

	//Trae insumos (articles) por empresa logueada
	function getinsumo(){
		$userdata = $this->session->userdata('user_data');
			$empId = $userdata[0]['id_empresa'];
			$this->db->select('articles.artId AS value, 
												articles.artBarCode AS codigo,
												articles.artDescription AS label');
			$this->db->from('articles');      
			$this->db->where('articles.id_empresa', $empId);
			$this->db->where('articles.artEstado !=', 'AN');
			$this->db->order_by('label', 'ASC');
			$query = $this->db->get();		
		if($query->num_rows()>0){
			return $query->result();
		}
		else{
			return false;
		}
	}

	//Trae insumo por id
	function traerinsumo($data = null){
		$id = $data['id_insumo'];
		$userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 

        $this->db->select('articles.*');
    	$this->db->from('articles');    	
    	$this->db->where('articles.artId', $id);    	
    	$this->db->where('articles.id_empresa', $empId);

    	$query= $this->db->get();
    	if($query->num_rows()>0){
                return $query->result();
       	}
        else{
                return false;
        }	
	}

	// Guarda Preventivo 
	function insert_preventivo($data)
    {  
        $query = $this->db->insert("preventivo",$data); 
	    return $query;	   
    }

    // Guarda el bacht de datos de herramientas de Preventivo - Listo
	function insertPrevHerram($data2){
		
        $query = $this->db->insert_batch("tbl_preventivoherramientas",$data2);
        return $query;
    }

    // Guarda insumos del Preventivo - Listo 
    function insertPrevInsum($data3){

        $query = $this->db->insert_batch("tbl_preventivoinsumos",$data3);
        return $query;
    }

    // Guarda el nombre de adjunto
    function updateAdjunto($adjunto,$ultimoId){
        $this->db->where('prevId', $ultimoId);
        $query = $this->db->update("preventivo",$adjunto);
        return $adjunto;
    }

    // Da de baja Preventivvo por id
    public function update_preventivo($data, $idprev){
        $this->db->where('prevId', $idprev);
        $query = $this->db->update("preventivo",$data);
        return $query;
    }
    

    //////////////////////////edicion  datos    

    // Trae info de Preventivo a Editar - Listo
    function getInfoPreventivo($id){
        
        $this->db->select('preventivo.prevId, 
                            preventivo.perido, 
                            preventivo.cantidad, 
                            preventivo.ultimo, 
                            preventivo.critico1, 
                            preventivo.estadoprev, 
                            preventivo.horash, 
                            preventivo.prev_duracion,
                            preventivo.prev_canth,
                            preventivo.prev_adjunto,
                            preventivo.id_unidad,
                            equipos.id_equipo, 
                            equipos.codigo, 
                            equipos.marca, 
                            equipos.fecha_ingreso, 
                            equipos.descripcion, 
                            equipos.ubicacion, 
                            componentes.id_componente, 
                            componentes.descripcion AS comp, 
                            tareas.id_tarea, 
                            tareas.descripcion AS descripta');
        $this->db->from('preventivo');
        $this->db->join('equipos', 'equipos.id_equipo=preventivo.id_equipo');
        $this->db->join('tareas', 'tareas.id_tarea=preventivo.id_tarea');
        $this->db->join('componentes', 'componentes.id_componente=preventivo.id_componente');       
        $this->db->where('preventivo.prevId', $id);

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
    function getPreventivoHerramientas($id){
        
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 

        $this->db->select('tbl_preventivoherramientas.cantidad,
                            herramientas.herrcodigo,
                            herramientas.herrmarca,
                            herramientas.herrdescrip,
                            herramientas.herrId');
        $this->db->from('tbl_preventivoherramientas');
        $this->db->join('herramientas', 'herramientas.herrId = tbl_preventivoherramientas.herrId');   
        $this->db->where('tbl_preventivoherramientas.prevId', $id);        
        $this->db->where('tbl_preventivoherramientas.id_empresa', $empId);
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
    function getPreventivoInsumos($id){
        
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa']; 

        $this->db->select('tbl_preventivoinsumos.id,
                            tbl_preventivoinsumos.cantidad,
                            articles.artBarCode,
                            articles.artId,
                            articles.artDescription,
                            articles.id_empresa');                            
        $this->db->from('tbl_preventivoinsumos');
        $this->db->join('articles', 'articles.artId = tbl_preventivoinsumos.artId');   
        $this->db->where('tbl_preventivoinsumos.prevId', $id);        
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

    // Guarda edicion de Preventivo 
    function update_editar($data, $idp){
        // echo "id preventivo: ";
        // var_dump($idp);
     //echo "datosven modelo: ";
        //var_dump($data);
        $this->db->where('prevId', $idp);
        $query = $this->db->update("preventivo",$data);
        return $query;
    }

    // Update herramientas preventivo
    function deleteHerramPrev($id_preventivo){        
        $this->db->where('prevId', $id_preventivo);
        $query = $this->db->delete('tbl_preventivoherramientas');
        return $query;
    }

    function deleteInsumPrev($id_preventivo){
        $this->db->where('prevId', $id_preventivo);
        $query = $this->db->delete('tbl_preventivoinsumos');
        return $query;
    }

	










///////////////////
    function getProductos (){
  	 	$query = $this->db->query("SELECT `herrId`,`herrcodigo`, `herrmarca`, `equip_est` FROM `herramientas`");
     	$i=0;
	    foreach ($query->result() as $row)
	    {
	        $productos[$i]['label'] = $row->herrcodigo;
	        $productos[$i]['value'] = $row->herrmarca;
	        $productos[$i]['id_herr'] = $row->herrId;
	        $i = $i++;
	    }
	    return $productos;
    }

    function getdatos($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{

			$idh = $data['id_herramienta'];

			//Datos del usuario
			$query= $this->db->get_where('herramientas',array('herrId'=>$idh));
			if($query->num_rows()>0){
                return $query->result();
            }
            else{
                return false;
            }

		}
	}

	function insumo($data = null){
		
		if($data == null)
		{
			return false;
		}
		else
		{

			$id_insumo = $data['artId'];

			//Datos del usuario
			$query= $this->db->get_where('herramientas',array('artId'=>$id_insumo));
			if($query->num_rows()>0){
                return $query->result();
            }
            else{
                return false;
            }

		}
	}

	/*function traerinsumo($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id_insumo'];
			Datos del usuario
			$query= $this->db->get_where('articles',array('artId'=>$id));
			if($query->num_rows()>0){
                return $query->result();
            }
            else{
                return false;
            }
		}
	}*/



	public function agregar_componente($data){

        $query = $this->db->insert("componentes",$data);
    	return $query;
    }

    /*public function insert_preventivo($data)
    {
        $query = $this->db->insert("preventivo",$data);
        return $query;
    }*/

	public function insert_preventivoherramientas($data2)
    {
        $query = $this->db->insert("tbl_preventivoherramientas",$data2);
        return $query;
    }

    public function insert_preventivoinsumos($data3)
    {
        $query = $this->db->insert("tbl_preventivoinsumos",$data3);
        return $query;
    }

    public function agregar_insumo($data){

        $query = $this->db->insert("articles",$data);
    	return $query;
    }

    public function insert_herramienta($data){
        $query = $this->db->insert("herramientas",$data);
        return $query;
    }

    function get_pedido($id){

		$query= "SELECT *
				 FROM herramientas
				 WHERE id_herramienta=$id";

        $result = $this->db->query($query);
		if($result->num_rows()>0){
            return $result->result_array();
        }
        else{
            return false;
        }

	}

    function geteditar($id){
	    $sql="SELECT preventivo.prevId, preventivo.perido, preventivo.cantidad, preventivo.ultimo, preventivo.critico1, preventivo.estadoprev, preventivo.horash, equipos.id_equipo, equipos.codigo, equipos.marca, equipos.fecha_ingreso, equipos.descripcion, equipos.ubicacion, componentes.id_componente, componentes.descripcion AS comp, tareas.id_tarea, tareas.descripcion AS descripta
	    	  FROM preventivo
	    	  JOIN equipos ON equipos.id_equipo=preventivo.id_equipo
	    	  JOIN tareas ON tareas.id_tarea=preventivo.id_tarea
	    	  JOIN componentes ON componentes.id_componente=preventivo.id_componente
	    	  WHERE prevId=$id
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

	/*function getpreventivoherramientas($id){
	    $sql= "SELECT *
	    		FROM tbl_preventivoherramientas
    			JOIN herramientas ON herramientas.herrId = tbl_preventivoherramientas.herrId
				WHERE tbl_preventivoherramientas.prevId=$id
					";

	    $query= $this->db->query($sql);

	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();
	    }
	    else {
	      return 0;
	    }
	}*/

	/*function getpreventivoinsumos($id){

	    $sql= "SELECT *
	    		from tbl_preventivoinsumos
    			JOIN articles ON articles.artId = tbl_preventivoinsumos.artId
				WHERE tbl_preventivoinsumos.prevId=$id
					";

	    $query= $this->db->query($sql);

	    if( $query->num_rows() > 0)
	    {
	      return $query->result_array();
	    }
	    else {
	      return 0;
	    }
	}*/

	/*public function update_preventivo($data, $idprev){
        $this->db->where('prevId', $idprev);
        $query = $this->db->update("preventivo",$data);
        return $query;
    }

	public function update_editar($data, $idp){
	    $this->db->where('prevId', $idp);
	    $query = $this->db->update("preventivo",$data);
	    return $query;
	}

	public function editar_preventivoherramientas($data, $data4){
	    $this->db->where('herrId', $data4);
	    $query = $this->db->update("tbl_preventivoherramientas",$data);
	    return $query;
	}*/

	public function editar_preventivoinsumos($data, $data5){
	    $this->db->where('artId', $data5);
	    $query = $this->db->update("tbl_preventivoinsumos",$data);
	    return $query;
	}


    /**
     * Trae listado de equipos que tengan mantenimiento preventivo por horas
     *
     * @return  Array   Vuleca la variable o no devuelve nada
     */
    function getPreventivosPorHora()
    {
        $this->db->select('equipos.codigo, equipos.descripcion, equipos.id_equipo, equipos.ultima_lectura, sector.descripcion as descripSector, preventivo.estadoprev, preventivo.prevId, preventivo.cantidad, preventivo.critico1');
        $this->db->from('preventivo');
        $this->db->join('equipos', 'equipos.id_equipo = preventivo.id_equipo', 'inner');
        $this->db->join('sector', 'sector.id_sector = equipos.id_sector', 'inner');
        $this->db->where('preventivo.perido', 'Horas');
        $this->db->where('equipos.estado', 'AC');

        $query= $this->db->get();

        if ($query->num_rows() > 0)
        {
            $preventivos  = $query->result_array();
            $data['data'] = $this->revisaEstadoPreventivosPorHoras( $preventivos );
            //$data['data'] = $query->result_array();

            return  $data;
        }
        else
        {
            return false;
        }
    }

    // bucle que recorra preventivos
    //      con id_equipo traigo historial_lecturas ->ultima lectura
    //      hago cuenta
    //      si es necesario llamo funcion que cambia estado de preventivo
    //      cambio $preventivos[estadoprev]
    // cierro bucle
    // devuelvo $preventivos
    function revisaEstadoPreventivosPorHoras( $preventivos )
    {
        $cantPreventivos = sizeof( $preventivos );
        for ($i=0; $i<$cantPreventivos; $i++)
        {
            $lecturaActual = $this->getLecturaActual( $preventivos[$i]['id_equipo'] );
            //dump( $lecturaActual, 'Lectura Actual' );
            //dump( $preventivos[$i]['ultima_lectura'], 'Ultima lectura' );
            //dump( $preventivos[$i]['cantidad'], 'cantidad' );
            //dump( $preventivos[$i]['critico1'], 'critico' );


            //1er caso: lecturaactual - ultimalectura >= cantidad  => estado vencido
            if (($lecturaActual - $preventivos[$i]['ultima_lectura']) >= $preventivos[$i]['cantidad'])
            {
                if ($preventivos[$i]['estadoprev'] != 'VE')
                {
                    $this->cambiaEstadoPreventivo( $preventivos[$i]['prevId'], 'VE' );
                    $preventivos[$i]['estadoprev'] = 'VE';
                }
            }

            //2do caso: lecturaactual - ultimalectura < cantidad  => estado en curso
            if (($lecturaActual - $preventivos[$i]['ultima_lectura']) < $preventivos[$i]['cantidad'])
            {
                //3er caso: > cantidad => estado critico
                if (($lecturaActual - $preventivos[$i]['ultima_lectura']) > $preventivos[$i]['cantidad'])
                {
                    if ($preventivos[$i]['estadoprev'] != 'CR')
                    {
                        $this->cambiaEstadoPreventivo( $preventivos[$i]['prevId'], 'CR' );
                        $preventivos[$i]['estadoprev'] = 'CR';
                    }
                }
                else // si no es critico => esta en curso
                {
                    if ($preventivos[$i]['estadoprev'] != 'C')
                    {
                        $this->cambiaEstadoPreventivo( $preventivos[$i]['prevId'], 'C' );
                        $preventivos[$i]['estadoprev'] = 'C';
                    }
                }
            }
        }
        return $preventivos;
    }

    /**
     * Devuelve la ultima lectura de un equipo determinado
     *
     * @param   String  $id_equipo  Equipo que se quiere saber la ultima lectura
     * @return  Int     Última lectura
     */
    function getLecturaActual( $id_equipo )
    {
        $this->db->select('lectura');
        $this->db->from('historial_lecturas');
        $this->db->where('id_equipo', $id_equipo);
        $this->db->order_by('id_lectura', 'desc');
        $this->db->limit(1);

        $query= $this->db->get();

        if ($query->num_rows() > 0)
        {
            $data  = $query->result_array();
            return  (int)$data[0]['lectura'];
        }
        else
        {
            return false;
        }
    }

    /**
     * Cambia el campo Estado de la tabla preventivo
     *
     * @param   String  $idPreventivo   Id del preventivo a modificar
     * @param   String  $estado         Valor del nuevo estado
     * @return  bool                    Cambio correcto o incorrecto
     */
    function cambiaEstadoPreventivo( $idPreventivo, $estado )
    {
        $this->db->trans_start();   // inicio transaccion

            $data = array(
                   'estadoprev' => $estado
                );
            $this->db->where('prevId', $idPreventivo);
            $this->db->update('preventivo', $data);

        $this->db->trans_complete(); //fin transaccion

        if ($this->db->trans_status() === FALSE)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    function getpreventivos($idpe,$ideq){

		$sql="SELECT *
	    	  FROM preventivo
	    	  
	    	  WHERE prevId=$idpe AND id_equipo=$ideq AND estadoprev='C'
	    	  ";
	    
	    $query= $this->db->query($sql);

		if($query->num_rows()>0){
		    return $query->result();
		}
		else{
		    return false;
		    }	

	}
	  	function insert_preventivoorden($data)
    {
        $query = $this->db->insert("orden_trabajo",$data);
        return $query;
    }



    /**
     * Preventivos:eliminarAdjunto
     * Elimina el Archivo Adjunto de un preventivo dado (no elimina el archivo).
     *
     * @param Int       $idPreventivo   Id de preventivo
     * @return Bool                     True o False
     */
    public function eliminarAdjunto($idPreventivo)
    {
        $data  = array( 'prev_adjunto' => '' );
        $this->db->where('prevId', $idPreventivo);
        $query = $this->db->update("preventivo", $data);
        return $query;
    }
    
}
