<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Sistema Class
 * Clase para el manejo de Sistemaes, y el menú del sistema
 * que extiende de la clase CI_Controller.
 */
class SistemaABM extends CI_Controller {

    /**
     * Clase constructora
     * Método constructor de la clase Sistemaes.
     *
     * @return  void
     */
    function __construct()
    {
        parent::__construct();
        $this->load->model('SistemasABM');
    }

    /**
     * Sistema::index()
     *
     * Llama y carga la vista del listado sistemas de componentes.
     */
    public function index($permission) // Ok
    {
        $data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Componente >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();

			echo ("<script>location.href='login'</script>");

		}else{
            $data['list']       = $this->SistemasABM->sistemaList();
            $data['permission'] = $permission;
            $this->load->view('sistemas/list', $data);
        }
    }

    /**
     *
     */
    public function agregarSistema() // Ok
    {
        $descripcion = $this->input->post('descripcion');
        $datos = array(
            'descripcion' => $descripcion,
        );
        $result['sistema'] = $this->SistemasABM->agregarSistema($datos);
        echo json_encode($result);
    }

    /**
     *
     */
    public function editarSistema() // Ok
    {
        $datos  = $this->input->post('parametros');
        $id     = $this->input->post('idsistema');
        $result = $this->SistemasABM->update_editar($datos,$id);
        return true;
    }

    /**
     * Sistemaes::index()
     *
     * Da de baja (pone estado AN) a la unidad de medida.
     *
     * @return  String  json con true o false segun si se anulo la UM o no.
     */
    public function bajaSistema() // Ok
    {
        $id = $this->input->post('idsistema');
        //dump_exit($id);
        $result['isOk']     = $this->SistemasABM->bajaSistema($id);
        $result['sistema'] = $this->SistemasABM->SistemaList();
        echo json_encode($result);  
    }
}