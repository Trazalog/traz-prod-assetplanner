<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
// $this->load->library('BPM');

class Mapas extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    // retorna listado de arboles por id de censo
    //   function listar($cens_id)
    //   {

    //     $parametros["http"]["method"] = "GET";
    //     $parametros["http"]["header"] = "Accept: application/json";
    //     $param = stream_context_create($parametros);

    //     $resource = '/tree_list/censo/';
    //     $url = REST . $resource . $cens_id;
    //     $array = file_get_contents($url, false, $param);

    //     return json_decode($array);
    //   }

    public function getCoordOT()
    {
        $id = 1228;
        // var_dump($id);
        $sql = "SELECT latitud, longitud FROM orden_trabajo WHERE id_orden=1228";
        // var_dump($sql);

        $query = $this->db->query($sql);
        $sql2 = $query->result_array();
        // var_dump($sql2);

        return $sql2[0];
    }

    function Detalles($id)
    {

        // if($id == 1)
        // {
        //     $resource = 'punto1';
        // }
        // if($id == 2)
        // {
        //     $resource = 'punto2';
        // }
        // if($id == 3)
        // {
        //     $resource = 'punto3';
        // }
        // $parametros["http"]["method"] = "GET";		 
        // $param = stream_context_create($parametros); 	
        // $url = REST.$resource;
        // $data= file_get_contents($url, false, $param);
        // return json_decode($data);

        $parametros["http"]["method"] = "GET";
        $parametros["http"]["header"] = "Accept: application/json";
        $param = stream_context_create($parametros);
        //	$resource = '/perfil/local';	 
        //$url = REST.$resource;

        $resource = '/formulario/';
        $url = REST . $resource . $id;

        // $url = 'http://dev-trazalog.com.ar:8280/services/arboladoDS/formulario/1';

        $array = file_get_contents($url, false, $param);


        // $vuelta = json_decode($array);

        //var_dump($array);


        return $array;
    }

    function Imagen($id)
    {
        $parametros["http"]["method"] = "GET";
        $parametros["http"]["header"] = "Accept: application/json";
        $param = stream_context_create($parametros);

        $resource = '/arbol/' . $id . '/imagen';
        $url = REST . $resource;
        $array = file_get_contents($url, false, $param);

        return $array;
    }

    // function getOperarios()
    // {
    //     // $userdata  = $this->session->userdata('user_data');
    //     // $empresaId = $userdata[0]['id_empresa'];
    //     // $this->db->select('tbl_estado.estadoid, tbl_estado.descripcion, orden_trabajo.estado');
    //     // $this->db->join('tbl_estado', 'tbl_estado.estado = orden_trabajo.estado');
    //     // $this->db->from('orden_trabajo');
    //     // $this->db->where('orden_trabajo.id_empresa', $empresaId);
    //     // $this->db->group_by('orden_trabajo.estado');
    //     // $this->db->order_by('tbl_estado.descripcion', 'ASC');
    //     // var_dump($this->BPM->getUser());
    //     // var_dump($this->BPM->getUsuariosBPM());
    //     $query = $this->db->get();
    //     if ($query->num_rows() > 0) {
    //         return $query->result_array();
    //     } else {
    //         return false;
    //     }
    // }
}
