<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Sucursales Class
 * Clase para el manejo de sucursales
 * que extiende de la clase CI_Model.
 */
class Sucursales extends CI_Model {

    /**
     * Clase constructora
     * Método constructor de la clase Sucursales.
     *
     * @return  void
     */
    function __construct()
    {
        parent::__construct();
    }

    /**
     * Sucursales::index()
     *
     * Trae el listado de sucursales de la base de datos.
     *
     * @return  Array|false     Listado de sucursales.
     */
    function sucursalesList() // Ok
    {
        $userdata  = $this->session->userdata('user_data');
        $empresaId = $userdata[0]['id_empresa'];
        $query     = $this->db->get_where('sucursal', array('id_empresa' => $empresaId, 'estado' => 'AC'));

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
    function agregarSucursal($data)
    {
        $userdata           = $this->session->userdata('user_data');
        $data['id_empresa'] = $userdata[0]['id_empresa']; 
        $data['estado']     = 'AC';
        $result = $this->db->insert('sucursal', $data);
        return $result;
    }

    /**
     *
     */
    function update_editar($data, $idSucursal)
    {
        $this->db->where('id_sucursal', $idSucursal);
        $query = $this->db->update("sucursal",$data);
        return $query;
    }

    /**
     * Sucursales::bajaUnidadMedida()
     *
     * Elimina (pone estado anulado) unidad de medida.
     *
     * @param   Int     $idUnidadMedida     Id de unidad de medida.
     * @return  Bool                        True si se anuló la unidad de medida, false si hubo error.
     */
    function bajaSucursal($idSucursal) // Ok
    {
        //dump_exit($idSucursal);
        $update = array('estado' => 'AN' );
        $this->db->where('id_sucursal', $idSucursal);
        $query = $this->db->update("sucursal", $update);
        return $query;
    }

}