<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * UnidadMedidas Class
 * Clase para el manejo de unidades de medida
 * que extiende de la clase CI_Model.
 */
class UnidadMedidas extends CI_Model {

    /**
     * Clase constructora
     * Método constructor de la clase UnidadMedidas.
     *
     * @return  void
     */
    function __construct()
    {
        parent::__construct();
    }

    /**
     * UnidadMedidas::index()
     *
     * Trae el listado de unidades de medida de la base de datos.
     *
     * @return  Array|false     Listado de unidades de medida.
     */
    function UnidadMedida_List() // Ok
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $query     = $this->db->get_where('tbl_unidadmedida', array('id_empresa' => $empresaId, 'estado' => 'AC'));

        if ($query->num_rows()!=0)
        {
            return $query->result_array();
        }
        else
        {
            return false;
        }
    }

    /**
     * Guarda la unidad de medida
     */
    function agregarUnidadMedida($data)
    {
        $userdata           = $this->session->userdata('user_data');
        $data['id_empresa'] = $userdata[0]['id_empresa']; 
        $data['estado']     = 'AC';

        $result = $this->db->insert('tbl_unidadmedida', $data);
        return $result;
    }

    /**
     *
     */
    function update_editar($data, $id)
    {
        dump($id);
        dump($data);
        $this->db->where('id_unidadmedida', $id);
        $query = $this->db->update("tbl_unidadmedida",$data);
        return $query;
    }

    /**
     * UnidadMedidas::bajaUnidadMedida()
     *
     * Elimina (pone estado anulado) unidad de medida.
     *
     * @param   Int     $idUnidadMedida     Id de unidad de medida.
     * @return  Bool                        True si se anuló la unidad de medida, false si hubo error.
     */
    function bajaUnidadMedida($idUnidadMedida) // Ok
    {
        $update = array('estado' => 'AN' );
        $this->db->where('id_unidadmedida', $idUnidadMedida);
        $query = $this->db->update("tbl_unidadmedida", $update);
        return $query;
    }

}