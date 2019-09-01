<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Kpis extends CI_Model
{
    public function __construct()
    {
        parent:: __construct();
    }

    public function getHistorialLecturas($id, $fi, $ff)
    {
        $this->db->where('fecha >=', $fi);
        $this->db->where('fecha <=', $ff);
        $this->db->where('id_equipo', $id);
        $this->db->order_by('fecha', 'asc');
        return $this->db->get('historial_lecturas')->result();
    }

    public function getEquipos($id = false)
    {
        $userdata = $this->session->userdata('user_data');
        $empId = $userdata[0]['id_empresa'];     // guarda usuario logueado

        $this->db->select('equipos.id_equipo, meta_disponibilidad as meta_dsp');
        $this->db->from('historial_lecturas');
        $this->db->join('equipos', 'equipos.id_equipo = historial_lecturas.id_equipo');
        $this->db->join('grupo', 'grupo.id_grupo=equipos.id_grupo');
        $this->db->join('sector', 'sector.id_sector=equipos.id_sector');
        $this->db->join('empresas', 'empresas.id_empresa=equipos.id_empresa');
        $this->db->join('unidad_industrial', 'unidad_industrial.id_unidad=equipos.id_unidad');
        $this->db->join('criticidad', 'criticidad.id_criti=equipos.id_criticidad');
        $this->db->join('area', 'area.id_area=equipos.id_area');
        $this->db->join('proceso', 'proceso.id_proceso=equipos.id_proceso');
        $this->db->join('admcustomers', 'admcustomers.cliId=equipos.id_customer');
        $this->db->where('equipos.estado !=', 'AN');
        $this->db->where('equipos.id_empresa', $empId);

        if($id) $this->db->where('equipos.id_equipo', $id);
        
        $this->db->order_by('equipos.id_equipo', 'ASC');
        $this->db->group_by('equipos.id_equipo');

        return $this->db->get()->result();
    }
}
