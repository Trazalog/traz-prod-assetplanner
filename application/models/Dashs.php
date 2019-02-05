<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashs extends CI_Model
{

	function getcobrador($data = null)
	{

        $data = array();

        $this->db->select('Count(solicitud_reparacion.id_solicitud) as cant');
        $this->db->from('solicitud_reparacion');
        $this->db->group_by('solicitud_reparacion.estado');
        $this->db->having('solicitud_reparacion.estado  ','C');
        $query = $this->db->get();

        if ($query->num_rows() != 0)
        {
            $f = $query->result_array();
            $data = $f[0];
        }

        return $data;
    }
//}

    function cambiarDeEmpresa($idNewEmpresa)
    {
        $userdata  = $this->session->userdata('user_data');
        $usrId = $userdata[0]['usrId'];

        //pongo en 0 todos los tipos, del usuario actual
        $this->db->set('usuarioasempresa.tipo', 0);
        $this->db->where('usuarioasempresa.usrId', $usrId);
        $this->db->update('usuarioasempresa');
        
        //pongo en 1 el tipo de la nueva empresa
        $this->db->set('usuarioasempresa.tipo', 1);
        $this->db->where('usuarioasempresa.usrId', $usrId);
        $this->db->where('usuarioasempresa.empresaid', $idNewEmpresa);
        $this->db->update('usuarioasempresa');

        //actualizo datos de sesion
        $this->db->select('usuarioasempresa.grpId, empresas.id_empresa, empresas.descripcion,');
        $this->db->from('usuarioasempresa');
        $this->db->join('empresas', 'empresas.id_empresa = usuarioasempresa.empresaid');
        $this->db->where('usuarioasempresa.usrId', $usrId);
        $this->db->where('usuarioasempresa.empresaid', $idNewEmpresa);
        $query = $this->db->get();
        
        $userdata  = $this->session->userdata('user_data');
        foreach ($query->result() as $row)
        {   
            $userdata[0]['grpId']       = $row->grpId;
            $userdata[0]['id_empresa']  = $row->id_empresa;
            $userdata[0]['descripcion'] = $row->descripcion;
        }
        $this->session->set_userdata('user_data', $userdata);
        //dump_exit($userdata);


        //$this->session->set_userdata('name', $fullname);
        //$this->session->set_userdata('name', $fullname);
        //if($this->db->affected_rows() >=0)
        //{
            return true;
        //}
        //else
        //{
        //    return false;
        //}
    }

}
