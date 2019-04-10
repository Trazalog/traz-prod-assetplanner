<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Forms extends CI_Model
{
	public function __construct(){
		parent::__construct();
	}

	// Trae configuracion de form inicial para guardar en frm_frm_completados
	function getFormInicial(){
		$sql = "SELECT	
				form.form_id AS FORM_ID,
				form.nombre AS FORM_NOMBRE,
				form.fec_creacion AS FEC_CREACION,
				cate.NOMBRE AS CATE_NOMBRE,						
				grup.NOMBRE AS GRUP_NOMBRE,
				tida.NOMBRE AS TIDA_NOMBRE,						
				valo.NOMBRE AS VALO_NOMBRE,						
				valo.ORDEN										
				FROM
				frm_formularios form, 
				frm_categorias cate, 
				frm_grupos grup ,  
				frm_tipos_dato tida,
				frm_valores valo
				where FORM.FORM_ID = CATE.FORM_ID 
				AND CATE.CATE_ID = GRUP.CATE_ID 
				AND GRUP.GRUP_ID = VALO.GRUP_ID 
				AND TIDA.TIDA_ID = VALO.TIDA_ID						
				ORDER BY cate.ORDEN,grup.ORDEN,valo.ORDEN";

		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
	}

	// Guarda la configuracion inicial del formulario
	function setFormInicial(){

		$userdata = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId'];     // guarda usuario logueado
        $i=0;
        $dat= array();

        // Trae la info del form sin valores validos desp se actualiza al guardar        
        $form = $this->getFormInicial();

        // Agrego id de usuario al array para insertar
        foreach ($form as $key) {

        	$key['USUARIO'] = $usrId;        	
        	$i++;
        	$dat[$i] =  $key;
        }

        $response = $this->db->insert_batch('frm_formularios_completados', $dat);       
	}

	// Trae form asoc a id de tarea
	function getFormTarea($id_tarea){
		
		$this->db->select('tareas.form_asoc');
		$this->db->from('tareas');		
		$this->db->where('tareas.id_tarea', $id_tarea);
		
		$query = $this->db->get();

		if ($query->num_rows()!=0){
	 		return $query->result();	
	 	}else{	
	 		return false;
	 	}
	}

	// Trae form para dibujar pantalla (agregar where de id de form)
	function get_form($id_tarea = null){
		
		$idForm = $this->getFormTarea($id_tarea);

		// para buscar buscar por id de form agregar:
		//AND form.form_id = $idForm


		$sql = "SELECT	form.form_id,
						form.nombre,
						form.habilitado,
						form.fec_creacion,
						cate.NOMBRE AS nomCategoria,
						cate.CATE_ID AS idCategoria,
						grup.NOMBRE AS nomGrupo,
						tida.NOMBRE AS nomTipoDatos,
						grup.GRUP_ID AS idGrupo,
						valo.NOMBRE AS nomValor,
						valo.VALO_ID AS idValor,	
						valo.VALOR_DEFECTO,
						valo.LONGITUD,
						valo.OBLIGATORIO,
						valo.PISTA						
						FROM
						frm_formularios form, 
						frm_categorias cate, 
						frm_grupos grup ,  
						frm_tipos_dato tida,
						frm_valores valo
						where FORM.FORM_ID = CATE.FORM_ID 
						AND CATE.CATE_ID = GRUP.CATE_ID 
						AND GRUP.GRUP_ID = VALO.GRUP_ID 
						AND TIDA.TIDA_ID = VALO.TIDA_ID	

						

						ORDER BY cate.ORDEN,grup.ORDEN,valo.ORDEN";
						//ORDER BY idCategoria,nomGrupo,VALO_ID";	

		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }
	}

	// Trae valores validos por ID de formularios
	function getValValidos($idForm){
		
		$sql = "SELECT
				frm_grupos.GRUP_ID,
				frm_valores.NOMBRE,
				frm_valores.VALO_ID As idValor,
				frm_valores_validos.VALOR,
				frm_valores_validos.VAPO_ID As idvalvalido
				FROM
				frm_valores_validos
				INNER JOIN frm_valores ON frm_valores_validos.VALO_ID = frm_valores.VALO_ID
				INNER JOIN frm_grupos ON frm_valores.GRUP_ID = frm_grupos.GRUP_ID
				INNER JOIN frm_categorias ON frm_grupos.CATE_ID = frm_categorias.CATE_ID

				WHERE frm_categorias.FORM_ID = $idForm";

		$query= $this->db->query($sql);

		if($query->num_rows()>0){
	    	return $query->result_array();
	    }
	    else{
	    	return false;
	    }				
	}


	// borra datso de form anterior
	function deleteFormComp($id_listarea){
		$response = $this->db->delete('frm_formularios_completados', array('LITA_ID' => $id_listarea));
		return $response;
	}

	// Inserta datos de Form en frm_formularios_completados
	function setForm($datos){
		

		
		
		//$response = 
		$this->db->insert('frm_formularios_completados', $datos);

		return $response;
	}

	// Arma array p/ insertar en frm_formularios_completados por ID de Valor
	function getDatos($idValor){

		$sql ="SELECT
				frm_formularios.form_id AS FORM_ID,
				frm_formularios.nombre AS FORM_NOMBRE,
				frm_categorias.NOMBRE AS CATE_NOMBRE,
				frm_grupos.NOMBRE AS GRUP_NOMBRE,
				frm_valores.NOMBRE VALO_NOMBRE,
				frm_tipos_dato.NOMBRE AS TIDA_NOMBRE,
				frm_valores_validos.VALOR As VALOR
				FROM
				frm_formularios
				INNER JOIN frm_categorias ON frm_categorias.FORM_ID = frm_formularios.form_id
				INNER JOIN frm_grupos ON frm_grupos.CATE_ID = frm_categorias.CATE_ID
				INNER JOIN frm_valores ON frm_valores.GRUP_ID = frm_grupos.GRUP_ID
				INNER JOIN frm_tipos_dato ON frm_valores.TIDA_ID = frm_tipos_dato.TIDA_ID
				INNER JOIN frm_valores_validos ON frm_valores_validos.VALO_ID = frm_valores.VALO_ID
				WHERE
				frm_valores.VALO_ID = $idValor";

		$query= $this->db->query($sql);

		$response = array();

		foreach ($query->result_array() as $row){
	        $response['FORM_ID'] = $row['FORM_ID'];
	        $response['FORM_NOMBRE'] = $row['FORM_NOMBRE'];
	        $response['CATE_NOMBRE'] = $row['CATE_NOMBRE'];
	        $response['GRUP_NOMBRE'] = $row['GRUP_NOMBRE'];
	        $response['VALO_NOMBRE'] = $row['VALO_NOMBRE'];
	        $response['TIDA_NOMBRE'] = $row['TIDA_NOMBRE'];
	        $response['VALOR'] = $row['VALOR'];
		}

		return $response;
	    					
	}

}	
