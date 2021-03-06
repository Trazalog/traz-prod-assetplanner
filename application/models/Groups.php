	<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * group Class
 * Clase para el manejo de grupos, y el menú del sistema
 * que extiende de la clase CI_Model.
 */
class Groups extends CI_Model {

	/**
	 * Clase constructora
	 * Método constructor de la clase Groups.
	 *
	 * @return	void
	 */
	function __construct()
	{
		parent::__construct();
	}

	/**
     * group::index()
     *
     * Trae el listado de grupos de usuarios de la base de datos.
     *
     * @return	Array|false 	Listado de grupo de usuarios.
     */
	function Group_List()
	{
		$userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
		$query     = $this->db->get_where('sisgroups', array('id_empresa' => $empresaId));

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
	 * Devuelve el controlador del dash, dado un id de grupo de usuario.
	 *
	 * @param  int 		$grpId 	Id del grupo de usuarios.
     * @return array 			Nombre del controlador por defecto del escritorio.
	 */
	function grpDash($grpId)
	{
		$this->db->select('grpDash');
		$this->db->from('sisgroups');
		$this->db->where('grpId', $grpId);

		$query = $this->db->get();

		$row = $query->row();
		if (isset($row))
		{
			return $row->grpDash;
		}
		else
		{
			return false;
		}
	}

	/**
	 * Agrega, Edita o Elimina grupos de usuarios.
	 *
	 * @param  Array 	$data 	Info para realizar acciones.
     * @return bool 			true si serealiza la operacion, false si no se realiza.
	 */
	function setGrupo($data = null)
	{
		if($data == null)
		{
			return false;
		}
		else
		{
			$userdata  = $this->session->userdata('user_data');
			$empresaId = $userdata[0]['id_empresa'];
			$id        = $data['id'];
			$act       = $data['act'];
			$name      = $data['name'];
			$dash      = $data['dash'];
			$options   = $data['options'];
			$data      = array(
				'grpName'    => $name,
				'grpDash'    => $dash,
				'id_empresa' => $empresaId
			);

			switch($act)
			{
				case 'Add':
					//Agregar grupo
					if($this->db->insert('sisgroups', $data) == false)
					{
						return false;
					}
					else
					{
						$id = $this->db->insert_id();
					}

					//Agregar a sisgroupsactions
					foreach ($options as $o)
					{
						$data = array(
						   'grpId'     => $id,
						   'menuAccId' => $o
						);
						if($this->db->insert('sisgroupsactions', $data) == false)
						{
							return false;
						}
					}
					break;

				case 'Edit':
					//Actualizar nombre
					if($this->db->update('sisgroups', $data, array('grpId'=>$id)) == false)
					{
						return false;
					}
					//Eliminar en sisgroupsactions
					if($this->db->delete('sisgroupsactions', array('grpId' => $id)) == false)
					{
						return false;
					}
					//Agregar a sisgroupsactions
					foreach ($options as $o)
					{
						$data = array(
						   'grpId'     => $id,
						   'menuAccId' => $o
						);
						if($this->db->insert('sisgroupsactions', $data) == false)
						{
							return false;
						}
					}
					break;

				case 'Del':
					//Eliminar en sisgroupsactions
					if($this->db->delete('sisgroupsactions', array('grpId' => $id)) == false)
					{
						return false;
					}
					//Eliminar nombre
					if($this->db->delete('sisgroups', $data, array('grpId'=>$id)) == false)
					{
						return false;
					}
					break;
			}
			return true;
		}
	}


	/**
	 *
	 *
	 */
	function traeEmpresas()
	{
		$userdata  = $this->session->userdata('user_data');
		$idUsuario = $userdata[0]['usrId'];
		$this->db->select('empresas.id_empresa, empresas.descripcion, 
			usuarioasempresa.tipo');
		$this->db->from('usuarioasempresa');
		$this->db->join('empresas', 'empresas.id_empresa = usuarioasempresa.empresaid', 'inner');
		$this->db->where('usuarioasempresa.usrId', $idUsuario);
		$this->db->order_by("empresas.descripcion", "asc");

		$query = $this->db->get();
		if ($query->num_rows()!=0)
		{
			$datosEmpresas = $query->result_array();
			//$this->session->set_userdata('enterprise_data', $datosEmpresas);
			return $datosEmpresas;
		}
		else
		{
			return false;
		}
	}


	/**
	 * Trae todos los elementos del menu.
	 *
	 * @return	array 	arreglo con los elementos del menú
	 */
	public function mnuAll()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$userdata  = $this->session->userdata('user_data');
		$grpId     = $userdata[0]['grpId'];
		//$grpId   = 4;
		$query     = $this->db->get("sismenu");
		$all_menu  = $query->result_array();

		$this->db->select('sismenu.*, sisgroups.grpId');
		$this->db->from('sisgroups');
		$this->db->join('sisgroupsactions', 'sisgroupsactions.grpId = sisgroups.grpId', 'inner');
		$this->db->join('sismenuactions', 'sismenuactions.menuAccId = sisgroupsactions.menuAccId', 'inner');
		$this->db->join('sismenu', 'sismenu.id = sismenuactions.menuId', 'inner');
		//$this->db->where('sismenu.id_empresa', $empresaId);
		$this->db->where('sisgroups.grpId', $grpId);
		$this->db->group_by('sismenu.name');
		$this->db->order_by("sismenu.id", "asc");
		$this->db->order_by("sismenu.parent", "asc");

		$query     = $this->db->get();
		$menu      = $query->result_array();
		$main_menu = array();
		foreach ($menu as $m) {
			if($m['parent'] != null){
				if( array_search($m['parent'], array_column($all_menu, 'id')) !== false)
				{
				    $mnuParent = $this->db->get_where("sismenu", array('id' => $m['parent']) )->result_array();
				    //array_push($mnuParent[0], $grpId);
				    $mnuParent[0] += ['grpId' => $grpId];
					$main_menu[] = $mnuParent[0];
				}
			}
			$main_menu[] = $m;

		}
		//dump_exit($main_menu);
		return $main_menu;
	}



	/**
	 * Devuelve el permiso del item de menú.
	 *
	 * @param  int 		$mnuId 	Id del menú.
	 * @return array 	Permisos
	 */
	function mnuPermisos($mnuId, $grpId)
	{
		$this->db->select('sisactions.actDescription');
		$this->db->from('sismenuactions');
		$this->db->join('sisactions', 'sismenuactions.actId = sisactions.actId', 'inner');
		$this->db->join('sisgroupsactions', 'sismenuactions.menuAccId = sisgroupsactions.menuAccId', 'left');
		$this->db->where(array('sismenuactions.menuId' => $mnuId, 'sisgroupsactions.grpId' => $grpId));

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
	 * Devuelve items de menú con sus respectivos permisos.
	 *
	 * @param  array	$data 		Id del grupo y acción.
	 * @return array 				Items del menu con sus permisos
	 */
	function getMenu($data = null)
	{
		if($data == null)
		{
			return false;
		}
		else
		{
			$action = $data['act'];
			$idGrp = $data['id'];


			if($idGrp == 0){
				$name = "";
				$dash = "";
			} else {
				$query= $this->db->get_where('sisgroups',array('grpId'=>$idGrp));
				if ($query->num_rows() != 0) {
					$name = $query->row('grpName');
					$dash = $query->row('grpDash');
				} else {
					$name = "";
					$dash = "";
				}
			}

			$readonly = false;
			if($action == 'Del' || $action == 'View'){
				$readonly = true;
			}
			$menu = array();
			$menu['read'] = $readonly;
			$menu['name'] = $name;
			$menu['dash'] = $dash;
			$menu['list'] = array();

			$query= $this->db->get_where('sismenu',array('parent'=>null));
			if ($query->num_rows() != 0)
			{
				foreach($query->result() as $items)
				{
					//ver si tiene hijos
					$querySon= $this->db->get_where('sismenu',array('parent'=>$items->id));

					if($querySon->num_rows() != 0)
					{
						//Añadir los hijos
						$items->childrens = $querySon->result();
						foreach ($items->childrens as $son) {
							$this->db->select('sismenuactions.*, sisactions.actDescriptionSpanish as actDescription, sisgroupsactions.grpactId');
							$this->db->from('sismenuactions');
							$this->db->join('sisactions', 'sisactions.actId = sismenuactions.actId');
							$this->db->join('sisgroupsactions', ' sismenuactions.menuAccId = sisgroupsactions.menuAccId And sisgroupsactions.grpId = '.$idGrp.'', 'left');
							$this->db->where(array('menuId'=>$son->id));

							$queryActions= $this->db->get();
							$son->actions = $queryActions->result_array();
							$son->childrens = array();
						}
						$items->actions = array();
						$menu['list'][] = $items;
					}
					else
					{
						//Buscar las acciones
						$items->childrens = array();
						$this->db->select('sismenuactions.*, sisactions.actDescriptionSpanish as actDescription, sisgroupsactions.grpactId ');
						$this->db->from('sismenuactions');
						$this->db->join('sisactions', 'sisactions.actId = sismenuactions.actId');
						$this->db->join('sisgroupsactions', ' sismenuactions.menuAccId = sisgroupsactions.menuAccId And sisgroupsactions.grpId = '.$idGrp.'', 'left');
						$this->db->where(array('menuId'=>$items->id));

						$queryActions= $this->db->get();
						$items->actions = $queryActions->result_array();
						$menu['list'][] = $items;
					}

				}

				return $menu;
			}

			return $data;
		}
	}







}
