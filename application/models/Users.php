<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	function User_List()
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$query     = $this->db->get_where('sisusers', array('id_empresa' => $empresaId));
		//var_dump($query);
		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		} else {
			return false;
		}
	}

	function getUser($data = null)
	{
		if($data == null) {
			return false;
		} else {
			$action = $data['act'];
			$idUsr = $data['id'];
			$data = array();

			//Datos del usuario
			$query= $this->db->get_where('sisusers',array('usrId'=>$idUsr));
			if ($query->num_rows() != 0) {
				$u = $query->result_array();
				$data['user'] = $u[0];
			} else {
				$user = array();
				$user['usrNick']     = '';
				$user['usrName']     = '';
				$user['usrLastName'] = '';
				$user['usrComision'] = '';
				$user['usrPassword'] = '';
				$user['grpId']       = 1;
				$user['usrimag']     = '';
				$data['user']        = $user;
				$user['id_empresa']  = '';
			}

			//Readonly
			$readonly = false;
			if($action == 'Del' || $action == 'View'){
				$readonly = true;
			}
			$data['read'] = $readonly;

			//Grupos
			$query= $this->db->get('sisgroups');
			if ($query->num_rows() != 0) {
				$data['groups'] = $query->result_array();
			}

			return $data;
		}
	}

	function setUser($data = null)
	{
		//print_r( $data );
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		if($data == null)
		{
			return false;
		} 
		else 
		{
			$id   = $data['id'];
			$act  = $data['act'];
			$usr  = $data['usrNick'];
			$name = $data['usrName'];
			$lnam = $data['usrLastName'];
			$com  = $data['usrComision'];
			$pas  = $data['usrPassword'];
			$grp  = $data['grpId'];
			$img  = $data['usrimag'];

			if($act == 'Edit') {
				if($pas == '') {
					//No modificar la contraseña
					$data = array(
					   'usrNick'     => $usr,
					   'usrName'     => $name,
					   'usrLastName' => $lnam,
					   'usrComision' => $com,
					   'grpId'       => $grp,
					   'usrimag'     => $img,
					   'empresa_id'  => $empresaId
					);
				} else {
					//Modificar la contraseña
					$data = array(
					   'usrNick'     => $usr,
					   'usrName'     => $name,
					   'usrLastName' => $lnam,
					   'usrComision' => $com,
					   'usrPassword' => md5($pas),
					   'grpId'       => $grp,
					   'usrimag'     => $img,
					   'empresa_id'  => $empresaId
					);
				}
			} else {
				$data = array(
					   'usrNick'     => $usr,
					   'usrName'     => $name,
					   'usrLastName' => $lnam,
					   'usrComision' => $com,
					   'usrPassword' => md5($pas),
					   'grpId'       => $grp,
					   'usrimag'     => $img,
					   'empresa_id'  => $empresaId
					);
			}

			switch($act){
				case 'Add':
					//Agregar Usuario
					if($this->db->insert('sisusers', $data) == false) {
						return false;
					}else{
						return true;
					}
					break;

				 case 'Edit':
				 	//Actualizar usuario
				 	if($this->db->update('sisusers', $data, array('usrId'=>$id)) == false) {
				 		return false;
				 	}
				 	break;

				 case 'Del':
				 	//Eliminar usuario
				 	if($this->db->delete('sisusers', array('usrId'=>$id)) == false) {
				 		return false;
				 	}
				 	break;
			}

			return true;

		}
	}

	function sessionStart_($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$usr  = $data['usr'];
			$pas  = md5($data['pas']);
			$this->db->select('sisusers.usrId, sisusers.usrNick, sisusers.usrName, sisusers.usrLastName, sisusers.usrComision, sisusers.usrPassword, sisusers.grpId, sisusers.usrimag, sisusers.id_empresa, 
				empresas.id_empresa, empresas.descripcion');
			$this->db->from('sisusers');
			$this->db->join('empresas', 'sisusers.id_empresa = empresas.id_empresa');
			$this->db->where('sisusers.usrNick', $usr);
			$this->db->where('sisusers.usrPassword', $pas);
			$query = $this->db->get();
			
			if ($query->num_rows() != 0)
			{
				$datosSesionUsuario = $query->result_array();
				$idEmpresa = $datosSesionUsuario[0]['id_empresa'];
				//agrego unidades productivas
				$query = $this->db->get_where('unidad_industrial', array('id_empresa' => $idEmpresa));
				if ($query->num_rows() != 0)
				{
					$datosSesionUsuario[0]['unidad_industrial'] = $query->result_array();
					$this->session->set_userdata('user_data', $datosSesionUsuario);
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		}
	}

}
