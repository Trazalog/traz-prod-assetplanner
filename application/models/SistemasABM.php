<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Sistemas Class
 * Clase para el manejo de Sistemas
 * que extiende de la clase CI_Model.
 */
class SistemasABM extends CI_Model {

    /**
     * Clase constructora
     * Método constructor de la clase Sistemas.
     *
     * @return  void
     */
    function __construct()
    {
        parent::__construct();
    }

    /**
     * Sistemas::index()
     *
     * Trae el listado de Sistemas de la base de datos.
     *
     * @return  Array|false     Listado de Sistemas.
     */
    function sistemaList() // Ok
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $query     = $this->db->get_where('sistema', array('id_empresa' => $empresaId, 'estado' => 'AC'));

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
     * Guarda la sucursal
     */
    function agregarSistema($data) // Ok
    {
        $userdata           = $this->session->userdata('user_data');
        $data['id_empresa'] = $userdata[0]['id_empresa']; 
        $data['estado']     = 'AC';
        $result = $this->db->insert('sistema', $data);
        return $result;
    }

    /**
     *
     */
    function update_editar($data, $idSucursal) // Ok
    {
        $this->db->where('sistemaid', $idSucursal);
        $query = $this->db->update("sistema", $data);
        return $query;
    }

    /**
     * Sistemas::bajaUnidadMedida()
     *
     * Elimina (pone estado anulado) unidad de medida.
     *
     * @param   Int     $idUnidadMedida     Id de unidad de medida.
     * @return  Bool                        True si se anuló la unidad de medida, false si hubo error.
     */
    function bajaSistema($idSistema) // Ok
    {
        //dump_exit($idSucursal);
        $update = array('estado' => 'AN' );
        $this->db->where('sistemaid', $idSistema);
        $query = $this->db->update("sistema", $update);
        return $query;
    }

}