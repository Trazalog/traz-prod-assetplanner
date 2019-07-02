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

        $this->db->select('sisusers.*');
            $this->db->from('sisusers');
        $this->db->join('usuarioasempresa', 'usuarioasempresa.usrId = sisusers.usrId');
        $this->db->where('usuarioasempresa.empresaid', $empresaId);
        $this->db->where('usuarioasempresa.estado', 'AC');
        
        $query = $this->db->get();
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
			$userdata = $this->session->userdata('user_data');
			$empId    = $userdata[0]['id_empresa'];
			$action   = $data['act'];
			$idUsr    = $data['id'];
			$data     = array();

			//Datos del usuario
			$this->db->select('
				sisusers.*,
				usuarioasempresa.grpId
				');
			$this->db->from('sisusers');
			$this->db->join('usuarioasempresa', 'usuarioasempresa.usrId = sisusers.usrId');
			$this->db->where('usuarioasempresa.empresaid', $empId);
			$this->db->where('usuarioasempresa.usrId', $idUsr);
			$this->db->where('sisusers.usrId', $idUsr);
			$query = $this->db->get();

			if ($query->num_rows() != 0) {
				$u = $query->result_array();
				$data['user'] = $u[0];
			} else {
				$user = array();
				$user['usrNick']     = '';
				$user['usrName']     = '';
				$user['usrLastName'] = '';
				//$user['usrComision'] = '';
				$user['usrPassword'] = '';
				$user['grpId']       = 4;
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
			$query = $this->db->get_where('sisgroups', array('id_empresa' =>$empId));
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
			//$com  = $data['usrComision'];
			$pas  = $data['usrPassword'];
			$grp  = $data['grpId'];
			$img  = $data['usrimag'];

			if($act == 'Edit') {
				if($pas == '') {
					if($img == '') {
						//No modificar la contraseña
						$data = array(
						   'usrNick'     => $usr,
						   'usrName'     => $name,
						   'usrLastName' => $lnam,
						   //'estado'	     => 'AC',
						   //'grpId'       => $grp,
						   //'id_empresa'  => $empresaId
						);
					}
					else {
						$data = array(
						   'usrNick'     => $usr,
						   'usrName'     => $name,
						   'usrLastName' => $lnam,
						   //'usrComision' => $com,
						   //'grpId'       => $grp,
						   'usrimag'     => $img,
						   //'estado'	     => 'AC',
						   //'grpId'       => $grp,
						   //'id_empresa'  => $empresaId
						);
					}
				} else {
					if($img == '') {
					//Modificar la contraseña
						$data = array(
						   'usrNick'     => $usr,
						   'usrName'     => $name,
						   'usrLastName' => $lnam,
						   //'usrComision' => $com,
						   'usrPassword' => md5($pas),
						   //'estado'	     => 'AC',
						   //'grpId'       => $grp,
						   //'usrimag'     => $img,
						   //'id_empresa'  => $empresaId
						);
					} else {
						$data = array(
						   'usrNick'     => $usr,
						   'usrName'     => $name,
						   'usrLastName' => $lnam,
						   //'usrComision' => $com,
						   'usrPassword' => md5($pas),
						   //'grpId'       => $grp,
						   'usrimag'     => $img,
						   //'estado'      => 'AC',
						   //'grpId'       => $grp,
						   //'id_empresa'  => $empresaId
						);
					}
				}
			} else {
				$data = array(
				   'usrNick'     => $usr,
				   'usrName'     => $name,
				   'usrLastName' => $lnam,
				   'usrPassword' => md5($pas),
				   'usrimag'     => $img,
				);
			}


			switch($act){
				case 'Add':
					//Agregar Usuario
					if($this->db->insert('sisusers', $data) == false)
					{
						return false;
					}
					else
					{
						$data2 = array(
							'empresaid' => $empresaId,
							'usrId'     => $this->db->insert_id(),
							'fecha'     => date('Y-m-d H:i:s'),
							'tipo'      => 1,
							'grpId'     => $grp,
							'estado'    => 'AC',
						);
						if($this->db->insert('usuarioasempresa', $data2) == false)
						{
							return false;
						}
					}
					break;

				 case 'Edit':
				 	//Actualizar usuario
				 	if($this->db->update('sisusers', $data, array('usrId'=>$id)) == false)
				 	{
				 		return false;
				 	}
				 	else
				 	{
				 		$data2 = array(
							'empresaid' => $empresaId,
							//'usrId'     => $this->db->insert_id(),
							//'fecha'     => date('Y-m-d H:i:s'),
							//'tipo'      => 0,
							'grpId'     => $grp,
							//'estado'    => 'AC',
						);
				 		if($this->db->update('usuarioasempresa', $data2, array('usrId'=>$id, 'empresaid'=>$empresaId)) == false)
					 	{
					 		return false;
					 	}	
				 	}
				 	break;

				 case 'Del':
				 	//Eliminar usuario
				 	$dataE = array(
						'estado' => 'AN',
					);
				 	if($this->db->update('usuarioasempresa', $dataE, array('usrId'=>$id, 'empresaid'=>$empresaId)) == false) {
				 		return false;
				 	}
				 	break;
			}

			return true;

		}
	}

	function sessionStart_($data = null)
	{

		$this->load->library('BPM');

		if($data == null)
		{
			return false;
		}
		else
		{
			$usr = $data['usr'];
			$pas = md5($data['pas']);

			$this->db->select('
				sisusers.usrId, sisusers.usrNick, sisusers.usrName, sisusers.usrLastName, 
				empresas.id_empresa, empresas.descripcion, 
				usuarioasempresa.grpId, 
				sisusers.usrimag');
			$this->db->from('sisusers');
			$this->db->join('usuarioasempresa', 'usuarioasempresa.usrId = sisusers.usrId');
			$this->db->join('empresas', 'empresas.id_empresa = usuarioasempresa.empresaid');
			$this->db->where('sisusers.usrNick', $usr);
			$this->db->where('sisusers.usrPassword', $pas);
			$this->db->where('usuarioasempresa.tipo', 1); //!HARDCODE
			$query = $this->db->get();
			
			if ($query->num_rows() != 0)
			{
				$datosSesionUsuario = $query->result_array();

				$datosSesionUsuario[0]['userBpm'] = $this->bpm->getUser($datosSesionUsuario[0]["usrNick"]);		

				$this->session->set_userdata('user_data', $datosSesionUsuario);
	 			return true;
			} else {
				return false;
			}
		}
	}

}
