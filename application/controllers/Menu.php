<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Menu Class
 * Clase para el manejo del menú del sistema,
 * que extiende de la clase MY_Controller.
 */
class Menu extends CI_Controller {

	/**
	 * Clase constructora
	 * Método constructor de la clase Menú.
	 *
	 * @return	void
	 */
	function __construct()
    {
		parent::__construct();
		$this->load->model('Menus');
	}

	// --------------------------------------------------------------------

	/**
     * Menu::index()
     *
     * Carga la pantalla Menu.
     */
	public function index($permission)
	{
		$data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Menu >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();

			echo ("<script>location.href='login'</script>");

		}else{
			//dump_exit($permission);
			$data['data']       = $this->Menus->getMenu();
			$data['permission'] = $permission;
			$this->load->view('menu/list', $data);
		}
	}

	public function editMenu()
	{
		echo "hola editar menu";
	}

	public function deleteMenu()
	{
		echo "hola eliminar menu";
	}

}
