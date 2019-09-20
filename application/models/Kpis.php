<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Kpis extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function getHistorialLecturas($id, $fi = false, $ff = false)
    {
        if ($fi) {
            $this->db->where('fecha >=', $fi);
        }

        if ($ff) {
            $this->db->where('fecha <', $ff);
        }

        $this->db->where('id_equipo', $id);
        $this->db->order_by('fecha', 'asc');
        return $this->db->get('historial_lecturas')->result();
    }

    public function getEquipos($id = false)
    {

        $empId = 6;#empresa();

        $this->db->select('equipos.id_equipo, meta_disponibilidad as meta_dsp');
        $this->db->from('equipos');
        #$this->db->where("(estado = 'AC' or estado ='RE')");
        $this->db->where('estado!=', 'AL');
        $this->db->where('equipos.id_empresa', $empId);

        if ($id) {
            $this->db->where('equipos.id_equipo', $id);
        }

        $this->db->order_by('equipos.id_equipo', 'ASC');

        return $this->db->get()->result();
    }

    public function estadoEquipoAlta($eq, $fecha)
    {
        $his = $this->getHistorialLecturas($eq);

        if (!$his) {
            return $fecha;
        }

        $fechaAlta = $his[0]->fecha;

        $f1 = strtotime($fechaAlta);
        $f2 = strtotime($fecha);

        return (date('m', $f1) == date('m', $f2) && $f1 > $f2) ? $fechaAlta : $fecha;
    }

    public function estadoEquipoBaja($eq, $fecha)
    {
        $his = $this->getHistorialLecturas($eq);

        if (!$his ||  end($his)->estado!='IN') {
            return $fecha;
        }

        $fechaBaja = end($his)->fecha;

        $f1 = strtotime($fechaBaja);
        $f2 = strtotime($fecha);

        return (date('m', $f1) == date('m', $f2) && $f1 < $f2) ? $fechaBaja : $fecha;
    }
}
