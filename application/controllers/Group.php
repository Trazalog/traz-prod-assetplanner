<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * group Class
 * Clase para el manejo de grupos, y el menú del sistema
 * que extiende de la clase CI_Controller.
 */
class group extends CI_Controller {

	/**
	 * Clase constructora
	 * Método constructor de la clase group.
	 *
	 * @return	void
	 */
	function __construct()
    {
		parent::__construct();
		$this->load->model('Groups');
	}

	/**
     * group::index()
     *
     * Llama y carga la vista del listado de grupos de usuarios.
     */
	public function index($permission)
	{
		$data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Group >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();

			echo ("<script>location.href='login'</script>");

		}else{
			$data['list'] = $this->Groups->Group_List();
			$data['permission'] = $permission;
			$this->load->view('groups/list', $data);
		}
	}

	/**
     * group::getMenu()
     *
     * Llama y muestra el menú.
     */
	public function getMenu()
	{
		$data['data'] = $this->Groups->getMenu($this->input->post());
		$response['html'] = $this->load->view('groups/permission', $data, true);

		echo json_encode($response);
	}

	/**
     * group::setGrupo()
     *
     * Guarda grupo.
     */
	public function setGrupo()
	{
		$data = $this->Groups->setGrupo($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);
		}
	}

}
