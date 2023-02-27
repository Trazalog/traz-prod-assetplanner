<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Sucursal Class
 * Clase para el manejo de sucursales, y el menú del sistema
 * que extiende de la clase CI_Controller.
 */
class Sucursal extends CI_Controller {

    /**
     * Clase constructora
     * Método constructor de la clase sucursales.
     *
     * @return  void
     */
    function __construct()
    {
        parent::__construct();
        $this->load->model('Sucursales');
    }

    /**
     * Sucursal::index()
     *
     * Llama y carga la vista del listado de unidades de medida.
     */
    public function index($permission) // Ok
    {
        $data = $this->session->userdata();
		log_message('DEBUG','#Main/index | Sucursal >> data '.json_encode($data)." ||| ". $data['user_data'][0]['usrName'] ." ||| ".empty($data['user_data'][0]['usrName']));

		if(empty($data['user_data'][0]['usrName'])){
			log_message('DEBUG','#Main/index | Cerrar Sesion >> '.base_url());
			$var = array('user_data' => null,'username' => null,'email' => null, 'logged_in' => false);
			$this->session->set_userdata($var);
			$this->session->unset_userdata(null);
			$this->session->sess_destroy();

			echo ("<script>location.href='login'</script>");

		}else{
            $data['list']       = $this->Sucursales->sucursalesList();
            $data['permission'] = $permission;
            $this->load->view('sucursales/list', $data);
        }
    }

    /**
     *
     */
    public function agregarSucursal() //
    {
        $descripcion = $this->input->post('descripcion');
        $direccion   = $this->input->post('direccion');
        $zona        = $this->input->post('zona');
        $telefono    = $this->input->post('telefono');
        $datos = array(
            'descripc' => $descripcion,
            'dire'     => $direccion,
            'zonas'    => $zona,
            'telefono' => $telefono
        );
        $result['sucursal'] = $this->Sucursales->agregarSucursal($datos);
        echo json_encode($result);
    }

    /**
     *
     */
    public function editarSucursal()
    {
        $datos  = $this->input->post('parametros');
        $id     = $this->input->post('idsucursal');
        $result = $this->Sucursales->update_editar($datos,$id);
        return true;
    }

    /**
     * Sucursales::index()
     *
     * Da de baja (pone estado AN) a la unidad de medida.
     *
     * @return  String  json con true o false segun si se anulo la UM o no.
     */
    public function bajaSucursal() // Ok
    {
        $id = $this->input->post('idSucursal');
        //dump_exit($id);
        $result['isOk']     = $this->Sucursales->bajaSucursal($id);
        $result['sucursal'] = $this->Sucursales->sucursalesList();
        echo json_encode($result);  
    }
}