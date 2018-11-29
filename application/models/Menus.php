<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * menuModel Class
 * Clase para el manejo del menú del sistema,
 * que extiende de la clase MY_Model.
 */
class Menus extends CI_Model {

	/**
	 * __construct()
	 * Método constructor de la clase menuModel.
	 *
	 * @return	void
	 */
	function __construct()
	{
		parent::__construct();
	}

	// --------------------------------------------------------------------

	/**
	 * Database Loader
	 *
	 * @param	array	$data	Whether to enable Query Builder
	 *
	 * @return	array
	 */
	function getMenu($data = null)
	{
		$userdata  = $this->session->userdata('user_data');
		$empresaId = $userdata[0]['id_empresa'];
		$query     = $this->db->get('sismenu');
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
