<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * UnidadMedida Class
 * Clase para el manejo de grupos, y el menú del sistema
 * que extiende de la clase CI_Controller.
 */
class UnidadMedida extends CI_Controller {

    /**
     * Clase constructora
     * Método constructor de la clase UnidadMedidas.
     *
     * @return  void
     */
    function __construct()
    {
        parent::__construct();
        //$this->load->model('UnidadMedidas');
        $this->load->model(ALM.'/Lovs');
    }

    /**
     * UnidadMedidas::index()
     *
     * Llama y carga la vista del listado de unidades de medida.
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
            $data['list']       = $this->Lovs->lista('unidad');
            $data['permission'] = $permission;
            $this->load->view('unidadMedidas/list', $data);
        }
    }

    /**
     *
     */
    public function agregarUnidadMedida() //
    {
        $descripcion = $this->input->post('descripcion');
        $datos       = array( 'descripcion'=>$descripcion, 'tabla'=>'unidad' );
        echo $this->Lovs->crear($datos);
    }

    /**
     *
     */
    public function editarUnidadMedida()
    {
        $data = $this->input->post('parametros');
        $data['tabl_id']  = $this->input->post('idunidadmedida');
        echo  $this->Lovs->modificar($data);
    
    }

    /**
     * UnidadMedidas::index()
     *
     * Da de baja (pone estado AN) a la unidad de medida.
     *
     * @return  String  json con true o false segun si se anulo la UM o no.
     */
    public function bajaUnidadMedida() // Ok
    {
        $id = $this->input->post('idUnidadMedida');
        echo $this->Lovs->eliminar($id); 
    }
}