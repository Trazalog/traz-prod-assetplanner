<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Notificaciones extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
  
    /**
     * guarda y actualiza los token de dispositivos asociados a un usuario
     * @param string;  
     * @return false;true;  en caso de que ya exista el usuario, true en caso de que sea nuevo 
     */
	public function registrarToken($token){

		$userdata  = $this->session->userdata('user_data');
		$usrId     = $userdata[0]['usrId'];
		$empresaId = $userdata[0]['id_empresa'];

		// Verificar si el token ya está asociado al usuario y esta activo 
		$this->db->where('token', $token);
		$this->db->where('activo', '1');
		$this->db->where('id_user', $usrId);
		$query = $this->db->get('user_token');

		//si el usuario tiene el mismo token y esta activo no hago nada
		if ($query->num_rows() > 0) return false;

		// Verificar si existe el usuario pero tiene otro token
		$this->db->where('activo', '1');
		$this->db->where('id_user', $usrId);
		$query = $this->db->get('user_token');

		//si existe pero con otro token actualizo el token que tiene
		if ($query->num_rows() > 0) {
			$data = array(
				'id_empresa' => $empresaId,
				'id_user'    => $usrId,
				'token'      => $token,
				'activo'     => '1',
			);
			$this->db->update ('user_token', $data, array('id_user'=>$usrId));
			return false;
		}

		// Verificar si el token ya está asociado a otro usuario activo
		$this->db->where('token', $token);
		$this->db->where('activo', '1');
		$query = $this->db->get('user_token');

		// Si el token ya está asociado a otro usuario activo, desactivamos ese usuario
		if ($query->num_rows() > 0) {			
			$this->db->set('activo', '0');
			$this->db->where('token', $token);
			$this->db->where('activo', '1');
			$this->db->update('user_token'); 
		}

		// Verificar si el token ya existe en la tabla user_token
		$this->db->where('token', $token);
		$query = $this->db->get('user_token');

		if ($query->num_rows() > 0) {
			// El token ya existe en la tabla
			$row = $query->row();
			$existingUserId = $row->id_user;

			if ($existingUserId != $usrId) {

				//si el usuario y token existen y estan asociados activo ese usuario
				$this->db->where('token', $token);
				$this->db->where('id_user', $usrId);
				$query = $this->db->get('user_token');
				$row = $query->row();
		
				if($query->num_rows() > 0)
				{
					$data = array(
						'id_empresa' => $empresaId,
						'id_user'    => $usrId,
						'token'      => $token,
						'activo'     => '1',
					);
					$this->db->update ('user_token', $data, array('id_user'=>$usrId));
					return false;
				}else{
						// Si el token pertenece a otro usuario, insertamos un nuevo registro
						$data = array(
							'id_empresa' => $empresaId,
							'id_user'    => $usrId,
							'token'      => $token,
							'activo'     => '1',
						);
						$this->db->insert('user_token', $data);
						return true;
				}
				
			} else {
					// Si el token ya está asociado al usuario actual, no se inserta un nuevo registro, se activa usuario 
					$data = array(
						'id_empresa' => $empresaId,
						'id_user'    => $usrId,
						'token'      => $token,
						'activo'     => '1',
					);
					$this->db->update ('user_token', $data, array('id_user'=>$usrId));
					return false;
				}
		} else {
			// Insertar el nuevo token para el usuario actual
			$data = array(
				'id_empresa' => $empresaId,
				'id_user'    => $usrId,
				'token'      => $token,
				'activo'     => '1',
			);
			$this->db->insert('user_token', $data);
			return false;
		}
	}
    
}
